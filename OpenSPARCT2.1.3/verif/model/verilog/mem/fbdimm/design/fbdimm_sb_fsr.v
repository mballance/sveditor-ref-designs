// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fbdimm_sb_fsr.v
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
module fbdimm_sb_fsr(reset,
                     ps_in,
                     ps_in_bar,
                     ps0_out,
                     ps0_out_bar,
                     ps1_out,
                     ps1_out_bar,
                     ps2_out,
                     ps2_out_bar,
                     ps3_out,
                     ps4_out,
                     ps5_out,
                     ps6_out,
                     ps7_out,
                     ps8_out,
                     ps9_out,
                     ps10_out,
                     ps11_out,
                     link_clk,
                     sb_decode_clk,
                     dtm_tr_complete,
                     nop_frame_detected,
                     dtm_enabled_out,
                     frm_begin,
                     frm_begin_nb,
                     frm_boundary_nb,
                     init_seq_started,
                     ref_clk);

input reset;
input [9:0] ps_in,ps_in_bar;
output [9:0] ps0_out,ps0_out_bar;
output [9:0] ps1_out,ps1_out_bar;
output [9:0] ps2_out,ps2_out_bar;
output [9:0] ps3_out;
output [9:0] ps4_out;
output [9:0] ps5_out;
output [9:0] ps6_out;
output [9:0] ps7_out;
output [9:0] ps8_out;
output [9:0] ps9_out;
output [9:0] ps10_out;
output [9:0] ps11_out;
output init_seq_started;
output   frm_boundary_nb;
output   frm_begin_nb;
output   nop_frame_detected;
output   dtm_tr_complete;
output frm_begin;
input link_clk;
output ref_clk;
output sb_decode_clk;
output  dtm_enabled_out;

reg [3:0] fsr_count;
reg [9:0] ps0_out_reg,ps0_out_bar_reg;
reg [9:0] ps1_out_reg,ps1_out_bar_reg;
reg [9:0] ps2_out_reg,ps2_out_bar_reg;
reg [9:0] ps3_out_reg;
reg [9:0] ps4_out_reg;
reg [9:0] ps5_out_reg;
reg [9:0] ps6_out_reg;
reg [9:0] ps7_out_reg;
reg [9:0] ps8_out_reg;
reg [9:0] ps9_out_reg;
reg [9:0] ps10_out_reg;
reg [9:0] ps11_out_reg;
wire [9:0] ps_fsr_in,ps_fsr_in_bar;
wire [9:0] ps_fsr_dtm_in,ps_fsr_dtm_in_bar;

assign ps0_out=ps0_out_reg;
assign ps0_out_bar=ps0_out_bar_reg;
assign ps1_out_bar=ps1_out_bar_reg;
assign ps2_out_bar=ps2_out_bar_reg;
assign ps1_out=ps1_out_reg;
assign ps2_out=ps2_out_reg;
assign ps3_out=ps3_out_reg;
assign ps4_out=ps4_out_reg;
assign ps5_out=ps5_out_reg;
assign ps6_out=ps6_out_reg;
assign ps7_out=ps7_out_reg;
assign ps8_out=ps8_out_reg;
assign ps9_out=ps9_out_reg;
assign ps10_out=ps10_out_reg;
assign ps11_out=ps11_out_reg;

reg [11:0] reg0_dtm,reg1_dtm,reg2_dtm;

`ifdef AXIS_FBDIMM_NO_FSR
wire [11:0] reg0,reg0_b;
wire [11:0] reg1,reg1_b;
wire [11:0] reg2,reg2_b;
wire [11:0] reg3,reg3_b;
wire [11:0] reg4,reg4_b;
wire [11:0] reg5,reg5_b;
wire [11:0] reg6,reg6_b;
wire [11:0] reg7,reg7_b;
wire [11:0] reg8,reg8_b;
wire [11:0] reg9,reg9_b;
`else
reg [11:0] reg0,reg0_b;
reg [11:0] reg1,reg1_b;
reg [11:0] reg2,reg2_b;
reg [11:0] reg3,reg3_b;
reg [11:0] reg4,reg4_b;
reg [11:0] reg5,reg5_b;
reg [11:0] reg6,reg6_b;
reg [11:0] reg7,reg7_b;
reg [11:0] reg8,reg8_b;
reg [11:0] reg9,reg9_b;
`endif

reg        header_detected;
reg        header_detected_dtm;
reg        dtm_seq_host_started;
reg        calibrate_detected;
reg [3:0]  prev_counter,fsr_counter,prev_counter_dtm,lock_counter,lock_counter_dtm;
reg [3:0]  prev_counter2,fsr_counter2,lock_counter2;
reg [3:0]  prev_counter2_dtm,lock_counter2_dtm;
reg        sequence_start;
reg        sequence_start_dtm;
reg        bypass_init;
wire       frm_boundary;
wire       frm_boundary_dtm;
wire       frm_begin_dtm;
wire frm_begin_nb;

assign ref_clk = !sequence_start ? link_clk : frm_boundary;
assign init_seq_started=sequence_start | calibrate_detected;
`ifdef DTM_ENABLED
assign frm_boundary_nb = ( fsr_counter == lock_counter );
`else
assign frm_boundary_nb = ref_clk;
`endif

`ifdef AXIS_FBDIMM_NO_FSR
assign sb_decode_clk = link_clk; 
`else
assign sb_decode_clk = 
                 (lock_counter == 4'h1 ) ? ( fsr_counter == 4'hc ) | ( fsr_counter == 4'hb ) | ( fsr_counter == 4'h8 ) | ( fsr_counter  == 4'h7 ) | ( fsr_counter == 4'h4 ) | ( fsr_counter == 4'h3 ) :
                 (lock_counter == 4'h2 ) ? ( fsr_counter == 4'h1 ) | ( fsr_counter == 4'hc ) | ( fsr_counter == 4'h9 ) | ( fsr_counter  == 4'h8 ) | ( fsr_counter == 4'h5 ) | ( fsr_counter == 4'h4 ) :
                 (lock_counter == 4'h3 ) ? ( fsr_counter == 4'h2 ) | ( fsr_counter == 4'h1 ) | ( fsr_counter == 4'ha ) | ( fsr_counter  == 4'h9 ) | ( fsr_counter == 4'h6 ) | ( fsr_counter == 4'h5 ) :
                 (lock_counter == 4'h4 ) ? ( fsr_counter == 4'h3 ) | ( fsr_counter == 4'h2 ) | ( fsr_counter == 4'hb ) | ( fsr_counter  == 4'ha ) | ( fsr_counter == 4'h7 ) | ( fsr_counter == 4'h6 ) :
                 (lock_counter == 4'h5 ) ? ( fsr_counter == 4'h4 ) | ( fsr_counter == 4'h3 ) | ( fsr_counter == 4'hc ) | ( fsr_counter  == 4'hb ) | ( fsr_counter == 4'h8 ) | ( fsr_counter == 4'h7 ) :
                 (lock_counter == 4'h6 ) ? ( fsr_counter == 4'h5 ) | ( fsr_counter == 4'h4 ) | ( fsr_counter == 4'h1 ) | ( fsr_counter  == 4'hc ) | ( fsr_counter == 4'h9 ) | ( fsr_counter == 4'h8 ) :
                 (lock_counter == 4'h7 ) ? ( fsr_counter == 4'h6 ) | ( fsr_counter == 4'h5 ) | ( fsr_counter == 4'h2 ) | ( fsr_counter  == 4'h1 ) | ( fsr_counter == 4'ha ) | ( fsr_counter == 4'h9 ) :
                 (lock_counter == 4'h8 ) ? ( fsr_counter == 4'h7 ) | ( fsr_counter == 4'h6 ) | ( fsr_counter == 4'h3 ) | ( fsr_counter  == 4'h2 ) | ( fsr_counter == 4'hb ) | ( fsr_counter == 4'ha ) :
                 (lock_counter == 4'h9 ) ? ( fsr_counter == 4'h8 ) | ( fsr_counter == 4'h7 ) | ( fsr_counter == 4'h4 ) | ( fsr_counter  == 4'h3 ) | ( fsr_counter == 4'hc ) | ( fsr_counter == 4'hb ) :
                 (lock_counter == 4'ha ) ? ( fsr_counter == 4'h9 ) | ( fsr_counter == 4'h8 ) | ( fsr_counter == 4'h5 ) | ( fsr_counter  == 4'h4 ) | ( fsr_counter == 4'h1 ) | ( fsr_counter == 4'hc ) :
                 (lock_counter == 4'hb ) ? ( fsr_counter == 4'ha ) | ( fsr_counter == 4'h9 ) | ( fsr_counter == 4'h6 ) | ( fsr_counter   == 4'h5 ) | ( fsr_counter == 4'h2 ) | ( fsr_counter == 4'h1 ) :
                 (lock_counter == 4'hc ) ? ( fsr_counter == 4'hb ) | ( fsr_counter == 4'ha ) | ( fsr_counter == 4'h7 ) | ( fsr_counter   == 4'h6 ) | ( fsr_counter == 4'h3 ) | ( fsr_counter == 4'h2 ) :
                 1'h0;

`endif


reg dtm_enabled;
assign dtm_enabled_out = dtm_enabled;

initial begin
   dtm_enabled=0;
end

`ifdef AXIS_FBDIMM_HW
`else

`ifdef FBDIMM_BUG_107438
always@(posedge link_clk)
  dtm_enabled <= tb_top.start_mcu_dtm_training;
  //dtm_enabled <= tb_top.cpu.mcu0.ccu_serdes_dtm; // & ~(tb_top.cpu.mcu0.drif.drif_init);
`endif
   
// DTM training module
dtm_training dtm_ts0_tr(.link_clk (link_clk),
                        .ps (ps_in),
                        .ps_bar (ps_in_bar),
                        .dtm_ps (ps_fsr_dtm_in),
                        .rst (dtm_rst),
                        .dtm_ps_bar (ps_fsr_dtm_in_bar),
                        .dtm_enabled (dtm_enabled),
                        .tr_complete (dtm_tr_complete));

`endif

assign ps_fsr_in = ( dtm_enabled & !dtm_tr_complete) ? ps_fsr_dtm_in : ps_in;
assign ps_fsr_in_bar = ( dtm_enabled & !dtm_tr_complete) ? ps_fsr_dtm_in_bar : ps_in_bar;
//assign ps_fsr_in =  ps_in;
//assign ps_fsr_in_bar = ps_in_bar;


reg [4:0] nop_cnt;
reg nop_frm_detected_reg;

always@(posedge header_detected_dtm ) if ( sequence_start)
   dtm_seq_host_started <= 1;
else
   dtm_seq_host_started <= 0;

always@(posedge link_clk) if ( dtm_seq_host_started )
begin
  if ( ps_in == 10'h0)
   nop_cnt <= nop_cnt + 1;
  else
   nop_cnt <= 0;
 
  if ( nop_cnt == 10'd11 )
    nop_frm_detected_reg<=1;

end
else begin
  nop_cnt<=0;  
  nop_frm_detected_reg<=0;
end

assign nop_frame_detected = nop_frm_detected_reg;



`ifdef AXIS_FBDIMM_NO_FSR
always@(posedge link_clk)
begin
  if ( fsr_counter == 4'h1 )
   fsr_counter = 4'h3;
  else
   fsr_counter = fsr_counter - 1;

  if ( fsr_counter2 == 4'h1 )
   fsr_counter2 = 4'h2;
  else
   fsr_counter2 = fsr_counter2 - 1;

end

`else
always@(posedge link_clk)
begin
  if ( fsr_counter == 4'h1 )
   fsr_counter = 4'hc;
  else
   fsr_counter = fsr_counter - 1;

  if ( fsr_counter2 == 4'h1 )
   fsr_counter2 = 4'h6;
  else
   fsr_counter2 = fsr_counter2 - 1;

end
`endif

initial begin

dtm_seq_host_started=0;

if ( $test$plusargs("bypass_init")) begin
 sequence_start = 1;
`ifdef STINGRAY
 lock_counter=4'h7;
`else
 lock_counter=4'h1;
`endif

 bypass_init = 1;
end else begin
 sequence_start = 0;
 sequence_start_dtm = 0;
// lock_counter=4'h1;
 bypass_init = 0;
end

end

//always@(posedge link_clk )
`ifdef AXIS_FBDIMM_NO_FSR
always@(negedge ref_clk )
 if ( reg0 == reg0_b )
   sequence_start <= 0;
 else if (header_detected)
   sequence_start <= 1;
 

`else
always@(negedge link_clk )
 if ( ps_fsr_in == ps_fsr_in_bar )
   sequence_start <= 0;
 else if (header_detected)
   sequence_start <= 1;

always@(negedge link_clk )
 if ( ps_fsr_in == ps_fsr_in_bar )
   sequence_start_dtm <= 0;
 else if (header_detected_dtm)
   sequence_start_dtm <= 1;

`endif
 

assign frm_boundary_dtm = ( fsr_counter == lock_counter_dtm );
assign frm_begin_nb = frm_begin;

assign frm_boundary = (dtm_enabled & dtm_tr_complete ) ? frm_boundary_dtm : ( fsr_counter == lock_counter );

//assign frm_boundary = ( fsr_counter == lock_counter );

`ifdef DTM_ENABLED
assign frm_begin = ( lock_counter2_dtm == 4'h6 ) ? ( fsr_counter2 == 4'h1) : ( fsr_counter2 == lock_counter2_dtm+1 );
`else
assign frm_begin = ( fsr_counter2 == lock_counter2 );
`endif


always@(negedge link_clk)  if ( ~bypass_init )
begin
 if (header_detected ) begin
   lock_counter2 <=  prev_counter2;
   lock_counter <= prev_counter;
 end
 else  begin
   prev_counter <= fsr_counter;
   prev_counter2 <= fsr_counter2;
 end

 if ( header_detected_dtm ) begin
   lock_counter2_dtm <=  prev_counter2_dtm;
   lock_counter_dtm <= prev_counter_dtm;
 end
 else begin
   prev_counter2_dtm <= fsr_counter2;
   prev_counter_dtm <= fsr_counter;
 end


`ifdef STINGRAY
 if ( (reg0 == 12'hfff) &&
      (reg1 == 12'hfff) &&
      (reg2 == 12'hfff)  && !calibrate_detected)
  begin
  // header_detected <= 1;
   lock_counter2 <=  prev_counter2;
   lock_counter <= prev_counter;
   calibrate_detected <= 1;
  end
`endif 

end

initial calibrate_detected=0;
wire sb_2of3_ok;

voting_logic test_sb_lane (.a ( reg0 == 12'hbfe ),
                           .b ( reg1 == 12'hbfe ),
                           .c ( reg2 == 12'hbfe ),
                           .out ( sb_2of3_ok ));
voting_logic test_sb_lane_dtm (.a ( reg0_dtm == 12'hbfe ),
                           .b ( reg1_dtm == 12'hbfe ),
                           .c ( reg2_dtm == 12'hbfe ),
                           .out ( sb_2of3_ok_dtm ));


//always@(posedge link_clk)
always@(negedge link_clk) if ( ~sequence_start_dtm )
begin
  if ( sb_2of3_ok_dtm )
   header_detected_dtm  <= 1;
  else
   header_detected_dtm  <= 0;
end

always@(posedge link_clk)  if ( ~bypass_init & ~sequence_start)
begin
 if ( sb_2of3_ok )
   header_detected <= 1;
 else
   header_detected <= 0;

 
  
end

initial begin
lock_counter = 4'h0;
lock_counter_dtm = 4'h0;
fsr_counter=4'h7;
fsr_counter2=4'hc;
header_detected=1'b0;
sequence_start=1'b0;
sequence_start_dtm=1'b0;
reg0_dtm=0;
reg1_dtm=0;
reg2_dtm=0;
end

`ifdef AXIS_FBDIMM_NO_FSR
 //`include "fbdimm_fsr_xmr.vh"
`else
always@(negedge link_clk)
begin

reg0_dtm <= { ps_in[0], reg0_dtm[11:1]};
reg1_dtm <= { ps_in[1], reg1_dtm[11:1]};
reg2_dtm <= { ps_in[2], reg2_dtm[11:1]};

reg0[11:0] <= { ps_fsr_in[0],  reg0[11:1]};
reg1[11:0] <= { ps_fsr_in[1],  reg1[11:1]};
reg2[11:0] <= { ps_fsr_in[2],  reg2[11:1]};
reg3[11:0] <= { ps_fsr_in[3],  reg3[11:1]};
reg4[11:0] <= { ps_fsr_in[4],  reg4[11:1]};
reg5[11:0] <= { ps_fsr_in[5],  reg5[11:1]};
reg6[11:0] <= { ps_fsr_in[6],  reg6[11:1]};
reg7[11:0] <= { ps_fsr_in[7],  reg7[11:1]};
reg8[11:0] <= { ps_fsr_in[8],  reg8[11:1]};
reg9[11:0] <= { ps_fsr_in[9],  reg9[11:1]};

reg0_b[11:0] <= { ps_fsr_in_bar[0],  reg0_b[11:1]};
reg1_b[11:0] <= { ps_fsr_in_bar[1],  reg1_b[11:1]};
reg2_b[11:0] <= { ps_fsr_in_bar[2],  reg2_b[11:1]};
reg3_b[11:0] <= { ps_fsr_in_bar[3],  reg3_b[11:1]};
reg4_b[11:0] <= { ps_fsr_in_bar[4],  reg4_b[11:1]};
reg5_b[11:0] <= { ps_fsr_in_bar[5],  reg5_b[11:1]};
reg6_b[11:0] <= { ps_fsr_in_bar[6],  reg6_b[11:1]};
reg7_b[11:0] <= { ps_fsr_in_bar[7],  reg7_b[11:1]};
reg8_b[11:0] <= { ps_fsr_in_bar[8],  reg8_b[11:1]};
reg9_b[11:0] <= { ps_fsr_in_bar[9],  reg9_b[11:1]};


  if ( ref_clk) begin
  ps0_out_bar_reg <= {reg9_b[1],reg8_b[1],reg7_b[1],reg6_b[1],reg5_b[1],reg4_b[1],reg3_b[1],reg2_b[1],reg1_b[1],reg0_b[1]};
  ps1_out_bar_reg <= {reg9_b[2],reg8_b[2],reg7_b[2],reg6_b[2],reg5_b[2],reg4_b[2],reg3_b[2],reg2_b[2],reg1_b[2],reg0_b[2]};
  ps2_out_bar_reg <= {reg9_b[3],reg8_b[3],reg7_b[3],reg6_b[3],reg5_b[3],reg4_b[3],reg3_b[3],reg2_b[3],reg1_b[3],reg0_b[3]};

  ps0_out_reg     <= {reg9[1]  ,reg8[1],reg7[1],reg6[1],reg5[1],reg4[1],reg3[1],reg2[1],reg1[1],reg0[1]};
  ps1_out_reg     <= {reg9[2]  ,reg8[2],reg7[2],reg6[2],reg5[2],reg4[2],reg3[2],reg2[2],reg1[2],reg0[2]};
  ps2_out_reg     <= {reg9[3]  ,reg8[3],reg7[3],reg6[3],reg5[3],reg4[3],reg3[3],reg2[3],reg1[3],reg0[3]};
  ps3_out_reg     <= {reg9[4]  ,reg8[4],reg7[4],reg6[4],reg5[4],reg4[4],reg3[4],reg2[4],reg1[4],reg0[4]};
  ps4_out_reg     <= {reg9[5]  ,reg8[5],reg7[5],reg6[5],reg5[5],reg4[5],reg3[5],reg2[5],reg1[5],reg0[5]};
  ps5_out_reg     <= {reg9[6]  ,reg8[6],reg7[6],reg6[6],reg5[6],reg4[6],reg3[6],reg2[6],reg1[6],reg0[6]};
  ps6_out_reg     <= {reg9[7]  ,reg8[7],reg7[7],reg6[7],reg5[7],reg4[7],reg3[7],reg2[7],reg1[7],reg0[7]};
  ps7_out_reg     <= {reg9[8]  ,reg8[8],reg7[8],reg6[8],reg5[8],reg4[8],reg3[8],reg2[8],reg1[8],reg0[8]};
  ps8_out_reg     <= {reg9[9]  ,reg8[9],reg7[9],reg6[9],reg5[9],reg4[9],reg3[9],reg2[9],reg1[9],reg0[9]};
  ps9_out_reg     <= {reg9[10] ,reg8[10],reg7[10],reg6[10],reg5[10],reg4[10],reg3[10],reg2[10],reg1[10],reg0[10]};
  ps10_out_reg    <= {reg9[11] ,reg8[11],reg7[11],reg6[11],reg5[11],reg4[11],reg3[11],reg2[11],reg1[11],reg0[11]};
  ps11_out_reg    <= ps_fsr_in;
 end


end

`endif

`ifdef AXIS_FBDIMM_NO_FSR
always@(negedge ref_clk)
begin
  ps0_out_reg <= {reg9[0],reg8[0],reg7[0],reg6[0],reg5[0],reg4[0],reg3[0],reg2[0],reg1[0],reg0[0]};
  ps0_out_bar_reg <= {reg9_b[0],reg8_b[0],reg7_b[0],reg6_b[0],reg5_b[0],reg4_b[0],reg3_b[0],reg2_b[0],reg1_b[0],reg0_b[0]};
  ps1_out_reg <= {reg9[1],reg8[1],reg7[1],reg6[1],reg5[1],reg4[1],reg3[1],reg2[1],reg1[1],reg0[1]};
  ps2_out_reg <= {reg9[2],reg8[2],reg7[2],reg6[2],reg5[2],reg4[2],reg3[2],reg2[2],reg1[2],reg0[2]};
  ps3_out_reg <= {reg9[3],reg8[3],reg7[3],reg6[3],reg5[3],reg4[3],reg3[3],reg2[3],reg1[3],reg0[3]};
  ps4_out_reg <= {reg9[4],reg8[4],reg7[4],reg6[4],reg5[4],reg4[4],reg3[4],reg2[4],reg1[4],reg0[4]};
  ps5_out_reg <= {reg9[5],reg8[5],reg7[5],reg6[5],reg5[5],reg4[5],reg3[5],reg2[5],reg1[5],reg0[5]};
  ps6_out_reg <= {reg9[6],reg8[6],reg7[6],reg6[6],reg5[6],reg4[6],reg3[6],reg2[6],reg1[6],reg0[6]};
  ps7_out_reg <= {reg9[7],reg8[7],reg7[7],reg6[7],reg5[7],reg4[7],reg3[7],reg2[7],reg1[7],reg0[7]};
  ps8_out_reg <= {reg9[8],reg8[8],reg7[8],reg6[8],reg5[8],reg4[8],reg3[8],reg2[8],reg1[8],reg0[8]};
  ps9_out_reg <= {reg9[9],reg8[9],reg7[9],reg6[9],reg5[9],reg4[9],reg3[9],reg2[9],reg1[9],reg0[9]};
  ps10_out_reg <= {reg9[10],reg8[10],reg7[10],reg6[10],reg5[10],reg4[10],reg3[10],reg2[10],reg1[10],reg0[10]};
  ps11_out_reg <= {reg9[11],reg8[11],reg7[11],reg6[11],reg5[11],reg4[11],reg3[11],reg2[11],reg1[11],reg0[11]};

end
`endif

endmodule

