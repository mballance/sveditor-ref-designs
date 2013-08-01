// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fc_modes_tasks.v
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
reg [2:0] force_ncu_sck_cntr_value;

//set intial values for all regs
initial begin
force_ncu_sck_cntr_value = 3'bzzz;
end

initial
  begin
    if ($test$plusargs("SSI_CLK_4")) begin
`ifdef NCU_GATE

`ifdef SLAM_VECTORS
    #10;
    @(negedge `NCU.rst_wmr_protect);
    force {`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_cntr_2_, `NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_cntr_1_, `NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_cntr_0_} = 3'b111;
    force `NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_ctu_jbi_ssiclk_ff = 1'b1;
    @(posedge `NCU.ca1_l1clkhdr__iol2clk__col_3__vdd__tcu_scan_en__vss__grp_1_30__l1clk);
    release {`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_cntr_2_, `NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_cntr_1_, `NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_cntr_0_};
    release `NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_ctu_jbi_ssiclk_ff;
    @(posedge `NCU.ca1_l1clkhdr__iol2clk__col_3__vdd__tcu_scan_en__vss__grp_1_30__l1clk);
`endif // SLAM_VECTORS
    force   `TOP.cpu.ncu.ncu_scksel = 2'b01;

`else // NCU_GATE

`ifdef SLAM_VECTORS
    #10;
    @(negedge `NCU.rst_wmr_protect);
    if($test$plusargs("OLD_BRUTE_FORCE")) begin
       force `NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.cntr   = 3'b111;
       force `NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.ctu_jbi_ssiclk_ff     = 1'b1;
    end
    if($value$plusargs("FORCE_NCU_SCK_CNTR=%d", force_ncu_sck_cntr_value)) begin
       force `NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.cntr   = force_ncu_sck_cntr_value;
       force `NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.ctu_jbi_ssiclk_ff     = 1'b1;
    end
    else begin
       force `NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.cntr   =  3'b110;
       force `NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.ctu_jbi_ssiclk_ff     = 1'b1;
    end
    @(posedge `NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.l1clk);
       release `NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.cntr;
       release `NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.ctu_jbi_ssiclk_ff;
    @(posedge `NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.l1clk);
`endif // SLAM_VECTORS
    force   `NCU.ncu_ssitop_ctl.ncu_scksel = 2'b01;

`endif // NCU_GATE

    end // if
end // initial

