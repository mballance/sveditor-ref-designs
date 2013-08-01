// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_csr_default_grp.v
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
module dmu_mmu_csr_default_grp 
	(
	clk,
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
	ctl_select_pulse,
	tsb_tb_hw_read,
	tsb_ps_hw_read,
	tsb_ts_hw_read,
	tsb_select_pulse,
	fsh_select_pulse,
	inv_ext_select,
	inv_select,
	log_en_hw_read,
	log_select_pulse,
	int_en_hw_read,
	int_en_select_pulse,
	en_err_select,
	en_err_ext_read_data,
	err_hw_set,
	err_hw_read,
	err_select_pulse,
	flta_va_hw_ld,
	flta_va_hw_write,
	flta_select_pulse,
	flts_entry_hw_ld,
	flts_entry_hw_write,
	flts_type_hw_ld,
	flts_type_hw_write,
	flts_id_hw_ld,
	flts_id_hw_write,
	flts_select_pulse,
	prfc_sel1_hw_read,
	prfc_sel0_hw_read,
	prfc_select_pulse,
	prf0_cnt_hw_write,
	prf0_cnt_hw_read,
	prf0_select_pulse,
	prf1_cnt_hw_write,
	prf1_cnt_hw_read,
	prf1_select_pulse,
	vtb_ext_select,
	vtb_select,
	vtb_ext_read_data,
	ptb_ext_select,
	ptb_select,
	ptb_ext_read_data,
	tdb_ext_select,
	tdb_select,
	tdb_ext_read_data,
	dev2iotsb_ext_select,
	dev2iotsb_select,
	dev2iotsb_ext_read_data,
	dev2iotsb_ext_done,
	IotsbDesc_ext_select,
	IotsbDesc_select,
	IotsbDesc_ext_read_data,
	IotsbDesc_ext_done,
	err_rw1c_alias,
	err_rw1s_alias,
	rst_l,
	por_l,
	daemon_csrbus_wr_in,
	daemon_csrbus_wr_out,
	daemon_csrbus_wr_data_in,
	daemon_csrbus_wr_data_out,
	ext_addr_in,
	ext_addr_out,
	read_data_0_out,
	read_data_1_out,
	ext_done_0_out
	);

//====================================================
//     Polarity declarations
//====================================================
input  clk;  // Clock signal
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
input  ctl_select_pulse;  // select
output [`FIRE_DLC_MMU_CSR_TSB_TB_INT_SLC] tsb_tb_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // tsb_tb.
output tsb_ps_hw_read;  // This signal provides the current value of tsb_ps.
output [`FIRE_DLC_MMU_CSR_TSB_TS_INT_SLC] tsb_ts_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // tsb_ts.
input  tsb_select_pulse;  // select
input  fsh_select_pulse;  // select
output inv_ext_select;  // When set, register inv is selected. This signal is a
                        // pulse.
input  inv_select;  // select
output [`FIRE_DLC_MMU_CSR_LOG_EN_INT_SLC] log_en_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // log_en.
input  log_select_pulse;  // select
output [`FIRE_DLC_MMU_CSR_INT_EN_WIDTH-1:0] int_en_hw_read;  // This signal
                                                             // provides the
                                                             // current value of
                                                             // int_en.
input  int_en_select_pulse;  // select
input  en_err_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] en_err_ext_read_data;  // Read Data
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
input  err_select_pulse;  // select
input  flta_va_hw_ld;  // Hardware load enable for flta_va. When set, <hw write
                       // signal>  will be loaded into flta.
input  [`FIRE_DLC_MMU_CSR_FLTA_VA_INT_SLC] flta_va_hw_write;  // data bus for hw
                                                              // loading of
                                                              // flta_va.
input  flta_select_pulse;  // select
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
input  flts_select_pulse;  // select
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
input  prfc_select_pulse;  // select
input  [`FIRE_DLC_MMU_CSR_PRF0_CNT_INT_SLC] prf0_cnt_hw_write;  // data bus for
                                                                // hw loading of
                                                                // prf0_cnt.
output [`FIRE_DLC_MMU_CSR_PRF0_CNT_INT_SLC] prf0_cnt_hw_read;  // This signal
                                                               // provides the
                                                               // current value
                                                               // of prf0_cnt.
input  prf0_select_pulse;  // select
input  [`FIRE_DLC_MMU_CSR_PRF1_CNT_INT_SLC] prf1_cnt_hw_write;  // data bus for
                                                                // hw loading of
                                                                // prf1_cnt.
output [`FIRE_DLC_MMU_CSR_PRF1_CNT_INT_SLC] prf1_cnt_hw_read;  // This signal
                                                               // provides the
                                                               // current value
                                                               // of prf1_cnt.
input  prf1_select_pulse;  // select
output vtb_ext_select;  // When set, register vtb is selected. This signal is a
                        // pulse.
input  vtb_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] vtb_ext_read_data;  // Read Data
output ptb_ext_select;  // When set, register ptb is selected. This signal is a
                        // pulse.
input  ptb_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] ptb_ext_read_data;  // Read Data
output tdb_ext_select;  // When set, register tdb is selected. This signal is a
                        // pulse.
input  tdb_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] tdb_ext_read_data;  // Read Data
output dev2iotsb_ext_select;  // When set, register dev2iotsb is selected. This
                              // signal is a pulse.
input  dev2iotsb_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] dev2iotsb_ext_read_data;  // Read Data
input  dev2iotsb_ext_done;  // ExtDone
output IotsbDesc_ext_select;  // When set, register IotsbDesc is selected. This
                              // signal is a pulse.
input  IotsbDesc_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] IotsbDesc_ext_read_data;  // Read Data
input  IotsbDesc_ext_done;  // ExtDone
input  err_rw1c_alias;  // SW load
input  err_rw1s_alias;  // SW load
input  rst_l;  // HW reset
input  por_l;  // HW reset
input  daemon_csrbus_wr_in;  // csrbus_wr
output daemon_csrbus_wr_out;  // csrbus_wr
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
output [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_out;  // SW write
                                                                 // data
input  [8:0] ext_addr_in;  // Ext addr
output [8:0] ext_addr_out;  // Ext addr
output [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data
output [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_1_out;  // Read Data
output ext_done_0_out;  // Ext Done

//====================================================
//     Type declarations
//====================================================
wire clk;  // Clock signal
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
wire ctl_select_pulse;  // select
wire [`FIRE_DLC_MMU_CSR_TSB_TB_INT_SLC] tsb_tb_hw_read;  // This signal provides
                                                         // the current value of
                                                         // tsb_tb.
wire tsb_ps_hw_read;  // This signal provides the current value of tsb_ps.
wire [`FIRE_DLC_MMU_CSR_TSB_TS_INT_SLC] tsb_ts_hw_read;  // This signal provides
                                                         // the current value of
                                                         // tsb_ts.
wire tsb_select_pulse;  // select
wire fsh_select_pulse;  // select
wire inv_ext_select;  // When set, register inv is selected. This signal is a
                      // pulse.
wire inv_select;  // select
wire [`FIRE_DLC_MMU_CSR_LOG_EN_INT_SLC] log_en_hw_read;  // This signal provides
                                                         // the current value of
                                                         // log_en.
wire log_select_pulse;  // select
wire [`FIRE_DLC_MMU_CSR_INT_EN_WIDTH-1:0] int_en_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // int_en.
wire int_en_select_pulse;  // select
wire en_err_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] en_err_ext_read_data;  // Read Data
wire [`FIRE_DLC_MMU_CSR_ERR_RW1C_ALIAS_WIDTH-1:0] err_hw_set;  // Hardware set
                                                               // signal for
                                                               // err. When set
                                                               // err will be
                                                               // set to one.
wire [`FIRE_DLC_MMU_CSR_ERR_RW1C_ALIAS_WIDTH-1:0] err_hw_read;  // This signal
                                                                // provides the
                                                                // current value
                                                                // of err.
wire err_select_pulse;  // select
wire flta_va_hw_ld;  // Hardware load enable for flta_va. When set, <hw write
                     // signal>  will be loaded into flta.
wire [`FIRE_DLC_MMU_CSR_FLTA_VA_INT_SLC] flta_va_hw_write;  // data bus for hw
                                                            // loading of
                                                            // flta_va.
wire flta_select_pulse;  // select
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
wire flts_select_pulse;  // select
wire [`FIRE_DLC_MMU_CSR_PRFC_SEL1_INT_SLC] prfc_sel1_hw_read;  // This signal
                                                               // provides the
                                                               // current value
                                                               // of prfc_sel1.
wire [`FIRE_DLC_MMU_CSR_PRFC_SEL0_INT_SLC] prfc_sel0_hw_read;  // This signal
                                                               // provides the
                                                               // current value
                                                               // of prfc_sel0.
wire prfc_select_pulse;  // select
wire [`FIRE_DLC_MMU_CSR_PRF0_CNT_INT_SLC] prf0_cnt_hw_write;  // data bus for hw
                                                              // loading of
                                                              // prf0_cnt.
wire [`FIRE_DLC_MMU_CSR_PRF0_CNT_INT_SLC] prf0_cnt_hw_read;  // This signal
                                                             // provides the
                                                             // current value of
                                                             // prf0_cnt.
wire prf0_select_pulse;  // select
wire [`FIRE_DLC_MMU_CSR_PRF1_CNT_INT_SLC] prf1_cnt_hw_write;  // data bus for hw
                                                              // loading of
                                                              // prf1_cnt.
wire [`FIRE_DLC_MMU_CSR_PRF1_CNT_INT_SLC] prf1_cnt_hw_read;  // This signal
                                                             // provides the
                                                             // current value of
                                                             // prf1_cnt.
wire prf1_select_pulse;  // select
wire vtb_ext_select;  // When set, register vtb is selected. This signal is a
                      // pulse.
wire vtb_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] vtb_ext_read_data;  // Read Data
wire ptb_ext_select;  // When set, register ptb is selected. This signal is a
                      // pulse.
wire ptb_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] ptb_ext_read_data;  // Read Data
wire tdb_ext_select;  // When set, register tdb is selected. This signal is a
                      // pulse.
wire tdb_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] tdb_ext_read_data;  // Read Data
wire dev2iotsb_ext_select;  // When set, register dev2iotsb is selected. This
                            // signal is a pulse.
wire dev2iotsb_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] dev2iotsb_ext_read_data;  // Read Data
wire dev2iotsb_ext_done;  // ExtDone
wire IotsbDesc_ext_select;  // When set, register IotsbDesc is selected. This
                            // signal is a pulse.
wire IotsbDesc_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] IotsbDesc_ext_read_data;  // Read Data
wire IotsbDesc_ext_done;  // ExtDone
wire err_rw1c_alias;  // SW load
wire err_rw1s_alias;  // SW load
wire rst_l;  // HW reset
wire por_l;  // HW reset
wire daemon_csrbus_wr_in;  // csrbus_wr
wire daemon_csrbus_wr_out;  // csrbus_wr
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_out;  // SW write data
wire [8:0] ext_addr_in;  // Ext addr
wire [8:0] ext_addr_out;  // Ext addr
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_1_out;  // Read Data
reg ext_done_0_out;  // Ext Done


//====================================================
//   Local signals
//====================================================
//----- For CSR register: ctl
wire [`FIRE_DLC_MMU_CSR_CTL_WIDTH-1:0] ctl_csrbus_read_data;  // Entry Based
                                                              // Read Data

//----- For CSR register: tsb
wire [`FIRE_DLC_MMU_CSR_TSB_WIDTH-1:0] tsb_csrbus_read_data;  // Entry Based
                                                              // Read Data

//----- For CSR register: fsh
wire [`FIRE_DLC_MMU_CSR_FSH_WIDTH-1:0] fsh_csrbus_read_data;  // Entry Based
                                                              // Read Data

//----- For CSR register: log
wire [`FIRE_DLC_MMU_CSR_LOG_WIDTH-1:0] log_csrbus_read_data;  // Entry Based
                                                              // Read Data

//----- For CSR register: int_en
wire [`FIRE_DLC_MMU_CSR_INT_EN_WIDTH-1:0] int_en_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: err
wire [`FIRE_DLC_MMU_CSR_ERR_RW1C_ALIAS_WIDTH-1:0] err_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: flta
wire [`FIRE_DLC_MMU_CSR_FLTA_WIDTH-1:0] flta_csrbus_read_data;  // Entry Based
                                                                // Read Data

//----- For CSR register: flts
wire [`FIRE_DLC_MMU_CSR_FLTS_WIDTH-1:0] flts_csrbus_read_data;  // Entry Based
                                                                // Read Data

//----- For CSR register: prfc
wire [`FIRE_DLC_MMU_CSR_PRFC_WIDTH-1:0] prfc_csrbus_read_data;  // Entry Based
                                                                // Read Data

//----- For CSR register: prf0
wire [`FIRE_DLC_MMU_CSR_PRF0_WIDTH-1:0] prf0_csrbus_read_data;  // Entry Based
                                                                // Read Data

//----- For CSR register: prf1
wire [`FIRE_DLC_MMU_CSR_PRF1_WIDTH-1:0] prf1_csrbus_read_data;  // Entry Based
                                                                // Read Data


//====================================================
//     Pipelining (First stage)
//====================================================
//----- delayed select for ext_select
reg inv_select_piped;
reg inv_select_piped_delayed;
reg vtb_select_piped;
reg vtb_select_piped_delayed;
reg ptb_select_piped;
reg ptb_select_piped_delayed;
reg tdb_select_piped;
reg tdb_select_piped_delayed;
reg dev2iotsb_select_piped;
reg dev2iotsb_select_piped_delayed;
reg IotsbDesc_select_piped;
reg IotsbDesc_select_piped_delayed;

always @(posedge clk)
  begin
     if(~rst_l)
       begin
          ext_done_0_out <= 1'b0;
          inv_select_piped <= 1'b0;
          inv_select_piped_delayed <= 1'b0;
          vtb_select_piped <= 1'b0;
          vtb_select_piped_delayed <= 1'b0;
          ptb_select_piped <= 1'b0;
          ptb_select_piped_delayed <= 1'b0;
          tdb_select_piped <= 1'b0;
          tdb_select_piped_delayed <= 1'b0;
          dev2iotsb_select_piped <= 1'b0;
          dev2iotsb_select_piped_delayed <= 1'b0;
          IotsbDesc_select_piped <= 1'b0;
          IotsbDesc_select_piped_delayed <= 1'b0;
       end
     else
       begin
          ext_done_0_out <=
             dev2iotsb_ext_done |
             IotsbDesc_ext_done;

          inv_select_piped <= inv_select;
          inv_select_piped_delayed <= inv_select_piped;
          vtb_select_piped <= vtb_select;
          vtb_select_piped_delayed <= vtb_select_piped;
          ptb_select_piped <= ptb_select;
          ptb_select_piped_delayed <= ptb_select_piped;
          tdb_select_piped <= tdb_select;
          tdb_select_piped_delayed <= tdb_select_piped;
          dev2iotsb_select_piped <= dev2iotsb_select;
          dev2iotsb_select_piped_delayed <= dev2iotsb_select_piped;
          IotsbDesc_select_piped <= IotsbDesc_select;
          IotsbDesc_select_piped_delayed <= IotsbDesc_select_piped;
        end
  end

//====================================================
//     Assignments only (first stage)
//====================================================
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data = daemon_csrbus_wr_data_in;
wire daemon_csrbus_wr      = daemon_csrbus_wr_in;
assign daemon_csrbus_wr_out      = daemon_csrbus_wr_in;
assign daemon_csrbus_wr_data_out = daemon_csrbus_wr_data_in;
assign ext_addr_out = ext_addr_in;

//====================================================
//      Automatic hw_ld / hw_write
//====================================================

//====================================================
//      Extern select
//====================================================
assign inv_ext_select =
           inv_select_piped&
           ~inv_select_piped_delayed;

// inv_ext_select is a pulse
/* 0in assert_timer -name inv_ext_select_pulse
       -var inv_ext_select -max 1
       -message "inv_ext_select pulse length is not 1"
       -clock clk
*/

assign vtb_ext_select =
           vtb_select_piped&
           ~vtb_select_piped_delayed;

// vtb_ext_select is a pulse
/* 0in assert_timer -name vtb_ext_select_pulse
       -var vtb_ext_select -max 1
       -message "vtb_ext_select pulse length is not 1"
       -clock clk
*/

assign ptb_ext_select =
           ptb_select_piped&
           ~ptb_select_piped_delayed;

// ptb_ext_select is a pulse
/* 0in assert_timer -name ptb_ext_select_pulse
       -var ptb_ext_select -max 1
       -message "ptb_ext_select pulse length is not 1"
       -clock clk
*/

assign tdb_ext_select =
           tdb_select_piped&
           ~tdb_select_piped_delayed;

// tdb_ext_select is a pulse
/* 0in assert_timer -name tdb_ext_select_pulse
       -var tdb_ext_select -max 1
       -message "tdb_ext_select pulse length is not 1"
       -clock clk
*/

assign dev2iotsb_ext_select =
           dev2iotsb_select_piped&
           ~dev2iotsb_select_piped_delayed;

// dev2iotsb_ext_select is a pulse
/* 0in assert_timer -name dev2iotsb_ext_select_pulse
       -var dev2iotsb_ext_select -max 1
       -message "dev2iotsb_ext_select pulse length is not 1"
       -clock clk
*/

assign IotsbDesc_ext_select =
           IotsbDesc_select_piped&
           ~IotsbDesc_select_piped_delayed;

// IotsbDesc_ext_select is a pulse
/* 0in assert_timer -name IotsbDesc_ext_select_pulse
       -var IotsbDesc_ext_select -max 1
       -message "IotsbDesc_ext_select pulse length is not 1"
       -clock clk
*/


//=====================================================
//      OUTPUT: read_data_out
//=====================================================
dmu_mmu_csr_csrpipe_15 dmu_mmu_csr_csrpipe_15_inst_1
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.reg_in	(1'b1),
	.reg_out	(1'b1),
	.data0	(ctl_csrbus_read_data),
	.sel0	(ctl_select_pulse),
	.data1	(tsb_csrbus_read_data),
	.sel1	(tsb_select_pulse),
	.data2	(fsh_csrbus_read_data),
	.sel2	(fsh_select_pulse),
	.data3	(log_csrbus_read_data),
	.sel3	(log_select_pulse),
	.data4	(int_en_csrbus_read_data),
	.sel4	(int_en_select_pulse),
	.data5	(en_err_ext_read_data),
	.sel5	(en_err_select),
	.data6	(err_csrbus_read_data),
	.sel6	(err_select_pulse),
	.data7	(flta_csrbus_read_data),
	.sel7	(flta_select_pulse),
	.data8	(flts_csrbus_read_data),
	.sel8	(flts_select_pulse),
	.data9	(prfc_csrbus_read_data),
	.sel9	(prfc_select_pulse),
	.data10	(prf0_csrbus_read_data),
	.sel10	(prf0_select_pulse),
	.data11	(prf1_csrbus_read_data),
	.sel11	(prf1_select_pulse),
	.data12	(vtb_ext_read_data),
	.sel12	(vtb_select),
	.data13	(ptb_ext_read_data),
	.sel13	(ptb_select),
	.data14	(tdb_ext_read_data),
	.sel14	(tdb_select),
	.out	(read_data_0_out)
	);

dmu_mmu_csr_csrpipe_15 dmu_mmu_csr_csrpipe_15_inst_2
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.reg_in	(1'b1),
	.reg_out	(1'b1),
	.data0	(dev2iotsb_ext_read_data),
	.sel0	(dev2iotsb_select),
	.data1	(IotsbDesc_ext_read_data),
	.sel1	(IotsbDesc_select),
	.data2	(64'b0),
	.sel2	(1'b1),
	.data3	(64'b0),
	.sel3	(1'b1),
	.data4	(64'b0),
	.sel4	(1'b1),
	.data5	(64'b0),
	.sel5	(1'b1),
	.data6	(64'b0),
	.sel6	(1'b1),
	.data7	(64'b0),
	.sel7	(1'b1),
	.data8	(64'b0),
	.sel8	(1'b1),
	.data9	(64'b0),
	.sel9	(1'b1),
	.data10	(64'b0),
	.sel10	(1'b1),
	.data11	(64'b0),
	.sel11	(1'b1),
	.data12	(64'b0),
	.sel12	(1'b1),
	.data13	(64'b0),
	.sel13	(1'b1),
	.data14	(64'b0),
	.sel14	(1'b1),
	.out	(read_data_1_out)
	);


//====================================================
//     Instantiation of registers
//====================================================

wire ctl_w_ld =ctl_select_pulse & daemon_csrbus_wr;

dmu_mmu_csr_ctl ctl
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.ctl_w_ld	(ctl_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.ctl_csrbus_read_data	(ctl_csrbus_read_data),
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
	.ctl_te_hw_read	(ctl_te_hw_read)
	);

wire tsb_w_ld =tsb_select_pulse & daemon_csrbus_wr;

dmu_mmu_csr_tsb tsb
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.tsb_w_ld	(tsb_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.tsb_csrbus_read_data	(tsb_csrbus_read_data),
	.tsb_tb_hw_read	(tsb_tb_hw_read),
	.tsb_ps_hw_read	(tsb_ps_hw_read),
	.tsb_ts_hw_read	(tsb_ts_hw_read)
	);

wire fsh_w_ld =fsh_select_pulse & daemon_csrbus_wr;

dmu_mmu_csr_fsh fsh
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.fsh_w_ld	(fsh_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.fsh_csrbus_read_data	(fsh_csrbus_read_data)
	);

wire log_w_ld =log_select_pulse & daemon_csrbus_wr;

dmu_mmu_csr_log log
	(
	.clk	(clk),
	.por_l	(por_l),
	.log_w_ld	(log_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.log_csrbus_read_data	(log_csrbus_read_data),
	.log_en_hw_read	(log_en_hw_read)
	);

wire int_en_w_ld =int_en_select_pulse & daemon_csrbus_wr;

dmu_mmu_csr_int_en int_en
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.int_en_w_ld	(int_en_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.int_en_csrbus_read_data	(int_en_csrbus_read_data),
	.int_en_hw_read	(int_en_hw_read)
	);

wire err_w_ld =err_select_pulse & daemon_csrbus_wr;

dmu_mmu_csr_err err
	(
	.clk	(clk),
	.por_l	(por_l),
	.err_w_ld	(err_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.rw1c_alias	(err_rw1c_alias),
	.rw1s_alias	(err_rw1s_alias),
	.err_csrbus_read_data	(err_csrbus_read_data),
	.err_hw_set	(err_hw_set),
	.err_hw_read	(err_hw_read)
	);

wire flta_w_ld =flta_select_pulse & daemon_csrbus_wr;

dmu_mmu_csr_flta flta
	(
	.clk	(clk),
	.por_l	(por_l),
	.flta_w_ld	(flta_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.flta_csrbus_read_data	(flta_csrbus_read_data),
	.flta_va_hw_ld	(flta_va_hw_ld),
	.flta_va_hw_write	(flta_va_hw_write)
	);

wire flts_w_ld =flts_select_pulse & daemon_csrbus_wr;

dmu_mmu_csr_flts flts
	(
	.clk	(clk),
	.por_l	(por_l),
	.flts_w_ld	(flts_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.flts_csrbus_read_data	(flts_csrbus_read_data),
	.flts_entry_hw_ld	(flts_entry_hw_ld),
	.flts_entry_hw_write	(flts_entry_hw_write),
	.flts_type_hw_ld	(flts_type_hw_ld),
	.flts_type_hw_write	(flts_type_hw_write),
	.flts_id_hw_ld	(flts_id_hw_ld),
	.flts_id_hw_write	(flts_id_hw_write)
	);

wire prfc_w_ld =prfc_select_pulse & daemon_csrbus_wr;

dmu_mmu_csr_prfc prfc
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.prfc_w_ld	(prfc_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.prfc_csrbus_read_data	(prfc_csrbus_read_data),
	.prfc_sel1_hw_read	(prfc_sel1_hw_read),
	.prfc_sel0_hw_read	(prfc_sel0_hw_read)
	);

wire prf0_w_ld =prf0_select_pulse & daemon_csrbus_wr;

dmu_mmu_csr_prf0 prf0
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.prf0_w_ld	(prf0_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.prf0_csrbus_read_data	(prf0_csrbus_read_data),
	.prf0_cnt_hw_write	(prf0_cnt_hw_write),
	.prf0_cnt_hw_read	(prf0_cnt_hw_read)
	);

wire prf1_w_ld =prf1_select_pulse & daemon_csrbus_wr;

dmu_mmu_csr_prf1 prf1
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.prf1_w_ld	(prf1_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.prf1_csrbus_read_data	(prf1_csrbus_read_data),
	.prf1_cnt_hw_write	(prf1_cnt_hw_write),
	.prf1_cnt_hw_read	(prf1_cnt_hw_read)
	);

endmodule // dmu_mmu_csr_default_grp
