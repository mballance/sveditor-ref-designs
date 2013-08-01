// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2_mcu_intf_chkr.v
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
`ifdef FC_BENCH
 `define TB_TOP tb_top
`else
`ifdef CCM
  `define TB_TOP tb_top
`else
  `define TB_TOP l2sat_top
`endif
`endif


module l2_mcu_intf_chkr();

reg[1:0] l2t0_data_vld_count;
reg[1:0] l2t1_data_vld_count;
reg[1:0] l2t2_data_vld_count;
reg[1:0] l2t3_data_vld_count;
reg[1:0] l2t4_data_vld_count;
reg[1:0] l2t5_data_vld_count;
reg[1:0] l2t6_data_vld_count;
reg[1:0] l2t7_data_vld_count;

initial begin
   l2t0_data_vld_count = 2'b0;
   l2t1_data_vld_count = 2'b0;
   l2t2_data_vld_count = 2'b0;
   l2t3_data_vld_count = 2'b0;
   l2t4_data_vld_count = 2'b0;
   l2t5_data_vld_count = 2'b0;
   l2t6_data_vld_count = 2'b0;
   l2t7_data_vld_count = 2'b0;
end


always@ (posedge `TB_TOP.cpu.l2clk)
begin
   if(`TB_TOP.cpu.l2t0.mcu_l2t_data_vld_r0)
      l2t0_data_vld_count = (l2t0_data_vld_count + 1)%4;
   if(`TB_TOP.cpu.l2t1.mcu_l2t_data_vld_r0)
      l2t1_data_vld_count = (l2t1_data_vld_count + 1)%4;
   if(`TB_TOP.cpu.l2t2.mcu_l2t_data_vld_r0)
      l2t2_data_vld_count = (l2t2_data_vld_count + 1)%4; 
   if(`TB_TOP.cpu.l2t3.mcu_l2t_data_vld_r0)
      l2t3_data_vld_count = (l2t3_data_vld_count + 1)%4;
   if(`TB_TOP.cpu.l2t4.mcu_l2t_data_vld_r0)
      l2t4_data_vld_count = (l2t4_data_vld_count + 1)%4;
   if(`TB_TOP.cpu.l2t5.mcu_l2t_data_vld_r0)
      l2t5_data_vld_count = (l2t5_data_vld_count + 1)%4;
   if(`TB_TOP.cpu.l2t6.mcu_l2t_data_vld_r0)
      l2t6_data_vld_count = (l2t6_data_vld_count + 1)%4;
   if(`TB_TOP.cpu.l2t7.mcu_l2t_data_vld_r0)
      l2t7_data_vld_count = (l2t7_data_vld_count + 1)%4;
end



// 0in set_clock  -default   l2clk   -module cpu


// This directive ensures that each req is followed by an ack
/* 0in req_ack -req l2t_mcu_rd_req -ack mcu_l2t_rd_ack
   -module l2t  -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

/* 0in req_ack -req l2t_mcu_wr_req -ack mcu_l2t_wr_ack
   -module l2t  -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

// This directive ensures that there is at most 8 outstanding request ids
// and each ack matches with the corresponding req.
/* 0in outstanding_id -req `TB_TOP.cpu.l2t0.l2t_mcu_rd_req -req_id `TB_TOP.cpu.l2t0.l2t_mcu_rd_req_id
   -ret (`TB_TOP.cpu.l2t0.mcu_l2t_data_vld_r0 & (l2t0_data_vld_count == 3)) -ret_id `TB_TOP.cpu.l2t0.mcu_l2t_rd_req_id_r0
   -max_ids 8
   -max_count_per_id 1
   -known_ids on
   -clock `TB_TOP.cpu.l2clk -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

/* 0in outstanding_id -req `TB_TOP.cpu.l2t1.l2t_mcu_rd_req -req_id `TB_TOP.cpu.l2t1.l2t_mcu_rd_req_id
   -ret (`TB_TOP.cpu.l2t1.mcu_l2t_data_vld_r0 & (l2t1_data_vld_count == 3)) -ret_id `TB_TOP.cpu.l2t1.mcu_l2t_rd_req_id_r0
   -max_ids 8
   -max_count_per_id 1
   -known_ids on
   -clock `TB_TOP.cpu.l2clk -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

/* 0in outstanding_id -req `TB_TOP.cpu.l2t2.l2t_mcu_rd_req -req_id `TB_TOP.cpu.l2t2.l2t_mcu_rd_req_id
   -ret (`TB_TOP.cpu.l2t2.mcu_l2t_data_vld_r0 & (l2t2_data_vld_count == 3)) -ret_id `TB_TOP.cpu.l2t2.mcu_l2t_rd_req_id_r0
   -max_ids 8
   -max_count_per_id 1
   -known_ids on
   -clock `TB_TOP.cpu.l2clk -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

/* 0in outstanding_id -req `TB_TOP.cpu.l2t3.l2t_mcu_rd_req -req_id `TB_TOP.cpu.l2t3.l2t_mcu_rd_req_id
   -ret (`TB_TOP.cpu.l2t3.mcu_l2t_data_vld_r0 & (l2t3_data_vld_count == 3)) -ret_id `TB_TOP.cpu.l2t3.mcu_l2t_rd_req_id_r0
   -max_ids 8
   -max_count_per_id 1
   -known_ids on
   -clock `TB_TOP.cpu.l2clk -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

/* 0in outstanding_id -req `TB_TOP.cpu.l2t4.l2t_mcu_rd_req -req_id `TB_TOP.cpu.l2t4.l2t_mcu_rd_req_id
   -ret (`TB_TOP.cpu.l2t4.mcu_l2t_data_vld_r0 & (l2t4_data_vld_count == 3)) -ret_id `TB_TOP.cpu.l2t4.mcu_l2t_rd_req_id_r0
   -max_ids 8
   -max_count_per_id 1
   -known_ids on
   -clock `TB_TOP.cpu.l2clk -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

/* 0in outstanding_id -req `TB_TOP.cpu.l2t5.l2t_mcu_rd_req -req_id `TB_TOP.cpu.l2t5.l2t_mcu_rd_req_id
   -ret (`TB_TOP.cpu.l2t5.mcu_l2t_data_vld_r0 & (l2t5_data_vld_count == 3)) -ret_id `TB_TOP.cpu.l2t5.mcu_l2t_rd_req_id_r0
   -max_ids 8
   -max_count_per_id 1
   -known_ids on
   -clock `TB_TOP.cpu.l2clk -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

/* 0in outstanding_id -req `TB_TOP.cpu.l2t6.l2t_mcu_rd_req -req_id `TB_TOP.cpu.l2t6.l2t_mcu_rd_req_id
   -ret (`TB_TOP.cpu.l2t6.mcu_l2t_data_vld_r0 & (l2t6_data_vld_count == 3)) -ret_id `TB_TOP.cpu.l2t6.mcu_l2t_rd_req_id_r0
   -max_ids 8
   -max_count_per_id 1
   -known_ids on
   -clock `TB_TOP.cpu.l2clk -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

/* 0in outstanding_id -req `TB_TOP.cpu.l2t7.l2t_mcu_rd_req -req_id `TB_TOP.cpu.l2t7.l2t_mcu_rd_req_id
   -ret (`TB_TOP.cpu.l2t7.mcu_l2t_data_vld_r0 & (l2t7_data_vld_count == 3)) -ret_id `TB_TOP.cpu.l2t7.mcu_l2t_rd_req_id_r0
   -max_ids 8
   -max_count_per_id 1
   -known_ids on
   -clock `TB_TOP.cpu.l2clk -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

// This directive ensures that the write data vld signals is asserted 6 clock
// cycles after receiving the write ack.

/*0in assert_follower -leader `TB_TOP.cpu.mcu0_l2t0_wr_ack -follower `TB_TOP.cpu.l2b0.evict_l2b_mcu_data_vld_r5 -min 6 -max 6
  -clock `TB_TOP.cpu.l2clk -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

/*0in assert_follower -leader `TB_TOP.cpu.mcu0_l2t1_wr_ack -follower `TB_TOP.cpu.l2b1.evict_l2b_mcu_data_vld_r5 -min 8 -max 8
  -clock `TB_TOP.cpu.l2clk -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

/*0in assert_follower -leader `TB_TOP.cpu.mcu1_l2t2_wr_ack -follower `TB_TOP.cpu.l2b2.evict_l2b_mcu_data_vld_r5 -min 6 -max 6
  -clock `TB_TOP.cpu.l2clk -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

/*0in assert_follower -leader `TB_TOP.cpu.mcu1_l2t3_wr_ack -follower `TB_TOP.cpu.l2b3.evict_l2b_mcu_data_vld_r5 -min 8 -max 8
  -clock `TB_TOP.cpu.l2clk -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

/*0in assert_follower -leader `TB_TOP.cpu.mcu2_l2t4_wr_ack -follower `TB_TOP.cpu.l2b4.evict_l2b_mcu_data_vld_r5 -min 6 -max 6
  -clock `TB_TOP.cpu.l2clk -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

/*0in assert_follower -leader `TB_TOP.cpu.mcu2_l2t5_wr_ack -follower `TB_TOP.cpu.l2b5.evict_l2b_mcu_data_vld_r5 -min 8 -max 8
  -clock `TB_TOP.cpu.l2clk -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

/*0in assert_follower -leader `TB_TOP.cpu.mcu3_l2t6_wr_ack -follower `TB_TOP.cpu.l2b6.evict_l2b_mcu_data_vld_r5 -min 6 -max 6
  -clock `TB_TOP.cpu.l2clk -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

/*0in assert_follower -leader `TB_TOP.cpu.mcu3_l2t7_wr_ack -follower `TB_TOP.cpu.l2b7.evict_l2b_mcu_data_vld_r5 -min 8 -max 8
  -clock `TB_TOP.cpu.l2clk -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/


// This direcitive ensures that the write data is sent in 8 cycles.
/*0in assert_follower -leader evict_l2b_mcu_data_vld_r5 -follower ~evict_l2b_mcu_data_vld_r5
   -min 8 -max 8
   -module l2b -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

//Check that the control signals are known and driven all the time

/* 0in known_driven -var l2t_mcu_rd_req -module l2t -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/
/* 0in known_driven -var l2t_mcu_wr_req -module l2t -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/
/* 0in known_driven -var mcu_l2t_rd_ack -module l2t -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/
/* 0in known_driven -var mcu_l2t_wr_ack -module l2t -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/
/* 0in known_driven -var evict_l2b_mcu_data_vld_r5 -module l2b -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/
/* 0in known_driven -var mcu_l2t_data_vld_r0 -module l2t -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/
   
// This directive ensures that the address is asserted during the requests
/* 0in known_driven -var {l2t_mcu_addr, l2t_mcu_addr_5}
   -active (l2t_mcu_rd_req | l2t_mcu_wr_req)
   -module l2t -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

// This directive ensures that the req_id is asserted during a read request
/* 0in known_driven -var l2t_mcu_rd_req_id
   -active l2t_mcu_rd_req
   -module l2t -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

// This directive ensures that the chunk_id and req_id is asserted during the
// read data return cycles.
/* 0in known_driven -var {mcu_l2t_chunk_id_r0, mcu_l2t_rd_req_id_r0}
   -active mcu_l2t_data_vld_r0
   -module l2t -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

// This directive ensures that the read data and the corresponding ecc are 
// asserted 3 cycles after the valid signal.

/* 0in known_driven -var {`TB_TOP.cpu.l2b0.mcu_l2b_data_r2, `TB_TOP.cpu.l2b0.mcu_l2b_ecc_r2}
   -active $0in_delay(`TB_TOP.cpu.l2t0.mcu_l2t_data_vld_r0, 3)
   -clock `TB_TOP.cpu.l2clk -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

/* 0in known_driven -var {`TB_TOP.cpu.l2b1.mcu_l2b_data_r2, `TB_TOP.cpu.l2b1.mcu_l2b_ecc_r2}
   -active $0in_delay(`TB_TOP.cpu.l2t1.mcu_l2t_data_vld_r0, 3)
   -clock `TB_TOP.cpu.l2clk -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

/* 0in known_driven -var {`TB_TOP.cpu.l2b2.mcu_l2b_data_r2, `TB_TOP.cpu.l2b2.mcu_l2b_ecc_r2}
   -active $0in_delay(`TB_TOP.cpu.l2t2.mcu_l2t_data_vld_r0, 3)
   -clock `TB_TOP.cpu.l2clk -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

/* 0in known_driven -var {`TB_TOP.cpu.l2b3.mcu_l2b_data_r2, `TB_TOP.cpu.l2b3.mcu_l2b_ecc_r2}
   -active $0in_delay(`TB_TOP.cpu.l2t3.mcu_l2t_data_vld_r0, 3)
   -clock `TB_TOP.cpu.l2clk -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

/* 0in known_driven -var {`TB_TOP.cpu.l2b4.mcu_l2b_data_r2, `TB_TOP.cpu.l2b4.mcu_l2b_ecc_r2}
   -active $0in_delay(`TB_TOP.cpu.l2t4.mcu_l2t_data_vld_r0, 3)
   -clock `TB_TOP.cpu.l2clk -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

/* 0in known_driven -var {`TB_TOP.cpu.l2b5.mcu_l2b_data_r2, `TB_TOP.cpu.l2b5.mcu_l2b_ecc_r2}
   -active $0in_delay(`TB_TOP.cpu.l2t5.mcu_l2t_data_vld_r0, 3)
   -clock `TB_TOP.cpu.l2clk -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

/* 0in known_driven -var {`TB_TOP.cpu.l2b6.mcu_l2b_data_r2, `TB_TOP.cpu.l2b6.mcu_l2b_ecc_r2}
   -active $0in_delay(`TB_TOP.cpu.l2t6.mcu_l2t_data_vld_r0, 3)
   -clock `TB_TOP.cpu.l2clk -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

/* 0in known_driven -var {`TB_TOP.cpu.l2b7.mcu_l2b_data_r2, `TB_TOP.cpu.l2b7.mcu_l2b_ecc_r2}
   -active $0in_delay(`TB_TOP.cpu.l2t7.mcu_l2t_data_vld_r0, 3)
   -clock `TB_TOP.cpu.l2clk -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

// This directive ensures that the write data and write data ecc are asserted
// while the valid signal is asserted.
/* 0in known_driven -var  {evict_l2b_mcu_wr_data_r5, l2b_evict_l2b_mcu_data_mecc_r5}
   -active evict_l2b_mcu_data_vld_r5
   -module l2b -reset ~(`TB_TOP.cpu.l2t0.rst_wmr_)
*/

endmodule //l2_mcu_intf_chkr


