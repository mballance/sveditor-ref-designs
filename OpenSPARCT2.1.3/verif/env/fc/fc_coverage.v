// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fc_coverage.v
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
reg  ncu_pcx_stall_pq;
reg  ncu_pcx_stall_pq1;
reg  mcu0_ncu_stall_in;
reg  mcu1_ncu_stall_in;
reg  mcu2_ncu_stall_in;
reg  mcu3_ncu_stall_in;
reg  dmu_ncu_stall_in;
reg  ccu_ncu_stall_in;
reg  niu_ncu_stall_in;
reg  tcu_ncu_stall_in;
reg  dbg1_ncu_stall_in;
reg  rst_ncu_stall_in;
reg  ssi_ncu_stall_in;
reg  [129:0] pcx_ncu_data_px2;
reg  [7:0]   ncu_cpx_req_cq;
reg  pcx_ncu_data_rdy_px1;

always @(posedge `NCU.iol2clk)
     begin
        mcu0_ncu_stall_in       <= `NCU.mcu0_ncu_stall;
        mcu1_ncu_stall_in       <= `NCU.mcu1_ncu_stall;
        mcu2_ncu_stall_in       <= `NCU.mcu2_ncu_stall;
        mcu3_ncu_stall_in       <= `NCU.mcu3_ncu_stall;
        dmu_ncu_stall_in        <= `NCU.dmu_ncu_stall;
        ccu_ncu_stall_in        <= `NCU.ccu_ncu_stall;
        niu_ncu_stall_in        <= `NCU.niu_ncu_stall;
        tcu_ncu_stall_in        <= `NCU.tcu_ncu_stall;
        dbg1_ncu_stall_in       <= `NCU.dbg1_ncu_stall;
        rst_ncu_stall_in        <= `NCU.rst_ncu_stall;
        ssi_ncu_stall_in        <= `NCU.ssi_ncu_stall;
     end
always @(posedge core_clk)
     begin
        ncu_pcx_stall_pq        <= `NCU.ncu_pcx_stall_pq;
        ncu_pcx_stall_pq1       <= `NCU.ncu_pcx_stall_pq;
        pcx_ncu_data_px2        <= `NCU.pcx_ncu_data_px2;
        ncu_cpx_req_cq          <= `NCU.ncu_cpx_req_cq;
	pcx_ncu_data_rdy_px1	<= `NCU.pcx_ncu_data_rdy_px1;
     end


