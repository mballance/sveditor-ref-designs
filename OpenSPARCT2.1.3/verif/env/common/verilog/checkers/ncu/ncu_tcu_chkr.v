// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_tcu_chkr.v
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
module ncu_tcu_chkr();

wire por_reset_l = !`NCU.tcu_aclk;

 // 0in set_clock  -default   iol2clk   -module ncu

 // 0in default_reset `NCU.tcu_aclk -module ncu_tcu_chkr

`ifdef X_GUARD
// 0in known_driven -var ncu_tcu_stall   -name ncu_tcu_stall_x_guard -active por_reset_l -module ncu
// 0in known_driven -var tcu_ncu_vld     -name tcu_ncu_vld_x_guard   -active por_reset_l -module ncu
// 0in known_driven -var tcu_ncu_stall   -name tcu_ncu_stall_x_guard -active por_reset_l -module ncu
// 0in known_driven -var ncu_tcu_vld     -name ncu_tcu_vld_x_guard   -active por_reset_l -module ncu
`endif


//*********************************
// make sure vald and stall do not active to long  
//*********************************

reg [9:0] tcu_ncu_vld_cnt;
reg [9:0] tcu_ncu_stall_cnt;
reg [9:0] ncu_tcu_vld_cnt;
reg [9:0] ncu_tcu_stall_cnt;

/* 0in range
        -var tcu_ncu_vld_cnt
	-min 0 
        -max 16
	-clock `NCU.iol2clk
*/

/* 0in range
        -var tcu_ncu_stall_cnt
	-min 0 
        -max 1000
        -clock `NCU.iol2clk
*/

/* 0in range
        -var ncu_tcu_vld_cnt
	-min 0 
        -max 16
        -clock `NCU.iol2clk
*/

/* 0in range
        -var ncu_tcu_stall_cnt
	-min 0 
        -max 1000
        -clock `NCU.iol2clk

*/


reg tcu_ncu_stall_del ;
reg ncu_tcu_stall_del ;

always @(posedge `NCU.iol2clk) begin
  if (`NCU.tcu_ncu_vld && !ncu_tcu_stall_del) begin
        tcu_ncu_vld_cnt = tcu_ncu_vld_cnt + 1;
  end
  else if (!`NCU.tcu_ncu_vld) begin
        tcu_ncu_vld_cnt = 0;
  end

  if (tcu_ncu_stall_del) begin
        tcu_ncu_stall_cnt = tcu_ncu_stall_cnt + 1;
  end 
  else begin
        tcu_ncu_stall_cnt = 0; 
  end


  if (`NCU.ncu_tcu_vld && !tcu_ncu_stall_del) begin 
	ncu_tcu_vld_cnt = ncu_tcu_vld_cnt + 1;
  end
  else if (!`NCU.ncu_tcu_vld) begin
        ncu_tcu_vld_cnt = 0;
  end

  if (ncu_tcu_stall_del) begin 
	 ncu_tcu_stall_cnt = ncu_tcu_stall_cnt + 1;
  end 
  else begin
        ncu_tcu_stall_cnt = 0;
  end

  tcu_ncu_stall_del = `NCU.tcu_ncu_stall;
  ncu_tcu_stall_del = `NCU.ncu_tcu_stall;

end




endmodule
