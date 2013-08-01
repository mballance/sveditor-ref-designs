// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: global_chkr.v
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
module global_chkr;
`ifndef GATESIM
`ifndef NO_MONITORS
`ifndef SPC_BENCH
`ifndef AXIS
`ifndef NOL2RTL

reg [7:0] active;
reg [7:0] core_set_mask;
reg enabled;
integer bank;
integer dc_err;
integer ic_err;
integer bank_err;
integer exc_err;
initial
begin
  active = 8'b0;
  enabled = 1'b0;
  dc_err = 0;
  ic_err = 0;
  exc_err = 0;
  bank_err = 0;
  core_set_mask = 8'b0;
  @(posedge `SPC0.l2clk);
  @(negedge `SPC0.l2clk);
  if (`PARGS.gchkr_on) 
  begin  //{
     enabled = 1;

     if ((`PARGS.bank_set_mask !== 0) || (`PARGS.bank_set_mask_csr !== 0)) 
     begin
	enabled = 0;
        `PR_ALWAYS("global_chkr", `ALWAYS, "GLOBAL_CHKR DISABLED (diag run in partial bank mode)\n");
     end
     else
     begin //{
        if ($test$plusargs("core_set_mask"))
        begin
	   if ($value$plusargs("core_set_mask=%0h", core_set_mask))
	   begin
 	      `PR_INFO("global_chkr", 22, "Partial core mode. core_set_mask = %0h", core_set_mask);
           end
  	end
     end  //}
  end  //}
end

//core_set_mask and bank_set_mask are used to specify efuse settings and are used in file 
// /import/n2-tools/exe/efa_gen to generate the efuse mask.

always @ (posedge (tb_top.sim_status[0] & enabled))
begin //{

  `ifdef CORE_0 active[0] = 1; `endif
  `ifdef CORE_1 active[1] = 1; `endif
  `ifdef CORE_2 active[2] = 1; `endif
  `ifdef CORE_3 active[3] = 1; `endif
  `ifdef CORE_4 active[4] = 1; `endif
  `ifdef CORE_5 active[5] = 1; `endif
  `ifdef CORE_6 active[6] = 1; `endif
  `ifdef CORE_7 active[7] = 1; `endif
if (core_set_mask == 8'b0)  
	core_set_mask = active;

 `PR_ALWAYS("global_chkr", `ALWAYS, "L2-L1 chk started .....\n");

 `PR_INFO("global_chkr", 22, "calling global_chkr_l1dump pli. active = %0h, core_set_mask = %0h", active, core_set_mask);

  	$global_chkr_l1dump(
	      core_set_mask, 
              active,
              `ifdef CORE_0
                `SPC0.lsu.dta.way0.mem,
                `SPC0.lsu.dta.way1.mem,
                `SPC0.lsu.dta.way2.mem,
                `SPC0.lsu.dta.way3.mem,

                `SPC0.ifu_ftu.ftu_ict_cust.tag_way_0.mem,
                `SPC0.ifu_ftu.ftu_ict_cust.tag_way_1.mem,
                `SPC0.ifu_ftu.ftu_ict_cust.tag_way_2.mem,
                `SPC0.ifu_ftu.ftu_ict_cust.tag_way_3.mem,
                `SPC0.ifu_ftu.ftu_ict_cust.tag_way_4.mem,
                `SPC0.ifu_ftu.ftu_ict_cust.tag_way_5.mem,
                `SPC0.ifu_ftu.ftu_ict_cust.tag_way_6.mem,
                `SPC0.ifu_ftu.ftu_ict_cust.tag_way_7.mem,

                `SPC0.lsu.dva.array.mem,
                `SPC0.ifu_ftu.ftu_icv_cust.array.mem,
               `endif

              `ifdef CORE_1
                `SPC1.lsu.dta.way0.mem,
                `SPC1.lsu.dta.way1.mem,
                `SPC1.lsu.dta.way2.mem,
                `SPC1.lsu.dta.way3.mem,

                `SPC1.ifu_ftu.ftu_ict_cust.tag_way_0.mem,
                `SPC1.ifu_ftu.ftu_ict_cust.tag_way_1.mem,
                `SPC1.ifu_ftu.ftu_ict_cust.tag_way_2.mem,
                `SPC1.ifu_ftu.ftu_ict_cust.tag_way_3.mem,
                `SPC1.ifu_ftu.ftu_ict_cust.tag_way_4.mem,
                `SPC1.ifu_ftu.ftu_ict_cust.tag_way_5.mem,
                `SPC1.ifu_ftu.ftu_ict_cust.tag_way_6.mem,
                `SPC1.ifu_ftu.ftu_ict_cust.tag_way_7.mem,

                `SPC1.lsu.dva.array.mem,
                `SPC1.ifu_ftu.ftu_icv_cust.array.mem,
               `endif

              `ifdef CORE_2
                `SPC2.lsu.dta.way0.mem,
                `SPC2.lsu.dta.way1.mem,
                `SPC2.lsu.dta.way2.mem,
                `SPC2.lsu.dta.way3.mem,

                `SPC2.ifu_ftu.ftu_ict_cust.tag_way_0.mem,
                `SPC2.ifu_ftu.ftu_ict_cust.tag_way_1.mem,
                `SPC2.ifu_ftu.ftu_ict_cust.tag_way_2.mem,
                `SPC2.ifu_ftu.ftu_ict_cust.tag_way_3.mem,
                `SPC2.ifu_ftu.ftu_ict_cust.tag_way_4.mem,
                `SPC2.ifu_ftu.ftu_ict_cust.tag_way_5.mem,
                `SPC2.ifu_ftu.ftu_ict_cust.tag_way_6.mem,
                `SPC2.ifu_ftu.ftu_ict_cust.tag_way_7.mem,

                `SPC2.lsu.dva.array.mem,
                `SPC2.ifu_ftu.ftu_icv_cust.array.mem,
               `endif

              `ifdef CORE_3
                `SPC3.lsu.dta.way0.mem,
                `SPC3.lsu.dta.way1.mem,
                `SPC3.lsu.dta.way2.mem,
                `SPC3.lsu.dta.way3.mem,

                `SPC3.ifu_ftu.ftu_ict_cust.tag_way_0.mem,
                `SPC3.ifu_ftu.ftu_ict_cust.tag_way_1.mem,
                `SPC3.ifu_ftu.ftu_ict_cust.tag_way_2.mem,
                `SPC3.ifu_ftu.ftu_ict_cust.tag_way_3.mem,
                `SPC3.ifu_ftu.ftu_ict_cust.tag_way_4.mem,
                `SPC3.ifu_ftu.ftu_ict_cust.tag_way_5.mem,
                `SPC3.ifu_ftu.ftu_ict_cust.tag_way_6.mem,
                `SPC3.ifu_ftu.ftu_ict_cust.tag_way_7.mem,

                `SPC3.lsu.dva.array.mem,
                `SPC3.ifu_ftu.ftu_icv_cust.array.mem,
               `endif

              `ifdef CORE_4
                `SPC4.lsu.dta.way0.mem,
                `SPC4.lsu.dta.way1.mem,
                `SPC4.lsu.dta.way2.mem,
                `SPC4.lsu.dta.way3.mem,

                `SPC4.ifu_ftu.ftu_ict_cust.tag_way_0.mem,
                `SPC4.ifu_ftu.ftu_ict_cust.tag_way_1.mem,
                `SPC4.ifu_ftu.ftu_ict_cust.tag_way_2.mem,
                `SPC4.ifu_ftu.ftu_ict_cust.tag_way_3.mem,
                `SPC4.ifu_ftu.ftu_ict_cust.tag_way_4.mem,
                `SPC4.ifu_ftu.ftu_ict_cust.tag_way_5.mem,
                `SPC4.ifu_ftu.ftu_ict_cust.tag_way_6.mem,
                `SPC4.ifu_ftu.ftu_ict_cust.tag_way_7.mem,

                `SPC4.lsu.dva.array.mem,
                `SPC4.ifu_ftu.ftu_icv_cust.array.mem,
               `endif

              `ifdef CORE_5
                `SPC5.lsu.dta.way0.mem,
                `SPC5.lsu.dta.way1.mem,
                `SPC5.lsu.dta.way2.mem,
                `SPC5.lsu.dta.way3.mem,

                `SPC5.ifu_ftu.ftu_ict_cust.tag_way_0.mem,
                `SPC5.ifu_ftu.ftu_ict_cust.tag_way_1.mem,
                `SPC5.ifu_ftu.ftu_ict_cust.tag_way_2.mem,
                `SPC5.ifu_ftu.ftu_ict_cust.tag_way_3.mem,
                `SPC5.ifu_ftu.ftu_ict_cust.tag_way_4.mem,
                `SPC5.ifu_ftu.ftu_ict_cust.tag_way_5.mem,
                `SPC5.ifu_ftu.ftu_ict_cust.tag_way_6.mem,
                `SPC5.ifu_ftu.ftu_ict_cust.tag_way_7.mem,

                `SPC5.lsu.dva.array.mem,
                `SPC5.ifu_ftu.ftu_icv_cust.array.mem,
               `endif

              `ifdef CORE_6
                `SPC6.lsu.dta.way0.mem,
                `SPC6.lsu.dta.way1.mem,
                `SPC6.lsu.dta.way2.mem,
                `SPC6.lsu.dta.way3.mem,

                `SPC6.ifu_ftu.ftu_ict_cust.tag_way_0.mem,
                `SPC6.ifu_ftu.ftu_ict_cust.tag_way_1.mem,
                `SPC6.ifu_ftu.ftu_ict_cust.tag_way_2.mem,
                `SPC6.ifu_ftu.ftu_ict_cust.tag_way_3.mem,
                `SPC6.ifu_ftu.ftu_ict_cust.tag_way_4.mem,
                `SPC6.ifu_ftu.ftu_ict_cust.tag_way_5.mem,
                `SPC6.ifu_ftu.ftu_ict_cust.tag_way_6.mem,
                `SPC6.ifu_ftu.ftu_ict_cust.tag_way_7.mem,

                `SPC6.lsu.dva.array.mem,
                `SPC6.ifu_ftu.ftu_icv_cust.array.mem,
               `endif

              `ifdef CORE_7
                `SPC7.lsu.dta.way0.mem,
                `SPC7.lsu.dta.way1.mem,
                `SPC7.lsu.dta.way2.mem,
                `SPC7.lsu.dta.way3.mem,

                `SPC7.ifu_ftu.ftu_ict_cust.tag_way_0.mem,
                `SPC7.ifu_ftu.ftu_ict_cust.tag_way_1.mem,
                `SPC7.ifu_ftu.ftu_ict_cust.tag_way_2.mem,
                `SPC7.ifu_ftu.ftu_ict_cust.tag_way_3.mem,
                `SPC7.ifu_ftu.ftu_ict_cust.tag_way_4.mem,
                `SPC7.ifu_ftu.ftu_ict_cust.tag_way_5.mem,
                `SPC7.ifu_ftu.ftu_ict_cust.tag_way_6.mem,
                `SPC7.ifu_ftu.ftu_ict_cust.tag_way_7.mem,

                `SPC7.lsu.dva.array.mem,
                `SPC7.ifu_ftu.ftu_icv_cust.array.mem
               `endif

               );
	
 `PR_INFO("global_chkr", 22, "calling global_chkr_read_l2_tag pli.");

	$global_chkr_read_l2_tag(
	     tb_top.cpu.l2t0.tag.quad0.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t0.tag.quad0.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t0.tag.quad0.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t0.tag.quad0.bank1.l2t_array.mem_rgt,	
	     
	     tb_top.cpu.l2t0.tag.quad1.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t0.tag.quad1.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t0.tag.quad1.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t0.tag.quad1.bank1.l2t_array.mem_rgt,	

	     tb_top.cpu.l2t0.tag.quad2.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t0.tag.quad2.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t0.tag.quad2.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t0.tag.quad2.bank1.l2t_array.mem_rgt,	
	     
	     tb_top.cpu.l2t0.tag.quad3.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t0.tag.quad3.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t0.tag.quad3.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t0.tag.quad3.bank1.l2t_array.mem_rgt,	

	     tb_top.cpu.l2t1.tag.quad0.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t1.tag.quad0.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t1.tag.quad0.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t1.tag.quad0.bank1.l2t_array.mem_rgt,	
	     
	     tb_top.cpu.l2t1.tag.quad1.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t1.tag.quad1.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t1.tag.quad1.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t1.tag.quad1.bank1.l2t_array.mem_rgt,	

	     tb_top.cpu.l2t1.tag.quad2.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t1.tag.quad2.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t1.tag.quad2.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t1.tag.quad2.bank1.l2t_array.mem_rgt,	
	     
	     tb_top.cpu.l2t1.tag.quad3.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t1.tag.quad3.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t1.tag.quad3.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t1.tag.quad3.bank1.l2t_array.mem_rgt,	

	     tb_top.cpu.l2t2.tag.quad0.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t2.tag.quad0.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t2.tag.quad0.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t2.tag.quad0.bank1.l2t_array.mem_rgt,	
	     
	     tb_top.cpu.l2t2.tag.quad1.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t2.tag.quad1.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t2.tag.quad1.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t2.tag.quad1.bank1.l2t_array.mem_rgt,	

	     tb_top.cpu.l2t2.tag.quad2.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t2.tag.quad2.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t2.tag.quad2.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t2.tag.quad2.bank1.l2t_array.mem_rgt,	
	     
	     tb_top.cpu.l2t2.tag.quad3.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t2.tag.quad3.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t2.tag.quad3.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t2.tag.quad3.bank1.l2t_array.mem_rgt,	

	     tb_top.cpu.l2t3.tag.quad0.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t3.tag.quad0.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t3.tag.quad0.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t3.tag.quad0.bank1.l2t_array.mem_rgt,	
	     
	     tb_top.cpu.l2t3.tag.quad1.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t3.tag.quad1.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t3.tag.quad1.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t3.tag.quad1.bank1.l2t_array.mem_rgt,	

	     tb_top.cpu.l2t3.tag.quad2.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t3.tag.quad2.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t3.tag.quad2.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t3.tag.quad2.bank1.l2t_array.mem_rgt,	
	     
	     tb_top.cpu.l2t3.tag.quad3.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t3.tag.quad3.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t3.tag.quad3.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t3.tag.quad3.bank1.l2t_array.mem_rgt,	

	     tb_top.cpu.l2t4.tag.quad0.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t4.tag.quad0.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t4.tag.quad0.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t4.tag.quad0.bank1.l2t_array.mem_rgt,	
	     
	     tb_top.cpu.l2t4.tag.quad1.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t4.tag.quad1.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t4.tag.quad1.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t4.tag.quad1.bank1.l2t_array.mem_rgt,	

	     tb_top.cpu.l2t4.tag.quad2.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t4.tag.quad2.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t4.tag.quad2.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t4.tag.quad2.bank1.l2t_array.mem_rgt,	
	     
	     tb_top.cpu.l2t4.tag.quad3.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t4.tag.quad3.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t4.tag.quad3.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t4.tag.quad3.bank1.l2t_array.mem_rgt,	

	     tb_top.cpu.l2t5.tag.quad0.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t5.tag.quad0.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t5.tag.quad0.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t5.tag.quad0.bank1.l2t_array.mem_rgt,	
	     
	     tb_top.cpu.l2t5.tag.quad1.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t5.tag.quad1.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t5.tag.quad1.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t5.tag.quad1.bank1.l2t_array.mem_rgt,	

	     tb_top.cpu.l2t5.tag.quad2.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t5.tag.quad2.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t5.tag.quad2.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t5.tag.quad2.bank1.l2t_array.mem_rgt,	
	     
	     tb_top.cpu.l2t5.tag.quad3.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t5.tag.quad3.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t5.tag.quad3.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t5.tag.quad3.bank1.l2t_array.mem_rgt,	

	     tb_top.cpu.l2t6.tag.quad0.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t6.tag.quad0.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t6.tag.quad0.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t6.tag.quad0.bank1.l2t_array.mem_rgt,	
	     
	     tb_top.cpu.l2t6.tag.quad1.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t6.tag.quad1.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t6.tag.quad1.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t6.tag.quad1.bank1.l2t_array.mem_rgt,	

	     tb_top.cpu.l2t6.tag.quad2.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t6.tag.quad2.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t6.tag.quad2.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t6.tag.quad2.bank1.l2t_array.mem_rgt,	
	     
	     tb_top.cpu.l2t6.tag.quad3.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t6.tag.quad3.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t6.tag.quad3.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t6.tag.quad3.bank1.l2t_array.mem_rgt,	

	     tb_top.cpu.l2t7.tag.quad0.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t7.tag.quad0.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t7.tag.quad0.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t7.tag.quad0.bank1.l2t_array.mem_rgt,	
	     
	     tb_top.cpu.l2t7.tag.quad1.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t7.tag.quad1.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t7.tag.quad1.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t7.tag.quad1.bank1.l2t_array.mem_rgt,	

	     tb_top.cpu.l2t7.tag.quad2.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t7.tag.quad2.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t7.tag.quad2.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t7.tag.quad2.bank1.l2t_array.mem_rgt,	
	     
	     tb_top.cpu.l2t7.tag.quad3.bank0.l2t_array.mem_lft,	
	     tb_top.cpu.l2t7.tag.quad3.bank0.l2t_array.mem_rgt,	
	     tb_top.cpu.l2t7.tag.quad3.bank1.l2t_array.mem_lft,	
	     tb_top.cpu.l2t7.tag.quad3.bank1.l2t_array.mem_rgt

	      );

 `PR_INFO("global_chkr", 22, "calling global_chkr_read_l2_dc_dir pli.");

	$global_chkr_read_l2_dc_dir(
	     tb_top.cpu.l2t0.dc_row0.panel0.array.addr_array, 
	     tb_top.cpu.l2t0.dc_row0.panel0.array.valid, 
	     tb_top.cpu.l2t0.dc_row0.panel1.array.addr_array, 
	     tb_top.cpu.l2t0.dc_row0.panel1.array.valid, 
	     tb_top.cpu.l2t0.dc_row0.panel2.array.addr_array, 
	     tb_top.cpu.l2t0.dc_row0.panel2.array.valid, 
	     tb_top.cpu.l2t0.dc_row0.panel3.array.addr_array, 
	     tb_top.cpu.l2t0.dc_row0.panel3.array.valid, 

	     tb_top.cpu.l2t0.dc_row2.panel0.array.addr_array, 
	     tb_top.cpu.l2t0.dc_row2.panel0.array.valid, 
	     tb_top.cpu.l2t0.dc_row2.panel1.array.addr_array, 
	     tb_top.cpu.l2t0.dc_row2.panel1.array.valid, 
	     tb_top.cpu.l2t0.dc_row2.panel2.array.addr_array, 
	     tb_top.cpu.l2t0.dc_row2.panel2.array.valid, 
	     tb_top.cpu.l2t0.dc_row2.panel3.array.addr_array, 
	     tb_top.cpu.l2t0.dc_row2.panel3.array.valid, 

	     tb_top.cpu.l2t1.dc_row0.panel0.array.addr_array, 
	     tb_top.cpu.l2t1.dc_row0.panel0.array.valid, 
	     tb_top.cpu.l2t1.dc_row0.panel1.array.addr_array, 
	     tb_top.cpu.l2t1.dc_row0.panel1.array.valid, 
	     tb_top.cpu.l2t1.dc_row0.panel2.array.addr_array, 
	     tb_top.cpu.l2t1.dc_row0.panel2.array.valid, 
	     tb_top.cpu.l2t1.dc_row0.panel3.array.addr_array, 
	     tb_top.cpu.l2t1.dc_row0.panel3.array.valid, 

	     tb_top.cpu.l2t1.dc_row2.panel0.array.addr_array, 
	     tb_top.cpu.l2t1.dc_row2.panel0.array.valid, 
	     tb_top.cpu.l2t1.dc_row2.panel1.array.addr_array, 
	     tb_top.cpu.l2t1.dc_row2.panel1.array.valid, 
	     tb_top.cpu.l2t1.dc_row2.panel2.array.addr_array, 
	     tb_top.cpu.l2t1.dc_row2.panel2.array.valid, 
	     tb_top.cpu.l2t1.dc_row2.panel3.array.addr_array, 
	     tb_top.cpu.l2t1.dc_row2.panel3.array.valid, 

	     tb_top.cpu.l2t2.dc_row0.panel0.array.addr_array, 
	     tb_top.cpu.l2t2.dc_row0.panel0.array.valid, 
	     tb_top.cpu.l2t2.dc_row0.panel1.array.addr_array, 
	     tb_top.cpu.l2t2.dc_row0.panel1.array.valid, 
	     tb_top.cpu.l2t2.dc_row0.panel2.array.addr_array, 
	     tb_top.cpu.l2t2.dc_row0.panel2.array.valid, 
	     tb_top.cpu.l2t2.dc_row0.panel3.array.addr_array, 
	     tb_top.cpu.l2t2.dc_row0.panel3.array.valid, 

	     tb_top.cpu.l2t2.dc_row2.panel0.array.addr_array, 
	     tb_top.cpu.l2t2.dc_row2.panel0.array.valid, 
	     tb_top.cpu.l2t2.dc_row2.panel1.array.addr_array, 
	     tb_top.cpu.l2t2.dc_row2.panel1.array.valid, 
	     tb_top.cpu.l2t2.dc_row2.panel2.array.addr_array, 
	     tb_top.cpu.l2t2.dc_row2.panel2.array.valid, 
	     tb_top.cpu.l2t2.dc_row2.panel3.array.addr_array, 
	     tb_top.cpu.l2t2.dc_row2.panel3.array.valid, 

	     tb_top.cpu.l2t3.dc_row0.panel0.array.addr_array, 
	     tb_top.cpu.l2t3.dc_row0.panel0.array.valid, 
	     tb_top.cpu.l2t3.dc_row0.panel1.array.addr_array, 
	     tb_top.cpu.l2t3.dc_row0.panel1.array.valid, 
	     tb_top.cpu.l2t3.dc_row0.panel2.array.addr_array, 
	     tb_top.cpu.l2t3.dc_row0.panel2.array.valid, 
	     tb_top.cpu.l2t3.dc_row0.panel3.array.addr_array, 
	     tb_top.cpu.l2t3.dc_row0.panel3.array.valid, 

	     tb_top.cpu.l2t3.dc_row2.panel0.array.addr_array, 
	     tb_top.cpu.l2t3.dc_row2.panel0.array.valid, 
	     tb_top.cpu.l2t3.dc_row2.panel1.array.addr_array, 
	     tb_top.cpu.l2t3.dc_row2.panel1.array.valid, 
	     tb_top.cpu.l2t3.dc_row2.panel2.array.addr_array, 
	     tb_top.cpu.l2t3.dc_row2.panel2.array.valid, 
	     tb_top.cpu.l2t3.dc_row2.panel3.array.addr_array, 
	     tb_top.cpu.l2t3.dc_row2.panel3.array.valid, 

	     tb_top.cpu.l2t4.dc_row0.panel0.array.addr_array, 
	     tb_top.cpu.l2t4.dc_row0.panel0.array.valid, 
	     tb_top.cpu.l2t4.dc_row0.panel1.array.addr_array, 
	     tb_top.cpu.l2t4.dc_row0.panel1.array.valid, 
	     tb_top.cpu.l2t4.dc_row0.panel2.array.addr_array, 
	     tb_top.cpu.l2t4.dc_row0.panel2.array.valid, 
	     tb_top.cpu.l2t4.dc_row0.panel3.array.addr_array, 
	     tb_top.cpu.l2t4.dc_row0.panel3.array.valid, 

	     tb_top.cpu.l2t4.dc_row2.panel0.array.addr_array, 
	     tb_top.cpu.l2t4.dc_row2.panel0.array.valid, 
	     tb_top.cpu.l2t4.dc_row2.panel1.array.addr_array, 
	     tb_top.cpu.l2t4.dc_row2.panel1.array.valid, 
	     tb_top.cpu.l2t4.dc_row2.panel2.array.addr_array, 
	     tb_top.cpu.l2t4.dc_row2.panel2.array.valid, 
	     tb_top.cpu.l2t4.dc_row2.panel3.array.addr_array, 
	     tb_top.cpu.l2t4.dc_row2.panel3.array.valid, 

	     tb_top.cpu.l2t5.dc_row0.panel0.array.addr_array, 
	     tb_top.cpu.l2t5.dc_row0.panel0.array.valid, 
	     tb_top.cpu.l2t5.dc_row0.panel1.array.addr_array, 
	     tb_top.cpu.l2t5.dc_row0.panel1.array.valid, 
	     tb_top.cpu.l2t5.dc_row0.panel2.array.addr_array, 
	     tb_top.cpu.l2t5.dc_row0.panel2.array.valid, 
	     tb_top.cpu.l2t5.dc_row0.panel3.array.addr_array, 
	     tb_top.cpu.l2t5.dc_row0.panel3.array.valid, 

	     tb_top.cpu.l2t5.dc_row2.panel0.array.addr_array, 
	     tb_top.cpu.l2t5.dc_row2.panel0.array.valid, 
	     tb_top.cpu.l2t5.dc_row2.panel1.array.addr_array, 
	     tb_top.cpu.l2t5.dc_row2.panel1.array.valid, 
	     tb_top.cpu.l2t5.dc_row2.panel2.array.addr_array, 
	     tb_top.cpu.l2t5.dc_row2.panel2.array.valid, 
	     tb_top.cpu.l2t5.dc_row2.panel3.array.addr_array, 
	     tb_top.cpu.l2t5.dc_row2.panel3.array.valid, 

	     tb_top.cpu.l2t6.dc_row0.panel0.array.addr_array, 
	     tb_top.cpu.l2t6.dc_row0.panel0.array.valid, 
	     tb_top.cpu.l2t6.dc_row0.panel1.array.addr_array, 
	     tb_top.cpu.l2t6.dc_row0.panel1.array.valid, 
	     tb_top.cpu.l2t6.dc_row0.panel2.array.addr_array, 
	     tb_top.cpu.l2t6.dc_row0.panel2.array.valid, 
	     tb_top.cpu.l2t6.dc_row0.panel3.array.addr_array, 
	     tb_top.cpu.l2t6.dc_row0.panel3.array.valid, 

	     tb_top.cpu.l2t6.dc_row2.panel0.array.addr_array, 
	     tb_top.cpu.l2t6.dc_row2.panel0.array.valid, 
	     tb_top.cpu.l2t6.dc_row2.panel1.array.addr_array, 
	     tb_top.cpu.l2t6.dc_row2.panel1.array.valid, 
	     tb_top.cpu.l2t6.dc_row2.panel2.array.addr_array, 
	     tb_top.cpu.l2t6.dc_row2.panel2.array.valid, 
	     tb_top.cpu.l2t6.dc_row2.panel3.array.addr_array, 
	     tb_top.cpu.l2t6.dc_row2.panel3.array.valid, 

	     tb_top.cpu.l2t7.dc_row0.panel0.array.addr_array, 
	     tb_top.cpu.l2t7.dc_row0.panel0.array.valid, 
	     tb_top.cpu.l2t7.dc_row0.panel1.array.addr_array, 
	     tb_top.cpu.l2t7.dc_row0.panel1.array.valid, 
	     tb_top.cpu.l2t7.dc_row0.panel2.array.addr_array, 
	     tb_top.cpu.l2t7.dc_row0.panel2.array.valid, 
	     tb_top.cpu.l2t7.dc_row0.panel3.array.addr_array, 
	     tb_top.cpu.l2t7.dc_row0.panel3.array.valid, 

	     tb_top.cpu.l2t7.dc_row2.panel0.array.addr_array, 
	     tb_top.cpu.l2t7.dc_row2.panel0.array.valid, 
	     tb_top.cpu.l2t7.dc_row2.panel1.array.addr_array, 
	     tb_top.cpu.l2t7.dc_row2.panel1.array.valid, 
	     tb_top.cpu.l2t7.dc_row2.panel2.array.addr_array, 
	     tb_top.cpu.l2t7.dc_row2.panel2.array.valid, 
	     tb_top.cpu.l2t7.dc_row2.panel3.array.addr_array, 
	     tb_top.cpu.l2t7.dc_row2.panel3.array.valid

	);
 
 `PR_INFO("global_chkr", 22, "calling global_chkr_read_l2_ic_dir pli.");

	$global_chkr_read_l2_ic_dir(
	     tb_top.cpu.l2t0.ic_row0.panel0.array.addr_array, 
	     tb_top.cpu.l2t0.ic_row0.panel0.array.valid, 
	     tb_top.cpu.l2t0.ic_row0.panel1.array.addr_array, 
	     tb_top.cpu.l2t0.ic_row0.panel1.array.valid, 
	     tb_top.cpu.l2t0.ic_row0.panel2.array.addr_array, 
	     tb_top.cpu.l2t0.ic_row0.panel2.array.valid, 
	     tb_top.cpu.l2t0.ic_row0.panel3.array.addr_array, 
	     tb_top.cpu.l2t0.ic_row0.panel3.array.valid, 

	     tb_top.cpu.l2t0.ic_row2.panel0.array.addr_array, 
	     tb_top.cpu.l2t0.ic_row2.panel0.array.valid, 
	     tb_top.cpu.l2t0.ic_row2.panel1.array.addr_array, 
	     tb_top.cpu.l2t0.ic_row2.panel1.array.valid, 
	     tb_top.cpu.l2t0.ic_row2.panel2.array.addr_array, 
	     tb_top.cpu.l2t0.ic_row2.panel2.array.valid, 
	     tb_top.cpu.l2t0.ic_row2.panel3.array.addr_array, 
	     tb_top.cpu.l2t0.ic_row2.panel3.array.valid, 

	     tb_top.cpu.l2t1.ic_row0.panel0.array.addr_array, 
	     tb_top.cpu.l2t1.ic_row0.panel0.array.valid, 
	     tb_top.cpu.l2t1.ic_row0.panel1.array.addr_array, 
	     tb_top.cpu.l2t1.ic_row0.panel1.array.valid, 
	     tb_top.cpu.l2t1.ic_row0.panel2.array.addr_array, 
	     tb_top.cpu.l2t1.ic_row0.panel2.array.valid, 
	     tb_top.cpu.l2t1.ic_row0.panel3.array.addr_array, 
	     tb_top.cpu.l2t1.ic_row0.panel3.array.valid, 

	     tb_top.cpu.l2t1.ic_row2.panel0.array.addr_array, 
	     tb_top.cpu.l2t1.ic_row2.panel0.array.valid, 
	     tb_top.cpu.l2t1.ic_row2.panel1.array.addr_array, 
	     tb_top.cpu.l2t1.ic_row2.panel1.array.valid, 
	     tb_top.cpu.l2t1.ic_row2.panel2.array.addr_array, 
	     tb_top.cpu.l2t1.ic_row2.panel2.array.valid, 
	     tb_top.cpu.l2t1.ic_row2.panel3.array.addr_array, 
	     tb_top.cpu.l2t1.ic_row2.panel3.array.valid, 

	     tb_top.cpu.l2t2.ic_row0.panel0.array.addr_array, 
	     tb_top.cpu.l2t2.ic_row0.panel0.array.valid, 
	     tb_top.cpu.l2t2.ic_row0.panel1.array.addr_array, 
	     tb_top.cpu.l2t2.ic_row0.panel1.array.valid, 
	     tb_top.cpu.l2t2.ic_row0.panel2.array.addr_array, 
	     tb_top.cpu.l2t2.ic_row0.panel2.array.valid, 
	     tb_top.cpu.l2t2.ic_row0.panel3.array.addr_array, 
	     tb_top.cpu.l2t2.ic_row0.panel3.array.valid, 

	     tb_top.cpu.l2t2.ic_row2.panel0.array.addr_array, 
	     tb_top.cpu.l2t2.ic_row2.panel0.array.valid, 
	     tb_top.cpu.l2t2.ic_row2.panel1.array.addr_array, 
	     tb_top.cpu.l2t2.ic_row2.panel1.array.valid, 
	     tb_top.cpu.l2t2.ic_row2.panel2.array.addr_array, 
	     tb_top.cpu.l2t2.ic_row2.panel2.array.valid, 
	     tb_top.cpu.l2t2.ic_row2.panel3.array.addr_array, 
	     tb_top.cpu.l2t2.ic_row2.panel3.array.valid, 

	     tb_top.cpu.l2t3.ic_row0.panel0.array.addr_array, 
	     tb_top.cpu.l2t3.ic_row0.panel0.array.valid, 
	     tb_top.cpu.l2t3.ic_row0.panel1.array.addr_array, 
	     tb_top.cpu.l2t3.ic_row0.panel1.array.valid, 
	     tb_top.cpu.l2t3.ic_row0.panel2.array.addr_array, 
	     tb_top.cpu.l2t3.ic_row0.panel2.array.valid, 
	     tb_top.cpu.l2t3.ic_row0.panel3.array.addr_array, 
	     tb_top.cpu.l2t3.ic_row0.panel3.array.valid, 

	     tb_top.cpu.l2t3.ic_row2.panel0.array.addr_array, 
	     tb_top.cpu.l2t3.ic_row2.panel0.array.valid, 
	     tb_top.cpu.l2t3.ic_row2.panel1.array.addr_array, 
	     tb_top.cpu.l2t3.ic_row2.panel1.array.valid, 
	     tb_top.cpu.l2t3.ic_row2.panel2.array.addr_array, 
	     tb_top.cpu.l2t3.ic_row2.panel2.array.valid, 
	     tb_top.cpu.l2t3.ic_row2.panel3.array.addr_array, 
	     tb_top.cpu.l2t3.ic_row2.panel3.array.valid, 

	     tb_top.cpu.l2t4.ic_row0.panel0.array.addr_array, 
	     tb_top.cpu.l2t4.ic_row0.panel0.array.valid, 
	     tb_top.cpu.l2t4.ic_row0.panel1.array.addr_array, 
	     tb_top.cpu.l2t4.ic_row0.panel1.array.valid, 
	     tb_top.cpu.l2t4.ic_row0.panel2.array.addr_array, 
	     tb_top.cpu.l2t4.ic_row0.panel2.array.valid, 
	     tb_top.cpu.l2t4.ic_row0.panel3.array.addr_array, 
	     tb_top.cpu.l2t4.ic_row0.panel3.array.valid, 

	     tb_top.cpu.l2t4.ic_row2.panel0.array.addr_array, 
	     tb_top.cpu.l2t4.ic_row2.panel0.array.valid, 
	     tb_top.cpu.l2t4.ic_row2.panel1.array.addr_array, 
	     tb_top.cpu.l2t4.ic_row2.panel1.array.valid, 
	     tb_top.cpu.l2t4.ic_row2.panel2.array.addr_array, 
	     tb_top.cpu.l2t4.ic_row2.panel2.array.valid, 
	     tb_top.cpu.l2t4.ic_row2.panel3.array.addr_array, 
	     tb_top.cpu.l2t4.ic_row2.panel3.array.valid, 

	     tb_top.cpu.l2t5.ic_row0.panel0.array.addr_array, 
	     tb_top.cpu.l2t5.ic_row0.panel0.array.valid, 
	     tb_top.cpu.l2t5.ic_row0.panel1.array.addr_array, 
	     tb_top.cpu.l2t5.ic_row0.panel1.array.valid, 
	     tb_top.cpu.l2t5.ic_row0.panel2.array.addr_array, 
	     tb_top.cpu.l2t5.ic_row0.panel2.array.valid, 
	     tb_top.cpu.l2t5.ic_row0.panel3.array.addr_array, 
	     tb_top.cpu.l2t5.ic_row0.panel3.array.valid, 

	     tb_top.cpu.l2t5.ic_row2.panel0.array.addr_array, 
	     tb_top.cpu.l2t5.ic_row2.panel0.array.valid, 
	     tb_top.cpu.l2t5.ic_row2.panel1.array.addr_array, 
	     tb_top.cpu.l2t5.ic_row2.panel1.array.valid, 
	     tb_top.cpu.l2t5.ic_row2.panel2.array.addr_array, 
	     tb_top.cpu.l2t5.ic_row2.panel2.array.valid, 
	     tb_top.cpu.l2t5.ic_row2.panel3.array.addr_array, 
	     tb_top.cpu.l2t5.ic_row2.panel3.array.valid, 

	     tb_top.cpu.l2t6.ic_row0.panel0.array.addr_array, 
	     tb_top.cpu.l2t6.ic_row0.panel0.array.valid, 
	     tb_top.cpu.l2t6.ic_row0.panel1.array.addr_array, 
	     tb_top.cpu.l2t6.ic_row0.panel1.array.valid, 
	     tb_top.cpu.l2t6.ic_row0.panel2.array.addr_array, 
	     tb_top.cpu.l2t6.ic_row0.panel2.array.valid, 
	     tb_top.cpu.l2t6.ic_row0.panel3.array.addr_array, 
	     tb_top.cpu.l2t6.ic_row0.panel3.array.valid, 

	     tb_top.cpu.l2t6.ic_row2.panel0.array.addr_array, 
	     tb_top.cpu.l2t6.ic_row2.panel0.array.valid, 
	     tb_top.cpu.l2t6.ic_row2.panel1.array.addr_array, 
	     tb_top.cpu.l2t6.ic_row2.panel1.array.valid, 
	     tb_top.cpu.l2t6.ic_row2.panel2.array.addr_array, 
	     tb_top.cpu.l2t6.ic_row2.panel2.array.valid, 
	     tb_top.cpu.l2t6.ic_row2.panel3.array.addr_array, 
	     tb_top.cpu.l2t6.ic_row2.panel3.array.valid, 

	     tb_top.cpu.l2t7.ic_row0.panel0.array.addr_array, 
	     tb_top.cpu.l2t7.ic_row0.panel0.array.valid, 
	     tb_top.cpu.l2t7.ic_row0.panel1.array.addr_array, 
	     tb_top.cpu.l2t7.ic_row0.panel1.array.valid, 
	     tb_top.cpu.l2t7.ic_row0.panel2.array.addr_array, 
	     tb_top.cpu.l2t7.ic_row0.panel2.array.valid, 
	     tb_top.cpu.l2t7.ic_row0.panel3.array.addr_array, 
	     tb_top.cpu.l2t7.ic_row0.panel3.array.valid, 

	     tb_top.cpu.l2t7.ic_row2.panel0.array.addr_array, 
	     tb_top.cpu.l2t7.ic_row2.panel0.array.valid, 
	     tb_top.cpu.l2t7.ic_row2.panel1.array.addr_array, 
	     tb_top.cpu.l2t7.ic_row2.panel1.array.valid, 
	     tb_top.cpu.l2t7.ic_row2.panel2.array.addr_array, 
	     tb_top.cpu.l2t7.ic_row2.panel2.array.valid, 
	     tb_top.cpu.l2t7.ic_row2.panel3.array.addr_array, 
	     tb_top.cpu.l2t7.ic_row2.panel3.array.valid

	);

	for (bank = 0; bank < 8; bank = bank + 1)
	begin  //{
	    dc_err = 0;
	    ic_err = 0;
	    exc_err = 0;
 	   `PR_INFO("global_chkr", 22, "Bank%0d calling global_chkr_cmp_l2_dir pli.", bank);
            $global_chkr_cmp_l1_data(bank, dc_err, ic_err, exc_err);
	    if (dc_err)
	    begin  
	       bank_err = bank_err + 1;
               `PR_ALWAYS("global_chkr", `ALWAYS, "L2$ Bank %0d: D data mismatch with L1 # 0f mismatches=%d", bank, dc_err);
	    end 
	    if (ic_err)
	    begin 
	       bank_err = bank_err + 1;
               `PR_ALWAYS("global_chkr", `ALWAYS, "L2$ Bank %0d: I data mismatch with L1 # 0f mismatches=%d", bank, ic_err);
	    end 
	    if (exc_err)
	    begin 
	       bank_err = bank_err + 1;
               `PR_ALWAYS("global_chkr", `ALWAYS, "L2$ Bank %0d: I$-D$ mutual exclusion violation. # 0f mismatches=%d", bank, exc_err);
	    end 
        end //}
	if (bank_err)
	`PR_ERROR("global_chkr", `ERROR, "L2 L1$ data mismatch. Pl. run simulation with plusarg gchkr_debug, -vcs_run_args=+show_pa and -vcs_run_args=+ccxPktPrint=spc for more info.");

end  //}

`endif
`endif
`endif
`endif
`endif

endmodule
