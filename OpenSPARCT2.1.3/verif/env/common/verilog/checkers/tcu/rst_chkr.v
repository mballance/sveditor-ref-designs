// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: rst_chkr.v
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
module rst_chkr();

// 0in set_clock `CPU.rst.ccu_rst_sys_clk  -default -module rst_chkr

   //--------- RST interface assertions --------------
`ifdef X_GUARD
   /* 0in- known_driven 
      -name x_guard_rst_dmu_peu_wmr_       
      -var rst_dmu_peu_wmr_      
      -active rst_dmu_async_por_
      -module rst
      -group rst_chkr
   */
   /* 0in- known_driven 
      -name x_guard_rst_dmu_peu_por_       
      -var rst_dmu_peu_por_      
      -active rst_dmu_async_por_
      -module rst
      -group rst_chkr
   */ 

   // changed the following 3 assertions from:
   //-active mio_rst_pwron_rst_l      
   // because, with addition of sync_en flop, this signal 
   // will stay X until cmp clock starts.
   // This assertion needs to be tightened.  Oct 6 '05.

   /* 0in known_driven 
     -name x_guard_rst_niu_mac_	            
     -var rst_niu_mac_          
     -active (!init_state && !por1_state)
     -module rst
     -group rst_chkr
   */
   /* 0in known_driven 
     -name x_guard_rst_niu_wmr_	            
     -var rst_niu_wmr_          
     -active (!init_state && !por1_state)
     -module rst
     -group rst_chkr
   */
   /* 0in known_driven 
     -name x_guard_rst_mcu_selfrsh        
     -var rst_mcu_selfrsh       
     -active (!init_state && !por1_state)
     -module rst
     -group rst_chkr
   */
   /* 0in known_driven 
      -name x_guard_rst_ncu_unpark_thread  
      -var rst_ncu_unpark_thread 
      -active ccu_rst_sync_stable      
      -module rst
      -group rst_chkr
   */ 
// was: -active mio_rst_pwron_rst_l      

   /* 0in known_driven 
      -name x_guard_rst_ncu_xir            
      -var rst_ncu_xir_          
      -active ccu_rst_sync_stable      
      -module rst
      -group rst_chkr
   */
// was: -active mio_rst_pwron_rst_l      

   /* 0in- known_driven 
      -name x_guard_rst_por                
      -var rst_l2_por_           
      -active rst_dmu_async_por_
      -module rst
      -group rst_chkr
   */
   /* 0in- known_driven 
      -name x_guard_rst_wmr                
      -var rst_l2_wmr_	       
      -active rst_dmu_async_por_
      -module rst
      -group rst_chkr
   */
   /* 0in- known_driven 
      -name x_guard_rst_wmr_protect        
      -var rst_wmr_protect       
      -active rst_dmu_async_por_
      -module rst
      -group rst_chkr
   */
   /* 0in known_driven 
      -name x_guard_rst_state              
      -var state_q               
      -active mio_rst_pwron_rst_l      
      -module rst_fsm_ctl
      -group rst_chkr
   */
   /* 0in known_driven 
      -name x_guard_lock_count             
      -var lock_count_q          
      -active mio_rst_pwron_rst_l      
      -module rst_fsm_ctl
      -group rst_chkr
   */
   /* 0in known_driven 
      -name x_guard_prop_count             
      -var prop_count_q          
      -active mio_rst_pwron_rst_l      
      -module rst_fsm_ctl  
      -group rst_chkr
   *

   /* 0in known_driven 
     -name x_guard_ncu_rst_data           
     -var ncu_rst_data          
     -active ncu_rst_vld 
     -reset tb_top.default_reset_0in 
     -module rst
      -group rst_chkr
   */
   /* 0in known_driven 
     -name x_guard_rst_ncu_data           
     -var rst_ncu_data          
     -active rst_ncu_vld 
     -reset tb_top.default_reset_0in
     -module rst
      -group rst_chkr
   */
   /* 0in- known_driven 
     -name x_guard_rst_tcu_flush_init_req 
     -var rst_tcu_flush_init_req    
     -active rst_dmu_async_por_
     -module rst
      -group rst_chkr
   */
   /* 0in- known_driven 
     -name x_guard_rst_tcu_flush_stop_req 
     -var rst_tcu_flush_stop_req    
     -active rst_dmu_async_por_
     -module rst
      -group rst_chkr
   */
   /* 0in known_driven 
     -name x_guard_tcu_rst_flush_init_ack 
     -var tcu_rst_flush_init_ack    
     -active (mio_rst_pwron_rst_l & `RST.ccu_rst_sync_stable)  
     -module rst
      -group rst_chkr
   */
   /* 0in known_driven 
     -name x_guard_tcu_rst_flush_stop_ack   
     -var tcu_rst_flush_stop_ack    
     -active mio_rst_pwron_rst_l  
     -module rst
      -group rst_chkr
   */

   /* 0in known_driven 
     -name x_guard_tcu_sck_bypass   
     -var `TCU.tcu_sck_bypass    
     -active (`CPU.PWRON_RST_L & `CPU.TRST_L)  
     -module rst
     -group rst_chkr
   */
`endif   

   //--------- RST inline assertions (to be moved) --------------
   // 0in use_synthesis_case_directives -module rst_fsm_ctl
   
   //--------- Scan flush or simulation scan enable undefined --------------
   // 0000in disable_checker 1'b1 -type fire -name tb_top.cpu.rst.rst_fsm_ctl.rst_state_invalid
   // For some reason, we cannot disable checkers via -name unless we pass "-d tb_top" flag
   // commented 02/10/05 0in disable_checker 1'b1 -module rst_fsm_ctl 
 
// ----Verilog Checker Code ---------------------------

// ===== Define Declarations ================================

parameter	RST_SIM_FSM_WIDTH = 4,
		INIT_ST = 4'd0,
		POR1_ST = 4'd1,
		POR2_ST = 4'd2,
		WMR1_ST = 4'd3,
		WMR2_ST = 4'd4,
		WMR1GEN_ST = 4'd5,
		WMR2GEN_ST = 4'd6,
                UNPARK_ST = 4'd7,
                POR_UNPARK_ST = 4'd8,
		FSM_TIMEOUT_CYC = 6000;	 
parameter [15:0] PROP_TIME = 16'd16,
		 LOCK_TIME = 16'd16,
		 NIU_TIME = 16'd16;
// ========== RTL Model ===============================/

// ------------------------------------------------------
// Variable Declarations: Used by Verilog 0-in Checker Code
// -------------------------------------------------------

wire clk;
wire PWR_ON;
wire PB_RST;
wire [8:0] L2t_err;
wire ras_err;
wire rst_tcu_flush_init_req;
wire rst_wmr_protect;
wire unpark_thread;
wire [3:0] reset_gen_q;
wire xir_rst_active;
wire [15:0] prop_time; 
wire [15:0] lock_time; 
wire [15:0] niu_time; 
wire [15:0] ccu_time; 
wire [15:0] sync_stable_time; 
wire [15:0] dmu_time; 

reg [RST_SIM_FSM_WIDTH - 1 : 0] curr_st, next_st;
reg DEBUG_RST ; 
wire init_state;
wire por1_state; 
wire por2_state ; 
wire por_unpark_state ;
wire wmr1_state ; 
wire wmr2_state; 
wire unpark_state ;
wire wmr2gen_state;

assign prop_time = `RST.rst_fsm_ctl.prop_time_q;
assign lock_time = `RST.rst_fsm_ctl.lock_time_q;
assign niu_time = `RST.rst_fsm_ctl.niu_time_q;
assign ccu_time = `RST.rst_fsm_ctl.ccu_time_q ;
assign sync_stable_time = `RST.rst_fsm_ctl.ccu_time_q + 16'h3;
assign dmu_time = niu_time * 2;

assign init_state = (curr_st == INIT_ST) ? 1'b1: 1'b0;
assign por1_state = (curr_st == POR1_ST) ? 1'b1: 1'b0;
assign por2_state = (curr_st == POR2_ST) ? 1'b1: 1'b0;
assign por_unpark_state = (curr_st == POR_UNPARK_ST ) ? 1'b1: 1'b0;
assign wmr1_state = (curr_st == WMR1_ST) ? 1'b1: 1'b0;
assign wmr2gen_state = (curr_st == WMR2GEN_ST) ? 1'b1: 1'b0;
assign wmr2_state = (curr_st == WMR2_ST) ? 1'b1: 1'b0;
assign unpark_state = (curr_st == UNPARK_ST ) ? 1'b1: 1'b0;

//assign clk = `RST.ccu_rst_sys_clk;	
assign clk = `RST.rst_fsm_ctl.ref_clk;	
assign PWR_ON = `RST.mio_rst_pwron_rst_l;	
assign PB_RST = `RST.mio_rst_pb_rst_l;	
assign L2t_err = {`RST.l2t7_rst_fatal_error & `RST.rst_fsm_ctl.reset_fee_q[7], 
	          `RST.l2t6_rst_fatal_error & `RST.rst_fsm_ctl.reset_fee_q[6],
	          `RST.l2t5_rst_fatal_error & `RST.rst_fsm_ctl.reset_fee_q[5],
	          `RST.l2t4_rst_fatal_error & `RST.rst_fsm_ctl.reset_fee_q[4],
	          `RST.l2t3_rst_fatal_error & `RST.rst_fsm_ctl.reset_fee_q[3],
	          `RST.l2t2_rst_fatal_error & `RST.rst_fsm_ctl.reset_fee_q[2],
	          `RST.l2t1_rst_fatal_error & `RST.rst_fsm_ctl.reset_fee_q[1],
	          `RST.l2t0_rst_fatal_error & `RST.rst_fsm_ctl.reset_fee_q[0] };
                   	
assign ras_err = `RST.ncu_rst_fatal_error;	
assign rst_tcu_flush_init_req = `RST.rst_tcu_flush_init_req;	
assign rst_wmr_protect = `RST.rst_wmr_protect;	
assign unpark_thread = `RST.rst_ncu_unpark_thread;	
assign reset_gen_q = `RST.rst_fsm_ctl.reset_gen_q;
assign xir_rst_active = ((reset_gen_q[1] == 1'b1) || (`RST.mio_rst_button_xir_l == 1'b0)) ? 1'b1 : 1'b0;


initial
begin
	curr_st = INIT_ST;
	next_st = INIT_ST;
end

always @(posedge clk or negedge PWR_ON)
begin	
	if(!PWR_ON)
    	    curr_st = POR1_ST;
 	else
            curr_st = next_st;
end


always @(PWR_ON or 
	 PB_RST or 
	 L2t_err or 
	 ras_err or 
	 rst_tcu_flush_init_req or 
	 rst_wmr_protect or 
	 unpark_thread  or
         `RST.tcu_rst_flush_stop_ack or
	 curr_st )
begin
	case (curr_st)
	INIT_ST: begin
			DEBUG_RST <= 1'b0;
			if(PWR_ON == 1'b0 ) begin
				next_st <= POR1_ST;
				$dispmon("rst_chkr.v", `INFO, "PWRON_RST is %b", PWR_ON); 
                        end
			else if((PB_RST == 1'b0) || (|L2t_err) || ras_err || (reset_gen_q[0] == 1'b1))
				next_st <= WMR1GEN_ST;
			else if(reset_gen_q[3] == 1'b1) begin
				next_st <= WMR1GEN_ST;
				DEBUG_RST <= 1'b1;
			end
			//else
			//	next_st <= INIT_ST;
		  end
	POR1_ST: begin
			// Control o/ps from RST will be X until clocks stable
			// Email dated sept 29 '05
			if((`RST.ccu_rst_sync_stable == 1'b1) && 
			   (rst_tcu_flush_init_req == 1'b1))
				next_st <= POR2_ST;
			else
				next_st <= POR1_ST;
		  end
	POR2_ST: begin	
			if(`RST.tcu_rst_flush_stop_ack == 1'b1)
			begin
				next_st <= POR_UNPARK_ST;
			end
			else
				next_st <= POR2_ST;
			
			if (`RST.rst_fsm_ctl.prop_time_q != prop_time)
				$dispmon("rst_chkr.v", `ALWAYS, "PROP time delay setting in test differs from the setting in RTL");
	   	  end
	POR_UNPARK_ST: begin	
			if(unpark_thread == 1'b1)
			begin
				next_st <= INIT_ST;
			end
			if (`RST.rst_fsm_ctl.prop_time_q != prop_time)
				$dispmon("rst_chkr.v", `ALWAYS, "PROP time delay setting in test differs from the setting in RTL");
	   	  end

	WMR1GEN_ST: begin
			if(rst_tcu_flush_init_req == 1'b1)
				next_st <= WMR1_ST;
			else
				next_st <= WMR1GEN_ST;

	   	  end
	WMR1_ST: begin
			if(`RST.tcu_rst_flush_stop_ack == 1'b1)
				next_st <= WMR2GEN_ST;
			else
				next_st <= WMR1_ST;
	   	  end

	WMR2GEN_ST: begin
			if(rst_tcu_flush_init_req == 1'b1)
                                next_st <= WMR2_ST;
                        else
                       		next_st <= WMR2GEN_ST;

	end
	
	WMR2_ST: begin
              		if(`RST.tcu_rst_flush_stop_ack == 1'b1)
				next_st <= UNPARK_ST;
                        else
				next_st <= WMR2_ST;
                  end
	
	UNPARK_ST: begin
			if(unpark_thread == 1'b1) begin
				next_st <= INIT_ST;
			end
	   	  end
	default: begin
			next_st <= INIT_ST;
	   	  end
	endcase
	/* 0in state_transition 
          -var curr_st 
          -val INIT_ST 
          -next POR1_ST WMR1GEN_ST INIT_ST  
          -clock clk
          -group rst_chkr
        */
	/* 0in state_transition 
          -var curr_st 
          -val POR1_ST 
          -next POR1_ST POR2_ST 
          -clock clk
          -group rst_chkr
        */
	/* 0in state_transition 
          -var curr_st 
          -val POR2_ST 
          -next POR2_ST POR_UNPARK_ST
          -clock clk
          -group rst_chkr
        */
	/* 0in state_transition 
          -var curr_st 
          -val POR_UNPARK_ST 
          -next POR_UNPARK_ST INIT_ST POR1_ST
          -clock clk
          -group rst_chkr
        */
	/* 0in state_transition 
          -var curr_st 
          -val WMR1GEN_ST 
          -next WMR1GEN_ST WMR1_ST POR1_ST 
          -clock clk
          -group rst_chkr
        */
	/* 0in state_transition 
          -var curr_st 
          -val WMR1_ST 
          -next WMR1_ST WMR2GEN_ST POR1_ST 
          -clock clk
          -group rst_chkr
        */
	/* 0in state_transition 
          -var curr_st 
          -val WMR2GEN_ST 
          -next WMR2GEN_ST WMR2_ST POR1_ST 
          -clock clk
          -group rst_chkr
        */
	/* 0in state_transition 
          -var curr_st 
          -val WMR2_ST 
          -next WMR2_ST UNPARK_ST POR1_ST 
          -clock clk
          -group rst_chkr
        */
	/* 0in state_transition 
          -var curr_st -val UNPARK_ST 
          -next UNPARK_ST INIT_ST POR1_ST 
          -clock clk
          -group rst_chkr
        */

	// Temporary commented till we know the exact value for timeout 0in timeout -var curr_st -val FSM_TIMEOUT_CYC -name checker_code_deadlock -active (curr_st != INIT_ST) -clock `RST.ccu_rst_sys_clk
end


//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Section A : Assertions for clk_stop and scan_enable for flush >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//

// Following assertions for clock stop and scan enable signal check.

/* 0in assert_window 
   -start $0in_rising_edge(`TCU.rst_tcu_flush_init_req) 
   -stop $0in_rising_edge(`TCU.tcu_rst_flush_init_ack)
   -in `TCU.tcu_scan_en        `TCU.tcu_array_wr_inhibit 
       `TCU.tcu_se_scancollar_in `TCU.tcu_se_scancollar_out
       `TCU.tcu_spc0_clk_stop `TCU.tcu_spc1_clk_stop  
       `TCU.tcu_spc2_clk_stop  `TCU.tcu_spc3_clk_stop  
       `TCU.tcu_spc4_clk_stop  `TCU.tcu_spc5_clk_stop  
       `TCU.tcu_spc6_clk_stop  `TCU.tcu_spc7_clk_stop
       `TCU.tcu_l2d0_clk_stop  `TCU.tcu_l2d1_clk_stop  
       `TCU.tcu_l2d2_clk_stop  `TCU.tcu_l2d3_clk_stop  
       `TCU.tcu_l2d4_clk_stop  `TCU.tcu_l2d5_clk_stop  
       `TCU.tcu_l2d6_clk_stop  `TCU.tcu_l2d7_clk_stop
       `TCU.tcu_l2t0_clk_stop  `TCU.tcu_l2t1_clk_stop  
       `TCU.tcu_l2t2_clk_stop  `TCU.tcu_l2t3_clk_stop 
       `TCU.tcu_l2t4_clk_stop  `TCU.tcu_l2t5_clk_stop  
       `TCU.tcu_l2t6_clk_stop  `TCU.tcu_l2t7_clk_stop
       `TCU.tcu_l2b0_clk_stop  `TCU.tcu_l2b1_clk_stop  
       `TCU.tcu_l2b2_clk_stop  `TCU.tcu_l2b3_clk_stop 
       `TCU.tcu_l2b4_clk_stop  `TCU.tcu_l2b5_clk_stop  
       `TCU.tcu_l2b6_clk_stop  `TCU.tcu_l2b7_clk_stop
       `TCU.tcu_mcu0_clk_stop  `TCU.tcu_mcu0_dr_clk_stop 
       `TCU.tcu_mcu0_io_clk_stop `TCU.tcu_mcu1_clk_stop  
       `TCU.tcu_mcu1_dr_clk_stop `TCU.tcu_mcu1_io_clk_stop
       `TCU.tcu_mcu2_clk_stop  `TCU.tcu_mcu2_dr_clk_stop 
       `TCU.tcu_mcu2_io_clk_stop `TCU.tcu_mcu3_clk_stop  
       `TCU.tcu_mcu3_dr_clk_stop `TCU.tcu_mcu3_io_clk_stop
       `TCU.tcu_ccx_clk_stop   `TCU.tcu_sii_clk_stop     
       `TCU.tcu_sii_io_clk_stop `TCU.tcu_sio_clk_stop    
       `TCU.tcu_sio_io_clk_stop `TCU.tcu_ncu_clk_stop   
       `TCU.tcu_ncu_io_clk_stop  `TCU.tcu_efu_clk_stop    
       `TCU.tcu_efu_io_clk_stop `TCU.tcu_mio_clk_stop
       `TCU.tcu_db0_clk_stop   `TCU.tcu_db1_clk_stop 
   -module tcu 
   -clock l2clk
   -reset $0in_falling_edge(`RST.rst_tcu_pwron_rst_l) 
   -name aw_clk_stop_scan_assrt 
   -group rst_chkr
   */

/* 0in assert_sequence
   -var $0in_rising_edge(`TCU.tcu_bclk) $0in_rising_edge(`TCU.tcu_scan_en) $0in_rising_edge(`TCU.tcu_aclk)
   -min 12
   -module tcu 
   -clock l2clk
   -active `TCU.rst_tcu_flush_init_req
   -reset $0in_falling_edge(`RST.rst_tcu_pwron_rst_l) 
   -name aw_clk_stop_scan_assrt 
   -group rst_chkr
   */// Minimum 12 cycle delay: refer Tom email Date 10/18

//ASIC clk stops
/* 0in assert_window 
   -start `TCU.rst_tcu_flush_init_req 
   -stop $0in_rising_edge(`TCU.tcu_rst_flush_init_ack)
   -in `TCU.tcu_dmu_io_clk_stop `TCU.tcu_rdp_io_clk_stop
       `TCU.tcu_mac_io_clk_stop `TCU.tcu_rtx_io_clk_stop
       `TCU.tcu_tds_io_clk_stop `TCU.tcu_peu_pc_clk_stop
       `TCU.tcu_peu_io_clk_stop
   -module tcu 
   -clock l2clk
   -reset $0in_falling_edge(`RST.rst_tcu_pwron_rst_l) 
   -active ((wmr1_state | wmr2_state) & !DEBUG_RST)
   -name aw_clk_stop_asic_assrt 
   -group rst_chkr
   */

// Core , l2 and MCU not included becaoz those depend upon core available and bank available regs  in NCU

/* 0in assert_window 
   -start `TCU.rst_tcu_flush_stop_req 
   -stop `TCU.tcu_rst_flush_stop_ack
   -in !`TCU.tcu_scan_en   !`TCU.tcu_array_wr_inhibit 
       !`TCU.tcu_se_scancollar_in !`TCU.tcu_se_scancollar_out
       !`TCU.tcu_ccx_clk_stop   !`TCU.tcu_sii_clk_stop     
       !`TCU.tcu_sii_io_clk_stop !`TCU.tcu_sio_clk_stop    !`TCU.tcu_sio_io_clk_stop
       !`TCU.tcu_ncu_clk_stop   !`TCU.tcu_ncu_io_clk_stop  !`TCU.tcu_efu_clk_stop    
       !`TCU.tcu_efu_io_clk_stop !`TCU.tcu_mio_clk_stop
       !`TCU.tcu_db0_clk_stop   !`TCU.tcu_db1_clk_stop
   -module tcu 
   -clock l2clk
   -reset $0in_falling_edge(`RST.rst_tcu_pwron_rst_l) 
   -name aw_clk_stop_scan_deassrt 
   -group rst_chkr
   */

//<<<<< Section B : TCU-RST handshake signals >>>>>>>>>>>>>>>>>>>>>>//

/* 0in req_ack 
   -req `RST.rst_tcu_flush_stop_req 
   -ack `RST.tcu_rst_flush_stop_ack 
   -req_until_ack on 
   -module rst 
   -clock l2clk
   -name rq_ack_flush_stop  
   -areset (!`RST.mio_rst_pwron_rst_l || !`RST.rst_tcu_pwron_rst_l) 
   -group rst_chkr
   */

/* 0in req_ack 
   -req `RST.rst_tcu_flush_init_req 
   -ack `RST.tcu_rst_flush_init_ack
   -req_until_ack on  
   -module rst 
   -clock l2clk
   -name rq_ack_flush_init 
   -active (!init_state & !por1_state ) 
   -areset (!`RST.mio_rst_pwron_rst_l || !`RST.rst_tcu_pwron_rst_l  ) 
   -group rst_chkr
   */
//   -reset $0in_falling_edge(`RST.mio_rst_pwron_rst_l)  

/* 0in req_ack 
   -req `RST.rst_tcu_asicflush_stop_req
   -ack `RST.tcu_rst_asicflush_stop_ack
   -req_until_ack on 
   -module rst 
   -clock l2clk
   -name rq_ack_asicflush_stop  
   -areset (!`RST.mio_rst_pwron_rst_l || !`RST.rst_tcu_pwron_rst_l ) 
   -group rst_chkr
   */
//   -reset $0in_falling_edge(`RST.mio_rst_pwron_rst_l) 

// PROP_TIME delay for POR1, POR2 and WMR1
/* 0in assert_follower  
   -leader $0in_rising_edge(`RST.tcu_rst_flush_init_ack) 
   -follower $0in_rising_edge(`RST.rst_tcu_flush_stop_req) 
   -min prop_time 
   -active (por2_state | wmr1_state | wmr2_state ) 
   -module rst
   -clock `RST.ccu_rst_sys_clk 
   -name af_prop_time_delay_flush  
   -group rst_chkr
   */

//<<<<<<<Section C : ASIC block NIU reset  & PEU_DMU reset >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
// Check the assertion of asic warm reset
/* 0in assert_window 
   -start $0in_rising_edge(`RST.tcu_rst_flush_init_ack) 
   -stop $0in_rising_edge(`RST.rst_tcu_flush_stop_req) 
   -in !`RST.rst_niu_wmr_ !`RST.rst_dmu_peu_wmr_ !`RST.rst_mio_pex_reset_l !`RST.rst_l2_wmr_ 
   -module rst 
   -clock l2clk
   -name aw_niu_peu_dmu_wmr_assrt1 
   -active (!init_state && !DEBUG_RST) 
   -group rst_chkr
   */ 

// Check the deassertion of asic warm reset
// restored this assertion Sep 16 '05.
/* 0in assert_window 
   -start $0in_rising_edge(`RST.tcu_rst_flush_stop_ack ) 
   -stop $0in_rising_edge(`RST.rst_tcu_flush_init_req )
   -in  $0in_rising_edge(`RST.rst_niu_wmr_) 
	$0in_rising_edge(`RST.rst_dmu_peu_wmr_) 
	`RST.rst_mio_pex_reset_l 
	$0in_rising_edge(`RST.rst_l2_wmr_ )
   -module rst 
   -clock l2clk
   -name aw_niu_peu_dmu_wmr_deassrt 
   -active (!init_state && !DEBUG_RST) 
   -group rst_chkr
   */ 

// Check the assertion of asic por reset

// rst_niu_wmr_ assertion when MAC_PROTECT bit not set.  Sep 19 '05.
/* 0in assert_window 
   -start $0in_rising_edge(`RST.tcu_rst_flush_init_ack)  
   -stop $0in_rising_edge(`RST.rst_tcu_flush_stop_req) 
   -in !`RST.rst_niu_mac_ 
   -module rst 
   -clock l2clk
   -name aw_niu_mac_assrt 
   -active (!init_state && !DEBUG_RST && !`RST.rst_fsm_ctl.ssys_reset_q[6] && `RST.ccu_rst_change) 
   -group rst_chkr
   */ 

/* 0in assert_timer
  -var !`RST.rst_niu_mac_
  -min niu_time
  -name at_mac_pll_lock_delay
  -module rst
  -clock `RST.ccu_rst_sys_clk
  -reset $0in_falling_edge(`RST.rst_tcu_pwron_rst_l)
   -group rst_chkr
*/

// DH: 09/19/06 This checker is failing during FC full reset simulation
   
/* -0in- assert_timer
  -var !`RST.rst_dmu_peu_wmr_
  -min dmu_time
  -name at_dmu_peu_wmr_delay
  -module rst
  -clock `RST.ccu_rst_sys_clk
  -reset $0in_falling_edge(`RST.rst_tcu_pwron_rst_l)
  -group rst_chkr
*/

//<<<<<<<<  EFUSE related tcu-efu interface signals >>>>>>>>>>>>>>>>>>>>>>//

/* 0in assert_window 
   -start `TCU.tcu_rst_flush_stop_ack 
   -stop `TCU.tcu_efu_read_start
   -in (&`TCU.tcu_efu_rvclr)
   -module tcu 
   -clock l2clk
   -active ((por1_state | por_unpark_state) & (~`CPU.TESTMODE))
   -reset $0in_falling_edge(`RST.rst_tcu_pwron_rst_l) 
   -name aw_efu_rvclr 
   -group rst_chkr
   */

/* 0in assert_follower  
   -leader $0in_rising_edge((&`TCU.tcu_efu_rvclr)) 
   -follower $0in_rising_edge(`TCU.tcu_efu_read_start )
   -min 8
   -module tcu 
   -clock l2clk
   -name af_efu_rvclr_efu_read_start 
   -active (por1_state | por_unpark_state) 
   -group rst_chkr
   */

//<<<<<<<Section D : POR1 specific assertions >>>>>>>>>>>>>>>>>>>>>//
/* 0in assert_follower  
   -leader $0in_rising_edge(`RST.ccu_rst_sync_stable) 
   -follower $0in_rising_edge(`RST.rst_tcu_asicflush_stop_req )
   -max 64
   -module rst 
   -clock ccu_rst_sys_clk
   -name af_asicstop_req_assrt_por1 
   -active (por1_state) 
   -group rst_chkr
   */

/* 0in assert_follower  
   -leader $0in_rising_edge(`RST.mio_rst_pwron_rst_l) 
   -follower $0in_rising_edge(`RST.rst_ccu_pll_ ) 
   -max 5
   -module rst 
   -clock ccu_rst_sys_clk
   -name at_rst_ccu_pll -active (por1_state) 
   -group rst_chkr
   */  //RST_CCU interface assertion

/* 0in assert_follower  
   -leader $0in_rising_edge(`RST.rst_ccu_pll_) 
   -follower $0in_rising_edge(`RST.rst_ccu_) 
   -min lock_time 
   -active ( por1_state || (wmr1_state && `RST.ccu_rst_change))
   -module rst 
   -clock ccu_rst_sys_clk
   -name af_ccu_pll_rst_ccu  
   -group rst_chkr
   */ //RST_CCU interface assertion

/* 0in assert_window 
   -start `RST.rst_ccu_  
   -stop `RST.rst_tcu_asicflush_stop_req 
   -in `RST.ccu_rst_sync_stable
   -module rst 
   -clock l2clk
   -name aw_ccu_rst_sync_stable_por1 
   -group rst_chkr
   -active (por1_state) 
   */   
 
 wire asic_clk_stop , asic_clk_start;
 assign asic_clk_stop = `TCU.tcu_dmu_io_clk_stop & `TCU.tcu_rdp_io_clk_stop & 
			`TCU.tcu_rtx_io_clk_stop & `TCU.tcu_tds_io_clk_stop & 
			`TCU.tcu_peu_pc_clk_stop & `TCU.tcu_peu_io_clk_stop;
 assign asic_clk_start =  !`TCU.tcu_dmu_io_clk_stop & !`TCU.tcu_rdp_io_clk_stop & 
			  !`TCU.tcu_rtx_io_clk_stop & !`TCU.tcu_tds_io_clk_stop & 
			  !`TCU.tcu_peu_pc_clk_stop & !`TCU.tcu_peu_io_clk_stop;

/* 0in assert_window 
   -start `TCU.rst_tcu_asicflush_stop_req  
   -stop `TCU.tcu_rst_asicflush_stop_ack 
   -in asic_clk_start !`TCU.tcu_asic_scan_en
   -module tcu 
   -clock l2clk
   -name aw_asic_flushstop_req 
   -active (por1_state) 
   -group rst_chkr
   */   

// Clock contention prevention signals
/* 0in assert  -and
  -var !`RST.cluster_arst_l  `TCU.tcu_asic_scan_en  asic_clk_stop
  -module rst 
  -clock ccu_rst_sys_clk
  -name a_clk_contention_sigs 
  -active !`RST.mio_rst_pwron_rst_l 
  -group rst_chkr
*/

/* 0in assert_follower  
   -leader $0in_rising_edge(`RST.rst_ccu_) 
   -follower $0in_rising_edge(`RST.cluster_arst_l) 
   -min ccu_time
   -active por1_state 
   -module rst 
   -clock ccu_rst_sys_clk
   -name af_rst_ccu_cluster_arst_l  
   -group rst_chkr
*/
 
/* 0in assert_follower  
   -leader $0in_falling_edge(`TCU.tcu_asic_scan_en) 
   -follower $0in_falling_edge(asic_clk_stop) 
   -max 8 
   -active por1_state 
   -module tcu 
   -clock l2clk
   -name af_tcu_asic_scan_en_asic_clk_stop  
   -group rst_chkr
   */
// END Clock contention prevention signals
 
/* 0in assert_follower  
   -leader $0in_rising_edge(`RST.rst_tcu_pwron_rst_l) 
   -follower $0in_rising_edge(`TCU.rst_tcu_asicflush_stop_req ) 
   -min 8 
   -active por1_state 
   -module tcu 
   -clock l2clk
   -name af_tcu_pwron_asicflush_stop_req  
   -group rst_chkr
   *///Circuit delay requirement : Tom email date 10/13/05
 
/* 0in assert_follower  
   -leader $0in_rising_edge(`RST.tcu_rst_asicflush_stop_ack) 
   -follower (`RST.rst_niu_mac_ & `RST.rst_niu_wmr_) 
   -min niu_time 
   -active por1_state 
   -module rst 
   -clock ccu_rst_sys_clk
   -name af_rst_niu_mac_por  
   -group rst_chkr
   */ 

/* 0in assert_follower  
   -leader $0in_rising_edge(`RST.tcu_rst_asicflush_stop_ack) 
   -follower $0in_rising_edge(`RST.rst_dmu_peu_por_ ) 
   -min niu_time 
   -active por1_state 
   -module rst 
   -clock ccu_rst_sys_clk
   -name af_rst_dmu_peu_por  
   -group rst_chkr
   */ 

/* 0in assert_follower  
   -leader $0in_rising_edge(`RST.tcu_rst_asicflush_stop_ack) 
   -follower $0in_rising_edge(`RST.rst_dmu_async_por_ ) 
   -min niu_time 
   -active por1_state 
   -module rst 
   -clock ccu_rst_sys_clk
   -name af_rst_dmu_async_por  
   -group rst_chkr
   */ 

/* 0in assert_follower  
   -leader $0in_rising_edge(`RST.tcu_rst_asicflush_stop_ack) 
   -follower (`RST.rst_tcu_flush_stop_req ) 
   -min niu_time 
   -active por1_state 
   -module rst 
   -clock ccu_rst_sys_clk
   -name af_rst_tcu_flush_stop_req_por1  
   -group rst_chkr
   */ 

/* 0in assert_follower  
   -leader $0in_rising_edge(`RST.tcu_rst_flush_stop_ack) 
   -follower $0in_rising_edge(`RST.rst_l2_por_) 
   -min 1 
   -module rst 
   -clock ccu_rst_sys_clk
   -name af_rst_l2_por 
   -active (por1_state) 
   -group rst_chkr
   */ // Should be also specified for other phases. 03/17 This signal shd go away, when dont know 
      // Aug 26 - I guess will not go away 

/* 0in assert_window 
   -start `RST.tcu_rst_flush_stop_ack  
   -stop `RST.rst_tcu_flush_init_req 
   -in `RST.rst_l2_por_ 
   -module rst -name aw_rst_l2_por 
   -clock l2clk
   -active (por1_state ) 
   -group rst_chkr
   */  // Solved  03/17 This signal shd go away, when dont know
      // Aug 26 - I guess will not go away 

/* 0in assert_window 
   -start `RST.tcu_rst_flush_stop_ack  
   -stop `RST.tcu_bisx_done 
   -in `RST.tcu_rst_efu_done
   -module rst 
   -clock ccu_rst_sys_clk
   -name aw_efu_done_assrt 
   -active (por1_state) 
   -group rst_chkr
   */  

/* 0in assert_window 
   -start `RST.tcu_rst_flush_stop_ack  
   -stop `RST.rst_tcu_flush_init_req 
   -in `RST.tcu_bisx_done
   -module rst 
   -clock ccu_rst_sys_clk
   -name aw_bisx_done_assrt 
   -active ($0in_delay(por1_state,3)) 
   -group rst_chkr
   */  

/* 0in assert_window 
   -start `TCU.tcu_rst_flush_stop_ack  
   -stop `TCU.tcu_bisx_done 
   -in `TCU.tcu_mbist_bisi_en
   -module tcu 
   -clock l2clk
   -name aw_tcu_mbist_bisi_en 
   -active ($0in_delay(por1_state,3)) 
   -group rst_chkr
   */

//<<<<<< Section E : POR2 specific assertions >>>>>>>>>>>>>>>>>>>>>>>>>//

/* 0in assert_follower  
   -leader $0in_rising_edge(`TCU.tcu_rst_flush_stop_ack) 
   -follower $0in_rising_edge(`TCU.tcu_efu_read_start) 
   -min 8 
   -module tcu 
   -clock l2clk
   -name af_tcu_efu_read_start_delay 
   -group rst_chkr
   -active (por1_state | por2_state | por_unpark_state)
*/ //  Valid for por1 and por2 -- minimum 8 cycle delay after clock starting

/* 0in assert_window 
   -start `RST.tcu_rst_efu_done  
   -stop_count 50 
   -in `RST.rst_ncu_unpark_thread
   -module rst 
   -name aw_unpark_thread_assrt_por2_2 
   -clock iol2clk
   -active (por_unpark_state)
   -reset $0in_falling_edge(`RST.rst_tcu_pwron_rst_l) 
   -group rst_chkr
   */  

//<<<<<<< Section F : WMR1 specifics assertions>>>>>>>>>>>>>>>>>>>>>>>>>>>//
// ASIC should not be flushed during warm reset
/*0in assert
  -var !`TCU.tcu_asic_scan_en
  -module tcu
  -clock l2clk
  -name a_asic_scan_en
  -active (wmr1_state | wmr2_state)
   -group rst_chkr
*/

/*0in assert 
  -var `RST.rst_wmr_protect  
  -module rst 
  -clock ccu_rst_sys_clk
  -name a_rst_wmr_protect_assrt 
  -active (wmr1_state || wmr2_state)
   -group rst_chkr
*/

/* 0in assert_follower 
  -leader `RST.rst_fsm_ctl.ssys_reset_q[5]  
  -follower `RST.rst_mcu_selfrsh  
  -max 4
  -module rst 
  -max_leader_check off 
  -name a_rst_mcu_selfrsh 
  -clock iol2clk
   -group rst_chkr
  */

/* 0in assert_follower
  -leader $0in_rising_edge(`RST.tcu_rst_flush_init_ack)
  -follower $0in_falling_edge(`RST.rst_ccu_pll_)
  -max 14
  -known_follower
  -max_leader_check off
  -module rst
  -clock ccu_rst_sys_clk
  -name af_init_ack_rst_ccu_pll_wmr1
  -active (wmr1_state && `RST.ccu_rst_change)
   -group rst_chkr
  */  //RST_CCU interface assertion

/* 0in assert_follower  
  -leader $0in_rising_edge(`RST.tcu_rst_flush_init_ack) 
  -follower $0in_falling_edge(`RST.rst_ccu_)
  -max 14 
  -known_follower 
  -max_leader_check off 
  -module rst 
  -clock ccu_rst_sys_clk
  -name af_init_ack_rst_ccu_wmr1
  -active (wmr1_state && `RST.ccu_rst_change) 
   -group rst_chkr
  */  //RST_CCU interface assertion

// Stop TCU clock before reset pll
/* 0in assert_window 
  -start $0in_rising_edge(`RST.tcu_rst_flush_init_ack)  
  -stop $0in_rising_edge(`RST.rst_ccu_pll_) 
  -in $0in_rising_edge(`RST.rst_tcu_clk_stop)
  -module rst 
  -clock ccu_rst_sys_clk
  -name aw_rst_tcu_clk_stop_wmr1 
  -active (wmr1_state && `RST.ccu_rst_change) 
   -group rst_chkr
  */   

/* 0in assert_window 
  -start $0in_rising_edge(`RST.tcu_rst_flush_init_ack)  
  -stop $0in_rising_edge(`RST.rst_tcu_flush_stop_req) 
  -in $0in_falling_edge(`RST.rst_tcu_clk_stop)
  -module rst 
  -clock ccu_rst_sys_clk
  -name aw_rst_tcu_clk_stop_wmr1_deassert 
  -active (wmr1_state && `RST.ccu_rst_change) 
   -group rst_chkr
  */   

/* 0in assert_follower  
  -leader $0in_rising_edge(`RST.rst_ccu_pll_) 
  -follower $0in_rising_edge(rst_ccu_) 
  -min lock_time 
  -active (wmr1_state && `RST.ccu_rst_change) 
  -module rst 
  -clock ccu_rst_sys_clk
  -name af_rst_ccu_pll_rst_ccu_wmr1  
   -group rst_chkr
  */ //RST_CCU interface assertion

/* 0in assert_follower 
  -leader $0in_rising_edge(`RST.rst_ccu_)  
  -follower $0in_rising_edge(`RST.ccu_rst_sync_stable) 
  -max sync_stable_time
  -module rst 
  -clock ccu_rst_sys_clk
  -name af_ccu_rst_sync_stable_wmr1 
  -active (wmr1_state && `RST.ccu_rst_change) 
   -group rst_chkr
  */   //RST_CCU interface assertion

/* Comment for BUGID 119939 0in assert_follower  
  -leader $0in_rising_edge(`RST.ccu_rst_sync_stable) 
  -follower $0in_falling_edge(`RST.rst_tcu_clk_stop)
  -max 64 
  -known_follower 
  -max_leader_check off 
  -module rst 
  -clock ccu_rst_sys_clk
  -name af_deassert_tcu_clk_stop_wmr1
  -active (wmr1_state && `RST.ccu_rst_change) 
   -group rst_chkr
  */  

// No rst signals to CCU when chng=0 or wmr2
/* 0in assert 
   -and -var `RST.rst_ccu_pll_  `RST.rst_ccu_
   -module rst 
   -name a_rst_ccu_pll_wmr 
   -clock ccu_rst_sys_clk
   -active (wmr2_state || (wmr1_state && !`RST.ccu_rst_change) )
   -message "Reset signal to ccu should NOT be asserted during this warm reset" 
   -group rst_chkr
   */   //RST_CCU interface assertion

//Transition from WMR1 to WMR2 check
/* 0in assert_window 
   -start `RST.tcu_rst_flush_stop_ack  
   -stop `RST.rst_tcu_flush_init_req 
   -in `RST.tcu_bisx_done
   -module rst 
   -clock ccu_rst_sys_clk
   -name aw_bisx_done_assrt_wmr1 
   -active (wmr1_state | wmr2gen_state) 
   -group rst_chkr
   */  
//<<<<<<< Section G : WMR2 specific assertions>>>>>>>>>>>>>>>>>>>>>>//

/* 0in assert_follower  
  -leader $0in_rising_edge(`RST.tcu_rst_flush_stop_ack) 
  -follower $0in_rising_edge(`RST.rst_ncu_unpark_thread) 
  -known_follower 
  -assert_follower off 
  -max_leader_check off 
  -module rst 
  -clock l2clk
  -name af_unpark_thread_assrt_wmr2 
  -active (wmr2_state || unpark_state) 
   -group rst_chkr
  */ 

/* 0in assert_follower
  -leader $0in_rising_edge(`RST.tcu_rst_flush_stop_ack)
  -follower $0in_rising_edge(`RST.rst_niu_wmr_)
  -min niu_time
  -name af_wmr2_niu_time_wait
  -module rst
  -clock ccu_rst_sys_clk
  -active ((wmr2_state | unpark_state) & !DEBUG_RST)
   -group rst_chkr
  */ 
  

//<<<<<< Section H: XIR sequence check assertions >>>>>>>>>>>>>>>>>>>//
/* 0in assert_follower 
   -leader $0in_rising_edge(xir_rst_active) 
   -follower $0in_falling_edge(`RST.rst_ncu_xir_) 
   -known_follower 
   -assert_follower off 
   -max_leader_check off 
   -module rst
   -clock iol2clk 
   -name af_rst_ncu_xir_done 
   -active `RST.rst_ncu_xir_ 
   -group rst_chkr
   */
 
/* 0in req_ack 
  -req !`RST.rst_ncu_xir_ 
  -ack `RST.ncu_rst_xir_done  
  -req_until_ack on 
  -module rst 
  -clock iol2clk 
  -name rq_ack_ncu_xir_done 
  -reset ($0in_falling_edge(`RST.mio_rst_pwron_rst_l) || !init_state )
   -group rst_chkr
  */

//<<<<<<<<< Section I: Miscellaneous >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//

//Ensure unpark_thread is not asserted during any phase other than por2 and wmr2

// commented out the following Nov 2 '05.
// It was firing at the end of WMR2 that was initiated by:
// l2t1_fatal_error
// l2t3_fatal_error
// l2t4_fatal_error and
// l2t6_fatal_error in tcu_rst_wmr_L2T_error.vr at 84702500ps.

/* 0in assert 
   -var !`RST.rst_ncu_unpark_thread  
   -module rst -name a_rst_ncu_unpark_thread 
   -active (por1_state || por2_state || wmr1_state || wmr2_state) 
   -clock clk
   -message "Signal should not have been asserted : unpark_thread"
   -group rst_chkr
*/


/*  0in assert 
   -var `RST.rst_dmu_peu_por_  
   -module rst 
   -clock ccu_rst_sys_clk
   -name a_rst_dmu_peu_por_ 
   -active ((init_state | wmr1_state | wmr2_state) & PWR_ON ) 
   -message "Signal should not have been asserted : rst_dmu_peu_por_" 
   -group rst_chkr
   */

// Removed the following 2 assertions because they are no longer valid for 
// the new timing requirements on these asic block reset signal
/* Remove0in assert 
   -var `RST.rst_niu_wmr_
   -module rst 
   -clock ccu_rst_sys_clk
   -name a_rst_niu_wmr_ 
   -active ((init_state & PWR_ON & !`RST.rst_fsm_ctl.data_in_sys[0] & !`RST.rst_fsm_ctl.ssys_reset_addr) | 
   ((wmr1_state | wmr2_state) & DEBUG_RST) )   
   -message "Signal should not have been asserted : rst_niu_wmr_" 
   -group rst_chkr
   */
/* Remove0in assert 
   -var `RST.rst_dmu_peu_wmr_  
   -module rst 
   -clock ccu_rst_sys_clk
   -name a_rst_dmu_peu_wmr 
   -active ((init_state & PWR_ON & !`RST.rst_fsm_ctl.data_in_sys[1] & !`RST.rst_fsm_ctl.ssys_reset_addr) | 
   ((wmr1_state | wmr2_state) & DEBUG_RST) )  
   -message "Signal should not have been asserted : rst_dmu_peu_wmr_" 
   -group rst_chkr
   */

// MAC_PROTECT bit to disable reset signal to niu mac
/* 0in assert
  -var `RST.rst_niu_mac_
  -name assert_niu_mac_
  -module rst
  -clock ccu_rst_sys_clk
  -active `RST.rst_fsm_ctl.ssys_reset_q[6]
  -message "Signal should not have been asserted : rst_niu_mac_" 
 -group rst_chkr
*/

//<<<<<<<< Section J: MIO interface assertion >>>>>>>>>>>>>>>>>>>>>>//

/* 0in assert 
   -var `RST.rst_mio_ssi_sync_l  
   -module rst 
   -clock ccu_rst_sys_clk
   -name a_rst_mio_ssi_sync_l 
   -active ($0in_delay(por1_state,5) | por2_state | wmr1_state | wmr2_state )  
   -message "Signal should not have been asserted : rst_mio_ssi_sync_l" 
   -group rst_chkr
   */


/* 0in assert_follower
   -leader $0in_falling_edge(tcu_scan_en)
   -follower $0in_rising_edge(tcu_rst_flush_stop_ack)
   -min 4
   -module rst
   -active (!init_state)
   -clock l2clk
   -name scan_en_time_delay_flush
   -group rst_chkr
   */


//<<<<<<<< Section K: Scan_mode assertion >>>>>>>>>>>>>>>>>>>>>>//

/* 0in assert 
   -var !`RST.tcu_rst_scan_mode  
   -module rst 
   -clock ccu_rst_sys_clk
   -name a_tcu_rst_scan_mode 
   -active ((!`CPU.TESTMODE) & (!init_state))  
   -message "Signal should not have been asserted : tcu_rst_scan_mode" 
   -group rst_chkr
   */
endmodule // rst_chkr


