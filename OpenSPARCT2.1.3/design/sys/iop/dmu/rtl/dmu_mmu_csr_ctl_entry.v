// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_csr_ctl_entry.v
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
module dmu_mmu_csr_ctl_entry 
	(
	// synopsys translate_off
	  omni_ld,
	  omni_data,
	// synopsys translate_on
	clk,
	rst_l,
	w_ld,
	csrbus_wr_data,
	ctl_csrbus_read_data,
	ctl_spares_hw_write,
	ctl_paq_hw_write,
	ctl_vaq_hw_write,
	ctl_tpl_hw_write,
	ctl_tip_hw_write,
	ctl_tcm_hw_write
	);

//====================================================================
//     Polarity declarations
//====================================================================
// synopsys translate_off
  input  omni_ld;  // Omni load
// vlint flag_input_port_not_connected off
  input  [`FIRE_DLC_MMU_CSR_CTL_WIDTH - 1:0] omni_data;  // Omni write data
// synopsys translate_on
// vlint flag_input_port_not_connected on
input  clk;  // Clock signal
input  rst_l;  // Reset signal
input  w_ld;  // SW load
// vlint flag_input_port_not_connected off
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
// vlint flag_input_port_not_connected on
output [`FIRE_DLC_MMU_CSR_CTL_WIDTH-1:0] ctl_csrbus_read_data;  // SW read data
input  [`FIRE_DLC_MMU_CSR_CTL_SPARES_INT_SLC] ctl_spares_hw_write;
    // data bus for hw loading of ctl_spares.
input  ctl_paq_hw_write;  // data bus for hw loading of ctl_paq.
input  ctl_vaq_hw_write;  // data bus for hw loading of ctl_vaq.
input  ctl_tpl_hw_write;  // data bus for hw loading of ctl_tpl.
input  ctl_tip_hw_write;  // data bus for hw loading of ctl_tip.
input  [`FIRE_DLC_MMU_CSR_CTL_TCM_INT_SLC] ctl_tcm_hw_write;  // data bus for hw
                                                              // loading of
                                                              // ctl_tcm.

//====================================================================
//     Type declarations
//====================================================================
// synopsys translate_off
  wire omni_ld;  // Omni load
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
  wire [`FIRE_DLC_MMU_CSR_CTL_WIDTH - 1:0] omni_data;  // Omni write data
// synopsys translate_on
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on
wire clk;  // Clock signal
wire rst_l;  // Reset signal
wire w_ld;  // SW load
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on
wire [`FIRE_DLC_MMU_CSR_CTL_WIDTH-1:0] ctl_csrbus_read_data;  // SW read data
wire [`FIRE_DLC_MMU_CSR_CTL_SPARES_INT_SLC] ctl_spares_hw_write;  // data bus
                                                                  // for hw
                                                                  // loading of
                                                                  // ctl_spares.
wire ctl_paq_hw_write;  // data bus for hw loading of ctl_paq.
wire ctl_vaq_hw_write;  // data bus for hw loading of ctl_vaq.
wire ctl_tpl_hw_write;  // data bus for hw loading of ctl_tpl.
wire ctl_tip_hw_write;  // data bus for hw loading of ctl_tip.
wire [`FIRE_DLC_MMU_CSR_CTL_TCM_INT_SLC] ctl_tcm_hw_write;  // data bus for hw
                                                            // loading of
                                                            // ctl_tcm.

//====================================================================
//     Logic     
//====================================================================

//----- Reset values
// verilint 531 off
wire [3:0] reset_spares = 4'h0;
wire [0:0] reset_paq = 1'h0;
wire [0:0] reset_vaq = 1'h0;
wire [0:0] reset_tpl = 1'h0;
wire [0:0] reset_tip = 1'h0;
wire [1:0] reset_tcm = 2'h0;
wire [3:0] reset_sparec = 4'h0;
wire [0:0] reset_pd = 1'h0;
wire [0:0] reset_se = 1'h0;
wire [1:0] reset_cm = 2'h0;
wire [0:0] reset_busid_sel = 1'h0;
wire [0:0] reset_sun4v_en = 1'h0;
wire [0:0] reset_be = 1'h0;
wire [0:0] reset_te = 1'h0;
// verilint 531 on

//----- Active high reset wires 
wire rst_l_active_high = ~rst_l;

//====================================================
//     Instantiation of flops
//====================================================

// bit 0
csr_sw csr_sw_0
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[0]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_te[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[0]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b0),
	.hw_data        (1'b0),
	.cp             (clk),
	.q              (ctl_csrbus_read_data[0])
	);

// bit 1
csr_sw csr_sw_1
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[1]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_be[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[1]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b0),
	.hw_data        (1'b0),
	.cp             (clk),
	.q              (ctl_csrbus_read_data[1])
	);

// bit 2
csr_sw csr_sw_2
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[2]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_sun4v_en[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[2]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b0),
	.hw_data        (1'b0),
	.cp             (clk),
	.q              (ctl_csrbus_read_data[2])
	);

// bit 3
csr_sw csr_sw_3
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[3]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_busid_sel[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[3]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b0),
	.hw_data        (1'b0),
	.cp             (clk),
	.q              (ctl_csrbus_read_data[3])
	);

assign  ctl_csrbus_read_data[4] = 1'b0;  // bit 4
assign  ctl_csrbus_read_data[5] = 1'b0;  // bit 5
assign  ctl_csrbus_read_data[6] = 1'b0;  // bit 6
assign  ctl_csrbus_read_data[7] = 1'b0;  // bit 7
// bit 8
csr_sw csr_sw_8
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[8]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_cm[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[8]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b0),
	.hw_data        (1'b0),
	.cp             (clk),
	.q              (ctl_csrbus_read_data[8])
	);

// bit 9
csr_sw csr_sw_9
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[9]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_cm[1]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[9]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b0),
	.hw_data        (1'b0),
	.cp             (clk),
	.q              (ctl_csrbus_read_data[9])
	);

// bit 10
csr_sw csr_sw_10
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[10]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_se[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[10]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b0),
	.hw_data        (1'b0),
	.cp             (clk),
	.q              (ctl_csrbus_read_data[10])
	);

assign  ctl_csrbus_read_data[11] = 1'b0;  // bit 11
// bit 12
csr_sw csr_sw_12
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[12]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_pd[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[12]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b0),
	.hw_data        (1'b0),
	.cp             (clk),
	.q              (ctl_csrbus_read_data[12])
	);

assign  ctl_csrbus_read_data[13] = 1'b0;  // bit 13
assign  ctl_csrbus_read_data[14] = 1'b0;  // bit 14
assign  ctl_csrbus_read_data[15] = 1'b0;  // bit 15
// bit 16
csr_sw csr_sw_16
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[16]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_sparec[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[16]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b0),
	.hw_data        (1'b0),
	.cp             (clk),
	.q              (ctl_csrbus_read_data[16])
	);

// bit 17
csr_sw csr_sw_17
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[17]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_sparec[1]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[17]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b0),
	.hw_data        (1'b0),
	.cp             (clk),
	.q              (ctl_csrbus_read_data[17])
	);

// bit 18
csr_sw csr_sw_18
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[18]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_sparec[2]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[18]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b0),
	.hw_data        (1'b0),
	.cp             (clk),
	.q              (ctl_csrbus_read_data[18])
	);

// bit 19
csr_sw csr_sw_19
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[19]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_sparec[3]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[19]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b0),
	.hw_data        (1'b0),
	.cp             (clk),
	.q              (ctl_csrbus_read_data[19])
	);

assign  ctl_csrbus_read_data[20] = 1'b0;  // bit 20
assign  ctl_csrbus_read_data[21] = 1'b0;  // bit 21
assign  ctl_csrbus_read_data[22] = 1'b0;  // bit 22
assign  ctl_csrbus_read_data[23] = 1'b0;  // bit 23
assign  ctl_csrbus_read_data[24] = 1'b0;  // bit 24
assign  ctl_csrbus_read_data[25] = 1'b0;  // bit 25
assign  ctl_csrbus_read_data[26] = 1'b0;  // bit 26
assign  ctl_csrbus_read_data[27] = 1'b0;  // bit 27
assign  ctl_csrbus_read_data[28] = 1'b0;  // bit 28
assign  ctl_csrbus_read_data[29] = 1'b0;  // bit 29
assign  ctl_csrbus_read_data[30] = 1'b0;  // bit 30
assign  ctl_csrbus_read_data[31] = 1'b0;  // bit 31
assign  ctl_csrbus_read_data[32] = 1'b0;  // bit 32
assign  ctl_csrbus_read_data[33] = 1'b0;  // bit 33
assign  ctl_csrbus_read_data[34] = 1'b0;  // bit 34
assign  ctl_csrbus_read_data[35] = 1'b0;  // bit 35
assign  ctl_csrbus_read_data[36] = 1'b0;  // bit 36
assign  ctl_csrbus_read_data[37] = 1'b0;  // bit 37
assign  ctl_csrbus_read_data[38] = 1'b0;  // bit 38
assign  ctl_csrbus_read_data[39] = 1'b0;  // bit 39
// bit 40
csr_sw csr_sw_40
	(
	// synopsys translate_off
	  .omni_ld         (1'b0),
	  .omni_data       (1'b0),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_tcm[0]),
	.csr_ld         (1'b0),
	.csr_data       (1'b0),
	.rw_alias       (1'b0),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b1),
	.hw_data        (ctl_tcm_hw_write[0]),
	.cp             (clk),
	.q              (ctl_csrbus_read_data[40])
	);

// bit 41
csr_sw csr_sw_41
	(
	// synopsys translate_off
	  .omni_ld         (1'b0),
	  .omni_data       (1'b0),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_tcm[1]),
	.csr_ld         (1'b0),
	.csr_data       (1'b0),
	.rw_alias       (1'b0),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b1),
	.hw_data        (ctl_tcm_hw_write[1]),
	.cp             (clk),
	.q              (ctl_csrbus_read_data[41])
	);

// bit 42
csr_sw csr_sw_42
	(
	// synopsys translate_off
	  .omni_ld         (1'b0),
	  .omni_data       (1'b0),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_tip[0]),
	.csr_ld         (1'b0),
	.csr_data       (1'b0),
	.rw_alias       (1'b0),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b1),
	.hw_data        (ctl_tip_hw_write),
	.cp             (clk),
	.q              (ctl_csrbus_read_data[42])
	);

// bit 43
csr_sw csr_sw_43
	(
	// synopsys translate_off
	  .omni_ld         (1'b0),
	  .omni_data       (1'b0),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_tpl[0]),
	.csr_ld         (1'b0),
	.csr_data       (1'b0),
	.rw_alias       (1'b0),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b1),
	.hw_data        (ctl_tpl_hw_write),
	.cp             (clk),
	.q              (ctl_csrbus_read_data[43])
	);

// bit 44
csr_sw csr_sw_44
	(
	// synopsys translate_off
	  .omni_ld         (1'b0),
	  .omni_data       (1'b0),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_vaq[0]),
	.csr_ld         (1'b0),
	.csr_data       (1'b0),
	.rw_alias       (1'b0),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b1),
	.hw_data        (ctl_vaq_hw_write),
	.cp             (clk),
	.q              (ctl_csrbus_read_data[44])
	);

// bit 45
csr_sw csr_sw_45
	(
	// synopsys translate_off
	  .omni_ld         (1'b0),
	  .omni_data       (1'b0),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_paq[0]),
	.csr_ld         (1'b0),
	.csr_data       (1'b0),
	.rw_alias       (1'b0),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b1),
	.hw_data        (ctl_paq_hw_write),
	.cp             (clk),
	.q              (ctl_csrbus_read_data[45])
	);

assign  ctl_csrbus_read_data[46] = 1'b0;  // bit 46
assign  ctl_csrbus_read_data[47] = 1'b0;  // bit 47
// bit 48
csr_sw csr_sw_48
	(
	// synopsys translate_off
	  .omni_ld         (1'b0),
	  .omni_data       (1'b0),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_spares[0]),
	.csr_ld         (1'b0),
	.csr_data       (1'b0),
	.rw_alias       (1'b0),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b1),
	.hw_data        (ctl_spares_hw_write[0]),
	.cp             (clk),
	.q              (ctl_csrbus_read_data[48])
	);

// bit 49
csr_sw csr_sw_49
	(
	// synopsys translate_off
	  .omni_ld         (1'b0),
	  .omni_data       (1'b0),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_spares[1]),
	.csr_ld         (1'b0),
	.csr_data       (1'b0),
	.rw_alias       (1'b0),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b1),
	.hw_data        (ctl_spares_hw_write[1]),
	.cp             (clk),
	.q              (ctl_csrbus_read_data[49])
	);

// bit 50
csr_sw csr_sw_50
	(
	// synopsys translate_off
	  .omni_ld         (1'b0),
	  .omni_data       (1'b0),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_spares[2]),
	.csr_ld         (1'b0),
	.csr_data       (1'b0),
	.rw_alias       (1'b0),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b1),
	.hw_data        (ctl_spares_hw_write[2]),
	.cp             (clk),
	.q              (ctl_csrbus_read_data[50])
	);

// bit 51
csr_sw csr_sw_51
	(
	// synopsys translate_off
	  .omni_ld         (1'b0),
	  .omni_data       (1'b0),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_spares[3]),
	.csr_ld         (1'b0),
	.csr_data       (1'b0),
	.rw_alias       (1'b0),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b1),
	.hw_data        (ctl_spares_hw_write[3]),
	.cp             (clk),
	.q              (ctl_csrbus_read_data[51])
	);

assign  ctl_csrbus_read_data[52] = 1'b0;  // bit 52
assign  ctl_csrbus_read_data[53] = 1'b0;  // bit 53
assign  ctl_csrbus_read_data[54] = 1'b0;  // bit 54
assign  ctl_csrbus_read_data[55] = 1'b0;  // bit 55
assign  ctl_csrbus_read_data[56] = 1'b0;  // bit 56
assign  ctl_csrbus_read_data[57] = 1'b0;  // bit 57
assign  ctl_csrbus_read_data[58] = 1'b0;  // bit 58
assign  ctl_csrbus_read_data[59] = 1'b0;  // bit 59
assign  ctl_csrbus_read_data[60] = 1'b0;  // bit 60
assign  ctl_csrbus_read_data[61] = 1'b0;  // bit 61
assign  ctl_csrbus_read_data[62] = 1'b0;  // bit 62
assign  ctl_csrbus_read_data[63] = 1'b0;  // bit 63

endmodule // dmu_mmu_csr_ctl_entry
