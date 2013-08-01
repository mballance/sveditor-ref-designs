// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fc_l2_csr_probe.v
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
`include "ccx.vri"
`include "cmp.vri"



`define NIU_UCB `CPU.rdp.niu_pio_ucb
`define NIU_PIO `CPU.rdp.niu_pio

`timescale 1 ps/ 1 ps

module fc_l2_csr_probe;
//connect wires
wire          l20_arbdp_inst_diag_c2;
wire          l20_arbdp_inst_load_c2;
wire   [39:0] l20_arbdp_addr_c2;
wire   [63:0] l20_csr_rd_data_c8;
wire   [63:0] l20_tmp_inval_data_c7;

wire          l21_arbdp_inst_diag_c2;
wire          l21_arbdp_inst_load_c2;
wire   [39:0] l21_arbdp_addr_c2;
wire   [63:0] l21_csr_rd_data_c8;
wire   [63:0] l21_tmp_inval_data_c7;


wire          l22_arbdp_inst_diag_c2;
wire          l22_arbdp_inst_load_c2;
wire   [39:0] l22_arbdp_addr_c2;
wire   [63:0] l22_csr_rd_data_c8;
wire   [63:0] l22_tmp_inval_data_c7;


wire          l23_arbdp_inst_diag_c2;
wire          l23_arbdp_inst_load_c2;
wire   [39:0] l23_arbdp_addr_c2;
wire   [63:0] l23_csr_rd_data_c8;
wire   [63:0] l23_tmp_inval_data_c7;


wire          l24_arbdp_inst_diag_c2;
wire          l24_arbdp_inst_load_c2;
wire   [39:0] l24_arbdp_addr_c2;
wire   [63:0] l24_csr_rd_data_c8;
wire   [63:0] l24_tmp_inval_data_c7;


wire          l25_arbdp_inst_diag_c2;
wire          l25_arbdp_inst_load_c2;
wire   [39:0] l25_arbdp_addr_c2;
wire   [63:0] l25_csr_rd_data_c8;
wire   [63:0] l25_tmp_inval_data_c7;


wire          l26_arbdp_inst_diag_c2;
wire          l26_arbdp_inst_load_c2;
wire   [39:0] l26_arbdp_addr_c2;
wire   [63:0] l26_csr_rd_data_c8;
wire   [63:0] l26_tmp_inval_data_c7;


wire          l27_arbdp_inst_diag_c2;
wire          l27_arbdp_inst_load_c2;
wire   [39:0] l27_arbdp_addr_c2;
wire   [63:0] l27_csr_rd_data_c8;
wire   [63:0] l27_tmp_inval_data_c7;

wire l20_ld_c2, l21_ld_c2, l22_ld_c2, l23_ld_c2;
wire l24_ld_c2, l25_ld_c2, l26_ld_c2, l27_ld_c2;

assign l20_arbdp_addr_c2        = `CPU.l2t0.arbadr.arbdp_addr_c2;
assign l20_arb_decdp_ld_inst_c2 = `CPU.l2t0.arb.arb_csr_rd_en_c2;
assign l20_csr_rd_data_c8       = `CPU.l2t0.csr_rd_data_c8;
assign l20_arbdp_inst_diag_c2   = `CPU.l2t0.arb.arb_inst_diag_c2;
assign l20_tmp_inval_data_c7    = `CPU.l2t0.oque.tmp_inval_data_c7;
assign l20_ld_c2                = `CPU.l2t0.arb.arb_decdp_ld_inst_c2;
assign #1 l20_clk               = `CPU.l2t0.gclk;

assign l21_arbdp_addr_c2        = `CPU.l2t1.arbadr.arbdp_addr_c2;
assign l21_arb_decdp_ld_inst_c2 = `CPU.l2t1.arb.arb_csr_rd_en_c2;
assign l21_csr_rd_data_c8       = `CPU.l2t1.csr_rd_data_c8;
assign l21_arbdp_inst_diag_c2   = `CPU.l2t1.arb.arb_inst_diag_c2;
assign l21_tmp_inval_data_c7    = `CPU.l2t1.oque.tmp_inval_data_c7;
assign l21_ld_c2                = `CPU.l2t1.arb.arb_decdp_ld_inst_c2;
assign #1 l21_clk               = `CPU.l2t1.gclk;


assign l22_arbdp_addr_c2        = `CPU.l2t2.arbadr.arbdp_addr_c2;
assign l22_arb_decdp_ld_inst_c2 = `CPU.l2t2.arb.arb_csr_rd_en_c2;
assign l22_csr_rd_data_c8       = `CPU.l2t2.csr_rd_data_c8;
assign l22_arbdp_inst_diag_c2   = `CPU.l2t2.arb.arb_inst_diag_c2;
assign l22_tmp_inval_data_c7    = `CPU.l2t2.oque.tmp_inval_data_c7;
assign l22_ld_c2                = `CPU.l2t2.arb.arb_decdp_ld_inst_c2;
assign #1 l22_clk                  = `CPU.l2t2.gclk;

assign l23_arbdp_addr_c2        = `CPU.l2t3.arbadr.arbdp_addr_c2;
assign l23_arb_decdp_ld_inst_c2 = `CPU.l2t3.arb.arb_csr_rd_en_c2;
assign l23_csr_rd_data_c8       = `CPU.l2t3.csr_rd_data_c8;
assign l23_arbdp_inst_diag_c2   = `CPU.l2t3.arb.arb_inst_diag_c2;
assign l23_tmp_inval_data_c7    = `CPU.l2t3.oque.tmp_inval_data_c7;
assign l23_ld_c2                = `CPU.l2t3.arb.arb_decdp_ld_inst_c2;
assign #1 l23_clk                  = `CPU.l2t3.gclk;

assign l24_arbdp_addr_c2        = `CPU.l2t4.arbadr.arbdp_addr_c2;
assign l24_arb_decdp_ld_inst_c2 = `CPU.l2t4.arb.arb_csr_rd_en_c2;
assign l24_csr_rd_data_c8       = `CPU.l2t4.csr_rd_data_c8;
assign l24_arbdp_inst_diag_c2   = `CPU.l2t4.arb.arb_inst_diag_c2;
assign l24_tmp_inval_data_c7    = `CPU.l2t4.oque.tmp_inval_data_c7;
assign l24_ld_c2                = `CPU.l2t4.arb.arb_decdp_ld_inst_c2;
assign #1 l24_clk                  = `CPU.l2t4.gclk;


assign l25_arbdp_addr_c2        = `CPU.l2t5.arbadr.arbdp_addr_c2;
assign l25_arb_decdp_ld_inst_c2 = `CPU.l2t5.arb.arb_csr_rd_en_c2;
assign l25_csr_rd_data_c8       = `CPU.l2t5.csr_rd_data_c8;
assign l25_arbdp_inst_diag_c2   = `CPU.l2t5.arb.arb_inst_diag_c2;
assign l25_tmp_inval_data_c7    = `CPU.l2t5.oque.tmp_inval_data_c7;
assign l25_ld_c2                = `CPU.l2t5.arb.arb_decdp_ld_inst_c2;
assign #1 l25_clk                  = `CPU.l2t5.gclk;


assign l26_arbdp_addr_c2        = `CPU.l2t6.arbadr.arbdp_addr_c2;
assign l26_arb_decdp_ld_inst_c2 = `CPU.l2t6.arb.arb_csr_rd_en_c2;
assign l26_csr_rd_data_c8       = `CPU.l2t6.csr_rd_data_c8;
assign l26_arbdp_inst_diag_c2   = `CPU.l2t6.arb.arb_inst_diag_c2;
assign l26_tmp_inval_data_c7    = `CPU.l2t6.oque.tmp_inval_data_c7;
assign l26_ld_c2                = `CPU.l2t6.arb.arb_decdp_ld_inst_c2;
assign #1 l26_clk                  = `CPU.l2t6.gclk;


assign l27_arbdp_addr_c2        = `CPU.l2t7.arbadr.arbdp_addr_c2;
assign l27_arb_decdp_ld_inst_c2 = `CPU.l2t7.arb.arb_csr_rd_en_c2;
assign l27_csr_rd_data_c8       = `CPU.l2t7.csr_rd_data_c8;
assign l27_arbdp_inst_diag_c2   = `CPU.l2t7.arb.arb_inst_diag_c2;
assign l27_tmp_inval_data_c7    = `CPU.l2t7.oque.tmp_inval_data_c7;
assign l27_ld_c2                = `CPU.l2t7.arb.arb_decdp_ld_inst_c2;
assign #1 l27_clk                  = `CPU.l2t7.gclk;


l2_csr_probe l20_csr_probe( .bank_id(3'b000), .l2_clk(l20_clk), .ld_inst_c2(l20_arb_decdp_ld_inst_c2), .addr_c2(l20_arbdp_addr_c2), .rd_data_c8(l20_csr_rd_data_c8), .diag_inst(l20_arbdp_inst_diag_c2), .mux_data(l20_tmp_inval_data_c7), .diag_ld_inst_c2(l20_ld_c2));

l2_csr_probe l21_csr_probe( .bank_id(3'b001), .l2_clk(l21_clk), .ld_inst_c2(l21_arb_decdp_ld_inst_c2), .addr_c2(l21_arbdp_addr_c2), .rd_data_c8(l21_csr_rd_data_c8), .diag_inst(l21_arbdp_inst_diag_c2), .mux_data(l21_tmp_inval_data_c7),  .diag_ld_inst_c2(l21_ld_c2));

l2_csr_probe l22_csr_probe( .bank_id(3'b010), .l2_clk(l22_clk), .ld_inst_c2(l22_arb_decdp_ld_inst_c2), .addr_c2(l22_arbdp_addr_c2), .rd_data_c8(l22_csr_rd_data_c8), .diag_inst(l22_arbdp_inst_diag_c2), .mux_data(l22_tmp_inval_data_c7),  .diag_ld_inst_c2(l22_ld_c2));

l2_csr_probe l23_csr_probe( .bank_id(3'b011), .l2_clk(l23_clk), .ld_inst_c2(l23_arb_decdp_ld_inst_c2), .addr_c2(l23_arbdp_addr_c2), .rd_data_c8(l23_csr_rd_data_c8), .diag_inst(l23_arbdp_inst_diag_c2), .mux_data(l23_tmp_inval_data_c7),  .diag_ld_inst_c2(l23_ld_c2));


l2_csr_probe l24_csr_probe( .bank_id(3'b100), .l2_clk(l24_clk), .ld_inst_c2(l24_arb_decdp_ld_inst_c2), .addr_c2(l24_arbdp_addr_c2), .rd_data_c8(l24_csr_rd_data_c8), .diag_inst(l24_arbdp_inst_diag_c2), .mux_data(l24_tmp_inval_data_c7),  .diag_ld_inst_c2(l24_ld_c2));


l2_csr_probe l25_csr_probe( .bank_id(3'b101), .l2_clk(l25_clk), .ld_inst_c2(l25_arb_decdp_ld_inst_c2), .addr_c2(l25_arbdp_addr_c2), .rd_data_c8(l25_csr_rd_data_c8), .diag_inst(l25_arbdp_inst_diag_c2), .mux_data(l25_tmp_inval_data_c7),  .diag_ld_inst_c2(l25_ld_c2));

l2_csr_probe l26_csr_probe( .bank_id(3'b110), .l2_clk(l26_clk), .ld_inst_c2(l26_arb_decdp_ld_inst_c2), .addr_c2(l26_arbdp_addr_c2), .rd_data_c8(l26_csr_rd_data_c8), .diag_inst(l26_arbdp_inst_diag_c2), .mux_data(l26_tmp_inval_data_c7),  .diag_ld_inst_c2(l26_ld_c2));

l2_csr_probe l27_csr_probe( .bank_id(3'b111), .l2_clk(l27_clk), .ld_inst_c2(l27_arb_decdp_ld_inst_c2), .addr_c2(l27_arbdp_addr_c2), .rd_data_c8(l27_csr_rd_data_c8), .diag_inst(l27_arbdp_inst_diag_c2), .mux_data(l27_tmp_inval_data_c7),  .diag_ld_inst_c2(l27_ld_c2));





endmodule 

module l2_csr_probe ( bank_id, l2_clk, ld_inst_c2, addr_c2, rd_data_c8, diag_inst, mux_data, diag_ld_inst_c2);

input   [2:0]    bank_id;
input            ld_inst_c2, diag_inst;
input   [39:0]   addr_c2;
input   [63:0]   rd_data_c8, mux_data;
input            l2_clk;
input            diag_ld_inst_c2;

integer l2_probe;

reg     [2:0]     state;
wire    [39:0]    addr_c2;
wire    [63:0]    rd_data_c8;

reg csr_rd_c3, diag_ld_c3;
reg csr_rd_c4, diag_ld_c4;
reg csr_rd_c5, diag_ld_c5;
reg csr_rd_c6, diag_ld_c6;
reg csr_rd_c7, diag_ld_c7;
reg csr_rd_c8, diag_ld_c8;
reg csr_rd_c9, diag_ld_c9;

reg [39:0] csr_addr_c3;
reg [39:0] csr_addr_c4;
reg [39:0] csr_addr_c5;
reg [39:0] csr_addr_c6;
reg [39:0] csr_addr_c7;
reg [39:0] csr_addr_c8;
reg [39:0] csr_addr_c9;
wire  eer;
assign eer        = ( addr_c2[39:32] == 8'hBA) | ( addr_c2[39:32] == 8'hAA); 
wire  esr;                                                              
assign esr        = ( addr_c2[39:32] == 8'hBB) | ( addr_c2[39:32] == 8'hAB); 
wire  ear;                                                              
assign ear        = ( addr_c2[39:32] == 8'hBC) | ( addr_c2[39:32] == 8'hAC); 
wire notData;                                                           
assign notData    = ( addr_c2[39:32] == 8'hBE) | ( addr_c2[39:32] == 8'hAE); 
wire eir;                                                               
assign eir        = ( addr_c2[39:32] == 8'hBD) | ( addr_c2[39:32] == 8'hAD); 
wire l2_csr;
assign l2_csr     = (eer | esr | ear | notData | eir);
wire csr_rd_c2;
assign csr_rd_c2     = ( ld_inst_c2 & l2_csr );
wire diag_ld_c2;
assign diag_ld_c2    = (diag_ld_inst_c2 & diag_inst );
 
//follow the pipeline

always @(posedge l2_clk)
   begin
    csr_rd_c3     <= csr_rd_c2;
    csr_rd_c4     <= csr_rd_c3;
    csr_rd_c5     <= csr_rd_c4;
    csr_rd_c6     <= csr_rd_c5;
    csr_rd_c7     <= csr_rd_c6;
    csr_rd_c8     <= csr_rd_c7;
    csr_rd_c9     <= csr_rd_c8;

    csr_addr_c3   <= addr_c2;
    csr_addr_c4   <= csr_addr_c3;
    csr_addr_c5   <= csr_addr_c4;
    csr_addr_c6   <= csr_addr_c5;
    csr_addr_c7   <= csr_addr_c6;
    csr_addr_c8   <= csr_addr_c7;
    csr_addr_c9   <= csr_addr_c8;
   end

always @(posedge l2_clk) begin
    diag_ld_c3 <= diag_ld_c2 & ~csr_rd_c2;  
    diag_ld_c4 <= diag_ld_c3;  
    diag_ld_c5 <= diag_ld_c4;  
    diag_ld_c6 <= diag_ld_c5;  
    diag_ld_c7 <= diag_ld_c6;  
    diag_ld_c8 <= diag_ld_c7;  
    diag_ld_c9 <= diag_ld_c8;  
end


//csr data should be ready at c8
always @(negedge l2_clk)
   begin
      if( csr_rd_c9 ) begin
         $display("l2csr access addr=%x, data=%x\n", csr_addr_c8, rd_data_c8);
	if (`PARGS.nas_check_on ) 
      	   l2_probe = $sim_send(`PLI_CSR_READ, {24'b0, csr_addr_c9}, rd_data_c8, 8'h0);
      end
   end

//diagnostic load data should be ready at c8
always @(negedge l2_clk)
   begin
      if( diag_ld_c9 ) begin
         $display("l2 diagnostic access addr=%x, data=%x\n", csr_addr_c9, mux_data);
	if (`PARGS.nas_check_on ) 
//      	   l2_probe = $sim_send(`PLI_CSR_READ, {24'b0, csr_addr_c9}, mux_data, 8'h0);
         $display("l2 diagnostic access addr=%x, data=%x\n", csr_addr_c9, mux_data);
      end
   end

endmodule
    
 

