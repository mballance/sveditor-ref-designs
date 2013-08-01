// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_ilu_iil_crdtcnt.v
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
module dmu_ilu_iil_crdtcnt (
				 clk,
				 rst_l,
                                 cib2iil_pec_drain,
				 k2y_rel_rcd,
				 k2y_rel_enq,
				 d2p_ibc_req,
				 d2p_ibc_nhc,
				 d2p_ibc_phc,
				 d2p_ibc_pdc,
				 p2d_ibc_ack,
				 is_ihb_rcd,
				 credit_type );
 

  // synopsys sync_set_reset "rst_l"

  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  //---------------------------------------------------------------------
  //  Clock and Reset Signals
  //---------------------------------------------------------------------
  input		  clk;		    // input clock  
  input		  rst_l;   	    // input reset
    
  //---------------------------------------------------------------------
  //   DMA MWr buffer release interface from TMU
  //---------------------------------------------------------------------
  input [8:0]	  k2y_rel_rcd;     // release rcd
  input           k2y_rel_enq;     // 1 PCIE FC credit (16-byte data)
  
  //---------------------------------------------------------------------
  //   PCIE FC credits interface to TLU
  //---------------------------------------------------------------------
  output          d2p_ibc_req;       // request for ingress buffer credits
  input           p2d_ibc_ack;       // ack for ingress buffer credits
  output   [7:0]  d2p_ibc_nhc;       // PCIE FC NPH credits
  output   [7:0]  d2p_ibc_phc;       // PCIE FC PH credits
  output  [11:0]  d2p_ibc_pdc;       // PCIE FC PD credits
    	  
  //---------------------------------------------------------------------
  //   ILU internal module interface
  //---------------------------------------------------------------------
  input           cib2iil_pec_drain; // reset FC credits when it is asserted

  //---------------------------------------------------------------------
  //   IIL internal interface
  //---------------------------------------------------------------------
  input [1:0] 	  credit_type;
                                     // 2'b10 - NPH, 2'b01 - PH, 2'b00 - CPLH
  input           is_ihb_rcd;        // collect fc credit,           from *xfrfsm.v
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  reg	          d2p_ibc_req;
  reg      [7:0]  d2p_ibc_nhc;
  reg      [7:0]  d2p_ibc_phc;
  reg     [11:0]  d2p_ibc_pdc;

  reg	          ibc_req;
  reg      [7:0]  ibc_nhc;
  reg      [7:0]  ibc_phc;
  reg     [11:0]  ibc_pdc;

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  wire 		  ibc_ack;           // sync-flop output

  wire 		  ld_inc_ibc_pdc;
  wire 		  ld_inc_ibc_nhc;
  wire 		  ld_inc_ibc_phc;
  				
  wire 		  ld_credits;     

  // >>>>>>>>>>>>>>>>>>>>>>>>> Zero In Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // 0in known_driven -var ld_inc_ibc_pdc
  // 0in known_driven -var ld_inc_ibc_nhc
  // 0in known_driven -var ld_inc_ibc_phc
  // 0in known_driven -var ld_credits  

  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL/Behavioral Model <<<<<<<<<<<<<<<<<<<<<<<<<<<

  //---------------------------------------------------------------------
  //   request flops
  //---------------------------------------------------------------------
  always @ (posedge clk)
    if (!rst_l) begin
      ibc_req <= 1'b0;
    end
    else begin
      ibc_req <= (ibc_ack ~^ ibc_req) ^ ibc_req;
    end

  always @ (posedge clk)
    if (!rst_l) begin
      d2p_ibc_req <= 1'b0;
	end
    else begin
      d2p_ibc_req <= ibc_req;
    end
   
  //---------------------------------------------------------------------
  //   PCIE FC credit flops
  //---------------------------------------------------------------------
  assign ld_inc_ibc_pdc = k2y_rel_enq & k2y_rel_rcd[8];
  assign ld_inc_ibc_nhc = credit_type[1] & is_ihb_rcd;
  assign ld_inc_ibc_phc = credit_type[0] & is_ihb_rcd;
  
  always @ (posedge clk)
    if ((!rst_l) | cib2iil_pec_drain) begin
      ibc_nhc <= 8'b0;
      ibc_phc <= 8'b0;
      ibc_pdc <= 12'b0;
    end
    else begin
      if (ld_inc_ibc_pdc) ibc_pdc <= ibc_pdc + 1'b1;
      if (ld_inc_ibc_nhc) begin
	ibc_nhc <= ibc_nhc + 1'b1;
      end
      else if (ld_inc_ibc_phc) begin
	ibc_phc <= ibc_phc + 1'b1;
      end
    end
  
  assign ld_credits = ibc_req ^ d2p_ibc_req;
  
  always @ (posedge clk)
    begin
      if (!rst_l) begin
	d2p_ibc_nhc <= 8'b0;
	d2p_ibc_phc <= 8'b0;
	d2p_ibc_pdc <= 12'b0;
      end
      else begin      
	if (ld_credits) begin
	  d2p_ibc_pdc <= ibc_pdc;
	  d2p_ibc_phc <= ibc_phc;
	  d2p_ibc_nhc <= ibc_nhc;
	end
      end
    end


  // >>>>>>>>>>>>>>>>>>>>>>>>> Instantiations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  // sync flop
//  pcie_common_sync_flop #(1) sync_flop(
//                                       .clk(clk),
//                                       .din(p2d_ibc_ack),
//                                       .dout(ibc_ack));
  cl_a1_clksyncff_4x sync_flop ( .d(p2d_ibc_ack), .si(1'b0), .q( ibc_ack), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
      
endmodule // dmu_ilu_iil_crdtcnt


