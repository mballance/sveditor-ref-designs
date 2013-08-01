// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_ecc16_corr.v
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
module niu_smx_ecc16_corr (
		enable,
		data, 
		syn,
		corr_data,
		good, 
		corr_error, 
		uncorr_error);

input  enable; 	
input  [15:0] data;
input  [5:0] syn;
output [15:0] corr_data;
output good;
output corr_error;
output uncorr_error;

wire [15:0] ecc_corr_data;

assign ecc_corr_data[0] = data[0] ^ (syn[4:0] == 5'd3);
assign ecc_corr_data[1] = data[1] ^ (syn[4:0] == 5'd5);
assign ecc_corr_data[2] = data[2] ^ (syn[4:0] == 5'd6);
assign ecc_corr_data[3] = data[3] ^ (syn[4:0] == 5'd7);
assign ecc_corr_data[4] = data[4] ^ (syn[4:0] == 5'd9);
assign ecc_corr_data[5] = data[5] ^ (syn[4:0] == 5'd10);
assign ecc_corr_data[6] = data[6] ^ (syn[4:0] == 5'd11);
assign ecc_corr_data[7] = data[7] ^ (syn[4:0] == 5'd12);
assign ecc_corr_data[8] = data[8] ^ (syn[4:0] == 5'd13);
assign ecc_corr_data[9] = data[9] ^ (syn[4:0] == 5'd14);
assign ecc_corr_data[10] = data[10] ^ (syn[4:0] == 5'd15);
assign ecc_corr_data[11] = data[11] ^ (syn[4:0] == 5'd17);
assign ecc_corr_data[12] = data[12] ^ (syn[4:0] == 5'd18);
assign ecc_corr_data[13] = data[13] ^ (syn[4:0] == 5'd19);
assign ecc_corr_data[14] = data[14] ^ (syn[4:0] == 5'd20);
assign ecc_corr_data[15] = data[15] ^ (syn[4:0] == 5'd21);

assign corr_data=  (enable)?  ecc_corr_data : data;

assign good = (syn == 6'b000000);
assign corr_error = !(syn[4:0]>5'd21) && (syn[5] == 1'b1);
assign uncorr_error = ~corr_error &  ~good;
endmodule
