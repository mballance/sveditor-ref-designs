// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_tmu_dim_rcdbldr.v
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
module dmu_tmu_dim_rcdbldr (
				 clk,
				 rst_l,
		     		 
				 // ilu <-> dmu-tmu
				 y2k_rcd,
				 y2k_rcd_enq,
				 
				 // RMU interface
				 tm2rm_rcd,
				 
				 // IMU interface
				 im2tm_msi32_addr_reg,
				 im2tm_msi64_addr_reg,

				 // internal interface
				 rcd_deq,
				 rcd_empty,
				 
				 rcd_is_msg, 
				 rcd_is_msi, 
				 rcd_is_cpld, 
				 rcd_is_dmawr,

				 align_addr,
				 payld_len,
				 d_ptr_out,
				 
				 first_dwbe,
				 last_dwbe,
				 csr_sun4v_en,
				 im2tm_eqs_adr_63
 );
  
  //synopsys sync_set_reset "rst_l"

  // >>>>>>>>>>>>>>>>>>>>>>>>> Parameter Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // rcd type
  parameter   
	      DMA_MRD32   = 7'b0000000,
	      DMA_MRD64   = 7'b0100000,
	      DMA_MRDLK32 = 7'b0000001,
	      DMA_MRDLK64 = 7'b0100001,
	      DMA_MWR32   = 7'b1000000,
	      DMA_MWR64   = 7'b1100000,
	      DMA_UR      = 7'b0001001,
	      DMA_MSG     = 7'b0110zzz,
	      PIO_CPL     = 7'b0001010,
	      PIO_CPLD    = 7'b1001010;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  

  //------------------------------------------------------------------------
  //  Clock and Reset Signals
  //------------------------------------------------------------------------
  input		  clk;		    
  input		  rst_l;
  
  //------------------------------------------------------------------------
  //   record interface to ILU
  //------------------------------------------------------------------------
  input [`FIRE_DLC_IPE_REC_WDTH-1:0]   y2k_rcd;             // ingress PEC record
  input 			       y2k_rcd_enq;         // ingress PEC record enqueue
  
  //------------------------------------------------------------------------
  //   RMU interface
  //------------------------------------------------------------------------
  output [`FIRE_DLC_DIM_REC_WDTH-1:0]  tm2rm_rcd;

  //------------------------------------------------------------------------
  //   IMU interface
  //------------------------------------------------------------------------
  input [`FIRE_DLC_SCW_MSI32_WDTH-1:0] im2tm_msi32_addr_reg;
  input [`FIRE_DLC_SCW_MSI64_WDTH-1:0] im2tm_msi64_addr_reg;

  //------------------------------------------------------------------------
  //   Internal interface
  //------------------------------------------------------------------------
  output 		rcd_empty;             //   to xfrfsm.v
  input 		rcd_deq;               // from xfrfsm.v

  output 		rcd_is_msg;            //   to xfrfsm.v, bufmgr.v
  output 		rcd_is_msi;            //   to xfrfsm.v, bufmgr.v, datafsm.v
  output 		rcd_is_cpld;           //   to xfrfsm.v, bufmgr.v, datafsm.v
  output 		rcd_is_dmawr;          //   to xfrfsm.v, bufmgr.v, datafsm.v

  output [5:2] 		align_addr;            //   to datafsm.v
  output [7:0] 		payld_len;             //   to datafsm.v

  input [`FIRE_DLC_DIM_DPTR_WDTH-1:0]  d_ptr_out;             // from bufmgr.v

  output [3:0] 			       first_dwbe;   // to datafsm.v
  output [3:0] 			       last_dwbe;    // to datafsm.v

  //------------------------------------------------------------------------
  //  for sun4v msi_64 compare
  //------------------------------------------------------------------------
  input		  csr_sun4v_en;		    
  input		  im2tm_eqs_adr_63;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  reg [`FIRE_DLC_DIM_REC_WDTH-1:0]  tm2rm_rcd;

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - NON-FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~
  reg 				    rcd_is_msg;            //   to xfrfsm.v, bufmgr.v
  reg 				    rcd_is_msi;            //   to xfrfsm.v, bufmgr.v, datafsm.v
  reg 				    rcd_is_cpld;           //   to xfrfsm.v, bufmgr.v, datafsm.v
  reg 				    rcd_is_dmawr;          //   to xfrfsm.v, bufmgr.v, datafsm.v
  reg 				    rcd_is_cpl;
  reg [`FIRE_DLC_DIM_TYPE_WDTH-1:0] out_rcd_type;

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  wire [`FIRE_DLC_IPE_REC_WDTH-1:0]   curr_rcd;
  wire 				      potential_msi32;
  wire 				      potential_msi64;
  
  //---------------------------------------------------------------------
  // In record fields
  //---------------------------------------------------------------------
  wire [`FIRE_DLC_IPE_ADDR_WDTH-1:0]  in_rcd_addr;
  wire [`FIRE_DLC_IPE_FDWBE_WDTH-1:0] in_rcd_fdwbe;
  wire [`FIRE_DLC_IPE_LDWBE_WDTH-1:0] in_rcd_ldwbe;
  wire [`FIRE_DLC_IPE_TAG_WDTH-1:0]   in_rcd_tag;
  wire [`FIRE_DLC_IPE_REQID_WDTH-1:0] in_rcd_reqid;
  wire [`FIRE_DLC_IPE_LEN_WDTH-1:0]   in_rcd_len;
  wire [`FIRE_DLC_IPE_ATR_WDTH-1:0]   in_rcd_atr;
  wire [`FIRE_DLC_IPE_TC_WDTH-1:0]    in_rcd_tc;
  wire [`FIRE_DLC_IPE_TYPE_WDTH+`FIRE_DLC_IPE_F_WDTH-1:0] in_rcd_type;

  //---------------------------------------------------------------------
  // Out record fields
  //---------------------------------------------------------------------
  wire [`FIRE_DLC_DIM_ADDR_WDTH-1:0]   out_rcd_addr;
  wire [`FIRE_DLC_DIM_FDWBE_WDTH-1:0]  out_rcd_fdwbe;
  wire [`FIRE_DLC_DIM_LDWBE_WDTH-1:0]  out_rcd_ldwbe;
  wire [`FIRE_DLC_DIM_TAG_WDTH-1:0]    out_rcd_tag;
  wire [`FIRE_DLC_DIM_REQID_WDTH-1:0]  out_rcd_reqid;
  wire [`FIRE_DLC_DIM_LEN_WDTH-1:0]    out_rcd_len;
  wire [`FIRE_DLC_DIM_ATR_WDTH-1:0]    out_rcd_atr;
  wire [`FIRE_DLC_DIM_TC_WDTH-1:0]     out_rcd_tc;

  wire [`FIRE_DLC_DIM_REC_WDTH-1:0]    n_tm2rm_rcd;
  

  // >>>>>>>>>>>>>>>>>>>>>>>>> Zero In Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // 0in max -var in_rcd_len -val 128 -active (rcd_is_msi & !rcd_empty)
  // 0in max -var in_rcd_len -val 128 -active (rcd_is_dmawr & !rcd_empty)
  // 0in max -var in_rcd_len -val 16  -active (rcd_is_cpld & !rcd_empty)

  /* 0in bits_on -var {rcd_is_msi, rcd_is_msg, rcd_is_dmawr, rcd_is_cpld, rcd_is_cpl} 
                 -max 1 -active ~rcd_empty */

  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL/Behavioral Model <<<<<<<<<<<<<<<<<<<<<<<<<<<

  //---------------------------------------------------------------------
  // In record fields
  //---------------------------------------------------------------------
  assign in_rcd_addr = curr_rcd[`FIRE_DLC_IPE_ADDR_MSB:`FIRE_DLC_IPE_ADDR_LSB];
  assign in_rcd_fdwbe = curr_rcd[`FIRE_DLC_IPE_FDWBE_MSB:`FIRE_DLC_IPE_FDWBE_LSB];
  assign in_rcd_ldwbe = curr_rcd[`FIRE_DLC_IPE_LDWBE_MSB:`FIRE_DLC_IPE_LDWBE_LSB];
  assign in_rcd_tag = curr_rcd[`FIRE_DLC_IPE_TAG_MSB:`FIRE_DLC_IPE_TAG_LSB];
  assign in_rcd_reqid = curr_rcd[`FIRE_DLC_IPE_REQID_MSB:`FIRE_DLC_IPE_REQID_LSB];
  assign in_rcd_len = curr_rcd[`FIRE_DLC_IPE_LEN_MSB:`FIRE_DLC_IPE_LEN_LSB];
  assign in_rcd_atr = curr_rcd[`FIRE_DLC_IPE_ATR_MSB:`FIRE_DLC_IPE_ATR_LSB];
  assign in_rcd_tc = curr_rcd[`FIRE_DLC_IPE_TC_MSB:`FIRE_DLC_IPE_TC_LSB];
  assign in_rcd_type = curr_rcd[`FIRE_DLC_IPE_F_MSB:`FIRE_DLC_IPE_TYPE_LSB];

  //---------------------------------------------------------------------
  // type decoder
  //---------------------------------------------------------------------
  assign potential_msi32 = in_rcd_addr[29:14] == im2tm_msi32_addr_reg;
//BP n2 12-12-05
//  assign potential_msi64 = in_rcd_addr[61:14] == im2tm_msi64_addr_reg;
  assign potential_msi64 = (csr_sun4v_en & ~im2tm_eqs_adr_63) ? 
			(in_rcd_addr[60:14] == im2tm_msi64_addr_reg[46:0] ) :
			(in_rcd_addr[61:14] == im2tm_msi64_addr_reg[47:0])  ;

  always @ (in_rcd_type or potential_msi32 or potential_msi64)
    begin
      rcd_is_msi = 1'b0;
      rcd_is_msg = 1'b0;
      rcd_is_dmawr = 1'b0;
      rcd_is_cpld = 1'b0;
      rcd_is_cpl = 1'b0;
      out_rcd_type = in_rcd_type;
      
      // vlint fix: 3-3-03 pstabile - changed case to casez since DMA_MSG param = 7'b0110zzz
      casez (in_rcd_type) // 0in < case -parallel -full -active ~rcd_empty
	DMA_MWR32   : 
	  if (potential_msi32)
	    begin
	      rcd_is_msi = 1'b1;
	      out_rcd_type = 7'b1011000;
	    end
	  else
	    begin
	      rcd_is_dmawr = 1'b1;
	    end
	DMA_MWR64   :
	  if (potential_msi64)
	    begin
	      rcd_is_msi = 1'b1;
	      out_rcd_type = 7'b1111000;
	    end
	  else
	    begin
	      rcd_is_dmawr = 1'b1;
	    end
	DMA_MSG    :  
	  begin
	    rcd_is_msg = 1'b1;
	  end	
	PIO_CPL    :  
	  begin
	    rcd_is_cpl = 1'b1;
	  end
	PIO_CPLD   : 
	  begin
	    rcd_is_cpld = 1'b1;
	  end
	DMA_MRD32,
	DMA_MRD64,
	DMA_MRDLK32,
	DMA_MRDLK64,
	DMA_UR    :
	  begin  // redudant - for 0in case checker
	    rcd_is_cpl = 1'b0;
	  end
	
      endcase // case(in_rcd_type)
    end
  
	    
  //---------------------------------------------------------------------
  // Out record fields
  //---------------------------------------------------------------------
  assign out_rcd_reqid = (rcd_is_cpl | rcd_is_cpld) ?
			 in_rcd_addr[29:14] : in_rcd_reqid;
  assign out_rcd_tag = (rcd_is_cpl | rcd_is_cpld) ?
			 in_rcd_addr[13:6] : in_rcd_tag;
  assign out_rcd_fdwbe = (rcd_is_cpl | rcd_is_cpld) ?
			   {in_rcd_fdwbe[0], in_rcd_tag[7:5]} :
	                   in_rcd_fdwbe;
  assign out_rcd_addr = (rcd_is_cpl | rcd_is_cpld) ?
			  {in_rcd_addr[45:0], in_rcd_reqid} :
	                  in_rcd_addr;
  assign out_rcd_tc = in_rcd_tc;
  assign out_rcd_atr = in_rcd_atr;
  assign out_rcd_len = in_rcd_len;
  assign out_rcd_ldwbe = in_rcd_ldwbe;

  assign n_tm2rm_rcd = {out_rcd_type, out_rcd_tc, out_rcd_atr, out_rcd_len,
			out_rcd_reqid, out_rcd_tag, out_rcd_ldwbe,
			out_rcd_fdwbe, out_rcd_addr, d_ptr_out};

  //---------------------------------------------------------------------
  // Outputs
  //---------------------------------------------------------------------
  assign payld_len = in_rcd_len[7:0];
  assign align_addr = in_rcd_addr[3:0];
  assign first_dwbe = in_rcd_fdwbe;
  assign last_dwbe = in_rcd_ldwbe;

  always @ (posedge clk)
	if(~rst_l) begin
      tm2rm_rcd <= {`FIRE_DLC_DIM_REC_WDTH{1'b0}};
	end
    else begin
      tm2rm_rcd <= n_tm2rm_rcd;
    end

  // >>>>>>>>>>>>>>>>>>>>>>>>> Instantiations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  // simple fifo
  pcie_common_srq #(6, `FIRE_DLC_IPE_REC_WDTH) rcd_fifo
    (
     .clk        (clk),
     .rst_l      (rst_l),
     .enq        (y2k_rcd_enq),
     .deq        (rcd_deq),
     .di         (y2k_rcd),
     .do         (curr_rcd),
     .empty      (rcd_empty),
     .full       (),
     .afull      ()
     );

endmodule // dmu_tmu_dim_rcdbldr




