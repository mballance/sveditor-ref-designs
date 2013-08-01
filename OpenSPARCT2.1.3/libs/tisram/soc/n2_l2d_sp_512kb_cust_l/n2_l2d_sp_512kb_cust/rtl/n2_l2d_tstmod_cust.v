// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_l2d_tstmod_cust.v
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
module n2_l2d_tstmod_cust (
  rd_wr_c3, 
  wayerr_c3, 
  wr_inhibit, 
  coloff_c3, 
  l2clk, 
  scanen, 
  si, 
  siclk, 
  soclk, 
  so, 
  delout20_rgt, 
  delout31_lft, 
  delout31_rgt, 
  delout20_lft) ;
wire not_wayerr_c3;
wire coloff_c3_1_3;
wire coloff_c3_2_0;
wire [1:0] msff_read_c4_scanin;
wire [1:0] msff_read_c4_scanout;
wire msff_buf_out_top_scanin;
wire msff_buf_out_top_scanout;
wire msff_buf_out_bot_scanin;
wire msff_buf_out_bot_scanout;
wire [2:0] msff_buf_out_corse_scanin;
wire [2:0] msff_buf_out_corse_scanout;
wire [2:0] msff_buf_out_fine_scanin;
wire [2:0] msff_buf_out_fine_scanout;
wire wr_inhibit_n;
wire [2:0] ff_buf_out_corse_n;
wire [2:0] ff_buf_out_fine_n;

//-----------------------------------------------------------
//  I/O declarations
//-----------------------------------------------------------
input		rd_wr_c3;	// 
input		wayerr_c3;	// added 9/21/2005
input		wr_inhibit;	// 
//  coloff_c3<3:0>,           
input	[3:0]	coloff_c3;	// 
input		l2clk;		// 
input		scanen;		// 
input		si;		// 
input		siclk;		// 
input		soclk;		// 

output 		so;		// 
output		delout20_rgt;	// 
output 		delout31_lft;	// 
output 		delout31_rgt;	// 
output  	delout20_lft;	// 


//-----------------------------------------------------------------------------
//  Wire/reg declarations
//-----------------------------------------------------------------------------

// connecting between n2_l2d_tstmod_logic  &  n2_l2d_tstmod_delay_cust
wire		l1clk;
wire		tst_bnken31_setb;
wire		tst_bnken02_setb;
wire		tst_bnken31_rstb;
wire		tst_bnken02_rstb;
wire		tst_bnken31_rstb_n;
wire		tst_bnken02_rstb_n;
//wire		so_internal;
wire		tstmod_rst_l;
wire	[5:0]	corse_sel;
wire	[7:0]	fine_sel;


wire	[1:0]	tst_read_c3a;
//wire	[1:0]	tst_read_c3b;
//wire	[3:0]	tst_read_c4;
//wire	[3:0]	tst_so;
wire	[1:0]	tst_so;
wire	[2:0]	tst_so_corse;
wire	[2:0]	tst_so_fine;
wire		tst_so_en0;

wire		ff_buf_out_top;
wire	[2:0]	ff_buf_out_corse;
wire	[2:0]	ff_buf_out_fine;
wire		ff_buf_out_bot;


// start n2_l2d_tstmod_logic


n2_l2d_tstmod_cust_l1clkhdr_ctl_macro l1_clk_hdr (
        .l2clk  (l2clk),
        .se     (scanen),
        .l1en   (1'b1),
        .pce_ov (1'b1),
        .stop   (1'b0),
        .l1clk  (l1clk)
        );



//assign tst_read_c3a[1] = (~wayerr_c3  &  rd_wr_c3  &  (coloff_c3[3] | coloff_c3[1]));
//assign tst_read_c3a[0] = (~wayerr_c3  &  rd_wr_c3  &  (coloff_c3[2] | coloff_c3[0]));


n2_l2d_tstmod_cust_inv_macro__width_1 inv_wayerr_c3 
	(
	.dout	(not_wayerr_c3),
	.din	(wayerr_c3)
	);

n2_l2d_tstmod_cust_or_macro__width_1 or_coloff_c3_1_3 
	(
	.din0	(coloff_c3[1]),
	.din1	(coloff_c3[3]),
	.dout	(coloff_c3_1_3)
	);


n2_l2d_tstmod_cust_or_macro__width_1 or_coloff_c3_2_3 
        (
        .din0   (coloff_c3[2]),
        .din1   (coloff_c3[0]),
        .dout   (coloff_c3_2_0)
        );

n2_l2d_tstmod_cust_and_macro__ports_3__width_1 and_tst_read_c3a_1 
	(
	.dout	(tst_read_c3a[1]),
	.din0	(not_wayerr_c3),
	.din1	(coloff_c3_1_3),
	.din2	(rd_wr_c3)
	);

n2_l2d_tstmod_cust_and_macro__ports_3__width_1 and_tst_read_c3a_0 
        (
        .dout   (tst_read_c3a[0]),
        .din0   (not_wayerr_c3),
        .din1   (coloff_c3_2_0),
        .din2   (rd_wr_c3)
        );

n2_l2d_tstmod_cust_tisram_blb_macro__dmsff_4x__width_1 blb_read_c3_1  
        (
        .l1clk  (l1clk),
        .d_a    (tst_read_c3a[1]),
        .q_b	(tst_bnken31_setb)
        );
n2_l2d_tstmod_cust_tisram_blb_macro__dmsff_4x__width_1 blb_read_c3_0  
        (
        .l1clk  (l1clk),
        .d_a    (tst_read_c3a[0]),
        .q_b	(tst_bnken02_setb)
        );

//initialize
//assign tst_read_c4[3:0] = 4'b0;

n2_l2d_tstmod_cust_msff_ctl_macro__fs_1__width_2  msff_read_c4  
        ( 
        .scan_in    (msff_read_c4_scanin[1:0]),
	.scan_out   (msff_read_c4_scanout[1:0]), 
        .din   ( tst_read_c3a[1:0]  &  {~tst_bnken31_rstb_n,~tst_bnken02_rstb_n} ),
        .l1clk ( l1clk ),
        .dout   ( {tst_bnken31_rstb_n,tst_bnken02_rstb_n} ),
  .siclk(siclk),
  .soclk(soclk)
); 


//assign tst_bnken31_rstb = ~tst_bnken31_rstb_n;
//assign tst_bnken02_rstb = ~tst_bnken02_rstb_n;

n2_l2d_tstmod_cust_inv_macro__width_1 inv_tst_bnken31_rstb 
	(
	.dout	(tst_bnken31_rstb),
	.din	(tst_bnken31_rstb_n)
	);

n2_l2d_tstmod_cust_inv_macro__width_1 inv_tst_bnken02_rstb 
        (
        .dout   (tst_bnken02_rstb),
        .din    (tst_bnken02_rstb_n)
        );

n2_l2d_tstmod_cust_msff_ctl_macro__fs_1__width_1  msff_buf_out_top  
        ( 
        .scan_in    (msff_buf_out_top_scanin),
	.scan_out   (msff_buf_out_top_scanout), 
        .din     ( ff_buf_out_top ), 
        .l1clk   ( l1clk ), 
        .dout    ( ff_buf_out_top ),
  .siclk(siclk),
  .soclk(soclk) 
); 

n2_l2d_tstmod_cust_msff_ctl_macro__fs_1__width_1  msff_buf_out_bot  
        ( 
        .scan_in    (msff_buf_out_bot_scanin),
	.scan_out   (msff_buf_out_bot_scanout),  
        .din    ( ff_buf_out_bot ),
        .l1clk  ( l1clk ),
        .dout   ( ff_buf_out_bot ),
  .siclk(siclk),
  .soclk(soclk)
); 


n2_l2d_tstmod_cust_msff_ctl_macro__fs_1__width_3  msff_buf_out_corse  
        ( 
        .scan_in    (msff_buf_out_corse_scanin[2:0]),
	.scan_out   (msff_buf_out_corse_scanout[2:0]),  
        .din   ( ff_buf_out_corse[2:0] ),
        .l1clk ( l1clk ),
        .dout  ( ff_buf_out_corse[2:0] ),
  .siclk(siclk),
  .soclk(soclk)
); 

n2_l2d_tstmod_cust_msff_ctl_macro__fs_1__width_3  msff_buf_out_fine  
        ( 
        .scan_in    (msff_buf_out_fine_scanin[2:0]),
	.scan_out   (msff_buf_out_fine_scanout[2:0]),  
        .din   ( ff_buf_out_fine[2:0] ),
        .l1clk ( l1clk ),
        .dout  ( ff_buf_out_fine[2:0] ),
  .siclk(siclk),
  .soclk(soclk)
); 

//assign tstmod_rst_l = ff_buf_out_top  &  ff_buf_out_bot  &  ~wr_inhibit;


n2_l2d_tstmod_cust_inv_macro__width_1 inv_wr_inhibit 
	(
	.dout	(wr_inhibit_n),
	.din	(wr_inhibit)
	);

n2_l2d_tstmod_cust_and_macro__ports_3__width_1 and_tstmod_rst_l 
	(
	.dout	(tstmod_rst_l),
	.din0	(ff_buf_out_top),
	.din1	(ff_buf_out_bot),
	.din2	(wr_inhibit_n)
	);


n2_l2d_tstmod_cust_inv_macro__width_3 inv_ff_buf_out_corse_012 
	(
	.dout	(ff_buf_out_corse_n[2:0]),
	.din	(ff_buf_out_corse[2:0])
	);





//decoding: 3-to-8. 2/3, 1/0 swapped
//assign corse_sel[5] = ff_buf_out_corse[2]  &  ~ff_buf_out_corse[1]  &  ~ff_buf_out_corse[0];

n2_l2d_tstmod_cust_and_macro__ports_3__width_1 and_corse_sel_5 
        (
        .dout   (corse_sel[5]),
        .din0   (ff_buf_out_corse[2]),
        .din1   (ff_buf_out_corse_n[1]),
        .din2   (ff_buf_out_corse_n[0])
        );

//assign corse_sel[4] = ff_buf_out_corse[2]  &  ~ff_buf_out_corse[1]  &  ff_buf_out_corse[0];

n2_l2d_tstmod_cust_and_macro__ports_3__width_1 and_corse_sel_4 
        (
        .dout   (corse_sel[4]),
        .din0   (ff_buf_out_corse[2]),
        .din1   (ff_buf_out_corse_n[1]),
        .din2   (ff_buf_out_corse[0])
        );

//assign corse_sel[3] = ~ff_buf_out_corse[2]  &  ff_buf_out_corse[1]  &  ~ff_buf_out_corse[0];

n2_l2d_tstmod_cust_and_macro__ports_3__width_1 and_corse_sel_3 
        (
        .dout   (corse_sel[3]),
        .din0   (ff_buf_out_corse_n[2]),
        .din1   (ff_buf_out_corse[1]),
        .din2   (ff_buf_out_corse_n[0])
        );

//assign corse_sel[2] = ~ff_buf_out_corse[2]  &  ff_buf_out_corse[1]  &  ff_buf_out_corse[0];

n2_l2d_tstmod_cust_and_macro__ports_3__width_1 and_corse_sel_2 
        (
        .dout   (corse_sel[2]),
        .din0   (ff_buf_out_corse_n[2]),
        .din1   (ff_buf_out_corse[1]),
        .din2   (ff_buf_out_corse[0])
        );

//assign corse_sel[1] = ~ff_buf_out_corse[2]  &  ~ff_buf_out_corse[1]  &  ~ff_buf_out_corse[0];

n2_l2d_tstmod_cust_and_macro__ports_3__width_1 and_corse_sel_1 
        (
        .dout   (corse_sel[1]),
        .din0   (ff_buf_out_corse_n[2]),
        .din1   (ff_buf_out_corse_n[1]),
        .din2   (ff_buf_out_corse_n[0])
        );

//assign corse_sel[0] = ~ff_buf_out_corse[2]  &  ~ff_buf_out_corse[1]  &  ff_buf_out_corse[0];

n2_l2d_tstmod_cust_and_macro__ports_3__width_1 and_corse_sel_0 
        (
        .dout   (corse_sel[0]),
        .din0   (ff_buf_out_corse_n[2]),
        .din1   (ff_buf_out_corse_n[1]),
        .din2   (ff_buf_out_corse[0])
        );

n2_l2d_tstmod_cust_inv_macro__width_3 inv_ff_buf_out_fine_n 
	(
	.dout	(ff_buf_out_fine_n[2:0]),
	.din	(ff_buf_out_fine[2:0])
	);


//assign fine_sel[7] = ff_buf_out_fine[2]  &  ff_buf_out_fine[1]  &  ~ff_buf_out_fine[0];

n2_l2d_tstmod_cust_and_macro__ports_3__width_1 and_fine_sel_7 
        (
        .dout   (fine_sel[7]),
        .din0   (ff_buf_out_fine[2]),
        .din1   (ff_buf_out_fine[1]),
        .din2   (ff_buf_out_fine_n[0])
        );

//assign fine_sel[6] = ff_buf_out_fine[2]  &  ff_buf_out_fine[1]  &  ff_buf_out_fine[0];


n2_l2d_tstmod_cust_and_macro__ports_3__width_1 and_fine_sel_6 
        (
        .dout   (fine_sel[6]),
        .din0   (ff_buf_out_fine[2]),
        .din1   (ff_buf_out_fine[1]),
        .din2   (ff_buf_out_fine[0])
        );

//assign fine_sel[5] = ff_buf_out_fine[2]  &  ~ff_buf_out_fine[1]  &  ~ff_buf_out_fine[0];


n2_l2d_tstmod_cust_and_macro__ports_3__width_1 and_fine_sel_5 
        (
        .dout   (fine_sel[5]),
        .din0   (ff_buf_out_fine[2]),
        .din1   (ff_buf_out_fine_n[1]),
        .din2   (ff_buf_out_fine_n[0])
        );

//assign fine_sel[4] = ff_buf_out_fine[2]  &  ~ff_buf_out_fine[1]  &  ff_buf_out_fine[0];


n2_l2d_tstmod_cust_and_macro__ports_3__width_1 and_fine_sel_4 
        (
        .dout   (fine_sel[4]),
        .din0   (ff_buf_out_fine[2]),
        .din1   (ff_buf_out_fine_n[1]),
        .din2   (ff_buf_out_fine[0])
        );

//assign fine_sel[3] = ~ff_buf_out_fine[2]  &  ff_buf_out_fine[1]  &  ~ff_buf_out_fine[0];


n2_l2d_tstmod_cust_and_macro__ports_3__width_1 and_fine_sel_3 
        (
        .dout   (fine_sel[3]),
        .din0   (ff_buf_out_fine_n[2]),
        .din1   (ff_buf_out_fine[1]),
        .din2   (ff_buf_out_fine_n[0])
        );

//assign fine_sel[2] = ~ff_buf_out_fine[2]  &  ff_buf_out_fine[1]  &  ff_buf_out_fine[0];


n2_l2d_tstmod_cust_and_macro__ports_3__width_1 and_fine_sel_2 
        (
        .dout   (fine_sel[2]),
        .din0   (ff_buf_out_fine_n[2]),
        .din1   (ff_buf_out_fine[1]),
        .din2   (ff_buf_out_fine[0])
        );

//assign fine_sel[1] = ~ff_buf_out_fine[2]  &  ~ff_buf_out_fine[1]  &  ~ff_buf_out_fine[0];


n2_l2d_tstmod_cust_and_macro__ports_3__width_1 and_fine_sel_1 
        (
        .dout   (fine_sel[1]),
        .din0   (ff_buf_out_fine_n[2]),
        .din1   (ff_buf_out_fine_n[1]),
        .din2   (ff_buf_out_fine_n[0])
        );

//assign fine_sel[0] = ~ff_buf_out_fine[2]  &  ~ff_buf_out_fine[1]  &  ff_buf_out_fine[0];


n2_l2d_tstmod_cust_and_macro__ports_3__width_1 and_fine_sel_0 
        (
        .dout   (fine_sel[0]),
        .din0   (ff_buf_out_fine_n[2]),
        .din1   (ff_buf_out_fine_n[1]),
        .din2   (ff_buf_out_fine[0])
        );


//end of n2_l2d_tstmod_logic

n2_l2d_tstmod_delay_cust  tstmod_delay	// NOT ATPGABLE
       (
       .l1clk           (l1clk),
       .tstmod_rst_l    (tstmod_rst_l),
       .tst_bnken31_setb(tst_bnken31_setb),
       .tst_bnken02_setb(tst_bnken02_setb),
       .tst_bnken31_rstb(tst_bnken31_rstb),
       .tst_bnken02_rstb(tst_bnken02_rstb),
       .corse_sel       (corse_sel[5:0]),
       .fine_sel        (fine_sel[7:0]),
       .delout31_lft    (delout31_lft),
       .delout31_rgt    (delout31_rgt),
       .delout20_lft    (delout20_lft),
       .delout20_rgt    (delout20_rgt)
       );
       
       
       
// scanorder start
//msff_read_c4_scanin[1:0]
//msff_buf_out_top_scanin
//msff_buf_out_corse_scanin[0]
//msff_buf_out_corse_scanin[1]
//msff_buf_out_corse_scanin[2]
//msff_buf_out_fine_scanin[0]
//msff_buf_out_fine_scanin[1]
//msff_buf_out_fine_scanin[2]
//msff_buf_out_bot_scanin
// scanorder end281     // fixscan start
assign msff_read_c4_scanin[1]=si;
assign msff_read_c4_scanin[0]=msff_read_c4_scanout[1];
assign msff_buf_out_top_scanin=msff_read_c4_scanout[0];
assign msff_buf_out_corse_scanin[0]=msff_buf_out_top_scanout;
assign msff_buf_out_corse_scanin[1]=msff_buf_out_corse_scanout[0];
assign msff_buf_out_corse_scanin[2]=msff_buf_out_corse_scanout[1];
assign msff_buf_out_fine_scanin[0]=msff_buf_out_corse_scanout[2];
assign msff_buf_out_fine_scanin[1]=msff_buf_out_fine_scanout[0];
assign msff_buf_out_fine_scanin[2]=msff_buf_out_fine_scanout[1];
assign msff_buf_out_bot_scanin=msff_buf_out_fine_scanout[2];
assign so=msff_buf_out_bot_scanout;
// fixscan end
endmodule // main program

//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
// THE FOLLOWING MODULE IS BLACKBOX TO ATPG
//////////////////////////////////////////////

module n2_l2d_tstmod_delay_cust (
  l1clk, 
  tstmod_rst_l, 
  tst_bnken31_setb, 
  tst_bnken02_setb, 
  tst_bnken31_rstb, 
  tst_bnken02_rstb, 
  corse_sel, 
  fine_sel, 
  delout31_lft, 
  delout31_rgt, 
  delout20_lft, 
  delout20_rgt) ;

input   l1clk;   
input   tstmod_rst_l;   
input   tst_bnken31_setb;   
input   tst_bnken02_setb;   
input   tst_bnken31_rstb;   
input   tst_bnken02_rstb;   
input   [5:0] corse_sel;   
input   [7:0] fine_sel;   

output   delout31_lft;   
output   delout31_rgt;   
output   delout20_lft;   
output   delout20_rgt;   

wire    [5:0]   corse_sel_muxout;
wire    [7:1]   fine_sel_muxout;

wire 		delayline_en_31;
wire 		delayline_en_02;
wire 		fine_dout_31;
wire 		fine_dout_02;

assign corse_sel_muxout[5:0] = ( {1'b0,corse_sel_muxout[5:1]}  &  {~({5{tstmod_rst_l}} & corse_sel[5:1]),(tstmod_rst_l & ~corse_sel[0])}) | 
                               ({6{l1clk}}  &  {{{5{tstmod_rst_l}} & corse_sel[5:1]},(~(tstmod_rst_l & ~corse_sel[0])) & tstmod_rst_l});

//  
//assign fine_sel_muxout[7:1] = ( ({corse_sel_muxout[0],fine_sel_muxout[7:2]})  &  (~fine_sel[7:1]) )
// | ({&{corse_sel_muxout[0]}}  &  fine_sel[7:1]);


assign fine_sel_muxout[7:1] = ( ({corse_sel_muxout[0],fine_sel_muxout[7:2]})  &  (~fine_sel[7:1]) ) |
({7{corse_sel_muxout[0]}}  &  fine_sel[7:1]);


srlatch1	latch1_31
	(
	.setl (~(l1clk & tstmod_rst_l  &  tst_bnken31_setb)),
	.rstl1 (tstmod_rst_l),
	.rstl2 (l1clk|~tst_bnken31_rstb),
	.out (delayline_en_31)
	);

srlatch1	latch1_02
	(
	.setl (~(l1clk & tstmod_rst_l  &  tst_bnken02_setb)),
	.rstl1 (tstmod_rst_l),
	.rstl2 (l1clk|~tst_bnken02_rstb),
	.out (delayline_en_02)
	);

srlatch2	latch2_31
	(
	.setl1 (~(fine_sel_muxout[1] & delayline_en_31 & ~fine_sel[0])),
	.setl2 (~(corse_sel_muxout[0] & delayline_en_31 & fine_sel[0])),
	.rstl (delayline_en_31),
	.out (fine_dout_31)
	);

srlatch2	latch2_02
	(
	.setl1 (~(fine_sel_muxout[1] & delayline_en_02 & ~fine_sel[0])),
	.setl2 (~(corse_sel_muxout[0] & delayline_en_02 & fine_sel[0])),
	.rstl (delayline_en_02),
	.out (fine_dout_02)
	);

assign delout31_lft = ~fine_dout_31;
assign delout31_rgt = ~fine_dout_31;
assign delout20_lft = ~fine_dout_02;
assign delout20_rgt = ~fine_dout_02;
endmodule  //n2_l2d_tstmod_delay_cust


module srlatch1 (
  setl, 
  rstl1, 
  rstl2, 
  out) ;

  input setl;
  input rstl1;
  input rstl2;
  output out;

reg out;

        always @(setl or rstl1 or rstl2) 
        begin
           if(~setl)  out   =  1'b1;
           else if( ~(rstl1 & rstl2) )  out   =  1'b0;
        end
endmodule // srlatch1


module srlatch2 (
  setl1, 
  setl2, 
  rstl, 
  out) ;

  input setl1;
  input setl2;
  input rstl;
  output out;

reg out;

        always @(setl1 or setl2 or rstl) begin
          if( (setl1==0) || (setl2==0))  out   =  1'b1;
          else if(~rstl)  out   =  1'b0;
        end
endmodule // srlatch2






// any PARAMS parms go into naming of macro

module n2_l2d_tstmod_cust_l1clkhdr_ctl_macro (
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









//
//   invert macro
//
//





module n2_l2d_tstmod_cust_inv_macro__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module n2_l2d_tstmod_cust_or_macro__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






or2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module n2_l2d_tstmod_cust_and_macro__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






and3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);









endmodule





//
//   macro for cl_mc1_tisram_blb_{8,4}x flops
//
//





module n2_l2d_tstmod_cust_tisram_blb_macro__dmsff_4x__width_1 (
  d_a, 
  l1clk, 
  q_b);
input [0:0] d_a;
input l1clk;
output [0:0] q_b;






tisram_blb #(1)  d0_0 (
.d(d_a[0:0]),
.l1clk(l1clk),
.latout_l(q_b[0:0])
);










//place::generic_place($width,$stack,$left);

endmodule









// any PARAMS parms go into naming of macro

module n2_l2d_tstmod_cust_msff_ctl_macro__fs_1__width_2 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;

  input [1:0] din;
  input l1clk;
  input [1:0] scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output [1:0] scan_out;
assign fdin[1:0] = din[1:0];






dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1:0]),
.si(scan_in[1:0]),
.so(scan_out[1:0]),
.q(dout[1:0])
);












endmodule













// any PARAMS parms go into naming of macro

module n2_l2d_tstmod_cust_msff_ctl_macro__fs_1__width_1 (
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
  input [0:0] scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output [0:0] scan_out;
assign fdin[0:0] = din[0:0];






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in[0:0]),
.so(scan_out[0:0]),
.q(dout[0:0])
);












endmodule













// any PARAMS parms go into naming of macro

module n2_l2d_tstmod_cust_msff_ctl_macro__fs_1__width_3 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;

  input [2:0] din;
  input l1clk;
  input [2:0] scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output [2:0] scan_out;
assign fdin[2:0] = din[2:0];






dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2:0]),
.si(scan_in[2:0]),
.so(scan_out[2:0]),
.q(dout[2:0])
);












endmodule









//
//   invert macro
//
//





module n2_l2d_tstmod_cust_inv_macro__width_3 (
  din, 
  dout);
  input [2:0] din;
  output [2:0] dout;






inv #(3)  d0_0 (
.in(din[2:0]),
.out(dout[2:0])
);









endmodule




