// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_wrdp_dp.v
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
module	mcu_wrdp_dp (
  l2clk, 
  drl2clk, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  cmp_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  bank0_wdata, 
  bank1_wdata, 
  scrub_rwen, 
  mcu_scrub_wdata, 
  wdata_sel, 
  err_inj_reg, 
  err_mask_reg, 
  wadr_parity, 
  l2poison_qw, 
  fail_over_mask, 
  fail_over_mask_l, 
  io_wdata_sel, 
  mcu_io_data_out, 
  mbist_run, 
  mbist_sel_hiorlo_72bits, 
  mbist_sel_bank0or1, 
  mbist_read_data, 
  lfsr_in, 
  lfsr_out, 
  lfsr_out_0);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire mbist_sel_hiorlo_72bits_l;
wire mbist_sel_bank0or1_l;
wire mbist_run_l;
wire wdqrf00_data_sel;
wire wdqrf01_data_sel;
wire wdqrf10_data_sel;
wire wdqrf11_data_sel;
wire u_wdqrf00_data_scanin;
wire u_wdqrf00_data_scanout;
wire [63:0] wdqrf00_data;
wire u_wdqrf01_data_scanin;
wire u_wdqrf01_data_scanout;
wire [63:0] wdqrf01_data;
wire u_wdqrf10_data_scanin;
wire u_wdqrf10_data_scanout;
wire [63:0] wdqrf10_data;
wire u_wdqrf11_data_scanin;
wire u_wdqrf11_data_scanout;
wire [63:0] wdqrf11_data;
wire u_scrub_wdata_511_448_scanin;
wire u_scrub_wdata_511_448_scanout;
wire [511:0] scrub_wdata;
wire u_scrub_wdata_447_384_scanin;
wire u_scrub_wdata_447_384_scanout;
wire u_scrub_wdata_383_320_scanin;
wire u_scrub_wdata_383_320_scanout;
wire u_scrub_wdata_319_256_scanin;
wire u_scrub_wdata_319_256_scanout;
wire u_scrub_wdata_255_192_scanin;
wire u_scrub_wdata_255_192_scanout;
wire u_scrub_wdata_191_128_scanin;
wire u_scrub_wdata_191_128_scanout;
wire u_scrub_wdata_127_64_scanin;
wire u_scrub_wdata_127_64_scanout;
wire u_scrub_wdata_63_0_scanin;
wire u_scrub_wdata_63_0_scanout;
wire u_wdata_127_64_scanin;
wire u_wdata_127_64_scanout;
wire [127:0] wdata;
wire u_wdata_63_0_scanin;
wire u_wdata_63_0_scanout;
wire [3:0] wecc0;
wire [3:0] wecc1;
wire [3:0] wecc2;
wire [3:0] wecc3;
wire [15:0] err_inj_vec;
wire [46:0] spare_nand_unused;
wire [15:0] err_inj_ecc;
wire [143:0] wr_data_muxed_nibbles;
wire [143:4] mux_io_data_out;
wire u_io_data_127_64_scanin;
wire u_io_data_127_64_scanout;
wire u_io_data_63_0_scanin;
wire u_io_data_63_0_scanout;
wire [15:0] mux_io_ecc_out;
wire u_io_ecc_15_0_scanin;
wire u_io_ecc_15_0_scanout;


input 		l2clk;
input		drl2clk;

input 		scan_in;
output		scan_out;
input		tcu_pce_ov;
input		cmp_pce_ov;
input 		tcu_aclk;
input		tcu_bclk;
input		tcu_scan_en;

input	[127:0]	bank0_wdata;				// L2 bank0 write data from write data queue
input	[127:0]	bank1_wdata;				// L2 bank0 write data from write data queue

input		scrub_rwen;				// scrub shift reg read/write en
input	[255:0]	mcu_scrub_wdata;			// scrubbed write data from MCU read

input	[3:0]	wdata_sel; 				// select l2b0, l2b1, or scrubbed data to memory ( [0]:bank0 data, [1]: bank1 data, [2]: scrubbed data )
input		err_inj_reg;				// error inject reg
input	[15:0]	err_mask_reg;				// error mask reg 
input		wadr_parity;				// write address parity
input		l2poison_qw;				// poison write ecc data
input	[34:0]	fail_over_mask;
input	[34:0]	fail_over_mask_l;
input	[1:0]	io_wdata_sel;				// select write data to IO 
output	[143:0]	mcu_io_data_out;			// write data to IO.	ECC: [143:128], DATA: [127:0]

input		mbist_run;
input		mbist_sel_hiorlo_72bits;
input		mbist_sel_bank0or1;
output	[63:0]	mbist_read_data;

input	[11:0]	lfsr_in;
output	[12:0]	lfsr_out;
output	[3:0]	lfsr_out_0;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Scan reassigns
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

// MBIST registers and muxes
mcu_wrdp_dp_inv_macro__width_3 	u_mbist_signals     (
		.din ( { mbist_sel_hiorlo_72bits, mbist_sel_bank0or1, mbist_run } ),
		.dout( { mbist_sel_hiorlo_72bits_l, mbist_sel_bank0or1_l, mbist_run_l } ));

mcu_wrdp_dp_nor_macro	u_wdqrf00_data_sel (
		.din0(mbist_sel_hiorlo_72bits),
		.din1(mbist_sel_bank0or1),
		.dout(wdqrf00_data_sel));

mcu_wrdp_dp_nor_macro	u_wdqrf01_data_sel (
		.din0(mbist_sel_hiorlo_72bits_l),
		.din1(mbist_sel_bank0or1),
		.dout(wdqrf01_data_sel));

mcu_wrdp_dp_nor_macro	u_wdqrf10_data_sel (
		.din0(mbist_sel_hiorlo_72bits),
		.din1(mbist_sel_bank0or1_l),
		.dout(wdqrf10_data_sel));

mcu_wrdp_dp_nor_macro	u_wdqrf11_data_sel (
		.din0(mbist_sel_hiorlo_72bits_l),
		.din1(mbist_sel_bank0or1_l),
		.dout(wdqrf11_data_sel));

mcu_wrdp_dp_msff_macro__stack_64c__width_64	u_wdqrf00_data        (
		.scan_in(u_wdqrf00_data_scanin),
		.scan_out(u_wdqrf00_data_scanout),
		.din(bank0_wdata[127:64]),
		.dout(wdqrf00_data[63:0]),
		.en(mbist_run),
		.pce_ov(cmp_pce_ov),
		.clk(l2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .stop(stop));
		
mcu_wrdp_dp_msff_macro__stack_64c__width_64	u_wdqrf01_data        (
		.scan_in(u_wdqrf01_data_scanin),
		.scan_out(u_wdqrf01_data_scanout),
		.din(bank0_wdata[63:0]),
		.dout(wdqrf01_data[63:0]),
		.en(mbist_run),
		.pce_ov(cmp_pce_ov),
		.clk(l2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .stop(stop));
		
mcu_wrdp_dp_msff_macro__stack_64c__width_64	u_wdqrf10_data        (
		.scan_in(u_wdqrf10_data_scanin),
		.scan_out(u_wdqrf10_data_scanout),
		.din(bank1_wdata[127:64]),
		.dout(wdqrf10_data[63:0]),
		.en(mbist_run),
		.pce_ov(cmp_pce_ov),
		.clk(l2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .stop(stop));
		
mcu_wrdp_dp_msff_macro__stack_64c__width_64	u_wdqrf11_data        (
		.scan_in(u_wdqrf11_data_scanin),
		.scan_out(u_wdqrf11_data_scanout),
		.din(bank1_wdata[63:0]),
		.dout(wdqrf11_data[63:0]),
		.en(mbist_run),
		.pce_ov(cmp_pce_ov),
		.clk(l2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .stop(stop));

mcu_wrdp_dp_mux_macro__mux_aonpe__ports_4__stack_64c__width_64	u_mbist_read_data              (
		.din0(wdqrf00_data[63:0]),
		.din1(wdqrf01_data[63:0]),
		.din2(wdqrf10_data[63:0]),
		.din3(wdqrf11_data[63:0]),
		.sel0(wdqrf00_data_sel),
		.sel1(wdqrf01_data_sel),
		.sel2(wdqrf10_data_sel),
		.sel3(wdqrf11_data_sel),
		.dout(mbist_read_data[63:0]));
		
//        scrub_wdata           
//      [63:0]  [127:64]
//         |       |            
//         v       v            
//      511:448 447:384         
//         v       v            
//      383:320 319:256         
//         v       v            
//      255:192 191:128         
//         v       v            
//      127:64   63:0           
//         |       |            
//         v       v            
//      write to memory         


mcu_wrdp_dp_msff_macro__stack_64c__width_64	u_scrub_wdata_511_448          		       (
		.scan_in(u_scrub_wdata_511_448_scanin),
		.scan_out(u_scrub_wdata_511_448_scanout),
		.clk		( drl2clk ),
		.en		( scrub_rwen ),
		.din		( mcu_scrub_wdata[63:0] ),
		.dout 		( scrub_wdata[511:448] ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_wrdp_dp_msff_macro__stack_64c__width_64	u_scrub_wdata_447_384          		       (
		.scan_in(u_scrub_wdata_447_384_scanin),
		.scan_out(u_scrub_wdata_447_384_scanout),
		.clk		( drl2clk ),
		.en		( scrub_rwen ),
		.din		( mcu_scrub_wdata[127:64] ),
		.dout 		( scrub_wdata[447:384] ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_wrdp_dp_msff_macro__stack_64c__width_64	u_scrub_wdata_383_320          		       (
		.scan_in(u_scrub_wdata_383_320_scanin),
		.scan_out(u_scrub_wdata_383_320_scanout),
		.clk		( drl2clk ),
		.en		( scrub_rwen ),
		.din		( mcu_scrub_wdata[191:128] ),
		.dout 		( scrub_wdata[383:320] ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


mcu_wrdp_dp_msff_macro__stack_64c__width_64	u_scrub_wdata_319_256          		       (
		.scan_in(u_scrub_wdata_319_256_scanin),
		.scan_out(u_scrub_wdata_319_256_scanout),
		.clk		( drl2clk ),
		.en		( scrub_rwen ),
		.din		( mcu_scrub_wdata[255:192] ),
		.dout 		( scrub_wdata[319:256] ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_wrdp_dp_msff_macro__stack_64c__width_64	u_scrub_wdata_255_192          		       (
		.scan_in(u_scrub_wdata_255_192_scanin),
		.scan_out(u_scrub_wdata_255_192_scanout),
		.clk		( drl2clk ),
		.en		( scrub_rwen ),
		.din		( scrub_wdata[511:448] ),
		.dout 		( scrub_wdata[255:192] ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_wrdp_dp_msff_macro__stack_64c__width_64	u_scrub_wdata_191_128          		       (
		.scan_in(u_scrub_wdata_191_128_scanin),
		.scan_out(u_scrub_wdata_191_128_scanout),
		.clk		( drl2clk ),
		.en		( scrub_rwen ),
		.din		( scrub_wdata[447:384] ),
		.dout 		( scrub_wdata[191:128] ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_wrdp_dp_msff_macro__stack_64c__width_64	u_scrub_wdata_127_64          		       (
		.scan_in(u_scrub_wdata_127_64_scanin),
		.scan_out(u_scrub_wdata_127_64_scanout),
		.clk		( drl2clk ),
		.en		( scrub_rwen ),
		.din		( scrub_wdata[383:320] ),
		.dout 		( scrub_wdata[127:64] ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_wrdp_dp_msff_macro__stack_64c__width_64	u_scrub_wdata_63_0          		       (
		.scan_in(u_scrub_wdata_63_0_scanin),
		.scan_out(u_scrub_wdata_63_0_scanout),
		.clk		( drl2clk ),
		.en		( scrub_rwen ),
		.din		( scrub_wdata[319:256] ),
		.dout 		( scrub_wdata[63:0] ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


//
// memory write data from 3 sources - L2 bank0 WDQ, L2 bank1 WDQ, and scrubbed data
//

mcu_wrdp_dp_msff_macro__mux_aonpe__ports_4__stack_64c__width_64      u_wdata_127_64        			              (
		.scan_in(u_wdata_127_64_scanin),
		.scan_out(u_wdata_127_64_scanout),
		.clk		( drl2clk ),
		.en		( 1'b1 ),
                .din0   	( bank0_wdata[127:64] ),	
                .din1   	( bank1_wdata[127:64] ),
                .din2   	( scrub_wdata[127:64] ),
                .din3   	( scrub_wdata[255:192] ),
                .sel0   	( wdata_sel[0]     ),		// bank0 data
                .sel1   	( wdata_sel[1]     ),		// bank1 data
                .sel2   	( wdata_sel[2]     ),		// scrubbed data
                .sel3   	( wdata_sel[3]     ),		// scrubbed data
                .dout   	( wdata[127:64] ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_wrdp_dp_msff_macro__mux_aonpe__ports_4__stack_64c__width_64       u_wdata_63_0          			              (
		.scan_in(u_wdata_63_0_scanin),
		.scan_out(u_wdata_63_0_scanout),
		.clk		( drl2clk ),
		.en		( 1'b1 ),
                .din0   	( bank0_wdata[63:0] ),	
                .din1   	( bank1_wdata[63:0] ),
                .din2   	( scrub_wdata[63:0] ),
                .din3   	( scrub_wdata[191:128] ),
                .sel0   	( wdata_sel[0]     ),		// bank0 data
                .sel1   	( wdata_sel[1]     ),		// bank1 data
                .sel2   	( wdata_sel[2]     ),		// scrubbed data
                .sel3   	( wdata_sel[3]     ),		// scrubbed data
                .dout   	( wdata[63:0] ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// Generate ECC data to DRAM

mcu_eccgen_dp	u_w_eccgen    (
		.din		( { wdata[63:0], wdata[127:64] } ),
		.adr_parity	( wadr_parity  ),
		.ecc0_in	( {4 { 1'b0} } ),
		.ecc1_in	( {4 { 1'b0} } ),
		.ecc2_in	( {4 { 1'b0} } ),
		.ecc3_in	( {4 { 1'b0} } ),
		.ecc		( { wecc0[3:0], wecc1[3:0], wecc2[3:0], wecc3[3:0] } ));

	
// Error injection vector: 16 bits

mcu_wrdp_dp_and_macro__ports_2__stack_16r__width_16 	u_err_inj_vec	          (
		.din0	( { 16 { err_inj_reg } } ),
		.din1 	( err_mask_reg[15:0] ),
		.dout 	( err_inj_vec[15:0]));

mcu_wrdp_dp_nand_macro__width_48	spare_nand     (
		.din0	( {47'h0, lfsr_out_0[3]} ),
		.din1	( {47'h0, lfsr_out_0[3]} ),
		.dout	( {spare_nand_unused[46:0], lfsr_out[12]}));

//
// 	Poison ECC data with signature: 16'h8221  ( refer to N2 PRM section A.7.4 )
//

mcu_wrdp_dp_xor_macro__ports_2__width_1	u_err_inj_ecc_15  	       ( .din0 ( wecc0[3] ), .din1 ( err_inj_vec[3]  ),                        .dout ( err_inj_ecc[15] ));
mcu_wrdp_dp_xor_macro__ports_2__width_1	u_err_inj_ecc_14   	       ( .din0 ( wecc0[2] ), .din1 ( err_inj_vec[2]  ),                        .dout ( err_inj_ecc[14] ));
mcu_wrdp_dp_xor_macro__ports_2__width_1	u_err_inj_ecc_13   	       ( .din0 ( wecc0[1] ), .din1 ( err_inj_vec[1]  ),                        .dout ( err_inj_ecc[13] ));
mcu_wrdp_dp_xor_macro__ports_3__width_1	u_err_inj_ecc_12   	       ( .din0 ( wecc0[0] ), .din1 ( err_inj_vec[0]  ), .din2 ( l2poison_qw ), .dout ( err_inj_ecc[12] ));

mcu_wrdp_dp_xor_macro__ports_2__width_1	u_err_inj_ecc_11   	       ( .din0 ( wecc1[3] ), .din1 ( err_inj_vec[7]  ),                        .dout ( err_inj_ecc[11] ));
mcu_wrdp_dp_xor_macro__ports_2__width_1	u_err_inj_ecc_10   	       ( .din0 ( wecc1[2] ), .din1 ( err_inj_vec[6]  ),                        .dout ( err_inj_ecc[10] ));
mcu_wrdp_dp_xor_macro__ports_3__width_1	u_err_inj_ecc_9   	       ( .din0 ( wecc1[1] ), .din1 ( err_inj_vec[5]  ), .din2 ( l2poison_qw ), .dout ( err_inj_ecc[9]  ));
mcu_wrdp_dp_xor_macro__ports_2__width_1	u_err_inj_ecc_8    	       ( .din0 ( wecc1[0] ), .din1 ( err_inj_vec[4]  ),                        .dout ( err_inj_ecc[8]  ));

mcu_wrdp_dp_xor_macro__ports_2__width_1	u_err_inj_ecc_7    	       ( .din0 ( wecc2[3] ), .din1 ( err_inj_vec[11] ),                        .dout ( err_inj_ecc[7]  ));
mcu_wrdp_dp_xor_macro__ports_2__width_1	u_err_inj_ecc_6    	       ( .din0 ( wecc2[2] ), .din1 ( err_inj_vec[10] ),                        .dout ( err_inj_ecc[6]  ));
mcu_wrdp_dp_xor_macro__ports_3__width_1	u_err_inj_ecc_5    	       ( .din0 ( wecc2[1] ), .din1 ( err_inj_vec[9]  ), .din2 ( l2poison_qw ), .dout ( err_inj_ecc[5]  ));
mcu_wrdp_dp_xor_macro__ports_2__width_1	u_err_inj_ecc_4    	       ( .din0 ( wecc2[0] ), .din1 ( err_inj_vec[8]  ),                        .dout ( err_inj_ecc[4]  ));

mcu_wrdp_dp_xor_macro__ports_3__width_1	u_err_inj_ecc_3    	       ( .din0 ( wecc3[3] ), .din1 ( err_inj_vec[15] ), .din2 ( l2poison_qw ), .dout ( err_inj_ecc[3]  ));
mcu_wrdp_dp_xor_macro__ports_2__width_1	u_err_inj_ecc_2    	       ( .din0 ( wecc3[2] ), .din1 ( err_inj_vec[14] ),                        .dout ( err_inj_ecc[2]  ));
mcu_wrdp_dp_xor_macro__ports_2__width_1	u_err_inj_ecc_1    	       ( .din0 ( wecc3[1] ), .din1 ( err_inj_vec[13] ),                        .dout ( err_inj_ecc[1]  ));
mcu_wrdp_dp_xor_macro__ports_2__width_1	u_err_inj_ecc_0 	       ( .din0 ( wecc3[0] ), .din1 ( err_inj_vec[12] ),                        .dout ( err_inj_ecc[0]  ));

//	
//	 Register 128 bits data and 16 bits ecc
//				
//		DRAM:	ECC		DATA
//	      	        [143:128]	[127:0]
//

assign	wr_data_muxed_nibbles[143:0] = { err_inj_ecc[15:0], wdata[63:0], wdata[127:64] };

mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_143_140  	              ( 
		.din0	( wr_data_muxed_nibbles[127:124] ), 
		.din1	( wr_data_muxed_nibbles[143:140] ), 
		.sel0	( fail_over_mask[31] ), 
		.sel1	( fail_over_mask_l[31] ), 
		.dout	( mux_io_data_out[143:140] ));

mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_139_136  	              ( 
		.din0	( wr_data_muxed_nibbles[143:140] ), 
		.din1	( wr_data_muxed_nibbles[139:136] ), 
		.sel0	( fail_over_mask[32] ), 
		.sel1	( fail_over_mask_l[32] ), 
		.dout	( mux_io_data_out[139:136] ));

mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_135_132  	              ( 
		.din0	( wr_data_muxed_nibbles[139:136] ), 
		.din1	( wr_data_muxed_nibbles[135:132] ), 
		.sel0	( fail_over_mask[33] ), 
		.sel1	( fail_over_mask_l[33] ), 
		.dout	( mux_io_data_out[135:132] ));

mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_131_128  	              ( 
		.din0	( wr_data_muxed_nibbles[135:132] ), 
		.din1	( wr_data_muxed_nibbles[131:128] ), 
		.sel0	( fail_over_mask[34] ), 
		.sel1	( fail_over_mask_l[34] ), 
		.dout	( mux_io_data_out[131:128] ));

// sdram write data [127:64]

mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_127_124  	              ( 
		.din0	( wr_data_muxed_nibbles[123:120] ), 
		.din1	( wr_data_muxed_nibbles[127:124] ), 
		.sel0	( fail_over_mask[30] ), 
		.sel1	( fail_over_mask_l[30] ), 
		.dout	( mux_io_data_out[127:124] ));

mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_123_120  	              ( 
		.din0	( wr_data_muxed_nibbles[119:116] ), 
		.din1	( wr_data_muxed_nibbles[123:120] ), 
		.sel0	( fail_over_mask[29] ), 
		.sel1	( fail_over_mask_l[29] ), 
		.dout	( mux_io_data_out[123:120] ));
 
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_119_116  	              ( 
		.din0	( wr_data_muxed_nibbles[115:112] ), 
		.din1	( wr_data_muxed_nibbles[119:116] ), 
		.sel0	( fail_over_mask[28] ), 
		.sel1	( fail_over_mask_l[28] ), 
		.dout	( mux_io_data_out[119:116] ));
 
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_115_112  	              ( 
		.din0	( wr_data_muxed_nibbles[111:108] ), 
		.din1	( wr_data_muxed_nibbles[115:112] ), 
		.sel0	( fail_over_mask[27] ), 
		.sel1	( fail_over_mask_l[27] ), 
		.dout	( mux_io_data_out[115:112] ));
 
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_111_108  	              ( 
		.din0	( wr_data_muxed_nibbles[107:104] ), 
		.din1	( wr_data_muxed_nibbles[111:108] ), 
		.sel0	( fail_over_mask[26] ), 
		.sel1	( fail_over_mask_l[26] ), 
		.dout	( mux_io_data_out[111:108] ));
 
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_107_104  	              ( 
		.din0	( wr_data_muxed_nibbles[103:100] ), 
		.din1	( wr_data_muxed_nibbles[107:104] ), 
		.sel0	( fail_over_mask[25] ), 
		.sel1	( fail_over_mask_l[25] ), 
		.dout	( mux_io_data_out[107:104] ));
 
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_103_100  	              ( 
		.din0	( wr_data_muxed_nibbles[99:96] ), 
		.din1	( wr_data_muxed_nibbles[103:100] ), 
		.sel0	( fail_over_mask[24] ), 
		.sel1	( fail_over_mask_l[24] ), 
		.dout	( mux_io_data_out[103:100] ));
 
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_99_96    	              ( 
		.din0	( wr_data_muxed_nibbles[95:92] ), 
		.din1	( wr_data_muxed_nibbles[99:96] ),   
		.sel0	( fail_over_mask[23] ), 
		.sel1	( fail_over_mask_l[23] ), 
		.dout	( mux_io_data_out[99:96] ));
  
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_95_92    	              ( 
		.din0	( wr_data_muxed_nibbles[91:88] ), 
		.din1	( wr_data_muxed_nibbles[95:92] ),   
		.sel0	( fail_over_mask[22] ), 
		.sel1	( fail_over_mask_l[22] ), 
		.dout	( mux_io_data_out[95:92] ));
  
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_91_88    	              ( 
		.din0	( wr_data_muxed_nibbles[87:84] ), 
		.din1	( wr_data_muxed_nibbles[91:88] ),   
		.sel0	( fail_over_mask[21] ), 
		.sel1	( fail_over_mask_l[21] ), 
		.dout	( mux_io_data_out[91:88] ));
  
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_87_84    	              ( 
		.din0	( wr_data_muxed_nibbles[83:80] ), 
		.din1	( wr_data_muxed_nibbles[87:84] ),   
		.sel0	( fail_over_mask[20] ), 
		.sel1	( fail_over_mask_l[20] ), 
		.dout	( mux_io_data_out[87:84] ));
  
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_83_80    	              ( 
		.din0	( wr_data_muxed_nibbles[79:76] ), 
		.din1	( wr_data_muxed_nibbles[83:80] ),   
		.sel0	( fail_over_mask[19] ), 
		.sel1	( fail_over_mask_l[19] ), 
		.dout	( mux_io_data_out[83:80] ));
  
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_79_76    	              ( 
		.din0	( wr_data_muxed_nibbles[75:72] ), 
		.din1	( wr_data_muxed_nibbles[79:76] ),   
		.sel0	( fail_over_mask[18] ), 
		.sel1	( fail_over_mask_l[18] ), 
		.dout	( mux_io_data_out[79:76] ));
  
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_75_72    	              ( 
		.din0	( wr_data_muxed_nibbles[71:68] ), 
		.din1	( wr_data_muxed_nibbles[75:72] ),   
		.sel0	( fail_over_mask[17] ), 
		.sel1	( fail_over_mask_l[17] ), 
		.dout	( mux_io_data_out[75:72] ));
  
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_71_68    	              ( 
		.din0	( wr_data_muxed_nibbles[67:64] ), 
		.din1	( wr_data_muxed_nibbles[71:68] ),   
		.sel0	( fail_over_mask[16] ), 
		.sel1	( fail_over_mask_l[16] ), 
		.dout	( mux_io_data_out[71:68] ));
  
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_67_64    	              ( 
		.din0	( wr_data_muxed_nibbles[63:60] ), 
		.din1	( wr_data_muxed_nibbles[67:64] ),   
		.sel0	( fail_over_mask[15] ), 
		.sel1	( fail_over_mask_l[15] ), 
		.dout	( mux_io_data_out[67:64] ));
  
// sdram write data [63:0]

mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_63_60    	              ( 
		.din0	( wr_data_muxed_nibbles[59:56] ), 
		.din1	( wr_data_muxed_nibbles[63:60] ),   
		.sel0	( fail_over_mask[14] ), 
		.sel1	( fail_over_mask_l[14] ), 
		.dout	( mux_io_data_out[63:60] ));
  
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_59_56    	              ( 
		.din0	( wr_data_muxed_nibbles[55:52] ), 
		.din1	( wr_data_muxed_nibbles[59:56] ),   
		.sel0	( fail_over_mask[13] ), 
		.sel1	( fail_over_mask_l[13] ), 
		.dout	( mux_io_data_out[59:56] ));
  
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_55_52    	              ( 
		.din0	( wr_data_muxed_nibbles[51:48] ), 
		.din1	( wr_data_muxed_nibbles[55:52] ),   
		.sel0	( fail_over_mask[12] ), 
		.sel1	( fail_over_mask_l[12] ), 
		.dout	( mux_io_data_out[55:52] ));
  
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_51_48    	              ( 
		.din0	( wr_data_muxed_nibbles[47:44] ), 
		.din1	( wr_data_muxed_nibbles[51:48] ),   
		.sel0	( fail_over_mask[11] ), 
		.sel1	( fail_over_mask_l[11] ), 
		.dout	( mux_io_data_out[51:48] ));
  
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_47_44    	              ( 
		.din0	( wr_data_muxed_nibbles[43:40] ), 
		.din1	( wr_data_muxed_nibbles[47:44] ),   
		.sel0	( fail_over_mask[10] ), 
		.sel1	( fail_over_mask_l[10] ), 
		.dout	( mux_io_data_out[47:44] ));
  
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_43_40    	              ( 
		.din0	( wr_data_muxed_nibbles[39:36] ), 
		.din1	( wr_data_muxed_nibbles[43:40] ),   
		.sel0	( fail_over_mask[9] ), 
		.sel1	( fail_over_mask_l[9] ), 
		.dout	( mux_io_data_out[43:40] ));
  
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_39_36    	              ( 
		.din0	( wr_data_muxed_nibbles[35:32] ), 
		.din1	( wr_data_muxed_nibbles[39:36] ),   
		.sel0	( fail_over_mask[8] ), 
		.sel1	( fail_over_mask_l[8] ), 
		.dout	( mux_io_data_out[39:36] ));
  
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_35_32    	              ( 
		.din0	( wr_data_muxed_nibbles[31:28] ), 
		.din1	( wr_data_muxed_nibbles[35:32] ),   
		.sel0	( fail_over_mask[7] ), 
		.sel1	( fail_over_mask_l[7] ), 
		.dout	( mux_io_data_out[35:32] ));
  
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_31_28    	              ( 
		.din0	( wr_data_muxed_nibbles[27:24] ), 
		.din1	( wr_data_muxed_nibbles[31:28] ),   
		.sel0	( fail_over_mask[6] ), 
		.sel1	( fail_over_mask_l[6] ), 
		.dout	( mux_io_data_out[31:28] ));
  
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_27_24    	              ( 
		.din0	( wr_data_muxed_nibbles[23:20] ), 
		.din1	( wr_data_muxed_nibbles[27:24] ),   
		.sel0	( fail_over_mask[5] ), 
		.sel1	( fail_over_mask_l[5] ), 
		.dout	( mux_io_data_out[27:24] ));
  
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_23_20    	              ( 
		.din0	( wr_data_muxed_nibbles[19:16] ), 
		.din1	( wr_data_muxed_nibbles[23:20] ),   
		.sel0	( fail_over_mask[4] ), 
		.sel1	( fail_over_mask_l[4] ), 
		.dout	( mux_io_data_out[23:20] ));
  
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_19_16    	              ( 
		.din0	( wr_data_muxed_nibbles[15:12] ), 
		.din1	( wr_data_muxed_nibbles[19:16] ),   
		.sel0	( fail_over_mask[3] ), 
		.sel1	( fail_over_mask_l[3] ), 
		.dout	( mux_io_data_out[19:16] ));
  
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_15_12    	              ( 
		.din0	( wr_data_muxed_nibbles[11:8] ), 
		.din1	( wr_data_muxed_nibbles[15:12] ),   
		.sel0	( fail_over_mask[2] ), 
		.sel1	( fail_over_mask_l[2] ), 
		.dout	( mux_io_data_out[15:12] ));
    
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_11_8     	              ( 
		.din0	( wr_data_muxed_nibbles[7:4] ), 
		.din1	( wr_data_muxed_nibbles[11:8] ),    
		.sel0	( fail_over_mask[1] ), 
		.sel1	( fail_over_mask_l[1] ), 
		.dout	( mux_io_data_out[11:8] ));
 
mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4	u_mux_data_out_7_4      	              ( 
		.din0	( wr_data_muxed_nibbles[3:0] ), 
		.din1	( wr_data_muxed_nibbles[7:4] ),     
		.sel0	( fail_over_mask[0] ), 
		.sel1	( fail_over_mask_l[0] ), 
		.dout	( mux_io_data_out[7:4] ));
   

// Data out reg to SDRAM. Multiplex high/low order data to support 1DIMM mode.

mcu_wrdp_dp_msff_macro__mux_aonpe__ports_2__stack_64c__width_64	u_io_data_127_64			            (
		.scan_in(u_io_data_127_64_scanin),
		.scan_out(u_io_data_127_64_scanout),
		.clk		( drl2clk),
		.en		( 1'b1 ),
		.din0		( mux_io_data_out[135:72] ),
		.din1		( { mux_io_data_out[63:4],  wr_data_muxed_nibbles[3:0] } ),
                .sel0           ( io_wdata_sel[0] ),           // high order data
                .sel1           ( io_wdata_sel[1] ),           // low order data
		.dout		( mcu_io_data_out[135:72] ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_wrdp_dp_msff_macro__stack_64c__width_64	u_io_data_63_0				      (
		.scan_in(u_io_data_63_0_scanin),
		.scan_out(u_io_data_63_0_scanout),
		.clk		( drl2clk),
		.en		( 1'b1 ),
		.din		( { mux_io_data_out[63:4],  wr_data_muxed_nibbles[3:0] } ),
		.dout		( mcu_io_data_out[63:0] ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


// ECC out reg to SDRAM. Multiplex high/low order ECC to support Single Channel mode.

mcu_wrdp_dp_mux_macro__mux_aonpe__ports_2__stack_32c__width_16 	u_io_muxecc_15_0    		              (
		.din0	        ( { mux_io_data_out[143:136], mux_io_data_out[71:64] } ),
		.din1	        ( { mux_io_data_out[71:64],   {8 {1'b0}}             } ),
                .sel0           ( io_wdata_sel[0] ),           // high order ECC[7:0]
                .sel1           ( io_wdata_sel[1] ),           // low order ECC[15:8]
		.dout	        ( mux_io_ecc_out[15:0] ));


mcu_wrdp_dp_msff_macro__stack_32c__width_32	u_io_ecc_15_0    		      (
		.scan_in(u_io_ecc_15_0_scanin),
		.scan_out(u_io_ecc_15_0_scanout),
		.clk		( drl2clk),
		.en		( 1'b1 ),
		.din		( { {4{lfsr_in[0]}},lfsr_in[11:0],  mux_io_ecc_out[15:0] } ),
		.dout		( { lfsr_out_0[3:0], lfsr_out[11:0], mcu_io_data_out[143:136], mcu_io_data_out[71:64] } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));



// fixscan start:
assign u_wdqrf00_data_scanin     = scan_in                  ;
assign u_wdqrf01_data_scanin     = u_wdqrf00_data_scanout   ;
assign u_wdqrf10_data_scanin     = u_wdqrf01_data_scanout   ;
assign u_wdqrf11_data_scanin     = u_wdqrf10_data_scanout   ;
assign u_scrub_wdata_511_448_scanin = u_wdqrf11_data_scanout   ;
assign u_scrub_wdata_447_384_scanin = u_scrub_wdata_511_448_scanout;
assign u_scrub_wdata_383_320_scanin = u_scrub_wdata_447_384_scanout;
assign u_scrub_wdata_319_256_scanin = u_scrub_wdata_383_320_scanout;
assign u_scrub_wdata_255_192_scanin = u_scrub_wdata_319_256_scanout;
assign u_scrub_wdata_191_128_scanin = u_scrub_wdata_255_192_scanout;
assign u_scrub_wdata_127_64_scanin = u_scrub_wdata_191_128_scanout;
assign u_scrub_wdata_63_0_scanin = u_scrub_wdata_127_64_scanout;
assign u_wdata_127_64_scanin     = u_scrub_wdata_63_0_scanout;
assign u_wdata_63_0_scanin       = u_wdata_127_64_scanout   ;
assign u_io_data_127_64_scanin   = u_wdata_63_0_scanout     ;
assign u_io_data_63_0_scanin     = u_io_data_127_64_scanout ;
assign u_io_ecc_15_0_scanin      = u_io_data_63_0_scanout   ;
assign scan_out                  = u_io_ecc_15_0_scanout    ;
// fixscan end:
endmodule	// mcu_wrdp_dp


//
//   invert macro
//
//





module mcu_wrdp_dp_inv_macro__width_3 (
  din, 
  dout);
  input [2:0] din;
  output [2:0] dout;






inv #(3)  d0_0 (
.in(din[2:0]),
.out(dout[2:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module mcu_wrdp_dp_nor_macro (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);







endmodule









// any PARAMS parms go into naming of macro

module mcu_wrdp_dp_msff_macro__stack_64c__width_64 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_wrdp_dp_mux_macro__mux_aonpe__ports_4__stack_64c__width_64 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  input [63:0] din2;
  input sel2;
  input [63:0] din3;
  input sel3;
  output [63:0] dout;





cl_dp1_muxbuff4_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(64)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
.dout(dout[63:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module mcu_wrdp_dp_msff_macro__mux_aonpe__ports_4__stack_64c__width_64 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire [63:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  input [63:0] din2;
  input sel2;
  input [63:0] din3;
  input sel3;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_muxbuff4_8x  c1_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(64)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
.dout(muxout[63:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);





endmodule



//
//   buff macro
//
//





module mcu_wrdp_dp_buff_macro__stack_64c__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






buff #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);








endmodule





//
//   buff macro
//
//





module mcu_wrdp_dp_buff_macro__stack_2l__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






buff #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);








endmodule





//
//   xor macro for ports = 2,3
//
//





module mcu_wrdp_dp_xor_macro__dxor_8x__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;





xor3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);








endmodule





//
//   buff macro
//
//





module mcu_wrdp_dp_buff_macro__stack_16l__width_16 (
  din, 
  dout);
  input [15:0] din;
  output [15:0] dout;






buff #(16)  d0_0 (
.in(din[15:0]),
.out(dout[15:0])
);








endmodule





//  
//   and macro for ports = 2,3,4
//
//





module mcu_wrdp_dp_and_macro__ports_2__stack_16r__width_16 (
  din0, 
  din1, 
  dout);
  input [15:0] din0;
  input [15:0] din1;
  output [15:0] dout;






and2 #(16)  d0_0 (
.in0(din0[15:0]),
.in1(din1[15:0]),
.out(dout[15:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module mcu_wrdp_dp_nand_macro__width_48 (
  din0, 
  din1, 
  dout);
  input [47:0] din0;
  input [47:0] din1;
  output [47:0] dout;






nand2 #(48)  d0_0 (
.in0(din0[47:0]),
.in1(din1[47:0]),
.out(dout[47:0])
);









endmodule





//
//   xor macro for ports = 2,3
//
//





module mcu_wrdp_dp_xor_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;





xor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);








endmodule





//
//   xor macro for ports = 2,3
//
//





module mcu_wrdp_dp_xor_macro__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;





xor3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_wrdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_4 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [3:0] din0;
  input sel0;
  input [3:0] din1;
  input sel1;
  output [3:0] dout;





mux2s #(4)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[3:0]),
  .in1(din1[3:0]),
.dout(dout[3:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module mcu_wrdp_dp_msff_macro__mux_aonpe__ports_2__stack_64c__width_64 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire buffout0;
wire buffout1;
wire [63:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_muxbuff2_8x  c1_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(64)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
.dout(muxout[63:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_wrdp_dp_mux_macro__mux_aonpe__ports_2__stack_32c__width_16 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [15:0] din0;
  input sel0;
  input [15:0] din1;
  input sel1;
  output [15:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(16)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[15:0]),
  .in1(din1[15:0]),
.dout(dout[15:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module mcu_wrdp_dp_msff_macro__stack_32c__width_32 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [30:0] so;

  input [31:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [31:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);




















endmodule








