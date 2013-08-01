// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fc_niu_csr_probe.v
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

`define NIU_UCB `CPU.rdp.niu_pio_ucb
`define NIU_PIO `CPU.rdp.niu_pio
`define FM_MAX 12'hfff

module fc_niu_csr_probe;
   reg [26:0] addr[4095:0];
   reg [63:0] data;
   reg [11:0] wrptr;
   reg [11:0] rdptr;

   integer niu_csr;
integer i;

   initial begin
       wrptr = 12'h0;
       rdptr = 12'h0;
   end

   always @ (`NIU_PIO.ucb_rd_req or `NIU_PIO.fifo_wr_en) begin
	if ((`NIU_PIO.ucb_rd_req == 1'b1) && (`NIU_PIO.fifo_wr_en == 1'b1)) begin
	    addr[wrptr] = `NIU_PIO.ucb_addr;
	    `PR_INFO ("niu_csr_probe", `INFO, "ts=%d addr[%h] gets %h\n", `TOP.core_cycle_cnt-1, wrptr, `NIU_PIO.ucb_addr);
	    if (wrptr == `FM_MAX)
	       wrptr = 12'h0;
	    else
	       wrptr = wrptr + 1;
	end
   end	


   always @ (posedge `NIU_UCB.rd_ack_vld or posedge `NIU_UCB.rd_nack_vld) begin
	if (wrptr == rdptr) begin
  	    `PR_ERROR("niu_csr_probe", `ERROR, "A data phase without an address phase received");
	end
	else begin
            data = {`NIU_UCB.data_out[7:0],`NIU_UCB.data_out[15:8],`NIU_UCB.data_out[23:16],`NIU_UCB.data_out[31:24],`NIU_UCB.data_out[39:32],`NIU_UCB.data_out[47:40],`NIU_UCB.data_out[55:48],`NIU_UCB.data_out[63:56]} ;
	    `PR_INFO ("niu_csr_probe", `INFO, "ts=%0d NIU CSR READ RETURN:  address %x  data %x ",
	    	`TOP.core_cycle_cnt-1,  {24'h0, 8'h81, 5'h0, addr[rdptr]}, data);
	     if (`PARGS.nas_check_on ) 
      	    	niu_csr = $sim_send(`PLI_CSR_READ, {24'h0, 8'h81, 5'h0, addr[rdptr]}, data, 8'h01);
	     if (rdptr == `FM_MAX)
            	rdptr = 12'h0;
             else
             	rdptr = rdptr + 1;
 	end
	   
   end // always @ (posedge 


endmodule // fc_niu_csr_probe
