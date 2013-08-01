// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ilu_peu_checkers.v
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
module ilu_peu_checkers;

    
    
   //-----------------------------------------------------------------------
   // Disabling the Checkers for a certain time at the beginning of the sim
   //
   // The before_rst signal is used to disable all checkers for a specific
   // delay at the start of simulation.  The '#120' delay should be modified
   // as necessary. Alternatively, the disable_checker directive can be
   // altered to use a signal in the design (other than the before_rst
   // signal) that informs 0-In when the design has been reset and the 
   // inputs are stable.
   //-----------------------------------------------------------------------

    //----------------------------------------------------------------------
    //  Disable case checkers in IHP for a cycle after reset
    //----------------------------------------------------------------------


// ****************************************************************************
// This is the N2 peu portion 
// ****************************************************************************
`define ilu_top `CPU.dmu.ilu
`define ilu_clock `CPU.dmu.ilu.l1clk
// `define ilu_warmreset `CPU.dmu.ilu.isb.rst_cct.rst_l_out 
`define ilu_warmreset `CPU.dmu.ilu.j2d_rst_l 

`define peu_clock       `PEU.pc_clk
`define peu_warmreset   `PEU.peu_ptl.j2p_rst_l
`define peu_debug_a_reg `PEU.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.tlu_dbg_sel_a
`define peu_ptl_etl_hcs `PEU.peu_ptl.etl.hcs


reg no_edb_par ;
reg no_ibc_req_ack ;
reg no_mps_val_chk ;
initial begin // {
    @(posedge tb_top.cpu.peu.iol2clk) ;
    if ($test$plusargs("no_dmu2peu_edb_parity"))
        no_edb_par <= 1;
    else
        no_edb_par <= 0;
   
    if ($test$plusargs("no_dmu2peu_ibc_req_ack"))
        no_ibc_req_ack <= 1;
    else
        no_ibc_req_ack <= 0;
   
    if ($test$plusargs("no_dmu2peu_mps_val_chk"))
        no_mps_val_chk <= 1;
    else
        no_mps_val_chk <= 0;
   
end //}

//  0in disable_checker -name *d2p_edb_odd_parity* no_edb_par

//  0in disable_checker -name *d2p_ibc_req_ack*    no_ibc_req_ack

//  0in disable_checker -name *p2d_mps_value*      no_mps_val_chk
//  0in disable_checker -name *p2d_mps_less_than*  no_mps_val_chk


	// p2d_ihb_data is matched by y2k_rcd when y2k_rcd_enq is active
        //    p2d_ihb_data is qualified by ihb_rptr_inc 

      // use the internal is_ihb_rcd signal to check the ihb data on y2k_rcd only, no   
      // completion or drain cases
// AT:                -ret    $0in_delay(`CPU.dmu.ilu.iil.rcdbldr.is_ihb_rcd)
// y2k_rcd[115:109] also does NOT follow p2d_ihb_data[126:120] when the ingress TLP is not
// a supported req.  (See line 233-234 :/design/dmu/dmu_ilu_l/dmu_ilu/rtl/dmu_ilu_iil_rcdbldr.v.)

        /* 0in oid
                -req $0in_delay(`CPU.dmu.ilu.iil.xfrfsm.ihb_rptr_inc)
                -req_id `CPU.dmu.ilu.p2d_ihb_data[126:120]
                -ret $0in_delay(!`CPU.dmu.ilu.iil.rcdbldr.is_unsupported_req & 
				`CPU.dmu.ilu.iil.rcdbldr.is_ihb_rcd )
                -ret_id `CPU.dmu.ilu.y2k_rcd[115:109]
                -clock  `ilu_clock
                -reset  ~`ilu_warmreset
 		-max_ids_check off
 		-max_count_per_id_check off
                -name   AC_y2k_rcd_follows_p2d_ihb_data

        */

       // k2y_rcd when k2y_rcd_enq active is matched by d2p_ehb_data when d2p_ehb_we is active
        /* 0in oid 
		-req	`CPU.dmu.ilu.k2y_rcd_enq 
		-req_id `CPU.dmu.ilu.k2y_rcd[123:117]
		-ret	`PEU.d2p_ehb_we	
		-ret_id	`PEU.d2p_ehb_data[126:120] 
                -clock  `ilu_clock
                -reset  ~`ilu_warmreset
 		-max_ids_check off
 		-max_count_per_id_check off
		-name   AC_d2p_ehb_data_follows_k2y_rcd 
		
			
        */ 




  // Parity check on d2p_edb_data  
    // parity bit 0 
    /* 0in odd_parity 	-var ({`PEU.d2p_edb_data[31:0], `PEU.d2p_edb_dpar[0]})
			-active `PEU.d2p_edb_we
                      	-clock `ilu_clock 
                      	-reset ~`ilu_warmreset
                        -module peu 
                      	-name AC_d2p_edb_odd_parity_bit_0   
    */ 
  
    // parity bit 1 
    /* 0in odd_parity 	-var {`PEU.d2p_edb_data[63:32], `PEU.d2p_edb_dpar[1]}
			-active `PEU.d2p_edb_we
                      	-clock `ilu_clock 
                      	-reset ~`ilu_warmreset
                        -module peu 
                      	-name AC_d2p_edb_odd_parity_bit_1 
    */ 

    // parity bit 2 
    /* 0in odd_parity 	-var {`PEU.d2p_edb_data[95:64], `PEU.d2p_edb_dpar[2]}
			-active `PEU.d2p_edb_we
                      	-clock `ilu_clock 
                      	-reset ~`ilu_warmreset
                        -module peu 
                      	-name AC_d2p_edb_odd_parity_bit_2 
    */ 

 
    // parity bit 3 
    /* 0in odd_parity 	-var {`PEU.d2p_edb_data[127:96], `PEU.d2p_edb_dpar[3]}
			-active `PEU.d2p_edb_we
                      	-clock `ilu_clock 
                      	-reset ~`ilu_warmreset
                        -module peu 
                      	-name AC_d2p_edb_odd_parity_bit_3 
    */ 

  // ===  p2d_mps

    // == value check 0,1,2
    /* 0in value  	-var `PEU.p2d_mps
            		-val 0 1 2
            		-clock `peu_clock
                      	-reset ~`peu_warmreset
			-module peu
                        -name  AC_p2d_mps_value_check
    */ 

    // == check against dev_ctl_reg[7:0] 
    /* 0in assert_follower 
			-leader `PEU.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.dev_ctl.dev_ctl_0.dev_ctl_csrbus_read_data[7:5] 
      			-follower `PEU.p2d_mps
 			-max 3 
                        -clock `peu_clock
                        -reset ~`peu_warmreset
			-module peu
                        -name  AC_p2d_mps_against_dev_ctl_reg
    */ 

   // == check p2d_mps < peu device capability register mps field
     wire [2:0] peu_dev_cap_reg_mps = `PEU.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.dev_cap.dev_cap_csrbus_read_data[2:0] ;  
    /* 0in max 
                        -var `PEU.p2d_mps 
			-val peu_dev_cap_reg_mps  
                        -clock `peu_clock
                        -reset ~`peu_warmreset
                        -module peu
                        -name AC_p2d_mps_less_than_dev_cap_mps

    */ 
 
   
 // === p2d_drain active when ehb or edb has parity error or when link is down
 //   === et2ct_header_parity_err = ehb and edb parity 
 	//  -leader (`PEU.peu_ptl.etl.hcs.et2ct_header_parity_err | `PEU.peu_ptl.etl.lcs.et2ct_data_parity_err | `PEU.peu_ptl.ctb.tlr.csr.rio.lpu_ldn )
   /* 
      0in assert_follower 
 	-leader ($0in_rising_edge(`PEU.peu_ptl.etl.hcs.et2ct_header_parity_err | `PEU.peu_ptl.etl.lcs.et2ct_data_parity_err))
        -follower ($0in_rising_edge(`PEU.p2d_drain))
        -max 4 
        -clock `peu_clock
        -reset ~`peu_warmreset
        -name  AC_p2d_drain_active  
   */ 

// AT-: All the signals are in peu_clock domain:         -clock `ilu_clock
// AT-:         -reset ~`ilu_warmreset





  //-----------------------------------------------------------------------
  // Checkers for the gray code pointers
  //
  // There is a checker for each side of the clock domain boundary.
  //
  //-----------------------------------------------------------------------

    //== d2p
    /* 0in gray_code -clock `ilu_clock  
		     -reset (~`ilu_warmreset | `PEU.p2d_drain)
		     -var `PEU.d2p_ech_wptr 
                     -name AC_d2p_ech_wptr_gray_code */
    /* 0in gray_code -clock `ilu_clock 
		     -reset (~`ilu_warmreset | `PEU.p2d_drain)
                     -var `PEU.d2p_erh_wptr 
                     -name AC_d2p_erh_wptr_gray_code */

    //== p2d 
    /* 0in gray_code -clock `peu_clock 
		     -reset (~`peu_warmreset | `PEU.p2d_drain)
		     -var `PEU.p2d_ihb_wptr 
                     -name AC_p2d_ihb_wptr_gray_code */
    /* 0in gray_code -clock `peu_clock 
		     -reset (~`peu_warmreset | `PEU.p2d_drain)
		     -var `PEU.p2d_ech_rptr 
                     -name AC_p2d_ech_rptr_gray_code */
    /* 0in gray_code -clock `peu_clock 
		     -reset (~`peu_warmreset | `PEU.p2d_drain)
		     -var `PEU.p2d_erh_rptr 
                     -name AC_p2d_erh_rptr_gray_code */
    /* 0in gray_code -clock `peu_clock 
		     -reset (~`peu_warmreset | `PEU.p2d_drain)
		     -var `PEU.p2d_ecd_rptr 
                     -name AC_p2d_ecd_rptr_gray_code */
    /* 0in gray_code -clock `peu_clock 
		     -reset (~`peu_warmreset | `PEU.p2d_drain)
		     -var `PEU.p2d_erd_rptr 
                     -name AC_p2d_erd_rptr_gray_code */



    //=== p2d, d2p request follows acknowlege
    //    Let 0in infer the transmit and receive clocks
    // /* 0in req_ack 	`PEU.p2d_cto_req `PEU.d2p_cto_ack  
    // peu.d2p_cto_ack = peu.peu_ptl.rsb.rsb_ctrl.n_cto_ack_reg
    /* 0in req_ack 	-req	`PEU.p2d_cto_req 
			-ack `PEU.peu_ptl.rsb.rsb_ctrl.n_cto_ack_reg  
			-req_until_ack
 			-ack_until_req_deassert
     			-min 2 -max 10 
			-clock `peu_clock
			-reset ~`peu_warmreset
			-name AC_p2d_cto_req_ack 
    */
             
    // /* 0in req_ack `PEU.d2p_csr_req `PEU.p2d_csr_ack  
    // peu.d2p_csr_req = peu.peu_ptl.ctb.dcd.req
    /* 0in req_ack 	-req `PEU.peu_ptl.ctb.dcd.req 
			-ack `PEU.p2d_csr_ack  
			-req_until_ack
 			-ack_until_req_deassert
			-clock `peu_clock
			-reset ~`peu_warmreset
		    	-name AC_d2p_csr_req_ack -max 100  */ 

    // /* 0in req_ack `PEU.p2d_csr_req `PEU.d2p_csr_ack  
    // peu.d2p_csr_ack = peu.peu_ptl.ctb.dcs.osm.ack
    /* 0in req_ack 	-req `PEU.p2d_csr_req 
			-ack `PEU.peu_ptl.ctb.dcs.osm.ack  
			-req_until_ack
 			-ack_until_req_deassert
			-clock `peu_clock
			-reset ~`peu_warmreset
			-max 100 
 			-name AC_p2d_csr_req_ack  */

     // peu.peu_ptl.itl.ifc.req = sync'd version of peu.d2p_ibc_req      

     // 07/21/05: Add back the -active option, since the ifc won't ack
     // 	      ingress buffer credit req during link training.
     // 	      For x1,x2,x4 tests, link training takes >10K cycles,
     //		      which would have caused the checker to misfire.

     //  09/16/06: suggested changing:
     //               -reset ~`PEU.peu_ptl.etl.ct2et_rst_l to
     //               -reset (tb_top.cpu.peu.peu_ptl.ctb.tlr.rio.ct2et_lnk_dwn | 
     //                      ~tb_top.cpu.peu.peu_ptl.ctb.tlr.rio.rst_l)

     /* 0in req_ack      -req `PEU.peu_ptl.itl.ifc.req 
 		   	-ack `PEU.p2d_ibc_ack  
 			-req_until_ack
 			-ack_assert_to_req_deassert_min 1
 			-ack_until_req_deassert
 			-clock `peu_clock
 			-reset (`PEU.peu_ptl.ctb.tlr.rio.ct2et_lnk_dwn | 
                               ~`PEU.peu_ptl.ctb.tlr.rio.rst_l)
			-active `PEU.peu_ptl.itl.ifc.ct2it_link
                        -max 10000
 			-name AC_d2p_ibc_req_ack 
    */

     
    //=== p2d_ce_int active when ce-status_reg <> 0 and ce-interrupt_enable active 
//     /* 0in assert_window 
// 		-start (|(`PEU.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.ce_int_en.ce_int_en_csrbus_read_data[63:0] & `PEU.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.ce_err.ce_err_csrbus_read_data[63:0]))   
// 		-stop_count 2
// 		-in `PEU.p2d_ce_int
//  		-max 1
//  	   	-clock `peu_clock
// 	   	-reset ~`peu_warmreset
// 	   	-name AC_p2d_ce_int 
// 
//     */ 
wire [63:0] p2d_ce_int_transition_count;   
         /* 0in assert_together
                 -leader $0in_delay(|(`PEU.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.ce_int_en.ce_int_en_csrbus_read_data[63:0] & `PEU.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.ce_err.ce_err_csrbus_read_data[63:0]))
		 -follower (`PEU.p2d_ce_int)
                 -transitions_checked p2d_ce_int_transition_count 
                 -clock `peu_clock
                 -reset ~`peu_warmreset
                 -name AC_p2d_ce_int
         */





	 //=== p2d_oe_int active when oe-status_reg <> 0 and oe-interrupt_enable active 

// reg [63:0] p2d_oe_int_transition_count;   
//                  -transitions_checked p2d_oe_int_transition_count
wire [63:0] p2d_oe_int_transition_count;   
         /* 0in assert_together
                 -leader $0in_delay(|(`PEU.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.oe_int_en.oe_int_en_csrbus_read_data[63:0] & `PEU.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.oe_err.oe_err_csrbus_read_data[63:0]))
		 -follower (`PEU.p2d_oe_int)
                 -transitions_checked p2d_oe_int_transition_count
                 -clock `peu_clock
                 -reset ~`peu_warmreset
                 -name AC_p2d_oe_int
         */




    //=== p2d_ue_int active when ue-status_reg <> 0 and ue-interrupt_enable active
        wire ue_int_on = (|(`PEU.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.ue_int_en.ue_int_en_csrbus_read_data[63:0] & `PEU.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.ue_err.ue_err_csrbus_read_data[63:0]));




wire [63:0] p2d_ue_int_transition_count;   
         /* 0in assert_together
                 -leader $0in_delay(|(`PEU.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.ue_int_en.ue_int_en_csrbus_read_data[63:0] & `PEU.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.ue_err.ue_err_csrbus_read_data[63:0]))
		 -follower (`PEU.p2d_ue_int)
                 -transitions_checked p2d_ue_int_transition_count
                 -clock `peu_clock
                 -reset ~`peu_warmreset
                 -name AC_p2d_ue_int
         */







    //==== p2d_cto_tag is valid and constant during p2d_cto_req 
    /* 0in constant -var `PEU.p2d_cto_tag -active `PEU.p2d_cto_req  
 		       -clock `peu_clock
                        -reset ~`peu_warmreset
                        -name AC_p2d_cto_tag_constant
    */ 


    //===== peu_psr_pll_mpy should only change value 1 cycle after falling edge  
    //      of warm reset.  Otherwise, its value is constant until next warmreset
     /* 0in change_window  
			-start $0in_delay(($0in_falling_edge(`PEU.rst_wmr_)),3)
			-stop  $0in_falling_edge(`PEU.rst_wmr_)
                        -not_in $0in_delay(peu_psr_pll_mpy)
			-module peu
			-clock	`peu_clock
			-reset 1'b0
                        -name AC_peu_mpy_update_after_wrm
    */ 

                      

   //-----------------------------------------------------------------------
   // known-driven checkers for signals between ILU and PEU 
   //
   // There is a checker for each side of the clock domain boundary.
   //
   // NOTE: resets are active low!
   //-----------------------------------------------------------------------
 

     //---------------------------------------------------------------------
     // 350 MHz domain
     //---------------------------------------------------------------------
     /* 0in known_driven -clock `ilu_clock
 			-reset !`ilu_warmreset
 			-var `CPU.dmu.ilu.d2p_ihb_addr */
     /* 0in known_driven -clock `ilu_clock
 			-reset !`ilu_warmreset
 			-var `CPU.dmu.ilu.p2d_ihb_wptr */
        
 
     /* 0in known_driven -clock `ilu_clock
 			-reset !`ilu_warmreset
 			-var `CPU.dmu.ilu.d2p_idb_addr */
 
     /* 0in known_driven -clock `ilu_clock
 			-reset !`ilu_warmreset
 			-active `CPU.dmu.ilu.d2p_ibc_req
 			-var `CPU.dmu.ilu.d2p_ibc_nhc */
     /* 0in known_driven -clock `ilu_clock
 			-reset !`ilu_warmreset
 			-active `CPU.dmu.ilu.d2p_ibc_req
 			-var `CPU.dmu.ilu.d2p_ibc_phc */
     /* 0in known_driven -clock `ilu_clock
 			-reset !`ilu_warmreset
 			-active `CPU.dmu.ilu.d2p_ibc_req
 			-var `CPU.dmu.ilu.d2p_ibc_pdc */
     /* 0in known_driven -clock `ilu_clock
 			-reset !`ilu_warmreset
 			-var `CPU.dmu.ilu.d2p_ibc_req */
     /* 0in known_driven -clock `ilu_clock
 			-reset !`ilu_warmreset
 			-var `CPU.dmu.ilu.p2d_ibc_ack */
 
     /* 0in known_driven -clock `ilu_clock
 			-reset !`ilu_warmreset
 			-active `CPU.dmu.ilu.p2d_cto_req
 			-var `CPU.dmu.ilu.p2d_cto_tag */
     /* 0in known_driven -clock `ilu_clock
 			-reset !`ilu_warmreset
 			-var `CPU.dmu.ilu.p2d_cto_req */
     /* 0in known_driven -clock `ilu_clock
 			-reset !`ilu_warmreset
 			-var `CPU.dmu.ilu.d2p_cto_ack */
 
     /* 0in known_driven -clock `ilu_clock
 			-reset !`ilu_warmreset
 			-var `CPU.dmu.ilu.p2d_ue_int */
     /* 0in known_driven -clock `ilu_clock
 			-reset !`ilu_warmreset
 			-var `CPU.dmu.ilu.p2d_ce_int */
     /* 0in known_driven -clock `ilu_clock
 			-reset !`ilu_warmreset
 			-var `CPU.dmu.ilu.p2d_oe_int */
 
     /* 0in known_driven -clock `ilu_clock
 			-reset !`ilu_warmreset
 			-var `CPU.dmu.ilu.d2p_ech_wptr */
     /* 0in known_driven -clock `ilu_clock
 			-reset !`ilu_warmreset
 			-var `CPU.dmu.ilu.p2d_ech_rptr */
     /* 0in known_driven -clock `ilu_clock
 			-reset !`ilu_warmreset
 			-var `CPU.dmu.ilu.d2p_erh_wptr */
     /* 0in known_driven -clock `ilu_clock
 			-reset !`ilu_warmreset
 			-var `CPU.dmu.ilu.p2d_erh_rptr */
 
     /* 0in known_driven -clock `ilu_clock
 			-reset !`ilu_warmreset
 			-var `CPU.dmu.ilu.p2d_ecd_rptr */
     /* 0in known_driven -clock `ilu_clock
 			-reset !`ilu_warmreset
 			-var `CPU.dmu.ilu.p2d_erd_rptr */
     /* 0in known_driven -clock `ilu_clock
 			-reset !`ilu_warmreset
 			-var `CPU.dmu.ilu.d2p_edb_addr
 			-active `CPU.dmu.ilu.d2p_edb_we */
     //---------------------------------------------------------------------
     // 250 MHz domain
     //---------------------------------------------------------------------
     /* 0in known_driven -clock `peu_clock
 			-reset !`peu_warmreset
 			-var `PEU.d2p_ihb_addr */
     /* 0in known_driven -clock `peu_clock
 			-reset !`peu_warmreset
 			-var `PEU.p2d_ihb_wptr */
 
     /* 0in known_driven -clock `peu_clock
 			-reset !`peu_warmreset
 			-var `PEU.d2p_idb_addr */
 
     /* 0in known_driven -clock `peu_clock
 			-reset !`peu_warmreset
 			-active `PEU.d2p_ibc_req
 			-var `PEU.d2p_ibc_nhc */
     /* 0in known_driven -clock `peu_clock
 			-reset !`peu_warmreset
 			-active `PEU.d2p_ibc_req
 			-var `PEU.d2p_ibc_phc */
     /* 0in known_driven -clock `peu_clock
 			-reset !`peu_warmreset
 			-active `PEU.d2p_ibc_req
 			-var `PEU.d2p_ibc_pdc */
     /* 0in known_driven -clock `peu_clock
 			-reset !`peu_warmreset
 			-var `PEU.d2p_ibc_req */
     /* 0in known_driven -clock `peu_clock
 			-reset !`peu_warmreset
 			-var `PEU.p2d_ibc_ack */
 
     /* 0in known_driven -clock `peu_clock
 			-reset !`peu_warmreset
 			-active `PEU.p2d_cto_req
 			-var `PEU.p2d_cto_tag */
     /* 0in known_driven -clock `peu_clock
 			-reset !`peu_warmreset
 			-var `PEU.p2d_cto_req */
     /* 0in known_driven -clock `peu_clock
 			-reset !`peu_warmreset
 			-var `PEU.d2p_cto_ack */
 
     /* 0in known_driven -clock `peu_clock
 			-reset !`peu_warmreset
 			-var `PEU.p2d_ue_int */
     /* 0in known_driven -clock `peu_clock
 			-reset !`peu_warmreset
 			-var `PEU.p2d_ce_int */
     /* 0in known_driven -clock `peu_clock
 			-reset !`peu_warmreset
 			-var `PEU.p2d_oe_int */
 
     /* 0in known_driven -clock `peu_clock
 			-reset !`peu_warmreset
 			-var `PEU.d2p_ech_wptr */
     /* 0in known_driven -clock `peu_clock
 			-reset !`peu_warmreset
 			-var `PEU.p2d_ech_rptr */
     /* 0in known_driven -clock `peu_clock
 			-reset !`peu_warmreset
 			-var `PEU.d2p_erh_wptr */
     /* 0in known_driven -clock `peu_clock
 			-reset !`peu_warmreset
 			-var `PEU.p2d_erh_rptr */
 
     /* 0in known_driven -clock `peu_clock
 			-reset !`peu_warmreset
 			-var `PEU.p2d_ecd_rptr */
     /* 0in known_driven -clock `peu_clock
 			-reset !`peu_warmreset
 			-var `PEU.p2d_erd_rptr */
     /* 0in known_driven -clock `peu_clock
 			-reset !`peu_warmreset
 			-var `PEU.d2p_edb_addr
 			-active `PEU.d2p_edb_we */

  //  0in disable_checker -name cpu.peu.peu_ptl.etl.hcs.fifo_request.enq_deq 1
  /* 0in fifo
         -name etl_hcs_fifo_request_enq_deq1
         -enq `PEU.peu_ptl.etl.hcs.fifo_request.enq
         -deq `PEU.peu_ptl.etl.hcs.fifo_request.deq
         -enq_data `PEU.peu_ptl.etl.hcs.fifo_request.di
         -deq_data `PEU.peu_ptl.etl.hcs.fifo_request.do
         -depth 2
         -clock `PEU.peu_ptl.etl.hcs.fifo_request.clk
         -reset ~`PEU.peu_ptl.etl.hcs.fifo_request.rst_l
         -module peu
  */

  //  0in disable_checker -name cpu.peu.peu_ptl.etl.hcs.fifo_completion.enq_deq  1
  /* 0in fifo
         -name etl_hcs_fifo_completion_enq_deq1
         -enq `PEU.peu_ptl.etl.hcs.fifo_completion.enq
         -deq `PEU.peu_ptl.etl.hcs.fifo_completion.deq
         -enq_data `PEU.peu_ptl.etl.hcs.fifo_completion.di
         -deq_data `PEU.peu_ptl.etl.hcs.fifo_completion.do
         -depth 2
         -clock `PEU.peu_ptl.etl.hcs.fifo_completion.clk
         -reset ~`PEU.peu_ptl.etl.hcs.fifo_completion.rst_l
         -module peu
  */

  //  0in disable_checker -name cpu.peu.peu_ptl.rsb.rsb_rar.et2rs_ld_tx  1
  /* 0in scoreboard
         -name et2rs_ld_tx1
         -rx_id               etl_ld_tag
         -rx                  et2rs_ld
         -tx_id               itl_chk_tag
         -tx                  (it2rs_vld & ~n_rs2it_err)
         -flush_id            work_tag
         -flush               vld_clr
         -max_ids             16
         -known_flush         on
         -max_count_per_id    1
         -reset ~`PEU.peu_ptl.etl.ct2et_rst_l
         -module ptl_rsb_rar
  */

  //  0in disable_checker -name cpu.peu.peu_ptl.edb.ptl_edb_async_ram_chk 1
  /* 0in multi_clock_fifo
         -name ptl_edb_async_ram_chk1
         -depth 256
         -enq edb_ram_wr_en
         -enq_clock d2p_edb_clk
         -deq edb_ram_rd_en
         -deq_clock clk
         -enq_reset ~`PEU.peu_ptl.etl.ct2et_rst_l
         -deq_reset ~`PEU.peu_ptl.etl.ct2et_rst_l
         -module ptl_edb
  */

  //  0in disable_checker -name cpu.dmu.ilu.iil.xfrfsm.zivar 1
  /* 0in assert -var `CPU.dmu.ilu.iil.xfrfsm.isb2iil_vld
               -active (((`CPU.dmu.ilu.iil.xfrfsm.is_ihb_rcd &
                          `CPU.dmu.ilu.iil.xfrfsm.ihb_rcd_is_cpl) |
                          `CPU.dmu.ilu.iil.xfrfsm.is_cto_rcd_ps2 ) &
                          ~`CPU.dmu.ilu.iil.cib2iil_pec_drain &
                          ~`CPU.dmu.ilu.iil.cib2iil_ihb_pe_drain)
               -clock  `ilu_clock

  */


endmodule
