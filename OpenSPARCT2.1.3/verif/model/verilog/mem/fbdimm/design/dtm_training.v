// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dtm_training.v
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
module dtm_training(link_clk,dtm_ps,dtm_ps_bar,ps,ps_bar,rst,dtm_enabled,tr_complete,dtm_sb_dummy);

input link_clk;
input [9:0] ps;
input [9:0] ps_bar;
input dtm_enabled;
output [9:0] dtm_ps;
output [9:0] dtm_ps_bar;
output tr_complete;
output [9:0] dtm_sb_dummy;
output rst;
reg [9:0] dtm_ps_reg;
reg [9:0] dtm_ps_bar_reg;
reg [11:0] ts0_header;
reg [11:0] ts0_grp1,dtm_ts0_pattern_num;
reg [11:0] ts0_grp2_11;
reg [7:0] pattern_counter;
reg [143:0] dtm_ts0_pattern;
reg [9:0] required_delay;
reg [11:0] num_ts0;
reg init_reg;
reg dtm_en;
wire init;
reg [3:0] num_nop;
reg dummy;
reg [3:0] reinit_count;
reg tr_complete_reg;
wire tr_complete_reg_d1,tr_complete_reg_d2;
reg rst_reg;
reg rst_reg_cnt;
reg dtm_tr_complete_reg;
reg [9:0] dtm_sb_dummy_reg; // Prepare headers according to the MCU SB data
wire link_clk_en = (ps === ps_bar)? 1'b1 : ~(init_reg)? 1'b0 : 1'b1;
wire link_clk_int = link_clk & link_clk_en;
assign dtm_ps = dtm_ps_reg;
assign dtm_ps_bar = dtm_ps_bar_reg;
assign tr_complete = tr_complete_reg_d1; 
assign dtm_sb_dummy = dtm_sb_dummy_reg;
assign init = (link_clk_en)? 1'b1 : init_reg;
assign rst = rst_reg;

initial begin
ts0_header = 12'hbfe;
ts0_grp1 = 12'h00a;
ts0_grp2_11 = 12'haaa;
dtm_ts0_pattern = {{10{ts0_grp2_11}},ts0_grp1,ts0_header};
pattern_counter = 8'h00;
rst_reg_cnt = 1;
rst_reg = 0;
reinit_count = 0;
required_delay = 0;
dtm_ps_reg = 10'hxxx;
dtm_ps_bar_reg = 10'hxxx;

`ifdef PALLADIUM
dtm_en = dtm_enabled;
`else
#10 dtm_en = dtm_enabled;
`endif

num_nop = 10;
num_ts0 = 0;
dtm_ts0_pattern_num=25;
dummy=$value$plusargs("dtm_ts0_pattern=%h",dtm_ts0_pattern_num);
init_reg = 1;
tr_complete_reg = 0;
end

`ifdef FBDIMM_BUG_107438
always@(dtm_enabled)
   dtm_en <= dtm_enabled;
`endif

always @(negedge link_clk_int)
  begin
	required_delay = required_delay + 1;
        if(reinit_count > 0) reinit_count = reinit_count - 1;
	if(dtm_en == 1'b1 && required_delay == 10'd840 && reinit_count == 0)
	 begin
          if(rst_reg_cnt > 0)
              begin
              rst_reg_cnt = rst_reg_cnt - 1;
              rst_reg = 1;
              end
          else rst_reg = 0;  
	  dtm_ps_reg = {10{dtm_ts0_pattern[pattern_counter]}};
          dtm_ps_bar_reg = ~dtm_ps_reg;	
          dtm_sb_dummy_reg = ps;
      if(pattern_counter == 0) 
	    num_ts0 = num_ts0+1;
	    pattern_counter = (pattern_counter + 1)%144; 
        if(num_ts0 == dtm_ts0_pattern_num) 
	     begin
	      required_delay = 10'd500;
	     end
	    else
	      required_delay = 10'd839;
	 end
	else if(dtm_en == 1'b1 && required_delay !== 10'd840 && reinit_count == 0)
	 begin
	  dtm_ps_reg = 10'h0;
	  dtm_ps_bar_reg = 10'h3ff;
          dtm_sb_dummy_reg = ps;
	  if(required_delay == 10'd572 && (num_ts0 == dtm_ts0_pattern_num))
              begin
              dtm_en = 1'b0;
              tr_complete_reg = 1;
              num_ts0 = 0;
              init_reg = 0;
              end
          else tr_complete_reg = 0; 
	 end
	else if(dtm_en == 1'b0 || reinit_count > 0)
	 begin
          if(init)
              begin
              //dtm_en = 1;
              init_reg = 1;
              required_delay = 10'd813;
              tr_complete_reg = 0;
              num_ts0 = 0;
              pattern_counter = 8'h00;
              if(reinit_count == 0) reinit_count = 4'd12;
              end
	  dtm_ps_reg = ps;
	  dtm_ps_bar_reg = ps_bar;
          dtm_sb_dummy_reg = ps;
          if(dtm_ps_reg === dtm_ps_bar_reg) //Even X's will be considered equal
              begin
              rst_reg = 1;
              rst_reg_cnt = 1;
              end
          if(reinit_count > 0) reinit_count = reinit_count - 1;
	 end
  end


shifter_p #(1) delay_tr_complete1 (.signal_in ( tr_complete_reg ),
                                  .signal_out ( tr_complete_reg_d1 ),
                                  .delay_cycles ( 10'd48),
                                  .clk ( link_clk ));
shifter_p #(1) delay_tr_complete2 (.signal_in ( tr_complete_reg_d1 ),
                                  .signal_out ( tr_complete_reg_d2 ),
                                  .delay_cycles ( 10'd108),
                                  .clk ( link_clk ));
endmodule  
