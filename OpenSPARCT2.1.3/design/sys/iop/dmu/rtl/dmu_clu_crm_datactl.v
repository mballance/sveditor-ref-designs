// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_clu_crm_datactl.v
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
module dmu_clu_crm_datactl 
  (
   // clock/reset
   clk,
   rst_l,
   
   // jbc: dma data ctl port
   dctag_typ,
   dctag_dptr,
   dctag_misc,
   j2d_di_cmd,
   j2d_di_cmd_vld,
   j2d_d_data_err,
   j2d_d_data_vld,
   
   // jbc: pio data ctl port
   pctag_trnsnum,
   j2d_p_cmd_vld,
   j2d_p_data_vld,
   
   // mmu: tdr port
   tdr_mtag,
   tdr_cerr,
   cl2mm_tdr_vld,
   
   // dou: data ctl port
   cl2do_dma_addr,
   cl2do_dma_wr,
   cl2do_pio_addr,
   cl2do_pio_wr,
   
   // ilu: cacheline sts port
   k2y_dou_dptr,
   k2y_dou_err,
   k2y_dou_vld
   );
  
  // synopsys sync_set_reset "rst_l"
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Parameter Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  parameter DCTAG_DPTR_WDTH    = 5;
  parameter DCTAG_MISC_WDTH    = 6;
  parameter PCTAG_TRNSNUM_WDTH = 4;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // Clock/Reset Signals
  // --------------------------------------------------------
  
  input clk;
  input rst_l;
  
  // --------------------------------------------------------
  // JBC Interface
  // --------------------------------------------------------
  
  // ----- DMA/INT Cpl Port -----
  input                                 dctag_typ;
  input       [(DCTAG_DPTR_WDTH - 1):0] dctag_dptr;
  input       [(DCTAG_MISC_WDTH - 1):0] dctag_misc;
  input [(`FIRE_J2D_DI_CMD_WDTH - 1):0] j2d_di_cmd;
  input                                 j2d_di_cmd_vld;
  input                                 j2d_d_data_err;
  input                                 j2d_d_data_vld;
  
  // ----- PIO Rd/Wr Req Port -----
  input [(PCTAG_TRNSNUM_WDTH - 1):0] pctag_trnsnum;
  input                              j2d_p_cmd_vld;
  input                              j2d_p_data_vld;
  
  // --------------------------------------------------------
  // MMU Interface
  // --------------------------------------------------------
  
  // ----- Tablewalk Data Record (TDR) Port -----
  output [(`FIRE_DLC_TDR_MTAG_WDTH - 1):0] tdr_mtag;
  output                                   tdr_cerr;
  output                                   cl2mm_tdr_vld;
  
  // --------------------------------------------------------
  // DOU Interface
  // --------------------------------------------------------
  
  // ----- DMA Data Buffer Write Port -----
  output [(`FIRE_DLC_CDD_ADDR_WDTH - 1):0] cl2do_dma_addr;
  output                                   cl2do_dma_wr;
  
  // ----- PIO Data Buffer Write Port -----
  output [(`FIRE_DLC_CPD_ADDR_WDTH - 1):0] cl2do_pio_addr;
  output                                   cl2do_pio_wr;
  
  // --------------------------------------------------------
  // ILU Interface
  // --------------------------------------------------------
  
  // ----- DOU-DMA Status Port -----
  output [(`FIRE_DLC_DOU_REL_WDTH - 1):0]  k2y_dou_dptr;
  output 				   k2y_dou_err;
  output 				   k2y_dou_vld;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTERS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  // ********** Flops **********
  
  // misc register for dma/mmu
  reg [(DCTAG_MISC_WDTH - 1):0] misc_reg;
  
  // mmu regs
  reg tdr_cerr;
  reg mmu_vld_s0;
  reg mmu_vld_s1;
  reg mmu_vld_s2;
  reg mmu_vld_s3;
  
  // dma regs
  reg [1:0] dma_row_wrptr;
  reg       dma_wr_s0;
  reg       dma_wr_s1;
  reg       dma_wr_s2;
  reg       dma_wr_s3;
  
  // pio regs
  reg [(`FIRE_DLC_CPD_ADDR_WDTH - 1):0] pio_buf_addr;
  reg                                   cl2do_pio_wr;
  
  // ilu cl_sts regs
  reg 					ilu_vld_s0;
  reg 					ilu_vld_s1;
  reg 					ilu_vld_s2;
  reg 					ilu_vld_s3;
  reg 					data_derr_s0;
  reg 					data_derr_s1;
  reg 					data_derr_s2;
  reg 					k2y_dou_err;
  
  // ********** Non-Flops ******
  
  // next misc register for dma/mmu
  reg [(DCTAG_MISC_WDTH - 1):0] nxt_misc_reg;
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  wire [4:0] dma_blk_wrptr;
  wire [1:0] dma_row_wrptr_inc;
  wire [1:0] pio_row_wrptr_inc;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL Model <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // DCTAG_MISC - TDR_CERR REGISTERS
  // --------------------------------------------------------
  
  // tdr_cerr = (1'b1 if j2d_di_cmd = 2'b01), (1'b0 if j2d_di_cmd = 2'b00)
  
  // next misc reg value
  always @(dctag_dptr or dctag_misc or dctag_typ)
    begin
      nxt_misc_reg[5] = dctag_misc[5];
      if (dctag_typ) // 1 = mmu, 0 = dma
	nxt_misc_reg[4:0] = dctag_misc[4:0];
      else
	nxt_misc_reg[4:0] = dctag_dptr;
    end
  
  // misc/tdr_cerr regs
  always @(posedge clk)
    if (~rst_l)
      begin
	misc_reg <= 6'b0;
	tdr_cerr <= 1'b0;
      end
    else if (j2d_di_cmd_vld)
      begin
	misc_reg <= nxt_misc_reg;
	tdr_cerr <= j2d_di_cmd[0];
      end
  
  // output tdr_mtag
  assign tdr_mtag = misc_reg;
  
  // dma blk_wr_ptr
  assign dma_blk_wrptr = misc_reg[4:0];
  
  // --------------------------------------------------------
  // MMU TDR CONTROL
  // --------------------------------------------------------
  
  // mmu tdr_vld - shift reg to gen tdr_enq to mmu
  always @(posedge clk)
    if (~rst_l)
      begin
	mmu_vld_s0 <= 1'b0;
	mmu_vld_s1 <= 1'b0;
	mmu_vld_s2 <= 1'b0;
	mmu_vld_s3 <= 1'b0;
      end
    else
      begin
	casez ({j2d_di_cmd_vld, dctag_typ, j2d_d_data_vld})
	  
	  // 0in < case -parallel -full
	  
	  3'b0_zz,
	  3'b1_0z :
	    begin
	      mmu_vld_s0 <= 1'b0;
	      mmu_vld_s1 <= mmu_vld_s0;
	      mmu_vld_s2 <= mmu_vld_s1;
	      mmu_vld_s3 <= mmu_vld_s2;
	    end
	  3'b1_10 :
	    begin
	      mmu_vld_s0 <= 1'b0;
	      mmu_vld_s1 <= 1'b0;
	      mmu_vld_s2 <= 1'b0;
	      mmu_vld_s3 <= 1'b1;
	    end
	  3'b1_11 :
	    begin
	      mmu_vld_s0 <= 1'b1;
	      mmu_vld_s1 <= 1'b1;
	      mmu_vld_s2 <= 1'b1;
	      mmu_vld_s3 <= 1'b1;
	    end
	endcase
      end
  
  // output tdr_enq to mmu
  assign cl2mm_tdr_vld = mmu_vld_s3;
  
  // --------------------------------------------------------
  // ILU CACHELINE STATUS CONTROL
  // --------------------------------------------------------
  
  // ilu cl_sts_enq - shift reg to gen cl_sts_enq to ilu
  always @(posedge clk)
    if (~rst_l)
      begin // reset pipeline
	ilu_vld_s0 <= 1'b0;
	ilu_vld_s1 <= 1'b0;
	ilu_vld_s2 <= 1'b0;
	ilu_vld_s3 <= 1'b0;
      end
    else if (j2d_di_cmd_vld & ~j2d_di_cmd[1] & ~j2d_di_cmd[0])
      begin // 4 data beat rd_cpl
	ilu_vld_s0 <= ~dctag_typ;
	ilu_vld_s1 <= 1'b0;
	ilu_vld_s2 <= 1'b0;
	ilu_vld_s3 <= 1'b0;
      end
    else if (j2d_di_cmd_vld & ~j2d_di_cmd[1] & j2d_di_cmd[0])
      begin // 0 data beat rd_cpl
	ilu_vld_s0 <= 1'b0;
	ilu_vld_s1 <= 1'b0;
	ilu_vld_s2 <= 1'b0;
	ilu_vld_s3 <= ~dctag_typ;
      end
    else
      begin // ilu enq pipeline
	ilu_vld_s0 <= 1'b0;
	ilu_vld_s1 <= ilu_vld_s0;
	ilu_vld_s2 <= ilu_vld_s1;
	ilu_vld_s3 <= ilu_vld_s2;
      end
  
  // pipe j2d_d_data_err
  always @(posedge clk)
    if (~rst_l)
      begin // reset pipeline
      data_derr_s0 <= 1'b0;
      data_derr_s1 <= 1'b0;
      data_derr_s2 <= 1'b0;
      end
    else begin
      data_derr_s0 <= j2d_d_data_err;
      data_derr_s1 <= data_derr_s0;
      data_derr_s2 <= data_derr_s1;
        end
  
  // output ilu cacheline status
  always @(posedge clk)
    if (~rst_l)
      begin // reset pipeline
    k2y_dou_err <= 1'b0;
	end
    else begin 
    k2y_dou_err <= (j2d_d_data_err | data_derr_s0 | data_derr_s1 |
		    data_derr_s2 | (j2d_di_cmd_vld & j2d_di_cmd[0]));
 	 end

  // output cl_sts_enq to ilu
  assign k2y_dou_vld = ilu_vld_s3;
  
  // output cl_sts dptr to ilu
  assign k2y_dou_dptr = misc_reg[4:0];
  
  // --------------------------------------------------------
  // DOU DATA BUFFER : DMA CONTROL
  // --------------------------------------------------------
  
  // dma data buffer wr_enq - shift reg to gen wr_enq to dou
  always @(posedge clk)
    if (~rst_l)
      begin
	dma_wr_s0 <= 1'b0;
	dma_wr_s1 <= 1'b0;
	dma_wr_s2 <= 1'b0;
	dma_wr_s3 <= 1'b0;
      end
    else if (j2d_di_cmd_vld & j2d_d_data_vld)
      begin
	dma_wr_s0 <= ~dctag_typ;
	dma_wr_s1 <= ~dctag_typ;
	dma_wr_s2 <= ~dctag_typ;
	dma_wr_s3 <= ~dctag_typ;
      end
    else
      begin
	dma_wr_s0 <= 1'b0;
	dma_wr_s1 <= dma_wr_s0;
	dma_wr_s2 <= dma_wr_s1;
	dma_wr_s3 <= dma_wr_s2;
      end
  
  // output dma wr_enq to dou
  assign cl2do_dma_wr = dma_wr_s3;
  
  // dma row_wr_ptr incrementer
  assign dma_row_wrptr_inc = ((dma_row_wrptr + 1'b1) & {2{~j2d_di_cmd_vld}});
  
  // dma row_wr_ptr register
  always @(posedge clk)
    if (~rst_l)
      dma_row_wrptr <= 2'b0;
    else if (j2d_d_data_vld)
      dma_row_wrptr <= dma_row_wrptr_inc;
  
  // dma complete wr_address
  assign cl2do_dma_addr = {dma_blk_wrptr, dma_row_wrptr};
  
  // --------------------------------------------------------
  // DOU DATA BUFFER : PIO CONTROL
  // --------------------------------------------------------
  
  // pio data buffer wr_enq
  always @(posedge clk)
    if (~rst_l)
      cl2do_pio_wr <= 1'b0;
    else
      cl2do_pio_wr <= j2d_p_data_vld;
  
  // pio blk_wr_ptr
/*  always @(posedge clk)
//    if (~rst_l)
//      pio_buf_addr[5:2] <= 4'b0;
//    else if (j2d_p_cmd_vld)
//      pio_buf_addr[5:2] <= pctag_trnsnum;
//  
//  // pio row_wr_ptr incrementer
//  assign pio_row_wrptr_inc = (pio_buf_addr[1:0] + 1'b1) & {2{~j2d_p_cmd_vld}};
//  
//  // pio row_wr_ptr register
//  always @(posedge clk)
//    if (~rst_l)
//      pio_buf_addr[1:0] <= 2'b0;
//    else if (j2d_p_data_vld)
//      pio_buf_addr[1:0] <= pio_row_wrptr_inc;
*/  
  always @(posedge clk)
    if (~rst_l)
      pio_buf_addr[5:0] <= 6'b0;
    else if (j2d_p_cmd_vld)
      pio_buf_addr[5:0] <= {2'b00,pctag_trnsnum};
  
  // pio complete wr_address
  assign cl2do_pio_addr = pio_buf_addr;
  
endmodule // dmu_clu_crm_datactl
