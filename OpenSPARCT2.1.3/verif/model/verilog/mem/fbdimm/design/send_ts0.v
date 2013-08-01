// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: send_ts0.v
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
module send_ts0(start,data,input_bit,serial_bit,link_clk);


input start;
input [143:0] data;
input link_clk;
output serial_bit;
input input_bit;

reg bit_reg;
reg enable_serial_bit;
reg [143:0] data_reg;

assign serial_bit= start ? input_bit : 1'b0;

/*
initial begin
enable_serial_bit=0;
end


always@(posedge link_clk) 
begin
 if ( start ) begin
   enable_serial_bit=1;
   data_reg = data;
 end

 if ( (start || enable_serial_bit) && ( data[143:0] !== 144'h0) ) 
 begin
   bit_reg=data_reg[143];
   data_reg[143:0]={data_reg[142:0],1'b0};
 end

  if ( data[143:0] == 144'h0)
   enable_serial_bit=0;

end
*/

endmodule
