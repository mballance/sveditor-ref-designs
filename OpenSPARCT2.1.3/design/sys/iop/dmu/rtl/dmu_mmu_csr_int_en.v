// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_csr_int_en.v
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
module dmu_mmu_csr_int_en 
	(
	clk,
	rst_l,
	int_en_w_ld,
	csrbus_wr_data,
	int_en_csrbus_read_data,
	int_en_hw_read
	);

//====================================================================
//     Polarity declarations
//====================================================================
input  clk;  // Clock
input  rst_l;  // Reset signal
input  int_en_w_ld;  // SW load bus
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
output [`FIRE_DLC_MMU_CSR_INT_EN_WIDTH-1:0] int_en_csrbus_read_data;
    // SW read data
output [`FIRE_DLC_MMU_CSR_INT_EN_WIDTH-1:0] int_en_hw_read;  // This signal
                                                             // provides the
                                                             // current value of
                                                             // int_en.

//====================================================================
//     Type declarations
//====================================================================
wire clk;  // Clock
wire rst_l;  // Reset signal
wire int_en_w_ld;  // SW load bus
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
wire [`FIRE_DLC_MMU_CSR_INT_EN_WIDTH-1:0] int_en_csrbus_read_data;
    // SW read data
wire [`FIRE_DLC_MMU_CSR_INT_EN_WIDTH-1:0] int_en_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // int_en.

//====================================================================
//     Logic     
//====================================================================

// synopsys translate_off
// verilint 123 off
// verilint 498 off
reg omni_ld;
reg [`FIRE_DLC_MMU_CSR_INT_EN_WIDTH-1:0] omni_data;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld         = 1'b0;
     omni_data       = `FIRE_DLC_MMU_CSR_INT_EN_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

// verilint 123 on
// verilint 498 on
// synopsys translate_on

//----- Hardware Data Out Mux Assignments
assign int_en_hw_read=
           int_en_csrbus_read_data
               [`FIRE_DLC_MMU_CSR_INT_EN_WIDTH-1:0];

//====================================================================
//     Instantiation of entries
//====================================================================

//----- Entry 0
dmu_mmu_csr_int_en_entry int_en_0
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld),
	  .omni_data	(omni_data),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(int_en_w_ld),
	.csrbus_wr_data	(csrbus_wr_data),
	.int_en_csrbus_read_data	(int_en_csrbus_read_data)
	);

endmodule // dmu_mmu_csr_int_en
