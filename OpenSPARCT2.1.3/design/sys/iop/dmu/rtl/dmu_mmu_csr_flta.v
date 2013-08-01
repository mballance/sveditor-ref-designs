// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_csr_flta.v
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
module dmu_mmu_csr_flta
	(
	clk,
	por_l,
	flta_w_ld,
	csrbus_wr_data,
	flta_csrbus_read_data,
	flta_va_hw_ld,
	flta_va_hw_write
	);

//====================================================================
//     Polarity declarations
//====================================================================
input  clk;  // Clock
input  por_l;  // Reset signal
input  flta_w_ld;  // SW load bus
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
output [`FIRE_DLC_MMU_CSR_FLTA_WIDTH-1:0] flta_csrbus_read_data;  // SW read
                                                                  // data
input  flta_va_hw_ld;  // Hardware load enable for flta_va. When set, <hw write
                       // signal>  will be loaded into flta.
input  [`FIRE_DLC_MMU_CSR_FLTA_VA_INT_SLC] flta_va_hw_write;  // data bus for hw
                                                              // loading of
                                                              // flta_va.

//====================================================================
//     Type declarations
//====================================================================
wire clk;  // Clock
wire por_l;  // Reset signal
wire flta_w_ld;  // SW load bus
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
wire [`FIRE_DLC_MMU_CSR_FLTA_WIDTH-1:0] flta_csrbus_read_data;  // SW read data
wire flta_va_hw_ld;  // Hardware load enable for flta_va. When set, <hw write
                     // signal>  will be loaded into flta.
wire [`FIRE_DLC_MMU_CSR_FLTA_VA_INT_SLC] flta_va_hw_write;  // data bus for hw
                                                            // loading of
                                                            // flta_va.

//====================================================================
//     Logic     
//====================================================================

// synopsys translate_off
// verilint 123 off
// verilint 498 off
reg omni_ld;
reg [`FIRE_DLC_MMU_CSR_FLTA_WIDTH-1:0] omni_data;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld         = 1'b0;
     omni_data       = `FIRE_DLC_MMU_CSR_FLTA_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

// verilint 123 on
// verilint 498 on
// synopsys translate_on

//----- Hardware Data Out Mux Assignments

//====================================================================
//     Instantiation of entries
//====================================================================

//----- Entry 0
dmu_mmu_csr_flta_entry flta_0
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld),
	  .omni_data	(omni_data),
	// synopsys translate_on
	.clk	(clk),
	.por_l	(por_l),
	.w_ld	(flta_w_ld),
	.csrbus_wr_data	(csrbus_wr_data),
	.flta_csrbus_read_data	(flta_csrbus_read_data),
	.flta_va_hw_ld	(flta_va_hw_ld),
	.flta_va_hw_write	(flta_va_hw_write)
	);

endmodule // dmu_mmu_csr_flta
