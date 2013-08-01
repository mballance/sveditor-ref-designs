//////////////////////////////////////////////////////////////////////
////                                                              ////
////  uart_transmitter.v                                          ////
////                                                              ////
////                                                              ////
////  This file is part of the "UART 16550 compatible" project    ////
////  http://www.opencores.org/cores/uart16550/                   ////
////                                                              ////
////  Documentation related to this project:                      ////
////  - http://www.opencores.org/cores/uart16550/                 ////
////                                                              ////
////  Projects compatibility:                                     ////
////  - WISHBONE                                                  ////
////  RS232 Protocol                                              ////
////  16550D uart (mostly supported)                              ////
////                                                              ////
////  Overview (main Features):                                   ////
////  UART core transmitter logic                                 ////
////                                                              ////
////  Known problems (limits):                                    ////
////  None known                                                  ////
////                                                              ////
////  To Do:                                                      ////
////  Thourough testing.                                          ////
////                                                              ////
////  Author(s):                                                  ////
////      - gorban@opencores.org                                  ////
////      - Jacob Gorban                                          ////
////      - Igor Mohor (igorm@opencores.org)                      ////
////                                                              ////
////  Created:        2001/05/12                                  ////
////  Last Updated:   2001/05/17                                  ////
////                  (See log for the revision history)          ////
////                                                              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000, 2001 Authors                             ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: uart_transmitter.v,v $
// Revision 1.19  2002/07/29 21:16:18  gorban
// The uart_defines.v file is included again in sources.
//
// Revision 1.18  2002/07/22 23:02:23  gorban
// Bug Fixes:
//  * Possible loss of sync and bad reception of stop bit on slow baud rates fixed.
//   Problem reported by Kenny.Tung.
//  * Bad (or lack of ) loopback handling fixed. Reported by Cherry Withers.
//
// Improvements:
//  * Made FIFO's as general inferrable memory where possible.
//  So on FPGA they should be inferred as RAM (Distributed RAM on Xilinx).
//  This saves about 1/3 of the Slice count and reduces P&R and synthesis times.
//
//  * Added optional baudrate output (baud_o).
//  This is identical to BAUDOUT* signal on 16550 chip.
//  It outputs 16xbit_clock_rate - the divided clock.
//  It's disabled by default. Define UART_HAS_BAUDRATE_OUTPUT to use.
//
// Revision 1.16  2002/01/08 11:29:40  mohor
// tf_pop was too wide. Now it is only 1 clk cycle width.
//
// Revision 1.15  2001/12/17 14:46:48  mohor
// overrun signal was moved to separate block because many sequential lsr
// reads were preventing data from being written to rx fifo.
// underrun signal was not used and was removed from the project.
//
// Revision 1.14  2001/12/03 21:44:29  gorban
// Updated specification documentation.
// Added full 32-bit data bus interface, now as default.
// Address is 5-bit wide in 32-bit data bus mode.
// Added wb_sel_i input to the core. It's used in the 32-bit mode.
// Added debug interface with two 32-bit read-only registers in 32-bit mode.
// Bits 5 and 6 of LSR are now only cleared on TX FIFO write.
// My small test bench is modified to work with 32-bit mode.
//
// Revision 1.13  2001/11/08 14:54:23  mohor
// Comments in Slovene language deleted, few small fixes for better work of
// old tools. IRQs need to be fix.
//
// Revision 1.12  2001/11/07 17:51:52  gorban
// Heavily rewritten interrupt and LSR subsystems.
// Many bugs hopefully squashed.
//
// Revision 1.11  2001/10/29 17:00:46  gorban
// fixed parity sending and tx_fifo resets over- and underrun
//
// Revision 1.10  2001/10/20 09:58:40  gorban
// Small synopsis fixes
//
// Revision 1.9  2001/08/24 21:01:12  mohor
// Things connected to parity changed.
// Clock devider changed.
//
// Revision 1.8  2001/08/23 16:05:05  mohor
// Stop bit bug fixed.
// Parity bug fixed.
// WISHBONE read cycle bug fixed,
// OE indicator (Overrun Error) bug fixed.
// PE indicator (Parity Error) bug fixed.
// Register read bug fixed.
//
// Revision 1.6  2001/06/23 11:21:48  gorban
// DL made 16-bit long. Fixed transmission/reception bugs.
//
// Revision 1.5  2001/06/02 14:28:14  gorban
// Fixed receiver and transmitter. Major bug fixed.
//
// Revision 1.4  2001/05/31 20:08:01  gorban
// FIFO changes and other corrections.
//
// Revision 1.3  2001/05/27 17:37:49  gorban
// Fixed many bugs. Updated spec. Changed FIFO files structure. See CHANGES.txt file.
//
// Revision 1.2  2001/05/21 19:12:02  gorban
// Corrected some Linter messages.
//
// Revision 1.1  2001/05/17 18:34:18  gorban
// First 'stable' release. Should be sythesizable now. Also added new header.
//
// Revision 1.0  2001-05-17 21:27:12+02  jacob
// Initial revision
//
//


`timescale 1 ns / 10 ps
module uart_transmitter(clk, wb_rst_i, lcr, tf_push, wb_dat_i, enable, 
	stx_pad_o, tstate, tf_count, tx_reset, lsr_mask);

	parameter		s_idle		= 3'b0;
	parameter		s_send_start	= 3'b1;
	parameter		s_send_byte	= 3'd2;
	parameter		s_send_parity	= 3'd3;
	parameter		s_send_stop	= 3'd4;
	parameter		s_pop_byte	= 3'd5;

	input			clk;
	input			wb_rst_i;
	input	[7:0]		lcr;
	input			tf_push;
	input	[7:0]		wb_dat_i;
	input			enable;
	input			tx_reset;
	input			lsr_mask;
	output			stx_pad_o;
	output	[2:0]		tstate;
	output	[(5 - 1):0]	tf_count;

	reg	[4:0]		counter;
	reg	[2:0]		bit_counter;
	reg	[6:0]		shift_out;
	reg			stx_o_tmp;
	reg			parity_xor;
	reg			tf_pop;
	reg			bit_out;
	reg	[(8 - 1):0]	tf_data_in;
	wire	[(8 - 1):0]	tf_data_out;
	reg	[2:0]		tstate;
	wire			tf_overrun;

	assign stx_pad_o = (lcr[6] ? 1'b0 : stx_o_tmp);

	uart_tfifo fifo_tx(
		.clk				(clk), 
		.wb_rst_i			(wb_rst_i), 
		.data_in			(tf_data_in), 
		.data_out			(tf_data_out), 
		.push				(tf_push), 
		.pop				(tf_pop), 
		.overrun			(tf_overrun), 
		.count				(tf_count), 
		.fifo_reset			(tx_reset), 
		.reset_status			(lsr_mask));

	always @(posedge clk) tf_data_in <= wb_dat_i;
	always @(posedge clk or posedge wb_rst_i) begin
	  if (wb_rst_i) begin
	    tstate <= #(1) s_idle;
	    stx_o_tmp <= #(1) 1'b1;
	    counter <= #(1) 5'b0;
	    shift_out <= #(1) 7'b0;
	    bit_out <= #(1) 1'b0;
	    parity_xor <= #(1) 1'b0;
	    tf_pop <= #(1) 1'b0;
	    bit_counter <= #(1) 3'b0;
	  end
	  else if (enable) begin
	    case (tstate)
	      s_idle:
		if (~|tf_count) begin
		  tstate <= #(1) s_idle;
		  stx_o_tmp <= #(1) 1'b1;
		end
		else
		  begin
		    tf_pop <= #(1) 1'b0;
		    stx_o_tmp <= #(1) 1'b1;
		    tstate <= #(1) s_pop_byte;
		  end
	      s_pop_byte: begin
		tf_pop <= #(1) 1'b1;
		case (lcr[1:0])
		  2'b0: begin
		    bit_counter <= #(1) 3'd4;
		    parity_xor <= #(1) (^tf_data_out[4:0]);
		  end
		  2'b1: begin
		    bit_counter <= #(1) 3'd5;
		    parity_xor <= #(1) (^tf_data_out[5:0]);
		  end
		  2'b10: begin
		    bit_counter <= #(1) 3'd6;
		    parity_xor <= #(1) (^tf_data_out[6:0]);
		  end
		  2'b11: begin
		    bit_counter <= #(1) 3'd7;
		    parity_xor <= #(1) (^tf_data_out[7:0]);
		  end
		endcase
		{shift_out[6:0], bit_out} <= #(1) tf_data_out;
		tstate <= #(1) s_send_start;
	      end
	      s_send_start: begin
		tf_pop <= #(1) 1'b0;
		if (~|counter) begin
		  counter <= #(1) 5'b01111;
		end
		else if (counter == 5'b1) begin
		  counter <= #(1) 0;
		  tstate <= #(1) s_send_byte;
		end
		else begin
		  counter <= #(1) (counter - 1'b1);
		end
		stx_o_tmp <= #(1) 1'b0;
	      end
	      s_send_byte: begin
		if (~|counter) begin
		  counter <= #(1) 5'b01111;
		end
		else if (counter == 5'b1) begin
		  if (bit_counter > 3'b0) begin
		    bit_counter <= #(1) (bit_counter - 1'b1);
		    {shift_out[5:0], bit_out} <= #(1) {shift_out[6:1], 
			    shift_out[0]};
		    tstate <= #(1) s_send_byte;
		  end
		  else if (~lcr[3]) begin
		    tstate <= #(1) s_send_stop;
		  end
		  else
		    begin
		      case ({lcr[4], lcr[5]})
			2'b0:
			  bit_out <= #(1) (~parity_xor);
			2'b1:
			  bit_out <= #(1) 1'b1;
			2'b10:
			  bit_out <= #(1) parity_xor;
			2'b11:
			  bit_out <= #(1) 1'b0;
		      endcase
		      tstate <= #(1) s_send_parity;
		    end
		  counter <= #(1) 0;
		end
		else begin
		  counter <= #(1) (counter - 1'b1);
		end
		stx_o_tmp <= #(1) bit_out;
	      end
	      s_send_parity: begin
		if (~|counter) begin
		  counter <= #(1) 5'b01111;
		end
		else if (counter == 5'b1) begin
		  counter <= #(1) 4'b0;
		  tstate <= #(1) s_send_stop;
		end
		else begin
		  counter <= #(1) (counter - 1'b1);
		end
		stx_o_tmp <= #(1) bit_out;
	      end
	      s_send_stop: begin
		if (~|counter) begin
		  casex ({lcr[2], lcr[1:0]})
		    3'b0xx:
		      counter <= #(1) 5'b01101;
		    3'd4:
		      counter <= #(1) 5'b10101;
		    default:
		      counter <= #(1) 5'b11101;
		  endcase
		end
		else if (counter == 5'b1) begin
		  counter <= #(1) 0;
		  tstate <= #(1) s_idle;
		end
		else begin
		  counter <= #(1) (counter - 1'b1);
		end
		stx_o_tmp <= #(1) 1'b1;
	      end
	      default:
		tstate <= #(1) s_idle;
	    endcase
	  end
	  else begin
	    tf_pop <= #(1) 1'b0;
	  end
	end
endmodule
