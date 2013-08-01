// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fc_mcu_csr_probe.v
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
`include "fc.vh"
`include "defines.vh"


module fc_mcu_csr_probe;

wire   [39:0] mcu0_ucb_addr;
wire   [63:0] mcu0_ucb_data;

assign mcu0_ucb_rd_vld       = `CPU.mcu0.ucb.ucb_rd_req_vld0;
assign mcu0_ucb_rd_accepted  = `CPU.mcu0.ucb.mcu_ucb_req_acpted;
assign mcu0_ucb_ack_vld      = `CPU.mcu0.ucb.mcu_ucb_ack_vld;
assign mcu0_ucb_nack_vld     = `CPU.mcu0.ucb.mcu_ucb_nack_vld;
assign mcu0_ucb_addr         = `CPU.mcu0.ucb.addr_in;
assign mcu0_ucb_data         = `CPU.mcu0.ucb.mcu_ucb_data;
assign mcu0_iol2clk          = `CPU.mcu0.ucb.iol2clk;





mcu_csr_probe mcu0_csr_probe ( .mcu_id(2'b00), .ucb_rd_vld(mcu0_ucb_rd_vld), .ucb_rd_accepted(mcu0_ucb_rd_accepted), .ucb_ack_vld(mcu0_ucb_ack_vld), .ucb_nack_vld(mcu0_ucb_nack_vld), .ucb_addr(mcu0_ucb_addr), .ucb_data(mcu0_ucb_data), .mcu_clk(mcu0_iol2clk));

wire   [39:0] mcu1_ucb_addr;
wire   [63:0] mcu1_ucb_data;

assign mcu1_ucb_rd_vld       = `CPU.mcu1.ucb.ucb_rd_req_vld0;
assign mcu1_ucb_rd_accepted  = `CPU.mcu1.ucb.mcu_ucb_req_acpted;
assign mcu1_ucb_ack_vld      = `CPU.mcu1.ucb.mcu_ucb_ack_vld;
assign mcu1_ucb_nack_vld     = `CPU.mcu1.ucb.mcu_ucb_nack_vld;
assign mcu1_ucb_addr         = `CPU.mcu1.ucb.addr_in;
assign mcu1_ucb_data         = `CPU.mcu1.ucb.mcu_ucb_data;
assign mcu1_iol2clk          = `CPU.mcu1.ucb.iol2clk;


mcu_csr_probe mcu1_csr_probe ( .mcu_id(2'b00), .ucb_rd_vld(mcu1_ucb_rd_vld), .ucb_rd_accepted(mcu1_ucb_rd_accepted), .ucb_ack_vld(mcu1_ucb_ack_vld), .ucb_nack_vld(mcu1_ucb_nack_vld), .ucb_addr(mcu1_ucb_addr), .ucb_data(mcu1_ucb_data), .mcu_clk(mcu1_iol2clk));

wire   [39:0] mcu2_ucb_addr;
wire   [63:0] mcu2_ucb_data;

assign mcu2_ucb_rd_vld       = `CPU.mcu2.ucb.ucb_rd_req_vld0;
assign mcu2_ucb_rd_accepted  = `CPU.mcu2.ucb.mcu_ucb_req_acpted;
assign mcu2_ucb_ack_vld      = `CPU.mcu2.ucb.mcu_ucb_ack_vld;
assign mcu2_ucb_nack_vld     = `CPU.mcu2.ucb.mcu_ucb_nack_vld;
assign mcu2_ucb_addr         = `CPU.mcu2.ucb.addr_in;
assign mcu2_ucb_data         = `CPU.mcu2.ucb.mcu_ucb_data;
assign mcu2_iol2clk          = `CPU.mcu2.ucb.iol2clk;


mcu_csr_probe mcu2_csr_probe ( .mcu_id(2'b00), .ucb_rd_vld(mcu2_ucb_rd_vld), .ucb_rd_accepted(mcu2_ucb_rd_accepted), .ucb_ack_vld(mcu2_ucb_ack_vld), .ucb_nack_vld(mcu2_ucb_nack_vld), .ucb_addr(mcu2_ucb_addr), .ucb_data(mcu2_ucb_data), .mcu_clk(mcu2_iol2clk));

wire   [39:0] mcu3_ucb_addr;
wire   [63:0] mcu3_ucb_data;

assign mcu3_ucb_rd_vld       = `CPU.mcu3.ucb.ucb_rd_req_vld0;
assign mcu3_ucb_rd_accepted  = `CPU.mcu3.ucb.mcu_ucb_req_acpted;
assign mcu3_ucb_ack_vld      = `CPU.mcu3.ucb.mcu_ucb_ack_vld;
assign mcu3_ucb_nack_vld     = `CPU.mcu3.ucb.mcu_ucb_nack_vld;
assign mcu3_ucb_addr         = `CPU.mcu3.ucb.addr_in;
assign mcu3_ucb_data         = `CPU.mcu3.ucb.mcu_ucb_data;
assign mcu3_iol2clk          = `CPU.mcu3.ucb.iol2clk;


mcu_csr_probe mcu3_csr_probe ( .mcu_id(2'b00), .ucb_rd_vld(mcu3_ucb_rd_vld), .ucb_rd_accepted(mcu3_ucb_rd_accepted), .ucb_ack_vld(mcu3_ucb_ack_vld), .ucb_nack_vld(mcu3_ucb_nack_vld), .ucb_addr(mcu3_ucb_addr), .ucb_data(mcu3_ucb_data), .mcu_clk(mcu3_iol2clk));

endmodule 


module mcu_csr_probe ( mcu_id, ucb_rd_vld, ucb_ack_vld, ucb_rd_accepted, ucb_nack_vld, ucb_addr, ucb_data, mcu_clk);

input [1:0]  mcu_id;
input        ucb_rd_vld;
input        ucb_rd_accepted;
input        ucb_ack_vld;
input        ucb_nack_vld;
input [39:0] ucb_addr;
input [63:0] ucb_data;
input        mcu_clk;

reg   [63:0] ucb_addr_reg;
reg   [63:0] ucb_data_reg;

integer      mcu_csr;

reg   [1:0]  state;

parameter IDLE = 0, ADDR = 1, DATA = 2;

//Detected esr/ear etc

assign   d_esr_det          = ((ucb_addr[39:32] == 8'h84) & (ucb_addr[11:0] == 12'h280));
assign   d_ear_det          = ((ucb_addr[39:32] == 8'h84) & (ucb_addr[11:0] == 12'h288));
assign   d_eir_det          = ((ucb_addr[39:32] == 8'h84) & (ucb_addr[11:0] == 12'h290));
assign   d_ecr_det          = ((ucb_addr[39:32] == 8'h84) & (ucb_addr[11:0] == 12'h298));
assign   d_elr_det          = ((ucb_addr[39:32] == 8'h84) & (ucb_addr[11:0] == 12'h2a0));
assign   d_err_det          = ((ucb_addr[39:32] == 8'h84) & (ucb_addr[11:0] == 12'h2a8));
assign   d_chan_reset       = ((ucb_addr[39:32] == 8'h84) & (ucb_addr[11:0] == 12'h810));
assign   d_fbd_err_syndrome = ((ucb_addr[39:32] == 8'h84) & (ucb_addr[11:0] == 12'hc00));
assign   d_fbd_inj_err      = ((ucb_addr[39:32] == 8'h84) & (ucb_addr[11:0] == 12'hc00));
assign   d_fbr_count_reg    = ((ucb_addr[39:32] == 8'h84) & (ucb_addr[11:0] == 12'hc10));

assign   error_reg_det      = (d_esr_det | d_ear_det | d_eir_det | d_ecr_det | d_elr_det | d_err_det |
                               d_chan_reset | d_fbd_err_syndrome | d_fbd_inj_err | d_fbr_count_reg);


always @(negedge mcu_clk) begin
   case(state)
     IDLE:
       if (ucb_rd_accepted & ucb_rd_vld & error_reg_det) begin
          state        =  ADDR;
          ucb_addr_reg =  {24'b0,ucb_addr};
       end
     ADDR:
       if (ucb_ack_vld | ucb_nack_vld) begin
          ucb_data_reg = ucb_data;
          $display("addr = %x  data = %x\n", ucb_addr_reg, ucb_data_reg);
          `PR_INFO ("mcu_csr_probe", `INFO, "ts=%0d MCU CSR READ RETURN:  address %x  data %x ",
          		       `TOP.core_cycle_cnt-1, ucb_addr_reg, ucb_data_reg);
          if (`PARGS.nas_check_on ) 
      			mcu_csr = $sim_send(`PLI_CSR_READ, ucb_addr_reg, ucb_data_reg, 8'h00);
          state       = IDLE; 
       end
     default:
          state       = IDLE;
    endcase
end


endmodule
