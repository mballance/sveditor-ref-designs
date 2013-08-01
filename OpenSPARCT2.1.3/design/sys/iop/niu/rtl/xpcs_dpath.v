// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xpcs_dpath.v
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
module xpcs_dpath ( tx_clk, rx_clk, rbc0_b, rbc0_c, rbc0_d, 
                    csr_loopback, csr_enable_tx_buffers, 
                    tx_symbols_mux, rx_symbols_mux, 
                    rx_symbols_dft, tx_symbols_dft,
                    rx_symbols_dft_dummy,
                    xrx_code_group_muxout, xtx_code_group);

input        tx_clk;

input        rx_clk;        // rbc0_a 312 Mhz rx clock from serdes
input        rbc0_b;        // 312 Mhz rx clock from serdes
input        rbc0_c;        // 312 Mhz rx clock from serdes
input        rbc0_d;        // 312 Mhz rx clock from serdes

input        csr_loopback;
input        csr_enable_tx_buffers;
input [39:0] tx_symbols_mux;
input [39:0] rx_symbols_mux;

input [39:0] rx_symbols_dft;

output [39:0] tx_symbols_dft;
 
output [39:0] xrx_code_group_muxout;
output [39:0] xtx_code_group;

output        rx_symbols_dft_dummy;

reg [39:0] xtx_code_group;
reg [39:0] rx_symbols_reg;

reg [39:0] rx_symbols_dft_reg;
reg [39:0] tx_symbols_dft;

reg        rx_symbols_dft_dummy;

wire [39:0] xrx_code_group_muxout;

wire [9:0] rx_symbol_0;
wire [9:0] rx_symbol_1;
wire [9:0] rx_symbol_2;
wire [9:0] rx_symbol_3;

wire [9:0] tx_symbol_0;
wire [9:0] tx_symbol_1;
wire [9:0] tx_symbol_2;
wire [9:0] tx_symbol_3;


// *****************************************************************************
//    Flip data msb -> lsb per Symbol and Register receive data from serdes
// *****************************************************************************

assign rx_symbol_3 = {rx_symbols_mux[30],
                      rx_symbols_mux[31],
                      rx_symbols_mux[32],
                      rx_symbols_mux[33],
                      rx_symbols_mux[34],
                      rx_symbols_mux[35],
                      rx_symbols_mux[36],
                      rx_symbols_mux[37],
                      rx_symbols_mux[38],
                      rx_symbols_mux[39]};

assign rx_symbol_2 = {rx_symbols_mux[20],
                      rx_symbols_mux[21],
                      rx_symbols_mux[22],
                      rx_symbols_mux[23],
                      rx_symbols_mux[24],
                      rx_symbols_mux[25],
                      rx_symbols_mux[26],
                      rx_symbols_mux[27],
                      rx_symbols_mux[28],
                      rx_symbols_mux[29]};

assign rx_symbol_1 = {rx_symbols_mux[10],
                      rx_symbols_mux[11],
                      rx_symbols_mux[12],
                      rx_symbols_mux[13],
                      rx_symbols_mux[14],
                      rx_symbols_mux[15],
                      rx_symbols_mux[16],
                      rx_symbols_mux[17],
                      rx_symbols_mux[18],
                      rx_symbols_mux[19]};

assign rx_symbol_0 = {rx_symbols_mux[0],
                      rx_symbols_mux[1],
                      rx_symbols_mux[2],
                      rx_symbols_mux[3],
                      rx_symbols_mux[4],
                      rx_symbols_mux[5],
                      rx_symbols_mux[6],
                      rx_symbols_mux[7],
                      rx_symbols_mux[8],
                      rx_symbols_mux[9]};

always @ (posedge rx_clk)
    begin
     rx_symbols_reg[9:0]  <= rx_symbol_0 ;
    end

always @ (posedge rbc0_b)
    begin
     rx_symbols_reg[19:10] <= rx_symbol_1 ;
    end

always @ (posedge rbc0_c)
    begin
     rx_symbols_reg[29:20] <= rx_symbol_2 ;
    end

always @ (posedge rbc0_d) 
    begin
     rx_symbols_reg[39:30] <= rx_symbol_3 ;
    end


// *****************************************************************************
//    Flip data msb -> lsb per Symbol and Register transmit data to serdes
// *****************************************************************************

assign tx_symbol_3 = {tx_symbols_mux[30],
                      tx_symbols_mux[31],
                      tx_symbols_mux[32],
                      tx_symbols_mux[33],
                      tx_symbols_mux[34],
                      tx_symbols_mux[35],
                      tx_symbols_mux[36],
                      tx_symbols_mux[37],
                      tx_symbols_mux[38],
                      tx_symbols_mux[39]};

assign tx_symbol_2 = {tx_symbols_mux[20],
                      tx_symbols_mux[21],
                      tx_symbols_mux[22],
                      tx_symbols_mux[23],
                      tx_symbols_mux[24],
                      tx_symbols_mux[25],
                      tx_symbols_mux[26],
                      tx_symbols_mux[27],
                      tx_symbols_mux[28],
                      tx_symbols_mux[29]};

assign tx_symbol_1 = {tx_symbols_mux[10],
                      tx_symbols_mux[11],
                      tx_symbols_mux[12],
                      tx_symbols_mux[13],
                      tx_symbols_mux[14],
                      tx_symbols_mux[15],
                      tx_symbols_mux[16],
                      tx_symbols_mux[17],
                      tx_symbols_mux[18],
                      tx_symbols_mux[19]};

assign tx_symbol_0 = {tx_symbols_mux[0],
                      tx_symbols_mux[1],
                      tx_symbols_mux[2],
                      tx_symbols_mux[3],
                      tx_symbols_mux[4],
                      tx_symbols_mux[5],
                      tx_symbols_mux[6],
                      tx_symbols_mux[7],
                      tx_symbols_mux[8],
                      tx_symbols_mux[9]};

always @ (posedge tx_clk)
   xtx_code_group <=  csr_enable_tx_buffers ? {tx_symbol_3,
                                               tx_symbol_2, 
                                               tx_symbol_1, 
                                               tx_symbol_0} : 40'b0 ; 


// **********************************************************************
//   Loopback Mux 
// **********************************************************************

assign xrx_code_group_muxout = csr_loopback ? tx_symbols_mux : rx_symbols_reg ;


// **********************************************************************
//   NEC serdes dft requires registering unused Serdes inputs and outputs 
// **********************************************************************

always @ (posedge tx_clk)
   tx_symbols_dft <= 40'h0000000000;


always @ (posedge rx_clk)
    begin
     rx_symbols_dft_reg[9:0]  <= rx_symbols_dft[9:0] ;
    end

always @ (posedge rbc0_b)
    begin
     rx_symbols_dft_reg[19:10] <= rx_symbols_dft[19:10] ;
    end

always @ (posedge rbc0_c)
    begin
     rx_symbols_dft_reg[29:20] <= rx_symbols_dft[29:20] ;
    end

always @ (posedge rbc0_d)
    begin
     rx_symbols_dft_reg[39:30] <= rx_symbols_dft[39:30] ;
    end


// summit modcovoff -bpe

always @ (posedge rx_clk)
    begin
     rx_symbols_dft_dummy <= |rx_symbols_dft_reg ;
    end

// summit modcovon -bpe




endmodule
