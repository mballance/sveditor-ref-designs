// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_vtb.v
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
module dmu_mmu_vtb 
  (
   l2clk,			// clock for rams
   clk,				// clock
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

   csr2vtb_ra,			// csr read address
   csr2vtb_wa,			// csr write address
   csr2vtb_wd,			// csr write data
   csr2vtb_we,			// csr write enable
   ptb2vtb_inv,			// ptb invalidate
   tcb2vtb_hld,			// tcb hold
   tcb2vtb_sel,			// tcb select
   tcb2vtb_tmv,			// tcb translation mode valid
   tcb2vtb_vld,			// tcb valid
   tcb2vtb_wa,			// tcb write address
   tcb2vtb_we,			// tcb write enable
   tlb2vtb_addr,		// tlb virtual tag
   tlb2vtb_iotsbno,		// tlb virtual iotsb for sun4v mode
   vab2vtb_addr,		// vab address
   vab2vtb_dbra,		// vab read address
   vab2vtb_iotsbno,		// vab iotsb number for sun4v mode
   sun4v_mode,			// 1 if in suv4v mode
   vtb2crb_hit,			// crb hit
   vtb2crb_inv,			// crb tag invalidate
   vtb2crb_tag,			// crb invalidate tag
   vtb2crb_vld,			// crb valid
   vtb2csr_prf,			// vtb performance event
   vtb2csr_rd,			// csr read data
   vtb2tcb_hit,			// tcb virtual tag hit
   vtb2tdb_dbra,		// tdb data buffer read address
   vtb2tlb_dbra,		// tlb data buffer read address

   dmu_cb0_run,
   dmu_cb0_addr,
   dmu_cb0_wdata_key,
   dmu_cb0_mmu_vtb_wr_en,
   dmu_cb0_mmu_vtb_rd_en,
   dmu_cb0_mmu_vtb_lkup_en,
   dmu_cb0_hld,
   mmu_vtb_hit,
   vtb_dout_4msb

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

  input  [`FIRE_DLC_MMU_TAG_PTR_BITS]	csr2vtb_ra;
  input  [`FIRE_DLC_MMU_TAG_PTR_BITS]	csr2vtb_wa;
  input  [`FIRE_DLC_MMU_VTR_BITS]	csr2vtb_wd;
  input 				csr2vtb_we;
  input  [`FIRE_DLC_MMU_TAG_BITS]	ptb2vtb_inv;
  input 				tcb2vtb_hld;
  input 				tcb2vtb_sel;
  input 				tcb2vtb_tmv;
  input 				tcb2vtb_vld;
  input  [`FIRE_DLC_MMU_TAG_PTR_BITS]	tcb2vtb_wa;
  input  				tcb2vtb_we;
  input  [`FIRE_DLC_MMU_VTD_VPN_BITS]	tlb2vtb_addr;
  input  [`FIRE_DLC_MMU_VAR_IOTSB_BITS]	tlb2vtb_iotsbno;
  input  [`FIRE_DLC_MMU_VTD_VPN_BITS] 	vab2vtb_addr;
  input  [`FILE_DLC_MMU_TTE_CNT_BITS]	vab2vtb_dbra;
  input  [`FIRE_DLC_MMU_VAR_IOTSB_BITS]	vab2vtb_iotsbno;
  input  				sun4v_mode;

  output [`FIRE_DLC_MMU_TAG_BITS]	vtb2crb_hit;
  output 				vtb2crb_inv;
  output [`FIRE_DLC_MMU_TAG_PTR_BITS] 	vtb2crb_tag;
  output [`FIRE_DLC_MMU_TAG_BITS]	vtb2crb_vld;
  output 				vtb2csr_prf;
  output [`FIRE_DLC_MMU_VTR_BITS] 	vtb2csr_rd;
  output 				vtb2tcb_hit;
  output [`FIRE_DLC_MMU_TDB_PTR_BITS] 	vtb2tdb_dbra;
  output [`FIRE_DLC_MMU_TDB_PTR_BITS] 	vtb2tlb_dbra;

  input         dmu_cb0_run;
  input [5:0]   dmu_cb0_addr;
  input [32:0]  dmu_cb0_wdata_key;
  input         dmu_cb0_mmu_vtb_wr_en;
  input         dmu_cb0_mmu_vtb_rd_en;
  input         dmu_cb0_mmu_vtb_lkup_en;
  input         dmu_cb0_hld;
  output [63:0] mmu_vtb_hit;
  output [3:0]  vtb_dout_4msb;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire [`FIRE_DLC_MMU_VTR_BITS]		vtb2csr_rd;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS] 	vtb2crb_tag, hit_tag;
  wire [`FIRE_DLC_MMU_TAG_BITS] 	vtb2crb_hit, vtb2crb_vld, hit_vld;
  wire [`FIRE_DLC_MMU_TDB_PTR_BITS] 	vtb2tdb_dbra, vtb2tlb_dbra, dbra_ps1;
  wire [`FIRE_DLC_MMU_VTD_VPN_BITS]	new_tag;
  wire [`FIRE_DLC_MMU_TAG_PTR_BITS]	new_wa;
  wire [`FIRE_DLC_MMU_TAG_BITS] 	nxt_vld, clr_vld;
  wire [`FIRE_DLC_MMU_VAR_IOTSB_BITS]	new_tag_iotsbno;
  wire					sun4v_mode;

//  reg  [`FIRE_DLC_MMU_VTD_VPN_BITS]	tag [`FIRE_DLC_MMU_TAG_MEM_BITS];
  wire  [`FIRE_DLC_MMU_TAG_BITS]	hit_ps1,hit_out;
  reg  [`FIRE_DLC_MMU_TAG_BITS]		tag_ld, tld;
  reg  [`FIRE_DLC_MMU_TAG_BITS]		vld, set_vld, clr_vct;

//  integer i;

// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------

  // 0in bits_on -var {csr2vtb_we, tcb2vtb_we} -max 1
  // 0in bits_on -var hit_vld -max 1
  // 0in decoder -in new_wa -out set_vld -active set_bit
  // 0in decoder -in new_wa -out clr_vct -active clr_bit
  // 0in decoder -in new_wa -out tag_ld -active new_we
  // 0in encoder -in hit_vld -out hit_tag -zero off
  // 0in encoder -in ptb2vtb_inv -out vtb2crb_tag -zero off -active ~sun4v_mode

// ----------------------------------------------------------------------------
// Functions
// ----------------------------------------------------------------------------
  function [`FIRE_DLC_MMU_TAG_PTR_BITS] tag_enc;
    input [`FIRE_DLC_MMU_TAG_BITS]	di;

    reg  [`FIRE_DLC_MMU_TAG_PTR_BITS]	do;
    reg  [1+`FIRE_DLC_MMU_TAG_PTR_BITS]	i;

    parameter	MAX = { 1'b0, { `FIRE_DLC_MMU_TAG_PTR_SIZE {1'b1} } };
    
    begin
      do = 0;
      for (i = 0; i <= MAX; i = i + 1) begin
	if (di[i[`FIRE_DLC_MMU_TAG_PTR_BITS]])
	  do = i[`FIRE_DLC_MMU_TAG_PTR_BITS];
      end
      tag_enc = do;
    end
  endfunction // tag_enc

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------
// new tag address, write address, and write enable
  assign new_tag = tcb2vtb_sel ? tlb2vtb_addr : csr2vtb_wd
						[`FIRE_DLC_MMU_VTR_VPN_BITS];
  assign new_tag_iotsbno = sun4v_mode ? (tcb2vtb_sel ? tlb2vtb_iotsbno : csr2vtb_wd[`FIRE_DLC_MMU_VTR_IOTSBNO_BITS]) : 5'b0;

  assign new_wa  = tcb2vtb_sel ? tcb2vtb_wa   : csr2vtb_wa;

  wire	 new_we  = tcb2vtb_we | csr2vtb_we;

// csr valid set and clear
  wire	 csr_set = csr2vtb_we &  csr2vtb_wd[`FIRE_DLC_MMU_VTR_VLD_BITS];
  wire	 csr_clr = csr2vtb_we & ~csr2vtb_wd[`FIRE_DLC_MMU_VTR_VLD_BITS];

// tcb valid set and clear
  wire	 tcb_set = tcb2vtb_we &  tcb2vtb_vld;
  wire	 tcb_clr = tcb2vtb_we & ~tcb2vtb_vld;

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

  assign clr_vld = clr_vct | ptb2vtb_inv;

// next valid bit vector
  assign nxt_vld = (vld & ~clr_vld) | set_vld;

// tag write enables
  always @ (new_we or new_wa or rst_l) begin
    tag_ld         = { `FIRE_DLC_MMU_TAG_SIZE { ~rst_l } };
    tag_ld[new_wa] = new_we | ~rst_l;
  end

// hit valid and hit invalidate
  assign hit_vld = hit_ps1 & vld;
  wire   hit_inv = |ptb2vtb_inv;

// data buffer read address encoding
  assign hit_tag  = tag_enc (hit_vld);
  assign dbra_ps1 = {hit_tag, vab2vtb_dbra};

// crb hit, invalidate, tag, and valid
  assign vtb2crb_hit = hit_vld;
  wire	 vtb2crb_inv = hit_inv;
  assign vtb2crb_tag = tag_enc (ptb2vtb_inv);
  assign vtb2crb_vld = vld;

// csr performance events
  wire   vtb2csr_prf = hit_inv;

// csr read data
//  assign vtb2csr_rd[`FIRE_DLC_MMU_VTR_TAG_BITS] = tag[csr2vtb_ra];
  assign vtb2csr_rd[`FIRE_DLC_MMU_VTR_VLD_BITS] = vld[csr2vtb_ra];

// tcb hit is the virtual address tag hit
  wire	 vtb2tcb_hit = |(hit_vld & ~tld);

// data buffer read addresses
  assign vtb2tdb_dbra = dbra_ps1;
  assign vtb2tlb_dbra = dbra_ps1;

// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
  always @ (posedge clk) begin
    if (!rst_l) begin
      vld <= 0;
    end
    else begin
      vld <= nxt_vld;
    end
  end

  always @ (posedge clk) 
	if(~rst_l) begin
      tld <= {`FIRE_DLC_MMU_TAG_SIZE{1'b0}};
	end
	else begin
    if (!tcb2vtb_hld) begin
      tld <= tag_ld;
    end
    else begin
      tld <= tld | tag_ld;
    end
  end

//  always @ (posedge clk) begin
//    for (i = 0; i < `FIRE_DLC_MMU_TAG_SIZE; i = i + 1) begin
//      if (tag_ld[i]) begin
//	tag[i] <= new_tag;
//      end
//      if (!tcb2vtb_hld) begin
//	hit_ps1[i] <= tcb2vtb_tmv & vld[i] & (vab2vtb_addr == tag[i]);
//      end
//    end
//  end
//BP n2 6-30-04 new cam model
wire	[3:0]	spare;
wire	[4:0]	sun4v_bits;
assign	sun4v_bits = sun4v_mode ? vab2vtb_iotsbno : {5{1'b0}};

//BP 9-23-04 add dout bypass mux for scan
//	note tlb2vtb_addr comes from flops in dmu_mmu_tlb.v
wire	[23:0]				vtb_out1;
wire	[4:0]				vtb_out2;
assign	vtb2csr_rd[`FIRE_DLC_MMU_VTR_IOTSBNO_BITS] 	= tcu_array_bypass ? tlb2vtb_addr[20:16] : vtb_out2 ;
assign	vtb2csr_rd[`FIRE_DLC_MMU_VTR_VPN_BITS] 		= tcu_array_bypass ? tlb2vtb_addr : vtb_out1 ;

//SV 02/24/05 added BIST logic
  wire    [32:0]  din_cam, key_cam ;
  wire    [5:0]   rd_addr_cam, wr_addr_cam ;
  wire            wr_en_cam, rd_en_cam, lkup_en_cam, hld_cam ;

  assign  mmu_vtb_hit    =   hit_out ;
  assign  vtb_dout_4msb  =   spare[3:0] ;
  assign  din_cam        =   dmu_cb0_run ? dmu_cb0_wdata_key : ({{4{1'b0}},new_tag_iotsbno,new_tag}) ;
  assign  rd_addr_cam    =   dmu_cb0_run ? dmu_cb0_addr : csr2vtb_ra ;
  assign  wr_addr_cam    =   dmu_cb0_run ? dmu_cb0_addr : new_wa ;
  assign  wr_en_cam      =   dmu_cb0_run ? dmu_cb0_mmu_vtb_wr_en : new_we ;
  assign  rd_en_cam      =   dmu_cb0_run ? dmu_cb0_mmu_vtb_rd_en : 1'b1 ;
  assign  hld_cam        =   dmu_cb0_run ? dmu_cb0_hld : tcb2vtb_hld ;
  assign  key_cam        =   dmu_cb0_run ? dmu_cb0_wdata_key : ({{4{1'b0}},sun4v_bits,vab2vtb_addr}) ;
  assign  lkup_en_cam    =   dmu_cb0_run ? dmu_cb0_mmu_vtb_lkup_en : tcb2vtb_tmv ;


/*	0in	memory_access	-read_addr	rd_addr_cam	-read (rd_en_cam & ~wr_en_cam)
				-write_addr	wr_addr_cam		-write wr_en_cam
				-latency 1
				-write_data din_cam
				-read_data {spare[3:0],vtb_out2,vtb_out1}
*/
        n2_mmu_cm_64x34s_cust vtb_cam 
        (
     // address ports
     .rd_addr     (rd_addr_cam),
     .wr_addr     (wr_addr_cam),

     // clock ports
     .clk     (l2clk),

     // data input ports
     .din      (din_cam),

     // data output ports
//     .dout      ({spare,vtb2csr_rd[`FIRE_DLC_MMU_VTR_IOTSBNO_BITS],vtb2csr_rd[`FIRE_DLC_MMU_VTR_VPN_BITS]}),
     .dout      ({spare[3:0],vtb_out2,vtb_out1}),

     // port enables
     .wr_en      (wr_en_cam),
     .rd_en      (rd_en_cam),

     // key--address to CAM against
     .key      (key_cam),

     // key--address to CAM against
     .lkup_en      (lkup_en_cam),

     // hold key 
     .hld      	   (hld_cam),

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

reg	[63:0]	vld_d;
  always @ (posedge clk) 
	if(~rst_l) begin
	vld_d <= {64{1'b0}};
	end
	else begin
      if (!tcb2vtb_hld) begin
	vld_d <= vld;
      end
    end
//assign	hit_ps1	=	{64{tcb2vtb_tmv}} & vld & hit_out;
assign	hit_ps1	=	vld_d & hit_out;

endmodule // dmu_mmu_vtb
