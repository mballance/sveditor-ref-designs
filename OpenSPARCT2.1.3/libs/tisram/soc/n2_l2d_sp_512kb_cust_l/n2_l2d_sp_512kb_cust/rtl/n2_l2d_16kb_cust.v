// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_l2d_16kb_cust.v
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
module n2_l2d_16kb_cust (
  waysel_c4, 
  waysel_err_c3, 
  set_c3b, 
  coloff_c3b_l, 
  coloff_c4_l, 
  coloff_c5, 
  wen_c3b, 
  readen_c5, 
  worden_c3b, 
  l1clk, 
  wrd_lo0_b_l, 
  wrd_lo1_b_l, 
  wrd_hi0_b_l, 
  wrd_hi1_b_l, 
  red_adr, 
  cred, 
  tstmodclk_l, 
  wee_l, 
  vnw_ary, 
  saout_lo0_bc_l, 
  saout_lo1_bc_l, 
  saout_hi0_bc_l, 
  saout_hi1_bc_l);
wire coloff_c3b_l_unused;
wire bank_select;
wire coloff_c4;
wire [7:0] set_c4;
wire [1:0] spare_word_enable;
wire select_red_odd;
wire select_red_even;

	
		
input [7:0] 	waysel_c4;		
input		waysel_err_c3;		// 	Active when multiple way sel is on
input [8:0]   	set_c3b;		//	After b-latch
input    	coloff_c3b_l;		//	After b-latch+inv
input    	coloff_c4_l;		//	stage+inv
input [1:0]   	coloff_c5;		//	2-stage
input         	wen_c3b;	 	//	Write-enable, after b-latch
input         	readen_c5;	 	//	
input [3:0]   	worden_c3b;		//	After b-latch
input         	l1clk;	 		//	After l1clk hdr
input [19:0]  	wrd_lo0_b_l;		//	
input [18:0]  	wrd_lo1_b_l;		//	
input [19:0]  	wrd_hi0_b_l;		//	
input [18:0]  	wrd_hi1_b_l;		//	
input [9:0]	red_adr;		// Redudancy address
input [77:0]	cred;			// Redudancy address
input		tstmodclk_l;		//NEW
input		wee_l;			//NEW
input           vnw_ary;                //NEW

//output		bnken_lat;	//	Address latch enable (1.5cycle)
output [19:0]  	saout_lo0_bc_l;		//	C5bc output from senseamp
output [18:0]  	saout_lo1_bc_l;		//	C5bc output from senseamp
output [19:0]  	saout_hi0_bc_l;		//	C5bc output from senseamp
output [18:0]  	saout_hi1_bc_l;		//	C5bc output from senseamp

//reg		rd_data_out_sel_c5b;
//reg select_read_data_c5b;
reg select_read_data_c5b_hi_rgt;
reg select_read_data_c5b_hi_lft;
reg select_read_data_c5b_lo_rgt;
reg select_read_data_c5b_lo_lft;
reg select_read_data_all_c5b;
reg select_read_red_all_c5b;

//reg select_read_red_c5b;
reg select_read_red_c5b_hi_rgt;
reg select_read_red_c5b_hi_lft;
reg select_read_red_c5b_lo_rgt;
reg select_read_red_c5b_lo_lft;

//reg    	bnken_lat;

reg [19:0]    saout_lo0_bc_l;         //      C5bc output from senseamp
reg [18:0]    saout_lo1_bc_l;         //      C5bc output from senseamp
reg [19:0]    saout_hi0_bc_l;         //      C5bc output from senseamp
reg [18:0]    saout_hi1_bc_l;         //      C5bc output from senseamp

reg [79:0]    read_data;
wire [79:0]    rd_data;
wire [79:0]    wr_data;
reg	rd_spare_0,rd_spare_1;
wire    wr_spare_0,wr_spare_1;

wire [19:0] saout_hi0_b_out_l, saout_lo0_b_out_l;
wire [18:0] saout_hi1_b_out_l, saout_lo1_b_out_l;
wire [19:0]     red_lo0_b_out_l;
wire [18:0]     red_lo1_b_out_l;
wire [19:0]     red_hi0_b_out_l;
wire [18:0]     red_hi1_b_out_l;

wire [1:0] coloff_c5_rgt;
wire [1:0] coloff_c5_lft;
wire	   red_sel_rgt;
wire	   red_sel_lft;




reg  [19:0] mem_lo0_way0 [255:0];
reg  [18:0] mem_lo1_way0 [255:0];
reg  [19:0] mem_hi0_way0 [255:0];
reg  [18:0] mem_hi1_way0 [255:0];
reg  [255:0] mem_way0_spare_0;
reg  [255:0] mem_way0_spare_1;

reg  [19:0] mem_lo0_way1 [255:0];
reg  [18:0] mem_lo1_way1 [255:0];
reg  [19:0] mem_hi0_way1 [255:0];
reg  [18:0] mem_hi1_way1 [255:0];
reg  [255:0] mem_way1_spare_0;
reg  [255:0] mem_way1_spare_1;

reg  [19:0] mem_lo0_way2 [255:0];
reg  [18:0] mem_lo1_way2 [255:0];
reg  [19:0] mem_hi0_way2 [255:0];
reg  [18:0] mem_hi1_way2 [255:0];
reg  [255:0] mem_way2_spare_0;
reg  [255:0] mem_way2_spare_1;


reg  [19:0] mem_lo0_way3 [255:0];
reg  [18:0] mem_lo1_way3 [255:0];
reg  [19:0] mem_hi0_way3 [255:0];
reg  [18:0] mem_hi1_way3 [255:0];
reg  [255:0] mem_way3_spare_0;
reg  [255:0] mem_way3_spare_1;


reg  [19:0] mem_lo0_way4 [255:0];
reg  [18:0] mem_lo1_way4 [255:0];
reg  [19:0] mem_hi0_way4 [255:0];
reg  [18:0] mem_hi1_way4 [255:0];
reg  [255:0] mem_way4_spare_0;
reg  [255:0] mem_way4_spare_1;


reg  [19:0] mem_lo0_way5 [255:0];
reg  [18:0] mem_lo1_way5 [255:0];
reg  [19:0] mem_hi0_way5 [255:0];
reg  [18:0] mem_hi1_way5 [255:0];
reg  [255:0] mem_way5_spare_0;
reg  [255:0] mem_way5_spare_1;


reg  [19:0] mem_lo0_way6 [255:0];
reg  [18:0] mem_lo1_way6 [255:0];
reg  [19:0] mem_hi0_way6 [255:0];
reg  [18:0] mem_hi1_way6 [255:0];
reg  [255:0] mem_way6_spare_0;
reg  [255:0] mem_way6_spare_1;


reg  [19:0] mem_lo0_way7 [255:0];
reg  [18:0] mem_lo1_way7 [255:0];
reg  [19:0] mem_hi0_way7 [255:0];
reg  [18:0] mem_hi1_way7 [255:0];
reg  [255:0] mem_way7_spare_0;
reg  [255:0] mem_way7_spare_1;

//reg    	bnken_lat_c52;
reg [19:0]    saout_lo0_bc;         //      C5bc output from senseamp
reg [18:0]    saout_lo1_bc;         //      C5bc output from senseamp
reg [19:0]    saout_hi0_bc;         //      C5bc output from senseamp
reg [18:0]    saout_hi1_bc;         //      C5bc output from senseamp


//reg [19:0]    saout_lo0_bc_d;         //      C5bc output from senseamp
//reg [18:0]    saout_lo1_bc_d;         //      C5bc output from senseamp
//reg [19:0]    saout_hi0_bc_d;         //      C5bc output from senseamp
//reg [18:0]    saout_hi1_bc_d;         //      C5bc output from senseamp

//reg	set_banken_lat, reset_banken_lat;

reg [19:0]       saout_lo0_bc_c5b_l;
reg [18:0]       saout_lo1_bc_c5b_l;
reg [19:0]       saout_hi0_bc_c5b_l;
reg [18:0]       saout_hi1_bc_c5b_l;

reg [19:0]       saout_lo0_bc_d_l;
reg [18:0]       saout_lo1_bc_d_l;
reg [19:0]       saout_hi0_bc_d_l;
reg [18:0]       saout_hi1_bc_d_l;


assign coloff_c3b_l_unused = coloff_c3b_l;


//always@(posedge l1clk)
//begin
//        if(~coloff_c3b_l)
//                set_banken_lat <= 1'b1;
//        else    set_banken_lat <= 1'b0;
//end
//
//always@(negedge l1clk)
//begin
//        if(coloff_c4_l)
//                reset_banken_lat  <= 1'b1;
//        else    reset_banken_lat  <= 1'b0;
//end
//
//always@(set_banken_lat or reset_banken_lat)
//begin
//        if(set_banken_lat )
//                bnken_lat       <=      1'b1;
//        else if(reset_banken_lat )
//                bnken_lat       <=      1'b0;
//end


reg	[7:0] waysel_c5;
reg	[8:0]	index_c4;
reg	[8:0]	set_c5;
reg	wen_c4; 
reg	[3:0]	worden_c4;



reg	bank_select_c5;
reg     waysel_err_c3b, waysel_err_c4,waysel_err_c5;

always@(l1clk or coloff_c4_l)
begin
        if(~l1clk & coloff_c4_l)
	waysel_err_c3b	<=	waysel_err_c3;
end





always@(posedge l1clk)
begin
	waysel_err_c4	<=	waysel_err_c3b;
	waysel_err_c5	<=	waysel_err_c4;
	waysel_c5[7:0]	<=	waysel_c4[7:0];
	index_c4[8:0]	<=	set_c3b[8:0];
	set_c5[8:0]	<=	index_c4[8:0];
	worden_c4[3:0]	<=	worden_c3b[3:0];
	wen_c4		<=	wen_c3b;
	bank_select_c5  <= 	bank_select;
end


assign coloff_c4 = ~coloff_c4_l;
assign bank_select = index_c4[8];

//reg	[19:0]	saout_lo0_bc_c5b;
//reg	[18:0]	saout_lo1_bc_c5b;
//reg	[19:0]	saout_hi0_bc_c5b;
//reg	[18:0]	saout_hi1_bc_c5b;






assign set_c4[7:0] = index_c4[7:0];
wire	[19:0] wrd_lo0_a;
wire	[19:0] wrd_hi0_a;
wire	[18:0] wrd_lo1_a;
wire	[18:0] wrd_hi1_a;

reg	[19:0] wrd_lo0_a_reg;
reg	[19:0] wrd_hi0_a_reg;
reg	[18:0] wrd_lo1_a_reg;
reg	[18:0] wrd_hi1_a_reg;


always@(posedge l1clk)
begin
wrd_lo0_a_reg[19:0] <= ~wrd_lo0_b_l[19:0];
wrd_hi0_a_reg[19:0] <= ~wrd_hi0_b_l[19:0];
wrd_lo1_a_reg[18:0] <= ~wrd_lo1_b_l[18:0];
wrd_hi1_a_reg[18:0] <= ~wrd_hi1_b_l[18:0];
end



// COL redudancy

//reg [255:0] red_reg1;
//reg [255:0] red_reg2;

wire [79:0] cred_mod;


assign cred_mod[79:0] = {cred[77:59],1'b0,cred[58:19],1'b0,cred[18:0]};


//assign spare_word_enable[1] = cred_mod[19] ? worden_c4[3] : worden_c4[2]; 
//assign spare_word_enable[0] = cred_mod[59] ? worden_c4[3] : worden_c4[2];


assign wr_data[19:0] = 
{wr_spare_0,	  wrd_lo1_a_reg[4], wrd_hi0_a_reg[4],wrd_lo0_a_reg[4],
wrd_hi1_a_reg[3], wrd_lo1_a_reg[3], wrd_hi0_a_reg[3],wrd_lo0_a_reg[3],
wrd_hi1_a_reg[2], wrd_lo1_a_reg[2], wrd_hi0_a_reg[2],wrd_lo0_a_reg[2],
wrd_hi1_a_reg[1], wrd_lo1_a_reg[1], wrd_hi0_a_reg[1],wrd_lo0_a_reg[1],
wrd_hi1_a_reg[0], wrd_lo1_a_reg[0], wrd_hi0_a_reg[0],wrd_lo0_a_reg[0]};

assign wr_data[39:20] = {
		  wrd_lo1_a_reg[9], wrd_hi0_a_reg[9],wrd_lo0_a_reg[9],
wrd_hi1_a_reg[8], wrd_lo1_a_reg[8], wrd_hi0_a_reg[8],wrd_lo0_a_reg[8],
wrd_hi1_a_reg[7], wrd_lo1_a_reg[7], wrd_hi0_a_reg[7],wrd_lo0_a_reg[7],
wrd_hi1_a_reg[6], wrd_lo1_a_reg[6], wrd_hi0_a_reg[6],wrd_lo0_a_reg[6],
wrd_hi1_a_reg[5], wrd_lo1_a_reg[5], wrd_hi0_a_reg[5],wrd_lo0_a_reg[5], wrd_hi1_a_reg[4]};


assign wr_data[59:40] = {
wrd_lo1_a_reg[14], wrd_hi0_a_reg[14],wrd_lo0_a_reg[14],
wrd_hi1_a_reg[13], wrd_lo1_a_reg[13], wrd_hi0_a_reg[13],wrd_lo0_a_reg[13],
wrd_hi1_a_reg[12], wrd_lo1_a_reg[12], wrd_hi0_a_reg[12],wrd_lo0_a_reg[12],
wrd_hi1_a_reg[11], wrd_lo1_a_reg[11], wrd_hi0_a_reg[11],wrd_lo0_a_reg[11],
wrd_hi1_a_reg[10], wrd_lo1_a_reg[10], wrd_hi0_a_reg[10],wrd_lo0_a_reg[10], wrd_hi1_a_reg[9]};

assign wr_data[79:60] = {
wrd_hi0_a_reg[19], wrd_lo0_a_reg[19],
wrd_hi1_a_reg[18], wrd_lo1_a_reg[18], wrd_hi0_a_reg[18],wrd_lo0_a_reg[18],
wrd_hi1_a_reg[17], wrd_lo1_a_reg[17], wrd_hi0_a_reg[17],wrd_lo0_a_reg[17],
wrd_hi1_a_reg[16], wrd_lo1_a_reg[16], wrd_hi0_a_reg[16],wrd_lo0_a_reg[16],
wrd_hi1_a_reg[15], wrd_lo1_a_reg[15], wrd_hi0_a_reg[15],wrd_lo0_a_reg[15], wrd_hi1_a_reg[14],wr_spare_1};


integer i; 
reg	[80:0] data;

always@(cred_mod or wr_data)
begin
if (~cred_mod[0]) begin
 data[0] = wr_data[0];
end

for(i=0; i<18; i=i+1)
begin
  data[i+1] = cred_mod[i] ? wr_data[i] : wr_data[i+1];
end

data[19] = cred_mod[18] ? wr_data[18] : cred_mod[20] ? wr_data[20] : 1'b0;

for(i=21;i<40;i=i+1)
begin 
 data[i-1] = cred_mod[i] ? wr_data[i] : wr_data[i-1];
end


if (~cred_mod[39]) begin
 data[39] = wr_data[39];
end

if (~cred_mod[40]) begin
 data[40] = wr_data[40];
end

for(i=40;i<59;i=i+1)
begin
  data[i+1] = cred_mod[i] ? wr_data[i] : wr_data[i+1];
end

data[60] = cred_mod[59] ? wr_data[59] : cred_mod[61] ? wr_data[61] : 1'b0;

for(i=62;i<80;i=i+1)
begin
  data[i-1] = cred_mod[i] ? wr_data[i] : wr_data[i-1];
end

if (~cred_mod[79]) begin
 data[79] = wr_data[79];
end 
 
end

 
assign { wrd_hi0_a[19], wrd_lo0_a[19],
wrd_hi1_a[18], wrd_lo1_a[18], wrd_hi0_a[18],wrd_lo0_a[18],
wrd_hi1_a[17], wrd_lo1_a[17], wrd_hi0_a[17],wrd_lo0_a[17],
wrd_hi1_a[16], wrd_lo1_a[16], wrd_hi0_a[16],wrd_lo0_a[16],
wrd_hi1_a[15], wrd_lo1_a[15], wrd_hi0_a[15],wrd_lo0_a[15], 
wrd_hi1_a[14],wr_spare_1} = data[79:60];

assign {
wrd_lo1_a[14], wrd_hi0_a[14],wrd_lo0_a[14],
wrd_hi1_a[13], wrd_lo1_a[13], wrd_hi0_a[13],wrd_lo0_a[13],
wrd_hi1_a[12], wrd_lo1_a[12], wrd_hi0_a[12],wrd_lo0_a[12],
wrd_hi1_a[11], wrd_lo1_a[11], wrd_hi0_a[11],wrd_lo0_a[11],
wrd_hi1_a[10], wrd_lo1_a[10], wrd_hi0_a[10],wrd_lo0_a[10],wrd_hi1_a[9]} = data[59:40];

assign {
wrd_lo1_a[9], wrd_hi0_a[9],wrd_lo0_a[9],
wrd_hi1_a[8], wrd_lo1_a[8], wrd_hi0_a[8],wrd_lo0_a[8],
wrd_hi1_a[7], wrd_lo1_a[7], wrd_hi0_a[7],wrd_lo0_a[7],
wrd_hi1_a[6], wrd_lo1_a[6], wrd_hi0_a[6],wrd_lo0_a[6],
wrd_hi1_a[5], wrd_lo1_a[5], wrd_hi0_a[5],wrd_lo0_a[5], wrd_hi1_a[4]} = data[39:20];

assign {
wr_spare_0,   wrd_lo1_a[4], wrd_hi0_a[4],wrd_lo0_a[4],
wrd_hi1_a[3], wrd_lo1_a[3], wrd_hi0_a[3],wrd_lo0_a[3],
wrd_hi1_a[2], wrd_lo1_a[2], wrd_hi0_a[2],wrd_lo0_a[2],
wrd_hi1_a[1], wrd_lo1_a[1], wrd_hi0_a[1],wrd_lo0_a[1],
wrd_hi1_a[0], wrd_lo1_a[0], wrd_hi0_a[0],wrd_lo0_a[0]} = data[19:0];



wire [79:0] worden_data;
wire [19:0] worden_lo0;
wire [19:0] worden_hi0;
wire [18:0] worden_lo1;
wire [18:0] worden_hi1;


assign worden_data[19:0] = 
{spare_word_enable[0],  worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0]};

assign worden_data[39:20] = {
	      worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0], worden_c4[3]};


assign worden_data[59:40] = {
              worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0], worden_c4[3]};

assign worden_data[79:60] = {
                            worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0],
worden_c4[3], worden_c4[2], worden_c4[1],worden_c4[0], worden_c4[3],spare_word_enable[1]};

reg	[79:0] worden_shift;



always@(cred_mod or worden_data or wen_c4 or coloff_c4)
begin
if (wen_c4 & coloff_c4)
begin
if (~cred_mod[0]) begin
 worden_shift[0] = worden_data[0];
end

for(i=0; i<18; i=i+1)
begin
  worden_shift[i+1] = cred_mod[i] ? worden_data[i] : ~cred_mod[i+1] ? worden_data[i+1] : 1'b0;
end

worden_shift[19] = cred_mod[18] ? worden_data[18] : cred_mod[20] ? worden_data[20] : 1'b0;

for(i=21;i<40;i=i+1)
begin 
 worden_shift[i-1]  = cred_mod[i] ? worden_data[i] : ~cred_mod[i-1] ? worden_data[i-1] : 1'b0;
end


if (~cred_mod[39]) begin
 worden_shift[39] = worden_data[39];
end

if (~cred_mod[40]) begin
 worden_shift[40] = worden_data[40];
end

for(i=40;i<59;i=i+1)
begin
  worden_shift[i+1] = cred_mod[i] ? worden_data[i] : ~cred_mod[i+1] ? worden_data[i+1] : 1'b0;
end

worden_shift[60] = cred_mod[59] ? worden_data[59] : cred_mod[61] ? worden_data[61] : 1'b0;

for(i=62;i<80;i=i+1)
begin
  worden_shift[i-1]  = cred_mod[i] ? worden_data[i] : ~cred_mod[i-1] ? worden_data[i-1] : 1'b0;
end

if (~cred_mod[79]) begin
 worden_shift[79] = worden_data[79];
end 

end
else worden_shift[79:0] = 80'b0;

end
 
 
assign { worden_hi0[19], worden_lo0[19],
worden_hi1[18], worden_lo1[18], worden_hi0[18],worden_lo0[18],
worden_hi1[17], worden_lo1[17], worden_hi0[17],worden_lo0[17],
worden_hi1[16], worden_lo1[16], worden_hi0[16],worden_lo0[16],
worden_hi1[15], worden_lo1[15], worden_hi0[15],worden_lo0[15], 
worden_hi1[14],spare_word_enable[1]} = worden_shift[79:60];

assign {
worden_lo1[14], worden_hi0[14],worden_lo0[14],
worden_hi1[13], worden_lo1[13], worden_hi0[13],worden_lo0[13],
worden_hi1[12], worden_lo1[12], worden_hi0[12],worden_lo0[12],
worden_hi1[11], worden_lo1[11], worden_hi0[11],worden_lo0[11],
worden_hi1[10], worden_lo1[10], worden_hi0[10],worden_lo0[10],worden_hi1[9]} = worden_shift[59:40];

assign {
worden_lo1[9], worden_hi0[9],worden_lo0[9],
worden_hi1[8], worden_lo1[8], worden_hi0[8],worden_lo0[8],
worden_hi1[7], worden_lo1[7], worden_hi0[7],worden_lo0[7],
worden_hi1[6], worden_lo1[6], worden_hi0[6],worden_lo0[6],
worden_hi1[5], worden_lo1[5], worden_hi0[5],worden_lo0[5], worden_hi1[4]} = worden_shift[39:20];

assign {
spare_word_enable[0],   worden_lo1[4], worden_hi0[4],worden_lo0[4],
worden_hi1[3], worden_lo1[3], worden_hi0[3],worden_lo0[3],
worden_hi1[2], worden_lo1[2], worden_hi0[2],worden_lo0[2],
worden_hi1[1], worden_lo1[1], worden_hi0[1],worden_lo0[1],
worden_hi1[0], worden_lo1[0], worden_hi0[0],worden_lo0[0]} = worden_shift[19:0];


















always@(l1clk or wen_c4 or set_c4 or waysel_c4 or  waysel_err_c4 or worden_c4 or wrd_lo0_a or 
	wrd_hi0_a or wrd_lo1_a or wrd_hi1_a or coloff_c4 or bank_select  or wr_spare_0 or 
	wr_spare_1 or wee_l or worden_hi0 or worden_lo0 or worden_lo1 or worden_hi1 or spare_word_enable
        or vnw_ary)
begin

////////////////////////////////////////////////////////////////
// Read all entries for a given set 
////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////
//  Write data computation
////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////
// Write to memory
//////////////////////////////////////////////////////////////



    #0


//if(wen_c4  & ~waysel_err_c4 & bank_select & coloff_c4 & (|worden_c4))
if(~l1clk & wee_l & wen_c4  & ~waysel_err_c4 & bank_select & coloff_c4 & (|worden_c4) & vnw_ary)
begin
	if(waysel_c4[0])
	begin
	mem_lo0_way0[set_c4]   = (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & mem_lo0_way0[set_c4]);
	mem_hi0_way0[set_c4]   = (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & mem_hi0_way0[set_c4]);
	mem_lo1_way0[set_c4]   = (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & mem_lo1_way0[set_c4]);
	mem_hi1_way0[set_c4]   = (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & mem_hi1_way0[set_c4]);
	mem_way0_spare_0[set_c4] = (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & mem_way0_spare_0[set_c4]);
	mem_way0_spare_1[set_c4] = (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & mem_way0_spare_1[set_c4]);
	end
	else if(waysel_c4[1])
	begin
	mem_lo0_way1[set_c4]   =  (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & mem_lo0_way1[set_c4]);
	mem_hi0_way1[set_c4]   =  (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & mem_hi0_way1[set_c4]);
	mem_lo1_way1[set_c4]   =  (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & mem_lo1_way1[set_c4]);
	mem_hi1_way1[set_c4]   =  (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & mem_hi1_way1[set_c4]);
	mem_way1_spare_0[set_c4] = (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & mem_way1_spare_0[set_c4]);
	mem_way1_spare_1[set_c4] = (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & mem_way1_spare_1[set_c4]);
	end
	else if(waysel_c4[2])
	begin
	mem_lo0_way2[set_c4]   =  (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & mem_lo0_way2[set_c4]);
	mem_lo1_way2[set_c4]   =  (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & mem_lo1_way2[set_c4]);
	mem_hi0_way2[set_c4]   =  (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & mem_hi0_way2[set_c4]);
	mem_hi1_way2[set_c4]   =  (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & mem_hi1_way2[set_c4]);
	mem_way2_spare_0[set_c4] = (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & mem_way2_spare_0[set_c4]);
	mem_way2_spare_1[set_c4] = (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & mem_way2_spare_1[set_c4]);
	end
	else if(waysel_c4[3])
	begin
	mem_lo0_way3[set_c4]   = (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & mem_lo0_way3[set_c4]);
	mem_lo1_way3[set_c4]   = (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & mem_lo1_way3[set_c4]);
	mem_hi0_way3[set_c4]   = (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & mem_hi0_way3[set_c4]);
	mem_hi1_way3[set_c4]   = (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & mem_hi1_way3[set_c4]);
	mem_way3_spare_0[set_c4] = (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & mem_way3_spare_0[set_c4]);
	mem_way3_spare_1[set_c4] = (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & mem_way3_spare_1[set_c4]);
	end
	else if(waysel_c4[4])
	begin
	mem_lo0_way4[set_c4]   = (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & mem_lo0_way4[set_c4]);
	mem_lo1_way4[set_c4]   = (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & mem_lo1_way4[set_c4]);
	mem_hi0_way4[set_c4]   = (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & mem_hi0_way4[set_c4]);
	mem_hi1_way4[set_c4]   = (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & mem_hi1_way4[set_c4]);
	mem_way4_spare_0[set_c4] = (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & mem_way4_spare_0[set_c4]);
	mem_way4_spare_1[set_c4] = (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & mem_way4_spare_1[set_c4]);
	end
	else if(waysel_c4[5])
	begin
	mem_lo0_way5[set_c4]   =(worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & mem_lo0_way5[set_c4]);
	mem_lo1_way5[set_c4]   =(worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & mem_lo1_way5[set_c4]);
	mem_hi0_way5[set_c4]   =(worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & mem_hi0_way5[set_c4]);
	mem_hi1_way5[set_c4]   =(worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & mem_hi1_way5[set_c4]);
	mem_way5_spare_0[set_c4] = (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & mem_way5_spare_0[set_c4]);
	mem_way5_spare_1[set_c4] = (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & mem_way5_spare_1[set_c4]);
	end
	else if(waysel_c4[6])
	begin
	mem_lo0_way6[set_c4]   =(worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & mem_lo0_way6[set_c4]);
	mem_lo1_way6[set_c4]   =(worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & mem_lo1_way6[set_c4]);
	mem_hi0_way6[set_c4]   =(worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & mem_hi0_way6[set_c4]);
	mem_hi1_way6[set_c4]   =(worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & mem_hi1_way6[set_c4]);
	mem_way6_spare_0[set_c4] = (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & mem_way6_spare_0[set_c4]);
	mem_way6_spare_1[set_c4] = (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & mem_way6_spare_1[set_c4]);
	end
	else if(waysel_c4[7])
	begin
	mem_lo0_way7[set_c4]   =(worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & mem_lo0_way7[set_c4]);
	mem_lo1_way7[set_c4]   =(worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & mem_lo1_way7[set_c4]);
	mem_hi0_way7[set_c4]   =(worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & mem_hi0_way7[set_c4]);
	mem_hi1_way7[set_c4]   =(worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & mem_hi1_way7[set_c4]);
	mem_way7_spare_0[set_c4] = (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & mem_way7_spare_0[set_c4]);
	mem_way7_spare_1[set_c4] = (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & mem_way7_spare_1[set_c4]);
	end
  end
end

//always@(waysel_c4 or set_c4 or bnken_lat )
always@(waysel_c4 or set_c4 or coloff_c4_l or vnw_ary)

begin


    #0

if(~coloff_c4_l & vnw_ary)
begin
	if(waysel_c4[0])
		begin
		saout_lo0_bc[19:0]	<=	mem_lo0_way0[set_c4];
		saout_lo1_bc[18:0]	<=	mem_lo1_way0[set_c4];
		saout_hi0_bc[19:0]	<=	mem_hi0_way0[set_c4];
		saout_hi1_bc[18:0]	<=	mem_hi1_way0[set_c4];
 		rd_spare_0		<=	mem_way0_spare_0[set_c4];
 		rd_spare_1		<=	mem_way0_spare_1[set_c4];
		end
	else if(waysel_c4[1])
		begin
		saout_lo0_bc[19:0]	<=	mem_lo0_way1[set_c4];	
		saout_lo1_bc[18:0]	<=	mem_lo1_way1[set_c4];	
		saout_hi0_bc[19:0]	<=	mem_hi0_way1[set_c4];	
		saout_hi1_bc[18:0]	<=	mem_hi1_way1[set_c4];	
 		rd_spare_0		<=	mem_way1_spare_0[set_c4];
 		rd_spare_1		<=	mem_way1_spare_1[set_c4];
		end
	else if(waysel_c4[2])
		begin
		saout_lo0_bc[19:0]	<=	mem_lo0_way2[set_c4];	
		saout_lo1_bc[18:0]	<=	mem_lo1_way2[set_c4];	
		saout_hi0_bc[19:0]	<=	mem_hi0_way2[set_c4];	
		saout_hi1_bc[18:0]	<=	mem_hi1_way2[set_c4];	
 		rd_spare_0		<=	mem_way2_spare_0[set_c4];
 		rd_spare_1		<=	mem_way2_spare_1[set_c4];
		end
	else if(waysel_c4[3])
		begin
		saout_lo0_bc[19:0]	<=	mem_lo0_way3[set_c4];	
		saout_lo1_bc[18:0]	<=	mem_lo1_way3[set_c4];	
		saout_hi0_bc[19:0]	<=	mem_hi0_way3[set_c4];	
		saout_hi1_bc[18:0]	<=	mem_hi1_way3[set_c4];	
 		rd_spare_0		<=	mem_way3_spare_0[set_c4];
 		rd_spare_1		<=	mem_way3_spare_1[set_c4];
		end
	else if(waysel_c4[4])
		begin
		saout_lo0_bc[19:0]	<=	mem_lo0_way4[set_c4];	
		saout_lo1_bc[18:0]	<=	mem_lo1_way4[set_c4];	
		saout_hi0_bc[19:0]	<=	mem_hi0_way4[set_c4];	
		saout_hi1_bc[18:0]	<=	mem_hi1_way4[set_c4];	
 		rd_spare_0		<=	mem_way4_spare_0[set_c4];
 		rd_spare_1		<=	mem_way4_spare_1[set_c4];
		end
	else if(waysel_c4[5])
		begin
		saout_lo0_bc[19:0]	<=	mem_lo0_way5[set_c4];
		saout_lo1_bc[18:0]	<=	mem_lo1_way5[set_c4];
		saout_hi0_bc[19:0]	<=	mem_hi0_way5[set_c4];
		saout_hi1_bc[18:0]	<=	mem_hi1_way5[set_c4];
 		rd_spare_0		<=	mem_way5_spare_0[set_c4];
 		rd_spare_1		<=	mem_way5_spare_1[set_c4];
		end
	else if(waysel_c4[6])
		begin
		saout_lo0_bc[19:0]	<=	mem_lo0_way6[set_c4];	
		saout_lo1_bc[18:0]	<=	mem_lo1_way6[set_c4];	
		saout_hi0_bc[19:0]	<=	mem_hi0_way6[set_c4];	
		saout_hi1_bc[18:0]	<=	mem_hi1_way6[set_c4];	
 		rd_spare_0		<=	mem_way6_spare_0[set_c4];
 		rd_spare_1		<=	mem_way6_spare_1[set_c4];
		end
	else if(waysel_c4[7])
		begin
	        saout_lo0_bc[19:0]    	<=	mem_lo0_way7[set_c4];      
	        saout_lo1_bc[18:0]    	<=	mem_lo1_way7[set_c4];      
	        saout_hi0_bc[19:0]    	<=	mem_hi0_way7[set_c4];      
	        saout_hi1_bc[18:0]    	<=	mem_hi1_way7[set_c4];      
 		rd_spare_0		<=	mem_way7_spare_0[set_c4];
 		rd_spare_1		<=	mem_way7_spare_1[set_c4];
		end
end
end


// READ
// Data is read out of the above array in c4 and gets registered and latched
// to become a c5b signal which gets muxed and goes to dmux


reg rd_spare_0_d_l,rd_spare_1_d_l;
reg rdd_spare_0,rdd_spare_1;
reg tstmodclk_c3b_l;
always@(posedge l1clk)
begin
	saout_lo0_bc_d_l[19:0] <= ~saout_lo0_bc[19:0];
	saout_lo1_bc_d_l[18:0] <= ~saout_lo1_bc[18:0];
	saout_hi0_bc_d_l[19:0] <= ~saout_hi0_bc[19:0];
	saout_hi1_bc_d_l[18:0] <= ~saout_hi1_bc[18:0];
	rd_spare_0_d_l         <= ~rd_spare_0;
	rd_spare_1_d_l         <= ~rd_spare_1;
end

always@(negedge l1clk)
begin
        saout_lo0_bc_c5b_l[19:0] <= saout_lo0_bc_d_l[19:0];
        saout_lo1_bc_c5b_l[18:0] <= saout_lo1_bc_d_l[18:0];
        saout_hi0_bc_c5b_l[19:0] <= saout_hi0_bc_d_l[19:0];
        saout_hi1_bc_c5b_l[18:0] <= saout_hi1_bc_d_l[18:0];
	rdd_spare_0		 <= rd_spare_0_d_l;
	rdd_spare_1		 <= rd_spare_1_d_l;
	tstmodclk_c3b_l		 <= tstmodclk_l;
end


assign rd_data[19:0] =
	{rdd_spare_0,      saout_lo1_bc_c5b_l[4], saout_hi0_bc_c5b_l[4],saout_lo0_bc_c5b_l[4],
	saout_hi1_bc_c5b_l[3], saout_lo1_bc_c5b_l[3], saout_hi0_bc_c5b_l[3],saout_lo0_bc_c5b_l[3],
	saout_hi1_bc_c5b_l[2], saout_lo1_bc_c5b_l[2], saout_hi0_bc_c5b_l[2],saout_lo0_bc_c5b_l[2],
	saout_hi1_bc_c5b_l[1], saout_lo1_bc_c5b_l[1], saout_hi0_bc_c5b_l[1],saout_lo0_bc_c5b_l[1],
	saout_hi1_bc_c5b_l[0], saout_lo1_bc_c5b_l[0], saout_hi0_bc_c5b_l[0],saout_lo0_bc_c5b_l[0]};

	assign rd_data[39:20] = {
			  saout_lo1_bc_c5b_l[9], saout_hi0_bc_c5b_l[9],saout_lo0_bc_c5b_l[9],
	saout_hi1_bc_c5b_l[8], saout_lo1_bc_c5b_l[8], saout_hi0_bc_c5b_l[8],saout_lo0_bc_c5b_l[8],
	saout_hi1_bc_c5b_l[7], saout_lo1_bc_c5b_l[7], saout_hi0_bc_c5b_l[7],saout_lo0_bc_c5b_l[7],
	saout_hi1_bc_c5b_l[6], saout_lo1_bc_c5b_l[6], saout_hi0_bc_c5b_l[6],saout_lo0_bc_c5b_l[6],
	saout_hi1_bc_c5b_l[5], saout_lo1_bc_c5b_l[5], saout_hi0_bc_c5b_l[5],saout_lo0_bc_c5b_l[5], saout_hi1_bc_c5b_l[4]};


	assign rd_data[59:40] = {
	saout_lo1_bc_c5b_l[14], saout_hi0_bc_c5b_l[14],saout_lo0_bc_c5b_l[14],
	saout_hi1_bc_c5b_l[13], saout_lo1_bc_c5b_l[13], saout_hi0_bc_c5b_l[13],saout_lo0_bc_c5b_l[13],
	saout_hi1_bc_c5b_l[12], saout_lo1_bc_c5b_l[12], saout_hi0_bc_c5b_l[12],saout_lo0_bc_c5b_l[12],
	saout_hi1_bc_c5b_l[11], saout_lo1_bc_c5b_l[11], saout_hi0_bc_c5b_l[11],saout_lo0_bc_c5b_l[11],
	saout_hi1_bc_c5b_l[10], saout_lo1_bc_c5b_l[10], saout_hi0_bc_c5b_l[10],saout_lo0_bc_c5b_l[10], saout_hi1_bc_c5b_l[9]};

	assign rd_data[79:60] = {
	saout_hi0_bc_c5b_l[19], saout_lo0_bc_c5b_l[19],
	saout_hi1_bc_c5b_l[18], saout_lo1_bc_c5b_l[18], saout_hi0_bc_c5b_l[18],saout_lo0_bc_c5b_l[18],
	saout_hi1_bc_c5b_l[17], saout_lo1_bc_c5b_l[17], saout_hi0_bc_c5b_l[17],saout_lo0_bc_c5b_l[17],
	saout_hi1_bc_c5b_l[16], saout_lo1_bc_c5b_l[16], saout_hi0_bc_c5b_l[16],saout_lo0_bc_c5b_l[16],
	saout_hi1_bc_c5b_l[15], saout_lo1_bc_c5b_l[15], saout_hi0_bc_c5b_l[15],saout_lo0_bc_c5b_l[15], saout_hi1_bc_c5b_l[14],rdd_spare_1};


	always@(cred_mod or rd_data)
	begin
	
	for(i=0;i<19;i=i+1)
	begin
	read_data[i] = cred_mod[i] ? rd_data[i+1] : rd_data[i];
        end
	
	for(i=20;i<40;i=i+1)
        begin
	read_data[i] = cred_mod[i] ? rd_data[i-1] : rd_data[i];
        end
	

	for(i=40;i<60;i=i+1)
	 begin
	 read_data[i] = cred_mod[i] ? rd_data[i+1] : rd_data[i];
         end
	 
	for(i=61;i<80;i=i+1)
         begin
	 read_data[i] = cred_mod[i] ? rd_data[i-1] : rd_data[i];
         end
	
	end 



	assign { saout_hi0_b_out_l[19], saout_lo0_b_out_l[19],
        saout_hi1_b_out_l[18], saout_lo1_b_out_l[18], saout_hi0_b_out_l[18],saout_lo0_b_out_l[18],
        saout_hi1_b_out_l[17], saout_lo1_b_out_l[17], saout_hi0_b_out_l[17],saout_lo0_b_out_l[17],
        saout_hi1_b_out_l[16], saout_lo1_b_out_l[16], saout_hi0_b_out_l[16],saout_lo0_b_out_l[16],
        saout_hi1_b_out_l[15], saout_lo1_b_out_l[15], saout_hi0_b_out_l[15],saout_lo0_b_out_l[15], 
	saout_hi1_b_out_l[14]} = read_data[79:61];
         
        assign {saout_lo1_b_out_l[14], saout_hi0_b_out_l[14],saout_lo0_b_out_l[14],
        saout_hi1_b_out_l[13], saout_lo1_b_out_l[13], saout_hi0_b_out_l[13],saout_lo0_b_out_l[13],
        saout_hi1_b_out_l[12], saout_lo1_b_out_l[12], saout_hi0_b_out_l[12],saout_lo0_b_out_l[12],
        saout_hi1_b_out_l[11], saout_lo1_b_out_l[11], saout_hi0_b_out_l[11],saout_lo0_b_out_l[11],
        saout_hi1_b_out_l[10], saout_lo1_b_out_l[10], saout_hi0_b_out_l[10],saout_lo0_b_out_l[10], 
	saout_hi1_b_out_l[9]} = read_data[59:40];

        assign { saout_lo1_b_out_l[9], saout_hi0_b_out_l[9],saout_lo0_b_out_l[9],
        saout_hi1_b_out_l[8], saout_lo1_b_out_l[8], saout_hi0_b_out_l[8],saout_lo0_b_out_l[8],
        saout_hi1_b_out_l[7], saout_lo1_b_out_l[7], saout_hi0_b_out_l[7],saout_lo0_b_out_l[7],
        saout_hi1_b_out_l[6], saout_lo1_b_out_l[6], saout_hi0_b_out_l[6],saout_lo0_b_out_l[6],
        saout_hi1_b_out_l[5], saout_lo1_b_out_l[5], saout_hi0_b_out_l[5],saout_lo0_b_out_l[5], 
	saout_hi1_b_out_l[4]} = read_data[39:20];

        assign {saout_lo1_b_out_l[4], saout_hi0_b_out_l[4],saout_lo0_b_out_l[4],
        saout_hi1_b_out_l[3], saout_lo1_b_out_l[3], saout_hi0_b_out_l[3],saout_lo0_b_out_l[3],
        saout_hi1_b_out_l[2], saout_lo1_b_out_l[2], saout_hi0_b_out_l[2],saout_lo0_b_out_l[2],
        saout_hi1_b_out_l[1], saout_lo1_b_out_l[1], saout_hi0_b_out_l[1],saout_lo0_b_out_l[1],
        saout_hi1_b_out_l[0], saout_lo1_b_out_l[0], saout_hi0_b_out_l[0],saout_lo0_b_out_l[0]} = read_data[18:0];

assign red_sel_rgt = |cred[19:18];
assign red_sel_lft = |cred[59:58];

assign coloff_c5_rgt[1] = coloff_c5[1] | red_sel_rgt & coloff_c5[0];
assign coloff_c5_rgt[0] = coloff_c5[0] | red_sel_rgt & coloff_c5[1];
assign coloff_c5_lft[1] = coloff_c5[1] | red_sel_lft & coloff_c5[0];
assign coloff_c5_lft[0] = coloff_c5[0] | red_sel_lft & coloff_c5[1];







 



always@(negedge l1clk)
begin
select_read_data_all_c5b <= (bank_select_c5 & ~(select_red_odd | select_red_even) & (|waysel_c5) & (|coloff_c5) & readen_c5 & wee_l & ~waysel_err_c4);
select_read_red_all_c5b  <=(bank_select_c5 &  (select_red_odd | select_red_even) & (|waysel_c5) & (|coloff_c5) & readen_c5 & wee_l & ~waysel_err_c4);
 
select_read_data_c5b_hi_rgt <= (bank_select_c5 & ~(select_red_odd | select_red_even) & (|waysel_c5)  & wee_l) & 
                               (readen_c5 & coloff_c5_rgt[1] & ~waysel_err_c5);
select_read_data_c5b_hi_lft <= (bank_select_c5 & ~(select_red_odd | select_red_even) & (|waysel_c5)  & wee_l) & 
                               (readen_c5 & coloff_c5_lft[1] & ~waysel_err_c5);
select_read_data_c5b_lo_rgt <= (bank_select_c5 & ~(select_red_odd | select_red_even) & (|waysel_c5)  & wee_l) & 
                               (readen_c5 & coloff_c5_rgt[0] & ~waysel_err_c5);
select_read_data_c5b_lo_lft <= (bank_select_c5 & ~(select_red_odd | select_red_even) & (|waysel_c5)  & wee_l) & 
                               (readen_c5 & coloff_c5_lft[0] & ~waysel_err_c5);
select_read_red_c5b_hi_rgt  <=(bank_select_c5 &  (select_red_odd | select_red_even) & (|waysel_c5)  & wee_l) & 
                               (readen_c5 & coloff_c5_rgt[1] & ~waysel_err_c5);
select_read_red_c5b_hi_lft  <=(bank_select_c5 &  (select_red_odd | select_red_even) & (|waysel_c5)  & wee_l) & 
                               (readen_c5 & coloff_c5_lft[1] & ~waysel_err_c5);
select_read_red_c5b_lo_rgt  <=(bank_select_c5 &  (select_red_odd | select_red_even) & (|waysel_c5)  & wee_l) & 
                               (readen_c5 & coloff_c5_rgt[0] & ~waysel_err_c5);
select_read_red_c5b_lo_lft  <=(bank_select_c5 &  (select_red_odd | select_red_even) & (|waysel_c5)  & wee_l) & 
                               (readen_c5 & coloff_c5_lft[0] & ~waysel_err_c5);
end


//assign saout_lo0_bc_l[19:0] = select_read_data_c5b ? saout_lo0_bc_c5b_l[19:0] : 
//			      select_read_red_c5b ? red_lo0_out[19:0] : 20'hFFFFF;
//assign saout_lo1_bc_l[18:0] = select_read_data_c5b ? saout_lo1_bc_c5b_l[18:0] : 
//			      select_read_red_c5b ? red_lo1_out[18:0] : 19'h7FFFF;
//assign saout_hi0_bc_l[19:0] = select_read_data_c5b ? saout_hi0_bc_c5b_l[19:0] : 
//			      select_read_red_c5b ? red_hi0_out[19:0] : 20'hFFFFF;
//assign saout_hi1_bc_l[18:0] = select_read_data_c5b ? saout_hi1_bc_c5b_l[18:0] : 
//			      select_read_red_c5b ? red_hi1_out[18:0] : 19'h7FFFF;
//
always@(select_read_red_c5b_lo_rgt or select_read_red_c5b_lo_lft or select_read_red_c5b_hi_rgt or select_read_red_c5b_hi_lft or
	select_read_data_c5b_lo_rgt or select_read_data_c5b_lo_lft or select_read_data_c5b_hi_rgt or select_read_data_c5b_hi_lft
      or red_lo0_b_out_l or red_hi0_b_out_l or red_lo1_b_out_l or saout_hi1_b_out_l 
      or saout_lo0_b_out_l or red_hi0_b_out_l or saout_lo1_b_out_l or saout_hi1_b_out_l or tstmodclk_c3b_l or l1clk)
begin

if(tstmodclk_c3b_l)
begin
saout_lo0_bc_l[9:0]   = select_read_red_c5b_lo_rgt  ? red_lo0_b_out_l[9:0]     : 
		      select_read_data_c5b_lo_rgt ? saout_lo0_b_out_l[9:0]   : 10'h3FF;
saout_lo0_bc_l[19:10] = select_read_red_c5b_lo_lft  ? red_lo0_b_out_l[19:10]   : 
		      select_read_data_c5b_lo_lft ? saout_lo0_b_out_l[19:10] : 10'h3FF;
saout_hi0_bc_l[9:0]   = select_read_red_c5b_lo_rgt  ? red_hi0_b_out_l[9:0]     : 
		      select_read_data_c5b_lo_rgt ? saout_hi0_b_out_l[9:0]   : 10'h3FF;
saout_hi0_bc_l[19:10] = select_read_red_c5b_lo_lft  ? red_hi0_b_out_l[19:10]   : 
		      select_read_data_c5b_lo_lft ? saout_hi0_b_out_l[19:10] : 10'h3FF;
saout_lo1_bc_l[9:0]   = select_read_red_c5b_hi_rgt  ? red_lo1_b_out_l[9:0]     : 
		      select_read_data_c5b_hi_rgt ? saout_lo1_b_out_l[9:0]   : 10'h3FF;
saout_lo1_bc_l[18:10] = select_read_red_c5b_hi_lft  ? red_lo1_b_out_l[18:10]   : 
		      select_read_data_c5b_hi_lft ? saout_lo1_b_out_l[18:10] : 9'h1FF;
saout_hi1_bc_l[8:0]   = select_read_red_c5b_hi_rgt  ? red_hi1_b_out_l[8:0]     : 
		      select_read_data_c5b_hi_rgt ? saout_hi1_b_out_l[8:0]   : 9'h1FF;
saout_hi1_bc_l[18:9]  = select_read_red_c5b_hi_lft  ? red_hi1_b_out_l[18:9]    : 
		      select_read_data_c5b_hi_lft ? saout_hi1_b_out_l[18:9]  : 10'h3FF;
end
else
begin
saout_lo0_bc_l[19:0] = select_read_red_all_c5b  ? red_lo0_b_out_l[19:0]   : 
 		       select_read_data_all_c5b ? saout_lo0_b_out_l[19:0] : 20'bx;
saout_hi0_bc_l[19:0] = select_read_red_all_c5b  ? red_hi0_b_out_l[19:0]   : 
 		       select_read_data_all_c5b ? saout_hi0_b_out_l[19:0] : 20'bx;
saout_lo1_bc_l[18:0] = select_read_red_all_c5b  ? red_lo1_b_out_l[18:0]   : 
 		       select_read_data_all_c5b ? saout_lo1_b_out_l[18:0] : 19'bx;
saout_hi1_bc_l[18:0] = select_read_red_all_c5b  ? red_hi1_b_out_l[18:0]   : 
		       select_read_data_all_c5b ? saout_hi1_b_out_l[18:0] : 19'bx;
		       
//saout_lo0_bc_l[19:0] = select_read_data_all_c5b ? saout_lo0_bc_c5b_l[19:0] : 20'hFFFFF;
//saout_lo1_bc_l[18:0] = select_read_data_all_c5b ? saout_lo1_bc_c5b_l[18:0] : 19'hFFFFF;
//saout_hi0_bc_l[19:0] = select_read_data_all_c5b ? saout_hi0_bc_c5b_l[19:0] : 20'hFFFFF;
//saout_hi1_bc_l[18:0] = select_read_data_all_c5b ? saout_hi1_bc_c5b_l[18:0] : 19'hFFFFF;
end
end


//assign repair_saout_lo0_bc_l[9:0]   = 
//select_read_red_c5b_lo_rgt  ? red_lo0_b_out_l[9:0]     : select_read_data_c5b_lo_rgt ? saout_lo0_b_out_l[9:0]   : 10'h3FF ;
//assign repair_saout_lo0_bc_l[19:10] = 
//select_read_red_c5b_lo_lft  ? red_lo0_b_out_l[19:10]   : select_read_data_c5b_lo_lft ? saout_lo0_b_out_l[19:10] : 10'h3FF ;
//assign repair_saout_hi0_bc_l[9:0]   = 
//select_read_red_c5b_lo_rgt  ? red_hi0_b_out_l[9:0]     : select_read_data_c5b_lo_rgt ? saout_hi0_b_out_l[9:0]   : 10'h3FF ;
//assign repair_saout_hi0_bc_l[19:10] = 
//select_read_red_c5b_lo_lft  ? red_hi0_b_out_l[19:10]   : select_read_data_c5b_lo_lft ? saout_hi0_b_out_l[19:10] : 10'h3FF ;
//assign repair_saout_lo1_bc_l[9:0]   = 
//select_read_red_c5b_hi_rgt  ? red_lo1_b_out_l[9:0]     : select_read_data_c5b_hi_rgt ? saout_lo1_b_out_l[9:0]   : 10'h3FF ;
//assign repair_saout_lo1_bc_l[18:10] = 
//select_read_red_c5b_hi_lft  ? red_lo1_b_out_l[18:10]   : select_read_data_c5b_hi_lft ? saout_lo1_b_out_l[18:10] : 9'h1FF ;
//assign repair_saout_hi1_bc_l[8:0]   = 
//select_read_red_c5b_hi_rgt  ? red_hi1_b_out_l[8:0]     : select_read_data_c5b_hi_rgt ? saout_hi1_b_out_l[8:0]   : 9'h1FF ;
//assign repair_saout_hi1_bc_l[18:9]  = 
//select_read_red_c5b_hi_lft  ? red_hi1_b_out_l[18:9]    : select_read_data_c5b_hi_lft ? saout_hi1_b_out_l[18:9]  : 10'h3FF ;
//
//
//assign norepair_saout_lo0_bc_l[19:0] = select_read_data_all_c5b ? saout_lo0_bc_c5b_l[19:0] : 20'hFFFFF;
//assign norepair_saout_lo1_bc_l[18:0] = select_read_data_all_c5b ? saout_lo1_bc_c5b_l[18:0] : 19'hFFFFF;
//assign norepair_saout_hi0_bc_l[19:0] = select_read_data_all_c5b ? saout_hi0_bc_c5b_l[19:0] : 20'hFFFFF;
//assign norepair_saout_hi1_bc_l[18:0] = select_read_data_all_c5b ? saout_hi1_bc_c5b_l[18:0] : 19'hFFFFF;
//
//`endif
//
//`ifdef AXIS_SMEM
//
//	always@(negedge l1clk)  
//	begin
//        axis_saout_lo0_bc[19:0]  = saout_lo0_bc[19:0];
//        axis_saout_lo1_bc[18:0]  = saout_lo1_bc[18:0];
//        axis_saout_hi0_bc[19:0]  = saout_hi0_bc[19:0];
//        axis_saout_hi1_bc[18:0]  = saout_hi1_bc[18:0];
//	end
//	assign saout_lo0_bc_l[19:0] = axis_select_read_data_c5b ? axis_saout_lo0_bc[19:0] : 20'hFFFFF;
//	assign saout_lo1_bc_l[18:0] = axis_select_read_data_c5b ? axis_saout_lo1_bc[18:0] : 19'h7FFFF;
//	assign saout_hi0_bc_l[19:0] = axis_select_read_data_c5b ? axis_saout_hi0_bc[19:0] : 20'hFFFFF;
//	assign saout_hi1_bc_l[18:0] = axis_select_read_data_c5b ? axis_saout_hi1_bc[18:0] : 19'h7FFFF;
//
//`else
//assign saout_lo0_bc_l[19:0] = ~tstmodclk_c3b_l ? repair_saout_lo0_bc_l[19:0] : norepair_saout_lo0_bc_l[19:0];
//assign saout_lo1_bc_l[18:0] = ~tstmodclk_c3b_l ? repair_saout_lo1_bc_l[18:0] : norepair_saout_lo1_bc_l[18:0];
//assign saout_hi0_bc_l[19:0] = ~tstmodclk_c3b_l ? repair_saout_hi0_bc_l[19:0] : norepair_saout_hi0_bc_l[19:0];
//assign saout_hi1_bc_l[18:0] = ~tstmodclk_c3b_l ? repair_saout_hi1_bc_l[18:0] : norepair_saout_hi1_bc_l[18:0];

///////////////////////////////////////////////////////////////////////////////////////////////

// REDUDANCY

reg [19:0]    red_lo0_odd_0;         
reg [18:0]    red_lo1_odd_0;         
reg [19:0]    red_hi0_odd_0;         
reg [18:0]    red_hi1_odd_0;         
reg [19:0]    red_lo0_even_0;
reg [18:0]    red_lo1_even_0;
reg [19:0]    red_hi0_even_0;
reg [18:0]    red_hi1_even_0;
reg	      redrow_way0_spare_odd_0;
reg	      redrow_way0_spare_even_0;
reg	      redrow_way0_spare_odd_1;
reg	      redrow_way0_spare_even_1;

reg [19:0]    red_lo0_odd_1;
reg [18:0]    red_lo1_odd_1;
reg [19:0]    red_hi0_odd_1;
reg [18:0]    red_hi1_odd_1;
reg [19:0]    red_lo0_even_1;
reg [18:0]    red_lo1_even_1;
reg [19:0]    red_hi0_even_1;
reg [18:0]    red_hi1_even_1;
reg	      redrow_way1_spare_odd_0;
reg	      redrow_way1_spare_even_0;
reg	      redrow_way1_spare_odd_1;
reg	      redrow_way1_spare_even_1;

reg [19:0]    red_lo0_odd_2;
reg [18:0]    red_lo1_odd_2;
reg [19:0]    red_hi0_odd_2;
reg [18:0]    red_hi1_odd_2;
reg [19:0]    red_lo0_even_2;
reg [18:0]    red_lo1_even_2;
reg [19:0]    red_hi0_even_2;
reg [18:0]    red_hi1_even_2;
reg	      redrow_way2_spare_odd_0;
reg	      redrow_way2_spare_even_0;
reg	      redrow_way2_spare_odd_1;
reg	      redrow_way2_spare_even_1;

reg [19:0]    red_lo0_odd_3;
reg [18:0]    red_lo1_odd_3;
reg [19:0]    red_hi0_odd_3;
reg [18:0]    red_hi1_odd_3;
reg [19:0]    red_lo0_even_3;
reg [18:0]    red_lo1_even_3;
reg [19:0]    red_hi0_even_3;
reg [18:0]    red_hi1_even_3;
reg	      redrow_way3_spare_odd_0;
reg	      redrow_way3_spare_even_0;
reg	      redrow_way3_spare_odd_1;
reg	      redrow_way3_spare_even_1;

reg [19:0]    red_lo0_odd_4;
reg [18:0]    red_lo1_odd_4;
reg [19:0]    red_hi0_odd_4;
reg [18:0]    red_hi1_odd_4;
reg [19:0]    red_lo0_even_4;
reg [18:0]    red_lo1_even_4;
reg [19:0]    red_hi0_even_4;
reg [18:0]    red_hi1_even_4;
reg	      redrow_way4_spare_odd_0;
reg	      redrow_way4_spare_even_0;
reg	      redrow_way4_spare_odd_1;
reg	      redrow_way4_spare_even_1;

reg [19:0]    red_lo0_odd_5;
reg [18:0]    red_lo1_odd_5;
reg [19:0]    red_hi0_odd_5;
reg [18:0]    red_hi1_odd_5;
reg [19:0]    red_lo0_even_5;
reg [18:0]    red_lo1_even_5;
reg [19:0]    red_hi0_even_5;
reg [18:0]    red_hi1_even_5;
reg	      redrow_way5_spare_odd_0;
reg	      redrow_way5_spare_even_0;
reg	      redrow_way5_spare_odd_1;
reg	      redrow_way5_spare_even_1;

reg [19:0]    red_lo0_odd_6;
reg [18:0]    red_lo1_odd_6;
reg [19:0]    red_hi0_odd_6;
reg [18:0]    red_hi1_odd_6;
reg [19:0]    red_lo0_even_6;
reg [18:0]    red_lo1_even_6;
reg [19:0]    red_hi0_even_6;
reg [18:0]    red_hi1_even_6;
reg	      redrow_way6_spare_odd_0;
reg	      redrow_way6_spare_even_0;
reg	      redrow_way6_spare_odd_1;
reg	      redrow_way6_spare_even_1;

reg [19:0]    red_lo0_odd_7;
reg [18:0]    red_lo1_odd_7;
reg [19:0]    red_hi0_odd_7;
reg [18:0]    red_hi1_odd_7;
reg [19:0]    red_lo0_even_7;
reg [18:0]    red_lo1_even_7;
reg [19:0]    red_hi0_even_7;
reg [18:0]    red_hi1_even_7;
reg	      redrow_way7_spare_odd_0;
reg	      redrow_way7_spare_even_0;
reg	      redrow_way7_spare_odd_1;
reg	      redrow_way7_spare_even_1;



reg [19:0]     red_lo0_out_bc;
reg [18:0]     red_lo1_out_bc;
reg [19:0]     red_hi0_out_bc;
reg [18:0]     red_hi1_out_bc;
reg            redrow_rd_spare_0;
reg            redrow_rd_spare_1;

reg [19:0]     red_lo0_out_bc_d_l;
reg [18:0]     red_lo1_out_bc_d_l;
reg [19:0]     red_hi0_out_bc_d_l;
reg [18:0]     red_hi1_out_bc_d_l;
reg	       redrow_rd_spare_0_d_l;
reg	       redrow_rd_spare_1_d_l;

reg [19:0]     red_lo0_bc_c5b_l;
reg [19:0]     red_hi0_bc_c5b_l;
reg [18:0]     red_lo1_bc_c5b_l;
reg [18:0]     red_hi1_bc_c5b_l;
reg	       redrow_rdd_spare_0;
reg	       redrow_rdd_spare_1;

wire [79:0]    red_rd_data;
reg [79:0]    red_read_data;

// Folloing 2 assigns detects a red index to hit with incoming index
// and assert.  While writing and reading the way info is looked at

assign select_red_odd = (red_adr[9:8] == 2'b11) & (red_adr[7:1] == set_c3b[7:1]) 
				& set_c3b[0]  & red_adr[0];
assign select_red_even = (red_adr[9:8] == 2'b11) & (red_adr[7:1] == set_c3b[7:1]) 
				& ~set_c3b[0] & ~red_adr[0];


always@(wee_l or l1clk or wen_c4 or set_c4 or waysel_c4 or waysel_err_c4 or bank_select or coloff_c4 or worden_c4 or
        select_red_odd or select_red_even or worden_lo0 or worden_hi0 or worden_lo1 or worden_hi1 or wrd_lo0_a
	or wrd_hi0_a or wrd_lo1_a or wrd_hi1_a or wr_spare_0 or wr_spare_1 or spare_word_enable or vnw_ary)
begin
// Odd row to be written
if(~l1clk & wee_l & wen_c4 & select_red_odd & ~waysel_err_c4 & bank_select & coloff_c4 & (|worden_c4) & vnw_ary)
 begin
  if(waysel_c4[0])
  begin  
    red_lo0_odd_0   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_odd_0);
    red_hi0_odd_0   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_odd_0);
    red_lo1_odd_0   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_odd_0);
    red_hi1_odd_0   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_odd_0);
    redrow_way0_spare_odd_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way0_spare_odd_0);
    redrow_way0_spare_odd_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way0_spare_odd_1);
   end
  else if(waysel_c4[1])
  begin
    red_lo0_odd_1   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_odd_1);
    red_hi0_odd_1   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_odd_1);
    red_lo1_odd_1   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_odd_1);
    red_hi1_odd_1   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_odd_1);
    redrow_way1_spare_odd_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way1_spare_odd_0);
    redrow_way1_spare_odd_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way1_spare_odd_1);
  end
  else if(waysel_c4[2])
  begin
    red_lo0_odd_2   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_odd_2);
    red_hi0_odd_2   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_odd_2);
    red_lo1_odd_2   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_odd_2);
    red_hi1_odd_2   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_odd_2);
    redrow_way2_spare_odd_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way2_spare_odd_0);
    redrow_way2_spare_odd_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way2_spare_odd_1);
  end
  else if(waysel_c4[3])
  begin
    red_lo0_odd_3   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_odd_3);
    red_hi0_odd_3   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_odd_3);
    red_lo1_odd_3   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_odd_3);
    red_hi1_odd_3   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_odd_3);
    redrow_way3_spare_odd_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way3_spare_odd_0);
    redrow_way3_spare_odd_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way3_spare_odd_1);
  end
  else if(waysel_c4[4])
  begin
    red_lo0_odd_4   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_odd_4);
    red_hi0_odd_4   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_odd_4);
    red_lo1_odd_4   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_odd_4);
    red_hi1_odd_4   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_odd_4);
    redrow_way4_spare_odd_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way4_spare_odd_0);
    redrow_way4_spare_odd_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way4_spare_odd_1);
  end
  else if(waysel_c4[5])
  begin
    red_lo0_odd_5   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_odd_5);
    red_hi0_odd_5   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_odd_5);
    red_lo1_odd_5   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_odd_5);
    red_hi1_odd_5   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_odd_5);
    redrow_way5_spare_odd_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way5_spare_odd_0);
    redrow_way5_spare_odd_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way5_spare_odd_1);
  end
  else if(waysel_c4[6])
  begin
    red_lo0_odd_6   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_odd_6);
    red_hi0_odd_6   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_odd_6);
    red_lo1_odd_6   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_odd_6);
    red_hi1_odd_6   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_odd_6);
    redrow_way6_spare_odd_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way6_spare_odd_0);
    redrow_way6_spare_odd_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way6_spare_odd_1);
  end
  else if(waysel_c4[7])
  begin
    red_lo0_odd_7   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_odd_7);
    red_hi0_odd_7   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_odd_7);
    red_lo1_odd_7   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_odd_7);
    red_hi1_odd_7   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_odd_7);
    redrow_way7_spare_odd_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way7_spare_odd_0);
    redrow_way7_spare_odd_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way7_spare_odd_1);
   end
  end
 

// Even rows to be written
if(~l1clk & wee_l & wen_c4 & select_red_even & ~waysel_err_c4 & bank_select & coloff_c4 & (|worden_c4) & vnw_ary)
 begin
  if(waysel_c4[0])
  begin
    red_lo0_even_0   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_even_0);
    red_hi0_even_0   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_even_0);
    red_lo1_even_0   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_even_0);
    red_hi1_even_0   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_even_0);
    redrow_way0_spare_even_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way0_spare_even_0);
    redrow_way0_spare_even_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way0_spare_even_1);
   end
  else if(waysel_c4[1])
  begin
    red_lo0_even_1   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_even_1);
    red_hi0_even_1   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_even_1);
    red_lo1_even_1   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_even_1);
    red_hi1_even_1   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_even_1);
    redrow_way1_spare_even_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way1_spare_even_0);
    redrow_way1_spare_even_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way1_spare_even_1);
  end
  else if(waysel_c4[2])
  begin
    red_lo0_even_2   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_even_2);
    red_hi0_even_2   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_even_2);
    red_lo1_even_2   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_even_2);
    red_hi1_even_2   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_even_2);
    redrow_way2_spare_even_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way2_spare_even_0);
    redrow_way2_spare_even_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way2_spare_even_1);
  end
  else if(waysel_c4[3])
  begin
    red_lo0_even_3   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_even_3);
    red_hi0_even_3   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_even_3);
    red_lo1_even_3   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_even_3);
    red_hi1_even_3   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_even_3);
    redrow_way3_spare_even_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way3_spare_even_0);
    redrow_way3_spare_even_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way3_spare_even_1);
  end
  else if(waysel_c4[4])
  begin
    red_lo0_even_4   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_even_4);
    red_hi0_even_4   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_even_4);
    red_lo1_even_4   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_even_4);
    red_hi1_even_4   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_even_4);
    redrow_way4_spare_even_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way4_spare_even_0);
    redrow_way4_spare_even_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way4_spare_even_1);
  end
  else if(waysel_c4[5])
  begin
    red_lo0_even_5   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_even_5);
    red_hi0_even_5   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_even_5);
    red_lo1_even_5   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_even_5);
    red_hi1_even_5   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_even_5);
    redrow_way5_spare_even_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way5_spare_even_0);
    redrow_way5_spare_even_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way5_spare_even_1);
  end
  else if(waysel_c4[6])
  begin
    red_lo0_even_6   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_even_6);
    red_hi0_even_6   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_even_6);
    red_lo1_even_6   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_even_6);
    red_hi1_even_6   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_even_6);
    redrow_way6_spare_even_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way6_spare_even_0);
    redrow_way6_spare_even_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way6_spare_even_1);
  end
  else if(waysel_c4[7])
  begin
    red_lo0_even_7   <= (worden_lo0[19:0] & wrd_lo0_a[19:0] | ~worden_lo0[19:0] & red_lo0_even_7);
    red_hi0_even_7   <= (worden_hi0[19:0] & wrd_hi0_a[19:0] | ~worden_hi0[19:0] & red_hi0_even_7);
    red_lo1_even_7   <= (worden_lo1[18:0] & wrd_lo1_a[18:0] | ~worden_lo1[18:0] & red_lo1_even_7);
    red_hi1_even_7   <= (worden_hi1[18:0] & wrd_hi1_a[18:0] | ~worden_hi1[18:0] & red_hi1_even_7);
    redrow_way7_spare_even_0 <= (spare_word_enable[0] & wr_spare_0 | ~spare_word_enable[0] & redrow_way7_spare_even_0);
    redrow_way7_spare_even_1 <= (spare_word_enable[1] & wr_spare_1 | ~spare_word_enable[1] & redrow_way7_spare_even_1);
  end
end
end

// read out
always@(waysel_c4 or coloff_c4_l or set_c4 or vnw_ary)
begin
if(~coloff_c4_l & vnw_ary)
 begin
 if(waysel_c4[0])
     begin
     red_lo0_out_bc[19:0] <= (set_c4[0]) ? red_lo0_odd_0 : red_lo0_even_0;
     red_lo1_out_bc[18:0] <= (set_c4[0]) ? red_lo1_odd_0 : red_lo1_even_0;
     red_hi0_out_bc[19:0] <= (set_c4[0]) ? red_hi0_odd_0 : red_hi0_even_0;
     red_hi1_out_bc[18:0] <= (set_c4[0]) ? red_hi1_odd_0 : red_hi1_even_0;
     redrow_rd_spare_0 	  <= (set_c4[0]) ? redrow_way0_spare_odd_0 : redrow_way0_spare_even_0;
     redrow_rd_spare_1 	  <= (set_c4[0]) ? redrow_way0_spare_odd_1 : redrow_way0_spare_even_1;	     
     end
 else if(waysel_c4[1])
     begin
     red_lo0_out_bc[19:0] <= (set_c4[0]) ? red_lo0_odd_1 : red_lo0_even_1;
     red_lo1_out_bc[18:0] <= (set_c4[0]) ? red_lo1_odd_1 : red_lo1_even_1;
     red_hi0_out_bc[19:0] <= (set_c4[0]) ? red_hi0_odd_1 : red_hi0_even_1;
     red_hi1_out_bc[18:0] <= (set_c4[0]) ? red_hi1_odd_1 : red_hi1_even_1;
     redrow_rd_spare_0 	  <= (set_c4[0]) ? redrow_way1_spare_odd_0 : redrow_way1_spare_even_0;
     redrow_rd_spare_1 	  <= (set_c4[0]) ? redrow_way1_spare_odd_1 : redrow_way1_spare_even_1;	     
     end
 else if(waysel_c4[2])
     begin            							  
     red_lo0_out_bc[19:0] <= (set_c4[0]) ? red_lo0_odd_2 : red_lo0_even_2;
     red_lo1_out_bc[18:0] <= (set_c4[0]) ? red_lo1_odd_2 : red_lo1_even_2;
     red_hi0_out_bc[19:0] <= (set_c4[0]) ? red_hi0_odd_2 : red_hi0_even_2;
     red_hi1_out_bc[18:0] <= (set_c4[0]) ? red_hi1_odd_2 : red_hi1_even_2;
     redrow_rd_spare_0 	  <= (set_c4[0]) ? redrow_way2_spare_odd_0 : redrow_way2_spare_even_0;
     redrow_rd_spare_1 	  <= (set_c4[0]) ? redrow_way2_spare_odd_1 : redrow_way2_spare_even_1;	     
     end
 else if(waysel_c4[3])
     begin            							  
     red_lo0_out_bc[19:0] <= (set_c4[0]) ? red_lo0_odd_3 : red_lo0_even_3;
     red_lo1_out_bc[18:0] <= (set_c4[0]) ? red_lo1_odd_3 : red_lo1_even_3;
     red_hi0_out_bc[19:0] <= (set_c4[0]) ? red_hi0_odd_3 : red_hi0_even_3;
     red_hi1_out_bc[18:0] <= (set_c4[0]) ? red_hi1_odd_3 : red_hi1_even_3;
     redrow_rd_spare_0 	  <= (set_c4[0]) ? redrow_way3_spare_odd_0 : redrow_way3_spare_even_0;
     redrow_rd_spare_1 	  <= (set_c4[0]) ? redrow_way3_spare_odd_1 : redrow_way3_spare_even_1;	     
     end
 else if(waysel_c4[4])
     begin            							  
     red_lo0_out_bc[19:0] <= (set_c4[0]) ? red_lo0_odd_4 : red_lo0_even_4;
     red_lo1_out_bc[18:0] <= (set_c4[0]) ? red_lo1_odd_4 : red_lo1_even_4;
     red_hi0_out_bc[19:0] <= (set_c4[0]) ? red_hi0_odd_4 : red_hi0_even_4;
     red_hi1_out_bc[18:0] <= (set_c4[0]) ? red_hi1_odd_4 : red_hi1_even_4;
     redrow_rd_spare_0 	  <= (set_c4[0]) ? redrow_way4_spare_odd_0 : redrow_way4_spare_even_0;
     redrow_rd_spare_1 	  <= (set_c4[0]) ? redrow_way4_spare_odd_1 : redrow_way4_spare_even_1;	     
     end
 else if(waysel_c4[5])
     begin            							  
     red_lo0_out_bc[19:0] <= (set_c4[0]) ? red_lo0_odd_5 : red_lo0_even_5;
     red_lo1_out_bc[18:0] <= (set_c4[0]) ? red_lo1_odd_5 : red_lo1_even_5;
     red_hi0_out_bc[19:0] <= (set_c4[0]) ? red_hi0_odd_5 : red_hi0_even_5;
     red_hi1_out_bc[18:0] <= (set_c4[0]) ? red_hi1_odd_5 : red_hi1_even_5;
     redrow_rd_spare_0 	  <= (set_c4[0]) ? redrow_way5_spare_odd_0 : redrow_way5_spare_even_0;
     redrow_rd_spare_1 	  <= (set_c4[0]) ? redrow_way5_spare_odd_1 : redrow_way5_spare_even_1;	     
     end
 else if(waysel_c4[6])
     begin            							  
     red_lo0_out_bc[19:0] <= (set_c4[0]) ? red_lo0_odd_6 : red_lo0_even_6;
     red_lo1_out_bc[18:0] <= (set_c4[0]) ? red_lo1_odd_6 : red_lo1_even_6;
     red_hi0_out_bc[19:0] <= (set_c4[0]) ? red_hi0_odd_6 : red_hi0_even_6;
     red_hi1_out_bc[18:0] <= (set_c4[0]) ? red_hi1_odd_6 : red_hi1_even_6;
     redrow_rd_spare_0 	  <= (set_c4[0]) ? redrow_way6_spare_odd_0 : redrow_way6_spare_even_0;
     redrow_rd_spare_1 	  <= (set_c4[0]) ? redrow_way6_spare_odd_1 : redrow_way6_spare_even_1;	     
     end
 else if(waysel_c4[7])
     begin           							  
     red_lo0_out_bc[19:0] <= (set_c4[0]) ? red_lo0_odd_7 : red_lo0_even_7;
     red_lo1_out_bc[18:0] <= (set_c4[0]) ? red_lo1_odd_7 : red_lo1_even_7;
     red_hi0_out_bc[19:0] <= (set_c4[0]) ? red_hi0_odd_7 : red_hi0_even_7;
     red_hi1_out_bc[18:0] <= (set_c4[0]) ? red_hi1_odd_7 : red_hi1_even_7;
     redrow_rd_spare_0 	  <= (set_c4[0]) ? redrow_way7_spare_odd_0 : redrow_way7_spare_even_0;
     redrow_rd_spare_1 	  <= (set_c4[0]) ? redrow_way7_spare_odd_1 : redrow_way7_spare_even_1;	
     end
end
end

always@(negedge l1clk)
begin
    red_lo0_out_bc_d_l <= ~red_lo0_out_bc;
    red_hi0_out_bc_d_l <= ~red_hi0_out_bc;
    red_lo1_out_bc_d_l <= ~red_lo1_out_bc;
    red_hi1_out_bc_d_l <= ~red_hi1_out_bc;
    redrow_rd_spare_0_d_l	     <= ~redrow_rd_spare_0;
    redrow_rd_spare_1_d_l	     <= ~redrow_rd_spare_1;	
end

always@(posedge l1clk)
begin
    red_lo0_bc_c5b_l <= red_lo0_out_bc_d_l;
    red_hi0_bc_c5b_l <= red_hi0_out_bc_d_l;
    red_lo1_bc_c5b_l <= red_lo1_out_bc_d_l;
    red_hi1_bc_c5b_l <= red_hi1_out_bc_d_l;
    redrow_rdd_spare_0	 <= redrow_rd_spare_0_d_l;
    redrow_rdd_spare_1	 <= redrow_rd_spare_1_d_l;
end

assign red_rd_data[19:0] =
	{redrow_rdd_spare_0,      red_lo1_bc_c5b_l[4], red_hi0_bc_c5b_l[4],red_lo0_bc_c5b_l[4],
	red_hi1_bc_c5b_l[3], red_lo1_bc_c5b_l[3], red_hi0_bc_c5b_l[3],red_lo0_bc_c5b_l[3],
	red_hi1_bc_c5b_l[2], red_lo1_bc_c5b_l[2], red_hi0_bc_c5b_l[2],red_lo0_bc_c5b_l[2],
	red_hi1_bc_c5b_l[1], red_lo1_bc_c5b_l[1], red_hi0_bc_c5b_l[1],red_lo0_bc_c5b_l[1],
	red_hi1_bc_c5b_l[0], red_lo1_bc_c5b_l[0], red_hi0_bc_c5b_l[0],red_lo0_bc_c5b_l[0]};

	assign red_rd_data[39:20] = {
			  red_lo1_bc_c5b_l[9], red_hi0_bc_c5b_l[9],red_lo0_bc_c5b_l[9],
	red_hi1_bc_c5b_l[8], red_lo1_bc_c5b_l[8], red_hi0_bc_c5b_l[8],red_lo0_bc_c5b_l[8],
	red_hi1_bc_c5b_l[7], red_lo1_bc_c5b_l[7], red_hi0_bc_c5b_l[7],red_lo0_bc_c5b_l[7],
	red_hi1_bc_c5b_l[6], red_lo1_bc_c5b_l[6], red_hi0_bc_c5b_l[6],red_lo0_bc_c5b_l[6],
	red_hi1_bc_c5b_l[5], red_lo1_bc_c5b_l[5], red_hi0_bc_c5b_l[5],red_lo0_bc_c5b_l[5], red_hi1_bc_c5b_l[4]};


	assign red_rd_data[59:40] = {
	red_lo1_bc_c5b_l[14], red_hi0_bc_c5b_l[14],red_lo0_bc_c5b_l[14],
	red_hi1_bc_c5b_l[13], red_lo1_bc_c5b_l[13], red_hi0_bc_c5b_l[13],red_lo0_bc_c5b_l[13],
	red_hi1_bc_c5b_l[12], red_lo1_bc_c5b_l[12], red_hi0_bc_c5b_l[12],red_lo0_bc_c5b_l[12],
	red_hi1_bc_c5b_l[11], red_lo1_bc_c5b_l[11], red_hi0_bc_c5b_l[11],red_lo0_bc_c5b_l[11],
	red_hi1_bc_c5b_l[10], red_lo1_bc_c5b_l[10], red_hi0_bc_c5b_l[10],red_lo0_bc_c5b_l[10], red_hi1_bc_c5b_l[9]};

	assign red_rd_data[79:60] = {
	red_hi0_bc_c5b_l[19], red_lo0_bc_c5b_l[19],
	red_hi1_bc_c5b_l[18], red_lo1_bc_c5b_l[18], red_hi0_bc_c5b_l[18],red_lo0_bc_c5b_l[18],
	red_hi1_bc_c5b_l[17], red_lo1_bc_c5b_l[17], red_hi0_bc_c5b_l[17],red_lo0_bc_c5b_l[17],
	red_hi1_bc_c5b_l[16], red_lo1_bc_c5b_l[16], red_hi0_bc_c5b_l[16],red_lo0_bc_c5b_l[16],
	red_hi1_bc_c5b_l[15], red_lo1_bc_c5b_l[15], red_hi0_bc_c5b_l[15],red_lo0_bc_c5b_l[15], red_hi1_bc_c5b_l[14],redrow_rdd_spare_1};


	always@(cred_mod or red_rd_data)
	begin
	
	for(i=0;i<19;i=i+1)
	begin
	 red_read_data[i] = cred_mod[i] ? red_rd_data[i+1] : red_rd_data[i];
        end
	
	for(i=20;i<40;i=i+1)
        begin
	 red_read_data[i] = cred_mod[i] ? red_rd_data[i-1] : red_rd_data[i];
        end
	

	for(i=40;i<60;i=i+1)
	begin
	 red_read_data[i] = cred_mod[i] ? red_rd_data[i+1] : red_rd_data[i];
        end
	
	for(i=61;i<80;i=i+1)
        begin
	 red_read_data[i] = cred_mod[i] ? red_rd_data[i-1] : red_rd_data[i];
        end
	
	end 



	assign { red_hi0_b_out_l[19], red_lo0_b_out_l[19],
        red_hi1_b_out_l[18], red_lo1_b_out_l[18], red_hi0_b_out_l[18],red_lo0_b_out_l[18],
        red_hi1_b_out_l[17], red_lo1_b_out_l[17], red_hi0_b_out_l[17],red_lo0_b_out_l[17],
        red_hi1_b_out_l[16], red_lo1_b_out_l[16], red_hi0_b_out_l[16],red_lo0_b_out_l[16],
        red_hi1_b_out_l[15], red_lo1_b_out_l[15], red_hi0_b_out_l[15],red_lo0_b_out_l[15], 
	red_hi1_b_out_l[14]} = red_read_data[79:61];
         
        assign {red_lo1_b_out_l[14], red_hi0_b_out_l[14],red_lo0_b_out_l[14],
        red_hi1_b_out_l[13], red_lo1_b_out_l[13], red_hi0_b_out_l[13],red_lo0_b_out_l[13],
        red_hi1_b_out_l[12], red_lo1_b_out_l[12], red_hi0_b_out_l[12],red_lo0_b_out_l[12],
        red_hi1_b_out_l[11], red_lo1_b_out_l[11], red_hi0_b_out_l[11],red_lo0_b_out_l[11],
        red_hi1_b_out_l[10], red_lo1_b_out_l[10], red_hi0_b_out_l[10],red_lo0_b_out_l[10], 
	red_hi1_b_out_l[9]} = red_read_data[59:40];

        assign { red_lo1_b_out_l[9], red_hi0_b_out_l[9],red_lo0_b_out_l[9],
        red_hi1_b_out_l[8], red_lo1_b_out_l[8], red_hi0_b_out_l[8],red_lo0_b_out_l[8],
        red_hi1_b_out_l[7], red_lo1_b_out_l[7], red_hi0_b_out_l[7],red_lo0_b_out_l[7],
        red_hi1_b_out_l[6], red_lo1_b_out_l[6], red_hi0_b_out_l[6],red_lo0_b_out_l[6],
        red_hi1_b_out_l[5], red_lo1_b_out_l[5], red_hi0_b_out_l[5],red_lo0_b_out_l[5], 
	red_hi1_b_out_l[4]} = red_read_data[39:20];

        assign {red_lo1_b_out_l[4], red_hi0_b_out_l[4],red_lo0_b_out_l[4],
        red_hi1_b_out_l[3], red_lo1_b_out_l[3], red_hi0_b_out_l[3],red_lo0_b_out_l[3],
        red_hi1_b_out_l[2], red_lo1_b_out_l[2], red_hi0_b_out_l[2],red_lo0_b_out_l[2],
        red_hi1_b_out_l[1], red_lo1_b_out_l[1], red_hi0_b_out_l[1],red_lo0_b_out_l[1],
        red_hi1_b_out_l[0], red_lo1_b_out_l[0], red_hi0_b_out_l[0],red_lo0_b_out_l[0]} = red_read_data[18:0];


//////////////////////////////////////////////////////////////////////////////
// col redudancy
// hi1, lo1, hi0, lo0

//assign cred_mod_lo0[18:0]  = cred_mod[18:0];
//assign cred_mod_hi0[38:19] = cred_mod[38:19];
//assign cred_mod_lo1[58:39] = cred_mod[58:39];
//assign cred_mod_hi1[77:59] = cred_mod[77:59];

// mux 0+1
// mux 19 spare
// mux 18 and spare
// mux 38 and 37 
// mux 77  




endmodule

