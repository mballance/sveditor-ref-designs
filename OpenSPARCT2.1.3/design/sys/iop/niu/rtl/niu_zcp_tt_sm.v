// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_zcp_tt_sm.v
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

/***************************************************************
 *
 * File Name    : niu_zcp_tt_sm.v
 * Author Name  : John Lo
 * Description  : 
 * Parent Module:
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 5/4/04
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 * Design Notes: When adding more CAL states DON'T forget to 
 *               modify tt_atomic_op. 
 *              
 * 
 **************************************************************/


module niu_zcp_tt_sm 
  (/*AUTOARG*/
   // Outputs
   tt_rd_en0, tt_rd_en1, tt_rd_en2, tt_rd_en3, tt_rd_en4, wb_tt0, 
   wb_tt1, decode_default_rdc, decode_table_rdc, decode_zc_rdc, 
   tt_active, tt_sm_rw, ld_cal_results, tt_fail, buf_req, wr_2words, 
   wr_4words, tt_state, 
   // Inputs
   clk, reset10, kickoff_tt, tt_ok_reg, tt_en, zc_mode, buf_req_ok
   );
   
   
   input                      clk;
   input 		      reset10;
   input 		      kickoff_tt;
   input [5:0]		      tt_ok_reg;
   input 		      tt_en;
   input 		      zc_mode;
   input 		      buf_req_ok;
                              // outputs
   output 		      tt_rd_en0;
   output 		      tt_rd_en1;
   output 		      tt_rd_en2;
   output 		      tt_rd_en3;
   output 		      tt_rd_en4;
   output 		      wb_tt0;
   output 		      wb_tt1;
   output 		      decode_default_rdc;
   output 		      decode_table_rdc;
   output 		      decode_zc_rdc;
   output 		      tt_active;
   output 		      tt_sm_rw;
   output [31:0]	      ld_cal_results;
   output 		      tt_fail;
   output 		      buf_req;
   output 		      wr_2words;
   output 		      wr_4words;
   output [3:0] 	      tt_state;

   wire 		      reset = reset10;
   wire 		      kickoff_tt;
   wire [31:0] 		      ld_cal_results;
   wire [3:0] 		      tt_state;
   wire   		      tt_rd_en0;
   wire   		      tt_rd_en1;
   wire   		      tt_rd_en2;
   wire   		      tt_rd_en3;
   wire   		      tt_rd_en4;

   reg [3:0] nx_tt_state;
   reg       decode_default_rdc,
	     decode_table_rdc  ,
	     decode_zc_rdc     ,
	     p1_ld_cal_results ,
	     tt_active         ,
	     tt_sm_rw          ,
             p1_tt_rd_en       ,
	     wb_tt0            ,
	     wb_tt1            ,
	     wr_2words         ,  // bypass_mode, tt_fail
	     wr_4words         ,  // ~tt_fail => do 4 writes to cfifo.
	     buf_req           ,
             tt_fail           ;

   parameter   IDLE              = 4'b0_000,
	       BYPASS            = 4'b0_001,
	       DLY1              = 4'b0_010,
	       DLY2              = 4'b0_011,
	       DLY3              = 4'b0_100,
	       DLY4              = 4'b0_101,

	       RD_TT             = 4'b1_000,
	       LCH_TT            = 4'b1_001,
	       CAL1              = 4'b1_010,
	       CAL2              = 4'b1_011,
	       CAL3              = 4'b1_100,
	       CAL4              = 4'b1_101,
	       CHK_RESULT        = 4'b1_110;

// comb part    
always @ (/*AUTOSENSE*/buf_req_ok or kickoff_tt or tt_en or tt_ok_reg
	  or tt_state or zc_mode)
begin
             nx_tt_state        = IDLE;
	     decode_default_rdc = 0;
	     decode_table_rdc   = 0;
	     decode_zc_rdc      = 0;
	     p1_ld_cal_results  = 0;
             tt_active          = 0;
             tt_sm_rw           = 0;
	     p1_tt_rd_en        = 0;
             wb_tt0             = 0;
             wb_tt1             = 0;
             wr_2words          = 0;
             wr_4words          = 0;
             buf_req            = 0;
             tt_fail            = 0;
   
   casex (tt_state)  // synopsys parallel_case full_case
   IDLE:
     if (kickoff_tt) 
          begin
	    if (tt_en & zc_mode)
	      begin
	          nx_tt_state        = RD_TT; // tt_en and good
		  p1_tt_rd_en        = 1; // tt_rd_en is register to latch va,dn,st ram.
                  tt_active          = 1;
                  tt_sm_rw           = 1;
	      end
	    else  // bypass mode
	      begin
	          nx_tt_state        = BYPASS;
	      end
	  end
     else begin 
                  nx_tt_state        = tt_state; // stay
          end

   //----- TCP mode and successful tests -----------------
   RD_TT: begin   // tt_rd_en = 1 (registered)
                  nx_tt_state        = LCH_TT;
                  tt_active          = 1;
                  tt_sm_rw           = 1;
	          decode_default_rdc = 1;
          end

   LCH_TT:begin
                  nx_tt_state        = CAL1;
                  tt_active          = 1;
	          decode_table_rdc   = 1;
          end

   CAL1: begin
                  nx_tt_state        = CAL2;
                  tt_active          = 1;
	          decode_zc_rdc      = 1;
          end

   CAL2:  begin   
                  nx_tt_state        = CAL3;
                  tt_active          = 1;
          end

   CAL3:  begin
                  nx_tt_state        = CAL4;
	          p1_ld_cal_results  = 1;
                  tt_active          = 1;
          end

   CAL4:  begin
                  nx_tt_state        = CHK_RESULT;
                  tt_active          = 1;
                  tt_sm_rw           = 1;
         end

   CHK_RESULT:    // handle is ready
          begin
                  nx_tt_state        = IDLE;
                  tt_fail            = ~tt_ok_reg[0];
	          buf_req            =  tt_ok_reg[1] & buf_req_ok;
 	          wr_4words          =  tt_ok_reg[2];
 	          wr_2words          = ~tt_ok_reg[3];
                  wb_tt0             =  tt_ok_reg[4];
                  wb_tt1             =  tt_ok_reg[5];
                  tt_active          = 1;
                  tt_sm_rw           = 1;
          end

   //----- BYPASS mode tests -------------------
   BYPASS:begin
                  nx_tt_state        = DLY1;
	          decode_default_rdc = 1;
          end
   DLY1:  begin
                  nx_tt_state        = DLY2;
 	          decode_table_rdc   = 1;
          end
   DLY2:  begin
                  nx_tt_state        = DLY3;
	          p1_ld_cal_results  = 1;
         end
   DLY3:  begin
                  nx_tt_state        = DLY4;
	       // ld_cal_result      = 1;
         end
   DLY4:  begin
                  nx_tt_state        = IDLE;
	          wr_2words          = 1;
          end

   //----- default stuff ----------------------------------------
   default:
          begin
                  nx_tt_state        = IDLE;
	          // synopsys translate_off
                  $display("(* ERROR: at sim time = %d, niu_zcp_tt_sm is in forbidden state *) \n", $time);
	          // synopsys translate_on
          end // case: default
   endcase // casex(tt_state)
end // always @ (...
   
   

// seq part 
zcp_RegRst #(4) tt_state_RegRst(.din(nx_tt_state[3:0]),
                              .clk(clk),
                              .reset(reset),
                              .qout(tt_state[3:0]));


// glue logic
zcp_RegDff #(5) tt_rd_en_RegDff(.din({5{p1_tt_rd_en}}),.clk(clk),.qout({tt_rd_en4,tt_rd_en3,tt_rd_en2,tt_rd_en1,tt_rd_en0}));

zcp_RegDff #(32) tt_state_RegDff(.din({32{p1_ld_cal_results}}),.clk(clk),.qout(ld_cal_results[31:0]));

       
endmodule // niu_zcp_tt_sm


