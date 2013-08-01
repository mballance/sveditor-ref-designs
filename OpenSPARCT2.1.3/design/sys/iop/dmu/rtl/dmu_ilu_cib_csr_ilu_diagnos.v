// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_ilu_cib_csr_ilu_diagnos.v
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
module dmu_ilu_cib_csr_ilu_diagnos
	(
	clk,
	rst_l,
	por_l,
	ilu_diagnos_w_ld,
	csrbus_wr_data,
	ilu_diagnos_csrbus_read_data,
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

//====================================================================
//     Polarity declarations
//====================================================================
input  clk;  // Clock
input  rst_l;  // Reset signal
input  por_l;  // Reset signal
input  ilu_diagnos_w_ld;  // SW load bus
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
output [`FIRE_DLC_ILU_CIB_CSR_ILU_DIAGNOS_WIDTH-1:0] ilu_diagnos_csrbus_read_data;
    // SW read data
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

//====================================================================
//     Type declarations
//====================================================================
wire clk;  // Clock
wire rst_l;  // Reset signal
wire por_l;  // Reset signal
wire ilu_diagnos_w_ld;  // SW load bus
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
wire [`FIRE_DLC_ILU_CIB_CSR_ILU_DIAGNOS_WIDTH-1:0] ilu_diagnos_csrbus_read_data;
    // SW read data
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

//====================================================================
//     Logic     
//====================================================================

// synopsys translate_off
// verilint 123 off
// verilint 498 off
reg omni_ld;
reg [`FIRE_DLC_ILU_CIB_CSR_ILU_DIAGNOS_WIDTH-1:0] omni_data;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld         = 1'b0;
     omni_data       = `FIRE_DLC_ILU_CIB_CSR_ILU_DIAGNOS_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

// verilint 123 on
// verilint 498 on
// synopsys translate_on

//----- Hardware Data Out Mux Assignments
assign ilu_diagnos_enpll1_hw_read=
           ilu_diagnos_csrbus_read_data [33];
assign ilu_diagnos_enpll0_hw_read=
           ilu_diagnos_csrbus_read_data [32];
assign ilu_diagnos_entx7_hw_read=
           ilu_diagnos_csrbus_read_data [31];
assign ilu_diagnos_entx6_hw_read=
           ilu_diagnos_csrbus_read_data [30];
assign ilu_diagnos_entx5_hw_read=
           ilu_diagnos_csrbus_read_data [29];
assign ilu_diagnos_entx4_hw_read=
           ilu_diagnos_csrbus_read_data [28];
assign ilu_diagnos_entx3_hw_read=
           ilu_diagnos_csrbus_read_data [27];
assign ilu_diagnos_entx2_hw_read=
           ilu_diagnos_csrbus_read_data [26];
assign ilu_diagnos_entx1_hw_read=
           ilu_diagnos_csrbus_read_data [25];
assign ilu_diagnos_entx0_hw_read=
           ilu_diagnos_csrbus_read_data [24];
assign ilu_diagnos_enrx7_hw_read=
           ilu_diagnos_csrbus_read_data [23];
assign ilu_diagnos_enrx6_hw_read=
           ilu_diagnos_csrbus_read_data [22];
assign ilu_diagnos_enrx5_hw_read=
           ilu_diagnos_csrbus_read_data [21];
assign ilu_diagnos_enrx4_hw_read=
           ilu_diagnos_csrbus_read_data [20];
assign ilu_diagnos_enrx3_hw_read=
           ilu_diagnos_csrbus_read_data [19];
assign ilu_diagnos_enrx2_hw_read=
           ilu_diagnos_csrbus_read_data [18];
assign ilu_diagnos_enrx1_hw_read=
           ilu_diagnos_csrbus_read_data [17];
assign ilu_diagnos_enrx0_hw_read=
           ilu_diagnos_csrbus_read_data [16];
assign ilu_diagnos_edi_par_hw_read=
           ilu_diagnos_csrbus_read_data
               [`FIRE_DLC_ILU_CIB_CSR_ILU_DIAGNOS_EDI_PAR_SLC];
assign ilu_diagnos_ehi_par_hw_read=
           ilu_diagnos_csrbus_read_data
               [`FIRE_DLC_ILU_CIB_CSR_ILU_DIAGNOS_EHI_PAR_SLC];
assign ilu_diagnos_edi_trig_hw_read=
           ilu_diagnos_csrbus_read_data [5];
assign ilu_diagnos_ehi_trig_hw_read=
           ilu_diagnos_csrbus_read_data [4];
assign ilu_diagnos_rate_scale_hw_read=
           ilu_diagnos_csrbus_read_data
               [`FIRE_DLC_ILU_CIB_CSR_ILU_DIAGNOS_RATE_SCALE_SLC];

//====================================================================
//     Instantiation of entries
//====================================================================

//----- Entry 0
dmu_ilu_cib_csr_ilu_diagnos_entry ilu_diagnos_0
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld),
	  .omni_data	(omni_data),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.por_l	(por_l),
	.w_ld	(ilu_diagnos_w_ld),
	.csrbus_wr_data	(csrbus_wr_data),
	.ilu_diagnos_csrbus_read_data	(ilu_diagnos_csrbus_read_data),
	.ilu_diagnos_edi_trig_hw_clr	(ilu_diagnos_edi_trig_hw_clr),
	.ilu_diagnos_ehi_trig_hw_clr	(ilu_diagnos_ehi_trig_hw_clr)
	);

endmodule // dmu_ilu_cib_csr_ilu_diagnos
