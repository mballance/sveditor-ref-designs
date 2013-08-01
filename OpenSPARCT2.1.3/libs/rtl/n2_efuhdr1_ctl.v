// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_efuhdr1_ctl.v
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
module n2_efuhdr1_ctl (
  efu_hdr_write_data, 
  efu_hdr_xfer_en, 
  efu_hdr_clr, 
  hdr_efu_read_data, 
  hdr_efu_xfer_en, 
  hdr_sram_rvalue, 
  hdr_sram_rid, 
  hdr_sram_wr_en, 
  hdr_sram_red_clr, 
  sram_hdr_read_data, 
  l2clk, 
  io_cmp_sync_en, 
  cmp_io_sync_en, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_clk_stop, 
  scan_in, 
  scan_out) ;
wire stop;
wire se;
wire l1clk_cmp;
wire ff_cmp_io_sync_en_scanin;
wire ff_cmp_io_sync_en_scanout;
wire cmp_io_sync_en_r1;
wire ff_io_cmp_sync_en_scanin;
wire ff_io_cmp_sync_en_scanout;
wire io_cmp_sync_en_r1;
wire ff_input_all_enable_scanin;
wire ff_input_all_enable_scanout;
wire efu_hdr_xfer_en_r1;
wire efu_hdr_write_data_r1;
wire efu_hdr_clr_r1;
wire efu_hdr_xfer_en_r2;
wire [21:0] efu_instr;
wire [21:0] instr;
wire [21:0] sram_read_data;
wire [21:0] received_instr;
wire [4:0] rdcount;
wire [21:0] sync_read;
wire dispatch_read_data;
wire load_shift_reg;
wire ff_receiver_instr_slice_scanin;
wire ff_receiver_instr_slice_scanout;
wire data_en_io_cmp;
wire [4:0] count;
wire wr_en;
wire [21:0] sync_instr;
wire read_en_io_cmp;
wire ff_sync_sram_data_scanin;
wire ff_sync_sram_data_scanout;
wire ff_sync_read_data_scanin;
wire ff_sync_read_data_scanout;
wire ff_sync_sram_clr_scanin;
wire ff_sync_sram_clr_scanout;
wire sync_clr;
wire ff_sync_sram_wr_scanin;
wire ff_sync_sram_wr_scanout;
wire sync_wr;
wire load_en;
wire ld_rd_en;
wire reset_count;
wire rdreset_count;
wire [4:0] count_in;
wire [4:0] rdcount_in;
wire ff_counter_slice_scanin;
wire ff_counter_slice_scanout;
wire ff_rd_counter_scanin;
wire ff_rd_counter_scanout;
wire spares_cmp_scanin;
wire spares_cmp_scanout;


// EFU to SRAM header 
input		efu_hdr_write_data;
input		efu_hdr_xfer_en;
input		efu_hdr_clr;

// SRAM header to EFU 
output		hdr_efu_read_data;
output		hdr_efu_xfer_en;

// SRAM header to SRAM
output	[ 10 : 0 ]	hdr_sram_rvalue;
output	[ 10 : 0 ]	hdr_sram_rid;
output		hdr_sram_wr_en;
output		hdr_sram_red_clr;

// SRAM to SRAM header
input	[ 10 : 0 ]	sram_hdr_read_data;


// other common signals

input           l2clk;
input		io_cmp_sync_en;
input		cmp_io_sync_en;
input 		tcu_pce_ov;
input 		tcu_aclk;
input 		tcu_bclk;
input 		tcu_scan_en;
input 		tcu_clk_stop;
input           scan_in;
output		scan_out;



// scan renames
wire pce_ov;
wire siclk;
wire soclk;

assign pce_ov = tcu_pce_ov;
assign stop  = tcu_clk_stop;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se    = tcu_scan_en;
// end scan renames


l1clkhdr_ctl_macro clkgen_l1clk   
	(
 	.l2clk( l2clk      ),
 	.l1en ( 1'b1       ),
 	.l1clk( l1clk_cmp  ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
	);


msff_ctl_macro__width_1 ff_cmp_io_sync_en        
	(
	.scan_in(ff_cmp_io_sync_en_scanin),
	.scan_out(ff_cmp_io_sync_en_scanout),
	.dout	(cmp_io_sync_en_r1),
	.din	(cmp_io_sync_en),
	.l1clk	(l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
	);

msff_ctl_macro__width_1 ff_io_cmp_sync_en        
	(
	.scan_in(ff_io_cmp_sync_en_scanin),
	.scan_out(ff_io_cmp_sync_en_scanout),
	.dout	(io_cmp_sync_en_r1),
	.din	(io_cmp_sync_en),
	.l1clk	(l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
	);

msff_ctl_macro__en_1__width_4 ff_input_all_enable         
	(
	.scan_in(ff_input_all_enable_scanin),
	.scan_out(ff_input_all_enable_scanout),
	.dout	({efu_hdr_xfer_en_r1,efu_hdr_write_data_r1,efu_hdr_clr_r1,efu_hdr_xfer_en_r2}),
	.din	({efu_hdr_xfer_en,   efu_hdr_write_data   ,efu_hdr_clr,   efu_hdr_xfer_en_r1}),
        .en     (io_cmp_sync_en_r1),
	.l1clk	(l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
	);


assign efu_instr[ 21 : 0 ]      = {instr[ 20 : 0 ],efu_hdr_write_data_r1}; 

assign sram_read_data[ 21 : 0 ] = {instr[ 21 : 11 ],sram_hdr_read_data[ 10 : 0 ]};

//assign received_instr[21:0] = efu_hdr_xfer_en_r1 ? efu_instr[21:0] : 
//			      (count==5'd6) ? sram_read_data[21:0] : 
//				dispatch_read_data ? ({instr[20:0],1'b0}) : 22'b0;

assign received_instr[ 21 : 0 ] = efu_hdr_xfer_en_r1 ? efu_instr[ 21 : 0 ] 
                            : rdcount == 5'd23 ? sync_read 
                            : dispatch_read_data ? ({instr[ 20 : 0 ],1'b0}) : 22'b0;


//assign load_shift_reg = efu_hdr_xfer_en_r1 | dispatch_read_data;
assign load_shift_reg = efu_hdr_xfer_en_r1 | dispatch_read_data | rdcount == 5'd23;

msff_ctl_macro__en_1__width_22 ff_receiver_instr_slice 
	(
        .scan_in(ff_receiver_instr_slice_scanin),
        .scan_out(ff_receiver_instr_slice_scanout),
        .dout   (instr[ 21 : 0 ]),
        .din    (load_shift_reg ? received_instr[ 21 : 0 ] : instr[ 21 : 0 ]),
	.en	(io_cmp_sync_en_r1),
        .l1clk    (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

//data available at 5'd8 (completely shifted in)
assign data_en_io_cmp = (count==5'd8) & io_cmp_sync_en_r1;
// generate wr_en after 1 cycle of setup and enable bits are valid
//assign wr_en          = (count==5'd7) & sync_instr[11] & sync_instr[0];
assign wr_en          = (count==5'd7) & ~sync_instr[ 21 ];
//get data back from sram after 4 ioclk cycles wait
assign read_en_io_cmp = (count==5'd1) & cmp_io_sync_en_r1;

msff_ctl_macro__en_1__width_22 ff_sync_sram_data 
	(
        .scan_in(ff_sync_sram_data_scanin),
	.scan_out(ff_sync_sram_data_scanout),
	.dout	(sync_instr[ 21 : 0 ]),
	.din	((count==5'd8) ? instr[ 21 : 0 ] : sync_instr[ 21 : 0 ]),
	.en	(io_cmp_sync_en_r1),
	.l1clk	(l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
	);

msff_ctl_macro__en_1__width_22 ff_sync_read_data 
	(
        .scan_in(ff_sync_read_data_scanin),
	.scan_out(ff_sync_read_data_scanout),
	.dout	(sync_read[ 21 : 0 ]),
	.din	((count==5'd1) ? sram_read_data[ 21 : 0 ] : sync_read[ 21 : 0 ]),
	.en	(cmp_io_sync_en_r1),
	.l1clk	(l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
	);

msff_ctl_macro__en_1__width_1 ff_sync_sram_clr 
	(
        .scan_in(ff_sync_sram_clr_scanin),
	.scan_out(ff_sync_sram_clr_scanout),
	.dout	(sync_clr),
	.din	(efu_hdr_clr_r1),
	.en	(io_cmp_sync_en_r1),
	.l1clk	(l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
	);

msff_ctl_macro__en_1__width_1 ff_sync_sram_wr 
	(
        .scan_in(ff_sync_sram_wr_scanin),
	.scan_out(ff_sync_sram_wr_scanout),
	.dout	(sync_wr),
	.din	(wr_en),
	.en	(io_cmp_sync_en_r1),
	.l1clk	(l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
	);



assign load_en = (~efu_hdr_xfer_en_r2 & efu_hdr_xfer_en_r1);
assign ld_rd_en = (count==5'd1);

assign reset_count   = (   count == 5'd0 );
assign rdreset_count = ( rdcount == 5'd0 );

assign   count_in = load_en  ? 5'd29 : reset_count   ? 5'b0 : (  count - 5'b1);
assign rdcount_in = ld_rd_en ? 5'd23 : rdreset_count ? 5'b0 : (rdcount - 5'b1);

msff_ctl_macro__en_1__width_5 ff_counter_slice 
        (
        .scan_in(ff_counter_slice_scanin),
        .scan_out(ff_counter_slice_scanout),
        .dout   (count[ 4 : 0 ]),
        .din    (count_in[ 4 : 0 ]),
        .en     (io_cmp_sync_en_r1),
        .l1clk    (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

msff_ctl_macro__en_1__width_5 ff_rd_counter 
        (
        .scan_in(ff_rd_counter_scanin),
        .scan_out(ff_rd_counter_scanout),
        .dout   (rdcount[ 4 : 0 ]),
        .din    (rdcount_in[ 4 : 0 ]),
        .en     (io_cmp_sync_en_r1),
        .l1clk    (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
        );

spare_ctl_macro__num_4 spares_cmp  (
	.scan_in(spares_cmp_scanin),
	.scan_out(spares_cmp_scanout),
	.l1clk (l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
);

//assign hdr_sram_rvalue[10:0]  = instr[10:0];
//assign hdr_sram_rid[10:0]     = instr[21:11];
//assign hdr_sram_red_clr       = efu_hdr_clr_r1;
//assign hdr_sram_wr_en         = |(count[1:0]);
assign hdr_sram_rvalue[ 10 : 0 ]  = sync_instr[ 10 : 0 ];
assign hdr_sram_rid[ 10 : 0 ]     = sync_instr[ 21 : 11 ];
assign hdr_sram_red_clr       = sync_clr;
assign hdr_sram_wr_en         = sync_wr;


assign dispatch_read_data = (rdcount[ 4 : 0 ] < 5'd23 & rdcount[ 4 : 0 ] != 5'd0);

assign hdr_efu_read_data  = instr[ 21 ];
assign hdr_efu_xfer_en    = dispatch_read_data;

// fixscan start:
assign ff_cmp_io_sync_en_scanin = scan_in ;
assign ff_io_cmp_sync_en_scanin = ff_cmp_io_sync_en_scanout;
assign ff_input_all_enable_scanin = ff_io_cmp_sync_en_scanout;
assign ff_receiver_instr_slice_scanin = ff_input_all_enable_scanout;
assign ff_counter_slice_scanin   = ff_receiver_instr_slice_scanout;
assign ff_sync_sram_data_scanin = ff_counter_slice_scanout;
assign ff_sync_read_data_scanin = ff_sync_sram_data_scanout;
assign ff_sync_sram_clr_scanin = ff_sync_read_data_scanout;
assign ff_sync_sram_wr_scanin = ff_sync_sram_clr_scanout;
assign ff_rd_counter_scanin = ff_sync_sram_wr_scanout;
assign spares_cmp_scanin = ff_rd_counter_scanout ;
assign scan_out                  = spares_cmp_scanout ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module l1clkhdr_ctl_macro (
  l2clk, 
  l1en, 
  pce_ov, 
  stop, 
  se, 
  l1clk);


  input l2clk;
  input l1en;
  input pce_ov;
  input stop;
  input se;
  output l1clk;



 

cl_sc1_l1hdr_8x c_0 (


   .l2clk(l2clk),
   .pce(l1en),
   .l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop)
);



endmodule













// any PARAMS parms go into naming of macro

module msff_ctl_macro__width_1 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [ 0 : 0 ] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [ 0 : 0 ] dout;
  output scan_out;
assign fdin[ 0 : 0 ] = din[ 0 : 0 ];









    







cl_sc1_msff_4x d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 0 ]),
.si(scan_in),
.so(scan_out),
.q(dout[ 0 ])
);




endmodule













// any PARAMS parms go into naming of macro

module msff_ctl_macro__en_1__width_4 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [3:1] sout;

  input [ 3 : 0 ] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [ 3 : 0 ] dout;
  output scan_out;
assign fdin[ 3 : 0 ] = (din[ 3 : 0 ] & {4{en}}) | (dout[ 3 : 0 ] & ~{4{en}});









    







cl_sc1_msff_4x d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 0 ]),
.si(sout[ 1 ]),
.so(scan_out),
.q(dout[ 0 ])
);
cl_sc1_msff_4x d0_1 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 1 ]),
.si(sout[ 2 ]),
.so(sout[ 1 ]),
.q(dout[ 1 ])
);
cl_sc1_msff_4x d0_2 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 2 ]),
.si(sout[ 3 ]),
.so(sout[ 2 ]),
.q(dout[ 2 ])
);
cl_sc1_msff_4x d0_3 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 3 ]),
.si(scan_in),
.so(sout[ 3 ]),
.q(dout[ 3 ])
);




endmodule













// any PARAMS parms go into naming of macro

module msff_ctl_macro__en_1__width_22 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [21:0] fdin;
wire [21:1] sout;

  input [ 21 : 0 ] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [ 21 : 0 ] dout;
  output scan_out;
assign fdin[ 21 : 0 ] = (din[ 21 : 0 ] & {22{en}}) | (dout[ 21 : 0 ] & ~{22{en}});









    







cl_sc1_msff_4x d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 0 ]),
.si(sout[ 1 ]),
.so(scan_out),
.q(dout[ 0 ])
);
cl_sc1_msff_4x d0_1 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 1 ]),
.si(sout[ 2 ]),
.so(sout[ 1 ]),
.q(dout[ 1 ])
);
cl_sc1_msff_4x d0_2 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 2 ]),
.si(sout[ 3 ]),
.so(sout[ 2 ]),
.q(dout[ 2 ])
);
cl_sc1_msff_4x d0_3 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 3 ]),
.si(sout[ 4 ]),
.so(sout[ 3 ]),
.q(dout[ 3 ])
);
cl_sc1_msff_4x d0_4 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 4 ]),
.si(sout[ 5 ]),
.so(sout[ 4 ]),
.q(dout[ 4 ])
);
cl_sc1_msff_4x d0_5 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 5 ]),
.si(sout[ 6 ]),
.so(sout[ 5 ]),
.q(dout[ 5 ])
);
cl_sc1_msff_4x d0_6 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 6 ]),
.si(sout[ 7 ]),
.so(sout[ 6 ]),
.q(dout[ 6 ])
);
cl_sc1_msff_4x d0_7 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 7 ]),
.si(sout[ 8 ]),
.so(sout[ 7 ]),
.q(dout[ 7 ])
);
cl_sc1_msff_4x d0_8 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 8 ]),
.si(sout[ 9 ]),
.so(sout[ 8 ]),
.q(dout[ 8 ])
);
cl_sc1_msff_4x d0_9 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 9 ]),
.si(sout[ 10 ]),
.so(sout[ 9 ]),
.q(dout[ 9 ])
);
cl_sc1_msff_4x d0_10 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 10 ]),
.si(sout[ 11 ]),
.so(sout[ 10 ]),
.q(dout[ 10 ])
);
cl_sc1_msff_4x d0_11 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 11 ]),
.si(sout[ 12 ]),
.so(sout[ 11 ]),
.q(dout[ 11 ])
);
cl_sc1_msff_4x d0_12 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 12 ]),
.si(sout[ 13 ]),
.so(sout[ 12 ]),
.q(dout[ 12 ])
);
cl_sc1_msff_4x d0_13 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 13 ]),
.si(sout[ 14 ]),
.so(sout[ 13 ]),
.q(dout[ 13 ])
);
cl_sc1_msff_4x d0_14 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 14 ]),
.si(sout[ 15 ]),
.so(sout[ 14 ]),
.q(dout[ 14 ])
);
cl_sc1_msff_4x d0_15 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 15 ]),
.si(sout[ 16 ]),
.so(sout[ 15 ]),
.q(dout[ 15 ])
);
cl_sc1_msff_4x d0_16 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 16 ]),
.si(sout[ 17 ]),
.so(sout[ 16 ]),
.q(dout[ 16 ])
);
cl_sc1_msff_4x d0_17 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 17 ]),
.si(sout[ 18 ]),
.so(sout[ 17 ]),
.q(dout[ 17 ])
);
cl_sc1_msff_4x d0_18 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 18 ]),
.si(sout[ 19 ]),
.so(sout[ 18 ]),
.q(dout[ 18 ])
);
cl_sc1_msff_4x d0_19 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 19 ]),
.si(sout[ 20 ]),
.so(sout[ 19 ]),
.q(dout[ 19 ])
);
cl_sc1_msff_4x d0_20 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 20 ]),
.si(sout[ 21 ]),
.so(sout[ 20 ]),
.q(dout[ 20 ])
);
cl_sc1_msff_4x d0_21 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 21 ]),
.si(scan_in),
.so(sout[ 21 ]),
.q(dout[ 21 ])
);




endmodule













// any PARAMS parms go into naming of macro

module msff_ctl_macro__en_1__width_1 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [ 0 : 0 ] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [ 0 : 0 ] dout;
  output scan_out;
assign fdin[ 0 : 0 ] = (din[ 0 : 0 ] & {1{en}}) | (dout[ 0 : 0 ] & ~{1{en}});









    







cl_sc1_msff_4x d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 0 ]),
.si(scan_in),
.so(scan_out),
.q(dout[ 0 ])
);




endmodule













// any PARAMS parms go into naming of macro

module msff_ctl_macro__en_1__width_5 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [4:1] sout;

  input [ 4 : 0 ] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [ 4 : 0 ] dout;
  output scan_out;
assign fdin[ 4 : 0 ] = (din[ 4 : 0 ] & {5{en}}) | (dout[ 4 : 0 ] & ~{5{en}});









    







cl_sc1_msff_4x d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 0 ]),
.si(sout[ 1 ]),
.so(scan_out),
.q(dout[ 0 ])
);
cl_sc1_msff_4x d0_1 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 1 ]),
.si(sout[ 2 ]),
.so(sout[ 1 ]),
.q(dout[ 1 ])
);
cl_sc1_msff_4x d0_2 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 2 ]),
.si(sout[ 3 ]),
.so(sout[ 2 ]),
.q(dout[ 2 ])
);
cl_sc1_msff_4x d0_3 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 3 ]),
.si(sout[ 4 ]),
.so(sout[ 3 ]),
.q(dout[ 3 ])
);
cl_sc1_msff_4x d0_4 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[ 4 ]),
.si(scan_in),
.so(sout[ 4 ]),
.q(dout[ 4 ])
);




endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module spare_ctl_macro__num_4 (
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  scan_out);
wire si_0;
wire so_0;
wire spare0_flop_unused;
wire spare0_buf_32x_unused;
wire spare0_nand3_8x_unused;
wire spare0_inv_8x_unused;
wire spare0_aoi22_4x_unused;
wire spare0_buf_8x_unused;
wire spare0_oai22_4x_unused;
wire spare0_inv_16x_unused;
wire spare0_nand2_16x_unused;
wire spare0_nor3_4x_unused;
wire spare0_nand2_8x_unused;
wire spare0_buf_16x_unused;
wire spare0_nor2_16x_unused;
wire spare0_inv_32x_unused;
wire si_1;
wire so_1;
wire spare1_flop_unused;
wire spare1_buf_32x_unused;
wire spare1_nand3_8x_unused;
wire spare1_inv_8x_unused;
wire spare1_aoi22_4x_unused;
wire spare1_buf_8x_unused;
wire spare1_oai22_4x_unused;
wire spare1_inv_16x_unused;
wire spare1_nand2_16x_unused;
wire spare1_nor3_4x_unused;
wire spare1_nand2_8x_unused;
wire spare1_buf_16x_unused;
wire spare1_nor2_16x_unused;
wire spare1_inv_32x_unused;
wire si_2;
wire so_2;
wire spare2_flop_unused;
wire spare2_buf_32x_unused;
wire spare2_nand3_8x_unused;
wire spare2_inv_8x_unused;
wire spare2_aoi22_4x_unused;
wire spare2_buf_8x_unused;
wire spare2_oai22_4x_unused;
wire spare2_inv_16x_unused;
wire spare2_nand2_16x_unused;
wire spare2_nor3_4x_unused;
wire spare2_nand2_8x_unused;
wire spare2_buf_16x_unused;
wire spare2_nor2_16x_unused;
wire spare2_inv_32x_unused;
wire si_3;
wire so_3;
wire spare3_flop_unused;
wire spare3_buf_32x_unused;
wire spare3_nand3_8x_unused;
wire spare3_inv_8x_unused;
wire spare3_aoi22_4x_unused;
wire spare3_buf_8x_unused;
wire spare3_oai22_4x_unused;
wire spare3_inv_16x_unused;
wire spare3_nand2_16x_unused;
wire spare3_nor3_4x_unused;
wire spare3_nand2_8x_unused;
wire spare3_buf_16x_unused;
wire spare3_nor2_16x_unused;
wire spare3_inv_32x_unused;


input		l1clk;
input		scan_in;
input		siclk;
input		soclk;
output		scan_out;

cl_sc1_msff_8x spare0_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_0),
                               .so(so_0),
                               .d(1'b0),
                               .q(spare0_flop_unused));
assign si_0 = scan_in;

cl_u1_buf_32x   spare0_buf_32x (.in(1'b1),
                                   .out(spare0_buf_32x_unused));
cl_u1_nand3_8x spare0_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare0_nand3_8x_unused));
cl_u1_inv_8x    spare0_inv_8x (.in(1'b1),
                                  .out(spare0_inv_8x_unused));
cl_u1_aoi22_4x spare0_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_aoi22_4x_unused));
cl_u1_buf_8x    spare0_buf_8x (.in(1'b1),
                                  .out(spare0_buf_8x_unused));
cl_u1_oai22_4x spare0_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_oai22_4x_unused));
cl_u1_inv_16x   spare0_inv_16x (.in(1'b1),
                                   .out(spare0_inv_16x_unused));
cl_u1_nand2_16x spare0_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare0_nand2_16x_unused));
cl_u1_nor3_4x spare0_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare0_nor3_4x_unused));
cl_u1_nand2_8x spare0_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare0_nand2_8x_unused));
cl_u1_buf_16x   spare0_buf_16x (.in(1'b1),
                                   .out(spare0_buf_16x_unused));
cl_u1_nor2_16x spare0_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare0_nor2_16x_unused));
cl_u1_inv_32x   spare0_inv_32x (.in(1'b1),
                                   .out(spare0_inv_32x_unused));

cl_sc1_msff_8x spare1_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_1),
                               .so(so_1),
                               .d(1'b0),
                               .q(spare1_flop_unused));
assign si_1 = so_0;

cl_u1_buf_32x   spare1_buf_32x (.in(1'b1),
                                   .out(spare1_buf_32x_unused));
cl_u1_nand3_8x spare1_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare1_nand3_8x_unused));
cl_u1_inv_8x    spare1_inv_8x (.in(1'b1),
                                  .out(spare1_inv_8x_unused));
cl_u1_aoi22_4x spare1_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_aoi22_4x_unused));
cl_u1_buf_8x    spare1_buf_8x (.in(1'b1),
                                  .out(spare1_buf_8x_unused));
cl_u1_oai22_4x spare1_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_oai22_4x_unused));
cl_u1_inv_16x   spare1_inv_16x (.in(1'b1),
                                   .out(spare1_inv_16x_unused));
cl_u1_nand2_16x spare1_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare1_nand2_16x_unused));
cl_u1_nor3_4x spare1_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare1_nor3_4x_unused));
cl_u1_nand2_8x spare1_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare1_nand2_8x_unused));
cl_u1_buf_16x   spare1_buf_16x (.in(1'b1),
                                   .out(spare1_buf_16x_unused));
cl_u1_nor2_16x spare1_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare1_nor2_16x_unused));
cl_u1_inv_32x   spare1_inv_32x (.in(1'b1),
                                   .out(spare1_inv_32x_unused));

cl_sc1_msff_8x spare2_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_2),
                               .so(so_2),
                               .d(1'b0),
                               .q(spare2_flop_unused));
assign si_2 = so_1;

cl_u1_buf_32x   spare2_buf_32x (.in(1'b1),
                                   .out(spare2_buf_32x_unused));
cl_u1_nand3_8x spare2_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare2_nand3_8x_unused));
cl_u1_inv_8x    spare2_inv_8x (.in(1'b1),
                                  .out(spare2_inv_8x_unused));
cl_u1_aoi22_4x spare2_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_aoi22_4x_unused));
cl_u1_buf_8x    spare2_buf_8x (.in(1'b1),
                                  .out(spare2_buf_8x_unused));
cl_u1_oai22_4x spare2_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_oai22_4x_unused));
cl_u1_inv_16x   spare2_inv_16x (.in(1'b1),
                                   .out(spare2_inv_16x_unused));
cl_u1_nand2_16x spare2_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare2_nand2_16x_unused));
cl_u1_nor3_4x spare2_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare2_nor3_4x_unused));
cl_u1_nand2_8x spare2_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare2_nand2_8x_unused));
cl_u1_buf_16x   spare2_buf_16x (.in(1'b1),
                                   .out(spare2_buf_16x_unused));
cl_u1_nor2_16x spare2_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare2_nor2_16x_unused));
cl_u1_inv_32x   spare2_inv_32x (.in(1'b1),
                                   .out(spare2_inv_32x_unused));

cl_sc1_msff_8x spare3_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_3),
                               .so(so_3),
                               .d(1'b0),
                               .q(spare3_flop_unused));
assign si_3 = so_2;

cl_u1_buf_32x   spare3_buf_32x (.in(1'b1),
                                   .out(spare3_buf_32x_unused));
cl_u1_nand3_8x spare3_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare3_nand3_8x_unused));
cl_u1_inv_8x    spare3_inv_8x (.in(1'b1),
                                  .out(spare3_inv_8x_unused));
cl_u1_aoi22_4x spare3_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_aoi22_4x_unused));
cl_u1_buf_8x    spare3_buf_8x (.in(1'b1),
                                  .out(spare3_buf_8x_unused));
cl_u1_oai22_4x spare3_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_oai22_4x_unused));
cl_u1_inv_16x   spare3_inv_16x (.in(1'b1),
                                   .out(spare3_inv_16x_unused));
cl_u1_nand2_16x spare3_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare3_nand2_16x_unused));
cl_u1_nor3_4x spare3_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare3_nor3_4x_unused));
cl_u1_nand2_8x spare3_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare3_nand2_8x_unused));
cl_u1_buf_16x   spare3_buf_16x (.in(1'b1),
                                   .out(spare3_buf_16x_unused));
cl_u1_nor2_16x spare3_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare3_nor2_16x_unused));
cl_u1_inv_32x   spare3_inv_32x (.in(1'b1),
                                   .out(spare3_inv_32x_unused));
assign scan_out = so_3;



endmodule

