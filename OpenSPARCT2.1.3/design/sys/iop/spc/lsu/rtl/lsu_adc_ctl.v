// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_adc_ctl.v
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
module lsu_adc_ctl (
  asi_e, 
  asi_m, 
  lsu_va_m, 
  sr_inst_e, 
  pr_inst_e, 
  hpr_inst_e, 
  sr_inst_m, 
  pr_inst_m, 
  hpr_inst_m, 
  altspace_ldst_e, 
  altspace_ldst_m, 
  ld_inst_vld_m, 
  legal_asi_va_m, 
  asi_legal_e, 
  asr_legal_m, 
  asi_sync_m, 
  asi_internal_e, 
  asi_rngf_m, 
  asi_indet_m, 
  lendian_asi_m, 
  asi_sz_byte_m, 
  asi_sz_hw_m, 
  pst_asi_m, 
  asi_pst8_m, 
  asi_pst16_m, 
  asi_pst32_m, 
  asi_read_only_m, 
  asi_write_only_m, 
  quad_asi_m, 
  binit_quad_asi_m, 
  primary_asi_e, 
  secondary_asi_e, 
  real_asi_e, 
  as_if_user_asi_e, 
  as_if_priv_asi_e, 
  atomic_asi_m, 
  blk_asi_e, 
  nofault_asi_m, 
  asi_iomap_m, 
  asi_no_va_check_m);
wire indet_m;


input	[7:0]	asi_e;
input	[7:0]	asi_m;			// This version has SR/PR/HPR muxed in
input	[11:3]	lsu_va_m;
input		sr_inst_e;
input		pr_inst_e;
input		hpr_inst_e;
input		sr_inst_m;
input		pr_inst_m;
input		hpr_inst_m;
input		altspace_ldst_e;
input		altspace_ldst_m;
input		ld_inst_vld_m;

output		legal_asi_va_m;
output		asi_legal_e;
output		asr_legal_m;
output		asi_sync_m;
output		asi_internal_e ;
output		asi_rngf_m;
output		asi_indet_m;
output		lendian_asi_m;
output		asi_sz_byte_m;
output		asi_sz_hw_m;
output		pst_asi_m;
output		asi_pst8_m;
output		asi_pst16_m;
output		asi_pst32_m;
output		asi_read_only_m;
output		asi_write_only_m;
output		quad_asi_m ;
output		binit_quad_asi_m ;
output		primary_asi_e ;
output		secondary_asi_e ;
output		real_asi_e;
output		as_if_user_asi_e ;
output		as_if_priv_asi_e ;
output		atomic_asi_m ;
output		blk_asi_e ;
output		nofault_asi_m ;
output		asi_iomap_m ;
output		asi_no_va_check_m ;

// CMP registers that reside off-chip and require IO mapping
assign asi_iomap_m = altspace_ldst_m & (
			(asi_m[7:0] == 8'h41) | 		// CMP registers
			(asi_m[7:0] == 8'h73) |			// ASI_SWVR_UDB_INTR_W
			(asi_m[7:0] == 8'h45 & lsu_va_m[4])	// SOC debug registers
			);

// Quad (These are duplicated - they can be shared)
assign	binit_quad_asi_m = altspace_ldst_m & (
        (asi_m[7:0] == 8'h27) | // asi_nucleus_blk_init_st_quad_ldd
        (asi_m[7:0] == 8'h2F) | // asi_nucleus_blk_init_st_quad_ldd_little
	(asi_m[7:0] == 8'h22) |	// asi_as_if_user_primary_quad_ldd (blk-init)
	(asi_m[7:0] == 8'h2A) |	// asi_as_if_user_primary_quad_ldd_little (blk-init)
	(asi_m[7:0] == 8'h23) |	// asi_as_if_user_secondary_quad_ldd (blk-init)
	(asi_m[7:0] == 8'h2B) |	// asi_as_if_user_secondary_quad_ldd_little (blk-init)
	(asi_m[7:0] == 8'hE2) |	// asi_primary_quad_ldd (blk-init)
	(asi_m[7:0] == 8'hEA) |	// asi_primary_quad_ldd_little (blk-init)
	(asi_m[7:0] == 8'hE3) |	// asi_secondary_quad_ldd (blk-init)
	(asi_m[7:0] == 8'hEB) 	// asi_secondary_quad_ldd_little (blk-init)
       );

assign	quad_asi_m = altspace_ldst_m & (
	binit_quad_asi_m      | // blk-init quad asi
	(asi_m[7:0] == 8'h26) | // asi_quad_ldd_real
	(asi_m[7:0] == 8'h2E) | // asi_quad_ldd_real_little
	(asi_m[7:0] == 8'h24) | // asi_nucleus_quad_ldd 
	(asi_m[7:0] == 8'h2C)   // asi_nucleus_quad_ldd_little 
       );
	
// Legal ASI's
assign asi_legal_e = (!asi_e[7]&!asi_e[6]&asi_e[4]&asi_e[2]&asi_e[1]&!asi_e[0]) | (
    asi_e[7]&asi_e[6]&!asi_e[3]&!asi_e[2]&!asi_e[1]) | (!asi_e[7]
    &asi_e[6]&!asi_e[5]&!asi_e[3]&asi_e[0]) | (!asi_e[7]&asi_e[6]
    &!asi_e[5]&asi_e[3]&!asi_e[0]) | (!asi_e[7]&asi_e[5]&!asi_e[4]
    &!asi_e[3]&asi_e[2]&asi_e[1]) | (!asi_e[7]&asi_e[6]&!asi_e[3]
    &!asi_e[2]&asi_e[1]&asi_e[0]) | (!asi_e[7]&!asi_e[6]&!asi_e[4]
    &asi_e[2]&!asi_e[1]&!asi_e[0]) | (asi_e[6]&!asi_e[5]&!asi_e[2]
    &asi_e[1]&!asi_e[0]) | (asi_e[6]&!asi_e[5]&!asi_e[2]&!asi_e[1]
    &asi_e[0]) | (asi_e[6]&!asi_e[5]&asi_e[4]&!asi_e[2]) | (!asi_e[7]
    &!asi_e[6]&asi_e[5]&!asi_e[4]&asi_e[1]) | (!asi_e[7]&!asi_e[6]
    &asi_e[5]&!asi_e[4]&!asi_e[3]) | (asi_e[7]&asi_e[6]&asi_e[4]&!asi_e[2]
    &!asi_e[1]) | (asi_e[7]&asi_e[6]&!asi_e[4]&!asi_e[2]&asi_e[1]) | (
    !asi_e[7]&!asi_e[6]&asi_e[4]&!asi_e[2]&!asi_e[1]) | (!asi_e[7]
    &!asi_e[5]&asi_e[4]&asi_e[2]) | (asi_e[7]&!asi_e[5]&!asi_e[4]
    &!asi_e[2]) | (asi_e[7]&asi_e[6]&!asi_e[5]&!asi_e[4]&!asi_e[1]) | (
    !asi_e[7]&asi_e[6]&asi_e[4]&!asi_e[3]&asi_e[2]&!asi_e[1]&!asi_e[0]) | (
    !asi_e[7]&asi_e[6]&asi_e[4]&!asi_e[3]&!asi_e[2]&asi_e[1]) | (
    !asi_e[7]&asi_e[6]&!asi_e[5]&asi_e[2]&asi_e[1]) | (!altspace_ldst_e);


assign asr_legal_m = (hpr_inst_m&asi_m[4]&asi_m[3]&asi_m[2]&asi_m[1]) | (
    !asi_m[4]&!asi_m[3]&!asi_m[2]&!asi_m[1]&!asi_m[0]) | (sr_inst_m
    &asi_m[4]&asi_m[3]&!asi_m[2]&!asi_m[0]) | (!sr_inst_m&!hpr_inst_m
    &!asi_m[4]&!asi_m[2]) | (!sr_inst_m&!hpr_inst_m&!asi_m[4]&!asi_m[3]) | (
    sr_inst_m&!asi_m[4]&asi_m[3]&asi_m[2]&asi_m[1]&asi_m[0]) | (
    !hpr_inst_m&!asi_m[4]&!asi_m[3]&!asi_m[2]&asi_m[1]) | (!sr_inst_m
    &!hpr_inst_m&!asi_m[4]&!asi_m[1]) | (sr_inst_m&!asi_m[3]&asi_m[2]
    &!asi_m[1]) | (!pr_inst_m&!hpr_inst_m&!asi_m[3]&!asi_m[2]&asi_m[1]
    &asi_m[0]) | (sr_inst_m&asi_m[4]&!asi_m[2]&!asi_m[1]) | (sr_inst_m
    &asi_m[4]&!asi_m[3]&asi_m[2]) | (!asi_m[4]&!asi_m[3]&!asi_m[2]
    &asi_m[1]&asi_m[0]) | (pr_inst_m&!asi_m[4]&!asi_m[0]) | (!hpr_inst_m
    &!asi_m[3]&!asi_m[2]&!asi_m[1]&!asi_m[0]) | (!sr_inst_m&!asi_m[4]
    &!asi_m[3]&!asi_m[1]&asi_m[0]) | (!asi_m[4]&!asi_m[3]&asi_m[2]
    &asi_m[1]&!asi_m[0]) | (!sr_inst_m&!pr_inst_m&!hpr_inst_m);

// ASI Internal Registers 
assign asi_internal_e = (altspace_ldst_e&asi_e[5]&asi_e[4]&!asi_e[2]&asi_e[1]) | (
    altspace_ldst_e&asi_e[6]&asi_e[5]&asi_e[2]) | (altspace_ldst_e
    &!asi_e[7]&!asi_e[4]&!asi_e[1]&asi_e[0]) | (altspace_ldst_e&asi_e[6]
    &asi_e[4]&asi_e[2]) | (altspace_ldst_e&asi_e[6]&asi_e[5]&!asi_e[4]
    &asi_e[3]&!asi_e[1]) | (altspace_ldst_e&!asi_e[6]&asi_e[4]&!asi_e[2]
    &asi_e[1]) | (altspace_ldst_e&!asi_e[7]&!asi_e[5]&!asi_e[4]&asi_e[1]) | (
    altspace_ldst_e&!asi_e[7]&!asi_e[4]&!asi_e[2]&!asi_e[1]) | (
    altspace_ldst_e&asi_e[5]&asi_e[4]&asi_e[1]&asi_e[0]) | (
    altspace_ldst_e&asi_e[6]&asi_e[2]&asi_e[1]) | (hpr_inst_e) | (
    sr_inst_e) | (pr_inst_e) | (altspace_ldst_e&asi_e[7]&!asi_e[6]
    &asi_e[5]) | (altspace_ldst_e&!asi_e[7]&asi_e[6]) | (altspace_ldst_e
    &asi_e[7]&!asi_e[6]&asi_e[4]) | (altspace_ldst_e&asi_e[7]&!asi_e[6]
    &asi_e[2]) | (altspace_ldst_e&asi_e[5]&asi_e[4]&asi_e[2]&!asi_e[1]);


// Diferentiate between fast and slow ring.
assign asi_rngf_m = (sr_inst_m&asi_m[4]&asi_m[2]) | (altspace_ldst_m&asi_m[3]
    &asi_m[1]&asi_m[0]) | (altspace_ldst_m&!asi_m[3]&!asi_m[2]&!asi_m[1]
    &asi_m[0]) | (altspace_ldst_m&asi_m[5]&!asi_m[1]) | (altspace_ldst_m
    &!asi_m[4]&!asi_m[2]&asi_m[1]&asi_m[0]) | (altspace_ldst_m&asi_m[2]
    &!asi_m[1]&!asi_m[0]) | (altspace_ldst_m&!asi_m[4]&asi_m[2]&!asi_m[1]) | (
    hpr_inst_m) | (altspace_ldst_m&asi_m[4]&!asi_m[2]&!asi_m[0]) | (
    sr_inst_m&asi_m[3]&!asi_m[1]) | (pr_inst_m&!asi_m[2]&!asi_m[1]
    &!asi_m[0]) | (altspace_ldst_m&asi_m[4]&asi_m[3]) | (pr_inst_m
    &!asi_m[3]) | (altspace_ldst_m&asi_m[3]&!asi_m[2]&asi_m[1]) | (
    sr_inst_m&!asi_m[4]&asi_m[0]) | (sr_inst_m&asi_m[2]&!asi_m[1]) | (
    altspace_ldst_m&asi_m[4]&asi_m[2]&asi_m[1]&asi_m[0]);


assign indet_m = (altspace_ldst_m&!asi_m[7]&asi_m[4]&asi_m[3]&!asi_m[2]
    &asi_m[1]) | (altspace_ldst_m&asi_m[6]&asi_m[4]&!asi_m[3]&asi_m[2]
    &!asi_m[1]&asi_m[0]) | (altspace_ldst_m&asi_m[6]&!asi_m[4]&!asi_m[3]
    &asi_m[2]&asi_m[1]) | (altspace_ldst_m&!asi_m[7]&!asi_m[5]&!asi_m[4]
    &asi_m[3]&!asi_m[2]) | (altspace_ldst_m&!asi_m[7]&asi_m[6]&!asi_m[5]
    &asi_m[4]&!asi_m[2]&asi_m[0]) | (pr_inst_m&~ld_inst_vld_m&asi_m[3]&!asi_m[2]
    &!asi_m[1]&asi_m[0]) | (altspace_ldst_m&asi_m[6]&!asi_m[3]&asi_m[2]
    &asi_m[1]&!asi_m[0]);

// ASI=0x40 / VA=0x30 and 0xA0 needs to be indeterminate as well
assign asi_indet_m = indet_m | (altspace_ldst_m & (asi_m[7:0] == 8'h40) &
                               ((lsu_va_m[7:5] == 3'b101) | (lsu_va_m[5:4] == 2'b11)));

// ASIs which sync on writes
assign asi_sync_m = (altspace_ldst_m&!asi_m[7]&asi_m[6]&asi_m[3]&!asi_m[0]) | (
    altspace_ldst_m&!asi_m[7]&asi_m[6]&!asi_m[3]&asi_m[1]) | (
    altspace_ldst_m&!asi_m[7]&!asi_m[4]&!asi_m[1]&asi_m[0]) | (
    hpr_inst_m) | (sr_inst_m) | (pr_inst_m) | (altspace_ldst_m&!asi_m[7]
    &asi_m[6]&asi_m[4]);

// Little Endian
assign lendian_asi_m = (altspace_ldst_m&!asi_m[6]&asi_m[3]) | (altspace_ldst_m
    &asi_m[7]&asi_m[3]);

// Size overrides for partial and short store ASIs
assign asi_sz_byte_m = (altspace_ldst_m&asi_m[7]&!asi_m[5]&asi_m[4]&!asi_m[1]);

assign asi_sz_hw_m = (altspace_ldst_m&asi_m[7]&asi_m[4]&asi_m[1]);

// Partial Store ASIs
assign pst_asi_m = altspace_ldst_m & (asi_m[7:4] == 4'hc);

assign asi_pst8_m = (altspace_ldst_m&asi_m[7]&asi_m[6]&!asi_m[5]&!asi_m[4]
    &!asi_m[2]&!asi_m[1]);
assign asi_pst16_m = (altspace_ldst_m&asi_m[7]&asi_m[6]&!asi_m[5]&!asi_m[4]
    &asi_m[1]);
assign asi_pst32_m = (altspace_ldst_m&asi_m[7]&asi_m[2]);

// Block ASI's
assign blk_asi_e = (altspace_ldst_e&!asi_e[6]&!asi_e[5]&asi_e[2]&asi_e[1]) | (
    altspace_ldst_e&asi_e[7]&asi_e[5]&!asi_e[1]);

// Atomic asi
assign atomic_asi_m = (!asi_m[6]&!asi_m[5]&!asi_m[2]&!asi_m[1]) | (!asi_m[6]
    &asi_m[5]&asi_m[4]) | (!asi_m[6]&!asi_m[5]&!asi_m[1]&!asi_m[0]) | (
    !altspace_ldst_m);

// Context selection
assign primary_asi_e = (asi_e[6]&!asi_e[0]) | (!asi_e[5]&asi_e[1]&!asi_e[0]) | (
    !asi_e[2]&!asi_e[0]) | (!altspace_ldst_e);

assign secondary_asi_e = (altspace_ldst_e&!asi_e[5]&asi_e[0]) | (
    altspace_ldst_e&!asi_e[2]&asi_e[0]);

assign real_asi_e = (altspace_ldst_e&!asi_e[6]&!asi_e[4]&asi_e[2]&asi_e[1]
    &!asi_e[0]) | (altspace_ldst_e&!asi_e[6]&asi_e[4]&asi_e[2]&!asi_e[1]);

assign as_if_user_asi_e = (altspace_ldst_e&!asi_e[6]&asi_e[5]&!asi_e[2]&asi_e[1]) | (
    altspace_ldst_e&!asi_e[6]&!asi_e[5]&asi_e[4]&!asi_e[2]) | (
    altspace_ldst_e&!asi_e[6]&!asi_e[5]&asi_e[2]&asi_e[1]);

assign as_if_priv_asi_e = (altspace_ldst_e&!asi_e[6]&asi_e[5]&asi_e[4]);

// No Fault
assign	nofault_asi_m = (altspace_ldst_m&asi_m[7]&!asi_m[6]&asi_m[1]);

// Read and write only ASI's
assign asi_read_only_m = (altspace_ldst_m&asi_m[5]&asi_m[4]&asi_m[2]&!asi_m[1]) | (
    altspace_ldst_m&asi_m[7]&!asi_m[6]&asi_m[1]) | (altspace_ldst_m
    &!asi_m[7]&asi_m[4]&asi_m[3]&!asi_m[2]&asi_m[1]) | (altspace_ldst_m
    &!asi_m[7]&asi_m[6]&!asi_m[5]&asi_m[4]&!asi_m[2]&asi_m[0]) | (
    altspace_ldst_m&!asi_m[7]&!asi_m[5]&!asi_m[4]&asi_m[3]&!asi_m[2]) | (
    altspace_ldst_m&!asi_m[7]&asi_m[6]&asi_m[5]&!asi_m[4]&!asi_m[2]) | (
    altspace_ldst_m&asi_m[6]&asi_m[4]&asi_m[2]&asi_m[1]&!asi_m[0]);

assign asi_write_only_m = (altspace_ldst_m&asi_m[5]&asi_m[4]&asi_m[1]&asi_m[0]) | (
    altspace_ldst_m&asi_m[6]&asi_m[5]&!asi_m[4]&!asi_m[1]) | (
    altspace_ldst_m&asi_m[6]&asi_m[4]&asi_m[2]&asi_m[1]&asi_m[0]) | (
    altspace_ldst_m&asi_m[6]&asi_m[4]&asi_m[3]&asi_m[2]&!asi_m[1]
    &!asi_m[0]) | (altspace_ldst_m&asi_m[7]&asi_m[6]&!asi_m[5]&!asi_m[4]);


// ASI's which do not require VA checking
assign asi_no_va_check_m = (altspace_ldst_m&asi_m[6]&asi_m[4]&asi_m[2]&asi_m[1]
    &asi_m[0]) | (altspace_ldst_m&asi_m[6]&!asi_m[4]&!asi_m[3]&asi_m[2]
    &asi_m[1]) | (altspace_ldst_m&!asi_m[7]&!asi_m[5]&!asi_m[4]&asi_m[3]
    &!asi_m[2]) | (altspace_ldst_m&!asi_m[7]&asi_m[6]&!asi_m[5]&asi_m[4]
    &!asi_m[2]&asi_m[0]);

// Valid ASI/VA combinations
assign legal_asi_va_m = (!asi_m[6]&asi_m[2]&!lsu_va_m[11]&!lsu_va_m[10]
    &lsu_va_m[9]&lsu_va_m[8]&lsu_va_m[7]&lsu_va_m[6]) | (!asi_m[6]
    &!asi_m[2]&asi_m[0]&!lsu_va_m[11]&!lsu_va_m[10]&!lsu_va_m[9]
    &!lsu_va_m[7]&!lsu_va_m[6]&!lsu_va_m[5]&!lsu_va_m[4]&lsu_va_m[3]) | (
    asi_m[5]&!asi_m[2]&!asi_m[1]&asi_m[0]&!lsu_va_m[11]&!lsu_va_m[10]
    &!lsu_va_m[9]&!lsu_va_m[7]&!lsu_va_m[6]&!lsu_va_m[5]&lsu_va_m[4]
    &!lsu_va_m[3]) | (asi_m[5]&!asi_m[4]&asi_m[1]&!lsu_va_m[11]
    &!lsu_va_m[10]&!lsu_va_m[9]&!lsu_va_m[8]&!lsu_va_m[7]&!lsu_va_m[6]
    &!lsu_va_m[5]&!lsu_va_m[3]) | (asi_m[2]&!asi_m[0]&!lsu_va_m[11]
    &!lsu_va_m[10]&!lsu_va_m[9]&!lsu_va_m[8]&!lsu_va_m[7]&!lsu_va_m[6]
    &!lsu_va_m[5]&!lsu_va_m[4]&!lsu_va_m[3]) | (asi_m[5]&!asi_m[4]
    &!asi_m[0]&!lsu_va_m[11]&!lsu_va_m[10]&!lsu_va_m[9]&!lsu_va_m[8]
    &!lsu_va_m[7]&!lsu_va_m[6]&lsu_va_m[4]) | (asi_m[5]&!asi_m[0]
    &!lsu_va_m[11]&!lsu_va_m[10]&!lsu_va_m[9]&!lsu_va_m[8]&!lsu_va_m[7]
    &!lsu_va_m[6]&!lsu_va_m[5]&!lsu_va_m[4]&!lsu_va_m[3]) | (!asi_m[5]
    &!asi_m[4]&!asi_m[2]&!asi_m[1]&!asi_m[0]&!lsu_va_m[11]&!lsu_va_m[10]
    &!lsu_va_m[9]&!lsu_va_m[8]&!lsu_va_m[6]&!lsu_va_m[4]&!lsu_va_m[3]) | (
    !asi_m[5]&!asi_m[2]&!asi_m[1]&asi_m[0]&!lsu_va_m[11]&!lsu_va_m[10]
    &!lsu_va_m[9]&!lsu_va_m[8]&!lsu_va_m[7]&!lsu_va_m[6]&lsu_va_m[5]
    &lsu_va_m[4]) | (!asi_m[5]&asi_m[4]&asi_m[2]&!lsu_va_m[11]
    &!lsu_va_m[9]&!lsu_va_m[8]&!lsu_va_m[7]&!lsu_va_m[6]&!lsu_va_m[5]
    &!lsu_va_m[4]&!lsu_va_m[3]) | (!asi_m[4]&!asi_m[2]&!asi_m[0]
    &!lsu_va_m[11]&!lsu_va_m[10]&!lsu_va_m[9]&!lsu_va_m[8]&!lsu_va_m[7]
    &!lsu_va_m[6]&!lsu_va_m[5]&!lsu_va_m[4]&lsu_va_m[3]) | (asi_m[4]
    &asi_m[3]&asi_m[1]&!lsu_va_m[11]&!lsu_va_m[10]&!lsu_va_m[9]
    &!lsu_va_m[8]&!lsu_va_m[7]&!lsu_va_m[6]&!lsu_va_m[4]) | (!asi_m[4]
    &!asi_m[2]&!asi_m[0]&!lsu_va_m[11]&!lsu_va_m[10]&!lsu_va_m[9]
    &!lsu_va_m[8]&!lsu_va_m[7]&!lsu_va_m[6]&!lsu_va_m[5]&lsu_va_m[4]
    &!lsu_va_m[3]) | (asi_m[4]&asi_m[3]&asi_m[1]&!lsu_va_m[11]
    &!lsu_va_m[10]&!lsu_va_m[9]&!lsu_va_m[8]&!lsu_va_m[7]&!lsu_va_m[6]
    &!lsu_va_m[3]) | (!asi_m[5]&!asi_m[2]&!asi_m[1]&asi_m[0]&!lsu_va_m[11]
    &!lsu_va_m[10]&!lsu_va_m[9]&!lsu_va_m[8]&!lsu_va_m[7]&lsu_va_m[6]
    &lsu_va_m[5]&!lsu_va_m[4]) | (!asi_m[5]&!asi_m[2]&!asi_m[1]&asi_m[0]
    &!lsu_va_m[11]&!lsu_va_m[10]&!lsu_va_m[9]&!lsu_va_m[8]&!lsu_va_m[7]
    &lsu_va_m[6]&!lsu_va_m[5]&lsu_va_m[4]) | (!asi_m[5]&!asi_m[3]
    &asi_m[2]&!asi_m[0]&!lsu_va_m[11]&!lsu_va_m[10]&!lsu_va_m[9]
    &!lsu_va_m[8]&!lsu_va_m[7]&lsu_va_m[6]) | (!asi_m[5]&!asi_m[3]
    &asi_m[2]&asi_m[0]&!lsu_va_m[11]&!lsu_va_m[10]&!lsu_va_m[9]
    &!lsu_va_m[8]&!lsu_va_m[7]&!lsu_va_m[6]&!lsu_va_m[5]&lsu_va_m[3]) | (
    asi_m[4]&!asi_m[2]&!asi_m[1]&!lsu_va_m[11]&!lsu_va_m[10]&!lsu_va_m[9]
    &!lsu_va_m[8]&!lsu_va_m[7]&!lsu_va_m[6]&lsu_va_m[4]&lsu_va_m[3]) | (
    asi_m[3]&!asi_m[2]&!asi_m[0]&!lsu_va_m[11]&!lsu_va_m[10]&!lsu_va_m[9]
    &!lsu_va_m[8]&!lsu_va_m[7]&!lsu_va_m[6]&!lsu_va_m[4]&!lsu_va_m[3]) | (
    !asi_m[5]&!asi_m[3]&asi_m[2]&!asi_m[0]&!lsu_va_m[11]&!lsu_va_m[10]
    &!lsu_va_m[9]&!lsu_va_m[8]&lsu_va_m[7]&!lsu_va_m[6]&!lsu_va_m[5]) | (
    !asi_m[5]&!asi_m[3]&asi_m[2]&!asi_m[0]&!lsu_va_m[11]&!lsu_va_m[10]
    &!lsu_va_m[9]&!lsu_va_m[8]&!lsu_va_m[7]&lsu_va_m[5]) | (asi_m[4]
    &!asi_m[2]&!asi_m[1]&!lsu_va_m[11]&!lsu_va_m[10]&!lsu_va_m[9]
    &!lsu_va_m[8]&!lsu_va_m[7]&!lsu_va_m[6]&lsu_va_m[5]&lsu_va_m[4]) | (
    !asi_m[5]&!asi_m[4]&!asi_m[2]&!asi_m[1]&!asi_m[0]&!lsu_va_m[11]
    &!lsu_va_m[10]&!lsu_va_m[9]&!lsu_va_m[8]&!lsu_va_m[6]&!lsu_va_m[5]) | (
    !asi_m[1]&!asi_m[0]&!lsu_va_m[11]&!lsu_va_m[10]&!lsu_va_m[9]
    &!lsu_va_m[8]&!lsu_va_m[7]&!lsu_va_m[6]&!lsu_va_m[5]&!lsu_va_m[4]
    &!lsu_va_m[3]) | (!asi_m[5]&!asi_m[3]&asi_m[2]&!asi_m[0]&!lsu_va_m[11]
    &!lsu_va_m[10]&!lsu_va_m[9]&!lsu_va_m[8]&!lsu_va_m[7]&lsu_va_m[4]) | (
    !asi_m[5]&!asi_m[4]&!asi_m[1]&!asi_m[0]&!lsu_va_m[11]&!lsu_va_m[10]
    &!lsu_va_m[9]&!lsu_va_m[8]&!lsu_va_m[7]&!lsu_va_m[6]&!lsu_va_m[4]) | (
    !asi_m[5]&!asi_m[4]&!asi_m[2]&!asi_m[1]&!lsu_va_m[11]&!lsu_va_m[10]
    &!lsu_va_m[9]&!lsu_va_m[8]&!lsu_va_m[7]&!lsu_va_m[6]&!lsu_va_m[3]) | (
    asi_m[6]&asi_m[0]&!lsu_va_m[11]&!lsu_va_m[10]&!lsu_va_m[9]
    &!lsu_va_m[8]&!lsu_va_m[7]&!lsu_va_m[6]&!lsu_va_m[5]&!lsu_va_m[4]
    &!lsu_va_m[3]) | (!asi_m[3]&asi_m[2]&asi_m[1]&!lsu_va_m[11]
    &!lsu_va_m[9]) | (asi_m[4]&!asi_m[1]&asi_m[0]&!lsu_va_m[11]
    &!lsu_va_m[9]) | (asi_m[4]&!asi_m[2]&!asi_m[1]&asi_m[0]) | (asi_m[3]
    &!asi_m[2]&!asi_m[1]&asi_m[0]) | (!asi_m[4]&!asi_m[3]&asi_m[2]
    &asi_m[1]) | (!asi_m[5]&asi_m[4]&asi_m[1]&asi_m[0]) | (asi_m[2]
    &asi_m[1]&asi_m[0]&!lsu_va_m[11]&!lsu_va_m[10]&!lsu_va_m[9]
    &!lsu_va_m[8]&!lsu_va_m[7]&!lsu_va_m[6]) | (!asi_m[4]&!asi_m[1]
    &!asi_m[0]&!lsu_va_m[11]&!lsu_va_m[10]&!lsu_va_m[9]&!lsu_va_m[8]
    &!lsu_va_m[7]&!lsu_va_m[6]&!lsu_va_m[5]) | (!asi_m[5]&asi_m[4]
    &!asi_m[3]&!asi_m[2]&asi_m[1]&!lsu_va_m[11]&!lsu_va_m[10]&lsu_va_m[9]
    &!lsu_va_m[8]&!lsu_va_m[7]&!lsu_va_m[6]&lsu_va_m[5]&!lsu_va_m[4]
    &!lsu_va_m[3]) | (!asi_m[5]&asi_m[4]&!asi_m[3]&!asi_m[2]&asi_m[1]
    &!lsu_va_m[11]&!lsu_va_m[10]&lsu_va_m[9]&!lsu_va_m[8]&!lsu_va_m[7]
    &!lsu_va_m[6]&!lsu_va_m[5]&lsu_va_m[3]) | (!asi_m[5]&asi_m[4]
    &!asi_m[3]&asi_m[1]&!lsu_va_m[11]&!lsu_va_m[10]&!lsu_va_m[9]
    &lsu_va_m[8]&!lsu_va_m[7]&!lsu_va_m[6]&lsu_va_m[5]&!lsu_va_m[4]
    &!lsu_va_m[3]) | (!asi_m[5]&asi_m[4]&!asi_m[3]&asi_m[1]&!lsu_va_m[11]
    &!lsu_va_m[10]&!lsu_va_m[9]&lsu_va_m[8]&!lsu_va_m[7]&!lsu_va_m[6]
    &!lsu_va_m[5]&lsu_va_m[3]) | (!asi_m[5]&asi_m[4]&!asi_m[3]&!asi_m[2]
    &asi_m[1]&!lsu_va_m[11]&!lsu_va_m[10]&lsu_va_m[9]&!lsu_va_m[8]
    &!lsu_va_m[7]&!lsu_va_m[6]&!lsu_va_m[5]&lsu_va_m[4]) | (!asi_m[5]
    &asi_m[4]&!asi_m[3]&asi_m[1]&!lsu_va_m[11]&!lsu_va_m[10]&!lsu_va_m[9]
    &lsu_va_m[8]&!lsu_va_m[7]&!lsu_va_m[6]&!lsu_va_m[5]&lsu_va_m[4]) | (
    asi_m[3]&!asi_m[2]&!asi_m[1]&!lsu_va_m[11]&!lsu_va_m[10]&!lsu_va_m[9]
    &!lsu_va_m[8]&!lsu_va_m[6]&!lsu_va_m[5]&!lsu_va_m[4]&!lsu_va_m[3]) | (
    asi_m[3]&!asi_m[2]&!asi_m[1]&!lsu_va_m[11]&!lsu_va_m[10]&!lsu_va_m[9]
    &!lsu_va_m[8]&!lsu_va_m[7]&!lsu_va_m[5]&!lsu_va_m[4]&!lsu_va_m[3]) | (
    asi_m[4]&asi_m[3]&asi_m[2]&asi_m[1]&!lsu_va_m[11]) | (asi_m[4]
    &asi_m[3]&asi_m[0]&!lsu_va_m[11]) | (!asi_m[4]&asi_m[3]&!asi_m[2]
    &!asi_m[0]);


supply0 vss;
supply1 vdd;
endmodule

