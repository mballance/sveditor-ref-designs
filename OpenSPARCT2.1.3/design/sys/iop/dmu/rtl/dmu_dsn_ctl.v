// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_dsn_ctl.v
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
module dmu_dsn_ctl	(
   // clocks, scan
   l1clk,  
   rst_l,   
   reset,   

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


   // ========== DMU PIO ==========
                                                // downstream
   ncu_dmu_pio_hdr_vld,
   ncu_dmu_mmu_addr_vld,
   ncu_dmu_pio_data, 
   ncu_dmu_d_pei,		// n2 RAS
   ncu_dmu_siicr_pei,		// n2 RAS
   ncu_dmu_ctag_uei,		// n2 RAS
   ncu_dmu_ctag_cei,		// n2 RAS
   ncu_dmu_ncucr_pei,		// n2 RAS
   ncu_dmu_iei,			// n2 RAS
   dmu_ncu_wrack_vld,
   dmu_ncu_wrack_tag,
   dmu_ncu_wrack_par,		// n2 RAS
   dmu_ncu_d_pe,		// n2 RAS
   dmu_ncu_siicr_pe,		// n2 RAS
   dmu_ncu_ctag_ue,		// n2 RAS
   dmu_ncu_ctag_ce,		// n2 RAS
   dmu_ncu_ncucr_pe,		// n2 RAS
   dmu_ncu_ie,			// n2 RAS
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

   // ========== DSN/MMU force parity error ==========
   dsn_dmc_iei,
   // ========== DSN/MMU force parity error ==========

   // ========== DSN CRU debug bus==========
   cr2ds_dbg_sel_a,
   cr2ds_dbg_sel_b,
   ds2cr_dbg_a,
   ds2cr_dbg_b,
   ucb2ctl_dbg_grp_a_1,
   fsm2ctl_dbg_grp_b_1,
   pkt2ctl_dbg_grp_b_1,
   // ========== DSN CRU debug bus==========

   // ========== DSN dbg stall ==========
   dbg1_dmu_stall,
   dbg1_dmu_resume,
   dmu_dbg1_stall_ack,
   ds2cl_stall
   // ========== DSN dbg stall ==========
);



   // clocks, scan
   input                l1clk;                  //  io clock
   input                rst_l;			//  
   output               reset;			//  


   // upstream from DMU TO SIU
   output		dmu_sii_hdr_vld;	//  DMU requesting to send packet to SIU
   output		dmu_sii_reqbypass;	//  DMU requesting to send packet to bypass queue of SIU
   output		dmu_sii_datareq;	//  DMU requesting to send packet w/data to SIU
   output		dmu_sii_datareq16;	//  DMU requesting to send packet w/16B only
   output [127:0] 	dmu_sii_data;		//  Packet from DMU to SIU
   output [7:0] 	dmu_sii_parity;		//  Packet parity from DMU to SIU
   output 		dmu_sii_be_parity;	//  byte enable parity from DMU to SIU
   output [15:0] 	dmu_sii_be;		//  Packet byte enables from DMU to SIU
   
   // downstream from SIU TO DMU
   input		sio_dmu_hdr_vld;	//  SIU requesting to send DMA rd cpl to DMU
   input [3:0]		sii_dmu_wrack_tag;	//  credit value returned to DMU for all DMA writes/int.
   input 		sii_dmu_wrack_par;	//  n2 RAS, odd parity on sii_dmu_wrack_tag, drop j2d_d_wrack_vld if error
   input		sii_dmu_wrack_vld;	//  asserted by SII to indicate a DMA write credit is returned
   input [127:0] 	sio_dmu_data;		//  Packet from SIU to DMU
   input [7:0] 		sio_dmu_parity;		//  Packet parity from SIU to DMU



   // ========== DMU PIO ==========
                                         	// downstream
   input        ncu_dmu_pio_hdr_vld;       	//  NCU to DSN pio_data header is valid
   input        ncu_dmu_mmu_addr_vld;       	//  NCU to DMU pio_data mmu invalidate vector is valid
   input [63:0] ncu_dmu_pio_data;        	//  NCU to DMU pio_data bus.
   input        ncu_dmu_d_pei;               // n2 RAS
   input        ncu_dmu_siicr_pei;           // n2 RAS
   input        ncu_dmu_ctag_uei;            // n2 RAS
   input        ncu_dmu_ctag_cei;            // n2 RAS
   input        ncu_dmu_ncucr_pei;           // n2 RAS
   input        ncu_dmu_iei;                 // n2 RAS
   output        dmu_ncu_wrack_vld; 	       	//  DMU to NCU release credit is valid
   output  [3:0] dmu_ncu_wrack_tag; 	       	//  DMU to NCU release credit value
   output       dmu_ncu_wrack_par; 	       	//  DMU to NCU parity on dmu_ncu_wrack_tag
   output       dmu_ncu_d_pe;                // n2 RAS
   output       dmu_ncu_siicr_pe;            // n2 RAS
   output       dmu_ncu_ctag_ue;             // n2 RAS
   output       dmu_ncu_ctag_ce;             // n2 RAS
   output       dmu_ncu_ncucr_pe;            // n2 RAS
   output       dmu_ncu_ie;                  // n2 RAS
   // ========== DMU PIO ==========
   
   // ========== DMU Mondo ==========
   input         ncu_dmu_mondo_ack;      	//  Mondo Interrupt ack
   input         ncu_dmu_mondo_nack;     	//  Mondo Interrupt nack
   input  [5:0]  ncu_dmu_mondo_id;       	//  Mondo Interrupt ID
   input         ncu_dmu_mondo_id_par;       	//  Mondo Interrupt ID par(odd), if error drop j2d_di_cmd_vld packet to dmc
   // ========== DMU Mondo ==========

   // ========== DMU/DSN command port ==========
   input  [3:0]    d2j_cmd;                     // 
   input  [36:0]   d2j_addr;                    // 
   input  [15:0]   d2j_ctag;                    // 
   input           d2j_cmd_vld;                 // 
   // ========== DMU/DSN command port==========

   // ========== DMU/DSN data port ==========
   input  [127:0]  d2j_data;                    // 
   input  [15:0]   d2j_bmsk;                    // 
   input  [4:0]    d2j_data_par;                // 
   input           d2j_data_vld;                // 
   // ========== DMU/DSN data port==========

   // ========== CTM DMA Wrack Port ==========
   output [3:0]    j2d_d_wrack_tag;             // 
   output          j2d_d_wrack_vld;             // 
   // ========== CTM DMA Wrack Port==========

   // ========== CTM PIO Wrack Port ==========
   input [3:0]    d2j_p_wrack_tag;             // 
   input          d2j_p_wrack_vld;             // 
   // ========== CTM PIO Wrack Port==========

   // ========== CRM Command Completion Port ==========
   output [1:0]    j2d_di_cmd;                  // 
   output [15:0]   j2d_di_ctag;                 // 
   output          j2d_di_cmd_vld;              // 
   // ========== CRM Command Completion Port==========

   // ========== CRM Command Request Port ==========
   output [3:0]    j2d_p_cmd;                   // 
   output [35:0]   j2d_p_addr;                  // 
   output [15:0]   j2d_p_bmsk;                  // 
   output [10:0]   j2d_p_ctag;                  // 
   output          j2d_p_cmd_vld;               // 
   // ========== CRM Command Request Port==========

   // ========== CRM Data Completion Port ==========
   output [127:0]  j2d_d_data;                  // 
   output [3:0]    j2d_d_data_par;              // 
   output          j2d_d_data_err;              // 
   output          j2d_d_data_vld;              // 
   // ========== CRM Data Completion Port==========

   // ========== CRM Data Request Port ==========
   output [127:0]  j2d_p_data;                  // 
   output [3:0]    j2d_p_data_par;              // 
   output          j2d_p_data_vld;              // 
   // ========== CRM Data Request Port==========

   // ========== DMU/DSN MMU Invalidate Port ==========
   output          j2d_mmu_addr_vld;            // 
   output [42:6]   j2d_mmu_addr;                // 
   // ========== DMU/DSN MMU Invalidate Port==========

   // ========== DSN/MMU force parity error ==========
   output	   dsn_dmc_iei;
   // ========== DSN/MMU force parity error ==========

   // ========== DSN CRU debug bus==========
   input [`FIRE_DLC_DEBUG_SEL_WDTH-1:0]	   cr2ds_dbg_sel_a;
   input [`FIRE_DLC_DEBUG_SEL_WDTH-1:0]	   cr2ds_dbg_sel_b;
   output [`FIRE_DEBUG_WDTH-1:0]	   ds2cr_dbg_a;
   output [`FIRE_DEBUG_WDTH-1:0]	   ds2cr_dbg_b;
   input [`FIRE_DEBUG_WDTH-1:0]	   	   ucb2ctl_dbg_grp_a_1;
   input [4:0]	   	   		   fsm2ctl_dbg_grp_b_1;
   input [2:0]	   	   		   pkt2ctl_dbg_grp_b_1;
   // ========== DSN CRU debug bus==========

   // ========== DSN dbg stall ==========
   input 	   dbg1_dmu_stall;
   input 	   dbg1_dmu_resume;
   output 	   dmu_dbg1_stall_ack;
   output 	   ds2cl_stall;
   // ========== DSN dbg stall ==========


assign	reset = ~rst_l;


// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  reg [127:0]                              d2j_data_d1;
  reg [42:0]				   pio_pa;
  reg [15:0]                               dmu_sii_be,sio_dmc_tag;
  reg                                 	   dmu_sii_parity_be;
  wire [7:0]                               dmu_sii_parity;
  reg [3:0]                                pio_credit_id;
  reg [7:0]                                pio_byte_cnt;
  reg [5:0]				   sio_dmc_tag_ecc;
  reg					   sio_dmu_hdr_vld_d1,pio_read,mmu_addr_vld,j2d_p_cmd_vld;
  reg					   dsn_sii_cmd_7,sio_dmu_ue,sio_dmu_de;
  reg [2:0]				   hdr_cnt,nxt_hdr_cnt;
  reg [1:0]				   pio_cmd_map;
  reg [6:0]				   pio_id;
  reg [7:0]				   pio_rd_bmsk;
  reg [15:0]				   pio_bmsk;
  reg [11:8]				   d2j_ctag_d1;
  reg					   ncu_dmu_d_pei_d1,ncu_dmu_siicr_pei_d1,ncu_dmu_ctag_uei_d1;
  reg					   ncu_dmu_ctag_cei_d1,ncu_dmu_ncucr_pei_d1,ncu_dmu_iei_d1;
  reg					   force_dmu_sii_bad_par_d1;
  wire					   force_dmu_sii_bad_par;
  wire					   dmu_ncu_d_pe_in,dmu_ncu_siicr_pe_in,dmu_ncu_ctag_ue_in;
  wire					   dmu_ncu_ctag_ce_in,dmu_ncu_ncucr_pe_in,dmu_ncu_ie_in;
  reg					   dmu_ncu_d_pe,dmu_ncu_siicr_pe,dmu_ncu_ctag_ue;
  reg					   dmu_ncu_ctag_ce,dmu_ncu_ncucr_pe,dmu_ncu_ie;
  wire [7:0]				   calc_sio_dmu_data_par;
  wire [4:0]				   calc_d2j_data_par;
  wire [127:0]                             dsn_sii_hdr,d2j_pio_data,d2j_data_out;
  wire [7:0]                               dsn_sii_cmd,data_in,data_out;
  wire					   dsn_sii_to,dsn_sii_be,dsn_sii_ue,read,write,fifo_empty,mondo_cmd_vld;
  wire [1:0]				   adr_par;
  wire					   cmd_par,sio_dsn_pe;
  wire [1:0]				   pio_cpl_bus_align;
  wire [15:0]				   ctag_to_siu;
  wire [5:0]				   hdr_ecc;
  wire [17:0]				   sio_dsn_hdr_ecc;
  wire [15:0]				   sio_dmc_tag_corrected;
  wire [2:0]				   pio_bmsk_sel;
  reg  [3:0]				   enable_pe_err;

 reg  [`FIRE_DEBUG_WDTH-1:0]                  n_dsn_dbg_a;
 reg  [`FIRE_DEBUG_WDTH-1:0]                  n_dsn_dbg_b;
 reg  [`FIRE_DEBUG_WDTH-1:0]                  ds2cr_dbg_a;
 reg  [`FIRE_DEBUG_WDTH-1:0]                  ds2cr_dbg_b;
 wire  [`FIRE_DEBUG_WDTH-1:0]                 n_dbg_grp_a_2,n_dbg_grp_a_3 ;
 wire  [`FIRE_DEBUG_WDTH-1:0]                 n_dbg_grp_b_2 ;


// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------
// checker to verify on pio rd cpl's that bmsk is only valid on one of the 64 bits
/* ////0in assert -var (((d2j_bmsk[15:0] & `MASK1) == 16'h0000)
                    || ((d2j_bmsk[15:0] & `MASK2) == 16'h0000))
               -active (d2j_data_vld & d2j_cmd[3])
               -module dmu_dsn_ctl
                -name pio_rd_cpl_bmsk
*/
//BP n2 10-06-04 checker to make sure that DMC does not send back to back
// data transactions, because the DSN inserts a header thus it needs 1
// extra cycle
// first for all dma writes, which are 4 data beats
/* 0in assert_follower -leader (d2j_cmd_vld & d2j_data_vld & ((d2j_cmd[3:0] == 4'b0000) || 
								(d2j_cmd[3:0] == 4'b0001)) )
			-follower ( ~d2j_cmd_vld )
			-max 4
			-min 1
*/
// second for pio 16 byte read return, interrupts, pio rd return errors
/* 0in assert_follower -leader (d2j_cmd_vld & d2j_data_vld & ((d2j_cmd[3:0] == 4'b0100) || 
								(d2j_cmd[3:0] == 4'b1000) ))
			-follower ( ~d2j_cmd_vld )
			-max 1
			-min 1
*/
// ----------------------------------------------------------------------------
// flops used in DMU/DSN xface 
// ----------------------------------------------------------------------------
always @(posedge l1clk ) 
	if (~rst_l) begin
    d2j_data_d1[127:0]          <= 128'b0;
    dmu_sii_be[15:0]      	<= 16'b0;
    dmu_sii_parity_be            <= 1'b0;
    dsn_sii_cmd_7         	<= 1'b0;
    d2j_ctag_d1[11:8]           <= 4'b0;
    ncu_dmu_d_pei_d1   		<= 1'b0;
    ncu_dmu_siicr_pei_d1   	<= 1'b0;
    ncu_dmu_ctag_uei_d1   	<= 1'b0;
    ncu_dmu_ctag_cei_d1   	<= 1'b0;
    ncu_dmu_ncucr_pei_d1 	<= 1'b0;
    ncu_dmu_iei_d1   		<= 1'b0;
    dmu_ncu_d_pe   		<= 1'b0;
    dmu_ncu_siicr_pe   		<= 1'b0;
    dmu_ncu_ctag_ue   		<= 1'b0;
    dmu_ncu_ctag_ce   		<= 1'b0;
    dmu_ncu_ncucr_pe   		<= 1'b0;
    dmu_ncu_ie   		<= 1'b0;
    force_dmu_sii_bad_par_d1 	<= 1'b0;
	end
    else begin
    if (d2j_data_vld || 						    // for normal dma writes
		(d2j_cmd_vld && d2j_cmd[3] && ~d2j_cmd[2] && d2j_cmd[1]) )  // if cpl err( TO or BERR)
			 d2j_data_d1[127:0]         <= d2j_data[127:0];
    if (d2j_data_vld )   dmu_sii_be[15:0]      	    <= d2j_bmsk[15:0];
    if (d2j_data_vld )   dmu_sii_parity_be           <= d2j_data_par[0];
    if (d2j_cmd_vld  )   dsn_sii_cmd_7         	    <= d2j_cmd[3];
    if (d2j_cmd_vld  )   d2j_ctag_d1[11:8]          <= d2j_ctag[11:8];
    			 ncu_dmu_d_pei_d1    	    <= ncu_dmu_d_pei;
    			 ncu_dmu_siicr_pei_d1       <= ncu_dmu_siicr_pei;
    if(sio_dmu_hdr_vld)	 ncu_dmu_ctag_uei_d1   	    <= ncu_dmu_ctag_uei;
    			 ncu_dmu_ctag_cei_d1   	    <= ncu_dmu_ctag_cei;
    			 ncu_dmu_ncucr_pei_d1 	    <= ncu_dmu_ncucr_pei;
    			 ncu_dmu_iei_d1   	    <= ncu_dmu_iei;
		         dmu_ncu_d_pe   	    <= dmu_ncu_d_pe_in;
		         dmu_ncu_siicr_pe   	    <= dmu_ncu_siicr_pe_in;
		         dmu_ncu_ctag_ue   	    <= dmu_ncu_ctag_ue_in;
		         dmu_ncu_ctag_ce   	    <= dmu_ncu_ctag_ce_in;
		         dmu_ncu_ncucr_pe   	    <= dmu_ncu_ncucr_pe_in;
		         dmu_ncu_ie   		    <= dmu_ncu_ie_in;
		         force_dmu_sii_bad_par_d1   <= force_dmu_sii_bad_par;
        end

assign	dmu_ncu_ie_in		= 1'b0;
assign	dsn_dmc_iei		= ncu_dmu_iei_d1;
// ----------------------------------------------------------------------------
//  Combinational DMU to SIU xface
// ----------------------------------------------------------------------------

assign	dsn_sii_cmd[7]		= d2j_cmd[3]	;				// PIO rd completion
assign	dsn_sii_cmd[6]		= ~d2j_cmd[3] & ~d2j_cmd[2] & ~d2j_cmd[1];	// posted bit, assert for writes
assign	dsn_sii_cmd[5]		= (~d2j_cmd[3] & d2j_cmd[1]) | d2j_cmd[3] ;	// DMA rd request + pio_rd_cpl
assign	dsn_sii_cmd[4]		= ~d2j_cmd[3] & ~d2j_cmd[1] & d2j_cmd[0];	// DMA write bytemasks are active
assign	dsn_sii_cmd[3]		= ~d2j_cmd[3] & ~d2j_cmd[2] ;			// all DMA's 
assign	dsn_sii_cmd[2]		= d2j_cmd[3] || (~d2j_cmd[3] && d2j_cmd[2]) ;	// Int Mondo, or Rd cpl
assign	dsn_sii_cmd[1:0]	= 2'b0;
assign	dsn_sii_to		= d2j_cmd[3] & d2j_cmd[1] & ~d2j_cmd[0];
assign	dsn_sii_be		= d2j_cmd[3] & d2j_cmd[1] & d2j_cmd[0];
assign	dsn_sii_ue		= 1'b0;
// if pio_rd_cpl set bit 15 of the ctag
assign  ctag_to_siu[15:0]	= d2j_cmd[3] ? {1'b1,d2j_ctag[14:0]} : d2j_ctag[15:0];
// generate parity and ecc on header bits
  assign hdr_ecc[5:0]  	= gen_chk (ctag_to_siu[15:0]);
// note: d2j_addr[33:0] is system address bits [39:6], and [5:0] are always force to zero in the outgoing header
  assign adr_par[1]	= ~^{d2j_addr[33],d2j_addr[31],d2j_addr[29],d2j_addr[27],d2j_addr[25],d2j_addr[23],
  		 	     d2j_addr[21],d2j_addr[19],d2j_addr[17],d2j_addr[15],d2j_addr[13],d2j_addr[11],
  		 	     d2j_addr[09],d2j_addr[07],d2j_addr[05],d2j_addr[03],d2j_addr[01]};
  assign adr_par[0]	= ~^{d2j_addr[32],d2j_addr[30],d2j_addr[28],d2j_addr[26],d2j_addr[24],d2j_addr[22],
  		 	     d2j_addr[20],d2j_addr[18],d2j_addr[16],d2j_addr[14],d2j_addr[12],d2j_addr[10],
  		 	     d2j_addr[08],d2j_addr[06],d2j_addr[04],d2j_addr[02],d2j_addr[00]};
  assign cmd_par	= ~^{dsn_sii_cmd[7:0]};
assign	dsn_sii_hdr[127:0] 	= {dsn_sii_cmd[7:0],					// hdr [127:120]
				{35'b0},						// hdr [119:85]
				adr_par,						// hdr [84:83]
				dsn_sii_to,dsn_sii_be,dsn_sii_ue,			// hdr [82:80]
				ctag_to_siu[15:0],					// hdr [79:64]
				1'b0,cmd_par,hdr_ecc[5:0],{16'b0},			// hdr [63:40]
				d2j_addr[33:0],						// hdr [39:6]
				{6'b0}};
// add a 0-in checker to verify pio return bmsk is only valid on either upper or lower 64 bits(see above)
// see ncu_dmu logic before for pio_cpl_bus_align generation
// if pio_cpl_bus_align[1]==1 then 16 byte pio cpl, else pio_cpl_bus_align[0] tells how to duplicate 8 bytes
assign  d2j_pio_data[127:0]	= pio_cpl_bus_align[1] ? d2j_data_d1[127:0] : (pio_cpl_bus_align[0] ? 
						{d2j_data_d1[63:0],d2j_data_d1[63:0]} :
						   {d2j_data_d1[127:64],d2j_data_d1[127:64]} ) ;
//
// BP 10-14-04 recalculate parity 2 per 32 bits, 1 or odd bits, 1 for even bits
// as per Hunter's request, if we detect a parity error from the DIU rams, flip parity dmu_sii_parity[0].
// BP 10-14-04  do a parity check of the data from DIU, report any errors to NCU and flip dmu_sii_parity[0] if error found
assign	calc_d2j_data_par[0]	= ~^d2j_bmsk[15:0];		// if parity error in bmsk also cause error to SII
assign	calc_d2j_data_par[1]	= ~^d2j_data[31:0];
assign	calc_d2j_data_par[2]	= ~^d2j_data[63:32];
assign	calc_d2j_data_par[3]	= ~^d2j_data[95:64];
assign	calc_d2j_data_par[4]	= ~^d2j_data[127:96];
assign	force_dmu_sii_bad_par		= d2j_data_vld & ( (calc_d2j_data_par[0] ^ d2j_data_par[0]) |
						(calc_d2j_data_par[1] ^ d2j_data_par[1]) |
						(calc_d2j_data_par[2] ^ d2j_data_par[2]) |
						(calc_d2j_data_par[3] ^ d2j_data_par[3]) |
						(calc_d2j_data_par[4] ^ d2j_data_par[4]) );
assign  dmu_sii_parity[0]	= ( force_dmu_sii_bad_par_d1 ^
				(~^{d2j_data_out[30],d2j_data_out[28],d2j_data_out[26],d2j_data_out[24],
					d2j_data_out[22],d2j_data_out[20],d2j_data_out[18],d2j_data_out[16],
					d2j_data_out[14],d2j_data_out[12],d2j_data_out[10],d2j_data_out[08],
					d2j_data_out[06],d2j_data_out[04],d2j_data_out[02],d2j_data_out[00]} ));
assign  dmu_sii_parity[1]	= ~^{d2j_data_out[31],d2j_data_out[29],d2j_data_out[27],d2j_data_out[25],
					d2j_data_out[23],d2j_data_out[21],d2j_data_out[19],d2j_data_out[17],
					d2j_data_out[15],d2j_data_out[13],d2j_data_out[11],d2j_data_out[09],
					d2j_data_out[07],d2j_data_out[05],d2j_data_out[03],d2j_data_out[01]};
assign  dmu_sii_parity[2]	= ~^{d2j_data_out[62],d2j_data_out[60],d2j_data_out[58],d2j_data_out[56],
					d2j_data_out[54],d2j_data_out[52],d2j_data_out[50],d2j_data_out[48],
					d2j_data_out[46],d2j_data_out[44],d2j_data_out[42],d2j_data_out[40],
					d2j_data_out[38],d2j_data_out[36],d2j_data_out[34],d2j_data_out[32]};
assign  dmu_sii_parity[3]	= ~^{d2j_data_out[63],d2j_data_out[61],d2j_data_out[59],d2j_data_out[57],
					d2j_data_out[55],d2j_data_out[53],d2j_data_out[51],d2j_data_out[49],
					d2j_data_out[47],d2j_data_out[45],d2j_data_out[43],d2j_data_out[41],
					d2j_data_out[39],d2j_data_out[37],d2j_data_out[35],d2j_data_out[33]};
assign  dmu_sii_parity[4]	= ~^{d2j_data_out[94],d2j_data_out[92],d2j_data_out[90],d2j_data_out[88],
					d2j_data_out[86],d2j_data_out[84],d2j_data_out[82],d2j_data_out[80],
					d2j_data_out[78],d2j_data_out[76],d2j_data_out[74],d2j_data_out[72],
					d2j_data_out[70],d2j_data_out[68],d2j_data_out[66],d2j_data_out[64]};
assign  dmu_sii_parity[5]	= ~^{d2j_data_out[95],d2j_data_out[93],d2j_data_out[91],d2j_data_out[89],
					d2j_data_out[87],d2j_data_out[85],d2j_data_out[83],d2j_data_out[81],
					d2j_data_out[79],d2j_data_out[77],d2j_data_out[75],d2j_data_out[73],
					d2j_data_out[71],d2j_data_out[69],d2j_data_out[67],d2j_data_out[65]};
assign  dmu_sii_parity[6]	= ~^{d2j_data_out[126],d2j_data_out[124],d2j_data_out[122],d2j_data_out[120],
					d2j_data_out[118],d2j_data_out[116],d2j_data_out[114],d2j_data_out[112],
					d2j_data_out[110],d2j_data_out[108],d2j_data_out[106],d2j_data_out[104],
					d2j_data_out[102],d2j_data_out[100],d2j_data_out[98],d2j_data_out[96]};
assign  dmu_sii_parity[7]	= ~^{d2j_data_out[127],d2j_data_out[125],d2j_data_out[123],d2j_data_out[121],
					d2j_data_out[119],d2j_data_out[117],d2j_data_out[115],d2j_data_out[113],
					d2j_data_out[111],d2j_data_out[109],d2j_data_out[107],d2j_data_out[105],
					d2j_data_out[103],d2j_data_out[101],d2j_data_out[99],d2j_data_out[97]};

assign  dmu_sii_be_parity	= dmu_sii_parity_be;
assign  d2j_data_out[127:0]	= dsn_sii_cmd_7 ? d2j_pio_data[127:0] : d2j_data_d1[127:0];
assign	dmu_sii_data[127:0]	= d2j_cmd_vld ? dsn_sii_hdr[127:0] : d2j_data_out[127:0];
assign	dmu_sii_hdr_vld		= d2j_cmd_vld;
assign	dmu_sii_reqbypass	= d2j_cmd[3] && d2j_cmd_vld;
assign	dmu_sii_datareq		= (d2j_cmd[3] || 				// PIO rd cpl decode
				(~d2j_cmd[3] && ~d2j_cmd[1])) && d2j_cmd_vld;	// DMA wrt decodes
assign	dmu_sii_datareq16	= (d2j_cmd[3] || 				// PIO rd cpl decode
				(~d2j_cmd[3] && d2j_cmd[2])) && d2j_cmd_vld;	// INT decode
// ----------------------------------------------------------------------------
// Combinational SIU to DMU xface
// ----------------------------------------------------------------------------
// note: the SIO sends a header followed by 4 data beats, thus flop the header, but then just
//			pass the data through without flopping

always @(posedge l1clk ) 
	if (~rst_l) begin
    sio_dmu_ue		          <= 1'b0;
    sio_dmu_de		          <= 1'b0;
    sio_dmc_tag[15:0]	          <= 16'b0;
    sio_dmc_tag_ecc[5:0]	  <= 6'b0;
    sio_dmu_hdr_vld_d1 	          <= 1'b0;
	end
	else begin
    if (sio_dmu_hdr_vld )   sio_dmu_ue		          <= sio_dmu_data[81];
    if (sio_dmu_hdr_vld )   sio_dmu_de		          <= sio_dmu_data[80];
    if (sio_dmu_hdr_vld )   sio_dmc_tag[15:0]	          <= sio_dmu_data[79:64];
    if (sio_dmu_hdr_vld )   sio_dmc_tag_ecc[5:0]	  <= sio_dmu_data[61:56];
    		   	    sio_dmu_hdr_vld_d1 	          <= sio_dmu_hdr_vld;
        		    enable_pe_err[0]	          <= sio_dmu_hdr_vld ;
        		    enable_pe_err[1]	          <= enable_pe_err[0] ;
        		    enable_pe_err[2]	          <= enable_pe_err[1] ;
        		    enable_pe_err[3]	          <= enable_pe_err[2] ;
        end

// use a function to check the ecc on sio_dmc_tag[15:0] and return corrected data

  assign sio_dsn_hdr_ecc[17:0] 	= gen_correct (sio_dmc_tag[15:0],sio_dmc_tag_ecc[5:0]);
  assign dmu_ncu_ctag_ue_in	= sio_dmu_hdr_vld_d1 & ( (sio_dsn_hdr_ecc[17] & ~sio_dmu_ue)
					 | ncu_dmu_ctag_uei_d1);
  assign dmu_ncu_ctag_ce_in	= sio_dmu_hdr_vld_d1 & ( (sio_dsn_hdr_ecc[16] )
					 | ncu_dmu_ctag_cei_d1);
  assign sio_dmc_tag_corrected[15:0] = sio_dsn_hdr_ecc[15:0];

assign	j2d_d_data[127:0]	=	sio_dmu_data[127:0];			// pass-through no flop
// check the incoming parity from the sio, and then re-generate parity for DMU, if incoming parity
//	error is detected, "or" into j2d_d_data_err, which causes the poison bit in the pci-x header(via ilu/tlu)
assign  calc_sio_dmu_data_par[0]	= ~^{sio_dmu_data[30],sio_dmu_data[28],sio_dmu_data[26],sio_dmu_data[24],
					sio_dmu_data[22],sio_dmu_data[20],sio_dmu_data[18],sio_dmu_data[16],
					sio_dmu_data[14],sio_dmu_data[12],sio_dmu_data[10],sio_dmu_data[08],
					sio_dmu_data[06],sio_dmu_data[04],sio_dmu_data[02],sio_dmu_data[00]} ;
assign  calc_sio_dmu_data_par[1]	= ~^{sio_dmu_data[31],sio_dmu_data[29],sio_dmu_data[27],sio_dmu_data[25],
					sio_dmu_data[23],sio_dmu_data[21],sio_dmu_data[19],sio_dmu_data[17],
					sio_dmu_data[15],sio_dmu_data[13],sio_dmu_data[11],sio_dmu_data[09],
					sio_dmu_data[07],sio_dmu_data[05],sio_dmu_data[03],sio_dmu_data[01]};
assign  calc_sio_dmu_data_par[2]	= ~^{sio_dmu_data[62],sio_dmu_data[60],sio_dmu_data[58],sio_dmu_data[56],
					sio_dmu_data[54],sio_dmu_data[52],sio_dmu_data[50],sio_dmu_data[48],
					sio_dmu_data[46],sio_dmu_data[44],sio_dmu_data[42],sio_dmu_data[40],
					sio_dmu_data[38],sio_dmu_data[36],sio_dmu_data[34],sio_dmu_data[32]};
assign  calc_sio_dmu_data_par[3]	= ~^{sio_dmu_data[63],sio_dmu_data[61],sio_dmu_data[59],sio_dmu_data[57],
					sio_dmu_data[55],sio_dmu_data[53],sio_dmu_data[51],sio_dmu_data[49],
					sio_dmu_data[47],sio_dmu_data[45],sio_dmu_data[43],sio_dmu_data[41],
					sio_dmu_data[39],sio_dmu_data[37],sio_dmu_data[35],sio_dmu_data[33]};
assign  calc_sio_dmu_data_par[4]	= ~^{sio_dmu_data[94],sio_dmu_data[92],sio_dmu_data[90],sio_dmu_data[88],
					sio_dmu_data[86],sio_dmu_data[84],sio_dmu_data[82],sio_dmu_data[80],
					sio_dmu_data[78],sio_dmu_data[76],sio_dmu_data[74],sio_dmu_data[72],
					sio_dmu_data[70],sio_dmu_data[68],sio_dmu_data[66],sio_dmu_data[64]};
assign  calc_sio_dmu_data_par[5]	= ~^{sio_dmu_data[95],sio_dmu_data[93],sio_dmu_data[91],sio_dmu_data[89],
					sio_dmu_data[87],sio_dmu_data[85],sio_dmu_data[83],sio_dmu_data[81],
					sio_dmu_data[79],sio_dmu_data[77],sio_dmu_data[75],sio_dmu_data[73],
					sio_dmu_data[71],sio_dmu_data[69],sio_dmu_data[67],sio_dmu_data[65]};
assign  calc_sio_dmu_data_par[6]	= ~^{sio_dmu_data[126],sio_dmu_data[124],sio_dmu_data[122],sio_dmu_data[120],
					sio_dmu_data[118],sio_dmu_data[116],sio_dmu_data[114],sio_dmu_data[112],
					sio_dmu_data[110],sio_dmu_data[108],sio_dmu_data[106],sio_dmu_data[104],
					sio_dmu_data[102],sio_dmu_data[100],sio_dmu_data[98],sio_dmu_data[96]};
assign  calc_sio_dmu_data_par[7]	= ~^{sio_dmu_data[127],sio_dmu_data[125],sio_dmu_data[123],sio_dmu_data[121],
					sio_dmu_data[119],sio_dmu_data[117],sio_dmu_data[115],sio_dmu_data[113],
					sio_dmu_data[111],sio_dmu_data[109],sio_dmu_data[107],sio_dmu_data[105],
					sio_dmu_data[103],sio_dmu_data[101],sio_dmu_data[99],sio_dmu_data[97]};

assign  dmu_ncu_d_pe_in		=	(sio_dsn_pe & ~sio_dmu_de) || 
					(|enable_pe_err[3:0] & ncu_dmu_d_pei_d1);	// only assert pe if data is vld
					// note: use enable_pe_err[3:0] not j2d_d_data_vld because
					// if there is an error in the tag(ie. ue), the packet is dropped going back
					// to dmc, and thus it would not be asserted
assign  sio_dsn_pe		=	j2d_d_data_vld & (					// only assert pe if data is vld
					( calc_sio_dmu_data_par[0] ^ sio_dmu_parity[0] ) |
					( calc_sio_dmu_data_par[1] ^ sio_dmu_parity[1] ) |
					( calc_sio_dmu_data_par[2] ^ sio_dmu_parity[2] ) |
					( calc_sio_dmu_data_par[3] ^ sio_dmu_parity[3] ) |
					( calc_sio_dmu_data_par[4] ^ sio_dmu_parity[4] ) |
					( calc_sio_dmu_data_par[5] ^ sio_dmu_parity[5] ) |
					( calc_sio_dmu_data_par[6] ^ sio_dmu_parity[6] ) |
					( calc_sio_dmu_data_par[7] ^ sio_dmu_parity[7] ) );

// force j2d_d_data_par[0] to be in err for tablewalks if ncu_dmu_d_pei is asserted
assign	j2d_d_data_par[0]	=	~^({sio_dmu_data[31:0]}); 		// flip to force bad par
										// note good parity is generated no matter
assign	j2d_d_data_par[1]	=	~^(sio_dmu_data[63:32]);		// what, but SW knows because of signaling
assign	j2d_d_data_par[2]	=	~^(sio_dmu_data[95:64]);		// to NCU and data poison to ilu/tlu
assign	j2d_d_data_par[3]	=	~^(sio_dmu_data[127:96]);
assign	j2d_d_data_err		=	j2d_d_data_vld & 	// sio_dmu_de is for all l2$ DATA errors
					(sio_dmu_de | sio_dsn_pe | ncu_dmu_d_pei_d1); 
										    // sio_dsn_pe is for locally detected pe's

// generate 4 data valid's
  always @ (posedge l1clk) 
	if (~rst_l) begin
    hdr_cnt[2:0] <= 3'b0;
  end
    else begin
    hdr_cnt[2:0] <= nxt_hdr_cnt[2:0];
  end

always @(hdr_cnt or reset or sio_dmu_hdr_vld or sio_dmu_hdr_vld_d1 or sio_dmu_ue or sio_dsn_hdr_ecc ) begin
    if ( reset) begin
	  		nxt_hdr_cnt[2:0]	= 3'b000;
		end
    else if (sio_dmu_hdr_vld )begin
			nxt_hdr_cnt[2:0]     	= 3'b100;
		end
    else if ((sio_dmu_ue | sio_dsn_hdr_ecc[17]) & sio_dmu_hdr_vld_d1 )begin // detect error 1 cycle late
			nxt_hdr_cnt[2:0]     	= 3'b000;			// so bak to 0 here
		end
    else if ( |hdr_cnt[2:0] != 1'b0 ) begin
		        nxt_hdr_cnt[2:0]  	= hdr_cnt[2:0] - 3'b001;
	end
	else nxt_hdr_cnt[2:0]			= hdr_cnt[2:0];
        end

assign	j2d_d_data_vld	= (|hdr_cnt[2:0] 
			& ~(sio_dmu_ue | sio_dsn_hdr_ecc[17]) )  	// this term blocks the first j2d_d_data_vld
			& ~ncu_dmu_ctag_uei_d1 ;			// do not return if forcing an error on credit id
// get j2d_di_cmd from the SIO dma rd cpl header, or the mondo return fifo
wire	en_dma_rd_rtn;		// note: in FIRE j2d_di_cmd_vld is asserted on the first j2d_d_data_vld
				// but from the SIO the sio_dmu_hdr_vld is 1 cycle before the data
				// so this creates a hole to return mondo's, 
assign	en_dma_rd_rtn	= (sio_dmu_hdr_vld_d1 &
			~((sio_dmu_ue | sio_dsn_hdr_ecc[17]) |  // disable vld if ue
                         ncu_dmu_ctag_uei_d1) );                 // disable vld return if ncu forcing errors
	
assign	j2d_di_cmd[1:0]		= en_dma_rd_rtn ? {1'b0,( sio_dmu_de)} : {1'b1,data_out[7]};
assign	j2d_di_ctag[15:0]	= en_dma_rd_rtn ? sio_dmc_tag_corrected[15:0] : {1'b0,data_out[5:2],8'b0,data_out[1:0],1'b0};
assign	mondo_cmd_vld		= !fifo_empty && !j2d_d_data_vld;
assign	read			= !fifo_empty && !j2d_d_data_vld;
// note: if sio_dmu_ue, ie. ctag ecc or address pe error, then do not return this transaction, otherwise
//			the scoreboard could get corrupted, SW will have to intervene and fix.
//			this includes the ue from SIO as well as local ctag ecc ue's
//			also don't return if forcing pe's from ncu for test

assign	j2d_di_cmd_vld		= en_dma_rd_rtn		// only return if no errors
				| mondo_cmd_vld;   	// note if ncu mondo ack had a pe it would not
							// even gone into the fifo, so do j2d_di_cmd_vld

// ----------------------------------------------------------------------------
// Combinational MONDO ack FIFO from NCU
// ----------------------------------------------------------------------------
// check the incoming parity, and if in error, then drop the write into the fifo
wire	calc_ncu_dmu_mondo_id_par;
assign calc_ncu_dmu_mondo_id_par 	= ~^ncu_dmu_mondo_id[5:0];
assign	dmu_ncu_ncucr_pe_in		= (ncu_dmu_mondo_ack || ncu_dmu_mondo_nack) & 
						((calc_ncu_dmu_mondo_id_par ^ ncu_dmu_mondo_id_par)
						| ncu_dmu_ncucr_pei_d1 );
assign	data_in[7:0]	= {ncu_dmu_mondo_ack,ncu_dmu_mondo_nack,ncu_dmu_mondo_id[5:0]};
assign	write		= (ncu_dmu_mondo_ack || ncu_dmu_mondo_nack) & 
			~((calc_ncu_dmu_mondo_id_par ^ ncu_dmu_mondo_id_par) | 	// no int ack return if parity error
			ncu_dmu_ncucr_pei_d1) ;					// or if forcing this error from ncu

dmu_dsn_mondo_fifo	mondo_fifo (
			.clk		(l1clk),
			.rst_l		(rst_l),
			.data_in	(data_in[7:0]),
			.write		(write),
			.data_out	(data_out[7:0]),
			.read		(read),
			.fifo_empty	(fifo_empty)
			);


// ----------------------------------------------------------------------------
// Combinational NCU to DMU PIO xface
// ----------------------------------------------------------------------------
wire	[1:0]		p_data_par;
assign	j2d_p_data[127:0]	=	{ncu_dmu_pio_data[63:0],ncu_dmu_pio_data[63:0]}; // duplicate 64 bits,only 8 byte writes
assign	p_data_par[0]		=	~^ncu_dmu_pio_data[31:0];
assign	p_data_par[1]		=	~^ncu_dmu_pio_data[63:32];
assign	j2d_p_data_par[3:0]	=	{p_data_par[1:0],p_data_par[1:0]};		// duplicate parity bits
always @(posedge l1clk ) 
	if (~rst_l) begin
    pio_credit_id[3:0]		<= 4'b0;
    pio_read			<= 1'b0;
    pio_byte_cnt[7:0]		<= 8'b0;
    pio_cmd_map[1:0]		<= 2'b0;
    pio_id[6:0]			<= 7'b0;
    pio_pa[42:0]		<= 43'b0;
    j2d_p_cmd_vld           	<= 1'b0;
    mmu_addr_vld		<= 1'b0;
	end
	else begin
    if (ncu_dmu_pio_hdr_vld )   		pio_read		<= ncu_dmu_pio_data[60];
    if (ncu_dmu_pio_hdr_vld )   		pio_credit_id[3:0]	<= ncu_dmu_pio_data[59:56];
    if (ncu_dmu_pio_hdr_vld )   		pio_byte_cnt[7:0]	<= ncu_dmu_pio_data[55:48];
    if (ncu_dmu_pio_hdr_vld )   		pio_id[6:0]		<= ncu_dmu_pio_data[46:40];
    if (ncu_dmu_pio_hdr_vld )   		pio_cmd_map[1:0]	<= ncu_dmu_pio_data[37:36];
    if (ncu_dmu_pio_hdr_vld | 
		ncu_dmu_mmu_addr_vld ) 		pio_pa[42:0]		<= ncu_dmu_pio_data[42:0]; // for hdr and mmu inv.
						j2d_p_cmd_vld	   	<= ncu_dmu_pio_hdr_vld;
	  			  		mmu_addr_vld	        <= ncu_dmu_mmu_addr_vld;
        end

assign	j2d_p_data_vld	=	j2d_p_cmd_vld && !pio_read;
assign	j2d_p_ctag[10:0]=	{pio_credit_id[3:0],pio_id[6:0]};
assign	j2d_p_addr[35:3]=	pio_pa[35:3];
assign	j2d_p_addr[2]   =	pio_read ? pio_pa[2] : 
					( (|pio_byte_cnt[7:4] || ~|pio_byte_cnt[7:0])   ? 1'b0 : 1'b1) ;
assign	j2d_p_addr[1:0]=	pio_pa[1:0];
// if a PIO write use pio_byte_cnt directly as the bytemask, if a read see below
assign	j2d_p_bmsk[15:0]=	pio_bmsk[15:0];

// note: see pg. 7.622 of fire MAS for bmask description, thus bmsk[0] is for bits [7:0](word 15)ie. the data is
//					big endian, but the bmsk is reversed.
assign	pio_bmsk_sel[2:0] = {pio_read,pio_byte_cnt[2],j2d_p_addr[3]};
always @(pio_bmsk_sel or pio_byte_cnt or pio_rd_bmsk)begin
	pio_bmsk[15:0] = {16{1'b0}};
	case ( pio_bmsk_sel)				//0in case -full -parallel
	3'b000: 	pio_bmsk	= {pio_byte_cnt[7:0],{8{1'b0}}};	// pio write,adr[3]=0, so msbytes
	3'b010: 	pio_bmsk	= {pio_byte_cnt[7:0],{8{1'b0}}};	// pio write,adr[3]=0, so msbytes
	3'b001: 	pio_bmsk	= {{8{1'b0}},pio_byte_cnt[7:0]};	// pio write,adr[3]=1, so lsbytes
	3'b011: 	pio_bmsk	= {{8{1'b0}},pio_byte_cnt[7:0]};	// pio write,adr[3]=1, so lsbytes
	3'b100: 	pio_bmsk	= {pio_rd_bmsk[7:0],{8{1'b0}}};		// pio read, <=8bytes use pio_rd_bmsk below
	3'b101: 	pio_bmsk	= {{8{1'b0}},pio_rd_bmsk[7:0]};		// pio read, <=8bytes use pio_rd_bmsk below
	3'b110: 	pio_bmsk	= ({16{1'b1}});				// pio read, 16bytes turn on all bits
	3'b111: 	pio_bmsk	= ({16{1'b1}});				// pio read, 16bytes turn on all bits
//	default:	pio_bmsk	= {16{1'bx}};
	endcase
end

// now figure out the j2d cmd from the ncu header
assign	j2d_p_cmd[3]	=	pio_read;
assign	j2d_p_cmd[2]	=	1'b1;						// always 16 bytes
assign	j2d_p_cmd[1]	=	(!pio_cmd_map[1] && pio_cmd_map[0]) ||
				(!pio_cmd_map[1] && !pio_cmd_map[0]) ;
assign	j2d_p_cmd[0]	=	(pio_cmd_map[1] && !pio_cmd_map[0]) ||
				(!pio_cmd_map[1] && !pio_cmd_map[0]) ;
// now figure out the bmsk for PIO read
always @(pio_pa[2:0] or pio_byte_cnt[1:0])begin
	pio_rd_bmsk[7:0] = 8'b00000000 ;
	case(pio_pa[2:0]) 				//0in case -full -parallel
	3'b000:	begin
		if(pio_byte_cnt[1:0]==2'b11) pio_rd_bmsk[7:0] = 8'b11111111 ;
		else if (pio_byte_cnt[1:0]==2'b10) pio_rd_bmsk[7:0] = 8'b11110000 ;
		else if (pio_byte_cnt[1:0]==2'b01) pio_rd_bmsk[7:0] = 8'b11000000 ;
		else if (pio_byte_cnt[1:0]==2'b00) pio_rd_bmsk[7:0] = 8'b10000000 ;
		else  pio_rd_bmsk[7:0] = 8'b00000000 ;
		end
	3'b001:	begin
		if(pio_byte_cnt[1:0]==2'b11) pio_rd_bmsk[7:0] = 8'b00000000 ;		//error condition
		else if (pio_byte_cnt[1:0]==2'b10) pio_rd_bmsk[7:0] = 8'b00000000 ;	//error condition
		else if (pio_byte_cnt[1:0]==2'b01) pio_rd_bmsk[7:0] = 8'b00000000 ;	//error condition
		else if (pio_byte_cnt[1:0]==2'b00) pio_rd_bmsk[7:0] = 8'b01000000 ;
		else  pio_rd_bmsk[7:0] = 8'b00000000 ;
		end
	3'b010:	begin
		if(pio_byte_cnt[1:0]==2'b11) pio_rd_bmsk[7:0] = 8'b00000000 ;		//error condition
		else if (pio_byte_cnt[1:0]==2'b10) pio_rd_bmsk[7:0] = 8'b00000000 ;	//error condition
		else if (pio_byte_cnt[1:0]==2'b01) pio_rd_bmsk[7:0] = 8'b00110000 ;
		else if (pio_byte_cnt[1:0]==2'b00) pio_rd_bmsk[7:0] = 8'b00100000 ;
		else  pio_rd_bmsk[7:0] = 8'b00000000 ;
		end
	3'b011:	begin
		if(pio_byte_cnt[1:0]==2'b11) pio_rd_bmsk[7:0] = 8'b00000000 ;		//error condition
		else if (pio_byte_cnt[1:0]==2'b10) pio_rd_bmsk[7:0] = 8'b00000000 ;	//error condition
		else if (pio_byte_cnt[1:0]==2'b01) pio_rd_bmsk[7:0] = 8'b00000000 ;	//error condition
		else if (pio_byte_cnt[1:0]==2'b00) pio_rd_bmsk[7:0] = 8'b00010000 ;
		else  pio_rd_bmsk[7:0] = 8'b00000000 ;
		end
	3'b100:	begin
		if(pio_byte_cnt[1:0]==2'b11) pio_rd_bmsk[7:0] = 8'b00000000 ;		//error condition
		else if (pio_byte_cnt[1:0]==2'b10) pio_rd_bmsk[7:0] = 8'b00001111 ;
		else if (pio_byte_cnt[1:0]==2'b01) pio_rd_bmsk[7:0] = 8'b00001100 ;
		else if (pio_byte_cnt[1:0]==2'b00) pio_rd_bmsk[7:0] = 8'b00001000 ;
		else  pio_rd_bmsk[7:0] = 8'b00000000 ;
		end
	3'b101:	begin
		if(pio_byte_cnt[1:0]==2'b11) pio_rd_bmsk[7:0] = 8'b00000000 ;		//error condition
		else if (pio_byte_cnt[1:0]==2'b10) pio_rd_bmsk[7:0] = 8'b00000000 ;	//error condition
		else if (pio_byte_cnt[1:0]==2'b01) pio_rd_bmsk[7:0] = 8'b00000000 ;	//error condition
		else if (pio_byte_cnt[1:0]==2'b00) pio_rd_bmsk[7:0] = 8'b00000100 ;
		else  pio_rd_bmsk[7:0] = 8'b00000000 ;
		end
	3'b110:	begin
		if(pio_byte_cnt[1:0]==2'b11) pio_rd_bmsk[7:0] = 8'b00000000 ;		//error condition
		else if (pio_byte_cnt[1:0]==2'b10) pio_rd_bmsk[7:0] = 8'b00000000 ;	//error condition
		else if (pio_byte_cnt[1:0]==2'b01) pio_rd_bmsk[7:0] = 8'b00000011 ;
		else if (pio_byte_cnt[1:0]==2'b00) pio_rd_bmsk[7:0] = 8'b00000010 ;
		else  pio_rd_bmsk[7:0] = 8'b00000000 ;
		end
	3'b111:	begin
		if(pio_byte_cnt[1:0]==2'b11) pio_rd_bmsk[7:0] = 8'b00000000 ;		//error condition
		else if (pio_byte_cnt[1:0]==2'b10) pio_rd_bmsk[7:0] = 8'b00000000 ;	//error condition
		else if (pio_byte_cnt[1:0]==2'b01) pio_rd_bmsk[7:0] = 8'b00000000 ;	//error condition
		else if (pio_byte_cnt[1:0]==2'b00) pio_rd_bmsk[7:0] = 8'b00000001 ;
		else  pio_rd_bmsk[7:0] = 8'b00000000 ;
		end
//	default:	pio_rd_bmsk[7:0]	=	8'bxxxxxxxx;
	endcase
	end

// logic to store ncu_dmu_pio_data[3] which is the pio address bit3 along with the credit_id, then when
// the pio rd completion is returned to the sii, replicate the valid 64 bits on both halves of the 128 bit bus
// if pio addr[3] =0 then it expects data on [127:63]
// create a 2 bit 16 entry ram, bit 1 tells if 16 byte reads, bit 0, indicates if <=8byte reads how to duplicate the bus

reg  [1:0]     pio_crdit_ram      [0:15];

assign	pio_cpl_bus_align[1:0]	=	pio_crdit_ram[d2j_ctag_d1[11:8]];	// after thread_id changes
// if pio cmd vld and it is a pio rd, then byte count bit 2 and store pa[3] to be used on pio_rd cpl to sii to 
//	duplicate the data bus if 8 or less byte read, and if 16 byte read, leave as is
always @(posedge l1clk) 
    if (~rst_l)
      begin : scb_reg_reset
      integer i;
      for (i=0; i<16; i=i+1)
        begin
          pio_crdit_ram[i] <= 2'b0;
        end
      end
	else if(ncu_dmu_pio_hdr_vld && ncu_dmu_pio_data[60]) begin
        pio_crdit_ram[ncu_dmu_pio_data[59:56]] <= {ncu_dmu_pio_data[50],ncu_dmu_pio_data[3]}; // [1]=16byte,[3]=adr[2]
        end

// BP n2 10-26-04 monitor to check that the NCU only emits unique id's for pio rds
/* 0in scoreboard	-rx_id  ncu_dmu_pio_data[59:56] 
			-rx	(ncu_dmu_pio_hdr_vld && ncu_dmu_pio_data[60])
			-tx_id	d2j_ctag[11:8]
			-tx	(d2j_cmd_vld & ( d2j_cmd[3] == 1'b1 ) )
                        -name   dsn_ncu_sii_scbd
*/

// forward the mmu invalidate

assign	j2d_mmu_addr_vld	=	mmu_addr_vld;
assign	j2d_mmu_addr[42:6]	=	pio_pa[42:6];

// ----------------------------------------------------------------------------
// Combinational NCU to DMU DMA wrack xface
// ----------------------------------------------------------------------------
wire	calc_sii_dmu_wrack_tag_par;
assign	j2d_d_wrack_tag[3:0] 	= sii_dmu_wrack_tag[3:0];
assign  calc_sii_dmu_wrack_tag_par	= ~^sii_dmu_wrack_tag[3:0];
// BP 10-15-04 if detect parity error, then drop the credit_id return so as not to corrupt the scoreboard

assign	j2d_d_wrack_vld 	= sii_dmu_wrack_vld & 
					~((calc_sii_dmu_wrack_tag_par ^ sii_dmu_wrack_par) |	// do not return cr id if pe
					ncu_dmu_siicr_pei_d1 );					// or if ncu is forcing this error
assign	dmu_ncu_siicr_pe_in	= sii_dmu_wrack_vld & ((calc_sii_dmu_wrack_tag_par ^ sii_dmu_wrack_par) 
							| ncu_dmu_siicr_pei_d1);		// force pe if NCU asserts this
// ----------------------------------------------------------------------------
// Combinational DMU to NCU PIO wrack xface
// ----------------------------------------------------------------------------

assign	dmu_ncu_wrack_tag[3:0] 	= d2j_p_wrack_tag[3:0];
assign	dmu_ncu_wrack_par 	= ~^d2j_p_wrack_tag[3:0];
assign	dmu_ncu_wrack_vld 	= d2j_p_wrack_vld;

// ----------------------------------------------------------------------------
// function to generate ecc for DSN to SII header
// ----------------------------------------------------------------------------

        function        [5:0]   gen_chk;
                input   [15:0]  di;

                reg     [5:0]   chk;
begin
        chk[0]  =       ^{di[15],di[13],di[11],di[10],di[8],di[6],di[4],di[3],di[1],di[0]};
        chk[1]  =       ^{di[13],di[12],di[10],di[9],di[6],di[5],di[3],di[2],di[0]};
        chk[2]  =       ^{di[15],di[14],di[10],di[9],di[8],di[7],di[3],di[2],di[1]};
        chk[3]  =       ^{di[10],di[9],di[8],di[7],di[6],di[5],di[4]};
        chk[4]  =       ^{di[15],di[14],di[13],di[12],di[11]};
        chk[5]  =       ^{di[15],di[14],di[13],di[12],di[11],di[10],di[9],di[8],
                                di[7],di[6],di[5],di[4],di[3],di[2],di[1],di[0],
                                chk[0],chk[1],chk[2],chk[3],chk[4]};

        gen_chk[5:0]    =       {chk[5],chk[4],chk[3],chk[2],chk[1],chk[0]};
end

        endfunction     //gen_chk

// ----------------------------------------------------------------------------
// function to correct data from ecc for SIO to DSN header
// ----------------------------------------------------------------------------

        function        [17:0]   gen_correct;
                input   [15:0]  di_tag;
                input   [5:0]  di_ecc;

                reg     [15:0]  c_data;
                reg     [5:0]   err;
                reg     [5:0]   chk;
                reg             ce, ue;
//                reg           no_error;
begin
        chk[0]  =       ^{di_tag[15],di_tag[13],di_tag[11],di_tag[10],di_tag[8],di_tag[6],di_tag[4],di_tag[3],di_tag[1],di_tag[0]};
        chk[1]  =       ^{di_tag[13],di_tag[12],di_tag[10],di_tag[9],di_tag[6],di_tag[5],di_tag[3],di_tag[2],di_tag[0]};
        chk[2]  =       ^{di_tag[15],di_tag[14],di_tag[10],di_tag[9],di_tag[8],di_tag[7],di_tag[3],di_tag[2],di_tag[1]};
        chk[3]  =       ^{di_tag[10],di_tag[9],di_tag[8],di_tag[7],di_tag[6],di_tag[5],di_tag[4]};
        chk[4]  =       ^{di_tag[15],di_tag[14],di_tag[13],di_tag[12],di_tag[11]};
        chk[5]  =       ^{di_tag[15],di_tag[14],di_tag[13],di_tag[12],di_tag[11],di_tag[10],di_tag[9],di_tag[8],
                                di_tag[7],di_tag[6],di_tag[5],di_tag[4],di_tag[3],di_tag[2],di_tag[1],di_tag[0],
                                di_ecc[0],di_ecc[1],di_ecc[2],di_ecc[3],di_ecc[4]};
	
	err[0]  =	chk[0] ^ di_ecc[0];
	err[1]  =	chk[1] ^ di_ecc[1];
	err[2]  =	chk[2] ^ di_ecc[2];
	err[3]  =	chk[3] ^ di_ecc[3];
	err[4]  =	chk[4] ^ di_ecc[4];
	err[5]  =	chk[5] ^ di_ecc[5];
//	no_error = 	~|err;
	if ( (err[4:0] <= 5'd21 ) && err[5] == 1'b1) begin
		ce	= 1'b1;
		end
		else begin
		ce	= 1'b0;
		end
	if ( ((err[4:0] != 5'b0) & err[5] == 1'b0) || (err[4:0] > 5'd21)) begin
		ue	= 1'b1;
		end
		else	begin
		ue	= 1'b0;
		end
	
		
	c_data[0]	= di_tag[0] ^ (err[4:0] == 5'd03);	
	c_data[1]	= di_tag[1] ^ (err[4:0] == 5'd05);	
	c_data[2]	= di_tag[2] ^ (err[4:0] == 5'd06);	
	c_data[3]	= di_tag[3] ^ (err[4:0] == 5'd07);	
	c_data[4]	= di_tag[4] ^ (err[4:0] == 5'd09);	
	c_data[5]	= di_tag[5] ^ (err[4:0] == 5'd10);	
	c_data[6]	= di_tag[6] ^ (err[4:0] == 5'd11);	
	c_data[7]	= di_tag[7] ^ (err[4:0] == 5'd12);	
	c_data[8]	= di_tag[8] ^ (err[4:0] == 5'd13);	
	c_data[9]	= di_tag[9] ^ (err[4:0] == 5'd14);	
	c_data[10]	= di_tag[10] ^ (err[4:0] == 5'd15);	
	c_data[11]	= di_tag[11] ^ (err[4:0] == 5'd17);	
	c_data[12]	= di_tag[12] ^ (err[4:0] == 5'd18);	
	c_data[13]	= di_tag[13] ^ (err[4:0] == 5'd19);	
	c_data[14]	= di_tag[14] ^ (err[4:0] == 5'd20);	
	c_data[15]	= di_tag[15] ^ (err[4:0] == 5'd21);

	gen_correct	= {ue,ce,c_data[15:0]};

end

        endfunction     //gen_chk


// ----------------------------------------------------------------------------
// Debug stall logic
// ----------------------------------------------------------------------------
reg	[1:0]	stall,n_stall;
wire		dmu_ingress_idle;
reg	[4:0]	dbg_stall_dma;
reg	[2:0]	dbg_stall_int;
reg	[4:0]	n_dbg_stall_dma;
reg	[2:0]	n_dbg_stall_int;
wire		dma_to_sio,int_to_sio,ncu_int_ack;

 always @ (posedge l1clk)
        if(~rst_l) begin
    stall <= {2{1'b0}};
        end
  else begin
    stall <= n_stall;
  end

always @ (stall or dbg1_dmu_stall or dbg1_dmu_resume or dmu_ingress_idle  ) begin
    case ({stall}) 
      2'b00    : if (dbg1_dmu_stall)  n_stall = 2'b01;  // if stall request, go to stall state
			else n_stall = 2'b00;	
      2'b01    : if (dmu_ingress_idle) n_stall = 2'b10; // if resume request, go to normal state
			else n_stall = 2'b01;	
      2'b10    : 		    n_stall = 2'b11;	// transitory to get 1 wide pulse for dmu_dbg_stall_ack
      2'b11    : if (dbg1_dmu_resume) n_stall = 2'b00;	// if resume request, go to normal state
			else n_stall = 2'b11;	
	endcase
end
// indicate idle, if we are supposed to stall, all outstanding dma's/int's are done and no new one pending
assign	dmu_ingress_idle	= ~(|dbg_stall_dma) & ~(|dbg_stall_int) & ~d2j_cmd_vld & |stall;
assign	ds2cl_stall	= |stall | dbg1_dmu_stall;
assign	dmu_dbg1_stall_ack	= stall[1] & ~stall[0];
// ----------------------------------------------------------------------------
// Debug stall logic outstanding dma and int counter
// ----------------------------------------------------------------------------

 always @ (posedge l1clk)
        if(~rst_l) begin
    dbg_stall_dma <= {5{1'b0}};
    dbg_stall_int <= {3{1'b0}};
        end
  else begin
    dbg_stall_dma <= n_dbg_stall_dma;
    dbg_stall_int <= n_dbg_stall_int;
  end

assign	dma_to_sio		= dmu_sii_hdr_vld & dmu_sii_data[123];
assign	int_to_sio		= dmu_sii_hdr_vld & ~dmu_sii_data[127] & dmu_sii_data[122];
assign	ncu_int_ack		= (ncu_dmu_mondo_ack || ncu_dmu_mondo_nack);

always @ (dbg_stall_dma or dma_to_sio or sii_dmu_wrack_vld or
		sio_dmu_hdr_vld  ) begin
    case ({dma_to_sio,sii_dmu_wrack_vld,sio_dmu_hdr_vld}) 
      3'b000    : n_dbg_stall_dma = dbg_stall_dma;		// no txn's this cycle
      3'b001    : n_dbg_stall_dma = dbg_stall_dma - 5'b0001;	// dma rd cpl, subtr. 1
      3'b010    : n_dbg_stall_dma = dbg_stall_dma - 5'b0001;	// dma wrack, subtr  1
      3'b011    : n_dbg_stall_dma = dbg_stall_dma - 5'b0010;	// both rd cpl and dma wrack, subtr 2
      3'b100    : n_dbg_stall_dma = dbg_stall_dma + 5'b0001;	// send out 1 dma, inc by 1
      3'b101    : n_dbg_stall_dma = dbg_stall_dma ;		// send out 1, get 1 back, no change
      3'b110    : n_dbg_stall_dma = dbg_stall_dma ;		// send out 1, get 1 back, no change
      3'b111    : n_dbg_stall_dma = dbg_stall_dma - 5'b0001;	// send out 1, get wrack and dma rd cpl, subtr 1
      default : n_dbg_stall_dma = {5{1'b0}};
    endcase
  end

always @ (dbg_stall_int or int_to_sio or ncu_int_ack   ) begin
    case ({int_to_sio,ncu_int_ack}) 
      2'b00    : n_dbg_stall_int = dbg_stall_int;		// no txn's this cycle
      2'b01    : n_dbg_stall_int = dbg_stall_int - 3'b01;	// int ack, subtr. 1
      2'b10    : n_dbg_stall_int = dbg_stall_int + 3'b01;	// int out  inc  1
      2'b11    : n_dbg_stall_int = dbg_stall_int ;		// both int out and int wrack, no change
      default : n_dbg_stall_int = {3{1'b0}};
    endcase
  end


// ----------------------------------------------------------------------------
// Debug bus to CRU then on to dgb.sv
// ----------------------------------------------------------------------------
//-----------------------
// DSN Mux Port A
//-----------------------
assign n_dbg_grp_a_2[`FIRE_DEBUG_WDTH-1:0] = {dmu_sii_hdr_vld,dmu_sii_reqbypass,dmu_sii_datareq, dmu_sii_datareq16,
			dsn_sii_hdr[126],dsn_sii_hdr[124],dsn_sii_hdr[123],dsn_sii_hdr[122]};
assign n_dbg_grp_a_3[`FIRE_DEBUG_WDTH-1:0] = {n_dbg_stall_int[2:0],n_dbg_stall_dma[4:0]};
always @ (cr2ds_dbg_sel_a or ucb2ctl_dbg_grp_a_1 or n_dbg_grp_a_2 or n_dbg_grp_a_3 ) begin
    case (cr2ds_dbg_sel_a) // synopsys parallel_case  infer_mux
      6'h0    : n_dsn_dbg_a = {`FIRE_DEBUG_WDTH{1'b0}};
      6'h1    : n_dsn_dbg_a = ucb2ctl_dbg_grp_a_1;
      6'h2    : n_dsn_dbg_a = n_dbg_grp_a_2;
      6'h3    : n_dsn_dbg_a = n_dbg_grp_a_3;
      default : n_dsn_dbg_a = {`FIRE_DEBUG_WDTH{1'b0}};
    endcase
  end

//-----------------------
// DSN Mux Port B
//-----------------------
assign n_dbg_grp_b_2[`FIRE_DEBUG_WDTH-1:0] = {sio_dmu_hdr_vld,sii_dmu_wrack_vld,ncu_dmu_mondo_ack, ncu_dmu_mondo_nack,
			ncu_dmu_pio_hdr_vld,pio_read,dmu_ncu_wrack_vld,1'b0};

  always @ (cr2ds_dbg_sel_b or fsm2ctl_dbg_grp_b_1 or pkt2ctl_dbg_grp_b_1 or n_dbg_grp_b_2 ) begin
    case (cr2ds_dbg_sel_b) // synopsys parallel_case  infer_mux
      6'h0  : n_dsn_dbg_b = {`FIRE_DEBUG_WDTH{1'b0}};
      6'h1  : n_dsn_dbg_b = {fsm2ctl_dbg_grp_b_1,pkt2ctl_dbg_grp_b_1};
      6'h2  : n_dsn_dbg_b = n_dbg_grp_b_2;
      default: n_dsn_dbg_b = {`FIRE_DEBUG_WDTH{1'b0}};
    endcase
  end


 always @ (posedge l1clk)
        if(~rst_l) begin
    ds2cr_dbg_a <= {`FIRE_DEBUG_WDTH{1'b0}};
    ds2cr_dbg_b <= {`FIRE_DEBUG_WDTH{1'b0}};
        end
  else begin
    ds2cr_dbg_a <= n_dsn_dbg_a;
    ds2cr_dbg_b <= n_dsn_dbg_b;
  end

endmodule


