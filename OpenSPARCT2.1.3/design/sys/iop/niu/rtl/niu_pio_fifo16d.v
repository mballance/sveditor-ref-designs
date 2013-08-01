// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_pio_fifo16d.v
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
/*%W%	%G%*/

/*************************************************************************
 *
 * File Name    : niu_pio_fifo16d.v
 * Author Name  : John Lo
 * Description  : This is a 16 deep, 112 bit wide FIFO.
 * Parent Module: niu
 * Child  Module: 
 * Interface Mod: many.
 * Date Created : 3/29/2004
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/
`include "niu_pio.h" 

module niu_pio_fifo16d(
clk,
reset,
rd,
wr,
din,
dout,
pio_peu_afull,		       
full,
empty,
rd_ptr,
wr_ptr
);
   
/* 0in fifo
   -enq wr
   -deq rd
   -depth 16
   -value -enq_data din -deq_data dout
   -clock clk
   -reset reset
   -message "0in-ERROR : niu_pio FIFO 16d failed"
*/

   input 		      clk;
   input 		      reset;
   input 		      rd;
   input 		      wr;
   input  [`PIO_FIFO_W_R]     din;
   output [`PIO_FIFO_W_R]     dout;
   output 		      pio_peu_afull;
   output 		      full;
   output 		      empty;
   output [`PIO_FIFO_PTR]     rd_ptr;
   output [`PIO_FIFO_PTR]     wr_ptr;
   
   wire         	      ld0;
   wire         	      ld1;
   wire         	      ld2;
   wire         	      ld3;
   wire         	      ld4;
   wire         	      ld5;
   wire         	      ld6;
   wire         	      ld7;
   wire         	      ld8;
   wire         	      ld9;
   wire         	      lda;
   wire         	      ldb;
   wire         	      ldc;
   wire         	      ldd;
   wire         	      lde;
   wire         	      ldf;
   wire [`PIO_FIFO_W_R]	      word0;
   wire [`PIO_FIFO_W_R]	      word1;
   wire [`PIO_FIFO_W_R]	      word2;
   wire [`PIO_FIFO_W_R]	      word3;
   wire [`PIO_FIFO_W_R]	      word4;
   wire [`PIO_FIFO_W_R]	      word5;
   wire [`PIO_FIFO_W_R]	      word6;
   wire [`PIO_FIFO_W_R]	      word7;
   wire [`PIO_FIFO_W_R]	      word8;
   wire [`PIO_FIFO_W_R]	      word9;
   wire [`PIO_FIFO_W_R]	      worda;
   wire [`PIO_FIFO_W_R]	      wordb;
   wire [`PIO_FIFO_W_R]	      wordc;
   wire [`PIO_FIFO_W_R]	      wordd;
   wire [`PIO_FIFO_W_R]	      worde;
   wire [`PIO_FIFO_W_R]	      wordf;
   wire [`PIO_FIFO_PTR]	      rd_ptr;
   wire [`PIO_FIFO_PTR]	      wr_ptr;
   wire [`PIO_FIFO_W_R]	      din;
   reg  [`PIO_FIFO_W_R]	      dout;
   
   wire full   = (rd_ptr[`PIO_FIFO_A_R] == wr_ptr[`PIO_FIFO_A_R]) & (rd_ptr[`PIO_FIFO_A]!=wr_ptr[`PIO_FIFO_A]);

   wire empty  = (rd_ptr[`PIO_FIFO_PTR] == wr_ptr[`PIO_FIFO_PTR]);

   wire    [`PIO_FIFO_PTR] empty_space =  
              (wr_ptr[`PIO_FIFO_A]  == rd_ptr[`PIO_FIFO_A]) ?
  `PIO_FIFO_D - ({1'b0,wr_ptr[`PIO_FIFO_A_R]} - {1'b0,rd_ptr[`PIO_FIFO_A_R]}):
                ({1'b0,rd_ptr[`PIO_FIFO_A_R]} - {1'b0,wr_ptr[`PIO_FIFO_A_R]}) ;

   wire 		   afull = empty_space < 5'd2;
   reg 			   pio_peu_afull;
   
   always @ (posedge clk)
    begin
     if (reset) 
       pio_peu_afull <= 1'b0; 
     else
       pio_peu_afull <= afull; 
    end
   
   wire wr_en  = ~full  & wr;
   wire rd_en  = ~empty & rd;
   
   wire [`PIO_FIFO_PTR] wr_ptr_in = wr_en ? wr_ptr + 1 : wr_ptr;
   wire [`PIO_FIFO_PTR] rd_ptr_in = rd_en ? rd_ptr + 1 : rd_ptr;
dffr #(5) wr_ptr_dffr(.d(wr_ptr_in),.reset(reset),.clk(clk),.q(wr_ptr));
dffr #(5) rd_ptr_dffr(.d(rd_ptr_in),.reset(reset),.clk(clk),.q(rd_ptr));

   assign   ld0 = ((wr_ptr[`PIO_FIFO_A_R] == 4'h0) & wr_en);
   assign   ld1 = ((wr_ptr[`PIO_FIFO_A_R] == 4'h1) & wr_en);
   assign   ld2 = ((wr_ptr[`PIO_FIFO_A_R] == 4'h2) & wr_en);
   assign   ld3 = ((wr_ptr[`PIO_FIFO_A_R] == 4'h3) & wr_en);
   assign   ld4 = ((wr_ptr[`PIO_FIFO_A_R] == 4'h4) & wr_en);
   assign   ld5 = ((wr_ptr[`PIO_FIFO_A_R] == 4'h5) & wr_en);
   assign   ld6 = ((wr_ptr[`PIO_FIFO_A_R] == 4'h6) & wr_en);
   assign   ld7 = ((wr_ptr[`PIO_FIFO_A_R] == 4'h7) & wr_en);
   assign   ld8 = ((wr_ptr[`PIO_FIFO_A_R] == 4'h8) & wr_en);
   assign   ld9 = ((wr_ptr[`PIO_FIFO_A_R] == 4'h9) & wr_en);
   assign   lda = ((wr_ptr[`PIO_FIFO_A_R] == 4'ha) & wr_en);
   assign   ldb = ((wr_ptr[`PIO_FIFO_A_R] == 4'hb) & wr_en);
   assign   ldc = ((wr_ptr[`PIO_FIFO_A_R] == 4'hc) & wr_en);
   assign   ldd = ((wr_ptr[`PIO_FIFO_A_R] == 4'hd) & wr_en);
   assign   lde = ((wr_ptr[`PIO_FIFO_A_R] == 4'he) & wr_en);
   assign   ldf = ((wr_ptr[`PIO_FIFO_A_R] == 4'hf) & wr_en);
   
dffre #(`PIO_FIFO_W) word0_dffr(.d(din),.reset(reset),.en(ld0),.clk(clk),.q(word0));
dffre #(`PIO_FIFO_W) word1_dffr(.d(din),.reset(reset),.en(ld1),.clk(clk),.q(word1));
dffre #(`PIO_FIFO_W) word2_dffr(.d(din),.reset(reset),.en(ld2),.clk(clk),.q(word2));
dffre #(`PIO_FIFO_W) word3_dffr(.d(din),.reset(reset),.en(ld3),.clk(clk),.q(word3));
dffre #(`PIO_FIFO_W) word4_dffr(.d(din),.reset(reset),.en(ld4),.clk(clk),.q(word4));
dffre #(`PIO_FIFO_W) word5_dffr(.d(din),.reset(reset),.en(ld5),.clk(clk),.q(word5));
dffre #(`PIO_FIFO_W) word6_dffr(.d(din),.reset(reset),.en(ld6),.clk(clk),.q(word6));
dffre #(`PIO_FIFO_W) word7_dffr(.d(din),.reset(reset),.en(ld7),.clk(clk),.q(word7));
dffre #(`PIO_FIFO_W) word8_dffr(.d(din),.reset(reset),.en(ld8),.clk(clk),.q(word8));
dffre #(`PIO_FIFO_W) word9_dffr(.d(din),.reset(reset),.en(ld9),.clk(clk),.q(word9));
dffre #(`PIO_FIFO_W) worda_dffr(.d(din),.reset(reset),.en(lda),.clk(clk),.q(worda));
dffre #(`PIO_FIFO_W) wordb_dffr(.d(din),.reset(reset),.en(ldb),.clk(clk),.q(wordb));
dffre #(`PIO_FIFO_W) wordc_dffr(.d(din),.reset(reset),.en(ldc),.clk(clk),.q(wordc));
dffre #(`PIO_FIFO_W) wordd_dffr(.d(din),.reset(reset),.en(ldd),.clk(clk),.q(wordd));
dffre #(`PIO_FIFO_W) worde_dffr(.d(din),.reset(reset),.en(lde),.clk(clk),.q(worde));
dffre #(`PIO_FIFO_W) wordf_dffr(.d(din),.reset(reset),.en(ldf),.clk(clk),.q(wordf));

// read decoder   
always @(/*AUTOSENSE*/rd_ptr or word0 or word1 or word2 or word3
	 or word4 or word5 or word6 or word7 or word8 or word9
	 or worda or wordb or wordc or wordd or worde or wordf)
  begin
    case (rd_ptr[`PIO_FIFO_A_R])
      4'h0:    dout =  word0;
      4'h1:    dout =  word1;
      4'h2:    dout =  word2;
      4'h3:    dout =  word3;
      4'h4:    dout =  word4;
      4'h5:    dout =  word5;
      4'h6:    dout =  word6;
      4'h7:    dout =  word7;
      4'h8:    dout =  word8;
      4'h9:    dout =  word9;
      4'ha:    dout =  worda;
      4'hb:    dout =  wordb;
      4'hc:    dout =  wordc;
      4'hd:    dout =  wordd;
      4'he:    dout =  worde;
      4'hf:    dout =  wordf;
      default: dout =  {69'b0,32'hdead_beef};
    endcase
  end
   
endmodule // niu_pio_fifo16d



