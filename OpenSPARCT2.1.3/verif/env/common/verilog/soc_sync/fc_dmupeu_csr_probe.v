// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fc_dmupeu_csr_probe.v
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

module fc_dmupeu_csr_probe;

   reg [1:0] state;
   integer dmupeu_csr;

   parameter IDLE = 0, DATA1 = 1, DATA2 = 2;
 
   wire                                 clk  = `DMU.l1clk;
   wire                                 rst_ = `DMU.wmr_;
   wire [`FIRE_CSR_CMND_BITS]		cmd;
   reg  [`FIRE_CSR_DATA_BITS]		data;
   reg  [`FIRE_CSR_ADDR_BITS]		addr;
   reg  [63:0] 				nas_addr;
   wire [`FIRE_CSR_RING_BITS]		csr_ring_in = `DMU.d2j_csr_ring_in;
   
   assign cmd = csr_ring_in[`FIRE_CSR_RING_CMND_BITS];
   
   wire   vld_read_rsp = (cmd == `FIRE_CSR_CMND_RRSP) ;
   wire   req_vld      = (cmd != `FIRE_CSR_CMND_IDLE) ;

   always @ (negedge clk or negedge rst_) begin
      if (rst_ !== 1'b1) begin
	 state      = IDLE;
	 data       = {`FIRE_CSR_DATA_WIDTH{1'b0}};
	 addr       = {`FIRE_CSR_ADDR_MAX_WIDTH{1'b1}};
      end
      else begin
	 case (state)
	   IDLE: begin
	      if(req_vld) begin
                 if(vld_read_rsp) begin
		     addr =  csr_ring_in[`FIRE_CSR_RING_ADDR_BITS];
                 end
		 state = DATA1;
	      end
	   end
	   
	   DATA1: begin
	      data[`FIRE_CSR_RDMS_BITS] = csr_ring_in;
	      state = DATA2;
	   end
	   
	   DATA2: begin
	      data[`FIRE_CSR_RDLS_BITS] = csr_ring_in;
	      state = IDLE;

	      if (`PARGS.nas_check_on && `PARGS.soc_sync_on && addr != 27'h7ffffff) begin
		 nas_addr = {24'h0, 8'h88, 2'h0, addr, 3'b000};
		 `PR_INFO ("dmupeu_csr_probe", `INFO, "ts=%0d DMU/PEU CSR READ RETURN:  address %x  data %x ",
			   `TOP.core_cycle_cnt-1, nas_addr, data);
      		 dmupeu_csr = $sim_send(`PLI_CSR_READ, nas_addr, data, 8'h0);
	      end
	      addr       = {`FIRE_CSR_ADDR_MAX_WIDTH{1'b1}};
	   end
	   
	   default:
	     `PR_ERROR("dmupeu_csr_probe", `ERROR, "ts=%0d illegal state=%x", `TOP.core_cycle_cnt-1, state);

	 endcase // case(state)
      end // else: !if(!`DMU.wmr_)
   end // always @ (negedge `DMU.l1clk or negedge `DMU.wmr_)

endmodule // fc_dmupeu_csr_probe
