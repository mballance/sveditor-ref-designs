// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: trig_event.v
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
`define L2TAG0 tb_top.cpu.l2t0
`define L2DAT0 tb_top.cpu.l2d0
`define L2TAG1 tb_top.cpu.l2t1
`define L2DAT1 tb_top.cpu.l2d1
`define L2TAG2 tb_top.cpu.l2t2
`define L2DAT2 tb_top.cpu.l2d2
`define L2TAG3 tb_top.cpu.l2t3
`define L2DAT3 tb_top.cpu.l2d3
`define L2TAG4 tb_top.cpu.l2t4
`define L2DAT4 tb_top.cpu.l2d4
`define L2TAG5 tb_top.cpu.l2t5
`define L2DAT5 tb_top.cpu.l2d5
`define L2TAG6 tb_top.cpu.l2t6
`define L2DAT6 tb_top.cpu.l2d6
`define L2TAG7 tb_top.cpu.l2t7
`define L2DAT7 tb_top.cpu.l2d7
`define SPARC_CORE tb_top.cpu
`define L2TAG0 tb_top.cpu.l2t0
`define L2DAT0 tb_top.cpu.l2d0
`define L2TAG1 tb_top.cpu.l2t1
`define L2DAT1 tb_top.cpu.l2d1
`define L2TAG2 tb_top.cpu.l2t2
`define L2DAT2 tb_top.cpu.l2d2
`define L2TAG3 tb_top.cpu.l2t3
`define L2DAT3 tb_top.cpu.l2d3
`define L2TAG4 tb_top.cpu.l2t4
`define L2DAT4 tb_top.cpu.l2d4
`define L2TAG5 tb_top.cpu.l2t5
`define L2DAT5 tb_top.cpu.l2d5
`define L2TAG6 tb_top.cpu.l2t6
`define L2DAT6 tb_top.cpu.l2d6
`define L2TAG7 tb_top.cpu.l2t7
`define L2DAT7 tb_top.cpu.l2d7
`define SPARC_CORE tb_top.cpu

`define PCX0 `SPARC_CORE.spc0.spc_pcx_data_pa
`define PCX1 `SPARC_CORE.spc1.spc_pcx_data_pa
`define PCX2 `SPARC_CORE.spc2.spc_pcx_data_pa
`define PCX3 `SPARC_CORE.spc3.spc_pcx_data_pa
`define PCX4 `SPARC_CORE.spc4.spc_pcx_data_pa
`define PCX5 `SPARC_CORE.spc5.spc_pcx_data_pa
`define PCX6 `SPARC_CORE.spc6.spc_pcx_data_pa
`define PCX7 `SPARC_CORE.spc7.spc_pcx_data_pa

`define READ_REQ00  `SPARC_CORE.mcu0.l2t0_mcu_rd_req
`define WRITE_REQ00 `SPARC_CORE.mcu0.l2t0_mcu_wr_req
`define WRITE_VLD00 `SPARC_CORE.mcu0.l2b0_mcu_data_vld_r5
`define READ_REQ01  `SPARC_CORE.mcu0.l2t1_mcu_rd_req
`define WRITE_REQ01 `SPARC_CORE.mcu0.l2t1_mcu_wr_req
`define WRITE_VLD01 `SPARC_CORE.mcu0.l2b1_mcu_data_vld_r5

`define READ_REQ10  `SPARC_CORE.mcu1.l2t0_mcu_rd_req
`define WRITE_REQ10 `SPARC_CORE.mcu1.l2t0_mcu_wr_req
`define WRITE_VLD10 `SPARC_CORE.mcu1.l2b0_mcu_data_vld_r5
`define READ_REQ11  `SPARC_CORE.mcu1.l2t1_mcu_rd_req
`define WRITE_REQ11 `SPARC_CORE.mcu1.l2t1_mcu_wr_req
`define WRITE_VLD11 `SPARC_CORE.mcu1.l2b1_mcu_data_vld_r5

`define READ_REQ20  `SPARC_CORE.mcu2.l2t0_mcu_rd_req
`define WRITE_REQ20 `SPARC_CORE.mcu2.l2t0_mcu_wr_req
`define WRITE_VLD20 `SPARC_CORE.mcu2.l2b0_mcu_data_vld_r5
`define READ_REQ21  `SPARC_CORE.mcu2.l2t1_mcu_rd_req
`define WRITE_REQ21 `SPARC_CORE.mcu2.l2t1_mcu_wr_req
`define WRITE_VLD21 `SPARC_CORE.mcu2.l2b1_mcu_data_vld_r5

`define READ_REQ30  `SPARC_CORE.mcu3.l2t0_mcu_rd_req
`define WRITE_REQ30 `SPARC_CORE.mcu3.l2t0_mcu_wr_req
`define WRITE_VLD30 `SPARC_CORE.mcu3.l2b0_mcu_data_vld_r5
`define READ_REQ31  `SPARC_CORE.mcu3.l2t1_mcu_rd_req
`define WRITE_REQ31 `SPARC_CORE.mcu3.l2t1_mcu_wr_req
`define WRITE_VLD31 `SPARC_CORE.mcu3.l2b1_mcu_data_vld_r5

//nas path to get instruction donwe and pc
`define NAS_PATH tb_top.nas_top

module trig_event( /*AUTOARG*/
   // Inputs
   clk
   );
 `define DUMP 0
   input clk;   
   integer handle;
   //monitor pc and instruction done
   //E-stage, D-stage, M-stage, and W-stage
   //l1 & l2 invalide here
   reg 	   l2warm, rdy;   
   reg [7:0] active;
   reg 	     l2warm_enable, l1warm_enable, l1warm_start;
   reg 	     l2_done;
   reg 	     l2load_enable;
   reg 	     l2load, loadngo_enable, loadngo_mon;
   //checker
   task check_blk;
      input [3:0] core;
      input [129:0] pkt;
      
      if((pkt[128:124] == 5'b00001) &&
	 (pkt[115:114] == 2'b11) &&
	 (pkt[111:104] == 8'hff))begin
	$display("Info(%0t) ***LOADNGO WARNING*** spc%d issue a block store", $time, core);
	/*
	 case(core)
	   0 : `PR_ERROR("loadngo_mon", `ERROR, "spc0 issue a block store.\n");
	   1 : `PR_ERROR("loadngo_mon", `ERROR, "spc1 issue a block store.\n");
	   2 : `PR_ERROR("loadngo_mon", `ERROR, "spc2 issue a block store.\n");
	   3 : `PR_ERROR("loadngo_mon", `ERROR, "spc3 issue a block store.\n");
	   4 : `PR_ERROR("loadngo_mon", `ERROR, "spc4 issue a block store.\n");
	   5 : `PR_ERROR("loadngo_mon", `ERROR, "spc5 issue a block store.\n");
	   6 : `PR_ERROR("loadngo_mon", `ERROR, "spc6 issue a block store.\n");
	   7 : `PR_ERROR("loadngo_mon", `ERROR, "spc7 issue a block store.\n");
	 endcase // case(core)
	*/
      end
      
   endtask // check_blk
   
   //check block store
   always @(posedge clk)begin
      if(loadngo_enable)begin
`ifdef CORE_0    if(`PCX0[129])check_blk(0, `PCX0);`endif	 
`ifdef CORE_1 	 if(`PCX1[129])check_blk(1, `PCX1);`endif	 
`ifdef CORE_2 	 if(`PCX2[129])check_blk(2, `PCX2);`endif	 
`ifdef CORE_3 	 if(`PCX3[129])check_blk(3, `PCX3);`endif	 
`ifdef CORE_4 	 if(`PCX4[129])check_blk(4, `PCX4);`endif	 
`ifdef CORE_5 	 if(`PCX5[129])check_blk(5, `PCX5);`endif	 
`ifdef CORE_6 	 if(`PCX6[129])check_blk(6, `PCX6);`endif	 
`ifdef CORE_7 	 if(`PCX7[129])check_blk(7, `PCX7);`endif	 
      end      
   end // always @ (posedge clk)
   
   //monitor any load and store into dram
   always @(posedge clk)begin
      if(loadngo_enable)begin

	 if(`WRITE_VLD00)$display("Info(%0t) ***LOADNGO WARNING*** write request on mcu0 from l2 bank0", $time);
	 if(`WRITE_VLD01)$display("Info(%0t) ***LOADNGO WARNING*** write request on mcu0 from l2 bank1", $time);
	 if(`WRITE_VLD10)$display("Info(%0t) ***LOADNGO WARNING*** write request on mcu1 from l2 bank2", $time);
	 if(`WRITE_VLD11)$display("Info(%0t) ***LOADNGO WARNING*** write request on mcu1 from l2 bank3", $time);
	 if(`WRITE_VLD20)$display("Info(%0t) ***LOADNGO WARNING*** write request on mcu2 from l2 bank4", $time);
	 if(`WRITE_VLD21)$display("Info(%0t) ***LOADNGO WARNING*** write request on mcu3 from l2 bank5", $time);
	 if(`WRITE_VLD30)$display("Info(%0t) ***LOADNGO WARNING*** write request on mcu3 from l2 bank6", $time);
	 if(`WRITE_VLD31)$display("Info(%0t) ***LOADNGO WARNING*** write request on mcu3 from l2 bank7", $time);

	/*
//	 if(`READ_REQ00) `PR_ERROR("loadngo_mon", `ERROR, "read  request on mcu0 from l2 bank0\n");
	 if(`WRITE_VLD00)`PR_ERROR("loadngo_mon", `ERROR, "write request on mcu0 from l2 bank0\n");
//	 if(`READ_REQ01) `PR_ERROR("loadngo_mon", `ERROR, "read  request on mcu0 from l2 bank1\n");
	 if(`WRITE_VLD01)`PR_ERROR("loadngo_mon", `ERROR, "write request on mcu0 from l2 bank1\n");
	 
//	 if(`READ_REQ10) `PR_ERROR("loadngo_mon", `ERROR, "read  request on mcu1 from l2 bank2\n");
	 if(`WRITE_VLD10)`PR_ERROR("loadngo_mon", `ERROR, "write request on mcu1 from l2 bank2\n");
//	 if(`READ_REQ11) `PR_ERROR("loadngo_mon", `ERROR, "read  request on mcu1 from l2 bank3\n");
	 if(`WRITE_VLD11)`PR_ERROR("loadngo_mon", `ERROR, "write request on mcu1 from l2 bank3\n");
	 
//	 if(`READ_REQ20) `PR_ERROR("loadngo_mon", `ERROR, "read  request on mcu2 from l2 bank4\n");
	 if(`WRITE_VLD20)`PR_ERROR("loadngo_mon", `ERROR, "write request on mcu2 from l2 bank4\n");
//	 if(`READ_REQ21) `PR_ERROR("loadngo_mon", `ERROR, "read  request on mcu2 from l2 bank5\n");
	 if(`WRITE_VLD21)`PR_ERROR("loadngo_mon", `ERROR, "write request on mcu2 from l2 bank5\n");
	 
//	 if(`READ_REQ30) `PR_ERROR("loadngo_mon", `ERROR, "read  request on mcu3 from l2 bank6\n");
	 if(`WRITE_VLD30)`PR_ERROR("loadngo_mon", `ERROR, "write request on mcu3 from l2 bank6\n");
//	 if(`READ_REQ31) `PR_ERROR("loadngo_mon", `ERROR, "read  request on mcu3 from l2 bank7\n");
	 if(`WRITE_VLD31)`PR_ERROR("loadngo_mon", `ERROR, "write request on mcu3 from l2 bank7\n");
*/
      end      
   end
    
   initial begin     
      active        = 0;
      l2warm_enable = 0;
      l1warm_enable = 0;
      l1warm_start  = 0;
      l2_done       = 1;
      l2load_enable = 0;
      l2load        = 0;
      loadngo_enable= 0;
      loadngo_mon   = 0;
      
      if($value$plusargs("loadngo=%h", l2load_enable))$display("Info:L2_loadngo slam enable %x", l2load_enable);    
      if($value$plusargs("loadngo_mon=%h", loadngo_mon))$display("Info:l2_loadngo monitor enable %x", loadngo_mon);      
      if($value$plusargs("l2warm=%h", l2warm_enable))$display("Info:l2warm enable %x", l2warm_enable);
      if($value$plusargs("l1warm=%h", l1warm_enable))$display("Info:l1warm enable %x", l1warm_enable);
      
`ifdef CORE_0 active[0] = 1;`endif
`ifdef CORE_1 active[1] = 1;`endif     
`ifdef CORE_2 active[2] = 1;`endif
`ifdef CORE_3 active[3] = 1;`endif     
`ifdef CORE_4 active[4] = 1;`endif
`ifdef CORE_5 active[5] = 1;`endif     
`ifdef CORE_6 active[6] = 1;`endif
`ifdef CORE_7 active[7] = 1;`endif
      rdy = 1;
      @(negedge `L2TAG0.csr_l2_bypass_mode_on or
	negedge	`L2TAG1.csr_l2_bypass_mode_on or
	negedge	`L2TAG2.csr_l2_bypass_mode_on or
	negedge `L2TAG3.csr_l2_bypass_mode_on or
	negedge	`L2TAG4.csr_l2_bypass_mode_on or
	negedge	`L2TAG5.csr_l2_bypass_mode_on or
	negedge	`L2TAG6.csr_l2_bypass_mode_on or
	negedge	`L2TAG7.csr_l2_bypass_mode_on);
      repeat(1) @(posedge clk);
      if(`L2TAG0.tag.quad0.bank0.l2t_array.redundancy_en !== 0)rdy = 0;
      if(l2warm_enable || l2load_enable)$n2_check_event(1, active, "diag.ev", rdy);//read diag.ev
      if(l2load_enable)l2load = 1;
      l2warm = 1;
      if(loadngo_mon)loadngo_enable = 1;
   end
   
   //find event
   always @(posedge clk)begin
     if(l2warm_enable) 
       $n2_check_event(
		       2,
		       active,
		       l2warm,
		       `ifdef CORE_0 
		       `NAS_PATH.c0.t0.complete_fw2,
		       `NAS_PATH.c0.t0.pc_fw2,
		       `endif
		       `ifdef CORE_1 
		       `NAS_PATH.c1.t0.complete_fw2,
		       `NAS_PATH.c1.t0.pc_fw2,
		       `endif
		       `ifdef CORE_2 
		       `NAS_PATH.c2.t0.complete_fw2,
		       `NAS_PATH.c2.t0.pc_fw2,
		       `endif
		       `ifdef CORE_3 
		       `NAS_PATH.c3.t0.complete_fw2,
		       `NAS_PATH.c3.t0.pc_fw2,
		       `endif
		       `ifdef CORE_4 
		       `NAS_PATH.c4.t0.complete_fw2,
		       `NAS_PATH.c4.t0.pc_fw2,
		       `endif
		       `ifdef CORE_5 
		       `NAS_PATH.c5.t0.complete_fw2,
		       `NAS_PATH.c5.t0.pc_fw2,
		       `endif
		       `ifdef CORE_6 
		       `NAS_PATH.c6.t0.complete_fw2,
		       `NAS_PATH.c6.t0.pc_fw2,
		       `endif
		       `ifdef CORE_7 
		       `NAS_PATH.c7.t0.complete_fw2,
		       `NAS_PATH.c7.t0.pc_fw2,
		       `endif
		       );
      
   end
   
   //tag 16
   //vuad 8
   //data top_left (32+ 32)(to and bot):07_00 (32+ 32):70_01  (32+ 32):158_00  (32+ 32)158_01
   //
   always @(posedge clk)begin
      if(l2warm || l2load)begin
	 l2warm = 0;	 
	 if(l2_done && l2load == 0)begin
	    if(l2warm_enable)$display("Info(%0t): L2-warm start...", $time);
	    else $display("Info(%t): L2-warm not enabled", $time);
	    l2_done = 0;	    
	 end
	 if(l2load)$display("Info(%0t): L2-warm for loadngo start...", $time);
	 l2load = 0;
	 $n2_l2_warm(
//Bank 0 define
		  `L2TAG0.tag.quad0.bank0.l2t_array.mem_lft, //1 reg  [`L2T_ARR_D_WIDTH + 1:0] way0[`L2T_ARR_DEPTH - 1 :0];
		  `L2TAG0.tag.quad0.bank0.l2t_array.mem_rgt, //`define L2T_ARR_D_WIDTH  28 `define L2T_ARR_DEPTH   2

		  `L2TAG0.tag.quad0.bank1.l2t_array.mem_lft,
		  `L2TAG0.tag.quad0.bank1.l2t_array.mem_rgt,
		  
		  `L2TAG0.tag.quad1.bank0.l2t_array.mem_lft,
		  `L2TAG0.tag.quad1.bank0.l2t_array.mem_rgt,
		  
		  `L2TAG0.tag.quad1.bank1.l2t_array.mem_lft,
		  `L2TAG0.tag.quad1.bank1.l2t_array.mem_rgt,
		  
		  `L2TAG0.tag.quad2.bank0.l2t_array.mem_lft,
		  `L2TAG0.tag.quad2.bank0.l2t_array.mem_rgt,

		  `L2TAG0.tag.quad2.bank1.l2t_array.mem_lft,
		  `L2TAG0.tag.quad2.bank1.l2t_array.mem_rgt,
		  
		  `L2TAG0.tag.quad3.bank0.l2t_array.mem_lft,
		  `L2TAG0.tag.quad3.bank0.l2t_array.mem_rgt,
		  
		  `L2TAG0.tag.quad3.bank1.l2t_array.mem_lft,
		  `L2TAG0.tag.quad3.bank1.l2t_array.mem_rgt, //16
		  
		  `L2TAG0.subarray_0.array.inq_ary, // arg 17: reg [159:0]  inq_ary [31:0];
		  `L2TAG0.subarray_1.array.inq_ary,
		  `L2TAG0.subarray_2.array.inq_ary,
		  `L2TAG0.subarray_3.array.inq_ary,
		  `L2TAG0.subarray_8.array.inq_ary,
		  `L2TAG0.subarray_9.array.inq_ary,
		  `L2TAG0.subarray_10.array.inq_ary,
		  `L2TAG0.subarray_11.array.inq_ary, //24
		  
		  //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_lo0_way0, //arg 313
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_lo1_way0, //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_hi0_way0,
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT0.quad_top_left.way07_00.set_top.mem_lo0_way1,
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_hi0_way1,
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_lo1_way1,
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_lo1_way2,
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_lo0_way3,
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_hi0_way3,
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_lo1_way3,
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_lo1_way4,
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_lo0_way5,
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_hi0_way5,
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_lo1_way5,
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT0.quad_top_left.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_lo1_way6,
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT0.quad_top_left.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_lo0_way7,
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_hi0_way7,
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_lo1_way7,
		  `L2DAT0.quad_top_left.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_hi0_way0,
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_lo0_way1,
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_hi0_way1,
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_lo1_way1,
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_hi0_way2,
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_lo0_way3,
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_hi0_way3,
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_lo1_way3,
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_hi0_way4,
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_lo0_way5,
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_hi0_way5,
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_lo1_way5,
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_hi0_way6,
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT0.quad_top_left.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_lo0_way7,
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_hi0_way7,
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_lo1_way7,
		  `L2DAT0.quad_top_left.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT0.quad_top_left.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_hi0_way0,
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_lo0_way1,
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_hi0_way1,
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_lo1_way1,
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_hi0_way2,
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_hi1_way2,

		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_lo0_way3,
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_hi0_way3,
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_lo1_way3,
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_hi0_way4,
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_lo0_way5,
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_lo1_way5,
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_hi0_way6,
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT0.quad_top_left.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_lo0_way7,
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_lo1_way7,
		  `L2DAT0.quad_top_left.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_hi0_way0,
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_lo0_way1,
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_hi0_way1,
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_lo1_way1,
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_hi0_way2,
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_lo0_way3,
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_hi0_way3,
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_lo1_way3,
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_hi0_way4,
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_lo0_way5,
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_hi0_way5,
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_lo1_way5,
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_hi0_way6,
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT0.quad_top_left.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_lo0_way7,
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_hi0_way7,
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_lo1_way7,
		  `L2DAT0.quad_top_left.way158_01.set_top.mem_hi1_way7, //256
		  //right handside
		  //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_hi0_way0,
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT0.quad_top_right.way07_00.set_top.mem_lo0_way1,
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_hi0_way1,
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_lo1_way1,
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_lo1_way2,
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_lo0_way3,
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_hi0_way3,
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_lo1_way3,
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_lo1_way4,
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_lo0_way5,
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_hi0_way5,
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_lo1_way5,
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT0.quad_top_right.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_lo1_way6,
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT0.quad_top_right.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_lo0_way7,
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_hi0_way7,
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_lo1_way7,
		  `L2DAT0.quad_top_right.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_hi0_way0,
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_lo0_way1,
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_hi0_way1,
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_lo1_way1,
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_hi0_way2,
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_lo0_way3,
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_hi0_way3,
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_lo1_way3,
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_hi0_way4,
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_lo0_way5,
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_hi0_way5,
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_lo1_way5,
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_hi0_way6,
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT0.quad_top_right.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_lo0_way7,
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_hi0_way7,
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_lo1_way7,
		  `L2DAT0.quad_top_right.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT0.quad_top_right.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_hi0_way0,
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_lo0_way1,
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_hi0_way1,
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_lo1_way1,
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_hi0_way2,
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_hi1_way2,

		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_lo0_way3,
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_hi0_way3,
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_lo1_way3,
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_hi0_way4,
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_lo0_way5,
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_lo1_way5,
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_hi0_way6,
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT0.quad_top_right.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_lo0_way7,
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_lo1_way7,
		  `L2DAT0.quad_top_right.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_hi0_way0,
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_lo0_way1,
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_hi0_way1,
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_lo1_way1,
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_hi0_way2,
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_lo0_way3,
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_hi0_way3,
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_lo1_way3,
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_hi0_way4,
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_lo0_way5,
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_hi0_way5,
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_lo1_way5,
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_hi0_way6,
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT0.quad_top_right.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_lo0_way7,
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_hi0_way7,
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_lo1_way7,
		  `L2DAT0.quad_top_right.way158_01.set_top.mem_hi1_way7, //512
		  //bottom part
		    //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_hi0_way0,
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_lo0_way1,
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_hi0_way1,
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_lo1_way1,
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_lo1_way2,
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_lo0_way3,
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_hi0_way3,
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_lo1_way3,
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_lo1_way4,
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_lo0_way5,
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_hi0_way5,
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_lo1_way5,
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_lo1_way6,
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT0.quad_bot_left.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_lo0_way7,
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_hi0_way7,
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_lo1_way7,
		  `L2DAT0.quad_bot_left.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_hi0_way0,
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_lo0_way1,
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_hi0_way1,
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_lo1_way1,
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_hi0_way2,
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_lo0_way3,
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_hi0_way3,
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_lo1_way3,
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_hi0_way4,
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_lo0_way5,
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_hi0_way5,
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_lo1_way5,
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_hi0_way6,
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT0.quad_bot_left.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_lo0_way7,
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_hi0_way7,
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_lo1_way7,
		  `L2DAT0.quad_bot_left.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_hi0_way0,
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_lo0_way1,
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_hi0_way1,
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_lo1_way1,
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_hi0_way2,
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_hi1_way2,

		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_lo0_way3,
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_hi0_way3,
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_lo1_way3,
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_hi0_way4,
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_lo0_way5,
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_lo1_way5,
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_hi0_way6,
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT0.quad_bot_left.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_lo0_way7,
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_lo1_way7,
		  `L2DAT0.quad_bot_left.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_hi0_way0,
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_lo0_way1,
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_hi0_way1,
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_lo1_way1,
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_hi0_way2,
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_lo0_way3,
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_hi0_way3,
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_lo1_way3,
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_hi0_way4,
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_lo0_way5,
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_hi0_way5,
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_lo1_way5,
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_hi0_way6,
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT0.quad_bot_left.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_lo0_way7,
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_hi0_way7,
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_lo1_way7,
		  `L2DAT0.quad_bot_left.way158_01.set_top.mem_hi1_way7, //256
		  //right handside
		  //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_hi0_way0,
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_lo0_way1,
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_hi0_way1,
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_lo1_way1,
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_lo1_way2,
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_lo0_way3,
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_hi0_way3,
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_lo1_way3,
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_lo1_way4,
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_lo0_way5,
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_hi0_way5,
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_lo1_way5,
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_lo1_way6,
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT0.quad_bot_right.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_lo0_way7,
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_hi0_way7,
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_lo1_way7,
		  `L2DAT0.quad_bot_right.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_hi0_way0,
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_lo0_way1,
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_hi0_way1,
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_lo1_way1,
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_hi0_way2,
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_lo0_way3,
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_hi0_way3,
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_lo1_way3,
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_hi0_way4,
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_lo0_way5,
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_hi0_way5,
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_lo1_way5,
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_hi0_way6,
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT0.quad_bot_right.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_lo0_way7,
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_hi0_way7,
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_lo1_way7,
		  `L2DAT0.quad_bot_right.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_hi0_way0,
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_lo0_way1,
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_hi0_way1,
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_lo1_way1,
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_hi0_way2,
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_hi1_way2,

		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_lo0_way3,
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_hi0_way3,
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_lo1_way3,
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_hi0_way4,
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_lo0_way5,
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_lo1_way5,
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_hi0_way6,
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT0.quad_bot_right.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_lo0_way7,
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_lo1_way7,
		  `L2DAT0.quad_bot_right.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_hi0_way0,
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_lo0_way1,
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_hi0_way1,
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_lo1_way1,
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_hi0_way2,
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_lo0_way3,
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_hi0_way3,
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_lo1_way3,
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_hi0_way4,
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_lo0_way5,
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_hi0_way5,
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_lo1_way5,
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_hi0_way6,
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT0.quad_bot_right.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_lo0_way7,
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_hi0_way7,
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_lo1_way7,
		  `L2DAT0.quad_bot_right.way158_01.set_top.mem_hi1_way7, //512
//Bank 1 define
		  `L2TAG1.tag.quad0.bank0.l2t_array.mem_lft, //1 reg  [`L2T_ARR_D_WIDTH + 1:0] way0[`L2T_ARR_DEPTH - 1 :0];
		  `L2TAG1.tag.quad0.bank0.l2t_array.mem_rgt, //`define L2T_ARR_D_WIDTH  28 `define L2T_ARR_DEPTH   2

		  `L2TAG1.tag.quad0.bank1.l2t_array.mem_lft,
		  `L2TAG1.tag.quad0.bank1.l2t_array.mem_rgt,
		  
		  `L2TAG1.tag.quad1.bank0.l2t_array.mem_lft,
		  `L2TAG1.tag.quad1.bank0.l2t_array.mem_rgt,
		  
		  `L2TAG1.tag.quad1.bank1.l2t_array.mem_lft,
		  `L2TAG1.tag.quad1.bank1.l2t_array.mem_rgt,
		  
		  `L2TAG1.tag.quad2.bank0.l2t_array.mem_lft,
		  `L2TAG1.tag.quad2.bank0.l2t_array.mem_rgt,

		  `L2TAG1.tag.quad2.bank1.l2t_array.mem_lft,
		  `L2TAG1.tag.quad2.bank1.l2t_array.mem_rgt,
		  
		  `L2TAG1.tag.quad3.bank0.l2t_array.mem_lft,
		  `L2TAG1.tag.quad3.bank0.l2t_array.mem_rgt,
		  
		  `L2TAG1.tag.quad3.bank1.l2t_array.mem_lft,
		  `L2TAG1.tag.quad3.bank1.l2t_array.mem_rgt, //16
		  
		  `L2TAG1.subarray_0.array.inq_ary, // arg 17: reg [159:0]  inq_ary [31:0];
		  `L2TAG1.subarray_1.array.inq_ary,
		  `L2TAG1.subarray_2.array.inq_ary,
		  `L2TAG1.subarray_3.array.inq_ary,
		  `L2TAG1.subarray_8.array.inq_ary,
		  `L2TAG1.subarray_9.array.inq_ary,
		  `L2TAG1.subarray_10.array.inq_ary,
		  `L2TAG1.subarray_11.array.inq_ary, //24
		  
		  //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_hi0_way0,
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT1.quad_top_left.way07_00.set_top.mem_lo0_way1,
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_hi0_way1,
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_lo1_way1,
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_lo1_way2,
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_lo0_way3,
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_hi0_way3,
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_lo1_way3,
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_lo1_way4,
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_lo0_way5,
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_hi0_way5,
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_lo1_way5,
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT1.quad_top_left.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_lo1_way6,
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT1.quad_top_left.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_lo0_way7,
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_hi0_way7,
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_lo1_way7,
		  `L2DAT1.quad_top_left.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_hi0_way0,
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_lo0_way1,
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_hi0_way1,
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_lo1_way1,
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_hi0_way2,
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_lo0_way3,
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_hi0_way3,
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_lo1_way3,
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_hi0_way4,
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_lo0_way5,
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_hi0_way5,
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_lo1_way5,
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_hi0_way6,
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT1.quad_top_left.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_lo0_way7,
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_hi0_way7,
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_lo1_way7,
		  `L2DAT1.quad_top_left.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT1.quad_top_left.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_hi0_way0,
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_lo0_way1,
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_hi0_way1,
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_lo1_way1,
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_hi0_way2,
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_hi1_way2,

		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_lo0_way3,
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_hi0_way3,
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_lo1_way3,
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_hi0_way4,
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_lo0_way5,
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_lo1_way5,
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_hi0_way6,
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT1.quad_top_left.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_lo0_way7,
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_lo1_way7,
		  `L2DAT1.quad_top_left.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_hi0_way0,
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_lo0_way1,
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_hi0_way1,
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_lo1_way1,
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_hi0_way2,
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_lo0_way3,
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_hi0_way3,
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_lo1_way3,
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_hi0_way4,
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_lo0_way5,
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_hi0_way5,
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_lo1_way5,
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_hi0_way6,
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT1.quad_top_left.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_lo0_way7,
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_hi0_way7,
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_lo1_way7,
		  `L2DAT1.quad_top_left.way158_01.set_top.mem_hi1_way7, //256
		  //right handside
		  //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_hi0_way0,
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT1.quad_top_right.way07_00.set_top.mem_lo0_way1,
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_hi0_way1,
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_lo1_way1,
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_lo1_way2,
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_lo0_way3,
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_hi0_way3,
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_lo1_way3,
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_lo1_way4,
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_lo0_way5,
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_hi0_way5,
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_lo1_way5,
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT1.quad_top_right.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_lo1_way6,
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT1.quad_top_right.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_lo0_way7,
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_hi0_way7,
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_lo1_way7,
		  `L2DAT1.quad_top_right.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_hi0_way0,
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_lo0_way1,
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_hi0_way1,
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_lo1_way1,
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_hi0_way2,
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_lo0_way3,
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_hi0_way3,
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_lo1_way3,
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_hi0_way4,
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_lo0_way5,
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_hi0_way5,
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_lo1_way5,
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_hi0_way6,
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT1.quad_top_right.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_lo0_way7,
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_hi0_way7,
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_lo1_way7,
		  `L2DAT1.quad_top_right.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT1.quad_top_right.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_hi0_way0,
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_lo0_way1,
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_hi0_way1,
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_lo1_way1,
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_hi0_way2,
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_hi1_way2,

		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_lo0_way3,
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_hi0_way3,
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_lo1_way3,
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_hi0_way4,
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_lo0_way5,
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_lo1_way5,
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_hi0_way6,
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT1.quad_top_right.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_lo0_way7,
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_lo1_way7,
		  `L2DAT1.quad_top_right.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_hi0_way0,
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_lo0_way1,
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_hi0_way1,
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_lo1_way1,
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_hi0_way2,
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_lo0_way3,
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_hi0_way3,
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_lo1_way3,
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_hi0_way4,
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_lo0_way5,
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_hi0_way5,
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_lo1_way5,
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_hi0_way6,
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT1.quad_top_right.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_lo0_way7,
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_hi0_way7,
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_lo1_way7,
		  `L2DAT1.quad_top_right.way158_01.set_top.mem_hi1_way7, //512
		  //bottom part
		    //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_hi0_way0,
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_lo0_way1,
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_hi0_way1,
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_lo1_way1,
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_lo1_way2,
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_lo0_way3,
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_hi0_way3,
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_lo1_way3,
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_lo1_way4,
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_lo0_way5,
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_hi0_way5,
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_lo1_way5,
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_lo1_way6,
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT1.quad_bot_left.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_lo0_way7,
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_hi0_way7,
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_lo1_way7,
		  `L2DAT1.quad_bot_left.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_hi0_way0,
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_lo0_way1,
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_hi0_way1,
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_lo1_way1,
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_hi0_way2,
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_lo0_way3,
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_hi0_way3,
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_lo1_way3,
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_hi0_way4,
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_lo0_way5,
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_hi0_way5,
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_lo1_way5,
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_hi0_way6,
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT1.quad_bot_left.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_lo0_way7,
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_hi0_way7,
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_lo1_way7,
		  `L2DAT1.quad_bot_left.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_hi0_way0,
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_lo0_way1,
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_hi0_way1,
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_lo1_way1,
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_hi0_way2,
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_hi1_way2,

		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_lo0_way3,
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_hi0_way3,
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_lo1_way3,
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_hi0_way4,
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_lo0_way5,
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_lo1_way5,
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_hi0_way6,
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT1.quad_bot_left.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_lo0_way7,
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_lo1_way7,
		  `L2DAT1.quad_bot_left.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_hi0_way0,
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_lo0_way1,
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_hi0_way1,
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_lo1_way1,
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_hi0_way2,
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_lo0_way3,
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_hi0_way3,
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_lo1_way3,
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_hi0_way4,
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_lo0_way5,
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_hi0_way5,
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_lo1_way5,
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_hi0_way6,
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT1.quad_bot_left.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_lo0_way7,
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_hi0_way7,
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_lo1_way7,
		  `L2DAT1.quad_bot_left.way158_01.set_top.mem_hi1_way7, //256
		  //right handside
		  //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_hi0_way0,
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_lo0_way1,
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_hi0_way1,
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_lo1_way1,
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_lo1_way2,
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_lo0_way3,
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_hi0_way3,
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_lo1_way3,
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_lo1_way4,
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_lo0_way5,
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_hi0_way5,
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_lo1_way5,
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_lo1_way6,
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT1.quad_bot_right.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_lo0_way7,
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_hi0_way7,
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_lo1_way7,
		  `L2DAT1.quad_bot_right.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_hi0_way0,
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_lo0_way1,
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_hi0_way1,
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_lo1_way1,
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_hi0_way2,
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_lo0_way3,
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_hi0_way3,
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_lo1_way3,
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_hi0_way4,
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_lo0_way5,
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_hi0_way5,
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_lo1_way5,
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_hi0_way6,
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT1.quad_bot_right.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_lo0_way7,
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_hi0_way7,
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_lo1_way7,
		  `L2DAT1.quad_bot_right.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_hi0_way0,
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_lo0_way1,
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_hi0_way1,
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_lo1_way1,
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_hi0_way2,
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_hi1_way2,

		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_lo0_way3,
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_hi0_way3,
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_lo1_way3,
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_hi0_way4,
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_lo0_way5,
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_lo1_way5,
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_hi0_way6,
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT1.quad_bot_right.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_lo0_way7,
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_lo1_way7,
		  `L2DAT1.quad_bot_right.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_hi0_way0,
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_lo0_way1,
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_hi0_way1,
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_lo1_way1,
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_hi0_way2,
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_lo0_way3,
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_hi0_way3,
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_lo1_way3,
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_hi0_way4,
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_lo0_way5,
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_hi0_way5,
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_lo1_way5,
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_hi0_way6,
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT1.quad_bot_right.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_lo0_way7,
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_hi0_way7,
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_lo1_way7,
		  `L2DAT1.quad_bot_right.way158_01.set_top.mem_hi1_way7, //512
//Bank 2 define
		  `L2TAG2.tag.quad0.bank0.l2t_array.mem_lft, //1 reg  [`L2T_ARR_D_WIDTH + 1:0] way0[`L2T_ARR_DEPTH - 1 :0];
		  `L2TAG2.tag.quad0.bank0.l2t_array.mem_rgt, //`define L2T_ARR_D_WIDTH  28 `define L2T_ARR_DEPTH   2

		  `L2TAG2.tag.quad0.bank1.l2t_array.mem_lft,
		  `L2TAG2.tag.quad0.bank1.l2t_array.mem_rgt,
		  
		  `L2TAG2.tag.quad1.bank0.l2t_array.mem_lft,
		  `L2TAG2.tag.quad1.bank0.l2t_array.mem_rgt,
		  
		  `L2TAG2.tag.quad1.bank1.l2t_array.mem_lft,
		  `L2TAG2.tag.quad1.bank1.l2t_array.mem_rgt,
		  
		  `L2TAG2.tag.quad2.bank0.l2t_array.mem_lft,
		  `L2TAG2.tag.quad2.bank0.l2t_array.mem_rgt,

		  `L2TAG2.tag.quad2.bank1.l2t_array.mem_lft,
		  `L2TAG2.tag.quad2.bank1.l2t_array.mem_rgt,
		  
		  `L2TAG2.tag.quad3.bank0.l2t_array.mem_lft,
		  `L2TAG2.tag.quad3.bank0.l2t_array.mem_rgt,
		  
		  `L2TAG2.tag.quad3.bank1.l2t_array.mem_lft,
		  `L2TAG2.tag.quad3.bank1.l2t_array.mem_rgt, //16
		  
		  `L2TAG2.subarray_0.array.inq_ary, // arg 17: reg [159:0]  inq_ary [31:0];
		  `L2TAG2.subarray_1.array.inq_ary,
		  `L2TAG2.subarray_2.array.inq_ary,
		  `L2TAG2.subarray_3.array.inq_ary,
		  `L2TAG2.subarray_8.array.inq_ary,
		  `L2TAG2.subarray_9.array.inq_ary,
		  `L2TAG2.subarray_10.array.inq_ary,
		  `L2TAG2.subarray_11.array.inq_ary, //24
		  
		  //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_hi0_way0,
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT2.quad_top_left.way07_00.set_top.mem_lo0_way1,
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_hi0_way1,
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_lo1_way1,
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_lo1_way2,
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_lo0_way3,
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_hi0_way3,
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_lo1_way3,
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_lo1_way4,
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_lo0_way5,
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_hi0_way5,
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_lo1_way5,
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT2.quad_top_left.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_lo1_way6,
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT2.quad_top_left.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_lo0_way7,
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_hi0_way7,
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_lo1_way7,
		  `L2DAT2.quad_top_left.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_hi0_way0,
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_lo0_way1,
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_hi0_way1,
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_lo1_way1,
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_hi0_way2,
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_lo0_way3,
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_hi0_way3,
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_lo1_way3,
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_hi0_way4,
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_lo0_way5,
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_hi0_way5,
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_lo1_way5,
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_hi0_way6,
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT2.quad_top_left.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_lo0_way7,
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_hi0_way7,
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_lo1_way7,
		  `L2DAT2.quad_top_left.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT2.quad_top_left.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_hi0_way0,
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_lo0_way1,
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_hi0_way1,
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_lo1_way1,
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_hi0_way2,
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_hi1_way2,

		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_lo0_way3,
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_hi0_way3,
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_lo1_way3,
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_hi0_way4,
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_lo0_way5,
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_lo1_way5,
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_hi0_way6,
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT2.quad_top_left.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_lo0_way7,
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_lo1_way7,
		  `L2DAT2.quad_top_left.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_hi0_way0,
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_lo0_way1,
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_hi0_way1,
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_lo1_way1,
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_hi0_way2,
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_lo0_way3,
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_hi0_way3,
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_lo1_way3,
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_hi0_way4,
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_lo0_way5,
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_hi0_way5,
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_lo1_way5,
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_hi0_way6,
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT2.quad_top_left.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_lo0_way7,
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_hi0_way7,
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_lo1_way7,
		  `L2DAT2.quad_top_left.way158_01.set_top.mem_hi1_way7, //256
		  //right handside
		  //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_hi0_way0,
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT2.quad_top_right.way07_00.set_top.mem_lo0_way1,
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_hi0_way1,
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_lo1_way1,
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_lo1_way2,
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_lo0_way3,
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_hi0_way3,
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_lo1_way3,
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_lo1_way4,
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_lo0_way5,
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_hi0_way5,
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_lo1_way5,
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT2.quad_top_right.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_lo1_way6,
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT2.quad_top_right.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_lo0_way7,
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_hi0_way7,
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_lo1_way7,
		  `L2DAT2.quad_top_right.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_hi0_way0,
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_lo0_way1,
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_hi0_way1,
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_lo1_way1,
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_hi0_way2,
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_lo0_way3,
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_hi0_way3,
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_lo1_way3,
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_hi0_way4,
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_lo0_way5,
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_hi0_way5,
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_lo1_way5,
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_hi0_way6,
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT2.quad_top_right.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_lo0_way7,
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_hi0_way7,
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_lo1_way7,
		  `L2DAT2.quad_top_right.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT2.quad_top_right.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_hi0_way0,
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_lo0_way1,
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_hi0_way1,
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_lo1_way1,
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_hi0_way2,
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_hi1_way2,

		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_lo0_way3,
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_hi0_way3,
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_lo1_way3,
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_hi0_way4,
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_lo0_way5,
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_lo1_way5,
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_hi0_way6,
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT2.quad_top_right.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_lo0_way7,
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_lo1_way7,
		  `L2DAT2.quad_top_right.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_hi0_way0,
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_lo0_way1,
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_hi0_way1,
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_lo1_way1,
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_hi0_way2,
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_lo0_way3,
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_hi0_way3,
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_lo1_way3,
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_hi0_way4,
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_lo0_way5,
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_hi0_way5,
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_lo1_way5,
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_hi0_way6,
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT2.quad_top_right.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_lo0_way7,
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_hi0_way7,
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_lo1_way7,
		  `L2DAT2.quad_top_right.way158_01.set_top.mem_hi1_way7, //512
		  //bottom part
		    //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_hi0_way0,
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_lo0_way1,
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_hi0_way1,
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_lo1_way1,
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_lo1_way2,
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_lo0_way3,
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_hi0_way3,
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_lo1_way3,
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_lo1_way4,
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_lo0_way5,
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_hi0_way5,
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_lo1_way5,
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_lo1_way6,
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT2.quad_bot_left.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_lo0_way7,
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_hi0_way7,
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_lo1_way7,
		  `L2DAT2.quad_bot_left.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_hi0_way0,
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_lo0_way1,
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_hi0_way1,
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_lo1_way1,
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_hi0_way2,
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_lo0_way3,
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_hi0_way3,
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_lo1_way3,
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_hi0_way4,
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_lo0_way5,
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_hi0_way5,
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_lo1_way5,
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_hi0_way6,
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT2.quad_bot_left.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_lo0_way7,
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_hi0_way7,
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_lo1_way7,
		  `L2DAT2.quad_bot_left.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_hi0_way0,
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_lo0_way1,
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_hi0_way1,
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_lo1_way1,
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_hi0_way2,
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_hi1_way2,

		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_lo0_way3,
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_hi0_way3,
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_lo1_way3,
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_hi0_way4,
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_lo0_way5,
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_lo1_way5,
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_hi0_way6,
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT2.quad_bot_left.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_lo0_way7,
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_lo1_way7,
		  `L2DAT2.quad_bot_left.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_hi0_way0,
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_lo0_way1,
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_hi0_way1,
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_lo1_way1,
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_hi0_way2,
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_lo0_way3,
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_hi0_way3,
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_lo1_way3,
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_hi0_way4,
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_lo0_way5,
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_hi0_way5,
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_lo1_way5,
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_hi0_way6,
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT2.quad_bot_left.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_lo0_way7,
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_hi0_way7,
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_lo1_way7,
		  `L2DAT2.quad_bot_left.way158_01.set_top.mem_hi1_way7, //256
		  //right handside
		  //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_hi0_way0,
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_lo0_way1,
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_hi0_way1,
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_lo1_way1,
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_lo1_way2,
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_lo0_way3,
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_hi0_way3,
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_lo1_way3,
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_lo1_way4,
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_lo0_way5,
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_hi0_way5,
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_lo1_way5,
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_lo1_way6,
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT2.quad_bot_right.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_lo0_way7,
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_hi0_way7,
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_lo1_way7,
		  `L2DAT2.quad_bot_right.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_hi0_way0,
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_lo0_way1,
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_hi0_way1,
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_lo1_way1,
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_hi0_way2,
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_lo0_way3,
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_hi0_way3,
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_lo1_way3,
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_hi0_way4,
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_lo0_way5,
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_hi0_way5,
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_lo1_way5,
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_hi0_way6,
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT2.quad_bot_right.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_lo0_way7,
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_hi0_way7,
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_lo1_way7,
		  `L2DAT2.quad_bot_right.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_hi0_way0,
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_lo0_way1,
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_hi0_way1,
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_lo1_way1,
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_hi0_way2,
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_hi1_way2,

		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_lo0_way3,
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_hi0_way3,
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_lo1_way3,
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_hi0_way4,
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_lo0_way5,
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_lo1_way5,
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_hi0_way6,
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT2.quad_bot_right.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_lo0_way7,
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_lo1_way7,
		  `L2DAT2.quad_bot_right.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_hi0_way0,
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_lo0_way1,
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_hi0_way1,
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_lo1_way1,
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_hi0_way2,
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_lo0_way3,
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_hi0_way3,
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_lo1_way3,
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_hi0_way4,
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_lo0_way5,
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_hi0_way5,
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_lo1_way5,
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_hi0_way6,
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT2.quad_bot_right.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_lo0_way7,
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_hi0_way7,
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_lo1_way7,
		  `L2DAT2.quad_bot_right.way158_01.set_top.mem_hi1_way7, //512
//Bank 3 define
		  `L2TAG3.tag.quad0.bank0.l2t_array.mem_lft, //1 reg  [`L2T_ARR_D_WIDTH + 1:0] way0[`L2T_ARR_DEPTH - 1 :0];
		  `L2TAG3.tag.quad0.bank0.l2t_array.mem_rgt, //`define L2T_ARR_D_WIDTH  28 `define L2T_ARR_DEPTH   2

		  `L2TAG3.tag.quad0.bank1.l2t_array.mem_lft,
		  `L2TAG3.tag.quad0.bank1.l2t_array.mem_rgt,
		  
		  `L2TAG3.tag.quad1.bank0.l2t_array.mem_lft,
		  `L2TAG3.tag.quad1.bank0.l2t_array.mem_rgt,
		  
		  `L2TAG3.tag.quad1.bank1.l2t_array.mem_lft,
		  `L2TAG3.tag.quad1.bank1.l2t_array.mem_rgt,
		  
		  `L2TAG3.tag.quad2.bank0.l2t_array.mem_lft,
		  `L2TAG3.tag.quad2.bank0.l2t_array.mem_rgt,

		  `L2TAG3.tag.quad2.bank1.l2t_array.mem_lft,
		  `L2TAG3.tag.quad2.bank1.l2t_array.mem_rgt,
		  
		  `L2TAG3.tag.quad3.bank0.l2t_array.mem_lft,
		  `L2TAG3.tag.quad3.bank0.l2t_array.mem_rgt,
		  
		  `L2TAG3.tag.quad3.bank1.l2t_array.mem_lft,
		  `L2TAG3.tag.quad3.bank1.l2t_array.mem_rgt, //16
		  
		  `L2TAG3.subarray_0.array.inq_ary, // arg 17: reg [159:0]  inq_ary [31:0];
		  `L2TAG3.subarray_1.array.inq_ary,
		  `L2TAG3.subarray_2.array.inq_ary,
		  `L2TAG3.subarray_3.array.inq_ary,
		  `L2TAG3.subarray_8.array.inq_ary,
		  `L2TAG3.subarray_9.array.inq_ary,
		  `L2TAG3.subarray_10.array.inq_ary,
		  `L2TAG3.subarray_11.array.inq_ary, //24
		  
		  //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_hi0_way0,
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT3.quad_top_left.way07_00.set_top.mem_lo0_way1,
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_hi0_way1,
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_lo1_way1,
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_lo1_way2,
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_lo0_way3,
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_hi0_way3,
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_lo1_way3,
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_lo1_way4,
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_lo0_way5,
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_hi0_way5,
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_lo1_way5,
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT3.quad_top_left.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_lo1_way6,
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT3.quad_top_left.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_lo0_way7,
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_hi0_way7,
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_lo1_way7,
		  `L2DAT3.quad_top_left.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_hi0_way0,
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_lo0_way1,
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_hi0_way1,
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_lo1_way1,
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_hi0_way2,
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_lo0_way3,
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_hi0_way3,
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_lo1_way3,
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_hi0_way4,
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_lo0_way5,
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_hi0_way5,
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_lo1_way5,
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_hi0_way6,
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT3.quad_top_left.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_lo0_way7,
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_hi0_way7,
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_lo1_way7,
		  `L2DAT3.quad_top_left.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT3.quad_top_left.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_hi0_way0,
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_lo0_way1,
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_hi0_way1,
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_lo1_way1,
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_hi0_way2,
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_hi1_way2,

		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_lo0_way3,
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_hi0_way3,
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_lo1_way3,
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_hi0_way4,
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_lo0_way5,
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_lo1_way5,
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_hi0_way6,
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT3.quad_top_left.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_lo0_way7,
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_lo1_way7,
		  `L2DAT3.quad_top_left.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_hi0_way0,
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_lo0_way1,
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_hi0_way1,
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_lo1_way1,
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_hi0_way2,
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_lo0_way3,
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_hi0_way3,
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_lo1_way3,
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_hi0_way4,
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_lo0_way5,
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_hi0_way5,
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_lo1_way5,
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_hi0_way6,
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT3.quad_top_left.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_lo0_way7,
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_hi0_way7,
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_lo1_way7,
		  `L2DAT3.quad_top_left.way158_01.set_top.mem_hi1_way7, //256
		  //right handside
		  //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_hi0_way0,
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT3.quad_top_right.way07_00.set_top.mem_lo0_way1,
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_hi0_way1,
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_lo1_way1,
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_lo1_way2,
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_lo0_way3,
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_hi0_way3,
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_lo1_way3,
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_lo1_way4,
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_lo0_way5,
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_hi0_way5,
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_lo1_way5,
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT3.quad_top_right.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_lo1_way6,
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT3.quad_top_right.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_lo0_way7,
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_hi0_way7,
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_lo1_way7,
		  `L2DAT3.quad_top_right.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_hi0_way0,
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_lo0_way1,
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_hi0_way1,
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_lo1_way1,
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_hi0_way2,
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_lo0_way3,
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_hi0_way3,
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_lo1_way3,
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_hi0_way4,
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_lo0_way5,
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_hi0_way5,
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_lo1_way5,
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_hi0_way6,
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT3.quad_top_right.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_lo0_way7,
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_hi0_way7,
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_lo1_way7,
		  `L2DAT3.quad_top_right.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT3.quad_top_right.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_hi0_way0,
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_lo0_way1,
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_hi0_way1,
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_lo1_way1,
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_hi0_way2,
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_hi1_way2,

		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_lo0_way3,
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_hi0_way3,
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_lo1_way3,
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_hi0_way4,
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_lo0_way5,
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_lo1_way5,
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_hi0_way6,
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT3.quad_top_right.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_lo0_way7,
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_lo1_way7,
		  `L2DAT3.quad_top_right.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_hi0_way0,
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_lo0_way1,
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_hi0_way1,
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_lo1_way1,
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_hi0_way2,
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_lo0_way3,
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_hi0_way3,
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_lo1_way3,
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_hi0_way4,
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_lo0_way5,
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_hi0_way5,
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_lo1_way5,
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_hi0_way6,
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT3.quad_top_right.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_lo0_way7,
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_hi0_way7,
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_lo1_way7,
		  `L2DAT3.quad_top_right.way158_01.set_top.mem_hi1_way7, //512
		  //bottom part
		    //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_hi0_way0,
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_lo0_way1,
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_hi0_way1,
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_lo1_way1,
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_lo1_way2,
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_lo0_way3,
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_hi0_way3,
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_lo1_way3,
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_lo1_way4,
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_lo0_way5,
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_hi0_way5,
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_lo1_way5,
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_lo1_way6,
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT3.quad_bot_left.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_lo0_way7,
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_hi0_way7,
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_lo1_way7,
		  `L2DAT3.quad_bot_left.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_hi0_way0,
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_lo0_way1,
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_hi0_way1,
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_lo1_way1,
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_hi0_way2,
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_lo0_way3,
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_hi0_way3,
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_lo1_way3,
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_hi0_way4,
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_lo0_way5,
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_hi0_way5,
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_lo1_way5,
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_hi0_way6,
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT3.quad_bot_left.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_lo0_way7,
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_hi0_way7,
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_lo1_way7,
		  `L2DAT3.quad_bot_left.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_hi0_way0,
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_lo0_way1,
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_hi0_way1,
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_lo1_way1,
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_hi0_way2,
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_hi1_way2,

		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_lo0_way3,
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_hi0_way3,
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_lo1_way3,
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_hi0_way4,
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_lo0_way5,
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_lo1_way5,
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_hi0_way6,
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT3.quad_bot_left.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_lo0_way7,
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_lo1_way7,
		  `L2DAT3.quad_bot_left.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_hi0_way0,
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_lo0_way1,
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_hi0_way1,
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_lo1_way1,
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_hi0_way2,
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_lo0_way3,
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_hi0_way3,
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_lo1_way3,
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_hi0_way4,
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_lo0_way5,
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_hi0_way5,
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_lo1_way5,
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_hi0_way6,
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT3.quad_bot_left.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_lo0_way7,
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_hi0_way7,
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_lo1_way7,
		  `L2DAT3.quad_bot_left.way158_01.set_top.mem_hi1_way7, //256
		  //right handside
		  //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_hi0_way0,
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_lo0_way1,
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_hi0_way1,
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_lo1_way1,
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_lo1_way2,
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_lo0_way3,
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_hi0_way3,
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_lo1_way3,
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_lo1_way4,
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_lo0_way5,
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_hi0_way5,
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_lo1_way5,
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_lo1_way6,
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT3.quad_bot_right.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_lo0_way7,
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_hi0_way7,
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_lo1_way7,
		  `L2DAT3.quad_bot_right.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_hi0_way0,
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_lo0_way1,
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_hi0_way1,
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_lo1_way1,
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_hi0_way2,
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_lo0_way3,
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_hi0_way3,
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_lo1_way3,
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_hi0_way4,
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_lo0_way5,
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_hi0_way5,
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_lo1_way5,
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_hi0_way6,
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT3.quad_bot_right.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_lo0_way7,
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_hi0_way7,
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_lo1_way7,
		  `L2DAT3.quad_bot_right.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_hi0_way0,
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_lo0_way1,
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_hi0_way1,
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_lo1_way1,
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_hi0_way2,
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_hi1_way2,

		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_lo0_way3,
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_hi0_way3,
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_lo1_way3,
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_hi0_way4,
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_lo0_way5,
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_lo1_way5,
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_hi0_way6,
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT3.quad_bot_right.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_lo0_way7,
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_lo1_way7,
		  `L2DAT3.quad_bot_right.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_hi0_way0,
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_lo0_way1,
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_hi0_way1,
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_lo1_way1,
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_hi0_way2,
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_lo0_way3,
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_hi0_way3,
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_lo1_way3,
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_hi0_way4,
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_lo0_way5,
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_hi0_way5,
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_lo1_way5,
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_hi0_way6,
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT3.quad_bot_right.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_lo0_way7,
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_hi0_way7,
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_lo1_way7,
		  `L2DAT3.quad_bot_right.way158_01.set_top.mem_hi1_way7, //512
//Bank 4 define
		  `L2TAG4.tag.quad0.bank0.l2t_array.mem_lft, //1 reg  [`L2T_ARR_D_WIDTH + 1:0] way0[`L2T_ARR_DEPTH - 1 :0];
		  `L2TAG4.tag.quad0.bank0.l2t_array.mem_rgt, //`define L2T_ARR_D_WIDTH  28 `define L2T_ARR_DEPTH   2

		  `L2TAG4.tag.quad0.bank1.l2t_array.mem_lft,
		  `L2TAG4.tag.quad0.bank1.l2t_array.mem_rgt,
		  
		  `L2TAG4.tag.quad1.bank0.l2t_array.mem_lft,
		  `L2TAG4.tag.quad1.bank0.l2t_array.mem_rgt,
		  
		  `L2TAG4.tag.quad1.bank1.l2t_array.mem_lft,
		  `L2TAG4.tag.quad1.bank1.l2t_array.mem_rgt,
		  
		  `L2TAG4.tag.quad2.bank0.l2t_array.mem_lft,
		  `L2TAG4.tag.quad2.bank0.l2t_array.mem_rgt,

		  `L2TAG4.tag.quad2.bank1.l2t_array.mem_lft,
		  `L2TAG4.tag.quad2.bank1.l2t_array.mem_rgt,
		  
		  `L2TAG4.tag.quad3.bank0.l2t_array.mem_lft,
		  `L2TAG4.tag.quad3.bank0.l2t_array.mem_rgt,
		  
		  `L2TAG4.tag.quad3.bank1.l2t_array.mem_lft,
		  `L2TAG4.tag.quad3.bank1.l2t_array.mem_rgt, //16
		  
		  `L2TAG4.subarray_0.array.inq_ary, // arg 17: reg [159:0]  inq_ary [31:0];
		  `L2TAG4.subarray_1.array.inq_ary,
		  `L2TAG4.subarray_2.array.inq_ary,
		  `L2TAG4.subarray_3.array.inq_ary,
		  `L2TAG4.subarray_8.array.inq_ary,
		  `L2TAG4.subarray_9.array.inq_ary,
		  `L2TAG4.subarray_10.array.inq_ary,
		  `L2TAG4.subarray_11.array.inq_ary, //24
		  
		  //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_hi0_way0,
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT4.quad_top_left.way07_00.set_top.mem_lo0_way1,
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_hi0_way1,
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_lo1_way1,
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_lo1_way2,
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_lo0_way3,
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_hi0_way3,
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_lo1_way3,
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_lo1_way4,
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_lo0_way5,
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_hi0_way5,
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_lo1_way5,
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT4.quad_top_left.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_lo1_way6,
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT4.quad_top_left.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_lo0_way7,
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_hi0_way7,
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_lo1_way7,
		  `L2DAT4.quad_top_left.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_hi0_way0,
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_lo0_way1,
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_hi0_way1,
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_lo1_way1,
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_hi0_way2,
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_lo0_way3,
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_hi0_way3,
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_lo1_way3,
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_hi0_way4,
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_lo0_way5,
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_hi0_way5,
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_lo1_way5,
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_hi0_way6,
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT4.quad_top_left.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_lo0_way7,
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_hi0_way7,
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_lo1_way7,
		  `L2DAT4.quad_top_left.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT4.quad_top_left.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_hi0_way0,
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_lo0_way1,
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_hi0_way1,
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_lo1_way1,
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_hi0_way2,
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_hi1_way2,

		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_lo0_way3,
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_hi0_way3,
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_lo1_way3,
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_hi0_way4,
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_lo0_way5,
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_lo1_way5,
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_hi0_way6,
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT4.quad_top_left.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_lo0_way7,
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_lo1_way7,
		  `L2DAT4.quad_top_left.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_hi0_way0,
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_lo0_way1,
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_hi0_way1,
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_lo1_way1,
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_hi0_way2,
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_lo0_way3,
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_hi0_way3,
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_lo1_way3,
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_hi0_way4,
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_lo0_way5,
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_hi0_way5,
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_lo1_way5,
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_hi0_way6,
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT4.quad_top_left.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_lo0_way7,
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_hi0_way7,
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_lo1_way7,
		  `L2DAT4.quad_top_left.way158_01.set_top.mem_hi1_way7, //256
		  //right handside
		  //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_hi0_way0,
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT4.quad_top_right.way07_00.set_top.mem_lo0_way1,
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_hi0_way1,
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_lo1_way1,
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_lo1_way2,
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_lo0_way3,
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_hi0_way3,
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_lo1_way3,
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_lo1_way4,
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_lo0_way5,
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_hi0_way5,
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_lo1_way5,
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT4.quad_top_right.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_lo1_way6,
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT4.quad_top_right.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_lo0_way7,
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_hi0_way7,
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_lo1_way7,
		  `L2DAT4.quad_top_right.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_hi0_way0,
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_lo0_way1,
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_hi0_way1,
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_lo1_way1,
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_hi0_way2,
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_lo0_way3,
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_hi0_way3,
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_lo1_way3,
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_hi0_way4,
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_lo0_way5,
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_hi0_way5,
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_lo1_way5,
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_hi0_way6,
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT4.quad_top_right.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_lo0_way7,
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_hi0_way7,
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_lo1_way7,
		  `L2DAT4.quad_top_right.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT4.quad_top_right.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_hi0_way0,
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_lo0_way1,
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_hi0_way1,
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_lo1_way1,
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_hi0_way2,
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_hi1_way2,

		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_lo0_way3,
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_hi0_way3,
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_lo1_way3,
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_hi0_way4,
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_lo0_way5,
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_lo1_way5,
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_hi0_way6,
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT4.quad_top_right.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_lo0_way7,
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_lo1_way7,
		  `L2DAT4.quad_top_right.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_hi0_way0,
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_lo0_way1,
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_hi0_way1,
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_lo1_way1,
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_hi0_way2,
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_lo0_way3,
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_hi0_way3,
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_lo1_way3,
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_hi0_way4,
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_lo0_way5,
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_hi0_way5,
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_lo1_way5,
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_hi0_way6,
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT4.quad_top_right.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_lo0_way7,
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_hi0_way7,
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_lo1_way7,
		  `L2DAT4.quad_top_right.way158_01.set_top.mem_hi1_way7, //512
		  //bottom part
		    //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_hi0_way0,
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_lo0_way1,
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_hi0_way1,
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_lo1_way1,
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_lo1_way2,
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_lo0_way3,
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_hi0_way3,
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_lo1_way3,
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_lo1_way4,
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_lo0_way5,
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_hi0_way5,
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_lo1_way5,
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_lo1_way6,
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT4.quad_bot_left.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_lo0_way7,
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_hi0_way7,
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_lo1_way7,
		  `L2DAT4.quad_bot_left.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_hi0_way0,
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_lo0_way1,
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_hi0_way1,
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_lo1_way1,
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_hi0_way2,
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_lo0_way3,
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_hi0_way3,
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_lo1_way3,
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_hi0_way4,
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_lo0_way5,
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_hi0_way5,
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_lo1_way5,
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_hi0_way6,
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT4.quad_bot_left.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_lo0_way7,
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_hi0_way7,
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_lo1_way7,
		  `L2DAT4.quad_bot_left.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_hi0_way0,
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_lo0_way1,
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_hi0_way1,
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_lo1_way1,
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_hi0_way2,
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_hi1_way2,

		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_lo0_way3,
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_hi0_way3,
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_lo1_way3,
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_hi0_way4,
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_lo0_way5,
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_lo1_way5,
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_hi0_way6,
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT4.quad_bot_left.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_lo0_way7,
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_lo1_way7,
		  `L2DAT4.quad_bot_left.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_hi0_way0,
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_lo0_way1,
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_hi0_way1,
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_lo1_way1,
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_hi0_way2,
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_lo0_way3,
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_hi0_way3,
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_lo1_way3,
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_hi0_way4,
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_lo0_way5,
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_hi0_way5,
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_lo1_way5,
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_hi0_way6,
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT4.quad_bot_left.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_lo0_way7,
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_hi0_way7,
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_lo1_way7,
		  `L2DAT4.quad_bot_left.way158_01.set_top.mem_hi1_way7, //256
		  //right handside
		  //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_hi0_way0,
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_lo0_way1,
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_hi0_way1,
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_lo1_way1,
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_lo1_way2,
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_lo0_way3,
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_hi0_way3,
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_lo1_way3,
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_lo1_way4,
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_lo0_way5,
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_hi0_way5,
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_lo1_way5,
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_lo1_way6,
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT4.quad_bot_right.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_lo0_way7,
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_hi0_way7,
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_lo1_way7,
		  `L2DAT4.quad_bot_right.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_hi0_way0,
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_lo0_way1,
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_hi0_way1,
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_lo1_way1,
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_hi0_way2,
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_lo0_way3,
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_hi0_way3,
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_lo1_way3,
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_hi0_way4,
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_lo0_way5,
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_hi0_way5,
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_lo1_way5,
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_hi0_way6,
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT4.quad_bot_right.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_lo0_way7,
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_hi0_way7,
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_lo1_way7,
		  `L2DAT4.quad_bot_right.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_hi0_way0,
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_lo0_way1,
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_hi0_way1,
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_lo1_way1,
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_hi0_way2,
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_hi1_way2,

		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_lo0_way3,
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_hi0_way3,
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_lo1_way3,
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_hi0_way4,
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_lo0_way5,
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_lo1_way5,
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_hi0_way6,
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT4.quad_bot_right.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_lo0_way7,
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_lo1_way7,
		  `L2DAT4.quad_bot_right.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_hi0_way0,
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_lo0_way1,
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_hi0_way1,
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_lo1_way1,
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_hi0_way2,
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_lo0_way3,
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_hi0_way3,
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_lo1_way3,
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_hi0_way4,
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_lo0_way5,
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_hi0_way5,
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_lo1_way5,
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_hi0_way6,
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT4.quad_bot_right.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_lo0_way7,
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_hi0_way7,
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_lo1_way7,
		  `L2DAT4.quad_bot_right.way158_01.set_top.mem_hi1_way7, //512
//Bank 5 define
		  `L2TAG5.tag.quad0.bank0.l2t_array.mem_lft, //1 reg  [`L2T_ARR_D_WIDTH + 1:0] way0[`L2T_ARR_DEPTH - 1 :0];
		  `L2TAG5.tag.quad0.bank0.l2t_array.mem_rgt, //`define L2T_ARR_D_WIDTH  28 `define L2T_ARR_DEPTH   2

		  `L2TAG5.tag.quad0.bank1.l2t_array.mem_lft,
		  `L2TAG5.tag.quad0.bank1.l2t_array.mem_rgt,
		  
		  `L2TAG5.tag.quad1.bank0.l2t_array.mem_lft,
		  `L2TAG5.tag.quad1.bank0.l2t_array.mem_rgt,
		  
		  `L2TAG5.tag.quad1.bank1.l2t_array.mem_lft,
		  `L2TAG5.tag.quad1.bank1.l2t_array.mem_rgt,
		  
		  `L2TAG5.tag.quad2.bank0.l2t_array.mem_lft,
		  `L2TAG5.tag.quad2.bank0.l2t_array.mem_rgt,

		  `L2TAG5.tag.quad2.bank1.l2t_array.mem_lft,
		  `L2TAG5.tag.quad2.bank1.l2t_array.mem_rgt,
		  
		  `L2TAG5.tag.quad3.bank0.l2t_array.mem_lft,
		  `L2TAG5.tag.quad3.bank0.l2t_array.mem_rgt,
		  
		  `L2TAG5.tag.quad3.bank1.l2t_array.mem_lft,
		  `L2TAG5.tag.quad3.bank1.l2t_array.mem_rgt, //16
		  
		  `L2TAG5.subarray_0.array.inq_ary, // arg 17: reg [159:0]  inq_ary [31:0];
		  `L2TAG5.subarray_1.array.inq_ary,
		  `L2TAG5.subarray_2.array.inq_ary,
		  `L2TAG5.subarray_3.array.inq_ary,
		  `L2TAG5.subarray_8.array.inq_ary,
		  `L2TAG5.subarray_9.array.inq_ary,
		  `L2TAG5.subarray_10.array.inq_ary,
		  `L2TAG5.subarray_11.array.inq_ary, //24
		  
		  //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_hi0_way0,
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT5.quad_top_left.way07_00.set_top.mem_lo0_way1,
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_hi0_way1,
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_lo1_way1,
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_lo1_way2,
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_lo0_way3,
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_hi0_way3,
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_lo1_way3,
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_lo1_way4,
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_lo0_way5,
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_hi0_way5,
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_lo1_way5,
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT5.quad_top_left.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_lo1_way6,
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT5.quad_top_left.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_lo0_way7,
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_hi0_way7,
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_lo1_way7,
		  `L2DAT5.quad_top_left.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_hi0_way0,
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_lo0_way1,
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_hi0_way1,
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_lo1_way1,
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_hi0_way2,
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_lo0_way3,
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_hi0_way3,
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_lo1_way3,
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_hi0_way4,
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_lo0_way5,
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_hi0_way5,
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_lo1_way5,
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_hi0_way6,
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT5.quad_top_left.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_lo0_way7,
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_hi0_way7,
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_lo1_way7,
		  `L2DAT5.quad_top_left.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT5.quad_top_left.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_hi0_way0,
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_lo0_way1,
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_hi0_way1,
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_lo1_way1,
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_hi0_way2,
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_hi1_way2,

		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_lo0_way3,
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_hi0_way3,
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_lo1_way3,
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_hi0_way4,
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_lo0_way5,
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_lo1_way5,
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_hi0_way6,
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT5.quad_top_left.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_lo0_way7,
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_lo1_way7,
		  `L2DAT5.quad_top_left.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_hi0_way0,
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_lo0_way1,
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_hi0_way1,
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_lo1_way1,
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_hi0_way2,
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_lo0_way3,
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_hi0_way3,
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_lo1_way3,
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_hi0_way4,
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_lo0_way5,
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_hi0_way5,
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_lo1_way5,
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_hi0_way6,
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT5.quad_top_left.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_lo0_way7,
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_hi0_way7,
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_lo1_way7,
		  `L2DAT5.quad_top_left.way158_01.set_top.mem_hi1_way7, //256
		  //right handside
		  //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_hi0_way0,
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT5.quad_top_right.way07_00.set_top.mem_lo0_way1,
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_hi0_way1,
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_lo1_way1,
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_lo1_way2,
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_lo0_way3,
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_hi0_way3,
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_lo1_way3,
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_lo1_way4,
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_lo0_way5,
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_hi0_way5,
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_lo1_way5,
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT5.quad_top_right.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_lo1_way6,
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT5.quad_top_right.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_lo0_way7,
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_hi0_way7,
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_lo1_way7,
		  `L2DAT5.quad_top_right.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_hi0_way0,
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_lo0_way1,
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_hi0_way1,
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_lo1_way1,
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_hi0_way2,
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_lo0_way3,
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_hi0_way3,
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_lo1_way3,
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_hi0_way4,
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_lo0_way5,
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_hi0_way5,
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_lo1_way5,
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_hi0_way6,
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT5.quad_top_right.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_lo0_way7,
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_hi0_way7,
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_lo1_way7,
		  `L2DAT5.quad_top_right.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT5.quad_top_right.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_hi0_way0,
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_lo0_way1,
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_hi0_way1,
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_lo1_way1,
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_hi0_way2,
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_hi1_way2,

		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_lo0_way3,
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_hi0_way3,
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_lo1_way3,
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_hi0_way4,
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_lo0_way5,
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_lo1_way5,
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_hi0_way6,
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT5.quad_top_right.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_lo0_way7,
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_lo1_way7,
		  `L2DAT5.quad_top_right.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_hi0_way0,
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_lo0_way1,
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_hi0_way1,
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_lo1_way1,
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_hi0_way2,
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_lo0_way3,
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_hi0_way3,
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_lo1_way3,
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_hi0_way4,
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_lo0_way5,
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_hi0_way5,
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_lo1_way5,
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_hi0_way6,
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT5.quad_top_right.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_lo0_way7,
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_hi0_way7,
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_lo1_way7,
		  `L2DAT5.quad_top_right.way158_01.set_top.mem_hi1_way7, //512
		  //bottom part
		    //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_hi0_way0,
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_lo0_way1,
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_hi0_way1,
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_lo1_way1,
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_lo1_way2,
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_lo0_way3,
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_hi0_way3,
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_lo1_way3,
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_lo1_way4,
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_lo0_way5,
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_hi0_way5,
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_lo1_way5,
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_lo1_way6,
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT5.quad_bot_left.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_lo0_way7,
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_hi0_way7,
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_lo1_way7,
		  `L2DAT5.quad_bot_left.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_hi0_way0,
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_lo0_way1,
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_hi0_way1,
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_lo1_way1,
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_hi0_way2,
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_lo0_way3,
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_hi0_way3,
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_lo1_way3,
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_hi0_way4,
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_lo0_way5,
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_hi0_way5,
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_lo1_way5,
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_hi0_way6,
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT5.quad_bot_left.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_lo0_way7,
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_hi0_way7,
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_lo1_way7,
		  `L2DAT5.quad_bot_left.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_hi0_way0,
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_lo0_way1,
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_hi0_way1,
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_lo1_way1,
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_hi0_way2,
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_hi1_way2,

		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_lo0_way3,
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_hi0_way3,
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_lo1_way3,
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_hi0_way4,
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_lo0_way5,
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_lo1_way5,
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_hi0_way6,
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT5.quad_bot_left.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_lo0_way7,
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_lo1_way7,
		  `L2DAT5.quad_bot_left.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_hi0_way0,
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_lo0_way1,
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_hi0_way1,
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_lo1_way1,
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_hi0_way2,
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_lo0_way3,
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_hi0_way3,
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_lo1_way3,
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_hi0_way4,
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_lo0_way5,
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_hi0_way5,
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_lo1_way5,
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_hi0_way6,
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT5.quad_bot_left.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_lo0_way7,
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_hi0_way7,
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_lo1_way7,
		  `L2DAT5.quad_bot_left.way158_01.set_top.mem_hi1_way7, //256
		  //right handside
		  //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_hi0_way0,
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_lo0_way1,
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_hi0_way1,
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_lo1_way1,
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_lo1_way2,
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_lo0_way3,
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_hi0_way3,
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_lo1_way3,
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_lo1_way4,
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_lo0_way5,
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_hi0_way5,
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_lo1_way5,
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_lo1_way6,
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT5.quad_bot_right.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_lo0_way7,
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_hi0_way7,
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_lo1_way7,
		  `L2DAT5.quad_bot_right.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_hi0_way0,
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_lo0_way1,
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_hi0_way1,
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_lo1_way1,
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_hi0_way2,
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_lo0_way3,
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_hi0_way3,
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_lo1_way3,
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_hi0_way4,
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_lo0_way5,
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_hi0_way5,
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_lo1_way5,
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_hi0_way6,
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT5.quad_bot_right.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_lo0_way7,
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_hi0_way7,
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_lo1_way7,
		  `L2DAT5.quad_bot_right.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_hi0_way0,
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_lo0_way1,
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_hi0_way1,
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_lo1_way1,
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_hi0_way2,
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_hi1_way2,

		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_lo0_way3,
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_hi0_way3,
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_lo1_way3,
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_hi0_way4,
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_lo0_way5,
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_lo1_way5,
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_hi0_way6,
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT5.quad_bot_right.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_lo0_way7,
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_lo1_way7,
		  `L2DAT5.quad_bot_right.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_hi0_way0,
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_lo0_way1,
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_hi0_way1,
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_lo1_way1,
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_hi0_way2,
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_lo0_way3,
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_hi0_way3,
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_lo1_way3,
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_hi0_way4,
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_lo0_way5,
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_hi0_way5,
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_lo1_way5,
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_hi0_way6,
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT5.quad_bot_right.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_lo0_way7,
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_hi0_way7,
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_lo1_way7,
		  `L2DAT5.quad_bot_right.way158_01.set_top.mem_hi1_way7, //512
//Bank 6 define
		  `L2TAG6.tag.quad0.bank0.l2t_array.mem_lft, //1 reg  [`L2T_ARR_D_WIDTH + 1:0] way0[`L2T_ARR_DEPTH - 1 :0];
		  `L2TAG6.tag.quad0.bank0.l2t_array.mem_rgt, //`define L2T_ARR_D_WIDTH  28 `define L2T_ARR_DEPTH   2

		  `L2TAG6.tag.quad0.bank1.l2t_array.mem_lft,
		  `L2TAG6.tag.quad0.bank1.l2t_array.mem_rgt,
		  
		  `L2TAG6.tag.quad1.bank0.l2t_array.mem_lft,
		  `L2TAG6.tag.quad1.bank0.l2t_array.mem_rgt,
		  
		  `L2TAG6.tag.quad1.bank1.l2t_array.mem_lft,
		  `L2TAG6.tag.quad1.bank1.l2t_array.mem_rgt,
		  
		  `L2TAG6.tag.quad2.bank0.l2t_array.mem_lft,
		  `L2TAG6.tag.quad2.bank0.l2t_array.mem_rgt,

		  `L2TAG6.tag.quad2.bank1.l2t_array.mem_lft,
		  `L2TAG6.tag.quad2.bank1.l2t_array.mem_rgt,
		  
		  `L2TAG6.tag.quad3.bank0.l2t_array.mem_lft,
		  `L2TAG6.tag.quad3.bank0.l2t_array.mem_rgt,
		  
		  `L2TAG6.tag.quad3.bank1.l2t_array.mem_lft,
		  `L2TAG6.tag.quad3.bank1.l2t_array.mem_rgt, //16
		  
		  `L2TAG6.subarray_0.array.inq_ary, // arg 17: reg [159:0]  inq_ary [31:0];
		  `L2TAG6.subarray_1.array.inq_ary,
		  `L2TAG6.subarray_2.array.inq_ary,
		  `L2TAG6.subarray_3.array.inq_ary,
		  `L2TAG6.subarray_8.array.inq_ary,
		  `L2TAG6.subarray_9.array.inq_ary,
		  `L2TAG6.subarray_10.array.inq_ary,
		  `L2TAG6.subarray_11.array.inq_ary, //24
		  
		  //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_hi0_way0,
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT6.quad_top_left.way07_00.set_top.mem_lo0_way1,
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_hi0_way1,
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_lo1_way1,
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_lo1_way2,
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_lo0_way3,
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_hi0_way3,
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_lo1_way3,
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_lo1_way4,
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_lo0_way5,
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_hi0_way5,
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_lo1_way5,
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT6.quad_top_left.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_lo1_way6,
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT6.quad_top_left.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_lo0_way7,
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_hi0_way7,
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_lo1_way7,
		  `L2DAT6.quad_top_left.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_hi0_way0,
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_lo0_way1,
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_hi0_way1,
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_lo1_way1,
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_hi0_way2,
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_lo0_way3,
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_hi0_way3,
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_lo1_way3,
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_hi0_way4,
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_lo0_way5,
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_hi0_way5,
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_lo1_way5,
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_hi0_way6,
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT6.quad_top_left.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_lo0_way7,
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_hi0_way7,
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_lo1_way7,
		  `L2DAT6.quad_top_left.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT6.quad_top_left.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_hi0_way0,
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_lo0_way1,
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_hi0_way1,
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_lo1_way1,
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_hi0_way2,
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_hi1_way2,

		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_lo0_way3,
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_hi0_way3,
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_lo1_way3,
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_hi0_way4,
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_lo0_way5,
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_lo1_way5,
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_hi0_way6,
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT6.quad_top_left.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_lo0_way7,
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_lo1_way7,
		  `L2DAT6.quad_top_left.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_hi0_way0,
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_lo0_way1,
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_hi0_way1,
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_lo1_way1,
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_hi0_way2,
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_lo0_way3,
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_hi0_way3,
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_lo1_way3,
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_hi0_way4,
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_lo0_way5,
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_hi0_way5,
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_lo1_way5,
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_hi0_way6,
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT6.quad_top_left.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_lo0_way7,
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_hi0_way7,
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_lo1_way7,
		  `L2DAT6.quad_top_left.way158_01.set_top.mem_hi1_way7, //256
		  //right handside
		  //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_hi0_way0,
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT6.quad_top_right.way07_00.set_top.mem_lo0_way1,
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_hi0_way1,
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_lo1_way1,
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_lo1_way2,
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_lo0_way3,
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_hi0_way3,
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_lo1_way3,
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_lo1_way4,
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_lo0_way5,
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_hi0_way5,
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_lo1_way5,
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT6.quad_top_right.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_lo1_way6,
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT6.quad_top_right.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_lo0_way7,
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_hi0_way7,
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_lo1_way7,
		  `L2DAT6.quad_top_right.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_hi0_way0,
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_lo0_way1,
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_hi0_way1,
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_lo1_way1,
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_hi0_way2,
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_lo0_way3,
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_hi0_way3,
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_lo1_way3,
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_hi0_way4,
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_lo0_way5,
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_hi0_way5,
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_lo1_way5,
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_hi0_way6,
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT6.quad_top_right.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_lo0_way7,
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_hi0_way7,
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_lo1_way7,
		  `L2DAT6.quad_top_right.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT6.quad_top_right.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_hi0_way0,
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_lo0_way1,
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_hi0_way1,
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_lo1_way1,
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_hi0_way2,
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_hi1_way2,

		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_lo0_way3,
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_hi0_way3,
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_lo1_way3,
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_hi0_way4,
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_lo0_way5,
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_lo1_way5,
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_hi0_way6,
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT6.quad_top_right.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_lo0_way7,
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_lo1_way7,
		  `L2DAT6.quad_top_right.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_hi0_way0,
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_lo0_way1,
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_hi0_way1,
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_lo1_way1,
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_hi0_way2,
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_lo0_way3,
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_hi0_way3,
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_lo1_way3,
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_hi0_way4,
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_lo0_way5,
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_hi0_way5,
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_lo1_way5,
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_hi0_way6,
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT6.quad_top_right.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_lo0_way7,
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_hi0_way7,
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_lo1_way7,
		  `L2DAT6.quad_top_right.way158_01.set_top.mem_hi1_way7, //512
		  //bottom part
		    //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_hi0_way0,
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_lo0_way1,
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_hi0_way1,
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_lo1_way1,
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_lo1_way2,
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_lo0_way3,
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_hi0_way3,
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_lo1_way3,
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_lo1_way4,
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_lo0_way5,
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_hi0_way5,
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_lo1_way5,
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_lo1_way6,
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT6.quad_bot_left.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_lo0_way7,
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_hi0_way7,
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_lo1_way7,
		  `L2DAT6.quad_bot_left.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_hi0_way0,
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_lo0_way1,
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_hi0_way1,
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_lo1_way1,
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_hi0_way2,
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_lo0_way3,
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_hi0_way3,
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_lo1_way3,
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_hi0_way4,
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_lo0_way5,
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_hi0_way5,
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_lo1_way5,
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_hi0_way6,
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT6.quad_bot_left.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_lo0_way7,
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_hi0_way7,
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_lo1_way7,
		  `L2DAT6.quad_bot_left.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_hi0_way0,
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_lo0_way1,
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_hi0_way1,
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_lo1_way1,
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_hi0_way2,
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_hi1_way2,

		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_lo0_way3,
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_hi0_way3,
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_lo1_way3,
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_hi0_way4,
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_lo0_way5,
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_lo1_way5,
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_hi0_way6,
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT6.quad_bot_left.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_lo0_way7,
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_lo1_way7,
		  `L2DAT6.quad_bot_left.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_hi0_way0,
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_lo0_way1,
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_hi0_way1,
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_lo1_way1,
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_hi0_way2,
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_lo0_way3,
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_hi0_way3,
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_lo1_way3,
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_hi0_way4,
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_lo0_way5,
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_hi0_way5,
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_lo1_way5,
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_hi0_way6,
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT6.quad_bot_left.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_lo0_way7,
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_hi0_way7,
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_lo1_way7,
		  `L2DAT6.quad_bot_left.way158_01.set_top.mem_hi1_way7, //256
		  //right handside
		  //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_hi0_way0,
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_lo0_way1,
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_hi0_way1,
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_lo1_way1,
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_lo1_way2,
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_lo0_way3,
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_hi0_way3,
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_lo1_way3,
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_lo1_way4,
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_lo0_way5,
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_hi0_way5,
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_lo1_way5,
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_lo1_way6,
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT6.quad_bot_right.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_lo0_way7,
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_hi0_way7,
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_lo1_way7,
		  `L2DAT6.quad_bot_right.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_hi0_way0,
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_lo0_way1,
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_hi0_way1,
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_lo1_way1,
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_hi0_way2,
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_lo0_way3,
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_hi0_way3,
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_lo1_way3,
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_hi0_way4,
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_lo0_way5,
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_hi0_way5,
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_lo1_way5,
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_hi0_way6,
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT6.quad_bot_right.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_lo0_way7,
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_hi0_way7,
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_lo1_way7,
		  `L2DAT6.quad_bot_right.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_hi0_way0,
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_lo0_way1,
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_hi0_way1,
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_lo1_way1,
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_hi0_way2,
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_hi1_way2,

		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_lo0_way3,
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_hi0_way3,
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_lo1_way3,
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_hi0_way4,
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_lo0_way5,
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_lo1_way5,
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_hi0_way6,
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT6.quad_bot_right.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_lo0_way7,
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_lo1_way7,
		  `L2DAT6.quad_bot_right.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_hi0_way0,
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_lo0_way1,
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_hi0_way1,
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_lo1_way1,
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_hi0_way2,
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_lo0_way3,
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_hi0_way3,
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_lo1_way3,
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_hi0_way4,
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_lo0_way5,
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_hi0_way5,
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_lo1_way5,
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_hi0_way6,
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT6.quad_bot_right.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_lo0_way7,
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_hi0_way7,
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_lo1_way7,
		  `L2DAT6.quad_bot_right.way158_01.set_top.mem_hi1_way7, //512
//Bank 7 define
		  `L2TAG7.tag.quad0.bank0.l2t_array.mem_lft, //1 reg  [`L2T_ARR_D_WIDTH + 1:0] way0[`L2T_ARR_DEPTH - 1 :0];
		  `L2TAG7.tag.quad0.bank0.l2t_array.mem_rgt, //`define L2T_ARR_D_WIDTH  28 `define L2T_ARR_DEPTH   2

		  `L2TAG7.tag.quad0.bank1.l2t_array.mem_lft,
		  `L2TAG7.tag.quad0.bank1.l2t_array.mem_rgt,
		  
		  `L2TAG7.tag.quad1.bank0.l2t_array.mem_lft,
		  `L2TAG7.tag.quad1.bank0.l2t_array.mem_rgt,
		  
		  `L2TAG7.tag.quad1.bank1.l2t_array.mem_lft,
		  `L2TAG7.tag.quad1.bank1.l2t_array.mem_rgt,
		  
		  `L2TAG7.tag.quad2.bank0.l2t_array.mem_lft,
		  `L2TAG7.tag.quad2.bank0.l2t_array.mem_rgt,

		  `L2TAG7.tag.quad2.bank1.l2t_array.mem_lft,
		  `L2TAG7.tag.quad2.bank1.l2t_array.mem_rgt,
		  
		  `L2TAG7.tag.quad3.bank0.l2t_array.mem_lft,
		  `L2TAG7.tag.quad3.bank0.l2t_array.mem_rgt,
		  
		  `L2TAG7.tag.quad3.bank1.l2t_array.mem_lft,
		  `L2TAG7.tag.quad3.bank1.l2t_array.mem_rgt, //16
		  
		  `L2TAG7.subarray_0.array.inq_ary, // arg 17: reg [159:0]  inq_ary [31:0];
		  `L2TAG7.subarray_1.array.inq_ary,
		  `L2TAG7.subarray_2.array.inq_ary,
		  `L2TAG7.subarray_3.array.inq_ary,
		  `L2TAG7.subarray_8.array.inq_ary,
		  `L2TAG7.subarray_9.array.inq_ary,
		  `L2TAG7.subarray_10.array.inq_ary,
		  `L2TAG7.subarray_11.array.inq_ary, //24
		  
		  //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_hi0_way0,
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT7.quad_top_left.way07_00.set_top.mem_lo0_way1,
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_hi0_way1,
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_lo1_way1,
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_lo1_way2,
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_lo0_way3,
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_hi0_way3,
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_lo1_way3,
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_lo1_way4,
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_lo0_way5,
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_hi0_way5,
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_lo1_way5,
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT7.quad_top_left.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_lo1_way6,
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT7.quad_top_left.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_lo0_way7,
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_hi0_way7,
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_lo1_way7,
		  `L2DAT7.quad_top_left.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_hi0_way0,
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_lo0_way1,
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_hi0_way1,
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_lo1_way1,
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_hi0_way2,
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_lo0_way3,
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_hi0_way3,
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_lo1_way3,
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_hi0_way4,
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_lo0_way5,
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_hi0_way5,
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_lo1_way5,
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_hi0_way6,
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT7.quad_top_left.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_lo0_way7,
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_hi0_way7,
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_lo1_way7,
		  `L2DAT7.quad_top_left.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT7.quad_top_left.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_hi0_way0,
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_lo0_way1,
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_hi0_way1,
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_lo1_way1,
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_hi0_way2,
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_hi1_way2,

		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_lo0_way3,
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_hi0_way3,
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_lo1_way3,
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_hi0_way4,
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_lo0_way5,
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_lo1_way5,
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_hi0_way6,
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT7.quad_top_left.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_lo0_way7,
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_lo1_way7,
		  `L2DAT7.quad_top_left.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_hi0_way0,
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_lo0_way1,
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_hi0_way1,
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_lo1_way1,
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_hi0_way2,
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_lo0_way3,
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_hi0_way3,
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_lo1_way3,
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_hi0_way4,
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_lo0_way5,
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_hi0_way5,
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_lo1_way5,
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_hi0_way6,
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT7.quad_top_left.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_lo0_way7,
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_hi0_way7,
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_lo1_way7,
		  `L2DAT7.quad_top_left.way158_01.set_top.mem_hi1_way7, //256
		  //right handside
		  //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_hi0_way0,
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT7.quad_top_right.way07_00.set_top.mem_lo0_way1,
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_hi0_way1,
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_lo1_way1,
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_lo1_way2,
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_lo0_way3,
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_hi0_way3,
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_lo1_way3,
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_lo1_way4,
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_lo0_way5,
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_hi0_way5,
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_lo1_way5,
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT7.quad_top_right.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_lo1_way6,
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT7.quad_top_right.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_lo0_way7,
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_hi0_way7,
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_lo1_way7,
		  `L2DAT7.quad_top_right.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_hi0_way0,
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_lo0_way1,
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_hi0_way1,
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_lo1_way1,
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_hi0_way2,
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_lo0_way3,
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_hi0_way3,
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_lo1_way3,
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_hi0_way4,
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_lo0_way5,
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_hi0_way5,
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_lo1_way5,
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_hi0_way6,
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT7.quad_top_right.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_lo0_way7,
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_hi0_way7,
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_lo1_way7,
		  `L2DAT7.quad_top_right.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT7.quad_top_right.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_hi0_way0,
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_lo0_way1,
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_hi0_way1,
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_lo1_way1,
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_hi0_way2,
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_hi1_way2,

		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_lo0_way3,
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_hi0_way3,
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_lo1_way3,
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_hi0_way4,
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_lo0_way5,
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_lo1_way5,
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_hi0_way6,
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT7.quad_top_right.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_lo0_way7,
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_lo1_way7,
		  `L2DAT7.quad_top_right.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_hi0_way0,
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_lo0_way1,
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_hi0_way1,
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_lo1_way1,
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_hi0_way2,
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_lo0_way3,
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_hi0_way3,
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_lo1_way3,
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_hi0_way4,
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_lo0_way5,
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_hi0_way5,
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_lo1_way5,
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_hi0_way6,
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT7.quad_top_right.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_lo0_way7,
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_hi0_way7,
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_lo1_way7,
		  `L2DAT7.quad_top_right.way158_01.set_top.mem_hi1_way7, //512
		  //bottom part
		    //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_hi0_way0,
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_lo0_way1,
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_hi0_way1,
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_lo1_way1,
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_lo1_way2,
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_lo0_way3,
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_hi0_way3,
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_lo1_way3,
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_lo1_way4,
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_lo0_way5,
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_hi0_way5,
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_lo1_way5,
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_lo1_way6,
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT7.quad_bot_left.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_lo0_way7,
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_hi0_way7,
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_lo1_way7,
		  `L2DAT7.quad_bot_left.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_hi0_way0,
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_lo0_way1,
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_hi0_way1,
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_lo1_way1,
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_hi0_way2,
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_lo0_way3,
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_hi0_way3,
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_lo1_way3,
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_hi0_way4,
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_lo0_way5,
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_hi0_way5,
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_lo1_way5,
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_hi0_way6,
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT7.quad_bot_left.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_lo0_way7,
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_hi0_way7,
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_lo1_way7,
		  `L2DAT7.quad_bot_left.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_hi0_way0,
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_lo0_way1,
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_hi0_way1,
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_lo1_way1,
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_hi0_way2,
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_hi1_way2,

		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_lo0_way3,
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_hi0_way3,
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_lo1_way3,
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_hi0_way4,
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_lo0_way5,
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_lo1_way5,
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_hi0_way6,
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT7.quad_bot_left.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_lo0_way7,
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_lo1_way7,
		  `L2DAT7.quad_bot_left.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_hi0_way0,
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_lo0_way1,
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_hi0_way1,
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_lo1_way1,
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_hi0_way2,
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_lo0_way3,
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_hi0_way3,
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_lo1_way3,
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_hi0_way4,
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_lo0_way5,
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_hi0_way5,
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_lo1_way5,
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_hi0_way6,
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT7.quad_bot_left.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_lo0_way7,
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_hi0_way7,
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_lo1_way7,
		  `L2DAT7.quad_bot_left.way158_01.set_top.mem_hi1_way7, //256
		  //right handside
		  //bank 0 data
		  //way [7:0]
		  //[8] = 0 [255-0]
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_lo0_way0 , //arg 313
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_hi0_way0,
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_hi1_way0,
		  //index [511-256]
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_lo0_way0 , //arg 281
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_hi0_way0,
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_hi1_way0,
		  
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_lo0_way1,
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_hi0_way1,
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_lo1_way1,
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_hi1_way1,

		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_lo0_way1,
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_hi0_way1,
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_lo1_way1,
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_hi1_way1,
		  
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_hi0_way2,
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_hi1_way2,
		   
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_hi0_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_lo1_way2,
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_hi1_way2,
		  
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_lo0_way3,
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_hi0_way3,
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_lo1_way3,
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_hi1_way3,
		  
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_lo0_way3,
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_hi0_way3,
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_lo1_way3,
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_hi1_way3,
		  
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];	
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_hi0_way4,
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_hi1_way4,
		   
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_hi0_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_lo1_way4,
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_hi1_way4,
		  
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_lo0_way5,
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_hi0_way5,
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_lo1_way5,
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_lo0_way5,
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_hi0_way5,
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_lo1_way5,
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_hi1_way5,
		  
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_hi0_way6,
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_hi1_way6,

		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_hi0_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_lo1_way6,
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_hi1_way6,
		  
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_lo0_way7,
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_hi0_way7,
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_lo1_way7,
		  `L2DAT7.quad_bot_right.way07_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_lo0_way7,
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_hi0_way7,
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_lo1_way7,
		  `L2DAT7.quad_bot_right.way07_00.set_top.mem_hi1_way7, //toatl arg 64
		  
		  //way158_00 top way [15:8]
		  //index[255:0]
		  
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_lo0_way0 , //arg 441
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_hi0_way0,
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_hi1_way0,
		  //index[511:256]
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_lo0_way0 , //arg 409
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_hi0_way0,
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_hi1_way0,
		  
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_lo0_way1,
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_hi0_way1,
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_lo1_way1,
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_hi1_way1,
		  
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_lo0_way1,
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_hi0_way1,
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_lo1_way1,
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_hi1_way1,
		  
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_hi0_way2,
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_hi1_way2,
		    
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_hi0_way2,
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_hi1_way2,
		  
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_lo0_way3,
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_hi0_way3,
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_lo1_way3,
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_hi1_way3,
		  	
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_lo0_way3,
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_hi0_way3,
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_lo1_way3,
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_hi1_way3,
		  
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_hi0_way4,
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_hi1_way4,
		  
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_hi0_way4,
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_hi1_way4,
		  
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_lo0_way5,
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_hi0_way5,
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_lo1_way5,
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_hi1_way5,
		  
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_lo0_way5,
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_hi0_way5,
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_lo1_way5,
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_hi1_way5,
		  
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_hi0_way6,
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_hi1_way6,
		  	  
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_hi0_way6,
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_hi1_way6,
		  
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_lo0_way7,
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_hi0_way7,
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_lo1_way7,
		  `L2DAT7.quad_bot_right.way158_00.set_bot.mem_hi1_way7,
		  
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_lo0_way7,
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_hi0_way7,
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_lo1_way7,
		  `L2DAT7.quad_bot_right.way158_00.set_top.mem_hi1_way7, //128
		 
		  //way70_01 bottom
		  //bottom 
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_lo0_way0 , //[623:604]
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_hi0_way0,
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_hi1_way0,

		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_lo0_way0 , //arg 345
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_hi0_way0,
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_hi1_way0,
		  
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_lo0_way1,
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_hi0_way1,
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_lo1_way1,
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_hi1_way1,
		  
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_lo0_way1,
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_hi0_way1,
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_lo1_way1,
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_hi1_way1,
		    
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_hi0_way2,
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_hi0_way2,
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_hi1_way2,

		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_lo0_way3,
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_hi0_way3,
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_lo1_way3,
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_lo0_way3,
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_hi0_way3,
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_lo1_way3,
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_hi1_way3,
		  
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_hi0_way4,
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_hi1_way4,
		    
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_hi0_way4,
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_hi1_way4,
		  
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_lo0_way5,
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_hi0_way5,
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_lo1_way5,
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_hi1_way5,
		  	
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_lo0_way5,
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_hi0_way5 ,
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_lo1_way5,
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_hi1_way5,
		  
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_hi0_way6,
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_hi0_way6,
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_hi1_way6,
		  
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_lo0_way7,
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_hi0_way7 ,
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_lo1_way7,
		  `L2DAT7.quad_bot_right.way70_01.set_bot.mem_hi1_way7,
	
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_lo0_way7,
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_hi0_way7 ,
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_lo1_way7,
		  `L2DAT7.quad_bot_right.way70_01.set_top.mem_hi1_way7, //192
		  
		  //way [15:8]
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_lo0_way0 , //arg 505
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_hi0_way0,
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_hi1_way0,
		  	  //index [8]
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_lo0_way0 , //arg 473
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_hi0_way0,
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_lo1_way0 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_hi1_way0,
		  
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_lo0_way1,
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_hi0_way1,
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_lo1_way1,
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_hi1_way1,
		    
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_lo0_way1,
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_hi0_way1,
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_lo1_way1,
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_hi1_way1,
		  
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_hi0_way2,
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_hi1_way2,
		  
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_lo0_way2 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_hi0_way2,
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_lo1_way2 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_hi1_way2,
		  
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_lo0_way3,
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_hi0_way3,
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_lo1_way3,
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_hi1_way3,
		  
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_lo0_way3,
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_hi0_way3,
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_lo1_way3,
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_hi1_way3,
		    
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_hi0_way4,
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_hi1_way4,
		 
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_lo0_way4 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_hi0_way4,
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_lo1_way4 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_hi1_way4,
		  
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_lo0_way5,
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_hi0_way5,
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_lo1_way5,
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_hi1_way5,
		  	  
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_lo0_way5,
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_hi0_way5,
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_lo1_way5,
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_hi1_way5,
		  
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_hi0_way6,
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_hi1_way6,
		  
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_lo0_way6 , //[19:0] mem_lo0_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_hi0_way6,
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_lo1_way6 , //[18:0] mem_lo1_way0 [255:0];
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_hi1_way6,
		  
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_lo0_way7,
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_hi0_way7,
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_lo1_way7,
		  `L2DAT7.quad_bot_right.way158_01.set_bot.mem_hi1_way7,
		  
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_lo0_way7,
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_hi0_way7,
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_lo1_way7,
		  `L2DAT7.quad_bot_right.way158_01.set_top.mem_hi1_way7 //512
		  );
	 
	 l1warm_start = 1;
	 if(loadngo_mon)loadngo_enable = 1;
	 
      end
   end // always @ (posedge clk)
   
   reg [7:0] cpu_status;
   initial
     begin
	cpu_status = 0;
	`ifdef CORE_0 cpu_status[0] = 1;`endif
	`ifdef CORE_1 cpu_status[1] = 1;`endif
	`ifdef CORE_2 cpu_status[2] = 1;`endif
	`ifdef CORE_3 cpu_status[3] = 1;`endif
	`ifdef CORE_4 cpu_status[4] = 1;`endif
	`ifdef CORE_5 cpu_status[5] = 1;`endif
	`ifdef CORE_6 cpu_status[6] = 1;`endif
	`ifdef CORE_7 cpu_status[7] = 1;`endif
	
     end // initial begin
   always @(posedge clk) begin
      if(l1warm_enable && l1warm_start)begin
	 l1warm_start = 0;
	 
	 $n2_l1_warm(
		     //bank00
		     cpu_status,
		     `L2TAG0.dc_row0.panel0.array.addr_array,//reg	[12:0]	addr_array[63:0] dcache
		     `L2TAG0.dc_row0.panel0.array.valid,
		     `L2TAG0.dc_row0.panel0.array.parity,
		     `L2TAG0.dc_row0.panel0.array.addr_bit4,
	  
		     `L2TAG0.dc_row0.panel1.array.addr_array,
		     `L2TAG0.dc_row0.panel1.array.valid,
		     `L2TAG0.dc_row0.panel1.array.parity,
		     `L2TAG0.dc_row0.panel1.array.addr_bit4,
  
		     `L2TAG0.dc_row0.panel2.array.addr_array,
		     `L2TAG0.dc_row0.panel2.array.valid,
		     `L2TAG0.dc_row0.panel2.array.parity,
		     `L2TAG0.dc_row0.panel2.array.addr_bit4, 
  
		     `L2TAG0.dc_row0.panel3.array.addr_array,
		     `L2TAG0.dc_row0.panel3.array.valid,
		     `L2TAG0.dc_row0.panel3.array.parity,
		     `L2TAG0.dc_row0.panel3.array.addr_bit4,   
		     
		     `L2TAG0.dc_row2.panel0.array.addr_array,
		     `L2TAG0.dc_row2.panel0.array.valid,
		     `L2TAG0.dc_row2.panel0.array.parity,
		     `L2TAG0.dc_row2.panel0.array.addr_bit4,
		     
		     `L2TAG0.dc_row2.panel1.array.addr_array,
		     `L2TAG0.dc_row2.panel1.array.valid,
		     `L2TAG0.dc_row2.panel1.array.parity,
		     `L2TAG0.dc_row2.panel1.array.addr_bit4,
		     
		     `L2TAG0.dc_row2.panel2.array.addr_array,
		     `L2TAG0.dc_row2.panel2.array.valid,
		     `L2TAG0.dc_row2.panel2.array.parity,
		     `L2TAG0.dc_row2.panel2.array.addr_bit4,
		     
		     `L2TAG0.dc_row2.panel3.array.addr_array,
		     `L2TAG0.dc_row2.panel3.array.valid,
		     `L2TAG0.dc_row2.panel3.array.parity,
		     `L2TAG0.dc_row2.panel3.array.addr_bit4,
		     //icache
		     `L2TAG0.ic_row0.panel0.array.addr_array,//icache
		     `L2TAG0.ic_row0.panel0.array.valid,
		     `L2TAG0.ic_row0.panel0.array.parity,
		     `L2TAG0.ic_row0.panel0.array.addr_bit4,
 
		     `L2TAG0.ic_row0.panel1.array.addr_array,
		     `L2TAG0.ic_row0.panel1.array.valid,
		     `L2TAG0.ic_row0.panel1.array.parity,
		     `L2TAG0.ic_row0.panel1.array.addr_bit4,    
		     `L2TAG0.ic_row0.panel2.array.addr_array,
		     `L2TAG0.ic_row0.panel2.array.valid,
		     `L2TAG0.ic_row0.panel2.array.parity,
		     `L2TAG0.ic_row0.panel2.array.addr_bit4, 
		     `L2TAG0.ic_row0.panel3.array.addr_array,
		     `L2TAG0.ic_row0.panel3.array.valid,
		     `L2TAG0.ic_row0.panel3.array.parity,
		     `L2TAG0.ic_row0.panel3.array.addr_bit4,
		     
		     `L2TAG0.ic_row2.panel0.array.addr_array,
		     `L2TAG0.ic_row2.panel0.array.valid,
		     `L2TAG0.ic_row2.panel0.array.parity,
		     `L2TAG0.ic_row2.panel0.array.addr_bit4,  
		     `L2TAG0.ic_row2.panel1.array.addr_array,
		     `L2TAG0.ic_row2.panel1.array.valid,
		     `L2TAG0.ic_row2.panel1.array.parity,
		     `L2TAG0.ic_row2.panel1.array.addr_bit4,   
		     `L2TAG0.ic_row2.panel2.array.addr_array,
		     `L2TAG0.ic_row2.panel2.array.valid,
		     `L2TAG0.ic_row2.panel2.array.parity,
		     `L2TAG0.ic_row2.panel2.array.addr_bit4,   
		     `L2TAG0.ic_row2.panel3.array.addr_array,
		     `L2TAG0.ic_row2.panel3.array.valid,
		     `L2TAG0.ic_row2.panel3.array.parity,
		     `L2TAG0.ic_row2.panel3.array.addr_bit4,
     
		     //bank 01
		     `L2TAG1.dc_row0.panel0.array.addr_array,//reg	[12:0]	addr_array[63:0]
		     `L2TAG1.dc_row0.panel0.array.valid,
		     `L2TAG1.dc_row0.panel0.array.parity,
		     `L2TAG1.dc_row0.panel0.array.addr_bit4,
		     `L2TAG1.dc_row0.panel1.array.addr_array,
		     `L2TAG1.dc_row0.panel1.array.valid,
		     `L2TAG1.dc_row0.panel1.array.parity,
		     `L2TAG1.dc_row0.panel1.array.addr_bit4,  
		     `L2TAG1.dc_row0.panel2.array.addr_array,
		     `L2TAG1.dc_row0.panel2.array.valid,
		     `L2TAG1.dc_row0.panel2.array.parity,
		     `L2TAG1.dc_row0.panel2.array.addr_bit4,   
		     `L2TAG1.dc_row0.panel3.array.addr_array,
		     `L2TAG1.dc_row0.panel3.array.valid,
		     `L2TAG1.dc_row0.panel3.array.parity,
		     `L2TAG1.dc_row0.panel3.array.addr_bit4,   
		     
		     `L2TAG1.dc_row2.panel0.array.addr_array,
		     `L2TAG1.dc_row2.panel0.array.valid,
		     `L2TAG1.dc_row2.panel0.array.parity,
		     `L2TAG1.dc_row2.panel0.array.addr_bit4,
		     `L2TAG1.dc_row2.panel1.array.addr_array,
		     `L2TAG1.dc_row2.panel1.array.valid,
		     `L2TAG1.dc_row2.panel1.array.parity,
		     `L2TAG1.dc_row2.panel1.array.addr_bit4,
		     `L2TAG1.dc_row2.panel2.array.addr_array,
		     `L2TAG1.dc_row2.panel2.array.valid,
		     `L2TAG1.dc_row2.panel2.array.parity,
		     `L2TAG1.dc_row2.panel2.array.addr_bit4,
		     `L2TAG1.dc_row2.panel3.array.addr_array,
		     `L2TAG1.dc_row2.panel3.array.valid,
		     `L2TAG1.dc_row2.panel3.array.parity,
		     `L2TAG1.dc_row2.panel3.array.addr_bit4,
  
		     `L2TAG1.ic_row0.panel0.array.addr_array,
		     `L2TAG1.ic_row0.panel0.array.valid,
		     `L2TAG1.ic_row0.panel0.array.parity,
		     `L2TAG1.ic_row0.panel0.array.addr_bit4, 
		     `L2TAG1.ic_row0.panel1.array.addr_array,
		     `L2TAG1.ic_row0.panel1.array.valid,
		     `L2TAG1.ic_row0.panel1.array.parity,
		     `L2TAG1.ic_row0.panel1.array.addr_bit4,    
		     `L2TAG1.ic_row0.panel2.array.addr_array,
		     `L2TAG1.ic_row0.panel2.array.valid,
		     `L2TAG1.ic_row0.panel2.array.parity,
		     `L2TAG1.ic_row0.panel2.array.addr_bit4, 
		     `L2TAG1.ic_row0.panel3.array.addr_array,
		     `L2TAG1.ic_row0.panel3.array.valid,
		     `L2TAG1.ic_row0.panel3.array.parity,
		     `L2TAG1.ic_row0.panel3.array.addr_bit4,
  
		     `L2TAG1.ic_row2.panel0.array.addr_array,
		     `L2TAG1.ic_row2.panel0.array.valid,
		     `L2TAG1.ic_row2.panel0.array.parity,
		     `L2TAG1.ic_row2.panel0.array.addr_bit4,  
		     `L2TAG1.ic_row2.panel1.array.addr_array,
		     `L2TAG1.ic_row2.panel1.array.valid,
		     `L2TAG1.ic_row2.panel1.array.parity,
		     `L2TAG1.ic_row2.panel1.array.addr_bit4,   
		     `L2TAG1.ic_row2.panel2.array.addr_array,
		     `L2TAG1.ic_row2.panel2.array.valid,
		     `L2TAG1.ic_row2.panel2.array.parity,
		     `L2TAG1.ic_row2.panel2.array.addr_bit4,   
		     `L2TAG1.ic_row2.panel3.array.addr_array,
		     `L2TAG1.ic_row2.panel3.array.valid,
		     `L2TAG1.ic_row2.panel3.array.parity,
		     `L2TAG1.ic_row2.panel3.array.addr_bit4,       
		     //bank 02
		     `L2TAG2.dc_row0.panel0.array.addr_array,//reg	[12:0]	addr_array[63:0]
		     `L2TAG2.dc_row0.panel0.array.valid,
		     `L2TAG2.dc_row0.panel0.array.parity,
		     `L2TAG2.dc_row0.panel0.array.addr_bit4,
		     `L2TAG2.dc_row0.panel1.array.addr_array,
		     `L2TAG2.dc_row0.panel1.array.valid,
		     `L2TAG2.dc_row0.panel1.array.parity,
		     `L2TAG2.dc_row0.panel1.array.addr_bit4,  
		     `L2TAG2.dc_row0.panel2.array.addr_array,
		     `L2TAG2.dc_row0.panel2.array.valid,
		     `L2TAG2.dc_row0.panel2.array.parity,
		     `L2TAG2.dc_row0.panel2.array.addr_bit4,   
		     `L2TAG2.dc_row0.panel3.array.addr_array,
		     `L2TAG2.dc_row0.panel3.array.valid,
		     `L2TAG2.dc_row0.panel3.array.parity,
		     `L2TAG2.dc_row0.panel3.array.addr_bit4,   
		     
		     `L2TAG2.dc_row2.panel0.array.addr_array,
		     `L2TAG2.dc_row2.panel0.array.valid,
		     `L2TAG2.dc_row2.panel0.array.parity,
		     `L2TAG2.dc_row2.panel0.array.addr_bit4,
		     `L2TAG2.dc_row2.panel1.array.addr_array,
		     `L2TAG2.dc_row2.panel1.array.valid,
		     `L2TAG2.dc_row2.panel1.array.parity,
		     `L2TAG2.dc_row2.panel1.array.addr_bit4,
		     `L2TAG2.dc_row2.panel2.array.addr_array,
		     `L2TAG2.dc_row2.panel2.array.valid,
		     `L2TAG2.dc_row2.panel2.array.parity,
		     `L2TAG2.dc_row2.panel2.array.addr_bit4,
		     `L2TAG2.dc_row2.panel3.array.addr_array,
		     `L2TAG2.dc_row2.panel3.array.valid,
		     `L2TAG2.dc_row2.panel3.array.parity,
		     `L2TAG2.dc_row2.panel3.array.addr_bit4,
  
		     `L2TAG2.ic_row0.panel0.array.addr_array,
		     `L2TAG2.ic_row0.panel0.array.valid,
		     `L2TAG2.ic_row0.panel0.array.parity,
		     `L2TAG2.ic_row0.panel0.array.addr_bit4, 
		     `L2TAG2.ic_row0.panel1.array.addr_array,
		     `L2TAG2.ic_row0.panel1.array.valid,
		     `L2TAG2.ic_row0.panel1.array.parity,
		     `L2TAG2.ic_row0.panel1.array.addr_bit4,    
		     `L2TAG2.ic_row0.panel2.array.addr_array,
		     `L2TAG2.ic_row0.panel2.array.valid,
		     `L2TAG2.ic_row0.panel2.array.parity,
		     `L2TAG2.ic_row0.panel2.array.addr_bit4, 
		     `L2TAG2.ic_row0.panel3.array.addr_array,
		     `L2TAG2.ic_row0.panel3.array.valid,
		     `L2TAG2.ic_row0.panel3.array.parity,
		     `L2TAG2.ic_row0.panel3.array.addr_bit4,
  
		     `L2TAG2.ic_row2.panel0.array.addr_array,
		     `L2TAG2.ic_row2.panel0.array.valid,
		     `L2TAG2.ic_row2.panel0.array.parity,
		     `L2TAG2.ic_row2.panel0.array.addr_bit4,  
		     `L2TAG2.ic_row2.panel1.array.addr_array,
		     `L2TAG2.ic_row2.panel1.array.valid,
		     `L2TAG2.ic_row2.panel1.array.parity,
		     `L2TAG2.ic_row2.panel1.array.addr_bit4,   
		     `L2TAG2.ic_row2.panel2.array.addr_array,
		     `L2TAG2.ic_row2.panel2.array.valid,
		     `L2TAG2.ic_row2.panel2.array.parity,
		     `L2TAG2.ic_row2.panel2.array.addr_bit4,   
		     `L2TAG2.ic_row2.panel3.array.addr_array,
		     `L2TAG2.ic_row2.panel3.array.valid,
		     `L2TAG2.ic_row2.panel3.array.parity,
		     `L2TAG2.ic_row2.panel3.array.addr_bit4,  
		     //bank 03
		     `L2TAG3.dc_row0.panel0.array.addr_array,//reg	[12:0]	addr_array[63:0]
		     `L2TAG3.dc_row0.panel0.array.valid,
		     `L2TAG3.dc_row0.panel0.array.parity,
		     `L2TAG3.dc_row0.panel0.array.addr_bit4,
		     `L2TAG3.dc_row0.panel1.array.addr_array,
		     `L2TAG3.dc_row0.panel1.array.valid,
		     `L2TAG3.dc_row0.panel1.array.parity,
		     `L2TAG3.dc_row0.panel1.array.addr_bit4,  
		     `L2TAG3.dc_row0.panel2.array.addr_array,
		     `L2TAG3.dc_row0.panel2.array.valid,
		     `L2TAG3.dc_row0.panel2.array.parity,
		     `L2TAG3.dc_row0.panel2.array.addr_bit4,   
		     `L2TAG3.dc_row0.panel3.array.addr_array,
		     `L2TAG3.dc_row0.panel3.array.valid,
		     `L2TAG3.dc_row0.panel3.array.parity,
		     `L2TAG3.dc_row0.panel3.array.addr_bit4,   
		     
		     `L2TAG3.dc_row2.panel0.array.addr_array,
		     `L2TAG3.dc_row2.panel0.array.valid,
		     `L2TAG3.dc_row2.panel0.array.parity,
		     `L2TAG3.dc_row2.panel0.array.addr_bit4,
		     `L2TAG3.dc_row2.panel1.array.addr_array,
		     `L2TAG3.dc_row2.panel1.array.valid,
		     `L2TAG3.dc_row2.panel1.array.parity,
		     `L2TAG3.dc_row2.panel1.array.addr_bit4,
		     `L2TAG3.dc_row2.panel2.array.addr_array,
		     `L2TAG3.dc_row2.panel2.array.valid,
		     `L2TAG3.dc_row2.panel2.array.parity,
		     `L2TAG3.dc_row2.panel2.array.addr_bit4,
		     `L2TAG3.dc_row2.panel3.array.addr_array,
		     `L2TAG3.dc_row2.panel3.array.valid,
		     `L2TAG3.dc_row2.panel3.array.parity,
		     `L2TAG3.dc_row2.panel3.array.addr_bit4,
		     
		     `L2TAG3.ic_row0.panel0.array.addr_array,
		     `L2TAG3.ic_row0.panel0.array.valid,
		     `L2TAG3.ic_row0.panel0.array.parity,
		     `L2TAG3.ic_row0.panel0.array.addr_bit4, 
		     `L2TAG3.ic_row0.panel1.array.addr_array,
		     `L2TAG3.ic_row0.panel1.array.valid,
		     `L2TAG3.ic_row0.panel1.array.parity,
		     `L2TAG3.ic_row0.panel1.array.addr_bit4,    
		     `L2TAG3.ic_row0.panel2.array.addr_array,
		     `L2TAG3.ic_row0.panel2.array.valid,
		     `L2TAG3.ic_row0.panel2.array.parity,
		     `L2TAG3.ic_row0.panel2.array.addr_bit4, 
		     `L2TAG3.ic_row0.panel3.array.addr_array,
		     `L2TAG3.ic_row0.panel3.array.valid,
		     `L2TAG3.ic_row0.panel3.array.parity,
		     `L2TAG3.ic_row0.panel3.array.addr_bit4,
  
		     `L2TAG3.ic_row2.panel0.array.addr_array,
		     `L2TAG3.ic_row2.panel0.array.valid,
		     `L2TAG3.ic_row2.panel0.array.parity,
		     `L2TAG3.ic_row2.panel0.array.addr_bit4,  
		     `L2TAG3.ic_row2.panel1.array.addr_array,
		     `L2TAG3.ic_row2.panel1.array.valid,
		     `L2TAG3.ic_row2.panel1.array.parity,
		     `L2TAG3.ic_row2.panel1.array.addr_bit4,   
		     `L2TAG3.ic_row2.panel2.array.addr_array,
		     `L2TAG3.ic_row2.panel2.array.valid,
		     `L2TAG3.ic_row2.panel2.array.parity,
		     `L2TAG3.ic_row2.panel2.array.addr_bit4,   
		     `L2TAG3.ic_row2.panel3.array.addr_array,
		     `L2TAG3.ic_row2.panel3.array.valid,
		     `L2TAG3.ic_row2.panel3.array.parity,
		     `L2TAG3.ic_row2.panel3.array.addr_bit4,
		     //bank04
		     `L2TAG4.dc_row0.panel0.array.addr_array,//reg	[12:0]	addr_array[63:0]
		     `L2TAG4.dc_row0.panel0.array.valid,
		     `L2TAG4.dc_row0.panel0.array.parity,
		     `L2TAG4.dc_row0.panel0.array.addr_bit4,
		     `L2TAG4.dc_row0.panel1.array.addr_array,
		     `L2TAG4.dc_row0.panel1.array.valid,
		     `L2TAG4.dc_row0.panel1.array.parity,
		     `L2TAG4.dc_row0.panel1.array.addr_bit4,  
		     `L2TAG4.dc_row0.panel2.array.addr_array,
		     `L2TAG4.dc_row0.panel2.array.valid,
		     `L2TAG4.dc_row0.panel2.array.parity,
		     `L2TAG4.dc_row0.panel2.array.addr_bit4,   
		     `L2TAG4.dc_row0.panel3.array.addr_array,
		     `L2TAG4.dc_row0.panel3.array.valid,
		     `L2TAG4.dc_row0.panel3.array.parity,
		     `L2TAG4.dc_row0.panel3.array.addr_bit4,   
 
		     `L2TAG4.dc_row2.panel0.array.addr_array,
		     `L2TAG4.dc_row2.panel0.array.valid,
		     `L2TAG4.dc_row2.panel0.array.parity,
		     `L2TAG4.dc_row2.panel0.array.addr_bit4,
		     `L2TAG4.dc_row2.panel1.array.addr_array,
		     `L2TAG4.dc_row2.panel1.array.valid,
		     `L2TAG4.dc_row2.panel1.array.parity,
		     `L2TAG4.dc_row2.panel1.array.addr_bit4,
		     `L2TAG4.dc_row2.panel2.array.addr_array,
		     `L2TAG4.dc_row2.panel2.array.valid,
		     `L2TAG4.dc_row2.panel2.array.parity,
		     `L2TAG4.dc_row2.panel2.array.addr_bit4,
		     `L2TAG4.dc_row2.panel3.array.addr_array,
		     `L2TAG4.dc_row2.panel3.array.valid,
		     `L2TAG4.dc_row2.panel3.array.parity,
		     `L2TAG4.dc_row2.panel3.array.addr_bit4,
		     
		     `L2TAG4.ic_row0.panel0.array.addr_array,
		     `L2TAG4.ic_row0.panel0.array.valid,
		     `L2TAG4.ic_row0.panel0.array.parity,
		     `L2TAG4.ic_row0.panel0.array.addr_bit4, 
		     `L2TAG4.ic_row0.panel1.array.addr_array,
		     `L2TAG4.ic_row0.panel1.array.valid,
		     `L2TAG4.ic_row0.panel1.array.parity,
		     `L2TAG4.ic_row0.panel1.array.addr_bit4,    
		     `L2TAG4.ic_row0.panel2.array.addr_array,
		     `L2TAG4.ic_row0.panel2.array.valid,
		     `L2TAG4.ic_row0.panel2.array.parity,
		     `L2TAG4.ic_row0.panel2.array.addr_bit4, 
		     `L2TAG4.ic_row0.panel3.array.addr_array,
		     `L2TAG4.ic_row0.panel3.array.valid,
		     `L2TAG4.ic_row0.panel3.array.parity,
		     `L2TAG4.ic_row0.panel3.array.addr_bit4,
  
		     `L2TAG4.ic_row2.panel0.array.addr_array,
		     `L2TAG4.ic_row2.panel0.array.valid,
		     `L2TAG4.ic_row2.panel0.array.parity,
		     `L2TAG4.ic_row2.panel0.array.addr_bit4,  
		     `L2TAG4.ic_row2.panel1.array.addr_array,
		     `L2TAG4.ic_row2.panel1.array.valid,
		     `L2TAG4.ic_row2.panel1.array.parity,
		     `L2TAG4.ic_row2.panel1.array.addr_bit4,   
		     `L2TAG4.ic_row2.panel2.array.addr_array,
		     `L2TAG4.ic_row2.panel2.array.valid,
		     `L2TAG4.ic_row2.panel2.array.parity,
		     `L2TAG4.ic_row2.panel2.array.addr_bit4,   
		     `L2TAG4.ic_row2.panel3.array.addr_array,
		     `L2TAG4.ic_row2.panel3.array.valid,
		     `L2TAG4.ic_row2.panel3.array.parity,
		     `L2TAG4.ic_row2.panel3.array.addr_bit4,  
		     //bank 05
		     `L2TAG5.dc_row0.panel0.array.addr_array,//reg	[12:0]	addr_array[63:0]
		     `L2TAG5.dc_row0.panel0.array.valid,
		     `L2TAG5.dc_row0.panel0.array.parity,
		     `L2TAG5.dc_row0.panel0.array.addr_bit4,
		     `L2TAG5.dc_row0.panel1.array.addr_array,
		     `L2TAG5.dc_row0.panel1.array.valid,
		     `L2TAG5.dc_row0.panel1.array.parity,
		     `L2TAG5.dc_row0.panel1.array.addr_bit4,  
		     `L2TAG5.dc_row0.panel2.array.addr_array,
		     `L2TAG5.dc_row0.panel2.array.valid,
		     `L2TAG5.dc_row0.panel2.array.parity,
		     `L2TAG5.dc_row0.panel2.array.addr_bit4,   
		     `L2TAG5.dc_row0.panel3.array.addr_array,
		     `L2TAG5.dc_row0.panel3.array.valid,
		     `L2TAG5.dc_row0.panel3.array.parity,
		     `L2TAG5.dc_row0.panel3.array.addr_bit4,   
		     
		     `L2TAG5.dc_row2.panel0.array.addr_array,
		     `L2TAG5.dc_row2.panel0.array.valid,
		     `L2TAG5.dc_row2.panel0.array.parity,
		     `L2TAG5.dc_row2.panel0.array.addr_bit4,
		     `L2TAG5.dc_row2.panel1.array.addr_array,
		     `L2TAG5.dc_row2.panel1.array.valid,
		     `L2TAG5.dc_row2.panel1.array.parity,
		     `L2TAG5.dc_row2.panel1.array.addr_bit4,
		     `L2TAG5.dc_row2.panel2.array.addr_array,
		     `L2TAG5.dc_row2.panel2.array.valid,
		     `L2TAG5.dc_row2.panel2.array.parity,
		     `L2TAG5.dc_row2.panel2.array.addr_bit4,
		     `L2TAG5.dc_row2.panel3.array.addr_array,
		     `L2TAG5.dc_row2.panel3.array.valid,
		     `L2TAG5.dc_row2.panel3.array.parity,
		     `L2TAG5.dc_row2.panel3.array.addr_bit4,
		     
		     `L2TAG5.ic_row0.panel0.array.addr_array,
		     `L2TAG5.ic_row0.panel0.array.valid,
		     `L2TAG5.ic_row0.panel0.array.parity,
		     `L2TAG5.ic_row0.panel0.array.addr_bit4, 
		     `L2TAG5.ic_row0.panel1.array.addr_array,
		     `L2TAG5.ic_row0.panel1.array.valid,
		     `L2TAG5.ic_row0.panel1.array.parity,
		     `L2TAG5.ic_row0.panel1.array.addr_bit4,    
		     `L2TAG5.ic_row0.panel2.array.addr_array,
		     `L2TAG5.ic_row0.panel2.array.valid,
		     `L2TAG5.ic_row0.panel2.array.parity,
		     `L2TAG5.ic_row0.panel2.array.addr_bit4, 
		     `L2TAG5.ic_row0.panel3.array.addr_array,
		     `L2TAG5.ic_row0.panel3.array.valid,
		     `L2TAG5.ic_row0.panel3.array.parity,
		     `L2TAG5.ic_row0.panel3.array.addr_bit4,
		     
		     `L2TAG5.ic_row2.panel0.array.addr_array,
		     `L2TAG5.ic_row2.panel0.array.valid,
		     `L2TAG5.ic_row2.panel0.array.parity,
		     `L2TAG5.ic_row2.panel0.array.addr_bit4,  
		     `L2TAG5.ic_row2.panel1.array.addr_array,
		     `L2TAG5.ic_row2.panel1.array.valid,
		     `L2TAG5.ic_row2.panel1.array.parity,
		     `L2TAG5.ic_row2.panel1.array.addr_bit4,   
		     `L2TAG5.ic_row2.panel2.array.addr_array,
		     `L2TAG5.ic_row2.panel2.array.valid,
		     `L2TAG5.ic_row2.panel2.array.parity,
		     `L2TAG5.ic_row2.panel2.array.addr_bit4,   
		     `L2TAG5.ic_row2.panel3.array.addr_array,
		     `L2TAG5.ic_row2.panel3.array.valid,
		     `L2TAG5.ic_row2.panel3.array.parity,
		     `L2TAG5.ic_row2.panel3.array.addr_bit4, 
		     //bank 06
		     `L2TAG6.dc_row0.panel0.array.addr_array,//reg	[12:0]	addr_array[63:0]
		     `L2TAG6.dc_row0.panel0.array.valid,
		     `L2TAG6.dc_row0.panel0.array.parity,
		     `L2TAG6.dc_row0.panel0.array.addr_bit4,
		     `L2TAG6.dc_row0.panel1.array.addr_array,
		     `L2TAG6.dc_row0.panel1.array.valid,
		     `L2TAG6.dc_row0.panel1.array.parity,
		     `L2TAG6.dc_row0.panel1.array.addr_bit4,  
		     `L2TAG6.dc_row0.panel2.array.addr_array,
		     `L2TAG6.dc_row0.panel2.array.valid,
		     `L2TAG6.dc_row0.panel2.array.parity,
		     `L2TAG6.dc_row0.panel2.array.addr_bit4,   
		     `L2TAG6.dc_row0.panel3.array.addr_array,
		     `L2TAG6.dc_row0.panel3.array.valid,
		     `L2TAG6.dc_row0.panel3.array.parity,
		     `L2TAG6.dc_row0.panel3.array.addr_bit4,   
		     
		     `L2TAG6.dc_row2.panel0.array.addr_array,
		     `L2TAG6.dc_row2.panel0.array.valid,
		     `L2TAG6.dc_row2.panel0.array.parity,
		     `L2TAG6.dc_row2.panel0.array.addr_bit4,
		     `L2TAG6.dc_row2.panel1.array.addr_array,
		     `L2TAG6.dc_row2.panel1.array.valid,
		     `L2TAG6.dc_row2.panel1.array.parity,
		     `L2TAG6.dc_row2.panel1.array.addr_bit4,
		     `L2TAG6.dc_row2.panel2.array.addr_array,
		     `L2TAG6.dc_row2.panel2.array.valid,
		     `L2TAG6.dc_row2.panel2.array.parity,
		     `L2TAG6.dc_row2.panel2.array.addr_bit4,
		     `L2TAG6.dc_row2.panel3.array.addr_array,
		     `L2TAG6.dc_row2.panel3.array.valid,
		     `L2TAG6.dc_row2.panel3.array.parity,
		     `L2TAG6.dc_row2.panel3.array.addr_bit4,
		     
		     `L2TAG6.ic_row0.panel0.array.addr_array,
		     `L2TAG6.ic_row0.panel0.array.valid,
		     `L2TAG6.ic_row0.panel0.array.parity,
		     `L2TAG6.ic_row0.panel0.array.addr_bit4, 
		     `L2TAG6.ic_row0.panel1.array.addr_array,
		     `L2TAG6.ic_row0.panel1.array.valid,
		     `L2TAG6.ic_row0.panel1.array.parity,
		     `L2TAG6.ic_row0.panel1.array.addr_bit4,    
		     `L2TAG6.ic_row0.panel2.array.addr_array,
		     `L2TAG6.ic_row0.panel2.array.valid,
		     `L2TAG6.ic_row0.panel2.array.parity,
		     `L2TAG6.ic_row0.panel2.array.addr_bit4, 
		     `L2TAG6.ic_row0.panel3.array.addr_array,
		     `L2TAG6.ic_row0.panel3.array.valid,
		     `L2TAG6.ic_row0.panel3.array.parity,
		     `L2TAG6.ic_row0.panel3.array.addr_bit4,
		     
		     `L2TAG6.ic_row2.panel0.array.addr_array,
		     `L2TAG6.ic_row2.panel0.array.valid,
		     `L2TAG6.ic_row2.panel0.array.parity,
		     `L2TAG6.ic_row2.panel0.array.addr_bit4,  
		     `L2TAG6.ic_row2.panel1.array.addr_array,
		     `L2TAG6.ic_row2.panel1.array.valid,
		     `L2TAG6.ic_row2.panel1.array.parity,
		     `L2TAG6.ic_row2.panel1.array.addr_bit4,   
		     `L2TAG6.ic_row2.panel2.array.addr_array,
		     `L2TAG6.ic_row2.panel2.array.valid,
		     `L2TAG6.ic_row2.panel2.array.parity,
		     `L2TAG6.ic_row2.panel2.array.addr_bit4,   
		     `L2TAG6.ic_row2.panel3.array.addr_array,
		     `L2TAG6.ic_row2.panel3.array.valid,
		     `L2TAG6.ic_row2.panel3.array.parity,
		     `L2TAG6.ic_row2.panel3.array.addr_bit4,
		     //bank 07
		     `L2TAG7.dc_row0.panel0.array.addr_array,//reg	[12:0]	addr_array[63:0]
		     `L2TAG7.dc_row0.panel0.array.valid,
		     `L2TAG7.dc_row0.panel0.array.parity,
		     `L2TAG7.dc_row0.panel0.array.addr_bit4,
		     `L2TAG7.dc_row0.panel1.array.addr_array,
		     `L2TAG7.dc_row0.panel1.array.valid,
		     `L2TAG7.dc_row0.panel1.array.parity,
		     `L2TAG7.dc_row0.panel1.array.addr_bit4,  
		     `L2TAG7.dc_row0.panel2.array.addr_array,
		     `L2TAG7.dc_row0.panel2.array.valid,
		     `L2TAG7.dc_row0.panel2.array.parity,
		     `L2TAG7.dc_row0.panel2.array.addr_bit4,   
		     `L2TAG7.dc_row0.panel3.array.addr_array,
		     `L2TAG7.dc_row0.panel3.array.valid,
		     `L2TAG7.dc_row0.panel3.array.parity,
		     `L2TAG7.dc_row0.panel3.array.addr_bit4,   
		     
		     `L2TAG7.dc_row2.panel0.array.addr_array,
		     `L2TAG7.dc_row2.panel0.array.valid,
		     `L2TAG7.dc_row2.panel0.array.parity,
		     `L2TAG7.dc_row2.panel0.array.addr_bit4,
		     `L2TAG7.dc_row2.panel1.array.addr_array,
		     `L2TAG7.dc_row2.panel1.array.valid,
		     `L2TAG7.dc_row2.panel1.array.parity,
		     `L2TAG7.dc_row2.panel1.array.addr_bit4,
		     `L2TAG7.dc_row2.panel2.array.addr_array,
		     `L2TAG7.dc_row2.panel2.array.valid,
		     `L2TAG7.dc_row2.panel2.array.parity,
		     `L2TAG7.dc_row2.panel2.array.addr_bit4,
		     `L2TAG7.dc_row2.panel3.array.addr_array,
		     `L2TAG7.dc_row2.panel3.array.valid,
		     `L2TAG7.dc_row2.panel3.array.parity,
		     `L2TAG7.dc_row2.panel3.array.addr_bit4,
		     
		     `L2TAG7.ic_row0.panel0.array.addr_array,
		     `L2TAG7.ic_row0.panel0.array.valid,
		     `L2TAG7.ic_row0.panel0.array.parity,
		     `L2TAG7.ic_row0.panel0.array.addr_bit4, 
		     `L2TAG7.ic_row0.panel1.array.addr_array,
		     `L2TAG7.ic_row0.panel1.array.valid,
		     `L2TAG7.ic_row0.panel1.array.parity,
		     `L2TAG7.ic_row0.panel1.array.addr_bit4,    
		     `L2TAG7.ic_row0.panel2.array.addr_array,
		     `L2TAG7.ic_row0.panel2.array.valid,
		     `L2TAG7.ic_row0.panel2.array.parity,
		     `L2TAG7.ic_row0.panel2.array.addr_bit4, 
		     `L2TAG7.ic_row0.panel3.array.addr_array,
		     `L2TAG7.ic_row0.panel3.array.valid,
		     `L2TAG7.ic_row0.panel3.array.parity,
		     `L2TAG7.ic_row0.panel3.array.addr_bit4,
		     
		     `L2TAG7.ic_row2.panel0.array.addr_array,
		     `L2TAG7.ic_row2.panel0.array.valid,
		     `L2TAG7.ic_row2.panel0.array.parity,
		     `L2TAG7.ic_row2.panel0.array.addr_bit4,  
		     `L2TAG7.ic_row2.panel1.array.addr_array,
		     `L2TAG7.ic_row2.panel1.array.valid,
		     `L2TAG7.ic_row2.panel1.array.parity,
		     `L2TAG7.ic_row2.panel1.array.addr_bit4,   
		     `L2TAG7.ic_row2.panel2.array.addr_array,
		     `L2TAG7.ic_row2.panel2.array.valid,
		     `L2TAG7.ic_row2.panel2.array.parity,
		     `L2TAG7.ic_row2.panel2.array.addr_bit4,   
		     `L2TAG7.ic_row2.panel3.array.addr_array,
		     `L2TAG7.ic_row2.panel3.array.valid,
		     `L2TAG7.ic_row2.panel3.array.parity,
		     `L2TAG7.ic_row2.panel3.array.addr_bit4,     
		    /*
		     //sparc
		     `ifdef CORE_0
		     //data
		     `SPARC_CORE.cpu.spc0.dca.array.way01.left.mem,
		     `SPARC_CORE.cpu.spc0.dca.array.way01.right.mem,
		     `SPARC_CORE.cpu.spc0.dca.array.way23.left.mem,
		     `SPARC_CORE.cpu.spc0.dca.array.way23.right.mem,
		     //dcache tag
		     `SPARC_CORE.cpu.spc0.lsu.dta.way0.mem,//reg	[`WIDTH-1:0]	mem[`ENTRIES-1:0]; WIDTH 30  ENTRIES 128
		     `SPARC_CORE.cpu.spc0.lsu.dta.way1.mem,
		     `SPARC_CORE.cpu.spc0.lsu.dta.way2.mem,
		     `SPARC_CORE.cpu.spc0.lsu.dta.way3.mem,
		     //valid
		     `SPARC_CORE.cpu.spc0.lsu.dva.array.mem,//reg	[31:0] mem [31:0];

		      //icache data
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_0.w3_to_w0_bank.left_sb_array.mem,//reg     [143:0]   mem[63:0] ;
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_0.w3_to_w0_bank.right_sb_array.mem,//reg     [135:0]   mem[63:0] ;
		     
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_0.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_0.w7_to_w4_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_1.w3_to_w0_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_1.w3_to_w0_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_1.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_1.w7_to_w4_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_2.w3_to_w0_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_2.w3_to_w0_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_2.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_2.w7_to_w4_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_3.w3_to_w0_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_3.w3_to_w0_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_3.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_3.w7_to_w4_bank.right_sb_array.mem,
		     //icache tag
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_ict_cust.tag_way_0.mem,//reg	[`WIDTH-1:0]	mem[`ENTRIES-1:0];WIDTH 30 ENTRIES 64
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_ict_cust.tag_way_1.mem,
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_ict_cust.tag_way_2.mem,
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_ict_cust.tag_way_3.mem,
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_ict_cust.tag_way_4.mem,
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_ict_cust.tag_way_5.mem,
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_ict_cust.tag_way_6.mem,
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_ict_cust.tag_way_7.mem,
		     
		     `SPARC_CORE.cpu.spc0.ifu_ftu.ftu_icv_cust.array.mem,//reg	[31:0] mem [31:0];
		     `endif //  `ifdef CORE_0
		    //sparc
		     `ifdef CORE_1
		     //data
		     `SPARC_CORE.cpu.spc1.dca.array.way01.left.mem,
		     `SPARC_CORE.cpu.spc1.dca.array.way01.right.mem,
		     `SPARC_CORE.cpu.spc1.dca.array.way23.left.mem,
		     `SPARC_CORE.cpu.spc1.dca.array.way23.right.mem,
		     //dcache tag
		     `SPARC_CORE.cpu.spc1.lsu.dta.way0.mem,//reg	[`WIDTH-1:0]	mem[`ENTRIES-1:0]; WIDTH 30  ENTRIES 128
		     `SPARC_CORE.cpu.spc1.lsu.dta.way1.mem,
		     `SPARC_CORE.cpu.spc1.lsu.dta.way2.mem,
		     `SPARC_CORE.cpu.spc1.lsu.dta.way3.mem,
		     //valid
		     `SPARC_CORE.cpu.spc1.lsu.dva.array.mem,//reg	[31:0] mem [31:0];

		      //icache data
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_icd_cust.quad_0.w3_to_w0_bank.left_sb_array.mem,//reg     [143:0]   mem[63:0] ;
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_icd_cust.quad_0.w3_to_w0_bank.right_sb_array.mem,//reg     [135:0]   mem[63:0] ;
		     
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_icd_cust.quad_0.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_icd_cust.quad_0.w7_to_w4_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_icd_cust.quad_1.w3_to_w0_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_icd_cust.quad_1.w3_to_w0_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_icd_cust.quad_1.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_icd_cust.quad_1.w7_to_w4_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_icd_cust.quad_2.w3_to_w0_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_icd_cust.quad_2.w3_to_w0_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_icd_cust.quad_2.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_icd_cust.quad_2.w7_to_w4_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_icd_cust.quad_3.w3_to_w0_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_icd_cust.quad_3.w3_to_w0_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_icd_cust.quad_3.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_icd_cust.quad_3.w7_to_w4_bank.right_sb_array.mem,
		     //icache tag
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_ict_cust.tag_way_0.mem,//reg	[`WIDTH-1:0]	mem[`ENTRIES-1:0];WIDTH 30 ENTRIES 64
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_ict_cust.tag_way_1.mem,
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_ict_cust.tag_way_2.mem,
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_ict_cust.tag_way_3.mem,
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_ict_cust.tag_way_4.mem,
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_ict_cust.tag_way_5.mem,
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_ict_cust.tag_way_6.mem,
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_ict_cust.tag_way_7.mem,
		     
		     `SPARC_CORE.cpu.spc1.ifu_ftu.ftu_icv_cust.array.mem,//reg	[31:0] mem [31:0];
		     `endif //  `ifdef CORE_0
		     //sparc
		     `ifdef CORE_2
		     //data
		     `SPARC_CORE.cpu.spc2.dca.array.way01.left.mem,
		     `SPARC_CORE.cpu.spc2.dca.array.way01.right.mem,
		     `SPARC_CORE.cpu.spc2.dca.array.way23.left.mem,
		     `SPARC_CORE.cpu.spc2.dca.array.way23.right.mem,
		     //dcache tag
		     `SPARC_CORE.cpu.spc2.lsu.dta.way0.mem,//reg	[`WIDTH-1:0]	mem[`ENTRIES-1:0]; WIDTH 30  ENTRIES 128
		     `SPARC_CORE.cpu.spc2.lsu.dta.way1.mem,
		     `SPARC_CORE.cpu.spc2.lsu.dta.way2.mem,
		     `SPARC_CORE.cpu.spc2.lsu.dta.way3.mem,
		     //valid
		     `SPARC_CORE.cpu.spc2.lsu.dva.array.mem,//reg	[31:0] mem [31:0];

		      //icache data
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_icd_cust.quad_0.w3_to_w0_bank.left_sb_array.mem,//reg     [143:0]   mem[63:0] ;
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_icd_cust.quad_0.w3_to_w0_bank.right_sb_array.mem,//reg     [135:0]   mem[63:0] ;
		     
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_icd_cust.quad_0.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_icd_cust.quad_0.w7_to_w4_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_icd_cust.quad_1.w3_to_w0_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_icd_cust.quad_1.w3_to_w0_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_icd_cust.quad_1.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_icd_cust.quad_1.w7_to_w4_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_icd_cust.quad_2.w3_to_w0_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_icd_cust.quad_2.w3_to_w0_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_icd_cust.quad_2.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_icd_cust.quad_2.w7_to_w4_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_icd_cust.quad_3.w3_to_w0_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_icd_cust.quad_3.w3_to_w0_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_icd_cust.quad_3.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_icd_cust.quad_3.w7_to_w4_bank.right_sb_array.mem,
		     //icache tag
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_ict_cust.tag_way_0.mem,//reg	[`WIDTH-1:0]	mem[`ENTRIES-1:0];WIDTH 30 ENTRIES 64
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_ict_cust.tag_way_1.mem,
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_ict_cust.tag_way_2.mem,
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_ict_cust.tag_way_3.mem,
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_ict_cust.tag_way_4.mem,
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_ict_cust.tag_way_5.mem,
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_ict_cust.tag_way_6.mem,
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_ict_cust.tag_way_7.mem,
		     
		     `SPARC_CORE.cpu.spc2.ifu_ftu.ftu_icv_cust.array.mem,//reg	[31:0] mem [31:0];
		     `endif //  `ifdef CORE_0
		      //sparc
		     `ifdef CORE_3
		     //data
		     `SPARC_CORE.cpu.spc3.dca.array.way01.left.mem,
		     `SPARC_CORE.cpu.spc3.dca.array.way01.right.mem,
		     `SPARC_CORE.cpu.spc3.dca.array.way23.left.mem,
		     `SPARC_CORE.cpu.spc3.dca.array.way23.right.mem,
		     //dcache tag
		     `SPARC_CORE.cpu.spc3.lsu.dta.way0.mem,//reg	[`WIDTH-1:0]	mem[`ENTRIES-1:0]; WIDTH 30  ENTRIES 128
		     `SPARC_CORE.cpu.spc3.lsu.dta.way1.mem,
		     `SPARC_CORE.cpu.spc3.lsu.dta.way2.mem,
		     `SPARC_CORE.cpu.spc3.lsu.dta.way3.mem,
		     //valid
		     `SPARC_CORE.cpu.spc3.lsu.dva.array.mem,//reg	[31:0] mem [31:0];

		      //icache data
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_icd_cust.quad_0.w3_to_w0_bank.left_sb_array.mem,//reg     [143:0]   mem[63:0] ;
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_icd_cust.quad_0.w3_to_w0_bank.right_sb_array.mem,//reg     [135:0]   mem[63:0] ;
		     
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_icd_cust.quad_0.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_icd_cust.quad_0.w7_to_w4_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_icd_cust.quad_1.w3_to_w0_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_icd_cust.quad_1.w3_to_w0_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_icd_cust.quad_1.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_icd_cust.quad_1.w7_to_w4_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_icd_cust.quad_2.w3_to_w0_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_icd_cust.quad_2.w3_to_w0_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_icd_cust.quad_2.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_icd_cust.quad_2.w7_to_w4_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_icd_cust.quad_3.w3_to_w0_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_icd_cust.quad_3.w3_to_w0_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_icd_cust.quad_3.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_icd_cust.quad_3.w7_to_w4_bank.right_sb_array.mem,
		     //icache tag
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_ict_cust.tag_way_0.mem,//reg	[`WIDTH-1:0]	mem[`ENTRIES-1:0];WIDTH 30 ENTRIES 64
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_ict_cust.tag_way_1.mem,
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_ict_cust.tag_way_2.mem,
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_ict_cust.tag_way_3.mem,
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_ict_cust.tag_way_4.mem,
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_ict_cust.tag_way_5.mem,
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_ict_cust.tag_way_6.mem,
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_ict_cust.tag_way_7.mem,
		     
		     `SPARC_CORE.cpu.spc3.ifu_ftu.ftu_icv_cust.array.mem,//reg	[31:0] mem [31:0];
		     `endif //  `ifdef CORE_0
		      //sparc
		     `ifdef CORE_4
		     //data
		     `SPARC_CORE.cpu.spc4.dca.array.way01.left.mem,
		     `SPARC_CORE.cpu.spc4.dca.array.way01.right.mem,
		     `SPARC_CORE.cpu.spc4.dca.array.way23.left.mem,
		     `SPARC_CORE.cpu.spc4.dca.array.way23.right.mem,
		     //dcache tag
		     `SPARC_CORE.cpu.spc4.lsu.dta.way0.mem,//reg	[`WIDTH-1:0]	mem[`ENTRIES-1:0]; WIDTH 30  ENTRIES 128
		     `SPARC_CORE.cpu.spc4.lsu.dta.way1.mem,
		     `SPARC_CORE.cpu.spc4.lsu.dta.way2.mem,
		     `SPARC_CORE.cpu.spc4.lsu.dta.way3.mem,
		     //valid
		     `SPARC_CORE.cpu.spc4.lsu.dva.array.mem,//reg	[31:0] mem [31:0];

		      //icache data
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_icd_cust.quad_0.w3_to_w0_bank.left_sb_array.mem,//reg     [143:0]   mem[63:0] ;
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_icd_cust.quad_0.w3_to_w0_bank.right_sb_array.mem,//reg     [135:0]   mem[63:0] ;
		     
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_icd_cust.quad_0.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_icd_cust.quad_0.w7_to_w4_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_icd_cust.quad_1.w3_to_w0_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_icd_cust.quad_1.w3_to_w0_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_icd_cust.quad_1.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_icd_cust.quad_1.w7_to_w4_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_icd_cust.quad_2.w3_to_w0_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_icd_cust.quad_2.w3_to_w0_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_icd_cust.quad_2.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_icd_cust.quad_2.w7_to_w4_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_icd_cust.quad_3.w3_to_w0_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_icd_cust.quad_3.w3_to_w0_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_icd_cust.quad_3.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_icd_cust.quad_3.w7_to_w4_bank.right_sb_array.mem,
		     //icache tag
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_ict_cust.tag_way_0.mem,//reg	[`WIDTH-1:0]	mem[`ENTRIES-1:0];WIDTH 30 ENTRIES 64
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_ict_cust.tag_way_1.mem,
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_ict_cust.tag_way_2.mem,
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_ict_cust.tag_way_3.mem,
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_ict_cust.tag_way_4.mem,
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_ict_cust.tag_way_5.mem,
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_ict_cust.tag_way_6.mem,
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_ict_cust.tag_way_7.mem,
		     
		     `SPARC_CORE.cpu.spc4.ifu_ftu.ftu_icv_cust.array.mem,//reg	[31:0] mem [31:0];
		     `endif //  `ifdef CORE_0
		      //sparc
		     `ifdef CORE_5
		     //data
		     `SPARC_CORE.cpu.spc5.dca.array.way01.left.mem,
		     `SPARC_CORE.cpu.spc5.dca.array.way01.right.mem,
		     `SPARC_CORE.cpu.spc5.dca.array.way23.left.mem,
		     `SPARC_CORE.cpu.spc5.dca.array.way23.right.mem,
		     //dcache tag
		     `SPARC_CORE.cpu.spc5.lsu.dta.way0.mem,//reg	[`WIDTH-1:0]	mem[`ENTRIES-1:0]; WIDTH 30  ENTRIES 128
		     `SPARC_CORE.cpu.spc5.lsu.dta.way1.mem,
		     `SPARC_CORE.cpu.spc5.lsu.dta.way2.mem,
		     `SPARC_CORE.cpu.spc5.lsu.dta.way3.mem,
		     //valid
		     `SPARC_CORE.cpu.spc5.lsu.dva.array.mem,//reg	[31:0] mem [31:0];

		      //icache data
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_icd_cust.quad_0.w3_to_w0_bank.left_sb_array.mem,//reg     [143:0]   mem[63:0] ;
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_icd_cust.quad_0.w3_to_w0_bank.right_sb_array.mem,//reg     [135:0]   mem[63:0] ;
		     
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_icd_cust.quad_0.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_icd_cust.quad_0.w7_to_w4_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_icd_cust.quad_1.w3_to_w0_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_icd_cust.quad_1.w3_to_w0_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_icd_cust.quad_1.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_icd_cust.quad_1.w7_to_w4_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_icd_cust.quad_2.w3_to_w0_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_icd_cust.quad_2.w3_to_w0_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_icd_cust.quad_2.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_icd_cust.quad_2.w7_to_w4_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_icd_cust.quad_3.w3_to_w0_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_icd_cust.quad_3.w3_to_w0_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_icd_cust.quad_3.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_icd_cust.quad_3.w7_to_w4_bank.right_sb_array.mem,
		     //icache tag
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_ict_cust.tag_way_0.mem,//reg	[`WIDTH-1:0]	mem[`ENTRIES-1:0];WIDTH 30 ENTRIES 64
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_ict_cust.tag_way_1.mem,
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_ict_cust.tag_way_2.mem,
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_ict_cust.tag_way_3.mem,
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_ict_cust.tag_way_4.mem,
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_ict_cust.tag_way_5.mem,
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_ict_cust.tag_way_6.mem,
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_ict_cust.tag_way_7.mem,
		     
		     `SPARC_CORE.cpu.spc5.ifu_ftu.ftu_icv_cust.array.mem,//reg	[31:0] mem [31:0];
		     `endif //  `ifdef CORE_0
		      //sparc
		     `ifdef CORE_6
		     //data
		     `SPARC_CORE.cpu.spc6.dca.array.way01.left.mem,
		     `SPARC_CORE.cpu.spc6.dca.array.way01.right.mem,
		     `SPARC_CORE.cpu.spc6.dca.array.way23.left.mem,
		     `SPARC_CORE.cpu.spc6.dca.array.way23.right.mem,
		     //dcache tag
		     `SPARC_CORE.cpu.spc6.lsu.dta.way0.mem,//reg	[`WIDTH-1:0]	mem[`ENTRIES-1:0]; WIDTH 30  ENTRIES 128
		     `SPARC_CORE.cpu.spc6.lsu.dta.way1.mem,
		     `SPARC_CORE.cpu.spc6.lsu.dta.way2.mem,
		     `SPARC_CORE.cpu.spc6.lsu.dta.way3.mem,
		     //valid
		     `SPARC_CORE.cpu.spc6.lsu.dva.array.mem,//reg	[31:0] mem [31:0];

		      //icache data
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_icd_cust.quad_0.w3_to_w0_bank.left_sb_array.mem,//reg     [143:0]   mem[63:0] ;
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_icd_cust.quad_0.w3_to_w0_bank.right_sb_array.mem,//reg     [135:0]   mem[63:0] ;
		     
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_icd_cust.quad_0.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_icd_cust.quad_0.w7_to_w4_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_icd_cust.quad_1.w3_to_w0_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_icd_cust.quad_1.w3_to_w0_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_icd_cust.quad_1.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_icd_cust.quad_1.w7_to_w4_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_icd_cust.quad_2.w3_to_w0_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_icd_cust.quad_2.w3_to_w0_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_icd_cust.quad_2.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_icd_cust.quad_2.w7_to_w4_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_icd_cust.quad_3.w3_to_w0_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_icd_cust.quad_3.w3_to_w0_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_icd_cust.quad_3.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_icd_cust.quad_3.w7_to_w4_bank.right_sb_array.mem,
		     //icache tag
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_ict_cust.tag_way_0.mem,//reg	[`WIDTH-1:0]	mem[`ENTRIES-1:0];WIDTH 30 ENTRIES 64
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_ict_cust.tag_way_1.mem,
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_ict_cust.tag_way_2.mem,
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_ict_cust.tag_way_3.mem,
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_ict_cust.tag_way_4.mem,
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_ict_cust.tag_way_5.mem,
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_ict_cust.tag_way_6.mem,
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_ict_cust.tag_way_7.mem,
		     
		     `SPARC_CORE.cpu.spc6.ifu_ftu.ftu_icv_cust.array.mem,//reg	[31:0] mem [31:0];
		     `endif //  `ifdef CORE_0
		      //sparc
		     `ifdef CORE_7
		     //data
		     `SPARC_CORE.cpu.spc7.dca.array.way01.left.mem,
		     `SPARC_CORE.cpu.spc7.dca.array.way01.right.mem,
		     `SPARC_CORE.cpu.spc7.dca.array.way23.left.mem,
		     `SPARC_CORE.cpu.spc7.dca.array.way23.right.mem,
		     //dcache tag
		     `SPARC_CORE.cpu.spc7.lsu.dta.way0.mem,//reg	[`WIDTH-1:0]	mem[`ENTRIES-1:0]; WIDTH 30  ENTRIES 128
		     `SPARC_CORE.cpu.spc7.lsu.dta.way1.mem,
		     `SPARC_CORE.cpu.spc7.lsu.dta.way2.mem,
		     `SPARC_CORE.cpu.spc7.lsu.dta.way3.mem,
		     //valid
		     `SPARC_CORE.cpu.spc7.lsu.dva.array.mem,//reg	[31:0] mem [31:0];

		      //icache data
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_icd_cust.quad_0.w3_to_w0_bank.left_sb_array.mem,//reg     [143:0]   mem[63:0] ;
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_icd_cust.quad_0.w3_to_w0_bank.right_sb_array.mem,//reg     [135:0]   mem[63:0] ;
		     
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_icd_cust.quad_0.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_icd_cust.quad_0.w7_to_w4_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_icd_cust.quad_1.w3_to_w0_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_icd_cust.quad_1.w3_to_w0_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_icd_cust.quad_1.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_icd_cust.quad_1.w7_to_w4_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_icd_cust.quad_2.w3_to_w0_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_icd_cust.quad_2.w3_to_w0_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_icd_cust.quad_2.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_icd_cust.quad_2.w7_to_w4_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_icd_cust.quad_3.w3_to_w0_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_icd_cust.quad_3.w3_to_w0_bank.right_sb_array.mem,
		     
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_icd_cust.quad_3.w7_to_w4_bank.left_sb_array.mem,
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_icd_cust.quad_3.w7_to_w4_bank.right_sb_array.mem,
		     //icache tag
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_ict_cust.tag_way_0.mem,//reg	[`WIDTH-1:0]	mem[`ENTRIES-1:0];WIDTH 30 ENTRIES 64
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_ict_cust.tag_way_1.mem,
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_ict_cust.tag_way_2.mem,
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_ict_cust.tag_way_3.mem,
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_ict_cust.tag_way_4.mem,
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_ict_cust.tag_way_5.mem,
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_ict_cust.tag_way_6.mem,
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_ict_cust.tag_way_7.mem,
		     
		     `SPARC_CORE.cpu.spc7.ifu_ftu.ftu_icv_cust.array.mem,//reg	[31:0] mem [31:0];
		     `endif //  `ifdef CORE_0*/
		  );
      end
   end
endmodule 



