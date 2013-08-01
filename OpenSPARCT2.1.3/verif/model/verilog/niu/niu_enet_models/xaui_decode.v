// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xaui_decode.v
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
module xaui_decode( data,clk,decode,bit_reverse );
   input [9:0] data;
   input clk;
   input decode;
   input bit_reverse;
   reg [9:0] data_decode;


   reg [127:0] code;
   always@(posedge clk) begin
      if(decode) begin
	 if(bit_reverse)
	   data_decode = {data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7],data[8],data[9]};

	 else data_decode = data;
	 case(data_decode)
	   
	   10'b1001110100: code = "D0.0-RD-";     10'b0110001011: code = "D0.0-RD+";  
	   10'b0111010100: code = "D1.0-RD-";     10'b1000101011: code = "D1.0-RD+";  
	   10'b1011010100: code = "D2.0-RD-";     10'b0100101011: code = "D2.0-RD+";  
	   10'b1100011011: code = "D3.0-RD-";     10'b1100010100: code = "D3.0-RD+";  
	   10'b1101010100: code = "D4.0-RD-";     10'b0010101011: code = "D4.0-RD+";  
	   10'b1010011011: code = "D5.0-RD-";     10'b1010010100: code = "D5.0-RD+";  
	   10'b0110011011: code = "D6.0-RD-";     10'b0110010100: code = "D6.0-RD+";  
	   10'b1110001011: code = "D7.0-RD-";     10'b0001110100: code = "D7.0-RD+";  
	   10'b1110010100: code = "D8.0-RD-";     10'b0001101011: code = "D8.0-RD+";  
	   10'b1001011011: code = "D9.0-RD-";     10'b1001010100: code = "D9.0-RD+";  
	   10'b0101011011: code = "D10.0-RD-";     10'b0101010100: code = "D10.0-RD+";  
	   10'b1101001011: code = "D11.0-RD-";     10'b1101000100: code = "D11.0-RD+";  
	   10'b0011011011: code = "D12.0-RD-";     10'b0011010100: code = "D12.0-RD+";  
	   10'b1011001011: code = "D13.0-RD-";     10'b1011000100: code = "D13.0-RD+";  
	   10'b0111001011: code = "D14.0-RD-";     10'b0111000100: code = "D14.0-RD+";  
	   10'b0101110100: code = "D15.0-RD-";     10'b1010001011: code = "D15.0-RD+";  
	   10'b0110110100: code = "D16.0-RD-";     10'b1001001011: code = "D16.0-RD+";  
	   10'b1000111011: code = "D17.0-RD-";     10'b1000110100: code = "D17.0-RD+";  
	   10'b0100111011: code = "D18.0-RD-";     10'b0100110100: code = "D18.0-RD+";  
	   10'b1100101011: code = "D19.0-RD-";     10'b1100100100: code = "D19.0-RD+";  
	   10'b0010111011: code = "D20.0-RD-";     10'b0010110100: code = "D20.0-RD+";  
	   10'b1010101011: code = "D21.0-RD-";     10'b1010100100: code = "D21.0-RD+";  
	   10'b0110101011: code = "D22.0-RD-";     10'b0110100100: code = "D22.0-RD+";  
	   10'b1110100100: code = "D23.0-RD-";     10'b0001011011: code = "D23.0-RD+";  
	   10'b1100110100: code = "D24.0-RD-";     10'b0011001011: code = "D24.0-RD+";  
	   10'b1001101011: code = "D25.0-RD-";     10'b1001100100: code = "D25.0-RD+";  
	   10'b0101101011: code = "D26.0-RD-";     10'b0101100100: code = "D26.0-RD+";  
	   10'b1101100100: code = "D27.0-RD-";     10'b0010011011: code = "D27.0-RD+";  
	   10'b0011101011: code = "D28.0-RD-";     10'b0011100100: code = "D28.0-RD+";  
	   10'b1011100100: code = "D29.0-RD-";     10'b0100011011: code = "D29.0-RD+";  
	   10'b0111100100: code = "D30.0-RD-";     10'b1000011011: code = "D30.0-RD+";  
	   10'b1010110100: code = "D31.0-RD-";     10'b0101001011: code = "D31.0-RD+";  
	   10'b1001111001: code = "D0.1-RD-";     10'b0110001001: code = "D0.1-RD+";  
	   10'b0111011001: code = "D1.1-RD-";     10'b1000101001: code = "D1.1-RD+";  
	   10'b1011011001: code = "D2.1-RD-";     10'b0100101001: code = "D2.1-RD+";  
	   10'b1100011001: code = "D3.1-RD-";     10'b1100011001: code = "D3.1-RD+";  
	   10'b1101011001: code = "D4.1-RD-";     10'b0010101001: code = "D4.1-RD+";  
	   10'b1010011001: code = "D5.1-RD-";     10'b1010011001: code = "D5.1-RD+";  
	   10'b0110011001: code = "D6.1-RD-";     10'b0110011001: code = "D6.1-RD+";  
	   10'b1110001001: code = "D7.1-RD-";     10'b0001111001: code = "D7.1-RD+";  
	   10'b1110011001: code = "D8.1-RD-";     10'b0001101001: code = "D8.1-RD+";  
	   10'b1001011001: code = "D9.1-RD-";     10'b1001011001: code = "D9.1-RD+";  
	   10'b0101011001: code = "D10.1-RD-";     10'b0101011001: code = "D10.1-RD+";  
	   10'b1101001001: code = "D11.1-RD-";     10'b1101001001: code = "D11.1-RD+";  
	   10'b0011011001: code = "D12.1-RD-";     10'b0011011001: code = "D12.1-RD+";  
	   10'b1011001001: code = "D13.1-RD-";     10'b1011001001: code = "D13.1-RD+";  
	   10'b0111001001: code = "D14.1-RD-";     10'b0111001001: code = "D14.1-RD+";  
	   10'b0101111001: code = "D15.1-RD-";     10'b1010001001: code = "D15.1-RD+";  
	   10'b0110111001: code = "D16.1-RD-";     10'b1001001001: code = "D16.1-RD+";  
	   10'b1000111001: code = "D17.1-RD-";     10'b1000111001: code = "D17.1-RD+";  
	   10'b0100111001: code = "D18.1-RD-";     10'b0100111001: code = "D18.1-RD+";  
	   10'b1100101001: code = "D19.1-RD-";     10'b1100101001: code = "D19.1-RD+";  
	   10'b0010111001: code = "D20.1-RD-";     10'b0010111001: code = "D20.1-RD+";  
	   10'b1010101001: code = "D21.1-RD-";     10'b1010101001: code = "D21.1-RD+";  
	   10'b0110101001: code = "D22.1-RD-";     10'b0110101001: code = "D22.1-RD+";  
	   10'b1110101001: code = "D23.1-RD-";     10'b0001011001: code = "D23.1-RD+";  
	   10'b1100111001: code = "D24.1-RD-";     10'b0011001001: code = "D24.1-RD+";  
	   10'b1001101001: code = "D25.1-RD-";     10'b1001101001: code = "D25.1-RD+";  
	   10'b0101101001: code = "D26.1-RD-";     10'b0101101001: code = "D26.1-RD+";  
	   10'b1101101001: code = "D27.1-RD-";     10'b0010011001: code = "D27.1-RD+";  
	   10'b0011101001: code = "D28.1-RD-";     10'b0011101001: code = "D28.1-RD+";                                	   10'b1011101001: code = "D29.1-RD-";     10'b0100011001: code = "D29.1-RD+";  
	   10'b0111101001: code = "D30.1-RD-";     10'b1000011001: code = "D30.1-RD+";  
	   10'b1010111001: code = "D31.1-RD-";     10'b0101001001: code = "D31.1-RD+";  
	   10'b1001110101: code = "D0.2-RD-";     10'b0110000101: code = "D0.2-RD+";  
	   10'b0111010101: code = "D1.2-RD-";     10'b1000100101: code = "D1.2-RD+";  
	   10'b1011010101: code = "D2.2-RD-";     10'b0100100101: code = "D2.2-RD+";  
	   10'b1100010101: code = "D3.2-RD-";     10'b1100010101: code = "D3.2-RD+";  
	   10'b1101010101: code = "D4.2-RD-";     10'b0010100101: code = "D4.2-RD+";  
	   10'b1010010101: code = "D5.2-RD-";     10'b1010010101: code = "D5.2-RD+";  
	   10'b0110010101: code = "D6.2-RD-";     10'b0110010101: code = "D6.2-RD+";  
	   10'b1110000101: code = "D7.2-RD-";     10'b0001110101: code = "D7.2-RD+";  
	   10'b1110010101: code = "D8.2-RD-";     10'b0001100101: code = "D8.2-RD+";  
	   10'b1001010101: code = "D9.2-RD-";     10'b1001010101: code = "D9.2-RD+";  
	   10'b0101010101: code = "D10.2-RD-";     10'b0101010101: code = "D10.2-RD+";  
	   10'b1101000101: code = "D11.2-RD-";     10'b1101000101: code = "D11.2-RD+";  
	   10'b0011010101: code = "D12.2-RD-";     10'b0011010101: code = "D12.2-RD+";  
	   10'b1011000101: code = "D13.2-RD-";     10'b1011000101: code = "D13.2-RD+";  
	   10'b0111000101: code = "D14.2-RD-";     10'b0111000101: code = "D14.2-RD+";  
	   10'b0101110101: code = "D15.2-RD-";     10'b1010000101: code = "D15.2-RD+";  
	   10'b0110110101: code = "D16.2-RD-";     10'b1001000101: code = "D16.2-RD+";  
	   10'b1000110101: code = "D17.2-RD-";     10'b1000110101: code = "D17.2-RD+";  
	   10'b0100110101: code = "D18.2-RD-";     10'b0100110101: code = "D18.2-RD+";  
	   10'b1100100101: code = "D19.2-RD-";     10'b1100100101: code = "D19.2-RD+";  
	   10'b0010110101: code = "D20.2-RD-";     10'b0010110101: code = "D20.2-RD+";  
	   10'b1010100101: code = "D21.2-RD-";     10'b1010100101: code = "D21.2-RD+";  
	   10'b0110100101: code = "D22.2-RD-";     10'b0110100101: code = "D22.2-RD+";  
	   10'b1110100101: code = "D23.2-RD-";     10'b0001010101: code = "D23.2-RD+";  
	   10'b1100110101: code = "D24.2-RD-";     10'b0011000101: code = "D24.2-RD+";  
	   10'b1001100101: code = "D25.2-RD-";     10'b1001100101: code = "D25.2-RD+";  
	   10'b0101100101: code = "D26.2-RD-";     10'b0101100101: code = "D26.2-RD+";  
	   10'b1101100101: code = "D27.2-RD-";     10'b0010010101: code = "D27.2-RD+";  
	   10'b0011100101: code = "D28.2-RD-";     10'b0011100101: code = "D28.2-RD+";  
	   10'b1011100101: code = "D29.2-RD-";     10'b0100010101: code = "D29.2-RD+";  
	   10'b0111100101: code = "D30.2-RD-";     10'b1000010101: code = "D30.2-RD+";  
	   10'b1010110101: code = "D31.2-RD-";     10'b0101000101: code = "D31.2-RD+";  
	   10'b1001110011: code = "D0.3-RD-";     10'b0110001100: code = "D0.3-RD+";  
	   10'b0111010011: code = "D1.3-RD-";     10'b1000101100: code = "D1.3-RD+";  
	   10'b1011010011: code = "D2.3-RD-";     10'b0100101100: code = "D2.3-RD+";  
	   10'b1100011100: code = "D3.3-RD-";     10'b1100010011: code = "D3.3-RD+";  
	   10'b1101010011: code = "D4.3-RD-";     10'b0010101100: code = "D4.3-RD+";  
	   10'b1010011100: code = "D5.3-RD-";     10'b1010010011: code = "D5.3-RD+";  
	   10'b0110011100: code = "D6.3-RD-";     10'b0110010011: code = "D6.3-RD+";  
	   10'b1110001100: code = "D7.3-RD-";     10'b0001110011: code = "D7.3-RD+";  
	   10'b1110010011: code = "D8.3-RD-";     10'b0001101100: code = "D8.3-RD+";  
	   10'b1001011100: code = "D9.3-RD-";     10'b1001010011: code = "D9.3-RD+";  
	   10'b0101011100: code = "D10.3-RD-";     10'b0101010011: code = "D10.3-RD+";  
	   10'b1101001100: code = "D11.3-RD-";     10'b1101000011: code = "D11.3-RD+";  
	   10'b0011011100: code = "D12.3-RD-";     10'b0011010011: code = "D12.3-RD+";  
	   10'b1011001100: code = "D13.3-RD-";     10'b1011000011: code = "D13.3-RD+";  
	   10'b0111001100: code = "D14.3-RD-";     10'b0111000011: code = "D14.3-RD+";  
	   10'b0101110011: code = "D15.3-RD-";     10'b1010001100: code = "D15.3-RD+";  
	   10'b0110110011: code = "D16.3-RD-";     10'b1001001100: code = "D16.3-RD+";  
	   10'b1000111100: code = "D17.3-RD-";     10'b1000110011: code = "D17.3-RD+";  
	   10'b0100111100: code = "D18.3-RD-";     10'b0100110011: code = "D18.3-RD+";  
	   10'b1100101100: code = "D19.3-RD-";     10'b1100100011: code = "D19.3-RD+";  
	   10'b0010111100: code = "D20.3-RD-";     10'b0010110011: code = "D20.3-RD+";  
	   10'b1010101100: code = "D21.3-RD-";     10'b1010100011: code = "D21.3-RD+";  
	   10'b0110101100: code = "D22.3-RD-";     10'b0110100011: code = "D22.3-RD+";  
	   10'b1110100011: code = "D23.3-RD-";     10'b0001011100: code = "D23.3-RD+";  
	   10'b1100110011: code = "D24.3-RD-";     10'b0011001100: code = "D24.3-RD+";                              
	   10'b1001101100: code = "D25.3-RD-";     10'b1001100011: code = "D25.3-RD+";  
	   10'b0101101100: code = "D26.3-RD-";     10'b0101100011: code = "D26.3-RD+";  
	   10'b1101100011: code = "D27.3-RD-";     10'b0010011100: code = "D27.3-RD+";  
	   10'b0011101100: code = "D28.3-RD-";     10'b0011100011: code = "D28.3-RD+";  
	   10'b1011100011: code = "D29.3-RD-";     10'b0100011100: code = "D29.3-RD+";  
	   10'b0111100011: code = "D30.3-RD-";     10'b1000011100: code = "D30.3-RD+";  
	   10'b1010110011: code = "D31.3-RD-";     10'b0101001100: code = "D31.3-RD+";  
	   10'b1001110010: code = "D0.4-RD-";     10'b0110001101: code = "D0.4-RD+";  
	   10'b0111010010: code = "D1.4-RD-";     10'b1000101101: code = "D1.4-RD+";  
	   10'b1011010010: code = "D2.4-RD-";     10'b0100101101: code = "D2.4-RD+";  
	   10'b1100011101: code = "D3.4-RD-";     10'b1100010010: code = "D3.4-RD+";  
	   10'b1101010010: code = "D4.4-RD-";     10'b0010101101: code = "D4.4-RD+";  
	   10'b1010011101: code = "D5.4-RD-";     10'b1010010010: code = "D5.4-RD+";  
	   10'b0110011101: code = "D6.4-RD-";     10'b0110010010: code = "D6.4-RD+";  
	   10'b1110001101: code = "D7.4-RD-";     10'b0001110010: code = "D7.4-RD+";  
	   10'b1110010010: code = "D8.4-RD-";     10'b0001101101: code = "D8.4-RD+";  
	   10'b1001011101: code = "D9.4-RD-";     10'b1001010010: code = "D9.4-RD+";  
	   10'b0101011101: code = "D10.4-RD-";     10'b0101010010: code = "D10.4-RD+";  
	   10'b1101001101: code = "D11.4-RD-";     10'b1101000010: code = "D11.4-RD+";  
	   10'b0011011101: code = "D12.4-RD-";     10'b0011010010: code = "D12.4-RD+";  
	   10'b1011001101: code = "D13.4-RD-";     10'b1011000010: code = "D13.4-RD+";  
	   10'b0111001101: code = "D14.4-RD-";     10'b0111000010: code = "D14.4-RD+";  
	   10'b0101110010: code = "D15.4-RD-";     10'b1010001101: code = "D15.4-RD+";  
	   10'b0110110010: code = "D16.4-RD-";     10'b1001001101: code = "D16.4-RD+";  
	   10'b1000111101: code = "D17.4-RD-";     10'b1000110010: code = "D17.4-RD+";  
	   10'b0100111101: code = "D18.4-RD-";     10'b0100110010: code = "D18.4-RD+";  
	   10'b1100101101: code = "D19.4-RD-";     10'b1100100010: code = "D19.4-RD+";  
	   10'b0010111101: code = "D20.4-RD-";     10'b0010110010: code = "D20.4-RD+";  
	   10'b1010101101: code = "D21.4-RD-";     10'b1010100010: code = "D21.4-RD+";  
	   10'b0110101101: code = "D22.4-RD-";     10'b0110100010: code = "D22.4-RD+";  
	   10'b1110100010: code = "D23.4-RD-";     10'b0001011101: code = "D23.4-RD+";  
	   10'b1100110010: code = "D24.4-RD-";     10'b0011001101: code = "D24.4-RD+";  
	   10'b1001101101: code = "D25.4-RD-";     10'b1001100010: code = "D25.4-RD+";  
	   10'b0101101101: code = "D26.4-RD-";     10'b0101100010: code = "D26.4-RD+";  
	   10'b1101100010: code = "D27.4-RD-";     10'b0010011101: code = "D27.4-RD+";  
	   10'b0011101101: code = "D28.4-RD-";     10'b0011100010: code = "D28.4-RD+";  
	   10'b1011100010: code = "D29.4-RD-";     10'b0100011101: code = "D29.4-RD+";  
	   10'b0111100010: code = "D30.4-RD-";     10'b1000011101: code = "D30.4-RD+";  
	   10'b1010110010: code = "D31.4-RD-";     10'b0101001101: code = "D31.4-RD+";  
	   10'b1001111010: code = "D0.5-RD-";     10'b0110001010: code = "D0.5-RD+";  
	   10'b0111011010: code = "D1.5-RD-";     10'b1000101010: code = "D1.5-RD+";  
	   10'b1011011010: code = "D2.5-RD-";     10'b0100101010: code = "D2.5-RD+";  
	   10'b1100011010: code = "D3.5-RD-";     10'b1100011010: code = "D3.5-RD+";  
	   10'b1101011010: code = "D4.5-RD-";     10'b0010101010: code = "D4.5-RD+";  
	   10'b1010011010: code = "D5.5-RD-";     10'b1010011010: code = "D5.5-RD+";  
	   10'b0110011010: code = "D6.5-RD-";     10'b0110011010: code = "D6.5-RD+";  
	   10'b1110001010: code = "D7.5-RD-";     10'b0001111010: code = "D7.5-RD+";  
	   10'b1110011010: code = "D8.5-RD-";     10'b0001101010: code = "D8.5-RD+";  
	   10'b1001011010: code = "D9.5-RD-";     10'b1001011010: code = "D9.5-RD+";  
	   10'b0101011010: code = "D10.5-RD-";     10'b0101011010: code = "D10.5-RD+";  
	   10'b1101001010: code = "D11.5-RD-";     10'b1101001010: code = "D11.5-RD+";  
	   10'b0011011010: code = "D12.5-RD-";     10'b0011011010: code = "D12.5-RD+";  
	   10'b1011001010: code = "D13.5-RD-";     10'b1011001010: code = "D13.5-RD+";  
	   10'b0111001010: code = "D14.5-RD-";     10'b0111001010: code = "D14.5-RD+";  
	   10'b0101111010: code = "D15.5-RD-";     10'b1010001010: code = "D15.5-RD+";  
	   10'b0110111010: code = "D16.5-RD-";     10'b1001001010: code = "D16.5-RD+";  
	   10'b1000111010: code = "D17.5-RD-";     10'b1000111010: code = "D17.5-RD+";  
	   10'b0100111010: code = "D18.5-RD-";     10'b0100111010: code = "D18.5-RD+";  
	   10'b1100101010: code = "D19.5-RD-";     10'b1100101010: code = "D19.5-RD+";  
	   10'b0010111010: code = "D20.5-RD-";     10'b0010111010: code = "D20.5-RD+";                              
	   10'b1010101010: code = "D21.5-RD-";     10'b1010101010: code = "D21.5-RD+";  
	   10'b0110101010: code = "D22.5-RD-";     10'b0110101010: code = "D22.5-RD+";  
	   10'b1110101010: code = "D23.5-RD-";     10'b0001011010: code = "D23.5-RD+";  
	   10'b1100111010: code = "D24.5-RD-";     10'b0011001010: code = "D24.5-RD+";  
	   10'b1001101010: code = "D25.5-RD-";     10'b1001101010: code = "D25.5-RD+";  
	   10'b0101101010: code = "D26.5-RD-";     10'b0101101010: code = "D26.5-RD+";  
	   10'b1101101010: code = "D27.5-RD-";     10'b0010011010: code = "D27.5-RD+";  
	   10'b0011101010: code = "D28.5-RD-";     10'b0011101010: code = "D28.5-RD+";  
	   10'b1011101010: code = "D29.5-RD-";     10'b0100011010: code = "D29.5-RD+";  
	   10'b0111101010: code = "D30.5-RD-";     10'b1000011010: code = "D30.5-RD+";  
	   10'b1010111010: code = "D31.5-RD-";     10'b0101001010: code = "D31.5-RD+";  
	   10'b1001110110: code = "D0.6-RD-";     10'b0110000110: code = "D0.6-RD+";  
	   10'b0111010110: code = "D1.6-RD-";     10'b1000100110: code = "D1.6-RD+";  
	   10'b1011010110: code = "D2.6-RD-";     10'b0100100110: code = "D2.6-RD+";  
	   10'b1100010110: code = "D3.6-RD-";     10'b1100010110: code = "D3.6-RD+";  
	   10'b1101010110: code = "D4.6-RD-";     10'b0010100110: code = "D4.6-RD+";  
	   10'b1010010110: code = "D5.6-RD-";     10'b1010010110: code = "D5.6-RD+";  
	   10'b0110010110: code = "D6.6-RD-";     10'b0110010110: code = "D6.6-RD+";  
	   10'b1110000110: code = "D7.6-RD-";     10'b0001110110: code = "D7.6-RD+";  
	   10'b1110010110: code = "D8.6-RD-";     10'b0001100110: code = "D8.6-RD+";  
	   10'b1001010110: code = "D9.6-RD-";     10'b1001010110: code = "D9.6-RD+";  
	   10'b0101010110: code = "D10.6-RD-";     10'b0101010110: code = "D10.6-RD+";  
	   10'b1101000110: code = "D11.6-RD-";     10'b1101000110: code = "D11.6-RD+";  
	   10'b0011010110: code = "D12.6-RD-";     10'b0011010110: code = "D12.6-RD+";  
	   10'b1011000110: code = "D13.6-RD-";     10'b1011000110: code = "D13.6-RD+";  
	   10'b0111000110: code = "D14.6-RD-";     10'b0111000110: code = "D14.6-RD+";  
	   10'b0101110110: code = "D15.6-RD-";     10'b1010000110: code = "D15.6-RD+";  
	   10'b0110110110: code = "D16.6-RD-";     10'b1001000110: code = "D16.6-RD+";  
	   10'b1000110110: code = "D17.6-RD-";     10'b1000110110: code = "D17.6-RD+";  
	   10'b0100110110: code = "D18.6-RD-";     10'b0100110110: code = "D18.6-RD+";  
	   10'b1100100110: code = "D19.6-RD-";     10'b1100100110: code = "D19.6-RD+";  
	   10'b0010110110: code = "D20.6-RD-";     10'b0010110110: code = "D20.6-RD+";  
	   10'b1010100110: code = "D21.6-RD-";     10'b1010100110: code = "D21.6-RD+";  
	   10'b0110100110: code = "D22.6-RD-";     10'b0110100110: code = "D22.6-RD+";  
	   10'b1110100110: code = "D23.6-RD-";     10'b0001010110: code = "D23.6-RD+";  
	   10'b1100110110: code = "D24.6-RD-";     10'b0011000110: code = "D24.6-RD+";  
	   10'b1001100110: code = "D25.6-RD-";     10'b1001100110: code = "D25.6-RD+";  
	   10'b0101100110: code = "D26.6-RD-";     10'b0101100110: code = "D26.6-RD+";  
	   10'b1101100110: code = "D27.6-RD-";     10'b0010010110: code = "D27.6-RD+";  
	   10'b0011100110: code = "D28.6-RD-";     10'b0011100110: code = "D28.6-RD+";  
	   10'b1011100110: code = "D29.6-RD-";     10'b0100010110: code = "D29.6-RD+";  
	   10'b0111100110: code = "D30.6-RD-";     10'b1000010110: code = "D30.6-RD+";  
	   10'b1010110110: code = "D31.6-RD-";     10'b0101000110: code = "D31.6-RD+";  
	   10'b1001110001: code = "D0.7-RD-";     10'b0110001110: code = "D0.7-RD+";  
	   10'b0111010001: code = "D1.7-RD-";     10'b1000101110: code = "D1.7-RD+";  
	   10'b1011010001: code = "D2.7-RD-";     10'b0100101110: code = "D2.7-RD+";  
	   10'b1100011110: code = "D3.7-RD-";     10'b1100010001: code = "D3.7-RD+";  
	   10'b1101010001: code = "D4.7-RD-";     10'b0010101110: code = "D4.7-RD+";  
	   10'b1010011110: code = "D5.7-RD-";     10'b1010010001: code = "D5.7-RD+";  
	   10'b0110011110: code = "D6.7-RD-";     10'b0110010001: code = "D6.7-RD+";  
	   10'b1110001110: code = "D7.7-RD-";     10'b0001110001: code = "D7.7-RD+";  
	   10'b1110010001: code = "D8.7-RD-";     10'b0001101110: code = "D8.7-RD+";  
	   10'b1001011110: code = "D9.7-RD-";     10'b1001010001: code = "D9.7-RD+";  
	   10'b0101011110: code = "D10.7-RD-";     10'b0101010001: code = "D10.7-RD+";  
	   10'b1101001110: code = "D11.7-RD-";     10'b1101001000: code = "D11.7-RD+";  
	   10'b0011011110: code = "D12.7-RD-";     10'b0011010001: code = "D12.7-RD+";  
	   10'b1011001110: code = "D13.7-RD-";     10'b1011001000: code = "D13.7-RD+";  
	   10'b0111001110: code = "D14.7-RD-";     10'b0111001000: code = "D14.7-RD+";  
	   10'b0101110001: code = "D15.7-RD-";     10'b1010001110: code = "D15.7-RD+";  
	   10'b0110110001: code = "D16.7-RD-";     10'b1001001110: code = "D16.7-RD+";                              
	   10'b1000110111: code = "D17.7-RD-";     10'b1000110001: code = "D17.7-RD+";  
	   10'b0100110111: code = "D18.7-RD-";     10'b0100110001: code = "D18.7-RD+";  
	   10'b1100101110: code = "D19.7-RD-";     10'b1100100001: code = "D19.7-RD+";  
	   10'b0010110111: code = "D20.7-RD-";     10'b0010110001: code = "D20.7-RD+";  
	   10'b1010101110: code = "D21.7-RD-";     10'b1010100001: code = "D21.7-RD+";  
	   10'b0110101110: code = "D22.7-RD-";     10'b0110100001: code = "D22.7-RD+";  
	   10'b1110100001: code = "D23.7-RD-";     10'b0001011110: code = "D23.7-RD+";  
	   10'b1100110001: code = "D24.7-RD-";     10'b0011001110: code = "D24.7-RD+";  
	   10'b1001101110: code = "D25.7-RD-";     10'b1001100001: code = "D25.7-RD+";  
	   10'b0101101110: code = "D26.7-RD-";     10'b0101100001: code = "D26.7-RD+";  
	   10'b1101100001: code = "D27.7-RD-";     10'b0010011110: code = "D27.7-RD+";  
	   10'b0011101110: code = "D28.7-RD-";     10'b0011100001: code = "D28.7-RD+";  
	   10'b1011100001: code = "D29.7-RD-";     10'b0100011110: code = "D29.7-RD+";  
	   10'b0111100001: code = "D30.7-RD-";     10'b1000011110: code = "D30.7-RD+";  
	   10'b1010110001: code = "D31.7-RD-";     10'b0101001110: code = "D31.7-RD+";  
	   10'b0011110100: code = "K28.0-RD-";     10'b1100001011: code = "K28.0-RD+";                              
	   10'b0011111001: code = "K28.1-RD-";     10'b1100000110: code = "K28.1-RD+";  
	   10'b0011110101: code = "K28.2-RD-";     10'b1100001010: code = "K28.2-RD+";  
	   10'b0011110011: code = "K28.3-RD-";     10'b1100001100: code = "K28.3-RD+";  
	   10'b0011110010: code = "K28.4-RD-";     10'b1100001101: code = "K28.4-RD+";  
	   10'b0011111010: code = "K28.5-RD-";     10'b1100000101: code = "K28.5-RD+";  
	   10'b0011110110: code = "K28.6-RD-";     10'b1100001001: code = "K28.6-RD+";  
	   10'b0011111000: code = "K28.7-RD-";     10'b1100000111: code = "K28.7-RD+";  
	   10'b1110101000: code = "K23.7-RD-";     10'b0001010111: code = "K23.7-RD+";  
	   10'b1101101000: code = "K27.7-RD-";     10'b0010010111: code = "K27.7-RD+";  
	   10'b1011101000: code = "K29.7-RD-";     10'b0100010111: code = "K29.7-RD+";  
	   10'b0111101000: code = "K30.7-RD-";     10'b1000010111: code = "K30.7-RD+";  
	   default: code = "Invalid";
	 endcase // case(data)
      end
   end
   
   
endmodule // xaui_decode

