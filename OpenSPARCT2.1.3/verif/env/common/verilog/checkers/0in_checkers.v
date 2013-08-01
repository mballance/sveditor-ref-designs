// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: 0in_checkers.v
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
`ifdef ZIN_CORE_SUBSET
    // 0in exclude_checker -module spc
    // 0in include_checker -group zin_core_subset
`ifdef SPCINF_COVERAGE
    // 0in include_checker -name *cov_spcinf*
`endif
`endif


`ifdef ZIN_CORE_LBIST
    // 0in exclude_checker -name *
    // 0in exclude_checker -type *

    // 0in include_checker -group zin_core_lbist
`ifdef SPCINF_COVERAGE
    // 0in include_checker -name *cov_spcinf*
`endif
`endif

`ifdef ZIN_CORE_MBIST
    // 0in disable_checker ~`SPC0.tcu_spc_mbist_start -name * 

    // 0in exclude_checker -name *
    // 0in exclude_checker -type *

    // 0in include_checker -group zin_core_mbist
    // 0in include_checker -group zin_core_mbist_err

    // Include the checker for array protocol 
    //   (some have a group name and some do not)
    // 0in include_checker -group core_array
    // 0in include_checker -module n2_dca_sp_9kb_cust
    // 0in include_checker -module n2_dta_sp_1920b_cust
    // 0in include_checker -module n2_frf_mp_256x78_cust
    // 0in include_checker -module n2_irf_mp_128x72_cust
    // 0in include_checker -module n2_stb_cm_64x45_cust
    // 0in include_checker -module n2_tlb_tl_128x59_cust
    // 0in include_checker -module n2_tlb_tl_64x59_cust
    // 0in include_checker -module n2_ict_sp_1920b_array

`ifdef SPCINF_COVERAGE
    // 0in include_checker -name *cov_spcinf*
`endif
`endif //  `ifdef ZIN_CORE_MBIST

//---------
`ifdef SPC
//---------
//
// TLU checkers
`include "tlu/tlu_0in_intf.v"
`include "tlu/tlu_0in_traptype.v"
`include "tlu/tlu_0in_trap_priority.v"
`include "tlu/tlu_0in_disrupting.v"
`include "tlu/tlu_0in_state.v"
`include "tlu/tlu_0in_ras.v"
`include "tlu/tlu_0in_fair.v"
`include "tlu/tlu_0in_sscan.v"
`ifndef TO_1_0_VECTORS
`include "tlu/tlu_0in_halt.v"
`endif // TO_1_0_VECTORS

// FGU Interface checker
`include "fgu/fgu_checkers.v"

// IFU checkers
`include "ifu/ifu_0in_intf.v"
`include "ifu/ifu_0in_checkers.v"
`include "ifu/ifu_chkr.v"

// LSU checkers
`include "lsu/lsu_0in_intf.v"


// PKU checkers
`include "pku/pku_0in_lru.v"

// GKT checkers
//`include "gkt/gkt_0in_checkers.v"

// DEBUG
`include "debug/core_debug_chk.v"

// RAS
`include "ras/lsu_ras_chkr.v"
`include "ras/spu_ras_chkr.v"
`include "ras/mra_ras_chkr.v"
`include "ras/ifu_ras_chkr.v"
`include "ras/irf_ras_chkr.v"
`include "ras/sca_ras_chkr.v"
`include "ras/tcc_ras_chkr.v"
`include "ras/tsa_ras_chkr.v"
`include "ras/frf_ras_chkr.v"
`include "ras/tlu_dsfsr_chkr.v"

// PMU
`include "pmu/pmu_0in_checkers.v"

//MBIST
`include "mbist/mbist_0in_checkers.v"
`endif //  `ifdef SPC


//---------
`ifdef CMP
//---------
//
// TLU checkers
`include "tlu/tlu_0in_intf.v"
`include "tlu/tlu_0in_traptype.v"
`include "tlu/tlu_0in_disrupting.v"
`include "tlu/tlu_0in_state.v"
`include "tlu/tlu_0in_trap_priority.v"
`include "tlu/tlu_0in_ras.v"
`include "tlu/tlu_0in_sscan.v"
`include "ras/tlu_dsfsr_chkr.v"
`ifndef TO_1_0_VECTORS
`include "tlu/tlu_0in_halt.v"
`endif // TO_1_0_VECTORS

`ifndef TO_1_0_VECTORS
// LSU invalidate ack checker
`include "lsu/lsu_0in_inv_chkr.v"
`endif // TO_1_0_VECTORS

// FGU Interface checker
`include "fgu/fgu_checkers.v"

// IFU interface and property checkers

`ifdef CMP1
`include "ifu/ifu_0in_intf.v"
`endif
`include "ifu/ifu_chkr.v"


`ifdef CMP1
`include "ifu/ifu_0in_checkers.v"
`endif

// PKU checkers

`ifdef CMP1
`include "pku/pku_0in_lru.v"
`endif

// GKT checkers
// review lots of failures  `include "gkt/gkt_0in_checkers.v"

// CCX driven checkers
// `ifdef X_GUARD
`include "ccx/ccx_0in_checkers.v"
// `endif


`endif //  `ifdef CMP


//---------
`ifdef CCM
//---------
//

//added l2 checkers in ccm: 02.25.06;
`include "l2/l2_mcu_intf_chkr.v"
`include "l2tcpx/l2t_cpx_checker.v"
//`include "pcxl2t/pcx_l2t_checker.v"
`include "l2/l2_mh_chkr.v"
`include "l2/l2_inline.v"
`include "mcu/mcul2_intf_chkr.v"

// TLU checkers
// With ZIN_CORE_SUBSET you get checkers for cases that
// have Riesling follow-me : Async interrupts, errors
// etc.
//`include "tlu/tlu_0in_intf.v"
//`include "tlu/tlu_0in_traptype.v"
//`include "tlu/tlu_0in_disrupting.v"
//`include "tlu/tlu_0in_trap_priority.v"
//`include "tlu/tlu_0in_ras.v"
//`include "tlu/tlu_0in_sscan.v"
//`include "ras/tlu_dsfsr_chkr.v"

// FGU Interface checker
 `include "fgu/fgu_checkers.v"


// // IFU interface and property checkers

// `ifdef CCM1
// `include "ifu/ifu_0in_intf.v"
// `endif
//

// `ifdef CCM1
// `include "ifu/ifu_0in_checkers.v"
// `endif
//
// // PKU checkers

// `ifdef CCM1
// `include "pku/pku_0in_lru.v"
// `endif


// GKT checkers
// review lots of failures  `include "gkt/gkt_0in_checkers.v"

// CCX driven checkers
`ifdef X_GUARD
`include "ccx/ccx_0in_checkers.v"
`endif


`endif //  `ifdef CCM


//---------
`ifndef FC_SCAN_BENCH
`ifdef FC_BENCH
`else
`ifdef IOS
//---------
//
`include "niusiu/niu_siu_chkr.v"
`include "siu/siu_wb_chkr.v"
`include "ncuniu/ncu_niu_chkr.v"
`include "siudmu/dmu_siu_chkr.v"
`include "ncusiu/ncu_siu_chkr.v"
`include "dmuncu/dmu_ncu_chkr.v"
`include "ilupeu/ilu_peu_debug_checkers.v"
`include "ios_ras/ios_ras_chkr.v"
`ifndef TO_1_0_VECTORS
`include "../monitors/dbpdmuchkr.v"
`include "../monitors/dbpniuchkr.v"
`endif // TO_1_0_VECTORS
`endif //  `ifdef IOS
`endif // !`ifdef FC_BENCH
`endif //  `ifndef FC_SCAN_BENCH

//---------
`ifndef FC_SCAN_BENCH
`ifdef FC_BENCH
`else
`ifdef IOS
`else
`ifdef SIU
//---------
//
`ifdef SIU_RANDOM
`include "siudmu/dmu_siu_chkr.v"
`include "niusiu/niu_siu_chkr.v"
`include "siu/siu_wb_chkr.v"
`include "ncusiu/ncu_siu_chkr.v"
`include "l2siu/l2_siu_chkr.v"
`else
`include "siudmu/dmu_siu_chkr.v"
`include "niusiu/niu_siu_chkr.v"
`include "siu/siu_wb_chkr.v"
`include "ncusiu/ncu_siu_chkr.v"
`include "l2siu/l2_siu_chkr.v"
`include "siudmu/dmu_siu_ras_chkr.v"
`include "niusiu/niu_siu_ras_chkr.v"
`include "ncusiu/ncu_siu_ras_chkr.v"
`include "l2siu/l2_siu_ras_chkr.v"
`endif // !`ifdef SIU_RANDOM
`endif //  `ifdef SIU
`endif // !`ifdef IOS
`endif // !`ifdef FC_BENCH
`endif //  `ifndef FC_SCAN_BENCH

//---------
`ifndef FC_SCAN_BENCH
`ifdef FC_BENCH
`else
`ifdef IOS
`else
`ifdef NCU
//---------
//
// NCU Interface checker
`include "ncu/ncu_ccx_chkr.v"
`include "ncu/ncu_efu_chkr.v"
`include "ncu/ncu_io_chkr.v"
`include "ncu/ncu_niu_chkr.v"
`include "ncu/ncu_tcu_chkr.v"
`include "ncu/ncu_pio_chkr.v"
`include "ncu/ncu_chkr_inst.v"
`include "ncu/ncu_rtl_chkr.v"
`endif //  `ifdef NCU
`endif // !`ifdef IOS
`endif // !`ifdef FC_BENCH
`endif //  `ifndef FC_SCAN_BENCH


//---------
`ifdef IOS
`else
`ifdef DBP_SAT
//---------
//
`include "dbp/dbp_chkr_inst.v"
`include "dbp/dbp_dmu_chkr.v"
`include "dbp/dbp_mio_chkr.v"
`include "dbp/dbp_niu_chkr.v"
`endif //  `ifdef DBP_SAT
`endif // !`ifdef IOS








//---------
`ifndef FC_SCAN_BENCH
`ifdef FC_BENCH
`else
`ifdef IOS
`else
`ifdef TCU
//---------
//
// TCU Interface checker
`include "tcu/tcu_mio_chkr.v"
`include "tcu/ccu_chkr.v"
`include "tcu/ccu_testmodes_chkr.v"
`include "tcu/rst_chkr.v"
`include "tcu/tcu_chkr.v"
`include "tcu/efu_io_chkr.v"
`include "tcu/tcu_io_chkr.v"
//`include "tcu/efu_ncu_chkr.v"
//`include "tcu/efu_tcu_chkr.v"
`include "tcu/warm_rst_protect_chkr.v"
`endif //  `ifdef TCU
`endif // !`ifdef IOS
`endif // !`ifdef FC_BENCH
`endif //  `ifndef FC_SCAN_BENCH

//---------
`ifdef FGU
//---------
//
// FGU Interface checker 
`include "fgu/fgu_checkers.v"

`endif

//---------
`ifdef SPU_CRC
//---------
//
// SPU_CRC Interface checker
`include "spu_crc/spu_crc_checkers.v"

`endif

//---------
`ifndef FC_SCAN_BENCH
`ifdef FC_BENCH
//---------
//

// TLU checkers
// With ZIN_CORE_SUBSET you get checkers for cases that
// have Riesling follow-me : Async interrupts, errors
// etc.
`ifdef ZIN_USE_CORE_CHECKERS
`include "tlu/tlu_0in_intf.v"
`include "tlu/tlu_0in_trap_priority.v"
`include "tlu/tlu_0in_disrupting.v"
`include "tlu/tlu_0in_ras.v"
`include "lsu/lsu_0in_intf.v"
`include "ras/tlu_dsfsr_chkr.v"
`ifndef TO_1_0_VECTORS
`include "tlu/tlu_0in_halt.v"
`endif // TO_1_0_VECTORS
`endif //  `ifdef ZIN_USE_CORE_CHECKERS

// NCU Cross-thread interrupt checker
`include "ncu/ncu_cxint_chkr.v"
`include "ncu/ncu_ccx_chkr.v"
`include "ncu/ncu_efu_chkr.v"
`include "ncu/ncu_io_chkr.v"
`include "ncu/ncu_niu_chkr.v"
`include "ncu/ncu_tcu_chkr.v"
`include "ncu/ncu_pio_chkr.v"
`include "ncu/ncu_chkr_inst.v"
`include "ncu/ncu_rtl_chkr.v"

//L2 and MCU Interface checkers
`include "l2/l2_mcu_intf_chkr.v"
`include "l2tcpx/l2t_cpx_checker.v"
`include "pcxl2t/pcx_l2t_checker.v"
`include "l2/l2_mh_chkr.v"
`include "l2/l2_inline.v"
`include "mcu/mcul2_intf_chkr.v"

//IOS checkers
`include "ios_ras/ios_ras_chkr.v"
`include "siudmu/dmu_siu_chkr.v"
`include "niusiu/niu_siu_chkr.v"
`include "siu/siu_wb_chkr.v"
`include "ncusiu/ncu_siu_chkr.v"
`include "l2siu/l2_siu_chkr.v"
`include "dmuncu/dmu_ncu_chkr.v"
`include "siudmu/dmu_siu_ras_chkr.v"
`include "niusiu/niu_siu_ras_chkr.v"
`include "ncusiu/ncu_siu_ras_chkr.v"
`include "l2siu/l2_siu_ras_chkr.v"

// Add All SOC Checkers here
`include "dmu/jdia_checkers.v"
`include "dmu/tiia_checkers.v"
`include "tcu/rst_chkr.v"
`include "tcu/tcu_io_chkr.v"
`include "tcu/warm_rst_protect_chkr.v"
`include "tcu/red_reg_chkr.v"
`include "ncu/ncu_xir_chkr.v"
`include "ncu/niu_ncu_intr_chkr.v"

// CCX driven checkers
`ifdef X_GUARD
`include "ccx/ccx_0in_checkers.v"
`endif


`endif //  `ifdef FC_BENCH
`endif //  `ifndef FC_SCAN_BENCH


//---------
`ifdef DMC
//---------
//
// DSN-DMC interface checker (from Fire)
`include "dmu/jdia_checkers.v"
// DMC-ILU interface checker (from Fire)
`include "dmu/tiia_checkers.v"
// DSN-NCU interface checkers
`include "dmuncu/dmu_ncu_chkr.v"
// DSN-SIU interface checker
`include "siudmu/dmu_siu_chkr.v"

`endif //  `ifdef DMC


//---------
`ifdef DSN
//---------
//
// DSN-DMC interface checker
`include "dmu/jdia_checkers.v"
// DSN-NCU interface checkers
`include "dmuncu/dmu_ncu_chkr.v"
// DSN-SIU interface checker
`include "siudmu/dmu_siu_chkr.v"

`endif //  `ifdef DSN


//---------
 `ifdef L2
//---------
//
// l2 checkers
`include "l2/l2_mh_chkr.v"
`include "l2/l2_inline.v"
`include "l2/l2_mcu_intf_chkr.v"
`include "l2tcpx/l2t_cpx_checker.v"
`include "pcxl2t/pcx_l2t_checker.v"
//`include "l2siu/l2_siu_chkr.v"
`endif //  `ifdef L2



//------------
 `ifdef IOMMU
//------------
//
`include "iommu/iommu_if_checkers.v"
`endif

//---------
`ifndef FC_SCAN_BENCH
`ifdef FC_BENCH
`else
`ifdef IOS
`else
`ifdef N2_NIU
//---------
//
//`include "niusiu/niu_siu_chkr.v"
//`include "ncuniu/ncu_niu_chkr.v"
`endif //  `ifdef N2_NIU
`endif // !`ifdef IOS
`endif // !`ifdef FC_BENCH
`endif //  `ifndef FC_SCAN_BENCH


//------------
`ifndef FC_SCAN_BENCH
`ifdef FC_BENCH
`include "ilupeu/ilu_peu_checkers.v"
// - probes Unencrypted peu rtl `include "ilupeu/ilu_peu_debug_checkers.v"

`else
`ifdef IOS
`else
 `ifdef PEU
//------------
// peu
`include "ilupeu/ilu_peu_checkers.v"
`include "ilupeu/ilu_peu_debug_checkers.v"
// dmu-ilu
`include "dmu/tiia_checkers.v"
`endif //  `ifdef PEU
`endif // !`ifdef IOS
`endif // !`ifdef FC_BENCH
`endif //  `ifndef FC_SCAN_BENCH



// ------------------------------
// FC_SCAN_BENCH here
// ------------------------------

//------------
`ifdef MFG_SCAN
  // 0in exclude_checker -name *
  // 0in exclude_checker -type *
  // 0  in include_checker -group clusterHeaderScan
  // `include "dft/clusterHeaderScan_0in.v"
`endif
//------------

//------------
`ifdef JTAG_SCAN
  // 0in exclude_checker -name *
  // 0in exclude_checker -type *
  // 0  in include_checker -group clusterHeaderScan
  // `include "dft/clusterHeaderScan_0in.v"
`endif
//------------

//------------
`ifdef FC_SCAN_RESET
  // 0in exclude_checker -name *
  // 0in exclude_checker -type *
  // 0in include_checker -group rst_chkr
  // 0in include_checker -group red_reg_chkr
`include "tcu/red_reg_chkr.v"
`include "tcu/rst_chkr.v"
`include "tcu/warm_rst_protect_chkr.v"
`endif
//----------

//------------
`ifndef TO_1_0_VECTORS
`ifdef FC_MBIST
  // 0in exclude_checker -name *
  // 0in exclude_checker -type *
  // 0in include_checker -group mbist_mode
  // 0in disable_checker ~`TCU.mbist_ctl.tcu_mb_start[47:0] -name *
`endif
`endif // TO_1_0_VECTORS
//------------

