// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_tmu_dim_xfrfsm.v
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
module dmu_tmu_dim_xfrfsm (
				clk,
				rst_l,
		     		
				// ilu <-> dmu-tmu
				k2y_rcd_deq,
			 	
				// RMU interface
				tm2rm_rcd_enq,
				rm2tm_rcd_full,
			 
                                // internal interface
				diu_dma_full,
				diu_int_full,

				int_cl_req,
				
				rcd_is_msg, 
				rcd_is_msi, 
				rcd_is_cpld, 
				rcd_is_dmawr,

				data_start,
			        data_done,

				rcd_empty,
				rcd_deq,
				
				// debug
				low_dbg_sel_a,
				low_dbg_sel_b,
				xfrfsm_dbg_a,
				xfrfsm_dbg_b,

				// idle check
				xfrfsm_is_idle,
				tmu_is_idle);
  
  //synopsys sync_set_reset "rst_l"

  // >>>>>>>>>>>>>>>>>>>>>>>>> Parameter Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // states
  parameter // summit enum xfr_enum
	    IDLE         = 0,
	    DEQ          = 1,
	    DATA         = 2;

  // state number
  parameter STATE_NUM    = 3;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  

  //------------------------------------------------------------------------
  //  Clock and Reset Signals
  //------------------------------------------------------------------------
  input		  clk;		    
  input		  rst_l;
  
  //------------------------------------------------------------------------
  //   record interface to ILU
  //------------------------------------------------------------------------
  output 		k2y_rcd_deq;       

  //------------------------------------------------------------------------
  //   RMU interface
  //------------------------------------------------------------------------
  output 		tm2rm_rcd_enq;
  input 		rm2tm_rcd_full;

  //------------------------------------------------------------------------
  //   Internal interface
  //------------------------------------------------------------------------
  input 		diu_dma_full;          // from bufmgr.v
  input 		diu_int_full;          // from bufmgr.v

  output 		int_cl_req;            //   to bufmgr.v

  input 		rcd_is_msg;            // from rcdbldr.v
  input 		rcd_is_msi;            // from rcdbldr.v
  input 		rcd_is_cpld;           // from rcdbldr.v
  input 		rcd_is_dmawr;          // from rcdbldr.v
  
  output 		data_start;            //   to datafsm.v
  input 		data_done;             // from datafsm.v
  
  input 		rcd_empty;             // from rcdbldr.v
  output 		rcd_deq;               //   to rcdbldr.v
    
  //------------------------------------------------------------------------
  //   debug
  //------------------------------------------------------------------------
  input [2:0] 			      low_dbg_sel_a;
  input [2:0] 			      low_dbg_sel_b;
  output [`FIRE_DBG_DATA_BITS] 	      xfrfsm_dbg_a;
  output [`FIRE_DBG_DATA_BITS] 	      xfrfsm_dbg_b;

  //------------------------------------------------------------------------
  //   debug
  //------------------------------------------------------------------------
  output 			      xfrfsm_is_idle;
  input 			      tmu_is_idle;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  reg [STATE_NUM-1:0] 	xfr_state;  // 0in one_hot
  reg 			data_inprogress; // data fsm is busy

  reg [`FIRE_DBG_DATA_BITS] dbg_bus [0:1];
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - NON-FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~
  reg [STATE_NUM-1:0] 	nxt_xfr_state;

  reg [`FIRE_DBG_DATA_BITS] nxt_dbg_bus [0:1];
  reg [2:0] 		    dbg_sel [0:1];
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  wire 			rcd_has_payld;
  wire 			diu_no_space;

  integer 		i;
  integer 		j;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Zero In Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  // #0in back_pressure -back_pressure rm2tm_rcd_full -xmit_ready tm2rm_rcd_enq -min 1 -max 1
  // 0in assert_follower -leader rm2tm_rcd_full -follower ~tm2rm_rcd_enq -min 1 -max 1

  /* 0in state -var xfr_state -val (3'b1 << IDLE) -next
                                   (3'b1 << IDLE)
                                   (3'b1 << DATA)
                                   (3'b1 << DEQ) */

  /* 0in state -var xfr_state -val (3'b1 << DATA) -next
                                   (3'b1 << DATA)
                                   (3'b1 << DEQ) */

  /* 0in state -var xfr_state -val (3'b1 << DEQ) -next
                                   (3'b1 << IDLE)
                                   (3'b1 << DATA)
                                   (3'b1 << DEQ) */
  
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL/Behavioral Model <<<<<<<<<<<<<<<<<<<<<<<<<<<

  //---------------------------------------------------------------------
  // FSM
  //---------------------------------------------------------------------

  // summit state_vector xfr_state enum xfr_enum
  
  // present xfr_state
  always @ (posedge clk)
    if (!rst_l) begin
      xfr_state <= {STATE_NUM{1'b0}};
      xfr_state[IDLE] <= 1'b1;
    end
    else
      xfr_state <= nxt_xfr_state;

  // next xfr_state logic
  assign rcd_has_payld = rcd_is_msi | rcd_is_cpld | rcd_is_dmawr;
  assign diu_no_space = (rcd_is_dmawr & diu_dma_full) | 
			  ((rcd_is_msg | rcd_is_msi) & diu_int_full);
  
  always @ (xfr_state or rcd_empty or data_inprogress or rm2tm_rcd_full or
	    rcd_has_payld or diu_no_space)
    begin
      nxt_xfr_state = {STATE_NUM{1'b0}};
      case (1'b1)  // 0in < case -full   // synopsys parallel_case

	xfr_state[IDLE],
	xfr_state[DEQ]:
	  casez ({rcd_empty, diu_no_space, rm2tm_rcd_full, rcd_has_payld, data_inprogress}) // 0in < case -parallel -full
	    5'b1zzzz,
	    5'b01zzz,
	    5'b00111,
	    5'b0010z,
	    5'b00011:      nxt_xfr_state[IDLE] = 1'b1;
	    
	    5'b00110:      nxt_xfr_state[DATA] = 1'b1;
	    
	    5'b00010,
	      5'b0000z:    nxt_xfr_state[DEQ]  = 1'b1;
	  endcase // casez({rcd_empty, diu_no_space, rm2tm_rcd_full, rcd_has_payld, data_inprogress})
	
	xfr_state[DATA]:
	  if (rm2tm_rcd_full)
	    begin
	      nxt_xfr_state[DATA] = 1'b1;
	    end
	  else
	    begin
	     nxt_xfr_state[DEQ] = 1'b1;
	    end

      endcase // case(1'b1)
    end

  // outputs
  assign rcd_deq = nxt_xfr_state[DEQ];
  assign tm2rm_rcd_enq = xfr_state[DEQ];
  assign k2y_rcd_deq = xfr_state[DEQ];

  assign int_cl_req = nxt_xfr_state[DEQ] & (rcd_is_msi | rcd_is_msg);

  assign data_start = (rcd_has_payld & nxt_xfr_state[DEQ] & (~xfr_state[DATA])) |
			(nxt_xfr_state[DATA] & (~xfr_state[DATA]));
	    

  //---------------------------------------------------------------------
  // data_inprogress flop
  //---------------------------------------------------------------------
  always @ (posedge clk)
    if (!rst_l) data_inprogress <= 1'b0;
    else if (data_start ^ data_done) 
      if (data_start) data_inprogress <= 1'b1;
      else data_inprogress <= 1'b0;
 

  //---------------------------------------------------------------------
  // debug
  //---------------------------------------------------------------------

  always @ (low_dbg_sel_a or low_dbg_sel_b) begin
    dbg_sel[0] = low_dbg_sel_a;
    dbg_sel[1] = low_dbg_sel_b;
  end

  always @ (dbg_sel[0] or dbg_sel[1] or xfr_state or rcd_has_payld
	    or data_inprogress or rcd_empty or rm2tm_rcd_full or data_done
	    or diu_no_space or rcd_is_dmawr or diu_dma_full or rcd_is_msg
	    or rcd_is_msi or diu_int_full or tmu_is_idle) 
    begin
      for (i = 0; i < 2; i = i + 1) 
	begin 
	  case (dbg_sel[i]) // synopsys infer_mux
            3'b000: nxt_dbg_bus[i] = {xfr_state, rcd_is_dmawr, diu_dma_full,
				      rcd_is_msg, rcd_is_msi, diu_int_full};
            3'b001: nxt_dbg_bus[i] = {1'b0, tmu_is_idle, rcd_has_payld, 
				      data_inprogress, rcd_empty,
				      rm2tm_rcd_full, diu_no_space, data_done};
            3'b010: nxt_dbg_bus[i] = 8'h00;
            3'b011: nxt_dbg_bus[i] = 8'h00;
            3'b100: nxt_dbg_bus[i] = 8'h00;
            3'b101: nxt_dbg_bus[i] = 8'h00;
            3'b110: nxt_dbg_bus[i] = 8'h00;
            3'b111: nxt_dbg_bus[i] = 8'h00;
	  endcase
	end
    end
  
  assign xfrfsm_dbg_a = dbg_bus[0];
  assign xfrfsm_dbg_b = dbg_bus[1];

  always @ (posedge clk) 
	if(~rst_l) begin : dbg_rst
//	integer i;
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
  // idle check
  //---------------------------------------------------------------------
  assign xfrfsm_is_idle = xfr_state[IDLE];
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Instantiations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

endmodule // dmu_tmu_dim_xfrfsm




