// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_csr_err_entry.v
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
module dmu_mmu_csr_err_entry 
	(
	// synopsys translate_off
	  omni_ld,
	  omni_data,
	  omni_rw1c_alias,
	  omni_rw1s_alias,
	// synopsys translate_on
	clk,
	por_l,
	w_ld,
	csrbus_wr_data,
	rw1c_alias,
	rw1s_alias,
	err_csrbus_read_data,
	err_hw_set
	);

//====================================================================
//     Polarity declarations
//====================================================================
// synopsys translate_off
  input  omni_ld;  // Omni load
// vlint flag_input_port_not_connected off
  input  [`FIRE_DLC_MMU_CSR_ERR_RW1C_ALIAS_WIDTH - 1:0] omni_data;
    // Omni write data
// vlint flag_input_port_not_connected on
  input  omni_rw1c_alias;  // Omni load type: write-one-to-clear
  input  omni_rw1s_alias;  // Omni load type: write-one-to-set
// synopsys translate_on
input  clk;  // Clock signal
input  por_l;  // Reset signal
input  w_ld;  // SW load
// vlint flag_input_port_not_connected off
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
// vlint flag_input_port_not_connected on
input  rw1c_alias;  // SW load type: write-one-to-clear
input  rw1s_alias;  // SW load type: write-one-to-set
output [`FIRE_DLC_MMU_CSR_ERR_RW1C_ALIAS_WIDTH-1:0] err_csrbus_read_data;
    // SW read data
// vlint flag_input_port_not_connected off
input  [`FIRE_DLC_MMU_CSR_ERR_RW1C_ALIAS_WIDTH -1:0] err_hw_set;  // Hardware
                                                                  // set signal
                                                                  // for err.
                                                                  // When set
                                                                  // err will be
                                                                  // set to one.
// vlint flag_input_port_not_connected on

//====================================================================
//     Type declarations
//====================================================================
// synopsys translate_off
  wire omni_ld;  // Omni load
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
  wire [`FIRE_DLC_MMU_CSR_ERR_RW1C_ALIAS_WIDTH - 1:0] omni_data;  // Omni write
                                                                  // data
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on
  wire omni_rw1c_alias;  // Omni load type: write-one-to-clear
  wire omni_rw1s_alias;  // Omni load type: write-one-to-set
// synopsys translate_on
wire clk;  // Clock signal
wire por_l;  // Reset signal
wire w_ld;  // SW load
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on
wire rw1c_alias;  // SW load type: write-one-to-clear
wire rw1s_alias;  // SW load type: write-one-to-set
wire [`FIRE_DLC_MMU_CSR_ERR_RW1C_ALIAS_WIDTH-1:0] err_csrbus_read_data;
    // SW read data
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
wire [`FIRE_DLC_MMU_CSR_ERR_RW1C_ALIAS_WIDTH -1:0] err_hw_set;  // Hardware set
                                                                // signal for
                                                                // err. When set
                                                                // err will be
                                                                // set to one.
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on

//====================================================================
//     Logic     
//====================================================================

//----- Reset values
// verilint 531 off
wire [0:0] reset_sun4v_key_err_s = 1'h0;
wire [0:0] reset_sun4v_va_adj_uf_s = 1'h0;
wire [0:0] reset_sun4v_va_oor_s = 1'h0;
wire [0:0] reset_iotsbdesc_dpe_s = 1'h0;
wire [0:0] reset_iotsbdesc_inv_s = 1'h0;
wire [0:0] reset_tbw_dpe_s = 1'h0;
wire [0:0] reset_tbw_err_s = 1'h0;
wire [0:0] reset_tbw_ude_s = 1'h0;
wire [0:0] reset_tbw_dme_s = 1'h0;
wire [0:0] reset_spare3_s = 1'h0;
wire [0:0] reset_spare2_s = 1'h0;
wire [0:0] reset_ttc_cae_s = 1'h0;
wire [0:0] reset_ttc_dpe_s = 1'h0;
wire [0:0] reset_tte_prt_s = 1'h0;
wire [0:0] reset_tte_inv_s = 1'h0;
wire [0:0] reset_trn_oor_s = 1'h0;
wire [0:0] reset_trn_err_s = 1'h0;
wire [0:0] reset_spare1_s = 1'h0;
wire [0:0] reset_spare0_s = 1'h0;
wire [0:0] reset_byp_oor_s = 1'h0;
wire [0:0] reset_byp_err_s = 1'h0;
wire [0:0] reset_sun4v_key_err_p = 1'h0;
wire [0:0] reset_sun4v_va_adj_uf_p = 1'h0;
wire [0:0] reset_sun4v_va_oor_p = 1'h0;
wire [0:0] reset_iotsbdesc_dpe_p = 1'h0;
wire [0:0] reset_iotsbdesc_inv_p = 1'h0;
wire [0:0] reset_tbw_dpe_p = 1'h0;
wire [0:0] reset_tbw_err_p = 1'h0;
wire [0:0] reset_tbw_ude_p = 1'h0;
wire [0:0] reset_tbw_dme_p = 1'h0;
wire [0:0] reset_spare3_p = 1'h0;
wire [0:0] reset_spare2_p = 1'h0;
wire [0:0] reset_ttc_cae_p = 1'h0;
wire [0:0] reset_ttc_dpe_p = 1'h0;
wire [0:0] reset_tte_prt_p = 1'h0;
wire [0:0] reset_tte_inv_p = 1'h0;
wire [0:0] reset_trn_oor_p = 1'h0;
wire [0:0] reset_trn_err_p = 1'h0;
wire [0:0] reset_spare1_p = 1'h0;
wire [0:0] reset_spare0_p = 1'h0;
wire [0:0] reset_byp_oor_p = 1'h0;
wire [0:0] reset_byp_err_p = 1'h0;
// verilint 531 on

//----- Active high reset wires 
wire por_l_active_high = ~por_l;

//====================================================
//     Instantiation of flops
//====================================================

// bit 0
csr_sw csr_sw_0
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[0]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_byp_err_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[0]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[0]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[0])
	);

// bit 1
csr_sw csr_sw_1
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[1]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_byp_oor_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[1]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[1]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[1])
	);

// bit 2
csr_sw csr_sw_2
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[2]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_spare0_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[2]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[2]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[2])
	);

// bit 3
csr_sw csr_sw_3
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[3]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_spare1_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[3]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[3]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[3])
	);

// bit 4
csr_sw csr_sw_4
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[4]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_trn_err_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[4]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[4]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[4])
	);

// bit 5
csr_sw csr_sw_5
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[5]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_trn_oor_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[5]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[5]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[5])
	);

// bit 6
csr_sw csr_sw_6
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[6]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_tte_inv_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[6]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[6]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[6])
	);

// bit 7
csr_sw csr_sw_7
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[7]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_tte_prt_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[7]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[7]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[7])
	);

// bit 8
csr_sw csr_sw_8
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[8]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_ttc_dpe_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[8]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[8]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[8])
	);

// bit 9
csr_sw csr_sw_9
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[9]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_ttc_cae_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[9]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[9]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[9])
	);

// bit 10
csr_sw csr_sw_10
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[10]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_spare2_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[10]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[10]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[10])
	);

// bit 11
csr_sw csr_sw_11
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[11]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_spare3_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[11]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[11]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[11])
	);

// bit 12
csr_sw csr_sw_12
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[12]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_tbw_dme_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[12]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[12]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[12])
	);

// bit 13
csr_sw csr_sw_13
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[13]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_tbw_ude_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[13]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[13]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[13])
	);

// bit 14
csr_sw csr_sw_14
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[14]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_tbw_err_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[14]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[14]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[14])
	);

// bit 15
csr_sw csr_sw_15
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[15]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_tbw_dpe_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[15]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[15]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[15])
	);

// bit 16
csr_sw csr_sw_16
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[16]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_iotsbdesc_inv_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[16]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[16]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[16])
	);

// bit 17
csr_sw csr_sw_17
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[17]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_iotsbdesc_dpe_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[17]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[17]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[17])
	);

// bit 18
csr_sw csr_sw_18
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[18]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_sun4v_va_oor_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[18]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[18]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[18])
	);

// bit 19
csr_sw csr_sw_19
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[19]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_sun4v_va_adj_uf_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[19]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[19]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[19])
	);

// bit 20
csr_sw csr_sw_20
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[20]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_sun4v_key_err_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[20]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[20]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[20])
	);

assign  err_csrbus_read_data[21] = 1'b0;  // bit 21
assign  err_csrbus_read_data[22] = 1'b0;  // bit 22
assign  err_csrbus_read_data[23] = 1'b0;  // bit 23
assign  err_csrbus_read_data[24] = 1'b0;  // bit 24
assign  err_csrbus_read_data[25] = 1'b0;  // bit 25
assign  err_csrbus_read_data[26] = 1'b0;  // bit 26
assign  err_csrbus_read_data[27] = 1'b0;  // bit 27
assign  err_csrbus_read_data[28] = 1'b0;  // bit 28
assign  err_csrbus_read_data[29] = 1'b0;  // bit 29
assign  err_csrbus_read_data[30] = 1'b0;  // bit 30
assign  err_csrbus_read_data[31] = 1'b0;  // bit 31
// bit 32
csr_sw csr_sw_32
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[32]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_byp_err_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[32]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[32]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[32])
	);

// bit 33
csr_sw csr_sw_33
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[33]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_byp_oor_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[33]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[33]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[33])
	);

// bit 34
csr_sw csr_sw_34
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[34]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_spare0_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[34]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[34]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[34])
	);

// bit 35
csr_sw csr_sw_35
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[35]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_spare1_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[35]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[35]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[35])
	);

// bit 36
csr_sw csr_sw_36
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[36]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_trn_err_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[36]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[36]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[36])
	);

// bit 37
csr_sw csr_sw_37
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[37]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_trn_oor_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[37]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[37]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[37])
	);

// bit 38
csr_sw csr_sw_38
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[38]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_tte_inv_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[38]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[38]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[38])
	);

// bit 39
csr_sw csr_sw_39
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[39]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_tte_prt_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[39]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[39]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[39])
	);

// bit 40
csr_sw csr_sw_40
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[40]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_ttc_dpe_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[40]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[40]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[40])
	);

// bit 41
csr_sw csr_sw_41
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[41]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_ttc_cae_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[41]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[41]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[41])
	);

// bit 42
csr_sw csr_sw_42
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[42]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_spare2_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[42]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[42]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[42])
	);

// bit 43
csr_sw csr_sw_43
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[43]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_spare3_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[43]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[43]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[43])
	);

// bit 44
csr_sw csr_sw_44
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[44]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_tbw_dme_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[44]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[44]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[44])
	);

// bit 45
csr_sw csr_sw_45
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[45]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_tbw_ude_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[45]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[45]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[45])
	);

// bit 46
csr_sw csr_sw_46
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[46]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_tbw_err_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[46]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[46]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[46])
	);

// bit 47
csr_sw csr_sw_47
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[47]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_tbw_dpe_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[47]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[47]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[47])
	);

// bit 48
csr_sw csr_sw_48
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[48]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_iotsbdesc_inv_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[48]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[48]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[48])
	);

// bit 49
csr_sw csr_sw_49
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[49]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_iotsbdesc_dpe_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[49]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[49]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[49])
	);

// bit 50
csr_sw csr_sw_50
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[50]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_sun4v_va_oor_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[50]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[50]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[50])
	);

// bit 51
csr_sw csr_sw_51
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[51]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_sun4v_va_adj_uf_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[51]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[51]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[51])
	);

// bit 52
csr_sw csr_sw_52
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[52]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_sun4v_key_err_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[52]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (err_hw_set[52]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (err_csrbus_read_data[52])
	);

assign  err_csrbus_read_data[53] = 1'b0;  // bit 53
assign  err_csrbus_read_data[54] = 1'b0;  // bit 54
assign  err_csrbus_read_data[55] = 1'b0;  // bit 55
assign  err_csrbus_read_data[56] = 1'b0;  // bit 56
assign  err_csrbus_read_data[57] = 1'b0;  // bit 57
assign  err_csrbus_read_data[58] = 1'b0;  // bit 58
assign  err_csrbus_read_data[59] = 1'b0;  // bit 59
assign  err_csrbus_read_data[60] = 1'b0;  // bit 60
assign  err_csrbus_read_data[61] = 1'b0;  // bit 61
assign  err_csrbus_read_data[62] = 1'b0;  // bit 62
assign  err_csrbus_read_data[63] = 1'b0;  // bit 63

endmodule // dmu_mmu_csr_err_entry
