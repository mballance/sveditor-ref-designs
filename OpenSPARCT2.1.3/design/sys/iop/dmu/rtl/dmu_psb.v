// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_psb.v
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
module dmu_psb 
  (
   // Control Signals
   clk,
   rst_l,

   // PMU PRM interface
   pm2ps_i_req,
   pm2ps_i_cmd_type,
   pm2ps_i_trn,
   pm2ps_i_wr_data,
   
   ps2pm_i_full,
   ps2pm_i_gnt,
   ps2pm_i_n_trn,
   ps2pm_i_rd_data,

   //CLU CRM interface
   cl2ps_e_req,
   cl2ps_e_cmd_type, 
   cl2ps_e_trn,
   cl2ps_e_wr_data,

   ps2cl_e_gnt,
   ps2cl_e_rd_data,
   
   // CSR interface
   
   cr2ps_csrbus_valid,
   cr2ps_csrbus_src_bus,
   cr2ps_csrbus_addr,
   cr2ps_csrbus_wr,
   cr2ps_csrbus_wr_data,
   
   ps2cr_csrbus_mapped,
   ps2cr_csrbus_read_data,
   ps2cr_csrbus_done,
   ps2cr_csrbus_acc_vio,
   j2d_instance_id,

   // Debug Ports
   cr2ps_dbg_sel_a,
   cr2ps_dbg_sel_b,

   ps2cr_dbg_a,
   ps2cr_dbg_b

   );
  
  // synopsys sync_set_reset "rst_l"
  
  //////////////////////////////////////////////////////////////////////
  //*************************   Port Declarations   *******************
  //////////////////////////////////////////////////////////////////////
  
  // Control signals
  input                                       clk;
  input 				      rst_l;

  // Debug Ports
  input [5:0] 				      cr2ps_dbg_sel_a;
  input [5:0] 				      cr2ps_dbg_sel_b;
  
  output [`FIRE_DBG_DATA_BITS] 		      ps2cr_dbg_a;
  output [`FIRE_DBG_DATA_BITS] 		      ps2cr_dbg_b;


  // PMU's PRM Interface Signals
  input 				      pm2ps_i_req;        // PRM request for access 
  input [`FIRE_DLC_PSR_CMD_TYPE_WDTH-1:0]     pm2ps_i_cmd_type;   // type of access requested (TRN req w/ Write)
  input [`FIRE_DLC_PSR_TRN_WDTH-1:0] 	      pm2ps_i_trn;        // pktag to be read from
  input [`FIRE_DLC_PSR_DMA_DATA_WDTH-1:0]     pm2ps_i_wr_data;    // dma wr data to be put on scbd
  
  output 				      ps2pm_i_full;       // flow control, no request for pktag can be made
  output [`FIRE_DLC_PSR_TRN_WDTH-1:0] 	      ps2pm_i_n_trn;      // next pktag returned on trn request
  output 				      ps2pm_i_gnt;        // grant signal for request
  output [`FIRE_DLC_PSR_PIO_DATA_WDTH-1:0]    ps2pm_i_rd_data;    // pio data read from scbd (pktag is address read from)
  
  // CLU's CRM Interface Signals
  input 				      cl2ps_e_req;        // CRM request for access 
  input [`FIRE_DLC_PSR_CMD_TYPE_WDTH-1:0]     cl2ps_e_cmd_type;   // type of access requested (Read, Write, Clear, Read w/ Clear)
  input [`FIRE_DLC_PSR_TRN_WDTH-1:0] 	      cl2ps_e_trn;        // pktag to be cleared, read from or written to
  input [`FIRE_DLC_PSR_PIO_DATA_WDTH-1:0]     cl2ps_e_wr_data;   // dma wr data to be put on scoreboard
  
  output 				      ps2cl_e_gnt;        // grant signal for request
  output [`FIRE_DLC_PSR_DMA_DATA_WDTH-1:0]    ps2cl_e_rd_data;    // data read from scbd (pktag is address read from)
  
  // CRU's DCC PIO Interface Signals 
  input [`FIRE_CSR_SRC_BUS_ID_WIDTH-1:0]      cr2ps_csrbus_src_bus; 
  input 				      cr2ps_csrbus_valid;
  input [`FIRE_CSR_ADDR_MAX_WIDTH-1:0] 	      cr2ps_csrbus_addr;
  input 				      cr2ps_csrbus_wr; 
  input [`FIRE_CSR_DATA_WIDTH-1:0] 	      cr2ps_csrbus_wr_data;
  input [`FIRE_J2D_INSTANCE_ID_WDTH-1:0]      j2d_instance_id; 
 
  output [`FIRE_CSR_DATA_WIDTH-1:0] 	      ps2cr_csrbus_read_data;
  output 				      ps2cr_csrbus_done;
  output 				      ps2cr_csrbus_mapped; 
  output 				      ps2cr_csrbus_acc_vio;
  
  //////////////////////////////////////////////////////////////////////
  //*************************    Wires   ******************************* 
  //////////////////////////////////////////////////////////////////////  
  
  // PIC-PTG Interface
  wire 					      pic2ptg_deq;        // dequeue next pktag 
  wire 					      ptg2pic_pktag_full; // flow control from PTG to controller, no more pktags
  wire [`FIRE_DLC_PSR_TRN_WDTH-1:0] 	      ptg2pic_n_pktag;    // pktag returned to controller on deq
  
  // PCE-PTG Interface
  wire [`FIRE_DLC_PSR_TRN_WDTH-1:0] 	      pce2ptg_pktag;      // pktag retired on enq
  wire 					      pce2ptg_enq;        // enqueue pktag (clear/retire)
  
  // PIC-PDL Interface for DMA Write data
  wire 					      pic2pdl_req;        // PIC req
  wire 					      pic2pdl_dma_wr;     // dma write enable
  wire [`FIRE_DLC_PSR_TRN_WDTH-1:0] 	      pic2pdl_pktag;      // pic-pdl wr address decode select
  wire 					      pic2pdl_type;       // type to pdl to determine  pio or dma
  wire [`FIRE_DLC_PSR_DMA_DATA_WDTH-1:0]      pic2pdl_dma_wr_data;// dma data to wr to scbd

  // PIC-PDL Interface for PIO Read
  wire [`FIRE_DLC_PSR_PIO_DATA_WDTH-1:0]      pdl2pic_pio_rd_data;// pio data to rd from scbd
  
  // PCE-PDL Interface for Write data
  wire 					      pce2pdl_req;        // PCE req
  wire 					      pce2pdl_pio_wr;     // pio write enable
  wire [`FIRE_DLC_PSR_TRN_WDTH-1:0] 	      pce2pdl_pktag;      // pce-pdl rd/wr address decode select
  wire 					      pce2pdl_type;       // type to pdl to determine pio or dma
  wire [`FIRE_DLC_PSR_PIO_DATA_WDTH-1:0]      pce2pdl_pio_wr_data;// pio/dma data to wr to scbd

  // PCE-PDL Interface for DMA read
  wire [`FIRE_DLC_PSR_DMA_DATA_WDTH-1:0]      pdl2pce_dma_rd_data;// dma read date from pdl

  // CSR Interface
  wire [`FIRE_DLC_PSR_TRN_WDTH-1:0] 	      ext_addr;            // External address bus for dcm dlc_psb
  wire 					      psb_dma_ext_done;    // acknowledges rd and wr operations for psb_dma.
  wire 					      psb_pio_ext_done;    // acknowledges rd and wr operations for psb_pio.
  wire 					      psb_dma_ext_select;  // When set, register psb_dma is selected.
  wire [`FIRE_DLC_PSR_DMA_DATA_WDTH-1:0]      psb_dma_ext_rd_data; // Read data from the external bypass dma register
  wire 					      psb_pio_ext_select;  // When set, register psb_pio is selected.
  wire [`FIRE_DLC_PSR_PIO_DATA_WDTH-1:0]      psb_pio_ext_rd_data; // Read data from the external bypass pio register

  // Debug Port Interface
  // PSB 
  wire [5:0] 				      cr2ps_dbg_sel_a;   // PSB debug select a
  wire [5:0] 				      cr2ps_dbg_sel_b;   // PSB debug select b
   
  wire [`FIRE_DBG_DATA_BITS] 		      ps2cr_dbg_a;       // PSB debug output a
  wire [`FIRE_DBG_DATA_BITS] 		      ps2cr_dbg_b;       // PSB debug output b
   
   // PTG
  wire [2:0] 				      dbg2ptg_dbg_sel_a; // PTG debug select a
  wire [2:0] 				      dbg2ptg_dbg_sel_b; // PTG debug select b
   
  wire [`FIRE_DBG_DATA_BITS] 		      ptg2dbg_dbg_a;     // PTG debug output a
  wire [`FIRE_DBG_DATA_BITS] 		      ptg2dbg_dbg_b;     // PTG debug output b
   
   // PDL
  wire [2:0] 				      dbg2pdl_dbg_sel_a; // PDL debug select a
  wire [2:0] 				      dbg2pdl_dbg_sel_b; // PDL debug select b
   
  wire [`FIRE_DBG_DATA_BITS] 		      pdl2dbg_dbg_a;     // PDL debug output a
  wire [`FIRE_DBG_DATA_BITS] 		      pdl2dbg_dbg_b;     // PDL debug output b
   
   // PIC
  wire [2:0] 				      dbg2pic_dbg_sel_a; // PIC debug select a
  wire [2:0] 				      dbg2pic_dbg_sel_b; // PIC debug select b
   
  wire [`FIRE_DBG_DATA_BITS] 		      pic2dbg_dbg_a;     // PIC debug output a
  wire [`FIRE_DBG_DATA_BITS] 		      pic2dbg_dbg_b;     // PIC debug output b
   
   // PCE 
  wire [2:0] 				      dbg2pce_dbg_sel_a; // PCE debug select a
  wire [2:0] 				      dbg2pce_dbg_sel_b; // PCE debug select b
   
  wire [`FIRE_DBG_DATA_BITS] 		      pce2dbg_dbg_a;     // PCE debug output a
  wire [`FIRE_DBG_DATA_BITS] 		      pce2dbg_dbg_b;     // PCE debug output b
  
  //////////////////////////////////////////////////////////////////////
  //***************   Zero in Checkers  ***********************
  //////////////////////////////////////////////////////////////////////
  
  // 0in req_ack -req pm2ps_i_req -ack ps2pm_i_gnt -req_until_ack -new_req_after_ack
  // 0in req_ack -req cl2ps_e_req -ack ps2cl_e_gnt -req_until_ack -new_req_after_ack
  
  // 0in known_driven -var pm2ps_i_req
  // 0in known_driven -var pm2ps_i_cmd_type -active pm2ps_i_req
  // 0in known_driven -var pm2ps_i_trn -active pm2ps_i_req
  // 0in known_driven -var pm2ps_i_wr_data -active pm2ps_i_req
  // 0in known_driven -var ps2pm_i_full
  // 0in known_driven -var ps2pm_i_gnt
  // 0in known_driven -var ps2pm_i_n_trn -active ps2pm_i_gnt
  // 0in known_driven -var ps2pm_i_rd_data -active ps2pm_i_gnt
  
  // 0in known_driven -var cl2ps_e_req
  // 0in known_driven -var cl2ps_e_cmd_type -active cl2ps_e_req
  // 0in known_driven -var cl2ps_e_trn -active cl2ps_e_req
  // 0in known_driven -var cl2ps_e_wr_data -active (cl2ps_e_req & cl2ps_e_cmd_type[3])
  // 0in known_driven -var ps2cl_e_gnt
  // 0in known_driven -var ps2cl_e_rd_data -active ps2cl_e_gnt

// PIO memory access checker
  /* 0in memory_access 
     -read  (pm2ps_i_req & (pm2ps_i_cmd_type == 4'b1001) & ps2pm_i_gnt)
     -write (cl2ps_e_req & (cl2ps_e_cmd_type == 4'b1100) & ps2cl_e_gnt)
     -read_addr pm2ps_i_trn[3:0] 
     -write_addr cl2ps_e_trn[3:0] 
     -initialized
     -single_write
     -single_read
     -read_data ps2pm_i_rd_data[6:0]
     -write_data cl2ps_e_wr_data[6:0]
   */
//     -read_data ps2pm_i_rd_data[5:0]
//BP n2 5-24-04
//     -write_data cl2ps_e_wr_data[5:0]

// DMA memory access checker
  /* 0in memory_access 
     -read (cl2ps_e_req & (cl2ps_e_cmd_type == 4'b0011) & ps2cl_e_gnt)
     -write (pm2ps_i_req & (pm2ps_i_cmd_type == 4'b0101) & ps2pm_i_gnt)
     -read_addr cl2ps_e_trn
     -write_addr ps2pm_i_n_trn
     -initialized
     -single_write
     -single_read
     -read_data ps2cl_e_rd_data
     -write_data pm2ps_i_wr_data
     */

  //////////////////////////////////////////////////////////////////////
  //***************   Submodule Instantiations   ***********************
  //////////////////////////////////////////////////////////////////////
   
  //*************************************************************
  // PTG (Packet Tag Generator)
  //*************************************************************
  
  
  dmu_psb_ptg ptg
    (
     // Control Signals    
     .clk                   (clk), 
     .rst_l                 (rst_l),
     
     // PIC-TTG INTERFACE
     // PIC-TTG Interface (Internal Input from PIC to PTG)
     .tag_deq               (pic2ptg_deq),                        // dequeue next pktag 
     
     // PTG-PIC Interface (Internal Output to PIC)
     .no_tag_avail          (ptg2pic_pktag_full),                 // no transaction tags available for issue
     .tag_issue             (ptg2pic_n_pktag),                    // next pktag to issue
     
     // PCE-PTG Interface (Internal Input from PCE to PTG)
     .tag_enq               (pce2ptg_enq),                        // enqueue pktag (Clear / Retire)
     .tag_retire            (pce2ptg_pktag),                      // packet tag to retire from pce controller

     // Debug Ports
     .ptg2dbg_dbg_a         (ptg2dbg_dbg_a),
     .ptg2dbg_dbg_b         (ptg2dbg_dbg_b),
     .dbg2ptg_dbg_sel_a     (dbg2ptg_dbg_sel_a),
     .dbg2ptg_dbg_sel_b     (dbg2ptg_dbg_sel_b)
          
     );
  
  //*************************************************************
  // PIC (Packet Ingress Scoreboard Controller)
  //*************************************************************
 
  // Parameters : CMD_TYPE_WIDTH, TAG_WIDTH, WR_DATA_WIDTH, RD_DATA_WIDTH
//BP n2 5-25-04
//  dmu_common_scoreboard_controller #(4,5,41,6) pic
  dmu_common_scoreboard_controller #(4,5,41,7) pic
    (
     // Control Signals     
     .clk            (clk),
     .rst_l          (rst_l),
     
     // PRM INTERFACE (PRM Command Type is Read and TRN request w/ write)
     // PMU's PRM-PIC Interface (External Input from PRM to PIC)
     .req_in         (pm2ps_i_req),                               // request for access
     .cmd_type_in    (pm2ps_i_cmd_type),                          // type of action requested (Read, TRN request w/ write)
     .trn_in         (pm2ps_i_trn),                               // pktag                    (for Read)
     .wr_data_in     (pm2ps_i_wr_data),                           // DMA data to be written to the scoreboard
     
     // PIC-PMU's PRM (External Output to PRM)
     .full_out       (ps2pm_i_full),                              // no pktags available so no request can be made
     .n_trn_out      (ps2pm_i_n_trn),                             // next pktag issued to PRM
     .rd_data_out    (ps2pm_i_rd_data),                           // PIO data sent to PRM
     .grant_out      (ps2pm_i_gnt),                               // grant for prm's request
     
     // PDL-PIC INTERFACE
     // PDL-PIC (Internal Input from PDL to PIC)
     .rd_data_in     (pdl2pic_pio_rd_data),                           // PIO data read from the scoreboard
     
     // PIC-PDL (Internal Output to PDL)
     .wr1_out        (pic2pdl_dma_wr),                            // DMA write enable to PDL
     .wr2_out        (),
     .trn1_out       (pic2pdl_pktag),                             // pktag is address to read from and write to scoreboard
     .type_out       (pic2pdl_type),                              // cmd type to pdl to determine  pio or dma
     .wr_data_out    (pic2pdl_dma_wr_data),                           // DMA data written to Scoreboard
     .req_out        (pic2pdl_req),                               // PIC to PDL req
     
     // PTG INTERFACE
     // PTG-PIC (Internal Input from PTG to PIC)
     .full_in        (ptg2pic_pktag_full),                        // full signal from ptg (no packet tags available for issue)
     .n_trn_in       (ptg2pic_n_pktag),                           // next pktag to issue
     
     // PIC-PTG (Internal Output to PTG)
     .deq_out        (pic2ptg_deq),                               // dequeue next pktag for trn request
     .trn2_out       (),      
     .enq_out        (),

     // debug Ports
     .dbg_a          (pic2dbg_dbg_a),         // PIC debug output a
     .dbg_b          (pic2dbg_dbg_b),         // PIC debug output b
     .dbg_sel_a      (dbg2pic_dbg_sel_a),     // PIC debug select a
     .dbg_sel_b      (dbg2pic_dbg_sel_b)      // PIC debug select b
  
     );


  //*************************************************************
  //  PCE (Packet Egress Scoreboard Controller)
  //*************************************************************
  
  // Parameters : CMD_TYPE_WIDTH, TAG_WIDTH, WR_DATA_WIDTH, RD_DATA_WIDTH
//BP n2 5-24-04
//  dmu_common_scoreboard_controller #(4,5,6,41) pce
  dmu_common_scoreboard_controller #(4,5,7,41) pce
    (
     // Control Signals
     .clk            (clk),
     .rst_l          (rst_l),
     
     // CRM INTERFACE  (CRM command type includes Read, Write, Clear and Read w/ Clear)
     // CLU's CRM-PCE Interface (External Input from CRM to PCE)
     .req_in         (cl2ps_e_req),            // request for access
     .cmd_type_in    (cl2ps_e_cmd_type),       // type of action requested (Read, Write, Clear and Read w/ Clear)
     .trn_in         (cl2ps_e_trn),            // pktag                    (for Read, Clear and Read w/ Clear)
     .wr_data_in     (cl2ps_e_wr_data),        // DMA data to be written to the scoreboard
     
     // PCE-CLU's CRM Interface (External Output to CRM)
     .full_out       (),
     .n_trn_out      (),
     .rd_data_out    (ps2cl_e_rd_data),        // DMA data to be read from the scoreboard
     .grant_out      (ps2cl_e_gnt),            // grant for crm's request

     // PDL-PCE INTERFACE
     // PDL-PCE (Internal Input from PDL to PCE)
     .rd_data_in     (pdl2pce_dma_rd_data),        // DMA data read from PDL
     
     // PCE-PDL (Internal Output to PDL)
     .wr1_out        (),                       
     .wr2_out        (pce2pdl_pio_wr),         // pio write enable to PDL
     .trn1_out       (pce2pdl_pktag),          // pktag is address to read from and write to scoreboard
     .type_out       (pce2pdl_type),           // pio = 1 dma = 0
     .wr_data_out    (pce2pdl_pio_wr_data),    // data written to PDL
     .req_out        (pce2pdl_req),            // PCE req to PDL

     // PTG INTERFACE
     // PTG-PCE (Internal Input from PTG to PCE)
     .full_in        (1'b0),
     .n_trn_in       (5'b0),
     
     // PCE-PTG (Internal Output to PTG)
     .deq_out        (),
     .trn2_out       (pce2ptg_pktag),         // pktag to retire (Clear)
     .enq_out        (pce2ptg_enq),           // enqueue to retire pktag

     // debug Ports
     .dbg_a          (pce2dbg_dbg_a),         // PCE debug output a
     .dbg_b          (pce2dbg_dbg_b),         // PCE debug output b
     .dbg_sel_a      (dbg2pce_dbg_sel_a),     // PCE debug select a
     .dbg_sel_b      (dbg2pce_dbg_sel_b)      // PCE debug select b
     );

  //*************************************************************
  // PDL (PSB DECODE LOGIC and Register Storage array for Scoreboard)
  //*************************************************************

  dmu_psb_pdl pdl
    ( 
      // Control Signals
      .clk                            (clk),
      .rst_l                          (rst_l),
      
      // PIC-PDL Interface (Internal Input from PIC to PDL)
      .pic2pdl_dma_wr_in              (pic2pdl_dma_wr),
      .pic2pdl_pktag_in               (pic2pdl_pktag),
      .pic2pdl_type_in                (pic2pdl_type),
      .pic2pdl_dma_wr_data_in         (pic2pdl_dma_wr_data),
      .pic2pdl_req_in                 (pic2pdl_req),

      // Output from PDL to PIC Controller
      .pdl2pic_pio_rd_data_out        (pdl2pic_pio_rd_data),   
      
      // PCE-PDL Interface (Internal Input from PCE to PDL)
      .pce2pdl_pio_wr_in              (pce2pdl_pio_wr),
      .pce2pdl_pktag_in               (pce2pdl_pktag),
      .pce2pdl_type_in                (pce2pdl_type),
      .pce2pdl_pio_wr_data_in         (pce2pdl_pio_wr_data),
      .pce2pdl_req_in                 (pce2pdl_req),

      // Output from PDL to PCE Controller
      .pdl2pce_dma_rd_data_out        (pdl2pce_dma_rd_data),

      // CSR interface
      .ext_addr                       (ext_addr),
      .psb_dma_ext_done               (psb_dma_ext_done),
      .psb_pio_ext_done               (psb_pio_ext_done),
      .psb_dma_ext_select             (psb_dma_ext_select),
      .psb_dma_ext_rd_data            (psb_dma_ext_rd_data),
      .psb_pio_ext_select             (psb_pio_ext_select),
      .psb_pio_ext_rd_data            (psb_pio_ext_rd_data),

      // Debug Ports
      .pdl2dbg_dbg_a                  (pdl2dbg_dbg_a),
      .pdl2dbg_dbg_b                  (pdl2dbg_dbg_b),
      .dbg2pdl_dbg_sel_a              (dbg2pdl_dbg_sel_a),
      .dbg2pdl_dbg_sel_b              (dbg2pdl_dbg_sel_b)
      );
  
  //*************************************************************
  // PSB CSR Packet Scoreboard CSR's
  //*************************************************************
  
  dmu_psb_csr csr
    (
     .clk                            (clk),
     .rst_l                          (rst_l),
     .csrbus_valid                   (cr2ps_csrbus_valid),
     .csrbus_done                    (ps2cr_csrbus_done),
     .csrbus_mapped                  (ps2cr_csrbus_mapped),
     .csrbus_wr_data                 (cr2ps_csrbus_wr_data),
     .csrbus_wr                      (cr2ps_csrbus_wr),
     .csrbus_read_data               (ps2cr_csrbus_read_data),
     .csrbus_addr                    (cr2ps_csrbus_addr),
     .csrbus_src_bus                 (cr2ps_csrbus_src_bus),
     .csrbus_acc_vio                 (ps2cr_csrbus_acc_vio),
     .instance_id                    (j2d_instance_id),
     .ext_addr                       (ext_addr),
     .psb_dma_ext_done               (psb_dma_ext_done),
     .psb_pio_ext_done               (psb_pio_ext_done),
     .psb_dma_ext_select             (psb_dma_ext_select),
     .psb_dma_entry_ext_read_data    (psb_dma_ext_rd_data),
     .psb_pio_ext_select             (psb_pio_ext_select),
     .psb_pio_entry_ext_read_data    (psb_pio_ext_rd_data)
     ); 
  //*************************************************************
  // PSB Debug Module
  //*************************************************************
  dmu_psb_dbg dbg
    (
     .clk                     (clk), 	
     .rst_l                   (rst_l),

     // PSB 
     .cr2ps_dbg_sel_a         (cr2ps_dbg_sel_a),   // PSB debug select a
     .cr2ps_dbg_sel_b         (cr2ps_dbg_sel_b),   // PSB debug select b
     
     .ps2cr_dbg_a             (ps2cr_dbg_a),       // PSB debug output a
     .ps2cr_dbg_b             (ps2cr_dbg_b),       // PSB debug output b

     // PTG
     .dbg2ptg_dbg_sel_a       (dbg2ptg_dbg_sel_a), // PTG debug select a
     .dbg2ptg_dbg_sel_b       (dbg2ptg_dbg_sel_b), // PTG debug select b
     
     .ptg2dbg_dbg_a           (ptg2dbg_dbg_a),     // PTG debug output a
     .ptg2dbg_dbg_b           (ptg2dbg_dbg_b),     // PTG debug output b
     
     // PDL
     .dbg2pdl_dbg_sel_a       (dbg2pdl_dbg_sel_a), // PDL debug select a
     .dbg2pdl_dbg_sel_b       (dbg2pdl_dbg_sel_b), // PDL debug select b
     
     .pdl2dbg_dbg_a           (pdl2dbg_dbg_a),     // PDL debug output a
     .pdl2dbg_dbg_b           (pdl2dbg_dbg_b),     // PDL debug output b

     // PIC
     .dbg2pic_dbg_sel_a       (dbg2pic_dbg_sel_a), // PIC debug select a
     .dbg2pic_dbg_sel_b       (dbg2pic_dbg_sel_b), // PIC debug select b
     
     .pic2dbg_dbg_a           (pic2dbg_dbg_a),     // PIC debug output a
     .pic2dbg_dbg_b           (pic2dbg_dbg_b),     // PIC debug output b
     
     // PCE 
     .dbg2pce_dbg_sel_a       (dbg2pce_dbg_sel_a), // PCE debug select a
     .dbg2pce_dbg_sel_b       (dbg2pce_dbg_sel_b), // PCE debug select b
     
     .pce2dbg_dbg_a           (pce2dbg_dbg_a),     // PCE debug output a
     .pce2dbg_dbg_b           (pce2dbg_dbg_b)      // PCE debug output b
     );

endmodule // dmu_psb
