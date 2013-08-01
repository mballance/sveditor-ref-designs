// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: flush_prop.v
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
`ifndef GATESIM
always @(posedge `CPU.tcu_scan_en) begin
      if ($test$plusargs("FLUSH_X")) begin
          force `CPU.tcu.tcu_soc0_scan_out = 1'bx;
          force `CPU.tcu.tcu_soc1_scan_out = 1'bx;
          force `CPU.tcu.tcu_soc2_scan_out = 1'bx;
          force `CPU.tcu.tcu_soc3_scan_out = 1'bx;
          force `CPU.tcu.tcu_soc4_scan_out = 1'bx;
          force `CPU.tcu.tcu_soc5_scan_out = 1'bx;
          force `CPU.tcu.tcu_soc6_scan_out = 1'bx;
          force `CPU.tcu.tcu_soca_scan_out = 1'bx;
          force `CPU.tcu.tcu_socb_scan_out = 1'bx;
          force `CPU.tcu.tcu_socc_scan_out = 1'bx;
          force `CPU.tcu.tcu_socd_scan_out = 1'bx;
          force `CPU.tcu.tcu_soce_scan_out = 1'bx;
          force `CPU.tcu.tcu_socf_scan_out = 1'bx;
          force `CPU.tcu.tcu_socg_scan_out = 1'bx;
          force `CPU.tcu.tcu_soch_scan_out = 1'bx;
          force `CPU.tcu.tcu_spc0_scan_out[0] = 1'bx;
          force `CPU.tcu.tcu_spc0_scan_out[1] = 1'bx;
          force `CPU.tcu.tcu_spc1_scan_out[0] = 1'bx;
          force `CPU.tcu.tcu_spc1_scan_out[1] = 1'bx;
          force `CPU.tcu.tcu_spc2_scan_out[0] = 1'bx;
          force `CPU.tcu.tcu_spc2_scan_out[1] = 1'bx;
          force `CPU.tcu.tcu_spc3_scan_out[0] = 1'bx;
          force `CPU.tcu.tcu_spc3_scan_out[1] = 1'bx;
          force `CPU.tcu.tcu_spc4_scan_out[0] = 1'bx;
          force `CPU.tcu.tcu_spc4_scan_out[1] = 1'bx;
          force `CPU.tcu.tcu_spc5_scan_out[0] = 1'bx;
          force `CPU.tcu.tcu_spc5_scan_out[1] = 1'bx;
          force `CPU.tcu.tcu_spc6_scan_out[0] = 1'bx;
          force `CPU.tcu.tcu_spc6_scan_out[1] = 1'bx;
          force `CPU.tcu.tcu_spc7_scan_out[0] = 1'bx;
          force `CPU.tcu.tcu_spc7_scan_out[1] = 1'bx;
          repeat (10) @(posedge `CPU.ccu_rst_sys_clk);
          release `CPU.tcu.tcu_soc0_scan_out ;
          release `CPU.tcu.tcu_soc1_scan_out ;
          release `CPU.tcu.tcu_soc2_scan_out ;
          release `CPU.tcu.tcu_soc3_scan_out ;
          release `CPU.tcu.tcu_soc4_scan_out ;
          release `CPU.tcu.tcu_soc5_scan_out ;
          release `CPU.tcu.tcu_soc6_scan_out ;
          release `CPU.tcu.tcu_soca_scan_out ;
          release `CPU.tcu.tcu_socb_scan_out ;
          release `CPU.tcu.tcu_socc_scan_out ;
          release `CPU.tcu.tcu_socd_scan_out ;
          release `CPU.tcu.tcu_soce_scan_out ;
          release `CPU.tcu.tcu_socf_scan_out ;
          release `CPU.tcu.tcu_socg_scan_out ;
          release `CPU.tcu.tcu_soch_scan_out ;
          release `CPU.tcu.tcu_spc0_scan_out[0] ;
          release `CPU.tcu.tcu_spc0_scan_out[1] ;
          release `CPU.tcu.tcu_spc1_scan_out[0] ;
          release `CPU.tcu.tcu_spc1_scan_out[1] ;
          release `CPU.tcu.tcu_spc2_scan_out[0] ;
          release `CPU.tcu.tcu_spc2_scan_out[1] ;
          release `CPU.tcu.tcu_spc3_scan_out[0] ;
          release `CPU.tcu.tcu_spc3_scan_out[1] ;
          release `CPU.tcu.tcu_spc4_scan_out[0] ;
          release `CPU.tcu.tcu_spc4_scan_out[1] ;
          release `CPU.tcu.tcu_spc5_scan_out[0] ;
          release `CPU.tcu.tcu_spc5_scan_out[1] ;
          release `CPU.tcu.tcu_spc6_scan_out[0] ;
          release `CPU.tcu.tcu_spc6_scan_out[1] ;
          release `CPU.tcu.tcu_spc7_scan_out[0] ;
          release `CPU.tcu.tcu_spc7_scan_out[1] ;
        end
end
`endif // GATESIM

