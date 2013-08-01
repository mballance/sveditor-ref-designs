// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_dsn.v
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
module dmu_dsn	(
   // clocks, scan
   l1clk,  
   rst_l,   

   // upstream from DMU TO SIU
   dmu_sii_hdr_vld,
   dmu_sii_reqbypass,
   dmu_sii_datareq, 
   dmu_sii_datareq16,
   dmu_sii_data,    
   dmu_sii_parity, 
   dmu_sii_be_parity, 
   dmu_sii_be,    

   // downstream from SIU TO DMU
   sio_dmu_hdr_vld,
                 
   sii_dmu_wrack_tag,
   sii_dmu_wrack_par,
   sii_dmu_wrack_vld,
   sio_dmu_data,
   sio_dmu_parity,

   // ========== NCU CSR ==========
                                                // downstream
   dmu_ncu_stall, 
   ncu_dmu_vld,  
   ncu_dmu_data,   
                                                // upstream
   ncu_dmu_stall,
   dmu_ncu_vld, 
   dmu_ncu_data,  
   // ========== NCU CSR ==========

   // ========== DMU RING ==========
                                                // PCI-ex CSR ring
   j2d_csr_ring_out, 
   d2j_csr_ring_in,  

   // ========== DMU RING ==========


   // ========== DMU PIO ==========
                                                // downstream
   ncu_dmu_pio_hdr_vld,
   ncu_dmu_mmu_addr_vld,
   ncu_dmu_pio_data, 
   ncu_dmu_d_pei,				// n2 RAS
   ncu_dmu_siicr_pei,				// n2 RAS
   ncu_dmu_ctag_uei,				// n2 RAS
   ncu_dmu_ctag_cei,				// n2 RAS
   ncu_dmu_ncucr_pei,				// n2 RAS
   ncu_dmu_iei,					// n2 RAS
   dmu_ncu_wrack_vld,
   dmu_ncu_wrack_tag,
   dmu_ncu_wrack_par,
   dmu_ncu_d_pe,				// n2 RAS
   dmu_ncu_siicr_pe,				// n2 RAS
   dmu_ncu_ctag_ue,				// n2 RAS
   dmu_ncu_ctag_ce,				// n2 RAS
   dmu_ncu_ncucr_pe,				// n2 RAS
   dmu_ncu_ie,					// n2 RAS
   // ========== DMU PIO ==========

   // ========== DMU Mondo ==========
   ncu_dmu_mondo_ack, 
   ncu_dmu_mondo_nack,
   ncu_dmu_mondo_id, 
   ncu_dmu_mondo_id_par, 
   // ========== DMU Mondo ==========

   // ========== DMU/DSN command port ==========
   d2j_cmd, 
   d2j_addr,
   d2j_ctag, 
   d2j_cmd_vld, 
   // ========== DMU/DSN command port==========

   // ========== DMU/DSN data port ==========
   d2j_data, 
   d2j_bmsk,
   d2j_data_par, 
   d2j_data_vld, 
   // ========== DMU/DSN data port==========

   // ========== CTM DMA Wrack Port ==========
   j2d_d_wrack_tag, 
   j2d_d_wrack_vld,
   // ========== CTM DMA Wrack Port==========

   // ========== CTM PIO Wrack Port ==========
   d2j_p_wrack_tag, 
   d2j_p_wrack_vld,
   // ========== CTM PIO Wrack Port==========

   // ========== CRM Command Completion Port ==========
   j2d_di_cmd, 
   j2d_di_ctag,
   j2d_di_cmd_vld,
   // ========== CRM Command Completion Port==========

   // ========== CRM Command Request Port ==========
   j2d_p_cmd, 
   j2d_p_addr,
   j2d_p_bmsk,
   j2d_p_ctag,
   j2d_p_cmd_vld,
   // ========== CRM Command Request Port==========

   // ========== CRM Data Completion Port ==========
   j2d_d_data, 
   j2d_d_data_par,
   j2d_d_data_err,
   j2d_d_data_vld,
   // ========== CRM Data Completion Port==========

   // ========== CRM Data Request Port ==========
   j2d_p_data, 
   j2d_p_data_par,
   j2d_p_data_vld,
   // ========== CRM Data Request Port==========

   // ========== DMU MMU Invalidate Port ==========
   j2d_mmu_addr_vld, 
   j2d_mmu_addr,
   // ========== DMU/DSN MMU Invalidate Port==========

   // ========== DSN MMU NCU force parity error in ram ==========
   dsn_dmc_iei, 
   // ========== DSN MMU NCU force parity error in ram ==========

   // ========== DSN CRU debug bus to dbg.sv  ==========
   cr2ds_dbg_sel_a, 
   cr2ds_dbg_sel_b, 
   ds2cr_dbg_a, 
   ds2cr_dbg_b, 
   // ========== DSN CRU debug bus to dbg.sv  ==========

   // ========== DSN stall to/from dbg.sv  ==========
   dbg1_dmu_stall, 
   dbg1_dmu_resume, 
   dmu_dbg1_stall_ack, 
   ds2cl_stall 
   // ========== DSN stall to/from dbg.sv  ==========
);




   // clocks, scan
   input                l1clk;                  // PINDEF:TOP io clock
   input                rst_l;			// PINDEF:TOP 


   // upstream from DMU TO SIU
   output		dmu_sii_hdr_vld;	// PINDEF:TOP DMU requesting to send packet to SIU
   output		dmu_sii_reqbypass;	// PINDEF:TOP DMU requesting to send packet to bypass queue of SIU
   output		dmu_sii_datareq;	// PINDEF:TOP DMU requesting to send packet w/data to SIU
   output		dmu_sii_datareq16;	// PINDEF:TOP DMU requesting to send packet w/16B only
   output [127:0] 	dmu_sii_data;		// PINDEF:TOP Packet from DMU to SIU
   output [7:0] 	dmu_sii_parity;		// PINDEF:TOP Packet parity from DMU to SIU
   output  		dmu_sii_be_parity;	// PINDEF:TOP byte enable parity from DMU to SIU
   output [15:0] 	dmu_sii_be;		// PINDEF:TOP Packet byte enables from DMU to SIU
   
   // downstream from SIU TO DMU
   input		sio_dmu_hdr_vld;	// PINDEF:TOP SIU requesting to send DMA rd cpl to DMU
   input [3:0]		sii_dmu_wrack_tag;	// PINDEF:TOP credit value returned to DMU for all DMA writes/int.
   input 		sii_dmu_wrack_par;	// PINDEF:TOP odd parity for sii_dmu_wrack_tag[3:0]
   input		sii_dmu_wrack_vld;	// PINDEF:TOP asserted by SII to indicate a DMA write credit is returned
   input [127:0] 	sio_dmu_data;		// PINDEF:TOP Packet from SIU to DMU
   input [7:0] 		sio_dmu_parity;		// PINDEF:TOP Packet parity from SIU to DMU




   // ========== NCU CSR ==========
                                         	// downstream
   output        dmu_ncu_stall;		       	// PINDEF:TOP DMUCSR back pressure to NCU.
   input         ncu_dmu_vld;  		       	// PINDEF:TOP NCU to DMU CSR data valid.
   input  [31:0] ncu_dmu_data;           	// PINDEF:TOP NCU to DMU CSR data bus.
                                         	// upstream
   input         ncu_dmu_stall;     	  	// PINDEF:TOP NCU back pressure to DMU.
   output        dmu_ncu_vld;         		// PINDEF:TOP DMU to NCU CSR data valid.
   output [31:0] dmu_ncu_data;           	// PINDEF:TOP DMU to NCU CSR data bus.
   // ========== NCU CSR ==========

   // ========== DMU CSR ==========
                                         	// PCI-ex ring
   output [31:0] j2d_csr_ring_out;		       	// csr ring out to PCI-ex(DMU/PEU)
   input  [31:0] d2j_csr_ring_in;		       	// csr ring in from PCI-ex(DMU/PEU)

   // ========== DMU CSR ==========


   // ========== DMU PIO ==========
                                         	// downstream
   input        ncu_dmu_pio_hdr_vld;       	// PINDEF:TOP NCU to DSN pio_data header is valid
   input        ncu_dmu_mmu_addr_vld;       	// PINDEF:TOP NCU to DMU pio_data mmu invalidate vector is valid
   input [63:0] ncu_dmu_pio_data;        	// PINDEF:TOP NCU to DMU pio_data bus.
   input        ncu_dmu_d_pei;                  // n2 RAS
   input        ncu_dmu_siicr_pei;              // n2 RAS
   input        ncu_dmu_ctag_uei;               // n2 RAS
   input        ncu_dmu_ctag_cei;               // n2 RAS
   input        ncu_dmu_ncucr_pei;              // n2 RAS
   input        ncu_dmu_iei;                    // n2 RAS
   output        dmu_ncu_wrack_vld; 	       	// PINDEF:TOP DMU to NCU release credit is valid
   output  [3:0] dmu_ncu_wrack_tag; 	       	// PINDEF:TOP DMU to NCU release credit value
   output       dmu_ncu_wrack_par; 	       	// PINDEF:TOP parity on dmu_ncu_wrack_tag[3:0]
   output       dmu_ncu_d_pe;                   // n2 RAS
   output       dmu_ncu_siicr_pe;               // n2 RAS
   output       dmu_ncu_ctag_ue;                // n2 RAS
   output       dmu_ncu_ctag_ce;                // n2 RAS
   output       dmu_ncu_ncucr_pe;               // n2 RAS
   output       dmu_ncu_ie;                     // n2 RAS
   // ========== DMU PIO ==========
   
   // ========== DMU Mondo ==========
   input         ncu_dmu_mondo_ack;      	// PINDEF:TOP Mondo Interrupt ack
   input         ncu_dmu_mondo_nack;     	// PINDEF:TOP Mondo Interrupt nack
   input  [5:0]  ncu_dmu_mondo_id;       	// PINDEF:TOP Mondo Interrupt ID
   input         ncu_dmu_mondo_id_par;       	// PINDEF:TOP odd parity on ncu_dmu_mondo_id
   // ========== DMU Mondo ==========

   // ========== DMU/DSN command port ==========
   input  [3:0]    d2j_cmd;			// PINDEF:BOTTOM
   input  [36:0]   d2j_addr;			// PINDEF:BOTTOM
   input  [15:0]   d2j_ctag;			// PINDEF:BOTTOM
   input           d2j_cmd_vld;			// PINDEF:BOTTOM
   // ========== DMU/DSN command port==========

   // ========== DMU/DSN data port ==========
   input  [127:0]  d2j_data;			// PINDEF:BOTTOM
   input  [15:0]   d2j_bmsk;			// PINDEF:BOTTOM
   input  [4:0]    d2j_data_par;		// PINDEF:BOTTOM
   input           d2j_data_vld;		// PINDEF:BOTTOM
   // ========== DMU/DSN data port==========

   // ========== CTM DMA Wrack Port ==========
   output [3:0]    j2d_d_wrack_tag;		// PINDEF:BOTTOM
   output          j2d_d_wrack_vld;		// PINDEF:BOTTOM
   // ========== CTM DMA Wrack Port==========

   // ========== CTM PIO Wrack Port ==========
   input [3:0]    d2j_p_wrack_tag;		// PINDEF:BOTTOM
   input          d2j_p_wrack_vld;		// PINDEF:BOTTOM
   // ========== CTM PIO Wrack Port==========

   // ========== CRM Command Completion Port ==========
   output [1:0]    j2d_di_cmd;			// PINDEF:BOTTOM
   output [15:0]   j2d_di_ctag;			// PINDEF:BOTTOM
   output          j2d_di_cmd_vld;		// PINDEF:BOTTOM
   // ========== CRM Command Completion Port==========

   // ========== CRM Command Request Port ==========
   output [3:0]    j2d_p_cmd;			// PINDEF:BOTTOM
   output [35:0]   j2d_p_addr;			// PINDEF:BOTTOM
   output [15:0]   j2d_p_bmsk;			// PINDEF:BOTTOM
   output [10:0]   j2d_p_ctag;			// PINDEF:BOTTOM
   output          j2d_p_cmd_vld;		// PINDEF:BOTTOM
   // ========== CRM Command Request Port==========

   // ========== CRM Data Completion Port ==========
   output [127:0]  j2d_d_data;			// PINDEF:BOTTOM
   output [3:0]    j2d_d_data_par;		// PINDEF:BOTTOM
   output          j2d_d_data_err;		// PINDEF:BOTTOM
   output          j2d_d_data_vld;		// PINDEF:BOTTOM
   // ========== CRM Data Completion Port==========

   // ========== CRM Data Request Port ==========
   output [127:0]  j2d_p_data;			// PINDEF:BOTTOM
   output [3:0]    j2d_p_data_par;		// PINDEF:BOTTOM
   output          j2d_p_data_vld;		// PINDEF:BOTTOM
   // ========== CRM Data Request Port==========

   // ========== DMU/DSN MMU Invalidate Port ==========
   output	   j2d_mmu_addr_vld;		// PINDEF:BOTTOM
   output [42:6]   j2d_mmu_addr;		// PINDEF:BOTTOM
   // ========== DMU/DSN MMU Invalidate Port==========

   // ========== DSN MMU NCU force parity error in ram ==========
   output	   dsn_dmc_iei;
   // ========== DSN MMU NCU force parity error in ram ==========

   // ========== DSN CRU debug bus ==========
   input  [`FIRE_DLC_DEBUG_SEL_WDTH-1:0]	   cr2ds_dbg_sel_a;
   input  [`FIRE_DLC_DEBUG_SEL_WDTH-1:0]	   cr2ds_dbg_sel_b;
   output [`FIRE_DEBUG_WDTH-1:0]	   ds2cr_dbg_a;
   output [`FIRE_DEBUG_WDTH-1:0]	   ds2cr_dbg_b;
   // ========== DSN CRU debug bus ==========

   // ========== DSN dbg stall ==========
   input  	   dbg1_dmu_stall;
   input  	   dbg1_dmu_resume;
   output 	   dmu_dbg1_stall_ack;
   output 	   ds2cl_stall;
   // ========== DSN dbg srall  ==========

  //------------------------------------------------------------------------
  //  dmu_dsn_ccc_fsm Wires
  //------------------------------------------------------------------------

wire				fsm2arb_done,rd_ack_vld,rd_nack_vld,fsm2pkt_valid;

  //------------------------------------------------------------------------
  //  dmu_dsn_ccc_pkt Wires
  //------------------------------------------------------------------------

wire   [31:0]  			j2d_csr_ring_out;

  //------------------------------------------------------------------------
  //  dmu_dsn_ccc_dep Wires
  //------------------------------------------------------------------------

wire   [63:0]  			data_out;
wire  				dep2fsm_acc_vio,dep2fsm_done,dep2fsm_valid;

  //------------------------------------------------------------------------
  //  dmu_dsn_ucb_flow Wires
  //------------------------------------------------------------------------

wire				rd_req_vld,wr_req_vld,ack_busy,reset;
wire	[5:0]			thr_id_in;
wire	[1:0]			buf_id_in;
wire	[26:0]			addr_in;
wire	[63:0]			data_in;
wire [`FIRE_DEBUG_WDTH-1:0]     ucb2ctl_dbg_grp_a_1;
wire [4:0]            		fsm2ctl_dbg_grp_b_1;
wire [2:0]            		pkt2ctl_dbg_grp_b_1;


dmu_dsn_ctl dmu_dsn_ctl (
    .l1clk                (l1clk),                  // input  (dmu_dsn_ctl) <= ()
    .rst_l                (rst_l),                  // input  (dmu_dsn_ccc_fsm,dmu_dsn_ccc_pkt,dmu_dsn_ctl) <= ()
    .reset                (reset),                  // output () => (dmu_dsn_ccc_fsm,dmu_dsn_ccc_pkt,dmu_dsn_ctl) 
    .dmu_sii_hdr_vld      (dmu_sii_hdr_vld),        // output (dmu_dsn_ctl) => ()
    .dmu_sii_reqbypass    (dmu_sii_reqbypass),      // output (dmu_dsn_ctl) => ()
    .dmu_sii_datareq      (dmu_sii_datareq),        // output (dmu_dsn_ctl) => ()
    .dmu_sii_datareq16    (dmu_sii_datareq16),      // output (dmu_dsn_ctl) => ()
    .dmu_sii_data         (dmu_sii_data[127:0]),    // output (dmu_dsn_ctl) => ()
    .dmu_sii_parity       (dmu_sii_parity[7:0]),    // output (dmu_dsn_ctl) => ()
    .dmu_sii_be_parity    (dmu_sii_be_parity),      // output (dmu_dsn_ctl) => ()
    .dmu_sii_be           (dmu_sii_be[15:0]),       // output (dmu_dsn_ctl) => ()
    .sio_dmu_hdr_vld      (sio_dmu_hdr_vld),        // input  (dmu_dsn_ctl) <= ()
    .sii_dmu_wrack_tag    (sii_dmu_wrack_tag[3:0]), // output (dmu_dsn_ctl) => ()
    .sii_dmu_wrack_par    (sii_dmu_wrack_par),      // output (dmu_dsn_ctl) => ()
    .sii_dmu_wrack_vld    (sii_dmu_wrack_vld),      // output (dmu_dsn_ctl) => ()
    .sio_dmu_data         (sio_dmu_data[127:0]),    // input  (dmu_dsn_ctl) <= ()
    .sio_dmu_parity       (sio_dmu_parity[7:0]),    // input  (dmu_dsn_ctl) <= ()
    .ncu_dmu_pio_hdr_vld  (ncu_dmu_pio_hdr_vld),    // input  (dmu_dsn_ctl) <= ()
    .ncu_dmu_mmu_addr_vld (ncu_dmu_mmu_addr_vld),   // input  (dmu_dsn_ctl) <= ()
    .ncu_dmu_pio_data     (ncu_dmu_pio_data[63:0]), // input  (dmu_dsn_ctl) <= ()
    .ncu_dmu_d_pei        (ncu_dmu_d_pei),          // input  (dmu_dsn_ctl) <= ()  n2 RAS
    .ncu_dmu_siicr_pei    (ncu_dmu_siicr_pei),      // input  (dmu_dsn_ctl) <= ()  n2 RAS
    .ncu_dmu_ctag_uei     (ncu_dmu_ctag_uei),       // input  (dmu_dsn_ctl) <= ()  n2 RAS
    .ncu_dmu_ctag_cei     (ncu_dmu_ctag_cei),       // input  (dmu_dsn_ctl) <= ()  n2 RAS
    .ncu_dmu_ncucr_pei    (ncu_dmu_ncucr_pei),      // input  (dmu_dsn_ctl) <= ()  n2 RAS
    .ncu_dmu_iei          (ncu_dmu_iei),            // input  (dmu_dsn_ctl) <= ()  n2 RAS
    .dmu_ncu_wrack_vld    (dmu_ncu_wrack_vld),      // input  (dmu_dsn_ctl) <= ()
    .dmu_ncu_wrack_tag    (dmu_ncu_wrack_tag[3:0]), // input  (dmu_dsn_ctl) <= ()
    .dmu_ncu_wrack_par    (dmu_ncu_wrack_par),      // input  (dmu_dsn_ctl) <= ()
    .dmu_ncu_d_pe         (dmu_ncu_d_pe),           // input  (dmu_dsn_ctl) <= () n2 RAS
    .dmu_ncu_siicr_pe     (dmu_ncu_siicr_pe),       // input  (dmu_dsn_ctl) <= () n2 RAS
    .dmu_ncu_ctag_ue      (dmu_ncu_ctag_ue),        // input  (dmu_dsn_ctl) <= () n2 RAS
    .dmu_ncu_ctag_ce      (dmu_ncu_ctag_ce),        // input  (dmu_dsn_ctl) <= () n2 RAS
    .dmu_ncu_ncucr_pe     (dmu_ncu_ncucr_pe),       // input  (dmu_dsn_ctl) <= () n2 RAS
    .dmu_ncu_ie           (dmu_ncu_ie),             // input  (dmu_dsn_ctl) <= () n2 RAS
    .ncu_dmu_mondo_ack    (ncu_dmu_mondo_ack),      // input  (dmu_dsn_ctl) <= ()
    .ncu_dmu_mondo_nack   (ncu_dmu_mondo_nack),     // input  (dmu_dsn_ctl) <= ()
    .ncu_dmu_mondo_id     (ncu_dmu_mondo_id[5:0]),  // input  (dmu_dsn_ctl) <= ()
    .ncu_dmu_mondo_id_par (ncu_dmu_mondo_id_par),   // input  (dmu_dsn_ctl) <= ()
    .d2j_cmd		  (d2j_cmd[3:0]),	    // input  (dmu_dsn_ctl) <= ()
    .d2j_addr		  (d2j_addr[36:0]),	    // input  (dmu_dsn_ctl) <= ()
    .d2j_ctag		  (d2j_ctag[15:0]), 	    // input  (dmu_dsn_ctl) <= ()
    .d2j_cmd_vld	  (d2j_cmd_vld),	    // input  (dmu_dsn_ctl) <= ()
    .d2j_data		  (d2j_data[127:0]),	    // input  (dmu_dsn_ctl) <= ()
    .d2j_bmsk		  (d2j_bmsk[15:0]),	    // input  (dmu_dsn_ctl) <= ()
    .d2j_data_par	  (d2j_data_par[4:0]),	    // input  (dmu_dsn_ctl) <= ()
    .d2j_data_vld	  (d2j_data_vld),	    // input  (dmu_dsn_ctl) <= ()
    .j2d_d_wrack_tag	  (j2d_d_wrack_tag[3:0]),   // output  (dmu_dsn_ctl) => ()
    .j2d_d_wrack_vld	  (j2d_d_wrack_vld),	    // output  (dmu_dsn_ctl) => ()
    .d2j_p_wrack_tag	  (d2j_p_wrack_tag[3:0]),   // input  (dmu_dsn_ctl) <= ()
    .d2j_p_wrack_vld	  (d2j_p_wrack_vld),	    // input  (dmu_dsn_ctl) <= ()
    .j2d_di_cmd		  (j2d_di_cmd[1:0]),	    // output  (dmu_dsn_ctl) => ()
    .j2d_di_ctag	  (j2d_di_ctag[15:0]),	    // output  (dmu_dsn_ctl) => ()
    .j2d_di_cmd_vld	  (j2d_di_cmd_vld),	    // output  (dmu_dsn_ctl) => ()
    .j2d_p_cmd		  (j2d_p_cmd[3:0]),	    // output  (dmu_dsn_ctl) => ()
    .j2d_p_addr		  (j2d_p_addr[35:0]),	    // output  (dmu_dsn_ctl) => ()
    .j2d_p_bmsk		  (j2d_p_bmsk[15:0]),	    // output  (dmu_dsn_ctl) => ()
    .j2d_p_ctag		  (j2d_p_ctag[10:0]),	    // output  (dmu_dsn_ctl) => ()
    .j2d_p_cmd_vld	  (j2d_p_cmd_vld),	    // output  (dmu_dsn_ctl) => ()
    .j2d_d_data		  (j2d_d_data[127:0]),	    // output  (dmu_dsn_ctl) => ()
    .j2d_d_data_par	  (j2d_d_data_par[3:0]),    // output  (dmu_dsn_ctl) => ()
    .j2d_d_data_err	  (j2d_d_data_err),	    // output  (dmu_dsn_ctl) => ()
    .j2d_d_data_vld	  (j2d_d_data_vld),	    // output  (dmu_dsn_ctl) => ()
    .j2d_p_data		  (j2d_p_data[127:0]),	    // output  (dmu_dsn_ctl) => ()
    .j2d_p_data_par	  (j2d_p_data_par[3:0]),    // output  (dmu_dsn_ctl) => ()
    .j2d_p_data_vld	  (j2d_p_data_vld),	    // output  (dmu_dsn_ctl) => ()
    .j2d_mmu_addr_vld	  (j2d_mmu_addr_vld),	    // output  (dmu_dsn_ctl) => ()
    .j2d_mmu_addr	  (j2d_mmu_addr[42:6]),	    // output  (dmu_dsn_ctl) => ()
    .dsn_dmc_iei	  (dsn_dmc_iei),	    // output  (dmu_dsn_ctl) => ()
    .cr2ds_dbg_sel_a	  (cr2ds_dbg_sel_a[5:0]),   // input  (dmu_dsn_ctl) <= ()
    .cr2ds_dbg_sel_b	  (cr2ds_dbg_sel_b[5:0]),   // input  (dmu_dsn_ctl) <= ()
    .ds2cr_dbg_a	  (ds2cr_dbg_a),	    // output  (dmu_dsn_ctl) => ()
    .ds2cr_dbg_b	  (ds2cr_dbg_b),	    // output  (dmu_dsn_ctl) => ()
    .ucb2ctl_dbg_grp_a_1  (ucb2ctl_dbg_grp_a_1),    // input  (dmu_dsn_ctl) <= (dmu_dsn_ucb_flow)
    .fsm2ctl_dbg_grp_b_1  (fsm2ctl_dbg_grp_b_1),    // input  (dmu_dsn_ctl) <= (dmu_dsn_ccc_fsm)
    .pkt2ctl_dbg_grp_b_1  (pkt2ctl_dbg_grp_b_1),    // input  (dmu_dsn_ctl) <= (dmu_dsn_ccc_fsm)
    .dbg1_dmu_stall       (dbg1_dmu_stall),	    // input  (dmu_dsn_ctl) <= (dmu_dsn_ccc_fsm)
    .dbg1_dmu_resume      (dbg1_dmu_resume),	    // input  (dmu_dsn_ctl) <= (dmu_dsn_ccc_fsm)
    .dmu_dbg1_stall_ack  (dmu_dbg1_stall_ack),    // input  (dmu_dsn_ctl) <= (dmu_dsn_ccc_fsm)
    .ds2cl_stall          (ds2cl_stall)	    	    // input  (dmu_dsn_ctl) <= (dmu_dsn_ccc_fsm)


    );


dmu_dsn_ccc_fsm dmu_dsn_ccc_fsm (
    .clk                (l1clk),              // input  (dmu_dsn_ccc_fsm,dmu_dsn_ccc_pkt) <= ()
    .rst_l              (rst_l),              // input  (dmu_dsn_ccc_fsm,dmu_dsn_ccc_pkt,dmu_dsn_ctl) <= ()
    .rd_req_vld         (rd_req_vld),         // input  (dmu_dsn_ccc_pkt) <= (dmu_dsn_ucb_flow)
    .wr_req_vld         (wr_req_vld),         // input  (dmu_dsn_ccc_pkt) <= (dmu_dsn_ucb_flow)
    .dep2fsm_acc_vio    (dep2fsm_acc_vio),    // input  (dmu_dsn_ccc_fsm) <= (dmu_dsn_ccc_dep)
    .dep2fsm_done       (dep2fsm_done),       // input  (dmu_dsn_ccc_fsm) <= (dmu_dsn_ccc_dep)
    .dep2fsm_valid      (dep2fsm_valid),      // input  (dmu_dsn_ccc_fsm) <= (dmu_dsn_ccc_dep)
    .ack_busy           (ack_busy),           // input  (dmu_dsn_ccc_fsm) <= (dmu_dsn_ucb_flow)
    .fsm2arb_done       (fsm2arb_done),       // output (dmu_dsn_ccc_fsm) => (dmu_dsn_ucb_flow)
    .rd_ack_vld         (rd_ack_vld),         // output (dmu_dsn_ccc_fsm) => (dmu_dsn_ucb_flow)
    .rd_nack_vld        (rd_nack_vld),        // output (dmu_dsn_ccc_fsm) => (dmu_dsn_ucb_flow)
    .fsm2pkt_valid      (fsm2pkt_valid),      // output (dmu_dsn_ccc_fsm) => (dmu_dsn_ccc_pkt)
    .fsm2ctl_dbg_grp_b_1  (fsm2ctl_dbg_grp_b_1[4:0])  // output (dmu_dsn_ccc_fsm) => (dmu_dsn_ctl)
    );

dmu_dsn_ccc_pkt dmu_dsn_ccc_pkt (
    .clk             (l1clk),           // input  (dmu_dsn_ccc_fsm,dmu_dsn_ccc_pkt) <= ()
    .rst_l           (rst_l),           // input  (dmu_dsn_ccc_fsm,dmu_dsn_ccc_pkt,dmu_dsn_ctl) <= ()
    .cdp2pkt_data    (data_in[63:0]),   // input  (dmu_dsn_ccc_pkt) <= (dmu_dsn_ucb_flow)
    .buf_id_in       (buf_id_in[1:0]),  // input  (dmu_dsn_ccc_pkt) <= (dmu_dsn_ucb_flow)
    .cdp2pkt_addr    (addr_in[26:0]),   // input  (dmu_dsn_ccc_pkt) <= (dmu_dsn_ucb_flow)
    .fsm2pkt_valid   (fsm2pkt_valid),   // input  (dmu_dsn_ccc_pkt) <= (dmu_dsn_ccc_fsm)
    .wr_req_vld      (wr_req_vld),      // input  (dmu_dsn_ccc_pkt) <= (dmu_dsn_ucb_flow)
    .j2d_csr_ring_out    (j2d_csr_ring_out[31:0]),// output (dmu_dsn_ccc_pkt) => ()
    .pkt2ctl_dbg_grp_b_1    (pkt2ctl_dbg_grp_b_1[2:0])// output (dmu_dsn_ccc_pkt) => ()
    );

dmu_dsn_ccc_dep dmu_dsn_ccc_dep (
    .clk             (l1clk),           // input  (dmu_dsn_ccc_dep,dmu_dsn_ccc_pkt) <= ()
    .rst_l           (rst_l),           // input  (dmu_dsn_ccc_dep,dmu_dsn_ccc_pkt,dmu_dsn_ctl) <= ()
    .dep2cdp_data    (data_out[63:0]),  // output (dmu_dsn_ccc_dep) => (dmu_dsn_ucb_flow)
    .dep2fsm_acc_vio (dep2fsm_acc_vio), // output (dmu_dsn_ccc_dep) => (dep2fsm_acc_vio)
    .dep2fsm_done    (dep2fsm_done),    // output (dmu_dsn_ccc_dep) => (dep2fsm_done)
    .dep2fsm_valid   (dep2fsm_valid),   // output (dmu_dsn_ccc_dep) => (dep2fsm_valid)
    .d2j_csr_ring_in     (d2j_csr_ring_in[31:0])// input  (dmu_dsn_ccc_dep) <= ()
    );



dmu_dsn_ucb_flow dmu_dsn_ucb_flow (
    .enl2clk       (l1clk),              // input  (dmu_dsn_ucb_flow,dmu_dsn_ucb_in32,dmu_dsn_ucb_out32) <= ()
    .reset         (reset),              // input  (dmu_dsn_ucb_flow,dmu_dsn_ucb_in32,dmu_dsn_ucb_out32) <= ()
    .ncu_dmu_vld   (ncu_dmu_vld),        // input  (dmu_dsn_ucb_flow) <= ()
    .ncu_dmu_data  (ncu_dmu_data[31:0]), // input  (dmu_dsn_ucb_flow) <= ()
    .dmu_ncu_stall (dmu_ncu_stall),      // output (dmu_dsn_ucb_flow) => ()
    .dmu_ncu_vld   (dmu_ncu_vld),        // output (dmu_dsn_ucb_flow) => ()
    .dmu_ncu_data  (dmu_ncu_data[31:0]), // output (dmu_dsn_ucb_flow) => ()
    .ncu_dmu_stall (ncu_dmu_stall),      // input  (dmu_dsn_ucb_flow) <= ()
    .rd_req_vld    (rd_req_vld),         // output (dmu_dsn_ucb_flow) => (dmu_dsn_ucb_flow)
    .wr_req_vld    (wr_req_vld),         // output (dmu_dsn_ucb_flow) => (dmu_dsn_ucb_flow)
    .thr_id_in     (thr_id_in[5:0]),     // output (dmu_dsn_ucb_flow) => (dmu_dsn_ucb_flow)
    .buf_id_in     (buf_id_in[1:0]),     // output (dmu_dsn_ucb_flow) => (dmu_dsn_ucb_flow)
    .addr_in       (addr_in[26:0]),      // output (dmu_dsn_ucb_flow) => (dmu_dsn_ucb_flow)
    .data_in       (data_in[63:0]),      // output (dmu_dsn_ucb_flow) => (dmu_dsn_ucb_flow)
    .req_acpted    (fsm2arb_done),       // input  (dmu_dsn_ucb_flow) <= (dmu_dsn_ccc_fsm)
    .rd_ack_vld    (rd_ack_vld),         // input  (dmu_dsn_ucb_flow) <= (dmu_dsn_ucb_fsm)
    .rd_nack_vld   (rd_nack_vld),        // input  (dmu_dsn_ucb_flow) <= (dmu_dsn_ucb_fsm)
    .thr_id_out    (thr_id_in[5:0]),     // input  (dmu_dsn_ucb_flow) <= (dmu_dsn_ucb_flow)
    .buf_id_out    (buf_id_in[1:0]),     // input  (dmu_dsn_ucb_flow) <= (dmu_dsn_ucb_flow)
    .data_out      (data_out[63:0]),     // input  (dmu_dsn_ucb_flow) <= (dmu_dsn_ccc_dep)
    .ack_busy      (ack_busy),            // output (dmu_dsn_ucb_flow) => (dmu_dsn_ucb_fsm)
    .ucb2ctl_dbg_grp_a_1 (ucb2ctl_dbg_grp_a_1)  // output (dmu_dsn_ucb_flow) => (dmu_dsn_ctl)
    );



endmodule


