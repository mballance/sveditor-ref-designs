// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_tasks.v
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
task assert_mdint;
input[2:0] id;
begin
    if(id==0) begin
      $display("assert_mdint id=0 time=%0d\n", $time);
      force tb_top.cpu.XAUI_MDINT0_L = 1'b0;
    end
    if(id==1) begin
      $display("assert_mdint id=1 time=%0d\n", $time);
      force tb_top.cpu.XAUI_MDINT1_L = 1'b0;
    end
end
endtask

task deassert_mdint;
input[2:0] id;
begin
    if(id==0) begin
      $display("deassert_mdint id=0 time=%0d\n", $time);
      release tb_top.cpu.XAUI_MDINT0_L;
    end
    if(id==1) begin
      $display("deassert_mdint id=1 time=%0d\n", $time);
      release tb_top.cpu.XAUI_MDINT1_L;
    end
end
endtask

task check_mdint_status;
input[2:0] id;
inout status;
begin
    if(id==0) begin
      $display("check_mdint_status=%0b id=0 time=%0d\n", tb_top.cpu.XAUI_MDINT0_L, $time);
      status=tb_top.cpu.XAUI_MDINT0_L;
    end
    if(id==1) begin
      $display("check_mdint_status=%0b id=1 time=%0d\n", tb_top.cpu.XAUI_MDINT1_L, $time);
      status=tb_top.cpu.XAUI_MDINT1_L;
    end
end
endtask


task force_rxc_cksum_be_partial;

begin
  `ifdef NIU_SYSTEMC_T2
  `else
  `ifdef NIU_GATE
  $display("ERROR: FORCE_rxc_cksum_be_partial not supported in NIU_GATES...yet\n");
  `else
  $display("FORCE_rxc_cksum_be_partial\n");
  force `RTX.rxc.ipp_top_0.ipp0.sum_unit_0.ipp_full_cksum = 1'h0;
  force `RTX.rxc.ipp_top_0.ipp1.sum_unit_0.ipp_full_cksum = 1'h0;
  `endif
  `endif // NIU_SYSTEMC_T2
end
endtask

task force_tcam_entry;
input [7:0] index;
input [199:0]  tcam_key;
begin

`ifdef NIU_SYSTEMC_T2
`else

`ifdef MAC_SAT
begin
end
`else // if not MAC_SAT
begin
//  $display("n2_niu_tb_top.v: force_tcam_entry(): FORCE_TCAM index = %h, data = %h", index, tcam_key);
  `ifdef NIU_GATE
  tb_top.cpu.rtx.rxc_niu_tcam_0_niu_scam0_cam_128x200_0.niu_tcam_ary0.mem_data[index] = tcam_key;
  `else
  tb_top.cpu.rtx.rxc.niu_tcam_0.niu_scam0.cam_128x200_0.niu_tcam_ary0.mem_data[index] = tcam_key;
  `endif
end
`endif // end for mac_sat/not

`endif // NIU_SYSTEMC_T2
end
endtask


task backdoor_init_tcam;
integer ii;
begin

`ifdef NIU_SYSTEMC_T2
`else

`ifdef MAC_SAT
begin
end
`else
begin
 // $display("n2_niu_tb_top.v: FORCE_TCAM keys to 0s and masks to 1s");
  `ifdef NIU_GATE
  for(ii=0;ii<128;ii=ii+1) begin
    tb_top.cpu.rtx.rxc_niu_tcam_0_niu_scam0_cam_128x200_0.niu_tcam_ary0.mem_data[ii] = {200{1'b0}};
    tb_top.cpu.rtx.rxc_niu_tcam_0_niu_scam0_cam_128x200_0.niu_tcam_ary0.mem_mask[ii] = {200{1'b1}};
  end
  `else
  for(ii=0;ii<128;ii=ii+1) begin
    tb_top.cpu.rtx.rxc.niu_tcam_0.niu_scam0.cam_128x200_0.niu_tcam_ary0.mem_data[ii] = {200{1'b0}};
    tb_top.cpu.rtx.rxc.niu_tcam_0.niu_scam0.cam_128x200_0.niu_tcam_ary0.mem_mask[ii] = {200{1'b1}};
  end
  `endif
end
`endif

`endif // NIU_SYSTEMC_T2
end
endtask

//  Added this task to slam Vlan table -MAQ

task force_vlan_tbl_entry;
input [15:0] mem_addr;
input [17:0]  mem_wr_data;

begin

`ifdef NIU_SYSTEMC_T2
  $display("force_vlan_tbl_entry is not supported in niu systemc model!");
`else

`ifdef NIU_GATE
  case(mem_addr[11:7])


  5'b0 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b16.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b14.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b12.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b10.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b8.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b6.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b4.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b2.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b0.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b1 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b16.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b14.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b12.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b10.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b8.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b6.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b4.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b2.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b0.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b10 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b16.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b14.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b12.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b10.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b8.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b6.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b4.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b2.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b0.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b11 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b16.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b14.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b12.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b10.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b8.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b6.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b4.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b2.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b0.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b100 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b16.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b14.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b12.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b10.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b8.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b6.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b4.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b2.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b0.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b101 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b16.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b14.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b12.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b10.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b8.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b6.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b4.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b2.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b0.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b110 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b16.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b14.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b12.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b10.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b8.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b6.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b4.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b2.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b0.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b111 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b16.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b14.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b12.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b10.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b8.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b6.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b4.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b2.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b0.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b1000 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b17.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b15.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b13.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b11.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b9.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b7.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b5.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b3.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b1.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b1001 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b17.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b15.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b13.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b11.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b9.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b7.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b5.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b3.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b1.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
    5'b1010 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b17.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b15.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b13.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b11.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b9.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b7.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b5.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b3.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b1.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b1011 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b17.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b15.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b13.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b11.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b9.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b7.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b5.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b3.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b1.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b1100 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b17.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b15.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b13.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b11.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b9.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b7.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b5.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b3.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b1.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b1101 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b17.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b15.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b13.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b11.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b9.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b7.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b5.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b3.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b1.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b1110 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b17.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b15.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b13.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b11.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b9.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b7.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b5.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b3.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b1.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b1111 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b17.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b15.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b13.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b11.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b9.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b7.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b5.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b3.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b1.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b10000 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b16.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b14.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b12.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b10.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b8.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b6.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b4.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b2.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b0.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b10001 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b16.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b14.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b12.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b10.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b8.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b6.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b4.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b2.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b0.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b10010 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b16.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b14.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b12.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b10.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b8.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b6.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b4.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b2.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b0.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b10011 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b16.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b14.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b12.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b10.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b8.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b6.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b4.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b2.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b0.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b10100 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b16.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b14.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b12.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b10.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b8.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b6.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b4.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b2.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b0.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b10101 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b16.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b14.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b12.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b10.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b8.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b6.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b4.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b2.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b0.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b10110 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b16.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b14.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b12.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b10.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b8.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b6.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b4.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b2.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b0.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b10111 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b16.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b14.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b12.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b10.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b8.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b6.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b4.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b2.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b0.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b11000 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b17.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b15.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b13.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b11.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b9.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b7.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b5.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b3.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b1.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b11001 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b17.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b15.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b13.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b11.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b9.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b7.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b5.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b3.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b1.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b11010 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b17.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b15.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b13.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b11.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b9.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b7.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b5.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b3.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b1.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b11011 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b17.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b15.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b13.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b11.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b9.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b7.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b5.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b3.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b1.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b11100 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b17.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b15.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b13.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b11.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b9.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b7.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b5.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b3.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b1.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b11101 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b17.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b15.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b13.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b11.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b9.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b7.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b5.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b3.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b1.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b11110 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b17.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b15.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b13.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b11.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b9.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b7.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b5.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b3.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b1.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b11111 : begin
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b17.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b15.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b13.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b11.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b9.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b7.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b5.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b3.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc_niu_ram_4096x9_0_ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b1.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  endcase

 `else
  case(mem_addr[11:7])


  5'b0 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b16.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b14.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b12.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b10.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b8.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b6.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b4.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b2.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b0.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b1 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b16.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b14.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b12.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b10.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b8.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b6.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b4.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b2.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b0.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b10 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b16.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b14.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b12.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b10.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b8.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b6.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b4.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b2.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b0.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b11 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b16.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b14.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b12.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b10.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b8.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b6.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b4.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b2.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b0.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b100 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b16.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b14.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b12.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b10.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b8.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b6.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b4.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b2.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b0.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b101 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b16.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b14.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b12.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b10.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b8.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b6.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b4.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b2.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b0.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b110 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b16.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b14.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b12.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b10.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b8.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b6.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b4.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b2.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b0.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b111 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b16.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b14.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b12.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b10.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b8.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b6.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b4.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b2.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b0.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b1000 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b17.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b15.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b13.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b11.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b9.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b7.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b5.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b3.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b1.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b1001 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b17.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b15.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b13.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b11.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b9.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b7.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b5.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b3.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b1.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
    5'b1010 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b17.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b15.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b13.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b11.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b9.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b7.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b5.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b3.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b1.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b1011 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b17.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b15.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b13.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b11.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b9.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b7.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b5.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b3.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b1.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b1100 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b17.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b15.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b13.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b11.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b9.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b7.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b5.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b3.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b1.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b1101 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b17.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b15.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b13.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b11.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b9.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b7.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b5.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b3.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b1.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b1110 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b17.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b15.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b13.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b11.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b9.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b7.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b5.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b3.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b1.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b1111 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b17.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b15.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b13.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b11.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b9.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b7.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b5.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b3.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_up.array_2k.b1.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b10000 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b16.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b14.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b12.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b10.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b8.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b6.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b4.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b2.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b0.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b10001 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b16.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b14.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b12.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b10.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b8.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b6.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b4.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b2.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b0.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b10010 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b16.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b14.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b12.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b10.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b8.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b6.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b4.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b2.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b0.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b10011 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b16.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b14.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b12.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b10.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b8.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b6.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b4.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b2.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b0.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b10100 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b16.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b14.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b12.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b10.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b8.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b6.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b4.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b2.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b0.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b10101 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b16.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b14.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b12.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b10.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b8.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b6.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b4.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b2.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b0.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b10110 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b16.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b14.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b12.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b10.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b8.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b6.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b4.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b2.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b0.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b10111 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b16.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b14.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b12.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b10.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b8.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b6.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b4.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b2.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b0.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b11000 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b17.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b15.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b13.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b11.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b9.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b7.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b5.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b3.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b1.mem.b0.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b11001 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b17.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b15.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b13.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b11.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b9.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b7.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b5.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b3.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b1.mem.b1.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b11010 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b17.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b15.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b13.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b11.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b9.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b7.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b5.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b3.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b1.mem.b2.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b11011 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b17.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b15.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b13.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b11.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b9.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b7.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b5.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b3.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b1.mem.b3.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b11100 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b17.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b15.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b13.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b11.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b9.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b7.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b5.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b3.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b1.mem.b4.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b11101 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b17.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b15.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b13.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b11.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b9.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b7.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b5.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b3.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b1.mem.b5.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b11110 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b17.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b15.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b13.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b11.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b9.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b7.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b5.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b3.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b1.mem.b6.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  5'b11111 : begin
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b17.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[8];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b15.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[7];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b13.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[6];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b11.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[5];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b9.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[4];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b7.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[3];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b5.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[2];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b3.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[1];
     tb_top.cpu.rtx.rxc.niu_ram_4096x9_0.ram_4096x9_0.niu_sp_4096x9s_bank.array_dn.array_2k.b1.mem.b7.mem[mem_addr[6:0]]=mem_wr_data[0];
  end
  endcase

`endif // GATESIM...else

`endif // NIU_SYSTEMC_T2

end

endtask

