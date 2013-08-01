//////////////////////////////////////////////////////////////////////
////                                                              ////
////  uart_sync_flops.v                                             ////
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
////  UART core receiver logic                                    ////
////                                                              ////
////  Known problems (limits):                                    ////
////  None known                                                  ////
////                                                              ////
////  To Do:                                                      ////
////  Thourough testing.                                          ////
////                                                              ////
////  Author(s):                                                  ////
////      - Andrej Erzen (andreje@flextronics.si)                 ////
////      - Tadej Markovic (tadejm@flextronics.si)                ////
////                                                              ////
////  Created:        2004/05/20                                  ////
////  Last Updated:   2004/05/20                                  ////
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
// $Log: uart_sync_flops.v,v $
// Revision 1.1  2004/05/21 11:43:25  tadejm
// Added to synchronize RX input to Wishbone clock.
//
//

`timescale 1 ns / 10 ps
module uart_sync_flops(rst_i, clk_i, stage1_rst_i, stage1_clk_en_i, async_dat_i,
	sync_dat_o);

	parameter		Tp		= 1;
	parameter		width		= 1;
	parameter		init_value	= 1'b0;

	input			rst_i;
	input			clk_i;
	input			stage1_rst_i;
	input			stage1_clk_en_i;
	input	[(width - 1):0]	async_dat_i;
	output	[(width - 1):0]	sync_dat_o;

	reg	[(width - 1):0]	sync_dat_o;
	reg	[(width - 1):0]	flop_0;

	always @(posedge clk_i or posedge rst_i) begin
	  if (rst_i) begin
	    flop_0 <= #(Tp) {width {init_value}};
	  end
	  else begin
	    flop_0 <= #(Tp) async_dat_i;
	  end
	end
	always @(posedge clk_i or posedge rst_i) begin
	  if (rst_i) begin
	    sync_dat_o <= #(Tp) {width {init_value}};
	  end
	  else if (stage1_rst_i) begin
	    sync_dat_o <= #(Tp) {width {init_value}};
	  end
	  else if (stage1_clk_en_i) begin
	    sync_dat_o <= #(Tp) flop_0;
	  end
	end
endmodule
