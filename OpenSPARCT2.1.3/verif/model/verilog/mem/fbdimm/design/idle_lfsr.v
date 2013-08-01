// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: idle_lfsr.v
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
`ifdef FBDIMM_FAST_IDLE

module idle_lfsr(reset,
                 pn0_out,
                 pn1_out,
                 pn2_out,
                 pn3_out,
                 pn4_out,
                 pn5_out,
                 pn6_out,
                 pn7_out,
                 pn8_out,
                 pn9_out,
                 pn10_out,
                 pn11_out,
                 frm_begin,
                 frm_boundary,
                 drc,
                 clk);
// interface signals
input         reset;
input         clk;
input         frm_begin,frm_boundary;
input  [31:0] drc;
output [13:0] pn0_out,pn1_out,pn2_out,pn3_out,pn4_out,pn5_out;
output [13:0] pn11_out,pn10_out,pn9_out,pn8_out,pn7_out,pn6_out;


// internal registers/wires
reg  [13:0] lfsr_reg;
reg  [11:0] Xo;
reg  [13:0] Xo_tmp_prev;
reg  [13:0] Xo_tmp;
reg  [3:0]  curr_state;
reg  [4:0]  reset_cnt;
reg         X12,X13;
reg         next_idle_state;
reg         start_lfsr;

wire        reset_ff;
wire        Xo_tmp12;
wire        start_lfsr_d;
wire        lfsr_clk;

//assignments

assign  lfsr_clk = next_idle_state;
assign  reset_ff=(reset_cnt != 0);

// Initialization

// Initialization
initial begin
 curr_state      = 0;
 Xo_tmp          = 12'b000000000001;
 Xo              = 12'b1;
 next_idle_state = 1;
 reset_cnt       = 5'hf;
 start_lfsr      = 0;
end


always@(posedge reset)
   start_lfsr<=1;

assign      Xo_tmp12 = next_idle_state ? Xo_tmp[0] : ~Xo_tmp[0];
assign      pn0_out =  (start_lfsr & ~reset_ff) ? {Xo_tmp[0],Xo_tmp12,Xo_tmp[11:0]} : 1'b0 ;
assign      pn1_out =  (start_lfsr & ~reset_ff) ? {Xo_tmp[0],Xo_tmp12,Xo_tmp[11:0]} : 1'b0 ;
assign      pn2_out =  (start_lfsr & ~reset_ff) ? {Xo_tmp[0],Xo_tmp12,Xo_tmp[11:0]} : 1'b0 ;
assign      pn3_out =  (start_lfsr & ~reset_ff) ? {Xo_tmp[0],Xo_tmp12,Xo_tmp[11:0]} : 1'b0 ;
assign      pn4_out =  (start_lfsr & ~reset_ff) ? {Xo_tmp[0],Xo_tmp12,Xo_tmp[11:0]} : 1'b0 ;
assign      pn5_out =  (start_lfsr & ~reset_ff) ? {Xo_tmp[0],Xo_tmp12,Xo_tmp[11:0]} : 1'b0 ;
assign      pn6_out =  (start_lfsr & ~reset_ff) ? {Xo_tmp[0],~Xo_tmp12,Xo_tmp[11:0]} : 1'b0 ;
assign      pn7_out =  (start_lfsr & ~reset_ff) ? {Xo_tmp[0],~Xo_tmp12,Xo_tmp[11:0]} : 1'b0 ;
assign      pn8_out =  (start_lfsr & ~reset_ff) ? {Xo_tmp[0],~Xo_tmp12,Xo_tmp[11:0]} : 1'b0 ;
assign      pn9_out =  (start_lfsr & ~reset_ff) ? {Xo_tmp[0],~Xo_tmp12,Xo_tmp[11:0]} : 1'b0 ;
assign      pn10_out =  (start_lfsr & ~reset_ff) ? {Xo_tmp[0],~Xo_tmp12,Xo_tmp[11:0]} : 1'b0 ;
assign      pn11_out =  (start_lfsr & ~reset_ff) ? {Xo_tmp[0],~Xo_tmp12,Xo_tmp[11:0]} : 1'b0 ;

shifter_p #(1) shft_start_lfsr (.signal_in (start_lfsr),
                                .signal_out (start_lfsr_d),
                                .delay_cycles ( 5 ),
                                .clk (clk));

always@(posedge frm_boundary) if ( start_lfsr )
begin
  if (reset_cnt)
      reset_cnt<=reset_cnt-1;
end else begin
    reset_cnt <= 9 + drc[7:4] + drc[3:0];
end

 
always @(posedge frm_boundary) if ( start_lfsr )
begin
    if (reset_ff) begin
	Xo <= 12'b1;
        Xo_tmp <= 12'b1;
    end
    else begin

       Xo[11] <= Xo[0] ^ Xo[3] ^ Xo[4] ^ Xo[7];
	Xo[10] <= Xo[11];
	Xo[9] <= Xo[10];
	Xo[8] <= Xo[9];
	Xo[7] <= Xo[8];
	Xo[6] <= Xo[7];
	Xo[5] <= Xo[6];
	Xo[4] <= Xo[5];
	Xo[3] <= Xo[4];
	Xo[2] <= Xo[3];
	Xo[1] <= Xo[2];
	Xo[0] <= Xo[1];

       Xo_tmp[11] <= Xo_tmp[0] ^ Xo_tmp[3] ^ Xo_tmp[4] ^ Xo_tmp[7];
	Xo_tmp[10] <= Xo_tmp[11];
	Xo_tmp[9] <= Xo_tmp[10];
	Xo_tmp[8] <= Xo_tmp[9];
	Xo_tmp[7] <= Xo_tmp[8];
	Xo_tmp[6] <= Xo_tmp[7];
	Xo_tmp[5] <= Xo_tmp[6];
	Xo_tmp[4] <= Xo_tmp[5];
	Xo_tmp[3] <= Xo_tmp[4];
	Xo_tmp[2] <= Xo_tmp[3];
	Xo_tmp[1] <= Xo_tmp[2];
	Xo_tmp[0] <= Xo_tmp[1];

    end
end



endmodule


`else

module idle_lfsr (reset, frm_begin, dtm_reset, lfsr_output, clk, frm_boundary, electrical_idle);
// interface signals
input         reset;
input         clk;
input         frm_boundary;
input         frm_begin;
input         electrical_idle;
input dtm_reset;
output [13:0] lfsr_output;


// internal registers/wires
reg  [13:0] lfsr_reg;
reg [11:0] Xo;
reg [13:0]  Xo_tmp;
reg [3:0]   curr_state;
reg         X12,X13;
reg         next_idle_state;
reg         start_lfsr;
reg   [3:0] reset_cnt;
wire        reset_ff=(reset_cnt != 0);
wire        Xo_tmp12;
wire        lfsr_clk;

  
initial  begin
Xo_tmp=0;
start_lfsr=0;
end

always@(posedge clk)
begin
 if ( electrical_idle )
 begin
   start_lfsr<=0;
 end

`ifdef DTM_ENABLED
  if ( dtm_reset )
   start_lfsr=1;
`else
  if ( reset )
   start_lfsr<=1;
`endif

end


assign      Xo_tmp12 = next_idle_state ? Xo_tmp[0] : ~Xo_tmp[0];

`ifdef DTM_ENABLED

reg enable_lfsr_output;

always@(negedge frm_boundary)
begin
  if ( start_lfsr & ~reset_ff )
     enable_lfsr_output <= 1'b1;
  else
     enable_lfsr_output <= 1'b0;
end


assign      lfsr_output[13:0]=  (enable_lfsr_output) ? {Xo_tmp[0],Xo_tmp12,Xo_tmp[11:0]} : 1'b0 ;


`else
assign      lfsr_output[13:0]=  (start_lfsr & ~reset_ff) ? {Xo_tmp[0],Xo_tmp12,Xo_tmp[11:0]} : 1'b0 ;
`endif

assign      lfsr_clk = next_idle_state;

always@(posedge frm_boundary) if ( start_lfsr | electrical_idle )
  begin
  if (reset_cnt )
    reset_cnt <= reset_cnt - 1;

  if( electrical_idle )
  begin
`ifdef DTM_ENABLED
   reset_cnt=4'h1;
`else
   reset_cnt<=4'hc;
`endif
  end



  end


always @(posedge lfsr_clk) begin
   if ( electrical_idle)
    Xo_tmp<=12'b000000000001;
   else
    Xo_tmp[11:0] <= Xo[11:0];


end


 
`ifdef FBDIMM_FAST

reg        start_lfsr_d7;
`ifdef DTM_ENABLED
always@(negedge frm_begin)
  start_lfsr_d7 <= start_lfsr;
`else
always@(negedge frm_boundary)
  start_lfsr_d7 <= start_lfsr;
`endif

//`endif

`else
wire        start_lfsr_d7;

shifter_p #(1) shft (.signal_in ( start_lfsr ),
                     .signal_out (start_lfsr_d7),
                     .delay_cycles ( 10'h8 ),
                     .clk (clk));
`endif

always@(posedge clk) if ( start_lfsr_d7 | electrical_idle )
begin
     if ( electrical_idle )
     begin
      next_idle_state <= 1;
      curr_state<=0;
     end
     else
     case(curr_state)
       4'h0: begin  curr_state <= 4'h1; end
       4'h1: begin  curr_state <= 4'h2; end
       4'h2: begin  curr_state <= 4'h3; end
       4'h3: begin  curr_state <= 4'h4; end
       4'h4: begin  curr_state <= 4'h5; end
       4'h5: begin  curr_state <= 4'h6; next_idle_state <= ~next_idle_state; end
       4'h6: begin  curr_state <= 4'h7; end
       4'h7: begin  curr_state <= 4'h8; end
       4'h8: begin  curr_state <= 4'h9; end
       4'h9: begin  curr_state <= 4'ha; end
       4'ha: begin  curr_state <= 4'hb;   end
       4'hb: begin  curr_state <= 4'h0; next_idle_state <= ~next_idle_state; end
    endcase
end


always @(posedge lfsr_clk) begin
    if (reset_ff)
	Xo <= 12'b1;
    else begin
       Xo[11] <= Xo[0] ^ Xo[3] ^ Xo[4] ^ Xo[7];
	Xo[10] <= Xo[11];
	Xo[9] <= Xo[10];
	Xo[8] <= Xo[9];
	Xo[7] <= Xo[8];
	Xo[6] <= Xo[7];
	Xo[5] <= Xo[6];
	Xo[4] <= Xo[5];
	Xo[3] <= Xo[4];
	Xo[2] <= Xo[3];
	Xo[1] <= Xo[2];
	Xo[0] <= Xo[1];
    end
end


// Initialization
initial begin
 curr_state=0;
 Xo_tmp=12'b000000000001;
 next_idle_state=1;
 reset_cnt=4'hc;
end

endmodule


`ifdef AXIS_FBDIMM_HW
`else
module chmon_idle_lfsr(reset,
                       pn_prev_in,
                       pn_curr_in,
                       is_idle,
                       frm_begin,
                       alert_frame,
                       nb_config,
                       frm_boundary,
                       clk);
// interface signals
input         reset;
input         clk;
input         is_idle;
input [3:0]   nb_config;
input         frm_begin,frm_boundary;
input  [13:0]       pn_prev_in,pn_curr_in;
output        alert_frame;


// internal registers/wires
reg  [13:0] lfsr_reg;
wire [13:0] Xo, pn_prev_in_map,pn_curr_in_map;
wire [11:0] next_Xo;
reg [13:0]  Xo_tmp_prev;
reg [3:0]   curr_state;
reg         X12,X13;
reg         next_idle_state;
reg         start_lfsr;
reg   [4:0] reset_cnt;
wire        reset_ff=(reset_cnt != 0);
wire        Xo_tmp12;
reg  [11:0]  Xo_tmp;
wire         start_lfsr_d;
reg alert_frame_reg;


assign alert_frame = alert_frame_reg;

assign pn_prev_in_map = (( nb_config == 4'b1111  ))  ? pn_prev_in : // All lanes are good
                         (( nb_config == 4'b1101 ))  ? {pn_prev_in[13:0]}                    : // map nb13 
                         (( nb_config == 4'b1100 ))  ? {pn_prev_in[13]   ,pn_prev_in[11:0]} : // map nb12
                         (( nb_config == 4'b1011 ))  ? {pn_prev_in[13:12],pn_prev_in[10:0]} : // map nb11
                         (( nb_config == 4'b1010 ))  ? {pn_prev_in[13:11],pn_prev_in[09:0]} : // map nb10
                         (( nb_config == 4'b1001 ))  ? {pn_prev_in[13:10],pn_prev_in[08:0]} : // map nb9
                         (( nb_config == 4'b1000 ))  ? {pn_prev_in[13:09],pn_prev_in[07:0]} : // map nb8
                         (( nb_config == 4'b0111 ))  ? {pn_prev_in[13:08],pn_prev_in[06:0]} : // map nb7
                         (( nb_config == 4'b0110 ))  ? {pn_prev_in[13:07],pn_prev_in[05:0]} : // map nb6
                         (( nb_config == 4'b0101 ))  ? {pn_prev_in[13:06],pn_prev_in[04:0]} : // map nb5
                         (( nb_config == 4'b0100 ))  ? {pn_prev_in[13:05],pn_prev_in[03:0]} : // map nb4
                         (( nb_config == 4'b0011 ))  ? {pn_prev_in[13:04],pn_prev_in[02:0]} : // map nb3
                         (( nb_config == 4'b0010 ))  ? {pn_prev_in[13:03],pn_prev_in[01:0]} : // map nb2
                         (( nb_config == 4'b0001 ))  ? {pn_prev_in[13:02],pn_prev_in[0]   } : // map nb1
                         (( nb_config == 4'b0000 ))  ? {pn_prev_in[13:01]}                        : pn_prev_in; // map nb0

assign pn_curr_in_map = (( nb_config == 4'b1111  ))  ? pn_curr_in : // All lanes are good
                         (( nb_config == 4'b1101 ))  ? {pn_curr_in[13:0]}                    : // map nb13 
                         (( nb_config == 4'b1100 ))  ? {pn_curr_in[13]   ,pn_curr_in[11:0]} : // map nb12
                         (( nb_config == 4'b1011 ))  ? {pn_curr_in[13:12],pn_curr_in[10:0]} : // map nb11
                         (( nb_config == 4'b1010 ))  ? {pn_curr_in[13:11],pn_curr_in[09:0]} : // map nb10
                         (( nb_config == 4'b1001 ))  ? {pn_curr_in[13:10],pn_curr_in[08:0]} : // map nb9
                         (( nb_config == 4'b1000 ))  ? {pn_curr_in[13:09],pn_curr_in[07:0]} : // map nb8
                         (( nb_config == 4'b0111 ))  ? {pn_curr_in[13:08],pn_curr_in[06:0]} : // map nb7
                         (( nb_config == 4'b0110 ))  ? {pn_curr_in[13:07],pn_curr_in[05:0]} : // map nb6
                         (( nb_config == 4'b0101 ))  ? {pn_curr_in[13:06],pn_curr_in[04:0]} : // map nb5
                         (( nb_config == 4'b0100 ))  ? {pn_curr_in[13:05],pn_curr_in[03:0]} : // map nb4
                         (( nb_config == 4'b0011 ))  ? {pn_curr_in[13:04],pn_curr_in[02:0]} : // map nb3
                         (( nb_config == 4'b0010 ))  ? {pn_curr_in[13:03],pn_curr_in[01:0]} : // map nb2
                         (( nb_config == 4'b0001 ))  ? {pn_curr_in[13:02],pn_curr_in[0]   } : // map nb1
                         (( nb_config == 4'b0000 ))  ? {pn_curr_in[13:01]}                        : pn_curr_in; // map nb0


always@(negedge frm_boundary)
begin
 if (~reset & is_idle ) 
 begin
  if ( ( pn_curr_in_map !== 14'h0 ) && ( pn_prev_in_map !== 14'h0 ) )
  begin
   if (
       ( pn_curr_in_map[0] == pn_prev_in_map[01] ) &&
       ( pn_curr_in_map[1] == pn_prev_in_map[02] ) &&
       ( pn_curr_in_map[2] == pn_prev_in_map[03] ) &&
       ( pn_curr_in_map[3] == pn_prev_in_map[04] ) &&
       ( pn_curr_in_map[4] == pn_prev_in_map[05] ) &&
       ( pn_curr_in_map[5] == pn_prev_in_map[06] ) &&
       ( pn_curr_in_map[6] == pn_prev_in_map[07] ) &&
       ( pn_curr_in_map[7] == pn_prev_in_map[08] ) &&
       ( pn_curr_in_map[8] == pn_prev_in_map[09] ) &&
       ( pn_curr_in_map[9] == pn_prev_in_map[10] ) &&
       ( pn_curr_in_map[10] == pn_prev_in_map[11] ) &&
       ( pn_curr_in_map[11] == ( pn_prev_in_map[00] ^ pn_prev_in_map[3] ^ pn_prev_in_map[4] ^ pn_prev_in_map[7]) ) )
   // this is an expected idle frame
     alert_frame_reg <= 0;
    else
     alert_frame_reg <= 1;
  end // if ( ( pn_curr_in !== 14'h0 ) && ( pn_prev_in !== 14'h0 ) )
  end // (~reset & is_idle )
 else
   alert_frame_reg <=0 ;

end

endmodule

`endif



`endif
