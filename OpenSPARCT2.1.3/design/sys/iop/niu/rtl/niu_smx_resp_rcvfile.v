// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_resp_rcvfile.v
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

module niu_smx_resp_rcvcnt(
/*AUTOARG*/
   // Outputs
   cnt_data, 
   // Inputs
   clk, reset_l, rst_cnt, inc_cnt
   ); 

// synopsys template

parameter DATA_WIDTH= 10;

input 		clk;
input 		reset_l;
input 		rst_cnt;
input 		inc_cnt;
output [DATA_WIDTH-1:0] cnt_data;

reg [DATA_WIDTH-1:0] cnt_data;

always @(posedge clk) begin
  if(!reset_l) cnt_data<= `SMX_PD  {DATA_WIDTH{1'b0}};
  else begin
     if(rst_cnt) cnt_data<= `SMX_PD  {{(DATA_WIDTH-1){1'b0}}, 1'b1};
     else if(inc_cnt) cnt_data<= `SMX_PD  cnt_data + 1'b1;
  end
end 

endmodule

//
// ??? might need to restructure if too many individual incrementor?
// save some gates
//

module niu_smx_resp_rcvfile(
/*AUTOARG*/
   // Outputs
   rdata, 
   // Inputs
   clk, reset_l, rd, rd_inc, raddr, wr_rst, waddr
   ); 

parameter DATA_WIDTH= 10;
parameter ADDR_WIDTH= 6;
parameter ENTRY_SIZE= 1<<ADDR_WIDTH;

input 			clk;
input 			reset_l;

input 			rd;      // rd cnt only, no update
input 			rd_inc;  // rd cnt, inc cnt_data, then update
input [ADDR_WIDTH-1:0] 	raddr;

input 			wr_rst;  // reset cnt_data to 1
input [ADDR_WIDTH-1:0] 	waddr;

output [DATA_WIDTH-1:0] rdata;


function [63:0] decode_64;
  input [5:0] in;
  
  reg [63:0] out;
  integer i;
  
  begin
    for(i=0;i<64;i=i+1) begin
      if(in==i[5:0])
        out[i]= 1'b1;
      else
        out[i]= 1'b0;
    end
    decode_64= out; 
  end
endfunction

wire [ENTRY_SIZE-1:0] rd_inc_en_n= decode_64(raddr);
wire [ENTRY_SIZE-1:0] wr_rst_en_n= decode_64(waddr);
wire [ENTRY_SIZE-1:0] inc_cnt= {ENTRY_SIZE{rd_inc}} & rd_inc_en_n;
wire [ENTRY_SIZE-1:0] rst_cnt= {ENTRY_SIZE{wr_rst}} & wr_rst_en_n;

reg [DATA_WIDTH-1:0] cnt_data[0:ENTRY_SIZE-1];
reg [DATA_WIDTH-1:0]  rdata;
wire [DATA_WIDTH-1:0] rdata_n= cnt_data[raddr];


// flop out data
always @ (posedge clk) begin
  if(!reset_l) rdata<= `SMX_PD  {DATA_WIDTH{1'b0}};
  else if(rd_inc | rd) rdata<= `SMX_PD  rdata_n;
end

// --- cut/paste here ----

wire [DATA_WIDTH-1:0] cnt_data_0; 
wire [DATA_WIDTH-1:0] cnt_data_1; 
wire [DATA_WIDTH-1:0] cnt_data_2; 
wire [DATA_WIDTH-1:0] cnt_data_3; 
wire [DATA_WIDTH-1:0] cnt_data_4; 
wire [DATA_WIDTH-1:0] cnt_data_5; 
wire [DATA_WIDTH-1:0] cnt_data_6; 
wire [DATA_WIDTH-1:0] cnt_data_7; 
wire [DATA_WIDTH-1:0] cnt_data_8; 
wire [DATA_WIDTH-1:0] cnt_data_9; 
wire [DATA_WIDTH-1:0] cnt_data_10; 
wire [DATA_WIDTH-1:0] cnt_data_11; 
wire [DATA_WIDTH-1:0] cnt_data_12; 
wire [DATA_WIDTH-1:0] cnt_data_13; 
wire [DATA_WIDTH-1:0] cnt_data_14; 
wire [DATA_WIDTH-1:0] cnt_data_15; 
wire [DATA_WIDTH-1:0] cnt_data_16; 
wire [DATA_WIDTH-1:0] cnt_data_17; 
wire [DATA_WIDTH-1:0] cnt_data_18; 
wire [DATA_WIDTH-1:0] cnt_data_19; 
wire [DATA_WIDTH-1:0] cnt_data_20; 
wire [DATA_WIDTH-1:0] cnt_data_21; 
wire [DATA_WIDTH-1:0] cnt_data_22; 
wire [DATA_WIDTH-1:0] cnt_data_23; 
wire [DATA_WIDTH-1:0] cnt_data_24; 
wire [DATA_WIDTH-1:0] cnt_data_25; 
wire [DATA_WIDTH-1:0] cnt_data_26; 
wire [DATA_WIDTH-1:0] cnt_data_27; 
wire [DATA_WIDTH-1:0] cnt_data_28; 
wire [DATA_WIDTH-1:0] cnt_data_29; 
wire [DATA_WIDTH-1:0] cnt_data_30; 
wire [DATA_WIDTH-1:0] cnt_data_31; 
wire [DATA_WIDTH-1:0] cnt_data_32; 
wire [DATA_WIDTH-1:0] cnt_data_33; 
wire [DATA_WIDTH-1:0] cnt_data_34; 
wire [DATA_WIDTH-1:0] cnt_data_35; 
wire [DATA_WIDTH-1:0] cnt_data_36; 
wire [DATA_WIDTH-1:0] cnt_data_37; 
wire [DATA_WIDTH-1:0] cnt_data_38; 
wire [DATA_WIDTH-1:0] cnt_data_39; 
wire [DATA_WIDTH-1:0] cnt_data_40; 
wire [DATA_WIDTH-1:0] cnt_data_41; 
wire [DATA_WIDTH-1:0] cnt_data_42; 
wire [DATA_WIDTH-1:0] cnt_data_43; 
wire [DATA_WIDTH-1:0] cnt_data_44; 
wire [DATA_WIDTH-1:0] cnt_data_45; 
wire [DATA_WIDTH-1:0] cnt_data_46; 
wire [DATA_WIDTH-1:0] cnt_data_47; 
wire [DATA_WIDTH-1:0] cnt_data_48; 
wire [DATA_WIDTH-1:0] cnt_data_49; 
wire [DATA_WIDTH-1:0] cnt_data_50; 
wire [DATA_WIDTH-1:0] cnt_data_51; 
wire [DATA_WIDTH-1:0] cnt_data_52; 
wire [DATA_WIDTH-1:0] cnt_data_53; 
wire [DATA_WIDTH-1:0] cnt_data_54; 
wire [DATA_WIDTH-1:0] cnt_data_55; 
wire [DATA_WIDTH-1:0] cnt_data_56; 
wire [DATA_WIDTH-1:0] cnt_data_57; 
wire [DATA_WIDTH-1:0] cnt_data_58; 
wire [DATA_WIDTH-1:0] cnt_data_59; 
wire [DATA_WIDTH-1:0] cnt_data_60; 
wire [DATA_WIDTH-1:0] cnt_data_61; 
wire [DATA_WIDTH-1:0] cnt_data_62; 
wire [DATA_WIDTH-1:0] cnt_data_63; 

always @(/*AUTOSENSE*/cnt_data_0 or cnt_data_1 or cnt_data_10
	 or cnt_data_11 or cnt_data_12 or cnt_data_13 or cnt_data_14
	 or cnt_data_15 or cnt_data_16 or cnt_data_17 or cnt_data_18
	 or cnt_data_19 or cnt_data_2 or cnt_data_20 or cnt_data_21
	 or cnt_data_22 or cnt_data_23 or cnt_data_24 or cnt_data_25
	 or cnt_data_26 or cnt_data_27 or cnt_data_28 or cnt_data_29
	 or cnt_data_3 or cnt_data_30 or cnt_data_31 or cnt_data_32
	 or cnt_data_33 or cnt_data_34 or cnt_data_35 or cnt_data_36
	 or cnt_data_37 or cnt_data_38 or cnt_data_39 or cnt_data_4
	 or cnt_data_40 or cnt_data_41 or cnt_data_42 or cnt_data_43
	 or cnt_data_44 or cnt_data_45 or cnt_data_46 or cnt_data_47
	 or cnt_data_48 or cnt_data_49 or cnt_data_5 or cnt_data_50
	 or cnt_data_51 or cnt_data_52 or cnt_data_53 or cnt_data_54
	 or cnt_data_55 or cnt_data_56 or cnt_data_57 or cnt_data_58
	 or cnt_data_59 or cnt_data_6 or cnt_data_60 or cnt_data_61
	 or cnt_data_62 or cnt_data_63 or cnt_data_7 or cnt_data_8
	 or cnt_data_9) begin
  cnt_data[0]= cnt_data_0; 
  cnt_data[1]= cnt_data_1; 
  cnt_data[2]= cnt_data_2; 
  cnt_data[3]= cnt_data_3; 
  cnt_data[4]= cnt_data_4; 
  cnt_data[5]= cnt_data_5; 
  cnt_data[6]= cnt_data_6; 
  cnt_data[7]= cnt_data_7; 
  cnt_data[8]= cnt_data_8; 
  cnt_data[9]= cnt_data_9; 
  cnt_data[10]= cnt_data_10; 
  cnt_data[11]= cnt_data_11; 
  cnt_data[12]= cnt_data_12; 
  cnt_data[13]= cnt_data_13; 
  cnt_data[14]= cnt_data_14; 
  cnt_data[15]= cnt_data_15; 
  cnt_data[16]= cnt_data_16; 
  cnt_data[17]= cnt_data_17; 
  cnt_data[18]= cnt_data_18; 
  cnt_data[19]= cnt_data_19; 
  cnt_data[20]= cnt_data_20; 
  cnt_data[21]= cnt_data_21; 
  cnt_data[22]= cnt_data_22; 
  cnt_data[23]= cnt_data_23; 
  cnt_data[24]= cnt_data_24; 
  cnt_data[25]= cnt_data_25; 
  cnt_data[26]= cnt_data_26; 
  cnt_data[27]= cnt_data_27; 
  cnt_data[28]= cnt_data_28; 
  cnt_data[29]= cnt_data_29; 
  cnt_data[30]= cnt_data_30; 
  cnt_data[31]= cnt_data_31; 
  cnt_data[32]= cnt_data_32; 
  cnt_data[33]= cnt_data_33; 
  cnt_data[34]= cnt_data_34; 
  cnt_data[35]= cnt_data_35; 
  cnt_data[36]= cnt_data_36; 
  cnt_data[37]= cnt_data_37; 
  cnt_data[38]= cnt_data_38; 
  cnt_data[39]= cnt_data_39; 
  cnt_data[40]= cnt_data_40; 
  cnt_data[41]= cnt_data_41; 
  cnt_data[42]= cnt_data_42; 
  cnt_data[43]= cnt_data_43; 
  cnt_data[44]= cnt_data_44; 
  cnt_data[45]= cnt_data_45; 
  cnt_data[46]= cnt_data_46; 
  cnt_data[47]= cnt_data_47; 
  cnt_data[48]= cnt_data_48; 
  cnt_data[49]= cnt_data_49; 
  cnt_data[50]= cnt_data_50; 
  cnt_data[51]= cnt_data_51; 
  cnt_data[52]= cnt_data_52; 
  cnt_data[53]= cnt_data_53; 
  cnt_data[54]= cnt_data_54; 
  cnt_data[55]= cnt_data_55; 
  cnt_data[56]= cnt_data_56; 
  cnt_data[57]= cnt_data_57; 
  cnt_data[58]= cnt_data_58; 
  cnt_data[59]= cnt_data_59; 
  cnt_data[60]= cnt_data_60; 
  cnt_data[61]= cnt_data_61; 
  cnt_data[62]= cnt_data_62; 
  cnt_data[63]= cnt_data_63; 
end

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt0 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[0]), .inc_cnt(inc_cnt[0]), .cnt_data(cnt_data_0)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt1 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[1]), .inc_cnt(inc_cnt[1]), .cnt_data(cnt_data_1)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt2 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[2]), .inc_cnt(inc_cnt[2]), .cnt_data(cnt_data_2)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt3 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[3]), .inc_cnt(inc_cnt[3]), .cnt_data(cnt_data_3)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt4 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[4]), .inc_cnt(inc_cnt[4]), .cnt_data(cnt_data_4)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt5 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[5]), .inc_cnt(inc_cnt[5]), .cnt_data(cnt_data_5)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt6 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[6]), .inc_cnt(inc_cnt[6]), .cnt_data(cnt_data_6)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt7 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[7]), .inc_cnt(inc_cnt[7]), .cnt_data(cnt_data_7)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt8 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[8]), .inc_cnt(inc_cnt[8]), .cnt_data(cnt_data_8)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt9 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[9]), .inc_cnt(inc_cnt[9]), .cnt_data(cnt_data_9)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt10 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[10]), .inc_cnt(inc_cnt[10]), .cnt_data(cnt_data_10)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt11 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[11]), .inc_cnt(inc_cnt[11]), .cnt_data(cnt_data_11)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt12 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[12]), .inc_cnt(inc_cnt[12]), .cnt_data(cnt_data_12)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt13 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[13]), .inc_cnt(inc_cnt[13]), .cnt_data(cnt_data_13)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt14 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[14]), .inc_cnt(inc_cnt[14]), .cnt_data(cnt_data_14)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt15 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[15]), .inc_cnt(inc_cnt[15]), .cnt_data(cnt_data_15)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt16 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[16]), .inc_cnt(inc_cnt[16]), .cnt_data(cnt_data_16)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt17 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[17]), .inc_cnt(inc_cnt[17]), .cnt_data(cnt_data_17)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt18 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[18]), .inc_cnt(inc_cnt[18]), .cnt_data(cnt_data_18)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt19 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[19]), .inc_cnt(inc_cnt[19]), .cnt_data(cnt_data_19)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt20 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[20]), .inc_cnt(inc_cnt[20]), .cnt_data(cnt_data_20)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt21 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[21]), .inc_cnt(inc_cnt[21]), .cnt_data(cnt_data_21)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt22 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[22]), .inc_cnt(inc_cnt[22]), .cnt_data(cnt_data_22)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt23 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[23]), .inc_cnt(inc_cnt[23]), .cnt_data(cnt_data_23)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt24 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[24]), .inc_cnt(inc_cnt[24]), .cnt_data(cnt_data_24)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt25 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[25]), .inc_cnt(inc_cnt[25]), .cnt_data(cnt_data_25)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt26 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[26]), .inc_cnt(inc_cnt[26]), .cnt_data(cnt_data_26)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt27 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[27]), .inc_cnt(inc_cnt[27]), .cnt_data(cnt_data_27)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt28 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[28]), .inc_cnt(inc_cnt[28]), .cnt_data(cnt_data_28)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt29 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[29]), .inc_cnt(inc_cnt[29]), .cnt_data(cnt_data_29)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt30 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[30]), .inc_cnt(inc_cnt[30]), .cnt_data(cnt_data_30)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt31 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[31]), .inc_cnt(inc_cnt[31]), .cnt_data(cnt_data_31)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt32 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[32]), .inc_cnt(inc_cnt[32]), .cnt_data(cnt_data_32)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt33 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[33]), .inc_cnt(inc_cnt[33]), .cnt_data(cnt_data_33)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt34 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[34]), .inc_cnt(inc_cnt[34]), .cnt_data(cnt_data_34)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt35 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[35]), .inc_cnt(inc_cnt[35]), .cnt_data(cnt_data_35)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt36 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[36]), .inc_cnt(inc_cnt[36]), .cnt_data(cnt_data_36)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt37 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[37]), .inc_cnt(inc_cnt[37]), .cnt_data(cnt_data_37)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt38 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[38]), .inc_cnt(inc_cnt[38]), .cnt_data(cnt_data_38)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt39 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[39]), .inc_cnt(inc_cnt[39]), .cnt_data(cnt_data_39)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt40 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[40]), .inc_cnt(inc_cnt[40]), .cnt_data(cnt_data_40)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt41 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[41]), .inc_cnt(inc_cnt[41]), .cnt_data(cnt_data_41)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt42 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[42]), .inc_cnt(inc_cnt[42]), .cnt_data(cnt_data_42)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt43 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[43]), .inc_cnt(inc_cnt[43]), .cnt_data(cnt_data_43)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt44 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[44]), .inc_cnt(inc_cnt[44]), .cnt_data(cnt_data_44)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt45 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[45]), .inc_cnt(inc_cnt[45]), .cnt_data(cnt_data_45)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt46 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[46]), .inc_cnt(inc_cnt[46]), .cnt_data(cnt_data_46)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt47 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[47]), .inc_cnt(inc_cnt[47]), .cnt_data(cnt_data_47)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt48 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[48]), .inc_cnt(inc_cnt[48]), .cnt_data(cnt_data_48)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt49 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[49]), .inc_cnt(inc_cnt[49]), .cnt_data(cnt_data_49)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt50 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[50]), .inc_cnt(inc_cnt[50]), .cnt_data(cnt_data_50)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt51 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[51]), .inc_cnt(inc_cnt[51]), .cnt_data(cnt_data_51)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt52 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[52]), .inc_cnt(inc_cnt[52]), .cnt_data(cnt_data_52)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt53 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[53]), .inc_cnt(inc_cnt[53]), .cnt_data(cnt_data_53)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt54 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[54]), .inc_cnt(inc_cnt[54]), .cnt_data(cnt_data_54)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt55 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[55]), .inc_cnt(inc_cnt[55]), .cnt_data(cnt_data_55)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt56 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[56]), .inc_cnt(inc_cnt[56]), .cnt_data(cnt_data_56)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt57 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[57]), .inc_cnt(inc_cnt[57]), .cnt_data(cnt_data_57)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt58 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[58]), .inc_cnt(inc_cnt[58]), .cnt_data(cnt_data_58)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt59 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[59]), .inc_cnt(inc_cnt[59]), .cnt_data(cnt_data_59)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt60 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[60]), .inc_cnt(inc_cnt[60]), .cnt_data(cnt_data_60)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt61 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[61]), .inc_cnt(inc_cnt[61]), .cnt_data(cnt_data_61)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt62 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[62]), .inc_cnt(inc_cnt[62]), .cnt_data(cnt_data_62)); 

niu_smx_resp_rcvcnt #(DATA_WIDTH) rcvcnt63 (
	 .clk(clk), .reset_l(reset_l),
	 .rst_cnt(rst_cnt[63]), .inc_cnt(inc_cnt[63]), .cnt_data(cnt_data_63)); 

endmodule

