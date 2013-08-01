// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_csr_csr.v
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
module dmu_mmu_csr_csr 
	(
	clk,
	csrbus_addr,
	csrbus_wr_data,
	csrbus_wr,
	csrbus_valid,
	csrbus_mapped,
	csrbus_done,
	csrbus_read_data,
	rst_l,
	por_l,
	csrbus_src_bus,
	csrbus_acc_vio,
	instance_id,
	ext_addr,
	ext_wr,
	ext_wr_data,
	ctl_spares_hw_write,
	ctl_paq_hw_write,
	ctl_vaq_hw_write,
	ctl_tpl_hw_write,
	ctl_tip_hw_write,
	ctl_tcm_hw_write,
	ctl_sparec_hw_read,
	ctl_pd_hw_read,
	ctl_se_hw_read,
	ctl_cm_hw_read,
	ctl_busid_sel_hw_read,
	ctl_sun4v_en_hw_read,
	ctl_be_hw_read,
	ctl_te_hw_read,
	tsb_tb_hw_read,
	tsb_ps_hw_read,
	tsb_ts_hw_read,
	inv_ext_select,
	log_en_hw_read,
	int_en_hw_read,
	en_err_err_s_ext_read_data,
	en_err_err_p_ext_read_data,
	err_hw_set,
	err_hw_read,
	flta_va_hw_ld,
	flta_va_hw_write,
	flts_entry_hw_ld,
	flts_entry_hw_write,
	flts_type_hw_ld,
	flts_type_hw_write,
	flts_id_hw_ld,
	flts_id_hw_write,
	prfc_sel1_hw_read,
	prfc_sel0_hw_read,
	prf0_cnt_hw_write,
	prf0_cnt_hw_read,
	prf1_cnt_hw_write,
	prf1_cnt_hw_read,
	vtb_hw_acc_jtag_rd,
	vtb_hw_acc_jtag_wr,
	vtb_hw_acc_pio_slow_rd,
	vtb_hw_acc_pio_slow_wr,
	vtb_hw_acc_pio_med_rd,
	vtb_hw_acc_pio_med_wr,
	vtb_hw_acc_pio_fast_rd,
	vtb_hw_acc_pio_fast_wr,
	vtb_ext_select,
	vtb_ext_read_data,
	ptb_hw_acc_jtag_rd,
	ptb_hw_acc_jtag_wr,
	ptb_hw_acc_pio_slow_rd,
	ptb_hw_acc_pio_slow_wr,
	ptb_hw_acc_pio_med_rd,
	ptb_hw_acc_pio_med_wr,
	ptb_hw_acc_pio_fast_rd,
	ptb_hw_acc_pio_fast_wr,
	ptb_ext_select,
	ptb_ext_read_data,
	tdb_hw_acc_jtag_rd,
	tdb_hw_acc_jtag_wr,
	tdb_hw_acc_pio_slow_rd,
	tdb_hw_acc_pio_slow_wr,
	tdb_hw_acc_pio_med_rd,
	tdb_hw_acc_pio_med_wr,
	tdb_hw_acc_pio_fast_rd,
	tdb_hw_acc_pio_fast_wr,
	tdb_ext_select,
	tdb_ext_read_data,
	dev2iotsb_hw_acc_jtag_rd,
	dev2iotsb_hw_acc_jtag_wr,
	dev2iotsb_hw_acc_pio_slow_rd,
	dev2iotsb_hw_acc_pio_slow_wr,
	dev2iotsb_hw_acc_pio_med_rd,
	dev2iotsb_hw_acc_pio_med_wr,
	dev2iotsb_hw_acc_pio_fast_rd,
	dev2iotsb_hw_acc_pio_fast_wr,
	dev2iotsb_ext_select,
	dev2iotsb_ext_read_data,
	dev2iotsb_ext_done,
	IotsbDesc_hw_acc_jtag_rd,
	IotsbDesc_hw_acc_jtag_wr,
	IotsbDesc_hw_acc_pio_slow_rd,
	IotsbDesc_hw_acc_pio_slow_wr,
	IotsbDesc_hw_acc_pio_med_rd,
	IotsbDesc_hw_acc_pio_med_wr,
	IotsbDesc_hw_acc_pio_fast_rd,
	IotsbDesc_hw_acc_pio_fast_wr,
	IotsbDesc_ext_select,
	IotsbDesc_ext_read_data,
	IotsbDesc_ext_done
	);

//====================================================
//     Polarity declarations
//====================================================
input  clk;  // Clock signal
input  [`FIRE_CSRBUS_ADDR_WIDTH-1:0] csrbus_addr;  // Address bus
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
input  csrbus_wr;  // Read/Write signal
input  csrbus_valid;  // Valid address
output csrbus_mapped;  // Address is mapped
output csrbus_done;  // Operation is done
output [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_read_data;  // SW read data bus
input  rst_l;  // Reset signal
input  por_l;  // Reset signal
input  [1:0] csrbus_src_bus;  // Source bus
output csrbus_acc_vio;  // Violation signal
input  instance_id;  // Instance ID
output [8:0] ext_addr;  // External address bus for dcm csr
output ext_wr;  // When one, csr operation is a write. When zero, operation is a
                // read.
output [`FIRE_CSRBUS_DATA_WIDTH-1:0] ext_wr_data;  // Provides SW write data for
                                                   // all external registers in
                                                   // default_grp
input  [`FIRE_DLC_MMU_CSR_CTL_SPARES_INT_SLC] ctl_spares_hw_write;
    // data bus for hw loading of ctl_spares.
input  ctl_paq_hw_write;  // data bus for hw loading of ctl_paq.
input  ctl_vaq_hw_write;  // data bus for hw loading of ctl_vaq.
input  ctl_tpl_hw_write;  // data bus for hw loading of ctl_tpl.
input  ctl_tip_hw_write;  // data bus for hw loading of ctl_tip.
input  [`FIRE_DLC_MMU_CSR_CTL_TCM_INT_SLC] ctl_tcm_hw_write;  // data bus for hw
                                                              // loading of
                                                              // ctl_tcm.
output [`FIRE_DLC_MMU_CSR_CTL_SPAREC_INT_SLC] ctl_sparec_hw_read;
    // This signal provides the current value of ctl_sparec.
output ctl_pd_hw_read;  // This signal provides the current value of ctl_pd.
output ctl_se_hw_read;  // This signal provides the current value of ctl_se.
output [`FIRE_DLC_MMU_CSR_CTL_CM_INT_SLC] ctl_cm_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // ctl_cm.
output ctl_busid_sel_hw_read;  // This signal provides the current value of
                               // ctl_busid_sel.
output ctl_sun4v_en_hw_read;  // This signal provides the current value of
                              // ctl_sun4v_en.
output ctl_be_hw_read;  // This signal provides the current value of ctl_be.
output ctl_te_hw_read;  // This signal provides the current value of ctl_te.
output [`FIRE_DLC_MMU_CSR_TSB_TB_INT_SLC] tsb_tb_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // tsb_tb.
output tsb_ps_hw_read;  // This signal provides the current value of tsb_ps.
output [`FIRE_DLC_MMU_CSR_TSB_TS_INT_SLC] tsb_ts_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // tsb_ts.
output inv_ext_select;  // When set, register inv is selected. This signal is a
                        // pulse.
output [`FIRE_DLC_MMU_CSR_LOG_EN_INT_SLC] log_en_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // log_en.
output [`FIRE_DLC_MMU_CSR_INT_EN_WIDTH-1:0] int_en_hw_read;  // This signal
                                                             // provides the
                                                             // current value of
                                                             // int_en.
input  [20:0] en_err_err_s_ext_read_data;  // Ext read data (decode)
input  [20:0] en_err_err_p_ext_read_data;  // Ext read data (decode)
input  [`FIRE_DLC_MMU_CSR_ERR_RW1C_ALIAS_WIDTH-1:0] err_hw_set;  // Hardware set
                                                                 // signal for
                                                                 // err. When
                                                                 // set err will
                                                                 // be set to
                                                                 // one.
output [`FIRE_DLC_MMU_CSR_ERR_RW1C_ALIAS_WIDTH-1:0] err_hw_read;  // This signal
                                                                  // provides
                                                                  // the current
                                                                  // value of
                                                                  // err.
input  flta_va_hw_ld;  // Hardware load enable for flta_va. When set, <hw write
                       // signal>  will be loaded into flta.
input  [`FIRE_DLC_MMU_CSR_FLTA_VA_INT_SLC] flta_va_hw_write;  // data bus for hw
                                                              // loading of
                                                              // flta_va.
input  flts_entry_hw_ld;  // Hardware load enable for flts_entry. When set, <hw
                          // write signal>  will be loaded into flts.
input  [`FIRE_DLC_MMU_CSR_FLTS_ENTRY_INT_SLC] flts_entry_hw_write;
    // data bus for hw loading of flts_entry.
input  flts_type_hw_ld;  // Hardware load enable for flts_type. When set, <hw
                         // write signal>  will be loaded into flts.
input  [`FIRE_DLC_MMU_CSR_FLTS_TYPE_INT_SLC] flts_type_hw_write;  // data bus
                                                                  // for hw
                                                                  // loading of
                                                                  // flts_type.
input  flts_id_hw_ld;  // Hardware load enable for flts_id. When set, <hw write
                       // signal>  will be loaded into flts.
input  [`FIRE_DLC_MMU_CSR_FLTS_ID_INT_SLC] flts_id_hw_write;  // data bus for hw
                                                              // loading of
                                                              // flts_id.
output [`FIRE_DLC_MMU_CSR_PRFC_SEL1_INT_SLC] prfc_sel1_hw_read;  // This signal
                                                                 // provides the
                                                                 // current
                                                                 // value of
                                                                 // prfc_sel1.
output [`FIRE_DLC_MMU_CSR_PRFC_SEL0_INT_SLC] prfc_sel0_hw_read;  // This signal
                                                                 // provides the
                                                                 // current
                                                                 // value of
                                                                 // prfc_sel0.
input  [`FIRE_DLC_MMU_CSR_PRF0_CNT_INT_SLC] prf0_cnt_hw_write;  // data bus for
                                                                // hw loading of
                                                                // prf0_cnt.
output [`FIRE_DLC_MMU_CSR_PRF0_CNT_INT_SLC] prf0_cnt_hw_read;  // This signal
                                                               // provides the
                                                               // current value
                                                               // of prf0_cnt.
input  [`FIRE_DLC_MMU_CSR_PRF1_CNT_INT_SLC] prf1_cnt_hw_write;  // data bus for
                                                                // hw loading of
                                                                // prf1_cnt.
output [`FIRE_DLC_MMU_CSR_PRF1_CNT_INT_SLC] prf1_cnt_hw_read;  // This signal
                                                               // provides the
                                                               // current value
                                                               // of prf1_cnt.
input  vtb_hw_acc_jtag_rd;  // This signal enables reading of register vtb by
                            // jtag.
input  vtb_hw_acc_jtag_wr;  // This signal enables writing of register vtb by
                            // jtag.
input  vtb_hw_acc_pio_slow_rd;  // This signal enables reading of register vtb
                                // by pio_slow.
input  vtb_hw_acc_pio_slow_wr;  // This signal enables writing of register vtb
                                // by pio_slow.
input  vtb_hw_acc_pio_med_rd;  // This signal enables reading of register vtb by
                               // pio_med.
input  vtb_hw_acc_pio_med_wr;  // This signal enables writing of register vtb by
                               // pio_med.
input  vtb_hw_acc_pio_fast_rd;  // This signal enables reading of register vtb
                                // by pio_fast.
input  vtb_hw_acc_pio_fast_wr;  // This signal enables writing of register vtb
                                // by pio_fast.
output vtb_ext_select;  // When set, register vtb is selected. This signal is a
                        // pulse.
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] vtb_ext_read_data;  // Read data from the
                                                         // external bypass
                                                         // register
input  ptb_hw_acc_jtag_rd;  // This signal enables reading of register ptb by
                            // jtag.
input  ptb_hw_acc_jtag_wr;  // This signal enables writing of register ptb by
                            // jtag.
input  ptb_hw_acc_pio_slow_rd;  // This signal enables reading of register ptb
                                // by pio_slow.
input  ptb_hw_acc_pio_slow_wr;  // This signal enables writing of register ptb
                                // by pio_slow.
input  ptb_hw_acc_pio_med_rd;  // This signal enables reading of register ptb by
                               // pio_med.
input  ptb_hw_acc_pio_med_wr;  // This signal enables writing of register ptb by
                               // pio_med.
input  ptb_hw_acc_pio_fast_rd;  // This signal enables reading of register ptb
                                // by pio_fast.
input  ptb_hw_acc_pio_fast_wr;  // This signal enables writing of register ptb
                                // by pio_fast.
output ptb_ext_select;  // When set, register ptb is selected. This signal is a
                        // pulse.
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] ptb_ext_read_data;  // Read data from the
                                                         // external bypass
                                                         // register
input  tdb_hw_acc_jtag_rd;  // This signal enables reading of register tdb by
                            // jtag.
input  tdb_hw_acc_jtag_wr;  // This signal enables writing of register tdb by
                            // jtag.
input  tdb_hw_acc_pio_slow_rd;  // This signal enables reading of register tdb
                                // by pio_slow.
input  tdb_hw_acc_pio_slow_wr;  // This signal enables writing of register tdb
                                // by pio_slow.
input  tdb_hw_acc_pio_med_rd;  // This signal enables reading of register tdb by
                               // pio_med.
input  tdb_hw_acc_pio_med_wr;  // This signal enables writing of register tdb by
                               // pio_med.
input  tdb_hw_acc_pio_fast_rd;  // This signal enables reading of register tdb
                                // by pio_fast.
input  tdb_hw_acc_pio_fast_wr;  // This signal enables writing of register tdb
                                // by pio_fast.
output tdb_ext_select;  // When set, register tdb is selected. This signal is a
                        // pulse.
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] tdb_ext_read_data;  // Read data from the
                                                         // external bypass
                                                         // register
input  dev2iotsb_hw_acc_jtag_rd;  // This signal enables reading of register
                                  // dev2iotsb by jtag.
input  dev2iotsb_hw_acc_jtag_wr;  // This signal enables writing of register
                                  // dev2iotsb by jtag.
input  dev2iotsb_hw_acc_pio_slow_rd;  // This signal enables reading of register
                                      // dev2iotsb by pio_slow.
input  dev2iotsb_hw_acc_pio_slow_wr;  // This signal enables writing of register
                                      // dev2iotsb by pio_slow.
input  dev2iotsb_hw_acc_pio_med_rd;  // This signal enables reading of register
                                     // dev2iotsb by pio_med.
input  dev2iotsb_hw_acc_pio_med_wr;  // This signal enables writing of register
                                     // dev2iotsb by pio_med.
input  dev2iotsb_hw_acc_pio_fast_rd;  // This signal enables reading of register
                                      // dev2iotsb by pio_fast.
input  dev2iotsb_hw_acc_pio_fast_wr;  // This signal enables writing of register
                                      // dev2iotsb by pio_fast.
output dev2iotsb_ext_select;  // When set, register dev2iotsb is selected. This
                              // signal is a pulse.
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] dev2iotsb_ext_read_data;  // Read data from
                                                               // the external
                                                               // bypass
                                                               // register
input  dev2iotsb_ext_done;  // This signal acknowledges read and write
                            // operations for register dev2iotsb. For read
                            // operations, it indicates that the
                            // dev2iotsb_ext_read_data signals are valid. For
                            // write operations, it indicates that the write
                            // operation is complete, and that <dcm>_ext_wr_data
                            // may be removed on the next cycle.
input  IotsbDesc_hw_acc_jtag_rd;  // This signal enables reading of register
                                  // IotsbDesc by jtag.
input  IotsbDesc_hw_acc_jtag_wr;  // This signal enables writing of register
                                  // IotsbDesc by jtag.
input  IotsbDesc_hw_acc_pio_slow_rd;  // This signal enables reading of register
                                      // IotsbDesc by pio_slow.
input  IotsbDesc_hw_acc_pio_slow_wr;  // This signal enables writing of register
                                      // IotsbDesc by pio_slow.
input  IotsbDesc_hw_acc_pio_med_rd;  // This signal enables reading of register
                                     // IotsbDesc by pio_med.
input  IotsbDesc_hw_acc_pio_med_wr;  // This signal enables writing of register
                                     // IotsbDesc by pio_med.
input  IotsbDesc_hw_acc_pio_fast_rd;  // This signal enables reading of register
                                      // IotsbDesc by pio_fast.
input  IotsbDesc_hw_acc_pio_fast_wr;  // This signal enables writing of register
                                      // IotsbDesc by pio_fast.
output IotsbDesc_ext_select;  // When set, register IotsbDesc is selected. This
                              // signal is a pulse.
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] IotsbDesc_ext_read_data;  // Read data from
                                                               // the external
                                                               // bypass
                                                               // register
input  IotsbDesc_ext_done;  // This signal acknowledges read and write
                            // operations for register IotsbDesc. For read
                            // operations, it indicates that the
                            // IotsbDesc_ext_read_data signals are valid. For
                            // write operations, it indicates that the write
                            // operation is complete, and that <dcm>_ext_wr_data
                            // may be removed on the next cycle.

//====================================================
//     Type declarations
//====================================================
wire clk;  // Clock signal
wire [`FIRE_CSRBUS_ADDR_WIDTH-1:0] csrbus_addr;  // Address bus
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
wire csrbus_wr;  // Read/Write signal
wire csrbus_valid;  // Valid address
wire csrbus_mapped;  // Address is mapped
wire csrbus_done;  // Operation is done
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_read_data;  // SW read data bus
wire rst_l;  // Reset signal
wire por_l;  // Reset signal
wire [1:0] csrbus_src_bus;  // Source bus
wire csrbus_acc_vio;  // Violation signal
wire instance_id;  // Instance ID
wire [8:0] ext_addr;  // External address bus for dcm csr
wire ext_wr;  // When one, csr operation is a write. When zero, operation is a
              // read.
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] ext_wr_data;  // Provides SW write data for
                                                 // all external registers in
                                                 // default_grp
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
wire [`FIRE_DLC_MMU_CSR_CTL_SPAREC_INT_SLC] ctl_sparec_hw_read;  // This signal
                                                                 // provides the
                                                                 // current
                                                                 // value of
                                                                 // ctl_sparec.
wire ctl_pd_hw_read;  // This signal provides the current value of ctl_pd.
wire ctl_se_hw_read;  // This signal provides the current value of ctl_se.
wire [`FIRE_DLC_MMU_CSR_CTL_CM_INT_SLC] ctl_cm_hw_read;  // This signal provides
                                                         // the current value of
                                                         // ctl_cm.
wire ctl_busid_sel_hw_read;  // This signal provides the current value of
                             // ctl_busid_sel.
wire ctl_sun4v_en_hw_read;  // This signal provides the current value of
                            // ctl_sun4v_en.
wire ctl_be_hw_read;  // This signal provides the current value of ctl_be.
wire ctl_te_hw_read;  // This signal provides the current value of ctl_te.
wire [`FIRE_DLC_MMU_CSR_TSB_TB_INT_SLC] tsb_tb_hw_read;  // This signal provides
                                                         // the current value of
                                                         // tsb_tb.
wire tsb_ps_hw_read;  // This signal provides the current value of tsb_ps.
wire [`FIRE_DLC_MMU_CSR_TSB_TS_INT_SLC] tsb_ts_hw_read;  // This signal provides
                                                         // the current value of
                                                         // tsb_ts.
wire inv_ext_select;  // When set, register inv is selected. This signal is a
                      // pulse.
wire [`FIRE_DLC_MMU_CSR_LOG_EN_INT_SLC] log_en_hw_read;  // This signal provides
                                                         // the current value of
                                                         // log_en.
wire [`FIRE_DLC_MMU_CSR_INT_EN_WIDTH-1:0] int_en_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // int_en.
wire [20:0] en_err_err_s_ext_read_data;  // Ext read data (decode)
wire [20:0] en_err_err_p_ext_read_data;  // Ext read data (decode)
wire [`FIRE_DLC_MMU_CSR_ERR_RW1C_ALIAS_WIDTH-1:0] err_hw_set;  // Hardware set
                                                               // signal for
                                                               // err. When set
                                                               // err will be
                                                               // set to one.
wire [`FIRE_DLC_MMU_CSR_ERR_RW1C_ALIAS_WIDTH-1:0] err_hw_read;  // This signal
                                                                // provides the
                                                                // current value
                                                                // of err.
wire flta_va_hw_ld;  // Hardware load enable for flta_va. When set, <hw write
                     // signal>  will be loaded into flta.
wire [`FIRE_DLC_MMU_CSR_FLTA_VA_INT_SLC] flta_va_hw_write;  // data bus for hw
                                                            // loading of
                                                            // flta_va.
wire flts_entry_hw_ld;  // Hardware load enable for flts_entry. When set, <hw
                        // write signal>  will be loaded into flts.
wire [`FIRE_DLC_MMU_CSR_FLTS_ENTRY_INT_SLC] flts_entry_hw_write;  // data bus
                                                                  // for hw
                                                                  // loading of
                                                                  // flts_entry.
wire flts_type_hw_ld;  // Hardware load enable for flts_type. When set, <hw
                       // write signal>  will be loaded into flts.
wire [`FIRE_DLC_MMU_CSR_FLTS_TYPE_INT_SLC] flts_type_hw_write;  // data bus for
                                                                // hw loading of
                                                                // flts_type.
wire flts_id_hw_ld;  // Hardware load enable for flts_id. When set, <hw write
                     // signal>  will be loaded into flts.
wire [`FIRE_DLC_MMU_CSR_FLTS_ID_INT_SLC] flts_id_hw_write;  // data bus for hw
                                                            // loading of
                                                            // flts_id.
wire [`FIRE_DLC_MMU_CSR_PRFC_SEL1_INT_SLC] prfc_sel1_hw_read;  // This signal
                                                               // provides the
                                                               // current value
                                                               // of prfc_sel1.
wire [`FIRE_DLC_MMU_CSR_PRFC_SEL0_INT_SLC] prfc_sel0_hw_read;  // This signal
                                                               // provides the
                                                               // current value
                                                               // of prfc_sel0.
wire [`FIRE_DLC_MMU_CSR_PRF0_CNT_INT_SLC] prf0_cnt_hw_write;  // data bus for hw
                                                              // loading of
                                                              // prf0_cnt.
wire [`FIRE_DLC_MMU_CSR_PRF0_CNT_INT_SLC] prf0_cnt_hw_read;  // This signal
                                                             // provides the
                                                             // current value of
                                                             // prf0_cnt.
wire [`FIRE_DLC_MMU_CSR_PRF1_CNT_INT_SLC] prf1_cnt_hw_write;  // data bus for hw
                                                              // loading of
                                                              // prf1_cnt.
wire [`FIRE_DLC_MMU_CSR_PRF1_CNT_INT_SLC] prf1_cnt_hw_read;  // This signal
                                                             // provides the
                                                             // current value of
                                                             // prf1_cnt.
wire vtb_hw_acc_jtag_rd;  // This signal enables reading of register vtb by
                          // jtag.
wire vtb_hw_acc_jtag_wr;  // This signal enables writing of register vtb by
                          // jtag.
wire vtb_hw_acc_pio_slow_rd;  // This signal enables reading of register vtb by
                              // pio_slow.
wire vtb_hw_acc_pio_slow_wr;  // This signal enables writing of register vtb by
                              // pio_slow.
wire vtb_hw_acc_pio_med_rd;  // This signal enables reading of register vtb by
                             // pio_med.
wire vtb_hw_acc_pio_med_wr;  // This signal enables writing of register vtb by
                             // pio_med.
wire vtb_hw_acc_pio_fast_rd;  // This signal enables reading of register vtb by
                              // pio_fast.
wire vtb_hw_acc_pio_fast_wr;  // This signal enables writing of register vtb by
                              // pio_fast.
wire vtb_ext_select;  // When set, register vtb is selected. This signal is a
                      // pulse.
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] vtb_ext_read_data;  // Read data from the
                                                       // external bypass
                                                       // register
wire ptb_hw_acc_jtag_rd;  // This signal enables reading of register ptb by
                          // jtag.
wire ptb_hw_acc_jtag_wr;  // This signal enables writing of register ptb by
                          // jtag.
wire ptb_hw_acc_pio_slow_rd;  // This signal enables reading of register ptb by
                              // pio_slow.
wire ptb_hw_acc_pio_slow_wr;  // This signal enables writing of register ptb by
                              // pio_slow.
wire ptb_hw_acc_pio_med_rd;  // This signal enables reading of register ptb by
                             // pio_med.
wire ptb_hw_acc_pio_med_wr;  // This signal enables writing of register ptb by
                             // pio_med.
wire ptb_hw_acc_pio_fast_rd;  // This signal enables reading of register ptb by
                              // pio_fast.
wire ptb_hw_acc_pio_fast_wr;  // This signal enables writing of register ptb by
                              // pio_fast.
wire ptb_ext_select;  // When set, register ptb is selected. This signal is a
                      // pulse.
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] ptb_ext_read_data;  // Read data from the
                                                       // external bypass
                                                       // register
wire tdb_hw_acc_jtag_rd;  // This signal enables reading of register tdb by
                          // jtag.
wire tdb_hw_acc_jtag_wr;  // This signal enables writing of register tdb by
                          // jtag.
wire tdb_hw_acc_pio_slow_rd;  // This signal enables reading of register tdb by
                              // pio_slow.
wire tdb_hw_acc_pio_slow_wr;  // This signal enables writing of register tdb by
                              // pio_slow.
wire tdb_hw_acc_pio_med_rd;  // This signal enables reading of register tdb by
                             // pio_med.
wire tdb_hw_acc_pio_med_wr;  // This signal enables writing of register tdb by
                             // pio_med.
wire tdb_hw_acc_pio_fast_rd;  // This signal enables reading of register tdb by
                              // pio_fast.
wire tdb_hw_acc_pio_fast_wr;  // This signal enables writing of register tdb by
                              // pio_fast.
wire tdb_ext_select;  // When set, register tdb is selected. This signal is a
                      // pulse.
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] tdb_ext_read_data;  // Read data from the
                                                       // external bypass
                                                       // register
wire dev2iotsb_hw_acc_jtag_rd;  // This signal enables reading of register
                                // dev2iotsb by jtag.
wire dev2iotsb_hw_acc_jtag_wr;  // This signal enables writing of register
                                // dev2iotsb by jtag.
wire dev2iotsb_hw_acc_pio_slow_rd;  // This signal enables reading of register
                                    // dev2iotsb by pio_slow.
wire dev2iotsb_hw_acc_pio_slow_wr;  // This signal enables writing of register
                                    // dev2iotsb by pio_slow.
wire dev2iotsb_hw_acc_pio_med_rd;  // This signal enables reading of register
                                   // dev2iotsb by pio_med.
wire dev2iotsb_hw_acc_pio_med_wr;  // This signal enables writing of register
                                   // dev2iotsb by pio_med.
wire dev2iotsb_hw_acc_pio_fast_rd;  // This signal enables reading of register
                                    // dev2iotsb by pio_fast.
wire dev2iotsb_hw_acc_pio_fast_wr;  // This signal enables writing of register
                                    // dev2iotsb by pio_fast.
wire dev2iotsb_ext_select;  // When set, register dev2iotsb is selected. This
                            // signal is a pulse.
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] dev2iotsb_ext_read_data;  // Read data from
                                                             // the external
                                                             // bypass register
wire dev2iotsb_ext_done;  // This signal acknowledges read and write operations
                          // for register dev2iotsb. For read operations, it
                          // indicates that the dev2iotsb_ext_read_data signals
                          // are valid. For write operations, it indicates that
                          // the write operation is complete, and that
                          // <dcm>_ext_wr_data may be removed on the next cycle.
wire IotsbDesc_hw_acc_jtag_rd;  // This signal enables reading of register
                                // IotsbDesc by jtag.
wire IotsbDesc_hw_acc_jtag_wr;  // This signal enables writing of register
                                // IotsbDesc by jtag.
wire IotsbDesc_hw_acc_pio_slow_rd;  // This signal enables reading of register
                                    // IotsbDesc by pio_slow.
wire IotsbDesc_hw_acc_pio_slow_wr;  // This signal enables writing of register
                                    // IotsbDesc by pio_slow.
wire IotsbDesc_hw_acc_pio_med_rd;  // This signal enables reading of register
                                   // IotsbDesc by pio_med.
wire IotsbDesc_hw_acc_pio_med_wr;  // This signal enables writing of register
                                   // IotsbDesc by pio_med.
wire IotsbDesc_hw_acc_pio_fast_rd;  // This signal enables reading of register
                                    // IotsbDesc by pio_fast.
wire IotsbDesc_hw_acc_pio_fast_wr;  // This signal enables writing of register
                                    // IotsbDesc by pio_fast.
wire IotsbDesc_ext_select;  // When set, register IotsbDesc is selected. This
                            // signal is a pulse.
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] IotsbDesc_ext_read_data;  // Read data from
                                                             // the external
                                                             // bypass register
wire IotsbDesc_ext_done;  // This signal acknowledges read and write operations
                          // for register IotsbDesc. For read operations, it
                          // indicates that the IotsbDesc_ext_read_data signals
                          // are valid. For write operations, it indicates that
                          // the write operation is complete, and that
                          // <dcm>_ext_wr_data may be removed on the next cycle.

//====================================================
//     Logic
//====================================================
wire daemon_transaction_in_progress;
wire daemon_csrbus_mapped;
wire daemon_csrbus_valid;
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_tmp;
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data;
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on
wire daemon_csrbus_done;
wire [`FIRE_CSRBUS_ADDR_WIDTH-1:0] daemon_csrbus_addr;
wire daemon_csrbus_wr_tmp;
wire daemon_csrbus_wr;

//summit modcovoff -bepgnv
pcie_dcm_daemon #(`FIRE_CSRBUS_ADDR_WIDTH,`FIRE_CSRBUS_DATA_WIDTH) pcie_dcm_daemon (
    .daemon_csrbus_valid (daemon_csrbus_valid),
    .daemon_csrbus_mapped (daemon_csrbus_mapped),
    .daemon_csrbus_wr_data (daemon_csrbus_wr_data_tmp),
    .daemon_csrbus_done (daemon_csrbus_done),
    .daemon_csrbus_addr (daemon_csrbus_addr),
    .daemon_csrbus_wr (daemon_csrbus_wr_tmp),
    .daemon_transaction_in_progress (daemon_transaction_in_progress),
// synopsys translate_off
      .clk(clk),
      .csrbus_read_data (csrbus_read_data),
      .rst_l (rst_l),
// synopsys translate_on
    .csrbus_valid (csrbus_valid),
    .csrbus_mapped (csrbus_mapped),
    .csrbus_wr_data (csrbus_wr_data),
    .csrbus_done (csrbus_done),
    .csrbus_addr (csrbus_addr),
    .csrbus_wr (csrbus_wr)
  );
//summit modcovon -bepgnv

//====================================================================
//   Address decode
//====================================================================
wire ctl_select_pulse;
wire tsb_select_pulse;
wire fsh_select_pulse;
wire inv_select;
wire log_select_pulse;
wire int_en_select_pulse;
wire en_err_select;
wire err_select_pulse;
wire flta_select_pulse;
wire flts_select_pulse;
wire prfc_select_pulse;
wire prf0_select_pulse;
wire prf1_select_pulse;
wire vtb_select;
wire ptb_select;
wire tdb_select;
wire dev2iotsb_select;
wire IotsbDesc_select;
wire err_rw1c_alias;
wire err_rw1s_alias;
wire stage_mux_only_ext_done_0_out;

dmu_mmu_csr_addr_decode dmu_mmu_csr_addr_decode
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.daemon_csrbus_valid	(daemon_csrbus_valid),
	.daemon_csrbus_addr	(daemon_csrbus_addr),
	.csrbus_src_bus	(csrbus_src_bus),
	.daemon_csrbus_wr	(daemon_csrbus_wr_tmp),
	.daemon_csrbus_wr_out	(daemon_csrbus_wr),
	.daemon_csrbus_wr_data	(daemon_csrbus_wr_data_tmp),
	.daemon_csrbus_wr_data_out	(daemon_csrbus_wr_data),
	.daemon_csrbus_mapped	(daemon_csrbus_mapped),
	.csrbus_acc_vio	(csrbus_acc_vio),
	.daemon_transaction_in_progress	(daemon_transaction_in_progress),
	.instance_id	(instance_id),
	.daemon_csrbus_done	(daemon_csrbus_done),
	.stage_mux_only_ext_done_0_out	(stage_mux_only_ext_done_0_out),
	.ctl_select_pulse	(ctl_select_pulse),
	.tsb_select_pulse	(tsb_select_pulse),
	.fsh_select_pulse	(fsh_select_pulse),
	.inv_select	(inv_select),
	.log_select_pulse	(log_select_pulse),
	.int_en_select_pulse	(int_en_select_pulse),
	.en_err_select	(en_err_select),
	.err_select_pulse	(err_select_pulse),
	.err_rw1c_alias	(err_rw1c_alias),
	.err_rw1s_alias	(err_rw1s_alias),
	.flta_select_pulse	(flta_select_pulse),
	.flts_select_pulse	(flts_select_pulse),
	.prfc_select_pulse	(prfc_select_pulse),
	.prf0_select_pulse	(prf0_select_pulse),
	.prf1_select_pulse	(prf1_select_pulse),
	.vtb_select	(vtb_select),
	.vtb_hw_acc_jtag_rd	(vtb_hw_acc_jtag_rd),
	.vtb_hw_acc_jtag_wr	(vtb_hw_acc_jtag_wr),
	.vtb_hw_acc_pio_slow_rd	(vtb_hw_acc_pio_slow_rd),
	.vtb_hw_acc_pio_slow_wr	(vtb_hw_acc_pio_slow_wr),
	.vtb_hw_acc_pio_med_rd	(vtb_hw_acc_pio_med_rd),
	.vtb_hw_acc_pio_med_wr	(vtb_hw_acc_pio_med_wr),
	.vtb_hw_acc_pio_fast_rd	(vtb_hw_acc_pio_fast_rd),
	.vtb_hw_acc_pio_fast_wr	(vtb_hw_acc_pio_fast_wr),
	.ptb_select	(ptb_select),
	.ptb_hw_acc_jtag_rd	(ptb_hw_acc_jtag_rd),
	.ptb_hw_acc_jtag_wr	(ptb_hw_acc_jtag_wr),
	.ptb_hw_acc_pio_slow_rd	(ptb_hw_acc_pio_slow_rd),
	.ptb_hw_acc_pio_slow_wr	(ptb_hw_acc_pio_slow_wr),
	.ptb_hw_acc_pio_med_rd	(ptb_hw_acc_pio_med_rd),
	.ptb_hw_acc_pio_med_wr	(ptb_hw_acc_pio_med_wr),
	.ptb_hw_acc_pio_fast_rd	(ptb_hw_acc_pio_fast_rd),
	.ptb_hw_acc_pio_fast_wr	(ptb_hw_acc_pio_fast_wr),
	.tdb_select	(tdb_select),
	.tdb_hw_acc_jtag_rd	(tdb_hw_acc_jtag_rd),
	.tdb_hw_acc_jtag_wr	(tdb_hw_acc_jtag_wr),
	.tdb_hw_acc_pio_slow_rd	(tdb_hw_acc_pio_slow_rd),
	.tdb_hw_acc_pio_slow_wr	(tdb_hw_acc_pio_slow_wr),
	.tdb_hw_acc_pio_med_rd	(tdb_hw_acc_pio_med_rd),
	.tdb_hw_acc_pio_med_wr	(tdb_hw_acc_pio_med_wr),
	.tdb_hw_acc_pio_fast_rd	(tdb_hw_acc_pio_fast_rd),
	.tdb_hw_acc_pio_fast_wr	(tdb_hw_acc_pio_fast_wr),
	.dev2iotsb_select	(dev2iotsb_select),
	.dev2iotsb_hw_acc_jtag_rd	(dev2iotsb_hw_acc_jtag_rd),
	.dev2iotsb_hw_acc_jtag_wr	(dev2iotsb_hw_acc_jtag_wr),
	.dev2iotsb_hw_acc_pio_slow_rd	(dev2iotsb_hw_acc_pio_slow_rd),
	.dev2iotsb_hw_acc_pio_slow_wr	(dev2iotsb_hw_acc_pio_slow_wr),
	.dev2iotsb_hw_acc_pio_med_rd	(dev2iotsb_hw_acc_pio_med_rd),
	.dev2iotsb_hw_acc_pio_med_wr	(dev2iotsb_hw_acc_pio_med_wr),
	.dev2iotsb_hw_acc_pio_fast_rd	(dev2iotsb_hw_acc_pio_fast_rd),
	.dev2iotsb_hw_acc_pio_fast_wr	(dev2iotsb_hw_acc_pio_fast_wr),
	.IotsbDesc_select	(IotsbDesc_select),
	.IotsbDesc_hw_acc_jtag_rd	(IotsbDesc_hw_acc_jtag_rd),
	.IotsbDesc_hw_acc_jtag_wr	(IotsbDesc_hw_acc_jtag_wr),
	.IotsbDesc_hw_acc_pio_slow_rd	(IotsbDesc_hw_acc_pio_slow_rd),
	.IotsbDesc_hw_acc_pio_slow_wr	(IotsbDesc_hw_acc_pio_slow_wr),
	.IotsbDesc_hw_acc_pio_med_rd	(IotsbDesc_hw_acc_pio_med_rd),
	.IotsbDesc_hw_acc_pio_med_wr	(IotsbDesc_hw_acc_pio_med_wr),
	.IotsbDesc_hw_acc_pio_fast_rd	(IotsbDesc_hw_acc_pio_fast_rd),
	.IotsbDesc_hw_acc_pio_fast_wr	(IotsbDesc_hw_acc_pio_fast_wr)
	);

//====================================================================
//    OUTPUT: csrbus_read_data (pipelining)
//====================================================================
//----- connecting wires
wire stage_2_default_grp_rst_l;
wire stage_2_default_grp_por_l;
wire stage_mux_only_rst_l;
wire stage_mux_only_por_l;
wire stage_2_default_grp_err_rw1c_alias;
wire stage_2_default_grp_err_rw1s_alias;
wire [8:0] stage_2_default_grp_ext_addr;
wire stage_2_default_grp_daemon_csrbus_wr;
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] stage_2_default_grp_daemon_csrbus_wr_data;
wire stage_mux_only_err_rw1c_alias;
wire stage_mux_only_err_rw1s_alias;
wire [8:0] stage_mux_only_ext_addr;
wire stage_mux_only_daemon_csrbus_wr;
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] stage_mux_only_daemon_csrbus_wr_data;

//----- Stage: 1 / Grp: default_grp (17 inputs / 2 outputs)
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] default_grp_read_data_0_out;
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] default_grp_read_data_1_out;
wire default_grp_ext_done_0_out;
wire default_grp_ctl_select_pulse;
wire default_grp_tsb_select_pulse;
wire default_grp_fsh_select_pulse;
wire default_grp_inv_select;
wire default_grp_log_select_pulse;
wire default_grp_int_en_select_pulse;
wire default_grp_en_err_select;
wire default_grp_err_select_pulse;
wire default_grp_flta_select_pulse;
wire default_grp_flts_select_pulse;
wire default_grp_prfc_select_pulse;
wire default_grp_prf0_select_pulse;
wire default_grp_prf1_select_pulse;
wire default_grp_vtb_select;
wire default_grp_ptb_select;
wire default_grp_tdb_select;
wire default_grp_dev2iotsb_select;
wire default_grp_IotsbDesc_select;

dmu_mmu_csr_default_grp dmu_mmu_csr_default_grp
	(
	.clk	(clk),
	.ctl_spares_hw_write	(ctl_spares_hw_write),
	.ctl_paq_hw_write	(ctl_paq_hw_write),
	.ctl_vaq_hw_write	(ctl_vaq_hw_write),
	.ctl_tpl_hw_write	(ctl_tpl_hw_write),
	.ctl_tip_hw_write	(ctl_tip_hw_write),
	.ctl_tcm_hw_write	(ctl_tcm_hw_write),
	.ctl_sparec_hw_read	(ctl_sparec_hw_read),
	.ctl_pd_hw_read	(ctl_pd_hw_read),
	.ctl_se_hw_read	(ctl_se_hw_read),
	.ctl_cm_hw_read	(ctl_cm_hw_read),
	.ctl_busid_sel_hw_read	(ctl_busid_sel_hw_read),
	.ctl_sun4v_en_hw_read	(ctl_sun4v_en_hw_read),
	.ctl_be_hw_read	(ctl_be_hw_read),
	.ctl_te_hw_read	(ctl_te_hw_read),
	.ctl_select_pulse	(default_grp_ctl_select_pulse),
	.tsb_tb_hw_read	(tsb_tb_hw_read),
	.tsb_ps_hw_read	(tsb_ps_hw_read),
	.tsb_ts_hw_read	(tsb_ts_hw_read),
	.tsb_select_pulse	(default_grp_tsb_select_pulse),
	.fsh_select_pulse	(default_grp_fsh_select_pulse),
	.inv_ext_select	(inv_ext_select),
	.inv_select	(default_grp_inv_select),
	.log_en_hw_read	(log_en_hw_read),
	.log_select_pulse	(default_grp_log_select_pulse),
	.int_en_hw_read	(int_en_hw_read),
	.int_en_select_pulse	(default_grp_int_en_select_pulse),
	.en_err_select	(default_grp_en_err_select),
	.en_err_ext_read_data
	  (
              {
                11'b0,
                en_err_err_s_ext_read_data,
                11'b0,
                en_err_err_p_ext_read_data
              }),
	.err_hw_set	(err_hw_set),
	.err_hw_read	(err_hw_read),
	.err_select_pulse	(default_grp_err_select_pulse),
	.flta_va_hw_ld	(flta_va_hw_ld),
	.flta_va_hw_write	(flta_va_hw_write),
	.flta_select_pulse	(default_grp_flta_select_pulse),
	.flts_entry_hw_ld	(flts_entry_hw_ld),
	.flts_entry_hw_write	(flts_entry_hw_write),
	.flts_type_hw_ld	(flts_type_hw_ld),
	.flts_type_hw_write	(flts_type_hw_write),
	.flts_id_hw_ld	(flts_id_hw_ld),
	.flts_id_hw_write	(flts_id_hw_write),
	.flts_select_pulse	(default_grp_flts_select_pulse),
	.prfc_sel1_hw_read	(prfc_sel1_hw_read),
	.prfc_sel0_hw_read	(prfc_sel0_hw_read),
	.prfc_select_pulse	(default_grp_prfc_select_pulse),
	.prf0_cnt_hw_write	(prf0_cnt_hw_write),
	.prf0_cnt_hw_read	(prf0_cnt_hw_read),
	.prf0_select_pulse	(default_grp_prf0_select_pulse),
	.prf1_cnt_hw_write	(prf1_cnt_hw_write),
	.prf1_cnt_hw_read	(prf1_cnt_hw_read),
	.prf1_select_pulse	(default_grp_prf1_select_pulse),
	.vtb_ext_select	(vtb_ext_select),
	.vtb_select	(default_grp_vtb_select),
	.vtb_ext_read_data	(vtb_ext_read_data),
	.ptb_ext_select	(ptb_ext_select),
	.ptb_select	(default_grp_ptb_select),
	.ptb_ext_read_data	(ptb_ext_read_data),
	.tdb_ext_select	(tdb_ext_select),
	.tdb_select	(default_grp_tdb_select),
	.tdb_ext_read_data	(tdb_ext_read_data),
	.dev2iotsb_ext_select	(dev2iotsb_ext_select),
	.dev2iotsb_select	(default_grp_dev2iotsb_select),
	.dev2iotsb_ext_read_data	(dev2iotsb_ext_read_data),
	.dev2iotsb_ext_done	(dev2iotsb_ext_done),
	.IotsbDesc_ext_select	(IotsbDesc_ext_select),
	.IotsbDesc_select	(default_grp_IotsbDesc_select),
	.IotsbDesc_ext_read_data	(IotsbDesc_ext_read_data),
	.IotsbDesc_ext_done	(IotsbDesc_ext_done),
	.err_rw1c_alias	(stage_2_default_grp_err_rw1c_alias),
	.err_rw1s_alias	(stage_2_default_grp_err_rw1s_alias),
	.rst_l	(stage_2_default_grp_rst_l),
	.por_l	(stage_2_default_grp_por_l),
	.daemon_csrbus_wr_in	(stage_2_default_grp_daemon_csrbus_wr),
	.daemon_csrbus_wr_out	(ext_wr),
	.daemon_csrbus_wr_data_in	(stage_2_default_grp_daemon_csrbus_wr_data),
	.daemon_csrbus_wr_data_out	(ext_wr_data),
	.ext_addr_in	(stage_2_default_grp_ext_addr[8:0]),
	.ext_addr_out	(ext_addr),
	.read_data_0_out	(default_grp_read_data_0_out),
	.read_data_1_out	(default_grp_read_data_1_out),
	.ext_done_0_out	(default_grp_ext_done_0_out)
	);

//----- Stage: 2 / Grp: stage_2_default_grp (2 inputs / 1 outputs)
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] stage_2_default_grp_read_data_0_out;
wire stage_2_default_grp_ext_done_0_out;
wire stage_2_default_grp_ctl_select_pulse;
wire stage_2_default_grp_tsb_select_pulse;
wire stage_2_default_grp_fsh_select_pulse;
wire stage_2_default_grp_inv_select;
wire stage_2_default_grp_log_select_pulse;
wire stage_2_default_grp_int_en_select_pulse;
wire stage_2_default_grp_en_err_select;
wire stage_2_default_grp_err_select_pulse;
wire stage_2_default_grp_flta_select_pulse;
wire stage_2_default_grp_flts_select_pulse;
wire stage_2_default_grp_prfc_select_pulse;
wire stage_2_default_grp_prf0_select_pulse;
wire stage_2_default_grp_prf1_select_pulse;
wire stage_2_default_grp_vtb_select;
wire stage_2_default_grp_ptb_select;
wire stage_2_default_grp_tdb_select;
wire stage_2_default_grp_dev2iotsb_select;
wire stage_2_default_grp_IotsbDesc_select;

dmu_mmu_csr_stage_2_default_grp dmu_mmu_csr_stage_2_default_grp
	(
	.clk	(clk),
	.read_data_0	(default_grp_read_data_0_out),
	.read_data_1	(default_grp_read_data_1_out),
	.ext_done_0	(default_grp_ext_done_0_out),
	.ctl_select_pulse	(stage_2_default_grp_ctl_select_pulse),
	.ctl_select_pulse_out	(default_grp_ctl_select_pulse),
	.tsb_select_pulse	(stage_2_default_grp_tsb_select_pulse),
	.tsb_select_pulse_out	(default_grp_tsb_select_pulse),
	.fsh_select_pulse	(stage_2_default_grp_fsh_select_pulse),
	.fsh_select_pulse_out	(default_grp_fsh_select_pulse),
	.inv_select	(stage_2_default_grp_inv_select),
	.inv_select_out	(default_grp_inv_select),
	.log_select_pulse	(stage_2_default_grp_log_select_pulse),
	.log_select_pulse_out	(default_grp_log_select_pulse),
	.int_en_select_pulse	(stage_2_default_grp_int_en_select_pulse),
	.int_en_select_pulse_out	(default_grp_int_en_select_pulse),
	.en_err_select	(stage_2_default_grp_en_err_select),
	.en_err_select_out	(default_grp_en_err_select),
	.err_select_pulse	(stage_2_default_grp_err_select_pulse),
	.err_select_pulse_out	(default_grp_err_select_pulse),
	.flta_select_pulse	(stage_2_default_grp_flta_select_pulse),
	.flta_select_pulse_out	(default_grp_flta_select_pulse),
	.flts_select_pulse	(stage_2_default_grp_flts_select_pulse),
	.flts_select_pulse_out	(default_grp_flts_select_pulse),
	.prfc_select_pulse	(stage_2_default_grp_prfc_select_pulse),
	.prfc_select_pulse_out	(default_grp_prfc_select_pulse),
	.prf0_select_pulse	(stage_2_default_grp_prf0_select_pulse),
	.prf0_select_pulse_out	(default_grp_prf0_select_pulse),
	.prf1_select_pulse	(stage_2_default_grp_prf1_select_pulse),
	.prf1_select_pulse_out	(default_grp_prf1_select_pulse),
	.vtb_select	(stage_2_default_grp_vtb_select),
	.vtb_select_out	(default_grp_vtb_select),
	.ptb_select	(stage_2_default_grp_ptb_select),
	.ptb_select_out	(default_grp_ptb_select),
	.tdb_select	(stage_2_default_grp_tdb_select),
	.tdb_select_out	(default_grp_tdb_select),
	.dev2iotsb_select	(stage_2_default_grp_dev2iotsb_select),
	.dev2iotsb_select_out	(default_grp_dev2iotsb_select),
	.IotsbDesc_select	(stage_2_default_grp_IotsbDesc_select),
	.IotsbDesc_select_out	(default_grp_IotsbDesc_select),
	.err_rw1c_alias	(stage_mux_only_err_rw1c_alias),
	.err_rw1c_alias_out	(stage_2_default_grp_err_rw1c_alias),
	.err_rw1s_alias	(stage_mux_only_err_rw1s_alias),
	.err_rw1s_alias_out	(stage_2_default_grp_err_rw1s_alias),
	.rst_l	(stage_mux_only_rst_l),
	.rst_l_out	(stage_2_default_grp_rst_l),
	.por_l	(stage_mux_only_por_l),
	.por_l_out	(stage_2_default_grp_por_l),
	.daemon_csrbus_wr_in	(stage_mux_only_daemon_csrbus_wr),
	.daemon_csrbus_wr_out	(stage_2_default_grp_daemon_csrbus_wr),
	.daemon_csrbus_wr_data_in	(stage_mux_only_daemon_csrbus_wr_data),
	.daemon_csrbus_wr_data_out	(stage_2_default_grp_daemon_csrbus_wr_data),
	.ext_addr_in	(stage_mux_only_ext_addr[8:0]),
	.ext_addr_out	(stage_2_default_grp_ext_addr),
	.read_data_0_out	(stage_2_default_grp_read_data_0_out),
	.ext_done_0_out	(stage_2_default_grp_ext_done_0_out)
	);

//----- Stage: 3 / Grp: stage_mux_only (1 inputs / 1 outputs) (Mux only)
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] stage_mux_only_read_data_0_out;

dmu_mmu_csr_stage_mux_only dmu_mmu_csr_stage_mux_only
	(
	.clk	(clk),
	.read_data_0	(stage_2_default_grp_read_data_0_out),
	.ext_done_0	(stage_2_default_grp_ext_done_0_out),
	.ctl_select_pulse	(ctl_select_pulse),
	.ctl_select_pulse_out	(stage_2_default_grp_ctl_select_pulse),
	.tsb_select_pulse	(tsb_select_pulse),
	.tsb_select_pulse_out	(stage_2_default_grp_tsb_select_pulse),
	.fsh_select_pulse	(fsh_select_pulse),
	.fsh_select_pulse_out	(stage_2_default_grp_fsh_select_pulse),
	.inv_select	(inv_select),
	.inv_select_out	(stage_2_default_grp_inv_select),
	.log_select_pulse	(log_select_pulse),
	.log_select_pulse_out	(stage_2_default_grp_log_select_pulse),
	.int_en_select_pulse	(int_en_select_pulse),
	.int_en_select_pulse_out	(stage_2_default_grp_int_en_select_pulse),
	.en_err_select	(en_err_select),
	.en_err_select_out	(stage_2_default_grp_en_err_select),
	.err_select_pulse	(err_select_pulse),
	.err_select_pulse_out	(stage_2_default_grp_err_select_pulse),
	.flta_select_pulse	(flta_select_pulse),
	.flta_select_pulse_out	(stage_2_default_grp_flta_select_pulse),
	.flts_select_pulse	(flts_select_pulse),
	.flts_select_pulse_out	(stage_2_default_grp_flts_select_pulse),
	.prfc_select_pulse	(prfc_select_pulse),
	.prfc_select_pulse_out	(stage_2_default_grp_prfc_select_pulse),
	.prf0_select_pulse	(prf0_select_pulse),
	.prf0_select_pulse_out	(stage_2_default_grp_prf0_select_pulse),
	.prf1_select_pulse	(prf1_select_pulse),
	.prf1_select_pulse_out	(stage_2_default_grp_prf1_select_pulse),
	.vtb_select	(vtb_select),
	.vtb_select_out	(stage_2_default_grp_vtb_select),
	.ptb_select	(ptb_select),
	.ptb_select_out	(stage_2_default_grp_ptb_select),
	.tdb_select	(tdb_select),
	.tdb_select_out	(stage_2_default_grp_tdb_select),
	.dev2iotsb_select	(dev2iotsb_select),
	.dev2iotsb_select_out	(stage_2_default_grp_dev2iotsb_select),
	.IotsbDesc_select	(IotsbDesc_select),
	.IotsbDesc_select_out	(stage_2_default_grp_IotsbDesc_select),
	.err_rw1c_alias	(err_rw1c_alias),
	.err_rw1c_alias_out	(stage_mux_only_err_rw1c_alias),
	.err_rw1s_alias	(err_rw1s_alias),
	.err_rw1s_alias_out	(stage_mux_only_err_rw1s_alias),
	.daemon_csrbus_wr_in	(daemon_csrbus_wr),
	.daemon_csrbus_wr_out	(stage_mux_only_daemon_csrbus_wr),
	.daemon_csrbus_wr_data_in	(daemon_csrbus_wr_data),
	.daemon_csrbus_wr_data_out	(stage_mux_only_daemon_csrbus_wr_data),
	.ext_addr_in	(daemon_csrbus_addr[8:0]),
	.ext_addr_out	(stage_mux_only_ext_addr),
	.read_data_0_out	(stage_mux_only_read_data_0_out),
	.ext_done_0_out	(stage_mux_only_ext_done_0_out),
	.rst_l	(rst_l),
	.rst_l_out	(stage_mux_only_rst_l),
	.por_l	(por_l),
	.por_l_out	(stage_mux_only_por_l)
	);

//----- OUTPUT: csrbus_read_data
assign csrbus_read_data = stage_mux_only_read_data_0_out;

endmodule // dmu_mmu_csr_csr
