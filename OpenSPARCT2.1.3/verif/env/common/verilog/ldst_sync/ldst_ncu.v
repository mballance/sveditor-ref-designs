// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ldst_ncu.v
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
module ldst_ncu ();
`ifndef GATESIM
`ifdef NCURTL

// common defines
`include "defines.vh"
`include "nas.vh"
// PCX/CPX packet defines (see :/verif/env/common/vera/include)
`include "ccx.vri"
`include "cmp.vri"

//---------------------
// Wires

//----------------------------------------------------------
//----------------------------------------------------------
// DUT probes

  wire                     ncu_cpx_valid;
  wire              [39:0] ncu_cpx_pa;
  wire               [2:0] ncu_cpx_cid;
  wire               [2:0] ncu_cpx_tid;
  wire               [4:0] ncu_cpx_typ;
  wire               [7:0] ncu_cpx_bmask;

  // Bench is probing the PCX packet.    
  // But, the signals names are "*cpx*" so they match other signals in ldst_l2.vpal.

  // These signals are probed by ldst_l2.vpal.  Do not change the names.
  assign  ncu_cpx_typ   = `CPU.ncu.ncu_fcd_ctl.ncu_c2ifcd_ctl.ncu_c2ifd_ctl.pcx_ncu_data[`PCX_RQTYP];
  assign  ncu_cpx_pa    = `CPU.ncu.ncu_fcd_ctl.ncu_c2ifcd_ctl.ncu_c2ifd_ctl.pcx_ncu_data[`PCX_ADDR];
  assign  ncu_cpx_cid   = `CPU.ncu.ncu_fcd_ctl.ncu_c2ifcd_ctl.ncu_c2ifd_ctl.pcx_ncu_data[`PCX_CID];
  assign  ncu_cpx_tid   = `CPU.ncu.ncu_fcd_ctl.ncu_c2ifcd_ctl.ncu_c2ifd_ctl.pcx_ncu_data[`PCX_TID];
  assign  ncu_cpx_valid = `CPU.ncu.ncu_fcd_ctl.ncu_c2ifcd_ctl.ncu_c2ifd_ctl.pcx_ncu_vld &&
                          `CPU.ncu.ncu_fcd_ctl.ncu_c2ifcd_ctl.ncu_c2ifc_ctl.pcx_ncu_data_rdy;
  assign  ncu_cpx_bmask = `CPU.ncu.ncu_fcd_ctl.ncu_c2ifcd_ctl.ncu_c2ifd_ctl.pcx_ncu_data[`PCX_SIZE];

//----------------------------------------------------------
`endif
`endif
endmodule

//----------------------------------------------------------
