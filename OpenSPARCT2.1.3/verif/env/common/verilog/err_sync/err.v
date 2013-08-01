// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: err.v
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
`ifdef CORE_0



module err_c0t0 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 0;
assign mytid = 0;
assign   mytnum = 0*8 + 0;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC0.l2clk) ;
	@(posedge `SPC0.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_0  `SPC0.tlu.ras.dsfsr_0_new_in
`define ISFSR_NEW_IN_0 `SPC0.tlu.ras.isfsr_0_new_in

`define DSFSR_0 `SPC0.tlu.ras.dsfsr_0
`define ISFSR_0 `SPC0.tlu.ras.isfsr_0
`define DSFAR_0 `SPC0.tlu.dfd.dsfar_0

`define ASI_WR_DSFSR_0 `SPC0.tlu.ras.asi_wr_dsfsr[0]
`define ASI_WR_ISFSR_0 `SPC0.tlu.ras.asi_wr_isfsr[0]

`define RAS_WRITE_DESR_1st_0  `SPC0.tlu.dfd.ras_write_desr_1st[0]
`define RAS_WRITE_DESR_2nd_0  `SPC0.tlu.dfd.ras_write_desr_2nd[0]
`define DESR_asi_rd_0  `SPC0.tlu.ras_rd_desr[0]
`define DESR_0  `SPC0.tlu.dfd.desr_0

`define RAS_WRITE_FESR_0  `SPC0.tlu.ras.write_fesr[0]
`define FESR_0  `SPC0.tlu.dfd.fesr_0

`define ST_ERR_0  `SPC0.tlu.trl0.take_ftt & `SPC0.tlu.trl0.trap[0]
`define SW_REC_ERR_0  `SPC0.tlu.trl0.take_ade & `SPC0.tlu.trl0.trap[0]
`define DATA_ACC_ERR_0  `SPC0.tlu.trl0.take_dae & `SPC0.tlu.trl0.trap[0]
`define INST_ACC_ERR_0  `SPC0.tlu.trl0.take_iae & `SPC0.tlu.trl0.trap[0]
`define INT_PROC_ERR_0  `SPC0.tlu.trl0.take_ipe & `SPC0.tlu.trl0.trap[0]
`define HW_CORR_ERR_0  `SPC0.tlu.trl0.take_eer & `SPC0.tlu.trl0.trap[0]
`define INST_ACC_MMU_ERR_0  `SPC0.tlu.trl0.take_ime & `SPC0.tlu.trl0.trap[0]
`define DATA_ACC_MMU_ERR_0  `SPC0.tlu.trl0.take_dme & `SPC0.tlu.trl0.trap[0]

`define LSU_LD_VALID_B	`PROBES0.lsu_ld_valid
`define LSU_TID_DEC_B_0 `PROBES0.lsu_tid_dec_b[0]
`define ASI_LD_0	`SPC0.lsu.lmd.lmq0_pkt[60] & (`SPC0.lsu.lmd.lmq0_pkt[49:48] == 2'b0)
`define ASI_0	`SPC0.lsu.lmd.lmq0_pkt[47:40]
`define ASI_ADDR_0	`SPC0.lsu.lmd.lmq0_pkt[39:0]
`define ASI_LD_DATA_0	`SPC0.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_0	tb_top.nas_top.c0.t0.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_0	`SPC0.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_0	`SPC0.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC0.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_0)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_0[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_0  != 4'b0) && ~`ASI_WR_DSFSR_0;
        update_isfsr_w <= (`ISFSR_NEW_IN_0  != 3'b0) && ~`ASI_WR_ISFSR_0;
        desr_wr <=  (`RAS_WRITE_DESR_1st_0  || `RAS_WRITE_DESR_2nd_0);
        update_dfesr_w <= `RAS_WRITE_FESR_0;
        take_err_trap_fx4 <= `ST_ERR_0 | `SW_REC_ERR_0  | `DATA_ACC_ERR_0
                           | `INST_ACC_ERR_0 | `INT_PROC_ERR_0
                           | `HW_CORR_ERR_0 | `INST_ACC_MMU_ERR_0
                           | `DATA_ACC_MMU_ERR_0 ;


        if (`ST_ERR_0) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_0) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_0) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_0) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_0) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_0) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_0) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_0) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_0[63:56], 45'b0, `DESR_0[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_0[63:56], 45'b0, `DESR_0[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_0)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_0[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_0[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_0[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_0[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_0[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_0[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC0.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_0;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_0)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_0)
	begin
	     case (`ASI_0)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_0 >= 0) &  (`ASI_ADDR_0 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_0 >= 0) &  (`ASI_ADDR_0 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_0 >= 0) &  (`ASI_ADDR_0 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_0 >= 0) &  (`ASI_ADDR_0 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_0 >= 0) &  (`ASI_ADDR_0 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_0 >= 0) &  (`ASI_ADDR_0 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_0 >= 0) &  (`ASI_ADDR_0 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_0 >= 0) &  (`ASI_ADDR_0 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_0 >= 0) &  (`ASI_ADDR_0 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_0 >= 0) &  (`ASI_ADDR_0 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC0.lsu.lmd.lmq0_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_0 == 40'h20) ||  (`ASI_ADDR_0 == 40'h30)
			     || (`ASI_ADDR_0 == 40'h80)  
				 || ((`ASI_ADDR_0 == 40'ha0) & (`SPU_MA_BUSY_0 == 0) & (`SPU_MA_TID_0 == 0))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_0 == 40'h20) ||  (`ASI_ADDR_0 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_0, `ASI_ADDR_0, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_0, {24'b0, `ASI_ADDR_0}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c0t1 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 0;
assign mytid = 1;
assign   mytnum = 0*8 + 1;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC0.l2clk) ;
	@(posedge `SPC0.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_1  `SPC0.tlu.ras.dsfsr_1_new_in
`define ISFSR_NEW_IN_1 `SPC0.tlu.ras.isfsr_1_new_in

`define DSFSR_1 `SPC0.tlu.ras.dsfsr_1
`define ISFSR_1 `SPC0.tlu.ras.isfsr_1
`define DSFAR_1 `SPC0.tlu.dfd.dsfar_1

`define ASI_WR_DSFSR_1 `SPC0.tlu.ras.asi_wr_dsfsr[1]
`define ASI_WR_ISFSR_1 `SPC0.tlu.ras.asi_wr_isfsr[1]

`define RAS_WRITE_DESR_1st_1  `SPC0.tlu.dfd.ras_write_desr_1st[1]
`define RAS_WRITE_DESR_2nd_1  `SPC0.tlu.dfd.ras_write_desr_2nd[1]
`define DESR_asi_rd_1  `SPC0.tlu.ras_rd_desr[1]
`define DESR_1  `SPC0.tlu.dfd.desr_1

`define RAS_WRITE_FESR_1  `SPC0.tlu.ras.write_fesr[1]
`define FESR_1  `SPC0.tlu.dfd.fesr_1

`define ST_ERR_1  `SPC0.tlu.trl0.take_ftt & `SPC0.tlu.trl0.trap[1]
`define SW_REC_ERR_1  `SPC0.tlu.trl0.take_ade & `SPC0.tlu.trl0.trap[1]
`define DATA_ACC_ERR_1  `SPC0.tlu.trl0.take_dae & `SPC0.tlu.trl0.trap[1]
`define INST_ACC_ERR_1  `SPC0.tlu.trl0.take_iae & `SPC0.tlu.trl0.trap[1]
`define INT_PROC_ERR_1  `SPC0.tlu.trl0.take_ipe & `SPC0.tlu.trl0.trap[1]
`define HW_CORR_ERR_1  `SPC0.tlu.trl0.take_eer & `SPC0.tlu.trl0.trap[1]
`define INST_ACC_MMU_ERR_1  `SPC0.tlu.trl0.take_ime & `SPC0.tlu.trl0.trap[1]
`define DATA_ACC_MMU_ERR_1  `SPC0.tlu.trl0.take_dme & `SPC0.tlu.trl0.trap[1]

`define LSU_LD_VALID_B	`PROBES0.lsu_ld_valid
`define LSU_TID_DEC_B_1 `PROBES0.lsu_tid_dec_b[1]
`define ASI_LD_1	`SPC0.lsu.lmd.lmq1_pkt[60] & (`SPC0.lsu.lmd.lmq1_pkt[49:48] == 2'b0)
`define ASI_1	`SPC0.lsu.lmd.lmq1_pkt[47:40]
`define ASI_ADDR_1	`SPC0.lsu.lmd.lmq1_pkt[39:0]
`define ASI_LD_DATA_1	`SPC0.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_1	tb_top.nas_top.c0.t1.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_0	`SPC0.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_0	`SPC0.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC0.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_1)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_1[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_1  != 4'b0) && ~`ASI_WR_DSFSR_1;
        update_isfsr_w <= (`ISFSR_NEW_IN_1  != 3'b0) && ~`ASI_WR_ISFSR_1;
        desr_wr <=  (`RAS_WRITE_DESR_1st_1  || `RAS_WRITE_DESR_2nd_1);
        update_dfesr_w <= `RAS_WRITE_FESR_1;
        take_err_trap_fx4 <= `ST_ERR_1 | `SW_REC_ERR_1  | `DATA_ACC_ERR_1
                           | `INST_ACC_ERR_1 | `INT_PROC_ERR_1
                           | `HW_CORR_ERR_1 | `INST_ACC_MMU_ERR_1
                           | `DATA_ACC_MMU_ERR_1 ;


        if (`ST_ERR_1) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_1) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_1) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_1) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_1) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_1) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_1) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_1) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_1[63:56], 45'b0, `DESR_1[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_1[63:56], 45'b0, `DESR_1[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_1)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_1[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_1[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_1[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_1[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_1[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_1[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC0.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_1;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_1)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_1)
	begin
	     case (`ASI_1)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_1 >= 0) &  (`ASI_ADDR_1 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_1 >= 0) &  (`ASI_ADDR_1 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_1 >= 0) &  (`ASI_ADDR_1 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_1 >= 0) &  (`ASI_ADDR_1 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_1 >= 0) &  (`ASI_ADDR_1 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_1 >= 0) &  (`ASI_ADDR_1 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_1 >= 0) &  (`ASI_ADDR_1 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_1 >= 0) &  (`ASI_ADDR_1 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_1 >= 0) &  (`ASI_ADDR_1 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_1 >= 0) &  (`ASI_ADDR_1 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC0.lsu.lmd.lmq1_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_1 == 40'h20) ||  (`ASI_ADDR_1 == 40'h30)
			     || (`ASI_ADDR_1 == 40'h80)  
				 || ((`ASI_ADDR_1 == 40'ha0) & (`SPU_MA_BUSY_0 == 0) & (`SPU_MA_TID_0 == 1))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_1 == 40'h20) ||  (`ASI_ADDR_1 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_1, `ASI_ADDR_1, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_1, {24'b0, `ASI_ADDR_1}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c0t2 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 0;
assign mytid = 2;
assign   mytnum = 0*8 + 2;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC0.l2clk) ;
	@(posedge `SPC0.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_2  `SPC0.tlu.ras.dsfsr_2_new_in
`define ISFSR_NEW_IN_2 `SPC0.tlu.ras.isfsr_2_new_in

`define DSFSR_2 `SPC0.tlu.ras.dsfsr_2
`define ISFSR_2 `SPC0.tlu.ras.isfsr_2
`define DSFAR_2 `SPC0.tlu.dfd.dsfar_2

`define ASI_WR_DSFSR_2 `SPC0.tlu.ras.asi_wr_dsfsr[2]
`define ASI_WR_ISFSR_2 `SPC0.tlu.ras.asi_wr_isfsr[2]

`define RAS_WRITE_DESR_1st_2  `SPC0.tlu.dfd.ras_write_desr_1st[2]
`define RAS_WRITE_DESR_2nd_2  `SPC0.tlu.dfd.ras_write_desr_2nd[2]
`define DESR_asi_rd_2  `SPC0.tlu.ras_rd_desr[2]
`define DESR_2  `SPC0.tlu.dfd.desr_2

`define RAS_WRITE_FESR_2  `SPC0.tlu.ras.write_fesr[2]
`define FESR_2  `SPC0.tlu.dfd.fesr_2

`define ST_ERR_2  `SPC0.tlu.trl0.take_ftt & `SPC0.tlu.trl0.trap[2]
`define SW_REC_ERR_2  `SPC0.tlu.trl0.take_ade & `SPC0.tlu.trl0.trap[2]
`define DATA_ACC_ERR_2  `SPC0.tlu.trl0.take_dae & `SPC0.tlu.trl0.trap[2]
`define INST_ACC_ERR_2  `SPC0.tlu.trl0.take_iae & `SPC0.tlu.trl0.trap[2]
`define INT_PROC_ERR_2  `SPC0.tlu.trl0.take_ipe & `SPC0.tlu.trl0.trap[2]
`define HW_CORR_ERR_2  `SPC0.tlu.trl0.take_eer & `SPC0.tlu.trl0.trap[2]
`define INST_ACC_MMU_ERR_2  `SPC0.tlu.trl0.take_ime & `SPC0.tlu.trl0.trap[2]
`define DATA_ACC_MMU_ERR_2  `SPC0.tlu.trl0.take_dme & `SPC0.tlu.trl0.trap[2]

`define LSU_LD_VALID_B	`PROBES0.lsu_ld_valid
`define LSU_TID_DEC_B_2 `PROBES0.lsu_tid_dec_b[2]
`define ASI_LD_2	`SPC0.lsu.lmd.lmq2_pkt[60] & (`SPC0.lsu.lmd.lmq2_pkt[49:48] == 2'b0)
`define ASI_2	`SPC0.lsu.lmd.lmq2_pkt[47:40]
`define ASI_ADDR_2	`SPC0.lsu.lmd.lmq2_pkt[39:0]
`define ASI_LD_DATA_2	`SPC0.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_2	tb_top.nas_top.c0.t2.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_0	`SPC0.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_0	`SPC0.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC0.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_2)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_2[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_2  != 4'b0) && ~`ASI_WR_DSFSR_2;
        update_isfsr_w <= (`ISFSR_NEW_IN_2  != 3'b0) && ~`ASI_WR_ISFSR_2;
        desr_wr <=  (`RAS_WRITE_DESR_1st_2  || `RAS_WRITE_DESR_2nd_2);
        update_dfesr_w <= `RAS_WRITE_FESR_2;
        take_err_trap_fx4 <= `ST_ERR_2 | `SW_REC_ERR_2  | `DATA_ACC_ERR_2
                           | `INST_ACC_ERR_2 | `INT_PROC_ERR_2
                           | `HW_CORR_ERR_2 | `INST_ACC_MMU_ERR_2
                           | `DATA_ACC_MMU_ERR_2 ;


        if (`ST_ERR_2) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_2) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_2) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_2) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_2) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_2) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_2) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_2) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_2[63:56], 45'b0, `DESR_2[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_2[63:56], 45'b0, `DESR_2[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_2[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_2[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_2[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_2[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_2[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_2[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC0.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_2;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_2)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_2)
	begin
	     case (`ASI_2)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_2 >= 0) &  (`ASI_ADDR_2 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_2 >= 0) &  (`ASI_ADDR_2 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_2 >= 0) &  (`ASI_ADDR_2 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_2 >= 0) &  (`ASI_ADDR_2 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_2 >= 0) &  (`ASI_ADDR_2 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_2 >= 0) &  (`ASI_ADDR_2 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_2 >= 0) &  (`ASI_ADDR_2 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_2 >= 0) &  (`ASI_ADDR_2 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_2 >= 0) &  (`ASI_ADDR_2 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_2 >= 0) &  (`ASI_ADDR_2 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC0.lsu.lmd.lmq2_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_2 == 40'h20) ||  (`ASI_ADDR_2 == 40'h30)
			     || (`ASI_ADDR_2 == 40'h80)  
				 || ((`ASI_ADDR_2 == 40'ha0) & (`SPU_MA_BUSY_0 == 0) & (`SPU_MA_TID_0 == 2))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_2 == 40'h20) ||  (`ASI_ADDR_2 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_2, `ASI_ADDR_2, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_2, {24'b0, `ASI_ADDR_2}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c0t3 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 0;
assign mytid = 3;
assign   mytnum = 0*8 + 3;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC0.l2clk) ;
	@(posedge `SPC0.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_3  `SPC0.tlu.ras.dsfsr_3_new_in
`define ISFSR_NEW_IN_3 `SPC0.tlu.ras.isfsr_3_new_in

`define DSFSR_3 `SPC0.tlu.ras.dsfsr_3
`define ISFSR_3 `SPC0.tlu.ras.isfsr_3
`define DSFAR_3 `SPC0.tlu.dfd.dsfar_3

`define ASI_WR_DSFSR_3 `SPC0.tlu.ras.asi_wr_dsfsr[3]
`define ASI_WR_ISFSR_3 `SPC0.tlu.ras.asi_wr_isfsr[3]

`define RAS_WRITE_DESR_1st_3  `SPC0.tlu.dfd.ras_write_desr_1st[3]
`define RAS_WRITE_DESR_2nd_3  `SPC0.tlu.dfd.ras_write_desr_2nd[3]
`define DESR_asi_rd_3  `SPC0.tlu.ras_rd_desr[3]
`define DESR_3  `SPC0.tlu.dfd.desr_3

`define RAS_WRITE_FESR_3  `SPC0.tlu.ras.write_fesr[3]
`define FESR_3  `SPC0.tlu.dfd.fesr_3

`define ST_ERR_3  `SPC0.tlu.trl0.take_ftt & `SPC0.tlu.trl0.trap[3]
`define SW_REC_ERR_3  `SPC0.tlu.trl0.take_ade & `SPC0.tlu.trl0.trap[3]
`define DATA_ACC_ERR_3  `SPC0.tlu.trl0.take_dae & `SPC0.tlu.trl0.trap[3]
`define INST_ACC_ERR_3  `SPC0.tlu.trl0.take_iae & `SPC0.tlu.trl0.trap[3]
`define INT_PROC_ERR_3  `SPC0.tlu.trl0.take_ipe & `SPC0.tlu.trl0.trap[3]
`define HW_CORR_ERR_3  `SPC0.tlu.trl0.take_eer & `SPC0.tlu.trl0.trap[3]
`define INST_ACC_MMU_ERR_3  `SPC0.tlu.trl0.take_ime & `SPC0.tlu.trl0.trap[3]
`define DATA_ACC_MMU_ERR_3  `SPC0.tlu.trl0.take_dme & `SPC0.tlu.trl0.trap[3]

`define LSU_LD_VALID_B	`PROBES0.lsu_ld_valid
`define LSU_TID_DEC_B_3 `PROBES0.lsu_tid_dec_b[3]
`define ASI_LD_3	`SPC0.lsu.lmd.lmq3_pkt[60] & (`SPC0.lsu.lmd.lmq3_pkt[49:48] == 2'b0)
`define ASI_3	`SPC0.lsu.lmd.lmq3_pkt[47:40]
`define ASI_ADDR_3	`SPC0.lsu.lmd.lmq3_pkt[39:0]
`define ASI_LD_DATA_3	`SPC0.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_3	tb_top.nas_top.c0.t3.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_0	`SPC0.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_0	`SPC0.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC0.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_3)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_3[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_3  != 4'b0) && ~`ASI_WR_DSFSR_3;
        update_isfsr_w <= (`ISFSR_NEW_IN_3  != 3'b0) && ~`ASI_WR_ISFSR_3;
        desr_wr <=  (`RAS_WRITE_DESR_1st_3  || `RAS_WRITE_DESR_2nd_3);
        update_dfesr_w <= `RAS_WRITE_FESR_3;
        take_err_trap_fx4 <= `ST_ERR_3 | `SW_REC_ERR_3  | `DATA_ACC_ERR_3
                           | `INST_ACC_ERR_3 | `INT_PROC_ERR_3
                           | `HW_CORR_ERR_3 | `INST_ACC_MMU_ERR_3
                           | `DATA_ACC_MMU_ERR_3 ;


        if (`ST_ERR_3) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_3) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_3) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_3) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_3) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_3) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_3) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_3) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_3[63:56], 45'b0, `DESR_3[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_3[63:56], 45'b0, `DESR_3[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_3)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_3[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_3[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_3[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_3[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_3[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_3[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC0.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_3;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_3)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_3)
	begin
	     case (`ASI_3)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_3 >= 0) &  (`ASI_ADDR_3 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_3 >= 0) &  (`ASI_ADDR_3 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_3 >= 0) &  (`ASI_ADDR_3 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_3 >= 0) &  (`ASI_ADDR_3 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_3 >= 0) &  (`ASI_ADDR_3 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_3 >= 0) &  (`ASI_ADDR_3 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_3 >= 0) &  (`ASI_ADDR_3 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_3 >= 0) &  (`ASI_ADDR_3 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_3 >= 0) &  (`ASI_ADDR_3 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_3 >= 0) &  (`ASI_ADDR_3 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC0.lsu.lmd.lmq3_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_3 == 40'h20) ||  (`ASI_ADDR_3 == 40'h30)
			     || (`ASI_ADDR_3 == 40'h80)  
				 || ((`ASI_ADDR_3 == 40'ha0) & (`SPU_MA_BUSY_0 == 0) & (`SPU_MA_TID_0 == 3))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_3 == 40'h20) ||  (`ASI_ADDR_3 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_3, `ASI_ADDR_3, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_3, {24'b0, `ASI_ADDR_3}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c0t4 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 0;
assign mytid = 4;
assign   mytnum = 0*8 + 4;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC0.l2clk) ;
	@(posedge `SPC0.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_4  `SPC0.tlu.ras.dsfsr_4_new_in
`define ISFSR_NEW_IN_4 `SPC0.tlu.ras.isfsr_4_new_in

`define DSFSR_4 `SPC0.tlu.ras.dsfsr_4
`define ISFSR_4 `SPC0.tlu.ras.isfsr_4
`define DSFAR_4 `SPC0.tlu.dfd.dsfar_4

`define ASI_WR_DSFSR_4 `SPC0.tlu.ras.asi_wr_dsfsr[4]
`define ASI_WR_ISFSR_4 `SPC0.tlu.ras.asi_wr_isfsr[4]

`define RAS_WRITE_DESR_1st_4  `SPC0.tlu.dfd.ras_write_desr_1st[4]
`define RAS_WRITE_DESR_2nd_4  `SPC0.tlu.dfd.ras_write_desr_2nd[4]
`define DESR_asi_rd_4  `SPC0.tlu.ras_rd_desr[4]
`define DESR_4  `SPC0.tlu.dfd.desr_4

`define RAS_WRITE_FESR_4  `SPC0.tlu.ras.write_fesr[4]
`define FESR_4  `SPC0.tlu.dfd.fesr_4

`define ST_ERR_4  `SPC0.tlu.trl1.take_ftt & `SPC0.tlu.trl1.trap[0]
`define SW_REC_ERR_4  `SPC0.tlu.trl1.take_ade & `SPC0.tlu.trl1.trap[0]
`define DATA_ACC_ERR_4  `SPC0.tlu.trl1.take_dae & `SPC0.tlu.trl1.trap[0]
`define INST_ACC_ERR_4  `SPC0.tlu.trl1.take_iae & `SPC0.tlu.trl1.trap[0]
`define INT_PROC_ERR_4  `SPC0.tlu.trl1.take_ipe & `SPC0.tlu.trl1.trap[0]
`define HW_CORR_ERR_4  `SPC0.tlu.trl1.take_eer & `SPC0.tlu.trl1.trap[0]
`define INST_ACC_MMU_ERR_4  `SPC0.tlu.trl1.take_ime & `SPC0.tlu.trl1.trap[0]
`define DATA_ACC_MMU_ERR_4  `SPC0.tlu.trl1.take_dme & `SPC0.tlu.trl1.trap[0]

`define LSU_LD_VALID_B	`PROBES0.lsu_ld_valid
`define LSU_TID_DEC_B_4 `PROBES0.lsu_tid_dec_b[4]
`define ASI_LD_4	`SPC0.lsu.lmd.lmq4_pkt[60] & (`SPC0.lsu.lmd.lmq4_pkt[49:48] == 2'b0)
`define ASI_4	`SPC0.lsu.lmd.lmq4_pkt[47:40]
`define ASI_ADDR_4	`SPC0.lsu.lmd.lmq4_pkt[39:0]
`define ASI_LD_DATA_4	`SPC0.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_4	tb_top.nas_top.c0.t4.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_0	`SPC0.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_0	`SPC0.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC0.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_4)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_4[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_4  != 4'b0) && ~`ASI_WR_DSFSR_4;
        update_isfsr_w <= (`ISFSR_NEW_IN_4  != 3'b0) && ~`ASI_WR_ISFSR_4;
        desr_wr <=  (`RAS_WRITE_DESR_1st_4  || `RAS_WRITE_DESR_2nd_4);
        update_dfesr_w <= `RAS_WRITE_FESR_4;
        take_err_trap_fx4 <= `ST_ERR_4 | `SW_REC_ERR_4  | `DATA_ACC_ERR_4
                           | `INST_ACC_ERR_4 | `INT_PROC_ERR_4
                           | `HW_CORR_ERR_4 | `INST_ACC_MMU_ERR_4
                           | `DATA_ACC_MMU_ERR_4 ;


        if (`ST_ERR_4) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_4) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_4) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_4) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_4) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_4) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_4) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_4) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_4[63:56], 45'b0, `DESR_4[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_4[63:56], 45'b0, `DESR_4[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_4)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_4[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_4[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_4[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_4[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_4[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_4[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC0.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_4;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_4)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_4)
	begin
	     case (`ASI_4)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_4 >= 0) &  (`ASI_ADDR_4 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_4 >= 0) &  (`ASI_ADDR_4 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_4 >= 0) &  (`ASI_ADDR_4 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_4 >= 0) &  (`ASI_ADDR_4 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_4 >= 0) &  (`ASI_ADDR_4 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_4 >= 0) &  (`ASI_ADDR_4 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_4 >= 0) &  (`ASI_ADDR_4 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_4 >= 0) &  (`ASI_ADDR_4 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_4 >= 0) &  (`ASI_ADDR_4 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_4 >= 0) &  (`ASI_ADDR_4 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC0.lsu.lmd.lmq4_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_4 == 40'h20) ||  (`ASI_ADDR_4 == 40'h30)
			     || (`ASI_ADDR_4 == 40'h80)  
				 || ((`ASI_ADDR_4 == 40'ha0) & (`SPU_MA_BUSY_0 == 0) & (`SPU_MA_TID_0 == 4))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_4 == 40'h20) ||  (`ASI_ADDR_4 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_4, `ASI_ADDR_4, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_4, {24'b0, `ASI_ADDR_4}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c0t5 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 0;
assign mytid = 5;
assign   mytnum = 0*8 + 5;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC0.l2clk) ;
	@(posedge `SPC0.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_5  `SPC0.tlu.ras.dsfsr_5_new_in
`define ISFSR_NEW_IN_5 `SPC0.tlu.ras.isfsr_5_new_in

`define DSFSR_5 `SPC0.tlu.ras.dsfsr_5
`define ISFSR_5 `SPC0.tlu.ras.isfsr_5
`define DSFAR_5 `SPC0.tlu.dfd.dsfar_5

`define ASI_WR_DSFSR_5 `SPC0.tlu.ras.asi_wr_dsfsr[5]
`define ASI_WR_ISFSR_5 `SPC0.tlu.ras.asi_wr_isfsr[5]

`define RAS_WRITE_DESR_1st_5  `SPC0.tlu.dfd.ras_write_desr_1st[5]
`define RAS_WRITE_DESR_2nd_5  `SPC0.tlu.dfd.ras_write_desr_2nd[5]
`define DESR_asi_rd_5  `SPC0.tlu.ras_rd_desr[5]
`define DESR_5  `SPC0.tlu.dfd.desr_5

`define RAS_WRITE_FESR_5  `SPC0.tlu.ras.write_fesr[5]
`define FESR_5  `SPC0.tlu.dfd.fesr_5

`define ST_ERR_5  `SPC0.tlu.trl1.take_ftt & `SPC0.tlu.trl1.trap[1]
`define SW_REC_ERR_5  `SPC0.tlu.trl1.take_ade & `SPC0.tlu.trl1.trap[1]
`define DATA_ACC_ERR_5  `SPC0.tlu.trl1.take_dae & `SPC0.tlu.trl1.trap[1]
`define INST_ACC_ERR_5  `SPC0.tlu.trl1.take_iae & `SPC0.tlu.trl1.trap[1]
`define INT_PROC_ERR_5  `SPC0.tlu.trl1.take_ipe & `SPC0.tlu.trl1.trap[1]
`define HW_CORR_ERR_5  `SPC0.tlu.trl1.take_eer & `SPC0.tlu.trl1.trap[1]
`define INST_ACC_MMU_ERR_5  `SPC0.tlu.trl1.take_ime & `SPC0.tlu.trl1.trap[1]
`define DATA_ACC_MMU_ERR_5  `SPC0.tlu.trl1.take_dme & `SPC0.tlu.trl1.trap[1]

`define LSU_LD_VALID_B	`PROBES0.lsu_ld_valid
`define LSU_TID_DEC_B_5 `PROBES0.lsu_tid_dec_b[5]
`define ASI_LD_5	`SPC0.lsu.lmd.lmq5_pkt[60] & (`SPC0.lsu.lmd.lmq5_pkt[49:48] == 2'b0)
`define ASI_5	`SPC0.lsu.lmd.lmq5_pkt[47:40]
`define ASI_ADDR_5	`SPC0.lsu.lmd.lmq5_pkt[39:0]
`define ASI_LD_DATA_5	`SPC0.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_5	tb_top.nas_top.c0.t5.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_0	`SPC0.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_0	`SPC0.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC0.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_5)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_5[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_5  != 4'b0) && ~`ASI_WR_DSFSR_5;
        update_isfsr_w <= (`ISFSR_NEW_IN_5  != 3'b0) && ~`ASI_WR_ISFSR_5;
        desr_wr <=  (`RAS_WRITE_DESR_1st_5  || `RAS_WRITE_DESR_2nd_5);
        update_dfesr_w <= `RAS_WRITE_FESR_5;
        take_err_trap_fx4 <= `ST_ERR_5 | `SW_REC_ERR_5  | `DATA_ACC_ERR_5
                           | `INST_ACC_ERR_5 | `INT_PROC_ERR_5
                           | `HW_CORR_ERR_5 | `INST_ACC_MMU_ERR_5
                           | `DATA_ACC_MMU_ERR_5 ;


        if (`ST_ERR_5) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_5) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_5) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_5) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_5) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_5) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_5) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_5) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_5[63:56], 45'b0, `DESR_5[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_5[63:56], 45'b0, `DESR_5[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_5)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_5[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_5[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_5[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_5[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_5[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_5[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC0.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_5;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_5)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_5)
	begin
	     case (`ASI_5)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_5 >= 0) &  (`ASI_ADDR_5 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_5 >= 0) &  (`ASI_ADDR_5 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_5 >= 0) &  (`ASI_ADDR_5 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_5 >= 0) &  (`ASI_ADDR_5 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_5 >= 0) &  (`ASI_ADDR_5 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_5 >= 0) &  (`ASI_ADDR_5 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_5 >= 0) &  (`ASI_ADDR_5 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_5 >= 0) &  (`ASI_ADDR_5 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_5 >= 0) &  (`ASI_ADDR_5 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_5 >= 0) &  (`ASI_ADDR_5 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC0.lsu.lmd.lmq5_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_5 == 40'h20) ||  (`ASI_ADDR_5 == 40'h30)
			     || (`ASI_ADDR_5 == 40'h80)  
				 || ((`ASI_ADDR_5 == 40'ha0) & (`SPU_MA_BUSY_0 == 0) & (`SPU_MA_TID_0 == 5))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_5 == 40'h20) ||  (`ASI_ADDR_5 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_5, `ASI_ADDR_5, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_5, {24'b0, `ASI_ADDR_5}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c0t6 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 0;
assign mytid = 6;
assign   mytnum = 0*8 + 6;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC0.l2clk) ;
	@(posedge `SPC0.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_6  `SPC0.tlu.ras.dsfsr_6_new_in
`define ISFSR_NEW_IN_6 `SPC0.tlu.ras.isfsr_6_new_in

`define DSFSR_6 `SPC0.tlu.ras.dsfsr_6
`define ISFSR_6 `SPC0.tlu.ras.isfsr_6
`define DSFAR_6 `SPC0.tlu.dfd.dsfar_6

`define ASI_WR_DSFSR_6 `SPC0.tlu.ras.asi_wr_dsfsr[6]
`define ASI_WR_ISFSR_6 `SPC0.tlu.ras.asi_wr_isfsr[6]

`define RAS_WRITE_DESR_1st_6  `SPC0.tlu.dfd.ras_write_desr_1st[6]
`define RAS_WRITE_DESR_2nd_6  `SPC0.tlu.dfd.ras_write_desr_2nd[6]
`define DESR_asi_rd_6  `SPC0.tlu.ras_rd_desr[6]
`define DESR_6  `SPC0.tlu.dfd.desr_6

`define RAS_WRITE_FESR_6  `SPC0.tlu.ras.write_fesr[6]
`define FESR_6  `SPC0.tlu.dfd.fesr_6

`define ST_ERR_6  `SPC0.tlu.trl1.take_ftt & `SPC0.tlu.trl1.trap[2]
`define SW_REC_ERR_6  `SPC0.tlu.trl1.take_ade & `SPC0.tlu.trl1.trap[2]
`define DATA_ACC_ERR_6  `SPC0.tlu.trl1.take_dae & `SPC0.tlu.trl1.trap[2]
`define INST_ACC_ERR_6  `SPC0.tlu.trl1.take_iae & `SPC0.tlu.trl1.trap[2]
`define INT_PROC_ERR_6  `SPC0.tlu.trl1.take_ipe & `SPC0.tlu.trl1.trap[2]
`define HW_CORR_ERR_6  `SPC0.tlu.trl1.take_eer & `SPC0.tlu.trl1.trap[2]
`define INST_ACC_MMU_ERR_6  `SPC0.tlu.trl1.take_ime & `SPC0.tlu.trl1.trap[2]
`define DATA_ACC_MMU_ERR_6  `SPC0.tlu.trl1.take_dme & `SPC0.tlu.trl1.trap[2]

`define LSU_LD_VALID_B	`PROBES0.lsu_ld_valid
`define LSU_TID_DEC_B_6 `PROBES0.lsu_tid_dec_b[6]
`define ASI_LD_6	`SPC0.lsu.lmd.lmq6_pkt[60] & (`SPC0.lsu.lmd.lmq6_pkt[49:48] == 2'b0)
`define ASI_6	`SPC0.lsu.lmd.lmq6_pkt[47:40]
`define ASI_ADDR_6	`SPC0.lsu.lmd.lmq6_pkt[39:0]
`define ASI_LD_DATA_6	`SPC0.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_6	tb_top.nas_top.c0.t6.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_0	`SPC0.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_0	`SPC0.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC0.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_6)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_6[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_6  != 4'b0) && ~`ASI_WR_DSFSR_6;
        update_isfsr_w <= (`ISFSR_NEW_IN_6  != 3'b0) && ~`ASI_WR_ISFSR_6;
        desr_wr <=  (`RAS_WRITE_DESR_1st_6  || `RAS_WRITE_DESR_2nd_6);
        update_dfesr_w <= `RAS_WRITE_FESR_6;
        take_err_trap_fx4 <= `ST_ERR_6 | `SW_REC_ERR_6  | `DATA_ACC_ERR_6
                           | `INST_ACC_ERR_6 | `INT_PROC_ERR_6
                           | `HW_CORR_ERR_6 | `INST_ACC_MMU_ERR_6
                           | `DATA_ACC_MMU_ERR_6 ;


        if (`ST_ERR_6) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_6) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_6) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_6) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_6) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_6) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_6) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_6) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_6[63:56], 45'b0, `DESR_6[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_6[63:56], 45'b0, `DESR_6[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_6)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_6[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_6[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_6[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_6[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_6[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_6[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC0.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_6;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_6)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_6)
	begin
	     case (`ASI_6)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_6 >= 0) &  (`ASI_ADDR_6 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_6 >= 0) &  (`ASI_ADDR_6 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_6 >= 0) &  (`ASI_ADDR_6 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_6 >= 0) &  (`ASI_ADDR_6 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_6 >= 0) &  (`ASI_ADDR_6 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_6 >= 0) &  (`ASI_ADDR_6 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_6 >= 0) &  (`ASI_ADDR_6 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_6 >= 0) &  (`ASI_ADDR_6 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_6 >= 0) &  (`ASI_ADDR_6 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_6 >= 0) &  (`ASI_ADDR_6 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC0.lsu.lmd.lmq6_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_6 == 40'h20) ||  (`ASI_ADDR_6 == 40'h30)
			     || (`ASI_ADDR_6 == 40'h80)  
				 || ((`ASI_ADDR_6 == 40'ha0) & (`SPU_MA_BUSY_0 == 0) & (`SPU_MA_TID_0 == 6))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_6 == 40'h20) ||  (`ASI_ADDR_6 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_6, `ASI_ADDR_6, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_6, {24'b0, `ASI_ADDR_6}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c0t7 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 0;
assign mytid = 7;
assign   mytnum = 0*8 + 7;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC0.l2clk) ;
	@(posedge `SPC0.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_7  `SPC0.tlu.ras.dsfsr_7_new_in
`define ISFSR_NEW_IN_7 `SPC0.tlu.ras.isfsr_7_new_in

`define DSFSR_7 `SPC0.tlu.ras.dsfsr_7
`define ISFSR_7 `SPC0.tlu.ras.isfsr_7
`define DSFAR_7 `SPC0.tlu.dfd.dsfar_7

`define ASI_WR_DSFSR_7 `SPC0.tlu.ras.asi_wr_dsfsr[7]
`define ASI_WR_ISFSR_7 `SPC0.tlu.ras.asi_wr_isfsr[7]

`define RAS_WRITE_DESR_1st_7  `SPC0.tlu.dfd.ras_write_desr_1st[7]
`define RAS_WRITE_DESR_2nd_7  `SPC0.tlu.dfd.ras_write_desr_2nd[7]
`define DESR_asi_rd_7  `SPC0.tlu.ras_rd_desr[7]
`define DESR_7  `SPC0.tlu.dfd.desr_7

`define RAS_WRITE_FESR_7  `SPC0.tlu.ras.write_fesr[7]
`define FESR_7  `SPC0.tlu.dfd.fesr_7

`define ST_ERR_7  `SPC0.tlu.trl1.take_ftt & `SPC0.tlu.trl1.trap[3]
`define SW_REC_ERR_7  `SPC0.tlu.trl1.take_ade & `SPC0.tlu.trl1.trap[3]
`define DATA_ACC_ERR_7  `SPC0.tlu.trl1.take_dae & `SPC0.tlu.trl1.trap[3]
`define INST_ACC_ERR_7  `SPC0.tlu.trl1.take_iae & `SPC0.tlu.trl1.trap[3]
`define INT_PROC_ERR_7  `SPC0.tlu.trl1.take_ipe & `SPC0.tlu.trl1.trap[3]
`define HW_CORR_ERR_7  `SPC0.tlu.trl1.take_eer & `SPC0.tlu.trl1.trap[3]
`define INST_ACC_MMU_ERR_7  `SPC0.tlu.trl1.take_ime & `SPC0.tlu.trl1.trap[3]
`define DATA_ACC_MMU_ERR_7  `SPC0.tlu.trl1.take_dme & `SPC0.tlu.trl1.trap[3]

`define LSU_LD_VALID_B	`PROBES0.lsu_ld_valid
`define LSU_TID_DEC_B_7 `PROBES0.lsu_tid_dec_b[7]
`define ASI_LD_7	`SPC0.lsu.lmd.lmq7_pkt[60] & (`SPC0.lsu.lmd.lmq7_pkt[49:48] == 2'b0)
`define ASI_7	`SPC0.lsu.lmd.lmq7_pkt[47:40]
`define ASI_ADDR_7	`SPC0.lsu.lmd.lmq7_pkt[39:0]
`define ASI_LD_DATA_7	`SPC0.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_7	tb_top.nas_top.c0.t7.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_0	`SPC0.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_0	`SPC0.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC0.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_7)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_7[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_7  != 4'b0) && ~`ASI_WR_DSFSR_7;
        update_isfsr_w <= (`ISFSR_NEW_IN_7  != 3'b0) && ~`ASI_WR_ISFSR_7;
        desr_wr <=  (`RAS_WRITE_DESR_1st_7  || `RAS_WRITE_DESR_2nd_7);
        update_dfesr_w <= `RAS_WRITE_FESR_7;
        take_err_trap_fx4 <= `ST_ERR_7 | `SW_REC_ERR_7  | `DATA_ACC_ERR_7
                           | `INST_ACC_ERR_7 | `INT_PROC_ERR_7
                           | `HW_CORR_ERR_7 | `INST_ACC_MMU_ERR_7
                           | `DATA_ACC_MMU_ERR_7 ;


        if (`ST_ERR_7) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_7) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_7) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_7) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_7) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_7) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_7) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_7) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_7[63:56], 45'b0, `DESR_7[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_7[63:56], 45'b0, `DESR_7[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_7)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_7[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_7[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_7[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_7[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_7[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_7[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC0.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_7;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_7)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_7)
	begin
	     case (`ASI_7)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_7 >= 0) &  (`ASI_ADDR_7 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_7 >= 0) &  (`ASI_ADDR_7 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_7 >= 0) &  (`ASI_ADDR_7 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_7 >= 0) &  (`ASI_ADDR_7 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_7 >= 0) &  (`ASI_ADDR_7 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_7 >= 0) &  (`ASI_ADDR_7 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_7 >= 0) &  (`ASI_ADDR_7 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_7 >= 0) &  (`ASI_ADDR_7 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_7 >= 0) &  (`ASI_ADDR_7 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_7 >= 0) &  (`ASI_ADDR_7 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC0.lsu.lmd.lmq7_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_7 == 40'h20) ||  (`ASI_ADDR_7 == 40'h30)
			     || (`ASI_ADDR_7 == 40'h80)  
				 || ((`ASI_ADDR_7 == 40'ha0) & (`SPU_MA_BUSY_0 == 0) & (`SPU_MA_TID_0 == 7))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_7 == 40'h20) ||  (`ASI_ADDR_7 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_7, `ASI_ADDR_7, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_7, {24'b0, `ASI_ADDR_7}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule

`endif

`ifdef CORE_1



module err_c1t0 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 1;
assign mytid = 0;
assign   mytnum = 1*8 + 0;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC1.l2clk) ;
	@(posedge `SPC1.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_8  `SPC1.tlu.ras.dsfsr_0_new_in
`define ISFSR_NEW_IN_8 `SPC1.tlu.ras.isfsr_0_new_in

`define DSFSR_8 `SPC1.tlu.ras.dsfsr_0
`define ISFSR_8 `SPC1.tlu.ras.isfsr_0
`define DSFAR_8 `SPC1.tlu.dfd.dsfar_0

`define ASI_WR_DSFSR_8 `SPC1.tlu.ras.asi_wr_dsfsr[0]
`define ASI_WR_ISFSR_8 `SPC1.tlu.ras.asi_wr_isfsr[0]

`define RAS_WRITE_DESR_1st_8  `SPC1.tlu.dfd.ras_write_desr_1st[0]
`define RAS_WRITE_DESR_2nd_8  `SPC1.tlu.dfd.ras_write_desr_2nd[0]
`define DESR_asi_rd_8  `SPC1.tlu.ras_rd_desr[0]
`define DESR_8  `SPC1.tlu.dfd.desr_0

`define RAS_WRITE_FESR_8  `SPC1.tlu.ras.write_fesr[0]
`define FESR_8  `SPC1.tlu.dfd.fesr_0

`define ST_ERR_8  `SPC1.tlu.trl0.take_ftt & `SPC1.tlu.trl0.trap[0]
`define SW_REC_ERR_8  `SPC1.tlu.trl0.take_ade & `SPC1.tlu.trl0.trap[0]
`define DATA_ACC_ERR_8  `SPC1.tlu.trl0.take_dae & `SPC1.tlu.trl0.trap[0]
`define INST_ACC_ERR_8  `SPC1.tlu.trl0.take_iae & `SPC1.tlu.trl0.trap[0]
`define INT_PROC_ERR_8  `SPC1.tlu.trl0.take_ipe & `SPC1.tlu.trl0.trap[0]
`define HW_CORR_ERR_8  `SPC1.tlu.trl0.take_eer & `SPC1.tlu.trl0.trap[0]
`define INST_ACC_MMU_ERR_8  `SPC1.tlu.trl0.take_ime & `SPC1.tlu.trl0.trap[0]
`define DATA_ACC_MMU_ERR_8  `SPC1.tlu.trl0.take_dme & `SPC1.tlu.trl0.trap[0]

`define LSU_LD_VALID_B	`PROBES1.lsu_ld_valid
`define LSU_TID_DEC_B_8 `PROBES1.lsu_tid_dec_b[0]
`define ASI_LD_8	`SPC1.lsu.lmd.lmq0_pkt[60] & (`SPC1.lsu.lmd.lmq0_pkt[49:48] == 2'b0)
`define ASI_8	`SPC1.lsu.lmd.lmq0_pkt[47:40]
`define ASI_ADDR_8	`SPC1.lsu.lmd.lmq0_pkt[39:0]
`define ASI_LD_DATA_8	`SPC1.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_8	tb_top.nas_top.c1.t0.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_1	`SPC1.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_1	`SPC1.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC1.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_8)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_8[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_8  != 4'b0) && ~`ASI_WR_DSFSR_8;
        update_isfsr_w <= (`ISFSR_NEW_IN_8  != 3'b0) && ~`ASI_WR_ISFSR_8;
        desr_wr <=  (`RAS_WRITE_DESR_1st_8  || `RAS_WRITE_DESR_2nd_8);
        update_dfesr_w <= `RAS_WRITE_FESR_8;
        take_err_trap_fx4 <= `ST_ERR_8 | `SW_REC_ERR_8  | `DATA_ACC_ERR_8
                           | `INST_ACC_ERR_8 | `INT_PROC_ERR_8
                           | `HW_CORR_ERR_8 | `INST_ACC_MMU_ERR_8
                           | `DATA_ACC_MMU_ERR_8 ;


        if (`ST_ERR_8) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_8) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_8) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_8) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_8) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_8) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_8) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_8) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_8[63:56], 45'b0, `DESR_8[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_8[63:56], 45'b0, `DESR_8[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_8)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_8[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_8[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_8[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_8[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_8[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_8[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC1.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_8;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_8)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_8)
	begin
	     case (`ASI_8)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_8 >= 0) &  (`ASI_ADDR_8 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_8 >= 0) &  (`ASI_ADDR_8 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_8 >= 0) &  (`ASI_ADDR_8 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_8 >= 0) &  (`ASI_ADDR_8 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_8 >= 0) &  (`ASI_ADDR_8 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_8 >= 0) &  (`ASI_ADDR_8 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_8 >= 0) &  (`ASI_ADDR_8 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_8 >= 0) &  (`ASI_ADDR_8 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_8 >= 0) &  (`ASI_ADDR_8 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_8 >= 0) &  (`ASI_ADDR_8 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC1.lsu.lmd.lmq0_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_8 == 40'h20) ||  (`ASI_ADDR_8 == 40'h30)
			     || (`ASI_ADDR_8 == 40'h80)  
				 || ((`ASI_ADDR_8 == 40'ha0) & (`SPU_MA_BUSY_1 == 0) & (`SPU_MA_TID_1 == 0))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_8 == 40'h20) ||  (`ASI_ADDR_8 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_8, `ASI_ADDR_8, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_8, {24'b0, `ASI_ADDR_8}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c1t1 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 1;
assign mytid = 1;
assign   mytnum = 1*8 + 1;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC1.l2clk) ;
	@(posedge `SPC1.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_9  `SPC1.tlu.ras.dsfsr_1_new_in
`define ISFSR_NEW_IN_9 `SPC1.tlu.ras.isfsr_1_new_in

`define DSFSR_9 `SPC1.tlu.ras.dsfsr_1
`define ISFSR_9 `SPC1.tlu.ras.isfsr_1
`define DSFAR_9 `SPC1.tlu.dfd.dsfar_1

`define ASI_WR_DSFSR_9 `SPC1.tlu.ras.asi_wr_dsfsr[1]
`define ASI_WR_ISFSR_9 `SPC1.tlu.ras.asi_wr_isfsr[1]

`define RAS_WRITE_DESR_1st_9  `SPC1.tlu.dfd.ras_write_desr_1st[1]
`define RAS_WRITE_DESR_2nd_9  `SPC1.tlu.dfd.ras_write_desr_2nd[1]
`define DESR_asi_rd_9  `SPC1.tlu.ras_rd_desr[1]
`define DESR_9  `SPC1.tlu.dfd.desr_1

`define RAS_WRITE_FESR_9  `SPC1.tlu.ras.write_fesr[1]
`define FESR_9  `SPC1.tlu.dfd.fesr_1

`define ST_ERR_9  `SPC1.tlu.trl0.take_ftt & `SPC1.tlu.trl0.trap[1]
`define SW_REC_ERR_9  `SPC1.tlu.trl0.take_ade & `SPC1.tlu.trl0.trap[1]
`define DATA_ACC_ERR_9  `SPC1.tlu.trl0.take_dae & `SPC1.tlu.trl0.trap[1]
`define INST_ACC_ERR_9  `SPC1.tlu.trl0.take_iae & `SPC1.tlu.trl0.trap[1]
`define INT_PROC_ERR_9  `SPC1.tlu.trl0.take_ipe & `SPC1.tlu.trl0.trap[1]
`define HW_CORR_ERR_9  `SPC1.tlu.trl0.take_eer & `SPC1.tlu.trl0.trap[1]
`define INST_ACC_MMU_ERR_9  `SPC1.tlu.trl0.take_ime & `SPC1.tlu.trl0.trap[1]
`define DATA_ACC_MMU_ERR_9  `SPC1.tlu.trl0.take_dme & `SPC1.tlu.trl0.trap[1]

`define LSU_LD_VALID_B	`PROBES1.lsu_ld_valid
`define LSU_TID_DEC_B_9 `PROBES1.lsu_tid_dec_b[1]
`define ASI_LD_9	`SPC1.lsu.lmd.lmq1_pkt[60] & (`SPC1.lsu.lmd.lmq1_pkt[49:48] == 2'b0)
`define ASI_9	`SPC1.lsu.lmd.lmq1_pkt[47:40]
`define ASI_ADDR_9	`SPC1.lsu.lmd.lmq1_pkt[39:0]
`define ASI_LD_DATA_9	`SPC1.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_9	tb_top.nas_top.c1.t1.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_1	`SPC1.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_1	`SPC1.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC1.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_9)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_9[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_9  != 4'b0) && ~`ASI_WR_DSFSR_9;
        update_isfsr_w <= (`ISFSR_NEW_IN_9  != 3'b0) && ~`ASI_WR_ISFSR_9;
        desr_wr <=  (`RAS_WRITE_DESR_1st_9  || `RAS_WRITE_DESR_2nd_9);
        update_dfesr_w <= `RAS_WRITE_FESR_9;
        take_err_trap_fx4 <= `ST_ERR_9 | `SW_REC_ERR_9  | `DATA_ACC_ERR_9
                           | `INST_ACC_ERR_9 | `INT_PROC_ERR_9
                           | `HW_CORR_ERR_9 | `INST_ACC_MMU_ERR_9
                           | `DATA_ACC_MMU_ERR_9 ;


        if (`ST_ERR_9) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_9) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_9) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_9) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_9) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_9) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_9) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_9) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_9[63:56], 45'b0, `DESR_9[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_9[63:56], 45'b0, `DESR_9[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_9)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_9[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_9[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_9[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_9[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_9[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_9[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC1.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_9;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_9)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_9)
	begin
	     case (`ASI_9)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_9 >= 0) &  (`ASI_ADDR_9 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_9 >= 0) &  (`ASI_ADDR_9 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_9 >= 0) &  (`ASI_ADDR_9 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_9 >= 0) &  (`ASI_ADDR_9 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_9 >= 0) &  (`ASI_ADDR_9 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_9 >= 0) &  (`ASI_ADDR_9 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_9 >= 0) &  (`ASI_ADDR_9 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_9 >= 0) &  (`ASI_ADDR_9 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_9 >= 0) &  (`ASI_ADDR_9 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_9 >= 0) &  (`ASI_ADDR_9 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC1.lsu.lmd.lmq1_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_9 == 40'h20) ||  (`ASI_ADDR_9 == 40'h30)
			     || (`ASI_ADDR_9 == 40'h80)  
				 || ((`ASI_ADDR_9 == 40'ha0) & (`SPU_MA_BUSY_1 == 0) & (`SPU_MA_TID_1 == 1))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_9 == 40'h20) ||  (`ASI_ADDR_9 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_9, `ASI_ADDR_9, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_9, {24'b0, `ASI_ADDR_9}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c1t2 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 1;
assign mytid = 2;
assign   mytnum = 1*8 + 2;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC1.l2clk) ;
	@(posedge `SPC1.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_10  `SPC1.tlu.ras.dsfsr_2_new_in
`define ISFSR_NEW_IN_10 `SPC1.tlu.ras.isfsr_2_new_in

`define DSFSR_10 `SPC1.tlu.ras.dsfsr_2
`define ISFSR_10 `SPC1.tlu.ras.isfsr_2
`define DSFAR_10 `SPC1.tlu.dfd.dsfar_2

`define ASI_WR_DSFSR_10 `SPC1.tlu.ras.asi_wr_dsfsr[2]
`define ASI_WR_ISFSR_10 `SPC1.tlu.ras.asi_wr_isfsr[2]

`define RAS_WRITE_DESR_1st_10  `SPC1.tlu.dfd.ras_write_desr_1st[2]
`define RAS_WRITE_DESR_2nd_10  `SPC1.tlu.dfd.ras_write_desr_2nd[2]
`define DESR_asi_rd_10  `SPC1.tlu.ras_rd_desr[2]
`define DESR_10  `SPC1.tlu.dfd.desr_2

`define RAS_WRITE_FESR_10  `SPC1.tlu.ras.write_fesr[2]
`define FESR_10  `SPC1.tlu.dfd.fesr_2

`define ST_ERR_10  `SPC1.tlu.trl0.take_ftt & `SPC1.tlu.trl0.trap[2]
`define SW_REC_ERR_10  `SPC1.tlu.trl0.take_ade & `SPC1.tlu.trl0.trap[2]
`define DATA_ACC_ERR_10  `SPC1.tlu.trl0.take_dae & `SPC1.tlu.trl0.trap[2]
`define INST_ACC_ERR_10  `SPC1.tlu.trl0.take_iae & `SPC1.tlu.trl0.trap[2]
`define INT_PROC_ERR_10  `SPC1.tlu.trl0.take_ipe & `SPC1.tlu.trl0.trap[2]
`define HW_CORR_ERR_10  `SPC1.tlu.trl0.take_eer & `SPC1.tlu.trl0.trap[2]
`define INST_ACC_MMU_ERR_10  `SPC1.tlu.trl0.take_ime & `SPC1.tlu.trl0.trap[2]
`define DATA_ACC_MMU_ERR_10  `SPC1.tlu.trl0.take_dme & `SPC1.tlu.trl0.trap[2]

`define LSU_LD_VALID_B	`PROBES1.lsu_ld_valid
`define LSU_TID_DEC_B_10 `PROBES1.lsu_tid_dec_b[2]
`define ASI_LD_10	`SPC1.lsu.lmd.lmq2_pkt[60] & (`SPC1.lsu.lmd.lmq2_pkt[49:48] == 2'b0)
`define ASI_10	`SPC1.lsu.lmd.lmq2_pkt[47:40]
`define ASI_ADDR_10	`SPC1.lsu.lmd.lmq2_pkt[39:0]
`define ASI_LD_DATA_10	`SPC1.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_10	tb_top.nas_top.c1.t2.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_1	`SPC1.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_1	`SPC1.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC1.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_10)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_10[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_10  != 4'b0) && ~`ASI_WR_DSFSR_10;
        update_isfsr_w <= (`ISFSR_NEW_IN_10  != 3'b0) && ~`ASI_WR_ISFSR_10;
        desr_wr <=  (`RAS_WRITE_DESR_1st_10  || `RAS_WRITE_DESR_2nd_10);
        update_dfesr_w <= `RAS_WRITE_FESR_10;
        take_err_trap_fx4 <= `ST_ERR_10 | `SW_REC_ERR_10  | `DATA_ACC_ERR_10
                           | `INST_ACC_ERR_10 | `INT_PROC_ERR_10
                           | `HW_CORR_ERR_10 | `INST_ACC_MMU_ERR_10
                           | `DATA_ACC_MMU_ERR_10 ;


        if (`ST_ERR_10) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_10) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_10) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_10) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_10) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_10) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_10) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_10) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_10[63:56], 45'b0, `DESR_10[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_10[63:56], 45'b0, `DESR_10[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_10)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_10[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_10[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_10[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_10[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_10[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_10[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC1.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_10;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_10)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_10)
	begin
	     case (`ASI_10)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_10 >= 0) &  (`ASI_ADDR_10 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_10 >= 0) &  (`ASI_ADDR_10 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_10 >= 0) &  (`ASI_ADDR_10 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_10 >= 0) &  (`ASI_ADDR_10 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_10 >= 0) &  (`ASI_ADDR_10 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_10 >= 0) &  (`ASI_ADDR_10 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_10 >= 0) &  (`ASI_ADDR_10 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_10 >= 0) &  (`ASI_ADDR_10 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_10 >= 0) &  (`ASI_ADDR_10 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_10 >= 0) &  (`ASI_ADDR_10 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC1.lsu.lmd.lmq2_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_10 == 40'h20) ||  (`ASI_ADDR_10 == 40'h30)
			     || (`ASI_ADDR_10 == 40'h80)  
				 || ((`ASI_ADDR_10 == 40'ha0) & (`SPU_MA_BUSY_1 == 0) & (`SPU_MA_TID_1 == 2))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_10 == 40'h20) ||  (`ASI_ADDR_10 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_10, `ASI_ADDR_10, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_10, {24'b0, `ASI_ADDR_10}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c1t3 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 1;
assign mytid = 3;
assign   mytnum = 1*8 + 3;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC1.l2clk) ;
	@(posedge `SPC1.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_11  `SPC1.tlu.ras.dsfsr_3_new_in
`define ISFSR_NEW_IN_11 `SPC1.tlu.ras.isfsr_3_new_in

`define DSFSR_11 `SPC1.tlu.ras.dsfsr_3
`define ISFSR_11 `SPC1.tlu.ras.isfsr_3
`define DSFAR_11 `SPC1.tlu.dfd.dsfar_3

`define ASI_WR_DSFSR_11 `SPC1.tlu.ras.asi_wr_dsfsr[3]
`define ASI_WR_ISFSR_11 `SPC1.tlu.ras.asi_wr_isfsr[3]

`define RAS_WRITE_DESR_1st_11  `SPC1.tlu.dfd.ras_write_desr_1st[3]
`define RAS_WRITE_DESR_2nd_11  `SPC1.tlu.dfd.ras_write_desr_2nd[3]
`define DESR_asi_rd_11  `SPC1.tlu.ras_rd_desr[3]
`define DESR_11  `SPC1.tlu.dfd.desr_3

`define RAS_WRITE_FESR_11  `SPC1.tlu.ras.write_fesr[3]
`define FESR_11  `SPC1.tlu.dfd.fesr_3

`define ST_ERR_11  `SPC1.tlu.trl0.take_ftt & `SPC1.tlu.trl0.trap[3]
`define SW_REC_ERR_11  `SPC1.tlu.trl0.take_ade & `SPC1.tlu.trl0.trap[3]
`define DATA_ACC_ERR_11  `SPC1.tlu.trl0.take_dae & `SPC1.tlu.trl0.trap[3]
`define INST_ACC_ERR_11  `SPC1.tlu.trl0.take_iae & `SPC1.tlu.trl0.trap[3]
`define INT_PROC_ERR_11  `SPC1.tlu.trl0.take_ipe & `SPC1.tlu.trl0.trap[3]
`define HW_CORR_ERR_11  `SPC1.tlu.trl0.take_eer & `SPC1.tlu.trl0.trap[3]
`define INST_ACC_MMU_ERR_11  `SPC1.tlu.trl0.take_ime & `SPC1.tlu.trl0.trap[3]
`define DATA_ACC_MMU_ERR_11  `SPC1.tlu.trl0.take_dme & `SPC1.tlu.trl0.trap[3]

`define LSU_LD_VALID_B	`PROBES1.lsu_ld_valid
`define LSU_TID_DEC_B_11 `PROBES1.lsu_tid_dec_b[3]
`define ASI_LD_11	`SPC1.lsu.lmd.lmq3_pkt[60] & (`SPC1.lsu.lmd.lmq3_pkt[49:48] == 2'b0)
`define ASI_11	`SPC1.lsu.lmd.lmq3_pkt[47:40]
`define ASI_ADDR_11	`SPC1.lsu.lmd.lmq3_pkt[39:0]
`define ASI_LD_DATA_11	`SPC1.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_11	tb_top.nas_top.c1.t3.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_1	`SPC1.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_1	`SPC1.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC1.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_11)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_11[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_11  != 4'b0) && ~`ASI_WR_DSFSR_11;
        update_isfsr_w <= (`ISFSR_NEW_IN_11  != 3'b0) && ~`ASI_WR_ISFSR_11;
        desr_wr <=  (`RAS_WRITE_DESR_1st_11  || `RAS_WRITE_DESR_2nd_11);
        update_dfesr_w <= `RAS_WRITE_FESR_11;
        take_err_trap_fx4 <= `ST_ERR_11 | `SW_REC_ERR_11  | `DATA_ACC_ERR_11
                           | `INST_ACC_ERR_11 | `INT_PROC_ERR_11
                           | `HW_CORR_ERR_11 | `INST_ACC_MMU_ERR_11
                           | `DATA_ACC_MMU_ERR_11 ;


        if (`ST_ERR_11) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_11) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_11) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_11) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_11) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_11) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_11) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_11) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_11[63:56], 45'b0, `DESR_11[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_11[63:56], 45'b0, `DESR_11[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_11)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_11[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_11[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_11[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_11[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_11[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_11[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC1.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_11;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_11)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_11)
	begin
	     case (`ASI_11)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_11 >= 0) &  (`ASI_ADDR_11 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_11 >= 0) &  (`ASI_ADDR_11 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_11 >= 0) &  (`ASI_ADDR_11 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_11 >= 0) &  (`ASI_ADDR_11 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_11 >= 0) &  (`ASI_ADDR_11 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_11 >= 0) &  (`ASI_ADDR_11 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_11 >= 0) &  (`ASI_ADDR_11 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_11 >= 0) &  (`ASI_ADDR_11 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_11 >= 0) &  (`ASI_ADDR_11 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_11 >= 0) &  (`ASI_ADDR_11 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC1.lsu.lmd.lmq3_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_11 == 40'h20) ||  (`ASI_ADDR_11 == 40'h30)
			     || (`ASI_ADDR_11 == 40'h80)  
				 || ((`ASI_ADDR_11 == 40'ha0) & (`SPU_MA_BUSY_1 == 0) & (`SPU_MA_TID_1 == 3))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_11 == 40'h20) ||  (`ASI_ADDR_11 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_11, `ASI_ADDR_11, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_11, {24'b0, `ASI_ADDR_11}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c1t4 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 1;
assign mytid = 4;
assign   mytnum = 1*8 + 4;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC1.l2clk) ;
	@(posedge `SPC1.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_12  `SPC1.tlu.ras.dsfsr_4_new_in
`define ISFSR_NEW_IN_12 `SPC1.tlu.ras.isfsr_4_new_in

`define DSFSR_12 `SPC1.tlu.ras.dsfsr_4
`define ISFSR_12 `SPC1.tlu.ras.isfsr_4
`define DSFAR_12 `SPC1.tlu.dfd.dsfar_4

`define ASI_WR_DSFSR_12 `SPC1.tlu.ras.asi_wr_dsfsr[4]
`define ASI_WR_ISFSR_12 `SPC1.tlu.ras.asi_wr_isfsr[4]

`define RAS_WRITE_DESR_1st_12  `SPC1.tlu.dfd.ras_write_desr_1st[4]
`define RAS_WRITE_DESR_2nd_12  `SPC1.tlu.dfd.ras_write_desr_2nd[4]
`define DESR_asi_rd_12  `SPC1.tlu.ras_rd_desr[4]
`define DESR_12  `SPC1.tlu.dfd.desr_4

`define RAS_WRITE_FESR_12  `SPC1.tlu.ras.write_fesr[4]
`define FESR_12  `SPC1.tlu.dfd.fesr_4

`define ST_ERR_12  `SPC1.tlu.trl1.take_ftt & `SPC1.tlu.trl1.trap[0]
`define SW_REC_ERR_12  `SPC1.tlu.trl1.take_ade & `SPC1.tlu.trl1.trap[0]
`define DATA_ACC_ERR_12  `SPC1.tlu.trl1.take_dae & `SPC1.tlu.trl1.trap[0]
`define INST_ACC_ERR_12  `SPC1.tlu.trl1.take_iae & `SPC1.tlu.trl1.trap[0]
`define INT_PROC_ERR_12  `SPC1.tlu.trl1.take_ipe & `SPC1.tlu.trl1.trap[0]
`define HW_CORR_ERR_12  `SPC1.tlu.trl1.take_eer & `SPC1.tlu.trl1.trap[0]
`define INST_ACC_MMU_ERR_12  `SPC1.tlu.trl1.take_ime & `SPC1.tlu.trl1.trap[0]
`define DATA_ACC_MMU_ERR_12  `SPC1.tlu.trl1.take_dme & `SPC1.tlu.trl1.trap[0]

`define LSU_LD_VALID_B	`PROBES1.lsu_ld_valid
`define LSU_TID_DEC_B_12 `PROBES1.lsu_tid_dec_b[4]
`define ASI_LD_12	`SPC1.lsu.lmd.lmq4_pkt[60] & (`SPC1.lsu.lmd.lmq4_pkt[49:48] == 2'b0)
`define ASI_12	`SPC1.lsu.lmd.lmq4_pkt[47:40]
`define ASI_ADDR_12	`SPC1.lsu.lmd.lmq4_pkt[39:0]
`define ASI_LD_DATA_12	`SPC1.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_12	tb_top.nas_top.c1.t4.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_1	`SPC1.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_1	`SPC1.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC1.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_12)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_12[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_12  != 4'b0) && ~`ASI_WR_DSFSR_12;
        update_isfsr_w <= (`ISFSR_NEW_IN_12  != 3'b0) && ~`ASI_WR_ISFSR_12;
        desr_wr <=  (`RAS_WRITE_DESR_1st_12  || `RAS_WRITE_DESR_2nd_12);
        update_dfesr_w <= `RAS_WRITE_FESR_12;
        take_err_trap_fx4 <= `ST_ERR_12 | `SW_REC_ERR_12  | `DATA_ACC_ERR_12
                           | `INST_ACC_ERR_12 | `INT_PROC_ERR_12
                           | `HW_CORR_ERR_12 | `INST_ACC_MMU_ERR_12
                           | `DATA_ACC_MMU_ERR_12 ;


        if (`ST_ERR_12) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_12) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_12) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_12) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_12) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_12) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_12) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_12) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_12[63:56], 45'b0, `DESR_12[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_12[63:56], 45'b0, `DESR_12[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_12)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_12[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_12[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_12[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_12[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_12[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_12[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC1.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_12;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_12)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_12)
	begin
	     case (`ASI_12)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_12 >= 0) &  (`ASI_ADDR_12 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_12 >= 0) &  (`ASI_ADDR_12 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_12 >= 0) &  (`ASI_ADDR_12 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_12 >= 0) &  (`ASI_ADDR_12 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_12 >= 0) &  (`ASI_ADDR_12 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_12 >= 0) &  (`ASI_ADDR_12 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_12 >= 0) &  (`ASI_ADDR_12 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_12 >= 0) &  (`ASI_ADDR_12 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_12 >= 0) &  (`ASI_ADDR_12 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_12 >= 0) &  (`ASI_ADDR_12 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC1.lsu.lmd.lmq4_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_12 == 40'h20) ||  (`ASI_ADDR_12 == 40'h30)
			     || (`ASI_ADDR_12 == 40'h80)  
				 || ((`ASI_ADDR_12 == 40'ha0) & (`SPU_MA_BUSY_1 == 0) & (`SPU_MA_TID_1 == 4))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_12 == 40'h20) ||  (`ASI_ADDR_12 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_12, `ASI_ADDR_12, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_12, {24'b0, `ASI_ADDR_12}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c1t5 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 1;
assign mytid = 5;
assign   mytnum = 1*8 + 5;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC1.l2clk) ;
	@(posedge `SPC1.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_13  `SPC1.tlu.ras.dsfsr_5_new_in
`define ISFSR_NEW_IN_13 `SPC1.tlu.ras.isfsr_5_new_in

`define DSFSR_13 `SPC1.tlu.ras.dsfsr_5
`define ISFSR_13 `SPC1.tlu.ras.isfsr_5
`define DSFAR_13 `SPC1.tlu.dfd.dsfar_5

`define ASI_WR_DSFSR_13 `SPC1.tlu.ras.asi_wr_dsfsr[5]
`define ASI_WR_ISFSR_13 `SPC1.tlu.ras.asi_wr_isfsr[5]

`define RAS_WRITE_DESR_1st_13  `SPC1.tlu.dfd.ras_write_desr_1st[5]
`define RAS_WRITE_DESR_2nd_13  `SPC1.tlu.dfd.ras_write_desr_2nd[5]
`define DESR_asi_rd_13  `SPC1.tlu.ras_rd_desr[5]
`define DESR_13  `SPC1.tlu.dfd.desr_5

`define RAS_WRITE_FESR_13  `SPC1.tlu.ras.write_fesr[5]
`define FESR_13  `SPC1.tlu.dfd.fesr_5

`define ST_ERR_13  `SPC1.tlu.trl1.take_ftt & `SPC1.tlu.trl1.trap[1]
`define SW_REC_ERR_13  `SPC1.tlu.trl1.take_ade & `SPC1.tlu.trl1.trap[1]
`define DATA_ACC_ERR_13  `SPC1.tlu.trl1.take_dae & `SPC1.tlu.trl1.trap[1]
`define INST_ACC_ERR_13  `SPC1.tlu.trl1.take_iae & `SPC1.tlu.trl1.trap[1]
`define INT_PROC_ERR_13  `SPC1.tlu.trl1.take_ipe & `SPC1.tlu.trl1.trap[1]
`define HW_CORR_ERR_13  `SPC1.tlu.trl1.take_eer & `SPC1.tlu.trl1.trap[1]
`define INST_ACC_MMU_ERR_13  `SPC1.tlu.trl1.take_ime & `SPC1.tlu.trl1.trap[1]
`define DATA_ACC_MMU_ERR_13  `SPC1.tlu.trl1.take_dme & `SPC1.tlu.trl1.trap[1]

`define LSU_LD_VALID_B	`PROBES1.lsu_ld_valid
`define LSU_TID_DEC_B_13 `PROBES1.lsu_tid_dec_b[5]
`define ASI_LD_13	`SPC1.lsu.lmd.lmq5_pkt[60] & (`SPC1.lsu.lmd.lmq5_pkt[49:48] == 2'b0)
`define ASI_13	`SPC1.lsu.lmd.lmq5_pkt[47:40]
`define ASI_ADDR_13	`SPC1.lsu.lmd.lmq5_pkt[39:0]
`define ASI_LD_DATA_13	`SPC1.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_13	tb_top.nas_top.c1.t5.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_1	`SPC1.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_1	`SPC1.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC1.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_13)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_13[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_13  != 4'b0) && ~`ASI_WR_DSFSR_13;
        update_isfsr_w <= (`ISFSR_NEW_IN_13  != 3'b0) && ~`ASI_WR_ISFSR_13;
        desr_wr <=  (`RAS_WRITE_DESR_1st_13  || `RAS_WRITE_DESR_2nd_13);
        update_dfesr_w <= `RAS_WRITE_FESR_13;
        take_err_trap_fx4 <= `ST_ERR_13 | `SW_REC_ERR_13  | `DATA_ACC_ERR_13
                           | `INST_ACC_ERR_13 | `INT_PROC_ERR_13
                           | `HW_CORR_ERR_13 | `INST_ACC_MMU_ERR_13
                           | `DATA_ACC_MMU_ERR_13 ;


        if (`ST_ERR_13) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_13) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_13) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_13) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_13) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_13) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_13) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_13) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_13[63:56], 45'b0, `DESR_13[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_13[63:56], 45'b0, `DESR_13[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_13)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_13[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_13[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_13[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_13[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_13[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_13[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC1.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_13;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_13)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_13)
	begin
	     case (`ASI_13)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_13 >= 0) &  (`ASI_ADDR_13 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_13 >= 0) &  (`ASI_ADDR_13 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_13 >= 0) &  (`ASI_ADDR_13 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_13 >= 0) &  (`ASI_ADDR_13 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_13 >= 0) &  (`ASI_ADDR_13 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_13 >= 0) &  (`ASI_ADDR_13 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_13 >= 0) &  (`ASI_ADDR_13 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_13 >= 0) &  (`ASI_ADDR_13 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_13 >= 0) &  (`ASI_ADDR_13 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_13 >= 0) &  (`ASI_ADDR_13 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC1.lsu.lmd.lmq5_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_13 == 40'h20) ||  (`ASI_ADDR_13 == 40'h30)
			     || (`ASI_ADDR_13 == 40'h80)  
				 || ((`ASI_ADDR_13 == 40'ha0) & (`SPU_MA_BUSY_1 == 0) & (`SPU_MA_TID_1 == 5))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_13 == 40'h20) ||  (`ASI_ADDR_13 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_13, `ASI_ADDR_13, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_13, {24'b0, `ASI_ADDR_13}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c1t6 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 1;
assign mytid = 6;
assign   mytnum = 1*8 + 6;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC1.l2clk) ;
	@(posedge `SPC1.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_14  `SPC1.tlu.ras.dsfsr_6_new_in
`define ISFSR_NEW_IN_14 `SPC1.tlu.ras.isfsr_6_new_in

`define DSFSR_14 `SPC1.tlu.ras.dsfsr_6
`define ISFSR_14 `SPC1.tlu.ras.isfsr_6
`define DSFAR_14 `SPC1.tlu.dfd.dsfar_6

`define ASI_WR_DSFSR_14 `SPC1.tlu.ras.asi_wr_dsfsr[6]
`define ASI_WR_ISFSR_14 `SPC1.tlu.ras.asi_wr_isfsr[6]

`define RAS_WRITE_DESR_1st_14  `SPC1.tlu.dfd.ras_write_desr_1st[6]
`define RAS_WRITE_DESR_2nd_14  `SPC1.tlu.dfd.ras_write_desr_2nd[6]
`define DESR_asi_rd_14  `SPC1.tlu.ras_rd_desr[6]
`define DESR_14  `SPC1.tlu.dfd.desr_6

`define RAS_WRITE_FESR_14  `SPC1.tlu.ras.write_fesr[6]
`define FESR_14  `SPC1.tlu.dfd.fesr_6

`define ST_ERR_14  `SPC1.tlu.trl1.take_ftt & `SPC1.tlu.trl1.trap[2]
`define SW_REC_ERR_14  `SPC1.tlu.trl1.take_ade & `SPC1.tlu.trl1.trap[2]
`define DATA_ACC_ERR_14  `SPC1.tlu.trl1.take_dae & `SPC1.tlu.trl1.trap[2]
`define INST_ACC_ERR_14  `SPC1.tlu.trl1.take_iae & `SPC1.tlu.trl1.trap[2]
`define INT_PROC_ERR_14  `SPC1.tlu.trl1.take_ipe & `SPC1.tlu.trl1.trap[2]
`define HW_CORR_ERR_14  `SPC1.tlu.trl1.take_eer & `SPC1.tlu.trl1.trap[2]
`define INST_ACC_MMU_ERR_14  `SPC1.tlu.trl1.take_ime & `SPC1.tlu.trl1.trap[2]
`define DATA_ACC_MMU_ERR_14  `SPC1.tlu.trl1.take_dme & `SPC1.tlu.trl1.trap[2]

`define LSU_LD_VALID_B	`PROBES1.lsu_ld_valid
`define LSU_TID_DEC_B_14 `PROBES1.lsu_tid_dec_b[6]
`define ASI_LD_14	`SPC1.lsu.lmd.lmq6_pkt[60] & (`SPC1.lsu.lmd.lmq6_pkt[49:48] == 2'b0)
`define ASI_14	`SPC1.lsu.lmd.lmq6_pkt[47:40]
`define ASI_ADDR_14	`SPC1.lsu.lmd.lmq6_pkt[39:0]
`define ASI_LD_DATA_14	`SPC1.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_14	tb_top.nas_top.c1.t6.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_1	`SPC1.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_1	`SPC1.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC1.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_14)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_14[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_14  != 4'b0) && ~`ASI_WR_DSFSR_14;
        update_isfsr_w <= (`ISFSR_NEW_IN_14  != 3'b0) && ~`ASI_WR_ISFSR_14;
        desr_wr <=  (`RAS_WRITE_DESR_1st_14  || `RAS_WRITE_DESR_2nd_14);
        update_dfesr_w <= `RAS_WRITE_FESR_14;
        take_err_trap_fx4 <= `ST_ERR_14 | `SW_REC_ERR_14  | `DATA_ACC_ERR_14
                           | `INST_ACC_ERR_14 | `INT_PROC_ERR_14
                           | `HW_CORR_ERR_14 | `INST_ACC_MMU_ERR_14
                           | `DATA_ACC_MMU_ERR_14 ;


        if (`ST_ERR_14) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_14) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_14) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_14) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_14) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_14) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_14) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_14) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_14[63:56], 45'b0, `DESR_14[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_14[63:56], 45'b0, `DESR_14[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_14)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_14[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_14[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_14[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_14[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_14[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_14[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC1.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_14;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_14)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_14)
	begin
	     case (`ASI_14)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_14 >= 0) &  (`ASI_ADDR_14 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_14 >= 0) &  (`ASI_ADDR_14 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_14 >= 0) &  (`ASI_ADDR_14 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_14 >= 0) &  (`ASI_ADDR_14 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_14 >= 0) &  (`ASI_ADDR_14 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_14 >= 0) &  (`ASI_ADDR_14 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_14 >= 0) &  (`ASI_ADDR_14 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_14 >= 0) &  (`ASI_ADDR_14 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_14 >= 0) &  (`ASI_ADDR_14 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_14 >= 0) &  (`ASI_ADDR_14 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC1.lsu.lmd.lmq6_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_14 == 40'h20) ||  (`ASI_ADDR_14 == 40'h30)
			     || (`ASI_ADDR_14 == 40'h80)  
				 || ((`ASI_ADDR_14 == 40'ha0) & (`SPU_MA_BUSY_1 == 0) & (`SPU_MA_TID_1 == 6))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_14 == 40'h20) ||  (`ASI_ADDR_14 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_14, `ASI_ADDR_14, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_14, {24'b0, `ASI_ADDR_14}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c1t7 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 1;
assign mytid = 7;
assign   mytnum = 1*8 + 7;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC1.l2clk) ;
	@(posedge `SPC1.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_15  `SPC1.tlu.ras.dsfsr_7_new_in
`define ISFSR_NEW_IN_15 `SPC1.tlu.ras.isfsr_7_new_in

`define DSFSR_15 `SPC1.tlu.ras.dsfsr_7
`define ISFSR_15 `SPC1.tlu.ras.isfsr_7
`define DSFAR_15 `SPC1.tlu.dfd.dsfar_7

`define ASI_WR_DSFSR_15 `SPC1.tlu.ras.asi_wr_dsfsr[7]
`define ASI_WR_ISFSR_15 `SPC1.tlu.ras.asi_wr_isfsr[7]

`define RAS_WRITE_DESR_1st_15  `SPC1.tlu.dfd.ras_write_desr_1st[7]
`define RAS_WRITE_DESR_2nd_15  `SPC1.tlu.dfd.ras_write_desr_2nd[7]
`define DESR_asi_rd_15  `SPC1.tlu.ras_rd_desr[7]
`define DESR_15  `SPC1.tlu.dfd.desr_7

`define RAS_WRITE_FESR_15  `SPC1.tlu.ras.write_fesr[7]
`define FESR_15  `SPC1.tlu.dfd.fesr_7

`define ST_ERR_15  `SPC1.tlu.trl1.take_ftt & `SPC1.tlu.trl1.trap[3]
`define SW_REC_ERR_15  `SPC1.tlu.trl1.take_ade & `SPC1.tlu.trl1.trap[3]
`define DATA_ACC_ERR_15  `SPC1.tlu.trl1.take_dae & `SPC1.tlu.trl1.trap[3]
`define INST_ACC_ERR_15  `SPC1.tlu.trl1.take_iae & `SPC1.tlu.trl1.trap[3]
`define INT_PROC_ERR_15  `SPC1.tlu.trl1.take_ipe & `SPC1.tlu.trl1.trap[3]
`define HW_CORR_ERR_15  `SPC1.tlu.trl1.take_eer & `SPC1.tlu.trl1.trap[3]
`define INST_ACC_MMU_ERR_15  `SPC1.tlu.trl1.take_ime & `SPC1.tlu.trl1.trap[3]
`define DATA_ACC_MMU_ERR_15  `SPC1.tlu.trl1.take_dme & `SPC1.tlu.trl1.trap[3]

`define LSU_LD_VALID_B	`PROBES1.lsu_ld_valid
`define LSU_TID_DEC_B_15 `PROBES1.lsu_tid_dec_b[7]
`define ASI_LD_15	`SPC1.lsu.lmd.lmq7_pkt[60] & (`SPC1.lsu.lmd.lmq7_pkt[49:48] == 2'b0)
`define ASI_15	`SPC1.lsu.lmd.lmq7_pkt[47:40]
`define ASI_ADDR_15	`SPC1.lsu.lmd.lmq7_pkt[39:0]
`define ASI_LD_DATA_15	`SPC1.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_15	tb_top.nas_top.c1.t7.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_1	`SPC1.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_1	`SPC1.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC1.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_15)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_15[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_15  != 4'b0) && ~`ASI_WR_DSFSR_15;
        update_isfsr_w <= (`ISFSR_NEW_IN_15  != 3'b0) && ~`ASI_WR_ISFSR_15;
        desr_wr <=  (`RAS_WRITE_DESR_1st_15  || `RAS_WRITE_DESR_2nd_15);
        update_dfesr_w <= `RAS_WRITE_FESR_15;
        take_err_trap_fx4 <= `ST_ERR_15 | `SW_REC_ERR_15  | `DATA_ACC_ERR_15
                           | `INST_ACC_ERR_15 | `INT_PROC_ERR_15
                           | `HW_CORR_ERR_15 | `INST_ACC_MMU_ERR_15
                           | `DATA_ACC_MMU_ERR_15 ;


        if (`ST_ERR_15) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_15) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_15) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_15) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_15) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_15) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_15) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_15) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_15[63:56], 45'b0, `DESR_15[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_15[63:56], 45'b0, `DESR_15[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_15)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_15[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_15[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_15[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_15[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_15[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_15[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC1.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_15;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_15)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_15)
	begin
	     case (`ASI_15)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_15 >= 0) &  (`ASI_ADDR_15 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_15 >= 0) &  (`ASI_ADDR_15 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_15 >= 0) &  (`ASI_ADDR_15 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_15 >= 0) &  (`ASI_ADDR_15 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_15 >= 0) &  (`ASI_ADDR_15 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_15 >= 0) &  (`ASI_ADDR_15 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_15 >= 0) &  (`ASI_ADDR_15 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_15 >= 0) &  (`ASI_ADDR_15 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_15 >= 0) &  (`ASI_ADDR_15 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_15 >= 0) &  (`ASI_ADDR_15 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC1.lsu.lmd.lmq7_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_15 == 40'h20) ||  (`ASI_ADDR_15 == 40'h30)
			     || (`ASI_ADDR_15 == 40'h80)  
				 || ((`ASI_ADDR_15 == 40'ha0) & (`SPU_MA_BUSY_1 == 0) & (`SPU_MA_TID_1 == 7))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_15 == 40'h20) ||  (`ASI_ADDR_15 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_15, `ASI_ADDR_15, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_15, {24'b0, `ASI_ADDR_15}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule

`endif

`ifdef CORE_2



module err_c2t0 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 2;
assign mytid = 0;
assign   mytnum = 2*8 + 0;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC2.l2clk) ;
	@(posedge `SPC2.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_16  `SPC2.tlu.ras.dsfsr_0_new_in
`define ISFSR_NEW_IN_16 `SPC2.tlu.ras.isfsr_0_new_in

`define DSFSR_16 `SPC2.tlu.ras.dsfsr_0
`define ISFSR_16 `SPC2.tlu.ras.isfsr_0
`define DSFAR_16 `SPC2.tlu.dfd.dsfar_0

`define ASI_WR_DSFSR_16 `SPC2.tlu.ras.asi_wr_dsfsr[0]
`define ASI_WR_ISFSR_16 `SPC2.tlu.ras.asi_wr_isfsr[0]

`define RAS_WRITE_DESR_1st_16  `SPC2.tlu.dfd.ras_write_desr_1st[0]
`define RAS_WRITE_DESR_2nd_16  `SPC2.tlu.dfd.ras_write_desr_2nd[0]
`define DESR_asi_rd_16  `SPC2.tlu.ras_rd_desr[0]
`define DESR_16  `SPC2.tlu.dfd.desr_0

`define RAS_WRITE_FESR_16  `SPC2.tlu.ras.write_fesr[0]
`define FESR_16  `SPC2.tlu.dfd.fesr_0

`define ST_ERR_16  `SPC2.tlu.trl0.take_ftt & `SPC2.tlu.trl0.trap[0]
`define SW_REC_ERR_16  `SPC2.tlu.trl0.take_ade & `SPC2.tlu.trl0.trap[0]
`define DATA_ACC_ERR_16  `SPC2.tlu.trl0.take_dae & `SPC2.tlu.trl0.trap[0]
`define INST_ACC_ERR_16  `SPC2.tlu.trl0.take_iae & `SPC2.tlu.trl0.trap[0]
`define INT_PROC_ERR_16  `SPC2.tlu.trl0.take_ipe & `SPC2.tlu.trl0.trap[0]
`define HW_CORR_ERR_16  `SPC2.tlu.trl0.take_eer & `SPC2.tlu.trl0.trap[0]
`define INST_ACC_MMU_ERR_16  `SPC2.tlu.trl0.take_ime & `SPC2.tlu.trl0.trap[0]
`define DATA_ACC_MMU_ERR_16  `SPC2.tlu.trl0.take_dme & `SPC2.tlu.trl0.trap[0]

`define LSU_LD_VALID_B	`PROBES2.lsu_ld_valid
`define LSU_TID_DEC_B_16 `PROBES2.lsu_tid_dec_b[0]
`define ASI_LD_16	`SPC2.lsu.lmd.lmq0_pkt[60] & (`SPC2.lsu.lmd.lmq0_pkt[49:48] == 2'b0)
`define ASI_16	`SPC2.lsu.lmd.lmq0_pkt[47:40]
`define ASI_ADDR_16	`SPC2.lsu.lmd.lmq0_pkt[39:0]
`define ASI_LD_DATA_16	`SPC2.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_16	tb_top.nas_top.c2.t0.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_2	`SPC2.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_2	`SPC2.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC2.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_16)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_16[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_16  != 4'b0) && ~`ASI_WR_DSFSR_16;
        update_isfsr_w <= (`ISFSR_NEW_IN_16  != 3'b0) && ~`ASI_WR_ISFSR_16;
        desr_wr <=  (`RAS_WRITE_DESR_1st_16  || `RAS_WRITE_DESR_2nd_16);
        update_dfesr_w <= `RAS_WRITE_FESR_16;
        take_err_trap_fx4 <= `ST_ERR_16 | `SW_REC_ERR_16  | `DATA_ACC_ERR_16
                           | `INST_ACC_ERR_16 | `INT_PROC_ERR_16
                           | `HW_CORR_ERR_16 | `INST_ACC_MMU_ERR_16
                           | `DATA_ACC_MMU_ERR_16 ;


        if (`ST_ERR_16) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_16) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_16) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_16) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_16) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_16) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_16) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_16) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_16[63:56], 45'b0, `DESR_16[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_16[63:56], 45'b0, `DESR_16[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_16)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_16[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_16[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_16[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_16[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_16[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_16[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC2.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_16;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_16)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_16)
	begin
	     case (`ASI_16)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_16 >= 0) &  (`ASI_ADDR_16 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_16 >= 0) &  (`ASI_ADDR_16 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_16 >= 0) &  (`ASI_ADDR_16 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_16 >= 0) &  (`ASI_ADDR_16 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_16 >= 0) &  (`ASI_ADDR_16 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_16 >= 0) &  (`ASI_ADDR_16 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_16 >= 0) &  (`ASI_ADDR_16 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_16 >= 0) &  (`ASI_ADDR_16 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_16 >= 0) &  (`ASI_ADDR_16 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_16 >= 0) &  (`ASI_ADDR_16 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC2.lsu.lmd.lmq0_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_16 == 40'h20) ||  (`ASI_ADDR_16 == 40'h30)
			     || (`ASI_ADDR_16 == 40'h80)  
				 || ((`ASI_ADDR_16 == 40'ha0) & (`SPU_MA_BUSY_2 == 0) & (`SPU_MA_TID_2 == 0))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_16 == 40'h20) ||  (`ASI_ADDR_16 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_16, `ASI_ADDR_16, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_16, {24'b0, `ASI_ADDR_16}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c2t1 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 2;
assign mytid = 1;
assign   mytnum = 2*8 + 1;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC2.l2clk) ;
	@(posedge `SPC2.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_17  `SPC2.tlu.ras.dsfsr_1_new_in
`define ISFSR_NEW_IN_17 `SPC2.tlu.ras.isfsr_1_new_in

`define DSFSR_17 `SPC2.tlu.ras.dsfsr_1
`define ISFSR_17 `SPC2.tlu.ras.isfsr_1
`define DSFAR_17 `SPC2.tlu.dfd.dsfar_1

`define ASI_WR_DSFSR_17 `SPC2.tlu.ras.asi_wr_dsfsr[1]
`define ASI_WR_ISFSR_17 `SPC2.tlu.ras.asi_wr_isfsr[1]

`define RAS_WRITE_DESR_1st_17  `SPC2.tlu.dfd.ras_write_desr_1st[1]
`define RAS_WRITE_DESR_2nd_17  `SPC2.tlu.dfd.ras_write_desr_2nd[1]
`define DESR_asi_rd_17  `SPC2.tlu.ras_rd_desr[1]
`define DESR_17  `SPC2.tlu.dfd.desr_1

`define RAS_WRITE_FESR_17  `SPC2.tlu.ras.write_fesr[1]
`define FESR_17  `SPC2.tlu.dfd.fesr_1

`define ST_ERR_17  `SPC2.tlu.trl0.take_ftt & `SPC2.tlu.trl0.trap[1]
`define SW_REC_ERR_17  `SPC2.tlu.trl0.take_ade & `SPC2.tlu.trl0.trap[1]
`define DATA_ACC_ERR_17  `SPC2.tlu.trl0.take_dae & `SPC2.tlu.trl0.trap[1]
`define INST_ACC_ERR_17  `SPC2.tlu.trl0.take_iae & `SPC2.tlu.trl0.trap[1]
`define INT_PROC_ERR_17  `SPC2.tlu.trl0.take_ipe & `SPC2.tlu.trl0.trap[1]
`define HW_CORR_ERR_17  `SPC2.tlu.trl0.take_eer & `SPC2.tlu.trl0.trap[1]
`define INST_ACC_MMU_ERR_17  `SPC2.tlu.trl0.take_ime & `SPC2.tlu.trl0.trap[1]
`define DATA_ACC_MMU_ERR_17  `SPC2.tlu.trl0.take_dme & `SPC2.tlu.trl0.trap[1]

`define LSU_LD_VALID_B	`PROBES2.lsu_ld_valid
`define LSU_TID_DEC_B_17 `PROBES2.lsu_tid_dec_b[1]
`define ASI_LD_17	`SPC2.lsu.lmd.lmq1_pkt[60] & (`SPC2.lsu.lmd.lmq1_pkt[49:48] == 2'b0)
`define ASI_17	`SPC2.lsu.lmd.lmq1_pkt[47:40]
`define ASI_ADDR_17	`SPC2.lsu.lmd.lmq1_pkt[39:0]
`define ASI_LD_DATA_17	`SPC2.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_17	tb_top.nas_top.c2.t1.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_2	`SPC2.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_2	`SPC2.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC2.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_17)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_17[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_17  != 4'b0) && ~`ASI_WR_DSFSR_17;
        update_isfsr_w <= (`ISFSR_NEW_IN_17  != 3'b0) && ~`ASI_WR_ISFSR_17;
        desr_wr <=  (`RAS_WRITE_DESR_1st_17  || `RAS_WRITE_DESR_2nd_17);
        update_dfesr_w <= `RAS_WRITE_FESR_17;
        take_err_trap_fx4 <= `ST_ERR_17 | `SW_REC_ERR_17  | `DATA_ACC_ERR_17
                           | `INST_ACC_ERR_17 | `INT_PROC_ERR_17
                           | `HW_CORR_ERR_17 | `INST_ACC_MMU_ERR_17
                           | `DATA_ACC_MMU_ERR_17 ;


        if (`ST_ERR_17) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_17) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_17) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_17) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_17) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_17) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_17) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_17) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_17[63:56], 45'b0, `DESR_17[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_17[63:56], 45'b0, `DESR_17[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_17)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_17[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_17[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_17[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_17[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_17[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_17[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC2.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_17;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_17)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_17)
	begin
	     case (`ASI_17)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_17 >= 0) &  (`ASI_ADDR_17 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_17 >= 0) &  (`ASI_ADDR_17 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_17 >= 0) &  (`ASI_ADDR_17 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_17 >= 0) &  (`ASI_ADDR_17 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_17 >= 0) &  (`ASI_ADDR_17 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_17 >= 0) &  (`ASI_ADDR_17 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_17 >= 0) &  (`ASI_ADDR_17 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_17 >= 0) &  (`ASI_ADDR_17 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_17 >= 0) &  (`ASI_ADDR_17 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_17 >= 0) &  (`ASI_ADDR_17 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC2.lsu.lmd.lmq1_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_17 == 40'h20) ||  (`ASI_ADDR_17 == 40'h30)
			     || (`ASI_ADDR_17 == 40'h80)  
				 || ((`ASI_ADDR_17 == 40'ha0) & (`SPU_MA_BUSY_2 == 0) & (`SPU_MA_TID_2 == 1))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_17 == 40'h20) ||  (`ASI_ADDR_17 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_17, `ASI_ADDR_17, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_17, {24'b0, `ASI_ADDR_17}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c2t2 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 2;
assign mytid = 2;
assign   mytnum = 2*8 + 2;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC2.l2clk) ;
	@(posedge `SPC2.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_18  `SPC2.tlu.ras.dsfsr_2_new_in
`define ISFSR_NEW_IN_18 `SPC2.tlu.ras.isfsr_2_new_in

`define DSFSR_18 `SPC2.tlu.ras.dsfsr_2
`define ISFSR_18 `SPC2.tlu.ras.isfsr_2
`define DSFAR_18 `SPC2.tlu.dfd.dsfar_2

`define ASI_WR_DSFSR_18 `SPC2.tlu.ras.asi_wr_dsfsr[2]
`define ASI_WR_ISFSR_18 `SPC2.tlu.ras.asi_wr_isfsr[2]

`define RAS_WRITE_DESR_1st_18  `SPC2.tlu.dfd.ras_write_desr_1st[2]
`define RAS_WRITE_DESR_2nd_18  `SPC2.tlu.dfd.ras_write_desr_2nd[2]
`define DESR_asi_rd_18  `SPC2.tlu.ras_rd_desr[2]
`define DESR_18  `SPC2.tlu.dfd.desr_2

`define RAS_WRITE_FESR_18  `SPC2.tlu.ras.write_fesr[2]
`define FESR_18  `SPC2.tlu.dfd.fesr_2

`define ST_ERR_18  `SPC2.tlu.trl0.take_ftt & `SPC2.tlu.trl0.trap[2]
`define SW_REC_ERR_18  `SPC2.tlu.trl0.take_ade & `SPC2.tlu.trl0.trap[2]
`define DATA_ACC_ERR_18  `SPC2.tlu.trl0.take_dae & `SPC2.tlu.trl0.trap[2]
`define INST_ACC_ERR_18  `SPC2.tlu.trl0.take_iae & `SPC2.tlu.trl0.trap[2]
`define INT_PROC_ERR_18  `SPC2.tlu.trl0.take_ipe & `SPC2.tlu.trl0.trap[2]
`define HW_CORR_ERR_18  `SPC2.tlu.trl0.take_eer & `SPC2.tlu.trl0.trap[2]
`define INST_ACC_MMU_ERR_18  `SPC2.tlu.trl0.take_ime & `SPC2.tlu.trl0.trap[2]
`define DATA_ACC_MMU_ERR_18  `SPC2.tlu.trl0.take_dme & `SPC2.tlu.trl0.trap[2]

`define LSU_LD_VALID_B	`PROBES2.lsu_ld_valid
`define LSU_TID_DEC_B_18 `PROBES2.lsu_tid_dec_b[2]
`define ASI_LD_18	`SPC2.lsu.lmd.lmq2_pkt[60] & (`SPC2.lsu.lmd.lmq2_pkt[49:48] == 2'b0)
`define ASI_18	`SPC2.lsu.lmd.lmq2_pkt[47:40]
`define ASI_ADDR_18	`SPC2.lsu.lmd.lmq2_pkt[39:0]
`define ASI_LD_DATA_18	`SPC2.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_18	tb_top.nas_top.c2.t2.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_2	`SPC2.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_2	`SPC2.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC2.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_18)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_18[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_18  != 4'b0) && ~`ASI_WR_DSFSR_18;
        update_isfsr_w <= (`ISFSR_NEW_IN_18  != 3'b0) && ~`ASI_WR_ISFSR_18;
        desr_wr <=  (`RAS_WRITE_DESR_1st_18  || `RAS_WRITE_DESR_2nd_18);
        update_dfesr_w <= `RAS_WRITE_FESR_18;
        take_err_trap_fx4 <= `ST_ERR_18 | `SW_REC_ERR_18  | `DATA_ACC_ERR_18
                           | `INST_ACC_ERR_18 | `INT_PROC_ERR_18
                           | `HW_CORR_ERR_18 | `INST_ACC_MMU_ERR_18
                           | `DATA_ACC_MMU_ERR_18 ;


        if (`ST_ERR_18) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_18) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_18) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_18) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_18) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_18) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_18) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_18) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_18[63:56], 45'b0, `DESR_18[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_18[63:56], 45'b0, `DESR_18[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_18)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_18[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_18[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_18[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_18[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_18[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_18[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC2.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_18;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_18)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_18)
	begin
	     case (`ASI_18)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_18 >= 0) &  (`ASI_ADDR_18 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_18 >= 0) &  (`ASI_ADDR_18 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_18 >= 0) &  (`ASI_ADDR_18 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_18 >= 0) &  (`ASI_ADDR_18 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_18 >= 0) &  (`ASI_ADDR_18 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_18 >= 0) &  (`ASI_ADDR_18 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_18 >= 0) &  (`ASI_ADDR_18 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_18 >= 0) &  (`ASI_ADDR_18 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_18 >= 0) &  (`ASI_ADDR_18 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_18 >= 0) &  (`ASI_ADDR_18 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC2.lsu.lmd.lmq2_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_18 == 40'h20) ||  (`ASI_ADDR_18 == 40'h30)
			     || (`ASI_ADDR_18 == 40'h80)  
				 || ((`ASI_ADDR_18 == 40'ha0) & (`SPU_MA_BUSY_2 == 0) & (`SPU_MA_TID_2 == 2))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_18 == 40'h20) ||  (`ASI_ADDR_18 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_18, `ASI_ADDR_18, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_18, {24'b0, `ASI_ADDR_18}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c2t3 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 2;
assign mytid = 3;
assign   mytnum = 2*8 + 3;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC2.l2clk) ;
	@(posedge `SPC2.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_19  `SPC2.tlu.ras.dsfsr_3_new_in
`define ISFSR_NEW_IN_19 `SPC2.tlu.ras.isfsr_3_new_in

`define DSFSR_19 `SPC2.tlu.ras.dsfsr_3
`define ISFSR_19 `SPC2.tlu.ras.isfsr_3
`define DSFAR_19 `SPC2.tlu.dfd.dsfar_3

`define ASI_WR_DSFSR_19 `SPC2.tlu.ras.asi_wr_dsfsr[3]
`define ASI_WR_ISFSR_19 `SPC2.tlu.ras.asi_wr_isfsr[3]

`define RAS_WRITE_DESR_1st_19  `SPC2.tlu.dfd.ras_write_desr_1st[3]
`define RAS_WRITE_DESR_2nd_19  `SPC2.tlu.dfd.ras_write_desr_2nd[3]
`define DESR_asi_rd_19  `SPC2.tlu.ras_rd_desr[3]
`define DESR_19  `SPC2.tlu.dfd.desr_3

`define RAS_WRITE_FESR_19  `SPC2.tlu.ras.write_fesr[3]
`define FESR_19  `SPC2.tlu.dfd.fesr_3

`define ST_ERR_19  `SPC2.tlu.trl0.take_ftt & `SPC2.tlu.trl0.trap[3]
`define SW_REC_ERR_19  `SPC2.tlu.trl0.take_ade & `SPC2.tlu.trl0.trap[3]
`define DATA_ACC_ERR_19  `SPC2.tlu.trl0.take_dae & `SPC2.tlu.trl0.trap[3]
`define INST_ACC_ERR_19  `SPC2.tlu.trl0.take_iae & `SPC2.tlu.trl0.trap[3]
`define INT_PROC_ERR_19  `SPC2.tlu.trl0.take_ipe & `SPC2.tlu.trl0.trap[3]
`define HW_CORR_ERR_19  `SPC2.tlu.trl0.take_eer & `SPC2.tlu.trl0.trap[3]
`define INST_ACC_MMU_ERR_19  `SPC2.tlu.trl0.take_ime & `SPC2.tlu.trl0.trap[3]
`define DATA_ACC_MMU_ERR_19  `SPC2.tlu.trl0.take_dme & `SPC2.tlu.trl0.trap[3]

`define LSU_LD_VALID_B	`PROBES2.lsu_ld_valid
`define LSU_TID_DEC_B_19 `PROBES2.lsu_tid_dec_b[3]
`define ASI_LD_19	`SPC2.lsu.lmd.lmq3_pkt[60] & (`SPC2.lsu.lmd.lmq3_pkt[49:48] == 2'b0)
`define ASI_19	`SPC2.lsu.lmd.lmq3_pkt[47:40]
`define ASI_ADDR_19	`SPC2.lsu.lmd.lmq3_pkt[39:0]
`define ASI_LD_DATA_19	`SPC2.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_19	tb_top.nas_top.c2.t3.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_2	`SPC2.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_2	`SPC2.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC2.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_19)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_19[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_19  != 4'b0) && ~`ASI_WR_DSFSR_19;
        update_isfsr_w <= (`ISFSR_NEW_IN_19  != 3'b0) && ~`ASI_WR_ISFSR_19;
        desr_wr <=  (`RAS_WRITE_DESR_1st_19  || `RAS_WRITE_DESR_2nd_19);
        update_dfesr_w <= `RAS_WRITE_FESR_19;
        take_err_trap_fx4 <= `ST_ERR_19 | `SW_REC_ERR_19  | `DATA_ACC_ERR_19
                           | `INST_ACC_ERR_19 | `INT_PROC_ERR_19
                           | `HW_CORR_ERR_19 | `INST_ACC_MMU_ERR_19
                           | `DATA_ACC_MMU_ERR_19 ;


        if (`ST_ERR_19) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_19) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_19) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_19) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_19) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_19) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_19) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_19) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_19[63:56], 45'b0, `DESR_19[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_19[63:56], 45'b0, `DESR_19[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_19)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_19[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_19[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_19[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_19[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_19[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_19[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC2.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_19;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_19)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_19)
	begin
	     case (`ASI_19)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_19 >= 0) &  (`ASI_ADDR_19 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_19 >= 0) &  (`ASI_ADDR_19 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_19 >= 0) &  (`ASI_ADDR_19 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_19 >= 0) &  (`ASI_ADDR_19 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_19 >= 0) &  (`ASI_ADDR_19 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_19 >= 0) &  (`ASI_ADDR_19 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_19 >= 0) &  (`ASI_ADDR_19 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_19 >= 0) &  (`ASI_ADDR_19 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_19 >= 0) &  (`ASI_ADDR_19 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_19 >= 0) &  (`ASI_ADDR_19 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC2.lsu.lmd.lmq3_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_19 == 40'h20) ||  (`ASI_ADDR_19 == 40'h30)
			     || (`ASI_ADDR_19 == 40'h80)  
				 || ((`ASI_ADDR_19 == 40'ha0) & (`SPU_MA_BUSY_2 == 0) & (`SPU_MA_TID_2 == 3))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_19 == 40'h20) ||  (`ASI_ADDR_19 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_19, `ASI_ADDR_19, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_19, {24'b0, `ASI_ADDR_19}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c2t4 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 2;
assign mytid = 4;
assign   mytnum = 2*8 + 4;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC2.l2clk) ;
	@(posedge `SPC2.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_20  `SPC2.tlu.ras.dsfsr_4_new_in
`define ISFSR_NEW_IN_20 `SPC2.tlu.ras.isfsr_4_new_in

`define DSFSR_20 `SPC2.tlu.ras.dsfsr_4
`define ISFSR_20 `SPC2.tlu.ras.isfsr_4
`define DSFAR_20 `SPC2.tlu.dfd.dsfar_4

`define ASI_WR_DSFSR_20 `SPC2.tlu.ras.asi_wr_dsfsr[4]
`define ASI_WR_ISFSR_20 `SPC2.tlu.ras.asi_wr_isfsr[4]

`define RAS_WRITE_DESR_1st_20  `SPC2.tlu.dfd.ras_write_desr_1st[4]
`define RAS_WRITE_DESR_2nd_20  `SPC2.tlu.dfd.ras_write_desr_2nd[4]
`define DESR_asi_rd_20  `SPC2.tlu.ras_rd_desr[4]
`define DESR_20  `SPC2.tlu.dfd.desr_4

`define RAS_WRITE_FESR_20  `SPC2.tlu.ras.write_fesr[4]
`define FESR_20  `SPC2.tlu.dfd.fesr_4

`define ST_ERR_20  `SPC2.tlu.trl1.take_ftt & `SPC2.tlu.trl1.trap[0]
`define SW_REC_ERR_20  `SPC2.tlu.trl1.take_ade & `SPC2.tlu.trl1.trap[0]
`define DATA_ACC_ERR_20  `SPC2.tlu.trl1.take_dae & `SPC2.tlu.trl1.trap[0]
`define INST_ACC_ERR_20  `SPC2.tlu.trl1.take_iae & `SPC2.tlu.trl1.trap[0]
`define INT_PROC_ERR_20  `SPC2.tlu.trl1.take_ipe & `SPC2.tlu.trl1.trap[0]
`define HW_CORR_ERR_20  `SPC2.tlu.trl1.take_eer & `SPC2.tlu.trl1.trap[0]
`define INST_ACC_MMU_ERR_20  `SPC2.tlu.trl1.take_ime & `SPC2.tlu.trl1.trap[0]
`define DATA_ACC_MMU_ERR_20  `SPC2.tlu.trl1.take_dme & `SPC2.tlu.trl1.trap[0]

`define LSU_LD_VALID_B	`PROBES2.lsu_ld_valid
`define LSU_TID_DEC_B_20 `PROBES2.lsu_tid_dec_b[4]
`define ASI_LD_20	`SPC2.lsu.lmd.lmq4_pkt[60] & (`SPC2.lsu.lmd.lmq4_pkt[49:48] == 2'b0)
`define ASI_20	`SPC2.lsu.lmd.lmq4_pkt[47:40]
`define ASI_ADDR_20	`SPC2.lsu.lmd.lmq4_pkt[39:0]
`define ASI_LD_DATA_20	`SPC2.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_20	tb_top.nas_top.c2.t4.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_2	`SPC2.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_2	`SPC2.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC2.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_20)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_20[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_20  != 4'b0) && ~`ASI_WR_DSFSR_20;
        update_isfsr_w <= (`ISFSR_NEW_IN_20  != 3'b0) && ~`ASI_WR_ISFSR_20;
        desr_wr <=  (`RAS_WRITE_DESR_1st_20  || `RAS_WRITE_DESR_2nd_20);
        update_dfesr_w <= `RAS_WRITE_FESR_20;
        take_err_trap_fx4 <= `ST_ERR_20 | `SW_REC_ERR_20  | `DATA_ACC_ERR_20
                           | `INST_ACC_ERR_20 | `INT_PROC_ERR_20
                           | `HW_CORR_ERR_20 | `INST_ACC_MMU_ERR_20
                           | `DATA_ACC_MMU_ERR_20 ;


        if (`ST_ERR_20) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_20) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_20) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_20) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_20) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_20) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_20) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_20) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_20[63:56], 45'b0, `DESR_20[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_20[63:56], 45'b0, `DESR_20[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_20)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_20[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_20[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_20[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_20[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_20[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_20[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC2.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_20;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_20)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_20)
	begin
	     case (`ASI_20)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_20 >= 0) &  (`ASI_ADDR_20 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_20 >= 0) &  (`ASI_ADDR_20 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_20 >= 0) &  (`ASI_ADDR_20 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_20 >= 0) &  (`ASI_ADDR_20 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_20 >= 0) &  (`ASI_ADDR_20 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_20 >= 0) &  (`ASI_ADDR_20 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_20 >= 0) &  (`ASI_ADDR_20 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_20 >= 0) &  (`ASI_ADDR_20 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_20 >= 0) &  (`ASI_ADDR_20 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_20 >= 0) &  (`ASI_ADDR_20 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC2.lsu.lmd.lmq4_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_20 == 40'h20) ||  (`ASI_ADDR_20 == 40'h30)
			     || (`ASI_ADDR_20 == 40'h80)  
				 || ((`ASI_ADDR_20 == 40'ha0) & (`SPU_MA_BUSY_2 == 0) & (`SPU_MA_TID_2 == 4))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_20 == 40'h20) ||  (`ASI_ADDR_20 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_20, `ASI_ADDR_20, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_20, {24'b0, `ASI_ADDR_20}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c2t5 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 2;
assign mytid = 5;
assign   mytnum = 2*8 + 5;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC2.l2clk) ;
	@(posedge `SPC2.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_21  `SPC2.tlu.ras.dsfsr_5_new_in
`define ISFSR_NEW_IN_21 `SPC2.tlu.ras.isfsr_5_new_in

`define DSFSR_21 `SPC2.tlu.ras.dsfsr_5
`define ISFSR_21 `SPC2.tlu.ras.isfsr_5
`define DSFAR_21 `SPC2.tlu.dfd.dsfar_5

`define ASI_WR_DSFSR_21 `SPC2.tlu.ras.asi_wr_dsfsr[5]
`define ASI_WR_ISFSR_21 `SPC2.tlu.ras.asi_wr_isfsr[5]

`define RAS_WRITE_DESR_1st_21  `SPC2.tlu.dfd.ras_write_desr_1st[5]
`define RAS_WRITE_DESR_2nd_21  `SPC2.tlu.dfd.ras_write_desr_2nd[5]
`define DESR_asi_rd_21  `SPC2.tlu.ras_rd_desr[5]
`define DESR_21  `SPC2.tlu.dfd.desr_5

`define RAS_WRITE_FESR_21  `SPC2.tlu.ras.write_fesr[5]
`define FESR_21  `SPC2.tlu.dfd.fesr_5

`define ST_ERR_21  `SPC2.tlu.trl1.take_ftt & `SPC2.tlu.trl1.trap[1]
`define SW_REC_ERR_21  `SPC2.tlu.trl1.take_ade & `SPC2.tlu.trl1.trap[1]
`define DATA_ACC_ERR_21  `SPC2.tlu.trl1.take_dae & `SPC2.tlu.trl1.trap[1]
`define INST_ACC_ERR_21  `SPC2.tlu.trl1.take_iae & `SPC2.tlu.trl1.trap[1]
`define INT_PROC_ERR_21  `SPC2.tlu.trl1.take_ipe & `SPC2.tlu.trl1.trap[1]
`define HW_CORR_ERR_21  `SPC2.tlu.trl1.take_eer & `SPC2.tlu.trl1.trap[1]
`define INST_ACC_MMU_ERR_21  `SPC2.tlu.trl1.take_ime & `SPC2.tlu.trl1.trap[1]
`define DATA_ACC_MMU_ERR_21  `SPC2.tlu.trl1.take_dme & `SPC2.tlu.trl1.trap[1]

`define LSU_LD_VALID_B	`PROBES2.lsu_ld_valid
`define LSU_TID_DEC_B_21 `PROBES2.lsu_tid_dec_b[5]
`define ASI_LD_21	`SPC2.lsu.lmd.lmq5_pkt[60] & (`SPC2.lsu.lmd.lmq5_pkt[49:48] == 2'b0)
`define ASI_21	`SPC2.lsu.lmd.lmq5_pkt[47:40]
`define ASI_ADDR_21	`SPC2.lsu.lmd.lmq5_pkt[39:0]
`define ASI_LD_DATA_21	`SPC2.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_21	tb_top.nas_top.c2.t5.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_2	`SPC2.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_2	`SPC2.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC2.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_21)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_21[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_21  != 4'b0) && ~`ASI_WR_DSFSR_21;
        update_isfsr_w <= (`ISFSR_NEW_IN_21  != 3'b0) && ~`ASI_WR_ISFSR_21;
        desr_wr <=  (`RAS_WRITE_DESR_1st_21  || `RAS_WRITE_DESR_2nd_21);
        update_dfesr_w <= `RAS_WRITE_FESR_21;
        take_err_trap_fx4 <= `ST_ERR_21 | `SW_REC_ERR_21  | `DATA_ACC_ERR_21
                           | `INST_ACC_ERR_21 | `INT_PROC_ERR_21
                           | `HW_CORR_ERR_21 | `INST_ACC_MMU_ERR_21
                           | `DATA_ACC_MMU_ERR_21 ;


        if (`ST_ERR_21) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_21) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_21) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_21) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_21) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_21) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_21) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_21) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_21[63:56], 45'b0, `DESR_21[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_21[63:56], 45'b0, `DESR_21[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_21)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_21[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_21[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_21[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_21[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_21[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_21[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC2.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_21;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_21)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_21)
	begin
	     case (`ASI_21)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_21 >= 0) &  (`ASI_ADDR_21 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_21 >= 0) &  (`ASI_ADDR_21 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_21 >= 0) &  (`ASI_ADDR_21 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_21 >= 0) &  (`ASI_ADDR_21 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_21 >= 0) &  (`ASI_ADDR_21 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_21 >= 0) &  (`ASI_ADDR_21 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_21 >= 0) &  (`ASI_ADDR_21 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_21 >= 0) &  (`ASI_ADDR_21 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_21 >= 0) &  (`ASI_ADDR_21 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_21 >= 0) &  (`ASI_ADDR_21 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC2.lsu.lmd.lmq5_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_21 == 40'h20) ||  (`ASI_ADDR_21 == 40'h30)
			     || (`ASI_ADDR_21 == 40'h80)  
				 || ((`ASI_ADDR_21 == 40'ha0) & (`SPU_MA_BUSY_2 == 0) & (`SPU_MA_TID_2 == 5))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_21 == 40'h20) ||  (`ASI_ADDR_21 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_21, `ASI_ADDR_21, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_21, {24'b0, `ASI_ADDR_21}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c2t6 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 2;
assign mytid = 6;
assign   mytnum = 2*8 + 6;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC2.l2clk) ;
	@(posedge `SPC2.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_22  `SPC2.tlu.ras.dsfsr_6_new_in
`define ISFSR_NEW_IN_22 `SPC2.tlu.ras.isfsr_6_new_in

`define DSFSR_22 `SPC2.tlu.ras.dsfsr_6
`define ISFSR_22 `SPC2.tlu.ras.isfsr_6
`define DSFAR_22 `SPC2.tlu.dfd.dsfar_6

`define ASI_WR_DSFSR_22 `SPC2.tlu.ras.asi_wr_dsfsr[6]
`define ASI_WR_ISFSR_22 `SPC2.tlu.ras.asi_wr_isfsr[6]

`define RAS_WRITE_DESR_1st_22  `SPC2.tlu.dfd.ras_write_desr_1st[6]
`define RAS_WRITE_DESR_2nd_22  `SPC2.tlu.dfd.ras_write_desr_2nd[6]
`define DESR_asi_rd_22  `SPC2.tlu.ras_rd_desr[6]
`define DESR_22  `SPC2.tlu.dfd.desr_6

`define RAS_WRITE_FESR_22  `SPC2.tlu.ras.write_fesr[6]
`define FESR_22  `SPC2.tlu.dfd.fesr_6

`define ST_ERR_22  `SPC2.tlu.trl1.take_ftt & `SPC2.tlu.trl1.trap[2]
`define SW_REC_ERR_22  `SPC2.tlu.trl1.take_ade & `SPC2.tlu.trl1.trap[2]
`define DATA_ACC_ERR_22  `SPC2.tlu.trl1.take_dae & `SPC2.tlu.trl1.trap[2]
`define INST_ACC_ERR_22  `SPC2.tlu.trl1.take_iae & `SPC2.tlu.trl1.trap[2]
`define INT_PROC_ERR_22  `SPC2.tlu.trl1.take_ipe & `SPC2.tlu.trl1.trap[2]
`define HW_CORR_ERR_22  `SPC2.tlu.trl1.take_eer & `SPC2.tlu.trl1.trap[2]
`define INST_ACC_MMU_ERR_22  `SPC2.tlu.trl1.take_ime & `SPC2.tlu.trl1.trap[2]
`define DATA_ACC_MMU_ERR_22  `SPC2.tlu.trl1.take_dme & `SPC2.tlu.trl1.trap[2]

`define LSU_LD_VALID_B	`PROBES2.lsu_ld_valid
`define LSU_TID_DEC_B_22 `PROBES2.lsu_tid_dec_b[6]
`define ASI_LD_22	`SPC2.lsu.lmd.lmq6_pkt[60] & (`SPC2.lsu.lmd.lmq6_pkt[49:48] == 2'b0)
`define ASI_22	`SPC2.lsu.lmd.lmq6_pkt[47:40]
`define ASI_ADDR_22	`SPC2.lsu.lmd.lmq6_pkt[39:0]
`define ASI_LD_DATA_22	`SPC2.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_22	tb_top.nas_top.c2.t6.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_2	`SPC2.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_2	`SPC2.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC2.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_22)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_22[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_22  != 4'b0) && ~`ASI_WR_DSFSR_22;
        update_isfsr_w <= (`ISFSR_NEW_IN_22  != 3'b0) && ~`ASI_WR_ISFSR_22;
        desr_wr <=  (`RAS_WRITE_DESR_1st_22  || `RAS_WRITE_DESR_2nd_22);
        update_dfesr_w <= `RAS_WRITE_FESR_22;
        take_err_trap_fx4 <= `ST_ERR_22 | `SW_REC_ERR_22  | `DATA_ACC_ERR_22
                           | `INST_ACC_ERR_22 | `INT_PROC_ERR_22
                           | `HW_CORR_ERR_22 | `INST_ACC_MMU_ERR_22
                           | `DATA_ACC_MMU_ERR_22 ;


        if (`ST_ERR_22) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_22) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_22) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_22) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_22) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_22) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_22) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_22) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_22[63:56], 45'b0, `DESR_22[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_22[63:56], 45'b0, `DESR_22[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_22)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_22[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_22[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_22[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_22[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_22[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_22[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC2.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_22;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_22)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_22)
	begin
	     case (`ASI_22)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_22 >= 0) &  (`ASI_ADDR_22 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_22 >= 0) &  (`ASI_ADDR_22 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_22 >= 0) &  (`ASI_ADDR_22 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_22 >= 0) &  (`ASI_ADDR_22 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_22 >= 0) &  (`ASI_ADDR_22 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_22 >= 0) &  (`ASI_ADDR_22 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_22 >= 0) &  (`ASI_ADDR_22 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_22 >= 0) &  (`ASI_ADDR_22 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_22 >= 0) &  (`ASI_ADDR_22 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_22 >= 0) &  (`ASI_ADDR_22 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC2.lsu.lmd.lmq6_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_22 == 40'h20) ||  (`ASI_ADDR_22 == 40'h30)
			     || (`ASI_ADDR_22 == 40'h80)  
				 || ((`ASI_ADDR_22 == 40'ha0) & (`SPU_MA_BUSY_2 == 0) & (`SPU_MA_TID_2 == 6))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_22 == 40'h20) ||  (`ASI_ADDR_22 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_22, `ASI_ADDR_22, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_22, {24'b0, `ASI_ADDR_22}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c2t7 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 2;
assign mytid = 7;
assign   mytnum = 2*8 + 7;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC2.l2clk) ;
	@(posedge `SPC2.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_23  `SPC2.tlu.ras.dsfsr_7_new_in
`define ISFSR_NEW_IN_23 `SPC2.tlu.ras.isfsr_7_new_in

`define DSFSR_23 `SPC2.tlu.ras.dsfsr_7
`define ISFSR_23 `SPC2.tlu.ras.isfsr_7
`define DSFAR_23 `SPC2.tlu.dfd.dsfar_7

`define ASI_WR_DSFSR_23 `SPC2.tlu.ras.asi_wr_dsfsr[7]
`define ASI_WR_ISFSR_23 `SPC2.tlu.ras.asi_wr_isfsr[7]

`define RAS_WRITE_DESR_1st_23  `SPC2.tlu.dfd.ras_write_desr_1st[7]
`define RAS_WRITE_DESR_2nd_23  `SPC2.tlu.dfd.ras_write_desr_2nd[7]
`define DESR_asi_rd_23  `SPC2.tlu.ras_rd_desr[7]
`define DESR_23  `SPC2.tlu.dfd.desr_7

`define RAS_WRITE_FESR_23  `SPC2.tlu.ras.write_fesr[7]
`define FESR_23  `SPC2.tlu.dfd.fesr_7

`define ST_ERR_23  `SPC2.tlu.trl1.take_ftt & `SPC2.tlu.trl1.trap[3]
`define SW_REC_ERR_23  `SPC2.tlu.trl1.take_ade & `SPC2.tlu.trl1.trap[3]
`define DATA_ACC_ERR_23  `SPC2.tlu.trl1.take_dae & `SPC2.tlu.trl1.trap[3]
`define INST_ACC_ERR_23  `SPC2.tlu.trl1.take_iae & `SPC2.tlu.trl1.trap[3]
`define INT_PROC_ERR_23  `SPC2.tlu.trl1.take_ipe & `SPC2.tlu.trl1.trap[3]
`define HW_CORR_ERR_23  `SPC2.tlu.trl1.take_eer & `SPC2.tlu.trl1.trap[3]
`define INST_ACC_MMU_ERR_23  `SPC2.tlu.trl1.take_ime & `SPC2.tlu.trl1.trap[3]
`define DATA_ACC_MMU_ERR_23  `SPC2.tlu.trl1.take_dme & `SPC2.tlu.trl1.trap[3]

`define LSU_LD_VALID_B	`PROBES2.lsu_ld_valid
`define LSU_TID_DEC_B_23 `PROBES2.lsu_tid_dec_b[7]
`define ASI_LD_23	`SPC2.lsu.lmd.lmq7_pkt[60] & (`SPC2.lsu.lmd.lmq7_pkt[49:48] == 2'b0)
`define ASI_23	`SPC2.lsu.lmd.lmq7_pkt[47:40]
`define ASI_ADDR_23	`SPC2.lsu.lmd.lmq7_pkt[39:0]
`define ASI_LD_DATA_23	`SPC2.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_23	tb_top.nas_top.c2.t7.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_2	`SPC2.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_2	`SPC2.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC2.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_23)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_23[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_23  != 4'b0) && ~`ASI_WR_DSFSR_23;
        update_isfsr_w <= (`ISFSR_NEW_IN_23  != 3'b0) && ~`ASI_WR_ISFSR_23;
        desr_wr <=  (`RAS_WRITE_DESR_1st_23  || `RAS_WRITE_DESR_2nd_23);
        update_dfesr_w <= `RAS_WRITE_FESR_23;
        take_err_trap_fx4 <= `ST_ERR_23 | `SW_REC_ERR_23  | `DATA_ACC_ERR_23
                           | `INST_ACC_ERR_23 | `INT_PROC_ERR_23
                           | `HW_CORR_ERR_23 | `INST_ACC_MMU_ERR_23
                           | `DATA_ACC_MMU_ERR_23 ;


        if (`ST_ERR_23) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_23) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_23) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_23) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_23) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_23) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_23) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_23) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_23[63:56], 45'b0, `DESR_23[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_23[63:56], 45'b0, `DESR_23[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_23)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_23[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_23[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_23[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_23[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_23[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_23[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC2.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_23;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_23)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_23)
	begin
	     case (`ASI_23)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_23 >= 0) &  (`ASI_ADDR_23 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_23 >= 0) &  (`ASI_ADDR_23 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_23 >= 0) &  (`ASI_ADDR_23 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_23 >= 0) &  (`ASI_ADDR_23 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_23 >= 0) &  (`ASI_ADDR_23 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_23 >= 0) &  (`ASI_ADDR_23 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_23 >= 0) &  (`ASI_ADDR_23 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_23 >= 0) &  (`ASI_ADDR_23 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_23 >= 0) &  (`ASI_ADDR_23 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_23 >= 0) &  (`ASI_ADDR_23 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC2.lsu.lmd.lmq7_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_23 == 40'h20) ||  (`ASI_ADDR_23 == 40'h30)
			     || (`ASI_ADDR_23 == 40'h80)  
				 || ((`ASI_ADDR_23 == 40'ha0) & (`SPU_MA_BUSY_2 == 0) & (`SPU_MA_TID_2 == 7))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_23 == 40'h20) ||  (`ASI_ADDR_23 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_23, `ASI_ADDR_23, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_23, {24'b0, `ASI_ADDR_23}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule

`endif

`ifdef CORE_3



module err_c3t0 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 3;
assign mytid = 0;
assign   mytnum = 3*8 + 0;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC3.l2clk) ;
	@(posedge `SPC3.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_24  `SPC3.tlu.ras.dsfsr_0_new_in
`define ISFSR_NEW_IN_24 `SPC3.tlu.ras.isfsr_0_new_in

`define DSFSR_24 `SPC3.tlu.ras.dsfsr_0
`define ISFSR_24 `SPC3.tlu.ras.isfsr_0
`define DSFAR_24 `SPC3.tlu.dfd.dsfar_0

`define ASI_WR_DSFSR_24 `SPC3.tlu.ras.asi_wr_dsfsr[0]
`define ASI_WR_ISFSR_24 `SPC3.tlu.ras.asi_wr_isfsr[0]

`define RAS_WRITE_DESR_1st_24  `SPC3.tlu.dfd.ras_write_desr_1st[0]
`define RAS_WRITE_DESR_2nd_24  `SPC3.tlu.dfd.ras_write_desr_2nd[0]
`define DESR_asi_rd_24  `SPC3.tlu.ras_rd_desr[0]
`define DESR_24  `SPC3.tlu.dfd.desr_0

`define RAS_WRITE_FESR_24  `SPC3.tlu.ras.write_fesr[0]
`define FESR_24  `SPC3.tlu.dfd.fesr_0

`define ST_ERR_24  `SPC3.tlu.trl0.take_ftt & `SPC3.tlu.trl0.trap[0]
`define SW_REC_ERR_24  `SPC3.tlu.trl0.take_ade & `SPC3.tlu.trl0.trap[0]
`define DATA_ACC_ERR_24  `SPC3.tlu.trl0.take_dae & `SPC3.tlu.trl0.trap[0]
`define INST_ACC_ERR_24  `SPC3.tlu.trl0.take_iae & `SPC3.tlu.trl0.trap[0]
`define INT_PROC_ERR_24  `SPC3.tlu.trl0.take_ipe & `SPC3.tlu.trl0.trap[0]
`define HW_CORR_ERR_24  `SPC3.tlu.trl0.take_eer & `SPC3.tlu.trl0.trap[0]
`define INST_ACC_MMU_ERR_24  `SPC3.tlu.trl0.take_ime & `SPC3.tlu.trl0.trap[0]
`define DATA_ACC_MMU_ERR_24  `SPC3.tlu.trl0.take_dme & `SPC3.tlu.trl0.trap[0]

`define LSU_LD_VALID_B	`PROBES3.lsu_ld_valid
`define LSU_TID_DEC_B_24 `PROBES3.lsu_tid_dec_b[0]
`define ASI_LD_24	`SPC3.lsu.lmd.lmq0_pkt[60] & (`SPC3.lsu.lmd.lmq0_pkt[49:48] == 2'b0)
`define ASI_24	`SPC3.lsu.lmd.lmq0_pkt[47:40]
`define ASI_ADDR_24	`SPC3.lsu.lmd.lmq0_pkt[39:0]
`define ASI_LD_DATA_24	`SPC3.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_24	tb_top.nas_top.c3.t0.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_3	`SPC3.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_3	`SPC3.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC3.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_24)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_24[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_24  != 4'b0) && ~`ASI_WR_DSFSR_24;
        update_isfsr_w <= (`ISFSR_NEW_IN_24  != 3'b0) && ~`ASI_WR_ISFSR_24;
        desr_wr <=  (`RAS_WRITE_DESR_1st_24  || `RAS_WRITE_DESR_2nd_24);
        update_dfesr_w <= `RAS_WRITE_FESR_24;
        take_err_trap_fx4 <= `ST_ERR_24 | `SW_REC_ERR_24  | `DATA_ACC_ERR_24
                           | `INST_ACC_ERR_24 | `INT_PROC_ERR_24
                           | `HW_CORR_ERR_24 | `INST_ACC_MMU_ERR_24
                           | `DATA_ACC_MMU_ERR_24 ;


        if (`ST_ERR_24) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_24) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_24) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_24) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_24) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_24) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_24) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_24) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_24[63:56], 45'b0, `DESR_24[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_24[63:56], 45'b0, `DESR_24[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_24)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_24[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_24[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_24[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_24[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_24[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_24[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC3.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_24;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_24)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_24)
	begin
	     case (`ASI_24)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_24 >= 0) &  (`ASI_ADDR_24 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_24 >= 0) &  (`ASI_ADDR_24 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_24 >= 0) &  (`ASI_ADDR_24 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_24 >= 0) &  (`ASI_ADDR_24 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_24 >= 0) &  (`ASI_ADDR_24 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_24 >= 0) &  (`ASI_ADDR_24 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_24 >= 0) &  (`ASI_ADDR_24 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_24 >= 0) &  (`ASI_ADDR_24 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_24 >= 0) &  (`ASI_ADDR_24 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_24 >= 0) &  (`ASI_ADDR_24 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC3.lsu.lmd.lmq0_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_24 == 40'h20) ||  (`ASI_ADDR_24 == 40'h30)
			     || (`ASI_ADDR_24 == 40'h80)  
				 || ((`ASI_ADDR_24 == 40'ha0) & (`SPU_MA_BUSY_3 == 0) & (`SPU_MA_TID_3 == 0))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_24 == 40'h20) ||  (`ASI_ADDR_24 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_24, `ASI_ADDR_24, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_24, {24'b0, `ASI_ADDR_24}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c3t1 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 3;
assign mytid = 1;
assign   mytnum = 3*8 + 1;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC3.l2clk) ;
	@(posedge `SPC3.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_25  `SPC3.tlu.ras.dsfsr_1_new_in
`define ISFSR_NEW_IN_25 `SPC3.tlu.ras.isfsr_1_new_in

`define DSFSR_25 `SPC3.tlu.ras.dsfsr_1
`define ISFSR_25 `SPC3.tlu.ras.isfsr_1
`define DSFAR_25 `SPC3.tlu.dfd.dsfar_1

`define ASI_WR_DSFSR_25 `SPC3.tlu.ras.asi_wr_dsfsr[1]
`define ASI_WR_ISFSR_25 `SPC3.tlu.ras.asi_wr_isfsr[1]

`define RAS_WRITE_DESR_1st_25  `SPC3.tlu.dfd.ras_write_desr_1st[1]
`define RAS_WRITE_DESR_2nd_25  `SPC3.tlu.dfd.ras_write_desr_2nd[1]
`define DESR_asi_rd_25  `SPC3.tlu.ras_rd_desr[1]
`define DESR_25  `SPC3.tlu.dfd.desr_1

`define RAS_WRITE_FESR_25  `SPC3.tlu.ras.write_fesr[1]
`define FESR_25  `SPC3.tlu.dfd.fesr_1

`define ST_ERR_25  `SPC3.tlu.trl0.take_ftt & `SPC3.tlu.trl0.trap[1]
`define SW_REC_ERR_25  `SPC3.tlu.trl0.take_ade & `SPC3.tlu.trl0.trap[1]
`define DATA_ACC_ERR_25  `SPC3.tlu.trl0.take_dae & `SPC3.tlu.trl0.trap[1]
`define INST_ACC_ERR_25  `SPC3.tlu.trl0.take_iae & `SPC3.tlu.trl0.trap[1]
`define INT_PROC_ERR_25  `SPC3.tlu.trl0.take_ipe & `SPC3.tlu.trl0.trap[1]
`define HW_CORR_ERR_25  `SPC3.tlu.trl0.take_eer & `SPC3.tlu.trl0.trap[1]
`define INST_ACC_MMU_ERR_25  `SPC3.tlu.trl0.take_ime & `SPC3.tlu.trl0.trap[1]
`define DATA_ACC_MMU_ERR_25  `SPC3.tlu.trl0.take_dme & `SPC3.tlu.trl0.trap[1]

`define LSU_LD_VALID_B	`PROBES3.lsu_ld_valid
`define LSU_TID_DEC_B_25 `PROBES3.lsu_tid_dec_b[1]
`define ASI_LD_25	`SPC3.lsu.lmd.lmq1_pkt[60] & (`SPC3.lsu.lmd.lmq1_pkt[49:48] == 2'b0)
`define ASI_25	`SPC3.lsu.lmd.lmq1_pkt[47:40]
`define ASI_ADDR_25	`SPC3.lsu.lmd.lmq1_pkt[39:0]
`define ASI_LD_DATA_25	`SPC3.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_25	tb_top.nas_top.c3.t1.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_3	`SPC3.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_3	`SPC3.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC3.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_25)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_25[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_25  != 4'b0) && ~`ASI_WR_DSFSR_25;
        update_isfsr_w <= (`ISFSR_NEW_IN_25  != 3'b0) && ~`ASI_WR_ISFSR_25;
        desr_wr <=  (`RAS_WRITE_DESR_1st_25  || `RAS_WRITE_DESR_2nd_25);
        update_dfesr_w <= `RAS_WRITE_FESR_25;
        take_err_trap_fx4 <= `ST_ERR_25 | `SW_REC_ERR_25  | `DATA_ACC_ERR_25
                           | `INST_ACC_ERR_25 | `INT_PROC_ERR_25
                           | `HW_CORR_ERR_25 | `INST_ACC_MMU_ERR_25
                           | `DATA_ACC_MMU_ERR_25 ;


        if (`ST_ERR_25) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_25) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_25) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_25) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_25) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_25) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_25) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_25) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_25[63:56], 45'b0, `DESR_25[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_25[63:56], 45'b0, `DESR_25[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_25)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_25[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_25[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_25[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_25[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_25[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_25[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC3.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_25;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_25)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_25)
	begin
	     case (`ASI_25)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_25 >= 0) &  (`ASI_ADDR_25 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_25 >= 0) &  (`ASI_ADDR_25 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_25 >= 0) &  (`ASI_ADDR_25 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_25 >= 0) &  (`ASI_ADDR_25 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_25 >= 0) &  (`ASI_ADDR_25 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_25 >= 0) &  (`ASI_ADDR_25 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_25 >= 0) &  (`ASI_ADDR_25 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_25 >= 0) &  (`ASI_ADDR_25 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_25 >= 0) &  (`ASI_ADDR_25 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_25 >= 0) &  (`ASI_ADDR_25 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC3.lsu.lmd.lmq1_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_25 == 40'h20) ||  (`ASI_ADDR_25 == 40'h30)
			     || (`ASI_ADDR_25 == 40'h80)  
				 || ((`ASI_ADDR_25 == 40'ha0) & (`SPU_MA_BUSY_3 == 0) & (`SPU_MA_TID_3 == 1))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_25 == 40'h20) ||  (`ASI_ADDR_25 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_25, `ASI_ADDR_25, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_25, {24'b0, `ASI_ADDR_25}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c3t2 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 3;
assign mytid = 2;
assign   mytnum = 3*8 + 2;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC3.l2clk) ;
	@(posedge `SPC3.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_26  `SPC3.tlu.ras.dsfsr_2_new_in
`define ISFSR_NEW_IN_26 `SPC3.tlu.ras.isfsr_2_new_in

`define DSFSR_26 `SPC3.tlu.ras.dsfsr_2
`define ISFSR_26 `SPC3.tlu.ras.isfsr_2
`define DSFAR_26 `SPC3.tlu.dfd.dsfar_2

`define ASI_WR_DSFSR_26 `SPC3.tlu.ras.asi_wr_dsfsr[2]
`define ASI_WR_ISFSR_26 `SPC3.tlu.ras.asi_wr_isfsr[2]

`define RAS_WRITE_DESR_1st_26  `SPC3.tlu.dfd.ras_write_desr_1st[2]
`define RAS_WRITE_DESR_2nd_26  `SPC3.tlu.dfd.ras_write_desr_2nd[2]
`define DESR_asi_rd_26  `SPC3.tlu.ras_rd_desr[2]
`define DESR_26  `SPC3.tlu.dfd.desr_2

`define RAS_WRITE_FESR_26  `SPC3.tlu.ras.write_fesr[2]
`define FESR_26  `SPC3.tlu.dfd.fesr_2

`define ST_ERR_26  `SPC3.tlu.trl0.take_ftt & `SPC3.tlu.trl0.trap[2]
`define SW_REC_ERR_26  `SPC3.tlu.trl0.take_ade & `SPC3.tlu.trl0.trap[2]
`define DATA_ACC_ERR_26  `SPC3.tlu.trl0.take_dae & `SPC3.tlu.trl0.trap[2]
`define INST_ACC_ERR_26  `SPC3.tlu.trl0.take_iae & `SPC3.tlu.trl0.trap[2]
`define INT_PROC_ERR_26  `SPC3.tlu.trl0.take_ipe & `SPC3.tlu.trl0.trap[2]
`define HW_CORR_ERR_26  `SPC3.tlu.trl0.take_eer & `SPC3.tlu.trl0.trap[2]
`define INST_ACC_MMU_ERR_26  `SPC3.tlu.trl0.take_ime & `SPC3.tlu.trl0.trap[2]
`define DATA_ACC_MMU_ERR_26  `SPC3.tlu.trl0.take_dme & `SPC3.tlu.trl0.trap[2]

`define LSU_LD_VALID_B	`PROBES3.lsu_ld_valid
`define LSU_TID_DEC_B_26 `PROBES3.lsu_tid_dec_b[2]
`define ASI_LD_26	`SPC3.lsu.lmd.lmq2_pkt[60] & (`SPC3.lsu.lmd.lmq2_pkt[49:48] == 2'b0)
`define ASI_26	`SPC3.lsu.lmd.lmq2_pkt[47:40]
`define ASI_ADDR_26	`SPC3.lsu.lmd.lmq2_pkt[39:0]
`define ASI_LD_DATA_26	`SPC3.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_26	tb_top.nas_top.c3.t2.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_3	`SPC3.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_3	`SPC3.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC3.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_26)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_26[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_26  != 4'b0) && ~`ASI_WR_DSFSR_26;
        update_isfsr_w <= (`ISFSR_NEW_IN_26  != 3'b0) && ~`ASI_WR_ISFSR_26;
        desr_wr <=  (`RAS_WRITE_DESR_1st_26  || `RAS_WRITE_DESR_2nd_26);
        update_dfesr_w <= `RAS_WRITE_FESR_26;
        take_err_trap_fx4 <= `ST_ERR_26 | `SW_REC_ERR_26  | `DATA_ACC_ERR_26
                           | `INST_ACC_ERR_26 | `INT_PROC_ERR_26
                           | `HW_CORR_ERR_26 | `INST_ACC_MMU_ERR_26
                           | `DATA_ACC_MMU_ERR_26 ;


        if (`ST_ERR_26) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_26) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_26) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_26) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_26) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_26) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_26) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_26) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_26[63:56], 45'b0, `DESR_26[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_26[63:56], 45'b0, `DESR_26[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_26)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_26[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_26[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_26[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_26[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_26[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_26[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC3.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_26;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_26)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_26)
	begin
	     case (`ASI_26)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_26 >= 0) &  (`ASI_ADDR_26 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_26 >= 0) &  (`ASI_ADDR_26 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_26 >= 0) &  (`ASI_ADDR_26 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_26 >= 0) &  (`ASI_ADDR_26 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_26 >= 0) &  (`ASI_ADDR_26 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_26 >= 0) &  (`ASI_ADDR_26 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_26 >= 0) &  (`ASI_ADDR_26 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_26 >= 0) &  (`ASI_ADDR_26 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_26 >= 0) &  (`ASI_ADDR_26 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_26 >= 0) &  (`ASI_ADDR_26 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC3.lsu.lmd.lmq2_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_26 == 40'h20) ||  (`ASI_ADDR_26 == 40'h30)
			     || (`ASI_ADDR_26 == 40'h80)  
				 || ((`ASI_ADDR_26 == 40'ha0) & (`SPU_MA_BUSY_3 == 0) & (`SPU_MA_TID_3 == 2))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_26 == 40'h20) ||  (`ASI_ADDR_26 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_26, `ASI_ADDR_26, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_26, {24'b0, `ASI_ADDR_26}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c3t3 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 3;
assign mytid = 3;
assign   mytnum = 3*8 + 3;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC3.l2clk) ;
	@(posedge `SPC3.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_27  `SPC3.tlu.ras.dsfsr_3_new_in
`define ISFSR_NEW_IN_27 `SPC3.tlu.ras.isfsr_3_new_in

`define DSFSR_27 `SPC3.tlu.ras.dsfsr_3
`define ISFSR_27 `SPC3.tlu.ras.isfsr_3
`define DSFAR_27 `SPC3.tlu.dfd.dsfar_3

`define ASI_WR_DSFSR_27 `SPC3.tlu.ras.asi_wr_dsfsr[3]
`define ASI_WR_ISFSR_27 `SPC3.tlu.ras.asi_wr_isfsr[3]

`define RAS_WRITE_DESR_1st_27  `SPC3.tlu.dfd.ras_write_desr_1st[3]
`define RAS_WRITE_DESR_2nd_27  `SPC3.tlu.dfd.ras_write_desr_2nd[3]
`define DESR_asi_rd_27  `SPC3.tlu.ras_rd_desr[3]
`define DESR_27  `SPC3.tlu.dfd.desr_3

`define RAS_WRITE_FESR_27  `SPC3.tlu.ras.write_fesr[3]
`define FESR_27  `SPC3.tlu.dfd.fesr_3

`define ST_ERR_27  `SPC3.tlu.trl0.take_ftt & `SPC3.tlu.trl0.trap[3]
`define SW_REC_ERR_27  `SPC3.tlu.trl0.take_ade & `SPC3.tlu.trl0.trap[3]
`define DATA_ACC_ERR_27  `SPC3.tlu.trl0.take_dae & `SPC3.tlu.trl0.trap[3]
`define INST_ACC_ERR_27  `SPC3.tlu.trl0.take_iae & `SPC3.tlu.trl0.trap[3]
`define INT_PROC_ERR_27  `SPC3.tlu.trl0.take_ipe & `SPC3.tlu.trl0.trap[3]
`define HW_CORR_ERR_27  `SPC3.tlu.trl0.take_eer & `SPC3.tlu.trl0.trap[3]
`define INST_ACC_MMU_ERR_27  `SPC3.tlu.trl0.take_ime & `SPC3.tlu.trl0.trap[3]
`define DATA_ACC_MMU_ERR_27  `SPC3.tlu.trl0.take_dme & `SPC3.tlu.trl0.trap[3]

`define LSU_LD_VALID_B	`PROBES3.lsu_ld_valid
`define LSU_TID_DEC_B_27 `PROBES3.lsu_tid_dec_b[3]
`define ASI_LD_27	`SPC3.lsu.lmd.lmq3_pkt[60] & (`SPC3.lsu.lmd.lmq3_pkt[49:48] == 2'b0)
`define ASI_27	`SPC3.lsu.lmd.lmq3_pkt[47:40]
`define ASI_ADDR_27	`SPC3.lsu.lmd.lmq3_pkt[39:0]
`define ASI_LD_DATA_27	`SPC3.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_27	tb_top.nas_top.c3.t3.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_3	`SPC3.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_3	`SPC3.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC3.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_27)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_27[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_27  != 4'b0) && ~`ASI_WR_DSFSR_27;
        update_isfsr_w <= (`ISFSR_NEW_IN_27  != 3'b0) && ~`ASI_WR_ISFSR_27;
        desr_wr <=  (`RAS_WRITE_DESR_1st_27  || `RAS_WRITE_DESR_2nd_27);
        update_dfesr_w <= `RAS_WRITE_FESR_27;
        take_err_trap_fx4 <= `ST_ERR_27 | `SW_REC_ERR_27  | `DATA_ACC_ERR_27
                           | `INST_ACC_ERR_27 | `INT_PROC_ERR_27
                           | `HW_CORR_ERR_27 | `INST_ACC_MMU_ERR_27
                           | `DATA_ACC_MMU_ERR_27 ;


        if (`ST_ERR_27) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_27) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_27) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_27) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_27) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_27) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_27) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_27) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_27[63:56], 45'b0, `DESR_27[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_27[63:56], 45'b0, `DESR_27[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_27)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_27[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_27[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_27[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_27[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_27[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_27[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC3.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_27;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_27)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_27)
	begin
	     case (`ASI_27)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_27 >= 0) &  (`ASI_ADDR_27 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_27 >= 0) &  (`ASI_ADDR_27 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_27 >= 0) &  (`ASI_ADDR_27 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_27 >= 0) &  (`ASI_ADDR_27 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_27 >= 0) &  (`ASI_ADDR_27 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_27 >= 0) &  (`ASI_ADDR_27 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_27 >= 0) &  (`ASI_ADDR_27 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_27 >= 0) &  (`ASI_ADDR_27 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_27 >= 0) &  (`ASI_ADDR_27 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_27 >= 0) &  (`ASI_ADDR_27 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC3.lsu.lmd.lmq3_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_27 == 40'h20) ||  (`ASI_ADDR_27 == 40'h30)
			     || (`ASI_ADDR_27 == 40'h80)  
				 || ((`ASI_ADDR_27 == 40'ha0) & (`SPU_MA_BUSY_3 == 0) & (`SPU_MA_TID_3 == 3))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_27 == 40'h20) ||  (`ASI_ADDR_27 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_27, `ASI_ADDR_27, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_27, {24'b0, `ASI_ADDR_27}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c3t4 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 3;
assign mytid = 4;
assign   mytnum = 3*8 + 4;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC3.l2clk) ;
	@(posedge `SPC3.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_28  `SPC3.tlu.ras.dsfsr_4_new_in
`define ISFSR_NEW_IN_28 `SPC3.tlu.ras.isfsr_4_new_in

`define DSFSR_28 `SPC3.tlu.ras.dsfsr_4
`define ISFSR_28 `SPC3.tlu.ras.isfsr_4
`define DSFAR_28 `SPC3.tlu.dfd.dsfar_4

`define ASI_WR_DSFSR_28 `SPC3.tlu.ras.asi_wr_dsfsr[4]
`define ASI_WR_ISFSR_28 `SPC3.tlu.ras.asi_wr_isfsr[4]

`define RAS_WRITE_DESR_1st_28  `SPC3.tlu.dfd.ras_write_desr_1st[4]
`define RAS_WRITE_DESR_2nd_28  `SPC3.tlu.dfd.ras_write_desr_2nd[4]
`define DESR_asi_rd_28  `SPC3.tlu.ras_rd_desr[4]
`define DESR_28  `SPC3.tlu.dfd.desr_4

`define RAS_WRITE_FESR_28  `SPC3.tlu.ras.write_fesr[4]
`define FESR_28  `SPC3.tlu.dfd.fesr_4

`define ST_ERR_28  `SPC3.tlu.trl1.take_ftt & `SPC3.tlu.trl1.trap[0]
`define SW_REC_ERR_28  `SPC3.tlu.trl1.take_ade & `SPC3.tlu.trl1.trap[0]
`define DATA_ACC_ERR_28  `SPC3.tlu.trl1.take_dae & `SPC3.tlu.trl1.trap[0]
`define INST_ACC_ERR_28  `SPC3.tlu.trl1.take_iae & `SPC3.tlu.trl1.trap[0]
`define INT_PROC_ERR_28  `SPC3.tlu.trl1.take_ipe & `SPC3.tlu.trl1.trap[0]
`define HW_CORR_ERR_28  `SPC3.tlu.trl1.take_eer & `SPC3.tlu.trl1.trap[0]
`define INST_ACC_MMU_ERR_28  `SPC3.tlu.trl1.take_ime & `SPC3.tlu.trl1.trap[0]
`define DATA_ACC_MMU_ERR_28  `SPC3.tlu.trl1.take_dme & `SPC3.tlu.trl1.trap[0]

`define LSU_LD_VALID_B	`PROBES3.lsu_ld_valid
`define LSU_TID_DEC_B_28 `PROBES3.lsu_tid_dec_b[4]
`define ASI_LD_28	`SPC3.lsu.lmd.lmq4_pkt[60] & (`SPC3.lsu.lmd.lmq4_pkt[49:48] == 2'b0)
`define ASI_28	`SPC3.lsu.lmd.lmq4_pkt[47:40]
`define ASI_ADDR_28	`SPC3.lsu.lmd.lmq4_pkt[39:0]
`define ASI_LD_DATA_28	`SPC3.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_28	tb_top.nas_top.c3.t4.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_3	`SPC3.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_3	`SPC3.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC3.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_28)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_28[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_28  != 4'b0) && ~`ASI_WR_DSFSR_28;
        update_isfsr_w <= (`ISFSR_NEW_IN_28  != 3'b0) && ~`ASI_WR_ISFSR_28;
        desr_wr <=  (`RAS_WRITE_DESR_1st_28  || `RAS_WRITE_DESR_2nd_28);
        update_dfesr_w <= `RAS_WRITE_FESR_28;
        take_err_trap_fx4 <= `ST_ERR_28 | `SW_REC_ERR_28  | `DATA_ACC_ERR_28
                           | `INST_ACC_ERR_28 | `INT_PROC_ERR_28
                           | `HW_CORR_ERR_28 | `INST_ACC_MMU_ERR_28
                           | `DATA_ACC_MMU_ERR_28 ;


        if (`ST_ERR_28) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_28) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_28) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_28) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_28) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_28) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_28) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_28) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_28[63:56], 45'b0, `DESR_28[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_28[63:56], 45'b0, `DESR_28[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_28)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_28[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_28[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_28[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_28[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_28[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_28[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC3.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_28;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_28)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_28)
	begin
	     case (`ASI_28)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_28 >= 0) &  (`ASI_ADDR_28 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_28 >= 0) &  (`ASI_ADDR_28 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_28 >= 0) &  (`ASI_ADDR_28 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_28 >= 0) &  (`ASI_ADDR_28 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_28 >= 0) &  (`ASI_ADDR_28 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_28 >= 0) &  (`ASI_ADDR_28 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_28 >= 0) &  (`ASI_ADDR_28 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_28 >= 0) &  (`ASI_ADDR_28 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_28 >= 0) &  (`ASI_ADDR_28 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_28 >= 0) &  (`ASI_ADDR_28 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC3.lsu.lmd.lmq4_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_28 == 40'h20) ||  (`ASI_ADDR_28 == 40'h30)
			     || (`ASI_ADDR_28 == 40'h80)  
				 || ((`ASI_ADDR_28 == 40'ha0) & (`SPU_MA_BUSY_3 == 0) & (`SPU_MA_TID_3 == 4))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_28 == 40'h20) ||  (`ASI_ADDR_28 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_28, `ASI_ADDR_28, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_28, {24'b0, `ASI_ADDR_28}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c3t5 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 3;
assign mytid = 5;
assign   mytnum = 3*8 + 5;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC3.l2clk) ;
	@(posedge `SPC3.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_29  `SPC3.tlu.ras.dsfsr_5_new_in
`define ISFSR_NEW_IN_29 `SPC3.tlu.ras.isfsr_5_new_in

`define DSFSR_29 `SPC3.tlu.ras.dsfsr_5
`define ISFSR_29 `SPC3.tlu.ras.isfsr_5
`define DSFAR_29 `SPC3.tlu.dfd.dsfar_5

`define ASI_WR_DSFSR_29 `SPC3.tlu.ras.asi_wr_dsfsr[5]
`define ASI_WR_ISFSR_29 `SPC3.tlu.ras.asi_wr_isfsr[5]

`define RAS_WRITE_DESR_1st_29  `SPC3.tlu.dfd.ras_write_desr_1st[5]
`define RAS_WRITE_DESR_2nd_29  `SPC3.tlu.dfd.ras_write_desr_2nd[5]
`define DESR_asi_rd_29  `SPC3.tlu.ras_rd_desr[5]
`define DESR_29  `SPC3.tlu.dfd.desr_5

`define RAS_WRITE_FESR_29  `SPC3.tlu.ras.write_fesr[5]
`define FESR_29  `SPC3.tlu.dfd.fesr_5

`define ST_ERR_29  `SPC3.tlu.trl1.take_ftt & `SPC3.tlu.trl1.trap[1]
`define SW_REC_ERR_29  `SPC3.tlu.trl1.take_ade & `SPC3.tlu.trl1.trap[1]
`define DATA_ACC_ERR_29  `SPC3.tlu.trl1.take_dae & `SPC3.tlu.trl1.trap[1]
`define INST_ACC_ERR_29  `SPC3.tlu.trl1.take_iae & `SPC3.tlu.trl1.trap[1]
`define INT_PROC_ERR_29  `SPC3.tlu.trl1.take_ipe & `SPC3.tlu.trl1.trap[1]
`define HW_CORR_ERR_29  `SPC3.tlu.trl1.take_eer & `SPC3.tlu.trl1.trap[1]
`define INST_ACC_MMU_ERR_29  `SPC3.tlu.trl1.take_ime & `SPC3.tlu.trl1.trap[1]
`define DATA_ACC_MMU_ERR_29  `SPC3.tlu.trl1.take_dme & `SPC3.tlu.trl1.trap[1]

`define LSU_LD_VALID_B	`PROBES3.lsu_ld_valid
`define LSU_TID_DEC_B_29 `PROBES3.lsu_tid_dec_b[5]
`define ASI_LD_29	`SPC3.lsu.lmd.lmq5_pkt[60] & (`SPC3.lsu.lmd.lmq5_pkt[49:48] == 2'b0)
`define ASI_29	`SPC3.lsu.lmd.lmq5_pkt[47:40]
`define ASI_ADDR_29	`SPC3.lsu.lmd.lmq5_pkt[39:0]
`define ASI_LD_DATA_29	`SPC3.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_29	tb_top.nas_top.c3.t5.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_3	`SPC3.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_3	`SPC3.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC3.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_29)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_29[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_29  != 4'b0) && ~`ASI_WR_DSFSR_29;
        update_isfsr_w <= (`ISFSR_NEW_IN_29  != 3'b0) && ~`ASI_WR_ISFSR_29;
        desr_wr <=  (`RAS_WRITE_DESR_1st_29  || `RAS_WRITE_DESR_2nd_29);
        update_dfesr_w <= `RAS_WRITE_FESR_29;
        take_err_trap_fx4 <= `ST_ERR_29 | `SW_REC_ERR_29  | `DATA_ACC_ERR_29
                           | `INST_ACC_ERR_29 | `INT_PROC_ERR_29
                           | `HW_CORR_ERR_29 | `INST_ACC_MMU_ERR_29
                           | `DATA_ACC_MMU_ERR_29 ;


        if (`ST_ERR_29) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_29) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_29) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_29) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_29) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_29) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_29) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_29) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_29[63:56], 45'b0, `DESR_29[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_29[63:56], 45'b0, `DESR_29[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_29)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_29[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_29[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_29[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_29[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_29[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_29[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC3.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_29;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_29)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_29)
	begin
	     case (`ASI_29)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_29 >= 0) &  (`ASI_ADDR_29 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_29 >= 0) &  (`ASI_ADDR_29 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_29 >= 0) &  (`ASI_ADDR_29 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_29 >= 0) &  (`ASI_ADDR_29 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_29 >= 0) &  (`ASI_ADDR_29 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_29 >= 0) &  (`ASI_ADDR_29 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_29 >= 0) &  (`ASI_ADDR_29 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_29 >= 0) &  (`ASI_ADDR_29 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_29 >= 0) &  (`ASI_ADDR_29 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_29 >= 0) &  (`ASI_ADDR_29 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC3.lsu.lmd.lmq5_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_29 == 40'h20) ||  (`ASI_ADDR_29 == 40'h30)
			     || (`ASI_ADDR_29 == 40'h80)  
				 || ((`ASI_ADDR_29 == 40'ha0) & (`SPU_MA_BUSY_3 == 0) & (`SPU_MA_TID_3 == 5))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_29 == 40'h20) ||  (`ASI_ADDR_29 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_29, `ASI_ADDR_29, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_29, {24'b0, `ASI_ADDR_29}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c3t6 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 3;
assign mytid = 6;
assign   mytnum = 3*8 + 6;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC3.l2clk) ;
	@(posedge `SPC3.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_30  `SPC3.tlu.ras.dsfsr_6_new_in
`define ISFSR_NEW_IN_30 `SPC3.tlu.ras.isfsr_6_new_in

`define DSFSR_30 `SPC3.tlu.ras.dsfsr_6
`define ISFSR_30 `SPC3.tlu.ras.isfsr_6
`define DSFAR_30 `SPC3.tlu.dfd.dsfar_6

`define ASI_WR_DSFSR_30 `SPC3.tlu.ras.asi_wr_dsfsr[6]
`define ASI_WR_ISFSR_30 `SPC3.tlu.ras.asi_wr_isfsr[6]

`define RAS_WRITE_DESR_1st_30  `SPC3.tlu.dfd.ras_write_desr_1st[6]
`define RAS_WRITE_DESR_2nd_30  `SPC3.tlu.dfd.ras_write_desr_2nd[6]
`define DESR_asi_rd_30  `SPC3.tlu.ras_rd_desr[6]
`define DESR_30  `SPC3.tlu.dfd.desr_6

`define RAS_WRITE_FESR_30  `SPC3.tlu.ras.write_fesr[6]
`define FESR_30  `SPC3.tlu.dfd.fesr_6

`define ST_ERR_30  `SPC3.tlu.trl1.take_ftt & `SPC3.tlu.trl1.trap[2]
`define SW_REC_ERR_30  `SPC3.tlu.trl1.take_ade & `SPC3.tlu.trl1.trap[2]
`define DATA_ACC_ERR_30  `SPC3.tlu.trl1.take_dae & `SPC3.tlu.trl1.trap[2]
`define INST_ACC_ERR_30  `SPC3.tlu.trl1.take_iae & `SPC3.tlu.trl1.trap[2]
`define INT_PROC_ERR_30  `SPC3.tlu.trl1.take_ipe & `SPC3.tlu.trl1.trap[2]
`define HW_CORR_ERR_30  `SPC3.tlu.trl1.take_eer & `SPC3.tlu.trl1.trap[2]
`define INST_ACC_MMU_ERR_30  `SPC3.tlu.trl1.take_ime & `SPC3.tlu.trl1.trap[2]
`define DATA_ACC_MMU_ERR_30  `SPC3.tlu.trl1.take_dme & `SPC3.tlu.trl1.trap[2]

`define LSU_LD_VALID_B	`PROBES3.lsu_ld_valid
`define LSU_TID_DEC_B_30 `PROBES3.lsu_tid_dec_b[6]
`define ASI_LD_30	`SPC3.lsu.lmd.lmq6_pkt[60] & (`SPC3.lsu.lmd.lmq6_pkt[49:48] == 2'b0)
`define ASI_30	`SPC3.lsu.lmd.lmq6_pkt[47:40]
`define ASI_ADDR_30	`SPC3.lsu.lmd.lmq6_pkt[39:0]
`define ASI_LD_DATA_30	`SPC3.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_30	tb_top.nas_top.c3.t6.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_3	`SPC3.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_3	`SPC3.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC3.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_30)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_30[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_30  != 4'b0) && ~`ASI_WR_DSFSR_30;
        update_isfsr_w <= (`ISFSR_NEW_IN_30  != 3'b0) && ~`ASI_WR_ISFSR_30;
        desr_wr <=  (`RAS_WRITE_DESR_1st_30  || `RAS_WRITE_DESR_2nd_30);
        update_dfesr_w <= `RAS_WRITE_FESR_30;
        take_err_trap_fx4 <= `ST_ERR_30 | `SW_REC_ERR_30  | `DATA_ACC_ERR_30
                           | `INST_ACC_ERR_30 | `INT_PROC_ERR_30
                           | `HW_CORR_ERR_30 | `INST_ACC_MMU_ERR_30
                           | `DATA_ACC_MMU_ERR_30 ;


        if (`ST_ERR_30) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_30) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_30) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_30) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_30) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_30) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_30) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_30) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_30[63:56], 45'b0, `DESR_30[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_30[63:56], 45'b0, `DESR_30[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_30)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_30[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_30[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_30[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_30[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_30[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_30[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC3.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_30;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_30)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_30)
	begin
	     case (`ASI_30)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_30 >= 0) &  (`ASI_ADDR_30 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_30 >= 0) &  (`ASI_ADDR_30 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_30 >= 0) &  (`ASI_ADDR_30 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_30 >= 0) &  (`ASI_ADDR_30 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_30 >= 0) &  (`ASI_ADDR_30 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_30 >= 0) &  (`ASI_ADDR_30 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_30 >= 0) &  (`ASI_ADDR_30 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_30 >= 0) &  (`ASI_ADDR_30 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_30 >= 0) &  (`ASI_ADDR_30 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_30 >= 0) &  (`ASI_ADDR_30 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC3.lsu.lmd.lmq6_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_30 == 40'h20) ||  (`ASI_ADDR_30 == 40'h30)
			     || (`ASI_ADDR_30 == 40'h80)  
				 || ((`ASI_ADDR_30 == 40'ha0) & (`SPU_MA_BUSY_3 == 0) & (`SPU_MA_TID_3 == 6))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_30 == 40'h20) ||  (`ASI_ADDR_30 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_30, `ASI_ADDR_30, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_30, {24'b0, `ASI_ADDR_30}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c3t7 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 3;
assign mytid = 7;
assign   mytnum = 3*8 + 7;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC3.l2clk) ;
	@(posedge `SPC3.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_31  `SPC3.tlu.ras.dsfsr_7_new_in
`define ISFSR_NEW_IN_31 `SPC3.tlu.ras.isfsr_7_new_in

`define DSFSR_31 `SPC3.tlu.ras.dsfsr_7
`define ISFSR_31 `SPC3.tlu.ras.isfsr_7
`define DSFAR_31 `SPC3.tlu.dfd.dsfar_7

`define ASI_WR_DSFSR_31 `SPC3.tlu.ras.asi_wr_dsfsr[7]
`define ASI_WR_ISFSR_31 `SPC3.tlu.ras.asi_wr_isfsr[7]

`define RAS_WRITE_DESR_1st_31  `SPC3.tlu.dfd.ras_write_desr_1st[7]
`define RAS_WRITE_DESR_2nd_31  `SPC3.tlu.dfd.ras_write_desr_2nd[7]
`define DESR_asi_rd_31  `SPC3.tlu.ras_rd_desr[7]
`define DESR_31  `SPC3.tlu.dfd.desr_7

`define RAS_WRITE_FESR_31  `SPC3.tlu.ras.write_fesr[7]
`define FESR_31  `SPC3.tlu.dfd.fesr_7

`define ST_ERR_31  `SPC3.tlu.trl1.take_ftt & `SPC3.tlu.trl1.trap[3]
`define SW_REC_ERR_31  `SPC3.tlu.trl1.take_ade & `SPC3.tlu.trl1.trap[3]
`define DATA_ACC_ERR_31  `SPC3.tlu.trl1.take_dae & `SPC3.tlu.trl1.trap[3]
`define INST_ACC_ERR_31  `SPC3.tlu.trl1.take_iae & `SPC3.tlu.trl1.trap[3]
`define INT_PROC_ERR_31  `SPC3.tlu.trl1.take_ipe & `SPC3.tlu.trl1.trap[3]
`define HW_CORR_ERR_31  `SPC3.tlu.trl1.take_eer & `SPC3.tlu.trl1.trap[3]
`define INST_ACC_MMU_ERR_31  `SPC3.tlu.trl1.take_ime & `SPC3.tlu.trl1.trap[3]
`define DATA_ACC_MMU_ERR_31  `SPC3.tlu.trl1.take_dme & `SPC3.tlu.trl1.trap[3]

`define LSU_LD_VALID_B	`PROBES3.lsu_ld_valid
`define LSU_TID_DEC_B_31 `PROBES3.lsu_tid_dec_b[7]
`define ASI_LD_31	`SPC3.lsu.lmd.lmq7_pkt[60] & (`SPC3.lsu.lmd.lmq7_pkt[49:48] == 2'b0)
`define ASI_31	`SPC3.lsu.lmd.lmq7_pkt[47:40]
`define ASI_ADDR_31	`SPC3.lsu.lmd.lmq7_pkt[39:0]
`define ASI_LD_DATA_31	`SPC3.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_31	tb_top.nas_top.c3.t7.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_3	`SPC3.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_3	`SPC3.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC3.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_31)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_31[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_31  != 4'b0) && ~`ASI_WR_DSFSR_31;
        update_isfsr_w <= (`ISFSR_NEW_IN_31  != 3'b0) && ~`ASI_WR_ISFSR_31;
        desr_wr <=  (`RAS_WRITE_DESR_1st_31  || `RAS_WRITE_DESR_2nd_31);
        update_dfesr_w <= `RAS_WRITE_FESR_31;
        take_err_trap_fx4 <= `ST_ERR_31 | `SW_REC_ERR_31  | `DATA_ACC_ERR_31
                           | `INST_ACC_ERR_31 | `INT_PROC_ERR_31
                           | `HW_CORR_ERR_31 | `INST_ACC_MMU_ERR_31
                           | `DATA_ACC_MMU_ERR_31 ;


        if (`ST_ERR_31) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_31) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_31) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_31) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_31) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_31) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_31) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_31) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_31[63:56], 45'b0, `DESR_31[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_31[63:56], 45'b0, `DESR_31[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_31)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_31[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_31[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_31[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_31[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_31[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_31[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC3.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_31;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_31)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_31)
	begin
	     case (`ASI_31)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_31 >= 0) &  (`ASI_ADDR_31 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_31 >= 0) &  (`ASI_ADDR_31 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_31 >= 0) &  (`ASI_ADDR_31 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_31 >= 0) &  (`ASI_ADDR_31 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_31 >= 0) &  (`ASI_ADDR_31 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_31 >= 0) &  (`ASI_ADDR_31 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_31 >= 0) &  (`ASI_ADDR_31 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_31 >= 0) &  (`ASI_ADDR_31 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_31 >= 0) &  (`ASI_ADDR_31 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_31 >= 0) &  (`ASI_ADDR_31 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC3.lsu.lmd.lmq7_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_31 == 40'h20) ||  (`ASI_ADDR_31 == 40'h30)
			     || (`ASI_ADDR_31 == 40'h80)  
				 || ((`ASI_ADDR_31 == 40'ha0) & (`SPU_MA_BUSY_3 == 0) & (`SPU_MA_TID_3 == 7))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_31 == 40'h20) ||  (`ASI_ADDR_31 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_31, `ASI_ADDR_31, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_31, {24'b0, `ASI_ADDR_31}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule

`endif

`ifdef CORE_4



module err_c4t0 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 4;
assign mytid = 0;
assign   mytnum = 4*8 + 0;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC4.l2clk) ;
	@(posedge `SPC4.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_32  `SPC4.tlu.ras.dsfsr_0_new_in
`define ISFSR_NEW_IN_32 `SPC4.tlu.ras.isfsr_0_new_in

`define DSFSR_32 `SPC4.tlu.ras.dsfsr_0
`define ISFSR_32 `SPC4.tlu.ras.isfsr_0
`define DSFAR_32 `SPC4.tlu.dfd.dsfar_0

`define ASI_WR_DSFSR_32 `SPC4.tlu.ras.asi_wr_dsfsr[0]
`define ASI_WR_ISFSR_32 `SPC4.tlu.ras.asi_wr_isfsr[0]

`define RAS_WRITE_DESR_1st_32  `SPC4.tlu.dfd.ras_write_desr_1st[0]
`define RAS_WRITE_DESR_2nd_32  `SPC4.tlu.dfd.ras_write_desr_2nd[0]
`define DESR_asi_rd_32  `SPC4.tlu.ras_rd_desr[0]
`define DESR_32  `SPC4.tlu.dfd.desr_0

`define RAS_WRITE_FESR_32  `SPC4.tlu.ras.write_fesr[0]
`define FESR_32  `SPC4.tlu.dfd.fesr_0

`define ST_ERR_32  `SPC4.tlu.trl0.take_ftt & `SPC4.tlu.trl0.trap[0]
`define SW_REC_ERR_32  `SPC4.tlu.trl0.take_ade & `SPC4.tlu.trl0.trap[0]
`define DATA_ACC_ERR_32  `SPC4.tlu.trl0.take_dae & `SPC4.tlu.trl0.trap[0]
`define INST_ACC_ERR_32  `SPC4.tlu.trl0.take_iae & `SPC4.tlu.trl0.trap[0]
`define INT_PROC_ERR_32  `SPC4.tlu.trl0.take_ipe & `SPC4.tlu.trl0.trap[0]
`define HW_CORR_ERR_32  `SPC4.tlu.trl0.take_eer & `SPC4.tlu.trl0.trap[0]
`define INST_ACC_MMU_ERR_32  `SPC4.tlu.trl0.take_ime & `SPC4.tlu.trl0.trap[0]
`define DATA_ACC_MMU_ERR_32  `SPC4.tlu.trl0.take_dme & `SPC4.tlu.trl0.trap[0]

`define LSU_LD_VALID_B	`PROBES4.lsu_ld_valid
`define LSU_TID_DEC_B_32 `PROBES4.lsu_tid_dec_b[0]
`define ASI_LD_32	`SPC4.lsu.lmd.lmq0_pkt[60] & (`SPC4.lsu.lmd.lmq0_pkt[49:48] == 2'b0)
`define ASI_32	`SPC4.lsu.lmd.lmq0_pkt[47:40]
`define ASI_ADDR_32	`SPC4.lsu.lmd.lmq0_pkt[39:0]
`define ASI_LD_DATA_32	`SPC4.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_32	tb_top.nas_top.c4.t0.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_4	`SPC4.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_4	`SPC4.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC4.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_32)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_32[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_32  != 4'b0) && ~`ASI_WR_DSFSR_32;
        update_isfsr_w <= (`ISFSR_NEW_IN_32  != 3'b0) && ~`ASI_WR_ISFSR_32;
        desr_wr <=  (`RAS_WRITE_DESR_1st_32  || `RAS_WRITE_DESR_2nd_32);
        update_dfesr_w <= `RAS_WRITE_FESR_32;
        take_err_trap_fx4 <= `ST_ERR_32 | `SW_REC_ERR_32  | `DATA_ACC_ERR_32
                           | `INST_ACC_ERR_32 | `INT_PROC_ERR_32
                           | `HW_CORR_ERR_32 | `INST_ACC_MMU_ERR_32
                           | `DATA_ACC_MMU_ERR_32 ;


        if (`ST_ERR_32) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_32) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_32) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_32) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_32) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_32) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_32) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_32) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_32[63:56], 45'b0, `DESR_32[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_32[63:56], 45'b0, `DESR_32[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_32)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_32[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_32[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_32[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_32[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_32[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_32[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC4.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_32;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_32)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_32)
	begin
	     case (`ASI_32)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_32 >= 0) &  (`ASI_ADDR_32 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_32 >= 0) &  (`ASI_ADDR_32 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_32 >= 0) &  (`ASI_ADDR_32 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_32 >= 0) &  (`ASI_ADDR_32 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_32 >= 0) &  (`ASI_ADDR_32 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_32 >= 0) &  (`ASI_ADDR_32 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_32 >= 0) &  (`ASI_ADDR_32 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_32 >= 0) &  (`ASI_ADDR_32 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_32 >= 0) &  (`ASI_ADDR_32 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_32 >= 0) &  (`ASI_ADDR_32 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC4.lsu.lmd.lmq0_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_32 == 40'h20) ||  (`ASI_ADDR_32 == 40'h30)
			     || (`ASI_ADDR_32 == 40'h80)  
				 || ((`ASI_ADDR_32 == 40'ha0) & (`SPU_MA_BUSY_4 == 0) & (`SPU_MA_TID_4 == 0))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_32 == 40'h20) ||  (`ASI_ADDR_32 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_32, `ASI_ADDR_32, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_32, {24'b0, `ASI_ADDR_32}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c4t1 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 4;
assign mytid = 1;
assign   mytnum = 4*8 + 1;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC4.l2clk) ;
	@(posedge `SPC4.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_33  `SPC4.tlu.ras.dsfsr_1_new_in
`define ISFSR_NEW_IN_33 `SPC4.tlu.ras.isfsr_1_new_in

`define DSFSR_33 `SPC4.tlu.ras.dsfsr_1
`define ISFSR_33 `SPC4.tlu.ras.isfsr_1
`define DSFAR_33 `SPC4.tlu.dfd.dsfar_1

`define ASI_WR_DSFSR_33 `SPC4.tlu.ras.asi_wr_dsfsr[1]
`define ASI_WR_ISFSR_33 `SPC4.tlu.ras.asi_wr_isfsr[1]

`define RAS_WRITE_DESR_1st_33  `SPC4.tlu.dfd.ras_write_desr_1st[1]
`define RAS_WRITE_DESR_2nd_33  `SPC4.tlu.dfd.ras_write_desr_2nd[1]
`define DESR_asi_rd_33  `SPC4.tlu.ras_rd_desr[1]
`define DESR_33  `SPC4.tlu.dfd.desr_1

`define RAS_WRITE_FESR_33  `SPC4.tlu.ras.write_fesr[1]
`define FESR_33  `SPC4.tlu.dfd.fesr_1

`define ST_ERR_33  `SPC4.tlu.trl0.take_ftt & `SPC4.tlu.trl0.trap[1]
`define SW_REC_ERR_33  `SPC4.tlu.trl0.take_ade & `SPC4.tlu.trl0.trap[1]
`define DATA_ACC_ERR_33  `SPC4.tlu.trl0.take_dae & `SPC4.tlu.trl0.trap[1]
`define INST_ACC_ERR_33  `SPC4.tlu.trl0.take_iae & `SPC4.tlu.trl0.trap[1]
`define INT_PROC_ERR_33  `SPC4.tlu.trl0.take_ipe & `SPC4.tlu.trl0.trap[1]
`define HW_CORR_ERR_33  `SPC4.tlu.trl0.take_eer & `SPC4.tlu.trl0.trap[1]
`define INST_ACC_MMU_ERR_33  `SPC4.tlu.trl0.take_ime & `SPC4.tlu.trl0.trap[1]
`define DATA_ACC_MMU_ERR_33  `SPC4.tlu.trl0.take_dme & `SPC4.tlu.trl0.trap[1]

`define LSU_LD_VALID_B	`PROBES4.lsu_ld_valid
`define LSU_TID_DEC_B_33 `PROBES4.lsu_tid_dec_b[1]
`define ASI_LD_33	`SPC4.lsu.lmd.lmq1_pkt[60] & (`SPC4.lsu.lmd.lmq1_pkt[49:48] == 2'b0)
`define ASI_33	`SPC4.lsu.lmd.lmq1_pkt[47:40]
`define ASI_ADDR_33	`SPC4.lsu.lmd.lmq1_pkt[39:0]
`define ASI_LD_DATA_33	`SPC4.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_33	tb_top.nas_top.c4.t1.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_4	`SPC4.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_4	`SPC4.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC4.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_33)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_33[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_33  != 4'b0) && ~`ASI_WR_DSFSR_33;
        update_isfsr_w <= (`ISFSR_NEW_IN_33  != 3'b0) && ~`ASI_WR_ISFSR_33;
        desr_wr <=  (`RAS_WRITE_DESR_1st_33  || `RAS_WRITE_DESR_2nd_33);
        update_dfesr_w <= `RAS_WRITE_FESR_33;
        take_err_trap_fx4 <= `ST_ERR_33 | `SW_REC_ERR_33  | `DATA_ACC_ERR_33
                           | `INST_ACC_ERR_33 | `INT_PROC_ERR_33
                           | `HW_CORR_ERR_33 | `INST_ACC_MMU_ERR_33
                           | `DATA_ACC_MMU_ERR_33 ;


        if (`ST_ERR_33) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_33) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_33) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_33) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_33) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_33) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_33) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_33) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_33[63:56], 45'b0, `DESR_33[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_33[63:56], 45'b0, `DESR_33[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_33)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_33[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_33[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_33[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_33[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_33[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_33[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC4.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_33;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_33)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_33)
	begin
	     case (`ASI_33)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_33 >= 0) &  (`ASI_ADDR_33 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_33 >= 0) &  (`ASI_ADDR_33 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_33 >= 0) &  (`ASI_ADDR_33 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_33 >= 0) &  (`ASI_ADDR_33 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_33 >= 0) &  (`ASI_ADDR_33 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_33 >= 0) &  (`ASI_ADDR_33 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_33 >= 0) &  (`ASI_ADDR_33 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_33 >= 0) &  (`ASI_ADDR_33 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_33 >= 0) &  (`ASI_ADDR_33 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_33 >= 0) &  (`ASI_ADDR_33 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC4.lsu.lmd.lmq1_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_33 == 40'h20) ||  (`ASI_ADDR_33 == 40'h30)
			     || (`ASI_ADDR_33 == 40'h80)  
				 || ((`ASI_ADDR_33 == 40'ha0) & (`SPU_MA_BUSY_4 == 0) & (`SPU_MA_TID_4 == 1))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_33 == 40'h20) ||  (`ASI_ADDR_33 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_33, `ASI_ADDR_33, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_33, {24'b0, `ASI_ADDR_33}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c4t2 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 4;
assign mytid = 2;
assign   mytnum = 4*8 + 2;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC4.l2clk) ;
	@(posedge `SPC4.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_34  `SPC4.tlu.ras.dsfsr_2_new_in
`define ISFSR_NEW_IN_34 `SPC4.tlu.ras.isfsr_2_new_in

`define DSFSR_34 `SPC4.tlu.ras.dsfsr_2
`define ISFSR_34 `SPC4.tlu.ras.isfsr_2
`define DSFAR_34 `SPC4.tlu.dfd.dsfar_2

`define ASI_WR_DSFSR_34 `SPC4.tlu.ras.asi_wr_dsfsr[2]
`define ASI_WR_ISFSR_34 `SPC4.tlu.ras.asi_wr_isfsr[2]

`define RAS_WRITE_DESR_1st_34  `SPC4.tlu.dfd.ras_write_desr_1st[2]
`define RAS_WRITE_DESR_2nd_34  `SPC4.tlu.dfd.ras_write_desr_2nd[2]
`define DESR_asi_rd_34  `SPC4.tlu.ras_rd_desr[2]
`define DESR_34  `SPC4.tlu.dfd.desr_2

`define RAS_WRITE_FESR_34  `SPC4.tlu.ras.write_fesr[2]
`define FESR_34  `SPC4.tlu.dfd.fesr_2

`define ST_ERR_34  `SPC4.tlu.trl0.take_ftt & `SPC4.tlu.trl0.trap[2]
`define SW_REC_ERR_34  `SPC4.tlu.trl0.take_ade & `SPC4.tlu.trl0.trap[2]
`define DATA_ACC_ERR_34  `SPC4.tlu.trl0.take_dae & `SPC4.tlu.trl0.trap[2]
`define INST_ACC_ERR_34  `SPC4.tlu.trl0.take_iae & `SPC4.tlu.trl0.trap[2]
`define INT_PROC_ERR_34  `SPC4.tlu.trl0.take_ipe & `SPC4.tlu.trl0.trap[2]
`define HW_CORR_ERR_34  `SPC4.tlu.trl0.take_eer & `SPC4.tlu.trl0.trap[2]
`define INST_ACC_MMU_ERR_34  `SPC4.tlu.trl0.take_ime & `SPC4.tlu.trl0.trap[2]
`define DATA_ACC_MMU_ERR_34  `SPC4.tlu.trl0.take_dme & `SPC4.tlu.trl0.trap[2]

`define LSU_LD_VALID_B	`PROBES4.lsu_ld_valid
`define LSU_TID_DEC_B_34 `PROBES4.lsu_tid_dec_b[2]
`define ASI_LD_34	`SPC4.lsu.lmd.lmq2_pkt[60] & (`SPC4.lsu.lmd.lmq2_pkt[49:48] == 2'b0)
`define ASI_34	`SPC4.lsu.lmd.lmq2_pkt[47:40]
`define ASI_ADDR_34	`SPC4.lsu.lmd.lmq2_pkt[39:0]
`define ASI_LD_DATA_34	`SPC4.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_34	tb_top.nas_top.c4.t2.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_4	`SPC4.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_4	`SPC4.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC4.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_34)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_34[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_34  != 4'b0) && ~`ASI_WR_DSFSR_34;
        update_isfsr_w <= (`ISFSR_NEW_IN_34  != 3'b0) && ~`ASI_WR_ISFSR_34;
        desr_wr <=  (`RAS_WRITE_DESR_1st_34  || `RAS_WRITE_DESR_2nd_34);
        update_dfesr_w <= `RAS_WRITE_FESR_34;
        take_err_trap_fx4 <= `ST_ERR_34 | `SW_REC_ERR_34  | `DATA_ACC_ERR_34
                           | `INST_ACC_ERR_34 | `INT_PROC_ERR_34
                           | `HW_CORR_ERR_34 | `INST_ACC_MMU_ERR_34
                           | `DATA_ACC_MMU_ERR_34 ;


        if (`ST_ERR_34) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_34) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_34) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_34) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_34) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_34) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_34) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_34) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_34[63:56], 45'b0, `DESR_34[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_34[63:56], 45'b0, `DESR_34[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_34)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_34[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_34[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_34[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_34[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_34[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_34[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC4.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_34;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_34)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_34)
	begin
	     case (`ASI_34)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_34 >= 0) &  (`ASI_ADDR_34 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_34 >= 0) &  (`ASI_ADDR_34 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_34 >= 0) &  (`ASI_ADDR_34 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_34 >= 0) &  (`ASI_ADDR_34 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_34 >= 0) &  (`ASI_ADDR_34 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_34 >= 0) &  (`ASI_ADDR_34 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_34 >= 0) &  (`ASI_ADDR_34 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_34 >= 0) &  (`ASI_ADDR_34 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_34 >= 0) &  (`ASI_ADDR_34 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_34 >= 0) &  (`ASI_ADDR_34 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC4.lsu.lmd.lmq2_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_34 == 40'h20) ||  (`ASI_ADDR_34 == 40'h30)
			     || (`ASI_ADDR_34 == 40'h80)  
				 || ((`ASI_ADDR_34 == 40'ha0) & (`SPU_MA_BUSY_4 == 0) & (`SPU_MA_TID_4 == 2))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_34 == 40'h20) ||  (`ASI_ADDR_34 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_34, `ASI_ADDR_34, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_34, {24'b0, `ASI_ADDR_34}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c4t3 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 4;
assign mytid = 3;
assign   mytnum = 4*8 + 3;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC4.l2clk) ;
	@(posedge `SPC4.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_35  `SPC4.tlu.ras.dsfsr_3_new_in
`define ISFSR_NEW_IN_35 `SPC4.tlu.ras.isfsr_3_new_in

`define DSFSR_35 `SPC4.tlu.ras.dsfsr_3
`define ISFSR_35 `SPC4.tlu.ras.isfsr_3
`define DSFAR_35 `SPC4.tlu.dfd.dsfar_3

`define ASI_WR_DSFSR_35 `SPC4.tlu.ras.asi_wr_dsfsr[3]
`define ASI_WR_ISFSR_35 `SPC4.tlu.ras.asi_wr_isfsr[3]

`define RAS_WRITE_DESR_1st_35  `SPC4.tlu.dfd.ras_write_desr_1st[3]
`define RAS_WRITE_DESR_2nd_35  `SPC4.tlu.dfd.ras_write_desr_2nd[3]
`define DESR_asi_rd_35  `SPC4.tlu.ras_rd_desr[3]
`define DESR_35  `SPC4.tlu.dfd.desr_3

`define RAS_WRITE_FESR_35  `SPC4.tlu.ras.write_fesr[3]
`define FESR_35  `SPC4.tlu.dfd.fesr_3

`define ST_ERR_35  `SPC4.tlu.trl0.take_ftt & `SPC4.tlu.trl0.trap[3]
`define SW_REC_ERR_35  `SPC4.tlu.trl0.take_ade & `SPC4.tlu.trl0.trap[3]
`define DATA_ACC_ERR_35  `SPC4.tlu.trl0.take_dae & `SPC4.tlu.trl0.trap[3]
`define INST_ACC_ERR_35  `SPC4.tlu.trl0.take_iae & `SPC4.tlu.trl0.trap[3]
`define INT_PROC_ERR_35  `SPC4.tlu.trl0.take_ipe & `SPC4.tlu.trl0.trap[3]
`define HW_CORR_ERR_35  `SPC4.tlu.trl0.take_eer & `SPC4.tlu.trl0.trap[3]
`define INST_ACC_MMU_ERR_35  `SPC4.tlu.trl0.take_ime & `SPC4.tlu.trl0.trap[3]
`define DATA_ACC_MMU_ERR_35  `SPC4.tlu.trl0.take_dme & `SPC4.tlu.trl0.trap[3]

`define LSU_LD_VALID_B	`PROBES4.lsu_ld_valid
`define LSU_TID_DEC_B_35 `PROBES4.lsu_tid_dec_b[3]
`define ASI_LD_35	`SPC4.lsu.lmd.lmq3_pkt[60] & (`SPC4.lsu.lmd.lmq3_pkt[49:48] == 2'b0)
`define ASI_35	`SPC4.lsu.lmd.lmq3_pkt[47:40]
`define ASI_ADDR_35	`SPC4.lsu.lmd.lmq3_pkt[39:0]
`define ASI_LD_DATA_35	`SPC4.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_35	tb_top.nas_top.c4.t3.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_4	`SPC4.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_4	`SPC4.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC4.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_35)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_35[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_35  != 4'b0) && ~`ASI_WR_DSFSR_35;
        update_isfsr_w <= (`ISFSR_NEW_IN_35  != 3'b0) && ~`ASI_WR_ISFSR_35;
        desr_wr <=  (`RAS_WRITE_DESR_1st_35  || `RAS_WRITE_DESR_2nd_35);
        update_dfesr_w <= `RAS_WRITE_FESR_35;
        take_err_trap_fx4 <= `ST_ERR_35 | `SW_REC_ERR_35  | `DATA_ACC_ERR_35
                           | `INST_ACC_ERR_35 | `INT_PROC_ERR_35
                           | `HW_CORR_ERR_35 | `INST_ACC_MMU_ERR_35
                           | `DATA_ACC_MMU_ERR_35 ;


        if (`ST_ERR_35) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_35) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_35) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_35) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_35) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_35) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_35) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_35) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_35[63:56], 45'b0, `DESR_35[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_35[63:56], 45'b0, `DESR_35[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_35)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_35[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_35[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_35[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_35[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_35[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_35[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC4.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_35;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_35)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_35)
	begin
	     case (`ASI_35)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_35 >= 0) &  (`ASI_ADDR_35 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_35 >= 0) &  (`ASI_ADDR_35 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_35 >= 0) &  (`ASI_ADDR_35 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_35 >= 0) &  (`ASI_ADDR_35 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_35 >= 0) &  (`ASI_ADDR_35 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_35 >= 0) &  (`ASI_ADDR_35 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_35 >= 0) &  (`ASI_ADDR_35 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_35 >= 0) &  (`ASI_ADDR_35 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_35 >= 0) &  (`ASI_ADDR_35 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_35 >= 0) &  (`ASI_ADDR_35 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC4.lsu.lmd.lmq3_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_35 == 40'h20) ||  (`ASI_ADDR_35 == 40'h30)
			     || (`ASI_ADDR_35 == 40'h80)  
				 || ((`ASI_ADDR_35 == 40'ha0) & (`SPU_MA_BUSY_4 == 0) & (`SPU_MA_TID_4 == 3))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_35 == 40'h20) ||  (`ASI_ADDR_35 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_35, `ASI_ADDR_35, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_35, {24'b0, `ASI_ADDR_35}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c4t4 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 4;
assign mytid = 4;
assign   mytnum = 4*8 + 4;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC4.l2clk) ;
	@(posedge `SPC4.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_36  `SPC4.tlu.ras.dsfsr_4_new_in
`define ISFSR_NEW_IN_36 `SPC4.tlu.ras.isfsr_4_new_in

`define DSFSR_36 `SPC4.tlu.ras.dsfsr_4
`define ISFSR_36 `SPC4.tlu.ras.isfsr_4
`define DSFAR_36 `SPC4.tlu.dfd.dsfar_4

`define ASI_WR_DSFSR_36 `SPC4.tlu.ras.asi_wr_dsfsr[4]
`define ASI_WR_ISFSR_36 `SPC4.tlu.ras.asi_wr_isfsr[4]

`define RAS_WRITE_DESR_1st_36  `SPC4.tlu.dfd.ras_write_desr_1st[4]
`define RAS_WRITE_DESR_2nd_36  `SPC4.tlu.dfd.ras_write_desr_2nd[4]
`define DESR_asi_rd_36  `SPC4.tlu.ras_rd_desr[4]
`define DESR_36  `SPC4.tlu.dfd.desr_4

`define RAS_WRITE_FESR_36  `SPC4.tlu.ras.write_fesr[4]
`define FESR_36  `SPC4.tlu.dfd.fesr_4

`define ST_ERR_36  `SPC4.tlu.trl1.take_ftt & `SPC4.tlu.trl1.trap[0]
`define SW_REC_ERR_36  `SPC4.tlu.trl1.take_ade & `SPC4.tlu.trl1.trap[0]
`define DATA_ACC_ERR_36  `SPC4.tlu.trl1.take_dae & `SPC4.tlu.trl1.trap[0]
`define INST_ACC_ERR_36  `SPC4.tlu.trl1.take_iae & `SPC4.tlu.trl1.trap[0]
`define INT_PROC_ERR_36  `SPC4.tlu.trl1.take_ipe & `SPC4.tlu.trl1.trap[0]
`define HW_CORR_ERR_36  `SPC4.tlu.trl1.take_eer & `SPC4.tlu.trl1.trap[0]
`define INST_ACC_MMU_ERR_36  `SPC4.tlu.trl1.take_ime & `SPC4.tlu.trl1.trap[0]
`define DATA_ACC_MMU_ERR_36  `SPC4.tlu.trl1.take_dme & `SPC4.tlu.trl1.trap[0]

`define LSU_LD_VALID_B	`PROBES4.lsu_ld_valid
`define LSU_TID_DEC_B_36 `PROBES4.lsu_tid_dec_b[4]
`define ASI_LD_36	`SPC4.lsu.lmd.lmq4_pkt[60] & (`SPC4.lsu.lmd.lmq4_pkt[49:48] == 2'b0)
`define ASI_36	`SPC4.lsu.lmd.lmq4_pkt[47:40]
`define ASI_ADDR_36	`SPC4.lsu.lmd.lmq4_pkt[39:0]
`define ASI_LD_DATA_36	`SPC4.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_36	tb_top.nas_top.c4.t4.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_4	`SPC4.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_4	`SPC4.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC4.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_36)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_36[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_36  != 4'b0) && ~`ASI_WR_DSFSR_36;
        update_isfsr_w <= (`ISFSR_NEW_IN_36  != 3'b0) && ~`ASI_WR_ISFSR_36;
        desr_wr <=  (`RAS_WRITE_DESR_1st_36  || `RAS_WRITE_DESR_2nd_36);
        update_dfesr_w <= `RAS_WRITE_FESR_36;
        take_err_trap_fx4 <= `ST_ERR_36 | `SW_REC_ERR_36  | `DATA_ACC_ERR_36
                           | `INST_ACC_ERR_36 | `INT_PROC_ERR_36
                           | `HW_CORR_ERR_36 | `INST_ACC_MMU_ERR_36
                           | `DATA_ACC_MMU_ERR_36 ;


        if (`ST_ERR_36) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_36) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_36) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_36) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_36) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_36) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_36) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_36) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_36[63:56], 45'b0, `DESR_36[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_36[63:56], 45'b0, `DESR_36[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_36)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_36[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_36[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_36[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_36[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_36[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_36[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC4.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_36;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_36)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_36)
	begin
	     case (`ASI_36)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_36 >= 0) &  (`ASI_ADDR_36 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_36 >= 0) &  (`ASI_ADDR_36 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_36 >= 0) &  (`ASI_ADDR_36 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_36 >= 0) &  (`ASI_ADDR_36 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_36 >= 0) &  (`ASI_ADDR_36 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_36 >= 0) &  (`ASI_ADDR_36 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_36 >= 0) &  (`ASI_ADDR_36 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_36 >= 0) &  (`ASI_ADDR_36 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_36 >= 0) &  (`ASI_ADDR_36 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_36 >= 0) &  (`ASI_ADDR_36 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC4.lsu.lmd.lmq4_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_36 == 40'h20) ||  (`ASI_ADDR_36 == 40'h30)
			     || (`ASI_ADDR_36 == 40'h80)  
				 || ((`ASI_ADDR_36 == 40'ha0) & (`SPU_MA_BUSY_4 == 0) & (`SPU_MA_TID_4 == 4))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_36 == 40'h20) ||  (`ASI_ADDR_36 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_36, `ASI_ADDR_36, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_36, {24'b0, `ASI_ADDR_36}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c4t5 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 4;
assign mytid = 5;
assign   mytnum = 4*8 + 5;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC4.l2clk) ;
	@(posedge `SPC4.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_37  `SPC4.tlu.ras.dsfsr_5_new_in
`define ISFSR_NEW_IN_37 `SPC4.tlu.ras.isfsr_5_new_in

`define DSFSR_37 `SPC4.tlu.ras.dsfsr_5
`define ISFSR_37 `SPC4.tlu.ras.isfsr_5
`define DSFAR_37 `SPC4.tlu.dfd.dsfar_5

`define ASI_WR_DSFSR_37 `SPC4.tlu.ras.asi_wr_dsfsr[5]
`define ASI_WR_ISFSR_37 `SPC4.tlu.ras.asi_wr_isfsr[5]

`define RAS_WRITE_DESR_1st_37  `SPC4.tlu.dfd.ras_write_desr_1st[5]
`define RAS_WRITE_DESR_2nd_37  `SPC4.tlu.dfd.ras_write_desr_2nd[5]
`define DESR_asi_rd_37  `SPC4.tlu.ras_rd_desr[5]
`define DESR_37  `SPC4.tlu.dfd.desr_5

`define RAS_WRITE_FESR_37  `SPC4.tlu.ras.write_fesr[5]
`define FESR_37  `SPC4.tlu.dfd.fesr_5

`define ST_ERR_37  `SPC4.tlu.trl1.take_ftt & `SPC4.tlu.trl1.trap[1]
`define SW_REC_ERR_37  `SPC4.tlu.trl1.take_ade & `SPC4.tlu.trl1.trap[1]
`define DATA_ACC_ERR_37  `SPC4.tlu.trl1.take_dae & `SPC4.tlu.trl1.trap[1]
`define INST_ACC_ERR_37  `SPC4.tlu.trl1.take_iae & `SPC4.tlu.trl1.trap[1]
`define INT_PROC_ERR_37  `SPC4.tlu.trl1.take_ipe & `SPC4.tlu.trl1.trap[1]
`define HW_CORR_ERR_37  `SPC4.tlu.trl1.take_eer & `SPC4.tlu.trl1.trap[1]
`define INST_ACC_MMU_ERR_37  `SPC4.tlu.trl1.take_ime & `SPC4.tlu.trl1.trap[1]
`define DATA_ACC_MMU_ERR_37  `SPC4.tlu.trl1.take_dme & `SPC4.tlu.trl1.trap[1]

`define LSU_LD_VALID_B	`PROBES4.lsu_ld_valid
`define LSU_TID_DEC_B_37 `PROBES4.lsu_tid_dec_b[5]
`define ASI_LD_37	`SPC4.lsu.lmd.lmq5_pkt[60] & (`SPC4.lsu.lmd.lmq5_pkt[49:48] == 2'b0)
`define ASI_37	`SPC4.lsu.lmd.lmq5_pkt[47:40]
`define ASI_ADDR_37	`SPC4.lsu.lmd.lmq5_pkt[39:0]
`define ASI_LD_DATA_37	`SPC4.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_37	tb_top.nas_top.c4.t5.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_4	`SPC4.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_4	`SPC4.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC4.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_37)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_37[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_37  != 4'b0) && ~`ASI_WR_DSFSR_37;
        update_isfsr_w <= (`ISFSR_NEW_IN_37  != 3'b0) && ~`ASI_WR_ISFSR_37;
        desr_wr <=  (`RAS_WRITE_DESR_1st_37  || `RAS_WRITE_DESR_2nd_37);
        update_dfesr_w <= `RAS_WRITE_FESR_37;
        take_err_trap_fx4 <= `ST_ERR_37 | `SW_REC_ERR_37  | `DATA_ACC_ERR_37
                           | `INST_ACC_ERR_37 | `INT_PROC_ERR_37
                           | `HW_CORR_ERR_37 | `INST_ACC_MMU_ERR_37
                           | `DATA_ACC_MMU_ERR_37 ;


        if (`ST_ERR_37) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_37) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_37) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_37) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_37) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_37) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_37) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_37) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_37[63:56], 45'b0, `DESR_37[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_37[63:56], 45'b0, `DESR_37[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_37)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_37[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_37[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_37[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_37[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_37[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_37[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC4.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_37;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_37)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_37)
	begin
	     case (`ASI_37)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_37 >= 0) &  (`ASI_ADDR_37 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_37 >= 0) &  (`ASI_ADDR_37 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_37 >= 0) &  (`ASI_ADDR_37 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_37 >= 0) &  (`ASI_ADDR_37 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_37 >= 0) &  (`ASI_ADDR_37 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_37 >= 0) &  (`ASI_ADDR_37 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_37 >= 0) &  (`ASI_ADDR_37 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_37 >= 0) &  (`ASI_ADDR_37 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_37 >= 0) &  (`ASI_ADDR_37 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_37 >= 0) &  (`ASI_ADDR_37 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC4.lsu.lmd.lmq5_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_37 == 40'h20) ||  (`ASI_ADDR_37 == 40'h30)
			     || (`ASI_ADDR_37 == 40'h80)  
				 || ((`ASI_ADDR_37 == 40'ha0) & (`SPU_MA_BUSY_4 == 0) & (`SPU_MA_TID_4 == 5))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_37 == 40'h20) ||  (`ASI_ADDR_37 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_37, `ASI_ADDR_37, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_37, {24'b0, `ASI_ADDR_37}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c4t6 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 4;
assign mytid = 6;
assign   mytnum = 4*8 + 6;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC4.l2clk) ;
	@(posedge `SPC4.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_38  `SPC4.tlu.ras.dsfsr_6_new_in
`define ISFSR_NEW_IN_38 `SPC4.tlu.ras.isfsr_6_new_in

`define DSFSR_38 `SPC4.tlu.ras.dsfsr_6
`define ISFSR_38 `SPC4.tlu.ras.isfsr_6
`define DSFAR_38 `SPC4.tlu.dfd.dsfar_6

`define ASI_WR_DSFSR_38 `SPC4.tlu.ras.asi_wr_dsfsr[6]
`define ASI_WR_ISFSR_38 `SPC4.tlu.ras.asi_wr_isfsr[6]

`define RAS_WRITE_DESR_1st_38  `SPC4.tlu.dfd.ras_write_desr_1st[6]
`define RAS_WRITE_DESR_2nd_38  `SPC4.tlu.dfd.ras_write_desr_2nd[6]
`define DESR_asi_rd_38  `SPC4.tlu.ras_rd_desr[6]
`define DESR_38  `SPC4.tlu.dfd.desr_6

`define RAS_WRITE_FESR_38  `SPC4.tlu.ras.write_fesr[6]
`define FESR_38  `SPC4.tlu.dfd.fesr_6

`define ST_ERR_38  `SPC4.tlu.trl1.take_ftt & `SPC4.tlu.trl1.trap[2]
`define SW_REC_ERR_38  `SPC4.tlu.trl1.take_ade & `SPC4.tlu.trl1.trap[2]
`define DATA_ACC_ERR_38  `SPC4.tlu.trl1.take_dae & `SPC4.tlu.trl1.trap[2]
`define INST_ACC_ERR_38  `SPC4.tlu.trl1.take_iae & `SPC4.tlu.trl1.trap[2]
`define INT_PROC_ERR_38  `SPC4.tlu.trl1.take_ipe & `SPC4.tlu.trl1.trap[2]
`define HW_CORR_ERR_38  `SPC4.tlu.trl1.take_eer & `SPC4.tlu.trl1.trap[2]
`define INST_ACC_MMU_ERR_38  `SPC4.tlu.trl1.take_ime & `SPC4.tlu.trl1.trap[2]
`define DATA_ACC_MMU_ERR_38  `SPC4.tlu.trl1.take_dme & `SPC4.tlu.trl1.trap[2]

`define LSU_LD_VALID_B	`PROBES4.lsu_ld_valid
`define LSU_TID_DEC_B_38 `PROBES4.lsu_tid_dec_b[6]
`define ASI_LD_38	`SPC4.lsu.lmd.lmq6_pkt[60] & (`SPC4.lsu.lmd.lmq6_pkt[49:48] == 2'b0)
`define ASI_38	`SPC4.lsu.lmd.lmq6_pkt[47:40]
`define ASI_ADDR_38	`SPC4.lsu.lmd.lmq6_pkt[39:0]
`define ASI_LD_DATA_38	`SPC4.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_38	tb_top.nas_top.c4.t6.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_4	`SPC4.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_4	`SPC4.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC4.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_38)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_38[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_38  != 4'b0) && ~`ASI_WR_DSFSR_38;
        update_isfsr_w <= (`ISFSR_NEW_IN_38  != 3'b0) && ~`ASI_WR_ISFSR_38;
        desr_wr <=  (`RAS_WRITE_DESR_1st_38  || `RAS_WRITE_DESR_2nd_38);
        update_dfesr_w <= `RAS_WRITE_FESR_38;
        take_err_trap_fx4 <= `ST_ERR_38 | `SW_REC_ERR_38  | `DATA_ACC_ERR_38
                           | `INST_ACC_ERR_38 | `INT_PROC_ERR_38
                           | `HW_CORR_ERR_38 | `INST_ACC_MMU_ERR_38
                           | `DATA_ACC_MMU_ERR_38 ;


        if (`ST_ERR_38) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_38) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_38) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_38) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_38) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_38) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_38) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_38) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_38[63:56], 45'b0, `DESR_38[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_38[63:56], 45'b0, `DESR_38[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_38)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_38[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_38[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_38[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_38[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_38[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_38[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC4.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_38;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_38)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_38)
	begin
	     case (`ASI_38)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_38 >= 0) &  (`ASI_ADDR_38 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_38 >= 0) &  (`ASI_ADDR_38 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_38 >= 0) &  (`ASI_ADDR_38 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_38 >= 0) &  (`ASI_ADDR_38 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_38 >= 0) &  (`ASI_ADDR_38 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_38 >= 0) &  (`ASI_ADDR_38 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_38 >= 0) &  (`ASI_ADDR_38 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_38 >= 0) &  (`ASI_ADDR_38 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_38 >= 0) &  (`ASI_ADDR_38 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_38 >= 0) &  (`ASI_ADDR_38 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC4.lsu.lmd.lmq6_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_38 == 40'h20) ||  (`ASI_ADDR_38 == 40'h30)
			     || (`ASI_ADDR_38 == 40'h80)  
				 || ((`ASI_ADDR_38 == 40'ha0) & (`SPU_MA_BUSY_4 == 0) & (`SPU_MA_TID_4 == 6))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_38 == 40'h20) ||  (`ASI_ADDR_38 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_38, `ASI_ADDR_38, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_38, {24'b0, `ASI_ADDR_38}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c4t7 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 4;
assign mytid = 7;
assign   mytnum = 4*8 + 7;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC4.l2clk) ;
	@(posedge `SPC4.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_39  `SPC4.tlu.ras.dsfsr_7_new_in
`define ISFSR_NEW_IN_39 `SPC4.tlu.ras.isfsr_7_new_in

`define DSFSR_39 `SPC4.tlu.ras.dsfsr_7
`define ISFSR_39 `SPC4.tlu.ras.isfsr_7
`define DSFAR_39 `SPC4.tlu.dfd.dsfar_7

`define ASI_WR_DSFSR_39 `SPC4.tlu.ras.asi_wr_dsfsr[7]
`define ASI_WR_ISFSR_39 `SPC4.tlu.ras.asi_wr_isfsr[7]

`define RAS_WRITE_DESR_1st_39  `SPC4.tlu.dfd.ras_write_desr_1st[7]
`define RAS_WRITE_DESR_2nd_39  `SPC4.tlu.dfd.ras_write_desr_2nd[7]
`define DESR_asi_rd_39  `SPC4.tlu.ras_rd_desr[7]
`define DESR_39  `SPC4.tlu.dfd.desr_7

`define RAS_WRITE_FESR_39  `SPC4.tlu.ras.write_fesr[7]
`define FESR_39  `SPC4.tlu.dfd.fesr_7

`define ST_ERR_39  `SPC4.tlu.trl1.take_ftt & `SPC4.tlu.trl1.trap[3]
`define SW_REC_ERR_39  `SPC4.tlu.trl1.take_ade & `SPC4.tlu.trl1.trap[3]
`define DATA_ACC_ERR_39  `SPC4.tlu.trl1.take_dae & `SPC4.tlu.trl1.trap[3]
`define INST_ACC_ERR_39  `SPC4.tlu.trl1.take_iae & `SPC4.tlu.trl1.trap[3]
`define INT_PROC_ERR_39  `SPC4.tlu.trl1.take_ipe & `SPC4.tlu.trl1.trap[3]
`define HW_CORR_ERR_39  `SPC4.tlu.trl1.take_eer & `SPC4.tlu.trl1.trap[3]
`define INST_ACC_MMU_ERR_39  `SPC4.tlu.trl1.take_ime & `SPC4.tlu.trl1.trap[3]
`define DATA_ACC_MMU_ERR_39  `SPC4.tlu.trl1.take_dme & `SPC4.tlu.trl1.trap[3]

`define LSU_LD_VALID_B	`PROBES4.lsu_ld_valid
`define LSU_TID_DEC_B_39 `PROBES4.lsu_tid_dec_b[7]
`define ASI_LD_39	`SPC4.lsu.lmd.lmq7_pkt[60] & (`SPC4.lsu.lmd.lmq7_pkt[49:48] == 2'b0)
`define ASI_39	`SPC4.lsu.lmd.lmq7_pkt[47:40]
`define ASI_ADDR_39	`SPC4.lsu.lmd.lmq7_pkt[39:0]
`define ASI_LD_DATA_39	`SPC4.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_39	tb_top.nas_top.c4.t7.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_4	`SPC4.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_4	`SPC4.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC4.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_39)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_39[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_39  != 4'b0) && ~`ASI_WR_DSFSR_39;
        update_isfsr_w <= (`ISFSR_NEW_IN_39  != 3'b0) && ~`ASI_WR_ISFSR_39;
        desr_wr <=  (`RAS_WRITE_DESR_1st_39  || `RAS_WRITE_DESR_2nd_39);
        update_dfesr_w <= `RAS_WRITE_FESR_39;
        take_err_trap_fx4 <= `ST_ERR_39 | `SW_REC_ERR_39  | `DATA_ACC_ERR_39
                           | `INST_ACC_ERR_39 | `INT_PROC_ERR_39
                           | `HW_CORR_ERR_39 | `INST_ACC_MMU_ERR_39
                           | `DATA_ACC_MMU_ERR_39 ;


        if (`ST_ERR_39) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_39) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_39) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_39) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_39) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_39) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_39) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_39) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_39[63:56], 45'b0, `DESR_39[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_39[63:56], 45'b0, `DESR_39[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_39)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_39[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_39[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_39[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_39[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_39[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_39[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC4.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_39;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_39)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_39)
	begin
	     case (`ASI_39)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_39 >= 0) &  (`ASI_ADDR_39 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_39 >= 0) &  (`ASI_ADDR_39 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_39 >= 0) &  (`ASI_ADDR_39 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_39 >= 0) &  (`ASI_ADDR_39 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_39 >= 0) &  (`ASI_ADDR_39 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_39 >= 0) &  (`ASI_ADDR_39 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_39 >= 0) &  (`ASI_ADDR_39 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_39 >= 0) &  (`ASI_ADDR_39 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_39 >= 0) &  (`ASI_ADDR_39 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_39 >= 0) &  (`ASI_ADDR_39 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC4.lsu.lmd.lmq7_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_39 == 40'h20) ||  (`ASI_ADDR_39 == 40'h30)
			     || (`ASI_ADDR_39 == 40'h80)  
				 || ((`ASI_ADDR_39 == 40'ha0) & (`SPU_MA_BUSY_4 == 0) & (`SPU_MA_TID_4 == 7))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_39 == 40'h20) ||  (`ASI_ADDR_39 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_39, `ASI_ADDR_39, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_39, {24'b0, `ASI_ADDR_39}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule

`endif

`ifdef CORE_5



module err_c5t0 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 5;
assign mytid = 0;
assign   mytnum = 5*8 + 0;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC5.l2clk) ;
	@(posedge `SPC5.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_40  `SPC5.tlu.ras.dsfsr_0_new_in
`define ISFSR_NEW_IN_40 `SPC5.tlu.ras.isfsr_0_new_in

`define DSFSR_40 `SPC5.tlu.ras.dsfsr_0
`define ISFSR_40 `SPC5.tlu.ras.isfsr_0
`define DSFAR_40 `SPC5.tlu.dfd.dsfar_0

`define ASI_WR_DSFSR_40 `SPC5.tlu.ras.asi_wr_dsfsr[0]
`define ASI_WR_ISFSR_40 `SPC5.tlu.ras.asi_wr_isfsr[0]

`define RAS_WRITE_DESR_1st_40  `SPC5.tlu.dfd.ras_write_desr_1st[0]
`define RAS_WRITE_DESR_2nd_40  `SPC5.tlu.dfd.ras_write_desr_2nd[0]
`define DESR_asi_rd_40  `SPC5.tlu.ras_rd_desr[0]
`define DESR_40  `SPC5.tlu.dfd.desr_0

`define RAS_WRITE_FESR_40  `SPC5.tlu.ras.write_fesr[0]
`define FESR_40  `SPC5.tlu.dfd.fesr_0

`define ST_ERR_40  `SPC5.tlu.trl0.take_ftt & `SPC5.tlu.trl0.trap[0]
`define SW_REC_ERR_40  `SPC5.tlu.trl0.take_ade & `SPC5.tlu.trl0.trap[0]
`define DATA_ACC_ERR_40  `SPC5.tlu.trl0.take_dae & `SPC5.tlu.trl0.trap[0]
`define INST_ACC_ERR_40  `SPC5.tlu.trl0.take_iae & `SPC5.tlu.trl0.trap[0]
`define INT_PROC_ERR_40  `SPC5.tlu.trl0.take_ipe & `SPC5.tlu.trl0.trap[0]
`define HW_CORR_ERR_40  `SPC5.tlu.trl0.take_eer & `SPC5.tlu.trl0.trap[0]
`define INST_ACC_MMU_ERR_40  `SPC5.tlu.trl0.take_ime & `SPC5.tlu.trl0.trap[0]
`define DATA_ACC_MMU_ERR_40  `SPC5.tlu.trl0.take_dme & `SPC5.tlu.trl0.trap[0]

`define LSU_LD_VALID_B	`PROBES5.lsu_ld_valid
`define LSU_TID_DEC_B_40 `PROBES5.lsu_tid_dec_b[0]
`define ASI_LD_40	`SPC5.lsu.lmd.lmq0_pkt[60] & (`SPC5.lsu.lmd.lmq0_pkt[49:48] == 2'b0)
`define ASI_40	`SPC5.lsu.lmd.lmq0_pkt[47:40]
`define ASI_ADDR_40	`SPC5.lsu.lmd.lmq0_pkt[39:0]
`define ASI_LD_DATA_40	`SPC5.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_40	tb_top.nas_top.c5.t0.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_5	`SPC5.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_5	`SPC5.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC5.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_40)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_40[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_40  != 4'b0) && ~`ASI_WR_DSFSR_40;
        update_isfsr_w <= (`ISFSR_NEW_IN_40  != 3'b0) && ~`ASI_WR_ISFSR_40;
        desr_wr <=  (`RAS_WRITE_DESR_1st_40  || `RAS_WRITE_DESR_2nd_40);
        update_dfesr_w <= `RAS_WRITE_FESR_40;
        take_err_trap_fx4 <= `ST_ERR_40 | `SW_REC_ERR_40  | `DATA_ACC_ERR_40
                           | `INST_ACC_ERR_40 | `INT_PROC_ERR_40
                           | `HW_CORR_ERR_40 | `INST_ACC_MMU_ERR_40
                           | `DATA_ACC_MMU_ERR_40 ;


        if (`ST_ERR_40) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_40) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_40) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_40) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_40) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_40) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_40) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_40) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_40[63:56], 45'b0, `DESR_40[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_40[63:56], 45'b0, `DESR_40[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_40)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_40[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_40[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_40[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_40[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_40[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_40[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC5.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_40;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_40)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_40)
	begin
	     case (`ASI_40)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_40 >= 0) &  (`ASI_ADDR_40 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_40 >= 0) &  (`ASI_ADDR_40 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_40 >= 0) &  (`ASI_ADDR_40 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_40 >= 0) &  (`ASI_ADDR_40 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_40 >= 0) &  (`ASI_ADDR_40 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_40 >= 0) &  (`ASI_ADDR_40 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_40 >= 0) &  (`ASI_ADDR_40 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_40 >= 0) &  (`ASI_ADDR_40 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_40 >= 0) &  (`ASI_ADDR_40 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_40 >= 0) &  (`ASI_ADDR_40 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC5.lsu.lmd.lmq0_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_40 == 40'h20) ||  (`ASI_ADDR_40 == 40'h30)
			     || (`ASI_ADDR_40 == 40'h80)  
				 || ((`ASI_ADDR_40 == 40'ha0) & (`SPU_MA_BUSY_5 == 0) & (`SPU_MA_TID_5 == 0))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_40 == 40'h20) ||  (`ASI_ADDR_40 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_40, `ASI_ADDR_40, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_40, {24'b0, `ASI_ADDR_40}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c5t1 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 5;
assign mytid = 1;
assign   mytnum = 5*8 + 1;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC5.l2clk) ;
	@(posedge `SPC5.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_41  `SPC5.tlu.ras.dsfsr_1_new_in
`define ISFSR_NEW_IN_41 `SPC5.tlu.ras.isfsr_1_new_in

`define DSFSR_41 `SPC5.tlu.ras.dsfsr_1
`define ISFSR_41 `SPC5.tlu.ras.isfsr_1
`define DSFAR_41 `SPC5.tlu.dfd.dsfar_1

`define ASI_WR_DSFSR_41 `SPC5.tlu.ras.asi_wr_dsfsr[1]
`define ASI_WR_ISFSR_41 `SPC5.tlu.ras.asi_wr_isfsr[1]

`define RAS_WRITE_DESR_1st_41  `SPC5.tlu.dfd.ras_write_desr_1st[1]
`define RAS_WRITE_DESR_2nd_41  `SPC5.tlu.dfd.ras_write_desr_2nd[1]
`define DESR_asi_rd_41  `SPC5.tlu.ras_rd_desr[1]
`define DESR_41  `SPC5.tlu.dfd.desr_1

`define RAS_WRITE_FESR_41  `SPC5.tlu.ras.write_fesr[1]
`define FESR_41  `SPC5.tlu.dfd.fesr_1

`define ST_ERR_41  `SPC5.tlu.trl0.take_ftt & `SPC5.tlu.trl0.trap[1]
`define SW_REC_ERR_41  `SPC5.tlu.trl0.take_ade & `SPC5.tlu.trl0.trap[1]
`define DATA_ACC_ERR_41  `SPC5.tlu.trl0.take_dae & `SPC5.tlu.trl0.trap[1]
`define INST_ACC_ERR_41  `SPC5.tlu.trl0.take_iae & `SPC5.tlu.trl0.trap[1]
`define INT_PROC_ERR_41  `SPC5.tlu.trl0.take_ipe & `SPC5.tlu.trl0.trap[1]
`define HW_CORR_ERR_41  `SPC5.tlu.trl0.take_eer & `SPC5.tlu.trl0.trap[1]
`define INST_ACC_MMU_ERR_41  `SPC5.tlu.trl0.take_ime & `SPC5.tlu.trl0.trap[1]
`define DATA_ACC_MMU_ERR_41  `SPC5.tlu.trl0.take_dme & `SPC5.tlu.trl0.trap[1]

`define LSU_LD_VALID_B	`PROBES5.lsu_ld_valid
`define LSU_TID_DEC_B_41 `PROBES5.lsu_tid_dec_b[1]
`define ASI_LD_41	`SPC5.lsu.lmd.lmq1_pkt[60] & (`SPC5.lsu.lmd.lmq1_pkt[49:48] == 2'b0)
`define ASI_41	`SPC5.lsu.lmd.lmq1_pkt[47:40]
`define ASI_ADDR_41	`SPC5.lsu.lmd.lmq1_pkt[39:0]
`define ASI_LD_DATA_41	`SPC5.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_41	tb_top.nas_top.c5.t1.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_5	`SPC5.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_5	`SPC5.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC5.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_41)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_41[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_41  != 4'b0) && ~`ASI_WR_DSFSR_41;
        update_isfsr_w <= (`ISFSR_NEW_IN_41  != 3'b0) && ~`ASI_WR_ISFSR_41;
        desr_wr <=  (`RAS_WRITE_DESR_1st_41  || `RAS_WRITE_DESR_2nd_41);
        update_dfesr_w <= `RAS_WRITE_FESR_41;
        take_err_trap_fx4 <= `ST_ERR_41 | `SW_REC_ERR_41  | `DATA_ACC_ERR_41
                           | `INST_ACC_ERR_41 | `INT_PROC_ERR_41
                           | `HW_CORR_ERR_41 | `INST_ACC_MMU_ERR_41
                           | `DATA_ACC_MMU_ERR_41 ;


        if (`ST_ERR_41) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_41) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_41) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_41) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_41) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_41) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_41) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_41) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_41[63:56], 45'b0, `DESR_41[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_41[63:56], 45'b0, `DESR_41[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_41)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_41[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_41[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_41[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_41[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_41[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_41[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC5.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_41;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_41)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_41)
	begin
	     case (`ASI_41)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_41 >= 0) &  (`ASI_ADDR_41 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_41 >= 0) &  (`ASI_ADDR_41 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_41 >= 0) &  (`ASI_ADDR_41 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_41 >= 0) &  (`ASI_ADDR_41 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_41 >= 0) &  (`ASI_ADDR_41 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_41 >= 0) &  (`ASI_ADDR_41 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_41 >= 0) &  (`ASI_ADDR_41 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_41 >= 0) &  (`ASI_ADDR_41 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_41 >= 0) &  (`ASI_ADDR_41 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_41 >= 0) &  (`ASI_ADDR_41 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC5.lsu.lmd.lmq1_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_41 == 40'h20) ||  (`ASI_ADDR_41 == 40'h30)
			     || (`ASI_ADDR_41 == 40'h80)  
				 || ((`ASI_ADDR_41 == 40'ha0) & (`SPU_MA_BUSY_5 == 0) & (`SPU_MA_TID_5 == 1))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_41 == 40'h20) ||  (`ASI_ADDR_41 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_41, `ASI_ADDR_41, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_41, {24'b0, `ASI_ADDR_41}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c5t2 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 5;
assign mytid = 2;
assign   mytnum = 5*8 + 2;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC5.l2clk) ;
	@(posedge `SPC5.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_42  `SPC5.tlu.ras.dsfsr_2_new_in
`define ISFSR_NEW_IN_42 `SPC5.tlu.ras.isfsr_2_new_in

`define DSFSR_42 `SPC5.tlu.ras.dsfsr_2
`define ISFSR_42 `SPC5.tlu.ras.isfsr_2
`define DSFAR_42 `SPC5.tlu.dfd.dsfar_2

`define ASI_WR_DSFSR_42 `SPC5.tlu.ras.asi_wr_dsfsr[2]
`define ASI_WR_ISFSR_42 `SPC5.tlu.ras.asi_wr_isfsr[2]

`define RAS_WRITE_DESR_1st_42  `SPC5.tlu.dfd.ras_write_desr_1st[2]
`define RAS_WRITE_DESR_2nd_42  `SPC5.tlu.dfd.ras_write_desr_2nd[2]
`define DESR_asi_rd_42  `SPC5.tlu.ras_rd_desr[2]
`define DESR_42  `SPC5.tlu.dfd.desr_2

`define RAS_WRITE_FESR_42  `SPC5.tlu.ras.write_fesr[2]
`define FESR_42  `SPC5.tlu.dfd.fesr_2

`define ST_ERR_42  `SPC5.tlu.trl0.take_ftt & `SPC5.tlu.trl0.trap[2]
`define SW_REC_ERR_42  `SPC5.tlu.trl0.take_ade & `SPC5.tlu.trl0.trap[2]
`define DATA_ACC_ERR_42  `SPC5.tlu.trl0.take_dae & `SPC5.tlu.trl0.trap[2]
`define INST_ACC_ERR_42  `SPC5.tlu.trl0.take_iae & `SPC5.tlu.trl0.trap[2]
`define INT_PROC_ERR_42  `SPC5.tlu.trl0.take_ipe & `SPC5.tlu.trl0.trap[2]
`define HW_CORR_ERR_42  `SPC5.tlu.trl0.take_eer & `SPC5.tlu.trl0.trap[2]
`define INST_ACC_MMU_ERR_42  `SPC5.tlu.trl0.take_ime & `SPC5.tlu.trl0.trap[2]
`define DATA_ACC_MMU_ERR_42  `SPC5.tlu.trl0.take_dme & `SPC5.tlu.trl0.trap[2]

`define LSU_LD_VALID_B	`PROBES5.lsu_ld_valid
`define LSU_TID_DEC_B_42 `PROBES5.lsu_tid_dec_b[2]
`define ASI_LD_42	`SPC5.lsu.lmd.lmq2_pkt[60] & (`SPC5.lsu.lmd.lmq2_pkt[49:48] == 2'b0)
`define ASI_42	`SPC5.lsu.lmd.lmq2_pkt[47:40]
`define ASI_ADDR_42	`SPC5.lsu.lmd.lmq2_pkt[39:0]
`define ASI_LD_DATA_42	`SPC5.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_42	tb_top.nas_top.c5.t2.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_5	`SPC5.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_5	`SPC5.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC5.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_42)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_42[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_42  != 4'b0) && ~`ASI_WR_DSFSR_42;
        update_isfsr_w <= (`ISFSR_NEW_IN_42  != 3'b0) && ~`ASI_WR_ISFSR_42;
        desr_wr <=  (`RAS_WRITE_DESR_1st_42  || `RAS_WRITE_DESR_2nd_42);
        update_dfesr_w <= `RAS_WRITE_FESR_42;
        take_err_trap_fx4 <= `ST_ERR_42 | `SW_REC_ERR_42  | `DATA_ACC_ERR_42
                           | `INST_ACC_ERR_42 | `INT_PROC_ERR_42
                           | `HW_CORR_ERR_42 | `INST_ACC_MMU_ERR_42
                           | `DATA_ACC_MMU_ERR_42 ;


        if (`ST_ERR_42) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_42) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_42) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_42) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_42) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_42) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_42) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_42) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_42[63:56], 45'b0, `DESR_42[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_42[63:56], 45'b0, `DESR_42[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_42)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_42[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_42[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_42[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_42[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_42[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_42[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC5.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_42;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_42)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_42)
	begin
	     case (`ASI_42)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_42 >= 0) &  (`ASI_ADDR_42 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_42 >= 0) &  (`ASI_ADDR_42 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_42 >= 0) &  (`ASI_ADDR_42 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_42 >= 0) &  (`ASI_ADDR_42 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_42 >= 0) &  (`ASI_ADDR_42 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_42 >= 0) &  (`ASI_ADDR_42 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_42 >= 0) &  (`ASI_ADDR_42 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_42 >= 0) &  (`ASI_ADDR_42 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_42 >= 0) &  (`ASI_ADDR_42 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_42 >= 0) &  (`ASI_ADDR_42 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC5.lsu.lmd.lmq2_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_42 == 40'h20) ||  (`ASI_ADDR_42 == 40'h30)
			     || (`ASI_ADDR_42 == 40'h80)  
				 || ((`ASI_ADDR_42 == 40'ha0) & (`SPU_MA_BUSY_5 == 0) & (`SPU_MA_TID_5 == 2))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_42 == 40'h20) ||  (`ASI_ADDR_42 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_42, `ASI_ADDR_42, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_42, {24'b0, `ASI_ADDR_42}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c5t3 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 5;
assign mytid = 3;
assign   mytnum = 5*8 + 3;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC5.l2clk) ;
	@(posedge `SPC5.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_43  `SPC5.tlu.ras.dsfsr_3_new_in
`define ISFSR_NEW_IN_43 `SPC5.tlu.ras.isfsr_3_new_in

`define DSFSR_43 `SPC5.tlu.ras.dsfsr_3
`define ISFSR_43 `SPC5.tlu.ras.isfsr_3
`define DSFAR_43 `SPC5.tlu.dfd.dsfar_3

`define ASI_WR_DSFSR_43 `SPC5.tlu.ras.asi_wr_dsfsr[3]
`define ASI_WR_ISFSR_43 `SPC5.tlu.ras.asi_wr_isfsr[3]

`define RAS_WRITE_DESR_1st_43  `SPC5.tlu.dfd.ras_write_desr_1st[3]
`define RAS_WRITE_DESR_2nd_43  `SPC5.tlu.dfd.ras_write_desr_2nd[3]
`define DESR_asi_rd_43  `SPC5.tlu.ras_rd_desr[3]
`define DESR_43  `SPC5.tlu.dfd.desr_3

`define RAS_WRITE_FESR_43  `SPC5.tlu.ras.write_fesr[3]
`define FESR_43  `SPC5.tlu.dfd.fesr_3

`define ST_ERR_43  `SPC5.tlu.trl0.take_ftt & `SPC5.tlu.trl0.trap[3]
`define SW_REC_ERR_43  `SPC5.tlu.trl0.take_ade & `SPC5.tlu.trl0.trap[3]
`define DATA_ACC_ERR_43  `SPC5.tlu.trl0.take_dae & `SPC5.tlu.trl0.trap[3]
`define INST_ACC_ERR_43  `SPC5.tlu.trl0.take_iae & `SPC5.tlu.trl0.trap[3]
`define INT_PROC_ERR_43  `SPC5.tlu.trl0.take_ipe & `SPC5.tlu.trl0.trap[3]
`define HW_CORR_ERR_43  `SPC5.tlu.trl0.take_eer & `SPC5.tlu.trl0.trap[3]
`define INST_ACC_MMU_ERR_43  `SPC5.tlu.trl0.take_ime & `SPC5.tlu.trl0.trap[3]
`define DATA_ACC_MMU_ERR_43  `SPC5.tlu.trl0.take_dme & `SPC5.tlu.trl0.trap[3]

`define LSU_LD_VALID_B	`PROBES5.lsu_ld_valid
`define LSU_TID_DEC_B_43 `PROBES5.lsu_tid_dec_b[3]
`define ASI_LD_43	`SPC5.lsu.lmd.lmq3_pkt[60] & (`SPC5.lsu.lmd.lmq3_pkt[49:48] == 2'b0)
`define ASI_43	`SPC5.lsu.lmd.lmq3_pkt[47:40]
`define ASI_ADDR_43	`SPC5.lsu.lmd.lmq3_pkt[39:0]
`define ASI_LD_DATA_43	`SPC5.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_43	tb_top.nas_top.c5.t3.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_5	`SPC5.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_5	`SPC5.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC5.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_43)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_43[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_43  != 4'b0) && ~`ASI_WR_DSFSR_43;
        update_isfsr_w <= (`ISFSR_NEW_IN_43  != 3'b0) && ~`ASI_WR_ISFSR_43;
        desr_wr <=  (`RAS_WRITE_DESR_1st_43  || `RAS_WRITE_DESR_2nd_43);
        update_dfesr_w <= `RAS_WRITE_FESR_43;
        take_err_trap_fx4 <= `ST_ERR_43 | `SW_REC_ERR_43  | `DATA_ACC_ERR_43
                           | `INST_ACC_ERR_43 | `INT_PROC_ERR_43
                           | `HW_CORR_ERR_43 | `INST_ACC_MMU_ERR_43
                           | `DATA_ACC_MMU_ERR_43 ;


        if (`ST_ERR_43) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_43) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_43) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_43) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_43) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_43) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_43) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_43) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_43[63:56], 45'b0, `DESR_43[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_43[63:56], 45'b0, `DESR_43[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_43)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_43[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_43[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_43[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_43[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_43[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_43[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC5.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_43;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_43)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_43)
	begin
	     case (`ASI_43)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_43 >= 0) &  (`ASI_ADDR_43 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_43 >= 0) &  (`ASI_ADDR_43 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_43 >= 0) &  (`ASI_ADDR_43 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_43 >= 0) &  (`ASI_ADDR_43 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_43 >= 0) &  (`ASI_ADDR_43 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_43 >= 0) &  (`ASI_ADDR_43 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_43 >= 0) &  (`ASI_ADDR_43 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_43 >= 0) &  (`ASI_ADDR_43 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_43 >= 0) &  (`ASI_ADDR_43 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_43 >= 0) &  (`ASI_ADDR_43 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC5.lsu.lmd.lmq3_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_43 == 40'h20) ||  (`ASI_ADDR_43 == 40'h30)
			     || (`ASI_ADDR_43 == 40'h80)  
				 || ((`ASI_ADDR_43 == 40'ha0) & (`SPU_MA_BUSY_5 == 0) & (`SPU_MA_TID_5 == 3))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_43 == 40'h20) ||  (`ASI_ADDR_43 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_43, `ASI_ADDR_43, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_43, {24'b0, `ASI_ADDR_43}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c5t4 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 5;
assign mytid = 4;
assign   mytnum = 5*8 + 4;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC5.l2clk) ;
	@(posedge `SPC5.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_44  `SPC5.tlu.ras.dsfsr_4_new_in
`define ISFSR_NEW_IN_44 `SPC5.tlu.ras.isfsr_4_new_in

`define DSFSR_44 `SPC5.tlu.ras.dsfsr_4
`define ISFSR_44 `SPC5.tlu.ras.isfsr_4
`define DSFAR_44 `SPC5.tlu.dfd.dsfar_4

`define ASI_WR_DSFSR_44 `SPC5.tlu.ras.asi_wr_dsfsr[4]
`define ASI_WR_ISFSR_44 `SPC5.tlu.ras.asi_wr_isfsr[4]

`define RAS_WRITE_DESR_1st_44  `SPC5.tlu.dfd.ras_write_desr_1st[4]
`define RAS_WRITE_DESR_2nd_44  `SPC5.tlu.dfd.ras_write_desr_2nd[4]
`define DESR_asi_rd_44  `SPC5.tlu.ras_rd_desr[4]
`define DESR_44  `SPC5.tlu.dfd.desr_4

`define RAS_WRITE_FESR_44  `SPC5.tlu.ras.write_fesr[4]
`define FESR_44  `SPC5.tlu.dfd.fesr_4

`define ST_ERR_44  `SPC5.tlu.trl1.take_ftt & `SPC5.tlu.trl1.trap[0]
`define SW_REC_ERR_44  `SPC5.tlu.trl1.take_ade & `SPC5.tlu.trl1.trap[0]
`define DATA_ACC_ERR_44  `SPC5.tlu.trl1.take_dae & `SPC5.tlu.trl1.trap[0]
`define INST_ACC_ERR_44  `SPC5.tlu.trl1.take_iae & `SPC5.tlu.trl1.trap[0]
`define INT_PROC_ERR_44  `SPC5.tlu.trl1.take_ipe & `SPC5.tlu.trl1.trap[0]
`define HW_CORR_ERR_44  `SPC5.tlu.trl1.take_eer & `SPC5.tlu.trl1.trap[0]
`define INST_ACC_MMU_ERR_44  `SPC5.tlu.trl1.take_ime & `SPC5.tlu.trl1.trap[0]
`define DATA_ACC_MMU_ERR_44  `SPC5.tlu.trl1.take_dme & `SPC5.tlu.trl1.trap[0]

`define LSU_LD_VALID_B	`PROBES5.lsu_ld_valid
`define LSU_TID_DEC_B_44 `PROBES5.lsu_tid_dec_b[4]
`define ASI_LD_44	`SPC5.lsu.lmd.lmq4_pkt[60] & (`SPC5.lsu.lmd.lmq4_pkt[49:48] == 2'b0)
`define ASI_44	`SPC5.lsu.lmd.lmq4_pkt[47:40]
`define ASI_ADDR_44	`SPC5.lsu.lmd.lmq4_pkt[39:0]
`define ASI_LD_DATA_44	`SPC5.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_44	tb_top.nas_top.c5.t4.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_5	`SPC5.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_5	`SPC5.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC5.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_44)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_44[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_44  != 4'b0) && ~`ASI_WR_DSFSR_44;
        update_isfsr_w <= (`ISFSR_NEW_IN_44  != 3'b0) && ~`ASI_WR_ISFSR_44;
        desr_wr <=  (`RAS_WRITE_DESR_1st_44  || `RAS_WRITE_DESR_2nd_44);
        update_dfesr_w <= `RAS_WRITE_FESR_44;
        take_err_trap_fx4 <= `ST_ERR_44 | `SW_REC_ERR_44  | `DATA_ACC_ERR_44
                           | `INST_ACC_ERR_44 | `INT_PROC_ERR_44
                           | `HW_CORR_ERR_44 | `INST_ACC_MMU_ERR_44
                           | `DATA_ACC_MMU_ERR_44 ;


        if (`ST_ERR_44) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_44) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_44) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_44) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_44) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_44) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_44) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_44) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_44[63:56], 45'b0, `DESR_44[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_44[63:56], 45'b0, `DESR_44[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_44)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_44[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_44[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_44[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_44[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_44[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_44[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC5.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_44;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_44)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_44)
	begin
	     case (`ASI_44)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_44 >= 0) &  (`ASI_ADDR_44 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_44 >= 0) &  (`ASI_ADDR_44 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_44 >= 0) &  (`ASI_ADDR_44 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_44 >= 0) &  (`ASI_ADDR_44 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_44 >= 0) &  (`ASI_ADDR_44 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_44 >= 0) &  (`ASI_ADDR_44 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_44 >= 0) &  (`ASI_ADDR_44 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_44 >= 0) &  (`ASI_ADDR_44 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_44 >= 0) &  (`ASI_ADDR_44 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_44 >= 0) &  (`ASI_ADDR_44 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC5.lsu.lmd.lmq4_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_44 == 40'h20) ||  (`ASI_ADDR_44 == 40'h30)
			     || (`ASI_ADDR_44 == 40'h80)  
				 || ((`ASI_ADDR_44 == 40'ha0) & (`SPU_MA_BUSY_5 == 0) & (`SPU_MA_TID_5 == 4))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_44 == 40'h20) ||  (`ASI_ADDR_44 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_44, `ASI_ADDR_44, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_44, {24'b0, `ASI_ADDR_44}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c5t5 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 5;
assign mytid = 5;
assign   mytnum = 5*8 + 5;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC5.l2clk) ;
	@(posedge `SPC5.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_45  `SPC5.tlu.ras.dsfsr_5_new_in
`define ISFSR_NEW_IN_45 `SPC5.tlu.ras.isfsr_5_new_in

`define DSFSR_45 `SPC5.tlu.ras.dsfsr_5
`define ISFSR_45 `SPC5.tlu.ras.isfsr_5
`define DSFAR_45 `SPC5.tlu.dfd.dsfar_5

`define ASI_WR_DSFSR_45 `SPC5.tlu.ras.asi_wr_dsfsr[5]
`define ASI_WR_ISFSR_45 `SPC5.tlu.ras.asi_wr_isfsr[5]

`define RAS_WRITE_DESR_1st_45  `SPC5.tlu.dfd.ras_write_desr_1st[5]
`define RAS_WRITE_DESR_2nd_45  `SPC5.tlu.dfd.ras_write_desr_2nd[5]
`define DESR_asi_rd_45  `SPC5.tlu.ras_rd_desr[5]
`define DESR_45  `SPC5.tlu.dfd.desr_5

`define RAS_WRITE_FESR_45  `SPC5.tlu.ras.write_fesr[5]
`define FESR_45  `SPC5.tlu.dfd.fesr_5

`define ST_ERR_45  `SPC5.tlu.trl1.take_ftt & `SPC5.tlu.trl1.trap[1]
`define SW_REC_ERR_45  `SPC5.tlu.trl1.take_ade & `SPC5.tlu.trl1.trap[1]
`define DATA_ACC_ERR_45  `SPC5.tlu.trl1.take_dae & `SPC5.tlu.trl1.trap[1]
`define INST_ACC_ERR_45  `SPC5.tlu.trl1.take_iae & `SPC5.tlu.trl1.trap[1]
`define INT_PROC_ERR_45  `SPC5.tlu.trl1.take_ipe & `SPC5.tlu.trl1.trap[1]
`define HW_CORR_ERR_45  `SPC5.tlu.trl1.take_eer & `SPC5.tlu.trl1.trap[1]
`define INST_ACC_MMU_ERR_45  `SPC5.tlu.trl1.take_ime & `SPC5.tlu.trl1.trap[1]
`define DATA_ACC_MMU_ERR_45  `SPC5.tlu.trl1.take_dme & `SPC5.tlu.trl1.trap[1]

`define LSU_LD_VALID_B	`PROBES5.lsu_ld_valid
`define LSU_TID_DEC_B_45 `PROBES5.lsu_tid_dec_b[5]
`define ASI_LD_45	`SPC5.lsu.lmd.lmq5_pkt[60] & (`SPC5.lsu.lmd.lmq5_pkt[49:48] == 2'b0)
`define ASI_45	`SPC5.lsu.lmd.lmq5_pkt[47:40]
`define ASI_ADDR_45	`SPC5.lsu.lmd.lmq5_pkt[39:0]
`define ASI_LD_DATA_45	`SPC5.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_45	tb_top.nas_top.c5.t5.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_5	`SPC5.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_5	`SPC5.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC5.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_45)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_45[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_45  != 4'b0) && ~`ASI_WR_DSFSR_45;
        update_isfsr_w <= (`ISFSR_NEW_IN_45  != 3'b0) && ~`ASI_WR_ISFSR_45;
        desr_wr <=  (`RAS_WRITE_DESR_1st_45  || `RAS_WRITE_DESR_2nd_45);
        update_dfesr_w <= `RAS_WRITE_FESR_45;
        take_err_trap_fx4 <= `ST_ERR_45 | `SW_REC_ERR_45  | `DATA_ACC_ERR_45
                           | `INST_ACC_ERR_45 | `INT_PROC_ERR_45
                           | `HW_CORR_ERR_45 | `INST_ACC_MMU_ERR_45
                           | `DATA_ACC_MMU_ERR_45 ;


        if (`ST_ERR_45) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_45) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_45) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_45) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_45) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_45) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_45) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_45) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_45[63:56], 45'b0, `DESR_45[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_45[63:56], 45'b0, `DESR_45[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_45)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_45[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_45[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_45[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_45[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_45[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_45[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC5.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_45;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_45)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_45)
	begin
	     case (`ASI_45)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_45 >= 0) &  (`ASI_ADDR_45 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_45 >= 0) &  (`ASI_ADDR_45 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_45 >= 0) &  (`ASI_ADDR_45 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_45 >= 0) &  (`ASI_ADDR_45 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_45 >= 0) &  (`ASI_ADDR_45 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_45 >= 0) &  (`ASI_ADDR_45 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_45 >= 0) &  (`ASI_ADDR_45 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_45 >= 0) &  (`ASI_ADDR_45 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_45 >= 0) &  (`ASI_ADDR_45 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_45 >= 0) &  (`ASI_ADDR_45 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC5.lsu.lmd.lmq5_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_45 == 40'h20) ||  (`ASI_ADDR_45 == 40'h30)
			     || (`ASI_ADDR_45 == 40'h80)  
				 || ((`ASI_ADDR_45 == 40'ha0) & (`SPU_MA_BUSY_5 == 0) & (`SPU_MA_TID_5 == 5))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_45 == 40'h20) ||  (`ASI_ADDR_45 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_45, `ASI_ADDR_45, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_45, {24'b0, `ASI_ADDR_45}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c5t6 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 5;
assign mytid = 6;
assign   mytnum = 5*8 + 6;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC5.l2clk) ;
	@(posedge `SPC5.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_46  `SPC5.tlu.ras.dsfsr_6_new_in
`define ISFSR_NEW_IN_46 `SPC5.tlu.ras.isfsr_6_new_in

`define DSFSR_46 `SPC5.tlu.ras.dsfsr_6
`define ISFSR_46 `SPC5.tlu.ras.isfsr_6
`define DSFAR_46 `SPC5.tlu.dfd.dsfar_6

`define ASI_WR_DSFSR_46 `SPC5.tlu.ras.asi_wr_dsfsr[6]
`define ASI_WR_ISFSR_46 `SPC5.tlu.ras.asi_wr_isfsr[6]

`define RAS_WRITE_DESR_1st_46  `SPC5.tlu.dfd.ras_write_desr_1st[6]
`define RAS_WRITE_DESR_2nd_46  `SPC5.tlu.dfd.ras_write_desr_2nd[6]
`define DESR_asi_rd_46  `SPC5.tlu.ras_rd_desr[6]
`define DESR_46  `SPC5.tlu.dfd.desr_6

`define RAS_WRITE_FESR_46  `SPC5.tlu.ras.write_fesr[6]
`define FESR_46  `SPC5.tlu.dfd.fesr_6

`define ST_ERR_46  `SPC5.tlu.trl1.take_ftt & `SPC5.tlu.trl1.trap[2]
`define SW_REC_ERR_46  `SPC5.tlu.trl1.take_ade & `SPC5.tlu.trl1.trap[2]
`define DATA_ACC_ERR_46  `SPC5.tlu.trl1.take_dae & `SPC5.tlu.trl1.trap[2]
`define INST_ACC_ERR_46  `SPC5.tlu.trl1.take_iae & `SPC5.tlu.trl1.trap[2]
`define INT_PROC_ERR_46  `SPC5.tlu.trl1.take_ipe & `SPC5.tlu.trl1.trap[2]
`define HW_CORR_ERR_46  `SPC5.tlu.trl1.take_eer & `SPC5.tlu.trl1.trap[2]
`define INST_ACC_MMU_ERR_46  `SPC5.tlu.trl1.take_ime & `SPC5.tlu.trl1.trap[2]
`define DATA_ACC_MMU_ERR_46  `SPC5.tlu.trl1.take_dme & `SPC5.tlu.trl1.trap[2]

`define LSU_LD_VALID_B	`PROBES5.lsu_ld_valid
`define LSU_TID_DEC_B_46 `PROBES5.lsu_tid_dec_b[6]
`define ASI_LD_46	`SPC5.lsu.lmd.lmq6_pkt[60] & (`SPC5.lsu.lmd.lmq6_pkt[49:48] == 2'b0)
`define ASI_46	`SPC5.lsu.lmd.lmq6_pkt[47:40]
`define ASI_ADDR_46	`SPC5.lsu.lmd.lmq6_pkt[39:0]
`define ASI_LD_DATA_46	`SPC5.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_46	tb_top.nas_top.c5.t6.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_5	`SPC5.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_5	`SPC5.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC5.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_46)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_46[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_46  != 4'b0) && ~`ASI_WR_DSFSR_46;
        update_isfsr_w <= (`ISFSR_NEW_IN_46  != 3'b0) && ~`ASI_WR_ISFSR_46;
        desr_wr <=  (`RAS_WRITE_DESR_1st_46  || `RAS_WRITE_DESR_2nd_46);
        update_dfesr_w <= `RAS_WRITE_FESR_46;
        take_err_trap_fx4 <= `ST_ERR_46 | `SW_REC_ERR_46  | `DATA_ACC_ERR_46
                           | `INST_ACC_ERR_46 | `INT_PROC_ERR_46
                           | `HW_CORR_ERR_46 | `INST_ACC_MMU_ERR_46
                           | `DATA_ACC_MMU_ERR_46 ;


        if (`ST_ERR_46) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_46) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_46) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_46) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_46) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_46) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_46) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_46) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_46[63:56], 45'b0, `DESR_46[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_46[63:56], 45'b0, `DESR_46[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_46)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_46[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_46[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_46[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_46[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_46[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_46[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC5.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_46;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_46)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_46)
	begin
	     case (`ASI_46)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_46 >= 0) &  (`ASI_ADDR_46 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_46 >= 0) &  (`ASI_ADDR_46 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_46 >= 0) &  (`ASI_ADDR_46 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_46 >= 0) &  (`ASI_ADDR_46 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_46 >= 0) &  (`ASI_ADDR_46 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_46 >= 0) &  (`ASI_ADDR_46 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_46 >= 0) &  (`ASI_ADDR_46 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_46 >= 0) &  (`ASI_ADDR_46 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_46 >= 0) &  (`ASI_ADDR_46 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_46 >= 0) &  (`ASI_ADDR_46 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC5.lsu.lmd.lmq6_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_46 == 40'h20) ||  (`ASI_ADDR_46 == 40'h30)
			     || (`ASI_ADDR_46 == 40'h80)  
				 || ((`ASI_ADDR_46 == 40'ha0) & (`SPU_MA_BUSY_5 == 0) & (`SPU_MA_TID_5 == 6))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_46 == 40'h20) ||  (`ASI_ADDR_46 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_46, `ASI_ADDR_46, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_46, {24'b0, `ASI_ADDR_46}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c5t7 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 5;
assign mytid = 7;
assign   mytnum = 5*8 + 7;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC5.l2clk) ;
	@(posedge `SPC5.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_47  `SPC5.tlu.ras.dsfsr_7_new_in
`define ISFSR_NEW_IN_47 `SPC5.tlu.ras.isfsr_7_new_in

`define DSFSR_47 `SPC5.tlu.ras.dsfsr_7
`define ISFSR_47 `SPC5.tlu.ras.isfsr_7
`define DSFAR_47 `SPC5.tlu.dfd.dsfar_7

`define ASI_WR_DSFSR_47 `SPC5.tlu.ras.asi_wr_dsfsr[7]
`define ASI_WR_ISFSR_47 `SPC5.tlu.ras.asi_wr_isfsr[7]

`define RAS_WRITE_DESR_1st_47  `SPC5.tlu.dfd.ras_write_desr_1st[7]
`define RAS_WRITE_DESR_2nd_47  `SPC5.tlu.dfd.ras_write_desr_2nd[7]
`define DESR_asi_rd_47  `SPC5.tlu.ras_rd_desr[7]
`define DESR_47  `SPC5.tlu.dfd.desr_7

`define RAS_WRITE_FESR_47  `SPC5.tlu.ras.write_fesr[7]
`define FESR_47  `SPC5.tlu.dfd.fesr_7

`define ST_ERR_47  `SPC5.tlu.trl1.take_ftt & `SPC5.tlu.trl1.trap[3]
`define SW_REC_ERR_47  `SPC5.tlu.trl1.take_ade & `SPC5.tlu.trl1.trap[3]
`define DATA_ACC_ERR_47  `SPC5.tlu.trl1.take_dae & `SPC5.tlu.trl1.trap[3]
`define INST_ACC_ERR_47  `SPC5.tlu.trl1.take_iae & `SPC5.tlu.trl1.trap[3]
`define INT_PROC_ERR_47  `SPC5.tlu.trl1.take_ipe & `SPC5.tlu.trl1.trap[3]
`define HW_CORR_ERR_47  `SPC5.tlu.trl1.take_eer & `SPC5.tlu.trl1.trap[3]
`define INST_ACC_MMU_ERR_47  `SPC5.tlu.trl1.take_ime & `SPC5.tlu.trl1.trap[3]
`define DATA_ACC_MMU_ERR_47  `SPC5.tlu.trl1.take_dme & `SPC5.tlu.trl1.trap[3]

`define LSU_LD_VALID_B	`PROBES5.lsu_ld_valid
`define LSU_TID_DEC_B_47 `PROBES5.lsu_tid_dec_b[7]
`define ASI_LD_47	`SPC5.lsu.lmd.lmq7_pkt[60] & (`SPC5.lsu.lmd.lmq7_pkt[49:48] == 2'b0)
`define ASI_47	`SPC5.lsu.lmd.lmq7_pkt[47:40]
`define ASI_ADDR_47	`SPC5.lsu.lmd.lmq7_pkt[39:0]
`define ASI_LD_DATA_47	`SPC5.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_47	tb_top.nas_top.c5.t7.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_5	`SPC5.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_5	`SPC5.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC5.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_47)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_47[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_47  != 4'b0) && ~`ASI_WR_DSFSR_47;
        update_isfsr_w <= (`ISFSR_NEW_IN_47  != 3'b0) && ~`ASI_WR_ISFSR_47;
        desr_wr <=  (`RAS_WRITE_DESR_1st_47  || `RAS_WRITE_DESR_2nd_47);
        update_dfesr_w <= `RAS_WRITE_FESR_47;
        take_err_trap_fx4 <= `ST_ERR_47 | `SW_REC_ERR_47  | `DATA_ACC_ERR_47
                           | `INST_ACC_ERR_47 | `INT_PROC_ERR_47
                           | `HW_CORR_ERR_47 | `INST_ACC_MMU_ERR_47
                           | `DATA_ACC_MMU_ERR_47 ;


        if (`ST_ERR_47) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_47) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_47) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_47) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_47) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_47) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_47) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_47) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_47[63:56], 45'b0, `DESR_47[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_47[63:56], 45'b0, `DESR_47[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_47)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_47[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_47[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_47[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_47[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_47[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_47[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC5.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_47;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_47)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_47)
	begin
	     case (`ASI_47)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_47 >= 0) &  (`ASI_ADDR_47 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_47 >= 0) &  (`ASI_ADDR_47 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_47 >= 0) &  (`ASI_ADDR_47 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_47 >= 0) &  (`ASI_ADDR_47 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_47 >= 0) &  (`ASI_ADDR_47 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_47 >= 0) &  (`ASI_ADDR_47 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_47 >= 0) &  (`ASI_ADDR_47 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_47 >= 0) &  (`ASI_ADDR_47 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_47 >= 0) &  (`ASI_ADDR_47 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_47 >= 0) &  (`ASI_ADDR_47 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC5.lsu.lmd.lmq7_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_47 == 40'h20) ||  (`ASI_ADDR_47 == 40'h30)
			     || (`ASI_ADDR_47 == 40'h80)  
				 || ((`ASI_ADDR_47 == 40'ha0) & (`SPU_MA_BUSY_5 == 0) & (`SPU_MA_TID_5 == 7))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_47 == 40'h20) ||  (`ASI_ADDR_47 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_47, `ASI_ADDR_47, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_47, {24'b0, `ASI_ADDR_47}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule

`endif

`ifdef CORE_6



module err_c6t0 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 6;
assign mytid = 0;
assign   mytnum = 6*8 + 0;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC6.l2clk) ;
	@(posedge `SPC6.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_48  `SPC6.tlu.ras.dsfsr_0_new_in
`define ISFSR_NEW_IN_48 `SPC6.tlu.ras.isfsr_0_new_in

`define DSFSR_48 `SPC6.tlu.ras.dsfsr_0
`define ISFSR_48 `SPC6.tlu.ras.isfsr_0
`define DSFAR_48 `SPC6.tlu.dfd.dsfar_0

`define ASI_WR_DSFSR_48 `SPC6.tlu.ras.asi_wr_dsfsr[0]
`define ASI_WR_ISFSR_48 `SPC6.tlu.ras.asi_wr_isfsr[0]

`define RAS_WRITE_DESR_1st_48  `SPC6.tlu.dfd.ras_write_desr_1st[0]
`define RAS_WRITE_DESR_2nd_48  `SPC6.tlu.dfd.ras_write_desr_2nd[0]
`define DESR_asi_rd_48  `SPC6.tlu.ras_rd_desr[0]
`define DESR_48  `SPC6.tlu.dfd.desr_0

`define RAS_WRITE_FESR_48  `SPC6.tlu.ras.write_fesr[0]
`define FESR_48  `SPC6.tlu.dfd.fesr_0

`define ST_ERR_48  `SPC6.tlu.trl0.take_ftt & `SPC6.tlu.trl0.trap[0]
`define SW_REC_ERR_48  `SPC6.tlu.trl0.take_ade & `SPC6.tlu.trl0.trap[0]
`define DATA_ACC_ERR_48  `SPC6.tlu.trl0.take_dae & `SPC6.tlu.trl0.trap[0]
`define INST_ACC_ERR_48  `SPC6.tlu.trl0.take_iae & `SPC6.tlu.trl0.trap[0]
`define INT_PROC_ERR_48  `SPC6.tlu.trl0.take_ipe & `SPC6.tlu.trl0.trap[0]
`define HW_CORR_ERR_48  `SPC6.tlu.trl0.take_eer & `SPC6.tlu.trl0.trap[0]
`define INST_ACC_MMU_ERR_48  `SPC6.tlu.trl0.take_ime & `SPC6.tlu.trl0.trap[0]
`define DATA_ACC_MMU_ERR_48  `SPC6.tlu.trl0.take_dme & `SPC6.tlu.trl0.trap[0]

`define LSU_LD_VALID_B	`PROBES6.lsu_ld_valid
`define LSU_TID_DEC_B_48 `PROBES6.lsu_tid_dec_b[0]
`define ASI_LD_48	`SPC6.lsu.lmd.lmq0_pkt[60] & (`SPC6.lsu.lmd.lmq0_pkt[49:48] == 2'b0)
`define ASI_48	`SPC6.lsu.lmd.lmq0_pkt[47:40]
`define ASI_ADDR_48	`SPC6.lsu.lmd.lmq0_pkt[39:0]
`define ASI_LD_DATA_48	`SPC6.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_48	tb_top.nas_top.c6.t0.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_6	`SPC6.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_6	`SPC6.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC6.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_48)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_48[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_48  != 4'b0) && ~`ASI_WR_DSFSR_48;
        update_isfsr_w <= (`ISFSR_NEW_IN_48  != 3'b0) && ~`ASI_WR_ISFSR_48;
        desr_wr <=  (`RAS_WRITE_DESR_1st_48  || `RAS_WRITE_DESR_2nd_48);
        update_dfesr_w <= `RAS_WRITE_FESR_48;
        take_err_trap_fx4 <= `ST_ERR_48 | `SW_REC_ERR_48  | `DATA_ACC_ERR_48
                           | `INST_ACC_ERR_48 | `INT_PROC_ERR_48
                           | `HW_CORR_ERR_48 | `INST_ACC_MMU_ERR_48
                           | `DATA_ACC_MMU_ERR_48 ;


        if (`ST_ERR_48) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_48) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_48) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_48) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_48) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_48) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_48) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_48) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_48[63:56], 45'b0, `DESR_48[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_48[63:56], 45'b0, `DESR_48[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_48)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_48[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_48[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_48[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_48[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_48[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_48[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC6.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_48;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_48)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_48)
	begin
	     case (`ASI_48)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_48 >= 0) &  (`ASI_ADDR_48 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_48 >= 0) &  (`ASI_ADDR_48 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_48 >= 0) &  (`ASI_ADDR_48 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_48 >= 0) &  (`ASI_ADDR_48 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_48 >= 0) &  (`ASI_ADDR_48 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_48 >= 0) &  (`ASI_ADDR_48 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_48 >= 0) &  (`ASI_ADDR_48 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_48 >= 0) &  (`ASI_ADDR_48 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_48 >= 0) &  (`ASI_ADDR_48 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_48 >= 0) &  (`ASI_ADDR_48 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC6.lsu.lmd.lmq0_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_48 == 40'h20) ||  (`ASI_ADDR_48 == 40'h30)
			     || (`ASI_ADDR_48 == 40'h80)  
				 || ((`ASI_ADDR_48 == 40'ha0) & (`SPU_MA_BUSY_6 == 0) & (`SPU_MA_TID_6 == 0))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_48 == 40'h20) ||  (`ASI_ADDR_48 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_48, `ASI_ADDR_48, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_48, {24'b0, `ASI_ADDR_48}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c6t1 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 6;
assign mytid = 1;
assign   mytnum = 6*8 + 1;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC6.l2clk) ;
	@(posedge `SPC6.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_49  `SPC6.tlu.ras.dsfsr_1_new_in
`define ISFSR_NEW_IN_49 `SPC6.tlu.ras.isfsr_1_new_in

`define DSFSR_49 `SPC6.tlu.ras.dsfsr_1
`define ISFSR_49 `SPC6.tlu.ras.isfsr_1
`define DSFAR_49 `SPC6.tlu.dfd.dsfar_1

`define ASI_WR_DSFSR_49 `SPC6.tlu.ras.asi_wr_dsfsr[1]
`define ASI_WR_ISFSR_49 `SPC6.tlu.ras.asi_wr_isfsr[1]

`define RAS_WRITE_DESR_1st_49  `SPC6.tlu.dfd.ras_write_desr_1st[1]
`define RAS_WRITE_DESR_2nd_49  `SPC6.tlu.dfd.ras_write_desr_2nd[1]
`define DESR_asi_rd_49  `SPC6.tlu.ras_rd_desr[1]
`define DESR_49  `SPC6.tlu.dfd.desr_1

`define RAS_WRITE_FESR_49  `SPC6.tlu.ras.write_fesr[1]
`define FESR_49  `SPC6.tlu.dfd.fesr_1

`define ST_ERR_49  `SPC6.tlu.trl0.take_ftt & `SPC6.tlu.trl0.trap[1]
`define SW_REC_ERR_49  `SPC6.tlu.trl0.take_ade & `SPC6.tlu.trl0.trap[1]
`define DATA_ACC_ERR_49  `SPC6.tlu.trl0.take_dae & `SPC6.tlu.trl0.trap[1]
`define INST_ACC_ERR_49  `SPC6.tlu.trl0.take_iae & `SPC6.tlu.trl0.trap[1]
`define INT_PROC_ERR_49  `SPC6.tlu.trl0.take_ipe & `SPC6.tlu.trl0.trap[1]
`define HW_CORR_ERR_49  `SPC6.tlu.trl0.take_eer & `SPC6.tlu.trl0.trap[1]
`define INST_ACC_MMU_ERR_49  `SPC6.tlu.trl0.take_ime & `SPC6.tlu.trl0.trap[1]
`define DATA_ACC_MMU_ERR_49  `SPC6.tlu.trl0.take_dme & `SPC6.tlu.trl0.trap[1]

`define LSU_LD_VALID_B	`PROBES6.lsu_ld_valid
`define LSU_TID_DEC_B_49 `PROBES6.lsu_tid_dec_b[1]
`define ASI_LD_49	`SPC6.lsu.lmd.lmq1_pkt[60] & (`SPC6.lsu.lmd.lmq1_pkt[49:48] == 2'b0)
`define ASI_49	`SPC6.lsu.lmd.lmq1_pkt[47:40]
`define ASI_ADDR_49	`SPC6.lsu.lmd.lmq1_pkt[39:0]
`define ASI_LD_DATA_49	`SPC6.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_49	tb_top.nas_top.c6.t1.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_6	`SPC6.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_6	`SPC6.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC6.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_49)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_49[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_49  != 4'b0) && ~`ASI_WR_DSFSR_49;
        update_isfsr_w <= (`ISFSR_NEW_IN_49  != 3'b0) && ~`ASI_WR_ISFSR_49;
        desr_wr <=  (`RAS_WRITE_DESR_1st_49  || `RAS_WRITE_DESR_2nd_49);
        update_dfesr_w <= `RAS_WRITE_FESR_49;
        take_err_trap_fx4 <= `ST_ERR_49 | `SW_REC_ERR_49  | `DATA_ACC_ERR_49
                           | `INST_ACC_ERR_49 | `INT_PROC_ERR_49
                           | `HW_CORR_ERR_49 | `INST_ACC_MMU_ERR_49
                           | `DATA_ACC_MMU_ERR_49 ;


        if (`ST_ERR_49) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_49) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_49) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_49) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_49) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_49) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_49) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_49) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_49[63:56], 45'b0, `DESR_49[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_49[63:56], 45'b0, `DESR_49[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_49)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_49[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_49[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_49[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_49[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_49[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_49[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC6.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_49;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_49)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_49)
	begin
	     case (`ASI_49)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_49 >= 0) &  (`ASI_ADDR_49 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_49 >= 0) &  (`ASI_ADDR_49 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_49 >= 0) &  (`ASI_ADDR_49 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_49 >= 0) &  (`ASI_ADDR_49 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_49 >= 0) &  (`ASI_ADDR_49 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_49 >= 0) &  (`ASI_ADDR_49 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_49 >= 0) &  (`ASI_ADDR_49 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_49 >= 0) &  (`ASI_ADDR_49 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_49 >= 0) &  (`ASI_ADDR_49 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_49 >= 0) &  (`ASI_ADDR_49 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC6.lsu.lmd.lmq1_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_49 == 40'h20) ||  (`ASI_ADDR_49 == 40'h30)
			     || (`ASI_ADDR_49 == 40'h80)  
				 || ((`ASI_ADDR_49 == 40'ha0) & (`SPU_MA_BUSY_6 == 0) & (`SPU_MA_TID_6 == 1))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_49 == 40'h20) ||  (`ASI_ADDR_49 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_49, `ASI_ADDR_49, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_49, {24'b0, `ASI_ADDR_49}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c6t2 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 6;
assign mytid = 2;
assign   mytnum = 6*8 + 2;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC6.l2clk) ;
	@(posedge `SPC6.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_50  `SPC6.tlu.ras.dsfsr_2_new_in
`define ISFSR_NEW_IN_50 `SPC6.tlu.ras.isfsr_2_new_in

`define DSFSR_50 `SPC6.tlu.ras.dsfsr_2
`define ISFSR_50 `SPC6.tlu.ras.isfsr_2
`define DSFAR_50 `SPC6.tlu.dfd.dsfar_2

`define ASI_WR_DSFSR_50 `SPC6.tlu.ras.asi_wr_dsfsr[2]
`define ASI_WR_ISFSR_50 `SPC6.tlu.ras.asi_wr_isfsr[2]

`define RAS_WRITE_DESR_1st_50  `SPC6.tlu.dfd.ras_write_desr_1st[2]
`define RAS_WRITE_DESR_2nd_50  `SPC6.tlu.dfd.ras_write_desr_2nd[2]
`define DESR_asi_rd_50  `SPC6.tlu.ras_rd_desr[2]
`define DESR_50  `SPC6.tlu.dfd.desr_2

`define RAS_WRITE_FESR_50  `SPC6.tlu.ras.write_fesr[2]
`define FESR_50  `SPC6.tlu.dfd.fesr_2

`define ST_ERR_50  `SPC6.tlu.trl0.take_ftt & `SPC6.tlu.trl0.trap[2]
`define SW_REC_ERR_50  `SPC6.tlu.trl0.take_ade & `SPC6.tlu.trl0.trap[2]
`define DATA_ACC_ERR_50  `SPC6.tlu.trl0.take_dae & `SPC6.tlu.trl0.trap[2]
`define INST_ACC_ERR_50  `SPC6.tlu.trl0.take_iae & `SPC6.tlu.trl0.trap[2]
`define INT_PROC_ERR_50  `SPC6.tlu.trl0.take_ipe & `SPC6.tlu.trl0.trap[2]
`define HW_CORR_ERR_50  `SPC6.tlu.trl0.take_eer & `SPC6.tlu.trl0.trap[2]
`define INST_ACC_MMU_ERR_50  `SPC6.tlu.trl0.take_ime & `SPC6.tlu.trl0.trap[2]
`define DATA_ACC_MMU_ERR_50  `SPC6.tlu.trl0.take_dme & `SPC6.tlu.trl0.trap[2]

`define LSU_LD_VALID_B	`PROBES6.lsu_ld_valid
`define LSU_TID_DEC_B_50 `PROBES6.lsu_tid_dec_b[2]
`define ASI_LD_50	`SPC6.lsu.lmd.lmq2_pkt[60] & (`SPC6.lsu.lmd.lmq2_pkt[49:48] == 2'b0)
`define ASI_50	`SPC6.lsu.lmd.lmq2_pkt[47:40]
`define ASI_ADDR_50	`SPC6.lsu.lmd.lmq2_pkt[39:0]
`define ASI_LD_DATA_50	`SPC6.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_50	tb_top.nas_top.c6.t2.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_6	`SPC6.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_6	`SPC6.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC6.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_50)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_50[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_50  != 4'b0) && ~`ASI_WR_DSFSR_50;
        update_isfsr_w <= (`ISFSR_NEW_IN_50  != 3'b0) && ~`ASI_WR_ISFSR_50;
        desr_wr <=  (`RAS_WRITE_DESR_1st_50  || `RAS_WRITE_DESR_2nd_50);
        update_dfesr_w <= `RAS_WRITE_FESR_50;
        take_err_trap_fx4 <= `ST_ERR_50 | `SW_REC_ERR_50  | `DATA_ACC_ERR_50
                           | `INST_ACC_ERR_50 | `INT_PROC_ERR_50
                           | `HW_CORR_ERR_50 | `INST_ACC_MMU_ERR_50
                           | `DATA_ACC_MMU_ERR_50 ;


        if (`ST_ERR_50) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_50) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_50) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_50) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_50) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_50) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_50) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_50) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_50[63:56], 45'b0, `DESR_50[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_50[63:56], 45'b0, `DESR_50[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_50)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_50[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_50[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_50[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_50[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_50[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_50[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC6.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_50;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_50)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_50)
	begin
	     case (`ASI_50)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_50 >= 0) &  (`ASI_ADDR_50 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_50 >= 0) &  (`ASI_ADDR_50 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_50 >= 0) &  (`ASI_ADDR_50 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_50 >= 0) &  (`ASI_ADDR_50 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_50 >= 0) &  (`ASI_ADDR_50 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_50 >= 0) &  (`ASI_ADDR_50 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_50 >= 0) &  (`ASI_ADDR_50 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_50 >= 0) &  (`ASI_ADDR_50 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_50 >= 0) &  (`ASI_ADDR_50 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_50 >= 0) &  (`ASI_ADDR_50 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC6.lsu.lmd.lmq2_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_50 == 40'h20) ||  (`ASI_ADDR_50 == 40'h30)
			     || (`ASI_ADDR_50 == 40'h80)  
				 || ((`ASI_ADDR_50 == 40'ha0) & (`SPU_MA_BUSY_6 == 0) & (`SPU_MA_TID_6 == 2))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_50 == 40'h20) ||  (`ASI_ADDR_50 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_50, `ASI_ADDR_50, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_50, {24'b0, `ASI_ADDR_50}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c6t3 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 6;
assign mytid = 3;
assign   mytnum = 6*8 + 3;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC6.l2clk) ;
	@(posedge `SPC6.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_51  `SPC6.tlu.ras.dsfsr_3_new_in
`define ISFSR_NEW_IN_51 `SPC6.tlu.ras.isfsr_3_new_in

`define DSFSR_51 `SPC6.tlu.ras.dsfsr_3
`define ISFSR_51 `SPC6.tlu.ras.isfsr_3
`define DSFAR_51 `SPC6.tlu.dfd.dsfar_3

`define ASI_WR_DSFSR_51 `SPC6.tlu.ras.asi_wr_dsfsr[3]
`define ASI_WR_ISFSR_51 `SPC6.tlu.ras.asi_wr_isfsr[3]

`define RAS_WRITE_DESR_1st_51  `SPC6.tlu.dfd.ras_write_desr_1st[3]
`define RAS_WRITE_DESR_2nd_51  `SPC6.tlu.dfd.ras_write_desr_2nd[3]
`define DESR_asi_rd_51  `SPC6.tlu.ras_rd_desr[3]
`define DESR_51  `SPC6.tlu.dfd.desr_3

`define RAS_WRITE_FESR_51  `SPC6.tlu.ras.write_fesr[3]
`define FESR_51  `SPC6.tlu.dfd.fesr_3

`define ST_ERR_51  `SPC6.tlu.trl0.take_ftt & `SPC6.tlu.trl0.trap[3]
`define SW_REC_ERR_51  `SPC6.tlu.trl0.take_ade & `SPC6.tlu.trl0.trap[3]
`define DATA_ACC_ERR_51  `SPC6.tlu.trl0.take_dae & `SPC6.tlu.trl0.trap[3]
`define INST_ACC_ERR_51  `SPC6.tlu.trl0.take_iae & `SPC6.tlu.trl0.trap[3]
`define INT_PROC_ERR_51  `SPC6.tlu.trl0.take_ipe & `SPC6.tlu.trl0.trap[3]
`define HW_CORR_ERR_51  `SPC6.tlu.trl0.take_eer & `SPC6.tlu.trl0.trap[3]
`define INST_ACC_MMU_ERR_51  `SPC6.tlu.trl0.take_ime & `SPC6.tlu.trl0.trap[3]
`define DATA_ACC_MMU_ERR_51  `SPC6.tlu.trl0.take_dme & `SPC6.tlu.trl0.trap[3]

`define LSU_LD_VALID_B	`PROBES6.lsu_ld_valid
`define LSU_TID_DEC_B_51 `PROBES6.lsu_tid_dec_b[3]
`define ASI_LD_51	`SPC6.lsu.lmd.lmq3_pkt[60] & (`SPC6.lsu.lmd.lmq3_pkt[49:48] == 2'b0)
`define ASI_51	`SPC6.lsu.lmd.lmq3_pkt[47:40]
`define ASI_ADDR_51	`SPC6.lsu.lmd.lmq3_pkt[39:0]
`define ASI_LD_DATA_51	`SPC6.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_51	tb_top.nas_top.c6.t3.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_6	`SPC6.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_6	`SPC6.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC6.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_51)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_51[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_51  != 4'b0) && ~`ASI_WR_DSFSR_51;
        update_isfsr_w <= (`ISFSR_NEW_IN_51  != 3'b0) && ~`ASI_WR_ISFSR_51;
        desr_wr <=  (`RAS_WRITE_DESR_1st_51  || `RAS_WRITE_DESR_2nd_51);
        update_dfesr_w <= `RAS_WRITE_FESR_51;
        take_err_trap_fx4 <= `ST_ERR_51 | `SW_REC_ERR_51  | `DATA_ACC_ERR_51
                           | `INST_ACC_ERR_51 | `INT_PROC_ERR_51
                           | `HW_CORR_ERR_51 | `INST_ACC_MMU_ERR_51
                           | `DATA_ACC_MMU_ERR_51 ;


        if (`ST_ERR_51) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_51) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_51) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_51) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_51) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_51) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_51) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_51) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_51[63:56], 45'b0, `DESR_51[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_51[63:56], 45'b0, `DESR_51[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_51)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_51[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_51[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_51[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_51[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_51[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_51[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC6.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_51;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_51)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_51)
	begin
	     case (`ASI_51)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_51 >= 0) &  (`ASI_ADDR_51 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_51 >= 0) &  (`ASI_ADDR_51 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_51 >= 0) &  (`ASI_ADDR_51 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_51 >= 0) &  (`ASI_ADDR_51 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_51 >= 0) &  (`ASI_ADDR_51 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_51 >= 0) &  (`ASI_ADDR_51 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_51 >= 0) &  (`ASI_ADDR_51 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_51 >= 0) &  (`ASI_ADDR_51 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_51 >= 0) &  (`ASI_ADDR_51 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_51 >= 0) &  (`ASI_ADDR_51 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC6.lsu.lmd.lmq3_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_51 == 40'h20) ||  (`ASI_ADDR_51 == 40'h30)
			     || (`ASI_ADDR_51 == 40'h80)  
				 || ((`ASI_ADDR_51 == 40'ha0) & (`SPU_MA_BUSY_6 == 0) & (`SPU_MA_TID_6 == 3))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_51 == 40'h20) ||  (`ASI_ADDR_51 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_51, `ASI_ADDR_51, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_51, {24'b0, `ASI_ADDR_51}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c6t4 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 6;
assign mytid = 4;
assign   mytnum = 6*8 + 4;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC6.l2clk) ;
	@(posedge `SPC6.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_52  `SPC6.tlu.ras.dsfsr_4_new_in
`define ISFSR_NEW_IN_52 `SPC6.tlu.ras.isfsr_4_new_in

`define DSFSR_52 `SPC6.tlu.ras.dsfsr_4
`define ISFSR_52 `SPC6.tlu.ras.isfsr_4
`define DSFAR_52 `SPC6.tlu.dfd.dsfar_4

`define ASI_WR_DSFSR_52 `SPC6.tlu.ras.asi_wr_dsfsr[4]
`define ASI_WR_ISFSR_52 `SPC6.tlu.ras.asi_wr_isfsr[4]

`define RAS_WRITE_DESR_1st_52  `SPC6.tlu.dfd.ras_write_desr_1st[4]
`define RAS_WRITE_DESR_2nd_52  `SPC6.tlu.dfd.ras_write_desr_2nd[4]
`define DESR_asi_rd_52  `SPC6.tlu.ras_rd_desr[4]
`define DESR_52  `SPC6.tlu.dfd.desr_4

`define RAS_WRITE_FESR_52  `SPC6.tlu.ras.write_fesr[4]
`define FESR_52  `SPC6.tlu.dfd.fesr_4

`define ST_ERR_52  `SPC6.tlu.trl1.take_ftt & `SPC6.tlu.trl1.trap[0]
`define SW_REC_ERR_52  `SPC6.tlu.trl1.take_ade & `SPC6.tlu.trl1.trap[0]
`define DATA_ACC_ERR_52  `SPC6.tlu.trl1.take_dae & `SPC6.tlu.trl1.trap[0]
`define INST_ACC_ERR_52  `SPC6.tlu.trl1.take_iae & `SPC6.tlu.trl1.trap[0]
`define INT_PROC_ERR_52  `SPC6.tlu.trl1.take_ipe & `SPC6.tlu.trl1.trap[0]
`define HW_CORR_ERR_52  `SPC6.tlu.trl1.take_eer & `SPC6.tlu.trl1.trap[0]
`define INST_ACC_MMU_ERR_52  `SPC6.tlu.trl1.take_ime & `SPC6.tlu.trl1.trap[0]
`define DATA_ACC_MMU_ERR_52  `SPC6.tlu.trl1.take_dme & `SPC6.tlu.trl1.trap[0]

`define LSU_LD_VALID_B	`PROBES6.lsu_ld_valid
`define LSU_TID_DEC_B_52 `PROBES6.lsu_tid_dec_b[4]
`define ASI_LD_52	`SPC6.lsu.lmd.lmq4_pkt[60] & (`SPC6.lsu.lmd.lmq4_pkt[49:48] == 2'b0)
`define ASI_52	`SPC6.lsu.lmd.lmq4_pkt[47:40]
`define ASI_ADDR_52	`SPC6.lsu.lmd.lmq4_pkt[39:0]
`define ASI_LD_DATA_52	`SPC6.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_52	tb_top.nas_top.c6.t4.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_6	`SPC6.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_6	`SPC6.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC6.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_52)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_52[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_52  != 4'b0) && ~`ASI_WR_DSFSR_52;
        update_isfsr_w <= (`ISFSR_NEW_IN_52  != 3'b0) && ~`ASI_WR_ISFSR_52;
        desr_wr <=  (`RAS_WRITE_DESR_1st_52  || `RAS_WRITE_DESR_2nd_52);
        update_dfesr_w <= `RAS_WRITE_FESR_52;
        take_err_trap_fx4 <= `ST_ERR_52 | `SW_REC_ERR_52  | `DATA_ACC_ERR_52
                           | `INST_ACC_ERR_52 | `INT_PROC_ERR_52
                           | `HW_CORR_ERR_52 | `INST_ACC_MMU_ERR_52
                           | `DATA_ACC_MMU_ERR_52 ;


        if (`ST_ERR_52) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_52) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_52) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_52) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_52) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_52) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_52) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_52) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_52[63:56], 45'b0, `DESR_52[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_52[63:56], 45'b0, `DESR_52[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_52)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_52[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_52[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_52[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_52[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_52[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_52[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC6.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_52;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_52)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_52)
	begin
	     case (`ASI_52)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_52 >= 0) &  (`ASI_ADDR_52 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_52 >= 0) &  (`ASI_ADDR_52 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_52 >= 0) &  (`ASI_ADDR_52 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_52 >= 0) &  (`ASI_ADDR_52 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_52 >= 0) &  (`ASI_ADDR_52 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_52 >= 0) &  (`ASI_ADDR_52 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_52 >= 0) &  (`ASI_ADDR_52 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_52 >= 0) &  (`ASI_ADDR_52 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_52 >= 0) &  (`ASI_ADDR_52 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_52 >= 0) &  (`ASI_ADDR_52 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC6.lsu.lmd.lmq4_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_52 == 40'h20) ||  (`ASI_ADDR_52 == 40'h30)
			     || (`ASI_ADDR_52 == 40'h80)  
				 || ((`ASI_ADDR_52 == 40'ha0) & (`SPU_MA_BUSY_6 == 0) & (`SPU_MA_TID_6 == 4))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_52 == 40'h20) ||  (`ASI_ADDR_52 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_52, `ASI_ADDR_52, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_52, {24'b0, `ASI_ADDR_52}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c6t5 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 6;
assign mytid = 5;
assign   mytnum = 6*8 + 5;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC6.l2clk) ;
	@(posedge `SPC6.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_53  `SPC6.tlu.ras.dsfsr_5_new_in
`define ISFSR_NEW_IN_53 `SPC6.tlu.ras.isfsr_5_new_in

`define DSFSR_53 `SPC6.tlu.ras.dsfsr_5
`define ISFSR_53 `SPC6.tlu.ras.isfsr_5
`define DSFAR_53 `SPC6.tlu.dfd.dsfar_5

`define ASI_WR_DSFSR_53 `SPC6.tlu.ras.asi_wr_dsfsr[5]
`define ASI_WR_ISFSR_53 `SPC6.tlu.ras.asi_wr_isfsr[5]

`define RAS_WRITE_DESR_1st_53  `SPC6.tlu.dfd.ras_write_desr_1st[5]
`define RAS_WRITE_DESR_2nd_53  `SPC6.tlu.dfd.ras_write_desr_2nd[5]
`define DESR_asi_rd_53  `SPC6.tlu.ras_rd_desr[5]
`define DESR_53  `SPC6.tlu.dfd.desr_5

`define RAS_WRITE_FESR_53  `SPC6.tlu.ras.write_fesr[5]
`define FESR_53  `SPC6.tlu.dfd.fesr_5

`define ST_ERR_53  `SPC6.tlu.trl1.take_ftt & `SPC6.tlu.trl1.trap[1]
`define SW_REC_ERR_53  `SPC6.tlu.trl1.take_ade & `SPC6.tlu.trl1.trap[1]
`define DATA_ACC_ERR_53  `SPC6.tlu.trl1.take_dae & `SPC6.tlu.trl1.trap[1]
`define INST_ACC_ERR_53  `SPC6.tlu.trl1.take_iae & `SPC6.tlu.trl1.trap[1]
`define INT_PROC_ERR_53  `SPC6.tlu.trl1.take_ipe & `SPC6.tlu.trl1.trap[1]
`define HW_CORR_ERR_53  `SPC6.tlu.trl1.take_eer & `SPC6.tlu.trl1.trap[1]
`define INST_ACC_MMU_ERR_53  `SPC6.tlu.trl1.take_ime & `SPC6.tlu.trl1.trap[1]
`define DATA_ACC_MMU_ERR_53  `SPC6.tlu.trl1.take_dme & `SPC6.tlu.trl1.trap[1]

`define LSU_LD_VALID_B	`PROBES6.lsu_ld_valid
`define LSU_TID_DEC_B_53 `PROBES6.lsu_tid_dec_b[5]
`define ASI_LD_53	`SPC6.lsu.lmd.lmq5_pkt[60] & (`SPC6.lsu.lmd.lmq5_pkt[49:48] == 2'b0)
`define ASI_53	`SPC6.lsu.lmd.lmq5_pkt[47:40]
`define ASI_ADDR_53	`SPC6.lsu.lmd.lmq5_pkt[39:0]
`define ASI_LD_DATA_53	`SPC6.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_53	tb_top.nas_top.c6.t5.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_6	`SPC6.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_6	`SPC6.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC6.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_53)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_53[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_53  != 4'b0) && ~`ASI_WR_DSFSR_53;
        update_isfsr_w <= (`ISFSR_NEW_IN_53  != 3'b0) && ~`ASI_WR_ISFSR_53;
        desr_wr <=  (`RAS_WRITE_DESR_1st_53  || `RAS_WRITE_DESR_2nd_53);
        update_dfesr_w <= `RAS_WRITE_FESR_53;
        take_err_trap_fx4 <= `ST_ERR_53 | `SW_REC_ERR_53  | `DATA_ACC_ERR_53
                           | `INST_ACC_ERR_53 | `INT_PROC_ERR_53
                           | `HW_CORR_ERR_53 | `INST_ACC_MMU_ERR_53
                           | `DATA_ACC_MMU_ERR_53 ;


        if (`ST_ERR_53) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_53) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_53) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_53) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_53) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_53) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_53) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_53) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_53[63:56], 45'b0, `DESR_53[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_53[63:56], 45'b0, `DESR_53[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_53)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_53[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_53[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_53[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_53[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_53[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_53[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC6.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_53;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_53)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_53)
	begin
	     case (`ASI_53)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_53 >= 0) &  (`ASI_ADDR_53 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_53 >= 0) &  (`ASI_ADDR_53 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_53 >= 0) &  (`ASI_ADDR_53 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_53 >= 0) &  (`ASI_ADDR_53 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_53 >= 0) &  (`ASI_ADDR_53 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_53 >= 0) &  (`ASI_ADDR_53 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_53 >= 0) &  (`ASI_ADDR_53 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_53 >= 0) &  (`ASI_ADDR_53 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_53 >= 0) &  (`ASI_ADDR_53 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_53 >= 0) &  (`ASI_ADDR_53 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC6.lsu.lmd.lmq5_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_53 == 40'h20) ||  (`ASI_ADDR_53 == 40'h30)
			     || (`ASI_ADDR_53 == 40'h80)  
				 || ((`ASI_ADDR_53 == 40'ha0) & (`SPU_MA_BUSY_6 == 0) & (`SPU_MA_TID_6 == 5))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_53 == 40'h20) ||  (`ASI_ADDR_53 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_53, `ASI_ADDR_53, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_53, {24'b0, `ASI_ADDR_53}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c6t6 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 6;
assign mytid = 6;
assign   mytnum = 6*8 + 6;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC6.l2clk) ;
	@(posedge `SPC6.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_54  `SPC6.tlu.ras.dsfsr_6_new_in
`define ISFSR_NEW_IN_54 `SPC6.tlu.ras.isfsr_6_new_in

`define DSFSR_54 `SPC6.tlu.ras.dsfsr_6
`define ISFSR_54 `SPC6.tlu.ras.isfsr_6
`define DSFAR_54 `SPC6.tlu.dfd.dsfar_6

`define ASI_WR_DSFSR_54 `SPC6.tlu.ras.asi_wr_dsfsr[6]
`define ASI_WR_ISFSR_54 `SPC6.tlu.ras.asi_wr_isfsr[6]

`define RAS_WRITE_DESR_1st_54  `SPC6.tlu.dfd.ras_write_desr_1st[6]
`define RAS_WRITE_DESR_2nd_54  `SPC6.tlu.dfd.ras_write_desr_2nd[6]
`define DESR_asi_rd_54  `SPC6.tlu.ras_rd_desr[6]
`define DESR_54  `SPC6.tlu.dfd.desr_6

`define RAS_WRITE_FESR_54  `SPC6.tlu.ras.write_fesr[6]
`define FESR_54  `SPC6.tlu.dfd.fesr_6

`define ST_ERR_54  `SPC6.tlu.trl1.take_ftt & `SPC6.tlu.trl1.trap[2]
`define SW_REC_ERR_54  `SPC6.tlu.trl1.take_ade & `SPC6.tlu.trl1.trap[2]
`define DATA_ACC_ERR_54  `SPC6.tlu.trl1.take_dae & `SPC6.tlu.trl1.trap[2]
`define INST_ACC_ERR_54  `SPC6.tlu.trl1.take_iae & `SPC6.tlu.trl1.trap[2]
`define INT_PROC_ERR_54  `SPC6.tlu.trl1.take_ipe & `SPC6.tlu.trl1.trap[2]
`define HW_CORR_ERR_54  `SPC6.tlu.trl1.take_eer & `SPC6.tlu.trl1.trap[2]
`define INST_ACC_MMU_ERR_54  `SPC6.tlu.trl1.take_ime & `SPC6.tlu.trl1.trap[2]
`define DATA_ACC_MMU_ERR_54  `SPC6.tlu.trl1.take_dme & `SPC6.tlu.trl1.trap[2]

`define LSU_LD_VALID_B	`PROBES6.lsu_ld_valid
`define LSU_TID_DEC_B_54 `PROBES6.lsu_tid_dec_b[6]
`define ASI_LD_54	`SPC6.lsu.lmd.lmq6_pkt[60] & (`SPC6.lsu.lmd.lmq6_pkt[49:48] == 2'b0)
`define ASI_54	`SPC6.lsu.lmd.lmq6_pkt[47:40]
`define ASI_ADDR_54	`SPC6.lsu.lmd.lmq6_pkt[39:0]
`define ASI_LD_DATA_54	`SPC6.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_54	tb_top.nas_top.c6.t6.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_6	`SPC6.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_6	`SPC6.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC6.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_54)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_54[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_54  != 4'b0) && ~`ASI_WR_DSFSR_54;
        update_isfsr_w <= (`ISFSR_NEW_IN_54  != 3'b0) && ~`ASI_WR_ISFSR_54;
        desr_wr <=  (`RAS_WRITE_DESR_1st_54  || `RAS_WRITE_DESR_2nd_54);
        update_dfesr_w <= `RAS_WRITE_FESR_54;
        take_err_trap_fx4 <= `ST_ERR_54 | `SW_REC_ERR_54  | `DATA_ACC_ERR_54
                           | `INST_ACC_ERR_54 | `INT_PROC_ERR_54
                           | `HW_CORR_ERR_54 | `INST_ACC_MMU_ERR_54
                           | `DATA_ACC_MMU_ERR_54 ;


        if (`ST_ERR_54) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_54) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_54) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_54) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_54) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_54) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_54) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_54) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_54[63:56], 45'b0, `DESR_54[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_54[63:56], 45'b0, `DESR_54[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_54)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_54[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_54[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_54[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_54[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_54[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_54[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC6.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_54;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_54)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_54)
	begin
	     case (`ASI_54)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_54 >= 0) &  (`ASI_ADDR_54 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_54 >= 0) &  (`ASI_ADDR_54 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_54 >= 0) &  (`ASI_ADDR_54 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_54 >= 0) &  (`ASI_ADDR_54 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_54 >= 0) &  (`ASI_ADDR_54 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_54 >= 0) &  (`ASI_ADDR_54 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_54 >= 0) &  (`ASI_ADDR_54 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_54 >= 0) &  (`ASI_ADDR_54 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_54 >= 0) &  (`ASI_ADDR_54 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_54 >= 0) &  (`ASI_ADDR_54 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC6.lsu.lmd.lmq6_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_54 == 40'h20) ||  (`ASI_ADDR_54 == 40'h30)
			     || (`ASI_ADDR_54 == 40'h80)  
				 || ((`ASI_ADDR_54 == 40'ha0) & (`SPU_MA_BUSY_6 == 0) & (`SPU_MA_TID_6 == 6))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_54 == 40'h20) ||  (`ASI_ADDR_54 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_54, `ASI_ADDR_54, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_54, {24'b0, `ASI_ADDR_54}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c6t7 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 6;
assign mytid = 7;
assign   mytnum = 6*8 + 7;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC6.l2clk) ;
	@(posedge `SPC6.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_55  `SPC6.tlu.ras.dsfsr_7_new_in
`define ISFSR_NEW_IN_55 `SPC6.tlu.ras.isfsr_7_new_in

`define DSFSR_55 `SPC6.tlu.ras.dsfsr_7
`define ISFSR_55 `SPC6.tlu.ras.isfsr_7
`define DSFAR_55 `SPC6.tlu.dfd.dsfar_7

`define ASI_WR_DSFSR_55 `SPC6.tlu.ras.asi_wr_dsfsr[7]
`define ASI_WR_ISFSR_55 `SPC6.tlu.ras.asi_wr_isfsr[7]

`define RAS_WRITE_DESR_1st_55  `SPC6.tlu.dfd.ras_write_desr_1st[7]
`define RAS_WRITE_DESR_2nd_55  `SPC6.tlu.dfd.ras_write_desr_2nd[7]
`define DESR_asi_rd_55  `SPC6.tlu.ras_rd_desr[7]
`define DESR_55  `SPC6.tlu.dfd.desr_7

`define RAS_WRITE_FESR_55  `SPC6.tlu.ras.write_fesr[7]
`define FESR_55  `SPC6.tlu.dfd.fesr_7

`define ST_ERR_55  `SPC6.tlu.trl1.take_ftt & `SPC6.tlu.trl1.trap[3]
`define SW_REC_ERR_55  `SPC6.tlu.trl1.take_ade & `SPC6.tlu.trl1.trap[3]
`define DATA_ACC_ERR_55  `SPC6.tlu.trl1.take_dae & `SPC6.tlu.trl1.trap[3]
`define INST_ACC_ERR_55  `SPC6.tlu.trl1.take_iae & `SPC6.tlu.trl1.trap[3]
`define INT_PROC_ERR_55  `SPC6.tlu.trl1.take_ipe & `SPC6.tlu.trl1.trap[3]
`define HW_CORR_ERR_55  `SPC6.tlu.trl1.take_eer & `SPC6.tlu.trl1.trap[3]
`define INST_ACC_MMU_ERR_55  `SPC6.tlu.trl1.take_ime & `SPC6.tlu.trl1.trap[3]
`define DATA_ACC_MMU_ERR_55  `SPC6.tlu.trl1.take_dme & `SPC6.tlu.trl1.trap[3]

`define LSU_LD_VALID_B	`PROBES6.lsu_ld_valid
`define LSU_TID_DEC_B_55 `PROBES6.lsu_tid_dec_b[7]
`define ASI_LD_55	`SPC6.lsu.lmd.lmq7_pkt[60] & (`SPC6.lsu.lmd.lmq7_pkt[49:48] == 2'b0)
`define ASI_55	`SPC6.lsu.lmd.lmq7_pkt[47:40]
`define ASI_ADDR_55	`SPC6.lsu.lmd.lmq7_pkt[39:0]
`define ASI_LD_DATA_55	`SPC6.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_55	tb_top.nas_top.c6.t7.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_6	`SPC6.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_6	`SPC6.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC6.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_55)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_55[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_55  != 4'b0) && ~`ASI_WR_DSFSR_55;
        update_isfsr_w <= (`ISFSR_NEW_IN_55  != 3'b0) && ~`ASI_WR_ISFSR_55;
        desr_wr <=  (`RAS_WRITE_DESR_1st_55  || `RAS_WRITE_DESR_2nd_55);
        update_dfesr_w <= `RAS_WRITE_FESR_55;
        take_err_trap_fx4 <= `ST_ERR_55 | `SW_REC_ERR_55  | `DATA_ACC_ERR_55
                           | `INST_ACC_ERR_55 | `INT_PROC_ERR_55
                           | `HW_CORR_ERR_55 | `INST_ACC_MMU_ERR_55
                           | `DATA_ACC_MMU_ERR_55 ;


        if (`ST_ERR_55) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_55) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_55) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_55) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_55) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_55) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_55) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_55) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_55[63:56], 45'b0, `DESR_55[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_55[63:56], 45'b0, `DESR_55[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_55)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_55[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_55[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_55[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_55[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_55[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_55[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC6.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_55;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_55)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_55)
	begin
	     case (`ASI_55)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_55 >= 0) &  (`ASI_ADDR_55 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_55 >= 0) &  (`ASI_ADDR_55 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_55 >= 0) &  (`ASI_ADDR_55 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_55 >= 0) &  (`ASI_ADDR_55 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_55 >= 0) &  (`ASI_ADDR_55 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_55 >= 0) &  (`ASI_ADDR_55 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_55 >= 0) &  (`ASI_ADDR_55 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_55 >= 0) &  (`ASI_ADDR_55 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_55 >= 0) &  (`ASI_ADDR_55 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_55 >= 0) &  (`ASI_ADDR_55 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC6.lsu.lmd.lmq7_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_55 == 40'h20) ||  (`ASI_ADDR_55 == 40'h30)
			     || (`ASI_ADDR_55 == 40'h80)  
				 || ((`ASI_ADDR_55 == 40'ha0) & (`SPU_MA_BUSY_6 == 0) & (`SPU_MA_TID_6 == 7))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_55 == 40'h20) ||  (`ASI_ADDR_55 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_55, `ASI_ADDR_55, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_55, {24'b0, `ASI_ADDR_55}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule

`endif

`ifdef CORE_7



module err_c7t0 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 7;
assign mytid = 0;
assign   mytnum = 7*8 + 0;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC7.l2clk) ;
	@(posedge `SPC7.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_56  `SPC7.tlu.ras.dsfsr_0_new_in
`define ISFSR_NEW_IN_56 `SPC7.tlu.ras.isfsr_0_new_in

`define DSFSR_56 `SPC7.tlu.ras.dsfsr_0
`define ISFSR_56 `SPC7.tlu.ras.isfsr_0
`define DSFAR_56 `SPC7.tlu.dfd.dsfar_0

`define ASI_WR_DSFSR_56 `SPC7.tlu.ras.asi_wr_dsfsr[0]
`define ASI_WR_ISFSR_56 `SPC7.tlu.ras.asi_wr_isfsr[0]

`define RAS_WRITE_DESR_1st_56  `SPC7.tlu.dfd.ras_write_desr_1st[0]
`define RAS_WRITE_DESR_2nd_56  `SPC7.tlu.dfd.ras_write_desr_2nd[0]
`define DESR_asi_rd_56  `SPC7.tlu.ras_rd_desr[0]
`define DESR_56  `SPC7.tlu.dfd.desr_0

`define RAS_WRITE_FESR_56  `SPC7.tlu.ras.write_fesr[0]
`define FESR_56  `SPC7.tlu.dfd.fesr_0

`define ST_ERR_56  `SPC7.tlu.trl0.take_ftt & `SPC7.tlu.trl0.trap[0]
`define SW_REC_ERR_56  `SPC7.tlu.trl0.take_ade & `SPC7.tlu.trl0.trap[0]
`define DATA_ACC_ERR_56  `SPC7.tlu.trl0.take_dae & `SPC7.tlu.trl0.trap[0]
`define INST_ACC_ERR_56  `SPC7.tlu.trl0.take_iae & `SPC7.tlu.trl0.trap[0]
`define INT_PROC_ERR_56  `SPC7.tlu.trl0.take_ipe & `SPC7.tlu.trl0.trap[0]
`define HW_CORR_ERR_56  `SPC7.tlu.trl0.take_eer & `SPC7.tlu.trl0.trap[0]
`define INST_ACC_MMU_ERR_56  `SPC7.tlu.trl0.take_ime & `SPC7.tlu.trl0.trap[0]
`define DATA_ACC_MMU_ERR_56  `SPC7.tlu.trl0.take_dme & `SPC7.tlu.trl0.trap[0]

`define LSU_LD_VALID_B	`PROBES7.lsu_ld_valid
`define LSU_TID_DEC_B_56 `PROBES7.lsu_tid_dec_b[0]
`define ASI_LD_56	`SPC7.lsu.lmd.lmq0_pkt[60] & (`SPC7.lsu.lmd.lmq0_pkt[49:48] == 2'b0)
`define ASI_56	`SPC7.lsu.lmd.lmq0_pkt[47:40]
`define ASI_ADDR_56	`SPC7.lsu.lmd.lmq0_pkt[39:0]
`define ASI_LD_DATA_56	`SPC7.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_56	tb_top.nas_top.c7.t0.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_7	`SPC7.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_7	`SPC7.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC7.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_56)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_56[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_56  != 4'b0) && ~`ASI_WR_DSFSR_56;
        update_isfsr_w <= (`ISFSR_NEW_IN_56  != 3'b0) && ~`ASI_WR_ISFSR_56;
        desr_wr <=  (`RAS_WRITE_DESR_1st_56  || `RAS_WRITE_DESR_2nd_56);
        update_dfesr_w <= `RAS_WRITE_FESR_56;
        take_err_trap_fx4 <= `ST_ERR_56 | `SW_REC_ERR_56  | `DATA_ACC_ERR_56
                           | `INST_ACC_ERR_56 | `INT_PROC_ERR_56
                           | `HW_CORR_ERR_56 | `INST_ACC_MMU_ERR_56
                           | `DATA_ACC_MMU_ERR_56 ;


        if (`ST_ERR_56) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_56) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_56) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_56) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_56) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_56) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_56) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_56) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_56[63:56], 45'b0, `DESR_56[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_56[63:56], 45'b0, `DESR_56[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_56)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_56[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_56[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_56[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_56[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_56[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_56[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC7.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_56;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_56)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_56)
	begin
	     case (`ASI_56)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_56 >= 0) &  (`ASI_ADDR_56 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_56 >= 0) &  (`ASI_ADDR_56 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_56 >= 0) &  (`ASI_ADDR_56 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_56 >= 0) &  (`ASI_ADDR_56 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_56 >= 0) &  (`ASI_ADDR_56 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_56 >= 0) &  (`ASI_ADDR_56 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_56 >= 0) &  (`ASI_ADDR_56 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_56 >= 0) &  (`ASI_ADDR_56 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_56 >= 0) &  (`ASI_ADDR_56 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_56 >= 0) &  (`ASI_ADDR_56 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC7.lsu.lmd.lmq0_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_56 == 40'h20) ||  (`ASI_ADDR_56 == 40'h30)
			     || (`ASI_ADDR_56 == 40'h80)  
				 || ((`ASI_ADDR_56 == 40'ha0) & (`SPU_MA_BUSY_7 == 0) & (`SPU_MA_TID_7 == 0))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_56 == 40'h20) ||  (`ASI_ADDR_56 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_56, `ASI_ADDR_56, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_56, {24'b0, `ASI_ADDR_56}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c7t1 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 7;
assign mytid = 1;
assign   mytnum = 7*8 + 1;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC7.l2clk) ;
	@(posedge `SPC7.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_57  `SPC7.tlu.ras.dsfsr_1_new_in
`define ISFSR_NEW_IN_57 `SPC7.tlu.ras.isfsr_1_new_in

`define DSFSR_57 `SPC7.tlu.ras.dsfsr_1
`define ISFSR_57 `SPC7.tlu.ras.isfsr_1
`define DSFAR_57 `SPC7.tlu.dfd.dsfar_1

`define ASI_WR_DSFSR_57 `SPC7.tlu.ras.asi_wr_dsfsr[1]
`define ASI_WR_ISFSR_57 `SPC7.tlu.ras.asi_wr_isfsr[1]

`define RAS_WRITE_DESR_1st_57  `SPC7.tlu.dfd.ras_write_desr_1st[1]
`define RAS_WRITE_DESR_2nd_57  `SPC7.tlu.dfd.ras_write_desr_2nd[1]
`define DESR_asi_rd_57  `SPC7.tlu.ras_rd_desr[1]
`define DESR_57  `SPC7.tlu.dfd.desr_1

`define RAS_WRITE_FESR_57  `SPC7.tlu.ras.write_fesr[1]
`define FESR_57  `SPC7.tlu.dfd.fesr_1

`define ST_ERR_57  `SPC7.tlu.trl0.take_ftt & `SPC7.tlu.trl0.trap[1]
`define SW_REC_ERR_57  `SPC7.tlu.trl0.take_ade & `SPC7.tlu.trl0.trap[1]
`define DATA_ACC_ERR_57  `SPC7.tlu.trl0.take_dae & `SPC7.tlu.trl0.trap[1]
`define INST_ACC_ERR_57  `SPC7.tlu.trl0.take_iae & `SPC7.tlu.trl0.trap[1]
`define INT_PROC_ERR_57  `SPC7.tlu.trl0.take_ipe & `SPC7.tlu.trl0.trap[1]
`define HW_CORR_ERR_57  `SPC7.tlu.trl0.take_eer & `SPC7.tlu.trl0.trap[1]
`define INST_ACC_MMU_ERR_57  `SPC7.tlu.trl0.take_ime & `SPC7.tlu.trl0.trap[1]
`define DATA_ACC_MMU_ERR_57  `SPC7.tlu.trl0.take_dme & `SPC7.tlu.trl0.trap[1]

`define LSU_LD_VALID_B	`PROBES7.lsu_ld_valid
`define LSU_TID_DEC_B_57 `PROBES7.lsu_tid_dec_b[1]
`define ASI_LD_57	`SPC7.lsu.lmd.lmq1_pkt[60] & (`SPC7.lsu.lmd.lmq1_pkt[49:48] == 2'b0)
`define ASI_57	`SPC7.lsu.lmd.lmq1_pkt[47:40]
`define ASI_ADDR_57	`SPC7.lsu.lmd.lmq1_pkt[39:0]
`define ASI_LD_DATA_57	`SPC7.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_57	tb_top.nas_top.c7.t1.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_7	`SPC7.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_7	`SPC7.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC7.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_57)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_57[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_57  != 4'b0) && ~`ASI_WR_DSFSR_57;
        update_isfsr_w <= (`ISFSR_NEW_IN_57  != 3'b0) && ~`ASI_WR_ISFSR_57;
        desr_wr <=  (`RAS_WRITE_DESR_1st_57  || `RAS_WRITE_DESR_2nd_57);
        update_dfesr_w <= `RAS_WRITE_FESR_57;
        take_err_trap_fx4 <= `ST_ERR_57 | `SW_REC_ERR_57  | `DATA_ACC_ERR_57
                           | `INST_ACC_ERR_57 | `INT_PROC_ERR_57
                           | `HW_CORR_ERR_57 | `INST_ACC_MMU_ERR_57
                           | `DATA_ACC_MMU_ERR_57 ;


        if (`ST_ERR_57) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_57) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_57) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_57) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_57) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_57) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_57) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_57) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_57[63:56], 45'b0, `DESR_57[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_57[63:56], 45'b0, `DESR_57[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_57)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_57[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_57[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_57[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_57[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_57[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_57[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC7.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_57;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_57)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_57)
	begin
	     case (`ASI_57)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_57 >= 0) &  (`ASI_ADDR_57 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_57 >= 0) &  (`ASI_ADDR_57 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_57 >= 0) &  (`ASI_ADDR_57 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_57 >= 0) &  (`ASI_ADDR_57 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_57 >= 0) &  (`ASI_ADDR_57 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_57 >= 0) &  (`ASI_ADDR_57 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_57 >= 0) &  (`ASI_ADDR_57 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_57 >= 0) &  (`ASI_ADDR_57 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_57 >= 0) &  (`ASI_ADDR_57 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_57 >= 0) &  (`ASI_ADDR_57 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC7.lsu.lmd.lmq1_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_57 == 40'h20) ||  (`ASI_ADDR_57 == 40'h30)
			     || (`ASI_ADDR_57 == 40'h80)  
				 || ((`ASI_ADDR_57 == 40'ha0) & (`SPU_MA_BUSY_7 == 0) & (`SPU_MA_TID_7 == 1))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_57 == 40'h20) ||  (`ASI_ADDR_57 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_57, `ASI_ADDR_57, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_57, {24'b0, `ASI_ADDR_57}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c7t2 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 7;
assign mytid = 2;
assign   mytnum = 7*8 + 2;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC7.l2clk) ;
	@(posedge `SPC7.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_58  `SPC7.tlu.ras.dsfsr_2_new_in
`define ISFSR_NEW_IN_58 `SPC7.tlu.ras.isfsr_2_new_in

`define DSFSR_58 `SPC7.tlu.ras.dsfsr_2
`define ISFSR_58 `SPC7.tlu.ras.isfsr_2
`define DSFAR_58 `SPC7.tlu.dfd.dsfar_2

`define ASI_WR_DSFSR_58 `SPC7.tlu.ras.asi_wr_dsfsr[2]
`define ASI_WR_ISFSR_58 `SPC7.tlu.ras.asi_wr_isfsr[2]

`define RAS_WRITE_DESR_1st_58  `SPC7.tlu.dfd.ras_write_desr_1st[2]
`define RAS_WRITE_DESR_2nd_58  `SPC7.tlu.dfd.ras_write_desr_2nd[2]
`define DESR_asi_rd_58  `SPC7.tlu.ras_rd_desr[2]
`define DESR_58  `SPC7.tlu.dfd.desr_2

`define RAS_WRITE_FESR_58  `SPC7.tlu.ras.write_fesr[2]
`define FESR_58  `SPC7.tlu.dfd.fesr_2

`define ST_ERR_58  `SPC7.tlu.trl0.take_ftt & `SPC7.tlu.trl0.trap[2]
`define SW_REC_ERR_58  `SPC7.tlu.trl0.take_ade & `SPC7.tlu.trl0.trap[2]
`define DATA_ACC_ERR_58  `SPC7.tlu.trl0.take_dae & `SPC7.tlu.trl0.trap[2]
`define INST_ACC_ERR_58  `SPC7.tlu.trl0.take_iae & `SPC7.tlu.trl0.trap[2]
`define INT_PROC_ERR_58  `SPC7.tlu.trl0.take_ipe & `SPC7.tlu.trl0.trap[2]
`define HW_CORR_ERR_58  `SPC7.tlu.trl0.take_eer & `SPC7.tlu.trl0.trap[2]
`define INST_ACC_MMU_ERR_58  `SPC7.tlu.trl0.take_ime & `SPC7.tlu.trl0.trap[2]
`define DATA_ACC_MMU_ERR_58  `SPC7.tlu.trl0.take_dme & `SPC7.tlu.trl0.trap[2]

`define LSU_LD_VALID_B	`PROBES7.lsu_ld_valid
`define LSU_TID_DEC_B_58 `PROBES7.lsu_tid_dec_b[2]
`define ASI_LD_58	`SPC7.lsu.lmd.lmq2_pkt[60] & (`SPC7.lsu.lmd.lmq2_pkt[49:48] == 2'b0)
`define ASI_58	`SPC7.lsu.lmd.lmq2_pkt[47:40]
`define ASI_ADDR_58	`SPC7.lsu.lmd.lmq2_pkt[39:0]
`define ASI_LD_DATA_58	`SPC7.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_58	tb_top.nas_top.c7.t2.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_7	`SPC7.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_7	`SPC7.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC7.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_58)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_58[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_58  != 4'b0) && ~`ASI_WR_DSFSR_58;
        update_isfsr_w <= (`ISFSR_NEW_IN_58  != 3'b0) && ~`ASI_WR_ISFSR_58;
        desr_wr <=  (`RAS_WRITE_DESR_1st_58  || `RAS_WRITE_DESR_2nd_58);
        update_dfesr_w <= `RAS_WRITE_FESR_58;
        take_err_trap_fx4 <= `ST_ERR_58 | `SW_REC_ERR_58  | `DATA_ACC_ERR_58
                           | `INST_ACC_ERR_58 | `INT_PROC_ERR_58
                           | `HW_CORR_ERR_58 | `INST_ACC_MMU_ERR_58
                           | `DATA_ACC_MMU_ERR_58 ;


        if (`ST_ERR_58) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_58) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_58) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_58) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_58) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_58) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_58) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_58) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_58[63:56], 45'b0, `DESR_58[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_58[63:56], 45'b0, `DESR_58[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_58)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_58[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_58[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_58[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_58[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_58[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_58[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC7.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_58;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_58)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_58)
	begin
	     case (`ASI_58)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_58 >= 0) &  (`ASI_ADDR_58 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_58 >= 0) &  (`ASI_ADDR_58 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_58 >= 0) &  (`ASI_ADDR_58 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_58 >= 0) &  (`ASI_ADDR_58 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_58 >= 0) &  (`ASI_ADDR_58 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_58 >= 0) &  (`ASI_ADDR_58 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_58 >= 0) &  (`ASI_ADDR_58 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_58 >= 0) &  (`ASI_ADDR_58 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_58 >= 0) &  (`ASI_ADDR_58 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_58 >= 0) &  (`ASI_ADDR_58 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC7.lsu.lmd.lmq2_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_58 == 40'h20) ||  (`ASI_ADDR_58 == 40'h30)
			     || (`ASI_ADDR_58 == 40'h80)  
				 || ((`ASI_ADDR_58 == 40'ha0) & (`SPU_MA_BUSY_7 == 0) & (`SPU_MA_TID_7 == 2))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_58 == 40'h20) ||  (`ASI_ADDR_58 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_58, `ASI_ADDR_58, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_58, {24'b0, `ASI_ADDR_58}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c7t3 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 7;
assign mytid = 3;
assign   mytnum = 7*8 + 3;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC7.l2clk) ;
	@(posedge `SPC7.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_59  `SPC7.tlu.ras.dsfsr_3_new_in
`define ISFSR_NEW_IN_59 `SPC7.tlu.ras.isfsr_3_new_in

`define DSFSR_59 `SPC7.tlu.ras.dsfsr_3
`define ISFSR_59 `SPC7.tlu.ras.isfsr_3
`define DSFAR_59 `SPC7.tlu.dfd.dsfar_3

`define ASI_WR_DSFSR_59 `SPC7.tlu.ras.asi_wr_dsfsr[3]
`define ASI_WR_ISFSR_59 `SPC7.tlu.ras.asi_wr_isfsr[3]

`define RAS_WRITE_DESR_1st_59  `SPC7.tlu.dfd.ras_write_desr_1st[3]
`define RAS_WRITE_DESR_2nd_59  `SPC7.tlu.dfd.ras_write_desr_2nd[3]
`define DESR_asi_rd_59  `SPC7.tlu.ras_rd_desr[3]
`define DESR_59  `SPC7.tlu.dfd.desr_3

`define RAS_WRITE_FESR_59  `SPC7.tlu.ras.write_fesr[3]
`define FESR_59  `SPC7.tlu.dfd.fesr_3

`define ST_ERR_59  `SPC7.tlu.trl0.take_ftt & `SPC7.tlu.trl0.trap[3]
`define SW_REC_ERR_59  `SPC7.tlu.trl0.take_ade & `SPC7.tlu.trl0.trap[3]
`define DATA_ACC_ERR_59  `SPC7.tlu.trl0.take_dae & `SPC7.tlu.trl0.trap[3]
`define INST_ACC_ERR_59  `SPC7.tlu.trl0.take_iae & `SPC7.tlu.trl0.trap[3]
`define INT_PROC_ERR_59  `SPC7.tlu.trl0.take_ipe & `SPC7.tlu.trl0.trap[3]
`define HW_CORR_ERR_59  `SPC7.tlu.trl0.take_eer & `SPC7.tlu.trl0.trap[3]
`define INST_ACC_MMU_ERR_59  `SPC7.tlu.trl0.take_ime & `SPC7.tlu.trl0.trap[3]
`define DATA_ACC_MMU_ERR_59  `SPC7.tlu.trl0.take_dme & `SPC7.tlu.trl0.trap[3]

`define LSU_LD_VALID_B	`PROBES7.lsu_ld_valid
`define LSU_TID_DEC_B_59 `PROBES7.lsu_tid_dec_b[3]
`define ASI_LD_59	`SPC7.lsu.lmd.lmq3_pkt[60] & (`SPC7.lsu.lmd.lmq3_pkt[49:48] == 2'b0)
`define ASI_59	`SPC7.lsu.lmd.lmq3_pkt[47:40]
`define ASI_ADDR_59	`SPC7.lsu.lmd.lmq3_pkt[39:0]
`define ASI_LD_DATA_59	`SPC7.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_59	tb_top.nas_top.c7.t3.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_7	`SPC7.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_7	`SPC7.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC7.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_59)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_59[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_59  != 4'b0) && ~`ASI_WR_DSFSR_59;
        update_isfsr_w <= (`ISFSR_NEW_IN_59  != 3'b0) && ~`ASI_WR_ISFSR_59;
        desr_wr <=  (`RAS_WRITE_DESR_1st_59  || `RAS_WRITE_DESR_2nd_59);
        update_dfesr_w <= `RAS_WRITE_FESR_59;
        take_err_trap_fx4 <= `ST_ERR_59 | `SW_REC_ERR_59  | `DATA_ACC_ERR_59
                           | `INST_ACC_ERR_59 | `INT_PROC_ERR_59
                           | `HW_CORR_ERR_59 | `INST_ACC_MMU_ERR_59
                           | `DATA_ACC_MMU_ERR_59 ;


        if (`ST_ERR_59) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_59) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_59) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_59) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_59) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_59) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_59) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_59) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_59[63:56], 45'b0, `DESR_59[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_59[63:56], 45'b0, `DESR_59[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_59)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_59[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_59[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_59[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_59[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_59[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_59[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC7.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_59;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_59)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_59)
	begin
	     case (`ASI_59)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_59 >= 0) &  (`ASI_ADDR_59 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_59 >= 0) &  (`ASI_ADDR_59 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_59 >= 0) &  (`ASI_ADDR_59 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_59 >= 0) &  (`ASI_ADDR_59 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_59 >= 0) &  (`ASI_ADDR_59 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_59 >= 0) &  (`ASI_ADDR_59 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_59 >= 0) &  (`ASI_ADDR_59 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_59 >= 0) &  (`ASI_ADDR_59 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_59 >= 0) &  (`ASI_ADDR_59 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_59 >= 0) &  (`ASI_ADDR_59 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC7.lsu.lmd.lmq3_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_59 == 40'h20) ||  (`ASI_ADDR_59 == 40'h30)
			     || (`ASI_ADDR_59 == 40'h80)  
				 || ((`ASI_ADDR_59 == 40'ha0) & (`SPU_MA_BUSY_7 == 0) & (`SPU_MA_TID_7 == 3))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_59 == 40'h20) ||  (`ASI_ADDR_59 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_59, `ASI_ADDR_59, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_59, {24'b0, `ASI_ADDR_59}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c7t4 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 7;
assign mytid = 4;
assign   mytnum = 7*8 + 4;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC7.l2clk) ;
	@(posedge `SPC7.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_60  `SPC7.tlu.ras.dsfsr_4_new_in
`define ISFSR_NEW_IN_60 `SPC7.tlu.ras.isfsr_4_new_in

`define DSFSR_60 `SPC7.tlu.ras.dsfsr_4
`define ISFSR_60 `SPC7.tlu.ras.isfsr_4
`define DSFAR_60 `SPC7.tlu.dfd.dsfar_4

`define ASI_WR_DSFSR_60 `SPC7.tlu.ras.asi_wr_dsfsr[4]
`define ASI_WR_ISFSR_60 `SPC7.tlu.ras.asi_wr_isfsr[4]

`define RAS_WRITE_DESR_1st_60  `SPC7.tlu.dfd.ras_write_desr_1st[4]
`define RAS_WRITE_DESR_2nd_60  `SPC7.tlu.dfd.ras_write_desr_2nd[4]
`define DESR_asi_rd_60  `SPC7.tlu.ras_rd_desr[4]
`define DESR_60  `SPC7.tlu.dfd.desr_4

`define RAS_WRITE_FESR_60  `SPC7.tlu.ras.write_fesr[4]
`define FESR_60  `SPC7.tlu.dfd.fesr_4

`define ST_ERR_60  `SPC7.tlu.trl1.take_ftt & `SPC7.tlu.trl1.trap[0]
`define SW_REC_ERR_60  `SPC7.tlu.trl1.take_ade & `SPC7.tlu.trl1.trap[0]
`define DATA_ACC_ERR_60  `SPC7.tlu.trl1.take_dae & `SPC7.tlu.trl1.trap[0]
`define INST_ACC_ERR_60  `SPC7.tlu.trl1.take_iae & `SPC7.tlu.trl1.trap[0]
`define INT_PROC_ERR_60  `SPC7.tlu.trl1.take_ipe & `SPC7.tlu.trl1.trap[0]
`define HW_CORR_ERR_60  `SPC7.tlu.trl1.take_eer & `SPC7.tlu.trl1.trap[0]
`define INST_ACC_MMU_ERR_60  `SPC7.tlu.trl1.take_ime & `SPC7.tlu.trl1.trap[0]
`define DATA_ACC_MMU_ERR_60  `SPC7.tlu.trl1.take_dme & `SPC7.tlu.trl1.trap[0]

`define LSU_LD_VALID_B	`PROBES7.lsu_ld_valid
`define LSU_TID_DEC_B_60 `PROBES7.lsu_tid_dec_b[4]
`define ASI_LD_60	`SPC7.lsu.lmd.lmq4_pkt[60] & (`SPC7.lsu.lmd.lmq4_pkt[49:48] == 2'b0)
`define ASI_60	`SPC7.lsu.lmd.lmq4_pkt[47:40]
`define ASI_ADDR_60	`SPC7.lsu.lmd.lmq4_pkt[39:0]
`define ASI_LD_DATA_60	`SPC7.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_60	tb_top.nas_top.c7.t4.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_7	`SPC7.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_7	`SPC7.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC7.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_60)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_60[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_60  != 4'b0) && ~`ASI_WR_DSFSR_60;
        update_isfsr_w <= (`ISFSR_NEW_IN_60  != 3'b0) && ~`ASI_WR_ISFSR_60;
        desr_wr <=  (`RAS_WRITE_DESR_1st_60  || `RAS_WRITE_DESR_2nd_60);
        update_dfesr_w <= `RAS_WRITE_FESR_60;
        take_err_trap_fx4 <= `ST_ERR_60 | `SW_REC_ERR_60  | `DATA_ACC_ERR_60
                           | `INST_ACC_ERR_60 | `INT_PROC_ERR_60
                           | `HW_CORR_ERR_60 | `INST_ACC_MMU_ERR_60
                           | `DATA_ACC_MMU_ERR_60 ;


        if (`ST_ERR_60) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_60) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_60) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_60) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_60) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_60) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_60) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_60) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_60[63:56], 45'b0, `DESR_60[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_60[63:56], 45'b0, `DESR_60[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_60)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_60[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_60[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_60[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_60[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_60[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_60[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC7.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_60;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_60)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_60)
	begin
	     case (`ASI_60)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_60 >= 0) &  (`ASI_ADDR_60 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_60 >= 0) &  (`ASI_ADDR_60 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_60 >= 0) &  (`ASI_ADDR_60 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_60 >= 0) &  (`ASI_ADDR_60 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_60 >= 0) &  (`ASI_ADDR_60 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_60 >= 0) &  (`ASI_ADDR_60 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_60 >= 0) &  (`ASI_ADDR_60 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_60 >= 0) &  (`ASI_ADDR_60 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_60 >= 0) &  (`ASI_ADDR_60 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_60 >= 0) &  (`ASI_ADDR_60 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC7.lsu.lmd.lmq4_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_60 == 40'h20) ||  (`ASI_ADDR_60 == 40'h30)
			     || (`ASI_ADDR_60 == 40'h80)  
				 || ((`ASI_ADDR_60 == 40'ha0) & (`SPU_MA_BUSY_7 == 0) & (`SPU_MA_TID_7 == 4))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_60 == 40'h20) ||  (`ASI_ADDR_60 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_60, `ASI_ADDR_60, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_60, {24'b0, `ASI_ADDR_60}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c7t5 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 7;
assign mytid = 5;
assign   mytnum = 7*8 + 5;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC7.l2clk) ;
	@(posedge `SPC7.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_61  `SPC7.tlu.ras.dsfsr_5_new_in
`define ISFSR_NEW_IN_61 `SPC7.tlu.ras.isfsr_5_new_in

`define DSFSR_61 `SPC7.tlu.ras.dsfsr_5
`define ISFSR_61 `SPC7.tlu.ras.isfsr_5
`define DSFAR_61 `SPC7.tlu.dfd.dsfar_5

`define ASI_WR_DSFSR_61 `SPC7.tlu.ras.asi_wr_dsfsr[5]
`define ASI_WR_ISFSR_61 `SPC7.tlu.ras.asi_wr_isfsr[5]

`define RAS_WRITE_DESR_1st_61  `SPC7.tlu.dfd.ras_write_desr_1st[5]
`define RAS_WRITE_DESR_2nd_61  `SPC7.tlu.dfd.ras_write_desr_2nd[5]
`define DESR_asi_rd_61  `SPC7.tlu.ras_rd_desr[5]
`define DESR_61  `SPC7.tlu.dfd.desr_5

`define RAS_WRITE_FESR_61  `SPC7.tlu.ras.write_fesr[5]
`define FESR_61  `SPC7.tlu.dfd.fesr_5

`define ST_ERR_61  `SPC7.tlu.trl1.take_ftt & `SPC7.tlu.trl1.trap[1]
`define SW_REC_ERR_61  `SPC7.tlu.trl1.take_ade & `SPC7.tlu.trl1.trap[1]
`define DATA_ACC_ERR_61  `SPC7.tlu.trl1.take_dae & `SPC7.tlu.trl1.trap[1]
`define INST_ACC_ERR_61  `SPC7.tlu.trl1.take_iae & `SPC7.tlu.trl1.trap[1]
`define INT_PROC_ERR_61  `SPC7.tlu.trl1.take_ipe & `SPC7.tlu.trl1.trap[1]
`define HW_CORR_ERR_61  `SPC7.tlu.trl1.take_eer & `SPC7.tlu.trl1.trap[1]
`define INST_ACC_MMU_ERR_61  `SPC7.tlu.trl1.take_ime & `SPC7.tlu.trl1.trap[1]
`define DATA_ACC_MMU_ERR_61  `SPC7.tlu.trl1.take_dme & `SPC7.tlu.trl1.trap[1]

`define LSU_LD_VALID_B	`PROBES7.lsu_ld_valid
`define LSU_TID_DEC_B_61 `PROBES7.lsu_tid_dec_b[5]
`define ASI_LD_61	`SPC7.lsu.lmd.lmq5_pkt[60] & (`SPC7.lsu.lmd.lmq5_pkt[49:48] == 2'b0)
`define ASI_61	`SPC7.lsu.lmd.lmq5_pkt[47:40]
`define ASI_ADDR_61	`SPC7.lsu.lmd.lmq5_pkt[39:0]
`define ASI_LD_DATA_61	`SPC7.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_61	tb_top.nas_top.c7.t5.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_7	`SPC7.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_7	`SPC7.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC7.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_61)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_61[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_61  != 4'b0) && ~`ASI_WR_DSFSR_61;
        update_isfsr_w <= (`ISFSR_NEW_IN_61  != 3'b0) && ~`ASI_WR_ISFSR_61;
        desr_wr <=  (`RAS_WRITE_DESR_1st_61  || `RAS_WRITE_DESR_2nd_61);
        update_dfesr_w <= `RAS_WRITE_FESR_61;
        take_err_trap_fx4 <= `ST_ERR_61 | `SW_REC_ERR_61  | `DATA_ACC_ERR_61
                           | `INST_ACC_ERR_61 | `INT_PROC_ERR_61
                           | `HW_CORR_ERR_61 | `INST_ACC_MMU_ERR_61
                           | `DATA_ACC_MMU_ERR_61 ;


        if (`ST_ERR_61) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_61) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_61) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_61) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_61) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_61) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_61) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_61) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_61[63:56], 45'b0, `DESR_61[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_61[63:56], 45'b0, `DESR_61[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_61)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_61[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_61[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_61[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_61[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_61[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_61[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC7.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_61;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_61)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_61)
	begin
	     case (`ASI_61)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_61 >= 0) &  (`ASI_ADDR_61 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_61 >= 0) &  (`ASI_ADDR_61 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_61 >= 0) &  (`ASI_ADDR_61 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_61 >= 0) &  (`ASI_ADDR_61 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_61 >= 0) &  (`ASI_ADDR_61 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_61 >= 0) &  (`ASI_ADDR_61 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_61 >= 0) &  (`ASI_ADDR_61 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_61 >= 0) &  (`ASI_ADDR_61 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_61 >= 0) &  (`ASI_ADDR_61 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_61 >= 0) &  (`ASI_ADDR_61 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC7.lsu.lmd.lmq5_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_61 == 40'h20) ||  (`ASI_ADDR_61 == 40'h30)
			     || (`ASI_ADDR_61 == 40'h80)  
				 || ((`ASI_ADDR_61 == 40'ha0) & (`SPU_MA_BUSY_7 == 0) & (`SPU_MA_TID_7 == 5))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_61 == 40'h20) ||  (`ASI_ADDR_61 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_61, `ASI_ADDR_61, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_61, {24'b0, `ASI_ADDR_61}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c7t6 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 7;
assign mytid = 6;
assign   mytnum = 7*8 + 6;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC7.l2clk) ;
	@(posedge `SPC7.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_62  `SPC7.tlu.ras.dsfsr_6_new_in
`define ISFSR_NEW_IN_62 `SPC7.tlu.ras.isfsr_6_new_in

`define DSFSR_62 `SPC7.tlu.ras.dsfsr_6
`define ISFSR_62 `SPC7.tlu.ras.isfsr_6
`define DSFAR_62 `SPC7.tlu.dfd.dsfar_6

`define ASI_WR_DSFSR_62 `SPC7.tlu.ras.asi_wr_dsfsr[6]
`define ASI_WR_ISFSR_62 `SPC7.tlu.ras.asi_wr_isfsr[6]

`define RAS_WRITE_DESR_1st_62  `SPC7.tlu.dfd.ras_write_desr_1st[6]
`define RAS_WRITE_DESR_2nd_62  `SPC7.tlu.dfd.ras_write_desr_2nd[6]
`define DESR_asi_rd_62  `SPC7.tlu.ras_rd_desr[6]
`define DESR_62  `SPC7.tlu.dfd.desr_6

`define RAS_WRITE_FESR_62  `SPC7.tlu.ras.write_fesr[6]
`define FESR_62  `SPC7.tlu.dfd.fesr_6

`define ST_ERR_62  `SPC7.tlu.trl1.take_ftt & `SPC7.tlu.trl1.trap[2]
`define SW_REC_ERR_62  `SPC7.tlu.trl1.take_ade & `SPC7.tlu.trl1.trap[2]
`define DATA_ACC_ERR_62  `SPC7.tlu.trl1.take_dae & `SPC7.tlu.trl1.trap[2]
`define INST_ACC_ERR_62  `SPC7.tlu.trl1.take_iae & `SPC7.tlu.trl1.trap[2]
`define INT_PROC_ERR_62  `SPC7.tlu.trl1.take_ipe & `SPC7.tlu.trl1.trap[2]
`define HW_CORR_ERR_62  `SPC7.tlu.trl1.take_eer & `SPC7.tlu.trl1.trap[2]
`define INST_ACC_MMU_ERR_62  `SPC7.tlu.trl1.take_ime & `SPC7.tlu.trl1.trap[2]
`define DATA_ACC_MMU_ERR_62  `SPC7.tlu.trl1.take_dme & `SPC7.tlu.trl1.trap[2]

`define LSU_LD_VALID_B	`PROBES7.lsu_ld_valid
`define LSU_TID_DEC_B_62 `PROBES7.lsu_tid_dec_b[6]
`define ASI_LD_62	`SPC7.lsu.lmd.lmq6_pkt[60] & (`SPC7.lsu.lmd.lmq6_pkt[49:48] == 2'b0)
`define ASI_62	`SPC7.lsu.lmd.lmq6_pkt[47:40]
`define ASI_ADDR_62	`SPC7.lsu.lmd.lmq6_pkt[39:0]
`define ASI_LD_DATA_62	`SPC7.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_62	tb_top.nas_top.c7.t6.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_7	`SPC7.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_7	`SPC7.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC7.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_62)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_62[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_62  != 4'b0) && ~`ASI_WR_DSFSR_62;
        update_isfsr_w <= (`ISFSR_NEW_IN_62  != 3'b0) && ~`ASI_WR_ISFSR_62;
        desr_wr <=  (`RAS_WRITE_DESR_1st_62  || `RAS_WRITE_DESR_2nd_62);
        update_dfesr_w <= `RAS_WRITE_FESR_62;
        take_err_trap_fx4 <= `ST_ERR_62 | `SW_REC_ERR_62  | `DATA_ACC_ERR_62
                           | `INST_ACC_ERR_62 | `INT_PROC_ERR_62
                           | `HW_CORR_ERR_62 | `INST_ACC_MMU_ERR_62
                           | `DATA_ACC_MMU_ERR_62 ;


        if (`ST_ERR_62) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_62) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_62) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_62) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_62) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_62) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_62) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_62) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_62[63:56], 45'b0, `DESR_62[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_62[63:56], 45'b0, `DESR_62[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_62)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_62[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_62[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_62[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_62[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_62[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_62[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC7.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_62;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_62)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_62)
	begin
	     case (`ASI_62)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_62 >= 0) &  (`ASI_ADDR_62 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_62 >= 0) &  (`ASI_ADDR_62 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_62 >= 0) &  (`ASI_ADDR_62 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_62 >= 0) &  (`ASI_ADDR_62 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_62 >= 0) &  (`ASI_ADDR_62 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_62 >= 0) &  (`ASI_ADDR_62 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_62 >= 0) &  (`ASI_ADDR_62 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_62 >= 0) &  (`ASI_ADDR_62 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_62 >= 0) &  (`ASI_ADDR_62 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_62 >= 0) &  (`ASI_ADDR_62 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC7.lsu.lmd.lmq6_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_62 == 40'h20) ||  (`ASI_ADDR_62 == 40'h30)
			     || (`ASI_ADDR_62 == 40'h80)  
				 || ((`ASI_ADDR_62 == 40'ha0) & (`SPU_MA_BUSY_7 == 0) & (`SPU_MA_TID_7 == 6))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_62 == 40'h20) ||  (`ASI_ADDR_62 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_62, `ASI_ADDR_62, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_62, {24'b0, `ASI_ADDR_62}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule



module err_c7t7 ();
`ifndef GATESIM

`include "defines.vh"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;

integer junk;
reg ready;
reg update_dsfsr_w, update_dsfsr_fx4, update_dsfsr_fx5;
reg update_dsfsr_fb, update_dsfsr_fw, update_dsfsr_fw1, update_dsfsr_fw2;

reg update_isfsr_w, update_isfsr_fx4, update_isfsr_fx5;
reg update_isfsr_fb, update_isfsr_fw, update_isfsr_fw1, update_isfsr_fw2;

reg update_dfesr_w;

reg take_err_trap_fx4, take_err_trap_fx5, take_err_trap_fb;
reg take_err_trap_fw, take_err_trap_fw1, take_err_trap_fw2;

reg [7:0] int_num_fx4, int_num_fx5, int_num_fb;
reg [7:0] int_num_fw, int_num_fw1, int_num_fw2;

reg sync_asi;
reg chk_if_asi_ld;
reg [63:0] ld_data_w;

reg desr_asi_rd, desr_wr, desr_pend_wr;

assign mycid = 7;
assign mytid = 7;
assign   mytnum = 7*8 + 7;

initial begin  //{
	desr_asi_rd = 1'b0;
	desr_pend_wr = 1'b0;
	ready = 0;
	@(posedge `SPC7.l2clk) ;
	@(posedge `SPC7.l2clk) ;
	ready = `PARGS.err_sync_on;
end //}

`define DSFSR_NEW_IN_63  `SPC7.tlu.ras.dsfsr_7_new_in
`define ISFSR_NEW_IN_63 `SPC7.tlu.ras.isfsr_7_new_in

`define DSFSR_63 `SPC7.tlu.ras.dsfsr_7
`define ISFSR_63 `SPC7.tlu.ras.isfsr_7
`define DSFAR_63 `SPC7.tlu.dfd.dsfar_7

`define ASI_WR_DSFSR_63 `SPC7.tlu.ras.asi_wr_dsfsr[7]
`define ASI_WR_ISFSR_63 `SPC7.tlu.ras.asi_wr_isfsr[7]

`define RAS_WRITE_DESR_1st_63  `SPC7.tlu.dfd.ras_write_desr_1st[7]
`define RAS_WRITE_DESR_2nd_63  `SPC7.tlu.dfd.ras_write_desr_2nd[7]
`define DESR_asi_rd_63  `SPC7.tlu.ras_rd_desr[7]
`define DESR_63  `SPC7.tlu.dfd.desr_7

`define RAS_WRITE_FESR_63  `SPC7.tlu.ras.write_fesr[7]
`define FESR_63  `SPC7.tlu.dfd.fesr_7

`define ST_ERR_63  `SPC7.tlu.trl1.take_ftt & `SPC7.tlu.trl1.trap[3]
`define SW_REC_ERR_63  `SPC7.tlu.trl1.take_ade & `SPC7.tlu.trl1.trap[3]
`define DATA_ACC_ERR_63  `SPC7.tlu.trl1.take_dae & `SPC7.tlu.trl1.trap[3]
`define INST_ACC_ERR_63  `SPC7.tlu.trl1.take_iae & `SPC7.tlu.trl1.trap[3]
`define INT_PROC_ERR_63  `SPC7.tlu.trl1.take_ipe & `SPC7.tlu.trl1.trap[3]
`define HW_CORR_ERR_63  `SPC7.tlu.trl1.take_eer & `SPC7.tlu.trl1.trap[3]
`define INST_ACC_MMU_ERR_63  `SPC7.tlu.trl1.take_ime & `SPC7.tlu.trl1.trap[3]
`define DATA_ACC_MMU_ERR_63  `SPC7.tlu.trl1.take_dme & `SPC7.tlu.trl1.trap[3]

`define LSU_LD_VALID_B	`PROBES7.lsu_ld_valid
`define LSU_TID_DEC_B_63 `PROBES7.lsu_tid_dec_b[7]
`define ASI_LD_63	`SPC7.lsu.lmd.lmq7_pkt[60] & (`SPC7.lsu.lmd.lmq7_pkt[49:48] == 2'b0)
`define ASI_63	`SPC7.lsu.lmd.lmq7_pkt[47:40]
`define ASI_ADDR_63	`SPC7.lsu.lmd.lmq7_pkt[39:0]
`define ASI_LD_DATA_63	`SPC7.lsu_exu_ld_data_b[63:0]
`define ASI_LD_COMP_63	tb_top.nas_top.c7.t7.complete_fw2

//SPU specific - only one SPU per core
`define SPU_MA_BUSY_7	`SPC7.spu.spu_pmu_ma_busy[3]
`define SPU_MA_TID_7	`SPC7.spu.spu_pmu_ma_busy[2:0]

////////////////////////////////////////////////////////////////////////////////
//Capture the status register data from rtl. For disrupting traps,
//rtl can modify the contents of the status register before the
//trap is taken and intp message is sent to Riesling.
//For precise traps, once the status register is updated rtl can't
//change the register again before jumping to the trap handler.
//So, for deferred and disrupting traps, inform Riesling when the
//register is modified while for precise traps wait until Fw2 before
//telling Riesling.

//TLU asserts the flush and input signals in W stage. I latch them at the
//+ve edge of FX4.
 
always @(negedge (`SPC7.l2clk & ready)) 
begin // {
	if (`DESR_asi_rd_63)
		desr_asi_rd <= 1'b1;
	if (desr_asi_rd)
	begin
    	  if (desr_wr)
	    desr_pend_wr <= 1'b1;
	  if (`ASI_LD_COMP_63[2])
	    desr_asi_rd <= 1'b0;
	end

        update_dsfsr_w <= (`DSFSR_NEW_IN_63  != 4'b0) && ~`ASI_WR_DSFSR_63;
        update_isfsr_w <= (`ISFSR_NEW_IN_63  != 3'b0) && ~`ASI_WR_ISFSR_63;
        desr_wr <=  (`RAS_WRITE_DESR_1st_63  || `RAS_WRITE_DESR_2nd_63);
        update_dfesr_w <= `RAS_WRITE_FESR_63;
        take_err_trap_fx4 <= `ST_ERR_63 | `SW_REC_ERR_63  | `DATA_ACC_ERR_63
                           | `INST_ACC_ERR_63 | `INT_PROC_ERR_63
                           | `HW_CORR_ERR_63 | `INST_ACC_MMU_ERR_63
                           | `DATA_ACC_MMU_ERR_63 ;


        if (`ST_ERR_63) int_num_fx4 <= 8'h07;
        if (`SW_REC_ERR_63) int_num_fx4 <= 8'h40;
        if (`DATA_ACC_ERR_63) int_num_fx4 <= 8'h32;
        if (`INST_ACC_ERR_63) int_num_fx4 <= 8'h0A;
        if (`INT_PROC_ERR_63) int_num_fx4 <= 8'h29;
        if (`HW_CORR_ERR_63) int_num_fx4 <= 8'h63;
        if (`INST_ACC_MMU_ERR_63) int_num_fx4 <= 8'h71;
        if (`DATA_ACC_MMU_ERR_63) int_num_fx4 <= 8'h72;

        update_dsfsr_fx4 <= update_dsfsr_w;
        update_dsfsr_fx5 <= update_dsfsr_fx4;
        update_dsfsr_fb <= update_dsfsr_fx5;
        update_dsfsr_fw <= update_dsfsr_fb;
        update_dsfsr_fw1 <= update_dsfsr_fw;
        update_dsfsr_fw2 <= update_dsfsr_fw1;

        update_isfsr_fx4 <= update_isfsr_w;
        update_isfsr_fx5 <= update_isfsr_fx4;
        update_isfsr_fb <= update_isfsr_fx5;
        update_isfsr_fw <= update_isfsr_fb;
        update_isfsr_fw1 <= update_isfsr_fw;
        update_isfsr_fw2 <= update_isfsr_fw1;

        take_err_trap_fx5 <= take_err_trap_fx4;
        take_err_trap_fb <= take_err_trap_fx5;
        take_err_trap_fw <= take_err_trap_fb;
        take_err_trap_fw1 <= take_err_trap_fw;
        take_err_trap_fw2 <= take_err_trap_fw1;

        int_num_fx5 <= int_num_fx4;
        int_num_fb <= int_num_fx5;
        int_num_fw <= int_num_fb;
        int_num_fw1 <= int_num_fw;
        int_num_fw2 <= int_num_fw1;

        if (`PARGS.nas_check_on && `PARGS.err_sync_on) 
	begin // { 
		if ((desr_wr & ~desr_asi_rd) || (desr_pend_wr & ~desr_asi_rd))
		begin //{
			desr_pend_wr <= 1'b0;
        		`PR_INFO ("err_sync", `INFO, "<C%0d T%0d> UPDATE_DESR. Data = %0h", mycid,mytid, {`DESR_63[63:56], 45'b0, `DESR_63[10:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h0, {`DESR_63[63:56], 45'b0, `DESR_63[10:0]});
		end  //}
		//if (update_dfesr_w)
		if (`ST_ERR_63)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DFESR. Data = %0h", mycid,mytid, {2'b0, `FESR_63[61:55], 55'b0});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h4C, 64'h8, {2'b0, `FESR_63[61:55], 55'b0});
		end  //}
		if (update_dsfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_DSFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h18, {60'b0, `DSFSR_63[3:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_63[47:0]});
			
		end  //}
		if (update_isfsr_fw2)
		begin //{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> UPDATE_ISFSR", mycid,mytid);
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h50, 64'h18, {61'b0, `ISFSR_63[2:0]});
        		junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h58, 64'h20, {16'b0, `DSFAR_63[47:0]});
			
		end  //}
		if (take_err_trap_fw2)
		begin	//{
        		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> ERR_TRAP_TAKEN 0x%0h", mycid, mytid, int_num_fw2);
		        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    		end // }
       end // }

end //}

//removing the addr check as the LSU doesn't flag an invalid_asi_exception
//if the addr of diagnostic accesses is not in the valid range. The inst.
//still executes. LSU expects that HP won't use addresses in invalid range.

always @(negedge (`SPC7.l2clk & ready)) 
begin // {
	sync_asi = 1'b0;
	ld_data_w <=  `ASI_LD_DATA_63;

	if (`LSU_LD_VALID_B & `LSU_TID_DEC_B_63)
		chk_if_asi_ld <= 1'b1;
	else
		chk_if_asi_ld <= 1'b0;

	if (chk_if_asi_ld & `ASI_LD_63)
	begin
	     case (`ASI_63)
		8'h66: //ASI_IC_INSTR
		begin
			//if ((`ASI_ADDR_63 >= 0) &  (`ASI_ADDR_63 <= 40'h7ff8))
				sync_asi = 1'b1; 
		end
		8'h67: //ASI_IC_TAG
		begin
			//if ((`ASI_ADDR_63 >= 0) &  (`ASI_ADDR_63 <= 40'h7fe0))
				sync_asi = 1'b1; 
		end
		8'h46:  //ASI_DC_DATA
		begin
			sync_asi = 1'b1; 
		end
		8'h47:  //ASI_DC_TAG
		begin
			//if ((`ASI_ADDR_63 >= 0) &  (`ASI_ADDR_63 <= 40'h7ff0))
				sync_asi = 1'b1; 
		end
		8'h48://IRF ECC
		begin
			//if ((`ASI_ADDR_63 >= 0) &  (`ASI_ADDR_63 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h49://FRF ECC
		begin
			//if ((`ASI_ADDR_63 >= 0) &  (`ASI_ADDR_63 <= 40'hF8))
				sync_asi = 1'b1; 
		end
		8'h4A://STB access, stb ptr can be read also
		begin
			//if ((`ASI_ADDR_63 >= 0) &  (`ASI_ADDR_63 <= 40'h100))
				sync_asi = 1'b1; 
		end
		8'h5A://Tick compare reg
		begin
			//if ((`ASI_ADDR_63 >= 0) &  (`ASI_ADDR_63 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h5B://TSA
		begin
			//if ((`ASI_ADDR_63 >= 0) &  (`ASI_ADDR_63 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h51://MRA
		begin
			//if ((`ASI_ADDR_63 >= 0) &  (`ASI_ADDR_63 <= 40'h38))
				sync_asi = 1'b1; 
		end
		8'h59://scratchpad ecc data read
		begin
			//if ((`ASI_ADDR_63 >= 0) &  (`ASI_ADDR_63 <= 40'h38))
			//syncup the ecc data only. For ecc bit 6 is 0.
			if (~`SPC7.lsu.lmd.lmq7_pkt[6])
				sync_asi = 1'b1; 
		end
		8'h40://cwqcsr,ma_sync access
		begin
			if ((`ASI_ADDR_63 == 40'h20) ||  (`ASI_ADDR_63 == 40'h30)
			     || (`ASI_ADDR_63 == 40'h80)  
				 || ((`ASI_ADDR_63 == 40'ha0) & (`SPU_MA_BUSY_7 == 0) & (`SPU_MA_TID_7 == 7))
				)
				sync_asi = 1'b1; 
		end
		8'h4C://CLESR, CLFESR access
		begin
			if ((`ASI_ADDR_63 == 40'h20) ||  (`ASI_ADDR_63 == 40'h28))
				sync_asi = 1'b1; 
		end
	    endcase
	end

	if (`PARGS.nas_check_on && `PARGS.err_sync_on && sync_asi)
	begin
       		`PR_INFO ("err_sync", `INFO, "<C%0dT%0d> SYNC ASI %0h. VA = %0h, data = %0h", mycid,mytid, `ASI_63, `ASI_ADDR_63, ld_data_w);
       		junk = $sim_send(`PLI_ASI_READ, mytnum ,`ASI_63, {24'b0, `ASI_ADDR_63}, ld_data_w[63:0]);
	end
end	//}
`endif
endmodule

`endif
