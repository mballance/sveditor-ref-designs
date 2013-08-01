// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_tmu_dim_relgen.v
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
module dmu_tmu_dim_relgen (
				clk,
				rst_l,	

				// ILU interface
				k2y_rel_rcd,
				k2y_rel_enq,

				// talk to diufsm.v
                                rcd_is_cpld_reg,

				// talk to datapath.v
				k2y_buf_addr );
  
  //synopsys sync_set_reset "rst_l"

  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  

  //------------------------------------------------------------------------
  //  Clock and Reset Signals
  //------------------------------------------------------------------------
  input		  clk;		    
  input		  rst_l;

  //------------------------------------------------------------------------
  //   ILU interface
  //------------------------------------------------------------------------
  output [`FIRE_DLC_URR_REC_WDTH-1:0]  k2y_rel_rcd;         // ingress release rcd
  output                               k2y_rel_enq;         // ingress enqueue
  
  //------------------------------------------------------------------------
  //   talk to diufsm.v
  //------------------------------------------------------------------------
  input 	    rcd_is_cpld_reg;      // from diufsm.v
 
  //------------------------------------------------------------------------
  //   talk to datapath.v
  //------------------------------------------------------------------------
  input [`FIRE_DLC_ITI_ADDR_WDTH-1:0] k2y_buf_addr;
    
  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  reg [`FIRE_DLC_ITI_ADDR_WDTH-1:0]   pre_k2y_buf_addr;

  reg [`FIRE_DLC_URR_REC_WDTH-1:0]  k2y_rel_rcd;         // ingress release rcd
  reg                               k2y_rel_enq; 
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - NON-FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  wire 			    rcd_type; // 0 - pio (CPLD), 1 - dma (PD)
  wire 			    n_k2y_rel_enq;
  wire [`FIRE_DLC_URR_REC_WDTH-1:0] n_k2y_rel_rcd;

  
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL/Behavioral Model <<<<<<<<<<<<<<<<<<<<<<<<<<<

  //---------------------------------------------------------------------
  // outputs
  //---------------------------------------------------------------------
  assign rcd_type = rcd_is_cpld_reg ? 1'b0 : 1'b1;
  assign n_k2y_rel_rcd = {rcd_type, pre_k2y_buf_addr};
  assign n_k2y_rel_enq = pre_k2y_buf_addr[0] ^ k2y_buf_addr[0];

  always @ (posedge clk)
    if (~rst_l) begin
      k2y_rel_enq <= 1'b0;
      k2y_rel_rcd <= {`FIRE_DLC_URR_REC_WDTH{1'b0}};
	end
    else begin
      k2y_rel_enq <= n_k2y_rel_enq;
      k2y_rel_rcd <= n_k2y_rel_rcd;
    end

  //---------------------------------------------------------------------
  // flop lsb_k2y_buf_addr
  //---------------------------------------------------------------------
  always @ (posedge clk)
	if(~rst_l) begin
      pre_k2y_buf_addr <= {`FIRE_DLC_ITI_ADDR_WDTH{1'b0}};
	end
    else begin
      pre_k2y_buf_addr <= k2y_buf_addr;
    end 
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Instantiations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

endmodule // dmu_tmu_dim_relgen




