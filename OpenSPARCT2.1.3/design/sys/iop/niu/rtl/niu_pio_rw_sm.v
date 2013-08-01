// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_pio_rw_sm.v
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
 * File Name    : niu_pio_rw_sm.v
 * Author Name  : John Lo
 * Description  : It contains niu pio interface, interrupt controller,
 *                UCB for N2. 
 * Parent Module: niu
 * Child  Module: 
 * Interface Mod: many.
 * Date Created : 3/08/2004
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

module niu_pio_rw_sm (/*AUTOARG*/
   // Outputs
   ucb_ack, 
   ucb_nack, 
   fifo_rd_en, 
   pio_sel_state, 
   pio_rw_state, 
   pio_peu_32b_int,
`ifdef NEPTUNE
   insert_db,
`else
`endif
   // Inputs
   clk, 
   reset, 
   empty, 
   pio_ack, 
   pio_err, 
   rd, 
   ack_TO_en, 
   ack_TO_value, 
   pio_clients_32b,
   sel1, 
   ucb_rack_busy
   );

   input 		      clk;
   input 		      reset;
   input 		      empty;
   input 		      pio_ack;
   input 		      pio_err;
   input 		      rd;
   input         	      ack_TO_en;
   input  [9:0]		      ack_TO_value;
   input 		      sel1;
   input 		      ucb_rack_busy;
   input                      pio_clients_32b;

   output 		      ucb_ack;
   output 		      ucb_nack;
   output 		      fifo_rd_en;
   output 		      pio_sel_state;
   output [2:0]		      pio_rw_state;
   output                     pio_peu_32b_int;

   reg 	[2:0]		      nx_pio_rw_state;
   reg 			      fifo_rd_en;
   reg 			      ucb_ack;
   reg 			      ucb_nack;
   reg                        pio_peu_32b_int_mod;
   reg  [9:0] 		      nx_ack_TO_cnt;
   wire [9:0] 		      ack_TO_cnt;
   wire [2:0]		      pio_rw_state;
   wire 		      pio_sel_state;
   wire 		      TO_cnt_state;
   wire 		      TO;
   wire 		      goto_idle;
   
`ifdef NEPTUNE
   output 		      insert_db ;
   reg 		              insert_db ;
`else
`endif

   parameter 		      IDLE   = 3'd0;
   parameter 		      CHK_SEL= 3'd1;
   parameter 		      CHK_TO = 3'd2;
   parameter 		      R_NACK = 3'd3; // ucb err
   parameter 		      R_ACK  = 3'd4; // ucb 

`ifdef NEPTUNE
   parameter 		      R_NACK_noerr  = 3'd5; // ucb 

   wire	  detect_rnack_state ;
   wire	  assert_pio_peu_32b_int ;

   assign detect_rnack_state = ( pio_rw_state[2] &
                               ! pio_rw_state[1] &
                                 pio_rw_state[0] ) ;

   assign assert_pio_peu_32b_int = (detect_rnack_state & pio_clients_32b) ;

   assign pio_peu_32b_int	 = (pio_peu_32b_int_mod || assert_pio_peu_32b_int) ;

`else
   assign pio_peu_32b_int	 = pio_peu_32b_int_mod ;
`endif

// combination logic
always @ (/*AUTOSENSE*/TO or empty or pio_ack or pio_err
	  or pio_rw_state or rd or sel1 or ucb_rack_busy
          or pio_clients_32b )
  begin
		  fifo_rd_en      = 0;
	          ucb_ack         = 0;
	          ucb_nack        = 0;
                  pio_peu_32b_int_mod = 0;
           `ifdef NEPTUNE
                  insert_db       = 0;
           `else
           `endif
     case (pio_rw_state) // synopsys full_case parallel_case
       IDLE:   begin
                 if (empty)
                     nx_pio_rw_state = pio_rw_state;
                 else
                   begin
                     nx_pio_rw_state = CHK_SEL;
	  	     fifo_rd_en      = 1;  
	           end
               end

       CHK_SEL:casex({sel1,rd})                     // synopsys full_case parallel_case
                 2'b00:  nx_pio_rw_state = IDLE;    // no sel1 and write
		 2'b01: 
                  `ifdef NEPTUNE
                         nx_pio_rw_state = R_NACK_noerr;  // no sel1 and write
                  `else
                         nx_pio_rw_state = R_NACK;  // no sel1 and write
                  `endif
		 2'b1x:  nx_pio_rw_state = CHK_TO;  // sel1 and write
		 default:nx_pio_rw_state = IDLE;  
	       endcase

       CHK_TO: casex({pio_err,rd,TO,pio_ack})            // synopsys full_case parallel_case
                 4'bxx00:nx_pio_rw_state = pio_rw_state; //~TO &~pio_ack
		 4'bx0x1:nx_pio_rw_state = IDLE;         //      pio_ack & wr
		 4'b01x1:nx_pio_rw_state = R_ACK;        //      pio_ack & rd & ~err
		 4'b11x1:nx_pio_rw_state = R_NACK;       //      pio_ack & rd &  err
		 4'bx010:nx_pio_rw_state = IDLE;         // TO &~pio_ack & wr
		 4'bx110:nx_pio_rw_state = R_NACK;       // TO &~pio_ack & rd &  err
		 default:nx_pio_rw_state = IDLE;  
               endcase

       R_NACK: if (ucb_rack_busy)
	                 nx_pio_rw_state = pio_rw_state;
               else begin
                         nx_pio_rw_state = IDLE;
		         ucb_nack        = 1;
                    if (pio_clients_32b)
                        pio_peu_32b_int_mod  = 1;
                    else
                        pio_peu_32b_int_mod  = 0;

                    end
		 
       R_ACK:  if (ucb_rack_busy)
                         nx_pio_rw_state = pio_rw_state;
               else begin
                         nx_pio_rw_state = IDLE;
	                 ucb_ack         = 1;
                    if (pio_clients_32b)
                        pio_peu_32b_int_mod  = 1;
                    else
                        pio_peu_32b_int_mod  = 0;
	            end

`ifdef NEPTUNE
       R_NACK_noerr: if (ucb_rack_busy)
	                 nx_pio_rw_state = pio_rw_state;
               else begin
                         nx_pio_rw_state = IDLE;
		         ucb_ack         = 1;
                         insert_db       = 1;

                    end
`else
`endif

       default:   nx_pio_rw_state = IDLE;
     endcase
  end

// seq part
dffr #(3) pio_rw_state_dffr(.d(nx_pio_rw_state[2:0]),.reset(reset),.clk(clk),.q(pio_rw_state[2:0]));

// important equations:   
   assign  pio_sel_state =(pio_rw_state == CHK_SEL) | (pio_rw_state == CHK_TO);
   assign  TO_cnt_state  = pio_rw_state == CHK_TO;
   assign  TO            =(ack_TO_cnt   == ack_TO_value) & ack_TO_en;
   assign  goto_idle     = nx_pio_rw_state == IDLE;

// TO count up counter
always @ (/*AUTOSENSE*/TO or TO_cnt_state or ack_TO_cnt or ack_TO_en
	  or ack_TO_value or fifo_rd_en or goto_idle)
  begin
    if (goto_idle | fifo_rd_en)
          nx_ack_TO_cnt = 0;
    else if ((ack_TO_cnt != ack_TO_value) & TO_cnt_state & ack_TO_en)
          nx_ack_TO_cnt = ack_TO_cnt + 10'b1;
    else if (TO)          
          nx_ack_TO_cnt = ack_TO_cnt; // hold
    else  nx_ack_TO_cnt = ack_TO_cnt; // hold
  end // always @ (...
   

dffr # (10) ack_TO_cnt_dffre(.reset(reset),.clk(clk),.d(nx_ack_TO_cnt[9:0]),.q(ack_TO_cnt[9:0]));
   
endmodule // niu_pio_rw_sm


