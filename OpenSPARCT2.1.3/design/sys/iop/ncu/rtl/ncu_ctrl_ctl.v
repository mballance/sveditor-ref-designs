// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_ctrl_ctl.v
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
`define RF_RDEN_OFFSTATE            1'b1

//====================================
`define NCU_INTMANRF_DEPTH         128
`define NCU_INTMANRF_DATAWIDTH      16
`define NCU_INTMANRF_ADDRWIDTH       7
//====================================

//====================================
`define NCU_MONDORF_DEPTH           64
`define NCU_MONDORF_DATAWIDTH       72
`define NCU_MONDORF_ADDRWIDTH        6
//====================================

//====================================
`define NCU_CPUBUFRF_DEPTH          32
`define NCU_CPUBUFRF_DATAWIDTH     144
`define NCU_CPUBUFRF_ADDRWIDTH       5
//====================================

//====================================
`define NCU_IOBUFRF_DEPTH          32
`define NCU_IOBUFRF_DATAWIDTH     144
`define NCU_IOBUFRF_ADDRWIDTH       5
//====================================

//====================================
`define NCU_IOBUF1RF_DEPTH          32
`define NCU_IOBUF1RF_DATAWIDTH      32
`define NCU_IOBUF1RF_ADDRWIDTH       5
//====================================

//====================================
`define NCU_INTBUFRF_DEPTH          32
`define NCU_INTBUFRF_DATAWIDTH     144
`define NCU_INTBUFRF_ADDRWIDTH       5
//====================================

//== fix me : need to remove when warm //
//== becomes available //
`define WMR_LENGTH		10'd999
`define WMR_LENGTH_P1		10'd1000

//// NCU CSR_MAN address   80_0000_xxxx ////
`define NCU_CSR_MAN			16'h0000
`define NCU_CREG_INTMAN			16'h0000
//`define NCU_CREG_INTVECDISP		16'h0800
`define NCU_CREG_MONDOINVEC		16'h0a00
`define NCU_CREG_SERNUM			16'h1000
`define NCU_CREG_FUSESTAT		16'h1008
`define NCU_CREG_COREAVAIL		16'h1010
`define NCU_CREG_BANKAVAIL		16'h1018
`define NCU_CREG_BANK_ENABLE		16'h1020
`define NCU_CREG_BANK_ENABLE_STATUS 	16'h1028
`define NCU_CREG_L2_HASH_ENABLE		16'h1030
`define NCU_CREG_L2_HASH_ENABLE_STATUS	16'h1038


`define NCU_CREG_MEM32_BASE	16'h2000
`define NCU_CREG_MEM32_MASK	16'h2008
`define NCU_CREG_MEM64_BASE	16'h2010
`define NCU_CREG_MEM64_MASK	16'h2018
`define NCU_CREG_IOCON_BASE	16'h2020
`define NCU_CREG_IOCON_MASK	16'h2028
`define NCU_CREG_MMUFSH		16'h2030

`define NCU_CREG_ESR		16'h3000
`define NCU_CREG_ELE		16'h3008
`define NCU_CREG_EIE		16'h3010
`define NCU_CREG_EJR		16'h3018
`define NCU_CREG_FEE		16'h3020
`define NCU_CREG_PER		16'h3028
`define NCU_CREG_SIISYN		16'h3030
`define NCU_CREG_NCUSYN		16'h3038
`define NCU_CREG_SCKSEL         16'h3040
`define NCU_CREG_DBGTRIG_EN     16'h4000

//// NUC CSR_MONDO address 80_0004_xxxx ////
`define NCU_CSR_MONDO		16'h0004
`define NCU_CREG_MDATA0  	16'h0000 
`define NCU_CREG_MDATA1  	16'h0200 
`define NCU_CREG_MDATA0_ALIAS	16'h0400 
`define NCU_CREG_MDATA1_ALIAS	16'h0600 
`define NCU_CREG_MBUSY		16'h0800 
`define NCU_CREG_MBUSY_ALIAS	16'h0a00 



// ASI shared reg 90_xxxx_xxxx//
`define NCU_ASI_A_HIT			10'h104 // 6-bits cpuid and thread id are "x"
`define NCU_ASI_B_HIT			10'h1CC // 6-bits cpuid and thread id are "x"
`define NCU_ASI_C_HIT			10'h114	// 6-bits cpuid and thread id are "x"
`define NCU_ASI_COREAVAIL		16'h0000
`define NCU_ASI_CORE_ENABLE_STATUS	16'h0010
`define NCU_ASI_CORE_ENABLE		16'h0020
`define NCU_ASI_XIR_STEERING		16'h0030
`define NCU_ASI_CORE_RUNNINGRW		16'h0050
`define NCU_ASI_CORE_RUNNING_STATUS	16'h0058
`define NCU_ASI_CORE_RUNNING_W1S	16'h0060
`define NCU_ASI_CORE_RUNNING_W1C	16'h0068
`define NCU_ASI_INTVECDISP		16'h0000
`define NCU_ASI_ERR_STR                 16'h1000
`define NCU_ASI_WMR_VEC_MASK            16'h0018
`define NCU_ASI_CMP_TICK_ENABLE		16'h0038


//// UCB packet type ////
`define UCB_READ_NACK	4'b0000    // ack/nack types
`define UCB_READ_ACK	4'b0001
`define UCB_WRITE_ACK	4'b0010
`define UCB_IFILL_ACK	4'b0011
`define UCB_IFILL_NACK	4'b0111

`define UCB_READ_REQ	4'b0100    // req types
`define UCB_WRITE_REQ	4'b0101
`define UCB_IFILL_REQ	4'b0110

`define UCB_INT		4'b1000    // plain interrupt
`define UCB_INT_VEC	4'b1100    // interrupt with vector
`define UCB_INT_SOC_UE	4'b1001    // soc interrup ue
`define UCB_INT_SOC_CE  4'b1010    // soc interrup ce
`define UCB_RESET_VEC	4'b0101    // reset with vector
`define UCB_IDLE_VEC	4'b1110    // idle with vector
`define UCB_RESUME_VEC	4'b1111    // resume with vector

`define UCB_INT_SOC 	4'b1101    // soc interrup ce


//// PCX packet type ////
`define	PCX_LOAD_RQ	5'b00000
`define	PCX_IMISS_RQ	5'b10000
`define	PCX_STORE_RQ	5'b00001
`define PCX_FWD_RQs	5'b01101
`define PCX_FWD_RPYs	5'b01110

//// CPX packet type ////
//`define CPX_LOAD_RET	4'b0000
`define CPX_LOAD_RET	4'b1000
`define CPX_ST_ACK	4'b0100
//`define CPX_IFILL_RET	4'b0001
`define CPX_IFILL_RET	4'b1001
`define CPX_INT_RET	4'b0111
`define CPX_INT_SOC	4'b1101
//`define CPX_FWD_RQ_RET	4'b1010
//`define CPX_FWD_RPY_RET	4'b1011




//// Global CSR decode ////
`define NCU_CSR		8'h80
`define NIU_CSR		8'h81
//`define RNG_CSR		8'h82
`define DBG1_CSR               8'h86
`define CCU_CSR		8'h83
`define MCU_CSR		8'h84
`define TCU_CSR		8'h85
`define DMU_CSR		8'h88
`define RCU_CSR		8'h89
`define NCU_ASI		8'h90
			/////8'h91 ~ 9F reserved
			/////8'hA0 ~ BF L2 CSR////
`define DMU_PIO		4'hC   // C0 ~ CF
			/////8'hB0 ~ FE reserved
`define SSI_CSR		8'hFF


//// NCU_SSI ////
`define SSI_ADDR 	 	12'hFF_F
`define SSI_ADDR_TIMEOUT_REG	40'hFF_0001_0088
`define SSI_ADDR_LOG_REG	40'hFF_0000_0018

`define IF_IDLE 2'b00
`define IF_ACPT 2'b01
`define IF_DROP 2'b10

`define SSI_IDLE     3'b000
`define	SSI_REQ      3'b001
`define	SSI_WDATA    3'b011
`define	SSI_REQ_PAR  3'b101
`define	SSI_ACK      3'b111
`define	SSI_RDATA    3'b110
`define	SSI_ACK_PAR  3'b010









module ncu_ctrl_ctl (
  iol2clk, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_scan_en, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_dbr_gateoff, 
  ncu_scksel_sh, 
  ncu_man_ucb_sel, 
  ncu_man_ucb_buf_acpt, 
  ncu_int_ucb_sel, 
  ncu_int_ucb_buf_acpt, 
  bounce_ucb_sel, 
  bounce_ucb_buf_acpt, 
  c2i_packet_vld, 
  c2i_packet_is_rd_req, 
  c2i_packet_is_wr_req, 
  c2i_packet, 
  rd_nack_ucb_sel, 
  rd_nack_ucb_buf_acpt, 
  c2i_rd_nack_packet, 
  tap_mondo_acc_addr_s, 
  tap_mondo_acc_seq_s, 
  tap_mondo_wr_s, 
  tap_mondo_din_s, 
  tap_mondo_acc_seq_d2_f, 
  tap_mondo_acc_addr_invld_d2_f, 
  tap_mondo_dout_d2_f, 
  mmufsh_data, 
  mmufsh_vld, 
  mmu_ld, 
  mem32_mask, 
  mem32_base, 
  mem32_en, 
  mem64_mask, 
  mem64_base, 
  mem64_en, 
  iocon_mask, 
  iocon_base, 
  iocon_en, 
  ncu_man_int_rd, 
  ncu_man_int_vld, 
  ncu_man_int_packet, 
  ncu_man_ack_rd, 
  ncu_man_ack_vld, 
  ncu_man_ack_packet, 
  ncu_int_ack_rd, 
  ncu_int_ack_vld, 
  ncu_int_ack_packet, 
  bounce_ack_rd, 
  bounce_ack_vld, 
  bounce_ack_packet, 
  rd_nack_rd, 
  rd_nack_vld, 
  rd_nack_packet, 
  io_intman_addr, 
  mondoinvec, 
  lhs_intman_acc, 
  intman_pchkf2i2c, 
  io_rd_intman_d2, 
  efu_ncu_fuse_data, 
  efu_ncu_coreavail_dshift, 
  efu_ncu_bankavail_dshift, 
  efu_ncu_fusestat_dshift, 
  efu_ncu_sernum0_dshift, 
  efu_ncu_sernum1_dshift, 
  efu_ncu_sernum2_dshift, 
  ncu_tcu_bank_avail, 
  rst_ncu_unpark_thread, 
  rst_ncu_xir_inv, 
  ncu_rst_xir_done, 
  ncu_spc7_core_enable_status, 
  ncu_spc6_core_enable_status, 
  ncu_spc5_core_enable_status, 
  ncu_spc4_core_enable_status, 
  ncu_spc3_core_enable_status, 
  ncu_spc2_core_enable_status, 
  ncu_spc1_core_enable_status, 
  ncu_spc0_core_enable_status, 
  core_running, 
  core_running_status, 
  coreavail, 
  ncu_dbg1_error_event, 
  tcu_wmr_vec_mask, 
  cmp_tick_enable, 
  l2pm, 
  ncu_spc_pm, 
  ncu_spc_ba01, 
  l2idxhs_en_status, 
  intman_tbl_raddr, 
  intman_tbl_waddr, 
  intman_tbl_wr, 
  intman_tbl_rden, 
  intman_tbl_din, 
  intman_tbl_dout, 
  mb1_raddr, 
  mb1_waddr, 
  mb1_wdata, 
  mb1_intman_wr_en, 
  mb1_intman_rd_en, 
  mb1_run, 
  ncu_rst_fatal_error, 
  ncu_tcu_soc_error, 
  raserrce, 
  raserrue, 
  niu_ncu_d_pe, 
  ncu_niu_d_pei, 
  niu_ncu_ctag_ue, 
  ncu_niu_ctag_uei, 
  niu_ncu_ctag_ce, 
  ncu_niu_ctag_cei, 
  sio_ncu_ctag_ce, 
  ncu_sio_ctag_cei, 
  sio_ncu_ctag_ue, 
  ncu_sio_ctag_uei, 
  ncu_sio_d_pei, 
  dmu_cr_id_rtn_err, 
  dmu_cr_id_rtn_erri, 
  dmu_ncu_d_pe, 
  ncu_dmu_d_pei, 
  dmu_ncu_siicr_pe, 
  ncu_dmu_siicr_pei, 
  dmu_ncu_ctag_ue, 
  ncu_dmu_ctag_uei, 
  dmu_ncu_ctag_ce, 
  ncu_dmu_ctag_cei, 
  dmu_ncu_ncucr_pe, 
  ncu_dmu_ncucr_pei, 
  dmu_ncu_ie, 
  ncu_dmu_iei, 
  sii_ncu_dmua_pe, 
  ncu_sii_dmua_pei, 
  sii_ncu_niud_pe, 
  ncu_sii_niud_pei, 
  sii_ncu_dmud_pe, 
  ncu_sii_dmud_pei, 
  sii_ncu_niua_pe, 
  ncu_sii_niua_pei, 
  sii_ncu_dmuctag_ce, 
  ncu_sii_dmuctag_cei, 
  sii_ncu_niuctag_ce, 
  ncu_sii_niuctag_cei, 
  sii_ncu_dmuctag_ue, 
  ncu_sii_dmuctag_uei, 
  sii_ncu_niuctag_ue, 
  ncu_sii_niuctag_uei, 
  mcu0_ncu_ecc, 
  ncu_mcu0_ecci, 
  mcu0_ncu_fbr, 
  ncu_mcu0_fbri, 
  mcu0_ncu_fbu, 
  ncu_mcu0_fbui, 
  mcu1_ncu_ecc, 
  ncu_mcu1_ecci, 
  mcu1_ncu_fbr, 
  ncu_mcu1_fbri, 
  mcu1_ncu_fbu, 
  ncu_mcu1_fbui, 
  mcu2_ncu_ecc, 
  ncu_mcu2_ecci, 
  mcu2_ncu_fbr, 
  ncu_mcu2_fbri, 
  mcu2_ncu_fbu, 
  ncu_mcu2_fbui, 
  mcu3_ncu_ecc, 
  ncu_mcu3_ecci, 
  mcu3_ncu_fbr, 
  ncu_mcu3_fbri, 
  mcu3_ncu_fbu, 
  ncu_mcu3_fbui, 
  ncuctag_ce, 
  ncuctag_cei, 
  ncuctag_ue, 
  ncuctag_uei, 
  ncusiid_pei, 
  ncusiid_pe, 
  dmubuf_pue, 
  dmubuf_pei, 
  iobuf_ue_f, 
  iobuf_uei, 
  cpubuf_ue, 
  cpubuf_uei, 
  cpubuf_pe, 
  cpubuf_pei, 
  intbuf_ue_f, 
  intbuf_uei, 
  mondotbl_pe_f, 
  mondotbl_pei, 
  siierrsyn, 
  siierrsyn_done, 
  dmubufsyn, 
  cpubufsyn, 
  ncudpsyn, 
  wmr_protect, 
  aclk_wmr) ;
wire [3:0] intman_par_din;
wire [5:0] intman_ct_din;
wire [5:0] intman_vec_din;
wire [3:0] intman_par_dout;
wire [5:0] intman_ct_dout;
wire [5:0] intman_vec_dout;
wire ncu_man_ucb_buf_acpt_d1;
wire ncu_man_ucb_buf_acpt_d2;
wire ncu_man_ucb_buf_acpt_d3;
wire ncu_man_ucb_c2i_packet_is_rd_req;
wire ncu_man_ack_buf_full;
wire ncu_man_int_buf_full;
wire xir_busy;
wire rasper_ipg;
wire ncu_man_ucb_buf_acpt_d1_ff_scanin;
wire ncu_man_ucb_buf_acpt_d1_ff_scanout;
wire l1clk;
wire ncu_man_ucb_buf_acpt_d2_ff_scanin;
wire ncu_man_ucb_buf_acpt_d2_ff_scanout;
wire ncu_man_ucb_buf_acpt_d3_ff_scanin;
wire ncu_man_ucb_buf_acpt_d3_ff_scanout;
wire ncu_man_ucb_c2i_packet_data_ff_scanin;
wire ncu_man_ucb_c2i_packet_data_ff_scanout;
wire [63:0] ncu_man_ucb_c2i_packet_data;
wire ncu_man_ucb_c2i_packet_addr_ff_scanin;
wire ncu_man_ucb_c2i_packet_addr_ff_scanout;
wire [39:0] ncu_man_ucb_c2i_packet_addr;
wire ncu_man_ucb_c2i_packet_buf_id_ff_scanin;
wire ncu_man_ucb_c2i_packet_buf_id_ff_scanout;
wire [1:0] ncu_man_ucb_c2i_packet_buf_id;
wire ncu_man_ucb_c2i_packet_cputhr_ff_scanin;
wire ncu_man_ucb_c2i_packet_cputhr_ff_scanout;
wire [5:0] ncu_man_ucb_c2i_packet_cputhr;
wire ncu_man_ucb_c2i_packet_is_rd_req_ff_scanin;
wire ncu_man_ucb_c2i_packet_is_rd_req_ff_scanout;
wire ncu_man_ucb_c2i_packet_is_wr_req_ff_scanin;
wire ncu_man_ucb_c2i_packet_is_wr_req_ff_scanout;
wire ncu_man_ucb_c2i_packet_is_wr_req;
wire ncu_man_acc;
wire ncu_asi_a_acc;
wire ncu_asi_b_acc;
wire ncu_asi_c_acc;
wire creg_intman_dec;
wire creg_sernum_dec;
wire creg_coreavail_dec;
wire creg_fusestat_dec;
wire creg_bankavail_dec;
wire creg_bank_en_dec;
wire creg_bank_en_status_dec;
wire creg_l2idxhs_en_dec;
wire creg_l2idxhs_en_status_dec;
wire creg_mondoinvec_dec;
wire creg_mem32_base_dec;
wire creg_mem32_mask_dec;
wire creg_mem64_base_dec;
wire creg_mem64_mask_dec;
wire creg_iocon_base_dec;
wire creg_iocon_mask_dec;
wire creg_mmufsh_dec;
wire creg_esr_dec;
wire creg_ele_dec;
wire creg_eie_dec;
wire creg_ejr_dec;
wire creg_fee_dec;
wire creg_per_dec;
wire creg_siisyn_dec;
wire creg_ncusyn_dec;
wire creg_ncu_scksel_dec;
wire creg_dbgtrigen_dec;
wire asi_coreavail_dec;
wire asi_core_enable_status_dec;
wire asi_core_enable_dec;
wire asi_xir_steering_dec;
wire asi_core_running_dec;
wire asi_core_running_status_dec;
wire asi_core_runningw1s_dec;
wire asi_core_runningw1c_dec;
wire asi_ras_err_steering_dec;
wire asi_wmr_vec_mask_dec;
wire asi_cmp_tick_enable_dec;
wire asi_intvecdisp_dec;
wire creg_nomatch;
wire ncu_man_int_buf_wr;
wire intvecdisp_int_wr;
wire rasper_int_wr;
wire xir_int_wr;
wire [24:0] ncu_man_int_buf_din;
wire [24:0] xir_int_pkt;
wire [24:0] rasper_int_pkt;
wire [24:0] intvecdisp_int_pkt;
wire aa_wr_buf0;
wire aa_buf1_vld;
wire aa_buf0_vld;
wire aa_buf1_older;
wire aa_wr_buf1;
wire aa_rd_buf0;
wire ncu_man_int_buf_rd;
wire aa_rd_buf1;
wire aa_rd_buf;
wire aa_buf1_older_inv;
wire aa_buf1_older_ff_scanin;
wire aa_buf1_older_ff_scanout;
wire aa_en_vld0;
wire aa_en_vld1;
wire aa_buf0_vld_ff_scanin;
wire aa_buf0_vld_ff_scanout;
wire aa_buf1_vld_ff_scanin;
wire aa_buf1_vld_ff_scanout;
wire aa_buf0_obj_ff_scanin;
wire aa_buf0_obj_ff_scanout;
wire [24:0] aa_buf0_obj;
wire aa_buf1_obj_ff_scanin;
wire aa_buf1_obj_ff_scanout;
wire [24:0] aa_buf1_obj;
wire [24:0] ncu_man_int_buf_dout;
wire ncu_man_int_buf_vld;
wire ncu_man_ack_buf_wr;
wire [63:0] ncu_man_ack_i2c_packet_data;
wire [63:0] creg_intman;
wire [63:0] creg_sernum;
wire [63:0] creg_coreavail;
wire [63:0] creg_fusestat;
wire [63:0] creg_bankavail;
wire [63:0] creg_bank_en;
wire [63:0] creg_bank_en_status;
wire [63:0] creg_l2idxhs_en;
wire [63:0] creg_l2idxhs_en_status;
wire [63:0] creg_mondoinvec;
wire [63:0] creg_mem32_base;
wire [63:0] creg_mem32_mask;
wire [63:0] creg_mem64_base;
wire [63:0] creg_mem64_mask;
wire [63:0] creg_iocon_base;
wire [63:0] creg_iocon_mask;
wire [63:0] creg_esr;
wire [63:0] creg_ele;
wire [63:0] creg_eie;
wire [63:0] creg_ejr;
wire [63:0] creg_fee;
wire [63:0] creg_per;
wire [63:0] creg_siisyn;
wire [63:0] creg_ncusyn;
wire [63:0] creg_ncu_scksel;
wire [63:0] creg_dbgtrigen;
wire [63:0] creg_core_enable_status;
wire [63:0] creg_core_enable;
wire [63:0] xir_steering;
wire [63:0] creg_err_steering;
wire [63:0] creg_wmr_vec_mask;
wire [63:0] creg_cmp_tick_enable;
wire [63:0] creg_core_running_status;
wire [3:0] ncu_man_ack_i2c_packet_type;
wire intman_pe_n;
wire [127:0] ncu_man_ack_i2c_packet;
wire [127:0] ncu_man_ack_buf_din;
wire bb_wr_buf0;
wire bb_buf1_vld;
wire bb_buf0_vld;
wire bb_buf1_older;
wire bb_wr_buf1;
wire bb_rd_buf0;
wire ncu_man_ack_buf_rd;
wire bb_rd_buf1;
wire bb_rd_buf;
wire bb_buf1_older_inv;
wire bb_buf1_older_ff_scanin;
wire bb_buf1_older_ff_scanout;
wire bb_en_vld0;
wire bb_en_vld1;
wire bb_buf0_vld_ff_scanin;
wire bb_buf0_vld_ff_scanout;
wire bb_buf1_vld_ff_scanin;
wire bb_buf1_vld_ff_scanout;
wire bb_buf0_obj_ff_scanin;
wire bb_buf0_obj_ff_scanout;
wire [127:0] bb_buf0_obj;
wire bb_buf1_obj_ff_scanin;
wire bb_buf1_obj_ff_scanout;
wire [127:0] bb_buf1_obj;
wire [127:0] ncu_man_ack_buf_dout;
wire ncu_man_ack_buf_vld;
wire [6:0] lhs_intman_addr;
wire [6:0] intman_tbl_addr;
wire c2i_rd_intman;
wire intman_pchk_v;
wire [3:0] intman_pchk;
wire intman_pei;
wire intman_pe_ff_scanin;
wire intman_pe_ff_scanout;
wire intman_pe;
wire intmansyn_ff_scanin;
wire intmansyn_ff_scanout;
wire [54:0] intmansyn;
wire [54:0] intmansyn_n;
wire asi_intvecdisp_wr;
wire [5:0] intvecdisp_int_vec;
wire [5:0] intvecdisp_int_thr;
wire coreavail_done;
wire coreavail_dshift_d1;
wire coreavail_dshift_d2;
wire bankavail_done;
wire bankavail_dshift_d1;
wire bankavail_dshift_d2;
wire coreavail_en;
wire bankavail_en;
wire fuse_stat_en;
wire fuse_stat_dshift_d1;
wire sernum0_en;
wire sernum0_dshift_d1;
wire sernum1_en;
wire sernum1_dshift_d1;
wire sernum2_en;
wire sernum2_dshift_d1;
wire fuse_data_d1_ff_scanin;
wire fuse_data_d1_ff_scanout;
wire fuse_data_d1;
wire coreavail_dshift_d1_ff_scanin;
wire coreavail_dshift_d1_ff_scanout;
wire coreavail_dshift_d2_ff_scanin;
wire coreavail_dshift_d2_ff_scanout;
wire bankavail_dshift_d1_ff_scanin;
wire bankavail_dshift_d1_ff_scanout;
wire bankavail_dshift_d2_ff_scanin;
wire bankavail_dshift_d2_ff_scanout;
wire fuse_stat_dshift_d1_ff_scanin;
wire fuse_stat_dshift_d1_ff_scanout;
wire sernum0_dshift_d1_ff_scanin;
wire sernum0_dshift_d1_ff_scanout;
wire sernum1_dshift_d1_ff_scanin;
wire sernum1_dshift_d1_ff_scanout;
wire sernum2_dshift_d1_ff_scanin;
wire sernum2_dshift_d1_ff_scanout;
wire [21:0] sernum0_next;
wire [21:0] sernum0;
wire sernum0_ff_scanin;
wire sernum0_ff_scanout;
wire [21:0] sernum1_next;
wire [21:0] sernum1;
wire sernum1_ff_scanin;
wire sernum1_ff_scanout;
wire [19:0] sernum2_next;
wire [19:0] sernum2;
wire sernum2_ff_scanin;
wire sernum2_ff_scanout;
wire [63:0] fusestat_next;
wire [63:0] fusestat;
wire [63:0] fusestat_ff_in;
wire fusestat_ff_scanin;
wire fusestat_ff_scanout;
wire [63:0] fusestat_ff_out;
wire [7:0] coreavail_next;
wire [7:0] coreavail_ff_in;
wire coreavail_ff_scanin;
wire coreavail_ff_scanout;
wire [7:0] coreavail_ff_out;
wire [7:0] bankavail_next;
wire [7:0] bankavail;
wire [7:0] bankavail_ff_in;
wire bankavail_ff_scanin;
wire bankavail_ff_scanout;
wire [7:0] bankavail_ff_out;
wire creg_mondoinvec_wr;
wire creg_mondoinvec_ff_scanin;
wire creg_mondoinvec_ff_scanout;
wire creg_mem32_base_wr;
wire creg_mem32_en_ff_scanin;
wire creg_mem32_en_ff_scanout;
wire creg_mem32_base_ff_scanin;
wire creg_mem32_base_ff_scanout;
wire creg_mem32_mask_wr;
wire creg_mem32_mask_ff_scanin;
wire creg_mem32_mask_ff_scanout;
wire creg_mem64_base_wr;
wire creg_mem64_en_ff_scanin;
wire creg_mem64_en_ff_scanout;
wire creg_mem64_base_ff_scanin;
wire creg_mem64_base_ff_scanout;
wire creg_mem64_mask_wr;
wire creg_mem64_mask_ff_scanin;
wire creg_mem64_mask_ff_scanout;
wire creg_iocon_base_wr;
wire creg_iocon_en_ff_scanin;
wire creg_iocon_en_ff_scanout;
wire creg_iocon_base_ff_scanin;
wire creg_iocon_base_ff_scanout;
wire creg_iocon_mask_wr;
wire creg_iocon_mask_ff_scanin;
wire creg_iocon_mask_ff_scanout;
wire creg_mmufsh_wr;
wire creg_mmufsh_ff_scanin;
wire creg_mmufsh_ff_scanout;
wire mmufsh_vld_next;
wire mmufsh_vld_ff_scanin;
wire mmufsh_vld_ff_scanout;
wire tap_mondo_acc_outstanding;
wire tap_mondo_acc_outstanding_d1;
wire asi_ras_err_steering_wr;
wire asi_wmr_vec_mask_wr;
wire asi_cmp_tick_enable_wr;
wire [5:0] ras_err_steering_n;
wire [5:0] ras_err_steering;
wire wmr_vec_mask_n;
wire wmr_vec_mask;
wire cmp_tick_enable_n;
wire asi_wmr_vec_mask_ff_scanin;
wire asi_wmr_vec_mask_ff_scanout;
wire asi_cmp_tick_enable_ff_scanin;
wire asi_cmp_tick_enable_ff_scanout;
wire asi_ras_err_steering_ff_scanin;
wire asi_ras_err_steering_ff_scanout;
wire tap_mondo_acc_addr_39_16_ff_scanin;
wire tap_mondo_acc_addr_39_16_ff_scanout;
wire [23:0] tap_mondo_acc_addr_39_16;
wire tap_mondo_acc_addr_s_ff_scanin;
wire tap_mondo_acc_addr_s_ff_scanout;
wire tap_mondo_din_s_ff_scanin;
wire tap_mondo_din_s_ff_scanout;
wire ncu_int_ucb_c2i_packet_is_rd_req_ff_scanin;
wire ncu_int_ucb_c2i_packet_is_rd_req_ff_scanout;
wire ncu_int_ucb_c2i_packet_is_rd_req;
wire ncu_int_ucb_c2i_packet_is_wr_req_ff_scanin;
wire ncu_int_ucb_c2i_packet_is_wr_req_ff_scanout;
wire ncu_int_ucb_c2i_packet_is_wr_req;
wire tap_mondo_acc_seq_next;
wire tap_mondo_acc_seq;
wire tap_mondo_acc_seq_ff_scanin;
wire tap_mondo_acc_seq_ff_scanout;
wire tap_mondo_acc_addr_invld_d2_ff_scanin;
wire tap_mondo_acc_addr_invld_d2_ff_scanout;
wire tap_mondo_acc_addr_invld_d2;
wire tap_mondo_acc_seq_d2_ff_scanin;
wire tap_mondo_acc_seq_d2_ff_scanout;
wire tap_mondo_acc_seq_d2;
wire tap_mondo_dout_d2_ff_scanin;
wire tap_mondo_dout_d2_ff_scanout;
wire [63:0] tap_mondo_dout_d2;
wire tap_mondo_acc_outstanding_d1_ff_scanin;
wire tap_mondo_acc_outstanding_d1_ff_scanout;
wire tap_mondo_rd_done;
wire [3:0] ncu_int_ucb_i2c_packet_type;
wire [127:0] ncu_int_ucb_i2c_packet;
wire ncu_int_ack_packet_ff_scanin;
wire ncu_int_ack_packet_ff_scanout;
wire ncu_int_ack_vld_next;
wire ncu_int_ack_vld_ff_scanin;
wire ncu_int_ack_vld_ff_scanout;
wire bounce_ack_buf_wr;
wire bounce_ack_buf_full;
wire [127:0] bounce_ack_buf_din;
wire cc_wr_buf0;
wire cc_buf1_vld;
wire cc_buf0_vld;
wire cc_buf1_older;
wire cc_wr_buf1;
wire cc_rd_buf0;
wire bounce_ack_buf_rd;
wire cc_rd_buf1;
wire cc_rd_buf;
wire cc_buf1_older_inv;
wire cc_buf1_older_ff_scanin;
wire cc_buf1_older_ff_scanout;
wire cc_en_vld0;
wire cc_en_vld1;
wire cc_buf0_vld_ff_scanin;
wire cc_buf0_vld_ff_scanout;
wire cc_buf1_vld_ff_scanin;
wire cc_buf1_vld_ff_scanout;
wire cc_buf0_obj_ff_scanin;
wire cc_buf0_obj_ff_scanout;
wire [127:0] cc_buf0_obj;
wire cc_buf1_obj_ff_scanin;
wire cc_buf1_obj_ff_scanout;
wire [127:0] cc_buf1_obj;
wire [127:0] bounce_ack_buf_dout;
wire bounce_ack_buf_vld;
wire rd_nack_buf_wr;
wire rd_nack_buf_full;
wire [63:0] rd_nack_buf_din;
wire dd_wr_buf0;
wire dd_buf1_vld;
wire dd_buf0_vld;
wire dd_buf1_older;
wire dd_wr_buf1;
wire dd_rd_buf0;
wire rd_nack_buf_rd;
wire dd_rd_buf1;
wire dd_rd_buf;
wire dd_buf1_older_inv;
wire dd_buf1_older_ff_scanin;
wire dd_buf1_older_ff_scanout;
wire dd_en_vld0;
wire dd_en_vld1;
wire dd_buf0_vld_ff_scanin;
wire dd_buf0_vld_ff_scanout;
wire dd_buf1_vld_ff_scanin;
wire dd_buf1_vld_ff_scanout;
wire dd_buf0_obj_ff_scanin;
wire dd_buf0_obj_ff_scanout;
wire [63:0] dd_buf0_obj;
wire dd_buf1_obj_ff_scanin;
wire dd_buf1_obj_ff_scanout;
wire [63:0] dd_buf1_obj;
wire [63:0] rd_nack_buf_dout;
wire rd_nack_buf_vld;
wire wmr_upd_en;
wire wmr_protect_d1;
wire wmr_protect_d2;
wire wmr_protect_d1_ff_scanin;
wire wmr_protect_d1_ff_scanout;
wire wmr_protect_d2_ff_scanin;
wire wmr_protect_d2_ff_scanout;
wire por_upd_en_next;
wire por_upd_en;
wire por_upd_en_d1;
wire por_upd_en_ff_scanin;
wire por_upd_en_ff_scanout;
wire [7:0] core_enable_a0_default;
wire [7:0] c2i_core_en;
wire c2i_core_en_a0;
wire asi_core_en_wr;
wire [7:0] core_enable_next;
wire [7:0] core_enable;
wire [7:0] core_enable_ff_in;
wire core_enable_ff_scanin;
wire core_enable_ff_scanout;
wire [7:0] core_enable_ff_out;
wire [7:0] core_enable_status_next;
wire [7:0] core_enable_status;
wire [7:0] core_enable_status_ff_in;
wire core_enable_status7_ff_scanin;
wire core_enable_status7_ff_scanout;
wire core_enable_status6_ff_scanin;
wire core_enable_status6_ff_scanout;
wire core_enable_status5_ff_scanin;
wire core_enable_status5_ff_scanout;
wire core_enable_status4_ff_scanin;
wire core_enable_status4_ff_scanout;
wire core_enable_status3_ff_scanin;
wire core_enable_status3_ff_scanout;
wire core_enable_status2_ff_scanin;
wire core_enable_status2_ff_scanout;
wire core_enable_status1_ff_scanin;
wire core_enable_status1_ff_scanout;
wire core_enable_status0_ff_scanin;
wire core_enable_status0_ff_scanout;
wire coreavail_done_d1_ff_scanin;
wire coreavail_done_d1_ff_scanout;
wire coreavail_done_d1;
wire asi_xir_steering_wr;
wire [63:0] core_enable_status64;
wire [63:0] c2i_data_by_core_enable_status;
wire [63:0] xir_steering_next;
wire xir_snapd_vec_vld;
wire [55:0] xir_snapd_vec;
wire [55:0] xir_snapd_vec_next;
wire xir_trigger_d1;
wire xir_ld_mini_vec;
wire xir_srvcd_mini_vec_vld;
wire [7:0] xir_mini_vec_next;
wire xir_srvc;
wire [7:0] xir_mini_vec;
wire xir_trigger_d0_next;
wire xir_trigger;
wire [2:0] xir_cpuid_p1;
wire [2:0] xir_cpuid;
wire [2:0] xir_cpuid_next;
wire xir_cpuid_inc;
wire xir_busy_next;
wire xir_trigger_d0;
wire xir_busy_falling;
wire xir_busy_d1;
wire ncu_rst_xir_done_next;
wire xir_trigger_next;
wire xir_trigger_q;
wire [63:0] xir_steering_ff_in;
wire xir_steering_ff_scanin;
wire xir_steering_ff_scanout;
wire [63:0] xir_steering_ff_out;
wire xir_trigger_ff_scanin;
wire xir_trigger_ff_scanout;
wire xir_trigger_d0_ff_scanin;
wire xir_trigger_d0_ff_scanout;
wire xir_trigger_d1_ff_scanin;
wire xir_trigger_d1_ff_scanout;
wire xir_snapd_vec_ff_scanin;
wire xir_snapd_vec_ff_scanout;
wire xir_mini_vec_ff_scanin;
wire xir_mini_vec_ff_scanout;
wire xir_cpuid_ff_scanin;
wire xir_cpuid_ff_scanout;
wire xir_busy_ff_scanin;
wire xir_busy_ff_scanout;
wire xir_busy_d1_ff_scanin;
wire xir_busy_d1_ff_scanout;
wire ncu_rst_xir_done_ff_scanin;
wire ncu_rst_xir_done_ff_scanout;
wire [63:0] enable_status_lowest_thr_1hot;
wire [63:0] core_running_a0_default;
wire [63:0] c2i_w1cdata_by_core_running;
wire c2i_core_running_a0;
wire c2i_core_runningw1c_a0;
wire [63:0] core_runningrw_data;
wire [63:0] core_runningw1c_data;
wire asi_core_running_wr;
wire asi_core_runningw1s_wr;
wire asi_core_runningw1c_wr;
wire [63:0] core_running_next;
wire wake_thread;
wire core_running_ff_scanin;
wire core_running_ff_scanout;
wire core_running_ff_in;
wire core_running0_ff_scanin;
wire core_running0_ff_scanout;
wire core_running_ff_out;
wire unpark_thread_d1_ff_scanin;
wire unpark_thread_d1_ff_scanout;
wire unpark_thread_d1;
wire unpark_thread_d2_ff_scanin;
wire unpark_thread_d2_ff_scanout;
wire unpark_thread_d2;
wire wake_ok__ff_scanin;
wire wake_ok__ff_scanout;
wire wake_ok_inv;
wire wake_thread_n;
wire wake_thread_ff_scanin;
wire wake_thread_ff_scanout;
wire core_running_status_ff_scanin;
wire core_running_status_ff_scanout;
wire core_running_status_ff_in;
wire core_running_status0_ff_scanin;
wire core_running_status0_ff_scanout;
wire core_running_status_ff_out;
wire [3:0] bankavail_pair;
wire bank_en_wr;
wire [7:0] c2i_bank_en;
wire c2i_bank_en_a0;
wire [7:0] bank_en_next;
wire [7:0] bank_en;
wire [7:0] bank_en_ff_in;
wire bank_en_ff_scanin;
wire bank_en_ff_scanout;
wire [7:0] bank_en_ff_out;
wire l2pm_en;
wire [7:0] bank_en_full_status;
wire [3:0] bank_en_pair_status;
wire [4:0] bank_en_final_status;
wire [4:0] l2pm_preview_ff_din;
wire [4:0] l2pm_ff_din;
wire l2pm_preview_ff_scanin;
wire l2pm_preview_ff_scanout;
wire [4:0] l2pm_preview_ff_q;
wire [4:0] l2pm_preview;
wire l2pm_ff_scanin;
wire l2pm_ff_scanout;
wire [3:1] l2pm_ff_q;
wire l2idxhs_en_wr;
wire l2idxhs_en_ff_scanin;
wire l2idxhs_en_ff_scanout;
wire l2idxhs_en;
wire l2idxhs_en_status_ff_scanin;
wire l2idxhs_en_status_ff_scanout;
wire creg_esr_wr;
wire iobuf_ue_ff_scanin;
wire iobuf_ue_ff_scanout;
wire iobuf_ue;
wire intbuf_ue_ff_scanin;
wire intbuf_ue_ff_scanout;
wire intbuf_ue;
wire mondotbl_pe_ff_scanin;
wire mondotbl_pe_ff_scanout;
wire mondotbl_pe;
wire mcu3_ncu_ecc_d_ff_scanin;
wire mcu3_ncu_ecc_d_ff_scanout;
wire mcu3_ncu_ecc_d;
wire mcu3_ncu_fbr_d_ff_scanin;
wire mcu3_ncu_fbr_d_ff_scanout;
wire mcu3_ncu_fbr_d;
wire mcu3_ncu_fbu_d_ff_scanin;
wire mcu3_ncu_fbu_d_ff_scanout;
wire mcu3_ncu_fbu_d;
wire mcu2_ncu_ecc_d_ff_scanin;
wire mcu2_ncu_ecc_d_ff_scanout;
wire mcu2_ncu_ecc_d;
wire mcu2_ncu_fbr_d_ff_scanin;
wire mcu2_ncu_fbr_d_ff_scanout;
wire mcu2_ncu_fbr_d;
wire mcu2_ncu_fbu_d_ff_scanin;
wire mcu2_ncu_fbu_d_ff_scanout;
wire mcu2_ncu_fbu_d;
wire mcu1_ncu_ecc_d_ff_scanin;
wire mcu1_ncu_ecc_d_ff_scanout;
wire mcu1_ncu_ecc_d;
wire mcu1_ncu_fbr_d_ff_scanin;
wire mcu1_ncu_fbr_d_ff_scanout;
wire mcu1_ncu_fbr_d;
wire mcu1_ncu_fbu_d_ff_scanin;
wire mcu1_ncu_fbu_d_ff_scanout;
wire mcu1_ncu_fbu_d;
wire mcu0_ncu_ecc_d_ff_scanin;
wire mcu0_ncu_ecc_d_ff_scanout;
wire mcu0_ncu_ecc_d;
wire mcu0_ncu_fbr_d_ff_scanin;
wire mcu0_ncu_fbr_d_ff_scanout;
wire mcu0_ncu_fbr_d;
wire mcu0_ncu_fbu_d_ff_scanin;
wire mcu0_ncu_fbu_d_ff_scanout;
wire mcu0_ncu_fbu_d;
wire niu_ncu_d_pe_d_ff_scanin;
wire niu_ncu_d_pe_d_ff_scanout;
wire niu_ncu_d_pe_d;
wire niu_ncu_ctag_ue_d_ff_scanin;
wire niu_ncu_ctag_ue_d_ff_scanout;
wire niu_ncu_ctag_ue_d;
wire niu_ncu_ctag_ce_d_ff_scanin;
wire niu_ncu_ctag_ce_d_ff_scanout;
wire niu_ncu_ctag_ce_d;
wire sio_ncu_ctag_ce_d_ff_scanin;
wire sio_ncu_ctag_ce_d_ff_scanout;
wire sio_ncu_ctag_ce_d;
wire sio_ncu_ctag_ue_d_ff_scanin;
wire sio_ncu_ctag_ue_d_ff_scanout;
wire sio_ncu_ctag_ue_d;
wire dmu_ncu_d_pe_d_ff_scanin;
wire dmu_ncu_d_pe_d_ff_scanout;
wire dmu_ncu_d_pe_d;
wire dmu_ncu_siicr_pe_d_ff_scanin;
wire dmu_ncu_siicr_pe_d_ff_scanout;
wire dmu_ncu_siicr_pe_d;
wire dmu_ncu_ctag_ue_d_ff_scanin;
wire dmu_ncu_ctag_ue_d_ff_scanout;
wire dmu_ncu_ctag_ue_d;
wire dmu_ncu_ctag_ce_d_ff_scanin;
wire dmu_ncu_ctag_ce_d_ff_scanout;
wire dmu_ncu_ctag_ce_d;
wire dmu_ncu_ncucr_pe_d_ff_scanin;
wire dmu_ncu_ncucr_pe_d_ff_scanout;
wire dmu_ncu_ncucr_pe_d;
wire dmu_ncu_ie_d_ff_scanin;
wire dmu_ncu_ie_d_ff_scanout;
wire dmu_ncu_ie_d;
wire sii_ncu_dmua_pe_d_ff_scanin;
wire sii_ncu_dmua_pe_d_ff_scanout;
wire sii_ncu_dmua_pe_d;
wire sii_ncu_niud_pe_d_ff_scanin;
wire sii_ncu_niud_pe_d_ff_scanout;
wire sii_ncu_niud_pe_d;
wire sii_ncu_dmud_pe_d_ff_scanin;
wire sii_ncu_dmud_pe_d_ff_scanout;
wire sii_ncu_dmud_pe_d;
wire sii_ncu_niua_pe_d_ff_scanin;
wire sii_ncu_niua_pe_d_ff_scanout;
wire sii_ncu_niua_pe_d;
wire sii_ncu_dmuctag_ce_d_ff_scanin;
wire sii_ncu_dmuctag_ce_d_ff_scanout;
wire sii_ncu_dmuctag_ce_d;
wire sii_ncu_niuctag_ce_d_ff_scanin;
wire sii_ncu_niuctag_ce_d_ff_scanout;
wire sii_ncu_niuctag_ce_d;
wire sii_ncu_dmuctag_ue_d_ff_scanin;
wire sii_ncu_dmuctag_ue_d_ff_scanout;
wire sii_ncu_dmuctag_ue_d;
wire sii_ncu_niuctag_ue_d_ff_scanin;
wire sii_ncu_niuctag_ue_d_ff_scanout;
wire sii_ncu_niuctag_ue_d;
wire [42:0] raserr_in;
wire [42:0] rasesr_in;
wire [42:0] rasele;
wire [42:0] rasesr_din;
wire rasesr2per_tgr;
wire [42:0] rasesr;
wire [42:0] rasesr_n;
wire dbgtrigen;
wire rasesr_ff_scanin;
wire rasesr_ff_scanout;
wire rasesr_v_n;
wire rasesr_v_ff_scanin;
wire rasesr_v_ff_scanout;
wire rasesr_v;
wire creg_ele_wr;
wire [42:0] rasele_ff_in;
wire rasele_ff_scanin;
wire rasele_ff_scanout;
wire [42:0] rasele_ff_out;
wire [5:0] siierrsyn_va;
wire [5:0] siierrsyn_vb;
wire [5:0] siisynlog_en;
wire [2:0] siietag;
wire [5:0] ncuerrsyn_va;
wire [42:0] rasper;
wire ncuerrsyn_vb;
wire creg_eie_wr;
wire raseie_ff_scanin;
wire raseie_ff_scanout;
wire [42:0] raseie;
wire creg_ejr_wr;
wire rasejr_ff_scanin;
wire rasejr_ff_scanout;
wire [42:0] rasejr;
wire bit20_d1_ff_scanin;
wire bit20_d1_ff_scanout;
wire bit20_d1;
wire bit20_d2_ff_scanin;
wire bit20_d2_ff_scanout;
wire bit20_d2;
wire bit20_d3_ff_scanin;
wire bit20_d3_ff_scanout;
wire bit20_d3;
wire bit20_d4_ff_scanin;
wire bit20_d4_ff_scanout;
wire bit20_d4;
wire bit20_d5_ff_scanin;
wire bit20_d5_ff_scanout;
wire bit20_d5;
wire ncu_dmu_d_pei_f;
wire ncu_dmu_siicr_pei_f;
wire ncu_dmu_ctag_uei_f;
wire ncu_dmu_ctag_cei_f;
wire ncu_dmu_ncucr_pei_f;
wire ncu_dmu_iei_f;
wire ncu_niu_ctag_cei_f;
wire ncu_niu_ctag_uei_f;
wire ncu_niu_d_pei_f;
wire creg_fee_wr;
wire rasfee_ff_scanin;
wire rasfee_ff_scanout;
wire [42:0] rasfee;
wire ncu_rst_fatal_error_n;
wire ncu_rst_fatal_error_ff_scanin;
wire ncu_rst_fatal_error_ff_scanout;
wire creg_per_wr;
wire [42:0] rasper_in;
wire rasper_in_v;
wire [42:0] rasper_n;
wire rasper_ff_scanin;
wire rasper_ff_scanout;
wire rasper_v;
wire rasper_v_n;
wire rasper_v_ff_scanin;
wire rasper_v_ff_scanout;
wire rasper_ipg_n;
wire rasper_srvc;
wire rasper_ipg_ff_scanin;
wire rasper_ipg_ff_scanout;
wire rasesr2per_tgr_d_ff_scanin;
wire rasesr2per_tgr_d_ff_scanout;
wire rasesr2per_tgr_d;
wire ncu_tcu_soc_error_ff_scanin;
wire ncu_tcu_soc_error_ff_scanout;
wire [3:0] ucb_soc_int_type;
wire creg_siisyn_wr;
wire [58:0] siisyn_n;
wire siierrsyn_vc;
wire siisyn_v;
wire siisyn_ff_scanin;
wire siisyn_ff_scanout;
wire [58:0] siisyn;
wire siisyn_v_n;
wire siisyn_v_ff_scanin;
wire siisyn_v_ff_scanout;
wire creg_ncusyn_wr;
wire creg_ncu_scksel_wr;
wire creg_dbgtrigen_wr;
wire [60:0] ncuerrsyn;
wire [4:0] ncu_etag;
wire [60:0] ncusyn_n;
wire ncuerrsyn_vc;
wire ncusyn_v;
wire ncusyn_ff_scanin;
wire ncusyn_ff_scanout;
wire [60:0] ncusyn;
wire ncusyn_v_n;
wire ncusyn_v_ff_scanin;
wire ncusyn_v_ff_scanout;
wire [1:0] ncu_scksel_n;
wire [1:0] ncu_scksel;
wire ncu_scksel_ff_scanin;
wire ncu_scksel_ff_scanout;
wire scksel_sh_ff_scanin;
wire scksel_sh_ff_scanout;
wire dbgtrigen_n;
wire dbgtrigen_ff_scanin;
wire dbgtrigen_ff_scanout;
wire siclk;
wire soclk;
wire se;
wire pce_ov;
wire stop;
wire wmrp_chain_scanout;


////////////////////////////////////////////////////////////////////////
// Signal declarations
////////////////////////////////////////////////////////////////////////
// Global interface
input		iol2clk;
 				    
input		scan_in;
output		scan_out;
input		tcu_pce_ov;
input		tcu_clk_stop;
input		tcu_scan_en;
input		tcu_aclk;
input		tcu_bclk;
input		tcu_dbr_gateoff;
output[1:0]	ncu_scksel_sh;	// goes to ssisif_ctl

// c2i interface
// Accessing IOB control registers
// Bounce back master request/ack
// Read Nack
input		ncu_man_ucb_sel;
output		ncu_man_ucb_buf_acpt;

input		ncu_int_ucb_sel;
output		ncu_int_ucb_buf_acpt;

input		bounce_ucb_sel;
output		bounce_ucb_buf_acpt;

input		c2i_packet_vld;

input		c2i_packet_is_rd_req;
input		c2i_packet_is_wr_req;
input [127:0]	c2i_packet;

input		rd_nack_ucb_sel;
output		rd_nack_ucb_buf_acpt;
input [63:0]	c2i_rd_nack_packet;

// c2i interface
// Interrupt status tbl read/write from TAP
output [21:0]	tap_mondo_acc_addr_s;
output		tap_mondo_acc_seq_s;
output		tap_mondo_wr_s;
output [63:0]	tap_mondo_din_s;

input		tap_mondo_acc_seq_d2_f;
input		tap_mondo_acc_addr_invld_d2_f;
input [63:0]	tap_mondo_dout_d2_f;

// c2i interface
// dmupio related signals
output [63:0]	mmufsh_data;
output 		mmufsh_vld;
input		mmu_ld;

output [11:0]	mem32_mask;
output [11:0]	mem32_base;
output		mem32_en;
output [11:0]	mem64_mask;
output [11:0]	mem64_base;
output		mem64_en;
output [11:0]	iocon_mask;
output [11:0]	iocon_base;
output		iocon_en;

// i2c interface
// Sending interrupts/Returning acks or nacks
input		ncu_man_int_rd;
output		ncu_man_int_vld;
output [24:0]	ncu_man_int_packet;

input		ncu_man_ack_rd; 
output		ncu_man_ack_vld;
output [127:0]	ncu_man_ack_packet;
  
input		ncu_int_ack_rd;
output		ncu_int_ack_vld;
output [127:0]	ncu_int_ack_packet;

input		bounce_ack_rd;
output		bounce_ack_vld;
output [127:0]	bounce_ack_packet;

input		rd_nack_rd;
output		rd_nack_vld;
output [63:0]	rd_nack_packet;

// i2c interface
input [6:0]	io_intman_addr;
output [5:0]	mondoinvec;
output		lhs_intman_acc;
output		intman_pchkf2i2c;
input		io_rd_intman_d2;

// efuse control interface
input		efu_ncu_fuse_data;
input		efu_ncu_coreavail_dshift;
input		efu_ncu_bankavail_dshift;
input		efu_ncu_fusestat_dshift;
input		efu_ncu_sernum0_dshift;
input		efu_ncu_sernum1_dshift;
input		efu_ncu_sernum2_dshift;
output [7:0]	ncu_tcu_bank_avail;
//output [3:0]    ncu_tcu_bank_en_status;

// ASI related
input		rst_ncu_unpark_thread;
input		rst_ncu_xir_inv;
output		ncu_rst_xir_done;

//output [7:0]	core_enable_status;

output ncu_spc7_core_enable_status;
output ncu_spc6_core_enable_status;
output ncu_spc5_core_enable_status;
output ncu_spc4_core_enable_status;
output ncu_spc3_core_enable_status;
output ncu_spc2_core_enable_status;
output ncu_spc1_core_enable_status;
output ncu_spc0_core_enable_status;

output [63:0]	core_running;
input [63:0]	core_running_status;
output [7:0]	coreavail;
output		ncu_dbg1_error_event;
output		tcu_wmr_vec_mask;
output		cmp_tick_enable;

// partial mode
output [4:0]	l2pm ;
output 		ncu_spc_pm;
output		ncu_spc_ba01;

// index hashing
output		l2idxhs_en_status;

/**** intman mem ****/
output [6:0]	intman_tbl_raddr;
output [6:0]	intman_tbl_waddr;
output		intman_tbl_wr;
output		intman_tbl_rden;
output [15:0]	intman_tbl_din; 
input [15:0]	intman_tbl_dout;

// mb1 signals
input [6:0]	mb1_raddr;
input [6:0]	mb1_waddr;
input [7:0]	mb1_wdata;
input		mb1_intman_wr_en;
input		mb1_intman_rd_en;
input		mb1_run;

// ras, err, ecc //
output		ncu_rst_fatal_error;
output		ncu_tcu_soc_error;
output		raserrce;
output		raserrue;

input		niu_ncu_d_pe;
output		ncu_niu_d_pei;
input		niu_ncu_ctag_ue;
output		ncu_niu_ctag_uei;
input		niu_ncu_ctag_ce;
output		ncu_niu_ctag_cei;
input		sio_ncu_ctag_ce;
output		ncu_sio_ctag_cei;
input		sio_ncu_ctag_ue;
output		ncu_sio_ctag_uei;
//input		sio_ncu_d_pe;
output		ncu_sio_d_pei;

input 	        dmu_cr_id_rtn_err;
output		dmu_cr_id_rtn_erri;
input		dmu_ncu_d_pe;
output		ncu_dmu_d_pei;
input		dmu_ncu_siicr_pe;
output		ncu_dmu_siicr_pei;
input		dmu_ncu_ctag_ue;
output		ncu_dmu_ctag_uei;
input		dmu_ncu_ctag_ce;
output		ncu_dmu_ctag_cei;
input		dmu_ncu_ncucr_pe;
output		ncu_dmu_ncucr_pei;
input		dmu_ncu_ie;
output		ncu_dmu_iei;

input		sii_ncu_dmua_pe;
output		ncu_sii_dmua_pei;
input		sii_ncu_niud_pe;
output		ncu_sii_niud_pei;
input		sii_ncu_dmud_pe;
output		ncu_sii_dmud_pei;
input		sii_ncu_niua_pe;
output		ncu_sii_niua_pei;
input		sii_ncu_dmuctag_ce;
output		ncu_sii_dmuctag_cei;
input		sii_ncu_niuctag_ce;
output		ncu_sii_niuctag_cei;
input		sii_ncu_dmuctag_ue;
output		ncu_sii_dmuctag_uei;
input		sii_ncu_niuctag_ue;
output		ncu_sii_niuctag_uei;

input		mcu0_ncu_ecc;
output		ncu_mcu0_ecci;
input		mcu0_ncu_fbr;
output		ncu_mcu0_fbri;
input		mcu0_ncu_fbu;
output		ncu_mcu0_fbui;

input		mcu1_ncu_ecc;
output		ncu_mcu1_ecci;
input		mcu1_ncu_fbr;
output		ncu_mcu1_fbri;
input		mcu1_ncu_fbu;
output		ncu_mcu1_fbui;

input		mcu2_ncu_ecc;
output		ncu_mcu2_ecci;
input		mcu2_ncu_fbr;
output		ncu_mcu2_fbri;
input		mcu2_ncu_fbu;
output		ncu_mcu2_fbui;

input		mcu3_ncu_ecc;
output		ncu_mcu3_ecci;
input		mcu3_ncu_fbr;
output		ncu_mcu3_fbri;
input		mcu3_ncu_fbu;
output		ncu_mcu3_fbui;

input		ncuctag_ce;
output		ncuctag_cei;
input		ncuctag_ue;
output		ncuctag_uei;
output		ncusiid_pei;
input		ncusiid_pe;
input		dmubuf_pue;
output		dmubuf_pei;
input		iobuf_ue_f;
output		iobuf_uei;
input		cpubuf_ue;
output		cpubuf_uei;
input		cpubuf_pe;
output		cpubuf_pei;
input		intbuf_ue_f;
output		intbuf_uei;
input		mondotbl_pe_f;
output		mondotbl_pei;

input [63:0]    siierrsyn;
input           siierrsyn_done;

input [46:0]	dmubufsyn;
input [50:0]	cpubufsyn;
input [15:0]	ncudpsyn;

input		wmr_protect;
input		aclk_wmr;
//assign		wmr_protect=1'b0;

/////////////////////////////////////////////////////////////////////////
assign	intman_tbl_din[15:0] = mb1_run ? {2{mb1_wdata[7:0]}} :
				{intman_par_din[3:0],intman_ct_din[5:0],intman_vec_din[5:0]} ;
assign	intman_par_din[0] = ~^{intman_vec_din[0],intman_vec_din[4],intman_ct_din[2]};
assign	intman_par_din[1] = ~^{intman_vec_din[1],intman_vec_din[5],intman_ct_din[3]};
assign	intman_par_din[2] = ~^{intman_vec_din[2],intman_ct_din[0],intman_ct_din[4]};
assign	intman_par_din[3] = ~^{intman_vec_din[3],intman_ct_din[1],intman_ct_din[5]};

assign	{intman_par_dout[3:0],
	 intman_ct_dout[5:0],
	 intman_vec_dout[5:0]} = intman_tbl_dout[15:0] ;

//reg [3:0]	intvecdisp_int_type;
reg [7:0]	coreavail_lowest_1hot ;
reg [7:0]	xir_srvcd_mini_vec;
reg [2:0]	xir_mini_thr;
reg		xir_mini_vec_vld;
reg [7:0]	enable_status_lowest_1hot;



/*****************************************************************
 * ncu_man_ucb
 *****************************************************************/
// Flop c2i_packet
assign       ncu_man_ucb_buf_acpt = 
			  c2i_packet_vld & ncu_man_ucb_sel &
			 ~ncu_man_ucb_buf_acpt_d1 &
			 ~ncu_man_ucb_buf_acpt_d2 &
			 ~(ncu_man_ucb_buf_acpt_d3 & ncu_man_ucb_c2i_packet_is_rd_req) & //something man ack in process
			 ~(ncu_man_ack_buf_full & c2i_packet_is_rd_req ) &
			 ~((ncu_man_int_buf_full|xir_busy|rasper_ipg) & c2i_packet_is_wr_req )  ;
		                       //~ncu_man_int_buf_full & //~ncu_man_ack_buf_full;

ncu_ctrl_ctl_msff_ctl_macro__width_1 ncu_man_ucb_buf_acpt_d1_ff 
				(
				.scan_in(ncu_man_ucb_buf_acpt_d1_ff_scanin),
				.scan_out(ncu_man_ucb_buf_acpt_d1_ff_scanout),
				.dout		(ncu_man_ucb_buf_acpt_d1),
				.l1clk		(l1clk),
				.din		(ncu_man_ucb_buf_acpt),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_1 ncu_man_ucb_buf_acpt_d2_ff 
				(
				.scan_in(ncu_man_ucb_buf_acpt_d2_ff_scanin),
				.scan_out(ncu_man_ucb_buf_acpt_d2_ff_scanout),
				.dout		(ncu_man_ucb_buf_acpt_d2),
				.l1clk		(l1clk),
				.din		(ncu_man_ucb_buf_acpt_d1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_1 ncu_man_ucb_buf_acpt_d3_ff 
				(
				.scan_in(ncu_man_ucb_buf_acpt_d3_ff_scanin),
				.scan_out(ncu_man_ucb_buf_acpt_d3_ff_scanout),
				.dout		(ncu_man_ucb_buf_acpt_d3),
				.l1clk		(l1clk),
				.din		(ncu_man_ucb_buf_acpt_d2),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_64 ncu_man_ucb_c2i_packet_data_ff  
				(
				.scan_in(ncu_man_ucb_c2i_packet_data_ff_scanin),
				.scan_out(ncu_man_ucb_c2i_packet_data_ff_scanout),
				.dout		(ncu_man_ucb_c2i_packet_data[63:0]),
				.l1clk		(l1clk),
				.en		(ncu_man_ucb_buf_acpt),
				.din		(c2i_packet[127:64]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_40 ncu_man_ucb_c2i_packet_addr_ff  
				(
				.scan_in(ncu_man_ucb_c2i_packet_addr_ff_scanin),
				.scan_out(ncu_man_ucb_c2i_packet_addr_ff_scanout),
				.dout		(ncu_man_ucb_c2i_packet_addr[39:0]),
				.l1clk		(l1clk),
				.en		(ncu_man_ucb_buf_acpt),
				.din		(c2i_packet[54:15]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_2 ncu_man_ucb_c2i_packet_buf_id_ff  
				(
				.scan_in(ncu_man_ucb_c2i_packet_buf_id_ff_scanin),
				.scan_out(ncu_man_ucb_c2i_packet_buf_id_ff_scanout),
				.dout		(ncu_man_ucb_c2i_packet_buf_id[1:0]),
				.l1clk		(l1clk),
				.en		(ncu_man_ucb_buf_acpt),
				.din		(c2i_packet[11:10]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_6 ncu_man_ucb_c2i_packet_cputhr_ff  
				(
				.scan_in(ncu_man_ucb_c2i_packet_cputhr_ff_scanin),
				.scan_out(ncu_man_ucb_c2i_packet_cputhr_ff_scanout),
				.dout		(ncu_man_ucb_c2i_packet_cputhr[5:0]),
				.l1clk		(l1clk),
				.en		(ncu_man_ucb_buf_acpt),
				.din		(c2i_packet[9:4]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 ncu_man_ucb_c2i_packet_is_rd_req_ff  
				(
				.scan_in(ncu_man_ucb_c2i_packet_is_rd_req_ff_scanin),
				.scan_out(ncu_man_ucb_c2i_packet_is_rd_req_ff_scanout),
				.dout		(ncu_man_ucb_c2i_packet_is_rd_req),
				.l1clk		(l1clk),
				.en		(ncu_man_ucb_buf_acpt),
				.din		(c2i_packet_is_rd_req),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 ncu_man_ucb_c2i_packet_is_wr_req_ff  
				(
				.scan_in(ncu_man_ucb_c2i_packet_is_wr_req_ff_scanin),
				.scan_out(ncu_man_ucb_c2i_packet_is_wr_req_ff_scanout),
				.dout		(ncu_man_ucb_c2i_packet_is_wr_req),
				.l1clk		(l1clk),
				.en		(ncu_man_ucb_buf_acpt),
				.din		(c2i_packet_is_wr_req),
  .siclk(siclk),
  .soclk(soclk)
				);

/*****************************************************************
 * Decoding here for requests directed to IOB registers
 *****************************************************************/
//assign	ncu_asi_acc =  ncu_man_ucb_c2i_packet_addr[36] ;
//jimmy : addr[31:16] has already been checked for csr_man space if [36] is 0//
//jimmy : addr[31:32] needs to be further seperate if asi (i.e.[39:32]==h90) //
assign	ncu_man_acc = ~ncu_man_ucb_c2i_packet_addr[36] ; 

assign	ncu_asi_a_acc =  ncu_man_ucb_c2i_packet_addr[36] & 
			 (ncu_man_ucb_c2i_packet_addr[25:16]==`NCU_ASI_A_HIT);

assign	ncu_asi_b_acc =  ncu_man_ucb_c2i_packet_addr[36] & 
			 (ncu_man_ucb_c2i_packet_addr[25:16]==`NCU_ASI_B_HIT);

assign	ncu_asi_c_acc =  ncu_man_ucb_c2i_packet_addr[36] & 
			 (ncu_man_ucb_c2i_packet_addr[25:16]==`NCU_ASI_C_HIT);

assign 	creg_intman_dec      = ncu_man_acc & 
				((ncu_man_ucb_c2i_packet_addr[15:0]&16'hfc07)==`NCU_CREG_INTMAN);
assign 	creg_sernum_dec      = ncu_man_acc & 
				(ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_SERNUM);
assign 	creg_coreavail_dec   = ncu_man_acc & 
				(ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_COREAVAIL);
assign 	creg_fusestat_dec    = ncu_man_acc & 
				(ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_FUSESTAT);
assign 	creg_bankavail_dec   = ncu_man_acc & 
				(ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_BANKAVAIL);
assign 	creg_bank_en_dec     = ncu_man_acc & 
				(ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_BANK_ENABLE);
assign 	creg_bank_en_status_dec  = ncu_man_acc & 
				(ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_BANK_ENABLE_STATUS);
assign 	creg_l2idxhs_en_dec     = ncu_man_acc & 
				(ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_L2_HASH_ENABLE);
assign 	creg_l2idxhs_en_status_dec  = ncu_man_acc & 
			       (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_L2_HASH_ENABLE_STATUS);
assign 	creg_mondoinvec_dec  = ncu_man_acc & 
			       (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_MONDOINVEC);
assign 	creg_mem32_base_dec  = ncu_man_acc & 
			       (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_MEM32_BASE);
assign 	creg_mem32_mask_dec  = ncu_man_acc & 
			       (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_MEM32_MASK);
assign 	creg_mem64_base_dec  = ncu_man_acc & 
			       (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_MEM64_BASE);
assign 	creg_mem64_mask_dec  = ncu_man_acc & 
			       (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_MEM64_MASK);
assign 	creg_iocon_base_dec  = ncu_man_acc & 
			       (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_IOCON_BASE);
assign 	creg_iocon_mask_dec  = ncu_man_acc & 
			       (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_IOCON_MASK);
assign 	creg_mmufsh_dec      = ncu_man_acc & 
			       (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_MMUFSH);
assign 	creg_esr_dec      = ncu_man_acc & 
			       (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_ESR);
assign 	creg_ele_dec      = ncu_man_acc & 
			       (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_ELE);
assign 	creg_eie_dec      = ncu_man_acc & 
			       (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_EIE);
assign 	creg_ejr_dec      = ncu_man_acc & 
			       (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_EJR);
assign 	creg_fee_dec      = ncu_man_acc & 
			       (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_FEE);
assign 	creg_per_dec      = ncu_man_acc & 
			       (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_PER);
assign 	creg_siisyn_dec   = ncu_man_acc & 
			       (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_SIISYN);
assign 	creg_ncusyn_dec   = ncu_man_acc & 
			       (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_NCUSYN);
assign 	creg_ncu_scksel_dec   = ncu_man_acc & 
			       (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_SCKSEL);
assign 	creg_dbgtrigen_dec   = ncu_man_acc & 
			       (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_CREG_DBGTRIG_EN);

assign	asi_coreavail_dec 	= ncu_asi_a_acc & 
				  (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_ASI_COREAVAIL);
assign	asi_core_enable_status_dec = ncu_asi_a_acc &
				  (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_ASI_CORE_ENABLE_STATUS);
assign	asi_core_enable_dec 	= ncu_asi_a_acc &
				  (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_ASI_CORE_ENABLE);
assign	asi_xir_steering_dec	= ncu_asi_a_acc &
				  (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_ASI_XIR_STEERING);
assign	asi_core_running_dec	= ncu_asi_a_acc &
				  (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_ASI_CORE_RUNNINGRW);
assign	asi_core_running_status_dec = ncu_asi_a_acc &
				  (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_ASI_CORE_RUNNING_STATUS);
assign	asi_core_runningw1s_dec	= ncu_asi_a_acc &
				  (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_ASI_CORE_RUNNING_W1S);
assign	asi_core_runningw1c_dec	= ncu_asi_a_acc &
				  (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_ASI_CORE_RUNNING_W1C);
assign  asi_ras_err_steering_dec = ncu_asi_a_acc &
                                  (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_ASI_ERR_STR); 
			// new ASI for ras error sterring register, Jane
assign  asi_wmr_vec_mask_dec = ncu_asi_c_acc &
                                  (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_ASI_WMR_VEC_MASK);
assign  asi_cmp_tick_enable_dec = ncu_asi_a_acc &
                                  (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_ASI_CMP_TICK_ENABLE);
assign	asi_intvecdisp_dec	= ncu_asi_b_acc &
				  (ncu_man_ucb_c2i_packet_addr[15:0]==`NCU_ASI_INTVECDISP);


// Send nack if address doesn't match any register
assign 	creg_nomatch =     ~ (  creg_intman_dec |
				creg_sernum_dec |
				creg_coreavail_dec |
				creg_bankavail_dec |
				creg_bank_en_dec |
				creg_bank_en_status_dec |
				creg_l2idxhs_en_dec |
				creg_l2idxhs_en_status_dec |
				creg_fusestat_dec |
				creg_mondoinvec_dec |
				creg_mem32_base_dec |
				creg_mem32_mask_dec |
				creg_mem64_base_dec |
				creg_mem64_mask_dec |
				creg_iocon_base_dec |
				creg_iocon_mask_dec |
				creg_mmufsh_dec |
				creg_esr_dec |
				creg_ele_dec |
				creg_eie_dec |
				creg_ejr_dec |
				creg_fee_dec |
				creg_per_dec |
				creg_siisyn_dec |
				creg_ncusyn_dec |
				creg_ncu_scksel_dec |
				creg_dbgtrigen_dec |
				asi_coreavail_dec |
				asi_core_enable_status_dec |
				asi_core_enable_dec |
				asi_xir_steering_dec |
				asi_core_running_dec |
				asi_core_running_status_dec |
				asi_core_runningw1s_dec |
				asi_core_runningw1c_dec | 
 				asi_ras_err_steering_dec |	// Jane
				asi_wmr_vec_mask_dec |
				asi_cmp_tick_enable_dec |
				asi_intvecdisp_dec ) ;


// Double buffer for ncu_man_int
assign 	ncu_man_int_buf_wr =    intvecdisp_int_wr | rasper_int_wr | xir_int_wr ;

assign 	ncu_man_int_buf_din[24:0] =   xir_int_wr ? xir_int_pkt[24:0] : 
				      rasper_int_wr ? rasper_int_pkt[24:0] : intvecdisp_int_pkt[24:0] ;
//=============================================
//dbl_buf #(64) ncu_man_int_buf (
//				.clk(iol2clk),
//				.wr(ncu_man_int_buf_wr),
//				.din(ncu_man_int_buf_din[63:0]),
//				.vld(ncu_man_int_buf_vld),
//				.dout(ncu_man_int_buf_dout[63:0]),
//				.rd(ncu_man_int_buf_rd),
//				.full(ncu_man_int_buf_full)); 
//=============================================================================
//=============================================================================
//========================================================== dbl_buf ==========
// Buffer Output

// if both entries are empty, write to entry pointed to by the older pointer
assign	aa_wr_buf0 = ncu_man_int_buf_wr & (aa_buf1_vld | (~aa_buf0_vld & ~aa_buf1_older));
assign	aa_wr_buf1 = ncu_man_int_buf_wr & (aa_buf0_vld | (~aa_buf1_vld & aa_buf1_older));

// read from the older entry
assign	aa_rd_buf0 = ncu_man_int_buf_rd & ~aa_buf1_older;
assign	aa_rd_buf1 = ncu_man_int_buf_rd &  aa_buf1_older;

// flip older pointer when an entry is read
assign	aa_rd_buf = ncu_man_int_buf_rd & (aa_buf0_vld | aa_buf1_vld);
assign	aa_buf1_older_inv = ~aa_buf1_older;
ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 aa_buf1_older_ff  
				(
				.scan_in(aa_buf1_older_ff_scanin),
				.scan_out(aa_buf1_older_ff_scanout),
				.dout		(aa_buf1_older),
				.l1clk		(l1clk),
				.en		(aa_rd_buf),
				.din		(aa_buf1_older_inv),
  .siclk(siclk),
  .soclk(soclk)
				);

// set valid bit for writes and reset for reads
assign	aa_en_vld0 = aa_wr_buf0 | aa_rd_buf0;
assign	aa_en_vld1 = aa_wr_buf1 | aa_rd_buf1;

// the actual buffers
ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 aa_buf0_vld_ff  
				(
				.scan_in(aa_buf0_vld_ff_scanin),
				.scan_out(aa_buf0_vld_ff_scanout),
				.dout		(aa_buf0_vld),
				.l1clk		(l1clk),
				.en		(aa_en_vld0),
				.din		(aa_wr_buf0),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 aa_buf1_vld_ff  
				(
				.scan_in(aa_buf1_vld_ff_scanin),
				.scan_out(aa_buf1_vld_ff_scanout),
				.dout		(aa_buf1_vld),
				.l1clk		(l1clk),
				.en		(aa_en_vld1),
				.din		(aa_wr_buf1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_25 aa_buf0_obj_ff  
				(
				.scan_in(aa_buf0_obj_ff_scanin),
				.scan_out(aa_buf0_obj_ff_scanout),
				.dout		(aa_buf0_obj[24:0]),
				.l1clk		(l1clk),
				.en		(aa_wr_buf0),
				.din		(ncu_man_int_buf_din[24:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_25 aa_buf1_obj_ff  
				(
				.scan_in(aa_buf1_obj_ff_scanin),
				.scan_out(aa_buf1_obj_ff_scanout),
				.dout		(aa_buf1_obj[24:0]),
				.l1clk		(l1clk),
				.en		(aa_wr_buf1),
				.din		(ncu_man_int_buf_din[24:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

// mux out the older entry
assign	ncu_man_int_buf_dout[24:0] = (aa_buf1_older) ? aa_buf1_obj[24:0] : aa_buf0_obj[24:0] ;

assign	ncu_man_int_buf_vld = aa_buf0_vld | aa_buf1_vld;
assign	ncu_man_int_buf_full = aa_buf0_vld & aa_buf1_vld;
//=============================================
assign 	ncu_man_int_vld = ncu_man_int_buf_vld;

assign 	ncu_man_int_packet[24:0] = ncu_man_int_buf_dout[24:0];

assign 	ncu_man_int_buf_rd = ncu_man_int_rd;
//========================================================== dbl_buf ==========
//=============================================================================
//=============================================================================



// Double buffer for ncu_man_ack
//assign 	ncu_man_ack_buf_wr = ncu_man_ucb_buf_acpt_d3 & ncu_man_acc & ncu_man_ucb_c2i_packet_is_rd_req;
assign 	ncu_man_ack_buf_wr = ncu_man_ucb_buf_acpt_d3 & ncu_man_ucb_c2i_packet_is_rd_req;

assign 	ncu_man_ack_i2c_packet_data[63:0] =
		({64{creg_intman_dec}}     & creg_intman[63:0]) |
		({64{creg_sernum_dec}}     & creg_sernum[63:0]) |
		({64{creg_coreavail_dec|asi_coreavail_dec}}  & creg_coreavail[63:0]) |
		({64{creg_fusestat_dec}}   & creg_fusestat[63:0]) |
		({64{creg_bankavail_dec}}  & creg_bankavail[63:0]) |
		({64{creg_bank_en_dec}}    & creg_bank_en[63:0]) |
		({64{creg_bank_en_status_dec}} & creg_bank_en_status[63:0]) |
		({64{creg_l2idxhs_en_dec}}    & creg_l2idxhs_en[63:0]) |
		({64{creg_l2idxhs_en_status_dec}} & creg_l2idxhs_en_status[63:0]) |
		({64{creg_mondoinvec_dec}} & creg_mondoinvec[63:0]) |
		({64{creg_mem32_base_dec}} &  creg_mem32_base[63:0]) |
		({64{creg_mem32_mask_dec}} & creg_mem32_mask[63:0]) |
		({64{creg_mem64_base_dec}} & creg_mem64_base[63:0]) |
		({64{creg_mem64_mask_dec}} & creg_mem64_mask[63:0]) |
		({64{creg_iocon_base_dec}} & creg_iocon_base[63:0]) |
		({64{creg_iocon_mask_dec}} & creg_iocon_mask[63:0]) |
		({64{creg_mmufsh_dec}} & mmufsh_data[63:0]) |
		({64{creg_esr_dec}} & creg_esr[63:0]) |
		({64{creg_ele_dec}} & creg_ele[63:0]) |
		({64{creg_eie_dec}} & creg_eie[63:0]) |
		({64{creg_ejr_dec}} & creg_ejr[63:0]) |
		({64{creg_fee_dec}} & creg_fee[63:0]) |
		({64{creg_per_dec}} & creg_per[63:0]) |
		({64{creg_siisyn_dec}} & creg_siisyn[63:0]) |
		({64{creg_ncusyn_dec}} & creg_ncusyn[63:0]) |
		({64{creg_ncu_scksel_dec}} & creg_ncu_scksel[63:0]) |
		({64{creg_dbgtrigen_dec}} & creg_dbgtrigen[63:0]) |
		({64{asi_core_enable_status_dec}} & creg_core_enable_status[63:0]) |
		({64{asi_core_enable_dec}} & creg_core_enable[63:0]) |
		({64{asi_xir_steering_dec}} & xir_steering[63:0]) |
		({64{asi_ras_err_steering_dec}} & creg_err_steering[63:0]) |
		({64{asi_wmr_vec_mask_dec}} & creg_wmr_vec_mask[63:0]) |
		({64{asi_cmp_tick_enable_dec}} & creg_cmp_tick_enable[63:0]) |
		({64{asi_core_running_dec}} & core_running[63:0]) |
		({64{asi_core_running_status_dec}} & creg_core_running_status[63:0]) ;

assign 	ncu_man_ack_i2c_packet_type[3:0] = (creg_nomatch|intman_pe_n) ? `UCB_READ_NACK : `UCB_READ_ACK ;
// intman_pe_n was added to fix bug 92709. when interrupt table error
// happens, NCU nack back to cpu.

//assign 	ncu_man_ack_i2c_packet_type[3:0] = (creg_nomatch) ? `UCB_READ_NACK : `UCB_READ_ACK ;

assign 	ncu_man_ack_i2c_packet[127:0] = {ncu_man_ack_i2c_packet_data[63:0],
					 9'b0,	//// UCB_RSV_WIDTH, 
					 ncu_man_ucb_c2i_packet_addr[39:0], //// UCB_ADDR 
					 3'b0,	//// UCB_SIZE (dummy)
					 ncu_man_ucb_c2i_packet_buf_id[1:0], //// UCB_BUF_ID
					 ncu_man_ucb_c2i_packet_cputhr[5:0], //// UCB_CPUTHR
					 ncu_man_ack_i2c_packet_type[3:0] };

assign 	ncu_man_ack_buf_din[127:0] = ncu_man_ack_i2c_packet[127:0];
//==========================================================
//dbl_buf #(128) ncu_man_ack_buf ( 
//				.clk(iol2clk),
//				.wr(ncu_man_ack_buf_wr),
//				.rd(ncu_man_ack_buf_rd),
//				.din(ncu_man_ack_buf_din[127:0]),
//				.vld(ncu_man_ack_buf_vld),
//				.dout(ncu_man_ack_buf_dout[127:0]),
//				.full(ncu_man_ack_buf_full)); */
//=============================================================================
//=============================================================================
//========================================================== dbl_buf ==========
// Buffer Output

// if both entries are empty, write to entry pointed to by the older pointer
assign	bb_wr_buf0 = ncu_man_ack_buf_wr & (bb_buf1_vld | (~bb_buf0_vld & ~bb_buf1_older));
assign	bb_wr_buf1 = ncu_man_ack_buf_wr & (bb_buf0_vld | (~bb_buf1_vld & bb_buf1_older));

// read from the older entry
assign	bb_rd_buf0 = ncu_man_ack_buf_rd & ~bb_buf1_older;
assign	bb_rd_buf1 = ncu_man_ack_buf_rd &  bb_buf1_older;

// flip older pointer when an entry is read
assign	bb_rd_buf = ncu_man_ack_buf_rd & (bb_buf0_vld | bb_buf1_vld);
assign	bb_buf1_older_inv = ~bb_buf1_older;
ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 bb_buf1_older_ff  
				(
				.scan_in(bb_buf1_older_ff_scanin),
				.scan_out(bb_buf1_older_ff_scanout),
				.dout		(bb_buf1_older),
				.l1clk		(l1clk),
				.en		(bb_rd_buf),
				.din		(bb_buf1_older_inv),
  .siclk(siclk),
  .soclk(soclk)
				);

// set valid bit for writes and reset for reads
assign	bb_en_vld0 = bb_wr_buf0 | bb_rd_buf0;
assign	bb_en_vld1 = bb_wr_buf1 | bb_rd_buf1;

// the actual buffers
ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 bb_buf0_vld_ff  
				(
				.scan_in(bb_buf0_vld_ff_scanin),
				.scan_out(bb_buf0_vld_ff_scanout),
				.dout		(bb_buf0_vld),
				.l1clk		(l1clk),
				.en		(bb_en_vld0),
				.din		(bb_wr_buf0),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 bb_buf1_vld_ff  
				(
				.scan_in(bb_buf1_vld_ff_scanin),
				.scan_out(bb_buf1_vld_ff_scanout),
				.dout		(bb_buf1_vld),
				.l1clk		(l1clk),
				.en		(bb_en_vld1),
				.din		(bb_wr_buf1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_128 bb_buf0_obj_ff  
				(
				.scan_in(bb_buf0_obj_ff_scanin),
				.scan_out(bb_buf0_obj_ff_scanout),
				.dout		(bb_buf0_obj[127:0]),
				.l1clk		(l1clk),
				.en		(bb_wr_buf0),
				.din		(ncu_man_ack_buf_din[127:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_128 bb_buf1_obj_ff  
				(
				.scan_in(bb_buf1_obj_ff_scanin),
				.scan_out(bb_buf1_obj_ff_scanout),
				.dout		(bb_buf1_obj[127:0]),
				.l1clk		(l1clk),
				.en		(bb_wr_buf1),
				.din		(ncu_man_ack_buf_din[127:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

// mux out the older entry
assign	ncu_man_ack_buf_dout[127:0] = (bb_buf1_older) ? bb_buf1_obj[127:0] : bb_buf0_obj[127:0] ;

assign	ncu_man_ack_buf_vld = bb_buf0_vld | bb_buf1_vld;
assign	ncu_man_ack_buf_full = bb_buf0_vld & bb_buf1_vld;

assign	ncu_man_ack_vld = ncu_man_ack_buf_vld;

assign	ncu_man_ack_packet = ncu_man_ack_buf_dout;

assign	ncu_man_ack_buf_rd = ncu_man_ack_rd;
//========================================================== dbl_buf ==========
//=============================================================================
//=============================================================================



/*****************************************************************
 * IOB Interrupt Management Register
 *****************************************************************/
assign 	 lhs_intman_addr[6:0] = ncu_man_ucb_c2i_packet_addr[9:3];

// Setup array access in cycle 1
assign 	lhs_intman_acc = ncu_man_ucb_buf_acpt_d1 & creg_intman_dec ;


assign 	intman_vec_din[5:0] = ncu_man_ucb_c2i_packet_data[5:0];
assign 	intman_ct_din[5:0] = ncu_man_ucb_c2i_packet_data[13:8];
assign 	intman_tbl_addr[6:0] = (lhs_intman_acc) ? lhs_intman_addr[6:0] : io_intman_addr[6:0]; 
assign 	intman_tbl_raddr[6:0] = mb1_run ? mb1_raddr[6:0] : intman_tbl_addr[6:0];
assign 	intman_tbl_waddr[6:0] = mb1_run ? mb1_waddr[6:0] : intman_tbl_addr[6:0];
assign 	intman_tbl_wr =  mb1_run ? mb1_intman_wr_en : (lhs_intman_acc & ncu_man_ucb_c2i_packet_is_wr_req);
assign	intman_tbl_rden = mb1_run ? mb1_intman_rd_en : (~intman_tbl_wr);

// intman tbl par chk //
assign	c2i_rd_intman = (ncu_man_ucb_buf_acpt_d3&ncu_man_ucb_c2i_packet_is_rd_req&creg_intman_dec) ;
// 

assign	intman_pchk_v =  c2i_rd_intman | io_rd_intman_d2 ;	// either c2i or io read intman table.

assign	intman_pchkf2i2c = (|intman_pchk[3:0]);		// parity check.
assign	intman_pe_n = intman_pchkf2i2c & intman_pchk_v ;
// interrupt table error, interrupt table parity check valid and parity
// check result is "error".

assign	intman_pchk[0] = ~^{intman_vec_dout[0],intman_vec_dout[4],intman_ct_dout[2],intman_par_dout[0],
			    intman_pei};
assign	intman_pchk[1] = ~^{intman_vec_dout[1],intman_vec_dout[5],intman_ct_dout[3],intman_par_dout[1]};
assign	intman_pchk[2] = ~^{intman_vec_dout[2],intman_ct_dout[0], intman_ct_dout[4],intman_par_dout[2]};
assign	intman_pchk[3] = ~^{intman_vec_dout[3],intman_ct_dout[1], intman_ct_dout[5],intman_par_dout[3]};

ncu_ctrl_ctl_msff_ctl_macro__width_1 intman_pe_ff 
				(
				.scan_in(intman_pe_ff_scanin),
				.scan_out(intman_pe_ff_scanout),
				.dout		(intman_pe),
				.l1clk		(l1clk),
				.din		(intman_pe_n),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__en_1__width_55 intmansyn_ff  
				(
				.scan_in(intmansyn_ff_scanin),
				.scan_out(intmansyn_ff_scanout),
				.dout		(intmansyn[54:0]),
				.l1clk		(l1clk),
				.en		(intman_pe_n),
				//.din		(intman_ct_dout[5:0])
				.din		(intmansyn_n[54:0]),
  .siclk(siclk),
  .soclk(soclk)
				);


assign 	creg_intman[63:0] =   {	48'b0,			// reserved     [63:16]
				2'b00,			// hw int	[15:14]
				intman_ct_dout[5:0],// interrupt cpu ID [13:8]
				2'b00,			// reserved         [7:6]
				intman_vec_dout[5:0] };	// interrupt vector [5:0]

/*****************************************************************
 * IOB Remote Interrupt Vector Dispatch Register
 * jimmy: assume man_int_buf never get full, needs to be fix here
 *****************************************************************/
assign 	asi_intvecdisp_wr = ncu_man_ucb_buf_acpt_d2 & 
			     asi_intvecdisp_dec & ncu_man_ucb_c2i_packet_is_wr_req ;

assign 	intvecdisp_int_wr = asi_intvecdisp_wr;

assign 	intvecdisp_int_vec[5:0] = ncu_man_ucb_c2i_packet_data[5:0];
assign 	intvecdisp_int_thr[5:0] = ncu_man_ucb_c2i_packet_data[13:8];

// decoding trap type //

//always @( ncu_man_ucb_c2i_packet_data)
  //case (ncu_man_ucb_c2i_packet_data[17:16])
    //2'b00: intvecdisp_int_type[3:0] = `UCB_INT_VEC;
    //2'b01: intvecdisp_int_type[3:0] = `UCB_RESET_VEC;
    //2'b10: intvecdisp_int_type[3:0] = `UCB_IDLE_VEC;
    //2'b11: intvecdisp_int_type[3:0] = `UCB_RESUME_VEC;
  //endcase // case(ncu_man_ucb_c2i_packet_data[17:16])

assign	intvecdisp_int_pkt[24:0] = {	////7'b0,  // reserved
                                        intvecdisp_int_vec[5:0],
                                        ////32'b0, // reserved
                                        9'h00, // dummy dev_id//
                                        intvecdisp_int_thr[5:0],
                                        //intvecdisp_int_type[3:0] };
                                         `UCB_INT_VEC };


// No real storage for this one, just read back zeros.
//assign 	creg_intvecdisp[63:0] = 64'b0;

/****************************************
//// efuse interface and reg control ////
*****************************************/


assign  coreavail_done = ~coreavail_dshift_d1 & coreavail_dshift_d2 ;	// detect deassert of efu_ncu_coreavail_dshift
assign  bankavail_done = ~bankavail_dshift_d1 & bankavail_dshift_d2 ;	// detect deassert of efu_ncu_bankavail_dshift
assign  coreavail_en =  coreavail_dshift_d1;
assign  bankavail_en =  bankavail_dshift_d1;
assign  fuse_stat_en =  fuse_stat_dshift_d1;
assign  sernum0_en =  sernum0_dshift_d1;
assign  sernum1_en =  sernum1_dshift_d1;
assign  sernum2_en =  sernum2_dshift_d1;


ncu_ctrl_ctl_msff_ctl_macro__width_1 fuse_data_d1_ff 
				(
				.scan_in(fuse_data_d1_ff_scanin),
				.scan_out(fuse_data_d1_ff_scanout),
				.dout		(fuse_data_d1),
				.l1clk		(l1clk),
				.din		(efu_ncu_fuse_data),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_1 coreavail_dshift_d1_ff 
				(
				.scan_in(coreavail_dshift_d1_ff_scanin),
				.scan_out(coreavail_dshift_d1_ff_scanout),
				.dout		(coreavail_dshift_d1),
				.l1clk		(l1clk),
				.din		(efu_ncu_coreavail_dshift),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_1 coreavail_dshift_d2_ff 
				(
				.scan_in(coreavail_dshift_d2_ff_scanin),
				.scan_out(coreavail_dshift_d2_ff_scanout),
				.dout		(coreavail_dshift_d2),
				.l1clk		(l1clk),
				.din		(coreavail_dshift_d1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_1 bankavail_dshift_d1_ff 
				(
				.scan_in(bankavail_dshift_d1_ff_scanin),
				.scan_out(bankavail_dshift_d1_ff_scanout),
				.dout		(bankavail_dshift_d1),
				.l1clk		(l1clk),
				.din		(efu_ncu_bankavail_dshift),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_1 bankavail_dshift_d2_ff 
				(
				.scan_in(bankavail_dshift_d2_ff_scanin),
				.scan_out(bankavail_dshift_d2_ff_scanout),
				.dout		(bankavail_dshift_d2),
				.l1clk		(l1clk),
				.din		(bankavail_dshift_d1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_1 fuse_stat_dshift_d1_ff 
				(
				.scan_in(fuse_stat_dshift_d1_ff_scanin),
				.scan_out(fuse_stat_dshift_d1_ff_scanout),
				.dout		(fuse_stat_dshift_d1),
				.l1clk		(l1clk),
				.din		(efu_ncu_fusestat_dshift),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_1 sernum0_dshift_d1_ff 
				(
				.scan_in(sernum0_dshift_d1_ff_scanin),
				.scan_out(sernum0_dshift_d1_ff_scanout),
				.dout		(sernum0_dshift_d1),
				.l1clk		(l1clk),
				.din		(efu_ncu_sernum0_dshift),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_1 sernum1_dshift_d1_ff 
				(
				.scan_in(sernum1_dshift_d1_ff_scanin),
				.scan_out(sernum1_dshift_d1_ff_scanout),
				.dout		(sernum1_dshift_d1),
				.l1clk		(l1clk),
				.din		(efu_ncu_sernum1_dshift),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_1 sernum2_dshift_d1_ff 
				(
				.scan_in(sernum2_dshift_d1_ff_scanin),
				.scan_out(sernum2_dshift_d1_ff_scanout),
				.dout		(sernum2_dshift_d1),
				.l1clk		(l1clk),
				.din		(efu_ncu_sernum2_dshift),
  .siclk(siclk),
  .soclk(soclk)
				);



/*****************************************************************
 * IOB Processor Serial Number Register
 *****************************************************************/

assign	sernum0_next[21:0] = {sernum0[20:0],fuse_data_d1} ;
ncu_ctrl_ctl_msff_ctl_macro__en_1__width_22 sernum0_ff  
				(
				.scan_in(sernum0_ff_scanin),
				.scan_out(sernum0_ff_scanout),
				.dout		(sernum0[21:0]),
				.l1clk		(l1clk), 
				.siclk		(aclk_wmr),
				.en		(sernum0_en),
				.din		(sernum0_next[21:0]),
  .soclk(soclk)
				);

assign	sernum1_next[21:0] = {sernum1[20:0],fuse_data_d1} ;
ncu_ctrl_ctl_msff_ctl_macro__en_1__width_22 sernum1_ff  
				(
				.scan_in(sernum1_ff_scanin),
				.scan_out(sernum1_ff_scanout),
				.dout		(sernum1[21:0]),
				.l1clk		(l1clk), 
				.siclk		(aclk_wmr),
				.en		(sernum1_en),
				.din		(sernum1_next[21:0]),
  .soclk(soclk)
				);

assign	sernum2_next[19:0] = {sernum2[18:0],fuse_data_d1} ;
ncu_ctrl_ctl_msff_ctl_macro__en_1__width_20 sernum2_ff  
				(
				.scan_in(sernum2_ff_scanin),
				.scan_out(sernum2_ff_scanout),
				.dout		(sernum2[19:0]),
				.l1clk		(l1clk), 
				.siclk		(aclk_wmr),
				.en		(sernum2_en),
				.din		(sernum2_next[19:0]),
  .soclk(soclk)
				);

assign	creg_sernum[63:0] = {sernum2[19:0],sernum1[21:0],sernum0[21:0]};




/*****************************************************************
 * IOB Fuse Status Register
 *****************************************************************/

assign	fusestat_next[63:0] = {fusestat[62:0],fuse_data_d1} ;

assign fusestat_ff_in[63:0] = ~fusestat_next[63:0];
ncu_ctrl_ctl_msff_ctl_macro__en_1__width_64 fusestat_ff  
				(
				.scan_in(fusestat_ff_scanin),
				.scan_out(fusestat_ff_scanout),
				.dout		(fusestat_ff_out[63:0]),
				.l1clk		(l1clk), 
				.siclk		(aclk_wmr),
				.en		(fuse_stat_en),
				.din		(fusestat_ff_in[63:0]),
  .soclk(soclk)
				);

assign	creg_fusestat[63:0] = ~fusestat_ff_out[63:0] ;
assign  fusestat[63:0] = ~fusestat_ff_out[63:0];



/*****************************************************************
 * IOB Core Available Register
 *****************************************************************/

assign	coreavail_next[7:0] = {coreavail[6:0],fuse_data_d1} ;

assign coreavail_ff_in[7:0] = ~coreavail_next[7:0];	// initial value are all '1' after flash reset
ncu_ctrl_ctl_msff_ctl_macro__en_1__width_8 coreavail_ff  
				(
				.scan_in(coreavail_ff_scanin),
				.scan_out(coreavail_ff_scanout),
				.dout		(coreavail_ff_out[7:0]),
				.l1clk		(l1clk), 
				.siclk		(aclk_wmr),
				.en		(coreavail_en),
				.din		(coreavail_ff_in[7:0]),
  .soclk(soclk)
				);
assign coreavail[7:0] = ~coreavail_ff_out[7:0];

assign creg_coreavail[63:0] =  {{8{coreavail[7]}},{8{coreavail[6]}},
                                {8{coreavail[5]}},{8{coreavail[4]}},
                                {8{coreavail[3]}},{8{coreavail[2]}},
                                {8{coreavail[1]}},{8{coreavail[0]}}};


/*
msff_ctl_macro coreavail_ff (width=8, en=1)
				(
				.scan_in(coreavail_ff_scanin),
				.scan_out(coreavail_ff_scanout),
				.dout		(coreavail[7:0]),
				.l1clk		(l1clk), 
				.en		(coreavail_en),
				.din		(coreavail_next[7:0])
				);
*/

/*****************************************************************
 * IOB bank Available Register
 *****************************************************************/

assign	bankavail_next[7:0] = {bankavail[6:0],fuse_data_d1} ;

assign bankavail_ff_in[7:0] = ~bankavail_next[7:0];	// initial value are all '1' after flash reset
ncu_ctrl_ctl_msff_ctl_macro__en_1__width_8 bankavail_ff  
				(
				.scan_in(bankavail_ff_scanin),
				.scan_out(bankavail_ff_scanout),
				.dout		(bankavail_ff_out[7:0]),
				.l1clk		(l1clk), 
				.siclk		(aclk_wmr),
				.en		(bankavail_en),
				.din		(bankavail_ff_in[7:0]),
  .soclk(soclk)
				);
assign bankavail[7:0] = ~bankavail_ff_out[7:0];

assign creg_bankavail[63:0] =  {56'b0,bankavail[7:0]} ;
assign ncu_tcu_bank_avail[7:0] = bankavail[7:0];


/*
msff_ctl_macro bankavail_ff (width=8, en=1)
				(
				.scan_in(bankavail_ff_scanin),
				.scan_out(bankavail_ff_scanout),
				.dout		(bankavail[7:0]),
				.l1clk		(l1clk), 
				.en		(bankavail_en),
				.din		(bankavail_next[7:0])
				);
*/


/*****************************************************************
 * IOB mondo Interrupt Vector Register
 *****************************************************************/

assign 	creg_mondoinvec_wr = ncu_man_ucb_buf_acpt_d2 &
		             ncu_man_ucb_c2i_packet_is_wr_req & creg_mondoinvec_dec;

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_6 creg_mondoinvec_ff  
				(
				.scan_in(creg_mondoinvec_ff_scanin),
				.scan_out(creg_mondoinvec_ff_scanout),
				.dout		(mondoinvec[5:0]),
				.l1clk		(l1clk),
				.en		(creg_mondoinvec_wr),
				.din		(ncu_man_ucb_c2i_packet_data[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign 	creg_mondoinvec[63:0] = {58'b0,mondoinvec[5:0]};


/**************************************************************
 * IOB mem32 base register
 **************************************************************/
assign	creg_mem32_base_wr = ncu_man_ucb_buf_acpt_d2 &
			     ncu_man_ucb_c2i_packet_is_wr_req & creg_mem32_base_dec;

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 creg_mem32_en_ff  
				(
				.scan_in(creg_mem32_en_ff_scanin),
				.scan_out(creg_mem32_en_ff_scanout),
				.dout		(mem32_en),
				.l1clk		(l1clk),
				.en		(creg_mem32_base_wr),
				.din		(ncu_man_ucb_c2i_packet_data[63]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_12 creg_mem32_base_ff  
				(
				.scan_in(creg_mem32_base_ff_scanin),
				.scan_out(creg_mem32_base_ff_scanout),
				.dout		(mem32_base[11:0]),
				.l1clk		(l1clk),
				.en		(creg_mem32_base_wr),
				.din		(ncu_man_ucb_c2i_packet_data[35:24]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign creg_mem32_base[63:0] = {mem32_en,27'b0,mem32_base[11:0],24'b0} ;



/**************************************************************
 * IOB mem32 mask register
 **************************************************************/
assign	creg_mem32_mask_wr = ncu_man_ucb_buf_acpt_d2 &
			     ncu_man_ucb_c2i_packet_is_wr_req & creg_mem32_mask_dec;

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_12 creg_mem32_mask_ff  
				(
				.scan_in(creg_mem32_mask_ff_scanin),
				.scan_out(creg_mem32_mask_ff_scanout),
				.dout		(mem32_mask[11:0]),
				.l1clk		(l1clk),
				.en		(creg_mem32_mask_wr),
				.din		(ncu_man_ucb_c2i_packet_data[35:24]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign creg_mem32_mask[63:0] = {24'b0,4'hf,mem32_mask[11:0],24'b0} ;



/**************************************************************
 * IOB mem64 base register
 **************************************************************/
assign	creg_mem64_base_wr = ncu_man_ucb_buf_acpt_d2 &
			     ncu_man_ucb_c2i_packet_is_wr_req & creg_mem64_base_dec;

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 creg_mem64_en_ff  
				(
				.scan_in(creg_mem64_en_ff_scanin),
				.scan_out(creg_mem64_en_ff_scanout),
				.dout		(mem64_en),
				.l1clk		(l1clk),
				.en		(creg_mem64_base_wr),
				.din		(ncu_man_ucb_c2i_packet_data[63]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_12 creg_mem64_base_ff  
				(
				.scan_in(creg_mem64_base_ff_scanin),
				.scan_out(creg_mem64_base_ff_scanout),
				.dout		(mem64_base[11:0]),
				.l1clk		(l1clk),
				.en		(creg_mem64_base_wr),
				.din		(ncu_man_ucb_c2i_packet_data[35:24]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign creg_mem64_base[63:0] = {mem64_en,27'b0,mem64_base[11:0],24'b0} ;



/**************************************************************
 * IOB mem64 mask register
 **************************************************************/
assign	creg_mem64_mask_wr = ncu_man_ucb_buf_acpt_d2 &
			     ncu_man_ucb_c2i_packet_is_wr_req & creg_mem64_mask_dec;

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_12 creg_mem64_mask_ff  
				(
				.scan_in(creg_mem64_mask_ff_scanin),
				.scan_out(creg_mem64_mask_ff_scanout),
				.dout		(mem64_mask[11:0]),
				.l1clk		(l1clk),
				.en		(creg_mem64_mask_wr),
				.din		(ncu_man_ucb_c2i_packet_data[35:24]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign creg_mem64_mask[63:0] = {24'b0,4'hf,mem64_mask[11:0],24'b0} ;


/**************************************************************
 * IOB iocon base register
 **************************************************************/
assign	creg_iocon_base_wr = ncu_man_ucb_buf_acpt_d2 &
			     ncu_man_ucb_c2i_packet_is_wr_req & creg_iocon_base_dec;

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 creg_iocon_en_ff  
				(
				.scan_in(creg_iocon_en_ff_scanin),
				.scan_out(creg_iocon_en_ff_scanout),
				.dout		(iocon_en),
				.l1clk		(l1clk),
				.en		(creg_iocon_base_wr),
				.din		(ncu_man_ucb_c2i_packet_data[63]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_12 creg_iocon_base_ff  
				(
				.scan_in(creg_iocon_base_ff_scanin),
				.scan_out(creg_iocon_base_ff_scanout),
				.dout		(iocon_base[11:0]),
				.l1clk		(l1clk),
				.en		(creg_iocon_base_wr),
				.din		(ncu_man_ucb_c2i_packet_data[35:24]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign creg_iocon_base[63:0] = {iocon_en,27'b0,iocon_base[11:0],24'b0} ;



/**************************************************************
 * IOB iocon mask register
 **************************************************************/
assign	creg_iocon_mask_wr = ncu_man_ucb_buf_acpt_d2 &
			     ncu_man_ucb_c2i_packet_is_wr_req & creg_iocon_mask_dec;

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_12 creg_iocon_mask_ff  
				(
				.scan_in(creg_iocon_mask_ff_scanin),
				.scan_out(creg_iocon_mask_ff_scanout),
				.dout		(iocon_mask[11:0]),
				.l1clk		(l1clk),
				.en		(creg_iocon_mask_wr),
				.din		(ncu_man_ucb_c2i_packet_data[35:24]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign creg_iocon_mask[63:0] = {24'b0,4'hf,iocon_mask[11:0],24'b0} ;



/**************************************************************
 * IOB mmufsh register
 **************************************************************/
// mmu_ld is gaurantee to come back in same or next cyc as mmufsh_vld is asserted// 
assign	creg_mmufsh_wr = ncu_man_ucb_buf_acpt_d2 &
			     ncu_man_ucb_c2i_packet_is_wr_req & creg_mmufsh_dec;

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_64 creg_mmufsh_ff  
				(
				.scan_in(creg_mmufsh_ff_scanin),
				.scan_out(creg_mmufsh_ff_scanout),
				.dout		(mmufsh_data[63:0]),
				.l1clk		(l1clk),
				.en		(creg_mmufsh_wr),
				.din		(ncu_man_ucb_c2i_packet_data[63:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	mmufsh_vld_next = creg_mmufsh_wr | (mmufsh_vld&~mmu_ld) ;
ncu_ctrl_ctl_msff_ctl_macro__width_1 mmufsh_vld_ff 
				(
				.scan_in(mmufsh_vld_ff_scanin),
				.scan_out(mmufsh_vld_ff_scanout),
				.dout		(mmufsh_vld),
				.l1clk		(l1clk),
				.din		(mmufsh_vld_next),
  .siclk(siclk),
  .soclk(soclk)
				);





/*****************************************************************
 * ncu_int_ucb
 *****************************************************************/
// Flop c2i_packet
assign       ncu_int_ucb_buf_acpt = c2i_packet_vld & ncu_int_ucb_sel &
	                               ~tap_mondo_acc_outstanding &
		                       ~tap_mondo_acc_outstanding_d1 &
		                       ~ncu_int_ack_vld;

assign asi_ras_err_steering_wr = ncu_man_ucb_buf_acpt_d2 & asi_ras_err_steering_dec & ncu_man_ucb_c2i_packet_is_wr_req;
assign asi_wmr_vec_mask_wr    = ncu_man_ucb_buf_acpt_d2 & asi_wmr_vec_mask_dec & ncu_man_ucb_c2i_packet_is_wr_req;
assign asi_cmp_tick_enable_wr = ncu_man_ucb_buf_acpt_d2 & asi_cmp_tick_enable_dec & ncu_man_ucb_c2i_packet_is_wr_req;

assign ras_err_steering_n[5:0] = asi_ras_err_steering_wr ? ncu_man_ucb_c2i_packet_data[5:0] : ras_err_steering[5:0];
assign wmr_vec_mask_n    = asi_wmr_vec_mask_wr ? ncu_man_ucb_c2i_packet_data[0] : wmr_vec_mask;
assign cmp_tick_enable_n = asi_cmp_tick_enable_wr ? ncu_man_ucb_c2i_packet_data[0] : cmp_tick_enable;

assign creg_err_steering[63:0] = {58'b0, ras_err_steering[5:0]};
assign creg_wmr_vec_mask[63:0] = {63'b0, wmr_vec_mask};
assign creg_cmp_tick_enable [63:0] = {63'b0, cmp_tick_enable};

assign tcu_wmr_vec_mask = wmr_vec_mask;


ncu_ctrl_ctl_msff_ctl_macro__width_1 asi_wmr_vec_mask_ff 
                                    (
                                    .scan_in(asi_wmr_vec_mask_ff_scanin),
                                    .scan_out(asi_wmr_vec_mask_ff_scanout),
                                    .dout           (wmr_vec_mask),
                                    .l1clk          (l1clk),
				    .siclk	    (aclk_wmr),
                                    .din            (wmr_vec_mask_n),
  .soclk(soclk)
                                    );

ncu_ctrl_ctl_msff_ctl_macro__width_1 asi_cmp_tick_enable_ff 
                                    (
                                    .scan_in(asi_cmp_tick_enable_ff_scanin),
                                    .scan_out(asi_cmp_tick_enable_ff_scanout),
                                    .dout           (cmp_tick_enable),
                                    .l1clk          (l1clk), 
				    .siclk	    (aclk_wmr),
                                    .din            (cmp_tick_enable_n),
  .soclk(soclk)
                                    );
				    

ncu_ctrl_ctl_msff_ctl_macro__width_6 asi_ras_err_steering_ff 
                                    (
                                    .scan_in(asi_ras_err_steering_ff_scanin),
                                    .scan_out(asi_ras_err_steering_ff_scanout),
                                    .dout           (ras_err_steering[5:0]),
                                    .l1clk          (l1clk), 
				    .siclk		(aclk_wmr),
                                    .din            (ras_err_steering_n[5:0]),
  .soclk(soclk)
                                    );

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_24 tap_mondo_acc_addr_39_16_ff  
				(
				.scan_in(tap_mondo_acc_addr_39_16_ff_scanin),
				.scan_out(tap_mondo_acc_addr_39_16_ff_scanout),
				.dout		(tap_mondo_acc_addr_39_16[23:0]),
				.l1clk		(l1clk),
				.en		(ncu_int_ucb_buf_acpt),
				.din		(c2i_packet[54:31]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_22 tap_mondo_acc_addr_s_ff  
				(
				.scan_in(tap_mondo_acc_addr_s_ff_scanin),
				.scan_out(tap_mondo_acc_addr_s_ff_scanout),
				.dout		(tap_mondo_acc_addr_s[21:0]),
				.l1clk		(l1clk),
				.en		(ncu_int_ucb_buf_acpt),
				.din		({c2i_packet[9:4], c2i_packet[30:15]}),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_64 tap_mondo_din_s_ff  
				(
				.scan_in(tap_mondo_din_s_ff_scanin),
				.scan_out(tap_mondo_din_s_ff_scanout),
				.dout		(tap_mondo_din_s[63:0]),
				.l1clk		(l1clk),
				.en		(ncu_int_ucb_buf_acpt),
				.din		(c2i_packet[127:64]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 ncu_int_ucb_c2i_packet_is_rd_req_ff  
				(
				.scan_in(ncu_int_ucb_c2i_packet_is_rd_req_ff_scanin),
				.scan_out(ncu_int_ucb_c2i_packet_is_rd_req_ff_scanout),
				.dout		(ncu_int_ucb_c2i_packet_is_rd_req),
				.l1clk		(l1clk),
				.en		(ncu_int_ucb_buf_acpt),
				.din		(c2i_packet_is_rd_req),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 ncu_int_ucb_c2i_packet_is_wr_req_ff  
				(
				.scan_in(ncu_int_ucb_c2i_packet_is_wr_req_ff_scanin),
				.scan_out(ncu_int_ucb_c2i_packet_is_wr_req_ff_scanout),
				.dout		(ncu_int_ucb_c2i_packet_is_wr_req),
				.l1clk		(l1clk),
				.en		(ncu_int_ucb_buf_acpt),
				.din		(c2i_packet_is_wr_req),
  .siclk(siclk),
  .soclk(soclk)
				);


// Send interrupt status tbl read/write request to c2i
//assign 	tap_mondo_acc_addr_s[39:0] = ncu_int_ucb_c2i_packet[54:15];

assign 	tap_mondo_acc_seq_next = ~tap_mondo_acc_seq;

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 tap_mondo_acc_seq_ff  
				(
				.scan_in(tap_mondo_acc_seq_ff_scanin),
				.scan_out(tap_mondo_acc_seq_ff_scanout),
				.dout		(tap_mondo_acc_seq),
				.l1clk		(l1clk),
				.en		(ncu_int_ucb_buf_acpt),
				.din		(tap_mondo_acc_seq_next),
  .siclk(siclk),
  .soclk(soclk)
				);

assign 	tap_mondo_acc_seq_s = tap_mondo_acc_seq;

assign	tap_mondo_wr_s = ncu_int_ucb_c2i_packet_is_wr_req;

// Receive interrupt status tbl read/write ack from c2i
ncu_ctrl_ctl_msff_ctl_macro__width_1 tap_mondo_acc_addr_invld_d2_ff 
				(
				.scan_in(tap_mondo_acc_addr_invld_d2_ff_scanin),
				.scan_out(tap_mondo_acc_addr_invld_d2_ff_scanout),
				.dout		(tap_mondo_acc_addr_invld_d2),
				.l1clk		(l1clk),
				.din		(tap_mondo_acc_addr_invld_d2_f),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_1 tap_mondo_acc_seq_d2_ff 
				(
				.scan_in(tap_mondo_acc_seq_d2_ff_scanin),
				.scan_out(tap_mondo_acc_seq_d2_ff_scanout),
				.dout		(tap_mondo_acc_seq_d2),
				.l1clk		(l1clk),
				.din		(tap_mondo_acc_seq_d2_f),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_64 tap_mondo_dout_d2_ff 
				(
				.scan_in(tap_mondo_dout_d2_ff_scanin),
				.scan_out(tap_mondo_dout_d2_ff_scanout),
				.dout		(tap_mondo_dout_d2[63:0]),
				.l1clk		(l1clk),
				.din		(tap_mondo_dout_d2_f[63:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

// Detect when the interrupt tbl access is done
assign 	tap_mondo_acc_outstanding = (tap_mondo_acc_seq != tap_mondo_acc_seq_d2);

ncu_ctrl_ctl_msff_ctl_macro__width_1 tap_mondo_acc_outstanding_d1_ff 
				(
				.scan_in(tap_mondo_acc_outstanding_d1_ff_scanin),
				.scan_out(tap_mondo_acc_outstanding_d1_ff_scanout),
				.dout		(tap_mondo_acc_outstanding_d1),
				.l1clk		(l1clk),
				.din		(tap_mondo_acc_outstanding),
  .siclk(siclk),
  .soclk(soclk)
				);

assign 	tap_mondo_rd_done = ~tap_mondo_acc_outstanding &
				tap_mondo_acc_outstanding_d1 &
				ncu_int_ucb_c2i_packet_is_rd_req ;

// Assemble read result back to UCB packet format
assign 	ncu_int_ucb_i2c_packet_type[3:0] = tap_mondo_acc_addr_invld_d2 ? 
						`UCB_READ_NACK : `UCB_READ_ACK ;

assign 	ncu_int_ucb_i2c_packet[127:0] =     
				{	tap_mondo_dout_d2[63:0],  // data
					9'b0,	// reserved
					tap_mondo_acc_addr_39_16[23:0], // addr[39:16]
					tap_mondo_acc_addr_s[15:0],	// addr[15:0]
					3'b0,	// size
					2'b01,	// buffer ID
					6'b0,	// thread ID
					ncu_int_ucb_i2c_packet_type[3:0] };// packet type

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_128 ncu_int_ack_packet_ff  
				(
				.scan_in(ncu_int_ack_packet_ff_scanin),
				.scan_out(ncu_int_ack_packet_ff_scanout),
				.dout		(ncu_int_ack_packet[127:0]),
				.l1clk		(l1clk),
				.en		(tap_mondo_rd_done),
				.din		(ncu_int_ucb_i2c_packet[127:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign 	ncu_int_ack_vld_next = tap_mondo_rd_done | (ncu_int_ack_vld & ~ncu_int_ack_rd);

ncu_ctrl_ctl_msff_ctl_macro__width_1 ncu_int_ack_vld_ff 
				(
				.scan_in(ncu_int_ack_vld_ff_scanin),
				.scan_out(ncu_int_ack_vld_ff_scanout),
				.dout		(ncu_int_ack_vld),
				.l1clk		(l1clk),
				.din		(ncu_int_ack_vld_next),
  .siclk(siclk),
  .soclk(soclk)
				);





/*****************************************************************
 * bounce_ucb
 *****************************************************************/
assign 	bounce_ack_buf_wr = c2i_packet_vld & bounce_ucb_sel & ~bounce_ack_buf_full;

assign 	bounce_ucb_buf_acpt = bounce_ack_buf_wr;

assign 	bounce_ack_buf_din[127:0] = c2i_packet[127:0];
//=============================================
//dbl_buf #(128) bounce_ack_buf (
//				.clk(iol2clk),
//				.wr(bounce_ack_buf_wr),
//				.din(bounce_ack_buf_din[127:0]),
//				.vld(bounce_ack_buf_vld),
//				.dout(bounce_ack_buf_dout[127:0]),
//				.rd(bounce_ack_buf_rd),
//				.full(bounce_ack_buf_full) ); */
//=============================================================================
//=============================================================================
//========================================================== dbl_buf ==========

// if both entries are empty, write to entry pointed to by the older pointer
assign	cc_wr_buf0 = bounce_ack_buf_wr & (cc_buf1_vld | (~cc_buf0_vld & ~cc_buf1_older));
assign	cc_wr_buf1 = bounce_ack_buf_wr & (cc_buf0_vld | (~cc_buf1_vld & cc_buf1_older));

// read from the older entry
assign	cc_rd_buf0 = bounce_ack_buf_rd & ~cc_buf1_older;
assign	cc_rd_buf1 = bounce_ack_buf_rd &  cc_buf1_older;

// flip older pointer when an entry is read
assign	cc_rd_buf = bounce_ack_buf_rd & (cc_buf0_vld | cc_buf1_vld);
assign	cc_buf1_older_inv = ~cc_buf1_older;
ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 cc_buf1_older_ff  
				(
				.scan_in(cc_buf1_older_ff_scanin),
				.scan_out(cc_buf1_older_ff_scanout),
				.dout		(cc_buf1_older),
				.l1clk		(l1clk),
				.en		(cc_rd_buf),
				.din		(cc_buf1_older_inv),
  .siclk(siclk),
  .soclk(soclk)
				);

// set valid bit for writes and reset for reads
assign	cc_en_vld0 = cc_wr_buf0 | cc_rd_buf0;
assign	cc_en_vld1 = cc_wr_buf1 | cc_rd_buf1;

// the actual buffers
ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 cc_buf0_vld_ff  
				(
				.scan_in(cc_buf0_vld_ff_scanin),
				.scan_out(cc_buf0_vld_ff_scanout),
				.dout		(cc_buf0_vld),
				.l1clk		(l1clk),
				.en		(cc_en_vld0),
				.din		(cc_wr_buf0),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 cc_buf1_vld_ff  
				(
				.scan_in(cc_buf1_vld_ff_scanin),
				.scan_out(cc_buf1_vld_ff_scanout),
				.dout		(cc_buf1_vld),
				.l1clk		(l1clk),
				.en		(cc_en_vld1),
				.din		(cc_wr_buf1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_128 cc_buf0_obj_ff  
				(
				.scan_in(cc_buf0_obj_ff_scanin),
				.scan_out(cc_buf0_obj_ff_scanout),
				.dout		(cc_buf0_obj[127:0]),
				.l1clk		(l1clk),
				.en		(cc_wr_buf0),
				.din		(bounce_ack_buf_din[127:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_128 cc_buf1_obj_ff  
				(
				.scan_in(cc_buf1_obj_ff_scanin),
				.scan_out(cc_buf1_obj_ff_scanout),
				.dout		(cc_buf1_obj[127:0]),
				.l1clk		(l1clk),
				.en		(cc_wr_buf1),
				.din		(bounce_ack_buf_din[127:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

// mux out the older entry
assign	bounce_ack_buf_dout[127:0] = (cc_buf1_older) ? cc_buf1_obj[127:0] : cc_buf0_obj[127:0] ;

assign	bounce_ack_buf_vld = cc_buf0_vld | cc_buf1_vld;
assign	bounce_ack_buf_full = cc_buf0_vld & cc_buf1_vld;
//=============================================
assign 	bounce_ack_vld = bounce_ack_buf_vld;

assign 	bounce_ack_packet[127:0] = bounce_ack_buf_dout[127:0];

assign 	bounce_ack_buf_rd = bounce_ack_rd;
//========================================================== dbl_buf ==========
//=============================================================================
//=============================================================================



/*****************************************************************
 * rd_nack_ucb
 *****************************************************************/
assign 	rd_nack_buf_wr = c2i_packet_vld & rd_nack_ucb_sel & ~rd_nack_buf_full;

assign 	rd_nack_ucb_buf_acpt = rd_nack_buf_wr;

assign 	rd_nack_buf_din[63:0] = c2i_rd_nack_packet[63:0];
//=============================================
//dbl_buf #(64) rd_nack_buf (
//				.clk(iol2clk),
//				.wr(rd_nack_buf_wr),
//				.din(rd_nack_buf_din[63:0]),
//				.vld(rd_nack_buf_vld),
//				.dout(rd_nack_buf_dout[63:0]),
//				.rd(rd_nack_buf_rd),
//				.full(rd_nack_buf_full) ); */
//=============================================================================
//=============================================================================
//========================================================== dbl_buf ==========

// if both entries are empty, write to entry pointed to by the older pointer
assign	dd_wr_buf0 = rd_nack_buf_wr & (dd_buf1_vld | (~dd_buf0_vld & ~dd_buf1_older));
assign	dd_wr_buf1 = rd_nack_buf_wr & (dd_buf0_vld | (~dd_buf1_vld & dd_buf1_older));

// read from the older entry
assign	dd_rd_buf0 = rd_nack_buf_rd & ~dd_buf1_older;
assign	dd_rd_buf1 = rd_nack_buf_rd &  dd_buf1_older;

// flip older pointer when an entry is read
assign	dd_rd_buf = rd_nack_buf_rd & (dd_buf0_vld | dd_buf1_vld);
assign	dd_buf1_older_inv = ~dd_buf1_older;
ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 dd_buf1_older_ff  
				(
				.scan_in(dd_buf1_older_ff_scanin),
				.scan_out(dd_buf1_older_ff_scanout),
				.dout		(dd_buf1_older),
				.l1clk		(l1clk),
				.en		(dd_rd_buf),
				.din		(dd_buf1_older_inv),
  .siclk(siclk),
  .soclk(soclk)
				);

// set valid bit for writes and reset for reads
assign	dd_en_vld0 = dd_wr_buf0 | dd_rd_buf0;
assign	dd_en_vld1 = dd_wr_buf1 | dd_rd_buf1;

// the actual buffers
ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 dd_buf0_vld_ff  
				(
				.scan_in(dd_buf0_vld_ff_scanin),
				.scan_out(dd_buf0_vld_ff_scanout),
				.dout		(dd_buf0_vld),
				.l1clk		(l1clk),
				.en		(dd_en_vld0),
				.din		(dd_wr_buf0),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 dd_buf1_vld_ff  
				(
				.scan_in(dd_buf1_vld_ff_scanin),
				.scan_out(dd_buf1_vld_ff_scanout),
				.dout		(dd_buf1_vld),
				.l1clk		(l1clk),
				.en		(dd_en_vld1),
				.din		(dd_wr_buf1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_64 dd_buf0_obj_ff  
				(
				.scan_in(dd_buf0_obj_ff_scanin),
				.scan_out(dd_buf0_obj_ff_scanout),
				.dout		(dd_buf0_obj[63:0]),
				.l1clk		(l1clk),
				.en		(dd_wr_buf0),
				.din		(rd_nack_buf_din[63:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_64 dd_buf1_obj_ff  
				(
				.scan_in(dd_buf1_obj_ff_scanin),
				.scan_out(dd_buf1_obj_ff_scanout),
				.dout		(dd_buf1_obj[63:0]),
				.l1clk		(l1clk),
				.en		(dd_wr_buf1),
				.din		(rd_nack_buf_din[63:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

// mux out the older entry
assign	rd_nack_buf_dout[63:0] = (dd_buf1_older) ? dd_buf1_obj[63:0] : dd_buf0_obj[63:0] ;

assign	rd_nack_buf_vld = dd_buf0_vld | dd_buf1_vld;
assign	rd_nack_buf_full = dd_buf0_vld & dd_buf1_vld;
//=============================================
assign 	rd_nack_vld = rd_nack_buf_vld;

assign 	rd_nack_packet[63:0] = rd_nack_buf_dout[63:0];

assign 	rd_nack_buf_rd = rd_nack_rd;
//========================================================== dbl_buf ==========
//=============================================================================
//=============================================================================


//================================
//===  ASI related registers  ====
//================================


// ****************************
// utility in wmr_protected chain  
// ****************************
/*
assign	wmr_counter_p1[9:0] = (wmr_counter[9:0]==`WMR_LENGTH_P1) ? `WMR_LENGTH_P1 : wmr_counter[9:0]+10'b1;

msff_ctl_macro wmr_counter_ff (width=10)
				(
				.scan_in(wmr_counter_ff_scanin),
				.scan_out(wmr_counter_ff_scanout),
				.dout		(wmr_counter[9:0]),
				.l1clk		(l1clk),
				.din		(wmr_counter_p1[9:0])
				);
				*/

//assign	wmr_upd_en = (wmr_counter[9:0]==`WMR_LENGTH)|~cmp_freeze[2] ;
//assign	cmp_freeze_n[2:0] = {1'b1,cmp_freeze[1:0]};


assign	wmr_upd_en = ~wmr_protect_d1&wmr_protect_d2 ; // detect deassert of wmr.

ncu_ctrl_ctl_msff_ctl_macro__width_1 wmr_protect_d1_ff 
				(
				.scan_in(wmr_protect_d1_ff_scanin),
				.scan_out(wmr_protect_d1_ff_scanout),
				.dout		(wmr_protect_d1),
				.l1clk		(l1clk),
				.siclk          (aclk_wmr),
				.din		(wmr_protect),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_1 wmr_protect_d2_ff 
				(
				.scan_in(wmr_protect_d2_ff_scanin),
				.scan_out(wmr_protect_d2_ff_scanout),
				.dout		(wmr_protect_d2),
				.l1clk		(l1clk),
				.siclk          (aclk_wmr),
				.din		(wmr_protect_d1),
  .soclk(soclk)
				);
				
assign por_upd_en_next = ~tcu_aclk & ~tcu_bclk & ~tcu_scan_en; // detect deassert of POR
assign por_upd_en = por_upd_en_next & ~por_upd_en_d1 & ~wmr_protect;

ncu_ctrl_ctl_msff_ctl_macro__width_1 por_upd_en_ff
				(
				.scan_in(por_upd_en_ff_scanin),
				.scan_out(por_upd_en_ff_scanout),
				.dout		(por_upd_en_d1),
				.l1clk		(l1clk),
				//.siclk          (aclk_wmr),
				.din		(por_upd_en_next),
  .siclk(siclk),
  .soclk(soclk)
				);


/***************************
 ***** core_available   ****
 ***************************/
//// register is from efuse core_available[7:0]

/***********************
 ****  core_enable  ****
 ***********************/
always@(coreavail) begin
    casex(coreavail[7:0])
    8'bxxxx_xxx1 : coreavail_lowest_1hot[7:0] = 8'b0000_0001 ;
    8'bxxxx_xx10 : coreavail_lowest_1hot[7:0] = 8'b0000_0010 ;
    8'bxxxx_x100 : coreavail_lowest_1hot[7:0] = 8'b0000_0100 ;
    8'bxxxx_1000 : coreavail_lowest_1hot[7:0] = 8'b0000_1000 ;
    8'bxxx1_0000 : coreavail_lowest_1hot[7:0] = 8'b0001_0000 ;
    8'bxx10_0000 : coreavail_lowest_1hot[7:0] = 8'b0010_0000 ;
    8'bx100_0000 : coreavail_lowest_1hot[7:0] = 8'b0100_0000 ;
    8'b1000_0000 : coreavail_lowest_1hot[7:0] = 8'b1000_0000 ;
         default : coreavail_lowest_1hot[7:0] = 8'b0000_0000 ;
    endcase
end

assign	core_enable_a0_default[7:0] = ncu_man_ucb_c2i_packet_buf_id[0] ? coreavail_lowest_1hot[7:0] :
							8'b0000_0001 << ncu_man_ucb_c2i_packet_cputhr[5:3] ;
assign	c2i_core_en[7:0] =  { (&ncu_man_ucb_c2i_packet_data[63:56]),
			      (&ncu_man_ucb_c2i_packet_data[55:48]),
			      (&ncu_man_ucb_c2i_packet_data[47:40]),
			      (&ncu_man_ucb_c2i_packet_data[39:32]),
			      (&ncu_man_ucb_c2i_packet_data[31:24]),
			      (&ncu_man_ucb_c2i_packet_data[23:16]),
			      (&ncu_man_ucb_c2i_packet_data[15:8] ),
			      (&ncu_man_ucb_c2i_packet_data[7:0] ) } & coreavail[7:0] ;

assign	c2i_core_en_a0 = ~(|c2i_core_en[7:0]) ;

assign	asi_core_en_wr = ncu_man_ucb_buf_acpt_d2 & asi_core_enable_dec & ncu_man_ucb_c2i_packet_is_wr_req;

assign	core_enable_next[7:0] =  coreavail_done ? coreavail[7:0] :	// update with coreavail deassert wmr or por
		       		~asi_core_en_wr ? core_enable[7:0] : //lock here when no write//
                       		 c2i_core_en_a0 ? core_enable_a0_default[7:0] : c2i_core_en[7:0] ;

assign core_enable_ff_in[7:0] = ~core_enable_next[7:0];
ncu_ctrl_ctl_msff_ctl_macro__width_8 core_enable_ff 
				(
				.scan_in(core_enable_ff_scanin),
				.scan_out(core_enable_ff_scanout),
				.dout		(core_enable_ff_out[7:0]),
				.l1clk		(l1clk), 
				.siclk		(aclk_wmr),
				.din		(core_enable_ff_in[7:0]),
  .soclk(soclk)
				);
assign core_enable[7:0] = ~core_enable_ff_out[7:0];

assign	creg_core_enable[63:0] = { {8{core_enable[7]}}, {8{core_enable[6]}}, 
				   {8{core_enable[5]}}, {8{core_enable[4]}}, 
				   {8{core_enable[3]}}, {8{core_enable[2]}}, 
				   {8{core_enable[1]}}, {8{core_enable[0]}} };


/***************************
 *** core_enable_status  ***
 ***************************/
assign	core_enable_status_next[7:0] = coreavail_done ? coreavail[7:0] :
		 		  wmr_upd_en  ? core_enable[7:0] : core_enable_status[7:0] ;

assign core_enable_status_ff_in[7:0] = ~core_enable_status_next[7:0];

ncu_ctrl_ctl_msffi_ctl_macro__width_1 core_enable_status7_ff 
				(
				.scan_in(core_enable_status7_ff_scanin),
				.scan_out(core_enable_status7_ff_scanout),
				.q_l		(ncu_spc7_core_enable_status),
				.l1clk		(l1clk),
				.din		(core_enable_status_ff_in[7]),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msffi_ctl_macro__width_1 core_enable_status6_ff 
				(
				.scan_in(core_enable_status6_ff_scanin),
				.scan_out(core_enable_status6_ff_scanout),
				.q_l		(ncu_spc6_core_enable_status),
				.l1clk		(l1clk),
				.din		(core_enable_status_ff_in[6]),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msffi_ctl_macro__width_1 core_enable_status5_ff 
				(
				.scan_in(core_enable_status5_ff_scanin),
				.scan_out(core_enable_status5_ff_scanout),
				.q_l		(ncu_spc5_core_enable_status),
				.l1clk		(l1clk),
				.din		(core_enable_status_ff_in[5]),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msffi_ctl_macro__width_1 core_enable_status4_ff 
				(
				.scan_in(core_enable_status4_ff_scanin),
				.scan_out(core_enable_status4_ff_scanout),
				.q_l		(ncu_spc4_core_enable_status),
				.l1clk		(l1clk),
				.din		(core_enable_status_ff_in[4]),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msffi_ctl_macro__width_1 core_enable_status3_ff 
				(
				.scan_in(core_enable_status3_ff_scanin),
				.scan_out(core_enable_status3_ff_scanout),
				.q_l		(ncu_spc3_core_enable_status),
				.l1clk		(l1clk),
				.din		(core_enable_status_ff_in[3]),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msffi_ctl_macro__width_1 core_enable_status2_ff 
				(
				.scan_in(core_enable_status2_ff_scanin),
				.scan_out(core_enable_status2_ff_scanout),
				.q_l		(ncu_spc2_core_enable_status),
				.l1clk		(l1clk),
				.din		(core_enable_status_ff_in[2]),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msffi_ctl_macro__width_1 core_enable_status1_ff 
				(
				.scan_in(core_enable_status1_ff_scanin),
				.scan_out(core_enable_status1_ff_scanout),
				.q_l		(ncu_spc1_core_enable_status),
				.l1clk		(l1clk),
				.din		(core_enable_status_ff_in[1]),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msffi_ctl_macro__width_1 core_enable_status0_ff 
				(
				.scan_in(core_enable_status0_ff_scanin),
				.scan_out(core_enable_status0_ff_scanout),
				.q_l		(ncu_spc0_core_enable_status),
				.l1clk		(l1clk),
				.din		(core_enable_status_ff_in[0]),
  .siclk(siclk),
  .soclk(soclk)
				);

//assign core_enable_status[7:0] = ~core_enable_status_ff_out[7:0];
assign core_enable_status[7:0] = {ncu_spc7_core_enable_status,ncu_spc6_core_enable_status,ncu_spc5_core_enable_status,ncu_spc4_core_enable_status,
				  ncu_spc3_core_enable_status,ncu_spc2_core_enable_status,ncu_spc1_core_enable_status,ncu_spc0_core_enable_status};

assign	creg_core_enable_status[63:0] = { {8{core_enable_status[7]}},{8{core_enable_status[6]}},
					  {8{core_enable_status[5]}},{8{core_enable_status[4]}},
					  {8{core_enable_status[3]}},{8{core_enable_status[2]}},
					  {8{core_enable_status[1]}},{8{core_enable_status[0]}} } ;



/**************************
 *****  xir_steering  *****
 **************************/

ncu_ctrl_ctl_msff_ctl_macro__width_1 coreavail_done_d1_ff 
				(
				.scan_in(coreavail_done_d1_ff_scanin),
				.scan_out(coreavail_done_d1_ff_scanout),
				.dout		(coreavail_done_d1),
				.l1clk		(l1clk),
				.din		(coreavail_done),
  .siclk(siclk),
  .soclk(soclk)
				);




////// have same value as core_enable_status after wmr, so take value from core_enable at de-assertion of wmr,
// check/qualify with core_enable_status for further asi_wr. Ok to have 0 value in register//

assign asi_xir_steering_wr = ncu_man_ucb_buf_acpt_d2 & asi_xir_steering_dec & ncu_man_ucb_c2i_packet_is_wr_req;

//also use by core_running//
assign	core_enable_status64[63:0] =  { {8{core_enable_status[7]}},
				   	{8{core_enable_status[6]}},
				   	{8{core_enable_status[5]}},
				   	{8{core_enable_status[4]}},
				   	{8{core_enable_status[3]}},
				   	{8{core_enable_status[2]}},
				   	{8{core_enable_status[1]}},
				   	{8{core_enable_status[0]}} } ;

assign	c2i_data_by_core_enable_status[63:0] = core_enable_status64[63:0]&ncu_man_ucb_c2i_packet_data[63:0] ; 

assign	xir_steering_next[63:0] = 
		              coreavail_done_d1   ? creg_coreavail[63:0] :
		  	      wmr_upd_en          ? creg_core_enable[63:0] :
			      asi_xir_steering_wr ? c2i_data_by_core_enable_status[63:0] : xir_steering[63:0] ;

assign	xir_snapd_vec_vld = |xir_snapd_vec[55:0] ;
assign	xir_snapd_vec_next[55:0] = xir_trigger_d1 ? xir_steering[63:8] : 
				 xir_ld_mini_vec ? {8'b0,xir_snapd_vec[55:8]} : xir_snapd_vec[55:0] ;


assign	xir_srvcd_mini_vec_vld = |xir_srvcd_mini_vec[7:0] ;

assign	xir_mini_vec_next[7:0] =  xir_trigger_d1 ? xir_steering[7:0] : 
				 xir_ld_mini_vec ? xir_snapd_vec[7:0] : 
					xir_srvc ? xir_srvcd_mini_vec[7:0] : xir_mini_vec[7:0] ;

//// to ignore any rst_xir comes in during busy ////
assign	xir_trigger_d0_next = xir_trigger & ~xir_busy ;	

assign	xir_ld_mini_vec = ~xir_srvcd_mini_vec_vld & xir_snapd_vec_vld & ~ncu_man_int_buf_full ;

assign	xir_srvc = ~ncu_man_int_buf_full & xir_mini_vec_vld & ~intvecdisp_int_wr & ~rasper_int_wr ;

assign	xir_int_wr = xir_srvc ;


assign	xir_cpuid_p1[2:0] = xir_cpuid[2:0]+3'b001 ;
//// set cpuid to 3'd0 when trigger_d1 ////
assign	xir_cpuid_next[2:0] = xir_cpuid_p1[2:0] & {3{~xir_trigger_d1}} ;
assign	xir_cpuid_inc = xir_ld_mini_vec | xir_trigger_d1 ;

assign	xir_busy_next = xir_trigger_d0 | xir_trigger_d1 | xir_snapd_vec_vld | xir_mini_vec_vld | xir_trigger_d0_next ;
assign  xir_busy_falling = ~xir_busy & xir_busy_d1 ;
assign ncu_rst_xir_done_next = rst_ncu_xir_inv ? 1'b0 : xir_busy_falling ? 1'b1 : ncu_rst_xir_done;
//assign	ncu_rst_xir_done_next = ~xir_busy & xir_busy_d1 ;
assign	xir_trigger_next = ~rst_ncu_xir_inv ;
assign xir_trigger = xir_trigger_next & ~xir_trigger_q;		// detect xir_trigger rising edge since rst_xir is no
								// longer 1-pulse signal

assign xir_steering_ff_in[63:0] = ~xir_steering_next[63:0];
ncu_ctrl_ctl_msff_ctl_macro__width_64 xir_steering_ff 
				(
				.scan_in(xir_steering_ff_scanin),
				.scan_out(xir_steering_ff_scanout),
				.dout		(xir_steering_ff_out[63:0]),
				.l1clk		(l1clk),
				.din		(xir_steering_ff_in[63:0]),
  .siclk(siclk),
  .soclk(soclk)
				);
assign xir_steering[63:0] = ~xir_steering_ff_out[63:0];

ncu_ctrl_ctl_msff_ctl_macro__width_1 xir_trigger_ff 
				(
				.scan_in(xir_trigger_ff_scanin),
				.scan_out(xir_trigger_ff_scanout),
				.dout		(xir_trigger_q),
				.l1clk		(l1clk),
				.din		(xir_trigger_next),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_1 xir_trigger_d0_ff 
				(
				.scan_in(xir_trigger_d0_ff_scanin),
				.scan_out(xir_trigger_d0_ff_scanout),
				.dout		(xir_trigger_d0),
				.l1clk		(l1clk),
				.din		(xir_trigger_d0_next),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_1 xir_trigger_d1_ff 
				(
				.scan_in(xir_trigger_d1_ff_scanin),
				.scan_out(xir_trigger_d1_ff_scanout),
				.dout		(xir_trigger_d1),
				.l1clk		(l1clk),
				.din		(xir_trigger_d0),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_56 xir_snapd_vec_ff 
				(
				.scan_in(xir_snapd_vec_ff_scanin),
				.scan_out(xir_snapd_vec_ff_scanout),
				.dout		(xir_snapd_vec[55:0]),
				.l1clk		(l1clk),
				.din		(xir_snapd_vec_next[55:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_8 xir_mini_vec_ff 
				(
				.scan_in(xir_mini_vec_ff_scanin),
				.scan_out(xir_mini_vec_ff_scanout),
				.dout		(xir_mini_vec[7:0]),
				.l1clk		(l1clk),
				.din		(xir_mini_vec_next[7:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_3 xir_cpuid_ff  
				(
				.scan_in(xir_cpuid_ff_scanin),
				.scan_out(xir_cpuid_ff_scanout),
				.dout		(xir_cpuid[2:0]),
				.l1clk		(l1clk),
				.en		(xir_cpuid_inc),
				.din		(xir_cpuid_next[2:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_1 xir_busy_ff 
				(
				.scan_in(xir_busy_ff_scanin),
				.scan_out(xir_busy_ff_scanout),
				.dout		(xir_busy),
				.l1clk		(l1clk),
				.din		(xir_busy_next),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_1 xir_busy_d1_ff 
				(
				.scan_in(xir_busy_d1_ff_scanin),
				.scan_out(xir_busy_d1_ff_scanout),
				.dout		(xir_busy_d1),
				.l1clk		(l1clk),
				.din		(xir_busy),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_1 ncu_rst_xir_done_ff 
				(
				.scan_in(ncu_rst_xir_done_ff_scanin),
				.scan_out(ncu_rst_xir_done_ff_scanout),
				.dout		(ncu_rst_xir_done),
				.l1clk		(l1clk),
				.din		(ncu_rst_xir_done_next),
  .siclk(siclk),
  .soclk(soclk)
				);


always@(xir_mini_vec ) begin
    casex(xir_mini_vec[7:0]) // 0in case -parallel -full
    8'bxxxx_xxx1 : begin
        xir_srvcd_mini_vec[7:0] = 8'b1111_1110 & xir_mini_vec[7:0] ;
	xir_mini_thr[2:0] = 3'd0 ;
	xir_mini_vec_vld = 1'b1;
    end
    8'bxxxx_xx10 : begin
        xir_srvcd_mini_vec[7:0] = 8'b1111_1101 & xir_mini_vec[7:0] ;
	xir_mini_thr[2:0] = 3'd1 ;
	xir_mini_vec_vld = 1'b1;
    end
    8'bxxxx_x100 : begin
        xir_srvcd_mini_vec[7:0] = 8'b1111_1011 & xir_mini_vec[7:0] ;
	xir_mini_thr[2:0] = 3'd2 ;
	xir_mini_vec_vld = 1'b1;
    end
    8'bxxxx_1000 : begin
        xir_srvcd_mini_vec[7:0] = 8'b1111_0111 & xir_mini_vec[7:0] ;
	xir_mini_thr[2:0] = 3'd3 ;
	xir_mini_vec_vld = 1'b1;
    end
    8'bxxx1_0000 : begin
        xir_srvcd_mini_vec[7:0] = 8'b1110_1111 & xir_mini_vec[7:0] ;
	xir_mini_thr[2:0] = 3'd4 ;
	xir_mini_vec_vld = 1'b1;
    end
    8'bxx10_0000 : begin
        xir_srvcd_mini_vec[7:0] = 8'b1101_1111 & xir_mini_vec[7:0] ;
	xir_mini_thr[2:0] = 3'd5 ;
	xir_mini_vec_vld = 1'b1;
    end
    8'bx100_0000 : begin
        xir_srvcd_mini_vec[7:0] = 8'b1011_1111 & xir_mini_vec[7:0] ;
	xir_mini_thr[2:0] = 3'd6 ;
	xir_mini_vec_vld = 1'b1;
    end
    8'b1000_0000 : begin
        xir_srvcd_mini_vec[7:0] = 8'b0111_1111 & xir_mini_vec[7:0] ;
	xir_mini_thr[2:0] = 3'd7 ;
	xir_mini_vec_vld = 1'b1;
    end
         default : begin //all 0s//
        xir_srvcd_mini_vec[7:0] = xir_mini_vec[7:0] ;
	xir_mini_thr[2:0] = 3'd0 ;
	xir_mini_vec_vld = 1'b0;
    end
    endcase
end

/*
assign	xir_int_pkt[24:0] = {	////7'b0,	//reserved
				6'b00_0011, //XIR int vector    //[24:19]
				////32'b0, 	//reserved
				3'b0,	//dummy dev_id
				`UCB_RESET_VEC ,      // interrupt type is reset
				2'b00,
				xir_cpuid[2:0],xir_mini_thr[2:0],
				`UCB_INT_VEC } ;
*/

assign	xir_int_pkt[24:0] = {	////7'b0,	//reserved
				6'b00_0011, //XIR int vector
				////32'b0,	//reserved
				9'b0,	//dummy dev_id
				xir_cpuid[2:0],xir_mini_thr[2:0],
				`UCB_RESET_VEC } ;



/**************************
 *****  core_running *****
 **************************/
// when wake_thread, take default value from core_enable_status (which is from core_enable  //
// when got out of wmr). core_enable is already senitized by coreavail, so no need to check against coreavail.
// Check against core_enable_staus when asi_wr.
// If write from TCU is all 0, take lowest thread from core_enable_status 
// If write from CPU is all 0, keep requester's thread alive //

always@(core_enable_status) begin
    casex(core_enable_status[6:0]) // 0in case -parallel -full
    7'bxxx_xxx1 : enable_status_lowest_1hot[7:0] = 8'b0000_0001 ;
    7'bxxx_xx10 : enable_status_lowest_1hot[7:0] = 8'b0000_0010 ;
    7'bxxx_x100 : enable_status_lowest_1hot[7:0] = 8'b0000_0100 ;
    7'bxxx_1000 : enable_status_lowest_1hot[7:0] = 8'b0000_1000 ;
    7'bxx1_0000 : enable_status_lowest_1hot[7:0] = 8'b0001_0000 ;
    7'bx10_0000 : enable_status_lowest_1hot[7:0] = 8'b0010_0000 ;
    7'b100_0000 : enable_status_lowest_1hot[7:0] = 8'b0100_0000 ;
        default : enable_status_lowest_1hot[7:0] = 8'b1000_0000 ;
    endcase
end

assign	enable_status_lowest_thr_1hot[63:0] = { 7'b0,enable_status_lowest_1hot[7],
						7'b0,enable_status_lowest_1hot[6],
						7'b0,enable_status_lowest_1hot[5],
						7'b0,enable_status_lowest_1hot[4],
						7'b0,enable_status_lowest_1hot[3],
						7'b0,enable_status_lowest_1hot[2],
						7'b0,enable_status_lowest_1hot[1],
						7'b0,enable_status_lowest_1hot[0] } ;

//assign	core_running_illegal_thr_acc = ~|((64'h0000_0000_0000_0001 << ncu_man_ucb_c2i_packet_cputhr[5:0])&
					   //core_enable_status64[63:0] ) ;
//assign	core_running_a0_default[63:0] = (ncu_man_ucb_c2i_packet_buf_id[0]|core_running_illegal_thr_acc) ? 
//assign	core_running_a0_default[63:0] = (ncu_man_ucb_c2i_packet_buf_id[0]) ? 
//					enable_status_lowest_thr_1hot[63:0] :
//					64'h0000_0000_0000_0001 << ncu_man_ucb_c2i_packet_cputhr[5:0] ;
assign	core_running_a0_default[63:0] = (ncu_man_ucb_c2i_packet_buf_id[0]) ? 64'h00000000 :
				        64'h0000_0000_0000_0001 << ncu_man_ucb_c2i_packet_cputhr[5:0] ;
	// when buf_id[1:0] = "01" request is from TCU. TCU request is for
	// dg1 only. We can load all "0" to park all thread during debug.

assign	c2i_w1cdata_by_core_running[63:0] = (~ncu_man_ucb_c2i_packet_data[63:0]&core_running[63:0]) ;


// filtered by core_enable_status[63:0], and then check if core_running is going to be all 0 // 
assign	c2i_core_running_a0 = ~(|c2i_data_by_core_enable_status[63:0]);

assign	c2i_core_runningw1c_a0 = ~(|c2i_w1cdata_by_core_running[63:0]);

// check if resulting all 0. If it is, use a0 default which also check for illegel thr acc //
assign	core_runningrw_data[63:0] = c2i_core_running_a0 ? 
				    core_running_a0_default[63:0] : c2i_data_by_core_enable_status[63:0];

assign	core_runningw1c_data[63:0] = c2i_core_runningw1c_a0 ? 
				     core_running_a0_default[63:0] : c2i_w1cdata_by_core_running[63:0];

assign	asi_core_running_wr = ncu_man_ucb_buf_acpt_d2 & asi_core_running_dec & ncu_man_ucb_c2i_packet_is_wr_req;
assign	asi_core_runningw1s_wr = ncu_man_ucb_buf_acpt_d2 & asi_core_runningw1s_dec & ncu_man_ucb_c2i_packet_is_wr_req;
assign	asi_core_runningw1c_wr = ncu_man_ucb_buf_acpt_d2 & asi_core_runningw1c_dec & ncu_man_ucb_c2i_packet_is_wr_req;

assign	core_running_next[63:0] = wake_thread ?  enable_status_lowest_thr_1hot[63:0] :
	               asi_core_runningw1s_wr ? (c2i_data_by_core_enable_status[63:0]|core_running[63:0]) :
			  asi_core_running_wr ?  core_runningrw_data[63:0] :
		       asi_core_runningw1c_wr ?  core_runningw1c_data[63:0] : core_running[63:0] ;

ncu_ctrl_ctl_msff_ctl_macro__width_63 core_running_ff 
				(
				.scan_in(core_running_ff_scanin),
				.scan_out(core_running_ff_scanout),
				.dout		(core_running[63:1]),
				.l1clk		(l1clk),
				.din		(core_running_next[63:1]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign core_running_ff_in = core_running_next[0];
ncu_ctrl_ctl_msff_ctl_macro__width_1 core_running0_ff 
				(
				.scan_in(core_running0_ff_scanin),
				.scan_out(core_running0_ff_scanout),
				.dout		(core_running_ff_out),
				.l1clk		(l1clk),
				.din		(core_running_ff_in),
  .siclk(siclk),
  .soclk(soclk)
				);
assign core_running[0] = core_running_ff_out;

////  need to make sure only allowing 1 wake thread per warm reset ////
ncu_ctrl_ctl_msff_ctl_macro__width_1 unpark_thread_d1_ff 
				(
				.scan_in(unpark_thread_d1_ff_scanin),
				.scan_out(unpark_thread_d1_ff_scanout),
				.dout		(unpark_thread_d1),
				.l1clk		(l1clk),
				.din		(rst_ncu_unpark_thread),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 unpark_thread_d2_ff 
				(
				.scan_in(unpark_thread_d2_ff_scanin),
				.scan_out(unpark_thread_d2_ff_scanout),
				.dout		(unpark_thread_d2),
				.l1clk		(l1clk),
				.din		(unpark_thread_d1),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 wake_ok__ff  
				(
				.scan_in(wake_ok__ff_scanin),
				.scan_out(wake_ok__ff_scanout),
				.dout		(wake_ok_inv),
				.l1clk		(l1clk),
				.en		(unpark_thread_d1),
				.din		(1'b1),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	wake_thread_n = unpark_thread_d1 & ~unpark_thread_d2 & ~wake_ok_inv ;

ncu_ctrl_ctl_msff_ctl_macro__width_1 wake_thread_ff 
				(
				.scan_in(wake_thread_ff_scanin),
				.scan_out(wake_thread_ff_scanout),
				.dout		(wake_thread),
				.l1clk		(l1clk),
				.din		(wake_thread_n),
  .siclk(siclk),
  .soclk(soclk)
				);



/*********************************
 *****  core_running_status  *****
 *********************************/

ncu_ctrl_ctl_msff_ctl_macro__width_63 core_running_status_ff 
				(
				.scan_in(core_running_status_ff_scanin),
				.scan_out(core_running_status_ff_scanout),
				.dout		(creg_core_running_status[63:1]),
				.l1clk		(l1clk),
				.din		(core_running_status[63:1]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign core_running_status_ff_in = ~core_running_status[0];
ncu_ctrl_ctl_msff_ctl_macro__width_1 core_running_status0_ff 
				(
				.scan_in(core_running_status0_ff_scanin),
				.scan_out(core_running_status0_ff_scanout),
				.dout		(core_running_status_ff_out),
				.l1clk		(l1clk),
				.din		(core_running_status_ff_in),
  .siclk(siclk),
  .soclk(soclk)
				);
assign creg_core_running_status[0] = ~core_running_status_ff_out;





/*********************************
 *****  l2_bank_enable      *****
 *********************************/
reg [7:0]	bankavail_lowest_pair;

assign	bankavail_pair[3:0] = {&bankavail[7:6],&bankavail[5:4],&bankavail[3:2],&bankavail[1:0]};
always@( bankavail_pair ) begin
    casex(bankavail_pair[3:0])
    4'bxxx1 : bankavail_lowest_pair[7:0] = 8'b00_00_00_11;
    4'bxx10 : bankavail_lowest_pair[7:0] = 8'b00_00_11_00;
    4'bx100 : bankavail_lowest_pair[7:0] = 8'b00_11_00_00;
    4'b1000 : bankavail_lowest_pair[7:0] = 8'b11_00_00_00;
    default : bankavail_lowest_pair[7:0] = 8'b00_00_00_00;
    endcase
end

assign	bank_en_wr = ncu_man_ucb_buf_acpt_d2 & creg_bank_en_dec & ncu_man_ucb_c2i_packet_is_wr_req ;

assign	c2i_bank_en[7:0] = ncu_man_ucb_c2i_packet_data[7:0] & bankavail[7:0] ;
assign	c2i_bank_en_a0 = ~(|c2i_bank_en[7:0]) ;
assign	bank_en_next[7:0] =  bankavail_done ? bankavail[7:0] :	//update from bankavail after wmr 
		       		~bank_en_wr ? bank_en[7:0] : //lock here when no write//
                       	     c2i_bank_en_a0 ? bankavail_lowest_pair[7:0] : c2i_bank_en[7:0] ;

assign bank_en_ff_in[7:0] = ~bank_en_next[7:0];
ncu_ctrl_ctl_msff_ctl_macro__width_8 bank_en_ff 
				(
				.scan_in(bank_en_ff_scanin),
				.scan_out(bank_en_ff_scanout),
				.dout		(bank_en_ff_out[7:0]),
				.l1clk		(l1clk), 
				.siclk		(aclk_wmr),
				.din		(bank_en_ff_in[7:0]),
  .soclk(soclk)
				);
assign bank_en[7:0] = ~bank_en_ff_out[7:0];
				
assign	creg_bank_en[63:0] = { 56'b0,bank_en[7:0] } ;



/************************************
 *****  l2_bank_enable_status  *****
 ************************************/


assign	l2pm_en = bankavail_done | wmr_upd_en | por_upd_en;
assign	bank_en_full_status[7:0] = bankavail_done ? bankavail[7:0] : bank_en[7:0] ;
assign	bank_en_pair_status[3:0] = { &bank_en_full_status[7:6], &bank_en_full_status[5:4],
				     &bank_en_full_status[3:2], &bank_en_full_status[1:0] } ;

assign	bank_en_final_status[3:0] = 
			((^bank_en_pair_status[3:2])&(&bank_en_pair_status[1:0])) ? 4'b0011 :
			((&bank_en_pair_status[3:2])&(^bank_en_pair_status[1:0])) ? 4'b1100 : 
								     bank_en_pair_status[3:0] ;

assign	bank_en_final_status[4] = ~&bank_en_final_status[3:0] ;
assign	l2pm_preview_ff_din[4:0] = {~bank_en_final_status[4],bank_en_final_status[3:0]};
//assign  l2pm_ff_din[4:0]         = {~bank_en_final_status[4],bank_en_final_status[3:0]} ;
assign  l2pm_ff_din[4:0]         = {bank_en_final_status[4],bank_en_final_status[3:0]} ;

ncu_ctrl_ctl_msff_ctl_macro__width_5 l2pm_preview_ff 
				(
				.scan_in(l2pm_preview_ff_scanin),
				.scan_out(l2pm_preview_ff_scanout),
				.dout		(l2pm_preview_ff_q[4:0]),
				.l1clk		(l1clk),
				.din		(l2pm_preview_ff_din[4:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	l2pm_preview[4:0] = {~l2pm_preview_ff_q[4],l2pm_preview_ff_q[3:0]};

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_5 l2pm_ff  
				(
				.scan_in(l2pm_ff_scanin),
				.scan_out(l2pm_ff_scanout),
				.dout		({ncu_spc_pm,l2pm_ff_q[3:1],ncu_spc_ba01}),
				.l1clk		(l1clk),
				.en		(l2pm_en),
				.din		(l2pm_ff_din[4:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign l2pm[4:0] = {ncu_spc_pm,l2pm_ff_q[3:1],ncu_spc_ba01};
//assign l2pm[4:0] = {~l2pm_ff_q[4],l2pm_ff_q[3:0]};
assign creg_bank_en_status[63:0] = {48'b0,3'b0,l2pm_preview[4:0],3'b0,l2pm[4:0]} ;

//assign ncu_tcu_bank_en_status[3:0] = creg_bank_en_status[3:0];


/******************************
 ***  L2 Index Hash Enable  ***
 ******************************/

assign	l2idxhs_en_wr = ncu_man_ucb_buf_acpt_d2 & creg_l2idxhs_en_dec & ncu_man_ucb_c2i_packet_is_wr_req ;

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 l2idxhs_en_ff  
				(
				.scan_in(l2idxhs_en_ff_scanin),
				.scan_out(l2idxhs_en_ff_scanout),
				.dout		(l2idxhs_en),
				.l1clk		(l1clk), 
				.siclk		(aclk_wmr),
				.en		(l2idxhs_en_wr),
				.din		(ncu_man_ucb_c2i_packet_data[0]),
  .soclk(soclk)
				);

assign creg_l2idxhs_en[63:0] = {63'b0,l2idxhs_en};

/***********************************
 *** L2 Index Hash Enable Status ***
 ***********************************/

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 l2idxhs_en_status_ff  
				(
				.scan_in(l2idxhs_en_status_ff_scanin),
				.scan_out(l2idxhs_en_status_ff_scanout),
				.dout		(l2idxhs_en_status),
				.l1clk		(l1clk),
				.en		(wmr_upd_en),
				.din		(l2idxhs_en),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	creg_l2idxhs_en_status[63:0] = {63'b0,l2idxhs_en_status} ;



//////////////////////
//// ESR register ////
//////////////////////

assign	creg_esr_wr = ncu_man_ucb_buf_acpt_d2 &
			ncu_man_ucb_c2i_packet_is_wr_req & creg_esr_dec;

ncu_ctrl_ctl_msff_ctl_macro__width_1 iobuf_ue_ff 
				(
				.scan_in(iobuf_ue_ff_scanin),
				.scan_out(iobuf_ue_ff_scanout),
				.dout		(iobuf_ue),
				.l1clk		(l1clk),
				.din		(iobuf_ue_f),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_1 intbuf_ue_ff 
				(
				.scan_in(intbuf_ue_ff_scanin),
				.scan_out(intbuf_ue_ff_scanout),
				.dout		(intbuf_ue),
				.l1clk		(l1clk),
				.din		(intbuf_ue_f),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_1 mondotbl_pe_ff 
				(
				.scan_in(mondotbl_pe_ff_scanin),
				.scan_out(mondotbl_pe_ff_scanout),
				.dout		(mondotbl_pe),
				.l1clk		(l1clk),
				.din		(mondotbl_pe_f),
  .siclk(siclk),
  .soclk(soclk)
				);


ncu_ctrl_ctl_msff_ctl_macro__width_1 mcu3_ncu_ecc_d_ff 
				(
				.scan_in(mcu3_ncu_ecc_d_ff_scanin),
				.scan_out(mcu3_ncu_ecc_d_ff_scanout),
				.dout		(mcu3_ncu_ecc_d),
				.l1clk		(l1clk),
				.din		(mcu3_ncu_ecc),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 mcu3_ncu_fbr_d_ff 
				(
				.scan_in(mcu3_ncu_fbr_d_ff_scanin),
				.scan_out(mcu3_ncu_fbr_d_ff_scanout),
				.dout		(mcu3_ncu_fbr_d),
				.l1clk		(l1clk),
				.din		(mcu3_ncu_fbr),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 mcu3_ncu_fbu_d_ff 
				(
				.scan_in(mcu3_ncu_fbu_d_ff_scanin),
				.scan_out(mcu3_ncu_fbu_d_ff_scanout),
				.dout		(mcu3_ncu_fbu_d),
				.l1clk		(l1clk),
				.din		(mcu3_ncu_fbu),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 mcu2_ncu_ecc_d_ff 
				(
				.scan_in(mcu2_ncu_ecc_d_ff_scanin),
				.scan_out(mcu2_ncu_ecc_d_ff_scanout),
				.dout		(mcu2_ncu_ecc_d),
				.l1clk		(l1clk),
				.din		(mcu2_ncu_ecc),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 mcu2_ncu_fbr_d_ff 
				(
				.scan_in(mcu2_ncu_fbr_d_ff_scanin),
				.scan_out(mcu2_ncu_fbr_d_ff_scanout),
				.dout		(mcu2_ncu_fbr_d),
				.l1clk		(l1clk),
				.din		(mcu2_ncu_fbr),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 mcu2_ncu_fbu_d_ff 
				(
				.scan_in(mcu2_ncu_fbu_d_ff_scanin),
				.scan_out(mcu2_ncu_fbu_d_ff_scanout),
				.dout		(mcu2_ncu_fbu_d),
				.l1clk		(l1clk),
				.din		(mcu2_ncu_fbu),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 mcu1_ncu_ecc_d_ff 
				(
				.scan_in(mcu1_ncu_ecc_d_ff_scanin),
				.scan_out(mcu1_ncu_ecc_d_ff_scanout),
				.dout		(mcu1_ncu_ecc_d),
				.l1clk		(l1clk),
				.din		(mcu1_ncu_ecc),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 mcu1_ncu_fbr_d_ff 
				(
				.scan_in(mcu1_ncu_fbr_d_ff_scanin),
				.scan_out(mcu1_ncu_fbr_d_ff_scanout),
				.dout		(mcu1_ncu_fbr_d),
				.l1clk		(l1clk),
				.din		(mcu1_ncu_fbr),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 mcu1_ncu_fbu_d_ff 
				(
				.scan_in(mcu1_ncu_fbu_d_ff_scanin),
				.scan_out(mcu1_ncu_fbu_d_ff_scanout),
				.dout		(mcu1_ncu_fbu_d),
				.l1clk		(l1clk),
				.din		(mcu1_ncu_fbu),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 mcu0_ncu_ecc_d_ff 
				(
				.scan_in(mcu0_ncu_ecc_d_ff_scanin),
				.scan_out(mcu0_ncu_ecc_d_ff_scanout),
				.dout		(mcu0_ncu_ecc_d),
				.l1clk		(l1clk),
				.din		(mcu0_ncu_ecc),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 mcu0_ncu_fbr_d_ff 
				(
				.scan_in(mcu0_ncu_fbr_d_ff_scanin),
				.scan_out(mcu0_ncu_fbr_d_ff_scanout),
				.dout		(mcu0_ncu_fbr_d),
				.l1clk		(l1clk),
				.din		(mcu0_ncu_fbr),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 mcu0_ncu_fbu_d_ff 
				(
				.scan_in(mcu0_ncu_fbu_d_ff_scanin),
				.scan_out(mcu0_ncu_fbu_d_ff_scanout),
				.dout		(mcu0_ncu_fbu_d),
				.l1clk		(l1clk),
				.din		(mcu0_ncu_fbu),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_1 niu_ncu_d_pe_d_ff 
				(
				.scan_in(niu_ncu_d_pe_d_ff_scanin),
				.scan_out(niu_ncu_d_pe_d_ff_scanout),
				.dout		(niu_ncu_d_pe_d),
				.l1clk		(l1clk),
				.din		(niu_ncu_d_pe),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 niu_ncu_ctag_ue_d_ff 
				(
				.scan_in(niu_ncu_ctag_ue_d_ff_scanin),
				.scan_out(niu_ncu_ctag_ue_d_ff_scanout),
				.dout		(niu_ncu_ctag_ue_d),
				.l1clk		(l1clk),
				.din		(niu_ncu_ctag_ue),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 niu_ncu_ctag_ce_d_ff 
				(
				.scan_in(niu_ncu_ctag_ce_d_ff_scanin),
				.scan_out(niu_ncu_ctag_ce_d_ff_scanout),
				.dout		(niu_ncu_ctag_ce_d),
				.l1clk		(l1clk),
				.din		(niu_ncu_ctag_ce),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_1 sio_ncu_ctag_ce_d_ff 
				(
				.scan_in(sio_ncu_ctag_ce_d_ff_scanin),
				.scan_out(sio_ncu_ctag_ce_d_ff_scanout),
				.dout		(sio_ncu_ctag_ce_d),
				.l1clk		(l1clk),
				.din		(sio_ncu_ctag_ce),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 sio_ncu_ctag_ue_d_ff 
				(
				.scan_in(sio_ncu_ctag_ue_d_ff_scanin),
				.scan_out(sio_ncu_ctag_ue_d_ff_scanout),
				.dout		(sio_ncu_ctag_ue_d),
				.l1clk		(l1clk),
				.din		(sio_ncu_ctag_ue),
  .siclk(siclk),
  .soclk(soclk)
				);

				/*
msff_ctl_macro sio_ncu_d_pe_d_ff (width=1)
				(
				.scan_in(sio_ncu_d_pe_d_ff_scanin),
				.scan_out(sio_ncu_d_pe_d_ff_scanout),
				.dout		(sio_ncu_d_pe_d),
				.l1clk		(l1clk),
				.din		(sio_ncu_d_pe)
				);
				*/

ncu_ctrl_ctl_msff_ctl_macro__width_1 dmu_ncu_d_pe_d_ff 
				(
				.scan_in(dmu_ncu_d_pe_d_ff_scanin),
				.scan_out(dmu_ncu_d_pe_d_ff_scanout),
				.dout		(dmu_ncu_d_pe_d),
				.l1clk		(l1clk),
				.din		(dmu_ncu_d_pe),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 dmu_ncu_siicr_pe_d_ff 
				(
				.scan_in(dmu_ncu_siicr_pe_d_ff_scanin),
				.scan_out(dmu_ncu_siicr_pe_d_ff_scanout),
				.dout		(dmu_ncu_siicr_pe_d),
				.l1clk		(l1clk),
				.din		(dmu_ncu_siicr_pe),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 dmu_ncu_ctag_ue_d_ff 
				(
				.scan_in(dmu_ncu_ctag_ue_d_ff_scanin),
				.scan_out(dmu_ncu_ctag_ue_d_ff_scanout),
				.dout		(dmu_ncu_ctag_ue_d),
				.l1clk		(l1clk),
				.din		(dmu_ncu_ctag_ue),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 dmu_ncu_ctag_ce_d_ff 
				(
				.scan_in(dmu_ncu_ctag_ce_d_ff_scanin),
				.scan_out(dmu_ncu_ctag_ce_d_ff_scanout),
				.dout		(dmu_ncu_ctag_ce_d),
				.l1clk		(l1clk),
				.din		(dmu_ncu_ctag_ce),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 dmu_ncu_ncucr_pe_d_ff 
				(
				.scan_in(dmu_ncu_ncucr_pe_d_ff_scanin),
				.scan_out(dmu_ncu_ncucr_pe_d_ff_scanout),
				.dout		(dmu_ncu_ncucr_pe_d),
				.l1clk		(l1clk),
				.din		(dmu_ncu_ncucr_pe),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 dmu_ncu_ie_d_ff 
				(
				.scan_in(dmu_ncu_ie_d_ff_scanin),
				.scan_out(dmu_ncu_ie_d_ff_scanout),
				.dout		(dmu_ncu_ie_d),
				.l1clk		(l1clk),
				.din		(dmu_ncu_ie),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_1 sii_ncu_dmua_pe_d_ff 
				(
				.scan_in(sii_ncu_dmua_pe_d_ff_scanin),
				.scan_out(sii_ncu_dmua_pe_d_ff_scanout),
				.dout		(sii_ncu_dmua_pe_d),
				.l1clk		(l1clk),
				.din		(sii_ncu_dmua_pe   ),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 sii_ncu_niud_pe_d_ff 
				(
				.scan_in(sii_ncu_niud_pe_d_ff_scanin),
				.scan_out(sii_ncu_niud_pe_d_ff_scanout),
				.dout		(sii_ncu_niud_pe_d),
				.l1clk		(l1clk),
				.din		(sii_ncu_niud_pe   ),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 sii_ncu_dmud_pe_d_ff 
				(
				.scan_in(sii_ncu_dmud_pe_d_ff_scanin),
				.scan_out(sii_ncu_dmud_pe_d_ff_scanout),
				.dout		(sii_ncu_dmud_pe_d),
				.l1clk		(l1clk),
				.din		(sii_ncu_dmud_pe   ),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 sii_ncu_niua_pe_d_ff 
				(
				.scan_in(sii_ncu_niua_pe_d_ff_scanin),
				.scan_out(sii_ncu_niua_pe_d_ff_scanout),
				.dout		(sii_ncu_niua_pe_d),
				.l1clk		(l1clk),
				.din		(sii_ncu_niua_pe   ),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 sii_ncu_dmuctag_ce_d_ff 
				(
				.scan_in(sii_ncu_dmuctag_ce_d_ff_scanin),
				.scan_out(sii_ncu_dmuctag_ce_d_ff_scanout),
				.dout		(sii_ncu_dmuctag_ce_d),
				.l1clk		(l1clk),
				.din		(sii_ncu_dmuctag_ce   ),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 sii_ncu_niuctag_ce_d_ff 
				(
				.scan_in(sii_ncu_niuctag_ce_d_ff_scanin),
				.scan_out(sii_ncu_niuctag_ce_d_ff_scanout),
				.dout		(sii_ncu_niuctag_ce_d),
				.l1clk		(l1clk),
				.din		(sii_ncu_niuctag_ce   ),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 sii_ncu_dmuctag_ue_d_ff 
				(
				.scan_in(sii_ncu_dmuctag_ue_d_ff_scanin),
				.scan_out(sii_ncu_dmuctag_ue_d_ff_scanout),
				.dout		(sii_ncu_dmuctag_ue_d),
				.l1clk		(l1clk),
				.din		(sii_ncu_dmuctag_ue   ),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 sii_ncu_niuctag_ue_d_ff 
				(
				.scan_in(sii_ncu_niuctag_ue_d_ff_scanin),
				.scan_out(sii_ncu_niuctag_ue_d_ff_scanout),
				.dout		(sii_ncu_niuctag_ue_d),
				.l1clk		(l1clk),
				.din		(sii_ncu_niuctag_ue   ),
  .siclk(siclk),
  .soclk(soclk)
				);




assign	raserr_in[42:0] = { 	
		        dmu_cr_id_rtn_err,	//[42]
			mcu3_ncu_ecc_d,		//[41]
			mcu3_ncu_fbr_d,		//[40]
			mcu3_ncu_fbu_d,	//[39]
			mcu2_ncu_ecc_d,		//[38]
			mcu2_ncu_fbr_d,		//[37]
			mcu2_ncu_fbu_d,	//[36]
			mcu1_ncu_ecc_d,		//[35]
			mcu1_ncu_fbr_d,		//[34]
			mcu1_ncu_fbu_d,	//[33]
			mcu0_ncu_ecc_d,		//[32]
			mcu0_ncu_fbr_d,		//[31]
			mcu0_ncu_fbu_d,	//[30]
			niu_ncu_d_pe_d,		//[29]
			niu_ncu_ctag_ue_d,	//[28]
			niu_ncu_ctag_ce_d,	//[27]
			sio_ncu_ctag_ce_d,	//[26]
			sio_ncu_ctag_ue_d,	//[25]
		        1'b0,
		//	sio_ncu_d_pe_d,		//[24]
		 	 ncuctag_ce,		//[23]
		 	 ncuctag_ue,		//[22]*
		 	 dmubuf_pue,		//[21]*
		 	 iobuf_ue,		//[20]
		 	 cpubuf_ue,		//[19]*
		 	 cpubuf_pe,		//[18]*
		 	 intman_pe,		//[17]*
		 	 intbuf_ue,		//[16]
		 	 mondotbl_pe, 		//[15]
		 	 ncusiid_pe,  		//[14]*
			dmu_ncu_d_pe_d,		//[13]
			dmu_ncu_siicr_pe_d,	//[12]
			dmu_ncu_ctag_ue_d,	//[11]
			dmu_ncu_ctag_ce_d,	//[10]
			dmu_ncu_ncucr_pe_d,	//[9]
			dmu_ncu_ie_d,		//[8]
			sii_ncu_dmua_pe_d,	//[7]
			sii_ncu_niud_pe_d,	//[6]
			sii_ncu_dmud_pe_d,	//[5]
			sii_ncu_niua_pe_d,	//[4]
			sii_ncu_dmuctag_ce_d,	//[3]
			sii_ncu_niuctag_ce_d,	//[2]
			sii_ncu_dmuctag_ue_d,	//[1]
			sii_ncu_niuctag_ue_d };	//[0]


	//bit 30,33,36,39 is guarantee to be 0 already//
assign	rasesr_in[42:0] = rasele[42:0] & raserr_in[42:0] ;

assign	rasesr_din[42:0] = creg_esr_wr ?(ncu_man_ucb_c2i_packet_data[42:0]|rasesr_in[42:0]) :
			rasesr2per_tgr ? rasesr_in[42:0] : (rasesr_in[42:0]|rasesr[42:0]) ;

//forcing bit30,33,36.39 to 0, flop is still there but no one can write
//into it -Jimmy 3/25/05
assign rasesr_n[42:0] = {rasesr_din[42:40],
			 1'b0,	//[39]
			 rasesr_din[38:37],
			 1'b0,	//[36]
			 rasesr_din[35:34],
			 1'b0,	//[33]
			 rasesr_din[32:31],
			 1'b0, 	//[30]
                         rasesr_din[29:25],
			 rasesr_din[24:0]};

//assign  ncu_dbg1_error_event = (|rasesr[42:0]) & wmr_vec_mask;
assign ncu_dbg1_error_event = (|rasesr[42:0]) & dbgtrigen;

ncu_ctrl_ctl_msff_ctl_macro__width_43 rasesr_ff 
				(
				.scan_in(rasesr_ff_scanin),
				.scan_out(rasesr_ff_scanout),
				.dout		(rasesr[42:0]),
				.l1clk		(l1clk), 
				.siclk		(aclk_wmr),
				.din		(rasesr_n[42:0]),
  .soclk(soclk)
				);

assign	rasesr_v_n = rasesr2per_tgr ? (|rasesr_in[42:0]) : (|{rasesr[42:0],rasesr_in[42:0]}) ;
ncu_ctrl_ctl_msff_ctl_macro__width_1 rasesr_v_ff 
				(
				.scan_in(rasesr_v_ff_scanin),
				.scan_out(rasesr_v_ff_scanout),
				.dout		(rasesr_v),
				.l1clk		(l1clk), 
				.siclk		(aclk_wmr),
				.din		(rasesr_v_n),
  .soclk(soclk)
				);


assign creg_esr [63:0] = { rasesr_v, 20'b0, rasesr[42:0]};


//////////////////////
//// ELE register ////
//////////////////////

assign	creg_ele_wr = ncu_man_ucb_buf_acpt_d2 &
			ncu_man_ucb_c2i_packet_is_wr_req & creg_ele_dec;

assign rasele_ff_in[42:0] = ~ncu_man_ucb_c2i_packet_data[42:0]; // add inverters, Jane  

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_43 rasele_ff  
				(
//				.dout		(rasele[42:0]),
				.scan_in(rasele_ff_scanin),
				.scan_out(rasele_ff_scanout),
				.dout		(rasele_ff_out[42:0]),
				.l1clk		(l1clk),
				.en		(creg_ele_wr),
//				.din		(ncu_man_ucb_c2i_packet_data[42:0])
				.din		(rasele_ff_in[42:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign rasele[42:0] = ~rasele_ff_out[42:0]; // add inverters, Jane

assign	creg_ele[63:0] = {21'b0,rasele[42:0]};

//// sii syndrome filtering ////
//assign	siierrsyn_va[5:0] = {6{siierrsyn_done}}&{siierrsyn[1],siierrsyn[5],siierrsyn[2],siierrsyn[4],siierrsyn[0],siierrsyn[3]};
assign	siierrsyn_va[5:0] = {6{siierrsyn_done}}&{siierrsyn[57],siierrsyn[61],siierrsyn[58],siierrsyn[60],siierrsyn[56],siierrsyn[59]};
assign	siierrsyn_vb[5:0] = siierrsyn_va[5:0]&siisynlog_en[5:0] ;
assign	siisynlog_en[5:0] = {rasele[7:4],rasele[1:0]};

assign	siietag[2:0] = 	siierrsyn_vb[0] ? 3'b000 :
			siierrsyn_vb[1] ? 3'b001 :
			siierrsyn_vb[2] ? 3'b100 :
			siierrsyn_vb[3] ? 3'b101 :
			siierrsyn_vb[4] ? 3'b110 : 3'b111 ;


//// ncu syndrome filtering ////
assign	ncuerrsyn_va[5:0]={rasper[22:21],rasper[19:17],rasper[14]};
// rasesr_in[22], rasesr_in[14] for format 2, rasesr_in[21] ~ [17] for format 1.

assign	ncuerrsyn_vb = |ncuerrsyn_va[5:0] ;


//////////////////////
//// EIE register ////
//////////////////////
assign	creg_eie_wr = ncu_man_ucb_buf_acpt_d2 &
			ncu_man_ucb_c2i_packet_is_wr_req & creg_eie_dec;
ncu_ctrl_ctl_msff_ctl_macro__en_1__width_43 raseie_ff  
				(
				.scan_in(raseie_ff_scanin),
				.scan_out(raseie_ff_scanout),
				.dout		(raseie[42:0]),
				.l1clk		(l1clk),
				.en		(creg_eie_wr),
				.din		(ncu_man_ucb_c2i_packet_data[42:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	creg_eie[63:0] = {21'b0,raseie[42:0]};

//////////////////////
//// EJR register ////
//////////////////////
assign	creg_ejr_wr = ncu_man_ucb_buf_acpt_d2 &
			ncu_man_ucb_c2i_packet_is_wr_req & creg_ejr_dec;
ncu_ctrl_ctl_msff_ctl_macro__en_1__width_43 rasejr_ff  
				(
				.scan_in(rasejr_ff_scanin),
				.scan_out(rasejr_ff_scanout),
				.dout		(rasejr[42:0]),
				.l1clk		(l1clk),
				.en		(creg_ejr_wr),
				.din		({ncu_man_ucb_c2i_packet_data[42:0]}),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ctrl_ctl_msff_ctl_macro__width_1 bit20_d1_ff 
                                (
                                .scan_in(bit20_d1_ff_scanin),
                                .scan_out(bit20_d1_ff_scanout),
                                .dout           (bit20_d1),
                                .l1clk          (l1clk),
                                .din            (rasejr[20]),
  .siclk(siclk),
  .soclk(soclk)
                                );
ncu_ctrl_ctl_msff_ctl_macro__width_1 bit20_d2_ff 
                                (
                                .scan_in(bit20_d2_ff_scanin),
                                .scan_out(bit20_d2_ff_scanout),
                                .dout           (bit20_d2),
                                .l1clk          (l1clk),
                                .din            (bit20_d1),
  .siclk(siclk),
  .soclk(soclk)
                                );
ncu_ctrl_ctl_msff_ctl_macro__width_1 bit20_d3_ff 
                                (
                                .scan_in(bit20_d3_ff_scanin),
                                .scan_out(bit20_d3_ff_scanout),
                                .dout           (bit20_d3),
                                .l1clk          (l1clk),
                                .din            (bit20_d2),
  .siclk(siclk),
  .soclk(soclk)
                                );
ncu_ctrl_ctl_msff_ctl_macro__width_1 bit20_d4_ff 
                                (
                                .scan_in(bit20_d4_ff_scanin),
                                .scan_out(bit20_d4_ff_scanout),
                                .dout           (bit20_d4),
                                .l1clk          (l1clk),
                                .din            (bit20_d3),
  .siclk(siclk),
  .soclk(soclk)
                                );
ncu_ctrl_ctl_msff_ctl_macro__width_1 bit20_d5_ff 
                                (
                                .scan_in(bit20_d5_ff_scanin),
                                .scan_out(bit20_d5_ff_scanout),
                                .dout           (bit20_d5),
                                .l1clk          (l1clk),
                                .din            (bit20_d4),
  .siclk(siclk),
  .soclk(soclk)
                                );

assign ncu_dmu_d_pei = ncu_dmu_d_pei_f & tcu_dbr_gateoff;
assign ncu_dmu_siicr_pei = ncu_dmu_siicr_pei_f & tcu_dbr_gateoff;
assign ncu_dmu_ctag_uei = ncu_dmu_ctag_uei_f & tcu_dbr_gateoff;
assign ncu_dmu_ctag_cei = ncu_dmu_ctag_cei_f & tcu_dbr_gateoff;
assign ncu_dmu_ncucr_pei = ncu_dmu_ncucr_pei_f & tcu_dbr_gateoff;
assign ncu_dmu_iei  = ncu_dmu_iei_f & tcu_dbr_gateoff;            
assign ncu_niu_ctag_cei = ncu_niu_ctag_cei_f & tcu_dbr_gateoff;
assign ncu_niu_ctag_uei = ncu_niu_ctag_uei_f & tcu_dbr_gateoff;
assign ncu_niu_d_pei =  ncu_niu_d_pei_f & tcu_dbr_gateoff;


assign	{
        dmu_cr_id_rtn_erri,
	ncu_mcu3_ecci,
	ncu_mcu3_fbri,
	ncu_mcu3_fbui,
	ncu_mcu2_ecci,
	ncu_mcu2_fbri,
	ncu_mcu2_fbui,
	ncu_mcu1_ecci,
	ncu_mcu1_fbri,
	ncu_mcu1_fbui,
	ncu_mcu0_ecci,
	ncu_mcu0_fbri,
	ncu_mcu0_fbui,
	ncu_niu_d_pei_f,
	ncu_niu_ctag_uei_f,
	ncu_niu_ctag_cei_f,
	ncu_sio_ctag_cei,
	ncu_sio_ctag_uei,
	ncu_sio_d_pei,
	  ncuctag_cei,
	  ncuctag_uei,
 	  dmubuf_pei,
 	  iobuf_uei,
 	  cpubuf_uei,
 	  cpubuf_pei,
 	  intman_pei,
 	  intbuf_uei,
 	  mondotbl_pei, //// 
 	  ncusiid_pei,  ////
	ncu_dmu_d_pei_f,
	ncu_dmu_siicr_pei_f,
	ncu_dmu_ctag_uei_f,
	ncu_dmu_ctag_cei_f,
	ncu_dmu_ncucr_pei_f,
	ncu_dmu_iei_f,
	ncu_sii_dmua_pei,
	ncu_sii_niud_pei,
	ncu_sii_dmud_pei,
	ncu_sii_niua_pei,
	ncu_sii_dmuctag_cei,
	ncu_sii_niuctag_cei,
	ncu_sii_dmuctag_uei,
	ncu_sii_niuctag_uei}  = {rasejr[42:21],bit20_d5,rasejr[19:0]};

assign	creg_ejr[63:0] = {21'b0,rasejr[42:0]};

//////////////////////
//// FEE register ////
//////////////////////

assign	creg_fee_wr = ncu_man_ucb_buf_acpt_d2 &
			ncu_man_ucb_c2i_packet_is_wr_req & creg_fee_dec;
ncu_ctrl_ctl_msff_ctl_macro__en_1__width_43 rasfee_ff  
				(
				.scan_in(rasfee_ff_scanin),
				.scan_out(rasfee_ff_scanout),
				.dout		(rasfee[42:0]),
				.l1clk		(l1clk),
				.en		(creg_fee_wr),
				.din		(ncu_man_ucb_c2i_packet_data[42:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign creg_fee[63:0] = {21'b0,rasfee[42:0]};

assign	ncu_rst_fatal_error_n = |(raserr_in[42:0]&rasfee[42:0]) ;
ncu_ctrl_ctl_msff_ctl_macro__width_1 ncu_rst_fatal_error_ff 
				(
				.scan_in(ncu_rst_fatal_error_ff_scanin),
				.scan_out(ncu_rst_fatal_error_ff_scanout),
				.dout		(ncu_rst_fatal_error),
				.l1clk		(l1clk),
				.din		(ncu_rst_fatal_error_n),
  .siclk(siclk),
  .soclk(soclk)
				);

//////////////////////
//// PER register ////
//////////////////////

assign	creg_per_wr = ncu_man_ucb_buf_acpt_d2 &
			ncu_man_ucb_c2i_packet_is_wr_req & creg_per_dec;

assign	rasper_in[42:0] = rasesr[42:0] & raseie[42:0] ;
assign	rasper_in_v = (|rasper_in[42:0]) & rasesr_v ;
assign	rasper_n[42:0] = creg_per_wr ? ncu_man_ucb_c2i_packet_data[42:0] : rasper_in[42:0] ;
ncu_ctrl_ctl_msff_ctl_macro__en_1__width_43 rasper_ff  
				(
				.scan_in(rasper_ff_scanin),
				.scan_out(rasper_ff_scanout),
				.dout		(rasper[42:0]),
				.l1clk		(l1clk), 
				.siclk		(aclk_wmr),
				.en		(creg_per_wr|(~rasper_v)),
				.din		(rasper_n[42:0]),
  .soclk(soclk)
				);

assign	rasper_v_n = creg_per_wr ? ncu_man_ucb_c2i_packet_data[63] : rasper_in_v ;
ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 rasper_v_ff  
				(
				.scan_in(rasper_v_ff_scanin),
				.scan_out(rasper_v_ff_scanout),
				.dout		(rasper_v),
				.l1clk		(l1clk), 
				.siclk		(aclk_wmr),
				.en		(creg_per_wr|(~rasper_v)),
				.din		(rasper_v_n),
  .soclk(soclk)
				);

assign	rasesr2per_tgr = (rasper_in_v&~rasper_v);

assign	rasper_ipg_n = rasper_srvc ? 1'b0 : rasesr2per_tgr|rasper_ipg ;
ncu_ctrl_ctl_msff_ctl_macro__width_1 rasper_ipg_ff 
				(
				.scan_in(rasper_ipg_ff_scanin),
				.scan_out(rasper_ipg_ff_scanout),
				.dout		(rasper_ipg),
				.l1clk		(l1clk),
				.din		(rasper_ipg_n),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ctrl_ctl_msff_ctl_macro__width_1 rasesr2per_tgr_d_ff 
				(
				.scan_in(rasesr2per_tgr_d_ff_scanin),
				.scan_out(rasesr2per_tgr_d_ff_scanout),
				.dout		(rasesr2per_tgr_d),
				.l1clk		(l1clk),
				.din		(rasesr2per_tgr),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	rasper_srvc = ~ncu_man_int_buf_full & ~intvecdisp_int_wr & rasper_ipg ;
// assert when there is a soc error packet generated for core.

assign	rasper_int_wr = rasper_srvc;

ncu_ctrl_ctl_msff_ctl_macro__width_1 ncu_tcu_soc_error_ff 
				(
				.scan_in(ncu_tcu_soc_error_ff_scanin),
				.scan_out(ncu_tcu_soc_error_ff_scanout),
				.dout		(ncu_tcu_soc_error),
				.l1clk		(l1clk),
				.din		(rasper_srvc),
  .siclk(siclk),
  .soclk(soclk)
				);


assign raserrce = rasper[41] | rasper[38] | rasper[35] | rasper[32] | rasper[27] |
		  rasper[26] | rasper[23] | rasper[10] | rasper[3] | rasper[2] |
		  rasper[31] | rasper[34] | rasper[40] | rasper[37];	 
		  // correctable error
assign raserrue = rasper[25] | rasper[28] | rasper[11] | rasper[1] | rasper[0] |
		  rasper[4] | rasper[5] | rasper[6] | rasper[7] | rasper[8] |
                  rasper[9] | rasper[12] | rasper[13] | rasper[14] | rasper[15] |
                  rasper[16] | rasper[17] | rasper[18] | rasper[19] | rasper[20] |
                  rasper[21] | rasper[22] | rasper[24] | rasper[29] | rasper[42]; 
		  // uncorrectable error
		  // all raserr bits are grouped as correctable or uncorrectable except,
		  // bit 39, 36, 33 and 30, which are Fbdimm uncrecoverable.

assign ucb_soc_int_type[3:0] = raserrue ?  `UCB_INT_SOC_UE : `UCB_INT_SOC_CE ;


assign rasper_int_pkt[24:0] = {////7'b0,       //reserved
                              6'b00_0000,     //dummy intvec
                              ////32'b0,      //reserved
                              9'b0,   //dummy dev_id
                              //  ras_cpuid[2:0],3'b0,
			      ras_err_steering[5:0],
                              ucb_soc_int_type[3:0] } ;





assign	creg_per[63:0] = {rasper_v,20'b0,rasper[42:0]};


/////////////////////////
//// SIISYN register ////
/////////////////////////

assign	creg_siisyn_wr = ncu_man_ucb_buf_acpt_d2 &
			ncu_man_ucb_c2i_packet_is_wr_req & creg_siisyn_dec;

assign	siisyn_n[58:0] = creg_siisyn_wr ? { ncu_man_ucb_c2i_packet_data[58:0]} : {siietag[2:0],siierrsyn[55:0]} ;
//assign	siisyn_n[58:0] = creg_siisyn_wr ? { ncu_man_ucb_c2i_packet_data[58:0]} : {siietag[2:0],siierrsyn[63:8]} ;


assign	siierrsyn_vc = ~siisyn_v & (|siierrsyn_vb[5:0]);
ncu_ctrl_ctl_msff_ctl_macro__en_1__width_59 siisyn_ff  
				(
				.scan_in(siisyn_ff_scanin),
				.scan_out(siisyn_ff_scanout),
				.dout		(siisyn[58:0]),
				.l1clk		(l1clk), 
				.siclk		(aclk_wmr),
				.en		(siierrsyn_vc|creg_siisyn_wr),
				.din		(siisyn_n[58:0]),
  .soclk(soclk)
				);

assign	siisyn_v_n = creg_siisyn_wr ?  ncu_man_ucb_c2i_packet_data[63] : 1'b1 ;

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 siisyn_v_ff  
				(
				.scan_in(siisyn_v_ff_scanin),
				.scan_out(siisyn_v_ff_scanout),
				.dout		(siisyn_v),
				.l1clk		(l1clk), 
				.siclk		(aclk_wmr),
				.en		(siierrsyn_vc|creg_siisyn_wr),
				.din		(siisyn_v_n),
  .soclk(soclk)
				);

assign	creg_siisyn[63:0] = {siisyn_v,4'b0,siisyn[58:0]};


/////////////////////////
//// NCUSYN register ////
/////////////////////////


assign	creg_ncusyn_wr = ncu_man_ucb_buf_acpt_d2 &
			ncu_man_ucb_c2i_packet_is_wr_req & creg_ncusyn_dec;
		
assign	creg_ncu_scksel_wr = ncu_man_ucb_buf_acpt_d2 &
			ncu_man_ucb_c2i_packet_is_wr_req & creg_ncu_scksel_dec;

assign	creg_dbgtrigen_wr = ncu_man_ucb_buf_acpt_d2 &
			ncu_man_ucb_c2i_packet_is_wr_req & creg_dbgtrigen_dec;		

assign  intmansyn_n[54:0] =  c2i_rd_intman ? 
				//rtcp  ,rqtyp, cputhr 				,pa
				{4'b1111,5'b0,ncu_man_ucb_c2i_packet_cputhr[5:0],ncu_man_ucb_c2i_packet_addr[39:0]}:
				{4'b0110,5'b0,intman_ct_dout[5:0]		,40'b0};



//assign 	ncuerrsyn[60:0] =  ncuerrsyn_va[4]   ? {1'b0,4'b1111,ncu_etag[4:0], dmubufsyn[46:36],`DMU_PIO,dmubufsyn[35:0]} :
//			   //ncuerrsyn_va[1]   ? {5'b0_0110,ncu_etag[4:0], 5'b0,intmansyn[5:0],40'b0} :
//			   ncuerrsyn_va[1]   ? {1'b0,intmansyn[54:51],ncu_etag[4:0],intmansyn[50:0] } :
//	   (ncuerrsyn_va[5]|ncuerrsyn_va[0]) ? {1'b1,4'b0000,ncu_etag[4:0],5'b0,6'b0,24'b0,ncudpsyn[15:0]} : //f2
//			   		       {1'b0,4'b1111,ncu_etag[4:0],cpubufsyn[50:0]} ; //for [2],[3]

assign ncuerrsyn[60:0] = ncuerrsyn_va[4] ? {1'b0,4'b1110,ncu_etag[4:0], dmubufsyn[46:36],`DMU_PIO,dmubufsyn[35:0]} :
                         ncuerrsyn_va[1] ? {1'b0,intmansyn[54:51],ncu_etag[4:0],intmansyn[50:0] } :
         (ncuerrsyn_va[5]|ncuerrsyn_va[0]) ? {1'b1,4'b0000,ncu_etag[4:0],5'b0,6'b0,24'b0,ncudpsyn[15:0]} : 
                          ncuerrsyn_va[3]  ? {1'b0,4'b1001,ncu_etag[4:0],cpubufsyn[50:46],6'b0,cpubufsyn[39:0]} : //for [3]
		  			     {1'b0,4'b0110,ncu_etag[4:0],5'b0,cpubufsyn[45:40],40'b0} ; //for [2]
// ncuerrsyn_va[4] is set, RCTP has to be 4'b1110, since we use offset and PA is not available.

assign	ncusyn_n[60:0] = creg_ncusyn_wr ? 
				{ncu_man_ucb_c2i_packet_data[62:58],
				 ncu_man_ucb_c2i_packet_data[55:0]} : ncuerrsyn[60:0] ;

assign	ncuerrsyn_vc = ~ncusyn_v & ncuerrsyn_vb & rasesr2per_tgr_d ;

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_61 ncusyn_ff  
				(
				.scan_in(ncusyn_ff_scanin),
				.scan_out(ncusyn_ff_scanout),
				.dout		(ncusyn[60:0]),
				.l1clk		(l1clk), 
				.siclk		(aclk_wmr),
				.en		(ncuerrsyn_vc|creg_ncusyn_wr),
				.din		(ncusyn_n[60:0]),
  .soclk(soclk)
				);

assign	ncusyn_v_n = creg_ncusyn_wr ? ncu_man_ucb_c2i_packet_data[63] : 1'b1 ;
ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 ncusyn_v_ff  
				(
				.scan_in(ncusyn_v_ff_scanin),
				.scan_out(ncusyn_v_ff_scanout),
				.dout		(ncusyn_v),
				.l1clk		(l1clk), 
				.siclk		(aclk_wmr),
				.en		(ncuerrsyn_vc|creg_ncusyn_wr),
				.din		(ncusyn_v_n),
  .soclk(soclk)
				);


assign ncu_scksel_n[1:0] = creg_ncu_scksel_wr ? ncu_man_ucb_c2i_packet_data[1:0] : ncu_scksel[1:0];
ncu_ctrl_ctl_msff_ctl_macro__width_2 ncu_scksel_ff 
				(
				.scan_in(ncu_scksel_ff_scanin),
				.scan_out(ncu_scksel_ff_scanout),
				.dout		(ncu_scksel[1:0]),
				.l1clk		(l1clk), 
				.siclk		(aclk_wmr),
				.din		(ncu_scksel_n[1:0]),
  .soclk(soclk)
				);
assign creg_ncu_scksel[63:0] = {62'b0,	ncu_scksel[1:0]};		

ncu_ctrl_ctl_msff_ctl_macro__en_1__width_2 scksel_sh_ff  
				(
				.scan_in(scksel_sh_ff_scanin),
				.scan_out(scksel_sh_ff_scanout),
				.dout		(ncu_scksel_sh[1:0]),
				.l1clk		(l1clk), 
				.siclk		(aclk_wmr),
				.en		(wmr_upd_en),
				.din		(ncu_scksel[1:0]),
  .soclk(soclk)
				);

assign dbgtrigen_n = creg_dbgtrigen_wr ? ncu_man_ucb_c2i_packet_data[0] : dbgtrigen;
ncu_ctrl_ctl_msff_ctl_macro__width_1 dbgtrigen_ff 
				(
				.scan_in(dbgtrigen_ff_scanin),
				.scan_out(dbgtrigen_ff_scanout),
				.dout		(dbgtrigen),
				.l1clk		(l1clk), 
				.siclk		(aclk_wmr),
				.din		(dbgtrigen_n),
  .soclk(soclk)
				);
assign creg_dbgtrigen[63:0] = {63'b0, dbgtrigen};

assign  ncu_etag[4:0] =  ncuerrsyn_va[0] ? 5'b01110 : // ESR[14]
			 ncuerrsyn_va[1] ? 5'b10001 : // ESR[17]
                         ncuerrsyn_va[2] ? 5'b10010 : // ESR[18]
                         ncuerrsyn_va[3] ? 5'b10011 : // ESR[19]
                         ncuerrsyn_va[4] ? 5'b10101 : // ESR[21]
			 ncuerrsyn_va[5] ? 5'b10110 : 5'b0 ; // ESR[22] 


assign        creg_ncusyn[63:0] = {ncusyn_v,ncusyn[60:56],2'b0,ncusyn[55:0]};
//assign        creg_ncusyn[63:0] = {ncusyn_v,ncusyn[55:51],2'b0,ncu_etag[4:0],ncusyn[50:0]};


/**** adding clock header ****/
ncu_ctrl_ctl_l1clkhdr_ctl_macro clkgen (
				.l2clk	(iol2clk),
				.l1en	(1'b1),
				.l1clk	(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
				);


/*** building tcu port ***/
assign	siclk = tcu_aclk;
assign	soclk = tcu_bclk;
assign	   se = tcu_scan_en;
assign	pce_ov = tcu_pce_ov;
assign	stop = tcu_clk_stop;


//// starting warm reset protected scanchain -jimmy 4/3/05 ////
assign sernum0_ff_scanin         = scan_in;
assign sernum1_ff_scanin         = sernum0_ff_scanout ;
assign sernum2_ff_scanin         = sernum1_ff_scanout ;
assign fusestat_ff_scanin        = sernum2_ff_scanout ;
assign coreavail_ff_scanin       = fusestat_ff_scanout ;
assign bankavail_ff_scanin       = coreavail_ff_scanout ;
assign asi_cmp_tick_enable_ff_scanin = bankavail_ff_scanout ;
assign asi_ras_err_steering_ff_scanin = asi_cmp_tick_enable_ff_scanout ;
assign core_enable_ff_scanin     = asi_ras_err_steering_ff_scanout ;
assign bank_en_ff_scanin         = core_enable_ff_scanout ;
assign l2idxhs_en_ff_scanin      = bank_en_ff_scanout ;
assign rasesr_ff_scanin          = l2idxhs_en_ff_scanout ;
assign rasesr_v_ff_scanin        = rasesr_ff_scanout ;
assign rasper_ff_scanin          = rasesr_v_ff_scanout ;
assign rasper_v_ff_scanin        = rasper_ff_scanout ;
assign siisyn_ff_scanin          = rasper_v_ff_scanout ;
assign siisyn_v_ff_scanin        = siisyn_ff_scanout ;
assign ncusyn_ff_scanin          = siisyn_v_ff_scanout ;
assign asi_wmr_vec_mask_ff_scanin = ncusyn_ff_scanout;
assign ncu_scksel_ff_scanin      = asi_wmr_vec_mask_ff_scanout ;
assign dbgtrigen_ff_scanin       = ncu_scksel_ff_scanout;
assign scksel_sh_ff_scanin	 = dbgtrigen_ff_scanout;
assign wmr_protect_d2_ff_scanin	 = scksel_sh_ff_scanout;
assign wmr_protect_d1_ff_scanin	 = wmr_protect_d2_ff_scanout;
assign ncusyn_v_ff_scanin        = wmr_protect_d1_ff_scanout ;
assign wmrp_chain_scanout = ~(wmr_protect | ~ncusyn_v_ff_scanout) ;

// fixscan start:
//assign ncu_man_ucb_buf_acpt_d1_ff_scanin = scan_in                  ;
assign ncu_man_ucb_buf_acpt_d1_ff_scanin = wmrp_chain_scanout ;
assign ncu_man_ucb_buf_acpt_d2_ff_scanin = ncu_man_ucb_buf_acpt_d1_ff_scanout;
assign ncu_man_ucb_buf_acpt_d3_ff_scanin = ncu_man_ucb_buf_acpt_d2_ff_scanout;
assign ncu_man_ucb_c2i_packet_data_ff_scanin = ncu_man_ucb_buf_acpt_d3_ff_scanout;
assign ncu_man_ucb_c2i_packet_addr_ff_scanin = ncu_man_ucb_c2i_packet_data_ff_scanout;
assign ncu_man_ucb_c2i_packet_buf_id_ff_scanin = ncu_man_ucb_c2i_packet_addr_ff_scanout;
assign ncu_man_ucb_c2i_packet_cputhr_ff_scanin = ncu_man_ucb_c2i_packet_buf_id_ff_scanout;
assign ncu_man_ucb_c2i_packet_is_rd_req_ff_scanin = ncu_man_ucb_c2i_packet_cputhr_ff_scanout;
assign ncu_man_ucb_c2i_packet_is_wr_req_ff_scanin = ncu_man_ucb_c2i_packet_is_rd_req_ff_scanout;
assign aa_buf1_older_ff_scanin   = ncu_man_ucb_c2i_packet_is_wr_req_ff_scanout;
assign aa_buf0_vld_ff_scanin     = aa_buf1_older_ff_scanout ;
assign aa_buf1_vld_ff_scanin     = aa_buf0_vld_ff_scanout   ;
assign aa_buf0_obj_ff_scanin     = aa_buf1_vld_ff_scanout   ;
assign aa_buf1_obj_ff_scanin     = aa_buf0_obj_ff_scanout   ;
assign bb_buf1_older_ff_scanin   = aa_buf1_obj_ff_scanout   ;
assign bb_buf0_vld_ff_scanin     = bb_buf1_older_ff_scanout ;
assign bb_buf1_vld_ff_scanin     = bb_buf0_vld_ff_scanout   ;
assign bb_buf0_obj_ff_scanin     = bb_buf1_vld_ff_scanout   ;
assign bb_buf1_obj_ff_scanin     = bb_buf0_obj_ff_scanout   ;
assign intman_pe_ff_scanin       = bb_buf1_obj_ff_scanout   ;
assign intmansyn_ff_scanin       = intman_pe_ff_scanout     ;
assign fuse_data_d1_ff_scanin    = intmansyn_ff_scanout  ;
assign coreavail_dshift_d1_ff_scanin = fuse_data_d1_ff_scanout  ;
assign coreavail_dshift_d2_ff_scanin = coreavail_dshift_d1_ff_scanout;
assign bankavail_dshift_d1_ff_scanin = coreavail_dshift_d2_ff_scanout;
assign bankavail_dshift_d2_ff_scanin = bankavail_dshift_d1_ff_scanout;
assign fuse_stat_dshift_d1_ff_scanin = bankavail_dshift_d2_ff_scanout;
assign sernum0_dshift_d1_ff_scanin = fuse_stat_dshift_d1_ff_scanout;
assign sernum1_dshift_d1_ff_scanin = sernum0_dshift_d1_ff_scanout;
assign sernum2_dshift_d1_ff_scanin = sernum1_dshift_d1_ff_scanout;
////assign creg_mondoinvec_ff_scanin = bankavail_ff_scanout     ;
assign creg_mondoinvec_ff_scanin = sernum2_dshift_d1_ff_scanout;
assign creg_mem32_en_ff_scanin   = creg_mondoinvec_ff_scanout;
assign creg_mem32_base_ff_scanin = creg_mem32_en_ff_scanout ;
assign creg_mem32_mask_ff_scanin = creg_mem32_base_ff_scanout;
assign creg_mem64_en_ff_scanin   = creg_mem32_mask_ff_scanout;
assign creg_mem64_base_ff_scanin = creg_mem64_en_ff_scanout ;
assign creg_mem64_mask_ff_scanin = creg_mem64_base_ff_scanout;
assign creg_iocon_en_ff_scanin   = creg_mem64_mask_ff_scanout;
assign creg_iocon_base_ff_scanin = creg_iocon_en_ff_scanout ;
assign creg_iocon_mask_ff_scanin = creg_iocon_base_ff_scanout;
assign creg_mmufsh_ff_scanin     = creg_iocon_mask_ff_scanout;
assign mmufsh_vld_ff_scanin      = creg_mmufsh_ff_scanout   ;
//assign asi_wmr_vec_mask_ff_scanin = mmufsh_vld_ff_scanout    ;
////assign tap_mondo_acc_addr_39_16_ff_scanin = asi_ras_err_steering_ff_scanout;
assign tap_mondo_acc_addr_39_16_ff_scanin = mmufsh_vld_ff_scanout;
assign tap_mondo_acc_addr_s_ff_scanin = tap_mondo_acc_addr_39_16_ff_scanout;
assign tap_mondo_din_s_ff_scanin = tap_mondo_acc_addr_s_ff_scanout;
assign ncu_int_ucb_c2i_packet_is_rd_req_ff_scanin = tap_mondo_din_s_ff_scanout;
assign ncu_int_ucb_c2i_packet_is_wr_req_ff_scanin = ncu_int_ucb_c2i_packet_is_rd_req_ff_scanout;
assign tap_mondo_acc_seq_ff_scanin = ncu_int_ucb_c2i_packet_is_wr_req_ff_scanout;
assign tap_mondo_acc_addr_invld_d2_ff_scanin = tap_mondo_acc_seq_ff_scanout;
assign tap_mondo_acc_seq_d2_ff_scanin = tap_mondo_acc_addr_invld_d2_ff_scanout;
assign tap_mondo_dout_d2_ff_scanin = tap_mondo_acc_seq_d2_ff_scanout;
assign tap_mondo_acc_outstanding_d1_ff_scanin = tap_mondo_dout_d2_ff_scanout;
assign ncu_int_ack_packet_ff_scanin = tap_mondo_acc_outstanding_d1_ff_scanout;
assign ncu_int_ack_vld_ff_scanin = ncu_int_ack_packet_ff_scanout;
assign cc_buf1_older_ff_scanin   = ncu_int_ack_vld_ff_scanout;
assign cc_buf0_vld_ff_scanin     = cc_buf1_older_ff_scanout ;
assign cc_buf1_vld_ff_scanin     = cc_buf0_vld_ff_scanout   ;
assign cc_buf0_obj_ff_scanin     = cc_buf1_vld_ff_scanout   ;
assign cc_buf1_obj_ff_scanin     = cc_buf0_obj_ff_scanout   ;
assign dd_buf1_older_ff_scanin   = cc_buf1_obj_ff_scanout   ;
assign dd_buf0_vld_ff_scanin     = dd_buf1_older_ff_scanout ;
assign dd_buf1_vld_ff_scanin     = dd_buf0_vld_ff_scanout   ;
assign dd_buf0_obj_ff_scanin     = dd_buf1_vld_ff_scanout   ;
assign dd_buf1_obj_ff_scanin     = dd_buf0_obj_ff_scanout   ;
//assign wmr_counter_ff_scanin     = dd_buf1_obj_ff_scanout   ;
//assign core_enable_status_ff_scanin = core_enable_ff_scanout   ;
assign core_enable_status7_ff_scanin = dd_buf1_obj_ff_scanout   ;
assign core_enable_status6_ff_scanin =  core_enable_status7_ff_scanout;
assign core_enable_status5_ff_scanin =  core_enable_status6_ff_scanout;
assign core_enable_status4_ff_scanin =  core_enable_status5_ff_scanout;
assign core_enable_status3_ff_scanin =  core_enable_status4_ff_scanout;
assign core_enable_status2_ff_scanin =  core_enable_status3_ff_scanout;
assign core_enable_status1_ff_scanin =  core_enable_status2_ff_scanout;
assign core_enable_status0_ff_scanin =  core_enable_status1_ff_scanout;
//assign cmp_freeze_ff_scanin = core_enable_status_ff_scanout;
assign coreavail_done_d1_ff_scanin = core_enable_status0_ff_scanout;
assign xir_steering_ff_scanin    = coreavail_done_d1_ff_scanout;
assign xir_trigger_ff_scanin     = xir_steering_ff_scanout  ;
assign xir_trigger_d0_ff_scanin  = xir_trigger_ff_scanout   ;
assign xir_trigger_d1_ff_scanin  = xir_trigger_d0_ff_scanout;
assign xir_snapd_vec_ff_scanin   = xir_trigger_d1_ff_scanout;
assign xir_mini_vec_ff_scanin    = xir_snapd_vec_ff_scanout ;
assign xir_cpuid_ff_scanin       = xir_mini_vec_ff_scanout  ;
assign xir_busy_ff_scanin        = xir_cpuid_ff_scanout     ;
assign xir_busy_d1_ff_scanin     = xir_busy_ff_scanout      ;
assign ncu_rst_xir_done_ff_scanin = xir_busy_d1_ff_scanout   ;
assign core_running_ff_scanin    = ncu_rst_xir_done_ff_scanout;
assign core_running0_ff_scanin    = core_running_ff_scanout;
assign unpark_thread_d1_ff_scanin = core_running0_ff_scanout  ;
assign unpark_thread_d2_ff_scanin = unpark_thread_d1_ff_scanout;
assign wake_ok__ff_scanin        = unpark_thread_d2_ff_scanout;
assign wake_thread_ff_scanin     = wake_ok__ff_scanout      ;
assign core_running_status_ff_scanin = wake_thread_ff_scanout   ;
assign core_running_status0_ff_scanin    = core_running_status_ff_scanout       ;
assign l2pm_preview_ff_scanin    = core_running_status0_ff_scanout;
assign l2pm_ff_scanin            = l2pm_preview_ff_scanout  ;
////assign l2idxhs_en_status_ff_scanin = l2idxhs_en_ff_scanout    ;
assign l2idxhs_en_status_ff_scanin = l2pm_ff_scanout          ;
assign iobuf_ue_ff_scanin        = l2idxhs_en_status_ff_scanout;
assign intbuf_ue_ff_scanin       = iobuf_ue_ff_scanout      ;
assign mondotbl_pe_ff_scanin     = intbuf_ue_ff_scanout     ;
assign mcu3_ncu_ecc_d_ff_scanin  = mondotbl_pe_ff_scanout   ;
assign mcu3_ncu_fbr_d_ff_scanin  = mcu3_ncu_ecc_d_ff_scanout;
assign mcu3_ncu_fbu_d_ff_scanin  = mcu3_ncu_fbr_d_ff_scanout;
assign mcu2_ncu_ecc_d_ff_scanin  = mcu3_ncu_fbu_d_ff_scanout;
assign mcu2_ncu_fbr_d_ff_scanin  = mcu2_ncu_ecc_d_ff_scanout;
assign mcu2_ncu_fbu_d_ff_scanin  = mcu2_ncu_fbr_d_ff_scanout;
assign mcu1_ncu_ecc_d_ff_scanin  = mcu2_ncu_fbu_d_ff_scanout;
assign mcu1_ncu_fbr_d_ff_scanin  = mcu1_ncu_ecc_d_ff_scanout;
assign mcu1_ncu_fbu_d_ff_scanin  = mcu1_ncu_fbr_d_ff_scanout;
assign mcu0_ncu_ecc_d_ff_scanin  = mcu1_ncu_fbu_d_ff_scanout;
assign mcu0_ncu_fbr_d_ff_scanin  = mcu0_ncu_ecc_d_ff_scanout;
assign mcu0_ncu_fbu_d_ff_scanin  = mcu0_ncu_fbr_d_ff_scanout;
assign niu_ncu_d_pe_d_ff_scanin  = mcu0_ncu_fbu_d_ff_scanout;
assign niu_ncu_ctag_ue_d_ff_scanin = niu_ncu_d_pe_d_ff_scanout;
assign niu_ncu_ctag_ce_d_ff_scanin = niu_ncu_ctag_ue_d_ff_scanout;
assign sio_ncu_ctag_ce_d_ff_scanin = niu_ncu_ctag_ce_d_ff_scanout;
assign sio_ncu_ctag_ue_d_ff_scanin = sio_ncu_ctag_ce_d_ff_scanout;
//assign sio_ncu_d_pe_d_ff_scanin  = sio_ncu_ctag_ue_d_ff_scanout;
assign dmu_ncu_d_pe_d_ff_scanin  = sio_ncu_ctag_ue_d_ff_scanout;
assign dmu_ncu_siicr_pe_d_ff_scanin = dmu_ncu_d_pe_d_ff_scanout;
assign dmu_ncu_ctag_ue_d_ff_scanin = dmu_ncu_siicr_pe_d_ff_scanout;
assign dmu_ncu_ctag_ce_d_ff_scanin = dmu_ncu_ctag_ue_d_ff_scanout;
assign dmu_ncu_ncucr_pe_d_ff_scanin = dmu_ncu_ctag_ce_d_ff_scanout;
assign dmu_ncu_ie_d_ff_scanin    = dmu_ncu_ncucr_pe_d_ff_scanout;
assign sii_ncu_dmua_pe_d_ff_scanin = dmu_ncu_ie_d_ff_scanout  ;
assign sii_ncu_niud_pe_d_ff_scanin = sii_ncu_dmua_pe_d_ff_scanout;
assign sii_ncu_dmud_pe_d_ff_scanin = sii_ncu_niud_pe_d_ff_scanout;
assign sii_ncu_niua_pe_d_ff_scanin = sii_ncu_dmud_pe_d_ff_scanout;
assign sii_ncu_dmuctag_ce_d_ff_scanin = sii_ncu_niua_pe_d_ff_scanout;
assign sii_ncu_niuctag_ce_d_ff_scanin = sii_ncu_dmuctag_ce_d_ff_scanout;
assign sii_ncu_dmuctag_ue_d_ff_scanin = sii_ncu_niuctag_ce_d_ff_scanout;
assign sii_ncu_niuctag_ue_d_ff_scanin = sii_ncu_dmuctag_ue_d_ff_scanout;
//assign rasele_ff_scanin          = rasesr_v_ff_scanout      ;
assign rasele_ff_scanin          = sii_ncu_niuctag_ue_d_ff_scanout;
assign raseie_ff_scanin          = rasele_ff_scanout        ;
assign rasejr_ff_scanin          = raseie_ff_scanout        ;
assign bit20_d1_ff_scanin	 = rasejr_ff_scanout        ;
assign bit20_d2_ff_scanin	 = bit20_d1_ff_scanout	;
assign bit20_d3_ff_scanin	 = bit20_d2_ff_scanout	;
assign bit20_d4_ff_scanin	 = bit20_d3_ff_scanout	;
assign bit20_d5_ff_scanin	 = bit20_d4_ff_scanout	;
assign rasfee_ff_scanin          = bit20_d5_ff_scanout        ;
assign ncu_rst_fatal_error_ff_scanin = rasfee_ff_scanout        ;
assign por_upd_en_ff_scanin      = ncu_rst_fatal_error_ff_scanout        ;
//assign tcu_aclk_d2_ff_scanin     = por_upd_en_ff_scanout;
assign rasper_ipg_ff_scanin      = por_upd_en_ff_scanout;
assign rasesr2per_tgr_d_ff_scanin = rasper_ipg_ff_scanout    ;
assign ncu_tcu_soc_error_ff_scanin = rasesr2per_tgr_d_ff_scanout ;
////assign scan_out                  = ncusyn_v_ff_scanout ;
assign scan_out                  = ncu_tcu_soc_error_ff_scanout;
// fixscan end:



endmodule // iobdg_ctrl
// Local Variables:
// verilog-auto-sense-defines-constant:t
// End:











// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msff_ctl_macro__width_1 (
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

module ncu_ctrl_ctl_msff_ctl_macro__en_1__width_64 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [63:0] fdin;
wire [62:0] so;

  input [63:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [63:0] dout;
  output scan_out;
assign fdin[63:0] = (din[63:0] & {64{en}}) | (dout[63:0] & ~{64{en}});






dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msff_ctl_macro__en_1__width_40 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [39:0] fdin;
wire [38:0] so;

  input [39:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [39:0] dout;
  output scan_out;
assign fdin[39:0] = (din[39:0] & {40{en}}) | (dout[39:0] & ~{40{en}});






dff #(40)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[39:0]),
.si({scan_in,so[38:0]}),
.so({so[38:0],scan_out}),
.q(dout[39:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msff_ctl_macro__en_1__width_2 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = (din[1:0] & {2{en}}) | (dout[1:0] & ~{2{en}});






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

module ncu_ctrl_ctl_msff_ctl_macro__en_1__width_6 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = (din[5:0] & {6{en}}) | (dout[5:0] & ~{6{en}});






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msff_ctl_macro__en_1__width_1 (
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

module ncu_ctrl_ctl_msff_ctl_macro__en_1__width_25 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [24:0] fdin;
wire [23:0] so;

  input [24:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [24:0] dout;
  output scan_out;
assign fdin[24:0] = (din[24:0] & {25{en}}) | (dout[24:0] & ~{25{en}});






dff #(25)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[24:0]),
.si({scan_in,so[23:0]}),
.so({so[23:0],scan_out}),
.q(dout[24:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msff_ctl_macro__en_1__width_128 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [127:0] fdin;
wire [126:0] so;

  input [127:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [127:0] dout;
  output scan_out;
assign fdin[127:0] = (din[127:0] & {128{en}}) | (dout[127:0] & ~{128{en}});






dff #(128)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[127:0]),
.si({scan_in,so[126:0]}),
.so({so[126:0],scan_out}),
.q(dout[127:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msff_ctl_macro__en_1__width_55 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [54:0] fdin;
wire [53:0] so;

  input [54:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [54:0] dout;
  output scan_out;
assign fdin[54:0] = (din[54:0] & {55{en}}) | (dout[54:0] & ~{55{en}});






dff #(55)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[54:0]),
.si({scan_in,so[53:0]}),
.so({so[53:0],scan_out}),
.q(dout[54:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msff_ctl_macro__en_1__width_22 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [21:0] fdin;
wire [20:0] so;

  input [21:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [21:0] dout;
  output scan_out;
assign fdin[21:0] = (din[21:0] & {22{en}}) | (dout[21:0] & ~{22{en}});






dff #(22)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[21:0]),
.si({scan_in,so[20:0]}),
.so({so[20:0],scan_out}),
.q(dout[21:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msff_ctl_macro__en_1__width_20 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [19:0] fdin;
wire [18:0] so;

  input [19:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [19:0] dout;
  output scan_out;
assign fdin[19:0] = (din[19:0] & {20{en}}) | (dout[19:0] & ~{20{en}});






dff #(20)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[19:0]),
.si({scan_in,so[18:0]}),
.so({so[18:0],scan_out}),
.q(dout[19:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msff_ctl_macro__en_1__width_8 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = (din[7:0] & {8{en}}) | (dout[7:0] & ~{8{en}});






dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msff_ctl_macro__en_1__width_12 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [11:0] fdin;
wire [10:0] so;

  input [11:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [11:0] dout;
  output scan_out;
assign fdin[11:0] = (din[11:0] & {12{en}}) | (dout[11:0] & ~{12{en}});






dff #(12)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[11:0]),
.si({scan_in,so[10:0]}),
.so({so[10:0],scan_out}),
.q(dout[11:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msff_ctl_macro__width_6 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = din[5:0];






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msff_ctl_macro__en_1__width_24 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [23:0] fdin;
wire [22:0] so;

  input [23:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [23:0] dout;
  output scan_out;
assign fdin[23:0] = (din[23:0] & {24{en}}) | (dout[23:0] & ~{24{en}});






dff #(24)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[23:0]),
.si({scan_in,so[22:0]}),
.so({so[22:0],scan_out}),
.q(dout[23:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msff_ctl_macro__width_64 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [63:0] fdin;
wire [62:0] so;

  input [63:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [63:0] dout;
  output scan_out;
assign fdin[63:0] = din[63:0];






dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msff_ctl_macro__width_8 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = din[7:0];






dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msffi_ctl_macro__width_1 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  q_l, 
  scan_out);
  input [0:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] q_l;
  output scan_out;






msffi #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(din[0:0]),
.si(scan_in),
.so(scan_out),
.q_l(q_l[0:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msff_ctl_macro__width_56 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [55:0] fdin;
wire [54:0] so;

  input [55:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [55:0] dout;
  output scan_out;
assign fdin[55:0] = din[55:0];






dff #(56)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[55:0]),
.si({scan_in,so[54:0]}),
.so({so[54:0],scan_out}),
.q(dout[55:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msff_ctl_macro__en_1__width_3 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = (din[2:0] & {3{en}}) | (dout[2:0] & ~{3{en}});






dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msff_ctl_macro__width_63 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [62:0] fdin;
wire [61:0] so;

  input [62:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [62:0] dout;
  output scan_out;
assign fdin[62:0] = din[62:0];






dff #(63)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[62:0]),
.si({scan_in,so[61:0]}),
.so({so[61:0],scan_out}),
.q(dout[62:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msff_ctl_macro__width_5 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = din[4:0];






dff #(5)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4:0]),
.si({scan_in,so[3:0]}),
.so({so[3:0],scan_out}),
.q(dout[4:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msff_ctl_macro__en_1__width_5 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = (din[4:0] & {5{en}}) | (dout[4:0] & ~{5{en}});






dff #(5)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4:0]),
.si({scan_in,so[3:0]}),
.so({so[3:0],scan_out}),
.q(dout[4:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msff_ctl_macro__width_43 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [42:0] fdin;
wire [41:0] so;

  input [42:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [42:0] dout;
  output scan_out;
assign fdin[42:0] = din[42:0];






dff #(43)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[42:0]),
.si({scan_in,so[41:0]}),
.so({so[41:0],scan_out}),
.q(dout[42:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msff_ctl_macro__en_1__width_43 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [42:0] fdin;
wire [41:0] so;

  input [42:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [42:0] dout;
  output scan_out;
assign fdin[42:0] = (din[42:0] & {43{en}}) | (dout[42:0] & ~{43{en}});






dff #(43)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[42:0]),
.si({scan_in,so[41:0]}),
.so({so[41:0],scan_out}),
.q(dout[42:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msff_ctl_macro__en_1__width_59 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [58:0] fdin;
wire [57:0] so;

  input [58:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [58:0] dout;
  output scan_out;
assign fdin[58:0] = (din[58:0] & {59{en}}) | (dout[58:0] & ~{59{en}});






dff #(59)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[58:0]),
.si({scan_in,so[57:0]}),
.so({so[57:0],scan_out}),
.q(dout[58:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msff_ctl_macro__en_1__width_61 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [60:0] fdin;
wire [59:0] so;

  input [60:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [60:0] dout;
  output scan_out;
assign fdin[60:0] = (din[60:0] & {61{en}}) | (dout[60:0] & ~{61{en}});






dff #(61)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[60:0]),
.si({scan_in,so[59:0]}),
.so({so[59:0],scan_out}),
.q(dout[60:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ctrl_ctl_msff_ctl_macro__width_2 (
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

module ncu_ctrl_ctl_l1clkhdr_ctl_macro (
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








