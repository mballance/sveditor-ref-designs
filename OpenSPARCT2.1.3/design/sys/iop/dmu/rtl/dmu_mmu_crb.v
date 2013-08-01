// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_crb.v
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
module dmu_mmu_crb 
  (
   clk,				// clock
   rst_l,			// reset
   csr2crb_ds_a,		// csr debug select a
   csr2crb_ds_b,		// csr debug select b
   csr2crb_ra,			// csr read address
   csr2crb_wa,			// csr write address
   csr2crb_wd,			// csr write data
   csr2crb_we,			// csr write enable
   tcb2crb_req,			// tcb tag request
   vtb2crb_hit,			// vtb hit
   vtb2crb_inv,			// vtb tag invalidate
   vtb2crb_tag,			// vtb invalidate tag
   vtb2crb_vld,			// vtb valid
   crb2csr_dbg_a,		// csr debug bus a
   crb2csr_dbg_b,		// csr debug bus b
   crb2csr_rd,			// csr read data
   crb2tcb_tag			// tcb replacment tag
   );
     
// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------
  parameter	CNT_MAX = { `FIRE_DLC_MMU_VTC_WDTH {1'b1} };

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input					clk;
  input 				rst_l;

  input  [`FIRE_DLC_MMU_TAG_PTR_BITS]	csr2crb_ra;
  input  [`FIRE_DLC_MMU_TAG_PTR_BITS]	csr2crb_wa;
  input  [`FIRE_DLC_MMU_VTC_BITS]	csr2crb_wd;
  input 				csr2crb_we;
  input  [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2crb_ds_a;
  input  [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2crb_ds_b;
  input 				tcb2crb_req;
  input  [`FIRE_DLC_MMU_TAG_BITS]	vtb2crb_hit;
  input 				vtb2crb_inv;
  input  [`FIRE_DLC_MMU_TAG_PTR_BITS]	vtb2crb_tag;
  input  [`FIRE_DLC_MMU_TAG_BITS]	vtb2crb_vld;

  output [`FIRE_DBG_DATA_BITS] 		crb2csr_dbg_a;
  output [`FIRE_DBG_DATA_BITS] 		crb2csr_dbg_b;
  output [`FIRE_DLC_MMU_VTC_BITS]	crb2csr_rd;
  output [`FIRE_DLC_MMU_TAG_PTR_BITS]	crb2tcb_tag;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire [`FIRE_DBG_DATA_BITS]		crb2csr_dbg_a, crb2csr_dbg_b;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS]	crb2tcb_tag, nxt_ptr;
  wire [`FIRE_DLC_MMU_VTC_BITS] 	crb2csr_rd;
  wire [`FIRE_DLC_MMU_VTC_BITS] 	cnt_ptr, cnt_tag0, cnt_tag1;
  wire [`FIRE_DLC_MMU_TAG_BITS] 	cnt_clr;
  wire [1:0] 				tag_dn, tag_ld, tag_up, tag_tst;
  wire [1:0]				vld_tag, inv_not_req;

  reg  [`FIRE_DLC_MMU_VTC_BITS]		cnt [`FIRE_DLC_MMU_TAG_MEM_BITS];
  reg  [`FIRE_DLC_MMU_TAG_BITS]		cnt_inc, cnt_ld, cnt_rst;
  reg  [`FIRE_DLC_MMU_TAG_PTR_BITS] 	ptr, que_tag [0:1];
  reg  [1:0]				tag_chk;
  reg					skp;

  reg  [`FIRE_DLC_MMU_CSR_DS_BITS]	dbg_sel [0:1];
  reg  [`FIRE_DBG_DATA_BITS]		dbg_bus [0:1];

  integer i;

// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------

  // 0in decoder -in ptr -out cnt_inc -active inc_cnt
  // 0in decoder -in csr2crb_wa -out cnt_ld -active csr2crb_we
  // 0in decoder -in que_tag[0] -out cnt_rst -active req_not_inv

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------
// pointer and tag counts and valids
  assign cnt_ptr  = cnt[ptr];
  assign cnt_tag0 = cnt[que_tag[0]];
  assign cnt_tag1 = cnt[que_tag[1]];

  wire	 vld_ptr    = vtb2crb_vld[ptr];
  assign vld_tag[0] = vtb2crb_vld[que_tag[0]];
  assign vld_tag[1] = vtb2crb_vld[que_tag[1]];

// tag equals pointer and tags equal invalidate
  wire   tag_eqs_hit = vtb2crb_hit[que_tag[0]];
  wire   tag_eqs_inv = (que_tag[0] == vtb2crb_tag);
  wire   tag_eqs_ptr = (que_tag[0] == ptr);

// tag request
  wire   tag_request = tcb2crb_req |  tag_eqs_hit;
  wire   tag_invalid = vtb2crb_inv & ~tag_eqs_inv;
  wire   tag_freeze  = vtb2crb_inv &  tag_eqs_inv;

// request and invalidate combinations
  wire	 req_not_inv    = tag_request & ~tag_invalid;
  assign inv_not_req[0] = tag_invalid & ~tcb2crb_req;
  assign inv_not_req[1] = tag_invalid & ~tag_request;

// tag checks
  wire   tag_spc    = ~tag_freeze  & ~skp;
  assign tag_tst[0] = ~tag_freeze  & (cnt_tag0 < cnt_ptr);
  assign tag_tst[1] = ~tag_eqs_ptr & (cnt_tag1 < cnt_ptr);

  always @ (tag_eqs_ptr or tag_spc or tag_tst or vld_ptr or vld_tag) begin
    case ({vld_tag, vld_ptr})
      3'b000 : tag_chk = 0;
      3'b001 : tag_chk = 0;
      3'b010 : tag_chk = {1'b0, tag_spc};
      3'b011 : tag_chk = {1'b0, tag_tst[0]};
      3'b100 : tag_chk = {~tag_eqs_ptr, 1'b0};
      3'b101 : tag_chk = {tag_tst[1], 1'b0};
      3'b110 : tag_chk = {1'b0, tag_spc};
      3'b111 : tag_chk = tag_tst;
    endcase
  end

// pointer hold
  wire   ptr_hld = tag_request ^ tag_invalid;

// next pointer
  assign nxt_ptr = ptr_hld ? ptr : ptr + 1;

// next skip
  wire   nxt_skp = req_not_inv & tag_eqs_ptr;

// count update controls
  wire   inc_cnt = vld_ptr & ~(cnt_ptr == CNT_MAX) & ~ptr_hld;

  always @ (ptr or inc_cnt) begin
    cnt_inc      = 0;
    cnt_inc[ptr] = inc_cnt;
  end

  always @ (csr2crb_wa or csr2crb_we) begin
    cnt_ld             = 0;
    cnt_ld[csr2crb_wa] = csr2crb_we;
  end

  always @ (req_not_inv or que_tag[0]) begin
    cnt_rst             = 0;
    cnt_rst[que_tag[0]] = req_not_inv;
  end

  assign cnt_clr = cnt_rst | vtb2crb_hit | ~vtb2crb_vld;

// tag update controls
  assign tag_dn[0] = req_not_inv;
  assign tag_dn[1] = req_not_inv;
  assign tag_up[0] = inv_not_req[0];
  assign tag_up[1] = inv_not_req[1] | tag_chk[0];
  assign tag_ld[0] = tag_chk[0];
  assign tag_ld[1] = tag_chk[1];

// csr lru count
  assign crb2csr_rd = cnt[csr2crb_ra];

// tcb replacement tag
  assign crb2tcb_tag = tag_invalid ? vtb2crb_tag : que_tag[0];

// ----------------------------------------------------------------------------
// Debug
// ----------------------------------------------------------------------------
  always @ (csr2crb_ds_a or csr2crb_ds_b) begin
    dbg_sel[0] = csr2crb_ds_a;
    dbg_sel[1] = csr2crb_ds_b;
  end

  assign crb2csr_dbg_a = dbg_bus[0];
  assign crb2csr_dbg_b = dbg_bus[1];

// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
  always @ (posedge clk) begin
    if (!rst_l) begin
      ptr <= 0;
      skp <= 0;
    end
    else begin
      ptr <= nxt_ptr;
      skp <= nxt_skp;
    end
  end

  always @ (posedge clk) begin
    if (!rst_l)         que_tag[0] <= 0;
    else if (tag_dn[0]) que_tag[0] <= que_tag[1];
    else if (tag_up[0]) que_tag[0] <= vtb2crb_tag;
    else if (tag_ld[0]) que_tag[0] <= ptr;
  end

  always @ (posedge clk) begin
    if (!rst_l)         que_tag[1] <= 1;
    else if (tag_dn[1]) que_tag[1] <= que_tag[1] + 1;
    else if (tag_up[1]) que_tag[1] <= que_tag[0];
    else if (tag_ld[1]) que_tag[1] <= ptr;
  end

  always @ (posedge clk) 
	if(~rst_l) begin : cnt_tag_rst
		integer j;
    for (j = 0; j < `FIRE_DLC_MMU_TAG_SIZE; j = j + 1) begin
	cnt[j] <= {`FIRE_DLC_MMU_VTC_WDTH{1'b0}};
	end
     end
   else begin
    for (i = 0; i < `FIRE_DLC_MMU_TAG_SIZE; i = i + 1) begin
      if  (cnt_ld[i])      cnt[i] <= csr2crb_wd;
      else if (cnt_clr[i]) cnt[i] <= 0;
      else if (cnt_inc[i]) cnt[i] <= cnt_ptr + 1;
    end
  end

  always @ (posedge clk) 
	if(~rst_l) begin : dbg_rst
		integer j;
    for (j = 0; j < 2; j = j + 1) begin
	dbg_bus[j] <= {`FIRE_DEBUG_WDTH{1'b0}};
	end
       end
	else begin
    for (i = 0; i < 2; i = i + 1) begin
      case (dbg_sel[i]) // synopsys infer_mux
	3'b000: dbg_bus[i] <= { tcb2crb_req, vtb2crb_inv, vtb2crb_tag };
	3'b001: dbg_bus[i] <= { tag_dn[0], tag_up[0], que_tag[0] };
	3'b010: dbg_bus[i] <= { tag_dn[1], tag_up[1], que_tag[1] };
	3'b011: dbg_bus[i] <= { tag_chk, tag_ld, tag_up, tag_dn };
	3'b100: dbg_bus[i] <= { tag_chk, ptr };
	3'b101: dbg_bus[i] <= 8'h00;
	3'b110: dbg_bus[i] <= 8'h00;
	3'b111: dbg_bus[i] <= 8'h00;
      endcase
    end
  end

endmodule // dmu_mmu_crb
