// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcx_l2t_checker.v
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

`define pcx_req0            `TB_TOP.cpu.pcx_sctag0_data_rdy_px1
`define pcx_atm0            `TB_TOP.cpu.pcx_sctag0_atm_px1
`define pcx_valid0          `TB_TOP.cpu.pcx_sctag0_data_px2[129:129] 
`define pcx_req0_type       `TB_TOP.cpu.pcx_sctag0_data_px2[128:124]
`define pcx_req0_nc         `TB_TOP.cpu.pcx_sctag0_data_px2[123:123]
`define pcx_req0_cpu_id     `TB_TOP.cpu.pcx_sctag0_data_px2[122:120]
`define pcx_req0_thread_id  `TB_TOP.cpu.pcx_sctag0_data_px2[119:117]
`define pcx_req0_inv        `TB_TOP.cpu.pcx_sctag0_data_px2[116:116]
`define pcx_req0_pf         `TB_TOP.cpu.pcx_sctag0_data_px2[115:115]
`define pcx_req0_bis        `TB_TOP.cpu.pcx_sctag0_data_px2[114:114]
`define pcx_req0_size       `TB_TOP.cpu.pcx_sctag0_data_px2[111:104]
`define pcx_req0_bnk_addr   `TB_TOP.cpu.pcx_sctag0_data_px2[72:70]
`define clk                 `TB_TOP.cpu.l2clk
`define rst_n               `TB_TOP.reset
`define partial_mode_bank0  `TB_TOP.cpu.l2t0.ncu_l2t_pm
`define pcx_sctag0_data_rdy_px1	`TB_TOP.cpu.pcx_sctag0_data_rdy_px1

`define LOAD  5'b00000
`define IFILL 5'b10000
`define STORE 5'b00001
`define CAS_1 5'b00010
`define CAS_2 5'b00011
`define SWAP  5'b00111
`define STRLD 5'b00100
`define STRST 5'b00101
`define MMULD 5'b01000

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

module pcx_l2t_checker(); // top level module l2_pcx_protocol
reg pcx_sctag0_data_rdy_px1_d1;
wire[3:0] AB;
assign AB = {`TB_TOP.cpu.l2t0.ncu_l2t_ba67, `TB_TOP.cpu.l2t0.ncu_l2t_ba45, `TB_TOP.cpu.l2t0.ncu_l2t_ba23, `TB_TOP.cpu.l2t0.ncu_l2t_ba01};

always @(posedge  `TB_TOP.cpu.l2clk)
   begin
      pcx_sctag0_data_rdy_px1_d1 <= `pcx_sctag0_data_rdy_px1;
   end

`ifdef FC_BENCH

//Check that in Partial Cores Partial Banks mode, the corresponding
//l2clk is gated off and the address translation is correct.
/*
 x0in assert -var (`TB_TOP.cpu.l2t0.l2clk == 1'b0)
            -active (`TB_TOP.cpu.l2t0.ncu_l2t_pm == 1'b1 && `TB_TOP.cpu.l2t0.ncu_l2t_ba01 == 1'b1)
*/
/* x0in assert -var (`TB_TOP.cpu.l2t1.l2clk == 1'b0)
            -active (`TB_TOP.cpu.l2t1.ncu_l2t_pm == 1'b1 && `TB_TOP.cpu.l2t1.ncu_l2t_ba01 == 1'b1)
*/
/* x0in assert -var (`TB_TOP.cpu.l2t2.l2clk == 1'b0)
            -active (`TB_TOP.cpu.l2t2.ncu_l2t_pm == 1'b1 && `TB_TOP.cpu.l2t2.ncu_l2t_ba23 == 1'b1)
*/
/* x0in assert -var (`TB_TOP.cpu.l2t3.l2clk == 1'b0)
            -active (`TB_TOP.cpu.l2t3.ncu_l2t_pm == 1'b1 && `TB_TOP.cpu.l2t3.ncu_l2t_ba23 == 1'b1)
*/
/* x0in assert -var (`TB_TOP.cpu.l2t4.l2clk == 1'b0)
            -active (`TB_TOP.cpu.l2t4.ncu_l2t_pm == 1'b1 && `TB_TOP.cpu.l2t4.ncu_l2t_ba45 == 1'b1)
*/
/* x0in assert -var (`TB_TOP.cpu.l2t5.l2clk == 1'b0)
            -active (`TB_TOP.cpu.l2t5.ncu_l2t_pm == 1'b1 && `TB_TOP.cpu.l2t5.ncu_l2t_ba45 == 1'b1)
*/
/* x0in assert -var (`TB_TOP.cpu.l2t6.l2clk == 1'b0)
            -active (`TB_TOP.cpu.l2t6.ncu_l2t_pm == 1'b1 && `TB_TOP.cpu.l2t6.ncu_l2t_ba67 == 1'b1)
*/
/* x0in assert -var (`TB_TOP.cpu.l2t7.l2clk == 1'b0)
            -active (`TB_TOP.cpu.l2t7.ncu_l2t_pm == 1'b1 && `TB_TOP.cpu.l2t7.ncu_l2t_ba67 == 1'b1)
*/
`endif

/* x0in assert -var (pcx_l2t_data_px2[72:71] == 2'b00) 
            -active (ncu_l2t_pm == 1'b1 && AB == 4'b0001 ) 
            -module l2t
*/
/* x0in assert -var (pcx_l2t_data_px2[72:71] == 2'b01) 
            -active (ncu_l2t_pm == 1'b1 && AB == 4'b0010 ) 
            -module l2t
*/
/* x0in assert -var (pcx_l2t_data_px2[72] == 1'b0) 
            -active (ncu_l2t_pm == 1'b1 && AB == 4'b0011 ) 
            -module l2t
*/
/* x0in assert -var (pcx_l2t_data_px2[72:71] == 2'b10) 
            -active (ncu_l2t_pm == 1'b1 && AB == 4'b0100 ) 
            -module l2t
*/
/* x0in assert -var (pcx_l2t_data_px2[71] == 1'b0) 
            -active (ncu_l2t_pm == 1'b1 && AB == 4'b0101 ) 
            -module l2t
*/
/* x0in assert -var (pcx_l2t_data_px2[72] == ~pcx_l2t_data_px2[71]) 
            -active (ncu_l2t_pm == 1'b1 && AB == 4'b0110 ) 
            -module l2t
*/
/* x0in assert -var (pcx_l2t_data_px2[72:71] == 2'b11) 
            -active (ncu_l2t_pm == 1'b1 && AB == 4'b1000 ) 
            -module l2t
*/
/* x0in assert -var (pcx_l2t_data_px2[72] == pcx_l2t_data_px2[71]) 
            -active (ncu_l2t_pm == 1'b1 && AB == 4'b1001 ) 
            -module l2t
*/
/* x0in assert -var (pcx_l2t_data_px2[71] == 1'b1) 
            -active (ncu_l2t_pm == 1'b1 && AB == 4'b1010 ) 
            -module l2t
*/
/* x0in assert -var (pcx_l2t_data_px2[72] == 1'b1) 
            -active (ncu_l2t_pm == 1'b1 && AB == 4'b1100 ) 
            -module l2t
*/
/* 0in assert -var ~(AB == 4'b0000) 
            -active ((`TB_TOP.cpu.ncu_l2t_pm == 1'b1) & (`TB_TOP.flush_reset_complete == 1'b1))
            -clock `TB_TOP.cpu.l2clk*/
/* 0in assert -var ~(AB == 4'b0111) 
            -active (`TB_TOP.cpu.ncu_l2t_pm == 1'b1)
            -clock `TB_TOP.cpu.l2clk*/
/* 0in assert -var ~(AB == 4'b1011) 
            -active (`TB_TOP.cpu.ncu_l2t_pm == 1'b1)
            -clock `TB_TOP.cpu.l2clk*/
/* 0in assert -var ~(AB == 4'b1101) 
            -active (`TB_TOP.cpu.ncu_l2t_pm == 1'b1)
            -clock `TB_TOP.cpu.l2clk*/
/* 0in assert -var ~(AB == 4'b1110) 
            -active (`TB_TOP.cpu.ncu_l2t_pm == 1'b1)
            -clock `TB_TOP.cpu.l2clk*/
/* 0in assert -var ~(AB == 4'b1111)
	    -active (`TB_TOP.cpu.ncu_l2t_pm == 1'b1)
            -clock `TB_TOP.cpu.l2clk*/





//Check that every request is followed by a data rdy
/*
 x0in assert_follower -leader        `pcx_req0
                     -follower      `pcx_valid0 
                     -known_follower 
                     -min            1 
                     -max_leader     64
                     -clock          `clk 
*/


//Check that the contents of the packet is valid
/*
 0in value -var      `pcx_req0_type
           -val      `LOAD `IFILL `STORE `CAS_1 `CAS_2 `SWAP `STRST `MMULD `STRLD
           -active   (`pcx_valid0 & pcx_sctag0_data_rdy_px1_d1)
           -name      pcx_req_valid_chk
           -message  "pcx req has an invalid request type" 
           -module    cpu
           -clock    `clk
*/



//Check that for cas/swap packets the nc bit is set to one
/*
 0in value -var      `pcx_req0_nc
           -val      1'b1
           -active   (`pcx_valid0 & ((`pcx_req0_type == `CAS_1) | (`pcx_req0_type== `CAS_2) | (`pcx_req0_type == `SWAP)))
           -name      pcx_cas_nc_chk
           -module    cpu
           -clock    `clk
*/

          
//Check that for dcache invalidate packets the nc bit is set to zero
/*
 x0in value -var      `pcx_req0_nc
           -val      1'b0
           -active   (`pcx_valid0 & ((`pcx_req0_type == `LOAD) & (`pcx_req0_inv == 1'b1) & (`pcx_req0_pf ==1'b0)))
           -name      pcx_dcache_nc_chk
           -module    cpu
           -clock    `clk
*/


//Check that for icache invalidate packets the nc bit is set to zero
/*
 0in value -var      `pcx_req0_nc
           -val      1'b0
           -active   (`pcx_valid0 & ((`pcx_req0_type == `IFILL) & (`pcx_req0_inv == 1'b1)))
           -name      pcx_icache_nc_chk
           -module    cpu
           -clock    `clk
*/

//Check that for streamload and stream store nc bit is set to one       
/*
 0in value -var      `pcx_req0_nc
           -val      1'b1
           -active   (`pcx_valid0 & ((`pcx_req0_type == `STRST) | (`pcx_req0_type == `STRLD) | (`pcx_req0_type == `MMULD)))
           -name      pcx_cas_nc_chk_str
           -module    cpu
           -clock    `clk
*/

//Check for block stores and block init stores the size has to be 8'hff

//Bank steer check in 8 bank mode the Bank0 should be getting Bank0 pkts
/*
 0in value -var      `pcx_req0_bnk_addr
           -val      `BANK0 
           -active   (`pcx_valid0 & (`pcx_req0_type == `STORE) & (`pcx_req0_bis == 1'b1) & ~(`partial_mode_bank0))
           -name      pcx_bank0_steer
           -module    cpu
           -clock    `clk
*/

//Check for skid window, 5 cycles from the time stall is asserted no req's should
//be made to the l2t


//In case of atomic transactions make sure that the two back to back packets have
//the same semantics

endmodule //end top level module protocol check

/*
module l2_pcx_protocol;
///////////////////////////////////////////////////////////////////////////////
// These signals can be used to disable certain 0-In checkers at runtime,
// so that testcases forcing interface errors don't die with checker firings.
///////////////////////////////////////////////////////////////////////////////
//reg disable_l2_checks;
reg req0_d, req1_d, req2_d, req3_d, req4_d, req5_d, req6_d, req7_d;
reg cpu_id_d, cpu_id_dd;
reg atm0_d, atm0_dd;
reg atomic_broken;

//0in set_clock  -default  `clk -module l2_pcx_protocol  
   
initial
   begin
//      disable_l2_checks = 1'b0;
      atomic_broken     = 1'b0;
   end

//task chkr_off;
//   input [1:0] chkr;
//begin
//   case( chkr ) 
//      0: disable_l2_checks = 1'b1;
//      default:
//	$display("%m %t: invalid checker id %d \n", $time, chkr);
//   endcase
// end
//endtask // chkr_off


always @(posedge  `TB_TOP.cpu.l2clk)
   begin
      req0_d    <= `req0;
      atm0_d    <= `atm0;
      cpu_id_d  <= `cpu_id0;
      cpu_id_dd <= cpu_id_d;
      atm0_dd   <= atm0_d;
   end

wire   atm_req0;
assign atm_req0 = `req0 & `atm0;

wire   non_atm_req0;
assign non_atm_req0 = `req0 & ~(`atm0);

wire   non_atm_req_0d;
assign non_atm_req_0d = req0_d & ~(atm0_d);

wire   atm_req_0d;
assign atm_req_0d = req0_d & atm0_d;

wire   pcx_valid0_w;
assign pcx_valid0_w = `pcx_valid0; //0in  assert_follower -leader non_atm_req0 -follower pcx_valid0_w -min 1 -max 1 


//check that non_atm req is always followed by valid pcx packet
//x0in  assert_follower -ldr non_atm_req0 -flwr pcx_valid0_w -min 1 -max 1 -module l2_pcx_protocol

//check that atomic_req is always followed by valid pcx packet
//0in  assert_follower -ldr atm_req0 -flwr `pcx_valid0 -min 1 -max 1 




//atomic transition state machine
reg [3:0] atm_curr, atm_nxt;
parameter  [3:0] idle = 1, req = 2, atmReq0 = 4, atmReq1 = 8;
always @( `req0 or `atm0 or `pcx_valid0 or atm_curr or `rst)
   begin
      case (atm_curr)
         idle:
            begin
               if( ~`rst )
                  atm_nxt = idle;
               if( `req0 & `atm0)
                  atm_nxt = atmReq0;
               else if( `req0 & ~(`atm0) )
                  atm_nxt = req;
               else
                  atm_nxt = atm_curr;
            end
          req:
            begin
               if( `req0 & `atm0)
                  atm_nxt = atmReq0;
               else if ( `req0 & ~(`atm0) )
                  atm_nxt = req;
               else
                  atm_nxt = idle;
            end
          atmReq0:
            begin
               if( `req0 & (~`atm0) )
                  atm_nxt = atmReq1;
               else
                  atm_nxt = atm_curr;
            end
          atmReq1:
            begin
               if( `req0 & (~`atm0))
                 atm_nxt = req;
               else if ( `req0 & `atm0 )
                 atm_nxt = atmReq1;
               else
                 atm_nxt = idle;
            end
          default:
            begin
               //0in fire -message " should never reach this state"
            end
    endcase
    end

always @(posedge `clk or `rst )
   begin
     if (~`rst)
        atm_curr = 2'b00;
     else
        atm_curr = atm_nxt;
   end

//make sure that the pcx interface is not stuck               
//0in timeout -val 1000 -var atm_curr[2] 
//0in timeout -val 1000 -var atm_curr[3] 

//make sure that their no intervening transaction between atomic packets

reg atomic_broken;

always @( atm_curr[3] )
   begin
      if( cpu_id_d != cpu_id_dd )
        atomic_broken = 1'b1; //0in fire -message "atomicity broken on pcx to l2 atomic transaction"
   end    


endmodule
*/
