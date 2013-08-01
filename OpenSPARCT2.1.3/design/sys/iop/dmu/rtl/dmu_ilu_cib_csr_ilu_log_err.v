// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_ilu_cib_csr_ilu_log_err.v
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
module dmu_ilu_cib_csr_ilu_log_err 
	(
	clk,
	por_l,
	ilu_log_err_w_ld,
	csrbus_wr_data,
	rw1c_alias,
	rw1s_alias,
	ilu_log_err_csrbus_read_data,
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
	ilu_log_err_ihb_pe_p_hw_read
	);

//====================================================================
//     Polarity declarations
//====================================================================
input  clk;  // Clock
input  por_l;  // Reset signal
input  ilu_log_err_w_ld;  // SW load bus
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
input  rw1c_alias;  // SW load type: write-one-to-clear
input  rw1s_alias;  // SW load type: write-one-to-set
output [`FIRE_DLC_ILU_CIB_CSR_ILU_LOG_ERR_RW1C_ALIAS_WIDTH-1:0] ilu_log_err_csrbus_read_data;
    // SW read data
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

//====================================================================
//     Type declarations
//====================================================================
wire clk;  // Clock
wire por_l;  // Reset signal
wire ilu_log_err_w_ld;  // SW load bus
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
wire rw1c_alias;  // SW load type: write-one-to-clear
wire rw1s_alias;  // SW load type: write-one-to-set
wire [`FIRE_DLC_ILU_CIB_CSR_ILU_LOG_ERR_RW1C_ALIAS_WIDTH-1:0] ilu_log_err_csrbus_read_data;
    // SW read data
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

//====================================================================
//     Logic     
//====================================================================

// synopsys translate_off
// verilint 123 off
// verilint 498 off
reg omni_ld;
reg [`FIRE_DLC_ILU_CIB_CSR_ILU_LOG_ERR_RW1C_ALIAS_WIDTH-1:0] omni_data;
reg omni_rw1c_alias;
reg omni_rw1s_alias;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld         = 1'b0;
     omni_data       = `FIRE_DLC_ILU_CIB_CSR_ILU_LOG_ERR_RW1C_ALIAS_WIDTH'b0;
     omni_rw1c_alias   = 1'b0;
     omni_rw1s_alias   = 1'b0;
  end// vlint flag_unsynthesizable_initial on

// verilint 123 on
// verilint 498 on
// synopsys translate_on

//----- Hardware Data Out Mux Assignments
assign ilu_log_err_spare3_s_hw_read=
           ilu_log_err_csrbus_read_data [39];
assign ilu_log_err_spare2_s_hw_read=
           ilu_log_err_csrbus_read_data [38];
assign ilu_log_err_spare1_s_hw_read=
           ilu_log_err_csrbus_read_data [37];
assign ilu_log_err_ihb_pe_s_hw_read=
           ilu_log_err_csrbus_read_data [36];
assign ilu_log_err_spare3_p_hw_read=
           ilu_log_err_csrbus_read_data [7];
assign ilu_log_err_spare2_p_hw_read=
           ilu_log_err_csrbus_read_data [6];
assign ilu_log_err_spare1_p_hw_read=
           ilu_log_err_csrbus_read_data [5];
assign ilu_log_err_ihb_pe_p_hw_read=
           ilu_log_err_csrbus_read_data [4];

//====================================================================
//     Instantiation of entries
//====================================================================

//----- Entry 0
dmu_ilu_cib_csr_ilu_log_err_entry ilu_log_err_0
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld),
	  .omni_data	(omni_data),
	  .omni_rw1c_alias	(omni_rw1c_alias),
	  .omni_rw1s_alias	(omni_rw1s_alias),
	// synopsys translate_on
	.clk	(clk),
	.por_l	(por_l),
	.w_ld	(ilu_log_err_w_ld),
	.csrbus_wr_data	(csrbus_wr_data),
	.rw1c_alias	(rw1c_alias),
	.rw1s_alias	(rw1s_alias),
	.ilu_log_err_csrbus_read_data	(ilu_log_err_csrbus_read_data),
	.ilu_log_err_spare3_s_hw_set	(ilu_log_err_spare3_s_hw_set),
	.ilu_log_err_spare2_s_hw_set	(ilu_log_err_spare2_s_hw_set),
	.ilu_log_err_spare1_s_hw_set	(ilu_log_err_spare1_s_hw_set),
	.ilu_log_err_ihb_pe_s_hw_set	(ilu_log_err_ihb_pe_s_hw_set),
	.ilu_log_err_spare3_p_hw_set	(ilu_log_err_spare3_p_hw_set),
	.ilu_log_err_spare2_p_hw_set	(ilu_log_err_spare2_p_hw_set),
	.ilu_log_err_spare1_p_hw_set	(ilu_log_err_spare1_p_hw_set),
	.ilu_log_err_ihb_pe_p_hw_set	(ilu_log_err_ihb_pe_p_hw_set)
	);

endmodule // dmu_ilu_cib_csr_ilu_log_err
