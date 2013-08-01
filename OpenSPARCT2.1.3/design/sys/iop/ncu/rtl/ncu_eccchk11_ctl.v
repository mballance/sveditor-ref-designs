// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_eccchk11_ctl.v
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
module ncu_eccchk11_ctl (
  din, 
  ci, 
  ue, 
  ce, 
  dout, 
  co) ;
wire [4:0] e;


input  [10:0]	din;
input  [4:0]	ci;

output		ue;
output		ce;

output [10:0]	dout;
output [4:0]	co;


reg		ue;
reg		ce;
reg [10:0]	dout;
reg [4:0]	co;


assign	e[4] = ^{din[10:0],ci[4:0]} ;
assign	e[3] = ^{din[10:4],ci[3]} ;
assign	e[2] = ^{din[10:7],din[3:1],ci[2]} ;
assign	e[1] = ^{din[10:9],din[6:5],din[3:2],din[0],ci[1]} ;
assign	e[0] = ^{din[10],din[8],din[6],din[4:3],din[1:0],ci[0]} ;

always@(e or din or ci) begin
    dout[10:0]=din[10:0];
    co[4:0]=ci[4:0];
    ue=1'b0;
    ce=1'b1;
    case(e[4:0])
    {1'b0,4'd0} : begin
	          ue=1'b0;
	          ce=1'b0;
	          dout[10:0]=din[10:0];
	          co[4:0]=ci[4:0];
	          end
    {1'b1,4'd0} : co[4]    = ~ci[4];
    {1'b1,4'd1} : co[0]    = ~ci[0];
    {1'b1,4'd2} : co[1]    = ~ci[1];
    {1'b1,4'd3} : dout[0]  = ~din[0];
    {1'b1,4'd4} : co[2]    = ~ci[2];
    {1'b1,4'd5} : dout[1]  = ~din[1];
    {1'b1,4'd6} : dout[2]  = ~din[2];
    {1'b1,4'd7} : dout[3]  = ~din[3];
    {1'b1,4'd8} : co[3]    = ~ci[3];
    {1'b1,4'd9} : dout[4]  = ~din[4];
    {1'b1,4'd10}: dout[5]  = ~din[5];
    {1'b1,4'd11}: dout[6]  = ~din[6];
    {1'b1,4'd12}: dout[7]  = ~din[7];
    {1'b1,4'd13}: dout[8]  = ~din[8];
    {1'b1,4'd14}: dout[9]  = ~din[9];
    {1'b1,4'd15}: dout[10] = ~din[10];
    default : begin
    	      dout[10:0]=din[10:0];
    	      co[4:0]=ci[4:0];
	      ue=1'b1;
	      ce=1'b0;
	      end
    endcase
end

endmodule






