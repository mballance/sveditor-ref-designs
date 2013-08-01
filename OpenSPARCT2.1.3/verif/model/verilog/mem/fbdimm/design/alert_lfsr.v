// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: alert_lfsr.v
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
module alert_lfsr(enable,reset,lfsr_output,clk);
// interface signals
input         enable;
input         reset;
input         clk;
output [13:0] lfsr_output;
// internal registers/wires
reg  [13:0] lfsr_reg;
reg [11:0] Xo;
reg [4:0]   transfer_count;
reg [13:0]  Xo_tmp;
reg [3:0]   curr_state;
reg         X12,X13;
reg         next_idle_state;
reg         start_lfsr;
reg   [3:0] reset_cnt;
wire        reset_ff=(reset_cnt == 4'hf);
wire        Xo_tmp12;
  
initial  start_lfsr=0;

always@(posedge clk)
  if ( reset )
   start_lfsr=1;

wire [13:0] lfsr_output_tmp;
assign      Xo_tmp12 = next_idle_state ? Xo_tmp[0] : ~Xo_tmp[0];
assign      lfsr_output_tmp=  (start_lfsr & ~reset_ff) ? {Xo_tmp[0],Xo_tmp12,Xo_tmp[11:0]} : 1'b0 ;

assign lfsr_output = ~ lfsr_output_tmp;

wire lfsr_clk = next_idle_state;
always@(posedge lfsr_clk) if ( enable) 
  begin
  if (reset_cnt)
    reset_cnt=reset_cnt-1;
  end

always @(posedge lfsr_clk) begin if ( enable )
   Xo_tmp[11:0] <= Xo[11:0];
end


 

always@(posedge clk) if ( start_lfsr & enable )
begin
     case(curr_state)
       4'h0: begin  curr_state <= 1; end
       4'h1: begin  curr_state <= 2; end
       4'h2: begin  curr_state <= 3; end
       4'h3: begin  curr_state <= 4; end
       4'h4: begin  curr_state <= 5; end
       4'h5: begin  curr_state <= 6; next_idle_state <= ~next_idle_state; end
       4'h6: begin  curr_state <= 7; end
       4'h7: begin  curr_state <= 8; end
       4'h8: begin  curr_state <= 9; end
       4'h9: begin  curr_state <= 4'ha; end
       4'ha: begin  curr_state <= 4'hb;   end
       4'hb: begin  curr_state <= 0; next_idle_state <= ~next_idle_state; end
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
 reset_cnt=4'hf;
end

endmodule
