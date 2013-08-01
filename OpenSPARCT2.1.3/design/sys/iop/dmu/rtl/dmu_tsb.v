// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_tsb.v
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
module dmu_tsb 
  ( 
    // Control Signals
    clk,
    rst_l,
    
    // RMU SRM interface
    rm2ts_i_req,
    rm2ts_i_cmd_type,
    rm2ts_i_wr_data,
    
    ts2rm_i_full,
    ts2rm_i_gnt,
    ts2rm_i_n_trn,
    
    //RMU RRM interface
    rm2ts_e_req,
    rm2ts_e_cmd_type, 
    rm2ts_e_trn,
    rm2ts_e_wr_data,
    
    ts2rm_e_gnt,
    ts2rm_e_rd_data,
    
    // CSR interface
    cr2ts_csrbus_valid,
    cr2ts_csrbus_src_bus,
    cr2ts_csrbus_addr,
    cr2ts_csrbus_wr,
    cr2ts_csrbus_wr_data,
    
    ts2cr_csrbus_mapped,
    ts2cr_csrbus_read_data,
    ts2cr_csrbus_done,
    ts2cr_csrbus_acc_vio,
    j2d_instance_id,

    // Debug Ports
    cr2ts_dbg_sel_a,
    cr2ts_dbg_sel_b,

    ts2cr_dbg_a,
    ts2cr_dbg_b
    );
   
  // synopsys sync_set_reset "rst_l"
  
  //////////////////////////////////////////////////////////////////////
  //*************************   Port Declarations   *******************
  //////////////////////////////////////////////////////////////////////
  
  // Control signals
  input                                          clk;
  input 					 rst_l;
   
  // Debug Ports
  input [5:0] 				         cr2ts_dbg_sel_a;
  input [5:0] 				         cr2ts_dbg_sel_b;
  
  output [`FIRE_DBG_DATA_BITS] 		         ts2cr_dbg_a;
  output [`FIRE_DBG_DATA_BITS] 		         ts2cr_dbg_b;

  //  RMU's SRM Interface Signals
  input 					 rm2ts_i_req;        // SRM request for access 
  input  [`FIRE_DLC_TSR_CMD_TYPE_WDTH-1:0] 	 rm2ts_i_cmd_type;   // type of access requested (trn req w/write) 
  input  [`FIRE_DLC_TSR_WR_DATA_WDTH-1:0] 	 rm2ts_i_wr_data;    // wr data to be put on scbd
  
  output 					 ts2rm_i_full;       // flow control, no request for trtag can be made
  output [`FIRE_DLC_TSR_TRN_WDTH-1:0] 		 ts2rm_i_n_trn;      // next trtag returned on trn request
  output 					 ts2rm_i_gnt;        // grant signal for request
  
  // /RMU's RRM Interface Signals
  input 					 rm2ts_e_req;        // RRM request for access 
  input  [`FIRE_DLC_TSR_CMD_TYPE_WDTH-1:0] 	 rm2ts_e_cmd_type;   // type of access requested (read, write, read w/clear)
  input  [`FIRE_DLC_TSR_TRN_WDTH-1:0] 		 rm2ts_e_trn;        // trtag to be cleared, read from or written to
  input  [`FIRE_DLC_TSR_WR_DATA_WDTH-1:0] 	 rm2ts_e_wr_data;    // wr data to be put on scbd
  
  output 					 ts2rm_e_gnt;        // grant signal for request
  output [`FIRE_DLC_TSR_RD_DATA_WDTH-1:0] 	 ts2rm_e_rd_data;    // data read from scbd (trtag is address read from)
  
  // CRU's DCC PIO Interface Signals 
  input  [`FIRE_CSR_SRC_BUS_ID_WIDTH-1:0] 	 cr2ts_csrbus_src_bus; 
  input 					 cr2ts_csrbus_valid;
  input  [`FIRE_CSR_ADDR_MAX_WIDTH-1:0] 	 cr2ts_csrbus_addr;
  input 					 cr2ts_csrbus_wr; 
  input  [`FIRE_CSR_DATA_WIDTH-1:0] 		 cr2ts_csrbus_wr_data;
  input [`FIRE_J2D_INSTANCE_ID_WDTH-1:0] 	 j2d_instance_id;

  output [`FIRE_CSR_DATA_WIDTH-1:0] 		 ts2cr_csrbus_read_data;
  output 					 ts2cr_csrbus_done;
  output 					 ts2cr_csrbus_mapped; 
  output 					 ts2cr_csrbus_acc_vio;
  
  //////////////////////////////////////////////////////////////////////
  //*************************    Wires   ******************************* 
  //////////////////////////////////////////////////////////////////////  
  
  // TIC-TTG Interface
  wire 						 tic2ttg_deq;          // dequeue next trtag
  wire 						 ttg2tic_trtag_full;   // flow control from TTG to controller, no more trtags
  wire [`FIRE_DLC_TSR_TRN_WDTH-1:0] 		 ttg2tic_n_trtag;      // trtag returned to controller on deq
  
  // TEC-TTG Interface
  wire [`FIRE_DLC_TSR_TRN_WDTH-1:0] 		 tec2ttg_trtag;        // trtag retired on enq
  wire 						 tec2ttg_enq;          // enqueue trtag (clear/retire)
  
  // TIC-TDL Interface for DMA data write
  wire 						 tic2tdl_req;          // TIC req to TDL
  wire 						 tic2tdl_dma_wr;       // write enable
  wire [`FIRE_DLC_TSR_TRN_WDTH-1:0] 		 tic2tdl_trtag;        // tic-tdl wr address decode select
  wire [`FIRE_DLC_TSR_WR_DATA_WDTH-1:0] 	 tic2tdl_wr_data;      // dma data to wr to scbd
  
  // Read data select
  wire [`FIRE_DLC_TSR_TRN_WDTH-1:0] 		 tec2tdl_trtag;        // tec-tdl rd/wr address decode select
  
  // DMA Read data out to TEC
  wire [`FIRE_DLC_TSR_RD_DATA_WDTH-1:0] 	 tdl2tec_rd_data;      // dma read date from scbd
  
  // TEC-TDL Interface for DMA data write
  wire 						 tec2tdl_req;          // TEC req to TDL
  wire 						 tec2tdl_dma_wr;       // write enable  
  wire [`FIRE_DLC_TSR_WR_DATA_WDTH-1:0] 	 tec2tdl_wr_data;      // dma data to wr to scbd

  // CSR Interface
  wire [`FIRE_DLC_TSR_TRN_WDTH-1:0] 		 ext_addr;            // External address bus for dcm dlc_tsb
  wire 					         tsb_dma_ext_done;    // acknowledges rd and wr operations for tsb_dma.
  wire 						 tsb_dma_ext_select;  // When set, register tsb_dma is selected.
  wire [`FIRE_DLC_TSR_RD_DATA_WDTH-1:0] 	 tsb_dma_ext_rd_data; // Read data from the external bypass dma register

  wire                                           tsb_sts_ext_select;
  wire                                           tsb_sts_ext_done;
  wire                                           tsb_sts_full_ext_read_data;
  wire [5:0]                                     tsb_sts_num_pnd_dma_ext_read_data;
  wire                                           tsb_sts_empty_ext_read_data;

  // Debug Port Interface

  // TSB 
  wire [5:0] 				      cr2ts_dbg_sel_a;   // TSB debug select a
  wire [5:0] 				      cr2ts_dbg_sel_b;   // TSB debug select b
   
  wire [`FIRE_DBG_DATA_BITS] 		      ts2cr_dbg_a;       // TSB debug output a
  wire [`FIRE_DBG_DATA_BITS] 		      ts2cr_dbg_b;       // TSB debug output b

  // TTG
  wire [2:0] 				      dbg2ttg_dbg_sel_a; // TTG debug select a
  wire [2:0] 				      dbg2ttg_dbg_sel_b; // TTG debug select b
   
  wire [`FIRE_DBG_DATA_BITS] 		      ttg2dbg_dbg_a;     // TTG debug output a
  wire [`FIRE_DBG_DATA_BITS] 		      ttg2dbg_dbg_b;     // TTG debug output b
   
   // TDL
  wire [2:0] 				      dbg2tdl_dbg_sel_a; // TDL debug select a
  wire [2:0] 				      dbg2tdl_dbg_sel_b; // TDL debug select b
   
  wire [`FIRE_DBG_DATA_BITS] 		      tdl2dbg_dbg_a;     // TDL debug output a
  wire [`FIRE_DBG_DATA_BITS] 		      tdl2dbg_dbg_b;     // TDL debug output b
   
   // TIC
  wire [2:0] 				      dbg2tic_dbg_sel_a; // TIC debug select a
  wire [2:0] 				      dbg2tic_dbg_sel_b; // TIC debug select b
   
  wire [`FIRE_DBG_DATA_BITS] 		      tic2dbg_dbg_a;     // TIC debug output a
  wire [`FIRE_DBG_DATA_BITS] 		      tic2dbg_dbg_b;     // TIC debug output b
   
   // TEC 
  wire [2:0] 				      dbg2tec_dbg_sel_a; // TEC debug select a
  wire [2:0] 				      dbg2tec_dbg_sel_b; // TEC debug select b
   
  wire [`FIRE_DBG_DATA_BITS] 		      tec2dbg_dbg_a;     // TEC debug output a
  wire [`FIRE_DBG_DATA_BITS] 		      tec2dbg_dbg_b;     // TEC debug output b
  
  //////////////////////////////////////////////////////////////////////
  //***************  Zero in Checkers***********************
  //////////////////////////////////////////////////////////////////////
  
  // 0in req_ack -req rm2ts_i_req -ack ts2rm_i_gnt -req_until_ack -new_req_after_ack
  // 0in req_ack -req rm2ts_e_req -ack ts2rm_e_gnt -req_until_ack -new_req_after_ack
  
  // 0in known_driven -var rm2ts_i_req
  // 0in known_driven -var rm2ts_i_cmd_type -active rm2ts_i_req
  // 0in known_driven -var rm2ts_i_wr_data -active rm2ts_i_req
  // 0in known_driven -var ts2rm_i_full
  // 0in known_driven -var ts2rm_i_gnt
  // 0in known_driven -var ts2rm_i_n_trn -active ts2rm_i_gnt
  
  // 0in known_driven -var rm2ts_e_req
  // 0in known_driven -var rm2ts_e_cmd_type -active rm2ts_e_req
  // 0in known_driven -var rm2ts_e_trn -active rm2ts_e_req
  // 0in known_driven -var rm2ts_e_wr_data -active rm2ts_e_req
  // 0in known_driven -var ts2rm_e_gnt
  // 0in known_driven -var ts2rm_e_rd_data -active ts2rm_e_gnt
   
  /* 0in multi_port_memory_access 
     -read (rm2ts_e_req & ((rm2ts_e_cmd_type == 4'b0001) | (rm2ts_e_cmd_type == 4'b0011)) & ts2rm_e_gnt)
     -write (rm2ts_e_req & ((rm2ts_e_cmd_type == 4'b0100) | (rm2ts_e_cmd_type == 4'b0101)) & ts2rm_e_gnt) (rm2ts_i_req & ((rm2ts_i_cmd_type == 4'b0100) | (rm2ts_i_cmd_type == 4'b0101)) & ts2rm_i_gnt)
     -read_addr rm2ts_e_trn
     -write_addr rm2ts_e_trn ts2rm_i_n_trn
     -initialized
     -single_write
     -single_read
     -read_data ts2rm_e_rd_data
     -write_data rm2ts_e_wr_data rm2ts_i_wr_data
      */
 
  //////////////////////////////////////////////////////////////////////
  //***************   Submodule Instantiations   ***********************
  //////////////////////////////////////////////////////////////////////
  
  //*************************************************************
  // TTG (Transaction Tag Generator)
  //*************************************************************  
  
  dmu_tsb_ttg ttg
    (
     // Control Signals
     .clk                   (clk), 
     .rst_l                 (rst_l),
     
     // TIC-TTG INTERFACE
     // TIC-TTG Interface (Internal Input from TIC to TTG)
     .tag_deq               (tic2ttg_deq),          // dequeue next trtag 
     
     // TTG-TIC Interface (Internal Output to TIC)
     .no_tag_avail          (ttg2tic_trtag_full),   // no transaction tags available for issue
     .tag_issue             (ttg2tic_n_trtag),      // next trtag to issue    
     
     // TEC-TTG Interface (Internal Input from TEC to TTG)
     .tag_enq               (tec2ttg_enq),          // enqueue trtag (Clear / Retire)
     .tag_retire            (tec2ttg_trtag),        // transaction tag to retire from tec controller
    
     // CSR i/f for STATUS reg
     .tsb_sts_ext_select	  (tsb_sts_ext_select),
     .tsb_sts_full_ext_read_data  (tsb_sts_full_ext_read_data),
     .tsb_sts_num_pnd_dma_ext_read_data (tsb_sts_num_pnd_dma_ext_read_data),
     .tsb_sts_empty_ext_read_data (tsb_sts_empty_ext_read_data),
     .tsb_sts_ext_done		  (tsb_sts_ext_done),

     // Debug Ports
     .ttg2dbg_dbg_a         (ttg2dbg_dbg_a),
     .ttg2dbg_dbg_b         (ttg2dbg_dbg_b),
     .dbg2ttg_dbg_sel_a     (dbg2ttg_dbg_sel_a),
     .dbg2ttg_dbg_sel_b     (dbg2ttg_dbg_sel_b)
  );  
  
  //*************************************************************
  // TIC (Transaction Ingress Scoreboard Controller)
  //*************************************************************

  // passing in CMD_TYPE_WIDTH, TAG_WIDTH,  WR_DATA_WIDTH and RD_DATA_WIDTH
  dmu_common_scoreboard_controller #(4,5,48,48) tic
    (
     // Control Signals     
     .clk            (clk),
     .rst_l          (rst_l),
     
     // SRM INTERFACE (SRM Command Type is TRN request w/ write)
     // RMU's SRM-TIC Interface (External Input from SRM to TIC)
     .req_in         (rm2ts_i_req),                     // request for access
     .cmd_type_in    (rm2ts_i_cmd_type),                // type of action requested (TRN request w/ write)
     .trn_in         (5'b0),
     .wr_data_in     (rm2ts_i_wr_data),                 // DMA data to be written to the scoreboard
     
     // TIC-RMU's SRM (External Output to SRM)
     .full_out       (ts2rm_i_full),                    // no trtags available so no request can be made
     .n_trn_out      (ts2rm_i_n_trn),                   // next trtag issued to SRM
     .rd_data_out    (),
     .grant_out      (ts2rm_i_gnt),                     // grant for srm's request
     
     // TDL-TIC INTERFACE
     // TDL-TIC (Internal Input from TDL to TIC)
     .rd_data_in     (48'b0),
     
     // TIC-TDL (Internal Output to TDL)
     .wr1_out        (tic2tdl_dma_wr),                  // DMA write enable to TDL
     .wr2_out        (),
     .trn1_out       (tic2tdl_trtag),                   // trtag is address to read from and write to scoreboard
     .type_out       (),
     .wr_data_out    (tic2tdl_wr_data),                 // DMA data written to TDL
     .req_out        (tic2tdl_req),                     // TIC req to TDL
     
     // TTG INTERFACE
     // TTG-TIC (Internal Input from TTG to TIC)
     .full_in        (ttg2tic_trtag_full),              // full signal from ttg (no trans. tags available for issue)
     .n_trn_in       (ttg2tic_n_trtag),                 // next trtag to issue
     
     // TIC-TTG (Internal Output to TTG)
     .deq_out        (tic2ttg_deq),                     // dequeue next trtag for trn request
     .trn2_out       (),      
     .enq_out        (),

     // debug Ports
     .dbg_a          (tic2dbg_dbg_a),             // TIC debug output a
     .dbg_b          (tic2dbg_dbg_b),             // TIC debug output b
     .dbg_sel_a      (dbg2tic_dbg_sel_a),         // TIC debug select a
     .dbg_sel_b      (dbg2tic_dbg_sel_b)          // TIC debug select b
  
     );


  //*************************************************************
  //  TEC (Transaction Egress Scoreboard Controller)
  //*************************************************************
  
   // passing in CMD_TYPE_WIDTH, TAG_WIDTH,  WR_DATA_WIDTH and RD_DATA_WIDTH
  dmu_common_scoreboard_controller #(4,5,48,48) tec
    (
     // Control Signals
     .clk            (clk),
     .rst_l          (rst_l),
     
     // RRM INTERFACE  (RRM command type includes Read, Write and Read w/ Clear)
     // RMU's RRM-TEC Interface (External Input from RRM to TEC)
     .req_in         (rm2ts_e_req),            // request for access
     .cmd_type_in    (rm2ts_e_cmd_type),       // type of action requested (Read, Write and Read w/ Clear)
     .trn_in         (rm2ts_e_trn),            // trtag                    (for Read and Read w/ Clear)
     .wr_data_in     (rm2ts_e_wr_data),        // DMA data to be written to the scoreboard
     
     // TEC-RMU's RRM Interface (External Output to RRM)
     .full_out       (),
     .n_trn_out      (),
     .rd_data_out    (ts2rm_e_rd_data),        // DMA data to be read from the scoreboard
     .grant_out      (ts2rm_e_gnt),            // grant for rrm's request

     // TDL-TEC INTERFACE
     // TDL-TEC (Internal Input from TDL to TEC)
     .rd_data_in     (tdl2tec_rd_data),        // DMA data read from TDL
     
     // TEC-TDL (Internal Output to TDL)
     .wr1_out        (tec2tdl_dma_wr),         // DMA write enable to TDL
     .wr2_out        (),
     .trn1_out       (tec2tdl_trtag),          // trtag is address to read from and write to scoreboard
     .type_out       (),
     .wr_data_out    (tec2tdl_wr_data),        // DMA data written to TDL
     .req_out        (tec2tdl_req),            // TEC req to TDL   

     // TTG INTERFACE
     // TTG-TEC (Internal Input from TTG to TEC)
     .full_in        (1'b0),
     .n_trn_in       (5'b0),
     
     // TEC-TTG (Internal Output to TTG)
     .deq_out        (),
     .trn2_out       (tec2ttg_trtag),           // trtag to retire (Clear)
     .enq_out        (tec2ttg_enq),             // enqueue to retire trtag
     
     // debug Ports
     .dbg_a          (tec2dbg_dbg_a),           // TEC debug output a
     .dbg_b          (tec2dbg_dbg_b),           // TEC debug output b
     .dbg_sel_a      (dbg2tec_dbg_sel_a),       // TEC debug select a
     .dbg_sel_b      (dbg2tec_dbg_sel_b)        // TEC debug select b
  
     );

  //*************************************************************
  // TDL (TSB DECODE LOGIC and Register Storage array for Scoreboard)
  //*************************************************************

  dmu_tsb_tdl tdl
    (
     // control signals
     .clk                       (clk),
     .rst_l                     (rst_l),

     // TIC-TDL Interface (Internal Input from TEC to TDL)
     .tic2tdl_wr_in             (tic2tdl_dma_wr),
     .tic2tdl_trtag_in          (tic2tdl_trtag),
     .tic2tdl_wr_data_in        (tic2tdl_wr_data),
     .tic2tdl_req_in            (tic2tdl_req),

     // TEC-TDL Interface (Internal Input from TIC to TDL)
     .tec2tdl_wr_in             (tec2tdl_dma_wr),
     .tec2tdl_trtag_in          (tec2tdl_trtag),
     .tec2tdl_wr_data_in        (tec2tdl_wr_data),
     .tec2tdl_req_in            (tec2tdl_req), 
    
     // TDL-TEC Interface (Output to TEC)
     .tdl2tec_rd_data_out       (tdl2tec_rd_data),

     // CSR interface
     .ext_addr                  (ext_addr),
     .tsb_dma_ext_done          (tsb_dma_ext_done),
     .tsb_dma_ext_select        (tsb_dma_ext_select),
     .tsb_dma_ext_rd_data       (tsb_dma_ext_rd_data),
 
      // Debug Ports
      .tdl2dbg_dbg_a                  (tdl2dbg_dbg_a),
      .tdl2dbg_dbg_b                  (tdl2dbg_dbg_b),
      .dbg2tdl_dbg_sel_a              (dbg2tdl_dbg_sel_a),
      .dbg2tdl_dbg_sel_b              (dbg2tdl_dbg_sel_b)
     );


  //*************************************************************
  // TSB CSR Transaction Scoreboard CSR's
  //*************************************************************
  
  dmu_tsb_csr csr
    (
     .clk                         (clk),
     .rst_l                       (rst_l),
     .csrbus_valid                (cr2ts_csrbus_valid),
     .csrbus_done                 (ts2cr_csrbus_done),
     .csrbus_mapped               (ts2cr_csrbus_mapped),
     .csrbus_wr_data              (cr2ts_csrbus_wr_data),
     .csrbus_wr                   (cr2ts_csrbus_wr),
     .csrbus_read_data            (ts2cr_csrbus_read_data),
     .csrbus_addr                 (cr2ts_csrbus_addr),
     .csrbus_src_bus              (cr2ts_csrbus_src_bus),
     .csrbus_acc_vio              (ts2cr_csrbus_acc_vio),
     .instance_id  		  (j2d_instance_id),
     .ext_addr                    (ext_addr),
     .tsb_dma_ext_done            (tsb_dma_ext_done),
     .tsb_dma_ext_select          (tsb_dma_ext_select),
     .tsb_dma_entry_ext_read_data (tsb_dma_ext_rd_data),
     .tsb_sts_ext_select	  (tsb_sts_ext_select),
     .tsb_sts_full_ext_read_data  (tsb_sts_full_ext_read_data),
     .tsb_sts_num_pnd_dma_ext_read_data (tsb_sts_num_pnd_dma_ext_read_data),
     .tsb_sts_empty_ext_read_data (tsb_sts_empty_ext_read_data),
     .tsb_sts_ext_done		  (tsb_sts_ext_done)

     );
 
  //*************************************************************
  // TSB Debug Module
  //*************************************************************
  dmu_tsb_dbg dbg
    (
     .clk                     (clk), 	
     .rst_l                   (rst_l),

     // TSB 
     .cr2ts_dbg_sel_a         (cr2ts_dbg_sel_a),   // TSB debug select a
     .cr2ts_dbg_sel_b         (cr2ts_dbg_sel_b),   // TSB debug select b
     
     .ts2cr_dbg_a             (ts2cr_dbg_a),       // TSB debug output a
     .ts2cr_dbg_b             (ts2cr_dbg_b),       // TSB debug output b

     // TTG
     .dbg2ttg_dbg_sel_a       (dbg2ttg_dbg_sel_a), // TTG debug select a
     .dbg2ttg_dbg_sel_b       (dbg2ttg_dbg_sel_b), // TTG debug select b
     
     .ttg2dbg_dbg_a           (ttg2dbg_dbg_a),     // TTG debug output a
     .ttg2dbg_dbg_b           (ttg2dbg_dbg_b),     // TTG debug output b
     
     // PDL
     .dbg2tdl_dbg_sel_a       (dbg2tdl_dbg_sel_a), // TDL debug select a
     .dbg2tdl_dbg_sel_b       (dbg2tdl_dbg_sel_b), // TDL debug select b
     
     .tdl2dbg_dbg_a           (tdl2dbg_dbg_a),     // TDL debug output a
     .tdl2dbg_dbg_b           (tdl2dbg_dbg_b),     // TDL debug output b

     // PIC
     .dbg2tic_dbg_sel_a       (dbg2tic_dbg_sel_a), // TIC debug select a
     .dbg2tic_dbg_sel_b       (dbg2tic_dbg_sel_b), // TIC debug select b
     
     .tic2dbg_dbg_a           (tic2dbg_dbg_a),     // TIC debug output a
     .tic2dbg_dbg_b           (tic2dbg_dbg_b),     // TIC debug output b
     
     // PCE 
     .dbg2tec_dbg_sel_a       (dbg2tec_dbg_sel_a), // TEC debug select a
     .dbg2tec_dbg_sel_b       (dbg2tec_dbg_sel_b), // TEC debug select b
     
     .tec2dbg_dbg_a           (tec2dbg_dbg_a),     // TEC debug output a
     .tec2dbg_dbg_b           (tec2dbg_dbg_b)      // TEC debug output b
     );
    
endmodule // dmu_tsb
