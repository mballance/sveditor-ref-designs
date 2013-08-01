// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: vuaderr.v
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
module vuaderr(L2_INT_RST);

parameter PSMPL = 3;
parameter s0 = 0,s1 = 1;
input L2_INT_RST;

reg [39:0] address;
reg [38:0] vld_dirty, usaloc, buffer;
reg [8:0] index;
reg [3:0]bit_pos;
reg [39:0]cnt;
reg [1:0] cs,ns;
reg vd_inject_err,ua_inject_err,vd_inject_ue,ua_inject_ue,trph;
integer i;
wire [39:0] arbdp_addr_c1;
wire [6:0] vd_ecc_c1,ua_ecc_c1;
wire [15:0] valid_c1,dirty_c1,used_c1,alloc_c1;
wire inst_vld_c2_prev,vuad_vlddir_no_bypass_c1,vuad_usaloc_no_bypass_c1,arb_inst_diag_c1;
wire take_eer,take_retry;

assign arbdp_addr_c1 = tb_top.cpu.l2t0.arbadr.arbdp_addr_c1_1;
assign inst_vld_c2_prev = tb_top.cpu.l2t0.arb.inst_vld_c2_prev;
assign vuad_vlddir_no_bypass_c1=tb_top.cpu.l2t0.vlddir.mux_valid_dirty_c1_sel0;
assign arb_inst_diag_c1 = tb_top.cpu.l2t0.arb.arb_inst_diag_c1;
assign vd_ecc_c1 = tb_top.cpu.l2t0.vlddir.vuad_array_rd_data_c1[38:32];
assign valid_c1 = tb_top.cpu.l2t0.vlddir.valid_c1;
assign dirty_c1 = tb_top.cpu.l2t0.vlddir.dirty_c1;
assign vuad_usaloc_no_bypass_c1 = tb_top.cpu.l2t0.usaloc.vuad_usaloc_mux_used_and_alloc_comb_sel5;
assign ua_ecc_c1 = tb_top.cpu.l2t0.usaloc.vuad_array_rd_data_c1[77:71];
assign used_c1 = tb_top.cpu.l2t0.usaloc.used_c1;
assign alloc_c1 = tb_top.cpu.l2t0.usaloc.alloc_c1;

assign take_retry = tb_top.cpu.spc0.tlu.trl0.take_ret;
assign take_eer   = tb_top.cpu.spc0.tlu.trl0.take_eer; // For Hw Corr

initial begin
  if($test$plusargs("PREFICE_VD_INJECT"))
  begin
    $display("MSA1: forcing_err\n");
    @(posedge tb_top.cpu.l2t0.arbdec.pf_ice_qual);
    $display("MSA2: forcing_err\n");
    @(posedge tb_top.cpu.l2t0.arbdec.pf_ice_qual);
    $display("MSA3: forcing_err\n");
    @(posedge tb_top.cpu.l2t0.arbdec.pf_ice_qual);
    @(posedge tb_top.cpu.l2t0.arbdec.pf_ice_qual);
    @(posedge tb_top.cpu.l2t0.arbdec.pf_ice_qual);
    $display("BAS: force the valid bits\n");
    @(posedge tb_top.cpu.l2clk);
    $display("BAS: force the valid bits\n");
    force tb_top.cpu.l2t0.vlddir.valid_c2[15:0] = 16'h0000;
    force tb_top.cpu.l2t0.vlddir.vlddir_vuad_valid_c2[15:0] = 16'h0000;
    @(posedge tb_top.cpu.l2clk);
    release tb_top.cpu.l2t0.vlddir.valid_c2[15:0];
    @(negedge tb_top.cpu.l2clk);
    release tb_top.cpu.l2t0.vlddir.vlddir_vuad_valid_c2[15:0];
    $display("BAS: release the valid bits\n");
  end
end

initial
begin
//=================================
// Initialize the variables used in here
//=================================

     vd_inject_err = 0;
     ua_inject_err = 0;
     vd_inject_ue = 0;
     ua_inject_ue = 0;
     trph = 0;
     i = 0;
     bit_pos = 2;

//=========================================
// Check if forcing variables are changed by verargs
//=========================================

if($test$plusargs("L2VD_CE_ERR_INJECT"))
  begin
     vd_inject_err = 1;
    `PR_ALWAYS("l2err_injector", `ALWAYS, "L2 VD Err injector enabled");
  end
else if($test$plusargs("L2UA_CE_ERR_INJECT"))
  begin
     ua_inject_err = 1;
    `PR_ALWAYS("l2err_injector", `ALWAYS, "L2 UA Err injector enabled");
  end

if($test$plusargs("L2VD_UE_INJECT"))
  begin
     vd_inject_ue = 1;
    `PR_ALWAYS("l2err_injector", `ALWAYS, "L2 VD Err injector enabled");
  end
else if($test$plusargs("L2UA_UE_INJECT"))
  begin
     ua_inject_ue = 1;
    `PR_ALWAYS("l2err_injector", `ALWAYS, "L2 UA Err injector enabled");
  end


end

/*
always @(posedge tb_top.cpu.l2clk)
begin
  if(`TOP.gOutOfBoot[63:0] === `TOP.verif_args.finish_mask[63:0] )
  begin
     if(bit_pos == 4'b1111)
        bit_pos <= 2;
     else
       bit_pos <= bit_pos + 1;
  end
end */

//Sequential part of stmc...
//To not inject in traphandler
always @(posedge tb_top.cpu.l2clk)
begin
if(ua_inject_ue || vd_inject_ue || vd_inject_err || ua_inject_err)
begin    
 if(!L2_INT_RST) cs <= s0;
 else cs <= ns; 
end
end    

//combo logic
always @(s0 or s1 or take_eer or take_retry or cs or ua_inject_ue or vd_inject_ue or vd_inject_err or ua_inject_err)
begin
trph <= 0;    
if(ua_inject_ue || vd_inject_ue || vd_inject_err || ua_inject_err)
begin
 case(cs)       
  s0:           
    begin
     if ( take_eer == 0) ns <= s0;
     else if (take_eer == 1) begin ns <= s1; trph<= 1;end
    end
  s1:
   begin
    if (take_retry == 0)begin  ns <= s1; trph <= 1; end
    else if (take_retry == 1) begin ns <= s0;trph<=0;end 
   end
  endcase       
//$display("In Combo Logic take_retry=%d,take_eer=%d,trph=%d,ns=%d",take_retry,take_eer,trph,ns);
end
end //end combo logic   

always @(posedge tb_top.cpu.l2clk)
begin

if(!L2_INT_RST)
begin
bit_pos <= 2;
end
else
begin
i<=0;
if((`TOP.gOutOfBoot[63:0] === `TOP.verif_args.finish_mask[63:0]) && ( vd_inject_err == 1 || vd_inject_ue == 1) && !trph)
begin

      #(PSMPL)
//$display("Before if inst_vld_c2_prev=%d,vuad_vlddir_no_bypass_c1=%d,arb_inst_diag_c1=%d, bit_pos = %b",inst_vld_c2_prev,vuad_vlddir_no_bypass_c1,arb_inst_diag_c1,bit_pos);


      if(inst_vld_c2_prev && vuad_vlddir_no_bypass_c1 && !arb_inst_diag_c1 && bit_pos[3] != 1)


	begin

//$display("After if inst_vld_c2_prev=%d,vuad_vlddir_no_bypass_c1=%d,arb_inst_diag_c1=%d",inst_vld_c2_prev,vuad_vlddir_no_bypass_c1,arb_inst_diag_c1);
           address <= arbdp_addr_c1; // C1 signal
       	    if($test$plusargs("L2PM_fourbank"))
			index = address[16:8];
	    else if($test$plusargs("L2PM_twobank"))
           		index <= address[15:7];
	    else	index <= address[17:9];

           vld_dirty= {vd_ecc_c1,valid_c1,dirty_c1};
           cnt <= ({$random(`PARGS.seed)} % 39);
//$display("address=%h,index=%h,vld_dirty=%d,i=%d",address,index,vld_dirty,i);
           vld_dirty[cnt] <= vld_dirty[cnt] ^ 1'b1;
	   if(vd_inject_ue) vld_dirty[cnt+1] <= vld_dirty[cnt+1] ^ 1'b1;
           @(posedge tb_top.cpu.l2clk);
           #(PSMPL)
           SetVldDirtyVuadArrayC2(i, vld_dirty);
   	   if(vd_inject_err) `PR_ALWAYS("l2err_injector", `ALWAYS,"VUAD CE injected (VD) in bank%d, Index%d, bit%dflipped (address = %x)\n\n", i, index, cnt, address);
           else `PR_ALWAYS("l2err_injector", `ALWAYS,"VUAD UE injected (VD) in bank%d, Index%d, bit%dflipped (address = %x)\n\n", i, index, cnt, address); 
           @(posedge tb_top.cpu.l2clk);
	   #(PSMPL)
           ReleaseVldDirtyVuadArrayC2(i);

        end // if(inst_vld_c2_prev && vuad_vlddir_no_bypass_c1 && !arb_inst_diag_c1)
      bit_pos <= bit_pos + 1;
      @(posedge tb_top.cpu.l2clk);
  end // OutOf Boot

end //else of if(!L2_INT_RST)

end //always @(posedge tb_top.cpu.l2clk)



/*** end of VD error injection**/

/*** Start of UA error injection**/

always @(posedge tb_top.cpu.l2clk)
begin

if(!L2_INT_RST)
begin
end
else
begin
i = 0;
if((`TOP.gOutOfBoot[63:0] === `TOP.verif_args.finish_mask[63:0] ) && ( ua_inject_err == 1 || ua_inject_ue == 1) && !trph)
begin

      #(PSMPL)

                  //if(.$array_rd_en){ // This is a PX2 signal
                  //repeat(2)@(posedge tb_top.cpu.l2clk);
                  if(inst_vld_c2_prev && vuad_usaloc_no_bypass_c1 && !arb_inst_diag_c1 && bit_pos[3] != 1)
		  begin

                     	address = arbdp_addr_c1; // C1 signal
	             if($test$plusargs("L2PM_fourbank"))
                        index = address[16:8];
       		     else if($test$plusargs("L2PM_twobank"))
                        index <= address[15:7];
	             else        index <= address[17:9];


                     	usaloc = {ua_ecc_c1, used_c1, alloc_c1};
                     	cnt =({$random(`PARGS.seed)} % 39);
                     	usaloc[cnt] = usaloc[cnt] ^ 1'b1;
                     	if(ua_inject_ue) usaloc[cnt+1] = usaloc[cnt+1] ^ 1'b1;
                     	@(posedge tb_top.cpu.l2clk);
			   #(PSMPL)
                     	SetUsAlocVuadArrayC2(i, usaloc);
			if(ua_inject_err) `PR_ALWAYS("l2err_injector", `ALWAYS,"VUAD CE injected (UA) in Bank 0, Index%d, bit%d flipped (address = %x)\n\n",  index, cnt, address);
			else `PR_ALWAYS("l2err_injector", `ALWAYS,"VUAD UE injected (UA) in Bank 0, Index%d, bit%d flipped (address = %x)\n\n",  index, cnt, address);
                     	@(posedge tb_top.cpu.l2clk);
			   #(PSMPL)
                     	ReleaseUsalocVuadArrayC2(i);
                     	buffer[cnt] = buffer[cnt] ^ 1'b1;

                 end //if(inst_vld_c2_prev && vuad_usaloc_no_bypass_c1 && !arb_inst_diag_c1)
        @(posedge tb_top.cpu.l2clk);
end //OutOfBOOT
end ////else of if(!L2_INT_RST)

end  //always @(posedge tb_top.cpu.l2clk)
                

//Tasks Used By Error Injector

task SetVldDirtyVuadArrayC2;
input bank;
input [38:0] value;
integer bank;
reg [38:0] value;
begin
    case (bank)
    0: begin
          force tb_top.cpu.l2t0.vlddir.vd_ecc_c2[6:0] = value[38:32];
          force tb_top.cpu.l2t0.vlddir.valid_c2[15:0] = value[31:16];
          force tb_top.cpu.l2t0.vlddir.dirty_c2[15:0] = value[15:0];
       end
    1: begin
          force tb_top.cpu.l2t1.vlddir.vd_ecc_c2[6:0] = value[38:32];
          force tb_top.cpu.l2t1.vlddir.valid_c2[15:0] = value[31:16];
          force tb_top.cpu.l2t1.vlddir.dirty_c2[15:0] = value[15:0];
       end
    2: begin
          force tb_top.cpu.l2t2.vlddir.vd_ecc_c2[6:0] = value[38:32];
          force tb_top.cpu.l2t2.vlddir.valid_c2[15:0] = value[31:16];
          force tb_top.cpu.l2t2.vlddir.dirty_c2[15:0] = value[15:0];
       end
    3: begin
          force tb_top.cpu.l2t3.vlddir.vd_ecc_c2[6:0] = value[38:32];
          force tb_top.cpu.l2t3.vlddir.valid_c2[15:0] = value[31:16];
          force tb_top.cpu.l2t3.vlddir.dirty_c2[15:0] = value[15:0];
       end
    4: begin
          force tb_top.cpu.l2t4.vlddir.vd_ecc_c2[6:0] = value[38:32];
          force tb_top.cpu.l2t4.vlddir.valid_c2[15:0] = value[31:16];
          force tb_top.cpu.l2t4.vlddir.dirty_c2[15:0] = value[15:0];
       end
    5: begin
          force tb_top.cpu.l2t5.vlddir.vd_ecc_c2[6:0] = value[38:32];
          force tb_top.cpu.l2t5.vlddir.valid_c2[15:0] = value[31:16];
          force tb_top.cpu.l2t5.vlddir.dirty_c2[15:0] = value[15:0];
       end
    6: begin
          force tb_top.cpu.l2t6.vlddir.vd_ecc_c2[6:0] = value[38:32];
          force tb_top.cpu.l2t6.vlddir.valid_c2[15:0] = value[31:16];
          force tb_top.cpu.l2t6.vlddir.dirty_c2[15:0] = value[15:0];
       end
    7: begin
          force tb_top.cpu.l2t7.vlddir.vd_ecc_c2[6:0] = value[38:32];
          force tb_top.cpu.l2t7.vlddir.valid_c2[15:0] = value[31:16];
          force tb_top.cpu.l2t7.vlddir.dirty_c2[15:0] = value[15:0];
       end
    endcase
//    force tb_top.force_vd = 1'b1;
end
endtask

task ReleaseVldDirtyVuadArrayC2;
input bank;
integer bank;
begin
    case (bank)
    0: begin
          release tb_top.cpu.l2t0.vlddir.vd_ecc_c2[6:0];
          release tb_top.cpu.l2t0.vlddir.valid_c2[15:0];
          release tb_top.cpu.l2t0.vlddir.dirty_c2[15:0];
       end
    1: begin
          release tb_top.cpu.l2t1.vlddir.vd_ecc_c2[6:0];
          release tb_top.cpu.l2t1.vlddir.valid_c2[15:0];
          release tb_top.cpu.l2t1.vlddir.dirty_c2[15:0];
       end
    2: begin
          release tb_top.cpu.l2t2.vlddir.vd_ecc_c2[6:0];
          release tb_top.cpu.l2t2.vlddir.valid_c2[15:0];
          release tb_top.cpu.l2t2.vlddir.dirty_c2[15:0];
       end
    3: begin
          release tb_top.cpu.l2t3.vlddir.vd_ecc_c2[6:0];
          release tb_top.cpu.l2t3.vlddir.valid_c2[15:0];
          release tb_top.cpu.l2t3.vlddir.dirty_c2[15:0];
       end
    4: begin
          release tb_top.cpu.l2t4.vlddir.vd_ecc_c2[6:0];
          release tb_top.cpu.l2t4.vlddir.valid_c2[15:0];
          release tb_top.cpu.l2t4.vlddir.dirty_c2[15:0];
       end
    5: begin
          release tb_top.cpu.l2t5.vlddir.vd_ecc_c2[6:0];
          release tb_top.cpu.l2t5.vlddir.valid_c2[15:0];
          release tb_top.cpu.l2t5.vlddir.dirty_c2[15:0];
       end
    6: begin
          release tb_top.cpu.l2t6.vlddir.vd_ecc_c2[6:0];
          release tb_top.cpu.l2t6.vlddir.valid_c2[15:0];
          release tb_top.cpu.l2t6.vlddir.dirty_c2[15:0];
       end
    7: begin
          release tb_top.cpu.l2t7.vlddir.vd_ecc_c2[6:0];
          release tb_top.cpu.l2t7.vlddir.valid_c2[15:0];
          release tb_top.cpu.l2t7.vlddir.dirty_c2[15:0];
       end
    endcase
 //   force tb_top.force_vd = 1'b0;
end
endtask


task SetUsAlocVuadArrayC2;
input bank;
input value;
integer bank;
reg [38:0] value;
begin
    case (bank)
    0: begin
          force tb_top.cpu.l2t0.usaloc.ua_ecc_c2[6:0] = value[38:32];
          force tb_top.cpu.l2t0.usaloc.used_c2[15:0] = value[31:16];
          force tb_top.cpu.l2t0.usaloc.alloc_c2[15:0] = value[15:0];
       end
    1:  begin
          force tb_top.cpu.l2t1.usaloc.ua_ecc_c2[6:0] = value[38:32];
          force tb_top.cpu.l2t1.usaloc.used_c2[15:0] = value[31:16];
          force tb_top.cpu.l2t1.usaloc.alloc_c2[15:0] = value[15:0];
       end
    2:  begin
          force tb_top.cpu.l2t2.usaloc.ua_ecc_c2[6:0] = value[38:32];
          force tb_top.cpu.l2t2.usaloc.used_c2[15:0] = value[31:16];
          force tb_top.cpu.l2t2.usaloc.alloc_c2[15:0] = value[15:0];
       end
    3:  begin
          force tb_top.cpu.l2t3.usaloc.ua_ecc_c2[6:0] = value[38:32];
          force tb_top.cpu.l2t3.usaloc.used_c2[15:0] = value[31:16];
          force tb_top.cpu.l2t3.usaloc.alloc_c2[15:0] = value[15:0];
       end
    4:  begin
          force tb_top.cpu.l2t4.usaloc.ua_ecc_c2[6:0] = value[38:32];
          force tb_top.cpu.l2t4.usaloc.used_c2[15:0] = value[31:16];
          force tb_top.cpu.l2t4.usaloc.alloc_c2[15:0] = value[15:0];
       end
    5:  begin
          force tb_top.cpu.l2t5.usaloc.ua_ecc_c2[6:0] = value[38:32];
          force tb_top.cpu.l2t5.usaloc.used_c2[15:0] = value[31:16];
          force tb_top.cpu.l2t5.usaloc.alloc_c2[15:0] = value[15:0];
       end
    6:  begin
          force tb_top.cpu.l2t6.usaloc.ua_ecc_c2[6:0] = value[38:32];
          force tb_top.cpu.l2t6.usaloc.used_c2[15:0] = value[31:16];
          force tb_top.cpu.l2t6.usaloc.alloc_c2[15:0] = value[15:0];
       end
    7:  begin
          force tb_top.cpu.l2t7.usaloc.ua_ecc_c2[6:0] = value[38:32];
          force tb_top.cpu.l2t7.usaloc.used_c2[15:0] = value[31:16];
          force tb_top.cpu.l2t7.usaloc.alloc_c2[15:0] = value[15:0];
       end
    endcase
   // force tb_top.force_ua = 1'b1;
end
endtask


task ReleaseUsalocVuadArrayC2;
input bank;
integer bank;
begin
    case (bank)
    0: begin
        release tb_top.cpu.l2t0.usaloc.ua_ecc_c2[6:0];
        release tb_top.cpu.l2t0.usaloc.used_c2[15:0];
        release tb_top.cpu.l2t0.usaloc.alloc_c2[15:0];
       end
    1: begin
        release tb_top.cpu.l2t1.usaloc.ua_ecc_c2[6:0];
        release tb_top.cpu.l2t1.usaloc.used_c2[15:0];
        release tb_top.cpu.l2t1.usaloc.alloc_c2[15:0];
       end
    2: begin
        release tb_top.cpu.l2t2.usaloc.ua_ecc_c2[6:0];
        release tb_top.cpu.l2t2.usaloc.used_c2[15:0];
        release tb_top.cpu.l2t2.usaloc.alloc_c2[15:0];
       end
    3: begin
        release tb_top.cpu.l2t3.usaloc.ua_ecc_c2[6:0];
        release tb_top.cpu.l2t3.usaloc.used_c2[15:0];
        release tb_top.cpu.l2t3.usaloc.alloc_c2[15:0];
       end
    4: begin
        release tb_top.cpu.l2t4.usaloc.ua_ecc_c2[6:0];
        release tb_top.cpu.l2t4.usaloc.used_c2[15:0];
        release tb_top.cpu.l2t4.usaloc.alloc_c2[15:0];
       end
    5: begin
        release tb_top.cpu.l2t5.usaloc.ua_ecc_c2[6:0];
        release tb_top.cpu.l2t5.usaloc.used_c2[15:0];
        release tb_top.cpu.l2t5.usaloc.alloc_c2[15:0];
       end
    6: begin
        release tb_top.cpu.l2t6.usaloc.ua_ecc_c2[6:0];
        release tb_top.cpu.l2t6.usaloc.used_c2[15:0];
        release tb_top.cpu.l2t6.usaloc.alloc_c2[15:0];
       end
    7: begin
        release tb_top.cpu.l2t7.usaloc.ua_ecc_c2[6:0];
        release tb_top.cpu.l2t7.usaloc.used_c2[15:0];
        release tb_top.cpu.l2t7.usaloc.alloc_c2[15:0];
       end
    endcase
end
endtask



endmodule
