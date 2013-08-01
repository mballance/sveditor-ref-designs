// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_tdb.v
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
module dmu_mmu_tdb 
  (
   l2clk,			// clock for rams
   clk,				// clock
   scan_in,
   tcu_array_bypass,
   tcu_scan_en,
   tcu_se_scancollar_in,
   tcu_array_wr_inhibit,
   tcu_pce_ov,
   tcu_aclk,
   tcu_bclk,
   scan_out,

   csr2tdb_ra,			// csr read address
   csr2tdb_wa,			// csr write address
   csr2tdb_wd,			// csr write data
   csr2tdb_we,			// csr write enable
   tcb2tdb_sel,			// tcb select
   tcb2tdb_wa,			// tcb write address
   tcb2tdb_we,			// tcb write enable
   tlb2tdb_data,		// tlb data
   tlb2tdb_rqid,		// rqid in ps2 to compare against rqid in ram
   vtb2tdb_dbra,		// vtb data buffer read address
   tdb2csr_rd,			// csr read data
   tdb2pab_par,			// pab parity
   tdb2pab_ppn,			// pab physical page number
   tdb2pab_vld,			// pab valid
   tdb2pab_keyvld,              // pab key valid
   tdb2pab_fnm,                 // pab function number
   tdb2pab_key,                 // pab key
   tdb2pab_wrt,			// pab write
   tdb2tmc_kerr,		// key error, do not translate
   dsn_dmc_iei,			// NCU can force parity into tdb ram by setting this
   
   tdb_dout_8msb,
   dmu_mb0_run,
   dmu_mb0_addr,
   dmu_mb0_wdata,
   dmu_mb0_tdb_wr_en,
   dmu_mb0_tdb_rd_en
   
   );		

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input					l2clk;
  input					clk;
  input                                   scan_in;
  input                                   tcu_array_bypass;
  input                                   tcu_scan_en;
  input                                   tcu_se_scancollar_in;
  input                                   tcu_array_wr_inhibit;
  input                                   tcu_pce_ov;
  input                                   tcu_aclk;
  input                                   tcu_bclk;
  output                                  scan_out;

  input  [`FIRE_DLC_MMU_TDB_PTR_BITS]	csr2tdb_ra;
  input  [`FIRE_DLC_MMU_TDB_PTR_BITS]	csr2tdb_wa;
  input  [`FIRE_DLC_MMU_TDR_BITS]	csr2tdb_wd;
  input 				csr2tdb_we;
  input 				tcb2tdb_sel;
  input  [`FIRE_DLC_MMU_TDB_PTR_BITS]	tcb2tdb_wa;
  input  				tcb2tdb_we;
  input  [`FIRE_DLC_MMU_TDR_MINUS_PAR_BITS]	tlb2tdb_data;
  input  [`FIRE_DLC_MMU_VA_RQID_BITS]	tlb2tdb_rqid;
  input  [`FIRE_DLC_MMU_TDB_PTR_BITS]	vtb2tdb_dbra;

  output [`FIRE_DLC_MMU_TDR_BITS]	tdb2csr_rd;
  output [`FIRE_DLC_MMU_TDD_PAR_BITS]	tdb2pab_par;
  output [`FIRE_DLC_MMU_TDD_PPN_BITS]	tdb2pab_ppn;
  output [`FIRE_DLC_MMU_TDD_KEY_BITS]	tdb2pab_key;
  output [`FIRE_DLC_MMU_TDD_FNM_BITS]	tdb2pab_fnm;
  output				tdb2pab_vld;
  output				tdb2pab_keyvld;
  output				tdb2pab_wrt;
  output				tdb2tmc_kerr;
  input					dsn_dmc_iei;

  input         dmu_mb0_run;

  input [8:0]   dmu_mb0_addr;
  input [7:0]   dmu_mb0_wdata;
  input         dmu_mb0_tdb_wr_en;
  input         dmu_mb0_tdb_rd_en;
  output [7:0]  tdb_dout_8msb;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire [`FIRE_DLC_MMU_TDR_BITS] 	tdb2csr_rd;
  wire [`FIRE_DLC_MMU_TDD_PAR_BITS]	tdb2pab_par;
  wire [`FIRE_DLC_MMU_TDD_PPN_BITS]	tdb2pab_ppn;
  wire [`FIRE_DLC_MMU_TDD_KEY_BITS]	tdb2pab_key;
  wire [`FIRE_DLC_MMU_TDD_FNM_BITS]	tdb2pab_fnm;

  wire [`FIRE_DLC_MMU_TDR_BITS]		dib, doa;
  wire [`FIRE_DLC_MMU_TDB_PTR_BITS] 	aadr, badr;
  wire [3:0]				par;
  wire 					tdb2tmc_kerr;

// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------

// addresses
  assign aadr = tcb2tdb_sel ? vtb2tdb_dbra : csr2tdb_ra;
  assign badr = tcb2tdb_sel ? tcb2tdb_wa   : csr2tdb_wa;

// data in
  assign dib[`FIRE_DLC_MMU_TDR_MINUS_PAR_BITS]  = tcb2tdb_sel ? 
			tlb2tdb_data[`FIRE_DLC_MMU_TDR_MINUS_PAR_BITS] : csr2tdb_wd[`FIRE_DLC_MMU_TDR_MINUS_PAR_BITS];
//  assign dib[`FIRE_DLC_MMU_TDR_PAR_BITS] = 4'b0;
    assign par[3] = ^{dib[`FIRE_DLC_MMU_TDR_KEY_MSB:`FIRE_DLC_MMU_TDR_KEY_LSB+4]};
    assign par[2] = ^{dib[`FIRE_DLC_MMU_TDR_KEY_LSB+3:`FIRE_DLC_MMU_TDR_KEY_LSB],dib[`FIRE_DLC_MMU_TDR_PPN_MSB:`FIRE_DLC_MMU_TDR_PPN_MSB-7]};
    assign par[1] = ^dib[`FIRE_DLC_MMU_TDR_PPN_MSB-8:`FIRE_DLC_MMU_TDR_PPN_LSB+6];
    assign par[0] = ^{dib[`FIRE_DLC_MMU_TDR_PPN_LSB+5:`FIRE_DLC_MMU_TDR_PPN_LSB],dib[5:1],
								(dib[0] ^ dsn_dmc_iei)};

    assign dib[`FIRE_DLC_MMU_TDR_PAR_MSB]   = par[3] ? 1'b0 : 1'b1;
    assign dib[`FIRE_DLC_MMU_TDR_PAR_MSB-1] = par[2] ? 1'b0 : 1'b1;
    assign dib[`FIRE_DLC_MMU_TDR_PAR_MSB-2] = par[1] ? 1'b0 : 1'b1;
    assign dib[`FIRE_DLC_MMU_TDR_PAR_MSB-3] = par[0] ? 1'b0 : 1'b1;


// data out
  assign tdb2csr_rd = doa;

  assign tdb2pab_par = doa[`FIRE_DLC_MMU_TDR_PAR_BITS];
  assign tdb2pab_key = doa[`FIRE_DLC_MMU_TDR_KEY_BITS];
  assign tdb2pab_ppn = doa[`FIRE_DLC_MMU_TDR_PPN_BITS];
  assign tdb2pab_fnm = doa[`FIRE_DLC_MMU_TDR_FNM_BITS];
  wire   tdb2pab_keyvld = doa[`FIRE_DLC_MMU_TDR_KEYVLD_BITS];
  wire	 tdb2pab_wrt = doa[`FIRE_DLC_MMU_TDR_WRT_BITS];
  wire	 tdb2pab_vld = doa[`FIRE_DLC_MMU_TDR_VLD_BITS];

 assign tdb2tmc_kerr	= doa[`FIRE_DLC_MMU_TDR_KEYVLD_BITS] && 
		~((tlb2tdb_rqid & {{13{1'b1}},doa[`FIRE_DLC_MMU_TDR_FNM_BITS]}) == 
			(doa[`FIRE_DLC_MMU_TDR_KEY_BITS] & {{13{1'b1}},doa[`FIRE_DLC_MMU_TDR_FNM_BITS]}));

// write enables
  wire	 web = tcb2tdb_sel ? tcb2tdb_we : csr2tdb_we;

// ----------------------------------------------------------------------------
// Instantiations
// ----------------------------------------------------------------------------
/*
  fire_dlc_ram512x36_211hd4 ram
    (
// address ports
     .aadr	(aadr),
     .badr	(badr),

// clock ports
     .clka	(l2clk),
     .clkb	(l2clk),

// data input ports
     .dib  	(dib),

// data output ports
     .doa	(doa),

// port enables
     .ena	(1'b1),
     .enb 	(1'b1),

// write enables
     .web 	(web)
     );
*/
wire [7:0]		spare;

//BP n2 6-11-04 new ram model
//BP n2 9-23-04 scan bypass
//	note, tlb2tdb_data comes from flops in the tlb block, since tlb2tdb_data is short
//			by the parity bits, I duplicate 4 of them to finish it
wire [`FIRE_DLC_MMU_TDR_BITS]	tdb_ram_out;
assign doa	= tcu_array_bypass ? {tlb2tdb_data[3:0],tlb2tdb_data} : tdb_ram_out;

//SV 02/24/05 added BIST logic
  wire    [59:0]  din_ram  ;
  wire    [8:0]   rd_addr_ram, wr_addr_ram ;
  wire            wr_en_ram, rd_en_ram  ;

  assign  tdb_dout_8msb  =   spare[7:0] ;
  assign  din_ram        =   dmu_mb0_run ? ({dmu_mb0_wdata[3:0],{7{dmu_mb0_wdata}}}) : ({{8{1'b0}},dib}) ;
  assign  rd_addr_ram    =   dmu_mb0_run ? dmu_mb0_addr : aadr ;
  assign  wr_addr_ram    =   dmu_mb0_run ? dmu_mb0_addr : badr ;
  assign  wr_en_ram      =   dmu_mb0_run ? dmu_mb0_tdb_wr_en : web ;
  assign  rd_en_ram      =   dmu_mb0_run ? dmu_mb0_tdb_rd_en : 1'b1 ;

/*	0in memory_access -read_addr aadr 	-read (aadr != badr)
			-write_addr badr	-write web
			-latency 1
			-write_data {{8{1'b0}},dib} -read_data {spare,tdb_ram_out}
                        -active (~dmu_mb0_run)
			-group mbist_mode
*/


        n2_dmu_dp_512x60s_cust  tdb_ram512x60
        (
     // address ports
     .rd_addr     (rd_addr_ram),
     .wr_addr     (wr_addr_ram),

     // clock ports
     .clk     (l2clk),

     // data input ports
     .din      (din_ram),

     // data output ports
     .dout      ({spare,tdb_ram_out}),

     // port enables
     .rd_en      (rd_en_ram),
     .wr_en      (wr_en_ram),

        // scan ports
        .scan_in                (scan_in),
        .tcu_scan_en   		(tcu_scan_en),
        .tcu_se_scancollar_in   (tcu_se_scancollar_in),
        .tcu_array_wr_inhibit   (tcu_array_wr_inhibit),
        .tcu_pce_ov             (tcu_pce_ov),
        .pce           		(1'b1),
        .tcu_aclk               (tcu_aclk),
        .tcu_bclk               (tcu_bclk),
        .scan_out               (scan_out)
     );

endmodule // dmu_mmu_tdb
