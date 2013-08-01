// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: efu_niu_ctl.v
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
module efu_niu_ctl (
  tcu_dbr_gateoff, 
  efu_niu_mac01_sfro_data, 
  efu_niu_mac1_sf_xfer_en, 
  efu_niu_mac1_sf_clr, 
  efu_niu_mac1_ro_xfer_en, 
  efu_niu_mac1_ro_clr, 
  efu_niu_mac0_sf_xfer_en, 
  efu_niu_mac0_sf_clr, 
  efu_niu_mac0_ro_xfer_en, 
  efu_niu_mac0_ro_clr, 
  efu_niu_ipp1_xfer_en, 
  efu_niu_ipp1_clr, 
  efu_niu_ipp0_xfer_en, 
  efu_niu_ipp0_clr, 
  efu_niu_cfifo_data, 
  efu_niu_cfifo0_xfer_en, 
  efu_niu_cfifo1_xfer_en, 
  efu_niu_cfifo1_clr, 
  efu_niu_cfifo0_clr, 
  efu_niu_ram_data, 
  efu_niu_ram_xfer_en, 
  efu_niu_ram_clr, 
  niu_efu_ram_xfer_en, 
  niu_efu_ram_data, 
  efu_niu_ram0_clr, 
  efu_niu_ram0_xfer_en, 
  niu_efu_ram0_xfer_en, 
  niu_efu_ram0_data, 
  efu_niu_ram1_clr, 
  efu_niu_ram1_xfer_en, 
  niu_efu_ram1_xfer_en, 
  niu_efu_ram1_data, 
  efu_niu_4k_data, 
  efu_niu_4k_xfer_en, 
  efu_niu_4k_clr, 
  niu_efu_4k_xfer_en, 
  niu_efu_4k_data, 
  cmp_io_sync_en, 
  io_cmp_sync_en, 
  niu_efu_mac1_sf_xfer_en, 
  niu_efu_mac1_sf_data, 
  niu_efu_mac0_sf_xfer_en, 
  niu_efu_mac0_sf_data, 
  niu_efu_mac1_ro_xfer_en, 
  niu_efu_mac1_ro_data, 
  niu_efu_mac0_ro_xfer_en, 
  niu_efu_mac0_ro_data, 
  niu_efu_ipp1_xfer_en, 
  niu_efu_ipp1_data, 
  niu_efu_ipp0_xfer_en, 
  niu_efu_ipp0_data, 
  niu_efu_cfifo0_xfer_en, 
  niu_efu_cfifo0_data, 
  niu_efu_cfifo1_xfer_en, 
  niu_efu_cfifo1_data, 
  efu_spc0_fuse_iclr, 
  efu_spc1_fuse_iclr, 
  efu_spc2_fuse_iclr, 
  efu_spc3_fuse_iclr, 
  efu_spc4_fuse_iclr, 
  efu_spc5_fuse_iclr, 
  efu_spc6_fuse_iclr, 
  efu_spc7_fuse_iclr, 
  efu_spc0_fuse_dclr, 
  efu_spc1_fuse_dclr, 
  efu_spc2_fuse_dclr, 
  efu_spc3_fuse_dclr, 
  efu_spc4_fuse_dclr, 
  efu_spc5_fuse_dclr, 
  efu_spc6_fuse_dclr, 
  efu_spc7_fuse_dclr, 
  efu_l2t0_fuse_clr, 
  efu_l2t1_fuse_clr, 
  efu_l2t2_fuse_clr, 
  efu_l2t3_fuse_clr, 
  efu_l2t4_fuse_clr, 
  efu_l2t5_fuse_clr, 
  efu_l2t6_fuse_clr, 
  efu_l2t7_fuse_clr, 
  efu_l2b0_fuse_clr, 
  efu_l2b1_fuse_clr, 
  efu_l2b2_fuse_clr, 
  efu_l2b3_fuse_clr, 
  efu_l2b4_fuse_clr, 
  efu_l2b5_fuse_clr, 
  efu_l2b6_fuse_clr, 
  efu_l2b7_fuse_clr, 
  efu_dmu_data, 
  efu_dmu_xfer_en, 
  efu_dmu_clr, 
  dmu_efu_xfer_en, 
  dmu_efu_data, 
  efu_mcu_fdi, 
  mcu_efu_fdo, 
  efu_mcu_fclk, 
  efu_mcu_fclrz, 
  efu_psr_fdi, 
  psr_efu_fdo, 
  efu_psr_fclk, 
  efu_psr_fclrz, 
  efu_niu_fdi, 
  niu_efu_fdo, 
  efu_niu_fclk, 
  efu_niu_fclrz, 
  read_data_ff, 
  read_data_ff_vld, 
  tcu_red_reg_clr, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  scan_in, 
  scan_out, 
  iol2clk, 
  l2clk, 
  niu_read_data_shift, 
  load_niu_read_data);
wire pce_ov;
wire siclk;
wire soclk;
wire stop;
wire se;
wire l1clk;
wire l1clk_cmp;
wire ff_mcu_fdo_scanin;
wire ff_mcu_fdo_scanout;
wire mcu_fdo_fck;
wire serdes_rd_en_d;
wire ff_psr_fdo_scanin;
wire ff_psr_fdo_scanout;
wire psr_fdo_fck;
wire ff_niu_fdo_scanin;
wire ff_niu_fdo_scanout;
wire niu_fdo_fck;
wire serdes_fdo;
wire [5:0] block_id_vld;
wire niu_shift_in;
wire read_data_xfer_en;
wire efu_xfer_en;
wire serdes;
wire cntz;
wire load_niu_read_data_d;
wire read_data_xfer_en_r1;
wire capture_serdes_d;
wire ff_capture_serdes_scanin;
wire ff_capture_serdes_scanout;
wire capture_serdes_d1;
wire capture_serdes;
wire ff_serdes_rd_en_scanin;
wire ff_serdes_rd_en_scanout;
wire serdes_rd_en;
wire ff_niu_shift_scanin;
wire ff_niu_shift_scanout;
wire niu_shift;
wire ff_load_niu_read_data_scanin;
wire ff_load_niu_read_data_scanout;
wire ff_read_data_in_r2_scanin;
wire ff_read_data_in_r2_scanout;
wire read_data_xfer_en_r2;
wire ff_read_data_in_r1_scanin;
wire ff_read_data_in_r1_scanout;
wire ff_read_data_in_scanin;
wire ff_read_data_in_scanout;
wire read_data_xfer_en_reg;
wire [31:0] shift_data_ff_in;
wire pulse_read_data_ff_vld_r1;
wire [31:0] read_data_ff_sync;
wire [31:0] serdes_data_shift;
wire [31:0] serdes_data_shift_in;
wire ff_read_data_ff_vld_scanin;
wire ff_read_data_ff_vld_scanout;
wire read_data_ff_vld_r1;
wire ff_read_data_ff_vld_1_scanin;
wire ff_read_data_ff_vld_1_scanout;
wire read_data_ff_vld_r2;
wire pulse_read_data_ff_vld;
wire ff_pulse_read_data_ff_vld_scanin;
wire ff_pulse_read_data_ff_vld_scanout;
wire ff_pulse_read_data_ff_vld_1_scanin;
wire ff_pulse_read_data_ff_vld_1_scanout;
wire pulse_read_data_ff_vld_r2;
wire ff_read_data_ff_sync_scanin;
wire ff_read_data_ff_sync_scanout;
wire ff_read_data_ff_shift_scanin;
wire ff_read_data_ff_shift_scanout;
wire ff_serdes_data_shift_scanin;
wire ff_serdes_data_shift_scanout;
wire [3:0] sub_block_id;
wire computed_parity;
wire good_parity;
wire vld_en_nxt;
wire efu_niu_1k_dec;
wire efu_niu_mac1_sf_xfer_en_in;
wire efu_niu_mac1_ro_xfer_en_in;
wire efu_niu_mac0_sf_xfer_en_in;
wire efu_niu_mac0_ro_xfer_en_in;
wire efu_niu_ipp0_xfer_en_in;
wire efu_niu_ipp1_xfer_en_in;
wire efu_niu_512_dec;
wire efu_niu_cfifo0_xfer_en_in;
wire efu_niu_cfifo1_xfer_en_in;
wire efu_niu_ram0_xfer_en_in;
wire efu_niu_ram1_xfer_en_in;
wire efu_niu_4k_dec;
wire efu_niu_4k_xfer_en_in;
wire efu_niu_256_dec;
wire efu_niu_ram_xfer_en_in;
wire [6:0] cnt_data;
wire pulse_vld_en_nxt;
wire vld_en;
wire efu_niu_mac1_sf_xfer_en_q;
wire efu_niu_mac1_ro_xfer_en_q;
wire efu_niu_mac0_sf_xfer_en_q;
wire efu_niu_mac0_ro_xfer_en_q;
wire efu_niu_ipp0_xfer_en_q;
wire efu_niu_ipp1_xfer_en_q;
wire efu_niu_cfifo0_xfer_en_q;
wire efu_niu_cfifo1_xfer_en_q;
wire efu_niu_ram0_xfer_en_q;
wire efu_niu_ram1_xfer_en_q;
wire efu_niu_4k_xfer_en_q;
wire efu_niu_ram_xfer_en_q;
wire efu_dmu_xfer_en_q;
wire efu_niu_fclrz_q;
wire efu_psr_fclrz_q;
wire efu_mcu_fclrz_q;
wire efu_dmu_clr_q;
wire ff_mac1_sf_xfer_en_scanin;
wire ff_mac1_sf_xfer_en_scanout;
wire ff_mac1_ro_xfer_en_scanin;
wire ff_mac1_ro_xfer_en_scanout;
wire ff_mac0_sf_xfer_en_scanin;
wire ff_mac0_sf_xfer_en_scanout;
wire ff_mac0_ro_xfer_en_scanin;
wire ff_mac0_ro_xfer_en_scanout;
wire ff_ipp0_xfer_en_scanin;
wire ff_ipp0_xfer_en_scanout;
wire ff_ipp1_xfer_en_scanin;
wire ff_ipp1_xfer_en_scanout;
wire ff_cfifo0_xfer_en_scanin;
wire ff_cfifo0_xfer_en_scanout;
wire ff_cfifo1_xfer_en_scanin;
wire ff_cfifo1_xfer_en_scanout;
wire ff_ram0_xfer_en_scanin;
wire ff_ram0_xfer_en_scanout;
wire ff_ram1_xfer_en_scanin;
wire ff_ram1_xfer_en_scanout;
wire ff_4k_xfer_en_scanin;
wire ff_4k_xfer_en_scanout;
wire ff_ram_xfer_en_scanin;
wire ff_ram_xfer_en_scanout;
wire ff_cnt_scanin;
wire ff_cnt_scanout;
wire ff_psrclk_scanin;
wire ff_psrclk_scanout;
wire psrcntclk;
wire ff_mcuclk_scanin;
wire ff_mcuclk_scanout;
wire mcucntclk;
wire ff_niuclk_scanin;
wire ff_niuclk_scanout;
wire niucntclk;
wire ff_cmp_io_sync_en_scanin;
wire ff_cmp_io_sync_en_scanout;
wire cmp_io_sync_en_r1;
wire ff_io_cmp_sync_en_scanin;
wire ff_io_cmp_sync_en_scanout;
wire io_cmp_sync_en_r1;
wire tcu_red_reg_clr_reg0_scanin;
wire tcu_red_reg_clr_reg0_scanout;
wire [6:0] tcu_red_reg_clr_ff;
wire tcu_red_reg_clr_reg1_scanin;
wire tcu_red_reg_clr_reg1_scanout;
wire tcu_red_reg_clr_reg2_scanin;
wire tcu_red_reg_clr_reg2_scanout;
wire tcu_red_reg_clr_reg3_scanin;
wire tcu_red_reg_clr_reg3_scanout;
wire tcu_red_reg_clr_reg4_scanin;
wire tcu_red_reg_clr_reg4_scanout;
wire tcu_red_reg_clr_reg5_scanin;
wire tcu_red_reg_clr_reg5_scanout;
wire tcu_red_reg_clr_reg6_scanin;
wire tcu_red_reg_clr_reg6_scanout;
wire spares_scanin;
wire spares_scanout;
wire clear_all;
wire efu_spc0_fuse_iclr_in;
wire efu_spc0_fuse_dclr_in;
wire efu_spc1_fuse_iclr_in;
wire efu_spc1_fuse_dclr_in;
wire efu_spc2_fuse_iclr_in;
wire efu_spc2_fuse_dclr_in;
wire efu_spc3_fuse_iclr_in;
wire efu_spc3_fuse_dclr_in;
wire efu_spc4_fuse_iclr_in;
wire efu_spc4_fuse_dclr_in;
wire efu_spc5_fuse_iclr_in;
wire efu_spc5_fuse_dclr_in;
wire efu_spc6_fuse_iclr_in;
wire efu_spc6_fuse_dclr_in;
wire efu_spc7_fuse_iclr_in;
wire efu_spc7_fuse_dclr_in;
wire efu_l2t0_fuse_clr_in;
wire efu_l2t1_fuse_clr_in;
wire efu_l2t2_fuse_clr_in;
wire efu_l2t3_fuse_clr_in;
wire efu_l2t4_fuse_clr_in;
wire efu_l2t5_fuse_clr_in;
wire efu_l2t6_fuse_clr_in;
wire efu_l2t7_fuse_clr_in;
wire efu_l2b0_fuse_clr_in;
wire efu_l2b1_fuse_clr_in;
wire efu_l2b2_fuse_clr_in;
wire efu_l2b3_fuse_clr_in;
wire efu_l2b4_fuse_clr_in;
wire efu_l2b5_fuse_clr_in;
wire efu_l2b6_fuse_clr_in;
wire efu_l2b7_fuse_clr_in;
wire efu_dmu_clr_in;
wire efu_dmu_xfer_en_in;
wire efu_mcu_fclrz_in;
wire efu_psr_fclrz_in;
wire efu_niu_fclrz_in;
wire ff_vld_en_scanin;
wire ff_vld_en_scanout;
wire ff_dmu_xfer_en_scanin;
wire ff_dmu_xfer_en_scanout;
wire ff_niu_fclrz_scanin;
wire ff_niu_fclrz_scanout;
wire ff_psr_fclrz_scanin;
wire ff_psr_fclrz_scanout;
wire ff_mcu_fclrz_scanin;
wire ff_mcu_fclrz_scanout;
wire ff_dmu_clr_scanin;
wire ff_dmu_clr_scanout;
wire clr_spc0_iclr_scanin;
wire clr_spc0_iclr_scanout;
wire clr_spc1_iclr_scanin;
wire clr_spc1_iclr_scanout;
wire clr_spc2_iclr_scanin;
wire clr_spc2_iclr_scanout;
wire clr_spc3_iclr_scanin;
wire clr_spc3_iclr_scanout;
wire clr_spc4_iclr_scanin;
wire clr_spc4_iclr_scanout;
wire clr_spc5_iclr_scanin;
wire clr_spc5_iclr_scanout;
wire clr_spc6_iclr_scanin;
wire clr_spc6_iclr_scanout;
wire clr_spc7_iclr_scanin;
wire clr_spc7_iclr_scanout;
wire clr_spc0_dclr_scanin;
wire clr_spc0_dclr_scanout;
wire clr_spc1_dclr_scanin;
wire clr_spc1_dclr_scanout;
wire clr_spc2_dclr_scanin;
wire clr_spc2_dclr_scanout;
wire clr_spc3_dclr_scanin;
wire clr_spc3_dclr_scanout;
wire clr_spc4_dclr_scanin;
wire clr_spc4_dclr_scanout;
wire clr_spc5_dclr_scanin;
wire clr_spc5_dclr_scanout;
wire clr_spc6_dclr_scanin;
wire clr_spc6_dclr_scanout;
wire clr_spc7_dclr_scanin;
wire clr_spc7_dclr_scanout;
wire l2t0_fuse_clr_scanin;
wire l2t0_fuse_clr_scanout;
wire l2t1_fuse_clr_scanin;
wire l2t1_fuse_clr_scanout;
wire l2t2_fuse_clr_scanin;
wire l2t2_fuse_clr_scanout;
wire l2t3_fuse_clr_scanin;
wire l2t3_fuse_clr_scanout;
wire l2t4_fuse_clr_scanin;
wire l2t4_fuse_clr_scanout;
wire l2t5_fuse_clr_scanin;
wire l2t5_fuse_clr_scanout;
wire l2t6_fuse_clr_scanin;
wire l2t6_fuse_clr_scanout;
wire l2t7_fuse_clr_scanin;
wire l2t7_fuse_clr_scanout;
wire l2b0_fuse_clr_scanin;
wire l2b0_fuse_clr_scanout;
wire l2b1_fuse_clr_scanin;
wire l2b1_fuse_clr_scanout;
wire l2b2_fuse_clr_scanin;
wire l2b2_fuse_clr_scanout;
wire l2b3_fuse_clr_scanin;
wire l2b3_fuse_clr_scanout;
wire l2b4_fuse_clr_scanin;
wire l2b4_fuse_clr_scanout;
wire l2b5_fuse_clr_scanin;
wire l2b5_fuse_clr_scanout;
wire l2b6_fuse_clr_scanin;
wire l2b6_fuse_clr_scanout;
wire l2b7_fuse_clr_scanin;
wire l2b7_fuse_clr_scanout;



input tcu_dbr_gateoff;

output  efu_niu_mac01_sfro_data;
output  efu_niu_mac1_sf_xfer_en;
output 	efu_niu_mac1_sf_clr;

output  efu_niu_mac1_ro_xfer_en;
output 	efu_niu_mac1_ro_clr;

output  efu_niu_mac0_sf_xfer_en;
output  efu_niu_mac0_sf_clr;

output  efu_niu_mac0_ro_xfer_en;
output  efu_niu_mac0_ro_clr;

output  efu_niu_ipp1_xfer_en;
output  efu_niu_ipp1_clr;

output  efu_niu_ipp0_xfer_en;
output  efu_niu_ipp0_clr;

output  efu_niu_cfifo_data;
output  efu_niu_cfifo0_xfer_en;
output  efu_niu_cfifo1_xfer_en;
output 	efu_niu_cfifo1_clr;
output 	efu_niu_cfifo0_clr;

output  efu_niu_ram_data;
output  efu_niu_ram_xfer_en;
output  efu_niu_ram_clr;
input   niu_efu_ram_xfer_en;
input   niu_efu_ram_data;

output 	efu_niu_ram0_clr;
output  efu_niu_ram0_xfer_en;
input   niu_efu_ram0_xfer_en;
input   niu_efu_ram0_data;

output 	efu_niu_ram1_clr;
output  efu_niu_ram1_xfer_en;
input   niu_efu_ram1_xfer_en;
input   niu_efu_ram1_data;


output  efu_niu_4k_data;
output  efu_niu_4k_xfer_en;
output 	efu_niu_4k_clr;
input   niu_efu_4k_xfer_en;
input   niu_efu_4k_data ;

input   cmp_io_sync_en;
input	io_cmp_sync_en;

// readback
input   niu_efu_mac1_sf_xfer_en;
input   niu_efu_mac1_sf_data;

input   niu_efu_mac0_sf_xfer_en;
input   niu_efu_mac0_sf_data;

input   niu_efu_mac1_ro_xfer_en;
input   niu_efu_mac1_ro_data;

input   niu_efu_mac0_ro_xfer_en;
input   niu_efu_mac0_ro_data;

input   niu_efu_ipp1_xfer_en;
input   niu_efu_ipp1_data;

input   niu_efu_ipp0_xfer_en;
input   niu_efu_ipp0_data;
        
input   niu_efu_cfifo0_xfer_en;
input   niu_efu_cfifo0_data;

input   niu_efu_cfifo1_xfer_en;
input   niu_efu_cfifo1_data;
        


        

// Clear
output          efu_spc0_fuse_iclr;
output          efu_spc1_fuse_iclr;
output          efu_spc2_fuse_iclr;
output          efu_spc3_fuse_iclr;
output          efu_spc4_fuse_iclr;
output          efu_spc5_fuse_iclr;
output          efu_spc6_fuse_iclr;
output          efu_spc7_fuse_iclr;

output          efu_spc0_fuse_dclr;
output          efu_spc1_fuse_dclr;
output          efu_spc2_fuse_dclr;
output          efu_spc3_fuse_dclr;
output          efu_spc4_fuse_dclr;
output          efu_spc5_fuse_dclr;
output          efu_spc6_fuse_dclr;
output          efu_spc7_fuse_dclr;

output          efu_l2t0_fuse_clr;
output          efu_l2t1_fuse_clr;
output          efu_l2t2_fuse_clr;
output          efu_l2t3_fuse_clr;
output          efu_l2t4_fuse_clr;
output          efu_l2t5_fuse_clr;
output          efu_l2t6_fuse_clr;
output          efu_l2t7_fuse_clr;
output          efu_l2b0_fuse_clr;
output          efu_l2b1_fuse_clr;
output          efu_l2b2_fuse_clr;
output          efu_l2b3_fuse_clr;
output          efu_l2b4_fuse_clr;
output          efu_l2b5_fuse_clr;
output          efu_l2b6_fuse_clr;
output          efu_l2b7_fuse_clr;

output  	efu_dmu_data;
output  	efu_dmu_xfer_en;
output  	efu_dmu_clr;
input   	dmu_efu_xfer_en;
input   	dmu_efu_data;


output          efu_mcu_fdi;
input           mcu_efu_fdo;
output          efu_mcu_fclk;
output          efu_mcu_fclrz;

output          efu_psr_fdi;
input           psr_efu_fdo;
output          efu_psr_fclk;
output          efu_psr_fclrz;

output          efu_niu_fdi;
input           niu_efu_fdo;
output          efu_niu_fclk;
output          efu_niu_fclrz;



input	[31:0]	read_data_ff;
input		read_data_ff_vld;
input	[6:0]	tcu_red_reg_clr;
input           tcu_pce_ov;
input           tcu_clk_stop;
input           tcu_aclk;
input           tcu_bclk;
input           tcu_scan_en;
input           scan_in;
output          scan_out;

input           iol2clk;
input           l2clk;

output	[31:0]	niu_read_data_shift;
output		load_niu_read_data;
 
wire [6:0] cnt_nxt;
wire [6:0] cnt;

assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign stop = tcu_clk_stop;
assign se = tcu_scan_en;

assign  efu_niu_mac01_sfro_data = niu_read_data_shift[21];
assign  efu_niu_cfifo_data      = niu_read_data_shift[21];
assign  efu_niu_ram_data        = niu_read_data_shift[21];
assign  efu_niu_4k_data         = niu_read_data_shift[21];
assign  efu_mcu_fdi             = niu_read_data_shift[21];
assign  efu_psr_fdi             = niu_read_data_shift[21];
assign  efu_niu_fdi             = niu_read_data_shift[21];
assign  efu_dmu_data            = niu_read_data_shift[21];




efu_niu_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk(iol2clk),
        .l1en (1'b1 ),
        .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

efu_niu_ctl_l1clkhdr_ctl_macro clkgen_cmp (
        .l2clk(l2clk),
        .l1en (1'b1 ),
        .l1clk(l1clk_cmp),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

//-----------------------------------------------------------------------------
//  reading in
//-----------------------------------------------------------------------------
efu_niu_ctl_msff_ctl_macro__en_1__width_1	ff_mcu_fdo	 
	(
        .scan_in(ff_mcu_fdo_scanin),
	.scan_out(ff_mcu_fdo_scanout),
	.dout	(mcu_fdo_fck),
	.din	(mcu_efu_fdo),
        .en     (serdes_rd_en_d),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
efu_niu_ctl_msff_ctl_macro__en_1__width_1	ff_psr_fdo	 
	(
        .scan_in(ff_psr_fdo_scanin),
	.scan_out(ff_psr_fdo_scanout),
	.dout	(psr_fdo_fck),
	.din	(psr_efu_fdo),
        .en     (serdes_rd_en_d),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
efu_niu_ctl_msff_ctl_macro__en_1__width_1	ff_niu_fdo	 
	(
        .scan_in(ff_niu_fdo_scanin),
	.scan_out(ff_niu_fdo_scanout),
	.dout	(niu_fdo_fck),
	.din	(niu_efu_fdo),
        .en     (serdes_rd_en_d),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
assign serdes_fdo = (mcu_fdo_fck		 & (block_id_vld[5:0] == 6'b101010) ) 
                  | (psr_fdo_fck		 & (block_id_vld[5:0] == 6'b101001) )
                  | (niu_fdo_fck		 & (block_id_vld[5:0] == 6'b101011) );

assign  niu_shift_in = 1'b0
               | (dmu_efu_data           & dmu_efu_xfer_en)
	       | (niu_efu_mac1_sf_data 	 & niu_efu_mac1_sf_xfer_en)
	       | (niu_efu_mac1_ro_data   & niu_efu_mac1_ro_xfer_en)
	       | (niu_efu_mac0_sf_data   & niu_efu_mac0_sf_xfer_en)
	       | (niu_efu_mac0_ro_data   & niu_efu_mac0_ro_xfer_en)
	       | (niu_efu_ipp1_data  	 & niu_efu_ipp1_xfer_en)
	       | (niu_efu_ipp0_data  	 & niu_efu_ipp0_xfer_en)
	       | (niu_efu_cfifo0_data  	 & niu_efu_cfifo0_xfer_en)
	       | (niu_efu_cfifo1_data  	 & niu_efu_cfifo1_xfer_en)
	       | (niu_efu_ram_data  	 & niu_efu_ram_xfer_en)
	       | (niu_efu_ram0_data  	 & niu_efu_ram0_xfer_en)
	       | (niu_efu_ram1_data  	 & niu_efu_ram1_xfer_en)
               | (niu_efu_4k_data        & niu_efu_4k_xfer_en) ;

assign read_data_xfer_en = dmu_efu_xfer_en | niu_efu_mac1_sf_xfer_en | 
                      niu_efu_mac1_ro_xfer_en | niu_efu_mac0_sf_xfer_en | 
                      niu_efu_mac0_ro_xfer_en | niu_efu_ipp1_xfer_en | 
                      niu_efu_ipp0_xfer_en | niu_efu_cfifo0_xfer_en | 
                      niu_efu_cfifo1_xfer_en | niu_efu_ram_xfer_en | 
                      niu_efu_ram0_xfer_en | niu_efu_ram1_xfer_en  | 
                      niu_efu_4k_xfer_en ;

assign efu_xfer_en = efu_dmu_xfer_en | efu_niu_mac1_sf_xfer_en |
                      efu_niu_mac1_ro_xfer_en | efu_niu_mac0_sf_xfer_en |
                      efu_niu_mac0_ro_xfer_en | efu_niu_ipp1_xfer_en |
                      efu_niu_ipp0_xfer_en | efu_niu_cfifo0_xfer_en |
                      efu_niu_cfifo1_xfer_en | efu_niu_ram_xfer_en |
                      efu_niu_ram0_xfer_en | efu_niu_ram1_xfer_en |
                      efu_niu_4k_xfer_en | serdes & ~cntz ;

// trailing edge detect
assign load_niu_read_data_d = ~read_data_xfer_en & read_data_xfer_en_r1 ;
assign capture_serdes_d     = serdes & cnt[6:0] == 7'b0000001;
assign   serdes_rd_en_d     = serdes & ~cnt[1] & cnt[0] ;

efu_niu_ctl_msff_ctl_macro__width_2	ff_capture_serdes	
	(
        .scan_in(ff_capture_serdes_scanin),
	.scan_out(ff_capture_serdes_scanout),
	.dout	({capture_serdes_d1, capture_serdes}),
	.din	({capture_serdes_d,capture_serdes_d1}),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
efu_niu_ctl_msff_ctl_macro__width_1	ff_serdes_rd_en	
	(
        .scan_in(ff_serdes_rd_en_scanin),
	.scan_out(ff_serdes_rd_en_scanout),
	.dout	(serdes_rd_en),
	.din	(serdes_rd_en_d),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
efu_niu_ctl_msff_ctl_macro__width_1	ff_niu_shift	
	(
        .scan_in(ff_niu_shift_scanin),
	.scan_out(ff_niu_shift_scanout),
	.dout	(niu_shift),
	.din	(niu_shift_in),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
efu_niu_ctl_msff_ctl_macro__width_1	ff_load_niu_read_data	
	(
        .scan_in(ff_load_niu_read_data_scanin),
	.scan_out(ff_load_niu_read_data_scanout),
	.dout	(load_niu_read_data),
	.din	(load_niu_read_data_d | capture_serdes),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
// xfer back from destinations
efu_niu_ctl_msff_ctl_macro__width_1	ff_read_data_in_r2	
	(
        .scan_in(ff_read_data_in_r2_scanin),
	.scan_out(ff_read_data_in_r2_scanout),
	.dout	(read_data_xfer_en_r2),
	.din	(read_data_xfer_en_r1),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

efu_niu_ctl_msff_ctl_macro__width_1	ff_read_data_in_r1	
	(
        .scan_in(ff_read_data_in_r1_scanin),
	.scan_out(ff_read_data_in_r1_scanout),
	.dout	(read_data_xfer_en_r1),
	.din	(read_data_xfer_en),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

efu_niu_ctl_msff_ctl_macro__width_1	ff_read_data_in	    
	(
        .scan_in(ff_read_data_in_scanin),
	.scan_out(ff_read_data_in_scanout),
	.dout	(read_data_xfer_en_reg),
	.din	(read_data_xfer_en),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

//                            : serdes ? {niu_read_data_shift[31:22],niu_read_data_shift[20:0],serdes_fdo}
assign shift_data_ff_in[31:0] = pulse_read_data_ff_vld_r1 ? read_data_ff_sync[31:0]
                              : efu_xfer_en ? {niu_read_data_shift[31:22],niu_read_data_shift[20:0],1'b0}
                              : read_data_xfer_en_reg ? {niu_read_data_shift[31:22],niu_read_data_shift[20:0],niu_shift}
                              : capture_serdes ? serdes_data_shift[31:0]
                              : niu_read_data_shift[31:0];
assign serdes_data_shift_in[31:0]   = pulse_read_data_ff_vld_r1 ? read_data_ff_sync[31:0] :
                                    {serdes_data_shift[31:22], serdes_data_shift[20:0], serdes_fdo} ;
//-----------------------------------------------------------------------------
//  single pulse decode valid
//-----------------------------------------------------------------------------
efu_niu_ctl_msff_ctl_macro__width_1	ff_read_data_ff_vld 
	(
	.scan_in  (ff_read_data_ff_vld_scanin),
	.scan_out (ff_read_data_ff_vld_scanout),
	.din	  (read_data_ff_vld),
	.dout	  (read_data_ff_vld_r1),
	.l1clk	  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
efu_niu_ctl_msff_ctl_macro__width_1	ff_read_data_ff_vld_1 
	(
	.scan_in  (ff_read_data_ff_vld_1_scanin),
	.scan_out (ff_read_data_ff_vld_1_scanout),
	.din	  (read_data_ff_vld_r1),
	.dout	  (read_data_ff_vld_r2),
	.l1clk	  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

assign pulse_read_data_ff_vld = read_data_ff_vld_r1 & ~read_data_ff_vld_r2 ;

efu_niu_ctl_msff_ctl_macro__width_1	ff_pulse_read_data_ff_vld 
	(
	.scan_in  (ff_pulse_read_data_ff_vld_scanin),
	.scan_out (ff_pulse_read_data_ff_vld_scanout),
	.din	  (pulse_read_data_ff_vld),
	.dout	  (pulse_read_data_ff_vld_r1),
	.l1clk	  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
efu_niu_ctl_msff_ctl_macro__width_1	ff_pulse_read_data_ff_vld_r1 
	(
	.scan_in  (ff_pulse_read_data_ff_vld_1_scanin),
	.scan_out (ff_pulse_read_data_ff_vld_1_scanout),
	.din	  (pulse_read_data_ff_vld_r1),
	.dout	  (pulse_read_data_ff_vld_r2),
	.l1clk	  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

// data from efa ; static after rising edge of valid
efu_niu_ctl_msff_ctl_macro__en_1__width_32  ff_read_data_ff_sync   
        (
        .scan_in(ff_read_data_ff_sync_scanin),
        .scan_out(ff_read_data_ff_sync_scanout),
        .din    (read_data_ff[31:0]),
        .dout   (read_data_ff_sync[31:0]),
        .en	(pulse_read_data_ff_vld),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_32  ff_shift_data_ff_sync    
        (
        .scan_in(ff_read_data_ff_shift_scanin),
        .scan_out(ff_read_data_ff_shift_scanout),
        .din    (shift_data_ff_in[31:0]),
        .dout   (niu_read_data_shift[31:0]),
        .en     (~serdes | ((serdes & pulse_read_data_ff_vld_r1) | (serdes_rd_en_d & cnt[6:2] != 5'b00000) | capture_serdes)),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );
efu_niu_ctl_msff_ctl_macro__en_1__width_32  ff_serdes_data_shift   
        (
        .scan_in(ff_serdes_data_shift_scanin),
        .scan_out(ff_serdes_data_shift_scanout),
        .dout   (serdes_data_shift[31:0]),
        .din    (serdes_data_shift_in[31:0]),
        .en     (serdes_rd_en),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

wire [2:0] valid_bits;
assign valid_bits[2:0]   = read_data_ff_sync[31:29];
assign block_id_vld[5:0] = read_data_ff_sync[27:22];
assign sub_block_id[3:0] = read_data_ff_sync[18:15];

wire	   decode_enable_vld;

reg	valid, val_err;

always @(valid_bits)
  case (valid_bits) //synopsys parallel_case full_case
    3'b000: {valid, val_err} = 2'b00;
    3'b001: {valid, val_err} = 2'b01;
    3'b010: {valid, val_err} = 2'b01;
    3'b100: {valid, val_err} = 2'b01;
    3'b011: {valid, val_err} = 2'b10;
    3'b101: {valid, val_err} = 2'b10;
    3'b110: {valid, val_err} = 2'b10;
    3'b111: {valid, val_err} = 2'b10;
  endcase

assign computed_parity = ^read_data_ff_sync[28:0];
assign good_parity = ~computed_parity;

assign decode_enable_vld = valid & ~val_err & good_parity ;
assign cntz          = (cnt[6:0] == 7'b0) ;
assign vld_en_nxt    = pulse_read_data_ff_vld_r1 & decode_enable_vld | decode_enable_vld & ~cntz ;


//NIU SRAM0 1024x152 instances
assign  efu_niu_1k_dec              = (block_id_vld[5:0] == 6'b100101) & decode_enable_vld;
assign  efu_niu_mac1_sf_xfer_en_in  = (sub_block_id[3:0] == 4'h0) & efu_niu_1k_dec & vld_en_nxt;
assign  efu_niu_mac1_ro_xfer_en_in  = (sub_block_id[3:0] == 4'h1) & efu_niu_1k_dec & vld_en_nxt;
assign  efu_niu_mac0_sf_xfer_en_in  = (sub_block_id[3:0] == 4'h2) & efu_niu_1k_dec & vld_en_nxt;
assign  efu_niu_mac0_ro_xfer_en_in  = (sub_block_id[3:0] == 4'h3) & efu_niu_1k_dec & vld_en_nxt;
assign  efu_niu_ipp0_xfer_en_in     = (sub_block_id[3:0] == 4'h4) & efu_niu_1k_dec & vld_en_nxt;
assign  efu_niu_ipp1_xfer_en_in     = (sub_block_id[3:0] == 4'h8) & efu_niu_1k_dec & vld_en_nxt;

//NIU SRAM1 512x152 instance
assign  efu_niu_512_dec             = (block_id_vld[5:0] == 6'b100110) & decode_enable_vld;
assign  efu_niu_cfifo0_xfer_en_in   = (sub_block_id[3:0] == 4'h1) & efu_niu_512_dec & vld_en_nxt;
assign  efu_niu_cfifo1_xfer_en_in   = (sub_block_id[3:0] == 4'h2) & efu_niu_512_dec & vld_en_nxt;
assign  efu_niu_ram0_xfer_en_in     = (sub_block_id[3:0] == 4'h4) & efu_niu_512_dec & vld_en_nxt;
assign  efu_niu_ram1_xfer_en_in     = (sub_block_id[3:0] == 4'h8) & efu_niu_512_dec & vld_en_nxt;

//NIU SRAM2 4kx9 instance
assign  efu_niu_4k_dec 	            = (block_id_vld[5:0] == 6'b100111) & decode_enable_vld;
assign  efu_niu_4k_xfer_en_in       = efu_niu_4k_dec & vld_en_nxt;

//NIU SRAM3 256x152 instance
assign  efu_niu_256_dec             = (block_id_vld[5:0] == 6'b101000) & decode_enable_vld;
assign  efu_niu_ram_xfer_en_in      = efu_niu_256_dec & vld_en_nxt;

//-----------------------------------------------------------------------------
//  counter to count down from 'd87 or 'd22 depending on serdes or not
//-----------------------------------------------------------------------------
assign serdes       = block_id_vld[5:0] == 6'b101001 
                    | block_id_vld[5:0] == 6'b101010 
                    | block_id_vld[5:0] == 6'b101011 ;
assign cnt_data[6:0] = serdes ? 7'b1010111 : 7'b0010101 ;
assign pulse_vld_en_nxt = vld_en_nxt & ~ vld_en;
assign cnt_nxt[6:0]  = pulse_read_data_ff_vld_r1 & pulse_vld_en_nxt ? cnt_data[6:0] : cntz ? 7'b0 : cnt[6:0] - 7'b1 ; // 87,22

assign efu_niu_mac1_sf_xfer_en = ~tcu_dbr_gateoff & efu_niu_mac1_sf_xfer_en_q;
assign efu_niu_mac1_ro_xfer_en = ~tcu_dbr_gateoff & efu_niu_mac1_ro_xfer_en_q;
assign efu_niu_mac0_sf_xfer_en = ~tcu_dbr_gateoff & efu_niu_mac0_sf_xfer_en_q;
assign efu_niu_mac0_ro_xfer_en = ~tcu_dbr_gateoff & efu_niu_mac0_ro_xfer_en_q;
assign efu_niu_ipp0_xfer_en    = ~tcu_dbr_gateoff & efu_niu_ipp0_xfer_en_q;
assign efu_niu_ipp1_xfer_en    = ~tcu_dbr_gateoff & efu_niu_ipp1_xfer_en_q;
assign efu_niu_cfifo0_xfer_en  = ~tcu_dbr_gateoff & efu_niu_cfifo0_xfer_en_q;
assign efu_niu_cfifo1_xfer_en  = ~tcu_dbr_gateoff & efu_niu_cfifo1_xfer_en_q;
assign efu_niu_ram0_xfer_en    = ~tcu_dbr_gateoff & efu_niu_ram0_xfer_en_q;
assign efu_niu_ram1_xfer_en    = ~tcu_dbr_gateoff & efu_niu_ram1_xfer_en_q;
assign efu_niu_4k_xfer_en      = ~tcu_dbr_gateoff & efu_niu_4k_xfer_en_q;
assign efu_niu_ram_xfer_en     = ~tcu_dbr_gateoff & efu_niu_ram_xfer_en_q;
assign efu_dmu_xfer_en         = ~tcu_dbr_gateoff & efu_dmu_xfer_en_q;
assign efu_niu_fclrz           = tcu_dbr_gateoff | efu_niu_fclrz_q;
assign efu_psr_fclrz           = tcu_dbr_gateoff | efu_psr_fclrz_q;
assign efu_mcu_fclrz           = tcu_dbr_gateoff | efu_mcu_fclrz_q;
assign efu_dmu_clr             = ~tcu_dbr_gateoff & efu_dmu_clr_q;


efu_niu_ctl_msff_ctl_macro__width_1  ff_mac1_sf_xfer_en 
        (
       .scan_in (ff_mac1_sf_xfer_en_scanin),
       .scan_out(ff_mac1_sf_xfer_en_scanout),
       .din     (efu_niu_mac1_sf_xfer_en_in),
       .dout    (efu_niu_mac1_sf_xfer_en_q),
       .l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

efu_niu_ctl_msff_ctl_macro__width_1  ff_mac1_ro_xfer_en 
	(
       .scan_in (ff_mac1_ro_xfer_en_scanin),
       .scan_out(ff_mac1_ro_xfer_en_scanout),
       .din     (efu_niu_mac1_ro_xfer_en_in),
       .dout	(efu_niu_mac1_ro_xfer_en_q),
       .l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

efu_niu_ctl_msff_ctl_macro__width_1  ff_mac0_sf_xfer_en 
	(
       .scan_in (ff_mac0_sf_xfer_en_scanin),
       .scan_out(ff_mac0_sf_xfer_en_scanout),
       .din     (efu_niu_mac0_sf_xfer_en_in),
       .dout	(efu_niu_mac0_sf_xfer_en_q),
       .l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

efu_niu_ctl_msff_ctl_macro__width_1  ff_mac0_ro_xfer_en 
	(
       .scan_in (ff_mac0_ro_xfer_en_scanin),
       .scan_out(ff_mac0_ro_xfer_en_scanout),
       .din     (efu_niu_mac0_ro_xfer_en_in),
       .dout	(efu_niu_mac0_ro_xfer_en_q),
       .l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

efu_niu_ctl_msff_ctl_macro__width_1  ff_ipp0_xfer_en 
	(
       .scan_in (ff_ipp0_xfer_en_scanin),
       .scan_out(ff_ipp0_xfer_en_scanout),
       .din     (efu_niu_ipp0_xfer_en_in),
       .dout	(efu_niu_ipp0_xfer_en_q),
       .l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

efu_niu_ctl_msff_ctl_macro__width_1  ff_ipp1_xfer_en 
	(
       .scan_in (ff_ipp1_xfer_en_scanin),
       .scan_out(ff_ipp1_xfer_en_scanout),
       .din     (efu_niu_ipp1_xfer_en_in),
       .dout	(efu_niu_ipp1_xfer_en_q),
       .l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

efu_niu_ctl_msff_ctl_macro__width_1  ff_cfifo0_xfer_en 
	(
       .scan_in (ff_cfifo0_xfer_en_scanin),
       .scan_out(ff_cfifo0_xfer_en_scanout),
       .din     (efu_niu_cfifo0_xfer_en_in),
       .dout	(efu_niu_cfifo0_xfer_en_q),
       .l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

efu_niu_ctl_msff_ctl_macro__width_1  ff_cfifo1_xfer_en 
	(
       .scan_in (ff_cfifo1_xfer_en_scanin),
       .scan_out(ff_cfifo1_xfer_en_scanout),
       .din     (efu_niu_cfifo1_xfer_en_in),
       .dout	(efu_niu_cfifo1_xfer_en_q),
       .l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

efu_niu_ctl_msff_ctl_macro__width_1  ff_ram0_xfer_en 
	(
       .scan_in (ff_ram0_xfer_en_scanin),
       .scan_out(ff_ram0_xfer_en_scanout),
       .din     (efu_niu_ram0_xfer_en_in),
       .dout	(efu_niu_ram0_xfer_en_q),
       .l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

efu_niu_ctl_msff_ctl_macro__width_1  ff_ram1_xfer_en 
	(
       .scan_in (ff_ram1_xfer_en_scanin),
       .scan_out(ff_ram1_xfer_en_scanout),
       .din     (efu_niu_ram1_xfer_en_in),
       .dout	(efu_niu_ram1_xfer_en_q),
       .l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

efu_niu_ctl_msff_ctl_macro__width_1  ff_4k_xfer_en 
	(
       .scan_in (ff_4k_xfer_en_scanin),
       .scan_out(ff_4k_xfer_en_scanout),
       .din     (efu_niu_4k_xfer_en_in),
       .dout	(efu_niu_4k_xfer_en_q),
       .l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

efu_niu_ctl_msff_ctl_macro__width_1  ff_ram_xfer_en 
	(
       .scan_in (ff_ram_xfer_en_scanin),
       .scan_out(ff_ram_xfer_en_scanout),
       .din     (efu_niu_ram_xfer_en_in),
       .dout	(efu_niu_ram_xfer_en_q),
       .l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

efu_niu_ctl_msff_ctl_macro__en_1__width_7	ff_cnt   
	(
	.scan_in(ff_cnt_scanin),
	.scan_out(ff_cnt_scanout),
	.dout	(cnt[6:0]),
	.din	(cnt_nxt[6:0]),
        .en     (pulse_read_data_ff_vld_r1 | vld_en),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
efu_niu_ctl_msff_ctl_macro__width_1	ff_psrclk	 
	(
        .scan_in(ff_psrclk_scanin),
	.scan_out(ff_psrclk_scanout),
	.dout	(psrcntclk),
	.din	((block_id_vld[5:0] == 6'h29) & vld_en_nxt & serdes & ((cnt[1] & ~cnt[0]) | (~cnt[1] & cnt[0]))),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
efu_niu_ctl_msff_ctl_macro__width_1	ff_mcuclk	 
	(
        .scan_in(ff_mcuclk_scanin),
	.scan_out(ff_mcuclk_scanout),
	.dout	(mcucntclk),
	.din	((block_id_vld[5:0] == 6'h2a) & vld_en_nxt & serdes & ((cnt[1] & ~cnt[0]) | (~cnt[1] & cnt[0]))),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
efu_niu_ctl_msff_ctl_macro__width_1	ff_niuclk	 
	(
        .scan_in(ff_niuclk_scanin),
	.scan_out(ff_niuclk_scanout),
	.dout	(niucntclk),
	.din	((block_id_vld[5:0] == 6'h2b) & vld_en_nxt & serdes & ((cnt[1] & ~cnt[0]) | (~cnt[1] & cnt[0]))),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
efu_niu_ctl_msff_ctl_macro__width_1	ff_cmp_io_sync_en 
	(
        .scan_in(ff_cmp_io_sync_en_scanin),
        .scan_out(ff_cmp_io_sync_en_scanout),
        .din     (cmp_io_sync_en),
        .dout	 (cmp_io_sync_en_r1),
        .l1clk	 (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__width_1  ff_io_cmp_sync_en 
	(
        .scan_in(ff_io_cmp_sync_en_scanin),
        .scan_out(ff_io_cmp_sync_en_scanout),
        .din     (io_cmp_sync_en),
        .dout	 (io_cmp_sync_en_r1),
        .l1clk	 (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

//-----------------------------------------------------------------------------
//  Redudancy register clear signal
//-----------------------------------------------------------------------------

efu_niu_ctl_msff_ctl_macro__en_1__width_1  tcu_red_reg_clr_reg0    
        (
        .scan_in(tcu_red_reg_clr_reg0_scanin),
        .scan_out(tcu_red_reg_clr_reg0_scanout),
        .din    (tcu_red_reg_clr[0]),
        .dout   (tcu_red_reg_clr_ff[0]),
        .en	(cmp_io_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  tcu_red_reg_clr_reg1   
        (
        .scan_in(tcu_red_reg_clr_reg1_scanin),
        .scan_out(tcu_red_reg_clr_reg1_scanout),
        .din    (tcu_red_reg_clr[1]),
        .dout   (tcu_red_reg_clr_ff[1]),
        .en	(cmp_io_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  tcu_red_reg_clr_reg2   
        (
        .scan_in(tcu_red_reg_clr_reg2_scanin),
        .scan_out(tcu_red_reg_clr_reg2_scanout),
        .din    (tcu_red_reg_clr[2]),
        .dout   (tcu_red_reg_clr_ff[2]),
        .en	(cmp_io_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  tcu_red_reg_clr_reg3   
        (
        .scan_in(tcu_red_reg_clr_reg3_scanin),
        .scan_out(tcu_red_reg_clr_reg3_scanout),
        .din    (tcu_red_reg_clr[3]),
        .dout   (tcu_red_reg_clr_ff[3]),
        .en	(cmp_io_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  tcu_red_reg_clr_reg4   
        (
        .scan_in(tcu_red_reg_clr_reg4_scanin),
        .scan_out(tcu_red_reg_clr_reg4_scanout),
        .din    (tcu_red_reg_clr[4]),
        .dout   (tcu_red_reg_clr_ff[4]),
        .en	(cmp_io_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  tcu_red_reg_clr_reg5   
        (
        .scan_in(tcu_red_reg_clr_reg5_scanin),
        .scan_out(tcu_red_reg_clr_reg5_scanout),
        .din    (tcu_red_reg_clr[5]),
        .dout   (tcu_red_reg_clr_ff[5]),
        .en	(cmp_io_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  tcu_red_reg_clr_reg6   
        (
        .scan_in(tcu_red_reg_clr_reg6_scanin),
        .scan_out(tcu_red_reg_clr_reg6_scanout),
        .din    (tcu_red_reg_clr[6]),
        .dout   (tcu_red_reg_clr_ff[6]),
        .en	(cmp_io_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_spare_ctl_macro__num_2 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign clear_all = &tcu_red_reg_clr_ff[6:0];

assign  efu_spc0_fuse_iclr_in = (tcu_red_reg_clr_ff[6:0] == 7'b1000000) | clear_all;
assign  efu_spc0_fuse_dclr_in = (tcu_red_reg_clr_ff[6:0] == 7'b1000001) | clear_all;
assign  efu_spc1_fuse_iclr_in = (tcu_red_reg_clr_ff[6:0] == 7'b1000010) | clear_all;
assign  efu_spc1_fuse_dclr_in = (tcu_red_reg_clr_ff[6:0] == 7'b1000011) | clear_all;
assign  efu_spc2_fuse_iclr_in = (tcu_red_reg_clr_ff[6:0] == 7'b1000100) | clear_all;
assign  efu_spc2_fuse_dclr_in = (tcu_red_reg_clr_ff[6:0] == 7'b1000101) | clear_all;
assign  efu_spc3_fuse_iclr_in = (tcu_red_reg_clr_ff[6:0] == 7'b1000110) | clear_all;
assign  efu_spc3_fuse_dclr_in = (tcu_red_reg_clr_ff[6:0] == 7'b1000111) | clear_all;
assign  efu_spc4_fuse_iclr_in = (tcu_red_reg_clr_ff[6:0] == 7'b1001000) | clear_all;
assign  efu_spc4_fuse_dclr_in = (tcu_red_reg_clr_ff[6:0] == 7'b1001001) | clear_all;
assign  efu_spc5_fuse_iclr_in = (tcu_red_reg_clr_ff[6:0] == 7'b1001010) | clear_all;
assign  efu_spc5_fuse_dclr_in = (tcu_red_reg_clr_ff[6:0] == 7'b1001011) | clear_all;
assign  efu_spc6_fuse_iclr_in = (tcu_red_reg_clr_ff[6:0] == 7'b1001100) | clear_all;
assign  efu_spc6_fuse_dclr_in = (tcu_red_reg_clr_ff[6:0] == 7'b1001101) | clear_all;
assign  efu_spc7_fuse_iclr_in = (tcu_red_reg_clr_ff[6:0] == 7'b1001110) | clear_all;
assign  efu_spc7_fuse_dclr_in = (tcu_red_reg_clr_ff[6:0] == 7'b1001111) | clear_all;

assign  efu_l2t0_fuse_clr_in  = (tcu_red_reg_clr_ff[6:0] == 7'b1010000) | clear_all;
assign  efu_l2t1_fuse_clr_in  = (tcu_red_reg_clr_ff[6:0] == 7'b1010001) | clear_all;
assign  efu_l2t2_fuse_clr_in  = (tcu_red_reg_clr_ff[6:0] == 7'b1010010) | clear_all;
assign  efu_l2t3_fuse_clr_in  = (tcu_red_reg_clr_ff[6:0] == 7'b1010011) | clear_all;
assign  efu_l2t4_fuse_clr_in  = (tcu_red_reg_clr_ff[6:0] == 7'b1010100) | clear_all;
assign  efu_l2t5_fuse_clr_in  = (tcu_red_reg_clr_ff[6:0] == 7'b1010101) | clear_all;
assign  efu_l2t6_fuse_clr_in  = (tcu_red_reg_clr_ff[6:0] == 7'b1010110) | clear_all;
assign  efu_l2t7_fuse_clr_in  = (tcu_red_reg_clr_ff[6:0] == 7'b1010111) | clear_all;
assign  efu_l2b0_fuse_clr_in  = (tcu_red_reg_clr_ff[6:0] == 7'b1011000) | clear_all;
assign  efu_l2b1_fuse_clr_in  = (tcu_red_reg_clr_ff[6:0] == 7'b1011001) | clear_all;
assign  efu_l2b2_fuse_clr_in  = (tcu_red_reg_clr_ff[6:0] == 7'b1011010) | clear_all;
assign  efu_l2b3_fuse_clr_in  = (tcu_red_reg_clr_ff[6:0] == 7'b1011011) | clear_all;
assign  efu_l2b4_fuse_clr_in  = (tcu_red_reg_clr_ff[6:0] == 7'b1011100) | clear_all;
assign  efu_l2b5_fuse_clr_in  = (tcu_red_reg_clr_ff[6:0] == 7'b1011101) | clear_all;
assign  efu_l2b6_fuse_clr_in  = (tcu_red_reg_clr_ff[6:0] == 7'b1011110) | clear_all;
assign  efu_l2b7_fuse_clr_in  = (tcu_red_reg_clr_ff[6:0] == 7'b1011111) | clear_all;


// 4kx9 instance: SRAM2
assign  efu_niu_4k_clr		= ~tcu_dbr_gateoff & ((tcu_red_reg_clr_ff[6:0] == 7'b1100000) | clear_all);

// 256x152 instance: SRAM3
assign  efu_niu_ram_clr		= ~tcu_dbr_gateoff & ((tcu_red_reg_clr_ff[6:0] == 7'b1100001) | clear_all);
assign  efu_niu_ram0_clr	= ~tcu_dbr_gateoff & ((tcu_red_reg_clr_ff[6:0] == 7'b1100010) | clear_all);
assign  efu_niu_ram1_clr	= ~tcu_dbr_gateoff & ((tcu_red_reg_clr_ff[6:0] == 7'b1100011) | clear_all);

// 8kb: 512x152 instance: SRAM1
assign  efu_niu_cfifo1_clr	= ~tcu_dbr_gateoff & ((tcu_red_reg_clr_ff[6:0] == 7'b1100100) | clear_all);
assign  efu_niu_cfifo0_clr	= ~tcu_dbr_gateoff & ((tcu_red_reg_clr_ff[6:0] == 7'b1100101) | clear_all);

// 1024x152 instances: SRAM0
assign  efu_niu_mac1_sf_clr	= ~tcu_dbr_gateoff & ((tcu_red_reg_clr_ff[6:0] == 7'b1100110) | clear_all);
assign  efu_niu_mac1_ro_clr	= ~tcu_dbr_gateoff & ((tcu_red_reg_clr_ff[6:0] == 7'b1100111) | clear_all);
assign  efu_niu_mac0_sf_clr	= ~tcu_dbr_gateoff & ((tcu_red_reg_clr_ff[6:0] == 7'b1101000) | clear_all);
assign  efu_niu_mac0_ro_clr	= ~tcu_dbr_gateoff & ((tcu_red_reg_clr_ff[6:0] == 7'b1101001) | clear_all);
assign  efu_niu_ipp1_clr	= ~tcu_dbr_gateoff & ((tcu_red_reg_clr_ff[6:0] == 7'b1101010) | clear_all);
assign  efu_niu_ipp0_clr	= ~tcu_dbr_gateoff & ((tcu_red_reg_clr_ff[6:0] == 7'b1101011) | clear_all);

// dmu instances
assign efu_dmu_clr_in		= (tcu_red_reg_clr_ff[6:0] == 7'b1101100) | clear_all;
assign efu_dmu_xfer_en_in       = (block_id_vld[5:0] == 6'b101100) && vld_en_nxt;

// mcu serdes
assign efu_mcu_fclrz_in		= (tcu_red_reg_clr_ff[6:0] == 7'b1110000) | clear_all;
assign efu_mcu_fclk             = ~tcu_dbr_gateoff & mcucntclk ;

// peu serdes
assign efu_psr_fclrz_in		= (tcu_red_reg_clr_ff[6:0] == 7'b1110001) | clear_all;
assign efu_psr_fclk             = ~tcu_dbr_gateoff & psrcntclk ;

// niu serdes
assign efu_niu_fclrz_in		= (tcu_red_reg_clr_ff[6:0] == 7'b1110010) | clear_all;
assign efu_niu_fclk             = ~tcu_dbr_gateoff & niucntclk ;

efu_niu_ctl_msff_ctl_macro__width_1	ff_vld_en   
	(
        .scan_in(ff_vld_en_scanin),
	.scan_out(ff_vld_en_scanout),
	.dout	(vld_en),
	.din	(vld_en_nxt),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
// could be a problem with cmp count
efu_niu_ctl_msff_ctl_macro__width_1	ff_dmu_xfer_en   
	(
        .scan_in(ff_dmu_xfer_en_scanin),
	.scan_out(ff_dmu_xfer_en_scanout),
	.din	(efu_dmu_xfer_en_in),
	.dout	(efu_dmu_xfer_en_q),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

efu_niu_ctl_msff_ctl_macro__en_1__width_1	ff_niu_fclrz   
	(
        .scan_in(ff_niu_fclrz_scanin),
	.scan_out(ff_niu_fclrz_scanout),
	.dout	(efu_niu_fclrz_q),
	.din	(~efu_niu_fclrz_in),
	.en	(io_cmp_sync_en_r1),
	.l1clk	(l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
	);

efu_niu_ctl_msff_ctl_macro__en_1__width_1	ff_psr_fclrz   
	(
        .scan_in(ff_psr_fclrz_scanin),
	.scan_out(ff_psr_fclrz_scanout),
	.dout	(efu_psr_fclrz_q),
	.din	(~efu_psr_fclrz_in),
	.en	(io_cmp_sync_en_r1),
	.l1clk	(l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
	);

efu_niu_ctl_msff_ctl_macro__en_1__width_1	ff_mcu_fclrz   
	(
        .scan_in(ff_mcu_fclrz_scanin),
	.scan_out(ff_mcu_fclrz_scanout),
	.dout	(efu_mcu_fclrz_q),
	.din	(~efu_mcu_fclrz_in),
	.en	(io_cmp_sync_en_r1),
	.l1clk	(l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
	);

efu_niu_ctl_msff_ctl_macro__en_1__width_1	ff_dmu_clr   
	(
        .scan_in(ff_dmu_clr_scanin),
	.scan_out(ff_dmu_clr_scanout),
	.din	(efu_dmu_clr_in),
	.dout	(efu_dmu_clr_q),
	.en	(io_cmp_sync_en_r1),
	.l1clk	(l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
	);

// registers out
efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_clr_spc0_iclr   
        (
        .scan_in(clr_spc0_iclr_scanin),
        .scan_out(clr_spc0_iclr_scanout),
        .din    (efu_spc0_fuse_iclr_in),
        .dout   (efu_spc0_fuse_iclr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_clr_spc1_iclr   
        (
        .scan_in(clr_spc1_iclr_scanin),
        .scan_out(clr_spc1_iclr_scanout),
        .din    (efu_spc1_fuse_iclr_in),
        .dout   (efu_spc1_fuse_iclr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_clr_spc2_iclr   
        (
        .scan_in(clr_spc2_iclr_scanin),
        .scan_out(clr_spc2_iclr_scanout),
        .din    (efu_spc2_fuse_iclr_in),
        .dout   (efu_spc2_fuse_iclr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_clr_spc3_iclr   
        (
        .scan_in(clr_spc3_iclr_scanin),
        .scan_out(clr_spc3_iclr_scanout),
        .din    (efu_spc3_fuse_iclr_in),
        .dout   (efu_spc3_fuse_iclr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_clr_spc4_iclr   
        (
        .scan_in(clr_spc4_iclr_scanin),
        .scan_out(clr_spc4_iclr_scanout),
        .din    (efu_spc4_fuse_iclr_in),
        .dout   (efu_spc4_fuse_iclr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_clr_spc5_iclr   
        (
        .scan_in(clr_spc5_iclr_scanin),
        .scan_out(clr_spc5_iclr_scanout),
        .din    (efu_spc5_fuse_iclr_in),
        .dout   (efu_spc5_fuse_iclr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_clr_spc6_iclr   
        (
        .scan_in(clr_spc6_iclr_scanin),
        .scan_out(clr_spc6_iclr_scanout),
        .din    (efu_spc6_fuse_iclr_in),
        .dout   (efu_spc6_fuse_iclr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_clr_spc7_iclr   
        (
        .scan_in(clr_spc7_iclr_scanin),
        .scan_out(clr_spc7_iclr_scanout),
        .din    (efu_spc7_fuse_iclr_in),
        .dout   (efu_spc7_fuse_iclr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_clr_spc0_dclr   
        (
        .scan_in(clr_spc0_dclr_scanin),
        .scan_out(clr_spc0_dclr_scanout),
        .din    (efu_spc0_fuse_dclr_in),
        .dout   (efu_spc0_fuse_dclr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_clr_spc1_dclr   
        (
        .scan_in(clr_spc1_dclr_scanin),
        .scan_out(clr_spc1_dclr_scanout),
        .din    (efu_spc1_fuse_dclr_in),
        .dout   (efu_spc1_fuse_dclr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_clr_spc2_dclr   
        (
        .scan_in(clr_spc2_dclr_scanin),
        .scan_out(clr_spc2_dclr_scanout),
        .din    (efu_spc2_fuse_dclr_in),
        .dout   (efu_spc2_fuse_dclr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_clr_spc3_dclr   
        (
        .scan_in(clr_spc3_dclr_scanin),
        .scan_out(clr_spc3_dclr_scanout),
        .din    (efu_spc3_fuse_dclr_in),
        .dout   (efu_spc3_fuse_dclr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_clr_spc4_dclr   
        (
        .scan_in(clr_spc4_dclr_scanin),
        .scan_out(clr_spc4_dclr_scanout),
        .din    (efu_spc4_fuse_dclr_in),
        .dout   (efu_spc4_fuse_dclr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_clr_spc5_dclr   
        (
        .scan_in(clr_spc5_dclr_scanin),
        .scan_out(clr_spc5_dclr_scanout),
        .din    (efu_spc5_fuse_dclr_in),
        .dout   (efu_spc5_fuse_dclr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_clr_spc6_dclr   
        (
        .scan_in(clr_spc6_dclr_scanin),
        .scan_out(clr_spc6_dclr_scanout),
        .din    (efu_spc6_fuse_dclr_in),
        .dout   (efu_spc6_fuse_dclr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_clr_spc7_dclr   
        (
        .scan_in(clr_spc7_dclr_scanin),
        .scan_out(clr_spc7_dclr_scanout),
        .din    (efu_spc7_fuse_dclr_in),
        .dout   (efu_spc7_fuse_dclr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_l2t0_fuse_clr   
        (
        .scan_in(l2t0_fuse_clr_scanin),
        .scan_out(l2t0_fuse_clr_scanout),
        .din    (efu_l2t0_fuse_clr_in),
        .dout   (efu_l2t0_fuse_clr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_l2t1_fuse_clr   
        (
        .scan_in(l2t1_fuse_clr_scanin),
        .scan_out(l2t1_fuse_clr_scanout),
        .din    (efu_l2t1_fuse_clr_in),
        .dout   (efu_l2t1_fuse_clr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_l2t2_fuse_clr   
        (
        .scan_in(l2t2_fuse_clr_scanin),
        .scan_out(l2t2_fuse_clr_scanout),
        .din    (efu_l2t2_fuse_clr_in),
        .dout   (efu_l2t2_fuse_clr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_l2t3_fuse_clr   
        (
        .scan_in(l2t3_fuse_clr_scanin),
        .scan_out(l2t3_fuse_clr_scanout),
        .din    (efu_l2t3_fuse_clr_in),
        .dout   (efu_l2t3_fuse_clr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_l2t4_fuse_clr   
        (
        .scan_in(l2t4_fuse_clr_scanin),
        .scan_out(l2t4_fuse_clr_scanout),
        .din    (efu_l2t4_fuse_clr_in),
        .dout   (efu_l2t4_fuse_clr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_l2t5_fuse_clr   
        (
        .scan_in(l2t5_fuse_clr_scanin),
        .scan_out(l2t5_fuse_clr_scanout),
        .din    (efu_l2t5_fuse_clr_in),
        .dout   (efu_l2t5_fuse_clr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_l2t6_fuse_clr   
        (
        .scan_in(l2t6_fuse_clr_scanin),
        .scan_out(l2t6_fuse_clr_scanout),
        .din    (efu_l2t6_fuse_clr_in),
        .dout   (efu_l2t6_fuse_clr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_l2t7_fuse_clr   
        (
        .scan_in(l2t7_fuse_clr_scanin),
        .scan_out(l2t7_fuse_clr_scanout),
        .din    (efu_l2t7_fuse_clr_in),
        .dout   (efu_l2t7_fuse_clr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_l2b0_fuse_clr   
        (
        .scan_in(l2b0_fuse_clr_scanin),
        .scan_out(l2b0_fuse_clr_scanout),
        .din    (efu_l2b0_fuse_clr_in),
        .dout   (efu_l2b0_fuse_clr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_l2b1_fuse_clr   
        (
        .scan_in(l2b1_fuse_clr_scanin),
        .scan_out(l2b1_fuse_clr_scanout),
        .din    (efu_l2b1_fuse_clr_in),
        .dout   (efu_l2b1_fuse_clr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_l2b2_fuse_clr   
        (
        .scan_in(l2b2_fuse_clr_scanin),
        .scan_out(l2b2_fuse_clr_scanout),
        .din    (efu_l2b2_fuse_clr_in),
        .dout   (efu_l2b2_fuse_clr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_l2b3_fuse_clr   
        (
        .scan_in(l2b3_fuse_clr_scanin),
        .scan_out(l2b3_fuse_clr_scanout),
        .din    (efu_l2b3_fuse_clr_in),
        .dout   (efu_l2b3_fuse_clr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_l2b4_fuse_clr   
        (
        .scan_in(l2b4_fuse_clr_scanin),
        .scan_out(l2b4_fuse_clr_scanout),
        .din    (efu_l2b4_fuse_clr_in),
        .dout   (efu_l2b4_fuse_clr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_l2b5_fuse_clr   
        (
        .scan_in(l2b5_fuse_clr_scanin),
        .scan_out(l2b5_fuse_clr_scanout),
        .din    (efu_l2b5_fuse_clr_in),
        .dout   (efu_l2b5_fuse_clr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_l2b6_fuse_clr   
        (
        .scan_in(l2b6_fuse_clr_scanin),
        .scan_out(l2b6_fuse_clr_scanout),
        .din    (efu_l2b6_fuse_clr_in),
        .dout   (efu_l2b6_fuse_clr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_niu_ctl_msff_ctl_macro__en_1__width_1  ff_efu_red_reg_l2b7_fuse_clr   
        (
        .scan_in(l2b7_fuse_clr_scanin),
        .scan_out(l2b7_fuse_clr_scanout),
        .din    (efu_l2b7_fuse_clr_in),
        .dout   (efu_l2b7_fuse_clr),
        .en	(io_cmp_sync_en_r1),
        .l1clk  (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );
// fixscan start:
assign ff_read_data_ff_sync_scanin = scan_in                  ;
assign ff_read_data_ff_shift_scanin = ff_read_data_ff_sync_scanout;
assign ff_read_data_ff_vld_1_scanin = ff_read_data_ff_shift_scanout;
assign ff_read_data_ff_vld_scanin = ff_read_data_ff_vld_1_scanout;
assign ff_pulse_read_data_ff_vld_scanin = ff_read_data_ff_vld_scanout;
assign ff_pulse_read_data_ff_vld_1_scanin = ff_pulse_read_data_ff_vld_scanout;
assign ff_vld_en_scanin = ff_pulse_read_data_ff_vld_1_scanout;
assign ff_psrclk_scanin = ff_vld_en_scanout;
assign ff_mcuclk_scanin = ff_psrclk_scanout;
assign ff_niuclk_scanin = ff_mcuclk_scanout;
assign ff_cnt_scanin = ff_niuclk_scanout;
assign ff_dmu_xfer_en_scanin = ff_cnt_scanout;
assign ff_mac1_sf_xfer_en_scanin = ff_dmu_xfer_en_scanout;
assign ff_mac1_ro_xfer_en_scanin = ff_mac1_sf_xfer_en_scanout;
assign ff_mac0_sf_xfer_en_scanin = ff_mac1_ro_xfer_en_scanout;
assign ff_mac0_ro_xfer_en_scanin = ff_mac0_sf_xfer_en_scanout;
assign ff_ipp0_xfer_en_scanin = ff_mac0_ro_xfer_en_scanout;
assign ff_ipp1_xfer_en_scanin = ff_ipp0_xfer_en_scanout;
assign ff_cfifo0_xfer_en_scanin = ff_ipp1_xfer_en_scanout;
assign ff_cfifo1_xfer_en_scanin = ff_cfifo0_xfer_en_scanout;
assign ff_ram0_xfer_en_scanin = ff_cfifo1_xfer_en_scanout;
assign ff_ram1_xfer_en_scanin = ff_ram0_xfer_en_scanout;
assign ff_4k_xfer_en_scanin = ff_ram1_xfer_en_scanout;
assign ff_ram_xfer_en_scanin = ff_4k_xfer_en_scanout;
assign ff_mcu_fdo_scanin = ff_ram_xfer_en_scanout;
assign ff_psr_fdo_scanin = ff_mcu_fdo_scanout;
assign ff_niu_fdo_scanin = ff_psr_fdo_scanout;
assign ff_capture_serdes_scanin = ff_niu_fdo_scanout;
assign ff_serdes_rd_en_scanin = ff_capture_serdes_scanout;
assign ff_niu_shift_scanin = ff_serdes_rd_en_scanout;
assign ff_read_data_in_r2_scanin = ff_niu_shift_scanout;
assign ff_load_niu_read_data_scanin = ff_read_data_in_r2_scanout ;
assign ff_read_data_in_r1_scanin = ff_load_niu_read_data_scanout ;
assign ff_read_data_in_scanin = ff_read_data_in_r1_scanout;
assign ff_serdes_data_shift_scanin = ff_read_data_in_scanout;
assign tcu_red_reg_clr_reg0_scanin = ff_serdes_data_shift_scanout        ;
assign tcu_red_reg_clr_reg1_scanin = tcu_red_reg_clr_reg0_scanout        ;
assign tcu_red_reg_clr_reg2_scanin = tcu_red_reg_clr_reg1_scanout        ;
assign tcu_red_reg_clr_reg3_scanin = tcu_red_reg_clr_reg2_scanout        ;
assign tcu_red_reg_clr_reg4_scanin = tcu_red_reg_clr_reg3_scanout        ;
assign tcu_red_reg_clr_reg5_scanin = tcu_red_reg_clr_reg4_scanout        ;
assign tcu_red_reg_clr_reg6_scanin = tcu_red_reg_clr_reg5_scanout        ;
assign ff_niu_fclrz_scanin = tcu_red_reg_clr_reg6_scanout;
assign ff_psr_fclrz_scanin = ff_niu_fclrz_scanout;
assign ff_mcu_fclrz_scanin = ff_psr_fclrz_scanout;
assign ff_dmu_clr_scanin   = ff_mcu_fclrz_scanout;
assign clr_spc0_iclr_scanin        = ff_dmu_clr_scanout;
assign clr_spc1_iclr_scanin        = clr_spc0_iclr_scanout;
assign clr_spc2_iclr_scanin        = clr_spc1_iclr_scanout;
assign clr_spc3_iclr_scanin        = clr_spc2_iclr_scanout;
assign clr_spc4_iclr_scanin        = clr_spc3_iclr_scanout;
assign clr_spc5_iclr_scanin        = clr_spc4_iclr_scanout;
assign clr_spc6_iclr_scanin        = clr_spc5_iclr_scanout;
assign clr_spc7_iclr_scanin        = clr_spc6_iclr_scanout;
assign clr_spc0_dclr_scanin        = clr_spc7_iclr_scanout;
assign clr_spc1_dclr_scanin        = clr_spc0_dclr_scanout;
assign clr_spc2_dclr_scanin        = clr_spc1_dclr_scanout;
assign clr_spc3_dclr_scanin        = clr_spc2_dclr_scanout;
assign clr_spc4_dclr_scanin        = clr_spc3_dclr_scanout;
assign clr_spc5_dclr_scanin        = clr_spc4_dclr_scanout;
assign clr_spc6_dclr_scanin        = clr_spc5_dclr_scanout;
assign clr_spc7_dclr_scanin        = clr_spc6_dclr_scanout;
assign l2t0_fuse_clr_scanin        = clr_spc7_dclr_scanout;
assign l2t1_fuse_clr_scanin        = l2t0_fuse_clr_scanout;
assign l2t2_fuse_clr_scanin        = l2t1_fuse_clr_scanout;
assign l2t3_fuse_clr_scanin        = l2t2_fuse_clr_scanout;
assign l2t4_fuse_clr_scanin        = l2t3_fuse_clr_scanout;
assign l2t5_fuse_clr_scanin        = l2t4_fuse_clr_scanout;
assign l2t6_fuse_clr_scanin        = l2t5_fuse_clr_scanout;
assign l2t7_fuse_clr_scanin        = l2t6_fuse_clr_scanout;
assign l2b0_fuse_clr_scanin	   = l2t7_fuse_clr_scanout;
assign l2b1_fuse_clr_scanin        = l2b0_fuse_clr_scanout;
assign l2b2_fuse_clr_scanin        = l2b1_fuse_clr_scanout;
assign l2b3_fuse_clr_scanin        = l2b2_fuse_clr_scanout;
assign l2b4_fuse_clr_scanin        = l2b3_fuse_clr_scanout;
assign l2b5_fuse_clr_scanin        = l2b4_fuse_clr_scanout;
assign l2b6_fuse_clr_scanin        = l2b5_fuse_clr_scanout;
assign l2b7_fuse_clr_scanin        = l2b6_fuse_clr_scanout;
assign ff_cmp_io_sync_en_scanin    = l2b7_fuse_clr_scanout;
assign ff_io_cmp_sync_en_scanin    = ff_cmp_io_sync_en_scanout;
assign spares_scanin               = ff_io_cmp_sync_en_scanout;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module efu_niu_ctl_l1clkhdr_ctl_macro (
  l2clk, 
  l1en, 
  pce_ov, 
  stop, 
  se, 
  l1clk);


  input l2clk;
  input l1en;
  input pce_ov;
  input stop;
  input se;
  output l1clk;



 

cl_sc1_l1hdr_8x c_0 (


   .l2clk(l2clk),
   .pce(l1en),
   .l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop)
);



endmodule













// any PARAMS parms go into naming of macro

module efu_niu_ctl_msff_ctl_macro__en_1__width_1 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}}) | (dout[0:0] & ~{1{en}});






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);












endmodule













// any PARAMS parms go into naming of macro

module efu_niu_ctl_msff_ctl_macro__width_2 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0];






dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);












endmodule













// any PARAMS parms go into naming of macro

module efu_niu_ctl_msff_ctl_macro__width_1 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0];






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);












endmodule













// any PARAMS parms go into naming of macro

module efu_niu_ctl_msff_ctl_macro__en_1__width_32 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = (din[31:0] & {32{en}}) | (dout[31:0] & ~{32{en}});






dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);












endmodule













// any PARAMS parms go into naming of macro

module efu_niu_ctl_msff_ctl_macro__en_1__width_7 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [6:0] fdin;
wire [5:0] so;

  input [6:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [6:0] dout;
  output scan_out;
assign fdin[6:0] = (din[6:0] & {7{en}}) | (dout[6:0] & ~{7{en}});






dff #(7)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6:0]),
.si({scan_in,so[5:0]}),
.so({so[5:0],scan_out}),
.q(dout[6:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module efu_niu_ctl_spare_ctl_macro__num_2 (
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  scan_out);
wire si_0;
wire so_0;
wire spare0_flop_unused;
wire spare0_buf_32x_unused;
wire spare0_nand3_8x_unused;
wire spare0_inv_8x_unused;
wire spare0_aoi22_4x_unused;
wire spare0_buf_8x_unused;
wire spare0_oai22_4x_unused;
wire spare0_inv_16x_unused;
wire spare0_nand2_16x_unused;
wire spare0_nor3_4x_unused;
wire spare0_nand2_8x_unused;
wire spare0_buf_16x_unused;
wire spare0_nor2_16x_unused;
wire spare0_inv_32x_unused;
wire si_1;
wire so_1;
wire spare1_flop_unused;
wire spare1_buf_32x_unused;
wire spare1_nand3_8x_unused;
wire spare1_inv_8x_unused;
wire spare1_aoi22_4x_unused;
wire spare1_buf_8x_unused;
wire spare1_oai22_4x_unused;
wire spare1_inv_16x_unused;
wire spare1_nand2_16x_unused;
wire spare1_nor3_4x_unused;
wire spare1_nand2_8x_unused;
wire spare1_buf_16x_unused;
wire spare1_nor2_16x_unused;
wire spare1_inv_32x_unused;


input		l1clk;
input		scan_in;
input		siclk;
input		soclk;
output		scan_out;

cl_sc1_msff_8x spare0_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_0),
                               .so(so_0),
                               .d(1'b0),
                               .q(spare0_flop_unused));
assign si_0 = scan_in;

cl_u1_buf_32x   spare0_buf_32x (.in(1'b1),
                                   .out(spare0_buf_32x_unused));
cl_u1_nand3_8x spare0_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare0_nand3_8x_unused));
cl_u1_inv_8x    spare0_inv_8x (.in(1'b1),
                                  .out(spare0_inv_8x_unused));
cl_u1_aoi22_4x spare0_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_aoi22_4x_unused));
cl_u1_buf_8x    spare0_buf_8x (.in(1'b1),
                                  .out(spare0_buf_8x_unused));
cl_u1_oai22_4x spare0_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_oai22_4x_unused));
cl_u1_inv_16x   spare0_inv_16x (.in(1'b1),
                                   .out(spare0_inv_16x_unused));
cl_u1_nand2_16x spare0_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare0_nand2_16x_unused));
cl_u1_nor3_4x spare0_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare0_nor3_4x_unused));
cl_u1_nand2_8x spare0_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare0_nand2_8x_unused));
cl_u1_buf_16x   spare0_buf_16x (.in(1'b1),
                                   .out(spare0_buf_16x_unused));
cl_u1_nor2_16x spare0_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare0_nor2_16x_unused));
cl_u1_inv_32x   spare0_inv_32x (.in(1'b1),
                                   .out(spare0_inv_32x_unused));

cl_sc1_msff_8x spare1_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_1),
                               .so(so_1),
                               .d(1'b0),
                               .q(spare1_flop_unused));
assign si_1 = so_0;

cl_u1_buf_32x   spare1_buf_32x (.in(1'b1),
                                   .out(spare1_buf_32x_unused));
cl_u1_nand3_8x spare1_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare1_nand3_8x_unused));
cl_u1_inv_8x    spare1_inv_8x (.in(1'b1),
                                  .out(spare1_inv_8x_unused));
cl_u1_aoi22_4x spare1_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_aoi22_4x_unused));
cl_u1_buf_8x    spare1_buf_8x (.in(1'b1),
                                  .out(spare1_buf_8x_unused));
cl_u1_oai22_4x spare1_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_oai22_4x_unused));
cl_u1_inv_16x   spare1_inv_16x (.in(1'b1),
                                   .out(spare1_inv_16x_unused));
cl_u1_nand2_16x spare1_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare1_nand2_16x_unused));
cl_u1_nor3_4x spare1_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare1_nor3_4x_unused));
cl_u1_nand2_8x spare1_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare1_nand2_8x_unused));
cl_u1_buf_16x   spare1_buf_16x (.in(1'b1),
                                   .out(spare1_buf_16x_unused));
cl_u1_nor2_16x spare1_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare1_nor2_16x_unused));
cl_u1_inv_32x   spare1_inv_32x (.in(1'b1),
                                   .out(spare1_inv_32x_unused));
assign scan_out = so_1;



endmodule

