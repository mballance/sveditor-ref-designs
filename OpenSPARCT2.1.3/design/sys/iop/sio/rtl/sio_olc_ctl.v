// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sio_olc_ctl.v
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
`define SIO_L2SIO_J_BIT            31
`define SIO_L2SIO_CTGECC_MSB_BIT   30
`define SIO_L2SIO_CTGECC_LSB_BIT   25
`define SIO_L2SIO_RASUE_BIT           24
`define SIO_L2SIO_O_BIT            23
`define SIO_L2SIO_P_BIT            22
`define SIO_L2SIO_E_BIT            21
`define SIO_L2SIO_S_BIT            20
`define SIO_L2SIO_CBA2_BIT         19
`define SIO_L2SIO_CBA1_BIT         18
`define SIO_L2SIO_CBA0_BIT         17
`define SIO_L2SIO_R_BIT            16

`define RF_RDEN_OFFSTATE            1'b1

/* 2 per L2 bank, or 16 instances in SIO */
/* Write fast, Read fast */
`define SIO_OLD_RF_DATAWIDTH          32
`define SIO_OLD_RF_ADDRWIDTH           5
`define SIO_OLD_RF_DEPTH              32

/* 2 per IO device, or 4 instances in SIO */
/* Write fast, Read slow */
/* only using 68 out of 72 bits now */
`define SIO_OPD_DATA_RF_DATAWIDTH     72
`define SIO_OPD_DATA_RF_ADDRWIDTH      6
`define SIO_OPD_DATA_RF_DEPTH         64

/* 1 per IO device, or 2 instances in SIO */	       	       
/* Write fast, Read slow */
/* Logically use 18 bits wide and 16 entries */
/* Memory compiled sync fifo - with input flops, without output flops */

`define SIO_OPD_HDR_RF_DATAWIDTH      18
`define SIO_OPD_HDR_RF_ADDRWIDTH       4
`define SIO_OPD_HDR_RF_DEPTH          16



module sio_olc_ctl (
  l2clk, 
  olc_oldue_check_clrerr, 
  olc_oldue_check_en, 
  olc_oldue_wr_en, 
  olc_oldue_rd_addr, 
  olc_oldue_selfwd, 
  olc_oldue_pass_late_ue, 
  olc_old_selhdr, 
  olc_oldhq_wr_en, 
  olc_oldhq_rd_addr, 
  olc_olddq0_wr_en, 
  olc_olddq0_wr_addr, 
  olc_olddq0_rd_en, 
  olc_olddq0_rd_addr, 
  olc_olddq1_wr_en, 
  olc_olddq1_wr_addr, 
  olc_olddq1_rd_en, 
  olc_olddq1_rd_addr, 
  l2sio_v_bit, 
  l2sio_r_bit, 
  l2sio_p_bit, 
  l2sio_j_bit, 
  l2b_sio_ue_err_r, 
  olc_opcc_req, 
  opcc_olc_gnt, 
  sio_sii_olc_ilc_dequeue, 
  ojc_old_wr_en, 
  ojc_old_jtagsr_en, 
  ojc_opcc_sync, 
  ojc_opcc_ack, 
  tcu_scan_en, 
  scan_in, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  scan_out);
wire se;
wire siclk;
wire soclk;
wire pce_ov;
wire stop;
wire l1clk;
wire si_0;
wire so_0;
wire ojc_old_jtagsr_en_l;
wire ojc_old_jtagsr_en_r;
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
wire ojc_cycle_sol1;
wire ojc_cycle_sol0;
wire [5:0] shcnt;
wire ojc_cycle_soh0;
wire ojc_ack_soh0;
wire [5:0] shcnt_next;
wire ff_ojc_cycle_sox_scanin;
wire ff_ojc_cycle_sox_scanout;
wire ojc_cycle_soh1;
wire ff_ojc_ack_sox_scanin;
wire ff_ojc_ack_sox_scanout;
wire ojc_ack_sol1;
wire ojc_ack_sol0;
wire ojc_ack_soh1;
wire ff_ojc_shcnt_scanin;
wire ff_ojc_shcnt_scanout;
wire [15:0] olc_cycle_sol;
wire ue_check_en;
wire ue_wr_en;
wire [2:0] ue_wr_ptr;
wire [2:0] ue_rd_ptr;
wire olc_cycle_slph;
wire was_notcutthru;
wire uestore_;
wire olc_oldue_pass_late_ue_l;
wire olc_oldue_pass_late_ue_r;
wire ff_pass_late_ue_scanin;
wire ff_pass_late_ue_scanout;
wire ff_l2b_sio_ue_err_scanin;
wire ff_l2b_sio_ue_err_scanout;
wire olc_cycle_soh0;
wire [2:0] hq_wr_ptr;
wire [2:0] hq_rd_ptr;
wire pq0_wr_en;
wire [6:0] pq_wr_ptr;
wire pq0_rd_en;
wire [6:0] pq_rd_ptr;
wire pq1_wr_en;
wire pq1_rd_en;
wire [15:0] olc_nextcycleis_sol;
wire olc_cycle_soh1;
wire ff_olc_cycle_scanin;
wire ff_olc_cycle_scanout;
wire olc_nextcycleis_soh1;
wire hq_wr_ptr_inc;
wire [2:0] hq_wr_ptr_next;
wire [2:0] hq_wr_ptr_plus1;
wire ff_hq_wr_ptr_scanin;
wire ff_hq_wr_ptr_scanout;
wire [6:0] pq_wr_ptr_next;
wire pq_wr_ptr_inc;
wire [6:0] pq_wr_ptr_plus1;
wire ff_pq_wr_ptr_scanin;
wire ff_pq_wr_ptr_scanout;
wire ff_pq_wr_en_scanin;
wire ff_pq_wr_en_scanout;
wire pq1_nextwren;
wire pq0_nextwren;
wire pq0_wr_ptr_inc;
wire pq1_wr_ptr_inc;
wire ue_nextchecken;
wire ue_nextwren;
wire ue_wr_ptr_inc;
wire [2:0] ue_wr_ptr_next;
wire [2:0] ue_wr_ptr_plus1;
wire ff_ue_en_scanin;
wire ff_ue_en_scanout;
wire ff_ue_wr_ptr_scanin;
wire ff_ue_wr_ptr_scanout;
wire olc_nextcycleis_slpr;
wire olc_cycle_slpr;
wire header_access_same_entry;
wire oldhq_dout_r_bit;
wire payload_ready;
wire header_will_access_same_entry;
wire future_payload_ready;
wire header_now_access_same_entry;
wire future_payload_was_ready;
wire olc_nextcycleis_slph;
wire ff_slp_cycle_scanin;
wire ff_slp_cycle_scanout;
wire [2:0] hq_rd_ptr_plus1;
wire ff_header_now_access_same_entry_scanin;
wire ff_header_now_access_same_entry_scanout;
wire notcutthru;
wire payload_access_same_line;
wire same_line_write_above_threshold;
wire payload_will_access_same_line;
wire [6:0] pq_rd_ptr_plus1;
wire [6:0] pq_rd_ptr_plus6;
wire ff_payload_readys_scanin;
wire ff_payload_readys_scanout;
wire hq_rd_ptr_inc;
wire ue_rd_ptr_inc_e1;
wire [2:0] hq_rd_ptr_next;
wire ff_ue_rd_ptr_inc_scanin;
wire ff_ue_rd_ptr_inc_scanout;
wire ue_rd_ptr_inc;
wire ff_hq_rd_ptr_scanin;
wire ff_hq_rd_ptr_scanout;
wire ff_dequeue_scanin;
wire ff_dequeue_scanout;
wire pq_rd_ptr_inc;
wire pq1_nextrden;
wire pq0_nextrden;
wire [6:0] pq_rd_ptr_next;
wire [2:0] ue_rd_ptr_next;
wire [2:0] ue_rd_ptr_plus1;
wire ff_pq_rd_ptr_scanin;
wire ff_pq_rd_ptr_scanout;
wire ff_pq_rd_en_scanin;
wire ff_pq_rd_en_scanout;
wire ff_ue_rd_ptr_scanin;
wire ff_ue_rd_ptr_scanout;
wire ff_l2sio_r_bit0_scanin;
wire ff_l2sio_r_bit0_scanout;
wire pre_r_bit0;
wire l2sio_r_bit0_r;
wire ff_l2sio_r_bit1_scanin;
wire ff_l2sio_r_bit1_scanout;
wire pre_r_bit1;
wire l2sio_r_bit1_r;
wire ff_l2sio_r_bit2_scanin;
wire ff_l2sio_r_bit2_scanout;
wire pre_r_bit2;
wire l2sio_r_bit2_r;
wire ff_l2sio_r_bit3_scanin;
wire ff_l2sio_r_bit3_scanout;
wire pre_r_bit3;
wire l2sio_r_bit3_r;
wire ff_l2sio_r_bit_scanin;
wire ff_l2sio_r_bit_scanout;


   input          l2clk;
   output 	  olc_oldue_check_clrerr;      // start of parity checking -- clear out any prior error state
   output 	  olc_oldue_check_en;          // flop-enable for the parity error accumulator
   output [3:0]	  olc_oldue_wr_en;             // write enable for UE fifo
   output [1:0]   olc_oldue_rd_addr;           // read pointer for UE fifo
   output 	  olc_oldue_selfwd;          // cut-thru case --- ue fifo is not correct
   output 	  olc_oldue_pass_late_ue;
   
   output 	  olc_old_selhdr;            // select header not data as outputs


   output [3:0]	  olc_oldhq_wr_en;	// header queue write-enable
   output [ 1:0]  olc_oldhq_rd_addr;	// header queue read-addr

   output 	  olc_olddq0_wr_en;	// data queue write-enable

// output [`SIO_OLD_RF_ADDRWIDTH-1:0] olc_olddq0_wr_addr;	// data queue write-addr
   output [4:0]   olc_olddq0_wr_addr;	// data queue write-addr
   output 	  olc_olddq0_rd_en;	// data queue read-enable

// output [`SIO_OLD_RF_ADDRWIDTH-1:00] olc_olddq0_rd_addr;	// data queue read-addr
   output [4:0]   olc_olddq0_rd_addr;	// data queue read-addr

   output 	  olc_olddq1_wr_en;	// data queue write-enable

// output [`SIO_OLD_RF_ADDRWIDTH-1:00] olc_olddq1_wr_addr;	// data queue write-addr
   output [4:0]   olc_olddq1_wr_addr;	// data queue write-addr
   output 	  olc_olddq1_rd_en;	// data queue read-enable

// output [`SIO_OLD_RF_ADDRWIDTH-1:00] olc_olddq1_rd_addr;	// data queue read-addr
   output [4:0]   olc_olddq1_rd_addr;	// data queue read-addr


   input          l2sio_v_bit;          // Response valid from L2 to SIO
   input          l2sio_r_bit;          // read bit - 1 = read, 0=write
   input          l2sio_p_bit;          // Posted bit - 1=no ack needed
   input          l2sio_j_bit;          // Jtag bit - 1 = jtag
   input	  l2b_sio_ue_err_r;
 	  


   output 	  olc_opcc_req;          // request for olp bus

   input 	  opcc_olc_gnt; // transfer is granted
    
   output 	  sio_sii_olc_ilc_dequeue; // dequeued an request buffer entry
//   output 	  sio_sii_olc_ilc_data_dequeue; // dequeued a read buffer entry
   

   output [1:0]	  ojc_old_wr_en;	// store the jtag read data, 
                                        // [1]=load 8Bytes to head (63:32), [0]=load 8Bytes to tail
   output 	  ojc_old_jtagsr_en;	// either store the jtag read data or
                                        // shift....
                                        // shift out another bit from the head (lsb),
                                        // shift bits [n:1] into [n-1:0]
                                        // shift in a 0 to the tail [n]
   output 	  ojc_opcc_sync;
   output 	  ojc_opcc_ack;
 	  

   
   input 	  tcu_scan_en;
   input 	  scan_in;
   input 	  tcu_aclk;
   input 	  tcu_bclk; 
   input 	  tcu_pce_ov;
   input 	  tcu_clk_stop;
   output 	  scan_out;

   reg		pre_r_bit;

   ///////////////////////////////////////
   // Scan chain connections            
   ///////////////////////////////////////
   // scan renames
   assign 	  se = tcu_scan_en;
   assign 	  siclk = tcu_aclk;
   assign 	  soclk = tcu_bclk;
   assign 	  pce_ov = tcu_pce_ov;
   assign 	  stop = tcu_clk_stop;
   // end scan

   sio_olc_ctl_l1clkhdr_ctl_macro clkgen (
			      .l2clk  (l2clk                  ),
			      .l1en   (1'b1                   ),
			      .l1clk  (l1clk                  ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
			      );
// spare gates expansion
cl_sc1_msff_8x ff_ojc_old_jtagsr_en (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_0),
                               .so(so_0),
                               .d(ojc_old_jtagsr_en_l),
                               .q(ojc_old_jtagsr_en_r));

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


   ///////////////////////////////////////
   // BEGIN JTAG RESPONSE SECTION
   ///////////////////////////////////////
   
   assign 	  ojc_old_wr_en[1:0] = {ojc_cycle_sol1, ojc_cycle_sol0};
   
   assign 	  ojc_old_jtagsr_en = |{ojc_old_jtagsr_en_l, ojc_old_jtagsr_en_r};
   assign 	  ojc_old_jtagsr_en_l = |{ojc_cycle_sol1, ojc_cycle_sol0, shcnt[5:0]};
   
   assign 	  ojc_cycle_soh0 = l2sio_v_bit & l2sio_j_bit;
   assign 	  ojc_ack_soh0 = l2sio_v_bit & ~l2sio_r_bit;

   assign 	  shcnt_next[5:0] = (ojc_cycle_sol1 | (|shcnt[5:0])) ? (shcnt[5:0] + 6'b000001) : 6'b000000;

   
   sio_olc_ctl_msff_ctl_macro__width_4 ff_ojc_cycle_sox  (
	.scan_in(ff_ojc_cycle_sox_scanin),
	.scan_out(ff_ojc_cycle_sox_scanout),
	.din  ({ojc_cycle_sol1, ojc_cycle_sol0, ojc_cycle_soh1, ojc_cycle_soh0}),
	.dout ({ojc_opcc_sync,  ojc_cycle_sol1, ojc_cycle_sol0, ojc_cycle_soh1}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   sio_olc_ctl_msff_ctl_macro__width_4 ff_ojc_ack_sox  (
	.scan_in(ff_ojc_ack_sox_scanin),
	.scan_out(ff_ojc_ack_sox_scanout),
	.din  ({ojc_ack_sol1, ojc_ack_sol0, ojc_ack_soh1, ojc_ack_soh0}),
	.dout ({ojc_opcc_ack, ojc_ack_sol1, ojc_ack_sol0, ojc_ack_soh1}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   sio_olc_ctl_msff_ctl_macro__width_6 ff_ojc_shcnt  (
	.scan_in(ff_ojc_shcnt_scanin),
	.scan_out(ff_ojc_shcnt_scanout),
	.din  (shcnt_next[5:0]),
	.dout (shcnt[5:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


   ///////////////////////////////////////
   // END JTAG RESPONSE SECTION
   ///////////////////////////////////////
   
   ///////////////////////////////////////
   // BEGIN UE CONTROL SECTION
   ///////////////////////////////////////
   

   
   assign 	 olc_oldue_check_clrerr = olc_cycle_sol[0];
   assign 	 olc_oldue_check_en     = ue_check_en;
   assign 	 olc_oldue_wr_en[3:0]   = {4{ue_wr_en}} & {ue_wr_ptr[1:0] == 2'b11,
							   ue_wr_ptr[1:0] == 2'b10,
							   ue_wr_ptr[1:0] == 2'b01,
							   ue_wr_ptr[1:0] == 2'b00
							  };

   assign        olc_oldue_rd_addr[1:0] = ue_rd_ptr[1:0];
   assign 	 olc_oldue_selfwd       = olc_cycle_slph & was_notcutthru;

   assign 	 uestore_ = ~|olc_oldue_wr_en[3:0];
   assign 	 olc_oldue_pass_late_ue_l = l2sio_v_bit ? 1'b0 :l2b_sio_ue_err_r ? 1'b1 :
		 olc_oldue_pass_late_ue_r;

   // flop the olc_oldue_selfwd setting....clear when we see the ue_we
   sio_olc_ctl_msff_ctl_macro__width_1 ff_pass_late_ue  (
	.scan_in(ff_pass_late_ue_scanin),
	.scan_out(ff_pass_late_ue_scanout),
	.din  (olc_oldue_pass_late_ue_l),
	.dout (olc_oldue_pass_late_ue_r),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   sio_olc_ctl_msff_ctl_macro__width_1 ff_l2b_sio_ue_err  (
	.scan_in(ff_l2b_sio_ue_err_scanin),
	.scan_out(ff_l2b_sio_ue_err_scanout),
	.din  (olc_oldue_pass_late_ue_r),
	.dout (olc_oldue_pass_late_ue),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


   ///////////////////////////////////////
   // END UE CONTROL SECTION
   ///////////////////////////////////////
   
   /////////////////////////////////////////////
   // BEGIN OLDHQ/OLDDQ OUTPUT SIGNALS SECTION
   /////////////////////////////////////////////


   assign 	 olc_old_selhdr         = olc_cycle_slph;
   assign        olc_oldhq_wr_en[3:0] = {4{olc_cycle_soh0}} & {hq_wr_ptr[1:0] == 2'b11,
							       hq_wr_ptr[1:0] == 2'b10,
							       hq_wr_ptr[1:0] == 2'b01,
							       hq_wr_ptr[1:0] == 2'b00
							  };

   assign        olc_oldhq_rd_addr[1:0] = hq_rd_ptr[1:0];

   assign        olc_olddq0_wr_en        = pq0_wr_en;
   assign        olc_olddq0_wr_addr[4:0] = pq_wr_ptr[5:1];
   assign 	 olc_olddq0_rd_en        = pq0_rd_en;
   assign        olc_olddq0_rd_addr[4:0] = pq_rd_ptr[5:1];

   assign        olc_olddq1_wr_en        = pq1_wr_en;
   assign        olc_olddq1_wr_addr[4:0] = pq_wr_ptr[5:1];
   assign 	 olc_olddq1_rd_en        = pq1_rd_en;
   assign        olc_olddq1_rd_addr[4:0] = pq_rd_ptr[5:1];

   /////////////////////////////////////////////
   // END OLDHQ/OLDDQ OUTPUT SIGNALS SECTION
   /////////////////////////////////////////////

   /////////////////////////////////////////////
   // BEGIN  MAIN WRITE CONTROL SECTION
   /////////////////////////////////////////////


   /////////////////////////////////////////////
   //
   // PACKET CYCLE STATEMACHINE
   //
   /////////////////////////////////////////////
   // initiate packet state SOH0 if
   //       tag vld cycle
   //         it's not a jtag source AND
   //         it's a read response or nonposted
   //                 (technically dmu is not allowed to send nonposted...)
   //                  so really should be tag vld and nonposted AND ENT)
   assign 	 olc_cycle_soh0  = l2sio_v_bit & ~l2sio_j_bit & (l2sio_r_bit | ~l2sio_p_bit);
   assign        olc_nextcycleis_sol[15:0] = {olc_cycle_sol[14:0], olc_cycle_soh1};
 
   sio_olc_ctl_msff_ctl_macro__width_17 ff_olc_cycle  (
	.scan_in(ff_olc_cycle_scanin),
	.scan_out(ff_olc_cycle_scanout),
	.din  ({olc_nextcycleis_sol[15:0], olc_nextcycleis_soh1}),
	.dout ({olc_cycle_sol[15:0],       olc_cycle_soh1}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   /////////////////////////////////////////////
   //
   // HEADER QUEUE WRITE POINTER LOGIC
   //
   /////////////////////////////////////////////
   //
   // top bit is to tell wrap around case 
   // -- if top bit diff and lower bits identical, then all full
   // -- if top bit same and lower bits identical, then all empty
   //
   /////////////////////////////////////////////
   
   assign 	 hq_wr_ptr_inc = olc_cycle_soh0;
   assign        olc_nextcycleis_soh1 = l2sio_v_bit & ~l2sio_j_bit & l2sio_r_bit;
   assign 	 hq_wr_ptr_next[2:0] = hq_wr_ptr_inc ? hq_wr_ptr_plus1[2:0] : hq_wr_ptr[2:0];

   assign 	 hq_wr_ptr_plus1[2:0] = hq_wr_ptr[2:0] + 3'b001;


   sio_olc_ctl_msff_ctl_macro__width_3 ff_hq_wr_ptr  (
	.scan_in(ff_hq_wr_ptr_scanin),
	.scan_out(ff_hq_wr_ptr_scanout),
	.din  (hq_wr_ptr_next[2:0]),
	.dout (hq_wr_ptr[2:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   /////////////////////////////////////////////
   //
   // PAYLOAD WRITE POINTER LOGIC 
   //
   /////////////////////////////////////////////
   //
   // - 16 cycles of 32bit per packet, 4 packet deep
   //   subdivided into an upper and lower half
   //    for writing, 
   //   reading is to both simultaneously
   //
   //
   /////////////////////////////////////////////

   assign 	 pq_wr_ptr_next[6:0] = pq_wr_ptr_inc ? pq_wr_ptr_plus1[6:0] : pq_wr_ptr[6:0];

   assign 	 pq_wr_ptr_plus1[6:0] = pq_wr_ptr[6:0] + 7'b0000001;
   

   sio_olc_ctl_msff_ctl_macro__width_7 ff_pq_wr_ptr  (
	.scan_in(ff_pq_wr_ptr_scanin),
	.scan_out(ff_pq_wr_ptr_scanout),
	.din  (pq_wr_ptr_next[6:0]),
	.dout (pq_wr_ptr[6:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   sio_olc_ctl_msff_ctl_macro__width_2 ff_pq_wr_en  (
	.scan_in(ff_pq_wr_en_scanin),
	.scan_out(ff_pq_wr_en_scanout),
	.din  ({pq1_nextwren, pq0_nextwren}),
	.dout ({pq1_wr_en,    pq0_wr_en}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

   /////////////////////////////////////////////
   //
   // LOWER HALF PAYLOAD QUEUE 
   // start write-enable assertion next cycle when : 
   //         we're writing the header this cycle OR
   //         (we're writing the upper half of the packet queue AND 
   //          it's not the the 7th write of the upper half of the packet
   //         )
   //
   /////////////////////////////////////////////
   assign 	 pq0_nextwren = olc_nextcycleis_soh1 | (pq1_wr_en & ~&pq_wr_ptr[3:1]);
   assign 	 pq0_wr_ptr_inc = pq0_wr_en;
   
   /////////////////////////////////////////////
   //
   // UPPER HALF PAYLOAD QUEUE 
   // start write-enable assertion next cycle when :
   //         we're writing the lower half this cycle (always a pair)
   //
   /////////////////////////////////////////////
   assign 	 pq1_nextwren = pq0_wr_en;
   assign 	 pq1_wr_ptr_inc = pq1_wr_en;
   
   /////////////////////////////////////////////
   //
   // Master payload queue write pointer increments whenever each half increments
   //
   /////////////////////////////////////////////
   assign 	 pq_wr_ptr_inc = pq0_wr_ptr_inc | pq1_wr_ptr_inc;

   /////////////////////////////////////////////
   //
   // UE QUEUE
   //
   // start parity check flop enable next cycle when :
   //         we're have flopped the header this cycle (header was on bus last cycle)
   //           OR
   //         (we've been accumulating and the NEXT cycle is dataF - starting from data0)
   //
   /////////////////////////////////////////////
   assign 	 ue_nextchecken = olc_cycle_soh1 | (ue_check_en & ~olc_cycle_sol[15]);

   assign 	 ue_nextwren    = ue_check_en & olc_cycle_sol[15];
   assign 	 ue_wr_ptr_inc  = ue_nextwren;

   assign 	 ue_wr_ptr_next[2:0] = ue_wr_ptr_inc ? ue_wr_ptr_plus1[2:0] : ue_wr_ptr[2:0];
   
   sio_olc_ctl_msff_ctl_macro__width_2 ff_ue_en  (
	.scan_in(ff_ue_en_scanin),
	.scan_out(ff_ue_en_scanout),
	.din  ({ue_nextchecken, ue_nextwren}),
	.dout ({ue_check_en, ue_wr_en}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );
		 
   assign 	 ue_wr_ptr_plus1[2:0] = ue_wr_ptr[2:0] + 3'b001;
   

   sio_olc_ctl_msff_ctl_macro__width_3 ff_ue_wr_ptr  (
	.scan_in(ff_ue_wr_ptr_scanin),
	.scan_out(ff_ue_wr_ptr_scanout),
	.din  (ue_wr_ptr_next[2:0]),
	.dout (ue_wr_ptr[2:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   /////////////////////////////////////////////
   // END  MAIN WRITE CONTROL SECTION
   /////////////////////////////////////////////

   /////////////////////////////////////////////
   // BEGIN  MAIN READ CONTROL SECTION
   /////////////////////////////////////////////

   /////////////////////////////////////////////
   //
   //
   // READ SIDE TO OPD/C
   //
   /////////////////////////////////////////////
   //
   // ok to make a request NEXT CYCLE if any of the following are true
   // 0.   we made a request and we don't see grant
   // 1.   it's not the case we're seeing grant now  ==> headptr is correct
   //       header queue is not empty AND (1a or 1b)
   // 1a.   the current header points to a write
   // 1b.   the current header points to a read AND $L has been filled
   // 2.   it's the case we're seeing grant now ==> headptr is not correct until next cycle
   //       so we can only make a new request if ++headptr will not access the write entry 
   //            AND if (
   //                    it's currently a write then the current payload must be ready
   //                     because we can't predict if the next entry is a read or a write
   //                 OR it's currently a read then then the future payload must be ready
   //                   )
   //
   /////////////////////////////////////////////

   assign 	 olc_nextcycleis_slpr = 
		       // case0 : we have made a request and don't see grant
		       (olc_cycle_slpr & ~opcc_olc_gnt) |
		       // case1 : initial request (~gnt) :
		       //          header queue is not empty (header ptrs are different) AND
		       //          ( it's a write-ack (no need to check for data payload ready) OR
		       //               it's a read (check payload is ready) )
                       (~opcc_olc_gnt & ~header_access_same_entry & 
                                           (~oldhq_dout_r_bit | (oldhq_dout_r_bit & payload_ready))) |
		       // case2 : back-to-back request : we see grant now
		       //          header queue won't be empty (the post increment hq read pointer != hq write pointer) AND
		       //          ( future payload is guaranteed to be ready OR
		       //             payload is ready now (even before incrementing pq read pointer)
		       //            if it's currently a write because
		       //              we can't predict if the next entry is a read or a write)
		                        (opcc_olc_gnt & ~header_will_access_same_entry & 
                                           (future_payload_ready | 
		                            (~oldhq_dout_r_bit & payload_ready)));
   

   assign 	 olc_opcc_req = olc_cycle_slpr | (olc_cycle_slph & ~header_now_access_same_entry & 
                                                   (~oldhq_dout_r_bit | (oldhq_dout_r_bit & future_payload_was_ready)));
   assign 	 olc_nextcycleis_slph = opcc_olc_gnt & olc_cycle_slpr;

//   assign 	 olc_nextcycleis_slpp[14:0] = {olc_cycle_slpp[13:0], (oldhq_dout_r_bit & olc_cycle_slph)};
   
   sio_olc_ctl_msff_ctl_macro__width_2 ff_slp_cycle  (
	.scan_in(ff_slp_cycle_scanin),
	.scan_out(ff_slp_cycle_scanout),
	.din  ({olc_nextcycleis_slph, olc_nextcycleis_slpr}),
	.dout ({olc_cycle_slph,       olc_cycle_slpr}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
					   
   assign 	 header_access_same_entry = (hq_wr_ptr[2:0] == hq_rd_ptr[2:0]);
   

   assign 	 header_will_access_same_entry = (hq_wr_ptr[2:0] == hq_rd_ptr_plus1[2:0]);
   

   sio_olc_ctl_msff_ctl_macro__width_1 ff_header_now_access_same_entry  (
	.scan_in(ff_header_now_access_same_entry_scanin),
	.scan_out(ff_header_now_access_same_entry_scanout),
	.din (header_will_access_same_entry), 
	.dout (header_now_access_same_entry),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
   
   // be speculatively early 1 cyle due to request-grant latency
   // can't be earlier than 2 cycles after last piece of data
   // because UE would not be available to drive
   // 
   // pointer is not reliable if we're currently reading anything except the last chunk


   // If we're filling a cacheline and will be early accessing the line
   //   this is the minimum write pointer threshold
   // This value is set to 16 cycles - 2 (for UE) + 1 (req-gnt penalty) (fully accumulated with no ue forwarding)
   //                     - 1 (header) - 8 (transfer all the data)
   //                = 6 cycles has been written for cut-through case with UE converted to poisoned parity
   // 
   //   assign 	 same_line_write_above_threshold = &pq_wr_ptr[3:0]; // fully accumulated
   assign 	 notcutthru = (&pq_wr_ptr[3:0] & payload_access_same_line) | ~payload_access_same_line; // fully accumulated
   assign 	 same_line_write_above_threshold = (pq_wr_ptr[3]); // | (pq_wr_ptr[3:1] == 3'b011));
   
   // ready if any of the following are true
   //  1. we're accesing same cacheline and write has filled above the threshold (cut thru case)
   //  2. we're not currently accessing the same line and we won't be accessing the same line
   //      (this ensures that if we're doing cut-thru, we won't jump ahead on the next one)
   
   assign        future_payload_ready =  (~payload_access_same_line & ~payload_will_access_same_line) |				                                     (~payload_access_same_line &  payload_will_access_same_line & same_line_write_above_threshold );			 
   
   assign 	 payload_ready = ( payload_access_same_line & same_line_write_above_threshold) |
		                 (~payload_access_same_line & ~payload_will_access_same_line);
   
   
   assign 	 payload_access_same_line = (pq_wr_ptr[6:4] == pq_rd_ptr[6:4]);
   

   assign 	 payload_will_access_same_line = (pq_wr_ptr[6:4] == pq_rd_ptr_plus1[6:4]) | (pq_wr_ptr[6:4] == pq_rd_ptr_plus6[6:4]);


   sio_olc_ctl_msff_ctl_macro__width_2 ff_payload_readys  (
	.scan_in(ff_payload_readys_scanin),
	.scan_out(ff_payload_readys_scanout),
	.din ({future_payload_ready, notcutthru}),
	.dout ({future_payload_was_ready, was_notcutthru}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


   /////////////////////////////////////////////
   //
   // HEADER QUEUE READ POINTER LOGIC
   //
   // UE QUEUE goes with header queue on the read side
   //
   /////////////////////////////////////////////
   assign 	 hq_rd_ptr_inc = olc_nextcycleis_slph;
   assign 	 ue_rd_ptr_inc_e1 = olc_nextcycleis_slph & oldhq_dout_r_bit;
   assign 	 hq_rd_ptr_next[2:0] = hq_rd_ptr_inc ? hq_rd_ptr_plus1[2:0] : hq_rd_ptr[2:0];

   sio_olc_ctl_msff_ctl_macro__width_1 ff_ue_rd_ptr_inc  (
	.scan_in(ff_ue_rd_ptr_inc_scanin),
	.scan_out(ff_ue_rd_ptr_inc_scanout),
	.din  (ue_rd_ptr_inc_e1),
	.dout (ue_rd_ptr_inc),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   assign 	 hq_rd_ptr_plus1[2:0] = hq_rd_ptr[2:0] + 3'b001;
   
//   increment_macro inc_hq_rd_ptr_plus1 (width=4) (
//	  .cin  (1'b1),
//	  .din  ({1'b0, hq_rd_ptr[2:0]}),
//	  .dout ({hq_rd_ptr_dummybit, hq_rd_ptr_plus1[2:0]})
//	  );

   sio_olc_ctl_msff_ctl_macro__width_3 ff_hq_rd_ptr  (
	.scan_in(ff_hq_rd_ptr_scanin),
	.scan_out(ff_hq_rd_ptr_scanout),
	.din  (hq_rd_ptr_next[2:0]),
	.dout (hq_rd_ptr[2:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


   /////////////////////////////////////////////
   //
   // PAYLOAD READ POINTER LOGIC - 8 cycles of 64bit per packet, 4 packet deep//
   //
   /////////////////////////////////////////////

   sio_olc_ctl_msff_ctl_macro__width_1 ff_dequeue  (
	.scan_in(ff_dequeue_scanin),
	.scan_out(ff_dequeue_scanout),
	.din  (hq_rd_ptr_inc),
	.dout (sio_sii_olc_ilc_dequeue),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   /////////////////////////////////////////////
   //
   // Master payload queue read pointer increments each cycle
   //
   /////////////////////////////////////////////

   assign 	 pq_rd_ptr_inc = (olc_nextcycleis_slph & oldhq_dout_r_bit) | 
		                 (|pq_rd_ptr[3:1]);
   

   assign 	 pq1_nextrden = (olc_cycle_slpr & oldhq_dout_r_bit) | (|pq_rd_ptr[3:1] & ~&pq_rd_ptr[3:1]);
   assign 	 pq0_nextrden = (olc_cycle_slpr & oldhq_dout_r_bit) | (|pq_rd_ptr[3:1] & ~&pq_rd_ptr[3:1]);

   assign 	 pq_rd_ptr_next[6:0] = pq_rd_ptr_inc ? pq_rd_ptr_plus1[6:0] : pq_rd_ptr[6:0];
   assign 	 ue_rd_ptr_next[2:0] = ue_rd_ptr_inc ? ue_rd_ptr_plus1[2:0] : ue_rd_ptr[2:0];

  
   assign 	 pq_rd_ptr_plus1[6:0] = {pq_rd_ptr[6:1] + 6'b000001, 1'b0};
   assign 	 pq_rd_ptr_plus6[6:0] = {pq_rd_ptr[6:1] + 6'b000110, 1'b0};   

   sio_olc_ctl_msff_ctl_macro__width_7 ff_pq_rd_ptr  (
	.scan_in(ff_pq_rd_ptr_scanin),
	.scan_out(ff_pq_rd_ptr_scanout),
	.din  (pq_rd_ptr_next[6:0]),
	.dout (pq_rd_ptr[6:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   sio_olc_ctl_msff_ctl_macro__width_2 ff_pq_rd_en  (
	.scan_in(ff_pq_rd_en_scanin),
	.scan_out(ff_pq_rd_en_scanout),
	.din  ({pq1_nextrden, pq0_nextrden}),
	.dout ({pq1_rd_en,    pq0_rd_en}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

   assign 	 ue_rd_ptr_plus1[2:0] = ue_rd_ptr[2:0] + 3'b001;
   

   sio_olc_ctl_msff_ctl_macro__width_3 ff_ue_rd_ptr  (
	.scan_in(ff_ue_rd_ptr_scanin),
	.scan_out(ff_ue_rd_ptr_scanout),
	.din  (ue_rd_ptr_next[2:0]),
	.dout (ue_rd_ptr[2:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   /////////////////////////////////////////////
   // Create flop r_bit for timing purpose 
   /////////////////////////////////////////////

   sio_olc_ctl_msff_ctl_macro__width_1 ff_l2sio_r_bit0  (
	.scan_in(ff_l2sio_r_bit0_scanin),
	.scan_out(ff_l2sio_r_bit0_scanout),
	.din  (pre_r_bit0),
	.dout (l2sio_r_bit0_r),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   sio_olc_ctl_msff_ctl_macro__width_1 ff_l2sio_r_bit1  (
	.scan_in(ff_l2sio_r_bit1_scanin),
	.scan_out(ff_l2sio_r_bit1_scanout),
	.din  (pre_r_bit1),
	.dout (l2sio_r_bit1_r),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   sio_olc_ctl_msff_ctl_macro__width_1 ff_l2sio_r_bit2  (
	.scan_in(ff_l2sio_r_bit2_scanin),
	.scan_out(ff_l2sio_r_bit2_scanout),
	.din  (pre_r_bit2),
	.dout (l2sio_r_bit2_r),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   sio_olc_ctl_msff_ctl_macro__width_1 ff_l2sio_r_bit3  (
	.scan_in(ff_l2sio_r_bit3_scanin),
	.scan_out(ff_l2sio_r_bit3_scanout),
	.din  (pre_r_bit3),
	.dout (l2sio_r_bit3_r),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

  assign pre_r_bit0	= olc_oldhq_wr_en[0] ? l2sio_r_bit : l2sio_r_bit0_r;
  assign pre_r_bit1	= olc_oldhq_wr_en[1] ? l2sio_r_bit : l2sio_r_bit1_r;
  assign pre_r_bit2	= olc_oldhq_wr_en[2] ? l2sio_r_bit : l2sio_r_bit2_r;
  assign pre_r_bit3	= olc_oldhq_wr_en[3] ? l2sio_r_bit : l2sio_r_bit3_r;
 
   always @ (pre_r_bit0 or pre_r_bit1 or pre_r_bit2 or pre_r_bit3 or hq_rd_ptr_next[1:0])
    	case (hq_rd_ptr_next[1:0])	//synopsys parallel_case full_case
		2'b00	: pre_r_bit 	= pre_r_bit0;
		2'b01	: pre_r_bit 	= pre_r_bit1;
		2'b10	: pre_r_bit 	= pre_r_bit2;
		2'b11	: pre_r_bit 	= pre_r_bit3;
   	endcase
  
   sio_olc_ctl_msff_ctl_macro__width_1 ff_l2sio_r_bit  (
	.scan_in(ff_l2sio_r_bit_scanin),
	.scan_out(ff_l2sio_r_bit_scanout),
	.din  (pre_r_bit),
	.dout (oldhq_dout_r_bit),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


   /////////////////////////////////////////////
   // END  MAIN READ CONTROL SECTION
   /////////////////////////////////////////////

supply0 vss; // <- port for ground
supply1 vdd; // <- port for power 

// fixscan start:
assign si_0             = scan_in                  ;
assign ff_ojc_cycle_sox_scanin   = so_0;
assign ff_ojc_ack_sox_scanin     = ff_ojc_cycle_sox_scanout ;
assign ff_ojc_shcnt_scanin       = ff_ojc_ack_sox_scanout   ;
assign ff_pass_late_ue_scanin    = ff_ojc_shcnt_scanout     ;
assign ff_l2b_sio_ue_err_scanin  = ff_pass_late_ue_scanout  ;
assign ff_olc_cycle_scanin       = ff_l2b_sio_ue_err_scanout;
assign ff_hq_wr_ptr_scanin       = ff_olc_cycle_scanout     ;
assign ff_pq_wr_ptr_scanin       = ff_hq_wr_ptr_scanout     ;
assign ff_pq_wr_en_scanin        = ff_pq_wr_ptr_scanout     ;
assign ff_ue_en_scanin           = ff_pq_wr_en_scanout      ;
assign ff_ue_wr_ptr_scanin       = ff_ue_en_scanout         ;
assign ff_slp_cycle_scanin       = ff_ue_wr_ptr_scanout     ;
assign ff_header_now_access_same_entry_scanin = ff_slp_cycle_scanout     ;
assign ff_payload_readys_scanin  = ff_header_now_access_same_entry_scanout;
assign ff_ue_rd_ptr_inc_scanin   = ff_payload_readys_scanout;
assign ff_hq_rd_ptr_scanin       = ff_ue_rd_ptr_inc_scanout ;
assign ff_dequeue_scanin         = ff_hq_rd_ptr_scanout     ;
assign ff_pq_rd_ptr_scanin       = ff_dequeue_scanout       ;
assign ff_pq_rd_en_scanin        = ff_pq_rd_ptr_scanout     ;
assign ff_ue_rd_ptr_scanin       = ff_pq_rd_en_scanout      ;
assign ff_l2sio_r_bit0_scanin    = ff_ue_rd_ptr_scanout     ;
assign ff_l2sio_r_bit1_scanin    = ff_l2sio_r_bit0_scanout  ;
assign ff_l2sio_r_bit2_scanin    = ff_l2sio_r_bit1_scanout  ;
assign ff_l2sio_r_bit3_scanin    = ff_l2sio_r_bit2_scanout  ;
assign ff_l2sio_r_bit_scanin     = ff_l2sio_r_bit3_scanout  ;
assign scan_out                  = ff_l2sio_r_bit_scanout   ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module sio_olc_ctl_l1clkhdr_ctl_macro (
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

module sio_olc_ctl_msff_ctl_macro__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0];






dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sio_olc_ctl_msff_ctl_macro__width_6 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = din[5:0];






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sio_olc_ctl_msff_ctl_macro__width_1 (
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













// any PARAMS parms go into naming of macro

module sio_olc_ctl_msff_ctl_macro__width_17 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [16:0] fdin;
wire [15:0] so;

  input [16:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [16:0] dout;
  output scan_out;
assign fdin[16:0] = din[16:0];






dff #(17)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[16:0]),
.si({scan_in,so[15:0]}),
.so({so[15:0],scan_out}),
.q(dout[16:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sio_olc_ctl_msff_ctl_macro__width_3 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = din[2:0];






dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sio_olc_ctl_msff_ctl_macro__width_7 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [6:0] fdin;
wire [5:0] so;

  input [6:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [6:0] dout;
  output scan_out;
assign fdin[6:0] = din[6:0];






dff #(7)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6:0]),
.si({scan_in,so[5:0]}),
.so({so[5:0],scan_out}),
.q(dout[6:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sio_olc_ctl_msff_ctl_macro__width_2 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0];






dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);












endmodule








