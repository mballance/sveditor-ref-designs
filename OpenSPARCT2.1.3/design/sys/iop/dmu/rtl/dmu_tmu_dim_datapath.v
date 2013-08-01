// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_tmu_dim_datapath.v
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
module dmu_tmu_dim_datapath (
				  clk,
				  rst_l,
		     		  
				  // data path
				  k2y_buf_addr,
				  y2k_buf_data,
				  y2k_buf_dpar,
				  
				  // DIU interface
				  tm2di_data,
				  tm2di_bmask,
				  tm2di_dpar,
				  
				  // IMU interface
				  tm2im_data,
				  
				  // talk to datafsm.v
				  idb_rptr_inc,
				  data_mux_select,
				  first_dwbe_dp,
				  last_dwbe_dp,
				  align_addr_dp,
				  end_addr_dp,
				  payld_len_is_one_dp,
				  ld_saved_data_dp
				  
				  );
  
  //synopsys sync_set_reset "rst_l"

  // >>>>>>>>>>>>>>>>>>>>>>>>> Parameter Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // data_mux_select
  parameter ONLY_VDB     = 0,
	    LAST_VDB     = 1,
	    MID_VDB      = 2,
	    FRST_VDB     = 3,
	    ZERO_FILL    = 4;

  // data_mux_select number
  parameter DATA_MUX_NUM = 5;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  

  //------------------------------------------------------------------------
  //  Clock and Reset Signals
  //------------------------------------------------------------------------
  input		  clk;		    
  input		  rst_l;
  
  //------------------------------------------------------------------------
  //   data path to ILU
  //------------------------------------------------------------------------
  output [`FIRE_DLC_ITI_ADDR_WDTH-1:0] k2y_buf_addr;        // read pointer to IDB
  input [`FIRE_DLC_ITI_DATA_WDTH-1:0]  y2k_buf_data;        // 16-byte data    
  input [`FIRE_DLC_ITI_DPAR_WDTH-1:0]  y2k_buf_dpar;        // data parity
  

  //------------------------------------------------------------------------
  //   DIU interface
  //------------------------------------------------------------------------
  output [`FIRE_DLC_TRD_DATA_WDTH-1:0] tm2di_data;          // data to DIU
  output [`FIRE_DLC_TRD_BMASK_WDTH-1:0] tm2di_bmask;         // byte mask
  output [`FIRE_DLC_TRD_DPAR_WDTH-1:0] 	tm2di_dpar;          // data parity
				     
  //------------------------------------------------------------------------
  //   IMU interface
  //------------------------------------------------------------------------
  output [`FIRE_DLC_MDF_REC_WDTH-1:0]  tm2im_data;          // ingress

  //------------------------------------------------------------------------
  //   talk to datafsm.v - data_mux_select encoding is
  //                      { zero_fill, f_vdb, m_vdb, l_vdb, only_vdb}
  //------------------------------------------------------------------------
  input 			       idb_rptr_inc;
  input [DATA_MUX_NUM-1:0] 	       data_mux_select;
  input [3:0] 			       first_dwbe_dp;
  input [3:0] 			       last_dwbe_dp;
  input [3:2]			       align_addr_dp;
  input [3:2] 			       end_addr_dp;
  input 			       payld_len_is_one_dp;
  input                                ld_saved_data_dp;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  reg [`FIRE_DLC_ITI_ADDR_WDTH-1:0]    k2y_buf_addr;        // read pointer to IDB

  reg [127:0] 			       current_data;
  reg [3:0] 			       current_dpar;

  reg [95:0] 			       saved_data;
  reg [2:0] 			       saved_dpar;

  reg [127:0] 			       tm2di_data;
  reg [4:0] 			       tm2di_dpar;
  reg [15:0] 			       tm2di_bmask;

  reg 				       msi_parity_err;

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - NON-FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~
  reg [127:0] 			       n_tm2di_data;
  reg [4:0] 			       n_tm2di_dpar;
  reg [15:0] 			       n_tm2di_bmask;

  reg [127:0] 			       data_pattern;
  reg [3:0] 			       dpar_pattern;

  reg [127:0] 			       f_vdb_data; 
  reg [127:0] 			       m_vdb_data;
  wire [127:0] 			       l_vdb_data; 
  
  reg [4:0] 			       f_vdb_dpar; 
  reg [4:0] 			       m_vdb_dpar;
  
  reg [15:0] 			       f_vdb_bmask; 
  reg [15:0] 			       m_vdb_bmask;
  reg [15:0] 			       l_vdb_bmask; 
				       
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  wire [127:0] 			       only_vdb_data;
  wire [4:0] 			       l_vdb_dpar; 
  wire [4:0] 			       only_vdb_dpar;
  wire [15:0] 			       only_vdb_bmask;

  wire 				       calc_parity;
  wire 				       n_msi_parity_err;

  wire [3:0] 			       first_dwbe;  // bit swap of first_dwbe_dp
  wire [3:0] 			       last_dwbe;   // bit swap of last_dwbe_dp

  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Function Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<
  function calc_dpar_bit; // odd parity
    input [15:0] data;
    begin
      calc_dpar_bit = ~(^data[15:0]);
    end
  endfunction // calc_dpar_bit
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL/Behavioral Model <<<<<<<<<<<<<<<<<<<<<<<<<<<

  //------------------------------------------------------------------------
  //   bit swap of first_dwbe_dp and last_dwbe_dp
  //   set last_dwbe to 4'b1111 if payld_len_is_one_dp == 1'b1 for 
  //   only_vdb_bmask formation, which is f_vdb_bmask & l_vdb_bmask
  //------------------------------------------------------------------------
  assign first_dwbe[3] = first_dwbe_dp[0];
  assign first_dwbe[2] = first_dwbe_dp[1];
  assign first_dwbe[1] = first_dwbe_dp[2];
  assign first_dwbe[0] = first_dwbe_dp[3];

  assign last_dwbe[3] = payld_len_is_one_dp ? 1'b1 : last_dwbe_dp[0];
  assign last_dwbe[2] = payld_len_is_one_dp ? 1'b1 : last_dwbe_dp[1];
  assign last_dwbe[1] = payld_len_is_one_dp ? 1'b1 : last_dwbe_dp[2];
  assign last_dwbe[0] = payld_len_is_one_dp ? 1'b1 : last_dwbe_dp[3];

  //------------------------------------------------------------------------
  //   parity check for first DW data and form tm2im_data
  //------------------------------------------------------------------------

  // calculate the first DW parity bit - odd parity
  assign calc_parity = ~(^y2k_buf_data[127:96]);
  
  assign n_msi_parity_err = (calc_parity ^ y2k_buf_dpar[3]); // fire uses odd parity
  
// MSI-X  assign tm2im_data = {msi_parity_err, current_data[127:112]};
  assign tm2im_data = {msi_parity_err, current_data[127:96]};

  //------------------------------------------------------------------------
  //   form f_vdb_data, dpar and bmask
  //------------------------------------------------------------------------
  always @ (align_addr_dp or current_data or current_dpar or first_dwbe)
    begin
      case (align_addr_dp)
	2'b00:
	  begin
	    f_vdb_data = current_data;
	    f_vdb_dpar[4:1] = current_dpar;
	    f_vdb_bmask = {first_dwbe, 12'hfff};
	  end
	2'b01:
	  begin
	    f_vdb_data = {32'b0, current_data[127:32]};
	    f_vdb_dpar[4:1] = {1'b1, current_dpar[3:1]};
	    f_vdb_bmask = {4'b0, first_dwbe, 8'hff};
	  end
	2'b10:
	  begin
	    f_vdb_data = {64'b0, current_data[127:64]};
	    f_vdb_dpar[4:1] = {2'b11, current_dpar[3:2]};
	    f_vdb_bmask = {8'b0, first_dwbe, 4'hf};
	  end
	2'b11:
	  begin
	    f_vdb_data = {96'b0, current_data[127:96]};
	    f_vdb_dpar[4:1] = {3'b111, current_dpar[3]};
	    f_vdb_bmask = {12'b0, first_dwbe};
	  end
      endcase // case(align_addr_low_dp)
      f_vdb_dpar[0] = calc_dpar_bit(f_vdb_bmask); // odd parity bit for bmask
    end
  
  //------------------------------------------------------------------------
  //   form m_vdb_data, dpar and bmask
  //------------------------------------------------------------------------
  always @ (align_addr_dp or current_data or current_dpar or
	    saved_data or saved_dpar)
    begin
      m_vdb_dpar[0] = 1'b1; // because the bmask is 16'hffff
      m_vdb_bmask = 16'hffff;
      case (align_addr_dp)
	2'b00:
	  begin
	    m_vdb_data = current_data;
	    m_vdb_dpar[4:1] = current_dpar;
	  end
	2'b01:
	  begin
	    m_vdb_data = {saved_data[31:0], current_data[127:32]};
	    m_vdb_dpar[4:1] = {saved_dpar[0], current_dpar[3:1]};
	  end
	2'b10:
	  begin
	    m_vdb_data = {saved_data[63:0], current_data[127:64]};
	    m_vdb_dpar[4:1] = {saved_dpar[1:0], current_dpar[3:2]};
	  end
	2'b11:
	  begin
	    m_vdb_data = {saved_data[95:0], current_data[127:96]};
	    m_vdb_dpar[4:1] = {saved_dpar[2:0], current_dpar[3]};
	  end
      endcase // case(align_addr_dp)
    end
  
	    
  //------------------------------------------------------------------------
  //   mux out patterns for l_vdb_data, dpar[4:1] and only_vdb_data, dpar[4:1]
  //------------------------------------------------------------------------
  always @ (end_addr_dp)
    begin
     case (end_addr_dp)
       2'b00:
	 begin
	   data_pattern = {{32{1'b1}}, {32{1'b1}}, {32{1'b1}}, {32{1'b1}}};
	   dpar_pattern = {1'b0, 1'b0, 1'b0, 1'b0};
	 end
       2'b01:
	 begin
	   data_pattern = {{32{1'b1}}, 32'b0, 32'b0, 32'b0};
	   dpar_pattern = {1'b0, 1'b1, 1'b1, 1'b1};
	 end
       2'b10:
	 begin
	   data_pattern = {{32{1'b1}}, {32{1'b1}}, 32'b0, 32'b0};
	   dpar_pattern = {1'b0, 1'b0, 1'b1, 1'b1};
	 end
       2'b11:
	 begin
	   data_pattern = {{32{1'b1}}, {32{1'b1}}, {32{1'b1}}, 32'b0};
	   dpar_pattern = {1'b0, 1'b0, 1'b0, 1'b1};
	 end
     endcase // case(end_addr_dp)
    end
  
  //------------------------------------------------------------------------
  //   form l_vdb_data, dpar and bmask
  //------------------------------------------------------------------------
  always @ (end_addr_dp or last_dwbe)
    begin
      case (end_addr_dp)
	2'b00:
	  begin
	    l_vdb_bmask = {12'hfff, last_dwbe};
	  end	  
	2'b01:
	  begin
	    l_vdb_bmask = {last_dwbe, 12'b0};
	  end	  
	2'b10:
	  begin
	    l_vdb_bmask = {4'hf, last_dwbe, 8'b0};
	  end	  
	2'b11:
	  begin
	    l_vdb_bmask = {8'hff, last_dwbe, 4'b0};
	  end
      endcase // case(end_addr_dp)
    end
  
  assign l_vdb_dpar[0] = calc_dpar_bit(l_vdb_bmask); // parity bit for bmask
  assign l_vdb_data = m_vdb_data & data_pattern;
  assign l_vdb_dpar[4:1] = m_vdb_dpar[4:1] | dpar_pattern;
  

  //------------------------------------------------------------------------
  //   form only_vdb_data, dpar and bmask
  //------------------------------------------------------------------------

  assign only_vdb_bmask = f_vdb_bmask & l_vdb_bmask;
  assign only_vdb_data = f_vdb_data & data_pattern;
  assign only_vdb_dpar[4:1] = f_vdb_dpar[4:1] | dpar_pattern;
  assign only_vdb_dpar[0] = calc_dpar_bit(only_vdb_bmask);
    
  //------------------------------------------------------------------------
  //   mux out from zero-fill, f_vdb, m_vdb, l_vdb, only_vdb
  //------------------------------------------------------------------------

  always @ (data_mux_select or 
	    f_vdb_data or m_vdb_data or
	    l_vdb_data or only_vdb_data or
	    f_vdb_dpar or m_vdb_dpar or
	    l_vdb_dpar or only_vdb_dpar or
	    f_vdb_bmask or m_vdb_bmask or
	    l_vdb_bmask or only_vdb_bmask )
    begin
      n_tm2di_data = 128'b0;
      n_tm2di_bmask = 16'b0;
      n_tm2di_dpar = 5'b11111;
      case (1'b1)  // synopsys parallel_case 
	data_mux_select[ZERO_FILL]:
//	5'b10000: // zero-fill 
	  begin
	    n_tm2di_data = 128'b0;
	    n_tm2di_bmask = 16'b0;
            n_tm2di_dpar = 5'b11111;
	  end
	data_mux_select[FRST_VDB]:
//	5'b01000:  // f_vdb
	  begin
	    n_tm2di_data = f_vdb_data;
	    n_tm2di_bmask = f_vdb_bmask;
	    n_tm2di_dpar = f_vdb_dpar;
	  end
	data_mux_select[MID_VDB]:
//	5'b00100:  // m_vdb
	  begin
	    n_tm2di_data = m_vdb_data;
	    n_tm2di_bmask = m_vdb_bmask;
	    n_tm2di_dpar = m_vdb_dpar;
	  end
	data_mux_select[LAST_VDB]:
//	5'b00010: // l_vdb
	  begin
	    n_tm2di_data = l_vdb_data;
	    n_tm2di_bmask = l_vdb_bmask;
	    n_tm2di_dpar = l_vdb_dpar;
	  end
	data_mux_select[ONLY_VDB]:
//	5'b00001:  // only_vdb
	  begin
	    n_tm2di_data = only_vdb_data;
	    n_tm2di_bmask = only_vdb_bmask;
	    n_tm2di_dpar = only_vdb_dpar;
	  end
      endcase // case(1'b1)
    end
  

  //------------------------------------------------------------------------
  //   rptr to IDB
  //------------------------------------------------------------------------
  always @ (posedge clk)
    if (!rst_l)
      begin
	k2y_buf_addr <= {`FIRE_DLC_ITI_ADDR_WDTH{1'b0}};
      end
    else if (idb_rptr_inc)
      begin
        k2y_buf_addr <= k2y_buf_addr + 1'b1;
      end

  //------------------------------------------------------------------------
  //   flops
  //------------------------------------------------------------------------
  always @ (posedge clk)
	if(~rst_l) begin
      current_data <= {128{1'b0}};
      current_dpar <= {4{1'b0}};
        saved_data <= {96{1'b0}};
        saved_dpar <= {3{1'b0}};
      msi_parity_err <= 1'b0;
      tm2di_data <= {128{1'b0}};
      tm2di_dpar <= {5{1'b0}};
      tm2di_bmask <= {16{1'b0}};
	end
    else begin
      current_data <= y2k_buf_data;
      current_dpar <= y2k_buf_dpar;
      
      if (ld_saved_data_dp) begin
        saved_data <= current_data[95:0];
        saved_dpar <= current_dpar[2:0];
      end

      msi_parity_err <= n_msi_parity_err;

      tm2di_data <= n_tm2di_data;
      tm2di_dpar <= n_tm2di_dpar;
      tm2di_bmask <= n_tm2di_bmask;
    end
  
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Instantiations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<



endmodule // dmu_tmu_dim_datapath




