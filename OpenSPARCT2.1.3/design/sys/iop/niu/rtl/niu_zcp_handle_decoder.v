// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_zcp_handle_decoder.v
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

/*****************************************************************
 *
 * File Name    : niu_zcp_handle_decoder.v
 * Author Name  : John Lo
 * Description  : Generate handle when zc_rdc is available.
 *                
 * Parent Module: niu_zcp_slv.v
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 8/11/04
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 ****************************************************************/


`include  "niu_zcp.h"


module niu_zcp_handle_decoder 
  (/*AUTOARG*/
   // Outputs
   fn, handle, 
   // Inputs
   zc_rdc, rdmc_zcp_func_num, page_handle
   );

   input  [3:0]		      zc_rdc;
   input [31:0] 	      rdmc_zcp_func_num;
   input  [`PMS15:0] 	      page_handle;  // 20 bit per handle
   output [1:0] 	      fn;
   output [19:0] 	      handle;

   wire [19:0] 		      handle0  = page_handle[`PMS0 :`PLS0 ];
   wire [19:0] 		      handle1  = page_handle[`PMS1 :`PLS1 ];
   wire [19:0] 		      handle2  = page_handle[`PMS2 :`PLS2 ];
   wire [19:0] 		      handle3  = page_handle[`PMS3 :`PLS3 ];
   wire [19:0] 		      handle4  = page_handle[`PMS4 :`PLS4 ];
   wire [19:0] 		      handle5  = page_handle[`PMS5 :`PLS5 ];
   wire [19:0] 		      handle6  = page_handle[`PMS6 :`PLS6 ];
   wire [19:0] 		      handle7  = page_handle[`PMS7 :`PLS7 ];
   wire [19:0] 		      handle8  = page_handle[`PMS8 :`PLS8 ];
   wire [19:0] 		      handle9  = page_handle[`PMS9 :`PLS9 ];
   wire [19:0] 		      handle10 = page_handle[`PMS10:`PLS10];
   wire [19:0] 		      handle11 = page_handle[`PMS11:`PLS11];
   wire [19:0] 		      handle12 = page_handle[`PMS12:`PLS12];
   wire [19:0] 		      handle13 = page_handle[`PMS13:`PLS13];
   wire [19:0] 		      handle14 = page_handle[`PMS14:`PLS14];
   wire [19:0] 		      handle15 = page_handle[`PMS15:`PLS15];

   wire [1:0] 		      fn0  = rdmc_zcp_func_num[1:0];
   wire [1:0] 		      fn1  = rdmc_zcp_func_num[3:2];
   wire [1:0] 		      fn2  = rdmc_zcp_func_num[5:4];
   wire [1:0] 		      fn3  = rdmc_zcp_func_num[7:6];
   wire [1:0] 		      fn4  = rdmc_zcp_func_num[9:8];
   wire [1:0] 		      fn5  = rdmc_zcp_func_num[11:10];
   wire [1:0] 		      fn6  = rdmc_zcp_func_num[13:12];
   wire [1:0] 		      fn7  = rdmc_zcp_func_num[15:14];
   wire [1:0] 		      fn8  = rdmc_zcp_func_num[17:16];
   wire [1:0] 		      fn9  = rdmc_zcp_func_num[19:18];
   wire [1:0] 		      fn10 = rdmc_zcp_func_num[21:20];
   wire [1:0] 		      fn11 = rdmc_zcp_func_num[23:22];
   wire [1:0] 		      fn12 = rdmc_zcp_func_num[25:24];
   wire [1:0] 		      fn13 = rdmc_zcp_func_num[27:26];
   wire [1:0] 		      fn14 = rdmc_zcp_func_num[29:28];
   wire [1:0] 		      fn15 = rdmc_zcp_func_num[31:30];

   reg  [19:0] 		      handle;
   reg  [1:0] 		      fn;

 always @ (/*AUTOSENSE*/fn0 or fn1 or fn10 or fn11 or fn12 or fn13
	   or fn14 or fn15 or fn2 or fn3 or fn4 or fn5 or fn6 or fn7
	   or fn8 or fn9 or handle0 or handle1 or handle10 or handle11
	   or handle12 or handle13 or handle14 or handle15 or handle2
	   or handle3 or handle4 or handle5 or handle6 or handle7
	   or handle8 or handle9 or zc_rdc)   
   begin
          casex (zc_rdc[3:0])    //synopsys parallel_case full_case infer_mux
            4'd0:   begin handle = handle0 ; fn = fn0 ; end
            4'd1:   begin handle = handle1 ; fn = fn1 ; end
            4'd2:   begin handle = handle2 ; fn = fn2 ; end
            4'd3:   begin handle = handle3 ; fn = fn3 ; end
            4'd4:   begin handle = handle4 ; fn = fn4 ; end
            4'd5:   begin handle = handle5 ; fn = fn5 ; end
            4'd6:   begin handle = handle6 ; fn = fn6 ; end
            4'd7:   begin handle = handle7 ; fn = fn7 ; end
            4'd8:   begin handle = handle8 ; fn = fn8 ; end
            4'd9:   begin handle = handle9 ; fn = fn9 ; end
            4'd10:  begin handle = handle10; fn = fn10; end
            4'd11:  begin handle = handle11; fn = fn11; end
            4'd12:  begin handle = handle12; fn = fn12; end
            4'd13:  begin handle = handle13; fn = fn13; end
            4'd14:  begin handle = handle14; fn = fn14; end
            4'd15:  begin handle = handle15; fn = fn15; end
            default:begin handle = handle0 ; fn = fn0 ; end
          endcase
   end // always @ (...
   


 

endmodule // niu_zcp_handle_decoder


