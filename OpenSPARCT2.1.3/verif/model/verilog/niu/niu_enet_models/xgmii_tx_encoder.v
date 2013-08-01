// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xgmii_tx_encoder.v
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
`define XAUI_ENC_COM		8'h07  //K28.5 8'hBC?  ||K|| Sync Col
`define XAUI_ENC_SDP		8'hFB
`define XAUI_ENC_EGP		8'hFD
`define XAUI_ENC_EBP		8'hFE
`define XAUI_ENC_SEQ		8'h9c
`define XAUI_ENC_ALN		8'h7c 
`define XAUI_ENC_SKP		8'h1c 
`define XAUI_ENC_ERROR          8'h00

module xgmii_tx_encoder (
		tx_clk,
		tx_rst,
		
		tx_8b_enc_in,
		special,

                idle_cycle,
                is16,
                even,
                eop,
		
		RDreg,		
		tx_10b_enc_out);

input		tx_clk;			// 250 MHz TX clk
input		tx_rst;	         	// synchronous reset
input		idle_cycle;	         	// synchronous reset
input		even;	         	// synchronous reset
input		is16;	         	// synchronous reset
input		eop;	         	// synchronous reset

input	[7:0] 	tx_8b_enc_in;		// incoming byte
input   	special;		// used for special characters

output		RDreg;			// running disparity of last data
output	[9:0] 	tx_10b_enc_out;		// outgoing 10 bits encoded

parameter	lane_num = 0;
wire		pos_disp;
reg	[7:0] 	tx_8b_enc_int;		// incoming byte

reg		RDreg;

wire	[9:0] 	tx_10b_enc_out_int;		

reg	[9:0]	tx_10b_enc_out_pri;
reg	[9:0]	tx_10b_enc_out_sp;
reg		pos_disp_pri;
reg		pos_disp_sp;

reg	[9:0] 	tx_10b_enc_out;		// outgoing 10 bits encoded

reg  		invalids_s_symbol;
initial		invalids_s_symbol = 0;
`ifdef AXIS
`else // AXIS

// The following code is to assert invalids to the 10 bit vectors to bring link down
//reg  		invalids_s_symbol;
reg  		invalids_d_symbol;
reg	[63:0] 	invalids_start_time;
reg	[63:0] 	invalids_repeat_interval;
reg	[63:0] 	invalids_curr_time;
integer	 	invalids_repeat_count;
integer	 	invalids_repeat_count_curr;
integer 	invalids_type;
integer 	invalids_first_time;
integer 	valid_symbols_max = 464;
integer 	valid_symbols_curr;
integer 	invalid_symbols_max = 560;
integer 	invalid_symbols_curr;
integer 	timescale_factor = 1000; // To get to ns
reg     	invalids_assertion_is_done;
reg 	[9:0] 	valid_symbols [1023:0];
reg 	[4:0] 	random_invalid_symbols;
reg 	[9:0] 	invalid_symbols [1023:0];
integer		ret;

initial
begin
   //invalids_s_symbol = 0;
   invalids_d_symbol = 0;
   invalids_start_time = 0;
   invalids_type = 0;
   invalids_first_time = 1;
   random_invalid_symbols = $random;
   invalids_repeat_interval = 9999999; // very high value
   invalids_repeat_count = 10; // 10 repeats by default
   invalids_repeat_count_curr = 0;
   invalids_assertion_is_done = 0;
   valid_symbols_curr = 0;
   invalid_symbols_curr = 0;

   // Collect type of errors to introduce
   if ($test$plusargs("invalids_type=")) begin
       ret = $value$plusargs("invalids_type=%d", invalids_type);
   end

   // Collect start time to corrupt bit vectors
   if ($test$plusargs("invalids_start_time=")) begin
       ret = $value$plusargs("invalids_start_time=%d", invalids_start_time);
       invalids_start_time = invalids_start_time * timescale_factor;
   end

   // Collect repeat interval
   if ($test$plusargs("invalids_repeat_interval=")) begin
       ret = $value$plusargs("invalids_repeat_interval=%d", invalids_repeat_interval);
       invalids_repeat_interval = invalids_repeat_interval * timescale_factor;
   end

   // Collect repeat count
   if ($test$plusargs("invalids_repeat_count=")) begin
       ret = $value$plusargs("invalids_repeat_count=%d", invalids_repeat_count);
   end

   // Wait for this much amount of time to start asserting invalids
   if(invalids_first_time == 1 && invalids_start_time != 0) begin
      invalids_first_time = 0;
      #(invalids_start_time);
      // Wait for 1 tx_clk to to get in sync
      @(posedge tx_clk);
      #1;
      $display("<%0d> Asserting invalid code Start %m", $time);
   end

   while((invalids_assertion_is_done == 0) && (invalids_start_time != 0)) begin

         random_invalid_symbols = $random;

        if(invalids_type == 1) begin	// Corrupt only s symbols
           invalids_s_symbol = 1;
	end
        if(invalids_type == 2) begin	// Corrupt only d symbols
           invalids_d_symbol = 1;
	end
        if(invalids_type == 3) begin	// Corrupt both s and d symbols
           invalids_d_symbol = 1;
           invalids_s_symbol = 1;
        end
        if(invalids_type == 4) begin	// Corrupt s and d symbols randomly
           invalids_d_symbol = $random & 32'h1;
           invalids_s_symbol = $random & 32'h1;
        end
        if(invalids_type == 5) begin	// Assert all valid and invalid symbols
	   if(valid_symbols_curr < valid_symbols_max) begin
	      $display("<%0d> Asserting valid code %b lane_num:%0d index:%0d %m", 
	               $time, 
		       valid_symbols[lane_num + valid_symbols_curr], 
		       lane_num,
		       lane_num + valid_symbols_curr);
	      force tx_10b_enc_out_pri = valid_symbols[lane_num + valid_symbols_curr];
	      valid_symbols_curr = valid_symbols_curr + 4;
	   end
	   else if (invalid_symbols_curr < invalid_symbols_max) begin
	      $display("<%0d> Asserting invalid code %b lane_num:%0d index:%0d %m", 
	               $time, 
		       invalid_symbols[lane_num + invalid_symbols_curr], 
		       lane_num,
		       lane_num + invalid_symbols_curr);
	      force tx_10b_enc_out_pri = invalid_symbols[lane_num + invalid_symbols_curr];
	      invalid_symbols_curr = invalid_symbols_curr + 4;
	   end
        end

        if(invalids_s_symbol)
           $display("<%0d> Asserting invalids_s_symbol %m", $time);
        if(invalids_d_symbol) begin
           $display("<%0d> Asserting invalids_d_symbol %m", $time);
	   if(random_invalid_symbols < 4) 
               force tx_10b_enc_out_pri = 10'h3FF;
	   else if(random_invalid_symbols < 8)
               force tx_10b_enc_out_pri = 10'h000;
	   else
               force tx_10b_enc_out_pri = $random & 10'h3FF;
        end

	if(invalid_symbols_curr >= invalid_symbols_max & 
	   valid_symbols_curr >= valid_symbols_curr) begin
	   invalid_symbols_curr = 0;
	   valid_symbols_curr = 0;
	end

	if(invalid_symbols_curr == 0 & valid_symbols_curr == 0) begin
	   invalids_repeat_count_curr = invalids_repeat_count_curr + 1;
	   #(invalids_repeat_interval);
	end
	if(invalids_repeat_count_curr >= invalids_repeat_count) begin
	   invalids_assertion_is_done = 1;
           $display("<%0d> Asserting invalid code End %m", $time);
	end

        invalids_s_symbol = 0;
        invalids_d_symbol = 0;
	
	if(invalids_type == 5) begin
	   // Wait for 1 tx_clk to walk all valid and invalid symbols
	   @(posedge tx_clk);
	   #1;
	end

        release tx_10b_enc_out_pri;

   end // while(1)
end
`endif // AXIS

always @(even or tx_8b_enc_in or idle_cycle or is16 or eop or invalids_s_symbol)
  begin
   if(invalids_s_symbol) begin
      tx_8b_enc_int = `XAUI_ENC_ERROR;
   end else if (idle_cycle )
     begin
       if ((even & ~is16) | eop ) 
            tx_8b_enc_int = `XAUI_ENC_COM;
        else if (is16 ) 
            tx_8b_enc_int = `XAUI_ENC_ALN;
        else 
            tx_8b_enc_int = `XAUI_ENC_SKP;
     end
    else
            tx_8b_enc_int = tx_8b_enc_in; 
  end
    
   
 
// Register disparity

always @ (posedge tx_clk )
  if (tx_rst)
    RDreg <=  1'b0;
  else
    RDreg <=  pos_disp;

assign pos_disp       = special ? pos_disp_sp       : pos_disp_pri;


always @ (posedge tx_clk )
 begin
  if(tx_rst)
     tx_10b_enc_out <= 10'h0;
  else  begin
     tx_10b_enc_out[9:0] <=  {tx_10b_enc_out_int[0],tx_10b_enc_out_int[1],
                              tx_10b_enc_out_int[2],tx_10b_enc_out_int[3],
                              tx_10b_enc_out_int[4],tx_10b_enc_out_int[5],
                              tx_10b_enc_out_int[6],tx_10b_enc_out_int[7],
                              tx_10b_enc_out_int[8],tx_10b_enc_out_int[9]};
   end
 end
     
/* assign tx_10b_enc_out[9:0] = {tx_10b_enc_out_int[0],tx_10b_enc_out_int[1],
                              tx_10b_enc_out_int[2],tx_10b_enc_out_int[3],
                              tx_10b_enc_out_int[4],tx_10b_enc_out_int[5],
                              tx_10b_enc_out_int[6],tx_10b_enc_out_int[7],
                              tx_10b_enc_out_int[8],tx_10b_enc_out_int[9]}; */ 

assign tx_10b_enc_out_int = special ? tx_10b_enc_out_sp : tx_10b_enc_out_pri;


//assign tx_8b_enc_int =  (even ==1) ? `XAUI_ENC_SKP: `XAUI_ENC_COM ;  
 

// Encode data byte

always @ (tx_8b_enc_in or RDreg)
  case (tx_8b_enc_in[7:0]) //####SYNOPSYS parallel_case full_case
			   //if RD-, choose 1st, if RD+ choose 2nd
			 
	8'h00: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1001110100 : 10'b0110001011), RDreg};
	8'h01: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0111010100 : 10'b1000101011), RDreg};
	8'h02: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1011010100 : 10'b0100101011), RDreg};
	8'h03: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1100011011 : 10'b1100010100), !RDreg};

	8'h04: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1101010100 : 10'b0010101011), RDreg};
	8'h05: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1010011011 : 10'b1010010100), !RDreg};
	8'h06: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0110011011 : 10'b0110010100), !RDreg};
	8'h07: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1110001011 : 10'b0001110100), !RDreg};

	8'h08: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1110010100 : 10'b0001101011), RDreg};
	8'h09: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1001011011 : 10'b1001010100), !RDreg};
	8'h0a: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0101011011 : 10'b0101010100), !RDreg};
	8'h0b: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1101001011 : 10'b1101000100), !RDreg};

	8'h0c: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0011011011 : 10'b0011010100), !RDreg};
	8'h0d: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1011001011 : 10'b1011000100), !RDreg};
	8'h0e: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0111001011 : 10'b0111000100), !RDreg};
	8'h0f: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0101110100 : 10'b1010001011), RDreg};

	8'h10: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0110110100 : 10'b1001001011), RDreg};
	8'h11: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1000111011 : 10'b1000110100), !RDreg};
	8'h12: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0100111011 : 10'b0100110100), !RDreg};
	8'h13: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1100101011 : 10'b1100100100), !RDreg};

	8'h14: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0010111011 : 10'b0010110100), !RDreg};
	8'h15: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1010101011 : 10'b1010100100), !RDreg};
	8'h16: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0110101011 : 10'b0110100100), !RDreg};
	8'h17: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1110100100 : 10'b0001011011), RDreg};

	8'h18: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1100110100 : 10'b0011001011), RDreg};
	8'h19: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1001101011 : 10'b1001100100), !RDreg};
	8'h1a: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0101101011 : 10'b0101100100), !RDreg};
	8'h1b: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1101100100 : 10'b0010011011), RDreg};

	8'h1c: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0011101011 : 10'b0011100100), !RDreg};
	8'h1d: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1011100100 : 10'b0100011011), RDreg};
	8'h1e: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0111100100 : 10'b1000011011), RDreg};
	8'h1f: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1010110100 : 10'b0101001011), RDreg};

	8'h20: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1001111001 : 10'b0110001001), !RDreg};
	8'h21: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0111011001 : 10'b1000101001), !RDreg};
	8'h22: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1011011001 : 10'b0100101001), !RDreg};
	8'h23: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1100011001), RDreg};

	8'h24: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1101011001 : 10'b0010101001), !RDreg};
	8'h25: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1010011001), RDreg};
	8'h26: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0110011001), RDreg};
	8'h27: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1110001001 : 10'b0001111001), RDreg};

	8'h28: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1110011001 : 10'b0001101001), !RDreg};
	8'h29: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1001011001), RDreg};
	8'h2a: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0101011001), RDreg};
	8'h2b: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1101001001), RDreg};

	8'h2c: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0011011001), RDreg};
	8'h2d: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1011001001), RDreg};
	8'h2e: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0111001001), RDreg};
	8'h2f: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0101111001 : 10'b1010001001), !RDreg};

	8'h30: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0110111001 : 10'b1001001001), !RDreg};
	8'h31: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1000111001), RDreg};
	8'h32: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0100111001), RDreg};
	8'h33: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1100101001), RDreg};

	8'h34: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0010111001), RDreg};
	8'h35: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1010101001), RDreg};
	8'h36: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0110101001), RDreg};
	8'h37: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1110101001 : 10'b0001011001), !RDreg};

	8'h38: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1100111001 : 10'b0011001001), !RDreg};
	8'h39: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1001101001), RDreg};
	8'h3a: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0101101001), RDreg};
	8'h3b: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1101101001 : 10'b0010011001), !RDreg};

	8'h3c: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0011101001), RDreg};
	8'h3d: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1011101001 : 10'b0100011001), !RDreg};
	8'h3e: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0111101001 : 10'b1000011001), !RDreg};
	8'h3f: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1010111001 : 10'b0101001001), !RDreg};

	8'h40: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1001110101 : 10'b0110000101), !RDreg};
	8'h41: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0111010101 : 10'b1000100101), !RDreg};
	8'h42: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1011010101 : 10'b0100100101), !RDreg};
	8'h43: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1100010101 : 10'b1100010101), RDreg};

	8'h44: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1101010101 : 10'b0010100101), !RDreg};
	8'h45: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1010010101), RDreg};
	8'h46: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0110010101), RDreg};
	8'h47: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1110000101 : 10'b0001110101), RDreg};

	8'h48: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1110010101 : 10'b0001100101), !RDreg};
	8'h49: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1001010101), RDreg};
	8'h4a: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0101010101), RDreg};
	8'h4b: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1101000101), RDreg};

	8'h4c: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0011010101), RDreg};
	8'h4d: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1011000101), RDreg};
	8'h4e: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0111000101), RDreg};
	8'h4f: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0101110101 : 10'b1010000101), !RDreg};

	8'h50: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0110110101 : 10'b1001000101), !RDreg};
	8'h51: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1000110101), RDreg};
	8'h52: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0100110101), RDreg};
	8'h53: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1100100101), RDreg};

	8'h54: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0010110101), RDreg};
	8'h55: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1010100101), RDreg};
	8'h56: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0110100101), RDreg};
	8'h57: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1110100101 : 10'b0001010101), !RDreg};

	8'h58: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1100110101 : 10'b0011000101), !RDreg};
	8'h59: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1001100101), RDreg};
	8'h5a: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0101100101), RDreg};
	8'h5b: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1101100101 : 10'b0010010101), !RDreg};

	8'h5c: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0011100101), RDreg};
	8'h5d: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1011100101 : 10'b0100010101), !RDreg};
	8'h5e: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0111100101 : 10'b1000010101), !RDreg};
	8'h5f: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1010110101 : 10'b0101000101), !RDreg};

	8'h60: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1001110011 : 10'b0110001100), !RDreg};
	8'h61: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0111010011 : 10'b1000101100), !RDreg};
	8'h62: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1011010011 : 10'b0100101100), !RDreg};
	8'h63: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1100011100 : 10'b1100010011), RDreg};

	8'h64: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1101010011 : 10'b0010101100), !RDreg};
	8'h65: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1010011100 : 10'b1010010011), RDreg};
	8'h66: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0110011100 : 10'b0110010011), RDreg};
	8'h67: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1110001100 : 10'b0001110011), RDreg};

	8'h68: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1110010011 : 10'b0001101100), !RDreg};
	8'h69: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1001011100 : 10'b1001010011), RDreg};
	8'h6a: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0101011100 : 10'b0101010011), RDreg};
	8'h6b: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1101001100 : 10'b1101000011), RDreg};

	8'h6c: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0011011100 : 10'b0011010011), RDreg};
	8'h6d: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1011001100 : 10'b1011000011), RDreg};
	8'h6e: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0111001100 : 10'b0111000011), RDreg};
	8'h6f: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0101110011 : 10'b1010001100), !RDreg};

	8'h70: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0110110011 : 10'b1001001100), !RDreg};
	8'h71: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1000111100 : 10'b1000110011), RDreg};
	8'h72: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0100111100 : 10'b0100110011), RDreg};
	8'h73: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1100101100 : 10'b1100100011), RDreg};

	8'h74: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0010111100 : 10'b0010110011), RDreg};
	8'h75: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1010101100 : 10'b1010100011), RDreg};
	8'h76: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0110101100 : 10'b0110100011), RDreg};
	8'h77: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1110100011 : 10'b0001011100), !RDreg};

	8'h78: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1100110011 : 10'b0011001100), !RDreg};
	8'h79: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1001101100 : 10'b1001100011), RDreg};
	8'h7a: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0101101100 : 10'b0101100011), RDreg};
	8'h7b: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1101100011 : 10'b0010011100), !RDreg};

	8'h7c: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0011101100 : 10'b0011100011), RDreg};
	8'h7d: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1011100011 : 10'b0100011100), !RDreg};
	8'h7e: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0111100011 : 10'b1000011100), !RDreg};
	8'h7f: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1010110011 : 10'b0101001100), !RDreg};

	8'h80: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1001110010 : 10'b0110001101), RDreg};
	8'h81: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0111010010 : 10'b1000101101), RDreg};
	8'h82: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1011010010 : 10'b0100101101), RDreg};
	8'h83: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1100011101 : 10'b1100010010), !RDreg};

	8'h84: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1101010010 : 10'b0010101101), RDreg};
	8'h85: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1010011101 : 10'b1010010010), !RDreg};
	8'h86: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0110011101 : 10'b0110010010), !RDreg};
	8'h87: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1110001101 : 10'b0001110010), !RDreg};

	8'h88: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1110010010 : 10'b0001101101), RDreg};
	8'h89: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1001011101 : 10'b1001010010), !RDreg};
	8'h8a: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0101011101 : 10'b0101010010), !RDreg};
	8'h8b: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1101001101 : 10'b1101000010), !RDreg};

	8'h8c: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0011011101 : 10'b0011010010), !RDreg};
	8'h8d: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1011001101 : 10'b1011000010), !RDreg};
	8'h8e: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0111001101 : 10'b0111000010), !RDreg};
	8'h8f: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0101110010 : 10'b1010001101), RDreg};

	8'h90: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0110110010 : 10'b1001001101), RDreg};
	8'h91: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1000111101 : 10'b1000110010), !RDreg};
	8'h92: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0100111101 : 10'b0100110010), !RDreg};
	8'h93: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1100101101 : 10'b1100100010), !RDreg};

	8'h94: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0010111101 : 10'b0010110010), !RDreg};
	8'h95: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1010101101 : 10'b1010100010), !RDreg};
	8'h96: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0110101101 : 10'b0110100010), !RDreg};
	8'h97: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1110100010 : 10'b0001011101), RDreg};
	
	8'h98: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1100110010 : 10'b0011001101), RDreg};
	8'h99: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1001101101 : 10'b1001100010), !RDreg};
	8'h9a: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0101101101 : 10'b0101100010), !RDreg};
	8'h9b: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1101100010 : 10'b0010011101), RDreg};

	8'h9c: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0011101101 : 10'b0011100010), !RDreg};
	8'h9d: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1011100010 : 10'b0100011101), RDreg};
	8'h9e: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0111100010 : 10'b1000011101), RDreg};
	8'h9f: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1010110010 : 10'b0101001101), RDreg};

	8'ha0: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1001111010 : 10'b0110001010), !RDreg};
	8'ha1: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0111011010 : 10'b1000101010), !RDreg};
	8'ha2: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1011011010 : 10'b0100101010), !RDreg};
	8'ha3: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1100011010 : 10'b1100011010), RDreg};

	8'ha4: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1101011010 : 10'b0010101010), !RDreg};
	8'ha5: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1010011010), RDreg};
	8'ha6: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0110011010), RDreg};
 	8'ha7: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1110001010 : 10'b0001111010), RDreg};

	8'ha8: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1110011010 : 10'b0001101010), !RDreg};
	8'ha9: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1001011010), RDreg};
	8'haa: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0101011010), RDreg};
	8'hab: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1101001010), RDreg};

	8'hac: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0011011010), RDreg};
	8'had: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1011001010), RDreg};
	8'hae: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0111001010), RDreg};
	8'haf: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0101111010 : 10'b1010001010), !RDreg};

	8'hb0: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0110111010 : 10'b1001001010), !RDreg};
	8'hb1: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1000111010), RDreg};
	8'hb2: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0100111010), RDreg};
	8'hb3: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1100101010), RDreg};

	8'hb4: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0010111010), RDreg};
	8'hb5: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1010101010), RDreg};
	8'hb6: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0110101010), RDreg};
	8'hb7: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1110101010 : 10'b0001011010), !RDreg};
	
	8'hb8: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1100111010 : 10'b0011001010), !RDreg};
	8'hb9: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1001101010), RDreg};
	8'hba: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0101101010), RDreg};
	8'hbb: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1101101010 : 10'b0010011010), !RDreg};

	8'hbc: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0011101010), RDreg};
	8'hbd: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1011101010 : 10'b0100011010), !RDreg};
	8'hbe: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0111101010 : 10'b1000011010), !RDreg};
	8'hbf: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1010111010 : 10'b0101001010), !RDreg};

	8'hc0: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1001110110 : 10'b0110000110), !RDreg};
	8'hc1: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0111010110 : 10'b1000100110), !RDreg};
	8'hc2: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1011010110 : 10'b0100100110), !RDreg};
	8'hc3: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1100010110), RDreg};

	8'hc4: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1101010110 : 10'b0010100110), !RDreg};
	8'hc5: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1010010110), RDreg};
	8'hc6: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0110010110), RDreg};
	8'hc7: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1110000110 : 10'b0001110110), RDreg};

	8'hc8: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1110010110 : 10'b0001100110), !RDreg};
	8'hc9: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1001010110), RDreg};
	8'hca: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0101010110), RDreg};
	8'hcb: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1101000110), RDreg};

	8'hcc: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0011010110), RDreg};
	8'hcd: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1011000110), RDreg};
	8'hce: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0111000110), RDreg};
	8'hcf: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0101110110 : 10'b1010000110), !RDreg};

	8'hd0: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0110110110 : 10'b1001000110), !RDreg};
	8'hd1: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1000110110), RDreg};
	8'hd2: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0100110110), RDreg};
	8'hd3: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1100100110), RDreg};
	
	8'hd4: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0010110110), RDreg};
	8'hd5: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1010100110), RDreg};
	8'hd6: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0110100110), RDreg};
	8'hd7: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1110100110 : 10'b0001010110), !RDreg};

	8'hd8: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1100110110 : 10'b0011000110), !RDreg};
	8'hd9: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b1001100110), RDreg};
	8'hda: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0101100110), RDreg};
	8'hdb: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1101100110 : 10'b0010010110), !RDreg};

	8'hdc: {tx_10b_enc_out_pri, pos_disp_pri} = {(10'b0011100110), RDreg};
	8'hdd: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1011100110 : 10'b0100010110), !RDreg};
	8'hde: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0111100110 : 10'b1000010110), !RDreg};
	8'hdf: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1010110110 : 10'b0101000110), !RDreg};

	8'he0: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1001110001 : 10'b0110001110), RDreg};
	8'he1: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0111010001 : 10'b1000101110), RDreg};
	8'he2: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1011010001 : 10'b0100101110), RDreg};
	8'he3: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1100011110 : 10'b1100010001), !RDreg};

	8'he4: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1101010001 : 10'b0010101110), RDreg};
	8'he5: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1010011110 : 10'b1010010001), !RDreg};
	8'he6: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0110011110 : 10'b0110010001), !RDreg};
	8'he7: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1110001110 : 10'b0001110001), !RDreg};

	8'he8: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1110010001 : 10'b0001101110), RDreg};
	8'he9: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1001011110 : 10'b1001010001), !RDreg};
	8'hea: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0101011110 : 10'b0101010001), !RDreg};
	8'heb: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1101001110 : 10'b1101001000), !RDreg};

	8'hec: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0011011110 : 10'b0011010001), !RDreg};
	8'hed: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1011001110 : 10'b1011001000), !RDreg};
	8'hee: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0111001110 : 10'b0111001000), !RDreg};
	8'hef: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0101110001 : 10'b1010001110), RDreg};

	8'hf0: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0110110001 : 10'b1001001110), RDreg};
	8'hf1: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1000110111 : 10'b1000110001), !RDreg};
	8'hf2: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0100110111 : 10'b0100110001), !RDreg};
	8'hf3: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1100101110 : 10'b1100100001), !RDreg};
	
	8'hf4: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0010110111 : 10'b0010110001), !RDreg};
	8'hf5: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1010101110 : 10'b1010100001), !RDreg};
	8'hf6: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0110101110 : 10'b0110100001), !RDreg};
	8'hf7: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1110100001 : 10'b0001011110), RDreg};
	
	8'hf8: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1100110001 : 10'b0011001110), RDreg};
	8'hf9: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1001101110 : 10'b1001100001), !RDreg};
	8'hfa: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0101101110 : 10'b0101100001), !RDreg};
	8'hfb: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1101100001 : 10'b0010011110), RDreg};

	8'hfc: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0011101110 : 10'b0011100001), !RDreg};
	8'hfd: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1011100001 : 10'b0100011110), RDreg};
	8'hfe: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b0111100001 : 10'b1000011110), RDreg};
	8'hff: {tx_10b_enc_out_pri, pos_disp_pri} = {(!RDreg ? 10'b1010110001 : 10'b0101001110), RDreg};
  endcase	

// Encode Control Symbols

always @ (tx_8b_enc_int or RDreg)
  case (tx_8b_enc_int[7:0]) //#####SYNOPSYS full_case parallel_case
			   //if RD-, choose 1st, if RD+ choose 2nd

// XGMII  Required Symbols

	`XAUI_ENC_COM :		// 8'h07	- K28.5 - COM (Comma, character boundary alignment symbol)
		{tx_10b_enc_out_sp, pos_disp_sp} = {(!RDreg ? 10'b0011111010 : 10'b1100000101), !RDreg};	
	`XAUI_ENC_SDP :		// 8'hFB - K27.7 - SDP (Start of data packet delimiter)
		{tx_10b_enc_out_sp, pos_disp_sp} = {(!RDreg ? 10'b1101101000 : 10'b0010010111), RDreg};
	`XAUI_ENC_EGP :		// 8'hFD - K29.7 - EGP (End of good packet delimiter)
		{tx_10b_enc_out_sp, pos_disp_sp} = {(!RDreg ? 10'b1011101000 : 10'b0100010111), RDreg};	
	`XAUI_ENC_EBP : 	// 8'hFE - K30.7 - EBP (End of bad packet delimiter)
		{tx_10b_enc_out_sp, pos_disp_sp} = {(!RDreg ? 10'b0111101000 : 10'b1000010111), RDreg};
	`XAUI_ENC_SEQ :		// 8'h9C - K28.4 - Sequence 
		{tx_10b_enc_out_sp, pos_disp_sp} = {(!RDreg ? 10'b0011110010 : 10'b1100001101), RDreg};
	`XAUI_ENC_SKP :		// 8'h1C - K28.0 - SKP (Skip symbol)
		{tx_10b_enc_out_sp, pos_disp_sp} = {(!RDreg ? 10'b0011110100 : 10'b1100001011), RDreg};
	`XAUI_ENC_ALN :		// 4'h8 - K28.3 -  ALN (Align Symbol) 
		{tx_10b_enc_out_sp, pos_disp_sp} = {(!RDreg ? 10'b0011110011 : 10'b1100001100), !RDreg};
	`XAUI_ENC_ERROR:
		{tx_10b_enc_out_sp, pos_disp_sp} = {(!RDreg ? 10'b1111111111 : 10'b1111111111), !RDreg};


// Reserved Symbols
		

// Extra Symbols - To Disable A Port
		
  endcase

`ifdef AXIS
`else // AXIS
initial
begin

   valid_symbols[0] = 10'b0001010101;
   valid_symbols[1] = 10'b0001010110;
   valid_symbols[2] = 10'b0001010111;
   valid_symbols[3] = 10'b0001011001;
   valid_symbols[4] = 10'b0001011010;
   valid_symbols[5] = 10'b0001011011;
   valid_symbols[6] = 10'b0001011100;
   valid_symbols[7] = 10'b0001011101;
   valid_symbols[8] = 10'b0001011110;
   valid_symbols[9] = 10'b0001100101;
   valid_symbols[10] = 10'b0001100110;
   valid_symbols[11] = 10'b0001101001;
   valid_symbols[12] = 10'b0001101010;
   valid_symbols[13] = 10'b0001101011;
   valid_symbols[14] = 10'b0001101100;
   valid_symbols[15] = 10'b0001101101;
   valid_symbols[16] = 10'b0001101110;
   valid_symbols[17] = 10'b0001110001;
   valid_symbols[18] = 10'b0001110010;
   valid_symbols[19] = 10'b0001110011;
   valid_symbols[20] = 10'b0001110100;
   valid_symbols[21] = 10'b0001110101;
   valid_symbols[22] = 10'b0001110110;
   valid_symbols[23] = 10'b0001111001;
   valid_symbols[24] = 10'b0001111010;
   valid_symbols[25] = 10'b0010010101;
   valid_symbols[26] = 10'b0010010110;
   valid_symbols[27] = 10'b0010010111;
   valid_symbols[28] = 10'b0010011001;
   valid_symbols[29] = 10'b0010011010;
   valid_symbols[30] = 10'b0010011011;
   valid_symbols[31] = 10'b0010011100;
   valid_symbols[32] = 10'b0010011101;
   valid_symbols[33] = 10'b0010011110;
   valid_symbols[34] = 10'b0010100101;
   valid_symbols[35] = 10'b0010100110;
   valid_symbols[36] = 10'b0010101001;
   valid_symbols[37] = 10'b0010101010;
   valid_symbols[38] = 10'b0010101011;
   valid_symbols[39] = 10'b0010101100;
   valid_symbols[40] = 10'b0010101101;
   valid_symbols[41] = 10'b0010101110;
   valid_symbols[42] = 10'b0010110001;
   valid_symbols[43] = 10'b0010110010;
   valid_symbols[44] = 10'b0010110011;
   valid_symbols[45] = 10'b0010110100;
   valid_symbols[46] = 10'b0010110101;
   valid_symbols[47] = 10'b0010110110;
   valid_symbols[48] = 10'b0010110111;
   valid_symbols[49] = 10'b0010111001;
   valid_symbols[50] = 10'b0010111010;
   valid_symbols[51] = 10'b0010111011;
   valid_symbols[52] = 10'b0010111100;
   valid_symbols[53] = 10'b0010111101;
   valid_symbols[54] = 10'b0011000101;
   valid_symbols[55] = 10'b0011000110;
   valid_symbols[56] = 10'b0011001001;
   valid_symbols[57] = 10'b0011001010;
   valid_symbols[58] = 10'b0011001011;
   valid_symbols[59] = 10'b0011001100;
   valid_symbols[60] = 10'b0011001101;
   valid_symbols[61] = 10'b0011001110;
   valid_symbols[62] = 10'b0011010001;
   valid_symbols[63] = 10'b0011010010;
   valid_symbols[64] = 10'b0011010011;
   valid_symbols[65] = 10'b0011010100;
   valid_symbols[66] = 10'b0011010101;
   valid_symbols[67] = 10'b0011010110;
   valid_symbols[68] = 10'b0011011001;
   valid_symbols[69] = 10'b0011011010;
   valid_symbols[70] = 10'b0011011011;
   valid_symbols[71] = 10'b0011011100;
   valid_symbols[72] = 10'b0011011101;
   valid_symbols[73] = 10'b0011011110;
   valid_symbols[74] = 10'b0011100001;
   valid_symbols[75] = 10'b0011100010;
   valid_symbols[76] = 10'b0011100011;
   valid_symbols[77] = 10'b0011100100;
   valid_symbols[78] = 10'b0011100101;
   valid_symbols[79] = 10'b0011100110;
   valid_symbols[80] = 10'b0011101001;
   valid_symbols[81] = 10'b0011101010;
   valid_symbols[82] = 10'b0011101011;
   valid_symbols[83] = 10'b0011101100;
   valid_symbols[84] = 10'b0011101101;
   valid_symbols[85] = 10'b0011101110;
   valid_symbols[86] = 10'b0011110010;
   valid_symbols[87] = 10'b0011110011;
   valid_symbols[88] = 10'b0011110100;
   valid_symbols[89] = 10'b0011110101;
   valid_symbols[90] = 10'b0011110110;
   valid_symbols[91] = 10'b0011111000;
   valid_symbols[92] = 10'b0011111001;
   valid_symbols[93] = 10'b0011111010;
   valid_symbols[94] = 10'b0100010101;
   valid_symbols[95] = 10'b0100010110;
   valid_symbols[96] = 10'b0100010111;
   valid_symbols[97] = 10'b0100011001;
   valid_symbols[98] = 10'b0100011010;
   valid_symbols[99] = 10'b0100011011;
   valid_symbols[100] = 10'b0100011100;
   valid_symbols[101] = 10'b0100011101;
   valid_symbols[102] = 10'b0100011110;
   valid_symbols[103] = 10'b0100100101;
   valid_symbols[104] = 10'b0100100110;
   valid_symbols[105] = 10'b0100101001;
   valid_symbols[106] = 10'b0100101010;
   valid_symbols[107] = 10'b0100101011;
   valid_symbols[108] = 10'b0100101100;
   valid_symbols[109] = 10'b0100101101;
   valid_symbols[110] = 10'b0100101110;
   valid_symbols[111] = 10'b0100110001;
   valid_symbols[112] = 10'b0100110010;
   valid_symbols[113] = 10'b0100110011;
   valid_symbols[114] = 10'b0100110100;
   valid_symbols[115] = 10'b0100110101;
   valid_symbols[116] = 10'b0100110110;
   valid_symbols[117] = 10'b0100110111;
   valid_symbols[118] = 10'b0100111001;
   valid_symbols[119] = 10'b0100111010;
   valid_symbols[120] = 10'b0100111011;
   valid_symbols[121] = 10'b0100111100;
   valid_symbols[122] = 10'b0100111101;
   valid_symbols[123] = 10'b0101000101;
   valid_symbols[124] = 10'b0101000110;
   valid_symbols[125] = 10'b0101001001;
   valid_symbols[126] = 10'b0101001010;
   valid_symbols[127] = 10'b0101001011;
   valid_symbols[128] = 10'b0101001100;
   valid_symbols[129] = 10'b0101001101;
   valid_symbols[130] = 10'b0101001110;
   valid_symbols[131] = 10'b0101010001;
   valid_symbols[132] = 10'b0101010010;
   valid_symbols[133] = 10'b0101010011;
   valid_symbols[134] = 10'b0101010100;
   valid_symbols[135] = 10'b0101010101;
   valid_symbols[136] = 10'b0101010110;
   valid_symbols[137] = 10'b0101011001;
   valid_symbols[138] = 10'b0101011010;
   valid_symbols[139] = 10'b0101011011;
   valid_symbols[140] = 10'b0101011100;
   valid_symbols[141] = 10'b0101011101;
   valid_symbols[142] = 10'b0101011110;
   valid_symbols[143] = 10'b0101100001;
   valid_symbols[144] = 10'b0101100010;
   valid_symbols[145] = 10'b0101100011;
   valid_symbols[146] = 10'b0101100100;
   valid_symbols[147] = 10'b0101100101;
   valid_symbols[148] = 10'b0101100110;
   valid_symbols[149] = 10'b0101101001;
   valid_symbols[150] = 10'b0101101010;
   valid_symbols[151] = 10'b0101101011;
   valid_symbols[152] = 10'b0101101100;
   valid_symbols[153] = 10'b0101101101;
   valid_symbols[154] = 10'b0101101110;
   valid_symbols[155] = 10'b0101110001;
   valid_symbols[156] = 10'b0101110010;
   valid_symbols[157] = 10'b0101110011;
   valid_symbols[158] = 10'b0101110100;
   valid_symbols[159] = 10'b0101110101;
   valid_symbols[160] = 10'b0101110110;
   valid_symbols[161] = 10'b0101111001;
   valid_symbols[162] = 10'b0101111010;
   valid_symbols[163] = 10'b0110000101;
   valid_symbols[164] = 10'b0110000110;
   valid_symbols[165] = 10'b0110001001;
   valid_symbols[166] = 10'b0110001010;
   valid_symbols[167] = 10'b0110001011;
   valid_symbols[168] = 10'b0110001100;
   valid_symbols[169] = 10'b0110001101;
   valid_symbols[170] = 10'b0110001110;
   valid_symbols[171] = 10'b0110010001;
   valid_symbols[172] = 10'b0110010010;
   valid_symbols[173] = 10'b0110010011;
   valid_symbols[174] = 10'b0110010100;
   valid_symbols[175] = 10'b0110010101;
   valid_symbols[176] = 10'b0110010110;
   valid_symbols[177] = 10'b0110011001;
   valid_symbols[178] = 10'b0110011010;
   valid_symbols[179] = 10'b0110011011;
   valid_symbols[180] = 10'b0110011100;
   valid_symbols[181] = 10'b0110011101;
   valid_symbols[182] = 10'b0110011110;
   valid_symbols[183] = 10'b0110100001;
   valid_symbols[184] = 10'b0110100010;
   valid_symbols[185] = 10'b0110100011;
   valid_symbols[186] = 10'b0110100100;
   valid_symbols[187] = 10'b0110100101;
   valid_symbols[188] = 10'b0110100110;
   valid_symbols[189] = 10'b0110101001;
   valid_symbols[190] = 10'b0110101010;
   valid_symbols[191] = 10'b0110101011;
   valid_symbols[192] = 10'b0110101100;
   valid_symbols[193] = 10'b0110101101;
   valid_symbols[194] = 10'b0110101110;
   valid_symbols[195] = 10'b0110110001;
   valid_symbols[196] = 10'b0110110010;
   valid_symbols[197] = 10'b0110110011;
   valid_symbols[198] = 10'b0110110100;
   valid_symbols[199] = 10'b0110110101;
   valid_symbols[200] = 10'b0110110110;
   valid_symbols[201] = 10'b0110111001;
   valid_symbols[202] = 10'b0110111010;
   valid_symbols[203] = 10'b0111000010;
   valid_symbols[204] = 10'b0111000011;
   valid_symbols[205] = 10'b0111000100;
   valid_symbols[206] = 10'b0111000101;
   valid_symbols[207] = 10'b0111000110;
   valid_symbols[208] = 10'b0111001000;
   valid_symbols[209] = 10'b0111001001;
   valid_symbols[210] = 10'b0111001010;
   valid_symbols[211] = 10'b0111001011;
   valid_symbols[212] = 10'b0111001100;
   valid_symbols[213] = 10'b0111001101;
   valid_symbols[214] = 10'b0111001110;
   valid_symbols[215] = 10'b0111010001;
   valid_symbols[216] = 10'b0111010010;
   valid_symbols[217] = 10'b0111010011;
   valid_symbols[218] = 10'b0111010100;
   valid_symbols[219] = 10'b0111010101;
   valid_symbols[220] = 10'b0111010110;
   valid_symbols[221] = 10'b0111011001;
   valid_symbols[222] = 10'b0111011010;
   valid_symbols[223] = 10'b0111100001;
   valid_symbols[224] = 10'b0111100010;
   valid_symbols[225] = 10'b0111100011;
   valid_symbols[226] = 10'b0111100100;
   valid_symbols[227] = 10'b0111100101;
   valid_symbols[228] = 10'b0111100110;
   valid_symbols[229] = 10'b0111101000;
   valid_symbols[230] = 10'b0111101001;
   valid_symbols[231] = 10'b0111101010;
   valid_symbols[232] = 10'b1000010101;
   valid_symbols[233] = 10'b1000010110;
   valid_symbols[234] = 10'b1000010111;
   valid_symbols[235] = 10'b1000011001;
   valid_symbols[236] = 10'b1000011010;
   valid_symbols[237] = 10'b1000011011;
   valid_symbols[238] = 10'b1000011100;
   valid_symbols[239] = 10'b1000011101;
   valid_symbols[240] = 10'b1000011110;
   valid_symbols[241] = 10'b1000100101;
   valid_symbols[242] = 10'b1000100110;
   valid_symbols[243] = 10'b1000101001;
   valid_symbols[244] = 10'b1000101010;
   valid_symbols[245] = 10'b1000101011;
   valid_symbols[246] = 10'b1000101100;
   valid_symbols[247] = 10'b1000101101;
   valid_symbols[248] = 10'b1000101110;
   valid_symbols[249] = 10'b1000110001;
   valid_symbols[250] = 10'b1000110010;
   valid_symbols[251] = 10'b1000110011;
   valid_symbols[252] = 10'b1000110100;
   valid_symbols[253] = 10'b1000110101;
   valid_symbols[254] = 10'b1000110110;
   valid_symbols[255] = 10'b1000110111;
   valid_symbols[256] = 10'b1000111001;
   valid_symbols[257] = 10'b1000111010;
   valid_symbols[258] = 10'b1000111011;
   valid_symbols[259] = 10'b1000111100;
   valid_symbols[260] = 10'b1000111101;
   valid_symbols[261] = 10'b1001000101;
   valid_symbols[262] = 10'b1001000110;
   valid_symbols[263] = 10'b1001001001;
   valid_symbols[264] = 10'b1001001010;
   valid_symbols[265] = 10'b1001001011;
   valid_symbols[266] = 10'b1001001100;
   valid_symbols[267] = 10'b1001001101;
   valid_symbols[268] = 10'b1001001110;
   valid_symbols[269] = 10'b1001010001;
   valid_symbols[270] = 10'b1001010010;
   valid_symbols[271] = 10'b1001010011;
   valid_symbols[272] = 10'b1001010100;
   valid_symbols[273] = 10'b1001010101;
   valid_symbols[274] = 10'b1001010110;
   valid_symbols[275] = 10'b1001011001;
   valid_symbols[276] = 10'b1001011010;
   valid_symbols[277] = 10'b1001011011;
   valid_symbols[278] = 10'b1001011100;
   valid_symbols[279] = 10'b1001011101;
   valid_symbols[280] = 10'b1001011110;
   valid_symbols[281] = 10'b1001100001;
   valid_symbols[282] = 10'b1001100010;
   valid_symbols[283] = 10'b1001100011;
   valid_symbols[284] = 10'b1001100100;
   valid_symbols[285] = 10'b1001100101;
   valid_symbols[286] = 10'b1001100110;
   valid_symbols[287] = 10'b1001101001;
   valid_symbols[288] = 10'b1001101010;
   valid_symbols[289] = 10'b1001101011;
   valid_symbols[290] = 10'b1001101100;
   valid_symbols[291] = 10'b1001101101;
   valid_symbols[292] = 10'b1001101110;
   valid_symbols[293] = 10'b1001110001;
   valid_symbols[294] = 10'b1001110010;
   valid_symbols[295] = 10'b1001110011;
   valid_symbols[296] = 10'b1001110100;
   valid_symbols[297] = 10'b1001110101;
   valid_symbols[298] = 10'b1001110110;
   valid_symbols[299] = 10'b1001111001;
   valid_symbols[300] = 10'b1001111010;
   valid_symbols[301] = 10'b1010000101;
   valid_symbols[302] = 10'b1010000110;
   valid_symbols[303] = 10'b1010001001;
   valid_symbols[304] = 10'b1010001010;
   valid_symbols[305] = 10'b1010001011;
   valid_symbols[306] = 10'b1010001100;
   valid_symbols[307] = 10'b1010001101;
   valid_symbols[308] = 10'b1010001110;
   valid_symbols[309] = 10'b1010010001;
   valid_symbols[310] = 10'b1010010010;
   valid_symbols[311] = 10'b1010010011;
   valid_symbols[312] = 10'b1010010100;
   valid_symbols[313] = 10'b1010010101;
   valid_symbols[314] = 10'b1010010110;
   valid_symbols[315] = 10'b1010011001;
   valid_symbols[316] = 10'b1010011010;
   valid_symbols[317] = 10'b1010011011;
   valid_symbols[318] = 10'b1010011100;
   valid_symbols[319] = 10'b1010011101;
   valid_symbols[320] = 10'b1010011110;
   valid_symbols[321] = 10'b1010100001;
   valid_symbols[322] = 10'b1010100010;
   valid_symbols[323] = 10'b1010100011;
   valid_symbols[324] = 10'b1010100100;
   valid_symbols[325] = 10'b1010100101;
   valid_symbols[326] = 10'b1010100110;
   valid_symbols[327] = 10'b1010101001;
   valid_symbols[328] = 10'b1010101010;
   valid_symbols[329] = 10'b1010101011;
   valid_symbols[330] = 10'b1010101100;
   valid_symbols[331] = 10'b1010101101;
   valid_symbols[332] = 10'b1010101110;
   valid_symbols[333] = 10'b1010110001;
   valid_symbols[334] = 10'b1010110010;
   valid_symbols[335] = 10'b1010110011;
   valid_symbols[336] = 10'b1010110100;
   valid_symbols[337] = 10'b1010110101;
   valid_symbols[338] = 10'b1010110110;
   valid_symbols[339] = 10'b1010111001;
   valid_symbols[340] = 10'b1010111010;
   valid_symbols[341] = 10'b1011000010;
   valid_symbols[342] = 10'b1011000011;
   valid_symbols[343] = 10'b1011000100;
   valid_symbols[344] = 10'b1011000101;
   valid_symbols[345] = 10'b1011000110;
   valid_symbols[346] = 10'b1011001000;
   valid_symbols[347] = 10'b1011001001;
   valid_symbols[348] = 10'b1011001010;
   valid_symbols[349] = 10'b1011001011;
   valid_symbols[350] = 10'b1011001100;
   valid_symbols[351] = 10'b1011001101;
   valid_symbols[352] = 10'b1011001110;
   valid_symbols[353] = 10'b1011010001;
   valid_symbols[354] = 10'b1011010010;
   valid_symbols[355] = 10'b1011010011;
   valid_symbols[356] = 10'b1011010100;
   valid_symbols[357] = 10'b1011010101;
   valid_symbols[358] = 10'b1011010110;
   valid_symbols[359] = 10'b1011011001;
   valid_symbols[360] = 10'b1011011010;
   valid_symbols[361] = 10'b1011100001;
   valid_symbols[362] = 10'b1011100010;
   valid_symbols[363] = 10'b1011100011;
   valid_symbols[364] = 10'b1011100100;
   valid_symbols[365] = 10'b1011100101;
   valid_symbols[366] = 10'b1011100110;
   valid_symbols[367] = 10'b1011101000;
   valid_symbols[368] = 10'b1011101001;
   valid_symbols[369] = 10'b1011101010;
   valid_symbols[370] = 10'b1100000101;
   valid_symbols[371] = 10'b1100000110;
   valid_symbols[372] = 10'b1100000111;
   valid_symbols[373] = 10'b1100001001;
   valid_symbols[374] = 10'b1100001010;
   valid_symbols[375] = 10'b1100001011;
   valid_symbols[376] = 10'b1100001100;
   valid_symbols[377] = 10'b1100001101;
   valid_symbols[378] = 10'b1100010001;
   valid_symbols[379] = 10'b1100010010;
   valid_symbols[380] = 10'b1100010011;
   valid_symbols[381] = 10'b1100010100;
   valid_symbols[382] = 10'b1100010101;
   valid_symbols[383] = 10'b1100010110;
   valid_symbols[384] = 10'b1100011001;
   valid_symbols[385] = 10'b1100011010;
   valid_symbols[386] = 10'b1100011011;
   valid_symbols[387] = 10'b1100011100;
   valid_symbols[388] = 10'b1100011101;
   valid_symbols[389] = 10'b1100011110;
   valid_symbols[390] = 10'b1100100001;
   valid_symbols[391] = 10'b1100100010;
   valid_symbols[392] = 10'b1100100011;
   valid_symbols[393] = 10'b1100100100;
   valid_symbols[394] = 10'b1100100101;
   valid_symbols[395] = 10'b1100100110;
   valid_symbols[396] = 10'b1100101001;
   valid_symbols[397] = 10'b1100101010;
   valid_symbols[398] = 10'b1100101011;
   valid_symbols[399] = 10'b1100101100;
   valid_symbols[400] = 10'b1100101101;
   valid_symbols[401] = 10'b1100101110;
   valid_symbols[402] = 10'b1100110001;
   valid_symbols[403] = 10'b1100110010;
   valid_symbols[404] = 10'b1100110011;
   valid_symbols[405] = 10'b1100110100;
   valid_symbols[406] = 10'b1100110101;
   valid_symbols[407] = 10'b1100110110;
   valid_symbols[408] = 10'b1100111001;
   valid_symbols[409] = 10'b1100111010;
   valid_symbols[410] = 10'b1101000010;
   valid_symbols[411] = 10'b1101000011;
   valid_symbols[412] = 10'b1101000100;
   valid_symbols[413] = 10'b1101000101;
   valid_symbols[414] = 10'b1101000110;
   valid_symbols[415] = 10'b1101001000;
   valid_symbols[416] = 10'b1101001001;
   valid_symbols[417] = 10'b1101001010;
   valid_symbols[418] = 10'b1101001011;
   valid_symbols[419] = 10'b1101001100;
   valid_symbols[420] = 10'b1101001101;
   valid_symbols[421] = 10'b1101001110;
   valid_symbols[422] = 10'b1101010001;
   valid_symbols[423] = 10'b1101010010;
   valid_symbols[424] = 10'b1101010011;
   valid_symbols[425] = 10'b1101010100;
   valid_symbols[426] = 10'b1101010101;
   valid_symbols[427] = 10'b1101010110;
   valid_symbols[428] = 10'b1101011001;
   valid_symbols[429] = 10'b1101011010;
   valid_symbols[430] = 10'b1101100001;
   valid_symbols[431] = 10'b1101100010;
   valid_symbols[432] = 10'b1101100011;
   valid_symbols[433] = 10'b1101100100;
   valid_symbols[434] = 10'b1101100101;
   valid_symbols[435] = 10'b1101100110;
   valid_symbols[436] = 10'b1101101000;
   valid_symbols[437] = 10'b1101101001;
   valid_symbols[438] = 10'b1101101010;
   valid_symbols[439] = 10'b1110000101;
   valid_symbols[440] = 10'b1110000110;
   valid_symbols[441] = 10'b1110001001;
   valid_symbols[442] = 10'b1110001010;
   valid_symbols[443] = 10'b1110001011;
   valid_symbols[444] = 10'b1110001100;
   valid_symbols[445] = 10'b1110001101;
   valid_symbols[446] = 10'b1110001110;
   valid_symbols[447] = 10'b1110010001;
   valid_symbols[448] = 10'b1110010010;
   valid_symbols[449] = 10'b1110010011;
   valid_symbols[450] = 10'b1110010100;
   valid_symbols[451] = 10'b1110010101;
   valid_symbols[452] = 10'b1110010110;
   valid_symbols[453] = 10'b1110011001;
   valid_symbols[454] = 10'b1110011010;
   valid_symbols[455] = 10'b1110100001;
   valid_symbols[456] = 10'b1110100010;
   valid_symbols[457] = 10'b1110100011;
   valid_symbols[458] = 10'b1110100100;
   valid_symbols[459] = 10'b1110100101;
   valid_symbols[460] = 10'b1110100110;
   valid_symbols[461] = 10'b1110101000;
   valid_symbols[462] = 10'b1110101001;
   valid_symbols[463] = 10'b1110101010;
   
   
   invalid_symbols[0] = 10'b0000000000;
   invalid_symbols[1] = 10'b0000000001;
   invalid_symbols[2] = 10'b0000000010;
   invalid_symbols[3] = 10'b0000000011;
   invalid_symbols[4] = 10'b0000000100;
   invalid_symbols[5] = 10'b0000000101;
   invalid_symbols[6] = 10'b0000000110;
   invalid_symbols[7] = 10'b0000000111;
   invalid_symbols[8] = 10'b0000001000;
   invalid_symbols[9] = 10'b0000001001;
   invalid_symbols[10] = 10'b0000001010;
   invalid_symbols[11] = 10'b0000001011;
   invalid_symbols[12] = 10'b0000001100;
   invalid_symbols[13] = 10'b0000001101;
   invalid_symbols[14] = 10'b0000001110;
   invalid_symbols[15] = 10'b0000001111;
   invalid_symbols[16] = 10'b0000010000;
   invalid_symbols[17] = 10'b0000010001;
   invalid_symbols[18] = 10'b0000010010;
   invalid_symbols[19] = 10'b0000010011;
   invalid_symbols[20] = 10'b0000010100;
   invalid_symbols[21] = 10'b0000010101;
   invalid_symbols[22] = 10'b0000010110;
   invalid_symbols[23] = 10'b0000010111;
   invalid_symbols[24] = 10'b0000011000;
   invalid_symbols[25] = 10'b0000011001;
   invalid_symbols[26] = 10'b0000011010;
   invalid_symbols[27] = 10'b0000011011;
   invalid_symbols[28] = 10'b0000011100;
   invalid_symbols[29] = 10'b0000011101;
   invalid_symbols[30] = 10'b0000011110;
   invalid_symbols[31] = 10'b0000011111;
   invalid_symbols[32] = 10'b0000100000;
   invalid_symbols[33] = 10'b0000100001;
   invalid_symbols[34] = 10'b0000100010;
   invalid_symbols[35] = 10'b0000100011;
   invalid_symbols[36] = 10'b0000100100;
   invalid_symbols[37] = 10'b0000100101;
   invalid_symbols[38] = 10'b0000100110;
   invalid_symbols[39] = 10'b0000100111;
   invalid_symbols[40] = 10'b0000101000;
   invalid_symbols[41] = 10'b0000101001;
   invalid_symbols[42] = 10'b0000101010;
   invalid_symbols[43] = 10'b0000101011;
   invalid_symbols[44] = 10'b0000101100;
   invalid_symbols[45] = 10'b0000101101;
   invalid_symbols[46] = 10'b0000101110;
   invalid_symbols[47] = 10'b0000101111;
   invalid_symbols[48] = 10'b0000110000;
   invalid_symbols[49] = 10'b0000110001;
   invalid_symbols[50] = 10'b0000110010;
   invalid_symbols[51] = 10'b0000110011;
   invalid_symbols[52] = 10'b0000110100;
   invalid_symbols[53] = 10'b0000110101;
   invalid_symbols[54] = 10'b0000110110;
   invalid_symbols[55] = 10'b0000110111;
   invalid_symbols[56] = 10'b0000111000;
   invalid_symbols[57] = 10'b0000111001;
   invalid_symbols[58] = 10'b0000111010;
   invalid_symbols[59] = 10'b0000111011;
   invalid_symbols[60] = 10'b0000111100;
   invalid_symbols[61] = 10'b0000111101;
   invalid_symbols[62] = 10'b0000111110;
   invalid_symbols[63] = 10'b0000111111;
   invalid_symbols[64] = 10'b0001000000;
   invalid_symbols[65] = 10'b0001000001;
   invalid_symbols[66] = 10'b0001000010;
   invalid_symbols[67] = 10'b0001000011;
   invalid_symbols[68] = 10'b0001000100;
   invalid_symbols[69] = 10'b0001000101;
   invalid_symbols[70] = 10'b0001000110;
   invalid_symbols[71] = 10'b0001000111;
   invalid_symbols[72] = 10'b0001001000;
   invalid_symbols[73] = 10'b0001001001;
   invalid_symbols[74] = 10'b0001001010;
   invalid_symbols[75] = 10'b0001001011;
   invalid_symbols[76] = 10'b0001001100;
   invalid_symbols[77] = 10'b0001001101;
   invalid_symbols[78] = 10'b0001001110;
   invalid_symbols[79] = 10'b0001001111;
   invalid_symbols[80] = 10'b0001010000;
   invalid_symbols[81] = 10'b0001010001;
   invalid_symbols[82] = 10'b0001010010;
   invalid_symbols[83] = 10'b0001010011;
   invalid_symbols[84] = 10'b0001010100;
   invalid_symbols[85] = 10'b0001011000;
   invalid_symbols[86] = 10'b0001011111;
   invalid_symbols[87] = 10'b0001100000;
   invalid_symbols[88] = 10'b0001100001;
   invalid_symbols[89] = 10'b0001100010;
   invalid_symbols[90] = 10'b0001100011;
   invalid_symbols[91] = 10'b0001100100;
   invalid_symbols[92] = 10'b0001100111;
   invalid_symbols[93] = 10'b0001101000;
   invalid_symbols[94] = 10'b0001101111;
   invalid_symbols[95] = 10'b0001110000;
   invalid_symbols[96] = 10'b0001110111;
   invalid_symbols[97] = 10'b0001111000;
   invalid_symbols[98] = 10'b0001111011;
   invalid_symbols[99] = 10'b0001111100;
   invalid_symbols[100] = 10'b0001111101;
   invalid_symbols[101] = 10'b0001111110;
   invalid_symbols[102] = 10'b0001111111;
   invalid_symbols[103] = 10'b0010000000;
   invalid_symbols[104] = 10'b0010000001;
   invalid_symbols[105] = 10'b0010000010;
   invalid_symbols[106] = 10'b0010000011;
   invalid_symbols[107] = 10'b0010000100;
   invalid_symbols[108] = 10'b0010000101;
   invalid_symbols[109] = 10'b0010000110;
   invalid_symbols[110] = 10'b0010000111;
   invalid_symbols[111] = 10'b0010001000;
   invalid_symbols[112] = 10'b0010001001;
   invalid_symbols[113] = 10'b0010001010;
   invalid_symbols[114] = 10'b0010001011;
   invalid_symbols[115] = 10'b0010001100;
   invalid_symbols[116] = 10'b0010001101;
   invalid_symbols[117] = 10'b0010001110;
   invalid_symbols[118] = 10'b0010001111;
   invalid_symbols[119] = 10'b0010010000;
   invalid_symbols[120] = 10'b0010010001;
   invalid_symbols[121] = 10'b0010010010;
   invalid_symbols[122] = 10'b0010010011;
   invalid_symbols[123] = 10'b0010010100;
   invalid_symbols[124] = 10'b0010011000;
   invalid_symbols[125] = 10'b0010011111;
   invalid_symbols[126] = 10'b0010100000;
   invalid_symbols[127] = 10'b0010100001;
   invalid_symbols[128] = 10'b0010100010;
   invalid_symbols[129] = 10'b0010100011;
   invalid_symbols[130] = 10'b0010100100;
   invalid_symbols[131] = 10'b0010100111;
   invalid_symbols[132] = 10'b0010101000;
   invalid_symbols[133] = 10'b0010101111;
   invalid_symbols[134] = 10'b0010110000;
   invalid_symbols[135] = 10'b0010111000;
   invalid_symbols[136] = 10'b0010111110;
   invalid_symbols[137] = 10'b0010111111;
   invalid_symbols[138] = 10'b0011000000;
   invalid_symbols[139] = 10'b0011000001;
   invalid_symbols[140] = 10'b0011000010;
   invalid_symbols[141] = 10'b0011000011;
   invalid_symbols[142] = 10'b0011000100;
   invalid_symbols[143] = 10'b0011000111;
   invalid_symbols[144] = 10'b0011001000;
   invalid_symbols[145] = 10'b0011001111;
   invalid_symbols[146] = 10'b0011010000;
   invalid_symbols[147] = 10'b0011010111;
   invalid_symbols[148] = 10'b0011011000;
   invalid_symbols[149] = 10'b0011011111;
   invalid_symbols[150] = 10'b0011100000;
   invalid_symbols[151] = 10'b0011100111;
   invalid_symbols[152] = 10'b0011101000;
   invalid_symbols[153] = 10'b0011101111;
   invalid_symbols[154] = 10'b0011110000;
   invalid_symbols[155] = 10'b0011110001;
   invalid_symbols[156] = 10'b0011110111;
   invalid_symbols[157] = 10'b0011111011;
   invalid_symbols[158] = 10'b0011111100;
   invalid_symbols[159] = 10'b0011111101;
   invalid_symbols[160] = 10'b0011111110;
   invalid_symbols[161] = 10'b0011111111;
   invalid_symbols[162] = 10'b0100000000;
   invalid_symbols[163] = 10'b0100000001;
   invalid_symbols[164] = 10'b0100000010;
   invalid_symbols[165] = 10'b0100000011;
   invalid_symbols[166] = 10'b0100000100;
   invalid_symbols[167] = 10'b0100000101;
   invalid_symbols[168] = 10'b0100000110;
   invalid_symbols[169] = 10'b0100000111;
   invalid_symbols[170] = 10'b0100001000;
   invalid_symbols[171] = 10'b0100001001;
   invalid_symbols[172] = 10'b0100001010;
   invalid_symbols[173] = 10'b0100001011;
   invalid_symbols[174] = 10'b0100001100;
   invalid_symbols[175] = 10'b0100001101;
   invalid_symbols[176] = 10'b0100001110;
   invalid_symbols[177] = 10'b0100001111;
   invalid_symbols[178] = 10'b0100010000;
   invalid_symbols[179] = 10'b0100010001;
   invalid_symbols[180] = 10'b0100010010;
   invalid_symbols[181] = 10'b0100010011;
   invalid_symbols[182] = 10'b0100010100;
   invalid_symbols[183] = 10'b0100011000;
   invalid_symbols[184] = 10'b0100011111;
   invalid_symbols[185] = 10'b0100100000;
   invalid_symbols[186] = 10'b0100100001;
   invalid_symbols[187] = 10'b0100100010;
   invalid_symbols[188] = 10'b0100100011;
   invalid_symbols[189] = 10'b0100100100;
   invalid_symbols[190] = 10'b0100100111;
   invalid_symbols[191] = 10'b0100101000;
   invalid_symbols[192] = 10'b0100101111;
   invalid_symbols[193] = 10'b0100110000;
   invalid_symbols[194] = 10'b0100111000;
   invalid_symbols[195] = 10'b0100111110;
   invalid_symbols[196] = 10'b0100111111;
   invalid_symbols[197] = 10'b0101000000;
   invalid_symbols[198] = 10'b0101000001;
   invalid_symbols[199] = 10'b0101000010;
   invalid_symbols[200] = 10'b0101000011;
   invalid_symbols[201] = 10'b0101000100;
   invalid_symbols[202] = 10'b0101000111;
   invalid_symbols[203] = 10'b0101001000;
   invalid_symbols[204] = 10'b0101001111;
   invalid_symbols[205] = 10'b0101010000;
   invalid_symbols[206] = 10'b0101010111;
   invalid_symbols[207] = 10'b0101011000;
   invalid_symbols[208] = 10'b0101011111;
   invalid_symbols[209] = 10'b0101100000;
   invalid_symbols[210] = 10'b0101100111;
   invalid_symbols[211] = 10'b0101101000;
   invalid_symbols[212] = 10'b0101101111;
   invalid_symbols[213] = 10'b0101110000;
   invalid_symbols[214] = 10'b0101110111;
   invalid_symbols[215] = 10'b0101111000;
   invalid_symbols[216] = 10'b0101111011;
   invalid_symbols[217] = 10'b0101111100;
   invalid_symbols[218] = 10'b0101111101;
   invalid_symbols[219] = 10'b0101111110;
   invalid_symbols[220] = 10'b0101111111;
   invalid_symbols[221] = 10'b0110000000;
   invalid_symbols[222] = 10'b0110000001;
   invalid_symbols[223] = 10'b0110000010;
   invalid_symbols[224] = 10'b0110000011;
   invalid_symbols[225] = 10'b0110000100;
   invalid_symbols[226] = 10'b0110000111;
   invalid_symbols[227] = 10'b0110001000;
   invalid_symbols[228] = 10'b0110001111;
   invalid_symbols[229] = 10'b0110010000;
   invalid_symbols[230] = 10'b0110010111;
   invalid_symbols[231] = 10'b0110011000;
   invalid_symbols[232] = 10'b0110011111;
   invalid_symbols[233] = 10'b0110100000;
   invalid_symbols[234] = 10'b0110100111;
   invalid_symbols[235] = 10'b0110101000;
   invalid_symbols[236] = 10'b0110101111;
   invalid_symbols[237] = 10'b0110110000;
   invalid_symbols[238] = 10'b0110110111;
   invalid_symbols[239] = 10'b0110111000;
   invalid_symbols[240] = 10'b0110111011;
   invalid_symbols[241] = 10'b0110111100;
   invalid_symbols[242] = 10'b0110111101;
   invalid_symbols[243] = 10'b0110111110;
   invalid_symbols[244] = 10'b0110111111;
   invalid_symbols[245] = 10'b0111000000;
   invalid_symbols[246] = 10'b0111000001;
   invalid_symbols[247] = 10'b0111000111;
   invalid_symbols[248] = 10'b0111001111;
   invalid_symbols[249] = 10'b0111010000;
   invalid_symbols[250] = 10'b0111010111;
   invalid_symbols[251] = 10'b0111011000;
   invalid_symbols[252] = 10'b0111011011;
   invalid_symbols[253] = 10'b0111011100;
   invalid_symbols[254] = 10'b0111011101;
   invalid_symbols[255] = 10'b0111011110;
   invalid_symbols[256] = 10'b0111011111;
   invalid_symbols[257] = 10'b0111100000;
   invalid_symbols[258] = 10'b0111100111;
   invalid_symbols[259] = 10'b0111101011;
   invalid_symbols[260] = 10'b0111101100;
   invalid_symbols[261] = 10'b0111101101;
   invalid_symbols[262] = 10'b0111101110;
   invalid_symbols[263] = 10'b0111101111;
   invalid_symbols[264] = 10'b0111110000;
   invalid_symbols[265] = 10'b0111110001;
   invalid_symbols[266] = 10'b0111110010;
   invalid_symbols[267] = 10'b0111110011;
   invalid_symbols[268] = 10'b0111110100;
   invalid_symbols[269] = 10'b0111110101;
   invalid_symbols[270] = 10'b0111110110;
   invalid_symbols[271] = 10'b0111110111;
   invalid_symbols[272] = 10'b0111111000;
   invalid_symbols[273] = 10'b0111111001;
   invalid_symbols[274] = 10'b0111111010;
   invalid_symbols[275] = 10'b0111111011;
   invalid_symbols[276] = 10'b0111111100;
   invalid_symbols[277] = 10'b0111111101;
   invalid_symbols[278] = 10'b0111111110;
   invalid_symbols[279] = 10'b0111111111;
   invalid_symbols[280] = 10'b1000000000;
   invalid_symbols[281] = 10'b1000000001;
   invalid_symbols[282] = 10'b1000000010;
   invalid_symbols[283] = 10'b1000000011;
   invalid_symbols[284] = 10'b1000000100;
   invalid_symbols[285] = 10'b1000000101;
   invalid_symbols[286] = 10'b1000000110;
   invalid_symbols[287] = 10'b1000000111;
   invalid_symbols[288] = 10'b1000001000;
   invalid_symbols[289] = 10'b1000001001;
   invalid_symbols[290] = 10'b1000001010;
   invalid_symbols[291] = 10'b1000001011;
   invalid_symbols[292] = 10'b1000001100;
   invalid_symbols[293] = 10'b1000001101;
   invalid_symbols[294] = 10'b1000001110;
   invalid_symbols[295] = 10'b1000001111;
   invalid_symbols[296] = 10'b1000010000;
   invalid_symbols[297] = 10'b1000010001;
   invalid_symbols[298] = 10'b1000010010;
   invalid_symbols[299] = 10'b1000010011;
   invalid_symbols[300] = 10'b1000010100;
   invalid_symbols[301] = 10'b1000011000;
   invalid_symbols[302] = 10'b1000011111;
   invalid_symbols[303] = 10'b1000100000;
   invalid_symbols[304] = 10'b1000100001;
   invalid_symbols[305] = 10'b1000100010;
   invalid_symbols[306] = 10'b1000100011;
   invalid_symbols[307] = 10'b1000100100;
   invalid_symbols[308] = 10'b1000100111;
   invalid_symbols[309] = 10'b1000101000;
   invalid_symbols[310] = 10'b1000101111;
   invalid_symbols[311] = 10'b1000110000;
   invalid_symbols[312] = 10'b1000111000;
   invalid_symbols[313] = 10'b1000111110;
   invalid_symbols[314] = 10'b1000111111;
   invalid_symbols[315] = 10'b1001000000;
   invalid_symbols[316] = 10'b1001000001;
   invalid_symbols[317] = 10'b1001000010;
   invalid_symbols[318] = 10'b1001000011;
   invalid_symbols[319] = 10'b1001000100;
   invalid_symbols[320] = 10'b1001000111;
   invalid_symbols[321] = 10'b1001001000;
   invalid_symbols[322] = 10'b1001001111;
   invalid_symbols[323] = 10'b1001010000;
   invalid_symbols[324] = 10'b1001010111;
   invalid_symbols[325] = 10'b1001011000;
   invalid_symbols[326] = 10'b1001011111;
   invalid_symbols[327] = 10'b1001100000;
   invalid_symbols[328] = 10'b1001100111;
   invalid_symbols[329] = 10'b1001101000;
   invalid_symbols[330] = 10'b1001101111;
   invalid_symbols[331] = 10'b1001110000;
   invalid_symbols[332] = 10'b1001110111;
   invalid_symbols[333] = 10'b1001111000;
   invalid_symbols[334] = 10'b1001111011;
   invalid_symbols[335] = 10'b1001111100;
   invalid_symbols[336] = 10'b1001111101;
   invalid_symbols[337] = 10'b1001111110;
   invalid_symbols[338] = 10'b1001111111;
   invalid_symbols[339] = 10'b1010000000;
   invalid_symbols[340] = 10'b1010000001;
   invalid_symbols[341] = 10'b1010000010;
   invalid_symbols[342] = 10'b1010000011;
   invalid_symbols[343] = 10'b1010000100;
   invalid_symbols[344] = 10'b1010000111;
   invalid_symbols[345] = 10'b1010001000;
   invalid_symbols[346] = 10'b1010001111;
   invalid_symbols[347] = 10'b1010010000;
   invalid_symbols[348] = 10'b1010010111;
   invalid_symbols[349] = 10'b1010011000;
   invalid_symbols[350] = 10'b1010011111;
   invalid_symbols[351] = 10'b1010100000;
   invalid_symbols[352] = 10'b1010100111;
   invalid_symbols[353] = 10'b1010101000;
   invalid_symbols[354] = 10'b1010101111;
   invalid_symbols[355] = 10'b1010110000;
   invalid_symbols[356] = 10'b1010110111;
   invalid_symbols[357] = 10'b1010111000;
   invalid_symbols[358] = 10'b1010111011;
   invalid_symbols[359] = 10'b1010111100;
   invalid_symbols[360] = 10'b1010111101;
   invalid_symbols[361] = 10'b1010111110;
   invalid_symbols[362] = 10'b1010111111;
   invalid_symbols[363] = 10'b1011000000;
   invalid_symbols[364] = 10'b1011000001;
   invalid_symbols[365] = 10'b1011000111;
   invalid_symbols[366] = 10'b1011001111;
   invalid_symbols[367] = 10'b1011010000;
   invalid_symbols[368] = 10'b1011010111;
   invalid_symbols[369] = 10'b1011011000;
   invalid_symbols[370] = 10'b1011011011;
   invalid_symbols[371] = 10'b1011011100;
   invalid_symbols[372] = 10'b1011011101;
   invalid_symbols[373] = 10'b1011011110;
   invalid_symbols[374] = 10'b1011011111;
   invalid_symbols[375] = 10'b1011100000;
   invalid_symbols[376] = 10'b1011100111;
   invalid_symbols[377] = 10'b1011101011;
   invalid_symbols[378] = 10'b1011101100;
   invalid_symbols[379] = 10'b1011101101;
   invalid_symbols[380] = 10'b1011101110;
   invalid_symbols[381] = 10'b1011101111;
   invalid_symbols[382] = 10'b1011110000;
   invalid_symbols[383] = 10'b1011110001;
   invalid_symbols[384] = 10'b1011110010;
   invalid_symbols[385] = 10'b1011110011;
   invalid_symbols[386] = 10'b1011110100;
   invalid_symbols[387] = 10'b1011110101;
   invalid_symbols[388] = 10'b1011110110;
   invalid_symbols[389] = 10'b1011110111;
   invalid_symbols[390] = 10'b1011111000;
   invalid_symbols[391] = 10'b1011111001;
   invalid_symbols[392] = 10'b1011111010;
   invalid_symbols[393] = 10'b1011111011;
   invalid_symbols[394] = 10'b1011111100;
   invalid_symbols[395] = 10'b1011111101;
   invalid_symbols[396] = 10'b1011111110;
   invalid_symbols[397] = 10'b1011111111;
   invalid_symbols[398] = 10'b1100000000;
   invalid_symbols[399] = 10'b1100000001;
   invalid_symbols[400] = 10'b1100000010;
   invalid_symbols[401] = 10'b1100000011;
   invalid_symbols[402] = 10'b1100000100;
   invalid_symbols[403] = 10'b1100001000;
   invalid_symbols[404] = 10'b1100001110;
   invalid_symbols[405] = 10'b1100001111;
   invalid_symbols[406] = 10'b1100010000;
   invalid_symbols[407] = 10'b1100010111;
   invalid_symbols[408] = 10'b1100011000;
   invalid_symbols[409] = 10'b1100011111;
   invalid_symbols[410] = 10'b1100100000;
   invalid_symbols[411] = 10'b1100100111;
   invalid_symbols[412] = 10'b1100101000;
   invalid_symbols[413] = 10'b1100101111;
   invalid_symbols[414] = 10'b1100110000;
   invalid_symbols[415] = 10'b1100110111;
   invalid_symbols[416] = 10'b1100111000;
   invalid_symbols[417] = 10'b1100111011;
   invalid_symbols[418] = 10'b1100111100;
   invalid_symbols[419] = 10'b1100111101;
   invalid_symbols[420] = 10'b1100111110;
   invalid_symbols[421] = 10'b1100111111;
   invalid_symbols[422] = 10'b1101000000;
   invalid_symbols[423] = 10'b1101000001;
   invalid_symbols[424] = 10'b1101000111;
   invalid_symbols[425] = 10'b1101001111;
   invalid_symbols[426] = 10'b1101010000;
   invalid_symbols[427] = 10'b1101010111;
   invalid_symbols[428] = 10'b1101011000;
   invalid_symbols[429] = 10'b1101011011;
   invalid_symbols[430] = 10'b1101011100;
   invalid_symbols[431] = 10'b1101011101;
   invalid_symbols[432] = 10'b1101011110;
   invalid_symbols[433] = 10'b1101011111;
   invalid_symbols[434] = 10'b1101100000;
   invalid_symbols[435] = 10'b1101100111;
   invalid_symbols[436] = 10'b1101101011;
   invalid_symbols[437] = 10'b1101101100;
   invalid_symbols[438] = 10'b1101101101;
   invalid_symbols[439] = 10'b1101101110;
   invalid_symbols[440] = 10'b1101101111;
   invalid_symbols[441] = 10'b1101110000;
   invalid_symbols[442] = 10'b1101110001;
   invalid_symbols[443] = 10'b1101110010;
   invalid_symbols[444] = 10'b1101110011;
   invalid_symbols[445] = 10'b1101110100;
   invalid_symbols[446] = 10'b1101110101;
   invalid_symbols[447] = 10'b1101110110;
   invalid_symbols[448] = 10'b1101110111;
   invalid_symbols[449] = 10'b1101111000;
   invalid_symbols[450] = 10'b1101111001;
   invalid_symbols[451] = 10'b1101111010;
   invalid_symbols[452] = 10'b1101111011;
   invalid_symbols[453] = 10'b1101111100;
   invalid_symbols[454] = 10'b1101111101;
   invalid_symbols[455] = 10'b1101111110;
   invalid_symbols[456] = 10'b1101111111;
   invalid_symbols[457] = 10'b1110000000;
   invalid_symbols[458] = 10'b1110000001;
   invalid_symbols[459] = 10'b1110000010;
   invalid_symbols[460] = 10'b1110000011;
   invalid_symbols[461] = 10'b1110000100;
   invalid_symbols[462] = 10'b1110000111;
   invalid_symbols[463] = 10'b1110001000;
   invalid_symbols[464] = 10'b1110001111;
   invalid_symbols[465] = 10'b1110010000;
   invalid_symbols[466] = 10'b1110010111;
   invalid_symbols[467] = 10'b1110011000;
   invalid_symbols[468] = 10'b1110011011;
   invalid_symbols[469] = 10'b1110011100;
   invalid_symbols[470] = 10'b1110011101;
   invalid_symbols[471] = 10'b1110011110;
   invalid_symbols[472] = 10'b1110011111;
   invalid_symbols[473] = 10'b1110100000;
   invalid_symbols[474] = 10'b1110100111;
   invalid_symbols[475] = 10'b1110101011;
   invalid_symbols[476] = 10'b1110101100;
   invalid_symbols[477] = 10'b1110101101;
   invalid_symbols[478] = 10'b1110101110;
   invalid_symbols[479] = 10'b1110101111;
   invalid_symbols[480] = 10'b1110110000;
   invalid_symbols[481] = 10'b1110110001;
   invalid_symbols[482] = 10'b1110110010;
   invalid_symbols[483] = 10'b1110110011;
   invalid_symbols[484] = 10'b1110110100;
   invalid_symbols[485] = 10'b1110110101;
   invalid_symbols[486] = 10'b1110110110;
   invalid_symbols[487] = 10'b1110110111;
   invalid_symbols[488] = 10'b1110111000;
   invalid_symbols[489] = 10'b1110111001;
   invalid_symbols[490] = 10'b1110111010;
   invalid_symbols[491] = 10'b1110111011;
   invalid_symbols[492] = 10'b1110111100;
   invalid_symbols[493] = 10'b1110111101;
   invalid_symbols[494] = 10'b1110111110;
   invalid_symbols[495] = 10'b1110111111;
   invalid_symbols[496] = 10'b1111000000;
   invalid_symbols[497] = 10'b1111000001;
   invalid_symbols[498] = 10'b1111000010;
   invalid_symbols[499] = 10'b1111000011;
   invalid_symbols[500] = 10'b1111000100;
   invalid_symbols[501] = 10'b1111000101;
   invalid_symbols[502] = 10'b1111000110;
   invalid_symbols[503] = 10'b1111000111;
   invalid_symbols[504] = 10'b1111001000;
   invalid_symbols[505] = 10'b1111001001;
   invalid_symbols[506] = 10'b1111001010;
   invalid_symbols[507] = 10'b1111001011;
   invalid_symbols[508] = 10'b1111001100;
   invalid_symbols[509] = 10'b1111001101;
   invalid_symbols[510] = 10'b1111001110;
   invalid_symbols[511] = 10'b1111001111;
   invalid_symbols[512] = 10'b1111010000;
   invalid_symbols[513] = 10'b1111010001;
   invalid_symbols[514] = 10'b1111010010;
   invalid_symbols[515] = 10'b1111010011;
   invalid_symbols[516] = 10'b1111010100;
   invalid_symbols[517] = 10'b1111010101;
   invalid_symbols[518] = 10'b1111010110;
   invalid_symbols[519] = 10'b1111010111;
   invalid_symbols[520] = 10'b1111011000;
   invalid_symbols[521] = 10'b1111011001;
   invalid_symbols[522] = 10'b1111011010;
   invalid_symbols[523] = 10'b1111011011;
   invalid_symbols[524] = 10'b1111011100;
   invalid_symbols[525] = 10'b1111011101;
   invalid_symbols[526] = 10'b1111011110;
   invalid_symbols[527] = 10'b1111011111;
   invalid_symbols[528] = 10'b1111100000;
   invalid_symbols[529] = 10'b1111100001;
   invalid_symbols[530] = 10'b1111100010;
   invalid_symbols[531] = 10'b1111100011;
   invalid_symbols[532] = 10'b1111100100;
   invalid_symbols[533] = 10'b1111100101;
   invalid_symbols[534] = 10'b1111100110;
   invalid_symbols[535] = 10'b1111100111;
   invalid_symbols[536] = 10'b1111101000;
   invalid_symbols[537] = 10'b1111101001;
   invalid_symbols[538] = 10'b1111101010;
   invalid_symbols[539] = 10'b1111101011;
   invalid_symbols[540] = 10'b1111101100;
   invalid_symbols[541] = 10'b1111101101;
   invalid_symbols[542] = 10'b1111101110;
   invalid_symbols[543] = 10'b1111101111;
   invalid_symbols[544] = 10'b1111110000;
   invalid_symbols[545] = 10'b1111110001;
   invalid_symbols[546] = 10'b1111110010;
   invalid_symbols[547] = 10'b1111110011;
   invalid_symbols[548] = 10'b1111110100;
   invalid_symbols[549] = 10'b1111110101;
   invalid_symbols[550] = 10'b1111110110;
   invalid_symbols[551] = 10'b1111110111;
   invalid_symbols[552] = 10'b1111111000;
   invalid_symbols[553] = 10'b1111111001;
   invalid_symbols[554] = 10'b1111111010;
   invalid_symbols[555] = 10'b1111111011;
   invalid_symbols[556] = 10'b1111111100;
   invalid_symbols[557] = 10'b1111111101;
   invalid_symbols[558] = 10'b1111111110;
   invalid_symbols[559] = 10'b1111111111;
end
`endif // AXIS

endmodule // ib_xtr_tx_encoder

	
