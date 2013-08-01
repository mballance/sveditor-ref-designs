// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mac_pio_intf.v
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
/*%W%	%G%*/

/*************************************************************************
 *
 * File Name    : mac_pio_intf.v
 * Author Name  : John Lo
 * Description  : It contains mac pio interface mux and demux logic.
 * Parent Module: mac
 * Child  Module: 
 * Interface Mod: many.
 * Date Created : 1/31/02
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification : 4/1/2004 -by John Lo
 *                1. Changed address bus width from 
 *                   16 bits to 19 bits for pio_clients_addr.
 *                2. Support both 32 bit and 64 bit addressing.
 *                3. Changed PIO read/write data bus from
 *                   32 bits to 64 bits.
 *                   The MSB 32 bits are "0". 
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

module mac_pio_intf (
clk,
niu_reset_l,
// global broadcast signals
pio_clients_addr,
pio_clients_rd,
pio_clients_wdata,
// designated signals
pio_mac_sel,
mac_pio_ack,
mac_pio_rdata,
// individual internal inputs
// port 0
pio_err_xmac0,
ack_xmac0,
rdata_xmac0,
pio_err_xpcs0,
ack_xpcs0,
rdata_xpcs0,
pio_err_pcs0,
ack_pcs0,
rdata_pcs0,
// port 1
pio_err_xmac1,
ack_xmac1,
rdata_xmac1,
pio_err_xpcs1,
ack_xpcs1,
rdata_xpcs1,
pio_err_pcs1,
ack_pcs1,
rdata_pcs1,
// port 2
pio_err_bmac2,
ack_bmac2,
rdata_bmac2,
pio_err_pcs2,
ack_pcs2,
rdata_pcs2,
// port 3
pio_err_bmac3,
ack_bmac3,
rdata_bmac3,
pio_err_pcs3,
ack_pcs3,
rdata_pcs3,
// esr
pio_err_esr,
ack_esr,
rdata_esr,
// mif
pio_err_mif,
ack_mif,
rdata_mif,
// port 0 interrupts
txmac_interrupt0,
rxmac_interrupt0,
xmac_fc_interrupt0,
xpcs_interrupt0,
pcs_int0,	  // pcs link down interrupt, secondary interrupt
// port 1 interrupts
txmac_interrupt1,
rxmac_interrupt1,
xmac_fc_interrupt1,
xpcs_interrupt1,
pcs_int1,	  // pcs link down interrupt, secondary interrupt
// port 2 interrupts
bm_tx_interrupt2,
bm_rx_interrupt2,
bm_control_interrupt2,
pcs_int2,	  // pcs link down interrupt, secondary interrupt
// port 3 interrupts
bm_tx_interrupt3,
bm_rx_interrupt3,
bm_control_interrupt3,
pcs_int3,	  // pcs link down interrupt, secondary interrupt
//
xmac_debug0,
xpcs_debug0,
mac_debug_sel0,
xmac_debug1,
xpcs_debug1,
esrctl_debug,
// outputs
reset,
mac_debug_port,
sel_xmac0,
sel_xpcs0,
sel_pcs0 ,
sel_xmac1,
sel_xpcs1,
sel_pcs1 ,
sel_bmac2,
sel_pcs2 ,
sel_bmac3,
sel_pcs3 ,
sel_esr,
sel_mif,
pio_addr,
pio_rd,
pio_wdata,
mac_pio_intr0,// port 0 interrupt
mac_pio_intr1,// port 1 interrupt
mac_pio_intr2,// port 2 interrupt
mac_pio_intr3,// port 3 interrupt
mac_pio_err
	);
   
   input           clk;
   input           niu_reset_l;
                   // global broadcast signals
   input [19:0]    pio_clients_addr;
   input 	   pio_clients_rd;
   input [31:0]    pio_clients_wdata;
                   // designated signals
   input 	   pio_mac_sel;
   output 	   mac_pio_ack;
   output [63:0]   mac_pio_rdata;
                   // individual internal inputs
                   // port 0
   input 	   pio_err_xmac0;
   input 	   ack_xmac0;
   input [31:0]    rdata_xmac0;
   input 	   pio_err_xpcs0;
   input 	   ack_xpcs0;
   input [31:0]    rdata_xpcs0;
   input 	   pio_err_pcs0;
   input 	   ack_pcs0;
   input [31:0]    rdata_pcs0;
                   // port 1
   input 	   pio_err_xmac1;
   input 	   ack_xmac1;
   input [31:0]    rdata_xmac1;
   input 	   pio_err_xpcs1;
   input 	   ack_xpcs1;
   input [31:0]    rdata_xpcs1;
   input 	   pio_err_pcs1;
   input 	   ack_pcs1;
   input [31:0]    rdata_pcs1;
                   // port 2
   input 	   pio_err_bmac2;
   input 	   ack_bmac2;
   input [31:0]    rdata_bmac2;
   input 	   pio_err_pcs2;
   input 	   ack_pcs2;
   input [31:0]    rdata_pcs2;
                   // port 3
   input 	   pio_err_bmac3;
   input 	   ack_bmac3;
   input [31:0]    rdata_bmac3;
   input 	   pio_err_pcs3;
   input 	   ack_pcs3;
   input [31:0]    rdata_pcs3;
                   // esr
   input 	   pio_err_esr;
   input 	   ack_esr;
   input [31:0]    rdata_esr;
                   // mif
   input 	   pio_err_mif;
   input 	   ack_mif;
   input [31:0]    rdata_mif;
                   // port 0 interrupts
   input  	   txmac_interrupt0;
   input  	   rxmac_interrupt0;
   input  	   xmac_fc_interrupt0;
   input  	   xpcs_interrupt0;
   input 	   pcs_int0;	  // pcs link down interrupt, secondary interrupt
                   // port 1 interrupts
   input  	   txmac_interrupt1;
   input  	   rxmac_interrupt1;
   input  	   xmac_fc_interrupt1;
   input  	   xpcs_interrupt1;
   input 	   pcs_int1;	  // pcs link down interrupt, secondary interrupt
                   // port 2 interrupts
   input 	   bm_tx_interrupt2;
   input 	   bm_rx_interrupt2;
   input 	   bm_control_interrupt2;
   input 	   pcs_int2;	  // pcs link down interrupt, secondary interrupt
                   // port 3 interrupts
   input 	   bm_tx_interrupt3;
   input 	   bm_rx_interrupt3;
   input 	   bm_control_interrupt3;
   input 	   pcs_int3;	  // pcs link down interrupt, secondary interrupt
                   //
   input [31:0]	   xmac_debug0;
   input [31:0]	   xpcs_debug0;
   input [2:0] 	   mac_debug_sel0;
   input [31:0]	   xmac_debug1;
   input [31:0]	   xpcs_debug1;
   input [31:0]    esrctl_debug;
                   // outputs
   output 	   reset;
   output [31:0]   mac_debug_port;
   output          sel_xmac0;
   output          sel_xpcs0;
   output          sel_pcs0 ;
   output          sel_xmac1;
   output          sel_xpcs1;
   output          sel_pcs1 ;
   output          sel_bmac2;
   output          sel_pcs2 ;
   output          sel_bmac3;
   output          sel_pcs3 ;
   output 	   sel_esr;
   output 	   sel_mif;
   output [16:0]   pio_addr;
   output 	   pio_rd;
   output [31:0]   pio_wdata;
   output 	   mac_pio_intr0;// port 0 interrupt
   output 	   mac_pio_intr1;// port 1 interrupt
   output 	   mac_pio_intr2;// port 2 interrupt
   output 	   mac_pio_intr3;// port 3 interrupt
   output 	   mac_pio_err;
   
// xmac    address range: [8:0] x2 -> reserve 1 bit -> 10
// big_mac address range: [8:0] x2 -> 
// xpcs    address range: [6:0] x2 -> 
// pcs     address range: [6:0] x4 -> 
// ---------------------------------
// total   address range:
// 8K is enough
   wire 	   niu_reset_l;
   wire 	   reset;
   wire 	   reset_l;
   reg 		   pio_ack;
   reg   [31:0]    pio_rdata;
   reg 		   pio_err;
   wire 	   pio_sel;
   wire 	   pio_sel_pls;
   wire 	   pio_sel_pls_d1;
   wire 	   pio_sel_pls_d2;
   wire  [16:0]    pio_addr;
   wire 	   pio_rd;
   wire  [31:0]    pio_wdata;
                   // pio global signals

   wire  [19:0]    pio_clients_addr;
   wire  [31:0]    pio_clients_wdata;
   wire 	   pio_clients_rd;
                   // designated signals
   wire  	   pio_mac_sel;
   wire   	   mac_pio_ack;
   wire  [63:0]    mac_pio_rdata;
   wire   	   mac_pio_err;
                   // individual internal wire
   wire  [31:0]    rdata_xmac0;
   wire  [31:0]    rdata_xpcs0;
   wire  [31:0]    rdata_pcs0;
   wire  [31:0]    rdata_xmac1;
   wire  [31:0]    rdata_xpcs1;
   wire  [31:0]    rdata_pcs1;
   wire  [31:0]    rdata_bmac2;
   wire  [31:0]    rdata_pcs2;
   wire  [31:0]    rdata_bmac3;
   wire  [31:0]    rdata_pcs3;
   wire  [31:0]    rdata_esr;
   wire  [31:0]    rdata_mif;
   wire  [31:0]	   xmac_debug0;
   wire  [31:0]	   xpcs_debug0;
   wire  [2:0] 	   mac_debug_sel0;
   wire  [31:0]	   xmac_debug1;
   wire  [31:0]	   xpcs_debug1;


// register the input signals:
   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   wire [19:0] 	   pio_clients_addr_64bit;
   // vlint flag_net_has_no_load on
   // vlint flag_dangling_net_within_module on

SYNC_CELL    reset_SYNC_CELL(.D(niu_reset_l),.CP(clk),.Q(reset_l));

   assign 	   reset = ~reset_l;
   
RegDff #(1)  pio_sel_RegDff(  
                     .din(pio_mac_sel),
                     .clk(clk),
                     .qout(pio_sel));

pls_gen pio_sel_pls_gen(.clk(clk),.in(pio_sel),.out(pio_sel_pls));

RegDff #(1) pio_sel_pls_d1_RegDff(.din(pio_sel_pls),.clk(clk),.qout(pio_sel_pls_d1));
RegDff #(1) pio_sel_pls_d2_RegDff(.din(pio_sel_pls_d1),.clk(clk),.qout(pio_sel_pls_d2));

RegDff #(20) pio_clients_addr_64bit_RegDff(  
                     .din(pio_clients_addr[19:0]),
                     .clk(clk),
                     .qout(pio_clients_addr_64bit[19:0]));

assign   pio_addr[16:0] = pio_clients_addr_64bit[16:0];

RegDff #(1)  pio_rd_RegDff(  
                     .din(pio_clients_rd),
                     .clk(clk),
                     .qout(pio_rd));

RegDff #(32) pio_wdata_RegDff(  
                     .din(pio_clients_wdata[31:0]),
                     .clk(clk),
                     .qout(pio_wdata[31:0]));

   wire  sel_xmac0 = pio_sel & (~pio_addr[2]) & (pio_addr[16:13] == `XMAC0_ADDR_OFFSET);
   wire  sel_xpcs0 = pio_sel & (~pio_addr[2]) & (pio_addr[16:13] == `XPCS0_ADDR_OFFSET);
   wire  sel_pcs0  = pio_sel & (~pio_addr[2]) & (pio_addr[16:13] == `PCS0_ADDR_OFFSET);
   wire  sel_xmac1 = pio_sel & (~pio_addr[2]) & (pio_addr[16:13] == `XMAC1_ADDR_OFFSET);
   wire  sel_xpcs1 = pio_sel & (~pio_addr[2]) & (pio_addr[16:13] == `XPCS1_ADDR_OFFSET);
   wire  sel_pcs1  = pio_sel & (~pio_addr[2]) & (pio_addr[16:13] == `PCS1_ADDR_OFFSET);
   wire  sel_bmac2 = pio_sel & (~pio_addr[2]) & (pio_addr[16:13] == `BMAC2_ADDR_OFFSET);
   wire  sel_pcs2  = pio_sel & (~pio_addr[2]) & (pio_addr[16:13] == `PCS2_ADDR_OFFSET);
   wire  sel_bmac3 = pio_sel & (~pio_addr[2]) & (pio_addr[16:13] == `BMAC3_ADDR_OFFSET);
   wire  sel_pcs3  = pio_sel & (~pio_addr[2]) & (pio_addr[16:13] == `PCS3_ADDR_OFFSET);
   wire  sel_esr   = pio_sel & (~pio_addr[2]) & (pio_addr[16:13] == `ESR_ADDR_OFFSET);
   wire  sel_mif   = pio_sel & (~pio_addr[2]) & (pio_addr[16:13] == `MIF_ADDR_OFFSET);
   
   wire  mac_pio_interrupt0= txmac_interrupt0      |
                             rxmac_interrupt0      |
                             xmac_fc_interrupt0    |
                             xpcs_interrupt0       |
                             pcs_int0              ;

   wire  mac_pio_interrupt1= txmac_interrupt1      |
                             rxmac_interrupt1      |
                             xmac_fc_interrupt1    |
                             xpcs_interrupt1       |
                             pcs_int1              ;

   wire  mac_pio_interrupt2= bm_tx_interrupt2      |
                             bm_rx_interrupt2      |
                             bm_control_interrupt2 |
                             pcs_int2;

   wire  mac_pio_interrupt3= bm_tx_interrupt3      |
                             bm_rx_interrupt3      |
                             bm_control_interrupt3 |
                             pcs_int3;

   FD1 mac_pio_intr0_FD1(.CP(clk),.D(mac_pio_interrupt0), 
                                  .Q(mac_pio_intr0));
   FD1 mac_pio_intr1_FD1(.CP(clk),.D(mac_pio_interrupt1), 
                                  .Q(mac_pio_intr1));
   FD1 mac_pio_intr2_FD1(.CP(clk),.D(mac_pio_interrupt2), 
                                  .Q(mac_pio_intr2));
   FD1 mac_pio_intr3_FD1(.CP(clk),.D(mac_pio_interrupt3), 
                                  .Q(mac_pio_intr3));
   
always @ (/*AUTOSENSE*/ack_bmac2 or ack_bmac3 or ack_esr or ack_mif
	  or ack_pcs0 or ack_pcs1 or ack_pcs2 or ack_pcs3 or ack_xmac0
	  or ack_xmac1 or ack_xpcs0 or ack_xpcs1 or pio_addr
	  or pio_err_bmac2 or pio_err_bmac3 or pio_err_esr
	  or pio_err_mif or pio_err_pcs0 or pio_err_pcs1
	  or pio_err_pcs2 or pio_err_pcs3 or pio_err_xmac0
	  or pio_err_xmac1 or pio_err_xpcs0 or pio_err_xpcs1
	  or pio_sel or pio_sel_pls_d2 or rdata_bmac2 or rdata_bmac3
	  or rdata_esr or rdata_mif or rdata_pcs0 or rdata_pcs1
	  or rdata_pcs2 or rdata_pcs3 or rdata_xmac0 or rdata_xmac1
	  or rdata_xpcs0 or rdata_xpcs1 or sel_bmac2 or sel_bmac3
	  or sel_esr or sel_mif or sel_pcs0 or sel_pcs1 or sel_pcs2
	  or sel_pcs3 or sel_xmac0 or sel_xmac1 or sel_xpcs0
	  or sel_xpcs1)
begin
  if ((pio_sel) & (~pio_addr[2]))
    case ({sel_xmac0,sel_xpcs0,sel_pcs0,
           sel_xmac1,sel_xpcs1,sel_pcs1,
           sel_bmac2,sel_pcs2,
           sel_bmac3,sel_pcs3,
           sel_esr,  sel_mif})
      12'b1000_0000_0000: begin                                        
                            pio_ack         =  ack_xmac0;             
                            pio_rdata       =  rdata_xmac0;     
                            pio_err         =  pio_err_xmac0;         
                          end                                          
      12'b0100_0000_0000: begin                                        
                            pio_ack         =  ack_xpcs0;             
                            pio_rdata       =  rdata_xpcs0;     
                            pio_err         =  pio_err_xpcs0;         
                          end                                          
      12'b0010_0000_0000: begin                                         
                            pio_ack         =  ack_pcs0;             
                            pio_rdata       =  rdata_pcs0;     
                            pio_err         =  pio_err_pcs0;           
                          end                                           
      12'b0001_0000_0000: begin                                        
                            pio_ack         =  ack_xmac1;             
                            pio_rdata       =  rdata_xmac1;     
                            pio_err         =  pio_err_xmac1;         
                          end                                          
      12'b0000_1000_0000: begin                                        
                            pio_ack         =  ack_xpcs1;             
                            pio_rdata       =  rdata_xpcs1;     
                            pio_err         =  pio_err_xpcs1;         
                          end                                          
      12'b0000_0100_0000: begin                                         
                            pio_ack         =  ack_pcs1;             
                            pio_rdata       =  rdata_pcs1;     
                            pio_err         =  pio_err_pcs1;           
                          end                                           
      12'b0000_0010_0000: begin                                         
                            pio_ack         =  ack_bmac2;             
                            pio_rdata       =  rdata_bmac2;     
                            pio_err         =  pio_err_bmac2;         
                          end                                           
      12'b0000_0001_0000: begin                                         
                            pio_ack         =  ack_pcs2;              
                            pio_rdata       =  rdata_pcs2;      
                            pio_err         =  pio_err_pcs2;          
                          end                                           
      12'b0000_0000_1000: begin                                         
                            pio_ack         =  ack_bmac3;             
                            pio_rdata       =  rdata_bmac3;     
                            pio_err         =  pio_err_bmac3;         
                          end                                           
      12'b0000_0000_0100: begin                                         
                            pio_ack         =  ack_pcs3;              
                            pio_rdata       =  rdata_pcs3;      
                            pio_err         =  pio_err_pcs3;          
                          end                                           
      12'b0000_0000_0010: begin		                       
                            pio_ack         =  ack_esr;              
                            pio_rdata       =  rdata_esr;      
                            pio_err         =  pio_err_esr;          
                          end 
      12'b0000_0000_0001: begin		                       
                            pio_ack         =  ack_mif;              
                            pio_rdata       =  rdata_mif;      
                            pio_err         =  pio_err_mif;          
                          end 
      default:            begin
                            pio_ack         =  pio_sel_pls_d2;
                            pio_rdata       =  32'hdead_beef;
                            pio_err         =  pio_sel_pls_d2;
                          end 
    endcase // case({sel_xmac0,sel_xpcs0,sel_pcs0,...
   // accessing reserved upper 32 bit field.
   // write operation is silent drop without pio_err
   // read  operation rdata is always zeros.
  else if (pio_sel & pio_addr[2]) 
                          begin
                            pio_ack         =  pio_sel_pls_d2;
                            pio_rdata       =  32'b0;
                            pio_err         =  1'b0;
                          end 
  else                    begin
                            pio_ack         =  1'b0;
                            pio_rdata       =  32'hdead_beef;
                            pio_err         =  1'b0;
                          end 
end // always @ (...
   
    
RegDff #(64) mac_pio_rdata_RegDff(.din({32'b0,pio_rdata[31:0]}),
                                  .clk(clk),   
                                  .qout(mac_pio_rdata[63:0])); 
   
FD1          mac_pio_err_FD1(.CP(clk),.D(pio_err), 
                             .Q(mac_pio_err));

FD1          mac_pio_ack_FD1(.CP(clk),.D(pio_ack), 
                             .Q(mac_pio_ack));


// debug
   reg  [31:0] mac_debug_port;
   
always @ (/*AUTOSENSE*/esrctl_debug or mac_debug_sel0 or xmac_debug0
	  or xmac_debug1 or xpcs_debug0 or xpcs_debug1)
 case (mac_debug_sel0)  // synopsys parallel_case full_case infer_mux
   3'h0:     mac_debug_port = xmac_debug0;
   3'h1:     mac_debug_port = xpcs_debug0;
   3'h2:     mac_debug_port = xmac_debug1;
   3'h3:     mac_debug_port = xpcs_debug1;
   3'h4:     mac_debug_port = esrctl_debug;
   default:  mac_debug_port = xmac_debug0;
 endcase // casex(mac_debug_sel)
   
   
endmodule // mac_pio_intf


