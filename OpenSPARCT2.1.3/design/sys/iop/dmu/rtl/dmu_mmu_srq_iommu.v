// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_srq_iommu.v
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
module dmu_mmu_srq_iommu 
  (
   l2clk,			// clock for ram
   clk,				// clock
   rst_l,			// synchronous reset
   por_l,			// por synchronous reset
   scan_in,
   tcu_array_bypass,
   tcu_scan_en,
   tcu_se_scancollar_in,
   tcu_array_wr_inhibit,
   tcu_pce_ov,
   tcu_aclk,
   tcu_bclk,
   scan_out,

   ld,				// load
   ds,				// data select
   di,				// data in
   sun4v_mode,			// 1 if sun4v_mode
   do,				// data out
   srq2vab_sun4v_pgsz,		// sun4v page size to vab to zero before tlb lookup
   srq2vab_sun4v_byp_ps0,	// true if sun4v mode and bypass
   srq2tmc_sun4v_pgsz_err,	// true if sun4v mode and illegal sun4v page size
   iotsbno,			// iotsb number in stage ps0 to vtb and vab
   iotsb_basepa,		// iotsb base pa for tablewalks
   srq2vab_np,			// number of pages out of iotsb for sun4v out of range calc
   srq2vab_adva,		// adjusted va after offset
   srq2tmc_ivld,		// iotsb valid bit and'ed with sun4v_mode
   srq2tmc_ipe,			// iotsb parity error or tmc block
   csr2dev_iotsb_wd,
   dev_iotsb2csr_rd,
   csr2dev2iotsb_we,
   csr2dev2iotsb_re,
   csr2IotsbDesc_we,
   csr2IotsbDesc_re,
   csr2dev_iotsb_rwa,
   busid_sel,
   lkup_deque_en,
   csr_done,
   dsn_dmc_iei,			// NCU can force a parity error on deviotsb reads
   dmu_mb0_run,

   dmu_mb0_addr,
   dmu_mb0_wdata,
   dmu_mb0_dev_wr_en,
   dmu_mb0_dev_rd_en,
   dmu_mb0_tsb_wr_en,
   dmu_mb0_tsb_rd_en,
//efu wires 
   efu_dmu_data,        // input efu to devtsb
   efu_dmu_xfer_en,     // input efu to devtsb
   efu_dmu_clr    ,     // input efu to devtsb
   dmu_efu_data,        // output of devtsb to efu
   dmu_efu_xfer_en      // output of devtsb to efu
   );
     
// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------
  parameter	QD = 4,		// queue depth
//		QW = 2;		// queue width
		QW = 85;		// queue width

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input			l2clk;
  input			clk;
  input                 rst_l;
  input                 por_l;
  input                                   scan_in;
  input                                   tcu_array_bypass;
  input                                   tcu_scan_en;
  input                                   tcu_se_scancollar_in;
  input                                   tcu_array_wr_inhibit;
  input                                   tcu_pce_ov;
  input                                   tcu_aclk;
  input                                   tcu_bclk;
  output                                  scan_out;

  input  [QD-1:0]	ld;
  input  [QD-2:0]	ds;

  input  [QW-1:0]	di;
  input 		sun4v_mode;
  input [`FIRE_CSR_DATA_BITS]          csr2dev_iotsb_wd;
  input                                csr2dev2iotsb_we;
  input                                csr2dev2iotsb_re;
  input                                csr2IotsbDesc_we;
  input                                csr2IotsbDesc_re;
  input [4:0]                          csr2dev_iotsb_rwa;
  input				       busid_sel;

  output [2:0]		srq2vab_sun4v_pgsz;
  output 		srq2vab_sun4v_byp_ps0;
  output 		srq2tmc_sun4v_pgsz_err;
  output [QW-1:0]	do;
  output [4:0]		iotsbno;
  output [25:0]		iotsb_basepa;
  output [3:0]		srq2vab_np;
  output [27:0]		srq2vab_adva;
  output		srq2tmc_ivld;
  output		srq2tmc_ipe;
  output [`FIRE_CSR_DATA_BITS]  dev_iotsb2csr_rd;
  output                lkup_deque_en;
  output 		csr_done;
  input 		dsn_dmc_iei;

  input         dmu_mb0_run;

  input [4:0]   dmu_mb0_addr;
  input [7:0]   dmu_mb0_wdata;
  input		dmu_mb0_dev_wr_en;
  input		dmu_mb0_dev_rd_en;
  input         dmu_mb0_tsb_wr_en;
  input		dmu_mb0_tsb_rd_en;
//efu wires
  input         efu_dmu_data ;        // input efu to devtsb
  input         efu_dmu_xfer_en;      // input efu to devtsb
  input         efu_dmu_clr;          // input efu to devtsb
  output        dmu_efu_data;         // output of devtsb to efu
  output        dmu_efu_xfer_en ;     // output of devtsb to efu

wire             dmu_efu_data ;
wire             dmu_efu_xfer_en ;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire [QW-1:0] 	do;
//  reg  [QW-1:0]		que [0:QD-1];
  reg  [QW-1:0]		que_0;
  reg  [QW-1:0]		que_1;
  reg  [QW-1:0]		que_2;
  reg  [QW-1:0]		que_3;

//  integer i;

  wire [27:0]		srq2vab_adva;
// SRAM header to EFU
wire            hdr_efu_read_data;
wire            hdr_efu_xfer_en;

// SRAM header to SRAM
//wire    [10:0]  hdr_sram_rvalue;
//wire    [10:0]  hdr_sram_rid;
//wire            hdr_sram_wr_en;
//wire            hdr_sram_red_clr;
// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------
wire	[27:0]	adj_va;
reg	[26:0]	out_va;
wire	[3:0]	fuse;
wire		bypass;
wire	[2:0]	page_size;
// NOTE: the adj_va is the full ppn but because the ptb holds 8 entries and
//	thus align the ppn to a cacheline boundary since the tte's are fetched as cachelines
//	and this alignment is done in dmu_mmu_vaq.v
  assign do = (sun4v_mode & ~bypass) ? {que_0[84:38],out_va[26:0],que_0[10:0]} : que_0 ;

always @(page_size or que_0 or adj_va) begin
	
	out_va[26:0] = 27'b0;

	case (page_size)
	3'b000:	out_va	=	adj_va[26:0];				// 8k pages
	3'b001:	out_va	=	{adj_va[23:0],que_0[13:11]};		// 64 pages
	3'b010:	out_va	=	{27{1'b0}};				// invalid
	3'b011:	out_va	=	{adj_va[17:0],que_0[19:11]};		// 4M pages
	3'b100:	out_va	=	{27{1'b0}};				// invalid
	3'b101:	out_va	=	{adj_va[11:0],que_0[25:11]};		// 4M pages
	3'b110:	out_va	=	{27{1'b0}};				// invalid
	3'b111:	out_va	=	{27{1'b0}};				// invalid
	default:	out_va	= {27{1'b0}};
	endcase
end

assign	srq2vab_sun4v_pgsz[2:0]	= page_size[2:0];	// send to vab to zero out for tlb compare

assign	srq2vab_sun4v_byp_ps0 = sun4v_mode & bypass;	// used in vab for translation/bypass error

assign srq2tmc_sun4v_pgsz_err = sun4v_mode & (
			(page_size==3'b010) ||
			(page_size==3'b100) ||
			(page_size==3'b110) ||
			(page_size==3'b111) 	);

// do bypass detect here, and in vab it logs the errors and does the actual bypass,
//		this bypass just short-circuits the new iotsb translation
assign	bypass = (que_0[61:37] == 25'h1fff800);		// note que_0 adr starts at adr[2]
//BP n2for fire , matches value in dmu_mmu_vab.v
//assign	bypass = (que_0[61:37] == 25'h1fff80);
// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
//  always @ (posedge clk) 
//	if(~rst_l) begin : que_rst
//	   integer j;
 //   for (j = 0; j < QD; j = j + 1) begin
 //    que[j] <= {QW{1'b0}};
//	end
 //     end
//	else begin
 //   for (i = 0; i < QD-1; i = i + 1) begin
  //    if (ld[i]) que[i] <= ds[i] ? que[i+1] : di;
//    end
//    if (ld[QD-1]) que[QD-1] <= di;
//  end

  always @ (posedge clk) 
	if(~rst_l) begin : que_rst
     que_0 <= {QW{1'b0}};
     que_1 <= {QW{1'b0}};
     que_2 <= {QW{1'b0}};
     que_3 <= {QW{1'b0}};
	end
	else begin
      if (ld[0]) que_0 <= ds[0] ? que_1 : di;
      if (ld[1]) que_1 <= ds[1] ? que_2 : di;
      if (ld[2]) que_2 <= ds[2] ? que_3 : di;
      if (ld[3]) que_3 <= di;
  end


// ----------------------------------------------------------------------------
// N2 BP 8-02-04 
// add the new N2 IOMMU ram here, 
// NOTE: the flops at the input to the IOMMU ram are at the same stage in
// 	the pipeline as que[0], so que[0] has 2 purposes
//		1. used for SUN4U mode (old fire mode)
//		2. used as part of the logic to make the new IOMMU input flops
//			appear as que[0] entry for the SUN4V mode
// ----------------------------------------------------------------------------
// grab address bit 63 and the 8 bits of bus id to load into the new iommu ram address ff.
wire		adr_63,q1_or_di_63,reqid_sel;
wire		adr_0_63,adr_1_63;
wire	[6:0]		q1_or_di_req_id;
wire	[5:0]		req_id,q1_or_di_req_id_sel,req_id_in;
assign	adr_0_63	= que_0[61];
assign	adr_1_63	= que_1[61];
// select address bit 63 into the iommu ram address port
assign	q1_or_di_63	= ds[0] ? adr_1_63 : di[61];
assign	adr_63	= ld[0] ? q1_or_di_63 : adr_0_63;

// now select the bus_id to load into the iommu ram address port
// select which bus_id to load
assign	q1_or_di_req_id[6:0]	= ds[0] ? que_1[76:70] : di[76:70];			// shift or di
assign	req_id[5:0]	= reqid_sel ?	que_0[75:70] : que_0[76:71];			// select which bits to hold
assign	q1_or_di_req_id_sel[5:0]	= reqid_sel ? q1_or_di_req_id[5:0] : q1_or_di_req_id[6:1];	// select which new bits to load
assign	req_id_in[5:0]	= ld[0] ? q1_or_di_req_id_sel[5:0] : req_id[5:0];		// hold term

//temp
wire	devtsb_csr;
wire	[4:0]	adr_r_in, devtsb_csr_adr;
//SV assign	reqid_sel	= 1'b0;
//SV assign	devtsb_csr	= 1'b0;
assign	adr_r_in[4:0]	= devtsb_csr ?	devtsb_csr_adr[4:0] : {1'b0,adr_63,req_id_in[5:3]};
wire	[63:0]	iotsb_out;
wire	[4:0]	iotsbno;
wire		iotsb_par62,iotsb_par61;

// SV
wire   csrequest,  dev_rd, dev_wr, tsb_rd, tsb_wr, arb_winner;
wire  [63:0] devtsb_din;

assign devtsb_csr_adr = csr2dev_iotsb_rwa;
assign  dev_iotsb2csr_rd = iotsb_out;
assign  reqid_sel = busid_sel;
assign  devtsb_csr = ~arb_winner;
assign  dev_rd = arb_winner ? 1'b1 : csr2dev2iotsb_re;
assign  dev_wr = ~arb_winner & csr2dev2iotsb_we;
assign  tsb_rd = arb_winner ? 1'b1 : csr2IotsbDesc_re;
assign  tsb_wr = ~arb_winner & csr2IotsbDesc_we;
assign  csrequest = csr2dev2iotsb_re | csr2dev2iotsb_we | csr2IotsbDesc_re | csr2IotsbDesc_we;
assign  lkup_deque_en = arb_winner;
assign	iotsb_par62	= ~(^{csr2dev_iotsb_wd[63],csr2dev_iotsb_wd[59:32]});
assign	iotsb_par61	= ~(^{csr2dev_iotsb_wd[31:1],(csr2dev_iotsb_wd[0] ^ dsn_dmc_iei)});
assign  devtsb_din = csr2dev2iotsb_we ? {3'b0,csr2dev_iotsb_wd[60:56],3'b0,csr2dev_iotsb_wd[52:48],3'b0,csr2dev_iotsb_wd[44:40],3'b0,csr2dev_iotsb_wd[36:32],3'b0,csr2dev_iotsb_wd[28:24],3'b0,csr2dev_iotsb_wd[20:16],3'b0,csr2dev_iotsb_wd[12:8],3'b0,csr2dev_iotsb_wd[4:0]} : {csr2dev_iotsb_wd[63],iotsb_par62,iotsb_par61,1'b0,csr2dev_iotsb_wd[59:0]};

/*	arb	-req	csrrequest -gnt ~lkupreq
		-round_robin
*/
dmu_mmu_arbiter_rrobin     arbiter_rrobin
        (
     .next_grant        (arb_winner),
     .csr_done          (csr_done),
     .clk               (clk),
     .rst_l             (rst_l),
     .csrequest         (csrequest)
    );

//BP n2 9-23-04 add the bypass mux
//		note devtsb_din derives from csr2dev_iotsb_wd which comes from flops in dmu_mmu_csr_cim.v
//				
wire	[`FIRE_CSR_DATA_BITS]	devtsb_out;
assign	iotsb_out	= tcu_array_bypass ? csr2dev_iotsb_wd : devtsb_out;

//SV 02/24/05 added BIST logic
  wire    [63:0]  din_ram  ;
  wire    [4:0]   rd_addr_ram, wr_addr_ram ;
  wire            tsbwr_en_ram, tsbrd_en_ram  ;
  wire            devwr_en_ram, devrd_en_ram  ;
  wire            devtsb_lkup_en ;

  assign  din_ram        = dmu_mb0_run ? ({8{dmu_mb0_wdata}}) : devtsb_din ;
  assign  rd_addr_ram    = dmu_mb0_run ? dmu_mb0_addr[4:0] : adr_r_in[4:0] ;
  assign  wr_addr_ram    = dmu_mb0_run ? dmu_mb0_addr[4:0] : csr2dev_iotsb_rwa ;
  assign  devwr_en_ram   = dmu_mb0_run ? dmu_mb0_dev_wr_en : dev_wr ;
  assign  devrd_en_ram   = dmu_mb0_run ? dmu_mb0_dev_rd_en : dev_rd ;
  assign  tsbwr_en_ram   = dmu_mb0_run ? dmu_mb0_tsb_wr_en : tsb_wr ;
  assign  tsbrd_en_ram   = dmu_mb0_run ? dmu_mb0_tsb_rd_en : tsb_rd ;
  assign  devtsb_lkup_en = dmu_mb0_run ? 1'b0 : arb_winner ;

// -0in assert_follower -leader arb_winner -follower tsb_rd -max 0 -min 0
// -0in assert_follower -leader arb_winner -follower dev_rd -max 0 -min 0
// 0in	never -var (tsb_rd & tsb_wr) -group mbist_mode
// 0in	never -var (dev_rd & dev_wr) -group mbist_mode

n2_iom_sp_devtsb_cust 	srq_iommu
        (
     // address ports
     .adr_r     	(rd_addr_ram),
     .adr_bs     	(req_id_in[2:0]),
     .adr_w     	(wr_addr_ram),

     // clock ports
     .clk     		(l2clk),

     // data input ports
     .din      		(din_ram),

     // data output ports
//     .dout      	(iotsb_out),
     .dout      	(devtsb_out),
     .tsb_adr_r      	(iotsbno),

     // port enables
     .dev_wr      	(devwr_en_ram),
     .dev_rd      	(devrd_en_ram),
     .tsb_wr      	(tsbwr_en_ram),
     .tsb_rd      	(tsbrd_en_ram),

     // 
     .lkup_en      	(devtsb_lkup_en),




        // scan ports
        .scan_in                (scan_in),
        .tcu_se_scancollar_in   (tcu_se_scancollar_in),
        .tcu_scan_en   		(tcu_scan_en),
        .tcu_array_wr_inhibit   (tcu_array_wr_inhibit),
        .tcu_pce_ov             (tcu_pce_ov),
        .pce           		(1'b1),
        .tcu_aclk               (tcu_aclk),
        .tcu_bclk               (tcu_bclk),
        .scan_out               (scan_out),
        .efu_bits        	(fuse[3:0])
     );


// do the SUN4V address relocation

wire	[25:0]	iotsb_basepa;
wire	[26:0]	offset;
wire	[3:0]	srq2vab_np;		// number of pages out of iotsb
reg	[26:0]	shft_va;
reg	[4:0]	rdcount;
reg	[21:0]	sync_read;
wire		data_en,read_en,wr_en;
reg		sync_clr;

assign	srq2tmc_ivld		= ~iotsb_out[63] && sun4v_mode;
assign	iotsb_basepa[25:0]	= iotsb_out[59:34];
assign	offset[26:0]		= iotsb_out[33:7];
assign	page_size[2:0]		= iotsb_out[6:4];
assign	srq2vab_np[3:0]		= iotsb_out[3:0];

wire	iotsb_out_par62	=	~(^{iotsb_out[63],iotsb_out[59:32]});
wire	iotsb_out_par61	=	~(^{iotsb_out[31:0]});
//assign	srq2tmc_ipe	= sun4v_mode && iotsb_out[63] && (iotsb_out_par62 ^ iotsb_out[62]) | (iotsb_out_par61 ^ iotsb_out[61]);
assign	srq2tmc_ipe	= sun4v_mode && (iotsb_out_par62 ^ iotsb_out[62]) | (iotsb_out_par61 ^ iotsb_out[61]);

// note: that que_0 contains va[63:2] not va[61:0]!!!
always @( page_size or que_0 )begin

	shft_va[26:0]	= 27'b0;

	case (page_size) 
	3'b000:	shft_va	= que_0[37:11];			// 8k pages
	3'b001:	shft_va	= {{3{1'b0}},que_0[37:14]};	// 64k pages
	3'b010:	shft_va	= {27{1'b0}};
	3'b011:	shft_va	= {{9{1'b0}},que_0[37:20]};	// 4M pages
	3'b100:	shft_va	= {27{1'b0}};
	3'b101:	shft_va	= {{15{1'b0}},que_0[37:26]};	// 256M pages
	3'b110:	shft_va	= {27{1'b0}};
	3'b111:	shft_va	= {27{1'b0}};
	default:	shft_va	= {27{1'b0}};
	endcase
end

assign	adj_va[27:0] = {1'b0,shft_va[26:0]} - {1'b0,offset[26:0]};
assign	srq2vab_adva[27:0] = adj_va[27:0];


//BP N2 3-31-05	convert sv file to .v to drive devtsb ram
// the .sv code is located at cdmspp/libs/rtl/n2_efuhdr_ctl.sv

//module n2_efuhdr_ctl ;
reg		efu_dmu_xfer_en_r1,efu_dmu_data_r1,efu_dmu_clr_r1,efu_dmu_xfer_en_r2;
reg	[21:0]	instr;
wire	[21:0]	efu_instr,sram_read_data,received_instr;
reg	[4:0]	count;
wire	[4:0]	count_in;
wire		dispatch_read_data,load_shift_reg,load_en,reset_count;
wire		rdreset_count,ld_rd_en;
wire	[4:0]	rdcount_in;
reg	[21:0]	sync_instr;

//msff_ctl_macro ff_input_all_enable        (width=4)
//	(
//	.scan_in(ff_input_all_enable_scanin),
//	.scan_out(ff_input_all_enable_scanout),
//	.dout	({efu_hdr_xfer_en_r1,efu_hdr_write_data_r1,efu_hdr_clr_r1,efu_hdr_xfer_en_r2}),
//	.din	({efu_hdr_xfer_en,   efu_hdr_write_data   ,efu_hdr_clr,   efu_hdr_xfer_en_r1}),
//	.l1clk	(l1clk_efu)
//	);

  always @ (posedge clk)
        if(~por_l) begin
      efu_dmu_xfer_en_r1  	<= 1'b0;
      efu_dmu_data_r1  		<= 1'b0;
      efu_dmu_clr_r1  		<= 1'b0;
      efu_dmu_xfer_en_r2  	<= 1'b0;
        end
        else begin
      efu_dmu_xfer_en_r1  	<= efu_dmu_xfer_en;
      efu_dmu_data_r1  		<= efu_dmu_data;
      efu_dmu_clr_r1  		<= efu_dmu_clr;
      efu_dmu_xfer_en_r2  	<= efu_dmu_xfer_en_r1;
    end


assign efu_instr[21:0]      = {instr[20:0],efu_dmu_data_r1}; 

assign sram_read_data[21:0] = {18'b0,fuse[3:0]};

assign received_instr[21:0] = efu_dmu_xfer_en_r1 ? efu_instr[21:0] : 
			      (rdcount==5'd23) ? sync_read : 
				dispatch_read_data ? ({instr[20:0],1'b0}) : 22'b0;

assign load_shift_reg = efu_dmu_xfer_en_r1 | dispatch_read_data | (rdcount == 5'd23);

//msff_ctl_macro ff_receiver_instr_slice (width=22,en=1)
//	(
//        .scan_in(ff_receiver_instr_slice_scanin),
//        .scan_out(ff_receiver_instr_slice_scanout),
//        .dout   (instr[21:0]),
//        .din    (received_instr[21:0]),
//	.en	(load_shift_reg),
//        .l1clk    (l1clk_efu)
//        );

  always @ (posedge clk) begin
        if(~por_l) begin
      instr[21:0]  	<= 22'b0;
        end
        else if (load_shift_reg) begin
      instr[21:0]  	<= received_instr[21:0];
	end
	else begin
      instr[21:0]  	<= instr[21:0];
	end	
    end

assign	data_en = (count==5'd8)  ;
assign wr_en	= ((count==5'd7) | ~(sync_instr[21]) );
assign	read_en	= (count==5'd1);

  always @ (posedge clk) begin
        if(~por_l|| sync_clr) begin
      sync_instr[1:0]  	<= 2'b0;
      sync_instr[2]  	<= 1'b1;
      sync_instr[21:3]  	<= 19'b0;
        end
        else if (data_en &
//		(~received_instr[21] & received_instr[11] & received_instr[0]) ) begin
		(~instr[21] & instr[11] & instr[0]) ) begin
      sync_instr[21:0]  	<= instr[21:0];
	end
	else begin
      sync_instr[21:0]  	<= sync_instr[21:0];
	end
    end
assign	fuse[3:0] = sync_instr[4:1];

  always @ (posedge clk) begin
        if(~por_l) begin
      sync_read[21:0]  	<= 22'b0;
        end
        else if (read_en) begin
      sync_read[21:0]  	<= sram_read_data[21:0];
	end
	else begin
      sync_read[21:0]  	<= sync_read[21:0];
	end
    end


  always @ (posedge clk)
        if(~por_l) begin
      sync_clr  	<= 1'b0;
        end
        else  begin
      sync_clr  	<= efu_dmu_clr_r1;
    end


//  always @ (posedge clk)
//        if(~por_l || sync_clr) begin
//      fuse[0]  	<= 1'b0;
//      fuse[1]  	<= 1'b1;
//      fuse[3:2]  	<= 2'b0;
//        end
//        else if (load_en & received_instr[11] & received_instr[0]) begin
//        else if (efu_dmu_xfer_en_r2 & ~efu_dmu_xfer_en_r1 & 
//			~received_instr[21] & received_instr[11] & received_instr[0]) begin
//      fuse[3:0]  	<= received_instr[4:1];
//	end
//	else begin	
//	fuse[3:0]	<= fuse[3:0];
//    end

assign load_en = (~efu_dmu_xfer_en_r2 & efu_dmu_xfer_en_r1);
assign ld_rd_en	= (count==5'd1);

assign reset_count = ( count == 5'd0 );
assign rdreset_count = ( rdcount == 5'd0 );

assign count_in = load_en ? 5'd29 : reset_count ? 5'b0 : (count - 5'b1);
assign rdcount_in = ld_rd_en ? 5'd23 : rdreset_count ? 5'b0 : (rdcount - 5'b1);

//msff_ctl_macro ff_counter_slice (width=5,en=1)
//        (
//        .scan_in(ff_counter_slice_scanin),
//        .scan_out(ff_counter_slice_scanout),
//        .dout   (count[4:0]),
//        .din    (count_in[4:0]),
//        .en     (load_en),
//        .l1clk    (l1clk_efu)
//        );

  always @ (posedge clk)
        if(~por_l) begin
      count[4:0]  	<= 5'b0;
        end
//        else if (load_en) begin
//        else if (efu_dmu_xfer_en_r1) begin
	else begin
      count[4:0]  	<= count_in[4:0];
    end

  always @ (posedge clk)
        if(~por_l) begin
      rdcount[4:0]  	<= 5'b0;
        end
//        else if (ld_rd_en) begin
	else begin
      rdcount[4:0]  	<= rdcount_in[4:0];
    end

//assign hdr_sram_rvalue[10:0]  = instr[10:0];
//assign hdr_sram_rid[10:0]     = instr[21:11];
//assign hdr_sram_red_clr       = efu_dmu_clr_r1;
//assign hdr_sram_wr_en         = |(count[1:0]);
//assign hdr_sram_rvalue[10:0]  = sync_instr[10:0];
//assign hdr_sram_rid[10:0]     = sync_instr[21:11];
//assign hdr_sram_red_clr       = sync_clr;
//assign hdr_sram_wr_en         = sync_wr;


//assign dispatch_read_data = (count[4:0]<5'd23) & (rdcount[4:0]!= 5'd0);
assign dispatch_read_data = (rdcount[4:0]<5'd23) & (rdcount[4:0]!=5'd0);

//assign hdr_efu_read_data  = instr[21];
//assign hdr_efu_xfer_en    = dispatch_read_data;
assign dmu_efu_data  = instr[21];
assign dmu_efu_xfer_en    = dispatch_read_data;

endmodule // dmu_mmu_srq

