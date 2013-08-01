// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_ptb.v
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
module dmu_mmu_ptb 
  (
   l2clk, 			// clock for rams
   clk, 			// clock
   rst_l,			// reset
   scan_in,
   tcu_array_bypass,
   tcu_se_scancollar_in,
   tcu_scan_en,
   tcu_array_wr_inhibit,
   tcu_pce_ov,
   tcu_aclk,
   tcu_bclk,
   scan_out,

   csr2ptb_inv,			// rcb snoop address
   csr2ptb_ra,			// rcb snoop valid
   csr2ptb_wa,			// tlb physical tag address
   csr2ptb_wd,			// csr tag invalidate
   csr2ptb_we,			// csr read address
   rcb2ptb_addr,		// csr write address
   rcb2ptb_vld,			// csr write data
   tcb2ptb_sel,			// csr write enable
   tcb2ptb_vld,			// tcb select
   tcb2ptb_wa,			// tcb valid
   tcb2ptb_we,			// tcb write address
   tlb2ptb_addr,		// tcb write enable
   ptb2csr_rd,			// csr read data
   ptb2tcb_hit,			// tcb physical tag hit
   ptb2vtb_inv,			// vtb tag invalidate

   dmu_cb0_run,
   dmu_cb0_addr,
   dmu_cb0_wdata_key,
   dmu_cb0_mmu_ptb_wr_en,
   dmu_cb0_mmu_ptb_rd_en,
   dmu_cb0_mmu_ptb_lkup_en,
   mmu_ptb_hit
   );

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input					l2clk;
  input					clk;
  input 				rst_l;
  input                                   scan_in;
  input                                   tcu_array_bypass;
  input                                   tcu_se_scancollar_in;
  input                                   tcu_scan_en;
  input                                   tcu_array_wr_inhibit;
  input                                   tcu_pce_ov;
  input                                   tcu_aclk;
  input                                   tcu_bclk;
  output                                  scan_out;

  input  [`FIRE_DLC_MMU_PTD_TAG_BITS]	rcb2ptb_addr;
  input 				rcb2ptb_vld;
  input  [`FIRE_DLC_MMU_PTD_TAG_BITS]	tlb2ptb_addr;
  input					csr2ptb_inv;
  input  [`FIRE_DLC_MMU_TAG_PTR_BITS]	csr2ptb_ra;
  input  [`FIRE_DLC_MMU_TAG_PTR_BITS]	csr2ptb_wa;
  input  [`FIRE_CSR_DATA_BITS]		csr2ptb_wd;
  input 				csr2ptb_we;
  input 				tcb2ptb_sel;
  input					tcb2ptb_vld;
  input  [`FIRE_DLC_MMU_TAG_PTR_BITS]	tcb2ptb_wa;
  input					tcb2ptb_we;

  input         dmu_cb0_run;
  input [5:0]   dmu_cb0_addr;
  input [32:0]  dmu_cb0_wdata_key;
  input         dmu_cb0_mmu_ptb_wr_en;
  input         dmu_cb0_mmu_ptb_rd_en;
  input         dmu_cb0_mmu_ptb_lkup_en;
  output [63:0] mmu_ptb_hit;
  
  output [`FIRE_CSR_DATA_BITS]		ptb2csr_rd;
  output				ptb2tcb_hit;
  output [`FIRE_DLC_MMU_TAG_BITS]	ptb2vtb_inv;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire [`FIRE_CSR_DATA_BITS]		ptb2csr_rd;
  wire [`FIRE_DLC_MMU_TAG_BITS] 	ptb2vtb_inv, tag_inv, nxt_inv;
  wire [`FIRE_DLC_MMU_TAG_BITS] 	hit_vld, nxt_vld, clr_vld;
  wire [`FIRE_DLC_MMU_PTD_TAG_BITS]	new_tag;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS]	new_wa;

//  reg  [`FIRE_DLC_MMU_PTD_TAG_BITS]	tag [`FIRE_DLC_MMU_TAG_MEM_BITS];
  reg  [`FIRE_DLC_MMU_TAG_BITS]		vld, set_vld, clr_vct;
//  reg  [`FIRE_DLC_MMU_TAG_BITS]		tag_ld, csr_inv;
  reg  [`FIRE_DLC_MMU_TAG_BITS]		csr_inv;
  wire  [`FIRE_DLC_MMU_TAG_BITS]	hit_inv;
  wire [`FIRE_DLC_MMU_TAG_BITS]		hit_out;
//  integer i;

// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------

  // 0in bits_on -var {csr2ptb_we, tcb2ptb_we} -max 1
  // 0in bits_on -var hit_inv -max 1
  // 0in decoder -in new_wa -out set_vld -active set_bit
  // 0in decoder -in new_wa -out clr_vct -active clr_bit
//**  // 0in decoder -in new_wa -out tag_ld -active new_we

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------

// csr read data
  assign ptb2csr_rd[`FIRE_DLC_MMU_PTD_RZ1_BITS] = 0;
  assign ptb2csr_rd[`FIRE_DLC_MMU_PTD_RZ0_BITS] = 0;
//  assign ptb2csr_rd[`FIRE_DLC_MMU_PTD_TAG_BITS] = tag[csr2ptb_ra];
//  assign ptb2csr_rd[42:39] 			= 4'b0;
  assign ptb2csr_rd[`FIRE_DLC_MMU_PTD_VLD_BITS] = vld[csr2ptb_ra];

// invalidate vector
  assign tag_inv = hit_inv | csr_inv;

// tcb hit is the physical address tlb tag hit
  wire   tlb_hit = rcb2ptb_vld & (rcb2ptb_addr == tlb2ptb_addr);

  wire	 ptb2tcb_hit = csr2ptb_inv | tlb_hit;

// vtb cache tag invalidate
  assign ptb2vtb_inv = tag_inv;

// new tag address, write address, and write enable
  assign new_tag = tcb2ptb_sel ? tlb2ptb_addr : csr2ptb_wd[`FIRE_DLC_MMU_PTD_TAG_BITS];
  assign new_wa  = tcb2ptb_sel ? tcb2ptb_wa   : csr2ptb_wa;

  wire	 new_we  = tcb2ptb_we | csr2ptb_we;

// csr valid set and clear
  wire	 csr_set = csr2ptb_we &  csr2ptb_wd[0];
  wire	 csr_clr = csr2ptb_we & ~csr2ptb_wd[0];

// tcb valid set and clear
  wire	 tcb_set = tcb2ptb_we &  tcb2ptb_vld;
  wire	 tcb_clr = tcb2ptb_we & ~tcb2ptb_vld;

// valid bit set and clear
  wire	 set_bit = tcb_set | csr_set;
  wire	 clr_bit = tcb_clr | csr_clr;

// valid bit set for the valid bit vector
  always @ (new_wa or set_bit) begin
    set_vld         = 0;
    set_vld[new_wa] = set_bit;
  end

// valid bit clear for the valid bit vector
  always @ (new_wa or clr_bit) begin
    clr_vct         = 0;
    clr_vct[new_wa] = clr_bit;
  end

  assign clr_vld = clr_vct | tag_inv;

// next valid bit vector
  assign nxt_vld = (vld & ~clr_vld) | set_vld;

// tag load
//  always @ (new_we or new_wa or rst_l) begin
//    tag_ld         = { `FIRE_DLC_MMU_TAG_SIZE { ~rst_l } };
//    tag_ld[new_wa] = new_we | ~rst_l;
//  end

// tag request vector
  assign hit_vld = rcb2ptb_vld ? vld & ~tag_inv : 0;

// csr invalidate
  assign nxt_inv = csr2ptb_inv ? csr2ptb_wd[`FIRE_DLC_MMU_TAG_BITS] : 0;

// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
  always @ (posedge clk) begin
    if (!rst_l) begin
      vld     <= 0;
      csr_inv <= 0; 
    end
    else begin
      vld     <= nxt_vld;
      csr_inv <= nxt_inv;
    end
  end
/*
//  always @ (posedge clk) begin
//    for (i = 0; i < `FIRE_DLC_MMU_TAG_SIZE; i = i + 1) begin
//      hit_inv[i] <= hit_vld[i] & (rcb2ptb_addr == tag[i]);
//      if (tag_ld[i]) tag[i] <= new_tag;
//    end
//  end
*/
//BP 9-23-04 add scan bypass mux
// 	note new_tag comes from flops in
wire	[32:0]	ptb_out;
assign	ptb2csr_rd[38:6] = tcu_array_bypass ? tlb2ptb_addr[`FIRE_DLC_MMU_PTD_TAG_BITS] : ptb_out[32:0];

//SV 02/24/05 added BIST logic
  wire    [32:0]  din_cam, key_cam ;
  wire    [5:0]   rd_addr_cam, wr_addr_cam ;
  wire            wr_en_cam, rd_en_cam, lkup_en_cam ;

  assign  mmu_ptb_hit    =   hit_out ;
  assign  din_cam        =   dmu_cb0_run ? dmu_cb0_wdata_key : new_tag[38:6] ;
  assign  rd_addr_cam    =   dmu_cb0_run ? dmu_cb0_addr : csr2ptb_ra ;
  assign  wr_addr_cam    =   dmu_cb0_run ? dmu_cb0_addr : new_wa ;
  assign  wr_en_cam      =   dmu_cb0_run ? dmu_cb0_mmu_ptb_wr_en : new_we ;
  assign  rd_en_cam      =   dmu_cb0_run ? dmu_cb0_mmu_ptb_rd_en : 1'b1 ;
  assign  key_cam        =   dmu_cb0_run ? dmu_cb0_wdata_key : rcb2ptb_addr[38:6] ;
  assign  lkup_en_cam    =   dmu_cb0_run ? dmu_cb0_mmu_ptb_lkup_en : 1'b1 ;


/*      0in     memory_access   -read_addr      rd_addr_cam      -read (rd_en_cam & ~wr_en_cam)
                                -write_addr     wr_addr_cam          -write wr_en_cam
				-latency 1
				-write_data     din_cam   -read_data ptb_out[32:0]
				-group mbist_mode
*/

        n2_mmu_cm_64x34s_cust ptb_cam
        (
     // address ports
     .rd_addr     (rd_addr_cam),
     .wr_addr     (wr_addr_cam),

     // clock ports
     .clk     (l2clk),

     // data input ports
     .din      (din_cam),

     // data output ports
//     .dout      (ptb2csr_rd[38:6]),
     .dout      (ptb_out[32:0]),

     // port enables
     .wr_en      (wr_en_cam),
     .rd_en      (rd_en_cam),

     // key--address to CAM against
     .key      (key_cam),

     // key--address to CAM against
     .lkup_en      (lkup_en_cam),

     // hold key
     .hld          (1'b0),

     // 64 hit values after CAM'ing
     .hit      (hit_out),


        // scan ports
        .scan_in                (scan_in),
        .tcu_se_scancollar_in   (tcu_se_scancollar_in),
        .tcu_scan_en   		(tcu_scan_en),
        .tcu_array_wr_inhibit   (tcu_array_wr_inhibit),
        .tcu_pce_ov             (tcu_pce_ov),
        .pce           		(1'b1),
        .tcu_aclk               (tcu_aclk),
        .tcu_bclk               (tcu_bclk),
        .scan_out               (scan_out)
     );

reg	[63:0]	hit_vld_d;
  always @ (posedge clk) 
	if(~rst_l) begin
      hit_vld_d <= {64{1'b0}};
	end
	else begin
      hit_vld_d <= hit_vld;
    end

assign  hit_inv =       hit_vld_d & hit_out;

endmodule // dmu_mmu_ptb
