// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mac_clk_driver.v
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
/*%W%	%G%*/

/*************************************************************************
 *
 * File Name    : mac_clk_driver.v
 * Author Name  : John Lo
 * Description  : mac clock driver for ASIC vendor.
 * Parent Module: non
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 12/04/2001
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

module mac_clk_driver (
// port0
rbc0_a0,
rbc0_b0,
rbc0_c0,
rbc0_d0,
rx_clk0,
rx_nbclk0,
tx_clk0,
tx_nbclk0,
tx_clk_312mhz0,		       
rbc0_a_muxd0,
rbc0_b_muxd0,
rbc0_c_muxd0,
rbc0_d_muxd0,
rx_nbclk_muxd0,
rx_clk_muxd0,
tx_nbclk_muxd0,
tx_clk_muxd0,
tx_clk_312mhz_muxd0,
// port1
rbc0_a1,
rbc0_b1,
rbc0_c1,
rbc0_d1,
rx_clk1,
rx_nbclk1,
tx_clk1,
tx_nbclk1,
tx_clk_312mhz1,		       
rbc0_a_muxd1,
rbc0_b_muxd1,
rbc0_c_muxd1,
rbc0_d_muxd1,
rx_nbclk_muxd1,
rx_clk_muxd1,
tx_nbclk_muxd1,
tx_clk_muxd1,
tx_clk_312mhz_muxd1,
`ifdef NEPTUNE
// port2
rx_bclk2,
rx_nclk2,
tx_bclk2,
tx_nclk2,
rx_bclk_muxd2,
rx_nclk_muxd2,
tx_bclk_muxd2,
tx_nclk_muxd2,
// port3
rx_bclk3,
rx_nclk3,
tx_bclk3,
tx_nclk3,
rx_bclk_muxd3,
rx_nclk_muxd3,
tx_bclk_muxd3,
tx_nclk_muxd3,
`else // n2
tcu_scan_mode,
tcu_scan_en,           
tcu_mac_312tx_clk_stop,
tcu_mac_312rx_clk_stop,
tcu_mac_156tx_clk_stop,
tcu_mac_156rx_clk_stop,
tcu_mac_125tx_clk_stop,
tcu_mac_125rx_clk_stop,
`endif // !ifdef NEPTUNE
// core clock
clk,
niu_clk
		       );
                   // port0   
   output          rbc0_a0;   
   output          rbc0_b0;   
   output          rbc0_c0;   
   output          rbc0_d0;   
   output          rx_clk0;   
   output          rx_nbclk0; 
   output          tx_clk0;   
   output          tx_nbclk0;
   output          tx_clk_312mhz0;
   input           rbc0_a_muxd0;
   input           rbc0_b_muxd0;   
   input           rbc0_c_muxd0;   
   input           rbc0_d_muxd0;   
   input           rx_nbclk_muxd0; 
   input           rx_clk_muxd0;   
   input           tx_nbclk_muxd0; 
   input           tx_clk_muxd0;
   input           tx_clk_312mhz_muxd0; // TI uses esr_mac_tclk_0[1], Agere uses esr_mac_tclk_0[0]
                   // port1
   output          rbc0_a1;   
   output          rbc0_b1;   
   output          rbc0_c1;   
   output          rbc0_d1;   
   output          rx_clk1;   
   output          rx_nbclk1; 
   output          tx_clk1;   
   output          tx_nbclk1;
   output          tx_clk_312mhz1;
   input           rbc0_a_muxd1;
   input           rbc0_b_muxd1;   
   input           rbc0_c_muxd1;   
   input           rbc0_d_muxd1;   
   input           rx_nbclk_muxd1; 
   input           rx_clk_muxd1;   
   input           tx_nbclk_muxd1; 
   input           tx_clk_muxd1;
   input           tx_clk_312mhz_muxd1; // TI uses esr_mac_tclk_1[1], Agere uses esr_mac_tclk_1[0]
                   `ifdef NEPTUNE
                   // port2   
   output          rx_bclk2;  
   output          rx_nclk2;  
   output          tx_bclk2;  
   output          tx_nclk2;  
   input           rx_bclk_muxd2;  
   input           rx_nclk_muxd2;  
   input           tx_bclk_muxd2;  
   input           tx_nclk_muxd2;  
                   // port3        
   output          rx_bclk3;  
   output          rx_nclk3;  
   output          tx_bclk3;  
   output          tx_nclk3;                       
   input           rx_bclk_muxd3;  
   input           rx_nclk_muxd3;  
   input           tx_bclk_muxd3;  
   input           tx_nclk_muxd3;  
                   `else // n2
   input 	   tcu_scan_mode;
   input           tcu_scan_en;           
   input           tcu_mac_312tx_clk_stop;
   input           tcu_mac_312rx_clk_stop;
   input           tcu_mac_156tx_clk_stop;
   input           tcu_mac_156rx_clk_stop;
   input           tcu_mac_125tx_clk_stop;
   input           tcu_mac_125rx_clk_stop;
                   `endif // !ifdef NEPTUNE
                   // core clock
   output          clk;  
   input           niu_clk;
 
                   // port0   
   wire            rbc0_a0        ;
   wire            rbc0_b0        ;
   wire            rbc0_c0        ;
   wire            rbc0_d0        ;
   wire            rx_nbclk0      ;
   wire            rx_clk0        ;
   wire            tx_nbclk0      ;
   wire            tx_clk0        ;
   wire            tx_clk_312mhz0 ;
                   // port1
   wire            rbc0_a1        ;
   wire            rbc0_b1        ;
   wire            rbc0_c1        ;
   wire            rbc0_d1        ;
   wire            rx_nbclk1      ;
   wire            rx_clk1        ;
   wire            tx_nbclk1      ;
   wire            tx_clk1        ;
   wire            tx_clk_312mhz1 ;
                   `ifdef NEPTUNE
                   // port2
   wire            rx_bclk2       ;
   wire            rx_nclk2       ;
   wire            tx_bclk2       ;
   wire            tx_nclk2       ;
                   // port3
   wire            rx_bclk3       ;
   wire            rx_nclk3       ;
   wire            tx_bclk3       ;
   wire            tx_nclk3       ;
                   `else // n2
                   `endif 
                   // core clk
   wire            clk            ;
   wire            niu_clk        ;

/* -------- clock tree synthesis buffer ---------- */


`ifdef NEPTUNE
   CtsRoot     clk_CtsRoot            (.Z(clk)              ,.A(niu_clk));   
// port0
   CtsRoot     rbc0_a0_CtsRoot        (.Z(rbc0_a0)        ,.A(rbc0_a_muxd0));
   CtsRoot     rbc0_b0_CtsRoot        (.Z(rbc0_b0)        ,.A(rbc0_b_muxd0));
   CtsRoot     rbc0_c0_CtsRoot        (.Z(rbc0_c0)        ,.A(rbc0_c_muxd0));
   CtsRoot     rbc0_d0_CtsRoot        (.Z(rbc0_d0)        ,.A(rbc0_d_muxd0));
   CtsRoot     rx_nbclk0_CtsRoot      (.Z(rx_nbclk0)      ,.A(rx_nbclk_muxd0));
   CtsRoot     rx_clk0_CtsRoot        (.Z(rx_clk0)        ,.A(rx_clk_muxd0));
   CtsRoot     tx_nbclk0_CtsRoot      (.Z(tx_nbclk0)      ,.A(tx_nbclk_muxd0));
   CtsRoot     tx_clk0_CtsRoot        (.Z(tx_clk0)        ,.A(tx_clk_muxd0));
   CtsRoot     tx_clk_312mhz0_CtsRoot (.Z(tx_clk_312mhz0) ,.A(tx_clk_312mhz_muxd0));
// port1
   CtsRoot     rbc0_a1_CtsRoot        (.Z(rbc0_a1)        ,.A(rbc0_a_muxd1));
   CtsRoot     rbc0_b1_CtsRoot        (.Z(rbc0_b1)        ,.A(rbc0_b_muxd1));
   CtsRoot     rbc0_c1_CtsRoot        (.Z(rbc0_c1)        ,.A(rbc0_c_muxd1));
   CtsRoot     rbc0_d1_CtsRoot        (.Z(rbc0_d1)        ,.A(rbc0_d_muxd1));
   CtsRoot     rx_nbclk1_CtsRoot      (.Z(rx_nbclk1)      ,.A(rx_nbclk_muxd1));
   CtsRoot     rx_clk1_CtsRoot        (.Z(rx_clk1)        ,.A(rx_clk_muxd1));
   CtsRoot     tx_nbclk1_CtsRoot      (.Z(tx_nbclk1)      ,.A(tx_nbclk_muxd1));
   CtsRoot     tx_clk1_CtsRoot        (.Z(tx_clk1)        ,.A(tx_clk_muxd1));
   CtsRoot     tx_clk_312mhz1_CtsRoot (.Z(tx_clk_312mhz1) ,.A(tx_clk_312mhz_muxd1));
// port2
   CtsRoot     rx_bclk2_CtsRoot       (.Z(rx_bclk2)      ,.A(rx_bclk_muxd2));
   CtsRoot     rx_nclk2_CtsRoot       (.Z(rx_nclk2)      ,.A(rx_nclk_muxd2));
   CtsRoot     tx_bclk2_CtsRoot       (.Z(tx_bclk2)      ,.A(tx_bclk_muxd2));
   CtsRoot     tx_nclk2_CtsRoot       (.Z(tx_nclk2)      ,.A(tx_nclk_muxd2));
// port3
   CtsRoot     rx_bclk3_CtsRoot       (.Z(rx_bclk3)      ,.A(rx_bclk_muxd3));
   CtsRoot     rx_nclk3_CtsRoot       (.Z(rx_nclk3)      ,.A(rx_nclk_muxd3));
   CtsRoot     tx_bclk3_CtsRoot       (.Z(tx_bclk3)      ,.A(tx_bclk_muxd3));
   CtsRoot     tx_nclk3_CtsRoot       (.Z(tx_nclk3)      ,.A(tx_nclk_muxd3));
`else // n2

   wire 	   tcu_scan_mode;
   wire 	   tcu_scan_en;
   
   wire 	   mac_125rx_clk_stop0;
   wire 	   mac_156rx_clk_stop0;
   wire 	   mac_312rx_clkastop0;
   wire 	   mac_312rx_clkbstop0;
   wire 	   mac_312rx_clkcstop0;
   wire 	   mac_312rx_clkdstop0;
   wire 	   mac_125tx_clk_stop0;
   wire 	   mac_156tx_clk_stop0;
   wire 	   mac_312tx_clk_stop0;

   wire 	   mac_125rx_clk_stop1;
   wire 	   mac_156rx_clk_stop1;
   wire 	   mac_312rx_clkastop1;
   wire 	   mac_312rx_clkbstop1;
   wire 	   mac_312rx_clkcstop1;
   wire 	   mac_312rx_clkdstop1;
   wire 	   mac_125tx_clk_stop1;
   wire 	   mac_156tx_clk_stop1;
   wire 	   mac_312tx_clk_stop1;

   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   wire 	   s0_0;
   wire 	   s0_1;
   wire 	   s0_2;
   wire 	   s0_3;
   wire 	   s0_4;
   wire 	   s0_5;
   wire 	   s0_6;
   wire 	   s0_7;
   wire 	   s0_8;
   wire 	   s1_0;
   wire 	   s1_1;
   wire 	   s1_2;
   wire 	   s1_3;
   wire 	   s1_4;
   wire 	   s1_5;
   wire 	   s1_6;
   wire 	   s1_7;
   wire 	   s1_8;
   // vlint flag_net_has_no_load on
   // vlint flag_dangling_net_within_module on
   
   assign    clk             = niu_clk              ; // core_clk header is done in clkgen_mac.v

// port0
 // synchronize clock stop
 cl_a1_clksyncff_4x rx_nbclk_stop0 (.l1clk(rx_nbclk_muxd0),.d(tcu_mac_125rx_clk_stop),.q(mac_125rx_clk_stop0),.si(1'b0),.siclk(1'b0),.soclk(1'b0),.so(s0_0));
 cl_a1_clksyncff_4x rx_clk_stop0   (.l1clk(rx_clk_muxd0),  .d(tcu_mac_156rx_clk_stop),.q(mac_156rx_clk_stop0),.si(1'b0),.siclk(1'b0),.soclk(1'b0),.so(s0_1));
 cl_a1_clksyncff_4x rbc0_a_stop0   (.l1clk(rbc0_a_muxd0),  .d(tcu_mac_312rx_clk_stop),.q(mac_312rx_clkastop0),.si(1'b0),.siclk(1'b0),.soclk(1'b0),.so(s0_2));
 cl_a1_clksyncff_4x rbc0_b_stop0   (.l1clk(rbc0_b_muxd0),  .d(tcu_mac_312rx_clk_stop),.q(mac_312rx_clkbstop0),.si(1'b0),.siclk(1'b0),.soclk(1'b0),.so(s0_3));
 cl_a1_clksyncff_4x rbc0_c_stop0   (.l1clk(rbc0_c_muxd0),  .d(tcu_mac_312rx_clk_stop),.q(mac_312rx_clkcstop0),.si(1'b0),.siclk(1'b0),.soclk(1'b0),.so(s0_4));
 cl_a1_clksyncff_4x rbc0_d_stop0   (.l1clk(rbc0_d_muxd0),  .d(tcu_mac_312rx_clk_stop),.q(mac_312rx_clkdstop0),.si(1'b0),.siclk(1'b0),.soclk(1'b0),.so(s0_5));
 cl_a1_clksyncff_4x tx_nbclk_stop0 (.l1clk(tx_nbclk_muxd0),.d(tcu_mac_125tx_clk_stop),.q(mac_125tx_clk_stop0),.si(1'b0),.siclk(1'b0),.soclk(1'b0),.so(s0_6));
 cl_a1_clksyncff_4x tx_clk_stop0   (.l1clk(tx_clk_muxd0),  .d(tcu_mac_156tx_clk_stop),.q(mac_156tx_clk_stop0),.si(1'b0),.siclk(1'b0),.soclk(1'b0),.so(s0_7));
 cl_a1_clksyncff_4x t312_stop0(.l1clk(tx_clk_312mhz_muxd0),.d(tcu_mac_312tx_clk_stop),.q(mac_312tx_clk_stop0),.si(1'b0),.siclk(1'b0),.soclk(1'b0),.so(s0_8));
 // 
 wire mac_125rx_clk_stop_gated0 =  tcu_scan_mode ? tcu_mac_125rx_clk_stop : mac_125rx_clk_stop0 ;
 wire mac_156rx_clk_stop_gated0 =  tcu_scan_mode ? tcu_mac_156rx_clk_stop : mac_156rx_clk_stop0 ;
 wire mac_312rx_clkastop_gated0 =  tcu_scan_mode ? tcu_mac_312rx_clk_stop : mac_312rx_clkastop0 ;
 wire mac_312rx_clkbstop_gated0 =  tcu_scan_mode ? tcu_mac_312rx_clk_stop : mac_312rx_clkbstop0 ;
 wire mac_312rx_clkcstop_gated0 =  tcu_scan_mode ? tcu_mac_312rx_clk_stop : mac_312rx_clkcstop0 ;
 wire mac_312rx_clkdstop_gated0 =  tcu_scan_mode ? tcu_mac_312rx_clk_stop : mac_312rx_clkdstop0 ;
 wire mac_125tx_clk_stop_gated0 =  tcu_scan_mode ? tcu_mac_125tx_clk_stop : mac_125tx_clk_stop0 ;
 wire mac_156tx_clk_stop_gated0 =  tcu_scan_mode ? tcu_mac_156tx_clk_stop : mac_156tx_clk_stop0 ;
 wire mac_312tx_clk_stop_gated0 =  tcu_scan_mode ? tcu_mac_312tx_clk_stop : mac_312tx_clk_stop0 ;
 // Clock Tree Synthesis buffer
 cl_a1_l1hdr_12x rx_nbclk_muxd0_l1 (.l2clk(rx_nbclk_muxd0),.se(tcu_scan_en),.pce(1'b1),.pce_ov(1'b0),.stop(mac_125rx_clk_stop_gated0),.l1clk(rx_nbclk0));
 cl_a1_l1hdr_12x rx_clk_muxd0_l1   (.l2clk(rx_clk_muxd0),  .se(tcu_scan_en),.pce(1'b1),.pce_ov(1'b0),.stop(mac_156rx_clk_stop_gated0),.l1clk(rx_clk0));
 cl_a1_l1hdr_12x rbc0_a_muxd0_l1   (.l2clk(rbc0_a_muxd0),  .se(tcu_scan_en),.pce(1'b1),.pce_ov(1'b0),.stop(mac_312rx_clkastop_gated0),.l1clk(rbc0_a0));
 cl_a1_l1hdr_12x rbc0_b_muxd0_l1   (.l2clk(rbc0_b_muxd0),  .se(tcu_scan_en),.pce(1'b1),.pce_ov(1'b0),.stop(mac_312rx_clkbstop_gated0),.l1clk(rbc0_b0));
 cl_a1_l1hdr_12x rbc0_c_muxd0_l1   (.l2clk(rbc0_c_muxd0),  .se(tcu_scan_en),.pce(1'b1),.pce_ov(1'b0),.stop(mac_312rx_clkcstop_gated0),.l1clk(rbc0_c0));
 cl_a1_l1hdr_12x rbc0_d_muxd0_l1   (.l2clk(rbc0_d_muxd0),  .se(tcu_scan_en),.pce(1'b1),.pce_ov(1'b0),.stop(mac_312rx_clkdstop_gated0),.l1clk(rbc0_d0));
 cl_a1_l1hdr_12x tx_nbclk_muxd0_l1 (.l2clk(tx_nbclk_muxd0),.se(tcu_scan_en),.pce(1'b1),.pce_ov(1'b0),.stop(mac_125tx_clk_stop_gated0),.l1clk(tx_nbclk0)); 
 cl_a1_l1hdr_12x tx_clk_muxd0_l1   (.l2clk(tx_clk_muxd0),  .se(tcu_scan_en),.pce(1'b1),.pce_ov(1'b0),.stop(mac_156tx_clk_stop_gated0),.l1clk(tx_clk0));
 cl_a1_l1hdr_12x t312_muxd0_l1(.l2clk(tx_clk_312mhz_muxd0),.se(tcu_scan_en),.pce(1'b1),.pce_ov(1'b0),.stop(mac_312tx_clk_stop_gated0),.l1clk(tx_clk_312mhz0));

// port1 *******************************************************
 // synchronize clock stop
 cl_a1_clksyncff_4x rx_nbclk_stop1 (.l1clk(rx_nbclk_muxd1),.d(tcu_mac_125rx_clk_stop),.q(mac_125rx_clk_stop1),.si(1'b0),.siclk(1'b0),.soclk(1'b0),.so(s1_0));
 cl_a1_clksyncff_4x rx_clk_stop1   (.l1clk(rx_clk_muxd1),  .d(tcu_mac_156rx_clk_stop),.q(mac_156rx_clk_stop1),.si(1'b0),.siclk(1'b0),.soclk(1'b0),.so(s1_1));
 cl_a1_clksyncff_4x rbc0_a_stop1   (.l1clk(rbc0_a_muxd1),  .d(tcu_mac_312rx_clk_stop),.q(mac_312rx_clkastop1),.si(1'b0),.siclk(1'b0),.soclk(1'b0),.so(s1_2));
 cl_a1_clksyncff_4x rbc0_b_stop1   (.l1clk(rbc0_b_muxd1),  .d(tcu_mac_312rx_clk_stop),.q(mac_312rx_clkbstop1),.si(1'b0),.siclk(1'b0),.soclk(1'b0),.so(s1_3));
 cl_a1_clksyncff_4x rbc0_c_stop1   (.l1clk(rbc0_c_muxd1),  .d(tcu_mac_312rx_clk_stop),.q(mac_312rx_clkcstop1),.si(1'b0),.siclk(1'b0),.soclk(1'b0),.so(s1_4));
 cl_a1_clksyncff_4x rbc0_d_stop1   (.l1clk(rbc0_d_muxd1),  .d(tcu_mac_312rx_clk_stop),.q(mac_312rx_clkdstop1),.si(1'b0),.siclk(1'b0),.soclk(1'b0),.so(s1_5));
 cl_a1_clksyncff_4x tx_nbclk_stop1 (.l1clk(tx_nbclk_muxd1),.d(tcu_mac_125tx_clk_stop),.q(mac_125tx_clk_stop1),.si(1'b0),.siclk(1'b0),.soclk(1'b0),.so(s1_6));
 cl_a1_clksyncff_4x tx_clk_stop1   (.l1clk(tx_clk_muxd1),  .d(tcu_mac_156tx_clk_stop),.q(mac_156tx_clk_stop1),.si(1'b0),.siclk(1'b0),.soclk(1'b0),.so(s1_7));
 cl_a1_clksyncff_4x t312_stop1(.l1clk(tx_clk_312mhz_muxd1),.d(tcu_mac_312tx_clk_stop),.q(mac_312tx_clk_stop1),.si(1'b0),.siclk(1'b0),.soclk(1'b0),.so(s1_8));
 // 
 wire mac_125rx_clk_stop_gated1 =  tcu_scan_mode ? tcu_mac_125rx_clk_stop : mac_125rx_clk_stop1 ;
 wire mac_156rx_clk_stop_gated1 =  tcu_scan_mode ? tcu_mac_156rx_clk_stop : mac_156rx_clk_stop1 ;
 wire mac_312rx_clkastop_gated1 =  tcu_scan_mode ? tcu_mac_312rx_clk_stop : mac_312rx_clkastop1 ;
 wire mac_312rx_clkbstop_gated1 =  tcu_scan_mode ? tcu_mac_312rx_clk_stop : mac_312rx_clkbstop1 ;
 wire mac_312rx_clkcstop_gated1 =  tcu_scan_mode ? tcu_mac_312rx_clk_stop : mac_312rx_clkcstop1 ;
 wire mac_312rx_clkdstop_gated1 =  tcu_scan_mode ? tcu_mac_312rx_clk_stop : mac_312rx_clkdstop1 ;
 wire mac_125tx_clk_stop_gated1 =  tcu_scan_mode ? tcu_mac_125tx_clk_stop : mac_125tx_clk_stop1 ;
 wire mac_156tx_clk_stop_gated1 =  tcu_scan_mode ? tcu_mac_156tx_clk_stop : mac_156tx_clk_stop1 ;
 wire mac_312tx_clk_stop_gated1 =  tcu_scan_mode ? tcu_mac_312tx_clk_stop : mac_312tx_clk_stop1 ;
 // Clock Tree Synthesis buffer
 cl_a1_l1hdr_12x rx_nbclk_muxd1_l1 (.l2clk(rx_nbclk_muxd1),.se(tcu_scan_en),.pce(1'b1),.pce_ov(1'b0),.stop(mac_125rx_clk_stop_gated1),.l1clk(rx_nbclk1));
 cl_a1_l1hdr_12x rx_clk_muxd1_l1   (.l2clk(rx_clk_muxd1),  .se(tcu_scan_en),.pce(1'b1),.pce_ov(1'b0),.stop(mac_156rx_clk_stop_gated1),.l1clk(rx_clk1));
 cl_a1_l1hdr_12x rbc0_a_muxd1_l1   (.l2clk(rbc0_a_muxd1),  .se(tcu_scan_en),.pce(1'b1),.pce_ov(1'b0),.stop(mac_312rx_clkastop_gated1),.l1clk(rbc0_a1));
 cl_a1_l1hdr_12x rbc0_b_muxd1_l1   (.l2clk(rbc0_b_muxd1),  .se(tcu_scan_en),.pce(1'b1),.pce_ov(1'b0),.stop(mac_312rx_clkbstop_gated1),.l1clk(rbc0_b1));
 cl_a1_l1hdr_12x rbc0_c_muxd1_l1   (.l2clk(rbc0_c_muxd1),  .se(tcu_scan_en),.pce(1'b1),.pce_ov(1'b0),.stop(mac_312rx_clkcstop_gated1),.l1clk(rbc0_c1));
 cl_a1_l1hdr_12x rbc0_d_muxd1_l1   (.l2clk(rbc0_d_muxd1),  .se(tcu_scan_en),.pce(1'b1),.pce_ov(1'b0),.stop(mac_312rx_clkdstop_gated1),.l1clk(rbc0_d1));
 cl_a1_l1hdr_12x tx_nbclk_muxd1_l1 (.l2clk(tx_nbclk_muxd1),.se(tcu_scan_en),.pce(1'b1),.pce_ov(1'b0),.stop(mac_125tx_clk_stop_gated1),.l1clk(tx_nbclk1)); 
 cl_a1_l1hdr_12x tx_clk_muxd1_l1   (.l2clk(tx_clk_muxd1),  .se(tcu_scan_en),.pce(1'b1),.pce_ov(1'b0),.stop(mac_156tx_clk_stop_gated1),.l1clk(tx_clk1));
 cl_a1_l1hdr_12x t312_muxd1_l1(.l2clk(tx_clk_312mhz_muxd1),.se(tcu_scan_en),.pce(1'b1),.pce_ov(1'b0),.stop(mac_312tx_clk_stop_gated1),.l1clk(tx_clk_312mhz1));
// port0
// assign    rbc0_a0         = rbc0_a_muxd0         ;
// assign    rbc0_b0         = rbc0_b_muxd0         ;
// assign    rbc0_c0         = rbc0_c_muxd0         ;
// assign    rbc0_d0         = rbc0_d_muxd0         ;
// assign    rx_nbclk0       = rx_nbclk_muxd0       ;
// assign    rx_clk0         = rx_clk_muxd0         ;
// assign    tx_nbclk0       = tx_nbclk_muxd0       ;
// assign    tx_clk0         = tx_clk_muxd0         ;
// assign    tx_clk_312mhz0  = tx_clk_312mhz_muxd0  ;
// port1                                            
// assign    rbc0_a1         = rbc0_a_muxd1         ;
// assign    rbc0_b1         = rbc0_b_muxd1         ;
// assign    rbc0_c1         = rbc0_c_muxd1         ;
// assign    rbc0_d1         = rbc0_d_muxd1         ;
// assign    rx_nbclk1       = rx_nbclk_muxd1       ;
// assign    rx_clk1         = rx_clk_muxd1         ;
// assign    tx_nbclk1       = tx_nbclk_muxd1       ;
// assign    tx_clk1         = tx_clk_muxd1         ;
// assign    tx_clk_312mhz1  = tx_clk_312mhz_muxd1  ;
// port2                                            
// assign    rx_bclk2        = rx_bclk_muxd2        ;
// assign    rx_nclk2        = rx_nclk_muxd2        ;
// assign    tx_bclk2        = tx_bclk_muxd2        ;
// assign    tx_nclk2        = tx_nclk_muxd2        ;
// port3                                            
// assign    rx_bclk3        = rx_bclk_muxd3        ;
// assign    rx_nclk3        = rx_nclk_muxd3        ;
// assign    tx_bclk3        = tx_bclk_muxd3        ;
// assign    tx_nclk3        = tx_nclk_muxd3        ;
`endif 
  
endmodule // mac_clk_driver

   
