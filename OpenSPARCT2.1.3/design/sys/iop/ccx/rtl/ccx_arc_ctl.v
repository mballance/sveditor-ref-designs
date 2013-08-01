// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ccx_arc_ctl.v
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
`ifndef FPGA
module ccx_arc_ctl (
  grant_a, 
  req_pkt_empty_a, 
  direction, 
  write_fifo_a, 
  fifo_rptr_a, 
  fifo_read_select, 
  input_req_sel_a, 
  input_req_sel_a_, 
  fifo_req_sel_a, 
  qfullbar_a, 
  atom_x, 
  arb_qsel0_a, 
  arb_qsel1_a, 
  arb_shift_a, 
  arb_q0_holdbar_a, 
  atom_a, 
  req_a, 
  tcu_scan_en, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  ccx_aclk, 
  ccx_bclk, 
  scan_out);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire [8:0] input_req_a;
wire [8:0] qfull_a;
wire inreg_req_vld_a;
wire wr_en_a;
wire fifo_empty_a;
wire wptr_eq17;
wire [4:0] wptr_a;
wire [4:0] wptr_next;
wire dff_wptr_scanin;
wire dff_wptr_scanout;
wire rd_en_a;
wire rptr_eq17;
wire [4:0] rptr_a;
wire [4:0] rptr_next;
wire dff_rptr_scanin;
wire dff_rptr_scanout;
wire fifo_bypass_a;
wire [17:0] wptr_dcd_a;
wire input_req_sel_q;
wire input_req_sel_q_;
wire dff_inreg_select_scanin;
wire dff_inreg_select_scanout;
wire dff_inreg_select__scanin;
wire dff_inreg_select__scanout;
wire direction_in;
wire dff_dir_scanin;
wire dff_dir_scanout;
wire q0_scanin;
wire q0_scanout;
wire q1_scanin;
wire q1_scanout;
wire q2_scanin;
wire q2_scanout;
wire q3_scanin;
wire q3_scanout;
wire q4_scanin;
wire q4_scanout;
wire q5_scanin;
wire q5_scanout;
wire q6_scanin;
wire q6_scanout;
wire q7_scanin;
wire q7_scanout;
wire q8_scanin;
wire q8_scanout;
wire spares_scanin;
wire spares_scanout;


// input from arbdp
input [8:0]   grant_a;             // one-hot grant bit for each source
input         req_pkt_empty_a;     // request register is empty

// Interface with arbdp
output        direction;	       // PE direction controls
output [17:0] write_fifo_a;        // write pointer
output [2:0]  fifo_rptr_a;         // read pointer
output [1:0]  fifo_read_select;    // read select
output        input_req_sel_a;     // select for input mux
output        input_req_sel_a_;     // select for input mux
output        fifo_req_sel_a;      // select for request  mux
//output        current_req_sel_a;   // select for request mux
output [8:0]  qfullbar_a;          // src queue full indicator
output [8:0]  atom_x;              // atomic request indicator from srq


//Outputs to datapaths
output [8:0]  arb_qsel0_a;         // queue0 select
output [8:0]  arb_qsel1_a;         // queue1 select
output [8:0]  arb_shift_a;         // queue shift
output [8:0]  arb_q0_holdbar_a;        // q0 hold


//Inputs from sources
input [8:0]   atom_a;
input [8:0]   req_a;

//Globals
input tcu_scan_en ;
input           l2clk;
input           scan_in;
input           tcu_pce_ov;             // scan signals
input           ccx_aclk;
input           ccx_bclk;
output          scan_out;

// scan renames
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = ccx_aclk;
assign soclk = ccx_bclk;
assign se = tcu_scan_en ;
// end scan

//////////////////////////////
// Clock header
//////////////////////////////
ccx_arc_ctl_l1clkhdr_ctl_macro clkgen 
  (
   .l2clk  (l2clk),
   .l1en   (1'b1 ),
   .l1clk  (l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
   );
//////////////////////////////////////////////////////////////////////
// DATAPATH STRUCTURE
//
//                                               req_q
//                                                 |
//                                                 |
//                                           -------------    
//                                          |  input reg  |   
//                                           -------------    
//                                                 |           
//     --------------------------------------------|---------           
//     |                                           |         |
//     |        ------------                       |         |
//     |        |          |                       v         |   
//     v        v          |                 -------------   |
//  ----------------       |                |    FIFO     |  |
//  \  input mux   /       |                |             |  |
//   --------------        |                |             |  |
//         |               |                |             |  |
//     ----------          |                 -------------   |
//     |        |          |                       |         |
//     v        v          |                       v         v
//  -------  -------       |                    ----------------    
// |  ASC  || DESC  |      |                    \  bypass mux  /<--------fifo_bypass             
// |  P E  || P E   |      |                     --------------     
// |       ||       |      |                            |                             
// |       ||       |      |      --------------        |
//  -------  -------       |     |              |       |                                    
//     |        |          |     |              v       v                                
//     v        v          |     |           ----------------                              
//  ----------------       |     |           \ request mux  / <--------current_req_sel     
//  \  dir mux     /       |     |            \            /  <--------fifo_req_sel        
//   --------------        |     |             ------------   
//         |               |     |                  |                                      
//         |-----grant-----|-----                   v                                      
//         |     qual      |                   -------------                               
//         |               |                  | request reg |                              
//         |               |                   -------------                                
//         |               |                       |                                       
//         v               |                       |                                       
//       grant             |                       v                                       
//                          -----------------------                                        
//
//////////////////////////////////////////////////////////////////////
// PIPELINE
// Consider case where REQ A has 3 requests, followed by REQ B which has 1
// request and REQ C.
//
//
// input reg     |REQ A|REQ B|     |REQ C|     |REQ D|REQ E|     |     |
//               |     |     |     |     |     |     |     |     |     |
//               |     |     |     |     |     |     |     |     |     |
//--------------------------------------------------------------------------
// input mux     |IN   |REQ  |REQ  |REQ  |REQ  |IN   |REQ  |REQ  |     |
//               |     |     |     |     |     |     |     |     |     |
//               |     |     |     |     |     |     |     |     |     |
//--------------------------------------------------------------------------
// FIFO          |     |     |REQ B|     |     |     |     |REQ E|     |
//               |     |     |     |     |     |     |     |     |     |
//               |     |     |     |     |     |     |     |     |     |
//--------------------------------------------------------------------------
// request mux   |REQ  |REQ  |FIFO |BYP  |     |REQ   |REQ |FIFO |     |
//               |     |     |     |     |     |     |     |     |     |
//               |     |     |     |     |     |     |     |     |     |
//--------------------------------------------------------------------------
// request reg   |     |REQ A|REQ A|REQ B|REQ C|     |REQ D|REQ D|REQ E|
//               |     |     |     |     |     |     |     |     |     |
//               |     |     |     |     |     |     |     |     |     |
//--------------------------------------------------------------------------
// grant         | A   | A   | A   | B   |C    | D   | D   | D   | E   |
//               |     |     |     |     |     |     |     |     |     |
//               |     |     |     |     |     |     |     |     |     |
//--------------------------------------------------------------------------
//


// Do not accept a request for a queue that is full.
assign input_req_a[8:0] = req_a[8:0] & ~qfull_a[8:0];
// see if any valid requests in flopped input request packet.
assign inreg_req_vld_a = |(input_req_a[8:0]);

// 

assign wr_en_a = ~input_req_sel_a & inreg_req_vld_a & 
                 (~req_pkt_empty_a | ~fifo_empty_a);


// 18 entry fifo must wrap to zero when counter equals 17.
assign wptr_eq17 = (wptr_a[4:0] == 5'b10001);
assign wptr_next[4:0] = (wr_en_a ? (wptr_eq17 ? 5'b00000 : wptr_a[4:0] + 5'b00001) : wptr_a[4:0]);


ccx_arc_ctl_msff_ctl_macro__width_5 dff_wptr  
(
 .scan_in(dff_wptr_scanin),
 .scan_out(dff_wptr_scanout),
 .din		(wptr_next[4:0]),
 .dout		(wptr_a[4:0]),
 .l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
 );

//assign rd_en_a = req_pkt_empty_a & ~fifo_empty_a & ~input_req_sel_a;
assign rd_en_a = req_pkt_empty_a & ~fifo_empty_a;

// 18 entry fifo must wrap to zero when counter equals 17.
assign rptr_eq17 = (rptr_a[4:0] == 5'b10001);
assign rptr_next[4:0] = (rd_en_a ? (rptr_eq17 ? 5'b00000 : rptr_a[4:0] + 5'b00001) : rptr_a[4:0]);

ccx_arc_ctl_msff_ctl_macro__width_5 dff_rptr  
(
 .scan_in(dff_rptr_scanin),
 .scan_out(dff_rptr_scanout),
 .din		(rptr_next[4:0]),
 .dout		(rptr_a[4:0]),
 .l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
 );

// Bits 2:0 of rdptr are used for the first level decode of the FIFO muxes
// The final FIFO mux is a four input mux with the following select
// assignments.
// sel[1:0] - input
//    00    - muxed result of entries 7:0
//    01    - muxed result of entries 15:8
//    10    - muxed result of entries 17:16
//    11    - bypass data
assign fifo_rptr_a[2:0] = rptr_a[2:0];
assign fifo_read_select[1:0] = rptr_a[4:3] | {2{fifo_bypass_a}};

assign fifo_empty_a = (rptr_a[4:0] == wptr_a[4:0]);


// Bypass valid input requests around the FIFO when it's empty.
// FIFO gets bypassed under following condition:
// 1. Request register was selected by input mux,
// 2. FIFO is empty
// 3. Input register is valid
// 4. Request packet goes empty.
// Following equation does not fully qualify the bypass condition.
// 
assign fifo_bypass_a = fifo_empty_a & inreg_req_vld_a;

// decode write pointer 
assign wptr_dcd_a[0]  =  (~wptr_a[4] & ~wptr_a[3] & ~wptr_a[2] & ~wptr_a[1] & ~wptr_a[0]);
assign wptr_dcd_a[1]  =  (~wptr_a[4] & ~wptr_a[3] & ~wptr_a[2] & ~wptr_a[1] &  wptr_a[0]);
assign wptr_dcd_a[2]  =  (~wptr_a[4] & ~wptr_a[3] & ~wptr_a[2] &  wptr_a[1] & ~wptr_a[0]);
assign wptr_dcd_a[3]  =  (~wptr_a[4] & ~wptr_a[3] & ~wptr_a[2] &  wptr_a[1] &  wptr_a[0]);
assign wptr_dcd_a[4]  =  (~wptr_a[4] & ~wptr_a[3] &  wptr_a[2] & ~wptr_a[1] & ~wptr_a[0]);
assign wptr_dcd_a[5]  =  (~wptr_a[4] & ~wptr_a[3] &  wptr_a[2] & ~wptr_a[1] &  wptr_a[0]);
assign wptr_dcd_a[6]  =  (~wptr_a[4] & ~wptr_a[3] &  wptr_a[2] &  wptr_a[1] & ~wptr_a[0]);
assign wptr_dcd_a[7]  =  (~wptr_a[4] & ~wptr_a[3] &  wptr_a[2] &  wptr_a[1] &  wptr_a[0]);
assign wptr_dcd_a[8]  =  (~wptr_a[4] &  wptr_a[3] & ~wptr_a[2] & ~wptr_a[1] & ~wptr_a[0]);
assign wptr_dcd_a[9]  =  (~wptr_a[4] &  wptr_a[3] & ~wptr_a[2] & ~wptr_a[1] &  wptr_a[0]);
assign wptr_dcd_a[10] =  (~wptr_a[4] &  wptr_a[3] & ~wptr_a[2] &  wptr_a[1] & ~wptr_a[0]);
assign wptr_dcd_a[11] =  (~wptr_a[4] &  wptr_a[3] & ~wptr_a[2] &  wptr_a[1] &  wptr_a[0]);
assign wptr_dcd_a[12] =  (~wptr_a[4] &  wptr_a[3] &  wptr_a[2] & ~wptr_a[1] & ~wptr_a[0]);
assign wptr_dcd_a[13] =  (~wptr_a[4] &  wptr_a[3] &  wptr_a[2] & ~wptr_a[1] &  wptr_a[0]);
assign wptr_dcd_a[14] =  (~wptr_a[4] &  wptr_a[3] &  wptr_a[2] &  wptr_a[1] & ~wptr_a[0]);
assign wptr_dcd_a[15] =  (~wptr_a[4] &  wptr_a[3] &  wptr_a[2] &  wptr_a[1] &  wptr_a[0]);
assign wptr_dcd_a[16] =  ( wptr_a[4] & ~wptr_a[3] & ~wptr_a[2] & ~wptr_a[1] & ~wptr_a[0]);
assign wptr_dcd_a[17] =  ( wptr_a[4] & ~wptr_a[3] & ~wptr_a[2] & ~wptr_a[1] &  wptr_a[0]);

// Qualify with the wr_en_a signal.  This isn't functionally necessary, but
// it does keep the clocks from toggling unless the FIFO needs to be written.
//assign write_fifo_a[17:0] = wptr_dcd_a[17:0] & {18{wr_en_a}};
// write enable timing is very tight.
assign write_fifo_a[17:0] = wptr_dcd_a[17:0];


// END FIFO LOGIC

// MUX CONTROLS


assign input_req_sel_q = (req_pkt_empty_a & fifo_empty_a & ~inreg_req_vld_a) | 
                         (req_pkt_empty_a & input_req_sel_a);


assign fifo_req_sel_a = req_pkt_empty_a & (~fifo_empty_a | (inreg_req_vld_a & ~input_req_sel_a));

assign input_req_sel_q_ = ~input_req_sel_q;

ccx_arc_ctl_msff_ctl_macro dff_inreg_select 
  (
   .scan_in(dff_inreg_select_scanin),
   .scan_out(dff_inreg_select_scanout),
   .din		(input_req_sel_q),
   .dout		(input_req_sel_a),
   .l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
   );

ccx_arc_ctl_msff_ctl_macro dff_inreg_select_x 
  (
   .scan_in(dff_inreg_select__scanin),
   .scan_out(dff_inreg_select__scanout),
   .din		(input_req_sel_q_),
   .dout		(input_req_sel_a_),
   .l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
   );



//assign direction_in = (current_req_sel_a ~^ direction);
assign direction_in = ~direction;

ccx_arc_ctl_msff_ctl_macro dff_dir 
  (
   .scan_in(dff_dir_scanin),
   .scan_out(dff_dir_scanout),
   .din		(direction_in),
   .dout		(direction),
   .l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
   );


//assign dira = ~stall_a & direction;
//assign dird = ~stall_a & ~direction;


// ARB SRC Q LOGIC
///*
// ccx_srq_ctl    AUTO_TEMPLATE(
// // Outputs
// .scan_in(AUTO_TEMPLATE_scanin),
// .scan_out(AUTO_TEMPLATE_scanout),
// .qfull_a		(qfull_a[@]),
// .qfullbar_a		(qfullbar_a[@]),
// .qsel0_a		(arb_qsel0_a[@]),
// .qsel1_a		(arb_qsel1_a[@]),
// .shift_a	(arb_shift_a[@]),
// .q0_holdbar_a	(arb_q0_holdbar_a[@]),
// .atom_x(atom_x[@]),
// // Inputs
// .req_q		(src@_arb_req_q),
// .atom_q		(src@_arb_atom_q),
// .grant_a	(grant_a[@]));
//  */

ccx_srq_ctl q0 (
/*AUTOINST*/
                // Outputs
                .scan_in(q0_scanin),
                .scan_out(q0_scanout),
                .qfull_a                (qfull_a[0]),            // Templated
                .qfullbar_a             (qfullbar_a[0]),         // Templated
                .qsel0_a                (arb_qsel0_a[0]),        // Templated
                .qsel1_a                (arb_qsel1_a[0]),        // Templated
                .shift_a                (arb_shift_a[0]),        // Templated
                .q0_holdbar_a           (arb_q0_holdbar_a[0]),   // Templated
                .atom_x                 (atom_x[0]),             // Templated
                // Inputs
                .req_a                  (req_a[0]),              // Templated
                .atom_a                 (atom_a[0]),             // Templated
                .grant_a                (grant_a[0]),            // Templated
                .l1clk                  (l1clk),
  .ccx_aclk(ccx_aclk),
  .ccx_bclk(ccx_bclk));		 

ccx_srq_ctl q1 (
/*AUTOINST*/
                // Outputs
                .scan_in(q1_scanin),
                .scan_out(q1_scanout),
                .qfull_a                (qfull_a[1]),            // Templated
                .qfullbar_a             (qfullbar_a[1]),         // Templated
                .qsel0_a                (arb_qsel0_a[1]),        // Templated
                .qsel1_a                (arb_qsel1_a[1]),        // Templated
                .shift_a                (arb_shift_a[1]),        // Templated
                .q0_holdbar_a           (arb_q0_holdbar_a[1]),   // Templated
                .atom_x                 (atom_x[1]),             // Templated
                // Inputs
                .req_a                  (req_a[1]),              // Templated
                .atom_a                 (atom_a[1]),             // Templated
                .grant_a                (grant_a[1]),            // Templated
                .l1clk                  (l1clk),
  .ccx_aclk(ccx_aclk),
  .ccx_bclk(ccx_bclk));		 

ccx_srq_ctl q2 (
/*AUTOINST*/
                // Outputs
                .scan_in(q2_scanin),
                .scan_out(q2_scanout),
                .qfull_a                (qfull_a[2]),            // Templated
                .qfullbar_a             (qfullbar_a[2]),         // Templated
                .qsel0_a                (arb_qsel0_a[2]),        // Templated
                .qsel1_a                (arb_qsel1_a[2]),        // Templated
                .shift_a                (arb_shift_a[2]),        // Templated
                .q0_holdbar_a           (arb_q0_holdbar_a[2]),   // Templated
                .atom_x                 (atom_x[2]),             // Templated
                // Inputs
                .req_a                  (req_a[2]),              // Templated
                .atom_a                 (atom_a[2]),             // Templated
                .grant_a                (grant_a[2]),            // Templated
                .l1clk                  (l1clk),
  .ccx_aclk(ccx_aclk),
  .ccx_bclk(ccx_bclk));		 

ccx_srq_ctl q3 (
/*AUTOINST*/
                // Outputs
                .scan_in(q3_scanin),
                .scan_out(q3_scanout),
                .qfull_a                (qfull_a[3]),            // Templated
                .qfullbar_a             (qfullbar_a[3]),         // Templated
                .qsel0_a                (arb_qsel0_a[3]),        // Templated
                .qsel1_a                (arb_qsel1_a[3]),        // Templated
                .shift_a                (arb_shift_a[3]),        // Templated
                .q0_holdbar_a           (arb_q0_holdbar_a[3]),   // Templated
                .atom_x                 (atom_x[3]),             // Templated
                // Inputs
                .req_a                  (req_a[3]),              // Templated
                .atom_a                 (atom_a[3]),             // Templated
                .grant_a                (grant_a[3]),            // Templated
                .l1clk                  (l1clk),
  .ccx_aclk(ccx_aclk),
  .ccx_bclk(ccx_bclk));		 

ccx_srq_ctl q4 (
/*AUTOINST*/
                // Outputs
                .scan_in(q4_scanin),
                .scan_out(q4_scanout),
                .qfull_a                (qfull_a[4]),            // Templated
                .qfullbar_a             (qfullbar_a[4]),         // Templated
                .qsel0_a                (arb_qsel0_a[4]),        // Templated
                .qsel1_a                (arb_qsel1_a[4]),        // Templated
                .shift_a                (arb_shift_a[4]),        // Templated
                .q0_holdbar_a           (arb_q0_holdbar_a[4]),   // Templated
                .atom_x                 (atom_x[4]),             // Templated
                // Inputs
                .req_a                  (req_a[4]),              // Templated
                .atom_a                 (atom_a[4]),             // Templated
                .grant_a                (grant_a[4]),            // Templated
                .l1clk                  (l1clk),
  .ccx_aclk(ccx_aclk),
  .ccx_bclk(ccx_bclk));		 

ccx_srq_ctl q5 (
/*AUTOINST*/
                // Outputs
                .scan_in(q5_scanin),
                .scan_out(q5_scanout),
                .qfull_a                (qfull_a[5]),            // Templated
                .qfullbar_a             (qfullbar_a[5]),         // Templated
                .qsel0_a                (arb_qsel0_a[5]),        // Templated
                .qsel1_a                (arb_qsel1_a[5]),        // Templated
                .shift_a                (arb_shift_a[5]),        // Templated
                .q0_holdbar_a           (arb_q0_holdbar_a[5]),   // Templated
                .atom_x                 (atom_x[5]),             // Templated
                // Inputs
                .req_a                  (req_a[5]),              // Templated
                .atom_a                 (atom_a[5]),             // Templated
                .grant_a                (grant_a[5]),            // Templated
                .l1clk                  (l1clk),
  .ccx_aclk(ccx_aclk),
  .ccx_bclk(ccx_bclk));		 

ccx_srq_ctl q6 (
/*AUTOINST*/
                // Outputs
                .scan_in(q6_scanin),
                .scan_out(q6_scanout),
                .qfull_a                (qfull_a[6]),            // Templated
                .qfullbar_a             (qfullbar_a[6]),         // Templated
                .qsel0_a                (arb_qsel0_a[6]),        // Templated
                .qsel1_a                (arb_qsel1_a[6]),        // Templated
                .shift_a                (arb_shift_a[6]),        // Templated
                .q0_holdbar_a           (arb_q0_holdbar_a[6]),   // Templated
                .atom_x                 (atom_x[6]),             // Templated
                // Inputs
                .req_a                  (req_a[6]),              // Templated
                .atom_a                 (atom_a[6]),             // Templated
                .grant_a                (grant_a[6]),            // Templated
                .l1clk                  (l1clk),
  .ccx_aclk(ccx_aclk),
  .ccx_bclk(ccx_bclk));		 

ccx_srq_ctl q7 (
/*AUTOINST*/
                // Outputs
                .scan_in(q7_scanin),
                .scan_out(q7_scanout),
                .qfull_a                (qfull_a[7]),            // Templated
                .qfullbar_a             (qfullbar_a[7]),         // Templated
                .qsel0_a                (arb_qsel0_a[7]),        // Templated
                .qsel1_a                (arb_qsel1_a[7]),        // Templated
                .shift_a                (arb_shift_a[7]),        // Templated
                .q0_holdbar_a           (arb_q0_holdbar_a[7]),   // Templated
                .atom_x                 (atom_x[7]),             // Templated
                // Inputs
                .req_a                  (req_a[7]),              // Templated
                .atom_a                 (atom_a[7]),             // Templated
                .grant_a                (grant_a[7]),            // Templated
                .l1clk                  (l1clk),
  .ccx_aclk(ccx_aclk),
  .ccx_bclk(ccx_bclk));		 

ccx_srq_ctl q8 (
/*AUTOINST*/
                // Outputs
                .scan_in(q8_scanin),
                .scan_out(q8_scanout),
                .qfull_a                (qfull_a[8]),            // Templated
                .qfullbar_a             (qfullbar_a[8]),         // Templated
                .qsel0_a                (arb_qsel0_a[8]),        // Templated
                .qsel1_a                (arb_qsel1_a[8]),        // Templated
                .shift_a                (arb_shift_a[8]),        // Templated
                .q0_holdbar_a           (arb_q0_holdbar_a[8]),   // Templated
                .atom_x                 (atom_x[8]),             // Templated
                // Inputs
                .req_a                  (req_a[8]),              // Templated
                .atom_a                 (atom_a[8]),             // Templated
                .grant_a                (grant_a[8]),            // Templated
                .l1clk                  (l1clk),
  .ccx_aclk(ccx_aclk),
  .ccx_bclk(ccx_bclk));		 


////////////////////////////////////////////////////////
// SPARE CELLS
////////////////////////////////////////////////////////
ccx_arc_ctl_spare_ctl_macro__num_10 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
////////////////////////////////////////////////////////

// fixscan start:
assign dff_wptr_scanin           = scan_in                  ;
assign dff_rptr_scanin           = dff_wptr_scanout         ;
assign dff_inreg_select_scanin   = dff_rptr_scanout         ;
assign dff_inreg_select__scanin  = dff_inreg_select_scanout ;
assign dff_dir_scanin            = dff_inreg_select__scanout;
assign q0_scanin                 = dff_dir_scanout          ;
assign q1_scanin                 = q0_scanout               ;
assign q2_scanin                 = q1_scanout               ;
assign q3_scanin                 = q2_scanout               ;
assign q4_scanin                 = q3_scanout               ;
assign q5_scanin                 = q4_scanout               ;
assign q6_scanin                 = q5_scanout               ;
assign q7_scanin                 = q6_scanout               ;
assign q8_scanin                 = q7_scanout               ;
assign spares_scanin             = q8_scanout               ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule

// Local Variables:
// verilog-library-directories:("." "v")
// End:






// any PARAMS parms go into naming of macro

module ccx_arc_ctl_l1clkhdr_ctl_macro (
  l2clk, 
  l1en, 
  pce_ov, 
  stop, 
  se, 
  l1clk);


  input l2clk;
  input l1en;
  input pce_ov;
  input stop;
  input se;
  output l1clk;



 

cl_sc1_l1hdr_8x c_0 (


   .l2clk(l2clk),
   .pce(l1en),
   .l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop)
);



endmodule













// any PARAMS parms go into naming of macro

module ccx_arc_ctl_msff_ctl_macro__width_5 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = din[4:0];






dff #(5)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4:0]),
.si({scan_in,so[3:0]}),
.so({so[3:0],scan_out}),
.q(dout[4:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ccx_arc_ctl_msff_ctl_macro (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0];






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);












endmodule



//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module ccx_arc_ctl_spare_ctl_macro__num_10 (
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  scan_out);
wire si_0;
wire so_0;
wire spare0_flop_unused;
wire spare0_buf_32x_unused;
wire spare0_nand3_8x_unused;
wire spare0_inv_8x_unused;
wire spare0_aoi22_4x_unused;
wire spare0_buf_8x_unused;
wire spare0_oai22_4x_unused;
wire spare0_inv_16x_unused;
wire spare0_nand2_16x_unused;
wire spare0_nor3_4x_unused;
wire spare0_nand2_8x_unused;
wire spare0_buf_16x_unused;
wire spare0_nor2_16x_unused;
wire spare0_inv_32x_unused;
wire si_1;
wire so_1;
wire spare1_flop_unused;
wire spare1_buf_32x_unused;
wire spare1_nand3_8x_unused;
wire spare1_inv_8x_unused;
wire spare1_aoi22_4x_unused;
wire spare1_buf_8x_unused;
wire spare1_oai22_4x_unused;
wire spare1_inv_16x_unused;
wire spare1_nand2_16x_unused;
wire spare1_nor3_4x_unused;
wire spare1_nand2_8x_unused;
wire spare1_buf_16x_unused;
wire spare1_nor2_16x_unused;
wire spare1_inv_32x_unused;
wire si_2;
wire so_2;
wire spare2_flop_unused;
wire spare2_buf_32x_unused;
wire spare2_nand3_8x_unused;
wire spare2_inv_8x_unused;
wire spare2_aoi22_4x_unused;
wire spare2_buf_8x_unused;
wire spare2_oai22_4x_unused;
wire spare2_inv_16x_unused;
wire spare2_nand2_16x_unused;
wire spare2_nor3_4x_unused;
wire spare2_nand2_8x_unused;
wire spare2_buf_16x_unused;
wire spare2_nor2_16x_unused;
wire spare2_inv_32x_unused;
wire si_3;
wire so_3;
wire spare3_flop_unused;
wire spare3_buf_32x_unused;
wire spare3_nand3_8x_unused;
wire spare3_inv_8x_unused;
wire spare3_aoi22_4x_unused;
wire spare3_buf_8x_unused;
wire spare3_oai22_4x_unused;
wire spare3_inv_16x_unused;
wire spare3_nand2_16x_unused;
wire spare3_nor3_4x_unused;
wire spare3_nand2_8x_unused;
wire spare3_buf_16x_unused;
wire spare3_nor2_16x_unused;
wire spare3_inv_32x_unused;
wire si_4;
wire so_4;
wire spare4_flop_unused;
wire spare4_buf_32x_unused;
wire spare4_nand3_8x_unused;
wire spare4_inv_8x_unused;
wire spare4_aoi22_4x_unused;
wire spare4_buf_8x_unused;
wire spare4_oai22_4x_unused;
wire spare4_inv_16x_unused;
wire spare4_nand2_16x_unused;
wire spare4_nor3_4x_unused;
wire spare4_nand2_8x_unused;
wire spare4_buf_16x_unused;
wire spare4_nor2_16x_unused;
wire spare4_inv_32x_unused;
wire si_5;
wire so_5;
wire spare5_flop_unused;
wire spare5_buf_32x_unused;
wire spare5_nand3_8x_unused;
wire spare5_inv_8x_unused;
wire spare5_aoi22_4x_unused;
wire spare5_buf_8x_unused;
wire spare5_oai22_4x_unused;
wire spare5_inv_16x_unused;
wire spare5_nand2_16x_unused;
wire spare5_nor3_4x_unused;
wire spare5_nand2_8x_unused;
wire spare5_buf_16x_unused;
wire spare5_nor2_16x_unused;
wire spare5_inv_32x_unused;
wire si_6;
wire so_6;
wire spare6_flop_unused;
wire spare6_buf_32x_unused;
wire spare6_nand3_8x_unused;
wire spare6_inv_8x_unused;
wire spare6_aoi22_4x_unused;
wire spare6_buf_8x_unused;
wire spare6_oai22_4x_unused;
wire spare6_inv_16x_unused;
wire spare6_nand2_16x_unused;
wire spare6_nor3_4x_unused;
wire spare6_nand2_8x_unused;
wire spare6_buf_16x_unused;
wire spare6_nor2_16x_unused;
wire spare6_inv_32x_unused;
wire si_7;
wire so_7;
wire spare7_flop_unused;
wire spare7_buf_32x_unused;
wire spare7_nand3_8x_unused;
wire spare7_inv_8x_unused;
wire spare7_aoi22_4x_unused;
wire spare7_buf_8x_unused;
wire spare7_oai22_4x_unused;
wire spare7_inv_16x_unused;
wire spare7_nand2_16x_unused;
wire spare7_nor3_4x_unused;
wire spare7_nand2_8x_unused;
wire spare7_buf_16x_unused;
wire spare7_nor2_16x_unused;
wire spare7_inv_32x_unused;
wire si_8;
wire so_8;
wire spare8_flop_unused;
wire spare8_buf_32x_unused;
wire spare8_nand3_8x_unused;
wire spare8_inv_8x_unused;
wire spare8_aoi22_4x_unused;
wire spare8_buf_8x_unused;
wire spare8_oai22_4x_unused;
wire spare8_inv_16x_unused;
wire spare8_nand2_16x_unused;
wire spare8_nor3_4x_unused;
wire spare8_nand2_8x_unused;
wire spare8_buf_16x_unused;
wire spare8_nor2_16x_unused;
wire spare8_inv_32x_unused;
wire si_9;
wire so_9;
wire spare9_flop_unused;
wire spare9_buf_32x_unused;
wire spare9_nand3_8x_unused;
wire spare9_inv_8x_unused;
wire spare9_aoi22_4x_unused;
wire spare9_buf_8x_unused;
wire spare9_oai22_4x_unused;
wire spare9_inv_16x_unused;
wire spare9_nand2_16x_unused;
wire spare9_nor3_4x_unused;
wire spare9_nand2_8x_unused;
wire spare9_buf_16x_unused;
wire spare9_nor2_16x_unused;
wire spare9_inv_32x_unused;


input		l1clk;
input		scan_in;
input		siclk;
input		soclk;
output		scan_out;

cl_sc1_msff_8x spare0_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_0),
                               .so(so_0),
                               .d(1'b0),
                               .q(spare0_flop_unused));
assign si_0 = scan_in;

cl_u1_buf_32x   spare0_buf_32x (.in(1'b1),
                                   .out(spare0_buf_32x_unused));
cl_u1_nand3_8x spare0_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare0_nand3_8x_unused));
cl_u1_inv_8x    spare0_inv_8x (.in(1'b1),
                                  .out(spare0_inv_8x_unused));
cl_u1_aoi22_4x spare0_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_aoi22_4x_unused));
cl_u1_buf_8x    spare0_buf_8x (.in(1'b1),
                                  .out(spare0_buf_8x_unused));
cl_u1_oai22_4x spare0_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_oai22_4x_unused));
cl_u1_inv_16x   spare0_inv_16x (.in(1'b1),
                                   .out(spare0_inv_16x_unused));
cl_u1_nand2_16x spare0_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare0_nand2_16x_unused));
cl_u1_nor3_4x spare0_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare0_nor3_4x_unused));
cl_u1_nand2_8x spare0_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare0_nand2_8x_unused));
cl_u1_buf_16x   spare0_buf_16x (.in(1'b1),
                                   .out(spare0_buf_16x_unused));
cl_u1_nor2_16x spare0_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare0_nor2_16x_unused));
cl_u1_inv_32x   spare0_inv_32x (.in(1'b1),
                                   .out(spare0_inv_32x_unused));

cl_sc1_msff_8x spare1_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_1),
                               .so(so_1),
                               .d(1'b0),
                               .q(spare1_flop_unused));
assign si_1 = so_0;

cl_u1_buf_32x   spare1_buf_32x (.in(1'b1),
                                   .out(spare1_buf_32x_unused));
cl_u1_nand3_8x spare1_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare1_nand3_8x_unused));
cl_u1_inv_8x    spare1_inv_8x (.in(1'b1),
                                  .out(spare1_inv_8x_unused));
cl_u1_aoi22_4x spare1_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_aoi22_4x_unused));
cl_u1_buf_8x    spare1_buf_8x (.in(1'b1),
                                  .out(spare1_buf_8x_unused));
cl_u1_oai22_4x spare1_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_oai22_4x_unused));
cl_u1_inv_16x   spare1_inv_16x (.in(1'b1),
                                   .out(spare1_inv_16x_unused));
cl_u1_nand2_16x spare1_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare1_nand2_16x_unused));
cl_u1_nor3_4x spare1_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare1_nor3_4x_unused));
cl_u1_nand2_8x spare1_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare1_nand2_8x_unused));
cl_u1_buf_16x   spare1_buf_16x (.in(1'b1),
                                   .out(spare1_buf_16x_unused));
cl_u1_nor2_16x spare1_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare1_nor2_16x_unused));
cl_u1_inv_32x   spare1_inv_32x (.in(1'b1),
                                   .out(spare1_inv_32x_unused));

cl_sc1_msff_8x spare2_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_2),
                               .so(so_2),
                               .d(1'b0),
                               .q(spare2_flop_unused));
assign si_2 = so_1;

cl_u1_buf_32x   spare2_buf_32x (.in(1'b1),
                                   .out(spare2_buf_32x_unused));
cl_u1_nand3_8x spare2_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare2_nand3_8x_unused));
cl_u1_inv_8x    spare2_inv_8x (.in(1'b1),
                                  .out(spare2_inv_8x_unused));
cl_u1_aoi22_4x spare2_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_aoi22_4x_unused));
cl_u1_buf_8x    spare2_buf_8x (.in(1'b1),
                                  .out(spare2_buf_8x_unused));
cl_u1_oai22_4x spare2_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_oai22_4x_unused));
cl_u1_inv_16x   spare2_inv_16x (.in(1'b1),
                                   .out(spare2_inv_16x_unused));
cl_u1_nand2_16x spare2_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare2_nand2_16x_unused));
cl_u1_nor3_4x spare2_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare2_nor3_4x_unused));
cl_u1_nand2_8x spare2_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare2_nand2_8x_unused));
cl_u1_buf_16x   spare2_buf_16x (.in(1'b1),
                                   .out(spare2_buf_16x_unused));
cl_u1_nor2_16x spare2_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare2_nor2_16x_unused));
cl_u1_inv_32x   spare2_inv_32x (.in(1'b1),
                                   .out(spare2_inv_32x_unused));

cl_sc1_msff_8x spare3_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_3),
                               .so(so_3),
                               .d(1'b0),
                               .q(spare3_flop_unused));
assign si_3 = so_2;

cl_u1_buf_32x   spare3_buf_32x (.in(1'b1),
                                   .out(spare3_buf_32x_unused));
cl_u1_nand3_8x spare3_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare3_nand3_8x_unused));
cl_u1_inv_8x    spare3_inv_8x (.in(1'b1),
                                  .out(spare3_inv_8x_unused));
cl_u1_aoi22_4x spare3_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_aoi22_4x_unused));
cl_u1_buf_8x    spare3_buf_8x (.in(1'b1),
                                  .out(spare3_buf_8x_unused));
cl_u1_oai22_4x spare3_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_oai22_4x_unused));
cl_u1_inv_16x   spare3_inv_16x (.in(1'b1),
                                   .out(spare3_inv_16x_unused));
cl_u1_nand2_16x spare3_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare3_nand2_16x_unused));
cl_u1_nor3_4x spare3_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare3_nor3_4x_unused));
cl_u1_nand2_8x spare3_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare3_nand2_8x_unused));
cl_u1_buf_16x   spare3_buf_16x (.in(1'b1),
                                   .out(spare3_buf_16x_unused));
cl_u1_nor2_16x spare3_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare3_nor2_16x_unused));
cl_u1_inv_32x   spare3_inv_32x (.in(1'b1),
                                   .out(spare3_inv_32x_unused));

cl_sc1_msff_8x spare4_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_4),
                               .so(so_4),
                               .d(1'b0),
                               .q(spare4_flop_unused));
assign si_4 = so_3;

cl_u1_buf_32x   spare4_buf_32x (.in(1'b1),
                                   .out(spare4_buf_32x_unused));
cl_u1_nand3_8x spare4_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare4_nand3_8x_unused));
cl_u1_inv_8x    spare4_inv_8x (.in(1'b1),
                                  .out(spare4_inv_8x_unused));
cl_u1_aoi22_4x spare4_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_aoi22_4x_unused));
cl_u1_buf_8x    spare4_buf_8x (.in(1'b1),
                                  .out(spare4_buf_8x_unused));
cl_u1_oai22_4x spare4_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_oai22_4x_unused));
cl_u1_inv_16x   spare4_inv_16x (.in(1'b1),
                                   .out(spare4_inv_16x_unused));
cl_u1_nand2_16x spare4_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare4_nand2_16x_unused));
cl_u1_nor3_4x spare4_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare4_nor3_4x_unused));
cl_u1_nand2_8x spare4_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare4_nand2_8x_unused));
cl_u1_buf_16x   spare4_buf_16x (.in(1'b1),
                                   .out(spare4_buf_16x_unused));
cl_u1_nor2_16x spare4_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare4_nor2_16x_unused));
cl_u1_inv_32x   spare4_inv_32x (.in(1'b1),
                                   .out(spare4_inv_32x_unused));

cl_sc1_msff_8x spare5_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_5),
                               .so(so_5),
                               .d(1'b0),
                               .q(spare5_flop_unused));
assign si_5 = so_4;

cl_u1_buf_32x   spare5_buf_32x (.in(1'b1),
                                   .out(spare5_buf_32x_unused));
cl_u1_nand3_8x spare5_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare5_nand3_8x_unused));
cl_u1_inv_8x    spare5_inv_8x (.in(1'b1),
                                  .out(spare5_inv_8x_unused));
cl_u1_aoi22_4x spare5_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_aoi22_4x_unused));
cl_u1_buf_8x    spare5_buf_8x (.in(1'b1),
                                  .out(spare5_buf_8x_unused));
cl_u1_oai22_4x spare5_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_oai22_4x_unused));
cl_u1_inv_16x   spare5_inv_16x (.in(1'b1),
                                   .out(spare5_inv_16x_unused));
cl_u1_nand2_16x spare5_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare5_nand2_16x_unused));
cl_u1_nor3_4x spare5_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare5_nor3_4x_unused));
cl_u1_nand2_8x spare5_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare5_nand2_8x_unused));
cl_u1_buf_16x   spare5_buf_16x (.in(1'b1),
                                   .out(spare5_buf_16x_unused));
cl_u1_nor2_16x spare5_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare5_nor2_16x_unused));
cl_u1_inv_32x   spare5_inv_32x (.in(1'b1),
                                   .out(spare5_inv_32x_unused));

cl_sc1_msff_8x spare6_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_6),
                               .so(so_6),
                               .d(1'b0),
                               .q(spare6_flop_unused));
assign si_6 = so_5;

cl_u1_buf_32x   spare6_buf_32x (.in(1'b1),
                                   .out(spare6_buf_32x_unused));
cl_u1_nand3_8x spare6_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare6_nand3_8x_unused));
cl_u1_inv_8x    spare6_inv_8x (.in(1'b1),
                                  .out(spare6_inv_8x_unused));
cl_u1_aoi22_4x spare6_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare6_aoi22_4x_unused));
cl_u1_buf_8x    spare6_buf_8x (.in(1'b1),
                                  .out(spare6_buf_8x_unused));
cl_u1_oai22_4x spare6_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare6_oai22_4x_unused));
cl_u1_inv_16x   spare6_inv_16x (.in(1'b1),
                                   .out(spare6_inv_16x_unused));
cl_u1_nand2_16x spare6_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare6_nand2_16x_unused));
cl_u1_nor3_4x spare6_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare6_nor3_4x_unused));
cl_u1_nand2_8x spare6_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare6_nand2_8x_unused));
cl_u1_buf_16x   spare6_buf_16x (.in(1'b1),
                                   .out(spare6_buf_16x_unused));
cl_u1_nor2_16x spare6_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare6_nor2_16x_unused));
cl_u1_inv_32x   spare6_inv_32x (.in(1'b1),
                                   .out(spare6_inv_32x_unused));

cl_sc1_msff_8x spare7_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_7),
                               .so(so_7),
                               .d(1'b0),
                               .q(spare7_flop_unused));
assign si_7 = so_6;

cl_u1_buf_32x   spare7_buf_32x (.in(1'b1),
                                   .out(spare7_buf_32x_unused));
cl_u1_nand3_8x spare7_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare7_nand3_8x_unused));
cl_u1_inv_8x    spare7_inv_8x (.in(1'b1),
                                  .out(spare7_inv_8x_unused));
cl_u1_aoi22_4x spare7_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_aoi22_4x_unused));
cl_u1_buf_8x    spare7_buf_8x (.in(1'b1),
                                  .out(spare7_buf_8x_unused));
cl_u1_oai22_4x spare7_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_oai22_4x_unused));
cl_u1_inv_16x   spare7_inv_16x (.in(1'b1),
                                   .out(spare7_inv_16x_unused));
cl_u1_nand2_16x spare7_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare7_nand2_16x_unused));
cl_u1_nor3_4x spare7_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare7_nor3_4x_unused));
cl_u1_nand2_8x spare7_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare7_nand2_8x_unused));
cl_u1_buf_16x   spare7_buf_16x (.in(1'b1),
                                   .out(spare7_buf_16x_unused));
cl_u1_nor2_16x spare7_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare7_nor2_16x_unused));
cl_u1_inv_32x   spare7_inv_32x (.in(1'b1),
                                   .out(spare7_inv_32x_unused));

cl_sc1_msff_8x spare8_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_8),
                               .so(so_8),
                               .d(1'b0),
                               .q(spare8_flop_unused));
assign si_8 = so_7;

cl_u1_buf_32x   spare8_buf_32x (.in(1'b1),
                                   .out(spare8_buf_32x_unused));
cl_u1_nand3_8x spare8_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare8_nand3_8x_unused));
cl_u1_inv_8x    spare8_inv_8x (.in(1'b1),
                                  .out(spare8_inv_8x_unused));
cl_u1_aoi22_4x spare8_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_aoi22_4x_unused));
cl_u1_buf_8x    spare8_buf_8x (.in(1'b1),
                                  .out(spare8_buf_8x_unused));
cl_u1_oai22_4x spare8_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_oai22_4x_unused));
cl_u1_inv_16x   spare8_inv_16x (.in(1'b1),
                                   .out(spare8_inv_16x_unused));
cl_u1_nand2_16x spare8_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare8_nand2_16x_unused));
cl_u1_nor3_4x spare8_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare8_nor3_4x_unused));
cl_u1_nand2_8x spare8_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare8_nand2_8x_unused));
cl_u1_buf_16x   spare8_buf_16x (.in(1'b1),
                                   .out(spare8_buf_16x_unused));
cl_u1_nor2_16x spare8_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare8_nor2_16x_unused));
cl_u1_inv_32x   spare8_inv_32x (.in(1'b1),
                                   .out(spare8_inv_32x_unused));

cl_sc1_msff_8x spare9_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_9),
                               .so(so_9),
                               .d(1'b0),
                               .q(spare9_flop_unused));
assign si_9 = so_8;

cl_u1_buf_32x   spare9_buf_32x (.in(1'b1),
                                   .out(spare9_buf_32x_unused));
cl_u1_nand3_8x spare9_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare9_nand3_8x_unused));
cl_u1_inv_8x    spare9_inv_8x (.in(1'b1),
                                  .out(spare9_inv_8x_unused));
cl_u1_aoi22_4x spare9_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_aoi22_4x_unused));
cl_u1_buf_8x    spare9_buf_8x (.in(1'b1),
                                  .out(spare9_buf_8x_unused));
cl_u1_oai22_4x spare9_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_oai22_4x_unused));
cl_u1_inv_16x   spare9_inv_16x (.in(1'b1),
                                   .out(spare9_inv_16x_unused));
cl_u1_nand2_16x spare9_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare9_nand2_16x_unused));
cl_u1_nor3_4x spare9_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare9_nor3_4x_unused));
cl_u1_nand2_8x spare9_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare9_nand2_8x_unused));
cl_u1_buf_16x   spare9_buf_16x (.in(1'b1),
                                   .out(spare9_buf_16x_unused));
cl_u1_nor2_16x spare9_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare9_nor2_16x_unused));
cl_u1_inv_32x   spare9_inv_32x (.in(1'b1),
                                   .out(spare9_inv_32x_unused));
assign scan_out = so_9;



endmodule
`endif // `ifndef FPGA

`ifdef FPGA
module ccx_arc_ctl(grant_a, req_pkt_empty_a, direction, write_fifo_a, 
	fifo_rptr_a, fifo_read_select, input_req_sel_a, input_req_sel_a_, 
	fifo_req_sel_a, qfullbar_a, atom_x, arb_qsel0_a, arb_qsel1_a, 
	arb_shift_a, arb_q0_holdbar_a, atom_a, req_a, tcu_scan_en, l2clk, 
	scan_in, tcu_pce_ov, ccx_aclk, ccx_bclk, scan_out);

	input	[8:0]		grant_a;
	input			req_pkt_empty_a;
	output			direction;
	output	[17:0]		write_fifo_a;
	output	[2:0]		fifo_rptr_a;
	output	[1:0]		fifo_read_select;
	output			input_req_sel_a;
	output			input_req_sel_a_;
	output			fifo_req_sel_a;
	output	[8:0]		qfullbar_a;
	output	[8:0]		atom_x;
	output	[8:0]		arb_qsel0_a;
	output	[8:0]		arb_qsel1_a;
	output	[8:0]		arb_shift_a;
	output	[8:0]		arb_q0_holdbar_a;
	input	[8:0]		atom_a;
	input	[8:0]		req_a;
	input			tcu_scan_en;
	input			l2clk;
	input			scan_in;
	input			tcu_pce_ov;
	input			ccx_aclk;
	input			ccx_bclk;
	output			scan_out;

	wire			pce_ov;
	wire			stop;
	wire			siclk;
	wire			soclk;
	wire			se;
	wire			l1clk;
	wire	[8:0]		input_req_a;
	wire	[8:0]		qfull_a;
	wire			inreg_req_vld_a;
	wire			wr_en_a;
	wire			fifo_empty_a;
	wire			wptr_eq17;
	wire	[4:0]		wptr_a;
	wire	[4:0]		wptr_next;
	wire			dff_wptr_scanin;
	wire			dff_wptr_scanout;
	wire			rd_en_a;
	wire			rptr_eq17;
	wire	[4:0]		rptr_a;
	wire	[4:0]		rptr_next;
	wire			dff_rptr_scanin;
	wire			dff_rptr_scanout;
	wire			fifo_bypass_a;
	wire	[17:0]		wptr_dcd_a;
	wire			input_req_sel_q;
	wire			input_req_sel_q_;
	wire			dff_inreg_select_scanin;
	wire			dff_inreg_select_scanout;
	wire			dff_inreg_select__scanin;
	wire			dff_inreg_select__scanout;
	wire			direction_in;
	wire			dff_dir_scanin;
	wire			dff_dir_scanout;
	wire			q0_scanin;
	wire			q0_scanout;
	wire			q1_scanin;
	wire			q1_scanout;
	wire			q2_scanin;
	wire			q2_scanout;
	wire			q3_scanin;
	wire			q3_scanout;
	wire			q4_scanin;
	wire			q4_scanout;
	wire			q5_scanin;
	wire			q5_scanout;
	wire			q6_scanin;
	wire			q6_scanout;
	wire			q7_scanin;
	wire			q7_scanout;
	wire			q8_scanin;
	wire			q8_scanout;
	wire			spares_scanin;
	wire			spares_scanout;

	assign pce_ov = tcu_pce_ov;
	assign stop = 1'b0;
	assign siclk = ccx_aclk;
	assign soclk = ccx_bclk;
	assign se = tcu_scan_en;
	assign input_req_a[8:0] = (req_a[8:0] & (~qfull_a[8:0]));
	assign inreg_req_vld_a = (|input_req_a[8:0]);
	assign wr_en_a = (((~input_req_sel_a) & inreg_req_vld_a) & ((~
		req_pkt_empty_a) | (~fifo_empty_a)));
	assign wptr_eq17 = (wptr_a[4:0] == 5'b10001);
	assign wptr_next[4:0] = (wr_en_a ? (wptr_eq17 ? 5'b0 : (wptr_a[4:0] + 
		5'b1)) : wptr_a[4:0]);
	assign rd_en_a = (req_pkt_empty_a & (~fifo_empty_a));
	assign rptr_eq17 = (rptr_a[4:0] == 5'b10001);
	assign rptr_next[4:0] = (rd_en_a ? (rptr_eq17 ? 5'b0 : (rptr_a[4:0] + 
		5'b1)) : rptr_a[4:0]);
	assign fifo_rptr_a[2:0] = rptr_a[2:0];
	assign fifo_read_select[1:0] = (rptr_a[4:3] | {2 {fifo_bypass_a}});
	assign fifo_empty_a = (rptr_a[4:0] == wptr_a[4:0]);
	assign fifo_bypass_a = (fifo_empty_a & inreg_req_vld_a);
	assign wptr_dcd_a[0] = (((((~wptr_a[4]) & (~wptr_a[3])) & (~wptr_a[2])) 
		& (~wptr_a[1])) & (~wptr_a[0]));
	assign wptr_dcd_a[1] = (((((~wptr_a[4]) & (~wptr_a[3])) & (~wptr_a[2])) 
		& (~wptr_a[1])) & wptr_a[0]);
	assign wptr_dcd_a[2] = (((((~wptr_a[4]) & (~wptr_a[3])) & (~wptr_a[2])) 
		& wptr_a[1]) & (~wptr_a[0]));
	assign wptr_dcd_a[3] = (((((~wptr_a[4]) & (~wptr_a[3])) & (~wptr_a[2])) 
		& wptr_a[1]) & wptr_a[0]);
	assign wptr_dcd_a[4] = (((((~wptr_a[4]) & (~wptr_a[3])) & wptr_a[2]) & (
		~wptr_a[1])) & (~wptr_a[0]));
	assign wptr_dcd_a[5] = (((((~wptr_a[4]) & (~wptr_a[3])) & wptr_a[2]) & (
		~wptr_a[1])) & wptr_a[0]);
	assign wptr_dcd_a[6] = (((((~wptr_a[4]) & (~wptr_a[3])) & wptr_a[2]) & 
		wptr_a[1]) & (~wptr_a[0]));
	assign wptr_dcd_a[7] = (((((~wptr_a[4]) & (~wptr_a[3])) & wptr_a[2]) & 
		wptr_a[1]) & wptr_a[0]);
	assign wptr_dcd_a[8] = (((((~wptr_a[4]) & wptr_a[3]) & (~wptr_a[2])) & (
		~wptr_a[1])) & (~wptr_a[0]));
	assign wptr_dcd_a[9] = (((((~wptr_a[4]) & wptr_a[3]) & (~wptr_a[2])) & (
		~wptr_a[1])) & wptr_a[0]);
	assign wptr_dcd_a[10] = (((((~wptr_a[4]) & wptr_a[3]) & (~wptr_a[2])) & 
		wptr_a[1]) & (~wptr_a[0]));
	assign wptr_dcd_a[11] = (((((~wptr_a[4]) & wptr_a[3]) & (~wptr_a[2])) & 
		wptr_a[1]) & wptr_a[0]);
	assign wptr_dcd_a[12] = (((((~wptr_a[4]) & wptr_a[3]) & wptr_a[2]) & (~
		wptr_a[1])) & (~wptr_a[0]));
	assign wptr_dcd_a[13] = (((((~wptr_a[4]) & wptr_a[3]) & wptr_a[2]) & (~
		wptr_a[1])) & wptr_a[0]);
	assign wptr_dcd_a[14] = (((((~wptr_a[4]) & wptr_a[3]) & wptr_a[2]) & 
		wptr_a[1]) & (~wptr_a[0]));
	assign wptr_dcd_a[15] = (((((~wptr_a[4]) & wptr_a[3]) & wptr_a[2]) & 
		wptr_a[1]) & wptr_a[0]);
	assign wptr_dcd_a[16] = ((((wptr_a[4] & (~wptr_a[3])) & (~wptr_a[2])) & 
		(~wptr_a[1])) & (~wptr_a[0]));
	assign wptr_dcd_a[17] = ((((wptr_a[4] & (~wptr_a[3])) & (~wptr_a[2])) & 
		(~wptr_a[1])) & wptr_a[0]);
	assign write_fifo_a[17:0] = wptr_dcd_a[17:0];
	assign input_req_sel_q = (((req_pkt_empty_a & fifo_empty_a) & (~
		inreg_req_vld_a)) | (req_pkt_empty_a & input_req_sel_a));
	assign fifo_req_sel_a = (req_pkt_empty_a & ((~fifo_empty_a) | (
		inreg_req_vld_a & (~input_req_sel_a))));
	assign input_req_sel_q_ = (~input_req_sel_q);
	assign direction_in = (~direction);
	assign dff_wptr_scanin = scan_in;
	assign dff_rptr_scanin = dff_wptr_scanout;
	assign dff_inreg_select_scanin = dff_rptr_scanout;
	assign dff_inreg_select__scanin = dff_inreg_select_scanout;
	assign dff_dir_scanin = dff_inreg_select__scanout;
	assign q0_scanin = dff_dir_scanout;
	assign q1_scanin = q0_scanout;
	assign q2_scanin = q1_scanout;
	assign q3_scanin = q2_scanout;
	assign q4_scanin = q3_scanout;
	assign q5_scanin = q4_scanout;
	assign q6_scanin = q5_scanout;
	assign q7_scanin = q6_scanout;
	assign q8_scanin = q7_scanout;
	assign spares_scanin = q8_scanout;
	assign scan_out = spares_scanout;

	l1clkhdr_ctl_macro clkgen(
		.l2clk				(l2clk), 
		.l1en				(1'b1), 
		.l1clk				(l1clk), 
		.pce_ov				(pce_ov), 
		.stop				(stop), 
		.se				(se));
	msff_ctl_macro__width_5 dff_wptr(
		.scan_in			(dff_wptr_scanin), 
		.scan_out			(dff_wptr_scanout), 
		.din				(wptr_next[4:0]), 
		.dout				(wptr_a[4:0]), 
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk));
	msff_ctl_macro__width_5 dff_rptr(
		.scan_in			(dff_rptr_scanin), 
		.scan_out			(dff_rptr_scanout), 
		.din				(rptr_next[4:0]), 
		.dout				(rptr_a[4:0]), 
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk));
	msff_ctl_macro dff_inreg_select(
		.scan_in			(dff_inreg_select_scanin), 
		.scan_out			(dff_inreg_select_scanout), 
		.din				(input_req_sel_q), 
		.dout				(input_req_sel_a), 
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk));
	msff_ctl_macro dff_inreg_select_x(
		.scan_in			(dff_inreg_select__scanin), 
		.scan_out			(dff_inreg_select__scanout), 
		.din				(input_req_sel_q_), 
		.dout				(input_req_sel_a_), 
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk));
	msff_ctl_macro dff_dir(
		.scan_in			(dff_dir_scanin), 
		.scan_out			(dff_dir_scanout), 
		.din				(direction_in), 
		.dout				(direction), 
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk));
	ccx_srq_ctl q0(
		.scan_in			(q0_scanin), 
		.scan_out			(q0_scanout), 
		.qfull_a			(qfull_a[0]), 
		.qfullbar_a			(qfullbar_a[0]), 
		.qsel0_a			(arb_qsel0_a[0]), 
		.qsel1_a			(arb_qsel1_a[0]), 
		.shift_a			(arb_shift_a[0]), 
		.q0_holdbar_a			(arb_q0_holdbar_a[0]), 
		.atom_x				(atom_x[0]), 
		.req_a				(req_a[0]), 
		.atom_a				(atom_a[0]), 
		.grant_a			(grant_a[0]), 
		.l1clk				(l1clk), 
		.ccx_aclk			(ccx_aclk), 
		.ccx_bclk			(ccx_bclk));
	ccx_srq_ctl q1(
		.scan_in			(q1_scanin), 
		.scan_out			(q1_scanout), 
		.qfull_a			(qfull_a[1]), 
		.qfullbar_a			(qfullbar_a[1]), 
		.qsel0_a			(arb_qsel0_a[1]), 
		.qsel1_a			(arb_qsel1_a[1]), 
		.shift_a			(arb_shift_a[1]), 
		.q0_holdbar_a			(arb_q0_holdbar_a[1]), 
		.atom_x				(atom_x[1]), 
		.req_a				(req_a[1]), 
		.atom_a				(atom_a[1]), 
		.grant_a			(grant_a[1]), 
		.l1clk				(l1clk), 
		.ccx_aclk			(ccx_aclk), 
		.ccx_bclk			(ccx_bclk));
	ccx_srq_ctl q2(
		.scan_in			(q2_scanin), 
		.scan_out			(q2_scanout), 
		.qfull_a			(qfull_a[2]), 
		.qfullbar_a			(qfullbar_a[2]), 
		.qsel0_a			(arb_qsel0_a[2]), 
		.qsel1_a			(arb_qsel1_a[2]), 
		.shift_a			(arb_shift_a[2]), 
		.q0_holdbar_a			(arb_q0_holdbar_a[2]), 
		.atom_x				(atom_x[2]), 
		.req_a				(req_a[2]), 
		.atom_a				(atom_a[2]), 
		.grant_a			(grant_a[2]), 
		.l1clk				(l1clk), 
		.ccx_aclk			(ccx_aclk), 
		.ccx_bclk			(ccx_bclk));
	ccx_srq_ctl q3(
		.scan_in			(q3_scanin), 
		.scan_out			(q3_scanout), 
		.qfull_a			(qfull_a[3]), 
		.qfullbar_a			(qfullbar_a[3]), 
		.qsel0_a			(arb_qsel0_a[3]), 
		.qsel1_a			(arb_qsel1_a[3]), 
		.shift_a			(arb_shift_a[3]), 
		.q0_holdbar_a			(arb_q0_holdbar_a[3]), 
		.atom_x				(atom_x[3]), 
		.req_a				(req_a[3]), 
		.atom_a				(atom_a[3]), 
		.grant_a			(grant_a[3]), 
		.l1clk				(l1clk), 
		.ccx_aclk			(ccx_aclk), 
		.ccx_bclk			(ccx_bclk));
	ccx_srq_ctl q4(
		.scan_in			(q4_scanin), 
		.scan_out			(q4_scanout), 
		.qfull_a			(qfull_a[4]), 
		.qfullbar_a			(qfullbar_a[4]), 
		.qsel0_a			(arb_qsel0_a[4]), 
		.qsel1_a			(arb_qsel1_a[4]), 
		.shift_a			(arb_shift_a[4]), 
		.q0_holdbar_a			(arb_q0_holdbar_a[4]), 
		.atom_x				(atom_x[4]), 
		.req_a				(req_a[4]), 
		.atom_a				(atom_a[4]), 
		.grant_a			(grant_a[4]), 
		.l1clk				(l1clk), 
		.ccx_aclk			(ccx_aclk), 
		.ccx_bclk			(ccx_bclk));
	ccx_srq_ctl q5(
		.scan_in			(q5_scanin), 
		.scan_out			(q5_scanout), 
		.qfull_a			(qfull_a[5]), 
		.qfullbar_a			(qfullbar_a[5]), 
		.qsel0_a			(arb_qsel0_a[5]), 
		.qsel1_a			(arb_qsel1_a[5]), 
		.shift_a			(arb_shift_a[5]), 
		.q0_holdbar_a			(arb_q0_holdbar_a[5]), 
		.atom_x				(atom_x[5]), 
		.req_a				(req_a[5]), 
		.atom_a				(atom_a[5]), 
		.grant_a			(grant_a[5]), 
		.l1clk				(l1clk), 
		.ccx_aclk			(ccx_aclk), 
		.ccx_bclk			(ccx_bclk));
	ccx_srq_ctl q6(
		.scan_in			(q6_scanin), 
		.scan_out			(q6_scanout), 
		.qfull_a			(qfull_a[6]), 
		.qfullbar_a			(qfullbar_a[6]), 
		.qsel0_a			(arb_qsel0_a[6]), 
		.qsel1_a			(arb_qsel1_a[6]), 
		.shift_a			(arb_shift_a[6]), 
		.q0_holdbar_a			(arb_q0_holdbar_a[6]), 
		.atom_x				(atom_x[6]), 
		.req_a				(req_a[6]), 
		.atom_a				(atom_a[6]), 
		.grant_a			(grant_a[6]), 
		.l1clk				(l1clk), 
		.ccx_aclk			(ccx_aclk), 
		.ccx_bclk			(ccx_bclk));
	ccx_srq_ctl q7(
		.scan_in			(q7_scanin), 
		.scan_out			(q7_scanout), 
		.qfull_a			(qfull_a[7]), 
		.qfullbar_a			(qfullbar_a[7]), 
		.qsel0_a			(arb_qsel0_a[7]), 
		.qsel1_a			(arb_qsel1_a[7]), 
		.shift_a			(arb_shift_a[7]), 
		.q0_holdbar_a			(arb_q0_holdbar_a[7]), 
		.atom_x				(atom_x[7]), 
		.req_a				(req_a[7]), 
		.atom_a				(atom_a[7]), 
		.grant_a			(grant_a[7]), 
		.l1clk				(l1clk), 
		.ccx_aclk			(ccx_aclk), 
		.ccx_bclk			(ccx_bclk));
	ccx_srq_ctl q8(
		.scan_in			(q8_scanin), 
		.scan_out			(q8_scanout), 
		.qfull_a			(qfull_a[8]), 
		.qfullbar_a			(qfullbar_a[8]), 
		.qsel0_a			(arb_qsel0_a[8]), 
		.qsel1_a			(arb_qsel1_a[8]), 
		.shift_a			(arb_shift_a[8]), 
		.q0_holdbar_a			(arb_q0_holdbar_a[8]), 
		.atom_x				(atom_x[8]), 
		.req_a				(req_a[8]), 
		.atom_a				(atom_a[8]), 
		.grant_a			(grant_a[8]), 
		.l1clk				(l1clk), 
		.ccx_aclk			(ccx_aclk), 
		.ccx_bclk			(ccx_bclk));
	spare_ctl_macro__num_10 spares(
		.scan_in			(spares_scanin), 
		.scan_out			(spares_scanout), 
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk));
endmodule
`endcelldefine

`celldefine
module msff_ctl_macro(din, l1clk, scan_in, siclk, soclk, dout, scan_out);

	input	[0:0]		din;
	input			l1clk;
	input			scan_in;
	input			siclk;
	input			soclk;
	output	[0:0]		dout;
	output			scan_out;

	wire	[0:0]		fdin;

	assign fdin[0] = din[0];

	dff #(1) d0_0(
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.d				(fdin[0]), 
		.si				(scan_in), 
		.so				(scan_out), 
		.q				(dout[0]));
endmodule
`endcelldefine

`celldefine
module spare_ctl_macro__num_10(l1clk, scan_in, siclk, soclk, scan_out);

	input			l1clk;
	input			scan_in;
	input			siclk;
	input			soclk;
	output			scan_out;

	wire			si_0;
	wire			so_0;
	wire			spare0_flop_unused;
	wire			spare0_buf_32x_unused;
	wire			spare0_nand3_8x_unused;
	wire			spare0_inv_8x_unused;
	wire			spare0_aoi22_4x_unused;
	wire			spare0_buf_8x_unused;
	wire			spare0_oai22_4x_unused;
	wire			spare0_inv_16x_unused;
	wire			spare0_nand2_16x_unused;
	wire			spare0_nor3_4x_unused;
	wire			spare0_nand2_8x_unused;
	wire			spare0_buf_16x_unused;
	wire			spare0_nor2_16x_unused;
	wire			spare0_inv_32x_unused;
	wire			si_1;
	wire			so_1;
	wire			spare1_flop_unused;
	wire			spare1_buf_32x_unused;
	wire			spare1_nand3_8x_unused;
	wire			spare1_inv_8x_unused;
	wire			spare1_aoi22_4x_unused;
	wire			spare1_buf_8x_unused;
	wire			spare1_oai22_4x_unused;
	wire			spare1_inv_16x_unused;
	wire			spare1_nand2_16x_unused;
	wire			spare1_nor3_4x_unused;
	wire			spare1_nand2_8x_unused;
	wire			spare1_buf_16x_unused;
	wire			spare1_nor2_16x_unused;
	wire			spare1_inv_32x_unused;
	wire			si_2;
	wire			so_2;
	wire			spare2_flop_unused;
	wire			spare2_buf_32x_unused;
	wire			spare2_nand3_8x_unused;
	wire			spare2_inv_8x_unused;
	wire			spare2_aoi22_4x_unused;
	wire			spare2_buf_8x_unused;
	wire			spare2_oai22_4x_unused;
	wire			spare2_inv_16x_unused;
	wire			spare2_nand2_16x_unused;
	wire			spare2_nor3_4x_unused;
	wire			spare2_nand2_8x_unused;
	wire			spare2_buf_16x_unused;
	wire			spare2_nor2_16x_unused;
	wire			spare2_inv_32x_unused;
	wire			si_3;
	wire			so_3;
	wire			spare3_flop_unused;
	wire			spare3_buf_32x_unused;
	wire			spare3_nand3_8x_unused;
	wire			spare3_inv_8x_unused;
	wire			spare3_aoi22_4x_unused;
	wire			spare3_buf_8x_unused;
	wire			spare3_oai22_4x_unused;
	wire			spare3_inv_16x_unused;
	wire			spare3_nand2_16x_unused;
	wire			spare3_nor3_4x_unused;
	wire			spare3_nand2_8x_unused;
	wire			spare3_buf_16x_unused;
	wire			spare3_nor2_16x_unused;
	wire			spare3_inv_32x_unused;
	wire			si_4;
	wire			so_4;
	wire			spare4_flop_unused;
	wire			spare4_buf_32x_unused;
	wire			spare4_nand3_8x_unused;
	wire			spare4_inv_8x_unused;
	wire			spare4_aoi22_4x_unused;
	wire			spare4_buf_8x_unused;
	wire			spare4_oai22_4x_unused;
	wire			spare4_inv_16x_unused;
	wire			spare4_nand2_16x_unused;
	wire			spare4_nor3_4x_unused;
	wire			spare4_nand2_8x_unused;
	wire			spare4_buf_16x_unused;
	wire			spare4_nor2_16x_unused;
	wire			spare4_inv_32x_unused;
	wire			si_5;
	wire			so_5;
	wire			spare5_flop_unused;
	wire			spare5_buf_32x_unused;
	wire			spare5_nand3_8x_unused;
	wire			spare5_inv_8x_unused;
	wire			spare5_aoi22_4x_unused;
	wire			spare5_buf_8x_unused;
	wire			spare5_oai22_4x_unused;
	wire			spare5_inv_16x_unused;
	wire			spare5_nand2_16x_unused;
	wire			spare5_nor3_4x_unused;
	wire			spare5_nand2_8x_unused;
	wire			spare5_buf_16x_unused;
	wire			spare5_nor2_16x_unused;
	wire			spare5_inv_32x_unused;
	wire			si_6;
	wire			so_6;
	wire			spare6_flop_unused;
	wire			spare6_buf_32x_unused;
	wire			spare6_nand3_8x_unused;
	wire			spare6_inv_8x_unused;
	wire			spare6_aoi22_4x_unused;
	wire			spare6_buf_8x_unused;
	wire			spare6_oai22_4x_unused;
	wire			spare6_inv_16x_unused;
	wire			spare6_nand2_16x_unused;
	wire			spare6_nor3_4x_unused;
	wire			spare6_nand2_8x_unused;
	wire			spare6_buf_16x_unused;
	wire			spare6_nor2_16x_unused;
	wire			spare6_inv_32x_unused;
	wire			si_7;
	wire			so_7;
	wire			spare7_flop_unused;
	wire			spare7_buf_32x_unused;
	wire			spare7_nand3_8x_unused;
	wire			spare7_inv_8x_unused;
	wire			spare7_aoi22_4x_unused;
	wire			spare7_buf_8x_unused;
	wire			spare7_oai22_4x_unused;
	wire			spare7_inv_16x_unused;
	wire			spare7_nand2_16x_unused;
	wire			spare7_nor3_4x_unused;
	wire			spare7_nand2_8x_unused;
	wire			spare7_buf_16x_unused;
	wire			spare7_nor2_16x_unused;
	wire			spare7_inv_32x_unused;
	wire			si_8;
	wire			so_8;
	wire			spare8_flop_unused;
	wire			spare8_buf_32x_unused;
	wire			spare8_nand3_8x_unused;
	wire			spare8_inv_8x_unused;
	wire			spare8_aoi22_4x_unused;
	wire			spare8_buf_8x_unused;
	wire			spare8_oai22_4x_unused;
	wire			spare8_inv_16x_unused;
	wire			spare8_nand2_16x_unused;
	wire			spare8_nor3_4x_unused;
	wire			spare8_nand2_8x_unused;
	wire			spare8_buf_16x_unused;
	wire			spare8_nor2_16x_unused;
	wire			spare8_inv_32x_unused;
	wire			si_9;
	wire			so_9;
	wire			spare9_flop_unused;
	wire			spare9_buf_32x_unused;
	wire			spare9_nand3_8x_unused;
	wire			spare9_inv_8x_unused;
	wire			spare9_aoi22_4x_unused;
	wire			spare9_buf_8x_unused;
	wire			spare9_oai22_4x_unused;
	wire			spare9_inv_16x_unused;
	wire			spare9_nand2_16x_unused;
	wire			spare9_nor3_4x_unused;
	wire			spare9_nand2_8x_unused;
	wire			spare9_buf_16x_unused;
	wire			spare9_nor2_16x_unused;
	wire			spare9_inv_32x_unused;

	assign si_0 = scan_in;
	assign si_1 = so_0;
	assign si_2 = so_1;
	assign si_3 = so_2;
	assign si_4 = so_3;
	assign si_5 = so_4;
	assign si_6 = so_5;
	assign si_7 = so_6;
	assign si_8 = so_7;
	assign si_9 = so_8;
	assign scan_out = so_9;

	cl_sc1_msff_8x spare0_flop(
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.si				(si_0), 
		.so				(so_0), 
		.d				(1'b0), 
		.q				(spare0_flop_unused));
	cl_u1_buf_32x spare0_buf_32x(
		.in				(1'b1), 
		.out				(spare0_buf_32x_unused));
	cl_u1_nand3_8x spare0_nand3_8x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.in2				(1'b1), 
		.out				(spare0_nand3_8x_unused));
	cl_u1_inv_8x spare0_inv_8x(
		.in				(1'b1), 
		.out				(spare0_inv_8x_unused));
	cl_u1_aoi22_4x spare0_aoi22_4x(
		.in00				(1'b1), 
		.in01				(1'b1), 
		.in10				(1'b1), 
		.in11				(1'b1), 
		.out				(spare0_aoi22_4x_unused));
	cl_u1_buf_8x spare0_buf_8x(
		.in				(1'b1), 
		.out				(spare0_buf_8x_unused));
	cl_u1_oai22_4x spare0_oai22_4x(
		.in00				(1'b1), 
		.in01				(1'b1), 
		.in10				(1'b1), 
		.in11				(1'b1), 
		.out				(spare0_oai22_4x_unused));
	cl_u1_inv_16x spare0_inv_16x(
		.in				(1'b1), 
		.out				(spare0_inv_16x_unused));
	cl_u1_nand2_16x spare0_nand2_16x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.out				(spare0_nand2_16x_unused));
	cl_u1_nor3_4x spare0_nor3_4x(
		.in0				(1'b0), 
		.in1				(1'b0), 
		.in2				(1'b0), 
		.out				(spare0_nor3_4x_unused));
	cl_u1_nand2_8x spare0_nand2_8x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.out				(spare0_nand2_8x_unused));
	cl_u1_buf_16x spare0_buf_16x(
		.in				(1'b1), 
		.out				(spare0_buf_16x_unused));
	cl_u1_nor2_16x spare0_nor2_16x(
		.in0				(1'b0), 
		.in1				(1'b0), 
		.out				(spare0_nor2_16x_unused));
	cl_u1_inv_32x spare0_inv_32x(
		.in				(1'b1), 
		.out				(spare0_inv_32x_unused));
	cl_sc1_msff_8x spare1_flop(
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.si				(si_1), 
		.so				(so_1), 
		.d				(1'b0), 
		.q				(spare1_flop_unused));
	cl_u1_buf_32x spare1_buf_32x(
		.in				(1'b1), 
		.out				(spare1_buf_32x_unused));
	cl_u1_nand3_8x spare1_nand3_8x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.in2				(1'b1), 
		.out				(spare1_nand3_8x_unused));
	cl_u1_inv_8x spare1_inv_8x(
		.in				(1'b1), 
		.out				(spare1_inv_8x_unused));
	cl_u1_aoi22_4x spare1_aoi22_4x(
		.in00				(1'b1), 
		.in01				(1'b1), 
		.in10				(1'b1), 
		.in11				(1'b1), 
		.out				(spare1_aoi22_4x_unused));
	cl_u1_buf_8x spare1_buf_8x(
		.in				(1'b1), 
		.out				(spare1_buf_8x_unused));
	cl_u1_oai22_4x spare1_oai22_4x(
		.in00				(1'b1), 
		.in01				(1'b1), 
		.in10				(1'b1), 
		.in11				(1'b1), 
		.out				(spare1_oai22_4x_unused));
	cl_u1_inv_16x spare1_inv_16x(
		.in				(1'b1), 
		.out				(spare1_inv_16x_unused));
	cl_u1_nand2_16x spare1_nand2_16x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.out				(spare1_nand2_16x_unused));
	cl_u1_nor3_4x spare1_nor3_4x(
		.in0				(1'b0), 
		.in1				(1'b0), 
		.in2				(1'b0), 
		.out				(spare1_nor3_4x_unused));
	cl_u1_nand2_8x spare1_nand2_8x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.out				(spare1_nand2_8x_unused));
	cl_u1_buf_16x spare1_buf_16x(
		.in				(1'b1), 
		.out				(spare1_buf_16x_unused));
	cl_u1_nor2_16x spare1_nor2_16x(
		.in0				(1'b0), 
		.in1				(1'b0), 
		.out				(spare1_nor2_16x_unused));
	cl_u1_inv_32x spare1_inv_32x(
		.in				(1'b1), 
		.out				(spare1_inv_32x_unused));
	cl_sc1_msff_8x spare2_flop(
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.si				(si_2), 
		.so				(so_2), 
		.d				(1'b0), 
		.q				(spare2_flop_unused));
	cl_u1_buf_32x spare2_buf_32x(
		.in				(1'b1), 
		.out				(spare2_buf_32x_unused));
	cl_u1_nand3_8x spare2_nand3_8x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.in2				(1'b1), 
		.out				(spare2_nand3_8x_unused));
	cl_u1_inv_8x spare2_inv_8x(
		.in				(1'b1), 
		.out				(spare2_inv_8x_unused));
	cl_u1_aoi22_4x spare2_aoi22_4x(
		.in00				(1'b1), 
		.in01				(1'b1), 
		.in10				(1'b1), 
		.in11				(1'b1), 
		.out				(spare2_aoi22_4x_unused));
	cl_u1_buf_8x spare2_buf_8x(
		.in				(1'b1), 
		.out				(spare2_buf_8x_unused));
	cl_u1_oai22_4x spare2_oai22_4x(
		.in00				(1'b1), 
		.in01				(1'b1), 
		.in10				(1'b1), 
		.in11				(1'b1), 
		.out				(spare2_oai22_4x_unused));
	cl_u1_inv_16x spare2_inv_16x(
		.in				(1'b1), 
		.out				(spare2_inv_16x_unused));
	cl_u1_nand2_16x spare2_nand2_16x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.out				(spare2_nand2_16x_unused));
	cl_u1_nor3_4x spare2_nor3_4x(
		.in0				(1'b0), 
		.in1				(1'b0), 
		.in2				(1'b0), 
		.out				(spare2_nor3_4x_unused));
	cl_u1_nand2_8x spare2_nand2_8x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.out				(spare2_nand2_8x_unused));
	cl_u1_buf_16x spare2_buf_16x(
		.in				(1'b1), 
		.out				(spare2_buf_16x_unused));
	cl_u1_nor2_16x spare2_nor2_16x(
		.in0				(1'b0), 
		.in1				(1'b0), 
		.out				(spare2_nor2_16x_unused));
	cl_u1_inv_32x spare2_inv_32x(
		.in				(1'b1), 
		.out				(spare2_inv_32x_unused));
	cl_sc1_msff_8x spare3_flop(
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.si				(si_3), 
		.so				(so_3), 
		.d				(1'b0), 
		.q				(spare3_flop_unused));
	cl_u1_buf_32x spare3_buf_32x(
		.in				(1'b1), 
		.out				(spare3_buf_32x_unused));
	cl_u1_nand3_8x spare3_nand3_8x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.in2				(1'b1), 
		.out				(spare3_nand3_8x_unused));
	cl_u1_inv_8x spare3_inv_8x(
		.in				(1'b1), 
		.out				(spare3_inv_8x_unused));
	cl_u1_aoi22_4x spare3_aoi22_4x(
		.in00				(1'b1), 
		.in01				(1'b1), 
		.in10				(1'b1), 
		.in11				(1'b1), 
		.out				(spare3_aoi22_4x_unused));
	cl_u1_buf_8x spare3_buf_8x(
		.in				(1'b1), 
		.out				(spare3_buf_8x_unused));
	cl_u1_oai22_4x spare3_oai22_4x(
		.in00				(1'b1), 
		.in01				(1'b1), 
		.in10				(1'b1), 
		.in11				(1'b1), 
		.out				(spare3_oai22_4x_unused));
	cl_u1_inv_16x spare3_inv_16x(
		.in				(1'b1), 
		.out				(spare3_inv_16x_unused));
	cl_u1_nand2_16x spare3_nand2_16x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.out				(spare3_nand2_16x_unused));
	cl_u1_nor3_4x spare3_nor3_4x(
		.in0				(1'b0), 
		.in1				(1'b0), 
		.in2				(1'b0), 
		.out				(spare3_nor3_4x_unused));
	cl_u1_nand2_8x spare3_nand2_8x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.out				(spare3_nand2_8x_unused));
	cl_u1_buf_16x spare3_buf_16x(
		.in				(1'b1), 
		.out				(spare3_buf_16x_unused));
	cl_u1_nor2_16x spare3_nor2_16x(
		.in0				(1'b0), 
		.in1				(1'b0), 
		.out				(spare3_nor2_16x_unused));
	cl_u1_inv_32x spare3_inv_32x(
		.in				(1'b1), 
		.out				(spare3_inv_32x_unused));
	cl_sc1_msff_8x spare4_flop(
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.si				(si_4), 
		.so				(so_4), 
		.d				(1'b0), 
		.q				(spare4_flop_unused));
	cl_u1_buf_32x spare4_buf_32x(
		.in				(1'b1), 
		.out				(spare4_buf_32x_unused));
	cl_u1_nand3_8x spare4_nand3_8x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.in2				(1'b1), 
		.out				(spare4_nand3_8x_unused));
	cl_u1_inv_8x spare4_inv_8x(
		.in				(1'b1), 
		.out				(spare4_inv_8x_unused));
	cl_u1_aoi22_4x spare4_aoi22_4x(
		.in00				(1'b1), 
		.in01				(1'b1), 
		.in10				(1'b1), 
		.in11				(1'b1), 
		.out				(spare4_aoi22_4x_unused));
	cl_u1_buf_8x spare4_buf_8x(
		.in				(1'b1), 
		.out				(spare4_buf_8x_unused));
	cl_u1_oai22_4x spare4_oai22_4x(
		.in00				(1'b1), 
		.in01				(1'b1), 
		.in10				(1'b1), 
		.in11				(1'b1), 
		.out				(spare4_oai22_4x_unused));
	cl_u1_inv_16x spare4_inv_16x(
		.in				(1'b1), 
		.out				(spare4_inv_16x_unused));
	cl_u1_nand2_16x spare4_nand2_16x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.out				(spare4_nand2_16x_unused));
	cl_u1_nor3_4x spare4_nor3_4x(
		.in0				(1'b0), 
		.in1				(1'b0), 
		.in2				(1'b0), 
		.out				(spare4_nor3_4x_unused));
	cl_u1_nand2_8x spare4_nand2_8x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.out				(spare4_nand2_8x_unused));
	cl_u1_buf_16x spare4_buf_16x(
		.in				(1'b1), 
		.out				(spare4_buf_16x_unused));
	cl_u1_nor2_16x spare4_nor2_16x(
		.in0				(1'b0), 
		.in1				(1'b0), 
		.out				(spare4_nor2_16x_unused));
	cl_u1_inv_32x spare4_inv_32x(
		.in				(1'b1), 
		.out				(spare4_inv_32x_unused));
	cl_sc1_msff_8x spare5_flop(
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.si				(si_5), 
		.so				(so_5), 
		.d				(1'b0), 
		.q				(spare5_flop_unused));
	cl_u1_buf_32x spare5_buf_32x(
		.in				(1'b1), 
		.out				(spare5_buf_32x_unused));
	cl_u1_nand3_8x spare5_nand3_8x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.in2				(1'b1), 
		.out				(spare5_nand3_8x_unused));
	cl_u1_inv_8x spare5_inv_8x(
		.in				(1'b1), 
		.out				(spare5_inv_8x_unused));
	cl_u1_aoi22_4x spare5_aoi22_4x(
		.in00				(1'b1), 
		.in01				(1'b1), 
		.in10				(1'b1), 
		.in11				(1'b1), 
		.out				(spare5_aoi22_4x_unused));
	cl_u1_buf_8x spare5_buf_8x(
		.in				(1'b1), 
		.out				(spare5_buf_8x_unused));
	cl_u1_oai22_4x spare5_oai22_4x(
		.in00				(1'b1), 
		.in01				(1'b1), 
		.in10				(1'b1), 
		.in11				(1'b1), 
		.out				(spare5_oai22_4x_unused));
	cl_u1_inv_16x spare5_inv_16x(
		.in				(1'b1), 
		.out				(spare5_inv_16x_unused));
	cl_u1_nand2_16x spare5_nand2_16x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.out				(spare5_nand2_16x_unused));
	cl_u1_nor3_4x spare5_nor3_4x(
		.in0				(1'b0), 
		.in1				(1'b0), 
		.in2				(1'b0), 
		.out				(spare5_nor3_4x_unused));
	cl_u1_nand2_8x spare5_nand2_8x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.out				(spare5_nand2_8x_unused));
	cl_u1_buf_16x spare5_buf_16x(
		.in				(1'b1), 
		.out				(spare5_buf_16x_unused));
	cl_u1_nor2_16x spare5_nor2_16x(
		.in0				(1'b0), 
		.in1				(1'b0), 
		.out				(spare5_nor2_16x_unused));
	cl_u1_inv_32x spare5_inv_32x(
		.in				(1'b1), 
		.out				(spare5_inv_32x_unused));
	cl_sc1_msff_8x spare6_flop(
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.si				(si_6), 
		.so				(so_6), 
		.d				(1'b0), 
		.q				(spare6_flop_unused));
	cl_u1_buf_32x spare6_buf_32x(
		.in				(1'b1), 
		.out				(spare6_buf_32x_unused));
	cl_u1_nand3_8x spare6_nand3_8x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.in2				(1'b1), 
		.out				(spare6_nand3_8x_unused));
	cl_u1_inv_8x spare6_inv_8x(
		.in				(1'b1), 
		.out				(spare6_inv_8x_unused));
	cl_u1_aoi22_4x spare6_aoi22_4x(
		.in00				(1'b1), 
		.in01				(1'b1), 
		.in10				(1'b1), 
		.in11				(1'b1), 
		.out				(spare6_aoi22_4x_unused));
	cl_u1_buf_8x spare6_buf_8x(
		.in				(1'b1), 
		.out				(spare6_buf_8x_unused));
	cl_u1_oai22_4x spare6_oai22_4x(
		.in00				(1'b1), 
		.in01				(1'b1), 
		.in10				(1'b1), 
		.in11				(1'b1), 
		.out				(spare6_oai22_4x_unused));
	cl_u1_inv_16x spare6_inv_16x(
		.in				(1'b1), 
		.out				(spare6_inv_16x_unused));
	cl_u1_nand2_16x spare6_nand2_16x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.out				(spare6_nand2_16x_unused));
	cl_u1_nor3_4x spare6_nor3_4x(
		.in0				(1'b0), 
		.in1				(1'b0), 
		.in2				(1'b0), 
		.out				(spare6_nor3_4x_unused));
	cl_u1_nand2_8x spare6_nand2_8x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.out				(spare6_nand2_8x_unused));
	cl_u1_buf_16x spare6_buf_16x(
		.in				(1'b1), 
		.out				(spare6_buf_16x_unused));
	cl_u1_nor2_16x spare6_nor2_16x(
		.in0				(1'b0), 
		.in1				(1'b0), 
		.out				(spare6_nor2_16x_unused));
	cl_u1_inv_32x spare6_inv_32x(
		.in				(1'b1), 
		.out				(spare6_inv_32x_unused));
	cl_sc1_msff_8x spare7_flop(
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.si				(si_7), 
		.so				(so_7), 
		.d				(1'b0), 
		.q				(spare7_flop_unused));
	cl_u1_buf_32x spare7_buf_32x(
		.in				(1'b1), 
		.out				(spare7_buf_32x_unused));
	cl_u1_nand3_8x spare7_nand3_8x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.in2				(1'b1), 
		.out				(spare7_nand3_8x_unused));
	cl_u1_inv_8x spare7_inv_8x(
		.in				(1'b1), 
		.out				(spare7_inv_8x_unused));
	cl_u1_aoi22_4x spare7_aoi22_4x(
		.in00				(1'b1), 
		.in01				(1'b1), 
		.in10				(1'b1), 
		.in11				(1'b1), 
		.out				(spare7_aoi22_4x_unused));
	cl_u1_buf_8x spare7_buf_8x(
		.in				(1'b1), 
		.out				(spare7_buf_8x_unused));
	cl_u1_oai22_4x spare7_oai22_4x(
		.in00				(1'b1), 
		.in01				(1'b1), 
		.in10				(1'b1), 
		.in11				(1'b1), 
		.out				(spare7_oai22_4x_unused));
	cl_u1_inv_16x spare7_inv_16x(
		.in				(1'b1), 
		.out				(spare7_inv_16x_unused));
	cl_u1_nand2_16x spare7_nand2_16x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.out				(spare7_nand2_16x_unused));
	cl_u1_nor3_4x spare7_nor3_4x(
		.in0				(1'b0), 
		.in1				(1'b0), 
		.in2				(1'b0), 
		.out				(spare7_nor3_4x_unused));
	cl_u1_nand2_8x spare7_nand2_8x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.out				(spare7_nand2_8x_unused));
	cl_u1_buf_16x spare7_buf_16x(
		.in				(1'b1), 
		.out				(spare7_buf_16x_unused));
	cl_u1_nor2_16x spare7_nor2_16x(
		.in0				(1'b0), 
		.in1				(1'b0), 
		.out				(spare7_nor2_16x_unused));
	cl_u1_inv_32x spare7_inv_32x(
		.in				(1'b1), 
		.out				(spare7_inv_32x_unused));
	cl_sc1_msff_8x spare8_flop(
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.si				(si_8), 
		.so				(so_8), 
		.d				(1'b0), 
		.q				(spare8_flop_unused));
	cl_u1_buf_32x spare8_buf_32x(
		.in				(1'b1), 
		.out				(spare8_buf_32x_unused));
	cl_u1_nand3_8x spare8_nand3_8x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.in2				(1'b1), 
		.out				(spare8_nand3_8x_unused));
	cl_u1_inv_8x spare8_inv_8x(
		.in				(1'b1), 
		.out				(spare8_inv_8x_unused));
	cl_u1_aoi22_4x spare8_aoi22_4x(
		.in00				(1'b1), 
		.in01				(1'b1), 
		.in10				(1'b1), 
		.in11				(1'b1), 
		.out				(spare8_aoi22_4x_unused));
	cl_u1_buf_8x spare8_buf_8x(
		.in				(1'b1), 
		.out				(spare8_buf_8x_unused));
	cl_u1_oai22_4x spare8_oai22_4x(
		.in00				(1'b1), 
		.in01				(1'b1), 
		.in10				(1'b1), 
		.in11				(1'b1), 
		.out				(spare8_oai22_4x_unused));
	cl_u1_inv_16x spare8_inv_16x(
		.in				(1'b1), 
		.out				(spare8_inv_16x_unused));
	cl_u1_nand2_16x spare8_nand2_16x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.out				(spare8_nand2_16x_unused));
	cl_u1_nor3_4x spare8_nor3_4x(
		.in0				(1'b0), 
		.in1				(1'b0), 
		.in2				(1'b0), 
		.out				(spare8_nor3_4x_unused));
	cl_u1_nand2_8x spare8_nand2_8x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.out				(spare8_nand2_8x_unused));
	cl_u1_buf_16x spare8_buf_16x(
		.in				(1'b1), 
		.out				(spare8_buf_16x_unused));
	cl_u1_nor2_16x spare8_nor2_16x(
		.in0				(1'b0), 
		.in1				(1'b0), 
		.out				(spare8_nor2_16x_unused));
	cl_u1_inv_32x spare8_inv_32x(
		.in				(1'b1), 
		.out				(spare8_inv_32x_unused));
	cl_sc1_msff_8x spare9_flop(
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.si				(si_9), 
		.so				(so_9), 
		.d				(1'b0), 
		.q				(spare9_flop_unused));
	cl_u1_buf_32x spare9_buf_32x(
		.in				(1'b1), 
		.out				(spare9_buf_32x_unused));
	cl_u1_nand3_8x spare9_nand3_8x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.in2				(1'b1), 
		.out				(spare9_nand3_8x_unused));
	cl_u1_inv_8x spare9_inv_8x(
		.in				(1'b1), 
		.out				(spare9_inv_8x_unused));
	cl_u1_aoi22_4x spare9_aoi22_4x(
		.in00				(1'b1), 
		.in01				(1'b1), 
		.in10				(1'b1), 
		.in11				(1'b1), 
		.out				(spare9_aoi22_4x_unused));
	cl_u1_buf_8x spare9_buf_8x(
		.in				(1'b1), 
		.out				(spare9_buf_8x_unused));
	cl_u1_oai22_4x spare9_oai22_4x(
		.in00				(1'b1), 
		.in01				(1'b1), 
		.in10				(1'b1), 
		.in11				(1'b1), 
		.out				(spare9_oai22_4x_unused));
	cl_u1_inv_16x spare9_inv_16x(
		.in				(1'b1), 
		.out				(spare9_inv_16x_unused));
	cl_u1_nand2_16x spare9_nand2_16x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.out				(spare9_nand2_16x_unused));
	cl_u1_nor3_4x spare9_nor3_4x(
		.in0				(1'b0), 
		.in1				(1'b0), 
		.in2				(1'b0), 
		.out				(spare9_nor3_4x_unused));
	cl_u1_nand2_8x spare9_nand2_8x(
		.in0				(1'b1), 
		.in1				(1'b1), 
		.out				(spare9_nand2_8x_unused));
	cl_u1_buf_16x spare9_buf_16x(
		.in				(1'b1), 
		.out				(spare9_buf_16x_unused));
	cl_u1_nor2_16x spare9_nor2_16x(
		.in0				(1'b0), 
		.in1				(1'b0), 
		.out				(spare9_nor2_16x_unused));
	cl_u1_inv_32x spare9_inv_32x(
		.in				(1'b1), 
		.out				(spare9_inv_32x_unused));
endmodule
`endcelldefine

`celldefine
module buff_macro__dbuff_16x__stack_none__width_4(din, dout);

	input	[3:0]		din;
	output	[3:0]		dout;

	buff #(4) d0_0(
		.in				(din[3:0]), 
		.out				(dout[3:0]));
endmodule
`endcelldefine

`celldefine
module msff_macro__dmsff_16x__stack_10c__width_10(din, clk, en, se, scan_in, 
	siclk, soclk, pce_ov, stop, dout, scan_out);

	input	[9:0]		din;
	input			clk;
	input			en;
	input			se;
	input			scan_in;
	input			siclk;
	input			soclk;
	input			pce_ov;
	input			stop;
	output	[9:0]		dout;
	output			scan_out;

	wire			l1clk;
	wire			siclk_out;
	wire			soclk_out;
	wire	[8:0]		so;

	cl_dp1_l1hdr_8x c0_0(
		.l2clk				(clk), 
		.pce				(en), 
		.aclk				(siclk), 
		.bclk				(soclk), 
		.l1clk				(l1clk), 
		.se				(se), 
		.pce_ov				(pce_ov), 
		.stop				(stop), 
		.siclk_out			(siclk_out), 
		.soclk_out			(soclk_out));
	dff #(10) d0_0(
		.l1clk				(l1clk), 
		.siclk				(siclk_out), 
		.soclk				(soclk_out), 
		.d				(din[9:0]), 
		.si				({scan_in, so[8:0]}), 
		.so				({so[8:0], scan_out}), 
		.q				(dout[9:0]));
endmodule
`endcelldefine

`celldefine
module nand_macro__dnand_1x__ports_2__stack_10c__width_9(din0, din1, dout);

	input	[8:0]		din0;
	input	[8:0]		din1;
	output	[8:0]		dout;

	nand2 #(9) d0_0(
		.in0				(din0[8:0]), 
		.in1				(din1[8:0]), 
		.out				(dout[8:0]));
endmodule
`endcelldefine

`celldefine
module inv_macro__dinv_24x__stack_10c__width_10(din, dout);

	input	[9:0]		din;
	output	[9:0]		dout;

	inv #(10) d0_0(
		.in				(din[9:0]), 
		.out				(dout[9:0]));
endmodule
`endcelldefine

`celldefine
module buff_macro__dbuff_32x__minbuff_1__stack_none__width_19(din, dout);

	input	[18:0]		din;
	output	[18:0]		dout;

	buff #(19) d0_0(
		.in				(din[18:0]), 
		.out				(dout[18:0]));
endmodule
`endcelldefine

`celldefine
module msff_macro__stack_10c__width_10(din, clk, en, se, scan_in, siclk, soclk, 
	pce_ov, stop, dout, scan_out);

	input	[9:0]		din;
	input			clk;
	input			en;
	input			se;
	input			scan_in;
	input			siclk;
	input			soclk;
	input			pce_ov;
	input			stop;
	output	[9:0]		dout;
	output			scan_out;

	wire			l1clk;
	wire			siclk_out;
	wire			soclk_out;
	wire	[8:0]		so;

	cl_dp1_l1hdr_8x c0_0(
		.l2clk				(clk), 
		.pce				(en), 
		.aclk				(siclk), 
		.bclk				(soclk), 
		.l1clk				(l1clk), 
		.se				(se), 
		.pce_ov				(pce_ov), 
		.stop				(stop), 
		.siclk_out			(siclk_out), 
		.soclk_out			(soclk_out));
	dff #(10) d0_0(
		.l1clk				(l1clk), 
		.siclk				(siclk_out), 
		.soclk				(soclk_out), 
		.d				(din[9:0]), 
		.si				({scan_in, so[8:0]}), 
		.so				({so[8:0], scan_out}), 
		.q				(dout[9:0]));
endmodule
`endcelldefine

`celldefine
module mux_macro__dbuff_8x__dmux_4x__mux_aope__ports_2__stack_10c__width_10(
	din0, din1, sel0, dout);

	input	[9:0]		din0;
	input	[9:0]		din1;
	input			sel0;
	output	[9:0]		dout;

	wire			psel0;
	wire			psel1;

	cl_dp1_penc2_8x c0_0(
		.sel0				(sel0), 
		.psel0				(psel0), 
		.psel1				(psel1));
	mux2s #(10) d0_0(
		.sel0				(psel0), 
		.sel1				(psel1), 
		.in0				(din0[9:0]), 
		.in1				(din1[9:0]), 
		.dout				(dout[9:0]));
endmodule
`endcelldefine

`celldefine
module mux_macro__dbuff_8x__dmux_4x__mux_aodec__ports_8__stack_10c__width_10(
	din0, din1, din2, din3, din4, din5, din6, din7, sel, dout);

	input	[9:0]		din0;
	input	[9:0]		din1;
	input	[9:0]		din2;
	input	[9:0]		din3;
	input	[9:0]		din4;
	input	[9:0]		din5;
	input	[9:0]		din6;
	input	[9:0]		din7;
	input	[2:0]		sel;
	output	[9:0]		dout;

	wire			psel0;
	wire			psel1;
	wire			psel2;
	wire			psel3;
	wire			psel4;
	wire			psel5;
	wire			psel6;
	wire			psel7;

	cl_dp1_pdec8_8x c0_0(
		.test				(1'b1), 
		.sel0				(sel[0]), 
		.sel1				(sel[1]), 
		.sel2				(sel[2]), 
		.psel0				(psel0), 
		.psel1				(psel1), 
		.psel2				(psel2), 
		.psel3				(psel3), 
		.psel4				(psel4), 
		.psel5				(psel5), 
		.psel6				(psel6), 
		.psel7				(psel7));
	mux8s #(10) d0_0(
		.sel0				(psel0), 
		.sel1				(psel1), 
		.sel2				(psel2), 
		.sel3				(psel3), 
		.sel4				(psel4), 
		.sel5				(psel5), 
		.sel6				(psel6), 
		.sel7				(psel7), 
		.in0				(din0[9:0]), 
		.in1				(din1[9:0]), 
		.in2				(din2[9:0]), 
		.in3				(din3[9:0]), 
		.in4				(din4[9:0]), 
		.in5				(din5[9:0]), 
		.in6				(din6[9:0]), 
		.in7				(din7[9:0]), 
		.dout				(dout[9:0]));
endmodule
`endcelldefine

`celldefine
module mux_macro__dmux_1x__mux_aodec__ports_4__stack_10c__width_10(din0, din1, 
	din2, din3, sel, dout);

	input	[9:0]		din0;
	input	[9:0]		din1;
	input	[9:0]		din2;
	input	[9:0]		din3;
	input	[1:0]		sel;
	output	[9:0]		dout;

	wire			psel0;
	wire			psel1;
	wire			psel2;
	wire			psel3;

	cl_dp1_pdec4_8x c0_0(
		.test				(1'b1), 
		.sel0				(sel[0]), 
		.sel1				(sel[1]), 
		.psel0				(psel0), 
		.psel1				(psel1), 
		.psel2				(psel2), 
		.psel3				(psel3));
	mux4s #(10) d0_0(
		.sel0				(psel0), 
		.sel1				(psel1), 
		.sel2				(psel2), 
		.sel3				(psel3), 
		.in0				(din0[9:0]), 
		.in1				(din1[9:0]), 
		.in2				(din2[9:0]), 
		.in3				(din3[9:0]), 
		.dout				(dout[9:0]));
endmodule
`endcelldefine

`celldefine
module mux_macro__dmux_1x__mux_aonpe__ports_2__stack_10c__width_10(din0, sel0, 
	din1, sel1, dout);

	input	[9:0]		din0;
	input			sel0;
	input	[9:0]		din1;
	input			sel1;
	output	[9:0]		dout;

	wire			buffout0;
	wire			buffout1;

	cl_dp1_muxbuff2_8x c0_0(
		.in0				(sel0), 
		.in1				(sel1), 
		.out0				(buffout0), 
		.out1				(buffout1));
	mux2s #(10) d0_0(
		.sel0				(buffout0), 
		.sel1				(buffout1), 
		.in0				(din0[9:0]), 
		.in1				(din1[9:0]), 
		.dout				(dout[9:0]));
endmodule
`endcelldefine

`celldefine
module buff_macro__dbuff_8x__stack_10c__width_1(din, dout);

	input	[0:0]		din;
	output	[0:0]		dout;

	buff #(1) d0_0(
		.in				(din[0]), 
		.out				(dout[0]));
endmodule
`endcelldefine

`celldefine
module nand_macro__dnand_4x__ports_3__stack_10c__width_10(din0, din1, din2, dout
	);

	input	[9:0]		din0;
	input	[9:0]		din1;
	input	[9:0]		din2;
	output	[9:0]		dout;

	nand3 #(10) d0_0(
		.in0				(din0[9:0]), 
		.in1				(din1[9:0]), 
		.in2				(din2[9:0]), 
		.out				(dout[9:0]));
endmodule
`endcelldefine

`celldefine
module nand_macro__dnand_4x__ports_2__stack_10c__width_10(din0, din1, dout);

	input	[9:0]		din0;
	input	[9:0]		din1;
	output	[9:0]		dout;

	nand2 #(10) d0_0(
		.in0				(din0[9:0]), 
		.in1				(din1[9:0]), 
		.out				(dout[9:0]));
endmodule
`endcelldefine

`celldefine
module nand_macro__dnand_12x__ports_2__stack_10c__width_10(din0, din1, dout);

	input	[9:0]		din0;
	input	[9:0]		din1;
	output	[9:0]		dout;

	nand2 #(10) d0_0(
		.in0				(din0[9:0]), 
		.in1				(din1[9:0]), 
		.out				(dout[9:0]));
endmodule
`endcelldefine

`celldefine
module inv_macro__dinv_2x__stack_10c__width_9(din, dout);

	input	[8:0]		din;
	output	[8:0]		dout;

	inv #(9) d0_0(
		.in				(din[8:0]), 
		.out				(dout[8:0]));
endmodule
`endcelldefine

`celldefine
module mux_macro__dmux_8x__mux_aope__ports_2__stack_10c__width_9(din0, din1, 
	sel0, dout);

	input	[8:0]		din0;
	input	[8:0]		din1;
	input			sel0;
	output	[8:0]		dout;

	wire			psel0;
	wire			psel1;

	cl_dp1_penc2_8x c0_0(
		.sel0				(sel0), 
		.psel0				(psel0), 
		.psel1				(psel1));
	mux2s #(9) d0_0(
		.sel0				(psel0), 
		.sel1				(psel1), 
		.in0				(din0[8:0]), 
		.in1				(din1[8:0]), 
		.dout				(dout[8:0]));
endmodule
`endcelldefine

`celldefine
module nand_macro__dnand_4x__ports_3__stack_10c__width_1(din0, din1, din2, dout)
	;

	input	[0:0]		din0;
	input	[0:0]		din1;
	input	[0:0]		din2;
	output	[0:0]		dout;

	nand3 #(1) d0_0(
		.in0				(din0[0]), 
		.in1				(din1[0]), 
		.in2				(din2[0]), 
		.out				(dout[0]));
endmodule
`endcelldefine

`celldefine
module nand_macro__dnand_12x__ports_2__stack_10c__width_1(din0, din1, dout);

	input	[0:0]		din0;
	input	[0:0]		din1;
	output	[0:0]		dout;

	nand2 #(1) d0_0(
		.in0				(din0[0]), 
		.in1				(din1[0]), 
		.out				(dout[0]));
endmodule
`endcelldefine

`celldefine
module inv_macro__dinv_4x__stack_10c__width_1(din, dout);

	input	[0:0]		din;
	output	[0:0]		dout;

	inv #(1) d0_0(
		.in				(din[0]), 
		.out				(dout[0]));
endmodule
`endcelldefine

`celldefine
module inv_macro__dinv_12x__stack_10c__width_9(din, dout);

	input	[8:0]		din;
	output	[8:0]		dout;

	inv #(9) d0_0(
		.in				(din[8:0]), 
		.out				(dout[8:0]));
endmodule
`endcelldefine

`celldefine
module and_macro__dinv_12x__dnand_4x__ports_4__stack_10c__width_2(din0, din1, 
	din2, din3, dout);

	input	[1:0]		din0;
	input	[1:0]		din1;
	input	[1:0]		din2;
	input	[1:0]		din3;
	output	[1:0]		dout;

	and4 #(2) d0_0(
		.in0				(din0[1:0]), 
		.in1				(din1[1:0]), 
		.in2				(din2[1:0]), 
		.in3				(din3[1:0]), 
		.out				(dout[1:0]));
endmodule
`endcelldefine

`celldefine
module and_macro__dinv_8x__dnand_2x__ports_3__stack_10c__width_4(din0, din1, 
	din2, dout);

	input	[3:0]		din0;
	input	[3:0]		din1;
	input	[3:0]		din2;
	output	[3:0]		dout;

	and3 #(4) d0_0(
		.in0				(din0[3:0]), 
		.in1				(din1[3:0]), 
		.in2				(din2[3:0]), 
		.out				(dout[3:0]));
endmodule
`endcelldefine

`celldefine
module nor_macro__dnor_8x__ports_2__stack_10c__width_3(din0, din1, dout);

	input	[2:0]		din0;
	input	[2:0]		din1;
	output	[2:0]		dout;

	nor2 #(3) d0_0(
		.in0				(din0[2:0]), 
		.in1				(din1[2:0]), 
		.out				(dout[2:0]));
endmodule
`endcelldefine

`celldefine
module nand_macro__dnand_2x__ports_2__stack_10c__width_5(din0, din1, dout);

	input	[4:0]		din0;
	input	[4:0]		din1;
	output	[4:0]		dout;

	nand2 #(5) d0_0(
		.in0				(din0[4:0]), 
		.in1				(din1[4:0]), 
		.out				(dout[4:0]));
endmodule
`endcelldefine

`celldefine
module nand_macro__dnand_8x__ports_2__stack_10c__width_1(din0, din1, dout);

	input	[0:0]		din0;
	input	[0:0]		din1;
	output	[0:0]		dout;

	nand2 #(1) d0_0(
		.in0				(din0[0]), 
		.in1				(din1[0]), 
		.out				(dout[0]));
endmodule
`endcelldefine

`celldefine
module inv_macro__dinv_4x__stack_10c__width_5(din, dout);

	input	[4:0]		din;
	output	[4:0]		dout;

	inv #(5) d0_0(
		.in				(din[4:0]), 
		.out				(dout[4:0]));
endmodule
`endcelldefine

`celldefine
module nand_macro__dnand_8x__ports_3__stack_10c__width_8(din0, din1, din2, dout)
	;

	input	[7:0]		din0;
	input	[7:0]		din1;
	input	[7:0]		din2;
	output	[7:0]		dout;

	nand3 #(8) d0_0(
		.in0				(din0[7:0]), 
		.in1				(din1[7:0]), 
		.in2				(din2[7:0]), 
		.out				(dout[7:0]));
endmodule
`endcelldefine

`celldefine
module nand_macro__dnand_32x__ports_2__stack_10c__width_9(din0, din1, dout);

	input	[8:0]		din0;
	input	[8:0]		din1;
	output	[8:0]		dout;

	nand2 #(9) d0_0(
		.in0				(din0[8:0]), 
		.in1				(din1[8:0]), 
		.out				(dout[8:0]));
endmodule
`endcelldefine

`celldefine
module buff_macro__dbuff_48x__stack_10c__width_9(din, dout);

	input	[8:0]		din;
	output	[8:0]		dout;

	buff #(9) d0_0(
		.in				(din[8:0]), 
		.out				(dout[8:0]));
endmodule
`endcelldefine

`celldefine
module buff_macro__dbuff_32x__stack_10c__width_9(din, dout);

	input	[8:0]		din;
	output	[8:0]		dout;

	buff #(9) d0_0(
		.in				(din[8:0]), 
		.out				(dout[8:0]));
endmodule
`endcelldefine

`celldefine
module buff_macro__dbuff_16x__minbuff_1__stack_10c__width_9(din, dout);

	input	[8:0]		din;
	output	[8:0]		dout;

	buff #(9) d0_0(
		.in				(din[8:0]), 
		.out				(dout[8:0]));
endmodule
`endcelldefine

`celldefine
module inv_macro__dinv_8x__stack_10c__width_9(din, dout);

	input	[8:0]		din;
	output	[8:0]		dout;

	inv #(9) d0_0(
		.in				(din[8:0]), 
		.out				(dout[8:0]));
endmodule
`endcelldefine

`celldefine
module nand_macro__dnand_1x__ports_3__stack_10c__width_9(din0, din1, din2, dout)
	;

	input	[8:0]		din0;
	input	[8:0]		din1;
	input	[8:0]		din2;
	output	[8:0]		dout;

	nand3 #(9) d0_0(
		.in0				(din0[8:0]), 
		.in1				(din1[8:0]), 
		.in2				(din2[8:0]), 
		.out				(dout[8:0]));
endmodule
`endcelldefine

`celldefine
module nand_macro__dnand_1x__ports_2__stack_10c__width_10(din0, din1, dout);

	input	[9:0]		din0;
	input	[9:0]		din1;
	output	[9:0]		dout;

	nand2 #(10) d0_0(
		.in0				(din0[9:0]), 
		.in1				(din1[9:0]), 
		.out				(dout[9:0]));
endmodule
`endcelldefine

`celldefine
module msff_macro__dmsff_8x__stack_10c__stack_10c__width_10(din, clk, en, se, 
	scan_in, siclk, soclk, pce_ov, stop, dout, scan_out);

	input	[9:0]		din;
	input			clk;
	input			en;
	input			se;
	input			scan_in;
	input			siclk;
	input			soclk;
	input			pce_ov;
	input			stop;
	output	[9:0]		dout;
	output			scan_out;

	wire			l1clk;
	wire			siclk_out;
	wire			soclk_out;
	wire	[8:0]		so;

	cl_dp1_l1hdr_8x c0_0(
		.l2clk				(clk), 
		.pce				(en), 
		.aclk				(siclk), 
		.bclk				(soclk), 
		.l1clk				(l1clk), 
		.se				(se), 
		.pce_ov				(pce_ov), 
		.stop				(stop), 
		.siclk_out			(siclk_out), 
		.soclk_out			(soclk_out));
	dff #(10) d0_0(
		.l1clk				(l1clk), 
		.siclk				(siclk_out), 
		.soclk				(soclk_out), 
		.d				(din[9:0]), 
		.si				({scan_in, so[8:0]}), 
		.so				({so[8:0], scan_out}), 
		.q				(dout[9:0]));
endmodule
`endcelldefine

`celldefine
module nand_macro__dnand_2x__ports_2__stack_10c__width_9(din0, din1, dout);

	input	[8:0]		din0;
	input	[8:0]		din1;
	output	[8:0]		dout;

	nand2 #(9) d0_0(
		.in0				(din0[8:0]), 
		.in1				(din1[8:0]), 
		.out				(dout[8:0]));
endmodule
`endcelldefine

`celldefine
module nand_macro__dnand_4x__ports_3__stack_10c__width_9(din0, din1, din2, dout)
	;

	input	[8:0]		din0;
	input	[8:0]		din1;
	input	[8:0]		din2;
	output	[8:0]		dout;

	nand3 #(9) d0_0(
		.in0				(din0[8:0]), 
		.in1				(din1[8:0]), 
		.in2				(din2[8:0]), 
		.out				(dout[8:0]));
endmodule
`endcelldefine

`celldefine
module nand_macro__dnand_8x__ports_2__stack_10c__width_9(din0, din1, dout);

	input	[8:0]		din0;
	input	[8:0]		din1;
	output	[8:0]		dout;

	nand2 #(9) d0_0(
		.in0				(din0[8:0]), 
		.in1				(din1[8:0]), 
		.out				(dout[8:0]));
endmodule
`endcelldefine

`celldefine
module nor_macro__dnor_4x__ports_3__stack_10c__width_6(din0, din1, din2, dout);

	input	[5:0]		din0;
	input	[5:0]		din1;
	input	[5:0]		din2;
	output	[5:0]		dout;

	nor3 #(6) d0_0(
		.in0				(din0[5:0]), 
		.in1				(din1[5:0]), 
		.in2				(din2[5:0]), 
		.out				(dout[5:0]));
endmodule
`endcelldefine

`celldefine
module nand_macro__dnand_8x__ports_3__stack_10c__width_2(din0, din1, din2, dout)
	;

	input	[1:0]		din0;
	input	[1:0]		din1;
	input	[1:0]		din2;
	output	[1:0]		dout;

	nand3 #(2) d0_0(
		.in0				(din0[1:0]), 
		.in1				(din1[1:0]), 
		.in2				(din2[1:0]), 
		.out				(dout[1:0]));
endmodule
`endcelldefine

`celldefine
module inv_macro__dinv_32x__stack_10c__width_1(din, dout);

	input	[0:0]		din;
	output	[0:0]		dout;

	inv #(1) d0_0(
		.in				(din[0]), 
		.out				(dout[0]));
endmodule
`endcelldefine

`celldefine
module nand_macro__dnand_1x__ports_3__stack_10c__width_3(din0, din1, din2, dout)
	;

	input	[2:0]		din0;
	input	[2:0]		din1;
	input	[2:0]		din2;
	output	[2:0]		dout;

	nand3 #(3) d0_0(
		.in0				(din0[2:0]), 
		.in1				(din1[2:0]), 
		.in2				(din2[2:0]), 
		.out				(dout[2:0]));
endmodule
`endcelldefine

`celldefine
module nor_macro__dnor_4x__ports_3__stack_10c__width_1(din0, din1, din2, dout);

	input	[0:0]		din0;
	input	[0:0]		din1;
	input	[0:0]		din2;
	output	[0:0]		dout;

	nor3 #(1) d0_0(
		.in0				(din0[0]), 
		.in1				(din1[0]), 
		.in2				(din2[0]), 
		.out				(dout[0]));
endmodule
`endcelldefine

`celldefine
module mux2s(dout, in0, in1, sel0, sel1);

	parameter		SIZE		= 1;

	output	[(SIZE - 1):0]	dout;
	input	[(SIZE - 1):0]	in0;
	input	[(SIZE - 1):0]	in1;
	input			sel0;
	input			sel1;

	assign dout = ((in0 & {SIZE {sel0}}) | (in1 & {SIZE {sel1}}));
endmodule
`endcelldefine

`celldefine
module mux4s(dout, in0, in1, in2, in3, sel0, sel1, sel2, sel3);

	parameter		SIZE		= 1;

	output	[(SIZE - 1):0]	dout;
	input	[(SIZE - 1):0]	in0;
	input	[(SIZE - 1):0]	in1;
	input	[(SIZE - 1):0]	in2;
	input	[(SIZE - 1):0]	in3;
	input			sel0;
	input			sel1;
	input			sel2;
	input			sel3;

	assign dout = ((((in0 & {SIZE {sel0}}) | (in1 & {SIZE {sel1}})) | (in2 &
		{SIZE {sel2}})) | (in3 & {SIZE {sel3}}));
endmodule
`endcelldefine

`celldefine
module mux8s(dout, in0, in1, in2, in3, in4, in5, in6, in7, sel0, sel1, sel2, 
	sel3, sel4, sel5, sel6, sel7);

	parameter		SIZE		= 1;

	output	[(SIZE - 1):0]	dout;
	input	[(SIZE - 1):0]	in0;
	input	[(SIZE - 1):0]	in1;
	input	[(SIZE - 1):0]	in2;
	input	[(SIZE - 1):0]	in3;
	input	[(SIZE - 1):0]	in4;
	input	[(SIZE - 1):0]	in5;
	input	[(SIZE - 1):0]	in6;
	input	[(SIZE - 1):0]	in7;
	input			sel0;
	input			sel1;
	input			sel2;
	input			sel3;
	input			sel4;
	input			sel5;
	input			sel6;
	input			sel7;

	assign dout = ((((((((in0 & {SIZE {sel0}}) | (in1 & {SIZE {sel1}})) | (
		in2 & {SIZE {sel2}})) | (in3 & {SIZE {sel3}})) | (in4 & {SIZE {
		sel4}})) | (in5 & {SIZE {sel5}})) | (in6 & {SIZE {sel6}})) | (
		in7 & {SIZE {sel7}}));
endmodule
`endcelldefine

`celldefine
module dff(q, so, d, l1clk, si, siclk, soclk);

	parameter		SIZE		= 1;

	output	[(SIZE - 1):0]	q;
	output	[(SIZE - 1):0]	so;
	input	[(SIZE - 1):0]	d;
	input			l1clk;
	input	[(SIZE - 1):0]	si;
	input			siclk;
	input			soclk;

	reg	[(SIZE - 1):0]	q;
	reg	[(SIZE - 1):0]	l1;

	assign so[(SIZE - 1):0] = q[(SIZE - 1):0];

	always @(posedge l1clk or posedge siclk) begin
	  if (siclk) begin
	    q[(SIZE - 1):0] <= {SIZE {1'b0}};
	  end
	  else
	    begin
	      q[(SIZE - 1):0] <= d[(SIZE - 1):0];
	    end
	end
endmodule
`endcelldefine

`celldefine
module and3(out, in0, in1, in2);

	parameter		SIZE		= 1;

	output	[(SIZE - 1):0]	out;
	input	[(SIZE - 1):0]	in0;
	input	[(SIZE - 1):0]	in1;
	input	[(SIZE - 1):0]	in2;

	assign out[(SIZE - 1):0] = ((in0[(SIZE - 1):0] & in1[(SIZE - 1):0]) & 
		in2[(SIZE - 1):0]);
endmodule
`endcelldefine

`celldefine
module and4(out, in0, in1, in2, in3);

	parameter		SIZE		= 1;

	output	[(SIZE - 1):0]	out;
	input	[(SIZE - 1):0]	in0;
	input	[(SIZE - 1):0]	in1;
	input	[(SIZE - 1):0]	in2;
	input	[(SIZE - 1):0]	in3;

	assign out[(SIZE - 1):0] = (((in0[(SIZE - 1):0] & in1[(SIZE - 1):0]) & 
		in2[(SIZE - 1):0]) & in3[(SIZE - 1):0]);
endmodule
`endcelldefine

`celldefine
module nand2(out, in0, in1);

	parameter		SIZE		= 1;

	output	[(SIZE - 1):0]	out;
	input	[(SIZE - 1):0]	in0;
	input	[(SIZE - 1):0]	in1;

	assign out[(SIZE - 1):0] = (~(in0[(SIZE - 1):0] & in1[(SIZE - 1):0]));
endmodule
`endcelldefine

`celldefine
module nand3(out, in0, in1, in2);

	parameter		SIZE		= 1;

	output	[(SIZE - 1):0]	out;
	input	[(SIZE - 1):0]	in0;
	input	[(SIZE - 1):0]	in1;
	input	[(SIZE - 1):0]	in2;

	assign out[(SIZE - 1):0] = (~((in0[(SIZE - 1):0] & in1[(SIZE - 1):0]) & 
		in2[(SIZE - 1):0]));
endmodule
`endcelldefine

`celldefine
module nor2(out, in0, in1);

	parameter		SIZE		= 1;

	output	[(SIZE - 1):0]	out;
	input	[(SIZE - 1):0]	in0;
	input	[(SIZE - 1):0]	in1;

	assign out[(SIZE - 1):0] = (~(in0[(SIZE - 1):0] | in1[(SIZE - 1):0]));
endmodule
`endcelldefine

`celldefine
module nor3(out, in0, in1, in2);

	parameter		SIZE		= 1;

	output	[(SIZE - 1):0]	out;
	input	[(SIZE - 1):0]	in0;
	input	[(SIZE - 1):0]	in1;
	input	[(SIZE - 1):0]	in2;

	assign out[(SIZE - 1):0] = (~((in0[(SIZE - 1):0] | in1[(SIZE - 1):0]) | 
		in2[(SIZE - 1):0]));
endmodule
`endcelldefine

`celldefine
module buff(out, in);

	parameter		SIZE		= 1;

	output	[(SIZE - 1):0]	out;
	input	[(SIZE - 1):0]	in;

	assign out[(SIZE - 1):0] = in[(SIZE - 1):0];
endmodule
`endcelldefine

`celldefine
module inv(out, in);

	parameter		SIZE		= 1;

	output	[(SIZE - 1):0]	out;
	input	[(SIZE - 1):0]	in;

	assign out[(SIZE - 1):0] = (~in[(SIZE - 1):0]);
endmodule
`endcelldefine

`celldefine
module cl_dp1_l1hdr_8x(l1clk, l2clk, se, pce, pce_ov, stop, aclk, bclk, 
	siclk_out, soclk_out);

	output			l1clk;
	input			l2clk;
	input			se;
	input			pce;
	input			pce_ov;
	input			stop;
	input			aclk;
	input			bclk;
	output			siclk_out;
	output			soclk_out;

	reg			l1en;

	assign l1clk = ((l2clk & l1en) || se);
	assign siclk_out = aclk;
	assign soclk_out = bclk;

	always @(l2clk or stop or pce or pce_ov) begin
	  if (~l2clk) begin
	    l1en <= ((~stop) & (pce | pce_ov));
	  end
	end
endmodule
`endcelldefine

`celldefine
module cl_dp1_muxbuff2_8x(in0, in1, out0, out1);

	input			in0;
	input			in1;
	output			out0;
	output			out1;

	buf (out1, in1);
	buf (out0, in0);
endmodule
`endcelldefine

`celldefine
module cl_dp1_pdec4_8x(sel0, sel1, test, psel0, psel1, psel2, psel3);

	input			sel0;
	input			sel1;
	input			test;
	output			psel0;
	output			psel1;
	output			psel2;
	output			psel3;

	assign psel0 = ((~sel1) & (~sel0));
	assign psel1 = ((~sel1) & sel0);
	assign psel2 = (sel1 & (~sel0));
	assign psel3 = ((sel1 & sel0) & test);
endmodule
`endcelldefine

`celldefine
module cl_dp1_pdec8_8x(sel0, sel1, sel2, test, psel0, psel1, psel2, psel3, 
	psel4, psel5, psel6, psel7);

	input			sel0;
	input			sel1;
	input			sel2;
	input			test;
	output			psel0;
	output			psel1;
	output			psel2;
	output			psel3;
	output			psel4;
	output			psel5;
	output			psel6;
	output			psel7;

	assign psel0 = ((((~sel2) & (~sel1)) & (~sel0)) & test);
	assign psel1 = (((~sel2) & (~sel1)) & sel0);
	assign psel2 = (((~sel2) & sel1) & (~sel0));
	assign psel3 = (((~sel2) & sel1) & sel0);
	assign psel4 = ((sel2 & (~sel1)) & (~sel0));
	assign psel5 = ((sel2 & (~sel1)) & sel0);
	assign psel6 = ((sel2 & sel1) & (~sel0));
	assign psel7 = ((sel2 & sel1) & sel0);
endmodule
`endcelldefine

`celldefine
module cl_dp1_penc2_8x(sel0, psel0, psel1);

	input			sel0;
	output			psel0;
	output			psel1;

	assign psel0 = sel0;
	assign psel1 = (~sel0);
endmodule
`endcelldefine

`celldefine
module cl_u1_aoi22_4x(out, in10, in11, in00, in01);

	output			out;
	input			in10;
	input			in11;
	input			in00;
	input			in01;

	assign out = (~((in10 & in11) | (in00 & in01)));
endmodule
`endcelldefine

`celldefine
module cl_u1_buf_16x(in, out);

	input			in;
	output			out;

	buf (out, in);
endmodule
`endcelldefine

`celldefine
module cl_u1_buf_32x(in, out);

	input			in;
	output			out;

	buf (out, in);
endmodule
`endcelldefine

`celldefine
module cl_u1_buf_8x(in, out);

	input			in;
	output			out;

	buf (out, in);
endmodule
`endcelldefine

`celldefine
module cl_u1_inv_16x(in, out);

	input			in;
	output			out;

	not (out, in);
endmodule
`endcelldefine

`celldefine
module cl_u1_inv_32x(in, out);

	input			in;
	output			out;

	not (out, in);
endmodule
`endcelldefine

`celldefine
module cl_u1_inv_8x(in, out);

	input			in;
	output			out;

	not (out, in);
endmodule
`endcelldefine

`celldefine
module cl_u1_nand2_16x(in0, in1, out);

	input			in0;
	input			in1;
	output			out;

	assign out = (~(in0 & in1));
endmodule
`endcelldefine

`celldefine
module cl_u1_nand2_8x(in0, in1, out);

	input			in0;
	input			in1;
	output			out;

	assign out = (~(in0 & in1));
endmodule
`endcelldefine

`celldefine
module cl_u1_nand3_8x(in0, in1, in2, out);

	input			in0;
	input			in1;
	input			in2;
	output			out;

	assign out = (~((in0 & in1) & in2));
endmodule
`endcelldefine

`celldefine
module cl_u1_nor2_16x(in0, in1, out);

	input			in0;
	input			in1;
	output			out;

	assign out = (~(in0 | in1));
endmodule
`endcelldefine

`celldefine
module cl_u1_nor3_4x(in0, in1, in2, out);

	input			in0;
	input			in1;
	input			in2;
	output			out;

	assign out = (~((in0 | in1) | in2));
endmodule
`endcelldefine

`celldefine
module cl_u1_oai22_4x(out, in10, in11, in00, in01);

	output			out;
	input			in10;
	input			in11;
	input			in00;
	input			in01;

	assign out = (~((in10 | in11) & (in00 | in01)));
endmodule
`endcelldefine

`celldefine
module cl_sc1_l1hdr_8x(l2clk, se, pce, pce_ov, stop, l1clk);

	input			l2clk;
	input			se;
	input			pce;
	input			pce_ov;
	input			stop;
	output			l1clk;

	reg			l1en;

	assign l1clk = ((l2clk & l1en) | se);

	always @(l2clk or stop or pce or pce_ov) begin
	  if (~l2clk) begin
	    l1en <= ((~stop) & (pce | pce_ov));
	  end
	end
endmodule
`endcelldefine

`celldefine
module cl_sc1_msff_8x(q, so, d, l1clk, si, siclk, soclk);

	parameter		SIZE		= 1;

	output			q;
	output			so;
	input			d;
	input			l1clk;
	input			si;
	input			siclk;
	input			soclk;

	reg			q;
	reg			l1;

	assign so = q;

	always @(posedge l1clk or posedge siclk) begin
	  if (siclk) begin
	    q <= 1'b0;
	  end
	  else
	    begin
	      q <= d;
	    end
	end
endmodule
`endcelldefine

`celldefine
module msff_ctl_macro__width_5(din, l1clk, scan_in, siclk, soclk, dout, scan_out
	);

	input	[4:0]		din;
	input			l1clk;
	input			scan_in;
	input			siclk;
	input			soclk;
	output	[4:0]		dout;
	output			scan_out;

	wire	[4:0]		fdin;
	wire	[3:0]		so;

	assign fdin[4:0] = din[4:0];

	dff #(5) d0_0(
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.d				(fdin[4:0]), 
		.si				({scan_in, so[3:0]}), 
		.so				({so[3:0], scan_out}), 
		.q				(dout[4:0]));
endmodule
`endcelldefine

`celldefine
module buff_macro__dbuff_32x__stack_none__width_1(din, dout);

	input	[0:0]		din;
	output	[0:0]		dout;

	buff #(1) d0_0(
		.in				(din[0]), 
		.out				(dout[0]));
endmodule
`endcelldefine

`celldefine
module buff_macro__dbuff_8x__stack_none__width_1(din, dout);

	input	[0:0]		din;
	output	[0:0]		dout;

	buff #(1) d0_0(
		.in				(din[0]), 
		.out				(dout[0]));
endmodule
`endcelldefine

`endif // `ifdef FPGA
