// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_ilu_eil_datafsm.v
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
module dmu_ilu_eil_datafsm (
				 clk,
				 rst_l,
				 
				 y2k_buf_addr,
				 k2y_buf_data,
				 k2y_buf_dpar,
				 
				 d2p_edb_we,
				 d2p_edb_addr,
				 d2p_edb_data,
				 d2p_edb_dpar,
				 
				 data_start,
				 data_done,
				 only_one_rd_and_can_move,
				 
				 ecd_full,
				 erd_full,
				 edb_full_adv,
				 edb_wptr,
				 edb_wptr_inc,

				 align_addr,
				 payld_len,
				 d_ptr_in,
				 rcd_is_cpl,
				 rcd_is_cpl_reg,
				 
				 n_y2k_buf_addr_cl,

				 dou_sbd_vld_datafsm,

				 cib2eil_drain,

				 // idle check
				 datafsm_is_idle,

				 // parity invert signals
				 ilu_diagnos_edi_trig_hw_clr,
				 ilu_diagnos_edi_trig_hw_read,
				 ilu_diagnos_edi_par_hw_read,

 				 // debug signals
				 data_state,
				 set_residue,
				 clr_residue,
				 there_is_data_residue,
				 set_early_data_done,
				 clr_early_data_done,
				 early_data_done,
				 last_rd,
				 last_wr,
				 more_rds,
				 more_wrs,
				 dou_rptr_inc );
  

  // synopsys sync_set_reset "rst_l"
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Parameter Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // data_states
  parameter // summit enum data_enum
	    IDLE      = 0,
	    FIRST     = 1,
	    MOVE      = 2,
	    WFEDB     = 3,  // wait for EDB data space for last wr
	    WFDOUEDB  = 4;  // wait for EDB or DOU when more rds and more wrs


  // data_state number
  parameter STATE_NUM = 5;
 
  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  //------------------------------------------------------------------------
  //  Clock and Reset Signals
  //------------------------------------------------------------------------ 
  input           clk;	             // input clock
  input 	  rst_l;	     // input reset
    
  //------------------------------------------------------------------------
  // data buffer interface to DOU
  //------------------------------------------------------------------------
  output [7:0] 	  y2k_buf_addr;        // read address to DOU
  input [127:0]   k2y_buf_data;        // payload
  input [3:0] 	  k2y_buf_dpar;        // word parity for the payload

  //------------------------------------------------------------------------
  // EDB interface
  //------------------------------------------------------------------------ 
  output 	  d2p_edb_we;        // EDB write stroke
  output [7:0] 	  d2p_edb_addr;     
  output [127:0]  d2p_edb_data;      // EDB payload
  output [3:0] 	  d2p_edb_dpar;      // EDB word parity for payload

  //------------------------------------------------------------------------
  // talk to xfrsfm.v
  //------------------------------------------------------------------------
  input 	  data_start;        // trigger,                 from *_xfrfsm.v
  output 	  data_done;         // data transfer is done,     to *_xfrfsm.v
  output 	  only_one_rd_and_can_move;
  
  //------------------------------------------------------------------------
  // talk to bufmgr.v
  //------------------------------------------------------------------------
  input 	  ecd_full;
  input 	  erd_full;
  input 	  edb_full_adv;
  input [7:0]	  edb_wptr;
  output 	  edb_wptr_inc;
  
  //------------------------------------------------------------------------
  // talk to rcdbldr.v
  //------------------------------------------------------------------------
  input [5:2]	  align_addr;        // align address from rcd,  from *_rcdbldr.v
  input [7:0] 	  payld_len;         // only 8-bit due to max. MPS = 512B,
                                     // the possible max. value is 8'b10000000.
                                                              // from *_rcdbldr.v
  input [5:0] 	  d_ptr_in;          // DOU read start ptr = {d_ptr_in[5:0], align_addr[5:4]}
                                                              // from *_rcdbldr.v
  input 	  rcd_is_cpl;        //                          from *_rcdbldr.v
  input 	  rcd_is_cpl_reg;    // flopped rcd_is_cpl,      from *_rcdbldr.v

  //------------------------------------------------------------------------
  // talk to relgen.v
  //------------------------------------------------------------------------
  output [6:2]	  n_y2k_buf_addr_cl;
  
  input 	  dou_sbd_vld_datafsm;       // dou cl aveirable to pull
 
  //------------------------------------------------------------------------
  // special handling
  //------------------------------------------------------------------------ 
  input 	  cib2eil_drain;            // drain signal from CIB

  //---------------------------------------------------------------------
  //  debug signals
  //---------------------------------------------------------------------
  output [STATE_NUM-1:0]         data_state;
  output 			 set_residue;
  output 			 clr_residue;
  output 			 there_is_data_residue;
  output 			 set_early_data_done;
  output 			 clr_early_data_done;
  output 			 early_data_done;
  output 			 last_rd;
  output 			 last_wr;
  output 			 more_rds;
  output 			 more_wrs;
  output 			 dou_rptr_inc;
  
  output			 ilu_diagnos_edi_trig_hw_clr;
  input				 ilu_diagnos_edi_trig_hw_read;
  input  [`FIRE_DLC_ILU_CIB_CSR_ILU_DIAGNOS_EDI_PAR_INT_SLC] ilu_diagnos_edi_par_hw_read;

  //---------------------------------------------------------------------
  //  idle check
  //---------------------------------------------------------------------

  output 		       datafsm_is_idle;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  reg [7:0] 		       y2k_buf_addr;
  reg [3:2] 		       align_addr_reg;
  
  reg [STATE_NUM-1:0] 	       data_state;             // 0in one_hot
  
  reg [5:0] 		       num_rds;        // remaining read data beats to DOU
  reg [5:0] 		       num_wrs;        // remaining write data beats to EDB
  
  reg [127:0] 		       d2p_edb_data;
  reg [3:0] 		       d2p_edb_dpar_0;
  
  reg [127:0] 		       saved_data;
  reg [3:0] 		       saved_dpar;
  
  reg 			       there_is_data_residue;  // there is residue on the data_ps3 reg
  reg 			       early_data_done;
  
  reg 			       edb_we_ps1;
  reg [7:0] 		       edb_wptr_ps1;
  reg [3:2] 		       align_addr_ps1;
  reg  		       	       zero_fill_ps1;
  
  reg 			       edb_we_ps2;
  reg [7:0] 		       edb_wptr_ps2;
  reg [3:2] 		       align_addr_ps2;  
  reg  		       	       zero_fill_ps2;
  
  reg 			       edb_we_ps3;
  reg [7:0] 		       edb_wptr_ps3;
  
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - NON-FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~
  reg [7:0] 		       n_y2k_buf_addr;
  reg [6:0] 		       n_y2k_buf_addr_low;
  
  reg [STATE_NUM-1:0] 	       n_data_state;  
  
  reg [5:0] 		       n_num_rds;   // next value of num_rds
  reg [5:0] 		       n_num_wrs;   // next value of num_wrs
  
  reg [127:0] 		       n_d2p_edb_data;
  reg [3:0] 		       n_d2p_edb_dpar;
  
  reg 			       dou_rptr_inc;
  reg 			       num_wrs_dec;
  reg 			       set_residue;
  reg 			       clr_residue;
  reg 			       set_early_data_done;
  reg 			       clr_early_data_done;
  reg 			       data_done;
  reg			       drain_spcl_case;
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  wire 			       new_payld_len_inc;
  wire 			       payld_len_inc;
  wire 			       carry;
  
  wire [7:0] 		       new_payld_len;  // possible max. value is 8'b10000011
  wire [5:0] 		       init_num_rds;   // initial value of num_rds
                                               // possible max. value is 6'b100001
  wire [5:0] 		       init_num_wrs;   // initial value of num_wrs
                                               // possible max. value is 6'b100000
  
  wire [5:0] 		       num_rds_adv;    // num_rds - 1
  wire [5:0] 		       num_wrs_adv;    // num_wrs
  
  wire 			       more_rds;
  wire 			       more_wrs;
  wire 			       last_rd;
  wire 			       last_wr;
  
  wire 			       need_wait_for_dou_edb;
  
  wire 			       edb_we_ne0;
  wire [7:0] 		       edb_wptr_ne0;
  wire [3:2] 		       align_addr_ne0;
  wire [3:2] 		       align_addr_dp;
  wire  		       zero_fill_ne0;
  
  wire 			       only_one_rd;

  wire 			       rcd_is_cpl_cur;
  wire 			       edb_full;
  wire 			       edb_full_for_cur_rcd;
  wire 			       diff_rcd_type_from_prev;
  wire 			       can_write_one_db;
 
  // >>>>>>>>>>>>>>>>>>>>>>>>> Zero In Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  // 0in known_driven -var set_residue
  // 0in known_driven -var clr_residue
  // 0in known_driven -var set_early_data_done
  // 0in known_driven -var clr_early_data_done
  // 0in known_driven -var data_start
  // 0in known_driven -var there_is_data_residue
  // 0in known_driven -var edb_full
  // 0in known_driven -var early_data_done
  // 0in known_driven -var edb_full_adv
  // 0in known_driven -var dou_rptr_inc
  // 0in known_driven -var num_wrs_dec

  /* 0in custom -fire early_data_done -active data_state[WFEDB] 
                -message "HW bug if early_data_done is asserted in WFEDB state" */

  // 0in max -var new_payld_len -val 8'b10000011 -active data_start
  // 0in max -var init_num_rds -val 6'b100001 -active data_start
  // 0in max -var init_num_wrs -val 6'b100000 -active data_start

  /* 0in state -var data_state -val (5'b1 << IDLE) -next
                                    (5'b1 << IDLE)
                                    (5'b1 << FIRST) */
  	 
  /* 0in state -var data_state -val (5'b1 << FIRST) -next
                                    (5'b1 << IDLE)
                                    (5'b1 << FIRST)
                                    (5'b1 << MOVE)
                                    (5'b1 << WFEDB)
                                    (5'b1 << WFDOUEDB) */
	 
  /* 0in state -var data_state -val (5'b1 << MOVE) -next
                                    (5'b1 << IDLE)
                                    (5'b1 << FIRST)
                                    (5'b1 << MOVE)
                                    (5'b1 << WFEDB)
                                    (5'b1 << WFDOUEDB) */
	 
  /* 0in state -var data_state -val (5'b1 << WFEDB) -next
                                    (5'b1 << WFEDB)
                                    (5'b1 << MOVE) */
	 
  /* 0in state -var data_state -val (5'b1 << WFDOUEDB) -next
                                    (5'b1 << WFDOUEDB)
                                    (5'b1 << MOVE) */

//BP n2 5-31-05  
  // 0in custom -fire d2p_edb_we -active $0in_delay((cib2eil_drain & ~drain_spcl_case), 3) 
	
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL/Behavioral Model <<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  //---------------------------------------------------------------------
  // to figure out edb_full
  //--------------------------------------------------------------------- 
  assign rcd_is_cpl_cur = there_is_data_residue ? rcd_is_cpl_reg : rcd_is_cpl;
//BP 9-16-05  assign edb_full = (rcd_is_cpl_cur ? ecd_full : erd_full) & (~cib2eil_drain);
  assign edb_full = (rcd_is_cpl_cur ? ecd_full : erd_full) & (~cib2eil_drain | drain_spcl_case);

  //---------------------------------------------------------------------
  // track of left over on the saved_data reg
  // set_residue & clr_residue must not asserted at same time
  //--------------------------------------------------------------------- 
  always @ (posedge clk)
    if (~rst_l) there_is_data_residue <= 1'b0;
    else if (set_residue) begin 
      there_is_data_residue <= 1'b1;
    end
    else if (clr_residue) begin 
      there_is_data_residue <= 1'b0;
    end
  
  //---------------------------------------------------------------------
  // track of data_done signal for last rd, 2 more wrs case &
  //                               no more rd, last wr case
  // set_early_data_done & clr_early_data_done must not asserted at same time
  //--------------------------------------------------------------------- 
  always @ (posedge clk)
    if (~rst_l) early_data_done <= 1'b0;
    else if (set_early_data_done) begin 
      early_data_done <= 1'b1;
    end
    else if (clr_early_data_done) begin 
      early_data_done <= 1'b0;
    end
  
  //---------------------------------------------------------------------
  // FSM
  //---------------------------------------------------------------------

  // summit state_vector data_state enum data_enum
  
  // present data_state
  always @ (posedge clk)
    if (!rst_l) begin
      data_state <= {STATE_NUM{1'b0}};
      data_state[IDLE] <= 1'b1;
    end
    else
      data_state <= n_data_state;
 
  // next data_state logic
  assign num_rds_adv = num_rds - 1'b1;
  assign num_wrs_adv = num_wrs; 
  
  assign more_rds = |(num_rds_adv);
  assign more_wrs = |(num_wrs_adv);
  assign last_rd = (~(|num_rds_adv[5:1])) & num_rds_adv[0];
  assign last_wr = (~(|num_wrs_adv[5:1])) & num_wrs_adv[0];

  assign need_wait_for_dou_edb = edb_full | (~dou_sbd_vld_datafsm);

  assign edb_full_for_cur_rcd = rcd_is_cpl ? ecd_full : erd_full;
  assign diff_rcd_type_from_prev = rcd_is_cpl ^ rcd_is_cpl_reg;
  assign can_write_one_db = diff_rcd_type_from_prev ? ~edb_full_for_cur_rcd :
	 (there_is_data_residue ? ~edb_full_adv : ~edb_full);
  assign only_one_rd_and_can_move = only_one_rd & can_write_one_db;
  
  always @ (data_state or data_start or
	    more_rds or more_wrs or
	    last_rd or last_wr or
	    only_one_rd_and_can_move or 
	    edb_full or
	    there_is_data_residue or 
	    need_wait_for_dou_edb or
	    edb_full_adv or
	    early_data_done)
    begin
      n_data_state = {STATE_NUM{1'b0}};
      data_done = 1'b0;
      dou_rptr_inc = 1'b0;
      num_wrs_dec = 1'b0;
      set_residue = 1'b0;
      clr_residue = 1'b0;
      set_early_data_done = 1'b0;
      clr_early_data_done = 1'b0;
      
      case (1'b1) // 0in < case -full // synopsys parallel_case 
	data_state[IDLE]    :
	  if (data_start) begin 
	    clr_early_data_done = 1'b1;
	    dou_rptr_inc = 1'b1;
	    n_data_state[FIRST] = 1'b1;
	    set_residue = 1'b1;
	    if (only_one_rd_and_can_move) begin 
	      data_done = 1'b1;
	      set_early_data_done = 1'b1;
	    end
	  end
	  else n_data_state[IDLE] = 1'b1;
	
	data_state[FIRST],
	data_state[MOVE] :
	  begin
	    if (data_start) begin
	      clr_early_data_done = 1'b1;
	      dou_rptr_inc = 1'b1;
	      set_residue = 1'b1;
	      if (there_is_data_residue) begin 
		num_wrs_dec = 1'b1;
	      end
	      n_data_state[FIRST] = 1'b1;
	      if (only_one_rd_and_can_move) begin
		data_done = 1'b1;
		set_early_data_done = 1'b1;
	      end
	    end
	    else begin
	      case ({last_rd, last_wr, more_rds, more_wrs}) // 0in < case -parallel -full
		4'b1111:  // last rd, last wr
		  begin
		    if (need_wait_for_dou_edb) begin
		      n_data_state[WFDOUEDB] = 1'b1;
		    end
		    else begin
		      data_done = 1'b1;
		      dou_rptr_inc = 1'b1;	
		      num_wrs_dec = 1'b1;
		      clr_residue = 1'b1;
		      n_data_state[MOVE] = 1'b1;
		    end
		  end
		4'b0101: // no more rd, last wr
		  begin
		    if (edb_full) begin 
		      n_data_state[WFEDB] = 1'b1;
		    end
		    else begin
		      num_wrs_dec = 1'b1;
		      clr_residue = 1'b1;
		      n_data_state[MOVE] = 1'b1;
		      if (early_data_done) begin 
			clr_early_data_done = 1'b1;
		      end
		      else data_done = 1'b1;
		    end
		  end
		4'b0011: // more rd, more wr
		  begin
		    if (need_wait_for_dou_edb) begin
		      n_data_state[WFDOUEDB] = 1'b1;
		    end
		    else begin
		      dou_rptr_inc = 1'b1;	
		      num_wrs_dec = 1'b1;
		      n_data_state[MOVE] = 1'b1;
		    end
		  end
		4'b1011: // last rd, two more wrs
		  begin
		    if (need_wait_for_dou_edb) begin
		      n_data_state[WFDOUEDB] = 1'b1;
		    end
		    else begin
		      dou_rptr_inc = 1'b1;	
		      num_wrs_dec = 1'b1;
		      n_data_state[MOVE] = 1'b1;
		      if (~edb_full_adv) begin 
			data_done = 1'b1;
			set_early_data_done = 1'b1;
		      end
		    end
		  end 
		4'b0000: // no more rd, no more wr
		  n_data_state[IDLE] = 1'b1;
	      endcase // case({last_rd, last_wr, more_rds, more_wrs})
	    end
	  end

	data_state[WFEDB]:
	  begin
	    if (edb_full) begin
	      n_data_state[WFEDB] = 1'b1; // for last wr only
	    end
	    else begin
	      num_wrs_dec = 1'b1;
	      clr_residue = 1'b1;
	      n_data_state[MOVE] = 1'b1;
//	      if (early_data_done) begin
//		clr_early_data_done = 1'b1;
//	      end
//	      else data_done = 1'b1;
	      data_done = 1'b1;
	    end
	  end
	
	data_state[WFDOUEDB]:
	  begin
	    if (need_wait_for_dou_edb) begin
	      n_data_state[WFDOUEDB] = 1'b1;
	    end
	    else begin
	      case ({last_rd, last_wr, more_rds, more_wrs}) // 0in < case -parallel -full
		4'b1111:  // last rd, last wr
		  begin
		    data_done = 1'b1;
		    dou_rptr_inc = 1'b1;	
		    num_wrs_dec = 1'b1;
		    clr_residue = 1'b1;
		    n_data_state[MOVE] = 1'b1;
		  end
		4'b0011:  // more rd, more wr
		  begin
		    dou_rptr_inc = 1'b1;	
		    num_wrs_dec = 1'b1;
		    n_data_state[MOVE] = 1'b1;
		  end
		4'b1011: // last rd, two more wrs
		  begin
		    dou_rptr_inc = 1'b1;	
		    num_wrs_dec = 1'b1;
		    n_data_state[MOVE] = 1'b1;
		    if (~edb_full_adv) begin
		      data_done = 1'b1;
		      set_early_data_done = 1'b1;
		    end
		  end 
	      endcase // case({last_rd, last_wr, more_rds, more_wrs})
	    end
	  end
      endcase // case(1'b1)
    end
  
  
  //------------------------------------------------------------------------
  // Counters of num_rds & num_wrs
  //------------------------------------------------------------------------

  // compute init_num_rds & init_num_wrs
  assign new_payld_len_inc = |new_payld_len[1:0];
  assign payld_len_inc = |payld_len[1:0];

  assign {carry, new_payld_len[1:0]} = {1'b0, payld_len[1:0]} + {1'b0, align_addr[3:2]};
  assign new_payld_len[7:2] = carry ? (payld_len[7:2] + 1'b1) :
					payld_len[7:2];
  
  assign init_num_rds = new_payld_len_inc ? (new_payld_len[7:2] + 1'b1) :
					      new_payld_len[7:2];
  
  assign init_num_wrs = payld_len_inc ? (payld_len[7:2] + 1'b1) :
					  payld_len[7:2];

  assign only_one_rd = (new_payld_len_inc & (~(|new_payld_len[7:2]))) |
			 (~new_payld_len_inc & (~(|new_payld_len[7:3])));

  // present counter value
  always @ (posedge clk)
	if(~rst_l) begin
      num_rds <= {6{1'b0}};
      num_wrs <= {6{1'b0}};
    end
    else begin
      num_rds <= n_num_rds;
      num_wrs <= n_num_wrs;
    end 

  // next counter value of n_num_rds
  always @ (n_data_state or init_num_rds or num_rds or dou_rptr_inc)
    begin
      if (n_data_state[FIRST]) begin
	n_num_rds = init_num_rds; 
      end 
      else if (dou_rptr_inc) begin 
	n_num_rds = num_rds - 1'b1;
      end
      else n_num_rds = num_rds;
    end
 
  // next counter value of n_num_wrs
  always @ (n_data_state or init_num_wrs or num_wrs or num_wrs_dec)
    begin
      if (n_data_state[FIRST]) begin
	n_num_wrs = init_num_wrs;
      end
      else if (num_wrs_dec) begin 
	n_num_wrs = num_wrs - 1'b1;
      end
      else n_num_wrs = num_wrs;
    end
  
  //------------------------------------------------------------------------
  // outputs
  //------------------------------------------------------------------------
  assign d2p_edb_we = edb_we_ps3;
  assign d2p_edb_addr = edb_wptr_ps3;

  always @ (posedge clk)
    begin
      if (~rst_l) begin
	y2k_buf_addr <= {`FIRE_DLC_ERD_ADDR_WDTH{1'b0}};
      end
      else begin
	y2k_buf_addr <= n_y2k_buf_addr;
      end
    end
  
  always @ (n_data_state or y2k_buf_addr or d_ptr_in or 
	    align_addr or rcd_is_cpl or dou_rptr_inc)
    begin
      n_y2k_buf_addr_low = y2k_buf_addr[6:0];
      if (n_data_state[FIRST]) begin
//BP n2 6-22-04
//	n_y2k_buf_addr = {d_ptr_in[5:0],
//			  (rcd_is_cpl ? align_addr[5:4] : 2'b00)};
	n_y2k_buf_addr = (rcd_is_cpl ? {d_ptr_in[5:0],align_addr[5:4]} : {4'b1000,d_ptr_in[3:0]});
      end
      else if (dou_rptr_inc) begin
	n_y2k_buf_addr_low = y2k_buf_addr[6:0] + 1'b1;
	n_y2k_buf_addr = {y2k_buf_addr[7], n_y2k_buf_addr_low};
      end
      else n_y2k_buf_addr = y2k_buf_addr;
    end
  
  assign n_y2k_buf_addr_cl = n_y2k_buf_addr[6:2];
  
  //------------------------------------------------------------------------
  // data path control pipeline
  //------------------------------------------------------------------------
// BP n2 5-23-05 special case if drain is asserted and we had a data_start and data_stop
//					in the same cycle, ie pio wr
  always @ (posedge clk)
    begin
      if (~rst_l) begin
	drain_spcl_case <= 1'b0;
      end
      else if( data_start & ~cib2eil_drain) begin
	drain_spcl_case <= 1'b1;
      end
      else if( last_wr ) begin
	drain_spcl_case <= 1'b0;
      end
      else  begin
	drain_spcl_case <= drain_spcl_case;
      end
    end

  assign edb_wptr_inc = num_wrs_dec & (!cib2eil_drain | drain_spcl_case);

  assign edb_we_ne0 = edb_wptr_inc;
  assign edb_wptr_ne0 = edb_wptr;
  assign align_addr_ne0 = align_addr_reg[3:2];
  assign zero_fill_ne0 = last_wr & (~last_rd);

  always @ (posedge clk)
	if(~rst_l) begin
      edb_we_ps1 <= {{1'b0}};
      edb_wptr_ps1 <= {8{1'b0}};
      align_addr_ps1 <= {2{1'b0}};
      zero_fill_ps1 <= 1'b0;

      edb_we_ps2 <= {{1'b0}};
      edb_wptr_ps2 <= {8{1'b0}};
      align_addr_ps2 <= {2{1'b0}};
      zero_fill_ps2 <= 1'b0;
      
      edb_we_ps3 <= {{1'b0}};
      edb_wptr_ps3 <= {8{1'b0}};
    end
    else begin
      edb_we_ps1 <= edb_we_ne0;
      edb_wptr_ps1 <= edb_wptr_ne0;
      align_addr_ps1 <= align_addr_ne0;
      zero_fill_ps1 <= zero_fill_ne0;

      edb_we_ps2 <= edb_we_ps1;
      edb_wptr_ps2 <= edb_wptr_ps1;
      align_addr_ps2 <= align_addr_ps1;
      zero_fill_ps2 <= zero_fill_ps1;
      
      edb_we_ps3 <= edb_we_ps2;
      edb_wptr_ps3 <= edb_wptr_ps2;
    end

  //------------------------------------------------------------------------
  // data path
  //------------------------------------------------------------------------
  assign align_addr_dp = align_addr_ps2;

  // SV - 04/06/05
  assign d2p_edb_dpar = (d2p_edb_dpar_0 ^ ({4{ilu_diagnos_edi_trig_hw_read}} & ilu_diagnos_edi_par_hw_read &
					  {4{edb_we_ps3}}));
  assign ilu_diagnos_edi_trig_hw_clr = ilu_diagnos_edi_trig_hw_read & edb_we_ps3 ;

  always @ (posedge clk)
	if(~rst_l) begin
      saved_data <= {128{1'b0}};
      saved_dpar <= {4{1'b0}};
      d2p_edb_data <= {128{1'b0}};
   //SV   d2p_edb_dpar <= {4{1'b0}};
      d2p_edb_dpar_0 <= {4{1'b0}};
    end
    else begin
      saved_data <= k2y_buf_data;
      saved_dpar <= k2y_buf_dpar;
      d2p_edb_data <= n_d2p_edb_data;
   //SV   d2p_edb_dpar <= n_d2p_edb_dpar;
      d2p_edb_dpar_0 <= n_d2p_edb_dpar;
    end

  always @ (saved_data or saved_dpar or k2y_buf_data or k2y_buf_dpar or
	    align_addr_dp or zero_fill_ps2)
    case (align_addr_dp)
      2'b00: begin
        n_d2p_edb_data = saved_data;
        n_d2p_edb_dpar = saved_dpar;
      end
      2'b01: begin
        if (zero_fill_ps2) begin
          n_d2p_edb_data = {saved_data[95:0], 32'b0};
          n_d2p_edb_dpar = {saved_dpar[2:0], 1'b1};
        end
        else begin
        n_d2p_edb_data = {saved_data[95:0], k2y_buf_data[127:96]};
        n_d2p_edb_dpar = {saved_dpar[2:0], k2y_buf_dpar[3]};
       end
      end
      2'b10: begin
        if (zero_fill_ps2) begin
          n_d2p_edb_data = {saved_data[63:0], 64'b0};
          n_d2p_edb_dpar = {saved_dpar[1:0], 2'b11};
        end
        else begin
        n_d2p_edb_data = {saved_data[63:0], k2y_buf_data[127:64]};
        n_d2p_edb_dpar = {saved_dpar[1:0], k2y_buf_dpar[3:2]};
       end
      end
      2'b11: begin
        if (zero_fill_ps2) begin
          n_d2p_edb_data = {saved_data[31:0], 96'b0};
          n_d2p_edb_dpar = {saved_dpar[0], 3'b111};
        end
        else begin
        n_d2p_edb_data = {saved_data[31:0], k2y_buf_data[127:32]};
        n_d2p_edb_dpar = {saved_dpar[0], k2y_buf_dpar[3:1]};
       end
      end
    endcase // case(align_addr_dp)

  // flop align_addr[3:2]
  always @ (posedge clk)
	if(~rst_l) begin
      align_addr_reg <= {2{1'b0}};
    end
    else begin
      align_addr_reg <= align_addr[3:2];
    end

  //---------------------------------------------------------------------
  //  idle check output
  //---------------------------------------------------------------------

  assign datafsm_is_idle = data_state[IDLE];
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Debug Info <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

endmodule // dmu_ilu_eil_datafsm
