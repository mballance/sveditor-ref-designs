// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_clu_crm_pktgen.v
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
module dmu_clu_crm_pktgen 
  (
   // clock
   clk,
   rst_l,
   
   // cmu : epr port
   cl2cm_rcd,
   
   // psb : sbd access port
   cl2ps_e_trn,
   cl2ps_e_wr_data,
   psb_rd_bcnt,
   psb_rd_len,
   psb_rd_pktseq,
   psb_rd_cntxtnum,
   psb_rd_sbdtag,
   
   // cru : config packet setup
   cr2cl_bus_num,
   
   // ctm : tag return port
   crm2ctm_tag,
   
   // pkt_gen sel port
   pkt_sel,
   psb_ld,
   trn_sel,
   epr_ld,
   done_psb_rd,
   
   // dcr port
   dcr_cmd,
   dcr_ctag_typ,
   dcr_ctag_trnsnum,
   dcr_ctag_dptr,
   dcr_pktag,
   
   // pcr port
   pcr_cmd,
   pcr_addr,
   pcr_bmsk,
   pcr_ctag_trnsnum,
//BP n2 5-24-04
//   pcr_ctag_agntid,
//   pcr_ctag_trnsid,
   pcr_ctag_thrdid,
   
   // urr port
   urr_typ,
   urr_sbdtag,
   
   // type port
   mdo_vld,
   drd_vld,
   tdr_vld,
   pcr_typ
   );
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Parameter Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // DMA/INT Command Record (DCR) Field Widths
  // --------------------------------------------------------
  
  parameter DCR_CMD_WDTH       = `FIRE_J2D_DI_CMD_WDTH,
	    DCR_PKTAG_WDTH     = 5,
            DCTAG_DPTR_WDTH    = 5,
            DCTAG_TRNSNUM_WDTH = 4;
  
  // --------------------------------------------------------
  // PIO Command Record (PCR) Field Widths
  // --------------------------------------------------------
  
  parameter PCR_CMD_WDTH       = `FIRE_J2D_P_CMD_WDTH,
	    PCR_ADDR_WDTH      = `FIRE_J2D_P_ADDR_WDTH,
	    PCR_BMSK_WDTH      = `FIRE_J2D_P_BMSK_WDTH,
	    PCTAG_TRNSNUM_WDTH = 4,
//BP n2 5-24-04
//	    PCTAG_AGNTID_WDTH  = 4,
//	    PCTAG_TRNSID_WDTH  = 2;
	    PCTAG_THRDID_WDTH  = 7;
  
  // --------------------------------------------------------
  // PIO JBC-to-DMC Command Encoding
  // --------------------------------------------------------
  
  parameter PWR_BLK_M64 = 4'b0000,
	    PWR_BLK_M32 = 4'b0001,
	    PWR_16B_M64 = 4'b0100,
	    PWR_16B_M32 = 4'b0101,
	    PWR_16B_IO  = 4'b0110,
	    PWR_16B_CFG = 4'b0111,
	    PRD_BLK_M64 = 4'b1000,
	    PRD_BLK_M32 = 4'b1001,
	    PRD_16B_M64 = 4'b1100,
	    PRD_16B_M32 = 4'b1101,
	    PRD_16B_IO  = 4'b1110,
	    PRD_16B_CFG = 4'b1111;
  
  // --------------------------------------------------------
  // Unsupported Request Record (URR) Type Encoding
  // --------------------------------------------------------
  
  parameter DMA_MRD_ERR = 3'b001,
	    DMA_MRD_LK  = 3'b010,
	    UNS_REQ     = 3'b100;
  
  // --------------------------------------------------------
  // Egress Packet Record (EPR) Type Encoding
  // --------------------------------------------------------
  
  parameter PIO_MRD_32BIT  = 7'b00_00000,
	    PIO_MRD_64BIT  = 7'b01_00000,
	    PIO_IORD       = 7'b00_00010,
	    PIO_CFGRD_TYP0 = 7'b00_00100,
	    PIO_CFGRD_TYP1 = 7'b00_00101,
	    PIO_MWR_32BIT  = 7'b10_00000,
	    PIO_MWR_64BIT  = 7'b11_00000,
	    PIO_IOWR       = 7'b10_00010,
	    PIO_CFGWR_TYP0 = 7'b10_00100,
	    PIO_CFGWR_TYP1 = 7'b10_00101,
	    MDO_RPLY       = 7'b11_11010,
	    DMA_CPL        = 7'b00_01010,
	    DMA_CPLLK      = 7'b00_01011,
	    DMA_CPLD       = 7'b10_01010;
  
  // --------------------------------------------------------
  // Valid EPR Length Encodings
  // --------------------------------------------------------
  
  parameter ONE_DW     = `FIRE_DLC_EPR_LEN_WDTH'h1,
	    TWO_DW     = `FIRE_DLC_EPR_LEN_WDTH'h2,
	    FOUR_DW    = `FIRE_DLC_EPR_LEN_WDTH'h4,
	    SIXTEEN_DW = `FIRE_DLC_EPR_LEN_WDTH'h10;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // Clock Signal
  // --------------------------------------------------------
  
  input clk;
  input rst_l;
  
  // --------------------------------------------------------
  // CMU Interface
  // --------------------------------------------------------
  
  // egress pkt rcd
  output [(`FIRE_DLC_EPR_REC_WDTH - 1):0] cl2cm_rcd;
  
  // --------------------------------------------------------
  // PSB Interface
  // --------------------------------------------------------
  
  // scoreboard access port
  output [(`FIRE_DLC_PSR_TRN_WDTH - 1):0]     cl2ps_e_trn;
  output [(`FIRE_DLC_PSR_PIO_DATA_WDTH - 1):0] cl2ps_e_wr_data;
  input [(`FIRE_DLC_PSR_BYTECNT_WDTH - 1):0]  psb_rd_bcnt;
  input [(`FIRE_DLC_PSR_LENGTH_WDTH - 1):0]   psb_rd_len;
  input [(`FIRE_DLC_PSR_PKSEQ_WDTH - 1):0]    psb_rd_pktseq;
  input [(`FIRE_DLC_PSR_CNTX_WDTH - 1):0]     psb_rd_cntxtnum;
  input [(`FIRE_DLC_PSR_TRTAG_WDTH - 1):0]    psb_rd_sbdtag;
  
  // --------------------------------------------------------
  // CRU Interface
  // --------------------------------------------------------
  
  // ----- Config Packet Setup -----
  input [`FIRE_PCIE_BUS_NUM_BITS] 	      cr2cl_bus_num;
  
  // --------------------------------------------------------
  // CTM Interface
  // --------------------------------------------------------
  
  // dma/int tag return
  output [3:0] 				  crm2ctm_tag;
  
  // --------------------------------------------------------
  // PktGen Control Port
  // --------------------------------------------------------
  
  input [1:0] 				  pkt_sel;
  input 				  psb_ld;
  input [1:0] 				  trn_sel;
  input 				  epr_ld;
  input 				  done_psb_rd;
  
  // --------------------------------------------------------
  // DCR Port
  // --------------------------------------------------------
  
  input [(DCR_CMD_WDTH - 1):0] 		  dcr_cmd;
  input 				  dcr_ctag_typ;
  input [(DCTAG_TRNSNUM_WDTH - 1):0] 	  dcr_ctag_trnsnum;
  input [(DCTAG_DPTR_WDTH - 1):0] 	  dcr_ctag_dptr;
  input [(DCR_PKTAG_WDTH - 1):0] 	  dcr_pktag;
  
  // --------------------------------------------------------
  // PCR Port
  // --------------------------------------------------------
  
  input [(PCR_CMD_WDTH - 1):0] 		  pcr_cmd;
  input [(PCR_ADDR_WDTH - 1):0] 	  pcr_addr;
  input [(PCR_BMSK_WDTH - 1):0] 	  pcr_bmsk;
  input [(PCTAG_TRNSNUM_WDTH - 1):0] 	  pcr_ctag_trnsnum;
// BP n2 5-24-04
//  input [(PCTAG_AGNTID_WDTH - 1):0] 	  pcr_ctag_agntid;
//  input [(PCTAG_TRNSID_WDTH - 1):0] 	  pcr_ctag_trnsid;
  input [(PCTAG_THRDID_WDTH - 1):0] 	  pcr_ctag_thrdid;
  
  // --------------------------------------------------------
  // URR Port
  // --------------------------------------------------------
  
  input [(`FIRE_DLC_CLU_URR_TYP_WDTH - 1):0]    urr_typ;
  input [(`FIRE_DLC_CLU_URR_SBDTAG_WDTH - 1):0] urr_sbdtag;
  
  // --------------------------------------------------------
  // Type Port
  // --------------------------------------------------------
  
  output 					mdo_vld;
  output 					drd_vld;
  output 					tdr_vld;
  output 					pcr_typ;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTERS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  // ********** Flops **********
  
  // ctm tag return
  reg [3:0] 				     crm2ctm_tag;
  
  // epr field registers
  reg [(`FIRE_DLC_EPR_TYP_WDTH - 1):0] 	     epr_typ;
  reg [(`FIRE_DLC_EPR_LEN_WDTH - 1):0] 	     epr_len;
  reg [(`FIRE_DLC_EPR_DWBE_WDTH/2 - 1):0]    epr_ldwbe;
  reg [(`FIRE_DLC_EPR_DWBE_WDTH/2 - 1):0]    epr_fdwbe;
  reg [(`FIRE_DLC_EPR_ADDR_WDTH - 1):0]      epr_addr;
  reg [(`FIRE_DLC_EPR_SBDTAG_WDTH - 1):0]    epr_sbdtag;
  reg [(`FIRE_DLC_EPR_DPTR_WDTH - 1):0]      epr_dptr;
  reg [(`FIRE_DLC_EPR_PKSEQNUM_WDTH - 1):0]  epr_pkseqnum;
  reg [(`FIRE_DLC_EPR_CNTXTNUM_WDTH - 1):0]  epr_cntxtnum;
  
  // psb interface registers
  reg [(`FIRE_DLC_PSR_TRN_WDTH - 1):0] 	     cl2ps_e_trn;
  reg [(`FIRE_DLC_PSR_PIO_DATA_WDTH - 1):0]   cl2ps_e_wr_data;
  
  // ********** Non-Flops ******
  
  reg [2:0] 				     fdwbe_2to0;
  
  // dcr pktgen field declarations
  reg [(`FIRE_DLC_EPR_TYP_WDTH - 1):0] 	     dcr_pkt_typ;
  
  // pcr pktgen field declarations
  reg [(`FIRE_DLC_EPR_TYP_WDTH - 1):0] 	     pcr_pkt_typ;
  reg [(`FIRE_DLC_EPR_LEN_WDTH - 1):0] 	     pcr_pkt_len;
  reg [(`FIRE_DLC_EPR_DWBE_WDTH/2 - 1):0]    pcr_pkt_ldwbe;
  reg [(`FIRE_DLC_EPR_DWBE_WDTH/2 - 1):0]    pcr_pkt_fdwbe;
  
  // urr field declarations
  reg [(`FIRE_DLC_EPR_TYP_WDTH - 1):0] 	     urr_pkt_typ;
  
  // epr field declarations
  reg [(`FIRE_DLC_EPR_TYP_WDTH - 1):0] 	     nxt_epr_typ;
  reg [(`FIRE_DLC_EPR_LEN_WDTH - 1):0] 	     nxt_epr_len;
  reg [(`FIRE_DLC_EPR_DWBE_WDTH/2 - 1):0]    nxt_epr_fdwbe;
  reg [(`FIRE_DLC_EPR_ADDR_WDTH - 1):0]      nxt_epr_addr;
  reg [(`FIRE_DLC_EPR_SBDTAG_WDTH - 1):0]    nxt_epr_sbdtag;
  reg [(`FIRE_DLC_EPR_DPTR_WDTH - 1):0]      nxt_epr_dptr;
  
  // pcr variables
  reg 					     pcfg_typ;
  reg [19:0] 				     paddr_31to12;
  
  // psb interface
  reg [(`FIRE_DLC_PSR_TRN_WDTH - 1):0] 	     nxt_psb_trn;
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  // dcr field declarations
  wire [(`FIRE_DLC_EPR_DWBE_WDTH/2 - 1):0]   dcr_pkt_fdwbe;
  wire [(`FIRE_DLC_EPR_DPTR_WDTH - 1):0]     dcr_pkt_dptr;
  
  // pcr pktgen field declarations
  wire [(`FIRE_DLC_EPR_ADDR_WDTH - 1):0]     pcr_pkt_addr;
  wire [(`FIRE_DLC_EPR_SBDTAG_WDTH - 1):0]   pcr_pkt_sbdtag;
  wire [(`FIRE_DLC_EPR_DPTR_WDTH - 1):0]     pcr_pkt_dptr;
  
  // urr field declarations
  wire [(`FIRE_DLC_EPR_DWBE_WDTH/2 - 1):0]   urr_pkt_fdwbe;
  
  // epr field declarations
  wire [(`FIRE_DLC_EPR_DWBE_WDTH/2 - 1):0]   nxt_epr_ldwbe;
  wire [(`FIRE_DLC_EPR_PKSEQNUM_WDTH - 1):0] nxt_epr_pkseqnum;
  wire [(`FIRE_DLC_EPR_CNTXTNUM_WDTH - 1):0] nxt_epr_cntxtnum;
  
  // dcr variables
  wire [2:0] 				     cpl_sts;
  wire [1:0] 				     mdo_tag;
  wire 					     mdo_sts;
  
  // pcr variables
  wire 					     pbmsk_dw3_vld;
  wire 					     pbmsk_dw2_vld;
  wire 					     pbmsk_dw1_vld;
  wire 					     pbmsk_dw0_vld;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> 0-in Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  /* 0in bits_on
     -var {mdo_vld, drd_vld, tdr_vld}
     -active ~`CPU.dmu.dmc.clu.crm.dcr_fifo_empty
  */
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL Model <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // DCR-TO-EPR PKTGEN (DMA/MDO PROCESSING)
  // --------------------------------------------------------
  
  // ----- Type Decode --------------------------------------------------------
  
  // packet encoding
  always @(dcr_cmd)
    if (dcr_cmd[1])
      dcr_pkt_typ = MDO_RPLY;
    else
      dcr_pkt_typ = DMA_CPLD;
  
  // type indicators
  assign mdo_vld = dcr_cmd[1];
  assign drd_vld = ~dcr_cmd[1] & ~dcr_ctag_typ;
  assign tdr_vld = ~dcr_cmd[1] & dcr_ctag_typ;
  
  // ----- First DWBE Gen -----------------------------------------------------
  
  // cpl_sts for dma cpl is always successfull -> 000
  assign cpl_sts = 3'b000;
  
  // mdo_tag is taken from bits 2:1 of dcr_pktag field
  assign mdo_tag = dcr_pktag[1:0];
  
  // ===================================================
  // mdo_sts info
  // 
  //    dcr_cmd[1:0] : 11 = int ack, 10 = int nack
  //    dcr_cmd[0] differs int ack from int nack
  // 
  //    mdo_sts : 1 = ack, 0 = nack
  //    mapping dcr_cmd[0] to mdo_sts sets mdo_sts
  // ====================================================
  
  assign mdo_sts = dcr_cmd[0];
  
  // formulate fdwbe[2:0]
  always @(dcr_cmd[1] or cpl_sts or mdo_tag or mdo_sts)
    if (dcr_cmd[1]) // 0 = dma, 1 = mdo
      fdwbe_2to0 = {mdo_tag, mdo_sts};
    else
      fdwbe_2to0 = cpl_sts;
  
  // construct fdwbe : fdwbe[3] is rsv for all dcr types
  assign dcr_pkt_fdwbe = {1'b0, fdwbe_2to0};
  
  // ----- DPTR Gen -----------------------------------------------------------
  
  // msb of dptr indicates DOU section : 0 = dma, 1 = pio
  assign dcr_pkt_dptr = {1'b0, dcr_ctag_dptr};
  
  // --------------------------------------------------------
  // PCR-TO-EPR PKTGEN (PIO PROCESSING)
  // --------------------------------------------------------
  
  // ----- Type Decode --------------------------------------------------------
  
  // cfg typ : typ0 -> pkt_bus# == prog_bus#; typ1-> pkt_bus# != prog_bus#
  always @(cr2cl_bus_num or pcr_addr[27:20])
    if (cr2cl_bus_num == pcr_addr[27:20])
      pcfg_typ = 1'b0;
    else
      pcfg_typ = 1'b1;
  
  // packet encoding
  always @(pcr_cmd or pcfg_typ)
    begin
      
      // initialization
      pcr_pkt_typ = {`FIRE_DLC_EPR_TYP_WDTH{1'b0}};
      
      case (pcr_cmd)
	
	/* 0in < case -parallel -full
	   -active ~`CPU.dmu.dmc.clu.crm.pcr_fifo_empty
	*/
	
	// PIO MEM RD
	PRD_BLK_M32,
	PRD_16B_M32 : pcr_pkt_typ = PIO_MRD_32BIT;
	PRD_BLK_M64,
	PRD_16B_M64 : pcr_pkt_typ = PIO_MRD_64BIT;
	
	// PIO IO RD
	PRD_16B_IO  : pcr_pkt_typ = PIO_IORD;
	
	// PIO CFG RD
	PRD_16B_CFG :
	  if (pcfg_typ)
	    pcr_pkt_typ = PIO_CFGRD_TYP1;
	  else
	    pcr_pkt_typ = PIO_CFGRD_TYP0;
	
	// PIO MEM WR
	PWR_BLK_M32,
	PWR_16B_M32 : pcr_pkt_typ = PIO_MWR_32BIT;
	PWR_BLK_M64,
	PWR_16B_M64 : pcr_pkt_typ = PIO_MWR_64BIT;
	
	// PIO IO WR
	PWR_16B_IO  : pcr_pkt_typ = PIO_IOWR;
	
	// PIO CFG WR
	PWR_16B_CFG :
	  if (pcfg_typ)
	    pcr_pkt_typ = PIO_CFGWR_TYP1;
	  else
	    pcr_pkt_typ = PIO_CFGWR_TYP0;
	
      endcase
    end
  
  // type indicator
  assign pcr_typ = pcr_cmd[3]; // 0 = write, 1 = read
  
  // ----- Len & First/Last DWBE Gen ------------------------------------------
  
  // bmsk valid dw scan
  assign pbmsk_dw3_vld = |pcr_bmsk[15:12];
  assign pbmsk_dw2_vld = |pcr_bmsk[11:8];
  assign pbmsk_dw1_vld = |pcr_bmsk[7:4];
  assign pbmsk_dw0_vld = |pcr_bmsk[3:0];
  
  // len & f/l_dwbe gen: pcr_cmd[2] -> 0 = 64 byte, 1 = 16 byte
  always @(pcr_cmd[2] or pbmsk_dw3_vld or pbmsk_dw2_vld or
	   pbmsk_dw1_vld or pbmsk_dw0_vld or pcr_bmsk)
    begin
      
      // initialization
      pcr_pkt_len   = {`FIRE_DLC_EPR_LEN_WDTH{1'b0}};
      pcr_pkt_ldwbe = {`FIRE_DLC_EPR_DWBE_WDTH/2{1'b0}};
      pcr_pkt_fdwbe = {`FIRE_DLC_EPR_DWBE_WDTH/2{1'b0}};
      
      casez ({pcr_cmd[2], pbmsk_dw3_vld, pbmsk_dw2_vld, pbmsk_dw1_vld,
	      pbmsk_dw0_vld})
	
	/* 0in < case -parallel -full
	   -active ~`CPU.dmu.dmc.clu.crm.pcr_fifo_empty
	*/
	
	// PIO64:
	// len = 16DW; fdwbe = 0xF; ldwbe = 0xF
	5'b0_zzzz :
	  begin
	    pcr_pkt_len   = SIXTEEN_DW;
	    pcr_pkt_ldwbe = {(`FIRE_DLC_EPR_DWBE_WDTH/2){1'b1}};
	    pcr_pkt_fdwbe = {(`FIRE_DLC_EPR_DWBE_WDTH/2){1'b1}};
	  end
	
	// PIO16
	// len = 0DW; fdwbe = 0x0; ldwbe = 0x0
	5'b1_0000 :
	  begin
	    pcr_pkt_len   = ONE_DW;
	    pcr_pkt_ldwbe = {(`FIRE_DLC_EPR_DWBE_WDTH/2){1'b0}};
	    pcr_pkt_fdwbe = {(`FIRE_DLC_EPR_DWBE_WDTH/2){1'b0}};
	  end
	
	// PIO16
	// len = 1DW, DW0; fdwbe = jbc_bmsk[0:3]; ldwbe = 0x0
	5'b1_0001 :
	  begin
	    pcr_pkt_len   = ONE_DW;
	    pcr_pkt_ldwbe = {(`FIRE_DLC_EPR_DWBE_WDTH/2){1'b0}};
	    pcr_pkt_fdwbe = {pcr_bmsk[0], pcr_bmsk[1], pcr_bmsk[2],
			     pcr_bmsk[3]};
	  end
	
	// PIO16
	// len = 1DW, DW1; fdwbe = jbc_bmsk[4:7]; ldwbe = 0x0
	5'b1_0010 :
	  begin
	    pcr_pkt_len   = ONE_DW;
	    pcr_pkt_ldwbe = {(`FIRE_DLC_EPR_DWBE_WDTH/2){1'b0}};
	    pcr_pkt_fdwbe = {pcr_bmsk[4], pcr_bmsk[5], pcr_bmsk[6],
			     pcr_bmsk[7]};
	  end
	
	// PIO16
	// len = 1DW, DW2; fdwbe = jbc_bmsk[8:11]; ldwbe = 0x0
	5'b1_0100 :
	  begin
	    pcr_pkt_len   = ONE_DW;
	    pcr_pkt_ldwbe = {(`FIRE_DLC_EPR_DWBE_WDTH/2){1'b0}};
	    pcr_pkt_fdwbe = {pcr_bmsk[8], pcr_bmsk[9], pcr_bmsk[10],
			     pcr_bmsk[11]};
	  end
	
	// PIO16
	// len = 1DW, DW3; fdwbe = jbc_bmsk[12:15]; ldwbe = 0x0
	5'b1_1000 :
	  begin
	    pcr_pkt_len   = ONE_DW;
	    pcr_pkt_ldwbe = {(`FIRE_DLC_EPR_DWBE_WDTH/2){1'b0}};
	    pcr_pkt_fdwbe = {pcr_bmsk[12], pcr_bmsk[13], pcr_bmsk[14],
			     pcr_bmsk[15]};
	  end
	
	// PIO16
	// len = 2DW, DW01; fdwbe = jbc_bmsk[4:7]; ldwbe = jbc_bmsk[0:3]
	5'b1_0011 :
	  begin
	    pcr_pkt_len   = TWO_DW;
	    pcr_pkt_ldwbe = {pcr_bmsk[0], pcr_bmsk[1], pcr_bmsk[2],
			     pcr_bmsk[3]};
	    pcr_pkt_fdwbe = {pcr_bmsk[4], pcr_bmsk[5], pcr_bmsk[6],
			     pcr_bmsk[7]};
	  end
	
	// PIO16
	// len = 2DW, DW23; fdwbe = jbc_bmsk[12:15]; ldwbe = jbc_bmsk[8:11]
	5'b1_1100 :
	  begin
	    pcr_pkt_len   = TWO_DW;
	    pcr_pkt_ldwbe = {pcr_bmsk[8], pcr_bmsk[9], pcr_bmsk[10],
			     pcr_bmsk[11]};
	    pcr_pkt_fdwbe = {pcr_bmsk[12], pcr_bmsk[13], pcr_bmsk[14],
			     pcr_bmsk[15]};
	  end
	
	// PIO16
	// len = 4DW; fdwbe = 0xF; ldwbe = 0xF
	5'b1_1111 :
	  begin
	    pcr_pkt_len   = FOUR_DW;
	    pcr_pkt_ldwbe = {(`FIRE_DLC_EPR_DWBE_WDTH/2){1'b1}};
	    pcr_pkt_fdwbe = {(`FIRE_DLC_EPR_DWBE_WDTH/2){1'b1}};
	  end
	
      endcase
    end
  
  // ----- Addr Gen -----------------------------------------------------------
  
  // set addr[31:12] for cfg/non-cfg transactions
  always @(pcr_cmd[2:0] or pcr_addr[31:12])
    if (&pcr_cmd[2:0])
      paddr_31to12 = pcr_addr[31:12] << 4;
    else
      paddr_31to12 = pcr_addr[31:12];
  
  // set addr[34:2] for all transactions
  assign pcr_pkt_addr = {pcr_addr[35:32], paddr_31to12, pcr_addr[11:2]};
  
  // ----- Sbdtag Gen ---------------------------------------------------------
  
  // ===================================================
  // tlp_tag info
  //    pcr_cmd[3] -> 0 = wr, 1 = rd
  //    tlp_tag[4] -> 0 = rd, 1 = wr
  // 
  // mapping pcr_cmd[3] to tlp_tag[4] sets the type
  // ====================================================
  
  assign pcr_pkt_sbdtag = {~pcr_cmd[3], pcr_ctag_trnsnum};
  
  // ----- Dptr Gen -----------------------------------------------------------
  
  // msb of dptr indicates DOU section : 1'b0 = dma, 1'b1 = pio
  assign pcr_pkt_dptr = {2'b10, pcr_ctag_trnsnum};
  
  // --------------------------------------------------------
  // URR-TO-EPR PKTGEN (UNSUPPORTED REQ PROCESSING)
  // --------------------------------------------------------
  
  // ----- Type Decode --------------------------------------------------------
  
  // packet encoding
  always @(urr_typ)
    begin
      
      // initialization
      urr_pkt_typ = {`FIRE_DLC_EPR_TYP_WDTH{1'b0}};
      
      case (urr_typ)
	
	/* 0in < case -parallel -full
	   -active ~`CPU.dmu.dmc.clu.crm.urr_fifo_empty
	*/
	
	// CPL
	DMA_MRD_ERR, UNS_REQ : urr_pkt_typ = DMA_CPL;
	// CPLLK
	DMA_MRD_LK           : urr_pkt_typ = DMA_CPLLK;
	
      endcase
    end
  
  // ----- First DWBE Gen -----------------------------------------------------
  
  // ===================================================
  // fdwbe[2:0] = cpl_sts[2:0]
  // 
  //    urr_type           cpl_sts
  //    ----------------   -----------------------------
  //    3'b001 -> MRDERR : 3'b100 -> completer abort
  //    3'b010 -> UR     : 3'b001 -> unsupported request
  //    3'b100 -> MRDLK  : 3'b001 -> unsupported request
  // 
  //    cpl_sts[2] = type[0]
  //    cpl_sts[1] = 1'b0
  //    cpl_sts[0] = type[2] | type[1]
  // ===================================================
  
  assign urr_pkt_fdwbe = {1'b0, urr_typ[0], 1'b0, (urr_typ[2] | urr_typ[1])};
  
  // --------------------------------------------------------
  // EPR GEN
  // --------------------------------------------------------
  
  // ##########################################################################
  
  // ----- select typ and fdwbe : from dcr/pcr/urr fifos -----
  always @(pkt_sel or dcr_pkt_typ or dcr_pkt_fdwbe or pcr_pkt_typ or
	   pcr_pkt_fdwbe or urr_pkt_typ or urr_pkt_fdwbe)
    begin
      
      // 1st_dwbe[3] is rsv for all dcr/urr types - only one extra mux
      
      case (pkt_sel) // synopsys infer_mux
	
	// sel dcr pkt
	2'b00 :
	  begin
	    nxt_epr_typ   = dcr_pkt_typ;
	    nxt_epr_fdwbe = dcr_pkt_fdwbe;
	  end
	
	// sel pcr pkt
	2'b01 :
	  begin
	    nxt_epr_typ   = pcr_pkt_typ;
	    nxt_epr_fdwbe = pcr_pkt_fdwbe;
	  end
	
	// sel urr pkt
	2'b10, 2'b11 :
	  begin
	    nxt_epr_typ   = urr_pkt_typ;
	    nxt_epr_fdwbe = urr_pkt_fdwbe;
	  end
	
      endcase
    end
  
  // ##########################################################################
  
  // ----- select dptr : from dcr/pcr fifos -----
  always @(pkt_sel or dcr_pkt_dptr or pcr_pkt_dptr)
    begin
      
      case (pkt_sel) // synopsys infer_mux
	
	// sel dcr pkt
	2'b00 :
	  begin
	    nxt_epr_dptr = dcr_pkt_dptr;
	  end
	
	// sel pcr pkt
	2'b01 :
	  begin
	    nxt_epr_dptr = pcr_pkt_dptr;
	  end
	
	// sel urr pkt : dptr is rsv for all urr types
	2'b10, 2'b11 :
	  begin
	    nxt_epr_dptr = {`FIRE_DLC_EPR_DPTR_WDTH{1'b0}};
	  end
	
      endcase
    end
  
  // ##########################################################################
  
  // ----- select len, addr, sbdtag : from pcr fifo or psb (dcr/urr) -----
  always @(done_psb_rd or pcr_pkt_len or pcr_pkt_addr or pcr_pkt_sbdtag or
	   psb_rd_len or psb_rd_bcnt or psb_rd_sbdtag)
    begin
      
      // addr[33:12] rsv for all dcr/urr types
      nxt_epr_addr[33:12] = pcr_pkt_addr[33:12];
      
      case (done_psb_rd) // synopsys infer_mux
	
	// sel pcr pkt (default to pcr)
	1'b0 :
	  begin
            nxt_epr_len        = pcr_pkt_len;
            nxt_epr_addr[11:0] = pcr_pkt_addr[11:0];
            nxt_epr_sbdtag     = pcr_pkt_sbdtag;
	  end
	
	// note : len, sbdtag & addr[11:0] is rsv for dcr-mdo_cpl, but
	//        used for other dcr types
	
	// sel dcr/urr pkt (from psb)
	1'b1 :
	  begin
            nxt_epr_len        = psb_rd_len;
            nxt_epr_addr[11:0] = psb_rd_bcnt;
            nxt_epr_sbdtag     = psb_rd_sbdtag;
	  end
	
      endcase
    end
  
  // ##########################################################################
  
  // select ldwbe : rsv for all dcr/urr types
  assign nxt_epr_ldwbe = pcr_pkt_ldwbe;
  
  // select pkseq# and cntxt# : rsv for all pcr types and dcr-mdo_cpls
  assign nxt_epr_pkseqnum = psb_rd_pktseq;
  assign nxt_epr_cntxtnum = psb_rd_cntxtnum;
  
  // ##########################################################################
  
  // register epr fields that do not involve psb
  always @(posedge clk)
    if (~rst_l)
      begin
	  epr_typ   <= `FIRE_DLC_EPR_TYP_WDTH'b0;
	  epr_ldwbe <= {(`FIRE_DLC_EPR_DWBE_WDTH/2){1'b0}};
	  epr_fdwbe <= {(`FIRE_DLC_EPR_DWBE_WDTH/2){1'b0}};
	  epr_dptr  <= `FIRE_DLC_EPR_DPTR_WDTH'b0;
	end
    else if (epr_ld)
	begin
	  epr_typ   <= nxt_epr_typ;
	  epr_ldwbe <= nxt_epr_ldwbe;
	  epr_fdwbe <= nxt_epr_fdwbe;
	  epr_dptr  <= nxt_epr_dptr;
	end
  
  // register epr fields that require psb access
  always @(posedge clk)
    if (~rst_l)
      begin
	  epr_len      <= `FIRE_DLC_EPR_LEN_WDTH'b0;
	  epr_addr     <= `FIRE_DLC_EPR_ADDR_WDTH'b0;
	  epr_sbdtag   <= `FIRE_DLC_EPR_SBDTAG_WDTH'b0;
	  epr_pkseqnum <= `FIRE_DLC_EPR_PKSEQNUM_WDTH'b0;
	  epr_cntxtnum <= `FIRE_DLC_EPR_CNTXTNUM_WDTH'b0;
	end
    else if (done_psb_rd | epr_ld)
	begin
	  epr_len      <= nxt_epr_len;
	  epr_addr     <= nxt_epr_addr;
	  epr_sbdtag   <= nxt_epr_sbdtag;
	  epr_pkseqnum <= nxt_epr_pkseqnum;
	  epr_cntxtnum <= nxt_epr_cntxtnum;
	end
  
  // output egress pkt rcd
  assign cl2cm_rcd = {epr_typ, epr_len, epr_ldwbe, epr_fdwbe, epr_addr,
		      epr_sbdtag, epr_dptr, epr_pkseqnum, epr_cntxtnum};
  
  // --------------------------------------------------------
  // PSB INTERFACE (TRN/WRDATA)
  // --------------------------------------------------------
  
  // next psb trn : pkt_sel -> 00 = dma, 01 = pio, 10 = urr
  always @(dcr_pktag or pcr_ctag_trnsnum or urr_sbdtag or trn_sel)
    case (trn_sel) // synopsys infer_mux
      2'b00,
      2'b11 : nxt_psb_trn = dcr_pktag;                // dma_cpl
      2'b01 : nxt_psb_trn = {1'b0, pcr_ctag_trnsnum}; // pio_rd
      2'b10 : nxt_psb_trn = urr_sbdtag;               // uns_req
    endcase
  
  // register psb wr_data/trn
  always @(posedge clk)
    if (~rst_l)
      begin
	cl2ps_e_wr_data <= `FIRE_DLC_PSR_PIO_DATA_WDTH'b0;
	cl2ps_e_trn <= `FIRE_DLC_PSR_TRN_WDTH'b0;
	end
    else if (psb_ld)
      begin
//BP n2 5-24-04
//	cl2ps_e_wr_data <= {pcr_ctag_agntid, pcr_ctag_trnsid};
	cl2ps_e_wr_data <= {pcr_ctag_thrdid};
	cl2ps_e_trn <= nxt_psb_trn;
      end
  
  // --------------------------------------------------------
  // CTM INTERFACE (TAG/CREDIT RETURN)
  // --------------------------------------------------------
  
  always @(posedge clk)
    if (~rst_l)
      begin
    crm2ctm_tag <= 4'b0;
	end
	else begin
    crm2ctm_tag <= dcr_ctag_trnsnum;
	end
  
endmodule // dmu_clu_crm_pktgen
