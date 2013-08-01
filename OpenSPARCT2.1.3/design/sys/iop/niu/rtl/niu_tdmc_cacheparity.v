// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_tdmc_cacheparity.v
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
/*********************************************************************
 *
 * 
 *  Orignal Author(s):   Arvind Srinivasan
 *  Modifier(s):
 *  Project(s):          Neptune
 *
 *  Copyright (c) 2004   Sun Microsystems, Inc.
 *
 *  All Rights Reserved.
 *
 *  This verilog model is the confidential and proprietary property of
 *  Sun Microsystems, Inc., and the possession or use of this model
 *  requires a written license from Sun Microsystems, Inc.
 *
 **********************************************************************/

`include "txc_defines.h"
`include "niu_dmc_reg_defines.h"



module niu_tdmc_cacheparity ( /*AUTOARG*/
   // Outputs
   parity, parity_status, data_out,
   // Inputs
   SysClk, Reset_L, data_in, parity_corrupt_dma_match, 
   parity_corrupt_config, write_strobe, write_addr, 
   ram_data_out, ram_parity_out
   );
   input SysClk;
   input Reset_L;

   input [131:0] data_in;

   input [31:0] parity_corrupt_dma_match;
   input [31:0] parity_corrupt_config;
   input write_strobe;
   input [2:0] write_addr;

   output [15:0] parity;
   
   output [131:0] data_out;
   input [131:0] ram_data_out;
   input [15:0] ram_parity_out;
   output parity_status;

   reg [15:0] parity;
   reg [15:0] parity_out;
   reg [131:0] data_out;
   reg [15:0] parity_to_check;
   
   reg set_parity_error_dma23;
   reg set_parity_error_dma22;
   reg set_parity_error_dma21;
   reg set_parity_error_dma20;
   reg set_parity_error_dma19;
   reg set_parity_error_dma18;
   reg set_parity_error_dma17;
   reg set_parity_error_dma16;
   reg set_parity_error_dma15;
   reg set_parity_error_dma14;
   reg set_parity_error_dma13;
   reg set_parity_error_dma12;
   reg set_parity_error_dma11;
   reg set_parity_error_dma10;
   reg set_parity_error_dma9;
   reg set_parity_error_dma8;
   reg set_parity_error_dma7;
   reg set_parity_error_dma6;
   reg set_parity_error_dma5;
   reg set_parity_error_dma4;
   reg set_parity_error_dma3;
   reg set_parity_error_dma2;
   reg set_parity_error_dma1;
   reg set_parity_error_dma0;
   reg [23:0] parity_corrupt_config_d;
   wire corrupt_parity;
   wire [31:0] set_parity_error;

   function [15:0] calc_parity ;
      input [131:0] in;
      reg   calcDataParity0;
      reg   calcDataParity1;
      reg   calcDataParity2;
      reg   calcDataParity3;
      reg   calcDataParity4;
      reg   calcDataParity5;
      reg   calcDataParity6;
      reg   calcDataParity7;
      reg   calcDataParity8;
      reg   calcDataParity9;
      reg   calcDataParity10;
      reg   calcDataParity11;
      reg   calcDataParity12;
      reg   calcDataParity13;
      reg   calcDataParity14;
      reg   calcDataParity15;
      begin
	 calcDataParity15 = ^in[131:120]; // special case - due to extra 4 bits
	 calcDataParity14 = ^in[119:112];
	 calcDataParity13 = ^in[111:104];
	 calcDataParity12 = ^in[103:96];
	 calcDataParity11 = ^in[95:88];
	 calcDataParity10 = ^in[87:80];
	 calcDataParity9  = ^in[79:72];
	 calcDataParity8  = ^in[71:64];
	 calcDataParity7  = ^in[63:56];
	 calcDataParity6  = ^in[55:48];
	 calcDataParity5  = ^in[47:40];
	 calcDataParity4  = ^in[39:32];
	 calcDataParity3  = ^in[31:24];
	 calcDataParity2  = ^in[23:16];
	 calcDataParity1  = ^in[15:8];
	 calcDataParity0  = ^in[7:0];

	 calc_parity = {calcDataParity15, calcDataParity14, calcDataParity13, calcDataParity12,
			calcDataParity11, calcDataParity10, calcDataParity9 , calcDataParity8 ,
			calcDataParity7 , calcDataParity6 , calcDataParity5 , calcDataParity4 ,
			calcDataParity3 , calcDataParity2 , calcDataParity1 , calcDataParity0 };
      end
      
   endfunction // calc_parity
   
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 parity_corrupt_config_d<= 24'h0;
      end else begin // if (!Reset_L)
         parity_corrupt_config_d[`NO_OF_DMAS -1 :0]<= parity_corrupt_config[`NO_OF_DMAS -1 :0] ;
      end // else: !if(!Reset_L)
   end // always@ (posedge SysClk)
   
  
   wire corrupt_address;
   assign corrupt_address = (write_strobe & write_addr[2:0] == 3'h1);

   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_parity_error_dma0<= 1'h0;
      end else begin
	 set_parity_error_dma0<= (parity_corrupt_config[0] &~parity_corrupt_config_d[0]) | (set_parity_error_dma0 & ~ (parity_corrupt_dma_match[0] & corrupt_address));
      end // else: !if(!Reset_L)
   end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_parity_error_dma1<= 1'h0;
      end else begin
	 set_parity_error_dma1<= (parity_corrupt_config[1] &~parity_corrupt_config_d[1]) | (set_parity_error_dma1 & ~(parity_corrupt_dma_match[1] & corrupt_address));
      end // else: !if(!Reset_L)
   end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_parity_error_dma2<= 1'h0;
      end else begin
	 set_parity_error_dma2<= (parity_corrupt_config[2] &~parity_corrupt_config_d[2]) | (set_parity_error_dma2 & ~(parity_corrupt_dma_match[2] & corrupt_address));
      end // else: !if(!Reset_L)
   end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_parity_error_dma3<= 1'h0;
      end else begin
	 set_parity_error_dma3<= (parity_corrupt_config[3] &~parity_corrupt_config_d[3]) | (set_parity_error_dma3 & ~(parity_corrupt_dma_match[3] & corrupt_address));
      end // else: !if(!Reset_L)
   end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_parity_error_dma4<= 1'h0;
      end else begin
	 set_parity_error_dma4<= (parity_corrupt_config[4] &~parity_corrupt_config_d[4]) | (set_parity_error_dma4 & ~(parity_corrupt_dma_match[4] & corrupt_address) );
      end // else: !if(!Reset_L)
   end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_parity_error_dma5<= 1'h0;
      end else begin
	 set_parity_error_dma5<= (parity_corrupt_config[5] &~parity_corrupt_config_d[5]) | (set_parity_error_dma5 & ~(parity_corrupt_dma_match[5] & corrupt_address) );
      end // else: !if(!Reset_L)
   end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_parity_error_dma6<= 1'h0;
      end else begin
	 set_parity_error_dma6<= (parity_corrupt_config[6] &~parity_corrupt_config_d[6]) | (set_parity_error_dma6 & ~(parity_corrupt_dma_match[6] & corrupt_address) );
      end // else: !if(!Reset_L)
   end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_parity_error_dma7<= 1'h0;
      end else begin
	 set_parity_error_dma7<= (parity_corrupt_config[7] &~parity_corrupt_config_d[7]) | (set_parity_error_dma7 & ~(parity_corrupt_dma_match[7] & corrupt_address) );
      end // else: !if(!Reset_L)
   end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_parity_error_dma8<= 1'h0;
      end else begin
	 set_parity_error_dma8<= (parity_corrupt_config[8] &~parity_corrupt_config_d[8]) | (set_parity_error_dma8 & ~(parity_corrupt_dma_match[8] & corrupt_address) );
      end // else: !if(!Reset_L)
   end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_parity_error_dma9<= 1'h0;
      end else begin
	 set_parity_error_dma9<= (parity_corrupt_config[9] &~parity_corrupt_config_d[9]) | (set_parity_error_dma9 & ~(parity_corrupt_dma_match[9] & corrupt_address) );
      end // else: !if(!Reset_L)
   end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_parity_error_dma10<= 1'h0;
      end else begin
	 set_parity_error_dma10<= (parity_corrupt_config[10] &~parity_corrupt_config_d[10]) | (set_parity_error_dma10 & ~(parity_corrupt_dma_match[10] & corrupt_address) );
      end // else: !if(!Reset_L)
   end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_parity_error_dma11<= 1'h0;
      end else begin
	 set_parity_error_dma11<= (parity_corrupt_config[11] &~parity_corrupt_config_d[11]) | (set_parity_error_dma11 & ~(parity_corrupt_dma_match[11] & corrupt_address));
      end // else: !if(!Reset_L)
   end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_parity_error_dma12<= 1'h0;
      end else begin
	 set_parity_error_dma12<= (parity_corrupt_config[12] &~parity_corrupt_config_d[12]) | (set_parity_error_dma12 & ~(parity_corrupt_dma_match[12] & corrupt_address) );
      end // else: !if(!Reset_L)
   end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_parity_error_dma13<= 1'h0;
      end else begin
	 set_parity_error_dma13<= (parity_corrupt_config[13] &~parity_corrupt_config_d[13]) | (set_parity_error_dma13 & ~(parity_corrupt_dma_match[13] & corrupt_address)) ;
      end // else: !if(!Reset_L)
   end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_parity_error_dma14<= 1'h0;
      end else begin
	 set_parity_error_dma14<= (parity_corrupt_config[14] &~parity_corrupt_config_d[14]) | (set_parity_error_dma14 & ~(parity_corrupt_dma_match[14] & corrupt_address)) ;
      end // else: !if(!Reset_L)
   end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_parity_error_dma15<= 1'h0;
      end else begin
	 set_parity_error_dma15<= (parity_corrupt_config[15] &~parity_corrupt_config_d[15]) | (set_parity_error_dma15 & ~(parity_corrupt_dma_match[15] & corrupt_address)) ;
      end // else: !if(!Reset_L)
   end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_parity_error_dma16<= 1'h0;
      end else begin
	 set_parity_error_dma16<= (parity_corrupt_config[16] &~parity_corrupt_config_d[16]) | (set_parity_error_dma16 & ~(parity_corrupt_dma_match[16] & corrupt_address));
      end // else: !if(!Reset_L)
   end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_parity_error_dma17<= 1'h0;
      end else begin
	 set_parity_error_dma17<= (parity_corrupt_config[17] &~parity_corrupt_config_d[17]) | (set_parity_error_dma17 & ~(parity_corrupt_dma_match[17] & corrupt_address));
      end // else: !if(!Reset_L)
   end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_parity_error_dma18<= 1'h0;
      end else begin
	 set_parity_error_dma18<= (parity_corrupt_config[18] &~parity_corrupt_config_d[18]) | (set_parity_error_dma18 & ~(parity_corrupt_dma_match[18] & corrupt_address));
      end // else: !if(!Reset_L)
   end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_parity_error_dma19<= 1'h0;
      end else begin
	 set_parity_error_dma19<= (parity_corrupt_config[19] &~parity_corrupt_config_d[19]) | (set_parity_error_dma19 & ~(parity_corrupt_dma_match[19] & corrupt_address));
      end // else: !if(!Reset_L)
   end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_parity_error_dma20<= 1'h0;
      end else begin
	 set_parity_error_dma20<= (parity_corrupt_config[20] &~parity_corrupt_config_d[20]) | (set_parity_error_dma20 & ~(parity_corrupt_dma_match[20] & corrupt_address));
      end // else: !if(!Reset_L)
   end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_parity_error_dma21<= 1'h0;
      end else begin
	 set_parity_error_dma21<= (parity_corrupt_config[21] &~parity_corrupt_config_d[21]) | (set_parity_error_dma21 & ~(parity_corrupt_dma_match[21] & corrupt_address));
      end // else: !if(!Reset_L)
   end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_parity_error_dma22<= 1'h0;
      end else begin
	 set_parity_error_dma22<= (parity_corrupt_config[22] &~parity_corrupt_config_d[22]) | (set_parity_error_dma22 & ~(parity_corrupt_dma_match[22] & corrupt_address));
      end // else: !if(!Reset_L)
   end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_parity_error_dma23<= 1'h0;
      end else begin
	 set_parity_error_dma23<= (parity_corrupt_config[23] &~parity_corrupt_config_d[23]) | (set_parity_error_dma23 & ~(parity_corrupt_dma_match[23] & corrupt_address ) );
      end // else: !if(!Reset_L)
   end
   
   assign set_parity_error = {8'h0, set_parity_error_dma23, set_parity_error_dma22, set_parity_error_dma21, set_parity_error_dma20,
			      set_parity_error_dma19, set_parity_error_dma18, set_parity_error_dma17, set_parity_error_dma16,
			      set_parity_error_dma15, set_parity_error_dma14, set_parity_error_dma13, set_parity_error_dma12,
			      set_parity_error_dma11, set_parity_error_dma10, set_parity_error_dma9, set_parity_error_dma8,
			      set_parity_error_dma7, set_parity_error_dma6, set_parity_error_dma5, set_parity_error_dma4,
			      set_parity_error_dma3, set_parity_error_dma2, set_parity_error_dma1, set_parity_error_dma0 };

   assign corrupt_parity =  |({parity_corrupt_dma_match} & parity_corrupt_config & set_parity_error) & corrupt_address ;
   
   
   
   always@(data_in or corrupt_parity) begin
      if(corrupt_parity)
	parity = calc_parity( data_in ) ^ 16'h1;
      else parity = calc_parity( data_in );
   end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 data_out <= 132'h0;
	 parity_to_check <= 16'h0;
      end else begin
	 data_out <= ram_data_out;
	 parity_to_check <= ram_parity_out;
      end
    end


    always@(data_out) begin
      parity_out = calc_parity( data_out );
   end

   assign parity_status = (~((parity_out[15] == parity_to_check[15]) &&
                      (parity_out[14] == parity_to_check[14]) &&
                      (parity_out[13] == parity_to_check[13]) &&
                      (parity_out[12] == parity_to_check[12]) &&
                      (parity_out[11] == parity_to_check[11]) &&
                      (parity_out[10] == parity_to_check[10]) &&
                      (parity_out[9 ] == parity_to_check[9]) &&
                      (parity_out[8 ] == parity_to_check[8]) &&
                      (parity_out[7 ] == parity_to_check[7]) &&
                      (parity_out[6 ] == parity_to_check[6]) &&
                      (parity_out[5 ] == parity_to_check[5]) &&
                      (parity_out[4 ] == parity_to_check[4]) &&
                      (parity_out[3 ] == parity_to_check[3]) &&
                      (parity_out[2 ] == parity_to_check[2]) &&
                      (parity_out[1 ] == parity_to_check[1]) &&
                      (parity_out[0 ] == parity_to_check[0])
		      )
		    );
   
 
endmodule // niu_tdmc_cacheparity

			     
