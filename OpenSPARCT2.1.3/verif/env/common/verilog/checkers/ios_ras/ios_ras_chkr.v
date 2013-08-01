// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ios_ras_chkr.v
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
`define TB_RST ~(tb_top.cpu.l2t0.rst_wmr_)

module ios_ras_chkr;


reg no_ras_chk ;
initial begin // {
    @(posedge tb_top.cpu.ncu.iol2clk) ;
    if ($test$plusargs("ios_0in_ras_chk_off"))
        no_ras_chk <= 1;
    else
        no_ras_chk <= 0;
end //}

//  0in disable_checker -name *ios_ras* no_ras_chk 

   /* 0in
    never 
    -var |(tb_top.cpu.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_esr)
    -clock tb_top.cpu.ncu.iol2clk
    -name ios_ras_ncu_esr_chk 
    -reset `TB_RST 
   */

   /* 0in
    never
    -var |(tb_top.cpu.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_per)
    -clock tb_top.cpu.ncu.iol2clk
    -name ios_ras_ncu_per_chk
    -reset `TB_RST 
   */

   
   // SIU-NIU, SIU-DMU and SIU-NCU Interfaces: Errror bits should never be on for non-error diags
   /* 0in
    never
    -var ((|(dmu_sii_data[82:80]) & dmu_sii_hdr_vld) | (|(sio_dmu_data[82:80]) & sio_dmu_hdr_vld) | (|(niu_sii_data[82:80]) & niu_sii_hdr_vld) | (|(sio_niu_data[82:80]) & sio_niu_hdr_vld) | (|(sii_ncu_data[31:28]) &  $0in_delay(ncu_sii_gnt, 1)))
    -module cpu
    -clock tb_top.cpu.sii.iol2clk
    -name ios_ras_io_err_bit_chk
    -reset `TB_RST 
   */


   // SIU-L2 Interface: Errror bits should never be on for non-error diags
   /* 0in
    never
    -var ((sii_l2t0_req[28] & sii_l2t0_req_vld) | (sii_l2t1_req[28] & sii_l2t1_req_vld) | (sii_l2t2_req[28] & sii_l2t2_req_vld) | (sii_l2t3_req[28] & sii_l2t3_req_vld) | (sii_l2t4_req[28] & sii_l2t4_req_vld) | (sii_l2t5_req[28] & sii_l2t5_req_vld) | (sii_l2t6_req[28] & sii_l2t6_req_vld) | (sii_l2t7_req[28] & sii_l2t7_req_vld) | ((l2b0_sio_data[24] | l2b0_sio_data[21]) & l2b0_sio_ctag_vld) | ((l2b1_sio_data[24] | l2b1_sio_data[21]) & l2b1_sio_ctag_vld) | ((l2b2_sio_data[24] | l2b2_sio_data[21]) & l2b2_sio_ctag_vld) | ((l2b3_sio_data[24] | l2b3_sio_data[21]) & l2b3_sio_ctag_vld) | ((l2b4_sio_data[24] | l2b4_sio_data[21]) & l2b4_sio_ctag_vld) | ((l2b5_sio_data[24] | l2b5_sio_data[21]) & l2b5_sio_ctag_vld) | ((l2b6_sio_data[24] | l2b6_sio_data[21]) & l2b6_sio_ctag_vld) | ((l2b7_sio_data[24] | l2b7_sio_data[21]) & l2b7_sio_ctag_vld))
    -module cpu
    -clock tb_top.cpu.sii.l2clk
    -name ios_ras_l2_err_bit_chk
    -reset `TB_RST 
   */

   // CPX Pkt Errror bits should never be on for non-error diags
   /* 0in
    never
    -var |ncu_cpx_data_ca[139:138]
    -module cpu
    -clock tb_top.cpu.ncu.iol2clk
    -name ios_ras_cpx_err_bit_chk
    -reset `TB_RST 
   */

   // All blocks to NCU: Errror bits should never be on for non-error diags
   /* 0in
    never
    -var (dmu_ncu_ctag_ce | dmu_ncu_ctag_ue | dmu_ncu_d_pe |  dmu_ncu_ie | dmu_ncu_ncucr_pe | dmu_ncu_siicr_pe | niu_ncu_ctag_ce | niu_ncu_ctag_ue | niu_ncu_d_pe | sii_ncu_dmua_pe | sii_ncu_dmuctag_ce | sii_ncu_dmuctag_ue |  sii_ncu_dmud_pe |  sii_ncu_niuctag_ce |  sii_ncu_niuctag_ue |  sii_ncu_niud_pe | sii_ncu_niua_pe | sio_ncu_ctag_ce | sio_ncu_ctag_ue | mcu0_ncu_ecc | mcu0_ncu_fbr | mcu1_ncu_ecc | mcu1_ncu_fbr | mcu2_ncu_ecc | mcu2_ncu_fbr | mcu3_ncu_ecc | mcu3_ncu_fbr) 
    -module cpu
    -clock tb_top.cpu.ncu.iol2clk
    -name ios_ras_err_report_chk
    -reset `TB_RST 
   */




/***************************************************/



// Hunter's FC checkers

// Testfail status bus

// MCU0 FSR0 RX

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.stsrx0[0] -val `CPU.mcu0.fbd0.frdbuf0.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.stsrx1[0] -val `CPU.mcu0.fbd0.frdbuf1.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.stsrx2[0] -val `CPU.mcu0.fbd0.frdbuf2.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.stsrx3[0] -val `CPU.mcu0.fbd0.frdbuf3.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.stsrx0[0] -val `CPU.mcu0.fbd0.frdbuf4.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.stsrx1[0] -val `CPU.mcu0.fbd0.frdbuf5.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.stsrx2[0] -val `CPU.mcu0.fbd0.frdbuf6.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.stsrx3[0] -val `CPU.mcu0.fbd0.frdbuf7.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.stsrx4[0] -val `CPU.mcu0.fbd0.frdbuf8.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.stsrx5[0] -val `CPU.mcu0.fbd0.frdbuf9.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.stsrx0[0] -val `CPU.mcu0.fbd0.frdbuf10.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.stsrx1[0] -val `CPU.mcu0.fbd0.frdbuf11.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.stsrx2[0] -val `CPU.mcu0.fbd0.frdbuf12.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.stsrx3[0] -val `CPU.mcu0.fbd0.frdbuf13.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 RX

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.stsrx0[0] -val `CPU.mcu0.fbd1.frdbuf0.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.stsrx1[0] -val `CPU.mcu0.fbd1.frdbuf1.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.stsrx2[0] -val `CPU.mcu0.fbd1.frdbuf2.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.stsrx3[0] -val `CPU.mcu0.fbd1.frdbuf3.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.stsrx0[0] -val `CPU.mcu0.fbd1.frdbuf4.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.stsrx1[0] -val `CPU.mcu0.fbd1.frdbuf5.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.stsrx2[0] -val `CPU.mcu0.fbd1.frdbuf6.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.stsrx3[0] -val `CPU.mcu0.fbd1.frdbuf7.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.stsrx4[0] -val `CPU.mcu0.fbd1.frdbuf8.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.stsrx5[0] -val `CPU.mcu0.fbd1.frdbuf9.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.stsrx0[0] -val `CPU.mcu0.fbd1.frdbuf10.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.stsrx1[0] -val `CPU.mcu0.fbd1.frdbuf11.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.stsrx2[0] -val `CPU.mcu0.fbd1.frdbuf12.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.stsrx3[0] -val `CPU.mcu0.fbd1.frdbuf13.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 RX

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.stsrx0[0] -val `CPU.mcu1.fbd0.frdbuf0.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.stsrx1[0] -val `CPU.mcu1.fbd0.frdbuf1.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.stsrx2[0] -val `CPU.mcu1.fbd0.frdbuf2.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.stsrx3[0] -val `CPU.mcu1.fbd0.frdbuf3.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.stsrx0[0] -val `CPU.mcu1.fbd0.frdbuf4.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.stsrx1[0] -val `CPU.mcu1.fbd0.frdbuf5.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.stsrx2[0] -val `CPU.mcu1.fbd0.frdbuf6.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.stsrx3[0] -val `CPU.mcu1.fbd0.frdbuf7.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.stsrx4[0] -val `CPU.mcu1.fbd0.frdbuf8.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.stsrx5[0] -val `CPU.mcu1.fbd0.frdbuf9.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.stsrx0[0] -val `CPU.mcu1.fbd0.frdbuf10.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.stsrx1[0] -val `CPU.mcu1.fbd0.frdbuf11.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.stsrx2[0] -val `CPU.mcu1.fbd0.frdbuf12.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.stsrx3[0] -val `CPU.mcu1.fbd0.frdbuf13.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 RX

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.stsrx0[0] -val `CPU.mcu1.fbd1.frdbuf0.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.stsrx1[0] -val `CPU.mcu1.fbd1.frdbuf1.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.stsrx2[0] -val `CPU.mcu1.fbd1.frdbuf2.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.stsrx3[0] -val `CPU.mcu1.fbd1.frdbuf3.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.stsrx0[0] -val `CPU.mcu1.fbd1.frdbuf4.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.stsrx1[0] -val `CPU.mcu1.fbd1.frdbuf5.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.stsrx2[0] -val `CPU.mcu1.fbd1.frdbuf6.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.stsrx3[0] -val `CPU.mcu1.fbd1.frdbuf7.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.stsrx4[0] -val `CPU.mcu1.fbd1.frdbuf8.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.stsrx5[0] -val `CPU.mcu1.fbd1.frdbuf9.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.stsrx0[0] -val `CPU.mcu1.fbd1.frdbuf10.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.stsrx1[0] -val `CPU.mcu1.fbd1.frdbuf11.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.stsrx2[0] -val `CPU.mcu1.fbd1.frdbuf12.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.stsrx3[0] -val `CPU.mcu1.fbd1.frdbuf13.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// MCU2 FSR4 RX

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.stsrx0[0] -val `CPU.mcu2.fbd0.frdbuf0.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.stsrx1[0] -val `CPU.mcu2.fbd0.frdbuf1.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.stsrx2[0] -val `CPU.mcu2.fbd0.frdbuf2.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.stsrx3[0] -val `CPU.mcu2.fbd0.frdbuf3.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.stsrx0[0] -val `CPU.mcu2.fbd0.frdbuf4.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.stsrx1[0] -val `CPU.mcu2.fbd0.frdbuf5.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.stsrx2[0] -val `CPU.mcu2.fbd0.frdbuf6.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.stsrx3[0] -val `CPU.mcu2.fbd0.frdbuf7.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.stsrx4[0] -val `CPU.mcu2.fbd0.frdbuf8.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.stsrx5[0] -val `CPU.mcu2.fbd0.frdbuf9.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.stsrx0[0] -val `CPU.mcu2.fbd0.frdbuf10.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.stsrx1[0] -val `CPU.mcu2.fbd0.frdbuf11.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.stsrx2[0] -val `CPU.mcu2.fbd0.frdbuf12.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.stsrx3[0] -val `CPU.mcu2.fbd0.frdbuf13.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// MCU2 FSR5 RX

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.stsrx0[0] -val `CPU.mcu2.fbd1.frdbuf0.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.stsrx1[0] -val `CPU.mcu2.fbd1.frdbuf1.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.stsrx2[0] -val `CPU.mcu2.fbd1.frdbuf2.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.stsrx3[0] -val `CPU.mcu2.fbd1.frdbuf3.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.stsrx0[0] -val `CPU.mcu2.fbd1.frdbuf4.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.stsrx1[0] -val `CPU.mcu2.fbd1.frdbuf5.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.stsrx2[0] -val `CPU.mcu2.fbd1.frdbuf6.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.stsrx3[0] -val `CPU.mcu2.fbd1.frdbuf7.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.stsrx4[0] -val `CPU.mcu2.fbd1.frdbuf8.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.stsrx5[0] -val `CPU.mcu2.fbd1.frdbuf9.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.stsrx0[0] -val `CPU.mcu2.fbd1.frdbuf10.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.stsrx1[0] -val `CPU.mcu2.fbd1.frdbuf11.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.stsrx2[0] -val `CPU.mcu2.fbd1.frdbuf12.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.stsrx3[0] -val `CPU.mcu2.fbd1.frdbuf13.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 RX

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.stsrx0[0] -val `CPU.mcu3.fbd0.frdbuf0.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.stsrx1[0] -val `CPU.mcu3.fbd0.frdbuf1.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.stsrx2[0] -val `CPU.mcu3.fbd0.frdbuf2.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.stsrx3[0] -val `CPU.mcu3.fbd0.frdbuf3.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.stsrx0[0] -val `CPU.mcu3.fbd0.frdbuf4.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.stsrx1[0] -val `CPU.mcu3.fbd0.frdbuf5.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.stsrx2[0] -val `CPU.mcu3.fbd0.frdbuf6.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.stsrx3[0] -val `CPU.mcu3.fbd0.frdbuf7.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.stsrx4[0] -val `CPU.mcu3.fbd0.frdbuf8.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.stsrx5[0] -val `CPU.mcu3.fbd0.frdbuf9.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.stsrx0[0] -val `CPU.mcu3.fbd0.frdbuf10.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.stsrx1[0] -val `CPU.mcu3.fbd0.frdbuf11.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.stsrx2[0] -val `CPU.mcu3.fbd0.frdbuf12.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.stsrx3[0] -val `CPU.mcu3.fbd0.frdbuf13.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// MCU3 FSR7 RX

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.stsrx0[0] -val `CPU.mcu3.fbd1.frdbuf0.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.stsrx1[0] -val `CPU.mcu3.fbd1.frdbuf1.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.stsrx2[0] -val `CPU.mcu3.fbd1.frdbuf2.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.stsrx3[0] -val `CPU.mcu3.fbd1.frdbuf3.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.stsrx0[0] -val `CPU.mcu3.fbd1.frdbuf4.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.stsrx1[0] -val `CPU.mcu3.fbd1.frdbuf5.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.stsrx2[0] -val `CPU.mcu3.fbd1.frdbuf6.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.stsrx3[0] -val `CPU.mcu3.fbd1.frdbuf7.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.stsrx4[0] -val `CPU.mcu3.fbd1.frdbuf8.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.stsrx5[0] -val `CPU.mcu3.fbd1.frdbuf9.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.stsrx0[0] -val `CPU.mcu3.fbd1.frdbuf10.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.stsrx1[0] -val `CPU.mcu3.fbd1.frdbuf11.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.stsrx2[0] -val `CPU.mcu3.fbd1.frdbuf12.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.stsrx3[0] -val `CPU.mcu3.fbd1.frdbuf13.fsr_stsrx_testfail
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 TX

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.ststx0[0] -val `CPU.mcu0.fbdic.fsr0_mcu_ststx_testfail[0]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.ststx1[0] -val `CPU.mcu0.fbdic.fsr0_mcu_ststx_testfail[1]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.ststx2[0] -val `CPU.mcu0.fbdic.fsr0_mcu_ststx_testfail[2]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.ststx3[0] -val `CPU.mcu0.fbdic.fsr0_mcu_ststx_testfail[3]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.ststx0[0] -val `CPU.mcu0.fbdic.fsr0_mcu_ststx_testfail[4]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.ststx1[0] -val `CPU.mcu0.fbdic.fsr0_mcu_ststx_testfail[5]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.ststx0[0] -val `CPU.mcu0.fbdic.fsr0_mcu_ststx_testfail[6]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.ststx1[0] -val `CPU.mcu0.fbdic.fsr0_mcu_ststx_testfail[7]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.ststx2[0] -val `CPU.mcu0.fbdic.fsr0_mcu_ststx_testfail[8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.ststx3[0] -val `CPU.mcu0.fbdic.fsr0_mcu_ststx_testfail[9]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// MCU0 FSR1 TX

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.ststx0[0] -val `CPU.mcu0.fbdic.fsr1_mcu_ststx_testfail[0]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.ststx1[0] -val `CPU.mcu0.fbdic.fsr1_mcu_ststx_testfail[1]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.ststx2[0] -val `CPU.mcu0.fbdic.fsr1_mcu_ststx_testfail[2]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.ststx3[0] -val `CPU.mcu0.fbdic.fsr1_mcu_ststx_testfail[3]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.ststx0[0] -val `CPU.mcu0.fbdic.fsr1_mcu_ststx_testfail[4]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.ststx1[0] -val `CPU.mcu0.fbdic.fsr1_mcu_ststx_testfail[5]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.ststx0[0] -val `CPU.mcu0.fbdic.fsr1_mcu_ststx_testfail[6]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.ststx1[0] -val `CPU.mcu0.fbdic.fsr1_mcu_ststx_testfail[7]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.ststx2[0] -val `CPU.mcu0.fbdic.fsr1_mcu_ststx_testfail[8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.ststx3[0] -val `CPU.mcu0.fbdic.fsr1_mcu_ststx_testfail[9]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// MCU1 FSR2 TX

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.ststx0[0] -val `CPU.mcu1.fbdic.fsr0_mcu_ststx_testfail[0]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.ststx1[0] -val `CPU.mcu1.fbdic.fsr0_mcu_ststx_testfail[1]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.ststx2[0] -val `CPU.mcu1.fbdic.fsr0_mcu_ststx_testfail[2]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.ststx3[0] -val `CPU.mcu1.fbdic.fsr0_mcu_ststx_testfail[3]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.ststx0[0] -val `CPU.mcu1.fbdic.fsr0_mcu_ststx_testfail[4]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.ststx1[0] -val `CPU.mcu1.fbdic.fsr0_mcu_ststx_testfail[5]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.ststx0[0] -val `CPU.mcu1.fbdic.fsr0_mcu_ststx_testfail[6]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.ststx1[0] -val `CPU.mcu1.fbdic.fsr0_mcu_ststx_testfail[7]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.ststx2[0] -val `CPU.mcu1.fbdic.fsr0_mcu_ststx_testfail[8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.ststx3[0] -val `CPU.mcu1.fbdic.fsr0_mcu_ststx_testfail[9]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// MCU1 FSR3 TX

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.ststx0[0] -val `CPU.mcu1.fbdic.fsr1_mcu_ststx_testfail[0]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.ststx1[0] -val `CPU.mcu1.fbdic.fsr1_mcu_ststx_testfail[1]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.ststx2[0] -val `CPU.mcu1.fbdic.fsr1_mcu_ststx_testfail[2]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.ststx3[0] -val `CPU.mcu1.fbdic.fsr1_mcu_ststx_testfail[3]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.ststx0[0] -val `CPU.mcu1.fbdic.fsr1_mcu_ststx_testfail[4]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.ststx1[0] -val `CPU.mcu1.fbdic.fsr1_mcu_ststx_testfail[5]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.ststx0[0] -val `CPU.mcu1.fbdic.fsr1_mcu_ststx_testfail[6]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.ststx1[0] -val `CPU.mcu1.fbdic.fsr1_mcu_ststx_testfail[7]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.ststx2[0] -val `CPU.mcu1.fbdic.fsr1_mcu_ststx_testfail[8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.ststx3[0] -val `CPU.mcu1.fbdic.fsr1_mcu_ststx_testfail[9]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// MCU2 FSR4 TX

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.ststx0[0] -val `CPU.mcu2.fbdic.fsr0_mcu_ststx_testfail[0]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.ststx1[0] -val `CPU.mcu2.fbdic.fsr0_mcu_ststx_testfail[1]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.ststx2[0] -val `CPU.mcu2.fbdic.fsr0_mcu_ststx_testfail[2]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.ststx3[0] -val `CPU.mcu2.fbdic.fsr0_mcu_ststx_testfail[3]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.ststx0[0] -val `CPU.mcu2.fbdic.fsr0_mcu_ststx_testfail[4]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.ststx1[0] -val `CPU.mcu2.fbdic.fsr0_mcu_ststx_testfail[5]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.ststx0[0] -val `CPU.mcu2.fbdic.fsr0_mcu_ststx_testfail[6]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.ststx1[0] -val `CPU.mcu2.fbdic.fsr0_mcu_ststx_testfail[7]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.ststx2[0] -val `CPU.mcu2.fbdic.fsr0_mcu_ststx_testfail[8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.ststx3[0] -val `CPU.mcu2.fbdic.fsr0_mcu_ststx_testfail[9]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// MCU2 FSR5 TX

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.ststx0[0] -val `CPU.mcu2.fbdic.fsr1_mcu_ststx_testfail[0]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.ststx1[0] -val `CPU.mcu2.fbdic.fsr1_mcu_ststx_testfail[1]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.ststx2[0] -val `CPU.mcu2.fbdic.fsr1_mcu_ststx_testfail[2]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.ststx3[0] -val `CPU.mcu2.fbdic.fsr1_mcu_ststx_testfail[3]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.ststx0[0] -val `CPU.mcu2.fbdic.fsr1_mcu_ststx_testfail[4]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.ststx1[0] -val `CPU.mcu2.fbdic.fsr1_mcu_ststx_testfail[5]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.ststx0[0] -val `CPU.mcu2.fbdic.fsr1_mcu_ststx_testfail[6]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.ststx1[0] -val `CPU.mcu2.fbdic.fsr1_mcu_ststx_testfail[7]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.ststx2[0] -val `CPU.mcu2.fbdic.fsr1_mcu_ststx_testfail[8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.ststx3[0] -val `CPU.mcu2.fbdic.fsr1_mcu_ststx_testfail[9]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// MCU3 FSR6 TX

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.ststx0[0] -val `CPU.mcu3.fbdic.fsr0_mcu_ststx_testfail[0]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.ststx1[0] -val `CPU.mcu3.fbdic.fsr0_mcu_ststx_testfail[1]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.ststx2[0] -val `CPU.mcu3.fbdic.fsr0_mcu_ststx_testfail[2]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.ststx3[0] -val `CPU.mcu3.fbdic.fsr0_mcu_ststx_testfail[3]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.ststx0[0] -val `CPU.mcu3.fbdic.fsr0_mcu_ststx_testfail[4]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.ststx1[0] -val `CPU.mcu3.fbdic.fsr0_mcu_ststx_testfail[5]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.ststx0[0] -val `CPU.mcu3.fbdic.fsr0_mcu_ststx_testfail[6]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.ststx1[0] -val `CPU.mcu3.fbdic.fsr0_mcu_ststx_testfail[7]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.ststx2[0] -val `CPU.mcu3.fbdic.fsr0_mcu_ststx_testfail[8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.ststx3[0] -val `CPU.mcu3.fbdic.fsr0_mcu_ststx_testfail[9]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// MCU3 FSR7 TX

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.ststx0[0] -val `CPU.mcu3.fbdic.fsr1_mcu_ststx_testfail[0]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.ststx1[0] -val `CPU.mcu3.fbdic.fsr1_mcu_ststx_testfail[1]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.ststx2[0] -val `CPU.mcu3.fbdic.fsr1_mcu_ststx_testfail[2]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.ststx3[0] -val `CPU.mcu3.fbdic.fsr1_mcu_ststx_testfail[3]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.ststx0[0] -val `CPU.mcu3.fbdic.fsr1_mcu_ststx_testfail[4]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.ststx1[0] -val `CPU.mcu3.fbdic.fsr1_mcu_ststx_testfail[5]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.ststx0[0] -val `CPU.mcu3.fbdic.fsr1_mcu_ststx_testfail[6]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.ststx1[0] -val `CPU.mcu3.fbdic.fsr1_mcu_ststx_testfail[7]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.ststx2[0] -val `CPU.mcu3.fbdic.fsr1_mcu_ststx_testfail[8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.ststx3[0] -val `CPU.mcu3.fbdic.fsr1_mcu_ststx_testfail[9]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// Serdes Transmitter Receiver Differential Pair Inversion

// Now for MCU0:  FRS0:  Lets do RX first 4 ports (INVPAIR)

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgrx0[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[0]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgrx1[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[1]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgrx2[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[2]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgrx3[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[3]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// Now for TX first 4 ports (INVPAIR)
/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx0[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[28]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx1[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[29]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx2[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[30]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx3[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[31]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// second serdes macro: RX ports 4-9, TX ports 4-5 (INVPAIR)
/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx0[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[4]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx1[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[5]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx2[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[6]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx3[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[7]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx4[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx5[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[9]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgtx0[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[32]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgtx1[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[33]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

//  Now third serdes macro: RX ports 10-13, TX ports 6-9

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgrx0[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[10]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgrx1[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[11]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgrx2[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgrx3[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[13]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx0[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[34]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx1[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[35]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx2[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[36]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx3[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[37]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// Now for FSR1
// first serdes macro: rx ports 0-3, tx ports 0-3


/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgrx0[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[14]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgrx1[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[15]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgrx2[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgrx3[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[17]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// Now for TX first 4 ports (INVPAIR)
/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx0[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[38]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx1[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[39]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx2[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[40]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx3[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[41]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// second serdes macro: RX ports 4-9, TX ports 4-5 (INVPAIR)
/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx0[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[18]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx1[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[19]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx2[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[20]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx3[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[21]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx4[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[22]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx5[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[23]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgtx0[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[42]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgtx1[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[43]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

//  Now third serdes macro: RX ports 10-13, TX ports 6-9

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgrx0[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[24]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgrx1[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[25]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgrx2[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[26]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgrx3[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[27]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx0[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[44]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx1[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[45]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx2[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[46]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx3[7] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_invert[47]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU 1 *******

// Now for MCU1:  FRS2:  Lets do RX first 4 ports (INVPAIR)

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgrx0[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[0]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgrx1[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[1]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgrx2[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[2]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgrx3[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[3]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */


// Now for TX first 4 ports (INVPAIR)
/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx0[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[28]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx1[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[29]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx2[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[30]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx3[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[31]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// second serdes macro: RX ports 4-9, TX ports 4-5 (INVPAIR)
/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx0[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[4]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx1[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[5]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx2[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[6]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx3[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[7]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx4[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx5[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[9]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgtx0[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[32]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgtx1[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[33]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

//  Now third serdes macro: RX ports 10-13, TX ports 6-9

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgrx0[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[10]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgrx1[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[11]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgrx2[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgrx3[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[13]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx0[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[34]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx1[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[35]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx2[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[36]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx3[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[37]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// Now for FSR3
// first serdes macro: rx ports 0-3, tx ports 0-3


/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgrx0[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[14]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgrx1[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[15]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgrx2[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgrx3[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[17]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */


// Now for TX first 4 ports (INVPAIR)
/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx0[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[38]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx1[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[39]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx2[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[40]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx3[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[41]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// second serdes macro: RX ports 4-9, TX ports 4-5 (INVPAIR)
/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx0[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[18]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx1[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[19]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx2[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[20]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx3[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[21]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx4[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[22]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx5[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[23]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgtx0[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[42]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgtx1[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[43]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

//  Now third serdes macro: RX ports 10-13, TX ports 6-9

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgrx0[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[24]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgrx1[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[25]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgrx2[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[26]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgrx3[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[27]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx0[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[44]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx1[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[45]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx2[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[46]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx3[7] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_invert[47]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */


// MCU 2 *******

// Now for MCU2:  FRS4:  Lets do RX first 4 ports (INVPAIR)

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgrx0[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[0]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgrx1[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[1]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgrx2[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[2]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgrx3[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[3]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */


// Now for TX first 4 ports (INVPAIR)
/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx0[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[28]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx1[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[29]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx2[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[30]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx3[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[31]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// second serdes macro: RX ports 4-9, TX ports 4-5 (INVPAIR)
/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx0[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[4]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx1[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[5]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx2[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[6]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx3[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[7]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx4[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx5[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[9]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgtx0[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[32]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgtx1[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[33]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

//  Now third serdes macro: RX ports 10-13, TX ports 6-9

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgrx0[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[10]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgrx1[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[11]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgrx2[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgrx3[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[13]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx0[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[34]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx1[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[35]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx2[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[36]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx3[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[37]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// Now for FSR5
// first serdes macro: rx ports 0-3, tx ports 0-3


/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgrx0[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[14]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgrx1[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[15]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgrx2[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgrx3[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[17]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */


// Now for TX first 4 ports (INVPAIR)
/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx0[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[38]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx1[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[39]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx2[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[40]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx3[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[41]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// second serdes macro: RX ports 4-9, TX ports 4-5 (INVPAIR)
/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx0[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[18]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx1[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[19]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx2[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[20]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx3[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[21]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx4[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[22]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx5[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[23]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgtx0[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[42]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgtx1[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[43]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

//  Now third serdes macro: RX ports 10-13, TX ports 6-9

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgrx0[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[24]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgrx1[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[25]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgrx2[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[26]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgrx3[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[27]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx0[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[44]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx1[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[45]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx2[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[46]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx3[7] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_invert[47]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */


// MCU 3 *******

// Now for MCU3:  FRS2:  Lets do RX first 4 ports (INVPAIR)

// FSR6

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgrx0[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[0]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgrx1[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[1]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgrx2[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[2]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgrx3[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[3]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */


// Now for TX first 4 ports (INVPAIR)
/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx0[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[28]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx1[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[29]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx2[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[30]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx3[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[31]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */


// second serdes macro: RX ports 4-9, TX ports 4-5 (INVPAIR)
/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx0[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[4]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx1[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[5]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx2[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[6]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx3[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[7]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx4[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx5[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[9]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgtx0[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[32]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgtx1[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[33]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

//  Now third serdes macro: RX ports 10-13, TX ports 6-9

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgrx0[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[10]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgrx1[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[11]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgrx2[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgrx3[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[13]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx0[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[34]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx1[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[35]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx2[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[36]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx3[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[37]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */


// Now for FSR7
// first serdes macro: rx ports 0-3, tx ports 0-3


/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgrx0[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[14]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgrx1[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[15]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgrx2[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgrx3[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[17]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */


// Now for TX first 4 ports (INVPAIR)
/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx0[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[38]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx1[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[39]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx2[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[40]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx3[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[41]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */


// second serdes macro: RX ports 4-9, TX ports 4-5 (INVPAIR)
/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx0[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[18]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx1[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[19]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx2[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[20]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx3[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[21]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx4[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[22]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx5[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[23]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgtx0[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[42]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgtx1[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[43]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */


//  Now third serdes macro: RX ports 10-13, TX ports 6-9

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgrx0[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[24]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgrx1[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[25]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgrx2[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[26]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgrx3[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[27]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx0[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[44]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx1[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[45]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx2[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[46]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx3[7] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_invert[47]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */


// Serdes Test Config Register

// MCU0 FSR0


/* 0in value -var `CPU.fsr_left.fsr0_b8_0.testcfg[10:0] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[10:0]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.testcfg[14:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[13:11] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.testcfg[10:0] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[10:0]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.testcfg[14:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[13:11] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.testcfg[10:0] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[10:0]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.testcfg[14:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[13:11] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1
/* 0in value -var `CPU.fsr_left.fsr1_b8_0.testcfg[10:0] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[24:14]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.testcfg[14:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[27:25] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.testcfg[10:0] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[24:14]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.testcfg[14:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[27:25] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.testcfg[10:0] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[24:14]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.testcfg[14:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[27:25] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// MCU1 FSR2
/* 0in value -var `CPU.fsr_left.fsr2_b8_0.testcfg[10:0] -val   `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[10:0]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.testcfg[14:12] -val  `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[13:11] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.testcfg[10:0] -val     `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[10:0]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.testcfg[14:12] -val    `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[13:11] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.testcfg[10:0] -val   `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[10:0]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.testcfg[14:12] -val  `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[13:11] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3
/* 0in value -var `CPU.fsr_left.fsr3_b8_0.testcfg[10:0] -val   `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[24:14]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.testcfg[14:12] -val  `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[27:25] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.testcfg[10:0] -val     `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[24:14]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.testcfg[14:12] -val    `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[27:25] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.testcfg[10:0] -val   `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[24:14]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.testcfg[14:12] -val  `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[27:25] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */


// MCU2 FSR4
/* 0in value -var `CPU.fsr_right.fsr4_b8_0.testcfg[10:0] -val   `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[10:0]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.testcfg[14:12] -val  `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[13:11] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.testcfg[10:0] -val     `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[10:0]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.testcfg[14:12] -val    `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[13:11] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.testcfg[10:0] -val   `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[10:0]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.testcfg[14:12] -val  `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[13:11] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5
/* 0in value -var `CPU.fsr_right.fsr5_b8_0.testcfg[10:0] -val   `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[24:14]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.testcfg[14:12] -val  `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[27:25] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.testcfg[10:0] -val     `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[24:14]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.testcfg[14:12] -val    `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[27:25] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.testcfg[10:0] -val   `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[24:14]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.testcfg[14:12] -val  `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[27:25] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6
/* 0in value -var `CPU.fsr_right.fsr6_b8_0.testcfg[10:0] -val   `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[24:14]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.testcfg[14:12] -val  `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[27:25] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.testcfg[10:0] -val     `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[24:14]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.testcfg[14:12] -val    `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[27:25] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.testcfg[10:0] -val   `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[24:14]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.testcfg[14:12] -val  `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[27:25] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7
/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.testcfg[10:0] -val   `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[24:14]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.testcfg[14:12] -val  `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[27:25] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.testcfg[10:0] -val     `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[24:14]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.testcfg[14:12] -val    `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[27:25] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.testcfg[10:0] -val   `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[24:14]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.testcfg[14:12] -val  `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[27:25] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// hunter

// Mcu SERDES Configuration Bus [29:0]

// MCU0 FSR0 SERDES 0 PLL
/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgpll[9:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[1:0]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgpll[4:1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[5:2]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 0 Lane 0  RX


/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgrx0[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgrx0[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgrx0[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 0 Lane 0  TX


/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx0[16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx0[15:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx0[11:9] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx0[8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx0[6:5] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// MCU0 FSR0 SERDES 0 Lane 1 RX

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgrx1[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgrx1[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgrx1[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 0 Lane 0  TX

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx1[16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx1[15:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx1[11:9] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx1[8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx1[6:5] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// MCU0 FSR0 SERDES 0 Lane 2 RX

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgrx2[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgrx2[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgrx2[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 0 Lane 2  TX

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx2[16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx2[15:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx2[11:9] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx2[8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx2[6:5] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 0 Lane 3 RX

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgrx3[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgrx3[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgrx3[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 0 Lane 3  TX

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx3[16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx3[15:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx3[11:9] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx3[8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx3[6:5] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 1 PLL
/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgpll[9:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[1:0]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgpll[4:1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[5:2]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 1 Lane 0 RX

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx0[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx0[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx0[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 1 Lane 1 RX

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx1[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx1[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx1[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 1 Lane 2 RX

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx2[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx2[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx2[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 1 Lane 3 RX

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx3[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx3[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx3[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 1 Lane 4 RX

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx4[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx4[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx4[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 1 Lane 5 RX

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx5[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx5[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx5[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 1 Lane 0  TX

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgtx0[16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgtx0[15:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgtx0[11:9] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgtx0[8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgtx0[6:5] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// MCU0 FSR0 SERDES 1 Lane 1  TX

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgtx1[16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgtx1[15:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgtx1[11:9] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgtx1[8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgtx1[6:5] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 2 PLL
/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgpll[9:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[1:0]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgpll[4:1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[5:2]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 2 Lane 0  RX

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgrx0[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgrx0[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgrx0[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 2 Lane 0  TX

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx0[16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx0[15:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx0[11:9] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx0[8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx0[6:5] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// MCU0 FSR0 SERDES 2 Lane 1 RX

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgrx1[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgrx1[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgrx1[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 2 Lane 1  TX

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx1[16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx1[15:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx1[11:9] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx1[8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx1[6:5] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// MCU0 FSR0 SERDES 2 Lane 2 RX

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgrx2[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgrx2[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgrx2[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 2 Lane 2  TX

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx2[16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx2[15:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx2[11:9] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx2[8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx2[6:5] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 2 Lane 3 RX

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgrx3[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgrx3[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgrx3[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 2 Lane 3  TX

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx3[16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx3[15:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx3[11:9] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx3[8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx3[6:5] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// MCU0 FSR1 SERDES 0 PLL
/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgpll[9:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[1:0]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgpll[4:1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[5:2]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 0 Lane 0  RX

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgrx0[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgrx0[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgrx0[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 0 Lane 0  TX

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx0[16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx0[15:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx0[11:9] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx0[8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx0[6:5] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// MCU0 FSR1 SERDES 0 Lane 1 RX

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgrx1[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgrx1[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgrx1[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 0 Lane 0  TX

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx1[16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx1[15:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx1[11:9] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx1[8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx1[6:5] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// MCU0 FSR1 SERDES 0 Lane 2 RX

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgrx2[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgrx2[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgrx2[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 0 Lane 2  TX

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx2[16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx2[15:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx2[11:9] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx2[8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx2[6:5] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 0 Lane 3 RX

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgrx3[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgrx3[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgrx3[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 0 Lane 3  TX

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx3[16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx3[15:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx3[11:9] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx3[8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx3[6:5] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 1 PLL
/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgpll[9:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[1:0]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgpll[4:1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[5:2]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 1 Lane 0 RX

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx0[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx0[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx0[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 1 Lane 1 RX

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx1[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx1[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx1[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 1 Lane 2 RX

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx2[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx2[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx2[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 1 Lane 3 RX

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx3[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx3[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx3[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 1 Lane 4 RX

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx4[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx4[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx4[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 1 Lane 5 RX

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx5[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx5[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx5[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 1 Lane 0  TX

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgtx0[16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgtx0[15:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgtx0[11:9] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgtx0[8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgtx0[6:5] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// MCU0 FSR1 SERDES 1 Lane 1  TX

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgtx1[16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgtx1[15:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgtx1[11:9] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgtx1[8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgtx1[6:5] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 2 PLL
/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgpll[9:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[1:0]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgpll[4:1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[5:2]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 2 Lane 0  RX

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgrx0[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgrx0[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgrx0[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 2 Lane 0  TX

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx0[16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx0[15:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx0[11:9] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx0[8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx0[6:5] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// MCU0 FSR1 SERDES 2 Lane 1 RX

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgrx1[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgrx1[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgrx1[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 2 Lane 1  TX

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx1[16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx1[15:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx1[11:9] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx1[8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx1[6:5] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// MCU0 FSR1 SERDES 2 Lane 2 RX

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgrx2[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgrx2[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgrx2[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 2 Lane 2  TX

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx2[16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx2[15:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx2[11:9] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx2[8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx2[6:5] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 2 Lane 3 RX

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgrx3[22:19] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgrx3[18:16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgrx3[10:8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 2 Lane 3  TX

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx3[16] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx3[15:12] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx3[11:9] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx3[8] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx3[6:5] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 0 PLL
/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgpll[9:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[1:0]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgpll[4:1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[5:2]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 0 Lane 0  RX

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgrx0[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgrx0[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgrx0[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 0 Lane 0  TX

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx0[16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx0[15:12] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx0[11:9] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx0[8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx0[6:5] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */


// MCU1 FSR2 SERDES 0 Lane 1 RX

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgrx1[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgrx1[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgrx1[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 0 Lane 0  TX

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx1[16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx1[15:12] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx1[11:9] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx1[8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx1[6:5] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */


// MCU1 FSR2 SERDES 0 Lane 2 RX

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgrx2[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgrx2[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgrx2[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 0 Lane 2  TX

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx2[16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx2[15:12] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx2[11:9] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx2[8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx2[6:5] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 0 Lane 3 RX

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgrx3[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgrx3[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgrx3[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 0 Lane 3  TX

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx3[16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx3[15:12] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx3[11:9] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx3[8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx3[6:5] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 1 PLL
/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgpll[9:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[1:0]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgpll[4:1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[5:2]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 1 Lane 0 RX

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx0[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx0[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx0[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 1 Lane 1 RX

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx1[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx1[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx1[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 1 Lane 2 RX

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx2[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx2[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx2[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 1 Lane 3 RX

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx3[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx3[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx3[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 1 Lane 4 RX

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx4[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx4[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx4[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 1 Lane 5 RX

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx5[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx5[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx5[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 1 Lane 0  TX

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgtx0[16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgtx0[15:12] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgtx0[11:9] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgtx0[8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgtx0[6:5] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */


// MCU1 FSR2 SERDES 1 Lane 1  TX

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgtx1[16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgtx1[15:12] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgtx1[11:9] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgtx1[8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgtx1[6:5] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 2 PLL
/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgpll[9:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[1:0]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgpll[4:1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[5:2]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 2 Lane 0  RX

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgrx0[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgrx0[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgrx0[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 2 Lane 0  TX

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx0[16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx0[15:12] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx0[11:9] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx0[8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx0[6:5] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */


// MCU1 FSR2 SERDES 2 Lane 1 RX

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgrx1[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgrx1[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgrx1[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 2 Lane 1  TX

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx1[16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx1[15:12] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx1[11:9] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx1[8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx1[6:5] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */


// MCU1 FSR2 SERDES 2 Lane 2 RX

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgrx2[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgrx2[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgrx2[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 2 Lane 2  TX

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx2[16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx2[15:12] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx2[11:9] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx2[8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx2[6:5] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 2 Lane 3 RX

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgrx3[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgrx3[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgrx3[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 2 Lane 3  TX

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx3[16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx3[15:12] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx3[11:9] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx3[8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx3[6:5] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */


// MCU1 FSR3 SERDES 0 PLL
/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgpll[9:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[1:0]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgpll[4:1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[5:2]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 0 Lane 0  RX

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgrx0[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgrx0[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgrx0[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 0 Lane 0  TX

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx0[16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx0[15:12] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx0[11:9] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx0[8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx0[6:5] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */


// MCU1 FSR3 SERDES 0 Lane 1 RX

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgrx1[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgrx1[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgrx1[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 0 Lane 0  TX

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx1[16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx1[15:12] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx1[11:9] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx1[8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx1[6:5] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */


// MCU1 FSR3 SERDES 0 Lane 2 RX

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgrx2[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgrx2[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgrx2[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 0 Lane 2  TX

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx2[16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx2[15:12] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx2[11:9] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx2[8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx2[6:5] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 0 Lane 3 RX

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgrx3[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgrx3[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgrx3[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 0 Lane 3  TX

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx3[16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx3[15:12] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx3[11:9] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx3[8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx3[6:5] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 1 PLL
/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgpll[9:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[1:0]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgpll[4:1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[5:2]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 1 Lane 0 RX

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx0[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx0[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx0[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 1 Lane 1 RX

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx1[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx1[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx1[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 1 Lane 2 RX

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx2[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx2[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx2[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 1 Lane 3 RX

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx3[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx3[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx3[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 1 Lane 4 RX

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx4[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx4[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx4[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 1 Lane 5 RX

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx5[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx5[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx5[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 1 Lane 0  TX

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgtx0[16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgtx0[15:12] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgtx0[11:9] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgtx0[8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgtx0[6:5] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */


// MCU1 FSR3 SERDES 1 Lane 1  TX

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgtx1[16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgtx1[15:12] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgtx1[11:9] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgtx1[8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgtx1[6:5] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 2 PLL
/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgpll[9:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[1:0]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgpll[4:1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[5:2]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 2 Lane 0  RX

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgrx0[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgrx0[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgrx0[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 2 Lane 0  TX

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx0[16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx0[15:12] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx0[11:9] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx0[8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx0[6:5] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */


// MCU1 FSR3 SERDES 2 Lane 1 RX

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgrx1[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgrx1[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgrx1[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 2 Lane 1  TX

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx1[16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx1[15:12] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx1[11:9] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx1[8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx1[6:5] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */


// MCU1 FSR3 SERDES 2 Lane 2 RX

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgrx2[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgrx2[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgrx2[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 2 Lane 2  TX

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx2[16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx2[15:12] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx2[11:9] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx2[8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx2[6:5] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 2 Lane 3 RX

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgrx3[22:19] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgrx3[18:16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgrx3[10:8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 2 Lane 3  TX

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx3[16] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx3[15:12] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx3[11:9] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx3[8] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx3[6:5] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */


// MCU2 FSR4 SERDES 0 PLL
/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgpll[9:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[1:0]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgpll[4:1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[5:2]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 0 Lane 0  RX

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgrx0[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgrx0[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgrx0[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 0 Lane 0  TX

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx0[16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx0[15:12] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx0[11:9] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx0[8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx0[6:5] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */


// MCU2 FSR4 SERDES 0 Lane 1 RX

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgrx1[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgrx1[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgrx1[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 0 Lane 0  TX

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx1[16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx1[15:12] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx1[11:9] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx1[8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx1[6:5] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */


// MCU2 FSR4 SERDES 0 Lane 2 RX

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgrx2[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgrx2[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgrx2[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 0 Lane 2  TX

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx2[16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx2[15:12] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx2[11:9] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx2[8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx2[6:5] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 0 Lane 3 RX

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgrx3[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgrx3[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgrx3[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 0 Lane 3  TX

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx3[16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx3[15:12] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx3[11:9] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx3[8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx3[6:5] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 1 PLL
/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgpll[9:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[1:0]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgpll[4:1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[5:2]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 1 Lane 0 RX

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx0[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx0[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx0[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 1 Lane 1 RX

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx1[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx1[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx1[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 1 Lane 2 RX

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx2[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx2[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx2[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 1 Lane 3 RX

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx3[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx3[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx3[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 1 Lane 4 RX

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx4[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx4[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx4[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 1 Lane 5 RX

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx5[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx5[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx5[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 1 Lane 0  TX

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgtx0[16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgtx0[15:12] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgtx0[11:9] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgtx0[8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgtx0[6:5] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */


// MCU2 FSR4 SERDES 1 Lane 1  TX

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgtx1[16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgtx1[15:12] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgtx1[11:9] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgtx1[8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgtx1[6:5] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 2 PLL
/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgpll[9:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[1:0]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgpll[4:1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[5:2]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 2 Lane 0  RX

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgrx0[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgrx0[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgrx0[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 2 Lane 0  TX

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx0[16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx0[15:12] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx0[11:9] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx0[8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx0[6:5] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */


// MCU2 FSR4 SERDES 2 Lane 1 RX

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgrx1[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgrx1[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgrx1[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 2 Lane 1  TX

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx1[16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx1[15:12] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx1[11:9] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx1[8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx1[6:5] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */


// MCU2 FSR4 SERDES 2 Lane 2 RX

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgrx2[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgrx2[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgrx2[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 2 Lane 2  TX

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx2[16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx2[15:12] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx2[11:9] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx2[8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx2[6:5] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 2 Lane 3 RX

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgrx3[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgrx3[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgrx3[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 2 Lane 3  TX

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx3[16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx3[15:12] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx3[11:9] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx3[8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx3[6:5] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */


// MCU2 FSR5 SERDES 0 PLL
/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgpll[9:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[1:0]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgpll[4:1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[5:2]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 0 Lane 0  RX

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgrx0[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgrx0[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgrx0[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 0 Lane 0  TX

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx0[16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx0[15:12] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx0[11:9] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx0[8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx0[6:5] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */


// MCU2 FSR5 SERDES 0 Lane 1 RX

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgrx1[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgrx1[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgrx1[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 0 Lane 0  TX

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx1[16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx1[15:12] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx1[11:9] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx1[8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx1[6:5] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */


// MCU2 FSR5 SERDES 0 Lane 2 RX

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgrx2[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgrx2[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgrx2[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 0 Lane 2  TX

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx2[16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx2[15:12] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx2[11:9] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx2[8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx2[6:5] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 0 Lane 3 RX

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgrx3[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgrx3[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgrx3[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 0 Lane 3  TX

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx3[16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx3[15:12] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx3[11:9] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx3[8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx3[6:5] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 1 PLL
/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgpll[9:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[1:0]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgpll[4:1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[5:2]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 1 Lane 0 RX

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx0[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx0[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx0[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 1 Lane 1 RX

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx1[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx1[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx1[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 1 Lane 2 RX

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx2[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx2[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx2[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 1 Lane 3 RX

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx3[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx3[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx3[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 1 Lane 4 RX

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx4[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx4[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx4[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 1 Lane 5 RX

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx5[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx5[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx5[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 1 Lane 0  TX

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgtx0[16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgtx0[15:12] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgtx0[11:9] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgtx0[8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgtx0[6:5] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */


// MCU2 FSR5 SERDES 1 Lane 1  TX

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgtx1[16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgtx1[15:12] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgtx1[11:9] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgtx1[8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgtx1[6:5] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 2 PLL
/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgpll[9:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[1:0]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgpll[4:1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[5:2]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 2 Lane 0  RX

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgrx0[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgrx0[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgrx0[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 2 Lane 0  TX

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx0[16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx0[15:12] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx0[11:9] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx0[8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx0[6:5] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */


// MCU2 FSR5 SERDES 2 Lane 1 RX

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgrx1[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgrx1[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgrx1[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 2 Lane 1  TX

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx1[16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx1[15:12] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx1[11:9] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx1[8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx1[6:5] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */


// MCU2 FSR5 SERDES 2 Lane 2 RX

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgrx2[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgrx2[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgrx2[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 2 Lane 2  TX

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx2[16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx2[15:12] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx2[11:9] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx2[8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx2[6:5] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 2 Lane 3 RX

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgrx3[22:19] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgrx3[18:16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgrx3[10:8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 2 Lane 3  TX

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx3[16] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx3[15:12] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx3[11:9] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx3[8] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx3[6:5] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */


// MCU3 FSR6 SERDES 0 PLL
/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgpll[9:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[1:0]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgpll[4:1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[5:2]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 0 Lane 0  RX

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgrx0[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgrx0[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgrx0[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 0 Lane 0  TX

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx0[16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx0[15:12] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx0[11:9] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx0[8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx0[6:5] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */


// MCU3 FSR6 SERDES 0 Lane 1 RX

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgrx1[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgrx1[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgrx1[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 0 Lane 0  TX

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx1[16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx1[15:12] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx1[11:9] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx1[8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx1[6:5] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */


// MCU3 FSR6 SERDES 0 Lane 2 RX

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgrx2[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgrx2[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgrx2[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 0 Lane 2  TX

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx2[16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx2[15:12] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx2[11:9] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx2[8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx2[6:5] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 0 Lane 3 RX

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgrx3[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgrx3[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgrx3[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 0 Lane 3  TX

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx3[16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx3[15:12] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx3[11:9] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx3[8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx3[6:5] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 1 PLL
/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgpll[9:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[1:0]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgpll[4:1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[5:2]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 1 Lane 0 RX

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx0[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx0[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx0[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 1 Lane 1 RX

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx1[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx1[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx1[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 1 Lane 2 RX

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx2[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx2[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx2[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 1 Lane 3 RX

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx3[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx3[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx3[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 1 Lane 4 RX

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx4[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx4[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx4[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 1 Lane 5 RX

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx5[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx5[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx5[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 1 Lane 0  TX

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgtx0[16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgtx0[15:12] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgtx0[11:9] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgtx0[8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgtx0[6:5] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */


// MCU3 FSR6 SERDES 1 Lane 1  TX

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgtx1[16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgtx1[15:12] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgtx1[11:9] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgtx1[8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgtx1[6:5] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 2 PLL
/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgpll[9:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[1:0]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgpll[4:1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[5:2]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 2 Lane 0  RX

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgrx0[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgrx0[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgrx0[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 2 Lane 0  TX

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx0[16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx0[15:12] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx0[11:9] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx0[8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx0[6:5] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */


// MCU3 FSR6 SERDES 2 Lane 1 RX

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgrx1[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgrx1[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgrx1[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 2 Lane 1  TX

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx1[16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx1[15:12] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx1[11:9] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx1[8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx1[6:5] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */


// MCU3 FSR6 SERDES 2 Lane 2 RX

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgrx2[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgrx2[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgrx2[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 2 Lane 2  TX

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx2[16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx2[15:12] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx2[11:9] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx2[8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx2[6:5] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 2 Lane 3 RX

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgrx3[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgrx3[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgrx3[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 2 Lane 3  TX

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx3[16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx3[15:12] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx3[11:9] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx3[8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx3[6:5] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */


// MCU3 FSR7 SERDES 0 PLL
/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgpll[9:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[1:0]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgpll[4:1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[5:2]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 0 Lane 0  RX

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgrx0[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgrx0[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgrx0[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 0 Lane 0  TX

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx0[16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx0[15:12] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx0[11:9] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx0[8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx0[6:5] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */


// MCU3 FSR7 SERDES 0 Lane 1 RX

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgrx1[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgrx1[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgrx1[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 0 Lane 0  TX

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx1[16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx1[15:12] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx1[11:9] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx1[8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx1[6:5] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */


// MCU3 FSR7 SERDES 0 Lane 2 RX

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgrx2[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgrx2[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgrx2[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 0 Lane 2  TX

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx2[16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx2[15:12] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx2[11:9] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx2[8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx2[6:5] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 0 Lane 3 RX

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgrx3[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgrx3[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgrx3[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 0 Lane 3  TX

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx3[16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx3[15:12] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx3[11:9] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx3[8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx3[6:5] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 1 PLL
/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgpll[9:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[1:0]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgpll[4:1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[5:2]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 1 Lane 0 RX

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx0[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx0[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx0[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 1 Lane 1 RX

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx1[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx1[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx1[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 1 Lane 2 RX

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx2[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx2[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx2[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 1 Lane 3 RX

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx3[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx3[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx3[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 1 Lane 4 RX

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx4[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx4[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx4[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 1 Lane 5 RX

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx5[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx5[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx5[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 1 Lane 0  TX

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgtx0[16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgtx0[15:12] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgtx0[11:9] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgtx0[8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgtx0[6:5] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */


// MCU3 FSR7 SERDES 1 Lane 1  TX

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgtx1[16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgtx1[15:12] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgtx1[11:9] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgtx1[8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgtx1[6:5] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 2 PLL
/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgpll[9:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[1:0]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgpll[4:1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[5:2]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 2 Lane 0  RX

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgrx0[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgrx0[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgrx0[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 2 Lane 0  TX

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx0[16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx0[15:12] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx0[11:9] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx0[8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx0[6:5] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */


// MCU3 FSR7 SERDES 2 Lane 1 RX

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgrx1[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgrx1[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgrx1[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 2 Lane 1  TX

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx1[16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx1[15:12] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx1[11:9] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx1[8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx1[6:5] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */


// MCU3 FSR7 SERDES 2 Lane 2 RX

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgrx2[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgrx2[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgrx2[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 2 Lane 2  TX

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx2[16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx2[15:12] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx2[11:9] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx2[8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx2[6:5] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 2 Lane 3 RX

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgrx3[22:19] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[11:8]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgrx3[18:16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[14:12]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgrx3[10:8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[18:16]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 2 Lane 3  TX

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx3[16] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[19]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx3[15:12] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[23:20]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx3[11:9] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[26:24]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx3[8] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[27]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx3[6:5] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_config[29:28]
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// Additional for ENTEST

// MCU0 FSR0 SERDES 0 RX

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgrx0[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgrx1[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgrx2[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgrx3[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 0 TX

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx0[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx1[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx2[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_0.cfgtx3[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 1 RX

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx0[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx1[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx2[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx3[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx4[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgrx5[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 1 TX

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgtx0[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_a8.cfgtx1[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 2 RX

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgrx0[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgrx1[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgrx2[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgrx3[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR0 SERDES 2 TX

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx0[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx1[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx2[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr0_b8_1.cfgtx3[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */
 

// MCU0 FSR1 SERDES 0 RX

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgrx0[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgrx1[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgrx2[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgrx3[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 0 TX

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx0[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx1[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx2[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_0.cfgtx3[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 1 RX

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx0[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx1[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx2[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx3[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx4[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgrx5[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 1 TX

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgtx0[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_a8.cfgtx1[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 2 RX

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgrx0[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgrx1[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgrx2[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgrx3[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

// MCU0 FSR1 SERDES 2 TX

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx0[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx1[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx2[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr1_b8_1.cfgtx3[1] -val `CPU.mcu0.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu0.dr_gclk -reset  tb_top.reset  */


// MCU1 FSR2 SERDES 0 RX

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgrx0[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgrx1[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgrx2[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgrx3[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 0 TX

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx0[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx1[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx2[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_0.cfgtx3[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 1 RX

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx0[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx1[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx2[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx3[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx4[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgrx5[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 1 TX

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgtx0[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_a8.cfgtx1[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 2 RX

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgrx0[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgrx1[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgrx2[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgrx3[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR2 SERDES 2 TX

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx0[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx1[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx2[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr2_b8_1.cfgtx3[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */
 

// MCU1 FSR3 SERDES 0 RX

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgrx0[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgrx1[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgrx2[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgrx3[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 0 TX

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx0[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx1[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx2[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_0.cfgtx3[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 1 RX

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx0[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx1[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx2[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx3[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx4[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgrx5[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 1 TX

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgtx0[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_a8.cfgtx1[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 2 RX

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgrx0[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgrx1[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgrx2[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgrx3[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

// MCU1 FSR3 SERDES 2 TX

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx0[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx1[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx2[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_left.fsr3_b8_1.cfgtx3[1] -val `CPU.mcu1.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu1.dr_gclk -reset  tb_top.reset  */


// MCU2 FSR4 SERDES 0 RX

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgrx0[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgrx1[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgrx2[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgrx3[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 0 TX

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx0[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx1[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx2[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_0.cfgtx3[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 1 RX

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx0[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx1[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx2[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx3[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx4[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgrx5[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 1 TX

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgtx0[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_a8.cfgtx1[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 2 RX

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgrx0[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgrx1[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgrx2[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgrx3[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR4 SERDES 2 TX

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx0[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx1[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx2[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr4_b8_1.cfgtx3[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */
 

// MCU2 FSR5 SERDES 0 RX

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgrx0[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgrx1[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgrx2[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgrx3[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 0 TX

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx0[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx1[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx2[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_0.cfgtx3[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 1 RX

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx0[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx1[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx2[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx3[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx4[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgrx5[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 1 TX

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgtx0[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_a8.cfgtx1[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 2 RX

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgrx0[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgrx1[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgrx2[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgrx3[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

// MCU2 FSR5 SERDES 2 TX

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx0[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx1[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx2[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr5_b8_1.cfgtx3[1] -val `CPU.mcu2.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu2.dr_gclk -reset  tb_top.reset  */


// MCU3 FSR6 SERDES 0 RX

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgrx0[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgrx1[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgrx2[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgrx3[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 0 TX

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx0[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx1[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx2[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_0.cfgtx3[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 1 RX

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx0[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx1[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx2[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx3[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx4[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgrx5[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 1 TX

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgtx0[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_a8.cfgtx1[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 2 RX

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgrx0[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgrx1[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgrx2[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgrx3[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[28] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR6 SERDES 2 TX

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx0[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx1[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx2[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_right.fsr6_b8_1.cfgtx3[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[30] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */


// MCU3 FSR7 SERDES 0 RX

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgrx0[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgrx1[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgrx2[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgrx3[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 0 TX

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx0[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx1[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx2[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_0.cfgtx3[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 1 RX

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx0[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx1[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx2[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx3[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx4[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgrx5[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 1 TX

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgtx0[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_a8.cfgtx1[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 2 RX

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgrx0[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgrx1[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgrx2[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgrx3[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[29] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

// MCU3 FSR7 SERDES 2 TX

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx0[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx1[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx2[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */

/* 0in value -var `CPU.fsr_bottom.fsr7_b8_1.cfgtx3[1] -val `CPU.mcu3.fbdic.fbdtm.fbdic_sds_testcfg[31] 
   -active 1'b1 -clock `CPU.mcu3.dr_gclk -reset  tb_top.reset  */


// SERDES0

//  .cfgrx0

/* 0in value -var `CPU.psr.serdes_0.cfgrx0[25:24] -val `CPU.peu.peu_psr_rx_lane_ctl_0[15:14]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx0[22:19] -val `CPU.peu.peu_psr_rx_lane_ctl_0[13:10]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx0[18:16] -val `CPU.peu.peu_psr_rx_lane_ctl_0[9:7]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx0[15:14] -val `CPU.peu.peu_psr_rx_lane_ctl_0[6:5]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx0[12] -val `CPU.peu.peu_psr_rx_lane_ctl_0[1]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx0[10:8] -val `CPU.peu.peu_psr_rx_lane_ctl_0[4:2]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx0[7] -val `CPU.peu.peu_psr_invpair_b0sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx0[6:5] -val `CPU.dmu.ilu.cib.ilu_diagnos_rate_scale_hw_read[1:0]
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx0[1] -val `CPU.peu.peu_psr_rx_lane_ctl_0[0]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx0[0] -val `CPU.dmu.ilu.cib.dmu_psr_rx_en_b0_sds0
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

//  .cfgrx1

/* 0in value -var `CPU.psr.serdes_0.cfgrx1[25:24] -val `CPU.peu.peu_psr_rx_lane_ctl_1[15:14]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx1[22:19] -val `CPU.peu.peu_psr_rx_lane_ctl_1[13:10]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx1[18:16] -val `CPU.peu.peu_psr_rx_lane_ctl_1[9:7]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx1[15:14] -val `CPU.peu.peu_psr_rx_lane_ctl_1[6:5]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx1[12] -val `CPU.peu.peu_psr_rx_lane_ctl_1[1]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx1[10:8] -val `CPU.peu.peu_psr_rx_lane_ctl_1[4:2]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx1[7] -val `CPU.peu.peu_psr_invpair_b1sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx1[6:5] -val `CPU.dmu.ilu.cib.ilu_diagnos_rate_scale_hw_read[1:0]
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx1[1] -val `CPU.peu.peu_psr_rx_lane_ctl_1[0]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx1[0] -val `CPU.dmu.ilu.cib.dmu_psr_rx_en_b1_sds0
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

//  .cfgrx2

/* 0in value -var `CPU.psr.serdes_0.cfgrx2[25:24] -val `CPU.peu.peu_psr_rx_lane_ctl_2[15:14]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx2[22:19] -val `CPU.peu.peu_psr_rx_lane_ctl_2[13:10]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx2[18:16] -val `CPU.peu.peu_psr_rx_lane_ctl_2[9:7]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx2[15:14] -val `CPU.peu.peu_psr_rx_lane_ctl_2[6:5]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx2[12] -val `CPU.peu.peu_psr_rx_lane_ctl_2[1]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx2[10:8] -val `CPU.peu.peu_psr_rx_lane_ctl_2[4:2]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx2[7] -val `CPU.peu.peu_psr_invpair_b2sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx2[6:5] -val `CPU.dmu.ilu.cib.ilu_diagnos_rate_scale_hw_read[1:0]
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx2[1] -val `CPU.peu.peu_psr_rx_lane_ctl_2[0]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx2[0] -val `CPU.dmu.ilu.cib.dmu_psr_rx_en_b2_sds0
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

//  .cfgrx3

/* 0in value -var `CPU.psr.serdes_0.cfgrx3[25:24] -val `CPU.peu.peu_psr_rx_lane_ctl_3[15:14]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx3[22:19] -val `CPU.peu.peu_psr_rx_lane_ctl_3[13:10]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx3[18:16] -val `CPU.peu.peu_psr_rx_lane_ctl_3[9:7]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx3[15:14] -val `CPU.peu.peu_psr_rx_lane_ctl_3[6:5]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx3[12] -val `CPU.peu.peu_psr_rx_lane_ctl_3[1]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx3[10:8] -val `CPU.peu.peu_psr_rx_lane_ctl_3[4:2]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx3[7] -val `CPU.peu.peu_psr_invpair_b3sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx3[6:5] -val `CPU.dmu.ilu.cib.ilu_diagnos_rate_scale_hw_read[1:0]
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx3[1] -val `CPU.peu.peu_psr_rx_lane_ctl_3[0]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgrx3[0] -val `CPU.dmu.ilu.cib.dmu_psr_rx_en_b3_sds0
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

// .cfgtx0

/* 0in value -var `CPU.psr.serdes_0.cfgtx0[22:21] -val `CPU.peu.peu_psr_rdtct_b0sds0[1:0]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx0[20] -val `CPU.peu.peu_psr_enidl_b0sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx0[17] -val `CPU.peu.peu_psr_bstx_b0sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx0[15:12] -val `CPU.peu.peu_psr_tx_lane_ctl_0[9:6]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx0[11:9] -val `CPU.peu.peu_psr_tx_lane_ctl_0[5:3]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx0[8] -val `CPU.peu.peu_psr_tx_lane_ctl_0[2]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx0[7] -val `CPU.peu.peu_psr_tx_lane_ctl_0[1]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx0[6:5] -val `CPU.dmu.ilu.cib.ilu_diagnos_rate_scale_hw_read[1:0]
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx0[1] -val `CPU.peu.peu_psr_rx_lane_ctl_0[0]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx0[0] -val `CPU.dmu.dmu_psr_tx_en_b0_sds0
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

// .cfgtx1

/* 0in value -var `CPU.psr.serdes_0.cfgtx1[22:21] -val `CPU.peu.peu_psr_rdtct_b1sds0[1:0]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx1[20] -val `CPU.peu.peu_psr_enidl_b1sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx1[17] -val `CPU.peu.peu_psr_bstx_b1sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx1[15:12] -val `CPU.peu.peu_psr_tx_lane_ctl_1[9:6]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx1[11:9] -val `CPU.peu.peu_psr_tx_lane_ctl_1[5:3]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx1[8] -val `CPU.peu.peu_psr_tx_lane_ctl_1[2]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx1[7] -val `CPU.peu.peu_psr_tx_lane_ctl_1[1]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx1[6:5] -val `CPU.dmu.ilu.cib.ilu_diagnos_rate_scale_hw_read[1:0]
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx1[1] -val `CPU.peu.peu_psr_rx_lane_ctl_1[0]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx1[0] -val `CPU.dmu.ilu.cib.dmu_psr_tx_en_b1_sds0
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

// .cfgtx2

/* 0in value -var `CPU.psr.serdes_0.cfgtx2[22:21] -val `CPU.peu.peu_psr_rdtct_b2sds0[1:0]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx2[20] -val `CPU.peu.peu_psr_enidl_b2sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx2[17] -val `CPU.peu.peu_psr_bstx_b2sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx2[15:12] -val `CPU.peu.peu_psr_tx_lane_ctl_2[9:6]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx2[11:9] -val `CPU.peu.peu_psr_tx_lane_ctl_2[5:3]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx2[8] -val `CPU.peu.peu_psr_tx_lane_ctl_2[2]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx2[7] -val `CPU.peu.peu_psr_tx_lane_ctl_2[1]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx2[6:5] -val `CPU.dmu.ilu.cib.ilu_diagnos_rate_scale_hw_read[1:0]
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx2[1] -val `CPU.peu.peu_psr_rx_lane_ctl_2[0]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx2[0] -val `CPU.dmu.ilu.cib.dmu_psr_tx_en_b2_sds0
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

// .cfgtx3

/* 0in value -var `CPU.psr.serdes_0.cfgtx3[22:21] -val `CPU.peu.peu_psr_rdtct_b3sds0[1:0]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx3[20] -val `CPU.peu.peu_psr_enidl_b3sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx3[17] -val `CPU.peu.peu_psr_bstx_b3sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx3[15:12] -val `CPU.peu.peu_psr_tx_lane_ctl_3[9:6]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx3[11:9] -val `CPU.peu.peu_psr_tx_lane_ctl_3[5:3]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx3[8] -val `CPU.peu.peu_psr_tx_lane_ctl_3[2]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx3[7] -val `CPU.peu.peu_psr_tx_lane_ctl_3[1]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx3[6:5] -val `CPU.dmu.ilu.cib.ilu_diagnos_rate_scale_hw_read[1:0]
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx3[1] -val `CPU.peu.peu_psr_rx_lane_ctl_3[0]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.cfgtx3[0] -val `CPU.dmu.ilu.cib.dmu_psr_tx_en_b3_sds0
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */


// .stspll  Hunter may not have the correct clock for this

/* 0in value -var `CPU.psr.serdes_0.stspll[0] -val `CPU.peu.psr_peu_lock_sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */



/* 0in value -var `CPU.psr.serdes_0.stsrx0[0] -val `CPU.peu.psr_peu_rx_tstfail_b0sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.stsrx0[1] -val `CPU.peu.psr_peu_sync_b0sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.stsrx0[3] -val `CPU.peu.psr_peu_losdtct_b0sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.stsrx0[4] -val `CPU.peu.psr_peu_bsrxp_b0sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.stsrx0[5] -val `CPU.peu.psr_peu_bsrxn_b0sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */



/* 0in value -var `CPU.psr.serdes_0.stsrx1[0] -val `CPU.peu.psr_peu_rx_tstfail_b1sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.stsrx1[1] -val `CPU.peu.psr_peu_sync_b1sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.stsrx1[3] -val `CPU.peu.psr_peu_losdtct_b1sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.stsrx1[4] -val `CPU.peu.psr_peu_bsrxp_b1sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.stsrx1[5] -val `CPU.peu.psr_peu_bsrxn_b1sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */




/* 0in value -var `CPU.psr.serdes_0.stsrx2[0] -val `CPU.peu.psr_peu_rx_tstfail_b2sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.stsrx2[1] -val `CPU.peu.psr_peu_sync_b2sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.stsrx2[3] -val `CPU.peu.psr_peu_losdtct_b2sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.stsrx2[4] -val `CPU.peu.psr_peu_bsrxp_b2sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.stsrx2[5] -val `CPU.peu.psr_peu_bsrxn_b2sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */



/* 0in value -var `CPU.psr.serdes_0.stsrx3[0] -val `CPU.peu.psr_peu_rx_tstfail_b3sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.stsrx3[1] -val `CPU.peu.psr_peu_sync_b3sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.stsrx3[3] -val `CPU.peu.psr_peu_losdtct_b3sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.stsrx3[4] -val `CPU.peu.psr_peu_bsrxp_b3sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.stsrx3[5] -val `CPU.peu.psr_peu_bsrxn_b3sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */



/* 0in value -var `CPU.psr.serdes_0.ststx0[0] -val `CPU.peu.psr_peu_tx_tstfail_b0sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.ststx0[1] -val `CPU.peu.psr_peu_rdtcip_b0sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */



/* 0in value -var `CPU.psr.serdes_0.ststx1[0] -val `CPU.peu.psr_peu_tx_tstfail_b1sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.ststx1[1] -val `CPU.peu.psr_peu_rdtcip_b1sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */



/* 0in value -var `CPU.psr.serdes_0.ststx2[0] -val `CPU.peu.psr_peu_tx_tstfail_b2sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.ststx2[1] -val `CPU.peu.psr_peu_rdtcip_b2sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */



/* 0in value -var `CPU.psr.serdes_0.ststx3[0] -val `CPU.peu.psr_peu_tx_tstfail_b3sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_0.ststx3[1] -val `CPU.peu.psr_peu_rdtcip_b3sds0
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */






// SERDES1

//  .cfgrx0

/* 0in value -var `CPU.psr.serdes_1.cfgrx0[25:24] -val `CPU.peu.peu_psr_rx_lane_ctl_4[15:14]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx0[22:19] -val `CPU.peu.peu_psr_rx_lane_ctl_4[13:10]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx0[18:16] -val `CPU.peu.peu_psr_rx_lane_ctl_4[9:7]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx0[15:14] -val `CPU.peu.peu_psr_rx_lane_ctl_4[6:5]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx0[12] -val `CPU.peu.peu_psr_rx_lane_ctl_4[1]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx0[10:8] -val `CPU.peu.peu_psr_rx_lane_ctl_4[4:2]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx0[7] -val `CPU.peu.peu_psr_invpair_b0sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx0[6:5] -val `CPU.dmu.ilu.cib.ilu_diagnos_rate_scale_hw_read[1:0]
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx0[1] -val `CPU.peu.peu_psr_rx_lane_ctl_4[0]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx0[0] -val `CPU.dmu.ilu.cib.dmu_psr_rx_en_b0_sds1
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

//  .cfgrx1

/* 0in value -var `CPU.psr.serdes_1.cfgrx1[25:24] -val `CPU.peu.peu_psr_rx_lane_ctl_5[15:14]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx1[22:19] -val `CPU.peu.peu_psr_rx_lane_ctl_5[13:10]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx1[18:16] -val `CPU.peu.peu_psr_rx_lane_ctl_5[9:7]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx1[15:14] -val `CPU.peu.peu_psr_rx_lane_ctl_5[6:5]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx1[12] -val `CPU.peu.peu_psr_rx_lane_ctl_5[1]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx1[10:8] -val `CPU.peu.peu_psr_rx_lane_ctl_5[4:2]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx1[7] -val `CPU.peu.peu_psr_invpair_b1sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx1[6:5] -val `CPU.dmu.ilu.cib.ilu_diagnos_rate_scale_hw_read[1:0]
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx1[1] -val `CPU.peu.peu_psr_rx_lane_ctl_5[0]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx1[0] -val `CPU.dmu.ilu.cib.dmu_psr_rx_en_b1_sds1
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

//  .cfgrx2

/* 0in value -var `CPU.psr.serdes_1.cfgrx2[25:24] -val `CPU.peu.peu_psr_rx_lane_ctl_6[15:14]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx2[22:19] -val `CPU.peu.peu_psr_rx_lane_ctl_6[13:10]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx2[18:16] -val `CPU.peu.peu_psr_rx_lane_ctl_6[9:7]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx2[15:14] -val `CPU.peu.peu_psr_rx_lane_ctl_6[6:5]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx2[12] -val `CPU.peu.peu_psr_rx_lane_ctl_6[1]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx2[10:8] -val `CPU.peu.peu_psr_rx_lane_ctl_6[4:2]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx2[7] -val `CPU.peu.peu_psr_invpair_b2sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx2[6:5] -val `CPU.dmu.ilu.cib.ilu_diagnos_rate_scale_hw_read[1:0]
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx2[1] -val `CPU.peu.peu_psr_rx_lane_ctl_6[0]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx2[0] -val `CPU.dmu.ilu.cib.dmu_psr_rx_en_b2_sds1
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

//  .cfgrx3

/* 0in value -var `CPU.psr.serdes_1.cfgrx3[25:24] -val `CPU.peu.peu_psr_rx_lane_ctl_7[15:14]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx3[22:19] -val `CPU.peu.peu_psr_rx_lane_ctl_7[13:10]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx3[18:16] -val `CPU.peu.peu_psr_rx_lane_ctl_7[9:7]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx3[15:14] -val `CPU.peu.peu_psr_rx_lane_ctl_7[6:5]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx3[12] -val `CPU.peu.peu_psr_rx_lane_ctl_7[1]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx3[10:8] -val `CPU.peu.peu_psr_rx_lane_ctl_7[4:2]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx3[7] -val `CPU.peu.peu_psr_invpair_b3sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx3[6:5] -val `CPU.dmu.ilu.cib.ilu_diagnos_rate_scale_hw_read[1:0]
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx3[1] -val `CPU.peu.peu_psr_rx_lane_ctl_7[0]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgrx3[0] -val `CPU.dmu.ilu.cib.dmu_psr_rx_en_b3_sds1
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

// .cfgtx0

/* 0in value -var `CPU.psr.serdes_1.cfgtx0[22:21] -val `CPU.peu.peu_psr_rdtct_b0sds1[1:0]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx0[20] -val `CPU.peu.peu_psr_enidl_b0sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx0[17] -val `CPU.peu.peu_psr_bstx_b0sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx0[15:12] -val `CPU.peu.peu_psr_tx_lane_ctl_4[9:6]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx0[11:9] -val `CPU.peu.peu_psr_tx_lane_ctl_4[5:3]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx0[8] -val `CPU.peu.peu_psr_tx_lane_ctl_4[2]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx0[7] -val `CPU.peu.peu_psr_tx_lane_ctl_4[1]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx0[6:5] -val `CPU.dmu.ilu.cib.ilu_diagnos_rate_scale_hw_read[1:0]
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx0[1] -val `CPU.peu.peu_psr_rx_lane_ctl_4[0]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx0[0] -val `CPU.dmu.ilu.cib.dmu_psr_tx_en_b0_sds1
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

// .cfgtx1

/* 0in value -var `CPU.psr.serdes_1.cfgtx1[22:21] -val `CPU.peu.peu_psr_rdtct_b1sds1[1:0]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx1[20] -val `CPU.peu.peu_psr_enidl_b1sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx1[17] -val `CPU.peu.peu_psr_bstx_b1sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx1[15:12] -val `CPU.peu.peu_psr_tx_lane_ctl_5[9:6]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx1[11:9] -val `CPU.peu.peu_psr_tx_lane_ctl_5[5:3]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx1[8] -val `CPU.peu.peu_psr_tx_lane_ctl_5[2]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx1[7] -val `CPU.peu.peu_psr_tx_lane_ctl_5[1]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx1[6:5] -val `CPU.dmu.ilu.cib.ilu_diagnos_rate_scale_hw_read[1:0]
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx1[1] -val `CPU.peu.peu_psr_rx_lane_ctl_5[0]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx1[0] -val `CPU.dmu.ilu.cib.dmu_psr_tx_en_b1_sds1
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

// .cfgtx2

/* 0in value -var `CPU.psr.serdes_1.cfgtx2[22:21] -val `CPU.peu.peu_psr_rdtct_b2sds1[1:0]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx2[20] -val `CPU.peu.peu_psr_enidl_b2sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx2[17] -val `CPU.peu.peu_psr_bstx_b2sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx2[15:12] -val `CPU.peu.peu_psr_tx_lane_ctl_6[9:6]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx2[11:9] -val `CPU.peu.peu_psr_tx_lane_ctl_6[5:3]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx2[8] -val `CPU.peu.peu_psr_tx_lane_ctl_6[2]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx2[7] -val `CPU.peu.peu_psr_tx_lane_ctl_6[1]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx2[6:5] -val `CPU.dmu.ilu.cib.ilu_diagnos_rate_scale_hw_read[1:0]
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx2[1] -val `CPU.peu.peu_psr_rx_lane_ctl_6[0]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx2[0] -val `CPU.dmu.ilu.cib.dmu_psr_tx_en_b2_sds1
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

// .cfgtx3

/* 0in value -var `CPU.psr.serdes_1.cfgtx3[22:21] -val `CPU.peu.peu_psr_rdtct_b3sds1[1:0]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx3[20] -val `CPU.peu.peu_psr_enidl_b3sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx3[17] -val `CPU.peu.peu_psr_bstx_b3sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx3[15:12] -val `CPU.peu.peu_psr_tx_lane_ctl_7[9:6]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx3[11:9] -val `CPU.peu.peu_psr_tx_lane_ctl_7[5:3]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx3[8] -val `CPU.peu.peu_psr_tx_lane_ctl_7[2]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx3[7] -val `CPU.peu.peu_psr_tx_lane_ctl_7[1]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx3[6:5] -val `CPU.dmu.ilu.cib.ilu_diagnos_rate_scale_hw_read[1:0]
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx3[1] -val `CPU.peu.peu_psr_rx_lane_ctl_7[0]
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.cfgtx3[0] -val `CPU.dmu.ilu.cib.dmu_psr_tx_en_b3_sds1
   -active 1'b1 -clock `CPU.dmu.iol2clk -reset  tb_top.reset  */


// .stspll  Hunter may not have the correct clock for this

/* 0in value -var `CPU.psr.serdes_1.stspll[0] -val `CPU.peu.psr_peu_lock_sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */



/* 0in value -var `CPU.psr.serdes_1.stsrx0[0] -val `CPU.peu.psr_peu_rx_tstfail_b0sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.stsrx0[1] -val `CPU.peu.psr_peu_sync_b0sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.stsrx0[3] -val `CPU.peu.psr_peu_losdtct_b0sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.stsrx0[4] -val `CPU.peu.psr_peu_bsrxp_b0sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.stsrx0[5] -val `CPU.peu.psr_peu_bsrxn_b0sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */



/* 0in value -var `CPU.psr.serdes_1.stsrx1[0] -val `CPU.peu.psr_peu_rx_tstfail_b1sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.stsrx1[1] -val `CPU.peu.psr_peu_sync_b1sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.stsrx1[3] -val `CPU.peu.psr_peu_losdtct_b1sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.stsrx1[4] -val `CPU.peu.psr_peu_bsrxp_b1sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.stsrx1[5] -val `CPU.peu.psr_peu_bsrxn_b1sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */




/* 0in value -var `CPU.psr.serdes_1.stsrx2[0] -val `CPU.peu.psr_peu_rx_tstfail_b2sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.stsrx2[1] -val `CPU.peu.psr_peu_sync_b2sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.stsrx2[3] -val `CPU.peu.psr_peu_losdtct_b2sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.stsrx2[4] -val `CPU.peu.psr_peu_bsrxp_b2sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.stsrx2[5] -val `CPU.peu.psr_peu_bsrxn_b2sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */



/* 0in value -var `CPU.psr.serdes_1.stsrx3[0] -val `CPU.peu.psr_peu_rx_tstfail_b3sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.stsrx3[1] -val `CPU.peu.psr_peu_sync_b3sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.stsrx3[3] -val `CPU.peu.psr_peu_losdtct_b3sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.stsrx3[4] -val `CPU.peu.psr_peu_bsrxp_b3sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.stsrx3[5] -val `CPU.peu.psr_peu_bsrxn_b3sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */



/* 0in value -var `CPU.psr.serdes_1.ststx0[0] -val `CPU.peu.psr_peu_tx_tstfail_b0sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.ststx0[1] -val `CPU.peu.psr_peu_rdtcip_b0sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */



/* 0in value -var `CPU.psr.serdes_1.ststx1[0] -val `CPU.peu.psr_peu_tx_tstfail_b1sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.ststx1[1] -val `CPU.peu.psr_peu_rdtcip_b1sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */



/* 0in value -var `CPU.psr.serdes_1.ststx2[0] -val `CPU.peu.psr_peu_tx_tstfail_b2sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.ststx2[1] -val `CPU.peu.psr_peu_rdtcip_b2sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */



/* 0in value -var `CPU.psr.serdes_1.ststx3[0] -val `CPU.peu.psr_peu_tx_tstfail_b3sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */

/* 0in value -var `CPU.psr.serdes_1.ststx3[1] -val `CPU.peu.psr_peu_rdtcip_b3sds1
   -active 1'b1 -clock `CPU.peu.pcl2clk -reset  tb_top.reset  */


// Hunter Niu Serdes ( esr_0_location_ID_31 is serdes 0) (esr_1_location_ID_29 is serdes 1)


/* 0in value -var `CPU.esr.esr_0_location_ID_31.cfgpll[11:0] -val `CPU.mac.hedwig.hedwig_0.I_P2REGS.I_P2REGS_CFG_STS_PLL.this_config_reg[11:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_0.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

/* 0in value -var `CPU.esr.esr_0_location_ID_31.testcfg[14:0] -val `CPU.mac.hedwig.hedwig_0.I_P2REGS.I_P2REGS_CFG_STS_TEST.this_config_reg[14:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_0.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

/* 0in value -var `CPU.esr.esr_0_location_ID_31.cfgrx0[25:0] -val `CPU.mac.hedwig.hedwig_0.I_P2REGS.I_P2REGS_CFG_STS_RX_0.this_config_reg[25:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_0.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

/* 0in value -var `CPU.esr.esr_0_location_ID_31.cfgrx1[25:0] -val `CPU.mac.hedwig.hedwig_0.I_P2REGS.I_P2REGS_CFG_STS_RX_1.this_config_reg[25:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_0.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

/* 0in value -var `CPU.esr.esr_0_location_ID_31.cfgrx2[25:0] -val `CPU.mac.hedwig.hedwig_0.I_P2REGS.I_P2REGS_CFG_STS_RX_2.this_config_reg[25:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_0.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

/* 0in value -var `CPU.esr.esr_0_location_ID_31.cfgrx3[25:0] -val `CPU.mac.hedwig.hedwig_0.I_P2REGS.I_P2REGS_CFG_STS_RX_3.this_config_reg[25:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_0.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

/* 0in value -var `CPU.esr.esr_0_location_ID_31.cfgtx0[22:0] -val `CPU.mac.hedwig.hedwig_0.I_P2REGS.I_P2REGS_CFG_STS_TX_0.this_config_reg[22:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_0.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

/* 0in value -var `CPU.esr.esr_0_location_ID_31.cfgtx1[22:0] -val `CPU.mac.hedwig.hedwig_0.I_P2REGS.I_P2REGS_CFG_STS_TX_1.this_config_reg[22:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_0.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

/* 0in value -var `CPU.esr.esr_0_location_ID_31.cfgtx2[22:0] -val `CPU.mac.hedwig.hedwig_0.I_P2REGS.I_P2REGS_CFG_STS_TX_2.this_config_reg[22:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_0.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

/* 0in value -var `CPU.esr.esr_0_location_ID_31.cfgtx3[22:0] -val `CPU.mac.hedwig.hedwig_0.I_P2REGS.I_P2REGS_CFG_STS_TX_3.this_config_reg[22:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_0.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */


/* 0in value -var `CPU.esr.esr_1_location_ID_29.cfgpll[11:0] -val `CPU.mac.hedwig.hedwig_1.I_P2REGS.I_P2REGS_CFG_STS_PLL.this_config_reg[11:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_1.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

/* 0in value -var `CPU.esr.esr_1_location_ID_29.testcfg[14:0] -val `CPU.mac.hedwig.hedwig_1.I_P2REGS.I_P2REGS_CFG_STS_TEST.this_config_reg[14:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_1.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

/* 0in value -var `CPU.esr.esr_1_location_ID_29.cfgrx0[25:0] -val `CPU.mac.hedwig.hedwig_1.I_P2REGS.I_P2REGS_CFG_STS_RX_0.this_config_reg[25:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_1.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

/* 0in value -var `CPU.esr.esr_1_location_ID_29.cfgrx1[25:0] -val `CPU.mac.hedwig.hedwig_1.I_P2REGS.I_P2REGS_CFG_STS_RX_1.this_config_reg[25:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_1.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

/* 0in value -var `CPU.esr.esr_1_location_ID_29.cfgrx2[25:0] -val `CPU.mac.hedwig.hedwig_1.I_P2REGS.I_P2REGS_CFG_STS_RX_2.this_config_reg[25:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_1.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

/* 0in value -var `CPU.esr.esr_1_location_ID_29.cfgrx3[25:0] -val `CPU.mac.hedwig.hedwig_1.I_P2REGS.I_P2REGS_CFG_STS_RX_3.this_config_reg[25:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_1.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

/* 0in value -var `CPU.esr.esr_1_location_ID_29.cfgtx0[22:0] -val `CPU.mac.hedwig.hedwig_1.I_P2REGS.I_P2REGS_CFG_STS_TX_0.this_config_reg[22:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_1.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

/* 0in value -var `CPU.esr.esr_1_location_ID_29.cfgtx1[22:0] -val `CPU.mac.hedwig.hedwig_1.I_P2REGS.I_P2REGS_CFG_STS_TX_1.this_config_reg[22:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_1.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

/* 0in value -var `CPU.esr.esr_1_location_ID_29.cfgtx2[22:0] -val `CPU.mac.hedwig.hedwig_1.I_P2REGS.I_P2REGS_CFG_STS_TX_2.this_config_reg[22:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_1.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

/* 0in value -var `CPU.esr.esr_1_location_ID_29.cfgtx3[22:0] -val `CPU.mac.hedwig.hedwig_1.I_P2REGS.I_P2REGS_CFG_STS_TX_3.this_config_reg[22:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_1.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

// RX Status Registers

/* 0in value -var `CPU.esr.esr_1_location_ID_29.stsrx0[7:0] -val `CPU.mac.hedwig.hedwig_0.I_P2REGS.I_P2REGS_CFG_STS_RX_0.this_status_reg[7:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_1.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

/* 0in value -var `CPU.esr.esr_1_location_ID_29.stsrx1[7:0] -val `CPU.mac.hedwig.hedwig_0.I_P2REGS.I_P2REGS_CFG_STS_RX_1.this_status_reg[7:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_1.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

/* 0in value -var `CPU.esr.esr_1_location_ID_29.stsrx2[7:0] -val `CPU.mac.hedwig.hedwig_0.I_P2REGS.I_P2REGS_CFG_STS_RX_2.this_status_reg[7:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_1.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

/* 0in value -var `CPU.esr.esr_1_location_ID_29.stsrx3[7:0] -val `CPU.mac.hedwig.hedwig_0.I_P2REGS.I_P2REGS_CFG_STS_RX_3.this_status_reg[7:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_1.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

// TX Status Registers

/* 0in value -var `CPU.esr.esr_1_location_ID_29.ststx0[1:0] -val `CPU.mac.hedwig.hedwig_0.I_P2REGS.I_P2REGS_CFG_STS_TX_0.this_status_reg[1:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_1.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

/* 0in value -var `CPU.esr.esr_1_location_ID_29.ststx1[1:0] -val `CPU.mac.hedwig.hedwig_0.I_P2REGS.I_P2REGS_CFG_STS_TX_1.this_status_reg[1:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_1.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

/* 0in value -var `CPU.esr.esr_1_location_ID_29.ststx2[1:0] -val `CPU.mac.hedwig.hedwig_0.I_P2REGS.I_P2REGS_CFG_STS_TX_2.this_status_reg[1:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_1.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

/* 0in value -var `CPU.esr.esr_1_location_ID_29.ststx3[1:0] -val `CPU.mac.hedwig.hedwig_0.I_P2REGS.I_P2REGS_CFG_STS_TX_3.this_status_reg[1:0]
   -active 1'b1 -clock `CPU.mac.hedwig.hedwig_1.I_P2REGS.IO_MDCLK -reset  tb_top.reset  */

endmodule
