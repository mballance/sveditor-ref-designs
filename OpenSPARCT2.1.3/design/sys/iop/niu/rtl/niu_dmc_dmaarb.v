// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_dmc_dmaarb.v
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
 **********************************************************************/


`include "txc_defines.h"
`include "niu_dmc_reg_defines.h"

module niu_dmc_dmaarb (/*AUTOARG*/
   // Outputs
   ArbDone, DMANum, DMAsGranted, 
   // Inputs
   SysClk, Reset_L, Choose_DMAs, DMA_Reqs
   );


   input SysClk;
   input Reset_L;
   input Choose_DMAs;
   input [31:0] DMA_Reqs;
   
   output ArbDone;
   output [4:0] DMANum;
   output [31:0] DMAsGranted;
   


   reg [31:0] 	  DMAsGranted;
   reg [31:0] 	  Select_DMA_Grant;
   reg [3:0] 	  DMA_Request_ArbState;
   reg 		  ArbDone;
   reg [4:0] 	  DMANum;
   

  
   parameter DMA_REQ_ARB_IDLE   = 4'h0,
	     SELECT_DMA_NUM = 4'h1,
	     DMA_REQ_ARB_DONE = 4'h2; 

  //VCS coverage off
  // synopsys translate_off
   reg [192:1] 	  CACHE_REQ_ARB_STATE;

     always @(DMA_Request_ArbState)
     begin
	case(DMA_Request_ArbState)
	  DMA_REQ_ARB_IDLE :            CACHE_REQ_ARB_STATE = "DMA_REQ_ARB_IDLE";
	  SELECT_DMA_NUM:    CACHE_REQ_ARB_STATE = "SELECT_DMA_NUM";
	  DMA_REQ_ARB_DONE :   CACHE_REQ_ARB_STATE = "DMA_REQ_ARB_DONE";
	  default :            CACHE_REQ_ARB_STATE = "UNKNOWN";
	endcase
     end
   // synopsys translate_on
   //VCS coverage on
   

  always@(posedge SysClk ) begin
     if(!Reset_L)begin
	DMA_Request_ArbState <= DMA_REQ_ARB_IDLE;
	DMAsGranted <= 32'h0;
	Select_DMA_Grant <= 32'h0;
	ArbDone <= 1'b1;
	DMANum<= 5'h0;
     end else 
       begin
	 case(DMA_Request_ArbState) // synopsys parallel_case
	   DMA_REQ_ARB_IDLE: begin
	      ArbDone <=1'b0;
	      if(Choose_DMAs) begin
		 Select_DMA_Grant <= DMA_Reqs & ~DMAsGranted;
		 DMA_Request_ArbState <= SELECT_DMA_NUM;
	      end else begin // if (choose_available_dmas)
		 DMAsGranted <= 32'h0;
		 Select_DMA_Grant <= 32'h0;
	      end // else: !if(choose_available_dmas)
	   end // case: DMA_REQ_ARB_IDLE
	   SELECT_DMA_NUM: begin
	      ArbDone <=1'b1;
	      casex(Select_DMA_Grant) // Synopsys full_case 
		32'b0000_0000_0000_0000_0000_0000_0000_0001: begin
		   DMAsGranted <= 32'b0000_0000_0000_0000_0000_0000_0000_0001;
		   DMANum<= `DMA_CHANNEL_ZERO;
		end // case: 32'b0000_0000_0000_0000_0000_0000_0000_0001
		32'b????_????_????_????_????_????_????_??1?:  begin 
		   DMAsGranted <= 32'b0000_0000_0000_0000_0000_0000_0000_0010;
		   DMANum<= `DMA_CHANNEL_ONE;
		end
		32'b????_????_????_????_????_????_????_?10?: begin 
		   DMAsGranted <= 32'b0000_0000_0000_0000_0000_0000_0000_0100;
		   DMANum<= `DMA_CHANNEL_TWO; 
		  end
		32'b????_????_????_????_????_????_????_100?:  begin 
		   DMAsGranted <= 32'b0000_0000_0000_0000_0000_0000_0000_1000; 
		   DMANum<= `DMA_CHANNEL_THREE;
		end
		32'b????_????_????_????_????_????_???1_000?:  begin 
		   DMAsGranted <= 32'b0000_0000_0000_0000_0000_0000_0001_0000; 
		   DMANum<= `DMA_CHANNEL_FOUR;
		end
		32'b????_????_????_????_????_????_??10_000?:  begin 
		   DMAsGranted <= 32'b0000_0000_0000_0000_0000_0000_0010_0000; 
		   DMANum<= `DMA_CHANNEL_FIVE;
		end
		32'b????_????_????_????_????_????_?100_000?:  begin 
		   DMAsGranted <= 32'b0000_0000_0000_0000_0000_0000_0100_0000; 
		   DMANum<= `DMA_CHANNEL_SIX;

		end
		32'b????_????_????_????_????_????_1000_000?:  begin 
		   DMAsGranted <= 32'b0000_0000_0000_0000_0000_0000_1000_0000; 
		   DMANum<= `DMA_CHANNEL_SEVEN;
		end
		32'b????_????_????_????_????_???1_0000_000?:  begin 
		   DMAsGranted <= 32'b0000_0000_0000_0000_0000_0001_0000_0000; 
		   DMANum<= `DMA_CHANNEL_EIGHT;
		end
		32'b????_????_????_????_????_??10_0000_000?:  begin 
		   DMAsGranted <= 32'b0000_0000_0000_0000_0000_0010_0000_0000; 
		   DMANum<= `DMA_CHANNEL_NINE;
		end
		32'b????_????_????_????_????_?100_0000_000?:  begin 
		   DMAsGranted <= 32'b0000_0000_0000_0000_0000_0100_0000_0000; 
		   DMANum<= `DMA_CHANNEL_TEN;
		end
		32'b????_????_????_????_????_1000_0000_000?:  begin 
		   DMAsGranted <= 32'b0000_0000_0000_0000_0000_1000_0000_0000; 
		   DMANum<= `DMA_CHANNEL_ELEVEN;
		end
		32'b????_????_????_????_???1_0000_0000_000?:  begin 
		   DMAsGranted <= 32'b0000_0000_0000_0000_0001_0000_0000_0000; 
		   DMANum<= `DMA_CHANNEL_TWELVE;
		end
		32'b????_????_????_????_??10_0000_0000_000?:  begin 
		   DMAsGranted <= 32'b0000_0000_0000_0000_0010_0000_0000_0000; 
		   DMANum<= `DMA_CHANNEL_THIRTEEN;
		end
		32'b????_????_????_????_?100_0000_0000_000?:  begin 
		   DMAsGranted <= 32'b0000_0000_0000_0000_0100_0000_0000_0000; 
		   DMANum<= `DMA_CHANNEL_FOURTEEN;
		end
		32'b????_????_????_????_1000_0000_0000_000?:  begin 
		   DMAsGranted <= 32'b0000_0000_0000_0000_1000_0000_0000_0000; 
		   DMANum<= `DMA_CHANNEL_FIFTEEN;
		end
		32'b????_????_????_???1_0000_0000_0000_000?:  begin 
		   DMAsGranted <= 32'b0000_0000_0000_0001_0000_0000_0000_0000; 
		   DMANum<= `DMA_CHANNEL_SIXTEEN;
		end
		32'b????_????_????_??10_0000_0000_0000_000?:  begin 
		   DMAsGranted <= 32'b0000_0000_0000_0010_0000_0000_0000_0000; 
		   DMANum<= `DMA_CHANNEL_SEVENTEEN;  
		end
		32'b????_????_????_?100_0000_0000_0000_000?:  begin 
		   DMAsGranted <= 32'b0000_0000_0000_0100_0000_0000_0000_0000; 
		   DMANum<= `DMA_CHANNEL_EIGHTEEN;
		end
		32'b????_????_????_1000_0000_0000_0000_000?:  begin 
		   DMAsGranted <= 32'b0000_0000_0000_1000_0000_0000_0000_0000; 
		   DMANum<= `DMA_CHANNEL_NINETEEN;
		end
		32'b????_????_???1_0000_0000_0000_0000_000?:  begin 
		   DMAsGranted <= 32'b0000_0000_0001_0000_0000_0000_0000_0000; 
		   DMANum<= `DMA_CHANNEL_TWENTY;
		end
		32'b????_????_??10_0000_0000_0000_0000_000?:  begin 
		   DMAsGranted <= 32'b0000_0000_0010_0000_0000_0000_0000_0000; 
		   DMANum<= `DMA_CHANNEL_TWENTYONE;
		end
		32'b????_????_?100_0000_0000_0000_0000_000?:  begin 
		   DMAsGranted <= 32'b0000_0000_0100_0000_0000_0000_0000_0000; 
		   DMANum<= `DMA_CHANNEL_TWENTYTWO;
		end
		32'b????_????_1000_0000_0000_0000_0000_000?:  begin 
		   DMAsGranted <= 32'b0000_0000_1000_0000_0000_0000_0000_0000; 
		   DMANum<= `DMA_CHANNEL_TWENTYTHREE;
		end
		default:   begin
		   DMAsGranted <= 32'b0;
		   DMANum<=`DMA_CHANNEL_ZERO;
		end
		     
	      endcase // case(DMA_Request_ArbState)
	      DMA_Request_ArbState <= DMA_REQ_ARB_DONE; 
	   end // case: SELECT_DMA_NUM
	   DMA_REQ_ARB_DONE: begin
	      DMA_Request_ArbState <= DMA_REQ_ARB_IDLE; 
	      ArbDone <=1'b0;
	   end // case: DMA_REQ_ARB_DONE
	 endcase // case(DMA_Request_ArbState)
       end // else: !if(!Reset_L)
  end // always@ (posedge SysClk )
endmodule // niu_dmc_dmaarb

