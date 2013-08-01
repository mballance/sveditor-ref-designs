// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fire_dmc_common_srfifo.v
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
module fire_dmc_common_srfifo (
		clk, 	
		rst_l,
        enq,
		data_in,
        deq, 
		data_out,
		full,
        empty,
        overflow,
        underflow 
     );
     
//************************************************
//				PARAMETERS
//************************************************
   parameter WIDTH = 8;
   parameter DEPTH = 8;

   integer i;

//************************************************
//				PORTS
//************************************************

  input clk;                        // The input clock
  input rst_l;                      // synopsys sync_set_reset "rst_l"

  input enq;                        // enqueue into fifo
  input [WIDTH - 1:0] data_in;      // data to put in

  input deq;                        // dequeue outof fifo
  output [WIDTH - 1:0] data_out;    // data taken out

  output full;                      // full flag
  output empty;                     // empty flag 
  output overflow;                  // overflow indicater
  output underflow;                 // underflow indicater

//************************************************
//				SIGNALS
//************************************************
 
  reg [WIDTH - 1:0] sr [0 :DEPTH -1];      // fifo flops
  reg [DEPTH + 2:0] ld;                    // current load location
  reg [DEPTH + 2:0] next_ld;               // next load location
  reg [DEPTH - 1:0] vld;                   // current location has valid data
  reg [DEPTH - 1:0] next_vld;              // next location to have valid data
   
  reg empty;                               // fifo is empty
  reg overflow;                            // enqueue when fifo was full
  reg underflow;                           // dequeue when fifo was empty


//  uncoment these line for srfifo debug
//  wire [WIDTH -1:0] sr_out_7, sr_out_6, sr_out_5, sr_out_4,
//                    sr_out_3, sr_out_2, sr_out_1, sr_out_0;
   
   wire [DEPTH +2 :0] ld_init;             // to make vlint happy
   wire [DEPTH -1 :0] vld_init;            // to make vlint happy
   

// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------

 //0in fifo -enq enq -deq deq -depth DEPTH -enq_data data_in -deq_data data_out


//************************************************
// mux function just to make the code easier for 
// synthesis (like we really want a 2:1 mux)
//************************************************

function [WIDTH -1:0] reg_mux;
 input sel;
 input [WIDTH -1:0] nxdata;
 input [WIDTH -1:0] nxsrdata;

 begin
   reg_mux = sel ? nxdata : nxsrdata;
 end
endfunction


//************************************************
// the sr fifo location always gets the value on 
// next_ld. mux logic to make the code parameterized 
// and easier for synthesis
//************************************************

always @ (posedge clk)
	if(~rst_l) begin : fifo_rst
	integer j;
    for (j = 0; j < DEPTH; j = j + 1) begin
      sr[j] <= {WIDTH{1'b0}};
    end
   end
else begin
   for (i = 0; i < DEPTH -1 ; i = i+1)
     case ({enq, deq}) 	// synopsys full_case parallel_case
       2'b00: sr[i] <= sr[i];
       2'b01: sr[i] <= sr[i+1];
       2'b10: sr[i] <= reg_mux(next_ld[i+1], data_in, sr[i]);
       2'b11: sr[i] <= reg_mux(next_ld[i+1], data_in, sr[i+1]);
     endcase
   for (i = DEPTH -1; i < DEPTH ; i = i+1)
     case ({enq, deq}) 	// synopsys full_case parallel_case
       2'b00: sr[i] <= sr[i];
       2'b01: sr[i] <= data_in;
       2'b10: sr[i] <= reg_mux(next_ld[i+1], data_in, sr[i]);
       2'b11: sr[i] <= reg_mux(next_ld[i+1], data_in, sr[i]);
     endcase
end


//*********************************************
// sr_fifo load control updates when enq or deq
// valid
//*********************************************

always @ (rst_l or ld or enq or deq or ld_init)
begin
  if (!rst_l) begin
     next_ld  = {ld_init[DEPTH +2 : 1], 1'b1};	 // to make vlint happy
  end
  else begin 
   case ({enq, deq}) 	// synopsys full_case parallel_case
    2'b00: next_ld = ld;
    2'b01: next_ld = ld >> 1;
    2'b10: next_ld = ld << 1;
    2'b11: next_ld = ld;
   endcase // case({enq, deq})
  end // else: !if(!rst_l)
end // always @ (posedge clk)   

//*********************************************
// sr_fifo valid contents marker updates when enq 
// or deq  valid
//*********************************************

always @ (rst_l or vld or enq or deq or vld_init)
begin
  if (!rst_l) begin
       next_vld = 0;
    end
 else begin 
  case ({enq, deq}) 	// synopsys full_case parallel_case
   2'b00: next_vld = vld;
   2'b01: next_vld = vld >> 1;
   2'b10: next_vld = {vld_init[DEPTH -1 :1] , 1'b1}; // to make vlint happy
   2'b11: next_vld = vld;
  endcase // case({enq, deq})
 end // else: !if(!rst_l)
end // always @ (vld or enq or deq or vld_init)

//************************************************
// srfifo registered internal ld, vld    
//************************************************

always @ (posedge clk)
begin
  if (!rst_l) begin
     ld   <= {(ld_init[DEPTH +2 : 1] & 0), 1'b1};	 // to make vlint happy	 
	 vld  <= 0;	 
  end
  else begin
	 ld <= next_ld;
	 vld <= next_vld;
  end // else: !if(!rst_l)
end // always @ (posedge clk)   


//************************************************
// Outputs
//************************************************

always @ (posedge clk)
begin
  if (!rst_l) begin
	 empty <= 1'b1;
	 underflow <= 1'b0;
	 overflow <= 1'b0;
  end
  else begin
	 empty <= enq ? 1'b0 : ((deq == 1'b1) 
                            && (vld[1] == 1'b0)
                            && (ld_init[0] == 1'b1)) ? 1'b1 : empty;
     underflow <= (((vld[0]  == 1'b0)
                    && (vld_init[0] == 1'b0)
                    && (deq == 1'b1)) ? 1'b1 : underflow);
     overflow  <= (((vld[DEPTH -1] == 1'b1) & enq) ? 1'b1 : overflow);
 end
end

//********************** Assignments *************
   
   assign ld_init[DEPTH +2 :0]  = {ld[DEPTH +2 : 1], 1'b1}; // make vlint happy
   assign vld_init[DEPTH -1 :0] = vld[DEPTH -1 :0] << 1; // make vlint happy

   assign full = vld[DEPTH -2];   
   assign data_out = sr[0];


//  uncoment these line for srfifo debug
//  assign sr_out_0 = sr[DEPTH - 8];
//  assign sr_out_1 = sr[DEPTH - 7];
//  assign sr_out_2 = sr[DEPTH - 6];
//  assign sr_out_3 = sr[DEPTH - 5];
//  assign sr_out_4 = sr[DEPTH - 4];
//  assign sr_out_5 = sr[DEPTH - 3];
//  assign sr_out_6 = sr[DEPTH - 2];
//  assign sr_out_7 = sr[DEPTH - 1];

endmodule 


