// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: denali_pcie_device.v
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
`timescale 10fs/10fs

module denali_pcie_device (
    TX,
    TX_,
    RX,
    RX_,
    CLK_TX,
    CLK_RX,
    PERST_
);
   // the DV_ROOT gets replaced by GNUmakefile
  parameter  interface_soma = "$DV_ROOT/verif/env/fnx/vlib/FNXPCIEXactor/sim/soma_default.spc";
  parameter  init_file      = "";
  
  output [7:0] TX;
  reg    [7:0] den_TX;
  assign TX = den_TX;
  
  output [7:0] TX_;
  reg  [7:0] den_TX_;
  assign TX_ = den_TX_;
  
  input [7:0] RX;
  input [7:0] RX_;
  
  inout CLK_TX;
  inout CLK_RX;

  reg den_CLK_TX;
  reg den_CLK_RX;
  
  assign CLK_TX = den_CLK_TX;
  assign CLK_RX = den_CLK_RX;

  input PERST_;

initial begin
   $pcie_access();
end
   
endmodule

`timescale 1ps/1ps

