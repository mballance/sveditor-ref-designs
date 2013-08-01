// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_ecc16_genpar.v
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


	// implemented per N2 ras
	// 16b data, 6b checkbits
	// cor_parity_5 use in correction logic;
	// special bit5 generation in correction mode 
module niu_smx_ecc16_genpar (data, chkbit, parity, cor_parity_5);

input  [15:0] data;
input [4:0] chkbit; // use for correct logic; bit5 is different
output [5:0] parity;
output cor_parity_5;

assign parity[0] = data[0] ^ data[1] ^ data[3] ^ data[4] ^ data[6] ^ 
		   data[8] ^ data[10] ^ data[11] ^ data[13] ^ data[15];

assign parity[1] = data[0] ^ data[2] ^ data[3] ^ data[5] ^ data[6] ^ 
		   data[9] ^ data[10] ^ data[12] ^ data[13];

assign parity[2] = data[1] ^ data[2] ^ data[3] ^ data[7] ^ data[8] ^ 
		   data[9] ^ data[10] ^ data[14] ^ data[15];

assign parity[3] = data[4] ^ data[5] ^ data[6] ^ data[7] ^ data[8] ^ 
	           data[9] ^ data[10];

assign parity[4] = data[11] ^ data[12] ^ data[13] ^ data[14] ^ data[15];

assign parity[5]=  data[0] ^ data[1] ^ data[2] ^ data[3] ^ 
		   parity[0] ^ parity[1] ^ parity[2];

assign cor_parity_5 = data[15] ^ data[14] ^ data[13] ^ data[12] ^ 
		      data[11] ^ data[10] ^ data[9] ^ data[8] ^ 
		      data[7] ^ data[6] ^ data[5] ^ data[4] ^ 
		      data[3] ^ data[2] ^ data[1] ^ data[0] ^
		      chkbit[4] ^ chkbit[3] ^ chkbit[2] ^ chkbit[1] ^ chkbit[0];

endmodule
