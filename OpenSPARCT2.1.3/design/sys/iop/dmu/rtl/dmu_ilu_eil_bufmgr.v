// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_ilu_eil_bufmgr.v
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
module dmu_ilu_eil_bufmgr (
				clk,
				rst_l,
				
				d2p_ehb_addr,
				
				d2p_ech_wptr,
				d2p_erh_wptr,
				p2d_ech_rptr,
				p2d_erh_rptr,
				
				p2d_ecd_rptr,
				p2d_erd_rptr,
				
				cib2eil_drain,
                                cib2eil_pec_drain,
				
				rcd_is_cpl,
				rcd_is_cpl_reg,
				edb_wptr,
				
				n_d2p_ehb_we,
				edb_wptr_inc,
				
				ehb_full,
				ecd_full,
				erd_full,
				edb_full_adv,
				
				// debug signals 
				erh_full,
				ech_full,
				erd_full_adv,
				ecd_full_adv,
				il2cl_gr_16 );
  
  // synopsys sync_set_reset "rst_l"

  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  //------------------------------------------------------------------------
  //  Clock and Reset Signals
  //------------------------------------------------------------------------
  input           clk;	             // input clock
  input 	  rst_l;	     // input reset
  
  //------------------------------------------------------------------------
  // EHB interface
  //------------------------------------------------------------------------ 
  output [5:0] 	  d2p_ehb_addr;      // EHB write pointer

  //------------------------------------------------------------------------
  // EHB interface
  //------------------------------------------------------------------------ 
  output  	  il2cl_gr_16;      // for stall

  //------------------------------------------------------------------------
  // EHB management pointers
  //------------------------------------------------------------------------  
  output [5:0] 	  d2p_ech_wptr;      // gray-coded cpl-buffer in EHB write pointer
  input [5:0] 	  p2d_ech_rptr;      // gray-coded cpl-buffer in EHB read pointer
  output [5:0] 	  d2p_erh_wptr;      // gray-coded req-buffer in EHB write pointer
  input [5:0] 	  p2d_erh_rptr;      // gray-coded req-buffer in EHB read pointer

  //------------------------------------------------------------------------
  // EDB management pointers
  //------------------------------------------------------------------------
  input [`FIRE_P2D_ECD_RPTR_WDTH-1:0]  p2d_ecd_rptr; // gray-coded EDB DMA Cpl buf rd pointer
  input [`FIRE_P2D_ERD_RPTR_WDTH-1:0]  p2d_erd_rptr; // gray-coded EDB PIO Wr buf rd pointer

  //------------------------------------------------------------------------
  // special handling
  //------------------------------------------------------------------------ 
  input           cib2eil_drain;            // combined drain signal
  input           cib2eil_pec_drain;        // caused by p2d_drain


  //------------------------------------------------------------------------
  // internal interface
  //------------------------------------------------------------------------ 
  input 	  n_d2p_ehb_we;     // EHB write stroke,         from xfrfsm.v
  input 	  edb_wptr_inc;     // increase EDB buffer wptr, from datafsm
  output [7:0]	  edb_wptr;         // to be injected to datapath, to datafsm
  input 	  rcd_is_cpl;       // 1- DMA cpl; 0- PIO req,   from rcdbldr.v
  input 	  rcd_is_cpl_reg;   // 1- DMA cpl; 0- PIO req,   from rcdbldr.v
  output 	  ehb_full;         // EHB full based on rcd type, to xfrfsm.v
  output 	  ecd_full;         // EDB/ECD full to datafsm.v
  output 	  erd_full;         // EDB/ERD full to datafsm.v
  output 	  edb_full_adv;
  
  //---------------------------------------------------------------------
  //  debug signals
  //---------------------------------------------------------------------
  output 	  erh_full;
  output 	  ech_full;
  output 	  erd_full_adv;
  output 	  ecd_full_adv;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
  //------------------------------------------------------------------------
  // EDB management
  // -----------------------------------------------------------------------
  reg [7:0] 	  ecd_wptr;  // EDB cpl buffer wptr, [7] - roll over
  reg [7:0] 	  erd_wptr;  // EDB req buffer wptr, [7] - roll over
  
  //------------------------------------------------------------------------
  // EHB management
  // -----------------------------------------------------------------------
  reg [5:0] 	  d2p_ehb_addr;
  reg [5:0] 	  d2p_erh_wptr;         // gray-coded flop
  reg [5:0] 	  d2p_ech_wptr;         // gray-coded flop
  reg [5:0] 	  erh_wptr;             // binary pointer
  reg [5:0] 	  ech_wptr;             // binary pointer
  reg [5:0] 	  erh_rptr;             // binary pointer
  reg [5:0] 	  ech_rptr;             // binary pointer
  reg [7:0] 	  erd_rptr;             // binary pointer
  reg [7:0] 	  ecd_rptr;             // binary pointer

  // for advanced edb fullness check
  reg [7:0] 	  erd_wptr_adv;
  reg [7:0] 	  ecd_wptr_adv;

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - NON-FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~

  wire 		  ech_full;
  wire 		  erh_full;

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
  wire [5:0] 	  n_d2p_erh_wptr;     // gray-coded
  wire [5:0] 	  n_d2p_ech_wptr;     // gray-coded
  wire [5:0] 	  n_d2p_ehb_addr;     // binary write pointer to EHB
  
  wire [5:0] 	  gray_erh_rptr;      // output from sync-flop
  wire [5:0] 	  gray_ech_rptr;      // output from sync-flop
  wire [5:0] 	  n_erh_rptr;         // binary pointer
  wire [5:0] 	  n_ech_rptr;         // binary pointer

  wire [7:0] 	  gray_erd_rptr;      // output from sync-flop
  wire [7:0] 	  gray_ecd_rptr;      // output from sync-flop
  wire [7:0] 	  n_erd_rptr;         // binary pointer
  wire [7:0] 	  n_ecd_rptr;         // binary pointer

  wire 		  ld_ech_wptr;
  wire 		  ld_erh_wptr;

  wire 		  ld_ecd_wptr;
  wire 		  ld_erd_wptr;

  // for advanced edb fullness check
  wire 		  erd_full_adv;
  wire 		  ecd_full_adv;
	 
  // >>>>>>>>>>>>>>>>>>>>>>>>> Zero In Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


  // >>>>>>>>>>>>>>>>>>>>>>>>> Function Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<
   
  // converts gray-coded to binary-coded (6-bit wide)
  function [5:0] gray2bin6;
    input [5:0] gray;
    integer i;
    reg temp;
    begin
      temp = 0;
      for (i=5; i>=0; i=i-1)
        begin	
	  temp = temp ^ gray[i];
          gray2bin6[i] = temp;
        end
    end
  endfunction // gray2bin6

  // converts gray-coded to binary-coded (8-bit wide)
  function [7:0] gray2bin8;
    input [7:0] gray;
    integer i;
    reg temp;
    begin
      temp = 0;
      for (i=7; i>=0; i=i-1)
        begin	
	  temp = temp ^ gray[i];
          gray2bin8[i] = temp;
        end
    end
  endfunction // gray2bin8
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL/Behavioral Model <<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // 0in known_driven -var ld_ech_wptr
  // 0in known_driven -var ld_erh_wptr
  // 0in known_driven -var ld_ecd_wptr
  // 0in known_driven -var ld_erd_wptr
     
  //------------------------------------------------------------------------
  // EHB management
  //------------------------------------------------------------------------

  // convert binary to gray-coded
  assign n_d2p_erh_wptr = (erh_wptr >> 1) ^ erh_wptr;   
  assign n_d2p_ech_wptr = (ech_wptr >> 1) ^ ech_wptr;

  // write pointer to EHB
  assign n_d2p_ehb_addr = rcd_is_cpl ? {1'b0, ech_wptr[4:0]} : 
                                       {1'b1, erh_wptr[4:0]};

  // convert gray-coded to binary
  assign n_erh_rptr = gray2bin6(gray_erh_rptr);
  assign n_ech_rptr = gray2bin6(gray_ech_rptr);

//BPn2 12-16-05  check for 16 or less entries in ehb and stall crm arb 
reg		gr_16;
  // create some constants which are easy to change with eco
reg	[4:0]	fifteen,sixteen;
  always @ (posedge clk)
	if(~rst_l) begin
      fifteen <= {5'b01111};
      sixteen <= {5'b10000};
    end
    else begin
      fifteen <= {5'b01111};
      sixteen <= {5'b10000};
    end
wire	il2cl_gr_16 = gr_16 & ~(cib2eil_drain | cib2eil_pec_drain) ;
always @(erh_wptr or erh_rptr or sixteen or fifteen ) begin
	gr_16 = 1'b0;
	
	case({erh_wptr[5],erh_rptr[5]})
	2'b00:	if ( (erh_wptr[4:0] - erh_rptr[4:0]) <= sixteen )	//
		gr_16 = 1'b0;
		else 
		gr_16 = 1'b1;

	2'b01:	if ( ( (5'b11111 - erh_rptr[4:0]) + erh_wptr[4:0]) <= fifteen )
		gr_16 = 1'b0;
		else 
		gr_16 = 1'b1;

	2'b10:	if ( ( (5'b11111 - erh_rptr[4:0]) + erh_wptr[4:0]) <= fifteen )
		gr_16 = 1'b0;
		else 
		gr_16 = 1'b1;


	2'b11:	if ( (erh_wptr[4:0] - erh_rptr[4:0]) <= sixteen )
		gr_16 = 1'b0;
		else 
		gr_16 = 1'b1;

	endcase
end




  // EHB fullness
  assign erh_full = (erh_wptr[4:0] == erh_rptr[4:0]) & (erh_wptr[5] ^ erh_rptr[5]);
  assign ech_full = (ech_wptr[4:0] == ech_rptr[4:0]) & (ech_wptr[5] ^ ech_rptr[5]);
  assign ehb_full = (rcd_is_cpl ? ech_full : erh_full) & (~cib2eil_drain);

  // load signals
  assign ld_ech_wptr = n_d2p_ehb_we & rcd_is_cpl;
  assign ld_erh_wptr = n_d2p_ehb_we & !rcd_is_cpl;
  
  // EHB pointers
  always @ (posedge clk)
	if(~rst_l) begin
      erh_rptr <= {6{1'b0}};
      ech_rptr <= {6{1'b0}};
    end
    else begin
      erh_rptr <= n_erh_rptr;
      ech_rptr <= n_ech_rptr;
    end
  
  always @ (posedge clk)
    if ((!rst_l) | cib2eil_pec_drain) begin
      erh_wptr <= 6'b0;
      ech_wptr <= 6'b0;
    end
    else begin
      if (ld_ech_wptr) begin 
	ech_wptr <= ech_wptr + 1'b1;
      end
      else if (ld_erh_wptr) begin
	erh_wptr <= erh_wptr + 1'b1;
      end
    end

  // bug fix P544 
  always @ (posedge clk) 
	if(~rst_l) begin
    d2p_ech_wptr <= {6{1'b0}};
    d2p_erh_wptr <= {6{1'b0}};
    d2p_ehb_addr <= {6{1'b0}};
	end
	else begin
    d2p_ech_wptr <= n_d2p_ech_wptr;
    d2p_erh_wptr <= n_d2p_erh_wptr;
    d2p_ehb_addr <= n_d2p_ehb_addr;
  end
     
  //------------------------------------------------------------------------
  // EDB management
  //------------------------------------------------------------------------

  // write pointer to EDB
  assign edb_wptr = rcd_is_cpl_reg ? {1'b0, ecd_wptr[6:0]} : 
                                 {1'b1, erd_wptr[6:0]};

  // convert gray-coded to binary
  assign n_erd_rptr = gray2bin8(gray_erd_rptr);
  assign n_ecd_rptr = gray2bin8(gray_ecd_rptr);

  // EDB fullness
  assign erd_full_adv = (erd_wptr_adv[6:0] == erd_rptr[6:0]) & 
			  (erd_wptr_adv[7] ^ erd_rptr[7]);
  assign ecd_full_adv = (ecd_wptr_adv[6:0] == ecd_rptr[6:0]) & 
			  (ecd_wptr_adv[7] ^ ecd_rptr[7]);
  assign edb_full_adv = rcd_is_cpl ? ecd_full_adv : erd_full_adv;
	 
  assign erd_full = (erd_wptr[6:0] == erd_rptr[6:0]) & 
		      (erd_wptr[7] ^ erd_rptr[7]);
  assign ecd_full = (ecd_wptr[6:0] == ecd_rptr[6:0]) & 
		      (ecd_wptr[7] ^ ecd_rptr[7]);

  // load signals
  assign ld_ecd_wptr = edb_wptr_inc & rcd_is_cpl_reg;
  assign ld_erd_wptr = edb_wptr_inc & !rcd_is_cpl_reg;
  
  // EDB pointers
  always @ (posedge clk)
	if(~rst_l) begin
      erd_rptr <= {8{1'b0}};
      ecd_rptr <= {8{1'b0}};
    end
    else begin
      erd_rptr <= n_erd_rptr;
      ecd_rptr <= n_ecd_rptr;
    end
  
  always @ (posedge clk)
    if ((!rst_l) | cib2eil_pec_drain) begin
      erd_wptr <= 8'b0;
      ecd_wptr <= 8'b0;
      erd_wptr_adv <= 8'b1;
      ecd_wptr_adv <= 8'b1;
    end
    else begin
      if (ld_ecd_wptr) begin 
	ecd_wptr <= ecd_wptr + 1'b1;
	ecd_wptr_adv <= ecd_wptr_adv + 1'b1;
      end
      else if (ld_erd_wptr) begin 
	erd_wptr <= erd_wptr + 1'b1;
	erd_wptr_adv <= erd_wptr_adv + 1'b1;
      end
    end
   
			   
  // >>>>>>>>>>>>>>>>>>>>>>>>> Instantiations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  // sync-flop instantiations for p2d_erh_rptr
//  pcie_common_sync_flop #(6) erh_sync_flop(
//                                           .clk(clk),
//                                           .din(p2d_erh_rptr),
//                                           .dout(gray_erh_rptr)); 
  cl_a1_clksyncff_4x erh_sync_flop_5 ( .d(p2d_erh_rptr[5]), .si(1'b0), .q( gray_erh_rptr[5]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x erh_sync_flop_4 ( .d(p2d_erh_rptr[4]), .si(1'b0), .q( gray_erh_rptr[4]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x erh_sync_flop_3 ( .d(p2d_erh_rptr[3]), .si(1'b0), .q( gray_erh_rptr[3]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x erh_sync_flop_2 ( .d(p2d_erh_rptr[2]), .si(1'b0), .q( gray_erh_rptr[2]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x erh_sync_flop_1 ( .d(p2d_erh_rptr[1]), .si(1'b0), .q( gray_erh_rptr[1]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x erh_sync_flop_0 ( .d(p2d_erh_rptr[0]), .si(1'b0), .q( gray_erh_rptr[0]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );

  // sync-flop instantiations for p2d_ech_rptr
//  pcie_common_sync_flop #(6) ech_sync_flop(
//                                           .clk(clk),
//                                           .din(p2d_ech_rptr),
//                                           .dout(gray_ech_rptr));
  cl_a1_clksyncff_4x ech_sync_flop_5 ( .d(p2d_ech_rptr[5]), .si(1'b0), .q( gray_ech_rptr[5]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x ech_sync_flop_4 ( .d(p2d_ech_rptr[4]), .si(1'b0), .q( gray_ech_rptr[4]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x ech_sync_flop_3 ( .d(p2d_ech_rptr[3]), .si(1'b0), .q( gray_ech_rptr[3]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x ech_sync_flop_2 ( .d(p2d_ech_rptr[2]), .si(1'b0), .q( gray_ech_rptr[2]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x ech_sync_flop_1 ( .d(p2d_ech_rptr[1]), .si(1'b0), .q( gray_ech_rptr[1]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x ech_sync_flop_0 ( .d(p2d_ech_rptr[0]), .si(1'b0), .q( gray_ech_rptr[0]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );

  // sync-flop instantiations for p2d_erd_rptr
//  pcie_common_sync_flop #(8) erd_sync_flop(
//                                           .clk(clk),
//                                           .din(p2d_erd_rptr),
//                                           .dout(gray_erd_rptr)); 
  cl_a1_clksyncff_4x erd_sync_flop_7 ( .d(p2d_erd_rptr[7]), .si(1'b0), .q( gray_erd_rptr[7]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x erd_sync_flop_6 ( .d(p2d_erd_rptr[6]), .si(1'b0), .q( gray_erd_rptr[6]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x erd_sync_flop_5 ( .d(p2d_erd_rptr[5]), .si(1'b0), .q( gray_erd_rptr[5]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x erd_sync_flop_4 ( .d(p2d_erd_rptr[4]), .si(1'b0), .q( gray_erd_rptr[4]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x erd_sync_flop_3 ( .d(p2d_erd_rptr[3]), .si(1'b0), .q( gray_erd_rptr[3]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x erd_sync_flop_2 ( .d(p2d_erd_rptr[2]), .si(1'b0), .q( gray_erd_rptr[2]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x erd_sync_flop_1 ( .d(p2d_erd_rptr[1]), .si(1'b0), .q( gray_erd_rptr[1]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x erd_sync_flop_0 ( .d(p2d_erd_rptr[0]), .si(1'b0), .q( gray_erd_rptr[0]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );

  // sync-flop instantiations for p2d_ecd_rptr
//  pcie_common_sync_flop #(8) ecd_sync_flop(
//                                           .clk(clk),
//                                           .din(p2d_ecd_rptr),
//                                           .dout(gray_ecd_rptr));
  cl_a1_clksyncff_4x ecd_sync_flop_7 ( .d(p2d_ecd_rptr[7]), .si(1'b0), .q( gray_ecd_rptr[7]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x ecd_sync_flop_6 ( .d(p2d_ecd_rptr[6]), .si(1'b0), .q( gray_ecd_rptr[6]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x ecd_sync_flop_5 ( .d(p2d_ecd_rptr[5]), .si(1'b0), .q( gray_ecd_rptr[5]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x ecd_sync_flop_4 ( .d(p2d_ecd_rptr[4]), .si(1'b0), .q( gray_ecd_rptr[4]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x ecd_sync_flop_3 ( .d(p2d_ecd_rptr[3]), .si(1'b0), .q( gray_ecd_rptr[3]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x ecd_sync_flop_2 ( .d(p2d_ecd_rptr[2]), .si(1'b0), .q( gray_ecd_rptr[2]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x ecd_sync_flop_1 ( .d(p2d_ecd_rptr[1]), .si(1'b0), .q( gray_ecd_rptr[1]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x ecd_sync_flop_0 ( .d(p2d_ecd_rptr[0]), .si(1'b0), .q( gray_ecd_rptr[0]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );


endmodule // dmu_ilu_eil_bufmgr
