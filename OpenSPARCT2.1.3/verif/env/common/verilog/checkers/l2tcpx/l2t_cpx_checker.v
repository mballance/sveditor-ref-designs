// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_cpx_checker.v
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
`ifdef FC_BENCH
 `define TB_TOP tb_top
`else
`ifdef CCM
  `define TB_TOP tb_top
`else
  `define TB_TOP l2sat_top
`endif
`endif


`define cpx_bnk0_coren_req       `TB_TOP.cpu.sctag0_cpx_req_cq[7:0]
`define cpx_bnk0_core0_req       `TB_TOP.cpu.sctag0_cpx_req_cq[0]
`define cpx_bnk0_core1_req       `TB_TOP.cpu.sctag0_cpx_req_cq[1]
`define cpx_bnk0_core2_req       `TB_TOP.cpu.sctag0_cpx_req_cq[2]
`define cpx_bnk0_core3_req       `TB_TOP.cpu.sctag0_cpx_req_cq[3]
`define cpx_bnk0_core4_req       `TB_TOP.cpu.sctag0_cpx_req_cq[4]
`define cpx_bnk0_core5_req       `TB_TOP.cpu.sctag0_cpx_req_cq[5]
`define cpx_bnk0_core6_req       `TB_TOP.cpu.sctag0_cpx_req_cq[6]
`define cpx_bnk0_core7_req       `TB_TOP.cpu.sctag0_cpx_req_cq[7]

`define cpx_bnk0_core0_gnt       `TB_TOP.cpu.cpx_sctag0_grant_cx[0]
`define cpx_bnk0_core1_gnt       `TB_TOP.cpu.cpx_sctag0_grant_cx[1]
`define cpx_bnk0_core2_gnt       `TB_TOP.cpu.cpx_sctag0_grant_cx[2]
`define cpx_bnk0_core3_gnt       `TB_TOP.cpu.cpx_sctag0_grant_cx[3]
`define cpx_bnk0_core4_gnt       `TB_TOP.cpu.cpx_sctag0_grant_cx[4]
`define cpx_bnk0_core5_gnt       `TB_TOP.cpu.cpx_sctag0_grant_cx[5]
`define cpx_bnk0_core6_gnt       `TB_TOP.cpu.cpx_sctag0_grant_cx[6]
`define cpx_bnk0_core7_gnt       `TB_TOP.cpu.cpx_sctag0_grant_cx[7]

`define cpx_atm0                 `TB_TOP.cpu.sctag0_cpx_atom_cq

`define cpx_valid0               `TB_TOP.cpu.sctag0_cpx_data_ca[145] 
`define cpx_bnk0_rtntyp          `TB_TOP.cpu.sctag0_cpx_data_ca[144:141]
`define cpx_bnk0_l2miss          `TB_TOP.cpu.sctag0_cpx_data_ca[140]
`define cpx_bnk0_err             `TB_TOP.cpu.sctag0_cpx_data_ca[139:138]
`define cpx_bnk0_nc              `TB_TOP.cpu.sctag0_cpx_data_ca[137]
`define cpx_bnk0_thrid           `TB_TOP.cpu.sctag0_cpx_data_ca[136:134]
`define cpx_bnk0_wv              `TB_TOP.cpu.sctag0_cpx_data_ca[133]
`define cpx_bnk0_mmuid           `TB_TOP.cpu.sctag0_cpx_data_ca[132:131]
`define cpx_bnk0_f4b             `TB_TOP.cpu.sctag0_cpx_data_ca[130]
`define cpx_bnk0_if2             `TB_TOP.cpu.sctag0_cpx_data_ca[129]
`define cpx_bnk0_pf              `TB_TOP.cpu.sctag0_cpx_data_ca[128]

`define clk                      `TB_TOP.cpu.l2clk
`define rst_n                    `TB_TOP.reset

`define LOADACK      4'b0000
`define IFILLACK1    4'b0001   //First  part
`define IFILLACK2    4'b0001   //Second part
`define STOREACK     4'b0100
`define ICACHEINV    4'b0100
`define DCACHEINV    4'b0100
`define DIAGSTOREACK 4'b0100 
`define CASRTN       4'b0000    //Load  return
`define CASACK       4'b0100    //Store return
`define SWAPRTN      4'b0000    //Load  return
`define SWAPACK      4'b0100    //Store return
`define STRLDRTN     4'b0010    //Load  return
`define STRSTACK     4'b0110    //Store return
`define EVICTINV     4'b0011    
`define ERRORINDL2   4'b1100    //L2 error indication
`define MMULDRTN     4'b0101    //L2 error indication

`define BANK0  3'b000
`define BANK1  3'b001
`define BANK2  3'b010
`define BANK3  3'b011
`define BANK4  3'b100
`define BANK5  3'b101
`define BANK6  3'b110
`define BANK7  3'b111

`define CPU0  3'b000
`define CPU1  3'b001
`define CPU2  3'b010
`define CPU3  3'b011
`define CPU4  3'b100
`define CPU5  3'b101
`define CPU6  3'b110
`define CPU7  3'b111

module l2t_cpx_checker(); // top level module l2_cpx_protocol

reg    [7:0] l2t_cpx_req_delay;
reg          req2core_d;
reg          cpx_atm_d;
reg          cpx_atm_d_bnk0_core0;
reg          cpx_atm_d_bnk0_core1;
reg          cpx_atm_d_bnk0_core2;
reg          cpx_atm_d_bnk0_core3;
reg          cpx_atm_d_bnk0_core4;
reg          cpx_atm_d_bnk0_core5;
reg          cpx_atm_d_bnk0_core6;
reg          cpx_atm_d_bnk0_core7;

wire   req2core, qual_data_valid;
wire   cpx_valid0_l;
wire   reqOrAtm;

always @(posedge `clk) begin
   l2t_cpx_req_delay[7:0] <= `cpx_bnk0_coren_req; //delayed signal needed to even out glitches
   req2core_d             <= req2core;
   cpx_atm_d_bnk0_core0   <= `cpx_atm0 & `cpx_bnk0_core0_req;
   cpx_atm_d_bnk0_core1   <= `cpx_atm0 & `cpx_bnk0_core1_req;
   cpx_atm_d_bnk0_core2   <= `cpx_atm0 & `cpx_bnk0_core2_req;
   cpx_atm_d_bnk0_core3   <= `cpx_atm0 & `cpx_bnk0_core3_req;
   cpx_atm_d_bnk0_core4   <= `cpx_atm0 & `cpx_bnk0_core4_req;
   cpx_atm_d_bnk0_core5   <= `cpx_atm0 & `cpx_bnk0_core5_req;
   cpx_atm_d_bnk0_core6   <= `cpx_atm0 & `cpx_bnk0_core6_req;
   cpx_atm_d_bnk0_core7   <= `cpx_atm0 & `cpx_bnk0_core7_req;
end

assign req2core = `cpx_bnk0_core0_req | `cpx_bnk0_core1_req | `cpx_bnk0_core2_req | `cpx_bnk0_core3_req |
                  `cpx_bnk0_core4_req | `cpx_bnk0_core5_req | `cpx_bnk0_core6_req | `cpx_bnk0_core7_req;
assign cpx_valid0_l = `cpx_valid0;
assign qual_data_valid = req2core_d & cpx_valid0_l;  
assign reqOrAtm =  cpx_atm_d | `cpx_bnk0_core0_req;

//every req has to followed by a data valid
//Check that return type is valid in the packet
//since l2t some time's keeps driving the ccx
//we need to qualify this
/*
 0in value -var      `cpx_bnk0_rtntyp
           -val      `LOADACK `IFILLACK1 `IFILLACK2 `STOREACK `ICACHEINV `DCACHEINV  `DIAGSTOREACK `CASRTN `CASACK `SWAPRTN `SWAPACK `SWAPACK `STRLDRTN `STRSTACK `EVICTINV `ERRORINDL2 `MMULDRTN
           -active   qual_data_valid
           -name      cpx_rtn_typ_chk 
           -message  "cpx does not have a valid return type" 
           -module    cpu
           -clock    `clk
*/

//if it is a mmuld then nc bit has to be one
/*
 0in value -var      `cpx_bnk0_nc
           -val      1'b1
           -active   (`cpx_bnk0_rtntyp == `MMULDRTN)
           -name     mmuld_nc_set2_0
           -message  "mmuld packet does not have the nc bit set to 0"
           -module   cpu
           -clock    `clk
*/

//if it is a prefetch then nc bit has to be one
/*
 0in value -var      `cpx_bnk0_nc
           -val      1'b1
           -active   ((`cpx_bnk0_rtntyp == `LOADACK) & (`cpx_bnk0_pf == 1'b1))
           -name     prefetch_nc_set2_0
           -message  "prefectch packet does not have the nc bit set to 0"
           -module   cpu
           -clock    `clk
*/

//if it is a atomic then nc bit has to be set to one
/*
 0in value -var      `cpx_bnk0_nc
           -val      1'b1
           -active   (((`cpx_bnk0_rtntyp == `CASRTN) | (`cpx_bnk0_rtntyp == `CASACK)) & (`cpx_bnk0_if2 == 1'b1))
           -name     atomic_nc_set2_0
           -message  "atomic packet does not have the nc bit set to 0"
           -module   cpu
           -clock    `clk
*/


//if it is evict invalidation or l2 error then the l2miss bit should be set 
//zero 
/*
 0in value -var      `cpx_bnk0_l2miss
           -val      1'b1
           -active   (((`cpx_bnk0_rtntyp == `EVICTINV) | (`cpx_bnk0_rtntyp == `ERRORINDL2)) & (`cpx_bnk0_pf == 1'b1))
           -name     evict_error_l2miss_set_0 
           -message  "Eviction packet on the l2 error packet has the L2 miss bit set"
           -module   cpu
           -clock    `clk
*/
//every req should be followed by a gnt
/*
 x0in assert_follower -leader        (`cpx_bnk0_core0_req | cpx_atm_d_bnk0_core0)
                     -follower      `cpx_bnk0_core0_gnt 
                     -known_follower 
                     -min            1 
                     -max_leader     64
                     -name           cpx_bnk0_core0_req
                     -module         cpu
                     -clock          `clk
                     -message        "req was not followed by a gnt"
*/
/*
 x0in assert_follower -leader        (`cpx_bnk0_core1_req | cpx_atm_d_bnk0_core1)
                     -follower      `cpx_bnk0_core1_gnt 
                     -known_follower 
                     -min            1 
                     -max_leader     64
                     -name           cpx_bnk0_core1_req
                     -module         cpu
                     -clock          `clk
                     -message        "req was not followed by a gnt"
*/
/*
 x0in assert_follower -leader        (`cpx_bnk0_core2_req | cpx_atm_d_bnk0_core2)
                     -follower      `cpx_bnk0_core2_gnt 
                     -known_follower 
                     -min            1 
                     -max_leader     64
                     -name           cpx_bnk0_core2_req
                     -module         cpu
                     -clock          `clk
                     -message        "req was not followed by a gnt"
*/
/*
 x0in assert_follower -leader        (`cpx_bnk0_core3_req | cpx_atm_d_bnk0_core3)
                     -follower      `cpx_bnk0_core3_gnt 
                     -known_follower 
                     -min            1 
                     -max_leader     64
                     -name           cpx_bnk0_core3_req
                     -module         cpu
                     -clock          `clk
                     -message        "req was not followed by a gnt"
*/
/*
 x0in assert_follower -leader        (`cpx_bnk0_core4_req | cpx_atm_d_bnk0_core4)
                     -follower      `cpx_bnk0_core4_gnt 
                     -known_follower 
                     -min            1 
                     -max_leader     64
                     -name           cpx_bnk0_core4_req
                     -module         cpu
                     -clock          `clk
                     -message        "req was not followed by a gnt"
*/
/*
 x0in assert_follower -leader        (`cpx_bnk0_core5_req | cpx_atm_d_bnk0_core5)
                     -follower      `cpx_bnk0_core5_gnt 
                     -known_follower 
                     -min            1 
                     -max_leader     64
                     -name           cpx_bnk0_core5_req
                     -module         cpu
                     -clock          `clk
                     -message        "req was not followed by a gnt"
*/
/*
 x0in assert_follower -leader        (`cpx_bnk0_core6_req | cpx_atm_d_bnk0_core6)
                     -follower      `cpx_bnk0_core6_gnt 
                     -known_follower 
                     -min            1 
                     -max_leader     64
                     -name           cpx_bnk0_core6_req
                     -module         cpu
                     -clock          `clk
                     -message        "req was not followed by a gnt"
*/
/*
 x0in assert_follower -leader        (`cpx_bnk0_core7_req | cpx_atm_d_bnk0_core7)
                     -follower      `cpx_bnk0_core7_gnt 
                     -known_follower 
                     -min            1 
                     -max_leader     64
                     -name           cpx_bnk0_core7_req
                     -module         cpu
                     -clock          `clk
                     -message        "req was not followed by a gnt"
*/



endmodule //end top level module protocol check

