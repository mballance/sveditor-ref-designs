// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_rcb.v
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
module dmu_mmu_rcb 
  (
   clk,				// clock
   rst_l,			// Synchronous reset
   j2d_mmu_addr,		// jbc snoop address
   j2d_mmu_addr_vld,		// jbc snoop address valid
   cl2mm_tcr_ack,		// clu tcr acknowledge
   cl2mm_tdr_rcd,		// clu tdr record
   cl2mm_tdr_vld,		// clu tdr valid
   csr2rcb_se,			// csr snoop enable
//   csr2rcb_tb,			// csr tsb base address
//   csr2rcb_ts,			// csr tsb size
   tcb2rcb_tag,			// tcb tcr tag
   tcb2rcb_req,			// tcb tcr request
   tlb2rcb_addr,		// tlb tcr address
//   d2j_tsb_enable,		// jbc tsb snoop enable
//   d2j_tsb_base,		// jbc tsb base address
//   d2j_tsb_size,		// jbc tsb size
   mm2cl_tcr_rcd,		// clu tcr record
   mm2cl_tcr_req,		// clu tcr request
   rcb2ptb_addr,		// ptb snoop address
   rcb2ptb_vld,			// ptb snoop valid
   rcb2tcb_ack,			// tcb tcr acknowledge
   rcb2tcb_err,			// tcb tdr errors
   rcb2tcb_tag,			// tcb tdr tag 
   rcb2tcb_vld,			// tcb tdr valid
   rcb2tlb_dhi,			// tlb tdr data high
   rcb2tlb_dlo			// tlb tdr data low
   );

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input					clk;
  input					rst_l;

  input  [`FIRE_J2D_MMU_ADDR_BITS]	j2d_mmu_addr;
  input					j2d_mmu_addr_vld;
  input					cl2mm_tcr_ack;
  input  [`FIRE_DLC_TDR_BITS]		cl2mm_tdr_rcd;
  input					cl2mm_tdr_vld;
  input					csr2rcb_se;
//  input  [`FIRE_DLC_MMU_CSR_TB_BITS]	csr2rcb_tb;
//  input  [`FIRE_DLC_MMU_CSR_TS_BITS]	csr2rcb_ts;
  input  [`FIRE_DLC_MMU_TAG_PTR_BITS]	tcb2rcb_tag;
  input					tcb2rcb_req;
  input  [`FIRE_DLC_MMU_PTD_TAG_BITS]	tlb2rcb_addr;

//  output 				d2j_tsb_enable;
//  output [`FIRE_D2J_TSB_BASE_BITS]	d2j_tsb_base;
//  output [`FIRE_D2J_TSB_SIZE_BITS]	d2j_tsb_size;
  output [`FIRE_DLC_TCR_BITS]		mm2cl_tcr_rcd;
  output 				mm2cl_tcr_req;
  output [`FIRE_DLC_MMU_PTD_TAG_BITS] 	rcb2ptb_addr;
  output 				rcb2ptb_vld;
  output 				rcb2tcb_ack;
  output [`FIRE_DLC_MMU_RCB_ERR_BITS]	rcb2tcb_err;
  output [`FIRE_DLC_MMU_TAG_PTR_BITS]	rcb2tcb_tag;
  output 				rcb2tcb_vld;
  output [`FIRE_DLC_MMU_TDR_DATA_BITS]	rcb2tlb_dhi;
  output [`FIRE_DLC_MMU_TDR_DATA_BITS]	rcb2tlb_dlo;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
//  wire [`FIRE_D2J_TSB_BASE_BITS]	d2j_tsb_base;
//  wire [`FIRE_D2J_TSB_SIZE_BITS]	d2j_tsb_size;
  wire [`FIRE_DLC_TCR_BITS]		mm2cl_tcr_rcd;
  wire [`FIRE_DLC_MMU_RCB_ERR_BITS]	rcb2tcb_err;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS]	rcb2tcb_tag;
  wire [`FIRE_DLC_MMU_TDR_DATA_BITS]	rcb2tlb_dhi, rcb2tlb_dlo;
  wire [127:0]				data;
  wire [3:0] 				dpar, dpe;

  reg  [`FIRE_DLC_MMU_PTD_TAG_BITS]	rcb2ptb_addr;
  reg					rcb2ptb_vld;

// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------

  // 0in odd_parity -var {data[127:96], dpar[3]} -active cl2mm_tdr_vld
  // 0in odd_parity -var {data[95:64],  dpar[2]} -active cl2mm_tdr_vld
  // 0in odd_parity -var {data[63:32],  dpar[1]} -active cl2mm_tdr_vld
  // 0in odd_parity -var {data[31:0],   dpar[0]} -active cl2mm_tdr_vld

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------

// jbc tsb enable, base, and size 
//  wire	 d2j_tsb_enable = csr2rcb_se;
//  assign d2j_tsb_base   = csr2rcb_tb;
//  assign d2j_tsb_size   = csr2rcb_ts;

// clu tablewalk command request record
  assign mm2cl_tcr_rcd[`FIRE_DLC_TCR_MTAG_BITS] = tcb2rcb_tag;
  assign mm2cl_tcr_rcd[`FIRE_DLC_TCR_ADDR_BITS] = { {4{1'b0}},tlb2rcb_addr};

// clu tablewalk command record request and acknowledge
  wire	 mm2cl_tcr_req = tcb2rcb_req;
  wire	 rcb2tcb_ack   = cl2mm_tcr_ack;

// tdr record parsing
  assign data = cl2mm_tdr_rcd[`FIRE_DLC_TDR_DATA_BITS];
  assign dpar = cl2mm_tdr_rcd[`FIRE_DLC_TDR_DPAR_BITS];

// dpe is data parity error bits, one per 32 bits of data
  assign dpe[3] = ^data[127:96] ^ ~dpar[3];
  assign dpe[2] = ^data[95:64]  ^ ~dpar[2];
  assign dpe[1] = ^data[63:32]  ^ ~dpar[1];
  assign dpe[0] = ^data[31:0]   ^ ~dpar[0];

// tcb tablewalk mtag
  assign rcb2tcb_tag = cl2mm_tdr_rcd[`FIRE_DLC_TDR_MTAG_BITS];

// tcb tablewalk valid
  wire	 rcb2tcb_vld = cl2mm_tdr_vld;

// tcb tablewalk errors
  assign rcb2tcb_err[0] = cl2mm_tdr_rcd[`FIRE_DLC_TDR_CERR_BITS];
  assign rcb2tcb_err[1] = cl2mm_tdr_rcd[`FIRE_DLC_TDR_DERR_BITS];
  assign rcb2tcb_err[2] = |dpe;

// tlb tablewalk data
  assign rcb2tlb_dhi[`FIRE_DLC_MMU_TDR_KEY_BITS]    = data[`FIRE_DLC_MMU_TDD_KEY_BITS];		// 16-bit Key value
  assign rcb2tlb_dhi[`FIRE_DLC_MMU_TDR_PPN_BITS] = data[`FIRE_DLC_MMU_TDD_PPN_BITS];	// physical page number
  assign rcb2tlb_dhi[`FIRE_DLC_MMU_TDR_FNM_BITS]    = data[`FIRE_DLC_MMU_TDD_FNM_BITS];		// 3-bit Function Number
  assign rcb2tlb_dhi[`FIRE_DLC_MMU_TDR_KEYVLD_BITS]    = data[`FIRE_DLC_MMU_TDD_KEYVLD_BITS];		// valKeyid
  assign rcb2tlb_dhi[`FIRE_DLC_MMU_TDR_WRT_BITS]    = data[`FIRE_DLC_MMU_TDD_WRT_BITS];		// write enable
  assign rcb2tlb_dhi[`FIRE_DLC_MMU_TDR_VLD_BITS]    = data[`FIRE_DLC_MMU_TDD_VLD_BITS];		// valid

  wire [63:0]  datalo = data[127:64];

  assign rcb2tlb_dlo[`FIRE_DLC_MMU_TDR_KEY_BITS]    = datalo[`FIRE_DLC_MMU_TDD_KEY_BITS];		// 16-bit Key value
  assign rcb2tlb_dlo[`FIRE_DLC_MMU_TDR_PPN_BITS] = datalo[`FIRE_DLC_MMU_TDD_PPN_BITS];	// physical page number
  assign rcb2tlb_dlo[`FIRE_DLC_MMU_TDR_FNM_BITS]    = datalo[`FIRE_DLC_MMU_TDD_FNM_BITS];		// 3-bit Function Number
  assign rcb2tlb_dlo[`FIRE_DLC_MMU_TDR_KEYVLD_BITS]    = datalo[`FIRE_DLC_MMU_TDD_KEYVLD_BITS];		// valKeyid
  assign rcb2tlb_dlo[`FIRE_DLC_MMU_TDR_WRT_BITS]    = datalo[`FIRE_DLC_MMU_TDD_WRT_BITS];		// write enable
  assign rcb2tlb_dlo[`FIRE_DLC_MMU_TDR_VLD_BITS]    = datalo[`FIRE_DLC_MMU_TDD_VLD_BITS];		// valid
//  assign rcb2tlb_dlo[31:2] = {4'b0,data[102:77]};	// physical page number
//  assign rcb2tlb_dlo[1]    = data[65];		// write enable
//  assign rcb2tlb_dlo[0]    = data[64];		// valid

// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
  always @ (posedge clk) 
	if(~rst_l) begin
    rcb2ptb_addr <= {`FIRE_DLC_MMU_PTD_TAG_WDTH{1'b0}};
    rcb2ptb_vld  <= {{1'b0}};
    end
	else begin
    rcb2ptb_addr <= j2d_mmu_addr[38:6];
    rcb2ptb_vld  <= j2d_mmu_addr_vld & csr2rcb_se;
  end

endmodule // dmu_mmu_rcb
