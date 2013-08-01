// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_ilu_cib_cim.v
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
module dmu_ilu_cib_cim (
			     clk,
		             rst_l,
			     
			     // ilu <-> tlu misc
			     p2d_mps,
			     p2d_ue_int,
			     p2d_ce_int,
			     p2d_oe_int,
			     
			     // to dbg port
			     dbg_ue_int,
			     dbg_ce_int,
			     dbg_oe_int,
			     
			     // D-P drain interface
//			     d2p_drain,
			     p2d_drain,
			     
			     // ilu <-> dmu misc
			     y2k_mps,
			     y2k_int_l,
		     	     
			     // internal interface
			     iil2cib_ihb_pe,
			     cib2iil_ihb_pe_drain,
			     cib2iil_pec_drain,
			     cib2eil_ihb_pe_drain,
			     cib2eil_pec_drain,
			     
			     // DCM interface
			     pec_int_en_pec_hw_read,
			     pec_int_en_pec_ilu_hw_read,
			     pec_int_en_pec_ue_hw_read,
			     pec_int_en_pec_ce_hw_read,
			     pec_int_en_pec_oe_hw_read,
			     pec_en_err_ilu_ext_read_data,
			     pec_en_err_ue_ext_read_data,
			     pec_en_err_ce_ext_read_data,
			     pec_en_err_oe_ext_read_data,
			     ilu_int_en_spare3_s_hw_read,
			     ilu_int_en_spare2_s_hw_read,
			     ilu_int_en_spare1_s_hw_read,
			     ilu_int_en_ihb_pe_s_hw_read,
			     ilu_int_en_spare3_p_hw_read,
			     ilu_int_en_spare2_p_hw_read,
			     ilu_int_en_spare1_p_hw_read,
			     ilu_int_en_ihb_pe_p_hw_read,
			     ilu_log_en_spare3_hw_read,
			     ilu_log_en_spare2_hw_read,
			     ilu_log_en_spare1_hw_read,
			     ilu_log_en_ihb_pe_hw_read,
			     ilu_en_err_spare3_s_ext_read_data,
			     ilu_en_err_spare2_s_ext_read_data,
			     ilu_en_err_spare1_s_ext_read_data,
			     ilu_en_err_ihb_pe_s_ext_read_data,
			     ilu_en_err_spare3_p_ext_read_data,
			     ilu_en_err_spare2_p_ext_read_data,
			     ilu_en_err_spare1_p_ext_read_data,
			     ilu_en_err_ihb_pe_p_ext_read_data,
			     ilu_log_err_spare3_s_hw_set,
			     ilu_log_err_spare3_s_hw_read,
			     ilu_log_err_spare2_s_hw_set,
			     ilu_log_err_spare2_s_hw_read,
			     ilu_log_err_spare1_s_hw_set,
			     ilu_log_err_spare1_s_hw_read,
			     ilu_log_err_ihb_pe_s_hw_set,
			     ilu_log_err_ihb_pe_s_hw_read,
			     ilu_log_err_spare3_p_hw_set,
			     ilu_log_err_spare3_p_hw_read,
			     ilu_log_err_spare2_p_hw_set,
			     ilu_log_err_spare2_p_hw_read,
			     ilu_log_err_spare1_p_hw_set,
			     ilu_log_err_spare1_p_hw_read,
			     ilu_log_err_ihb_pe_p_hw_set,
			     ilu_log_err_ihb_pe_p_hw_read );
  
  //synopsys sync_set_reset "rst_l"

  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  //------------------------------------------------------------------------
  //  Clock and Reset Signals
  //------------------------------------------------------------------------
  input		  clk;		    // input clock
  input 	  rst_l;            // soft reset
      
  //------------------------------------------------------------------------
  // ilu <-> tlu misc. interface
  //------------------------------------------------------------------------
  input [`FIRE_P2D_MPS_WDTH-1:0] p2d_mps;           // max. payld size
  input 			 p2d_ue_int;        // uncorrectable error
  input 			 p2d_ce_int;        // correctable error
  input 			 p2d_oe_int;        // other error
 
  output 			 dbg_ue_int;        // to dbg port only
  output 			 dbg_ce_int;        // to dbg port only
  output 			 dbg_oe_int;        // to dbg port only
  //------------------------------------------------------------------------
  //  
  //  DMC - PEC drain interface
  //------------------------------------------------------------------------
  input 	  p2d_drain;
//  output 	  d2p_drain;

  //------------------------------------------------------------------------
  //  ilu <-> dmu misc. interface
  //------------------------------------------------------------------------
  output [`FIRE_DLC_MPS-1:0] y2k_mps;         // max. payld size to CMU
  output 		     y2k_int_l;       // interrupt req to IMU

  //------------------------------------------------------------------------
  //  Internal module interface
  //------------------------------------------------------------------------
  input 	  iil2cib_ihb_pe;  // ingress header parity error
  output          cib2iil_ihb_pe_drain; // caused by iil2cib_ihb_pe
  output          cib2iil_pec_drain;    // caused by p2d_drain
  output          cib2eil_ihb_pe_drain;
  output          cib2eil_pec_drain;
  
  //------------------------------------------------------------------------
  //  DCM interface
  //------------------------------------------------------------------------

  input pec_int_en_pec_hw_read;  // This signal provides the current value of
                                // pec_int_en_pec.
  input  pec_int_en_pec_ilu_hw_read;  // data bus for hw loading of
                                     // pec_int_en_pec_ilu.
  input  pec_int_en_pec_ue_hw_read;  // data bus for hw loading of
                                    // pec_int_en_pec_ue.
  input  pec_int_en_pec_ce_hw_read;  // data bus for hw loading of
                                      // pec_int_en_pec_ce.
  input  pec_int_en_pec_oe_hw_read;  // data bus for hw loading of
                                    // pec_int_en_pec_oe.
  output [0:0] pec_en_err_ilu_ext_read_data;  // Ext read data (decode)
  output [0:0] pec_en_err_ue_ext_read_data;  // Ext read data (decode)
  output [0:0] pec_en_err_ce_ext_read_data;  // Ext read data (decode)
  output [0:0] pec_en_err_oe_ext_read_data;  // Ext read data (decode)

  input        ilu_int_en_spare3_s_hw_read;  // This signal provides the current value
                                             // of ilu_int_en_spare3_s.
  input        ilu_int_en_spare2_s_hw_read;  // This signal provides the current value
                                             // of ilu_int_en_spare2_s.
  input        ilu_int_en_spare1_s_hw_read;  // This signal provides the current value
                                             // of ilu_int_en_spare1_s.
  input        ilu_int_en_ihb_pe_s_hw_read;  // This signal provides the current value
                                             // of ilu_int_en_ihb_pe_s.
  input        ilu_int_en_spare3_p_hw_read;  // This signal provides the current value
                                             // of ilu_int_en_spare3_p.
  input        ilu_int_en_spare2_p_hw_read;  // This signal provides the current value
                                             // of ilu_int_en_spare2_p.
  input        ilu_int_en_spare1_p_hw_read;  // This signal provides the current value
                                             // of ilu_int_en_spare1_p.
  input        ilu_int_en_ihb_pe_p_hw_read;  // This signal provides the current value
                                             // of ilu_int_en_ihb_pe_p.
  input        ilu_log_en_spare3_hw_read;  // This signal provides the current value of
                                             // ilu_log_en_spare3.
  input        ilu_log_en_spare2_hw_read;  // This signal provides the current value of
                                             // ilu_log_en_spare2.
  input        ilu_log_en_spare1_hw_read;  // This signal provides the current value of
                                   // ilu_log_en_spare1.
  input        ilu_log_en_ihb_pe_hw_read;  // This signal provides the current value of
                                   // ilu_log_en_ihb_pe.
  output [0:0] ilu_en_err_spare3_s_ext_read_data;  // Ext read data (decode)
  output [0:0] ilu_en_err_spare2_s_ext_read_data;  // Ext read data (decode)
  output [0:0] ilu_en_err_spare1_s_ext_read_data;  // Ext read data (decode)
  output [0:0] ilu_en_err_ihb_pe_s_ext_read_data;  // Ext read data (decode)
  output [0:0] ilu_en_err_spare3_p_ext_read_data;  // Ext read data (decode)
  output [0:0] ilu_en_err_spare2_p_ext_read_data;  // Ext read data (decode)
  output [0:0] ilu_en_err_spare1_p_ext_read_data;  // Ext read data (decode)
  output [0:0] ilu_en_err_ihb_pe_p_ext_read_data;  // Ext read data (decode)
  output       ilu_log_err_spare3_s_hw_set;  // Hardware set signal for
                                     // ilu_log_err_spare3_s. When set
                                     // ilu_log_err will be set to one.
  input        ilu_log_err_spare3_s_hw_read;  // This signal provides the current value
                                      // of ilu_log_err_spare3_s.
  output       ilu_log_err_spare2_s_hw_set;  // Hardware set signal for
                                     // ilu_log_err_spare2_s. When set
                                     // ilu_log_err will be set to one.
  input        ilu_log_err_spare2_s_hw_read;  // This signal provides the current value
                                      // of ilu_log_err_spare2_s.
  output       ilu_log_err_spare1_s_hw_set;  // Hardware set signal for
                                     // ilu_log_err_spare1_s. When set
                                     // ilu_log_err will be set to one.
  input        ilu_log_err_spare1_s_hw_read;  // This signal provides the current value
                                      // of ilu_log_err_spare1_s.
  output       ilu_log_err_ihb_pe_s_hw_set;  // Hardware set signal for
                                     // ilu_log_err_ihb_pe_s. When set
                                     // ilu_log_err will be set to one.
  input        ilu_log_err_ihb_pe_s_hw_read;  // This signal provides the current value
                                      // of ilu_log_err_ihb_pe_s.
  output       ilu_log_err_spare3_p_hw_set;  // Hardware set signal for
                                     // ilu_log_err_spare3_p. When set
                                     // ilu_log_err will be set to one.
  input        ilu_log_err_spare3_p_hw_read;  // This signal provides the current value
                                      // of ilu_log_err_spare3_p.
  output       ilu_log_err_spare2_p_hw_set;  // Hardware set signal for
                                     // ilu_log_err_spare2_p. When set
                                     // ilu_log_err will be set to one.
  input        ilu_log_err_spare2_p_hw_read;  // This signal provides the current value
                                      // of ilu_log_err_spare2_p.
  output       ilu_log_err_spare1_p_hw_set;  // Hardware set signal for
                                     // ilu_log_err_spare1_p. When set
                                     // ilu_log_err will be set to one.
  input        ilu_log_err_spare1_p_hw_read;  // This signal provides the current value
                                      // of ilu_log_err_spare1_p.
  output       ilu_log_err_ihb_pe_p_hw_set;  // Hardware set signal for
                                     // ilu_log_err_ihb_pe_p. When set
                                     // ilu_log_err will be set to one.
  input        ilu_log_err_ihb_pe_p_hw_read;  // This signal provides the current value
                                      // of ilu_log_err_ihb_pe_p.
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  reg 	          y2k_int_l;
  reg             ihb_pe_drain_reg; // set & hold, used for drain signals
  reg 		  ilu_ihb_pe_reg;  // on & off, used for setting CSR bit

  reg 		  ilu_spare3_err;
  reg 		  ilu_spare2_err;
  reg 		  ilu_spare1_err;

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - NON-FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  wire 		  pec_int;
  
  wire 		  il2il_int;
  wire 		  ue_int;
  wire 		  ce_int;
  wire 		  oe_int;
  wire 		  tlu_drain;

//  wire 		  to_drain;

  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL/Behavioral Model <<<<<<<<<<<<<<<<<<<<<<<<<<<

  //------------------------------------------------------------------------
  // drain state - 
  //------------------------------------------------------------------------
//  assign to_drain = iil2cib_ihb_pe | tlu_drain;

  always @ (posedge clk) begin
    if (~rst_l) ihb_pe_drain_reg <= 1'b0;
    else if (iil2cib_ihb_pe) ihb_pe_drain_reg <= 1'b1;
  end

  assign cib2iil_ihb_pe_drain = ihb_pe_drain_reg;
  assign cib2iil_pec_drain = tlu_drain; // sync flopped

  assign cib2eil_ihb_pe_drain = ihb_pe_drain_reg;
  assign cib2eil_pec_drain = tlu_drain; // tlu_drain is sync flopped
  
//  assign cib2iil_drain = drain_reg;
//  assign cib2eil_drain = drain_reg;
//  assign d2p_drain = drain_reg;

  //------------------------------------------------------------------------
  // ilu int, err
  //------------------------------------------------------------------------

  assign ilu_en_err_spare3_s_ext_read_data = ilu_int_en_spare3_s_hw_read & 
	                                     ilu_log_err_spare3_s_hw_read;
  assign ilu_en_err_spare2_s_ext_read_data = ilu_int_en_spare2_s_hw_read & 
	                                     ilu_log_err_spare2_s_hw_read;
  assign ilu_en_err_spare1_s_ext_read_data = ilu_int_en_spare1_s_hw_read & 
	                                     ilu_log_err_spare1_s_hw_read;
  assign ilu_en_err_ihb_pe_s_ext_read_data = ilu_int_en_ihb_pe_s_hw_read & 
	                                     ilu_log_err_ihb_pe_s_hw_read;
  assign ilu_en_err_spare3_p_ext_read_data = ilu_int_en_spare3_p_hw_read & 
	                                     ilu_log_err_spare3_p_hw_read;
  assign ilu_en_err_spare2_p_ext_read_data = ilu_int_en_spare2_p_hw_read & 
	                                     ilu_log_err_spare2_p_hw_read;
  assign ilu_en_err_spare1_p_ext_read_data = ilu_int_en_spare1_p_hw_read & 
	                                     ilu_log_err_spare1_p_hw_read;
  assign ilu_en_err_ihb_pe_p_ext_read_data = ilu_int_en_ihb_pe_p_hw_read & 
	                                     ilu_log_err_ihb_pe_p_hw_read;

  always @ (posedge clk) begin // iil2cib_ihb_pe is not flopped in iil
    if (~rst_l) ilu_ihb_pe_reg <= 1'b0;
    else if (iil2cib_ihb_pe) ilu_ihb_pe_reg <= 1'b1;
    else ilu_ihb_pe_reg <= 1'b0;
  end

  always @ (posedge clk) begin
    if (~rst_l) begin
      ilu_spare3_err <= 1'b0;
      ilu_spare2_err <= 1'b0;
      ilu_spare1_err <= 1'b0;
    end
    else begin
      ilu_spare3_err <= 1'b0;
      ilu_spare2_err <= 1'b0;
      ilu_spare1_err <= 1'b0;
    end
  end
       
  assign ilu_log_err_spare3_s_hw_set = ilu_log_err_spare3_p_hw_read & ilu_spare3_err
	                               & ilu_log_en_spare3_hw_read;
  assign ilu_log_err_spare2_s_hw_set = ilu_log_err_spare2_p_hw_read & ilu_spare2_err
                                       & ilu_log_en_spare2_hw_read;
  assign ilu_log_err_spare1_s_hw_set = ilu_log_err_spare1_p_hw_read & ilu_spare1_err
	                               & ilu_log_en_spare1_hw_read;
  assign ilu_log_err_ihb_pe_s_hw_set = ilu_log_err_ihb_pe_p_hw_read & ilu_ihb_pe_reg
	                               & ilu_log_en_ihb_pe_hw_read;
  
  assign ilu_log_err_spare3_p_hw_set = ~ilu_log_err_spare3_p_hw_read & ilu_spare3_err
	                               & ilu_log_en_spare3_hw_read;
  assign ilu_log_err_spare2_p_hw_set = ~ilu_log_err_spare2_p_hw_read & ilu_spare2_err
                                       & ilu_log_en_spare2_hw_read;
  assign ilu_log_err_spare1_p_hw_set = ~ilu_log_err_spare1_p_hw_read & ilu_spare1_err
	                               & ilu_log_en_spare1_hw_read;
  assign ilu_log_err_ihb_pe_p_hw_set = ~ilu_log_err_ihb_pe_p_hw_read & ilu_ihb_pe_reg
	                               & ilu_log_en_ihb_pe_hw_read;

  //------------------------------------------------------------------------
  // PEC core int, err
  //------------------------------------------------------------------------
  assign il2il_int = ilu_en_err_spare3_s_ext_read_data |
	 ilu_en_err_spare2_s_ext_read_data |
	 ilu_en_err_spare1_s_ext_read_data |
	 ilu_en_err_ihb_pe_s_ext_read_data |
	 ilu_en_err_spare3_p_ext_read_data |
	 ilu_en_err_spare2_p_ext_read_data |
	 ilu_en_err_spare1_p_ext_read_data |
	 ilu_en_err_ihb_pe_p_ext_read_data;
  
  assign pec_en_err_ilu_ext_read_data = pec_int_en_pec_hw_read &
	 pec_int_en_pec_ilu_hw_read &
	 il2il_int;

  assign pec_en_err_ue_ext_read_data = pec_int_en_pec_hw_read & 
	 pec_int_en_pec_ue_hw_read &
	 ue_int;

  assign pec_en_err_ce_ext_read_data = pec_int_en_pec_hw_read & 
	 pec_int_en_pec_ce_hw_read &
	 ce_int;

  assign pec_en_err_oe_ext_read_data = pec_int_en_pec_hw_read & 
	 pec_int_en_pec_oe_hw_read &
	 oe_int;

  assign pec_int = pec_en_err_ilu_ext_read_data |
	 pec_en_err_ue_ext_read_data |
	 pec_en_err_ce_ext_read_data |
	 pec_en_err_oe_ext_read_data;

  always @ (posedge clk) begin
    if (!rst_l) begin
      y2k_int_l <= 1'b1;
    end
    else begin
      y2k_int_l <= ~pec_int;
    end
  end
  
//BP N2 3-10-05 add signals to dbg after synchronizers  
assign	dbg_ue_int	= ue_int;
assign	dbg_ce_int	= ce_int;
assign	dbg_oe_int	= oe_int;
  // >>>>>>>>>>>>>>>>>>>>>>>>> Instantiations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  // sync-flop instantiations for p2d_ue_int
//  pcie_common_sync_flop #(1) ue_int_sync_flop(
//                                              .clk(clk),
//                                              .din(p2d_ue_int),
//                                              .dout(ue_int));
  cl_a1_clksyncff_4x ue_int_sync_flop ( .d(p2d_ue_int), .si(1'b0), .q( ue_int), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );


  // sync-flop instantiations for p2d_ce_int
//  pcie_common_sync_flop #(1) ce_int_sync_flop(
//                                              .clk(clk),
//                                              .din(p2d_ce_int),
//                                              .dout(ce_int));
 cl_a1_clksyncff_4x ce_int_sync_flop ( .d(p2d_ce_int), .si(1'b0), .q( ce_int), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );


  // sync-flop instantiations for p2d_oe_int
//  pcie_common_sync_flop #(1) oe_int_sync_flop(
//                                              .clk(clk),
//                                              .din(p2d_oe_int),
//                                              .dout(oe_int));
  cl_a1_clksyncff_4x oe_int_sync_flop ( .d(p2d_oe_int), .si(1'b0), .q( oe_int), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );


  // sync-flop instantiations for p2d_mps
//  pcie_common_sync_flop #(`FIRE_P2D_MPS_WDTH) mps_sync_flop(
//							    .clk(clk),
//							    .din(p2d_mps),
//							    .dout(y2k_mps));
  cl_a1_clksyncff_4x mps_sync_flop_2 ( .d(p2d_mps[2]), .si(1'b0), .q( y2k_mps[2]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x mps_sync_flop_1 ( .d(p2d_mps[1]), .si(1'b0), .q( y2k_mps[1]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x mps_sync_flop_0 ( .d(p2d_mps[0]), .si(1'b0), .q( y2k_mps[0]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );

  // sync-flop instantiations for p2d_drain
//  pcie_common_sync_flop #(1) drain_sync_flop(
//                                              .clk(clk),
//                                              .din(p2d_drain),
//                                              .dout(tlu_drain));
  cl_a1_clksyncff_4x drain_sync_flop ( .d(p2d_drain), .si(1'b0), .q( tlu_drain), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );

					      
					      
endmodule // dmu_ilu_cib_cim



