// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_rdmc_pri_encode_32.v
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
module niu_rdmc_pri_encode_32 (din,dout);

input [15:0] din;
output[15:0] dout;


wire   [15:0] req_in = din;


wire[15:0]      req_sel = {     
                                req_in[15] & (req_in[14:0] == 15'b0),
                                req_in[14] & (req_in[13:0] == 14'b0),
                                req_in[13] & (req_in[12:0] == 13'b0),
                                req_in[12] & (req_in[11:0] == 12'b0),
                                req_in[11] & (req_in[10:0] == 11'b0),
                                req_in[10] & (req_in[9:0] == 10'b0),
                                req_in[9] & (req_in[8:0] == 9'b0),
                                req_in[8] & (req_in[7:0] == 8'b0),
                                req_in[7] & (req_in[6:0] == 7'b0),
                                req_in[6] & (req_in[5:0] == 6'b0),
                                req_in[5] & (req_in[4:0] == 5'b0),
                                req_in[4] & (req_in[3:0] == 4'b0),
                                req_in[3] & (req_in[2:0] == 3'b0),
                                req_in[2] & (req_in[1:0] == 2'b0),
                                req_in[1] & (req_in[0] == 1'b0),
                                req_in[0]};

wire   [15:0] dout   = req_sel;

endmodule
