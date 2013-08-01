// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_clu_ctm_bufmgr.v
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
module dmu_clu_ctm_bufmgr 
  (
   // clock/reset
   clk,
   rst_l,
   
   // tmu: diu buffer mgr port
   cl2tm_dma_rptr,
   cl2tm_int_rptr,
   tm2cl_dma_wptr,
   tm2cl_pio_wptr,
   
   // rmu : dou dma buffer rel port
   rm2cl_bufrel,
   rm2cl_bufrel_enq,
   
   // diu : data read port
   cl2di_addr,
   
   // dou buffer ctl/sts port
   dma_dptr,
   dou_space_avail,
   dma_dptr_req,
   dma_cltot,
   
   // diu buffer ctl/sts port
   diu_dma_empty,
   diu_pio_empty,
   diu_typ_sel,
   inc_dma_blk_addr,
   inc_pio_blk_addr,
   inc_eqw_blk_addr,
   inc_mdo_blk_addr,
   ld_diu_addr,
   inc_diu_row_ptr,
   
   // idle checker port
   dou_dptr_pool_full
   );
  
  // synopsys sync_set_reset "rst_l"
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Parameter Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  parameter DOU_DADDR_WDTH = 5;
  parameter DOU_DADDR_NUM  = 32;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // Clock/Reset Signals
  // --------------------------------------------------------
  
  input clk;
  input rst_l;
  
  // --------------------------------------------------------
  // TMU Interface
  // --------------------------------------------------------
  
  // DIU Buffer Manager Port
  output [(`FIRE_DLC_DMA_RPTR_WDTH - 1):0] cl2tm_dma_rptr;
  output [(`FIRE_DLC_INT_RPTR_WDTH - 1):0] cl2tm_int_rptr;
  input [(`FIRE_DLC_DMA_WPTR_WDTH - 1):0]  tm2cl_dma_wptr;
  input [(`FIRE_DLC_PIO_WPTR_WDTH - 1):0]  tm2cl_pio_wptr;
  
  // --------------------------------------------------------
  // RMU Interface
  // --------------------------------------------------------
  
  // DOU DMA Buffer Release Port
  input [(`FIRE_DLC_DOU_REL_WDTH - 1):0]   rm2cl_bufrel;
  input 				   rm2cl_bufrel_enq;
  
  // --------------------------------------------------------
  // DIU Interface
  // --------------------------------------------------------
  
  // Data Buffer Read Port
  output [(`FIRE_DLC_CRD_ADDR_WDTH - 1):0] cl2di_addr;
  
  // --------------------------------------------------------
  // DOU Buffer Manager Control Port
  // --------------------------------------------------------
  
  output [(DOU_DADDR_WDTH - 1):0] 	   dma_dptr;
  output 				   dou_space_avail;
  input 				   dma_dptr_req;
  input [3:0] 				   dma_cltot;
  
  // --------------------------------------------------------
  // DIU Buffer Manager Control Port
  // --------------------------------------------------------
  
  // buffer space status
  output 				   diu_dma_empty;
  output 				   diu_pio_empty;
  
  // buffer space select
  input [1:0] 				   diu_typ_sel;
  
  // buffer space addr ctl
  input 				   inc_dma_blk_addr;
  input 				   inc_pio_blk_addr;
  input 				   inc_eqw_blk_addr;
  input 				   inc_mdo_blk_addr;
  
  // diu read addr ctl
  input 				   ld_diu_addr;
  input 				   inc_diu_row_ptr;
  
  // --------------------------------------------------------
  // IDLE Checker Port
  // --------------------------------------------------------
  
  output 				   dou_dptr_pool_full;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTERS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  // ********** Flops **********
  
  reg [4:0] 				   dma_blk_addr;
  reg [3:0] 				   pio_blk_addr;
  reg [3:0] 				   eqw_blk_addr;
  reg [1:0] 				   mdo_blk_addr;
  reg [6:0] 				   diu_addr_8to2;
  reg [1:0] 				   diu_addr_1to0;
  reg 					   dma_wrp_flag;
  reg 					   pio_wrp_flag;
  reg 					   eqw_wrp_flag;
  reg [(DOU_DADDR_WDTH - 1):0] 		   dma_dptr;
  reg [(DOU_DADDR_NUM - 1):0] 		   dou_sts_vctr;
  
  // ********** Non-Flops ******
  
  reg [6:0] 				   nxt_diu_addr_8to2;
  reg [(DOU_DADDR_NUM - 1):0] 		   dcd_vec0;
  reg [(DOU_DADDR_NUM - 1):0] 		   dptr_ret_dcd;
  reg [(DOU_DADDR_NUM - 1):0] 		   dcd_vec1;
  reg [(DOU_DADDR_NUM - 1):0] 		   dptr_consume_dcd;
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  wire 					   wrp_eqw_blk_addr;
  wire [(DOU_DADDR_NUM - 1):0] 		   nxt_dou_sts_vctr;
  wire [8:0] 				   dou_sts_scan;
  wire [8:0] 				   dou_sts_chk;
  wire [30:0] 				   tmp_a;
  wire [7:0] 				   tmp_b;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> 0-in Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  /* 0in oid
     -req              dma_dptr_req
     -req_id           dma_dptr
     -ret              rm2cl_bufrel_enq
     -ret_id           rm2cl_bufrel
     -max_ids          32
     -max_count_per_id 1
  */
  
  // 0in max -var eqw_blk_addr -val 4'hB
  
  // 0in kndr -var {tm2cl_dma_wptr, tm2cl_pio_wptr}
  
  // 0in decode -in rm2cl_bufrel -out dcd_vec0
  
  // 0in decode -in dma_dptr -out dcd_vec1
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL Model <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // IDLE Checker
  // --------------------------------------------------------
  
  assign dou_dptr_pool_full = &dou_sts_vctr;
  
  // --------------------------------------------------------
  // DIU Buffer Manager
  // --------------------------------------------------------
  
  // ----- dma buffer management ----------------------------------------------
  
  // diu blk addr gen
  always @(posedge clk)
    if (~rst_l)
      {dma_wrp_flag, dma_blk_addr} <= 6'b0;
    else if (inc_dma_blk_addr)
      {dma_wrp_flag, dma_blk_addr} <= {dma_wrp_flag, dma_blk_addr} + 1'b1;
  
  // diu empty indicator
  assign diu_dma_empty = ({dma_wrp_flag, dma_blk_addr} == tm2cl_dma_wptr);
  
  // clu-tmu diu buff management
  assign cl2tm_dma_rptr = {dma_wrp_flag, dma_blk_addr};
  
  // ----- pio buffer management ----------------------------------------------
  
  // diu blk addr gen
  always @(posedge clk)
    if (~rst_l)
      {pio_wrp_flag, pio_blk_addr} <= 5'b0;
    else if (inc_pio_blk_addr)
      {pio_wrp_flag, pio_blk_addr} <= {pio_wrp_flag, pio_blk_addr} + 1'b1;
  
  // diu empty indicator
  assign diu_pio_empty = ({pio_wrp_flag, pio_blk_addr} == tm2cl_pio_wptr);
  
  // ----- eqw buffer management ----------------------------------------------
  
  // diu eqw addr wrap ctl : eqw consumes diu int addr 0x0-0xB
  assign wrp_eqw_blk_addr = (eqw_blk_addr == 4'hB);
  
  // diu blk addr gen
  always @(posedge clk)
    if (~rst_l)
      begin
	eqw_wrp_flag <= 1'b0;
	eqw_blk_addr <= 4'b0;
      end
    else if (inc_eqw_blk_addr)
      begin
	eqw_wrp_flag <= eqw_wrp_flag ^ wrp_eqw_blk_addr;
	eqw_blk_addr <= (eqw_blk_addr + 1'b1) & {4{~wrp_eqw_blk_addr}};
      end
  
  // clu-tmu diu buff management
  assign cl2tm_int_rptr = {eqw_wrp_flag, eqw_blk_addr};
  
  // ----- mdo buffer management ----------------------------------------------
  
  // mdo blk addr gen
  always @(posedge clk)
    if (~rst_l)
      mdo_blk_addr <= 2'b0;
    else if (inc_mdo_blk_addr)
      mdo_blk_addr <= mdo_blk_addr + 1'b1;
  
  // ----- diu read addr generation -------------------------------------------
  
  // diu blk addr select : dma, pio, int (eqw), int (mdo)
  always @(dma_blk_addr or pio_blk_addr or eqw_blk_addr or mdo_blk_addr or
	   diu_typ_sel)
    begin
      case (diu_typ_sel) // synopsys infer_mux
	
	2'b00 : // DIU-DMA
	  nxt_diu_addr_8to2 = {2'b00, dma_blk_addr};
	
	2'b01 : // DIU-PIO
//BP n2 6-23-04
//	  nxt_diu_addr_8to2 = {2'b01, 1'b0, pio_blk_addr};
	  nxt_diu_addr_8to2 = {2'b01, 1'b0, 2'b00, pio_blk_addr[3:2]};
	
	2'b10 : // DIU-INT (EQW)
	  nxt_diu_addr_8to2 = {2'b10, 1'b0, eqw_blk_addr};
	
	2'b11 : // DIU-INT (MDO)
	  nxt_diu_addr_8to2 = {2'b10, 1'b0, 2'b11, mdo_blk_addr};
	
      endcase
    end
  
  // diu blk addr reg
  always @(posedge clk)
    if (~rst_l)
      diu_addr_8to2 <= 7'b0;
    else if (ld_diu_addr)
      diu_addr_8to2 <= nxt_diu_addr_8to2;
  
  // diu row addr reg
  always @(posedge clk)
    if (~rst_l)
      diu_addr_1to0 <= 2'b0;
//BP n2 6-23-04
    else if ( ld_diu_addr & (diu_typ_sel == 2'b01))
      diu_addr_1to0 <= pio_blk_addr[1:0] ;
    else if (inc_diu_row_ptr | ld_diu_addr)
      diu_addr_1to0 <= (diu_addr_1to0 + 1'b1) & {2{~ld_diu_addr}};
  
  // diu read addr output
  assign cl2di_addr = {diu_addr_8to2, diu_addr_1to0};
  
  // --------------------------------------------------------
  // DOU Buffer Manager
  // --------------------------------------------------------
  
  // ----- dou dma dptr management --------------------------------------------
  
  // dou dma dptr generator
  always @(posedge clk)
    if (~rst_l)
      dma_dptr <= {DOU_DADDR_WDTH{1'b0}};
    else if (dma_dptr_req)
      dma_dptr <= dma_dptr + 1'b1;
  
  // decoder : dou dma dptr retire
  always @(rm2cl_bufrel or rm2cl_bufrel_enq)
    begin
      dcd_vec0               = {DOU_DADDR_NUM{1'b0}};
      dcd_vec0[rm2cl_bufrel] = 1'b1;
      dptr_ret_dcd           = dcd_vec0 & {DOU_DADDR_NUM{rm2cl_bufrel_enq}};
    end
  
  // decoder : dou dma dptr consume
  always @(dma_dptr or dma_dptr_req)
    begin
      dcd_vec1           = {DOU_DADDR_NUM{1'b0}};
      dcd_vec1[dma_dptr] = 1'b1;
      dptr_consume_dcd   = dcd_vec1 & {DOU_DADDR_NUM{dma_dptr_req}};
    end
  
  // generate "next dou status" vector
  assign nxt_dou_sts_vctr = ((dptr_ret_dcd | dou_sts_vctr) &
			     ~dptr_consume_dcd);
  
  // dou status vector: 1 = avail, 0 = used
  always @(posedge clk)
    if (~rst_l)
      dou_sts_vctr <= {DOU_DADDR_NUM{1'b1}};
    else
      dou_sts_vctr <= nxt_dou_sts_vctr;
  
  // ----- dou status check ---------------------------------------------------
  
  // scan dou status vector
  assign {tmp_a, dou_sts_scan} = {dou_sts_vctr[7:0], dou_sts_vctr} >> dma_dptr;
  
  // dou status check
  assign {dou_sts_chk, tmp_b} = {dou_sts_scan, 8'hFF} << (4'h9 - dma_cltot);
  
  // dou space avail
  assign dou_space_avail = &dou_sts_chk;
  
endmodule // dmu_clu_ctm_bufmgr
