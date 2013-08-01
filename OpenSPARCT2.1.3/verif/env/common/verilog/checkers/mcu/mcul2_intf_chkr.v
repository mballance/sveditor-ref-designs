// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcul2_intf_chkr.v
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
module mcul2_intf_chkr;

`ifndef NO_MCU_L2_CHECKERS

/* C1: 31 bits of DIMM address, issued by L2. 
SIGNALS :
input [39:7]	l2t0_mcu_addr_39to7;
input [39:7]	l2t1_mcu_addr_39to7;

CONSTRAINTS :
   1. Needs to be driven during Read/Write req.
*/

/*******Constraint C1*********************/





/* C2: Data ordering. Its the 5th bit in the PA. Represents the order
   in which the data has to be returned.
SIGNALS :
input		l2t0_mcu_addr_5;
input		l2t1_mcu_addr_5;

CONSTRAINTS :
   1. Valid only during Read/Write req. 

   Notes:
   1. Active Low - Sequential - 0, 1, 2, 3 [BL = 4]
   2. Active High - Interleaved - 2, 3, 0, 1 [BL = 4] 
*/

/***********Constraint C2***************/





/* C3: READ REQUEST FROM L2. 

SIGNALS :
input		l2t0_mcu_rd_req;
input		l2t1_mcu_rd_req;
output		mcu_l2t0_rd_ack;
output		mcu_l2t1_rd_ack;
input [2:0]	l2t0_mcu_rd_req_id;
input [2:0]	l2t1_mcu_rd_req_id;
input		l2t0_mcu_rd_dummy_req;
input		l2t1_mcu_rd_dummy_req;
output [2:0]	mcu_l2t0_rd_req_id_r0;
output [2:0]	mcu_l2t1_rd_req_id_r0;
output [127:0]	mcu_l2b_data_r3;

CONSTRAINTS :
   1. Each read req is acknowledged by the MCU with mcu_l2t0/1_rd_ack. 
   2. Max of 8 reqs per bank could be outstanding. 
   3. Back to back reads could be issued only after 3 (1 clks is 
      also fine) clocks after rd_ack.
   4. Each read req is uniquely identified by 3bit mcu_rd_req_id.
   5. No simultaneous rd and wr req from the same bank.
   6. Do we have to ensure that memory reads only initialized locations?

SIGNALS :
input l2t0_mcu_rd_dummy_req;
input l2t1_mcu_rd_dummy_req;

C4: Dummy Read Requset. Asserted along with rd req. Data returned 
    is all zero's. 

CONSTRAINTS :
   1. Asserted along with l2t0/1_mcu_rd_req. 

   Notes:
   We can have simultaneous rd reqs from both the banks.
   The dummy read req is not issued to the DRAM but the MCU 
   responds with 0's as data. Max of 8 rd reqs can be outstanding,
   this includes dummy reqs too. 
*/

/************Constraint C3.1*********/



/************Constraint C3.3************/

reg mcu0_l2t0_rd_ack_d1;
reg mcu0_l2t1_rd_ack_d1;
reg mcu1_l2t0_rd_ack_d1;
reg mcu1_l2t1_rd_ack_d1;
reg mcu2_l2t0_rd_ack_d1;
reg mcu2_l2t1_rd_ack_d1;
reg mcu3_l2t0_rd_ack_d1;
reg mcu3_l2t1_rd_ack_d1;

always @ (posedge `prefix_0in.l2clk)
begin
    mcu0_l2t0_rd_ack_d1 <= `prefix_0in.mcu0.mcu_l2t0_rd_ack;
    mcu0_l2t1_rd_ack_d1 <= `prefix_0in.mcu0.mcu_l2t1_rd_ack;
    mcu1_l2t0_rd_ack_d1 <= `prefix_0in.mcu1.mcu_l2t0_rd_ack;
    mcu1_l2t1_rd_ack_d1 <= `prefix_0in.mcu1.mcu_l2t1_rd_ack;
    mcu2_l2t0_rd_ack_d1 <= `prefix_0in.mcu2.mcu_l2t0_rd_ack;
    mcu2_l2t1_rd_ack_d1 <= `prefix_0in.mcu2.mcu_l2t1_rd_ack;
    mcu3_l2t0_rd_ack_d1 <= `prefix_0in.mcu3.mcu_l2t0_rd_ack;
    mcu3_l2t1_rd_ack_d1 <= `prefix_0in.mcu3.mcu_l2t1_rd_ack;
end













/************Constraint C3.5**********/



/********The code below is for the constraints C3.2 and C3.4**********/
reg[1:0] mcu0_l2t0_data_vld_count;
reg[1:0] mcu0_l2t1_data_vld_count;
reg[1:0] mcu1_l2t0_data_vld_count;
reg[1:0] mcu1_l2t1_data_vld_count;
reg[1:0] mcu2_l2t0_data_vld_count;
reg[1:0] mcu2_l2t1_data_vld_count;
reg[1:0] mcu3_l2t0_data_vld_count;
reg[1:0] mcu3_l2t1_data_vld_count;

initial
begin
    mcu0_l2t0_data_vld_count = 2'b0;
    mcu0_l2t1_data_vld_count = 2'b0;
    mcu1_l2t0_data_vld_count = 2'b0;
    mcu1_l2t1_data_vld_count = 2'b0;
    mcu2_l2t0_data_vld_count = 2'b0;
    mcu2_l2t1_data_vld_count = 2'b0;
    mcu3_l2t0_data_vld_count = 2'b0;
    mcu3_l2t1_data_vld_count = 2'b0;
end

always @(posedge `prefix_0in.l2clk)
begin
    if(`prefix_0in.mcu0.mcu_l2t0_data_vld_r0)
        mcu0_l2t0_data_vld_count = (mcu0_l2t0_data_vld_count + 1)%4;
    if(`prefix_0in.mcu0.mcu_l2t1_data_vld_r0)
        mcu0_l2t1_data_vld_count = (mcu0_l2t1_data_vld_count + 1)%4;
    if(`prefix_0in.mcu1.mcu_l2t0_data_vld_r0)
        mcu1_l2t0_data_vld_count = (mcu1_l2t0_data_vld_count + 1)%4;
    if(`prefix_0in.mcu1.mcu_l2t1_data_vld_r0)
        mcu1_l2t1_data_vld_count = (mcu1_l2t1_data_vld_count + 1)%4;
    if(`prefix_0in.mcu2.mcu_l2t0_data_vld_r0)
        mcu2_l2t0_data_vld_count = (mcu2_l2t0_data_vld_count + 1)%4;
    if(`prefix_0in.mcu2.mcu_l2t1_data_vld_r0)
        mcu2_l2t1_data_vld_count = (mcu2_l2t1_data_vld_count + 1)%4;
    if(`prefix_0in.mcu3.mcu_l2t0_data_vld_r0)
        mcu3_l2t0_data_vld_count = (mcu3_l2t0_data_vld_count + 1)%4;
    if(`prefix_0in.mcu3.mcu_l2t1_data_vld_r0)
        mcu3_l2t1_data_vld_count = (mcu3_l2t1_data_vld_count + 1)%4;
end

/* 0in scoreboard -rx `prefix_0in.mcu0.l2t0_mcu_rd_req 
                  -rx_id `prefix_0in.mcu0.l2t0_mcu_rd_req_id
                  -tx (`prefix_0in.mcu0.mcu_l2t0_data_vld_r0 & (mcu0_l2t0_data_vld_count == 3))
                  -tx_id `prefix_0in.mcu0.mcu_l2t0_rd_req_id_r0
                  -max_ids 8 
                  -clock `prefix_0in.l2clk 
                  -constraint rx
*/ 

/* 0in scoreboard -rx `prefix_0in.mcu0.l2t1_mcu_rd_req 
                  -rx_id `prefix_0in.mcu0.l2t1_mcu_rd_req_id
                  -tx (`prefix_0in.mcu0.mcu_l2t1_data_vld_r0 & (mcu0_l2t1_data_vld_count == 3))
                  -tx_id `prefix_0in.mcu0.mcu_l2t1_rd_req_id_r0
                  -max_ids 8 
                  -clock `prefix_0in.l2clk 
                  -constraint rx
*/ 

/* 0in scoreboard -rx `prefix_0in.mcu1.l2t0_mcu_rd_req 
                  -rx_id `prefix_0in.mcu1.l2t0_mcu_rd_req_id
                  -tx (`prefix_0in.mcu1.mcu_l2t0_data_vld_r0 & (mcu1_l2t0_data_vld_count == 3))
                  -tx_id `prefix_0in.mcu1.mcu_l2t0_rd_req_id_r0
                  -max_ids 8 
                  -clock `prefix_0in.l2clk 
                  -constraint rx
*/ 

/* 0in scoreboard -rx `prefix_0in.mcu1.l2t1_mcu_rd_req 
                  -rx_id `prefix_0in.mcu1.l2t1_mcu_rd_req_id
                  -tx (`prefix_0in.mcu1.mcu_l2t1_data_vld_r0 & (mcu1_l2t1_data_vld_count == 3))
                  -tx_id `prefix_0in.mcu1.mcu_l2t1_rd_req_id_r0
                  -max_ids 8 
                  -clock `prefix_0in.l2clk 
                  -constraint rx
*/

/* 0in scoreboard -rx `prefix_0in.mcu2.l2t0_mcu_rd_req 
                  -rx_id `prefix_0in.mcu2.l2t0_mcu_rd_req_id
                  -tx (`prefix_0in.mcu2.mcu_l2t0_data_vld_r0 & (mcu2_l2t0_data_vld_count == 3))
                  -tx_id `prefix_0in.mcu2.mcu_l2t0_rd_req_id_r0
                  -max_ids 8 
                  -clock `prefix_0in.l2clk 
                  -constraint rx
*/ 

/* 0in scoreboard -rx `prefix_0in.mcu2.l2t1_mcu_rd_req 
                  -rx_id `prefix_0in.mcu2.l2t1_mcu_rd_req_id
                  -tx (`prefix_0in.mcu2.mcu_l2t1_data_vld_r0 & (mcu2_l2t1_data_vld_count == 3))
                  -tx_id `prefix_0in.mcu2.mcu_l2t1_rd_req_id_r0
                  -max_ids 8 
                  -clock `prefix_0in.l2clk 
                  -constraint rx
*/
/* 0in scoreboard -rx `prefix_0in.mcu3.l2t0_mcu_rd_req 
                  -rx_id `prefix_0in.mcu3.l2t0_mcu_rd_req_id
                  -tx (`prefix_0in.mcu3.mcu_l2t0_data_vld_r0 & (mcu3_l2t0_data_vld_count == 3))
                  -tx_id `prefix_0in.mcu3.mcu_l2t0_rd_req_id_r0
                  -max_ids 8 
                  -clock `prefix_0in.l2clk 
                  -constraint rx
*/ 

/* 0in scoreboard -rx `prefix_0in.mcu3.l2t1_mcu_rd_req 
                  -rx_id `prefix_0in.mcu3.l2t1_mcu_rd_req_id
                  -tx (`prefix_0in.mcu3.mcu_l2t1_data_vld_r0 & (mcu3_l2t1_data_vld_count == 3))
                  -tx_id `prefix_0in.mcu3.mcu_l2t1_rd_req_id_r0
                  -max_ids 8 
                  -clock `prefix_0in.l2clk 
                  -constraint rx
*/

/************Constraint C4*************/





/* C5: WRITE REQUEST FROM L2.

SIGNALS :
input		l2t0_mcu_wr_req;
input		l2t1_mcu_wr_req;
output		mcu_l2t0_wr_ack;
output		mcu_l2t1_wr_ack;
input [63:0]	l2b0_mcu_wr_data_r5;
input [63:0]	l2b1_mcu_wr_data_r5;
input		l2b0_mcu_data_vld_r5;
input		l2b1_mcu_data_vld_r5;

CONSTRAINTS : 
   1. Each write req is acknowledged by the MCU with mcu_l2t0/1_wr_ack.
   2. l2b0/1_mcu_data_vld_r5 is asserted after 5 clock cycles after
      the wr_ack.
   3. l2b0/1_mcu_data_vld_r5 is active high for 8 clock cycles.
   4. l2b0/1_mcu_wr_data_r5 should be driven when data_vld_r5 is high.
   5. Back to back writes could be issued only after 3 clocks after
      the last data word for write.
   6. (same as C3.5) No simultaneous rd and wr req from the same bank.

   Notes:
     We can have simultaneous wr reqs from both the banks.
*/

/************Constraint C5.1******************/
/* 0in req_ack -req l2t0_mcu_wr_req
               -ack mcu_l2t0_wr_ack
               -no_simultaneous_req_ack 
               -constraint req 
               -module mcu -clock `prefix_0in.l2clk 
*/

/* 0in req_ack -req l2t1_mcu_wr_req
               -ack mcu_l2t1_wr_ack
               -no_simultaneous_req_ack 
               -constraint req 
               -module mcu -clock `prefix_0in.l2clk 
*/
/***********Constraints C5.2 and C5.3**************/
/* 0in assert_follower -leader mcu_l2t0_wr_ack -follower l2b0_mcu_data_vld_r5
                       -max_leader 1
                       -min 6
                       -max 6
                       -constraint
                       -module mcu -clock `prefix_0in.l2clk 
*/

/* 0in assert_follower -leader mcu_l2t1_wr_ack -follower l2b1_mcu_data_vld_r5
                       -max_leader 1
                       -min 6
                       -max 6
                       -constraint
                       -module mcu -clock `prefix_0in.l2clk 
*/

/* 0in assert_window -start mcu_l2t0_wr_ack
                -in l2b0_mcu_data_vld_r5
				-stop_count 14
				-max 8 -min 8 
                -constraint in 
                -module mcu -clock `prefix_0in.l2clk 
*/

/* 0in assert_window -start mcu_l2t1_wr_ack
                -in l2b1_mcu_data_vld_r5
				-stop_count 14
				-max 8 -min 8 
                -constraint in 
                -module mcu -clock `prefix_0in.l2clk 
*/

/***********Constraint C5.4**************/



/***********Constraint C5.5**************/
/* 0in assert_window -start mcu_l2t0_wr_ack
                     -stop_count 13
                     -not_in l2t0_mcu_wr_req 
                     -constraint not_in 
                     -module mcu -clock `prefix_0in.l2clk 
*/

/* 0in assert_window -start mcu_l2t1_wr_ack
                     -stop_count 13
                     -not_in l2t1_mcu_wr_req 
                     -constraint not_in 
                     -module mcu -clock `prefix_0in.l2clk 
*/



/* C6: Inject ECC errors in write data.

SIGNALS :
input	l2b0_mcu_data_mecc_r5;
input	l2b1_mcu_data_mecc_r5;

CONSTRAINTS : 
   1. Asserted along with l2b0/1_mcu_data_vld_r5.

    Notes:
       Asserted along with l2b0_mcu_data_vld_r5. Only the 
       corresponding data words get errors injected on them. 
*/






/* C7: Power throttling counter synchronizing signals 
   Whats the use ? Should these be constant ?

    Notes:
        The mcu_pt_sync_in ports are tied to the mcu_pt_sync_out 
        ports of the other 3 MCUs. They are asserted whenever the 
        power throttling max time or max banks open registers are 
        written.  This is so the power throttling counters in all
        MCUs will be reset at the same time.

// input 	        mcu_pt_sync_in0;
// input 	        mcu_pt_sync_in1;
// input 	        mcu_pt_sync_in2;
*/



/* C8: MCU id for error reporting. 
   Report what ? Report when ? 

   Notes:
        It is unique to each MCU. It goes into the dram error address 
        register so software can identify in which MCU an error 
        occurred.

// input [1:0]	mcu_id;
*/


/* C9.1: Debug Logic

Signals:
 mcu_dbg1_rd_req_in_0[3:0]  Read request received from L2 bank 0
 mcu_dbg1_rd_req_in_1[3:0]  Read request received from L2 bank 1

 Property:
 1. Bit 3 is the rd_req signal. Bits 2:0 are the read request id
*/
/********** Property C9.1 **********/
/*
0in multi_clock_fifo 
-enq (l2t0_mcu_rd_req && ~ucb.ucb_serdes_dtm)
-enq_data l2t0_mcu_rd_req_id
-enq_clock l2clk
-deq (mcu_dbg1_rd_req_in_0[3] && ~ucb.ucb_serdes_dtm)
-deq_data mcu_dbg1_rd_req_in_0[2:0]
-deq_clock iol2clk
-depth 8
-module mcu 
*/

/*
0in multi_clock_fifo 
-enq (l2t1_mcu_rd_req && ~ucb.ucb_serdes_dtm)
-enq_data l2t1_mcu_rd_req_id
-enq_clock l2clk
-deq (mcu_dbg1_rd_req_in_1[3] && ~ucb.ucb_serdes_dtm)
-deq_data mcu_dbg1_rd_req_in_1[2:0]
-deq_clock iol2clk
-depth 8
-module mcu 
*/


/* C9.2: Debug Logic

Signals:
 mcu_dbg1_rd_req_out[4:0]   Read data returned to L2 bank

 Property:
 2. Bit 4 is valid. Bit 3 indicates which l2 bank. Bits 2:0 are the 
    read request id
*/
/********** Property C9.2 **********/
wire [2:0] mcu0_l2_rd_req_id;
wire [2:0] mcu1_l2_rd_req_id;
wire [2:0] mcu2_l2_rd_req_id;
wire [2:0] mcu3_l2_rd_req_id;

assign mcu0_l2_rd_req_id = (`prefix_0in.mcu0.mcu_l2t1_data_vld_r0) ? `prefix_0in.mcu0.mcu_l2t1_rd_req_id_r0 : `prefix_0in.mcu0.mcu_l2t0_rd_req_id_r0;
assign mcu1_l2_rd_req_id = (`prefix_0in.mcu1.mcu_l2t1_data_vld_r0) ? `prefix_0in.mcu1.mcu_l2t1_rd_req_id_r0 : `prefix_0in.mcu1.mcu_l2t0_rd_req_id_r0;
assign mcu2_l2_rd_req_id = (`prefix_0in.mcu2.mcu_l2t1_data_vld_r0) ? `prefix_0in.mcu2.mcu_l2t1_rd_req_id_r0 : `prefix_0in.mcu2.mcu_l2t0_rd_req_id_r0;
assign mcu3_l2_rd_req_id = (`prefix_0in.mcu3.mcu_l2t1_data_vld_r0) ? `prefix_0in.mcu3.mcu_l2t1_rd_req_id_r0 : `prefix_0in.mcu3.mcu_l2t0_rd_req_id_r0;

/*
0in multi_clock_fifo 
-enq (((`prefix_0in.mcu0.mcu_l2t0_data_vld_r0 && (`prefix_0in.mcu0.mcu_l2t0_qword_id_r0[1:0] == 2'b0)) || (`prefix_0in.mcu0.mcu_l2t1_data_vld_r0 && (`prefix_0in.mcu0.mcu_l2t1_qword_id_r0[1:0] == 2'b0))) && ~`prefix_0in.mcu0.ucb.ucb_serdes_dtm)
-enq_data ({`prefix_0in.mcu0.mcu_l2t1_data_vld_r0, mcu0_l2_rd_req_id})
-enq_clock `prefix_0in.mcu0.l2clk
-deq (`prefix_0in.mcu0.mcu_dbg1_rd_req_out[4] && ~`prefix_0in.mcu0.ucb.ucb_serdes_dtm)
-deq_data `prefix_0in.mcu0.mcu_dbg1_rd_req_out[3:0] 
-deq_clock `prefix_0in.mcu0.iol2clk
-depth 16
-module mcu 
*/

/*
0in multi_clock_fifo 
-enq (((`prefix_0in.mcu1.mcu_l2t0_data_vld_r0 && (`prefix_0in.mcu1.mcu_l2t0_qword_id_r0[1:0] == 2'b0)) || (`prefix_0in.mcu1.mcu_l2t1_data_vld_r0 && (`prefix_0in.mcu1.mcu_l2t1_qword_id_r0[1:0] == 2'b0))) && ~`prefix_0in.mcu1.ucb.ucb_serdes_dtm)
-enq_data ({`prefix_0in.mcu1.mcu_l2t1_data_vld_r0, mcu1_l2_rd_req_id})
-enq_clock `prefix_0in.mcu1.l2clk
-deq (`prefix_0in.mcu1.mcu_dbg1_rd_req_out[4] && ~`prefix_0in.mcu1.ucb.ucb_serdes_dtm)
-deq_data `prefix_0in.mcu1.mcu_dbg1_rd_req_out[3:0] 
-deq_clock `prefix_0in.mcu1.iol2clk
-depth 16
-module mcu 
*/


/*
0in multi_clock_fifo 
-enq (((`prefix_0in.mcu2.mcu_l2t0_data_vld_r0 && (`prefix_0in.mcu2.mcu_l2t0_qword_id_r0[1:0] == 2'b0)) || (`prefix_0in.mcu2.mcu_l2t1_data_vld_r0 && (`prefix_0in.mcu2.mcu_l2t1_qword_id_r0[1:0] == 2'b0))) && ~`prefix_0in.mcu2.ucb.ucb_serdes_dtm)
-enq_data ({`prefix_0in.mcu2.mcu_l2t1_data_vld_r0, mcu2_l2_rd_req_id})
-enq_clock `prefix_0in.mcu2.l2clk
-deq (`prefix_0in.mcu2.mcu_dbg1_rd_req_out[4] && ~`prefix_0in.mcu2.ucb.ucb_serdes_dtm)
-deq_data `prefix_0in.mcu2.mcu_dbg1_rd_req_out[3:0] 
-deq_clock `prefix_0in.mcu2.iol2clk
-depth 16
-module mcu 
*/


/*
0in multi_clock_fifo 
-enq (((`prefix_0in.mcu3.mcu_l2t0_data_vld_r0 && (`prefix_0in.mcu3.mcu_l2t0_qword_id_r0[1:0] == 2'b0)) || (`prefix_0in.mcu3.mcu_l2t1_data_vld_r0 && (`prefix_0in.mcu3.mcu_l2t1_qword_id_r0[1:0] == 2'b0))) && ~`prefix_0in.mcu3.ucb.ucb_serdes_dtm)
-enq_data ({`prefix_0in.mcu3.mcu_l2t1_data_vld_r0, mcu3_l2_rd_req_id})
-enq_clock `prefix_0in.mcu3.l2clk
-deq (`prefix_0in.mcu3.mcu_dbg1_rd_req_out[4] && ~`prefix_0in.mcu3.ucb.ucb_serdes_dtm)
-deq_data `prefix_0in.mcu3.mcu_dbg1_rd_req_out[3:0] 
-deq_clock `prefix_0in.mcu3.iol2clk
-depth 16
-module mcu 
*/



/* C9.3: Debug Logic

Signals:
 mcu_dbg1_wr_req_in_0       Write request received from L2 bank 0
 mcu_dbg1_wr_req_in_1       Write request received from L2 bank 1

 Property:
 3. wr_req signal
*/
/********** Property C9.3 **********/
/*
0in multi_clock_fifo
-enq (l2t0_mcu_wr_req && ~ucb.ucb_serdes_dtm)
-enq_clock l2clk
-deq (mcu_dbg1_wr_req_in_0 && ~ucb.ucb_serdes_dtm)
-deq_clock iol2clk
-depth 8
-module mcu 
*/

/*
0in multi_clock_fifo
-enq (l2t1_mcu_wr_req && ~ucb.ucb_serdes_dtm)
-enq_clock l2clk
-deq (mcu_dbg1_wr_req_in_1 && ~ucb.ucb_serdes_dtm)
-deq_clock iol2clk
-depth 8
-module mcu 
*/



/* C9.4: Debug Logic

Signals:
 mcu_dbg1_wr_req_out[1:0]   Number of writes retired

 Property:
 4. Number of writes retired from outstanding write queue in woq
*/
/********** Property C9.4 **********/
/*
0in multi_clock_multi_enq_deq_fifo
-enq (drif.drif_woq_free[1] && ~ucb.ucb_serdes_dtm) (drif.drif_woq_free[0] && ~ucb.ucb_serdes_dtm)
-enq_clock drl2clk
-deq (mcu_dbg1_wr_req_out[1] && ~ucb.ucb_serdes_dtm) (mcu_dbg1_wr_req_out[0] && ~ucb.ucb_serdes_dtm)
-deq_clock iol2clk
-depth 16
-module mcu 
*/


/* C9.5: Debug Logic

Signals:
 mcu_dbg1_mecc_err          Multiple nibble ECC error

 Property:
 5. OR of mecc_err and scb_mecc_err for both l2 banks
*/
/********** Property C9.5 **********/
reg mcu0_mecc_err_enq;
wire mcu0_mecc_err = (`prefix_0in.mcu0.mcu_l2t0_mecc_err_r3 || `prefix_0in.mcu0.mcu_l2t1_mecc_err_r3 || `prefix_0in.mcu0.mcu_l2t0_scb_mecc_err || `prefix_0in.mcu0.mcu_l2t1_scb_mecc_err);
reg mcu1_mecc_err_enq;
wire mcu1_mecc_err = (`prefix_0in.mcu1.mcu_l2t0_mecc_err_r3 || `prefix_0in.mcu1.mcu_l2t1_mecc_err_r3 || `prefix_0in.mcu1.mcu_l2t0_scb_mecc_err || `prefix_0in.mcu1.mcu_l2t1_scb_mecc_err);
reg mcu2_mecc_err_enq;
wire mcu2_mecc_err = (`prefix_0in.mcu2.mcu_l2t0_mecc_err_r3 || `prefix_0in.mcu2.mcu_l2t1_mecc_err_r3 || `prefix_0in.mcu2.mcu_l2t0_scb_mecc_err || `prefix_0in.mcu2.mcu_l2t1_scb_mecc_err);
reg mcu3_mecc_err_enq;
wire mcu3_mecc_err = (`prefix_0in.mcu3.mcu_l2t0_mecc_err_r3 || `prefix_0in.mcu3.mcu_l2t1_mecc_err_r3 || `prefix_0in.mcu3.mcu_l2t0_scb_mecc_err || `prefix_0in.mcu3.mcu_l2t1_scb_mecc_err);

reg mcu0_dummy_dbg_mecc_err;
reg mcu1_dummy_dbg_mecc_err;
reg mcu2_dummy_dbg_mecc_err;
reg mcu3_dummy_dbg_mecc_err;

initial
begin
    mcu0_mecc_err_enq = 1'b0;
    mcu1_mecc_err_enq = 1'b0;
    mcu2_mecc_err_enq = 1'b0;
    mcu3_mecc_err_enq = 1'b0;
    mcu0_dummy_dbg_mecc_err = 1'b0;
    mcu1_dummy_dbg_mecc_err = 1'b0;
    mcu2_dummy_dbg_mecc_err = 1'b0;
    mcu3_dummy_dbg_mecc_err = 1'b0;
end

always @(posedge mcu0_mecc_err)
begin
    mcu0_mecc_err_enq = 1'b1;
    @(posedge `prefix_0in.mcu0.l2clk);
    mcu0_mecc_err_enq = 1'b0;
end

always @(posedge mcu1_mecc_err)
begin
    mcu1_mecc_err_enq = 1'b1;
    @(posedge `prefix_0in.mcu1.l2clk);
    mcu1_mecc_err_enq = 1'b0;
end

always @(posedge mcu2_mecc_err)
begin
    mcu2_mecc_err_enq = 1'b1;
    @(posedge `prefix_0in.mcu2.l2clk);
    mcu2_mecc_err_enq = 1'b0;
end

always @(posedge mcu3_mecc_err)
begin
    mcu3_mecc_err_enq = 1'b1;
    @(posedge `prefix_0in.mcu3.l2clk);
    mcu3_mecc_err_enq = 1'b0;
end

always @(posedge `prefix_0in.mcu0.rdata.rdata_cmp_io_sync_en)
begin
    if(mcu0_mecc_err) begin
        mcu0_dummy_dbg_mecc_err = 1'b1;
        @(posedge `prefix_0in.mcu0.l2clk);
        mcu0_dummy_dbg_mecc_err = 1'b0;
    end
end

always @(posedge `prefix_0in.mcu1.rdata.rdata_cmp_io_sync_en)
begin
    if(mcu1_mecc_err) begin
        mcu1_dummy_dbg_mecc_err = 1'b1;
        @(posedge `prefix_0in.mcu1.l2clk);
        mcu1_dummy_dbg_mecc_err = 1'b0;
    end
end

always @(posedge `prefix_0in.mcu2.rdata.rdata_cmp_io_sync_en)
begin
    if(mcu2_mecc_err) begin
        mcu2_dummy_dbg_mecc_err = 1'b1;
        @(posedge `prefix_0in.mcu2.l2clk);
        mcu2_dummy_dbg_mecc_err = 1'b0;
    end
end

always @(posedge `prefix_0in.mcu3.rdata.rdata_cmp_io_sync_en)
begin
    if(mcu3_mecc_err) begin
        mcu3_dummy_dbg_mecc_err = 1'b1;
        @(posedge `prefix_0in.mcu3.l2clk);
        mcu3_dummy_dbg_mecc_err = 1'b0;
    end
end


/*
0in multi_clock_multi_enq_deq_fifo
-enq (mcu0_mecc_err_enq && ~`prefix_0in.mcu0.ucb.ucb_serdes_dtm) (mcu0_dummy_dbg_mecc_err && ~mcu0_mecc_err_enq && ~`prefix_0in.mcu0.ucb.ucb_serdes_dtm)
-enq_clock `prefix_0in.mcu0.l2clk
-deq (`prefix_0in.mcu0.mcu_dbg1_mecc_err && ~`prefix_0in.mcu0.ucb.ucb_serdes_dtm)
-deq_clock `prefix_0in.mcu0.iol2clk
-depth 200
-module mcu 
*/

/*
0in multi_clock_multi_enq_deq_fifo
-enq (mcu1_mecc_err_enq && ~`prefix_0in.mcu1.ucb.ucb_serdes_dtm) (mcu1_dummy_dbg_mecc_err && ~mcu1_mecc_err_enq && ~`prefix_0in.mcu1.ucb.ucb_serdes_dtm)
-enq_clock `prefix_0in.mcu1.l2clk
-deq (`prefix_0in.mcu1.mcu_dbg1_mecc_err && ~`prefix_0in.mcu1.ucb.ucb_serdes_dtm)
-deq_clock `prefix_0in.mcu1.iol2clk
-depth 200
-module mcu 
*/

/*
0in multi_clock_multi_enq_deq_fifo
-enq (mcu2_mecc_err_enq && ~`prefix_0in.mcu2.ucb.ucb_serdes_dtm) (mcu2_dummy_dbg_mecc_err && ~mcu2_mecc_err_enq && ~`prefix_0in.mcu2.ucb.ucb_serdes_dtm)
-enq_clock `prefix_0in.mcu2.l2clk
-deq (`prefix_0in.mcu2.mcu_dbg1_mecc_err && ~`prefix_0in.mcu2.ucb.ucb_serdes_dtm)
-deq_clock `prefix_0in.mcu2.iol2clk
-depth 200
-module mcu 
*/

/*
0in multi_clock_multi_enq_deq_fifo
-enq (mcu3_mecc_err_enq && ~`prefix_0in.mcu3.ucb.ucb_serdes_dtm) (mcu3_dummy_dbg_mecc_err && ~mcu3_mecc_err_enq && ~`prefix_0in.mcu3.ucb.ucb_serdes_dtm)
-enq_clock `prefix_0in.mcu3.l2clk
-deq (`prefix_0in.mcu3.mcu_dbg1_mecc_err && ~`prefix_0in.mcu3.ucb.ucb_serdes_dtm)
-deq_clock `prefix_0in.mcu3.iol2clk
-depth 200
-module mcu 
*/


/* C9.6: Debug Logic

Signals:
 mcu_dbg1_secc_err          Single nibble ECC error

 Property:
 6. OR of secc_err and scb_secc_err for both l2 banks
*/
/********** Property C9.6 **********/
reg mcu0_secc_err_enq;
wire mcu0_secc_err = (`prefix_0in.mcu0.mcu_l2t0_secc_err_r3 || `prefix_0in.mcu0.mcu_l2t1_secc_err_r3 || `prefix_0in.mcu0.mcu_l2t0_scb_secc_err || `prefix_0in.mcu0.mcu_l2t1_scb_secc_err);
reg mcu1_secc_err_enq;
wire mcu1_secc_err = (`prefix_0in.mcu1.mcu_l2t0_secc_err_r3 || `prefix_0in.mcu1.mcu_l2t1_secc_err_r3 || `prefix_0in.mcu1.mcu_l2t0_scb_secc_err || `prefix_0in.mcu1.mcu_l2t1_scb_secc_err);
reg mcu2_secc_err_enq;
wire mcu2_secc_err = (`prefix_0in.mcu2.mcu_l2t0_secc_err_r3 || `prefix_0in.mcu2.mcu_l2t1_secc_err_r3 || `prefix_0in.mcu2.mcu_l2t0_scb_secc_err || `prefix_0in.mcu2.mcu_l2t1_scb_secc_err);
reg mcu3_secc_err_enq;
wire mcu3_secc_err = (`prefix_0in.mcu3.mcu_l2t0_secc_err_r3 || `prefix_0in.mcu3.mcu_l2t1_secc_err_r3 || `prefix_0in.mcu3.mcu_l2t0_scb_secc_err || `prefix_0in.mcu3.mcu_l2t1_scb_secc_err);

reg mcu0_dummy_secc_err;
reg mcu1_dummy_secc_err;
reg mcu2_dummy_secc_err;
reg mcu3_dummy_secc_err;

initial
begin
    mcu0_secc_err_enq = 1'b0;
    mcu1_secc_err_enq = 1'b0;
    mcu2_secc_err_enq = 1'b0;
    mcu3_secc_err_enq = 1'b0;
    mcu0_dummy_secc_err = 1'b0;
    mcu1_dummy_secc_err = 1'b0;
    mcu2_dummy_secc_err = 1'b0;
    mcu3_dummy_secc_err = 1'b0;
end    

always @(posedge mcu0_secc_err)
begin
    mcu0_secc_err_enq = 1'b1;
    @(posedge `prefix_0in.mcu0.l2clk);
    mcu0_secc_err_enq = 1'b0;
end

always @(posedge mcu1_secc_err)
begin
    mcu1_secc_err_enq = 1'b1;
    @(posedge `prefix_0in.mcu1.l2clk);
    mcu1_secc_err_enq = 1'b0;
end

always @(posedge mcu2_secc_err)
begin
    mcu2_secc_err_enq = 1'b1;
    @(posedge `prefix_0in.mcu2.l2clk);
    mcu2_secc_err_enq = 1'b0;
end

always @(posedge mcu3_secc_err)
begin
    mcu3_secc_err_enq = 1'b1;
    @(posedge `prefix_0in.mcu3.l2clk);
    mcu3_secc_err_enq = 1'b0;
end

always @(posedge `prefix_0in.mcu0.rdata.rdata_cmp_io_sync_en)
begin
    if(mcu0_secc_err) begin
        mcu0_dummy_secc_err = 1'b1;
        @(posedge `prefix_0in.mcu0.l2clk);
        mcu0_dummy_secc_err = 1'b0;
    end
end

always @(posedge `prefix_0in.mcu1.rdata.rdata_cmp_io_sync_en)
begin
    if(mcu1_secc_err) begin
        mcu1_dummy_secc_err = 1'b1;
        @(posedge `prefix_0in.mcu1.l2clk);
        mcu1_dummy_secc_err = 1'b0;
    end
end

always @(posedge `prefix_0in.mcu2.rdata.rdata_cmp_io_sync_en)
begin
    if(mcu2_secc_err) begin
        mcu2_dummy_secc_err = 1'b1;
        @(posedge `prefix_0in.mcu2.l2clk);
        mcu2_dummy_secc_err = 1'b0;
    end
end

always @(posedge `prefix_0in.mcu3.rdata.rdata_cmp_io_sync_en)
begin
    if(mcu3_secc_err) begin
        mcu3_dummy_secc_err = 1'b1;
        @(posedge `prefix_0in.mcu3.l2clk);
        mcu3_dummy_secc_err = 1'b0;
    end
end


/*
0in multi_clock_multi_enq_deq_fifo
-enq (mcu0_secc_err_enq && ~`prefix_0in.mcu0.ucb.ucb_serdes_dtm) (mcu0_dummy_secc_err && ~mcu0_secc_err_enq && ~`prefix_0in.mcu0.ucb.ucb_serdes_dtm)
-enq_clock `prefix_0in.mcu0.l2clk
-deq (`prefix_0in.mcu0.mcu_dbg1_secc_err && ~`prefix_0in.mcu0.ucb.ucb_serdes_dtm)
-deq_clock `prefix_0in.mcu0.iol2clk
-depth 200
-module mcu 
*/

/*
0in multi_clock_multi_enq_deq_fifo
-enq (mcu1_secc_err_enq && ~`prefix_0in.mcu1.ucb.ucb_serdes_dtm) (mcu1_dummy_secc_err && ~mcu1_secc_err_enq && ~`prefix_0in.mcu1.ucb.ucb_serdes_dtm)
-enq_clock `prefix_0in.mcu1.l2clk
-deq  (`prefix_0in.mcu1.mcu_dbg1_secc_err && ~`prefix_0in.mcu1.ucb.ucb_serdes_dtm)
-deq_clock `prefix_0in.mcu1.iol2clk
-depth 200
-module mcu 
*/

/*
0in multi_clock_multi_enq_deq_fifo
-enq (mcu2_secc_err_enq && ~`prefix_0in.mcu2.ucb.ucb_serdes_dtm) (mcu2_dummy_secc_err && ~mcu2_secc_err_enq && ~`prefix_0in.mcu2.ucb.ucb_serdes_dtm)
-enq_clock `prefix_0in.mcu2.l2clk
-deq (`prefix_0in.mcu2.mcu_dbg1_secc_err && ~`prefix_0in.mcu2.ucb.ucb_serdes_dtm)
-deq_clock `prefix_0in.mcu2.iol2clk
-depth 200
-module mcu 
*/

/*
0in multi_clock_multi_enq_deq_fifo
-enq (mcu3_secc_err_enq && ~`prefix_0in.mcu3.ucb.ucb_serdes_dtm) (mcu3_dummy_secc_err && ~mcu3_secc_err_enq && ~`prefix_0in.mcu3.ucb.ucb_serdes_dtm)
-enq_clock `prefix_0in.mcu3.l2clk
-deq (`prefix_0in.mcu3.mcu_dbg1_secc_err && ~`prefix_0in.mcu3.ucb.ucb_serdes_dtm)
-deq_clock `prefix_0in.mcu3.iol2clk
-depth 200
-module mcu 
*/


/* C9.7: Debug Logic

Signals:
 mcu_dbg1_fbd_err           FBD channel error

 Property:
 7. Any FBU or FBR error
*/
/********** Property C9.7 **********/
/*
0in multi_clock_fifo
-enq (fbdic.fbdic_fbd_error_in && ~ucb.ucb_serdes_dtm)
-enq_clock drl2clk
-deq (mcu_dbg1_fbd_err && ~ucb.ucb_serdes_dtm)
-deq_clock iol2clk
-depth 200
-enqueue off
-module mcu 
*/

/* C9.8: Debug Logic

Signals:
 mcu_dbg1_err_mode          MCU in error processing mode

 Property:
 8. Asserted when MCU is processing an error, i.e. error state machines are not in
idle state.
*/
/********** Property C9.8 **********/
/* XXX
0in multi_clock_fifo
-enq (($0in_rising_edge(drif.drif_mcu_error_mode) || $0in_falling_edge(drif.drif_mcu_error_mode)) && ~ucb.ucb_serdes_dtm)
-enq_clock drl2clk
-deq (($0in_rising_edge(mcu_dbg1_err_mode) || $0in_falling_edge(mcu_dbg1_err_mode)) && ~ucb.ucb_serdes_dtm)
-deq_clock iol2clk
-depth 50
-module mcu 
*/


/* C9.9: Debug Logic

Signals:
 mcu_dbg1_err_event         Debug error event when debug trigger is enabled
 
 Property:
 9. Enabled by debug trigger enable register.  Asserted for and mecc, secc or fbd error.
*/
/********** Property C9.9 **********/
/*
0in multi_clock_fifo
-enq ((rdpctl.rdpctl_dbg_trig_enable && (mcu_l2t0_mecc_err_r3 || mcu_l2t1_mecc_err_r3 || mcu_l2t0_scb_mecc_err || mcu_l2t1_scb_mecc_err || mcu_l2t0_secc_err_r3 || mcu_l2t1_secc_err_r3 || mcu_l2t0_scb_secc_err || mcu_l2t1_scb_secc_err)) && ~ucb.ucb_serdes_dtm)
-enq_clock l2clk
-deq ((rdpctl.rdpctl_dbg_trig_enable && mcu_dbg1_err_event) && ~ucb.ucb_serdes_dtm)
-deq_clock iol2clk
-depth 32
-module mcu 
*/

/* C9.10: Debug Logic

Signals:
{mcu_dbg1_crc21,mcu_dbg1_rd_req_in_0[3:0],mcu_dbg1_rd_req_in_1[3:0],mcu_dbg1_rd_req_out[4:0],mcu_dbg1_wr_req_in_0,mcu_dbg1_wr_req_in_1,mcu_dbg1_wr_req_out[1:0],mcu_dbg1_mecc_err,mcu_dbg1_secc_err,mcu_dbg1_fbd_err,mcu_dbg1_err_mode} == crc in dtm mode

Property:
 10. In DTM mode, crc is transmitted on dbg signals

*/
/********** Property C9.10 **********/

wire [21:0] mcu0_dbg1_crc = {`prefix_0in.mcu0.mcu_dbg1_crc21,`prefix_0in.mcu0.mcu_dbg1_rd_req_in_0[3:0],`prefix_0in.mcu0.mcu_dbg1_rd_req_in_1[3:0],`prefix_0in.mcu0.mcu_dbg1_rd_req_out[4:0],`prefix_0in.mcu0.mcu_dbg1_wr_req_in_0,`prefix_0in.mcu0.mcu_dbg1_wr_req_in_1,`prefix_0in.mcu0.mcu_dbg1_wr_req_out[1:0],`prefix_0in.mcu0.mcu_dbg1_mecc_err,`prefix_0in.mcu0.mcu_dbg1_secc_err,`prefix_0in.mcu0.mcu_dbg1_fbd_err,`prefix_0in.mcu0.mcu_dbg1_err_mode};

wire [21:0] mcu1_dbg1_crc = {`prefix_0in.mcu1.mcu_dbg1_crc21,`prefix_0in.mcu1.mcu_dbg1_rd_req_in_0[3:0],`prefix_0in.mcu1.mcu_dbg1_rd_req_in_1[3:0],`prefix_0in.mcu1.mcu_dbg1_rd_req_out[4:0],`prefix_0in.mcu1.mcu_dbg1_wr_req_in_0,`prefix_0in.mcu1.mcu_dbg1_wr_req_in_1,`prefix_0in.mcu1.mcu_dbg1_wr_req_out[1:0],`prefix_0in.mcu1.mcu_dbg1_mecc_err,`prefix_0in.mcu1.mcu_dbg1_secc_err,`prefix_0in.mcu1.mcu_dbg1_fbd_err,`prefix_0in.mcu1.mcu_dbg1_err_mode};

wire [21:0] mcu2_dbg1_crc = {`prefix_0in.mcu2.mcu_dbg1_crc21,`prefix_0in.mcu2.mcu_dbg1_rd_req_in_0[3:0],`prefix_0in.mcu2.mcu_dbg1_rd_req_in_1[3:0],`prefix_0in.mcu2.mcu_dbg1_rd_req_out[4:0],`prefix_0in.mcu2.mcu_dbg1_wr_req_in_0,`prefix_0in.mcu2.mcu_dbg1_wr_req_in_1,`prefix_0in.mcu2.mcu_dbg1_wr_req_out[1:0],`prefix_0in.mcu2.mcu_dbg1_mecc_err,`prefix_0in.mcu2.mcu_dbg1_secc_err,`prefix_0in.mcu2.mcu_dbg1_fbd_err,`prefix_0in.mcu2.mcu_dbg1_err_mode};

wire [21:0] mcu3_dbg1_crc = {`prefix_0in.mcu3.mcu_dbg1_crc21,`prefix_0in.mcu3.mcu_dbg1_rd_req_in_0[3:0],`prefix_0in.mcu3.mcu_dbg1_rd_req_in_1[3:0],`prefix_0in.mcu3.mcu_dbg1_rd_req_out[4:0],`prefix_0in.mcu3.mcu_dbg1_wr_req_in_0,`prefix_0in.mcu3.mcu_dbg1_wr_req_in_1,`prefix_0in.mcu3.mcu_dbg1_wr_req_out[1:0],`prefix_0in.mcu3.mcu_dbg1_mecc_err,`prefix_0in.mcu3.mcu_dbg1_secc_err,`prefix_0in.mcu3.mcu_dbg1_fbd_err,`prefix_0in.mcu3.mcu_dbg1_err_mode};

/*
0in multi_clock_fifo
-enq (`prefix_0in.mcu0.ucb.ucb_serdes_dtm && (|(`prefix_0in.mcu0.fbdiwr.ch0_crc ^ `prefix_0in.mcu0.fbdiwr.ch1_crc))) 
-enq_data ((`prefix_0in.mcu0.fbdiwr.ch0_crc ^ `prefix_0in.mcu0.fbdiwr.ch1_crc))
-enq_clock `prefix_0in.mcu0.drl2clk
-deq (`prefix_0in.mcu0.ucb.ucb_serdes_dtm && (|mcu0_dbg1_crc))
-deq_data mcu0_dbg1_crc
-deq_clock `prefix_0in.mcu0.iol2clk
-depth 8
-module mcu 
*/
 
/*
0in multi_clock_fifo
-enq (`prefix_0in.mcu1.ucb.ucb_serdes_dtm && (|(`prefix_0in.mcu1.fbdiwr.ch0_crc ^ `prefix_0in.mcu1.fbdiwr.ch1_crc))) 
-enq_data ((`prefix_0in.mcu1.fbdiwr.ch0_crc ^ `prefix_0in.mcu1.fbdiwr.ch1_crc))
-enq_clock `prefix_0in.mcu1.drl2clk
-deq (`prefix_0in.mcu1.ucb.ucb_serdes_dtm && (|mcu1_dbg1_crc))
-deq_data mcu1_dbg1_crc
-deq_clock `prefix_0in.mcu1.iol2clk
-depth 8
-module mcu 
*/

/*
0in multi_clock_fifo
-enq (`prefix_0in.mcu2.ucb.ucb_serdes_dtm && (|(`prefix_0in.mcu2.fbdiwr.ch0_crc ^ `prefix_0in.mcu2.fbdiwr.ch1_crc))) 
-enq_data ((`prefix_0in.mcu2.fbdiwr.ch0_crc ^ `prefix_0in.mcu2.fbdiwr.ch1_crc))
-enq_clock `prefix_0in.mcu2.drl2clk
-deq (`prefix_0in.mcu2.ucb.ucb_serdes_dtm && (|mcu2_dbg1_crc))
-deq_data mcu2_dbg1_crc
-deq_clock `prefix_0in.mcu2.iol2clk
-depth 8
-module mcu 
*/

/*
0in multi_clock_fifo
-enq (`prefix_0in.mcu3.ucb.ucb_serdes_dtm && (|(`prefix_0in.mcu3.fbdiwr.ch0_crc ^ `prefix_0in.mcu3.fbdiwr.ch1_crc))) 
-enq_data ((`prefix_0in.mcu3.fbdiwr.ch0_crc ^ `prefix_0in.mcu3.fbdiwr.ch1_crc))
-enq_clock `prefix_0in.mcu3.drl2clk
-deq (`prefix_0in.mcu3.ucb.ucb_serdes_dtm && (|mcu3_dbg1_crc))
-deq_data mcu3_dbg1_crc
-deq_clock `prefix_0in.mcu3.iol2clk
-depth 8
-module mcu 
*/




`endif

initial
begin
if($test$plusargs("dump_checkers"))
    $fsdbDumpvars(0,mcul2_intf_chkr);
end

endmodule
