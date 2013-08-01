// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_rtl_chkr.v
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
module ncu_rtl_chkr();

// 0in default_reset `NCU.tcu_aclk -module ncu_rtl_chkr

/* 0in bits_on
        -var {ncu_man_acc,ncu_asi_a_acc,ncu_asi_b_acc}
        -max 1
        -message "first register decoder is not one hot"
        -clock iol2clk
        -module ncu_ctrl_ctl
	-name cov_reg_first_decod
*/

/* 0in bits_on
        -var { asi_coreavail_dec,asi_core_enable_status_dec,asi_core_enable_dec,
               asi_xir_steering_dec, asi_core_running_dec, asi_core_running_status_dec, 
               asi_core_runningw1s_dec, asi_core_runningw1c_dec, asi_intvecdisp_dec}
        -max 1
        -message "first register decoder is not one hot"
        -clock iol2clk
        -module ncu_ctrl_ctl
	-name cov_reg_asi_decod
*/
/* 0in bits_on
        -var { creg_esr_dec, creg_ele_dec, creg_eie_dec,
                  creg_ejr_dec, creg_fee_dec, creg_per_dec, creg_siisyn_dec,
                  creg_ncusyn_dec}
        -max 1
        -message "first register decoder is not one hot"
        -clock iol2clk
        -module ncu_ctrl_ctl
	-name cov_reg_ras_decod
*/
/* 0in bits_on
        -var {creg_intman_dec, creg_sernum_dec, creg_coreavail_dec, creg_fusestat_dec,
                  creg_bankavail_dec, creg_bank_en_dec,creg_bank_en_status_dec,creg_l2idxhs_en_dec,
                  creg_l2idxhs_en_status_dec,creg_mondoinvec_dec,creg_mem32_base_dec,creg_mem32_mask_dec,
                  creg_mem64_base_dec,creg_mem64_mask_dec,creg_iocon_base_dec,creg_iocon_mask_dec,
                  creg_mmufsh_dec} 
        -max 1
        -message "first register decoder is not one hot"
        -clock iol2clk
        -module ncu_ctrl_ctl
	-name cov_reg_second_decod
*/

/* 0in bits_on
        -var {wake_thread,asi_core_runningw1s_wr, asi_core_running_wr,asi_core_runningw1c_wr}
        -max 1
        -message "first register decoder is not one hot"
        -clock iol2clk
        -module ncu_ctrl_ctl
	-name cov_reg_run
*/

/* 0in value
        -var  xir_mini_vec 
	-val 8'bxxxx_xxx1 8'bxxxx_xx10 8'bxxxx_x100 8'bxxxx_1000 8'bxxx1_0000 8'bxx10_0000 8'bx100_0000 8'b1000_0000  8'b0000_0000
        -casex
        -clock iol2clk
        -module ncu_ctrl_ctl
        -name cov_xir_mini_vec
*/

/* 0in value
        -var  {coreavail_done,~asi_core_en_wr,c2i_core_en_a0} 
	-val 3'b1xx 3'b000  3'b01x 3'b001
        -casex
        -clock iol2clk
        -module ncu_ctrl_ctl
        -name cov_ncu_core_avail_enable_dec_chk

*/

/* 0in value
        -var  {coreavail_done,wmr_upd_en} 
	-val 2'b1x 2'b01 2'b00
        -casex
        -clock iol2clk
        -module ncu_ctrl_ctl
        -name cov_ncu_en_enstatus_dec_chk
*/

/* 0in value
        -var  {coreavail_done_d1,asi_xir_steering_wr}
	-val   2'b1x 2'b01 2'b00
        -casex
        -clock iol2clk
        -module ncu_ctrl_ctl
        -name cov_ncu_xir_reg_dec_chk
*/

/* 0in value
        -var  {wake_thread,asi_core_runningw1s_wr, asi_core_running_wr,asi_core_runningw1c_wr}
	-val   4'b1xxx 4'b01xx 4'b001x 4'b0001 4'b0000 
        -casex
        -clock iol2clk
        -module ncu_ctrl_ctl
        -name cov_ncu_run_reg_dec_chk
*/
/* 0in value
        -var  {bankavail_done,~bank_en_wr,c2i_bank_en_a0}
	-val 3'b1xx 3'b000  3'b01x 3'b001
        -casex
        -clock iol2clk
        -module ncu_ctrl_ctl
        -name cov_ncu_bank_reg_dec_chk
*/


/* 0in range
        -var sii_rcv_cntr 
	-min 0
	-max 5
        -clock iol2clk
        -module ncu_i2cbufsii_ctl
        -name cov_ncu_sii_rcv_cntr_chk
*/


/* 0in range
        -var cpx_cnt0 
	-min 0
	-max 2
        -clock l2clk
        -module ncu_i2cfc_ctl
        -name cov_cpx_cnt0_chk
*/
/* 0in value
        -var  {cpx_cnt0_minus1_sel,cpx_cnt0_plus1_sel} 
	-val 2'b10 2'b01 2'b00
        -casex
        -clock l2clk
        -module ncu_i2cfc_ctl
        -name cov_ncu_cnt0_ctrl_chk
*/
/* 0in range
        -var cpx_cnt1 
	-min 0
	-max 2
        -clock l2clk
        -module ncu_i2cfc_ctl
        -name cov_cpx_cnt1_chk
*/
/* 0in value
        -var  {cpx_cnt1_minus1_sel,cpx_cnt1_plus1_sel} 
	-val 2'b10 2'b01 2'b00
        -casex
        -clock l2clk
        -module ncu_i2cfc_ctl
        -name cov_ncu_cnt1_ctrl_chk
*/
/* 0in range
        -var cpx_cnt2 
	-min 0
	-max 2
        -clock l2clk
        -module ncu_i2cfc_ctl
        -name cov_cpx_cnt2_chk
*/
/* 0in value
        -var  {cpx_cnt2_minus1_sel,cpx_cnt2_plus1_sel} 
	-val 2'b10 2'b01 2'b00
        -casex
        -clock l2clk
        -module ncu_i2cfc_ctl
        -name cov_ncu_cnt2_ctrl_chk
*/
/* 0in range
        -var cpx_cnt3 
	-min 0
	-max 2
        -clock l2clk
        -module ncu_i2cfc_ctl
        -name cov_cpx_cnt3_chk
*/
/* 0in value
        -var  {cpx_cnt3_minus1_sel,cpx_cnt3_plus1_sel} 
	-val 2'b10 2'b01 2'b00
        -casex
        -clock l2clk
        -module ncu_i2cfc_ctl
        -name cov_ncu_cnt3_ctrl_chk
*/
/* 0in range
        -var cpx_cnt4 
	-min 0
	-max 2
        -clock l2clk
        -module ncu_i2cfc_ctl
        -name cov_cpx_cnt4_chk
*/
/* 0in value
        -var  {cpx_cnt4_minus1_sel,cpx_cnt4_plus1_sel} 
	-val 2'b10 2'b01 2'b00
        -casex
        -clock l2clk
        -module ncu_i2cfc_ctl
        -name cov_ncu_cnt4_ctrl_chk
*/
/* 0in range
        -var cpx_cnt5 
	-min 0
	-max 2
        -clock l2clk
        -module ncu_i2cfc_ctl
        -name cov_cpx_cnt5_chk
*/
/* 0in value
        -var  {cpx_cnt5_minus1_sel,cpx_cnt5_plus1_sel} 
	-val 2'b10 2'b01 2'b00
        -casex
        -clock l2clk
        -module ncu_i2cfc_ctl
        -name cov_ncu_cnt5_ctrl_chk
*/
/* 0in range
        -var cpx_cnt6 
	-min 0
	-max 2
        -clock l2clk
        -module ncu_i2cfc_ctl
        -name cov_cpx_cnt6_chk
*/
/* 0in value
        -var  {cpx_cnt6_minus1_sel,cpx_cnt6_plus1_sel} 
	-val 2'b10 2'b01 2'b00
        -casex
        -clock l2clk
        -module ncu_i2cfc_ctl
        -name cov_ncu_cnt6_ctrl_chk
*/
/* 0in range
        -var cpx_cnt7 
	-min 0
	-max 2
        -clock l2clk
        -module ncu_i2cfc_ctl
        -name cov_cpx_cnt7_chk
*/
/* 0in value
        -var  {cpx_cnt7_minus1_sel,cpx_cnt7_plus1_sel} 
	-val 2'b10 2'b01 2'b00
        -casex
        -clock l2clk
        -module ncu_i2cfc_ctl
        -name cov_ncu_cnt7_ctrl_chk
*/

  
/* 0in bits_on
        -var int_sel
        -max 1
        -clock iol2clk
        -module ncu_i2csd_ctl
	-name cov_ncu_int_sel_chk
*/
/* 0in bits_on
        -var ack_sel
        -max 1
        -clock iol2clk
        -module ncu_i2csd_ctl
	-name cov_ncu_ack_sel_chk
*/

/* 0in value
        -var  snapd_int_vec 
	-val 7'b1xx_xxxx 7'b01x_xxxx 7'b001_xxxx 7'b000_1xxx 
	     7'b000_01xx 7'b000_001x 7'b000_0001 7'h000_0000
	-casex
        -clock iol2clk
        -module ncu_i2csc_ctl
        -name cov_ncu_snapd_int_vec
*/
/* 0in value
        -var  snapd_ack_vec 
	-val 15'b1xx_xxxx_xxxx_xxxx 15'b01x_xxxx_xxxx_xxxx 15'b001_xxxx_xxxx_xxxx 
	     15'b000_1xxx_xxxx_xxxx 15'b000_01xx_xxxx_xxxx 15'b000_001x_xxxx_xxxx 
	     15'b000_0001_xxxx_xxxx 15'b000_0000_1xxx_xxxx 15'b000_0000_01xx_xxxx 
	     15'b000_0000_001x_xxxx 15'b000_0000_0001_xxxx 15'b000_0000_0000_1xxx 
	     15'b000_0000_0000_01xx 15'b000_0000_0000_001x 15'b000_0000_0000_0001 
	     15'b000_0000_0000_0000
	-casex
        -clock iol2clk
        -module ncu_i2csc_ctl
        -name cov_ncu_snapd_ack_vec
*/

/* 0in bits_on
        -var {ssi_int_rd, mcu0_int_rd,mcu1_int_rd,mcu2_int_rd,mcu3_int_rd,niu_int_rd,ncu_man_int_rd}
        -max 1
        -clock iol2clk
        -module ncu_i2csc_ctl
	-name cov_ncu_io_int_dec_chk
*/
/* 0in bits_on
        -var {siipio_ack_rd, dmucsr_ack_rd,ccu_ack_rd,mcu0_ack_rd,mcu1_ack_rd,mcu2_ack_rd,mcu3_ack_rd, 
		ssi_ack_rd, rcu_ack_rd, niu_ack_rd, ncu_man_ack_rd, ncu_int_ack_rd, 
		bounce_ack_rd, rd_nack_rd}
        -max 1
        -clock iol2clk
        -module ncu_i2csc_ctl
	-name cov_io_ack_dec_chk
*/
/* 0in range
        -var cr_id[3:0] 
	-min 0
	-max 15
        -clock iol2clk
        -module ncu_c2ibufpio_ctl
        -name cov_ncu_cr_id_chk
*/

/* 0in bits_on
        -var  {mmu_ld, pio_ld}
        -max 1
        -clock iol2clk
        -module ncu_c2ibufpio_ctl
	-name cov_mmu_pio_arb_chk
*/


/* 0in range
        -var dmu_cr_id_rtn 
	-min 0
	-max 15
        -clock iol2clk
        -module ncu_c2ibufpio_ctl
        -name cov_dmu_cr_id_rtn_chk
*/
/* 0in range
        -var sii_cr_id_rtn 
	-min 0
	-max 15
        -clock iol2clk
        -module ncu_c2ibufpio_ctl
        -name cov_sii_cr_id_rtn_chk
*/
/* 0in bits_on
        -var  {mcu0_ucb_sel,mcu1_ucb_sel,mcu2_ucb_sel,mcu3_ucb_sel,dmucsr_ucb_sel,dmupio_ucb_sel,ssi_ucb_sel,ccu_ucb_sel,rcu_ucb_sel,niu_ucb_sel, ncu_man_ucb_sel,ncu_int_ucb_sel, rd_nack_ucb_sel} 
        -max 1
        -clock iol2clk
        -module ncu_c2isc_ctl
	-name cov_ncu_io_sel_dec_chk
*/
/* 0in bits_on
        -var  {c_creg_mdata0_alias_dec, c_creg_mdata1_alias_dec, c_creg_mbusy_alias_dec,c_creg_mdata0_proper_dec, c_creg_mdata1_proper_dec, c_creg_mbusy_proper_dec} 
        -max 1
        -clock l2clk
        -module ncu_c2ifc_ctl
	-name cov_ncu_cpu_mondo_dec
*/
/* 0in bits_on
        -var  {t_creg_mdata0_alias_dec, t_creg_mdata1_alias_dec, t_creg_mbusy_alias_dec,t_creg_mdata0_proper_dec, t_creg_mdata1_proper_dec, t_creg_mbusy_proper_dec} 
        -max 1
        -clock l2clk
        -module ncu_c2ifc_ctl
	-name cov_ncu_tcu_mondo_dec
*/
endmodule
