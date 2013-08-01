// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_chkr_inst.v
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
module ncu_chkr_inst ;


ncu_niu_chkr niu_chkr (
    .iol2clk(`NCU.iol2clk),
    .ncu_niu_vld(`NCU.ncu_niu_vld),
    .ncu_niu_data(`NCU.ncu_niu_data),
    .niu_ncu_stall(`NCU.niu_ncu_stall),
    .niu_ncu_vld(`NCU.niu_ncu_vld),
    .niu_ncu_data(`NCU.niu_ncu_data),
    .ncu_niu_stall(`NCU.ncu_niu_stall)
);

ncu_io_chkr ccu_chkr (
    .iol2clk(`NCU.iol2clk),
    .ncu_io_vld(`NCU.ncu_ccu_vld),
    .ncu_io_data(`NCU.ncu_ccu_data),
    .io_ncu_stall(`NCU.ccu_ncu_stall),
    .io_ncu_vld(`NCU.ccu_ncu_vld),
    .io_ncu_data(`NCU.ccu_ncu_data),
    .ncu_io_stall(`NCU.ncu_ccu_stall)
);
ncu_io_chkr mcu0_chkr (
    .iol2clk(`NCU.iol2clk),
    .ncu_io_vld(`NCU.ncu_mcu0_vld),
    .ncu_io_data(`NCU.ncu_mcu0_data),
    .io_ncu_stall(`NCU.mcu0_ncu_stall),
    .io_ncu_vld(`NCU.mcu0_ncu_vld),
    .io_ncu_data(`NCU.mcu0_ncu_data),
    .ncu_io_stall(`NCU.ncu_mcu0_stall)
);
ncu_io_chkr mcu1_chkr (
    .iol2clk(`NCU.iol2clk),
    .ncu_io_vld(`NCU.ncu_mcu1_vld),
    .ncu_io_data(`NCU.ncu_mcu1_data),
    .io_ncu_stall(`NCU.mcu1_ncu_stall),
    .io_ncu_vld(`NCU.mcu1_ncu_vld),
    .io_ncu_data(`NCU.mcu1_ncu_data),
    .ncu_io_stall(`NCU.ncu_mcu1_stall)
);
ncu_io_chkr mcu2_chkr (
    .iol2clk(`NCU.iol2clk),
    .ncu_io_vld(`NCU.ncu_mcu2_vld),
    .ncu_io_data(`NCU.ncu_mcu2_data),
    .io_ncu_stall(`NCU.mcu2_ncu_stall),
    .io_ncu_vld(`NCU.mcu2_ncu_vld),
    .io_ncu_data(`NCU.mcu2_ncu_data),
    .ncu_io_stall(`NCU.ncu_mcu2_stall)
);
ncu_io_chkr mcu3_chkr (
    .iol2clk(`NCU.iol2clk),
    .ncu_io_vld(`NCU.ncu_mcu3_vld),
    .ncu_io_data(`NCU.ncu_mcu3_data),
    .io_ncu_stall(`NCU.mcu3_ncu_stall),
    .io_ncu_vld(`NCU.mcu3_ncu_vld),
    .io_ncu_data(`NCU.mcu3_ncu_data),
    .ncu_io_stall(`NCU.ncu_mcu3_stall)
);
ncu_io_chkr rst_chkr (
    .iol2clk(`NCU.iol2clk),
    .ncu_io_vld(`NCU.ncu_rst_vld),
    .ncu_io_data(`NCU.ncu_rst_data),
    .io_ncu_stall(`NCU.rst_ncu_stall),
    .io_ncu_vld(`NCU.rst_ncu_vld),
    .io_ncu_data(`NCU.rst_ncu_data),
    .ncu_io_stall(`NCU.ncu_rst_stall)
);
ncu_niu_chkr dmu_chkr (
    .iol2clk(`NCU.iol2clk),
    .ncu_niu_vld(`NCU.ncu_dmu_vld),
    .ncu_niu_data(`NCU.ncu_dmu_data),
    .niu_ncu_stall(`NCU.dmu_ncu_stall),
    .niu_ncu_vld(`NCU.dmu_ncu_vld),
    .niu_ncu_data(`NCU.dmu_ncu_data),
    .ncu_niu_stall(`NCU.ncu_dmu_stall)
);

ncu_io_chkr dbg1_chkr (
    .iol2clk(`NCU.iol2clk),
    .ncu_io_vld(`NCU.ncu_dbg1_vld),
    .ncu_io_data(`NCU.ncu_dbg1_data),
    .io_ncu_stall(`NCU.dbg1_ncu_stall),
    .io_ncu_vld(`NCU.dbg1_ncu_vld),
    .io_ncu_data(`NCU.dbg1_ncu_data),
    .ncu_io_stall(`NCU.ncu_dbg1_stall)
);


endmodule
