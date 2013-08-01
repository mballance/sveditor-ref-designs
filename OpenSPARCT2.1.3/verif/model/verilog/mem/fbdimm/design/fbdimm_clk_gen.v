// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fbdimm_clk_gen.v
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
`ifdef STINGRAY
`timescale 1ns/1ps
`endif

module fbdimm_clk_gen(sclk,frm_start,reset_n,dram_clk,dram_2x_clk, link_clk,ref_2x_clk,clk_int,clk_int_2x , frm_boundary_sb);

input sclk;
input frm_start;
input frm_boundary_sb;
input reset_n;
output dram_clk;
output dram_2x_clk;
output link_clk;
output ref_2x_clk;
output clk_int;
output clk_int_2x;


reg dram_clk_reg,dram_2x_clk_reg, link_clk_reg,ref_2x_clk_reg,ch_mon_clk_reg,clk_int_reg,clk_int_2x_reg;
reg dtm_dram_clk_reg,dtm_dram_2x_clk_reg;

reg st_dram_clk_reg,st_dram_2x_clk_reg, st_link_clk_reg,st_ref_2x_clk_reg,st_ch_mon_clk_reg,st_clk_int_reg,st_clk_int_2x_reg;
reg st_dtm_dram_clk_reg,st_dtm_dram_2x_clk_reg;

reg vf_dtm_enabled_reg;

`ifdef AXIS //_FBDIMM_HW
`else
real                 time1,time2,dram_clk_period;
real                 time1_2x,time2_2x,dram_2x_clk_period;
real                 time1_l,time2_l,link_clk_period;
real                 time1_ch_mon,time2_ch_mon,ch_mon_clk_period;
real                 time1_r,time2_r,ref_2x_clk_period;
real                 time1_i,time2_i,clk_int_period;
real                 time1_i_2x,time2_i_2x,clk_int_2x_period;

real                 st_time1,st_time2,st_dram_clk_period;
real                 st_time1_2x,st_time2_2x,st_dram_2x_clk_period;
real                 st_time1_l,st_time2_l,st_link_clk_period;
real                 st_time1_i,st_time2_i,st_clk_int_period;

real                 my_clk_int_period;
real                 my_clk_int_2x_period;

`endif


// for stingray, we will create dram clk which is
// twice the the freq of the input clk which will be
// reference clk
 
//`ifdef STINGRAY
// We will use the same clock generator for Stingray from now on. Sept8
//`else

// AXIS clocks will be different
`ifdef AXIS //_FBDIMM_HW
 
reg [3:0] clk_cnt;
reg [3:0] clk_cnt2;
reg [3:0] clk_cnt_2;

reg clock_en;
initial begin
  clk_cnt=4'h0;
  clk_cnt2=4'h0;
end
initial clock_en=1'b0;
always @(negedge sclk) begin
    if (clk_cnt2 < 4'd8 & clock_en)
      clk_cnt2<=clk_cnt2+4'b1;
end
always @(negedge sclk) begin
   if (frm_start)
     clock_en=1'b1;
end

`ifdef AXIS_FBDIMM_NO_FSR
wire x2sclk;
axis_pulse(x2sclk,sclk);
always @(posedge x2sclk) begin
`else
always @(negedge sclk) begin
`endif
    if (clk_cnt < 4'd11 & clk_cnt2 == 4'd8)
      clk_cnt=clk_cnt+4'b1;
    else
      clk_cnt=4'b0;
end

`ifdef AXIS_FBDIMM_NO_FSR

//always@(tb_top.dram_2x_clk)
wire x2clk;
axis_pulse(x2clk, tb_top.dram_2x_clk);
always@(posedge x2clk)
begin
    if (clk_cnt < 4'd11 & clk_cnt2 == 4'd8)
      clk_cnt_2=clk_cnt_2+4'b1;
    else
      clk_cnt_2=4'b0;
end

assign dram_2x_clk = ~ clk_cnt_2[0];

assign dram_clk    = clk_cnt_2[1];
assign ref_2x_clk = ~dram_clk;

`else
assign dram_2x_clk = (clk_cnt < 4'd3) | ((clk_cnt > 4'd5) & (clk_cnt <4'd9)) ? 1 : 0;
assign dram_clk    = (clk_cnt < 4'd6) ? 0 : 1;
assign ref_2x_clk = (clk_cnt < 4'd6) ? 1 : 0;
`endif

assign link_clk = sclk; // For AXIS model make sure sclk is not SystemClock but link_clk period

`ifdef AXIS_FBDIMM_NO_FSR
assign clk_int = sclk; //(clk_cnt < 4'd2 ) | ((clk_cnt > 4'd3) & (clk_cnt < 4'd6)) | ((clk_cnt > 4'd7) & (clk_cnt < 4'd10))? 1 : 0;
`else
assign clk_int = (clk_cnt < 4'd2 ) | ((clk_cnt > 4'd3) & (clk_cnt < 4'd6)) | ((clk_cnt > 4'd7) & (clk_cnt < 4'd10))? 1 : 0;
`endif

assign clk_int_2x = 0;





`else


//`ifdef STINGRAY_RESTART_CLK


always@(posedge reset_n )
begin

 @(negedge sclk);
   st_time1_i = $realtime;
   st_time1=$realtime;
   st_time1_2x=$realtime;
   st_time1_l=$realtime;
 @(negedge sclk);
   st_time2_i = $realtime;
   st_time2=$realtime;
   st_time2_2x=$realtime;
   st_time2_l=$realtime;

   st_clk_int_reg=1;
   st_clk_int_period = st_time2_i - st_time1_i; 


   st_link_clk_reg=1;
   st_link_clk_period=(st_time2_l-st_time1_l);

   @(negedge frm_start);
   st_dram_clk_reg=1;
   st_dram_clk_period = st_time2 -  st_time1;

   st_dram_2x_clk_reg=1;
   st_dram_2x_clk_period = st_time2_2x - st_time1_2x;
end


always@(st_clk_int_reg)
  st_clk_int_reg <=  #(st_clk_int_period/12)  ~st_clk_int_reg;

always@(st_dram_clk_reg)
  st_dram_clk_reg <= #(st_dram_2x_clk_period/4) ~st_dram_clk_reg;

always@(st_dram_2x_clk_reg)
  st_dram_2x_clk_reg <= #(st_dram_2x_clk_period/8) ~st_dram_2x_clk_reg;

always@(st_link_clk_reg)
  st_link_clk_reg <=  #(st_link_clk_period/48) ~st_link_clk_reg;

//`else

initial begin

  clk_int_reg=0;

  #10;
  @(posedge sclk);
   time1_i=$realtime;
  @(posedge sclk);
   time2_i=$realtime;

  clk_int_period=(time2_i-time1_i)/6;

   clk_int_reg=1;


 if ( ($test$plusargs("DTM_ENABLED")) || ($test$plusargs("VF_DTM_ENABLED")) )
     my_clk_int_period = clk_int_period;
    else my_clk_int_period = clk_int_period/2;

 forever begin #(my_clk_int_period) clk_int_reg = ~clk_int_reg; end


//`ifdef DTM_ENABLED
//  forever begin #(clk_int_period) clk_int_reg = ~clk_int_reg; end
//`else
//  forever begin #(clk_int_period/2) clk_int_reg = ~clk_int_reg; end
//`endif

end

initial begin
 vf_dtm_enabled_reg = 1'b0;
 if ($test$plusargs("VF_DTM_ENABLED"))
   vf_dtm_enabled_reg = 1'b1;
end

initial begin

  clk_int_2x_reg=0;

  #10;
  @(posedge sclk);
   time1_i_2x=$realtime;
  @(posedge sclk);
   time2_i_2x=$realtime;

  clk_int_2x_period=(time2_i_2x-time1_i_2x)/12;

   clk_int_2x_reg=1;

  if ( ($test$plusargs("DTM_ENABLED")) || ($test$plusargs("VF_DTM_ENABLED")) )
    my_clk_int_2x_period = clk_int_2x_period;
  else
   my_clk_int_2x_period = clk_int_2x_period/2;

  forever begin #(my_clk_int_2x_period) clk_int_2x_reg = ~clk_int_2x_reg; end

//`ifdef DTM_ENABLED
//  forever begin #(clk_int_2x_period) clk_int_2x_reg = ~clk_int_2x_reg; end
//`else
//  forever begin #(clk_int_2x_period/2) clk_int_2x_reg = ~clk_int_2x_reg; end
//`endif

end

initial begin

  ch_mon_clk_reg=0;

  @(posedge sclk);
   time1_ch_mon=$realtime;
  @(posedge sclk);
   time2_ch_mon=$realtime;

  ch_mon_clk_period=(time2_ch_mon-time1_ch_mon)/24;
  ch_mon_clk_reg=1;
  forever begin #(ch_mon_clk_period/2) ch_mon_clk_reg = ~ch_mon_clk_reg; end

end


initial begin

  ref_2x_clk_reg=0;

  #10;
  @(posedge sclk);
   time1_r=$realtime;
  @(posedge sclk);
   time2_r=$realtime;

  ref_2x_clk_period=(time2_r-time1_r)/2;
  // Generate 2x dram clock
   ref_2x_clk_reg=1;
  forever begin #(ref_2x_clk_period/2) ref_2x_clk_reg = ~ref_2x_clk_reg; end

end

reg [3:0] clk_cnt;
reg [3:0] clk_cnt2;
reg clock_en;
initial begin
  clk_cnt=4'h0;
  clk_cnt2=4'h0;
end
initial clock_en=1'b0;

always @(negedge link_clk) begin
  if ( frm_boundary_sb )
      clk_cnt=4'b0;
  else
      clk_cnt=clk_cnt+4'b1;
end
wire dtm_dram_clk,dtm_dram_2x_clk;

assign dtm_dram_clk = (clk_cnt > 4'd1) & (clk_cnt < 4'd8)  ? 1 : 0;
assign dtm_dram_2x_clk  =  ((clk_cnt > 4'd1) & (clk_cnt < 4'd5)) || ((clk_cnt > 4'd7) & (clk_cnt < 4'd11)) ? 1: 0;  


// Initialization
initial begin

   dram_clk_reg=0;
   dtm_dram_clk_reg=1;
  
  #10;
  @(posedge sclk);
   time1=$realtime;
  @(posedge sclk);
   time2=$realtime;
 if ( ($test$plusargs("DTM_ENABLED")) || ($test$plusargs("VF_DTM_ENABLED")) )
      dram_clk_period=(time2-time1)/1;
  else
      dram_clk_period=(time2-time1)/2;


//  `ifdef DTM_ENABLED
//      dram_clk_period=(time2-time1)/1;
//  `else
//      dram_clk_period=(time2-time1)/2;
//  `endif

  // Generate 1:2 dram clk
 @(negedge frm_start);
 dram_clk_reg=1;
  forever begin #(dram_clk_period/2) dram_clk_reg = ~dram_clk_reg; end

end

initial begin

  dram_2x_clk_reg=0;
  dtm_dram_2x_clk_reg=1;
  #10;
  @(posedge sclk);
   time1_2x=$realtime;
  @(posedge sclk);
   time2_2x=$realtime;
 if ( ($test$plusargs("DTM_ENABLED")) || ($test$plusargs("VF_DTM_ENABLED")) )
      dram_2x_clk_period=(time2_2x-time1_2x)/2;
  else
      dram_2x_clk_period=(time2_2x-time1_2x)/4;

//  `ifdef DTM_ENABLED
//      dram_2x_clk_period=(time2_2x-time1_2x)/2;
//  `else
//      dram_2x_clk_period=(time2_2x-time1_2x)/4;
//  `endif 

  // Generate 2x dram clock
  @(negedge frm_start);
   dram_2x_clk_reg=1;
  forever begin #(dram_2x_clk_period/2) dram_2x_clk_reg = ~dram_2x_clk_reg; end


end

reg [3:0] clock_counter;

always@(negedge link_clk)
begin
  if ( frm_start )
    clock_counter=0;
  else
    clock_counter=clock_counter+1;
end

wire dtm_DRAM_CLK = (( clock_counter == 1 ) | ( clock_counter == 2 ) | ( clock_counter == 3 ) | ( clock_counter == 4 ) | (  clock_counter == 5 ) | ( clock_counter == 6 )) ? 1'b1: 1'b0;
wire dtm_DRAM_2X_CLK = (( clock_counter == 1 ) | ( clock_counter == 2 ) | ( clock_counter == 3 ) | ( clock_counter == 7 ) | ( clock_counter == 8 ) | ( clock_counter == 9 )) ? 1'b1: 1'b0;

initial begin

  link_clk_reg=0;

  #10;
  @(posedge sclk);
   time1_l=$realtime;
  @(posedge sclk);
   time2_l=$realtime;

 if ( ($test$plusargs("DTM_ENABLED")) || ($test$plusargs("VF_DTM_ENABLED")) )
      link_clk_period=(time2_l-time1_l)/12;
  else
      link_clk_period=(time2_l-time1_l)/24;

//  `ifdef DTM_ENABLED
//      link_clk_period=(time2_l-time1_l)/12;
//  `else
//      link_clk_period=(time2_l-time1_l)/24; 
//  `endif

  // Generate 2x dram clock
  //@(posedge frm_start);
   link_clk_reg=1;
  forever begin #(link_clk_period/2) link_clk_reg = ~link_clk_reg; end

end

`ifdef DTM_ENABLED
assign dram_clk = dtm_dram_clk; //dram_clk_reg;
assign dram_2x_clk = dtm_dram_2x_clk; //dram_2x_clk_reg;
`else
`ifdef STINGRAY_RESTART_CLK
 assign dram_clk = st_dram_clk_reg;
 assign dram_2x_clk = st_dram_2x_clk_reg;
`else
 assign dram_clk = vf_dtm_enabled_reg ? dtm_dram_clk : dtm_DRAM_CLK; //dram_clk_reg;
 assign dram_2x_clk = vf_dtm_enabled_reg ? dtm_dram_2x_clk : dtm_DRAM_2X_CLK; //dram_2x_clk_reg;
`endif
 
`endif


`ifdef STINGRAY_RESTART_CLK
assign clk_int = st_clk_int_reg;
assign link_clk = st_link_clk_reg;
`else
assign clk_int = clk_int_reg;
assign link_clk = link_clk_reg;
`endif



`endif // AXIS_FBDIMM_HW





endmodule
