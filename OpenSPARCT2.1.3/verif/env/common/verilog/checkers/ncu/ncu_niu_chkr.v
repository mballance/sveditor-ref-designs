// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_niu_chkr.v
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
module ncu_niu_chkr(
			iol2clk,
                        ncu_niu_vld,            // From c2i of c2i.v
                        ncu_niu_data,           // From c2i of c2i.v
                        niu_ncu_data,           // To i2c of i2c.v
                        niu_ncu_vld,            // To i2c of i2c.v
                        niu_ncu_stall,          // To c2i of c2i.v
                        ncu_niu_stall           // From i2c of i2c.v
);

input                   iol2clk;

input                   ncu_niu_vld;            // From c2i of c2i.v
input [31:0]            ncu_niu_data;           // From c2i of c2i.v
input                   niu_ncu_stall;          // To c2i of c2i.v

input [31:0]            niu_ncu_data;           // To i2c of i2c.v
input                   niu_ncu_vld;            // To i2c of i2c.v
input                   ncu_niu_stall;          // From i2c of i2c.v

wire por_reset_l = !`NCU.tcu_aclk;

// 0in set_clock  -default   iol2clk  -module ncu_niu_chkr
// 0in default_reset `NCU.tcu_aclk -module ncu_niu_chkr 
`ifdef X_GUARD
// 0in known_driven -var ncu_niu_stall   -name ncu_niu_stall_x_guard -active por_reset_l  
// 0in known_driven -var niu_ncu_vld     -name niu_ncu_vld_x_guard   -active por_reset_l 
// 0in known_driven -var niu_ncu_stall   -name niu_ncu_stall_x_guard -active por_reset_l 
// 0in known_driven -var ncu_niu_vld     -name ncu_niu_vld_x_guard   -active por_reset_l 
`endif


//*********************************
// make sure vald and stall do not active to long
//*********************************

reg [9:0] niu_ncu_vld_cnt;
reg [9:0] niu_ncu_stall_cnt;
reg [9:0] ncu_niu_vld_cnt;
reg [9:0] ncu_niu_stall_cnt;

/* 0in range
        -var niu_ncu_vld_cnt
        -min 0
        -max 4
*/

/* 0in range
        -var niu_ncu_stall_cnt
        -min 0
        -max 1000
*/

/* 0in range
        -var ncu_niu_vld_cnt
        -min 0
        -max 4
*/

/* 0in range
        -var ncu_niu_stall_cnt
        -min 0
        -max 1000

*/

reg ncu_niu_stall_del;
reg niu_ncu_stall_del;

always @(posedge iol2clk) begin
  if (niu_ncu_vld && !ncu_niu_stall_del) begin
	niu_ncu_vld_cnt = niu_ncu_vld_cnt + 1;
  end
  else if (!niu_ncu_vld) begin
	niu_ncu_vld_cnt = 0;
  end

  if (niu_ncu_stall_del) begin 
	niu_ncu_stall_cnt = niu_ncu_stall_cnt + 1;
  end else begin
	niu_ncu_stall_cnt = 0;
  end
  

  if (ncu_niu_vld && !niu_ncu_stall_del) begin
	ncu_niu_vld_cnt = ncu_niu_vld_cnt + 1;
  end
  else if (!ncu_niu_vld) begin
	ncu_niu_vld_cnt = 0;
  end

  if (ncu_niu_stall_del) begin
    ncu_niu_stall_cnt = ncu_niu_stall_cnt + 1;
  end
  else begin
	ncu_niu_stall_cnt = 0;
  end 

  ncu_niu_stall_del = ncu_niu_stall;
  niu_ncu_stall_del = niu_ncu_stall;
end



endmodule
