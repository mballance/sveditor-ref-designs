// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_mon.v
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
`define LD 5'h0
`define ST 5'h1
`define FP 5'h2
`define PREF 5'h3
`define SWAP 5'h4
`define CASA 5'h5
`define LDSTUB 5'h6
`define FLUSH 5'h7
`define MEMBAR 5'h8
`define LDD 5'h9
`define QLD 5'ha
`define STD 5'hb
`define BLKLD 5'hc
`define BLKST 5'hd
`define ASR_RD_WR 5'he
`define PR_RD_WR 5'hf
`define HPR_RD_WR 5'h10
`define FSR_RD_WR 5'h11

`define USER 2'b00
`define PRIV 2'b01
`define HPRIV 2'b10

`define LOCAL 1'b0
`define FAST 1'b1

`define ASI_AIU_BIS_QUAD_LDD_P 8'h22
`define ASI_AIU_BIS_QUAD_LDD_S 8'h23
`define ASI_NUCLEUS_BIS_QUAD_LDD 8'h27
`define ASI_AIU_BIS_QUAD_LDD_P_LITTLE 8'h2A
`define ASI_AIU_BIS_QUAD_LDD_S_LITTLE 8'h2B
`define ASI_NUCLEUS_BIS_QUAD_LDD_LITTLE 8'h2F
`define ASI_BIS_QUAD_LDD_P 8'hE2
`define ASI_BIS_QUAD_LDD_S 8'hE3
`define ASI_BIS_QUAD_LDD_P_LITTLE 8'hEA
`define ASI_BIS_QUAD_LDD_S_LITTLE 8'hEB
`define ASI_QUAD_LDD 8'h24
`define ASI_QUAD_LDD_REAL 8'h26
`define ASI_QUAD_LDD_L 8'h2C
`define ASI_QUAD_LDD_REAL_L 8'h2E

`define ASI_BLK_AIUP 8'h16
`define ASI_BLK_AIUS 8'h17
`define ASI_BLK_AIUPL 8'h1e
`define ASI_BLK_AIUSL 8'h1f
`define ASI_BLK_P 8'hF0
`define ASI_BLK_S 8'hF1
`define ASI_BLK_PL 8'hF8
`define ASI_BLK_SL 8'hF9
`define ASI_BLK_COMMIT_P 8'hE0
`define ASI_BLK_COMMIT_S 8'hE1

`define PCX_VALID 129
`define PCX_RQTYP 128:124
`define PCX_NC 123
`define PCX_CPU_ID 122:120
`define PCX_THR_ID 119:117 
`define PCX_INV 116
`define PCX_PF 115
`define PCX_BST 115
`define PCX_BIS 114
`define PCX_ADDR 103:64
`define PCX_DATA 63:0

`define PCX_LOAD 5'b0
`define PCX_STORE 5'h1
`define PCX_CAS1 5'h2
`define PCX_CAS2 5'h3
`define PCX_SWAP_LDSTUB 5'h7

`define CPX_VALID 145
`define CPX_RTNTYP 144:141
`define CPX_ERR 139:138
`define CPX_NC 137
`define CPX_THR_ID 136:134
`define CPX_ATM 129
`define CPX_PF 128
`define CPX_LSB_BITS 63:0
`define CPX_INVAL_VEC 95:64
`define CPX_BIS 125

`define INST_VA 47:0
`define MEMOP_VA 95:48
`define INST 127:96
`define MEMOP_PA 167:128
`define LSU_MON_INST 188:168
`define L2_ISS 192:189
`define L2_RESP 196:193
`define L2_ST_ISS 189
`define L2_ACK 190
`define RMO 191
`define ST_SQUASH 192
`define ST_PRIV 194:193
`define ASI_ST_ISS 195
`define INST_ASI 204:197
`define L2_ERR0 206:205
`define L2_ERR1 208:207
`define L2_ERR2 210:209
`define L2_ERR3 212:211

`define TLB_MISS_Pend_Width 127:0
`define LD_Pend_Width 212:0
`define STB_Pend_Width 204:0
`define LAST_INST_Pend_Width 135:0
`define NE 2'b0
`define CE 2'b01
`define UE 2'b10
`define ND 2'b11

`ifdef CORE_0

module lsu_mon_c0;
`ifndef GATESIM

// If vcs_build_args NO_MONITORS, then module will be empty
`ifndef NO_MONITORS

reg imm_asi_vld_e;
reg [7:0] asi_e, imm_asi_e, asi_m, asi_b;
reg dec_altspace_e, dec_altspace_b, dec_altspace_m;
reg [1:0] exu_ecc_b;
reg [1:0] exu_lsu_va_error_b;
reg [2:0] dec_lsu_tid_e, dec_lsu_tid_m, dec_lsu_tid_b, dec_lsu_tid_w;
reg [47:0] inst_pc_e, inst_pc_m, inst_pc_b, inst_pc_w;
reg [31:0] inst_e, inst_m, inst_b;
reg [47:0] vaddr_m, vaddr_b;
reg [63:0] int_st_data_m, int_st_data_b;
reg [63:0] fp_st_sata_fx2;
reg [20:0] lsu_inst_e, lsu_inst_m, lsu_inst_b;
reg mmu_dtlb_reload_d1, mmu_dtlb_reload_d2;

reg [7:0] ld_valid;
reg [7:0] tlb_valid;
reg [`LD_Pend_Width] ld_pend_array[7:0];
reg [`LAST_INST_Pend_Width] last_inst_array[7:0];
reg [2:0] wrptr[7:0];  //Pts. to the STB entry into which data will be written next
reg [2:0] rdptr[7:0];  //Tracks the dealloc signal from STB
reg [2:0] iss_ptr[7:0];	//keeps track of when a store is issued from the STB to PCX
reg [2:0] ret_ptr[7:0]; //keeps track of when the response is received from 
			//the L2c.
reg [63:0] stb_valid;
reg [`STB_Pend_Width] stb[63:0];
//reg [`TLB_MISS_Pend_Width] tlbmiss_pend_array[7:0];

reg [7:0] pf_cnt[7:0];
reg [7:0] dcache_inv_cnt[7:0];
reg [7:0] st_rmo_cnt[7:0];

reg [55:0] print_inst;

reg [31:0] dec_tg0_inst_d, dec_tg1_inst_d;

reg [7:0] lsu_bst_active;
reg store_alloc;
reg [3:0] bst_cnt;
reg [195:0] stb_alloc_data;
reg [195:0] bst_data, bst_inst_data;
reg [2:0] bst_active_thid;
reg bst_fgu_err;
				
reg [7:0] is_blkld;  //reqd by lsu_ras_chkr to chk errors on blk ld.
reg [1:0] l2_blk_ld_errtype[7:0]; //Gives the type of err the ahd be reported by LSU if 
				 //different types of err occur on blk ld helper returns
reg [1:0] st_priv[7:0]; //Gives the final priv level for an sbdiou/sbapp err that shd be 
			//stored in DFESR

wire [2:0] core_id = 0;

integer i;
integer err_cnt;

reg enabled;
reg reset_in_middle;
reg [7:0] finish_mask;

initial
begin
    enabled = 0;
    reset_in_middle = 0;
	ld_valid = 8'b0;
	lsu_inst_e = 0;
	tlb_valid = 8'b0;
	for (i = 0; i < 8; i = i+1)
	begin
		pf_cnt[i] = 0;
		dcache_inv_cnt[i] = 0;
		wrptr[i] = 0;
		rdptr[i] = 0;
		iss_ptr[i] = 0;
		ret_ptr[i] = 0;
		st_rmo_cnt[i] = 0;
		is_blkld[i] = 1'b0;
		st_priv[i] = 2'b0;
		l2_blk_ld_errtype[i] = 2'b0;
	end
	lsu_bst_active = 8'b0;
	store_alloc = 1'b0;
	bst_cnt = 4'b0;
	stb_valid = 64'b0;

    // avoid time zero ugliness. jp
    //@(posedge `SPC0.l2clk);
    //@(negedge `SPC0.l2clk);
    //if (`PARGS.lsu_mon_on) enabled = 1;

    case (core_id)
	3'h0: finish_mask = `PARGS.finish_mask[7:0];
	3'h1: finish_mask = `PARGS.finish_mask[15:8];
	3'h2: finish_mask = `PARGS.finish_mask[23:16];
	3'h3: finish_mask = `PARGS.finish_mask[31:24];
	3'h4: finish_mask = `PARGS.finish_mask[39:32];
	3'h5: finish_mask = `PARGS.finish_mask[47:40];
	3'h6: finish_mask = `PARGS.finish_mask[55:48];
	3'h7: finish_mask = `PARGS.finish_mask[63:56];
    endcase
end

always @ (`TOP.in_reset)
begin
	if (~`TOP.in_reset & `PARGS.lsu_mon_on & ~reset_in_middle)
	begin
		enabled = 1'b1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "Lsu_mon on, in_reset = 0.");
	end
		

	if (`TOP.in_reset & enabled)
	begin
		reset_in_middle = 1'b1;
		enabled = 1'b0;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "Reset asserted in the middle of the diag. Turned off Lsu_mon.");
	end
end

always @ (posedge (tb_top.sim_status[0] & enabled))
begin //{
	if (|(ld_valid[7:0] & finish_mask[7:0]))
	begin  //{
	   for (i = 0; i < 8; i=i+1)
	   begin
		if (ld_valid[i])  
		begin
		   DispPendReq(i);
	        end
	   end
	  `PR_ERROR("lsu_mon", `ERROR, "<C%h> Ld requests pending at the end of simulation. ld_valid = %0h", core_id, ld_valid);
	end  //}
	if (|stb_valid[63:0])
	begin  //{
	   err_cnt = 0;
	   for (i = 0; i < 64; i=i+1)
	   begin
		if (stb_valid[i] & finish_mask[i[5:3]])  
		begin
		//chkr resets the stb valid bits when block_store_kill is asserted.
		//in couple of failures block_store_kill was sampled asserted two cycles after
		//lsu asserted stb_empty. The simulation ended the cycle stb_empty was sampled high 
		//causing moniotr firings with valid entries in stb at end of simulation. Now
		//don't flag an error if squash bit is set and stb_valid is asserted at end
		//of simualation.
		      if (~is_squash_bit_set(i[5:0]))
		      begin
			err_cnt = err_cnt + 1;
			Disp_STB_entry(i[5:3],i[2:0]);
		      end
		end
	   end
	   if (err_cnt)
	   begin
	  	`PR_ERROR("lsu_mon", `ERROR, "<C%h> Store requests pending at the end of simulation. stb_valid = %0h", core_id, stb_valid);
	   end
       end  //}
       err_cnt = 0;
       for (i = 0; i < 8; i=i+1)
       begin  //{
	   if (finish_mask[i] & (pf_cnt[i] != 0))
	   begin
		err_cnt = 1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> Prefetches not finished. Pf_cnt = %0d", core_id, i, pf_cnt[i]);
	   end
	   if (finish_mask[i] & (dcache_inv_cnt[i] != 0))
	   begin
		err_cnt = 1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> D pkt not received for all invalidate reqs. issued by the thread. dcache_inv_cnt = %0d", core_id, i, dcache_inv_cnt[i]);
	   end
	   if (finish_mask[i] & (st_rmo_cnt[i] != 0))  
	   begin
		err_cnt = 1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> rmo_cnt not zero. rmo_cnt = %0d", core_id, i, st_rmo_cnt[i]);
	   end
       end  //}
       if (err_cnt)
       begin
	  `PR_ERROR("lsu_mon", `ERROR, "<C%h> Prefetch/D/RMO_stores requests pending at the end of simulation.", core_id);
       end
end //}

function is_squash_bit_set;
input [5:0] index;
reg [204:0] tmp;
begin
	tmp = stb[index];
	if (tmp[`ST_SQUASH])
		is_squash_bit_set = 1'b1;
	else
		is_squash_bit_set = 1'b0;
end
endfunction


always @ (negedge (`SPC0.l2clk & enabled))
begin //{

	asi_e  = `SPC0.lsu.dcc.dcc_asi_e[7:0];

	lsu_inst_e[`LD] <= `SPC0.dec_ld_inst_e;
	lsu_inst_e[`ST] <= `SPC0.dec_st_inst_e;
	lsu_inst_e[`FP] <= `SPC0.dec_fpldst_inst_e;
	lsu_inst_e[`PREF] <= `SPC0.dec_pref_inst_e;
	lsu_inst_e[`SWAP] <= `SPC0.dec_swap_inst_e;
	lsu_inst_e[`CASA] <= `SPC0.dec_casa_inst_e;
	lsu_inst_e[`LDSTUB] <= `SPC0.dec_ldstub_inst_e;
	lsu_inst_e[`FLUSH] <= `SPC0.dec_flush_inst_e;
	lsu_inst_e[`MEMBAR] <= `SPC0.dec_memstbar_inst_e;
	lsu_inst_e[`LDD] <= `SPC0.dec_ld_inst_e & `SPC0.dec_ldst_dbl_e & ~`SPC0.dec_fpldst_inst_e;
	lsu_inst_e[`STD] <= `SPC0.dec_st_inst_e & `SPC0.dec_ldst_dbl_e & ~`SPC0.lsu.dec_fpldst_inst_e;

       lsu_inst_e[`BLKLD] <= `SPC0.dec_ld_inst_e & `SPC0.dec_fpldst_inst_e & dec_altspace_e & Is_blk_asi(asi_e);
	lsu_inst_e[`BLKST] <= `SPC0.dec_st_inst_e & `SPC0.dec_fpldst_inst_e & dec_altspace_e & Is_blk_asi(asi_e);
	lsu_inst_e[`QLD] <= `SPC0.dec_ld_inst_e & dec_altspace_e & Is_qld_asi(asi_e);
	lsu_inst_e[`ASR_RD_WR] <= `SPC0.dec_sr_inst_e & (`SPC0.dec_ld_inst_e | `SPC0.dec_st_inst_e);
	lsu_inst_e[`PR_RD_WR] <= `SPC0.dec_pr_inst_e & (`SPC0.dec_ld_inst_e | `SPC0.dec_st_inst_e);
	lsu_inst_e[`HPR_RD_WR] <= `SPC0.dec_hpr_inst_e & (`SPC0.dec_ld_inst_e | `SPC0.dec_st_inst_e);
	lsu_inst_e[`FSR_RD_WR] <= `SPC0.dec_fsr_ldst_e & (`SPC0.dec_ld_inst_e | `SPC0.dec_st_inst_e);
end //}

always @ (posedge (`SPC0.l2clk & enabled))
begin //{
	dec_tg0_inst_d <= `SPC0.dec.ded0.decode_mux[31:0];
	dec_tg1_inst_d <= `SPC0.dec.ded1.decode_mux[31:0];
	imm_asi_vld_e <= `SPC0.lsu.dec_imm_asi_vld_d;

	imm_asi_e <= `SPC0.lsu.dec_imm_asi_d;
	dec_altspace_e <= `SPC0.dec_altspace_d;
	dec_altspace_m <= dec_altspace_e;
	dec_altspace_b <= dec_altspace_m;

	exu_ecc_b <= `SPC0.exu_ecc_m;
	exu_lsu_va_error_b <= `SPC0.exu_lsu_va_error_m;

	dec_lsu_tid_e <= `SPC0.dec_lsu_tg_d ? {1'b1, `SPC0.dec_lsu_tid1_d} : {1'b0, `SPC0.dec_lsu_tid0_d}; 	
	dec_lsu_tid_m <= dec_lsu_tid_e;
	dec_lsu_tid_b <= dec_lsu_tid_m;
	dec_lsu_tid_w <= dec_lsu_tid_b;
	
	inst_pc_e <= `SPC0.dec_lsu_tg_d ? {`SPC0.tlu.tlu_pc_1_d[47:2], 2'b0} : {`SPC0.tlu.tlu_pc_0_d[47:2], 2'b0};
	inst_pc_m <= inst_pc_e;
	inst_pc_b <= inst_pc_m;
	inst_pc_w <= inst_pc_b;
	
	inst_e <= `SPC0.dec_lsu_tg_d ? dec_tg1_inst_d : dec_tg0_inst_d;
	inst_m <= inst_e;
	inst_b <= inst_m;

	vaddr_m <= `SPC0.exu_lsu_address_e;
	vaddr_b <= vaddr_m;

	int_st_data_m <= `SPC0.exu_lsu_store_data_e;
	int_st_data_b <= int_st_data_m;
	fp_st_sata_fx2 <= `SPC0.fgu_lsu_fst_data_fx1;

	mmu_dtlb_reload_d1 <= `SPC0.mmu_dtlb_reload;
	mmu_dtlb_reload_d2 <= mmu_dtlb_reload_d1;

	//pcx_thid_d1 <=  `SPC0.lsu.spc_pcx_data_pa[`PCX_THR_ID];
	lsu_inst_m <= lsu_inst_e;
	lsu_inst_b <= lsu_inst_m;

	asi_m <= asi_e;
	asi_b <= asi_m;
end //}

function Is_blk_asi;
input [7:0] asi;
begin
	Is_blk_asi = (asi == `ASI_BLK_AIUP) | (asi == `ASI_BLK_AIUS) | 
		   (asi == `ASI_BLK_AIUPL) | (asi == `ASI_BLK_AIUSL) |
		   (asi == `ASI_BLK_P) | (asi == `ASI_BLK_S) |
		   (asi == `ASI_BLK_PL) | (asi == `ASI_BLK_SL) |
		   (asi == `ASI_BLK_COMMIT_P) | (asi == `ASI_BLK_COMMIT_S);
end
endfunction

function Is_qld_asi;
input [7:0] asi;
begin
 		Is_qld_asi = (asi == `ASI_AIU_BIS_QUAD_LDD_P) | (asi == `ASI_AIU_BIS_QUAD_LDD_S) |
		(asi == `ASI_AIU_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_AIU_BIS_QUAD_LDD_S_LITTLE) |
		(asi == `ASI_NUCLEUS_BIS_QUAD_LDD) | (asi == `ASI_NUCLEUS_BIS_QUAD_LDD_LITTLE) |
		(asi == `ASI_BIS_QUAD_LDD_P) | (asi == `ASI_BIS_QUAD_LDD_S) |
		(asi == `ASI_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_BIS_QUAD_LDD_S_LITTLE) |
		(asi == `ASI_QUAD_LDD) | (asi == `ASI_QUAD_LDD_REAL) |
		(asi == `ASI_QUAD_LDD_L) | (asi == `ASI_QUAD_LDD_REAL_L);
end
endfunction

function Is_bis_asi;
input [7:0] asi;
begin
 		Is_bis_asi = (asi == `ASI_AIU_BIS_QUAD_LDD_P) | (asi == `ASI_AIU_BIS_QUAD_LDD_S) |
		(asi == `ASI_AIU_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_AIU_BIS_QUAD_LDD_S_LITTLE) |
		(asi == `ASI_NUCLEUS_BIS_QUAD_LDD) | (asi == `ASI_NUCLEUS_BIS_QUAD_LDD_LITTLE) |
		(asi == `ASI_BIS_QUAD_LDD_P) | (asi == `ASI_BIS_QUAD_LDD_S) |
		(asi == `ASI_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_BIS_QUAD_LDD_S_LITTLE);
end
endfunction

always @ (negedge (`SPC0.l2clk & enabled))
begin //{
	Chk_store;
	store_alloc = 1'b0;
	if (lsu_inst_m != 0)
	begin
		if (`SPC0.dec_flush_lm)
		begin
			lsu_inst_m <= 0;
			`PR_INFO("lsu_mon", 21, "<C%0h> <T%0h> <%0h> M_stage: %s(VA=%0h) Flushed due to IFU Flush.", core_id, dec_lsu_tid_m, inst_pc_m, tb_top.intf0.xlate(inst_m),vaddr_m);
		end
	end
		
	if (lsu_inst_b != 0)
	begin //{
		if (lsu_inst_b[`BLKLD])  print_inst = " BLKLD,";
		else if (lsu_inst_b[`BLKST])  print_inst = " BLKST,";
		else if (lsu_inst_b[`QLD])  print_inst = " QLD,";
		else  print_inst = "";

		if (`SPC0.dec_flush_lb)
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%0h> <T%0h> <%0h> B_stage: %s(VA=%0h) Flushed due to IFU Flush.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		else if (`SPC0.tlu_flush_lsu_b)
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h) Flushed due to TLU Flush.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		//casa is a two cycle operation. If there is an err on the 2nd cycle of casa then also
		//casa shd be killed.
		//This function will also chk for errors on 2nd cycle.
		else if (Is_exu_error(exu_lsu_va_error_b, exu_ecc_b))  
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h <%0h> B_stage: %s(VA=%0h) Flushed due to EXU error.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		else if ((`SPC0.fgu_cecc_fx2 || `SPC0.fgu_uecc_fx2) && lsu_inst_b[`ST] && lsu_inst_b[`FP]) 
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h) Flushed due to FGU error.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		else if (IsExc(core_id)) 
			lsu_inst_b <= 0;
		else if (!`SPC0.lsu_tlb_miss_b_)
		begin
			`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h)%s ASI = %0h. DTLB miss.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, asi_b);
				//Insert_tlb_miss_info;
		end
		else 
		begin //{
		//Lsu doesn't assert lsu_sync for an exception or dtlb miss. Since for
		//an exception tlu anyway tells the front end to flush itself there is 
		//no reason for LSU to flush the front end then TLU to flush it again.
		//Lsu treats the dtlbmiss as an exception that it flushes the  inst and
		//handles it when it is reissued by the front end.

		   if (`SPC0.lsu_tlb_bypass_b)
		   begin
			if (`SPC0.lsu_sync != 8'b0)
			begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. LSU_sync. DTLB Bypass.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC0.lsu.tlb_pgnum[39:13], vaddr_b[12:0]},  asi_b);
			end
			else
			begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. DTLB Bypass.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC0.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b);
			end
		  end
	          else
		  begin
			if (`SPC0.lsu_sync != 8'b0)
			begin
			  if (lsu_inst_b[`ST])
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h, Store_data = %0h. LSU_sync. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC0.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b,int_st_data_b);
			  end
			  else
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. LSU_sync. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC0.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b);
			  end
			end
			else
			begin
			  if (lsu_inst_b[`ST])
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h, Store_data = %0h. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC0.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b, int_st_data_b);
			  end
			  else
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC0.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b);
		          end
		        end
		  end

	          if (lsu_inst_b[`LD] || lsu_inst_b[`PREF] || lsu_inst_b[`SWAP] || lsu_inst_b[`CASA] || lsu_inst_b[`LDSTUB])
		  begin //{
			if (((lsu_inst_b == 16'h1) || (lsu_inst_b == 16'h5)) & `SPC0.lsu.stb_cam_hit)
			begin
				`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h>: LSU_sync asserted due to STB RAW.", core_id, dec_lsu_tid_b, inst_pc_b);
			end
		  end //}

		  if (lsu_inst_b[`LD])
			Insert_ld_miss_info;

		  if (lsu_inst_b[`ST])  //for atomics both ld and store signals are asserted
		  begin
			Make_STB_data;
			store_alloc = 1'b1;
		  end
		  Insert_in_last_inst_array;

		if (`SPC0.lsu_trap_flush[7:0])
		begin
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h> Trap Flush asserted.", core_id, decode_tid(`SPC0.lsu_trap_flush[7:0]));
		end
	    end //}
	end //}
end //}

//STB ue testing:
//This is how we test squashing of stores by LSU_mon:
//Whenever lsu asserts err_sbdiou signal, the monitor sets the squash
//bit in the STB for the rest of the stores. If any of these squashed stores
//is issued on the asi ring or to the PCX interface the monitor complains.
//The squashed stores are deallocated when either a block_store_kill is
//asserted or dealloc signals are asserted by the LSU.
//When the block_store_kill is asserted, it tells the IFU to dealloc
//all the pending stores in the IFU. It means the when block_store_kill
//is asserted we have deallocated all the non-squashed requests from STB.
//The 0in_chkr ensures that LSU flags the correct index and priv with the
//the sbdiou signal to TLU.


always @ (negedge (`SPC0.l2clk & enabled))
begin
	if (`SPC0.lsu_l15_valid & `SPC0.lsu.spc_pcx_data_pa[129])
		Chk_pcx_req_pkt(`SPC0.lsu.spc_pcx_data_pa[129:0]);  //chk if we need .lsu here
	if ((`SPC0.lsu_rngl_cdbus[64:63] == 2'b11) & ~`SPC0.lsu_rngl_cdbus[59])
		Chk_st_on_ASI_ring(`LOCAL);

	if ((`SPC0.lsu_rngf_cdbus[64:63] == 2'b11) & ~`SPC0.lsu_rngf_cdbus[59])
		Chk_st_on_ASI_ring(`FAST);

	//if (`SPC0.l15_lsu_valid)
		//Chk_cpx_response_pkt({`SPC0.l15_lsu_valid, `SPC0.l15_lsu_cpkt[17:13],`SPC0.l15_lsu_cpkt[11:0],`SPC0.l15_spc_data1[127:0]});
	
	if (`SPC0.cpx_spc_data_cx[145])
		Chk_cpx_response_pkt(`SPC0.cpx_spc_data_cx);
	
	if (`SPC0.lsu_complete[7:0] != 8'b0)
	begin
		if (`SPC0.lsu_complete[0]) Chk_ld_complete(0);
		if (`SPC0.lsu_complete[1]) Chk_ld_complete(1);
		if (`SPC0.lsu_complete[2]) Chk_ld_complete(2);
		if (`SPC0.lsu_complete[3]) Chk_ld_complete(3);
		if (`SPC0.lsu_complete[4]) Chk_ld_complete(4);
		if (`SPC0.lsu_complete[5]) Chk_ld_complete(5);
		if (`SPC0.lsu_complete[6]) Chk_ld_complete(6);
		if (`SPC0.lsu_complete[7]) Chk_ld_complete(7);
	end
	
	if (`SPC0.lsu_block_store_kill[7:0] != 8'b0)
	begin
		if (`SPC0.lsu_block_store_kill[0]) Squash_STB(0);
		if (`SPC0.lsu_block_store_kill[1]) Squash_STB(1);
		if (`SPC0.lsu_block_store_kill[2]) Squash_STB(2);
		if (`SPC0.lsu_block_store_kill[3]) Squash_STB(3);
		if (`SPC0.lsu_block_store_kill[4]) Squash_STB(4);
		if (`SPC0.lsu_block_store_kill[5]) Squash_STB(5);
		if (`SPC0.lsu_block_store_kill[6]) Squash_STB(6);
		if (`SPC0.lsu_block_store_kill[7]) Squash_STB(7);
	end
	
	if (`SPC0.lsu_stb_dealloc[7:0] != 8'b0)
	begin
		if (`SPC0.lsu_stb_dealloc[0]) Dealloc_STB(0);
		if (`SPC0.lsu_stb_dealloc[1]) Dealloc_STB(1);
		if (`SPC0.lsu_stb_dealloc[2]) Dealloc_STB(2);
		if (`SPC0.lsu_stb_dealloc[3]) Dealloc_STB(3);
		if (`SPC0.lsu_stb_dealloc[4]) Dealloc_STB(4);
		if (`SPC0.lsu_stb_dealloc[5]) Dealloc_STB(5);
		if (`SPC0.lsu_stb_dealloc[6]) Dealloc_STB(6);
		if (`SPC0.lsu_stb_dealloc[7]) Dealloc_STB(7);
	end

	if (`SPC0.lsu_block_store_stall)
	      Chk_block_store;

	if (`SPC0.lsu.lsu_block_store_alloc[7:0] != 8'b0)
		Set_block_store_parameters;

	if (`SPC0.lsu_sbdiou_err_g || `SPC0.lsu_sbapp_err_g)
		Squash_store;

	if (`SPC0.lsu_stb_flush_g)
		st_priv[`SPC0.lsu_stberr_tid_g] = get_priv_on_flush(`SPC0.lsu_stberr_tid_g);
end

function [1:0] get_priv_on_flush;
input [2:0] tid;
reg [2:0] sq_index;
reg [204:0] tmp;

begin
	sq_index = `SPC0.lsu_stberr_index_g;
	tmp = stb[{tid, sq_index}];
	get_priv_on_flush = tmp[`ST_PRIV];
end
endfunction

task Chk_block_store;
reg [20:0] inst;
reg [2:0] thid;
begin
		thid = `SPC0.lsu_block_store_tid;
		bst_inst_data = stb[{thid, rdptr[thid]}];
		inst = bst_inst_data[`LSU_MON_INST];

		if (~inst[`BLKST])
		begin
			Disp_STB_entry(thid, iss_ptr[thid]);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted blk_store_stall while the req at the top of STB is not blkst as shown above", core_id, thid);
		end
end
endtask

//lsu can assert block_store_stall for a new block store while it has not yet written
//the 8 stb entries from the previous blk store.

task Set_block_store_parameters;
reg [2:0] thid;
begin
	
		thid = decode_tid(`SPC0.lsu.lsu_block_store_alloc[7:0]);
		if (lsu_bst_active[thid])
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted blk_store_alloc while the bst_active is already set for this thread.", core_id, thid);
		end
		else
		begin
			lsu_bst_active[thid] = 1'b1;
			bst_active_thid = thid;
			if (`SPC0.lsu.fgu_fst_ecc_error_fx2)
			    bst_fgu_err = 1'b1;
			else
			    bst_fgu_err = 1'b0;
		end
end
endtask

task Squash_store;
reg [2:0] thid;
reg [2:0] sq_index;
reg [2:0] i;
reg [204:0] tmp;
reg [3:0] squash_cnt;
reg [1:0] priv;

begin
	thid = `SPC0.lsu_stberr_tid_g;
	sq_index = `SPC0.lsu_stberr_index_g;
	priv = `SPC0.lsu_stberr_priv_g;
	tmp = stb[{thid, sq_index}];
	squash_cnt = 0;
     	`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Sbdiou/sbapp seen for index = %h and priv = %h.", core_id, thid, sq_index,  priv);

	st_priv[thid] = tmp[`ST_PRIV];

	//lsu can assert deallocate before it asserts the sbdiou signal. 
	//In that case iss_ptr won't be equal to sbdiou index.
	//if (sq_index != iss_ptr[thid])
	//begin
	//	Disp_STB_entry(thid, iss_ptr[thid]);
	//	`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted sbdiou/sbapp with index %0h while the next req to be issued is at index %0h.", core_id, thid, sq_index, iss_ptr[thid]);
	//end
	
	//If there is only one store in the store buffer which gets an sbdiou error, then LSU can deallocate
	//the store and then assert sbdiou. The deallocation will cause the stb issue_ptr to move 
	//forward to an inst. that has already been issued and completed and this chk can fire. So
	//removing this chk. 

        //if (tmp[`L2_ST_ISS])
        //begin
         //       Disp_STB_entry(thid, iss_ptr[thid]);
          //      `PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store reissued on the PCX interface.", core_id, thid, tmp[`MEMOP_PA]);
        //end

	if (iss_ptr[thid] == wrptr[thid])
	begin
	    if (stb_valid[{thid, wrptr[thid]}])
		squash_cnt = 8;
	    else
	    begin
	    //changing it to an info message because if there is only one valid entry in store buffer that
	    //gets an sbdiou then LSU can deallocate the entry and then issue sbdiou.
              	//`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Lsu asserted sbdiou/sbapp while there are no valid entries in STB to be issued.", core_id, thid);
              	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> sbdiou/sbapp squashed only one entry in STB.", core_id, thid);
	    end
	end
	else
	begin
	  if (iss_ptr[thid] < wrptr[thid])
		squash_cnt = wrptr[thid] - iss_ptr[thid];
	  else if (iss_ptr[thid] > wrptr[thid])
		squash_cnt = wrptr[thid] + (8 - iss_ptr[thid]);
	end
	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> SQUASH_STORE:iss_ptr = %0h, wrptr = %0h, squash_cnt = %0h.", core_id, thid, iss_ptr[thid], wrptr[thid], squash_cnt);

	i = iss_ptr[thid];
		
	while (squash_cnt)
	begin
		tmp = stb[{thid, i}];
		tmp[`ST_SQUASH] = 1'b1;
		if (priv < tmp[`ST_PRIV])
		begin
              		`PR_INFO("lsu_mon", `INFO, "<C%h> <T%0h> <PA = %0h> Sbdiou/sbapp signalled. Err in user/priv level store is squashing a higher priv level store.", core_id, thid, tmp[`MEMOP_PA]);
			priv = tmp[`ST_PRIV];
		end
			
		stb[{thid, i}] = tmp;
               	`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <PA = %0h> STB_entry[%0h] squashed.", core_id, thid, tmp[`MEMOP_PA], i);
	   	 
		 i = i + 1;
		 squash_cnt = squash_cnt - 1'b1;
	end
end
endtask

function [2:0] decode_tid;
input [7:0] thid_encode;
begin
	case (thid_encode)
	   8'h1: decode_tid = 3'b0;
	   8'h2: decode_tid = 3'h1;
	   8'h4: decode_tid = 3'h2;
	   8'h8: decode_tid = 3'h3;
	   8'h10: decode_tid = 3'h4;
	   8'h20: decode_tid = 3'h5;
	   8'h40: decode_tid = 3'h6;
	   8'h80: decode_tid = 3'h7;
	   default: 
	   begin
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> decode_tid. Incorrect value of thid input = %0h.", core_id, thid_encode, thid_encode);
	   end
	endcase
end
endfunction

task Chk_ld_complete;
input [2:0] thid;
reg [`LD_Pend_Width] tmp;
begin
	tmp = ld_pend_array[thid];

	if (ld_valid[thid])
	begin
		if ((tmp[`L2_ISS] != 4'hf) || (tmp[`L2_RESP] != 4'hf))
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted lsu_complete while the l2_iss and l2_resp bits are not F.", core_id, thid);
		end
		ld_valid[thid] = 1'b0;
		`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h> %s(VA=%0h) Complete. Setting ld_valid to 0.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
	end

	tmp = last_inst_array[thid];
	`PR_INFO("lsu_mon", 24, "<C%h> <T%0h> <%0h> %s(VA=%0h) Complete.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
end
endtask
	
task Chk_pcx_req_pkt;
input [129:0] pcx_pkt;
reg [2:0] thid;
reg [`LD_Pend_Width] tmp, tmp1; 
reg [15:0] inst; 
reg [11*8:0] req;
reg [39:0] addr;
begin 
	thid = pcx_pkt[`PCX_THR_ID]; 
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	req = DispPCXReq(pcx_pkt);
	addr = pcx_pkt[`PCX_ADDR];


	if (pcx_pkt[`PCX_CPU_ID] != core_id)
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> cpu_id (spc_pcx_data_pa[122:120]) = %h is not = %0h when the lsu made a %s req to gasket.", core_id, pcx_pkt[`PCX_THR_ID], addr, pcx_pkt[122:120], core_id, req);
	
	
	if ((pcx_pkt[`PCX_RQTYP] == `PCX_LOAD) || (pcx_pkt[`PCX_RQTYP] == `PCX_CAS1) || (pcx_pkt[`PCX_RQTYP] == `PCX_CAS2) || (pcx_pkt[`PCX_RQTYP] == `PCX_SWAP_LDSTUB))
	begin
	  if (~ld_valid[thid])
	  begin
		ld_valid[thid] = 1'b1;  //we have sent a req to gasket and are waiting for response
		`PR_INFO("lsu_mon", 22, "<C%0h> <T%0h> Setting ld_valid[%0h].", core_id, thid, thid);
	  end
		if (~inst[`BLKLD])
		begin
			if (tmp[`MEMOP_PA] != addr)
			begin
				if ((tmp[`INST_ASI] == 8'h41) || (tmp[`INST_ASI] == 8'h73) || ((tmp[`INST_ASI] == 8'h45) && ((tmp[`MEMOP_PA] == 8'h10) || (tmp[`MEMOP_PA] == 8'h18))))
				begin
					`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <PA = %0h> PA mismatch on gasket for %s request. Ignoring the mismatch as inst. is issued with asi 41, 73 or 45 (with VA 0x10 or 18).", core_id, thid, addr, req);
				end
				else
				begin
					DispPendReq(thid);
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A %s request made to gasket by LSU while the pending req is with PA %0h.", core_id, thid, addr, req, tmp[`MEMOP_PA]);
				end
			end
		end
	end

	case (pcx_pkt[`PCX_RQTYP])
	   `PCX_LOAD: 
	   begin
		if (pcx_pkt[`PCX_PF])
		begin
			if (~inst[`PREF])
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A prefetch request made to gasket by LSU which mismatches the pending request from the thread.", core_id, thid, addr);
			end
			if (pcx_pkt[`PCX_INV])
			begin
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: PREF_ICE(VA=%0h) Issued. pf_cnt not updated.", core_id, thid, tmp[`INST_VA], tmp[`MEMOP_VA]);
			end
			else
			begin
			 	pf_cnt[thid] = pf_cnt[thid] + 1'b1;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Issued. pf_cnt = %0d.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], pf_cnt[thid]);
			end
			tmp[`L2_ISS] = 4'hF;
			tmp[`L2_RESP] = 4'hF; //we don't wait for a prefetch response from gasket
			ld_pend_array[thid] = tmp;
		end
		else 
		begin
			if (pcx_pkt[`PCX_INV])
			begin
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Dcache invalidate pkt issued to CCX.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
				dcache_inv_cnt[thid] = dcache_inv_cnt[thid] + 1'b1;
			end
			else
			begin
				Chk_req_load(pcx_pkt);
			end
		end
	    end
           `PCX_CAS1, `PCX_CAS2:
	   begin
		if (~inst[`CASA])
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> CASA request made to gasket by LSU while no such request request is pending from this thread.", core_id, thid, addr);
		end
		if (pcx_pkt[`PCX_RQTYP] == `PCX_CAS1)
		begin
			tmp[`L2_ISS] = 4'hE;
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) (CAS1) Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			ld_pend_array[thid] = tmp;
		end
		if (pcx_pkt[`PCX_RQTYP] == `PCX_CAS2)
		begin
			tmp[`L2_ISS] = 4'hF;
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) (CAS2) Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			ld_pend_array[thid] = tmp;
			chk_store_issue_to_pcx(pcx_pkt);
		end
		
	   end
	   `PCX_SWAP_LDSTUB:
	   begin
		if (~inst[`SWAP] && ~inst[`LDSTUB])
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> %s request made to gasket by LSU while no such request request is pending from this thread.", core_id, thid, addr, req);
		end
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Issued to gasket. store_data = %0h", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], pcx_pkt[`PCX_DATA]);
		tmp[`L2_ISS] = 4'hF;
		ld_pend_array[thid] = tmp;
		
		chk_store_issue_to_pcx(pcx_pkt);
	   end

	    `PCX_STORE:
	    begin
		chk_store_issue_to_pcx(pcx_pkt);
	    end
	   
	   default: `PR_INFO("lsu_mon", 21, "<C%h> <T%0h> <%0h>: %s Issued to gasket.", core_id, thid, addr, req);
	endcase
end
endtask

task Chk_cpx_response_pkt;
input [145:0] cpx_pkt;
reg [2:0] thid;
begin
	thid = cpx_pkt[`CPX_THR_ID];	

	casex ({cpx_pkt[`CPX_RTNTYP], cpx_pkt[`CPX_ERR], cpx_pkt[`CPX_NC], cpx_pkt[`CPX_ATM], cpx_pkt[`CPX_PF]})
	  {4'b0, 2'bxx, 1'bx, 1'b0, 1'b0}:  
	  begin
		chk_ccx_ld_response(cpx_pkt);
	  end

	  {4'b0, 2'bxx, 1'b1, 1'b0, 1'b1}:  
	  begin
		if (pf_cnt[thid] == 8'b0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Prefetch response received from gasket while the pf_cnt is 0 for this thread.", core_id, thid);
		end
		else
		begin
			pf_cnt[thid] = pf_cnt[thid] - 1'b1;
			`PR_INFO("lsu_mon", 26, "<C%h> <T%0h> Prefetch response received. pfcnt = %0d.", core_id, thid, pf_cnt[thid]);
		end
	  end
	  
	  {4'h8, 2'bxx, 1'b1, 1'b0, 1'b0}:  
		chk_ccx_ld_response(cpx_pkt);

	  {4'h4, 2'bxx, 1'bx, 1'b0, 1'b0}:  
	   begin
	      if (cpx_pkt[123])  //D pkt
	      begin //{
		if (cpx_pkt[120:118] != core_id)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> D response received from gasket with core_id =%h.", core_id, thid, cpx_pkt[120:118]);
		end
		if (dcache_inv_cnt[thid] == 8'b0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> D response received from gasket while the Dcache_inv_cnt is 0 for this thread.", core_id, thid);
		end
		else
		begin
			dcache_inv_cnt[thid] = dcache_inv_cnt[thid] - 1'b1;
			`PR_INFO("lsu_mon", 26, "<C%h> <T%0h> D response received. Dcache_inv_cnt = %0d.", core_id, thid, dcache_inv_cnt[thid]);
		end
	     end  //}
	     else if (cpx_pkt[124])  //I pkt
	     begin
		if (cpx_pkt[120:118] != core_id)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> I response received from gasket with core_id =%h.", core_id, thid, cpx_pkt[120:118]);
		end
		//`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> I pkt.", core_id, thid);
	     end
	     else if (cpx_pkt[124:123] == 2'b0)
	     begin
		if (cpx_pkt[120:118] == core_id)
		begin
			chk_ccx_st_response(cpx_pkt);
	        end
		else
		begin
			`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Store Ack pkt received from core %0h.", core_id, thid, cpx_pkt[120:118]);
		end
	     end
	   end

	  {4'h1, 2'bxx, 1'bx, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> IFILL1 return.", core_id, thid);
	  {4'h1, 2'bxx, 1'bx, 1'b1, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> IFILL2 return.", core_id, thid);
	  {4'h9, 2'bxx, 1'b1, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> NCU IFILL return.", core_id, thid);
	  
	  {4'b0, 2'bxx, 1'b1, 1'b1, 1'b0}:  
	  begin
		chk_ccx_atm_response(cpx_pkt);
	  end
	  {4'h4, 2'bxx, 1'b1, 1'b1, 1'b0}:  
	  begin
		if ((cpx_pkt[`CPX_RTNTYP] == 4'h4) & (cpx_pkt[120:118] == core_id))
		begin
			chk_ccx_atm_response(cpx_pkt);
			chk_ccx_st_response(cpx_pkt);
		end
	  end
			
	  {4'h2, 2'bxx, 1'b1, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Stream Ld return.", core_id, thid);
	  {4'h6, 2'bxx, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Stream store Ack.", core_id, thid);
	  {4'h5, 2'bxx, 1'b1, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> MMU ld return.", core_id, thid);
	  {4'h7, 2'b00, 1'b0, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Interrupt return.", core_id, thid);
	  {4'h3, 2'b00, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Eviction Invalidation.", core_id, thid);
	  {4'hc, 2'bxx, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> L2 Indication.", core_id, thid);
	  
	  {4'hd, 2'bxx, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Soc Error Indication.", core_id, thid);
	   
	  default:
	  begin
		`PR_ALWAYS("lsu_mon", `ALWAYS, "CPX_PKT data.");
		`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%0h> <T%0h> rtn_typ = %0h, err_bits = %0h, nc=%0b, atm = %0b, pf = %0b",  core_id, cpx_pkt[`CPX_THR_ID], cpx_pkt[`CPX_RTNTYP], cpx_pkt[`CPX_ERR], cpx_pkt[`CPX_NC], cpx_pkt[`CPX_ATM], cpx_pkt[`CPX_PF]);

		`PR_ERROR("lsu_mon", `ERROR, "<C%0h> <T%0h> Can't recognise the CPX pkt.",  core_id, thid);
	  end

	endcase
end
endtask

task chk_ccx_ld_response;
input [145:0] cpx_pkt;
reg [2:0] thid;
reg [20:0] inst;
reg [39:0] cpx_pa, inst_pa;
reg [`LD_Pend_Width] tmp;
reg [3:0] pkt_type;
begin
	thid = cpx_pkt[`CPX_THR_ID];
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	inst_pa = tmp[`MEMOP_PA];
	pkt_type = cpx_pkt[`CPX_RTNTYP];

	   if (ld_valid[thid])
	   begin 
			`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) L2 response.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
		/* 
			if (inst_pa[39] != pkt_type[3])
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> ccx pkt_type = %h mismatches the ld_pa bit 39. ld_pa = %0h.", core_id, thid, pkt_type, inst_pa);
			end
		*/

			if (inst[`BLKLD])
			begin
				if (tmp[`L2_RESP] == 4'h0) 
				begin
					tmp[`L2_RESP] = 4'h1; 
					tmp[`L2_ERR0] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 1.", core_id, thid);
					end

				end
				else if (tmp[`L2_RESP] == 4'h1) 
				begin
					tmp[`L2_RESP] = 4'h3; 
					tmp[`L2_ERR1] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 2.", core_id, thid);
					end
				end
				else if (tmp[`L2_RESP] == 4'h3) 
				begin
					tmp[`L2_RESP] = 4'h7; 
					tmp[`L2_ERR2] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 3.", core_id, thid);
					end
				end
				else if (tmp[`L2_RESP] == 4'h7) 
				begin
					tmp[`L2_RESP] = 4'hF; 
					tmp[`L2_ERR3] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 4.", core_id, thid);
					end

					//is_blkld[thid] = 1'b1;
					if ((tmp[`L2_ERR0] == `ND) || (tmp[`L2_ERR1] == `ND) || (tmp[`L2_ERR2] == `ND) ||  (tmp[`L2_ERR3] == `ND))
						l2_blk_ld_errtype[thid] = `ND;
					else if ((tmp[`L2_ERR0] == `UE) || (tmp[`L2_ERR1] == `UE) || (tmp[`L2_ERR2] == `UE) ||  (tmp[`L2_ERR3] == `UE))
						l2_blk_ld_errtype[thid] = `UE;
					else if ((tmp[`L2_ERR0] == `CE) || (tmp[`L2_ERR1] == `CE) || (tmp[`L2_ERR2] == `CE) ||  (tmp[`L2_ERR3] == `CE))
						l2_blk_ld_errtype[thid] = `CE;
					else 
						l2_blk_ld_errtype[thid] = `NE;
				end
				else
				begin
					DispPendReq(thid);
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when response pkt received from ccx.", core_id, thid);
				end
			end
			else if (Is_single_pcx_req_ld(inst)) 
			begin
				//is_blkld[thid] = 1'b0;
				if (tmp[`L2_RESP] != 4'hE)
				begin
					DispPendReq(thid);
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when response pkt received from ccx.", core_id, thid);
				end
				//`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Setting L2_resp bits to F.", core_id, thid);
				tmp[`L2_RESP] = 4'hF;
			end
			else
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Load response received from gasket for thid %h while no load request pending from core for this thread.", core_id, thid, thid);
	     end
	     else
	     begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Load response received from gasket while no load request pending from core for this thread.", core_id, thid);
	     end

	ld_pend_array[thid] = tmp;
end
endtask

task chk_ccx_atm_response;
input [145:0] cpx_pkt;
reg [2:0] thid;
reg [20:0] inst;
reg [39:0] inst_pa;
reg [`LD_Pend_Width] tmp;
begin
	thid = cpx_pkt[`CPX_THR_ID];
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	inst_pa = tmp[`MEMOP_PA];

	if (~ld_valid[thid])
	begin
		if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ld response received from gasket while no request pending from core for this thread.", core_id, thid);
		end
		else
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ack response received from gasket while no request pending from core for this thread.", core_id, thid);
		end
	end
        else
   	begin 
		if (~inst[`SWAP] && ~inst[`CASA] && ~inst[`LDSTUB])
		begin
			DispPendReq(thid);
			if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
			begin
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ld response received from gasket which mismatches the request pending from this thread.", core_id, thid);
			end
			else
			begin
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ack response received from gasket which mismatches the request pending from this thread.", core_id, thid);
			end
		end
		else
		begin
		if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
		begin
			`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) Atomic ld response.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
		end
		else
		begin
			`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) Atomic ack.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
		end

		   if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
		   begin
			if (tmp[`L2_RESP] == 4'hC) tmp[`L2_RESP] = 4'hD; 
			else
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when atomic ld return pkt received from ccx.", core_id, thid);
			end
		  end
		  else
		  begin
			if (tmp[`L2_RESP] == 4'hD) tmp[`L2_RESP] = 4'hF; 
			else
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when atomic ack pkt received from ccx.", core_id, thid);
			end
		  end
		end
	end
	ld_pend_array[thid] = tmp;
end
endtask

task chk_ccx_st_response;
input [145:0] cpx_pkt;
reg [2:0] thid;
reg [20:0] inst;
reg [39:0] cpx_pa, inst_pa;
reg [204:0] tmp;
reg [3:0] pkt_type;
begin
	thid = cpx_pkt[`CPX_THR_ID];
	tmp = stb[{thid, ret_ptr[thid]}];
	inst = tmp[`LSU_MON_INST];
	inst_pa = tmp[`MEMOP_PA];
	pkt_type = cpx_pkt[`CPX_RTNTYP];


//is received. There could be some other store sitting in the STB at that time.

//Chk for squash bit only for non-bis responses.


	if (cpx_pkt[`CPX_BIS])  //response to rmo store
	begin
		if (st_rmo_cnt[thid] == 0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> L2 response received for an rmo store while the st_rmo_cnt for this thread is 0.", core_id, thid);
		end
		else
		begin
			st_rmo_cnt[thid] = st_rmo_cnt[thid] - 1'b1;
			`PR_INFO("lsu_mon", 25, "<C%0h> <T%0h> Store ack received for RMO store. rmo_cnt = %0d", core_id, thid, st_rmo_cnt[thid]);
		end
	end
	else
	begin
	   if (tmp[`ST_SQUASH])
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> L2 response received while the SQUASH bit is set in the STB entry %0h.", core_id, thid, ret_ptr[thid]);
	   
           if (~stb_valid[{thid, ret_ptr[thid]}])
           begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Store ack received while that entry is invalid in STB.", core_id, thid);
	   end
	   else
	   begin
	      if (~cpx_pkt[`CPX_ATM])  //don't print this message for atomic return
	      begin
		`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) STB[%0d] Store ack.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA], ret_ptr[thid]);
              end
	      tmp[`L2_ACK] = 1'b1;
	      stb[{thid, ret_ptr[thid]}] = tmp;
		ret_ptr[thid] = ret_ptr[thid] + 1'b1;
		//`PR_INFO("lsu_mon", 22, "<C%0h> <T%0h> ret_ptr = %0d.", core_id, thid, ret_ptr[thid]);
	   end
	end
end
endtask

task Chk_req_load;
input [129:0] pcx_pkt;
reg [2:0] thid;
reg [`LD_Pend_Width] tmp;
reg [39:0] pcx_pa, inst_pa;
reg [20:0] inst;
reg [11*8:0] req;
begin
	
	thid = pcx_pkt[`PCX_THR_ID];
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	pcx_pa = pcx_pkt[`PCX_ADDR];
	inst_pa = tmp[`MEMOP_PA];
	req = DispPCXReq(pcx_pkt);

	if (inst[`BLKLD])
	begin
		if (pcx_pa[39:6] != inst_pa[39:6])
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A load request made to gasket by LSU while the pending req has PA %0h.", core_id, thid, pcx_pa, tmp[`MEMOP_PA]);
		end
		if (pcx_pa[5:0] == 6'b0)
		begin
			if (tmp[`L2_ISS] != 4'h0 )
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 1st load request (pa[5:0] = 6'b0) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				tmp[`L2_ISS] = 4'h1;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 1st blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			end
				
		end
		if (pcx_pa[5:0] == 6'h10)
		begin
			if (tmp[`L2_ISS] != 4'h1)
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 2nd load request (pa[5:0] = 6'h10) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				tmp[`L2_ISS] = 4'h3;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 2nd blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			end
		end
		if (pcx_pa[5:0] == 6'h20)
		begin
			if (tmp[`L2_ISS] != 4'h3)
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 3rd load request (pa[5:0] = 6'h20) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				tmp[`L2_ISS] = 4'h7;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 3rd blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			end
		end
		if (pcx_pa[5:0] == 6'h30)
		begin
			if (tmp[`L2_ISS] != 4'h7)
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 4th load request (pa[5:0] = 6'h30) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 4th blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
				tmp[`L2_ISS] = 4'hF;
			end
		end
		ld_pend_array[thid] = tmp;
	end
	else if (Is_single_pcx_req_ld(inst)) 
	begin
	  if (tmp[`L2_ISS] == 4'hF)
	  begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Load request  made to gasket by LSU while this request has already been issued to gasket.", core_id, thid, pcx_pa);
	  end
	  else
	  begin
		tmp[`L2_ISS] = 4'hF;
		ld_pend_array[thid] = tmp;
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
	  end
	end
	else
	begin
		DispPendReq(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A load request made to gasket by LSU while there is no such ld request pending from this thread.", core_id, thid, pcx_pa);
	end
end
endtask

	
function Is_single_pcx_req_ld;
input [20:0] inst;
begin
	if (inst[`LDD] || inst[`QLD] || inst[`FSR_RD_WR] || (inst == 21'h1) || (inst == 21'h5))
		Is_single_pcx_req_ld = 1'b1;
	else
		Is_single_pcx_req_ld = 1'b0;
	//`PR_INFO("lsu_mon", 22, "<C%0h> Is_single_pcx_req_ld = %b. ", core_id, Is_single_pcx_req_ld);
end
endfunction
			          

function Is_trap;
input [2:0]tid;

begin
	Is_trap = 1'b0;
	case (`SPC0.lsu_trap_flush[7:0])
		8'h01: if (tid == 3'h0) Is_trap = 1'b1;
		8'h02: if (tid == 3'h1) Is_trap = 1'b1;
		8'h04: if (tid == 3'h2) Is_trap = 1'b1;
		8'h08: if (tid == 3'h3) Is_trap = 1'b1;
		8'h10: if (tid == 3'h4) Is_trap = 1'b1;
		8'h20: if (tid == 3'h5) Is_trap = 1'b1;
		8'h40: if (tid == 3'h6) Is_trap = 1'b1;
		8'h80: if (tid == 3'h7) Is_trap = 1'b1;
	endcase
end
endfunction

function [8*11:0] DispPCXReq;
input [129:0] pcx_pkt;
begin
	casex ({pcx_pkt[`PCX_RQTYP], pcx_pkt[`PCX_NC], pcx_pkt[`PCX_INV], pcx_pkt[`PCX_PF], pcx_pkt[`PCX_BIS]})
		{5'h0, 1'b1, 1'b0, 1'b1, 1'b0}: DispPCXReq = "PREF";
		{5'h0, 1'b1, 1'b1, 1'b1, 1'b0}: DispPCXReq = "PREF_ICE";
		{5'h0, 1'bx, 1'b0, 1'b0, 1'b0}: DispPCXReq = "LD";
		{5'h0, 1'bx, 1'b1, 1'b0, 1'b0}: DispPCXReq = "D";  
		{5'h10, 1'bx, 1'b0, 1'b0, 1'b0}: DispPCXReq = "I";
		{5'h10, 1'b0, 1'b1, 1'b0, 1'b0}: DispPCXReq = "I";
		{5'h1, 1'bX, 1'bX, 1'b0, 1'b0}: DispPCXReq = "ST";
		{5'h1, 1'bX, 1'bX, 1'b1, 1'b1}: DispPCXReq = "BLKST";
		{5'h1, 1'bX, 1'bX, 1'b0, 1'b1}: DispPCXReq = "BIS";
		{5'h2, 1'b1, 1'bX, 1'b0, 1'b0}: DispPCXReq = "CASA1";
		{5'h3, 1'b1, 1'bX, 1'b0, 1'b0}: DispPCXReq = "CASA2";
		{5'h7, 1'b1, 1'bX, 1'b0, 1'b0}: DispPCXReq = "SWAP_LDSTUB";
		{5'h4, 1'b1, 1'b0, 1'b0, 1'b0}: DispPCXReq = "STREAM_LD";
		{5'h5, 1'b1, 1'b0, 1'b0, 1'bx}: DispPCXReq = "STREAM_ST";
		{5'h8, 1'b1, 1'b0, 1'b0, 1'b0}: DispPCXReq = "MMU_LD";
		//{5'h9, 1'b0, 1'b0, 1'b0, 1'b0}: DispPCXReq = "INT";
		default:
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%0h> <T%0h> <%0h> Can't recognise the PCX pkt type. rq_type = %h, nc_bit = %0b, inv_bit = %0b, pf_bit = %0b, bis_bit = %0b. pcx_pkt[129:0] = %h",  core_id, pcx_pkt[`PCX_THR_ID], pcx_pkt[`PCX_ADDR], pcx_pkt[`PCX_RQTYP], pcx_pkt[`PCX_NC], pcx_pkt[`PCX_INV], pcx_pkt[`PCX_PF], pcx_pkt[`PCX_BIS], pcx_pkt);
			DispPCXReq = " ";
		end
	 endcase
end
endfunction

function IsExc;
input [2:0] core_id;
reg [21*8:0] DispExc;

begin
	DispExc = 170'b0;
	IsExc = 1'b0;

	if (`SPC0.lsu_align_b) DispExc = "Addr_not_aligned";
	if (`SPC0.lsu_lddf_align_b) DispExc = "LDDF_Addr_not_aligned";
	if (`SPC0.lsu_stdf_align_b) DispExc = "STDF_Addr_not_aligned";
	if (`SPC0.lsu_priv_action_b) DispExc = "Priv_actio";
	if (`SPC0.lsu_va_watchpoint_b) DispExc = "VA_watchpoint";
	if (`SPC0.lsu_pa_watchpoint_b) DispExc = "PA_watchpoint";
	//if (`SPC0.lsu_tlb_miss_b_) DispExc = "Tlb_miss";
	if (`SPC0.lsu_illegal_inst_b) DispExc = "Illegal_inst";
	if (`SPC0.lsu_daccess_prot_b) DispExc = "Data_access_prot_exc";
	if (`SPC0.lsu_dae_invalid_asi_b) DispExc = "Dae_Invalid_asi";
	if (`SPC0.lsu_dae_nc_page_b) DispExc = "Dae_nc_page";
	if (`SPC0.lsu_dae_nfo_page_b) DispExc = "Dae_NFO_page";
	if (`SPC0.lsu_dae_priv_viol_b) DispExc = "Dae_Priv_viol";
	if (`SPC0.lsu_dae_so_page) DispExc = "Dae_so_page";
	//if (`SPC0.lsu_perfmon_trap_b) DispExc = "Perf_mon_trap";
	if (`SPC0.lsu_dtmh_err_b) DispExc = "DTLB_data_par_err";
	if (`SPC0.lsu_dttp_err_b) DispExc = "DTLB_tag_par_err";
	if (`SPC0.lsu_dtdp_err_b) DispExc = "DTLB_data_par_err";

	
	if (DispExc != 0)
	begin
		IsExc = 1'b1;
		`PR_INFO("lsu_mon", 23, "<C%0h> <T%0h> <%0h> B_stage: %s(VA=%0h) ASI = %0h. %s Exception.",core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, asi_b, DispExc);
	end

end
endfunction

function Is_exu_error;
input [1:0] exu_lsu_va_error_b;     // VA error requiring a flush
input [1:0] exu_ecc_b;              // ECC error requiring a flush
reg err_b;
reg err_m;

begin
	err_b = dec_lsu_tid_b[2] ? (exu_ecc_b[1] | (exu_lsu_va_error_b[1] & ~`SPC0.lsu_tlb_bypass_b)):
				(exu_ecc_b[0] | (exu_lsu_va_error_b[0] & ~`SPC0.lsu_tlb_bypass_b));

	err_m = (dec_lsu_tid_b[2] ? `SPC0.exu_ecc_m[1] : `SPC0.exu_ecc_m[0]) & `SPC0.lsu.dcc.twocycle_b;
					
	Is_exu_error = err_b | err_m;
end
endfunction

/*
task Insert_tlb_miss_info;
reg [127:0] tmp;
begin
	tmp =  128'b0;
	if (tlb_valid[dec_lsu_tid_b])
	begin
		tmp = tlbmiss_pend_array[dec_lsu_tid_b];
		Disp_tlbmiss_pend_array_entry(dec_lsu_tid_b);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h>) A new tlb miss request received while there is already a Tlb miss request pending from this thread as shown above.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
	end
	else
	begin
		tlb_valid[dec_lsu_tid_b] <= 1'b1;
		tmp[`INST_VA] = inst_pc_b;
		tmp[`MEMOP_VA] = vaddr_b;
		tmp[`INST] = inst_b;
	end
	tlbmiss_pend_array[dec_lsu_tid_b] = tmp;
end
endtask

*/

//problem with the signal.
/*
always @ (negedge `SPC0.l2clk)
begin
	if (mmu_dtlb_reload_d2)
		Chk_dtlb_reload;
end

task Chk_dtlb_reload;
reg [2:0] thid;
reg [127:0] tmp;
begin
		if (`SPC0.tlu_trap_pc_0_valid)
			thid = {1'b0, `SPC0.tlu_trap_0_tid};
		else if (`SPC0.tlu_trap_pc_1_valid)
			thid = {1'b0, `SPC0.tlu_trap_1_tid};
		else 
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> mmu_dtlb_reload asserted but trap_pc_0_valid and trap_pc_1_valid are both 0", core_id);

		if (~tlb_valid[thid])
			`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> mmu_dtlb_reload asserted while tlb_valid is 0.", core_id, thid);
		else
		begin
			tmp = tlbmiss_pend_array[dec_lsu_tid_b];
			`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> %s(VA=%0h> DTLB reloaded for VA = %0h.", core_id, thid, tb_top.intf0.xlate(tmp[`INST]), tmp[`INST_VA], tmp[`MEMOP_VA] );
			tlb_valid[thid] = 1'b0;
		end
end
endtask
*/

task Insert_ld_miss_info;
reg [`LD_Pend_Width] tmp;
begin
	tmp = 213'b0;
	if (ld_valid[dec_lsu_tid_b])
	begin
		tmp =  ld_pend_array[dec_lsu_tid_b];
		DispPendReq(dec_lsu_tid_b);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h>) A new request received while there is already a request pending from this thread as shown above.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
	end
	else
	begin
		//ld_valid[dec_lsu_tid_b] <= 1'b1;
		tmp[`INST_VA] = inst_pc_b;
		tmp[`MEMOP_VA] = vaddr_b;
		tmp[`MEMOP_PA] = {`SPC0.lsu.tlb_pgnum[39:13], vaddr_b[12:0]};
		tmp[`INST_ASI] = asi_b;

		if (lsu_inst_b[`BLKLD])
		begin
			tmp[`L2_ISS] =  4'h0;
			tmp[`L2_RESP] =  4'h0;
			is_blkld[dec_lsu_tid_b] = 1'b1;
		end
		else
		begin
		   is_blkld[dec_lsu_tid_b] = 1'b0;
		   if (lsu_inst_b[`CASA])
			tmp[`L2_ISS] =  4'hC;
		   else
			tmp[`L2_ISS] =  4'hE;
		   if (lsu_inst_b[`SWAP] || lsu_inst_b[`LDSTUB] || lsu_inst_b[`CASA])
			tmp[`L2_RESP] =  4'hC;
		   else
			tmp[`L2_RESP] =  4'hE;

		end

		tmp[`INST] = inst_b;
		tmp[`LSU_MON_INST] = lsu_inst_b; 
		ld_pend_array[dec_lsu_tid_b] = tmp;
	end
end
endtask


task Insert_in_last_inst_array;
reg [135:0] tmp;
begin
	tmp = 128'b0;
	tmp[`INST_VA] = inst_pc_b;
	tmp[`MEMOP_VA] = vaddr_b;
	tmp[`INST] = inst_b;
	tmp[135:128] = asi_b;
	last_inst_array[dec_lsu_tid_b] = tmp;
end
endtask


task DispPendReq;
input [2:0] thid;
reg [`LD_Pend_Width] tmp;
begin
	
	tmp =  ld_pend_array[thid];
	`PR_ALWAYS("lsu_mon", `ALWAYS, "LD_PEND_ARRAY[%0h] Data.", thid);
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> <%0h> %s(VA=%0h). PA = %0h. L2_ISS = %0h. L2_RESP = %0h, LSU_MON_INST=%h.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA], tmp[`MEMOP_PA], tmp[`L2_ISS], tmp[`L2_RESP], tmp[`LSU_MON_INST]);
end
endtask

task Disp_STB_entry;
input [2:0] thid;
input [2:0] ptr;
reg [204:0] tmp;
begin
	
	tmp =  stb[{thid, ptr}];
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> STB[%0h] data.", core_id, thid, ptr);
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> <%0h> %s(VA=%0h). PA = %0h. L2_ISS = %0h. L2_ACK = %0h, LSU_MON_INST=%h. RMO = %0b", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA], tmp[`MEMOP_PA], tmp[`L2_ST_ISS], tmp[`L2_ACK], tmp[`LSU_MON_INST], tmp[`RMO]);
end
endtask

/*
		
task Disp_tlbmiss_pend_array_entry;
input [2:0] thid;
reg [127:0] tmp;
begin
	tmp = tlbmiss_pend_array[thid];
	`PR_INFO("lsu_mon", 23, "TLB_MISS_PEND_ARRAY[%0h] Data.", thid);
	`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h> %s(VA=%0h).", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);

end
endtask

*/
task Disp_CPX_pkt;
input [145:0] cpx_pkt;
begin
	`PR_ALWAYS("lsu_mon", `ALWAYS, "CPX_PKT data.");
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%0h> <T%0h> rtn_typ = %0h, err_bits = %0h, nc=%0b, atm = %0b, pf = %0b",  core_id, cpx_pkt[`CPX_THR_ID], cpx_pkt[`CPX_RTNTYP], cpx_pkt[`CPX_ERR], cpx_pkt[`CPX_NC], cpx_pkt[`CPX_ATM], cpx_pkt[`CPX_PF]);
end
endtask
	

task Make_STB_data;
reg [204:0] tmp;
begin
		tmp = 0;
		tmp[`INST_VA] = inst_pc_b;
		tmp[`MEMOP_VA] = vaddr_b;
		tmp[`MEMOP_PA] = {`SPC0.lsu.tlb_pgnum[39:13], vaddr_b[12:0]};
		tmp[`L2_ST_ISS] =  1'b0;
		tmp[`ASI_ST_ISS] =  1'b0;
		tmp[`L2_ACK] =  1'b0;
		tmp[`INST] = inst_b;
		tmp[`LSU_MON_INST] = lsu_inst_b;
		tmp[`ST_SQUASH] = 1'b0;
		tmp[`INST_ASI] = asi_b;
		if (`SPC0.lsu.tlu_lsu_hpstate_hpriv[dec_lsu_tid_b])
		   tmp[`ST_PRIV] = `HPRIV; 
		else if (`SPC0.lsu.tlu_lsu_pstate_priv[dec_lsu_tid_b])
		   tmp[`ST_PRIV] = `PRIV; 
		else
		   tmp[`ST_PRIV] = `USER; 
		//bis_asi to io space is not rmo

		tmp[`RMO] = lsu_inst_b[`BLKST] | (dec_altspace_b & Is_bis_asi(asi_b) & ~`SPC0.lsu.tlb_pgnum[39]);
		stb_alloc_data <= tmp;
end
endtask

task Insert_in_STB;
input [195:0] store_data;
input [2:0] thid;
begin
	if (stb_full(thid))
	begin
		//DispSTB(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> STB full and a new store received for insertion in STB.", core_id, thid);
	end
	else
	begin
		stb[{thid, wrptr[thid]}] = store_data;
		//Disp_STB_entry(thid, wrptr[thid]);
		`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h> %s(VA=%0h). STB[%0h] Inserted.", core_id, thid, store_data[`INST_VA], tb_top.intf0.xlate(store_data[`INST]), store_data[`MEMOP_VA], wrptr[thid]);
		stb_valid[{thid, wrptr[thid]}] = 1'b1;
		wrptr[thid] = wrptr[thid] + 1'b1;
		//`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> wrptr = %0d.", core_id, thid, wrptr[thid]);
	end
end
endtask

function stb_full;
input [2:0] thid;
begin
	if ((wrptr[thid] == rdptr[thid]) && stb_valid[{thid, wrptr[thid]}])
		stb_full = 1'b1;
	else
		stb_full = 1'b0;
end
endfunction
	

task Dealloc_STB;
input [2:0] thid;
reg [204:0] tmp;
reg [20:0] lsu_inst;
begin
	//thid = decode_tid(`SPC0.lsu_stb_dealloc);
	tmp = stb[{thid, rdptr[thid]}];
	lsu_inst = tmp[`LSU_MON_INST];
	if (~stb_valid[{thid, rdptr[thid]}])
	begin
		//DispSTB(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_dealloc = %0h asserted while the stb entry is invalid for that thid.", core_id, thid, `SPC0.lsu_stb_dealloc);
	end
	if (tmp[`L2_ST_ISS]) 
	begin
	    if (~tmp[`L2_ACK])
	    begin
		Disp_STB_entry(thid, rdptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_dealloc = %0h asserted when we haven't received the response from the gasket.", core_id, thid, `SPC0.lsu_stb_dealloc);
	    end
	end
	else if (tmp[`ASI_ST_ISS])
	begin
		ret_ptr[thid] = ret_ptr[thid] + 1'b1;
	end
	//blkst inst. is not issued anywhere, blkst helpers are issued.
	//in case of bis stores, lsu issues the dealloc in P3, i.e when the req is issued to PCX.
	//IF it is bis to cp sapce and there is an err then the store is issued to PCX with nd set
	// and deallocated.
	//However for ue onbis to IO space, dealloc is sent to IFU, issued on PCX with valid bit 0.
	//The sbdiou signal is sent in next cycle. We need to take bis io stores in this equation.
	else if (tmp[`ST_SQUASH] || lsu_inst[`BLKST] || (tmp[`RMO] & ~lsu_inst[`BLKST] & ~`SPC0.lsu.sbc.kill_store_p4_)) 
	begin
		iss_ptr[thid] = iss_ptr[thid] + 1'b1;
		ret_ptr[thid] = ret_ptr[thid] + 1'b1;
	end
	else 
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_dealloc = %0h asserted which is not issued to asi ring, or PCX or is not squashed.", core_id, thid, `SPC0.lsu_stb_dealloc);

	`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h>: %s(VA=%0h) PA = %0h. STB[%0d] Deallocated.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], tmp[`MEMOP_PA], rdptr[thid]);
	stb_valid[{thid, rdptr[thid]}] = 1'b0;
	rdptr[thid] = rdptr[thid] + 1'b1;
	//`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> rd_ptr = %0d.", core_id, thid, rdptr[thid]);
	/*
	if (tmp[`RMO])
		st_rmo_cnt[thid] = st_rmo_cnt[thid]  + 1'b1;
	*/
end
endtask

task Squash_STB;
input [2:0] thid;
reg [204:0] tmp;
reg [3:0] squash_cnt;
reg [2:0] i;
begin
	squash_cnt = 4'b0;
        if (ret_ptr[thid] != iss_ptr[thid])
	       `PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> lsu_block_store_kill asserted while the ret_ptr = %0h  != iss_ptr = %0h.", core_id, thid, tmp[`MEMOP_PA], ret_ptr[thid], iss_ptr[thid]);
        if (rdptr[thid] != iss_ptr[thid])
	       `PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> lsu_block_store_kill asserted while the rdptr = %0h  != iss_ptr = %0h.", core_id, thid, tmp[`MEMOP_PA], rdptr[thid], iss_ptr[thid]);

	if (iss_ptr[thid] == wrptr[thid])
	begin
	    if (stb_valid[{thid, wrptr[thid]}])
		squash_cnt = 8;
/* Lsu can assert both dealloc and block_store_kill for a request.
 *
	    else
	    begin
              	`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Lsu asserted block_store_kill while there are no valid entries in STB to be deallocated.", core_id, thid);
	    end
*/
	end
	else
	begin
	  if (iss_ptr[thid] < wrptr[thid])
		squash_cnt = wrptr[thid] - iss_ptr[thid];
	  else if (iss_ptr[thid] > wrptr[thid])
		squash_cnt = wrptr[thid] + (8 - iss_ptr[thid]);
	end

	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> SQUASH_STB:iss_ptr = %0h, wrptr = %0h, squash_cnt = %0h.", core_id, thid, iss_ptr[thid], wrptr[thid], squash_cnt);

	i = iss_ptr[thid];
       
       `PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Block store kill changed issue_ptr:%0h->%0h. ret_ptr: %0h->%0h. rdptr:%0h->%0h.", core_id, thid, iss_ptr[thid], iss_ptr[thid]+squash_cnt, ret_ptr[thid], ret_ptr[thid]+squash_cnt, rdptr[thid], rdptr[thid]+squash_cnt);

   	ret_ptr[thid] = ret_ptr[thid] + squash_cnt;
	rdptr[thid] = rdptr[thid] + squash_cnt;
        iss_ptr[thid] = iss_ptr[thid] + squash_cnt;
		
	while (squash_cnt)
	begin
	    tmp = stb[{thid, i}];
	    if (~stb_valid[{thid, i}])
	    begin
		//DispSTB(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h><PA = %0h> lsu_block_store_kill asserted while the stb entry %0h is invalid.", core_id, thid, tmp[`MEMOP_PA], i);
	    end
	    if (tmp[`L2_ST_ISS]) 
	    begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h>st_issue bit is set when the block_store_kill is asserted for stb entry %0h.", core_id, thid, tmp[`MEMOP_PA], i);
	    end
	    //commenting out the chk below. Lsu can assert sbdiou and then in the next cycle insert a new entry into
	    //stb. LSU will squash this new entry and won't issue it to PCX/asi but its squash bit won't be 
	    //set in the chkr which was causin it to fire. 
	    //if (~tmp[`ST_SQUASH]) 
	    //begin
	       //`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> lsu_block_store_kill asserted while the squash bit is 0 in the STB entry %0h.", core_id, thid, tmp[`MEMOP_PA], i);
	    //end
	    stb_valid[{thid, i}] = 1'b0; 

	    i = i + 1;
	    squash_cnt = squash_cnt - 1'b1;
	end

end
endtask

task Chk_store;
reg [2:0] thid;
reg [47:0] addr;
reg [3:0] i;
reg [204:0] tmp;
begin
	if ((bst_cnt > 0) && (`SPC0.lsu_stb_alloc == 8'b0))
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Blk store entries are not allocated back to back in STB.", core_id, bst_active_thid);

//For bst the stb is still written even though we have errors.
//Stb is written in W stage. Howvere for first blk store helper
//the err will be flagged by FGU in b stage. We can miss the
// err signal if we don't sample in B.
//for the last helper err will be signalled in B stage of last helper and at

	if (lsu_bst_active[bst_active_thid] & `SPC0.fgu_fst_ecc_error_fx2 & (bst_cnt < 7))
             bst_fgu_err = 1'b1;

	if (`SPC0.lsu_stb_alloc[7:0] != 8'b0)
	begin
		thid = decode_tid(`SPC0.lsu_stb_alloc[7:0]);
		if (store_alloc)
		begin
			if (thid != dec_lsu_tid_w)
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_alloc = %0h mismatches the thid %0h.", core_id, dec_lsu_tid_w, `SPC0.lsu_stb_alloc[7:0], dec_lsu_tid_w);
			Insert_in_STB(stb_alloc_data, dec_lsu_tid_w);
		end
		else 
		begin
		    if (lsu_bst_active[thid])
		    begin
			   if (bst_cnt == 0)
			   begin
				bst_data = bst_inst_data;
			   end
		           else
			   begin
				if (thid != bst_active_thid)
				begin
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_alloc = %0h mismatches the active blkstore thid = %0h.", core_id, bst_active_thid, `SPC0.lsu_stb_alloc[7:0], bst_active_thid);
				end

				addr = bst_data[`MEMOP_VA];

				bst_data[`MEMOP_VA] = {addr[47:6], bst_cnt[2:0], 3'b0};
				addr = bst_data[`MEMOP_PA];
				bst_data[`MEMOP_PA] = {addr[39:6], bst_cnt[2:0], 3'b0};
			   end
                                bst_cnt = bst_cnt + 1;
                                Insert_in_STB(bst_data, bst_active_thid);
                                if (bst_cnt == 8)
                                begin
                                        bst_cnt = 0;
                                        lsu_bst_active[thid] = 1'b0;
                                        if (bst_fgu_err) //set the squash bit to 0 for all the stb entries
                                        begin
                                          for (i = 0; i < 8; i=i+1)
                                          begin
                                             tmp = stb[{thid, i[2:0]}];
					     if (tmp[`ST_SQUASH])
						`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Squash bit already set when trying to set it for a bst fgu errerr.", core_id, thid, tmp[`MEMOP_PA]);
					     tmp[`ST_SQUASH] = 1'b1;
                                             stb[{thid, i[2:0]}] = tmp; 
                                             `PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <PA = %0h> STB_entry[%0h] squashed due to FGU err.", core_id, thid, tmp[`MEMOP_PA], i);
                                          end
                                        end
					bst_fgu_err = 1'b0;
                                end
			end
			else
				`PR_ERROR("lsu_mon", `ERROR, "<C%h>: LSU asserted lsu_stb_alloc  = %0h while no store pending to be written in STB.", core_id, `SPC0.lsu_stb_alloc[7:0]);
				
		end
	end
	else
	begin
		if (store_alloc)
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h> W_stage: LSU did not assert lsu_stb_alloc for the store.", core_id, dec_lsu_tid_w, inst_pc_w);
	end
end
endtask

task Chk_st_on_ASI_ring;
input ring;
reg [2:0] thid;
reg [7:0] asi;
reg [47:0] addr, act_addr;
reg [1:0] req_type;
reg [204:0] tmp;

begin
	if (ring == `LOCAL)
		thid =`SPC0.lsu_rngl_cdbus[58:56];
	else
		thid =`SPC0.lsu_rngf_cdbus[58:56];
	
	if (ring == `LOCAL)
		asi =`SPC0.lsu_rngl_cdbus[55:48];
	else
		asi =`SPC0.lsu_rngf_cdbus[55:48];
	
	if (ring == `LOCAL)
		addr =`SPC0.lsu_rngl_cdbus[47:0];
	else
		addr =`SPC0.lsu_rngf_cdbus[47:0];
	
	if (ring == `LOCAL)
		req_type =`SPC0.lsu_rngl_cdbus[61:60];
	else
		req_type =`SPC0.lsu_rngf_cdbus[61:60];
	

	tmp = stb[{thid, iss_ptr[thid]}];
	if (tmp[`ASI_ST_ISS])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store reissued on the ASI interface.", core_id, thid, addr);
	end
	
	if (tmp[`ST_SQUASH])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store issued on the ASI interface that has been squashed.", core_id, thid, addr);
	end

	act_addr  = tmp[`MEMOP_PA];
	act_addr = {act_addr[39:3], 3'b0};

	//47 is D tag rd asi. LSU issues that on the ring but changes 
	//the address.
	if ((addr == act_addr) || (asi == 8'h47) || (asi == 8'h46))  
	begin
		tmp[`ASI_ST_ISS] = 1'b1;
		stb[{thid, iss_ptr[thid]}] = tmp;
		if (ring == `LOCAL)
		begin
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued on local ring.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
		end
		else
		begin
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued on fast ring.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
		end
		iss_ptr[thid] = iss_ptr[thid] + 1'b1;
	end
	else
	begin
	   if (ring == `LOCAL)
	   begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] PA mismatch for asi req on local ring. Expected PA = %0h, actual PA = %0h", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid], tmp[`MEMOP_PA], addr);
	   end
	   else
	   begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] PA mismatch for asi req on fast ring. Expected PA = %0h, actual PA = %0h", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid], tmp[`MEMOP_PA], addr);
	  end
	end

end
endtask


task chk_store_issue_to_pcx;
input [129:0] pcx_pkt;
reg [2:0] thid;
reg [204:0] tmp;
reg [20:0] inst;
reg [39:0] pcx_pa, inst_pa;
begin
	thid = pcx_pkt[`PCX_THR_ID];
	tmp = stb[{thid, iss_ptr[thid]}];
	inst = tmp[`LSU_MON_INST];
	pcx_pa = pcx_pkt[`PCX_ADDR];
	inst_pa = tmp[`MEMOP_PA];
	
	if (pcx_pkt[`PCX_RQTYP] == `PCX_STORE)
	begin
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
	end
	if (pcx_pkt[`PCX_INV])
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued to gasket with ND set.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
		

	if (~inst[`ST])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A store request made to gasket by LSU while the pending req is not store.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end

/* CONFIRM WITH MARK
	if (pcx_pa[39:0] != inst_pa[39:0])
	begin
			Disp_STB_entry(thid, iss_ptr[thid]);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A store request made to gasket by LSU while the pending req has PA %0h.", core_id, thid, pcx_pkt[`PCX_ADDR], tmp[`MEMOP_PA]);
	end
*/
//enhancement req 100146
	if ((tmp[`INST_ASI] == 8'h73) & (pcx_pa[39:0] != {8'h90, core_id, thid, tmp[`INST_ASI], 18'h0})) 
	begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> pcx_pa is not correct for asi write to interrupt vector dispatch register.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end

	if (inst[`BLKST] && ~pcx_pkt[`PCX_BST])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Bst bit is not set in the PCX pkt by LSU for a blk st request.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end

	if (tmp[`L2_ST_ISS])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store reissued on the PCX interface.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end
	else
	        tmp[`L2_ST_ISS] =  1'b1;
	
	if (tmp[`ST_SQUASH])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store issued on the PCX interface that has been squashed.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end
	
	if (tmp[`RMO])
	begin
	   if (~pcx_pkt[`PCX_BIS])
	   begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> BIS bit is not set in the PCX pkt by LSU for an RMO store.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	   end
	   if (tmp[`L2_ACK])
	   begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> L2ack bit is set when the RMO store is issued to PCX.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	   end
	   else
	   begin
		tmp[`L2_ACK] = 1'b1;
		ret_ptr[thid] = ret_ptr[thid] + 1;  //this will be deallocated before 
						    //response seen from stub
		st_rmo_cnt[thid] = st_rmo_cnt[thid]  + 1'b1;
	   end
	end
	stb[{thid, iss_ptr[thid]}] = tmp;

	iss_ptr[thid] = iss_ptr[thid] + 1;
	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> iss_ptr = %0d. ret_ptr = %0d, st_rmo_cnt = %0d", core_id, thid, iss_ptr[thid], ret_ptr[thid], st_rmo_cnt[thid]);
end
endtask

`ifdef INJ_STB_ERR_IN_CMP


reg [2:0] err_tid, stb_err_tid_d1, stb_err_tid_d2;
reg [2:0] err_index, stb_err_index_d1, stb_err_index_d2;
reg [204:0] err_tmp ;
reg [20:0] err_inst;
reg [44:0] cam_data;
reg [5:0] err_bit;
integer err_inj_cnt;
reg cmp_stb_err_inj;
reg stb_err_inj, stb_err_inj_d1, stb_err_inj_d2;
reg [1:0] err_priv, stb_err_priv_d1, stb_err_priv_d2;

initial
begin
	cmp_stb_err_inj = 1'b0;

	cam_data = 45'b0;
	err_bit = 11;
	err_inj_cnt = 0;
	stb_err_inj = 0;
	if (("cmp_stb_err_inj_on"))
		cmp_stb_err_inj = 1'b1;
	else
		cmp_stb_err_inj = 1'b0;
end

always @ (negedge (`SPC0.l2clk & enabled & cmp_stb_err_inj))
begin //{
     //valid stb ram rd for issue to pcx
     stb_err_inj = 1'b0;
     if (`SPC0.lsu.sbc.ram_rptr_vld_2 & `SPC0.lsu.sbc.st_pcx_rq_p3 & `SPC0.lsu.pic.pic_st_sel_p3)
     begin //{
	err_tid = decode_tid(`SPC0.lsu.sbc.st_rq_sel_p3[7:0]);
	err_index = `SPC0.lsu.sbc.ram_rptr_d1;
	err_tmp = stb[{err_tid, err_index}];
	err_inst = err_tmp[`LSU_MON_INST];
	cam_data = `SPC0.lsu.stb_cam.cam_array.stb_rdata[44:0];
	err_priv = err_tmp[`ST_PRIV];
	//if (err_inst[`SWAP] || err_inst[`CASA] || err_inst[`LDSTUB])
	if (err_inst[`CASA])
	begin //{
	   err_inj_cnt = err_inj_cnt + 1;
	   if (err_inj_cnt == 10)
	   begin //{
	     case (err_bit)
	       11, 12: err_bit = err_bit + 1;
	       13: err_bit = 44;
	       44: err_bit = 11;
	      endcase
	      err_inj_cnt = 0;
	      stb_err_inj = 1'b1;

	      force `SPC0.lsu.stb_cam.cam_array.stb_rdata[44:0] = cam_data ^ (1 << err_bit);
	      `PR_INFO("stb_err", 22, "<T%0h> <%0h> STB[%0h]: SBAPP forced for CASA. err_bit = %0h", err_tid, {cam_data[44:8], 3'b0}, err_index, err_bit);
	      #1;
	      release `SPC0.lsu.stb_cam.cam_array.stb_rdata[44:0];
	   end  //}
	end //}
     end  //}
     if (stb_err_inj_d2)
     begin
	if (~`SPC0.lsu_sbapp_err_g)
	begin
	            `PR_ERROR("lsu_mon", `ERROR, "<T%0h> sbapp err not asserted when err is injected for atomic.", stb_err_tid_d2);
	end
	else
	begin
		if ((`SPC0.lsu_stberr_tid_g != stb_err_tid_d2) || 
		    (`SPC0.lsu_stberr_index_g != stb_err_index_d2) || 
		    (`SPC0.lsu_stberr_priv_g != stb_err_priv_d2))
		begin
	            `PR_ERROR("lsu_mon", `ERROR, "<T%0h> sbapp err parameters mismatch.", stb_err_tid_d2);
		end
	end
    end
    else
    begin
	if (`SPC0.lsu_sbapp_err_g)
	begin
	            `PR_ERROR("lsu_mon", `ERROR, "<T%0h> sbapp err asserted when none expected.", `SPC0.lsu_stberr_tid_g);
	end
    end

end  //}

	
always @ (posedge (`SPC0.l2clk & enabled & cmp_stb_err_inj))
begin
	stb_err_inj_d1 <= stb_err_inj;
	stb_err_inj_d2 <= stb_err_inj_d1;
	stb_err_tid_d1 <= err_tid;
	stb_err_tid_d2 <= stb_err_tid_d1;
	stb_err_index_d1 <= err_index;
	stb_err_index_d2 <= stb_err_index_d1;
	stb_err_priv_d1 <= err_priv;
	stb_err_priv_d2 <= stb_err_priv_d1;
end

`endif
`endif
`endif
endmodule

`endif
`ifdef CORE_1

module lsu_mon_c1;
`ifndef GATESIM

// If vcs_build_args NO_MONITORS, then module will be empty
`ifndef NO_MONITORS

reg imm_asi_vld_e;
reg [7:0] asi_e, imm_asi_e, asi_m, asi_b;
reg dec_altspace_e, dec_altspace_b, dec_altspace_m;
reg [1:0] exu_ecc_b;
reg [1:0] exu_lsu_va_error_b;
reg [2:0] dec_lsu_tid_e, dec_lsu_tid_m, dec_lsu_tid_b, dec_lsu_tid_w;
reg [47:0] inst_pc_e, inst_pc_m, inst_pc_b, inst_pc_w;
reg [31:0] inst_e, inst_m, inst_b;
reg [47:0] vaddr_m, vaddr_b;
reg [63:0] int_st_data_m, int_st_data_b;
reg [63:0] fp_st_sata_fx2;
reg [20:0] lsu_inst_e, lsu_inst_m, lsu_inst_b;
reg mmu_dtlb_reload_d1, mmu_dtlb_reload_d2;

reg [7:0] ld_valid;
reg [7:0] tlb_valid;
reg [`LD_Pend_Width] ld_pend_array[7:0];
reg [`LAST_INST_Pend_Width] last_inst_array[7:0];
reg [2:0] wrptr[7:0];  //Pts. to the STB entry into which data will be written next
reg [2:0] rdptr[7:0];  //Tracks the dealloc signal from STB
reg [2:0] iss_ptr[7:0];	//keeps track of when a store is issued from the STB to PCX
reg [2:0] ret_ptr[7:0]; //keeps track of when the response is received from 
			//the L2c.
reg [63:0] stb_valid;
reg [`STB_Pend_Width] stb[63:0];
//reg [`TLB_MISS_Pend_Width] tlbmiss_pend_array[7:0];

reg [7:0] pf_cnt[7:0];
reg [7:0] dcache_inv_cnt[7:0];
reg [7:0] st_rmo_cnt[7:0];

reg [55:0] print_inst;

reg [31:0] dec_tg0_inst_d, dec_tg1_inst_d;

reg [7:0] lsu_bst_active;
reg store_alloc;
reg [3:0] bst_cnt;
reg [195:0] stb_alloc_data;
reg [195:0] bst_data, bst_inst_data;
reg [2:0] bst_active_thid;
reg bst_fgu_err;
				
reg [7:0] is_blkld;  //reqd by lsu_ras_chkr to chk errors on blk ld.
reg [1:0] l2_blk_ld_errtype[7:0]; //Gives the type of err the ahd be reported by LSU if 
				 //different types of err occur on blk ld helper returns
reg [1:0] st_priv[7:0]; //Gives the final priv level for an sbdiou/sbapp err that shd be 
			//stored in DFESR

wire [2:0] core_id = 1;

integer i;
integer err_cnt;

reg enabled;
reg reset_in_middle;
reg [7:0] finish_mask;

initial
begin
    enabled = 0;
    reset_in_middle = 0;
	ld_valid = 8'b0;
	lsu_inst_e = 0;
	tlb_valid = 8'b0;
	for (i = 0; i < 8; i = i+1)
	begin
		pf_cnt[i] = 0;
		dcache_inv_cnt[i] = 0;
		wrptr[i] = 0;
		rdptr[i] = 0;
		iss_ptr[i] = 0;
		ret_ptr[i] = 0;
		st_rmo_cnt[i] = 0;
		is_blkld[i] = 1'b0;
		st_priv[i] = 2'b0;
		l2_blk_ld_errtype[i] = 2'b0;
	end
	lsu_bst_active = 8'b0;
	store_alloc = 1'b0;
	bst_cnt = 4'b0;
	stb_valid = 64'b0;

    // avoid time zero ugliness. jp
    //@(posedge `SPC0.l2clk);
    //@(negedge `SPC0.l2clk);
    //if (`PARGS.lsu_mon_on) enabled = 1;

    case (core_id)
	3'h0: finish_mask = `PARGS.finish_mask[7:0];
	3'h1: finish_mask = `PARGS.finish_mask[15:8];
	3'h2: finish_mask = `PARGS.finish_mask[23:16];
	3'h3: finish_mask = `PARGS.finish_mask[31:24];
	3'h4: finish_mask = `PARGS.finish_mask[39:32];
	3'h5: finish_mask = `PARGS.finish_mask[47:40];
	3'h6: finish_mask = `PARGS.finish_mask[55:48];
	3'h7: finish_mask = `PARGS.finish_mask[63:56];
    endcase
end

always @ (`TOP.in_reset)
begin
	if (~`TOP.in_reset & `PARGS.lsu_mon_on & ~reset_in_middle)
	begin
		enabled = 1'b1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "Lsu_mon on, in_reset = 0.");
	end
		

	if (`TOP.in_reset & enabled)
	begin
		reset_in_middle = 1'b1;
		enabled = 1'b0;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "Reset asserted in the middle of the diag. Turned off Lsu_mon.");
	end
end

always @ (posedge (tb_top.sim_status[0] & enabled))
begin //{
	if (|(ld_valid[7:0] & finish_mask[7:0]))
	begin  //{
	   for (i = 0; i < 8; i=i+1)
	   begin
		if (ld_valid[i])  
		begin
		   DispPendReq(i);
	        end
	   end
	  `PR_ERROR("lsu_mon", `ERROR, "<C%h> Ld requests pending at the end of simulation. ld_valid = %0h", core_id, ld_valid);
	end  //}
	if (|stb_valid[63:0])
	begin  //{
	   err_cnt = 0;
	   for (i = 0; i < 64; i=i+1)
	   begin
		if (stb_valid[i] & finish_mask[i[5:3]])  
		begin
		//chkr resets the stb valid bits when block_store_kill is asserted.
		//in couple of failures block_store_kill was sampled asserted two cycles after
		//lsu asserted stb_empty. The simulation ended the cycle stb_empty was sampled high 
		//causing moniotr firings with valid entries in stb at end of simulation. Now
		//don't flag an error if squash bit is set and stb_valid is asserted at end
		//of simualation.
		      if (~is_squash_bit_set(i[5:0]))
		      begin
			err_cnt = err_cnt + 1;
			Disp_STB_entry(i[5:3],i[2:0]);
		      end
		end
	   end
	   if (err_cnt)
	   begin
	  	`PR_ERROR("lsu_mon", `ERROR, "<C%h> Store requests pending at the end of simulation. stb_valid = %0h", core_id, stb_valid);
	   end
       end  //}
       err_cnt = 0;
       for (i = 0; i < 8; i=i+1)
       begin  //{
	   if (finish_mask[i] & (pf_cnt[i] != 0))
	   begin
		err_cnt = 1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> Prefetches not finished. Pf_cnt = %0d", core_id, i, pf_cnt[i]);
	   end
	   if (finish_mask[i] & (dcache_inv_cnt[i] != 0))
	   begin
		err_cnt = 1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> D pkt not received for all invalidate reqs. issued by the thread. dcache_inv_cnt = %0d", core_id, i, dcache_inv_cnt[i]);
	   end
	   if (finish_mask[i] & (st_rmo_cnt[i] != 0))  
	   begin
		err_cnt = 1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> rmo_cnt not zero. rmo_cnt = %0d", core_id, i, st_rmo_cnt[i]);
	   end
       end  //}
       if (err_cnt)
       begin
	  `PR_ERROR("lsu_mon", `ERROR, "<C%h> Prefetch/D/RMO_stores requests pending at the end of simulation.", core_id);
       end
end //}

function is_squash_bit_set;
input [5:0] index;
reg [204:0] tmp;
begin
	tmp = stb[index];
	if (tmp[`ST_SQUASH])
		is_squash_bit_set = 1'b1;
	else
		is_squash_bit_set = 1'b0;
end
endfunction


always @ (negedge (`SPC1.l2clk & enabled))
begin //{

	asi_e  = `SPC1.lsu.dcc.dcc_asi_e[7:0];

	lsu_inst_e[`LD] <= `SPC1.dec_ld_inst_e;
	lsu_inst_e[`ST] <= `SPC1.dec_st_inst_e;
	lsu_inst_e[`FP] <= `SPC1.dec_fpldst_inst_e;
	lsu_inst_e[`PREF] <= `SPC1.dec_pref_inst_e;
	lsu_inst_e[`SWAP] <= `SPC1.dec_swap_inst_e;
	lsu_inst_e[`CASA] <= `SPC1.dec_casa_inst_e;
	lsu_inst_e[`LDSTUB] <= `SPC1.dec_ldstub_inst_e;
	lsu_inst_e[`FLUSH] <= `SPC1.dec_flush_inst_e;
	lsu_inst_e[`MEMBAR] <= `SPC1.dec_memstbar_inst_e;
	lsu_inst_e[`LDD] <= `SPC1.dec_ld_inst_e & `SPC1.dec_ldst_dbl_e & ~`SPC1.dec_fpldst_inst_e;
	lsu_inst_e[`STD] <= `SPC1.dec_st_inst_e & `SPC1.dec_ldst_dbl_e & ~`SPC1.lsu.dec_fpldst_inst_e;

       lsu_inst_e[`BLKLD] <= `SPC1.dec_ld_inst_e & `SPC1.dec_fpldst_inst_e & dec_altspace_e & Is_blk_asi(asi_e);
	lsu_inst_e[`BLKST] <= `SPC1.dec_st_inst_e & `SPC1.dec_fpldst_inst_e & dec_altspace_e & Is_blk_asi(asi_e);
	lsu_inst_e[`QLD] <= `SPC1.dec_ld_inst_e & dec_altspace_e & Is_qld_asi(asi_e);
	lsu_inst_e[`ASR_RD_WR] <= `SPC1.dec_sr_inst_e & (`SPC1.dec_ld_inst_e | `SPC1.dec_st_inst_e);
	lsu_inst_e[`PR_RD_WR] <= `SPC1.dec_pr_inst_e & (`SPC1.dec_ld_inst_e | `SPC1.dec_st_inst_e);
	lsu_inst_e[`HPR_RD_WR] <= `SPC1.dec_hpr_inst_e & (`SPC1.dec_ld_inst_e | `SPC1.dec_st_inst_e);
	lsu_inst_e[`FSR_RD_WR] <= `SPC1.dec_fsr_ldst_e & (`SPC1.dec_ld_inst_e | `SPC1.dec_st_inst_e);
end //}

always @ (posedge (`SPC1.l2clk & enabled))
begin //{
	dec_tg0_inst_d <= `SPC1.dec.ded0.decode_mux[31:0];
	dec_tg1_inst_d <= `SPC1.dec.ded1.decode_mux[31:0];
	imm_asi_vld_e <= `SPC1.lsu.dec_imm_asi_vld_d;

	imm_asi_e <= `SPC1.lsu.dec_imm_asi_d;
	dec_altspace_e <= `SPC1.dec_altspace_d;
	dec_altspace_m <= dec_altspace_e;
	dec_altspace_b <= dec_altspace_m;

	exu_ecc_b <= `SPC1.exu_ecc_m;
	exu_lsu_va_error_b <= `SPC1.exu_lsu_va_error_m;

	dec_lsu_tid_e <= `SPC1.dec_lsu_tg_d ? {1'b1, `SPC1.dec_lsu_tid1_d} : {1'b0, `SPC1.dec_lsu_tid0_d}; 	
	dec_lsu_tid_m <= dec_lsu_tid_e;
	dec_lsu_tid_b <= dec_lsu_tid_m;
	dec_lsu_tid_w <= dec_lsu_tid_b;
	
	inst_pc_e <= `SPC1.dec_lsu_tg_d ? {`SPC1.tlu.tlu_pc_1_d[47:2], 2'b0} : {`SPC1.tlu.tlu_pc_0_d[47:2], 2'b0};
	inst_pc_m <= inst_pc_e;
	inst_pc_b <= inst_pc_m;
	inst_pc_w <= inst_pc_b;
	
	inst_e <= `SPC1.dec_lsu_tg_d ? dec_tg1_inst_d : dec_tg0_inst_d;
	inst_m <= inst_e;
	inst_b <= inst_m;

	vaddr_m <= `SPC1.exu_lsu_address_e;
	vaddr_b <= vaddr_m;

	int_st_data_m <= `SPC1.exu_lsu_store_data_e;
	int_st_data_b <= int_st_data_m;
	fp_st_sata_fx2 <= `SPC1.fgu_lsu_fst_data_fx1;

	mmu_dtlb_reload_d1 <= `SPC1.mmu_dtlb_reload;
	mmu_dtlb_reload_d2 <= mmu_dtlb_reload_d1;

	//pcx_thid_d1 <=  `SPC1.lsu.spc_pcx_data_pa[`PCX_THR_ID];
	lsu_inst_m <= lsu_inst_e;
	lsu_inst_b <= lsu_inst_m;

	asi_m <= asi_e;
	asi_b <= asi_m;
end //}

function Is_blk_asi;
input [7:0] asi;
begin
	Is_blk_asi = (asi == `ASI_BLK_AIUP) | (asi == `ASI_BLK_AIUS) | 
		   (asi == `ASI_BLK_AIUPL) | (asi == `ASI_BLK_AIUSL) |
		   (asi == `ASI_BLK_P) | (asi == `ASI_BLK_S) |
		   (asi == `ASI_BLK_PL) | (asi == `ASI_BLK_SL) |
		   (asi == `ASI_BLK_COMMIT_P) | (asi == `ASI_BLK_COMMIT_S);
end
endfunction

function Is_qld_asi;
input [7:0] asi;
begin
 		Is_qld_asi = (asi == `ASI_AIU_BIS_QUAD_LDD_P) | (asi == `ASI_AIU_BIS_QUAD_LDD_S) |
		(asi == `ASI_AIU_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_AIU_BIS_QUAD_LDD_S_LITTLE) |
		(asi == `ASI_NUCLEUS_BIS_QUAD_LDD) | (asi == `ASI_NUCLEUS_BIS_QUAD_LDD_LITTLE) |
		(asi == `ASI_BIS_QUAD_LDD_P) | (asi == `ASI_BIS_QUAD_LDD_S) |
		(asi == `ASI_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_BIS_QUAD_LDD_S_LITTLE) |
		(asi == `ASI_QUAD_LDD) | (asi == `ASI_QUAD_LDD_REAL) |
		(asi == `ASI_QUAD_LDD_L) | (asi == `ASI_QUAD_LDD_REAL_L);
end
endfunction

function Is_bis_asi;
input [7:0] asi;
begin
 		Is_bis_asi = (asi == `ASI_AIU_BIS_QUAD_LDD_P) | (asi == `ASI_AIU_BIS_QUAD_LDD_S) |
		(asi == `ASI_AIU_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_AIU_BIS_QUAD_LDD_S_LITTLE) |
		(asi == `ASI_NUCLEUS_BIS_QUAD_LDD) | (asi == `ASI_NUCLEUS_BIS_QUAD_LDD_LITTLE) |
		(asi == `ASI_BIS_QUAD_LDD_P) | (asi == `ASI_BIS_QUAD_LDD_S) |
		(asi == `ASI_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_BIS_QUAD_LDD_S_LITTLE);
end
endfunction

always @ (negedge (`SPC1.l2clk & enabled))
begin //{
	Chk_store;
	store_alloc = 1'b0;
	if (lsu_inst_m != 0)
	begin
		if (`SPC1.dec_flush_lm)
		begin
			lsu_inst_m <= 0;
			`PR_INFO("lsu_mon", 21, "<C%0h> <T%0h> <%0h> M_stage: %s(VA=%0h) Flushed due to IFU Flush.", core_id, dec_lsu_tid_m, inst_pc_m, tb_top.intf0.xlate(inst_m),vaddr_m);
		end
	end
		
	if (lsu_inst_b != 0)
	begin //{
		if (lsu_inst_b[`BLKLD])  print_inst = " BLKLD,";
		else if (lsu_inst_b[`BLKST])  print_inst = " BLKST,";
		else if (lsu_inst_b[`QLD])  print_inst = " QLD,";
		else  print_inst = "";

		if (`SPC1.dec_flush_lb)
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%0h> <T%0h> <%0h> B_stage: %s(VA=%0h) Flushed due to IFU Flush.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		else if (`SPC1.tlu_flush_lsu_b)
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h) Flushed due to TLU Flush.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		//casa is a two cycle operation. If there is an err on the 2nd cycle of casa then also
		//casa shd be killed.
		//This function will also chk for errors on 2nd cycle.
		else if (Is_exu_error(exu_lsu_va_error_b, exu_ecc_b))  
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h <%0h> B_stage: %s(VA=%0h) Flushed due to EXU error.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		else if ((`SPC1.fgu_cecc_fx2 || `SPC1.fgu_uecc_fx2) && lsu_inst_b[`ST] && lsu_inst_b[`FP]) 
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h) Flushed due to FGU error.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		else if (IsExc(core_id)) 
			lsu_inst_b <= 0;
		else if (!`SPC1.lsu_tlb_miss_b_)
		begin
			`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h)%s ASI = %0h. DTLB miss.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, asi_b);
				//Insert_tlb_miss_info;
		end
		else 
		begin //{
		//Lsu doesn't assert lsu_sync for an exception or dtlb miss. Since for
		//an exception tlu anyway tells the front end to flush itself there is 
		//no reason for LSU to flush the front end then TLU to flush it again.
		//Lsu treats the dtlbmiss as an exception that it flushes the  inst and
		//handles it when it is reissued by the front end.

		   if (`SPC1.lsu_tlb_bypass_b)
		   begin
			if (`SPC1.lsu_sync != 8'b0)
			begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. LSU_sync. DTLB Bypass.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC1.lsu.tlb_pgnum[39:13], vaddr_b[12:0]},  asi_b);
			end
			else
			begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. DTLB Bypass.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC1.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b);
			end
		  end
	          else
		  begin
			if (`SPC1.lsu_sync != 8'b0)
			begin
			  if (lsu_inst_b[`ST])
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h, Store_data = %0h. LSU_sync. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC1.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b,int_st_data_b);
			  end
			  else
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. LSU_sync. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC1.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b);
			  end
			end
			else
			begin
			  if (lsu_inst_b[`ST])
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h, Store_data = %0h. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC1.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b, int_st_data_b);
			  end
			  else
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC1.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b);
		          end
		        end
		  end

	          if (lsu_inst_b[`LD] || lsu_inst_b[`PREF] || lsu_inst_b[`SWAP] || lsu_inst_b[`CASA] || lsu_inst_b[`LDSTUB])
		  begin //{
			if (((lsu_inst_b == 16'h1) || (lsu_inst_b == 16'h5)) & `SPC1.lsu.stb_cam_hit)
			begin
				`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h>: LSU_sync asserted due to STB RAW.", core_id, dec_lsu_tid_b, inst_pc_b);
			end
		  end //}

		  if (lsu_inst_b[`LD])
			Insert_ld_miss_info;

		  if (lsu_inst_b[`ST])  //for atomics both ld and store signals are asserted
		  begin
			Make_STB_data;
			store_alloc = 1'b1;
		  end
		  Insert_in_last_inst_array;

		if (`SPC1.lsu_trap_flush[7:0])
		begin
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h> Trap Flush asserted.", core_id, decode_tid(`SPC1.lsu_trap_flush[7:0]));
		end
	    end //}
	end //}
end //}

//STB ue testing:
//This is how we test squashing of stores by LSU_mon:
//Whenever lsu asserts err_sbdiou signal, the monitor sets the squash
//bit in the STB for the rest of the stores. If any of these squashed stores
//is issued on the asi ring or to the PCX interface the monitor complains.
//The squashed stores are deallocated when either a block_store_kill is
//asserted or dealloc signals are asserted by the LSU.
//When the block_store_kill is asserted, it tells the IFU to dealloc
//all the pending stores in the IFU. It means the when block_store_kill
//is asserted we have deallocated all the non-squashed requests from STB.
//The 0in_chkr ensures that LSU flags the correct index and priv with the
//the sbdiou signal to TLU.


always @ (negedge (`SPC1.l2clk & enabled))
begin
	if (`SPC1.lsu_l15_valid & `SPC1.lsu.spc_pcx_data_pa[129])
		Chk_pcx_req_pkt(`SPC1.lsu.spc_pcx_data_pa[129:0]);  //chk if we need .lsu here
	if ((`SPC1.lsu_rngl_cdbus[64:63] == 2'b11) & ~`SPC1.lsu_rngl_cdbus[59])
		Chk_st_on_ASI_ring(`LOCAL);

	if ((`SPC1.lsu_rngf_cdbus[64:63] == 2'b11) & ~`SPC1.lsu_rngf_cdbus[59])
		Chk_st_on_ASI_ring(`FAST);

	//if (`SPC1.l15_lsu_valid)
		//Chk_cpx_response_pkt({`SPC1.l15_lsu_valid, `SPC1.l15_lsu_cpkt[17:13],`SPC1.l15_lsu_cpkt[11:0],`SPC1.l15_spc_data1[127:0]});
	
	if (`SPC1.cpx_spc_data_cx[145])
		Chk_cpx_response_pkt(`SPC1.cpx_spc_data_cx);
	
	if (`SPC1.lsu_complete[7:0] != 8'b0)
	begin
		if (`SPC1.lsu_complete[0]) Chk_ld_complete(0);
		if (`SPC1.lsu_complete[1]) Chk_ld_complete(1);
		if (`SPC1.lsu_complete[2]) Chk_ld_complete(2);
		if (`SPC1.lsu_complete[3]) Chk_ld_complete(3);
		if (`SPC1.lsu_complete[4]) Chk_ld_complete(4);
		if (`SPC1.lsu_complete[5]) Chk_ld_complete(5);
		if (`SPC1.lsu_complete[6]) Chk_ld_complete(6);
		if (`SPC1.lsu_complete[7]) Chk_ld_complete(7);
	end
	
	if (`SPC1.lsu_block_store_kill[7:0] != 8'b0)
	begin
		if (`SPC1.lsu_block_store_kill[0]) Squash_STB(0);
		if (`SPC1.lsu_block_store_kill[1]) Squash_STB(1);
		if (`SPC1.lsu_block_store_kill[2]) Squash_STB(2);
		if (`SPC1.lsu_block_store_kill[3]) Squash_STB(3);
		if (`SPC1.lsu_block_store_kill[4]) Squash_STB(4);
		if (`SPC1.lsu_block_store_kill[5]) Squash_STB(5);
		if (`SPC1.lsu_block_store_kill[6]) Squash_STB(6);
		if (`SPC1.lsu_block_store_kill[7]) Squash_STB(7);
	end
	
	if (`SPC1.lsu_stb_dealloc[7:0] != 8'b0)
	begin
		if (`SPC1.lsu_stb_dealloc[0]) Dealloc_STB(0);
		if (`SPC1.lsu_stb_dealloc[1]) Dealloc_STB(1);
		if (`SPC1.lsu_stb_dealloc[2]) Dealloc_STB(2);
		if (`SPC1.lsu_stb_dealloc[3]) Dealloc_STB(3);
		if (`SPC1.lsu_stb_dealloc[4]) Dealloc_STB(4);
		if (`SPC1.lsu_stb_dealloc[5]) Dealloc_STB(5);
		if (`SPC1.lsu_stb_dealloc[6]) Dealloc_STB(6);
		if (`SPC1.lsu_stb_dealloc[7]) Dealloc_STB(7);
	end

	if (`SPC1.lsu_block_store_stall)
	      Chk_block_store;

	if (`SPC1.lsu.lsu_block_store_alloc[7:0] != 8'b0)
		Set_block_store_parameters;

	if (`SPC1.lsu_sbdiou_err_g || `SPC1.lsu_sbapp_err_g)
		Squash_store;

	if (`SPC1.lsu_stb_flush_g)
		st_priv[`SPC1.lsu_stberr_tid_g] = get_priv_on_flush(`SPC1.lsu_stberr_tid_g);
end

function [1:0] get_priv_on_flush;
input [2:0] tid;
reg [2:0] sq_index;
reg [204:0] tmp;

begin
	sq_index = `SPC1.lsu_stberr_index_g;
	tmp = stb[{tid, sq_index}];
	get_priv_on_flush = tmp[`ST_PRIV];
end
endfunction

task Chk_block_store;
reg [20:0] inst;
reg [2:0] thid;
begin
		thid = `SPC1.lsu_block_store_tid;
		bst_inst_data = stb[{thid, rdptr[thid]}];
		inst = bst_inst_data[`LSU_MON_INST];

		if (~inst[`BLKST])
		begin
			Disp_STB_entry(thid, iss_ptr[thid]);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted blk_store_stall while the req at the top of STB is not blkst as shown above", core_id, thid);
		end
end
endtask

//lsu can assert block_store_stall for a new block store while it has not yet written
//the 8 stb entries from the previous blk store.

task Set_block_store_parameters;
reg [2:0] thid;
begin
	
		thid = decode_tid(`SPC1.lsu.lsu_block_store_alloc[7:0]);
		if (lsu_bst_active[thid])
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted blk_store_alloc while the bst_active is already set for this thread.", core_id, thid);
		end
		else
		begin
			lsu_bst_active[thid] = 1'b1;
			bst_active_thid = thid;
			if (`SPC1.lsu.fgu_fst_ecc_error_fx2)
			    bst_fgu_err = 1'b1;
			else
			    bst_fgu_err = 1'b0;
		end
end
endtask

task Squash_store;
reg [2:0] thid;
reg [2:0] sq_index;
reg [2:0] i;
reg [204:0] tmp;
reg [3:0] squash_cnt;
reg [1:0] priv;

begin
	thid = `SPC1.lsu_stberr_tid_g;
	sq_index = `SPC1.lsu_stberr_index_g;
	priv = `SPC1.lsu_stberr_priv_g;
	tmp = stb[{thid, sq_index}];
	squash_cnt = 0;
     	`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Sbdiou/sbapp seen for index = %h and priv = %h.", core_id, thid, sq_index,  priv);

	st_priv[thid] = tmp[`ST_PRIV];

	//lsu can assert deallocate before it asserts the sbdiou signal. 
	//In that case iss_ptr won't be equal to sbdiou index.
	//if (sq_index != iss_ptr[thid])
	//begin
	//	Disp_STB_entry(thid, iss_ptr[thid]);
	//	`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted sbdiou/sbapp with index %0h while the next req to be issued is at index %0h.", core_id, thid, sq_index, iss_ptr[thid]);
	//end
	
	//If there is only one store in the store buffer which gets an sbdiou error, then LSU can deallocate
	//the store and then assert sbdiou. The deallocation will cause the stb issue_ptr to move 
	//forward to an inst. that has already been issued and completed and this chk can fire. So
	//removing this chk. 

        //if (tmp[`L2_ST_ISS])
        //begin
         //       Disp_STB_entry(thid, iss_ptr[thid]);
          //      `PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store reissued on the PCX interface.", core_id, thid, tmp[`MEMOP_PA]);
        //end

	if (iss_ptr[thid] == wrptr[thid])
	begin
	    if (stb_valid[{thid, wrptr[thid]}])
		squash_cnt = 8;
	    else
	    begin
	    //changing it to an info message because if there is only one valid entry in store buffer that
	    //gets an sbdiou then LSU can deallocate the entry and then issue sbdiou.
              	//`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Lsu asserted sbdiou/sbapp while there are no valid entries in STB to be issued.", core_id, thid);
              	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> sbdiou/sbapp squashed only one entry in STB.", core_id, thid);
	    end
	end
	else
	begin
	  if (iss_ptr[thid] < wrptr[thid])
		squash_cnt = wrptr[thid] - iss_ptr[thid];
	  else if (iss_ptr[thid] > wrptr[thid])
		squash_cnt = wrptr[thid] + (8 - iss_ptr[thid]);
	end
	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> SQUASH_STORE:iss_ptr = %0h, wrptr = %0h, squash_cnt = %0h.", core_id, thid, iss_ptr[thid], wrptr[thid], squash_cnt);

	i = iss_ptr[thid];
		
	while (squash_cnt)
	begin
		tmp = stb[{thid, i}];
		tmp[`ST_SQUASH] = 1'b1;
		if (priv < tmp[`ST_PRIV])
		begin
              		`PR_INFO("lsu_mon", `INFO, "<C%h> <T%0h> <PA = %0h> Sbdiou/sbapp signalled. Err in user/priv level store is squashing a higher priv level store.", core_id, thid, tmp[`MEMOP_PA]);
			priv = tmp[`ST_PRIV];
		end
			
		stb[{thid, i}] = tmp;
               	`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <PA = %0h> STB_entry[%0h] squashed.", core_id, thid, tmp[`MEMOP_PA], i);
	   	 
		 i = i + 1;
		 squash_cnt = squash_cnt - 1'b1;
	end
end
endtask

function [2:0] decode_tid;
input [7:0] thid_encode;
begin
	case (thid_encode)
	   8'h1: decode_tid = 3'b0;
	   8'h2: decode_tid = 3'h1;
	   8'h4: decode_tid = 3'h2;
	   8'h8: decode_tid = 3'h3;
	   8'h10: decode_tid = 3'h4;
	   8'h20: decode_tid = 3'h5;
	   8'h40: decode_tid = 3'h6;
	   8'h80: decode_tid = 3'h7;
	   default: 
	   begin
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> decode_tid. Incorrect value of thid input = %0h.", core_id, thid_encode, thid_encode);
	   end
	endcase
end
endfunction

task Chk_ld_complete;
input [2:0] thid;
reg [`LD_Pend_Width] tmp;
begin
	tmp = ld_pend_array[thid];

	if (ld_valid[thid])
	begin
		if ((tmp[`L2_ISS] != 4'hf) || (tmp[`L2_RESP] != 4'hf))
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted lsu_complete while the l2_iss and l2_resp bits are not F.", core_id, thid);
		end
		ld_valid[thid] = 1'b0;
		`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h> %s(VA=%0h) Complete. Setting ld_valid to 0.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
	end

	tmp = last_inst_array[thid];
	`PR_INFO("lsu_mon", 24, "<C%h> <T%0h> <%0h> %s(VA=%0h) Complete.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
end
endtask
	
task Chk_pcx_req_pkt;
input [129:0] pcx_pkt;
reg [2:0] thid;
reg [`LD_Pend_Width] tmp, tmp1; 
reg [15:0] inst; 
reg [11*8:0] req;
reg [39:0] addr;
begin 
	thid = pcx_pkt[`PCX_THR_ID]; 
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	req = DispPCXReq(pcx_pkt);
	addr = pcx_pkt[`PCX_ADDR];


	if (pcx_pkt[`PCX_CPU_ID] != core_id)
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> cpu_id (spc_pcx_data_pa[122:120]) = %h is not = %0h when the lsu made a %s req to gasket.", core_id, pcx_pkt[`PCX_THR_ID], addr, pcx_pkt[122:120], core_id, req);
	
	
	if ((pcx_pkt[`PCX_RQTYP] == `PCX_LOAD) || (pcx_pkt[`PCX_RQTYP] == `PCX_CAS1) || (pcx_pkt[`PCX_RQTYP] == `PCX_CAS2) || (pcx_pkt[`PCX_RQTYP] == `PCX_SWAP_LDSTUB))
	begin
	  if (~ld_valid[thid])
	  begin
		ld_valid[thid] = 1'b1;  //we have sent a req to gasket and are waiting for response
		`PR_INFO("lsu_mon", 22, "<C%0h> <T%0h> Setting ld_valid[%0h].", core_id, thid, thid);
	  end
		if (~inst[`BLKLD])
		begin
			if (tmp[`MEMOP_PA] != addr)
			begin
				if ((tmp[`INST_ASI] == 8'h41) || (tmp[`INST_ASI] == 8'h73) || ((tmp[`INST_ASI] == 8'h45) && ((tmp[`MEMOP_PA] == 8'h10) || (tmp[`MEMOP_PA] == 8'h18))))
				begin
					`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <PA = %0h> PA mismatch on gasket for %s request. Ignoring the mismatch as inst. is issued with asi 41, 73 or 45 (with VA 0x10 or 18).", core_id, thid, addr, req);
				end
				else
				begin
					DispPendReq(thid);
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A %s request made to gasket by LSU while the pending req is with PA %0h.", core_id, thid, addr, req, tmp[`MEMOP_PA]);
				end
			end
		end
	end

	case (pcx_pkt[`PCX_RQTYP])
	   `PCX_LOAD: 
	   begin
		if (pcx_pkt[`PCX_PF])
		begin
			if (~inst[`PREF])
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A prefetch request made to gasket by LSU which mismatches the pending request from the thread.", core_id, thid, addr);
			end
			if (pcx_pkt[`PCX_INV])
			begin
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: PREF_ICE(VA=%0h) Issued. pf_cnt not updated.", core_id, thid, tmp[`INST_VA], tmp[`MEMOP_VA]);
			end
			else
			begin
			 	pf_cnt[thid] = pf_cnt[thid] + 1'b1;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Issued. pf_cnt = %0d.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], pf_cnt[thid]);
			end
			tmp[`L2_ISS] = 4'hF;
			tmp[`L2_RESP] = 4'hF; //we don't wait for a prefetch response from gasket
			ld_pend_array[thid] = tmp;
		end
		else 
		begin
			if (pcx_pkt[`PCX_INV])
			begin
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Dcache invalidate pkt issued to CCX.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
				dcache_inv_cnt[thid] = dcache_inv_cnt[thid] + 1'b1;
			end
			else
			begin
				Chk_req_load(pcx_pkt);
			end
		end
	    end
           `PCX_CAS1, `PCX_CAS2:
	   begin
		if (~inst[`CASA])
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> CASA request made to gasket by LSU while no such request request is pending from this thread.", core_id, thid, addr);
		end
		if (pcx_pkt[`PCX_RQTYP] == `PCX_CAS1)
		begin
			tmp[`L2_ISS] = 4'hE;
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) (CAS1) Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			ld_pend_array[thid] = tmp;
		end
		if (pcx_pkt[`PCX_RQTYP] == `PCX_CAS2)
		begin
			tmp[`L2_ISS] = 4'hF;
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) (CAS2) Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			ld_pend_array[thid] = tmp;
			chk_store_issue_to_pcx(pcx_pkt);
		end
		
	   end
	   `PCX_SWAP_LDSTUB:
	   begin
		if (~inst[`SWAP] && ~inst[`LDSTUB])
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> %s request made to gasket by LSU while no such request request is pending from this thread.", core_id, thid, addr, req);
		end
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Issued to gasket. store_data = %0h", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], pcx_pkt[`PCX_DATA]);
		tmp[`L2_ISS] = 4'hF;
		ld_pend_array[thid] = tmp;
		
		chk_store_issue_to_pcx(pcx_pkt);
	   end

	    `PCX_STORE:
	    begin
		chk_store_issue_to_pcx(pcx_pkt);
	    end
	   
	   default: `PR_INFO("lsu_mon", 21, "<C%h> <T%0h> <%0h>: %s Issued to gasket.", core_id, thid, addr, req);
	endcase
end
endtask

task Chk_cpx_response_pkt;
input [145:0] cpx_pkt;
reg [2:0] thid;
begin
	thid = cpx_pkt[`CPX_THR_ID];	

	casex ({cpx_pkt[`CPX_RTNTYP], cpx_pkt[`CPX_ERR], cpx_pkt[`CPX_NC], cpx_pkt[`CPX_ATM], cpx_pkt[`CPX_PF]})
	  {4'b0, 2'bxx, 1'bx, 1'b0, 1'b0}:  
	  begin
		chk_ccx_ld_response(cpx_pkt);
	  end

	  {4'b0, 2'bxx, 1'b1, 1'b0, 1'b1}:  
	  begin
		if (pf_cnt[thid] == 8'b0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Prefetch response received from gasket while the pf_cnt is 0 for this thread.", core_id, thid);
		end
		else
		begin
			pf_cnt[thid] = pf_cnt[thid] - 1'b1;
			`PR_INFO("lsu_mon", 26, "<C%h> <T%0h> Prefetch response received. pfcnt = %0d.", core_id, thid, pf_cnt[thid]);
		end
	  end
	  
	  {4'h8, 2'bxx, 1'b1, 1'b0, 1'b0}:  
		chk_ccx_ld_response(cpx_pkt);

	  {4'h4, 2'bxx, 1'bx, 1'b0, 1'b0}:  
	   begin
	      if (cpx_pkt[123])  //D pkt
	      begin //{
		if (cpx_pkt[120:118] != core_id)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> D response received from gasket with core_id =%h.", core_id, thid, cpx_pkt[120:118]);
		end
		if (dcache_inv_cnt[thid] == 8'b0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> D response received from gasket while the Dcache_inv_cnt is 0 for this thread.", core_id, thid);
		end
		else
		begin
			dcache_inv_cnt[thid] = dcache_inv_cnt[thid] - 1'b1;
			`PR_INFO("lsu_mon", 26, "<C%h> <T%0h> D response received. Dcache_inv_cnt = %0d.", core_id, thid, dcache_inv_cnt[thid]);
		end
	     end  //}
	     else if (cpx_pkt[124])  //I pkt
	     begin
		if (cpx_pkt[120:118] != core_id)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> I response received from gasket with core_id =%h.", core_id, thid, cpx_pkt[120:118]);
		end
		//`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> I pkt.", core_id, thid);
	     end
	     else if (cpx_pkt[124:123] == 2'b0)
	     begin
		if (cpx_pkt[120:118] == core_id)
		begin
			chk_ccx_st_response(cpx_pkt);
	        end
		else
		begin
			`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Store Ack pkt received from core %0h.", core_id, thid, cpx_pkt[120:118]);
		end
	     end
	   end

	  {4'h1, 2'bxx, 1'bx, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> IFILL1 return.", core_id, thid);
	  {4'h1, 2'bxx, 1'bx, 1'b1, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> IFILL2 return.", core_id, thid);
	  {4'h9, 2'bxx, 1'b1, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> NCU IFILL return.", core_id, thid);
	  
	  {4'b0, 2'bxx, 1'b1, 1'b1, 1'b0}:  
	  begin
		chk_ccx_atm_response(cpx_pkt);
	  end
	  {4'h4, 2'bxx, 1'b1, 1'b1, 1'b0}:  
	  begin
		if ((cpx_pkt[`CPX_RTNTYP] == 4'h4) & (cpx_pkt[120:118] == core_id))
		begin
			chk_ccx_atm_response(cpx_pkt);
			chk_ccx_st_response(cpx_pkt);
		end
	  end
			
	  {4'h2, 2'bxx, 1'b1, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Stream Ld return.", core_id, thid);
	  {4'h6, 2'bxx, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Stream store Ack.", core_id, thid);
	  {4'h5, 2'bxx, 1'b1, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> MMU ld return.", core_id, thid);
	  {4'h7, 2'b00, 1'b0, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Interrupt return.", core_id, thid);
	  {4'h3, 2'b00, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Eviction Invalidation.", core_id, thid);
	  {4'hc, 2'bxx, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> L2 Indication.", core_id, thid);
	  
	  {4'hd, 2'bxx, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Soc Error Indication.", core_id, thid);
	   
	  default:
	  begin
		`PR_ALWAYS("lsu_mon", `ALWAYS, "CPX_PKT data.");
		`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%0h> <T%0h> rtn_typ = %0h, err_bits = %0h, nc=%0b, atm = %0b, pf = %0b",  core_id, cpx_pkt[`CPX_THR_ID], cpx_pkt[`CPX_RTNTYP], cpx_pkt[`CPX_ERR], cpx_pkt[`CPX_NC], cpx_pkt[`CPX_ATM], cpx_pkt[`CPX_PF]);

		`PR_ERROR("lsu_mon", `ERROR, "<C%0h> <T%0h> Can't recognise the CPX pkt.",  core_id, thid);
	  end

	endcase
end
endtask

task chk_ccx_ld_response;
input [145:0] cpx_pkt;
reg [2:0] thid;
reg [20:0] inst;
reg [39:0] cpx_pa, inst_pa;
reg [`LD_Pend_Width] tmp;
reg [3:0] pkt_type;
begin
	thid = cpx_pkt[`CPX_THR_ID];
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	inst_pa = tmp[`MEMOP_PA];
	pkt_type = cpx_pkt[`CPX_RTNTYP];

	   if (ld_valid[thid])
	   begin 
			`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) L2 response.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
		/* 
			if (inst_pa[39] != pkt_type[3])
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> ccx pkt_type = %h mismatches the ld_pa bit 39. ld_pa = %0h.", core_id, thid, pkt_type, inst_pa);
			end
		*/

			if (inst[`BLKLD])
			begin
				if (tmp[`L2_RESP] == 4'h0) 
				begin
					tmp[`L2_RESP] = 4'h1; 
					tmp[`L2_ERR0] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 1.", core_id, thid);
					end

				end
				else if (tmp[`L2_RESP] == 4'h1) 
				begin
					tmp[`L2_RESP] = 4'h3; 
					tmp[`L2_ERR1] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 2.", core_id, thid);
					end
				end
				else if (tmp[`L2_RESP] == 4'h3) 
				begin
					tmp[`L2_RESP] = 4'h7; 
					tmp[`L2_ERR2] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 3.", core_id, thid);
					end
				end
				else if (tmp[`L2_RESP] == 4'h7) 
				begin
					tmp[`L2_RESP] = 4'hF; 
					tmp[`L2_ERR3] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 4.", core_id, thid);
					end

					//is_blkld[thid] = 1'b1;
					if ((tmp[`L2_ERR0] == `ND) || (tmp[`L2_ERR1] == `ND) || (tmp[`L2_ERR2] == `ND) ||  (tmp[`L2_ERR3] == `ND))
						l2_blk_ld_errtype[thid] = `ND;
					else if ((tmp[`L2_ERR0] == `UE) || (tmp[`L2_ERR1] == `UE) || (tmp[`L2_ERR2] == `UE) ||  (tmp[`L2_ERR3] == `UE))
						l2_blk_ld_errtype[thid] = `UE;
					else if ((tmp[`L2_ERR0] == `CE) || (tmp[`L2_ERR1] == `CE) || (tmp[`L2_ERR2] == `CE) ||  (tmp[`L2_ERR3] == `CE))
						l2_blk_ld_errtype[thid] = `CE;
					else 
						l2_blk_ld_errtype[thid] = `NE;
				end
				else
				begin
					DispPendReq(thid);
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when response pkt received from ccx.", core_id, thid);
				end
			end
			else if (Is_single_pcx_req_ld(inst)) 
			begin
				//is_blkld[thid] = 1'b0;
				if (tmp[`L2_RESP] != 4'hE)
				begin
					DispPendReq(thid);
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when response pkt received from ccx.", core_id, thid);
				end
				//`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Setting L2_resp bits to F.", core_id, thid);
				tmp[`L2_RESP] = 4'hF;
			end
			else
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Load response received from gasket for thid %h while no load request pending from core for this thread.", core_id, thid, thid);
	     end
	     else
	     begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Load response received from gasket while no load request pending from core for this thread.", core_id, thid);
	     end

	ld_pend_array[thid] = tmp;
end
endtask

task chk_ccx_atm_response;
input [145:0] cpx_pkt;
reg [2:0] thid;
reg [20:0] inst;
reg [39:0] inst_pa;
reg [`LD_Pend_Width] tmp;
begin
	thid = cpx_pkt[`CPX_THR_ID];
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	inst_pa = tmp[`MEMOP_PA];

	if (~ld_valid[thid])
	begin
		if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ld response received from gasket while no request pending from core for this thread.", core_id, thid);
		end
		else
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ack response received from gasket while no request pending from core for this thread.", core_id, thid);
		end
	end
        else
   	begin 
		if (~inst[`SWAP] && ~inst[`CASA] && ~inst[`LDSTUB])
		begin
			DispPendReq(thid);
			if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
			begin
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ld response received from gasket which mismatches the request pending from this thread.", core_id, thid);
			end
			else
			begin
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ack response received from gasket which mismatches the request pending from this thread.", core_id, thid);
			end
		end
		else
		begin
		if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
		begin
			`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) Atomic ld response.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
		end
		else
		begin
			`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) Atomic ack.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
		end

		   if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
		   begin
			if (tmp[`L2_RESP] == 4'hC) tmp[`L2_RESP] = 4'hD; 
			else
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when atomic ld return pkt received from ccx.", core_id, thid);
			end
		  end
		  else
		  begin
			if (tmp[`L2_RESP] == 4'hD) tmp[`L2_RESP] = 4'hF; 
			else
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when atomic ack pkt received from ccx.", core_id, thid);
			end
		  end
		end
	end
	ld_pend_array[thid] = tmp;
end
endtask

task chk_ccx_st_response;
input [145:0] cpx_pkt;
reg [2:0] thid;
reg [20:0] inst;
reg [39:0] cpx_pa, inst_pa;
reg [204:0] tmp;
reg [3:0] pkt_type;
begin
	thid = cpx_pkt[`CPX_THR_ID];
	tmp = stb[{thid, ret_ptr[thid]}];
	inst = tmp[`LSU_MON_INST];
	inst_pa = tmp[`MEMOP_PA];
	pkt_type = cpx_pkt[`CPX_RTNTYP];


//is received. There could be some other store sitting in the STB at that time.

//Chk for squash bit only for non-bis responses.


	if (cpx_pkt[`CPX_BIS])  //response to rmo store
	begin
		if (st_rmo_cnt[thid] == 0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> L2 response received for an rmo store while the st_rmo_cnt for this thread is 0.", core_id, thid);
		end
		else
		begin
			st_rmo_cnt[thid] = st_rmo_cnt[thid] - 1'b1;
			`PR_INFO("lsu_mon", 25, "<C%0h> <T%0h> Store ack received for RMO store. rmo_cnt = %0d", core_id, thid, st_rmo_cnt[thid]);
		end
	end
	else
	begin
	   if (tmp[`ST_SQUASH])
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> L2 response received while the SQUASH bit is set in the STB entry %0h.", core_id, thid, ret_ptr[thid]);
	   
           if (~stb_valid[{thid, ret_ptr[thid]}])
           begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Store ack received while that entry is invalid in STB.", core_id, thid);
	   end
	   else
	   begin
	      if (~cpx_pkt[`CPX_ATM])  //don't print this message for atomic return
	      begin
		`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) STB[%0d] Store ack.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA], ret_ptr[thid]);
              end
	      tmp[`L2_ACK] = 1'b1;
	      stb[{thid, ret_ptr[thid]}] = tmp;
		ret_ptr[thid] = ret_ptr[thid] + 1'b1;
		//`PR_INFO("lsu_mon", 22, "<C%0h> <T%0h> ret_ptr = %0d.", core_id, thid, ret_ptr[thid]);
	   end
	end
end
endtask

task Chk_req_load;
input [129:0] pcx_pkt;
reg [2:0] thid;
reg [`LD_Pend_Width] tmp;
reg [39:0] pcx_pa, inst_pa;
reg [20:0] inst;
reg [11*8:0] req;
begin
	
	thid = pcx_pkt[`PCX_THR_ID];
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	pcx_pa = pcx_pkt[`PCX_ADDR];
	inst_pa = tmp[`MEMOP_PA];
	req = DispPCXReq(pcx_pkt);

	if (inst[`BLKLD])
	begin
		if (pcx_pa[39:6] != inst_pa[39:6])
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A load request made to gasket by LSU while the pending req has PA %0h.", core_id, thid, pcx_pa, tmp[`MEMOP_PA]);
		end
		if (pcx_pa[5:0] == 6'b0)
		begin
			if (tmp[`L2_ISS] != 4'h0 )
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 1st load request (pa[5:0] = 6'b0) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				tmp[`L2_ISS] = 4'h1;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 1st blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			end
				
		end
		if (pcx_pa[5:0] == 6'h10)
		begin
			if (tmp[`L2_ISS] != 4'h1)
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 2nd load request (pa[5:0] = 6'h10) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				tmp[`L2_ISS] = 4'h3;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 2nd blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			end
		end
		if (pcx_pa[5:0] == 6'h20)
		begin
			if (tmp[`L2_ISS] != 4'h3)
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 3rd load request (pa[5:0] = 6'h20) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				tmp[`L2_ISS] = 4'h7;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 3rd blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			end
		end
		if (pcx_pa[5:0] == 6'h30)
		begin
			if (tmp[`L2_ISS] != 4'h7)
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 4th load request (pa[5:0] = 6'h30) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 4th blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
				tmp[`L2_ISS] = 4'hF;
			end
		end
		ld_pend_array[thid] = tmp;
	end
	else if (Is_single_pcx_req_ld(inst)) 
	begin
	  if (tmp[`L2_ISS] == 4'hF)
	  begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Load request  made to gasket by LSU while this request has already been issued to gasket.", core_id, thid, pcx_pa);
	  end
	  else
	  begin
		tmp[`L2_ISS] = 4'hF;
		ld_pend_array[thid] = tmp;
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
	  end
	end
	else
	begin
		DispPendReq(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A load request made to gasket by LSU while there is no such ld request pending from this thread.", core_id, thid, pcx_pa);
	end
end
endtask

	
function Is_single_pcx_req_ld;
input [20:0] inst;
begin
	if (inst[`LDD] || inst[`QLD] || inst[`FSR_RD_WR] || (inst == 21'h1) || (inst == 21'h5))
		Is_single_pcx_req_ld = 1'b1;
	else
		Is_single_pcx_req_ld = 1'b0;
	//`PR_INFO("lsu_mon", 22, "<C%0h> Is_single_pcx_req_ld = %b. ", core_id, Is_single_pcx_req_ld);
end
endfunction
			          

function Is_trap;
input [2:0]tid;

begin
	Is_trap = 1'b0;
	case (`SPC1.lsu_trap_flush[7:0])
		8'h01: if (tid == 3'h0) Is_trap = 1'b1;
		8'h02: if (tid == 3'h1) Is_trap = 1'b1;
		8'h04: if (tid == 3'h2) Is_trap = 1'b1;
		8'h08: if (tid == 3'h3) Is_trap = 1'b1;
		8'h10: if (tid == 3'h4) Is_trap = 1'b1;
		8'h20: if (tid == 3'h5) Is_trap = 1'b1;
		8'h40: if (tid == 3'h6) Is_trap = 1'b1;
		8'h80: if (tid == 3'h7) Is_trap = 1'b1;
	endcase
end
endfunction

function [8*11:0] DispPCXReq;
input [129:0] pcx_pkt;
begin
	casex ({pcx_pkt[`PCX_RQTYP], pcx_pkt[`PCX_NC], pcx_pkt[`PCX_INV], pcx_pkt[`PCX_PF], pcx_pkt[`PCX_BIS]})
		{5'h0, 1'b1, 1'b0, 1'b1, 1'b0}: DispPCXReq = "PREF";
		{5'h0, 1'b1, 1'b1, 1'b1, 1'b0}: DispPCXReq = "PREF_ICE";
		{5'h0, 1'bx, 1'b0, 1'b0, 1'b0}: DispPCXReq = "LD";
		{5'h0, 1'bx, 1'b1, 1'b0, 1'b0}: DispPCXReq = "D";  
		{5'h10, 1'bx, 1'b0, 1'b0, 1'b0}: DispPCXReq = "I";
		{5'h10, 1'b0, 1'b1, 1'b0, 1'b0}: DispPCXReq = "I";
		{5'h1, 1'bX, 1'bX, 1'b0, 1'b0}: DispPCXReq = "ST";
		{5'h1, 1'bX, 1'bX, 1'b1, 1'b1}: DispPCXReq = "BLKST";
		{5'h1, 1'bX, 1'bX, 1'b0, 1'b1}: DispPCXReq = "BIS";
		{5'h2, 1'b1, 1'bX, 1'b0, 1'b0}: DispPCXReq = "CASA1";
		{5'h3, 1'b1, 1'bX, 1'b0, 1'b0}: DispPCXReq = "CASA2";
		{5'h7, 1'b1, 1'bX, 1'b0, 1'b0}: DispPCXReq = "SWAP_LDSTUB";
		{5'h4, 1'b1, 1'b0, 1'b0, 1'b0}: DispPCXReq = "STREAM_LD";
		{5'h5, 1'b1, 1'b0, 1'b0, 1'bx}: DispPCXReq = "STREAM_ST";
		{5'h8, 1'b1, 1'b0, 1'b0, 1'b0}: DispPCXReq = "MMU_LD";
		//{5'h9, 1'b0, 1'b0, 1'b0, 1'b0}: DispPCXReq = "INT";
		default:
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%0h> <T%0h> <%0h> Can't recognise the PCX pkt type. rq_type = %h, nc_bit = %0b, inv_bit = %0b, pf_bit = %0b, bis_bit = %0b. pcx_pkt[129:0] = %h",  core_id, pcx_pkt[`PCX_THR_ID], pcx_pkt[`PCX_ADDR], pcx_pkt[`PCX_RQTYP], pcx_pkt[`PCX_NC], pcx_pkt[`PCX_INV], pcx_pkt[`PCX_PF], pcx_pkt[`PCX_BIS], pcx_pkt);
			DispPCXReq = " ";
		end
	 endcase
end
endfunction

function IsExc;
input [2:0] core_id;
reg [21*8:0] DispExc;

begin
	DispExc = 170'b0;
	IsExc = 1'b0;

	if (`SPC1.lsu_align_b) DispExc = "Addr_not_aligned";
	if (`SPC1.lsu_lddf_align_b) DispExc = "LDDF_Addr_not_aligned";
	if (`SPC1.lsu_stdf_align_b) DispExc = "STDF_Addr_not_aligned";
	if (`SPC1.lsu_priv_action_b) DispExc = "Priv_actio";
	if (`SPC1.lsu_va_watchpoint_b) DispExc = "VA_watchpoint";
	if (`SPC1.lsu_pa_watchpoint_b) DispExc = "PA_watchpoint";
	//if (`SPC1.lsu_tlb_miss_b_) DispExc = "Tlb_miss";
	if (`SPC1.lsu_illegal_inst_b) DispExc = "Illegal_inst";
	if (`SPC1.lsu_daccess_prot_b) DispExc = "Data_access_prot_exc";
	if (`SPC1.lsu_dae_invalid_asi_b) DispExc = "Dae_Invalid_asi";
	if (`SPC1.lsu_dae_nc_page_b) DispExc = "Dae_nc_page";
	if (`SPC1.lsu_dae_nfo_page_b) DispExc = "Dae_NFO_page";
	if (`SPC1.lsu_dae_priv_viol_b) DispExc = "Dae_Priv_viol";
	if (`SPC1.lsu_dae_so_page) DispExc = "Dae_so_page";
	//if (`SPC1.lsu_perfmon_trap_b) DispExc = "Perf_mon_trap";
	if (`SPC1.lsu_dtmh_err_b) DispExc = "DTLB_data_par_err";
	if (`SPC1.lsu_dttp_err_b) DispExc = "DTLB_tag_par_err";
	if (`SPC1.lsu_dtdp_err_b) DispExc = "DTLB_data_par_err";

	
	if (DispExc != 0)
	begin
		IsExc = 1'b1;
		`PR_INFO("lsu_mon", 23, "<C%0h> <T%0h> <%0h> B_stage: %s(VA=%0h) ASI = %0h. %s Exception.",core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, asi_b, DispExc);
	end

end
endfunction

function Is_exu_error;
input [1:0] exu_lsu_va_error_b;     // VA error requiring a flush
input [1:0] exu_ecc_b;              // ECC error requiring a flush
reg err_b;
reg err_m;

begin
	err_b = dec_lsu_tid_b[2] ? (exu_ecc_b[1] | (exu_lsu_va_error_b[1] & ~`SPC1.lsu_tlb_bypass_b)):
				(exu_ecc_b[0] | (exu_lsu_va_error_b[0] & ~`SPC1.lsu_tlb_bypass_b));

	err_m = (dec_lsu_tid_b[2] ? `SPC1.exu_ecc_m[1] : `SPC1.exu_ecc_m[0]) & `SPC1.lsu.dcc.twocycle_b;
					
	Is_exu_error = err_b | err_m;
end
endfunction

/*
task Insert_tlb_miss_info;
reg [127:0] tmp;
begin
	tmp =  128'b0;
	if (tlb_valid[dec_lsu_tid_b])
	begin
		tmp = tlbmiss_pend_array[dec_lsu_tid_b];
		Disp_tlbmiss_pend_array_entry(dec_lsu_tid_b);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h>) A new tlb miss request received while there is already a Tlb miss request pending from this thread as shown above.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
	end
	else
	begin
		tlb_valid[dec_lsu_tid_b] <= 1'b1;
		tmp[`INST_VA] = inst_pc_b;
		tmp[`MEMOP_VA] = vaddr_b;
		tmp[`INST] = inst_b;
	end
	tlbmiss_pend_array[dec_lsu_tid_b] = tmp;
end
endtask

*/

//problem with the signal.
/*
always @ (negedge `SPC1.l2clk)
begin
	if (mmu_dtlb_reload_d2)
		Chk_dtlb_reload;
end

task Chk_dtlb_reload;
reg [2:0] thid;
reg [127:0] tmp;
begin
		if (`SPC1.tlu_trap_pc_0_valid)
			thid = {1'b0, `SPC1.tlu_trap_0_tid};
		else if (`SPC1.tlu_trap_pc_1_valid)
			thid = {1'b0, `SPC1.tlu_trap_1_tid};
		else 
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> mmu_dtlb_reload asserted but trap_pc_0_valid and trap_pc_1_valid are both 0", core_id);

		if (~tlb_valid[thid])
			`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> mmu_dtlb_reload asserted while tlb_valid is 0.", core_id, thid);
		else
		begin
			tmp = tlbmiss_pend_array[dec_lsu_tid_b];
			`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> %s(VA=%0h> DTLB reloaded for VA = %0h.", core_id, thid, tb_top.intf0.xlate(tmp[`INST]), tmp[`INST_VA], tmp[`MEMOP_VA] );
			tlb_valid[thid] = 1'b0;
		end
end
endtask
*/

task Insert_ld_miss_info;
reg [`LD_Pend_Width] tmp;
begin
	tmp = 213'b0;
	if (ld_valid[dec_lsu_tid_b])
	begin
		tmp =  ld_pend_array[dec_lsu_tid_b];
		DispPendReq(dec_lsu_tid_b);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h>) A new request received while there is already a request pending from this thread as shown above.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
	end
	else
	begin
		//ld_valid[dec_lsu_tid_b] <= 1'b1;
		tmp[`INST_VA] = inst_pc_b;
		tmp[`MEMOP_VA] = vaddr_b;
		tmp[`MEMOP_PA] = {`SPC1.lsu.tlb_pgnum[39:13], vaddr_b[12:0]};
		tmp[`INST_ASI] = asi_b;

		if (lsu_inst_b[`BLKLD])
		begin
			tmp[`L2_ISS] =  4'h0;
			tmp[`L2_RESP] =  4'h0;
			is_blkld[dec_lsu_tid_b] = 1'b1;
		end
		else
		begin
		   is_blkld[dec_lsu_tid_b] = 1'b0;
		   if (lsu_inst_b[`CASA])
			tmp[`L2_ISS] =  4'hC;
		   else
			tmp[`L2_ISS] =  4'hE;
		   if (lsu_inst_b[`SWAP] || lsu_inst_b[`LDSTUB] || lsu_inst_b[`CASA])
			tmp[`L2_RESP] =  4'hC;
		   else
			tmp[`L2_RESP] =  4'hE;

		end

		tmp[`INST] = inst_b;
		tmp[`LSU_MON_INST] = lsu_inst_b; 
		ld_pend_array[dec_lsu_tid_b] = tmp;
	end
end
endtask


task Insert_in_last_inst_array;
reg [135:0] tmp;
begin
	tmp = 128'b0;
	tmp[`INST_VA] = inst_pc_b;
	tmp[`MEMOP_VA] = vaddr_b;
	tmp[`INST] = inst_b;
	tmp[135:128] = asi_b;
	last_inst_array[dec_lsu_tid_b] = tmp;
end
endtask


task DispPendReq;
input [2:0] thid;
reg [`LD_Pend_Width] tmp;
begin
	
	tmp =  ld_pend_array[thid];
	`PR_ALWAYS("lsu_mon", `ALWAYS, "LD_PEND_ARRAY[%0h] Data.", thid);
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> <%0h> %s(VA=%0h). PA = %0h. L2_ISS = %0h. L2_RESP = %0h, LSU_MON_INST=%h.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA], tmp[`MEMOP_PA], tmp[`L2_ISS], tmp[`L2_RESP], tmp[`LSU_MON_INST]);
end
endtask

task Disp_STB_entry;
input [2:0] thid;
input [2:0] ptr;
reg [204:0] tmp;
begin
	
	tmp =  stb[{thid, ptr}];
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> STB[%0h] data.", core_id, thid, ptr);
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> <%0h> %s(VA=%0h). PA = %0h. L2_ISS = %0h. L2_ACK = %0h, LSU_MON_INST=%h. RMO = %0b", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA], tmp[`MEMOP_PA], tmp[`L2_ST_ISS], tmp[`L2_ACK], tmp[`LSU_MON_INST], tmp[`RMO]);
end
endtask

/*
		
task Disp_tlbmiss_pend_array_entry;
input [2:0] thid;
reg [127:0] tmp;
begin
	tmp = tlbmiss_pend_array[thid];
	`PR_INFO("lsu_mon", 23, "TLB_MISS_PEND_ARRAY[%0h] Data.", thid);
	`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h> %s(VA=%0h).", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);

end
endtask

*/
task Disp_CPX_pkt;
input [145:0] cpx_pkt;
begin
	`PR_ALWAYS("lsu_mon", `ALWAYS, "CPX_PKT data.");
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%0h> <T%0h> rtn_typ = %0h, err_bits = %0h, nc=%0b, atm = %0b, pf = %0b",  core_id, cpx_pkt[`CPX_THR_ID], cpx_pkt[`CPX_RTNTYP], cpx_pkt[`CPX_ERR], cpx_pkt[`CPX_NC], cpx_pkt[`CPX_ATM], cpx_pkt[`CPX_PF]);
end
endtask
	

task Make_STB_data;
reg [204:0] tmp;
begin
		tmp = 0;
		tmp[`INST_VA] = inst_pc_b;
		tmp[`MEMOP_VA] = vaddr_b;
		tmp[`MEMOP_PA] = {`SPC1.lsu.tlb_pgnum[39:13], vaddr_b[12:0]};
		tmp[`L2_ST_ISS] =  1'b0;
		tmp[`ASI_ST_ISS] =  1'b0;
		tmp[`L2_ACK] =  1'b0;
		tmp[`INST] = inst_b;
		tmp[`LSU_MON_INST] = lsu_inst_b;
		tmp[`ST_SQUASH] = 1'b0;
		tmp[`INST_ASI] = asi_b;
		if (`SPC1.lsu.tlu_lsu_hpstate_hpriv[dec_lsu_tid_b])
		   tmp[`ST_PRIV] = `HPRIV; 
		else if (`SPC1.lsu.tlu_lsu_pstate_priv[dec_lsu_tid_b])
		   tmp[`ST_PRIV] = `PRIV; 
		else
		   tmp[`ST_PRIV] = `USER; 
		//bis_asi to io space is not rmo

		tmp[`RMO] = lsu_inst_b[`BLKST] | (dec_altspace_b & Is_bis_asi(asi_b) & ~`SPC1.lsu.tlb_pgnum[39]);
		stb_alloc_data <= tmp;
end
endtask

task Insert_in_STB;
input [195:0] store_data;
input [2:0] thid;
begin
	if (stb_full(thid))
	begin
		//DispSTB(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> STB full and a new store received for insertion in STB.", core_id, thid);
	end
	else
	begin
		stb[{thid, wrptr[thid]}] = store_data;
		//Disp_STB_entry(thid, wrptr[thid]);
		`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h> %s(VA=%0h). STB[%0h] Inserted.", core_id, thid, store_data[`INST_VA], tb_top.intf0.xlate(store_data[`INST]), store_data[`MEMOP_VA], wrptr[thid]);
		stb_valid[{thid, wrptr[thid]}] = 1'b1;
		wrptr[thid] = wrptr[thid] + 1'b1;
		//`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> wrptr = %0d.", core_id, thid, wrptr[thid]);
	end
end
endtask

function stb_full;
input [2:0] thid;
begin
	if ((wrptr[thid] == rdptr[thid]) && stb_valid[{thid, wrptr[thid]}])
		stb_full = 1'b1;
	else
		stb_full = 1'b0;
end
endfunction
	

task Dealloc_STB;
input [2:0] thid;
reg [204:0] tmp;
reg [20:0] lsu_inst;
begin
	//thid = decode_tid(`SPC1.lsu_stb_dealloc);
	tmp = stb[{thid, rdptr[thid]}];
	lsu_inst = tmp[`LSU_MON_INST];
	if (~stb_valid[{thid, rdptr[thid]}])
	begin
		//DispSTB(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_dealloc = %0h asserted while the stb entry is invalid for that thid.", core_id, thid, `SPC1.lsu_stb_dealloc);
	end
	if (tmp[`L2_ST_ISS]) 
	begin
	    if (~tmp[`L2_ACK])
	    begin
		Disp_STB_entry(thid, rdptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_dealloc = %0h asserted when we haven't received the response from the gasket.", core_id, thid, `SPC1.lsu_stb_dealloc);
	    end
	end
	else if (tmp[`ASI_ST_ISS])
	begin
		ret_ptr[thid] = ret_ptr[thid] + 1'b1;
	end
	//blkst inst. is not issued anywhere, blkst helpers are issued.
	//in case of bis stores, lsu issues the dealloc in P3, i.e when the req is issued to PCX.
	//IF it is bis to cp sapce and there is an err then the store is issued to PCX with nd set
	// and deallocated.
	//However for ue onbis to IO space, dealloc is sent to IFU, issued on PCX with valid bit 0.
	//The sbdiou signal is sent in next cycle. We need to take bis io stores in this equation.
	else if (tmp[`ST_SQUASH] || lsu_inst[`BLKST] || (tmp[`RMO] & ~lsu_inst[`BLKST] & ~`SPC0.lsu.sbc.kill_store_p4_)) 
	begin
		iss_ptr[thid] = iss_ptr[thid] + 1'b1;
		ret_ptr[thid] = ret_ptr[thid] + 1'b1;
	end
	else 
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_dealloc = %0h asserted which is not issued to asi ring, or PCX or is not squashed.", core_id, thid, `SPC1.lsu_stb_dealloc);

	`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h>: %s(VA=%0h) PA = %0h. STB[%0d] Deallocated.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], tmp[`MEMOP_PA], rdptr[thid]);
	stb_valid[{thid, rdptr[thid]}] = 1'b0;
	rdptr[thid] = rdptr[thid] + 1'b1;
	//`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> rd_ptr = %0d.", core_id, thid, rdptr[thid]);
	/*
	if (tmp[`RMO])
		st_rmo_cnt[thid] = st_rmo_cnt[thid]  + 1'b1;
	*/
end
endtask

task Squash_STB;
input [2:0] thid;
reg [204:0] tmp;
reg [3:0] squash_cnt;
reg [2:0] i;
begin
	squash_cnt = 4'b0;
        if (ret_ptr[thid] != iss_ptr[thid])
	       `PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> lsu_block_store_kill asserted while the ret_ptr = %0h  != iss_ptr = %0h.", core_id, thid, tmp[`MEMOP_PA], ret_ptr[thid], iss_ptr[thid]);
        if (rdptr[thid] != iss_ptr[thid])
	       `PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> lsu_block_store_kill asserted while the rdptr = %0h  != iss_ptr = %0h.", core_id, thid, tmp[`MEMOP_PA], rdptr[thid], iss_ptr[thid]);

	if (iss_ptr[thid] == wrptr[thid])
	begin
	    if (stb_valid[{thid, wrptr[thid]}])
		squash_cnt = 8;
/* Lsu can assert both dealloc and block_store_kill for a request.
 *
	    else
	    begin
              	`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Lsu asserted block_store_kill while there are no valid entries in STB to be deallocated.", core_id, thid);
	    end
*/
	end
	else
	begin
	  if (iss_ptr[thid] < wrptr[thid])
		squash_cnt = wrptr[thid] - iss_ptr[thid];
	  else if (iss_ptr[thid] > wrptr[thid])
		squash_cnt = wrptr[thid] + (8 - iss_ptr[thid]);
	end

	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> SQUASH_STB:iss_ptr = %0h, wrptr = %0h, squash_cnt = %0h.", core_id, thid, iss_ptr[thid], wrptr[thid], squash_cnt);

	i = iss_ptr[thid];
       
       `PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Block store kill changed issue_ptr:%0h->%0h. ret_ptr: %0h->%0h. rdptr:%0h->%0h.", core_id, thid, iss_ptr[thid], iss_ptr[thid]+squash_cnt, ret_ptr[thid], ret_ptr[thid]+squash_cnt, rdptr[thid], rdptr[thid]+squash_cnt);

   	ret_ptr[thid] = ret_ptr[thid] + squash_cnt;
	rdptr[thid] = rdptr[thid] + squash_cnt;
        iss_ptr[thid] = iss_ptr[thid] + squash_cnt;
		
	while (squash_cnt)
	begin
	    tmp = stb[{thid, i}];
	    if (~stb_valid[{thid, i}])
	    begin
		//DispSTB(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h><PA = %0h> lsu_block_store_kill asserted while the stb entry %0h is invalid.", core_id, thid, tmp[`MEMOP_PA], i);
	    end
	    if (tmp[`L2_ST_ISS]) 
	    begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h>st_issue bit is set when the block_store_kill is asserted for stb entry %0h.", core_id, thid, tmp[`MEMOP_PA], i);
	    end
	    //commenting out the chk below. Lsu can assert sbdiou and then in the next cycle insert a new entry into
	    //stb. LSU will squash this new entry and won't issue it to PCX/asi but its squash bit won't be 
	    //set in the chkr which was causin it to fire. 
	    //if (~tmp[`ST_SQUASH]) 
	    //begin
	       //`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> lsu_block_store_kill asserted while the squash bit is 0 in the STB entry %0h.", core_id, thid, tmp[`MEMOP_PA], i);
	    //end
	    stb_valid[{thid, i}] = 1'b0; 

	    i = i + 1;
	    squash_cnt = squash_cnt - 1'b1;
	end

end
endtask

task Chk_store;
reg [2:0] thid;
reg [47:0] addr;
reg [3:0] i;
reg [204:0] tmp;
begin
	if ((bst_cnt > 0) && (`SPC1.lsu_stb_alloc == 8'b0))
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Blk store entries are not allocated back to back in STB.", core_id, bst_active_thid);

//For bst the stb is still written even though we have errors.
//Stb is written in W stage. Howvere for first blk store helper
//the err will be flagged by FGU in b stage. We can miss the
// err signal if we don't sample in B.
//for the last helper err will be signalled in B stage of last helper and at

	if (lsu_bst_active[bst_active_thid] & `SPC0.fgu_fst_ecc_error_fx2 & (bst_cnt < 7))
             bst_fgu_err = 1'b1;

	if (`SPC1.lsu_stb_alloc[7:0] != 8'b0)
	begin
		thid = decode_tid(`SPC1.lsu_stb_alloc[7:0]);
		if (store_alloc)
		begin
			if (thid != dec_lsu_tid_w)
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_alloc = %0h mismatches the thid %0h.", core_id, dec_lsu_tid_w, `SPC1.lsu_stb_alloc[7:0], dec_lsu_tid_w);
			Insert_in_STB(stb_alloc_data, dec_lsu_tid_w);
		end
		else 
		begin
		    if (lsu_bst_active[thid])
		    begin
			   if (bst_cnt == 0)
			   begin
				bst_data = bst_inst_data;
			   end
		           else
			   begin
				if (thid != bst_active_thid)
				begin
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_alloc = %0h mismatches the active blkstore thid = %0h.", core_id, bst_active_thid, `SPC1.lsu_stb_alloc[7:0], bst_active_thid);
				end

				addr = bst_data[`MEMOP_VA];

				bst_data[`MEMOP_VA] = {addr[47:6], bst_cnt[2:0], 3'b0};
				addr = bst_data[`MEMOP_PA];
				bst_data[`MEMOP_PA] = {addr[39:6], bst_cnt[2:0], 3'b0};
			   end
                                bst_cnt = bst_cnt + 1;
                                Insert_in_STB(bst_data, bst_active_thid);
                                if (bst_cnt == 8)
                                begin
                                        bst_cnt = 0;
                                        lsu_bst_active[thid] = 1'b0;
                                        if (bst_fgu_err) //set the squash bit to 0 for all the stb entries
                                        begin
                                          for (i = 0; i < 8; i=i+1)
                                          begin
                                             tmp = stb[{thid, i[2:0]}];
					     if (tmp[`ST_SQUASH])
						`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Squash bit already set when trying to set it for a bst fgu errerr.", core_id, thid, tmp[`MEMOP_PA]);
					     tmp[`ST_SQUASH] = 1'b1;
                                             stb[{thid, i[2:0]}] = tmp; 
                                             `PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <PA = %0h> STB_entry[%0h] squashed due to FGU err.", core_id, thid, tmp[`MEMOP_PA], i);
                                          end
                                        end
					bst_fgu_err = 1'b0;
                                end
			end
			else
				`PR_ERROR("lsu_mon", `ERROR, "<C%h>: LSU asserted lsu_stb_alloc  = %0h while no store pending to be written in STB.", core_id, `SPC1.lsu_stb_alloc[7:0]);
				
		end
	end
	else
	begin
		if (store_alloc)
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h> W_stage: LSU did not assert lsu_stb_alloc for the store.", core_id, dec_lsu_tid_w, inst_pc_w);
	end
end
endtask

task Chk_st_on_ASI_ring;
input ring;
reg [2:0] thid;
reg [7:0] asi;
reg [47:0] addr, act_addr;
reg [1:0] req_type;
reg [204:0] tmp;

begin
	if (ring == `LOCAL)
		thid =`SPC1.lsu_rngl_cdbus[58:56];
	else
		thid =`SPC1.lsu_rngf_cdbus[58:56];
	
	if (ring == `LOCAL)
		asi =`SPC1.lsu_rngl_cdbus[55:48];
	else
		asi =`SPC1.lsu_rngf_cdbus[55:48];
	
	if (ring == `LOCAL)
		addr =`SPC1.lsu_rngl_cdbus[47:0];
	else
		addr =`SPC1.lsu_rngf_cdbus[47:0];
	
	if (ring == `LOCAL)
		req_type =`SPC1.lsu_rngl_cdbus[61:60];
	else
		req_type =`SPC1.lsu_rngf_cdbus[61:60];
	

	tmp = stb[{thid, iss_ptr[thid]}];
	if (tmp[`ASI_ST_ISS])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store reissued on the ASI interface.", core_id, thid, addr);
	end
	
	if (tmp[`ST_SQUASH])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store issued on the ASI interface that has been squashed.", core_id, thid, addr);
	end

	act_addr  = tmp[`MEMOP_PA];
	act_addr = {act_addr[39:3], 3'b0};

	//47 is D tag rd asi. LSU issues that on the ring but changes 
	//the address.
	if ((addr == act_addr) || (asi == 8'h47) || (asi == 8'h46))  
	begin
		tmp[`ASI_ST_ISS] = 1'b1;
		stb[{thid, iss_ptr[thid]}] = tmp;
		if (ring == `LOCAL)
		begin
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued on local ring.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
		end
		else
		begin
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued on fast ring.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
		end
		iss_ptr[thid] = iss_ptr[thid] + 1'b1;
	end
	else
	begin
	   if (ring == `LOCAL)
	   begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] PA mismatch for asi req on local ring. Expected PA = %0h, actual PA = %0h", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid], tmp[`MEMOP_PA], addr);
	   end
	   else
	   begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] PA mismatch for asi req on fast ring. Expected PA = %0h, actual PA = %0h", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid], tmp[`MEMOP_PA], addr);
	  end
	end

end
endtask


task chk_store_issue_to_pcx;
input [129:0] pcx_pkt;
reg [2:0] thid;
reg [204:0] tmp;
reg [20:0] inst;
reg [39:0] pcx_pa, inst_pa;
begin
	thid = pcx_pkt[`PCX_THR_ID];
	tmp = stb[{thid, iss_ptr[thid]}];
	inst = tmp[`LSU_MON_INST];
	pcx_pa = pcx_pkt[`PCX_ADDR];
	inst_pa = tmp[`MEMOP_PA];
	
	if (pcx_pkt[`PCX_RQTYP] == `PCX_STORE)
	begin
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
	end
	if (pcx_pkt[`PCX_INV])
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued to gasket with ND set.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
		

	if (~inst[`ST])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A store request made to gasket by LSU while the pending req is not store.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end

/* CONFIRM WITH MARK
	if (pcx_pa[39:0] != inst_pa[39:0])
	begin
			Disp_STB_entry(thid, iss_ptr[thid]);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A store request made to gasket by LSU while the pending req has PA %0h.", core_id, thid, pcx_pkt[`PCX_ADDR], tmp[`MEMOP_PA]);
	end
*/
//enhancement req 100146
	if ((tmp[`INST_ASI] == 8'h73) & (pcx_pa[39:0] != {8'h90, core_id, thid, tmp[`INST_ASI], 18'h0})) 
	begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> pcx_pa is not correct for asi write to interrupt vector dispatch register.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end

	if (inst[`BLKST] && ~pcx_pkt[`PCX_BST])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Bst bit is not set in the PCX pkt by LSU for a blk st request.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end

	if (tmp[`L2_ST_ISS])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store reissued on the PCX interface.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end
	else
	        tmp[`L2_ST_ISS] =  1'b1;
	
	if (tmp[`ST_SQUASH])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store issued on the PCX interface that has been squashed.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end
	
	if (tmp[`RMO])
	begin
	   if (~pcx_pkt[`PCX_BIS])
	   begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> BIS bit is not set in the PCX pkt by LSU for an RMO store.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	   end
	   if (tmp[`L2_ACK])
	   begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> L2ack bit is set when the RMO store is issued to PCX.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	   end
	   else
	   begin
		tmp[`L2_ACK] = 1'b1;
		ret_ptr[thid] = ret_ptr[thid] + 1;  //this will be deallocated before 
						    //response seen from stub
		st_rmo_cnt[thid] = st_rmo_cnt[thid]  + 1'b1;
	   end
	end
	stb[{thid, iss_ptr[thid]}] = tmp;

	iss_ptr[thid] = iss_ptr[thid] + 1;
	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> iss_ptr = %0d. ret_ptr = %0d, st_rmo_cnt = %0d", core_id, thid, iss_ptr[thid], ret_ptr[thid], st_rmo_cnt[thid]);
end
endtask

`ifdef INJ_STB_ERR_IN_CMP


reg [2:0] err_tid, stb_err_tid_d1, stb_err_tid_d2;
reg [2:0] err_index, stb_err_index_d1, stb_err_index_d2;
reg [204:0] err_tmp ;
reg [20:0] err_inst;
reg [44:0] cam_data;
reg [5:0] err_bit;
integer err_inj_cnt;
reg cmp_stb_err_inj;
reg stb_err_inj, stb_err_inj_d1, stb_err_inj_d2;
reg [1:0] err_priv, stb_err_priv_d1, stb_err_priv_d2;

initial
begin
	cmp_stb_err_inj = 1'b0;

	cam_data = 45'b0;
	err_bit = 11;
	err_inj_cnt = 0;
	stb_err_inj = 0;
	if (("cmp_stb_err_inj_on"))
		cmp_stb_err_inj = 1'b1;
	else
		cmp_stb_err_inj = 1'b0;
end

always @ (negedge (`SPC1.l2clk & enabled & cmp_stb_err_inj))
begin //{
     //valid stb ram rd for issue to pcx
     stb_err_inj = 1'b0;
     if (`SPC1.lsu.sbc.ram_rptr_vld_2 & `SPC1.lsu.sbc.st_pcx_rq_p3 & `SPC1.lsu.pic.pic_st_sel_p3)
     begin //{
	err_tid = decode_tid(`SPC1.lsu.sbc.st_rq_sel_p3[7:0]);
	err_index = `SPC1.lsu.sbc.ram_rptr_d1;
	err_tmp = stb[{err_tid, err_index}];
	err_inst = err_tmp[`LSU_MON_INST];
	cam_data = `SPC1.lsu.stb_cam.cam_array.stb_rdata[44:0];
	err_priv = err_tmp[`ST_PRIV];
	//if (err_inst[`SWAP] || err_inst[`CASA] || err_inst[`LDSTUB])
	if (err_inst[`CASA])
	begin //{
	   err_inj_cnt = err_inj_cnt + 1;
	   if (err_inj_cnt == 10)
	   begin //{
	     case (err_bit)
	       11, 12: err_bit = err_bit + 1;
	       13: err_bit = 44;
	       44: err_bit = 11;
	      endcase
	      err_inj_cnt = 0;
	      stb_err_inj = 1'b1;

	      force `SPC0.lsu.stb_cam.cam_array.stb_rdata[44:0] = cam_data ^ (1 << err_bit);
	      `PR_INFO("stb_err", 22, "<T%0h> <%0h> STB[%0h]: SBAPP forced for CASA. err_bit = %0h", err_tid, {cam_data[44:8], 3'b0}, err_index, err_bit);
	      #1;
	      release `SPC0.lsu.stb_cam.cam_array.stb_rdata[44:0];
	   end  //}
	end //}
     end  //}
     if (stb_err_inj_d2)
     begin
	if (~`SPC1.lsu_sbapp_err_g)
	begin
	            `PR_ERROR("lsu_mon", `ERROR, "<T%0h> sbapp err not asserted when err is injected for atomic.", stb_err_tid_d2);
	end
	else
	begin
		if ((`SPC1.lsu_stberr_tid_g != stb_err_tid_d2) || 
		    (`SPC1.lsu_stberr_index_g != stb_err_index_d2) || 
		    (`SPC1.lsu_stberr_priv_g != stb_err_priv_d2))
		begin
	            `PR_ERROR("lsu_mon", `ERROR, "<T%0h> sbapp err parameters mismatch.", stb_err_tid_d2);
		end
	end
    end
    else
    begin
	if (`SPC1.lsu_sbapp_err_g)
	begin
	            `PR_ERROR("lsu_mon", `ERROR, "<T%0h> sbapp err asserted when none expected.", `SPC1.lsu_stberr_tid_g);
	end
    end

end  //}

	
always @ (posedge (`SPC1.l2clk & enabled & cmp_stb_err_inj))
begin
	stb_err_inj_d1 <= stb_err_inj;
	stb_err_inj_d2 <= stb_err_inj_d1;
	stb_err_tid_d1 <= err_tid;
	stb_err_tid_d2 <= stb_err_tid_d1;
	stb_err_index_d1 <= err_index;
	stb_err_index_d2 <= stb_err_index_d1;
	stb_err_priv_d1 <= err_priv;
	stb_err_priv_d2 <= stb_err_priv_d1;
end

`endif
`endif
`endif
endmodule

`endif
`ifdef CORE_2

module lsu_mon_c2;
`ifndef GATESIM

// If vcs_build_args NO_MONITORS, then module will be empty
`ifndef NO_MONITORS

reg imm_asi_vld_e;
reg [7:0] asi_e, imm_asi_e, asi_m, asi_b;
reg dec_altspace_e, dec_altspace_b, dec_altspace_m;
reg [1:0] exu_ecc_b;
reg [1:0] exu_lsu_va_error_b;
reg [2:0] dec_lsu_tid_e, dec_lsu_tid_m, dec_lsu_tid_b, dec_lsu_tid_w;
reg [47:0] inst_pc_e, inst_pc_m, inst_pc_b, inst_pc_w;
reg [31:0] inst_e, inst_m, inst_b;
reg [47:0] vaddr_m, vaddr_b;
reg [63:0] int_st_data_m, int_st_data_b;
reg [63:0] fp_st_sata_fx2;
reg [20:0] lsu_inst_e, lsu_inst_m, lsu_inst_b;
reg mmu_dtlb_reload_d1, mmu_dtlb_reload_d2;

reg [7:0] ld_valid;
reg [7:0] tlb_valid;
reg [`LD_Pend_Width] ld_pend_array[7:0];
reg [`LAST_INST_Pend_Width] last_inst_array[7:0];
reg [2:0] wrptr[7:0];  //Pts. to the STB entry into which data will be written next
reg [2:0] rdptr[7:0];  //Tracks the dealloc signal from STB
reg [2:0] iss_ptr[7:0];	//keeps track of when a store is issued from the STB to PCX
reg [2:0] ret_ptr[7:0]; //keeps track of when the response is received from 
			//the L2c.
reg [63:0] stb_valid;
reg [`STB_Pend_Width] stb[63:0];
//reg [`TLB_MISS_Pend_Width] tlbmiss_pend_array[7:0];

reg [7:0] pf_cnt[7:0];
reg [7:0] dcache_inv_cnt[7:0];
reg [7:0] st_rmo_cnt[7:0];

reg [55:0] print_inst;

reg [31:0] dec_tg0_inst_d, dec_tg1_inst_d;

reg [7:0] lsu_bst_active;
reg store_alloc;
reg [3:0] bst_cnt;
reg [195:0] stb_alloc_data;
reg [195:0] bst_data, bst_inst_data;
reg [2:0] bst_active_thid;
reg bst_fgu_err;
				
reg [7:0] is_blkld;  //reqd by lsu_ras_chkr to chk errors on blk ld.
reg [1:0] l2_blk_ld_errtype[7:0]; //Gives the type of err the ahd be reported by LSU if 
				 //different types of err occur on blk ld helper returns
reg [1:0] st_priv[7:0]; //Gives the final priv level for an sbdiou/sbapp err that shd be 
			//stored in DFESR

wire [2:0] core_id = 2;

integer i;
integer err_cnt;

reg enabled;
reg reset_in_middle;
reg [7:0] finish_mask;

initial
begin
    enabled = 0;
    reset_in_middle = 0;
	ld_valid = 8'b0;
	lsu_inst_e = 0;
	tlb_valid = 8'b0;
	for (i = 0; i < 8; i = i+1)
	begin
		pf_cnt[i] = 0;
		dcache_inv_cnt[i] = 0;
		wrptr[i] = 0;
		rdptr[i] = 0;
		iss_ptr[i] = 0;
		ret_ptr[i] = 0;
		st_rmo_cnt[i] = 0;
		is_blkld[i] = 1'b0;
		st_priv[i] = 2'b0;
		l2_blk_ld_errtype[i] = 2'b0;
	end
	lsu_bst_active = 8'b0;
	store_alloc = 1'b0;
	bst_cnt = 4'b0;
	stb_valid = 64'b0;

    // avoid time zero ugliness. jp
    //@(posedge `SPC0.l2clk);
    //@(negedge `SPC0.l2clk);
    //if (`PARGS.lsu_mon_on) enabled = 1;

    case (core_id)
	3'h0: finish_mask = `PARGS.finish_mask[7:0];
	3'h1: finish_mask = `PARGS.finish_mask[15:8];
	3'h2: finish_mask = `PARGS.finish_mask[23:16];
	3'h3: finish_mask = `PARGS.finish_mask[31:24];
	3'h4: finish_mask = `PARGS.finish_mask[39:32];
	3'h5: finish_mask = `PARGS.finish_mask[47:40];
	3'h6: finish_mask = `PARGS.finish_mask[55:48];
	3'h7: finish_mask = `PARGS.finish_mask[63:56];
    endcase
end

always @ (`TOP.in_reset)
begin
	if (~`TOP.in_reset & `PARGS.lsu_mon_on & ~reset_in_middle)
	begin
		enabled = 1'b1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "Lsu_mon on, in_reset = 0.");
	end
		

	if (`TOP.in_reset & enabled)
	begin
		reset_in_middle = 1'b1;
		enabled = 1'b0;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "Reset asserted in the middle of the diag. Turned off Lsu_mon.");
	end
end

always @ (posedge (tb_top.sim_status[0] & enabled))
begin //{
	if (|(ld_valid[7:0] & finish_mask[7:0]))
	begin  //{
	   for (i = 0; i < 8; i=i+1)
	   begin
		if (ld_valid[i])  
		begin
		   DispPendReq(i);
	        end
	   end
	  `PR_ERROR("lsu_mon", `ERROR, "<C%h> Ld requests pending at the end of simulation. ld_valid = %0h", core_id, ld_valid);
	end  //}
	if (|stb_valid[63:0])
	begin  //{
	   err_cnt = 0;
	   for (i = 0; i < 64; i=i+1)
	   begin
		if (stb_valid[i] & finish_mask[i[5:3]])  
		begin
		//chkr resets the stb valid bits when block_store_kill is asserted.
		//in couple of failures block_store_kill was sampled asserted two cycles after
		//lsu asserted stb_empty. The simulation ended the cycle stb_empty was sampled high 
		//causing moniotr firings with valid entries in stb at end of simulation. Now
		//don't flag an error if squash bit is set and stb_valid is asserted at end
		//of simualation.
		      if (~is_squash_bit_set(i[5:0]))
		      begin
			err_cnt = err_cnt + 1;
			Disp_STB_entry(i[5:3],i[2:0]);
		      end
		end
	   end
	   if (err_cnt)
	   begin
	  	`PR_ERROR("lsu_mon", `ERROR, "<C%h> Store requests pending at the end of simulation. stb_valid = %0h", core_id, stb_valid);
	   end
       end  //}
       err_cnt = 0;
       for (i = 0; i < 8; i=i+1)
       begin  //{
	   if (finish_mask[i] & (pf_cnt[i] != 0))
	   begin
		err_cnt = 1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> Prefetches not finished. Pf_cnt = %0d", core_id, i, pf_cnt[i]);
	   end
	   if (finish_mask[i] & (dcache_inv_cnt[i] != 0))
	   begin
		err_cnt = 1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> D pkt not received for all invalidate reqs. issued by the thread. dcache_inv_cnt = %0d", core_id, i, dcache_inv_cnt[i]);
	   end
	   if (finish_mask[i] & (st_rmo_cnt[i] != 0))  
	   begin
		err_cnt = 1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> rmo_cnt not zero. rmo_cnt = %0d", core_id, i, st_rmo_cnt[i]);
	   end
       end  //}
       if (err_cnt)
       begin
	  `PR_ERROR("lsu_mon", `ERROR, "<C%h> Prefetch/D/RMO_stores requests pending at the end of simulation.", core_id);
       end
end //}

function is_squash_bit_set;
input [5:0] index;
reg [204:0] tmp;
begin
	tmp = stb[index];
	if (tmp[`ST_SQUASH])
		is_squash_bit_set = 1'b1;
	else
		is_squash_bit_set = 1'b0;
end
endfunction


always @ (negedge (`SPC2.l2clk & enabled))
begin //{

	asi_e  = `SPC2.lsu.dcc.dcc_asi_e[7:0];

	lsu_inst_e[`LD] <= `SPC2.dec_ld_inst_e;
	lsu_inst_e[`ST] <= `SPC2.dec_st_inst_e;
	lsu_inst_e[`FP] <= `SPC2.dec_fpldst_inst_e;
	lsu_inst_e[`PREF] <= `SPC2.dec_pref_inst_e;
	lsu_inst_e[`SWAP] <= `SPC2.dec_swap_inst_e;
	lsu_inst_e[`CASA] <= `SPC2.dec_casa_inst_e;
	lsu_inst_e[`LDSTUB] <= `SPC2.dec_ldstub_inst_e;
	lsu_inst_e[`FLUSH] <= `SPC2.dec_flush_inst_e;
	lsu_inst_e[`MEMBAR] <= `SPC2.dec_memstbar_inst_e;
	lsu_inst_e[`LDD] <= `SPC2.dec_ld_inst_e & `SPC2.dec_ldst_dbl_e & ~`SPC2.dec_fpldst_inst_e;
	lsu_inst_e[`STD] <= `SPC2.dec_st_inst_e & `SPC2.dec_ldst_dbl_e & ~`SPC2.lsu.dec_fpldst_inst_e;

       lsu_inst_e[`BLKLD] <= `SPC2.dec_ld_inst_e & `SPC2.dec_fpldst_inst_e & dec_altspace_e & Is_blk_asi(asi_e);
	lsu_inst_e[`BLKST] <= `SPC2.dec_st_inst_e & `SPC2.dec_fpldst_inst_e & dec_altspace_e & Is_blk_asi(asi_e);
	lsu_inst_e[`QLD] <= `SPC2.dec_ld_inst_e & dec_altspace_e & Is_qld_asi(asi_e);
	lsu_inst_e[`ASR_RD_WR] <= `SPC2.dec_sr_inst_e & (`SPC2.dec_ld_inst_e | `SPC2.dec_st_inst_e);
	lsu_inst_e[`PR_RD_WR] <= `SPC2.dec_pr_inst_e & (`SPC2.dec_ld_inst_e | `SPC2.dec_st_inst_e);
	lsu_inst_e[`HPR_RD_WR] <= `SPC2.dec_hpr_inst_e & (`SPC2.dec_ld_inst_e | `SPC2.dec_st_inst_e);
	lsu_inst_e[`FSR_RD_WR] <= `SPC2.dec_fsr_ldst_e & (`SPC2.dec_ld_inst_e | `SPC2.dec_st_inst_e);
end //}

always @ (posedge (`SPC2.l2clk & enabled))
begin //{
	dec_tg0_inst_d <= `SPC2.dec.ded0.decode_mux[31:0];
	dec_tg1_inst_d <= `SPC2.dec.ded1.decode_mux[31:0];
	imm_asi_vld_e <= `SPC2.lsu.dec_imm_asi_vld_d;

	imm_asi_e <= `SPC2.lsu.dec_imm_asi_d;
	dec_altspace_e <= `SPC2.dec_altspace_d;
	dec_altspace_m <= dec_altspace_e;
	dec_altspace_b <= dec_altspace_m;

	exu_ecc_b <= `SPC2.exu_ecc_m;
	exu_lsu_va_error_b <= `SPC2.exu_lsu_va_error_m;

	dec_lsu_tid_e <= `SPC2.dec_lsu_tg_d ? {1'b1, `SPC2.dec_lsu_tid1_d} : {1'b0, `SPC2.dec_lsu_tid0_d}; 	
	dec_lsu_tid_m <= dec_lsu_tid_e;
	dec_lsu_tid_b <= dec_lsu_tid_m;
	dec_lsu_tid_w <= dec_lsu_tid_b;
	
	inst_pc_e <= `SPC2.dec_lsu_tg_d ? {`SPC2.tlu.tlu_pc_1_d[47:2], 2'b0} : {`SPC2.tlu.tlu_pc_0_d[47:2], 2'b0};
	inst_pc_m <= inst_pc_e;
	inst_pc_b <= inst_pc_m;
	inst_pc_w <= inst_pc_b;
	
	inst_e <= `SPC2.dec_lsu_tg_d ? dec_tg1_inst_d : dec_tg0_inst_d;
	inst_m <= inst_e;
	inst_b <= inst_m;

	vaddr_m <= `SPC2.exu_lsu_address_e;
	vaddr_b <= vaddr_m;

	int_st_data_m <= `SPC2.exu_lsu_store_data_e;
	int_st_data_b <= int_st_data_m;
	fp_st_sata_fx2 <= `SPC2.fgu_lsu_fst_data_fx1;

	mmu_dtlb_reload_d1 <= `SPC2.mmu_dtlb_reload;
	mmu_dtlb_reload_d2 <= mmu_dtlb_reload_d1;

	//pcx_thid_d1 <=  `SPC2.lsu.spc_pcx_data_pa[`PCX_THR_ID];
	lsu_inst_m <= lsu_inst_e;
	lsu_inst_b <= lsu_inst_m;

	asi_m <= asi_e;
	asi_b <= asi_m;
end //}

function Is_blk_asi;
input [7:0] asi;
begin
	Is_blk_asi = (asi == `ASI_BLK_AIUP) | (asi == `ASI_BLK_AIUS) | 
		   (asi == `ASI_BLK_AIUPL) | (asi == `ASI_BLK_AIUSL) |
		   (asi == `ASI_BLK_P) | (asi == `ASI_BLK_S) |
		   (asi == `ASI_BLK_PL) | (asi == `ASI_BLK_SL) |
		   (asi == `ASI_BLK_COMMIT_P) | (asi == `ASI_BLK_COMMIT_S);
end
endfunction

function Is_qld_asi;
input [7:0] asi;
begin
 		Is_qld_asi = (asi == `ASI_AIU_BIS_QUAD_LDD_P) | (asi == `ASI_AIU_BIS_QUAD_LDD_S) |
		(asi == `ASI_AIU_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_AIU_BIS_QUAD_LDD_S_LITTLE) |
		(asi == `ASI_NUCLEUS_BIS_QUAD_LDD) | (asi == `ASI_NUCLEUS_BIS_QUAD_LDD_LITTLE) |
		(asi == `ASI_BIS_QUAD_LDD_P) | (asi == `ASI_BIS_QUAD_LDD_S) |
		(asi == `ASI_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_BIS_QUAD_LDD_S_LITTLE) |
		(asi == `ASI_QUAD_LDD) | (asi == `ASI_QUAD_LDD_REAL) |
		(asi == `ASI_QUAD_LDD_L) | (asi == `ASI_QUAD_LDD_REAL_L);
end
endfunction

function Is_bis_asi;
input [7:0] asi;
begin
 		Is_bis_asi = (asi == `ASI_AIU_BIS_QUAD_LDD_P) | (asi == `ASI_AIU_BIS_QUAD_LDD_S) |
		(asi == `ASI_AIU_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_AIU_BIS_QUAD_LDD_S_LITTLE) |
		(asi == `ASI_NUCLEUS_BIS_QUAD_LDD) | (asi == `ASI_NUCLEUS_BIS_QUAD_LDD_LITTLE) |
		(asi == `ASI_BIS_QUAD_LDD_P) | (asi == `ASI_BIS_QUAD_LDD_S) |
		(asi == `ASI_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_BIS_QUAD_LDD_S_LITTLE);
end
endfunction

always @ (negedge (`SPC2.l2clk & enabled))
begin //{
	Chk_store;
	store_alloc = 1'b0;
	if (lsu_inst_m != 0)
	begin
		if (`SPC2.dec_flush_lm)
		begin
			lsu_inst_m <= 0;
			`PR_INFO("lsu_mon", 21, "<C%0h> <T%0h> <%0h> M_stage: %s(VA=%0h) Flushed due to IFU Flush.", core_id, dec_lsu_tid_m, inst_pc_m, tb_top.intf0.xlate(inst_m),vaddr_m);
		end
	end
		
	if (lsu_inst_b != 0)
	begin //{
		if (lsu_inst_b[`BLKLD])  print_inst = " BLKLD,";
		else if (lsu_inst_b[`BLKST])  print_inst = " BLKST,";
		else if (lsu_inst_b[`QLD])  print_inst = " QLD,";
		else  print_inst = "";

		if (`SPC2.dec_flush_lb)
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%0h> <T%0h> <%0h> B_stage: %s(VA=%0h) Flushed due to IFU Flush.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		else if (`SPC2.tlu_flush_lsu_b)
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h) Flushed due to TLU Flush.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		//casa is a two cycle operation. If there is an err on the 2nd cycle of casa then also
		//casa shd be killed.
		//This function will also chk for errors on 2nd cycle.
		else if (Is_exu_error(exu_lsu_va_error_b, exu_ecc_b))  
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h <%0h> B_stage: %s(VA=%0h) Flushed due to EXU error.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		else if ((`SPC2.fgu_cecc_fx2 || `SPC2.fgu_uecc_fx2) && lsu_inst_b[`ST] && lsu_inst_b[`FP]) 
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h) Flushed due to FGU error.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		else if (IsExc(core_id)) 
			lsu_inst_b <= 0;
		else if (!`SPC2.lsu_tlb_miss_b_)
		begin
			`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h)%s ASI = %0h. DTLB miss.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, asi_b);
				//Insert_tlb_miss_info;
		end
		else 
		begin //{
		//Lsu doesn't assert lsu_sync for an exception or dtlb miss. Since for
		//an exception tlu anyway tells the front end to flush itself there is 
		//no reason for LSU to flush the front end then TLU to flush it again.
		//Lsu treats the dtlbmiss as an exception that it flushes the  inst and
		//handles it when it is reissued by the front end.

		   if (`SPC2.lsu_tlb_bypass_b)
		   begin
			if (`SPC2.lsu_sync != 8'b0)
			begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. LSU_sync. DTLB Bypass.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC2.lsu.tlb_pgnum[39:13], vaddr_b[12:0]},  asi_b);
			end
			else
			begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. DTLB Bypass.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC2.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b);
			end
		  end
	          else
		  begin
			if (`SPC2.lsu_sync != 8'b0)
			begin
			  if (lsu_inst_b[`ST])
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h, Store_data = %0h. LSU_sync. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC2.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b,int_st_data_b);
			  end
			  else
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. LSU_sync. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC2.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b);
			  end
			end
			else
			begin
			  if (lsu_inst_b[`ST])
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h, Store_data = %0h. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC2.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b, int_st_data_b);
			  end
			  else
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC2.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b);
		          end
		        end
		  end

	          if (lsu_inst_b[`LD] || lsu_inst_b[`PREF] || lsu_inst_b[`SWAP] || lsu_inst_b[`CASA] || lsu_inst_b[`LDSTUB])
		  begin //{
			if (((lsu_inst_b == 16'h1) || (lsu_inst_b == 16'h5)) & `SPC2.lsu.stb_cam_hit)
			begin
				`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h>: LSU_sync asserted due to STB RAW.", core_id, dec_lsu_tid_b, inst_pc_b);
			end
		  end //}

		  if (lsu_inst_b[`LD])
			Insert_ld_miss_info;

		  if (lsu_inst_b[`ST])  //for atomics both ld and store signals are asserted
		  begin
			Make_STB_data;
			store_alloc = 1'b1;
		  end
		  Insert_in_last_inst_array;

		if (`SPC2.lsu_trap_flush[7:0])
		begin
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h> Trap Flush asserted.", core_id, decode_tid(`SPC2.lsu_trap_flush[7:0]));
		end
	    end //}
	end //}
end //}

//STB ue testing:
//This is how we test squashing of stores by LSU_mon:
//Whenever lsu asserts err_sbdiou signal, the monitor sets the squash
//bit in the STB for the rest of the stores. If any of these squashed stores
//is issued on the asi ring or to the PCX interface the monitor complains.
//The squashed stores are deallocated when either a block_store_kill is
//asserted or dealloc signals are asserted by the LSU.
//When the block_store_kill is asserted, it tells the IFU to dealloc
//all the pending stores in the IFU. It means the when block_store_kill
//is asserted we have deallocated all the non-squashed requests from STB.
//The 0in_chkr ensures that LSU flags the correct index and priv with the
//the sbdiou signal to TLU.


always @ (negedge (`SPC2.l2clk & enabled))
begin
	if (`SPC2.lsu_l15_valid & `SPC2.lsu.spc_pcx_data_pa[129])
		Chk_pcx_req_pkt(`SPC2.lsu.spc_pcx_data_pa[129:0]);  //chk if we need .lsu here
	if ((`SPC2.lsu_rngl_cdbus[64:63] == 2'b11) & ~`SPC2.lsu_rngl_cdbus[59])
		Chk_st_on_ASI_ring(`LOCAL);

	if ((`SPC2.lsu_rngf_cdbus[64:63] == 2'b11) & ~`SPC2.lsu_rngf_cdbus[59])
		Chk_st_on_ASI_ring(`FAST);

	//if (`SPC2.l15_lsu_valid)
		//Chk_cpx_response_pkt({`SPC2.l15_lsu_valid, `SPC2.l15_lsu_cpkt[17:13],`SPC2.l15_lsu_cpkt[11:0],`SPC2.l15_spc_data1[127:0]});
	
	if (`SPC2.cpx_spc_data_cx[145])
		Chk_cpx_response_pkt(`SPC2.cpx_spc_data_cx);
	
	if (`SPC2.lsu_complete[7:0] != 8'b0)
	begin
		if (`SPC2.lsu_complete[0]) Chk_ld_complete(0);
		if (`SPC2.lsu_complete[1]) Chk_ld_complete(1);
		if (`SPC2.lsu_complete[2]) Chk_ld_complete(2);
		if (`SPC2.lsu_complete[3]) Chk_ld_complete(3);
		if (`SPC2.lsu_complete[4]) Chk_ld_complete(4);
		if (`SPC2.lsu_complete[5]) Chk_ld_complete(5);
		if (`SPC2.lsu_complete[6]) Chk_ld_complete(6);
		if (`SPC2.lsu_complete[7]) Chk_ld_complete(7);
	end
	
	if (`SPC2.lsu_block_store_kill[7:0] != 8'b0)
	begin
		if (`SPC2.lsu_block_store_kill[0]) Squash_STB(0);
		if (`SPC2.lsu_block_store_kill[1]) Squash_STB(1);
		if (`SPC2.lsu_block_store_kill[2]) Squash_STB(2);
		if (`SPC2.lsu_block_store_kill[3]) Squash_STB(3);
		if (`SPC2.lsu_block_store_kill[4]) Squash_STB(4);
		if (`SPC2.lsu_block_store_kill[5]) Squash_STB(5);
		if (`SPC2.lsu_block_store_kill[6]) Squash_STB(6);
		if (`SPC2.lsu_block_store_kill[7]) Squash_STB(7);
	end
	
	if (`SPC2.lsu_stb_dealloc[7:0] != 8'b0)
	begin
		if (`SPC2.lsu_stb_dealloc[0]) Dealloc_STB(0);
		if (`SPC2.lsu_stb_dealloc[1]) Dealloc_STB(1);
		if (`SPC2.lsu_stb_dealloc[2]) Dealloc_STB(2);
		if (`SPC2.lsu_stb_dealloc[3]) Dealloc_STB(3);
		if (`SPC2.lsu_stb_dealloc[4]) Dealloc_STB(4);
		if (`SPC2.lsu_stb_dealloc[5]) Dealloc_STB(5);
		if (`SPC2.lsu_stb_dealloc[6]) Dealloc_STB(6);
		if (`SPC2.lsu_stb_dealloc[7]) Dealloc_STB(7);
	end

	if (`SPC2.lsu_block_store_stall)
	      Chk_block_store;

	if (`SPC2.lsu.lsu_block_store_alloc[7:0] != 8'b0)
		Set_block_store_parameters;

	if (`SPC2.lsu_sbdiou_err_g || `SPC2.lsu_sbapp_err_g)
		Squash_store;

	if (`SPC2.lsu_stb_flush_g)
		st_priv[`SPC2.lsu_stberr_tid_g] = get_priv_on_flush(`SPC2.lsu_stberr_tid_g);
end

function [1:0] get_priv_on_flush;
input [2:0] tid;
reg [2:0] sq_index;
reg [204:0] tmp;

begin
	sq_index = `SPC2.lsu_stberr_index_g;
	tmp = stb[{tid, sq_index}];
	get_priv_on_flush = tmp[`ST_PRIV];
end
endfunction

task Chk_block_store;
reg [20:0] inst;
reg [2:0] thid;
begin
		thid = `SPC2.lsu_block_store_tid;
		bst_inst_data = stb[{thid, rdptr[thid]}];
		inst = bst_inst_data[`LSU_MON_INST];

		if (~inst[`BLKST])
		begin
			Disp_STB_entry(thid, iss_ptr[thid]);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted blk_store_stall while the req at the top of STB is not blkst as shown above", core_id, thid);
		end
end
endtask

//lsu can assert block_store_stall for a new block store while it has not yet written
//the 8 stb entries from the previous blk store.

task Set_block_store_parameters;
reg [2:0] thid;
begin
	
		thid = decode_tid(`SPC2.lsu.lsu_block_store_alloc[7:0]);
		if (lsu_bst_active[thid])
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted blk_store_alloc while the bst_active is already set for this thread.", core_id, thid);
		end
		else
		begin
			lsu_bst_active[thid] = 1'b1;
			bst_active_thid = thid;
			if (`SPC2.lsu.fgu_fst_ecc_error_fx2)
			    bst_fgu_err = 1'b1;
			else
			    bst_fgu_err = 1'b0;
		end
end
endtask

task Squash_store;
reg [2:0] thid;
reg [2:0] sq_index;
reg [2:0] i;
reg [204:0] tmp;
reg [3:0] squash_cnt;
reg [1:0] priv;

begin
	thid = `SPC2.lsu_stberr_tid_g;
	sq_index = `SPC2.lsu_stberr_index_g;
	priv = `SPC2.lsu_stberr_priv_g;
	tmp = stb[{thid, sq_index}];
	squash_cnt = 0;
     	`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Sbdiou/sbapp seen for index = %h and priv = %h.", core_id, thid, sq_index,  priv);

	st_priv[thid] = tmp[`ST_PRIV];

	//lsu can assert deallocate before it asserts the sbdiou signal. 
	//In that case iss_ptr won't be equal to sbdiou index.
	//if (sq_index != iss_ptr[thid])
	//begin
	//	Disp_STB_entry(thid, iss_ptr[thid]);
	//	`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted sbdiou/sbapp with index %0h while the next req to be issued is at index %0h.", core_id, thid, sq_index, iss_ptr[thid]);
	//end
	
	//If there is only one store in the store buffer which gets an sbdiou error, then LSU can deallocate
	//the store and then assert sbdiou. The deallocation will cause the stb issue_ptr to move 
	//forward to an inst. that has already been issued and completed and this chk can fire. So
	//removing this chk. 

        //if (tmp[`L2_ST_ISS])
        //begin
         //       Disp_STB_entry(thid, iss_ptr[thid]);
          //      `PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store reissued on the PCX interface.", core_id, thid, tmp[`MEMOP_PA]);
        //end

	if (iss_ptr[thid] == wrptr[thid])
	begin
	    if (stb_valid[{thid, wrptr[thid]}])
		squash_cnt = 8;
	    else
	    begin
	    //changing it to an info message because if there is only one valid entry in store buffer that
	    //gets an sbdiou then LSU can deallocate the entry and then issue sbdiou.
              	//`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Lsu asserted sbdiou/sbapp while there are no valid entries in STB to be issued.", core_id, thid);
              	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> sbdiou/sbapp squashed only one entry in STB.", core_id, thid);
	    end
	end
	else
	begin
	  if (iss_ptr[thid] < wrptr[thid])
		squash_cnt = wrptr[thid] - iss_ptr[thid];
	  else if (iss_ptr[thid] > wrptr[thid])
		squash_cnt = wrptr[thid] + (8 - iss_ptr[thid]);
	end
	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> SQUASH_STORE:iss_ptr = %0h, wrptr = %0h, squash_cnt = %0h.", core_id, thid, iss_ptr[thid], wrptr[thid], squash_cnt);

	i = iss_ptr[thid];
		
	while (squash_cnt)
	begin
		tmp = stb[{thid, i}];
		tmp[`ST_SQUASH] = 1'b1;
		if (priv < tmp[`ST_PRIV])
		begin
              		`PR_INFO("lsu_mon", `INFO, "<C%h> <T%0h> <PA = %0h> Sbdiou/sbapp signalled. Err in user/priv level store is squashing a higher priv level store.", core_id, thid, tmp[`MEMOP_PA]);
			priv = tmp[`ST_PRIV];
		end
			
		stb[{thid, i}] = tmp;
               	`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <PA = %0h> STB_entry[%0h] squashed.", core_id, thid, tmp[`MEMOP_PA], i);
	   	 
		 i = i + 1;
		 squash_cnt = squash_cnt - 1'b1;
	end
end
endtask

function [2:0] decode_tid;
input [7:0] thid_encode;
begin
	case (thid_encode)
	   8'h1: decode_tid = 3'b0;
	   8'h2: decode_tid = 3'h1;
	   8'h4: decode_tid = 3'h2;
	   8'h8: decode_tid = 3'h3;
	   8'h10: decode_tid = 3'h4;
	   8'h20: decode_tid = 3'h5;
	   8'h40: decode_tid = 3'h6;
	   8'h80: decode_tid = 3'h7;
	   default: 
	   begin
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> decode_tid. Incorrect value of thid input = %0h.", core_id, thid_encode, thid_encode);
	   end
	endcase
end
endfunction

task Chk_ld_complete;
input [2:0] thid;
reg [`LD_Pend_Width] tmp;
begin
	tmp = ld_pend_array[thid];

	if (ld_valid[thid])
	begin
		if ((tmp[`L2_ISS] != 4'hf) || (tmp[`L2_RESP] != 4'hf))
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted lsu_complete while the l2_iss and l2_resp bits are not F.", core_id, thid);
		end
		ld_valid[thid] = 1'b0;
		`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h> %s(VA=%0h) Complete. Setting ld_valid to 0.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
	end

	tmp = last_inst_array[thid];
	`PR_INFO("lsu_mon", 24, "<C%h> <T%0h> <%0h> %s(VA=%0h) Complete.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
end
endtask
	
task Chk_pcx_req_pkt;
input [129:0] pcx_pkt;
reg [2:0] thid;
reg [`LD_Pend_Width] tmp, tmp1; 
reg [15:0] inst; 
reg [11*8:0] req;
reg [39:0] addr;
begin 
	thid = pcx_pkt[`PCX_THR_ID]; 
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	req = DispPCXReq(pcx_pkt);
	addr = pcx_pkt[`PCX_ADDR];


	if (pcx_pkt[`PCX_CPU_ID] != core_id)
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> cpu_id (spc_pcx_data_pa[122:120]) = %h is not = %0h when the lsu made a %s req to gasket.", core_id, pcx_pkt[`PCX_THR_ID], addr, pcx_pkt[122:120], core_id, req);
	
	
	if ((pcx_pkt[`PCX_RQTYP] == `PCX_LOAD) || (pcx_pkt[`PCX_RQTYP] == `PCX_CAS1) || (pcx_pkt[`PCX_RQTYP] == `PCX_CAS2) || (pcx_pkt[`PCX_RQTYP] == `PCX_SWAP_LDSTUB))
	begin
	  if (~ld_valid[thid])
	  begin
		ld_valid[thid] = 1'b1;  //we have sent a req to gasket and are waiting for response
		`PR_INFO("lsu_mon", 22, "<C%0h> <T%0h> Setting ld_valid[%0h].", core_id, thid, thid);
	  end
		if (~inst[`BLKLD])
		begin
			if (tmp[`MEMOP_PA] != addr)
			begin
				if ((tmp[`INST_ASI] == 8'h41) || (tmp[`INST_ASI] == 8'h73) || ((tmp[`INST_ASI] == 8'h45) && ((tmp[`MEMOP_PA] == 8'h10) || (tmp[`MEMOP_PA] == 8'h18))))
				begin
					`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <PA = %0h> PA mismatch on gasket for %s request. Ignoring the mismatch as inst. is issued with asi 41, 73 or 45 (with VA 0x10 or 18).", core_id, thid, addr, req);
				end
				else
				begin
					DispPendReq(thid);
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A %s request made to gasket by LSU while the pending req is with PA %0h.", core_id, thid, addr, req, tmp[`MEMOP_PA]);
				end
			end
		end
	end

	case (pcx_pkt[`PCX_RQTYP])
	   `PCX_LOAD: 
	   begin
		if (pcx_pkt[`PCX_PF])
		begin
			if (~inst[`PREF])
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A prefetch request made to gasket by LSU which mismatches the pending request from the thread.", core_id, thid, addr);
			end
			if (pcx_pkt[`PCX_INV])
			begin
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: PREF_ICE(VA=%0h) Issued. pf_cnt not updated.", core_id, thid, tmp[`INST_VA], tmp[`MEMOP_VA]);
			end
			else
			begin
			 	pf_cnt[thid] = pf_cnt[thid] + 1'b1;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Issued. pf_cnt = %0d.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], pf_cnt[thid]);
			end
			tmp[`L2_ISS] = 4'hF;
			tmp[`L2_RESP] = 4'hF; //we don't wait for a prefetch response from gasket
			ld_pend_array[thid] = tmp;
		end
		else 
		begin
			if (pcx_pkt[`PCX_INV])
			begin
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Dcache invalidate pkt issued to CCX.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
				dcache_inv_cnt[thid] = dcache_inv_cnt[thid] + 1'b1;
			end
			else
			begin
				Chk_req_load(pcx_pkt);
			end
		end
	    end
           `PCX_CAS1, `PCX_CAS2:
	   begin
		if (~inst[`CASA])
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> CASA request made to gasket by LSU while no such request request is pending from this thread.", core_id, thid, addr);
		end
		if (pcx_pkt[`PCX_RQTYP] == `PCX_CAS1)
		begin
			tmp[`L2_ISS] = 4'hE;
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) (CAS1) Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			ld_pend_array[thid] = tmp;
		end
		if (pcx_pkt[`PCX_RQTYP] == `PCX_CAS2)
		begin
			tmp[`L2_ISS] = 4'hF;
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) (CAS2) Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			ld_pend_array[thid] = tmp;
			chk_store_issue_to_pcx(pcx_pkt);
		end
		
	   end
	   `PCX_SWAP_LDSTUB:
	   begin
		if (~inst[`SWAP] && ~inst[`LDSTUB])
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> %s request made to gasket by LSU while no such request request is pending from this thread.", core_id, thid, addr, req);
		end
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Issued to gasket. store_data = %0h", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], pcx_pkt[`PCX_DATA]);
		tmp[`L2_ISS] = 4'hF;
		ld_pend_array[thid] = tmp;
		
		chk_store_issue_to_pcx(pcx_pkt);
	   end

	    `PCX_STORE:
	    begin
		chk_store_issue_to_pcx(pcx_pkt);
	    end
	   
	   default: `PR_INFO("lsu_mon", 21, "<C%h> <T%0h> <%0h>: %s Issued to gasket.", core_id, thid, addr, req);
	endcase
end
endtask

task Chk_cpx_response_pkt;
input [145:0] cpx_pkt;
reg [2:0] thid;
begin
	thid = cpx_pkt[`CPX_THR_ID];	

	casex ({cpx_pkt[`CPX_RTNTYP], cpx_pkt[`CPX_ERR], cpx_pkt[`CPX_NC], cpx_pkt[`CPX_ATM], cpx_pkt[`CPX_PF]})
	  {4'b0, 2'bxx, 1'bx, 1'b0, 1'b0}:  
	  begin
		chk_ccx_ld_response(cpx_pkt);
	  end

	  {4'b0, 2'bxx, 1'b1, 1'b0, 1'b1}:  
	  begin
		if (pf_cnt[thid] == 8'b0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Prefetch response received from gasket while the pf_cnt is 0 for this thread.", core_id, thid);
		end
		else
		begin
			pf_cnt[thid] = pf_cnt[thid] - 1'b1;
			`PR_INFO("lsu_mon", 26, "<C%h> <T%0h> Prefetch response received. pfcnt = %0d.", core_id, thid, pf_cnt[thid]);
		end
	  end
	  
	  {4'h8, 2'bxx, 1'b1, 1'b0, 1'b0}:  
		chk_ccx_ld_response(cpx_pkt);

	  {4'h4, 2'bxx, 1'bx, 1'b0, 1'b0}:  
	   begin
	      if (cpx_pkt[123])  //D pkt
	      begin //{
		if (cpx_pkt[120:118] != core_id)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> D response received from gasket with core_id =%h.", core_id, thid, cpx_pkt[120:118]);
		end
		if (dcache_inv_cnt[thid] == 8'b0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> D response received from gasket while the Dcache_inv_cnt is 0 for this thread.", core_id, thid);
		end
		else
		begin
			dcache_inv_cnt[thid] = dcache_inv_cnt[thid] - 1'b1;
			`PR_INFO("lsu_mon", 26, "<C%h> <T%0h> D response received. Dcache_inv_cnt = %0d.", core_id, thid, dcache_inv_cnt[thid]);
		end
	     end  //}
	     else if (cpx_pkt[124])  //I pkt
	     begin
		if (cpx_pkt[120:118] != core_id)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> I response received from gasket with core_id =%h.", core_id, thid, cpx_pkt[120:118]);
		end
		//`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> I pkt.", core_id, thid);
	     end
	     else if (cpx_pkt[124:123] == 2'b0)
	     begin
		if (cpx_pkt[120:118] == core_id)
		begin
			chk_ccx_st_response(cpx_pkt);
	        end
		else
		begin
			`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Store Ack pkt received from core %0h.", core_id, thid, cpx_pkt[120:118]);
		end
	     end
	   end

	  {4'h1, 2'bxx, 1'bx, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> IFILL1 return.", core_id, thid);
	  {4'h1, 2'bxx, 1'bx, 1'b1, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> IFILL2 return.", core_id, thid);
	  {4'h9, 2'bxx, 1'b1, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> NCU IFILL return.", core_id, thid);
	  
	  {4'b0, 2'bxx, 1'b1, 1'b1, 1'b0}:  
	  begin
		chk_ccx_atm_response(cpx_pkt);
	  end
	  {4'h4, 2'bxx, 1'b1, 1'b1, 1'b0}:  
	  begin
		if ((cpx_pkt[`CPX_RTNTYP] == 4'h4) & (cpx_pkt[120:118] == core_id))
		begin
			chk_ccx_atm_response(cpx_pkt);
			chk_ccx_st_response(cpx_pkt);
		end
	  end
			
	  {4'h2, 2'bxx, 1'b1, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Stream Ld return.", core_id, thid);
	  {4'h6, 2'bxx, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Stream store Ack.", core_id, thid);
	  {4'h5, 2'bxx, 1'b1, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> MMU ld return.", core_id, thid);
	  {4'h7, 2'b00, 1'b0, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Interrupt return.", core_id, thid);
	  {4'h3, 2'b00, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Eviction Invalidation.", core_id, thid);
	  {4'hc, 2'bxx, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> L2 Indication.", core_id, thid);
	  
	  {4'hd, 2'bxx, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Soc Error Indication.", core_id, thid);
	   
	  default:
	  begin
		`PR_ALWAYS("lsu_mon", `ALWAYS, "CPX_PKT data.");
		`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%0h> <T%0h> rtn_typ = %0h, err_bits = %0h, nc=%0b, atm = %0b, pf = %0b",  core_id, cpx_pkt[`CPX_THR_ID], cpx_pkt[`CPX_RTNTYP], cpx_pkt[`CPX_ERR], cpx_pkt[`CPX_NC], cpx_pkt[`CPX_ATM], cpx_pkt[`CPX_PF]);

		`PR_ERROR("lsu_mon", `ERROR, "<C%0h> <T%0h> Can't recognise the CPX pkt.",  core_id, thid);
	  end

	endcase
end
endtask

task chk_ccx_ld_response;
input [145:0] cpx_pkt;
reg [2:0] thid;
reg [20:0] inst;
reg [39:0] cpx_pa, inst_pa;
reg [`LD_Pend_Width] tmp;
reg [3:0] pkt_type;
begin
	thid = cpx_pkt[`CPX_THR_ID];
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	inst_pa = tmp[`MEMOP_PA];
	pkt_type = cpx_pkt[`CPX_RTNTYP];

	   if (ld_valid[thid])
	   begin 
			`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) L2 response.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
		/* 
			if (inst_pa[39] != pkt_type[3])
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> ccx pkt_type = %h mismatches the ld_pa bit 39. ld_pa = %0h.", core_id, thid, pkt_type, inst_pa);
			end
		*/

			if (inst[`BLKLD])
			begin
				if (tmp[`L2_RESP] == 4'h0) 
				begin
					tmp[`L2_RESP] = 4'h1; 
					tmp[`L2_ERR0] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 1.", core_id, thid);
					end

				end
				else if (tmp[`L2_RESP] == 4'h1) 
				begin
					tmp[`L2_RESP] = 4'h3; 
					tmp[`L2_ERR1] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 2.", core_id, thid);
					end
				end
				else if (tmp[`L2_RESP] == 4'h3) 
				begin
					tmp[`L2_RESP] = 4'h7; 
					tmp[`L2_ERR2] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 3.", core_id, thid);
					end
				end
				else if (tmp[`L2_RESP] == 4'h7) 
				begin
					tmp[`L2_RESP] = 4'hF; 
					tmp[`L2_ERR3] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 4.", core_id, thid);
					end

					//is_blkld[thid] = 1'b1;
					if ((tmp[`L2_ERR0] == `ND) || (tmp[`L2_ERR1] == `ND) || (tmp[`L2_ERR2] == `ND) ||  (tmp[`L2_ERR3] == `ND))
						l2_blk_ld_errtype[thid] = `ND;
					else if ((tmp[`L2_ERR0] == `UE) || (tmp[`L2_ERR1] == `UE) || (tmp[`L2_ERR2] == `UE) ||  (tmp[`L2_ERR3] == `UE))
						l2_blk_ld_errtype[thid] = `UE;
					else if ((tmp[`L2_ERR0] == `CE) || (tmp[`L2_ERR1] == `CE) || (tmp[`L2_ERR2] == `CE) ||  (tmp[`L2_ERR3] == `CE))
						l2_blk_ld_errtype[thid] = `CE;
					else 
						l2_blk_ld_errtype[thid] = `NE;
				end
				else
				begin
					DispPendReq(thid);
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when response pkt received from ccx.", core_id, thid);
				end
			end
			else if (Is_single_pcx_req_ld(inst)) 
			begin
				//is_blkld[thid] = 1'b0;
				if (tmp[`L2_RESP] != 4'hE)
				begin
					DispPendReq(thid);
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when response pkt received from ccx.", core_id, thid);
				end
				//`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Setting L2_resp bits to F.", core_id, thid);
				tmp[`L2_RESP] = 4'hF;
			end
			else
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Load response received from gasket for thid %h while no load request pending from core for this thread.", core_id, thid, thid);
	     end
	     else
	     begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Load response received from gasket while no load request pending from core for this thread.", core_id, thid);
	     end

	ld_pend_array[thid] = tmp;
end
endtask

task chk_ccx_atm_response;
input [145:0] cpx_pkt;
reg [2:0] thid;
reg [20:0] inst;
reg [39:0] inst_pa;
reg [`LD_Pend_Width] tmp;
begin
	thid = cpx_pkt[`CPX_THR_ID];
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	inst_pa = tmp[`MEMOP_PA];

	if (~ld_valid[thid])
	begin
		if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ld response received from gasket while no request pending from core for this thread.", core_id, thid);
		end
		else
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ack response received from gasket while no request pending from core for this thread.", core_id, thid);
		end
	end
        else
   	begin 
		if (~inst[`SWAP] && ~inst[`CASA] && ~inst[`LDSTUB])
		begin
			DispPendReq(thid);
			if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
			begin
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ld response received from gasket which mismatches the request pending from this thread.", core_id, thid);
			end
			else
			begin
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ack response received from gasket which mismatches the request pending from this thread.", core_id, thid);
			end
		end
		else
		begin
		if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
		begin
			`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) Atomic ld response.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
		end
		else
		begin
			`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) Atomic ack.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
		end

		   if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
		   begin
			if (tmp[`L2_RESP] == 4'hC) tmp[`L2_RESP] = 4'hD; 
			else
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when atomic ld return pkt received from ccx.", core_id, thid);
			end
		  end
		  else
		  begin
			if (tmp[`L2_RESP] == 4'hD) tmp[`L2_RESP] = 4'hF; 
			else
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when atomic ack pkt received from ccx.", core_id, thid);
			end
		  end
		end
	end
	ld_pend_array[thid] = tmp;
end
endtask

task chk_ccx_st_response;
input [145:0] cpx_pkt;
reg [2:0] thid;
reg [20:0] inst;
reg [39:0] cpx_pa, inst_pa;
reg [204:0] tmp;
reg [3:0] pkt_type;
begin
	thid = cpx_pkt[`CPX_THR_ID];
	tmp = stb[{thid, ret_ptr[thid]}];
	inst = tmp[`LSU_MON_INST];
	inst_pa = tmp[`MEMOP_PA];
	pkt_type = cpx_pkt[`CPX_RTNTYP];


//is received. There could be some other store sitting in the STB at that time.

//Chk for squash bit only for non-bis responses.


	if (cpx_pkt[`CPX_BIS])  //response to rmo store
	begin
		if (st_rmo_cnt[thid] == 0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> L2 response received for an rmo store while the st_rmo_cnt for this thread is 0.", core_id, thid);
		end
		else
		begin
			st_rmo_cnt[thid] = st_rmo_cnt[thid] - 1'b1;
			`PR_INFO("lsu_mon", 25, "<C%0h> <T%0h> Store ack received for RMO store. rmo_cnt = %0d", core_id, thid, st_rmo_cnt[thid]);
		end
	end
	else
	begin
	   if (tmp[`ST_SQUASH])
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> L2 response received while the SQUASH bit is set in the STB entry %0h.", core_id, thid, ret_ptr[thid]);
	   
           if (~stb_valid[{thid, ret_ptr[thid]}])
           begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Store ack received while that entry is invalid in STB.", core_id, thid);
	   end
	   else
	   begin
	      if (~cpx_pkt[`CPX_ATM])  //don't print this message for atomic return
	      begin
		`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) STB[%0d] Store ack.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA], ret_ptr[thid]);
              end
	      tmp[`L2_ACK] = 1'b1;
	      stb[{thid, ret_ptr[thid]}] = tmp;
		ret_ptr[thid] = ret_ptr[thid] + 1'b1;
		//`PR_INFO("lsu_mon", 22, "<C%0h> <T%0h> ret_ptr = %0d.", core_id, thid, ret_ptr[thid]);
	   end
	end
end
endtask

task Chk_req_load;
input [129:0] pcx_pkt;
reg [2:0] thid;
reg [`LD_Pend_Width] tmp;
reg [39:0] pcx_pa, inst_pa;
reg [20:0] inst;
reg [11*8:0] req;
begin
	
	thid = pcx_pkt[`PCX_THR_ID];
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	pcx_pa = pcx_pkt[`PCX_ADDR];
	inst_pa = tmp[`MEMOP_PA];
	req = DispPCXReq(pcx_pkt);

	if (inst[`BLKLD])
	begin
		if (pcx_pa[39:6] != inst_pa[39:6])
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A load request made to gasket by LSU while the pending req has PA %0h.", core_id, thid, pcx_pa, tmp[`MEMOP_PA]);
		end
		if (pcx_pa[5:0] == 6'b0)
		begin
			if (tmp[`L2_ISS] != 4'h0 )
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 1st load request (pa[5:0] = 6'b0) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				tmp[`L2_ISS] = 4'h1;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 1st blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			end
				
		end
		if (pcx_pa[5:0] == 6'h10)
		begin
			if (tmp[`L2_ISS] != 4'h1)
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 2nd load request (pa[5:0] = 6'h10) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				tmp[`L2_ISS] = 4'h3;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 2nd blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			end
		end
		if (pcx_pa[5:0] == 6'h20)
		begin
			if (tmp[`L2_ISS] != 4'h3)
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 3rd load request (pa[5:0] = 6'h20) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				tmp[`L2_ISS] = 4'h7;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 3rd blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			end
		end
		if (pcx_pa[5:0] == 6'h30)
		begin
			if (tmp[`L2_ISS] != 4'h7)
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 4th load request (pa[5:0] = 6'h30) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 4th blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
				tmp[`L2_ISS] = 4'hF;
			end
		end
		ld_pend_array[thid] = tmp;
	end
	else if (Is_single_pcx_req_ld(inst)) 
	begin
	  if (tmp[`L2_ISS] == 4'hF)
	  begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Load request  made to gasket by LSU while this request has already been issued to gasket.", core_id, thid, pcx_pa);
	  end
	  else
	  begin
		tmp[`L2_ISS] = 4'hF;
		ld_pend_array[thid] = tmp;
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
	  end
	end
	else
	begin
		DispPendReq(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A load request made to gasket by LSU while there is no such ld request pending from this thread.", core_id, thid, pcx_pa);
	end
end
endtask

	
function Is_single_pcx_req_ld;
input [20:0] inst;
begin
	if (inst[`LDD] || inst[`QLD] || inst[`FSR_RD_WR] || (inst == 21'h1) || (inst == 21'h5))
		Is_single_pcx_req_ld = 1'b1;
	else
		Is_single_pcx_req_ld = 1'b0;
	//`PR_INFO("lsu_mon", 22, "<C%0h> Is_single_pcx_req_ld = %b. ", core_id, Is_single_pcx_req_ld);
end
endfunction
			          

function Is_trap;
input [2:0]tid;

begin
	Is_trap = 1'b0;
	case (`SPC2.lsu_trap_flush[7:0])
		8'h01: if (tid == 3'h0) Is_trap = 1'b1;
		8'h02: if (tid == 3'h1) Is_trap = 1'b1;
		8'h04: if (tid == 3'h2) Is_trap = 1'b1;
		8'h08: if (tid == 3'h3) Is_trap = 1'b1;
		8'h10: if (tid == 3'h4) Is_trap = 1'b1;
		8'h20: if (tid == 3'h5) Is_trap = 1'b1;
		8'h40: if (tid == 3'h6) Is_trap = 1'b1;
		8'h80: if (tid == 3'h7) Is_trap = 1'b1;
	endcase
end
endfunction

function [8*11:0] DispPCXReq;
input [129:0] pcx_pkt;
begin
	casex ({pcx_pkt[`PCX_RQTYP], pcx_pkt[`PCX_NC], pcx_pkt[`PCX_INV], pcx_pkt[`PCX_PF], pcx_pkt[`PCX_BIS]})
		{5'h0, 1'b1, 1'b0, 1'b1, 1'b0}: DispPCXReq = "PREF";
		{5'h0, 1'b1, 1'b1, 1'b1, 1'b0}: DispPCXReq = "PREF_ICE";
		{5'h0, 1'bx, 1'b0, 1'b0, 1'b0}: DispPCXReq = "LD";
		{5'h0, 1'bx, 1'b1, 1'b0, 1'b0}: DispPCXReq = "D";  
		{5'h10, 1'bx, 1'b0, 1'b0, 1'b0}: DispPCXReq = "I";
		{5'h10, 1'b0, 1'b1, 1'b0, 1'b0}: DispPCXReq = "I";
		{5'h1, 1'bX, 1'bX, 1'b0, 1'b0}: DispPCXReq = "ST";
		{5'h1, 1'bX, 1'bX, 1'b1, 1'b1}: DispPCXReq = "BLKST";
		{5'h1, 1'bX, 1'bX, 1'b0, 1'b1}: DispPCXReq = "BIS";
		{5'h2, 1'b1, 1'bX, 1'b0, 1'b0}: DispPCXReq = "CASA1";
		{5'h3, 1'b1, 1'bX, 1'b0, 1'b0}: DispPCXReq = "CASA2";
		{5'h7, 1'b1, 1'bX, 1'b0, 1'b0}: DispPCXReq = "SWAP_LDSTUB";
		{5'h4, 1'b1, 1'b0, 1'b0, 1'b0}: DispPCXReq = "STREAM_LD";
		{5'h5, 1'b1, 1'b0, 1'b0, 1'bx}: DispPCXReq = "STREAM_ST";
		{5'h8, 1'b1, 1'b0, 1'b0, 1'b0}: DispPCXReq = "MMU_LD";
		//{5'h9, 1'b0, 1'b0, 1'b0, 1'b0}: DispPCXReq = "INT";
		default:
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%0h> <T%0h> <%0h> Can't recognise the PCX pkt type. rq_type = %h, nc_bit = %0b, inv_bit = %0b, pf_bit = %0b, bis_bit = %0b. pcx_pkt[129:0] = %h",  core_id, pcx_pkt[`PCX_THR_ID], pcx_pkt[`PCX_ADDR], pcx_pkt[`PCX_RQTYP], pcx_pkt[`PCX_NC], pcx_pkt[`PCX_INV], pcx_pkt[`PCX_PF], pcx_pkt[`PCX_BIS], pcx_pkt);
			DispPCXReq = " ";
		end
	 endcase
end
endfunction

function IsExc;
input [2:0] core_id;
reg [21*8:0] DispExc;

begin
	DispExc = 170'b0;
	IsExc = 1'b0;

	if (`SPC2.lsu_align_b) DispExc = "Addr_not_aligned";
	if (`SPC2.lsu_lddf_align_b) DispExc = "LDDF_Addr_not_aligned";
	if (`SPC2.lsu_stdf_align_b) DispExc = "STDF_Addr_not_aligned";
	if (`SPC2.lsu_priv_action_b) DispExc = "Priv_actio";
	if (`SPC2.lsu_va_watchpoint_b) DispExc = "VA_watchpoint";
	if (`SPC2.lsu_pa_watchpoint_b) DispExc = "PA_watchpoint";
	//if (`SPC2.lsu_tlb_miss_b_) DispExc = "Tlb_miss";
	if (`SPC2.lsu_illegal_inst_b) DispExc = "Illegal_inst";
	if (`SPC2.lsu_daccess_prot_b) DispExc = "Data_access_prot_exc";
	if (`SPC2.lsu_dae_invalid_asi_b) DispExc = "Dae_Invalid_asi";
	if (`SPC2.lsu_dae_nc_page_b) DispExc = "Dae_nc_page";
	if (`SPC2.lsu_dae_nfo_page_b) DispExc = "Dae_NFO_page";
	if (`SPC2.lsu_dae_priv_viol_b) DispExc = "Dae_Priv_viol";
	if (`SPC2.lsu_dae_so_page) DispExc = "Dae_so_page";
	//if (`SPC2.lsu_perfmon_trap_b) DispExc = "Perf_mon_trap";
	if (`SPC2.lsu_dtmh_err_b) DispExc = "DTLB_data_par_err";
	if (`SPC2.lsu_dttp_err_b) DispExc = "DTLB_tag_par_err";
	if (`SPC2.lsu_dtdp_err_b) DispExc = "DTLB_data_par_err";

	
	if (DispExc != 0)
	begin
		IsExc = 1'b1;
		`PR_INFO("lsu_mon", 23, "<C%0h> <T%0h> <%0h> B_stage: %s(VA=%0h) ASI = %0h. %s Exception.",core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, asi_b, DispExc);
	end

end
endfunction

function Is_exu_error;
input [1:0] exu_lsu_va_error_b;     // VA error requiring a flush
input [1:0] exu_ecc_b;              // ECC error requiring a flush
reg err_b;
reg err_m;

begin
	err_b = dec_lsu_tid_b[2] ? (exu_ecc_b[1] | (exu_lsu_va_error_b[1] & ~`SPC2.lsu_tlb_bypass_b)):
				(exu_ecc_b[0] | (exu_lsu_va_error_b[0] & ~`SPC2.lsu_tlb_bypass_b));

	err_m = (dec_lsu_tid_b[2] ? `SPC2.exu_ecc_m[1] : `SPC2.exu_ecc_m[0]) & `SPC2.lsu.dcc.twocycle_b;
					
	Is_exu_error = err_b | err_m;
end
endfunction

/*
task Insert_tlb_miss_info;
reg [127:0] tmp;
begin
	tmp =  128'b0;
	if (tlb_valid[dec_lsu_tid_b])
	begin
		tmp = tlbmiss_pend_array[dec_lsu_tid_b];
		Disp_tlbmiss_pend_array_entry(dec_lsu_tid_b);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h>) A new tlb miss request received while there is already a Tlb miss request pending from this thread as shown above.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
	end
	else
	begin
		tlb_valid[dec_lsu_tid_b] <= 1'b1;
		tmp[`INST_VA] = inst_pc_b;
		tmp[`MEMOP_VA] = vaddr_b;
		tmp[`INST] = inst_b;
	end
	tlbmiss_pend_array[dec_lsu_tid_b] = tmp;
end
endtask

*/

//problem with the signal.
/*
always @ (negedge `SPC2.l2clk)
begin
	if (mmu_dtlb_reload_d2)
		Chk_dtlb_reload;
end

task Chk_dtlb_reload;
reg [2:0] thid;
reg [127:0] tmp;
begin
		if (`SPC2.tlu_trap_pc_0_valid)
			thid = {1'b0, `SPC2.tlu_trap_0_tid};
		else if (`SPC2.tlu_trap_pc_1_valid)
			thid = {1'b0, `SPC2.tlu_trap_1_tid};
		else 
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> mmu_dtlb_reload asserted but trap_pc_0_valid and trap_pc_1_valid are both 0", core_id);

		if (~tlb_valid[thid])
			`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> mmu_dtlb_reload asserted while tlb_valid is 0.", core_id, thid);
		else
		begin
			tmp = tlbmiss_pend_array[dec_lsu_tid_b];
			`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> %s(VA=%0h> DTLB reloaded for VA = %0h.", core_id, thid, tb_top.intf0.xlate(tmp[`INST]), tmp[`INST_VA], tmp[`MEMOP_VA] );
			tlb_valid[thid] = 1'b0;
		end
end
endtask
*/

task Insert_ld_miss_info;
reg [`LD_Pend_Width] tmp;
begin
	tmp = 213'b0;
	if (ld_valid[dec_lsu_tid_b])
	begin
		tmp =  ld_pend_array[dec_lsu_tid_b];
		DispPendReq(dec_lsu_tid_b);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h>) A new request received while there is already a request pending from this thread as shown above.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
	end
	else
	begin
		//ld_valid[dec_lsu_tid_b] <= 1'b1;
		tmp[`INST_VA] = inst_pc_b;
		tmp[`MEMOP_VA] = vaddr_b;
		tmp[`MEMOP_PA] = {`SPC2.lsu.tlb_pgnum[39:13], vaddr_b[12:0]};
		tmp[`INST_ASI] = asi_b;

		if (lsu_inst_b[`BLKLD])
		begin
			tmp[`L2_ISS] =  4'h0;
			tmp[`L2_RESP] =  4'h0;
			is_blkld[dec_lsu_tid_b] = 1'b1;
		end
		else
		begin
		   is_blkld[dec_lsu_tid_b] = 1'b0;
		   if (lsu_inst_b[`CASA])
			tmp[`L2_ISS] =  4'hC;
		   else
			tmp[`L2_ISS] =  4'hE;
		   if (lsu_inst_b[`SWAP] || lsu_inst_b[`LDSTUB] || lsu_inst_b[`CASA])
			tmp[`L2_RESP] =  4'hC;
		   else
			tmp[`L2_RESP] =  4'hE;

		end

		tmp[`INST] = inst_b;
		tmp[`LSU_MON_INST] = lsu_inst_b; 
		ld_pend_array[dec_lsu_tid_b] = tmp;
	end
end
endtask


task Insert_in_last_inst_array;
reg [135:0] tmp;
begin
	tmp = 128'b0;
	tmp[`INST_VA] = inst_pc_b;
	tmp[`MEMOP_VA] = vaddr_b;
	tmp[`INST] = inst_b;
	tmp[135:128] = asi_b;
	last_inst_array[dec_lsu_tid_b] = tmp;
end
endtask


task DispPendReq;
input [2:0] thid;
reg [`LD_Pend_Width] tmp;
begin
	
	tmp =  ld_pend_array[thid];
	`PR_ALWAYS("lsu_mon", `ALWAYS, "LD_PEND_ARRAY[%0h] Data.", thid);
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> <%0h> %s(VA=%0h). PA = %0h. L2_ISS = %0h. L2_RESP = %0h, LSU_MON_INST=%h.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA], tmp[`MEMOP_PA], tmp[`L2_ISS], tmp[`L2_RESP], tmp[`LSU_MON_INST]);
end
endtask

task Disp_STB_entry;
input [2:0] thid;
input [2:0] ptr;
reg [204:0] tmp;
begin
	
	tmp =  stb[{thid, ptr}];
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> STB[%0h] data.", core_id, thid, ptr);
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> <%0h> %s(VA=%0h). PA = %0h. L2_ISS = %0h. L2_ACK = %0h, LSU_MON_INST=%h. RMO = %0b", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA], tmp[`MEMOP_PA], tmp[`L2_ST_ISS], tmp[`L2_ACK], tmp[`LSU_MON_INST], tmp[`RMO]);
end
endtask

/*
		
task Disp_tlbmiss_pend_array_entry;
input [2:0] thid;
reg [127:0] tmp;
begin
	tmp = tlbmiss_pend_array[thid];
	`PR_INFO("lsu_mon", 23, "TLB_MISS_PEND_ARRAY[%0h] Data.", thid);
	`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h> %s(VA=%0h).", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);

end
endtask

*/
task Disp_CPX_pkt;
input [145:0] cpx_pkt;
begin
	`PR_ALWAYS("lsu_mon", `ALWAYS, "CPX_PKT data.");
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%0h> <T%0h> rtn_typ = %0h, err_bits = %0h, nc=%0b, atm = %0b, pf = %0b",  core_id, cpx_pkt[`CPX_THR_ID], cpx_pkt[`CPX_RTNTYP], cpx_pkt[`CPX_ERR], cpx_pkt[`CPX_NC], cpx_pkt[`CPX_ATM], cpx_pkt[`CPX_PF]);
end
endtask
	

task Make_STB_data;
reg [204:0] tmp;
begin
		tmp = 0;
		tmp[`INST_VA] = inst_pc_b;
		tmp[`MEMOP_VA] = vaddr_b;
		tmp[`MEMOP_PA] = {`SPC2.lsu.tlb_pgnum[39:13], vaddr_b[12:0]};
		tmp[`L2_ST_ISS] =  1'b0;
		tmp[`ASI_ST_ISS] =  1'b0;
		tmp[`L2_ACK] =  1'b0;
		tmp[`INST] = inst_b;
		tmp[`LSU_MON_INST] = lsu_inst_b;
		tmp[`ST_SQUASH] = 1'b0;
		tmp[`INST_ASI] = asi_b;
		if (`SPC2.lsu.tlu_lsu_hpstate_hpriv[dec_lsu_tid_b])
		   tmp[`ST_PRIV] = `HPRIV; 
		else if (`SPC2.lsu.tlu_lsu_pstate_priv[dec_lsu_tid_b])
		   tmp[`ST_PRIV] = `PRIV; 
		else
		   tmp[`ST_PRIV] = `USER; 
		//bis_asi to io space is not rmo

		tmp[`RMO] = lsu_inst_b[`BLKST] | (dec_altspace_b & Is_bis_asi(asi_b) & ~`SPC2.lsu.tlb_pgnum[39]);
		stb_alloc_data <= tmp;
end
endtask

task Insert_in_STB;
input [195:0] store_data;
input [2:0] thid;
begin
	if (stb_full(thid))
	begin
		//DispSTB(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> STB full and a new store received for insertion in STB.", core_id, thid);
	end
	else
	begin
		stb[{thid, wrptr[thid]}] = store_data;
		//Disp_STB_entry(thid, wrptr[thid]);
		`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h> %s(VA=%0h). STB[%0h] Inserted.", core_id, thid, store_data[`INST_VA], tb_top.intf0.xlate(store_data[`INST]), store_data[`MEMOP_VA], wrptr[thid]);
		stb_valid[{thid, wrptr[thid]}] = 1'b1;
		wrptr[thid] = wrptr[thid] + 1'b1;
		//`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> wrptr = %0d.", core_id, thid, wrptr[thid]);
	end
end
endtask

function stb_full;
input [2:0] thid;
begin
	if ((wrptr[thid] == rdptr[thid]) && stb_valid[{thid, wrptr[thid]}])
		stb_full = 1'b1;
	else
		stb_full = 1'b0;
end
endfunction
	

task Dealloc_STB;
input [2:0] thid;
reg [204:0] tmp;
reg [20:0] lsu_inst;
begin
	//thid = decode_tid(`SPC2.lsu_stb_dealloc);
	tmp = stb[{thid, rdptr[thid]}];
	lsu_inst = tmp[`LSU_MON_INST];
	if (~stb_valid[{thid, rdptr[thid]}])
	begin
		//DispSTB(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_dealloc = %0h asserted while the stb entry is invalid for that thid.", core_id, thid, `SPC2.lsu_stb_dealloc);
	end
	if (tmp[`L2_ST_ISS]) 
	begin
	    if (~tmp[`L2_ACK])
	    begin
		Disp_STB_entry(thid, rdptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_dealloc = %0h asserted when we haven't received the response from the gasket.", core_id, thid, `SPC2.lsu_stb_dealloc);
	    end
	end
	else if (tmp[`ASI_ST_ISS])
	begin
		ret_ptr[thid] = ret_ptr[thid] + 1'b1;
	end
	//blkst inst. is not issued anywhere, blkst helpers are issued.
	//in case of bis stores, lsu issues the dealloc in P3, i.e when the req is issued to PCX.
	//IF it is bis to cp sapce and there is an err then the store is issued to PCX with nd set
	// and deallocated.
	//However for ue onbis to IO space, dealloc is sent to IFU, issued on PCX with valid bit 0.
	//The sbdiou signal is sent in next cycle. We need to take bis io stores in this equation.
	else if (tmp[`ST_SQUASH] || lsu_inst[`BLKST] || (tmp[`RMO] & ~lsu_inst[`BLKST] & ~`SPC0.lsu.sbc.kill_store_p4_)) 
	begin
		iss_ptr[thid] = iss_ptr[thid] + 1'b1;
		ret_ptr[thid] = ret_ptr[thid] + 1'b1;
	end
	else 
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_dealloc = %0h asserted which is not issued to asi ring, or PCX or is not squashed.", core_id, thid, `SPC2.lsu_stb_dealloc);

	`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h>: %s(VA=%0h) PA = %0h. STB[%0d] Deallocated.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], tmp[`MEMOP_PA], rdptr[thid]);
	stb_valid[{thid, rdptr[thid]}] = 1'b0;
	rdptr[thid] = rdptr[thid] + 1'b1;
	//`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> rd_ptr = %0d.", core_id, thid, rdptr[thid]);
	/*
	if (tmp[`RMO])
		st_rmo_cnt[thid] = st_rmo_cnt[thid]  + 1'b1;
	*/
end
endtask

task Squash_STB;
input [2:0] thid;
reg [204:0] tmp;
reg [3:0] squash_cnt;
reg [2:0] i;
begin
	squash_cnt = 4'b0;
        if (ret_ptr[thid] != iss_ptr[thid])
	       `PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> lsu_block_store_kill asserted while the ret_ptr = %0h  != iss_ptr = %0h.", core_id, thid, tmp[`MEMOP_PA], ret_ptr[thid], iss_ptr[thid]);
        if (rdptr[thid] != iss_ptr[thid])
	       `PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> lsu_block_store_kill asserted while the rdptr = %0h  != iss_ptr = %0h.", core_id, thid, tmp[`MEMOP_PA], rdptr[thid], iss_ptr[thid]);

	if (iss_ptr[thid] == wrptr[thid])
	begin
	    if (stb_valid[{thid, wrptr[thid]}])
		squash_cnt = 8;
/* Lsu can assert both dealloc and block_store_kill for a request.
 *
	    else
	    begin
              	`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Lsu asserted block_store_kill while there are no valid entries in STB to be deallocated.", core_id, thid);
	    end
*/
	end
	else
	begin
	  if (iss_ptr[thid] < wrptr[thid])
		squash_cnt = wrptr[thid] - iss_ptr[thid];
	  else if (iss_ptr[thid] > wrptr[thid])
		squash_cnt = wrptr[thid] + (8 - iss_ptr[thid]);
	end

	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> SQUASH_STB:iss_ptr = %0h, wrptr = %0h, squash_cnt = %0h.", core_id, thid, iss_ptr[thid], wrptr[thid], squash_cnt);

	i = iss_ptr[thid];
       
       `PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Block store kill changed issue_ptr:%0h->%0h. ret_ptr: %0h->%0h. rdptr:%0h->%0h.", core_id, thid, iss_ptr[thid], iss_ptr[thid]+squash_cnt, ret_ptr[thid], ret_ptr[thid]+squash_cnt, rdptr[thid], rdptr[thid]+squash_cnt);

   	ret_ptr[thid] = ret_ptr[thid] + squash_cnt;
	rdptr[thid] = rdptr[thid] + squash_cnt;
        iss_ptr[thid] = iss_ptr[thid] + squash_cnt;
		
	while (squash_cnt)
	begin
	    tmp = stb[{thid, i}];
	    if (~stb_valid[{thid, i}])
	    begin
		//DispSTB(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h><PA = %0h> lsu_block_store_kill asserted while the stb entry %0h is invalid.", core_id, thid, tmp[`MEMOP_PA], i);
	    end
	    if (tmp[`L2_ST_ISS]) 
	    begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h>st_issue bit is set when the block_store_kill is asserted for stb entry %0h.", core_id, thid, tmp[`MEMOP_PA], i);
	    end
	    //commenting out the chk below. Lsu can assert sbdiou and then in the next cycle insert a new entry into
	    //stb. LSU will squash this new entry and won't issue it to PCX/asi but its squash bit won't be 
	    //set in the chkr which was causin it to fire. 
	    //if (~tmp[`ST_SQUASH]) 
	    //begin
	       //`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> lsu_block_store_kill asserted while the squash bit is 0 in the STB entry %0h.", core_id, thid, tmp[`MEMOP_PA], i);
	    //end
	    stb_valid[{thid, i}] = 1'b0; 

	    i = i + 1;
	    squash_cnt = squash_cnt - 1'b1;
	end

end
endtask

task Chk_store;
reg [2:0] thid;
reg [47:0] addr;
reg [3:0] i;
reg [204:0] tmp;
begin
	if ((bst_cnt > 0) && (`SPC2.lsu_stb_alloc == 8'b0))
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Blk store entries are not allocated back to back in STB.", core_id, bst_active_thid);

//For bst the stb is still written even though we have errors.
//Stb is written in W stage. Howvere for first blk store helper
//the err will be flagged by FGU in b stage. We can miss the
// err signal if we don't sample in B.
//for the last helper err will be signalled in B stage of last helper and at

	if (lsu_bst_active[bst_active_thid] & `SPC0.fgu_fst_ecc_error_fx2 & (bst_cnt < 7))
             bst_fgu_err = 1'b1;

	if (`SPC2.lsu_stb_alloc[7:0] != 8'b0)
	begin
		thid = decode_tid(`SPC2.lsu_stb_alloc[7:0]);
		if (store_alloc)
		begin
			if (thid != dec_lsu_tid_w)
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_alloc = %0h mismatches the thid %0h.", core_id, dec_lsu_tid_w, `SPC2.lsu_stb_alloc[7:0], dec_lsu_tid_w);
			Insert_in_STB(stb_alloc_data, dec_lsu_tid_w);
		end
		else 
		begin
		    if (lsu_bst_active[thid])
		    begin
			   if (bst_cnt == 0)
			   begin
				bst_data = bst_inst_data;
			   end
		           else
			   begin
				if (thid != bst_active_thid)
				begin
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_alloc = %0h mismatches the active blkstore thid = %0h.", core_id, bst_active_thid, `SPC2.lsu_stb_alloc[7:0], bst_active_thid);
				end

				addr = bst_data[`MEMOP_VA];

				bst_data[`MEMOP_VA] = {addr[47:6], bst_cnt[2:0], 3'b0};
				addr = bst_data[`MEMOP_PA];
				bst_data[`MEMOP_PA] = {addr[39:6], bst_cnt[2:0], 3'b0};
			   end
                                bst_cnt = bst_cnt + 1;
                                Insert_in_STB(bst_data, bst_active_thid);
                                if (bst_cnt == 8)
                                begin
                                        bst_cnt = 0;
                                        lsu_bst_active[thid] = 1'b0;
                                        if (bst_fgu_err) //set the squash bit to 0 for all the stb entries
                                        begin
                                          for (i = 0; i < 8; i=i+1)
                                          begin
                                             tmp = stb[{thid, i[2:0]}];
					     if (tmp[`ST_SQUASH])
						`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Squash bit already set when trying to set it for a bst fgu errerr.", core_id, thid, tmp[`MEMOP_PA]);
					     tmp[`ST_SQUASH] = 1'b1;
                                             stb[{thid, i[2:0]}] = tmp; 
                                             `PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <PA = %0h> STB_entry[%0h] squashed due to FGU err.", core_id, thid, tmp[`MEMOP_PA], i);
                                          end
                                        end
					bst_fgu_err = 1'b0;
                                end
			end
			else
				`PR_ERROR("lsu_mon", `ERROR, "<C%h>: LSU asserted lsu_stb_alloc  = %0h while no store pending to be written in STB.", core_id, `SPC2.lsu_stb_alloc[7:0]);
				
		end
	end
	else
	begin
		if (store_alloc)
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h> W_stage: LSU did not assert lsu_stb_alloc for the store.", core_id, dec_lsu_tid_w, inst_pc_w);
	end
end
endtask

task Chk_st_on_ASI_ring;
input ring;
reg [2:0] thid;
reg [7:0] asi;
reg [47:0] addr, act_addr;
reg [1:0] req_type;
reg [204:0] tmp;

begin
	if (ring == `LOCAL)
		thid =`SPC2.lsu_rngl_cdbus[58:56];
	else
		thid =`SPC2.lsu_rngf_cdbus[58:56];
	
	if (ring == `LOCAL)
		asi =`SPC2.lsu_rngl_cdbus[55:48];
	else
		asi =`SPC2.lsu_rngf_cdbus[55:48];
	
	if (ring == `LOCAL)
		addr =`SPC2.lsu_rngl_cdbus[47:0];
	else
		addr =`SPC2.lsu_rngf_cdbus[47:0];
	
	if (ring == `LOCAL)
		req_type =`SPC2.lsu_rngl_cdbus[61:60];
	else
		req_type =`SPC2.lsu_rngf_cdbus[61:60];
	

	tmp = stb[{thid, iss_ptr[thid]}];
	if (tmp[`ASI_ST_ISS])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store reissued on the ASI interface.", core_id, thid, addr);
	end
	
	if (tmp[`ST_SQUASH])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store issued on the ASI interface that has been squashed.", core_id, thid, addr);
	end

	act_addr  = tmp[`MEMOP_PA];
	act_addr = {act_addr[39:3], 3'b0};

	//47 is D tag rd asi. LSU issues that on the ring but changes 
	//the address.
	if ((addr == act_addr) || (asi == 8'h47) || (asi == 8'h46))  
	begin
		tmp[`ASI_ST_ISS] = 1'b1;
		stb[{thid, iss_ptr[thid]}] = tmp;
		if (ring == `LOCAL)
		begin
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued on local ring.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
		end
		else
		begin
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued on fast ring.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
		end
		iss_ptr[thid] = iss_ptr[thid] + 1'b1;
	end
	else
	begin
	   if (ring == `LOCAL)
	   begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] PA mismatch for asi req on local ring. Expected PA = %0h, actual PA = %0h", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid], tmp[`MEMOP_PA], addr);
	   end
	   else
	   begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] PA mismatch for asi req on fast ring. Expected PA = %0h, actual PA = %0h", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid], tmp[`MEMOP_PA], addr);
	  end
	end

end
endtask


task chk_store_issue_to_pcx;
input [129:0] pcx_pkt;
reg [2:0] thid;
reg [204:0] tmp;
reg [20:0] inst;
reg [39:0] pcx_pa, inst_pa;
begin
	thid = pcx_pkt[`PCX_THR_ID];
	tmp = stb[{thid, iss_ptr[thid]}];
	inst = tmp[`LSU_MON_INST];
	pcx_pa = pcx_pkt[`PCX_ADDR];
	inst_pa = tmp[`MEMOP_PA];
	
	if (pcx_pkt[`PCX_RQTYP] == `PCX_STORE)
	begin
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
	end
	if (pcx_pkt[`PCX_INV])
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued to gasket with ND set.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
		

	if (~inst[`ST])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A store request made to gasket by LSU while the pending req is not store.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end

/* CONFIRM WITH MARK
	if (pcx_pa[39:0] != inst_pa[39:0])
	begin
			Disp_STB_entry(thid, iss_ptr[thid]);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A store request made to gasket by LSU while the pending req has PA %0h.", core_id, thid, pcx_pkt[`PCX_ADDR], tmp[`MEMOP_PA]);
	end
*/
//enhancement req 100146
	if ((tmp[`INST_ASI] == 8'h73) & (pcx_pa[39:0] != {8'h90, core_id, thid, tmp[`INST_ASI], 18'h0})) 
	begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> pcx_pa is not correct for asi write to interrupt vector dispatch register.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end

	if (inst[`BLKST] && ~pcx_pkt[`PCX_BST])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Bst bit is not set in the PCX pkt by LSU for a blk st request.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end

	if (tmp[`L2_ST_ISS])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store reissued on the PCX interface.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end
	else
	        tmp[`L2_ST_ISS] =  1'b1;
	
	if (tmp[`ST_SQUASH])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store issued on the PCX interface that has been squashed.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end
	
	if (tmp[`RMO])
	begin
	   if (~pcx_pkt[`PCX_BIS])
	   begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> BIS bit is not set in the PCX pkt by LSU for an RMO store.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	   end
	   if (tmp[`L2_ACK])
	   begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> L2ack bit is set when the RMO store is issued to PCX.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	   end
	   else
	   begin
		tmp[`L2_ACK] = 1'b1;
		ret_ptr[thid] = ret_ptr[thid] + 1;  //this will be deallocated before 
						    //response seen from stub
		st_rmo_cnt[thid] = st_rmo_cnt[thid]  + 1'b1;
	   end
	end
	stb[{thid, iss_ptr[thid]}] = tmp;

	iss_ptr[thid] = iss_ptr[thid] + 1;
	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> iss_ptr = %0d. ret_ptr = %0d, st_rmo_cnt = %0d", core_id, thid, iss_ptr[thid], ret_ptr[thid], st_rmo_cnt[thid]);
end
endtask

`ifdef INJ_STB_ERR_IN_CMP


reg [2:0] err_tid, stb_err_tid_d1, stb_err_tid_d2;
reg [2:0] err_index, stb_err_index_d1, stb_err_index_d2;
reg [204:0] err_tmp ;
reg [20:0] err_inst;
reg [44:0] cam_data;
reg [5:0] err_bit;
integer err_inj_cnt;
reg cmp_stb_err_inj;
reg stb_err_inj, stb_err_inj_d1, stb_err_inj_d2;
reg [1:0] err_priv, stb_err_priv_d1, stb_err_priv_d2;

initial
begin
	cmp_stb_err_inj = 1'b0;

	cam_data = 45'b0;
	err_bit = 11;
	err_inj_cnt = 0;
	stb_err_inj = 0;
	if (("cmp_stb_err_inj_on"))
		cmp_stb_err_inj = 1'b1;
	else
		cmp_stb_err_inj = 1'b0;
end

always @ (negedge (`SPC2.l2clk & enabled & cmp_stb_err_inj))
begin //{
     //valid stb ram rd for issue to pcx
     stb_err_inj = 1'b0;
     if (`SPC2.lsu.sbc.ram_rptr_vld_2 & `SPC2.lsu.sbc.st_pcx_rq_p3 & `SPC2.lsu.pic.pic_st_sel_p3)
     begin //{
	err_tid = decode_tid(`SPC2.lsu.sbc.st_rq_sel_p3[7:0]);
	err_index = `SPC2.lsu.sbc.ram_rptr_d1;
	err_tmp = stb[{err_tid, err_index}];
	err_inst = err_tmp[`LSU_MON_INST];
	cam_data = `SPC2.lsu.stb_cam.cam_array.stb_rdata[44:0];
	err_priv = err_tmp[`ST_PRIV];
	//if (err_inst[`SWAP] || err_inst[`CASA] || err_inst[`LDSTUB])
	if (err_inst[`CASA])
	begin //{
	   err_inj_cnt = err_inj_cnt + 1;
	   if (err_inj_cnt == 10)
	   begin //{
	     case (err_bit)
	       11, 12: err_bit = err_bit + 1;
	       13: err_bit = 44;
	       44: err_bit = 11;
	      endcase
	      err_inj_cnt = 0;
	      stb_err_inj = 1'b1;

	      force `SPC0.lsu.stb_cam.cam_array.stb_rdata[44:0] = cam_data ^ (1 << err_bit);
	      `PR_INFO("stb_err", 22, "<T%0h> <%0h> STB[%0h]: SBAPP forced for CASA. err_bit = %0h", err_tid, {cam_data[44:8], 3'b0}, err_index, err_bit);
	      #1;
	      release `SPC0.lsu.stb_cam.cam_array.stb_rdata[44:0];
	   end  //}
	end //}
     end  //}
     if (stb_err_inj_d2)
     begin
	if (~`SPC2.lsu_sbapp_err_g)
	begin
	            `PR_ERROR("lsu_mon", `ERROR, "<T%0h> sbapp err not asserted when err is injected for atomic.", stb_err_tid_d2);
	end
	else
	begin
		if ((`SPC2.lsu_stberr_tid_g != stb_err_tid_d2) || 
		    (`SPC2.lsu_stberr_index_g != stb_err_index_d2) || 
		    (`SPC2.lsu_stberr_priv_g != stb_err_priv_d2))
		begin
	            `PR_ERROR("lsu_mon", `ERROR, "<T%0h> sbapp err parameters mismatch.", stb_err_tid_d2);
		end
	end
    end
    else
    begin
	if (`SPC2.lsu_sbapp_err_g)
	begin
	            `PR_ERROR("lsu_mon", `ERROR, "<T%0h> sbapp err asserted when none expected.", `SPC2.lsu_stberr_tid_g);
	end
    end

end  //}

	
always @ (posedge (`SPC2.l2clk & enabled & cmp_stb_err_inj))
begin
	stb_err_inj_d1 <= stb_err_inj;
	stb_err_inj_d2 <= stb_err_inj_d1;
	stb_err_tid_d1 <= err_tid;
	stb_err_tid_d2 <= stb_err_tid_d1;
	stb_err_index_d1 <= err_index;
	stb_err_index_d2 <= stb_err_index_d1;
	stb_err_priv_d1 <= err_priv;
	stb_err_priv_d2 <= stb_err_priv_d1;
end

`endif
`endif
`endif
endmodule

`endif
`ifdef CORE_3

module lsu_mon_c3;
`ifndef GATESIM

// If vcs_build_args NO_MONITORS, then module will be empty
`ifndef NO_MONITORS

reg imm_asi_vld_e;
reg [7:0] asi_e, imm_asi_e, asi_m, asi_b;
reg dec_altspace_e, dec_altspace_b, dec_altspace_m;
reg [1:0] exu_ecc_b;
reg [1:0] exu_lsu_va_error_b;
reg [2:0] dec_lsu_tid_e, dec_lsu_tid_m, dec_lsu_tid_b, dec_lsu_tid_w;
reg [47:0] inst_pc_e, inst_pc_m, inst_pc_b, inst_pc_w;
reg [31:0] inst_e, inst_m, inst_b;
reg [47:0] vaddr_m, vaddr_b;
reg [63:0] int_st_data_m, int_st_data_b;
reg [63:0] fp_st_sata_fx2;
reg [20:0] lsu_inst_e, lsu_inst_m, lsu_inst_b;
reg mmu_dtlb_reload_d1, mmu_dtlb_reload_d2;

reg [7:0] ld_valid;
reg [7:0] tlb_valid;
reg [`LD_Pend_Width] ld_pend_array[7:0];
reg [`LAST_INST_Pend_Width] last_inst_array[7:0];
reg [2:0] wrptr[7:0];  //Pts. to the STB entry into which data will be written next
reg [2:0] rdptr[7:0];  //Tracks the dealloc signal from STB
reg [2:0] iss_ptr[7:0];	//keeps track of when a store is issued from the STB to PCX
reg [2:0] ret_ptr[7:0]; //keeps track of when the response is received from 
			//the L2c.
reg [63:0] stb_valid;
reg [`STB_Pend_Width] stb[63:0];
//reg [`TLB_MISS_Pend_Width] tlbmiss_pend_array[7:0];

reg [7:0] pf_cnt[7:0];
reg [7:0] dcache_inv_cnt[7:0];
reg [7:0] st_rmo_cnt[7:0];

reg [55:0] print_inst;

reg [31:0] dec_tg0_inst_d, dec_tg1_inst_d;

reg [7:0] lsu_bst_active;
reg store_alloc;
reg [3:0] bst_cnt;
reg [195:0] stb_alloc_data;
reg [195:0] bst_data, bst_inst_data;
reg [2:0] bst_active_thid;
reg bst_fgu_err;
				
reg [7:0] is_blkld;  //reqd by lsu_ras_chkr to chk errors on blk ld.
reg [1:0] l2_blk_ld_errtype[7:0]; //Gives the type of err the ahd be reported by LSU if 
				 //different types of err occur on blk ld helper returns
reg [1:0] st_priv[7:0]; //Gives the final priv level for an sbdiou/sbapp err that shd be 
			//stored in DFESR

wire [2:0] core_id = 3;

integer i;
integer err_cnt;

reg enabled;
reg reset_in_middle;
reg [7:0] finish_mask;

initial
begin
    enabled = 0;
    reset_in_middle = 0;
	ld_valid = 8'b0;
	lsu_inst_e = 0;
	tlb_valid = 8'b0;
	for (i = 0; i < 8; i = i+1)
	begin
		pf_cnt[i] = 0;
		dcache_inv_cnt[i] = 0;
		wrptr[i] = 0;
		rdptr[i] = 0;
		iss_ptr[i] = 0;
		ret_ptr[i] = 0;
		st_rmo_cnt[i] = 0;
		is_blkld[i] = 1'b0;
		st_priv[i] = 2'b0;
		l2_blk_ld_errtype[i] = 2'b0;
	end
	lsu_bst_active = 8'b0;
	store_alloc = 1'b0;
	bst_cnt = 4'b0;
	stb_valid = 64'b0;

    // avoid time zero ugliness. jp
    //@(posedge `SPC0.l2clk);
    //@(negedge `SPC0.l2clk);
    //if (`PARGS.lsu_mon_on) enabled = 1;

    case (core_id)
	3'h0: finish_mask = `PARGS.finish_mask[7:0];
	3'h1: finish_mask = `PARGS.finish_mask[15:8];
	3'h2: finish_mask = `PARGS.finish_mask[23:16];
	3'h3: finish_mask = `PARGS.finish_mask[31:24];
	3'h4: finish_mask = `PARGS.finish_mask[39:32];
	3'h5: finish_mask = `PARGS.finish_mask[47:40];
	3'h6: finish_mask = `PARGS.finish_mask[55:48];
	3'h7: finish_mask = `PARGS.finish_mask[63:56];
    endcase
end

always @ (`TOP.in_reset)
begin
	if (~`TOP.in_reset & `PARGS.lsu_mon_on & ~reset_in_middle)
	begin
		enabled = 1'b1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "Lsu_mon on, in_reset = 0.");
	end
		

	if (`TOP.in_reset & enabled)
	begin
		reset_in_middle = 1'b1;
		enabled = 1'b0;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "Reset asserted in the middle of the diag. Turned off Lsu_mon.");
	end
end

always @ (posedge (tb_top.sim_status[0] & enabled))
begin //{
	if (|(ld_valid[7:0] & finish_mask[7:0]))
	begin  //{
	   for (i = 0; i < 8; i=i+1)
	   begin
		if (ld_valid[i])  
		begin
		   DispPendReq(i);
	        end
	   end
	  `PR_ERROR("lsu_mon", `ERROR, "<C%h> Ld requests pending at the end of simulation. ld_valid = %0h", core_id, ld_valid);
	end  //}
	if (|stb_valid[63:0])
	begin  //{
	   err_cnt = 0;
	   for (i = 0; i < 64; i=i+1)
	   begin
		if (stb_valid[i] & finish_mask[i[5:3]])  
		begin
		//chkr resets the stb valid bits when block_store_kill is asserted.
		//in couple of failures block_store_kill was sampled asserted two cycles after
		//lsu asserted stb_empty. The simulation ended the cycle stb_empty was sampled high 
		//causing moniotr firings with valid entries in stb at end of simulation. Now
		//don't flag an error if squash bit is set and stb_valid is asserted at end
		//of simualation.
		      if (~is_squash_bit_set(i[5:0]))
		      begin
			err_cnt = err_cnt + 1;
			Disp_STB_entry(i[5:3],i[2:0]);
		      end
		end
	   end
	   if (err_cnt)
	   begin
	  	`PR_ERROR("lsu_mon", `ERROR, "<C%h> Store requests pending at the end of simulation. stb_valid = %0h", core_id, stb_valid);
	   end
       end  //}
       err_cnt = 0;
       for (i = 0; i < 8; i=i+1)
       begin  //{
	   if (finish_mask[i] & (pf_cnt[i] != 0))
	   begin
		err_cnt = 1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> Prefetches not finished. Pf_cnt = %0d", core_id, i, pf_cnt[i]);
	   end
	   if (finish_mask[i] & (dcache_inv_cnt[i] != 0))
	   begin
		err_cnt = 1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> D pkt not received for all invalidate reqs. issued by the thread. dcache_inv_cnt = %0d", core_id, i, dcache_inv_cnt[i]);
	   end
	   if (finish_mask[i] & (st_rmo_cnt[i] != 0))  
	   begin
		err_cnt = 1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> rmo_cnt not zero. rmo_cnt = %0d", core_id, i, st_rmo_cnt[i]);
	   end
       end  //}
       if (err_cnt)
       begin
	  `PR_ERROR("lsu_mon", `ERROR, "<C%h> Prefetch/D/RMO_stores requests pending at the end of simulation.", core_id);
       end
end //}

function is_squash_bit_set;
input [5:0] index;
reg [204:0] tmp;
begin
	tmp = stb[index];
	if (tmp[`ST_SQUASH])
		is_squash_bit_set = 1'b1;
	else
		is_squash_bit_set = 1'b0;
end
endfunction


always @ (negedge (`SPC3.l2clk & enabled))
begin //{

	asi_e  = `SPC3.lsu.dcc.dcc_asi_e[7:0];

	lsu_inst_e[`LD] <= `SPC3.dec_ld_inst_e;
	lsu_inst_e[`ST] <= `SPC3.dec_st_inst_e;
	lsu_inst_e[`FP] <= `SPC3.dec_fpldst_inst_e;
	lsu_inst_e[`PREF] <= `SPC3.dec_pref_inst_e;
	lsu_inst_e[`SWAP] <= `SPC3.dec_swap_inst_e;
	lsu_inst_e[`CASA] <= `SPC3.dec_casa_inst_e;
	lsu_inst_e[`LDSTUB] <= `SPC3.dec_ldstub_inst_e;
	lsu_inst_e[`FLUSH] <= `SPC3.dec_flush_inst_e;
	lsu_inst_e[`MEMBAR] <= `SPC3.dec_memstbar_inst_e;
	lsu_inst_e[`LDD] <= `SPC3.dec_ld_inst_e & `SPC3.dec_ldst_dbl_e & ~`SPC3.dec_fpldst_inst_e;
	lsu_inst_e[`STD] <= `SPC3.dec_st_inst_e & `SPC3.dec_ldst_dbl_e & ~`SPC3.lsu.dec_fpldst_inst_e;

       lsu_inst_e[`BLKLD] <= `SPC3.dec_ld_inst_e & `SPC3.dec_fpldst_inst_e & dec_altspace_e & Is_blk_asi(asi_e);
	lsu_inst_e[`BLKST] <= `SPC3.dec_st_inst_e & `SPC3.dec_fpldst_inst_e & dec_altspace_e & Is_blk_asi(asi_e);
	lsu_inst_e[`QLD] <= `SPC3.dec_ld_inst_e & dec_altspace_e & Is_qld_asi(asi_e);
	lsu_inst_e[`ASR_RD_WR] <= `SPC3.dec_sr_inst_e & (`SPC3.dec_ld_inst_e | `SPC3.dec_st_inst_e);
	lsu_inst_e[`PR_RD_WR] <= `SPC3.dec_pr_inst_e & (`SPC3.dec_ld_inst_e | `SPC3.dec_st_inst_e);
	lsu_inst_e[`HPR_RD_WR] <= `SPC3.dec_hpr_inst_e & (`SPC3.dec_ld_inst_e | `SPC3.dec_st_inst_e);
	lsu_inst_e[`FSR_RD_WR] <= `SPC3.dec_fsr_ldst_e & (`SPC3.dec_ld_inst_e | `SPC3.dec_st_inst_e);
end //}

always @ (posedge (`SPC3.l2clk & enabled))
begin //{
	dec_tg0_inst_d <= `SPC3.dec.ded0.decode_mux[31:0];
	dec_tg1_inst_d <= `SPC3.dec.ded1.decode_mux[31:0];
	imm_asi_vld_e <= `SPC3.lsu.dec_imm_asi_vld_d;

	imm_asi_e <= `SPC3.lsu.dec_imm_asi_d;
	dec_altspace_e <= `SPC3.dec_altspace_d;
	dec_altspace_m <= dec_altspace_e;
	dec_altspace_b <= dec_altspace_m;

	exu_ecc_b <= `SPC3.exu_ecc_m;
	exu_lsu_va_error_b <= `SPC3.exu_lsu_va_error_m;

	dec_lsu_tid_e <= `SPC3.dec_lsu_tg_d ? {1'b1, `SPC3.dec_lsu_tid1_d} : {1'b0, `SPC3.dec_lsu_tid0_d}; 	
	dec_lsu_tid_m <= dec_lsu_tid_e;
	dec_lsu_tid_b <= dec_lsu_tid_m;
	dec_lsu_tid_w <= dec_lsu_tid_b;
	
	inst_pc_e <= `SPC3.dec_lsu_tg_d ? {`SPC3.tlu.tlu_pc_1_d[47:2], 2'b0} : {`SPC3.tlu.tlu_pc_0_d[47:2], 2'b0};
	inst_pc_m <= inst_pc_e;
	inst_pc_b <= inst_pc_m;
	inst_pc_w <= inst_pc_b;
	
	inst_e <= `SPC3.dec_lsu_tg_d ? dec_tg1_inst_d : dec_tg0_inst_d;
	inst_m <= inst_e;
	inst_b <= inst_m;

	vaddr_m <= `SPC3.exu_lsu_address_e;
	vaddr_b <= vaddr_m;

	int_st_data_m <= `SPC3.exu_lsu_store_data_e;
	int_st_data_b <= int_st_data_m;
	fp_st_sata_fx2 <= `SPC3.fgu_lsu_fst_data_fx1;

	mmu_dtlb_reload_d1 <= `SPC3.mmu_dtlb_reload;
	mmu_dtlb_reload_d2 <= mmu_dtlb_reload_d1;

	//pcx_thid_d1 <=  `SPC3.lsu.spc_pcx_data_pa[`PCX_THR_ID];
	lsu_inst_m <= lsu_inst_e;
	lsu_inst_b <= lsu_inst_m;

	asi_m <= asi_e;
	asi_b <= asi_m;
end //}

function Is_blk_asi;
input [7:0] asi;
begin
	Is_blk_asi = (asi == `ASI_BLK_AIUP) | (asi == `ASI_BLK_AIUS) | 
		   (asi == `ASI_BLK_AIUPL) | (asi == `ASI_BLK_AIUSL) |
		   (asi == `ASI_BLK_P) | (asi == `ASI_BLK_S) |
		   (asi == `ASI_BLK_PL) | (asi == `ASI_BLK_SL) |
		   (asi == `ASI_BLK_COMMIT_P) | (asi == `ASI_BLK_COMMIT_S);
end
endfunction

function Is_qld_asi;
input [7:0] asi;
begin
 		Is_qld_asi = (asi == `ASI_AIU_BIS_QUAD_LDD_P) | (asi == `ASI_AIU_BIS_QUAD_LDD_S) |
		(asi == `ASI_AIU_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_AIU_BIS_QUAD_LDD_S_LITTLE) |
		(asi == `ASI_NUCLEUS_BIS_QUAD_LDD) | (asi == `ASI_NUCLEUS_BIS_QUAD_LDD_LITTLE) |
		(asi == `ASI_BIS_QUAD_LDD_P) | (asi == `ASI_BIS_QUAD_LDD_S) |
		(asi == `ASI_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_BIS_QUAD_LDD_S_LITTLE) |
		(asi == `ASI_QUAD_LDD) | (asi == `ASI_QUAD_LDD_REAL) |
		(asi == `ASI_QUAD_LDD_L) | (asi == `ASI_QUAD_LDD_REAL_L);
end
endfunction

function Is_bis_asi;
input [7:0] asi;
begin
 		Is_bis_asi = (asi == `ASI_AIU_BIS_QUAD_LDD_P) | (asi == `ASI_AIU_BIS_QUAD_LDD_S) |
		(asi == `ASI_AIU_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_AIU_BIS_QUAD_LDD_S_LITTLE) |
		(asi == `ASI_NUCLEUS_BIS_QUAD_LDD) | (asi == `ASI_NUCLEUS_BIS_QUAD_LDD_LITTLE) |
		(asi == `ASI_BIS_QUAD_LDD_P) | (asi == `ASI_BIS_QUAD_LDD_S) |
		(asi == `ASI_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_BIS_QUAD_LDD_S_LITTLE);
end
endfunction

always @ (negedge (`SPC3.l2clk & enabled))
begin //{
	Chk_store;
	store_alloc = 1'b0;
	if (lsu_inst_m != 0)
	begin
		if (`SPC3.dec_flush_lm)
		begin
			lsu_inst_m <= 0;
			`PR_INFO("lsu_mon", 21, "<C%0h> <T%0h> <%0h> M_stage: %s(VA=%0h) Flushed due to IFU Flush.", core_id, dec_lsu_tid_m, inst_pc_m, tb_top.intf0.xlate(inst_m),vaddr_m);
		end
	end
		
	if (lsu_inst_b != 0)
	begin //{
		if (lsu_inst_b[`BLKLD])  print_inst = " BLKLD,";
		else if (lsu_inst_b[`BLKST])  print_inst = " BLKST,";
		else if (lsu_inst_b[`QLD])  print_inst = " QLD,";
		else  print_inst = "";

		if (`SPC3.dec_flush_lb)
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%0h> <T%0h> <%0h> B_stage: %s(VA=%0h) Flushed due to IFU Flush.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		else if (`SPC3.tlu_flush_lsu_b)
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h) Flushed due to TLU Flush.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		//casa is a two cycle operation. If there is an err on the 2nd cycle of casa then also
		//casa shd be killed.
		//This function will also chk for errors on 2nd cycle.
		else if (Is_exu_error(exu_lsu_va_error_b, exu_ecc_b))  
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h <%0h> B_stage: %s(VA=%0h) Flushed due to EXU error.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		else if ((`SPC3.fgu_cecc_fx2 || `SPC3.fgu_uecc_fx2) && lsu_inst_b[`ST] && lsu_inst_b[`FP]) 
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h) Flushed due to FGU error.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		else if (IsExc(core_id)) 
			lsu_inst_b <= 0;
		else if (!`SPC3.lsu_tlb_miss_b_)
		begin
			`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h)%s ASI = %0h. DTLB miss.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, asi_b);
				//Insert_tlb_miss_info;
		end
		else 
		begin //{
		//Lsu doesn't assert lsu_sync for an exception or dtlb miss. Since for
		//an exception tlu anyway tells the front end to flush itself there is 
		//no reason for LSU to flush the front end then TLU to flush it again.
		//Lsu treats the dtlbmiss as an exception that it flushes the  inst and
		//handles it when it is reissued by the front end.

		   if (`SPC3.lsu_tlb_bypass_b)
		   begin
			if (`SPC3.lsu_sync != 8'b0)
			begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. LSU_sync. DTLB Bypass.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC3.lsu.tlb_pgnum[39:13], vaddr_b[12:0]},  asi_b);
			end
			else
			begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. DTLB Bypass.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC3.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b);
			end
		  end
	          else
		  begin
			if (`SPC3.lsu_sync != 8'b0)
			begin
			  if (lsu_inst_b[`ST])
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h, Store_data = %0h. LSU_sync. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC3.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b,int_st_data_b);
			  end
			  else
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. LSU_sync. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC3.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b);
			  end
			end
			else
			begin
			  if (lsu_inst_b[`ST])
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h, Store_data = %0h. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC3.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b, int_st_data_b);
			  end
			  else
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC3.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b);
		          end
		        end
		  end

	          if (lsu_inst_b[`LD] || lsu_inst_b[`PREF] || lsu_inst_b[`SWAP] || lsu_inst_b[`CASA] || lsu_inst_b[`LDSTUB])
		  begin //{
			if (((lsu_inst_b == 16'h1) || (lsu_inst_b == 16'h5)) & `SPC3.lsu.stb_cam_hit)
			begin
				`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h>: LSU_sync asserted due to STB RAW.", core_id, dec_lsu_tid_b, inst_pc_b);
			end
		  end //}

		  if (lsu_inst_b[`LD])
			Insert_ld_miss_info;

		  if (lsu_inst_b[`ST])  //for atomics both ld and store signals are asserted
		  begin
			Make_STB_data;
			store_alloc = 1'b1;
		  end
		  Insert_in_last_inst_array;

		if (`SPC3.lsu_trap_flush[7:0])
		begin
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h> Trap Flush asserted.", core_id, decode_tid(`SPC3.lsu_trap_flush[7:0]));
		end
	    end //}
	end //}
end //}

//STB ue testing:
//This is how we test squashing of stores by LSU_mon:
//Whenever lsu asserts err_sbdiou signal, the monitor sets the squash
//bit in the STB for the rest of the stores. If any of these squashed stores
//is issued on the asi ring or to the PCX interface the monitor complains.
//The squashed stores are deallocated when either a block_store_kill is
//asserted or dealloc signals are asserted by the LSU.
//When the block_store_kill is asserted, it tells the IFU to dealloc
//all the pending stores in the IFU. It means the when block_store_kill
//is asserted we have deallocated all the non-squashed requests from STB.
//The 0in_chkr ensures that LSU flags the correct index and priv with the
//the sbdiou signal to TLU.


always @ (negedge (`SPC3.l2clk & enabled))
begin
	if (`SPC3.lsu_l15_valid & `SPC3.lsu.spc_pcx_data_pa[129])
		Chk_pcx_req_pkt(`SPC3.lsu.spc_pcx_data_pa[129:0]);  //chk if we need .lsu here
	if ((`SPC3.lsu_rngl_cdbus[64:63] == 2'b11) & ~`SPC3.lsu_rngl_cdbus[59])
		Chk_st_on_ASI_ring(`LOCAL);

	if ((`SPC3.lsu_rngf_cdbus[64:63] == 2'b11) & ~`SPC3.lsu_rngf_cdbus[59])
		Chk_st_on_ASI_ring(`FAST);

	//if (`SPC3.l15_lsu_valid)
		//Chk_cpx_response_pkt({`SPC3.l15_lsu_valid, `SPC3.l15_lsu_cpkt[17:13],`SPC3.l15_lsu_cpkt[11:0],`SPC3.l15_spc_data1[127:0]});
	
	if (`SPC3.cpx_spc_data_cx[145])
		Chk_cpx_response_pkt(`SPC3.cpx_spc_data_cx);
	
	if (`SPC3.lsu_complete[7:0] != 8'b0)
	begin
		if (`SPC3.lsu_complete[0]) Chk_ld_complete(0);
		if (`SPC3.lsu_complete[1]) Chk_ld_complete(1);
		if (`SPC3.lsu_complete[2]) Chk_ld_complete(2);
		if (`SPC3.lsu_complete[3]) Chk_ld_complete(3);
		if (`SPC3.lsu_complete[4]) Chk_ld_complete(4);
		if (`SPC3.lsu_complete[5]) Chk_ld_complete(5);
		if (`SPC3.lsu_complete[6]) Chk_ld_complete(6);
		if (`SPC3.lsu_complete[7]) Chk_ld_complete(7);
	end
	
	if (`SPC3.lsu_block_store_kill[7:0] != 8'b0)
	begin
		if (`SPC3.lsu_block_store_kill[0]) Squash_STB(0);
		if (`SPC3.lsu_block_store_kill[1]) Squash_STB(1);
		if (`SPC3.lsu_block_store_kill[2]) Squash_STB(2);
		if (`SPC3.lsu_block_store_kill[3]) Squash_STB(3);
		if (`SPC3.lsu_block_store_kill[4]) Squash_STB(4);
		if (`SPC3.lsu_block_store_kill[5]) Squash_STB(5);
		if (`SPC3.lsu_block_store_kill[6]) Squash_STB(6);
		if (`SPC3.lsu_block_store_kill[7]) Squash_STB(7);
	end
	
	if (`SPC3.lsu_stb_dealloc[7:0] != 8'b0)
	begin
		if (`SPC3.lsu_stb_dealloc[0]) Dealloc_STB(0);
		if (`SPC3.lsu_stb_dealloc[1]) Dealloc_STB(1);
		if (`SPC3.lsu_stb_dealloc[2]) Dealloc_STB(2);
		if (`SPC3.lsu_stb_dealloc[3]) Dealloc_STB(3);
		if (`SPC3.lsu_stb_dealloc[4]) Dealloc_STB(4);
		if (`SPC3.lsu_stb_dealloc[5]) Dealloc_STB(5);
		if (`SPC3.lsu_stb_dealloc[6]) Dealloc_STB(6);
		if (`SPC3.lsu_stb_dealloc[7]) Dealloc_STB(7);
	end

	if (`SPC3.lsu_block_store_stall)
	      Chk_block_store;

	if (`SPC3.lsu.lsu_block_store_alloc[7:0] != 8'b0)
		Set_block_store_parameters;

	if (`SPC3.lsu_sbdiou_err_g || `SPC3.lsu_sbapp_err_g)
		Squash_store;

	if (`SPC3.lsu_stb_flush_g)
		st_priv[`SPC3.lsu_stberr_tid_g] = get_priv_on_flush(`SPC3.lsu_stberr_tid_g);
end

function [1:0] get_priv_on_flush;
input [2:0] tid;
reg [2:0] sq_index;
reg [204:0] tmp;

begin
	sq_index = `SPC3.lsu_stberr_index_g;
	tmp = stb[{tid, sq_index}];
	get_priv_on_flush = tmp[`ST_PRIV];
end
endfunction

task Chk_block_store;
reg [20:0] inst;
reg [2:0] thid;
begin
		thid = `SPC3.lsu_block_store_tid;
		bst_inst_data = stb[{thid, rdptr[thid]}];
		inst = bst_inst_data[`LSU_MON_INST];

		if (~inst[`BLKST])
		begin
			Disp_STB_entry(thid, iss_ptr[thid]);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted blk_store_stall while the req at the top of STB is not blkst as shown above", core_id, thid);
		end
end
endtask

//lsu can assert block_store_stall for a new block store while it has not yet written
//the 8 stb entries from the previous blk store.

task Set_block_store_parameters;
reg [2:0] thid;
begin
	
		thid = decode_tid(`SPC3.lsu.lsu_block_store_alloc[7:0]);
		if (lsu_bst_active[thid])
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted blk_store_alloc while the bst_active is already set for this thread.", core_id, thid);
		end
		else
		begin
			lsu_bst_active[thid] = 1'b1;
			bst_active_thid = thid;
			if (`SPC3.lsu.fgu_fst_ecc_error_fx2)
			    bst_fgu_err = 1'b1;
			else
			    bst_fgu_err = 1'b0;
		end
end
endtask

task Squash_store;
reg [2:0] thid;
reg [2:0] sq_index;
reg [2:0] i;
reg [204:0] tmp;
reg [3:0] squash_cnt;
reg [1:0] priv;

begin
	thid = `SPC3.lsu_stberr_tid_g;
	sq_index = `SPC3.lsu_stberr_index_g;
	priv = `SPC3.lsu_stberr_priv_g;
	tmp = stb[{thid, sq_index}];
	squash_cnt = 0;
     	`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Sbdiou/sbapp seen for index = %h and priv = %h.", core_id, thid, sq_index,  priv);

	st_priv[thid] = tmp[`ST_PRIV];

	//lsu can assert deallocate before it asserts the sbdiou signal. 
	//In that case iss_ptr won't be equal to sbdiou index.
	//if (sq_index != iss_ptr[thid])
	//begin
	//	Disp_STB_entry(thid, iss_ptr[thid]);
	//	`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted sbdiou/sbapp with index %0h while the next req to be issued is at index %0h.", core_id, thid, sq_index, iss_ptr[thid]);
	//end
	
	//If there is only one store in the store buffer which gets an sbdiou error, then LSU can deallocate
	//the store and then assert sbdiou. The deallocation will cause the stb issue_ptr to move 
	//forward to an inst. that has already been issued and completed and this chk can fire. So
	//removing this chk. 

        //if (tmp[`L2_ST_ISS])
        //begin
         //       Disp_STB_entry(thid, iss_ptr[thid]);
          //      `PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store reissued on the PCX interface.", core_id, thid, tmp[`MEMOP_PA]);
        //end

	if (iss_ptr[thid] == wrptr[thid])
	begin
	    if (stb_valid[{thid, wrptr[thid]}])
		squash_cnt = 8;
	    else
	    begin
	    //changing it to an info message because if there is only one valid entry in store buffer that
	    //gets an sbdiou then LSU can deallocate the entry and then issue sbdiou.
              	//`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Lsu asserted sbdiou/sbapp while there are no valid entries in STB to be issued.", core_id, thid);
              	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> sbdiou/sbapp squashed only one entry in STB.", core_id, thid);
	    end
	end
	else
	begin
	  if (iss_ptr[thid] < wrptr[thid])
		squash_cnt = wrptr[thid] - iss_ptr[thid];
	  else if (iss_ptr[thid] > wrptr[thid])
		squash_cnt = wrptr[thid] + (8 - iss_ptr[thid]);
	end
	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> SQUASH_STORE:iss_ptr = %0h, wrptr = %0h, squash_cnt = %0h.", core_id, thid, iss_ptr[thid], wrptr[thid], squash_cnt);

	i = iss_ptr[thid];
		
	while (squash_cnt)
	begin
		tmp = stb[{thid, i}];
		tmp[`ST_SQUASH] = 1'b1;
		if (priv < tmp[`ST_PRIV])
		begin
              		`PR_INFO("lsu_mon", `INFO, "<C%h> <T%0h> <PA = %0h> Sbdiou/sbapp signalled. Err in user/priv level store is squashing a higher priv level store.", core_id, thid, tmp[`MEMOP_PA]);
			priv = tmp[`ST_PRIV];
		end
			
		stb[{thid, i}] = tmp;
               	`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <PA = %0h> STB_entry[%0h] squashed.", core_id, thid, tmp[`MEMOP_PA], i);
	   	 
		 i = i + 1;
		 squash_cnt = squash_cnt - 1'b1;
	end
end
endtask

function [2:0] decode_tid;
input [7:0] thid_encode;
begin
	case (thid_encode)
	   8'h1: decode_tid = 3'b0;
	   8'h2: decode_tid = 3'h1;
	   8'h4: decode_tid = 3'h2;
	   8'h8: decode_tid = 3'h3;
	   8'h10: decode_tid = 3'h4;
	   8'h20: decode_tid = 3'h5;
	   8'h40: decode_tid = 3'h6;
	   8'h80: decode_tid = 3'h7;
	   default: 
	   begin
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> decode_tid. Incorrect value of thid input = %0h.", core_id, thid_encode, thid_encode);
	   end
	endcase
end
endfunction

task Chk_ld_complete;
input [2:0] thid;
reg [`LD_Pend_Width] tmp;
begin
	tmp = ld_pend_array[thid];

	if (ld_valid[thid])
	begin
		if ((tmp[`L2_ISS] != 4'hf) || (tmp[`L2_RESP] != 4'hf))
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted lsu_complete while the l2_iss and l2_resp bits are not F.", core_id, thid);
		end
		ld_valid[thid] = 1'b0;
		`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h> %s(VA=%0h) Complete. Setting ld_valid to 0.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
	end

	tmp = last_inst_array[thid];
	`PR_INFO("lsu_mon", 24, "<C%h> <T%0h> <%0h> %s(VA=%0h) Complete.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
end
endtask
	
task Chk_pcx_req_pkt;
input [129:0] pcx_pkt;
reg [2:0] thid;
reg [`LD_Pend_Width] tmp, tmp1; 
reg [15:0] inst; 
reg [11*8:0] req;
reg [39:0] addr;
begin 
	thid = pcx_pkt[`PCX_THR_ID]; 
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	req = DispPCXReq(pcx_pkt);
	addr = pcx_pkt[`PCX_ADDR];


	if (pcx_pkt[`PCX_CPU_ID] != core_id)
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> cpu_id (spc_pcx_data_pa[122:120]) = %h is not = %0h when the lsu made a %s req to gasket.", core_id, pcx_pkt[`PCX_THR_ID], addr, pcx_pkt[122:120], core_id, req);
	
	
	if ((pcx_pkt[`PCX_RQTYP] == `PCX_LOAD) || (pcx_pkt[`PCX_RQTYP] == `PCX_CAS1) || (pcx_pkt[`PCX_RQTYP] == `PCX_CAS2) || (pcx_pkt[`PCX_RQTYP] == `PCX_SWAP_LDSTUB))
	begin
	  if (~ld_valid[thid])
	  begin
		ld_valid[thid] = 1'b1;  //we have sent a req to gasket and are waiting for response
		`PR_INFO("lsu_mon", 22, "<C%0h> <T%0h> Setting ld_valid[%0h].", core_id, thid, thid);
	  end
		if (~inst[`BLKLD])
		begin
			if (tmp[`MEMOP_PA] != addr)
			begin
				if ((tmp[`INST_ASI] == 8'h41) || (tmp[`INST_ASI] == 8'h73) || ((tmp[`INST_ASI] == 8'h45) && ((tmp[`MEMOP_PA] == 8'h10) || (tmp[`MEMOP_PA] == 8'h18))))
				begin
					`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <PA = %0h> PA mismatch on gasket for %s request. Ignoring the mismatch as inst. is issued with asi 41, 73 or 45 (with VA 0x10 or 18).", core_id, thid, addr, req);
				end
				else
				begin
					DispPendReq(thid);
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A %s request made to gasket by LSU while the pending req is with PA %0h.", core_id, thid, addr, req, tmp[`MEMOP_PA]);
				end
			end
		end
	end

	case (pcx_pkt[`PCX_RQTYP])
	   `PCX_LOAD: 
	   begin
		if (pcx_pkt[`PCX_PF])
		begin
			if (~inst[`PREF])
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A prefetch request made to gasket by LSU which mismatches the pending request from the thread.", core_id, thid, addr);
			end
			if (pcx_pkt[`PCX_INV])
			begin
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: PREF_ICE(VA=%0h) Issued. pf_cnt not updated.", core_id, thid, tmp[`INST_VA], tmp[`MEMOP_VA]);
			end
			else
			begin
			 	pf_cnt[thid] = pf_cnt[thid] + 1'b1;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Issued. pf_cnt = %0d.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], pf_cnt[thid]);
			end
			tmp[`L2_ISS] = 4'hF;
			tmp[`L2_RESP] = 4'hF; //we don't wait for a prefetch response from gasket
			ld_pend_array[thid] = tmp;
		end
		else 
		begin
			if (pcx_pkt[`PCX_INV])
			begin
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Dcache invalidate pkt issued to CCX.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
				dcache_inv_cnt[thid] = dcache_inv_cnt[thid] + 1'b1;
			end
			else
			begin
				Chk_req_load(pcx_pkt);
			end
		end
	    end
           `PCX_CAS1, `PCX_CAS2:
	   begin
		if (~inst[`CASA])
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> CASA request made to gasket by LSU while no such request request is pending from this thread.", core_id, thid, addr);
		end
		if (pcx_pkt[`PCX_RQTYP] == `PCX_CAS1)
		begin
			tmp[`L2_ISS] = 4'hE;
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) (CAS1) Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			ld_pend_array[thid] = tmp;
		end
		if (pcx_pkt[`PCX_RQTYP] == `PCX_CAS2)
		begin
			tmp[`L2_ISS] = 4'hF;
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) (CAS2) Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			ld_pend_array[thid] = tmp;
			chk_store_issue_to_pcx(pcx_pkt);
		end
		
	   end
	   `PCX_SWAP_LDSTUB:
	   begin
		if (~inst[`SWAP] && ~inst[`LDSTUB])
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> %s request made to gasket by LSU while no such request request is pending from this thread.", core_id, thid, addr, req);
		end
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Issued to gasket. store_data = %0h", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], pcx_pkt[`PCX_DATA]);
		tmp[`L2_ISS] = 4'hF;
		ld_pend_array[thid] = tmp;
		
		chk_store_issue_to_pcx(pcx_pkt);
	   end

	    `PCX_STORE:
	    begin
		chk_store_issue_to_pcx(pcx_pkt);
	    end
	   
	   default: `PR_INFO("lsu_mon", 21, "<C%h> <T%0h> <%0h>: %s Issued to gasket.", core_id, thid, addr, req);
	endcase
end
endtask

task Chk_cpx_response_pkt;
input [145:0] cpx_pkt;
reg [2:0] thid;
begin
	thid = cpx_pkt[`CPX_THR_ID];	

	casex ({cpx_pkt[`CPX_RTNTYP], cpx_pkt[`CPX_ERR], cpx_pkt[`CPX_NC], cpx_pkt[`CPX_ATM], cpx_pkt[`CPX_PF]})
	  {4'b0, 2'bxx, 1'bx, 1'b0, 1'b0}:  
	  begin
		chk_ccx_ld_response(cpx_pkt);
	  end

	  {4'b0, 2'bxx, 1'b1, 1'b0, 1'b1}:  
	  begin
		if (pf_cnt[thid] == 8'b0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Prefetch response received from gasket while the pf_cnt is 0 for this thread.", core_id, thid);
		end
		else
		begin
			pf_cnt[thid] = pf_cnt[thid] - 1'b1;
			`PR_INFO("lsu_mon", 26, "<C%h> <T%0h> Prefetch response received. pfcnt = %0d.", core_id, thid, pf_cnt[thid]);
		end
	  end
	  
	  {4'h8, 2'bxx, 1'b1, 1'b0, 1'b0}:  
		chk_ccx_ld_response(cpx_pkt);

	  {4'h4, 2'bxx, 1'bx, 1'b0, 1'b0}:  
	   begin
	      if (cpx_pkt[123])  //D pkt
	      begin //{
		if (cpx_pkt[120:118] != core_id)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> D response received from gasket with core_id =%h.", core_id, thid, cpx_pkt[120:118]);
		end
		if (dcache_inv_cnt[thid] == 8'b0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> D response received from gasket while the Dcache_inv_cnt is 0 for this thread.", core_id, thid);
		end
		else
		begin
			dcache_inv_cnt[thid] = dcache_inv_cnt[thid] - 1'b1;
			`PR_INFO("lsu_mon", 26, "<C%h> <T%0h> D response received. Dcache_inv_cnt = %0d.", core_id, thid, dcache_inv_cnt[thid]);
		end
	     end  //}
	     else if (cpx_pkt[124])  //I pkt
	     begin
		if (cpx_pkt[120:118] != core_id)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> I response received from gasket with core_id =%h.", core_id, thid, cpx_pkt[120:118]);
		end
		//`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> I pkt.", core_id, thid);
	     end
	     else if (cpx_pkt[124:123] == 2'b0)
	     begin
		if (cpx_pkt[120:118] == core_id)
		begin
			chk_ccx_st_response(cpx_pkt);
	        end
		else
		begin
			`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Store Ack pkt received from core %0h.", core_id, thid, cpx_pkt[120:118]);
		end
	     end
	   end

	  {4'h1, 2'bxx, 1'bx, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> IFILL1 return.", core_id, thid);
	  {4'h1, 2'bxx, 1'bx, 1'b1, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> IFILL2 return.", core_id, thid);
	  {4'h9, 2'bxx, 1'b1, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> NCU IFILL return.", core_id, thid);
	  
	  {4'b0, 2'bxx, 1'b1, 1'b1, 1'b0}:  
	  begin
		chk_ccx_atm_response(cpx_pkt);
	  end
	  {4'h4, 2'bxx, 1'b1, 1'b1, 1'b0}:  
	  begin
		if ((cpx_pkt[`CPX_RTNTYP] == 4'h4) & (cpx_pkt[120:118] == core_id))
		begin
			chk_ccx_atm_response(cpx_pkt);
			chk_ccx_st_response(cpx_pkt);
		end
	  end
			
	  {4'h2, 2'bxx, 1'b1, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Stream Ld return.", core_id, thid);
	  {4'h6, 2'bxx, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Stream store Ack.", core_id, thid);
	  {4'h5, 2'bxx, 1'b1, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> MMU ld return.", core_id, thid);
	  {4'h7, 2'b00, 1'b0, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Interrupt return.", core_id, thid);
	  {4'h3, 2'b00, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Eviction Invalidation.", core_id, thid);
	  {4'hc, 2'bxx, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> L2 Indication.", core_id, thid);
	  
	  {4'hd, 2'bxx, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Soc Error Indication.", core_id, thid);
	   
	  default:
	  begin
		`PR_ALWAYS("lsu_mon", `ALWAYS, "CPX_PKT data.");
		`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%0h> <T%0h> rtn_typ = %0h, err_bits = %0h, nc=%0b, atm = %0b, pf = %0b",  core_id, cpx_pkt[`CPX_THR_ID], cpx_pkt[`CPX_RTNTYP], cpx_pkt[`CPX_ERR], cpx_pkt[`CPX_NC], cpx_pkt[`CPX_ATM], cpx_pkt[`CPX_PF]);

		`PR_ERROR("lsu_mon", `ERROR, "<C%0h> <T%0h> Can't recognise the CPX pkt.",  core_id, thid);
	  end

	endcase
end
endtask

task chk_ccx_ld_response;
input [145:0] cpx_pkt;
reg [2:0] thid;
reg [20:0] inst;
reg [39:0] cpx_pa, inst_pa;
reg [`LD_Pend_Width] tmp;
reg [3:0] pkt_type;
begin
	thid = cpx_pkt[`CPX_THR_ID];
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	inst_pa = tmp[`MEMOP_PA];
	pkt_type = cpx_pkt[`CPX_RTNTYP];

	   if (ld_valid[thid])
	   begin 
			`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) L2 response.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
		/* 
			if (inst_pa[39] != pkt_type[3])
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> ccx pkt_type = %h mismatches the ld_pa bit 39. ld_pa = %0h.", core_id, thid, pkt_type, inst_pa);
			end
		*/

			if (inst[`BLKLD])
			begin
				if (tmp[`L2_RESP] == 4'h0) 
				begin
					tmp[`L2_RESP] = 4'h1; 
					tmp[`L2_ERR0] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 1.", core_id, thid);
					end

				end
				else if (tmp[`L2_RESP] == 4'h1) 
				begin
					tmp[`L2_RESP] = 4'h3; 
					tmp[`L2_ERR1] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 2.", core_id, thid);
					end
				end
				else if (tmp[`L2_RESP] == 4'h3) 
				begin
					tmp[`L2_RESP] = 4'h7; 
					tmp[`L2_ERR2] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 3.", core_id, thid);
					end
				end
				else if (tmp[`L2_RESP] == 4'h7) 
				begin
					tmp[`L2_RESP] = 4'hF; 
					tmp[`L2_ERR3] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 4.", core_id, thid);
					end

					//is_blkld[thid] = 1'b1;
					if ((tmp[`L2_ERR0] == `ND) || (tmp[`L2_ERR1] == `ND) || (tmp[`L2_ERR2] == `ND) ||  (tmp[`L2_ERR3] == `ND))
						l2_blk_ld_errtype[thid] = `ND;
					else if ((tmp[`L2_ERR0] == `UE) || (tmp[`L2_ERR1] == `UE) || (tmp[`L2_ERR2] == `UE) ||  (tmp[`L2_ERR3] == `UE))
						l2_blk_ld_errtype[thid] = `UE;
					else if ((tmp[`L2_ERR0] == `CE) || (tmp[`L2_ERR1] == `CE) || (tmp[`L2_ERR2] == `CE) ||  (tmp[`L2_ERR3] == `CE))
						l2_blk_ld_errtype[thid] = `CE;
					else 
						l2_blk_ld_errtype[thid] = `NE;
				end
				else
				begin
					DispPendReq(thid);
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when response pkt received from ccx.", core_id, thid);
				end
			end
			else if (Is_single_pcx_req_ld(inst)) 
			begin
				//is_blkld[thid] = 1'b0;
				if (tmp[`L2_RESP] != 4'hE)
				begin
					DispPendReq(thid);
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when response pkt received from ccx.", core_id, thid);
				end
				//`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Setting L2_resp bits to F.", core_id, thid);
				tmp[`L2_RESP] = 4'hF;
			end
			else
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Load response received from gasket for thid %h while no load request pending from core for this thread.", core_id, thid, thid);
	     end
	     else
	     begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Load response received from gasket while no load request pending from core for this thread.", core_id, thid);
	     end

	ld_pend_array[thid] = tmp;
end
endtask

task chk_ccx_atm_response;
input [145:0] cpx_pkt;
reg [2:0] thid;
reg [20:0] inst;
reg [39:0] inst_pa;
reg [`LD_Pend_Width] tmp;
begin
	thid = cpx_pkt[`CPX_THR_ID];
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	inst_pa = tmp[`MEMOP_PA];

	if (~ld_valid[thid])
	begin
		if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ld response received from gasket while no request pending from core for this thread.", core_id, thid);
		end
		else
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ack response received from gasket while no request pending from core for this thread.", core_id, thid);
		end
	end
        else
   	begin 
		if (~inst[`SWAP] && ~inst[`CASA] && ~inst[`LDSTUB])
		begin
			DispPendReq(thid);
			if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
			begin
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ld response received from gasket which mismatches the request pending from this thread.", core_id, thid);
			end
			else
			begin
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ack response received from gasket which mismatches the request pending from this thread.", core_id, thid);
			end
		end
		else
		begin
		if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
		begin
			`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) Atomic ld response.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
		end
		else
		begin
			`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) Atomic ack.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
		end

		   if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
		   begin
			if (tmp[`L2_RESP] == 4'hC) tmp[`L2_RESP] = 4'hD; 
			else
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when atomic ld return pkt received from ccx.", core_id, thid);
			end
		  end
		  else
		  begin
			if (tmp[`L2_RESP] == 4'hD) tmp[`L2_RESP] = 4'hF; 
			else
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when atomic ack pkt received from ccx.", core_id, thid);
			end
		  end
		end
	end
	ld_pend_array[thid] = tmp;
end
endtask

task chk_ccx_st_response;
input [145:0] cpx_pkt;
reg [2:0] thid;
reg [20:0] inst;
reg [39:0] cpx_pa, inst_pa;
reg [204:0] tmp;
reg [3:0] pkt_type;
begin
	thid = cpx_pkt[`CPX_THR_ID];
	tmp = stb[{thid, ret_ptr[thid]}];
	inst = tmp[`LSU_MON_INST];
	inst_pa = tmp[`MEMOP_PA];
	pkt_type = cpx_pkt[`CPX_RTNTYP];


//is received. There could be some other store sitting in the STB at that time.

//Chk for squash bit only for non-bis responses.


	if (cpx_pkt[`CPX_BIS])  //response to rmo store
	begin
		if (st_rmo_cnt[thid] == 0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> L2 response received for an rmo store while the st_rmo_cnt for this thread is 0.", core_id, thid);
		end
		else
		begin
			st_rmo_cnt[thid] = st_rmo_cnt[thid] - 1'b1;
			`PR_INFO("lsu_mon", 25, "<C%0h> <T%0h> Store ack received for RMO store. rmo_cnt = %0d", core_id, thid, st_rmo_cnt[thid]);
		end
	end
	else
	begin
	   if (tmp[`ST_SQUASH])
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> L2 response received while the SQUASH bit is set in the STB entry %0h.", core_id, thid, ret_ptr[thid]);
	   
           if (~stb_valid[{thid, ret_ptr[thid]}])
           begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Store ack received while that entry is invalid in STB.", core_id, thid);
	   end
	   else
	   begin
	      if (~cpx_pkt[`CPX_ATM])  //don't print this message for atomic return
	      begin
		`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) STB[%0d] Store ack.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA], ret_ptr[thid]);
              end
	      tmp[`L2_ACK] = 1'b1;
	      stb[{thid, ret_ptr[thid]}] = tmp;
		ret_ptr[thid] = ret_ptr[thid] + 1'b1;
		//`PR_INFO("lsu_mon", 22, "<C%0h> <T%0h> ret_ptr = %0d.", core_id, thid, ret_ptr[thid]);
	   end
	end
end
endtask

task Chk_req_load;
input [129:0] pcx_pkt;
reg [2:0] thid;
reg [`LD_Pend_Width] tmp;
reg [39:0] pcx_pa, inst_pa;
reg [20:0] inst;
reg [11*8:0] req;
begin
	
	thid = pcx_pkt[`PCX_THR_ID];
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	pcx_pa = pcx_pkt[`PCX_ADDR];
	inst_pa = tmp[`MEMOP_PA];
	req = DispPCXReq(pcx_pkt);

	if (inst[`BLKLD])
	begin
		if (pcx_pa[39:6] != inst_pa[39:6])
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A load request made to gasket by LSU while the pending req has PA %0h.", core_id, thid, pcx_pa, tmp[`MEMOP_PA]);
		end
		if (pcx_pa[5:0] == 6'b0)
		begin
			if (tmp[`L2_ISS] != 4'h0 )
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 1st load request (pa[5:0] = 6'b0) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				tmp[`L2_ISS] = 4'h1;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 1st blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			end
				
		end
		if (pcx_pa[5:0] == 6'h10)
		begin
			if (tmp[`L2_ISS] != 4'h1)
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 2nd load request (pa[5:0] = 6'h10) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				tmp[`L2_ISS] = 4'h3;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 2nd blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			end
		end
		if (pcx_pa[5:0] == 6'h20)
		begin
			if (tmp[`L2_ISS] != 4'h3)
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 3rd load request (pa[5:0] = 6'h20) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				tmp[`L2_ISS] = 4'h7;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 3rd blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			end
		end
		if (pcx_pa[5:0] == 6'h30)
		begin
			if (tmp[`L2_ISS] != 4'h7)
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 4th load request (pa[5:0] = 6'h30) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 4th blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
				tmp[`L2_ISS] = 4'hF;
			end
		end
		ld_pend_array[thid] = tmp;
	end
	else if (Is_single_pcx_req_ld(inst)) 
	begin
	  if (tmp[`L2_ISS] == 4'hF)
	  begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Load request  made to gasket by LSU while this request has already been issued to gasket.", core_id, thid, pcx_pa);
	  end
	  else
	  begin
		tmp[`L2_ISS] = 4'hF;
		ld_pend_array[thid] = tmp;
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
	  end
	end
	else
	begin
		DispPendReq(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A load request made to gasket by LSU while there is no such ld request pending from this thread.", core_id, thid, pcx_pa);
	end
end
endtask

	
function Is_single_pcx_req_ld;
input [20:0] inst;
begin
	if (inst[`LDD] || inst[`QLD] || inst[`FSR_RD_WR] || (inst == 21'h1) || (inst == 21'h5))
		Is_single_pcx_req_ld = 1'b1;
	else
		Is_single_pcx_req_ld = 1'b0;
	//`PR_INFO("lsu_mon", 22, "<C%0h> Is_single_pcx_req_ld = %b. ", core_id, Is_single_pcx_req_ld);
end
endfunction
			          

function Is_trap;
input [2:0]tid;

begin
	Is_trap = 1'b0;
	case (`SPC3.lsu_trap_flush[7:0])
		8'h01: if (tid == 3'h0) Is_trap = 1'b1;
		8'h02: if (tid == 3'h1) Is_trap = 1'b1;
		8'h04: if (tid == 3'h2) Is_trap = 1'b1;
		8'h08: if (tid == 3'h3) Is_trap = 1'b1;
		8'h10: if (tid == 3'h4) Is_trap = 1'b1;
		8'h20: if (tid == 3'h5) Is_trap = 1'b1;
		8'h40: if (tid == 3'h6) Is_trap = 1'b1;
		8'h80: if (tid == 3'h7) Is_trap = 1'b1;
	endcase
end
endfunction

function [8*11:0] DispPCXReq;
input [129:0] pcx_pkt;
begin
	casex ({pcx_pkt[`PCX_RQTYP], pcx_pkt[`PCX_NC], pcx_pkt[`PCX_INV], pcx_pkt[`PCX_PF], pcx_pkt[`PCX_BIS]})
		{5'h0, 1'b1, 1'b0, 1'b1, 1'b0}: DispPCXReq = "PREF";
		{5'h0, 1'b1, 1'b1, 1'b1, 1'b0}: DispPCXReq = "PREF_ICE";
		{5'h0, 1'bx, 1'b0, 1'b0, 1'b0}: DispPCXReq = "LD";
		{5'h0, 1'bx, 1'b1, 1'b0, 1'b0}: DispPCXReq = "D";  
		{5'h10, 1'bx, 1'b0, 1'b0, 1'b0}: DispPCXReq = "I";
		{5'h10, 1'b0, 1'b1, 1'b0, 1'b0}: DispPCXReq = "I";
		{5'h1, 1'bX, 1'bX, 1'b0, 1'b0}: DispPCXReq = "ST";
		{5'h1, 1'bX, 1'bX, 1'b1, 1'b1}: DispPCXReq = "BLKST";
		{5'h1, 1'bX, 1'bX, 1'b0, 1'b1}: DispPCXReq = "BIS";
		{5'h2, 1'b1, 1'bX, 1'b0, 1'b0}: DispPCXReq = "CASA1";
		{5'h3, 1'b1, 1'bX, 1'b0, 1'b0}: DispPCXReq = "CASA2";
		{5'h7, 1'b1, 1'bX, 1'b0, 1'b0}: DispPCXReq = "SWAP_LDSTUB";
		{5'h4, 1'b1, 1'b0, 1'b0, 1'b0}: DispPCXReq = "STREAM_LD";
		{5'h5, 1'b1, 1'b0, 1'b0, 1'bx}: DispPCXReq = "STREAM_ST";
		{5'h8, 1'b1, 1'b0, 1'b0, 1'b0}: DispPCXReq = "MMU_LD";
		//{5'h9, 1'b0, 1'b0, 1'b0, 1'b0}: DispPCXReq = "INT";
		default:
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%0h> <T%0h> <%0h> Can't recognise the PCX pkt type. rq_type = %h, nc_bit = %0b, inv_bit = %0b, pf_bit = %0b, bis_bit = %0b. pcx_pkt[129:0] = %h",  core_id, pcx_pkt[`PCX_THR_ID], pcx_pkt[`PCX_ADDR], pcx_pkt[`PCX_RQTYP], pcx_pkt[`PCX_NC], pcx_pkt[`PCX_INV], pcx_pkt[`PCX_PF], pcx_pkt[`PCX_BIS], pcx_pkt);
			DispPCXReq = " ";
		end
	 endcase
end
endfunction

function IsExc;
input [2:0] core_id;
reg [21*8:0] DispExc;

begin
	DispExc = 170'b0;
	IsExc = 1'b0;

	if (`SPC3.lsu_align_b) DispExc = "Addr_not_aligned";
	if (`SPC3.lsu_lddf_align_b) DispExc = "LDDF_Addr_not_aligned";
	if (`SPC3.lsu_stdf_align_b) DispExc = "STDF_Addr_not_aligned";
	if (`SPC3.lsu_priv_action_b) DispExc = "Priv_actio";
	if (`SPC3.lsu_va_watchpoint_b) DispExc = "VA_watchpoint";
	if (`SPC3.lsu_pa_watchpoint_b) DispExc = "PA_watchpoint";
	//if (`SPC3.lsu_tlb_miss_b_) DispExc = "Tlb_miss";
	if (`SPC3.lsu_illegal_inst_b) DispExc = "Illegal_inst";
	if (`SPC3.lsu_daccess_prot_b) DispExc = "Data_access_prot_exc";
	if (`SPC3.lsu_dae_invalid_asi_b) DispExc = "Dae_Invalid_asi";
	if (`SPC3.lsu_dae_nc_page_b) DispExc = "Dae_nc_page";
	if (`SPC3.lsu_dae_nfo_page_b) DispExc = "Dae_NFO_page";
	if (`SPC3.lsu_dae_priv_viol_b) DispExc = "Dae_Priv_viol";
	if (`SPC3.lsu_dae_so_page) DispExc = "Dae_so_page";
	//if (`SPC3.lsu_perfmon_trap_b) DispExc = "Perf_mon_trap";
	if (`SPC3.lsu_dtmh_err_b) DispExc = "DTLB_data_par_err";
	if (`SPC3.lsu_dttp_err_b) DispExc = "DTLB_tag_par_err";
	if (`SPC3.lsu_dtdp_err_b) DispExc = "DTLB_data_par_err";

	
	if (DispExc != 0)
	begin
		IsExc = 1'b1;
		`PR_INFO("lsu_mon", 23, "<C%0h> <T%0h> <%0h> B_stage: %s(VA=%0h) ASI = %0h. %s Exception.",core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, asi_b, DispExc);
	end

end
endfunction

function Is_exu_error;
input [1:0] exu_lsu_va_error_b;     // VA error requiring a flush
input [1:0] exu_ecc_b;              // ECC error requiring a flush
reg err_b;
reg err_m;

begin
	err_b = dec_lsu_tid_b[2] ? (exu_ecc_b[1] | (exu_lsu_va_error_b[1] & ~`SPC3.lsu_tlb_bypass_b)):
				(exu_ecc_b[0] | (exu_lsu_va_error_b[0] & ~`SPC3.lsu_tlb_bypass_b));

	err_m = (dec_lsu_tid_b[2] ? `SPC3.exu_ecc_m[1] : `SPC3.exu_ecc_m[0]) & `SPC3.lsu.dcc.twocycle_b;
					
	Is_exu_error = err_b | err_m;
end
endfunction

/*
task Insert_tlb_miss_info;
reg [127:0] tmp;
begin
	tmp =  128'b0;
	if (tlb_valid[dec_lsu_tid_b])
	begin
		tmp = tlbmiss_pend_array[dec_lsu_tid_b];
		Disp_tlbmiss_pend_array_entry(dec_lsu_tid_b);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h>) A new tlb miss request received while there is already a Tlb miss request pending from this thread as shown above.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
	end
	else
	begin
		tlb_valid[dec_lsu_tid_b] <= 1'b1;
		tmp[`INST_VA] = inst_pc_b;
		tmp[`MEMOP_VA] = vaddr_b;
		tmp[`INST] = inst_b;
	end
	tlbmiss_pend_array[dec_lsu_tid_b] = tmp;
end
endtask

*/

//problem with the signal.
/*
always @ (negedge `SPC3.l2clk)
begin
	if (mmu_dtlb_reload_d2)
		Chk_dtlb_reload;
end

task Chk_dtlb_reload;
reg [2:0] thid;
reg [127:0] tmp;
begin
		if (`SPC3.tlu_trap_pc_0_valid)
			thid = {1'b0, `SPC3.tlu_trap_0_tid};
		else if (`SPC3.tlu_trap_pc_1_valid)
			thid = {1'b0, `SPC3.tlu_trap_1_tid};
		else 
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> mmu_dtlb_reload asserted but trap_pc_0_valid and trap_pc_1_valid are both 0", core_id);

		if (~tlb_valid[thid])
			`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> mmu_dtlb_reload asserted while tlb_valid is 0.", core_id, thid);
		else
		begin
			tmp = tlbmiss_pend_array[dec_lsu_tid_b];
			`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> %s(VA=%0h> DTLB reloaded for VA = %0h.", core_id, thid, tb_top.intf0.xlate(tmp[`INST]), tmp[`INST_VA], tmp[`MEMOP_VA] );
			tlb_valid[thid] = 1'b0;
		end
end
endtask
*/

task Insert_ld_miss_info;
reg [`LD_Pend_Width] tmp;
begin
	tmp = 213'b0;
	if (ld_valid[dec_lsu_tid_b])
	begin
		tmp =  ld_pend_array[dec_lsu_tid_b];
		DispPendReq(dec_lsu_tid_b);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h>) A new request received while there is already a request pending from this thread as shown above.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
	end
	else
	begin
		//ld_valid[dec_lsu_tid_b] <= 1'b1;
		tmp[`INST_VA] = inst_pc_b;
		tmp[`MEMOP_VA] = vaddr_b;
		tmp[`MEMOP_PA] = {`SPC3.lsu.tlb_pgnum[39:13], vaddr_b[12:0]};
		tmp[`INST_ASI] = asi_b;

		if (lsu_inst_b[`BLKLD])
		begin
			tmp[`L2_ISS] =  4'h0;
			tmp[`L2_RESP] =  4'h0;
			is_blkld[dec_lsu_tid_b] = 1'b1;
		end
		else
		begin
		   is_blkld[dec_lsu_tid_b] = 1'b0;
		   if (lsu_inst_b[`CASA])
			tmp[`L2_ISS] =  4'hC;
		   else
			tmp[`L2_ISS] =  4'hE;
		   if (lsu_inst_b[`SWAP] || lsu_inst_b[`LDSTUB] || lsu_inst_b[`CASA])
			tmp[`L2_RESP] =  4'hC;
		   else
			tmp[`L2_RESP] =  4'hE;

		end

		tmp[`INST] = inst_b;
		tmp[`LSU_MON_INST] = lsu_inst_b; 
		ld_pend_array[dec_lsu_tid_b] = tmp;
	end
end
endtask


task Insert_in_last_inst_array;
reg [135:0] tmp;
begin
	tmp = 128'b0;
	tmp[`INST_VA] = inst_pc_b;
	tmp[`MEMOP_VA] = vaddr_b;
	tmp[`INST] = inst_b;
	tmp[135:128] = asi_b;
	last_inst_array[dec_lsu_tid_b] = tmp;
end
endtask


task DispPendReq;
input [2:0] thid;
reg [`LD_Pend_Width] tmp;
begin
	
	tmp =  ld_pend_array[thid];
	`PR_ALWAYS("lsu_mon", `ALWAYS, "LD_PEND_ARRAY[%0h] Data.", thid);
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> <%0h> %s(VA=%0h). PA = %0h. L2_ISS = %0h. L2_RESP = %0h, LSU_MON_INST=%h.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA], tmp[`MEMOP_PA], tmp[`L2_ISS], tmp[`L2_RESP], tmp[`LSU_MON_INST]);
end
endtask

task Disp_STB_entry;
input [2:0] thid;
input [2:0] ptr;
reg [204:0] tmp;
begin
	
	tmp =  stb[{thid, ptr}];
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> STB[%0h] data.", core_id, thid, ptr);
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> <%0h> %s(VA=%0h). PA = %0h. L2_ISS = %0h. L2_ACK = %0h, LSU_MON_INST=%h. RMO = %0b", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA], tmp[`MEMOP_PA], tmp[`L2_ST_ISS], tmp[`L2_ACK], tmp[`LSU_MON_INST], tmp[`RMO]);
end
endtask

/*
		
task Disp_tlbmiss_pend_array_entry;
input [2:0] thid;
reg [127:0] tmp;
begin
	tmp = tlbmiss_pend_array[thid];
	`PR_INFO("lsu_mon", 23, "TLB_MISS_PEND_ARRAY[%0h] Data.", thid);
	`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h> %s(VA=%0h).", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);

end
endtask

*/
task Disp_CPX_pkt;
input [145:0] cpx_pkt;
begin
	`PR_ALWAYS("lsu_mon", `ALWAYS, "CPX_PKT data.");
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%0h> <T%0h> rtn_typ = %0h, err_bits = %0h, nc=%0b, atm = %0b, pf = %0b",  core_id, cpx_pkt[`CPX_THR_ID], cpx_pkt[`CPX_RTNTYP], cpx_pkt[`CPX_ERR], cpx_pkt[`CPX_NC], cpx_pkt[`CPX_ATM], cpx_pkt[`CPX_PF]);
end
endtask
	

task Make_STB_data;
reg [204:0] tmp;
begin
		tmp = 0;
		tmp[`INST_VA] = inst_pc_b;
		tmp[`MEMOP_VA] = vaddr_b;
		tmp[`MEMOP_PA] = {`SPC3.lsu.tlb_pgnum[39:13], vaddr_b[12:0]};
		tmp[`L2_ST_ISS] =  1'b0;
		tmp[`ASI_ST_ISS] =  1'b0;
		tmp[`L2_ACK] =  1'b0;
		tmp[`INST] = inst_b;
		tmp[`LSU_MON_INST] = lsu_inst_b;
		tmp[`ST_SQUASH] = 1'b0;
		tmp[`INST_ASI] = asi_b;
		if (`SPC3.lsu.tlu_lsu_hpstate_hpriv[dec_lsu_tid_b])
		   tmp[`ST_PRIV] = `HPRIV; 
		else if (`SPC3.lsu.tlu_lsu_pstate_priv[dec_lsu_tid_b])
		   tmp[`ST_PRIV] = `PRIV; 
		else
		   tmp[`ST_PRIV] = `USER; 
		//bis_asi to io space is not rmo

		tmp[`RMO] = lsu_inst_b[`BLKST] | (dec_altspace_b & Is_bis_asi(asi_b) & ~`SPC3.lsu.tlb_pgnum[39]);
		stb_alloc_data <= tmp;
end
endtask

task Insert_in_STB;
input [195:0] store_data;
input [2:0] thid;
begin
	if (stb_full(thid))
	begin
		//DispSTB(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> STB full and a new store received for insertion in STB.", core_id, thid);
	end
	else
	begin
		stb[{thid, wrptr[thid]}] = store_data;
		//Disp_STB_entry(thid, wrptr[thid]);
		`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h> %s(VA=%0h). STB[%0h] Inserted.", core_id, thid, store_data[`INST_VA], tb_top.intf0.xlate(store_data[`INST]), store_data[`MEMOP_VA], wrptr[thid]);
		stb_valid[{thid, wrptr[thid]}] = 1'b1;
		wrptr[thid] = wrptr[thid] + 1'b1;
		//`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> wrptr = %0d.", core_id, thid, wrptr[thid]);
	end
end
endtask

function stb_full;
input [2:0] thid;
begin
	if ((wrptr[thid] == rdptr[thid]) && stb_valid[{thid, wrptr[thid]}])
		stb_full = 1'b1;
	else
		stb_full = 1'b0;
end
endfunction
	

task Dealloc_STB;
input [2:0] thid;
reg [204:0] tmp;
reg [20:0] lsu_inst;
begin
	//thid = decode_tid(`SPC3.lsu_stb_dealloc);
	tmp = stb[{thid, rdptr[thid]}];
	lsu_inst = tmp[`LSU_MON_INST];
	if (~stb_valid[{thid, rdptr[thid]}])
	begin
		//DispSTB(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_dealloc = %0h asserted while the stb entry is invalid for that thid.", core_id, thid, `SPC3.lsu_stb_dealloc);
	end
	if (tmp[`L2_ST_ISS]) 
	begin
	    if (~tmp[`L2_ACK])
	    begin
		Disp_STB_entry(thid, rdptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_dealloc = %0h asserted when we haven't received the response from the gasket.", core_id, thid, `SPC3.lsu_stb_dealloc);
	    end
	end
	else if (tmp[`ASI_ST_ISS])
	begin
		ret_ptr[thid] = ret_ptr[thid] + 1'b1;
	end
	//blkst inst. is not issued anywhere, blkst helpers are issued.
	//in case of bis stores, lsu issues the dealloc in P3, i.e when the req is issued to PCX.
	//IF it is bis to cp sapce and there is an err then the store is issued to PCX with nd set
	// and deallocated.
	//However for ue onbis to IO space, dealloc is sent to IFU, issued on PCX with valid bit 0.
	//The sbdiou signal is sent in next cycle. We need to take bis io stores in this equation.
	else if (tmp[`ST_SQUASH] || lsu_inst[`BLKST] || (tmp[`RMO] & ~lsu_inst[`BLKST] & ~`SPC0.lsu.sbc.kill_store_p4_)) 
	begin
		iss_ptr[thid] = iss_ptr[thid] + 1'b1;
		ret_ptr[thid] = ret_ptr[thid] + 1'b1;
	end
	else 
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_dealloc = %0h asserted which is not issued to asi ring, or PCX or is not squashed.", core_id, thid, `SPC3.lsu_stb_dealloc);

	`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h>: %s(VA=%0h) PA = %0h. STB[%0d] Deallocated.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], tmp[`MEMOP_PA], rdptr[thid]);
	stb_valid[{thid, rdptr[thid]}] = 1'b0;
	rdptr[thid] = rdptr[thid] + 1'b1;
	//`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> rd_ptr = %0d.", core_id, thid, rdptr[thid]);
	/*
	if (tmp[`RMO])
		st_rmo_cnt[thid] = st_rmo_cnt[thid]  + 1'b1;
	*/
end
endtask

task Squash_STB;
input [2:0] thid;
reg [204:0] tmp;
reg [3:0] squash_cnt;
reg [2:0] i;
begin
	squash_cnt = 4'b0;
        if (ret_ptr[thid] != iss_ptr[thid])
	       `PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> lsu_block_store_kill asserted while the ret_ptr = %0h  != iss_ptr = %0h.", core_id, thid, tmp[`MEMOP_PA], ret_ptr[thid], iss_ptr[thid]);
        if (rdptr[thid] != iss_ptr[thid])
	       `PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> lsu_block_store_kill asserted while the rdptr = %0h  != iss_ptr = %0h.", core_id, thid, tmp[`MEMOP_PA], rdptr[thid], iss_ptr[thid]);

	if (iss_ptr[thid] == wrptr[thid])
	begin
	    if (stb_valid[{thid, wrptr[thid]}])
		squash_cnt = 8;
/* Lsu can assert both dealloc and block_store_kill for a request.
 *
	    else
	    begin
              	`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Lsu asserted block_store_kill while there are no valid entries in STB to be deallocated.", core_id, thid);
	    end
*/
	end
	else
	begin
	  if (iss_ptr[thid] < wrptr[thid])
		squash_cnt = wrptr[thid] - iss_ptr[thid];
	  else if (iss_ptr[thid] > wrptr[thid])
		squash_cnt = wrptr[thid] + (8 - iss_ptr[thid]);
	end

	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> SQUASH_STB:iss_ptr = %0h, wrptr = %0h, squash_cnt = %0h.", core_id, thid, iss_ptr[thid], wrptr[thid], squash_cnt);

	i = iss_ptr[thid];
       
       `PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Block store kill changed issue_ptr:%0h->%0h. ret_ptr: %0h->%0h. rdptr:%0h->%0h.", core_id, thid, iss_ptr[thid], iss_ptr[thid]+squash_cnt, ret_ptr[thid], ret_ptr[thid]+squash_cnt, rdptr[thid], rdptr[thid]+squash_cnt);

   	ret_ptr[thid] = ret_ptr[thid] + squash_cnt;
	rdptr[thid] = rdptr[thid] + squash_cnt;
        iss_ptr[thid] = iss_ptr[thid] + squash_cnt;
		
	while (squash_cnt)
	begin
	    tmp = stb[{thid, i}];
	    if (~stb_valid[{thid, i}])
	    begin
		//DispSTB(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h><PA = %0h> lsu_block_store_kill asserted while the stb entry %0h is invalid.", core_id, thid, tmp[`MEMOP_PA], i);
	    end
	    if (tmp[`L2_ST_ISS]) 
	    begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h>st_issue bit is set when the block_store_kill is asserted for stb entry %0h.", core_id, thid, tmp[`MEMOP_PA], i);
	    end
	    //commenting out the chk below. Lsu can assert sbdiou and then in the next cycle insert a new entry into
	    //stb. LSU will squash this new entry and won't issue it to PCX/asi but its squash bit won't be 
	    //set in the chkr which was causin it to fire. 
	    //if (~tmp[`ST_SQUASH]) 
	    //begin
	       //`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> lsu_block_store_kill asserted while the squash bit is 0 in the STB entry %0h.", core_id, thid, tmp[`MEMOP_PA], i);
	    //end
	    stb_valid[{thid, i}] = 1'b0; 

	    i = i + 1;
	    squash_cnt = squash_cnt - 1'b1;
	end

end
endtask

task Chk_store;
reg [2:0] thid;
reg [47:0] addr;
reg [3:0] i;
reg [204:0] tmp;
begin
	if ((bst_cnt > 0) && (`SPC3.lsu_stb_alloc == 8'b0))
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Blk store entries are not allocated back to back in STB.", core_id, bst_active_thid);

//For bst the stb is still written even though we have errors.
//Stb is written in W stage. Howvere for first blk store helper
//the err will be flagged by FGU in b stage. We can miss the
// err signal if we don't sample in B.
//for the last helper err will be signalled in B stage of last helper and at

	if (lsu_bst_active[bst_active_thid] & `SPC0.fgu_fst_ecc_error_fx2 & (bst_cnt < 7))
             bst_fgu_err = 1'b1;

	if (`SPC3.lsu_stb_alloc[7:0] != 8'b0)
	begin
		thid = decode_tid(`SPC3.lsu_stb_alloc[7:0]);
		if (store_alloc)
		begin
			if (thid != dec_lsu_tid_w)
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_alloc = %0h mismatches the thid %0h.", core_id, dec_lsu_tid_w, `SPC3.lsu_stb_alloc[7:0], dec_lsu_tid_w);
			Insert_in_STB(stb_alloc_data, dec_lsu_tid_w);
		end
		else 
		begin
		    if (lsu_bst_active[thid])
		    begin
			   if (bst_cnt == 0)
			   begin
				bst_data = bst_inst_data;
			   end
		           else
			   begin
				if (thid != bst_active_thid)
				begin
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_alloc = %0h mismatches the active blkstore thid = %0h.", core_id, bst_active_thid, `SPC3.lsu_stb_alloc[7:0], bst_active_thid);
				end

				addr = bst_data[`MEMOP_VA];

				bst_data[`MEMOP_VA] = {addr[47:6], bst_cnt[2:0], 3'b0};
				addr = bst_data[`MEMOP_PA];
				bst_data[`MEMOP_PA] = {addr[39:6], bst_cnt[2:0], 3'b0};
			   end
                                bst_cnt = bst_cnt + 1;
                                Insert_in_STB(bst_data, bst_active_thid);
                                if (bst_cnt == 8)
                                begin
                                        bst_cnt = 0;
                                        lsu_bst_active[thid] = 1'b0;
                                        if (bst_fgu_err) //set the squash bit to 0 for all the stb entries
                                        begin
                                          for (i = 0; i < 8; i=i+1)
                                          begin
                                             tmp = stb[{thid, i[2:0]}];
					     if (tmp[`ST_SQUASH])
						`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Squash bit already set when trying to set it for a bst fgu errerr.", core_id, thid, tmp[`MEMOP_PA]);
					     tmp[`ST_SQUASH] = 1'b1;
                                             stb[{thid, i[2:0]}] = tmp; 
                                             `PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <PA = %0h> STB_entry[%0h] squashed due to FGU err.", core_id, thid, tmp[`MEMOP_PA], i);
                                          end
                                        end
					bst_fgu_err = 1'b0;
                                end
			end
			else
				`PR_ERROR("lsu_mon", `ERROR, "<C%h>: LSU asserted lsu_stb_alloc  = %0h while no store pending to be written in STB.", core_id, `SPC3.lsu_stb_alloc[7:0]);
				
		end
	end
	else
	begin
		if (store_alloc)
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h> W_stage: LSU did not assert lsu_stb_alloc for the store.", core_id, dec_lsu_tid_w, inst_pc_w);
	end
end
endtask

task Chk_st_on_ASI_ring;
input ring;
reg [2:0] thid;
reg [7:0] asi;
reg [47:0] addr, act_addr;
reg [1:0] req_type;
reg [204:0] tmp;

begin
	if (ring == `LOCAL)
		thid =`SPC3.lsu_rngl_cdbus[58:56];
	else
		thid =`SPC3.lsu_rngf_cdbus[58:56];
	
	if (ring == `LOCAL)
		asi =`SPC3.lsu_rngl_cdbus[55:48];
	else
		asi =`SPC3.lsu_rngf_cdbus[55:48];
	
	if (ring == `LOCAL)
		addr =`SPC3.lsu_rngl_cdbus[47:0];
	else
		addr =`SPC3.lsu_rngf_cdbus[47:0];
	
	if (ring == `LOCAL)
		req_type =`SPC3.lsu_rngl_cdbus[61:60];
	else
		req_type =`SPC3.lsu_rngf_cdbus[61:60];
	

	tmp = stb[{thid, iss_ptr[thid]}];
	if (tmp[`ASI_ST_ISS])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store reissued on the ASI interface.", core_id, thid, addr);
	end
	
	if (tmp[`ST_SQUASH])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store issued on the ASI interface that has been squashed.", core_id, thid, addr);
	end

	act_addr  = tmp[`MEMOP_PA];
	act_addr = {act_addr[39:3], 3'b0};

	//47 is D tag rd asi. LSU issues that on the ring but changes 
	//the address.
	if ((addr == act_addr) || (asi == 8'h47) || (asi == 8'h46))  
	begin
		tmp[`ASI_ST_ISS] = 1'b1;
		stb[{thid, iss_ptr[thid]}] = tmp;
		if (ring == `LOCAL)
		begin
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued on local ring.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
		end
		else
		begin
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued on fast ring.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
		end
		iss_ptr[thid] = iss_ptr[thid] + 1'b1;
	end
	else
	begin
	   if (ring == `LOCAL)
	   begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] PA mismatch for asi req on local ring. Expected PA = %0h, actual PA = %0h", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid], tmp[`MEMOP_PA], addr);
	   end
	   else
	   begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] PA mismatch for asi req on fast ring. Expected PA = %0h, actual PA = %0h", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid], tmp[`MEMOP_PA], addr);
	  end
	end

end
endtask


task chk_store_issue_to_pcx;
input [129:0] pcx_pkt;
reg [2:0] thid;
reg [204:0] tmp;
reg [20:0] inst;
reg [39:0] pcx_pa, inst_pa;
begin
	thid = pcx_pkt[`PCX_THR_ID];
	tmp = stb[{thid, iss_ptr[thid]}];
	inst = tmp[`LSU_MON_INST];
	pcx_pa = pcx_pkt[`PCX_ADDR];
	inst_pa = tmp[`MEMOP_PA];
	
	if (pcx_pkt[`PCX_RQTYP] == `PCX_STORE)
	begin
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
	end
	if (pcx_pkt[`PCX_INV])
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued to gasket with ND set.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
		

	if (~inst[`ST])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A store request made to gasket by LSU while the pending req is not store.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end

/* CONFIRM WITH MARK
	if (pcx_pa[39:0] != inst_pa[39:0])
	begin
			Disp_STB_entry(thid, iss_ptr[thid]);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A store request made to gasket by LSU while the pending req has PA %0h.", core_id, thid, pcx_pkt[`PCX_ADDR], tmp[`MEMOP_PA]);
	end
*/
//enhancement req 100146
	if ((tmp[`INST_ASI] == 8'h73) & (pcx_pa[39:0] != {8'h90, core_id, thid, tmp[`INST_ASI], 18'h0})) 
	begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> pcx_pa is not correct for asi write to interrupt vector dispatch register.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end

	if (inst[`BLKST] && ~pcx_pkt[`PCX_BST])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Bst bit is not set in the PCX pkt by LSU for a blk st request.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end

	if (tmp[`L2_ST_ISS])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store reissued on the PCX interface.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end
	else
	        tmp[`L2_ST_ISS] =  1'b1;
	
	if (tmp[`ST_SQUASH])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store issued on the PCX interface that has been squashed.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end
	
	if (tmp[`RMO])
	begin
	   if (~pcx_pkt[`PCX_BIS])
	   begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> BIS bit is not set in the PCX pkt by LSU for an RMO store.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	   end
	   if (tmp[`L2_ACK])
	   begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> L2ack bit is set when the RMO store is issued to PCX.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	   end
	   else
	   begin
		tmp[`L2_ACK] = 1'b1;
		ret_ptr[thid] = ret_ptr[thid] + 1;  //this will be deallocated before 
						    //response seen from stub
		st_rmo_cnt[thid] = st_rmo_cnt[thid]  + 1'b1;
	   end
	end
	stb[{thid, iss_ptr[thid]}] = tmp;

	iss_ptr[thid] = iss_ptr[thid] + 1;
	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> iss_ptr = %0d. ret_ptr = %0d, st_rmo_cnt = %0d", core_id, thid, iss_ptr[thid], ret_ptr[thid], st_rmo_cnt[thid]);
end
endtask

`ifdef INJ_STB_ERR_IN_CMP


reg [2:0] err_tid, stb_err_tid_d1, stb_err_tid_d2;
reg [2:0] err_index, stb_err_index_d1, stb_err_index_d2;
reg [204:0] err_tmp ;
reg [20:0] err_inst;
reg [44:0] cam_data;
reg [5:0] err_bit;
integer err_inj_cnt;
reg cmp_stb_err_inj;
reg stb_err_inj, stb_err_inj_d1, stb_err_inj_d2;
reg [1:0] err_priv, stb_err_priv_d1, stb_err_priv_d2;

initial
begin
	cmp_stb_err_inj = 1'b0;

	cam_data = 45'b0;
	err_bit = 11;
	err_inj_cnt = 0;
	stb_err_inj = 0;
	if (("cmp_stb_err_inj_on"))
		cmp_stb_err_inj = 1'b1;
	else
		cmp_stb_err_inj = 1'b0;
end

always @ (negedge (`SPC3.l2clk & enabled & cmp_stb_err_inj))
begin //{
     //valid stb ram rd for issue to pcx
     stb_err_inj = 1'b0;
     if (`SPC3.lsu.sbc.ram_rptr_vld_2 & `SPC3.lsu.sbc.st_pcx_rq_p3 & `SPC3.lsu.pic.pic_st_sel_p3)
     begin //{
	err_tid = decode_tid(`SPC3.lsu.sbc.st_rq_sel_p3[7:0]);
	err_index = `SPC3.lsu.sbc.ram_rptr_d1;
	err_tmp = stb[{err_tid, err_index}];
	err_inst = err_tmp[`LSU_MON_INST];
	cam_data = `SPC3.lsu.stb_cam.cam_array.stb_rdata[44:0];
	err_priv = err_tmp[`ST_PRIV];
	//if (err_inst[`SWAP] || err_inst[`CASA] || err_inst[`LDSTUB])
	if (err_inst[`CASA])
	begin //{
	   err_inj_cnt = err_inj_cnt + 1;
	   if (err_inj_cnt == 10)
	   begin //{
	     case (err_bit)
	       11, 12: err_bit = err_bit + 1;
	       13: err_bit = 44;
	       44: err_bit = 11;
	      endcase
	      err_inj_cnt = 0;
	      stb_err_inj = 1'b1;

	      force `SPC0.lsu.stb_cam.cam_array.stb_rdata[44:0] = cam_data ^ (1 << err_bit);
	      `PR_INFO("stb_err", 22, "<T%0h> <%0h> STB[%0h]: SBAPP forced for CASA. err_bit = %0h", err_tid, {cam_data[44:8], 3'b0}, err_index, err_bit);
	      #1;
	      release `SPC0.lsu.stb_cam.cam_array.stb_rdata[44:0];
	   end  //}
	end //}
     end  //}
     if (stb_err_inj_d2)
     begin
	if (~`SPC3.lsu_sbapp_err_g)
	begin
	            `PR_ERROR("lsu_mon", `ERROR, "<T%0h> sbapp err not asserted when err is injected for atomic.", stb_err_tid_d2);
	end
	else
	begin
		if ((`SPC3.lsu_stberr_tid_g != stb_err_tid_d2) || 
		    (`SPC3.lsu_stberr_index_g != stb_err_index_d2) || 
		    (`SPC3.lsu_stberr_priv_g != stb_err_priv_d2))
		begin
	            `PR_ERROR("lsu_mon", `ERROR, "<T%0h> sbapp err parameters mismatch.", stb_err_tid_d2);
		end
	end
    end
    else
    begin
	if (`SPC3.lsu_sbapp_err_g)
	begin
	            `PR_ERROR("lsu_mon", `ERROR, "<T%0h> sbapp err asserted when none expected.", `SPC3.lsu_stberr_tid_g);
	end
    end

end  //}

	
always @ (posedge (`SPC3.l2clk & enabled & cmp_stb_err_inj))
begin
	stb_err_inj_d1 <= stb_err_inj;
	stb_err_inj_d2 <= stb_err_inj_d1;
	stb_err_tid_d1 <= err_tid;
	stb_err_tid_d2 <= stb_err_tid_d1;
	stb_err_index_d1 <= err_index;
	stb_err_index_d2 <= stb_err_index_d1;
	stb_err_priv_d1 <= err_priv;
	stb_err_priv_d2 <= stb_err_priv_d1;
end

`endif
`endif
`endif
endmodule

`endif
`ifdef CORE_4

module lsu_mon_c4;
`ifndef GATESIM

// If vcs_build_args NO_MONITORS, then module will be empty
`ifndef NO_MONITORS

reg imm_asi_vld_e;
reg [7:0] asi_e, imm_asi_e, asi_m, asi_b;
reg dec_altspace_e, dec_altspace_b, dec_altspace_m;
reg [1:0] exu_ecc_b;
reg [1:0] exu_lsu_va_error_b;
reg [2:0] dec_lsu_tid_e, dec_lsu_tid_m, dec_lsu_tid_b, dec_lsu_tid_w;
reg [47:0] inst_pc_e, inst_pc_m, inst_pc_b, inst_pc_w;
reg [31:0] inst_e, inst_m, inst_b;
reg [47:0] vaddr_m, vaddr_b;
reg [63:0] int_st_data_m, int_st_data_b;
reg [63:0] fp_st_sata_fx2;
reg [20:0] lsu_inst_e, lsu_inst_m, lsu_inst_b;
reg mmu_dtlb_reload_d1, mmu_dtlb_reload_d2;

reg [7:0] ld_valid;
reg [7:0] tlb_valid;
reg [`LD_Pend_Width] ld_pend_array[7:0];
reg [`LAST_INST_Pend_Width] last_inst_array[7:0];
reg [2:0] wrptr[7:0];  //Pts. to the STB entry into which data will be written next
reg [2:0] rdptr[7:0];  //Tracks the dealloc signal from STB
reg [2:0] iss_ptr[7:0];	//keeps track of when a store is issued from the STB to PCX
reg [2:0] ret_ptr[7:0]; //keeps track of when the response is received from 
			//the L2c.
reg [63:0] stb_valid;
reg [`STB_Pend_Width] stb[63:0];
//reg [`TLB_MISS_Pend_Width] tlbmiss_pend_array[7:0];

reg [7:0] pf_cnt[7:0];
reg [7:0] dcache_inv_cnt[7:0];
reg [7:0] st_rmo_cnt[7:0];

reg [55:0] print_inst;

reg [31:0] dec_tg0_inst_d, dec_tg1_inst_d;

reg [7:0] lsu_bst_active;
reg store_alloc;
reg [3:0] bst_cnt;
reg [195:0] stb_alloc_data;
reg [195:0] bst_data, bst_inst_data;
reg [2:0] bst_active_thid;
reg bst_fgu_err;
				
reg [7:0] is_blkld;  //reqd by lsu_ras_chkr to chk errors on blk ld.
reg [1:0] l2_blk_ld_errtype[7:0]; //Gives the type of err the ahd be reported by LSU if 
				 //different types of err occur on blk ld helper returns
reg [1:0] st_priv[7:0]; //Gives the final priv level for an sbdiou/sbapp err that shd be 
			//stored in DFESR

wire [2:0] core_id = 4;

integer i;
integer err_cnt;

reg enabled;
reg reset_in_middle;
reg [7:0] finish_mask;

initial
begin
    enabled = 0;
    reset_in_middle = 0;
	ld_valid = 8'b0;
	lsu_inst_e = 0;
	tlb_valid = 8'b0;
	for (i = 0; i < 8; i = i+1)
	begin
		pf_cnt[i] = 0;
		dcache_inv_cnt[i] = 0;
		wrptr[i] = 0;
		rdptr[i] = 0;
		iss_ptr[i] = 0;
		ret_ptr[i] = 0;
		st_rmo_cnt[i] = 0;
		is_blkld[i] = 1'b0;
		st_priv[i] = 2'b0;
		l2_blk_ld_errtype[i] = 2'b0;
	end
	lsu_bst_active = 8'b0;
	store_alloc = 1'b0;
	bst_cnt = 4'b0;
	stb_valid = 64'b0;

    // avoid time zero ugliness. jp
    //@(posedge `SPC0.l2clk);
    //@(negedge `SPC0.l2clk);
    //if (`PARGS.lsu_mon_on) enabled = 1;

    case (core_id)
	3'h0: finish_mask = `PARGS.finish_mask[7:0];
	3'h1: finish_mask = `PARGS.finish_mask[15:8];
	3'h2: finish_mask = `PARGS.finish_mask[23:16];
	3'h3: finish_mask = `PARGS.finish_mask[31:24];
	3'h4: finish_mask = `PARGS.finish_mask[39:32];
	3'h5: finish_mask = `PARGS.finish_mask[47:40];
	3'h6: finish_mask = `PARGS.finish_mask[55:48];
	3'h7: finish_mask = `PARGS.finish_mask[63:56];
    endcase
end

always @ (`TOP.in_reset)
begin
	if (~`TOP.in_reset & `PARGS.lsu_mon_on & ~reset_in_middle)
	begin
		enabled = 1'b1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "Lsu_mon on, in_reset = 0.");
	end
		

	if (`TOP.in_reset & enabled)
	begin
		reset_in_middle = 1'b1;
		enabled = 1'b0;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "Reset asserted in the middle of the diag. Turned off Lsu_mon.");
	end
end

always @ (posedge (tb_top.sim_status[0] & enabled))
begin //{
	if (|(ld_valid[7:0] & finish_mask[7:0]))
	begin  //{
	   for (i = 0; i < 8; i=i+1)
	   begin
		if (ld_valid[i])  
		begin
		   DispPendReq(i);
	        end
	   end
	  `PR_ERROR("lsu_mon", `ERROR, "<C%h> Ld requests pending at the end of simulation. ld_valid = %0h", core_id, ld_valid);
	end  //}
	if (|stb_valid[63:0])
	begin  //{
	   err_cnt = 0;
	   for (i = 0; i < 64; i=i+1)
	   begin
		if (stb_valid[i] & finish_mask[i[5:3]])  
		begin
		//chkr resets the stb valid bits when block_store_kill is asserted.
		//in couple of failures block_store_kill was sampled asserted two cycles after
		//lsu asserted stb_empty. The simulation ended the cycle stb_empty was sampled high 
		//causing moniotr firings with valid entries in stb at end of simulation. Now
		//don't flag an error if squash bit is set and stb_valid is asserted at end
		//of simualation.
		      if (~is_squash_bit_set(i[5:0]))
		      begin
			err_cnt = err_cnt + 1;
			Disp_STB_entry(i[5:3],i[2:0]);
		      end
		end
	   end
	   if (err_cnt)
	   begin
	  	`PR_ERROR("lsu_mon", `ERROR, "<C%h> Store requests pending at the end of simulation. stb_valid = %0h", core_id, stb_valid);
	   end
       end  //}
       err_cnt = 0;
       for (i = 0; i < 8; i=i+1)
       begin  //{
	   if (finish_mask[i] & (pf_cnt[i] != 0))
	   begin
		err_cnt = 1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> Prefetches not finished. Pf_cnt = %0d", core_id, i, pf_cnt[i]);
	   end
	   if (finish_mask[i] & (dcache_inv_cnt[i] != 0))
	   begin
		err_cnt = 1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> D pkt not received for all invalidate reqs. issued by the thread. dcache_inv_cnt = %0d", core_id, i, dcache_inv_cnt[i]);
	   end
	   if (finish_mask[i] & (st_rmo_cnt[i] != 0))  
	   begin
		err_cnt = 1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> rmo_cnt not zero. rmo_cnt = %0d", core_id, i, st_rmo_cnt[i]);
	   end
       end  //}
       if (err_cnt)
       begin
	  `PR_ERROR("lsu_mon", `ERROR, "<C%h> Prefetch/D/RMO_stores requests pending at the end of simulation.", core_id);
       end
end //}

function is_squash_bit_set;
input [5:0] index;
reg [204:0] tmp;
begin
	tmp = stb[index];
	if (tmp[`ST_SQUASH])
		is_squash_bit_set = 1'b1;
	else
		is_squash_bit_set = 1'b0;
end
endfunction


always @ (negedge (`SPC4.l2clk & enabled))
begin //{

	asi_e  = `SPC4.lsu.dcc.dcc_asi_e[7:0];

	lsu_inst_e[`LD] <= `SPC4.dec_ld_inst_e;
	lsu_inst_e[`ST] <= `SPC4.dec_st_inst_e;
	lsu_inst_e[`FP] <= `SPC4.dec_fpldst_inst_e;
	lsu_inst_e[`PREF] <= `SPC4.dec_pref_inst_e;
	lsu_inst_e[`SWAP] <= `SPC4.dec_swap_inst_e;
	lsu_inst_e[`CASA] <= `SPC4.dec_casa_inst_e;
	lsu_inst_e[`LDSTUB] <= `SPC4.dec_ldstub_inst_e;
	lsu_inst_e[`FLUSH] <= `SPC4.dec_flush_inst_e;
	lsu_inst_e[`MEMBAR] <= `SPC4.dec_memstbar_inst_e;
	lsu_inst_e[`LDD] <= `SPC4.dec_ld_inst_e & `SPC4.dec_ldst_dbl_e & ~`SPC4.dec_fpldst_inst_e;
	lsu_inst_e[`STD] <= `SPC4.dec_st_inst_e & `SPC4.dec_ldst_dbl_e & ~`SPC4.lsu.dec_fpldst_inst_e;

       lsu_inst_e[`BLKLD] <= `SPC4.dec_ld_inst_e & `SPC4.dec_fpldst_inst_e & dec_altspace_e & Is_blk_asi(asi_e);
	lsu_inst_e[`BLKST] <= `SPC4.dec_st_inst_e & `SPC4.dec_fpldst_inst_e & dec_altspace_e & Is_blk_asi(asi_e);
	lsu_inst_e[`QLD] <= `SPC4.dec_ld_inst_e & dec_altspace_e & Is_qld_asi(asi_e);
	lsu_inst_e[`ASR_RD_WR] <= `SPC4.dec_sr_inst_e & (`SPC4.dec_ld_inst_e | `SPC4.dec_st_inst_e);
	lsu_inst_e[`PR_RD_WR] <= `SPC4.dec_pr_inst_e & (`SPC4.dec_ld_inst_e | `SPC4.dec_st_inst_e);
	lsu_inst_e[`HPR_RD_WR] <= `SPC4.dec_hpr_inst_e & (`SPC4.dec_ld_inst_e | `SPC4.dec_st_inst_e);
	lsu_inst_e[`FSR_RD_WR] <= `SPC4.dec_fsr_ldst_e & (`SPC4.dec_ld_inst_e | `SPC4.dec_st_inst_e);
end //}

always @ (posedge (`SPC4.l2clk & enabled))
begin //{
	dec_tg0_inst_d <= `SPC4.dec.ded0.decode_mux[31:0];
	dec_tg1_inst_d <= `SPC4.dec.ded1.decode_mux[31:0];
	imm_asi_vld_e <= `SPC4.lsu.dec_imm_asi_vld_d;

	imm_asi_e <= `SPC4.lsu.dec_imm_asi_d;
	dec_altspace_e <= `SPC4.dec_altspace_d;
	dec_altspace_m <= dec_altspace_e;
	dec_altspace_b <= dec_altspace_m;

	exu_ecc_b <= `SPC4.exu_ecc_m;
	exu_lsu_va_error_b <= `SPC4.exu_lsu_va_error_m;

	dec_lsu_tid_e <= `SPC4.dec_lsu_tg_d ? {1'b1, `SPC4.dec_lsu_tid1_d} : {1'b0, `SPC4.dec_lsu_tid0_d}; 	
	dec_lsu_tid_m <= dec_lsu_tid_e;
	dec_lsu_tid_b <= dec_lsu_tid_m;
	dec_lsu_tid_w <= dec_lsu_tid_b;
	
	inst_pc_e <= `SPC4.dec_lsu_tg_d ? {`SPC4.tlu.tlu_pc_1_d[47:2], 2'b0} : {`SPC4.tlu.tlu_pc_0_d[47:2], 2'b0};
	inst_pc_m <= inst_pc_e;
	inst_pc_b <= inst_pc_m;
	inst_pc_w <= inst_pc_b;
	
	inst_e <= `SPC4.dec_lsu_tg_d ? dec_tg1_inst_d : dec_tg0_inst_d;
	inst_m <= inst_e;
	inst_b <= inst_m;

	vaddr_m <= `SPC4.exu_lsu_address_e;
	vaddr_b <= vaddr_m;

	int_st_data_m <= `SPC4.exu_lsu_store_data_e;
	int_st_data_b <= int_st_data_m;
	fp_st_sata_fx2 <= `SPC4.fgu_lsu_fst_data_fx1;

	mmu_dtlb_reload_d1 <= `SPC4.mmu_dtlb_reload;
	mmu_dtlb_reload_d2 <= mmu_dtlb_reload_d1;

	//pcx_thid_d1 <=  `SPC4.lsu.spc_pcx_data_pa[`PCX_THR_ID];
	lsu_inst_m <= lsu_inst_e;
	lsu_inst_b <= lsu_inst_m;

	asi_m <= asi_e;
	asi_b <= asi_m;
end //}

function Is_blk_asi;
input [7:0] asi;
begin
	Is_blk_asi = (asi == `ASI_BLK_AIUP) | (asi == `ASI_BLK_AIUS) | 
		   (asi == `ASI_BLK_AIUPL) | (asi == `ASI_BLK_AIUSL) |
		   (asi == `ASI_BLK_P) | (asi == `ASI_BLK_S) |
		   (asi == `ASI_BLK_PL) | (asi == `ASI_BLK_SL) |
		   (asi == `ASI_BLK_COMMIT_P) | (asi == `ASI_BLK_COMMIT_S);
end
endfunction

function Is_qld_asi;
input [7:0] asi;
begin
 		Is_qld_asi = (asi == `ASI_AIU_BIS_QUAD_LDD_P) | (asi == `ASI_AIU_BIS_QUAD_LDD_S) |
		(asi == `ASI_AIU_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_AIU_BIS_QUAD_LDD_S_LITTLE) |
		(asi == `ASI_NUCLEUS_BIS_QUAD_LDD) | (asi == `ASI_NUCLEUS_BIS_QUAD_LDD_LITTLE) |
		(asi == `ASI_BIS_QUAD_LDD_P) | (asi == `ASI_BIS_QUAD_LDD_S) |
		(asi == `ASI_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_BIS_QUAD_LDD_S_LITTLE) |
		(asi == `ASI_QUAD_LDD) | (asi == `ASI_QUAD_LDD_REAL) |
		(asi == `ASI_QUAD_LDD_L) | (asi == `ASI_QUAD_LDD_REAL_L);
end
endfunction

function Is_bis_asi;
input [7:0] asi;
begin
 		Is_bis_asi = (asi == `ASI_AIU_BIS_QUAD_LDD_P) | (asi == `ASI_AIU_BIS_QUAD_LDD_S) |
		(asi == `ASI_AIU_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_AIU_BIS_QUAD_LDD_S_LITTLE) |
		(asi == `ASI_NUCLEUS_BIS_QUAD_LDD) | (asi == `ASI_NUCLEUS_BIS_QUAD_LDD_LITTLE) |
		(asi == `ASI_BIS_QUAD_LDD_P) | (asi == `ASI_BIS_QUAD_LDD_S) |
		(asi == `ASI_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_BIS_QUAD_LDD_S_LITTLE);
end
endfunction

always @ (negedge (`SPC4.l2clk & enabled))
begin //{
	Chk_store;
	store_alloc = 1'b0;
	if (lsu_inst_m != 0)
	begin
		if (`SPC4.dec_flush_lm)
		begin
			lsu_inst_m <= 0;
			`PR_INFO("lsu_mon", 21, "<C%0h> <T%0h> <%0h> M_stage: %s(VA=%0h) Flushed due to IFU Flush.", core_id, dec_lsu_tid_m, inst_pc_m, tb_top.intf0.xlate(inst_m),vaddr_m);
		end
	end
		
	if (lsu_inst_b != 0)
	begin //{
		if (lsu_inst_b[`BLKLD])  print_inst = " BLKLD,";
		else if (lsu_inst_b[`BLKST])  print_inst = " BLKST,";
		else if (lsu_inst_b[`QLD])  print_inst = " QLD,";
		else  print_inst = "";

		if (`SPC4.dec_flush_lb)
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%0h> <T%0h> <%0h> B_stage: %s(VA=%0h) Flushed due to IFU Flush.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		else if (`SPC4.tlu_flush_lsu_b)
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h) Flushed due to TLU Flush.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		//casa is a two cycle operation. If there is an err on the 2nd cycle of casa then also
		//casa shd be killed.
		//This function will also chk for errors on 2nd cycle.
		else if (Is_exu_error(exu_lsu_va_error_b, exu_ecc_b))  
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h <%0h> B_stage: %s(VA=%0h) Flushed due to EXU error.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		else if ((`SPC4.fgu_cecc_fx2 || `SPC4.fgu_uecc_fx2) && lsu_inst_b[`ST] && lsu_inst_b[`FP]) 
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h) Flushed due to FGU error.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		else if (IsExc(core_id)) 
			lsu_inst_b <= 0;
		else if (!`SPC4.lsu_tlb_miss_b_)
		begin
			`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h)%s ASI = %0h. DTLB miss.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, asi_b);
				//Insert_tlb_miss_info;
		end
		else 
		begin //{
		//Lsu doesn't assert lsu_sync for an exception or dtlb miss. Since for
		//an exception tlu anyway tells the front end to flush itself there is 
		//no reason for LSU to flush the front end then TLU to flush it again.
		//Lsu treats the dtlbmiss as an exception that it flushes the  inst and
		//handles it when it is reissued by the front end.

		   if (`SPC4.lsu_tlb_bypass_b)
		   begin
			if (`SPC4.lsu_sync != 8'b0)
			begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. LSU_sync. DTLB Bypass.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC4.lsu.tlb_pgnum[39:13], vaddr_b[12:0]},  asi_b);
			end
			else
			begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. DTLB Bypass.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC4.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b);
			end
		  end
	          else
		  begin
			if (`SPC4.lsu_sync != 8'b0)
			begin
			  if (lsu_inst_b[`ST])
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h, Store_data = %0h. LSU_sync. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC4.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b,int_st_data_b);
			  end
			  else
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. LSU_sync. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC4.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b);
			  end
			end
			else
			begin
			  if (lsu_inst_b[`ST])
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h, Store_data = %0h. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC4.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b, int_st_data_b);
			  end
			  else
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC4.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b);
		          end
		        end
		  end

	          if (lsu_inst_b[`LD] || lsu_inst_b[`PREF] || lsu_inst_b[`SWAP] || lsu_inst_b[`CASA] || lsu_inst_b[`LDSTUB])
		  begin //{
			if (((lsu_inst_b == 16'h1) || (lsu_inst_b == 16'h5)) & `SPC4.lsu.stb_cam_hit)
			begin
				`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h>: LSU_sync asserted due to STB RAW.", core_id, dec_lsu_tid_b, inst_pc_b);
			end
		  end //}

		  if (lsu_inst_b[`LD])
			Insert_ld_miss_info;

		  if (lsu_inst_b[`ST])  //for atomics both ld and store signals are asserted
		  begin
			Make_STB_data;
			store_alloc = 1'b1;
		  end
		  Insert_in_last_inst_array;

		if (`SPC4.lsu_trap_flush[7:0])
		begin
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h> Trap Flush asserted.", core_id, decode_tid(`SPC4.lsu_trap_flush[7:0]));
		end
	    end //}
	end //}
end //}

//STB ue testing:
//This is how we test squashing of stores by LSU_mon:
//Whenever lsu asserts err_sbdiou signal, the monitor sets the squash
//bit in the STB for the rest of the stores. If any of these squashed stores
//is issued on the asi ring or to the PCX interface the monitor complains.
//The squashed stores are deallocated when either a block_store_kill is
//asserted or dealloc signals are asserted by the LSU.
//When the block_store_kill is asserted, it tells the IFU to dealloc
//all the pending stores in the IFU. It means the when block_store_kill
//is asserted we have deallocated all the non-squashed requests from STB.
//The 0in_chkr ensures that LSU flags the correct index and priv with the
//the sbdiou signal to TLU.


always @ (negedge (`SPC4.l2clk & enabled))
begin
	if (`SPC4.lsu_l15_valid & `SPC4.lsu.spc_pcx_data_pa[129])
		Chk_pcx_req_pkt(`SPC4.lsu.spc_pcx_data_pa[129:0]);  //chk if we need .lsu here
	if ((`SPC4.lsu_rngl_cdbus[64:63] == 2'b11) & ~`SPC4.lsu_rngl_cdbus[59])
		Chk_st_on_ASI_ring(`LOCAL);

	if ((`SPC4.lsu_rngf_cdbus[64:63] == 2'b11) & ~`SPC4.lsu_rngf_cdbus[59])
		Chk_st_on_ASI_ring(`FAST);

	//if (`SPC4.l15_lsu_valid)
		//Chk_cpx_response_pkt({`SPC4.l15_lsu_valid, `SPC4.l15_lsu_cpkt[17:13],`SPC4.l15_lsu_cpkt[11:0],`SPC4.l15_spc_data1[127:0]});
	
	if (`SPC4.cpx_spc_data_cx[145])
		Chk_cpx_response_pkt(`SPC4.cpx_spc_data_cx);
	
	if (`SPC4.lsu_complete[7:0] != 8'b0)
	begin
		if (`SPC4.lsu_complete[0]) Chk_ld_complete(0);
		if (`SPC4.lsu_complete[1]) Chk_ld_complete(1);
		if (`SPC4.lsu_complete[2]) Chk_ld_complete(2);
		if (`SPC4.lsu_complete[3]) Chk_ld_complete(3);
		if (`SPC4.lsu_complete[4]) Chk_ld_complete(4);
		if (`SPC4.lsu_complete[5]) Chk_ld_complete(5);
		if (`SPC4.lsu_complete[6]) Chk_ld_complete(6);
		if (`SPC4.lsu_complete[7]) Chk_ld_complete(7);
	end
	
	if (`SPC4.lsu_block_store_kill[7:0] != 8'b0)
	begin
		if (`SPC4.lsu_block_store_kill[0]) Squash_STB(0);
		if (`SPC4.lsu_block_store_kill[1]) Squash_STB(1);
		if (`SPC4.lsu_block_store_kill[2]) Squash_STB(2);
		if (`SPC4.lsu_block_store_kill[3]) Squash_STB(3);
		if (`SPC4.lsu_block_store_kill[4]) Squash_STB(4);
		if (`SPC4.lsu_block_store_kill[5]) Squash_STB(5);
		if (`SPC4.lsu_block_store_kill[6]) Squash_STB(6);
		if (`SPC4.lsu_block_store_kill[7]) Squash_STB(7);
	end
	
	if (`SPC4.lsu_stb_dealloc[7:0] != 8'b0)
	begin
		if (`SPC4.lsu_stb_dealloc[0]) Dealloc_STB(0);
		if (`SPC4.lsu_stb_dealloc[1]) Dealloc_STB(1);
		if (`SPC4.lsu_stb_dealloc[2]) Dealloc_STB(2);
		if (`SPC4.lsu_stb_dealloc[3]) Dealloc_STB(3);
		if (`SPC4.lsu_stb_dealloc[4]) Dealloc_STB(4);
		if (`SPC4.lsu_stb_dealloc[5]) Dealloc_STB(5);
		if (`SPC4.lsu_stb_dealloc[6]) Dealloc_STB(6);
		if (`SPC4.lsu_stb_dealloc[7]) Dealloc_STB(7);
	end

	if (`SPC4.lsu_block_store_stall)
	      Chk_block_store;

	if (`SPC4.lsu.lsu_block_store_alloc[7:0] != 8'b0)
		Set_block_store_parameters;

	if (`SPC4.lsu_sbdiou_err_g || `SPC4.lsu_sbapp_err_g)
		Squash_store;

	if (`SPC4.lsu_stb_flush_g)
		st_priv[`SPC4.lsu_stberr_tid_g] = get_priv_on_flush(`SPC4.lsu_stberr_tid_g);
end

function [1:0] get_priv_on_flush;
input [2:0] tid;
reg [2:0] sq_index;
reg [204:0] tmp;

begin
	sq_index = `SPC4.lsu_stberr_index_g;
	tmp = stb[{tid, sq_index}];
	get_priv_on_flush = tmp[`ST_PRIV];
end
endfunction

task Chk_block_store;
reg [20:0] inst;
reg [2:0] thid;
begin
		thid = `SPC4.lsu_block_store_tid;
		bst_inst_data = stb[{thid, rdptr[thid]}];
		inst = bst_inst_data[`LSU_MON_INST];

		if (~inst[`BLKST])
		begin
			Disp_STB_entry(thid, iss_ptr[thid]);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted blk_store_stall while the req at the top of STB is not blkst as shown above", core_id, thid);
		end
end
endtask

//lsu can assert block_store_stall for a new block store while it has not yet written
//the 8 stb entries from the previous blk store.

task Set_block_store_parameters;
reg [2:0] thid;
begin
	
		thid = decode_tid(`SPC4.lsu.lsu_block_store_alloc[7:0]);
		if (lsu_bst_active[thid])
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted blk_store_alloc while the bst_active is already set for this thread.", core_id, thid);
		end
		else
		begin
			lsu_bst_active[thid] = 1'b1;
			bst_active_thid = thid;
			if (`SPC4.lsu.fgu_fst_ecc_error_fx2)
			    bst_fgu_err = 1'b1;
			else
			    bst_fgu_err = 1'b0;
		end
end
endtask

task Squash_store;
reg [2:0] thid;
reg [2:0] sq_index;
reg [2:0] i;
reg [204:0] tmp;
reg [3:0] squash_cnt;
reg [1:0] priv;

begin
	thid = `SPC4.lsu_stberr_tid_g;
	sq_index = `SPC4.lsu_stberr_index_g;
	priv = `SPC4.lsu_stberr_priv_g;
	tmp = stb[{thid, sq_index}];
	squash_cnt = 0;
     	`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Sbdiou/sbapp seen for index = %h and priv = %h.", core_id, thid, sq_index,  priv);

	st_priv[thid] = tmp[`ST_PRIV];

	//lsu can assert deallocate before it asserts the sbdiou signal. 
	//In that case iss_ptr won't be equal to sbdiou index.
	//if (sq_index != iss_ptr[thid])
	//begin
	//	Disp_STB_entry(thid, iss_ptr[thid]);
	//	`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted sbdiou/sbapp with index %0h while the next req to be issued is at index %0h.", core_id, thid, sq_index, iss_ptr[thid]);
	//end
	
	//If there is only one store in the store buffer which gets an sbdiou error, then LSU can deallocate
	//the store and then assert sbdiou. The deallocation will cause the stb issue_ptr to move 
	//forward to an inst. that has already been issued and completed and this chk can fire. So
	//removing this chk. 

        //if (tmp[`L2_ST_ISS])
        //begin
         //       Disp_STB_entry(thid, iss_ptr[thid]);
          //      `PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store reissued on the PCX interface.", core_id, thid, tmp[`MEMOP_PA]);
        //end

	if (iss_ptr[thid] == wrptr[thid])
	begin
	    if (stb_valid[{thid, wrptr[thid]}])
		squash_cnt = 8;
	    else
	    begin
	    //changing it to an info message because if there is only one valid entry in store buffer that
	    //gets an sbdiou then LSU can deallocate the entry and then issue sbdiou.
              	//`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Lsu asserted sbdiou/sbapp while there are no valid entries in STB to be issued.", core_id, thid);
              	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> sbdiou/sbapp squashed only one entry in STB.", core_id, thid);
	    end
	end
	else
	begin
	  if (iss_ptr[thid] < wrptr[thid])
		squash_cnt = wrptr[thid] - iss_ptr[thid];
	  else if (iss_ptr[thid] > wrptr[thid])
		squash_cnt = wrptr[thid] + (8 - iss_ptr[thid]);
	end
	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> SQUASH_STORE:iss_ptr = %0h, wrptr = %0h, squash_cnt = %0h.", core_id, thid, iss_ptr[thid], wrptr[thid], squash_cnt);

	i = iss_ptr[thid];
		
	while (squash_cnt)
	begin
		tmp = stb[{thid, i}];
		tmp[`ST_SQUASH] = 1'b1;
		if (priv < tmp[`ST_PRIV])
		begin
              		`PR_INFO("lsu_mon", `INFO, "<C%h> <T%0h> <PA = %0h> Sbdiou/sbapp signalled. Err in user/priv level store is squashing a higher priv level store.", core_id, thid, tmp[`MEMOP_PA]);
			priv = tmp[`ST_PRIV];
		end
			
		stb[{thid, i}] = tmp;
               	`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <PA = %0h> STB_entry[%0h] squashed.", core_id, thid, tmp[`MEMOP_PA], i);
	   	 
		 i = i + 1;
		 squash_cnt = squash_cnt - 1'b1;
	end
end
endtask

function [2:0] decode_tid;
input [7:0] thid_encode;
begin
	case (thid_encode)
	   8'h1: decode_tid = 3'b0;
	   8'h2: decode_tid = 3'h1;
	   8'h4: decode_tid = 3'h2;
	   8'h8: decode_tid = 3'h3;
	   8'h10: decode_tid = 3'h4;
	   8'h20: decode_tid = 3'h5;
	   8'h40: decode_tid = 3'h6;
	   8'h80: decode_tid = 3'h7;
	   default: 
	   begin
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> decode_tid. Incorrect value of thid input = %0h.", core_id, thid_encode, thid_encode);
	   end
	endcase
end
endfunction

task Chk_ld_complete;
input [2:0] thid;
reg [`LD_Pend_Width] tmp;
begin
	tmp = ld_pend_array[thid];

	if (ld_valid[thid])
	begin
		if ((tmp[`L2_ISS] != 4'hf) || (tmp[`L2_RESP] != 4'hf))
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted lsu_complete while the l2_iss and l2_resp bits are not F.", core_id, thid);
		end
		ld_valid[thid] = 1'b0;
		`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h> %s(VA=%0h) Complete. Setting ld_valid to 0.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
	end

	tmp = last_inst_array[thid];
	`PR_INFO("lsu_mon", 24, "<C%h> <T%0h> <%0h> %s(VA=%0h) Complete.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
end
endtask
	
task Chk_pcx_req_pkt;
input [129:0] pcx_pkt;
reg [2:0] thid;
reg [`LD_Pend_Width] tmp, tmp1; 
reg [15:0] inst; 
reg [11*8:0] req;
reg [39:0] addr;
begin 
	thid = pcx_pkt[`PCX_THR_ID]; 
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	req = DispPCXReq(pcx_pkt);
	addr = pcx_pkt[`PCX_ADDR];


	if (pcx_pkt[`PCX_CPU_ID] != core_id)
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> cpu_id (spc_pcx_data_pa[122:120]) = %h is not = %0h when the lsu made a %s req to gasket.", core_id, pcx_pkt[`PCX_THR_ID], addr, pcx_pkt[122:120], core_id, req);
	
	
	if ((pcx_pkt[`PCX_RQTYP] == `PCX_LOAD) || (pcx_pkt[`PCX_RQTYP] == `PCX_CAS1) || (pcx_pkt[`PCX_RQTYP] == `PCX_CAS2) || (pcx_pkt[`PCX_RQTYP] == `PCX_SWAP_LDSTUB))
	begin
	  if (~ld_valid[thid])
	  begin
		ld_valid[thid] = 1'b1;  //we have sent a req to gasket and are waiting for response
		`PR_INFO("lsu_mon", 22, "<C%0h> <T%0h> Setting ld_valid[%0h].", core_id, thid, thid);
	  end
		if (~inst[`BLKLD])
		begin
			if (tmp[`MEMOP_PA] != addr)
			begin
				if ((tmp[`INST_ASI] == 8'h41) || (tmp[`INST_ASI] == 8'h73) || ((tmp[`INST_ASI] == 8'h45) && ((tmp[`MEMOP_PA] == 8'h10) || (tmp[`MEMOP_PA] == 8'h18))))
				begin
					`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <PA = %0h> PA mismatch on gasket for %s request. Ignoring the mismatch as inst. is issued with asi 41, 73 or 45 (with VA 0x10 or 18).", core_id, thid, addr, req);
				end
				else
				begin
					DispPendReq(thid);
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A %s request made to gasket by LSU while the pending req is with PA %0h.", core_id, thid, addr, req, tmp[`MEMOP_PA]);
				end
			end
		end
	end

	case (pcx_pkt[`PCX_RQTYP])
	   `PCX_LOAD: 
	   begin
		if (pcx_pkt[`PCX_PF])
		begin
			if (~inst[`PREF])
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A prefetch request made to gasket by LSU which mismatches the pending request from the thread.", core_id, thid, addr);
			end
			if (pcx_pkt[`PCX_INV])
			begin
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: PREF_ICE(VA=%0h) Issued. pf_cnt not updated.", core_id, thid, tmp[`INST_VA], tmp[`MEMOP_VA]);
			end
			else
			begin
			 	pf_cnt[thid] = pf_cnt[thid] + 1'b1;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Issued. pf_cnt = %0d.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], pf_cnt[thid]);
			end
			tmp[`L2_ISS] = 4'hF;
			tmp[`L2_RESP] = 4'hF; //we don't wait for a prefetch response from gasket
			ld_pend_array[thid] = tmp;
		end
		else 
		begin
			if (pcx_pkt[`PCX_INV])
			begin
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Dcache invalidate pkt issued to CCX.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
				dcache_inv_cnt[thid] = dcache_inv_cnt[thid] + 1'b1;
			end
			else
			begin
				Chk_req_load(pcx_pkt);
			end
		end
	    end
           `PCX_CAS1, `PCX_CAS2:
	   begin
		if (~inst[`CASA])
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> CASA request made to gasket by LSU while no such request request is pending from this thread.", core_id, thid, addr);
		end
		if (pcx_pkt[`PCX_RQTYP] == `PCX_CAS1)
		begin
			tmp[`L2_ISS] = 4'hE;
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) (CAS1) Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			ld_pend_array[thid] = tmp;
		end
		if (pcx_pkt[`PCX_RQTYP] == `PCX_CAS2)
		begin
			tmp[`L2_ISS] = 4'hF;
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) (CAS2) Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			ld_pend_array[thid] = tmp;
			chk_store_issue_to_pcx(pcx_pkt);
		end
		
	   end
	   `PCX_SWAP_LDSTUB:
	   begin
		if (~inst[`SWAP] && ~inst[`LDSTUB])
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> %s request made to gasket by LSU while no such request request is pending from this thread.", core_id, thid, addr, req);
		end
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Issued to gasket. store_data = %0h", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], pcx_pkt[`PCX_DATA]);
		tmp[`L2_ISS] = 4'hF;
		ld_pend_array[thid] = tmp;
		
		chk_store_issue_to_pcx(pcx_pkt);
	   end

	    `PCX_STORE:
	    begin
		chk_store_issue_to_pcx(pcx_pkt);
	    end
	   
	   default: `PR_INFO("lsu_mon", 21, "<C%h> <T%0h> <%0h>: %s Issued to gasket.", core_id, thid, addr, req);
	endcase
end
endtask

task Chk_cpx_response_pkt;
input [145:0] cpx_pkt;
reg [2:0] thid;
begin
	thid = cpx_pkt[`CPX_THR_ID];	

	casex ({cpx_pkt[`CPX_RTNTYP], cpx_pkt[`CPX_ERR], cpx_pkt[`CPX_NC], cpx_pkt[`CPX_ATM], cpx_pkt[`CPX_PF]})
	  {4'b0, 2'bxx, 1'bx, 1'b0, 1'b0}:  
	  begin
		chk_ccx_ld_response(cpx_pkt);
	  end

	  {4'b0, 2'bxx, 1'b1, 1'b0, 1'b1}:  
	  begin
		if (pf_cnt[thid] == 8'b0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Prefetch response received from gasket while the pf_cnt is 0 for this thread.", core_id, thid);
		end
		else
		begin
			pf_cnt[thid] = pf_cnt[thid] - 1'b1;
			`PR_INFO("lsu_mon", 26, "<C%h> <T%0h> Prefetch response received. pfcnt = %0d.", core_id, thid, pf_cnt[thid]);
		end
	  end
	  
	  {4'h8, 2'bxx, 1'b1, 1'b0, 1'b0}:  
		chk_ccx_ld_response(cpx_pkt);

	  {4'h4, 2'bxx, 1'bx, 1'b0, 1'b0}:  
	   begin
	      if (cpx_pkt[123])  //D pkt
	      begin //{
		if (cpx_pkt[120:118] != core_id)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> D response received from gasket with core_id =%h.", core_id, thid, cpx_pkt[120:118]);
		end
		if (dcache_inv_cnt[thid] == 8'b0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> D response received from gasket while the Dcache_inv_cnt is 0 for this thread.", core_id, thid);
		end
		else
		begin
			dcache_inv_cnt[thid] = dcache_inv_cnt[thid] - 1'b1;
			`PR_INFO("lsu_mon", 26, "<C%h> <T%0h> D response received. Dcache_inv_cnt = %0d.", core_id, thid, dcache_inv_cnt[thid]);
		end
	     end  //}
	     else if (cpx_pkt[124])  //I pkt
	     begin
		if (cpx_pkt[120:118] != core_id)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> I response received from gasket with core_id =%h.", core_id, thid, cpx_pkt[120:118]);
		end
		//`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> I pkt.", core_id, thid);
	     end
	     else if (cpx_pkt[124:123] == 2'b0)
	     begin
		if (cpx_pkt[120:118] == core_id)
		begin
			chk_ccx_st_response(cpx_pkt);
	        end
		else
		begin
			`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Store Ack pkt received from core %0h.", core_id, thid, cpx_pkt[120:118]);
		end
	     end
	   end

	  {4'h1, 2'bxx, 1'bx, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> IFILL1 return.", core_id, thid);
	  {4'h1, 2'bxx, 1'bx, 1'b1, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> IFILL2 return.", core_id, thid);
	  {4'h9, 2'bxx, 1'b1, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> NCU IFILL return.", core_id, thid);
	  
	  {4'b0, 2'bxx, 1'b1, 1'b1, 1'b0}:  
	  begin
		chk_ccx_atm_response(cpx_pkt);
	  end
	  {4'h4, 2'bxx, 1'b1, 1'b1, 1'b0}:  
	  begin
		if ((cpx_pkt[`CPX_RTNTYP] == 4'h4) & (cpx_pkt[120:118] == core_id))
		begin
			chk_ccx_atm_response(cpx_pkt);
			chk_ccx_st_response(cpx_pkt);
		end
	  end
			
	  {4'h2, 2'bxx, 1'b1, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Stream Ld return.", core_id, thid);
	  {4'h6, 2'bxx, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Stream store Ack.", core_id, thid);
	  {4'h5, 2'bxx, 1'b1, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> MMU ld return.", core_id, thid);
	  {4'h7, 2'b00, 1'b0, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Interrupt return.", core_id, thid);
	  {4'h3, 2'b00, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Eviction Invalidation.", core_id, thid);
	  {4'hc, 2'bxx, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> L2 Indication.", core_id, thid);
	  
	  {4'hd, 2'bxx, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Soc Error Indication.", core_id, thid);
	   
	  default:
	  begin
		`PR_ALWAYS("lsu_mon", `ALWAYS, "CPX_PKT data.");
		`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%0h> <T%0h> rtn_typ = %0h, err_bits = %0h, nc=%0b, atm = %0b, pf = %0b",  core_id, cpx_pkt[`CPX_THR_ID], cpx_pkt[`CPX_RTNTYP], cpx_pkt[`CPX_ERR], cpx_pkt[`CPX_NC], cpx_pkt[`CPX_ATM], cpx_pkt[`CPX_PF]);

		`PR_ERROR("lsu_mon", `ERROR, "<C%0h> <T%0h> Can't recognise the CPX pkt.",  core_id, thid);
	  end

	endcase
end
endtask

task chk_ccx_ld_response;
input [145:0] cpx_pkt;
reg [2:0] thid;
reg [20:0] inst;
reg [39:0] cpx_pa, inst_pa;
reg [`LD_Pend_Width] tmp;
reg [3:0] pkt_type;
begin
	thid = cpx_pkt[`CPX_THR_ID];
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	inst_pa = tmp[`MEMOP_PA];
	pkt_type = cpx_pkt[`CPX_RTNTYP];

	   if (ld_valid[thid])
	   begin 
			`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) L2 response.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
		/* 
			if (inst_pa[39] != pkt_type[3])
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> ccx pkt_type = %h mismatches the ld_pa bit 39. ld_pa = %0h.", core_id, thid, pkt_type, inst_pa);
			end
		*/

			if (inst[`BLKLD])
			begin
				if (tmp[`L2_RESP] == 4'h0) 
				begin
					tmp[`L2_RESP] = 4'h1; 
					tmp[`L2_ERR0] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 1.", core_id, thid);
					end

				end
				else if (tmp[`L2_RESP] == 4'h1) 
				begin
					tmp[`L2_RESP] = 4'h3; 
					tmp[`L2_ERR1] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 2.", core_id, thid);
					end
				end
				else if (tmp[`L2_RESP] == 4'h3) 
				begin
					tmp[`L2_RESP] = 4'h7; 
					tmp[`L2_ERR2] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 3.", core_id, thid);
					end
				end
				else if (tmp[`L2_RESP] == 4'h7) 
				begin
					tmp[`L2_RESP] = 4'hF; 
					tmp[`L2_ERR3] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 4.", core_id, thid);
					end

					//is_blkld[thid] = 1'b1;
					if ((tmp[`L2_ERR0] == `ND) || (tmp[`L2_ERR1] == `ND) || (tmp[`L2_ERR2] == `ND) ||  (tmp[`L2_ERR3] == `ND))
						l2_blk_ld_errtype[thid] = `ND;
					else if ((tmp[`L2_ERR0] == `UE) || (tmp[`L2_ERR1] == `UE) || (tmp[`L2_ERR2] == `UE) ||  (tmp[`L2_ERR3] == `UE))
						l2_blk_ld_errtype[thid] = `UE;
					else if ((tmp[`L2_ERR0] == `CE) || (tmp[`L2_ERR1] == `CE) || (tmp[`L2_ERR2] == `CE) ||  (tmp[`L2_ERR3] == `CE))
						l2_blk_ld_errtype[thid] = `CE;
					else 
						l2_blk_ld_errtype[thid] = `NE;
				end
				else
				begin
					DispPendReq(thid);
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when response pkt received from ccx.", core_id, thid);
				end
			end
			else if (Is_single_pcx_req_ld(inst)) 
			begin
				//is_blkld[thid] = 1'b0;
				if (tmp[`L2_RESP] != 4'hE)
				begin
					DispPendReq(thid);
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when response pkt received from ccx.", core_id, thid);
				end
				//`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Setting L2_resp bits to F.", core_id, thid);
				tmp[`L2_RESP] = 4'hF;
			end
			else
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Load response received from gasket for thid %h while no load request pending from core for this thread.", core_id, thid, thid);
	     end
	     else
	     begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Load response received from gasket while no load request pending from core for this thread.", core_id, thid);
	     end

	ld_pend_array[thid] = tmp;
end
endtask

task chk_ccx_atm_response;
input [145:0] cpx_pkt;
reg [2:0] thid;
reg [20:0] inst;
reg [39:0] inst_pa;
reg [`LD_Pend_Width] tmp;
begin
	thid = cpx_pkt[`CPX_THR_ID];
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	inst_pa = tmp[`MEMOP_PA];

	if (~ld_valid[thid])
	begin
		if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ld response received from gasket while no request pending from core for this thread.", core_id, thid);
		end
		else
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ack response received from gasket while no request pending from core for this thread.", core_id, thid);
		end
	end
        else
   	begin 
		if (~inst[`SWAP] && ~inst[`CASA] && ~inst[`LDSTUB])
		begin
			DispPendReq(thid);
			if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
			begin
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ld response received from gasket which mismatches the request pending from this thread.", core_id, thid);
			end
			else
			begin
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ack response received from gasket which mismatches the request pending from this thread.", core_id, thid);
			end
		end
		else
		begin
		if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
		begin
			`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) Atomic ld response.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
		end
		else
		begin
			`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) Atomic ack.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
		end

		   if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
		   begin
			if (tmp[`L2_RESP] == 4'hC) tmp[`L2_RESP] = 4'hD; 
			else
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when atomic ld return pkt received from ccx.", core_id, thid);
			end
		  end
		  else
		  begin
			if (tmp[`L2_RESP] == 4'hD) tmp[`L2_RESP] = 4'hF; 
			else
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when atomic ack pkt received from ccx.", core_id, thid);
			end
		  end
		end
	end
	ld_pend_array[thid] = tmp;
end
endtask

task chk_ccx_st_response;
input [145:0] cpx_pkt;
reg [2:0] thid;
reg [20:0] inst;
reg [39:0] cpx_pa, inst_pa;
reg [204:0] tmp;
reg [3:0] pkt_type;
begin
	thid = cpx_pkt[`CPX_THR_ID];
	tmp = stb[{thid, ret_ptr[thid]}];
	inst = tmp[`LSU_MON_INST];
	inst_pa = tmp[`MEMOP_PA];
	pkt_type = cpx_pkt[`CPX_RTNTYP];


//is received. There could be some other store sitting in the STB at that time.

//Chk for squash bit only for non-bis responses.


	if (cpx_pkt[`CPX_BIS])  //response to rmo store
	begin
		if (st_rmo_cnt[thid] == 0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> L2 response received for an rmo store while the st_rmo_cnt for this thread is 0.", core_id, thid);
		end
		else
		begin
			st_rmo_cnt[thid] = st_rmo_cnt[thid] - 1'b1;
			`PR_INFO("lsu_mon", 25, "<C%0h> <T%0h> Store ack received for RMO store. rmo_cnt = %0d", core_id, thid, st_rmo_cnt[thid]);
		end
	end
	else
	begin
	   if (tmp[`ST_SQUASH])
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> L2 response received while the SQUASH bit is set in the STB entry %0h.", core_id, thid, ret_ptr[thid]);
	   
           if (~stb_valid[{thid, ret_ptr[thid]}])
           begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Store ack received while that entry is invalid in STB.", core_id, thid);
	   end
	   else
	   begin
	      if (~cpx_pkt[`CPX_ATM])  //don't print this message for atomic return
	      begin
		`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) STB[%0d] Store ack.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA], ret_ptr[thid]);
              end
	      tmp[`L2_ACK] = 1'b1;
	      stb[{thid, ret_ptr[thid]}] = tmp;
		ret_ptr[thid] = ret_ptr[thid] + 1'b1;
		//`PR_INFO("lsu_mon", 22, "<C%0h> <T%0h> ret_ptr = %0d.", core_id, thid, ret_ptr[thid]);
	   end
	end
end
endtask

task Chk_req_load;
input [129:0] pcx_pkt;
reg [2:0] thid;
reg [`LD_Pend_Width] tmp;
reg [39:0] pcx_pa, inst_pa;
reg [20:0] inst;
reg [11*8:0] req;
begin
	
	thid = pcx_pkt[`PCX_THR_ID];
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	pcx_pa = pcx_pkt[`PCX_ADDR];
	inst_pa = tmp[`MEMOP_PA];
	req = DispPCXReq(pcx_pkt);

	if (inst[`BLKLD])
	begin
		if (pcx_pa[39:6] != inst_pa[39:6])
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A load request made to gasket by LSU while the pending req has PA %0h.", core_id, thid, pcx_pa, tmp[`MEMOP_PA]);
		end
		if (pcx_pa[5:0] == 6'b0)
		begin
			if (tmp[`L2_ISS] != 4'h0 )
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 1st load request (pa[5:0] = 6'b0) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				tmp[`L2_ISS] = 4'h1;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 1st blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			end
				
		end
		if (pcx_pa[5:0] == 6'h10)
		begin
			if (tmp[`L2_ISS] != 4'h1)
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 2nd load request (pa[5:0] = 6'h10) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				tmp[`L2_ISS] = 4'h3;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 2nd blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			end
		end
		if (pcx_pa[5:0] == 6'h20)
		begin
			if (tmp[`L2_ISS] != 4'h3)
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 3rd load request (pa[5:0] = 6'h20) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				tmp[`L2_ISS] = 4'h7;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 3rd blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			end
		end
		if (pcx_pa[5:0] == 6'h30)
		begin
			if (tmp[`L2_ISS] != 4'h7)
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 4th load request (pa[5:0] = 6'h30) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 4th blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
				tmp[`L2_ISS] = 4'hF;
			end
		end
		ld_pend_array[thid] = tmp;
	end
	else if (Is_single_pcx_req_ld(inst)) 
	begin
	  if (tmp[`L2_ISS] == 4'hF)
	  begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Load request  made to gasket by LSU while this request has already been issued to gasket.", core_id, thid, pcx_pa);
	  end
	  else
	  begin
		tmp[`L2_ISS] = 4'hF;
		ld_pend_array[thid] = tmp;
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
	  end
	end
	else
	begin
		DispPendReq(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A load request made to gasket by LSU while there is no such ld request pending from this thread.", core_id, thid, pcx_pa);
	end
end
endtask

	
function Is_single_pcx_req_ld;
input [20:0] inst;
begin
	if (inst[`LDD] || inst[`QLD] || inst[`FSR_RD_WR] || (inst == 21'h1) || (inst == 21'h5))
		Is_single_pcx_req_ld = 1'b1;
	else
		Is_single_pcx_req_ld = 1'b0;
	//`PR_INFO("lsu_mon", 22, "<C%0h> Is_single_pcx_req_ld = %b. ", core_id, Is_single_pcx_req_ld);
end
endfunction
			          

function Is_trap;
input [2:0]tid;

begin
	Is_trap = 1'b0;
	case (`SPC4.lsu_trap_flush[7:0])
		8'h01: if (tid == 3'h0) Is_trap = 1'b1;
		8'h02: if (tid == 3'h1) Is_trap = 1'b1;
		8'h04: if (tid == 3'h2) Is_trap = 1'b1;
		8'h08: if (tid == 3'h3) Is_trap = 1'b1;
		8'h10: if (tid == 3'h4) Is_trap = 1'b1;
		8'h20: if (tid == 3'h5) Is_trap = 1'b1;
		8'h40: if (tid == 3'h6) Is_trap = 1'b1;
		8'h80: if (tid == 3'h7) Is_trap = 1'b1;
	endcase
end
endfunction

function [8*11:0] DispPCXReq;
input [129:0] pcx_pkt;
begin
	casex ({pcx_pkt[`PCX_RQTYP], pcx_pkt[`PCX_NC], pcx_pkt[`PCX_INV], pcx_pkt[`PCX_PF], pcx_pkt[`PCX_BIS]})
		{5'h0, 1'b1, 1'b0, 1'b1, 1'b0}: DispPCXReq = "PREF";
		{5'h0, 1'b1, 1'b1, 1'b1, 1'b0}: DispPCXReq = "PREF_ICE";
		{5'h0, 1'bx, 1'b0, 1'b0, 1'b0}: DispPCXReq = "LD";
		{5'h0, 1'bx, 1'b1, 1'b0, 1'b0}: DispPCXReq = "D";  
		{5'h10, 1'bx, 1'b0, 1'b0, 1'b0}: DispPCXReq = "I";
		{5'h10, 1'b0, 1'b1, 1'b0, 1'b0}: DispPCXReq = "I";
		{5'h1, 1'bX, 1'bX, 1'b0, 1'b0}: DispPCXReq = "ST";
		{5'h1, 1'bX, 1'bX, 1'b1, 1'b1}: DispPCXReq = "BLKST";
		{5'h1, 1'bX, 1'bX, 1'b0, 1'b1}: DispPCXReq = "BIS";
		{5'h2, 1'b1, 1'bX, 1'b0, 1'b0}: DispPCXReq = "CASA1";
		{5'h3, 1'b1, 1'bX, 1'b0, 1'b0}: DispPCXReq = "CASA2";
		{5'h7, 1'b1, 1'bX, 1'b0, 1'b0}: DispPCXReq = "SWAP_LDSTUB";
		{5'h4, 1'b1, 1'b0, 1'b0, 1'b0}: DispPCXReq = "STREAM_LD";
		{5'h5, 1'b1, 1'b0, 1'b0, 1'bx}: DispPCXReq = "STREAM_ST";
		{5'h8, 1'b1, 1'b0, 1'b0, 1'b0}: DispPCXReq = "MMU_LD";
		//{5'h9, 1'b0, 1'b0, 1'b0, 1'b0}: DispPCXReq = "INT";
		default:
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%0h> <T%0h> <%0h> Can't recognise the PCX pkt type. rq_type = %h, nc_bit = %0b, inv_bit = %0b, pf_bit = %0b, bis_bit = %0b. pcx_pkt[129:0] = %h",  core_id, pcx_pkt[`PCX_THR_ID], pcx_pkt[`PCX_ADDR], pcx_pkt[`PCX_RQTYP], pcx_pkt[`PCX_NC], pcx_pkt[`PCX_INV], pcx_pkt[`PCX_PF], pcx_pkt[`PCX_BIS], pcx_pkt);
			DispPCXReq = " ";
		end
	 endcase
end
endfunction

function IsExc;
input [2:0] core_id;
reg [21*8:0] DispExc;

begin
	DispExc = 170'b0;
	IsExc = 1'b0;

	if (`SPC4.lsu_align_b) DispExc = "Addr_not_aligned";
	if (`SPC4.lsu_lddf_align_b) DispExc = "LDDF_Addr_not_aligned";
	if (`SPC4.lsu_stdf_align_b) DispExc = "STDF_Addr_not_aligned";
	if (`SPC4.lsu_priv_action_b) DispExc = "Priv_actio";
	if (`SPC4.lsu_va_watchpoint_b) DispExc = "VA_watchpoint";
	if (`SPC4.lsu_pa_watchpoint_b) DispExc = "PA_watchpoint";
	//if (`SPC4.lsu_tlb_miss_b_) DispExc = "Tlb_miss";
	if (`SPC4.lsu_illegal_inst_b) DispExc = "Illegal_inst";
	if (`SPC4.lsu_daccess_prot_b) DispExc = "Data_access_prot_exc";
	if (`SPC4.lsu_dae_invalid_asi_b) DispExc = "Dae_Invalid_asi";
	if (`SPC4.lsu_dae_nc_page_b) DispExc = "Dae_nc_page";
	if (`SPC4.lsu_dae_nfo_page_b) DispExc = "Dae_NFO_page";
	if (`SPC4.lsu_dae_priv_viol_b) DispExc = "Dae_Priv_viol";
	if (`SPC4.lsu_dae_so_page) DispExc = "Dae_so_page";
	//if (`SPC4.lsu_perfmon_trap_b) DispExc = "Perf_mon_trap";
	if (`SPC4.lsu_dtmh_err_b) DispExc = "DTLB_data_par_err";
	if (`SPC4.lsu_dttp_err_b) DispExc = "DTLB_tag_par_err";
	if (`SPC4.lsu_dtdp_err_b) DispExc = "DTLB_data_par_err";

	
	if (DispExc != 0)
	begin
		IsExc = 1'b1;
		`PR_INFO("lsu_mon", 23, "<C%0h> <T%0h> <%0h> B_stage: %s(VA=%0h) ASI = %0h. %s Exception.",core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, asi_b, DispExc);
	end

end
endfunction

function Is_exu_error;
input [1:0] exu_lsu_va_error_b;     // VA error requiring a flush
input [1:0] exu_ecc_b;              // ECC error requiring a flush
reg err_b;
reg err_m;

begin
	err_b = dec_lsu_tid_b[2] ? (exu_ecc_b[1] | (exu_lsu_va_error_b[1] & ~`SPC4.lsu_tlb_bypass_b)):
				(exu_ecc_b[0] | (exu_lsu_va_error_b[0] & ~`SPC4.lsu_tlb_bypass_b));

	err_m = (dec_lsu_tid_b[2] ? `SPC4.exu_ecc_m[1] : `SPC4.exu_ecc_m[0]) & `SPC4.lsu.dcc.twocycle_b;
					
	Is_exu_error = err_b | err_m;
end
endfunction

/*
task Insert_tlb_miss_info;
reg [127:0] tmp;
begin
	tmp =  128'b0;
	if (tlb_valid[dec_lsu_tid_b])
	begin
		tmp = tlbmiss_pend_array[dec_lsu_tid_b];
		Disp_tlbmiss_pend_array_entry(dec_lsu_tid_b);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h>) A new tlb miss request received while there is already a Tlb miss request pending from this thread as shown above.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
	end
	else
	begin
		tlb_valid[dec_lsu_tid_b] <= 1'b1;
		tmp[`INST_VA] = inst_pc_b;
		tmp[`MEMOP_VA] = vaddr_b;
		tmp[`INST] = inst_b;
	end
	tlbmiss_pend_array[dec_lsu_tid_b] = tmp;
end
endtask

*/

//problem with the signal.
/*
always @ (negedge `SPC4.l2clk)
begin
	if (mmu_dtlb_reload_d2)
		Chk_dtlb_reload;
end

task Chk_dtlb_reload;
reg [2:0] thid;
reg [127:0] tmp;
begin
		if (`SPC4.tlu_trap_pc_0_valid)
			thid = {1'b0, `SPC4.tlu_trap_0_tid};
		else if (`SPC4.tlu_trap_pc_1_valid)
			thid = {1'b0, `SPC4.tlu_trap_1_tid};
		else 
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> mmu_dtlb_reload asserted but trap_pc_0_valid and trap_pc_1_valid are both 0", core_id);

		if (~tlb_valid[thid])
			`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> mmu_dtlb_reload asserted while tlb_valid is 0.", core_id, thid);
		else
		begin
			tmp = tlbmiss_pend_array[dec_lsu_tid_b];
			`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> %s(VA=%0h> DTLB reloaded for VA = %0h.", core_id, thid, tb_top.intf0.xlate(tmp[`INST]), tmp[`INST_VA], tmp[`MEMOP_VA] );
			tlb_valid[thid] = 1'b0;
		end
end
endtask
*/

task Insert_ld_miss_info;
reg [`LD_Pend_Width] tmp;
begin
	tmp = 213'b0;
	if (ld_valid[dec_lsu_tid_b])
	begin
		tmp =  ld_pend_array[dec_lsu_tid_b];
		DispPendReq(dec_lsu_tid_b);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h>) A new request received while there is already a request pending from this thread as shown above.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
	end
	else
	begin
		//ld_valid[dec_lsu_tid_b] <= 1'b1;
		tmp[`INST_VA] = inst_pc_b;
		tmp[`MEMOP_VA] = vaddr_b;
		tmp[`MEMOP_PA] = {`SPC4.lsu.tlb_pgnum[39:13], vaddr_b[12:0]};
		tmp[`INST_ASI] = asi_b;

		if (lsu_inst_b[`BLKLD])
		begin
			tmp[`L2_ISS] =  4'h0;
			tmp[`L2_RESP] =  4'h0;
			is_blkld[dec_lsu_tid_b] = 1'b1;
		end
		else
		begin
		   is_blkld[dec_lsu_tid_b] = 1'b0;
		   if (lsu_inst_b[`CASA])
			tmp[`L2_ISS] =  4'hC;
		   else
			tmp[`L2_ISS] =  4'hE;
		   if (lsu_inst_b[`SWAP] || lsu_inst_b[`LDSTUB] || lsu_inst_b[`CASA])
			tmp[`L2_RESP] =  4'hC;
		   else
			tmp[`L2_RESP] =  4'hE;

		end

		tmp[`INST] = inst_b;
		tmp[`LSU_MON_INST] = lsu_inst_b; 
		ld_pend_array[dec_lsu_tid_b] = tmp;
	end
end
endtask


task Insert_in_last_inst_array;
reg [135:0] tmp;
begin
	tmp = 128'b0;
	tmp[`INST_VA] = inst_pc_b;
	tmp[`MEMOP_VA] = vaddr_b;
	tmp[`INST] = inst_b;
	tmp[135:128] = asi_b;
	last_inst_array[dec_lsu_tid_b] = tmp;
end
endtask


task DispPendReq;
input [2:0] thid;
reg [`LD_Pend_Width] tmp;
begin
	
	tmp =  ld_pend_array[thid];
	`PR_ALWAYS("lsu_mon", `ALWAYS, "LD_PEND_ARRAY[%0h] Data.", thid);
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> <%0h> %s(VA=%0h). PA = %0h. L2_ISS = %0h. L2_RESP = %0h, LSU_MON_INST=%h.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA], tmp[`MEMOP_PA], tmp[`L2_ISS], tmp[`L2_RESP], tmp[`LSU_MON_INST]);
end
endtask

task Disp_STB_entry;
input [2:0] thid;
input [2:0] ptr;
reg [204:0] tmp;
begin
	
	tmp =  stb[{thid, ptr}];
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> STB[%0h] data.", core_id, thid, ptr);
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> <%0h> %s(VA=%0h). PA = %0h. L2_ISS = %0h. L2_ACK = %0h, LSU_MON_INST=%h. RMO = %0b", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA], tmp[`MEMOP_PA], tmp[`L2_ST_ISS], tmp[`L2_ACK], tmp[`LSU_MON_INST], tmp[`RMO]);
end
endtask

/*
		
task Disp_tlbmiss_pend_array_entry;
input [2:0] thid;
reg [127:0] tmp;
begin
	tmp = tlbmiss_pend_array[thid];
	`PR_INFO("lsu_mon", 23, "TLB_MISS_PEND_ARRAY[%0h] Data.", thid);
	`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h> %s(VA=%0h).", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);

end
endtask

*/
task Disp_CPX_pkt;
input [145:0] cpx_pkt;
begin
	`PR_ALWAYS("lsu_mon", `ALWAYS, "CPX_PKT data.");
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%0h> <T%0h> rtn_typ = %0h, err_bits = %0h, nc=%0b, atm = %0b, pf = %0b",  core_id, cpx_pkt[`CPX_THR_ID], cpx_pkt[`CPX_RTNTYP], cpx_pkt[`CPX_ERR], cpx_pkt[`CPX_NC], cpx_pkt[`CPX_ATM], cpx_pkt[`CPX_PF]);
end
endtask
	

task Make_STB_data;
reg [204:0] tmp;
begin
		tmp = 0;
		tmp[`INST_VA] = inst_pc_b;
		tmp[`MEMOP_VA] = vaddr_b;
		tmp[`MEMOP_PA] = {`SPC4.lsu.tlb_pgnum[39:13], vaddr_b[12:0]};
		tmp[`L2_ST_ISS] =  1'b0;
		tmp[`ASI_ST_ISS] =  1'b0;
		tmp[`L2_ACK] =  1'b0;
		tmp[`INST] = inst_b;
		tmp[`LSU_MON_INST] = lsu_inst_b;
		tmp[`ST_SQUASH] = 1'b0;
		tmp[`INST_ASI] = asi_b;
		if (`SPC4.lsu.tlu_lsu_hpstate_hpriv[dec_lsu_tid_b])
		   tmp[`ST_PRIV] = `HPRIV; 
		else if (`SPC4.lsu.tlu_lsu_pstate_priv[dec_lsu_tid_b])
		   tmp[`ST_PRIV] = `PRIV; 
		else
		   tmp[`ST_PRIV] = `USER; 
		//bis_asi to io space is not rmo

		tmp[`RMO] = lsu_inst_b[`BLKST] | (dec_altspace_b & Is_bis_asi(asi_b) & ~`SPC4.lsu.tlb_pgnum[39]);
		stb_alloc_data <= tmp;
end
endtask

task Insert_in_STB;
input [195:0] store_data;
input [2:0] thid;
begin
	if (stb_full(thid))
	begin
		//DispSTB(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> STB full and a new store received for insertion in STB.", core_id, thid);
	end
	else
	begin
		stb[{thid, wrptr[thid]}] = store_data;
		//Disp_STB_entry(thid, wrptr[thid]);
		`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h> %s(VA=%0h). STB[%0h] Inserted.", core_id, thid, store_data[`INST_VA], tb_top.intf0.xlate(store_data[`INST]), store_data[`MEMOP_VA], wrptr[thid]);
		stb_valid[{thid, wrptr[thid]}] = 1'b1;
		wrptr[thid] = wrptr[thid] + 1'b1;
		//`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> wrptr = %0d.", core_id, thid, wrptr[thid]);
	end
end
endtask

function stb_full;
input [2:0] thid;
begin
	if ((wrptr[thid] == rdptr[thid]) && stb_valid[{thid, wrptr[thid]}])
		stb_full = 1'b1;
	else
		stb_full = 1'b0;
end
endfunction
	

task Dealloc_STB;
input [2:0] thid;
reg [204:0] tmp;
reg [20:0] lsu_inst;
begin
	//thid = decode_tid(`SPC4.lsu_stb_dealloc);
	tmp = stb[{thid, rdptr[thid]}];
	lsu_inst = tmp[`LSU_MON_INST];
	if (~stb_valid[{thid, rdptr[thid]}])
	begin
		//DispSTB(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_dealloc = %0h asserted while the stb entry is invalid for that thid.", core_id, thid, `SPC4.lsu_stb_dealloc);
	end
	if (tmp[`L2_ST_ISS]) 
	begin
	    if (~tmp[`L2_ACK])
	    begin
		Disp_STB_entry(thid, rdptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_dealloc = %0h asserted when we haven't received the response from the gasket.", core_id, thid, `SPC4.lsu_stb_dealloc);
	    end
	end
	else if (tmp[`ASI_ST_ISS])
	begin
		ret_ptr[thid] = ret_ptr[thid] + 1'b1;
	end
	//blkst inst. is not issued anywhere, blkst helpers are issued.
	//in case of bis stores, lsu issues the dealloc in P3, i.e when the req is issued to PCX.
	//IF it is bis to cp sapce and there is an err then the store is issued to PCX with nd set
	// and deallocated.
	//However for ue onbis to IO space, dealloc is sent to IFU, issued on PCX with valid bit 0.
	//The sbdiou signal is sent in next cycle. We need to take bis io stores in this equation.
	else if (tmp[`ST_SQUASH] || lsu_inst[`BLKST] || (tmp[`RMO] & ~lsu_inst[`BLKST] & ~`SPC0.lsu.sbc.kill_store_p4_)) 
	begin
		iss_ptr[thid] = iss_ptr[thid] + 1'b1;
		ret_ptr[thid] = ret_ptr[thid] + 1'b1;
	end
	else 
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_dealloc = %0h asserted which is not issued to asi ring, or PCX or is not squashed.", core_id, thid, `SPC4.lsu_stb_dealloc);

	`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h>: %s(VA=%0h) PA = %0h. STB[%0d] Deallocated.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], tmp[`MEMOP_PA], rdptr[thid]);
	stb_valid[{thid, rdptr[thid]}] = 1'b0;
	rdptr[thid] = rdptr[thid] + 1'b1;
	//`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> rd_ptr = %0d.", core_id, thid, rdptr[thid]);
	/*
	if (tmp[`RMO])
		st_rmo_cnt[thid] = st_rmo_cnt[thid]  + 1'b1;
	*/
end
endtask

task Squash_STB;
input [2:0] thid;
reg [204:0] tmp;
reg [3:0] squash_cnt;
reg [2:0] i;
begin
	squash_cnt = 4'b0;
        if (ret_ptr[thid] != iss_ptr[thid])
	       `PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> lsu_block_store_kill asserted while the ret_ptr = %0h  != iss_ptr = %0h.", core_id, thid, tmp[`MEMOP_PA], ret_ptr[thid], iss_ptr[thid]);
        if (rdptr[thid] != iss_ptr[thid])
	       `PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> lsu_block_store_kill asserted while the rdptr = %0h  != iss_ptr = %0h.", core_id, thid, tmp[`MEMOP_PA], rdptr[thid], iss_ptr[thid]);

	if (iss_ptr[thid] == wrptr[thid])
	begin
	    if (stb_valid[{thid, wrptr[thid]}])
		squash_cnt = 8;
/* Lsu can assert both dealloc and block_store_kill for a request.
 *
	    else
	    begin
              	`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Lsu asserted block_store_kill while there are no valid entries in STB to be deallocated.", core_id, thid);
	    end
*/
	end
	else
	begin
	  if (iss_ptr[thid] < wrptr[thid])
		squash_cnt = wrptr[thid] - iss_ptr[thid];
	  else if (iss_ptr[thid] > wrptr[thid])
		squash_cnt = wrptr[thid] + (8 - iss_ptr[thid]);
	end

	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> SQUASH_STB:iss_ptr = %0h, wrptr = %0h, squash_cnt = %0h.", core_id, thid, iss_ptr[thid], wrptr[thid], squash_cnt);

	i = iss_ptr[thid];
       
       `PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Block store kill changed issue_ptr:%0h->%0h. ret_ptr: %0h->%0h. rdptr:%0h->%0h.", core_id, thid, iss_ptr[thid], iss_ptr[thid]+squash_cnt, ret_ptr[thid], ret_ptr[thid]+squash_cnt, rdptr[thid], rdptr[thid]+squash_cnt);

   	ret_ptr[thid] = ret_ptr[thid] + squash_cnt;
	rdptr[thid] = rdptr[thid] + squash_cnt;
        iss_ptr[thid] = iss_ptr[thid] + squash_cnt;
		
	while (squash_cnt)
	begin
	    tmp = stb[{thid, i}];
	    if (~stb_valid[{thid, i}])
	    begin
		//DispSTB(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h><PA = %0h> lsu_block_store_kill asserted while the stb entry %0h is invalid.", core_id, thid, tmp[`MEMOP_PA], i);
	    end
	    if (tmp[`L2_ST_ISS]) 
	    begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h>st_issue bit is set when the block_store_kill is asserted for stb entry %0h.", core_id, thid, tmp[`MEMOP_PA], i);
	    end
	    //commenting out the chk below. Lsu can assert sbdiou and then in the next cycle insert a new entry into
	    //stb. LSU will squash this new entry and won't issue it to PCX/asi but its squash bit won't be 
	    //set in the chkr which was causin it to fire. 
	    //if (~tmp[`ST_SQUASH]) 
	    //begin
	       //`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> lsu_block_store_kill asserted while the squash bit is 0 in the STB entry %0h.", core_id, thid, tmp[`MEMOP_PA], i);
	    //end
	    stb_valid[{thid, i}] = 1'b0; 

	    i = i + 1;
	    squash_cnt = squash_cnt - 1'b1;
	end

end
endtask

task Chk_store;
reg [2:0] thid;
reg [47:0] addr;
reg [3:0] i;
reg [204:0] tmp;
begin
	if ((bst_cnt > 0) && (`SPC4.lsu_stb_alloc == 8'b0))
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Blk store entries are not allocated back to back in STB.", core_id, bst_active_thid);

//For bst the stb is still written even though we have errors.
//Stb is written in W stage. Howvere for first blk store helper
//the err will be flagged by FGU in b stage. We can miss the
// err signal if we don't sample in B.
//for the last helper err will be signalled in B stage of last helper and at

	if (lsu_bst_active[bst_active_thid] & `SPC0.fgu_fst_ecc_error_fx2 & (bst_cnt < 7))
             bst_fgu_err = 1'b1;

	if (`SPC4.lsu_stb_alloc[7:0] != 8'b0)
	begin
		thid = decode_tid(`SPC4.lsu_stb_alloc[7:0]);
		if (store_alloc)
		begin
			if (thid != dec_lsu_tid_w)
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_alloc = %0h mismatches the thid %0h.", core_id, dec_lsu_tid_w, `SPC4.lsu_stb_alloc[7:0], dec_lsu_tid_w);
			Insert_in_STB(stb_alloc_data, dec_lsu_tid_w);
		end
		else 
		begin
		    if (lsu_bst_active[thid])
		    begin
			   if (bst_cnt == 0)
			   begin
				bst_data = bst_inst_data;
			   end
		           else
			   begin
				if (thid != bst_active_thid)
				begin
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_alloc = %0h mismatches the active blkstore thid = %0h.", core_id, bst_active_thid, `SPC4.lsu_stb_alloc[7:0], bst_active_thid);
				end

				addr = bst_data[`MEMOP_VA];

				bst_data[`MEMOP_VA] = {addr[47:6], bst_cnt[2:0], 3'b0};
				addr = bst_data[`MEMOP_PA];
				bst_data[`MEMOP_PA] = {addr[39:6], bst_cnt[2:0], 3'b0};
			   end
                                bst_cnt = bst_cnt + 1;
                                Insert_in_STB(bst_data, bst_active_thid);
                                if (bst_cnt == 8)
                                begin
                                        bst_cnt = 0;
                                        lsu_bst_active[thid] = 1'b0;
                                        if (bst_fgu_err) //set the squash bit to 0 for all the stb entries
                                        begin
                                          for (i = 0; i < 8; i=i+1)
                                          begin
                                             tmp = stb[{thid, i[2:0]}];
					     if (tmp[`ST_SQUASH])
						`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Squash bit already set when trying to set it for a bst fgu errerr.", core_id, thid, tmp[`MEMOP_PA]);
					     tmp[`ST_SQUASH] = 1'b1;
                                             stb[{thid, i[2:0]}] = tmp; 
                                             `PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <PA = %0h> STB_entry[%0h] squashed due to FGU err.", core_id, thid, tmp[`MEMOP_PA], i);
                                          end
                                        end
					bst_fgu_err = 1'b0;
                                end
			end
			else
				`PR_ERROR("lsu_mon", `ERROR, "<C%h>: LSU asserted lsu_stb_alloc  = %0h while no store pending to be written in STB.", core_id, `SPC4.lsu_stb_alloc[7:0]);
				
		end
	end
	else
	begin
		if (store_alloc)
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h> W_stage: LSU did not assert lsu_stb_alloc for the store.", core_id, dec_lsu_tid_w, inst_pc_w);
	end
end
endtask

task Chk_st_on_ASI_ring;
input ring;
reg [2:0] thid;
reg [7:0] asi;
reg [47:0] addr, act_addr;
reg [1:0] req_type;
reg [204:0] tmp;

begin
	if (ring == `LOCAL)
		thid =`SPC4.lsu_rngl_cdbus[58:56];
	else
		thid =`SPC4.lsu_rngf_cdbus[58:56];
	
	if (ring == `LOCAL)
		asi =`SPC4.lsu_rngl_cdbus[55:48];
	else
		asi =`SPC4.lsu_rngf_cdbus[55:48];
	
	if (ring == `LOCAL)
		addr =`SPC4.lsu_rngl_cdbus[47:0];
	else
		addr =`SPC4.lsu_rngf_cdbus[47:0];
	
	if (ring == `LOCAL)
		req_type =`SPC4.lsu_rngl_cdbus[61:60];
	else
		req_type =`SPC4.lsu_rngf_cdbus[61:60];
	

	tmp = stb[{thid, iss_ptr[thid]}];
	if (tmp[`ASI_ST_ISS])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store reissued on the ASI interface.", core_id, thid, addr);
	end
	
	if (tmp[`ST_SQUASH])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store issued on the ASI interface that has been squashed.", core_id, thid, addr);
	end

	act_addr  = tmp[`MEMOP_PA];
	act_addr = {act_addr[39:3], 3'b0};

	//47 is D tag rd asi. LSU issues that on the ring but changes 
	//the address.
	if ((addr == act_addr) || (asi == 8'h47) || (asi == 8'h46))  
	begin
		tmp[`ASI_ST_ISS] = 1'b1;
		stb[{thid, iss_ptr[thid]}] = tmp;
		if (ring == `LOCAL)
		begin
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued on local ring.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
		end
		else
		begin
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued on fast ring.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
		end
		iss_ptr[thid] = iss_ptr[thid] + 1'b1;
	end
	else
	begin
	   if (ring == `LOCAL)
	   begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] PA mismatch for asi req on local ring. Expected PA = %0h, actual PA = %0h", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid], tmp[`MEMOP_PA], addr);
	   end
	   else
	   begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] PA mismatch for asi req on fast ring. Expected PA = %0h, actual PA = %0h", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid], tmp[`MEMOP_PA], addr);
	  end
	end

end
endtask


task chk_store_issue_to_pcx;
input [129:0] pcx_pkt;
reg [2:0] thid;
reg [204:0] tmp;
reg [20:0] inst;
reg [39:0] pcx_pa, inst_pa;
begin
	thid = pcx_pkt[`PCX_THR_ID];
	tmp = stb[{thid, iss_ptr[thid]}];
	inst = tmp[`LSU_MON_INST];
	pcx_pa = pcx_pkt[`PCX_ADDR];
	inst_pa = tmp[`MEMOP_PA];
	
	if (pcx_pkt[`PCX_RQTYP] == `PCX_STORE)
	begin
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
	end
	if (pcx_pkt[`PCX_INV])
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued to gasket with ND set.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
		

	if (~inst[`ST])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A store request made to gasket by LSU while the pending req is not store.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end

/* CONFIRM WITH MARK
	if (pcx_pa[39:0] != inst_pa[39:0])
	begin
			Disp_STB_entry(thid, iss_ptr[thid]);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A store request made to gasket by LSU while the pending req has PA %0h.", core_id, thid, pcx_pkt[`PCX_ADDR], tmp[`MEMOP_PA]);
	end
*/
//enhancement req 100146
	if ((tmp[`INST_ASI] == 8'h73) & (pcx_pa[39:0] != {8'h90, core_id, thid, tmp[`INST_ASI], 18'h0})) 
	begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> pcx_pa is not correct for asi write to interrupt vector dispatch register.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end

	if (inst[`BLKST] && ~pcx_pkt[`PCX_BST])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Bst bit is not set in the PCX pkt by LSU for a blk st request.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end

	if (tmp[`L2_ST_ISS])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store reissued on the PCX interface.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end
	else
	        tmp[`L2_ST_ISS] =  1'b1;
	
	if (tmp[`ST_SQUASH])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store issued on the PCX interface that has been squashed.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end
	
	if (tmp[`RMO])
	begin
	   if (~pcx_pkt[`PCX_BIS])
	   begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> BIS bit is not set in the PCX pkt by LSU for an RMO store.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	   end
	   if (tmp[`L2_ACK])
	   begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> L2ack bit is set when the RMO store is issued to PCX.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	   end
	   else
	   begin
		tmp[`L2_ACK] = 1'b1;
		ret_ptr[thid] = ret_ptr[thid] + 1;  //this will be deallocated before 
						    //response seen from stub
		st_rmo_cnt[thid] = st_rmo_cnt[thid]  + 1'b1;
	   end
	end
	stb[{thid, iss_ptr[thid]}] = tmp;

	iss_ptr[thid] = iss_ptr[thid] + 1;
	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> iss_ptr = %0d. ret_ptr = %0d, st_rmo_cnt = %0d", core_id, thid, iss_ptr[thid], ret_ptr[thid], st_rmo_cnt[thid]);
end
endtask

`ifdef INJ_STB_ERR_IN_CMP


reg [2:0] err_tid, stb_err_tid_d1, stb_err_tid_d2;
reg [2:0] err_index, stb_err_index_d1, stb_err_index_d2;
reg [204:0] err_tmp ;
reg [20:0] err_inst;
reg [44:0] cam_data;
reg [5:0] err_bit;
integer err_inj_cnt;
reg cmp_stb_err_inj;
reg stb_err_inj, stb_err_inj_d1, stb_err_inj_d2;
reg [1:0] err_priv, stb_err_priv_d1, stb_err_priv_d2;

initial
begin
	cmp_stb_err_inj = 1'b0;

	cam_data = 45'b0;
	err_bit = 11;
	err_inj_cnt = 0;
	stb_err_inj = 0;
	if (("cmp_stb_err_inj_on"))
		cmp_stb_err_inj = 1'b1;
	else
		cmp_stb_err_inj = 1'b0;
end

always @ (negedge (`SPC4.l2clk & enabled & cmp_stb_err_inj))
begin //{
     //valid stb ram rd for issue to pcx
     stb_err_inj = 1'b0;
     if (`SPC4.lsu.sbc.ram_rptr_vld_2 & `SPC4.lsu.sbc.st_pcx_rq_p3 & `SPC4.lsu.pic.pic_st_sel_p3)
     begin //{
	err_tid = decode_tid(`SPC4.lsu.sbc.st_rq_sel_p3[7:0]);
	err_index = `SPC4.lsu.sbc.ram_rptr_d1;
	err_tmp = stb[{err_tid, err_index}];
	err_inst = err_tmp[`LSU_MON_INST];
	cam_data = `SPC4.lsu.stb_cam.cam_array.stb_rdata[44:0];
	err_priv = err_tmp[`ST_PRIV];
	//if (err_inst[`SWAP] || err_inst[`CASA] || err_inst[`LDSTUB])
	if (err_inst[`CASA])
	begin //{
	   err_inj_cnt = err_inj_cnt + 1;
	   if (err_inj_cnt == 10)
	   begin //{
	     case (err_bit)
	       11, 12: err_bit = err_bit + 1;
	       13: err_bit = 44;
	       44: err_bit = 11;
	      endcase
	      err_inj_cnt = 0;
	      stb_err_inj = 1'b1;

	      force `SPC0.lsu.stb_cam.cam_array.stb_rdata[44:0] = cam_data ^ (1 << err_bit);
	      `PR_INFO("stb_err", 22, "<T%0h> <%0h> STB[%0h]: SBAPP forced for CASA. err_bit = %0h", err_tid, {cam_data[44:8], 3'b0}, err_index, err_bit);
	      #1;
	      release `SPC0.lsu.stb_cam.cam_array.stb_rdata[44:0];
	   end  //}
	end //}
     end  //}
     if (stb_err_inj_d2)
     begin
	if (~`SPC4.lsu_sbapp_err_g)
	begin
	            `PR_ERROR("lsu_mon", `ERROR, "<T%0h> sbapp err not asserted when err is injected for atomic.", stb_err_tid_d2);
	end
	else
	begin
		if ((`SPC4.lsu_stberr_tid_g != stb_err_tid_d2) || 
		    (`SPC4.lsu_stberr_index_g != stb_err_index_d2) || 
		    (`SPC4.lsu_stberr_priv_g != stb_err_priv_d2))
		begin
	            `PR_ERROR("lsu_mon", `ERROR, "<T%0h> sbapp err parameters mismatch.", stb_err_tid_d2);
		end
	end
    end
    else
    begin
	if (`SPC4.lsu_sbapp_err_g)
	begin
	            `PR_ERROR("lsu_mon", `ERROR, "<T%0h> sbapp err asserted when none expected.", `SPC4.lsu_stberr_tid_g);
	end
    end

end  //}

	
always @ (posedge (`SPC4.l2clk & enabled & cmp_stb_err_inj))
begin
	stb_err_inj_d1 <= stb_err_inj;
	stb_err_inj_d2 <= stb_err_inj_d1;
	stb_err_tid_d1 <= err_tid;
	stb_err_tid_d2 <= stb_err_tid_d1;
	stb_err_index_d1 <= err_index;
	stb_err_index_d2 <= stb_err_index_d1;
	stb_err_priv_d1 <= err_priv;
	stb_err_priv_d2 <= stb_err_priv_d1;
end

`endif
`endif
`endif
endmodule

`endif
`ifdef CORE_5

module lsu_mon_c5;
`ifndef GATESIM

// If vcs_build_args NO_MONITORS, then module will be empty
`ifndef NO_MONITORS

reg imm_asi_vld_e;
reg [7:0] asi_e, imm_asi_e, asi_m, asi_b;
reg dec_altspace_e, dec_altspace_b, dec_altspace_m;
reg [1:0] exu_ecc_b;
reg [1:0] exu_lsu_va_error_b;
reg [2:0] dec_lsu_tid_e, dec_lsu_tid_m, dec_lsu_tid_b, dec_lsu_tid_w;
reg [47:0] inst_pc_e, inst_pc_m, inst_pc_b, inst_pc_w;
reg [31:0] inst_e, inst_m, inst_b;
reg [47:0] vaddr_m, vaddr_b;
reg [63:0] int_st_data_m, int_st_data_b;
reg [63:0] fp_st_sata_fx2;
reg [20:0] lsu_inst_e, lsu_inst_m, lsu_inst_b;
reg mmu_dtlb_reload_d1, mmu_dtlb_reload_d2;

reg [7:0] ld_valid;
reg [7:0] tlb_valid;
reg [`LD_Pend_Width] ld_pend_array[7:0];
reg [`LAST_INST_Pend_Width] last_inst_array[7:0];
reg [2:0] wrptr[7:0];  //Pts. to the STB entry into which data will be written next
reg [2:0] rdptr[7:0];  //Tracks the dealloc signal from STB
reg [2:0] iss_ptr[7:0];	//keeps track of when a store is issued from the STB to PCX
reg [2:0] ret_ptr[7:0]; //keeps track of when the response is received from 
			//the L2c.
reg [63:0] stb_valid;
reg [`STB_Pend_Width] stb[63:0];
//reg [`TLB_MISS_Pend_Width] tlbmiss_pend_array[7:0];

reg [7:0] pf_cnt[7:0];
reg [7:0] dcache_inv_cnt[7:0];
reg [7:0] st_rmo_cnt[7:0];

reg [55:0] print_inst;

reg [31:0] dec_tg0_inst_d, dec_tg1_inst_d;

reg [7:0] lsu_bst_active;
reg store_alloc;
reg [3:0] bst_cnt;
reg [195:0] stb_alloc_data;
reg [195:0] bst_data, bst_inst_data;
reg [2:0] bst_active_thid;
reg bst_fgu_err;
				
reg [7:0] is_blkld;  //reqd by lsu_ras_chkr to chk errors on blk ld.
reg [1:0] l2_blk_ld_errtype[7:0]; //Gives the type of err the ahd be reported by LSU if 
				 //different types of err occur on blk ld helper returns
reg [1:0] st_priv[7:0]; //Gives the final priv level for an sbdiou/sbapp err that shd be 
			//stored in DFESR

wire [2:0] core_id = 5;

integer i;
integer err_cnt;

reg enabled;
reg reset_in_middle;
reg [7:0] finish_mask;

initial
begin
    enabled = 0;
    reset_in_middle = 0;
	ld_valid = 8'b0;
	lsu_inst_e = 0;
	tlb_valid = 8'b0;
	for (i = 0; i < 8; i = i+1)
	begin
		pf_cnt[i] = 0;
		dcache_inv_cnt[i] = 0;
		wrptr[i] = 0;
		rdptr[i] = 0;
		iss_ptr[i] = 0;
		ret_ptr[i] = 0;
		st_rmo_cnt[i] = 0;
		is_blkld[i] = 1'b0;
		st_priv[i] = 2'b0;
		l2_blk_ld_errtype[i] = 2'b0;
	end
	lsu_bst_active = 8'b0;
	store_alloc = 1'b0;
	bst_cnt = 4'b0;
	stb_valid = 64'b0;

    // avoid time zero ugliness. jp
    //@(posedge `SPC0.l2clk);
    //@(negedge `SPC0.l2clk);
    //if (`PARGS.lsu_mon_on) enabled = 1;

    case (core_id)
	3'h0: finish_mask = `PARGS.finish_mask[7:0];
	3'h1: finish_mask = `PARGS.finish_mask[15:8];
	3'h2: finish_mask = `PARGS.finish_mask[23:16];
	3'h3: finish_mask = `PARGS.finish_mask[31:24];
	3'h4: finish_mask = `PARGS.finish_mask[39:32];
	3'h5: finish_mask = `PARGS.finish_mask[47:40];
	3'h6: finish_mask = `PARGS.finish_mask[55:48];
	3'h7: finish_mask = `PARGS.finish_mask[63:56];
    endcase
end

always @ (`TOP.in_reset)
begin
	if (~`TOP.in_reset & `PARGS.lsu_mon_on & ~reset_in_middle)
	begin
		enabled = 1'b1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "Lsu_mon on, in_reset = 0.");
	end
		

	if (`TOP.in_reset & enabled)
	begin
		reset_in_middle = 1'b1;
		enabled = 1'b0;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "Reset asserted in the middle of the diag. Turned off Lsu_mon.");
	end
end

always @ (posedge (tb_top.sim_status[0] & enabled))
begin //{
	if (|(ld_valid[7:0] & finish_mask[7:0]))
	begin  //{
	   for (i = 0; i < 8; i=i+1)
	   begin
		if (ld_valid[i])  
		begin
		   DispPendReq(i);
	        end
	   end
	  `PR_ERROR("lsu_mon", `ERROR, "<C%h> Ld requests pending at the end of simulation. ld_valid = %0h", core_id, ld_valid);
	end  //}
	if (|stb_valid[63:0])
	begin  //{
	   err_cnt = 0;
	   for (i = 0; i < 64; i=i+1)
	   begin
		if (stb_valid[i] & finish_mask[i[5:3]])  
		begin
		//chkr resets the stb valid bits when block_store_kill is asserted.
		//in couple of failures block_store_kill was sampled asserted two cycles after
		//lsu asserted stb_empty. The simulation ended the cycle stb_empty was sampled high 
		//causing moniotr firings with valid entries in stb at end of simulation. Now
		//don't flag an error if squash bit is set and stb_valid is asserted at end
		//of simualation.
		      if (~is_squash_bit_set(i[5:0]))
		      begin
			err_cnt = err_cnt + 1;
			Disp_STB_entry(i[5:3],i[2:0]);
		      end
		end
	   end
	   if (err_cnt)
	   begin
	  	`PR_ERROR("lsu_mon", `ERROR, "<C%h> Store requests pending at the end of simulation. stb_valid = %0h", core_id, stb_valid);
	   end
       end  //}
       err_cnt = 0;
       for (i = 0; i < 8; i=i+1)
       begin  //{
	   if (finish_mask[i] & (pf_cnt[i] != 0))
	   begin
		err_cnt = 1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> Prefetches not finished. Pf_cnt = %0d", core_id, i, pf_cnt[i]);
	   end
	   if (finish_mask[i] & (dcache_inv_cnt[i] != 0))
	   begin
		err_cnt = 1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> D pkt not received for all invalidate reqs. issued by the thread. dcache_inv_cnt = %0d", core_id, i, dcache_inv_cnt[i]);
	   end
	   if (finish_mask[i] & (st_rmo_cnt[i] != 0))  
	   begin
		err_cnt = 1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> rmo_cnt not zero. rmo_cnt = %0d", core_id, i, st_rmo_cnt[i]);
	   end
       end  //}
       if (err_cnt)
       begin
	  `PR_ERROR("lsu_mon", `ERROR, "<C%h> Prefetch/D/RMO_stores requests pending at the end of simulation.", core_id);
       end
end //}

function is_squash_bit_set;
input [5:0] index;
reg [204:0] tmp;
begin
	tmp = stb[index];
	if (tmp[`ST_SQUASH])
		is_squash_bit_set = 1'b1;
	else
		is_squash_bit_set = 1'b0;
end
endfunction


always @ (negedge (`SPC5.l2clk & enabled))
begin //{

	asi_e  = `SPC5.lsu.dcc.dcc_asi_e[7:0];

	lsu_inst_e[`LD] <= `SPC5.dec_ld_inst_e;
	lsu_inst_e[`ST] <= `SPC5.dec_st_inst_e;
	lsu_inst_e[`FP] <= `SPC5.dec_fpldst_inst_e;
	lsu_inst_e[`PREF] <= `SPC5.dec_pref_inst_e;
	lsu_inst_e[`SWAP] <= `SPC5.dec_swap_inst_e;
	lsu_inst_e[`CASA] <= `SPC5.dec_casa_inst_e;
	lsu_inst_e[`LDSTUB] <= `SPC5.dec_ldstub_inst_e;
	lsu_inst_e[`FLUSH] <= `SPC5.dec_flush_inst_e;
	lsu_inst_e[`MEMBAR] <= `SPC5.dec_memstbar_inst_e;
	lsu_inst_e[`LDD] <= `SPC5.dec_ld_inst_e & `SPC5.dec_ldst_dbl_e & ~`SPC5.dec_fpldst_inst_e;
	lsu_inst_e[`STD] <= `SPC5.dec_st_inst_e & `SPC5.dec_ldst_dbl_e & ~`SPC5.lsu.dec_fpldst_inst_e;

       lsu_inst_e[`BLKLD] <= `SPC5.dec_ld_inst_e & `SPC5.dec_fpldst_inst_e & dec_altspace_e & Is_blk_asi(asi_e);
	lsu_inst_e[`BLKST] <= `SPC5.dec_st_inst_e & `SPC5.dec_fpldst_inst_e & dec_altspace_e & Is_blk_asi(asi_e);
	lsu_inst_e[`QLD] <= `SPC5.dec_ld_inst_e & dec_altspace_e & Is_qld_asi(asi_e);
	lsu_inst_e[`ASR_RD_WR] <= `SPC5.dec_sr_inst_e & (`SPC5.dec_ld_inst_e | `SPC5.dec_st_inst_e);
	lsu_inst_e[`PR_RD_WR] <= `SPC5.dec_pr_inst_e & (`SPC5.dec_ld_inst_e | `SPC5.dec_st_inst_e);
	lsu_inst_e[`HPR_RD_WR] <= `SPC5.dec_hpr_inst_e & (`SPC5.dec_ld_inst_e | `SPC5.dec_st_inst_e);
	lsu_inst_e[`FSR_RD_WR] <= `SPC5.dec_fsr_ldst_e & (`SPC5.dec_ld_inst_e | `SPC5.dec_st_inst_e);
end //}

always @ (posedge (`SPC5.l2clk & enabled))
begin //{
	dec_tg0_inst_d <= `SPC5.dec.ded0.decode_mux[31:0];
	dec_tg1_inst_d <= `SPC5.dec.ded1.decode_mux[31:0];
	imm_asi_vld_e <= `SPC5.lsu.dec_imm_asi_vld_d;

	imm_asi_e <= `SPC5.lsu.dec_imm_asi_d;
	dec_altspace_e <= `SPC5.dec_altspace_d;
	dec_altspace_m <= dec_altspace_e;
	dec_altspace_b <= dec_altspace_m;

	exu_ecc_b <= `SPC5.exu_ecc_m;
	exu_lsu_va_error_b <= `SPC5.exu_lsu_va_error_m;

	dec_lsu_tid_e <= `SPC5.dec_lsu_tg_d ? {1'b1, `SPC5.dec_lsu_tid1_d} : {1'b0, `SPC5.dec_lsu_tid0_d}; 	
	dec_lsu_tid_m <= dec_lsu_tid_e;
	dec_lsu_tid_b <= dec_lsu_tid_m;
	dec_lsu_tid_w <= dec_lsu_tid_b;
	
	inst_pc_e <= `SPC5.dec_lsu_tg_d ? {`SPC5.tlu.tlu_pc_1_d[47:2], 2'b0} : {`SPC5.tlu.tlu_pc_0_d[47:2], 2'b0};
	inst_pc_m <= inst_pc_e;
	inst_pc_b <= inst_pc_m;
	inst_pc_w <= inst_pc_b;
	
	inst_e <= `SPC5.dec_lsu_tg_d ? dec_tg1_inst_d : dec_tg0_inst_d;
	inst_m <= inst_e;
	inst_b <= inst_m;

	vaddr_m <= `SPC5.exu_lsu_address_e;
	vaddr_b <= vaddr_m;

	int_st_data_m <= `SPC5.exu_lsu_store_data_e;
	int_st_data_b <= int_st_data_m;
	fp_st_sata_fx2 <= `SPC5.fgu_lsu_fst_data_fx1;

	mmu_dtlb_reload_d1 <= `SPC5.mmu_dtlb_reload;
	mmu_dtlb_reload_d2 <= mmu_dtlb_reload_d1;

	//pcx_thid_d1 <=  `SPC5.lsu.spc_pcx_data_pa[`PCX_THR_ID];
	lsu_inst_m <= lsu_inst_e;
	lsu_inst_b <= lsu_inst_m;

	asi_m <= asi_e;
	asi_b <= asi_m;
end //}

function Is_blk_asi;
input [7:0] asi;
begin
	Is_blk_asi = (asi == `ASI_BLK_AIUP) | (asi == `ASI_BLK_AIUS) | 
		   (asi == `ASI_BLK_AIUPL) | (asi == `ASI_BLK_AIUSL) |
		   (asi == `ASI_BLK_P) | (asi == `ASI_BLK_S) |
		   (asi == `ASI_BLK_PL) | (asi == `ASI_BLK_SL) |
		   (asi == `ASI_BLK_COMMIT_P) | (asi == `ASI_BLK_COMMIT_S);
end
endfunction

function Is_qld_asi;
input [7:0] asi;
begin
 		Is_qld_asi = (asi == `ASI_AIU_BIS_QUAD_LDD_P) | (asi == `ASI_AIU_BIS_QUAD_LDD_S) |
		(asi == `ASI_AIU_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_AIU_BIS_QUAD_LDD_S_LITTLE) |
		(asi == `ASI_NUCLEUS_BIS_QUAD_LDD) | (asi == `ASI_NUCLEUS_BIS_QUAD_LDD_LITTLE) |
		(asi == `ASI_BIS_QUAD_LDD_P) | (asi == `ASI_BIS_QUAD_LDD_S) |
		(asi == `ASI_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_BIS_QUAD_LDD_S_LITTLE) |
		(asi == `ASI_QUAD_LDD) | (asi == `ASI_QUAD_LDD_REAL) |
		(asi == `ASI_QUAD_LDD_L) | (asi == `ASI_QUAD_LDD_REAL_L);
end
endfunction

function Is_bis_asi;
input [7:0] asi;
begin
 		Is_bis_asi = (asi == `ASI_AIU_BIS_QUAD_LDD_P) | (asi == `ASI_AIU_BIS_QUAD_LDD_S) |
		(asi == `ASI_AIU_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_AIU_BIS_QUAD_LDD_S_LITTLE) |
		(asi == `ASI_NUCLEUS_BIS_QUAD_LDD) | (asi == `ASI_NUCLEUS_BIS_QUAD_LDD_LITTLE) |
		(asi == `ASI_BIS_QUAD_LDD_P) | (asi == `ASI_BIS_QUAD_LDD_S) |
		(asi == `ASI_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_BIS_QUAD_LDD_S_LITTLE);
end
endfunction

always @ (negedge (`SPC5.l2clk & enabled))
begin //{
	Chk_store;
	store_alloc = 1'b0;
	if (lsu_inst_m != 0)
	begin
		if (`SPC5.dec_flush_lm)
		begin
			lsu_inst_m <= 0;
			`PR_INFO("lsu_mon", 21, "<C%0h> <T%0h> <%0h> M_stage: %s(VA=%0h) Flushed due to IFU Flush.", core_id, dec_lsu_tid_m, inst_pc_m, tb_top.intf0.xlate(inst_m),vaddr_m);
		end
	end
		
	if (lsu_inst_b != 0)
	begin //{
		if (lsu_inst_b[`BLKLD])  print_inst = " BLKLD,";
		else if (lsu_inst_b[`BLKST])  print_inst = " BLKST,";
		else if (lsu_inst_b[`QLD])  print_inst = " QLD,";
		else  print_inst = "";

		if (`SPC5.dec_flush_lb)
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%0h> <T%0h> <%0h> B_stage: %s(VA=%0h) Flushed due to IFU Flush.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		else if (`SPC5.tlu_flush_lsu_b)
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h) Flushed due to TLU Flush.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		//casa is a two cycle operation. If there is an err on the 2nd cycle of casa then also
		//casa shd be killed.
		//This function will also chk for errors on 2nd cycle.
		else if (Is_exu_error(exu_lsu_va_error_b, exu_ecc_b))  
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h <%0h> B_stage: %s(VA=%0h) Flushed due to EXU error.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		else if ((`SPC5.fgu_cecc_fx2 || `SPC5.fgu_uecc_fx2) && lsu_inst_b[`ST] && lsu_inst_b[`FP]) 
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h) Flushed due to FGU error.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		else if (IsExc(core_id)) 
			lsu_inst_b <= 0;
		else if (!`SPC5.lsu_tlb_miss_b_)
		begin
			`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h)%s ASI = %0h. DTLB miss.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, asi_b);
				//Insert_tlb_miss_info;
		end
		else 
		begin //{
		//Lsu doesn't assert lsu_sync for an exception or dtlb miss. Since for
		//an exception tlu anyway tells the front end to flush itself there is 
		//no reason for LSU to flush the front end then TLU to flush it again.
		//Lsu treats the dtlbmiss as an exception that it flushes the  inst and
		//handles it when it is reissued by the front end.

		   if (`SPC5.lsu_tlb_bypass_b)
		   begin
			if (`SPC5.lsu_sync != 8'b0)
			begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. LSU_sync. DTLB Bypass.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC5.lsu.tlb_pgnum[39:13], vaddr_b[12:0]},  asi_b);
			end
			else
			begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. DTLB Bypass.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC5.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b);
			end
		  end
	          else
		  begin
			if (`SPC5.lsu_sync != 8'b0)
			begin
			  if (lsu_inst_b[`ST])
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h, Store_data = %0h. LSU_sync. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC5.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b,int_st_data_b);
			  end
			  else
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. LSU_sync. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC5.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b);
			  end
			end
			else
			begin
			  if (lsu_inst_b[`ST])
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h, Store_data = %0h. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC5.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b, int_st_data_b);
			  end
			  else
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC5.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b);
		          end
		        end
		  end

	          if (lsu_inst_b[`LD] || lsu_inst_b[`PREF] || lsu_inst_b[`SWAP] || lsu_inst_b[`CASA] || lsu_inst_b[`LDSTUB])
		  begin //{
			if (((lsu_inst_b == 16'h1) || (lsu_inst_b == 16'h5)) & `SPC5.lsu.stb_cam_hit)
			begin
				`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h>: LSU_sync asserted due to STB RAW.", core_id, dec_lsu_tid_b, inst_pc_b);
			end
		  end //}

		  if (lsu_inst_b[`LD])
			Insert_ld_miss_info;

		  if (lsu_inst_b[`ST])  //for atomics both ld and store signals are asserted
		  begin
			Make_STB_data;
			store_alloc = 1'b1;
		  end
		  Insert_in_last_inst_array;

		if (`SPC5.lsu_trap_flush[7:0])
		begin
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h> Trap Flush asserted.", core_id, decode_tid(`SPC5.lsu_trap_flush[7:0]));
		end
	    end //}
	end //}
end //}

//STB ue testing:
//This is how we test squashing of stores by LSU_mon:
//Whenever lsu asserts err_sbdiou signal, the monitor sets the squash
//bit in the STB for the rest of the stores. If any of these squashed stores
//is issued on the asi ring or to the PCX interface the monitor complains.
//The squashed stores are deallocated when either a block_store_kill is
//asserted or dealloc signals are asserted by the LSU.
//When the block_store_kill is asserted, it tells the IFU to dealloc
//all the pending stores in the IFU. It means the when block_store_kill
//is asserted we have deallocated all the non-squashed requests from STB.
//The 0in_chkr ensures that LSU flags the correct index and priv with the
//the sbdiou signal to TLU.


always @ (negedge (`SPC5.l2clk & enabled))
begin
	if (`SPC5.lsu_l15_valid & `SPC5.lsu.spc_pcx_data_pa[129])
		Chk_pcx_req_pkt(`SPC5.lsu.spc_pcx_data_pa[129:0]);  //chk if we need .lsu here
	if ((`SPC5.lsu_rngl_cdbus[64:63] == 2'b11) & ~`SPC5.lsu_rngl_cdbus[59])
		Chk_st_on_ASI_ring(`LOCAL);

	if ((`SPC5.lsu_rngf_cdbus[64:63] == 2'b11) & ~`SPC5.lsu_rngf_cdbus[59])
		Chk_st_on_ASI_ring(`FAST);

	//if (`SPC5.l15_lsu_valid)
		//Chk_cpx_response_pkt({`SPC5.l15_lsu_valid, `SPC5.l15_lsu_cpkt[17:13],`SPC5.l15_lsu_cpkt[11:0],`SPC5.l15_spc_data1[127:0]});
	
	if (`SPC5.cpx_spc_data_cx[145])
		Chk_cpx_response_pkt(`SPC5.cpx_spc_data_cx);
	
	if (`SPC5.lsu_complete[7:0] != 8'b0)
	begin
		if (`SPC5.lsu_complete[0]) Chk_ld_complete(0);
		if (`SPC5.lsu_complete[1]) Chk_ld_complete(1);
		if (`SPC5.lsu_complete[2]) Chk_ld_complete(2);
		if (`SPC5.lsu_complete[3]) Chk_ld_complete(3);
		if (`SPC5.lsu_complete[4]) Chk_ld_complete(4);
		if (`SPC5.lsu_complete[5]) Chk_ld_complete(5);
		if (`SPC5.lsu_complete[6]) Chk_ld_complete(6);
		if (`SPC5.lsu_complete[7]) Chk_ld_complete(7);
	end
	
	if (`SPC5.lsu_block_store_kill[7:0] != 8'b0)
	begin
		if (`SPC5.lsu_block_store_kill[0]) Squash_STB(0);
		if (`SPC5.lsu_block_store_kill[1]) Squash_STB(1);
		if (`SPC5.lsu_block_store_kill[2]) Squash_STB(2);
		if (`SPC5.lsu_block_store_kill[3]) Squash_STB(3);
		if (`SPC5.lsu_block_store_kill[4]) Squash_STB(4);
		if (`SPC5.lsu_block_store_kill[5]) Squash_STB(5);
		if (`SPC5.lsu_block_store_kill[6]) Squash_STB(6);
		if (`SPC5.lsu_block_store_kill[7]) Squash_STB(7);
	end
	
	if (`SPC5.lsu_stb_dealloc[7:0] != 8'b0)
	begin
		if (`SPC5.lsu_stb_dealloc[0]) Dealloc_STB(0);
		if (`SPC5.lsu_stb_dealloc[1]) Dealloc_STB(1);
		if (`SPC5.lsu_stb_dealloc[2]) Dealloc_STB(2);
		if (`SPC5.lsu_stb_dealloc[3]) Dealloc_STB(3);
		if (`SPC5.lsu_stb_dealloc[4]) Dealloc_STB(4);
		if (`SPC5.lsu_stb_dealloc[5]) Dealloc_STB(5);
		if (`SPC5.lsu_stb_dealloc[6]) Dealloc_STB(6);
		if (`SPC5.lsu_stb_dealloc[7]) Dealloc_STB(7);
	end

	if (`SPC5.lsu_block_store_stall)
	      Chk_block_store;

	if (`SPC5.lsu.lsu_block_store_alloc[7:0] != 8'b0)
		Set_block_store_parameters;

	if (`SPC5.lsu_sbdiou_err_g || `SPC5.lsu_sbapp_err_g)
		Squash_store;

	if (`SPC5.lsu_stb_flush_g)
		st_priv[`SPC5.lsu_stberr_tid_g] = get_priv_on_flush(`SPC5.lsu_stberr_tid_g);
end

function [1:0] get_priv_on_flush;
input [2:0] tid;
reg [2:0] sq_index;
reg [204:0] tmp;

begin
	sq_index = `SPC5.lsu_stberr_index_g;
	tmp = stb[{tid, sq_index}];
	get_priv_on_flush = tmp[`ST_PRIV];
end
endfunction

task Chk_block_store;
reg [20:0] inst;
reg [2:0] thid;
begin
		thid = `SPC5.lsu_block_store_tid;
		bst_inst_data = stb[{thid, rdptr[thid]}];
		inst = bst_inst_data[`LSU_MON_INST];

		if (~inst[`BLKST])
		begin
			Disp_STB_entry(thid, iss_ptr[thid]);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted blk_store_stall while the req at the top of STB is not blkst as shown above", core_id, thid);
		end
end
endtask

//lsu can assert block_store_stall for a new block store while it has not yet written
//the 8 stb entries from the previous blk store.

task Set_block_store_parameters;
reg [2:0] thid;
begin
	
		thid = decode_tid(`SPC5.lsu.lsu_block_store_alloc[7:0]);
		if (lsu_bst_active[thid])
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted blk_store_alloc while the bst_active is already set for this thread.", core_id, thid);
		end
		else
		begin
			lsu_bst_active[thid] = 1'b1;
			bst_active_thid = thid;
			if (`SPC5.lsu.fgu_fst_ecc_error_fx2)
			    bst_fgu_err = 1'b1;
			else
			    bst_fgu_err = 1'b0;
		end
end
endtask

task Squash_store;
reg [2:0] thid;
reg [2:0] sq_index;
reg [2:0] i;
reg [204:0] tmp;
reg [3:0] squash_cnt;
reg [1:0] priv;

begin
	thid = `SPC5.lsu_stberr_tid_g;
	sq_index = `SPC5.lsu_stberr_index_g;
	priv = `SPC5.lsu_stberr_priv_g;
	tmp = stb[{thid, sq_index}];
	squash_cnt = 0;
     	`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Sbdiou/sbapp seen for index = %h and priv = %h.", core_id, thid, sq_index,  priv);

	st_priv[thid] = tmp[`ST_PRIV];

	//lsu can assert deallocate before it asserts the sbdiou signal. 
	//In that case iss_ptr won't be equal to sbdiou index.
	//if (sq_index != iss_ptr[thid])
	//begin
	//	Disp_STB_entry(thid, iss_ptr[thid]);
	//	`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted sbdiou/sbapp with index %0h while the next req to be issued is at index %0h.", core_id, thid, sq_index, iss_ptr[thid]);
	//end
	
	//If there is only one store in the store buffer which gets an sbdiou error, then LSU can deallocate
	//the store and then assert sbdiou. The deallocation will cause the stb issue_ptr to move 
	//forward to an inst. that has already been issued and completed and this chk can fire. So
	//removing this chk. 

        //if (tmp[`L2_ST_ISS])
        //begin
         //       Disp_STB_entry(thid, iss_ptr[thid]);
          //      `PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store reissued on the PCX interface.", core_id, thid, tmp[`MEMOP_PA]);
        //end

	if (iss_ptr[thid] == wrptr[thid])
	begin
	    if (stb_valid[{thid, wrptr[thid]}])
		squash_cnt = 8;
	    else
	    begin
	    //changing it to an info message because if there is only one valid entry in store buffer that
	    //gets an sbdiou then LSU can deallocate the entry and then issue sbdiou.
              	//`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Lsu asserted sbdiou/sbapp while there are no valid entries in STB to be issued.", core_id, thid);
              	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> sbdiou/sbapp squashed only one entry in STB.", core_id, thid);
	    end
	end
	else
	begin
	  if (iss_ptr[thid] < wrptr[thid])
		squash_cnt = wrptr[thid] - iss_ptr[thid];
	  else if (iss_ptr[thid] > wrptr[thid])
		squash_cnt = wrptr[thid] + (8 - iss_ptr[thid]);
	end
	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> SQUASH_STORE:iss_ptr = %0h, wrptr = %0h, squash_cnt = %0h.", core_id, thid, iss_ptr[thid], wrptr[thid], squash_cnt);

	i = iss_ptr[thid];
		
	while (squash_cnt)
	begin
		tmp = stb[{thid, i}];
		tmp[`ST_SQUASH] = 1'b1;
		if (priv < tmp[`ST_PRIV])
		begin
              		`PR_INFO("lsu_mon", `INFO, "<C%h> <T%0h> <PA = %0h> Sbdiou/sbapp signalled. Err in user/priv level store is squashing a higher priv level store.", core_id, thid, tmp[`MEMOP_PA]);
			priv = tmp[`ST_PRIV];
		end
			
		stb[{thid, i}] = tmp;
               	`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <PA = %0h> STB_entry[%0h] squashed.", core_id, thid, tmp[`MEMOP_PA], i);
	   	 
		 i = i + 1;
		 squash_cnt = squash_cnt - 1'b1;
	end
end
endtask

function [2:0] decode_tid;
input [7:0] thid_encode;
begin
	case (thid_encode)
	   8'h1: decode_tid = 3'b0;
	   8'h2: decode_tid = 3'h1;
	   8'h4: decode_tid = 3'h2;
	   8'h8: decode_tid = 3'h3;
	   8'h10: decode_tid = 3'h4;
	   8'h20: decode_tid = 3'h5;
	   8'h40: decode_tid = 3'h6;
	   8'h80: decode_tid = 3'h7;
	   default: 
	   begin
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> decode_tid. Incorrect value of thid input = %0h.", core_id, thid_encode, thid_encode);
	   end
	endcase
end
endfunction

task Chk_ld_complete;
input [2:0] thid;
reg [`LD_Pend_Width] tmp;
begin
	tmp = ld_pend_array[thid];

	if (ld_valid[thid])
	begin
		if ((tmp[`L2_ISS] != 4'hf) || (tmp[`L2_RESP] != 4'hf))
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted lsu_complete while the l2_iss and l2_resp bits are not F.", core_id, thid);
		end
		ld_valid[thid] = 1'b0;
		`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h> %s(VA=%0h) Complete. Setting ld_valid to 0.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
	end

	tmp = last_inst_array[thid];
	`PR_INFO("lsu_mon", 24, "<C%h> <T%0h> <%0h> %s(VA=%0h) Complete.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
end
endtask
	
task Chk_pcx_req_pkt;
input [129:0] pcx_pkt;
reg [2:0] thid;
reg [`LD_Pend_Width] tmp, tmp1; 
reg [15:0] inst; 
reg [11*8:0] req;
reg [39:0] addr;
begin 
	thid = pcx_pkt[`PCX_THR_ID]; 
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	req = DispPCXReq(pcx_pkt);
	addr = pcx_pkt[`PCX_ADDR];


	if (pcx_pkt[`PCX_CPU_ID] != core_id)
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> cpu_id (spc_pcx_data_pa[122:120]) = %h is not = %0h when the lsu made a %s req to gasket.", core_id, pcx_pkt[`PCX_THR_ID], addr, pcx_pkt[122:120], core_id, req);
	
	
	if ((pcx_pkt[`PCX_RQTYP] == `PCX_LOAD) || (pcx_pkt[`PCX_RQTYP] == `PCX_CAS1) || (pcx_pkt[`PCX_RQTYP] == `PCX_CAS2) || (pcx_pkt[`PCX_RQTYP] == `PCX_SWAP_LDSTUB))
	begin
	  if (~ld_valid[thid])
	  begin
		ld_valid[thid] = 1'b1;  //we have sent a req to gasket and are waiting for response
		`PR_INFO("lsu_mon", 22, "<C%0h> <T%0h> Setting ld_valid[%0h].", core_id, thid, thid);
	  end
		if (~inst[`BLKLD])
		begin
			if (tmp[`MEMOP_PA] != addr)
			begin
				if ((tmp[`INST_ASI] == 8'h41) || (tmp[`INST_ASI] == 8'h73) || ((tmp[`INST_ASI] == 8'h45) && ((tmp[`MEMOP_PA] == 8'h10) || (tmp[`MEMOP_PA] == 8'h18))))
				begin
					`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <PA = %0h> PA mismatch on gasket for %s request. Ignoring the mismatch as inst. is issued with asi 41, 73 or 45 (with VA 0x10 or 18).", core_id, thid, addr, req);
				end
				else
				begin
					DispPendReq(thid);
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A %s request made to gasket by LSU while the pending req is with PA %0h.", core_id, thid, addr, req, tmp[`MEMOP_PA]);
				end
			end
		end
	end

	case (pcx_pkt[`PCX_RQTYP])
	   `PCX_LOAD: 
	   begin
		if (pcx_pkt[`PCX_PF])
		begin
			if (~inst[`PREF])
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A prefetch request made to gasket by LSU which mismatches the pending request from the thread.", core_id, thid, addr);
			end
			if (pcx_pkt[`PCX_INV])
			begin
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: PREF_ICE(VA=%0h) Issued. pf_cnt not updated.", core_id, thid, tmp[`INST_VA], tmp[`MEMOP_VA]);
			end
			else
			begin
			 	pf_cnt[thid] = pf_cnt[thid] + 1'b1;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Issued. pf_cnt = %0d.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], pf_cnt[thid]);
			end
			tmp[`L2_ISS] = 4'hF;
			tmp[`L2_RESP] = 4'hF; //we don't wait for a prefetch response from gasket
			ld_pend_array[thid] = tmp;
		end
		else 
		begin
			if (pcx_pkt[`PCX_INV])
			begin
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Dcache invalidate pkt issued to CCX.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
				dcache_inv_cnt[thid] = dcache_inv_cnt[thid] + 1'b1;
			end
			else
			begin
				Chk_req_load(pcx_pkt);
			end
		end
	    end
           `PCX_CAS1, `PCX_CAS2:
	   begin
		if (~inst[`CASA])
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> CASA request made to gasket by LSU while no such request request is pending from this thread.", core_id, thid, addr);
		end
		if (pcx_pkt[`PCX_RQTYP] == `PCX_CAS1)
		begin
			tmp[`L2_ISS] = 4'hE;
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) (CAS1) Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			ld_pend_array[thid] = tmp;
		end
		if (pcx_pkt[`PCX_RQTYP] == `PCX_CAS2)
		begin
			tmp[`L2_ISS] = 4'hF;
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) (CAS2) Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			ld_pend_array[thid] = tmp;
			chk_store_issue_to_pcx(pcx_pkt);
		end
		
	   end
	   `PCX_SWAP_LDSTUB:
	   begin
		if (~inst[`SWAP] && ~inst[`LDSTUB])
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> %s request made to gasket by LSU while no such request request is pending from this thread.", core_id, thid, addr, req);
		end
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Issued to gasket. store_data = %0h", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], pcx_pkt[`PCX_DATA]);
		tmp[`L2_ISS] = 4'hF;
		ld_pend_array[thid] = tmp;
		
		chk_store_issue_to_pcx(pcx_pkt);
	   end

	    `PCX_STORE:
	    begin
		chk_store_issue_to_pcx(pcx_pkt);
	    end
	   
	   default: `PR_INFO("lsu_mon", 21, "<C%h> <T%0h> <%0h>: %s Issued to gasket.", core_id, thid, addr, req);
	endcase
end
endtask

task Chk_cpx_response_pkt;
input [145:0] cpx_pkt;
reg [2:0] thid;
begin
	thid = cpx_pkt[`CPX_THR_ID];	

	casex ({cpx_pkt[`CPX_RTNTYP], cpx_pkt[`CPX_ERR], cpx_pkt[`CPX_NC], cpx_pkt[`CPX_ATM], cpx_pkt[`CPX_PF]})
	  {4'b0, 2'bxx, 1'bx, 1'b0, 1'b0}:  
	  begin
		chk_ccx_ld_response(cpx_pkt);
	  end

	  {4'b0, 2'bxx, 1'b1, 1'b0, 1'b1}:  
	  begin
		if (pf_cnt[thid] == 8'b0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Prefetch response received from gasket while the pf_cnt is 0 for this thread.", core_id, thid);
		end
		else
		begin
			pf_cnt[thid] = pf_cnt[thid] - 1'b1;
			`PR_INFO("lsu_mon", 26, "<C%h> <T%0h> Prefetch response received. pfcnt = %0d.", core_id, thid, pf_cnt[thid]);
		end
	  end
	  
	  {4'h8, 2'bxx, 1'b1, 1'b0, 1'b0}:  
		chk_ccx_ld_response(cpx_pkt);

	  {4'h4, 2'bxx, 1'bx, 1'b0, 1'b0}:  
	   begin
	      if (cpx_pkt[123])  //D pkt
	      begin //{
		if (cpx_pkt[120:118] != core_id)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> D response received from gasket with core_id =%h.", core_id, thid, cpx_pkt[120:118]);
		end
		if (dcache_inv_cnt[thid] == 8'b0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> D response received from gasket while the Dcache_inv_cnt is 0 for this thread.", core_id, thid);
		end
		else
		begin
			dcache_inv_cnt[thid] = dcache_inv_cnt[thid] - 1'b1;
			`PR_INFO("lsu_mon", 26, "<C%h> <T%0h> D response received. Dcache_inv_cnt = %0d.", core_id, thid, dcache_inv_cnt[thid]);
		end
	     end  //}
	     else if (cpx_pkt[124])  //I pkt
	     begin
		if (cpx_pkt[120:118] != core_id)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> I response received from gasket with core_id =%h.", core_id, thid, cpx_pkt[120:118]);
		end
		//`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> I pkt.", core_id, thid);
	     end
	     else if (cpx_pkt[124:123] == 2'b0)
	     begin
		if (cpx_pkt[120:118] == core_id)
		begin
			chk_ccx_st_response(cpx_pkt);
	        end
		else
		begin
			`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Store Ack pkt received from core %0h.", core_id, thid, cpx_pkt[120:118]);
		end
	     end
	   end

	  {4'h1, 2'bxx, 1'bx, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> IFILL1 return.", core_id, thid);
	  {4'h1, 2'bxx, 1'bx, 1'b1, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> IFILL2 return.", core_id, thid);
	  {4'h9, 2'bxx, 1'b1, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> NCU IFILL return.", core_id, thid);
	  
	  {4'b0, 2'bxx, 1'b1, 1'b1, 1'b0}:  
	  begin
		chk_ccx_atm_response(cpx_pkt);
	  end
	  {4'h4, 2'bxx, 1'b1, 1'b1, 1'b0}:  
	  begin
		if ((cpx_pkt[`CPX_RTNTYP] == 4'h4) & (cpx_pkt[120:118] == core_id))
		begin
			chk_ccx_atm_response(cpx_pkt);
			chk_ccx_st_response(cpx_pkt);
		end
	  end
			
	  {4'h2, 2'bxx, 1'b1, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Stream Ld return.", core_id, thid);
	  {4'h6, 2'bxx, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Stream store Ack.", core_id, thid);
	  {4'h5, 2'bxx, 1'b1, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> MMU ld return.", core_id, thid);
	  {4'h7, 2'b00, 1'b0, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Interrupt return.", core_id, thid);
	  {4'h3, 2'b00, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Eviction Invalidation.", core_id, thid);
	  {4'hc, 2'bxx, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> L2 Indication.", core_id, thid);
	  
	  {4'hd, 2'bxx, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Soc Error Indication.", core_id, thid);
	   
	  default:
	  begin
		`PR_ALWAYS("lsu_mon", `ALWAYS, "CPX_PKT data.");
		`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%0h> <T%0h> rtn_typ = %0h, err_bits = %0h, nc=%0b, atm = %0b, pf = %0b",  core_id, cpx_pkt[`CPX_THR_ID], cpx_pkt[`CPX_RTNTYP], cpx_pkt[`CPX_ERR], cpx_pkt[`CPX_NC], cpx_pkt[`CPX_ATM], cpx_pkt[`CPX_PF]);

		`PR_ERROR("lsu_mon", `ERROR, "<C%0h> <T%0h> Can't recognise the CPX pkt.",  core_id, thid);
	  end

	endcase
end
endtask

task chk_ccx_ld_response;
input [145:0] cpx_pkt;
reg [2:0] thid;
reg [20:0] inst;
reg [39:0] cpx_pa, inst_pa;
reg [`LD_Pend_Width] tmp;
reg [3:0] pkt_type;
begin
	thid = cpx_pkt[`CPX_THR_ID];
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	inst_pa = tmp[`MEMOP_PA];
	pkt_type = cpx_pkt[`CPX_RTNTYP];

	   if (ld_valid[thid])
	   begin 
			`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) L2 response.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
		/* 
			if (inst_pa[39] != pkt_type[3])
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> ccx pkt_type = %h mismatches the ld_pa bit 39. ld_pa = %0h.", core_id, thid, pkt_type, inst_pa);
			end
		*/

			if (inst[`BLKLD])
			begin
				if (tmp[`L2_RESP] == 4'h0) 
				begin
					tmp[`L2_RESP] = 4'h1; 
					tmp[`L2_ERR0] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 1.", core_id, thid);
					end

				end
				else if (tmp[`L2_RESP] == 4'h1) 
				begin
					tmp[`L2_RESP] = 4'h3; 
					tmp[`L2_ERR1] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 2.", core_id, thid);
					end
				end
				else if (tmp[`L2_RESP] == 4'h3) 
				begin
					tmp[`L2_RESP] = 4'h7; 
					tmp[`L2_ERR2] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 3.", core_id, thid);
					end
				end
				else if (tmp[`L2_RESP] == 4'h7) 
				begin
					tmp[`L2_RESP] = 4'hF; 
					tmp[`L2_ERR3] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 4.", core_id, thid);
					end

					//is_blkld[thid] = 1'b1;
					if ((tmp[`L2_ERR0] == `ND) || (tmp[`L2_ERR1] == `ND) || (tmp[`L2_ERR2] == `ND) ||  (tmp[`L2_ERR3] == `ND))
						l2_blk_ld_errtype[thid] = `ND;
					else if ((tmp[`L2_ERR0] == `UE) || (tmp[`L2_ERR1] == `UE) || (tmp[`L2_ERR2] == `UE) ||  (tmp[`L2_ERR3] == `UE))
						l2_blk_ld_errtype[thid] = `UE;
					else if ((tmp[`L2_ERR0] == `CE) || (tmp[`L2_ERR1] == `CE) || (tmp[`L2_ERR2] == `CE) ||  (tmp[`L2_ERR3] == `CE))
						l2_blk_ld_errtype[thid] = `CE;
					else 
						l2_blk_ld_errtype[thid] = `NE;
				end
				else
				begin
					DispPendReq(thid);
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when response pkt received from ccx.", core_id, thid);
				end
			end
			else if (Is_single_pcx_req_ld(inst)) 
			begin
				//is_blkld[thid] = 1'b0;
				if (tmp[`L2_RESP] != 4'hE)
				begin
					DispPendReq(thid);
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when response pkt received from ccx.", core_id, thid);
				end
				//`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Setting L2_resp bits to F.", core_id, thid);
				tmp[`L2_RESP] = 4'hF;
			end
			else
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Load response received from gasket for thid %h while no load request pending from core for this thread.", core_id, thid, thid);
	     end
	     else
	     begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Load response received from gasket while no load request pending from core for this thread.", core_id, thid);
	     end

	ld_pend_array[thid] = tmp;
end
endtask

task chk_ccx_atm_response;
input [145:0] cpx_pkt;
reg [2:0] thid;
reg [20:0] inst;
reg [39:0] inst_pa;
reg [`LD_Pend_Width] tmp;
begin
	thid = cpx_pkt[`CPX_THR_ID];
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	inst_pa = tmp[`MEMOP_PA];

	if (~ld_valid[thid])
	begin
		if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ld response received from gasket while no request pending from core for this thread.", core_id, thid);
		end
		else
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ack response received from gasket while no request pending from core for this thread.", core_id, thid);
		end
	end
        else
   	begin 
		if (~inst[`SWAP] && ~inst[`CASA] && ~inst[`LDSTUB])
		begin
			DispPendReq(thid);
			if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
			begin
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ld response received from gasket which mismatches the request pending from this thread.", core_id, thid);
			end
			else
			begin
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ack response received from gasket which mismatches the request pending from this thread.", core_id, thid);
			end
		end
		else
		begin
		if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
		begin
			`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) Atomic ld response.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
		end
		else
		begin
			`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) Atomic ack.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
		end

		   if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
		   begin
			if (tmp[`L2_RESP] == 4'hC) tmp[`L2_RESP] = 4'hD; 
			else
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when atomic ld return pkt received from ccx.", core_id, thid);
			end
		  end
		  else
		  begin
			if (tmp[`L2_RESP] == 4'hD) tmp[`L2_RESP] = 4'hF; 
			else
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when atomic ack pkt received from ccx.", core_id, thid);
			end
		  end
		end
	end
	ld_pend_array[thid] = tmp;
end
endtask

task chk_ccx_st_response;
input [145:0] cpx_pkt;
reg [2:0] thid;
reg [20:0] inst;
reg [39:0] cpx_pa, inst_pa;
reg [204:0] tmp;
reg [3:0] pkt_type;
begin
	thid = cpx_pkt[`CPX_THR_ID];
	tmp = stb[{thid, ret_ptr[thid]}];
	inst = tmp[`LSU_MON_INST];
	inst_pa = tmp[`MEMOP_PA];
	pkt_type = cpx_pkt[`CPX_RTNTYP];


//is received. There could be some other store sitting in the STB at that time.

//Chk for squash bit only for non-bis responses.


	if (cpx_pkt[`CPX_BIS])  //response to rmo store
	begin
		if (st_rmo_cnt[thid] == 0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> L2 response received for an rmo store while the st_rmo_cnt for this thread is 0.", core_id, thid);
		end
		else
		begin
			st_rmo_cnt[thid] = st_rmo_cnt[thid] - 1'b1;
			`PR_INFO("lsu_mon", 25, "<C%0h> <T%0h> Store ack received for RMO store. rmo_cnt = %0d", core_id, thid, st_rmo_cnt[thid]);
		end
	end
	else
	begin
	   if (tmp[`ST_SQUASH])
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> L2 response received while the SQUASH bit is set in the STB entry %0h.", core_id, thid, ret_ptr[thid]);
	   
           if (~stb_valid[{thid, ret_ptr[thid]}])
           begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Store ack received while that entry is invalid in STB.", core_id, thid);
	   end
	   else
	   begin
	      if (~cpx_pkt[`CPX_ATM])  //don't print this message for atomic return
	      begin
		`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) STB[%0d] Store ack.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA], ret_ptr[thid]);
              end
	      tmp[`L2_ACK] = 1'b1;
	      stb[{thid, ret_ptr[thid]}] = tmp;
		ret_ptr[thid] = ret_ptr[thid] + 1'b1;
		//`PR_INFO("lsu_mon", 22, "<C%0h> <T%0h> ret_ptr = %0d.", core_id, thid, ret_ptr[thid]);
	   end
	end
end
endtask

task Chk_req_load;
input [129:0] pcx_pkt;
reg [2:0] thid;
reg [`LD_Pend_Width] tmp;
reg [39:0] pcx_pa, inst_pa;
reg [20:0] inst;
reg [11*8:0] req;
begin
	
	thid = pcx_pkt[`PCX_THR_ID];
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	pcx_pa = pcx_pkt[`PCX_ADDR];
	inst_pa = tmp[`MEMOP_PA];
	req = DispPCXReq(pcx_pkt);

	if (inst[`BLKLD])
	begin
		if (pcx_pa[39:6] != inst_pa[39:6])
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A load request made to gasket by LSU while the pending req has PA %0h.", core_id, thid, pcx_pa, tmp[`MEMOP_PA]);
		end
		if (pcx_pa[5:0] == 6'b0)
		begin
			if (tmp[`L2_ISS] != 4'h0 )
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 1st load request (pa[5:0] = 6'b0) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				tmp[`L2_ISS] = 4'h1;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 1st blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			end
				
		end
		if (pcx_pa[5:0] == 6'h10)
		begin
			if (tmp[`L2_ISS] != 4'h1)
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 2nd load request (pa[5:0] = 6'h10) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				tmp[`L2_ISS] = 4'h3;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 2nd blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			end
		end
		if (pcx_pa[5:0] == 6'h20)
		begin
			if (tmp[`L2_ISS] != 4'h3)
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 3rd load request (pa[5:0] = 6'h20) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				tmp[`L2_ISS] = 4'h7;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 3rd blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			end
		end
		if (pcx_pa[5:0] == 6'h30)
		begin
			if (tmp[`L2_ISS] != 4'h7)
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 4th load request (pa[5:0] = 6'h30) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 4th blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
				tmp[`L2_ISS] = 4'hF;
			end
		end
		ld_pend_array[thid] = tmp;
	end
	else if (Is_single_pcx_req_ld(inst)) 
	begin
	  if (tmp[`L2_ISS] == 4'hF)
	  begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Load request  made to gasket by LSU while this request has already been issued to gasket.", core_id, thid, pcx_pa);
	  end
	  else
	  begin
		tmp[`L2_ISS] = 4'hF;
		ld_pend_array[thid] = tmp;
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
	  end
	end
	else
	begin
		DispPendReq(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A load request made to gasket by LSU while there is no such ld request pending from this thread.", core_id, thid, pcx_pa);
	end
end
endtask

	
function Is_single_pcx_req_ld;
input [20:0] inst;
begin
	if (inst[`LDD] || inst[`QLD] || inst[`FSR_RD_WR] || (inst == 21'h1) || (inst == 21'h5))
		Is_single_pcx_req_ld = 1'b1;
	else
		Is_single_pcx_req_ld = 1'b0;
	//`PR_INFO("lsu_mon", 22, "<C%0h> Is_single_pcx_req_ld = %b. ", core_id, Is_single_pcx_req_ld);
end
endfunction
			          

function Is_trap;
input [2:0]tid;

begin
	Is_trap = 1'b0;
	case (`SPC5.lsu_trap_flush[7:0])
		8'h01: if (tid == 3'h0) Is_trap = 1'b1;
		8'h02: if (tid == 3'h1) Is_trap = 1'b1;
		8'h04: if (tid == 3'h2) Is_trap = 1'b1;
		8'h08: if (tid == 3'h3) Is_trap = 1'b1;
		8'h10: if (tid == 3'h4) Is_trap = 1'b1;
		8'h20: if (tid == 3'h5) Is_trap = 1'b1;
		8'h40: if (tid == 3'h6) Is_trap = 1'b1;
		8'h80: if (tid == 3'h7) Is_trap = 1'b1;
	endcase
end
endfunction

function [8*11:0] DispPCXReq;
input [129:0] pcx_pkt;
begin
	casex ({pcx_pkt[`PCX_RQTYP], pcx_pkt[`PCX_NC], pcx_pkt[`PCX_INV], pcx_pkt[`PCX_PF], pcx_pkt[`PCX_BIS]})
		{5'h0, 1'b1, 1'b0, 1'b1, 1'b0}: DispPCXReq = "PREF";
		{5'h0, 1'b1, 1'b1, 1'b1, 1'b0}: DispPCXReq = "PREF_ICE";
		{5'h0, 1'bx, 1'b0, 1'b0, 1'b0}: DispPCXReq = "LD";
		{5'h0, 1'bx, 1'b1, 1'b0, 1'b0}: DispPCXReq = "D";  
		{5'h10, 1'bx, 1'b0, 1'b0, 1'b0}: DispPCXReq = "I";
		{5'h10, 1'b0, 1'b1, 1'b0, 1'b0}: DispPCXReq = "I";
		{5'h1, 1'bX, 1'bX, 1'b0, 1'b0}: DispPCXReq = "ST";
		{5'h1, 1'bX, 1'bX, 1'b1, 1'b1}: DispPCXReq = "BLKST";
		{5'h1, 1'bX, 1'bX, 1'b0, 1'b1}: DispPCXReq = "BIS";
		{5'h2, 1'b1, 1'bX, 1'b0, 1'b0}: DispPCXReq = "CASA1";
		{5'h3, 1'b1, 1'bX, 1'b0, 1'b0}: DispPCXReq = "CASA2";
		{5'h7, 1'b1, 1'bX, 1'b0, 1'b0}: DispPCXReq = "SWAP_LDSTUB";
		{5'h4, 1'b1, 1'b0, 1'b0, 1'b0}: DispPCXReq = "STREAM_LD";
		{5'h5, 1'b1, 1'b0, 1'b0, 1'bx}: DispPCXReq = "STREAM_ST";
		{5'h8, 1'b1, 1'b0, 1'b0, 1'b0}: DispPCXReq = "MMU_LD";
		//{5'h9, 1'b0, 1'b0, 1'b0, 1'b0}: DispPCXReq = "INT";
		default:
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%0h> <T%0h> <%0h> Can't recognise the PCX pkt type. rq_type = %h, nc_bit = %0b, inv_bit = %0b, pf_bit = %0b, bis_bit = %0b. pcx_pkt[129:0] = %h",  core_id, pcx_pkt[`PCX_THR_ID], pcx_pkt[`PCX_ADDR], pcx_pkt[`PCX_RQTYP], pcx_pkt[`PCX_NC], pcx_pkt[`PCX_INV], pcx_pkt[`PCX_PF], pcx_pkt[`PCX_BIS], pcx_pkt);
			DispPCXReq = " ";
		end
	 endcase
end
endfunction

function IsExc;
input [2:0] core_id;
reg [21*8:0] DispExc;

begin
	DispExc = 170'b0;
	IsExc = 1'b0;

	if (`SPC5.lsu_align_b) DispExc = "Addr_not_aligned";
	if (`SPC5.lsu_lddf_align_b) DispExc = "LDDF_Addr_not_aligned";
	if (`SPC5.lsu_stdf_align_b) DispExc = "STDF_Addr_not_aligned";
	if (`SPC5.lsu_priv_action_b) DispExc = "Priv_actio";
	if (`SPC5.lsu_va_watchpoint_b) DispExc = "VA_watchpoint";
	if (`SPC5.lsu_pa_watchpoint_b) DispExc = "PA_watchpoint";
	//if (`SPC5.lsu_tlb_miss_b_) DispExc = "Tlb_miss";
	if (`SPC5.lsu_illegal_inst_b) DispExc = "Illegal_inst";
	if (`SPC5.lsu_daccess_prot_b) DispExc = "Data_access_prot_exc";
	if (`SPC5.lsu_dae_invalid_asi_b) DispExc = "Dae_Invalid_asi";
	if (`SPC5.lsu_dae_nc_page_b) DispExc = "Dae_nc_page";
	if (`SPC5.lsu_dae_nfo_page_b) DispExc = "Dae_NFO_page";
	if (`SPC5.lsu_dae_priv_viol_b) DispExc = "Dae_Priv_viol";
	if (`SPC5.lsu_dae_so_page) DispExc = "Dae_so_page";
	//if (`SPC5.lsu_perfmon_trap_b) DispExc = "Perf_mon_trap";
	if (`SPC5.lsu_dtmh_err_b) DispExc = "DTLB_data_par_err";
	if (`SPC5.lsu_dttp_err_b) DispExc = "DTLB_tag_par_err";
	if (`SPC5.lsu_dtdp_err_b) DispExc = "DTLB_data_par_err";

	
	if (DispExc != 0)
	begin
		IsExc = 1'b1;
		`PR_INFO("lsu_mon", 23, "<C%0h> <T%0h> <%0h> B_stage: %s(VA=%0h) ASI = %0h. %s Exception.",core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, asi_b, DispExc);
	end

end
endfunction

function Is_exu_error;
input [1:0] exu_lsu_va_error_b;     // VA error requiring a flush
input [1:0] exu_ecc_b;              // ECC error requiring a flush
reg err_b;
reg err_m;

begin
	err_b = dec_lsu_tid_b[2] ? (exu_ecc_b[1] | (exu_lsu_va_error_b[1] & ~`SPC5.lsu_tlb_bypass_b)):
				(exu_ecc_b[0] | (exu_lsu_va_error_b[0] & ~`SPC5.lsu_tlb_bypass_b));

	err_m = (dec_lsu_tid_b[2] ? `SPC5.exu_ecc_m[1] : `SPC5.exu_ecc_m[0]) & `SPC5.lsu.dcc.twocycle_b;
					
	Is_exu_error = err_b | err_m;
end
endfunction

/*
task Insert_tlb_miss_info;
reg [127:0] tmp;
begin
	tmp =  128'b0;
	if (tlb_valid[dec_lsu_tid_b])
	begin
		tmp = tlbmiss_pend_array[dec_lsu_tid_b];
		Disp_tlbmiss_pend_array_entry(dec_lsu_tid_b);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h>) A new tlb miss request received while there is already a Tlb miss request pending from this thread as shown above.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
	end
	else
	begin
		tlb_valid[dec_lsu_tid_b] <= 1'b1;
		tmp[`INST_VA] = inst_pc_b;
		tmp[`MEMOP_VA] = vaddr_b;
		tmp[`INST] = inst_b;
	end
	tlbmiss_pend_array[dec_lsu_tid_b] = tmp;
end
endtask

*/

//problem with the signal.
/*
always @ (negedge `SPC5.l2clk)
begin
	if (mmu_dtlb_reload_d2)
		Chk_dtlb_reload;
end

task Chk_dtlb_reload;
reg [2:0] thid;
reg [127:0] tmp;
begin
		if (`SPC5.tlu_trap_pc_0_valid)
			thid = {1'b0, `SPC5.tlu_trap_0_tid};
		else if (`SPC5.tlu_trap_pc_1_valid)
			thid = {1'b0, `SPC5.tlu_trap_1_tid};
		else 
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> mmu_dtlb_reload asserted but trap_pc_0_valid and trap_pc_1_valid are both 0", core_id);

		if (~tlb_valid[thid])
			`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> mmu_dtlb_reload asserted while tlb_valid is 0.", core_id, thid);
		else
		begin
			tmp = tlbmiss_pend_array[dec_lsu_tid_b];
			`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> %s(VA=%0h> DTLB reloaded for VA = %0h.", core_id, thid, tb_top.intf0.xlate(tmp[`INST]), tmp[`INST_VA], tmp[`MEMOP_VA] );
			tlb_valid[thid] = 1'b0;
		end
end
endtask
*/

task Insert_ld_miss_info;
reg [`LD_Pend_Width] tmp;
begin
	tmp = 213'b0;
	if (ld_valid[dec_lsu_tid_b])
	begin
		tmp =  ld_pend_array[dec_lsu_tid_b];
		DispPendReq(dec_lsu_tid_b);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h>) A new request received while there is already a request pending from this thread as shown above.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
	end
	else
	begin
		//ld_valid[dec_lsu_tid_b] <= 1'b1;
		tmp[`INST_VA] = inst_pc_b;
		tmp[`MEMOP_VA] = vaddr_b;
		tmp[`MEMOP_PA] = {`SPC5.lsu.tlb_pgnum[39:13], vaddr_b[12:0]};
		tmp[`INST_ASI] = asi_b;

		if (lsu_inst_b[`BLKLD])
		begin
			tmp[`L2_ISS] =  4'h0;
			tmp[`L2_RESP] =  4'h0;
			is_blkld[dec_lsu_tid_b] = 1'b1;
		end
		else
		begin
		   is_blkld[dec_lsu_tid_b] = 1'b0;
		   if (lsu_inst_b[`CASA])
			tmp[`L2_ISS] =  4'hC;
		   else
			tmp[`L2_ISS] =  4'hE;
		   if (lsu_inst_b[`SWAP] || lsu_inst_b[`LDSTUB] || lsu_inst_b[`CASA])
			tmp[`L2_RESP] =  4'hC;
		   else
			tmp[`L2_RESP] =  4'hE;

		end

		tmp[`INST] = inst_b;
		tmp[`LSU_MON_INST] = lsu_inst_b; 
		ld_pend_array[dec_lsu_tid_b] = tmp;
	end
end
endtask


task Insert_in_last_inst_array;
reg [135:0] tmp;
begin
	tmp = 128'b0;
	tmp[`INST_VA] = inst_pc_b;
	tmp[`MEMOP_VA] = vaddr_b;
	tmp[`INST] = inst_b;
	tmp[135:128] = asi_b;
	last_inst_array[dec_lsu_tid_b] = tmp;
end
endtask


task DispPendReq;
input [2:0] thid;
reg [`LD_Pend_Width] tmp;
begin
	
	tmp =  ld_pend_array[thid];
	`PR_ALWAYS("lsu_mon", `ALWAYS, "LD_PEND_ARRAY[%0h] Data.", thid);
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> <%0h> %s(VA=%0h). PA = %0h. L2_ISS = %0h. L2_RESP = %0h, LSU_MON_INST=%h.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA], tmp[`MEMOP_PA], tmp[`L2_ISS], tmp[`L2_RESP], tmp[`LSU_MON_INST]);
end
endtask

task Disp_STB_entry;
input [2:0] thid;
input [2:0] ptr;
reg [204:0] tmp;
begin
	
	tmp =  stb[{thid, ptr}];
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> STB[%0h] data.", core_id, thid, ptr);
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> <%0h> %s(VA=%0h). PA = %0h. L2_ISS = %0h. L2_ACK = %0h, LSU_MON_INST=%h. RMO = %0b", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA], tmp[`MEMOP_PA], tmp[`L2_ST_ISS], tmp[`L2_ACK], tmp[`LSU_MON_INST], tmp[`RMO]);
end
endtask

/*
		
task Disp_tlbmiss_pend_array_entry;
input [2:0] thid;
reg [127:0] tmp;
begin
	tmp = tlbmiss_pend_array[thid];
	`PR_INFO("lsu_mon", 23, "TLB_MISS_PEND_ARRAY[%0h] Data.", thid);
	`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h> %s(VA=%0h).", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);

end
endtask

*/
task Disp_CPX_pkt;
input [145:0] cpx_pkt;
begin
	`PR_ALWAYS("lsu_mon", `ALWAYS, "CPX_PKT data.");
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%0h> <T%0h> rtn_typ = %0h, err_bits = %0h, nc=%0b, atm = %0b, pf = %0b",  core_id, cpx_pkt[`CPX_THR_ID], cpx_pkt[`CPX_RTNTYP], cpx_pkt[`CPX_ERR], cpx_pkt[`CPX_NC], cpx_pkt[`CPX_ATM], cpx_pkt[`CPX_PF]);
end
endtask
	

task Make_STB_data;
reg [204:0] tmp;
begin
		tmp = 0;
		tmp[`INST_VA] = inst_pc_b;
		tmp[`MEMOP_VA] = vaddr_b;
		tmp[`MEMOP_PA] = {`SPC5.lsu.tlb_pgnum[39:13], vaddr_b[12:0]};
		tmp[`L2_ST_ISS] =  1'b0;
		tmp[`ASI_ST_ISS] =  1'b0;
		tmp[`L2_ACK] =  1'b0;
		tmp[`INST] = inst_b;
		tmp[`LSU_MON_INST] = lsu_inst_b;
		tmp[`ST_SQUASH] = 1'b0;
		tmp[`INST_ASI] = asi_b;
		if (`SPC5.lsu.tlu_lsu_hpstate_hpriv[dec_lsu_tid_b])
		   tmp[`ST_PRIV] = `HPRIV; 
		else if (`SPC5.lsu.tlu_lsu_pstate_priv[dec_lsu_tid_b])
		   tmp[`ST_PRIV] = `PRIV; 
		else
		   tmp[`ST_PRIV] = `USER; 
		//bis_asi to io space is not rmo

		tmp[`RMO] = lsu_inst_b[`BLKST] | (dec_altspace_b & Is_bis_asi(asi_b) & ~`SPC5.lsu.tlb_pgnum[39]);
		stb_alloc_data <= tmp;
end
endtask

task Insert_in_STB;
input [195:0] store_data;
input [2:0] thid;
begin
	if (stb_full(thid))
	begin
		//DispSTB(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> STB full and a new store received for insertion in STB.", core_id, thid);
	end
	else
	begin
		stb[{thid, wrptr[thid]}] = store_data;
		//Disp_STB_entry(thid, wrptr[thid]);
		`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h> %s(VA=%0h). STB[%0h] Inserted.", core_id, thid, store_data[`INST_VA], tb_top.intf0.xlate(store_data[`INST]), store_data[`MEMOP_VA], wrptr[thid]);
		stb_valid[{thid, wrptr[thid]}] = 1'b1;
		wrptr[thid] = wrptr[thid] + 1'b1;
		//`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> wrptr = %0d.", core_id, thid, wrptr[thid]);
	end
end
endtask

function stb_full;
input [2:0] thid;
begin
	if ((wrptr[thid] == rdptr[thid]) && stb_valid[{thid, wrptr[thid]}])
		stb_full = 1'b1;
	else
		stb_full = 1'b0;
end
endfunction
	

task Dealloc_STB;
input [2:0] thid;
reg [204:0] tmp;
reg [20:0] lsu_inst;
begin
	//thid = decode_tid(`SPC5.lsu_stb_dealloc);
	tmp = stb[{thid, rdptr[thid]}];
	lsu_inst = tmp[`LSU_MON_INST];
	if (~stb_valid[{thid, rdptr[thid]}])
	begin
		//DispSTB(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_dealloc = %0h asserted while the stb entry is invalid for that thid.", core_id, thid, `SPC5.lsu_stb_dealloc);
	end
	if (tmp[`L2_ST_ISS]) 
	begin
	    if (~tmp[`L2_ACK])
	    begin
		Disp_STB_entry(thid, rdptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_dealloc = %0h asserted when we haven't received the response from the gasket.", core_id, thid, `SPC5.lsu_stb_dealloc);
	    end
	end
	else if (tmp[`ASI_ST_ISS])
	begin
		ret_ptr[thid] = ret_ptr[thid] + 1'b1;
	end
	//blkst inst. is not issued anywhere, blkst helpers are issued.
	//in case of bis stores, lsu issues the dealloc in P3, i.e when the req is issued to PCX.
	//IF it is bis to cp sapce and there is an err then the store is issued to PCX with nd set
	// and deallocated.
	//However for ue onbis to IO space, dealloc is sent to IFU, issued on PCX with valid bit 0.
	//The sbdiou signal is sent in next cycle. We need to take bis io stores in this equation.
	else if (tmp[`ST_SQUASH] || lsu_inst[`BLKST] || (tmp[`RMO] & ~lsu_inst[`BLKST] & ~`SPC0.lsu.sbc.kill_store_p4_)) 
	begin
		iss_ptr[thid] = iss_ptr[thid] + 1'b1;
		ret_ptr[thid] = ret_ptr[thid] + 1'b1;
	end
	else 
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_dealloc = %0h asserted which is not issued to asi ring, or PCX or is not squashed.", core_id, thid, `SPC5.lsu_stb_dealloc);

	`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h>: %s(VA=%0h) PA = %0h. STB[%0d] Deallocated.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], tmp[`MEMOP_PA], rdptr[thid]);
	stb_valid[{thid, rdptr[thid]}] = 1'b0;
	rdptr[thid] = rdptr[thid] + 1'b1;
	//`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> rd_ptr = %0d.", core_id, thid, rdptr[thid]);
	/*
	if (tmp[`RMO])
		st_rmo_cnt[thid] = st_rmo_cnt[thid]  + 1'b1;
	*/
end
endtask

task Squash_STB;
input [2:0] thid;
reg [204:0] tmp;
reg [3:0] squash_cnt;
reg [2:0] i;
begin
	squash_cnt = 4'b0;
        if (ret_ptr[thid] != iss_ptr[thid])
	       `PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> lsu_block_store_kill asserted while the ret_ptr = %0h  != iss_ptr = %0h.", core_id, thid, tmp[`MEMOP_PA], ret_ptr[thid], iss_ptr[thid]);
        if (rdptr[thid] != iss_ptr[thid])
	       `PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> lsu_block_store_kill asserted while the rdptr = %0h  != iss_ptr = %0h.", core_id, thid, tmp[`MEMOP_PA], rdptr[thid], iss_ptr[thid]);

	if (iss_ptr[thid] == wrptr[thid])
	begin
	    if (stb_valid[{thid, wrptr[thid]}])
		squash_cnt = 8;
/* Lsu can assert both dealloc and block_store_kill for a request.
 *
	    else
	    begin
              	`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Lsu asserted block_store_kill while there are no valid entries in STB to be deallocated.", core_id, thid);
	    end
*/
	end
	else
	begin
	  if (iss_ptr[thid] < wrptr[thid])
		squash_cnt = wrptr[thid] - iss_ptr[thid];
	  else if (iss_ptr[thid] > wrptr[thid])
		squash_cnt = wrptr[thid] + (8 - iss_ptr[thid]);
	end

	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> SQUASH_STB:iss_ptr = %0h, wrptr = %0h, squash_cnt = %0h.", core_id, thid, iss_ptr[thid], wrptr[thid], squash_cnt);

	i = iss_ptr[thid];
       
       `PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Block store kill changed issue_ptr:%0h->%0h. ret_ptr: %0h->%0h. rdptr:%0h->%0h.", core_id, thid, iss_ptr[thid], iss_ptr[thid]+squash_cnt, ret_ptr[thid], ret_ptr[thid]+squash_cnt, rdptr[thid], rdptr[thid]+squash_cnt);

   	ret_ptr[thid] = ret_ptr[thid] + squash_cnt;
	rdptr[thid] = rdptr[thid] + squash_cnt;
        iss_ptr[thid] = iss_ptr[thid] + squash_cnt;
		
	while (squash_cnt)
	begin
	    tmp = stb[{thid, i}];
	    if (~stb_valid[{thid, i}])
	    begin
		//DispSTB(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h><PA = %0h> lsu_block_store_kill asserted while the stb entry %0h is invalid.", core_id, thid, tmp[`MEMOP_PA], i);
	    end
	    if (tmp[`L2_ST_ISS]) 
	    begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h>st_issue bit is set when the block_store_kill is asserted for stb entry %0h.", core_id, thid, tmp[`MEMOP_PA], i);
	    end
	    //commenting out the chk below. Lsu can assert sbdiou and then in the next cycle insert a new entry into
	    //stb. LSU will squash this new entry and won't issue it to PCX/asi but its squash bit won't be 
	    //set in the chkr which was causin it to fire. 
	    //if (~tmp[`ST_SQUASH]) 
	    //begin
	       //`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> lsu_block_store_kill asserted while the squash bit is 0 in the STB entry %0h.", core_id, thid, tmp[`MEMOP_PA], i);
	    //end
	    stb_valid[{thid, i}] = 1'b0; 

	    i = i + 1;
	    squash_cnt = squash_cnt - 1'b1;
	end

end
endtask

task Chk_store;
reg [2:0] thid;
reg [47:0] addr;
reg [3:0] i;
reg [204:0] tmp;
begin
	if ((bst_cnt > 0) && (`SPC5.lsu_stb_alloc == 8'b0))
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Blk store entries are not allocated back to back in STB.", core_id, bst_active_thid);

//For bst the stb is still written even though we have errors.
//Stb is written in W stage. Howvere for first blk store helper
//the err will be flagged by FGU in b stage. We can miss the
// err signal if we don't sample in B.
//for the last helper err will be signalled in B stage of last helper and at

	if (lsu_bst_active[bst_active_thid] & `SPC0.fgu_fst_ecc_error_fx2 & (bst_cnt < 7))
             bst_fgu_err = 1'b1;

	if (`SPC5.lsu_stb_alloc[7:0] != 8'b0)
	begin
		thid = decode_tid(`SPC5.lsu_stb_alloc[7:0]);
		if (store_alloc)
		begin
			if (thid != dec_lsu_tid_w)
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_alloc = %0h mismatches the thid %0h.", core_id, dec_lsu_tid_w, `SPC5.lsu_stb_alloc[7:0], dec_lsu_tid_w);
			Insert_in_STB(stb_alloc_data, dec_lsu_tid_w);
		end
		else 
		begin
		    if (lsu_bst_active[thid])
		    begin
			   if (bst_cnt == 0)
			   begin
				bst_data = bst_inst_data;
			   end
		           else
			   begin
				if (thid != bst_active_thid)
				begin
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_alloc = %0h mismatches the active blkstore thid = %0h.", core_id, bst_active_thid, `SPC5.lsu_stb_alloc[7:0], bst_active_thid);
				end

				addr = bst_data[`MEMOP_VA];

				bst_data[`MEMOP_VA] = {addr[47:6], bst_cnt[2:0], 3'b0};
				addr = bst_data[`MEMOP_PA];
				bst_data[`MEMOP_PA] = {addr[39:6], bst_cnt[2:0], 3'b0};
			   end
                                bst_cnt = bst_cnt + 1;
                                Insert_in_STB(bst_data, bst_active_thid);
                                if (bst_cnt == 8)
                                begin
                                        bst_cnt = 0;
                                        lsu_bst_active[thid] = 1'b0;
                                        if (bst_fgu_err) //set the squash bit to 0 for all the stb entries
                                        begin
                                          for (i = 0; i < 8; i=i+1)
                                          begin
                                             tmp = stb[{thid, i[2:0]}];
					     if (tmp[`ST_SQUASH])
						`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Squash bit already set when trying to set it for a bst fgu errerr.", core_id, thid, tmp[`MEMOP_PA]);
					     tmp[`ST_SQUASH] = 1'b1;
                                             stb[{thid, i[2:0]}] = tmp; 
                                             `PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <PA = %0h> STB_entry[%0h] squashed due to FGU err.", core_id, thid, tmp[`MEMOP_PA], i);
                                          end
                                        end
					bst_fgu_err = 1'b0;
                                end
			end
			else
				`PR_ERROR("lsu_mon", `ERROR, "<C%h>: LSU asserted lsu_stb_alloc  = %0h while no store pending to be written in STB.", core_id, `SPC5.lsu_stb_alloc[7:0]);
				
		end
	end
	else
	begin
		if (store_alloc)
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h> W_stage: LSU did not assert lsu_stb_alloc for the store.", core_id, dec_lsu_tid_w, inst_pc_w);
	end
end
endtask

task Chk_st_on_ASI_ring;
input ring;
reg [2:0] thid;
reg [7:0] asi;
reg [47:0] addr, act_addr;
reg [1:0] req_type;
reg [204:0] tmp;

begin
	if (ring == `LOCAL)
		thid =`SPC5.lsu_rngl_cdbus[58:56];
	else
		thid =`SPC5.lsu_rngf_cdbus[58:56];
	
	if (ring == `LOCAL)
		asi =`SPC5.lsu_rngl_cdbus[55:48];
	else
		asi =`SPC5.lsu_rngf_cdbus[55:48];
	
	if (ring == `LOCAL)
		addr =`SPC5.lsu_rngl_cdbus[47:0];
	else
		addr =`SPC5.lsu_rngf_cdbus[47:0];
	
	if (ring == `LOCAL)
		req_type =`SPC5.lsu_rngl_cdbus[61:60];
	else
		req_type =`SPC5.lsu_rngf_cdbus[61:60];
	

	tmp = stb[{thid, iss_ptr[thid]}];
	if (tmp[`ASI_ST_ISS])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store reissued on the ASI interface.", core_id, thid, addr);
	end
	
	if (tmp[`ST_SQUASH])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store issued on the ASI interface that has been squashed.", core_id, thid, addr);
	end

	act_addr  = tmp[`MEMOP_PA];
	act_addr = {act_addr[39:3], 3'b0};

	//47 is D tag rd asi. LSU issues that on the ring but changes 
	//the address.
	if ((addr == act_addr) || (asi == 8'h47) || (asi == 8'h46))  
	begin
		tmp[`ASI_ST_ISS] = 1'b1;
		stb[{thid, iss_ptr[thid]}] = tmp;
		if (ring == `LOCAL)
		begin
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued on local ring.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
		end
		else
		begin
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued on fast ring.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
		end
		iss_ptr[thid] = iss_ptr[thid] + 1'b1;
	end
	else
	begin
	   if (ring == `LOCAL)
	   begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] PA mismatch for asi req on local ring. Expected PA = %0h, actual PA = %0h", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid], tmp[`MEMOP_PA], addr);
	   end
	   else
	   begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] PA mismatch for asi req on fast ring. Expected PA = %0h, actual PA = %0h", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid], tmp[`MEMOP_PA], addr);
	  end
	end

end
endtask


task chk_store_issue_to_pcx;
input [129:0] pcx_pkt;
reg [2:0] thid;
reg [204:0] tmp;
reg [20:0] inst;
reg [39:0] pcx_pa, inst_pa;
begin
	thid = pcx_pkt[`PCX_THR_ID];
	tmp = stb[{thid, iss_ptr[thid]}];
	inst = tmp[`LSU_MON_INST];
	pcx_pa = pcx_pkt[`PCX_ADDR];
	inst_pa = tmp[`MEMOP_PA];
	
	if (pcx_pkt[`PCX_RQTYP] == `PCX_STORE)
	begin
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
	end
	if (pcx_pkt[`PCX_INV])
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued to gasket with ND set.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
		

	if (~inst[`ST])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A store request made to gasket by LSU while the pending req is not store.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end

/* CONFIRM WITH MARK
	if (pcx_pa[39:0] != inst_pa[39:0])
	begin
			Disp_STB_entry(thid, iss_ptr[thid]);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A store request made to gasket by LSU while the pending req has PA %0h.", core_id, thid, pcx_pkt[`PCX_ADDR], tmp[`MEMOP_PA]);
	end
*/
//enhancement req 100146
	if ((tmp[`INST_ASI] == 8'h73) & (pcx_pa[39:0] != {8'h90, core_id, thid, tmp[`INST_ASI], 18'h0})) 
	begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> pcx_pa is not correct for asi write to interrupt vector dispatch register.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end

	if (inst[`BLKST] && ~pcx_pkt[`PCX_BST])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Bst bit is not set in the PCX pkt by LSU for a blk st request.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end

	if (tmp[`L2_ST_ISS])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store reissued on the PCX interface.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end
	else
	        tmp[`L2_ST_ISS] =  1'b1;
	
	if (tmp[`ST_SQUASH])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store issued on the PCX interface that has been squashed.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end
	
	if (tmp[`RMO])
	begin
	   if (~pcx_pkt[`PCX_BIS])
	   begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> BIS bit is not set in the PCX pkt by LSU for an RMO store.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	   end
	   if (tmp[`L2_ACK])
	   begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> L2ack bit is set when the RMO store is issued to PCX.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	   end
	   else
	   begin
		tmp[`L2_ACK] = 1'b1;
		ret_ptr[thid] = ret_ptr[thid] + 1;  //this will be deallocated before 
						    //response seen from stub
		st_rmo_cnt[thid] = st_rmo_cnt[thid]  + 1'b1;
	   end
	end
	stb[{thid, iss_ptr[thid]}] = tmp;

	iss_ptr[thid] = iss_ptr[thid] + 1;
	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> iss_ptr = %0d. ret_ptr = %0d, st_rmo_cnt = %0d", core_id, thid, iss_ptr[thid], ret_ptr[thid], st_rmo_cnt[thid]);
end
endtask

`ifdef INJ_STB_ERR_IN_CMP


reg [2:0] err_tid, stb_err_tid_d1, stb_err_tid_d2;
reg [2:0] err_index, stb_err_index_d1, stb_err_index_d2;
reg [204:0] err_tmp ;
reg [20:0] err_inst;
reg [44:0] cam_data;
reg [5:0] err_bit;
integer err_inj_cnt;
reg cmp_stb_err_inj;
reg stb_err_inj, stb_err_inj_d1, stb_err_inj_d2;
reg [1:0] err_priv, stb_err_priv_d1, stb_err_priv_d2;

initial
begin
	cmp_stb_err_inj = 1'b0;

	cam_data = 45'b0;
	err_bit = 11;
	err_inj_cnt = 0;
	stb_err_inj = 0;
	if (("cmp_stb_err_inj_on"))
		cmp_stb_err_inj = 1'b1;
	else
		cmp_stb_err_inj = 1'b0;
end

always @ (negedge (`SPC5.l2clk & enabled & cmp_stb_err_inj))
begin //{
     //valid stb ram rd for issue to pcx
     stb_err_inj = 1'b0;
     if (`SPC5.lsu.sbc.ram_rptr_vld_2 & `SPC5.lsu.sbc.st_pcx_rq_p3 & `SPC5.lsu.pic.pic_st_sel_p3)
     begin //{
	err_tid = decode_tid(`SPC5.lsu.sbc.st_rq_sel_p3[7:0]);
	err_index = `SPC5.lsu.sbc.ram_rptr_d1;
	err_tmp = stb[{err_tid, err_index}];
	err_inst = err_tmp[`LSU_MON_INST];
	cam_data = `SPC5.lsu.stb_cam.cam_array.stb_rdata[44:0];
	err_priv = err_tmp[`ST_PRIV];
	//if (err_inst[`SWAP] || err_inst[`CASA] || err_inst[`LDSTUB])
	if (err_inst[`CASA])
	begin //{
	   err_inj_cnt = err_inj_cnt + 1;
	   if (err_inj_cnt == 10)
	   begin //{
	     case (err_bit)
	       11, 12: err_bit = err_bit + 1;
	       13: err_bit = 44;
	       44: err_bit = 11;
	      endcase
	      err_inj_cnt = 0;
	      stb_err_inj = 1'b1;

	      force `SPC0.lsu.stb_cam.cam_array.stb_rdata[44:0] = cam_data ^ (1 << err_bit);
	      `PR_INFO("stb_err", 22, "<T%0h> <%0h> STB[%0h]: SBAPP forced for CASA. err_bit = %0h", err_tid, {cam_data[44:8], 3'b0}, err_index, err_bit);
	      #1;
	      release `SPC0.lsu.stb_cam.cam_array.stb_rdata[44:0];
	   end  //}
	end //}
     end  //}
     if (stb_err_inj_d2)
     begin
	if (~`SPC5.lsu_sbapp_err_g)
	begin
	            `PR_ERROR("lsu_mon", `ERROR, "<T%0h> sbapp err not asserted when err is injected for atomic.", stb_err_tid_d2);
	end
	else
	begin
		if ((`SPC5.lsu_stberr_tid_g != stb_err_tid_d2) || 
		    (`SPC5.lsu_stberr_index_g != stb_err_index_d2) || 
		    (`SPC5.lsu_stberr_priv_g != stb_err_priv_d2))
		begin
	            `PR_ERROR("lsu_mon", `ERROR, "<T%0h> sbapp err parameters mismatch.", stb_err_tid_d2);
		end
	end
    end
    else
    begin
	if (`SPC5.lsu_sbapp_err_g)
	begin
	            `PR_ERROR("lsu_mon", `ERROR, "<T%0h> sbapp err asserted when none expected.", `SPC5.lsu_stberr_tid_g);
	end
    end

end  //}

	
always @ (posedge (`SPC5.l2clk & enabled & cmp_stb_err_inj))
begin
	stb_err_inj_d1 <= stb_err_inj;
	stb_err_inj_d2 <= stb_err_inj_d1;
	stb_err_tid_d1 <= err_tid;
	stb_err_tid_d2 <= stb_err_tid_d1;
	stb_err_index_d1 <= err_index;
	stb_err_index_d2 <= stb_err_index_d1;
	stb_err_priv_d1 <= err_priv;
	stb_err_priv_d2 <= stb_err_priv_d1;
end

`endif
`endif
`endif
endmodule

`endif
`ifdef CORE_6

module lsu_mon_c6;
`ifndef GATESIM

// If vcs_build_args NO_MONITORS, then module will be empty
`ifndef NO_MONITORS

reg imm_asi_vld_e;
reg [7:0] asi_e, imm_asi_e, asi_m, asi_b;
reg dec_altspace_e, dec_altspace_b, dec_altspace_m;
reg [1:0] exu_ecc_b;
reg [1:0] exu_lsu_va_error_b;
reg [2:0] dec_lsu_tid_e, dec_lsu_tid_m, dec_lsu_tid_b, dec_lsu_tid_w;
reg [47:0] inst_pc_e, inst_pc_m, inst_pc_b, inst_pc_w;
reg [31:0] inst_e, inst_m, inst_b;
reg [47:0] vaddr_m, vaddr_b;
reg [63:0] int_st_data_m, int_st_data_b;
reg [63:0] fp_st_sata_fx2;
reg [20:0] lsu_inst_e, lsu_inst_m, lsu_inst_b;
reg mmu_dtlb_reload_d1, mmu_dtlb_reload_d2;

reg [7:0] ld_valid;
reg [7:0] tlb_valid;
reg [`LD_Pend_Width] ld_pend_array[7:0];
reg [`LAST_INST_Pend_Width] last_inst_array[7:0];
reg [2:0] wrptr[7:0];  //Pts. to the STB entry into which data will be written next
reg [2:0] rdptr[7:0];  //Tracks the dealloc signal from STB
reg [2:0] iss_ptr[7:0];	//keeps track of when a store is issued from the STB to PCX
reg [2:0] ret_ptr[7:0]; //keeps track of when the response is received from 
			//the L2c.
reg [63:0] stb_valid;
reg [`STB_Pend_Width] stb[63:0];
//reg [`TLB_MISS_Pend_Width] tlbmiss_pend_array[7:0];

reg [7:0] pf_cnt[7:0];
reg [7:0] dcache_inv_cnt[7:0];
reg [7:0] st_rmo_cnt[7:0];

reg [55:0] print_inst;

reg [31:0] dec_tg0_inst_d, dec_tg1_inst_d;

reg [7:0] lsu_bst_active;
reg store_alloc;
reg [3:0] bst_cnt;
reg [195:0] stb_alloc_data;
reg [195:0] bst_data, bst_inst_data;
reg [2:0] bst_active_thid;
reg bst_fgu_err;
				
reg [7:0] is_blkld;  //reqd by lsu_ras_chkr to chk errors on blk ld.
reg [1:0] l2_blk_ld_errtype[7:0]; //Gives the type of err the ahd be reported by LSU if 
				 //different types of err occur on blk ld helper returns
reg [1:0] st_priv[7:0]; //Gives the final priv level for an sbdiou/sbapp err that shd be 
			//stored in DFESR

wire [2:0] core_id = 6;

integer i;
integer err_cnt;

reg enabled;
reg reset_in_middle;
reg [7:0] finish_mask;

initial
begin
    enabled = 0;
    reset_in_middle = 0;
	ld_valid = 8'b0;
	lsu_inst_e = 0;
	tlb_valid = 8'b0;
	for (i = 0; i < 8; i = i+1)
	begin
		pf_cnt[i] = 0;
		dcache_inv_cnt[i] = 0;
		wrptr[i] = 0;
		rdptr[i] = 0;
		iss_ptr[i] = 0;
		ret_ptr[i] = 0;
		st_rmo_cnt[i] = 0;
		is_blkld[i] = 1'b0;
		st_priv[i] = 2'b0;
		l2_blk_ld_errtype[i] = 2'b0;
	end
	lsu_bst_active = 8'b0;
	store_alloc = 1'b0;
	bst_cnt = 4'b0;
	stb_valid = 64'b0;

    // avoid time zero ugliness. jp
    //@(posedge `SPC0.l2clk);
    //@(negedge `SPC0.l2clk);
    //if (`PARGS.lsu_mon_on) enabled = 1;

    case (core_id)
	3'h0: finish_mask = `PARGS.finish_mask[7:0];
	3'h1: finish_mask = `PARGS.finish_mask[15:8];
	3'h2: finish_mask = `PARGS.finish_mask[23:16];
	3'h3: finish_mask = `PARGS.finish_mask[31:24];
	3'h4: finish_mask = `PARGS.finish_mask[39:32];
	3'h5: finish_mask = `PARGS.finish_mask[47:40];
	3'h6: finish_mask = `PARGS.finish_mask[55:48];
	3'h7: finish_mask = `PARGS.finish_mask[63:56];
    endcase
end

always @ (`TOP.in_reset)
begin
	if (~`TOP.in_reset & `PARGS.lsu_mon_on & ~reset_in_middle)
	begin
		enabled = 1'b1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "Lsu_mon on, in_reset = 0.");
	end
		

	if (`TOP.in_reset & enabled)
	begin
		reset_in_middle = 1'b1;
		enabled = 1'b0;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "Reset asserted in the middle of the diag. Turned off Lsu_mon.");
	end
end

always @ (posedge (tb_top.sim_status[0] & enabled))
begin //{
	if (|(ld_valid[7:0] & finish_mask[7:0]))
	begin  //{
	   for (i = 0; i < 8; i=i+1)
	   begin
		if (ld_valid[i])  
		begin
		   DispPendReq(i);
	        end
	   end
	  `PR_ERROR("lsu_mon", `ERROR, "<C%h> Ld requests pending at the end of simulation. ld_valid = %0h", core_id, ld_valid);
	end  //}
	if (|stb_valid[63:0])
	begin  //{
	   err_cnt = 0;
	   for (i = 0; i < 64; i=i+1)
	   begin
		if (stb_valid[i] & finish_mask[i[5:3]])  
		begin
		//chkr resets the stb valid bits when block_store_kill is asserted.
		//in couple of failures block_store_kill was sampled asserted two cycles after
		//lsu asserted stb_empty. The simulation ended the cycle stb_empty was sampled high 
		//causing moniotr firings with valid entries in stb at end of simulation. Now
		//don't flag an error if squash bit is set and stb_valid is asserted at end
		//of simualation.
		      if (~is_squash_bit_set(i[5:0]))
		      begin
			err_cnt = err_cnt + 1;
			Disp_STB_entry(i[5:3],i[2:0]);
		      end
		end
	   end
	   if (err_cnt)
	   begin
	  	`PR_ERROR("lsu_mon", `ERROR, "<C%h> Store requests pending at the end of simulation. stb_valid = %0h", core_id, stb_valid);
	   end
       end  //}
       err_cnt = 0;
       for (i = 0; i < 8; i=i+1)
       begin  //{
	   if (finish_mask[i] & (pf_cnt[i] != 0))
	   begin
		err_cnt = 1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> Prefetches not finished. Pf_cnt = %0d", core_id, i, pf_cnt[i]);
	   end
	   if (finish_mask[i] & (dcache_inv_cnt[i] != 0))
	   begin
		err_cnt = 1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> D pkt not received for all invalidate reqs. issued by the thread. dcache_inv_cnt = %0d", core_id, i, dcache_inv_cnt[i]);
	   end
	   if (finish_mask[i] & (st_rmo_cnt[i] != 0))  
	   begin
		err_cnt = 1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> rmo_cnt not zero. rmo_cnt = %0d", core_id, i, st_rmo_cnt[i]);
	   end
       end  //}
       if (err_cnt)
       begin
	  `PR_ERROR("lsu_mon", `ERROR, "<C%h> Prefetch/D/RMO_stores requests pending at the end of simulation.", core_id);
       end
end //}

function is_squash_bit_set;
input [5:0] index;
reg [204:0] tmp;
begin
	tmp = stb[index];
	if (tmp[`ST_SQUASH])
		is_squash_bit_set = 1'b1;
	else
		is_squash_bit_set = 1'b0;
end
endfunction


always @ (negedge (`SPC6.l2clk & enabled))
begin //{

	asi_e  = `SPC6.lsu.dcc.dcc_asi_e[7:0];

	lsu_inst_e[`LD] <= `SPC6.dec_ld_inst_e;
	lsu_inst_e[`ST] <= `SPC6.dec_st_inst_e;
	lsu_inst_e[`FP] <= `SPC6.dec_fpldst_inst_e;
	lsu_inst_e[`PREF] <= `SPC6.dec_pref_inst_e;
	lsu_inst_e[`SWAP] <= `SPC6.dec_swap_inst_e;
	lsu_inst_e[`CASA] <= `SPC6.dec_casa_inst_e;
	lsu_inst_e[`LDSTUB] <= `SPC6.dec_ldstub_inst_e;
	lsu_inst_e[`FLUSH] <= `SPC6.dec_flush_inst_e;
	lsu_inst_e[`MEMBAR] <= `SPC6.dec_memstbar_inst_e;
	lsu_inst_e[`LDD] <= `SPC6.dec_ld_inst_e & `SPC6.dec_ldst_dbl_e & ~`SPC6.dec_fpldst_inst_e;
	lsu_inst_e[`STD] <= `SPC6.dec_st_inst_e & `SPC6.dec_ldst_dbl_e & ~`SPC6.lsu.dec_fpldst_inst_e;

       lsu_inst_e[`BLKLD] <= `SPC6.dec_ld_inst_e & `SPC6.dec_fpldst_inst_e & dec_altspace_e & Is_blk_asi(asi_e);
	lsu_inst_e[`BLKST] <= `SPC6.dec_st_inst_e & `SPC6.dec_fpldst_inst_e & dec_altspace_e & Is_blk_asi(asi_e);
	lsu_inst_e[`QLD] <= `SPC6.dec_ld_inst_e & dec_altspace_e & Is_qld_asi(asi_e);
	lsu_inst_e[`ASR_RD_WR] <= `SPC6.dec_sr_inst_e & (`SPC6.dec_ld_inst_e | `SPC6.dec_st_inst_e);
	lsu_inst_e[`PR_RD_WR] <= `SPC6.dec_pr_inst_e & (`SPC6.dec_ld_inst_e | `SPC6.dec_st_inst_e);
	lsu_inst_e[`HPR_RD_WR] <= `SPC6.dec_hpr_inst_e & (`SPC6.dec_ld_inst_e | `SPC6.dec_st_inst_e);
	lsu_inst_e[`FSR_RD_WR] <= `SPC6.dec_fsr_ldst_e & (`SPC6.dec_ld_inst_e | `SPC6.dec_st_inst_e);
end //}

always @ (posedge (`SPC6.l2clk & enabled))
begin //{
	dec_tg0_inst_d <= `SPC6.dec.ded0.decode_mux[31:0];
	dec_tg1_inst_d <= `SPC6.dec.ded1.decode_mux[31:0];
	imm_asi_vld_e <= `SPC6.lsu.dec_imm_asi_vld_d;

	imm_asi_e <= `SPC6.lsu.dec_imm_asi_d;
	dec_altspace_e <= `SPC6.dec_altspace_d;
	dec_altspace_m <= dec_altspace_e;
	dec_altspace_b <= dec_altspace_m;

	exu_ecc_b <= `SPC6.exu_ecc_m;
	exu_lsu_va_error_b <= `SPC6.exu_lsu_va_error_m;

	dec_lsu_tid_e <= `SPC6.dec_lsu_tg_d ? {1'b1, `SPC6.dec_lsu_tid1_d} : {1'b0, `SPC6.dec_lsu_tid0_d}; 	
	dec_lsu_tid_m <= dec_lsu_tid_e;
	dec_lsu_tid_b <= dec_lsu_tid_m;
	dec_lsu_tid_w <= dec_lsu_tid_b;
	
	inst_pc_e <= `SPC6.dec_lsu_tg_d ? {`SPC6.tlu.tlu_pc_1_d[47:2], 2'b0} : {`SPC6.tlu.tlu_pc_0_d[47:2], 2'b0};
	inst_pc_m <= inst_pc_e;
	inst_pc_b <= inst_pc_m;
	inst_pc_w <= inst_pc_b;
	
	inst_e <= `SPC6.dec_lsu_tg_d ? dec_tg1_inst_d : dec_tg0_inst_d;
	inst_m <= inst_e;
	inst_b <= inst_m;

	vaddr_m <= `SPC6.exu_lsu_address_e;
	vaddr_b <= vaddr_m;

	int_st_data_m <= `SPC6.exu_lsu_store_data_e;
	int_st_data_b <= int_st_data_m;
	fp_st_sata_fx2 <= `SPC6.fgu_lsu_fst_data_fx1;

	mmu_dtlb_reload_d1 <= `SPC6.mmu_dtlb_reload;
	mmu_dtlb_reload_d2 <= mmu_dtlb_reload_d1;

	//pcx_thid_d1 <=  `SPC6.lsu.spc_pcx_data_pa[`PCX_THR_ID];
	lsu_inst_m <= lsu_inst_e;
	lsu_inst_b <= lsu_inst_m;

	asi_m <= asi_e;
	asi_b <= asi_m;
end //}

function Is_blk_asi;
input [7:0] asi;
begin
	Is_blk_asi = (asi == `ASI_BLK_AIUP) | (asi == `ASI_BLK_AIUS) | 
		   (asi == `ASI_BLK_AIUPL) | (asi == `ASI_BLK_AIUSL) |
		   (asi == `ASI_BLK_P) | (asi == `ASI_BLK_S) |
		   (asi == `ASI_BLK_PL) | (asi == `ASI_BLK_SL) |
		   (asi == `ASI_BLK_COMMIT_P) | (asi == `ASI_BLK_COMMIT_S);
end
endfunction

function Is_qld_asi;
input [7:0] asi;
begin
 		Is_qld_asi = (asi == `ASI_AIU_BIS_QUAD_LDD_P) | (asi == `ASI_AIU_BIS_QUAD_LDD_S) |
		(asi == `ASI_AIU_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_AIU_BIS_QUAD_LDD_S_LITTLE) |
		(asi == `ASI_NUCLEUS_BIS_QUAD_LDD) | (asi == `ASI_NUCLEUS_BIS_QUAD_LDD_LITTLE) |
		(asi == `ASI_BIS_QUAD_LDD_P) | (asi == `ASI_BIS_QUAD_LDD_S) |
		(asi == `ASI_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_BIS_QUAD_LDD_S_LITTLE) |
		(asi == `ASI_QUAD_LDD) | (asi == `ASI_QUAD_LDD_REAL) |
		(asi == `ASI_QUAD_LDD_L) | (asi == `ASI_QUAD_LDD_REAL_L);
end
endfunction

function Is_bis_asi;
input [7:0] asi;
begin
 		Is_bis_asi = (asi == `ASI_AIU_BIS_QUAD_LDD_P) | (asi == `ASI_AIU_BIS_QUAD_LDD_S) |
		(asi == `ASI_AIU_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_AIU_BIS_QUAD_LDD_S_LITTLE) |
		(asi == `ASI_NUCLEUS_BIS_QUAD_LDD) | (asi == `ASI_NUCLEUS_BIS_QUAD_LDD_LITTLE) |
		(asi == `ASI_BIS_QUAD_LDD_P) | (asi == `ASI_BIS_QUAD_LDD_S) |
		(asi == `ASI_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_BIS_QUAD_LDD_S_LITTLE);
end
endfunction

always @ (negedge (`SPC6.l2clk & enabled))
begin //{
	Chk_store;
	store_alloc = 1'b0;
	if (lsu_inst_m != 0)
	begin
		if (`SPC6.dec_flush_lm)
		begin
			lsu_inst_m <= 0;
			`PR_INFO("lsu_mon", 21, "<C%0h> <T%0h> <%0h> M_stage: %s(VA=%0h) Flushed due to IFU Flush.", core_id, dec_lsu_tid_m, inst_pc_m, tb_top.intf0.xlate(inst_m),vaddr_m);
		end
	end
		
	if (lsu_inst_b != 0)
	begin //{
		if (lsu_inst_b[`BLKLD])  print_inst = " BLKLD,";
		else if (lsu_inst_b[`BLKST])  print_inst = " BLKST,";
		else if (lsu_inst_b[`QLD])  print_inst = " QLD,";
		else  print_inst = "";

		if (`SPC6.dec_flush_lb)
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%0h> <T%0h> <%0h> B_stage: %s(VA=%0h) Flushed due to IFU Flush.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		else if (`SPC6.tlu_flush_lsu_b)
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h) Flushed due to TLU Flush.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		//casa is a two cycle operation. If there is an err on the 2nd cycle of casa then also
		//casa shd be killed.
		//This function will also chk for errors on 2nd cycle.
		else if (Is_exu_error(exu_lsu_va_error_b, exu_ecc_b))  
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h <%0h> B_stage: %s(VA=%0h) Flushed due to EXU error.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		else if ((`SPC6.fgu_cecc_fx2 || `SPC6.fgu_uecc_fx2) && lsu_inst_b[`ST] && lsu_inst_b[`FP]) 
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h) Flushed due to FGU error.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		else if (IsExc(core_id)) 
			lsu_inst_b <= 0;
		else if (!`SPC6.lsu_tlb_miss_b_)
		begin
			`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h)%s ASI = %0h. DTLB miss.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, asi_b);
				//Insert_tlb_miss_info;
		end
		else 
		begin //{
		//Lsu doesn't assert lsu_sync for an exception or dtlb miss. Since for
		//an exception tlu anyway tells the front end to flush itself there is 
		//no reason for LSU to flush the front end then TLU to flush it again.
		//Lsu treats the dtlbmiss as an exception that it flushes the  inst and
		//handles it when it is reissued by the front end.

		   if (`SPC6.lsu_tlb_bypass_b)
		   begin
			if (`SPC6.lsu_sync != 8'b0)
			begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. LSU_sync. DTLB Bypass.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC6.lsu.tlb_pgnum[39:13], vaddr_b[12:0]},  asi_b);
			end
			else
			begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. DTLB Bypass.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC6.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b);
			end
		  end
	          else
		  begin
			if (`SPC6.lsu_sync != 8'b0)
			begin
			  if (lsu_inst_b[`ST])
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h, Store_data = %0h. LSU_sync. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC6.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b,int_st_data_b);
			  end
			  else
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. LSU_sync. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC6.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b);
			  end
			end
			else
			begin
			  if (lsu_inst_b[`ST])
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h, Store_data = %0h. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC6.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b, int_st_data_b);
			  end
			  else
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC6.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b);
		          end
		        end
		  end

	          if (lsu_inst_b[`LD] || lsu_inst_b[`PREF] || lsu_inst_b[`SWAP] || lsu_inst_b[`CASA] || lsu_inst_b[`LDSTUB])
		  begin //{
			if (((lsu_inst_b == 16'h1) || (lsu_inst_b == 16'h5)) & `SPC6.lsu.stb_cam_hit)
			begin
				`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h>: LSU_sync asserted due to STB RAW.", core_id, dec_lsu_tid_b, inst_pc_b);
			end
		  end //}

		  if (lsu_inst_b[`LD])
			Insert_ld_miss_info;

		  if (lsu_inst_b[`ST])  //for atomics both ld and store signals are asserted
		  begin
			Make_STB_data;
			store_alloc = 1'b1;
		  end
		  Insert_in_last_inst_array;

		if (`SPC6.lsu_trap_flush[7:0])
		begin
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h> Trap Flush asserted.", core_id, decode_tid(`SPC6.lsu_trap_flush[7:0]));
		end
	    end //}
	end //}
end //}

//STB ue testing:
//This is how we test squashing of stores by LSU_mon:
//Whenever lsu asserts err_sbdiou signal, the monitor sets the squash
//bit in the STB for the rest of the stores. If any of these squashed stores
//is issued on the asi ring or to the PCX interface the monitor complains.
//The squashed stores are deallocated when either a block_store_kill is
//asserted or dealloc signals are asserted by the LSU.
//When the block_store_kill is asserted, it tells the IFU to dealloc
//all the pending stores in the IFU. It means the when block_store_kill
//is asserted we have deallocated all the non-squashed requests from STB.
//The 0in_chkr ensures that LSU flags the correct index and priv with the
//the sbdiou signal to TLU.


always @ (negedge (`SPC6.l2clk & enabled))
begin
	if (`SPC6.lsu_l15_valid & `SPC6.lsu.spc_pcx_data_pa[129])
		Chk_pcx_req_pkt(`SPC6.lsu.spc_pcx_data_pa[129:0]);  //chk if we need .lsu here
	if ((`SPC6.lsu_rngl_cdbus[64:63] == 2'b11) & ~`SPC6.lsu_rngl_cdbus[59])
		Chk_st_on_ASI_ring(`LOCAL);

	if ((`SPC6.lsu_rngf_cdbus[64:63] == 2'b11) & ~`SPC6.lsu_rngf_cdbus[59])
		Chk_st_on_ASI_ring(`FAST);

	//if (`SPC6.l15_lsu_valid)
		//Chk_cpx_response_pkt({`SPC6.l15_lsu_valid, `SPC6.l15_lsu_cpkt[17:13],`SPC6.l15_lsu_cpkt[11:0],`SPC6.l15_spc_data1[127:0]});
	
	if (`SPC6.cpx_spc_data_cx[145])
		Chk_cpx_response_pkt(`SPC6.cpx_spc_data_cx);
	
	if (`SPC6.lsu_complete[7:0] != 8'b0)
	begin
		if (`SPC6.lsu_complete[0]) Chk_ld_complete(0);
		if (`SPC6.lsu_complete[1]) Chk_ld_complete(1);
		if (`SPC6.lsu_complete[2]) Chk_ld_complete(2);
		if (`SPC6.lsu_complete[3]) Chk_ld_complete(3);
		if (`SPC6.lsu_complete[4]) Chk_ld_complete(4);
		if (`SPC6.lsu_complete[5]) Chk_ld_complete(5);
		if (`SPC6.lsu_complete[6]) Chk_ld_complete(6);
		if (`SPC6.lsu_complete[7]) Chk_ld_complete(7);
	end
	
	if (`SPC6.lsu_block_store_kill[7:0] != 8'b0)
	begin
		if (`SPC6.lsu_block_store_kill[0]) Squash_STB(0);
		if (`SPC6.lsu_block_store_kill[1]) Squash_STB(1);
		if (`SPC6.lsu_block_store_kill[2]) Squash_STB(2);
		if (`SPC6.lsu_block_store_kill[3]) Squash_STB(3);
		if (`SPC6.lsu_block_store_kill[4]) Squash_STB(4);
		if (`SPC6.lsu_block_store_kill[5]) Squash_STB(5);
		if (`SPC6.lsu_block_store_kill[6]) Squash_STB(6);
		if (`SPC6.lsu_block_store_kill[7]) Squash_STB(7);
	end
	
	if (`SPC6.lsu_stb_dealloc[7:0] != 8'b0)
	begin
		if (`SPC6.lsu_stb_dealloc[0]) Dealloc_STB(0);
		if (`SPC6.lsu_stb_dealloc[1]) Dealloc_STB(1);
		if (`SPC6.lsu_stb_dealloc[2]) Dealloc_STB(2);
		if (`SPC6.lsu_stb_dealloc[3]) Dealloc_STB(3);
		if (`SPC6.lsu_stb_dealloc[4]) Dealloc_STB(4);
		if (`SPC6.lsu_stb_dealloc[5]) Dealloc_STB(5);
		if (`SPC6.lsu_stb_dealloc[6]) Dealloc_STB(6);
		if (`SPC6.lsu_stb_dealloc[7]) Dealloc_STB(7);
	end

	if (`SPC6.lsu_block_store_stall)
	      Chk_block_store;

	if (`SPC6.lsu.lsu_block_store_alloc[7:0] != 8'b0)
		Set_block_store_parameters;

	if (`SPC6.lsu_sbdiou_err_g || `SPC6.lsu_sbapp_err_g)
		Squash_store;

	if (`SPC6.lsu_stb_flush_g)
		st_priv[`SPC6.lsu_stberr_tid_g] = get_priv_on_flush(`SPC6.lsu_stberr_tid_g);
end

function [1:0] get_priv_on_flush;
input [2:0] tid;
reg [2:0] sq_index;
reg [204:0] tmp;

begin
	sq_index = `SPC6.lsu_stberr_index_g;
	tmp = stb[{tid, sq_index}];
	get_priv_on_flush = tmp[`ST_PRIV];
end
endfunction

task Chk_block_store;
reg [20:0] inst;
reg [2:0] thid;
begin
		thid = `SPC6.lsu_block_store_tid;
		bst_inst_data = stb[{thid, rdptr[thid]}];
		inst = bst_inst_data[`LSU_MON_INST];

		if (~inst[`BLKST])
		begin
			Disp_STB_entry(thid, iss_ptr[thid]);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted blk_store_stall while the req at the top of STB is not blkst as shown above", core_id, thid);
		end
end
endtask

//lsu can assert block_store_stall for a new block store while it has not yet written
//the 8 stb entries from the previous blk store.

task Set_block_store_parameters;
reg [2:0] thid;
begin
	
		thid = decode_tid(`SPC6.lsu.lsu_block_store_alloc[7:0]);
		if (lsu_bst_active[thid])
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted blk_store_alloc while the bst_active is already set for this thread.", core_id, thid);
		end
		else
		begin
			lsu_bst_active[thid] = 1'b1;
			bst_active_thid = thid;
			if (`SPC6.lsu.fgu_fst_ecc_error_fx2)
			    bst_fgu_err = 1'b1;
			else
			    bst_fgu_err = 1'b0;
		end
end
endtask

task Squash_store;
reg [2:0] thid;
reg [2:0] sq_index;
reg [2:0] i;
reg [204:0] tmp;
reg [3:0] squash_cnt;
reg [1:0] priv;

begin
	thid = `SPC6.lsu_stberr_tid_g;
	sq_index = `SPC6.lsu_stberr_index_g;
	priv = `SPC6.lsu_stberr_priv_g;
	tmp = stb[{thid, sq_index}];
	squash_cnt = 0;
     	`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Sbdiou/sbapp seen for index = %h and priv = %h.", core_id, thid, sq_index,  priv);

	st_priv[thid] = tmp[`ST_PRIV];

	//lsu can assert deallocate before it asserts the sbdiou signal. 
	//In that case iss_ptr won't be equal to sbdiou index.
	//if (sq_index != iss_ptr[thid])
	//begin
	//	Disp_STB_entry(thid, iss_ptr[thid]);
	//	`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted sbdiou/sbapp with index %0h while the next req to be issued is at index %0h.", core_id, thid, sq_index, iss_ptr[thid]);
	//end
	
	//If there is only one store in the store buffer which gets an sbdiou error, then LSU can deallocate
	//the store and then assert sbdiou. The deallocation will cause the stb issue_ptr to move 
	//forward to an inst. that has already been issued and completed and this chk can fire. So
	//removing this chk. 

        //if (tmp[`L2_ST_ISS])
        //begin
         //       Disp_STB_entry(thid, iss_ptr[thid]);
          //      `PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store reissued on the PCX interface.", core_id, thid, tmp[`MEMOP_PA]);
        //end

	if (iss_ptr[thid] == wrptr[thid])
	begin
	    if (stb_valid[{thid, wrptr[thid]}])
		squash_cnt = 8;
	    else
	    begin
	    //changing it to an info message because if there is only one valid entry in store buffer that
	    //gets an sbdiou then LSU can deallocate the entry and then issue sbdiou.
              	//`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Lsu asserted sbdiou/sbapp while there are no valid entries in STB to be issued.", core_id, thid);
              	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> sbdiou/sbapp squashed only one entry in STB.", core_id, thid);
	    end
	end
	else
	begin
	  if (iss_ptr[thid] < wrptr[thid])
		squash_cnt = wrptr[thid] - iss_ptr[thid];
	  else if (iss_ptr[thid] > wrptr[thid])
		squash_cnt = wrptr[thid] + (8 - iss_ptr[thid]);
	end
	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> SQUASH_STORE:iss_ptr = %0h, wrptr = %0h, squash_cnt = %0h.", core_id, thid, iss_ptr[thid], wrptr[thid], squash_cnt);

	i = iss_ptr[thid];
		
	while (squash_cnt)
	begin
		tmp = stb[{thid, i}];
		tmp[`ST_SQUASH] = 1'b1;
		if (priv < tmp[`ST_PRIV])
		begin
              		`PR_INFO("lsu_mon", `INFO, "<C%h> <T%0h> <PA = %0h> Sbdiou/sbapp signalled. Err in user/priv level store is squashing a higher priv level store.", core_id, thid, tmp[`MEMOP_PA]);
			priv = tmp[`ST_PRIV];
		end
			
		stb[{thid, i}] = tmp;
               	`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <PA = %0h> STB_entry[%0h] squashed.", core_id, thid, tmp[`MEMOP_PA], i);
	   	 
		 i = i + 1;
		 squash_cnt = squash_cnt - 1'b1;
	end
end
endtask

function [2:0] decode_tid;
input [7:0] thid_encode;
begin
	case (thid_encode)
	   8'h1: decode_tid = 3'b0;
	   8'h2: decode_tid = 3'h1;
	   8'h4: decode_tid = 3'h2;
	   8'h8: decode_tid = 3'h3;
	   8'h10: decode_tid = 3'h4;
	   8'h20: decode_tid = 3'h5;
	   8'h40: decode_tid = 3'h6;
	   8'h80: decode_tid = 3'h7;
	   default: 
	   begin
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> decode_tid. Incorrect value of thid input = %0h.", core_id, thid_encode, thid_encode);
	   end
	endcase
end
endfunction

task Chk_ld_complete;
input [2:0] thid;
reg [`LD_Pend_Width] tmp;
begin
	tmp = ld_pend_array[thid];

	if (ld_valid[thid])
	begin
		if ((tmp[`L2_ISS] != 4'hf) || (tmp[`L2_RESP] != 4'hf))
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted lsu_complete while the l2_iss and l2_resp bits are not F.", core_id, thid);
		end
		ld_valid[thid] = 1'b0;
		`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h> %s(VA=%0h) Complete. Setting ld_valid to 0.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
	end

	tmp = last_inst_array[thid];
	`PR_INFO("lsu_mon", 24, "<C%h> <T%0h> <%0h> %s(VA=%0h) Complete.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
end
endtask
	
task Chk_pcx_req_pkt;
input [129:0] pcx_pkt;
reg [2:0] thid;
reg [`LD_Pend_Width] tmp, tmp1; 
reg [15:0] inst; 
reg [11*8:0] req;
reg [39:0] addr;
begin 
	thid = pcx_pkt[`PCX_THR_ID]; 
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	req = DispPCXReq(pcx_pkt);
	addr = pcx_pkt[`PCX_ADDR];


	if (pcx_pkt[`PCX_CPU_ID] != core_id)
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> cpu_id (spc_pcx_data_pa[122:120]) = %h is not = %0h when the lsu made a %s req to gasket.", core_id, pcx_pkt[`PCX_THR_ID], addr, pcx_pkt[122:120], core_id, req);
	
	
	if ((pcx_pkt[`PCX_RQTYP] == `PCX_LOAD) || (pcx_pkt[`PCX_RQTYP] == `PCX_CAS1) || (pcx_pkt[`PCX_RQTYP] == `PCX_CAS2) || (pcx_pkt[`PCX_RQTYP] == `PCX_SWAP_LDSTUB))
	begin
	  if (~ld_valid[thid])
	  begin
		ld_valid[thid] = 1'b1;  //we have sent a req to gasket and are waiting for response
		`PR_INFO("lsu_mon", 22, "<C%0h> <T%0h> Setting ld_valid[%0h].", core_id, thid, thid);
	  end
		if (~inst[`BLKLD])
		begin
			if (tmp[`MEMOP_PA] != addr)
			begin
				if ((tmp[`INST_ASI] == 8'h41) || (tmp[`INST_ASI] == 8'h73) || ((tmp[`INST_ASI] == 8'h45) && ((tmp[`MEMOP_PA] == 8'h10) || (tmp[`MEMOP_PA] == 8'h18))))
				begin
					`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <PA = %0h> PA mismatch on gasket for %s request. Ignoring the mismatch as inst. is issued with asi 41, 73 or 45 (with VA 0x10 or 18).", core_id, thid, addr, req);
				end
				else
				begin
					DispPendReq(thid);
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A %s request made to gasket by LSU while the pending req is with PA %0h.", core_id, thid, addr, req, tmp[`MEMOP_PA]);
				end
			end
		end
	end

	case (pcx_pkt[`PCX_RQTYP])
	   `PCX_LOAD: 
	   begin
		if (pcx_pkt[`PCX_PF])
		begin
			if (~inst[`PREF])
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A prefetch request made to gasket by LSU which mismatches the pending request from the thread.", core_id, thid, addr);
			end
			if (pcx_pkt[`PCX_INV])
			begin
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: PREF_ICE(VA=%0h) Issued. pf_cnt not updated.", core_id, thid, tmp[`INST_VA], tmp[`MEMOP_VA]);
			end
			else
			begin
			 	pf_cnt[thid] = pf_cnt[thid] + 1'b1;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Issued. pf_cnt = %0d.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], pf_cnt[thid]);
			end
			tmp[`L2_ISS] = 4'hF;
			tmp[`L2_RESP] = 4'hF; //we don't wait for a prefetch response from gasket
			ld_pend_array[thid] = tmp;
		end
		else 
		begin
			if (pcx_pkt[`PCX_INV])
			begin
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Dcache invalidate pkt issued to CCX.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
				dcache_inv_cnt[thid] = dcache_inv_cnt[thid] + 1'b1;
			end
			else
			begin
				Chk_req_load(pcx_pkt);
			end
		end
	    end
           `PCX_CAS1, `PCX_CAS2:
	   begin
		if (~inst[`CASA])
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> CASA request made to gasket by LSU while no such request request is pending from this thread.", core_id, thid, addr);
		end
		if (pcx_pkt[`PCX_RQTYP] == `PCX_CAS1)
		begin
			tmp[`L2_ISS] = 4'hE;
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) (CAS1) Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			ld_pend_array[thid] = tmp;
		end
		if (pcx_pkt[`PCX_RQTYP] == `PCX_CAS2)
		begin
			tmp[`L2_ISS] = 4'hF;
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) (CAS2) Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			ld_pend_array[thid] = tmp;
			chk_store_issue_to_pcx(pcx_pkt);
		end
		
	   end
	   `PCX_SWAP_LDSTUB:
	   begin
		if (~inst[`SWAP] && ~inst[`LDSTUB])
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> %s request made to gasket by LSU while no such request request is pending from this thread.", core_id, thid, addr, req);
		end
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Issued to gasket. store_data = %0h", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], pcx_pkt[`PCX_DATA]);
		tmp[`L2_ISS] = 4'hF;
		ld_pend_array[thid] = tmp;
		
		chk_store_issue_to_pcx(pcx_pkt);
	   end

	    `PCX_STORE:
	    begin
		chk_store_issue_to_pcx(pcx_pkt);
	    end
	   
	   default: `PR_INFO("lsu_mon", 21, "<C%h> <T%0h> <%0h>: %s Issued to gasket.", core_id, thid, addr, req);
	endcase
end
endtask

task Chk_cpx_response_pkt;
input [145:0] cpx_pkt;
reg [2:0] thid;
begin
	thid = cpx_pkt[`CPX_THR_ID];	

	casex ({cpx_pkt[`CPX_RTNTYP], cpx_pkt[`CPX_ERR], cpx_pkt[`CPX_NC], cpx_pkt[`CPX_ATM], cpx_pkt[`CPX_PF]})
	  {4'b0, 2'bxx, 1'bx, 1'b0, 1'b0}:  
	  begin
		chk_ccx_ld_response(cpx_pkt);
	  end

	  {4'b0, 2'bxx, 1'b1, 1'b0, 1'b1}:  
	  begin
		if (pf_cnt[thid] == 8'b0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Prefetch response received from gasket while the pf_cnt is 0 for this thread.", core_id, thid);
		end
		else
		begin
			pf_cnt[thid] = pf_cnt[thid] - 1'b1;
			`PR_INFO("lsu_mon", 26, "<C%h> <T%0h> Prefetch response received. pfcnt = %0d.", core_id, thid, pf_cnt[thid]);
		end
	  end
	  
	  {4'h8, 2'bxx, 1'b1, 1'b0, 1'b0}:  
		chk_ccx_ld_response(cpx_pkt);

	  {4'h4, 2'bxx, 1'bx, 1'b0, 1'b0}:  
	   begin
	      if (cpx_pkt[123])  //D pkt
	      begin //{
		if (cpx_pkt[120:118] != core_id)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> D response received from gasket with core_id =%h.", core_id, thid, cpx_pkt[120:118]);
		end
		if (dcache_inv_cnt[thid] == 8'b0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> D response received from gasket while the Dcache_inv_cnt is 0 for this thread.", core_id, thid);
		end
		else
		begin
			dcache_inv_cnt[thid] = dcache_inv_cnt[thid] - 1'b1;
			`PR_INFO("lsu_mon", 26, "<C%h> <T%0h> D response received. Dcache_inv_cnt = %0d.", core_id, thid, dcache_inv_cnt[thid]);
		end
	     end  //}
	     else if (cpx_pkt[124])  //I pkt
	     begin
		if (cpx_pkt[120:118] != core_id)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> I response received from gasket with core_id =%h.", core_id, thid, cpx_pkt[120:118]);
		end
		//`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> I pkt.", core_id, thid);
	     end
	     else if (cpx_pkt[124:123] == 2'b0)
	     begin
		if (cpx_pkt[120:118] == core_id)
		begin
			chk_ccx_st_response(cpx_pkt);
	        end
		else
		begin
			`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Store Ack pkt received from core %0h.", core_id, thid, cpx_pkt[120:118]);
		end
	     end
	   end

	  {4'h1, 2'bxx, 1'bx, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> IFILL1 return.", core_id, thid);
	  {4'h1, 2'bxx, 1'bx, 1'b1, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> IFILL2 return.", core_id, thid);
	  {4'h9, 2'bxx, 1'b1, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> NCU IFILL return.", core_id, thid);
	  
	  {4'b0, 2'bxx, 1'b1, 1'b1, 1'b0}:  
	  begin
		chk_ccx_atm_response(cpx_pkt);
	  end
	  {4'h4, 2'bxx, 1'b1, 1'b1, 1'b0}:  
	  begin
		if ((cpx_pkt[`CPX_RTNTYP] == 4'h4) & (cpx_pkt[120:118] == core_id))
		begin
			chk_ccx_atm_response(cpx_pkt);
			chk_ccx_st_response(cpx_pkt);
		end
	  end
			
	  {4'h2, 2'bxx, 1'b1, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Stream Ld return.", core_id, thid);
	  {4'h6, 2'bxx, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Stream store Ack.", core_id, thid);
	  {4'h5, 2'bxx, 1'b1, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> MMU ld return.", core_id, thid);
	  {4'h7, 2'b00, 1'b0, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Interrupt return.", core_id, thid);
	  {4'h3, 2'b00, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Eviction Invalidation.", core_id, thid);
	  {4'hc, 2'bxx, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> L2 Indication.", core_id, thid);
	  
	  {4'hd, 2'bxx, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Soc Error Indication.", core_id, thid);
	   
	  default:
	  begin
		`PR_ALWAYS("lsu_mon", `ALWAYS, "CPX_PKT data.");
		`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%0h> <T%0h> rtn_typ = %0h, err_bits = %0h, nc=%0b, atm = %0b, pf = %0b",  core_id, cpx_pkt[`CPX_THR_ID], cpx_pkt[`CPX_RTNTYP], cpx_pkt[`CPX_ERR], cpx_pkt[`CPX_NC], cpx_pkt[`CPX_ATM], cpx_pkt[`CPX_PF]);

		`PR_ERROR("lsu_mon", `ERROR, "<C%0h> <T%0h> Can't recognise the CPX pkt.",  core_id, thid);
	  end

	endcase
end
endtask

task chk_ccx_ld_response;
input [145:0] cpx_pkt;
reg [2:0] thid;
reg [20:0] inst;
reg [39:0] cpx_pa, inst_pa;
reg [`LD_Pend_Width] tmp;
reg [3:0] pkt_type;
begin
	thid = cpx_pkt[`CPX_THR_ID];
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	inst_pa = tmp[`MEMOP_PA];
	pkt_type = cpx_pkt[`CPX_RTNTYP];

	   if (ld_valid[thid])
	   begin 
			`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) L2 response.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
		/* 
			if (inst_pa[39] != pkt_type[3])
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> ccx pkt_type = %h mismatches the ld_pa bit 39. ld_pa = %0h.", core_id, thid, pkt_type, inst_pa);
			end
		*/

			if (inst[`BLKLD])
			begin
				if (tmp[`L2_RESP] == 4'h0) 
				begin
					tmp[`L2_RESP] = 4'h1; 
					tmp[`L2_ERR0] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 1.", core_id, thid);
					end

				end
				else if (tmp[`L2_RESP] == 4'h1) 
				begin
					tmp[`L2_RESP] = 4'h3; 
					tmp[`L2_ERR1] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 2.", core_id, thid);
					end
				end
				else if (tmp[`L2_RESP] == 4'h3) 
				begin
					tmp[`L2_RESP] = 4'h7; 
					tmp[`L2_ERR2] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 3.", core_id, thid);
					end
				end
				else if (tmp[`L2_RESP] == 4'h7) 
				begin
					tmp[`L2_RESP] = 4'hF; 
					tmp[`L2_ERR3] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 4.", core_id, thid);
					end

					//is_blkld[thid] = 1'b1;
					if ((tmp[`L2_ERR0] == `ND) || (tmp[`L2_ERR1] == `ND) || (tmp[`L2_ERR2] == `ND) ||  (tmp[`L2_ERR3] == `ND))
						l2_blk_ld_errtype[thid] = `ND;
					else if ((tmp[`L2_ERR0] == `UE) || (tmp[`L2_ERR1] == `UE) || (tmp[`L2_ERR2] == `UE) ||  (tmp[`L2_ERR3] == `UE))
						l2_blk_ld_errtype[thid] = `UE;
					else if ((tmp[`L2_ERR0] == `CE) || (tmp[`L2_ERR1] == `CE) || (tmp[`L2_ERR2] == `CE) ||  (tmp[`L2_ERR3] == `CE))
						l2_blk_ld_errtype[thid] = `CE;
					else 
						l2_blk_ld_errtype[thid] = `NE;
				end
				else
				begin
					DispPendReq(thid);
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when response pkt received from ccx.", core_id, thid);
				end
			end
			else if (Is_single_pcx_req_ld(inst)) 
			begin
				//is_blkld[thid] = 1'b0;
				if (tmp[`L2_RESP] != 4'hE)
				begin
					DispPendReq(thid);
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when response pkt received from ccx.", core_id, thid);
				end
				//`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Setting L2_resp bits to F.", core_id, thid);
				tmp[`L2_RESP] = 4'hF;
			end
			else
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Load response received from gasket for thid %h while no load request pending from core for this thread.", core_id, thid, thid);
	     end
	     else
	     begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Load response received from gasket while no load request pending from core for this thread.", core_id, thid);
	     end

	ld_pend_array[thid] = tmp;
end
endtask

task chk_ccx_atm_response;
input [145:0] cpx_pkt;
reg [2:0] thid;
reg [20:0] inst;
reg [39:0] inst_pa;
reg [`LD_Pend_Width] tmp;
begin
	thid = cpx_pkt[`CPX_THR_ID];
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	inst_pa = tmp[`MEMOP_PA];

	if (~ld_valid[thid])
	begin
		if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ld response received from gasket while no request pending from core for this thread.", core_id, thid);
		end
		else
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ack response received from gasket while no request pending from core for this thread.", core_id, thid);
		end
	end
        else
   	begin 
		if (~inst[`SWAP] && ~inst[`CASA] && ~inst[`LDSTUB])
		begin
			DispPendReq(thid);
			if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
			begin
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ld response received from gasket which mismatches the request pending from this thread.", core_id, thid);
			end
			else
			begin
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ack response received from gasket which mismatches the request pending from this thread.", core_id, thid);
			end
		end
		else
		begin
		if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
		begin
			`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) Atomic ld response.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
		end
		else
		begin
			`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) Atomic ack.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
		end

		   if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
		   begin
			if (tmp[`L2_RESP] == 4'hC) tmp[`L2_RESP] = 4'hD; 
			else
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when atomic ld return pkt received from ccx.", core_id, thid);
			end
		  end
		  else
		  begin
			if (tmp[`L2_RESP] == 4'hD) tmp[`L2_RESP] = 4'hF; 
			else
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when atomic ack pkt received from ccx.", core_id, thid);
			end
		  end
		end
	end
	ld_pend_array[thid] = tmp;
end
endtask

task chk_ccx_st_response;
input [145:0] cpx_pkt;
reg [2:0] thid;
reg [20:0] inst;
reg [39:0] cpx_pa, inst_pa;
reg [204:0] tmp;
reg [3:0] pkt_type;
begin
	thid = cpx_pkt[`CPX_THR_ID];
	tmp = stb[{thid, ret_ptr[thid]}];
	inst = tmp[`LSU_MON_INST];
	inst_pa = tmp[`MEMOP_PA];
	pkt_type = cpx_pkt[`CPX_RTNTYP];


//is received. There could be some other store sitting in the STB at that time.

//Chk for squash bit only for non-bis responses.


	if (cpx_pkt[`CPX_BIS])  //response to rmo store
	begin
		if (st_rmo_cnt[thid] == 0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> L2 response received for an rmo store while the st_rmo_cnt for this thread is 0.", core_id, thid);
		end
		else
		begin
			st_rmo_cnt[thid] = st_rmo_cnt[thid] - 1'b1;
			`PR_INFO("lsu_mon", 25, "<C%0h> <T%0h> Store ack received for RMO store. rmo_cnt = %0d", core_id, thid, st_rmo_cnt[thid]);
		end
	end
	else
	begin
	   if (tmp[`ST_SQUASH])
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> L2 response received while the SQUASH bit is set in the STB entry %0h.", core_id, thid, ret_ptr[thid]);
	   
           if (~stb_valid[{thid, ret_ptr[thid]}])
           begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Store ack received while that entry is invalid in STB.", core_id, thid);
	   end
	   else
	   begin
	      if (~cpx_pkt[`CPX_ATM])  //don't print this message for atomic return
	      begin
		`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) STB[%0d] Store ack.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA], ret_ptr[thid]);
              end
	      tmp[`L2_ACK] = 1'b1;
	      stb[{thid, ret_ptr[thid]}] = tmp;
		ret_ptr[thid] = ret_ptr[thid] + 1'b1;
		//`PR_INFO("lsu_mon", 22, "<C%0h> <T%0h> ret_ptr = %0d.", core_id, thid, ret_ptr[thid]);
	   end
	end
end
endtask

task Chk_req_load;
input [129:0] pcx_pkt;
reg [2:0] thid;
reg [`LD_Pend_Width] tmp;
reg [39:0] pcx_pa, inst_pa;
reg [20:0] inst;
reg [11*8:0] req;
begin
	
	thid = pcx_pkt[`PCX_THR_ID];
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	pcx_pa = pcx_pkt[`PCX_ADDR];
	inst_pa = tmp[`MEMOP_PA];
	req = DispPCXReq(pcx_pkt);

	if (inst[`BLKLD])
	begin
		if (pcx_pa[39:6] != inst_pa[39:6])
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A load request made to gasket by LSU while the pending req has PA %0h.", core_id, thid, pcx_pa, tmp[`MEMOP_PA]);
		end
		if (pcx_pa[5:0] == 6'b0)
		begin
			if (tmp[`L2_ISS] != 4'h0 )
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 1st load request (pa[5:0] = 6'b0) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				tmp[`L2_ISS] = 4'h1;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 1st blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			end
				
		end
		if (pcx_pa[5:0] == 6'h10)
		begin
			if (tmp[`L2_ISS] != 4'h1)
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 2nd load request (pa[5:0] = 6'h10) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				tmp[`L2_ISS] = 4'h3;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 2nd blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			end
		end
		if (pcx_pa[5:0] == 6'h20)
		begin
			if (tmp[`L2_ISS] != 4'h3)
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 3rd load request (pa[5:0] = 6'h20) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				tmp[`L2_ISS] = 4'h7;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 3rd blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			end
		end
		if (pcx_pa[5:0] == 6'h30)
		begin
			if (tmp[`L2_ISS] != 4'h7)
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 4th load request (pa[5:0] = 6'h30) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 4th blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
				tmp[`L2_ISS] = 4'hF;
			end
		end
		ld_pend_array[thid] = tmp;
	end
	else if (Is_single_pcx_req_ld(inst)) 
	begin
	  if (tmp[`L2_ISS] == 4'hF)
	  begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Load request  made to gasket by LSU while this request has already been issued to gasket.", core_id, thid, pcx_pa);
	  end
	  else
	  begin
		tmp[`L2_ISS] = 4'hF;
		ld_pend_array[thid] = tmp;
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
	  end
	end
	else
	begin
		DispPendReq(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A load request made to gasket by LSU while there is no such ld request pending from this thread.", core_id, thid, pcx_pa);
	end
end
endtask

	
function Is_single_pcx_req_ld;
input [20:0] inst;
begin
	if (inst[`LDD] || inst[`QLD] || inst[`FSR_RD_WR] || (inst == 21'h1) || (inst == 21'h5))
		Is_single_pcx_req_ld = 1'b1;
	else
		Is_single_pcx_req_ld = 1'b0;
	//`PR_INFO("lsu_mon", 22, "<C%0h> Is_single_pcx_req_ld = %b. ", core_id, Is_single_pcx_req_ld);
end
endfunction
			          

function Is_trap;
input [2:0]tid;

begin
	Is_trap = 1'b0;
	case (`SPC6.lsu_trap_flush[7:0])
		8'h01: if (tid == 3'h0) Is_trap = 1'b1;
		8'h02: if (tid == 3'h1) Is_trap = 1'b1;
		8'h04: if (tid == 3'h2) Is_trap = 1'b1;
		8'h08: if (tid == 3'h3) Is_trap = 1'b1;
		8'h10: if (tid == 3'h4) Is_trap = 1'b1;
		8'h20: if (tid == 3'h5) Is_trap = 1'b1;
		8'h40: if (tid == 3'h6) Is_trap = 1'b1;
		8'h80: if (tid == 3'h7) Is_trap = 1'b1;
	endcase
end
endfunction

function [8*11:0] DispPCXReq;
input [129:0] pcx_pkt;
begin
	casex ({pcx_pkt[`PCX_RQTYP], pcx_pkt[`PCX_NC], pcx_pkt[`PCX_INV], pcx_pkt[`PCX_PF], pcx_pkt[`PCX_BIS]})
		{5'h0, 1'b1, 1'b0, 1'b1, 1'b0}: DispPCXReq = "PREF";
		{5'h0, 1'b1, 1'b1, 1'b1, 1'b0}: DispPCXReq = "PREF_ICE";
		{5'h0, 1'bx, 1'b0, 1'b0, 1'b0}: DispPCXReq = "LD";
		{5'h0, 1'bx, 1'b1, 1'b0, 1'b0}: DispPCXReq = "D";  
		{5'h10, 1'bx, 1'b0, 1'b0, 1'b0}: DispPCXReq = "I";
		{5'h10, 1'b0, 1'b1, 1'b0, 1'b0}: DispPCXReq = "I";
		{5'h1, 1'bX, 1'bX, 1'b0, 1'b0}: DispPCXReq = "ST";
		{5'h1, 1'bX, 1'bX, 1'b1, 1'b1}: DispPCXReq = "BLKST";
		{5'h1, 1'bX, 1'bX, 1'b0, 1'b1}: DispPCXReq = "BIS";
		{5'h2, 1'b1, 1'bX, 1'b0, 1'b0}: DispPCXReq = "CASA1";
		{5'h3, 1'b1, 1'bX, 1'b0, 1'b0}: DispPCXReq = "CASA2";
		{5'h7, 1'b1, 1'bX, 1'b0, 1'b0}: DispPCXReq = "SWAP_LDSTUB";
		{5'h4, 1'b1, 1'b0, 1'b0, 1'b0}: DispPCXReq = "STREAM_LD";
		{5'h5, 1'b1, 1'b0, 1'b0, 1'bx}: DispPCXReq = "STREAM_ST";
		{5'h8, 1'b1, 1'b0, 1'b0, 1'b0}: DispPCXReq = "MMU_LD";
		//{5'h9, 1'b0, 1'b0, 1'b0, 1'b0}: DispPCXReq = "INT";
		default:
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%0h> <T%0h> <%0h> Can't recognise the PCX pkt type. rq_type = %h, nc_bit = %0b, inv_bit = %0b, pf_bit = %0b, bis_bit = %0b. pcx_pkt[129:0] = %h",  core_id, pcx_pkt[`PCX_THR_ID], pcx_pkt[`PCX_ADDR], pcx_pkt[`PCX_RQTYP], pcx_pkt[`PCX_NC], pcx_pkt[`PCX_INV], pcx_pkt[`PCX_PF], pcx_pkt[`PCX_BIS], pcx_pkt);
			DispPCXReq = " ";
		end
	 endcase
end
endfunction

function IsExc;
input [2:0] core_id;
reg [21*8:0] DispExc;

begin
	DispExc = 170'b0;
	IsExc = 1'b0;

	if (`SPC6.lsu_align_b) DispExc = "Addr_not_aligned";
	if (`SPC6.lsu_lddf_align_b) DispExc = "LDDF_Addr_not_aligned";
	if (`SPC6.lsu_stdf_align_b) DispExc = "STDF_Addr_not_aligned";
	if (`SPC6.lsu_priv_action_b) DispExc = "Priv_actio";
	if (`SPC6.lsu_va_watchpoint_b) DispExc = "VA_watchpoint";
	if (`SPC6.lsu_pa_watchpoint_b) DispExc = "PA_watchpoint";
	//if (`SPC6.lsu_tlb_miss_b_) DispExc = "Tlb_miss";
	if (`SPC6.lsu_illegal_inst_b) DispExc = "Illegal_inst";
	if (`SPC6.lsu_daccess_prot_b) DispExc = "Data_access_prot_exc";
	if (`SPC6.lsu_dae_invalid_asi_b) DispExc = "Dae_Invalid_asi";
	if (`SPC6.lsu_dae_nc_page_b) DispExc = "Dae_nc_page";
	if (`SPC6.lsu_dae_nfo_page_b) DispExc = "Dae_NFO_page";
	if (`SPC6.lsu_dae_priv_viol_b) DispExc = "Dae_Priv_viol";
	if (`SPC6.lsu_dae_so_page) DispExc = "Dae_so_page";
	//if (`SPC6.lsu_perfmon_trap_b) DispExc = "Perf_mon_trap";
	if (`SPC6.lsu_dtmh_err_b) DispExc = "DTLB_data_par_err";
	if (`SPC6.lsu_dttp_err_b) DispExc = "DTLB_tag_par_err";
	if (`SPC6.lsu_dtdp_err_b) DispExc = "DTLB_data_par_err";

	
	if (DispExc != 0)
	begin
		IsExc = 1'b1;
		`PR_INFO("lsu_mon", 23, "<C%0h> <T%0h> <%0h> B_stage: %s(VA=%0h) ASI = %0h. %s Exception.",core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, asi_b, DispExc);
	end

end
endfunction

function Is_exu_error;
input [1:0] exu_lsu_va_error_b;     // VA error requiring a flush
input [1:0] exu_ecc_b;              // ECC error requiring a flush
reg err_b;
reg err_m;

begin
	err_b = dec_lsu_tid_b[2] ? (exu_ecc_b[1] | (exu_lsu_va_error_b[1] & ~`SPC6.lsu_tlb_bypass_b)):
				(exu_ecc_b[0] | (exu_lsu_va_error_b[0] & ~`SPC6.lsu_tlb_bypass_b));

	err_m = (dec_lsu_tid_b[2] ? `SPC6.exu_ecc_m[1] : `SPC6.exu_ecc_m[0]) & `SPC6.lsu.dcc.twocycle_b;
					
	Is_exu_error = err_b | err_m;
end
endfunction

/*
task Insert_tlb_miss_info;
reg [127:0] tmp;
begin
	tmp =  128'b0;
	if (tlb_valid[dec_lsu_tid_b])
	begin
		tmp = tlbmiss_pend_array[dec_lsu_tid_b];
		Disp_tlbmiss_pend_array_entry(dec_lsu_tid_b);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h>) A new tlb miss request received while there is already a Tlb miss request pending from this thread as shown above.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
	end
	else
	begin
		tlb_valid[dec_lsu_tid_b] <= 1'b1;
		tmp[`INST_VA] = inst_pc_b;
		tmp[`MEMOP_VA] = vaddr_b;
		tmp[`INST] = inst_b;
	end
	tlbmiss_pend_array[dec_lsu_tid_b] = tmp;
end
endtask

*/

//problem with the signal.
/*
always @ (negedge `SPC6.l2clk)
begin
	if (mmu_dtlb_reload_d2)
		Chk_dtlb_reload;
end

task Chk_dtlb_reload;
reg [2:0] thid;
reg [127:0] tmp;
begin
		if (`SPC6.tlu_trap_pc_0_valid)
			thid = {1'b0, `SPC6.tlu_trap_0_tid};
		else if (`SPC6.tlu_trap_pc_1_valid)
			thid = {1'b0, `SPC6.tlu_trap_1_tid};
		else 
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> mmu_dtlb_reload asserted but trap_pc_0_valid and trap_pc_1_valid are both 0", core_id);

		if (~tlb_valid[thid])
			`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> mmu_dtlb_reload asserted while tlb_valid is 0.", core_id, thid);
		else
		begin
			tmp = tlbmiss_pend_array[dec_lsu_tid_b];
			`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> %s(VA=%0h> DTLB reloaded for VA = %0h.", core_id, thid, tb_top.intf0.xlate(tmp[`INST]), tmp[`INST_VA], tmp[`MEMOP_VA] );
			tlb_valid[thid] = 1'b0;
		end
end
endtask
*/

task Insert_ld_miss_info;
reg [`LD_Pend_Width] tmp;
begin
	tmp = 213'b0;
	if (ld_valid[dec_lsu_tid_b])
	begin
		tmp =  ld_pend_array[dec_lsu_tid_b];
		DispPendReq(dec_lsu_tid_b);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h>) A new request received while there is already a request pending from this thread as shown above.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
	end
	else
	begin
		//ld_valid[dec_lsu_tid_b] <= 1'b1;
		tmp[`INST_VA] = inst_pc_b;
		tmp[`MEMOP_VA] = vaddr_b;
		tmp[`MEMOP_PA] = {`SPC6.lsu.tlb_pgnum[39:13], vaddr_b[12:0]};
		tmp[`INST_ASI] = asi_b;

		if (lsu_inst_b[`BLKLD])
		begin
			tmp[`L2_ISS] =  4'h0;
			tmp[`L2_RESP] =  4'h0;
			is_blkld[dec_lsu_tid_b] = 1'b1;
		end
		else
		begin
		   is_blkld[dec_lsu_tid_b] = 1'b0;
		   if (lsu_inst_b[`CASA])
			tmp[`L2_ISS] =  4'hC;
		   else
			tmp[`L2_ISS] =  4'hE;
		   if (lsu_inst_b[`SWAP] || lsu_inst_b[`LDSTUB] || lsu_inst_b[`CASA])
			tmp[`L2_RESP] =  4'hC;
		   else
			tmp[`L2_RESP] =  4'hE;

		end

		tmp[`INST] = inst_b;
		tmp[`LSU_MON_INST] = lsu_inst_b; 
		ld_pend_array[dec_lsu_tid_b] = tmp;
	end
end
endtask


task Insert_in_last_inst_array;
reg [135:0] tmp;
begin
	tmp = 128'b0;
	tmp[`INST_VA] = inst_pc_b;
	tmp[`MEMOP_VA] = vaddr_b;
	tmp[`INST] = inst_b;
	tmp[135:128] = asi_b;
	last_inst_array[dec_lsu_tid_b] = tmp;
end
endtask


task DispPendReq;
input [2:0] thid;
reg [`LD_Pend_Width] tmp;
begin
	
	tmp =  ld_pend_array[thid];
	`PR_ALWAYS("lsu_mon", `ALWAYS, "LD_PEND_ARRAY[%0h] Data.", thid);
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> <%0h> %s(VA=%0h). PA = %0h. L2_ISS = %0h. L2_RESP = %0h, LSU_MON_INST=%h.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA], tmp[`MEMOP_PA], tmp[`L2_ISS], tmp[`L2_RESP], tmp[`LSU_MON_INST]);
end
endtask

task Disp_STB_entry;
input [2:0] thid;
input [2:0] ptr;
reg [204:0] tmp;
begin
	
	tmp =  stb[{thid, ptr}];
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> STB[%0h] data.", core_id, thid, ptr);
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> <%0h> %s(VA=%0h). PA = %0h. L2_ISS = %0h. L2_ACK = %0h, LSU_MON_INST=%h. RMO = %0b", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA], tmp[`MEMOP_PA], tmp[`L2_ST_ISS], tmp[`L2_ACK], tmp[`LSU_MON_INST], tmp[`RMO]);
end
endtask

/*
		
task Disp_tlbmiss_pend_array_entry;
input [2:0] thid;
reg [127:0] tmp;
begin
	tmp = tlbmiss_pend_array[thid];
	`PR_INFO("lsu_mon", 23, "TLB_MISS_PEND_ARRAY[%0h] Data.", thid);
	`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h> %s(VA=%0h).", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);

end
endtask

*/
task Disp_CPX_pkt;
input [145:0] cpx_pkt;
begin
	`PR_ALWAYS("lsu_mon", `ALWAYS, "CPX_PKT data.");
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%0h> <T%0h> rtn_typ = %0h, err_bits = %0h, nc=%0b, atm = %0b, pf = %0b",  core_id, cpx_pkt[`CPX_THR_ID], cpx_pkt[`CPX_RTNTYP], cpx_pkt[`CPX_ERR], cpx_pkt[`CPX_NC], cpx_pkt[`CPX_ATM], cpx_pkt[`CPX_PF]);
end
endtask
	

task Make_STB_data;
reg [204:0] tmp;
begin
		tmp = 0;
		tmp[`INST_VA] = inst_pc_b;
		tmp[`MEMOP_VA] = vaddr_b;
		tmp[`MEMOP_PA] = {`SPC6.lsu.tlb_pgnum[39:13], vaddr_b[12:0]};
		tmp[`L2_ST_ISS] =  1'b0;
		tmp[`ASI_ST_ISS] =  1'b0;
		tmp[`L2_ACK] =  1'b0;
		tmp[`INST] = inst_b;
		tmp[`LSU_MON_INST] = lsu_inst_b;
		tmp[`ST_SQUASH] = 1'b0;
		tmp[`INST_ASI] = asi_b;
		if (`SPC6.lsu.tlu_lsu_hpstate_hpriv[dec_lsu_tid_b])
		   tmp[`ST_PRIV] = `HPRIV; 
		else if (`SPC6.lsu.tlu_lsu_pstate_priv[dec_lsu_tid_b])
		   tmp[`ST_PRIV] = `PRIV; 
		else
		   tmp[`ST_PRIV] = `USER; 
		//bis_asi to io space is not rmo

		tmp[`RMO] = lsu_inst_b[`BLKST] | (dec_altspace_b & Is_bis_asi(asi_b) & ~`SPC6.lsu.tlb_pgnum[39]);
		stb_alloc_data <= tmp;
end
endtask

task Insert_in_STB;
input [195:0] store_data;
input [2:0] thid;
begin
	if (stb_full(thid))
	begin
		//DispSTB(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> STB full and a new store received for insertion in STB.", core_id, thid);
	end
	else
	begin
		stb[{thid, wrptr[thid]}] = store_data;
		//Disp_STB_entry(thid, wrptr[thid]);
		`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h> %s(VA=%0h). STB[%0h] Inserted.", core_id, thid, store_data[`INST_VA], tb_top.intf0.xlate(store_data[`INST]), store_data[`MEMOP_VA], wrptr[thid]);
		stb_valid[{thid, wrptr[thid]}] = 1'b1;
		wrptr[thid] = wrptr[thid] + 1'b1;
		//`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> wrptr = %0d.", core_id, thid, wrptr[thid]);
	end
end
endtask

function stb_full;
input [2:0] thid;
begin
	if ((wrptr[thid] == rdptr[thid]) && stb_valid[{thid, wrptr[thid]}])
		stb_full = 1'b1;
	else
		stb_full = 1'b0;
end
endfunction
	

task Dealloc_STB;
input [2:0] thid;
reg [204:0] tmp;
reg [20:0] lsu_inst;
begin
	//thid = decode_tid(`SPC6.lsu_stb_dealloc);
	tmp = stb[{thid, rdptr[thid]}];
	lsu_inst = tmp[`LSU_MON_INST];
	if (~stb_valid[{thid, rdptr[thid]}])
	begin
		//DispSTB(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_dealloc = %0h asserted while the stb entry is invalid for that thid.", core_id, thid, `SPC6.lsu_stb_dealloc);
	end
	if (tmp[`L2_ST_ISS]) 
	begin
	    if (~tmp[`L2_ACK])
	    begin
		Disp_STB_entry(thid, rdptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_dealloc = %0h asserted when we haven't received the response from the gasket.", core_id, thid, `SPC6.lsu_stb_dealloc);
	    end
	end
	else if (tmp[`ASI_ST_ISS])
	begin
		ret_ptr[thid] = ret_ptr[thid] + 1'b1;
	end
	//blkst inst. is not issued anywhere, blkst helpers are issued.
	//in case of bis stores, lsu issues the dealloc in P3, i.e when the req is issued to PCX.
	//IF it is bis to cp sapce and there is an err then the store is issued to PCX with nd set
	// and deallocated.
	//However for ue onbis to IO space, dealloc is sent to IFU, issued on PCX with valid bit 0.
	//The sbdiou signal is sent in next cycle. We need to take bis io stores in this equation.
	else if (tmp[`ST_SQUASH] || lsu_inst[`BLKST] || (tmp[`RMO] & ~lsu_inst[`BLKST] & ~`SPC0.lsu.sbc.kill_store_p4_)) 
	begin
		iss_ptr[thid] = iss_ptr[thid] + 1'b1;
		ret_ptr[thid] = ret_ptr[thid] + 1'b1;
	end
	else 
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_dealloc = %0h asserted which is not issued to asi ring, or PCX or is not squashed.", core_id, thid, `SPC6.lsu_stb_dealloc);

	`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h>: %s(VA=%0h) PA = %0h. STB[%0d] Deallocated.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], tmp[`MEMOP_PA], rdptr[thid]);
	stb_valid[{thid, rdptr[thid]}] = 1'b0;
	rdptr[thid] = rdptr[thid] + 1'b1;
	//`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> rd_ptr = %0d.", core_id, thid, rdptr[thid]);
	/*
	if (tmp[`RMO])
		st_rmo_cnt[thid] = st_rmo_cnt[thid]  + 1'b1;
	*/
end
endtask

task Squash_STB;
input [2:0] thid;
reg [204:0] tmp;
reg [3:0] squash_cnt;
reg [2:0] i;
begin
	squash_cnt = 4'b0;
        if (ret_ptr[thid] != iss_ptr[thid])
	       `PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> lsu_block_store_kill asserted while the ret_ptr = %0h  != iss_ptr = %0h.", core_id, thid, tmp[`MEMOP_PA], ret_ptr[thid], iss_ptr[thid]);
        if (rdptr[thid] != iss_ptr[thid])
	       `PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> lsu_block_store_kill asserted while the rdptr = %0h  != iss_ptr = %0h.", core_id, thid, tmp[`MEMOP_PA], rdptr[thid], iss_ptr[thid]);

	if (iss_ptr[thid] == wrptr[thid])
	begin
	    if (stb_valid[{thid, wrptr[thid]}])
		squash_cnt = 8;
/* Lsu can assert both dealloc and block_store_kill for a request.
 *
	    else
	    begin
              	`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Lsu asserted block_store_kill while there are no valid entries in STB to be deallocated.", core_id, thid);
	    end
*/
	end
	else
	begin
	  if (iss_ptr[thid] < wrptr[thid])
		squash_cnt = wrptr[thid] - iss_ptr[thid];
	  else if (iss_ptr[thid] > wrptr[thid])
		squash_cnt = wrptr[thid] + (8 - iss_ptr[thid]);
	end

	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> SQUASH_STB:iss_ptr = %0h, wrptr = %0h, squash_cnt = %0h.", core_id, thid, iss_ptr[thid], wrptr[thid], squash_cnt);

	i = iss_ptr[thid];
       
       `PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Block store kill changed issue_ptr:%0h->%0h. ret_ptr: %0h->%0h. rdptr:%0h->%0h.", core_id, thid, iss_ptr[thid], iss_ptr[thid]+squash_cnt, ret_ptr[thid], ret_ptr[thid]+squash_cnt, rdptr[thid], rdptr[thid]+squash_cnt);

   	ret_ptr[thid] = ret_ptr[thid] + squash_cnt;
	rdptr[thid] = rdptr[thid] + squash_cnt;
        iss_ptr[thid] = iss_ptr[thid] + squash_cnt;
		
	while (squash_cnt)
	begin
	    tmp = stb[{thid, i}];
	    if (~stb_valid[{thid, i}])
	    begin
		//DispSTB(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h><PA = %0h> lsu_block_store_kill asserted while the stb entry %0h is invalid.", core_id, thid, tmp[`MEMOP_PA], i);
	    end
	    if (tmp[`L2_ST_ISS]) 
	    begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h>st_issue bit is set when the block_store_kill is asserted for stb entry %0h.", core_id, thid, tmp[`MEMOP_PA], i);
	    end
	    //commenting out the chk below. Lsu can assert sbdiou and then in the next cycle insert a new entry into
	    //stb. LSU will squash this new entry and won't issue it to PCX/asi but its squash bit won't be 
	    //set in the chkr which was causin it to fire. 
	    //if (~tmp[`ST_SQUASH]) 
	    //begin
	       //`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> lsu_block_store_kill asserted while the squash bit is 0 in the STB entry %0h.", core_id, thid, tmp[`MEMOP_PA], i);
	    //end
	    stb_valid[{thid, i}] = 1'b0; 

	    i = i + 1;
	    squash_cnt = squash_cnt - 1'b1;
	end

end
endtask

task Chk_store;
reg [2:0] thid;
reg [47:0] addr;
reg [3:0] i;
reg [204:0] tmp;
begin
	if ((bst_cnt > 0) && (`SPC6.lsu_stb_alloc == 8'b0))
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Blk store entries are not allocated back to back in STB.", core_id, bst_active_thid);

//For bst the stb is still written even though we have errors.
//Stb is written in W stage. Howvere for first blk store helper
//the err will be flagged by FGU in b stage. We can miss the
// err signal if we don't sample in B.
//for the last helper err will be signalled in B stage of last helper and at

	if (lsu_bst_active[bst_active_thid] & `SPC0.fgu_fst_ecc_error_fx2 & (bst_cnt < 7))
             bst_fgu_err = 1'b1;

	if (`SPC6.lsu_stb_alloc[7:0] != 8'b0)
	begin
		thid = decode_tid(`SPC6.lsu_stb_alloc[7:0]);
		if (store_alloc)
		begin
			if (thid != dec_lsu_tid_w)
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_alloc = %0h mismatches the thid %0h.", core_id, dec_lsu_tid_w, `SPC6.lsu_stb_alloc[7:0], dec_lsu_tid_w);
			Insert_in_STB(stb_alloc_data, dec_lsu_tid_w);
		end
		else 
		begin
		    if (lsu_bst_active[thid])
		    begin
			   if (bst_cnt == 0)
			   begin
				bst_data = bst_inst_data;
			   end
		           else
			   begin
				if (thid != bst_active_thid)
				begin
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_alloc = %0h mismatches the active blkstore thid = %0h.", core_id, bst_active_thid, `SPC6.lsu_stb_alloc[7:0], bst_active_thid);
				end

				addr = bst_data[`MEMOP_VA];

				bst_data[`MEMOP_VA] = {addr[47:6], bst_cnt[2:0], 3'b0};
				addr = bst_data[`MEMOP_PA];
				bst_data[`MEMOP_PA] = {addr[39:6], bst_cnt[2:0], 3'b0};
			   end
                                bst_cnt = bst_cnt + 1;
                                Insert_in_STB(bst_data, bst_active_thid);
                                if (bst_cnt == 8)
                                begin
                                        bst_cnt = 0;
                                        lsu_bst_active[thid] = 1'b0;
                                        if (bst_fgu_err) //set the squash bit to 0 for all the stb entries
                                        begin
                                          for (i = 0; i < 8; i=i+1)
                                          begin
                                             tmp = stb[{thid, i[2:0]}];
					     if (tmp[`ST_SQUASH])
						`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Squash bit already set when trying to set it for a bst fgu errerr.", core_id, thid, tmp[`MEMOP_PA]);
					     tmp[`ST_SQUASH] = 1'b1;
                                             stb[{thid, i[2:0]}] = tmp; 
                                             `PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <PA = %0h> STB_entry[%0h] squashed due to FGU err.", core_id, thid, tmp[`MEMOP_PA], i);
                                          end
                                        end
					bst_fgu_err = 1'b0;
                                end
			end
			else
				`PR_ERROR("lsu_mon", `ERROR, "<C%h>: LSU asserted lsu_stb_alloc  = %0h while no store pending to be written in STB.", core_id, `SPC6.lsu_stb_alloc[7:0]);
				
		end
	end
	else
	begin
		if (store_alloc)
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h> W_stage: LSU did not assert lsu_stb_alloc for the store.", core_id, dec_lsu_tid_w, inst_pc_w);
	end
end
endtask

task Chk_st_on_ASI_ring;
input ring;
reg [2:0] thid;
reg [7:0] asi;
reg [47:0] addr, act_addr;
reg [1:0] req_type;
reg [204:0] tmp;

begin
	if (ring == `LOCAL)
		thid =`SPC6.lsu_rngl_cdbus[58:56];
	else
		thid =`SPC6.lsu_rngf_cdbus[58:56];
	
	if (ring == `LOCAL)
		asi =`SPC6.lsu_rngl_cdbus[55:48];
	else
		asi =`SPC6.lsu_rngf_cdbus[55:48];
	
	if (ring == `LOCAL)
		addr =`SPC6.lsu_rngl_cdbus[47:0];
	else
		addr =`SPC6.lsu_rngf_cdbus[47:0];
	
	if (ring == `LOCAL)
		req_type =`SPC6.lsu_rngl_cdbus[61:60];
	else
		req_type =`SPC6.lsu_rngf_cdbus[61:60];
	

	tmp = stb[{thid, iss_ptr[thid]}];
	if (tmp[`ASI_ST_ISS])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store reissued on the ASI interface.", core_id, thid, addr);
	end
	
	if (tmp[`ST_SQUASH])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store issued on the ASI interface that has been squashed.", core_id, thid, addr);
	end

	act_addr  = tmp[`MEMOP_PA];
	act_addr = {act_addr[39:3], 3'b0};

	//47 is D tag rd asi. LSU issues that on the ring but changes 
	//the address.
	if ((addr == act_addr) || (asi == 8'h47) || (asi == 8'h46))  
	begin
		tmp[`ASI_ST_ISS] = 1'b1;
		stb[{thid, iss_ptr[thid]}] = tmp;
		if (ring == `LOCAL)
		begin
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued on local ring.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
		end
		else
		begin
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued on fast ring.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
		end
		iss_ptr[thid] = iss_ptr[thid] + 1'b1;
	end
	else
	begin
	   if (ring == `LOCAL)
	   begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] PA mismatch for asi req on local ring. Expected PA = %0h, actual PA = %0h", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid], tmp[`MEMOP_PA], addr);
	   end
	   else
	   begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] PA mismatch for asi req on fast ring. Expected PA = %0h, actual PA = %0h", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid], tmp[`MEMOP_PA], addr);
	  end
	end

end
endtask


task chk_store_issue_to_pcx;
input [129:0] pcx_pkt;
reg [2:0] thid;
reg [204:0] tmp;
reg [20:0] inst;
reg [39:0] pcx_pa, inst_pa;
begin
	thid = pcx_pkt[`PCX_THR_ID];
	tmp = stb[{thid, iss_ptr[thid]}];
	inst = tmp[`LSU_MON_INST];
	pcx_pa = pcx_pkt[`PCX_ADDR];
	inst_pa = tmp[`MEMOP_PA];
	
	if (pcx_pkt[`PCX_RQTYP] == `PCX_STORE)
	begin
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
	end
	if (pcx_pkt[`PCX_INV])
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued to gasket with ND set.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
		

	if (~inst[`ST])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A store request made to gasket by LSU while the pending req is not store.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end

/* CONFIRM WITH MARK
	if (pcx_pa[39:0] != inst_pa[39:0])
	begin
			Disp_STB_entry(thid, iss_ptr[thid]);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A store request made to gasket by LSU while the pending req has PA %0h.", core_id, thid, pcx_pkt[`PCX_ADDR], tmp[`MEMOP_PA]);
	end
*/
//enhancement req 100146
	if ((tmp[`INST_ASI] == 8'h73) & (pcx_pa[39:0] != {8'h90, core_id, thid, tmp[`INST_ASI], 18'h0})) 
	begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> pcx_pa is not correct for asi write to interrupt vector dispatch register.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end

	if (inst[`BLKST] && ~pcx_pkt[`PCX_BST])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Bst bit is not set in the PCX pkt by LSU for a blk st request.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end

	if (tmp[`L2_ST_ISS])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store reissued on the PCX interface.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end
	else
	        tmp[`L2_ST_ISS] =  1'b1;
	
	if (tmp[`ST_SQUASH])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store issued on the PCX interface that has been squashed.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end
	
	if (tmp[`RMO])
	begin
	   if (~pcx_pkt[`PCX_BIS])
	   begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> BIS bit is not set in the PCX pkt by LSU for an RMO store.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	   end
	   if (tmp[`L2_ACK])
	   begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> L2ack bit is set when the RMO store is issued to PCX.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	   end
	   else
	   begin
		tmp[`L2_ACK] = 1'b1;
		ret_ptr[thid] = ret_ptr[thid] + 1;  //this will be deallocated before 
						    //response seen from stub
		st_rmo_cnt[thid] = st_rmo_cnt[thid]  + 1'b1;
	   end
	end
	stb[{thid, iss_ptr[thid]}] = tmp;

	iss_ptr[thid] = iss_ptr[thid] + 1;
	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> iss_ptr = %0d. ret_ptr = %0d, st_rmo_cnt = %0d", core_id, thid, iss_ptr[thid], ret_ptr[thid], st_rmo_cnt[thid]);
end
endtask

`ifdef INJ_STB_ERR_IN_CMP


reg [2:0] err_tid, stb_err_tid_d1, stb_err_tid_d2;
reg [2:0] err_index, stb_err_index_d1, stb_err_index_d2;
reg [204:0] err_tmp ;
reg [20:0] err_inst;
reg [44:0] cam_data;
reg [5:0] err_bit;
integer err_inj_cnt;
reg cmp_stb_err_inj;
reg stb_err_inj, stb_err_inj_d1, stb_err_inj_d2;
reg [1:0] err_priv, stb_err_priv_d1, stb_err_priv_d2;

initial
begin
	cmp_stb_err_inj = 1'b0;

	cam_data = 45'b0;
	err_bit = 11;
	err_inj_cnt = 0;
	stb_err_inj = 0;
	if (("cmp_stb_err_inj_on"))
		cmp_stb_err_inj = 1'b1;
	else
		cmp_stb_err_inj = 1'b0;
end

always @ (negedge (`SPC6.l2clk & enabled & cmp_stb_err_inj))
begin //{
     //valid stb ram rd for issue to pcx
     stb_err_inj = 1'b0;
     if (`SPC6.lsu.sbc.ram_rptr_vld_2 & `SPC6.lsu.sbc.st_pcx_rq_p3 & `SPC6.lsu.pic.pic_st_sel_p3)
     begin //{
	err_tid = decode_tid(`SPC6.lsu.sbc.st_rq_sel_p3[7:0]);
	err_index = `SPC6.lsu.sbc.ram_rptr_d1;
	err_tmp = stb[{err_tid, err_index}];
	err_inst = err_tmp[`LSU_MON_INST];
	cam_data = `SPC6.lsu.stb_cam.cam_array.stb_rdata[44:0];
	err_priv = err_tmp[`ST_PRIV];
	//if (err_inst[`SWAP] || err_inst[`CASA] || err_inst[`LDSTUB])
	if (err_inst[`CASA])
	begin //{
	   err_inj_cnt = err_inj_cnt + 1;
	   if (err_inj_cnt == 10)
	   begin //{
	     case (err_bit)
	       11, 12: err_bit = err_bit + 1;
	       13: err_bit = 44;
	       44: err_bit = 11;
	      endcase
	      err_inj_cnt = 0;
	      stb_err_inj = 1'b1;

	      force `SPC0.lsu.stb_cam.cam_array.stb_rdata[44:0] = cam_data ^ (1 << err_bit);
	      `PR_INFO("stb_err", 22, "<T%0h> <%0h> STB[%0h]: SBAPP forced for CASA. err_bit = %0h", err_tid, {cam_data[44:8], 3'b0}, err_index, err_bit);
	      #1;
	      release `SPC0.lsu.stb_cam.cam_array.stb_rdata[44:0];
	   end  //}
	end //}
     end  //}
     if (stb_err_inj_d2)
     begin
	if (~`SPC6.lsu_sbapp_err_g)
	begin
	            `PR_ERROR("lsu_mon", `ERROR, "<T%0h> sbapp err not asserted when err is injected for atomic.", stb_err_tid_d2);
	end
	else
	begin
		if ((`SPC6.lsu_stberr_tid_g != stb_err_tid_d2) || 
		    (`SPC6.lsu_stberr_index_g != stb_err_index_d2) || 
		    (`SPC6.lsu_stberr_priv_g != stb_err_priv_d2))
		begin
	            `PR_ERROR("lsu_mon", `ERROR, "<T%0h> sbapp err parameters mismatch.", stb_err_tid_d2);
		end
	end
    end
    else
    begin
	if (`SPC6.lsu_sbapp_err_g)
	begin
	            `PR_ERROR("lsu_mon", `ERROR, "<T%0h> sbapp err asserted when none expected.", `SPC6.lsu_stberr_tid_g);
	end
    end

end  //}

	
always @ (posedge (`SPC6.l2clk & enabled & cmp_stb_err_inj))
begin
	stb_err_inj_d1 <= stb_err_inj;
	stb_err_inj_d2 <= stb_err_inj_d1;
	stb_err_tid_d1 <= err_tid;
	stb_err_tid_d2 <= stb_err_tid_d1;
	stb_err_index_d1 <= err_index;
	stb_err_index_d2 <= stb_err_index_d1;
	stb_err_priv_d1 <= err_priv;
	stb_err_priv_d2 <= stb_err_priv_d1;
end

`endif
`endif
`endif
endmodule

`endif
`ifdef CORE_7

module lsu_mon_c7;
`ifndef GATESIM

// If vcs_build_args NO_MONITORS, then module will be empty
`ifndef NO_MONITORS

reg imm_asi_vld_e;
reg [7:0] asi_e, imm_asi_e, asi_m, asi_b;
reg dec_altspace_e, dec_altspace_b, dec_altspace_m;
reg [1:0] exu_ecc_b;
reg [1:0] exu_lsu_va_error_b;
reg [2:0] dec_lsu_tid_e, dec_lsu_tid_m, dec_lsu_tid_b, dec_lsu_tid_w;
reg [47:0] inst_pc_e, inst_pc_m, inst_pc_b, inst_pc_w;
reg [31:0] inst_e, inst_m, inst_b;
reg [47:0] vaddr_m, vaddr_b;
reg [63:0] int_st_data_m, int_st_data_b;
reg [63:0] fp_st_sata_fx2;
reg [20:0] lsu_inst_e, lsu_inst_m, lsu_inst_b;
reg mmu_dtlb_reload_d1, mmu_dtlb_reload_d2;

reg [7:0] ld_valid;
reg [7:0] tlb_valid;
reg [`LD_Pend_Width] ld_pend_array[7:0];
reg [`LAST_INST_Pend_Width] last_inst_array[7:0];
reg [2:0] wrptr[7:0];  //Pts. to the STB entry into which data will be written next
reg [2:0] rdptr[7:0];  //Tracks the dealloc signal from STB
reg [2:0] iss_ptr[7:0];	//keeps track of when a store is issued from the STB to PCX
reg [2:0] ret_ptr[7:0]; //keeps track of when the response is received from 
			//the L2c.
reg [63:0] stb_valid;
reg [`STB_Pend_Width] stb[63:0];
//reg [`TLB_MISS_Pend_Width] tlbmiss_pend_array[7:0];

reg [7:0] pf_cnt[7:0];
reg [7:0] dcache_inv_cnt[7:0];
reg [7:0] st_rmo_cnt[7:0];

reg [55:0] print_inst;

reg [31:0] dec_tg0_inst_d, dec_tg1_inst_d;

reg [7:0] lsu_bst_active;
reg store_alloc;
reg [3:0] bst_cnt;
reg [195:0] stb_alloc_data;
reg [195:0] bst_data, bst_inst_data;
reg [2:0] bst_active_thid;
reg bst_fgu_err;
				
reg [7:0] is_blkld;  //reqd by lsu_ras_chkr to chk errors on blk ld.
reg [1:0] l2_blk_ld_errtype[7:0]; //Gives the type of err the ahd be reported by LSU if 
				 //different types of err occur on blk ld helper returns
reg [1:0] st_priv[7:0]; //Gives the final priv level for an sbdiou/sbapp err that shd be 
			//stored in DFESR

wire [2:0] core_id = 7;

integer i;
integer err_cnt;

reg enabled;
reg reset_in_middle;
reg [7:0] finish_mask;

initial
begin
    enabled = 0;
    reset_in_middle = 0;
	ld_valid = 8'b0;
	lsu_inst_e = 0;
	tlb_valid = 8'b0;
	for (i = 0; i < 8; i = i+1)
	begin
		pf_cnt[i] = 0;
		dcache_inv_cnt[i] = 0;
		wrptr[i] = 0;
		rdptr[i] = 0;
		iss_ptr[i] = 0;
		ret_ptr[i] = 0;
		st_rmo_cnt[i] = 0;
		is_blkld[i] = 1'b0;
		st_priv[i] = 2'b0;
		l2_blk_ld_errtype[i] = 2'b0;
	end
	lsu_bst_active = 8'b0;
	store_alloc = 1'b0;
	bst_cnt = 4'b0;
	stb_valid = 64'b0;

    // avoid time zero ugliness. jp
    //@(posedge `SPC0.l2clk);
    //@(negedge `SPC0.l2clk);
    //if (`PARGS.lsu_mon_on) enabled = 1;

    case (core_id)
	3'h0: finish_mask = `PARGS.finish_mask[7:0];
	3'h1: finish_mask = `PARGS.finish_mask[15:8];
	3'h2: finish_mask = `PARGS.finish_mask[23:16];
	3'h3: finish_mask = `PARGS.finish_mask[31:24];
	3'h4: finish_mask = `PARGS.finish_mask[39:32];
	3'h5: finish_mask = `PARGS.finish_mask[47:40];
	3'h6: finish_mask = `PARGS.finish_mask[55:48];
	3'h7: finish_mask = `PARGS.finish_mask[63:56];
    endcase
end

always @ (`TOP.in_reset)
begin
	if (~`TOP.in_reset & `PARGS.lsu_mon_on & ~reset_in_middle)
	begin
		enabled = 1'b1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "Lsu_mon on, in_reset = 0.");
	end
		

	if (`TOP.in_reset & enabled)
	begin
		reset_in_middle = 1'b1;
		enabled = 1'b0;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "Reset asserted in the middle of the diag. Turned off Lsu_mon.");
	end
end

always @ (posedge (tb_top.sim_status[0] & enabled))
begin //{
	if (|(ld_valid[7:0] & finish_mask[7:0]))
	begin  //{
	   for (i = 0; i < 8; i=i+1)
	   begin
		if (ld_valid[i])  
		begin
		   DispPendReq(i);
	        end
	   end
	  `PR_ERROR("lsu_mon", `ERROR, "<C%h> Ld requests pending at the end of simulation. ld_valid = %0h", core_id, ld_valid);
	end  //}
	if (|stb_valid[63:0])
	begin  //{
	   err_cnt = 0;
	   for (i = 0; i < 64; i=i+1)
	   begin
		if (stb_valid[i] & finish_mask[i[5:3]])  
		begin
		//chkr resets the stb valid bits when block_store_kill is asserted.
		//in couple of failures block_store_kill was sampled asserted two cycles after
		//lsu asserted stb_empty. The simulation ended the cycle stb_empty was sampled high 
		//causing moniotr firings with valid entries in stb at end of simulation. Now
		//don't flag an error if squash bit is set and stb_valid is asserted at end
		//of simualation.
		      if (~is_squash_bit_set(i[5:0]))
		      begin
			err_cnt = err_cnt + 1;
			Disp_STB_entry(i[5:3],i[2:0]);
		      end
		end
	   end
	   if (err_cnt)
	   begin
	  	`PR_ERROR("lsu_mon", `ERROR, "<C%h> Store requests pending at the end of simulation. stb_valid = %0h", core_id, stb_valid);
	   end
       end  //}
       err_cnt = 0;
       for (i = 0; i < 8; i=i+1)
       begin  //{
	   if (finish_mask[i] & (pf_cnt[i] != 0))
	   begin
		err_cnt = 1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> Prefetches not finished. Pf_cnt = %0d", core_id, i, pf_cnt[i]);
	   end
	   if (finish_mask[i] & (dcache_inv_cnt[i] != 0))
	   begin
		err_cnt = 1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> D pkt not received for all invalidate reqs. issued by the thread. dcache_inv_cnt = %0d", core_id, i, dcache_inv_cnt[i]);
	   end
	   if (finish_mask[i] & (st_rmo_cnt[i] != 0))  
	   begin
		err_cnt = 1;
	  	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> rmo_cnt not zero. rmo_cnt = %0d", core_id, i, st_rmo_cnt[i]);
	   end
       end  //}
       if (err_cnt)
       begin
	  `PR_ERROR("lsu_mon", `ERROR, "<C%h> Prefetch/D/RMO_stores requests pending at the end of simulation.", core_id);
       end
end //}

function is_squash_bit_set;
input [5:0] index;
reg [204:0] tmp;
begin
	tmp = stb[index];
	if (tmp[`ST_SQUASH])
		is_squash_bit_set = 1'b1;
	else
		is_squash_bit_set = 1'b0;
end
endfunction


always @ (negedge (`SPC7.l2clk & enabled))
begin //{

	asi_e  = `SPC7.lsu.dcc.dcc_asi_e[7:0];

	lsu_inst_e[`LD] <= `SPC7.dec_ld_inst_e;
	lsu_inst_e[`ST] <= `SPC7.dec_st_inst_e;
	lsu_inst_e[`FP] <= `SPC7.dec_fpldst_inst_e;
	lsu_inst_e[`PREF] <= `SPC7.dec_pref_inst_e;
	lsu_inst_e[`SWAP] <= `SPC7.dec_swap_inst_e;
	lsu_inst_e[`CASA] <= `SPC7.dec_casa_inst_e;
	lsu_inst_e[`LDSTUB] <= `SPC7.dec_ldstub_inst_e;
	lsu_inst_e[`FLUSH] <= `SPC7.dec_flush_inst_e;
	lsu_inst_e[`MEMBAR] <= `SPC7.dec_memstbar_inst_e;
	lsu_inst_e[`LDD] <= `SPC7.dec_ld_inst_e & `SPC7.dec_ldst_dbl_e & ~`SPC7.dec_fpldst_inst_e;
	lsu_inst_e[`STD] <= `SPC7.dec_st_inst_e & `SPC7.dec_ldst_dbl_e & ~`SPC7.lsu.dec_fpldst_inst_e;

       lsu_inst_e[`BLKLD] <= `SPC7.dec_ld_inst_e & `SPC7.dec_fpldst_inst_e & dec_altspace_e & Is_blk_asi(asi_e);
	lsu_inst_e[`BLKST] <= `SPC7.dec_st_inst_e & `SPC7.dec_fpldst_inst_e & dec_altspace_e & Is_blk_asi(asi_e);
	lsu_inst_e[`QLD] <= `SPC7.dec_ld_inst_e & dec_altspace_e & Is_qld_asi(asi_e);
	lsu_inst_e[`ASR_RD_WR] <= `SPC7.dec_sr_inst_e & (`SPC7.dec_ld_inst_e | `SPC7.dec_st_inst_e);
	lsu_inst_e[`PR_RD_WR] <= `SPC7.dec_pr_inst_e & (`SPC7.dec_ld_inst_e | `SPC7.dec_st_inst_e);
	lsu_inst_e[`HPR_RD_WR] <= `SPC7.dec_hpr_inst_e & (`SPC7.dec_ld_inst_e | `SPC7.dec_st_inst_e);
	lsu_inst_e[`FSR_RD_WR] <= `SPC7.dec_fsr_ldst_e & (`SPC7.dec_ld_inst_e | `SPC7.dec_st_inst_e);
end //}

always @ (posedge (`SPC7.l2clk & enabled))
begin //{
	dec_tg0_inst_d <= `SPC7.dec.ded0.decode_mux[31:0];
	dec_tg1_inst_d <= `SPC7.dec.ded1.decode_mux[31:0];
	imm_asi_vld_e <= `SPC7.lsu.dec_imm_asi_vld_d;

	imm_asi_e <= `SPC7.lsu.dec_imm_asi_d;
	dec_altspace_e <= `SPC7.dec_altspace_d;
	dec_altspace_m <= dec_altspace_e;
	dec_altspace_b <= dec_altspace_m;

	exu_ecc_b <= `SPC7.exu_ecc_m;
	exu_lsu_va_error_b <= `SPC7.exu_lsu_va_error_m;

	dec_lsu_tid_e <= `SPC7.dec_lsu_tg_d ? {1'b1, `SPC7.dec_lsu_tid1_d} : {1'b0, `SPC7.dec_lsu_tid0_d}; 	
	dec_lsu_tid_m <= dec_lsu_tid_e;
	dec_lsu_tid_b <= dec_lsu_tid_m;
	dec_lsu_tid_w <= dec_lsu_tid_b;
	
	inst_pc_e <= `SPC7.dec_lsu_tg_d ? {`SPC7.tlu.tlu_pc_1_d[47:2], 2'b0} : {`SPC7.tlu.tlu_pc_0_d[47:2], 2'b0};
	inst_pc_m <= inst_pc_e;
	inst_pc_b <= inst_pc_m;
	inst_pc_w <= inst_pc_b;
	
	inst_e <= `SPC7.dec_lsu_tg_d ? dec_tg1_inst_d : dec_tg0_inst_d;
	inst_m <= inst_e;
	inst_b <= inst_m;

	vaddr_m <= `SPC7.exu_lsu_address_e;
	vaddr_b <= vaddr_m;

	int_st_data_m <= `SPC7.exu_lsu_store_data_e;
	int_st_data_b <= int_st_data_m;
	fp_st_sata_fx2 <= `SPC7.fgu_lsu_fst_data_fx1;

	mmu_dtlb_reload_d1 <= `SPC7.mmu_dtlb_reload;
	mmu_dtlb_reload_d2 <= mmu_dtlb_reload_d1;

	//pcx_thid_d1 <=  `SPC7.lsu.spc_pcx_data_pa[`PCX_THR_ID];
	lsu_inst_m <= lsu_inst_e;
	lsu_inst_b <= lsu_inst_m;

	asi_m <= asi_e;
	asi_b <= asi_m;
end //}

function Is_blk_asi;
input [7:0] asi;
begin
	Is_blk_asi = (asi == `ASI_BLK_AIUP) | (asi == `ASI_BLK_AIUS) | 
		   (asi == `ASI_BLK_AIUPL) | (asi == `ASI_BLK_AIUSL) |
		   (asi == `ASI_BLK_P) | (asi == `ASI_BLK_S) |
		   (asi == `ASI_BLK_PL) | (asi == `ASI_BLK_SL) |
		   (asi == `ASI_BLK_COMMIT_P) | (asi == `ASI_BLK_COMMIT_S);
end
endfunction

function Is_qld_asi;
input [7:0] asi;
begin
 		Is_qld_asi = (asi == `ASI_AIU_BIS_QUAD_LDD_P) | (asi == `ASI_AIU_BIS_QUAD_LDD_S) |
		(asi == `ASI_AIU_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_AIU_BIS_QUAD_LDD_S_LITTLE) |
		(asi == `ASI_NUCLEUS_BIS_QUAD_LDD) | (asi == `ASI_NUCLEUS_BIS_QUAD_LDD_LITTLE) |
		(asi == `ASI_BIS_QUAD_LDD_P) | (asi == `ASI_BIS_QUAD_LDD_S) |
		(asi == `ASI_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_BIS_QUAD_LDD_S_LITTLE) |
		(asi == `ASI_QUAD_LDD) | (asi == `ASI_QUAD_LDD_REAL) |
		(asi == `ASI_QUAD_LDD_L) | (asi == `ASI_QUAD_LDD_REAL_L);
end
endfunction

function Is_bis_asi;
input [7:0] asi;
begin
 		Is_bis_asi = (asi == `ASI_AIU_BIS_QUAD_LDD_P) | (asi == `ASI_AIU_BIS_QUAD_LDD_S) |
		(asi == `ASI_AIU_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_AIU_BIS_QUAD_LDD_S_LITTLE) |
		(asi == `ASI_NUCLEUS_BIS_QUAD_LDD) | (asi == `ASI_NUCLEUS_BIS_QUAD_LDD_LITTLE) |
		(asi == `ASI_BIS_QUAD_LDD_P) | (asi == `ASI_BIS_QUAD_LDD_S) |
		(asi == `ASI_BIS_QUAD_LDD_P_LITTLE) | (asi == `ASI_BIS_QUAD_LDD_S_LITTLE);
end
endfunction

always @ (negedge (`SPC7.l2clk & enabled))
begin //{
	Chk_store;
	store_alloc = 1'b0;
	if (lsu_inst_m != 0)
	begin
		if (`SPC7.dec_flush_lm)
		begin
			lsu_inst_m <= 0;
			`PR_INFO("lsu_mon", 21, "<C%0h> <T%0h> <%0h> M_stage: %s(VA=%0h) Flushed due to IFU Flush.", core_id, dec_lsu_tid_m, inst_pc_m, tb_top.intf0.xlate(inst_m),vaddr_m);
		end
	end
		
	if (lsu_inst_b != 0)
	begin //{
		if (lsu_inst_b[`BLKLD])  print_inst = " BLKLD,";
		else if (lsu_inst_b[`BLKST])  print_inst = " BLKST,";
		else if (lsu_inst_b[`QLD])  print_inst = " QLD,";
		else  print_inst = "";

		if (`SPC7.dec_flush_lb)
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%0h> <T%0h> <%0h> B_stage: %s(VA=%0h) Flushed due to IFU Flush.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		else if (`SPC7.tlu_flush_lsu_b)
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h) Flushed due to TLU Flush.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		//casa is a two cycle operation. If there is an err on the 2nd cycle of casa then also
		//casa shd be killed.
		//This function will also chk for errors on 2nd cycle.
		else if (Is_exu_error(exu_lsu_va_error_b, exu_ecc_b))  
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h <%0h> B_stage: %s(VA=%0h) Flushed due to EXU error.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		else if ((`SPC7.fgu_cecc_fx2 || `SPC7.fgu_uecc_fx2) && lsu_inst_b[`ST] && lsu_inst_b[`FP]) 
		begin
			lsu_inst_b <= 0;
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h) Flushed due to FGU error.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
		end
		else if (IsExc(core_id)) 
			lsu_inst_b <= 0;
		else if (!`SPC7.lsu_tlb_miss_b_)
		begin
			`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h)%s ASI = %0h. DTLB miss.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, asi_b);
				//Insert_tlb_miss_info;
		end
		else 
		begin //{
		//Lsu doesn't assert lsu_sync for an exception or dtlb miss. Since for
		//an exception tlu anyway tells the front end to flush itself there is 
		//no reason for LSU to flush the front end then TLU to flush it again.
		//Lsu treats the dtlbmiss as an exception that it flushes the  inst and
		//handles it when it is reissued by the front end.

		   if (`SPC7.lsu_tlb_bypass_b)
		   begin
			if (`SPC7.lsu_sync != 8'b0)
			begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. LSU_sync. DTLB Bypass.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC7.lsu.tlb_pgnum[39:13], vaddr_b[12:0]},  asi_b);
			end
			else
			begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. DTLB Bypass.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC7.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b);
			end
		  end
	          else
		  begin
			if (`SPC7.lsu_sync != 8'b0)
			begin
			  if (lsu_inst_b[`ST])
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h, Store_data = %0h. LSU_sync. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC7.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b,int_st_data_b);
			  end
			  else
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. LSU_sync. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC7.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b);
			  end
			end
			else
			begin
			  if (lsu_inst_b[`ST])
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h, Store_data = %0h. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC7.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b, int_st_data_b);
			  end
			  else
			  begin
				`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h>: %s(VA=%0h)%s PA = %0h, ASI = %0h. DTLB hit.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, print_inst, {`SPC7.lsu.tlb_pgnum[39:13], vaddr_b[12:0]}, asi_b);
		          end
		        end
		  end

	          if (lsu_inst_b[`LD] || lsu_inst_b[`PREF] || lsu_inst_b[`SWAP] || lsu_inst_b[`CASA] || lsu_inst_b[`LDSTUB])
		  begin //{
			if (((lsu_inst_b == 16'h1) || (lsu_inst_b == 16'h5)) & `SPC7.lsu.stb_cam_hit)
			begin
				`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h>: LSU_sync asserted due to STB RAW.", core_id, dec_lsu_tid_b, inst_pc_b);
			end
		  end //}

		  if (lsu_inst_b[`LD])
			Insert_ld_miss_info;

		  if (lsu_inst_b[`ST])  //for atomics both ld and store signals are asserted
		  begin
			Make_STB_data;
			store_alloc = 1'b1;
		  end
		  Insert_in_last_inst_array;

		if (`SPC7.lsu_trap_flush[7:0])
		begin
			`PR_INFO("lsu_mon", 21, "<C%h> <T%0h> Trap Flush asserted.", core_id, decode_tid(`SPC7.lsu_trap_flush[7:0]));
		end
	    end //}
	end //}
end //}

//STB ue testing:
//This is how we test squashing of stores by LSU_mon:
//Whenever lsu asserts err_sbdiou signal, the monitor sets the squash
//bit in the STB for the rest of the stores. If any of these squashed stores
//is issued on the asi ring or to the PCX interface the monitor complains.
//The squashed stores are deallocated when either a block_store_kill is
//asserted or dealloc signals are asserted by the LSU.
//When the block_store_kill is asserted, it tells the IFU to dealloc
//all the pending stores in the IFU. It means the when block_store_kill
//is asserted we have deallocated all the non-squashed requests from STB.
//The 0in_chkr ensures that LSU flags the correct index and priv with the
//the sbdiou signal to TLU.


always @ (negedge (`SPC7.l2clk & enabled))
begin
	if (`SPC7.lsu_l15_valid & `SPC7.lsu.spc_pcx_data_pa[129])
		Chk_pcx_req_pkt(`SPC7.lsu.spc_pcx_data_pa[129:0]);  //chk if we need .lsu here
	if ((`SPC7.lsu_rngl_cdbus[64:63] == 2'b11) & ~`SPC7.lsu_rngl_cdbus[59])
		Chk_st_on_ASI_ring(`LOCAL);

	if ((`SPC7.lsu_rngf_cdbus[64:63] == 2'b11) & ~`SPC7.lsu_rngf_cdbus[59])
		Chk_st_on_ASI_ring(`FAST);

	//if (`SPC7.l15_lsu_valid)
		//Chk_cpx_response_pkt({`SPC7.l15_lsu_valid, `SPC7.l15_lsu_cpkt[17:13],`SPC7.l15_lsu_cpkt[11:0],`SPC7.l15_spc_data1[127:0]});
	
	if (`SPC7.cpx_spc_data_cx[145])
		Chk_cpx_response_pkt(`SPC7.cpx_spc_data_cx);
	
	if (`SPC7.lsu_complete[7:0] != 8'b0)
	begin
		if (`SPC7.lsu_complete[0]) Chk_ld_complete(0);
		if (`SPC7.lsu_complete[1]) Chk_ld_complete(1);
		if (`SPC7.lsu_complete[2]) Chk_ld_complete(2);
		if (`SPC7.lsu_complete[3]) Chk_ld_complete(3);
		if (`SPC7.lsu_complete[4]) Chk_ld_complete(4);
		if (`SPC7.lsu_complete[5]) Chk_ld_complete(5);
		if (`SPC7.lsu_complete[6]) Chk_ld_complete(6);
		if (`SPC7.lsu_complete[7]) Chk_ld_complete(7);
	end
	
	if (`SPC7.lsu_block_store_kill[7:0] != 8'b0)
	begin
		if (`SPC7.lsu_block_store_kill[0]) Squash_STB(0);
		if (`SPC7.lsu_block_store_kill[1]) Squash_STB(1);
		if (`SPC7.lsu_block_store_kill[2]) Squash_STB(2);
		if (`SPC7.lsu_block_store_kill[3]) Squash_STB(3);
		if (`SPC7.lsu_block_store_kill[4]) Squash_STB(4);
		if (`SPC7.lsu_block_store_kill[5]) Squash_STB(5);
		if (`SPC7.lsu_block_store_kill[6]) Squash_STB(6);
		if (`SPC7.lsu_block_store_kill[7]) Squash_STB(7);
	end
	
	if (`SPC7.lsu_stb_dealloc[7:0] != 8'b0)
	begin
		if (`SPC7.lsu_stb_dealloc[0]) Dealloc_STB(0);
		if (`SPC7.lsu_stb_dealloc[1]) Dealloc_STB(1);
		if (`SPC7.lsu_stb_dealloc[2]) Dealloc_STB(2);
		if (`SPC7.lsu_stb_dealloc[3]) Dealloc_STB(3);
		if (`SPC7.lsu_stb_dealloc[4]) Dealloc_STB(4);
		if (`SPC7.lsu_stb_dealloc[5]) Dealloc_STB(5);
		if (`SPC7.lsu_stb_dealloc[6]) Dealloc_STB(6);
		if (`SPC7.lsu_stb_dealloc[7]) Dealloc_STB(7);
	end

	if (`SPC7.lsu_block_store_stall)
	      Chk_block_store;

	if (`SPC7.lsu.lsu_block_store_alloc[7:0] != 8'b0)
		Set_block_store_parameters;

	if (`SPC7.lsu_sbdiou_err_g || `SPC7.lsu_sbapp_err_g)
		Squash_store;

	if (`SPC7.lsu_stb_flush_g)
		st_priv[`SPC7.lsu_stberr_tid_g] = get_priv_on_flush(`SPC7.lsu_stberr_tid_g);
end

function [1:0] get_priv_on_flush;
input [2:0] tid;
reg [2:0] sq_index;
reg [204:0] tmp;

begin
	sq_index = `SPC7.lsu_stberr_index_g;
	tmp = stb[{tid, sq_index}];
	get_priv_on_flush = tmp[`ST_PRIV];
end
endfunction

task Chk_block_store;
reg [20:0] inst;
reg [2:0] thid;
begin
		thid = `SPC7.lsu_block_store_tid;
		bst_inst_data = stb[{thid, rdptr[thid]}];
		inst = bst_inst_data[`LSU_MON_INST];

		if (~inst[`BLKST])
		begin
			Disp_STB_entry(thid, iss_ptr[thid]);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted blk_store_stall while the req at the top of STB is not blkst as shown above", core_id, thid);
		end
end
endtask

//lsu can assert block_store_stall for a new block store while it has not yet written
//the 8 stb entries from the previous blk store.

task Set_block_store_parameters;
reg [2:0] thid;
begin
	
		thid = decode_tid(`SPC7.lsu.lsu_block_store_alloc[7:0]);
		if (lsu_bst_active[thid])
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted blk_store_alloc while the bst_active is already set for this thread.", core_id, thid);
		end
		else
		begin
			lsu_bst_active[thid] = 1'b1;
			bst_active_thid = thid;
			if (`SPC7.lsu.fgu_fst_ecc_error_fx2)
			    bst_fgu_err = 1'b1;
			else
			    bst_fgu_err = 1'b0;
		end
end
endtask

task Squash_store;
reg [2:0] thid;
reg [2:0] sq_index;
reg [2:0] i;
reg [204:0] tmp;
reg [3:0] squash_cnt;
reg [1:0] priv;

begin
	thid = `SPC7.lsu_stberr_tid_g;
	sq_index = `SPC7.lsu_stberr_index_g;
	priv = `SPC7.lsu_stberr_priv_g;
	tmp = stb[{thid, sq_index}];
	squash_cnt = 0;
     	`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Sbdiou/sbapp seen for index = %h and priv = %h.", core_id, thid, sq_index,  priv);

	st_priv[thid] = tmp[`ST_PRIV];

	//lsu can assert deallocate before it asserts the sbdiou signal. 
	//In that case iss_ptr won't be equal to sbdiou index.
	//if (sq_index != iss_ptr[thid])
	//begin
	//	Disp_STB_entry(thid, iss_ptr[thid]);
	//	`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted sbdiou/sbapp with index %0h while the next req to be issued is at index %0h.", core_id, thid, sq_index, iss_ptr[thid]);
	//end
	
	//If there is only one store in the store buffer which gets an sbdiou error, then LSU can deallocate
	//the store and then assert sbdiou. The deallocation will cause the stb issue_ptr to move 
	//forward to an inst. that has already been issued and completed and this chk can fire. So
	//removing this chk. 

        //if (tmp[`L2_ST_ISS])
        //begin
         //       Disp_STB_entry(thid, iss_ptr[thid]);
          //      `PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store reissued on the PCX interface.", core_id, thid, tmp[`MEMOP_PA]);
        //end

	if (iss_ptr[thid] == wrptr[thid])
	begin
	    if (stb_valid[{thid, wrptr[thid]}])
		squash_cnt = 8;
	    else
	    begin
	    //changing it to an info message because if there is only one valid entry in store buffer that
	    //gets an sbdiou then LSU can deallocate the entry and then issue sbdiou.
              	//`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Lsu asserted sbdiou/sbapp while there are no valid entries in STB to be issued.", core_id, thid);
              	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> sbdiou/sbapp squashed only one entry in STB.", core_id, thid);
	    end
	end
	else
	begin
	  if (iss_ptr[thid] < wrptr[thid])
		squash_cnt = wrptr[thid] - iss_ptr[thid];
	  else if (iss_ptr[thid] > wrptr[thid])
		squash_cnt = wrptr[thid] + (8 - iss_ptr[thid]);
	end
	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> SQUASH_STORE:iss_ptr = %0h, wrptr = %0h, squash_cnt = %0h.", core_id, thid, iss_ptr[thid], wrptr[thid], squash_cnt);

	i = iss_ptr[thid];
		
	while (squash_cnt)
	begin
		tmp = stb[{thid, i}];
		tmp[`ST_SQUASH] = 1'b1;
		if (priv < tmp[`ST_PRIV])
		begin
              		`PR_INFO("lsu_mon", `INFO, "<C%h> <T%0h> <PA = %0h> Sbdiou/sbapp signalled. Err in user/priv level store is squashing a higher priv level store.", core_id, thid, tmp[`MEMOP_PA]);
			priv = tmp[`ST_PRIV];
		end
			
		stb[{thid, i}] = tmp;
               	`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <PA = %0h> STB_entry[%0h] squashed.", core_id, thid, tmp[`MEMOP_PA], i);
	   	 
		 i = i + 1;
		 squash_cnt = squash_cnt - 1'b1;
	end
end
endtask

function [2:0] decode_tid;
input [7:0] thid_encode;
begin
	case (thid_encode)
	   8'h1: decode_tid = 3'b0;
	   8'h2: decode_tid = 3'h1;
	   8'h4: decode_tid = 3'h2;
	   8'h8: decode_tid = 3'h3;
	   8'h10: decode_tid = 3'h4;
	   8'h20: decode_tid = 3'h5;
	   8'h40: decode_tid = 3'h6;
	   8'h80: decode_tid = 3'h7;
	   default: 
	   begin
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> decode_tid. Incorrect value of thid input = %0h.", core_id, thid_encode, thid_encode);
	   end
	endcase
end
endfunction

task Chk_ld_complete;
input [2:0] thid;
reg [`LD_Pend_Width] tmp;
begin
	tmp = ld_pend_array[thid];

	if (ld_valid[thid])
	begin
		if ((tmp[`L2_ISS] != 4'hf) || (tmp[`L2_RESP] != 4'hf))
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> LSU asserted lsu_complete while the l2_iss and l2_resp bits are not F.", core_id, thid);
		end
		ld_valid[thid] = 1'b0;
		`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h> %s(VA=%0h) Complete. Setting ld_valid to 0.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
	end

	tmp = last_inst_array[thid];
	`PR_INFO("lsu_mon", 24, "<C%h> <T%0h> <%0h> %s(VA=%0h) Complete.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
end
endtask
	
task Chk_pcx_req_pkt;
input [129:0] pcx_pkt;
reg [2:0] thid;
reg [`LD_Pend_Width] tmp, tmp1; 
reg [15:0] inst; 
reg [11*8:0] req;
reg [39:0] addr;
begin 
	thid = pcx_pkt[`PCX_THR_ID]; 
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	req = DispPCXReq(pcx_pkt);
	addr = pcx_pkt[`PCX_ADDR];


	if (pcx_pkt[`PCX_CPU_ID] != core_id)
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> cpu_id (spc_pcx_data_pa[122:120]) = %h is not = %0h when the lsu made a %s req to gasket.", core_id, pcx_pkt[`PCX_THR_ID], addr, pcx_pkt[122:120], core_id, req);
	
	
	if ((pcx_pkt[`PCX_RQTYP] == `PCX_LOAD) || (pcx_pkt[`PCX_RQTYP] == `PCX_CAS1) || (pcx_pkt[`PCX_RQTYP] == `PCX_CAS2) || (pcx_pkt[`PCX_RQTYP] == `PCX_SWAP_LDSTUB))
	begin
	  if (~ld_valid[thid])
	  begin
		ld_valid[thid] = 1'b1;  //we have sent a req to gasket and are waiting for response
		`PR_INFO("lsu_mon", 22, "<C%0h> <T%0h> Setting ld_valid[%0h].", core_id, thid, thid);
	  end
		if (~inst[`BLKLD])
		begin
			if (tmp[`MEMOP_PA] != addr)
			begin
				if ((tmp[`INST_ASI] == 8'h41) || (tmp[`INST_ASI] == 8'h73) || ((tmp[`INST_ASI] == 8'h45) && ((tmp[`MEMOP_PA] == 8'h10) || (tmp[`MEMOP_PA] == 8'h18))))
				begin
					`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <PA = %0h> PA mismatch on gasket for %s request. Ignoring the mismatch as inst. is issued with asi 41, 73 or 45 (with VA 0x10 or 18).", core_id, thid, addr, req);
				end
				else
				begin
					DispPendReq(thid);
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A %s request made to gasket by LSU while the pending req is with PA %0h.", core_id, thid, addr, req, tmp[`MEMOP_PA]);
				end
			end
		end
	end

	case (pcx_pkt[`PCX_RQTYP])
	   `PCX_LOAD: 
	   begin
		if (pcx_pkt[`PCX_PF])
		begin
			if (~inst[`PREF])
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A prefetch request made to gasket by LSU which mismatches the pending request from the thread.", core_id, thid, addr);
			end
			if (pcx_pkt[`PCX_INV])
			begin
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: PREF_ICE(VA=%0h) Issued. pf_cnt not updated.", core_id, thid, tmp[`INST_VA], tmp[`MEMOP_VA]);
			end
			else
			begin
			 	pf_cnt[thid] = pf_cnt[thid] + 1'b1;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Issued. pf_cnt = %0d.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], pf_cnt[thid]);
			end
			tmp[`L2_ISS] = 4'hF;
			tmp[`L2_RESP] = 4'hF; //we don't wait for a prefetch response from gasket
			ld_pend_array[thid] = tmp;
		end
		else 
		begin
			if (pcx_pkt[`PCX_INV])
			begin
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Dcache invalidate pkt issued to CCX.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
				dcache_inv_cnt[thid] = dcache_inv_cnt[thid] + 1'b1;
			end
			else
			begin
				Chk_req_load(pcx_pkt);
			end
		end
	    end
           `PCX_CAS1, `PCX_CAS2:
	   begin
		if (~inst[`CASA])
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> CASA request made to gasket by LSU while no such request request is pending from this thread.", core_id, thid, addr);
		end
		if (pcx_pkt[`PCX_RQTYP] == `PCX_CAS1)
		begin
			tmp[`L2_ISS] = 4'hE;
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) (CAS1) Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			ld_pend_array[thid] = tmp;
		end
		if (pcx_pkt[`PCX_RQTYP] == `PCX_CAS2)
		begin
			tmp[`L2_ISS] = 4'hF;
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) (CAS2) Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			ld_pend_array[thid] = tmp;
			chk_store_issue_to_pcx(pcx_pkt);
		end
		
	   end
	   `PCX_SWAP_LDSTUB:
	   begin
		if (~inst[`SWAP] && ~inst[`LDSTUB])
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> %s request made to gasket by LSU while no such request request is pending from this thread.", core_id, thid, addr, req);
		end
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Issued to gasket. store_data = %0h", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], pcx_pkt[`PCX_DATA]);
		tmp[`L2_ISS] = 4'hF;
		ld_pend_array[thid] = tmp;
		
		chk_store_issue_to_pcx(pcx_pkt);
	   end

	    `PCX_STORE:
	    begin
		chk_store_issue_to_pcx(pcx_pkt);
	    end
	   
	   default: `PR_INFO("lsu_mon", 21, "<C%h> <T%0h> <%0h>: %s Issued to gasket.", core_id, thid, addr, req);
	endcase
end
endtask

task Chk_cpx_response_pkt;
input [145:0] cpx_pkt;
reg [2:0] thid;
begin
	thid = cpx_pkt[`CPX_THR_ID];	

	casex ({cpx_pkt[`CPX_RTNTYP], cpx_pkt[`CPX_ERR], cpx_pkt[`CPX_NC], cpx_pkt[`CPX_ATM], cpx_pkt[`CPX_PF]})
	  {4'b0, 2'bxx, 1'bx, 1'b0, 1'b0}:  
	  begin
		chk_ccx_ld_response(cpx_pkt);
	  end

	  {4'b0, 2'bxx, 1'b1, 1'b0, 1'b1}:  
	  begin
		if (pf_cnt[thid] == 8'b0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Prefetch response received from gasket while the pf_cnt is 0 for this thread.", core_id, thid);
		end
		else
		begin
			pf_cnt[thid] = pf_cnt[thid] - 1'b1;
			`PR_INFO("lsu_mon", 26, "<C%h> <T%0h> Prefetch response received. pfcnt = %0d.", core_id, thid, pf_cnt[thid]);
		end
	  end
	  
	  {4'h8, 2'bxx, 1'b1, 1'b0, 1'b0}:  
		chk_ccx_ld_response(cpx_pkt);

	  {4'h4, 2'bxx, 1'bx, 1'b0, 1'b0}:  
	   begin
	      if (cpx_pkt[123])  //D pkt
	      begin //{
		if (cpx_pkt[120:118] != core_id)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> D response received from gasket with core_id =%h.", core_id, thid, cpx_pkt[120:118]);
		end
		if (dcache_inv_cnt[thid] == 8'b0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> D response received from gasket while the Dcache_inv_cnt is 0 for this thread.", core_id, thid);
		end
		else
		begin
			dcache_inv_cnt[thid] = dcache_inv_cnt[thid] - 1'b1;
			`PR_INFO("lsu_mon", 26, "<C%h> <T%0h> D response received. Dcache_inv_cnt = %0d.", core_id, thid, dcache_inv_cnt[thid]);
		end
	     end  //}
	     else if (cpx_pkt[124])  //I pkt
	     begin
		if (cpx_pkt[120:118] != core_id)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> I response received from gasket with core_id =%h.", core_id, thid, cpx_pkt[120:118]);
		end
		//`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> I pkt.", core_id, thid);
	     end
	     else if (cpx_pkt[124:123] == 2'b0)
	     begin
		if (cpx_pkt[120:118] == core_id)
		begin
			chk_ccx_st_response(cpx_pkt);
	        end
		else
		begin
			`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Store Ack pkt received from core %0h.", core_id, thid, cpx_pkt[120:118]);
		end
	     end
	   end

	  {4'h1, 2'bxx, 1'bx, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> IFILL1 return.", core_id, thid);
	  {4'h1, 2'bxx, 1'bx, 1'b1, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> IFILL2 return.", core_id, thid);
	  {4'h9, 2'bxx, 1'b1, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> NCU IFILL return.", core_id, thid);
	  
	  {4'b0, 2'bxx, 1'b1, 1'b1, 1'b0}:  
	  begin
		chk_ccx_atm_response(cpx_pkt);
	  end
	  {4'h4, 2'bxx, 1'b1, 1'b1, 1'b0}:  
	  begin
		if ((cpx_pkt[`CPX_RTNTYP] == 4'h4) & (cpx_pkt[120:118] == core_id))
		begin
			chk_ccx_atm_response(cpx_pkt);
			chk_ccx_st_response(cpx_pkt);
		end
	  end
			
	  {4'h2, 2'bxx, 1'b1, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Stream Ld return.", core_id, thid);
	  {4'h6, 2'bxx, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Stream store Ack.", core_id, thid);
	  {4'h5, 2'bxx, 1'b1, 1'b0, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> MMU ld return.", core_id, thid);
	  {4'h7, 2'b00, 1'b0, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Interrupt return.", core_id, thid);
	  {4'h3, 2'b00, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Eviction Invalidation.", core_id, thid);
	  {4'hc, 2'bxx, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> L2 Indication.", core_id, thid);
	  
	  {4'hd, 2'bxx, 1'bx, 1'bx, 1'b0}:  
			`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> Soc Error Indication.", core_id, thid);
	   
	  default:
	  begin
		`PR_ALWAYS("lsu_mon", `ALWAYS, "CPX_PKT data.");
		`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%0h> <T%0h> rtn_typ = %0h, err_bits = %0h, nc=%0b, atm = %0b, pf = %0b",  core_id, cpx_pkt[`CPX_THR_ID], cpx_pkt[`CPX_RTNTYP], cpx_pkt[`CPX_ERR], cpx_pkt[`CPX_NC], cpx_pkt[`CPX_ATM], cpx_pkt[`CPX_PF]);

		`PR_ERROR("lsu_mon", `ERROR, "<C%0h> <T%0h> Can't recognise the CPX pkt.",  core_id, thid);
	  end

	endcase
end
endtask

task chk_ccx_ld_response;
input [145:0] cpx_pkt;
reg [2:0] thid;
reg [20:0] inst;
reg [39:0] cpx_pa, inst_pa;
reg [`LD_Pend_Width] tmp;
reg [3:0] pkt_type;
begin
	thid = cpx_pkt[`CPX_THR_ID];
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	inst_pa = tmp[`MEMOP_PA];
	pkt_type = cpx_pkt[`CPX_RTNTYP];

	   if (ld_valid[thid])
	   begin 
			`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) L2 response.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
		/* 
			if (inst_pa[39] != pkt_type[3])
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> ccx pkt_type = %h mismatches the ld_pa bit 39. ld_pa = %0h.", core_id, thid, pkt_type, inst_pa);
			end
		*/

			if (inst[`BLKLD])
			begin
				if (tmp[`L2_RESP] == 4'h0) 
				begin
					tmp[`L2_RESP] = 4'h1; 
					tmp[`L2_ERR0] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 1.", core_id, thid);
					end

				end
				else if (tmp[`L2_RESP] == 4'h1) 
				begin
					tmp[`L2_RESP] = 4'h3; 
					tmp[`L2_ERR1] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 2.", core_id, thid);
					end
				end
				else if (tmp[`L2_RESP] == 4'h3) 
				begin
					tmp[`L2_RESP] = 4'h7; 
					tmp[`L2_ERR2] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 3.", core_id, thid);
					end
				end
				else if (tmp[`L2_RESP] == 4'h7) 
				begin
					tmp[`L2_RESP] = 4'hF; 
					tmp[`L2_ERR3] = cpx_pkt[`CPX_ERR];
					if ((cpx_pkt[`CPX_ERR] == `ND) || (cpx_pkt[`CPX_ERR] == `UE))
					begin
						`PR_INFO("lsu_mon", 22, "<C%h> <T%0h>  UE/ND err on blk ld helper 4.", core_id, thid);
					end

					//is_blkld[thid] = 1'b1;
					if ((tmp[`L2_ERR0] == `ND) || (tmp[`L2_ERR1] == `ND) || (tmp[`L2_ERR2] == `ND) ||  (tmp[`L2_ERR3] == `ND))
						l2_blk_ld_errtype[thid] = `ND;
					else if ((tmp[`L2_ERR0] == `UE) || (tmp[`L2_ERR1] == `UE) || (tmp[`L2_ERR2] == `UE) ||  (tmp[`L2_ERR3] == `UE))
						l2_blk_ld_errtype[thid] = `UE;
					else if ((tmp[`L2_ERR0] == `CE) || (tmp[`L2_ERR1] == `CE) || (tmp[`L2_ERR2] == `CE) ||  (tmp[`L2_ERR3] == `CE))
						l2_blk_ld_errtype[thid] = `CE;
					else 
						l2_blk_ld_errtype[thid] = `NE;
				end
				else
				begin
					DispPendReq(thid);
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when response pkt received from ccx.", core_id, thid);
				end
			end
			else if (Is_single_pcx_req_ld(inst)) 
			begin
				//is_blkld[thid] = 1'b0;
				if (tmp[`L2_RESP] != 4'hE)
				begin
					DispPendReq(thid);
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when response pkt received from ccx.", core_id, thid);
				end
				//`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Setting L2_resp bits to F.", core_id, thid);
				tmp[`L2_RESP] = 4'hF;
			end
			else
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Load response received from gasket for thid %h while no load request pending from core for this thread.", core_id, thid, thid);
	     end
	     else
	     begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Load response received from gasket while no load request pending from core for this thread.", core_id, thid);
	     end

	ld_pend_array[thid] = tmp;
end
endtask

task chk_ccx_atm_response;
input [145:0] cpx_pkt;
reg [2:0] thid;
reg [20:0] inst;
reg [39:0] inst_pa;
reg [`LD_Pend_Width] tmp;
begin
	thid = cpx_pkt[`CPX_THR_ID];
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	inst_pa = tmp[`MEMOP_PA];

	if (~ld_valid[thid])
	begin
		if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ld response received from gasket while no request pending from core for this thread.", core_id, thid);
		end
		else
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ack response received from gasket while no request pending from core for this thread.", core_id, thid);
		end
	end
        else
   	begin 
		if (~inst[`SWAP] && ~inst[`CASA] && ~inst[`LDSTUB])
		begin
			DispPendReq(thid);
			if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
			begin
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ld response received from gasket which mismatches the request pending from this thread.", core_id, thid);
			end
			else
			begin
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Atomic ack response received from gasket which mismatches the request pending from this thread.", core_id, thid);
			end
		end
		else
		begin
		if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
		begin
			`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) Atomic ld response.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
		end
		else
		begin
			`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) Atomic ack.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);
		end

		   if (cpx_pkt[`CPX_RTNTYP] == 4'b0)
		   begin
			if (tmp[`L2_RESP] == 4'hC) tmp[`L2_RESP] = 4'hD; 
			else
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when atomic ld return pkt received from ccx.", core_id, thid);
			end
		  end
		  else
		  begin
			if (tmp[`L2_RESP] == 4'hD) tmp[`L2_RESP] = 4'hF; 
			else
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Illegal value of l2_resp cnt when atomic ack pkt received from ccx.", core_id, thid);
			end
		  end
		end
	end
	ld_pend_array[thid] = tmp;
end
endtask

task chk_ccx_st_response;
input [145:0] cpx_pkt;
reg [2:0] thid;
reg [20:0] inst;
reg [39:0] cpx_pa, inst_pa;
reg [204:0] tmp;
reg [3:0] pkt_type;
begin
	thid = cpx_pkt[`CPX_THR_ID];
	tmp = stb[{thid, ret_ptr[thid]}];
	inst = tmp[`LSU_MON_INST];
	inst_pa = tmp[`MEMOP_PA];
	pkt_type = cpx_pkt[`CPX_RTNTYP];


//is received. There could be some other store sitting in the STB at that time.

//Chk for squash bit only for non-bis responses.


	if (cpx_pkt[`CPX_BIS])  //response to rmo store
	begin
		if (st_rmo_cnt[thid] == 0)
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> L2 response received for an rmo store while the st_rmo_cnt for this thread is 0.", core_id, thid);
		end
		else
		begin
			st_rmo_cnt[thid] = st_rmo_cnt[thid] - 1'b1;
			`PR_INFO("lsu_mon", 25, "<C%0h> <T%0h> Store ack received for RMO store. rmo_cnt = %0d", core_id, thid, st_rmo_cnt[thid]);
		end
	end
	else
	begin
	   if (tmp[`ST_SQUASH])
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> L2 response received while the SQUASH bit is set in the STB entry %0h.", core_id, thid, ret_ptr[thid]);
	   
           if (~stb_valid[{thid, ret_ptr[thid]}])
           begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Store ack received while that entry is invalid in STB.", core_id, thid);
	   end
	   else
	   begin
	      if (~cpx_pkt[`CPX_ATM])  //don't print this message for atomic return
	      begin
		`PR_INFO("lsu_mon", 26, "<C%0h> <T%0h> <%0h> %s(VA=%0h) STB[%0d] Store ack.", core_id, thid, tmp[`INST_VA],  tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA], ret_ptr[thid]);
              end
	      tmp[`L2_ACK] = 1'b1;
	      stb[{thid, ret_ptr[thid]}] = tmp;
		ret_ptr[thid] = ret_ptr[thid] + 1'b1;
		//`PR_INFO("lsu_mon", 22, "<C%0h> <T%0h> ret_ptr = %0d.", core_id, thid, ret_ptr[thid]);
	   end
	end
end
endtask

task Chk_req_load;
input [129:0] pcx_pkt;
reg [2:0] thid;
reg [`LD_Pend_Width] tmp;
reg [39:0] pcx_pa, inst_pa;
reg [20:0] inst;
reg [11*8:0] req;
begin
	
	thid = pcx_pkt[`PCX_THR_ID];
	tmp = ld_pend_array[thid];
	inst = tmp[`LSU_MON_INST];
	pcx_pa = pcx_pkt[`PCX_ADDR];
	inst_pa = tmp[`MEMOP_PA];
	req = DispPCXReq(pcx_pkt);

	if (inst[`BLKLD])
	begin
		if (pcx_pa[39:6] != inst_pa[39:6])
		begin
			DispPendReq(thid);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A load request made to gasket by LSU while the pending req has PA %0h.", core_id, thid, pcx_pa, tmp[`MEMOP_PA]);
		end
		if (pcx_pa[5:0] == 6'b0)
		begin
			if (tmp[`L2_ISS] != 4'h0 )
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 1st load request (pa[5:0] = 6'b0) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				tmp[`L2_ISS] = 4'h1;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 1st blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			end
				
		end
		if (pcx_pa[5:0] == 6'h10)
		begin
			if (tmp[`L2_ISS] != 4'h1)
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 2nd load request (pa[5:0] = 6'h10) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				tmp[`L2_ISS] = 4'h3;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 2nd blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			end
		end
		if (pcx_pa[5:0] == 6'h20)
		begin
			if (tmp[`L2_ISS] != 4'h3)
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 3rd load request (pa[5:0] = 6'h20) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				tmp[`L2_ISS] = 4'h7;
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 3rd blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
			end
		end
		if (pcx_pa[5:0] == 6'h30)
		begin
			if (tmp[`L2_ISS] != 4'h7)
			begin
				DispPendReq(thid);
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> 4th load request (pa[5:0] = 6'h30) made to gasket by LSU for blkld while this request has already been issued to gasket.", core_id, thid, pcx_pa);
			end
			else
			begin
				`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) 4th blkld helper Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
				tmp[`L2_ISS] = 4'hF;
			end
		end
		ld_pend_array[thid] = tmp;
	end
	else if (Is_single_pcx_req_ld(inst)) 
	begin
	  if (tmp[`L2_ISS] == 4'hF)
	  begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Load request  made to gasket by LSU while this request has already been issued to gasket.", core_id, thid, pcx_pa);
	  end
	  else
	  begin
		tmp[`L2_ISS] = 4'hF;
		ld_pend_array[thid] = tmp;
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA]);
	  end
	end
	else
	begin
		DispPendReq(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A load request made to gasket by LSU while there is no such ld request pending from this thread.", core_id, thid, pcx_pa);
	end
end
endtask

	
function Is_single_pcx_req_ld;
input [20:0] inst;
begin
	if (inst[`LDD] || inst[`QLD] || inst[`FSR_RD_WR] || (inst == 21'h1) || (inst == 21'h5))
		Is_single_pcx_req_ld = 1'b1;
	else
		Is_single_pcx_req_ld = 1'b0;
	//`PR_INFO("lsu_mon", 22, "<C%0h> Is_single_pcx_req_ld = %b. ", core_id, Is_single_pcx_req_ld);
end
endfunction
			          

function Is_trap;
input [2:0]tid;

begin
	Is_trap = 1'b0;
	case (`SPC7.lsu_trap_flush[7:0])
		8'h01: if (tid == 3'h0) Is_trap = 1'b1;
		8'h02: if (tid == 3'h1) Is_trap = 1'b1;
		8'h04: if (tid == 3'h2) Is_trap = 1'b1;
		8'h08: if (tid == 3'h3) Is_trap = 1'b1;
		8'h10: if (tid == 3'h4) Is_trap = 1'b1;
		8'h20: if (tid == 3'h5) Is_trap = 1'b1;
		8'h40: if (tid == 3'h6) Is_trap = 1'b1;
		8'h80: if (tid == 3'h7) Is_trap = 1'b1;
	endcase
end
endfunction

function [8*11:0] DispPCXReq;
input [129:0] pcx_pkt;
begin
	casex ({pcx_pkt[`PCX_RQTYP], pcx_pkt[`PCX_NC], pcx_pkt[`PCX_INV], pcx_pkt[`PCX_PF], pcx_pkt[`PCX_BIS]})
		{5'h0, 1'b1, 1'b0, 1'b1, 1'b0}: DispPCXReq = "PREF";
		{5'h0, 1'b1, 1'b1, 1'b1, 1'b0}: DispPCXReq = "PREF_ICE";
		{5'h0, 1'bx, 1'b0, 1'b0, 1'b0}: DispPCXReq = "LD";
		{5'h0, 1'bx, 1'b1, 1'b0, 1'b0}: DispPCXReq = "D";  
		{5'h10, 1'bx, 1'b0, 1'b0, 1'b0}: DispPCXReq = "I";
		{5'h10, 1'b0, 1'b1, 1'b0, 1'b0}: DispPCXReq = "I";
		{5'h1, 1'bX, 1'bX, 1'b0, 1'b0}: DispPCXReq = "ST";
		{5'h1, 1'bX, 1'bX, 1'b1, 1'b1}: DispPCXReq = "BLKST";
		{5'h1, 1'bX, 1'bX, 1'b0, 1'b1}: DispPCXReq = "BIS";
		{5'h2, 1'b1, 1'bX, 1'b0, 1'b0}: DispPCXReq = "CASA1";
		{5'h3, 1'b1, 1'bX, 1'b0, 1'b0}: DispPCXReq = "CASA2";
		{5'h7, 1'b1, 1'bX, 1'b0, 1'b0}: DispPCXReq = "SWAP_LDSTUB";
		{5'h4, 1'b1, 1'b0, 1'b0, 1'b0}: DispPCXReq = "STREAM_LD";
		{5'h5, 1'b1, 1'b0, 1'b0, 1'bx}: DispPCXReq = "STREAM_ST";
		{5'h8, 1'b1, 1'b0, 1'b0, 1'b0}: DispPCXReq = "MMU_LD";
		//{5'h9, 1'b0, 1'b0, 1'b0, 1'b0}: DispPCXReq = "INT";
		default:
		begin
			`PR_ERROR("lsu_mon", `ERROR, "<C%0h> <T%0h> <%0h> Can't recognise the PCX pkt type. rq_type = %h, nc_bit = %0b, inv_bit = %0b, pf_bit = %0b, bis_bit = %0b. pcx_pkt[129:0] = %h",  core_id, pcx_pkt[`PCX_THR_ID], pcx_pkt[`PCX_ADDR], pcx_pkt[`PCX_RQTYP], pcx_pkt[`PCX_NC], pcx_pkt[`PCX_INV], pcx_pkt[`PCX_PF], pcx_pkt[`PCX_BIS], pcx_pkt);
			DispPCXReq = " ";
		end
	 endcase
end
endfunction

function IsExc;
input [2:0] core_id;
reg [21*8:0] DispExc;

begin
	DispExc = 170'b0;
	IsExc = 1'b0;

	if (`SPC7.lsu_align_b) DispExc = "Addr_not_aligned";
	if (`SPC7.lsu_lddf_align_b) DispExc = "LDDF_Addr_not_aligned";
	if (`SPC7.lsu_stdf_align_b) DispExc = "STDF_Addr_not_aligned";
	if (`SPC7.lsu_priv_action_b) DispExc = "Priv_actio";
	if (`SPC7.lsu_va_watchpoint_b) DispExc = "VA_watchpoint";
	if (`SPC7.lsu_pa_watchpoint_b) DispExc = "PA_watchpoint";
	//if (`SPC7.lsu_tlb_miss_b_) DispExc = "Tlb_miss";
	if (`SPC7.lsu_illegal_inst_b) DispExc = "Illegal_inst";
	if (`SPC7.lsu_daccess_prot_b) DispExc = "Data_access_prot_exc";
	if (`SPC7.lsu_dae_invalid_asi_b) DispExc = "Dae_Invalid_asi";
	if (`SPC7.lsu_dae_nc_page_b) DispExc = "Dae_nc_page";
	if (`SPC7.lsu_dae_nfo_page_b) DispExc = "Dae_NFO_page";
	if (`SPC7.lsu_dae_priv_viol_b) DispExc = "Dae_Priv_viol";
	if (`SPC7.lsu_dae_so_page) DispExc = "Dae_so_page";
	//if (`SPC7.lsu_perfmon_trap_b) DispExc = "Perf_mon_trap";
	if (`SPC7.lsu_dtmh_err_b) DispExc = "DTLB_data_par_err";
	if (`SPC7.lsu_dttp_err_b) DispExc = "DTLB_tag_par_err";
	if (`SPC7.lsu_dtdp_err_b) DispExc = "DTLB_data_par_err";

	
	if (DispExc != 0)
	begin
		IsExc = 1'b1;
		`PR_INFO("lsu_mon", 23, "<C%0h> <T%0h> <%0h> B_stage: %s(VA=%0h) ASI = %0h. %s Exception.",core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b, asi_b, DispExc);
	end

end
endfunction

function Is_exu_error;
input [1:0] exu_lsu_va_error_b;     // VA error requiring a flush
input [1:0] exu_ecc_b;              // ECC error requiring a flush
reg err_b;
reg err_m;

begin
	err_b = dec_lsu_tid_b[2] ? (exu_ecc_b[1] | (exu_lsu_va_error_b[1] & ~`SPC7.lsu_tlb_bypass_b)):
				(exu_ecc_b[0] | (exu_lsu_va_error_b[0] & ~`SPC7.lsu_tlb_bypass_b));

	err_m = (dec_lsu_tid_b[2] ? `SPC7.exu_ecc_m[1] : `SPC7.exu_ecc_m[0]) & `SPC7.lsu.dcc.twocycle_b;
					
	Is_exu_error = err_b | err_m;
end
endfunction

/*
task Insert_tlb_miss_info;
reg [127:0] tmp;
begin
	tmp =  128'b0;
	if (tlb_valid[dec_lsu_tid_b])
	begin
		tmp = tlbmiss_pend_array[dec_lsu_tid_b];
		Disp_tlbmiss_pend_array_entry(dec_lsu_tid_b);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h>) A new tlb miss request received while there is already a Tlb miss request pending from this thread as shown above.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
	end
	else
	begin
		tlb_valid[dec_lsu_tid_b] <= 1'b1;
		tmp[`INST_VA] = inst_pc_b;
		tmp[`MEMOP_VA] = vaddr_b;
		tmp[`INST] = inst_b;
	end
	tlbmiss_pend_array[dec_lsu_tid_b] = tmp;
end
endtask

*/

//problem with the signal.
/*
always @ (negedge `SPC7.l2clk)
begin
	if (mmu_dtlb_reload_d2)
		Chk_dtlb_reload;
end

task Chk_dtlb_reload;
reg [2:0] thid;
reg [127:0] tmp;
begin
		if (`SPC7.tlu_trap_pc_0_valid)
			thid = {1'b0, `SPC7.tlu_trap_0_tid};
		else if (`SPC7.tlu_trap_pc_1_valid)
			thid = {1'b0, `SPC7.tlu_trap_1_tid};
		else 
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> mmu_dtlb_reload asserted but trap_pc_0_valid and trap_pc_1_valid are both 0", core_id);

		if (~tlb_valid[thid])
			`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> mmu_dtlb_reload asserted while tlb_valid is 0.", core_id, thid);
		else
		begin
			tmp = tlbmiss_pend_array[dec_lsu_tid_b];
			`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> %s(VA=%0h> DTLB reloaded for VA = %0h.", core_id, thid, tb_top.intf0.xlate(tmp[`INST]), tmp[`INST_VA], tmp[`MEMOP_VA] );
			tlb_valid[thid] = 1'b0;
		end
end
endtask
*/

task Insert_ld_miss_info;
reg [`LD_Pend_Width] tmp;
begin
	tmp = 213'b0;
	if (ld_valid[dec_lsu_tid_b])
	begin
		tmp =  ld_pend_array[dec_lsu_tid_b];
		DispPendReq(dec_lsu_tid_b);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h> B_stage: %s(VA=%0h>) A new request received while there is already a request pending from this thread as shown above.", core_id, dec_lsu_tid_b, inst_pc_b, tb_top.intf0.xlate(inst_b),vaddr_b);
	end
	else
	begin
		//ld_valid[dec_lsu_tid_b] <= 1'b1;
		tmp[`INST_VA] = inst_pc_b;
		tmp[`MEMOP_VA] = vaddr_b;
		tmp[`MEMOP_PA] = {`SPC7.lsu.tlb_pgnum[39:13], vaddr_b[12:0]};
		tmp[`INST_ASI] = asi_b;

		if (lsu_inst_b[`BLKLD])
		begin
			tmp[`L2_ISS] =  4'h0;
			tmp[`L2_RESP] =  4'h0;
			is_blkld[dec_lsu_tid_b] = 1'b1;
		end
		else
		begin
		   is_blkld[dec_lsu_tid_b] = 1'b0;
		   if (lsu_inst_b[`CASA])
			tmp[`L2_ISS] =  4'hC;
		   else
			tmp[`L2_ISS] =  4'hE;
		   if (lsu_inst_b[`SWAP] || lsu_inst_b[`LDSTUB] || lsu_inst_b[`CASA])
			tmp[`L2_RESP] =  4'hC;
		   else
			tmp[`L2_RESP] =  4'hE;

		end

		tmp[`INST] = inst_b;
		tmp[`LSU_MON_INST] = lsu_inst_b; 
		ld_pend_array[dec_lsu_tid_b] = tmp;
	end
end
endtask


task Insert_in_last_inst_array;
reg [135:0] tmp;
begin
	tmp = 128'b0;
	tmp[`INST_VA] = inst_pc_b;
	tmp[`MEMOP_VA] = vaddr_b;
	tmp[`INST] = inst_b;
	tmp[135:128] = asi_b;
	last_inst_array[dec_lsu_tid_b] = tmp;
end
endtask


task DispPendReq;
input [2:0] thid;
reg [`LD_Pend_Width] tmp;
begin
	
	tmp =  ld_pend_array[thid];
	`PR_ALWAYS("lsu_mon", `ALWAYS, "LD_PEND_ARRAY[%0h] Data.", thid);
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> <%0h> %s(VA=%0h). PA = %0h. L2_ISS = %0h. L2_RESP = %0h, LSU_MON_INST=%h.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA], tmp[`MEMOP_PA], tmp[`L2_ISS], tmp[`L2_RESP], tmp[`LSU_MON_INST]);
end
endtask

task Disp_STB_entry;
input [2:0] thid;
input [2:0] ptr;
reg [204:0] tmp;
begin
	
	tmp =  stb[{thid, ptr}];
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> STB[%0h] data.", core_id, thid, ptr);
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%h> <T%0h> <%0h> %s(VA=%0h). PA = %0h. L2_ISS = %0h. L2_ACK = %0h, LSU_MON_INST=%h. RMO = %0b", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA], tmp[`MEMOP_PA], tmp[`L2_ST_ISS], tmp[`L2_ACK], tmp[`LSU_MON_INST], tmp[`RMO]);
end
endtask

/*
		
task Disp_tlbmiss_pend_array_entry;
input [2:0] thid;
reg [127:0] tmp;
begin
	tmp = tlbmiss_pend_array[thid];
	`PR_INFO("lsu_mon", 23, "TLB_MISS_PEND_ARRAY[%0h] Data.", thid);
	`PR_INFO("lsu_mon", 23, "<C%h> <T%0h> <%0h> %s(VA=%0h).", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]), tmp[`MEMOP_VA]);

end
endtask

*/
task Disp_CPX_pkt;
input [145:0] cpx_pkt;
begin
	`PR_ALWAYS("lsu_mon", `ALWAYS, "CPX_PKT data.");
	`PR_ALWAYS("lsu_mon", `ALWAYS, "<C%0h> <T%0h> rtn_typ = %0h, err_bits = %0h, nc=%0b, atm = %0b, pf = %0b",  core_id, cpx_pkt[`CPX_THR_ID], cpx_pkt[`CPX_RTNTYP], cpx_pkt[`CPX_ERR], cpx_pkt[`CPX_NC], cpx_pkt[`CPX_ATM], cpx_pkt[`CPX_PF]);
end
endtask
	

task Make_STB_data;
reg [204:0] tmp;
begin
		tmp = 0;
		tmp[`INST_VA] = inst_pc_b;
		tmp[`MEMOP_VA] = vaddr_b;
		tmp[`MEMOP_PA] = {`SPC7.lsu.tlb_pgnum[39:13], vaddr_b[12:0]};
		tmp[`L2_ST_ISS] =  1'b0;
		tmp[`ASI_ST_ISS] =  1'b0;
		tmp[`L2_ACK] =  1'b0;
		tmp[`INST] = inst_b;
		tmp[`LSU_MON_INST] = lsu_inst_b;
		tmp[`ST_SQUASH] = 1'b0;
		tmp[`INST_ASI] = asi_b;
		if (`SPC7.lsu.tlu_lsu_hpstate_hpriv[dec_lsu_tid_b])
		   tmp[`ST_PRIV] = `HPRIV; 
		else if (`SPC7.lsu.tlu_lsu_pstate_priv[dec_lsu_tid_b])
		   tmp[`ST_PRIV] = `PRIV; 
		else
		   tmp[`ST_PRIV] = `USER; 
		//bis_asi to io space is not rmo

		tmp[`RMO] = lsu_inst_b[`BLKST] | (dec_altspace_b & Is_bis_asi(asi_b) & ~`SPC7.lsu.tlb_pgnum[39]);
		stb_alloc_data <= tmp;
end
endtask

task Insert_in_STB;
input [195:0] store_data;
input [2:0] thid;
begin
	if (stb_full(thid))
	begin
		//DispSTB(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> STB full and a new store received for insertion in STB.", core_id, thid);
	end
	else
	begin
		stb[{thid, wrptr[thid]}] = store_data;
		//Disp_STB_entry(thid, wrptr[thid]);
		`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h> %s(VA=%0h). STB[%0h] Inserted.", core_id, thid, store_data[`INST_VA], tb_top.intf0.xlate(store_data[`INST]), store_data[`MEMOP_VA], wrptr[thid]);
		stb_valid[{thid, wrptr[thid]}] = 1'b1;
		wrptr[thid] = wrptr[thid] + 1'b1;
		//`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> wrptr = %0d.", core_id, thid, wrptr[thid]);
	end
end
endtask

function stb_full;
input [2:0] thid;
begin
	if ((wrptr[thid] == rdptr[thid]) && stb_valid[{thid, wrptr[thid]}])
		stb_full = 1'b1;
	else
		stb_full = 1'b0;
end
endfunction
	

task Dealloc_STB;
input [2:0] thid;
reg [204:0] tmp;
reg [20:0] lsu_inst;
begin
	//thid = decode_tid(`SPC7.lsu_stb_dealloc);
	tmp = stb[{thid, rdptr[thid]}];
	lsu_inst = tmp[`LSU_MON_INST];
	if (~stb_valid[{thid, rdptr[thid]}])
	begin
		//DispSTB(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_dealloc = %0h asserted while the stb entry is invalid for that thid.", core_id, thid, `SPC7.lsu_stb_dealloc);
	end
	if (tmp[`L2_ST_ISS]) 
	begin
	    if (~tmp[`L2_ACK])
	    begin
		Disp_STB_entry(thid, rdptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_dealloc = %0h asserted when we haven't received the response from the gasket.", core_id, thid, `SPC7.lsu_stb_dealloc);
	    end
	end
	else if (tmp[`ASI_ST_ISS])
	begin
		ret_ptr[thid] = ret_ptr[thid] + 1'b1;
	end
	//blkst inst. is not issued anywhere, blkst helpers are issued.
	//in case of bis stores, lsu issues the dealloc in P3, i.e when the req is issued to PCX.
	//IF it is bis to cp sapce and there is an err then the store is issued to PCX with nd set
	// and deallocated.
	//However for ue onbis to IO space, dealloc is sent to IFU, issued on PCX with valid bit 0.
	//The sbdiou signal is sent in next cycle. We need to take bis io stores in this equation.
	else if (tmp[`ST_SQUASH] || lsu_inst[`BLKST] || (tmp[`RMO] & ~lsu_inst[`BLKST] & ~`SPC0.lsu.sbc.kill_store_p4_)) 
	begin
		iss_ptr[thid] = iss_ptr[thid] + 1'b1;
		ret_ptr[thid] = ret_ptr[thid] + 1'b1;
	end
	else 
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_dealloc = %0h asserted which is not issued to asi ring, or PCX or is not squashed.", core_id, thid, `SPC7.lsu_stb_dealloc);

	`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <%0h>: %s(VA=%0h) PA = %0h. STB[%0d] Deallocated.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], tmp[`MEMOP_PA], rdptr[thid]);
	stb_valid[{thid, rdptr[thid]}] = 1'b0;
	rdptr[thid] = rdptr[thid] + 1'b1;
	//`PR_INFO("lsu_mon", 22, "<C%h> <T%0h> rd_ptr = %0d.", core_id, thid, rdptr[thid]);
	/*
	if (tmp[`RMO])
		st_rmo_cnt[thid] = st_rmo_cnt[thid]  + 1'b1;
	*/
end
endtask

task Squash_STB;
input [2:0] thid;
reg [204:0] tmp;
reg [3:0] squash_cnt;
reg [2:0] i;
begin
	squash_cnt = 4'b0;
        if (ret_ptr[thid] != iss_ptr[thid])
	       `PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> lsu_block_store_kill asserted while the ret_ptr = %0h  != iss_ptr = %0h.", core_id, thid, tmp[`MEMOP_PA], ret_ptr[thid], iss_ptr[thid]);
        if (rdptr[thid] != iss_ptr[thid])
	       `PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> lsu_block_store_kill asserted while the rdptr = %0h  != iss_ptr = %0h.", core_id, thid, tmp[`MEMOP_PA], rdptr[thid], iss_ptr[thid]);

	if (iss_ptr[thid] == wrptr[thid])
	begin
	    if (stb_valid[{thid, wrptr[thid]}])
		squash_cnt = 8;
/* Lsu can assert both dealloc and block_store_kill for a request.
 *
	    else
	    begin
              	`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Lsu asserted block_store_kill while there are no valid entries in STB to be deallocated.", core_id, thid);
	    end
*/
	end
	else
	begin
	  if (iss_ptr[thid] < wrptr[thid])
		squash_cnt = wrptr[thid] - iss_ptr[thid];
	  else if (iss_ptr[thid] > wrptr[thid])
		squash_cnt = wrptr[thid] + (8 - iss_ptr[thid]);
	end

	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> SQUASH_STB:iss_ptr = %0h, wrptr = %0h, squash_cnt = %0h.", core_id, thid, iss_ptr[thid], wrptr[thid], squash_cnt);

	i = iss_ptr[thid];
       
       `PR_INFO("lsu_mon", 22, "<C%h> <T%0h> Block store kill changed issue_ptr:%0h->%0h. ret_ptr: %0h->%0h. rdptr:%0h->%0h.", core_id, thid, iss_ptr[thid], iss_ptr[thid]+squash_cnt, ret_ptr[thid], ret_ptr[thid]+squash_cnt, rdptr[thid], rdptr[thid]+squash_cnt);

   	ret_ptr[thid] = ret_ptr[thid] + squash_cnt;
	rdptr[thid] = rdptr[thid] + squash_cnt;
        iss_ptr[thid] = iss_ptr[thid] + squash_cnt;
		
	while (squash_cnt)
	begin
	    tmp = stb[{thid, i}];
	    if (~stb_valid[{thid, i}])
	    begin
		//DispSTB(thid);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h><PA = %0h> lsu_block_store_kill asserted while the stb entry %0h is invalid.", core_id, thid, tmp[`MEMOP_PA], i);
	    end
	    if (tmp[`L2_ST_ISS]) 
	    begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h>st_issue bit is set when the block_store_kill is asserted for stb entry %0h.", core_id, thid, tmp[`MEMOP_PA], i);
	    end
	    //commenting out the chk below. Lsu can assert sbdiou and then in the next cycle insert a new entry into
	    //stb. LSU will squash this new entry and won't issue it to PCX/asi but its squash bit won't be 
	    //set in the chkr which was causin it to fire. 
	    //if (~tmp[`ST_SQUASH]) 
	    //begin
	       //`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> lsu_block_store_kill asserted while the squash bit is 0 in the STB entry %0h.", core_id, thid, tmp[`MEMOP_PA], i);
	    //end
	    stb_valid[{thid, i}] = 1'b0; 

	    i = i + 1;
	    squash_cnt = squash_cnt - 1'b1;
	end

end
endtask

task Chk_store;
reg [2:0] thid;
reg [47:0] addr;
reg [3:0] i;
reg [204:0] tmp;
begin
	if ((bst_cnt > 0) && (`SPC7.lsu_stb_alloc == 8'b0))
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> Blk store entries are not allocated back to back in STB.", core_id, bst_active_thid);

//For bst the stb is still written even though we have errors.
//Stb is written in W stage. Howvere for first blk store helper
//the err will be flagged by FGU in b stage. We can miss the
// err signal if we don't sample in B.
//for the last helper err will be signalled in B stage of last helper and at

	if (lsu_bst_active[bst_active_thid] & `SPC0.fgu_fst_ecc_error_fx2 & (bst_cnt < 7))
             bst_fgu_err = 1'b1;

	if (`SPC7.lsu_stb_alloc[7:0] != 8'b0)
	begin
		thid = decode_tid(`SPC7.lsu_stb_alloc[7:0]);
		if (store_alloc)
		begin
			if (thid != dec_lsu_tid_w)
				`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_alloc = %0h mismatches the thid %0h.", core_id, dec_lsu_tid_w, `SPC7.lsu_stb_alloc[7:0], dec_lsu_tid_w);
			Insert_in_STB(stb_alloc_data, dec_lsu_tid_w);
		end
		else 
		begin
		    if (lsu_bst_active[thid])
		    begin
			   if (bst_cnt == 0)
			   begin
				bst_data = bst_inst_data;
			   end
		           else
			   begin
				if (thid != bst_active_thid)
				begin
					`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> lsu_stb_alloc = %0h mismatches the active blkstore thid = %0h.", core_id, bst_active_thid, `SPC7.lsu_stb_alloc[7:0], bst_active_thid);
				end

				addr = bst_data[`MEMOP_VA];

				bst_data[`MEMOP_VA] = {addr[47:6], bst_cnt[2:0], 3'b0};
				addr = bst_data[`MEMOP_PA];
				bst_data[`MEMOP_PA] = {addr[39:6], bst_cnt[2:0], 3'b0};
			   end
                                bst_cnt = bst_cnt + 1;
                                Insert_in_STB(bst_data, bst_active_thid);
                                if (bst_cnt == 8)
                                begin
                                        bst_cnt = 0;
                                        lsu_bst_active[thid] = 1'b0;
                                        if (bst_fgu_err) //set the squash bit to 0 for all the stb entries
                                        begin
                                          for (i = 0; i < 8; i=i+1)
                                          begin
                                             tmp = stb[{thid, i[2:0]}];
					     if (tmp[`ST_SQUASH])
						`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Squash bit already set when trying to set it for a bst fgu errerr.", core_id, thid, tmp[`MEMOP_PA]);
					     tmp[`ST_SQUASH] = 1'b1;
                                             stb[{thid, i[2:0]}] = tmp; 
                                             `PR_INFO("lsu_mon", 22, "<C%h> <T%0h> <PA = %0h> STB_entry[%0h] squashed due to FGU err.", core_id, thid, tmp[`MEMOP_PA], i);
                                          end
                                        end
					bst_fgu_err = 1'b0;
                                end
			end
			else
				`PR_ERROR("lsu_mon", `ERROR, "<C%h>: LSU asserted lsu_stb_alloc  = %0h while no store pending to be written in STB.", core_id, `SPC7.lsu_stb_alloc[7:0]);
				
		end
	end
	else
	begin
		if (store_alloc)
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h> W_stage: LSU did not assert lsu_stb_alloc for the store.", core_id, dec_lsu_tid_w, inst_pc_w);
	end
end
endtask

task Chk_st_on_ASI_ring;
input ring;
reg [2:0] thid;
reg [7:0] asi;
reg [47:0] addr, act_addr;
reg [1:0] req_type;
reg [204:0] tmp;

begin
	if (ring == `LOCAL)
		thid =`SPC7.lsu_rngl_cdbus[58:56];
	else
		thid =`SPC7.lsu_rngf_cdbus[58:56];
	
	if (ring == `LOCAL)
		asi =`SPC7.lsu_rngl_cdbus[55:48];
	else
		asi =`SPC7.lsu_rngf_cdbus[55:48];
	
	if (ring == `LOCAL)
		addr =`SPC7.lsu_rngl_cdbus[47:0];
	else
		addr =`SPC7.lsu_rngf_cdbus[47:0];
	
	if (ring == `LOCAL)
		req_type =`SPC7.lsu_rngl_cdbus[61:60];
	else
		req_type =`SPC7.lsu_rngf_cdbus[61:60];
	

	tmp = stb[{thid, iss_ptr[thid]}];
	if (tmp[`ASI_ST_ISS])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store reissued on the ASI interface.", core_id, thid, addr);
	end
	
	if (tmp[`ST_SQUASH])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store issued on the ASI interface that has been squashed.", core_id, thid, addr);
	end

	act_addr  = tmp[`MEMOP_PA];
	act_addr = {act_addr[39:3], 3'b0};

	//47 is D tag rd asi. LSU issues that on the ring but changes 
	//the address.
	if ((addr == act_addr) || (asi == 8'h47) || (asi == 8'h46))  
	begin
		tmp[`ASI_ST_ISS] = 1'b1;
		stb[{thid, iss_ptr[thid]}] = tmp;
		if (ring == `LOCAL)
		begin
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued on local ring.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
		end
		else
		begin
			`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued on fast ring.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
		end
		iss_ptr[thid] = iss_ptr[thid] + 1'b1;
	end
	else
	begin
	   if (ring == `LOCAL)
	   begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] PA mismatch for asi req on local ring. Expected PA = %0h, actual PA = %0h", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid], tmp[`MEMOP_PA], addr);
	   end
	   else
	   begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] PA mismatch for asi req on fast ring. Expected PA = %0h, actual PA = %0h", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid], tmp[`MEMOP_PA], addr);
	  end
	end

end
endtask


task chk_store_issue_to_pcx;
input [129:0] pcx_pkt;
reg [2:0] thid;
reg [204:0] tmp;
reg [20:0] inst;
reg [39:0] pcx_pa, inst_pa;
begin
	thid = pcx_pkt[`PCX_THR_ID];
	tmp = stb[{thid, iss_ptr[thid]}];
	inst = tmp[`LSU_MON_INST];
	pcx_pa = pcx_pkt[`PCX_ADDR];
	inst_pa = tmp[`MEMOP_PA];
	
	if (pcx_pkt[`PCX_RQTYP] == `PCX_STORE)
	begin
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued to gasket.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
	end
	if (pcx_pkt[`PCX_INV])
		`PR_INFO("lsu_mon", 25, "<C%h> <T%0h> <%0h>: %s(VA=%0h) STB[%0d] Issued to gasket with ND set.", core_id, thid, tmp[`INST_VA], tb_top.intf0.xlate(tmp[`INST]),tmp[`MEMOP_VA], iss_ptr[thid]);
		

	if (~inst[`ST])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A store request made to gasket by LSU while the pending req is not store.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end

/* CONFIRM WITH MARK
	if (pcx_pa[39:0] != inst_pa[39:0])
	begin
			Disp_STB_entry(thid, iss_ptr[thid]);
			`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> A store request made to gasket by LSU while the pending req has PA %0h.", core_id, thid, pcx_pkt[`PCX_ADDR], tmp[`MEMOP_PA]);
	end
*/
//enhancement req 100146
	if ((tmp[`INST_ASI] == 8'h73) & (pcx_pa[39:0] != {8'h90, core_id, thid, tmp[`INST_ASI], 18'h0})) 
	begin
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> pcx_pa is not correct for asi write to interrupt vector dispatch register.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end

	if (inst[`BLKST] && ~pcx_pkt[`PCX_BST])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Bst bit is not set in the PCX pkt by LSU for a blk st request.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end

	if (tmp[`L2_ST_ISS])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store reissued on the PCX interface.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end
	else
	        tmp[`L2_ST_ISS] =  1'b1;
	
	if (tmp[`ST_SQUASH])
	begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> Store issued on the PCX interface that has been squashed.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	end
	
	if (tmp[`RMO])
	begin
	   if (~pcx_pkt[`PCX_BIS])
	   begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> BIS bit is not set in the PCX pkt by LSU for an RMO store.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	   end
	   if (tmp[`L2_ACK])
	   begin
		Disp_STB_entry(thid, iss_ptr[thid]);
		`PR_ERROR("lsu_mon", `ERROR, "<C%h> <T%0h> <PA = %0h> L2ack bit is set when the RMO store is issued to PCX.", core_id, thid, pcx_pkt[`PCX_ADDR]);
	   end
	   else
	   begin
		tmp[`L2_ACK] = 1'b1;
		ret_ptr[thid] = ret_ptr[thid] + 1;  //this will be deallocated before 
						    //response seen from stub
		st_rmo_cnt[thid] = st_rmo_cnt[thid]  + 1'b1;
	   end
	end
	stb[{thid, iss_ptr[thid]}] = tmp;

	iss_ptr[thid] = iss_ptr[thid] + 1;
	`PR_INFO("lsu_mon", 20, "<C%h> <T%0h> iss_ptr = %0d. ret_ptr = %0d, st_rmo_cnt = %0d", core_id, thid, iss_ptr[thid], ret_ptr[thid], st_rmo_cnt[thid]);
end
endtask

`ifdef INJ_STB_ERR_IN_CMP


reg [2:0] err_tid, stb_err_tid_d1, stb_err_tid_d2;
reg [2:0] err_index, stb_err_index_d1, stb_err_index_d2;
reg [204:0] err_tmp ;
reg [20:0] err_inst;
reg [44:0] cam_data;
reg [5:0] err_bit;
integer err_inj_cnt;
reg cmp_stb_err_inj;
reg stb_err_inj, stb_err_inj_d1, stb_err_inj_d2;
reg [1:0] err_priv, stb_err_priv_d1, stb_err_priv_d2;

initial
begin
	cmp_stb_err_inj = 1'b0;

	cam_data = 45'b0;
	err_bit = 11;
	err_inj_cnt = 0;
	stb_err_inj = 0;
	if (("cmp_stb_err_inj_on"))
		cmp_stb_err_inj = 1'b1;
	else
		cmp_stb_err_inj = 1'b0;
end

always @ (negedge (`SPC7.l2clk & enabled & cmp_stb_err_inj))
begin //{
     //valid stb ram rd for issue to pcx
     stb_err_inj = 1'b0;
     if (`SPC7.lsu.sbc.ram_rptr_vld_2 & `SPC7.lsu.sbc.st_pcx_rq_p3 & `SPC7.lsu.pic.pic_st_sel_p3)
     begin //{
	err_tid = decode_tid(`SPC7.lsu.sbc.st_rq_sel_p3[7:0]);
	err_index = `SPC7.lsu.sbc.ram_rptr_d1;
	err_tmp = stb[{err_tid, err_index}];
	err_inst = err_tmp[`LSU_MON_INST];
	cam_data = `SPC7.lsu.stb_cam.cam_array.stb_rdata[44:0];
	err_priv = err_tmp[`ST_PRIV];
	//if (err_inst[`SWAP] || err_inst[`CASA] || err_inst[`LDSTUB])
	if (err_inst[`CASA])
	begin //{
	   err_inj_cnt = err_inj_cnt + 1;
	   if (err_inj_cnt == 10)
	   begin //{
	     case (err_bit)
	       11, 12: err_bit = err_bit + 1;
	       13: err_bit = 44;
	       44: err_bit = 11;
	      endcase
	      err_inj_cnt = 0;
	      stb_err_inj = 1'b1;

	      force `SPC0.lsu.stb_cam.cam_array.stb_rdata[44:0] = cam_data ^ (1 << err_bit);
	      `PR_INFO("stb_err", 22, "<T%0h> <%0h> STB[%0h]: SBAPP forced for CASA. err_bit = %0h", err_tid, {cam_data[44:8], 3'b0}, err_index, err_bit);
	      #1;
	      release `SPC0.lsu.stb_cam.cam_array.stb_rdata[44:0];
	   end  //}
	end //}
     end  //}
     if (stb_err_inj_d2)
     begin
	if (~`SPC7.lsu_sbapp_err_g)
	begin
	            `PR_ERROR("lsu_mon", `ERROR, "<T%0h> sbapp err not asserted when err is injected for atomic.", stb_err_tid_d2);
	end
	else
	begin
		if ((`SPC7.lsu_stberr_tid_g != stb_err_tid_d2) || 
		    (`SPC7.lsu_stberr_index_g != stb_err_index_d2) || 
		    (`SPC7.lsu_stberr_priv_g != stb_err_priv_d2))
		begin
	            `PR_ERROR("lsu_mon", `ERROR, "<T%0h> sbapp err parameters mismatch.", stb_err_tid_d2);
		end
	end
    end
    else
    begin
	if (`SPC7.lsu_sbapp_err_g)
	begin
	            `PR_ERROR("lsu_mon", `ERROR, "<T%0h> sbapp err asserted when none expected.", `SPC7.lsu_stberr_tid_g);
	end
    end

end  //}

	
always @ (posedge (`SPC7.l2clk & enabled & cmp_stb_err_inj))
begin
	stb_err_inj_d1 <= stb_err_inj;
	stb_err_inj_d2 <= stb_err_inj_d1;
	stb_err_tid_d1 <= err_tid;
	stb_err_tid_d2 <= stb_err_tid_d1;
	stb_err_index_d1 <= err_index;
	stb_err_index_d2 <= stb_err_index_d1;
	stb_err_priv_d1 <= err_priv;
	stb_err_priv_d2 <= stb_err_priv_d1;
end

`endif
`endif
`endif
endmodule

`endif
//----------------------------------------------------------
//----------------------------------------------------------





		
	
