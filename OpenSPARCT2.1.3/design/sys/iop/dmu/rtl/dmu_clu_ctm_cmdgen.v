// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_clu_ctm_cmdgen.v
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
module dmu_clu_ctm_cmdgen 
  (
   // clock/reset
   clk,
   rst_l,
   
   // jbc : cmd port
   d2j_cmd,
   d2j_addr,
   d2j_ctag,
   
   // crm : urr port
   ctm2crm_rcd,
   crm2ctm_rcd_deq,
   proc_uns,
   
   // pmu : icr port
   icr_typ,
   icr_clsts,
   icr_addr,
   icr_cmdsts,
   icr_sbdtag,
   
   // mmu : tcr port
   tcr_addr,
   tcr_mtag,
   
   // tagmgr port
   nxt_tag,
   
   // bufmgr port
   dma_dptr,
   
   // cmd sel port
   cmd_req_sel,
   
   // uns req fifo credit port
   uns_req_crdt_avail,
   
   // icr cmd decode port
   mrd_vld,
   mwr_vld,
   mwr_err,
   eqwr_vld,
   eqwr_err,
   mdo_vld,
   uns_vld,
   null_vld,
   pio16_vld,
   pio64_vld,
   pio_err
   );
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Parameter Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // TAGMGR Configuration
  // --------------------------------------------------------
  
  parameter TAG_WDTH = 4;
  
  // --------------------------------------------------------
  // Ingress Command Record (ICR) Type Encoding
  // --------------------------------------------------------
  
  parameter DMA_MRD_32BIT   = 7'b00_00000,
	    DMA_MRD_64BIT   = 7'b01_00000,
	    DMA_MRDLK_32BIT = 7'b00_00001,
	    DMA_MRDLK_64BIT = 7'b01_00001,
	    UNS_REQ         = 7'b00_01001,
	    DMA_MWR_32BIT   = 7'b10_00000,
	    DMA_MWR_64BIT   = 7'b11_00000,
	    MSI_EQ_WR_32BIT = 7'b10_11000,
	    MSI_EQ_WR_64BIT = 7'b11_11000,
	    MSG_EQ_WR_32BIT = 7'b10_10000,
	    MSG_EQ_WR_64BIT = 7'b11_10000,
	    NULL            = 7'b11_11100,
	    MONDO_REQ       = 7'b11_11010,
	    PIO_CPL         = 7'b00_01010,
	    PIO_CPLD        = 7'b10_01010;
  
  // --------------------------------------------------------
  // CTM-to-CRM Unsupported Request Command Encoding
  // --------------------------------------------------------
  
  parameter DMA_MRD_ERR = 3'b001,
	    DMA_MRD_LK  = 3'b010,
	    UNSUPPORTED = 3'b100;
  
  // --------------------------------------------------------
  // DMC-to-JBC Command Encoding
  // --------------------------------------------------------
  
  parameter DMA_WRF       = 4'b0000,
	    DMA_WRP       = 4'b0001,
	    DMA_RD        = 4'b0010,
	    DMA_RDS       = 4'b0011,
	    INT           = 4'b0100,
	    PIO_RD16      = 4'b1000,
	    PIO_RD64      = 4'b1001,
	    PIO_RDERR_TO  = 4'b1010,
	    PIO_RDERR_BUS = 4'b1011;
  
  // --------------------------------------------------------
  // ICR Completion Status Encoding
  // --------------------------------------------------------
  
  parameter UR_CPLSTS = 3'b001,
	    TO_CPLSTS = 3'b111;
  
  // --------------------------------------------------------
  // UNSUPPORTED FIFO CREDIT PARAMETERS
  // --------------------------------------------------------
  
  parameter UNS_CRDTCNT      = 3'h6;
  parameter UNS_CRDTCNT_WDTH = 3;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // Clock/Reset
  // --------------------------------------------------------
  
  input clk;
  input rst_l;
  
  // --------------------------------------------------------
  // JBC Interface
  // --------------------------------------------------------
  
  // Cmd Port -> DMC Req/Resp
  output  [(`FIRE_D2J_CMD_WDTH - 1):0] d2j_cmd;
  output [(`FIRE_D2J_ADDR_WDTH - 1):0] d2j_addr;
  output [(`FIRE_D2J_CTAG_WDTH - 1):0] d2j_ctag;
  
  // --------------------------------------------------------
  // CRM Interface
  // --------------------------------------------------------
  
  // Unsupported Request Record (URR) Port
  output [(`FIRE_DLC_CLU_URR_WDTH - 1):0] ctm2crm_rcd;
  input                                   crm2ctm_rcd_deq;
  input                                   proc_uns;
  
  // --------------------------------------------------------
  // ICR Fields
  // --------------------------------------------------------
  
  input    [(`FIRE_DLC_ICR_TYP_WDTH - 1):0] icr_typ;
  input  [(`FIRE_DLC_ICR_CLSTS_WDTH - 1):0] icr_clsts;
  input   [(`FIRE_DLC_ICR_ADDR_WDTH - 1):0] icr_addr;
  input   [(`FIRE_DLC_ICR_STAT_WDTH - 1):0] icr_cmdsts;
  input [(`FIRE_DLC_ICR_SBDTAG_WDTH - 1):0] icr_sbdtag;
  
  // --------------------------------------------------------
  // TCR Fields
  // --------------------------------------------------------
  
  input [(`FIRE_DLC_TCR_ADDR_WDTH - 1):0] tcr_addr;
  input [(`FIRE_DLC_TCR_MTAG_WDTH - 1):0] tcr_mtag;
  
  // --------------------------------------------------------
  // Tag Manager -  Next Available Tag
  // --------------------------------------------------------
  
  input [(TAG_WDTH - 1):0] nxt_tag;
  
  // --------------------------------------------------------
  // Buffer Manager - Next Available DOU DMA Address
  // --------------------------------------------------------
  
  input [4:0] dma_dptr;
  
  // --------------------------------------------------------
  // Command Process Select
  // --------------------------------------------------------
  
  input cmd_req_sel;
  
  // --------------------------------------------------------
  // UNS Req Fifo-Credit Interface
  // --------------------------------------------------------
  
  output uns_req_crdt_avail;
  
  // --------------------------------------------------------
  // ICR Decoded Type Control Signals
  // --------------------------------------------------------
  
  output mrd_vld;
  output mwr_vld;
  output mwr_err;
  output eqwr_vld;
  output eqwr_err;
  output mdo_vld;
  output uns_vld;
  output null_vld;
  output pio16_vld;
  output pio64_vld;
  output pio_err;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTERS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  // ********** Flops **********
  
  // Cmd Port -> DMC Req/Resp
  reg  [(`FIRE_D2J_CMD_WDTH - 1):0] d2j_cmd;
  reg [(`FIRE_D2J_ADDR_WDTH - 1):0] d2j_addr;
  reg [(`FIRE_D2J_CTAG_WDTH - 1):0] d2j_ctag;
  
  // Unsupported Request Record (URR) Port
  reg [(`FIRE_DLC_CLU_URR_WDTH - 1):0] ctm2crm_rcd;
  
  // unsupported request fifo credit count
  reg [(UNS_CRDTCNT_WDTH - 1):0] q_count_uns;
  
  // ********** Non-Flops ******
  
  // command types
  reg         [(`FIRE_D2J_CMD_WDTH - 1):0] icr_jbc_cmd;
  reg [(`FIRE_DLC_CLU_URR_TYP_WDTH - 1):0] uns_cmd;
  
  // type control signals
  reg mrd_vld;
  reg mwr_vld;
  reg mwr_err;
  reg eqwr_vld;
  reg eqwr_err;
  reg mdo_vld;
  reg uns_vld;
  reg null_vld;
  reg pio16_vld;
  reg pio64_vld;
  reg pio_err;
  
  // jbc cmd structure
  reg  [(`FIRE_D2J_CMD_WDTH - 1):0] jbc_cmd;
  reg [(`FIRE_D2J_ADDR_WDTH - 1):0] jbc_addr;
  reg [(`FIRE_D2J_CTAG_WDTH - 1):0] jbc_ctag;
  
  // next unsupported request fifo credit count
  reg [(UNS_CRDTCNT_WDTH - 1):0] nxt_q_count_uns;
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  // unsupported request fifo credit increment
  wire 				 q_count_uns_ld;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> 0-in Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  /* 0in kndr
     -var icr_clsts
     -active (~`CPU.dmu.dmc.clu.ctm.icr_fifo_empty &
              ((icr_typ == DMA_MRD_32BIT) |
               (icr_typ == DMA_MRD_64BIT) |
               (icr_typ == DMA_MWR_32BIT) |
               (icr_typ == DMA_MWR_64BIT) |
               (icr_typ == PIO_CPLD)))
  */
  
  /* 0in kndr
     -var icr_addr
     -active (~`CPU.dmu.dmc.clu.ctm.icr_fifo_empty &
              (((icr_typ == DMA_MRD_32BIT)   & ~icr_cmdsts[0]) |
               ((icr_typ == DMA_MRD_64BIT)   & ~icr_cmdsts[0]) |
               ((icr_typ == DMA_MWR_32BIT)   & ~icr_cmdsts[0]) |
               ((icr_typ == DMA_MWR_64BIT)   & ~icr_cmdsts[0]) |
               ((icr_typ == MSI_EQ_WR_32BIT) & ~icr_cmdsts[0]) |
               ((icr_typ == MSI_EQ_WR_64BIT) & ~icr_cmdsts[0]) |
               ((icr_typ == MSG_EQ_WR_32BIT) & ~icr_cmdsts[0]) |
               ((icr_typ == MSG_EQ_WR_64BIT) & ~icr_cmdsts[0]) |
               (icr_typ == MONDO_REQ)))
  */
  
  /* 0in kndr
     -var icr_addr[5:0]
     -active (~`CPU.dmu.dmc.clu.ctm.icr_fifo_empty &
              ((icr_typ == PIO_CPL) |
               (icr_typ == PIO_CPLD)))
  */
  
  /* 0in kndr
     -var icr_cmdsts[0]
     -active (~`CPU.dmu.dmc.clu.ctm.icr_fifo_empty &
              ((icr_typ == DMA_MRD_32BIT)   |
               (icr_typ == DMA_MRD_64BIT)   |
               (icr_typ == DMA_MWR_32BIT)   |
               (icr_typ == DMA_MWR_64BIT)   |
               (icr_typ == MSI_EQ_WR_32BIT) |
               (icr_typ == MSI_EQ_WR_64BIT) |
               (icr_typ == MSG_EQ_WR_32BIT) |
               (icr_typ == MSG_EQ_WR_64BIT)))
  */
  
  /* 0in kndr
     -var icr_cmdsts
     -active (~`CPU.dmu.dmc.clu.ctm.icr_fifo_empty &
              (icr_typ == PIO_CPL))
  */
  
  /* 0in kndr
     -var icr_sbdtag
     -active (~`CPU.dmu.dmc.clu.ctm.icr_fifo_empty &
              ((icr_typ == DMA_MRD_32BIT)   |
               (icr_typ == DMA_MRD_64BIT)   |
               (icr_typ == DMA_MRDLK_32BIT) |
               (icr_typ == DMA_MRDLK_64BIT) |
               (icr_typ == UNS_REQ)))
  */
  
  /* 0in kndr
     -var icr_sbdtag[1:0]
     -active (~`CPU.dmu.dmc.clu.ctm.icr_fifo_empty &
              (icr_typ == MONDO_REQ))
  */
  
  /* 0in kndr
     -var icr_sbdtag[3:0]
     -active (~`CPU.dmu.dmc.clu.ctm.icr_fifo_empty &
              ((icr_typ == PIO_CPL) |
               (icr_typ == PIO_CPLD)))
  */
  
  // 0in max -var q_count_uns -val 6
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL Model <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // ICR Command Process (Ingress Command Record)
  // --------------------------------------------------------
  
  // ----- type decode---------------------------------------------------------
  
  always @(icr_typ or icr_clsts or icr_cmdsts)
    begin
      
      // initialization
      icr_jbc_cmd = {`FIRE_D2J_CMD_WDTH{1'b0}};
      uns_cmd     = {`FIRE_DLC_CLU_URR_TYP_WDTH{1'b0}};
      mrd_vld     = 1'b0;
      mwr_vld     = 1'b0;
      mwr_err     = 1'b0;
      eqwr_vld    = 1'b0;
      eqwr_err    = 1'b0;
      mdo_vld     = 1'b0;
      uns_vld     = 1'b0;
      null_vld    = 1'b0;
      pio16_vld   = 1'b0;
      pio64_vld   = 1'b0;
      pio_err     = 1'b0;
      
      // =======================================================
      // for dmawr/eqwr
      //    icr_cmdsts [0] : 1'b0 = no err, 1'b1 = err
      //    icr_clsts  [0] : 1'b0 = full,   1'b1 = partial
      // for dmard
      //    icr_cmdsts [0] : 1'b0 = no err, 1'b1 = err
      // for piocpld
      //    icr_clsts  [0] : 1'b0 = pio64,   1'b1 = pio16
      // =======================================================
      
      // type decoder
      case (icr_typ)
	
	/* 0in < case -parallel -full
	   -active ~`CPU.dmu.dmc.clu.ctm.icr_fifo_empty
	   -message "Illegal ICR type received by CLU"
	*/
	
	DMA_MRD_32BIT,
	DMA_MRD_64BIT :
	  if (icr_cmdsts[0])
	    begin
	      uns_vld = 1'b1;
	      uns_cmd = DMA_MRD_ERR;
	    end
	  else
	    begin
	      mrd_vld     = 1'b1;
	      icr_jbc_cmd = DMA_RD;
	    end
	
	DMA_MRDLK_32BIT,
	DMA_MRDLK_64BIT :
	  begin
	    uns_vld = 1'b1;
	    uns_cmd = DMA_MRD_LK;
	  end
	
	UNS_REQ :
	  begin
	    uns_vld = 1'b1;
	    uns_cmd = UNSUPPORTED;
	  end
	
	DMA_MWR_32BIT,
	DMA_MWR_64BIT :
	  begin
	    mwr_vld = ~icr_cmdsts[0];
	    mwr_err = icr_cmdsts[0];
	    if (icr_clsts)
	      icr_jbc_cmd = DMA_WRP;
	    else
	      icr_jbc_cmd = DMA_WRF;
	  end
	
	MSI_EQ_WR_32BIT,
	MSI_EQ_WR_64BIT,
	MSG_EQ_WR_32BIT,
	MSG_EQ_WR_64BIT :
	  begin
	    eqwr_vld    = ~icr_cmdsts[0];
	    eqwr_err    = icr_cmdsts[0];
	    icr_jbc_cmd = DMA_WRF;
	  end
	
	NULL :
	  begin
	    null_vld = 1'b1;
	  end
	
	MONDO_REQ :
	  begin
	    mdo_vld     = 1'b1;
	    icr_jbc_cmd = INT;
	  end
	
	PIO_CPL :
	  begin
	    pio_err = 1'b1;
	    
	    case (icr_cmdsts)
	      
	      /* 0in < case -full
	         -active ~`CPU.dmu.dmc.clu.ctm.icr_fifo_empty
	         -message "Illegal PIO_CPL error encoding received by CLU"
	      */
	      
	      UR_CPLSTS : icr_jbc_cmd = PIO_RDERR_BUS;
	      TO_CPLSTS : icr_jbc_cmd = PIO_RDERR_TO;
	    endcase
	  end
	
	PIO_CPLD :
	  begin
	    if (icr_clsts)
	      begin
		pio16_vld   = 1'b1;
		icr_jbc_cmd = PIO_RD16;
	      end
	    else
	      begin
		pio64_vld   = 1'b1;
		icr_jbc_cmd = PIO_RD64;
	      end
	  end
	
      endcase
    end
  
  // --------------------------------------------------------
  // JBC Command/Address Construction
  // --------------------------------------------------------
  
  // ----- cmd_typ assignment (ICR/TCR) ---------------------------------------
  
  always @(icr_jbc_cmd or cmd_req_sel)
    if (cmd_req_sel) // 1'b0 = icr, 1'b1 = tcr
      jbc_cmd = DMA_RDS;
    else
      jbc_cmd = icr_jbc_cmd;
  
  // ----- addr assignment (ICR/TCR) ------------------------------------------
  
  always @(icr_addr or tcr_addr or cmd_req_sel)
    if (cmd_req_sel) // 1'b0 = icr, 1'b1 = tcr
      jbc_addr = tcr_addr;
    else
//BP n2 1-01-04
//      jbc_addr = icr_addr;
      jbc_addr = {icr_addr[(`FIRE_DLC_ICR_ADDR_WDTH -1):7],icr_addr[5:0]};
  
  // ----- ctag assignment (ICR/TCR) ------------------------------------------
  
  always @(dma_dptr or tcr_mtag or cmd_req_sel or
	   nxt_tag or icr_sbdtag or icr_clsts or icr_addr or
	   pio16_vld or pio64_vld or pio_err)
    begin
      
      jbc_ctag[15]    = cmd_req_sel;
//BP n2 5-25-04
//      jbc_ctag[14:11] = nxt_tag;
//      jbc_ctag[10]    = dma_dptr[4];
//      
//      if (~cmd_req_sel & (pio16_vld | pio64_vld | pio_err))
//	jbc_ctag[9:6] = icr_sbdtag[3:0];
//      else
//	jbc_ctag[9:6] = dma_dptr[3:0];

      jbc_ctag[14:12] = nxt_tag[3:1];

      if (~cmd_req_sel & (pio16_vld | pio64_vld | pio_err))
	jbc_ctag[11:8] = icr_sbdtag[3:0];
      else
	jbc_ctag[11:8] = {nxt_tag[0],dma_dptr[4:2]};
      
      if (~cmd_req_sel & (pio16_vld | pio64_vld | pio_err))
	jbc_ctag[7:6] = {1'b0,icr_addr[6]};
      else
	jbc_ctag[7:6] = dma_dptr[1:0];
// BP end 5-25-04 change      
      
      if (cmd_req_sel)
	jbc_ctag[5:0] = tcr_mtag;
      else
	if (pio16_vld | pio64_vld | pio_err)
	  jbc_ctag[5:0] = icr_addr[5:0];
	else
	  jbc_ctag[5:0] = {icr_sbdtag, icr_clsts};
      
    end
  
  // --------------------------------------------------------
  // CTM-CRM Unsupported Request Fifo-Credit Manager
  // --------------------------------------------------------
  
  // generate q_count_uns load signal
  assign q_count_uns_ld = crm2ctm_rcd_deq ^ proc_uns;
  
  // credit availability flag
  assign uns_req_crdt_avail = |q_count_uns;
  
  // next q_count
  always @(proc_uns or q_count_uns)
    if (proc_uns)
      nxt_q_count_uns = q_count_uns - 1'b1;
    else
      nxt_q_count_uns = q_count_uns + 1'b1;
  
  // current q_count
  always @(posedge clk)
    if (~rst_l)
      q_count_uns <= UNS_CRDTCNT;
    else if (q_count_uns_ld)
      q_count_uns <= nxt_q_count_uns;
  
  // --------------------------------------------------------
  // Sequential Logic : DMC-JBC Interface
  // --------------------------------------------------------
  
  always @(posedge clk)
    if (~rst_l) begin
      d2j_cmd  <= `FIRE_D2J_CMD_WDTH'b0;
      d2j_addr <= `FIRE_D2J_ADDR_WDTH'b0;
      d2j_ctag <= `FIRE_D2J_CTAG_WDTH'b0;
	end
    else begin
      d2j_cmd  <= jbc_cmd;
      d2j_addr <= jbc_addr;
      d2j_ctag <= jbc_ctag;
    end
  
  // --------------------------------------------------------
  // Sequential Logic : CTM-CRM Interface
  // --------------------------------------------------------
  
  always @(posedge clk)
    if (~rst_l) begin
      ctm2crm_rcd[`FIRE_DLC_CLU_URR_TYP]    <= `FIRE_DLC_CLU_URR_TYP_WDTH'b0;
      ctm2crm_rcd[`FIRE_DLC_CLU_URR_SBDTAG] <= `FIRE_DLC_ICR_SBDTAG_WDTH'b0;
	end
    else begin
      ctm2crm_rcd[`FIRE_DLC_CLU_URR_TYP]    <= uns_cmd;
      ctm2crm_rcd[`FIRE_DLC_CLU_URR_SBDTAG] <= icr_sbdtag;
    end
  
endmodule // dmu_clu_ctm_cmdgen
