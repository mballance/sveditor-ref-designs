// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_tmu_dim_datafsm.v
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
module dmu_tmu_dim_datafsm (
				 clk,
				 rst_l,

				 // DIU interface
				 tm2di_wr,
				 tm2di_addr,
		     		     			 
                                 // IMU interface
                                 tm2im_data_enq,

				 // talk to xfrfsm.v
				 data_start,
				 data_done,

				 // talk to bufmgr.v
                                 diu_dma_full,
                                 dma_cl_req,
                                 dma_cl_inc,
                                 pio_cl_inc,
				 diu_dma_cl_wptr,
				 diu_pio_cl_wptr,

				 // talk to rcdbldr.v
				 rcd_is_cpld,
				 rcd_is_msi,
				 align_addr,
				 payld_len,
                                 first_dwbe,
                                 last_dwbe,

				 // talk to datapath.v
				 idb_rptr_inc,
				 data_mux_select,
				 first_dwbe_dp,
				 last_dwbe_dp,
				 align_addr_dp,
				 end_addr_dp,
				 payld_len_is_one_dp,
                                 ld_saved_data_dp,
				 
				 // talk to relgen.v
				 rcd_is_cpld_reg,

				 // debug
				 y2k_buf_addr_vld_monitor,
				 rel_type,
				 k2y_rel_enq,
				 low_dbg_sel_a,
				 low_dbg_sel_b,
				 datafsm_dbg_a,
				 datafsm_dbg_b,
				 
				 // idle check
				 datafsm_is_idle );
  
  //synopsys sync_set_reset "rst_l"

  // >>>>>>>>>>>>>>>>>>>>>>>>> Parameter Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // states
  parameter // summit enum data_enum
	    IDLE         = 0,
	    MSI          = 1,
	    ZF_PRE_WR    = 2,
	    FRST_VD_WR   = 3,
	    MID_VD_WR    = 4,
	    LST_VD_WR    = 5,
	    ZF_PST_WR    = 6,
	    WAIT         = 7;

  // state number
  parameter STATE_NUM    = 8;

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
  //   DIU interface
  //------------------------------------------------------------------------
  output          tm2di_wr;
  output [`FIRE_DLC_TRD_ADDR_WDTH-1:0] tm2di_addr;          // DIU address

  //------------------------------------------------------------------------
  //   IMU interface
  //------------------------------------------------------------------------
  output          tm2im_data_enq;

  //------------------------------------------------------------------------
  //   talk to xfrfsm.v
  //------------------------------------------------------------------------
  input 	     data_start;    
  output 	     data_done;     // to bufmgr.v also

  //------------------------------------------------------------------------
  //   talk to bufmgr.v
  //------------------------------------------------------------------------
  input             diu_dma_full;
  output            dma_cl_req;
  output            dma_cl_inc;
  output            pio_cl_inc;
  input [`FIRE_DLC_DMA_WPTR_WDTH-2:0] diu_dma_cl_wptr;     
  input [`FIRE_DLC_PIO_WPTR_WDTH-2:0] diu_pio_cl_wptr;

  //------------------------------------------------------------------------
  //   talk to rcdbldr.v
  //------------------------------------------------------------------------
  input 	     rcd_is_msi;           
  input 	     rcd_is_cpld;          
  input [5:2] 	     align_addr;           
  input [7:0] 	     payld_len;      // only 8-bit due to max. MPS = 512B,
                                     // the possible max. value is 8'b10000000.
  input [3:0] 	     first_dwbe;
  input [3:0] 	     last_dwbe;
  
  //------------------------------------------------------------------------
  //   talk to datapath.v
  //------------------------------------------------------------------------
  output 			      idb_rptr_inc;
  output [DATA_MUX_NUM-1:0] 	      data_mux_select;
  output [3:0] 			      first_dwbe_dp;
  output [3:0] 			      last_dwbe_dp;
  output [3:2] 			      align_addr_dp;
  output [3:2] 			      end_addr_dp;
  output 			      payld_len_is_one_dp; 
  output 			      ld_saved_data_dp; 
    
  //------------------------------------------------------------------------
  //   talk to relgen.v
  //------------------------------------------------------------------------
  output 			      rcd_is_cpld_reg;
  
  //------------------------------------------------------------------------
  //   debug
  //------------------------------------------------------------------------
  input 			      y2k_buf_addr_vld_monitor;
  input 			      rel_type;
  input 			      k2y_rel_enq;
  input [2:0] 			      low_dbg_sel_a;
  input [2:0] 			      low_dbg_sel_b;
  output [`FIRE_DBG_DATA_BITS] 	      datafsm_dbg_a;
  output [`FIRE_DBG_DATA_BITS] 	      datafsm_dbg_b;

  //------------------------------------------------------------------------
  //   idle check
  //------------------------------------------------------------------------
  output 			      datafsm_is_idle;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  reg [3:0] 			      first_dwbe_reg;
  reg [3:0] 			      last_dwbe_reg;
  reg [5:2] 			      align_addr_reg;
  reg [3:2] 			      end_addr_reg;
  reg 				      rcd_is_cpld_reg;
  reg 				      payld_len_is_one_reg;

  reg [1:0] 			      diu_addr_low;

  reg [5:0] 			      num_wrs;
  reg [5:0] 			      num_rds;
  reg [5:0] 			      num_vd_wrs;
  reg 				      only_one_vd_wr_reg;

  reg 				      diu_wr_ps1;      
  reg 				      msi_wr_ps1;       
  reg [`FIRE_DLC_TRD_ADDR_WDTH-1:0]   diu_wr_addr_ps1;  
  reg [DATA_MUX_NUM-1:0] 	      data_mux_sel_ps1;
  
  reg 				      diu_wr_ps2;       
  reg 				      msi_wr_ps2;       
  reg [`FIRE_DLC_TRD_ADDR_WDTH-1:0]   diu_wr_addr_ps2;  
  reg [DATA_MUX_NUM-1:0] 	      data_mux_sel_ps2;
  
  reg 				      diu_wr_ps3;       
  reg [`FIRE_DLC_TRD_ADDR_WDTH-1:0]   diu_wr_addr_ps3;  
    
  reg [3:0]                           first_dwbe_ps1;
  reg [3:0]                           last_dwbe_ps1;
  reg [3:2]                           align_addr_ps1;
  reg [3:2]                           end_addr_ps1;
  reg 				      payld_len_is_one_ps1;
  reg 				      ld_saved_data_ps1;

  reg [3:0]                           first_dwbe_ps2;
  reg [3:0]                           last_dwbe_ps2;
  reg [3:2]                           align_addr_ps2;
  reg [3:2]                           end_addr_ps2;
  reg 				      payld_len_is_one_ps2;
  reg 				      ld_saved_data_ps2;


  reg [STATE_NUM-1:0] 		      data_state; // 0in one_hot

  reg [`FIRE_DBG_DATA_BITS] 	      dbg_bus [0:1];

  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - NON-FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~

  reg 				      diu_vd_wr_inc;
  reg 				      idb_rptr_inc;

  reg 				      diu_wr_ne0;      
  reg 				      msi_wr_ne0;       
  reg [DATA_MUX_NUM-1:0] 	      data_mux_sel_ne0 ; 

  reg 				      data_done;

  reg [STATE_NUM-1:0] 		      n_data_state;

  reg [`FIRE_DBG_DATA_BITS] 	      nxt_dbg_bus [0:1];

  reg [2:0] 			      dbg_sel [0:1];
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  wire 				      dw_carry;
  wire 				      init_num_cls_inc;
  wire 				      init_num_vd_wrs_inc;
  wire 				      init_num_rds_inc;
  
  wire [5:2] 			      end_addr;
  wire [7:0] 			      new_len_claligned; // possible max. value is 8'b10001111
  wire [7:0] 			      new_len_dwaligned; // possible max. value is 8'b10000011
  wire [3:0] 			      init_num_cls; // possible max. value is 4'b1001
  wire [5:0] 			      init_num_wrs; // possible max. value is 6'b100100
  wire [5:0] 			      init_num_rds; // possible max. value is 6'b100000
  wire [5:0] 			      init_num_vd_wrs; // possible max. value is 6'b100001

  wire [5:2] 			      align_addr_cur;
  wire 				      rcd_is_cpld_cur;
  wire [5:0] 			      diu_cl_addr;
  wire [`FIRE_DLC_TRD_ADDR_WDTH-1:0]  diu_wr_addr_ne0;  
  wire [3:0]                          first_dwbe_ne0;
  wire [3:0]                          last_dwbe_ne0;
  wire [3:2]                          align_addr_ne0;
  wire [3:2]                          end_addr_ne0;
  wire 				      payld_len_is_one_ne0;
  wire                                ld_saved_data_ne0;

  wire 				      only_one_vd_wr;
  wire 				      diu_no_space;  
  wire 				      frst_vd_wr;
  wire 				      last_vd_wr;    
  wire 				      more_vd_wrs;   
  wire 				      last_wr;       
  wire 				      more_wrs;      
  wire 				      more_rds;      
  wire 				      only_one_rd;   
  wire 				      last_rd ;      
  wire 				      end_of_cl;      
  wire 				      diu_cl_req;
  wire 				      diu_cl_inc;
  wire 				      payld_len_is_one;

  integer 			      i;
  integer 			      j;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Zero In Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  // 0in bits_on -var data_mux_select -max 1

  // 0in max -var new_len_claligned -val 8'b10001111 -active data_start
  // 0in max -var new_len_dwaligned -val 8'b10000011 -active data_start
  // 0in max -var init_num_cls      -val 4'b1001     -active data_start
  // 0in max -var init_num_wrs      -val 6'b100100   -active data_start
  // 0in max -var init_num_rds      -val 6'b100000   -active data_start
  // 0in max -var init_num_vd_wrs   -val 6'b100001   -active data_start

  /* 0in state -var data_state -val (8'b1 << IDLE) -next 
                                    (8'b1 << IDLE)
                                    (8'b1 << MSI)
                                    (8'b1 << ZF_PRE_WR)
                                    (8'b1 << FRST_VD_WR)  */

  /* 0in state -var data_state -val (8'b1 << MSI) -next
                                    (8'b1 << MSI)
                                    (8'b1 << IDLE) */
  
  /* 0in state -var data_state -val (8'b1 << ZF_PRE_WR) -next
                                    (8'b1 << ZF_PRE_WR)
                                    (8'b1 << FRST_VD_WR) */
  
  /* 0in state -var data_state -val (8'b1 << FRST_VD_WR) -next
                                    (8'b1 << IDLE)
                                    (8'b1 << MSI)
                                    (8'b1 << ZF_PRE_WR)
                                    (8'b1 << FRST_VD_WR)
                                    (8'b1 << WAIT)
                                    (8'b1 << MID_VD_WR)
                                    (8'b1 << LST_VD_WR)
                                    (8'b1 << ZF_PST_WR) */

  /* 0in state -var data_state -val (8'b1 << MID_VD_WR) -next
                                    (8'b1 << MID_VD_WR)
                                    (8'b1 << WAIT)
                                    (8'b1 << LST_VD_WR) */

  /* 0in state -var data_state -val (8'b1 << LST_VD_WR) -next
                                    (8'b1 << IDLE)
                                    (8'b1 << MSI)
                                    (8'b1 << ZF_PRE_WR)
                                    (8'b1 << FRST_VD_WR)
                                    (8'b1 << ZF_PST_WR) */
  
  /* 0in state -var data_state -val (8'b1 << ZF_PST_WR) -next
                                    (8'b1 << ZF_PST_WR)
                                    (8'b1 << IDLE)
                                    (8'b1 << MSI)
                                    (8'b1 << ZF_PRE_WR)
                                    (8'b1 << FRST_VD_WR) */

  /* 0in state -var data_state -val (8'b1 << WAIT) -next
                                    (8'b1 << WAIT)
                                    (8'b1 << MID_VD_WR)
                                    (8'b1 << LST_VD_WR) */
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Function Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<
  function [STATE_NUM + DATA_MUX_NUM + 4 : 0] data_start_handling;
    input rcd_is_msi;
    input frst_vd_wr;
    input only_one_rd;
    input only_one_vd_wr;
    
    reg [STATE_NUM-1:0] n_state;
    reg [DATA_MUX_NUM-1:0] data_mux_sel;
    reg diu_wr_ne0;
    reg msi_wr_ne0;
    reg idb_rptr_inc;
    reg diu_vd_wr_inc;
    reg data_done;
   
    begin
      n_state = {STATE_NUM{1'b0}};
      data_mux_sel = {DATA_MUX_NUM{1'b0}};
      diu_wr_ne0 = 1'b0;
      msi_wr_ne0 = 1'b0;
      idb_rptr_inc = 1'b0;
      diu_vd_wr_inc = 1'b0;
      data_done = 1'b0;

      if (rcd_is_msi) begin
	msi_wr_ne0 = 1'b1;
        idb_rptr_inc = 1'b1;
        if (only_one_rd) begin
          n_state[IDLE] = 1'b1;
          data_done = 1'b1;
        end
        else begin
          n_state[MSI] = 1'b1;
        end
      end
      else begin
	if (frst_vd_wr) begin
	  n_state[FRST_VD_WR] = 1'b1;
          diu_wr_ne0 = 1'b1;
          idb_rptr_inc = 1'b1;
          diu_vd_wr_inc = 1'b1;
          if (only_one_vd_wr) data_mux_sel[ONLY_VDB] = 1'b1;
          else data_mux_sel[FRST_VDB] = 1'b1;
        end
	else begin
          n_state[ZF_PRE_WR] = 1'b1;
          diu_wr_ne0 = 1'b1;
          data_mux_sel[ZERO_FILL] = 1'b1;
        end
      end
      data_start_handling = {n_state, data_mux_sel, diu_wr_ne0, 
			     msi_wr_ne0, idb_rptr_inc, diu_vd_wr_inc, data_done};
    end
  endfunction // data_start_handling

  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL/Behavioral Model <<<<<<<<<<<<<<<<<<<<<<<<<<<


  //---------------------------------------------------------------------
  // mux out diu_cl_addr
  //---------------------------------------------------------------------
  assign rcd_is_cpld_cur = data_start ? rcd_is_cpld : rcd_is_cpld_reg;
//BP n2 6-23-04
//  assign diu_cl_addr = rcd_is_cpld_cur ? {2'b10, diu_pio_cl_wptr[3:0]} 
  assign diu_cl_addr = rcd_is_cpld_cur ? {2'b10, 2'b00, diu_pio_cl_wptr[3:2]} 
	 : {1'b0, diu_dma_cl_wptr[4:0]};
  
  //---------------------------------------------------------------------
  // computing some initial values
  //---------------------------------------------------------------------

  assign new_len_claligned = payld_len + {4'b0, align_addr};
  assign end_addr = new_len_claligned[3:0];

  assign {dw_carry, new_len_dwaligned[1:0]} = {1'b0, payld_len[1:0]} +
	                                      {1'b0, align_addr[3:2]};
  assign new_len_dwaligned[7:2] = dw_carry ? (payld_len[7:2] + 1'b1) :
					      payld_len[7:2];
  
  assign init_num_cls_inc = |end_addr;
  assign init_num_cls = init_num_cls_inc ? (new_len_claligned[7:4] + 1'b1) : 
					     new_len_claligned[7:4];

  assign init_num_wrs = {init_num_cls, 2'b00};

  assign init_num_rds_inc = |payld_len[1:0];
  assign init_num_rds = init_num_rds_inc ? (payld_len[7:2] + 1'b1) :
					     payld_len[7:2];

  assign init_num_vd_wrs_inc = |new_len_dwaligned[1:0];
  assign init_num_vd_wrs = init_num_vd_wrs_inc ? (new_len_dwaligned[7:2] + 1'b1) :
						   new_len_dwaligned[7:2];
  
  //---------------------------------------------------------------------
  // flops to lock data transfer rcd info
  //---------------------------------------------------------------------
  assign only_one_vd_wr = (~(|init_num_vd_wrs[5:1])) & init_num_vd_wrs[0];
  assign payld_len_is_one = payld_len[0] & (~(|payld_len[7:1]));
  
  always @ (posedge clk)
	if(~rst_l) begin
        rcd_is_cpld_reg <= 1'b0;
        align_addr_reg <= 4'b0;
        end_addr_reg <= 2'b0;
        first_dwbe_reg <= 4'b0;
        last_dwbe_reg <= 4'b0;
	only_one_vd_wr_reg <= 1'b0;
	payld_len_is_one_reg <= 1'b0;
	end
    else if (data_start)
      begin
        rcd_is_cpld_reg <= rcd_is_cpld;
        align_addr_reg <= align_addr;
        end_addr_reg <= end_addr[3:2];
        first_dwbe_reg <= first_dwbe;
        last_dwbe_reg <= last_dwbe;
	only_one_vd_wr_reg <= only_one_vd_wr;
	payld_len_is_one_reg <= payld_len_is_one;
      end

  //---------------------------------------------------------------------
  // flops to keep track of data movement
  //---------------------------------------------------------------------
  // num_wrs
  always @ (posedge clk)
	if(~rst_l) begin
	num_wrs <= 6'b0;
	end
    else begin
//BP n2 6-24-04
//      if (data_start) begin
      if (data_start && ~rcd_is_cpld) begin
	num_wrs <= init_num_wrs - 1'b1;
      end
//BP n2 6-24-04
//      else if (diu_wr_ne0) begin
      else if (diu_wr_ne0 & ~rcd_is_cpld_cur) begin
	num_wrs <= num_wrs - 1'b1;
      end
    end
  
  // num_rds
  always @ (posedge clk)
	if(~rst_l) begin
	num_rds <= 6'b0;
	end
    else begin
      if (data_start) begin
	if (idb_rptr_inc) num_rds <= init_num_rds - 1'b1;
	else num_rds <= init_num_rds;
      end
      else if (idb_rptr_inc) num_rds <= num_rds - 1'b1;
    end
  
  // num_vd_wrs
  always @ (posedge clk)
	if(~rst_l) begin
	num_vd_wrs <= 6'b0;
	end
    else begin
      if (data_start) begin
	if (diu_vd_wr_inc) num_vd_wrs <= init_num_vd_wrs - 1'b1;
	else num_vd_wrs <= init_num_vd_wrs;
      end
      else if (diu_vd_wr_inc) num_vd_wrs <= num_vd_wrs - 1'b1;
    end

  // 2-bit LSB diu_addr_low which is appended to diu_cl_addr to form tm2di_addr
  always @ (posedge clk)
    begin
      if (!rst_l) begin
	diu_addr_low <= 2'b0;
      end
//BP n2 6-24-04
//      else if (diu_wr_ne0) diu_addr_low <= diu_addr_low + 1'b1;
      else if (diu_wr_ne0 & ~rcd_is_cpld_cur) diu_addr_low <= diu_addr_low + 1'b1;
    end
  

  //---------------------------------------------------------------------
  // FSM
  //---------------------------------------------------------------------

  // summit state_vector data_state enum data_enum
  
  // present state
  always @ (posedge clk)
    if (!rst_l) begin
      data_state <= {STATE_NUM{1'b0}};
      data_state[IDLE] <= 1'b1;
    end
    else
      data_state <= n_data_state;
  
  // next state logic
//BP n2 6-23-04
wire	[1:0]	diu_addr_low_2;
  assign diu_addr_low_2 = rcd_is_cpld_cur ? diu_pio_cl_wptr[1:0] : diu_addr_low;
  assign diu_wr_addr_ne0 = {diu_cl_addr, diu_addr_low_2};



  assign diu_no_space = (~rcd_is_cpld_reg) & diu_dma_full;
  assign align_addr_cur = data_start ? align_addr : align_addr_reg;
  assign frst_vd_wr = (align_addr_cur[5:4] == diu_addr_low);
  assign last_vd_wr = (~(|num_vd_wrs[5:1])) & num_vd_wrs[0];
  assign more_vd_wrs = |num_vd_wrs;
  assign last_wr = (~(|num_wrs[5:1])) & num_wrs[0];
  assign more_wrs = |num_wrs;
  assign more_rds = |num_rds;
  assign only_one_rd = (~(|init_num_rds[5:1])) & init_num_rds[0];
  assign last_rd = (~(|num_rds[5:1])) & num_rds[0];
  assign end_of_cl = ~(|diu_addr_low);

  always @ (data_state or data_start or diu_no_space or 
	    rcd_is_msi or only_one_vd_wr or only_one_vd_wr_reg or
	    frst_vd_wr or last_vd_wr or more_vd_wrs or
	    last_wr or more_wrs or more_rds or
	    only_one_rd or last_rd or end_of_cl or rcd_is_cpld_cur )
    begin
      n_data_state = {STATE_NUM{1'b0}};
      data_mux_sel_ne0 = {DATA_MUX_NUM{1'b0}};
      diu_wr_ne0 = 1'b0;
      msi_wr_ne0 = 1'b0;
      
      idb_rptr_inc = 1'b0;
      diu_vd_wr_inc = 1'b0;

      data_done = 1'b0;
      
      case (1'b1)  // 0in < case -parallel -full   // synopsys parallel_case 
	data_state[IDLE] :
	  if (data_start) begin
	    {n_data_state,
	     data_mux_sel_ne0,
	     diu_wr_ne0,
	     msi_wr_ne0,
	     idb_rptr_inc,
	     diu_vd_wr_inc,
	     data_done} = data_start_handling (rcd_is_msi,
					       frst_vd_wr,
					       only_one_rd,
					       only_one_vd_wr);
	  end
	  else n_data_state[IDLE] = 1'b1;
	
	data_state[MSI]  :
	  begin
	    idb_rptr_inc = 1'b1;
	    if (last_rd) begin
	      n_data_state[IDLE] = 1'b1;
	      data_done = 1'b1;
	    end
	    else n_data_state[MSI] = 1'b1;
	  end

	data_state[ZF_PRE_WR] :
	  begin
	    diu_wr_ne0 = 1'b1;
	    data_done = last_wr;
	    if (frst_vd_wr) begin
	      n_data_state[FRST_VD_WR] = 1'b1;
	      idb_rptr_inc = 1'b1;		
	      diu_vd_wr_inc = 1'b1;
	      if (only_one_vd_wr_reg) data_mux_sel_ne0[ONLY_VDB] = 1'b1;
	      else data_mux_sel_ne0[FRST_VDB] = 1'b1;
	    end
	    else begin
	      n_data_state[ZF_PRE_WR] = 1'b1;
	      data_mux_sel_ne0[ZERO_FILL] = 1'b1;
	    end
	  end

	data_state[FRST_VD_WR] :
	  begin
	    if (data_start) begin
	      {n_data_state,
	       data_mux_sel_ne0,
	       diu_wr_ne0,
	       msi_wr_ne0,
	       idb_rptr_inc,
	       diu_vd_wr_inc,
	       data_done} = data_start_handling (rcd_is_msi,
						 frst_vd_wr,
						 only_one_rd,
						 only_one_vd_wr);
	    end
	    else begin
	      data_done = last_wr;
	      if (more_wrs & end_of_cl & diu_no_space) begin
		n_data_state[WAIT] = 1'b1;
	      end
	      else begin
		if (more_vd_wrs) begin
		  diu_wr_ne0 = 1'b1;
		  diu_vd_wr_inc = 1'b1;
		  idb_rptr_inc = more_rds;
		  if (last_vd_wr) begin
		    n_data_state[LST_VD_WR] = 1'b1;
		    data_mux_sel_ne0[LAST_VDB] = 1'b1;
		  end
		  else begin
		    n_data_state[MID_VD_WR] = 1'b1;
		    data_mux_sel_ne0[MID_VDB] = 1'b1;
		  end
		end
//BP n2 6-24-04
//		else if (more_wrs) begin
		else if (more_wrs && ~rcd_is_cpld_cur) begin
		  diu_wr_ne0 = 1'b1;
		  n_data_state[ZF_PST_WR] = 1'b1;
		  data_mux_sel_ne0[ZERO_FILL] = 1'b1;
		end
//BP n2 6-24-04
//		else begin
//		  n_data_state[IDLE] = 1'b1;
		else if (rcd_is_cpld_cur) begin
		  data_done = 1'b1;
		  n_data_state[IDLE] = 1'b1;
		end
		else begin
		  n_data_state[IDLE] = 1'b1;
		end
	      end
	    end // else: !if(data_start)
	  end // case: data_state[FRST_VD_WR]

	data_state[MID_VD_WR] :
	  begin
	    if (end_of_cl & diu_no_space) begin
	      n_data_state[WAIT] = 1'b1;
	    end
	    else begin
	      diu_wr_ne0 = 1'b1;
	      diu_vd_wr_inc = 1'b1;
	      idb_rptr_inc = more_rds;
	      data_done = last_wr;
	      if (last_vd_wr) begin
		n_data_state[LST_VD_WR] = 1'b1;
		data_mux_sel_ne0[LAST_VDB] = 1'b1;
	      end
	      else begin
		n_data_state[MID_VD_WR] = 1'b1;
		data_mux_sel_ne0[MID_VDB] = 1'b1;
	      end
	    end
	  end
	
	data_state[LST_VD_WR] :
	  begin
	    if (data_start) begin
	      {n_data_state,
	       data_mux_sel_ne0,
	       diu_wr_ne0,
	       msi_wr_ne0,
	       idb_rptr_inc,
	       diu_vd_wr_inc,
	       data_done} = data_start_handling (rcd_is_msi,
						 frst_vd_wr,
						 only_one_rd,
						 only_one_vd_wr);
	    end
	    else begin
	      if (more_wrs) begin
		data_done = last_wr;  
		diu_wr_ne0 = 1'b1;
                n_data_state[ZF_PST_WR] = 1'b1;
                data_mux_sel_ne0[ZERO_FILL] = 1'b1;
	      end
	      else begin
		n_data_state[IDLE] = 1'b1;
	      end
	    end
	  end

	data_state[ZF_PST_WR] :
	  begin
	    if (data_start) begin
	      {n_data_state,
	       data_mux_sel_ne0,
	       diu_wr_ne0,
	       msi_wr_ne0,
	       idb_rptr_inc,
	       diu_vd_wr_inc,
	       data_done} = data_start_handling (rcd_is_msi,
						 frst_vd_wr,
						 only_one_rd,
						 only_one_vd_wr);
	    end	    
	    else if (more_wrs) begin
	      data_done = last_wr;  
	      diu_wr_ne0 = 1'b1;
              n_data_state[ZF_PST_WR] = 1'b1;
              data_mux_sel_ne0[ZERO_FILL] = 1'b1;
	    end
	    else begin
		n_data_state[IDLE] = 1'b1;
	    end
	  end

	data_state[WAIT] :
	  begin
	    if (diu_no_space) begin
	      n_data_state[WAIT] = 1'b1;
	    end
	    else begin
	      diu_wr_ne0 = 1'b1;
	      idb_rptr_inc = more_rds;
	      diu_vd_wr_inc = 1'b1;
	      if (last_vd_wr) begin
                n_data_state[LST_VD_WR] = 1'b1;
                data_mux_sel_ne0[LAST_VDB] = 1'b1;
              end
              else begin
                n_data_state[MID_VD_WR] = 1'b1;
                data_mux_sel_ne0[MID_VDB] = 1'b1;
              end
	    end
	  end
      endcase // case(1'b1)
    end // always @ (data_state or data_start or diu_no_space or...
      
  //---------------------------------------------------------------------
  // data control pipeline
  //---------------------------------------------------------------------
  always @ (posedge clk) 
    if (!rst_l) begin
      diu_wr_ps1 <= 1'b0;
      msi_wr_ps1 <=1'b0;
      diu_wr_addr_ps1 <= {`FIRE_DLC_TRD_ADDR_WDTH{1'b0}}; 
      data_mux_sel_ps1 <= {DATA_MUX_NUM{1'b0}};
      
      diu_wr_ps2 <= 1'b0;
      msi_wr_ps2 <= 1'b0;
      diu_wr_addr_ps2 <= {`FIRE_DLC_TRD_ADDR_WDTH{1'b0}};
      data_mux_sel_ps2 <= {DATA_MUX_NUM{1'b0}};

      diu_wr_ps3 <= 1'b0;
      diu_wr_addr_ps3 <= {`FIRE_DLC_TRD_ADDR_WDTH{1'b0}};
	end
    else begin
//BP n2 6-24-04 only 1 write for PIO's now, n2 limits PIO's to 16 bytes
//      diu_wr_ps1 <= diu_wr_ne0;
      diu_wr_ps1 <= (diu_wr_ne0 && ~rcd_is_cpld_cur) | (rcd_is_cpld_cur & data_start);
      msi_wr_ps1 <= msi_wr_ne0;
      diu_wr_addr_ps1 <= diu_wr_addr_ne0;
      data_mux_sel_ps1 <= data_mux_sel_ne0;
      
      diu_wr_ps2 <= diu_wr_ps1;
      msi_wr_ps2 <= msi_wr_ps1;
      diu_wr_addr_ps2 <= diu_wr_addr_ps1;
      data_mux_sel_ps2 <= data_mux_sel_ps1;

      diu_wr_ps3 <= diu_wr_ps2;
      diu_wr_addr_ps3 <= diu_wr_addr_ps2;
    end
  
  assign first_dwbe_ne0 = data_start ? first_dwbe : first_dwbe_reg;
  assign last_dwbe_ne0 = data_start ? last_dwbe : last_dwbe_reg;
  assign align_addr_ne0 = align_addr_cur[3:2];
  assign end_addr_ne0 = data_start ? end_addr[3:2] : end_addr_reg;
  assign payld_len_is_one_ne0 = data_start ? payld_len_is_one : payld_len_is_one_reg;
  assign ld_saved_data_ne0 = ~n_data_state[WAIT];
  

  always @ (posedge clk) 
	if(~rst_l) begin
      first_dwbe_ps1 <= 4'b0;
      last_dwbe_ps1 <= 4'b0;
      align_addr_ps1 <= 2'b0;
      end_addr_ps1 <= 2'b0;
      payld_len_is_one_ps1 <= 1'b0;
      ld_saved_data_ps1 <= 1'b0;

      first_dwbe_ps2 <= 4'b0;
      last_dwbe_ps2 <= 4'b0;
      align_addr_ps2 <= 2'b0;
      end_addr_ps2 <= 2'b0;
      payld_len_is_one_ps2 <= 1'b0;
      ld_saved_data_ps2 <= 1'b0;
	end
    else begin
      first_dwbe_ps1 <= first_dwbe_ne0;
      last_dwbe_ps1 <= last_dwbe_ne0;
      align_addr_ps1 <= align_addr_ne0;
      end_addr_ps1 <= end_addr_ne0;
      payld_len_is_one_ps1 <= payld_len_is_one_ne0;
      ld_saved_data_ps1 <= ld_saved_data_ne0;

      first_dwbe_ps2 <= first_dwbe_ps1;
      last_dwbe_ps2 <= last_dwbe_ps1;
      align_addr_ps2 <= align_addr_ps1;
      end_addr_ps2 <= end_addr_ps1;
      payld_len_is_one_ps2 <= payld_len_is_one_ps1;
      ld_saved_data_ps2 <= ld_saved_data_ps1;
    end

  //---------------------------------------------------------------------
  // outputs
  //---------------------------------------------------------------------

  assign diu_cl_req = (diu_addr_low == 2'b01); // asserted at 2nd wr in a cache line
  assign diu_cl_inc = (diu_addr_low == 2'b11); // asserted at 4th wr in a cache line
  assign dma_cl_req = (~rcd_is_cpld_reg) & diu_cl_req;
  assign dma_cl_inc = (~rcd_is_cpld_reg) & diu_cl_inc;
//BP n2 6-24-04
//  assign pio_cl_inc = rcd_is_cpld_reg & diu_cl_inc;
  assign pio_cl_inc = rcd_is_cpld & data_start;
	       
  assign tm2di_addr = diu_wr_addr_ps3;
  assign tm2im_data_enq = msi_wr_ps2;
  assign tm2di_wr = diu_wr_ps3;
  assign data_mux_select = data_mux_sel_ps2;

  assign align_addr_dp = align_addr_ps2;
  assign end_addr_dp = end_addr_ps2;
  assign first_dwbe_dp = first_dwbe_ps2;
  assign last_dwbe_dp = last_dwbe_ps2;
  assign payld_len_is_one_dp = payld_len_is_one_ps2;
  assign ld_saved_data_dp = ld_saved_data_ps2;

  //---------------------------------------------------------------------
  // debug
  //---------------------------------------------------------------------

  always @ (low_dbg_sel_a or low_dbg_sel_b) begin
    dbg_sel[0] = low_dbg_sel_a;
    dbg_sel[1] = low_dbg_sel_b;
  end

  always @ (dbg_sel[0] or dbg_sel[1] or data_state or data_start 
	    or data_done or diu_dma_full or idb_rptr_inc or diu_vd_wr_inc
	    or num_rds or num_wrs or num_vd_wrs or last_rd
	    or last_wr or more_rds or more_wrs or align_addr_cur
	    or rcd_is_cpld_cur or rcd_is_msi
	    or rel_type or k2y_rel_enq or y2k_buf_addr_vld_monitor) 
    begin       
      for (i = 0; i < 2; i = i + 1) begin
	case (dbg_sel[i]) // synopsys infer_mux
          3'b000: nxt_dbg_bus[i] = data_state;
          3'b001: nxt_dbg_bus[i] = {num_rds, last_rd, more_rds};
          3'b010: nxt_dbg_bus[i] = {num_wrs, last_wr, more_wrs};
          3'b011: nxt_dbg_bus[i] = {num_vd_wrs, data_start, data_done};
          3'b100: nxt_dbg_bus[i] = {5'b0, idb_rptr_inc, diu_vd_wr_inc, diu_dma_full};
          3'b101: nxt_dbg_bus[i] = {2'b0, align_addr_cur, rcd_is_cpld_cur, rcd_is_msi};
          3'b110: nxt_dbg_bus[i] = {5'b0, y2k_buf_addr_vld_monitor, rel_type, k2y_rel_enq};
          3'b111: nxt_dbg_bus[i] = 8'h00;
	endcase
      end
    end
    
  assign datafsm_dbg_a = dbg_bus[0];
  assign datafsm_dbg_b = dbg_bus[1];

  always @ (posedge clk) 
	if(~rst_l) begin : dbg_rst
//		integer i;
      for (i = 0; i < 2; i = i + 1) begin
	dbg_bus[i] <= 8'h00;
      end
      end

    else begin 
      for (j = 0; j < 2; j = j + 1) begin
	dbg_bus[j] <= nxt_dbg_bus[j];
      end
    end  

  //---------------------------------------------------------------------
  // debug
  //---------------------------------------------------------------------
  assign datafsm_is_idle = data_state[IDLE];
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Instantiations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

endmodule // dmu_tmu_dim_datafsm




