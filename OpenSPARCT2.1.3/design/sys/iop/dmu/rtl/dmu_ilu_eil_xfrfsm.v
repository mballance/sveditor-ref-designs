// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_ilu_eil_xfrfsm.v
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
module dmu_ilu_eil_xfrfsm (
				clk,
				rst_l,
				
				d2p_ehb_we,
				n_d2p_ehb_we,
				
				rcd_empty,
				rcd_deq,
				y2k_rcd_deq,

				xfrfsm_is_wfh,
				data_start,
				data_done,
				only_one_rd_and_can_move,

				ehb_full,

				has_payld,

				cib2eil_drain,

				// idle check
				xfrfsm_is_idle,

                                // Header parity invert
				ilu_diagnos_ehi_trig_hw_clr,
				ilu_diagnos_ehi_trig_hw_read,
				ilu_diagnos_ehi_par_hw_read,
				d2p_ehb_dpar_0,
				d2p_ehb_dpar,

				// debug 
				xfr_state );
    
  // synopsys sync_set_reset "rst_l"

  // >>>>>>>>>>>>>>>>>>>>>>>>> Parameter Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // states
  parameter // summit enum xfr_enum
	    IDLE      = 0,
	    DATA      = 1,
	    DEQ       = 2,
	    WFH       = 3;   // wait for EHB header space

  // state number
  parameter STATE_NUM = 4;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  //---------------------------------------------------------------------
  //  Clock and Reset Signals
  //---------------------------------------------------------------------
  input           clk;	             // input clock
  input 	  rst_l;	     // input reset
  
  //---------------------------------------------------------------------
  // rcd FIFO interface
  //---------------------------------------------------------------------
  input 	  rcd_empty;                             // from *_rcdbldr.v
  output 	  rcd_deq;                               //   to *_rcdbldr.v
  output 	  y2k_rcd_deq;

  //---------------------------------------------------------------------
  // EHB 
  //--------------------------------------------------------------------- 
  output 	  d2p_ehb_we;        // EHB write stroke
  output 	  n_d2p_ehb_we;    // drives d2p_ehb_we,    to *_bufmgr.v

  //---------------------------------------------------------------------
  // talk to datafsm.v
  //---------------------------------------------------------------------
  output 	  data_start;                            //   to *_datafsm.v
  input 	  data_done;                             // from *_datafsm.v
  input 	  only_one_rd_and_can_move;  // num_rds == 1 to DOU
  
  //---------------------------------------------------------------------
  // talk to bufmgr.v
  //---------------------------------------------------------------------
  input 	  ehb_full;                              // from *_bufmgr.v

  //---------------------------------------------------------------------
  // talk to rcdbldr.v
  //---------------------------------------------------------------------
  output 	  xfrfsm_is_wfh;
  input  	  has_payld;   
	
  //------------------------------------------------------------------------
  // special handling
  //------------------------------------------------------------------------ 
  input 	  cib2eil_drain;            // drain signal from CIB
  
  //---------------------------------------------------------------------
  //  debug signals
  //---------------------------------------------------------------------
  output [STATE_NUM-1:0] xfr_state;

  //---------------------------------------------------------------------
  //  idle check
  //---------------------------------------------------------------------
  output 		       xfrfsm_is_idle;
	 
  // SV 04/06/05   (EHB) Header Parity invert logic
  input [`FIRE_DLC_ILU_CIB_CSR_ILU_DIAGNOS_EHI_PAR_INT_SLC] ilu_diagnos_ehi_par_hw_read;
    // This signal provides the current value of ilu_diagnos_ehi_par.
  output  ilu_diagnos_ehi_trig_hw_clr;  // Hardware clear signal for
                                     // ilu_diagnos_ehi_trig. When set
                                     // ilu_diagnos will be set to zero.
  input ilu_diagnos_ehi_trig_hw_read;  // This signal provides the current value
                                      // of ilu_diagnos_ehi_trig.
  input [3:0]			d2p_ehb_dpar_0 ;
  output [3:0]			d2p_ehb_dpar ;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  reg 		  d2p_ehb_we;
  
  reg [STATE_NUM-1:0] xfr_state;
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - NON-FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~
  reg [STATE_NUM-1:0] n_xfr_state;

  reg 		      data_start;
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Zero In Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  // 0in one_hot -var xfr_state

  // 0in known_driven -var ehb_full

  /* 0in state -var xfr_state -val (4'b1 << IDLE) -next
                                   (4'b1 << IDLE)
                                   (4'b1 << DATA)
                                   (4'b1 << DEQ)
                                   (4'b1 << WFH) */

  /* 0in state -var xfr_state -val (4'b1 << DEQ) -next
                                   (4'b1 << IDLE)
                                   (4'b1 << DATA)
                                   (4'b1 << DEQ)
                                   (4'b1 << WFH) */
  
  /* 0in state -var xfr_state -val (4'b1 << DATA) -next
                                   (4'b1 << DATA)
                                   (4'b1 << WFH)
                                   (4'b1 << DEQ) */

  /* 0in state -var xfr_state -val (4'b1 << WFH) -next
                                   (4'b1 << WFH)
                                   (4'b1 << DEQ) */
 
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
      xfr_state <= n_xfr_state;
 
  // next xfr_state logic

  always @ (xfr_state or data_done or ehb_full or  
	    rcd_empty or has_payld or only_one_rd_and_can_move)
    begin
      n_xfr_state = {STATE_NUM{1'b0}};
      data_start = 1'b0;
      case (1'b1) // 0in < case -full // synopsys parallel_case 
	xfr_state[IDLE],
	xfr_state[DEQ]   :
	  casez ({rcd_empty, ehb_full, has_payld, only_one_rd_and_can_move}) // 0in < case -parallel -full
	    4'b1zzz:     n_xfr_state[IDLE] = 1'b1;
	    
	    4'b010z:     n_xfr_state[WFH] = 1'b1;
	    
	    4'b000z:     n_xfr_state[DEQ] = 1'b1;
	    
	    4'b0111: 
	      begin
		n_xfr_state[WFH] = 1'b1;
		data_start = 1'b1;
	      end
	    
	    4'b0011:
	      begin
		n_xfr_state[DEQ] = 1'b1;
		data_start = 1'b1;
	      end
	    
	    4'b0z10:     
	      begin
		n_xfr_state[DATA] = 1'b1;
		data_start = 1'b1;
	      end
	  endcase // casez({rcd_empty, ehb_full, has_payld, only_one_rd_and_can_move})
		
	xfr_state[DATA] :
	  casez ({data_done, ehb_full})
	    2'b10: n_xfr_state[DEQ] = 1'b1;
	    2'b11: n_xfr_state[WFH] = 1'b1;
	    2'b0z: n_xfr_state[DATA] = 1'b1;
	  endcase // casez({data_done, ehb_full})
	
	xfr_state[WFH] :
	  if (ehb_full) begin
	    n_xfr_state[WFH] = 1'b1;
	  end
	  else n_xfr_state[DEQ] = 1'b1;
      endcase // case(1'b1)
    end // always @ (xfr_state or data_done or ehb_full 
  
  
  //---------------------------------------------------------------------
  // outputs
  //---------------------------------------------------------------------
  assign n_d2p_ehb_we = n_xfr_state[DEQ] & (!cib2eil_drain);
  assign rcd_deq = n_xfr_state[DEQ];
  assign y2k_rcd_deq = xfr_state[DEQ];
  assign xfrfsm_is_wfh = xfr_state[WFH];

  always @ (posedge clk)
    if (!rst_l)
      d2p_ehb_we <= 1'b0;
    else
      d2p_ehb_we <= n_d2p_ehb_we; 

  //---------------------------------------------------------------------
  //  idle check output
  //---------------------------------------------------------------------
  assign xfrfsm_is_idle = xfr_state[IDLE];

  // SV  04/06/05
  assign  d2p_ehb_dpar = (d2p_ehb_dpar_0 ^ ({4{ilu_diagnos_ehi_trig_hw_read}} & ilu_diagnos_ehi_par_hw_read &
                                          {4{d2p_ehb_we}}));
  assign ilu_diagnos_ehi_trig_hw_clr = ilu_diagnos_ehi_trig_hw_read & d2p_ehb_we ;

  
endmodule // dmu_ilu_eil_xfrfsm

