// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_pio_macros.v
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
 * File Name    : niu_pio_macros.v
 * Author Name  : John Lo
 * Description  : It contains macros.
 *                
 * Parent Module: 
 * Child  Module: 
 * Interface Mod: many.
 * Date Created : 3/15/04
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 ****************************************************************/


//*****************************
// Register xREG2
//*****************************
module pio_xREG2 (clk,reset,reset_value,load,din,qout);

   parameter dwidth = 10;
   input               clk;
   input               reset;
   input [dwidth-1:0]  reset_value;
   input 	       load;
   input [dwidth-1:0]  din;
   output [dwidth-1:0] qout;

   reg [dwidth-1:0]  qout;
   

always @ (posedge clk)
  if (reset)
    qout <= reset_value;
  else if (load)
    qout <= din;
  else
    qout <= qout;

endmodule


/***********************************
 * 1 bit rst reset dff
 ***********************************/
module rffre (clk,reset,rst,en,d,q);

   input        clk;
   input 	reset;
   input 	rst;
   input 	en;
   input       	d;
   output       q;

reg     nx_q;
wire    q;

always @ (rst or en or d or q)
  if (rst)
    nx_q = 0;
  else if (en)
    nx_q = d;
  else
    nx_q = q;
   
dffr #(1) dffr (.clk(clk),.reset(reset),.d(nx_q),.q(q));
 
endmodule

/***********************************
 * 6 bit count down counter
 ***********************************/
module timer_6bit (clk,reset,rst,dec,en,d,q);

   input        clk;
   input 	reset;
   input 	rst;
   input 	dec;
   input 	en;
   input [5:0] 	d;
   output [5:0] q;

reg    [5:0] nx_q;
wire   [5:0] q;

always @ (rst or en or d or q or dec)
  if (rst)
    nx_q = 0;
  else if (en)
    nx_q = d;
  else if (~(|q))  // q == 0
    nx_q = q;
  else if (dec)
    nx_q = q -1;
  else
    nx_q = q;
   
dffr #(6) dffr (.clk(clk),.reset(reset),.d(nx_q),.q(q));
 
endmodule // timer_6bit

/***********************************
 * 20 bit resolution counter
 ***********************************/
module rtimer_20bit (clk,reset,dec_timer,en,d,q);

   input          clk;
   input 	  reset;
   input 	  en;
   input  [19:0]  d;
   output 	  dec_timer;
   output [19:0]  q;
      

reg    [19:0] nx_cnt;
wire   [19:0] cnt;
wire          timer_pls;

dffre #(20) resolution_dffre (.clk(clk),.reset(reset),.en(en),.d(d),.q(q));
   
// assign    nx_cnt = cnt +1;
always @ (q or cnt or timer_pls)
  if ((~(|q)) | timer_pls)  // q == 0
    nx_cnt = 0;
  else
    nx_cnt = cnt+1;
   
dffr #(20)  cnt_dffr (.clk(clk),.reset(reset),.d(nx_cnt),.q(cnt));

   assign timer_pls = (cnt == q) ;
   
df1 #(1) dec_timer_df1 (.clk(clk),.d(timer_pls),.q(dec_timer));

endmodule // timer_6bit




module niu_pls_gen2 (clk,sig_in,lead,trail);
   input sig_in, clk;
   output lead,trail;

   wire   sig_in, sig_out,lead,trail;
   df1 sig_out_df1 (.clk(clk),.d(sig_in),.q(sig_out));   
   assign lead =  sig_in & ~sig_out;
   assign trail= ~sig_in &  sig_out;

endmodule




module mux_r64to1(din,sel,dout);
   input [63:0] 	      din;
   input [5:0]		      sel;
   output 		      dout;

   wire [5:0] 		      sel;
   reg 			      dout;
   
always @ (sel or din) 
   casex(sel)  // synopsys parallel_case full_case
     6'd0  : dout = din[63]  ;
     6'd1  : dout = din[62]  ;
     6'd2  : dout = din[61]  ;
     6'd3  : dout = din[60]  ;
     6'd4  : dout = din[59]  ;
     6'd5  : dout = din[58]  ;
     6'd6  : dout = din[57]  ;
     6'd7  : dout = din[56]  ;
     6'd8  : dout = din[55]  ;
     6'd9  : dout = din[54]  ;
     6'd10 : dout = din[53] ;
     6'd11 : dout = din[52] ;
     6'd12 : dout = din[51] ;
     6'd13 : dout = din[50] ;
     6'd14 : dout = din[49] ;
     6'd15 : dout = din[48] ;
     6'd16 : dout = din[47] ;
     6'd17 : dout = din[46] ;
     6'd18 : dout = din[45] ;
     6'd19 : dout = din[44] ;
     6'd20 : dout = din[43] ;
     6'd21 : dout = din[42] ;
     6'd22 : dout = din[41] ;
     6'd23 : dout = din[40] ;
     6'd24 : dout = din[39] ;
     6'd25 : dout = din[38] ;
     6'd26 : dout = din[37] ;
     6'd27 : dout = din[36] ;
     6'd28 : dout = din[35] ;
     6'd29 : dout = din[34] ;
     6'd30 : dout = din[33] ;
     6'd31 : dout = din[32] ;
     6'd32 : dout = din[31] ;
     6'd33 : dout = din[30] ;
     6'd34 : dout = din[29] ;
     6'd35 : dout = din[28] ;
     6'd36 : dout = din[27] ;
     6'd37 : dout = din[26] ;
     6'd38 : dout = din[25] ;
     6'd39 : dout = din[24] ;
     6'd40 : dout = din[23] ;
     6'd41 : dout = din[22] ;
     6'd42 : dout = din[21] ;
     6'd43 : dout = din[20] ;
     6'd44 : dout = din[19] ;
     6'd45 : dout = din[18] ;
     6'd46 : dout = din[17] ;
     6'd47 : dout = din[16] ;
     6'd48 : dout = din[15] ;
     6'd49 : dout = din[14] ;
     6'd50 : dout = din[13] ;
     6'd51 : dout = din[12] ;
     6'd52 : dout = din[11] ;
     6'd53 : dout = din[10] ;
     6'd54 : dout = din[9] ;
     6'd55 : dout = din[8] ;
     6'd56 : dout = din[7] ;
     6'd57 : dout = din[6] ;
     6'd58 : dout = din[5] ;
     6'd59 : dout = din[4] ;
     6'd60 : dout = din[3] ;
     6'd61 : dout = din[2] ;
     6'd62 : dout = din[1] ;
     6'd63 : dout = din[0] ;
   endcase

endmodule // mux_r64to1




module niu_pio_mux_2to1_x144(dout, select, din1, din0);
 input           select;
 input  [143:0]  din1, din0;
 output [143:0]  dout;

 wire   [143:0]  din1, din0, dout;

// Use the following code when IBM is NOT used as founder   
 assign  dout = select ? din1 : din0;

 
endmodule // niu_pio_mux_2to1_x144



