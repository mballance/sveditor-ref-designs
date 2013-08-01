// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tds_n2_efuhdr2_ctl.v
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

module tds_n2_efuhdr2_ctl (
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
  reset_l, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_clk_stop, 
  scan_in, 
  scan_out) ;
wire stop;
wire se;
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
wire [21:0] reset_bus;
wire load_shift_reg;
wire ff_receiver_instr_slice_scanin;
wire ff_receiver_instr_slice_scanout;
wire wr_en;
wire [4:0] count;
wire [21:0] sync_instr;
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


// EFU to SRAM header 
input		efu_hdr_write_data;
input		efu_hdr_xfer_en;
input		efu_hdr_clr;

// SRAM header to EFU 
output		hdr_efu_read_data;
output		hdr_efu_xfer_en;

// SRAM header to SRAM
output	[10:0]	hdr_sram_rvalue;
output	[10:0]	hdr_sram_rid;
output		hdr_sram_wr_en;
output		hdr_sram_red_clr;

// SRAM to SRAM header
input	[10:0]	sram_hdr_read_data;


// other common signals

input           l2clk;
input		reset_l;
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


//l1clkhdr_ctl_macro clkgen_l1clk   
//	(
//	.l2clk( l2clk      ),
//	.l1en ( 1'b1       ),
//	.l1clk( l1clk_efu  )
//	);


tds_n2_efuhdr2_msff_ctl_macro__library_a1__width_4 ff_input_all_enable        
	(
	.scan_in(ff_input_all_enable_scanin),
	.scan_out(ff_input_all_enable_scanout),
	.dout	({efu_hdr_xfer_en_r1,efu_hdr_write_data_r1,efu_hdr_clr_r1,efu_hdr_xfer_en_r2}),
	.din	({efu_hdr_xfer_en,   efu_hdr_write_data   ,efu_hdr_clr,   efu_hdr_xfer_en_r1}),
	.l1clk	(l2clk),
  .siclk(siclk),
  .soclk(soclk)
	);


assign efu_instr[21:0]      = {instr[20:0],efu_hdr_write_data_r1}; 

assign sram_read_data[21:0] = {instr[21:11],sram_hdr_read_data[10:0]};

assign received_instr[21:0] = efu_hdr_xfer_en_r1 ? efu_instr[21:0]
                            : rdcount == 5'd23 ? sync_read
                            : dispatch_read_data ? ({instr[20:0],1'b0}) : 22'b0;

assign reset_bus[21:0] = {reset_l, reset_l, reset_l, reset_l, reset_l, reset_l,
                          reset_l, reset_l, reset_l, reset_l, reset_l, reset_l,
                          reset_l, reset_l, reset_l, reset_l, reset_l, reset_l,
                          reset_l, reset_l, reset_l, reset_l};


//assign received_instr[21:0] = efu_hdr_xfer_en_r1 ? efu_instr[21:0] : 
//			      (count==5'd6) ? sram_read_data[21:0] : 
//				dispatch_read_data ? ({instr[20:0],1'b0}) : 22'b0;

//assign load_shift_reg = efu_hdr_xfer_en_r1 | dispatch_read_data;
assign load_shift_reg = efu_hdr_xfer_en_r1 | dispatch_read_data | rdcount == 5'd23;

tds_n2_efuhdr2_msff_ctl_macro__en_1__library_a1__width_22 ff_receiver_instr_slice 
	(
        .scan_in(ff_receiver_instr_slice_scanin),
        .scan_out(ff_receiver_instr_slice_scanout),
        .dout   (instr[21:0]),
        .din    (reset_bus[21:0] & received_instr[21:0]),
	.en	(~reset_l | load_shift_reg),
        .l1clk    (l2clk),
  .siclk(siclk),
  .soclk(soclk)
        );

// generate wr_en after 1 cycle of setup and enable bits are valid
//assign wr_en		= (count==5'd7) & sync_instr[11] & sync_instr[0];
assign wr_en		= reset_l & (count==5'd7) & ~sync_instr[21];

tds_n2_efuhdr2_msff_ctl_macro__en_1__library_a1__width_22 ff_sync_sram_data 
	(
        .scan_in(ff_sync_sram_data_scanin),
	.scan_out(ff_sync_sram_data_scanout),
	.dout	(sync_instr[21:0]),
	.din	(reset_bus[21:0] & instr[21:0]),
	.en	(~reset_l | count==5'd8),
	 .l1clk	(l2clk),
  .siclk(siclk),
  .soclk(soclk)
        );

tds_n2_efuhdr2_msff_ctl_macro__en_1__library_a1__width_22 ff_sync_read_data 
	(
        .scan_in(ff_sync_read_data_scanin),
	.scan_out(ff_sync_read_data_scanout),
	 .dout	(sync_read[21:0]),
	 .din	(reset_bus[21:0] & sram_read_data[21:0]),
	 .en	(~reset_l | count==5'd1),
	 .l1clk	(l2clk),
  .siclk(siclk),
  .soclk(soclk)
        );

tds_n2_efuhdr2_msff_ctl_macro__library_a1__width_1 ff_sync_sram_clr 
	(
        .scan_in(ff_sync_sram_clr_scanin),
	.scan_out(ff_sync_sram_clr_scanout),
	 .dout	(sync_clr),
	 .din	(efu_hdr_clr_r1),
	 .l1clk	(l2clk),
  .siclk(siclk),
  .soclk(soclk)
        );

tds_n2_efuhdr2_msff_ctl_macro__library_a1__width_1 ff_sync_sram_wr 
	(
        .scan_in(ff_sync_sram_wr_scanin),
	.scan_out(ff_sync_sram_wr_scanout),
	 .dout	(sync_wr),
	 .din	(wr_en),
	.l1clk	(l2clk),
  .siclk(siclk),
  .soclk(soclk)
        );


assign load_en  = (~efu_hdr_xfer_en_r2 & efu_hdr_xfer_en_r1);
assign ld_rd_en = (count==5'd1);

assign reset_count   = ( count == 5'd0 );
assign rdreset_count = ( rdcount == 5'd0 );

assign	 count_in = ~reset_l ? 5'b0 : load_en  ? 5'd29 : reset_count   ? 5'b0 : (	 count - 5'b1);
assign rdcount_in = ~reset_l ? 5'b0 : ld_rd_en ? 5'd23 : rdreset_count ? 5'b0 : (rdcount - 5'b1);

tds_n2_efuhdr2_msff_ctl_macro__library_a1__width_5 ff_counter_slice 
        (
        .scan_in(ff_counter_slice_scanin),
        .scan_out(ff_counter_slice_scanout),
        .dout   (count[4:0]),
        .din    (count_in[4:0]),
        .l1clk    (l2clk),
  .siclk(siclk),
  .soclk(soclk)
        );

tds_n2_efuhdr2_msff_ctl_macro__library_a1__width_5 ff_rd_counter 
        (
	 .scan_in(ff_rd_counter_scanin),
	 .scan_out(ff_rd_counter_scanout),
	 .dout	(rdcount[4:0]),
	 .din	(rdcount_in[4:0]),
	 .l1clk	  (l2clk),
  .siclk(siclk),
  .soclk(soclk)
        );

//spare_ctl_macro spares (num=4) (
//	.scan_in(spares_scanin),
//	.scan_out(spares_scanout),
//	.l1clk (l2clk)
//);



//assign hdr_sram_rvalue[10:0]  = instr[10:0];
//assign hdr_sram_rid[10:0]     = instr[21:11];
//assign hdr_sram_red_clr       = efu_hdr_clr_r1;
//assign hdr_sram_wr_en         = |(count[1:0]);
assign hdr_sram_rvalue[10:0]    = sync_instr[10:0];
assign hdr_sram_rid[10:0]	= {sync_instr[21],1'b0,sync_instr[20:12]};
assign hdr_sram_red_clr		= sync_clr;
assign hdr_sram_wr_en		= sync_wr;


//assign dispatch_read_data = (count[4:0]>5'd7);
assign dispatch_read_data = (rdcount[4:0] < 5'd23 & rdcount[4:0] != 5'd0);

assign hdr_efu_read_data  = instr[21];
assign hdr_efu_xfer_en    = dispatch_read_data;

// fixscan start:
assign ff_input_all_enable_scanin     = scan_in;
assign ff_receiver_instr_slice_scanin = ff_input_all_enable_scanout;
assign ff_counter_slice_scanin	      = ff_receiver_instr_slice_scanout;
assign ff_sync_sram_data_scanin       = ff_counter_slice_scanout;
assign ff_sync_read_data_scanin       = ff_sync_sram_data_scanout;
assign ff_sync_sram_clr_scanin        = ff_sync_read_data_scanout;
assign ff_sync_sram_wr_scanin         = ff_sync_sram_clr_scanout;
assign ff_rd_counter_scanin           = ff_sync_sram_wr_scanout;
assign scan_out			      = ff_rd_counter_scanout;

//assign spares_scanin                  = ff_rd_counter_scanout ;
//assign scan_out			      = spares_scanout ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module tds_n2_efuhdr2_msff_ctl_macro__library_a1__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [3:1] sout;

  input [3:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0];









    







cl_a1_msff_4x d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0]),
.si(sout[1]),
.so(scan_out),
.q(dout[0])
);
cl_a1_msff_4x d0_1 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1]),
.si(sout[2]),
.so(sout[1]),
.q(dout[1])
);
cl_a1_msff_4x d0_2 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2]),
.si(sout[3]),
.so(sout[2]),
.q(dout[2])
);
cl_a1_msff_4x d0_3 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3]),
.si(scan_in),
.so(sout[3]),
.q(dout[3])
);




endmodule













// any PARAMS parms go into naming of macro

module tds_n2_efuhdr2_msff_ctl_macro__en_1__library_a1__width_22 (
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

  input [21:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [21:0] dout;
  output scan_out;
assign fdin[21:0] = (din[21:0] & {22{en}}) | (dout[21:0] & ~{22{en}});









    







cl_a1_msff_4x d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0]),
.si(sout[1]),
.so(scan_out),
.q(dout[0])
);
cl_a1_msff_4x d0_1 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1]),
.si(sout[2]),
.so(sout[1]),
.q(dout[1])
);
cl_a1_msff_4x d0_2 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2]),
.si(sout[3]),
.so(sout[2]),
.q(dout[2])
);
cl_a1_msff_4x d0_3 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3]),
.si(sout[4]),
.so(sout[3]),
.q(dout[3])
);
cl_a1_msff_4x d0_4 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4]),
.si(sout[5]),
.so(sout[4]),
.q(dout[4])
);
cl_a1_msff_4x d0_5 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5]),
.si(sout[6]),
.so(sout[5]),
.q(dout[5])
);
cl_a1_msff_4x d0_6 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6]),
.si(sout[7]),
.so(sout[6]),
.q(dout[6])
);
cl_a1_msff_4x d0_7 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7]),
.si(sout[8]),
.so(sout[7]),
.q(dout[7])
);
cl_a1_msff_4x d0_8 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[8]),
.si(sout[9]),
.so(sout[8]),
.q(dout[8])
);
cl_a1_msff_4x d0_9 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[9]),
.si(sout[10]),
.so(sout[9]),
.q(dout[9])
);
cl_a1_msff_4x d0_10 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[10]),
.si(sout[11]),
.so(sout[10]),
.q(dout[10])
);
cl_a1_msff_4x d0_11 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[11]),
.si(sout[12]),
.so(sout[11]),
.q(dout[11])
);
cl_a1_msff_4x d0_12 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[12]),
.si(sout[13]),
.so(sout[12]),
.q(dout[12])
);
cl_a1_msff_4x d0_13 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[13]),
.si(sout[14]),
.so(sout[13]),
.q(dout[13])
);
cl_a1_msff_4x d0_14 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[14]),
.si(sout[15]),
.so(sout[14]),
.q(dout[14])
);
cl_a1_msff_4x d0_15 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[15]),
.si(sout[16]),
.so(sout[15]),
.q(dout[15])
);
cl_a1_msff_4x d0_16 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[16]),
.si(sout[17]),
.so(sout[16]),
.q(dout[16])
);
cl_a1_msff_4x d0_17 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[17]),
.si(sout[18]),
.so(sout[17]),
.q(dout[17])
);
cl_a1_msff_4x d0_18 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[18]),
.si(sout[19]),
.so(sout[18]),
.q(dout[18])
);
cl_a1_msff_4x d0_19 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[19]),
.si(sout[20]),
.so(sout[19]),
.q(dout[19])
);
cl_a1_msff_4x d0_20 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[20]),
.si(sout[21]),
.so(sout[20]),
.q(dout[20])
);
cl_a1_msff_4x d0_21 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[21]),
.si(scan_in),
.so(sout[21]),
.q(dout[21])
);




endmodule













// any PARAMS parms go into naming of macro

module tds_n2_efuhdr2_msff_ctl_macro__library_a1__width_1 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0];









    







cl_a1_msff_4x d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0]),
.si(scan_in),
.so(scan_out),
.q(dout[0])
);




endmodule













// any PARAMS parms go into naming of macro

module tds_n2_efuhdr2_msff_ctl_macro__library_a1__width_5 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [4:1] sout;

  input [4:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = din[4:0];









    







cl_a1_msff_4x d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0]),
.si(sout[1]),
.so(scan_out),
.q(dout[0])
);
cl_a1_msff_4x d0_1 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1]),
.si(sout[2]),
.so(sout[1]),
.q(dout[1])
);
cl_a1_msff_4x d0_2 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2]),
.si(sout[3]),
.so(sout[2]),
.q(dout[2])
);
cl_a1_msff_4x d0_3 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3]),
.si(sout[4]),
.so(sout[3]),
.q(dout[3])
);
cl_a1_msff_4x d0_4 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4]),
.si(scan_in),
.so(sout[4]),
.q(dout[4])
);




endmodule








