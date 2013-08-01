// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fc_niu_slam.v
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
   reg sel_gmii;
   integer speed0,speed1;

   integer speed;
   integer mac_port;
   reg     speed_10G;
   reg [8*60:1] arg,arg0,arg1;



   initial
     begin
        arg = "GET_MAC_PORTS=";

        if ($test$plusargs("GET_MAC_PORTS="))
          mac_port =  $util_get_plus_args_num(arg);
        $display("mc_core : Ethernet Port is %0d \n",mac_port);

     end

   initial
     begin
        /* Check MAC_SPEED0 */

        arg0 = "MAC_SPEED0=";
        if ($test$plusargs("MAC_SPEED0="))
          speed0 = $util_get_plus_args_num(arg0);
        else speed0 = 10000;

        /* Check MAC_SPEED1 */

        arg1 = "MAC_SPEED1=";
        if ($test$plusargs("MAC_SPEED1="))
          speed1 = $util_get_plus_args_num(arg1);
        else speed1 = 10000;


        if ((speed0 == 10000) ||(speed1 == 10000))
          begin
             $display("mc_core : Ethernet Speed 10G\n");
             speed_10G = 1;
          end
        else
          begin
             $display("mac_core : Ethernet Speed0 Speed1 %0d, %0d\n",speed0, speed1);
             speed_10G = 0;
          end


        /* Check PCS_SERDES */

        if ($test$plusargs("PCS_SERDES"))
          begin
             $display("mac_core : Ethernet SerDes Mode\n");
             sel_gmii = 0;
          end
        else
          begin
             $display("mac_core : Ethernet RGMII Mode\n");
             sel_gmii = 1;
          end

        if ($test$plusargs ("NO_SRDS_REG_SLAM"))
          begin
          end
        else                                    // Default SERDES SLAMing
          begin
`ifdef NIU_SYSTEMC_T2
`else
             if(speed_10G == 1)
               begin
                force `ESR.cfgtx0_0 = 24'h00_0001;
                force `ESR.cfgtx1_0 = 24'h00_0001;
                force `ESR.cfgtx2_0 = 24'h00_0001;
                force `ESR.cfgtx3_0 = 24'h00_0001;
                force `ESR.cfgrx0_0 = 28'h008_5001;
                force `ESR.cfgrx1_0 = 28'h008_5001;
                force `ESR.cfgrx2_0 = 28'h008_5001;
                force `ESR.cfgrx3_0 = 28'h008_5001;
                force `ESR.cfgpll_0 = 12'h003;
                force `ESR.testcfg_0 = 16'h0000;

                force `ESR.cfgtx0_1 = 24'h00_0001;
                force `ESR.cfgtx1_1 = 24'h00_0001;
                force `ESR.cfgtx2_1 = 24'h00_0001;
                force `ESR.cfgtx3_1 = 24'h00_0001;
                force `ESR.cfgrx0_1 = 28'h008_5001;
                force `ESR.cfgrx1_1 = 28'h008_5001;
                force `ESR.cfgrx2_1 = 28'h008_5001;
                force `ESR.cfgrx3_1 = 28'h008_5001;
                force `ESR.cfgpll_1 = 12'h003;
                force `ESR.testcfg_1 = 16'h0000;
               end
             else
               begin
                force `ESR.cfgtx0_0 = 20'h0_0021;
                force `ESR.cfgtx1_0 = 20'h0_0000;
                force `ESR.cfgtx2_0 = 20'h0_0000;
                force `ESR.cfgtx3_0 = 20'h0_0000;
                force `ESR.cfgrx0_0 = 28'h000_5021;
                force `ESR.cfgrx1_0 = 28'h000_0000;
                force `ESR.cfgrx2_0 = 28'h000_0000;
                force `ESR.cfgrx3_0 = 28'h000_0000;
                force `ESR.cfgpll_0 = 12'h00b;
                force `ESR.testcfg_0 = 16'h0000;

                force `ESR.cfgtx0_1 = 20'h0_0021;
                force `ESR.cfgtx1_1 = 20'h0_0000;
                force `ESR.cfgtx2_1 = 20'h0_0000;
                force `ESR.cfgtx3_1 = 20'h0_0000;
                force `ESR.cfgrx0_1 = 28'h008_5021;
                force `ESR.cfgrx1_1 = 28'h008_0000;
                force `ESR.cfgrx2_1 = 28'h008_0000;
                force `ESR.cfgrx3_1 = 28'h008_0000;
                force `ESR.cfgpll_1 = 12'h00b;
                force `ESR.testcfg_1 = 16'h0000;

               end
`endif // NIU_SYSTEMC_T2
          end
     end

assign refclk_enet_n = ~refclk_enet;
assign refclk_enet = speed_10G ? enet_clk :  m0_rx_clk ;

// These are derived clks that
// needed an initial state

`ifdef NIU_SYSTEMC_T2
`else

initial
   begin
`ifdef NIU_GATE
        force tb_top.cpu.rdp.debug_niu_clk_divby2 = 1'b0;
        force tb_top.cpu.rdp.debug_niu_clk_divby4 = 1'b0;
        force tb_top.cpu.rdp.debug_niu_clk_divby8 = 1'b0;
	#1;
        release tb_top.cpu.rdp.debug_niu_clk_divby2;
        release tb_top.cpu.rdp.debug_niu_clk_divby4;
        release tb_top.cpu.rdp.debug_niu_clk_divby8;
`else
    if($test$plusargs("NIU_CLK_DIV")) begin
	tb_top.cpu.rdp.debug.niu_clk_divby2 = 0;
	tb_top.cpu.rdp.debug.niu_clk_divby4 = 0;
	tb_top.cpu.rdp.debug.niu_clk_divby8 = 0;
    end
`endif
   end

`endif // NIU_SYSTEMC_T2


