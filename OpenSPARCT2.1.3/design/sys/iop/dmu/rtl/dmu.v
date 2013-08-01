// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu.v
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
module dmu (
    tcu_aclk,                // input  () <= ()
    tcu_bclk,                // input  () <= ()
    tcu_pce_ov,              // input  () <= ()
    tcu_dmu_io_clk_stop,     // input  () <= ()
    tcu_div_bypass,          // input  () <= ()
    tcu_test_protect,        // input  () <= ()
    ccu_io_out,              // input  (clstr) <= ()
    cluster_arst_l,          // input  (clstr) <= ()
    ccu_serdes_dtm,          // input  (clstr) <= ()
    gclk,                    // input  (dmu_dmc,dmu_dsn,dmu_ilu) <= ()
    ncu_dmu_data,            // input  (dmu_dsn) <= ()
    ncu_dmu_mmu_addr_vld,    // input  (dmu_dsn) <= ()
    ncu_dmu_mondo_ack,       // input  (dmu_dsn) <= ()
    ncu_dmu_mondo_id,        // input  (dmu_dsn) <= ()
    ncu_dmu_mondo_nack,      // input  (dmu_dsn) <= ()
    ncu_dmu_pio_data,        // input  (dmu_dsn) <= ()
    ncu_dmu_pio_hdr_vld,     // input  (dmu_dsn) <= ()
    ncu_dmu_stall,           // input  (dmu_dsn) <= ()
    ncu_dmu_vld,             // input  (dmu_dsn) <= ()
    ncu_dmu_mondo_id_par,    // input  (dmu_dsn) <= ()	n2 RAS
    ncu_dmu_d_pei,           // input  (dmu_dsn) <= ()	n2 RAS
    ncu_dmu_siicr_pei,       // input  (dmu_dsn) <= ()	n2 RAS
    ncu_dmu_ctag_uei,        // input  (dmu_dsn) <= ()	n2 RAS
    ncu_dmu_ctag_cei,        // input  (dmu_dsn) <= ()	n2 RAS
    ncu_dmu_ncucr_pei,       // input  (dmu_dsn) <= ()	n2 RAS
    ncu_dmu_iei,             // input  (dmu_dsn) <= ()	n2 RAS

    p2d_ce_int,              // input  (dmu_ilu) <= ()
    p2d_csr_ack,             // input  (dmu_ilu) <= ()
    p2d_csr_rcd,             // input  (dmu_ilu) <= ()
    p2d_csr_req,             // input  (dmu_ilu) <= ()
    p2d_cto_req,             // input  (dmu_ilu) <= ()
    p2d_cto_tag,             // input  (dmu_ilu) <= ()
    p2d_drain,               // input  (dmu_ilu) <= ()
    p2d_ecd_rptr,            // input  (dmu_ilu) <= ()
    p2d_ech_rptr,            // input  (dmu_ilu) <= ()
    p2d_erd_rptr,            // input  (dmu_ilu) <= ()
    p2d_erh_rptr,            // input  (dmu_ilu) <= ()
    p2d_ibc_ack,             // input  (dmu_ilu) <= ()
    p2d_idb_data,            // input  (dmu_ilu) <= ()
    p2d_idb_dpar,            // input  (dmu_ilu) <= ()
    p2d_ihb_data,            // input  (dmu_ilu) <= ()
    p2d_ihb_dpar,            // input  (dmu_ilu) <= ()
    d2p_ihb_rd,              // output  (dmu_ilu) => ()
    d2p_idb_rd,              // output  (dmu_tmu) => ()
    p2d_ihb_wptr,            // input  (dmu_ilu) <= ()
    p2d_mps,                 // input  (dmu_ilu) <= ()
    p2d_oe_int,              // input  (dmu_ilu) <= ()
    p2d_spare,               // input  (dmu_ilu) <= ()
    p2d_ue_int,              // input  (dmu_ilu) <= ()
    p2d_npwr_stall_en ,					// N2+ Bug 106560
    rst_por_,                // input  (dmu_dmc,dmu_ilu) <= ()
    rst_dmu_async_por_,      // input  (dmu_ilu) <= ()
    rst_wmr_,                // input  (dmu_dmc,dmu_dsn,dmu_ilu) <= ()
    tcu_scan_en,             // input  () <= ()
    scan_in,                 // input  () <= ()
    tcu_se_scancollar_in,    // input  () <= ()
    tcu_se_scancollar_out,   // input  () <= ()
    sii_dmu_wrack_tag,       // input  (dmu_dsn) <= ()
    sii_dmu_wrack_par,       // input  (dmu_dsn) <= () n2 RAS
    sii_dmu_wrack_vld,       // input  (dmu_dsn) <= ()
    sio_dmu_data,            // input  (dmu_dsn) <= ()
    sio_dmu_hdr_vld,         // input  (dmu_dsn) <= ()
    sio_dmu_parity,          // input  (dmu_dsn) <= ()
    tcu_array_bypass,        // input  () <= ()
    tcu_array_wr_inhibit,    // input  () <= ()
    tcu_mbist_bisi_en,       // input  () <= ()
    tcu_mbist_user_mode,     // input  () <= ()
    tcu_dmu_mbist_start,     // input  () <= ()
    tcu_dmu_mbist_scan_in,   // input  () <= ()
    tcu_atpg_mode,   	     // input  () <= ()
    dmu_tcu_mbist_done,      // output  () <= ()
    dmu_tcu_mbist_fail,      // output  () <= ()
    dmu_tcu_mbist_scan_out,  // output  () <= ()
    d2p_csr_ack,             // output (dmu_ilu) => ()
    d2p_csr_rcd,             // output (dmu_ilu) => ()
    d2p_csr_req,             // output (dmu_ilu) => ()
    d2p_cto_ack,             // output (dmu_ilu) => ()
    d2p_ech_wptr,            // output (dmu_ilu) => ()
    d2p_edb_addr,            // output (dmu_ilu) => ()
    d2p_edb_data,            // output (dmu_ilu) => ()
    d2p_edb_dpar,            // output (dmu_ilu) => ()
    d2p_edb_we,              // output (dmu_ilu) => ()
    d2p_ehb_addr,            // output (dmu_ilu) => ()
    d2p_ehb_data,            // output (dmu_ilu) => ()
    d2p_ehb_dpar,            // output (dmu_ilu) => ()
    d2p_ehb_we,              // output (dmu_ilu) => ()
    d2p_erh_wptr,            // output (dmu_ilu) => ()
    d2p_ibc_nhc,             // output (dmu_ilu) => ()
    d2p_ibc_pdc,             // output (dmu_ilu) => ()
    d2p_ibc_phc,             // output (dmu_ilu) => ()
    d2p_ibc_req,             // output (dmu_ilu) => ()
    d2p_idb_addr,            // output (dmu_ilu) => ()
    d2p_ihb_addr,            // output (dmu_ilu) => ()
    d2p_spare,               // output (dmu_ilu) => ()
    dmu_ncu_data,            // output (dmu_dsn) => ()
    dmu_ncu_stall,           // output (dmu_dsn) => ()
    dmu_ncu_vld,             // output (dmu_dsn) => ()
    dmu_ncu_wrack_tag,       // output (dmu_dsn) => ()
    dmu_ncu_wrack_vld,       // output (dmu_dsn) => ()
    dmu_ncu_wrack_par,       // output (dmu_dsn) => () n2 RAS
    dmu_ncu_d_pe,            // output (dmu_dsn) => () n2 RAS
    dmu_ncu_siicr_pe,        // output (dmu_dsn) => () n2 RAS
    dmu_ncu_ctag_ue,         // output (dmu_dsn) => () n2 RAS
    dmu_ncu_ctag_ce,         // output (dmu_dsn) => () n2 RAS
    dmu_ncu_ncucr_pe,        // output (dmu_dsn) => () n2 RAS
    dmu_ncu_ie,              // output (dmu_dsn) => () n2 RAS
    dmu_sii_be,              // output (dmu_dsn) => ()
    dmu_sii_data,            // output (dmu_dsn) => ()
    dmu_sii_datareq,         // output (dmu_dsn) => ()
    dmu_sii_datareq16,       // output (dmu_dsn) => ()
    dmu_sii_hdr_vld,         // output (dmu_dsn) => ()
    dmu_sii_parity,          // output (dmu_dsn) => ()
    dmu_sii_be_parity,       // output (dmu_dsn) => ()
    dmu_sii_reqbypass,       // output (dmu_dsn) => ()
    dmu_mio_debug_bus_a,     // output (dmu_cru) => ()
    dmu_mio_debug_bus_b,     // output (dmu_cru) => ()
    scan_out,                // output () => ()
    dmu_dbg_err_event,       // output () => ()
    dbg1_dmu_stall,          // output () => ()
    dbg1_dmu_resume,         // output () => ()
    dmu_dbg1_stall_ack,      // output () => ()
// efuse signals
    efu_dmu_data,            // input () => ()
    efu_dmu_xfer_en,         // input () => ()
    efu_dmu_clr,             // input () => ()
    dmu_efu_data,            // output () => ()
    dmu_efu_xfer_en,         // output () => ()
//SV n2 5-31-05
    dmu_psr_rate_scale,      // output (ilu) => (psr)
//BP n2 5-24-05 peu pll en, tx lane enable, rx lane enable
    dmu_psr_pll_en_sds0,	// output (ilu) => (peu)
    dmu_psr_pll_en_sds1,	// output (ilu) => (peu)
    dmu_psr_rx_en_b0_sds0,	// output (ilu) => (peu)
    dmu_psr_rx_en_b1_sds0,	// output (ilu) => (peu)
    dmu_psr_rx_en_b2_sds0,	// output (ilu) => (peu)
    dmu_psr_rx_en_b3_sds0,	// output (ilu) => (peu)
    dmu_psr_rx_en_b0_sds1,	// output (ilu) => (peu)
    dmu_psr_rx_en_b1_sds1,	// output (ilu) => (peu)
    dmu_psr_rx_en_b2_sds1,	// output (ilu) => (peu)
    dmu_psr_rx_en_b3_sds1,	// output (ilu) => (peu)
    dmu_psr_tx_en_b0_sds0,	// output (ilu) => (peu)
    dmu_psr_tx_en_b1_sds0,	// output (ilu) => (peu)
    dmu_psr_tx_en_b2_sds0,	// output (ilu) => (peu)
    dmu_psr_tx_en_b3_sds0,	// output (ilu) => (peu)
    dmu_psr_tx_en_b0_sds1,	// output (ilu) => (peu)
    dmu_psr_tx_en_b1_sds1,	// output (ilu) => (peu)
    dmu_psr_tx_en_b2_sds1,	// output (ilu) => (peu)
    dmu_psr_tx_en_b3_sds1,	// output (ilu) => (peu)
    d2p_req_id			// output (cru) => (peu)

    );

input		tcu_aclk;
input		tcu_bclk;
input		tcu_pce_ov;
input		tcu_dmu_io_clk_stop;
input		tcu_div_bypass;
input		tcu_test_protect;
input		ccu_io_out;
input		cluster_arst_l;
input		ccu_serdes_dtm;
input		gclk;
input	[31:0]	ncu_dmu_data;
input		ncu_dmu_mmu_addr_vld;
input		ncu_dmu_mondo_ack;
input	[5:0]	ncu_dmu_mondo_id;
input		ncu_dmu_mondo_nack;
input	[63:0]	ncu_dmu_pio_data;
input		ncu_dmu_pio_hdr_vld;
input		ncu_dmu_stall;
input		ncu_dmu_vld;
input	        ncu_dmu_mondo_id_par;    // input  (dmu_dsn) <= ()  n2 RAS
input	        ncu_dmu_d_pei;           // input  (dmu_dsn) <= ()  n2 RAS
input	        ncu_dmu_siicr_pei;       // input  (dmu_dsn) <= ()  n2 RAS
input	        ncu_dmu_ctag_uei;        // input  (dmu_dsn) <= ()  n2 RAS
input	        ncu_dmu_ctag_cei;        // input  (dmu_dsn) <= ()  n2 RAS
input	        ncu_dmu_ncucr_pei;       // input  (dmu_dsn) <= ()  n2 RAS
input	        ncu_dmu_iei;             // input  (dmu_dsn) <= ()  n2 RAS
input		p2d_ce_int;
input		p2d_csr_ack;
input	[95:0]	p2d_csr_rcd;
input		p2d_csr_req;
input		p2d_cto_req;
input	[4:0]	p2d_cto_tag;
input		p2d_drain;
input	[7:0]	p2d_ecd_rptr;
input	[5:0]	p2d_ech_rptr;
input	[7:0]	p2d_erd_rptr;
input	[5:0]	p2d_erh_rptr;
input		p2d_ibc_ack;
input	[127:0]	p2d_idb_data;
input	[3:0]	p2d_idb_dpar;
input	[127:0]	p2d_ihb_data;
input	[3:0]	p2d_ihb_dpar;
output		d2p_ihb_rd;		//BP n2 4-1-05these two are for circuit issues to peu rams
output		d2p_idb_rd;		//BP n2 4-1-05these two are for circuit issues to peu rams
input	[6:0]	p2d_ihb_wptr;
input	[2:0]	p2d_mps;
input		p2d_oe_int;
input	[4:0]	p2d_spare;
input		p2d_ue_int;
input		p2d_npwr_stall_en ;			// N2+ Bug 106560
input		rst_por_;
input		rst_dmu_async_por_;	//BP n2 8.05-05 async reset to set SERDES csr for por1
input		rst_wmr_;
input		tcu_scan_en;
input		scan_in;
input		tcu_se_scancollar_in;
input		tcu_se_scancollar_out;
input	[3:0]	sii_dmu_wrack_tag;
input	        sii_dmu_wrack_par;       // input  (dmu_dsn) <= () n2 RAS
input		sii_dmu_wrack_vld;
input	[127:0]	sio_dmu_data;
input		sio_dmu_hdr_vld;
input	[7:0]	sio_dmu_parity;
input		tcu_array_bypass;
input		tcu_array_wr_inhibit;
input		    tcu_mbist_bisi_en;       // input mbist 
input		    tcu_mbist_user_mode;       // input mbist 
input	[1:0]	    tcu_dmu_mbist_start;     // input mbist
input		    tcu_dmu_mbist_scan_in;   // input mbist
input		    tcu_atpg_mode;   		// input mbist
output	[1:0]	    dmu_tcu_mbist_done;      // output mbist
output	[1:0]	    dmu_tcu_mbist_fail;      // output mbist
output		    dmu_tcu_mbist_scan_out;  // output mbist
output		d2p_csr_ack;
output	[95:0]	d2p_csr_rcd;
output		d2p_csr_req;
output		d2p_cto_ack;
output	[5:0]	d2p_ech_wptr;
output	[7:0]	d2p_edb_addr;
output	[127:0]	d2p_edb_data;
output	[3:0]	d2p_edb_dpar;
output		d2p_edb_we;
output	[5:0]	d2p_ehb_addr;
output	[127:0]	d2p_ehb_data;
output	[3:0]	d2p_ehb_dpar;
output		d2p_ehb_we;
output	[5:0]	d2p_erh_wptr;
output	[7:0]	d2p_ibc_nhc;
output	[11:0]	d2p_ibc_pdc;
output	[7:0]	d2p_ibc_phc;
output		d2p_ibc_req;
output	[7:0]	d2p_idb_addr;
output	[5:0]	d2p_ihb_addr;
output	[4:0]	d2p_spare;
output	[31:0]	dmu_ncu_data;
output		dmu_ncu_stall;
output		dmu_ncu_vld;
output	[3:0]	dmu_ncu_wrack_tag;
output		dmu_ncu_wrack_vld;
output	        dmu_ncu_wrack_par;       // output (dmu_dsn) => () n2 RAS
output	        dmu_ncu_d_pe;            // output (dmu_dsn) => () n2 RAS
output	        dmu_ncu_siicr_pe;        // output (dmu_dsn) => () n2 RAS
output	        dmu_ncu_ctag_ue;         // output (dmu_dsn) => () n2 RAS
output	        dmu_ncu_ctag_ce;         // output (dmu_dsn) => () n2 RAS
output	        dmu_ncu_ncucr_pe;        // output (dmu_dsn) => () n2 RAS
output	        dmu_ncu_ie;              // output (dmu_dsn) => () n2 RAS
output	[15:0]	dmu_sii_be;
output	[127:0]	dmu_sii_data;
output		dmu_sii_datareq;
output		dmu_sii_datareq16;
output		dmu_sii_hdr_vld;
output	[7:0]	dmu_sii_parity;
output		dmu_sii_be_parity;
output		dmu_sii_reqbypass;
output	[7:0]	dmu_mio_debug_bus_a;
output	[7:0]	dmu_mio_debug_bus_b;
output		scan_out;
output		dmu_dbg_err_event;
input		dbg1_dmu_stall;
input		dbg1_dmu_resume;
output		dmu_dbg1_stall_ack;
// efuse signals
input		efu_dmu_data;       	// input () => ()
input		efu_dmu_xfer_en;    	// input () => ()
input		efu_dmu_clr;        	// input () => ()
output		dmu_efu_data;       	// output () => ()
output		dmu_efu_xfer_en;    	// output () => ()
//SV  n2 5-31-05
output  [1:0]   dmu_psr_rate_scale;
// BP n2 5-24-05 peu pll enable tx-lane enable rx-lane enable
output                                dmu_psr_pll_en_sds0;
output                                dmu_psr_pll_en_sds1;
output                                dmu_psr_rx_en_b0_sds0;
output                                dmu_psr_rx_en_b1_sds0;
output                                dmu_psr_rx_en_b2_sds0;
output                                dmu_psr_rx_en_b3_sds0;
output                                dmu_psr_rx_en_b0_sds1;
output                                dmu_psr_rx_en_b1_sds1;
output                                dmu_psr_rx_en_b2_sds1;
output                                dmu_psr_rx_en_b3_sds1;
output                                dmu_psr_tx_en_b0_sds0;
output                                dmu_psr_tx_en_b1_sds0;
output                                dmu_psr_tx_en_b2_sds0;
output                                dmu_psr_tx_en_b3_sds0;
output                                dmu_psr_tx_en_b0_sds1;
output                                dmu_psr_tx_en_b1_sds1;
output                                dmu_psr_tx_en_b2_sds1;
output                                dmu_psr_tx_en_b3_sds1;
output [15:0]       			d2p_req_id;		//BP 8-18-05


wire		l1clk;
wire		por_;
/*
wire           ncu_dmu_mondo_id_par;    // input  (dmu_dsn) <= ()  n2 RAS
wire           ncu_dmu_d_pei;           // input  (dmu_dsn) <= ()  n2 RAS
wire           ncu_dmu_siicr_pei;       // input  (dmu_dsn) <= ()  n2 RAS
wire           ncu_dmu_ctag_uei;        // input  (dmu_dsn) <= ()  n2 RAS
wire           ncu_dmu_ctag_cei;        // input  (dmu_dsn) <= ()  n2 RAS
wire           ncu_dmu_ncucr_pei;       // input  (dmu_dsn) <= ()  n2 RAS
wire           ncu_dmu_iei;             // input  (dmu_dsn) <= ()  n2 RAS
wire           sii_dmu_wrack_par;       // input  (dmu_dsn) <= () n2 RAS
wire          dmu_ncu_wrack_par;       // output (dmu_dsn) => () n2 RAS
wire          dmu_ncu_d_pe;            // output (dmu_dsn) => () n2 RAS
wire          dmu_ncu_siicr_pe;        // output (dmu_dsn) => () n2 RAS
wire          dmu_ncu_ctag_ue;         // output (dmu_dsn) => () n2 RAS
wire          dmu_ncu_ctag_ce;         // output (dmu_dsn) => () n2 RAS
wire          dmu_ncu_ncucr_pe;        // output (dmu_dsn) => () n2 RAS
wire          dmu_ncu_ie;              // output (dmu_dsn) => () n2 RAS
*/
wire	[36:0]	d2j_addr;
wire	[15:0]	d2j_bmsk;
wire	[31:0]	d2j_csr_ring_in;
wire	[15:0]	d2j_ctag;
wire	[127:0]	d2j_data;
//wire	[42:13]	d2j_tsb_base;
wire	[31:0]	j2d_csr_ring_out;
wire	[127:0]	j2d_d_data;
wire	[15:0]	j2d_di_ctag;
//wire	[19:0]	j2d_ext_int_l;
wire	[42:6]	j2d_mmu_addr;
wire	[35:0]	j2d_p_addr;
wire	[15:0]	j2d_p_bmsk;
wire	[127:0]	j2d_p_data;
wire	[127:0]	k2y_buf_data;
wire	[31:0]	k2y_csr_ring_out;
wire	[123:0]	k2y_rcd;
wire	[127:0]	y2k_buf_data;
wire	[31:0]	y2k_csr_ring_in;
wire	[115:0]	y2k_rcd;
wire	[3:0]	d2j_cmd;
wire		d2j_cmd_vld;
wire	[4:0]	d2j_data_par;
wire		d2j_data_vld;
wire	[5:0]	cr2ds_dbg_sel_a;
wire	[5:0]	cr2ds_dbg_sel_b;
wire	[7:0]	ds2cr_dbg_a;
wire	[7:0]	ds2cr_dbg_b;
wire	[7:0]	dmu_mio_debug_bus_a;
wire	[7:0]	dmu_mio_debug_bus_b;
wire	[3:0]	d2j_p_wrack_tag;
wire		d2j_p_wrack_vld;
//wire	[4:0]	d2j_spare;
//wire		d2j_tsb_enable;
//wire	[3:0]	d2j_tsb_size;
wire		j2d_d_data_err;
wire	[3:0]	j2d_d_data_par;
wire		j2d_d_data_vld;
wire	[3:0]	j2d_d_wrack_tag;
wire		j2d_d_wrack_vld;
wire	[1:0]	j2d_di_cmd;
wire		j2d_di_cmd_vld;
//wire		j2d_i2c0_int_l;
//wire		j2d_i2c1_int_l;
wire		j2d_instance_id;
//wire		j2d_jbc_int_l;
//wire		j2d_jid;
wire		j2d_mmu_addr_vld;
wire	[3:0]	j2d_p_cmd;
wire		j2d_p_cmd_vld;
wire	[10:0]	j2d_p_ctag;
wire	[3:0]	j2d_p_data_par;
wire		j2d_p_data_vld;
//wire	[4:0]	j2d_spare;
wire	[7:0]	k2y_buf_addr;
wire		k2y_buf_addr_vld_monitor;
wire	[3:0]	k2y_buf_dpar;
wire	[5:0]	k2y_dbg_sel_a;
wire	[5:0]	k2y_dbg_sel_b;
wire	[4:0]	k2y_dou_dptr;
wire		k2y_dou_err;
wire		k2y_dou_vld;
wire		k2y_rcd_deq;
wire		k2y_rcd_enq;
wire		k2y_rel_enq;
wire	[8:0]	k2y_rel_rcd;
wire	[7:0]	y2k_buf_addr;
wire		y2k_buf_addr_vld_monitor;
wire	[3:0]	y2k_buf_dpar;
wire	[7:0]	y2k_dbg_a;
wire	[7:0]	y2k_dbg_b;
wire		y2k_int_l;
wire	[2:0]	y2k_mps;
wire		y2k_rcd_deq;
wire		y2k_rcd_enq;
wire		y2k_rel_enq;
wire	[8:0]	y2k_rel_rcd;

wire		mb0_dcache_read_unused;
wire		mb0_dcache_write_unused;
wire	[6:0]	mb0_dcache_index_unused;
wire	[1:0]	mb0_dcache_way_unused;
wire		mb0_icache_read_unused;
wire		mb0_icache_write_unused;
wire	[7:0]	mb0_icache_index_unused;
wire		mb0_icache_word_unused;
wire	[1:0]	mb0_icache_way_unused;
wire	[7:0]	mb0_write_data_unused;
wire		mb0_done_unused;
wire		mb0_dcache_fail_unused;


wire		mb0_icache_fail_unused;

wire		cb0_dcache_read_unused;
wire		cb0_dcache_write_unused;
wire	[6:0]   cb0_dcache_index_unused;
wire	[1:0]   cb0_dcache_way_unused;
wire		cb0_icache_read_unused;
wire		cb0_icache_write_unused;
wire	[7:0]   cb0_icache_index_unused;
wire		cb0_icache_word_unused;
wire	[1:0]   cb0_icache_way_unused;
wire	[7:0]   cb0_write_data_unused;
wire		cb0_done_unused;
wire		cb0_dcache_fail_unused;
wire		cb0_icache_fail_unused;
wire		dmu_mb0_scanout,dmu_cb0_scanout;
assign		j2d_instance_id = 1'b0;
wire		dsn_dmc_iei;
wire		ds2cl_stall;

wire         dmu_cb0_run;
wire [5:0]   dmu_cb0_addr;
wire [32:0]  dmu_cb0_wdata_key;
wire         dmu_cb0_mmu_ptb_wr_en;
wire         dmu_cb0_mmu_ptb_rd_en;
wire         dmu_cb0_mmu_ptb_lkup_en;
wire [63:0] mmu_ptb_hit;
wire         dmu_cb0_mmu_vtb_wr_en;
wire         dmu_cb0_mmu_vtb_rd_en;
wire         dmu_cb0_mmu_vtb_lkup_en;
wire         dmu_cb0_hld;
wire [63:0] mmu_vtb_hit;
wire [3:0]  vtb_dout_4msb;
wire [32:0] mmu_ptb_read_data;
wire [29:0]       vtb2csr_rd;

wire [63:0]  dev_tsb_read_data;
wire         dmu_mb0_run;
wire [8:0]   dmu_mb0_addr;
wire [7:0]   dmu_mb0_wdata;
wire         dmu_mb0_dev_wr_en;
wire         dmu_mb0_dev_rd_en;
wire         dmu_mb0_tsb_wr_en;
wire         dmu_mb0_tsb_rd_en;
wire         dmu_mb0_tdb_wr_en;
wire         dmu_mb0_tdb_rd_en;
wire [7:0]   tdb_dout_8msb;
wire [51:0]       tdb2csr_rd;
wire [148:0] dmu_diu_read_data;
wire         dmu_mb0_diu_wr_en;
wire         dmu_mb0_diu_rd_en;
wire [131:0] dmu_dou_pio_read_data;
wire [131:0] dmu_dou_dma_read_data;
wire         dmu_mb0_dou_pio_data_wr_en;
wire         dmu_mb0_dou_pio_data_rd_en;
wire         dmu_mb0_dou_dma_data_wr_en;
wire         dmu_mb0_dou_dma_data_rd_en;
wire		iol2clk,aclk,bclk,so,pce_ov,wmr_;
wire	    efu_dmu_data,efu_dmu_xfer_en, efu_dmu_clr, dmu_efu_data, dmu_efu_xfer_en;
wire		array_wr_inhibit;
wire		il2cl_gr_16 ;

`ifdef IOMMU_SAT
`else
clkgen_dmu_io	dmu_clkgen(
//OUTPUTS
    .l2clk                    	(iol2clk),            	// output  	(dmu_dmc,dmu_mb0,dmu_cb0) => ()
    .aclk                    	(aclk),            	// output  	(dmu_dmc,dmu_mb0,dmu_cb0) => ()
    .bclk                    	(bclk),            	// output  	(dmu_dmc,dmu_mb0,dmu_cb0) => ()
    .scan_out                 	(),            		// output  	(dmu_dmc,dmu_mb0,dmu_cb0) => ()
    .aclk_wmr                   (),            		// output  	(dmu_dmc,dmu_mb0,dmu_cb0) => ()
    .pce_ov                   	(pce_ov),            	// output  	(dmu_dmc,dmu_mb0,dmu_cb0) => ()
    .wmr_protect                (),          		// output  	() => ()
    .wmr_                	(wmr_),          	// output  	() => ()
    .por_                	(por_),          	// output  	() => ()
    .cmp_slow_sync_en           (),     		// output  	() => ()
    .slow_cmp_sync_en           (),     		// output  	() => ()
    .array_wr_inhibit           (array_wr_inhibit),     // output  	() => ()
//INPUTS
    .tcu_atpg_mode           	(tcu_atpg_mode),  	// input  	() <= ()
    .tcu_wr_inhibit           	(tcu_array_wr_inhibit), // input  	() <= ()
    .tcu_clk_stop           	(tcu_dmu_io_clk_stop),  // input  	() <= ()
    .tcu_pce_ov           	(tcu_pce_ov),     	// input  	() <= ()
    .rst_wmr_protect           	(1'b0),     		// input  	() <= ()
    .rst_wmr_           	(rst_wmr_),     	// input  	() <= ()
    .rst_por_           	(rst_por_),     	// input  	() <= ()
    .ccu_cmp_slow_sync_en       (1'b0), 		// input  	() <= ()
    .ccu_slow_cmp_sync_en       (1'b0), 		// input  	() <= ()
    .tcu_div_bypass       	(tcu_div_bypass), 	// input  	() <= ()
//    .tcu_div_bypass       	(1'b0), 	// input  	() <= ()
    .ccu_div_ph       		(ccu_io_out), 		// input  	() <= ()
    .cluster_div_en       	(1'b1), 	// input  	() <= ()
    .gclk       		(gclk), 		// input  	() <= ()
    .cluster_arst_l       	(cluster_arst_l), 	// input  	() <= ()
    .clk_ext       		(1'b0), 		// input  	() <= ()
    .ccu_serdes_dtm    		(1'b0), 		// input  	() <= ()
    .scan_en   			(tcu_scan_en), 		// input  	() <= ()
    .scan_in    		(scan_in), 		// input  	() <= ()
    .tcu_aclk       		(tcu_aclk), 		// input  	() <= ()
    .tcu_bclk       		(tcu_bclk) 		// input  	() <= ()
    );


// L1 Clock header


  cl_a1_l1hdr_8x clkgen_l1 (
    .l2clk(iol2clk),
    .pce(1'b1),
    .l1clk(l1clk),
    .se(tcu_scan_en),
    .pce_ov(pce_ov),
//SV    .stop(tcu_soc6io_clk_stop)
    .stop(1'b0)
  );
`endif


`ifdef NO_DMC
`else
dmu_dmc dmc (
    .l2clk                    (iol2clk),                  // input  (dmu_dmc,dmu_dsn,dmu_ilu) <= ()
    .l1clk                    (l1clk),                  // input  (dmu_dmc,dmu_dsn,dmu_ilu) <= ()
    .j2d_rst_l                (wmr_),                     // input  (dmu_dmc,dmu_dsn,dmu_ilu) <= ()
    .j2d_por_l                (por_),                     // input  (dmu_dmc,dmu_ilu) <= ()
    .scan_in                  (scan_in),                  // input  (dmu_dmc,dmu_dsn,dmu_ilu) <= ()
    .tcu_scan_en              (tcu_scan_en),              // input  (dmu_dmc,dmu_dsn,dmu_ilu) <= ()
    .tcu_array_bypass         (tcu_array_bypass),         // input  (dmu_dmc,dmu_dsn,dmu_ilu) <= ()
    .tcu_se_scancollar_in     (tcu_se_scancollar_in),     // input  (dmu_dmc,dmu_dsn,dmu_ilu) <= ()
    .tcu_se_scancollar_out    (tcu_se_scancollar_out),    // input  (dmu_dmc,dmu_dsn,dmu_ilu) <= ()
    .tcu_array_wr_inhibit     (array_wr_inhibit),         // input  (dmu_dmc,dmu_dsn,dmu_ilu) <= ()
    .tcu_pce_ov               (pce_ov),                   // input  (dmu_dmc,dmu_dsn,dmu_ilu) <= ()
//SV    .tcu_clk_stop             (tcu_soc6io_clk_stop),      // input  (dmu_dmc,dmu_dsn,dmu_ilu) <= ()
    .tcu_aclk                 (aclk),                     // input  (dmu_dmc,dmu_dsn,dmu_ilu) <= ()
    .tcu_bclk                 (bclk),                     // input  (dmu_dmc,dmu_dsn,dmu_ilu) <= ()
    .scan_out                 (scan_out),                 // input  (dmu_dmc,dmu_dsn,dmu_ilu) <= ()
    .j2d_spare                ({5{1'b0}}),                // input  (dmu_dmc) <= ()
    .cr2ds_dbg_sel_a          (cr2ds_dbg_sel_a[5:0]),     // output () => (dmu_dsn)
    .cr2ds_dbg_sel_b          (cr2ds_dbg_sel_b[5:0]),     // output () => (dmu_dsn)
    .ds2cr_dbg_a      	      (ds2cr_dbg_a[7:0]),         // input () <= (dmu_dsn)
    .ds2cr_dbg_b      	      (ds2cr_dbg_b[7:0]),         // input () <= (dmu_dsn)
    .dmu_mio_debug_bus_a      (dmu_mio_debug_bus_a[7:0]), // output (dmu_dmc) => ()
    .dmu_mio_debug_bus_b      (dmu_mio_debug_bus_b[7:0]), // output (dmu_dmc) => ()
    .y2k_int_l                (y2k_int_l),                // input  (dmu_dmc) <= (dmu_ilu)
//    .j2d_ext_int_l            (j2d_ext_int_l),            // input  (dmu_dmc) <= ()
//    .j2d_i2c0_int_l           (j2d_i2c0_int_l),           // input  (dmu_dmc) <= ()
//    .j2d_i2c1_int_l           (j2d_i2c1_int_l),           // input  (dmu_dmc) <= ()
//    .j2d_jbc_int_l            (j2d_jbc_int_l),            // input  (dmu_dmc) <= ()
    .j2d_jid                  (1'b0),                     // input  (dmu_dmc) <= ()
    .j2d_instance_id          (j2d_instance_id),          // input  (dmu_dmc) <= ()
    .j2d_csr_ring_out         (j2d_csr_ring_out[31:0]),   // input  (dmu_dmc) <= (dmu_dsn)
    .d2j_csr_ring_in          (d2j_csr_ring_in[31:0]),    // output (dmu_dmc) => (dmu_dsn)
    .k2y_csr_ring_out         (k2y_csr_ring_out[31:0]),   // output (dmu_dmc) => (dmu_ilu)
    .y2k_csr_ring_in          (y2k_csr_ring_in[31:0]),    // input  (dmu_dmc) <= (dmu_ilu)
    .d2j_cmd                  (d2j_cmd[3:0]),             // output (dmu_dmc) => (dmu_dsn)
    .d2j_addr                 (d2j_addr[36:0]),           // output (dmu_dmc) => (dmu_dsn)
    .d2j_ctag                 (d2j_ctag[15:0]),           // output (dmu_dmc) => (dmu_dsn)
    .d2j_cmd_vld              (d2j_cmd_vld),              // output (dmu_dmc) => (dmu_dsn)
    .d2j_data                 (d2j_data[127:0]),          // output (dmu_dmc) => (dmu_dsn)
    .d2j_bmsk                 (d2j_bmsk[15:0]),           // output (dmu_dmc) => (dmu_dsn)
    .d2j_data_par             (d2j_data_par[4:0]),        // output (dmu_dmc) => (dmu_dsn)
    .d2j_data_vld             (d2j_data_vld),             // output (dmu_dmc) => (dmu_dsn)
    .d2j_p_wrack_tag          (d2j_p_wrack_tag[3:0]),     // output (dmu_dmc) => (dmu_dsn)
    .d2j_p_wrack_vld          (d2j_p_wrack_vld),          // output (dmu_dmc) => (dmu_dsn)
    .y2k_rel_rcd              (y2k_rel_rcd[8:0]),         // input  (dmu_dmc) <= (dmu_ilu)
    .y2k_rel_enq              (y2k_rel_enq),              // input  (dmu_dmc) <= (dmu_ilu)
    .d2j_spare                (),           		  // output (dmu_dmc) => ()
    .y2k_mps                  (y2k_mps[2:0]),             // input  (dmu_dmc) <= (dmu_ilu)
    .y2k_buf_addr_vld_monitor (y2k_buf_addr_vld_monitor), // input  (dmu_dmc) <= (dmu_ilu)
    .y2k_buf_addr             (y2k_buf_addr[7:0]),        // input  (dmu_dmc) <= (dmu_ilu)
    .k2y_buf_data             (k2y_buf_data[127:0]),      // output (dmu_dmc) => (dmu_ilu)
    .k2y_buf_dpar             (k2y_buf_dpar[3:0]),        // output (dmu_dmc) => (dmu_ilu)
    .j2d_d_wrack_tag          (j2d_d_wrack_tag[3:0]),     // input  (dmu_dmc) <= (dmu_dsn)
    .j2d_d_wrack_vld          (j2d_d_wrack_vld),          // input  (dmu_dmc) <= (dmu_dsn)
    .j2d_di_cmd               (j2d_di_cmd[1:0]),          // input  (dmu_dmc) <= (dmu_dsn)
    .j2d_di_ctag              (j2d_di_ctag[15:0]),        // input  (dmu_dmc) <= (dmu_dsn)
    .j2d_di_cmd_vld           (j2d_di_cmd_vld),           // input  (dmu_dmc) <= (dmu_dsn)
    .j2d_p_cmd                (j2d_p_cmd[3:0]),           // input  (dmu_dmc) <= (dmu_dsn)
    .j2d_p_addr               (j2d_p_addr[35:0]),         // input  (dmu_dmc) <= (dmu_dsn)
    .j2d_p_bmsk               (j2d_p_bmsk[15:0]),         // input  (dmu_dmc) <= (dmu_dsn)
    .j2d_p_ctag               (j2d_p_ctag[10:0]),         // input  (dmu_dmc) <= (dmu_dsn)
    .j2d_p_cmd_vld            (j2d_p_cmd_vld),            // input  (dmu_dmc) <= (dmu_dsn)
    .j2d_d_data               (j2d_d_data[127:0]),        // input  (dmu_dmc) <= (dmu_dsn)
    .j2d_d_data_par           (j2d_d_data_par[3:0]),      // input  (dmu_dmc) <= (dmu_dsn)
    .j2d_d_data_err           (j2d_d_data_err),           // input  (dmu_dmc) <= (dmu_dsn)
    .j2d_d_data_vld           (j2d_d_data_vld),           // input  (dmu_dmc) <= (dmu_dsn)
    .j2d_p_data               (j2d_p_data[127:0]),        // input  (dmu_dmc) <= (dmu_dsn)
    .j2d_p_data_par           (j2d_p_data_par[3:0]),      // input  (dmu_dmc) <= (dmu_dsn)
    .j2d_p_data_vld           (j2d_p_data_vld),           // input  (dmu_dmc) <= (dmu_dsn)
    .k2y_dou_dptr             (k2y_dou_dptr[4:0]),        // output (dmu_dmc) => (dmu_ilu)
    .k2y_dou_err              (k2y_dou_err),              // output (dmu_dmc) => (dmu_ilu)
    .k2y_dou_vld              (k2y_dou_vld),              // output (dmu_dmc) => (dmu_ilu)
    .j2d_mmu_addr             (j2d_mmu_addr[42:6]),       // input  (dmu_dmc) <= (dmu_dsn)
    .j2d_mmu_addr_vld         (j2d_mmu_addr_vld),         // input  (dmu_dmc) <= (dmu_dsn)
//    .d2j_tsb_base             (d2j_tsb_base[42:13]),      // output (dmu_dmc) => ()
//    .d2j_tsb_enable           (d2j_tsb_enable),           // output (dmu_dmc) => ()
//    .d2j_tsb_size             (d2j_tsb_size[3:0]),        // output (dmu_dmc) => ()
    .k2y_buf_addr_vld_monitor (k2y_buf_addr_vld_monitor), // output (dmu_dmc) => (dmu_ilu)
    .k2y_buf_addr             (k2y_buf_addr[7:0]),        // output (dmu_dmc) => (dmu_ilu)
    .y2k_buf_data             (y2k_buf_data[127:0]),      // input  (dmu_dmc) <= (dmu_ilu)
    .y2k_buf_dpar             (y2k_buf_dpar[3:0]),        // input  (dmu_dmc) <= (dmu_ilu)
    .k2y_rcd_deq              (k2y_rcd_deq),              // output (dmu_dmc) => (dmu_ilu)
    .y2k_rcd                  (y2k_rcd[115:0]),           // input  (dmu_dmc) <= (dmu_ilu)
    .y2k_rcd_enq              (y2k_rcd_enq),              // input  (dmu_dmc) <= (dmu_ilu)
    .k2y_rcd                  (k2y_rcd[123:0]),           // output (dmu_dmc) => (dmu_ilu)
    .k2y_rcd_enq              (k2y_rcd_enq),              // output (dmu_dmc) => (dmu_ilu)
    .y2k_rcd_deq              (y2k_rcd_deq),              // input  (dmu_dmc) <= (dmu_ilu)
    .k2y_rel_rcd              (k2y_rel_rcd[8:0]),         // output (dmu_dmc) => (dmu_ilu)
    .k2y_rel_enq              (k2y_rel_enq),              // output (dmu_dmc) => (dmu_ilu)
    .k2y_dbg_sel_a            (k2y_dbg_sel_a[5:0]),       // output (dmu_dmc) => (dmu_ilu)
    .k2y_dbg_sel_b            (k2y_dbg_sel_b[5:0]),       // output (dmu_dmc) => (dmu_ilu)
    .y2k_dbg_a                (y2k_dbg_a[7:0]),           // input  (dmu_dmc) <= (dmu_ilu)
    .y2k_dbg_b                (y2k_dbg_b[7:0]),           // input  (dmu_dmc) <= (dmu_ilu)
    .dsn_dmc_iei              (dsn_dmc_iei),              // input  (dmu_dmc) <= (dmu_ilu)
    .dmu_dbg_err_event        (dmu_dbg_err_event),        // input  (imu)     => ()
    .ds2cl_stall   	      (ds2cl_stall),      	  // output (dmu_dsn) => (dmu_dmc/clu)
    .dmu_cb0_run              (dmu_cb0_run),              // input  (dmu_dmc) <= (dmu_cb0) 
    .dmu_cb0_addr             (dmu_cb0_addr),             // input  (dmu_dmc) <= (dmu_cb0)
    .dmu_cb0_wdata_key        (dmu_cb0_wdata_key),        // input  (dmu_dmc) <= (dmu_cb0)
    .dmu_cb0_mmu_vtb_wr_en    (dmu_cb0_mmu_vtb_wr_en),    // input  (dmu_dmc) <= (dmu_cb0)
    .dmu_cb0_mmu_vtb_rd_en    (dmu_cb0_mmu_vtb_rd_en),    // input  (dmu_dmc) <= (dmu_cb0)
    .dmu_cb0_mmu_vtb_lkup_en  (dmu_cb0_mmu_vtb_lkup_en),  // input  (dmu_dmc) <= (dmu_cb0)
    .dmu_cb0_mmu_ptb_wr_en    (dmu_cb0_mmu_ptb_wr_en),    // input  (dmu_dmc) <= (dmu_cb0)
    .dmu_cb0_mmu_ptb_rd_en    (dmu_cb0_mmu_ptb_rd_en),    // input  (dmu_dmc) <= (dmu_cb0)
    .dmu_cb0_mmu_ptb_lkup_en  (dmu_cb0_mmu_ptb_lkup_en),  // input  (dmu_dmc) <= (dmu_cb0)
    .dmu_cb0_hld 	      (dmu_cb0_hld),  		  // input  (dmu_dmc) <= (dmu_cb0)
    .vtb2csr_rd               (vtb2csr_rd),               // output (dmu_dmc) => (dmu_cb0)
    .vtb_dout_4msb            (vtb_dout_4msb),            // output (dmu_dmc) => (dmu_cb0)
    .mmu_ptb_read_data        (mmu_ptb_read_data),        // output (dmu_dmc) => (dmu_cb0)
    .mmu_vtb_hit              (mmu_vtb_hit),              // output (dmu_dmc) => (dmu_cb0)
    .mmu_ptb_hit              (mmu_ptb_hit),              // output (dmu_dmc) => (dmu_cb0)
    .tdb_dout_8msb            (tdb_dout_8msb),		  // output (dmu_dmc) => (dmu_mb0)
    .dmu_mb0_run              (dmu_mb0_run),		  // input  (dmu_dmc) <= (dmu_mb0)
    .dmu_mb0_addr             (dmu_mb0_addr),		  // input  (dmu_dmc) <= (dmu_mb0)
    .dmu_mb0_wdata            (dmu_mb0_wdata),		  // input  (dmu_dmc) <= (dmu_mb0)
    .dmu_mb0_tdb_wr_en        (dmu_mb0_tdb_wr_en),        // input  (dmu_dmc) <= (dmu_mb0)
    .dmu_mb0_tdb_rd_en        (dmu_mb0_tdb_rd_en),        // input  (dmu_dmc) <= (dmu_mb0)
    .tdb2csr_rd               (tdb2csr_rd),		  // output (dmu_dmc) => (dmu_mb0)
    .dmu_mb0_dev_wr_en        (dmu_mb0_dev_wr_en),        // input  (dmu_dmc) <= (dmu_mb0)
    .dmu_mb0_dev_rd_en        (dmu_mb0_dev_rd_en),        // input  (dmu_dmc) <= (dmu_mb0)
    .dmu_mb0_tsb_wr_en        (dmu_mb0_tsb_wr_en),        // input  (dmu_dmc) <= (dmu_mb0)
    .dmu_mb0_tsb_rd_en        (dmu_mb0_tsb_rd_en),        // input  (dmu_dmc) <= (dmu_mb0)
    .dev_tsb_read_data        (dev_tsb_read_data),	  // output (dmu_dmc) => (dmu_mb0)
    .dmu_diu_read_data        (dmu_diu_read_data),        // output (dmu_dmc) => (dmu_mb0)
    .dmu_mb0_diu_wr_en        (dmu_mb0_diu_wr_en),        // input  (dmu_dmc) <= (dmu_mb0)
    .dmu_mb0_diu_rd_en        (dmu_mb0_diu_rd_en),        // input  (dmu_dmc) <= (dmu_mb0)
    .dmu_mb0_dou_dma_data_wr_en    (dmu_mb0_dou_dma_data_wr_en), // input  (dmu_dmc) <= (dmu_mb0)
    .dmu_mb0_dou_dma_data_rd_en    (dmu_mb0_dou_dma_data_rd_en), // input  (dmu_dmc) <= (dmu_mb0)
    .dmu_mb0_dou_pio_data_wr_en    (dmu_mb0_dou_pio_data_wr_en), // input  (dmu_dmc) <= (dmu_mb0)
    .dmu_mb0_dou_pio_data_rd_en    (dmu_mb0_dou_pio_data_rd_en),  // input  (dmu_dmc) <= (dmu_mb0)
    .dmu_dou_pio_read_data         (dmu_dou_pio_read_data),      // output (dmu_dmc) => (dmu_mb0)
    .dmu_dou_dma_read_data         (dmu_dou_dma_read_data),      // output (dmu_dmc) => (dmu_mb0)
    .efu_dmu_data		   (efu_dmu_data),	  // input efu to devtsb 
    .efu_dmu_xfer_en		   (efu_dmu_xfer_en),	  // input efu to devtsb
    .efu_dmu_clr		   (efu_dmu_clr),	  // input efu to devtsb
    .dmu_efu_data		   (dmu_efu_data),	  // output of devtsb to efu
    .dmu_efu_xfer_en		   (dmu_efu_xfer_en),	  // output of devtsb to efu
    .d2p_idb_rd		   	   (d2p_idb_rd),  	  // rd en to peu idb ram
    .d2p_req_id		   	   (d2p_req_id),	  // req id to peu for messages BP 8-18-05
    .p2d_npwr_stall_en		   (p2d_npwr_stall_en),	  // non-posted write stall enable from peu
    .il2cl_gr_16		   (il2cl_gr_16)	  // greater than 16 pio stall from ilu


    );
`endif //  `ifdef NO_DMC
   
`ifdef NO_DSN
`else
dmu_dsn dsn (
    .l1clk                (l1clk),                  // input  (dmu_dmc,dmu_dsn,dmu_ilu) <= ()
    .rst_l                (wmr_),                   // input  (dmu_dmc,dmu_dsn,dmu_ilu) <= ()
    .dmu_sii_hdr_vld      (dmu_sii_hdr_vld),        // output (dmu_dsn) => ()
    .dmu_sii_reqbypass    (dmu_sii_reqbypass),      // output (dmu_dsn) => ()
    .dmu_sii_datareq      (dmu_sii_datareq),        // output (dmu_dsn) => ()
    .dmu_sii_datareq16    (dmu_sii_datareq16),      // output (dmu_dsn) => ()
    .dmu_sii_data         (dmu_sii_data[127:0]),    // output (dmu_dsn) => ()
    .dmu_sii_parity       (dmu_sii_parity[7:0]),    // output (dmu_dsn) => ()
    .dmu_sii_be_parity    (dmu_sii_be_parity),      // output (dmu_dsn) => ()
    .dmu_sii_be           (dmu_sii_be[15:0]),       // output (dmu_dsn) => ()
    .sii_dmu_wrack_tag    (sii_dmu_wrack_tag[3:0]), // input  (dmu_dsn) <= ()
    .sii_dmu_wrack_par    (sii_dmu_wrack_par),      // input  (dmu_dsn) <= () n2 RAS
    .sii_dmu_wrack_vld    (sii_dmu_wrack_vld),      // input  (dmu_dsn) <= ()
    .sio_dmu_hdr_vld      (sio_dmu_hdr_vld),        // input  (dmu_dsn) <= ()
    .sio_dmu_data         (sio_dmu_data[127:0]),    // input  (dmu_dsn) <= ()
    .sio_dmu_parity       (sio_dmu_parity[7:0]),    // input  (dmu_dsn) <= ()
    .dmu_ncu_stall        (dmu_ncu_stall),          // output (dmu_dsn) => ()
    .ncu_dmu_vld          (ncu_dmu_vld),            // input  (dmu_dsn) <= ()
    .ncu_dmu_data         (ncu_dmu_data[31:0]),     // input  (dmu_dsn) <= ()
    .ncu_dmu_stall        (ncu_dmu_stall),          // input  (dmu_dsn) <= ()
    .dmu_ncu_vld          (dmu_ncu_vld),            // output (dmu_dsn) => ()
    .dmu_ncu_data         (dmu_ncu_data[31:0]),     // output (dmu_dsn) => ()
    .j2d_csr_ring_out     (j2d_csr_ring_out[31:0]), // output (dmu_dsn) => (dmu_dmc)
    .d2j_csr_ring_in      (d2j_csr_ring_in[31:0]),  // input  (dmu_dsn) <= (dmu_dmc)
    .ncu_dmu_pio_hdr_vld  (ncu_dmu_pio_hdr_vld),    // input  (dmu_dsn) <= ()
    .ncu_dmu_mmu_addr_vld (ncu_dmu_mmu_addr_vld),   // input  (dmu_dsn) <= ()
    .ncu_dmu_pio_data     (ncu_dmu_pio_data[63:0]), // input  (dmu_dsn) <= ()
    .dmu_ncu_wrack_vld    (dmu_ncu_wrack_vld),      // output (dmu_dsn) => ()
    .dmu_ncu_wrack_tag    (dmu_ncu_wrack_tag[3:0]), // output (dmu_dsn) => ()
    .dmu_ncu_wrack_par    (dmu_ncu_wrack_par),      // output (dmu_dsn) => () n2 RAS
    .dmu_ncu_d_pe    	  (dmu_ncu_d_pe),           // output (dmu_dsn) => () n2 RAS
    .dmu_ncu_siicr_pe     (dmu_ncu_siicr_pe),       // output (dmu_dsn) => () n2 RAS
    .dmu_ncu_ctag_ue      (dmu_ncu_ctag_ue),        // output (dmu_dsn) => () n2 RAS
    .dmu_ncu_ctag_ce      (dmu_ncu_ctag_ce),        // output (dmu_dsn) => () n2 RAS
    .dmu_ncu_ncucr_pe     (dmu_ncu_ncucr_pe),       // output (dmu_dsn) => () n2 RAS
    .dmu_ncu_ie    	  (dmu_ncu_ie),      	    // output (dmu_dsn) => () n2 RAS
    .ncu_dmu_mondo_ack    (ncu_dmu_mondo_ack),      // input  (dmu_dsn) <= ()
    .ncu_dmu_mondo_nack   (ncu_dmu_mondo_nack),     // input  (dmu_dsn) <= ()
    .ncu_dmu_mondo_id     (ncu_dmu_mondo_id[5:0]),  // input  (dmu_dsn) <= ()
    .ncu_dmu_mondo_id_par (ncu_dmu_mondo_id_par),   // input  (dmu_dsn) <= () n2 RAS
    .ncu_dmu_d_pei 	  (ncu_dmu_d_pei),   	    // input  (dmu_dsn) <= () n2 RAS
    .ncu_dmu_siicr_pei    (ncu_dmu_siicr_pei),      // input  (dmu_dsn) <= () n2 RAS
    .ncu_dmu_ctag_uei     (ncu_dmu_ctag_uei),       // input  (dmu_dsn) <= () n2 RAS
    .ncu_dmu_ctag_cei     (ncu_dmu_ctag_cei),       // input  (dmu_dsn) <= () n2 RAS
    .ncu_dmu_ncucr_pei    (ncu_dmu_ncucr_pei),      // input  (dmu_dsn) <= () n2 RAS
    .ncu_dmu_iei 	  (ncu_dmu_iei),            // input  (dmu_dsn) <= () n2 RAS
    .d2j_cmd              (d2j_cmd[3:0]),           // input  (dmu_dsn) <= (dmu_dmc)
    .d2j_addr             (d2j_addr[36:0]),         // input  (dmu_dsn) <= (dmu_dmc)
    .d2j_ctag             (d2j_ctag[15:0]),         // input  (dmu_dsn) <= (dmu_dmc)
    .d2j_cmd_vld          (d2j_cmd_vld),            // input  (dmu_dsn) <= (dmu_dmc)
    .d2j_data             (d2j_data[127:0]),        // input  (dmu_dsn) <= (dmu_dmc)
    .d2j_bmsk             (d2j_bmsk[15:0]),         // input  (dmu_dsn) <= (dmu_dmc)
    .d2j_data_par         (d2j_data_par[4:0]),      // input  (dmu_dsn) <= (dmu_dmc)
    .d2j_data_vld         (d2j_data_vld),           // input  (dmu_dsn) <= (dmu_dmc)
    .j2d_d_wrack_tag      (j2d_d_wrack_tag[3:0]),   // output (dmu_dsn) => (dmu_dmc)
    .j2d_d_wrack_vld      (j2d_d_wrack_vld),        // output (dmu_dsn) => (dmu_dmc)
    .d2j_p_wrack_tag      (d2j_p_wrack_tag[3:0]),   // input  (dmu_dsn) <= (dmu_dmc)
    .d2j_p_wrack_vld      (d2j_p_wrack_vld),        // input  (dmu_dsn) <= (dmu_dmc)
    .j2d_di_cmd           (j2d_di_cmd[1:0]),        // output (dmu_dsn) => (dmu_dmc)
    .j2d_di_ctag          (j2d_di_ctag[15:0]),      // output (dmu_dsn) => (dmu_dmc)
    .j2d_di_cmd_vld       (j2d_di_cmd_vld),         // output (dmu_dsn) => (dmu_dmc)
    .j2d_p_cmd            (j2d_p_cmd[3:0]),         // output (dmu_dsn) => (dmu_dmc)
    .j2d_p_addr           (j2d_p_addr[35:0]),       // output (dmu_dsn) => (dmu_dmc)
    .j2d_p_bmsk           (j2d_p_bmsk[15:0]),       // output (dmu_dsn) => (dmu_dmc)
    .j2d_p_ctag           (j2d_p_ctag[10:0]),       // output (dmu_dsn) => (dmu_dmc)
    .j2d_p_cmd_vld        (j2d_p_cmd_vld),          // output (dmu_dsn) => (dmu_dmc)
    .j2d_d_data           (j2d_d_data[127:0]),      // output (dmu_dsn) => (dmu_dmc)
    .j2d_d_data_par       (j2d_d_data_par[3:0]),    // output (dmu_dsn) => (dmu_dmc)
    .j2d_d_data_err       (j2d_d_data_err),         // output (dmu_dsn) => (dmu_dmc)
    .j2d_d_data_vld       (j2d_d_data_vld),         // output (dmu_dsn) => (dmu_dmc)
    .j2d_p_data           (j2d_p_data[127:0]),      // output (dmu_dsn) => (dmu_dmc)
    .j2d_p_data_par       (j2d_p_data_par[3:0]),    // output (dmu_dsn) => (dmu_dmc)
    .j2d_p_data_vld       (j2d_p_data_vld),         // output (dmu_dsn) => (dmu_dmc)
    .j2d_mmu_addr_vld     (j2d_mmu_addr_vld),       // output (dmu_dsn) => (dmu_dmc)
    .j2d_mmu_addr         (j2d_mmu_addr[42:6]),     // output (dmu_dsn) => (dmu_dmc)
    .dsn_dmc_iei          (dsn_dmc_iei),      	    // output (dmu_dsn) => (dmu_dmc)
    .cr2ds_dbg_sel_a      (cr2ds_dbg_sel_a[5:0]),   // input () <= (dmu_cru)
    .cr2ds_dbg_sel_b      (cr2ds_dbg_sel_b[5:0]),   // input () <= (dmu_cru)
    .ds2cr_dbg_a          (ds2cr_dbg_a[7:0]),       // output (dmu_dsn) => (dmu_dmc)
    .ds2cr_dbg_b          (ds2cr_dbg_b[7:0]),       // output (dmu_dsn) => (dmu_dmc)
    .dbg1_dmu_stall       (dbg1_dmu_stall),         // output (dmu_dsn) => (dmu_dmc)
    .dbg1_dmu_resume      (dbg1_dmu_resume),        // output (dmu_dsn) => (dmu_dmc)
    .dmu_dbg1_stall_ack   (dmu_dbg1_stall_ack),     // output (dmu_dsn) => (dmu_dmc)
    .ds2cl_stall   	  (ds2cl_stall)      	    // output (dmu_dsn) => (dmu_dmc/clu)
    );
`endif //  `ifdef NO_DSN
   
`ifdef NO_ILU
`else
dmu_ilu ilu (
    .l1clk                    (l1clk),                    // input  (dmu_dmc,dmu_dsn,dmu_ilu) <= ()
    .rst_wmr_                 (rst_wmr_),                 // input  (dmu_ilu) <= ()
    .rst_dmu_async_por_       (rst_dmu_async_por_),       // input  (dmu_ilu) <= ()
    .j2d_por_l                (por_),                     // input  (dmu_dmc,dmu_ilu) <= ()
    .j2d_rst_l                (wmr_),                     // input  (dmu_dmc,dmu_dsn,dmu_ilu) <= ()
    .j2d_instance_id          (j2d_instance_id),          // input  (dmu_ilu) <= ()
    .p2d_ihb_wptr             (p2d_ihb_wptr[6:0]),        // input  (dmu_ilu) <= ()
    .p2d_ihb_data             (p2d_ihb_data[127:0]),      // input  (dmu_ilu) <= ()
    .d2p_ihb_addr             (d2p_ihb_addr[5:0]),        // output (dmu_ilu) => ()
    .p2d_ihb_dpar             (p2d_ihb_dpar[3:0]),        // input  (dmu_ilu) <= ()
    .d2p_ihb_rd               (d2p_ihb_rd),               // output  (dmu_ilu) => ()
    .d2p_idb_addr             (d2p_idb_addr[7:0]),        // output (dmu_ilu) => ()
    .p2d_idb_data             (p2d_idb_data[127:0]),      // input  (dmu_ilu) <= ()
    .p2d_idb_dpar             (p2d_idb_dpar[3:0]),        // input  (dmu_ilu) <= ()
    .d2p_ibc_req              (d2p_ibc_req),              // output (dmu_ilu) => ()
    .p2d_ibc_ack              (p2d_ibc_ack),              // input  (dmu_ilu) <= ()
    .d2p_ibc_nhc              (d2p_ibc_nhc[7:0]),         // output (dmu_ilu) => ()
    .d2p_ibc_phc              (d2p_ibc_phc[7:0]),         // output (dmu_ilu) => ()
    .d2p_ibc_pdc              (d2p_ibc_pdc[11:0]),        // output (dmu_ilu) => ()
    .p2d_cto_req              (p2d_cto_req),              // input  (dmu_ilu) <= ()
    .p2d_cto_tag              (p2d_cto_tag[4:0]),         // input  (dmu_ilu) <= ()
    .d2p_cto_ack              (d2p_cto_ack),              // output (dmu_ilu) => ()
    .d2p_ech_wptr             (d2p_ech_wptr[5:0]),        // output (dmu_ilu) => ()
    .p2d_ech_rptr             (p2d_ech_rptr[5:0]),        // input  (dmu_ilu) <= ()
    .d2p_erh_wptr             (d2p_erh_wptr[5:0]),        // output (dmu_ilu) => ()
    .p2d_erh_rptr             (p2d_erh_rptr[5:0]),        // input  (dmu_ilu) <= ()
    .p2d_ecd_rptr             (p2d_ecd_rptr[7:0]),        // input  (dmu_ilu) <= ()
    .p2d_erd_rptr             (p2d_erd_rptr[7:0]),        // input  (dmu_ilu) <= ()
    .d2p_ehb_we               (d2p_ehb_we),               // output (dmu_ilu) => ()
    .d2p_ehb_addr             (d2p_ehb_addr[5:0]),        // output (dmu_ilu) => ()
    .d2p_ehb_data             (d2p_ehb_data[127:0]),      // output (dmu_ilu) => ()
    .d2p_ehb_dpar             (d2p_ehb_dpar[3:0]),        // output (dmu_ilu) => ()
    .d2p_edb_we               (d2p_edb_we),               // output (dmu_ilu) => ()
    .d2p_edb_addr             (d2p_edb_addr[7:0]),        // output (dmu_ilu) => ()
    .d2p_edb_data             (d2p_edb_data[127:0]),      // output (dmu_ilu) => ()
    .d2p_edb_dpar             (d2p_edb_dpar[3:0]),        // output (dmu_ilu) => ()
    .p2d_drain                (p2d_drain),                // input  (dmu_ilu) <= ()
    .p2d_mps                  (p2d_mps[2:0]),             // input  (dmu_ilu) <= ()
    .p2d_ue_int               (p2d_ue_int),               // input  (dmu_ilu) <= ()
    .p2d_ce_int               (p2d_ce_int),               // input  (dmu_ilu) <= ()
    .p2d_oe_int               (p2d_oe_int),               // input  (dmu_ilu) <= ()
    .k2y_buf_addr_vld_monitor (k2y_buf_addr_vld_monitor), // input  (dmu_ilu) <= (dmu_dmc)
    .k2y_buf_addr             (k2y_buf_addr[7:0]),        // input  (dmu_ilu) <= (dmu_dmc)
    .y2k_buf_data             (y2k_buf_data[127:0]),      // output (dmu_ilu) => (dmu_dmc)
    .y2k_buf_dpar             (y2k_buf_dpar[3:0]),        // output (dmu_ilu) => (dmu_dmc)
    .y2k_buf_addr_vld_monitor (y2k_buf_addr_vld_monitor), // output (dmu_ilu) => (dmu_dmc)
    .y2k_buf_addr             (y2k_buf_addr[7:0]),        // output (dmu_ilu) => (dmu_dmc)
    .k2y_buf_data             (k2y_buf_data[127:0]),      // input  (dmu_ilu) <= (dmu_dmc)
    .k2y_buf_dpar             (k2y_buf_dpar[3:0]),        // input  (dmu_ilu) <= (dmu_dmc)
    .k2y_rcd_deq              (k2y_rcd_deq),              // input  (dmu_ilu) <= (dmu_dmc)
    .y2k_rcd                  (y2k_rcd[115:0]),           // output (dmu_ilu) => (dmu_dmc)
    .y2k_rcd_enq              (y2k_rcd_enq),              // output (dmu_ilu) => (dmu_dmc)
    .k2y_rcd                  (k2y_rcd[123:0]),           // input  (dmu_ilu) <= (dmu_dmc)
    .k2y_rcd_enq              (k2y_rcd_enq),              // input  (dmu_ilu) <= (dmu_dmc)
    .y2k_rcd_deq              (y2k_rcd_deq),              // output (dmu_ilu) => (dmu_dmc)
    .k2y_rel_rcd              (k2y_rel_rcd[8:0]),         // input  (dmu_ilu) <= (dmu_dmc)
    .k2y_rel_enq              (k2y_rel_enq),              // input  (dmu_ilu) <= (dmu_dmc)
    .y2k_rel_rcd              (y2k_rel_rcd[8:0]),         // output (dmu_ilu) => (dmu_dmc)
    .y2k_rel_enq              (y2k_rel_enq),              // output (dmu_ilu) => (dmu_dmc)
    .k2y_dou_dptr             (k2y_dou_dptr[4:0]),        // input  (dmu_ilu) <= (dmu_dmc)
    .k2y_dou_err              (k2y_dou_err),              // input  (dmu_ilu) <= (dmu_dmc)
    .k2y_dou_vld              (k2y_dou_vld),              // input  (dmu_ilu) <= (dmu_dmc)
    .y2k_mps                  (y2k_mps[2:0]),             // output (dmu_ilu) => (dmu_dmc)
    .y2k_int_l                (y2k_int_l),                // output (dmu_ilu) => (dmu_dmc)
    .k2y_csr_ring_out         (k2y_csr_ring_out[31:0]),   // input  (dmu_ilu) <= (dmu_dmc)
    .y2k_csr_ring_in          (y2k_csr_ring_in[31:0]),    // output (dmu_ilu) => (dmu_dmc)
    .d2p_csr_req              (d2p_csr_req),              // output (dmu_ilu) => ()
    .p2d_csr_ack              (p2d_csr_ack),              // input  (dmu_ilu) <= ()
    .d2p_csr_rcd              (d2p_csr_rcd[95:0]),        // output (dmu_ilu) => ()
    .p2d_csr_req              (p2d_csr_req),              // input  (dmu_ilu) <= ()
    .d2p_csr_ack              (d2p_csr_ack),              // output (dmu_ilu) => ()
    .p2d_csr_rcd              (p2d_csr_rcd[95:0]),        // input  (dmu_ilu) <= ()
    .k2y_dbg_sel_a            (k2y_dbg_sel_a[5:0]),       // input  (dmu_ilu) <= (dmu_dmc)
    .k2y_dbg_sel_b            (k2y_dbg_sel_b[5:0]),       // input  (dmu_ilu) <= (dmu_dmc)
    .y2k_dbg_a                (y2k_dbg_a[7:0]),           // output (dmu_ilu) => (dmu_dmc)
    .y2k_dbg_b                (y2k_dbg_b[7:0]),           // output (dmu_ilu) => (dmu_dmc)
    .p2d_spare                (p2d_spare[4:0]),           // input  (dmu_ilu) <= ()
    .d2p_spare                (d2p_spare[4:0]),           // output (dmu_ilu) => ()
    .dmu_psr_rate_scale       (dmu_psr_rate_scale),       // output (dmu_ilu) => ()
    .dmu_psr_pll_en_sds0      (dmu_psr_pll_en_sds0),	  // output (dmu_ilu) => (peu)
    .dmu_psr_pll_en_sds1      (dmu_psr_pll_en_sds1),	  // output (dmu_ilu) => (peu)
    .dmu_psr_rx_en_b0_sds0    (dmu_psr_rx_en_b0_sds0),	  // output (dmu_ilu) => (peu)
    .dmu_psr_rx_en_b1_sds0    (dmu_psr_rx_en_b1_sds0),	  // output (dmu_ilu) => (peu)
    .dmu_psr_rx_en_b2_sds0    (dmu_psr_rx_en_b2_sds0),	  // output (dmu_ilu) => (peu)
    .dmu_psr_rx_en_b3_sds0    (dmu_psr_rx_en_b3_sds0),	  // output (dmu_ilu) => (peu)
    .dmu_psr_rx_en_b0_sds1    (dmu_psr_rx_en_b0_sds1),	  // output (dmu_ilu) => (peu)
    .dmu_psr_rx_en_b1_sds1    (dmu_psr_rx_en_b1_sds1),	  // output (dmu_ilu) => (peu)
    .dmu_psr_rx_en_b2_sds1    (dmu_psr_rx_en_b2_sds1),	  // output (dmu_ilu) => (peu)
    .dmu_psr_rx_en_b3_sds1    (dmu_psr_rx_en_b3_sds1),	  // output (dmu_ilu) => (peu)
    .dmu_psr_tx_en_b0_sds0    (dmu_psr_tx_en_b0_sds0),	  // output (dmu_ilu) => (peu)
    .dmu_psr_tx_en_b1_sds0    (dmu_psr_tx_en_b1_sds0),	  // output (dmu_ilu) => (peu)
    .dmu_psr_tx_en_b2_sds0    (dmu_psr_tx_en_b2_sds0),	  // output (dmu_ilu) => (peu)
    .dmu_psr_tx_en_b3_sds0    (dmu_psr_tx_en_b3_sds0),	  // output (dmu_ilu) => (peu)
    .dmu_psr_tx_en_b0_sds1    (dmu_psr_tx_en_b0_sds1),	  // output (dmu_ilu) => (peu)
    .dmu_psr_tx_en_b1_sds1    (dmu_psr_tx_en_b1_sds1),	  // output (dmu_ilu) => (peu)
    .dmu_psr_tx_en_b2_sds1    (dmu_psr_tx_en_b2_sds1),	  // output (dmu_ilu) => (peu)
    .dmu_psr_tx_en_b3_sds1    (dmu_psr_tx_en_b3_sds1),	  // output (dmu_ilu) => (peu)
    .tcu_test_protect         (tcu_test_protect),	  // input  (tcu)     => (ilu)
    .il2cl_gr_16              (il2cl_gr_16)	  	  // output (ilu)     => (crm)

    );
`endif //  `ifdef NO_ILU
   
`ifdef NO_MB0
`else
dmu_mb0 mb0 (
         .scan_in                        (tcu_dmu_mbist_scan_in),
         .scan_out                       (dmu_mb0_scanout),
         .l1clk                          (l1clk),
         .tcu_aclk                       (aclk),
         .tcu_bclk                       (bclk),
         .rst_                       	 (wmr_),
         .tcu_dmu_mb0_start              (tcu_dmu_mbist_start[0]),
         .dmu_mb0_bisi_mode              (tcu_mbist_bisi_en),
         .dmu_mb0_user_mode              (tcu_mbist_user_mode),
         .dmu_mb0_run                    (dmu_mb0_run),
         .dmu_mb0_addr			 (dmu_mb0_addr),
         .dmu_mb0_wdata			 (dmu_mb0_wdata),
         .dmu_mb0_diu_wr_en		 (dmu_mb0_diu_wr_en),
         .dmu_mb0_diu_rd_en		 (dmu_mb0_diu_rd_en),
         .dmu_mb0_tdb_wr_en		 (dmu_mb0_tdb_wr_en),
         .dmu_mb0_tdb_rd_en		 (dmu_mb0_tdb_rd_en),
         .dmu_mb0_dou_dma_data_wr_en	 (dmu_mb0_dou_dma_data_wr_en),
         .dmu_mb0_dou_dma_data_rd_en	 (dmu_mb0_dou_dma_data_rd_en),
         .dmu_mb0_dou_pio_data_wr_en	 (dmu_mb0_dou_pio_data_wr_en),
         .dmu_mb0_dou_pio_data_rd_en	 (dmu_mb0_dou_pio_data_rd_en),
         .dmu_mb0_dev_wr_en		 (dmu_mb0_dev_wr_en),
         .dmu_mb0_dev_rd_en		 (dmu_mb0_dev_rd_en),
         .dmu_mb0_tsb_wr_en		 (dmu_mb0_tsb_wr_en),
         .dmu_mb0_tsb_rd_en		 (dmu_mb0_tsb_rd_en),
         .dmu_mb0_done                   (dmu_tcu_mbist_done[0]),
         .dmu_mb0_fail			 (dmu_tcu_mbist_fail[0]),
         .dmu_diu_read_data		 (dmu_diu_read_data),
         .dmu_tdb_read_data		 ({tdb_dout_8msb,tdb2csr_rd}),
         .dmu_dou_dma_read_data		 (dmu_dou_dma_read_data),
         .dmu_dou_pio_read_data		 (dmu_dou_pio_read_data),
         .dev_tsb_read_data		 (dev_tsb_read_data)

);


`endif //  `ifdef NO_MB0


/* CAM BIST Place Holder */

`ifdef NO_CB0
`else
dmu_cb0 cb0 (
         .dmu_cb0_run			 (dmu_cb0_run),
         .dmu_cb0_addr			 (dmu_cb0_addr),
         .dmu_cb0_wdata_key		 (dmu_cb0_wdata_key),
         .dmu_cb0_mmu_vtb_wr_en          (dmu_cb0_mmu_vtb_wr_en),
         .dmu_cb0_mmu_vtb_rd_en          (dmu_cb0_mmu_vtb_rd_en),
         .dmu_cb0_mmu_vtb_lkup_en        (dmu_cb0_mmu_vtb_lkup_en),
         .dmu_cb0_mmu_ptb_wr_en          (dmu_cb0_mmu_ptb_wr_en),
         .dmu_cb0_mmu_ptb_rd_en          (dmu_cb0_mmu_ptb_rd_en),
         .dmu_cb0_mmu_ptb_lkup_en        (dmu_cb0_mmu_ptb_lkup_en),
         .dmu_cb0_hld			 (dmu_cb0_hld),
         .dmu_cb0_done			 (dmu_tcu_mbist_done[1]),
         .dmu_cb0_fail			 (dmu_tcu_mbist_fail[1]),
         .scan_out                       (dmu_tcu_mbist_scan_out),
         .l1clk                          (l1clk),
         .scan_in                        (dmu_mb0_scanout),
         .tcu_aclk                       (aclk),
         .tcu_bclk                       (bclk),
         .rst_                       	 (wmr_),
         .tcu_dmu_cb0_start		 (tcu_dmu_mbist_start[1]),
         .dmu_cb0_bisi_mode		 (tcu_mbist_bisi_en),
         .dmu_cb0_user_mode		 (tcu_mbist_user_mode),
         .mmu_vtb_read_data		 ({vtb_dout_4msb,vtb2csr_rd[5:1],vtb2csr_rd[29:6]}),
         .mmu_ptb_read_data		 (mmu_ptb_read_data),
         .mmu_vtb_hit			 (mmu_vtb_hit),
         .mmu_ptb_hit			 (mmu_ptb_hit)
) ;

`endif //  `ifdef NO_CB0




endmodule


