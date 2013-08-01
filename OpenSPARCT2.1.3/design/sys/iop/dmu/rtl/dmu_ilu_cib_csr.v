// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_ilu_cib_csr.v
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
module dmu_ilu_cib_csr
	(
	clk,
	csrbus_addr,
	csrbus_wr_data,
	csrbus_wr,
	csrbus_valid,
	csrbus_mapped,
	csrbus_done,
	csrbus_read_data,
	por_l,
	rst_l,
	csrbus_src_bus,
	csrbus_acc_vio,
	instance_id,
	ilu_log_en_spare3_hw_read,
	ilu_log_en_spare2_hw_read,
	ilu_log_en_spare1_hw_read,
	ilu_log_en_ihb_pe_hw_read,
	ilu_int_en_spare3_s_hw_read,
	ilu_int_en_spare2_s_hw_read,
	ilu_int_en_spare1_s_hw_read,
	ilu_int_en_ihb_pe_s_hw_read,
	ilu_int_en_spare3_p_hw_read,
	ilu_int_en_spare2_p_hw_read,
	ilu_int_en_spare1_p_hw_read,
	ilu_int_en_ihb_pe_p_hw_read,
	ilu_en_err_spare3_s_ext_read_data,
	ilu_en_err_spare2_s_ext_read_data,
	ilu_en_err_spare1_s_ext_read_data,
	ilu_en_err_ihb_pe_s_ext_read_data,
	ilu_en_err_spare3_p_ext_read_data,
	ilu_en_err_spare2_p_ext_read_data,
	ilu_en_err_spare1_p_ext_read_data,
	ilu_en_err_ihb_pe_p_ext_read_data,
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
	pec_int_en_pec_hw_read,
	pec_int_en_pec_ilu_hw_read,
	pec_int_en_pec_ue_hw_read,
	pec_int_en_pec_ce_hw_read,
	pec_int_en_pec_oe_hw_read,
	pec_en_err_ilu_ext_read_data,
	pec_en_err_ue_ext_read_data,
	pec_en_err_ce_ext_read_data,
	pec_en_err_oe_ext_read_data,
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
	ilu_diagnos_rate_scale_hw_read
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
input  por_l;  // Reset signal
input  rst_l;  // Reset signal
input  [1:0] csrbus_src_bus;  // Source bus
output csrbus_acc_vio;  // Violation signal
input  instance_id;  // Instance ID
output ilu_log_en_spare3_hw_read;  // This signal provides the current value of
                                   // ilu_log_en_spare3.
output ilu_log_en_spare2_hw_read;  // This signal provides the current value of
                                   // ilu_log_en_spare2.
output ilu_log_en_spare1_hw_read;  // This signal provides the current value of
                                   // ilu_log_en_spare1.
output ilu_log_en_ihb_pe_hw_read;  // This signal provides the current value of
                                   // ilu_log_en_ihb_pe.
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
input  [0:0] ilu_en_err_spare3_s_ext_read_data;  // Ext read data (decode)
input  [0:0] ilu_en_err_spare2_s_ext_read_data;  // Ext read data (decode)
input  [0:0] ilu_en_err_spare1_s_ext_read_data;  // Ext read data (decode)
input  [0:0] ilu_en_err_ihb_pe_s_ext_read_data;  // Ext read data (decode)
input  [0:0] ilu_en_err_spare3_p_ext_read_data;  // Ext read data (decode)
input  [0:0] ilu_en_err_spare2_p_ext_read_data;  // Ext read data (decode)
input  [0:0] ilu_en_err_spare1_p_ext_read_data;  // Ext read data (decode)
input  [0:0] ilu_en_err_ihb_pe_p_ext_read_data;  // Ext read data (decode)
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
input  [0:0] pec_en_err_ilu_ext_read_data;  // Ext read data (decode)
input  [0:0] pec_en_err_ue_ext_read_data;  // Ext read data (decode)
input  [0:0] pec_en_err_ce_ext_read_data;  // Ext read data (decode)
input  [0:0] pec_en_err_oe_ext_read_data;  // Ext read data (decode)
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
wire por_l;  // Reset signal
wire rst_l;  // Reset signal
wire [1:0] csrbus_src_bus;  // Source bus
wire csrbus_acc_vio;  // Violation signal
wire instance_id;  // Instance ID
wire ilu_log_en_spare3_hw_read;  // This signal provides the current value of
                                 // ilu_log_en_spare3.
wire ilu_log_en_spare2_hw_read;  // This signal provides the current value of
                                 // ilu_log_en_spare2.
wire ilu_log_en_spare1_hw_read;  // This signal provides the current value of
                                 // ilu_log_en_spare1.
wire ilu_log_en_ihb_pe_hw_read;  // This signal provides the current value of
                                 // ilu_log_en_ihb_pe.
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
wire [0:0] ilu_en_err_spare3_s_ext_read_data;  // Ext read data (decode)
wire [0:0] ilu_en_err_spare2_s_ext_read_data;  // Ext read data (decode)
wire [0:0] ilu_en_err_spare1_s_ext_read_data;  // Ext read data (decode)
wire [0:0] ilu_en_err_ihb_pe_s_ext_read_data;  // Ext read data (decode)
wire [0:0] ilu_en_err_spare3_p_ext_read_data;  // Ext read data (decode)
wire [0:0] ilu_en_err_spare2_p_ext_read_data;  // Ext read data (decode)
wire [0:0] ilu_en_err_spare1_p_ext_read_data;  // Ext read data (decode)
wire [0:0] ilu_en_err_ihb_pe_p_ext_read_data;  // Ext read data (decode)
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
wire [0:0] pec_en_err_ilu_ext_read_data;  // Ext read data (decode)
wire [0:0] pec_en_err_ue_ext_read_data;  // Ext read data (decode)
wire [0:0] pec_en_err_ce_ext_read_data;  // Ext read data (decode)
wire [0:0] pec_en_err_oe_ext_read_data;  // Ext read data (decode)
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
wire ilu_log_en_select_pulse;
wire ilu_int_en_select_pulse;
wire ilu_en_err_select;
wire ilu_log_err_select_pulse;
wire pec_int_en_select_pulse;
wire pec_en_err_select;
wire ilu_diagnos_select_pulse;
wire ilu_log_err_rw1c_alias;
wire ilu_log_err_rw1s_alias;

dmu_ilu_cib_addr_decode dmu_ilu_cib_addr_decode
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
	.ilu_log_en_select_pulse	(ilu_log_en_select_pulse),
	.ilu_int_en_select_pulse	(ilu_int_en_select_pulse),
	.ilu_en_err_select	(ilu_en_err_select),
	.ilu_log_err_select_pulse	(ilu_log_err_select_pulse),
	.ilu_log_err_rw1c_alias	(ilu_log_err_rw1c_alias),
	.ilu_log_err_rw1s_alias	(ilu_log_err_rw1s_alias),
	.pec_int_en_select_pulse	(pec_int_en_select_pulse),
	.pec_en_err_select	(pec_en_err_select),
	.ilu_diagnos_select_pulse	(ilu_diagnos_select_pulse)
	);

//====================================================================
//    OUTPUT: csrbus_read_data (pipelining)
//====================================================================
//----- connecting wires
wire stage_mux_only_rst_l;
wire stage_mux_only_por_l;
wire stage_mux_only_ilu_log_err_rw1c_alias;
wire stage_mux_only_ilu_log_err_rw1s_alias;
wire stage_mux_only_daemon_csrbus_wr;
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] stage_mux_only_daemon_csrbus_wr_data;

//----- Stage: 1 / Grp: default_grp (7 inputs / 2 outputs)
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] default_grp_read_data_0_out;
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] default_grp_read_data_1_out;
wire default_grp_ilu_log_en_select_pulse;
wire default_grp_ilu_int_en_select_pulse;
wire default_grp_ilu_en_err_select;
wire default_grp_ilu_log_err_select_pulse;
wire default_grp_pec_int_en_select_pulse;
wire default_grp_pec_en_err_select;
wire default_grp_ilu_diagnos_select_pulse;

dmu_ilu_cib_default_grp dmu_ilu_cib_default_grp
	(
	.clk	(clk),
	.ilu_log_en_spare3_hw_read	(ilu_log_en_spare3_hw_read),
	.ilu_log_en_spare2_hw_read	(ilu_log_en_spare2_hw_read),
	.ilu_log_en_spare1_hw_read	(ilu_log_en_spare1_hw_read),
	.ilu_log_en_ihb_pe_hw_read	(ilu_log_en_ihb_pe_hw_read),
	.ilu_log_en_select_pulse	(default_grp_ilu_log_en_select_pulse),
	.ilu_int_en_spare3_s_hw_read	(ilu_int_en_spare3_s_hw_read),
	.ilu_int_en_spare2_s_hw_read	(ilu_int_en_spare2_s_hw_read),
	.ilu_int_en_spare1_s_hw_read	(ilu_int_en_spare1_s_hw_read),
	.ilu_int_en_ihb_pe_s_hw_read	(ilu_int_en_ihb_pe_s_hw_read),
	.ilu_int_en_spare3_p_hw_read	(ilu_int_en_spare3_p_hw_read),
	.ilu_int_en_spare2_p_hw_read	(ilu_int_en_spare2_p_hw_read),
	.ilu_int_en_spare1_p_hw_read	(ilu_int_en_spare1_p_hw_read),
	.ilu_int_en_ihb_pe_p_hw_read	(ilu_int_en_ihb_pe_p_hw_read),
	.ilu_int_en_select_pulse	(default_grp_ilu_int_en_select_pulse),
	.ilu_en_err_select	(default_grp_ilu_en_err_select),
	.ilu_en_err_ext_read_data
	  (
              {
                24'b0,
                ilu_en_err_spare3_s_ext_read_data,
                ilu_en_err_spare2_s_ext_read_data,
                ilu_en_err_spare1_s_ext_read_data,
                ilu_en_err_ihb_pe_s_ext_read_data,
                28'b0,
                ilu_en_err_spare3_p_ext_read_data,
                ilu_en_err_spare2_p_ext_read_data,
                ilu_en_err_spare1_p_ext_read_data,
                ilu_en_err_ihb_pe_p_ext_read_data,
                4'b0
              }),
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
	.ilu_log_err_ihb_pe_p_hw_read	(ilu_log_err_ihb_pe_p_hw_read),
	.ilu_log_err_select_pulse	(default_grp_ilu_log_err_select_pulse),
	.pec_int_en_pec_hw_read	(pec_int_en_pec_hw_read),
	.pec_int_en_pec_ilu_hw_read	(pec_int_en_pec_ilu_hw_read),
	.pec_int_en_pec_ue_hw_read	(pec_int_en_pec_ue_hw_read),
	.pec_int_en_pec_ce_hw_read	(pec_int_en_pec_ce_hw_read),
	.pec_int_en_pec_oe_hw_read	(pec_int_en_pec_oe_hw_read),
	.pec_int_en_select_pulse	(default_grp_pec_int_en_select_pulse),
	.pec_en_err_select	(default_grp_pec_en_err_select),
	.pec_en_err_ext_read_data
	  (
              {
                60'b0,
                pec_en_err_ilu_ext_read_data,
                pec_en_err_ue_ext_read_data,
                pec_en_err_ce_ext_read_data,
                pec_en_err_oe_ext_read_data
              }),
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
	.ilu_diagnos_rate_scale_hw_read	(ilu_diagnos_rate_scale_hw_read),
	.ilu_diagnos_select_pulse	(default_grp_ilu_diagnos_select_pulse),
	.ilu_log_err_rw1c_alias	(stage_mux_only_ilu_log_err_rw1c_alias),
	.ilu_log_err_rw1s_alias	(stage_mux_only_ilu_log_err_rw1s_alias),
	.rst_l	(stage_mux_only_rst_l),
	.por_l	(stage_mux_only_por_l),
	.daemon_csrbus_wr_in	(stage_mux_only_daemon_csrbus_wr),
	.daemon_csrbus_wr_data_in	(stage_mux_only_daemon_csrbus_wr_data),
	.read_data_0_out	(default_grp_read_data_0_out),
	.read_data_1_out	(default_grp_read_data_1_out)
	);

//----- Stage: 2 / Grp: stage_mux_only (2 inputs / 1 outputs) (Mux only)
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] stage_mux_only_read_data_0_out;

dmu_ilu_cib_stage_mux_only dmu_ilu_cib_stage_mux_only
	(
	.clk	(clk),
	.read_data_0	(default_grp_read_data_0_out),
	.read_data_1	(default_grp_read_data_1_out),
	.ilu_log_en_select_pulse	(ilu_log_en_select_pulse),
	.ilu_log_en_select_pulse_out	(default_grp_ilu_log_en_select_pulse),
	.ilu_int_en_select_pulse	(ilu_int_en_select_pulse),
	.ilu_int_en_select_pulse_out	(default_grp_ilu_int_en_select_pulse),
	.ilu_en_err_select	(ilu_en_err_select),
	.ilu_en_err_select_out	(default_grp_ilu_en_err_select),
	.ilu_log_err_select_pulse	(ilu_log_err_select_pulse),
	.ilu_log_err_select_pulse_out	(default_grp_ilu_log_err_select_pulse),
	.pec_int_en_select_pulse	(pec_int_en_select_pulse),
	.pec_int_en_select_pulse_out	(default_grp_pec_int_en_select_pulse),
	.pec_en_err_select	(pec_en_err_select),
	.pec_en_err_select_out	(default_grp_pec_en_err_select),
	.ilu_diagnos_select_pulse	(ilu_diagnos_select_pulse),
	.ilu_diagnos_select_pulse_out	(default_grp_ilu_diagnos_select_pulse),
	.ilu_log_err_rw1c_alias	(ilu_log_err_rw1c_alias),
	.ilu_log_err_rw1c_alias_out	(stage_mux_only_ilu_log_err_rw1c_alias),
	.ilu_log_err_rw1s_alias	(ilu_log_err_rw1s_alias),
	.ilu_log_err_rw1s_alias_out	(stage_mux_only_ilu_log_err_rw1s_alias),
	.daemon_csrbus_wr_in	(daemon_csrbus_wr),
	.daemon_csrbus_wr_out	(stage_mux_only_daemon_csrbus_wr),
	.daemon_csrbus_wr_data_in	(daemon_csrbus_wr_data),
	.daemon_csrbus_wr_data_out	(stage_mux_only_daemon_csrbus_wr_data),
	.read_data_0_out	(stage_mux_only_read_data_0_out),
	.rst_l	(rst_l),
	.rst_l_out	(stage_mux_only_rst_l),
	.por_l	(por_l),
	.por_l_out	(stage_mux_only_por_l)
	);

//----- OUTPUT: csrbus_read_data
assign csrbus_read_data = stage_mux_only_read_data_0_out;

endmodule // dmu_ilu_cib_csr
