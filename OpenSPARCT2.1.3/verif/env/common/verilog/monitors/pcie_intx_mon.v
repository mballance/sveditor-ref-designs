// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcie_intx_mon.v
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
module pcie_intx_mon() ;

reg pcie_intx_mon_on;

wire int_a_status;
wire int_b_status;
wire int_c_status;
wire int_d_status;

assign int_a_status = tb_top.cpu.dmu.dmc.imu.iss.rds2iss_intx_int_l[0];
assign int_b_status = tb_top.cpu.dmu.dmc.imu.iss.rds2iss_intx_int_l[1];
assign int_c_status = tb_top.cpu.dmu.dmc.imu.iss.rds2iss_intx_int_l[2];
assign int_d_status = tb_top.cpu.dmu.dmc.imu.iss.rds2iss_intx_int_l[3];

initial
begin
  pcie_intx_mon_on = 1'b1;   // Monitor enabled by default
  if($test$plusargs("pcie_intx_mon_off"))
    pcie_intx_mon_on = 1'b0;
end

//--------------------------------------------------------------------
// Int A Assetion/De-assertion
//--------------------------------------------------------------------
always @(int_a_status)
begin
  if(pcie_intx_mon_on == 1'b1)
  begin
     if (int_a_status == 1'b1)
     begin
        `PR_NORMAL("pcie_intx_mon_on",`NORMAL,"PCIE int A deasserted");
     end
     else if (int_a_status == 1'b0)
     begin
        `PR_NORMAL("pcie_intx_mon_on",`NORMAL,"PCIE int A asserted");
     end
  end
end

//--------------------------------------------------------------------
// Int B Assetion/De-assertion
//--------------------------------------------------------------------
always @(int_b_status)
begin
  if(pcie_intx_mon_on == 1'b1)
  begin
     if (int_b_status == 1'b1)
     begin
        `PR_NORMAL("pcie_intx_mon_on",`NORMAL,"PCIE int B deasserted");
     end
     else if (int_b_status == 1'b0)
     begin
        `PR_NORMAL("pcie_intx_mon_on",`NORMAL,"PCIE int B asserted");
     end
  end
end


//--------------------------------------------------------------------
// Int C Assetion/De-assertion
//--------------------------------------------------------------------
always @(int_c_status)
begin
  if(pcie_intx_mon_on == 1'b1)
  begin
     if (int_c_status == 1'b1)
     begin
        `PR_NORMAL("pcie_intx_mon_on",`NORMAL,"PCIE int C deasserted");
     end
     else if (int_c_status == 1'b0)
     begin
        `PR_NORMAL("pcie_intx_mon_on",`NORMAL,"PCIE int C asserted");
     end
  end
end


//--------------------------------------------------------------------
// Int D Assetion/De-assertion
//--------------------------------------------------------------------
always @(int_d_status)
begin
  if(pcie_intx_mon_on == 1'b1)
  begin
     if (int_d_status == 1'b1)
     begin
        `PR_NORMAL("pcie_intx_mon_on",`NORMAL,"PCIE int D deasserted");
     end
     else if (int_d_status == 1'b0)
     begin
        `PR_NORMAL("pcie_intx_mon_on",`NORMAL,"PCIE int D asserted");
     end
  end
end

endmodule
