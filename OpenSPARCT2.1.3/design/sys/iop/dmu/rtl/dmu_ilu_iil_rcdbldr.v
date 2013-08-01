// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_ilu_iil_rcdbldr.v
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
module dmu_ilu_iil_rcdbldr (
				 clk,
				 rst_l,

				 p2d_ihb_data,
				 y2k_rcd,
			 
				 iil2isb_tag,
				 isb2iil_low_addr,

				 ihb_rcd_is_cpl,
				 credit_type,

				 is_ihb_rcd,
				 is_cto_rcd,
				 pio_tag_gen,
				 
				 in_ihb_rcd);
 
  // >>>>>>>>>>>>>>>>>>>>>>>>> Parameter Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // rcd type
  parameter   DMA_MRD     = 7'b0z00000,
              DMA_MRDLK   = 7'b0z00001,
              DMA_MWR     = 7'b1z00000,
              DMA_IORD    = 7'b0000010,
              DMA_IOWR    = 7'b1000010,
              DMA_CFGRD   = 7'b000010z,
              DMA_CFGWR   = 7'b100010z,
              DMA_MSG     = 7'b0110zzz,
              PIO_CPL     = 7'b0001010,
              PIO_CPLD    = 7'b1001010;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  //---------------------------------------------------------------------
  //  Clock and Reset Signals
  //---------------------------------------------------------------------
  input		  clk;		    // input clock
  input		  rst_l;	    // synchronous reset
    
  //---------------------------------------------------------------------
  //   IHB and IHB management interface
  //---------------------------------------------------------------------  
  input  [`FIRE_IHB_REC_WDTH-1:0]  p2d_ihb_data;     // TLP header record
    
  //---------------------------------------------------------------------
  //   record interface to TMU
  //---------------------------------------------------------------------
  output [`FIRE_DLC_IPE_REC_WDTH-1:0]  y2k_rcd;      // ingress PEC record
  
  //---------------------------------------------------------------------
  //   sub-block to sub-block interface
  //---------------------------------------------------------------------
  output [4:0] 	  iil2isb_tag;
  input [3:2] 	  isb2iil_low_addr;
  
  //---------------------------------------------------------------------
  //   type decoder outputs
  //---------------------------------------------------------------------
  output 	  ihb_rcd_is_cpl;      //                             to *_xfrfsm.v
  output [1:0] 	  credit_type;         // header type,                to *_crdtcnt.v

  //---------------------------------------------------------------------
  //   info from *_xfrfsm.v
  //---------------------------------------------------------------------
  input 	  is_ihb_rcd;          // in-process rcd a ihb rcd,  from *_xfrfsm.v
  input 	  is_cto_rcd;          // in-process rcd a CTO rcd,  from *_xfrfsm.v
  input [4:0]	  pio_tag_gen;         // pio_tag for cpl generator, from *_xfrfsm.v

  //---------------------------------------------------------------------
  //   talk to parchk
  //---------------------------------------------------------------------
  output [`FIRE_IHB_REC_WDTH-1:0] in_ihb_rcd;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  reg [`FIRE_IHB_REC_WDTH-1:0]      in_ihb_rcd;
  reg [`FIRE_DLC_IPE_REC_WDTH-1:0]  y2k_rcd;

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - NON-FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~
  reg 				    ihb_rcd_is_cpl;
  reg 				    is_unsupported_req;
  reg [1:0] 			    credit_type;
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  wire [`FIRE_DLC_IPE_REC_WDTH-1:0]     n_y2k_rcd;
  
  //---------------------------------------------------------------------
  // In record (IHB) fields
  //---------------------------------------------------------------------
  wire [`FIRE_IHB_2DWH_WDTH-1:0]        in_rcd_2dwh;
  wire [`FIRE_IHB_3DWH_WDTH-1:0]        in_rcd_3dwh;
  wire [`FIRE_IHB_4DWH_WDTH-1:2]        in_rcd_4dwh;  // strip off 2-LSB

  //---------------------------------------------------------------------
  // Out record (ingress PEC) fields
  //---------------------------------------------------------------------
  wire [`FIRE_DLC_IPE_ADDR_WDTH-1:30] 	out_rcd_addr_hi; // shared 

  wire [29:0] 				out_ihb_rcd_addr_lo; // to be muxed
    
  wire [`FIRE_DLC_IPE_LEN_WDTH-1:0] 	out_rcd_len; // shared 
  wire [`FIRE_DLC_IPE_ATR_WDTH-1:0] 	out_rcd_atr; // shared 
  wire [`FIRE_DLC_IPE_TC_WDTH-1:0] 	out_rcd_tc; // shared 
  
  wire [`FIRE_DLC_IPE_TYPE_WDTH-1:0] 	out_ihb_rcd_type; // to be muxed
  wire [`FIRE_DLC_IPE_F_WDTH-1:0] 	out_ihb_rcd_f; // to be muxed
  wire [2:0] 				out_ihb_cpl_status; // to be muxed

  wire [5:2] 				align_addr;
 
  //---------------------------------------------------------------------
  // new generated PIO cpl rcd
  //---------------------------------------------------------------------
  wire [2:0] 				gen_cpl_rcd_status;
  wire [29:0] 				gen_cpl_rcd_addr_lo;

  //---------------------------------------------------------------------
  // type decoder
  //---------------------------------------------------------------------
  wire [6:0] 				in_rcd_type;
  wire [2:0] 				in_rcd_cpl_status;
  wire [4:0] 				in_rcd_pio_tag;
  
  wire 					is_successful_pio_cpl;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Zero In Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  // 0in known_driven -var is_ihb_rcd
  // 0in known_driven -var is_cto_rcd
  // 0in bits_on -var credit_type -max 1 -active is_ihb_rcd -message "illegal credit_type"
  // 0in bits_on -var {ihb_rcd_is_cpl, is_unsupported_req} -max 1 -active is_ihb_rcd

  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL/Behavioral Model <<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  //---------------------------------------------------------------------
  // In record fields
  //---------------------------------------------------------------------
  assign in_rcd_2dwh = in_ihb_rcd[`FIRE_IHB_2DWH_MSB:`FIRE_IHB_2DWH_LSB];
  assign in_rcd_3dwh = in_ihb_rcd[`FIRE_IHB_3DWH_MSB:`FIRE_IHB_3DWH_LSB];
  assign in_rcd_4dwh = in_ihb_rcd[`FIRE_IHB_4DWH_MSB:`FIRE_IHB_4DWH_LSB+2];

  //---------------------------------------------------------------------
  // type decoder
  //---------------------------------------------------------------------
  
  assign in_rcd_type = in_ihb_rcd[`FIRE_IHB_1DWH_MSB-1:`FIRE_IHB_1DWH_MSB-7];
  
  assign in_rcd_cpl_status = in_rcd_2dwh[15:13];
  assign in_rcd_pio_tag = in_rcd_3dwh[12:8];
  assign is_successful_pio_cpl = ~(|in_rcd_cpl_status);
  assign iil2isb_tag = is_ihb_rcd ? in_rcd_pio_tag : pio_tag_gen;

  always @ (in_rcd_type)
    begin
      ihb_rcd_is_cpl = 1'b0;
      is_unsupported_req = 1'b0;
      credit_type = 2'b0;

      casez (in_rcd_type) // 0in < case -parallel -full -active is_ihb_rcd
	DMA_MRD,
	DMA_MRDLK: credit_type = 2'b10;

	DMA_MWR,
	DMA_MSG: credit_type = 2'b01;

	DMA_IORD,
	DMA_CFGRD, 
	DMA_IOWR,
	DMA_CFGWR:
	  begin
	    is_unsupported_req = 1'b1;
	    credit_type = 2'b10;
	  end

	PIO_CPL,
	PIO_CPLD: 
	  begin
	    ihb_rcd_is_cpl = 1'b1;
	  end
      endcase // casez(in_rcd_type)
    end
  

  //---------------------------------------------------------------------
  // new rcd fields based on IHB rcd
  //---------------------------------------------------------------------
  
  assign out_ihb_rcd_f = is_unsupported_req ? 
			   2'b00 : in_rcd_type[6:5];
  assign out_ihb_rcd_type = is_unsupported_req ? 5'b01001 : in_rcd_type[4:0];
	
  assign out_rcd_tc = in_ihb_rcd[`FIRE_IHB_1DWH_LSB+22:`FIRE_IHB_1DWH_LSB+20];

  assign out_rcd_atr = in_ihb_rcd[`FIRE_IHB_1DWH_LSB+13:`FIRE_IHB_1DWH_LSB+12];
  assign out_rcd_len = in_ihb_rcd[`FIRE_IHB_1DWH_LSB+9:`FIRE_IHB_1DWH_LSB];

  assign out_rcd_addr_hi = in_rcd_type[5] ? in_rcd_3dwh : 32'b0;
  
  assign align_addr = ihb_rcd_is_cpl ? {2'b0, isb2iil_low_addr[3:2]} : in_rcd_3dwh[5:2];
  
  assign out_ihb_rcd_addr_lo = in_rcd_type[5] ? in_rcd_4dwh : 
	                                       {in_rcd_3dwh[31:6], align_addr};
  
  // --------------------------------------------------------------------------
  // According to the PCI-Express spec, all reserved status values 
  // (i.e. 011, 101, 110, and 111) must be treated as "Unsupported Request". 
  // Moreover, CLU maps the two unreserved status (unsupported request and 
  // completer abort) to JBUS bus error. Therefore, ILU traps PIO Cpl with 
  // configuration retry status (TLU takes care of it); converts PIO Cpl with 
  // status other that succesful to unsupported request status
  // --------------------------------------------------------------------------
  assign out_ihb_cpl_status = is_successful_pio_cpl ? in_rcd_cpl_status : 3'b001;
  
  //---------------------------------------------------------------------
  // IIL sourced PIO Cpl rcd fields  - new generated PIO cpl rcd, status is
  //       "UR" (3'b001) if it is in drain state,
  //       "TO" (3'b111 FIRE internal value) if it serves a CTO request from TLU
  //---------------------------------------------------------------------
  assign gen_cpl_rcd_status = is_cto_rcd ? 3'b111 : 3'b001;
  
  assign gen_cpl_rcd_addr_lo = {{`FIRE_DLC_IPE_REQID_WDTH{1'b0}},
				{3'b0, pio_tag_gen},
				pio_tag_gen, pio_tag_gen[0]}; 
  // pio_tag_gen is used to fill rsv fields on the last line above

  //---------------------------------------------------------------------
  // n_y2k_rcd 
  //---------------------------------------------------------------------
  assign n_y2k_rcd = {(is_ihb_rcd ? {out_ihb_rcd_f, out_ihb_rcd_type} : 7'b0001010),
		      out_rcd_tc, 
		      out_rcd_atr, 
		      out_rcd_len,
		      in_rcd_2dwh[31:16], // req_id
		      (is_ihb_rcd ? (ihb_rcd_is_cpl ? out_ihb_cpl_status : 
				     in_rcd_2dwh[15:13]) :
		       gen_cpl_rcd_status),
		      in_rcd_2dwh[12:0],
		      out_rcd_addr_hi,
		      (is_ihb_rcd ? out_ihb_rcd_addr_lo : gen_cpl_rcd_addr_lo) };		    

  always @ (posedge clk)
	if(~rst_l) begin
      in_ihb_rcd <= {`FIRE_IHB_REC_WDTH{1'b0}};
      y2k_rcd <= {`FIRE_DLC_IPE_REC_WDTH{1'b0}};
   end
    else begin
      in_ihb_rcd <= p2d_ihb_data;
      y2k_rcd <= n_y2k_rcd;
    end

  // >>>>>>>>>>>>>>>>>>>>>>>>> Instantiations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
endmodule // dmu_ilu_iil_rcdbldr

