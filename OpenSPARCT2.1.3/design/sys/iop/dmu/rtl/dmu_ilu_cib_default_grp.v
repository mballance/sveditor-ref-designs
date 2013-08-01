// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_ilu_cib_default_grp.v
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
module dmu_ilu_cib_default_grp
	(
	clk,
	ilu_log_en_spare3_hw_read,
	ilu_log_en_spare2_hw_read,
	ilu_log_en_spare1_hw_read,
	ilu_log_en_ihb_pe_hw_read,
	ilu_log_en_select_pulse,
	ilu_int_en_spare3_s_hw_read,
	ilu_int_en_spare2_s_hw_read,
	ilu_int_en_spare1_s_hw_read,
	ilu_int_en_ihb_pe_s_hw_read,
	ilu_int_en_spare3_p_hw_read,
	ilu_int_en_spare2_p_hw_read,
	ilu_int_en_spare1_p_hw_read,
	ilu_int_en_ihb_pe_p_hw_read,
	ilu_int_en_select_pulse,
	ilu_en_err_select,
	ilu_en_err_ext_read_data,
	ilu_log_err_spare3_s_hw_set,
	ilu_log_err_spare3_s_hw_read,
	ilu_log_err_spare2_s_hw_set,
	ilu_log_err_spare2_s_hw_read,
	ilu_log_err_spare1_s_hw_set,
	ilu_log_err_spare1_s_hw_read,
	ilu_log_err_ihb_pe_s_hw_set,
	ilu_log_err_ihb_pe_s_hw_read,
	ilu_log_err_spare3_p_hw_set,
	ilu_log_err_spare3_p_hw_read,
	ilu_log_err_spare2_p_hw_set,
	ilu_log_err_spare2_p_hw_read,
	ilu_log_err_spare1_p_hw_set,
	ilu_log_err_spare1_p_hw_read,
	ilu_log_err_ihb_pe_p_hw_set,
	ilu_log_err_ihb_pe_p_hw_read,
	ilu_log_err_select_pulse,
	pec_int_en_pec_hw_read,
	pec_int_en_pec_ilu_hw_read,
	pec_int_en_pec_ue_hw_read,
	pec_int_en_pec_ce_hw_read,
	pec_int_en_pec_oe_hw_read,
	pec_int_en_select_pulse,
	pec_en_err_select,
	pec_en_err_ext_read_data,
	ilu_diagnos_enpll1_hw_read,
	ilu_diagnos_enpll0_hw_read,
	ilu_diagnos_entx7_hw_read,
	ilu_diagnos_entx6_hw_read,
	ilu_diagnos_entx5_hw_read,
	ilu_diagnos_entx4_hw_read,
	ilu_diagnos_entx3_hw_read,
	ilu_diagnos_entx2_hw_read,
	ilu_diagnos_entx1_hw_read,
	ilu_diagnos_entx0_hw_read,
	ilu_diagnos_enrx7_hw_read,
	ilu_diagnos_enrx6_hw_read,
	ilu_diagnos_enrx5_hw_read,
	ilu_diagnos_enrx4_hw_read,
	ilu_diagnos_enrx3_hw_read,
	ilu_diagnos_enrx2_hw_read,
	ilu_diagnos_enrx1_hw_read,
	ilu_diagnos_enrx0_hw_read,
	ilu_diagnos_edi_par_hw_read,
	ilu_diagnos_ehi_par_hw_read,
	ilu_diagnos_edi_trig_hw_clr,
	ilu_diagnos_edi_trig_hw_read,
	ilu_diagnos_ehi_trig_hw_clr,
	ilu_diagnos_ehi_trig_hw_read,
	ilu_diagnos_rate_scale_hw_read,
	ilu_diagnos_select_pulse,
	ilu_log_err_rw1c_alias,
	ilu_log_err_rw1s_alias,
	rst_l,
	por_l,
	daemon_csrbus_wr_in,
	daemon_csrbus_wr_data_in,
	read_data_0_out,
	read_data_1_out
	);

//====================================================
//     Polarity declarations
//====================================================
input  clk;  // Clock signal
output ilu_log_en_spare3_hw_read;  // This signal provides the current value of
                                   // ilu_log_en_spare3.
output ilu_log_en_spare2_hw_read;  // This signal provides the current value of
                                   // ilu_log_en_spare2.
output ilu_log_en_spare1_hw_read;  // This signal provides the current value of
                                   // ilu_log_en_spare1.
output ilu_log_en_ihb_pe_hw_read;  // This signal provides the current value of
                                   // ilu_log_en_ihb_pe.
input  ilu_log_en_select_pulse;  // select
output ilu_int_en_spare3_s_hw_read;  // This signal provides the current value
                                     // of ilu_int_en_spare3_s.
output ilu_int_en_spare2_s_hw_read;  // This signal provides the current value
                                     // of ilu_int_en_spare2_s.
output ilu_int_en_spare1_s_hw_read;  // This signal provides the current value
                                     // of ilu_int_en_spare1_s.
output ilu_int_en_ihb_pe_s_hw_read;  // This signal provides the current value
                                     // of ilu_int_en_ihb_pe_s.
output ilu_int_en_spare3_p_hw_read;  // This signal provides the current value
                                     // of ilu_int_en_spare3_p.
output ilu_int_en_spare2_p_hw_read;  // This signal provides the current value
                                     // of ilu_int_en_spare2_p.
output ilu_int_en_spare1_p_hw_read;  // This signal provides the current value
                                     // of ilu_int_en_spare1_p.
output ilu_int_en_ihb_pe_p_hw_read;  // This signal provides the current value
                                     // of ilu_int_en_ihb_pe_p.
input  ilu_int_en_select_pulse;  // select
input  ilu_en_err_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] ilu_en_err_ext_read_data;  // Read Data
input  ilu_log_err_spare3_s_hw_set;  // Hardware set signal for
                                     // ilu_log_err_spare3_s. When set
                                     // ilu_log_err will be set to one.
output ilu_log_err_spare3_s_hw_read;  // This signal provides the current value
                                      // of ilu_log_err_spare3_s.
input  ilu_log_err_spare2_s_hw_set;  // Hardware set signal for
                                     // ilu_log_err_spare2_s. When set
                                     // ilu_log_err will be set to one.
output ilu_log_err_spare2_s_hw_read;  // This signal provides the current value
                                      // of ilu_log_err_spare2_s.
input  ilu_log_err_spare1_s_hw_set;  // Hardware set signal for
                                     // ilu_log_err_spare1_s. When set
                                     // ilu_log_err will be set to one.
output ilu_log_err_spare1_s_hw_read;  // This signal provides the current value
                                      // of ilu_log_err_spare1_s.
input  ilu_log_err_ihb_pe_s_hw_set;  // Hardware set signal for
                                     // ilu_log_err_ihb_pe_s. When set
                                     // ilu_log_err will be set to one.
output ilu_log_err_ihb_pe_s_hw_read;  // This signal provides the current value
                                      // of ilu_log_err_ihb_pe_s.
input  ilu_log_err_spare3_p_hw_set;  // Hardware set signal for
                                     // ilu_log_err_spare3_p. When set
                                     // ilu_log_err will be set to one.
output ilu_log_err_spare3_p_hw_read;  // This signal provides the current value
                                      // of ilu_log_err_spare3_p.
input  ilu_log_err_spare2_p_hw_set;  // Hardware set signal for
                                     // ilu_log_err_spare2_p. When set
                                     // ilu_log_err will be set to one.
output ilu_log_err_spare2_p_hw_read;  // This signal provides the current value
                                      // of ilu_log_err_spare2_p.
input  ilu_log_err_spare1_p_hw_set;  // Hardware set signal for
                                     // ilu_log_err_spare1_p. When set
                                     // ilu_log_err will be set to one.
output ilu_log_err_spare1_p_hw_read;  // This signal provides the current value
                                      // of ilu_log_err_spare1_p.
input  ilu_log_err_ihb_pe_p_hw_set;  // Hardware set signal for
                                     // ilu_log_err_ihb_pe_p. When set
                                     // ilu_log_err will be set to one.
output ilu_log_err_ihb_pe_p_hw_read;  // This signal provides the current value
                                      // of ilu_log_err_ihb_pe_p.
input  ilu_log_err_select_pulse;  // select
output pec_int_en_pec_hw_read;  // This signal provides the current value of
                                // pec_int_en_pec.
output pec_int_en_pec_ilu_hw_read;  // This signal provides the current value of
                                    // pec_int_en_pec_ilu.
output pec_int_en_pec_ue_hw_read;  // This signal provides the current value of
                                   // pec_int_en_pec_ue.
output pec_int_en_pec_ce_hw_read;  // This signal provides the current value of
                                   // pec_int_en_pec_ce.
output pec_int_en_pec_oe_hw_read;  // This signal provides the current value of
                                   // pec_int_en_pec_oe.
input  pec_int_en_select_pulse;  // select
input  pec_en_err_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] pec_en_err_ext_read_data;  // Read Data
output ilu_diagnos_enpll1_hw_read;  // This signal provides the current value of
                                    // ilu_diagnos_enpll1.
output ilu_diagnos_enpll0_hw_read;  // This signal provides the current value of
                                    // ilu_diagnos_enpll0.
output ilu_diagnos_entx7_hw_read;  // This signal provides the current value of
                                   // ilu_diagnos_entx7.
output ilu_diagnos_entx6_hw_read;  // This signal provides the current value of
                                   // ilu_diagnos_entx6.
output ilu_diagnos_entx5_hw_read;  // This signal provides the current value of
                                   // ilu_diagnos_entx5.
output ilu_diagnos_entx4_hw_read;  // This signal provides the current value of
                                   // ilu_diagnos_entx4.
output ilu_diagnos_entx3_hw_read;  // This signal provides the current value of
                                   // ilu_diagnos_entx3.
output ilu_diagnos_entx2_hw_read;  // This signal provides the current value of
                                   // ilu_diagnos_entx2.
output ilu_diagnos_entx1_hw_read;  // This signal provides the current value of
                                   // ilu_diagnos_entx1.
output ilu_diagnos_entx0_hw_read;  // This signal provides the current value of
                                   // ilu_diagnos_entx0.
output ilu_diagnos_enrx7_hw_read;  // This signal provides the current value of
                                   // ilu_diagnos_enrx7.
output ilu_diagnos_enrx6_hw_read;  // This signal provides the current value of
                                   // ilu_diagnos_enrx6.
output ilu_diagnos_enrx5_hw_read;  // This signal provides the current value of
                                   // ilu_diagnos_enrx5.
output ilu_diagnos_enrx4_hw_read;  // This signal provides the current value of
                                   // ilu_diagnos_enrx4.
output ilu_diagnos_enrx3_hw_read;  // This signal provides the current value of
                                   // ilu_diagnos_enrx3.
output ilu_diagnos_enrx2_hw_read;  // This signal provides the current value of
                                   // ilu_diagnos_enrx2.
output ilu_diagnos_enrx1_hw_read;  // This signal provides the current value of
                                   // ilu_diagnos_enrx1.
output ilu_diagnos_enrx0_hw_read;  // This signal provides the current value of
                                   // ilu_diagnos_enrx0.
output [`FIRE_DLC_ILU_CIB_CSR_ILU_DIAGNOS_EDI_PAR_INT_SLC] ilu_diagnos_edi_par_hw_read;
    // This signal provides the current value of ilu_diagnos_edi_par.
output [`FIRE_DLC_ILU_CIB_CSR_ILU_DIAGNOS_EHI_PAR_INT_SLC] ilu_diagnos_ehi_par_hw_read;
    // This signal provides the current value of ilu_diagnos_ehi_par.
input  ilu_diagnos_edi_trig_hw_clr;  // Hardware clear signal for
                                     // ilu_diagnos_edi_trig. When set
                                     // ilu_diagnos will be set to zero.
output ilu_diagnos_edi_trig_hw_read;  // This signal provides the current value
                                      // of ilu_diagnos_edi_trig.
input  ilu_diagnos_ehi_trig_hw_clr;  // Hardware clear signal for
                                     // ilu_diagnos_ehi_trig. When set
                                     // ilu_diagnos will be set to zero.
output ilu_diagnos_ehi_trig_hw_read;  // This signal provides the current value
                                      // of ilu_diagnos_ehi_trig.
output [`FIRE_DLC_ILU_CIB_CSR_ILU_DIAGNOS_RATE_SCALE_INT_SLC] ilu_diagnos_rate_scale_hw_read;
    // This signal provides the current value of ilu_diagnos_rate_scale.
input  ilu_diagnos_select_pulse;  // select
input  ilu_log_err_rw1c_alias;  // SW load
input  ilu_log_err_rw1s_alias;  // SW load
input  rst_l;  // HW reset
input  por_l;  // HW reset
input  daemon_csrbus_wr_in;  // csrbus_wr
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
output [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data
output [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_1_out;  // Read Data

//====================================================
//     Type declarations
//====================================================
wire clk;  // Clock signal
wire ilu_log_en_spare3_hw_read;  // This signal provides the current value of
                                 // ilu_log_en_spare3.
wire ilu_log_en_spare2_hw_read;  // This signal provides the current value of
                                 // ilu_log_en_spare2.
wire ilu_log_en_spare1_hw_read;  // This signal provides the current value of
                                 // ilu_log_en_spare1.
wire ilu_log_en_ihb_pe_hw_read;  // This signal provides the current value of
                                 // ilu_log_en_ihb_pe.
wire ilu_log_en_select_pulse;  // select
wire ilu_int_en_spare3_s_hw_read;  // This signal provides the current value of
                                   // ilu_int_en_spare3_s.
wire ilu_int_en_spare2_s_hw_read;  // This signal provides the current value of
                                   // ilu_int_en_spare2_s.
wire ilu_int_en_spare1_s_hw_read;  // This signal provides the current value of
                                   // ilu_int_en_spare1_s.
wire ilu_int_en_ihb_pe_s_hw_read;  // This signal provides the current value of
                                   // ilu_int_en_ihb_pe_s.
wire ilu_int_en_spare3_p_hw_read;  // This signal provides the current value of
                                   // ilu_int_en_spare3_p.
wire ilu_int_en_spare2_p_hw_read;  // This signal provides the current value of
                                   // ilu_int_en_spare2_p.
wire ilu_int_en_spare1_p_hw_read;  // This signal provides the current value of
                                   // ilu_int_en_spare1_p.
wire ilu_int_en_ihb_pe_p_hw_read;  // This signal provides the current value of
                                   // ilu_int_en_ihb_pe_p.
wire ilu_int_en_select_pulse;  // select
wire ilu_en_err_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] ilu_en_err_ext_read_data;  // Read Data
wire ilu_log_err_spare3_s_hw_set;  // Hardware set signal for
                                   // ilu_log_err_spare3_s. When set ilu_log_err
                                   // will be set to one.
wire ilu_log_err_spare3_s_hw_read;  // This signal provides the current value of
                                    // ilu_log_err_spare3_s.
wire ilu_log_err_spare2_s_hw_set;  // Hardware set signal for
                                   // ilu_log_err_spare2_s. When set ilu_log_err
                                   // will be set to one.
wire ilu_log_err_spare2_s_hw_read;  // This signal provides the current value of
                                    // ilu_log_err_spare2_s.
wire ilu_log_err_spare1_s_hw_set;  // Hardware set signal for
                                   // ilu_log_err_spare1_s. When set ilu_log_err
                                   // will be set to one.
wire ilu_log_err_spare1_s_hw_read;  // This signal provides the current value of
                                    // ilu_log_err_spare1_s.
wire ilu_log_err_ihb_pe_s_hw_set;  // Hardware set signal for
                                   // ilu_log_err_ihb_pe_s. When set ilu_log_err
                                   // will be set to one.
wire ilu_log_err_ihb_pe_s_hw_read;  // This signal provides the current value of
                                    // ilu_log_err_ihb_pe_s.
wire ilu_log_err_spare3_p_hw_set;  // Hardware set signal for
                                   // ilu_log_err_spare3_p. When set ilu_log_err
                                   // will be set to one.
wire ilu_log_err_spare3_p_hw_read;  // This signal provides the current value of
                                    // ilu_log_err_spare3_p.
wire ilu_log_err_spare2_p_hw_set;  // Hardware set signal for
                                   // ilu_log_err_spare2_p. When set ilu_log_err
                                   // will be set to one.
wire ilu_log_err_spare2_p_hw_read;  // This signal provides the current value of
                                    // ilu_log_err_spare2_p.
wire ilu_log_err_spare1_p_hw_set;  // Hardware set signal for
                                   // ilu_log_err_spare1_p. When set ilu_log_err
                                   // will be set to one.
wire ilu_log_err_spare1_p_hw_read;  // This signal provides the current value of
                                    // ilu_log_err_spare1_p.
wire ilu_log_err_ihb_pe_p_hw_set;  // Hardware set signal for
                                   // ilu_log_err_ihb_pe_p. When set ilu_log_err
                                   // will be set to one.
wire ilu_log_err_ihb_pe_p_hw_read;  // This signal provides the current value of
                                    // ilu_log_err_ihb_pe_p.
wire ilu_log_err_select_pulse;  // select
wire pec_int_en_pec_hw_read;  // This signal provides the current value of
                              // pec_int_en_pec.
wire pec_int_en_pec_ilu_hw_read;  // This signal provides the current value of
                                  // pec_int_en_pec_ilu.
wire pec_int_en_pec_ue_hw_read;  // This signal provides the current value of
                                 // pec_int_en_pec_ue.
wire pec_int_en_pec_ce_hw_read;  // This signal provides the current value of
                                 // pec_int_en_pec_ce.
wire pec_int_en_pec_oe_hw_read;  // This signal provides the current value of
                                 // pec_int_en_pec_oe.
wire pec_int_en_select_pulse;  // select
wire pec_en_err_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] pec_en_err_ext_read_data;  // Read Data
wire ilu_diagnos_enpll1_hw_read;  // This signal provides the current value of
                                  // ilu_diagnos_enpll1.
wire ilu_diagnos_enpll0_hw_read;  // This signal provides the current value of
                                  // ilu_diagnos_enpll0.
wire ilu_diagnos_entx7_hw_read;  // This signal provides the current value of
                                 // ilu_diagnos_entx7.
wire ilu_diagnos_entx6_hw_read;  // This signal provides the current value of
                                 // ilu_diagnos_entx6.
wire ilu_diagnos_entx5_hw_read;  // This signal provides the current value of
                                 // ilu_diagnos_entx5.
wire ilu_diagnos_entx4_hw_read;  // This signal provides the current value of
                                 // ilu_diagnos_entx4.
wire ilu_diagnos_entx3_hw_read;  // This signal provides the current value of
                                 // ilu_diagnos_entx3.
wire ilu_diagnos_entx2_hw_read;  // This signal provides the current value of
                                 // ilu_diagnos_entx2.
wire ilu_diagnos_entx1_hw_read;  // This signal provides the current value of
                                 // ilu_diagnos_entx1.
wire ilu_diagnos_entx0_hw_read;  // This signal provides the current value of
                                 // ilu_diagnos_entx0.
wire ilu_diagnos_enrx7_hw_read;  // This signal provides the current value of
                                 // ilu_diagnos_enrx7.
wire ilu_diagnos_enrx6_hw_read;  // This signal provides the current value of
                                 // ilu_diagnos_enrx6.
wire ilu_diagnos_enrx5_hw_read;  // This signal provides the current value of
                                 // ilu_diagnos_enrx5.
wire ilu_diagnos_enrx4_hw_read;  // This signal provides the current value of
                                 // ilu_diagnos_enrx4.
wire ilu_diagnos_enrx3_hw_read;  // This signal provides the current value of
                                 // ilu_diagnos_enrx3.
wire ilu_diagnos_enrx2_hw_read;  // This signal provides the current value of
                                 // ilu_diagnos_enrx2.
wire ilu_diagnos_enrx1_hw_read;  // This signal provides the current value of
                                 // ilu_diagnos_enrx1.
wire ilu_diagnos_enrx0_hw_read;  // This signal provides the current value of
                                 // ilu_diagnos_enrx0.
wire [`FIRE_DLC_ILU_CIB_CSR_ILU_DIAGNOS_EDI_PAR_INT_SLC] ilu_diagnos_edi_par_hw_read;
    // This signal provides the current value of ilu_diagnos_edi_par.
wire [`FIRE_DLC_ILU_CIB_CSR_ILU_DIAGNOS_EHI_PAR_INT_SLC] ilu_diagnos_ehi_par_hw_read;
    // This signal provides the current value of ilu_diagnos_ehi_par.
wire ilu_diagnos_edi_trig_hw_clr;  // Hardware clear signal for
                                   // ilu_diagnos_edi_trig. When set ilu_diagnos
                                   // will be set to zero.
wire ilu_diagnos_edi_trig_hw_read;  // This signal provides the current value of
                                    // ilu_diagnos_edi_trig.
wire ilu_diagnos_ehi_trig_hw_clr;  // Hardware clear signal for
                                   // ilu_diagnos_ehi_trig. When set ilu_diagnos
                                   // will be set to zero.
wire ilu_diagnos_ehi_trig_hw_read;  // This signal provides the current value of
                                    // ilu_diagnos_ehi_trig.
wire [`FIRE_DLC_ILU_CIB_CSR_ILU_DIAGNOS_RATE_SCALE_INT_SLC] ilu_diagnos_rate_scale_hw_read;
    // This signal provides the current value of ilu_diagnos_rate_scale.
wire ilu_diagnos_select_pulse;  // select
wire ilu_log_err_rw1c_alias;  // SW load
wire ilu_log_err_rw1s_alias;  // SW load
wire rst_l;  // HW reset
wire por_l;  // HW reset
wire daemon_csrbus_wr_in;  // csrbus_wr
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_1_out;  // Read Data


//====================================================
//   Local signals
//====================================================
//----- For CSR register: ilu_log_en
wire [`FIRE_DLC_ILU_CIB_CSR_ILU_LOG_EN_WIDTH-1:0] ilu_log_en_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: ilu_int_en
wire [`FIRE_DLC_ILU_CIB_CSR_ILU_INT_EN_WIDTH-1:0] ilu_int_en_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: ilu_log_err
wire [`FIRE_DLC_ILU_CIB_CSR_ILU_LOG_ERR_RW1C_ALIAS_WIDTH-1:0] ilu_log_err_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: pec_int_en
wire [`FIRE_DLC_ILU_CIB_CSR_PEC_INT_EN_WIDTH-1:0] pec_int_en_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: ilu_diagnos
wire [`FIRE_DLC_ILU_CIB_CSR_ILU_DIAGNOS_WIDTH-1:0] ilu_diagnos_csrbus_read_data;
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
dmu_ilu_cib_csrpipe_6 dmu_ilu_cib_csrpipe_6_inst_1
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.reg_in	(1'b1),
	.reg_out	(1'b1),
	.data0	(ilu_log_en_csrbus_read_data),
	.sel0	(ilu_log_en_select_pulse),
	.data1	(ilu_int_en_csrbus_read_data),
	.sel1	(ilu_int_en_select_pulse),
	.data2	(ilu_en_err_ext_read_data),
	.sel2	(ilu_en_err_select),
	.data3	(ilu_log_err_csrbus_read_data),
	.sel3	(ilu_log_err_select_pulse),
	.data4	(pec_int_en_csrbus_read_data),
	.sel4	(pec_int_en_select_pulse),
	.data5	(pec_en_err_ext_read_data),
	.sel5	(pec_en_err_select),
	.out	(read_data_0_out)
	);

dmu_ilu_cib_csrpipe_6 dmu_ilu_cib_csrpipe_6_inst_2
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.reg_in	(1'b1),
	.reg_out	(1'b1),
	.data0	(ilu_diagnos_csrbus_read_data),
	.sel0	(ilu_diagnos_select_pulse),
	.data1	(64'b0),
	.sel1	(1'b1),
	.data2	(64'b0),
	.sel2	(1'b1),
	.data3	(64'b0),
	.sel3	(1'b1),
	.data4	(64'b0),
	.sel4	(1'b1),
	.data5	(64'b0),
	.sel5	(1'b1),
	.out	(read_data_1_out)
	);


//====================================================
//     Instantiation of registers
//====================================================

wire ilu_log_en_w_ld =ilu_log_en_select_pulse & daemon_csrbus_wr;

dmu_ilu_cib_csr_ilu_log_en ilu_log_en
	(
	.clk	(clk),
	.por_l	(por_l),
	.ilu_log_en_w_ld	(ilu_log_en_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.ilu_log_en_csrbus_read_data	(ilu_log_en_csrbus_read_data),
	.ilu_log_en_spare3_hw_read	(ilu_log_en_spare3_hw_read),
	.ilu_log_en_spare2_hw_read	(ilu_log_en_spare2_hw_read),
	.ilu_log_en_spare1_hw_read	(ilu_log_en_spare1_hw_read),
	.ilu_log_en_ihb_pe_hw_read	(ilu_log_en_ihb_pe_hw_read)
	);

wire ilu_int_en_w_ld =ilu_int_en_select_pulse & daemon_csrbus_wr;

dmu_ilu_cib_csr_ilu_int_en ilu_int_en
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.ilu_int_en_w_ld	(ilu_int_en_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.ilu_int_en_csrbus_read_data	(ilu_int_en_csrbus_read_data),
	.ilu_int_en_spare3_s_hw_read	(ilu_int_en_spare3_s_hw_read),
	.ilu_int_en_spare2_s_hw_read	(ilu_int_en_spare2_s_hw_read),
	.ilu_int_en_spare1_s_hw_read	(ilu_int_en_spare1_s_hw_read),
	.ilu_int_en_ihb_pe_s_hw_read	(ilu_int_en_ihb_pe_s_hw_read),
	.ilu_int_en_spare3_p_hw_read	(ilu_int_en_spare3_p_hw_read),
	.ilu_int_en_spare2_p_hw_read	(ilu_int_en_spare2_p_hw_read),
	.ilu_int_en_spare1_p_hw_read	(ilu_int_en_spare1_p_hw_read),
	.ilu_int_en_ihb_pe_p_hw_read	(ilu_int_en_ihb_pe_p_hw_read)
	);

wire ilu_log_err_w_ld =ilu_log_err_select_pulse & daemon_csrbus_wr;

dmu_ilu_cib_csr_ilu_log_err ilu_log_err
	(
	.clk	(clk),
	.por_l	(por_l),
	.ilu_log_err_w_ld	(ilu_log_err_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.rw1c_alias	(ilu_log_err_rw1c_alias),
	.rw1s_alias	(ilu_log_err_rw1s_alias),
	.ilu_log_err_csrbus_read_data	(ilu_log_err_csrbus_read_data),
	.ilu_log_err_spare3_s_hw_set	(ilu_log_err_spare3_s_hw_set),
	.ilu_log_err_spare3_s_hw_read	(ilu_log_err_spare3_s_hw_read),
	.ilu_log_err_spare2_s_hw_set	(ilu_log_err_spare2_s_hw_set),
	.ilu_log_err_spare2_s_hw_read	(ilu_log_err_spare2_s_hw_read),
	.ilu_log_err_spare1_s_hw_set	(ilu_log_err_spare1_s_hw_set),
	.ilu_log_err_spare1_s_hw_read	(ilu_log_err_spare1_s_hw_read),
	.ilu_log_err_ihb_pe_s_hw_set	(ilu_log_err_ihb_pe_s_hw_set),
	.ilu_log_err_ihb_pe_s_hw_read	(ilu_log_err_ihb_pe_s_hw_read),
	.ilu_log_err_spare3_p_hw_set	(ilu_log_err_spare3_p_hw_set),
	.ilu_log_err_spare3_p_hw_read	(ilu_log_err_spare3_p_hw_read),
	.ilu_log_err_spare2_p_hw_set	(ilu_log_err_spare2_p_hw_set),
	.ilu_log_err_spare2_p_hw_read	(ilu_log_err_spare2_p_hw_read),
	.ilu_log_err_spare1_p_hw_set	(ilu_log_err_spare1_p_hw_set),
	.ilu_log_err_spare1_p_hw_read	(ilu_log_err_spare1_p_hw_read),
	.ilu_log_err_ihb_pe_p_hw_set	(ilu_log_err_ihb_pe_p_hw_set),
	.ilu_log_err_ihb_pe_p_hw_read	(ilu_log_err_ihb_pe_p_hw_read)
	);

wire pec_int_en_w_ld =pec_int_en_select_pulse & daemon_csrbus_wr;

dmu_ilu_cib_csr_pec_int_en pec_int_en
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.pec_int_en_w_ld	(pec_int_en_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.pec_int_en_csrbus_read_data	(pec_int_en_csrbus_read_data),
	.pec_int_en_pec_hw_read	(pec_int_en_pec_hw_read),
	.pec_int_en_pec_ilu_hw_read	(pec_int_en_pec_ilu_hw_read),
	.pec_int_en_pec_ue_hw_read	(pec_int_en_pec_ue_hw_read),
	.pec_int_en_pec_ce_hw_read	(pec_int_en_pec_ce_hw_read),
	.pec_int_en_pec_oe_hw_read	(pec_int_en_pec_oe_hw_read)
	);

wire ilu_diagnos_w_ld =ilu_diagnos_select_pulse & daemon_csrbus_wr;

dmu_ilu_cib_csr_ilu_diagnos ilu_diagnos
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.por_l	(por_l),
	.ilu_diagnos_w_ld	(ilu_diagnos_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.ilu_diagnos_csrbus_read_data	(ilu_diagnos_csrbus_read_data),
	.ilu_diagnos_enpll1_hw_read	(ilu_diagnos_enpll1_hw_read),
	.ilu_diagnos_enpll0_hw_read	(ilu_diagnos_enpll0_hw_read),
	.ilu_diagnos_entx7_hw_read	(ilu_diagnos_entx7_hw_read),
	.ilu_diagnos_entx6_hw_read	(ilu_diagnos_entx6_hw_read),
	.ilu_diagnos_entx5_hw_read	(ilu_diagnos_entx5_hw_read),
	.ilu_diagnos_entx4_hw_read	(ilu_diagnos_entx4_hw_read),
	.ilu_diagnos_entx3_hw_read	(ilu_diagnos_entx3_hw_read),
	.ilu_diagnos_entx2_hw_read	(ilu_diagnos_entx2_hw_read),
	.ilu_diagnos_entx1_hw_read	(ilu_diagnos_entx1_hw_read),
	.ilu_diagnos_entx0_hw_read	(ilu_diagnos_entx0_hw_read),
	.ilu_diagnos_enrx7_hw_read	(ilu_diagnos_enrx7_hw_read),
	.ilu_diagnos_enrx6_hw_read	(ilu_diagnos_enrx6_hw_read),
	.ilu_diagnos_enrx5_hw_read	(ilu_diagnos_enrx5_hw_read),
	.ilu_diagnos_enrx4_hw_read	(ilu_diagnos_enrx4_hw_read),
	.ilu_diagnos_enrx3_hw_read	(ilu_diagnos_enrx3_hw_read),
	.ilu_diagnos_enrx2_hw_read	(ilu_diagnos_enrx2_hw_read),
	.ilu_diagnos_enrx1_hw_read	(ilu_diagnos_enrx1_hw_read),
	.ilu_diagnos_enrx0_hw_read	(ilu_diagnos_enrx0_hw_read),
	.ilu_diagnos_edi_par_hw_read	(ilu_diagnos_edi_par_hw_read),
	.ilu_diagnos_ehi_par_hw_read	(ilu_diagnos_ehi_par_hw_read),
	.ilu_diagnos_edi_trig_hw_clr	(ilu_diagnos_edi_trig_hw_clr),
	.ilu_diagnos_edi_trig_hw_read	(ilu_diagnos_edi_trig_hw_read),
	.ilu_diagnos_ehi_trig_hw_clr	(ilu_diagnos_ehi_trig_hw_clr),
	.ilu_diagnos_ehi_trig_hw_read	(ilu_diagnos_ehi_trig_hw_read),
	.ilu_diagnos_rate_scale_hw_read	(ilu_diagnos_rate_scale_hw_read)
	);

endmodule // dmu_ilu_cib_default_grp
