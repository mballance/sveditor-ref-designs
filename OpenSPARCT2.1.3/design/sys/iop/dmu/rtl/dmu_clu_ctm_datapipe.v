// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_clu_ctm_datapipe.v
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
module dmu_clu_ctm_datapipe 
  (
   // clock
   clk,
   rst_l,
   
   // jbc : dmc req/resp data port
   d2j_data,
   d2j_bmsk,
   d2j_data_par,
   
   // diu : data read port
   di2cl_data,
   di2cl_bmask,
   di2cl_dpar,
   
   // datapath select
   dpath_sel,
   ld_diu_data,
//BP n2 4-28-04
   proc_pio_err
   );
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // Clock Signal
  // --------------------------------------------------------
  
  input clk;
  input rst_l;
  
  // --------------------------------------------------------
  // JBC Interface
  // --------------------------------------------------------
  
  // Data Port -> DMC Req/Resp
  output [(`FIRE_D2J_DATA_WDTH - 1):0] d2j_data;
  output [(`FIRE_D2J_BMSK_WDTH - 1):0] d2j_bmsk;
  output [(`FIRE_D2J_DPAR_WDTH - 1):0] d2j_data_par;
  
  // --------------------------------------------------------
  // DIU Interface
  // --------------------------------------------------------
  
  // Data Buffer Read Port
  input  [(`FIRE_DLC_CRD_DATA_WDTH - 1):0] di2cl_data;
  input [(`FIRE_DLC_CRD_BMASK_WDTH - 1):0] di2cl_bmask;
  input  [(`FIRE_DLC_CRD_DPAR_WDTH - 1):0] di2cl_dpar;
  
  // --------------------------------------------------------
  // Datapath Select
  // --------------------------------------------------------
  
  input 				   dpath_sel;
  input 				   ld_diu_data;
  
  input 				   proc_pio_err;	// force 0 data on pio err cpl
  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTERS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  // ********** Flops **********
  
  reg [(`FIRE_D2J_DATA_WDTH - 1):0] d2j_data;
  reg [(`FIRE_D2J_BMSK_WDTH - 1):0] d2j_bmsk;
  reg [(`FIRE_D2J_DPAR_WDTH - 1):0] d2j_data_par;
  
  // ********** Non-Flops ******
  
  reg [(`FIRE_D2J_DATA_WDTH - 1):0] nxt_d2j_data;
  reg [(`FIRE_D2J_BMSK_WDTH - 1):0] nxt_d2j_bmask;
  reg [(`FIRE_D2J_DPAR_WDTH - 1):0] nxt_d2j_dpar;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL Model <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // Datapath Mux Select (DIU/Zero-fill)
  // --------------------------------------------------------
  
  always @(dpath_sel or di2cl_data or di2cl_bmask or di2cl_dpar or proc_pio_err)
    begin
      
      case ((dpath_sel || proc_pio_err)) // synopsys infer_mux
	
	// DIU datapath
	1'b0 :
	  begin
	    nxt_d2j_data  = di2cl_data;
	    nxt_d2j_bmask = di2cl_bmask;
	    nxt_d2j_dpar  = di2cl_dpar;
	  end
	
	// Zero-fill datapath
	1'b1 :
	  begin
	    nxt_d2j_data  = {`FIRE_D2J_DATA_WDTH{1'b0}};
	    nxt_d2j_bmask = {`FIRE_D2J_BMSK_WDTH{1'b1}};
	    nxt_d2j_dpar  = {`FIRE_D2J_DPAR_WDTH{1'b1}};
	  end
	
      endcase
    end
  
  // --------------------------------------------------------
  // Sequential Logic : datapath regs
  // --------------------------------------------------------
  
  always @(posedge clk)
        if (~rst_l) begin
    d2j_data          <= {`FIRE_D2J_DATA_WDTH{1'b0}};
    d2j_bmsk          <= {`FIRE_D2J_BMSK_WDTH{1'b0}};
    d2j_data_par      <= {`FIRE_D2J_DPAR_WDTH{1'b0}};
	end
    else begin
      if ((ld_diu_data || proc_pio_err))
	begin
	  d2j_data     <= nxt_d2j_data;
	  d2j_bmsk     <= nxt_d2j_bmask;
	  d2j_data_par <= nxt_d2j_dpar;
	end
    end
  
endmodule // dmu_clu_ctm_datapipe
