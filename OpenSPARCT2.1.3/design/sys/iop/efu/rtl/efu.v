// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: efu.v
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
module efu (
  io_vpp, 
  ccu_io_out, 
  gclk, 
  tcu_atpg_mode, 
  tcu_array_wr_inhibit, 
  cluster_arst_l, 
  scan_in, 
  tcu_scan_en, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_efu_clk_stop, 
  rst_wmr_, 
  rst_por_, 
  rst_wmr_protect, 
  io_cmp_clk_sync_en, 
  cmp_io_clk_sync_en, 
  scan_out, 
  tcu_efu_rowaddr, 
  tcu_efu_coladdr, 
  io_pgrm_en, 
  tcu_efu_read_en, 
  tcu_efu_read_mode, 
  tcu_efu_read_start, 
  tcu_efu_fuse_bypass, 
  tcu_efu_dest_sample, 
  tcu_red_reg_clr, 
  tcu_div_bypass, 
  tcu_dbr_gateoff, 
  tcu_efu_data_in, 
  efu_tcu_data_out, 
  tcu_efu_updatedr, 
  tcu_efu_shiftdr, 
  tcu_efu_capturedr, 
  tck, 
  efu_spc1357_fuse_data, 
  efu_spc0246_fuse_data, 
  efu_spc0_fuse_ixfer_en, 
  efu_spc1_fuse_ixfer_en, 
  efu_spc2_fuse_ixfer_en, 
  efu_spc3_fuse_ixfer_en, 
  efu_spc4_fuse_ixfer_en, 
  efu_spc5_fuse_ixfer_en, 
  efu_spc6_fuse_ixfer_en, 
  efu_spc7_fuse_ixfer_en, 
  efu_spc0_fuse_iclr, 
  efu_spc1_fuse_iclr, 
  efu_spc2_fuse_iclr, 
  efu_spc3_fuse_iclr, 
  efu_spc4_fuse_iclr, 
  efu_spc5_fuse_iclr, 
  efu_spc6_fuse_iclr, 
  efu_spc7_fuse_iclr, 
  efu_spc0_fuse_dxfer_en, 
  efu_spc1_fuse_dxfer_en, 
  efu_spc2_fuse_dxfer_en, 
  efu_spc3_fuse_dxfer_en, 
  efu_spc4_fuse_dxfer_en, 
  efu_spc5_fuse_dxfer_en, 
  efu_spc6_fuse_dxfer_en, 
  efu_spc7_fuse_dxfer_en, 
  efu_spc0_fuse_dclr, 
  efu_spc1_fuse_dclr, 
  efu_spc2_fuse_dclr, 
  efu_spc3_fuse_dclr, 
  efu_spc4_fuse_dclr, 
  efu_spc5_fuse_dclr, 
  efu_spc6_fuse_dclr, 
  efu_spc7_fuse_dclr, 
  spc0_efu_fuse_dxfer_en, 
  spc1_efu_fuse_dxfer_en, 
  spc2_efu_fuse_dxfer_en, 
  spc3_efu_fuse_dxfer_en, 
  spc4_efu_fuse_dxfer_en, 
  spc5_efu_fuse_dxfer_en, 
  spc6_efu_fuse_dxfer_en, 
  spc7_efu_fuse_dxfer_en, 
  spc0_efu_fuse_ixfer_en, 
  spc1_efu_fuse_ixfer_en, 
  spc2_efu_fuse_ixfer_en, 
  spc3_efu_fuse_ixfer_en, 
  spc4_efu_fuse_ixfer_en, 
  spc5_efu_fuse_ixfer_en, 
  spc6_efu_fuse_ixfer_en, 
  spc7_efu_fuse_ixfer_en, 
  spc0_efu_fuse_ddata, 
  spc1_efu_fuse_ddata, 
  spc2_efu_fuse_ddata, 
  spc3_efu_fuse_ddata, 
  spc4_efu_fuse_ddata, 
  spc5_efu_fuse_ddata, 
  spc6_efu_fuse_ddata, 
  spc7_efu_fuse_ddata, 
  spc0_efu_fuse_idata, 
  spc1_efu_fuse_idata, 
  spc2_efu_fuse_idata, 
  spc3_efu_fuse_idata, 
  spc4_efu_fuse_idata, 
  spc5_efu_fuse_idata, 
  spc6_efu_fuse_idata, 
  spc7_efu_fuse_idata, 
  efu_l2t0246_fuse_data, 
  efu_l2t1357_fuse_data, 
  efu_l2t0_fuse_xfer_en, 
  efu_l2t1_fuse_xfer_en, 
  efu_l2t2_fuse_xfer_en, 
  efu_l2t3_fuse_xfer_en, 
  efu_l2t4_fuse_xfer_en, 
  efu_l2t5_fuse_xfer_en, 
  efu_l2t6_fuse_xfer_en, 
  efu_l2t7_fuse_xfer_en, 
  efu_l2t0_fuse_clr, 
  efu_l2t1_fuse_clr, 
  efu_l2t2_fuse_clr, 
  efu_l2t3_fuse_clr, 
  efu_l2t4_fuse_clr, 
  efu_l2t5_fuse_clr, 
  efu_l2t6_fuse_clr, 
  efu_l2t7_fuse_clr, 
  l2t0_efu_fuse_xfer_en, 
  l2t1_efu_fuse_xfer_en, 
  l2t2_efu_fuse_xfer_en, 
  l2t3_efu_fuse_xfer_en, 
  l2t4_efu_fuse_xfer_en, 
  l2t5_efu_fuse_xfer_en, 
  l2t6_efu_fuse_xfer_en, 
  l2t7_efu_fuse_xfer_en, 
  l2t0_efu_fuse_data, 
  l2t1_efu_fuse_data, 
  l2t2_efu_fuse_data, 
  l2t3_efu_fuse_data, 
  l2t4_efu_fuse_data, 
  l2t5_efu_fuse_data, 
  l2t6_efu_fuse_data, 
  l2t7_efu_fuse_data, 
  efu_l2b0246_fuse_data, 
  efu_l2b1357_fuse_data, 
  efu_l2b0_fuse_xfer_en, 
  efu_l2b1_fuse_xfer_en, 
  efu_l2b2_fuse_xfer_en, 
  efu_l2b3_fuse_xfer_en, 
  efu_l2b4_fuse_xfer_en, 
  efu_l2b5_fuse_xfer_en, 
  efu_l2b6_fuse_xfer_en, 
  efu_l2b7_fuse_xfer_en, 
  efu_l2b0_fuse_clr, 
  efu_l2b1_fuse_clr, 
  efu_l2b2_fuse_clr, 
  efu_l2b3_fuse_clr, 
  efu_l2b4_fuse_clr, 
  efu_l2b5_fuse_clr, 
  efu_l2b6_fuse_clr, 
  efu_l2b7_fuse_clr, 
  l2b0_efu_fuse_xfer_en, 
  l2b1_efu_fuse_xfer_en, 
  l2b2_efu_fuse_xfer_en, 
  l2b3_efu_fuse_xfer_en, 
  l2b4_efu_fuse_xfer_en, 
  l2b5_efu_fuse_xfer_en, 
  l2b6_efu_fuse_xfer_en, 
  l2b7_efu_fuse_xfer_en, 
  l2b0_efu_fuse_data, 
  l2b1_efu_fuse_data, 
  l2b2_efu_fuse_data, 
  l2b3_efu_fuse_data, 
  l2b4_efu_fuse_data, 
  l2b5_efu_fuse_data, 
  l2b6_efu_fuse_data, 
  l2b7_efu_fuse_data, 
  efu_ncu_fuse_data, 
  efu_ncu_srlnum0_xfer_en, 
  efu_ncu_srlnum1_xfer_en, 
  efu_ncu_srlnum2_xfer_en, 
  efu_ncu_fusestat_xfer_en, 
  efu_ncu_coreavl_xfer_en, 
  efu_ncu_bankavl_xfer_en, 
  efu_niu_mac01_sfro_data, 
  efu_niu_mac1_sf_xfer_en, 
  efu_niu_mac1_ro_xfer_en, 
  efu_niu_mac0_sf_xfer_en, 
  efu_niu_mac0_ro_xfer_en, 
  efu_niu_ipp1_xfer_en, 
  efu_niu_ipp0_xfer_en, 
  efu_niu_mac1_sf_clr, 
  efu_niu_mac1_ro_clr, 
  efu_niu_mac0_sf_clr, 
  efu_niu_mac0_ro_clr, 
  efu_niu_ipp1_clr, 
  efu_niu_ipp0_clr, 
  niu_efu_mac1_sf_data, 
  niu_efu_mac1_ro_data, 
  niu_efu_mac0_sf_data, 
  niu_efu_mac0_ro_data, 
  niu_efu_ipp1_data, 
  niu_efu_ipp0_data, 
  niu_efu_mac1_sf_xfer_en, 
  niu_efu_mac1_ro_xfer_en, 
  niu_efu_mac0_sf_xfer_en, 
  niu_efu_mac0_ro_xfer_en, 
  niu_efu_ipp1_xfer_en, 
  niu_efu_ipp0_xfer_en, 
  efu_niu_cfifo_data, 
  efu_niu_cfifo0_xfer_en, 
  efu_niu_cfifo1_xfer_en, 
  efu_niu_cfifo0_clr, 
  efu_niu_cfifo1_clr, 
  niu_efu_cfifo0_data, 
  niu_efu_cfifo1_data, 
  niu_efu_cfifo0_xfer_en, 
  niu_efu_cfifo1_xfer_en, 
  efu_niu_ram_data, 
  efu_niu_ram_xfer_en, 
  efu_niu_ram0_xfer_en, 
  efu_niu_ram1_xfer_en, 
  efu_niu_ram_clr, 
  efu_niu_ram0_clr, 
  efu_niu_ram1_clr, 
  niu_efu_ram_xfer_en, 
  niu_efu_ram0_xfer_en, 
  niu_efu_ram1_xfer_en, 
  niu_efu_ram_data, 
  niu_efu_ram0_data, 
  niu_efu_ram1_data, 
  efu_niu_4k_data, 
  efu_niu_4k_xfer_en, 
  efu_niu_4k_clr, 
  niu_efu_4k_xfer_en, 
  niu_efu_4k_data, 
  efu_dmu_data, 
  efu_dmu_xfer_en, 
  efu_dmu_clr, 
  dmu_efu_xfer_en, 
  dmu_efu_data, 
  efu_mcu_fdi, 
  mcu_efu_fdo, 
  efu_mcu_fclk, 
  efu_mcu_fclrz, 
  efu_psr_fdi, 
  psr_efu_fdo, 
  efu_psr_fclk, 
  efu_psr_fclrz, 
  efu_niu_fdi, 
  niu_efu_fdo, 
  efu_niu_fclk, 
  efu_niu_fclrz);
wire l2clk;
wire l2t_clk_header_scanout;
wire cmp_io_sync_en;
wire io_cmp_sync_en;
wire l2t_clk_header_scanin;
wire iol2clk;
wire io_aclk;
wire io_bclk;
wire efu_ioclk_header_scanout;
wire io_ce_ovrd;
wire io_wmr_l;
wire io_por_l;
wire efu_ioclk_header_scanin;
wire por_n;
wire read_data_ff_vld;
wire u_efa_stdc_scanin;
wire u_efa_stdc_scanout;
wire update_dr_jbus;
wire local_read_en;
wire local_fuse_bypass;
wire local_dest_sample;
wire [31:0] niu_read_data_shift;
wire niu_interface_scanin;
wire niu_interface_scanout;
wire core_l2tandl2d_scanin;
wire core_l2tandl2d_scanout;
wire wmr_protect;
wire wmr_;
wire por_;
wire [31:0] shift_data_ff_out;
wire load_l2_read_data;
wire cmp_mrd_cnt_done;
wire decode_enable_vld;
wire load_niu_read_data;


//----
// Chip Primary Inputs/Globals
input           io_vpp;                 // Programming Voltage
//input		vddo;			// 1.5V I/O voltage supply for 
					//  pgrm_en receiver
//input		iol2clk;		// io clock
input		ccu_io_out;		// phase signal from ccu (div/4 or div/2)
input		gclk;			// l2 clock
input		tcu_atpg_mode;
input		tcu_array_wr_inhibit;
input 		cluster_arst_l;

//input           global_shift_enable;    // Scan shift enable signal.
input           scan_in;         // Scan chain input.
input           tcu_scan_en;         // Scan chain input.
input           tcu_aclk;         // Scan chain input.
input           tcu_bclk;         // Scan chain input.
input           tcu_pce_ov;         // Scan chain input.
input           tcu_clk_stop;         // IOCLK_clk_stop
input           tcu_efu_clk_stop;     // CMP_clk_stop
input		rst_wmr_;
input		rst_por_;
input		rst_wmr_protect;
input		io_cmp_clk_sync_en;
input		cmp_io_clk_sync_en;
output          scan_out;        // Scan chain output.

// CTU/JTAG R/W Interface

input [6:0]     tcu_efu_rowaddr;        // Efuse row addr for read/write
input [4:0]     tcu_efu_coladdr;        // efuse col addr for write
input           io_pgrm_en;             // From pad_misc of pad_misc.v
input           tcu_efu_read_en;        // Read Enable
input [2:0]     tcu_efu_read_mode;      // 00=normal, 01=margin0, 10=1A, 11=1B
input           tcu_efu_read_start;     // Start SM for scanning bits out
input           tcu_efu_fuse_bypass;    // shift data from 
input           tcu_efu_dest_sample;	// sample data from dest reg
input [6:0]     tcu_red_reg_clr;	// Redudancy register clear
input           tcu_div_bypass;	

// CTU/JTAG Shift Interface
input		tcu_dbr_gateoff;
input           tcu_efu_data_in;        // Serial(scan) in from tcu
output          efu_tcu_data_out;       // Serial(scan) out to tcu
input           tcu_efu_updatedr;       // read reg updated from shift reg
input           tcu_efu_shiftdr;        // shift data register
input           tcu_efu_capturedr;      // shift data reg captures read reg val
input           tck;                    // Shift dr data in/out from tcu

// Destination Register Interface
// Interface with Sparc cores 0 to 7
output 		efu_spc1357_fuse_data;
output 		efu_spc0246_fuse_data;
output 		efu_spc0_fuse_ixfer_en;
output 		efu_spc1_fuse_ixfer_en;
output 		efu_spc2_fuse_ixfer_en;
output 		efu_spc3_fuse_ixfer_en;
output 		efu_spc4_fuse_ixfer_en;
output 		efu_spc5_fuse_ixfer_en;
output 		efu_spc6_fuse_ixfer_en;
output 		efu_spc7_fuse_ixfer_en;
output 		efu_spc0_fuse_iclr;
output 		efu_spc1_fuse_iclr;
output 		efu_spc2_fuse_iclr;
output 		efu_spc3_fuse_iclr;
output 		efu_spc4_fuse_iclr;
output 		efu_spc5_fuse_iclr;
output 		efu_spc6_fuse_iclr;
output 		efu_spc7_fuse_iclr;
output 		efu_spc0_fuse_dxfer_en;
output 		efu_spc1_fuse_dxfer_en;
output 		efu_spc2_fuse_dxfer_en;
output 		efu_spc3_fuse_dxfer_en;
output 		efu_spc4_fuse_dxfer_en;
output 		efu_spc5_fuse_dxfer_en;
output 		efu_spc6_fuse_dxfer_en;
output 		efu_spc7_fuse_dxfer_en;
output 		efu_spc0_fuse_dclr;
output 		efu_spc1_fuse_dclr;
output 		efu_spc2_fuse_dclr;
output 		efu_spc3_fuse_dclr;
output 		efu_spc4_fuse_dclr;
output 		efu_spc5_fuse_dclr;
output 		efu_spc6_fuse_dclr;
output 		efu_spc7_fuse_dclr;
input  		spc0_efu_fuse_dxfer_en;
input  		spc1_efu_fuse_dxfer_en;
input  		spc2_efu_fuse_dxfer_en;
input  		spc3_efu_fuse_dxfer_en;
input  		spc4_efu_fuse_dxfer_en;
input  		spc5_efu_fuse_dxfer_en;
input  		spc6_efu_fuse_dxfer_en;
input  		spc7_efu_fuse_dxfer_en;
input  		spc0_efu_fuse_ixfer_en;
input  		spc1_efu_fuse_ixfer_en;
input  		spc2_efu_fuse_ixfer_en;
input  		spc3_efu_fuse_ixfer_en;
input  		spc4_efu_fuse_ixfer_en;
input  		spc5_efu_fuse_ixfer_en;
input  		spc6_efu_fuse_ixfer_en;
input  		spc7_efu_fuse_ixfer_en;
input  		spc0_efu_fuse_ddata;
input  		spc1_efu_fuse_ddata;
input  		spc2_efu_fuse_ddata;
input  		spc3_efu_fuse_ddata;
input  		spc4_efu_fuse_ddata;
input  		spc5_efu_fuse_ddata;
input  		spc6_efu_fuse_ddata;
input  		spc7_efu_fuse_ddata;
input  		spc0_efu_fuse_idata;
input  		spc1_efu_fuse_idata;
input  		spc2_efu_fuse_idata;
input  		spc3_efu_fuse_idata;
input  		spc4_efu_fuse_idata;
input  		spc5_efu_fuse_idata;
input  		spc6_efu_fuse_idata;
input  		spc7_efu_fuse_idata;
        	
// Interface with L2t for tag array repair 
output 		efu_l2t0246_fuse_data;
output 		efu_l2t1357_fuse_data;
output 		efu_l2t0_fuse_xfer_en;
output 		efu_l2t1_fuse_xfer_en;
output 		efu_l2t2_fuse_xfer_en;
output 		efu_l2t3_fuse_xfer_en;
output 		efu_l2t4_fuse_xfer_en;
output 		efu_l2t5_fuse_xfer_en;
output 		efu_l2t6_fuse_xfer_en;
output 		efu_l2t7_fuse_xfer_en;
output 		efu_l2t0_fuse_clr;
output 		efu_l2t1_fuse_clr;
output 		efu_l2t2_fuse_clr;
output 		efu_l2t3_fuse_clr;
output 		efu_l2t4_fuse_clr;
output 		efu_l2t5_fuse_clr;
output 		efu_l2t6_fuse_clr;
output 		efu_l2t7_fuse_clr;
input 		l2t0_efu_fuse_xfer_en;
input 		l2t1_efu_fuse_xfer_en;
input 		l2t2_efu_fuse_xfer_en;
input 		l2t3_efu_fuse_xfer_en;
input 		l2t4_efu_fuse_xfer_en;
input 		l2t5_efu_fuse_xfer_en;
input 		l2t6_efu_fuse_xfer_en;
input 		l2t7_efu_fuse_xfer_en;
input 		l2t0_efu_fuse_data;
input 		l2t1_efu_fuse_data;
input 		l2t2_efu_fuse_data;
input 		l2t3_efu_fuse_data;
input 		l2t4_efu_fuse_data;
input 		l2t5_efu_fuse_data;
input 		l2t6_efu_fuse_data;
input 		l2t7_efu_fuse_data;
        		
// Interface with l2b for data array repair 
output 		efu_l2b0246_fuse_data;
output 		efu_l2b1357_fuse_data;
output 		efu_l2b0_fuse_xfer_en;
output 		efu_l2b1_fuse_xfer_en;
output 		efu_l2b2_fuse_xfer_en;
output 		efu_l2b3_fuse_xfer_en;
output 		efu_l2b4_fuse_xfer_en;
output 		efu_l2b5_fuse_xfer_en;
output 		efu_l2b6_fuse_xfer_en;
output 		efu_l2b7_fuse_xfer_en;
output 		efu_l2b0_fuse_clr;
output 		efu_l2b1_fuse_clr;
output 		efu_l2b2_fuse_clr;
output 		efu_l2b3_fuse_clr;
output 		efu_l2b4_fuse_clr;
output 		efu_l2b5_fuse_clr;
output 		efu_l2b6_fuse_clr;
output 		efu_l2b7_fuse_clr;
input  		l2b0_efu_fuse_xfer_en;
input  		l2b1_efu_fuse_xfer_en;
input  		l2b2_efu_fuse_xfer_en;
input  		l2b3_efu_fuse_xfer_en;
input  		l2b4_efu_fuse_xfer_en;
input  		l2b5_efu_fuse_xfer_en;
input  		l2b6_efu_fuse_xfer_en;
input  		l2b7_efu_fuse_xfer_en;
input  		l2b0_efu_fuse_data;
input  		l2b1_efu_fuse_data;
input  		l2b2_efu_fuse_data;
input  		l2b3_efu_fuse_data;
input  		l2b4_efu_fuse_data;
input  		l2b5_efu_fuse_data;
input  		l2b6_efu_fuse_data;
input  		l2b7_efu_fuse_data;


// Interface with NCU for data array repair 
output 		efu_ncu_fuse_data;
output 		efu_ncu_srlnum0_xfer_en;
output 		efu_ncu_srlnum1_xfer_en;
output 		efu_ncu_srlnum2_xfer_en;
output 		efu_ncu_fusestat_xfer_en;
output 		efu_ncu_coreavl_xfer_en;
output 		efu_ncu_bankavl_xfer_en;
        	
// Interface to NIU
output  efu_niu_mac01_sfro_data;
output  efu_niu_mac1_sf_xfer_en;
output  efu_niu_mac1_ro_xfer_en;
output  efu_niu_mac0_sf_xfer_en;
output  efu_niu_mac0_ro_xfer_en;
output  efu_niu_ipp1_xfer_en;
output  efu_niu_ipp0_xfer_en;
output  efu_niu_mac1_sf_clr;
output  efu_niu_mac1_ro_clr;
output  efu_niu_mac0_sf_clr;
output  efu_niu_mac0_ro_clr;
output  efu_niu_ipp1_clr;
output  efu_niu_ipp0_clr;
input   niu_efu_mac1_sf_data;
input   niu_efu_mac1_ro_data;
input   niu_efu_mac0_sf_data;
input   niu_efu_mac0_ro_data;
input   niu_efu_ipp1_data;
input   niu_efu_ipp0_data;
input   niu_efu_mac1_sf_xfer_en;
input   niu_efu_mac1_ro_xfer_en;
input   niu_efu_mac0_sf_xfer_en;
input   niu_efu_mac0_ro_xfer_en;
input   niu_efu_ipp1_xfer_en;
input   niu_efu_ipp0_xfer_en;
        
output  efu_niu_cfifo_data;
output  efu_niu_cfifo0_xfer_en;
output  efu_niu_cfifo1_xfer_en;
output  efu_niu_cfifo0_clr;
output  efu_niu_cfifo1_clr;
input   niu_efu_cfifo0_data;
input   niu_efu_cfifo1_data;
input   niu_efu_cfifo0_xfer_en;
input   niu_efu_cfifo1_xfer_en;
        
output  efu_niu_ram_data;
output  efu_niu_ram_xfer_en;
output  efu_niu_ram0_xfer_en;
output  efu_niu_ram1_xfer_en;
output  efu_niu_ram_clr;
output  efu_niu_ram0_clr;
output  efu_niu_ram1_clr;
input   niu_efu_ram_xfer_en;
input   niu_efu_ram0_xfer_en;
input   niu_efu_ram1_xfer_en;
input   niu_efu_ram_data;
input   niu_efu_ram0_data;
input   niu_efu_ram1_data;
        
output  efu_niu_4k_data;
output  efu_niu_4k_xfer_en;
output  efu_niu_4k_clr;
input   niu_efu_4k_xfer_en;
input   niu_efu_4k_data;
		
output	efu_dmu_data;
output	efu_dmu_xfer_en;
output	efu_dmu_clr;

input	dmu_efu_xfer_en;
input	dmu_efu_data;


output		efu_mcu_fdi;
input		mcu_efu_fdo;
output		efu_mcu_fclk;
output		efu_mcu_fclrz;
		
output		efu_psr_fdi;
input		psr_efu_fdo;
output		efu_psr_fclk;
output		efu_psr_fclrz;
		
output		efu_niu_fdi;
input		niu_efu_fdo;
output		efu_niu_fclk;
output		efu_niu_fclrz;
		

//-----------------------------------------------------------------------------
// Wire declarations
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
  wire [31:0]		efa_sbc_data;		// From u_efa of bw_r_efa.v
  wire			por_l;			// From u_efa_stdc of efu_stdc.v
  wire			pwr_ok;			// From u_efa_stdc of efu_stdc.v
  wire [4:0]		sbc_efa_bit_addr;	// From u_efa_stdc of efu_stdc.v
  wire			sbc_efa_margin0_rd;	// From u_efa_stdc of efu_stdc.v
  wire			sbc_efa_margin1_rd;	// From u_efa_stdc of efu_stdc.v
  wire			sbc_efa_power_down;	// From u_efa_stdc of efu_stdc.v
  wire			sbc_efa_read_en;	// From u_efa_stdc of efu_stdc.v
  wire			sbc_efa_sup_det_rd;	// From u_efa_stdc of efu_stdc.v
  wire [5:0]		sbc_efa_word_addr;	// From u_efa_stdc of efu_stdc.v
  wire			testmode_l;		// From test_stub_scan of test_stub_scan.v

// commented out the following two wire
// declarations, since they are already declared as inputs.
//wire                  io_pgrm_en;             // From pad_misc of pad_misc.v

  wire	[31:0]		read_data_ff;
  wire	[31:0]		efa_out_data;
  wire	[31:0]		tck_shft_data_ff;
  wire	[6:0]		snc1_rowaddr;
  wire	[6:0]		addr_cnt_ff;
  wire			local_efu_read_start;

// commented out the following wire
// declaration, since it is already declared as an input.
//wire                  iol2clk;

////////////////////////////////////////////////////////////////////
// Sub-module instantiation
////////////////////////////////////////////////////////////////////


// no  l2clk now
//clkgen_efu_cmp l2t_clk_header(
//	.scan_in(l2t_clk_header_scanin),
//	.scan_out(l2t_clk_header_scanout),
//	.l2clk( l2clk ),
//	.aclk( aclk ),
//	.bclk( bclk ),
//	.pce_ov ( ce_ovrd ),
//	.aclk_wmr (  ),
//	.wmr_protect ( wmr_protect ),
//	.wmr_ ( wmr_l ),
//	.por_ ( por_l ),
//	.cmp_slow_sync_en (  ),
//	.slow_cmp_sync_en ( slow_cmp_sync_en ),
//	.tcu_clk_stop ( tcu_efu_clk_stop ),
//	.tcu_pce_ov ( tcu_pce_ov ),
//	.rst_wmr_protect ( rst_wmr_protect ),
//	.rst_wmr_ ( rst_wmr_ ),
//	.rst_por_ ( rst_por_ ),
//	.ccu_cmp_slow_sync_en ( cmp_io_clk_sync_en ),
//	.ccu_slow_cmp_sync_en ( io_cmp_clk_sync_en ),
//	.tcu_div_bypass ( tcu_div_bypass ),
//	.ccu_div_ph ( 1'b1 ),
//	.cluster_div_en ( 1'b0 ),
//	.gclk ( gclk ),
//	.cluster_arst_l ( 1'b0 ),
//	.clk_ext ( 1'b0 ),
//	.ccu_serdes_dtm ( 1'b0 ),
//	.tcu_aclk ( tcu_aclk ),
//	.tcu_bclk ( tcu_bclk ),
//	.scan_en ( tcu_scan_en ),
//);


//clkgen_efu_cmp l2t_clk_header 
//       ( 
//        .l2clk                  (l2clk                  ),
//        .aclk                   (aclk                   ),
//        .bclk                   (bclk                   ),
//        .so                     (                       ),
//        .clk_stop               (clk_stop               ),
//        .pce_ov                 (ce_ovrd                ),
//        .wmr_protect            (wmr_protect            ),
//        .wmr_                   (wmr_l                  ),
//        .por_                   (por_l                  ),
//        .cmp_slow_sync_en       (                       ),
//        .slow_cmp_sync_en       (slow_cmp_sync_en       ),
//        .tcu_clk_stop           (tcu_clk_stop           ),
//        .tcu_pce_ov             (tcu_pce_ov             ),
//        .rst_wmr_protect        (rst_wmr_protect        ),
//        .rst_wmr_               (rst_wmr_               ),
//        .rst_por_               (rst_por_               ),
//        .ccu_cmp_slow_sync_en   (cmp_io_clk_sync_en     ),
//        .ccu_slow_cmp_sync_en   (io_cmp_clk_sync_en     ),
//        .tcu_div_bypass         (1'b0                   ),
//        .ccu_div_ph             (1'b1                   ),
//        .cluster_div_en         (1'b0                   ),
//        .gclk                   (gclk                   ),
//        .clk_ext                (1'b0                   ),
//        .tcu_aclk               (tcu_aclk               ),
//        .tcu_bclk               (tcu_bclk               ),
//        .se                     (tcu_scan_en            ),
//        .si                     (1'b0                   )
clkgen_efu_cmp l2t_clk_header (
  // output
	.l2clk(l2clk),
	.aclk(),
	.bclk(),
	.scan_out(l2t_clk_header_scanout),
	.pce_ov(),
	.aclk_wmr(),
	.cmp_slow_sync_en(cmp_io_sync_en),
	.slow_cmp_sync_en(io_cmp_sync_en),
	.array_wr_inhibit(),
  // inputs
	.tcu_wr_inhibit(tcu_array_wr_inhibit),
	.tcu_atpg_mode(tcu_atpg_mode),
	.tcu_clk_stop(tcu_efu_clk_stop),
	.tcu_pce_ov(tcu_pce_ov),
	.rst_wmr_protect(rst_wmr_protect),
	.rst_wmr_(rst_wmr_),
	.rst_por_(rst_por_),
	.ccu_cmp_slow_sync_en(cmp_io_clk_sync_en),
	.ccu_slow_cmp_sync_en(io_cmp_clk_sync_en),
	.tcu_div_bypass(tcu_div_bypass),
	.ccu_div_ph(1'b1),
	.cluster_div_en(1'b0),
	.gclk(gclk),
	.cluster_arst_l(cluster_arst_l),
	.clk_ext(1'b0),
	.ccu_serdes_dtm(1'b0),
	.tcu_aclk(tcu_aclk),
	.tcu_bclk(tcu_bclk),
	.scan_en(tcu_scan_en),
	.scan_in(l2t_clk_header_scanin),
  .wmr_protect(wmr_protect),
  .wmr_(wmr_),
  .por_(por_)
);


clkgen_efu_io efu_ioclk_header(
//output
	.l2clk (iol2clk),
	.aclk (io_aclk),
	.bclk (io_bclk),
	.scan_out (efu_ioclk_header_scanout),
	.aclk_wmr ( ),
	.pce_ov (io_ce_ovrd),
	.wmr_protect (),
	.wmr_ (io_wmr_l),
	.por_ (io_por_l),
	.cmp_slow_sync_en ( ),
	.slow_cmp_sync_en ( ),
	.array_wr_inhibit (),
//input
	.tcu_atpg_mode (tcu_atpg_mode),
	.tcu_wr_inhibit (tcu_array_wr_inhibit),
	.tcu_clk_stop (tcu_clk_stop),
	.tcu_pce_ov (tcu_pce_ov),
	.rst_wmr_protect (rst_wmr_protect),
	.rst_wmr_ (rst_wmr_),
	.rst_por_ (rst_por_),
	.ccu_cmp_slow_sync_en (1'b0),
	.ccu_slow_cmp_sync_en (1'b0),
	.tcu_div_bypass (tcu_div_bypass),
	.ccu_div_ph (ccu_io_out),
	.cluster_div_en (1'b1),
	.gclk (gclk),
	.cluster_arst_l (cluster_arst_l),
	.ccu_serdes_dtm (1'b0),
	.clk_ext (1'b0),
	.scan_en (tcu_scan_en),
	.scan_in (efu_ioclk_header_scanin),
	.tcu_aclk (tcu_aclk),
	.tcu_bclk (tcu_bclk)
);


////clkgen_efu_io efu_ioclk_header(
////	.scan_in(efu_ioclk_header_scanin),
////	.scan_out(efu_ioclk_header_scanout),
////	.l2clk( iol2clk ),
////	.aclk( io_aclk ),
////	.bclk( io_bclk ),
////	.pce_ov( io_ce_ovrd ),
////	.aclk_wmr(  ),
////	.wmr_protect( io_wmr_protect ),
////	.wmr_( io_wmr_l ),
////	.por_( io_por_l ),
////	.cmp_slow_sync_en(  ),
////	.slow_cmp_sync_en(  ),
////	.tcu_clk_stop( tcu_clk_stop ),
////	.tcu_pce_ov( tcu_pce_ov ),
////	.rst_wmr_protect( rst_wmr_protect ),
////	.rst_wmr_( rst_wmr_ ),
////	.rst_por_( rst_por_ ),
////	.ccu_cmp_slow_sync_en( 1'b0  ),
////	.ccu_slow_cmp_sync_en( 1'b0  ),
////	.tcu_div_bypass( tcu_div_bypass  ),
////	.ccu_div_ph( ccu_io_out ),
////	.cluster_div_en( 1'b1 ),
////	.gclk( gclk ),
////	.cluster_arst_l( 1'b0 ),
////	.clk_ext( 1'b0 ),
////	.ccu_serdes_dtm( 1'b0 ), 
////	.tcu_aclk( tcu_aclk ),
////	.tcu_bclk( tcu_bclk ),
////	.scan_en( tcu_scan_en ),
////);


//clkgen_efu_io efu_ioclk_header 
//	( 
//        .l2clk                  (iol2clk                ),
//        .aclk                   (io_aclk                ),
//        .bclk                   (io_bclk                ),
//        .so                     (                       ),
//        .clk_stop               (io_clk_stop            ),
//        .pce_ov                 (io_ce_ovrd             ),
//        .wmr_protect            (io_wmr_protect         ),
//        .wmr_                   (io_wmr_l               ),
//        .por_                   (io_por_l               ),
//        .cmp_slow_sync_en       (                       ),
//        .slow_cmp_sync_en       (                       ),
//        .tcu_clk_stop           (tcu_clk_stop           ),
//        .tcu_pce_ov             (tcu_pce_ov             ),
//        .rst_wmr_protect        (rst_wmr_protect        ),
//        .rst_wmr_               (rst_wmr_               ),
//        .rst_por_               (rst_por_               ),
//        .ccu_cmp_slow_sync_en   (1'b0                   ),
//        .ccu_slow_cmp_sync_en   (1'b0                   ),
//        .tcu_div_bypass         (1'b0                   ),
//        .ccu_div_ph             (ccu_io_out             ),
//        .cluster_div_en         (1'b1                   ),
//        .gclk                   (gclk                   ),
//        .clk_ext                (1'b0                   ),
//        .tcu_aclk               (tcu_aclk               ),
//        .tcu_bclk               (tcu_bclk               ),
//        .se                     (tcu_scan_en            ),
//        .si                     (1'b0                   )
//	);

n2_esd_vpp_cust u_esd0(.supply_node (io_vpp) );
n2_esd_vpp_cust u_esd1(.supply_node (io_vpp) );
n2_esd_vpp_cust u_esd2(.supply_node (io_vpp) );
n2_esd_vpp_cust u_esd3(.supply_node (io_vpp) );
n2_esd_vpp_cust u_esd4(.supply_node (io_vpp) );

    


n2_efa_sp_256b_cust u_efa(
       // Outputs
       .efa_sbc_data		(efa_sbc_data[31:0]),
       // Inputs
       .vpp			(io_vpp),		 
       .pi_efa_prog_en		(io_pgrm_en),		 
       .sbc_efa_read_en		(sbc_efa_read_en),
       .sbc_efa_word_addr	(sbc_efa_word_addr[5:0]),
       .sbc_efa_bit_addr	(sbc_efa_bit_addr[4:0]),
       .sbc_efa_margin0_rd	(sbc_efa_margin0_rd),
       .sbc_efa_margin1_rd	(sbc_efa_margin1_rd),
       .pwr_ok			(pwr_ok),
       .por_n			(por_n),
       .sbc_efa_sup_det_rd	(sbc_efa_sup_det_rd),
       .sbc_efa_power_down	(sbc_efa_power_down),
       .clk			(iol2clk));		 

efu_fct_ctl u_efa_stdc(
		// Outputs
	.efu_ncu_fuse_data		(efu_ncu_fuse_data),
	.efu_ncu_srlnum0_xfer_en		(efu_ncu_srlnum0_xfer_en),
	.efu_ncu_srlnum1_xfer_en		(efu_ncu_srlnum1_xfer_en),
	.efu_ncu_srlnum2_xfer_en		(efu_ncu_srlnum2_xfer_en),
	.efu_ncu_fusestat_xfer_en		(efu_ncu_fusestat_xfer_en),
	.efu_ncu_coreavl_xfer_en		(efu_ncu_coreavl_xfer_en),
	.efu_ncu_bankavl_xfer_en		(efu_ncu_bankavl_xfer_en),
//	.mrd_state_rd_array         	(mrd_state_rd_array),
//	.efa_array_power_down_ff	(efa_array_power_down_ff),
	.pwr_ok				(pwr_ok),
	.por_n				(por_n),
//	.addr_cnt_ff			(addr_cnt_ff[6:0]),
	.read_data_ff_vld		(read_data_ff_vld),
	// Inputs
	.scan_in(u_efa_stdc_scanin),
	.scan_out(u_efa_stdc_scanout),
	.iol2clk			(iol2clk),		 
        .l2clk				(l2clk),
        .cmp_io_sync_en			(cmp_io_sync_en),
	.jbus_arst_l			(io_wmr_l),
        .por_l				(io_por_l),
	.sync1_rowaddress		(snc1_rowaddr[6:0]),
//	.inhibit_power_down_l		(inhibit_power_down_l),
//	.read_data_ff			(read_data_ff[31:0]),
//	.tck_shft_data_ff        	(tck_shft_data_ff[31:0]),
//	.efa_out_data			(efa_out_data[31:0]),
	.update_dr_jbus			(update_dr_jbus),
	.local_read_en			(local_read_en),
	.local_efu_read_start		(local_efu_read_start),
	.local_fuse_bypass		(local_fuse_bypass),
	.local_dest_sample		(local_dest_sample),
	.tcu_pce_ov 			(io_ce_ovrd),
	.tcu_aclk 			(io_aclk),
	.tcu_bclk 			(io_bclk),
	.tcu_scan_en			(tcu_scan_en),
  .tcu_efu_updatedr(tcu_efu_updatedr),
  .tcu_efu_read_en(tcu_efu_read_en),
  .tcu_efu_read_start(tcu_efu_read_start),
  .tcu_efu_fuse_bypass(tcu_efu_fuse_bypass),
  .tcu_efu_dest_sample(tcu_efu_dest_sample),
  .tcu_efu_coladdr(tcu_efu_coladdr[4:0]),
  .tcu_efu_read_mode(tcu_efu_read_mode[2:0]),
  .tcu_efu_rowaddr(tcu_efu_rowaddr[6:0]),
  .tcu_efu_capturedr(tcu_efu_capturedr),
  .tcu_efu_data_in(tcu_efu_data_in),
  .tcu_efu_shiftdr(tcu_efu_shiftdr),
  .efa_sbc_data(efa_sbc_data[31:0]),
  .tck(tck),
  .sbc_efa_power_down(sbc_efa_power_down),
  .efu_tcu_data_out(efu_tcu_data_out),
  .sbc_efa_bit_addr(sbc_efa_bit_addr[4:0]),
  .sbc_efa_sup_det_rd(sbc_efa_sup_det_rd),
  .sbc_efa_margin0_rd(sbc_efa_margin0_rd),
  .sbc_efa_margin1_rd(sbc_efa_margin1_rd),
  .sbc_efa_read_en(sbc_efa_read_en),
  .sbc_efa_word_addr(sbc_efa_word_addr[5:0]),
  .shift_data_ff_out(shift_data_ff_out[31:0]),
  .load_l2_read_data(load_l2_read_data),
  .read_data_ff(read_data_ff[31:0]),
  .cmp_mrd_cnt_done(cmp_mrd_cnt_done),
  .decode_enable_vld(decode_enable_vld),
  .snc1_rowaddr(snc1_rowaddr[6:0]),
  .niu_read_data_shift(niu_read_data_shift[31:0]),
  .load_niu_read_data(load_niu_read_data)
	);

//efu_tcu_dp	datapath	
//			(
//	.update_dr_jbus			(update_dr_jbus),
//	.read_data_ff_vld		(read_data_ff_vld),
//	.local_read_en			(local_read_en),
//	.local_efu_read_start		(local_efu_read_start),
//	.local_fuse_bypass		(local_fuse_bypass),
//	.local_dest_sample		(local_dest_sample),
//	.tck_shft_data_ff        	(tck_shft_data_ff[31:0]),
//	.efu_tcu_data_out        	(efu_tcu_data_out),
//	.sbc_efa_margin0_rd		(sbc_efa_margin0_rd),
//	.sbc_efa_margin1_rd		(sbc_efa_margin1_rd),
//	.sync1_rowaddress		(snc1_rowaddr[6:0]),
//	.sbc_efa_sup_det_rd		(sbc_efa_sup_det_rd),
//	.sbc_efa_bit_addr		(sbc_efa_bit_addr[4:0]),
//	.sbc_efa_word_addr		(sbc_efa_word_addr[5:0]),
//	.efa_out_data			(efa_out_data[31:0]),
//	.sbc_efa_read_en		(sbc_efa_read_en),
//	.efa_array_power_down_ff	(efa_array_power_down_ff),
//	.sbc_efa_power_down		(sbc_efa_power_down),
//	// Inputs
//	.tcu_pce_ov 			(io_ce_ovrd),
//        .tcu_aclk                       (io_aclk),
//        .tcu_bclk                       (io_bclk),
//	.tcu_scan_en			(tcu_scan_en),
//	.addr_cnt_ff			(addr_cnt_ff[6:0]),
//	.efa_sbc_data			(efa_sbc_data[31:0]),
//	.tcu_efu_rowaddr		(tcu_efu_rowaddr[6:0]),
//	.tcu_efu_read_mode		(tcu_efu_read_mode[2:0]),
//	.read_data_ff            	(read_data_ff[31:0]),
//	.tcu_efu_coladdr		(tcu_efu_coladdr[4:0]),
//	.tcu_efu_data_in         	(tcu_efu_data_in),
//	.tcu_efu_shiftdr         	(tcu_efu_shiftdr),
//	.mrd_state_rd_array         	(mrd_state_rd_array),
//	.tcu_efu_capturedr       	(tcu_efu_capturedr),
////	.testmode_l       		(testmode_l),
////	.niu_read_data_shift		(niu_read_data_shift[31:0]),
//	.scan_in(datapath_scanin),
//	.scan_out(datapath_scanout),
//	.tck                     	(tck),
//	.l2clk                     	(l2clk),
//	.iol2clk			(iol2clk),
//	.tcu_efu_updatedr		(tcu_efu_updatedr),
//	.tcu_efu_read_en		(tcu_efu_read_en),
//	.inhibit_power_down_l		(inhibit_power_down_l),
//	.tcu_efu_read_start		(tcu_efu_read_start),
//	.tcu_efu_fuse_bypass		(tcu_efu_fuse_bypass),
//	.tcu_efu_dest_sample		(tcu_efu_dest_sample)
//	);


efu_niu_ctl	niu_interface
	(
.efu_niu_mac01_sfro_data                (efu_niu_mac01_sfro_data ),
.efu_niu_mac1_sf_xfer_en                (efu_niu_mac1_sf_xfer_en ),
.efu_niu_mac1_ro_xfer_en                (efu_niu_mac1_ro_xfer_en ),
.efu_niu_mac0_sf_xfer_en                (efu_niu_mac0_sf_xfer_en ),
.efu_niu_mac0_ro_xfer_en                (efu_niu_mac0_ro_xfer_en ),
.efu_niu_ipp1_xfer_en 	                (efu_niu_ipp1_xfer_en 	),
.efu_niu_ipp0_xfer_en 	                (efu_niu_ipp0_xfer_en 	),
.niu_efu_mac1_sf_data 	                (niu_efu_mac1_sf_data 	),
.niu_efu_mac1_ro_data 	                (niu_efu_mac1_ro_data 	),
.niu_efu_mac0_sf_data 	                (niu_efu_mac0_sf_data 	),
.niu_efu_mac0_ro_data 	                (niu_efu_mac0_ro_data 	),
.niu_efu_ipp1_data 	                (niu_efu_ipp1_data 	),
.niu_efu_ipp0_data 	                (niu_efu_ipp0_data 	),
.niu_efu_mac1_sf_xfer_en                (niu_efu_mac1_sf_xfer_en ),
.niu_efu_mac1_ro_xfer_en                (niu_efu_mac1_ro_xfer_en ),
.niu_efu_mac0_sf_xfer_en                (niu_efu_mac0_sf_xfer_en ),
.niu_efu_mac0_ro_xfer_en                (niu_efu_mac0_ro_xfer_en ),
.niu_efu_ipp1_xfer_en 	                (niu_efu_ipp1_xfer_en 	),
.niu_efu_ipp0_xfer_en 	                (niu_efu_ipp0_xfer_en 	),
.efu_niu_cfifo_data 	                (efu_niu_cfifo_data 	),
.efu_niu_cfifo0_xfer_en 	        (efu_niu_cfifo0_xfer_en  ),
.efu_niu_cfifo1_xfer_en 	        (efu_niu_cfifo1_xfer_en  ),
.niu_efu_cfifo0_data 	                (niu_efu_cfifo0_data 	),
.niu_efu_cfifo1_data 	                (niu_efu_cfifo1_data 	),
.niu_efu_cfifo0_xfer_en 	        (niu_efu_cfifo0_xfer_en 	),
.niu_efu_cfifo1_xfer_en 	        (niu_efu_cfifo1_xfer_en 	),
.efu_niu_ram_data			(efu_niu_ram_data       ),
.efu_niu_ram_xfer_en 	                (efu_niu_ram_xfer_en 	),
.efu_niu_ram0_xfer_en 	                (efu_niu_ram0_xfer_en 	),
.efu_niu_ram1_xfer_en 	                (efu_niu_ram1_xfer_en 	),
.niu_efu_ram_xfer_en 	                (niu_efu_ram_xfer_en 	),
.niu_efu_ram0_xfer_en 	                (niu_efu_ram0_xfer_en 	),
.niu_efu_ram1_xfer_en 	                (niu_efu_ram1_xfer_en 	),
.niu_efu_ram_data 	                (niu_efu_ram_data 	),
.niu_efu_ram0_data 	                (niu_efu_ram0_data 	),
.niu_efu_ram1_data 	                (niu_efu_ram1_data 	),
.efu_niu_4k_data 	                (efu_niu_4k_data 	),
.efu_niu_4k_xfer_en 	                (efu_niu_4k_xfer_en 	),
.niu_efu_4k_xfer_en 	                (niu_efu_4k_xfer_en 	),
.niu_efu_4k_data 	                (niu_efu_4k_data 	),
.niu_read_data_shift		(niu_read_data_shift[31:0]),
.tcu_red_reg_clr		(tcu_red_reg_clr[6:0]),
.read_data_ff_vld		(read_data_ff_vld),
.efu_spc0_fuse_iclr             (efu_spc0_fuse_iclr),
.efu_spc1_fuse_iclr             (efu_spc1_fuse_iclr),
.efu_spc2_fuse_iclr             (efu_spc2_fuse_iclr),
.efu_spc3_fuse_iclr             (efu_spc3_fuse_iclr),
.efu_spc4_fuse_iclr             (efu_spc4_fuse_iclr),
.efu_spc5_fuse_iclr             (efu_spc5_fuse_iclr),
.efu_spc6_fuse_iclr             (efu_spc6_fuse_iclr),
.efu_spc7_fuse_iclr             (efu_spc7_fuse_iclr),
.efu_spc0_fuse_dclr             (efu_spc0_fuse_dclr),
.efu_spc1_fuse_dclr             (efu_spc1_fuse_dclr),
.efu_spc2_fuse_dclr             (efu_spc2_fuse_dclr),
.efu_spc3_fuse_dclr             (efu_spc3_fuse_dclr),
.efu_spc4_fuse_dclr             (efu_spc4_fuse_dclr),
.efu_spc5_fuse_dclr             (efu_spc5_fuse_dclr),
.efu_spc6_fuse_dclr             (efu_spc6_fuse_dclr),
.efu_spc7_fuse_dclr             (efu_spc7_fuse_dclr),
.efu_l2t0_fuse_clr              (efu_l2t0_fuse_clr),
.efu_l2t1_fuse_clr              (efu_l2t1_fuse_clr),
.efu_l2t2_fuse_clr              (efu_l2t2_fuse_clr),
.efu_l2t3_fuse_clr              (efu_l2t3_fuse_clr),
.efu_l2t4_fuse_clr              (efu_l2t4_fuse_clr),
.efu_l2t5_fuse_clr              (efu_l2t5_fuse_clr),
.efu_l2t6_fuse_clr              (efu_l2t6_fuse_clr),
.efu_l2t7_fuse_clr              (efu_l2t7_fuse_clr),
.efu_l2b0_fuse_clr              (efu_l2b0_fuse_clr),
.efu_l2b1_fuse_clr              (efu_l2b1_fuse_clr),
.efu_l2b2_fuse_clr              (efu_l2b2_fuse_clr),
.efu_l2b3_fuse_clr              (efu_l2b3_fuse_clr),
.efu_l2b4_fuse_clr              (efu_l2b4_fuse_clr),
.efu_l2b5_fuse_clr              (efu_l2b5_fuse_clr),
.efu_l2b6_fuse_clr              (efu_l2b6_fuse_clr),
.efu_l2b7_fuse_clr              (efu_l2b7_fuse_clr),
.efu_niu_mac1_sf_clr            (efu_niu_mac1_sf_clr    ),
.efu_niu_mac1_ro_clr            (efu_niu_mac1_ro_clr    ),
.efu_niu_mac0_sf_clr            (efu_niu_mac0_sf_clr    ),
.efu_niu_mac0_ro_clr            (efu_niu_mac0_ro_clr    ),
.efu_niu_ipp1_clr               (efu_niu_ipp1_clr       ),
.efu_niu_ipp0_clr               (efu_niu_ipp0_clr       ),
.efu_niu_cfifo0_clr             (efu_niu_cfifo0_clr     ),
.efu_niu_cfifo1_clr             (efu_niu_cfifo1_clr     ),
.efu_niu_ram_clr                (efu_niu_ram_clr        ),
.efu_niu_ram0_clr               (efu_niu_ram0_clr       ),
.efu_niu_ram1_clr               (efu_niu_ram1_clr       ),
.efu_niu_4k_clr                 (efu_niu_4k_clr  ),
.tcu_pce_ov			(io_ce_ovrd	),
.scan_in(niu_interface_scanin),
.scan_out(niu_interface_scanout),
.iol2clk			(iol2clk	),
.l2clk				(l2clk	),
.cmp_io_sync_en			(cmp_io_sync_en),
.tcu_aclk			(io_aclk	),
.tcu_bclk			(io_bclk	),
.tcu_clk_stop			(1'b0	),
.tcu_scan_en			(tcu_scan_en	),
  .tcu_dbr_gateoff(tcu_dbr_gateoff),
  .io_cmp_sync_en(io_cmp_sync_en),
  .efu_dmu_data(efu_dmu_data),
  .efu_dmu_xfer_en(efu_dmu_xfer_en),
  .efu_dmu_clr(efu_dmu_clr),
  .dmu_efu_xfer_en(dmu_efu_xfer_en),
  .dmu_efu_data(dmu_efu_data),
  .efu_mcu_fdi(efu_mcu_fdi),
  .mcu_efu_fdo(mcu_efu_fdo),
  .efu_mcu_fclk(efu_mcu_fclk),
  .efu_mcu_fclrz(efu_mcu_fclrz),
  .efu_psr_fdi(efu_psr_fdi),
  .psr_efu_fdo(psr_efu_fdo),
  .efu_psr_fclk(efu_psr_fclk),
  .efu_psr_fclrz(efu_psr_fclrz),
  .efu_niu_fdi(efu_niu_fdi),
  .niu_efu_fdo(niu_efu_fdo),
  .efu_niu_fclk(efu_niu_fclk),
  .efu_niu_fclrz(efu_niu_fclrz),
  .read_data_ff(read_data_ff[31:0]),
  .load_niu_read_data(load_niu_read_data)

	);

efu_l2t_ctl core_l2tandl2d
	(
	.efu_spc1357_fuse_data		(efu_spc1357_fuse_data),
	.efu_spc0246_fuse_data		(efu_spc0246_fuse_data),
	.efu_spc0_fuse_ixfer_en		(efu_spc0_fuse_ixfer_en),
	.efu_spc1_fuse_ixfer_en		(efu_spc1_fuse_ixfer_en),
	.efu_spc2_fuse_ixfer_en		(efu_spc2_fuse_ixfer_en),
	.efu_spc3_fuse_ixfer_en		(efu_spc3_fuse_ixfer_en),
	.efu_spc4_fuse_ixfer_en		(efu_spc4_fuse_ixfer_en),
	.efu_spc5_fuse_ixfer_en		(efu_spc5_fuse_ixfer_en),
	.efu_spc6_fuse_ixfer_en		(efu_spc6_fuse_ixfer_en),
	.efu_spc7_fuse_ixfer_en		(efu_spc7_fuse_ixfer_en),
	.efu_spc0_fuse_dxfer_en		(efu_spc0_fuse_dxfer_en),
	.efu_spc1_fuse_dxfer_en		(efu_spc1_fuse_dxfer_en),
	.efu_spc2_fuse_dxfer_en		(efu_spc2_fuse_dxfer_en),
	.efu_spc3_fuse_dxfer_en		(efu_spc3_fuse_dxfer_en),
	.efu_spc4_fuse_dxfer_en		(efu_spc4_fuse_dxfer_en),
	.efu_spc5_fuse_dxfer_en		(efu_spc5_fuse_dxfer_en),
	.efu_spc6_fuse_dxfer_en		(efu_spc6_fuse_dxfer_en),
	.efu_spc7_fuse_dxfer_en		(efu_spc7_fuse_dxfer_en),
	.spc0_efu_fuse_dxfer_en		(spc0_efu_fuse_dxfer_en),
	.spc1_efu_fuse_dxfer_en		(spc1_efu_fuse_dxfer_en),
	.spc2_efu_fuse_dxfer_en		(spc2_efu_fuse_dxfer_en),
	.spc3_efu_fuse_dxfer_en		(spc3_efu_fuse_dxfer_en),
	.spc4_efu_fuse_dxfer_en		(spc4_efu_fuse_dxfer_en),
	.spc5_efu_fuse_dxfer_en		(spc5_efu_fuse_dxfer_en),
	.spc6_efu_fuse_dxfer_en		(spc6_efu_fuse_dxfer_en),
	.spc7_efu_fuse_dxfer_en		(spc7_efu_fuse_dxfer_en),
	.spc0_efu_fuse_ixfer_en		(spc0_efu_fuse_ixfer_en),
	.spc1_efu_fuse_ixfer_en		(spc1_efu_fuse_ixfer_en),
	.spc2_efu_fuse_ixfer_en		(spc2_efu_fuse_ixfer_en),
	.spc3_efu_fuse_ixfer_en		(spc3_efu_fuse_ixfer_en),
	.spc4_efu_fuse_ixfer_en		(spc4_efu_fuse_ixfer_en),
	.spc5_efu_fuse_ixfer_en		(spc5_efu_fuse_ixfer_en),
	.spc6_efu_fuse_ixfer_en		(spc6_efu_fuse_ixfer_en),
	.spc7_efu_fuse_ixfer_en		(spc7_efu_fuse_ixfer_en),
	.spc0_efu_fuse_ddata		(spc0_efu_fuse_ddata),
	.spc1_efu_fuse_ddata		(spc1_efu_fuse_ddata),
	.spc2_efu_fuse_ddata		(spc2_efu_fuse_ddata),
	.spc3_efu_fuse_ddata		(spc3_efu_fuse_ddata),
	.spc4_efu_fuse_ddata		(spc4_efu_fuse_ddata),
	.spc5_efu_fuse_ddata		(spc5_efu_fuse_ddata),
	.spc6_efu_fuse_ddata		(spc6_efu_fuse_ddata),
	.spc7_efu_fuse_ddata		(spc7_efu_fuse_ddata),
	.spc0_efu_fuse_idata		(spc0_efu_fuse_idata),
	.spc1_efu_fuse_idata		(spc1_efu_fuse_idata),
	.spc2_efu_fuse_idata		(spc2_efu_fuse_idata),
	.spc3_efu_fuse_idata		(spc3_efu_fuse_idata),
	.spc4_efu_fuse_idata		(spc4_efu_fuse_idata),
	.spc5_efu_fuse_idata		(spc5_efu_fuse_idata),
	.spc6_efu_fuse_idata		(spc6_efu_fuse_idata),
	.spc7_efu_fuse_idata		(spc7_efu_fuse_idata),
	.efu_l2t0246_fuse_data		(efu_l2t0246_fuse_data),
	.efu_l2t1357_fuse_data		(efu_l2t1357_fuse_data),
	.efu_l2t0_fuse_xfer_en		(efu_l2t0_fuse_xfer_en),
	.efu_l2t1_fuse_xfer_en		(efu_l2t1_fuse_xfer_en),
	.efu_l2t2_fuse_xfer_en		(efu_l2t2_fuse_xfer_en),
	.efu_l2t3_fuse_xfer_en		(efu_l2t3_fuse_xfer_en),
	.efu_l2t4_fuse_xfer_en		(efu_l2t4_fuse_xfer_en),
	.efu_l2t5_fuse_xfer_en		(efu_l2t5_fuse_xfer_en),
	.efu_l2t6_fuse_xfer_en		(efu_l2t6_fuse_xfer_en),
	.efu_l2t7_fuse_xfer_en		(efu_l2t7_fuse_xfer_en),
	.l2t0_efu_fuse_xfer_en		(l2t0_efu_fuse_xfer_en),
	.l2t1_efu_fuse_xfer_en		(l2t1_efu_fuse_xfer_en),
	.l2t2_efu_fuse_xfer_en		(l2t2_efu_fuse_xfer_en),
	.l2t3_efu_fuse_xfer_en		(l2t3_efu_fuse_xfer_en),
	.l2t4_efu_fuse_xfer_en		(l2t4_efu_fuse_xfer_en),
	.l2t5_efu_fuse_xfer_en		(l2t5_efu_fuse_xfer_en),
	.l2t6_efu_fuse_xfer_en		(l2t6_efu_fuse_xfer_en),
	.l2t7_efu_fuse_xfer_en		(l2t7_efu_fuse_xfer_en),
	.l2t0_efu_fuse_data		(l2t0_efu_fuse_data),
	.l2t1_efu_fuse_data		(l2t1_efu_fuse_data),
	.l2t2_efu_fuse_data		(l2t2_efu_fuse_data),
	.l2t3_efu_fuse_data		(l2t3_efu_fuse_data),
	.l2t4_efu_fuse_data		(l2t4_efu_fuse_data),
	.l2t5_efu_fuse_data		(l2t5_efu_fuse_data),
	.l2t6_efu_fuse_data		(l2t6_efu_fuse_data),
	.l2t7_efu_fuse_data		(l2t7_efu_fuse_data),
	.efu_l2b0246_fuse_data		(efu_l2b0246_fuse_data),
	.efu_l2b1357_fuse_data		(efu_l2b1357_fuse_data),
	.efu_l2b0_fuse_xfer_en		(efu_l2b0_fuse_xfer_en),
	.efu_l2b1_fuse_xfer_en		(efu_l2b1_fuse_xfer_en),
	.efu_l2b2_fuse_xfer_en		(efu_l2b2_fuse_xfer_en),
	.efu_l2b3_fuse_xfer_en		(efu_l2b3_fuse_xfer_en),
	.efu_l2b4_fuse_xfer_en		(efu_l2b4_fuse_xfer_en),
	.efu_l2b5_fuse_xfer_en		(efu_l2b5_fuse_xfer_en),
	.efu_l2b6_fuse_xfer_en		(efu_l2b6_fuse_xfer_en),
	.efu_l2b7_fuse_xfer_en		(efu_l2b7_fuse_xfer_en),
	.l2b0_efu_fuse_xfer_en		(l2b0_efu_fuse_xfer_en),
	.l2b1_efu_fuse_xfer_en		(l2b1_efu_fuse_xfer_en),
	.l2b2_efu_fuse_xfer_en		(l2b2_efu_fuse_xfer_en),
	.l2b3_efu_fuse_xfer_en		(l2b3_efu_fuse_xfer_en),
	.l2b4_efu_fuse_xfer_en		(l2b4_efu_fuse_xfer_en),
	.l2b5_efu_fuse_xfer_en		(l2b5_efu_fuse_xfer_en),
	.l2b6_efu_fuse_xfer_en		(l2b6_efu_fuse_xfer_en),
	.l2b7_efu_fuse_xfer_en		(l2b7_efu_fuse_xfer_en),
	.l2b0_efu_fuse_data		(l2b0_efu_fuse_data),
	.l2b1_efu_fuse_data		(l2b1_efu_fuse_data),
	.l2b2_efu_fuse_data		(l2b2_efu_fuse_data),
	.l2b3_efu_fuse_data		(l2b3_efu_fuse_data),
	.l2b4_efu_fuse_data		(l2b4_efu_fuse_data),
	.l2b5_efu_fuse_data		(l2b5_efu_fuse_data),
	.l2b6_efu_fuse_data		(l2b6_efu_fuse_data),
	.l2b7_efu_fuse_data		(l2b7_efu_fuse_data),
//	.tcu_pce_ov			(io_ce_ovrd		),
	.tcu_aclk			(io_aclk		),
	.tcu_bclk			(io_bclk		),
	.tcu_pce_ov			(io_ce_ovrd		),
	.tcu_scan_en			(tcu_scan_en		),
	.scan_in(core_l2tandl2d_scanin),
	.scan_out(core_l2tandl2d_scanout),
	.iol2clk				(iol2clk),
  .read_data_ff_vld(read_data_ff_vld),
  .cmp_mrd_cnt_done(cmp_mrd_cnt_done),
  .read_data_ff(read_data_ff[31:0]),
  .shift_data_ff_out(shift_data_ff_out[31:0]),
  .load_l2_read_data(load_l2_read_data),
  .l2clk(l2clk),
  .cmp_io_sync_en(cmp_io_sync_en)
	);



// fixscan start:
assign l2t_clk_header_scanin     = scan_in                  ;
assign efu_ioclk_header_scanin   = l2t_clk_header_scanout   ;
assign u_efa_stdc_scanin         = efu_ioclk_header_scanout ;
assign niu_interface_scanin      = u_efa_stdc_scanout       ;
assign core_l2tandl2d_scanin     = niu_interface_scanout    ;
assign scan_out                  = core_l2tandl2d_scanout   ;
// fixscan end:
endmodule

