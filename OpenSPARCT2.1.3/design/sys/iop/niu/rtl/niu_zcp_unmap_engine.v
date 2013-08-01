// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_zcp_unmap_engine.v
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
 * File Name    : niu_zcp_unmap_engine.v
 * Authors Name : John Lo
 * Description  : Create unmapp data for mapped_in field.
 * Parent Module: niu_zcp_tt_dpath
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 8/17/2004
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential
 *
 * Design Notes:
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

`include  "./niu_zcp.h"

module niu_zcp_unmap_engine 
  (/*AUTOARG*/
   // Outputs
   wb_mapped_in, 
   // Inputs
   clk, reset, ulp_unmap_all_oc, num_buf_requested, mapped_in, 
   anchor_buf, tt_index_temp
   );
   
   input                      clk;
   input 		      reset;
   input 		      ulp_unmap_all_oc;
   input  [5:0] 	      num_buf_requested;
   input  [31:0] 	      mapped_in;
   input  [4:0] 	      anchor_buf;
   input  [11:0] 	      tt_index_temp;
   output [31:0] 	      wb_mapped_in;


   reg  [31:0] 		      wb_mapped_in;
   reg  [31:0] 		      temp_unmap;
   wire [5:0] 		      num_buf_requested;     
   wire [11:0] 		      tt_index_temp;
   wire [31:0] 		      mapped_in_temp;
   

always @ (/*AUTOSENSE*/num_buf_requested)
  begin
                temp_unmap = 32'b1111111111111111_1111111111111111;
     casex (num_buf_requested[5:0])
       6'd0   : temp_unmap = 32'b1111111111111111_1111111111111111;
       6'd1   : temp_unmap = 32'b1111111111111111_1111111111111110;
       6'd2   : temp_unmap = 32'b1111111111111111_1111111111111100;
       6'd3   : temp_unmap = 32'b1111111111111111_1111111111111000;
       6'd4   : temp_unmap = 32'b1111111111111111_1111111111110000;
       6'd5   : temp_unmap = 32'b1111111111111111_1111111111100000;
       6'd6   : temp_unmap = 32'b1111111111111111_1111111111000000;
       6'd7   : temp_unmap = 32'b1111111111111111_1111111110000000;
       6'd8   : temp_unmap = 32'b1111111111111111_1111111100000000;
       6'd9   : temp_unmap = 32'b1111111111111111_1111111000000000;
       6'd10  : temp_unmap = 32'b1111111111111111_1111110000000000;
       6'd11  : temp_unmap = 32'b1111111111111111_1111100000000000;
       6'd12  : temp_unmap = 32'b1111111111111111_1111000000000000;
       6'd13  : temp_unmap = 32'b1111111111111111_1110000000000000;
       6'd14  : temp_unmap = 32'b1111111111111111_1100000000000000;
       6'd15  : temp_unmap = 32'b1111111111111111_1000000000000000;
       6'd16  : temp_unmap = 32'b1111111111111111_0000000000000000;
       6'd17  : temp_unmap = 32'b1111111111111110_0000000000000000;
       6'd18  : temp_unmap = 32'b1111111111111100_0000000000000000;
       6'd19  : temp_unmap = 32'b1111111111111000_0000000000000000;
       6'd20  : temp_unmap = 32'b1111111111110000_0000000000000000;
       6'd21  : temp_unmap = 32'b1111111111100000_0000000000000000;
       6'd22  : temp_unmap = 32'b1111111111000000_0000000000000000;
       6'd23  : temp_unmap = 32'b1111111110000000_0000000000000000;
       6'd24  : temp_unmap = 32'b1111111100000000_0000000000000000;
       6'd25  : temp_unmap = 32'b1111111000000000_0000000000000000;
       6'd26  : temp_unmap = 32'b1111110000000000_0000000000000000;
       6'd27  : temp_unmap = 32'b1111100000000000_0000000000000000;
       6'd28  : temp_unmap = 32'b1111000000000000_0000000000000000;
       6'd29  : temp_unmap = 32'b1110000000000000_0000000000000000;
       6'd30  : temp_unmap = 32'b1100000000000000_0000000000000000;
       6'd31  : temp_unmap = 32'b1000000000000000_0000000000000000;
       6'd32  : temp_unmap = 32'b0000000000000000_0000000000000000;
       default: temp_unmap = 32'b1111111111111111_1111111111111111;
     endcase
  end

   assign  mapped_in_temp = temp_unmap[31:0] & mapped_in[31:0];

   parameter  FOUR_BUF      = 2'b00 ,
	      EIGHT_BUF     = 2'b01 ,
              SIXTEEN_BUF   = 2'b10 ,
	      THIRTY_TWO_BUF= 2'b11 ;
   
always @ (/*AUTOSENSE*/anchor_buf or mapped_in_temp or tt_index_temp
	  or ulp_unmap_all_oc)
  begin
                        wb_mapped_in[31:0]= mapped_in_temp[31:0] ;
     if (ulp_unmap_all_oc)
        begin
	    // unmap process 
   	    wb_mapped_in   = {32{1'b0}};
	    // NO move anchor process
        end  // if (ulp_unmap_all_oc)
///////////////////////////////////////////////////////////
///// rotate to right place ///////////////////////////////
///////////////////////////////////////////////////////////
     casex (tt_index_temp[11:10]) // synopsys parallel_case full_case 
       FOUR_BUF:
         casex (anchor_buf[1:0]) // synopsys parallel_case full_case 
           2'd0   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[0];
                        wb_mapped_in[1]  = mapped_in_temp[1];
                        wb_mapped_in[2]  = mapped_in_temp[2];
                        wb_mapped_in[3]  = mapped_in_temp[3];
                    end
           2'd1   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[3];
                        wb_mapped_in[1]  = mapped_in_temp[0];
                        wb_mapped_in[2]  = mapped_in_temp[1];
                        wb_mapped_in[3]  = mapped_in_temp[2];
                    end
           2'd2   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[2];
                        wb_mapped_in[1]  = mapped_in_temp[3];
                        wb_mapped_in[2]  = mapped_in_temp[0];
                        wb_mapped_in[3]  = mapped_in_temp[1];
                    end
           2'd3   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[1];
                        wb_mapped_in[1]  = mapped_in_temp[2];
                        wb_mapped_in[2]  = mapped_in_temp[3];
                        wb_mapped_in[3]  = mapped_in_temp[0];
                    end
         endcase // casex(anchor_buf[1:0])
       EIGHT_BUF:
         casex (anchor_buf[2:0]) // synopsys parallel_case full_case 
           3'd0   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[0];
                        wb_mapped_in[1]  = mapped_in_temp[1];
                        wb_mapped_in[2]  = mapped_in_temp[2];
                        wb_mapped_in[3]  = mapped_in_temp[3];
                        wb_mapped_in[4]  = mapped_in_temp[4];
                        wb_mapped_in[5]  = mapped_in_temp[5];
                        wb_mapped_in[6]  = mapped_in_temp[6];
                        wb_mapped_in[7]  = mapped_in_temp[7];
                    end
           3'd1   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[7];
                        wb_mapped_in[1]  = mapped_in_temp[0];
                        wb_mapped_in[2]  = mapped_in_temp[1];
                        wb_mapped_in[3]  = mapped_in_temp[2];
                        wb_mapped_in[4]  = mapped_in_temp[3];
                        wb_mapped_in[5]  = mapped_in_temp[4];
                        wb_mapped_in[6]  = mapped_in_temp[5];
                        wb_mapped_in[7]  = mapped_in_temp[6];
                    end
           3'd2   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[6];
                        wb_mapped_in[1]  = mapped_in_temp[7];
                        wb_mapped_in[2]  = mapped_in_temp[0];
                        wb_mapped_in[3]  = mapped_in_temp[1];
                        wb_mapped_in[4]  = mapped_in_temp[2];
                        wb_mapped_in[5]  = mapped_in_temp[3];
                        wb_mapped_in[6]  = mapped_in_temp[4];
                        wb_mapped_in[7]  = mapped_in_temp[5];
                    end		      
           3'd3   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[5];
                        wb_mapped_in[1]  = mapped_in_temp[6];
                        wb_mapped_in[2]  = mapped_in_temp[7];
                        wb_mapped_in[3]  = mapped_in_temp[0];
                        wb_mapped_in[4]  = mapped_in_temp[1];
                        wb_mapped_in[5]  = mapped_in_temp[2];
                        wb_mapped_in[6]  = mapped_in_temp[3];
                        wb_mapped_in[7]  = mapped_in_temp[4];
                    end		      
           3'd4   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[4];
                        wb_mapped_in[1]  = mapped_in_temp[5];
                        wb_mapped_in[2]  = mapped_in_temp[6];
                        wb_mapped_in[3]  = mapped_in_temp[7];
                        wb_mapped_in[4]  = mapped_in_temp[0];
                        wb_mapped_in[5]  = mapped_in_temp[1];
                        wb_mapped_in[6]  = mapped_in_temp[2];
                        wb_mapped_in[7]  = mapped_in_temp[3];
                    end		     
           3'd5   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[3];
                        wb_mapped_in[1]  = mapped_in_temp[4];
                        wb_mapped_in[2]  = mapped_in_temp[5];
                        wb_mapped_in[3]  = mapped_in_temp[6];
                        wb_mapped_in[4]  = mapped_in_temp[7];
                        wb_mapped_in[5]  = mapped_in_temp[0];
                        wb_mapped_in[6]  = mapped_in_temp[1];
                        wb_mapped_in[7]  = mapped_in_temp[2];
                    end		     
           3'd6   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[2];
                        wb_mapped_in[1]  = mapped_in_temp[3];
                        wb_mapped_in[2]  = mapped_in_temp[4];
                        wb_mapped_in[3]  = mapped_in_temp[5];
                        wb_mapped_in[4]  = mapped_in_temp[6];
                        wb_mapped_in[5]  = mapped_in_temp[7];
                        wb_mapped_in[6]  = mapped_in_temp[0];
                        wb_mapped_in[7]  = mapped_in_temp[1];
                    end		     
           3'd7   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[1];
                        wb_mapped_in[1]  = mapped_in_temp[2];
                        wb_mapped_in[2]  = mapped_in_temp[3];
                        wb_mapped_in[3]  = mapped_in_temp[4];
                        wb_mapped_in[4]  = mapped_in_temp[5];
                        wb_mapped_in[5]  = mapped_in_temp[6];
                        wb_mapped_in[6]  = mapped_in_temp[7];
                        wb_mapped_in[7]  = mapped_in_temp[0];
                    end	
         endcase // casex(anchor_buf[2:0])
       SIXTEEN_BUF:
         casex (anchor_buf[3:0]) // synopsys parallel_case full_case 
           4'd0   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[0] ;
                        wb_mapped_in[1]  = mapped_in_temp[1] ;
                        wb_mapped_in[2]  = mapped_in_temp[2] ;
                        wb_mapped_in[3]  = mapped_in_temp[3] ;
                        wb_mapped_in[4]  = mapped_in_temp[4] ;
                        wb_mapped_in[5]  = mapped_in_temp[5] ;
                        wb_mapped_in[6]  = mapped_in_temp[6] ;
                        wb_mapped_in[7]  = mapped_in_temp[7] ;
                        wb_mapped_in[8]  = mapped_in_temp[8] ;
                        wb_mapped_in[9]  = mapped_in_temp[9] ;
                        wb_mapped_in[10] = mapped_in_temp[10];
                        wb_mapped_in[11] = mapped_in_temp[11];
                        wb_mapped_in[12] = mapped_in_temp[12];
                        wb_mapped_in[13] = mapped_in_temp[13];
                        wb_mapped_in[14] = mapped_in_temp[14];
                        wb_mapped_in[15] = mapped_in_temp[15];
                    end
           4'd1   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[15];
                        wb_mapped_in[1]  = mapped_in_temp[0] ;
                        wb_mapped_in[2]  = mapped_in_temp[1] ;
                        wb_mapped_in[3]  = mapped_in_temp[2] ;
                        wb_mapped_in[4]  = mapped_in_temp[3] ;
                        wb_mapped_in[5]  = mapped_in_temp[4] ;
                        wb_mapped_in[6]  = mapped_in_temp[5] ;
                        wb_mapped_in[7]  = mapped_in_temp[6] ;
                        wb_mapped_in[8]  = mapped_in_temp[7] ;
                        wb_mapped_in[9]  = mapped_in_temp[8] ;
                        wb_mapped_in[10] = mapped_in_temp[9] ;
                        wb_mapped_in[11] = mapped_in_temp[10];
                        wb_mapped_in[12] = mapped_in_temp[11];
                        wb_mapped_in[13] = mapped_in_temp[12];
                        wb_mapped_in[14] = mapped_in_temp[13];
                        wb_mapped_in[15] = mapped_in_temp[14];
                    end		     
           4'd2   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[14];
                        wb_mapped_in[1]  = mapped_in_temp[15];
                        wb_mapped_in[2]  = mapped_in_temp[0] ;
                        wb_mapped_in[3]  = mapped_in_temp[1] ;
                        wb_mapped_in[4]  = mapped_in_temp[2] ;
                        wb_mapped_in[5]  = mapped_in_temp[3] ;
                        wb_mapped_in[6]  = mapped_in_temp[4] ;
                        wb_mapped_in[7]  = mapped_in_temp[5] ;
                        wb_mapped_in[8]  = mapped_in_temp[6] ;
                        wb_mapped_in[9]  = mapped_in_temp[7] ;
                        wb_mapped_in[10] = mapped_in_temp[8] ;
                        wb_mapped_in[11] = mapped_in_temp[9] ;
                        wb_mapped_in[12] = mapped_in_temp[10];
                        wb_mapped_in[13] = mapped_in_temp[11];
                        wb_mapped_in[14] = mapped_in_temp[12];
                        wb_mapped_in[15] = mapped_in_temp[13];
                    end		     
           4'd3   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[13];
                        wb_mapped_in[1]  = mapped_in_temp[14];
                        wb_mapped_in[2]  = mapped_in_temp[15];
                        wb_mapped_in[3]  = mapped_in_temp[0] ;
                        wb_mapped_in[4]  = mapped_in_temp[1] ;
                        wb_mapped_in[5]  = mapped_in_temp[2] ;
                        wb_mapped_in[6]  = mapped_in_temp[3] ;
                        wb_mapped_in[7]  = mapped_in_temp[4] ;
                        wb_mapped_in[8]  = mapped_in_temp[5] ;
                        wb_mapped_in[9]  = mapped_in_temp[6] ;
                        wb_mapped_in[10] = mapped_in_temp[7] ;
                        wb_mapped_in[11] = mapped_in_temp[8] ;
                        wb_mapped_in[12] = mapped_in_temp[9] ;
                        wb_mapped_in[13] = mapped_in_temp[10];
                        wb_mapped_in[14] = mapped_in_temp[11];
                        wb_mapped_in[15] = mapped_in_temp[12];
                    end		     
           4'd4   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[12];
                        wb_mapped_in[1]  = mapped_in_temp[13];
                        wb_mapped_in[2]  = mapped_in_temp[14];
                        wb_mapped_in[3]  = mapped_in_temp[15];
                        wb_mapped_in[4]  = mapped_in_temp[0] ;
                        wb_mapped_in[5]  = mapped_in_temp[1] ;
                        wb_mapped_in[6]  = mapped_in_temp[2] ;
                        wb_mapped_in[7]  = mapped_in_temp[3] ;
                        wb_mapped_in[8]  = mapped_in_temp[4] ;
                        wb_mapped_in[9]  = mapped_in_temp[5] ;
                        wb_mapped_in[10] = mapped_in_temp[6] ;
                        wb_mapped_in[11] = mapped_in_temp[7] ;
                        wb_mapped_in[12] = mapped_in_temp[8] ;
                        wb_mapped_in[13] = mapped_in_temp[9] ;
                        wb_mapped_in[14] = mapped_in_temp[10];
                        wb_mapped_in[15] = mapped_in_temp[11];
                    end		     
           4'd5   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[11];
                        wb_mapped_in[1]  = mapped_in_temp[12];
                        wb_mapped_in[2]  = mapped_in_temp[13];
                        wb_mapped_in[3]  = mapped_in_temp[14];
                        wb_mapped_in[4]  = mapped_in_temp[15];
                        wb_mapped_in[5]  = mapped_in_temp[0] ;
                        wb_mapped_in[6]  = mapped_in_temp[1] ;
                        wb_mapped_in[7]  = mapped_in_temp[2] ;
                        wb_mapped_in[8]  = mapped_in_temp[3] ;
                        wb_mapped_in[9]  = mapped_in_temp[4] ;
                        wb_mapped_in[10] = mapped_in_temp[5] ;
                        wb_mapped_in[11] = mapped_in_temp[6] ;
                        wb_mapped_in[12] = mapped_in_temp[7] ;
                        wb_mapped_in[13] = mapped_in_temp[8] ;
                        wb_mapped_in[14] = mapped_in_temp[9] ;
                        wb_mapped_in[15] = mapped_in_temp[10];
                    end		     
           4'd6   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[10];
                        wb_mapped_in[1]  = mapped_in_temp[11];
                        wb_mapped_in[2]  = mapped_in_temp[12];
                        wb_mapped_in[3]  = mapped_in_temp[13];
                        wb_mapped_in[4]  = mapped_in_temp[14];
                        wb_mapped_in[5]  = mapped_in_temp[15];
                        wb_mapped_in[6]  = mapped_in_temp[0] ;
                        wb_mapped_in[7]  = mapped_in_temp[1] ;
                        wb_mapped_in[8]  = mapped_in_temp[2] ;
                        wb_mapped_in[9]  = mapped_in_temp[3] ;
                        wb_mapped_in[10] = mapped_in_temp[4] ;
                        wb_mapped_in[11] = mapped_in_temp[5] ;
                        wb_mapped_in[12] = mapped_in_temp[6] ;
                        wb_mapped_in[13] = mapped_in_temp[7] ;
                        wb_mapped_in[14] = mapped_in_temp[8] ;
                        wb_mapped_in[15] = mapped_in_temp[9] ;
                    end		     
           4'd7   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[9] ;
                        wb_mapped_in[1]  = mapped_in_temp[10];
                        wb_mapped_in[2]  = mapped_in_temp[11];
                        wb_mapped_in[3]  = mapped_in_temp[12];
                        wb_mapped_in[4]  = mapped_in_temp[13];
                        wb_mapped_in[5]  = mapped_in_temp[14];
                        wb_mapped_in[6]  = mapped_in_temp[15];
                        wb_mapped_in[7]  = mapped_in_temp[0] ;
                        wb_mapped_in[8]  = mapped_in_temp[1] ;
                        wb_mapped_in[9]  = mapped_in_temp[2] ;
                        wb_mapped_in[10] = mapped_in_temp[3] ;
                        wb_mapped_in[11] = mapped_in_temp[4] ;
                        wb_mapped_in[12] = mapped_in_temp[5] ;
                        wb_mapped_in[13] = mapped_in_temp[6] ;
                        wb_mapped_in[14] = mapped_in_temp[7] ;
                        wb_mapped_in[15] = mapped_in_temp[8] ;
                    end		     
           4'd8   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[8] ;
                        wb_mapped_in[1]  = mapped_in_temp[9] ;
                        wb_mapped_in[2]  = mapped_in_temp[10];
                        wb_mapped_in[3]  = mapped_in_temp[11];
                        wb_mapped_in[4]  = mapped_in_temp[12];
                        wb_mapped_in[5]  = mapped_in_temp[13];
                        wb_mapped_in[6]  = mapped_in_temp[14];
                        wb_mapped_in[7]  = mapped_in_temp[15];
                        wb_mapped_in[8]  = mapped_in_temp[0] ;
                        wb_mapped_in[9]  = mapped_in_temp[1] ;
                        wb_mapped_in[10] = mapped_in_temp[2] ;
                        wb_mapped_in[11] = mapped_in_temp[3] ;
                        wb_mapped_in[12] = mapped_in_temp[4] ;
                        wb_mapped_in[13] = mapped_in_temp[5] ;
                        wb_mapped_in[14] = mapped_in_temp[6] ;
                        wb_mapped_in[15] = mapped_in_temp[7] ;
                    end		     
           4'd9   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[7] ;
                        wb_mapped_in[1]  = mapped_in_temp[8] ;
                        wb_mapped_in[2]  = mapped_in_temp[9] ;
                        wb_mapped_in[3]  = mapped_in_temp[10];
                        wb_mapped_in[4]  = mapped_in_temp[11];
                        wb_mapped_in[5]  = mapped_in_temp[12];
                        wb_mapped_in[6]  = mapped_in_temp[13];
                        wb_mapped_in[7]  = mapped_in_temp[14];
                        wb_mapped_in[8]  = mapped_in_temp[15];
                        wb_mapped_in[9]  = mapped_in_temp[0] ;
                        wb_mapped_in[10] = mapped_in_temp[1] ;
                        wb_mapped_in[11] = mapped_in_temp[2] ;
                        wb_mapped_in[12] = mapped_in_temp[3] ;
                        wb_mapped_in[13] = mapped_in_temp[4] ;
                        wb_mapped_in[14] = mapped_in_temp[5] ;
                        wb_mapped_in[15] = mapped_in_temp[6] ;
                    end		     
           4'd10  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[6] ;
                        wb_mapped_in[1]  = mapped_in_temp[7] ;
                        wb_mapped_in[2]  = mapped_in_temp[8] ;
                        wb_mapped_in[3]  = mapped_in_temp[9] ;
                        wb_mapped_in[4]  = mapped_in_temp[10];
                        wb_mapped_in[5]  = mapped_in_temp[11];
                        wb_mapped_in[6]  = mapped_in_temp[12];
                        wb_mapped_in[7]  = mapped_in_temp[13];
                        wb_mapped_in[8]  = mapped_in_temp[14];
                        wb_mapped_in[9]  = mapped_in_temp[15];
                        wb_mapped_in[10] = mapped_in_temp[0] ;
                        wb_mapped_in[11] = mapped_in_temp[1] ;
                        wb_mapped_in[12] = mapped_in_temp[2] ;
                        wb_mapped_in[13] = mapped_in_temp[3] ;
                        wb_mapped_in[14] = mapped_in_temp[4] ;
                        wb_mapped_in[15] = mapped_in_temp[5] ;
                    end		     
           4'd11  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[5] ;
                        wb_mapped_in[1]  = mapped_in_temp[6] ;
                        wb_mapped_in[2]  = mapped_in_temp[7] ;
                        wb_mapped_in[3]  = mapped_in_temp[8] ;
                        wb_mapped_in[4]  = mapped_in_temp[9] ;
                        wb_mapped_in[5]  = mapped_in_temp[10];
                        wb_mapped_in[6]  = mapped_in_temp[11];
                        wb_mapped_in[7]  = mapped_in_temp[12];
                        wb_mapped_in[8]  = mapped_in_temp[13];
                        wb_mapped_in[9]  = mapped_in_temp[14];
                        wb_mapped_in[10] = mapped_in_temp[15];
                        wb_mapped_in[11] = mapped_in_temp[0] ;
                        wb_mapped_in[12] = mapped_in_temp[1] ;
                        wb_mapped_in[13] = mapped_in_temp[2] ;
                        wb_mapped_in[14] = mapped_in_temp[3] ;
                        wb_mapped_in[15] = mapped_in_temp[4] ;
                    end		     
           4'd12  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[4] ;
                        wb_mapped_in[1]  = mapped_in_temp[5] ;
                        wb_mapped_in[2]  = mapped_in_temp[6] ;
                        wb_mapped_in[3]  = mapped_in_temp[7] ;
                        wb_mapped_in[4]  = mapped_in_temp[8] ;
                        wb_mapped_in[5]  = mapped_in_temp[9] ;
                        wb_mapped_in[6]  = mapped_in_temp[10];
                        wb_mapped_in[7]  = mapped_in_temp[11];
                        wb_mapped_in[8]  = mapped_in_temp[12];
                        wb_mapped_in[9]  = mapped_in_temp[13];
                        wb_mapped_in[10] = mapped_in_temp[14];
                        wb_mapped_in[11] = mapped_in_temp[15];
                        wb_mapped_in[12] = mapped_in_temp[0] ;
                        wb_mapped_in[13] = mapped_in_temp[1] ;
                        wb_mapped_in[14] = mapped_in_temp[2] ;
                        wb_mapped_in[15] = mapped_in_temp[3] ;
                    end		     
           4'd13  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[3] ;
                        wb_mapped_in[1]  = mapped_in_temp[4] ;
                        wb_mapped_in[2]  = mapped_in_temp[5] ;
                        wb_mapped_in[3]  = mapped_in_temp[6] ;
                        wb_mapped_in[4]  = mapped_in_temp[7] ;
                        wb_mapped_in[5]  = mapped_in_temp[8] ;
                        wb_mapped_in[6]  = mapped_in_temp[9] ;
                        wb_mapped_in[7]  = mapped_in_temp[10];
                        wb_mapped_in[8]  = mapped_in_temp[11];
                        wb_mapped_in[9]  = mapped_in_temp[12];
                        wb_mapped_in[10] = mapped_in_temp[13];
                        wb_mapped_in[11] = mapped_in_temp[14];
                        wb_mapped_in[12] = mapped_in_temp[15];
                        wb_mapped_in[13] = mapped_in_temp[0] ;
                        wb_mapped_in[14] = mapped_in_temp[1] ;
                        wb_mapped_in[15] = mapped_in_temp[2] ;
                    end		     
           4'd14  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[2] ;
                        wb_mapped_in[1]  = mapped_in_temp[3] ;
                        wb_mapped_in[2]  = mapped_in_temp[4] ;
                        wb_mapped_in[3]  = mapped_in_temp[5] ;
                        wb_mapped_in[4]  = mapped_in_temp[6] ;
                        wb_mapped_in[5]  = mapped_in_temp[7] ;
                        wb_mapped_in[6]  = mapped_in_temp[8] ;
                        wb_mapped_in[7]  = mapped_in_temp[9] ;
                        wb_mapped_in[8]  = mapped_in_temp[10];
                        wb_mapped_in[9]  = mapped_in_temp[11];
                        wb_mapped_in[10] = mapped_in_temp[12];
                        wb_mapped_in[11] = mapped_in_temp[13];
                        wb_mapped_in[12] = mapped_in_temp[14];
                        wb_mapped_in[13] = mapped_in_temp[15];
                        wb_mapped_in[14] = mapped_in_temp[0] ;
                        wb_mapped_in[15] = mapped_in_temp[1] ;
                    end		     
           4'd15  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[1] ;
                        wb_mapped_in[1]  = mapped_in_temp[2] ;
                        wb_mapped_in[2]  = mapped_in_temp[3] ;
                        wb_mapped_in[3]  = mapped_in_temp[4] ;
                        wb_mapped_in[4]  = mapped_in_temp[5] ;
                        wb_mapped_in[5]  = mapped_in_temp[6] ;
                        wb_mapped_in[6]  = mapped_in_temp[7] ;
                        wb_mapped_in[7]  = mapped_in_temp[8] ;
                        wb_mapped_in[8]  = mapped_in_temp[9] ;
                        wb_mapped_in[9]  = mapped_in_temp[10];
                        wb_mapped_in[10] = mapped_in_temp[11];
                        wb_mapped_in[11] = mapped_in_temp[12];
                        wb_mapped_in[12] = mapped_in_temp[13];
                        wb_mapped_in[13] = mapped_in_temp[14];
                        wb_mapped_in[14] = mapped_in_temp[15];
                        wb_mapped_in[15] = mapped_in_temp[0] ;
                    end		     
	 endcase // casex(anchor_buf[3:0])
       THIRTY_TWO_BUF:
         casex (anchor_buf[4:0]) // synopsys parallel_case full_case 
           5'd0   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[0] ;
                        wb_mapped_in[1]  = mapped_in_temp[1] ;
                        wb_mapped_in[2]  = mapped_in_temp[2] ;
                        wb_mapped_in[3]  = mapped_in_temp[3] ;
                        wb_mapped_in[4]  = mapped_in_temp[4] ;
                        wb_mapped_in[5]  = mapped_in_temp[5] ;
                        wb_mapped_in[6]  = mapped_in_temp[6] ;
                        wb_mapped_in[7]  = mapped_in_temp[7] ;
                        wb_mapped_in[8]  = mapped_in_temp[8] ;
                        wb_mapped_in[9]  = mapped_in_temp[9] ;
                        wb_mapped_in[10] = mapped_in_temp[10];
                        wb_mapped_in[11] = mapped_in_temp[11];
                        wb_mapped_in[12] = mapped_in_temp[12];
                        wb_mapped_in[13] = mapped_in_temp[13];
                        wb_mapped_in[14] = mapped_in_temp[14];
                        wb_mapped_in[15] = mapped_in_temp[15];
                        wb_mapped_in[16] = mapped_in_temp[16];
                        wb_mapped_in[17] = mapped_in_temp[17];
                        wb_mapped_in[18] = mapped_in_temp[18];
                        wb_mapped_in[19] = mapped_in_temp[19];
                        wb_mapped_in[20] = mapped_in_temp[20];
                        wb_mapped_in[21] = mapped_in_temp[21];
                        wb_mapped_in[22] = mapped_in_temp[22];
                        wb_mapped_in[23] = mapped_in_temp[23];
                        wb_mapped_in[24] = mapped_in_temp[24];
                        wb_mapped_in[25] = mapped_in_temp[25];
                        wb_mapped_in[26] = mapped_in_temp[26];
                        wb_mapped_in[27] = mapped_in_temp[27];
                        wb_mapped_in[28] = mapped_in_temp[28];
                        wb_mapped_in[29] = mapped_in_temp[29];
                        wb_mapped_in[30] = mapped_in_temp[30];
                        wb_mapped_in[31] = mapped_in_temp[31];
                    end
           5'd1   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[31];
                        wb_mapped_in[1]  = mapped_in_temp[0] ;
                        wb_mapped_in[2]  = mapped_in_temp[1] ;
                        wb_mapped_in[3]  = mapped_in_temp[2] ;
                        wb_mapped_in[4]  = mapped_in_temp[3] ;
                        wb_mapped_in[5]  = mapped_in_temp[4] ;
                        wb_mapped_in[6]  = mapped_in_temp[5] ;
                        wb_mapped_in[7]  = mapped_in_temp[6] ;
                        wb_mapped_in[8]  = mapped_in_temp[7] ;
                        wb_mapped_in[9]  = mapped_in_temp[8] ;
                        wb_mapped_in[10] = mapped_in_temp[9] ;
                        wb_mapped_in[11] = mapped_in_temp[10];
                        wb_mapped_in[12] = mapped_in_temp[11];
                        wb_mapped_in[13] = mapped_in_temp[12];
                        wb_mapped_in[14] = mapped_in_temp[13];
                        wb_mapped_in[15] = mapped_in_temp[14];
                        wb_mapped_in[16] = mapped_in_temp[15];
                        wb_mapped_in[17] = mapped_in_temp[16];
                        wb_mapped_in[18] = mapped_in_temp[17];
                        wb_mapped_in[19] = mapped_in_temp[18];
                        wb_mapped_in[20] = mapped_in_temp[19];
                        wb_mapped_in[21] = mapped_in_temp[20];
                        wb_mapped_in[22] = mapped_in_temp[21];
                        wb_mapped_in[23] = mapped_in_temp[22];
                        wb_mapped_in[24] = mapped_in_temp[23];
                        wb_mapped_in[25] = mapped_in_temp[24];
                        wb_mapped_in[26] = mapped_in_temp[25];
                        wb_mapped_in[27] = mapped_in_temp[26];
                        wb_mapped_in[28] = mapped_in_temp[27];
                        wb_mapped_in[29] = mapped_in_temp[28];
                        wb_mapped_in[30] = mapped_in_temp[29];
                        wb_mapped_in[31] = mapped_in_temp[30];
                    end		     
           5'd2   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[30];
                        wb_mapped_in[1]  = mapped_in_temp[31];
                        wb_mapped_in[2]  = mapped_in_temp[0] ;
                        wb_mapped_in[3]  = mapped_in_temp[1] ;
                        wb_mapped_in[4]  = mapped_in_temp[2] ;
                        wb_mapped_in[5]  = mapped_in_temp[3] ;
                        wb_mapped_in[6]  = mapped_in_temp[4] ;
                        wb_mapped_in[7]  = mapped_in_temp[5] ;
                        wb_mapped_in[8]  = mapped_in_temp[6] ;
                        wb_mapped_in[9]  = mapped_in_temp[7] ;
                        wb_mapped_in[10] = mapped_in_temp[8] ;
                        wb_mapped_in[11] = mapped_in_temp[9] ;
                        wb_mapped_in[12] = mapped_in_temp[10];
                        wb_mapped_in[13] = mapped_in_temp[11];
                        wb_mapped_in[14] = mapped_in_temp[12];
                        wb_mapped_in[15] = mapped_in_temp[13];
                        wb_mapped_in[16] = mapped_in_temp[14];
                        wb_mapped_in[17] = mapped_in_temp[15];
                        wb_mapped_in[18] = mapped_in_temp[16];
                        wb_mapped_in[19] = mapped_in_temp[17];
                        wb_mapped_in[20] = mapped_in_temp[18];
                        wb_mapped_in[21] = mapped_in_temp[19];
                        wb_mapped_in[22] = mapped_in_temp[20];
                        wb_mapped_in[23] = mapped_in_temp[21];
                        wb_mapped_in[24] = mapped_in_temp[22];
                        wb_mapped_in[25] = mapped_in_temp[23];
                        wb_mapped_in[26] = mapped_in_temp[24];
                        wb_mapped_in[27] = mapped_in_temp[25];
                        wb_mapped_in[28] = mapped_in_temp[26];
                        wb_mapped_in[29] = mapped_in_temp[27];
                        wb_mapped_in[30] = mapped_in_temp[28];
                        wb_mapped_in[31] = mapped_in_temp[29];
                    end		     
           5'd3   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[29];
                        wb_mapped_in[1]  = mapped_in_temp[30];
                        wb_mapped_in[2]  = mapped_in_temp[31];
                        wb_mapped_in[3]  = mapped_in_temp[0] ;
                        wb_mapped_in[4]  = mapped_in_temp[1] ;
                        wb_mapped_in[5]  = mapped_in_temp[2] ;
                        wb_mapped_in[6]  = mapped_in_temp[3] ;
                        wb_mapped_in[7]  = mapped_in_temp[4] ;
                        wb_mapped_in[8]  = mapped_in_temp[5] ;
                        wb_mapped_in[9]  = mapped_in_temp[6] ;
                        wb_mapped_in[10] = mapped_in_temp[7] ;
                        wb_mapped_in[11] = mapped_in_temp[8] ;
                        wb_mapped_in[12] = mapped_in_temp[9] ;
                        wb_mapped_in[13] = mapped_in_temp[10];
                        wb_mapped_in[14] = mapped_in_temp[11];
                        wb_mapped_in[15] = mapped_in_temp[12];
                        wb_mapped_in[16] = mapped_in_temp[13];
                        wb_mapped_in[17] = mapped_in_temp[14];
                        wb_mapped_in[18] = mapped_in_temp[15];
                        wb_mapped_in[19] = mapped_in_temp[16];
                        wb_mapped_in[20] = mapped_in_temp[17];
                        wb_mapped_in[21] = mapped_in_temp[18];
                        wb_mapped_in[22] = mapped_in_temp[19];
                        wb_mapped_in[23] = mapped_in_temp[20];
                        wb_mapped_in[24] = mapped_in_temp[21];
                        wb_mapped_in[25] = mapped_in_temp[22];
                        wb_mapped_in[26] = mapped_in_temp[23];
                        wb_mapped_in[27] = mapped_in_temp[24];
                        wb_mapped_in[28] = mapped_in_temp[25];
                        wb_mapped_in[29] = mapped_in_temp[26];
                        wb_mapped_in[30] = mapped_in_temp[27];
                        wb_mapped_in[31] = mapped_in_temp[28];
                    end		     
           5'd4   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[28];
                        wb_mapped_in[1]  = mapped_in_temp[29];
                        wb_mapped_in[2]  = mapped_in_temp[30];
                        wb_mapped_in[3]  = mapped_in_temp[31];
                        wb_mapped_in[4]  = mapped_in_temp[0] ;
                        wb_mapped_in[5]  = mapped_in_temp[1] ;
                        wb_mapped_in[6]  = mapped_in_temp[2] ;
                        wb_mapped_in[7]  = mapped_in_temp[3] ;
                        wb_mapped_in[8]  = mapped_in_temp[4] ;
                        wb_mapped_in[9]  = mapped_in_temp[5] ;
                        wb_mapped_in[10] = mapped_in_temp[6] ;
                        wb_mapped_in[11] = mapped_in_temp[7] ;
                        wb_mapped_in[12] = mapped_in_temp[8] ;
                        wb_mapped_in[13] = mapped_in_temp[9] ;
                        wb_mapped_in[14] = mapped_in_temp[10];
                        wb_mapped_in[15] = mapped_in_temp[11];
                        wb_mapped_in[16] = mapped_in_temp[12];
                        wb_mapped_in[17] = mapped_in_temp[13];
                        wb_mapped_in[18] = mapped_in_temp[14];
                        wb_mapped_in[19] = mapped_in_temp[15];
                        wb_mapped_in[20] = mapped_in_temp[16];
                        wb_mapped_in[21] = mapped_in_temp[17];
                        wb_mapped_in[22] = mapped_in_temp[18];
                        wb_mapped_in[23] = mapped_in_temp[19];
                        wb_mapped_in[24] = mapped_in_temp[20];
                        wb_mapped_in[25] = mapped_in_temp[21];
                        wb_mapped_in[26] = mapped_in_temp[22];
                        wb_mapped_in[27] = mapped_in_temp[23];
                        wb_mapped_in[28] = mapped_in_temp[24];
                        wb_mapped_in[29] = mapped_in_temp[25];
                        wb_mapped_in[30] = mapped_in_temp[26];
                        wb_mapped_in[31] = mapped_in_temp[27];
                    end		     
           5'd5   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[27];
                        wb_mapped_in[1]  = mapped_in_temp[28];
                        wb_mapped_in[2]  = mapped_in_temp[29];
                        wb_mapped_in[3]  = mapped_in_temp[30];
                        wb_mapped_in[4]  = mapped_in_temp[31];
                        wb_mapped_in[5]  = mapped_in_temp[0] ;
                        wb_mapped_in[6]  = mapped_in_temp[1] ;
                        wb_mapped_in[7]  = mapped_in_temp[2] ;
                        wb_mapped_in[8]  = mapped_in_temp[3] ;
                        wb_mapped_in[9]  = mapped_in_temp[4] ;
                        wb_mapped_in[10] = mapped_in_temp[5] ;
                        wb_mapped_in[11] = mapped_in_temp[6] ;
                        wb_mapped_in[12] = mapped_in_temp[7] ;
                        wb_mapped_in[13] = mapped_in_temp[8] ;
                        wb_mapped_in[14] = mapped_in_temp[9] ;
                        wb_mapped_in[15] = mapped_in_temp[10];
                        wb_mapped_in[16] = mapped_in_temp[11];
                        wb_mapped_in[17] = mapped_in_temp[12];
                        wb_mapped_in[18] = mapped_in_temp[13];
                        wb_mapped_in[19] = mapped_in_temp[14];
                        wb_mapped_in[20] = mapped_in_temp[15];
                        wb_mapped_in[21] = mapped_in_temp[16];
                        wb_mapped_in[22] = mapped_in_temp[17];
                        wb_mapped_in[23] = mapped_in_temp[18];
                        wb_mapped_in[24] = mapped_in_temp[19];
                        wb_mapped_in[25] = mapped_in_temp[20];
                        wb_mapped_in[26] = mapped_in_temp[21];
                        wb_mapped_in[27] = mapped_in_temp[22];
                        wb_mapped_in[28] = mapped_in_temp[23];
                        wb_mapped_in[29] = mapped_in_temp[24];
                        wb_mapped_in[30] = mapped_in_temp[25];
                        wb_mapped_in[31] = mapped_in_temp[26];
                    end		     
           5'd6   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[26];
                        wb_mapped_in[1]  = mapped_in_temp[27];
                        wb_mapped_in[2]  = mapped_in_temp[28];
                        wb_mapped_in[3]  = mapped_in_temp[29];
                        wb_mapped_in[4]  = mapped_in_temp[30];
                        wb_mapped_in[5]  = mapped_in_temp[31];
                        wb_mapped_in[6]  = mapped_in_temp[0] ;
                        wb_mapped_in[7]  = mapped_in_temp[1] ;
                        wb_mapped_in[8]  = mapped_in_temp[2] ;
                        wb_mapped_in[9]  = mapped_in_temp[3] ;
                        wb_mapped_in[10] = mapped_in_temp[4] ;
                        wb_mapped_in[11] = mapped_in_temp[5] ;
                        wb_mapped_in[12] = mapped_in_temp[6] ;
                        wb_mapped_in[13] = mapped_in_temp[7] ;
                        wb_mapped_in[14] = mapped_in_temp[8] ;
                        wb_mapped_in[15] = mapped_in_temp[9] ;
                        wb_mapped_in[16] = mapped_in_temp[10];
                        wb_mapped_in[17] = mapped_in_temp[11];
                        wb_mapped_in[18] = mapped_in_temp[12];
                        wb_mapped_in[19] = mapped_in_temp[13];
                        wb_mapped_in[20] = mapped_in_temp[14];
                        wb_mapped_in[21] = mapped_in_temp[15];
                        wb_mapped_in[22] = mapped_in_temp[16];
                        wb_mapped_in[23] = mapped_in_temp[17];
                        wb_mapped_in[24] = mapped_in_temp[18];
                        wb_mapped_in[25] = mapped_in_temp[19];
                        wb_mapped_in[26] = mapped_in_temp[20];
                        wb_mapped_in[27] = mapped_in_temp[21];
                        wb_mapped_in[28] = mapped_in_temp[22];
                        wb_mapped_in[29] = mapped_in_temp[23];
                        wb_mapped_in[30] = mapped_in_temp[24];
                        wb_mapped_in[31] = mapped_in_temp[25];
                    end		     
           5'd7   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[25];
                        wb_mapped_in[1]  = mapped_in_temp[26];
                        wb_mapped_in[2]  = mapped_in_temp[27];
                        wb_mapped_in[3]  = mapped_in_temp[28];
                        wb_mapped_in[4]  = mapped_in_temp[29];
                        wb_mapped_in[5]  = mapped_in_temp[30];
                        wb_mapped_in[6]  = mapped_in_temp[31];
                        wb_mapped_in[7]  = mapped_in_temp[0] ;
                        wb_mapped_in[8]  = mapped_in_temp[1] ;
                        wb_mapped_in[9]  = mapped_in_temp[2] ;
                        wb_mapped_in[10] = mapped_in_temp[3] ;
                        wb_mapped_in[11] = mapped_in_temp[4] ;
                        wb_mapped_in[12] = mapped_in_temp[5] ;
                        wb_mapped_in[13] = mapped_in_temp[6] ;
                        wb_mapped_in[14] = mapped_in_temp[7] ;
                        wb_mapped_in[15] = mapped_in_temp[8] ;
                        wb_mapped_in[16] = mapped_in_temp[9] ;
                        wb_mapped_in[17] = mapped_in_temp[10];
                        wb_mapped_in[18] = mapped_in_temp[11];
                        wb_mapped_in[19] = mapped_in_temp[12];
                        wb_mapped_in[20] = mapped_in_temp[13];
                        wb_mapped_in[21] = mapped_in_temp[14];
                        wb_mapped_in[22] = mapped_in_temp[15];
                        wb_mapped_in[23] = mapped_in_temp[16];
                        wb_mapped_in[24] = mapped_in_temp[17];
                        wb_mapped_in[25] = mapped_in_temp[18];
                        wb_mapped_in[26] = mapped_in_temp[19];
                        wb_mapped_in[27] = mapped_in_temp[20];
                        wb_mapped_in[28] = mapped_in_temp[21];
                        wb_mapped_in[29] = mapped_in_temp[22];
                        wb_mapped_in[30] = mapped_in_temp[23];
                        wb_mapped_in[31] = mapped_in_temp[24];
                    end		     
           5'd8   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[24];
                        wb_mapped_in[1]  = mapped_in_temp[25];
                        wb_mapped_in[2]  = mapped_in_temp[26];
                        wb_mapped_in[3]  = mapped_in_temp[27];
                        wb_mapped_in[4]  = mapped_in_temp[28];
                        wb_mapped_in[5]  = mapped_in_temp[29];
                        wb_mapped_in[6]  = mapped_in_temp[30];
                        wb_mapped_in[7]  = mapped_in_temp[31];
                        wb_mapped_in[8]  = mapped_in_temp[0] ;
                        wb_mapped_in[9]  = mapped_in_temp[1] ;
                        wb_mapped_in[10] = mapped_in_temp[2] ;
                        wb_mapped_in[11] = mapped_in_temp[3] ;
                        wb_mapped_in[12] = mapped_in_temp[4] ;
                        wb_mapped_in[13] = mapped_in_temp[5] ;
                        wb_mapped_in[14] = mapped_in_temp[6] ;
                        wb_mapped_in[15] = mapped_in_temp[7] ;
                        wb_mapped_in[16] = mapped_in_temp[8] ;
                        wb_mapped_in[17] = mapped_in_temp[9] ;
                        wb_mapped_in[18] = mapped_in_temp[10];
                        wb_mapped_in[19] = mapped_in_temp[11];
                        wb_mapped_in[20] = mapped_in_temp[12];
                        wb_mapped_in[21] = mapped_in_temp[13];
                        wb_mapped_in[22] = mapped_in_temp[14];
                        wb_mapped_in[23] = mapped_in_temp[15];
                        wb_mapped_in[24] = mapped_in_temp[16];
                        wb_mapped_in[25] = mapped_in_temp[17];
                        wb_mapped_in[26] = mapped_in_temp[18];
                        wb_mapped_in[27] = mapped_in_temp[19];
                        wb_mapped_in[28] = mapped_in_temp[20];
                        wb_mapped_in[29] = mapped_in_temp[21];
                        wb_mapped_in[30] = mapped_in_temp[22];
                        wb_mapped_in[31] = mapped_in_temp[23];
                    end		     
           5'd9   : begin       
                        wb_mapped_in[0]  = mapped_in_temp[23];
                        wb_mapped_in[1]  = mapped_in_temp[24];
                        wb_mapped_in[2]  = mapped_in_temp[25];
                        wb_mapped_in[3]  = mapped_in_temp[26];
                        wb_mapped_in[4]  = mapped_in_temp[27];
                        wb_mapped_in[5]  = mapped_in_temp[28];
                        wb_mapped_in[6]  = mapped_in_temp[29];
                        wb_mapped_in[7]  = mapped_in_temp[30];
                        wb_mapped_in[8]  = mapped_in_temp[31];
                        wb_mapped_in[9]  = mapped_in_temp[0] ;
                        wb_mapped_in[10] = mapped_in_temp[1] ;
                        wb_mapped_in[11] = mapped_in_temp[2] ;
                        wb_mapped_in[12] = mapped_in_temp[3] ;
                        wb_mapped_in[13] = mapped_in_temp[4] ;
                        wb_mapped_in[14] = mapped_in_temp[5] ;
                        wb_mapped_in[15] = mapped_in_temp[6] ;
                        wb_mapped_in[16] = mapped_in_temp[7] ;
                        wb_mapped_in[17] = mapped_in_temp[8] ;
                        wb_mapped_in[18] = mapped_in_temp[9] ;
                        wb_mapped_in[19] = mapped_in_temp[10];
                        wb_mapped_in[20] = mapped_in_temp[11];
                        wb_mapped_in[21] = mapped_in_temp[12];
                        wb_mapped_in[22] = mapped_in_temp[13];
                        wb_mapped_in[23] = mapped_in_temp[14];
                        wb_mapped_in[24] = mapped_in_temp[15];
                        wb_mapped_in[25] = mapped_in_temp[16];
                        wb_mapped_in[26] = mapped_in_temp[17];
                        wb_mapped_in[27] = mapped_in_temp[18];
                        wb_mapped_in[28] = mapped_in_temp[19];
                        wb_mapped_in[29] = mapped_in_temp[20];
                        wb_mapped_in[30] = mapped_in_temp[21];
                        wb_mapped_in[31] = mapped_in_temp[22];
                    end		     
           5'd10  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[22];
                        wb_mapped_in[1]  = mapped_in_temp[23];
                        wb_mapped_in[2]  = mapped_in_temp[24];
                        wb_mapped_in[3]  = mapped_in_temp[25];
                        wb_mapped_in[4]  = mapped_in_temp[26];
                        wb_mapped_in[5]  = mapped_in_temp[27];
                        wb_mapped_in[6]  = mapped_in_temp[28];
                        wb_mapped_in[7]  = mapped_in_temp[29];
                        wb_mapped_in[8]  = mapped_in_temp[30];
                        wb_mapped_in[9]  = mapped_in_temp[31];
                        wb_mapped_in[10] = mapped_in_temp[0] ;
                        wb_mapped_in[11] = mapped_in_temp[1] ;
                        wb_mapped_in[12] = mapped_in_temp[2] ;
                        wb_mapped_in[13] = mapped_in_temp[3] ;
                        wb_mapped_in[14] = mapped_in_temp[4] ;
                        wb_mapped_in[15] = mapped_in_temp[5] ;
                        wb_mapped_in[16] = mapped_in_temp[6] ;
                        wb_mapped_in[17] = mapped_in_temp[7] ;
                        wb_mapped_in[18] = mapped_in_temp[8] ;
                        wb_mapped_in[19] = mapped_in_temp[9] ;
                        wb_mapped_in[20] = mapped_in_temp[10];
                        wb_mapped_in[21] = mapped_in_temp[11];
                        wb_mapped_in[22] = mapped_in_temp[12];
                        wb_mapped_in[23] = mapped_in_temp[13];
                        wb_mapped_in[24] = mapped_in_temp[14];
                        wb_mapped_in[25] = mapped_in_temp[15];
                        wb_mapped_in[26] = mapped_in_temp[16];
                        wb_mapped_in[27] = mapped_in_temp[17];
                        wb_mapped_in[28] = mapped_in_temp[18];
                        wb_mapped_in[29] = mapped_in_temp[19];
                        wb_mapped_in[30] = mapped_in_temp[20];
                        wb_mapped_in[31] = mapped_in_temp[21];
                    end		     
           5'd11  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[21];
                        wb_mapped_in[1]  = mapped_in_temp[22];
                        wb_mapped_in[2]  = mapped_in_temp[23];
                        wb_mapped_in[3]  = mapped_in_temp[24];
                        wb_mapped_in[4]  = mapped_in_temp[25];
                        wb_mapped_in[5]  = mapped_in_temp[26];
                        wb_mapped_in[6]  = mapped_in_temp[27];
                        wb_mapped_in[7]  = mapped_in_temp[28];
                        wb_mapped_in[8]  = mapped_in_temp[29];
                        wb_mapped_in[9]  = mapped_in_temp[30];
                        wb_mapped_in[10] = mapped_in_temp[31];
                        wb_mapped_in[11] = mapped_in_temp[0] ;
                        wb_mapped_in[12] = mapped_in_temp[1] ;
                        wb_mapped_in[13] = mapped_in_temp[2] ;
                        wb_mapped_in[14] = mapped_in_temp[3] ;
                        wb_mapped_in[15] = mapped_in_temp[4] ;
                        wb_mapped_in[16] = mapped_in_temp[5] ;
                        wb_mapped_in[17] = mapped_in_temp[6] ;
                        wb_mapped_in[18] = mapped_in_temp[7] ;
                        wb_mapped_in[19] = mapped_in_temp[8] ;
                        wb_mapped_in[20] = mapped_in_temp[9] ;
                        wb_mapped_in[21] = mapped_in_temp[10];
                        wb_mapped_in[22] = mapped_in_temp[11];
                        wb_mapped_in[23] = mapped_in_temp[12];
                        wb_mapped_in[24] = mapped_in_temp[13];
                        wb_mapped_in[25] = mapped_in_temp[14];
                        wb_mapped_in[26] = mapped_in_temp[15];
                        wb_mapped_in[27] = mapped_in_temp[16];
                        wb_mapped_in[28] = mapped_in_temp[17];
                        wb_mapped_in[29] = mapped_in_temp[18];
                        wb_mapped_in[30] = mapped_in_temp[19];
                        wb_mapped_in[31] = mapped_in_temp[20];
                    end		     
           5'd12  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[20];
                        wb_mapped_in[1]  = mapped_in_temp[21];
                        wb_mapped_in[2]  = mapped_in_temp[22];
                        wb_mapped_in[3]  = mapped_in_temp[23];
                        wb_mapped_in[4]  = mapped_in_temp[24];
                        wb_mapped_in[5]  = mapped_in_temp[25];
                        wb_mapped_in[6]  = mapped_in_temp[26];
                        wb_mapped_in[7]  = mapped_in_temp[27];
                        wb_mapped_in[8]  = mapped_in_temp[28];
                        wb_mapped_in[9]  = mapped_in_temp[29];
                        wb_mapped_in[10] = mapped_in_temp[30];
                        wb_mapped_in[11] = mapped_in_temp[31];
                        wb_mapped_in[12] = mapped_in_temp[0] ;
                        wb_mapped_in[13] = mapped_in_temp[1] ;
                        wb_mapped_in[14] = mapped_in_temp[2] ;
                        wb_mapped_in[15] = mapped_in_temp[3] ;
                        wb_mapped_in[16] = mapped_in_temp[4] ;
                        wb_mapped_in[17] = mapped_in_temp[5] ;
                        wb_mapped_in[18] = mapped_in_temp[6] ;
                        wb_mapped_in[19] = mapped_in_temp[7] ;
                        wb_mapped_in[20] = mapped_in_temp[8] ;
                        wb_mapped_in[21] = mapped_in_temp[9] ;
                        wb_mapped_in[22] = mapped_in_temp[10];
                        wb_mapped_in[23] = mapped_in_temp[11];
                        wb_mapped_in[24] = mapped_in_temp[12];
                        wb_mapped_in[25] = mapped_in_temp[13];
                        wb_mapped_in[26] = mapped_in_temp[14];
                        wb_mapped_in[27] = mapped_in_temp[15];
                        wb_mapped_in[28] = mapped_in_temp[16];
                        wb_mapped_in[29] = mapped_in_temp[17];
                        wb_mapped_in[30] = mapped_in_temp[18];
                        wb_mapped_in[31] = mapped_in_temp[19];
                    end		     
           5'd13  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[19];
                        wb_mapped_in[1]  = mapped_in_temp[20];
                        wb_mapped_in[2]  = mapped_in_temp[21];
                        wb_mapped_in[3]  = mapped_in_temp[22];
                        wb_mapped_in[4]  = mapped_in_temp[23];
                        wb_mapped_in[5]  = mapped_in_temp[24];
                        wb_mapped_in[6]  = mapped_in_temp[25];
                        wb_mapped_in[7]  = mapped_in_temp[26];
                        wb_mapped_in[8]  = mapped_in_temp[27];
                        wb_mapped_in[9]  = mapped_in_temp[28];
                        wb_mapped_in[10] = mapped_in_temp[29];
                        wb_mapped_in[11] = mapped_in_temp[30];
                        wb_mapped_in[12] = mapped_in_temp[31];
                        wb_mapped_in[13] = mapped_in_temp[0] ;
                        wb_mapped_in[14] = mapped_in_temp[1] ;
                        wb_mapped_in[15] = mapped_in_temp[2] ;
                        wb_mapped_in[16] = mapped_in_temp[3] ;
                        wb_mapped_in[17] = mapped_in_temp[4] ;
                        wb_mapped_in[18] = mapped_in_temp[5] ;
                        wb_mapped_in[19] = mapped_in_temp[6] ;
                        wb_mapped_in[20] = mapped_in_temp[7] ;
                        wb_mapped_in[21] = mapped_in_temp[8] ;
                        wb_mapped_in[22] = mapped_in_temp[9] ;
                        wb_mapped_in[23] = mapped_in_temp[10];
                        wb_mapped_in[24] = mapped_in_temp[11];
                        wb_mapped_in[25] = mapped_in_temp[12];
                        wb_mapped_in[26] = mapped_in_temp[13];
                        wb_mapped_in[27] = mapped_in_temp[14];
                        wb_mapped_in[28] = mapped_in_temp[15];
                        wb_mapped_in[29] = mapped_in_temp[16];
                        wb_mapped_in[30] = mapped_in_temp[17];
                        wb_mapped_in[31] = mapped_in_temp[18];
                    end		     
           5'd14  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[18];
                        wb_mapped_in[1]  = mapped_in_temp[19];
                        wb_mapped_in[2]  = mapped_in_temp[20];
                        wb_mapped_in[3]  = mapped_in_temp[21];
                        wb_mapped_in[4]  = mapped_in_temp[22];
                        wb_mapped_in[5]  = mapped_in_temp[23];
                        wb_mapped_in[6]  = mapped_in_temp[24];
                        wb_mapped_in[7]  = mapped_in_temp[25];
                        wb_mapped_in[8]  = mapped_in_temp[26];
                        wb_mapped_in[9]  = mapped_in_temp[27];
                        wb_mapped_in[10] = mapped_in_temp[28];
                        wb_mapped_in[11] = mapped_in_temp[29];
                        wb_mapped_in[12] = mapped_in_temp[30];
                        wb_mapped_in[13] = mapped_in_temp[31];
                        wb_mapped_in[14] = mapped_in_temp[0] ;
                        wb_mapped_in[15] = mapped_in_temp[1] ;
                        wb_mapped_in[16] = mapped_in_temp[2] ;
                        wb_mapped_in[17] = mapped_in_temp[3] ;
                        wb_mapped_in[18] = mapped_in_temp[4] ;
                        wb_mapped_in[19] = mapped_in_temp[5] ;
                        wb_mapped_in[20] = mapped_in_temp[6] ;
                        wb_mapped_in[21] = mapped_in_temp[7] ;
                        wb_mapped_in[22] = mapped_in_temp[8] ;
                        wb_mapped_in[23] = mapped_in_temp[9] ;
                        wb_mapped_in[24] = mapped_in_temp[10];
                        wb_mapped_in[25] = mapped_in_temp[11];
                        wb_mapped_in[26] = mapped_in_temp[12];
                        wb_mapped_in[27] = mapped_in_temp[13];
                        wb_mapped_in[28] = mapped_in_temp[14];
                        wb_mapped_in[29] = mapped_in_temp[15];
                        wb_mapped_in[30] = mapped_in_temp[16];
                        wb_mapped_in[31] = mapped_in_temp[17];
                    end		     
           5'd15  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[17];
                        wb_mapped_in[1]  = mapped_in_temp[18];
                        wb_mapped_in[2]  = mapped_in_temp[19];
                        wb_mapped_in[3]  = mapped_in_temp[20];
                        wb_mapped_in[4]  = mapped_in_temp[21];
                        wb_mapped_in[5]  = mapped_in_temp[22];
                        wb_mapped_in[6]  = mapped_in_temp[23];
                        wb_mapped_in[7]  = mapped_in_temp[24];
                        wb_mapped_in[8]  = mapped_in_temp[25];
                        wb_mapped_in[9]  = mapped_in_temp[26];
                        wb_mapped_in[10] = mapped_in_temp[27];
                        wb_mapped_in[11] = mapped_in_temp[28];
                        wb_mapped_in[12] = mapped_in_temp[29];
                        wb_mapped_in[13] = mapped_in_temp[30];
                        wb_mapped_in[14] = mapped_in_temp[31];
                        wb_mapped_in[15] = mapped_in_temp[0] ;
                        wb_mapped_in[16] = mapped_in_temp[1] ;
                        wb_mapped_in[17] = mapped_in_temp[2] ;
                        wb_mapped_in[18] = mapped_in_temp[3] ;
                        wb_mapped_in[19] = mapped_in_temp[4] ;
                        wb_mapped_in[20] = mapped_in_temp[5] ;
                        wb_mapped_in[21] = mapped_in_temp[6] ;
                        wb_mapped_in[22] = mapped_in_temp[7] ;
                        wb_mapped_in[23] = mapped_in_temp[8] ;
                        wb_mapped_in[24] = mapped_in_temp[9] ;
                        wb_mapped_in[25] = mapped_in_temp[10];
                        wb_mapped_in[26] = mapped_in_temp[11];
                        wb_mapped_in[27] = mapped_in_temp[12];
                        wb_mapped_in[28] = mapped_in_temp[13];
                        wb_mapped_in[29] = mapped_in_temp[14];
                        wb_mapped_in[30] = mapped_in_temp[15];
                        wb_mapped_in[31] = mapped_in_temp[16];
                    end		     
           5'd16  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[16];
                        wb_mapped_in[1]  = mapped_in_temp[17];
                        wb_mapped_in[2]  = mapped_in_temp[18];
                        wb_mapped_in[3]  = mapped_in_temp[19];
                        wb_mapped_in[4]  = mapped_in_temp[20];
                        wb_mapped_in[5]  = mapped_in_temp[21];
                        wb_mapped_in[6]  = mapped_in_temp[22];
                        wb_mapped_in[7]  = mapped_in_temp[23];
                        wb_mapped_in[8]  = mapped_in_temp[24];
                        wb_mapped_in[9]  = mapped_in_temp[25];
                        wb_mapped_in[10] = mapped_in_temp[26];
                        wb_mapped_in[11] = mapped_in_temp[27];
                        wb_mapped_in[12] = mapped_in_temp[28];
                        wb_mapped_in[13] = mapped_in_temp[29];
                        wb_mapped_in[14] = mapped_in_temp[30];
                        wb_mapped_in[15] = mapped_in_temp[31];
                        wb_mapped_in[16] = mapped_in_temp[0] ;
                        wb_mapped_in[17] = mapped_in_temp[1] ;
                        wb_mapped_in[18] = mapped_in_temp[2] ;
                        wb_mapped_in[19] = mapped_in_temp[3] ;
                        wb_mapped_in[20] = mapped_in_temp[4] ;
                        wb_mapped_in[21] = mapped_in_temp[5] ;
                        wb_mapped_in[22] = mapped_in_temp[6] ;
                        wb_mapped_in[23] = mapped_in_temp[7] ;
                        wb_mapped_in[24] = mapped_in_temp[8] ;
                        wb_mapped_in[25] = mapped_in_temp[9] ;
                        wb_mapped_in[26] = mapped_in_temp[10];
                        wb_mapped_in[27] = mapped_in_temp[11];
                        wb_mapped_in[28] = mapped_in_temp[12];
                        wb_mapped_in[29] = mapped_in_temp[13];
                        wb_mapped_in[30] = mapped_in_temp[14];
                        wb_mapped_in[31] = mapped_in_temp[15];
                    end		     
           5'd17  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[15];
                        wb_mapped_in[1]  = mapped_in_temp[16];
                        wb_mapped_in[2]  = mapped_in_temp[17];
                        wb_mapped_in[3]  = mapped_in_temp[18];
                        wb_mapped_in[4]  = mapped_in_temp[19];
                        wb_mapped_in[5]  = mapped_in_temp[20];
                        wb_mapped_in[6]  = mapped_in_temp[21];
                        wb_mapped_in[7]  = mapped_in_temp[22];
                        wb_mapped_in[8]  = mapped_in_temp[23];
                        wb_mapped_in[9]  = mapped_in_temp[24];
                        wb_mapped_in[10] = mapped_in_temp[25];
                        wb_mapped_in[11] = mapped_in_temp[26];
                        wb_mapped_in[12] = mapped_in_temp[27];
                        wb_mapped_in[13] = mapped_in_temp[28];
                        wb_mapped_in[14] = mapped_in_temp[29];
                        wb_mapped_in[15] = mapped_in_temp[30];
                        wb_mapped_in[16] = mapped_in_temp[31];
                        wb_mapped_in[17] = mapped_in_temp[0] ;
                        wb_mapped_in[18] = mapped_in_temp[1] ;
                        wb_mapped_in[19] = mapped_in_temp[2] ;
                        wb_mapped_in[20] = mapped_in_temp[3] ;
                        wb_mapped_in[21] = mapped_in_temp[4] ;
                        wb_mapped_in[22] = mapped_in_temp[5] ;
                        wb_mapped_in[23] = mapped_in_temp[6] ;
                        wb_mapped_in[24] = mapped_in_temp[7] ;
                        wb_mapped_in[25] = mapped_in_temp[8] ;
                        wb_mapped_in[26] = mapped_in_temp[9] ;
                        wb_mapped_in[27] = mapped_in_temp[10];
                        wb_mapped_in[28] = mapped_in_temp[11];
                        wb_mapped_in[29] = mapped_in_temp[12];
                        wb_mapped_in[30] = mapped_in_temp[13];
                        wb_mapped_in[31] = mapped_in_temp[14];
                    end		     
           5'd18  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[14];
                        wb_mapped_in[1]  = mapped_in_temp[15];
                        wb_mapped_in[2]  = mapped_in_temp[16];
                        wb_mapped_in[3]  = mapped_in_temp[17];
                        wb_mapped_in[4]  = mapped_in_temp[18];
                        wb_mapped_in[5]  = mapped_in_temp[19];
                        wb_mapped_in[6]  = mapped_in_temp[20];
                        wb_mapped_in[7]  = mapped_in_temp[21];
                        wb_mapped_in[8]  = mapped_in_temp[22];
                        wb_mapped_in[9]  = mapped_in_temp[23];
                        wb_mapped_in[10] = mapped_in_temp[24];
                        wb_mapped_in[11] = mapped_in_temp[25];
                        wb_mapped_in[12] = mapped_in_temp[26];
                        wb_mapped_in[13] = mapped_in_temp[27];
                        wb_mapped_in[14] = mapped_in_temp[28];
                        wb_mapped_in[15] = mapped_in_temp[29];
                        wb_mapped_in[16] = mapped_in_temp[30];
                        wb_mapped_in[17] = mapped_in_temp[31];
                        wb_mapped_in[18] = mapped_in_temp[0] ;
                        wb_mapped_in[19] = mapped_in_temp[1] ;
                        wb_mapped_in[20] = mapped_in_temp[2] ;
                        wb_mapped_in[21] = mapped_in_temp[3] ;
                        wb_mapped_in[22] = mapped_in_temp[4] ;
                        wb_mapped_in[23] = mapped_in_temp[5] ;
                        wb_mapped_in[24] = mapped_in_temp[6] ;
                        wb_mapped_in[25] = mapped_in_temp[7] ;
                        wb_mapped_in[26] = mapped_in_temp[8] ;
                        wb_mapped_in[27] = mapped_in_temp[9] ;
                        wb_mapped_in[28] = mapped_in_temp[10];
                        wb_mapped_in[29] = mapped_in_temp[11];
                        wb_mapped_in[30] = mapped_in_temp[12];
                        wb_mapped_in[31] = mapped_in_temp[13];
                    end		     
           5'd19  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[13];
                        wb_mapped_in[1]  = mapped_in_temp[14];
                        wb_mapped_in[2]  = mapped_in_temp[15];
                        wb_mapped_in[3]  = mapped_in_temp[16];
                        wb_mapped_in[4]  = mapped_in_temp[17];
                        wb_mapped_in[5]  = mapped_in_temp[18];
                        wb_mapped_in[6]  = mapped_in_temp[19];
                        wb_mapped_in[7]  = mapped_in_temp[20];
                        wb_mapped_in[8]  = mapped_in_temp[21];
                        wb_mapped_in[9]  = mapped_in_temp[22];
                        wb_mapped_in[10] = mapped_in_temp[23];
                        wb_mapped_in[11] = mapped_in_temp[24];
                        wb_mapped_in[12] = mapped_in_temp[25];
                        wb_mapped_in[13] = mapped_in_temp[26];
                        wb_mapped_in[14] = mapped_in_temp[27];
                        wb_mapped_in[15] = mapped_in_temp[28];
                        wb_mapped_in[16] = mapped_in_temp[29];
                        wb_mapped_in[17] = mapped_in_temp[30];
                        wb_mapped_in[18] = mapped_in_temp[31];
                        wb_mapped_in[19] = mapped_in_temp[0] ;
                        wb_mapped_in[20] = mapped_in_temp[1] ;
                        wb_mapped_in[21] = mapped_in_temp[2] ;
                        wb_mapped_in[22] = mapped_in_temp[3] ;
                        wb_mapped_in[23] = mapped_in_temp[4] ;
                        wb_mapped_in[24] = mapped_in_temp[5] ;
                        wb_mapped_in[25] = mapped_in_temp[6] ;
                        wb_mapped_in[26] = mapped_in_temp[7] ;
                        wb_mapped_in[27] = mapped_in_temp[8] ;
                        wb_mapped_in[28] = mapped_in_temp[9] ;
                        wb_mapped_in[29] = mapped_in_temp[10];
                        wb_mapped_in[30] = mapped_in_temp[11];
                        wb_mapped_in[31] = mapped_in_temp[12];
                    end		     
           5'd20  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[12];
                        wb_mapped_in[1]  = mapped_in_temp[13];
                        wb_mapped_in[2]  = mapped_in_temp[14];
                        wb_mapped_in[3]  = mapped_in_temp[15];
                        wb_mapped_in[4]  = mapped_in_temp[16];
                        wb_mapped_in[5]  = mapped_in_temp[17];
                        wb_mapped_in[6]  = mapped_in_temp[18];
                        wb_mapped_in[7]  = mapped_in_temp[19];
                        wb_mapped_in[8]  = mapped_in_temp[20];
                        wb_mapped_in[9]  = mapped_in_temp[21];
                        wb_mapped_in[10] = mapped_in_temp[22];
                        wb_mapped_in[11] = mapped_in_temp[23];
                        wb_mapped_in[12] = mapped_in_temp[24];
                        wb_mapped_in[13] = mapped_in_temp[25];
                        wb_mapped_in[14] = mapped_in_temp[26];
                        wb_mapped_in[15] = mapped_in_temp[27];
                        wb_mapped_in[16] = mapped_in_temp[28];
                        wb_mapped_in[17] = mapped_in_temp[29];
                        wb_mapped_in[18] = mapped_in_temp[30];
                        wb_mapped_in[19] = mapped_in_temp[31];
                        wb_mapped_in[20] = mapped_in_temp[0] ;
                        wb_mapped_in[21] = mapped_in_temp[1] ;
                        wb_mapped_in[22] = mapped_in_temp[2] ;
                        wb_mapped_in[23] = mapped_in_temp[3] ;
                        wb_mapped_in[24] = mapped_in_temp[4] ;
                        wb_mapped_in[25] = mapped_in_temp[5] ;
                        wb_mapped_in[26] = mapped_in_temp[6] ;
                        wb_mapped_in[27] = mapped_in_temp[7] ;
                        wb_mapped_in[28] = mapped_in_temp[8] ;
                        wb_mapped_in[29] = mapped_in_temp[9] ;
                        wb_mapped_in[30] = mapped_in_temp[10];
                        wb_mapped_in[31] = mapped_in_temp[11];
                    end		     
           5'd21  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[11];
                        wb_mapped_in[1]  = mapped_in_temp[12];
                        wb_mapped_in[2]  = mapped_in_temp[13];
                        wb_mapped_in[3]  = mapped_in_temp[14];
                        wb_mapped_in[4]  = mapped_in_temp[15];
                        wb_mapped_in[5]  = mapped_in_temp[16];
                        wb_mapped_in[6]  = mapped_in_temp[17];
                        wb_mapped_in[7]  = mapped_in_temp[18];
                        wb_mapped_in[8]  = mapped_in_temp[19];
                        wb_mapped_in[9]  = mapped_in_temp[20];
                        wb_mapped_in[10] = mapped_in_temp[21];
                        wb_mapped_in[11] = mapped_in_temp[22];
                        wb_mapped_in[12] = mapped_in_temp[23];
                        wb_mapped_in[13] = mapped_in_temp[24];
                        wb_mapped_in[14] = mapped_in_temp[25];
                        wb_mapped_in[15] = mapped_in_temp[26];
                        wb_mapped_in[16] = mapped_in_temp[27];
                        wb_mapped_in[17] = mapped_in_temp[28];
                        wb_mapped_in[18] = mapped_in_temp[29];
                        wb_mapped_in[19] = mapped_in_temp[30];
                        wb_mapped_in[20] = mapped_in_temp[31];
                        wb_mapped_in[21] = mapped_in_temp[0] ;
                        wb_mapped_in[22] = mapped_in_temp[1] ;
                        wb_mapped_in[23] = mapped_in_temp[2] ;
                        wb_mapped_in[24] = mapped_in_temp[3] ;
                        wb_mapped_in[25] = mapped_in_temp[4] ;
                        wb_mapped_in[26] = mapped_in_temp[5] ;
                        wb_mapped_in[27] = mapped_in_temp[6] ;
                        wb_mapped_in[28] = mapped_in_temp[7] ;
                        wb_mapped_in[29] = mapped_in_temp[8] ;
                        wb_mapped_in[30] = mapped_in_temp[9] ;
                        wb_mapped_in[31] = mapped_in_temp[10];
                    end		     
           5'd22  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[10];
                        wb_mapped_in[1]  = mapped_in_temp[11];
                        wb_mapped_in[2]  = mapped_in_temp[12];
                        wb_mapped_in[3]  = mapped_in_temp[13];
                        wb_mapped_in[4]  = mapped_in_temp[14];
                        wb_mapped_in[5]  = mapped_in_temp[15];
                        wb_mapped_in[6]  = mapped_in_temp[16];
                        wb_mapped_in[7]  = mapped_in_temp[17];
                        wb_mapped_in[8]  = mapped_in_temp[18];
                        wb_mapped_in[9]  = mapped_in_temp[19];
                        wb_mapped_in[10] = mapped_in_temp[20];
                        wb_mapped_in[11] = mapped_in_temp[21];
                        wb_mapped_in[12] = mapped_in_temp[22];
                        wb_mapped_in[13] = mapped_in_temp[23];
                        wb_mapped_in[14] = mapped_in_temp[24];
                        wb_mapped_in[15] = mapped_in_temp[25];
                        wb_mapped_in[16] = mapped_in_temp[26];
                        wb_mapped_in[17] = mapped_in_temp[27];
                        wb_mapped_in[18] = mapped_in_temp[28];
                        wb_mapped_in[19] = mapped_in_temp[29];
                        wb_mapped_in[20] = mapped_in_temp[30];
                        wb_mapped_in[21] = mapped_in_temp[31];
                        wb_mapped_in[22] = mapped_in_temp[0] ;
                        wb_mapped_in[23] = mapped_in_temp[1] ;
                        wb_mapped_in[24] = mapped_in_temp[2] ;
                        wb_mapped_in[25] = mapped_in_temp[3] ;
                        wb_mapped_in[26] = mapped_in_temp[4] ;
                        wb_mapped_in[27] = mapped_in_temp[5] ;
                        wb_mapped_in[28] = mapped_in_temp[6] ;
                        wb_mapped_in[29] = mapped_in_temp[7] ;
                        wb_mapped_in[30] = mapped_in_temp[8] ;
                        wb_mapped_in[31] = mapped_in_temp[9] ;
                    end		     
           5'd23  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[9] ;
                        wb_mapped_in[1]  = mapped_in_temp[10];
                        wb_mapped_in[2]  = mapped_in_temp[11];
                        wb_mapped_in[3]  = mapped_in_temp[12];
                        wb_mapped_in[4]  = mapped_in_temp[13];
                        wb_mapped_in[5]  = mapped_in_temp[14];
                        wb_mapped_in[6]  = mapped_in_temp[15];
                        wb_mapped_in[7]  = mapped_in_temp[16];
                        wb_mapped_in[8]  = mapped_in_temp[17];
                        wb_mapped_in[9]  = mapped_in_temp[18];
                        wb_mapped_in[10] = mapped_in_temp[19];
                        wb_mapped_in[11] = mapped_in_temp[20];
                        wb_mapped_in[12] = mapped_in_temp[21];
                        wb_mapped_in[13] = mapped_in_temp[22];
                        wb_mapped_in[14] = mapped_in_temp[23];
                        wb_mapped_in[15] = mapped_in_temp[24];
                        wb_mapped_in[16] = mapped_in_temp[25];
                        wb_mapped_in[17] = mapped_in_temp[26];
                        wb_mapped_in[18] = mapped_in_temp[27];
                        wb_mapped_in[19] = mapped_in_temp[28];
                        wb_mapped_in[20] = mapped_in_temp[29];
                        wb_mapped_in[21] = mapped_in_temp[30];
                        wb_mapped_in[22] = mapped_in_temp[31];
                        wb_mapped_in[23] = mapped_in_temp[0] ;
                        wb_mapped_in[24] = mapped_in_temp[1] ;
                        wb_mapped_in[25] = mapped_in_temp[2] ;
                        wb_mapped_in[26] = mapped_in_temp[3] ;
                        wb_mapped_in[27] = mapped_in_temp[4] ;
                        wb_mapped_in[28] = mapped_in_temp[5] ;
                        wb_mapped_in[29] = mapped_in_temp[6] ;
                        wb_mapped_in[30] = mapped_in_temp[7] ;
                        wb_mapped_in[31] = mapped_in_temp[8] ;
                    end		     
           5'd24  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[8] ;
                        wb_mapped_in[1]  = mapped_in_temp[9] ;
                        wb_mapped_in[2]  = mapped_in_temp[10];
                        wb_mapped_in[3]  = mapped_in_temp[11];
                        wb_mapped_in[4]  = mapped_in_temp[12];
                        wb_mapped_in[5]  = mapped_in_temp[13];
                        wb_mapped_in[6]  = mapped_in_temp[14];
                        wb_mapped_in[7]  = mapped_in_temp[15];
                        wb_mapped_in[8]  = mapped_in_temp[16];
                        wb_mapped_in[9]  = mapped_in_temp[17];
                        wb_mapped_in[10] = mapped_in_temp[18];
                        wb_mapped_in[11] = mapped_in_temp[19];
                        wb_mapped_in[12] = mapped_in_temp[20];
                        wb_mapped_in[13] = mapped_in_temp[21];
                        wb_mapped_in[14] = mapped_in_temp[22];
                        wb_mapped_in[15] = mapped_in_temp[23];
                        wb_mapped_in[16] = mapped_in_temp[24];
                        wb_mapped_in[17] = mapped_in_temp[25];
                        wb_mapped_in[18] = mapped_in_temp[26];
                        wb_mapped_in[19] = mapped_in_temp[27];
                        wb_mapped_in[20] = mapped_in_temp[28];
                        wb_mapped_in[21] = mapped_in_temp[29];
                        wb_mapped_in[22] = mapped_in_temp[30];
                        wb_mapped_in[23] = mapped_in_temp[31];
                        wb_mapped_in[24] = mapped_in_temp[0] ;
                        wb_mapped_in[25] = mapped_in_temp[1] ;
                        wb_mapped_in[26] = mapped_in_temp[2] ;
                        wb_mapped_in[27] = mapped_in_temp[3] ;
                        wb_mapped_in[28] = mapped_in_temp[4] ;
                        wb_mapped_in[29] = mapped_in_temp[5] ;
                        wb_mapped_in[30] = mapped_in_temp[6] ;
                        wb_mapped_in[31] = mapped_in_temp[7] ;
                    end		     
           5'd25  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[7] ;
                        wb_mapped_in[1]  = mapped_in_temp[8] ;
                        wb_mapped_in[2]  = mapped_in_temp[9] ;
                        wb_mapped_in[3]  = mapped_in_temp[10];
                        wb_mapped_in[4]  = mapped_in_temp[11];
                        wb_mapped_in[5]  = mapped_in_temp[12];
                        wb_mapped_in[6]  = mapped_in_temp[13];
                        wb_mapped_in[7]  = mapped_in_temp[14];
                        wb_mapped_in[8]  = mapped_in_temp[15];
                        wb_mapped_in[9]  = mapped_in_temp[16];
                        wb_mapped_in[10] = mapped_in_temp[17];
                        wb_mapped_in[11] = mapped_in_temp[18];
                        wb_mapped_in[12] = mapped_in_temp[19];
                        wb_mapped_in[13] = mapped_in_temp[20];
                        wb_mapped_in[14] = mapped_in_temp[21];
                        wb_mapped_in[15] = mapped_in_temp[22];
                        wb_mapped_in[16] = mapped_in_temp[23];
                        wb_mapped_in[17] = mapped_in_temp[24];
                        wb_mapped_in[18] = mapped_in_temp[25];
                        wb_mapped_in[19] = mapped_in_temp[26];
                        wb_mapped_in[20] = mapped_in_temp[27];
                        wb_mapped_in[21] = mapped_in_temp[28];
                        wb_mapped_in[22] = mapped_in_temp[29];
                        wb_mapped_in[23] = mapped_in_temp[30];
                        wb_mapped_in[24] = mapped_in_temp[31];
                        wb_mapped_in[25] = mapped_in_temp[0] ;
                        wb_mapped_in[26] = mapped_in_temp[1] ;
                        wb_mapped_in[27] = mapped_in_temp[2] ;
                        wb_mapped_in[28] = mapped_in_temp[3] ;
                        wb_mapped_in[29] = mapped_in_temp[4] ;
                        wb_mapped_in[30] = mapped_in_temp[5] ;
                        wb_mapped_in[31] = mapped_in_temp[6] ;
                    end		     
           5'd26  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[6] ;
                        wb_mapped_in[1]  = mapped_in_temp[7] ;
                        wb_mapped_in[2]  = mapped_in_temp[8] ;
                        wb_mapped_in[3]  = mapped_in_temp[9] ;
                        wb_mapped_in[4]  = mapped_in_temp[10];
                        wb_mapped_in[5]  = mapped_in_temp[11];
                        wb_mapped_in[6]  = mapped_in_temp[12];
                        wb_mapped_in[7]  = mapped_in_temp[13];
                        wb_mapped_in[8]  = mapped_in_temp[14];
                        wb_mapped_in[9]  = mapped_in_temp[15];
                        wb_mapped_in[10] = mapped_in_temp[16];
                        wb_mapped_in[11] = mapped_in_temp[17];
                        wb_mapped_in[12] = mapped_in_temp[18];
                        wb_mapped_in[13] = mapped_in_temp[19];
                        wb_mapped_in[14] = mapped_in_temp[20];
                        wb_mapped_in[15] = mapped_in_temp[21];
                        wb_mapped_in[16] = mapped_in_temp[22];
                        wb_mapped_in[17] = mapped_in_temp[23];
                        wb_mapped_in[18] = mapped_in_temp[24];
                        wb_mapped_in[19] = mapped_in_temp[25];
                        wb_mapped_in[20] = mapped_in_temp[26];
                        wb_mapped_in[21] = mapped_in_temp[27];
                        wb_mapped_in[22] = mapped_in_temp[28];
                        wb_mapped_in[23] = mapped_in_temp[29];
                        wb_mapped_in[24] = mapped_in_temp[30];
                        wb_mapped_in[25] = mapped_in_temp[31];
                        wb_mapped_in[26] = mapped_in_temp[0] ;
                        wb_mapped_in[27] = mapped_in_temp[1] ;
                        wb_mapped_in[28] = mapped_in_temp[2] ;
                        wb_mapped_in[29] = mapped_in_temp[3] ;
                        wb_mapped_in[30] = mapped_in_temp[4] ;
                        wb_mapped_in[31] = mapped_in_temp[5] ;
                    end		     
           5'd27  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[5] ;
                        wb_mapped_in[1]  = mapped_in_temp[6] ;
                        wb_mapped_in[2]  = mapped_in_temp[7] ;
                        wb_mapped_in[3]  = mapped_in_temp[8] ;
                        wb_mapped_in[4]  = mapped_in_temp[9] ;
                        wb_mapped_in[5]  = mapped_in_temp[10];
                        wb_mapped_in[6]  = mapped_in_temp[11];
                        wb_mapped_in[7]  = mapped_in_temp[12];
                        wb_mapped_in[8]  = mapped_in_temp[13];
                        wb_mapped_in[9]  = mapped_in_temp[14];
                        wb_mapped_in[10] = mapped_in_temp[15];
                        wb_mapped_in[11] = mapped_in_temp[16];
                        wb_mapped_in[12] = mapped_in_temp[17];
                        wb_mapped_in[13] = mapped_in_temp[18];
                        wb_mapped_in[14] = mapped_in_temp[19];
                        wb_mapped_in[15] = mapped_in_temp[20];
                        wb_mapped_in[16] = mapped_in_temp[21];
                        wb_mapped_in[17] = mapped_in_temp[22];
                        wb_mapped_in[18] = mapped_in_temp[23];
                        wb_mapped_in[19] = mapped_in_temp[24];
                        wb_mapped_in[20] = mapped_in_temp[25];
                        wb_mapped_in[21] = mapped_in_temp[26];
                        wb_mapped_in[22] = mapped_in_temp[27];
                        wb_mapped_in[23] = mapped_in_temp[28];
                        wb_mapped_in[24] = mapped_in_temp[29];
                        wb_mapped_in[25] = mapped_in_temp[30];
                        wb_mapped_in[26] = mapped_in_temp[31];
                        wb_mapped_in[27] = mapped_in_temp[0] ;
                        wb_mapped_in[28] = mapped_in_temp[1] ;
                        wb_mapped_in[29] = mapped_in_temp[2] ;
                        wb_mapped_in[30] = mapped_in_temp[3] ;
                        wb_mapped_in[31] = mapped_in_temp[4] ;
                    end		     
           5'd28  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[4] ;
                        wb_mapped_in[1]  = mapped_in_temp[5] ;
                        wb_mapped_in[2]  = mapped_in_temp[6] ;
                        wb_mapped_in[3]  = mapped_in_temp[7] ;
                        wb_mapped_in[4]  = mapped_in_temp[8] ;
                        wb_mapped_in[5]  = mapped_in_temp[9] ;
                        wb_mapped_in[6]  = mapped_in_temp[10];
                        wb_mapped_in[7]  = mapped_in_temp[11];
                        wb_mapped_in[8]  = mapped_in_temp[12];
                        wb_mapped_in[9]  = mapped_in_temp[13];
                        wb_mapped_in[10] = mapped_in_temp[14];
                        wb_mapped_in[11] = mapped_in_temp[15];
                        wb_mapped_in[12] = mapped_in_temp[16];
                        wb_mapped_in[13] = mapped_in_temp[17];
                        wb_mapped_in[14] = mapped_in_temp[18];
                        wb_mapped_in[15] = mapped_in_temp[19];
                        wb_mapped_in[16] = mapped_in_temp[20];
                        wb_mapped_in[17] = mapped_in_temp[21];
                        wb_mapped_in[18] = mapped_in_temp[22];
                        wb_mapped_in[19] = mapped_in_temp[23];
                        wb_mapped_in[20] = mapped_in_temp[24];
                        wb_mapped_in[21] = mapped_in_temp[25];
                        wb_mapped_in[22] = mapped_in_temp[26];
                        wb_mapped_in[23] = mapped_in_temp[27];
                        wb_mapped_in[24] = mapped_in_temp[28];
                        wb_mapped_in[25] = mapped_in_temp[29];
                        wb_mapped_in[26] = mapped_in_temp[30];
                        wb_mapped_in[27] = mapped_in_temp[31];
                        wb_mapped_in[28] = mapped_in_temp[0] ;
                        wb_mapped_in[29] = mapped_in_temp[1] ;
                        wb_mapped_in[30] = mapped_in_temp[2] ;
                        wb_mapped_in[31] = mapped_in_temp[3] ;
                    end		     
           5'd29  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[3] ;
                        wb_mapped_in[1]  = mapped_in_temp[4] ;
                        wb_mapped_in[2]  = mapped_in_temp[5] ;
                        wb_mapped_in[3]  = mapped_in_temp[6] ;
                        wb_mapped_in[4]  = mapped_in_temp[7] ;
                        wb_mapped_in[5]  = mapped_in_temp[8] ;
                        wb_mapped_in[6]  = mapped_in_temp[9] ;
                        wb_mapped_in[7]  = mapped_in_temp[10];
                        wb_mapped_in[8]  = mapped_in_temp[11];
                        wb_mapped_in[9]  = mapped_in_temp[12];
                        wb_mapped_in[10] = mapped_in_temp[13];
                        wb_mapped_in[11] = mapped_in_temp[14];
                        wb_mapped_in[12] = mapped_in_temp[15];
                        wb_mapped_in[13] = mapped_in_temp[16];
                        wb_mapped_in[14] = mapped_in_temp[17];
                        wb_mapped_in[15] = mapped_in_temp[18];
                        wb_mapped_in[16] = mapped_in_temp[19];
                        wb_mapped_in[17] = mapped_in_temp[20];
                        wb_mapped_in[18] = mapped_in_temp[21];
                        wb_mapped_in[19] = mapped_in_temp[22];
                        wb_mapped_in[20] = mapped_in_temp[23];
                        wb_mapped_in[21] = mapped_in_temp[24];
                        wb_mapped_in[22] = mapped_in_temp[25];
                        wb_mapped_in[23] = mapped_in_temp[26];
                        wb_mapped_in[24] = mapped_in_temp[27];
                        wb_mapped_in[25] = mapped_in_temp[28];
                        wb_mapped_in[26] = mapped_in_temp[29];
                        wb_mapped_in[27] = mapped_in_temp[30];
                        wb_mapped_in[28] = mapped_in_temp[31];
                        wb_mapped_in[29] = mapped_in_temp[0] ;
                        wb_mapped_in[30] = mapped_in_temp[1] ;
                        wb_mapped_in[31] = mapped_in_temp[2] ;
                    end		     
           5'd30  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[2] ;
                        wb_mapped_in[1]  = mapped_in_temp[3] ;
                        wb_mapped_in[2]  = mapped_in_temp[4] ;
                        wb_mapped_in[3]  = mapped_in_temp[5] ;
                        wb_mapped_in[4]  = mapped_in_temp[6] ;
                        wb_mapped_in[5]  = mapped_in_temp[7] ;
                        wb_mapped_in[6]  = mapped_in_temp[8] ;
                        wb_mapped_in[7]  = mapped_in_temp[9] ;
                        wb_mapped_in[8]  = mapped_in_temp[10];
                        wb_mapped_in[9]  = mapped_in_temp[11];
                        wb_mapped_in[10] = mapped_in_temp[12];
                        wb_mapped_in[11] = mapped_in_temp[13];
                        wb_mapped_in[12] = mapped_in_temp[14];
                        wb_mapped_in[13] = mapped_in_temp[15];
                        wb_mapped_in[14] = mapped_in_temp[16];
                        wb_mapped_in[15] = mapped_in_temp[17];
                        wb_mapped_in[16] = mapped_in_temp[18];
                        wb_mapped_in[17] = mapped_in_temp[19];
                        wb_mapped_in[18] = mapped_in_temp[20];
                        wb_mapped_in[19] = mapped_in_temp[21];
                        wb_mapped_in[20] = mapped_in_temp[22];
                        wb_mapped_in[21] = mapped_in_temp[23];
                        wb_mapped_in[22] = mapped_in_temp[24];
                        wb_mapped_in[23] = mapped_in_temp[25];
                        wb_mapped_in[24] = mapped_in_temp[26];
                        wb_mapped_in[25] = mapped_in_temp[27];
                        wb_mapped_in[26] = mapped_in_temp[28];
                        wb_mapped_in[27] = mapped_in_temp[29];
                        wb_mapped_in[28] = mapped_in_temp[30];
                        wb_mapped_in[29] = mapped_in_temp[31];
                        wb_mapped_in[30] = mapped_in_temp[0] ;
                        wb_mapped_in[31] = mapped_in_temp[1] ;
                    end		     
           5'd31  : begin       
                        wb_mapped_in[0]  = mapped_in_temp[1] ;
                        wb_mapped_in[1]  = mapped_in_temp[2] ;
                        wb_mapped_in[2]  = mapped_in_temp[3] ;
                        wb_mapped_in[3]  = mapped_in_temp[4] ;
                        wb_mapped_in[4]  = mapped_in_temp[5] ;
                        wb_mapped_in[5]  = mapped_in_temp[6] ;
                        wb_mapped_in[6]  = mapped_in_temp[7] ;
                        wb_mapped_in[7]  = mapped_in_temp[8] ;
                        wb_mapped_in[8]  = mapped_in_temp[9] ;
                        wb_mapped_in[9]  = mapped_in_temp[10];
                        wb_mapped_in[10] = mapped_in_temp[11];
                        wb_mapped_in[11] = mapped_in_temp[12];
                        wb_mapped_in[12] = mapped_in_temp[13];
                        wb_mapped_in[13] = mapped_in_temp[14];
                        wb_mapped_in[14] = mapped_in_temp[15];
                        wb_mapped_in[15] = mapped_in_temp[16];
                        wb_mapped_in[16] = mapped_in_temp[17];
                        wb_mapped_in[17] = mapped_in_temp[18];
                        wb_mapped_in[18] = mapped_in_temp[19];
                        wb_mapped_in[19] = mapped_in_temp[20];
                        wb_mapped_in[20] = mapped_in_temp[21];
                        wb_mapped_in[21] = mapped_in_temp[22];
                        wb_mapped_in[22] = mapped_in_temp[23];
                        wb_mapped_in[23] = mapped_in_temp[24];
                        wb_mapped_in[24] = mapped_in_temp[25];
                        wb_mapped_in[25] = mapped_in_temp[26];
                        wb_mapped_in[26] = mapped_in_temp[27];
                        wb_mapped_in[27] = mapped_in_temp[28];
                        wb_mapped_in[28] = mapped_in_temp[29];
                        wb_mapped_in[29] = mapped_in_temp[30];
                        wb_mapped_in[30] = mapped_in_temp[31];
                        wb_mapped_in[31] = mapped_in_temp[0] ;
                    end		     
	 endcase // casex(anchor_buf[4:0])
     endcase // casex(tt_index_temp[11:10])
  end 
   

   
   
 



endmodule // niu_zcp_unmap_engine
