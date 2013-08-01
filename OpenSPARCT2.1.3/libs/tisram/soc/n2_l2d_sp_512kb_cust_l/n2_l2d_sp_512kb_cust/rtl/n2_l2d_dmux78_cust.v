// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_l2d_dmux78_cust.v
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
module n2_l2d_dmux78_cust (
  waysel_c3, 
  set_c3, 
  coloff_c3, 
  coloff_c4_l, 
  rd_wr_c3, 
  worden_c3, 
  l2clk, 
  tcu_pce_ov, 
  tcu_pce, 
  se, 
  tcu_clk_stop, 
  waysel_top_c4, 
  waysel_bot_c4, 
  set_top_c3b, 
  set_bot_c3b, 
  coloff_top_c3b_l, 
  coloff_bot_c3b_l, 
  writeen_top_c3b, 
  writeen_bot_c3b, 
  l1clk, 
  worden_top_c3b, 
  worden_bot_c3b, 
  sat_lo0_bc_l, 
  sat_hi0_bc_l, 
  sat_lo1_bc_l, 
  sat_hi1_bc_l, 
  sab_lo0_bc_l, 
  sab_hi0_bc_l, 
  sab_lo1_bc_l, 
  sab_hi1_bc_l, 
  ldin0lo_b, 
  ldin0hi_b, 
  ldin1lo_b, 
  ldin1hi_b, 
  ldout0lo_b, 
  ldout0hi_b, 
  ldout1lo_b, 
  ldout1hi_b, 
  red_d_in_00, 
  red_d_out_00, 
  fuse_l2d_rid_00, 
  fuse_l2d_wren_00, 
  fuse_l2d_reset_00_l, 
  sel_quad_00, 
  red_d_in_01, 
  red_d_out_01, 
  fuse_l2d_rid_01, 
  fuse_l2d_wren_01, 
  fuse_l2d_reset_01_l, 
  sel_quad_01, 
  red_addr_top, 
  red_addr_bot, 
  red_top_d_00, 
  red_top_d_01, 
  cred);

input	[7:0]	waysel_c3;
input	[8:0]   set_c3;
input	   	coloff_c3;
input	   	coloff_c4_l;
//input	[1:0]   coloff_c5;
input	       	rd_wr_c3;
//input	       	readen_c5;
input	[3:0]   worden_c3;
input	       	l2clk;
input	       	tcu_pce_ov;
input	       	tcu_pce;
input	       	se;
input	       	tcu_clk_stop;
		
output	[7:0]	waysel_top_c4;			
output	[7:0]	waysel_bot_c4;			
output	[8:0]	set_top_c3b;		//	Set 8 will be inverted for top/bot
output	[8:0]	set_bot_c3b;		//	Set 8 will be inverted for top/bot
output		coloff_top_c3b_l;		
output		coloff_bot_c3b_l;		
//output		coloff_top_c4_l	;		
//output		coloff_bot_c4_l;			
//output	[1:0]	coloff_top_c5;			
//output	[1:0]	coloff_bot_c5;			
output		writeen_top_c3b;			
output		writeen_bot_c3b;			
//output		readen_top_c5;			
//output		readen_bot_c5;			
output		l1clk;				
output	[3:0]	worden_top_c3b;			
output	[3:0]	worden_bot_c3b;			


input	[19:0]	sat_lo0_bc_l;		//	Senseamp out from top-16kb
input	[19:0]	sat_hi0_bc_l;		//	Senseamp out from top-16kb
input	[18:0]	sat_lo1_bc_l;		//	Senseamp out from top-16kb
input	[18:0]	sat_hi1_bc_l;		//	Senseamp out from top-16kb
input	[19:0]	sab_lo0_bc_l;		//	Senseamp out from bot-16kb
input	[19:0]	sab_hi0_bc_l;		//	Senseamp out from bot-16kb
input	[18:0]	sab_lo1_bc_l;		//	Senseamp out from bot-16kb
input	[18:0]	sab_hi1_bc_l;		//	Senseamp out from bot-16kb
input	[19:0]	ldin0lo_b;	
input	[19:0]	ldin0hi_b;	
input	[18:0]	ldin1lo_b;	
input	[18:0]	ldin1hi_b;	
//input		bnken_lat;		//	Address latch enable (1.5cycle)
output	[19:0]	ldout0lo_b;	
output	[19:0]	ldout0hi_b;
output	[18:0]	ldout1lo_b;	
output	[18:0]	ldout1hi_b;	
		

input	[9:0]	red_d_in_00;
output	[9:0]	red_d_out_00;
input	[2:0]	fuse_l2d_rid_00;
input		fuse_l2d_wren_00;
input		fuse_l2d_reset_00_l;
input		sel_quad_00;

input	[9:0]	red_d_in_01;
output	[9:0]	red_d_out_01;
input	[2:0]	fuse_l2d_rid_01;
input		fuse_l2d_wren_01;
input		fuse_l2d_reset_01_l;
input		sel_quad_01;

output	[9:0]	red_addr_top;
output	[9:0]	red_addr_bot;
// forwarded
input	[9:0]	red_top_d_00;
input	[9:0]	red_top_d_01;

output	[77:0]	cred;
//output		fuse_l2d_reset_00_l_buf;
//output		fuse_l2d_reset_01_l_buf;

reg	[7:0]	waysel_top_c4;
reg	[7:0]	waysel_bot_c4;
reg	[8:0]	set_top_c3b;
reg	[8:0]	set_bot_c3b;
reg		writeen_top_c3b;
reg		writeen_bot_c3b;
reg	[3:0]	worden_top_c3b;
reg	[3:0]	worden_bot_c3b;
reg		coloff_top_c3b_l;
reg		coloff_bot_c3b_l;
reg     [7:0]   waysel_top_c3b;
reg     [7:0]   waysel_bot_c3b;
//always@(posedge l2clk)
always@(negedge l2clk)
begin
        coloff_top_c3b_l                <= ~coloff_c3;
        coloff_bot_c3b_l                <= ~coloff_c3;
	worden_top_c3b[3:0]		<=  worden_c3[3:0];
	worden_bot_c3b[3:0]		<=  worden_c3[3:0];
	writeen_top_c3b			<=  ~rd_wr_c3;
	writeen_bot_c3b			<=  ~rd_wr_c3;	
end

//always@(negedge l2clk)
//always@(l2clk or bnken_lat)
always@(l2clk or coloff_c4_l)
begin
//	if(~bnken_lat)
        if(~l2clk & coloff_c4_l)
	begin
		waysel_top_c3b[7:0]		<=  waysel_c3[7:0];	
		waysel_bot_c3b[7:0]		<=  waysel_c3[7:0];	
		set_bot_c3b[8:0]		<=  set_c3[8:0];
		set_top_c3b[8:0]		<=  {~set_c3[8],set_c3[7:0]};

	end
end

always@(posedge l2clk )
begin
waysel_top_c4[7:0]		<=  waysel_top_c3b[7:0];
waysel_bot_c4[7:0]		<=  waysel_bot_c3b[7:0];
end
//assign 	readen_top_c5	= readen_c5;
//assign 	readen_bot_c5	= readen_c5;
//assign 	coloff_top_c5	= coloff_c5[1:0];
//assign 	coloff_bot_c5	= coloff_c5[1:0];
//assign 	coloff_top_c4_l	= coloff_c4_l;
//assign 	coloff_bot_c4_l	= coloff_c4_l;


wire	[19:0]	sat_lo0_bc;
wire	[19:0]	sab_lo0_bc;
wire	[19:0]	sat_hi0_bc;
wire	[19:0]	sab_hi0_bc;
                       
wire	[18:0]	sat_lo1_bc;
wire	[18:0]	sab_lo1_bc;
wire	[18:0]	sat_hi1_bc;
wire	[18:0]	sab_hi1_bc;


//always@(posedge l1clk)
//begin
assign  sat_lo0_bc[19:0] = ~sat_lo0_bc_l[19:0];
assign  sab_lo0_bc[19:0] = ~sab_lo0_bc_l[19:0];
assign  sat_hi0_bc[19:0] = ~sat_hi0_bc_l[19:0];
assign  sab_hi0_bc[19:0] = ~sab_hi0_bc_l[19:0];

assign  sat_lo1_bc[18:0] = ~sat_lo1_bc_l[18:0];
assign  sab_lo1_bc[18:0] = ~sab_lo1_bc_l[18:0];
assign  sat_hi1_bc[18:0] = ~sat_hi1_bc_l[18:0];
assign  sab_hi1_bc[18:0] = ~sab_hi1_bc_l[18:0];
//end



n2_l2d_dmux78_cust_or_macro__ports_3__width_20  or_ldout0lo_b	
	(
	.dout	(ldout0lo_b[19:0]),
	.din0	(sat_lo0_bc[19:0]),
	.din1	(sab_lo0_bc[19:0]),
	.din2	(ldin0lo_b[19:0])
	);

n2_l2d_dmux78_cust_or_macro__ports_3__width_20  or_ldout0hi_b       
        (
        .dout   (ldout0hi_b[19:0]),
        .din0   (sat_hi0_bc[19:0]),
        .din1   (sab_hi0_bc[19:0]),
        .din2   (ldin0hi_b[19:0])
        );

n2_l2d_dmux78_cust_or_macro__ports_3__width_19  or_ldout1lo_b       
        (
        .dout   (ldout1lo_b[18:0]),
        .din0   (sat_lo1_bc[18:0]),
        .din1   (sab_lo1_bc[18:0]),
        .din2   (ldin1lo_b[18:0])
        );


n2_l2d_dmux78_cust_or_macro__ports_3__width_19  or_ldout1hi_b       
        (
        .dout   (ldout1hi_b[18:0]),
        .din0   (sat_hi1_bc[18:0]),
        .din1   (sab_hi1_bc[18:0]),
        .din2   (ldin1hi_b[18:0])
        );


cl_sc1_l1hdr_12x clk_hdr (
	.l2clk	(l2clk),
	.se	(se),
	.pce	(tcu_pce),
	.pce_ov	(tcu_pce_ov),
	.stop  	(tcu_clk_stop),
	.l1clk	(l1clk)
	);


// Redudant row modelling



reg	[9:0]	red_odd_0;
reg	[9:0]	red_odd_1;
reg	[9:0]	red_even_0;
reg	[9:0]	red_even_1;
reg	[7:0]	red_col_0;
reg	[7:0]	red_col_1;
//reg	[9:0]	red_d_out_00;
//reg	[9:0]	red_d_out_01;

wire  red_reg_clk_even_0;
wire  red_reg_clk_even_1;
wire  red_reg_clk_odd_0;
wire  red_reg_clk_odd_1;
wire  red_reg_clk_col_0;
wire  red_reg_clk_col_1;
wire [9:0] red_data_00;
wire [9:0] red_data_01;

// Initialize the register.
initial begin
   
   red_odd_0[9:0] = 10'b0;
   red_odd_1[9:0] = 10'b0;
   red_even_0[9:0]= 10'b0;
   red_even_1[9:0]= 10'b0;
   red_col_0[7:0] = 8'b0;
   red_col_1[7:0] = 8'b0;
end

assign  red_reg_clk_even_0 =~((~l1clk & fuse_l2d_wren_00 & (fuse_l2d_rid_00[2:0]==3'b000) & sel_quad_00) | ~fuse_l2d_reset_00_l);
assign  red_reg_clk_even_1 =~((~l1clk & fuse_l2d_wren_00 & (fuse_l2d_rid_00[2:0]==3'b010) & sel_quad_00) | ~fuse_l2d_reset_00_l);
assign  red_reg_clk_col_0  =~((~l1clk & fuse_l2d_wren_00 & (fuse_l2d_rid_00[2:0]==3'b100) & sel_quad_00) | ~fuse_l2d_reset_00_l);

assign  red_reg_clk_odd_0  =~((~l1clk &fuse_l2d_wren_01& (fuse_l2d_rid_01[2:0]==3'b001) & sel_quad_01) | ~fuse_l2d_reset_01_l);
assign  red_reg_clk_odd_1  =~((~l1clk &fuse_l2d_wren_01& (fuse_l2d_rid_01[2:0]==3'b011) & sel_quad_01) | ~fuse_l2d_reset_01_l);
assign  red_reg_clk_col_1  =~((~l1clk &fuse_l2d_wren_01& (fuse_l2d_rid_01[2:0]==3'b101) & sel_quad_01) | ~fuse_l2d_reset_01_l);

assign  red_data_00[9:0] = red_d_in_00[9:0] & {10{fuse_l2d_reset_00_l}};
assign  red_data_01[9:0] = red_d_in_01[9:0] & {10{fuse_l2d_reset_01_l}};

always @(red_reg_clk_even_0 or red_reg_clk_even_1 or red_reg_clk_col_0 or red_reg_clk_odd_0 or red_reg_clk_odd_1 or red_reg_clk_col_1 or red_d_in_00 or red_d_in_01) begin
  if (~red_reg_clk_even_0) begin
    red_even_0[9:0] <= red_data_00[9:0];
  end

  if (~red_reg_clk_even_1) begin
    red_even_1[9:0] <= red_data_00[9:0];
  end  
  
  if (~red_reg_clk_col_0) begin
    red_col_0[7:0] <= {red_data_00[9:8],red_data_00[5:0]};
  end
  
  if (~red_reg_clk_odd_0) begin
    red_odd_0[9:0] <= red_data_01[9:0];
  end

  if (~red_reg_clk_odd_1) begin
    red_odd_1[9:0] <= red_data_01[9:0];
  end  
  
  if (~red_reg_clk_col_1) begin
    red_col_1[7:0] <= {red_data_01[9:8],red_data_01[5:0]};
  end  
end
  
  
// 00 = bot and 01 = top

//always@(fuse_l2d_wren_00 or fuse_l2d_wren_01 or fuse_l2d_rid_01 or fuse_l2d_rid_00 
//	or red_d_in_00 or red_d_in_01 or sel_quad_00 or sel_quad_01)
//begin
//	if(fuse_l2d_wren_00 & ~fuse_l2d_rid_00[0] & set_bot_c3b[8] & (fuse_l2d_rid_00[2:1]==2'b00) & sel_quad_00)
//		red_even_0	<= red_d_in_00;
//	else if(fuse_l2d_wren_00 & ~fuse_l2d_rid_00[0] & set_top_c3b[8] & (fuse_l2d_rid_01[2:1]==2'b01) & sel_quad_00)
//		red_even_1	<= red_d_in_00;
//	else if(fuse_l2d_wren_00 & ~fuse_l2d_rid_00[0] & (fuse_l2d_rid_01[2:1]==2'b10) & sel_quad_00)
//		red_col_0	<= red_d_in_00[7:0];
//	
//	if(fuse_l2d_wren_01 & fuse_l2d_rid_01[0] & set_top_c3b[8] & (fuse_l2d_rid_01[2:1]==2'b00) & sel_quad_01)
//                red_odd_0 	<= red_d_in_01;
//	else if(fuse_l2d_wren_01 & fuse_l2d_rid_01[0] & set_bot_c3b[8] & (fuse_l2d_rid_01[2:1]==2'b01) & sel_quad_01)
//                red_odd_1       <= red_d_in_01;
//	else if(fuse_l2d_wren_01 & fuse_l2d_rid_01[0] & (fuse_l2d_rid_01[2:1]==2'b10) & sel_quad_01)
//                red_col_1        <= red_d_in_01[7:0];
//end
//			

//assign red_addr_top = set_top_c3b[0] ? red_odd_0 : red_even_0;
//assign red_addr_bot = set_top_c3b[0] ? red_odd_1 : red_even_1;
assign red_addr_top = set_top_c3b[0] ? red_odd_1 : red_even_1;
assign red_addr_bot = set_top_c3b[0] ? red_odd_0 : red_even_0;

assign red_d_out_00[7:0] = (red_even_0[7:0] & {8{fuse_l2d_rid_00[2:0]==3'b000}}) | 
                           (red_even_1[7:0] & {8{fuse_l2d_rid_00[2:0]==3'b010}}) |
			   ({2'b0,(red_col_0[5:0] & {6{fuse_l2d_rid_00[2:0]==3'b100}})})  | 
			   (red_top_d_00[7:0] & {8{~sel_quad_00}});
			   
assign red_d_out_00[9:8] = (red_even_0[9:8] & {2{fuse_l2d_rid_00[2:0]==3'b000}}) | 
                           (red_even_1[9:8] & {2{fuse_l2d_rid_00[2:0]==3'b010}}) | 
			   (red_col_0[7:6] & {2{fuse_l2d_rid_00[2:0]==3'b100}}) | 
			   (red_top_d_00[9:8] & {2{~sel_quad_00}});			   
			   
			   
			   
			   
assign red_d_out_01[7:0] = (red_odd_0[7:0] & {8{fuse_l2d_rid_01[2:0]==3'b001}}) | 
                           (red_odd_1[7:0] & {8{fuse_l2d_rid_01[2:0]==3'b011}}) |
			   ({2'b0,(red_col_1[5:0] & {6{fuse_l2d_rid_01[2:0]==3'b101}})}) | 
			   (red_top_d_01[7:0] & {8{~sel_quad_01}});			   
			   
assign red_d_out_01[9:8] = (red_odd_0[9:8] & {2{fuse_l2d_rid_01[2:0]==3'b001}}) | 
                           (red_odd_1[9:8] & {2{fuse_l2d_rid_01[2:0]==3'b011}}) |
			   (red_col_1[7:6] & {2{fuse_l2d_rid_01[2:0]==3'b101}}) | 
			   (red_top_d_01[9:8] & {2{~sel_quad_01}});			   
			   			   
			   
						   
//always@(fuse_l2d_rid_00)
//begin
//case(fuse_l2d_rid_00)
//3'b000	: begin 
//		red_d_out_00  = red_even_0; 
//		red_d_out_01  = 10'b0; 
//		end
//3'b010	: begin 
//		red_d_out_00  = red_even_1; 
//		red_d_out_01  = 10'b0; 
//		end
//3'b100	: begin 
//		red_d_out_00  = {2'b0,red_col_0};  
//		red_d_out_01  = 10'b0; 
//		end
//
//3'b001	: begin 
//		red_d_out_01  = red_odd_0;  
//		red_d_out_00  = 10'b0; 
//		end
//3'b011	: begin 
//		red_d_out_01  = red_odd_1;  
//		red_d_out_00  = 10'b0; 
//		end
//3'b101	: begin 
//		red_d_out_01  = {2'b0,red_col_1};  
//		red_d_out_00  = 10'b0; 
//		end
//
//default : begin 
//		red_d_out_00  = red_top_d_00;       
//		red_d_out_01  = red_top_d_01;
//		end
//endcase
//end

// Col redudancy

//reg     [7:0]   red_col_0;
//reg     [7:0]   red_col_1;

reg	[38:0] cred0;
reg	[38:0] cred1;

// Initialize cred0, cred1
initial begin
  cred0[38:0] = 39'b0;
  cred1[38:0] = 39'b0;
end

always@(red_col_0)
if(red_col_0[7] & red_col_0[6] & ~red_col_0[5])
case(red_col_0)
8'b11_0_00000	: 	cred0[18:0]	= 19'b111_1111_1111_1111_1111; //0
8'b11_0_00001	: 	cred0[18:0]	= 19'b111_1111_1111_1111_1110; //1
8'b11_0_00010	: 	cred0[18:0]	= 19'b111_1111_1111_1111_1100; //2
8'b11_0_00011	: 	cred0[18:0]	= 19'b111_1111_1111_1111_1000; //3
8'b11_0_00100	: 	cred0[18:0]	= 19'b111_1111_1111_1111_0000; //4
8'b11_0_00101	: 	cred0[18:0]	= 19'b111_1111_1111_1110_0000; //5
8'b11_0_00110	: 	cred0[18:0]	= 19'b111_1111_1111_1100_0000; //6
8'b11_0_00111	: 	cred0[18:0]	= 19'b111_1111_1111_1000_0000; //7
8'b11_0_01000	: 	cred0[18:0]	= 19'b111_1111_1111_0000_0000; //8
8'b11_0_01001	: 	cred0[18:0]	= 19'b111_1111_1110_0000_0000; //9
8'b11_0_01010	: 	cred0[18:0]	= 19'b111_1111_1100_0000_0000; //10
8'b11_0_01011	: 	cred0[18:0]	= 19'b111_1111_1000_0000_0000; //11
8'b11_0_01100	: 	cred0[18:0]	= 19'b111_1111_0000_0000_0000; //12
8'b11_0_01101	: 	cred0[18:0]	= 19'b111_1110_0000_0000_0000; //13
8'b11_0_01110	: 	cred0[18:0]	= 19'b111_1100_0000_0000_0000; //14
8'b11_0_01111	: 	cred0[18:0]	= 19'b111_1000_0000_0000_0000; //15
8'b11_0_10000	: 	cred0[18:0]	= 19'b111_0000_0000_0000_0000; //16
8'b11_0_10001	: 	cred0[18:0]	= 19'b110_0000_0000_0000_0000; //17
8'b11_0_10010	: 	cred0[18:0]	= 19'b100_0000_0000_0000_0000; //18
default		:       cred0[18:0]	= 19'b0;
endcase 
else cred0[18:0] = 19'b0;

always@(red_col_0)
if(red_col_0[7] & red_col_0[6] & red_col_0[5])
case(red_col_0)
8'b11_1_00000	: 	cred0[38:19]	= 20'b1111_1111_1111_1111_1111;//0
8'b11_1_00001	: 	cred0[38:19]	= 20'b0111_1111_1111_1111_1111;//1
8'b11_1_00010	: 	cred0[38:19]	= 20'b0011_1111_1111_1111_1111;//2
8'b11_1_00011	: 	cred0[38:19]	= 20'b0001_1111_1111_1111_1111;//3
8'b11_1_00100	: 	cred0[38:19]	= 20'b0000_1111_1111_1111_1111;//4
8'b11_1_00101	: 	cred0[38:19]	= 20'b0000_0111_1111_1111_1111;//5
8'b11_1_00110	: 	cred0[38:19]	= 20'b0000_0011_1111_1111_1111;//6
8'b11_1_00111	: 	cred0[38:19]	= 20'b0000_0001_1111_1111_1111;//7
8'b11_1_01000	: 	cred0[38:19]	= 20'b0000_0000_1111_1111_1111;//8
8'b11_1_01001	: 	cred0[38:19]	= 20'b0000_0000_0111_1111_1111;//9
8'b11_1_01010	: 	cred0[38:19]	= 20'b0000_0000_0011_1111_1111;//10
8'b11_1_01011	: 	cred0[38:19]	= 20'b0000_0000_0001_1111_1111;//11
8'b11_1_01100	: 	cred0[38:19]	= 20'b0000_0000_0000_1111_1111;//12
8'b11_1_01101	: 	cred0[38:19]	= 20'b0000_0000_0000_0111_1111;//13
8'b11_1_01110	: 	cred0[38:19]	= 20'b0000_0000_0000_0011_1111;//14
8'b11_1_01111	: 	cred0[38:19]	= 20'b0000_0000_0000_0001_1111;//15
8'b11_1_10000	: 	cred0[38:19]	= 20'b0000_0000_0000_0000_1111;//16
8'b11_1_10001	: 	cred0[38:19]	= 20'b0000_0000_0000_0000_0111;//17
8'b11_1_10010	: 	cred0[38:19]	= 20'b0000_0000_0000_0000_0011;//18
8'b11_1_10011	: 	cred0[38:19]	= 20'b0000_0000_0000_0000_0001;//19
default		:  	cred0[38:19]	= 20'b0;
endcase 				     
else cred0[38:19] = 20'b0;

always@(red_col_1)
if(red_col_1[7] & red_col_1[6] & red_col_1[5])
case(red_col_1)
8'b11_1_00000   :       cred1[19:0]	= 20'b1111_1111_1111_1111_1111; //0
8'b11_1_00001   :       cred1[19:0]	= 20'b1111_1111_1111_1111_1110; //1
8'b11_1_00010   :       cred1[19:0]	= 20'b1111_1111_1111_1111_1100; //2
8'b11_1_00011   :       cred1[19:0]	= 20'b1111_1111_1111_1111_1000; //3
8'b11_1_00100   :       cred1[19:0]	= 20'b1111_1111_1111_1111_0000; //4
8'b11_1_00101   :       cred1[19:0]	= 20'b1111_1111_1111_1110_0000; //5
8'b11_1_00110   :       cred1[19:0]	= 20'b1111_1111_1111_1100_0000; //6
8'b11_1_00111   :       cred1[19:0]	= 20'b1111_1111_1111_1000_0000; //7
8'b11_1_01000   :       cred1[19:0]	= 20'b1111_1111_1111_0000_0000; //8
8'b11_1_01001   :       cred1[19:0]	= 20'b1111_1111_1110_0000_0000; //9
8'b11_1_01010   :       cred1[19:0]	= 20'b1111_1111_1100_0000_0000; //10
8'b11_1_01011   :       cred1[19:0]	= 20'b1111_1111_1000_0000_0000; //11
8'b11_1_01100   :       cred1[19:0]	= 20'b1111_1111_0000_0000_0000; //12
8'b11_1_01101   :       cred1[19:0]	= 20'b1111_1110_0000_0000_0000; //13
8'b11_1_01110   :       cred1[19:0]	= 20'b1111_1100_0000_0000_0000; //14
8'b11_1_01111   :       cred1[19:0]	= 20'b1111_1000_0000_0000_0000; //15
8'b11_1_10000   :       cred1[19:0]	= 20'b1111_0000_0000_0000_0000; //16
8'b11_1_10001   :       cred1[19:0]	= 20'b1110_0000_0000_0000_0000; //17
8'b11_1_10010   :       cred1[19:0]	= 20'b1100_0000_0000_0000_0000; //18
8'b11_1_10011   :       cred1[19:0]	= 20'b1000_0000_0000_0000_0000; //19
default		:       cred1[19:0]	= 20'b0;
endcase
else cred1[19:0] = 20'b0;

always@(red_col_1)
if(red_col_1[7] & red_col_1[6] & ~red_col_1[5])
case(red_col_1)
8'b11_0_00000   :       cred1[38:20]	= 19'b111_1111_1111_1111_1111;//0
8'b11_0_00001   :       cred1[38:20]	= 19'b011_1111_1111_1111_1111;//1
8'b11_0_00010   :       cred1[38:20]	= 19'b001_1111_1111_1111_1111;//2
8'b11_0_00011   :       cred1[38:20]	= 19'b000_1111_1111_1111_1111;//3
8'b11_0_00100   :       cred1[38:20]	= 19'b000_0111_1111_1111_1111;//4
8'b11_0_00101   :       cred1[38:20]	= 19'b000_0011_1111_1111_1111;//5
8'b11_0_00110   :       cred1[38:20]	= 19'b000_0001_1111_1111_1111;//6
8'b11_0_00111   :       cred1[38:20]	= 19'b000_0000_1111_1111_1111;//7
8'b11_0_01000   :       cred1[38:20]	= 19'b000_0000_0111_1111_1111;//8
8'b11_0_01001   :       cred1[38:20]	= 19'b000_0000_0011_1111_1111;//9
8'b11_0_01010   :       cred1[38:20]	= 19'b000_0000_0001_1111_1111;//10
8'b11_0_01011   :       cred1[38:20]	= 19'b000_0000_0000_1111_1111;//11
8'b11_0_01100   :       cred1[38:20]	= 19'b000_0000_0000_0111_1111;//12
8'b11_0_01101   :       cred1[38:20]	= 19'b000_0000_0000_0011_1111;//13
8'b11_0_01110   :       cred1[38:20]	= 19'b000_0000_0000_0001_1111;//14
8'b11_0_01111   :       cred1[38:20]	= 19'b000_0000_0000_0000_1111;//15
8'b11_0_10000   :       cred1[38:20]	= 19'b000_0000_0000_0000_0111;//16
8'b11_0_10001   :       cred1[38:20]	= 19'b000_0000_0000_0000_0011;//17
8'b11_0_10010   :       cred1[38:20]	= 19'b000_0000_0000_0000_0001;//18
default		:       cred1[38:20]	= 19'b0;
endcase
else cred1[38:20] = 19'b0;

assign cred[77:0] = {cred1[38:0], cred0[38:0]};
//assign cred[77:0] = 78'b0;


//assign fuse_l2d_reset_00_buf = fuse_l2d_reset_00;
//assign fuse_l2d_reset_01_buf = fuse_l2d_reset_01;




endmodule


//  
//   or macro for ports = 2,3
//
//





module n2_l2d_dmux78_cust_or_macro__ports_3__width_20 (
  din0, 
  din1, 
  din2, 
  dout);
  input [19:0] din0;
  input [19:0] din1;
  input [19:0] din2;
  output [19:0] dout;






or3 #(20)  d0_0 (
.in0(din0[19:0]),
.in1(din1[19:0]),
.in2(din2[19:0]),
.out(dout[19:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module n2_l2d_dmux78_cust_or_macro__ports_3__width_19 (
  din0, 
  din1, 
  din2, 
  dout);
  input [18:0] din0;
  input [18:0] din1;
  input [18:0] din2;
  output [18:0] dout;






or3 #(19)  d0_0 (
.in0(din0[18:0]),
.in1(din1[18:0]),
.in2(din2[18:0]),
.out(dout[18:0])
);









endmodule




