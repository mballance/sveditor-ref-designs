// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_ilu_cib_csr_ilu_log_en.v
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
module dmu_ilu_cib_csr_ilu_log_en 
	(
	clk,
	por_l,
	ilu_log_en_w_ld,
	csrbus_wr_data,
	ilu_log_en_csrbus_read_data,
	ilu_log_en_spare3_hw_read,
	ilu_log_en_spare2_hw_read,
	ilu_log_en_spare1_hw_read,
	ilu_log_en_ihb_pe_hw_read
	);

//====================================================================
//     Polarity declarations
//====================================================================
input  clk;  // Clock
input  por_l;  // Reset signal
input  ilu_log_en_w_ld;  // SW load bus
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
output [`FIRE_DLC_ILU_CIB_CSR_ILU_LOG_EN_WIDTH-1:0] ilu_log_en_csrbus_read_data;
    // SW read data
output ilu_log_en_spare3_hw_read;  // This signal provides the current value of
                                   // ilu_log_en_spare3.
output ilu_log_en_spare2_hw_read;  // This signal provides the current value of
                                   // ilu_log_en_spare2.
output ilu_log_en_spare1_hw_read;  // This signal provides the current value of
                                   // ilu_log_en_spare1.
output ilu_log_en_ihb_pe_hw_read;  // This signal provides the current value of
                                   // ilu_log_en_ihb_pe.

//====================================================================
//     Type declarations
//====================================================================
wire clk;  // Clock
wire por_l;  // Reset signal
wire ilu_log_en_w_ld;  // SW load bus
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
wire [`FIRE_DLC_ILU_CIB_CSR_ILU_LOG_EN_WIDTH-1:0] ilu_log_en_csrbus_read_data;
    // SW read data
wire ilu_log_en_spare3_hw_read;  // This signal provides the current value of
                                 // ilu_log_en_spare3.
wire ilu_log_en_spare2_hw_read;  // This signal provides the current value of
                                 // ilu_log_en_spare2.
wire ilu_log_en_spare1_hw_read;  // This signal provides the current value of
                                 // ilu_log_en_spare1.
wire ilu_log_en_ihb_pe_hw_read;  // This signal provides the current value of
                                 // ilu_log_en_ihb_pe.

//====================================================================
//     Logic     
//====================================================================

// synopsys translate_off
// verilint 123 off
// verilint 498 off
reg omni_ld;
reg [`FIRE_DLC_ILU_CIB_CSR_ILU_LOG_EN_WIDTH-1:0] omni_data;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld         = 1'b0;
     omni_data       = `FIRE_DLC_ILU_CIB_CSR_ILU_LOG_EN_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

// verilint 123 on
// verilint 498 on
// synopsys translate_on

//----- Hardware Data Out Mux Assignments
assign ilu_log_en_spare3_hw_read=
           ilu_log_en_csrbus_read_data [7];
assign ilu_log_en_spare2_hw_read=
           ilu_log_en_csrbus_read_data [6];
assign ilu_log_en_spare1_hw_read=
           ilu_log_en_csrbus_read_data [5];
assign ilu_log_en_ihb_pe_hw_read=
           ilu_log_en_csrbus_read_data [4];

//====================================================================
//     Instantiation of entries
//====================================================================

//----- Entry 0
dmu_ilu_cib_csr_ilu_log_en_entry ilu_log_en_0
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld),
	  .omni_data	(omni_data),
	// synopsys translate_on
	.clk	(clk),
	.por_l	(por_l),
	.w_ld	(ilu_log_en_w_ld),
	.csrbus_wr_data	(csrbus_wr_data),
	.ilu_log_en_csrbus_read_data	(ilu_log_en_csrbus_read_data)
	);

endmodule // dmu_ilu_cib_csr_ilu_log_en
