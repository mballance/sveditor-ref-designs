// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_csr_ctl.v
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
module dmu_mmu_csr_ctl 
	(
	clk,
	rst_l,
	ctl_w_ld,
	csrbus_wr_data,
	ctl_csrbus_read_data,
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
	ctl_te_hw_read
	);

//====================================================================
//     Polarity declarations
//====================================================================
input  clk;  // Clock
input  rst_l;  // Reset signal
input  ctl_w_ld;  // SW load bus
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
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

//====================================================================
//     Type declarations
//====================================================================
wire clk;  // Clock
wire rst_l;  // Reset signal
wire ctl_w_ld;  // SW load bus
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
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

//====================================================================
//     Logic     
//====================================================================

// synopsys translate_off
// verilint 123 off
// verilint 498 off
reg omni_ld;
reg [`FIRE_DLC_MMU_CSR_CTL_WIDTH-1:0] omni_data;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld         = 1'b0;
     omni_data       = `FIRE_DLC_MMU_CSR_CTL_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

// verilint 123 on
// verilint 498 on
// synopsys translate_on

//----- Hardware Data Out Mux Assignments
assign ctl_sparec_hw_read=
           ctl_csrbus_read_data
               [`FIRE_DLC_MMU_CSR_CTL_SPAREC_SLC];
assign ctl_pd_hw_read=
           ctl_csrbus_read_data [12];
assign ctl_se_hw_read=
           ctl_csrbus_read_data [10];
assign ctl_cm_hw_read=
           ctl_csrbus_read_data
               [`FIRE_DLC_MMU_CSR_CTL_CM_SLC];
assign ctl_busid_sel_hw_read=
           ctl_csrbus_read_data [3];
assign ctl_sun4v_en_hw_read=
           ctl_csrbus_read_data [2];
assign ctl_be_hw_read=
           ctl_csrbus_read_data [1];
assign ctl_te_hw_read=
           ctl_csrbus_read_data [0];

//====================================================================
//     Instantiation of entries
//====================================================================

//----- Entry 0
dmu_mmu_csr_ctl_entry ctl_0
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld),
	  .omni_data	(omni_data),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(ctl_w_ld),
	.csrbus_wr_data	(csrbus_wr_data),
	.ctl_csrbus_read_data	(ctl_csrbus_read_data),
	.ctl_spares_hw_write	(ctl_spares_hw_write),
	.ctl_paq_hw_write	(ctl_paq_hw_write),
	.ctl_vaq_hw_write	(ctl_vaq_hw_write),
	.ctl_tpl_hw_write	(ctl_tpl_hw_write),
	.ctl_tip_hw_write	(ctl_tip_hw_write),
	.ctl_tcm_hw_write	(ctl_tcm_hw_write)
	);

endmodule // dmu_mmu_csr_ctl
