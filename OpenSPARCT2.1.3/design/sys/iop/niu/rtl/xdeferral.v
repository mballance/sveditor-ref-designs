// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xdeferral.v
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
/*%W%	%G%*/

/*************************************************************************
 *
 * File Name    : xdeferral.v
 * Author Name  : John Lo
 * Description  : 
 * Parent Module: tx_xmac
 * Child  Module: none
 * Interface Mod: 
 * Date Created : 6/8/00
 *
 * Copyright (c) 2002, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

`include  "xmac.h"

module xdeferral (
   tx_clk,
   tx_reset,
   mii_mode,
   gmii_mode,
   tx_byte_count_en,
   tx_en_8bit,
   stretch_mode,
   stretch_constant,
   stretch_ratio,
   ipg_value, 
   tx_on_half, // to modify last_byte_position
   add_crc,    // cond1 plus !no_crc -> add 4 crc bytes
   eop_txclk,
   last_byte_position,
   var_min_ipg_en,
   pa_time,
   back2back_swap_reg1,
   set_back2back,
// outputs
   tx_swap,
   ipg_done,
   final_ipg_clks,
   // internal observation
   full_case_last_byte_position,
   adjust2crc_full_case_last_byte_position,
   adjust2crc_full_case_last_byte_position_is_3_or_7,
   stretch_full_case_last_byte_position,
   stretch_clks,
   stretch_bytes,
   stretch_1_more_clk,
   B_eop,
   minus_4bytes,
   no_wasted_BW // no wasted band width (bytes).
   );
   
   input 	     tx_clk;
   input 	     tx_reset;
   // vlint flag_input_port_not_connected off
   input 	     mii_mode;
   input 	     gmii_mode;
   // vlint flag_input_port_not_connected on
   input 	     tx_byte_count_en;
   input [7:0] 	     tx_en_8bit;
   input 	     stretch_mode;
   input [2:0]	     stretch_constant;
   input [4:0] 	     stretch_ratio;
   input [2:0] 	     ipg_value;
   input 	     tx_on_half; // to modify last_byte_position
   input 	     add_crc;    // cond1 plus !no_crc -> add 4 crc bytes
   input 	     eop_txclk;
   input [2:0] 	     last_byte_position;
   input 	     var_min_ipg_en;
   input 	     pa_time;
   input 	     back2back_swap_reg1;
   input 	     set_back2back;
// outputs   
   output 	     tx_swap;
   output 	     ipg_done;
   output [`BYTE]    final_ipg_clks;
   // internal observation
   output [2:0]	     full_case_last_byte_position;
   output [2:0]      adjust2crc_full_case_last_byte_position;
   output 	     adjust2crc_full_case_last_byte_position_is_3_or_7;
   output [3:0]      stretch_full_case_last_byte_position;
   output [`BYTE]    stretch_clks;
   output [2:0]      stretch_bytes;
   output 	     stretch_1_more_clk;
   output 	     B_eop;
   output 	     minus_4bytes;
   output 	     no_wasted_BW; // no wasted band width (bytes).
 

   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   // vlint flag_input_port_not_connected off
   wire 	     mii_mode;
   wire 	     gmii_mode;
   // vlint flag_input_port_not_connected on
   // vlint flag_net_has_no_load on
   // vlint flag_dangling_net_within_module on
   

/* ------------- start of stretch mode logic ---------------------- */
 // This implementation enable the residue bits to be available for
 // next coming packet ipg extension calculation.
   
   reg  [4:0] 	     addend_stretch_byte_count;
   wire [4:0] 	     new_stretch_byte_count;
   reg  [4:0] 	     nx_stretch_byte_count;
   wire [4:0] 	     stretch_byte_count;
   reg 		     stretch_1byte;
   
// addend selection mux
always @ (tx_en_8bit or tx_byte_count_en or stretch_mode)
  if (tx_byte_count_en & stretch_mode)
         casex (tx_en_8bit)  // synopsys parallel_case full_case
           8'b1xxxxxxx: addend_stretch_byte_count = 8;
           8'b01xxxxxx: addend_stretch_byte_count = 7;
           8'b001xxxxx: addend_stretch_byte_count = 6;
           8'b0001xxxx: addend_stretch_byte_count = 5;
           8'b00001xxx: addend_stretch_byte_count = 4;
           8'b000001xx: addend_stretch_byte_count = 3;
           8'b0000001x: addend_stretch_byte_count = 2;
           8'b00000001: addend_stretch_byte_count = 1;
           8'b00000000: addend_stretch_byte_count = 0;
           default:     addend_stretch_byte_count = 0;
         endcase // casex(tx_en_8bit)
   else                 addend_stretch_byte_count = 0;

// adder   
   assign new_stretch_byte_count =
                 (stretch_byte_count + addend_stretch_byte_count);
   
// subtractor   
   // The stretch_ratio in octet should not be bigger than data path width.
always @ (new_stretch_byte_count or stretch_ratio)
    if ((new_stretch_byte_count >= stretch_ratio)) 
      begin
	 // Since it exceeds stretch_ratio, one more byte is added (stretched)
	 // to IPG (stretch_1byte=1).
	 // The purpose of subtract stretch_ratio is to get the residue
	 // byte count for next round calculation.
         nx_stretch_byte_count    = new_stretch_byte_count - stretch_ratio;
	 stretch_1byte            = 1; // add one byte per stretch_ratio
      end
    else
      begin
         nx_stretch_byte_count    = new_stretch_byte_count;
         stretch_1byte            = 0;
      end
   
RegRst #(5) stretch_byte_count_RegRst(
            .clk(tx_clk),
            .reset(tx_reset | (~stretch_mode) | (pa_time & ~set_back2back)),
            .din(nx_stretch_byte_count),
            .qout(stretch_byte_count));

// stretch_size counter
   wire [10:0] stretch_size;
   wire [10:0] nx_stretch_size;

   assign     nx_stretch_size = stretch_1byte ? (stretch_size + 1) : 
                                                 stretch_size;
   
RegRst2 #(11) stretch_size_RegRst2(
              .clk(tx_clk),
              .reset(tx_reset | (~stretch_mode) | pa_time),
              .reset_value({8'b0,stretch_constant[2:0]}),
              .din(nx_stretch_size),
              .qout(stretch_size));

wire  [`BYTE]   stretch_clks  = nx_stretch_size[10:3];
wire  [2:0]     stretch_bytes = nx_stretch_size[2:0];
   
/* ------------- end of stretch mode logic ------------------------ */

/* ------------------- credit management logic  ------------------- */
  // add_crc is valid only at eop_txclk time
  // For cond2 and cond3 runt packets, the eop is always at the 3rd
  // byte of A side then add fcs to make 64 bytes to meet min pkt size.
  // tx_on_half takes care of cond2 and cond3 caes.
  // add_crc takes care of cond1 and normal cases.
  // add_crc = ~no_crc | add_fcs;

  // \\ originai implementation. Before modifying for stretch_mode.
  //   wire [2:0]  full_case_last_byte_position = tx_on_half ? 3'h3:
  //                         last_byte_position[2:0];

  wire [2:0]  org_full_case_last_byte_position = tx_on_half ? 3'h3:
                         last_byte_position[2:0];

  wire [3:0] stretch_full_case_last_byte_position = 
                      {1'b0,org_full_case_last_byte_position[2:0]} +
                      {1'b0,stretch_bytes[2:0]};

xMUX_2to1 #(3) full_case_last_byte_positio_xMUX_2to1(
                     .din0(org_full_case_last_byte_position[2:0]),
                     .din1(stretch_full_case_last_byte_position[2:0]),
                     .sel(stretch_mode),
                     .dout(full_case_last_byte_position[2:0])); 
    
   wire [2:0]  adjust2crc_full_case_last_byte_position = add_crc ? 
              (full_case_last_byte_position[2:0] + `FOUR_CRC_BYTES) :
               full_case_last_byte_position[2:0] ;
   
   wire        adjust2crc_full_case_last_byte_position_is_3_or_7 =
             (&adjust2crc_full_case_last_byte_position[`MERGE_A_B]);

   
   wire [1:0]  pos_credit = (3 -
               adjust2crc_full_case_last_byte_position[`MERGE_A_B]);
   
   wire [1:0]  neg_credit = (1 +
               adjust2crc_full_case_last_byte_position[`MERGE_A_B]);

   wire no_wasted_BW = adjust2crc_full_case_last_byte_position_is_3_or_7 &
                      (ipg_value[2:0] == 3'h3);
 

   // By default or when var_min_ipg_en == 0, the xdeferral logic will
   // generate more than 12 bytes ipg (always minus_4bytes == 0) at 
   // the end of each packet.
   //
   // In var_min_ipg_en == 1 mode. 
   // When the current_credit is negative at the eop_txclk time, the
   // minus_4bytes == 0, this will make the logic default to not subtract
   // 4 bytes ipg.  The end results of ipg shown in the waveform should
   // be longer than min_ipg (12 bytes). Vise versa.
   
   reg [4:0]   current_credit;
   wire  minus_4bytes = eop_txclk &
                       (current_credit >= `CREDIT_BIAS) & 
                       (~no_wasted_BW)  &
                        var_min_ipg_en  ;

   wire [4:0]   net_credit = minus_4bytes ? 
                    current_credit - {3'b0,neg_credit[1:0]} :
                    current_credit + {3'b0,pos_credit[1:0]} ; 
   
always @ (posedge tx_clk)
  if (tx_reset)
    current_credit <= `CREDIT_BIAS;
  else if (eop_txclk)
    current_credit <= net_credit;
  else
    current_credit <= current_credit; // hold
   
// synopsys translate_off
// diag purpose
always @ (/*AUTOSENSE*/`CREDIT_BIAS or current_credit or gmii_mode
	  or mii_mode or stretch_mode or tx_reset)
    if ( stretch_mode & (!tx_reset) & ~(mii_mode | gmii_mode) & ((current_credit < (`CREDIT_BIAS - 3)) | (current_credit > (`CREDIT_BIAS + 3))))
       $display("\n (* ERROR:  at sim time = %d, in xdeferral.v, current credit is wrong => current_credit = %h *) \n", $time, current_credit);
    else ;
// synopsys translate_on
/* ------------------- end of credit management logic  ------------ */


/* ------------------- ipg_timer logic ---------------------------- */

   // final_ipg_value is the tx_clk number which is 4 bytes in granularity.
   // @ eop_txclk only
   wire [2:0]    final_ipg_value = ipg_value[2:0] - {2'b0,minus_4bytes};

// synopsys translate_off 
// diag purpose
always @ (/*AUTOSENSE*/final_ipg_value or gmii_mode or mii_mode
	  or stretch_mode or tx_reset)
    if ( stretch_mode & (!tx_reset) & ~(mii_mode | gmii_mode)  & (final_ipg_value < 2))
       $display("\n (* ERROR:  at sim time = %d, in xdeferral.v, final_ipg_value less than 2 clk (less than 8 byte times), final_ipg_value = %h *) \n", $time, final_ipg_value);
    else ;
// synopsys translate_on   

   reg 		 temp_tx_swap;
   reg 		 set_tx_swap;
   reg [`BYTE]   ipg_timer;
   reg [2:0]	 rounded_ipg_clks;
   wire          ipg_timer_ce = (|ipg_timer[`BYTE]);
   wire          ipg_done     =  ~ipg_timer_ce;

   // It has to use nx_ipg_extension_count. Since eop_txclk and
   // inc_ipg_extension_count can happen at the same time.
   wire 	 stretch_1_more_clk = stretch_mode & 
                 stretch_full_case_last_byte_position[3];
   
   wire [`BYTE]  final_ipg_clks = {5'b0,rounded_ipg_clks[2:0]}  + 
                                           stretch_clks[`BYTE] +
                                  {7'b0,stretch_1_more_clk};

always @ (posedge tx_clk)
if   (tx_reset)
             begin
               temp_tx_swap   <= 0             ;
               ipg_timer      <= 0             ;
             end
else if (eop_txclk) // load final_ipg_value at eop time.
             begin
               temp_tx_swap   <= set_tx_swap   ;
               ipg_timer      <= final_ipg_clks;
             end
else if (ipg_timer_ce)
             begin
               temp_tx_swap   <= temp_tx_swap  ;  // hold
               ipg_timer      <= ipg_timer - 1 ; // 8 byte time per txclk
             end
else  // hold
             begin
               temp_tx_swap   <= temp_tx_swap  ;  // hold
               ipg_timer      <= ipg_timer     ;
             end

xREG #(1) tx_swap_xREG(.din(temp_tx_swap),
                       .clk(tx_clk),
                       .en(pa_time),
                       .reset(tx_reset),
                       .qout(tx_swap));
   
   wire B_eop = full_case_last_byte_position[2]; // eop byte is in byte 4~7.
   
always @ (/*AUTOSENSE*/B_eop or add_crc or back2back_swap_reg1
	  or eop_txclk or final_ipg_value)
  if (eop_txclk)
  casex (final_ipg_value)         // synopsys parallel_case full_case
    3'h2: casex ({add_crc,B_eop}) // synopsys parallel_case full_case
	    2'b00: begin // eop in A side
	             rounded_ipg_clks = {2'b0,back2back_swap_reg1} ? 3'd1 : 3'd0;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b0 : 1'b1; // flip
	           end
	    2'b01: begin // eop in B side
	             rounded_ipg_clks =                        3'd1;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b1 : 1'b0; // flip
	           end
	    2'b10: begin // eop in A side
	             rounded_ipg_clks =                        3'd1;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b1 : 1'b0; // flip
	           end
	    2'b11: begin // eop in B side
	             rounded_ipg_clks = {2'b0,back2back_swap_reg1} ? 3'd2 : 3'd1;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b0 : 1'b1; // flip
	           end
          endcase 
    
    3'h3: casex ({add_crc,B_eop}) // synopsys parallel_case full_case
	    2'b00: begin // eop in A side
	             rounded_ipg_clks =                        3'd1;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b1 : 1'b0; // flip
	           end
	    2'b01: begin // eop in B side
	             rounded_ipg_clks = {2'b0,back2back_swap_reg1} ? 3'd2 : 3'd1;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b0 : 1'b1; // flip
	           end
	    2'b10: begin // eop in A side
	             rounded_ipg_clks = {2'b0,back2back_swap_reg1} ? 3'd2 : 3'd1;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b0 : 1'b1; // flip
	           end
	    2'b11: begin // eop in B side
	             rounded_ipg_clks =                           3'd2;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b1 : 1'b0; // flip
	           end
          endcase 
    
    3'h4: casex ({add_crc,B_eop}) // synopsys parallel_case full_case
	    2'b00: begin // eop in A side
	             rounded_ipg_clks = {2'b0,back2back_swap_reg1} ? 3'd2 : 3'd1;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b0 : 1'b1;
	           end
	    2'b01: begin // eop in B side
	             rounded_ipg_clks =                           3'd2;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b1 : 1'b0;
	           end
	    2'b10: begin // eop in A side
	             rounded_ipg_clks =                           3'd2;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b1 : 1'b0;
	           end
	    2'b11: begin // eop in B side
	             rounded_ipg_clks = {2'b0,back2back_swap_reg1} ? 3'd3 : 3'd2;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b0 : 1'b1;
	           end
          endcase 
    
    3'h5: casex ({add_crc,B_eop}) // synopsys parallel_case full_case
	    2'b00: begin // eop in A side
	             rounded_ipg_clks =                           3'd2;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b1 : 1'b0;
	           end
	    2'b01: begin // eop in B side
	             rounded_ipg_clks = {2'b0,back2back_swap_reg1} ? 3'd3 : 3'd2;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b0 : 1'b1;
	           end
	    2'b10: begin // eop in A side
	             rounded_ipg_clks = {2'b0,back2back_swap_reg1} ? 3'd3 : 3'd2;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b0 : 1'b1;
	           end
	    2'b11: begin // eop in B side
	             rounded_ipg_clks =                           3'd3;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b1 : 1'b0;
	           end
          endcase 
    
    3'h6: casex ({add_crc,B_eop}) // synopsys parallel_case full_case
	    2'b00: begin // eop in A side
	             rounded_ipg_clks = {2'b0,back2back_swap_reg1} ? 3'd3 : 3'd2;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b0 : 1'b1;
	           end
	    2'b01: begin // eop in B side
	             rounded_ipg_clks =                           3'd3;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b1 : 1'b0;
	           end
	    2'b10: begin // eop in A side
	             rounded_ipg_clks =                           3'd3;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b1 : 1'b0;
	           end
	    2'b11: begin // eop in B side
	             rounded_ipg_clks = {2'b0,back2back_swap_reg1} ? 3'd4 : 3'd3;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b0 : 1'b1;
	           end
          endcase 
    
    3'h7: casex ({add_crc,B_eop}) // synopsys parallel_case full_case
	    2'b00: begin // eop in A side
	             rounded_ipg_clks =                           3'd3;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b1 : 1'b0;
	           end
	    2'b01: begin // eop in B side
	             rounded_ipg_clks = {2'b0,back2back_swap_reg1} ? 3'd4 : 3'd3;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b0 : 1'b1;
	           end
	    2'b10: begin // eop in A side
	             rounded_ipg_clks = {2'b0,back2back_swap_reg1} ? 3'd4 : 3'd3;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b0 : 1'b1;
	           end
	    2'b11: begin // eop in B side
	             rounded_ipg_clks =                           3'd4;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b1 : 1'b0;
	           end
          endcase 
    
     default: // default to final_ipg_value = 3
       begin
          casex ({add_crc,B_eop}) // synopsys parallel_case full_case
	    2'b00: begin // eop in A side
	             rounded_ipg_clks =                           3'd1;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b1 : 1'b0;
	           end
	    2'b01: begin // eop in B side
	             rounded_ipg_clks = {2'b0,back2back_swap_reg1} ? 3'd2 : 3'd1;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b0 : 1'b1;
	           end
	    2'b10: begin // eop in A side
	             rounded_ipg_clks = {2'b0,back2back_swap_reg1} ? 3'd2 : 3'd1;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b0 : 1'b1;
	           end
	    2'b11: begin // eop in B side
	             rounded_ipg_clks =                           3'd2;
	             set_tx_swap      = back2back_swap_reg1 ? 1'b1 : 1'b0;
	           end
          endcase // casex({add_crc,B_eop})
       end // case: endcase...
  endcase // casex(final_ipg_value)
  else begin
	             rounded_ipg_clks =                           3'd2;
	             set_tx_swap      =                           1'b0;
       end // else: !if(eop_txclk)
   

/* ------------------- end of ipg_timer logic --------------------- */
     
endmodule // xdeferral
