// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_cru_default_grp.v
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
module dmu_cru_default_grp 
	(
	clk,
	dmc_dbg_sel_a_reg_block_sel_hw_read,
	dmc_dbg_sel_a_reg_sub_sel_hw_read,
	dmc_dbg_sel_a_reg_signal_sel_hw_read,
	dmc_dbg_sel_a_reg_select_pulse,
	dmc_dbg_sel_b_reg_block_sel_hw_read,
	dmc_dbg_sel_b_reg_sub_sel_hw_read,
	dmc_dbg_sel_b_reg_signal_sel_hw_read,
	dmc_dbg_sel_b_reg_select_pulse,
	dmc_pcie_cfg_bus_num_hw_read,
	dmc_pcie_cfg_req_id_hw_read,
	dmc_pcie_cfg_select_pulse,
	rst_l,
	daemon_csrbus_wr_in,
	daemon_csrbus_wr_data_in,
	read_data_0_out
	);

//====================================================
//     Polarity declarations
//====================================================
input  clk;  // Clock signal
output [`FIRE_DLC_CRU_CSR_DMC_DBG_SEL_A_REG_BLOCK_SEL_INT_SLC] dmc_dbg_sel_a_reg_block_sel_hw_read;
    // This signal provides the current value of dmc_dbg_sel_a_reg_block_sel.
output [`FIRE_DLC_CRU_CSR_DMC_DBG_SEL_A_REG_SUB_SEL_INT_SLC] dmc_dbg_sel_a_reg_sub_sel_hw_read;
    // This signal provides the current value of dmc_dbg_sel_a_reg_sub_sel.
output [`FIRE_DLC_CRU_CSR_DMC_DBG_SEL_A_REG_SIGNAL_SEL_INT_SLC] dmc_dbg_sel_a_reg_signal_sel_hw_read;
    // This signal provides the current value of dmc_dbg_sel_a_reg_signal_sel.
input  dmc_dbg_sel_a_reg_select_pulse;  // select
output [`FIRE_DLC_CRU_CSR_DMC_DBG_SEL_B_REG_BLOCK_SEL_INT_SLC] dmc_dbg_sel_b_reg_block_sel_hw_read;
    // This signal provides the current value of dmc_dbg_sel_b_reg_block_sel.
output [`FIRE_DLC_CRU_CSR_DMC_DBG_SEL_B_REG_SUB_SEL_INT_SLC] dmc_dbg_sel_b_reg_sub_sel_hw_read;
    // This signal provides the current value of dmc_dbg_sel_b_reg_sub_sel.
output [`FIRE_DLC_CRU_CSR_DMC_DBG_SEL_B_REG_SIGNAL_SEL_INT_SLC] dmc_dbg_sel_b_reg_signal_sel_hw_read;
    // This signal provides the current value of dmc_dbg_sel_b_reg_signal_sel.
input  dmc_dbg_sel_b_reg_select_pulse;  // select
output [`FIRE_DLC_CRU_CSR_DMC_PCIE_CFG_BUS_NUM_INT_SLC] dmc_pcie_cfg_bus_num_hw_read;
    // This signal provides the current value of dmc_pcie_cfg_bus_num.
output [`FIRE_DLC_CRU_CSR_DMC_PCIE_CFG_REQ_ID_INT_SLC] dmc_pcie_cfg_req_id_hw_read;
    // This signal provides the current value of dmc_pcie_cfg_req_id.
input  dmc_pcie_cfg_select_pulse;  // select
input  rst_l;  // HW reset
input  daemon_csrbus_wr_in;  // csrbus_wr
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
output [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data

//====================================================
//     Type declarations
//====================================================
wire clk;  // Clock signal
wire [`FIRE_DLC_CRU_CSR_DMC_DBG_SEL_A_REG_BLOCK_SEL_INT_SLC] dmc_dbg_sel_a_reg_block_sel_hw_read;
    // This signal provides the current value of dmc_dbg_sel_a_reg_block_sel.
wire [`FIRE_DLC_CRU_CSR_DMC_DBG_SEL_A_REG_SUB_SEL_INT_SLC] dmc_dbg_sel_a_reg_sub_sel_hw_read;
    // This signal provides the current value of dmc_dbg_sel_a_reg_sub_sel.
wire [`FIRE_DLC_CRU_CSR_DMC_DBG_SEL_A_REG_SIGNAL_SEL_INT_SLC] dmc_dbg_sel_a_reg_signal_sel_hw_read;
    // This signal provides the current value of dmc_dbg_sel_a_reg_signal_sel.
wire dmc_dbg_sel_a_reg_select_pulse;  // select
wire [`FIRE_DLC_CRU_CSR_DMC_DBG_SEL_B_REG_BLOCK_SEL_INT_SLC] dmc_dbg_sel_b_reg_block_sel_hw_read;
    // This signal provides the current value of dmc_dbg_sel_b_reg_block_sel.
wire [`FIRE_DLC_CRU_CSR_DMC_DBG_SEL_B_REG_SUB_SEL_INT_SLC] dmc_dbg_sel_b_reg_sub_sel_hw_read;
    // This signal provides the current value of dmc_dbg_sel_b_reg_sub_sel.
wire [`FIRE_DLC_CRU_CSR_DMC_DBG_SEL_B_REG_SIGNAL_SEL_INT_SLC] dmc_dbg_sel_b_reg_signal_sel_hw_read;
    // This signal provides the current value of dmc_dbg_sel_b_reg_signal_sel.
wire dmc_dbg_sel_b_reg_select_pulse;  // select
wire [`FIRE_DLC_CRU_CSR_DMC_PCIE_CFG_BUS_NUM_INT_SLC] dmc_pcie_cfg_bus_num_hw_read;
    // This signal provides the current value of dmc_pcie_cfg_bus_num.
wire [`FIRE_DLC_CRU_CSR_DMC_PCIE_CFG_REQ_ID_INT_SLC] dmc_pcie_cfg_req_id_hw_read;
    // This signal provides the current value of dmc_pcie_cfg_req_id.
wire dmc_pcie_cfg_select_pulse;  // select
wire rst_l;  // HW reset
wire daemon_csrbus_wr_in;  // csrbus_wr
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data


//====================================================
//   Local signals
//====================================================
//----- For CSR register: dmc_dbg_sel_a_reg
wire [`FIRE_DLC_CRU_CSR_DMC_DBG_SEL_A_REG_WIDTH-1:0] dmc_dbg_sel_a_reg_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: dmc_dbg_sel_b_reg
wire [`FIRE_DLC_CRU_CSR_DMC_DBG_SEL_B_REG_WIDTH-1:0] dmc_dbg_sel_b_reg_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: dmc_pcie_cfg
wire [`FIRE_DLC_CRU_CSR_DMC_PCIE_CFG_WIDTH-1:0] dmc_pcie_cfg_csrbus_read_data;
    // Entry Based Read Data

//====================================================
//     Assignments only (first stage)
//====================================================
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data = daemon_csrbus_wr_data_in;
wire daemon_csrbus_wr      = daemon_csrbus_wr_in;

//====================================================
//      Automatic hw_ld / hw_write
//====================================================

//====================================================
//      Extern select
//====================================================

//=====================================================
//      OUTPUT: read_data_out
//=====================================================
dmu_cru_csrpipe_3 dmu_cru_csrpipe_3_inst_1
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.reg_in	(1'b1),
	.reg_out	(1'b1),
	.data0	(dmc_dbg_sel_a_reg_csrbus_read_data),
	.sel0	(dmc_dbg_sel_a_reg_select_pulse),
	.data1	(dmc_dbg_sel_b_reg_csrbus_read_data),
	.sel1	(dmc_dbg_sel_b_reg_select_pulse),
	.data2	(dmc_pcie_cfg_csrbus_read_data),
	.sel2	(dmc_pcie_cfg_select_pulse),
	.out	(read_data_0_out)
	);


//====================================================
//     Instantiation of registers
//====================================================

wire dmc_dbg_sel_a_reg_w_ld =dmc_dbg_sel_a_reg_select_pulse & daemon_csrbus_wr;

dmu_cru_csr_dmc_dbg_sel_a_reg dmc_dbg_sel_a_reg
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.dmc_dbg_sel_a_reg_w_ld	(dmc_dbg_sel_a_reg_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.dmc_dbg_sel_a_reg_csrbus_read_data	(dmc_dbg_sel_a_reg_csrbus_read_data),
	.dmc_dbg_sel_a_reg_block_sel_hw_read	(dmc_dbg_sel_a_reg_block_sel_hw_read),
	.dmc_dbg_sel_a_reg_sub_sel_hw_read	(dmc_dbg_sel_a_reg_sub_sel_hw_read),
	.dmc_dbg_sel_a_reg_signal_sel_hw_read	(dmc_dbg_sel_a_reg_signal_sel_hw_read)
	);

wire dmc_dbg_sel_b_reg_w_ld =dmc_dbg_sel_b_reg_select_pulse & daemon_csrbus_wr;

dmu_cru_csr_dmc_dbg_sel_b_reg dmc_dbg_sel_b_reg
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.dmc_dbg_sel_b_reg_w_ld	(dmc_dbg_sel_b_reg_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.dmc_dbg_sel_b_reg_csrbus_read_data	(dmc_dbg_sel_b_reg_csrbus_read_data),
	.dmc_dbg_sel_b_reg_block_sel_hw_read	(dmc_dbg_sel_b_reg_block_sel_hw_read),
	.dmc_dbg_sel_b_reg_sub_sel_hw_read	(dmc_dbg_sel_b_reg_sub_sel_hw_read),
	.dmc_dbg_sel_b_reg_signal_sel_hw_read	(dmc_dbg_sel_b_reg_signal_sel_hw_read)
	);

wire dmc_pcie_cfg_w_ld =dmc_pcie_cfg_select_pulse & daemon_csrbus_wr;

dmu_cru_csr_dmc_pcie_cfg dmc_pcie_cfg
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.dmc_pcie_cfg_w_ld	(dmc_pcie_cfg_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.dmc_pcie_cfg_csrbus_read_data	(dmc_pcie_cfg_csrbus_read_data),
	.dmc_pcie_cfg_bus_num_hw_read	(dmc_pcie_cfg_bus_num_hw_read),
	.dmc_pcie_cfg_req_id_hw_read	(dmc_pcie_cfg_req_id_hw_read)
	);

endmodule // dmu_cru_default_grp
