// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fc_top.v
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
`timescale 1ps/1ps

`ifdef RESET_AXIS_ONLY

`include "axis_ram1.v"
`include "axis_ram2.v"
`include "axis_ram3.v"
`include "axis_ram4.v"
`include "axis_ram5.v"

`endif

`include "fc_csr_cabinet.v"
module tb_top;
   parameter delay_375 = 1330; //  = 375MHz
   parameter delay_250 = 2000; //  = 250MHz
   parameter delay_125 = 4000; //  = 125MHz
   parameter delay_104 = 4800; //  = 104MHz	//AT 04/12/06: DTM mode only
   parameter delay_100 = 5000; //  = 100MHz

`include "fc.vh"                // design hierachical defines
`include "cpu.h"                // design constant defines, such as bus width, etc...
`include "cross_module.h"       // MCU design and monitors define

  reg [165:0] dbg_dq_reg;              // use this reg to drive DBG_DQ pkg pin
  initial dbg_dq_reg = {166 {1'bz} };  // not drive DBG_DQ

  reg pll_testmode_reg, pll_cmp_bypass_reg;
  initial begin
    if (! $test$plusargs("pll_bypass")) begin
      pll_testmode_reg = 1'bz;
      pll_cmp_bypass_reg = 1'b0;
    end
    // if +pll_bypass specified, see file pll_bypass.vh
  end
  wire PLL_TESTMODE = pll_testmode_reg;
  wire PLL_CMP_BYPASS = pll_cmp_bypass_reg;

`include "pll_bypass.vh"               // PLL Bypass code

   // Global registers & values, use with core bench

`ifdef PALLADIUM
mcu_mem_config mcu_mem_config();
`endif

   reg          full_efu = 1'b0;
   reg [63:0]   finished_tids ;
   integer      last_act_cycle ;
   integer      th_last_act_cycle[63:0];
   integer      pm_shift;
   integer      sys_half_period;
   integer      tck_period, tck_half_period;
   reg	jtpor_init_on;
   wire [63:0]  gOutOfBoot;             // Vera Interface signal. Vera drives.

   // for NCU BFM, always present
   wire [39:0]  b8_cpx_pa;
   wire [145:0] b8_cpx_pkt;
   wire [2:0]   b8_cpx_cid;
   wire         b8_cpx_ctrue;
   wire         b8_cpx_swap = 1'b0;

   // Other signals
   wire                 reset;          // This is Bench-reset
`ifdef AXIS_TL
   wire flush_reset_complete;
`endif
`ifdef MCU_GATE
   wire flush_reset_complete;
`endif

   reg [31:0] rst_lock_time; // value to be forced into RESET's LOCK_TIME reg for PLL lock time

   // I/O to DUT
  wire core_clk;        // 
  wire iol2clk;
  wire iol2clk_2x;
  reg  enet_clk;
  wire SYSCLK, SYSCLKN;
  wire dram_12x_clk;
  wire dram_6x_clk;
  wire fbl2clk;  // NOT DRIVEN!!!

//BP 6-07-06 state_machine to drive pb reset and jtag for tester
`ifdef RESET_AXIS_ONLY
wire    PWRON_RST_L;
reg jtpor_trig;
reg [7:0] ram_cnt; 
initial ram_cnt = 0;
initial jtpor_trig = 0;
   
reg     serdes_trig1;
reg     serdes_trig2;
reg     serdes_trig3;
reg     serdes_trig4;
reg     serdes_trig5;
always @(posedge SYSCLK ) begin
        if (!PWRON_RST_L) begin
        serdes_trig1 <= 1'b0;
        serdes_trig3 <= 1'b0;
        end
        else if (tb_top.cpu.tcu.tcu_rst_flush_stop_ack || 
                (`TCU.mbist_ctl.bisx_counter == 32'h2_29c3) ||
                (tb_top.cpu.efu.sbc_efa_word_addr[5:0] == 6'h3f) ||
                (tb_top.cpu.ncu.rst_ncu_unpark_thread)) begin
             serdes_trig1 <= tb_top.cpu.tcu.tcu_rst_flush_stop_ack & (tb_top.cpu.tcu.tcu_rst_flush_stop_ack && (tb_top.cpu.rst.rst_mio_rst_state == 6'b000110)) ;
	     serdes_trig3 <= tb_top.cpu.tcu.tcu_rst_flush_stop_ack & (tb_top.cpu.tcu.tcu_rst_flush_stop_ack && (tb_top.cpu.rst.rst_mio_rst_state == 6'b001010));
        end
        else begin
             serdes_trig1 <= 1'b0;
             serdes_trig3 <= 1'b0;
        end
end

reg       saw_trig4 ;
reg [8:0] trig4_cntr ;

always @(posedge SYSCLK ) begin
        if ((tb_top.cpu.efu.sbc_efa_word_addr[5:0] == 6'h3f) & (tb_top.cpu.rst.rst_mio_rst_state == 6'b001011) & ~saw_trig4) begin
           serdes_trig4 <= (tb_top.cpu.efu.sbc_efa_word_addr[5:0] == 6'h3f) ;
           saw_trig4    <= 1'b1 ;
        end
        else
           serdes_trig4 <= 1'b0;
end

always @(posedge SYSCLK ) begin
       if (!PWRON_RST_L)  begin
          trig4_cntr <= 9'b0 ;
       end
       else if (saw_trig4 & (trig4_cntr != 9'b101111110)) begin
          trig4_cntr <= trig4_cntr + 1 ;
       end
       else
          trig4_cntr <= trig4_cntr ;
end

wire   trigger4 = saw_trig4 & (trig4_cntr == 9'b101111101) ;


reg    saw_trig2 ;
always @(posedge core_clk ) begin
        if ((`TCU.mbist_ctl.bisx_counter == 32'h2_29c3) & ~saw_trig2) begin
            serdes_trig2 <= (`TCU.mbist_ctl.bisx_counter == 32'h2_29c3) ;
	    saw_trig2    <= 1'b1;
        end
        else 
            serdes_trig2 <= 1'b0 ;
end

wire    trigger2 = !serdes_trig2 & (`TCU.mbist_ctl.bisx_counter == 32'h2_29c3) & ~saw_trig2;
reg  [2:0] cclk_cntr ;
reg        hold_trig2_cclk ;
   
always @(posedge core_clk ) begin
        if(trigger2)  begin
	    hold_trig2_cclk <= 1'b1;
	    cclk_cntr       <= cclk_cntr + 1;
        end
	else if (cclk_cntr != 3'b0) begin
	    cclk_cntr       <= cclk_cntr + 1;
	end
	else
	    hold_trig2_cclk <= 1'b0;
end


reg    saw_trig5 ;
always @(posedge core_clk ) begin
          if ((tb_top.cpu.ncu.rst_ncu_unpark_thread) & ~saw_trig5) begin
            serdes_trig5 <= (tb_top.cpu.ncu.rst_ncu_unpark_thread) ;
	    saw_trig5    <= 1'b1;
        end
        else 
            serdes_trig5 <= 1'b0 ;
end

wire    trigger5 = !serdes_trig5 & (tb_top.cpu.ncu.rst_ncu_unpark_thread) & ~saw_trig5 ;
reg  [2:0] cclk_cntr2 ;
reg        hold_trig5_cclk ;
   
always @(posedge core_clk ) begin
        if(trigger5)  begin
	    hold_trig5_cclk <= 1'b1;
	    cclk_cntr2      <= cclk_cntr2 + 1;
        end
	else if (cclk_cntr2 != 3'b0) begin
	    cclk_cntr2      <= cclk_cntr2 + 1;
	end
	else
	    hold_trig5_cclk <= 1'b0;
end

initial begin                                                     
hold_trig5_cclk = 0;                                              
cclk_cntr2 = 0;                                                   
serdes_trig5 = 0;                                                 
saw_trig5 = 0;                                                    
hold_trig2_cclk = 0;                                              
cclk_cntr = 0;                                                    
serdes_trig2 = 0;                                                 
saw_trig2 = 0;                                                    
serdes_trig4 = 0;                                                 
saw_trig4 = 0;                                                    
end             

wire    trigger1 = !serdes_trig1 & (tb_top.cpu.tcu.tcu_rst_flush_stop_ack && (tb_top.cpu.rst.rst_mio_rst_state == 6'b000110));
wire    trigger3 = !serdes_trig3 & (tb_top.cpu.tcu.tcu_rst_flush_stop_ack && (tb_top.cpu.rst.rst_mio_rst_state == 6'b001010));

reg [11:0]      axis_jtag_count1;
reg [11:0]      axis_jtag_count2;
reg [11:0]      axis_jtag_count3;
reg [11:0]      axis_jtag_count4;
reg [11:0]      axis_jtag_count5;
reg             hold_trigger1;
reg             hold_trigger2;
reg             hold_trigger3;
reg             hold_trigger4;
reg             hold_trigger5;
reg		hold_trigger1_d ;
reg		hold_trigger2_d ;
reg		hold_trigger3_d ;
reg		hold_trigger4_d ;
reg		hold_trigger5_d ;

wire [11:0]     max_count = trigger1 ? 12'b000100010101 :
   			    trigger2 ? 12'b000000100101 :
 			    trigger3 ? 12'b000010110100 :
			    trigger4 ? 12'b001000100000 :
			    trigger5 ? 12'b000011001100 : 12'b000100010101 ;


always @(posedge SYSCLK ) begin
        if (!PWRON_RST_L) begin
                hold_trigger1 <= 1'b0;
                axis_jtag_count1[11:0] <= 12'b000000000000;
                hold_trigger2 <= 1'b0;
                axis_jtag_count2[11:0] <= 12'b000000000000;
                hold_trigger3 <= 1'b0;
                axis_jtag_count3[11:0] <= 12'b000000000000;
                hold_trigger4 <= 1'b0;
                axis_jtag_count4[11:0] <= 12'b000000000000;
                hold_trigger5 <= 1'b0;
                axis_jtag_count5[11:0] <= 12'b000000000000;
        end
        else begin
	if( trigger1 ) begin
       	 	hold_trigger1 <= 1'b1;
	end
	if( hold_trig2_cclk ) begin
        	hold_trigger2 <= 1'b1;
	end
	if( trigger3 ) begin
        	hold_trigger3 <= 1'b1;
	end
	if( trigger4 ) begin
        	hold_trigger4 <= 1'b1;
	end
	if( hold_trig5_cclk ) begin
        	hold_trigger5 <= 1'b1;
	end
	if( !(hold_trigger1 || trigger1) )begin
                axis_jtag_count1[11:0] <= 12'b000000000000;
        end
        else if ( (hold_trigger1 || trigger1) )begin
                if ( axis_jtag_count1[11:0] == 12'b000100010101)begin
                        axis_jtag_count1[11:0] <= axis_jtag_count1[11:0];
                        hold_trigger1            <= 1'b0;
                end
                else begin
                        axis_jtag_count1[11:0] <= axis_jtag_count1[11:0] + 12'b000000000001 ;
                end
        end
	if( !(hold_trigger2 ) )begin
                axis_jtag_count2[11:0] <= 12'b000000000000;
                end
        else if ( (hold_trigger2 ) )begin
                if ( axis_jtag_count2[11:0] == 12'b000000100101)begin
                        axis_jtag_count2[11:0] <= axis_jtag_count2[11:0];
                        hold_trigger2            <= 1'b0;
                end
                else begin
                        axis_jtag_count2[11:0] <= axis_jtag_count2[11:0] + 12'b000000000001 ;
                end
        end
	if( !(hold_trigger3 || trigger3) )begin
                axis_jtag_count3[11:0] <= 12'b000000000000;
                end
        else if ( (hold_trigger3 || trigger3) )begin
                if ( axis_jtag_count3[11:0] == 12'b000010110100)begin
                        axis_jtag_count3[11:0] <= axis_jtag_count3[11:0];
                        hold_trigger3            <= 1'b0;
                end
                else begin
                        axis_jtag_count3[11:0] <= axis_jtag_count3[11:0] + 12'b000000000001 ;
                end
        end
	if( !(hold_trigger4 || trigger4) )begin
                axis_jtag_count4[11:0] <= 12'b000000000000;
                end
        else if ( (hold_trigger4 || trigger4) )begin
                if ( axis_jtag_count4[11:0] == 12'b001000100000)begin
                        axis_jtag_count4[11:0] <= axis_jtag_count4[11:0];
                        hold_trigger4            <= 1'b0;
                end
                else begin
                        axis_jtag_count4[11:0] <= axis_jtag_count4[11:0] + 12'b000000000001 ;
                end
        end
        if( !(hold_trigger5 || trigger5) )begin
                axis_jtag_count5[11:0] <= 12'b000000000000;
                end
        else if ( (hold_trigger5 || trigger5) )begin
                if ( axis_jtag_count5[11:0] == 12'b000011001100)begin
                        axis_jtag_count5[11:0] <= axis_jtag_count5[11:0];
                        hold_trigger5            <= 1'b0;
                end
                else begin
                        axis_jtag_count5[11:0] <= axis_jtag_count5[11:0] + 12'b000000000001 ;
                end
        end
        hold_trigger1_d  <= hold_trigger1 ;
        hold_trigger2_d  <= hold_trigger2 ;
        hold_trigger3_d  <= hold_trigger3 ;
        hold_trigger4_d  <= hold_trigger4 ;
        hold_trigger5_d  <= hold_trigger5 ;
       end  // (else PWRON_RST_L)
end

wire    [2:0]   axis_dout_jtpor;
axis_ram1       axis_ram1_jtpor ( .clk(SYSCLK),
                                .rd_addr(ram_cnt[7:0]),
                                .wr_addr(9'b0),
                                .rd_en(1'b1),
                                .wr_en(1'b0),
                                .din(5'b0),
                                .dout(axis_dout_jtpor[2:0])
                                );

wire    [2:0]   axis_dout1;
axis_ram1       axis_ram1_r1 ( .clk(SYSCLK),
                                .rd_addr(axis_jtag_count1[8:0]),
                                .wr_addr(9'b0),
                                .rd_en(1'b1),
                                .wr_en(1'b0),
                                .din(5'b0),
                                .dout(axis_dout1[2:0])
                                );

wire    [2:0]   axis_dout2;
axis_ram2       axis_ram1_r2 ( .clk(SYSCLK),
                                .rd_addr(axis_jtag_count2[5:0]),
                                .wr_addr(9'b0),
                                .rd_en(1'b1),
                                .wr_en(1'b0),
                                .din(5'b0),
                                .dout(axis_dout2[2:0])
                                );
wire    [2:0]   axis_dout3;
axis_ram3       axis_ram1_r3 ( .clk(SYSCLK),
                                .rd_addr(axis_jtag_count3[7:0]),
                                .wr_addr(9'b0),
                                .rd_en(1'b1),
                                .wr_en(1'b0),
                                .din(5'b0),
                                .dout(axis_dout3[2:0])
                                );
wire    [2:0]   axis_dout4;
axis_ram4       axis_ram1_r4 ( .clk(SYSCLK),
                                .rd_addr(axis_jtag_count4[9:0]),
                                .wr_addr(9'b0),
                                .rd_en(1'b1),
                                .wr_en(1'b0),
                                .din(5'b0),
                                .dout(axis_dout4[2:0])
                                );
wire    [2:0]   axis_dout5;
axis_ram5       axis_ram1_r5 ( .clk(SYSCLK),
                                .rd_addr(axis_jtag_count5[7:0]),
                                .wr_addr(9'b0),
                                .rd_en(1'b1),
                                .wr_en(1'b0),
                                .din(5'b0),
                                .dout(axis_dout5[2:0])
                                );

wire   hold_trigger1_or_d = hold_trigger1 | hold_trigger1_d ;
wire   hold_trigger2_or_d = hold_trigger2 | hold_trigger2_d ;
wire   hold_trigger3_or_d = hold_trigger3 | hold_trigger3_d ;
wire   hold_trigger4_or_d = hold_trigger4 | hold_trigger4_d ;
wire   hold_trigger5_or_d = hold_trigger5 | hold_trigger5_d ;

reg  [2:0]  neg_axis_dout1 ;
reg  [2:0]  neg_axis_dout2 ;
reg  [2:0]  neg_axis_dout3 ;
reg  [2:0]  neg_axis_dout4 ;
reg  [2:0]  neg_axis_dout5 ;
reg         pbrst_testpin ;
reg  [16:0]  pbrst_counter ;
reg        PB_RST_L ;
reg        TDI ;
reg        TMS ;
reg        TRST_L ;
reg  [6:0] stop_counter ;
reg        stop_flag ;
reg        pbrst_stop_flag ;

always @(negedge SYSCLK ) begin
        if (!PWRON_RST_L) begin
            neg_axis_dout1[2:0] <= 3'b0 ;
            neg_axis_dout2[2:0] <= 3'b0 ;
            neg_axis_dout3[2:0] <= 3'b0 ;
            neg_axis_dout4[2:0] <= 3'b0 ;
            neg_axis_dout5[2:0] <= 3'b0 ;
        end
        else begin
            neg_axis_dout1[2:0] <= axis_dout1[2:0] ;
            neg_axis_dout2[2:0] <= axis_dout2[2:0] ;
            neg_axis_dout3[2:0] <= axis_dout3[2:0] ;
            neg_axis_dout4[2:0] <= axis_dout4[2:0] ;
            neg_axis_dout5[2:0] <= axis_dout5[2:0] ;
        end
end

always @(posedge SYSCLK ) begin
        if (!PWRON_RST_L) begin
            pbrst_counter <= 17'b0 ;
            pbrst_stop_flag <= 1'b0 ;
        end
        else if (hold_trig5_cclk & ~pbrst_stop_flag) begin
            pbrst_counter <= pbrst_counter + 1 ;
	    pbrst_stop_flag <= 1'b1 ;
        end
        else if ((pbrst_counter != 17'b10000000001001010) & pbrst_stop_flag)
            pbrst_counter <= pbrst_counter + 1 ;
end
       

initial PB_RST_L = 1'b1 ;
always @(pbrst_counter) begin
       if (pbrst_counter == 17'b10000000000110100) begin
           PB_RST_L = 1'b0 ;
	end
       else if (pbrst_counter == 17'b10000000001001001) begin
	   PB_RST_L = 1'b1 ;
	end
end
                
always @(posedge SYSCLK ) begin
        if (!PWRON_RST_L) begin
            stop_counter <= 7'b0 ;
	    stop_flag    <= 1'b0 ;
        end
        else if (!PB_RST_L & ~stop_flag) begin
            stop_counter <= stop_counter + 1 ;
            stop_flag    <= 1'b1 ;
        end
        else if (stop_flag && (stop_counter[6:0] != 7'b1100100))
            stop_counter <= stop_counter + 1 ;
        else if (stop_flag && (stop_counter[6:0] == 7'b1100100)) begin
            $display("AXIS: $stop at simulation time %0d \n",$time);
            $stop ;
	end
end


always @(hold_trigger1_or_d or hold_trigger2_or_d or hold_trigger3_or_d or hold_trigger4_or_d or
                             hold_trigger5_or_d or SYSCLK) begin
    if (SYSCLK == 0) begin
    case ({hold_trigger1_or_d, hold_trigger2_or_d, hold_trigger3_or_d, hold_trigger4_or_d, hold_trigger5_or_d}) 
        5'b10000 : begin
                   TDI     = axis_dout1[0];
                   TMS     = axis_dout1[1];
                   end
        5'b01000 : begin
                   TDI     = axis_dout2[0];
                   TMS     = axis_dout2[1];
                   end
        5'b00100 : begin
                   TDI     = axis_dout3[0];
                   TMS     = axis_dout3[1];
                   end
        5'b00010 : begin
                   TDI     = axis_dout4[0];
                   TMS     = axis_dout4[1];
                   end
        5'b00001 : begin
                   TDI     = axis_dout5[0];
                   TMS     = axis_dout5[1];
                   end

        default:   begin
                   end
    endcase
    end
    else if (SYSCLK == 1) begin
        TRST_L  = PWRON_RST_L;
    end
end



`endif


`ifdef AXIS_TL
  wire dram_clk;
  reg [63:0] cycle;
  wire       SystemClock;

  axis_clock_generator axis_clock_generator(.sclk (dram_12x_clk), .fbclk(dram_6x_clk), .sysclk(SYSCLK));

  assign SystemClock = `CCU.cmp_pll_clk; // axis only

  //assign clk=axis_clock_generator.l2clk;
  assign core_clk=`CCU.cmp_pll_clk;
  //assign gclk=axis_clock_generator.l2clk;
  assign iol2clk=`CCU.ccu_io_out;
  assign iol2clk_2x = `CCU.ccu_io2x_out;

  initial cycle = 0;
  always @(posedge SystemClock)
    cycle = cycle + 1;

  assign SYSCLKN=~SYSCLK;   //added 6/23/06 -- 
  
`else
  reg SystemClock; // ALWAYS RUNNING CLOCK. THIS GOES TO VERA. VERA NEEDS A CONTINUOUS CLOCK.
  wire TESTMODE = 1'b0;

  // TO REMOVE

  wire gclk;  // NOT DRIVEN
`endif // !`ifdef AXIS_TL

`ifdef RESET_AXIS_ONLY
  wire refclk_enet_n = PLL_CMP_CLK_N;
  wire refclk_enet = PLL_CMP_CLK_P;
`else
  wire refclk_enet_n;
  wire refclk_enet;
`endif
  wire m0_rx_clk;

   // needed for FC interface coverage  
`ifdef FC_COVERAGE
`include "fc_coverage.v"
`endif

//------------------------------
// L2$-MCU/DDR2/DRIF_CTL Monitor - NOTE this does coverage AND monitors
//                                 so don't put it inside coverage ifdef
//------------------------------

`ifndef AXIS_TL
`ifndef MCU_GATE
mcusat_cov_mon   mcusat_cov_mon (
  .clk      (core_clk),
  .rst_l    (flush_reset_complete)
);
`endif
`endif

   //-----------------------------------------------------
   // Chip primary I/O
   //-----------------------------------------------------

   wire         BURNIN              = 1'b0;
   wire         PGRM_EN             = 1'b0;
`ifndef  TO_1_0_VECTORS
   wire        [7:0]       L2T_VNW  = 8'b11111111;
   wire        [7:0]       SPC_VNW  = 8'b11111111;
   wire        [7:0]       L2D_VNW0  = 8'b11111111;
   wire        [7:0]       L2D_VNW1  = 8'b11111111;
`endif

   wire [1:0]   PMI                 = 2'b0;

   wire         DIVIDER_BYPASS      = 1'b0;
//   wire         PLL_CMP_BYPASS      = 1'b0;

   wire [1:0]   STCICFG             = 2'b0;
   wire         STCICLK             = 1'b0;
   wire         STCID               = 1'b0;
   wire         TESTCLKR            = 1'b0;
   wire         TESTCLKT            = 1'b0;
   wire         TRIGIN              = 1'b0;
   wire [165:0] DBG_DQ;

// Driven from ssi model

   wire         SSI_SYNC_L;
`ifdef RESET_AXIS_ONLY
   wire         SSI_EXT_INT_L=1'b1;
`else
   wire         SSI_EXT_INT_L;
`endif
   wire         SSI_SCK;
   wire         SSI_MOSI;
   wire         SSI_MISO;

//FBDIMM AMUX output wires
   wire [2:0]   FBDIMM0A_AMUX;
   wire [2:0]   FBDIMM0B_AMUX;

   wire [2:0]   FBDIMM1A_AMUX;
   wire [2:0]   FBDIMM1B_AMUX;

   wire [2:0]   FBDIMM2A_AMUX;
   wire [2:0]   FBDIMM2B_AMUX;

   wire [2:0]   FBDIMM3A_AMUX;
   wire [2:0]   FBDIMM3B_AMUX;

//PEX AMUX output wires
`ifdef RESET_AXIS_ONLY
   wire [1:0]   PEX_AMUX = 2'b0;
`else
   wire [1:0]   PEX_AMUX;
`endif

`ifndef FC_NO_NIU_T2
//XAUI AMUX, LINK, ACT wires
`ifdef RESET_AXIS_ONLY
   wire [1:0]   XAUI0_AMUX=1'b1;
`else
   wire         XAUI0_AMUX;
`endif
   wire         XAUI0_LINK_LED;
   wire         XAUI0_ACT_LED;

`ifdef RESET_AXIS_ONLY
   wire         XAUI1_AMUX = 1'b1;
`else
   wire         XAUI1_AMUX;
`endif
   wire         XAUI1_LINK_LED;
   wire         XAUI1_ACT_LED;
   wire         XAUI_MDINT0_L;
   wire         XAUI_MDINT1_L;
`endif
   
//MISC wires
`ifdef RESET_AXIS_ONLY
   wire  [2:0] DIODE_TOP = 3'h0;
   wire  [2:0] DIODE_BOT = 3'h0;
`else
   wire  [2:0] DIODE_TOP;
   wire  [2:0] DIODE_BOT;
`endif
   wire  [2:0] PWR_THRTTL_0;
   wire  [2:0] PWR_THRTTL_1;
//   wire  [1:0] SPARE;
   wire        VREG_SELBG_L = 1'b0;     // bandgap select
   wire        VDD_PLL_CMP_REG = 1'b1;  // PLL's vdd

//End primary IO wires

   wire zero;
   wire one;
   wire [31:0] SCAN_OUT;
   wire [2:0]  status_shdw;
   wire        mcu_selfrsh;
   wire [2:0]  status;
   wire [31:0] lock_count;
   wire [31:0] prop_count;
   wire AC_TEST_MODE;
   wire [31:0] SCAN_IN; 
   wire SCAN_EN;
   wire tb_top_TRST_L;      // TRST_L: driven by fc bench when USE_JTAG_DRIVER is not defined
   wire TCK;
   wire tck2dut;            // TCK: driven from Vera when USE_JTAG_DRIVER is defined
   reg tck_clkgen_reg;      // clock generator for TCK (free running clock. Vera uses this clock)
   reg tck_clkgen_per_PRM;  // clock generator for TCK. Toggle TCK as required by PRM.
`ifdef AXIS_TL_ICE
   wire tck;
`else
`ifdef AXIS_TL
   `ifdef FAST_AXIS
      wire tck=`CCU.ccu_pll.tck;
   `else
      `ifdef RESET_AXIS_ONLY
          wire tck=SYSCLK;
      `else
          wire tck=`CCU.ccu_pll.x1.imaginary_vco_gen.pll_core.tck;
      `endif
   `endif
`else
   wire tck = tck_clkgen_reg;
`endif // AXIS_TL_ICE

  //----- drive pkg pins ----
  assign `CPU.DBG_DQ = dbg_dq_reg;


   // PM shift value determined here for write_dram and read_dram calls
   initial begin
	pm_shift = 0;
	if(`PARGS.bank_set_mask == 4'h3 || `PARGS.bank_set_mask == 4'h5 || `PARGS.bank_set_mask == 4'h6 || `PARGS.bank_set_mask == 4'h9 || `PARGS.bank_set_mask == 4'ha || `PARGS.bank_set_mask == 4'hc)
		pm_shift = 1;
	else if(`PARGS.bank_set_mask_csr == 4'h3 || `PARGS.bank_set_mask_csr == 4'h5 || `PARGS.bank_set_mask_csr == 4'h6 || `PARGS.bank_set_mask_csr == 4'h9 || `PARGS.bank_set_mask_csr == 4'ha || `PARGS.bank_set_mask_csr == 4'hc)
		pm_shift = 1;
	else if(`PARGS.bank_set_mask == 4'h1 || `PARGS.bank_set_mask == 4'h2 || `PARGS.bank_set_mask == 4'h4 || `PARGS.bank_set_mask == 4'h8)
		pm_shift = 2;
	else if(`PARGS.bank_set_mask_csr == 4'h1 || `PARGS.bank_set_mask_csr == 4'h2 || `PARGS.bank_set_mask_csr == 4'h4 || `PARGS.bank_set_mask_csr == 4'h8)
		pm_shift = 2;
   end
`endif // !`ifdef AXIS_TL_ICE


`ifdef USE_JTAG_DRIVER
  `ifdef AXIS_TL
     assign TCK = tck;
  `else
     `ifdef DTM_ENABLED
         assign TCK = ~tck;
     `else
         assign TCK = tck2dut;
     `endif
  `endif
`else
  assign TCK = tck_clkgen_per_PRM;
  assign TRST_L = tb_top_TRST_L;
`endif // !`ifdef USE_JTAG_DRIVER

`ifdef AXIS_TL
  // clock is generated in axis_hacks.v
`else
   //--- generate TCK clock
   initial begin
       #0; // Wait for sys_half_period to be set
       if ($value$plusargs("TCK_PERIOD=%d", tck_period)) begin
`ifndef DTM_ENABLED
           if (tck_period < 4*sys_half_period) begin
               `PR_ERROR("fc_top", `ERROR, "+TCK_PERIOD=%d is less than twice the SYSCLK period (%d)", tck_period, 2*sys_half_period);
           end
`endif
       end
       else begin
	   tck_period = 6*sys_half_period; // default is 1/3 SYSCLK frequency
       end
       `PR_NORMAL("fc_top", `NORMAL, "TCK period set to %d ps", tck_period);
       tck_half_period = tck_period/2;
       tck_clkgen_reg = 1'bx;
       #1 tck_clkgen_reg = 0;
`ifdef PALLADIUM
`else
       forever begin
	   // 200Mhz, #5000, timescale 1ps
	   #(tck_half_period) tck_clkgen_reg = ~tck_clkgen_reg;
       end
`endif
   end

   //--- generate/toggle TCK clock per section 13.9.1 of PRM -- POR reset seq
   //--- (toggle TCK once while TRS_L is low and toggle 5 times after TRST_L deasserted)
   always begin
     #1 tck_clkgen_per_PRM = 1'b0;
     // Make sure TRST_L is asserted
     while (`CPU.TRST_L !== 1'b0) @(negedge `CPU.TRST_L);
     #(tck_half_period); // Wait a little bit
     // toggle TCK once when TRST_L is low/asserted
     tck_clkgen_per_PRM = 1'b1;
     #(tck_half_period);
     tck_clkgen_per_PRM = 1'b0;
     @(posedge `CPU.TRST_L);           // wait for TRST_L deasserted
     repeat (10) begin                  // toggle TCK five times and hold TMS high. Note: TMS has pull-up.
       #(tck_half_period) tck_clkgen_per_PRM = ~tck_clkgen_per_PRM;
     end
     // Wait for next power-on reset
     @(negedge `CPU.PWRON_RST_L);
   end

`endif //AXIS_TL

   assign zero = 1'b0;
   assign one = 1'b1;
   assign SCAN_OUT = {`CPU.DBG_DQ[159], `CPU.DBG_DQ[73:43]};
`ifndef AXIS_TL
   tcu_mon tcu_mon();   // Test control unit monitor
   ccu_mon ccu_mon();   // Clock control unit monitor
`endif
   reg [23:0]   asi_power_throttle;  // referenced from plus_args.v.  not used in FC. PWR_THROTTLE pins driven                                  //  later in this file

   // MCU SAT references, should remove

   reg  fail_flag;
   reg  mcusat_fbdimm_gclk;

   // MCU FSR to DRAM connections
   wire [9:0]   fbdimm0a_tx_p_top;
   wire [9:0]   fbdimm0a_tx_n_top;
   wire [13:0]  fbdimm0a_rx_p_top;
   wire [13:0]  fbdimm0a_rx_n_top;

   wire [9:0]   fbdimm0b_tx_p_top;
   wire [9:0]   fbdimm0b_tx_n_top;
   wire [13:0]  fbdimm0b_rx_p_top;
   wire [13:0]  fbdimm0b_rx_n_top;

   wire [9:0]   fbdimm1a_tx_p_top;
   wire [9:0]   fbdimm1a_tx_n_top;
   wire [13:0]  fbdimm1a_rx_p_top;
   wire [13:0]  fbdimm1a_rx_n_top;

   wire [9:0]   fbdimm1b_tx_p_top;
   wire [9:0]   fbdimm1b_tx_n_top;
   wire [13:0]  fbdimm1b_rx_p_top;
   wire [13:0]  fbdimm1b_rx_n_top;

   wire [9:0]   fbdimm2a_tx_p_top;
   wire [9:0]   fbdimm2a_tx_n_top;
   wire [13:0]  fbdimm2a_rx_p_top;
   wire [13:0]  fbdimm2a_rx_n_top;

   wire [9:0]   fbdimm2b_tx_p_top;
   wire [9:0]   fbdimm2b_tx_n_top;
   wire [13:0]  fbdimm2b_rx_p_top;
   wire [13:0]  fbdimm2b_rx_n_top;

   wire [9:0]   fbdimm3a_tx_p_top;
   wire [9:0]   fbdimm3a_tx_n_top;
   wire [13:0]  fbdimm3a_rx_p_top;
   wire [13:0]  fbdimm3a_rx_n_top;

   wire [9:0]   fbdimm3b_tx_p_top;
   wire [9:0]   fbdimm3b_tx_n_top;
   wire [13:0]  fbdimm3b_rx_p_top;
   wire [13:0]  fbdimm3b_rx_n_top;

   wire         pcl2clk;        // referenced from PEU SAT

   // Other signals

`include "errorCountTasks.v"
`ifndef AXIS_TL
`include "flush_prop.v"         // Option to simulate the real flush reset behaviour
`endif

   // handle thread enables and all CMP register details

   // initial values
   initial begin
      finished_tids = 0;
      last_act_cycle = 0;

      // UD : added for csr dispmon support
      // 03/10/05 : Wait for the slowest reset deassertion
      
      force dispmon_disable = 0;
`ifndef AXIS_TL
      if ($test$plusargs("dispmon_disable")) force dispmon_disable = 1;
      if ($test$plusargs("nodispmon_disable")) force dispmon_disable = 0;
      @(posedge flush_reset_complete);
      `PR_ALWAYS ("top", `ALWAYS, "flush_reset_complete has asserted!\n");
      force dispmon_disable = 0;
`endif
   end

   //----------------------------------------------------------
   // Clock Generator
   //

`ifdef PALLADIUM
// No such clock in Axis as well.

   initial begin
      enet_clk = 1;
   end

`else

`ifdef AXIS_TL
   initial begin
	enet_clk = 1;
   end

`else

   initial begin
      enet_clk = 1'bx;
      #1 enet_clk = 0;
      #2000 enet_clk = 1;
      forever begin
	 #1600 enet_clk = ~enet_clk;
      end
   end
`endif //AXIS_TL
`endif //PALLADIUM



initial begin
   if ($value$plusargs("rst_lock_time=%h", rst_lock_time)) begin
   end
   else begin
      rst_lock_time = 32'h00000010;
   end
end


initial begin
`ifdef FULL_RESET
	if($test$plusargs("QUICK_RESET")) begin
		// Only Counters will be forced, POR execution not compromising any functionality
		`PR_NORMAL ("top",`NORMAL,"QUICK_RESET plusarg detected");
`ifdef RST_GATE
		force {`RST.rst_fsm_ctl__lock_time_q_phy_15_,`RST.rst_fsm_ctl__lock_time_q_phy_14_,`RST.rst_fsm_ctl__lock_time_q_phy_13_,`RST.rst_fsm_ctl__lock_time_q_phy_12_,`RST.rst_fsm_ctl__lock_time_q_phy_11_,`RST.rst_fsm_ctl__lock_time_q_phy_10_,`RST.rst_fsm_ctl__lock_time_q_phy_9_,`RST.rst_fsm_ctl__lock_time_q_phy_8_,`RST.rst_fsm_ctl__lock_time_q_phy_7_,`RST.rst_fsm_ctl__lock_time_q_phy_6_,`RST.rst_fsm_ctl__lock_time_q_phy_5_,`RST.rst_fsm_ctl__lock_time_q_phy_4_,`RST.rst_fsm_ctl__lock_time_q_phy_3_,`RST.rst_fs
m_ctl__lock_time_q_phy_2_,`RST.rst_fsm_ctl__lock_time_q_phy_1_,`RST.rst_fsm_ctl__lock_time_q_phy_0_ }  = 16'd1616;
		force {`RST.rst_fsm_ctl__prop_time_q_phy_15_,`RST.rst_fsm_ctl__prop_time_q_phy_14_,`RST.rst_fsm_ctl__prop_time_q_phy_13_,`RST.rst_fsm_ctl__prop_time_q_phy_12_,`RST.rst_fsm_ctl__prop_time_q_phy_11_,`RST.rst_fsm_ctl__prop_time_q_phy_10_,`RST.rst_fsm_ctl__prop_time_q_phy_9_,`RST.rst_fsm_ctl__prop_time_q_phy_8_,`RST.rst_fsm_ctl__prop_time_q_phy_7_,`RST.rst_fsm_ctl__prop_time_q_phy_6_,`RST.rst_fsm_ctl__prop_time_q_phy_5_,`RST.rst_fsm_ctl__prop_time_q_phy_4_,`RST.rst_fsm_ctl__prop_time_q_phy_3_,`RST.rst_fs
m_ctl__prop_time_q_phy_2_,`RST.rst_fsm_ctl__prop_time_q_phy_1_,`RST.rst_fsm_ctl__prop_time_q_phy_0_ }  = 16'd1616;
`else
		force `RST.rst_fsm_ctl.lock_time_q = 32'd16;      //Clock lock_time delay
		force `RST.rst_fsm_ctl.prop_time_q = 32'd16;      //Flush propogation delay
`endif //end of ifdef RST_GATE

`ifdef TCU_GATE
		force { `TCU.sigmux_ctl__cntdly_dout_l_6_,`TCU.sigmux_ctl__cntdly_dout_l_5_,`TCU.sigmux_ctl__cntdly_dout_l_4_,`TCU.sigmux_ctl__cntdly_dout_l_3_,`TCU.sigmux_ctl__cntdly_dout_l_2_,`TCU.sigmux_ctl__cntdly_dout_l_1_,`TCU.sigmux_ctl__cntdly_dout_l_0_ } = 7'b1110000;
		force { `TCU.mbist_ctl__bisx_counter_31_,`TCU.mbist_ctl__bisx_counter_30_,`TCU.mbist_ctl__bisx_counter_29_,`TCU.mbist_ctl__bisx_counter_28_,`TCU.mbist_ctl__bisx_counter_27_,`TCU.mbist_ctl__bisx_counter_26_,`TCU.mbist_ctl__bisx_counter_25_,`TCU.mbist_ctl__bisx_counter_24_,`TCU.mbist_ctl__bisx_counter_23_,`TCU.mbist_ctl__bisx_counter_22_,`TCU.mbist_ctl__bisx_counter_21_,`TCU.mbist_ctl__bisx_counter_20_,`TCU.mbist_ctl__bisx_counter_19_} = 13'h1FFF;
`else
		force `TCU.sigmux_ctl.cntdly_dout_l = 7'b1110000; //Register to set delay between clk start/stop(di/dt)
		force `TCU.mbist_ctl.bisx_counter[31:19] = 13'h1FFF;  //BISI timeout counter
`endif //end of ifdef TCU_GATE
		force `CPU.tcu_sck_bypass = 1'b1;           //Bypass sck counter
	end
`endif //end of ifdef FULL_RESET
end


`ifdef FULL_RESET
reg vector_quick_reset;
initial begin
        // This option need to be enhanced for GATESIM. Will be done on need to basis
        vector_quick_reset = 0;
        if($test$plusargs("VECTOR_QUICK_RESET")) begin
                `PR_NORMAL ("top",`NORMAL,"VECTOR_QUICK_RESET plusarg detected");
                #1 vector_quick_reset = 1'b1;
                force `RST.rst_fsm_ctl.lock_time_q = 32'h20;      //Clock lock_time delay
                force `RST.rst_fsm_ctl.prop_time_q = 32'h20;      //Flush propogation delay
                force `RST.rst_fsm_ctl.niu_time_q = 32'h10;       //NIU lock time delay
        end
end
  
reg [14:0] efu_wait_count;
initial begin
   if ($value$plusargs("efu_wait_count=%h", efu_wait_count)) begin
   end
   else begin
      efu_wait_count = 15'h500;
   end
   `PR_NORMAL ("top",`NORMAL,"efu_wait_count set to %h ", efu_wait_count);
end

always @(vector_quick_reset or  `TCU.sigmux_ctl.efcnt_dout)
begin
     if(vector_quick_reset) begin
        if( `TCU.sigmux_ctl.efcnt_dout >= efu_wait_count) begin
                force `TCU.sigmux_ctl.efcnt_din = 15'h4800;
                repeat (2)  @(posedge `CPU.l2clk);
                release `TCU.sigmux_ctl.efcnt_din ;
                wait(`TCU.tcu_rst_efu_done == 1'b1);
                @ (negedge `TCU.tcu_rst_efu_done);
        end
    end

end
`endif //end of ifdef FULL_RESET


`ifndef AXIS_TL
`ifndef AXIS
`ifndef GATESIM
  // force an init state
  initial begin
// AT 04/12/06: Cause VCS 7.2.1R26 sim to hang at time 0.    #0;
    if ($test$plusargs("forcePORstate")) begin 
      repeat (100) @(posedge core_clk);
      // wait for the specific time
      @(posedge `CPU.tcu_rst_efu_done);
      `PR_ALWAYS ("top", `ALWAYS, "Initial flop state, first tcu_rst_efu_done (+forcePORstate).");
      @(posedge `CPU.tcu_rst_efu_done);
      `PR_ALWAYS ("top", `ALWAYS, "Initial flop state, second tcu_rst_efu_done (+forcePORstate).");
      `include "forcePORstate.vh"
      `PR_ALWAYS ("top", `ALWAYS, "Initial flop state, now set (+forcePORstate).");
    end
  end 
`endif //  `ifndef GATESIM
`endif //  `ifndef AXIS
`endif //  `ifndef AXIS_TL




`ifndef AXIS_TL
wire PWRON_RST_L;
`ifndef FULL_RESET

always @(posedge PWRON_RST_L or posedge `CPU.rst_wmr_protect ) begin
`ifdef RST_GATE
    force {`RST.rst_fsm_ctl__lock_time_q_phy_15_,`RST.rst_fsm_ctl__lock_time_q_phy_14_,`RST.rst_fsm_ctl__lock_time_q_phy_13_,`RST.rst_fsm_ctl__lock_time_q_phy_12_,`RST.rst_fsm_ctl__lock_time_q_phy_11_,`RST.rst_fsm_ctl__lock_time_q_phy_10_,`RST.rst_fsm_ctl__lock_time_q_phy_9_,`RST.rst_fsm_ctl__lock_time_q_phy_8_,`RST.rst_fsm_ctl__lock_time_q_phy_7_,`RST.rst_fsm_ctl__lock_time_q_phy_6_,`RST.rst_fsm_ctl__lock_time_q_phy_5_,`RST.rst_fsm_ctl__lock_time_q_phy_4_,`RST.rst_fsm_ctl__lock_time_q_phy_3_,`RST.rst_fsm_ctl__lock_time_q_phy_2_,`RST.rst_fsm_ctl__lock_time_q_phy_1_,`RST.rst_fsm_ctl__lock_time_q_phy_0_ }  = 32'h1410;

    force {`RST.rst_fsm_ctl__prop_time_q_phy_15_,`RST.rst_fsm_ctl__prop_time_q_phy_14_,`RST.rst_fsm_ctl__prop_time_q_phy_13_,`RST.rst_fsm_ctl__prop_time_q_phy_12_,`RST.rst_fsm_ctl__prop_time_q_phy_11_,`RST.rst_fsm_ctl__prop_time_q_phy_10_,`RST.rst_fsm_ctl__prop_time_q_phy_9_,`RST.rst_fsm_ctl__prop_time_q_phy_8_,`RST.rst_fsm_ctl__prop_time_q_phy_7_,`RST.rst_fsm_ctl__prop_time_q_phy_6_,`RST.rst_fsm_ctl__prop_time_q_phy_5_,`RST.rst_fsm_ctl__prop_time_q_phy_4_,`RST.rst_fsm_ctl__prop_time_q_phy_3_,`RST.rst_fsm_ctl__prop_time_q_phy_2_,`RST.rst_fsm_ctl__prop_time_q_phy_1_,`RST.rst_fsm_ctl__prop_time_q_phy_0_ }  = 32'hc10;

    force {`RST.rst_fsm_ctl__niu_time_q_phy_15_,`RST.rst_fsm_ctl__niu_time_q_phy_14_,`RST.rst_fsm_ctl__niu_time_q_phy_13_,`RST.rst_fsm_ctl__niu_time_q_phy_12_,`RST.rst_fsm_ctl__niu_time_q_phy_11_,`RST.rst_fsm_ctl__niu_time_q_phy_10_,`RST.rst_fsm_ctl__niu_time_q_phy_9_,`RST.rst_fsm_ctl__niu_time_q_phy_8_,`RST.rst_fsm_ctl__niu_time_q_phy_7_,`RST.rst_fsm_ctl__niu_time_q_phy_6_,`RST.rst_fsm_ctl__niu_time_q_phy_5_,`RST.rst_fsm_ctl__niu_time_q_phy_4_,`RST.rst_fsm_ctl__niu_time_q_phy_3_,`RST.rst_fsm_ctl__niu_time_q_phy_2_,`RST.rst_fsm_ctl__niu_time_q_phy_1_,`RST.rst_fsm_ctl__niu_time_q_phy_0_ }  = 32'h650;
`else

   force `RST.rst_fsm_ctl.lock_time_q      = rst_lock_time;
   force `RST.rst_fsm_ctl.prop_time_q      = 32'h00000010;
   force `RST.rst_fsm_ctl.niu_time_q       = 32'h00000010;
`endif // RST_GATE

//@(posedge `CPU.tcu_rst_asicflush_stop_ack) ;
`ifdef TCU_GATE
    force { `TCU.sigmux_ctl__cntdly_dout_l_6_,`TCU.sigmux_ctl__cntdly_dout_l_5_,
		  `TCU.sigmux_ctl__cntdly_dout_l_4_,`TCU.sigmux_ctl__cntdly_dout_l_3_,
		  `TCU.sigmux_ctl__cntdly_dout_l_2_,`TCU.sigmux_ctl__cntdly_dout_l_1_,
		  `TCU.sigmux_ctl__cntdly_dout_l_0_ } = 7'b1110000;
`else
   force `TCU.sigmux_ctl.cntdly_dout_l=7'b1110000;
`endif   // End of TCU_GATE


`ifndef AXIS_TL
`ifdef TCU_GATE

`ifdef SLAM_VECTORS
   force {`TCU.mbist_ctl__bisx_counter_31_,`TCU.mbist_ctl__bisx_counter_30_,`TCU.mbist_ctl__bisx_counter_29_,`TCU.mbist_ctl__bisx_counter_28_,`TCU.mbist_ctl__bisx_counter_27_,`TCU.mbist_ctl__bisx_counter_26_,`TCU.mbist_ctl__bisx_counter_25_,`TCU.mbist_ctl__bisx_counter_24_,`TCU.mbist_ctl__bisx_counter_23_,`TCU.mbist_ctl__bisx_counter_22_,`TCU.mbist_ctl__bisx_counter_21_,`TCU.mbist_ctl__bisx_counter_20_,`TCU.mbist_ctl__bisx_counter_19_,`TCU.mbist_ctl__bisx_counter_18_,`TCU.mbist_ctl__bisx_counter_17_,`TCU.mbist_ctl__bisx_counter_16_,`TCU.mbist_ctl__bisx_counter_15_,`TCU.mbist_ctl__bisx_counter_14_,`TCU.mbist_ctl__bisx_counter_13_,`TCU.mbist_ctl__bisx_counter_12_,`TCU.mbist_ctl__bisx_counter_11_,`TCU.mbist_ctl__bisx_counter_10_,`TCU.mbist_ctl__bisx_counter_9_,`TCU.mbist_ctl__bisx_counter_8_,`TCU.mbist_ctl__bisx_counter_7_,`TCU.mbist_ctl__bisx_counter_6_,`TCU.mbist_ctl__bisx_counter_5_,`TCU.mbist_ctl__bisx_counter_4_} = 28'hFFFFFFF;

   force {`TCU.mbist_ctl__csr_mbist_bypass_47_,`TCU.mbist_ctl__csr_mbist_bypass_46_,`TCU.mbist_ctl__csr_mbist_bypass_45_,`TCU.mbist_ctl__csr_mbist_bypass_44_,`TCU.mbist_ctl__csr_mbist_bypass_43_,`TCU.mbist_ctl__csr_mbist_bypass_42_,`TCU.mbist_ctl__csr_mbist_bypass_41_,`TCU.mbist_ctl__csr_mbist_bypass_40_,`TCU.mbist_ctl__csr_mbist_bypass_39_,`TCU.mbist_ctl__csr_mbist_bypass_38_,`TCU.mbist_ctl__csr_mbist_bypass_37_,`TCU.mbist_ctl__csr_mbist_bypass_36_,`TCU.mbist_ctl__csr_mbist_bypass_35_,`TCU.mbist_ctl__csr_mbist_bypass_34_,`TCU.mbist_ctl__csr_mbist_bypass_33_,`TCU.mbist_ctl__csr_mbist_bypass_32_,`TCU.mbist_ctl__csr_mbist_bypass_31_,`TCU.mbist_ctl__csr_mbist_bypass_30_,`TCU.mbist_ctl__csr_mbist_bypass_29_,`TCU.mbist_ctl__csr_mbist_bypass_28_,`TCU.mbist_ctl__csr_mbist_bypass_27_,`TCU.mbist_ctl__csr_mbist_bypass_26_,`TCU.mbist_ctl__csr_mbist_bypass_25_,`TCU.mbist_ctl__csr_mbist_bypass_24_,`TCU.mbist_ctl__csr_mbist_bypass_23_,`TCU.mbist_ctl__csr_mbist_bypass_22_,`TCU.mbist_ctl__csr_mbist_bypass_21_,`TCU.mbist_ctl__csr_mbist_bypass_20_,`TCU.mbist_ctl__csr_mbist_bypass_19_,`TCU.mbist_ctl__csr_mbist_bypass_18_,`TCU.mbist_ctl__csr_mbist_bypass_17_,`TCU.mbist_ctl__csr_mbist_bypass_16_,`TCU.mbist_ctl__csr_mbist_bypass_15_,`TCU.mbist_ctl__csr_mbist_bypass_14_,`TCU.mbist_ctl__csr_mbist_bypass_13_,`TCU.mbist_ctl__csr_mbist_bypass_12_,`TCU.mbist_ctl__csr_mbist_bypass_11_,`TCU.mbist_ctl__csr_mbist_bypass_10_,`TCU.mbist_ctl__csr_mbist_bypass_9_,`TCU.mbist_ctl__csr_mbist_bypass_8_,`TCU.mbist_ctl__csr_mbist_bypass_7_,`TCU.mbist_ctl__csr_mbist_bypass_6_,`TCU.mbist_ctl__csr_mbist_bypass_5_,`TCU.mbist_ctl__csr_mbist_bypass_4_,`TCU.mbist_ctl__csr_mbist_bypass_3_,`TCU.mbist_ctl__csr_mbist_bypass_2_,`TCU.mbist_ctl__csr_mbist_bypass_1_,`TCU.mbist_ctl__csr_mbist_bypass_0_} = 48'hFFFFFFFFFFFF;

   force `CPU.tcu_sck_bypass = 1'b1;
`else
   force {`TCU.mbist_ctl__bisx_counter_31_,`TCU.mbist_ctl__bisx_counter_30_,`TCU.mbist_ctl__bisx_counter_29_,`TCU.mbist_ctl__bisx_counter_28_,`TCU.mbist_ctl__bisx_counter_27_,`TCU.mbist_ctl__bisx_counter_26_,`TCU.mbist_ctl__bisx_counter_25_,`TCU.mbist_ctl__bisx_counter_24_,`TCU.mbist_ctl__bisx_counter_23_,`TCU.mbist_ctl__bisx_counter_22_,`TCU.mbist_ctl__bisx_counter_21_,`TCU.mbist_ctl__bisx_counter_20_,`TCU.mbist_ctl__bisx_counter_19_,`TCU.mbist_ctl__bisx_counter_18_,`TCU.mbist_ctl__bisx_counter_17_,`TCU.mbist_ctl__bisx_counter_16_,`TCU.mbist_ctl__bisx_counter_15_,`TCU.mbist_ctl__bisx_counter_14_,`TCU.mbist_ctl__bisx_counter_13_,`TCU.mbist_ctl__bisx_counter_12_,`TCU.mbist_ctl__bisx_counter_11_,`TCU.mbist_ctl__bisx_counter_10_,`TCU.mbist_ctl__bisx_counter_9_,`TCU.mbist_ctl__bisx_counter_8_,`TCU.mbist_ctl__bisx_counter_7_,`TCU.mbist_ctl__bisx_counter_6_,`TCU.mbist_ctl__bisx_counter_5_,`TCU.mbist_ctl__bisx_counter_4_} = 28'hFFFFFFF;

   force {`TCU.mbist_ctl__csr_mbist_bypass_47_,`TCU.mbist_ctl__csr_mbist_bypass_46_,`TCU.mbist_ctl__csr_mbist_bypass_45_,`TCU.mbist_ctl__csr_mbist_bypass_44_,`TCU.mbist_ctl__csr_mbist_bypass_43_,`TCU.mbist_ctl__csr_mbist_bypass_42_,`TCU.mbist_ctl__csr_mbist_bypass_41_,`TCU.mbist_ctl__csr_mbist_bypass_40_,`TCU.mbist_ctl__csr_mbist_bypass_39_,`TCU.mbist_ctl__csr_mbist_bypass_38_,`TCU.mbist_ctl__csr_mbist_bypass_37_,`TCU.mbist_ctl__csr_mbist_bypass_36_,`TCU.mbist_ctl__csr_mbist_bypass_35_,`TCU.mbist_ctl__csr_mbist_bypass_34_,`TCU.mbist_ctl__csr_mbist_bypass_33_,`TCU.mbist_ctl__csr_mbist_bypass_32_,`TCU.mbist_ctl__csr_mbist_bypass_31_,`TCU.mbist_ctl__csr_mbist_bypass_30_,`TCU.mbist_ctl__csr_mbist_bypass_29_,`TCU.mbist_ctl__csr_mbist_bypass_28_,`TCU.mbist_ctl__csr_mbist_bypass_27_,`TCU.mbist_ctl__csr_mbist_bypass_26_,`TCU.mbist_ctl__csr_mbist_bypass_25_,`TCU.mbist_ctl__csr_mbist_bypass_24_,`TCU.mbist_ctl__csr_mbist_bypass_23_,`TCU.mbist_ctl__csr_mbist_bypass_22_,`TCU.mbist_ctl__csr_mbist_bypass_21_,`TCU.mbist_ctl__csr_mbist_bypass_20_,`TCU.mbist_ctl__csr_mbist_bypass_19_,`TCU.mbist_ctl__csr_mbist_bypass_18_,`TCU.mbist_ctl__csr_mbist_bypass_17_,`TCU.mbist_ctl__csr_mbist_bypass_16_,`TCU.mbist_ctl__csr_mbist_bypass_15_,`TCU.mbist_ctl__csr_mbist_bypass_14_,`TCU.mbist_ctl__csr_mbist_bypass_13_,`TCU.mbist_ctl__csr_mbist_bypass_12_,`TCU.mbist_ctl__csr_mbist_bypass_11_,`TCU.mbist_ctl__csr_mbist_bypass_10_,`TCU.mbist_ctl__csr_mbist_bypass_9_,`TCU.mbist_ctl__csr_mbist_bypass_8_,`TCU.mbist_ctl__csr_mbist_bypass_7_,`TCU.mbist_ctl__csr_mbist_bypass_6_,`TCU.mbist_ctl__csr_mbist_bypass_5_,`TCU.mbist_ctl__csr_mbist_bypass_4_,`TCU.mbist_ctl__csr_mbist_bypass_3_,`TCU.mbist_ctl__csr_mbist_bypass_2_,`TCU.mbist_ctl__csr_mbist_bypass_1_,`TCU.mbist_ctl__csr_mbist_bypass_0_} = 48'hFFFFFFFFFFFF;

   wait({`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_17_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_16_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_15_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_14_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_13_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_12_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_11_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_10_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_9_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_8_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_7_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_6_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_5_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_4_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_3_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_2_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_1_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_0_} == 18'h0000f);
   @(negedge `NCU.iol2clk);
   force {`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_17_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_16_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_15_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_14_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_13_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_12_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_11_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_10_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_9_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_8_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_7_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_6_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_5_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_4_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_3_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_2_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_1_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_0_} = 18'h3ffef;
   @(negedge `NCU.iol2clk);
   release {`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_17_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_16_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_15_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_14_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_13_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_12_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_11_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_10_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_9_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_8_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_7_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_6_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_5_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_4_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_3_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_2_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_1_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_0_};

   wait({`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_17_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_16_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_15_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_14_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_13_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_12_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_11_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_10_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_9_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_8_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_7_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_6_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_5_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_4_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_3_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_2_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_1_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_0_} == 18'h0000f);
  @(negedge `NCU.iol2clk);
  force {`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_17_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_16_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_15_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_14_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_13_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_12_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_11_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_10_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_9_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_8_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_7_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_6_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_5_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_4_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_3_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_2_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_1_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_0_} = 18'h3ffef;
   @(negedge `NCU.iol2clk);
   release {`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_17_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_16_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_15_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_14_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_13_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_12_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_11_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_10_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_9_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_8_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_7_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_6_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_5_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_4_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_3_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_2_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_1_,`NCU.ncu_ssitop_ctl__ncu_ssisif_ctl_sck_cnt_0_};

//   force `CPU.tcu_sck_bypass = 1'b1;

`endif // SLAM_VECTORS

`else // TCU_GATE

`ifdef SLAM_VECTORS
   force `TCU.mbist_ctl.bisx_counter[31:4] = 28'hFFFFFFF;
   force `TCU.mbist_ctl.csr_mbist_bypass = 48'hFFFFFFFFFFFF;
   force `CPU.tcu_sck_bypass = 1'b1;
`else
   force `TCU.mbist_ctl.bisx_counter[31:4] = 28'hFFFFFFF;
   force `TCU.mbist_ctl.csr_mbist_bypass = 48'hFFFFFFFFFFFF;
   wait(`NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.sck_cnt == 18'h0000f);
   @(negedge `NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.iol2clk);
   force `NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.sck_cnt[17:0] = 18'h3ffef;
   @(negedge `NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.iol2clk);
   release `NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.sck_cnt[17:0];
   wait(`NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.sck_cnt == 18'h0000f);
   @(negedge `NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.iol2clk);
   force `NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.sck_cnt[17:0] = 18'h3ffef;
   @(negedge `NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.iol2clk);
   release `NCU.ncu_ssitop_ctl.ncu_ssisif_ctl.sck_cnt[17:0];
//   force `CPU.tcu_sck_bypass = 1'b1;
`endif // SLAM_VECTORS

`endif // TCU_GATE
`endif // AXIS_TL

end  // always @(

always @(posedge PWRON_RST_L) begin
	@(posedge `NCU.rst_ncu_unpark_thread);
	release `CPU.tcu_bisx_done;
`ifdef TCU_GATE

   release {`TCU.mbist_ctl__bisx_counter_31_,`TCU.mbist_ctl__bisx_counter_30_,`TCU.mbist_ctl__bisx_counter_29_,`TCU.mbist_ctl__bisx_counter_28_,`TCU.mbist_ctl__bisx_counter_27_,`TCU.mbist_ctl__bisx_counter_26_,`TCU.mbist_ctl__bisx_counter_25_,`TCU.mbist_ctl__bisx_counter_24_,`TCU.mbist_ctl__bisx_counter_23_,`TCU.mbist_ctl__bisx_counter_22_,`TCU.mbist_ctl__bisx_counter_21_,`TCU.mbist_ctl__bisx_counter_20_,`TCU.mbist_ctl__bisx_counter_19_,`TCU.mbist_ctl__bisx_counter_18_,`TCU.mbist_ctl__bisx_counter_17_,`TCU.mbist_ctl__bisx_counter_16_,`TCU.mbist_ctl__bisx_counter_15_,`TCU.mbist_ctl__bisx_counter_14_,`TCU.mbist_ctl__bisx_counter_13_,`TCU.mbist_ctl__bisx_counter_12_,`TCU.mbist_ctl__bisx_counter_11_,`TCU.mbist_ctl__bisx_counter_10_,`TCU.mbist_ctl__bisx_counter_9_,`TCU.mbist_ctl__bisx_counter_8_,`TCU.mbist_ctl__bisx_counter_7_,`TCU.mbist_ctl__bisx_counter_6_,`TCU.mbist_ctl__bisx_counter_5_,`TCU.mbist_ctl__bisx_counter_4_};

   release {`TCU.mbist_ctl__csr_mbist_bypass_47_,`TCU.mbist_ctl__csr_mbist_bypass_46_,`TCU.mbist_ctl__csr_mbist_bypass_45_,`TCU.mbist_ctl__csr_mbist_bypass_44_,`TCU.mbist_ctl__csr_mbist_bypass_43_,`TCU.mbist_ctl__csr_mbist_bypass_42_,`TCU.mbist_ctl__csr_mbist_bypass_41_,`TCU.mbist_ctl__csr_mbist_bypass_40_,`TCU.mbist_ctl__csr_mbist_bypass_39_,`TCU.mbist_ctl__csr_mbist_bypass_38_,`TCU.mbist_ctl__csr_mbist_bypass_37_,`TCU.mbist_ctl__csr_mbist_bypass_36_,`TCU.mbist_ctl__csr_mbist_bypass_35_,`TCU.mbist_ctl__csr_mbist_bypass_34_,`TCU.mbist_ctl__csr_mbist_bypass_33_,`TCU.mbist_ctl__csr_mbist_bypass_32_,`TCU.mbist_ctl__csr_mbist_bypass_31_,`TCU.mbist_ctl__csr_mbist_bypass_30_,`TCU.mbist_ctl__csr_mbist_bypass_29_,`TCU.mbist_ctl__csr_mbist_bypass_28_,`TCU.mbist_ctl__csr_mbist_bypass_27_,`TCU.mbist_ctl__csr_mbist_bypass_26_,`TCU.mbist_ctl__csr_mbist_bypass_25_,`TCU.mbist_ctl__csr_mbist_bypass_24_,`TCU.mbist_ctl__csr_mbist_bypass_23_,`TCU.mbist_ctl__csr_mbist_bypass_22_,`TCU.mbist_ctl__csr_mbist_bypass_21_,`TCU.mbist_ctl__csr_mbist_bypass_20_,`TCU.mbist_ctl__csr_mbist_bypass_19_,`TCU.mbist_ctl__csr_mbist_bypass_18_,`TCU.mbist_ctl__csr_mbist_bypass_17_,`TCU.mbist_ctl__csr_mbist_bypass_16_,`TCU.mbist_ctl__csr_mbist_bypass_15_,`TCU.mbist_ctl__csr_mbist_bypass_14_,`TCU.mbist_ctl__csr_mbist_bypass_13_,`TCU.mbist_ctl__csr_mbist_bypass_12_,`TCU.mbist_ctl__csr_mbist_bypass_11_,`TCU.mbist_ctl__csr_mbist_bypass_10_,`TCU.mbist_ctl__csr_mbist_bypass_9_,`TCU.mbist_ctl__csr_mbist_bypass_8_,`TCU.mbist_ctl__csr_mbist_bypass_7_,`TCU.mbist_ctl__csr_mbist_bypass_6_,`TCU.mbist_ctl__csr_mbist_bypass_5_,`TCU.mbist_ctl__csr_mbist_bypass_4_,`TCU.mbist_ctl__csr_mbist_bypass_3_,`TCU.mbist_ctl__csr_mbist_bypass_2_,`TCU.mbist_ctl__csr_mbist_bypass_1_,`TCU.mbist_ctl__csr_mbist_bypass_0_};

`else

	release `TCU.mbist_ctl.bisx_counter[31:4];
	release `TCU.mbist_ctl.csr_mbist_bypass;

`endif // TCU_GATE
end  // always @(posedge PWRON_RST_L)
`endif // ifndef FULL_RESET

`endif  //match to exclude the whole thing for AXIS_TL

   assign `CPU.PLL_CMP_CLK_P = SYSCLK;  // TCU SAT driving.  Need to change to MCU
   assign `CPU.PLL_CMP_CLK_N = SYSCLKN;         // 

//   Connect MDIO model to simulation environment and take out 1'b0 assignment.
//   01/06/06  pw
//   assign `CPU.mdc                 = 1'b0;  // top level pin connection not made

   // asi_power_throttle is controlled through a few +args.
   // Can be set or randomized or cycled. This will slow simulation if used!
   assign `CPU.PWR_THRTTL_0[2:0] = asi_power_throttle[2:0]; //3'b0;
   assign `CPU.PWR_THRTTL_1[2:0] = asi_power_throttle[5:3]; //3'b0;


   //----------------------------------------------------------
   // Bench Code Instantiation

   // +args and the vars they set.
   // use `PARGS.var to get value
   verif_args verif_args();
   // use -vcs_run_args=+RANDOM_REDUNDANCY_VALUES
   // to apply random redundancy values for repairable arrays
`ifdef AXIS
`include "axis_top.vh"
`else
`ifdef AXIS_FBDIMM_NO_FSR
`include "axis_top.vh"
`endif
`endif
`ifndef AXIS_TL
   force_random_redundancy_bits force_random_redundancy_bits();

`ifndef AXIS
`ifndef GATESIM
trig_event trig_event(.clk(`CPU.l2clk));
`endif // GATESIM
`endif // AXIS

   nas_top nas_top ();

`ifdef CORE_0 nas_probes0 intf0(); `endif
`ifdef CORE_1 nas_probes1 intf1(); `endif
`ifdef CORE_2 nas_probes2 intf2(); `endif
`ifdef CORE_3 nas_probes3 intf3(); `endif
`ifdef CORE_4 nas_probes4 intf4(); `endif
`ifdef CORE_5 nas_probes5 intf5(); `endif
`ifdef CORE_6 nas_probes6 intf6(); `endif
`ifdef CORE_7 nas_probes7 intf7(); `endif

   tlb_sync tlb_sync ();

   ldst_sync ldst_sync ();

   int_sync int_sync ();

   err_sync err_sync ();

   reg_slam  reg_slam ();

`ifndef FC_NO_NIU_T2
   monitors monitors ();
`endif
  
`ifndef GATESIM
`ifndef AXIS
   l2_scrub l2_scrub ();
`endif
`endif // GATESIM

   // spc debug checker
`ifndef GATESIM
`ifdef CORE_0 debug0 spc_debug0 (); `endif // 0
`ifdef CORE_1 debug1 spc_debug1 (); `endif // 1
`ifdef CORE_2 debug2 spc_debug2 (); `endif // 2
`ifdef CORE_3 debug3 spc_debug3 (); `endif // 3
`ifdef CORE_4 debug4 spc_debug4 (); `endif // 4
`ifdef CORE_5 debug5 spc_debug5 (); `endif // 5
`ifdef CORE_6 debug6 spc_debug6 (); `endif // 6
`ifdef CORE_7 debug7 spc_debug7 (); `endif // 7
`endif // GATESIM

`endif //  `ifndef AXIS_TL

   mcu_mem_config mcu_mem_config ();

//   assign (weak0, weak1) `CPU.DBG_DQ              = 166'b0;


// do not want!!!
//    assign (weak0, weak1) `CPU.ncu_cpx_req_cq = 8'b0;
//    assign (weak0, weak1) `CPU.ncu_cpx_data_ca = 146'b0;
//    assign (weak0, weak1) `CPU.ncu_pcx_stall_pq = 1'b0;

// missing core inputs to CCX. Should be done in cpu.sv but is not.
`ifndef CORE_0
  assign (weak0, weak1) `CPU.spc0_pcx_req_pq = 9'b0;
  assign (weak0, weak1) `CPU.spc0_pcx_data_pa = 130'b0;
  assign (weak0, weak1) `CPU.spc0_pcx_atm_pq = 9'b0;
`endif
`ifndef CORE_1
  assign (weak0, weak1) `CPU.spc1_pcx_req_pq = 9'b0;
  assign (weak0, weak1) `CPU.spc1_pcx_data_pa = 130'b0;
  assign (weak0, weak1) `CPU.spc1_pcx_atm_pq = 9'b0;
`endif
`ifndef CORE_2
  assign (weak0, weak1) `CPU.spc2_pcx_req_pq = 9'b0;
  assign (weak0, weak1) `CPU.spc2_pcx_data_pa = 130'b0;
  assign (weak0, weak1) `CPU.spc2_pcx_atm_pq = 9'b0;
`endif
`ifndef CORE_3
  assign (weak0, weak1) `CPU.spc3_pcx_req_pq = 9'b0;
  assign (weak0, weak1) `CPU.spc3_pcx_data_pa = 130'b0;
  assign (weak0, weak1) `CPU.spc3_pcx_atm_pq = 9'b0;
`endif
`ifndef CORE_4
  assign (weak0, weak1) `CPU.spc4_pcx_req_pq = 9'b0;
  assign (weak0, weak1) `CPU.spc4_pcx_data_pa = 130'b0;
  assign (weak0, weak1) `CPU.spc4_pcx_atm_pq = 9'b0;
`endif
`ifndef CORE_5
  assign (weak0, weak1) `CPU.spc5_pcx_req_pq = 9'b0;
  assign (weak0, weak1) `CPU.spc5_pcx_data_pa = 130'b0;
  assign (weak0, weak1) `CPU.spc5_pcx_atm_pq = 9'b0;
`endif
`ifndef CORE_6
  assign (weak0, weak1) `CPU.spc6_pcx_req_pq = 9'b0;
  assign (weak0, weak1) `CPU.spc6_pcx_data_pa = 130'b0;
  assign (weak0, weak1) `CPU.spc6_pcx_atm_pq = 9'b0;
`endif
`ifndef CORE_7
  assign (weak0, weak1) `CPU.spc7_pcx_req_pq = 9'b0;
  assign (weak0, weak1) `CPU.spc7_pcx_data_pa = 130'b0;
  assign (weak0, weak1) `CPU.spc7_pcx_atm_pq = 9'b0;
`endif




// PEU Stuff
`ifndef NO_VCS_CASCADE_IP_CODE
`ifndef FC_NO_PEU_T2
`include "fc_pcie_stuff.v"
`endif
`endif
`ifndef FC_NO_NIU_T2
   // ********************************************************************************
   // Ethernet controller functional model instantiation.
   // ********************************************************************************
   wire [3:0]   m0_rx_config;
   wire [7:0]   m0_rx_data;
   wire         m0_rx_dv;
   wire         m0_rx_err;
   wire         m0_tx_clk;
   wire [3:0]   m0_tx_config;
   wire [7:0]   m0_tx_data;
   wire         m0_tx_en;
   wire         m0_tx_err;
   wire         m1_rx_clk;
   wire [3:0]   m1_rx_config;
   wire [7:0]   m1_rx_data;
   wire         m1_rx_dv;
   wire         m1_rx_err;
   wire         m1_tx_clk;
   wire [3:0]   m1_tx_config;
   wire [7:0]   m1_tx_data;
   wire         m1_tx_en;
   wire         m1_tx_err;
   wire         m2_rx_clk;
   wire [3:0]   m2_rx_config;
   wire         m2_tx_clk;
   wire [3:0]   m2_tx_config;
   wire [7:0]   m2_tx_data;
   wire         m2_tx_en;
   wire         m2_tx_err;
   wire         m3_rx_clk;
   wire [3:0]   m3_rx_config;
   wire         m3_tx_clk;
   wire [3:0]   m3_tx_config;
   wire [7:0]   m3_tx_data;
   wire         m3_tx_en;
   wire         m3_tx_err;

   wire [7:0]   m2_rx_data;
   wire [7:0]   m3_rx_data;

`ifdef RESET_AXIS_ONLY
   wire [3:0] xaui0_tx_n =4'h0;
   wire [3:0] xaui0_tx_p =4'h0;
   wire [3:0] xaui0_rx_n =4'h1;
   wire [3:0] xaui0_rx_p =4'h1;

   wire [3:0] xaui1_tx_n =4'h0;
   wire [3:0] xaui1_tx_p =4'h0;
   wire [3:0] xaui1_rx_n = 4'h1;
   wire [3:0] xaui1_rx_p = 4'h1;
`else
   wire [3:0] xaui0_tx_n;
   wire [3:0] xaui0_tx_p;
   wire [3:0] xaui0_rx_n;
   wire [3:0] xaui0_rx_p;

   wire [3:0] xaui1_tx_n;
   wire [3:0] xaui1_tx_p;
   wire [3:0] xaui1_rx_n;
   wire [3:0] xaui1_rx_p;
`endif
`endif //`ifdef FC_NO_NIU_T2

/////////Playback Driver/////////////

`ifdef REPEAT_PB

`include "playback_driver.v"

wire          dmu_ncu_vld_pb;
wire[31:0]    dmu_ncu_data_pb;
wire          dmu_ncu_wrack_vld_pb;
wire[3:0]             dmu_ncu_wrack_tag_pb;
wire          dmu_ncu_stall_pb;
wire          dmu_sii_hdr_vld_pb;
wire          dmu_sii_reqbypass_pb;
wire          dmu_sii_datareq_pb;
wire          dmu_sii_datareq16_pb;
wire[15:0]    dmu_sii_be_pb;
wire[127:0]   dmu_sii_data_pb;
wire          niu_ncu_vld_pb;
wire[31:0]    niu_ncu_data_pb;
wire          niu_ncu_stall_pb;
wire          niu_sii_hdr_vld_pb;
wire          niu_sii_datareq_pb;
wire          niu_sii_reqbypass_pb;
wire[127:0]   niu_sii_data_pb;
wire          niu_sio_dq_pb;
 playback_driver pb (
        .niu_ncu_vld_pb(niu_ncu_vld_pb),
        .niu_ncu_data_pb(niu_ncu_data_pb[31:0]),
        .niu_ncu_stall_pb(niu_ncu_stall_pb),
        .niu_sii_hdr_vld_pb(niu_sii_hdr_vld_pb),
        .niu_sii_datareq_pb(niu_sii_datareq_pb),
        .niu_sii_reqbypass_pb(niu_sii_reqbypass_pb),
        .niu_sii_data_pb(niu_sii_data_pb[127:0]),
        .niu_sio_dq_pb(niu_sio_dq_pb),
        .dmu_ncu_vld_pb(dmu_ncu_vld_pb),
        .dmu_ncu_data_pb(dmu_ncu_data_pb[31:0]),
        .dmu_ncu_wrack_vld_pb(dmu_ncu_wrack_vld_pb),
        .dmu_ncu_wrack_tag_pb(dmu_ncu_wrack_tag_pb[3:0]),
        .dmu_ncu_stall_pb(dmu_ncu_stall_pb),
        .dmu_sii_hdr_vld_pb(dmu_sii_hdr_vld_pb),
        .dmu_sii_reqbypass_pb(dmu_sii_reqbypass_pb),
        .dmu_sii_datareq_pb(dmu_sii_datareq_pb),
        .dmu_sii_datareq16_pb(dmu_sii_datareq16_pb),
        .dmu_sii_be_pb(dmu_sii_be_pb[15:0]),
        .dmu_sii_data_pb(dmu_sii_data_pb[127:0]),
        .clk_pb(iol2clk),
        .l2clk_pb(core_clk),
        .io2xclk_pb(iol2clk_2x));
`endif //REPEAT_PB

`ifndef AXIS_TL

n2_int n2_int ( );
n2_int_latency n2_int_latency (
	.clk (core_clk),
	.rst_l (PWRON_RST_L)
	);

`ifndef FC_NO_NIU_T2
   enet_models enet_model (
			   .BSINITCLK      (BSINITCLK),          // input  (enet_model) <= ()
			   .REFCLKN        (refclk_enet_n),           // input  (enet_model) <= ()
			   .REFCLKP        (refclk_enet),            // input  (enet_model) <= ()
			   .core_clk       (core_clk),           // input  (enet_model) <= ()
			   .m0_rx_config   (m0_rx_config[3:0]),  // input  (enet_model) <= ()
			   .m0_rx_data     (m0_rx_data[7:0]),    // input  (enet_model) <= ()
			   .m0_rx_dv       (m0_rx_dv),           // input  (enet_model) <= ()
			   .m0_rx_err      (m0_rx_err),          // input  (enet_model) <= ()
			   .m0_tx_config   (m0_tx_config[3:0]),  // input  (enet_model) <= ()
			   .m1_rx_config   (m1_rx_config[3:0]),  // input  (enet_model) <= ()
			   .m1_rx_data     (m1_rx_data[7:0]),    // input  (enet_model) <= ()
			   .m1_rx_dv       (m1_rx_dv),           // input  (enet_model) <= ()
			   .m1_rx_err      (m1_rx_err),          // input  (enet_model) <= ()
			   .m1_tx_config   (m1_tx_config[3:0]),  // input  (enet_model) <= ()
			   .m2_rx_config   (m2_rx_config[3:0]),  // input  (enet_model) <= ()
			   .m2_tx_config   (m2_tx_config[3:0]),  // input  (enet_model) <= ()
			   .m3_rx_config   (m3_rx_config[3:0]),  // input  (enet_model) <= ()
			   .m3_tx_config   (m3_tx_config[3:0]),  // input  (enet_model) <= ()
			   .AMUX_p0        (AMUX_p0),            // output (enet_model) => ()
			   .AMUX_p1        (AMUX_p1),            // output (enet_model) => ()
			   .STCIQ_p0       (STCIQ_p0),           // output (enet_model) => ()
			   .STCIQ_p1       (STCIQ_p1),           // output (enet_model) => ()
			   .TXN0_p0        (xaui0_rx_n[0]), // output (enet_model) => (enet_model)
			   .TXN0_p1        (xaui1_rx_n[0]), // output (enet_model) => (enet_model)
			   .TXN1_p0        (xaui0_rx_n[1]), // output (enet_model) => (enet_model)
			   .TXN1_p1        (xaui1_rx_n[1]), // output (enet_model) => (enet_model)
			   .TXN2_p0        (xaui0_rx_n[2]), // output (enet_model) => (enet_model)
			   .TXN2_p1        (xaui1_rx_n[2]), // output (enet_model) => (enet_model)
			   .TXN3_p0        (xaui0_rx_n[3]), // output (enet_model) => (enet_model)
			   .TXN3_p1        (xaui1_rx_n[3]), // output (enet_model) => (enet_model)
			   .TXP0_p0        (xaui0_rx_p[0]), // output (enet_model) => (enet_model)
			   .TXP0_p1        (xaui1_rx_p[0]), // output (enet_model) => (enet_model)
			   .TXP1_p0        (xaui0_rx_p[1]), // output (enet_model) => (enet_model)
			   .TXP1_p1        (xaui1_rx_p[1]), // output (enet_model) => (enet_model)
			   .TXP2_p0        (xaui0_rx_p[2]), // output (enet_model) => (enet_model)
			   .TXP2_p1        (xaui1_rx_p[2]), // output (enet_model) => (enet_model)
			   .TXP3_p0        (xaui0_rx_p[3]), // output (enet_model) => (enet_model)
			   .TXP3_p1        (xaui1_rx_p[3]), // output (enet_model) => (enet_model)
			   .m0_rx_col      (m0_rx_col),          // output (enet_model) => ()
			   .m0_rx_crs      (m0_rx_crs),          // output (enet_model) => ()
			   .m0_tx_clk_port (m0_tx_clk_port),     // output (enet_model) => ()
			   .m1_rx_col      (m1_rx_col),          // output (enet_model) => ()
			   .m1_rx_crs      (m1_rx_crs),          // output (enet_model) => ()
			   .m1_tx_clk_port (m1_tx_clk_port),     // output (enet_model) => ()
			   .m2_tx_clk_port (m2_tx_clk_port),     // output (enet_model) => ()
			   .m3_tx_clk_port (m3_tx_clk_port),     // output (enet_model) => ()
			   .rx_clk_xgmii   (rx_clk_xgmii),       // output (enet_model) => ()
			   .ref_clk        (refclk_enet),            // input  (enet_model) <= ()
			   .reset          (niu_reset),       // input  (enet_model) <= ()
			   .RGMII_TXCLK0   (RGMII_TXCLK0),       // input  (enet_model) <= ()
			   .RGMII_TXCLK1   (RGMII_TXCLK1),       // input  (enet_model) <= ()
			   .RGMII_TXCLK2   (RGMII_TXCLK2),       // input  (enet_model) <= ()
			   .RGMII_TXCLK3   (RGMII_TXCLK3),       // input  (enet_model) <= ()
			   .RXN0_p0        (xaui0_tx_n[0]), // input  (enet_model) <= (enet_model)
			   .RXN1_p0        (xaui0_tx_n[1]), // input  (enet_model) <= (enet_model)
			   .RXN2_p0        (xaui0_tx_n[2]), // input  (enet_model) <= (enet_model)
			   .RXN3_p0        (xaui0_tx_n[3]), // input  (enet_model) <= (enet_model)
			   .RXP0_p0        (xaui0_tx_p[0]), // input  (enet_model) <= (enet_model)
			   .RXP1_p0        (xaui0_tx_p[1]), // input  (enet_model) <= (enet_model)
			   .RXP2_p0        (xaui0_tx_p[2]), // input  (enet_model) <= (enet_model)
			   .RXP3_p0        (xaui0_tx_p[3]), // input  (enet_model) <= (enet_model)
			   .RXN0_p1        (xaui1_tx_n[0]), // input  (enet_model) <= (enet_model)
			   .RXN1_p1        (xaui1_tx_n[1]), // input  (enet_model) <= (enet_model)
			   .RXN2_p1        (xaui1_tx_n[2]), // input  (enet_model) <= (enet_model)
			   .RXN3_p1        (xaui1_tx_n[3]), // input  (enet_model) <= (enet_model)
			   .RXP0_p1        (xaui1_tx_p[0]), // input  (enet_model) <= (enet_model)
			   .RXP1_p1        (xaui1_tx_p[1]), // input  (enet_model) <= (enet_model)
			   .RXP2_p1        (xaui1_tx_p[2]), // input  (enet_model) <= (enet_model)
			   .RXP3_p1        (xaui1_tx_p[3]), // input  (enet_model) <= (enet_model)
			   .m0_rx_clk      (m0_rx_clk),          // output (enet_model) => ()
			   .m0_tx_clk      (m0_tx_clk),          // output (enet_model) => ()
			   .m0_tx_data     (m0_tx_data[7:0]),    // output (enet_model) => ()
			   .m0_tx_en       (m0_tx_en),           // output (enet_model) => ()
			   .m0_tx_err      (m0_tx_err),          // output (enet_model) => ()
			   .m1_rx_clk      (m1_rx_clk),          // output (enet_model) => ()
			   .m1_tx_clk      (m1_tx_clk),          // output (enet_model) => ()
			   .m1_tx_data     (m1_tx_data[7:0]),    // output (enet_model) => ()
			   .m1_tx_en       (m1_tx_en),           // output (enet_model) => ()
			   .m1_tx_err      (m1_tx_err),          // output (enet_model) => ()
			   .m2_rx_clk      (m2_rx_clk),          // output (enet_model) => ()
			   .m2_tx_clk      (m2_tx_clk),          // output (enet_model) => ()
			   .m2_tx_data     (m2_tx_data[7:0]),    // output (enet_model) => ()
			   .m2_tx_en       (m2_tx_en),           // output (enet_model) => ()
			   .m2_tx_err      (m2_tx_err),          // output (enet_model) => ()
			   .m3_rx_clk      (m3_rx_clk),          // output (enet_model) => ()
			   .m3_tx_clk      (m3_tx_clk),          // output (enet_model) => ()
			   .m3_tx_data     (m3_tx_data[7:0]),    // output (enet_model) => ()
			   .m3_tx_en       (m3_tx_en),           // output (enet_model) => ()
			   .m3_tx_err      (m3_tx_err)           // output (enet_model) => ()
			   );
`endif

`endif //  `ifndef AXIS_TL

`ifdef FC_CRC_INJECT
		wire [9:0]              fbd0a_tx_p_top;
		wire [9:0]              fbd0a_tx_n_top;
		wire [13:0]             fbd0a_rx_p_top;
		wire [13:0]         fbd0a_rx_n_top;

		wire [9:0]              fbd0b_tx_p_top;
		wire [9:0]              fbd0b_tx_n_top;
		wire [13:0]             fbd0b_rx_p_top;
		wire [13:0]         fbd0b_rx_n_top;

		wire [9:0]              fbd1a_tx_p_top;
		wire [9:0]              fbd1a_tx_n_top;
		wire [13:0]             fbd1a_rx_p_top;
		wire [13:0]         fbd1a_rx_n_top;

		wire [9:0]              fbd1b_tx_p_top;
		wire [9:0]              fbd1b_tx_n_top;
		wire [13:0]             fbd1b_rx_p_top;
		wire [13:0]         fbd1b_rx_n_top;

		wire [9:0]              fbd2a_tx_p_top;
		wire [9:0]              fbd2a_tx_n_top;
		wire [13:0]             fbd2a_rx_p_top;
		wire [13:0]         fbd2a_rx_n_top;

		wire [9:0]              fbd2b_tx_p_top;
		wire [9:0]              fbd2b_tx_n_top;
		wire [13:0]             fbd2b_rx_p_top;
		wire [13:0]         fbd2b_rx_n_top;

		wire [9:0]              fbd3a_tx_p_top;
		wire [9:0]              fbd3a_tx_n_top;
		wire [13:0]             fbd3a_rx_p_top;
		wire [13:0]         fbd3a_rx_n_top;

		wire [9:0]              fbd3b_tx_p_top;
		wire [9:0]              fbd3b_tx_n_top;
		wire [13:0]             fbd3b_rx_p_top;
		wire [13:0]         fbd3b_rx_n_top;
`endif //  `ifdef FC_CRC_INJECT

`ifdef NB_BITLANE_DESKEW
		wire [13:0]             fbd0a_rx_p_top;
		wire [13:0]         fbd0a_rx_n_top;

		wire [13:0]             fbd0b_rx_p_top;
		wire [13:0]         fbd0b_rx_n_top;

		wire [13:0]             fbd1a_rx_p_top;
		wire [13:0]         fbd1a_rx_n_top;

		wire [13:0]             fbd1b_rx_p_top;
		wire [13:0]         fbd1b_rx_n_top;

		wire [13:0]             fbd2a_rx_p_top;
		wire [13:0]         fbd2a_rx_n_top;

		wire [13:0]             fbd2b_rx_p_top;
		wire [13:0]         fbd2b_rx_n_top;

		wire [13:0]             fbd3a_rx_p_top;
		wire [13:0]         fbd3a_rx_n_top;

		wire [13:0]             fbd3b_rx_p_top;
		wire [13:0]         fbd3b_rx_n_top;
`endif //  `ifdef NB_BITLANE_DESKEW

`ifdef DTM_ENABLED     // Used by both SLAM and Non-Slam DTM modes
   reg [23:0] 			    fbdimm0a_rx_p_top_d2;
   reg [23:0] 			    fbdimm0a_rx_n_top_d2;
   reg [23:0] 			    fbdimm0b_rx_p_top_d2;
   reg [23:0] 			    fbdimm0b_rx_n_top_d2;
   reg [23:0] 			    fbdimm1a_rx_p_top_d2;
   reg [23:0] 			    fbdimm1a_rx_n_top_d2;
   reg [23:0] 			    fbdimm1b_rx_p_top_d2;
   reg [23:0] 			    fbdimm1b_rx_n_top_d2;
   reg [23:0] 			    fbdimm2a_rx_p_top_d2;
   reg [23:0] 			    fbdimm2a_rx_n_top_d2;
   reg [23:0] 			    fbdimm2b_rx_p_top_d2;
   reg [23:0] 			    fbdimm2b_rx_n_top_d2;
   reg [23:0] 			    fbdimm3a_rx_p_top_d2;
   reg [23:0] 			    fbdimm3a_rx_n_top_d2;
   reg [23:0] 			    fbdimm3b_rx_p_top_d2;
   reg [23:0] 			    fbdimm3b_rx_n_top_d2;

   always @(posedge `FBD_CH_PATH0.fbdimm0.link_clk) begin
      fbdimm0a_rx_p_top_d2[23:0] <= {fbdimm0a_rx_p_top[0],fbdimm0a_rx_p_top_d2[23:1]};
      fbdimm0a_rx_n_top_d2[23:0] <= {fbdimm0a_rx_n_top[0],fbdimm0a_rx_n_top_d2[23:1]};
   end
   always @(posedge `FBD_CH_PATH1.fbdimm0.link_clk) begin
      fbdimm0b_rx_p_top_d2[23:0] <= {fbdimm0b_rx_p_top[0],fbdimm0b_rx_p_top_d2[23:1]};
      fbdimm0b_rx_n_top_d2[23:0] <= {fbdimm0b_rx_n_top[0],fbdimm0b_rx_n_top_d2[23:1]};
   end
   always @(posedge `FBD_CH_PATH2.fbdimm0.link_clk) begin
      fbdimm1a_rx_p_top_d2[23:0] <= {fbdimm1a_rx_p_top[0],fbdimm1a_rx_p_top_d2[23:1]};
      fbdimm1a_rx_n_top_d2[23:0] <= {fbdimm1a_rx_n_top[0],fbdimm1a_rx_n_top_d2[23:1]};
   end
   always @(posedge `FBD_CH_PATH3.fbdimm0.link_clk) begin
      fbdimm1b_rx_p_top_d2[23:0] <= {fbdimm1b_rx_p_top[0],fbdimm1b_rx_p_top_d2[23:1]};
      fbdimm1b_rx_n_top_d2[23:0] <= {fbdimm1b_rx_n_top[0],fbdimm1b_rx_n_top_d2[23:1]};
   end
   always @(posedge `FBD_CH_PATH4.fbdimm0.link_clk) begin
      fbdimm2a_rx_p_top_d2[23:0] <= {fbdimm2a_rx_p_top[0],fbdimm2a_rx_p_top_d2[23:1]};
      fbdimm2a_rx_n_top_d2[23:0] <= {fbdimm2a_rx_n_top[0],fbdimm2a_rx_n_top_d2[23:1]};
   end
   always @(posedge `FBD_CH_PATH5.fbdimm0.link_clk) begin
      fbdimm2b_rx_p_top_d2[23:0] <= {fbdimm2b_rx_p_top[0],fbdimm2b_rx_p_top_d2[23:1]};
      fbdimm2b_rx_n_top_d2[23:0] <= {fbdimm2b_rx_n_top[0],fbdimm2b_rx_n_top_d2[23:1]};
   end
   always @(posedge `FBD_CH_PATH6.fbdimm0.link_clk) begin
      fbdimm3a_rx_p_top_d2[23:0] <= {fbdimm3a_rx_p_top[0],fbdimm3a_rx_p_top_d2[23:1]};
      fbdimm3a_rx_n_top_d2[23:0] <= {fbdimm3a_rx_n_top[0],fbdimm3a_rx_n_top_d2[23:1]};
   end
   always @(posedge `FBD_CH_PATH7.fbdimm0.link_clk) begin
      fbdimm3b_rx_p_top_d2[23:0] <= {fbdimm3b_rx_p_top[0],fbdimm3b_rx_p_top_d2[23:1]};
      fbdimm3b_rx_n_top_d2[23:0] <= {fbdimm3b_rx_n_top[0],fbdimm3b_rx_n_top_d2[23:1]};
   end // always @ (posedge `FBD_CH_PATH7.fbdimm0.link_clk)
`endif // DTM_ENABLED

`ifdef RESET_AXIS_ONLY
`ifndef FC_NO_PEU_T2
  wire PCIE_Ref_Clock = PLL_CMP_CLK_P;
  wire [7:0] RX_P = 7'hf;
  wire [7:0] RX_N = 7'hf;
  wire [7:0] TX_P = 7'hf;
  wire [7:0] TX_N = 7'hf;
`endif
  wire TESTMODE  = 1'b0;
  assign PLL_TESTMODE = 1'b0;
  assign VDD_PLL_CMP_REG = 1'b0;
  wire VDD_RNG_HV = 1'b0;
  wire VDD = 1'b1;
  wire VPP = 1'b0;
  assign VREG_SELBG_L = 1'b1;
  wire VDDO_PCM = 1'b1;
  wire VDD_SENSE = 1'b1;
  wire VSS_SENSE = 1'b0;
  
`endif


   cpu cpu (
`ifdef DTM_ENABLED // Used by both Slam and Non-Slam DTM modes
	    .FBDIMM0A_TX_P (fbdimm0a_tx_p_top[9:0]),
	    .FBDIMM0A_TX_N (fbdimm0a_tx_n_top[9:0]),
	    .FBDIMM0A_RX_P ({fbdimm0a_rx_p_top[13:1],fbdimm0a_rx_p_top_d2[0]}),
	    .FBDIMM0A_RX_N ({fbdimm0a_rx_n_top[13:1],fbdimm0a_rx_n_top_d2[0]}),
	    .FBDIMM0B_TX_P (fbdimm0b_tx_p_top[9:0]),
	    .FBDIMM0B_TX_N (fbdimm0b_tx_n_top[9:0]),
	    .FBDIMM0B_RX_P ({fbdimm0b_rx_p_top[13:1],fbdimm0b_rx_p_top_d2[0]}),
	    .FBDIMM0B_RX_N ({fbdimm0b_rx_n_top[13:1],fbdimm0b_rx_n_top_d2[0]}),
	    .FBDIMM1A_TX_P (fbdimm1a_tx_p_top[9:0]),
	    .FBDIMM1A_TX_N (fbdimm1a_tx_n_top[9:0]),
	    .FBDIMM1A_RX_P ({fbdimm1a_rx_p_top[13:1],fbdimm1a_rx_p_top_d2[0]}),
	    .FBDIMM1A_RX_N ({fbdimm1a_rx_n_top[13:1],fbdimm1a_rx_n_top_d2[0]}),
	    .FBDIMM1B_TX_P (fbdimm1b_tx_p_top[9:0]),
	    .FBDIMM1B_TX_N (fbdimm1b_tx_n_top[9:0]),
	    .FBDIMM1B_RX_P ({fbdimm1b_rx_p_top[13:1],fbdimm1b_rx_p_top_d2[0]}),
	    .FBDIMM1B_RX_N ({fbdimm1b_rx_n_top[13:1],fbdimm1b_rx_n_top_d2[0]}),
	    .FBDIMM2A_TX_P (fbdimm2a_tx_p_top[9:0]),
	    .FBDIMM2A_TX_N (fbdimm2a_tx_n_top[9:0]),
	    .FBDIMM2A_RX_P ({fbdimm2a_rx_p_top[13:1],fbdimm2a_rx_p_top_d2[0]}),
	    .FBDIMM2A_RX_N ({fbdimm2a_rx_n_top[13:1],fbdimm2a_rx_n_top_d2[0]}),
	    .FBDIMM2B_TX_P (fbdimm2b_tx_p_top[9:0]),
	    .FBDIMM2B_TX_N (fbdimm2b_tx_n_top[9:0]),
	    .FBDIMM2B_RX_P ({fbdimm2b_rx_p_top[13:1],fbdimm2b_rx_p_top_d2[0]}),
	    .FBDIMM2B_RX_N ({fbdimm2b_rx_n_top[13:1],fbdimm2b_rx_n_top_d2[0]}),
	    .FBDIMM3A_TX_P (fbdimm3a_tx_p_top[9:0]),
	    .FBDIMM3A_TX_N (fbdimm3a_tx_n_top[9:0]),
	    .FBDIMM3A_RX_P ({fbdimm3a_rx_p_top[13:1],fbdimm3a_rx_p_top_d2[0]}),
	    .FBDIMM3A_RX_N ({fbdimm3a_rx_n_top[13:1],fbdimm3a_rx_n_top_d2[0]}),
	    .FBDIMM3B_TX_P (fbdimm3b_tx_p_top[9:0]),
	    .FBDIMM3B_TX_N (fbdimm3b_tx_n_top[9:0]),
	    .FBDIMM3B_RX_P ({fbdimm3b_rx_p_top[13:1],fbdimm3b_rx_p_top_d2[0]}),
	    .FBDIMM3B_RX_N ({fbdimm3b_rx_n_top[13:1],fbdimm3b_rx_n_top_d2[0]}),
`else
            .FBDIMM0A_TX_P (fbdimm0a_tx_p_top[9:0]),
            .FBDIMM0A_TX_N (fbdimm0a_tx_n_top[9:0]),
            .FBDIMM0A_RX_P (fbdimm0a_rx_p_top[13:0]),
            .FBDIMM0A_RX_N (fbdimm0a_rx_n_top[13:0]),
            .FBDIMM0B_TX_P (fbdimm0b_tx_p_top[9:0]),
            .FBDIMM0B_TX_N (fbdimm0b_tx_n_top[9:0]),
            .FBDIMM0B_RX_P (fbdimm0b_rx_p_top[13:0]),
            .FBDIMM0B_RX_N (fbdimm0b_rx_n_top[13:0]),
            .FBDIMM1A_TX_P (fbdimm1a_tx_p_top[9:0]),
            .FBDIMM1A_TX_N (fbdimm1a_tx_n_top[9:0]),
            .FBDIMM1A_RX_P (fbdimm1a_rx_p_top[13:0]),
            .FBDIMM1A_RX_N (fbdimm1a_rx_n_top[13:0]),
            .FBDIMM1B_TX_P (fbdimm1b_tx_p_top[9:0]),
            .FBDIMM1B_TX_N (fbdimm1b_tx_n_top[9:0]),
            .FBDIMM1B_RX_P (fbdimm1b_rx_p_top[13:0]),
            .FBDIMM1B_RX_N (fbdimm1b_rx_n_top[13:0]),
            .FBDIMM2A_TX_P (fbdimm2a_tx_p_top[9:0]),
            .FBDIMM2A_TX_N (fbdimm2a_tx_n_top[9:0]),
            .FBDIMM2A_RX_P (fbdimm2a_rx_p_top[13:0]),
            .FBDIMM2A_RX_N (fbdimm2a_rx_n_top[13:0]),
            .FBDIMM2B_TX_P (fbdimm2b_tx_p_top[9:0]),
            .FBDIMM2B_TX_N (fbdimm2b_tx_n_top[9:0]),
            .FBDIMM2B_RX_P (fbdimm2b_rx_p_top[13:0]),
            .FBDIMM2B_RX_N (fbdimm2b_rx_n_top[13:0]),
            .FBDIMM3A_TX_P (fbdimm3a_tx_p_top[9:0]),
            .FBDIMM3A_TX_N (fbdimm3a_tx_n_top[9:0]),
            .FBDIMM3A_RX_P (fbdimm3a_rx_p_top[13:0]),
            .FBDIMM3A_RX_N (fbdimm3a_rx_n_top[13:0]),
            .FBDIMM3B_TX_P (fbdimm3b_tx_p_top[9:0]),
            .FBDIMM3B_TX_N (fbdimm3b_tx_n_top[9:0]),
            .FBDIMM3B_RX_P (fbdimm3b_rx_p_top[13:0]),
            .FBDIMM3B_RX_N (fbdimm3b_rx_n_top[13:0]),
`endif	    // DTM_ENABLED
    `ifdef RESET_AXIS_ONLY
            .FBDIMM1_REFCLK_P( PLL_CMP_CLK_P),
            .FBDIMM1_REFCLK_N(~ PLL_CMP_CLK_N),
            .FBDIMM2_REFCLK_P( PLL_CMP_CLK_P),
            .FBDIMM2_REFCLK_N(~ PLL_CMP_CLK_N),
            .FBDIMM3_REFCLK_P( PLL_CMP_CLK_P),
            .FBDIMM3_REFCLK_N(~ PLL_CMP_CLK_N),
     `else
	    .FBDIMM1_REFCLK_P(dram_6x_clk),
	    .FBDIMM1_REFCLK_N(~dram_6x_clk),
	    .FBDIMM2_REFCLK_P(dram_6x_clk),
	    .FBDIMM2_REFCLK_N(~dram_6x_clk),
	    .FBDIMM3_REFCLK_P(dram_6x_clk),
	    .FBDIMM3_REFCLK_N(~dram_6x_clk),
    `endif // RESET_AXIS_ONLY

	    .FBDIMM0A_AMUX(FBDIMM0A_AMUX), //[2:0] output Analog voltage monitoring

	    .FBDIMM0B_AMUX(FBDIMM0A_AMUX), //[2:0] output Analog voltage monitoring

	    .FBDIMM1A_AMUX(FBDIMM1A_AMUX), //[2:0] output Analog voltage monitoring

	    .FBDIMM1B_AMUX(FBDIMM1B_AMUX), //[2:0] output Analog voltage monitoring

	    .FBDIMM2A_AMUX(FBDIMM2A_AMUX), //[2:0] output Analog voltage monitoring

	    .FBDIMM2B_AMUX(FBDIMM2B_AMUX), //[2:0] output Analog voltage monitoring

	    .FBDIMM3A_AMUX(FBDIMM3A_AMUX), //[2:0] output Analog voltage monitoring

	    .FBDIMM3B_AMUX(FBDIMM3B_AMUX), //[2:0] output Analog voltage monitoring

//---------------------------------------
// FBDIMM supply nets
//---------------------------------------
	   .VDDA_FSRR(VDD),
	   .VDDD_FSRR(VDD),
	   .VDDR_FSRR(VDD),
	   .VDDT_FSRR(VDD),
	   .VSSA_FSRR(VSS),

	   .VDDA_FSRL(VDD),
	   .VDDD_FSRL(VDD),
	   .VDDR_FSRL(VDD),
	   .VDDT_FSRL(VDD),
	   .VSSA_FSRL(VSS),

	   .VDDA_FSRB(VDD),
	   .VDDD_FSRB(VDD),
	   .VDDR_FSRB(VDD),
	   .VDDT_FSRB(VDD),
	   .VSSA_FSRB(VSS),



`ifndef FC_NO_PEU_T2
`ifndef NO_VCS_CASCADE_IP_CODE
	    //-----------------
	    // PCI-e IO
	    //-----------------

	    .PEX_REFCLK_P              ( PCIE_Ref_Clock ),
	    .PEX_REFCLK_N              ( ~PCIE_Ref_Clock ),

	    .PEX_RX_P                  ( RX_P[7:0] ),
	    .PEX_RX_N                  ( RX_N[7:0] ),
	    .PEX_TX_P                  ( TX_P[7:0] ),
	    .PEX_TX_N                  ( TX_N[7:0] ),
	    .PEX_RESET_L               ( PEX_RESET_L ),
	    .PEX_AMUX                  (PEX_AMUX), //[1:0] analog monitoring signals outputs
`endif //  `ifndef NO_VCS_CASCADE_IP_CODE

`ifdef RESET_AXIS_ONLY
            //-----------------
            // PCI-e IO
            //-----------------

            .PEX_REFCLK_P              ( PCIE_Ref_Clock ),
            .PEX_REFCLK_N              ( ~PCIE_Ref_Clock ),

            .PEX_RX_P                  ( RX_P[7:0] ),
            .PEX_RX_N                  ( RX_N[7:0] ),
            .PEX_TX_P                  ( TX_P[7:0] ),
            .PEX_TX_N                  ( TX_N[7:0] ),
            .PEX_RESET_L               ( PEX_RESET_L ),
            .PEX_AMUX                  (PEX_AMUX), //[1:0] analog monitoring signals outputs
`endif
`endif

`ifndef FC_NO_NIU_T2
	    //-----------------
	    // Ethernet IO
	    //-----------------
	    .XAUI0_REFCLK_N(refclk_enet_n),
	    .XAUI0_REFCLK_P(refclk_enet),


	    .XAUI0_TX_N(xaui0_tx_n[3:0]),      //   PAD
	    .XAUI0_TX_P(xaui0_tx_p[3:0]),      //   PAD
	    .XAUI0_RX_N(xaui0_rx_n[3:0]),      //   PAD
	    .XAUI0_RX_P(xaui0_rx_p[3:0]),      //   PAD


	    .XAUI1_TX_N(xaui1_tx_n[3:0]),      //   PAD
	    .XAUI1_TX_P(xaui1_tx_p[3:0]),      //   PAD
	    .XAUI1_RX_N(xaui1_rx_n[3:0]),      //   PAD
	    .XAUI1_RX_P(xaui1_rx_p[3:0]),      //   PAD

	    .XAUI0_AMUX(XAUI0_AMUX),
	    .XAUI1_AMUX(XAUI1_AMUX),
	    .XAUI0_LINK_LED(XAUI0_LINK_LED),  // PAD
	    .XAUI1_LINK_LED(XAUI1_LINK_LED),  // PAD
	    .XAUI0_ACT_LED(XAUI0_ACT_LED),   // PAD
	    .XAUI1_ACT_LED(XAUI1_ACT_LED),   // PAD
	    .XAUI_MDC(XAUI_MDC),        // PAD
	    .XAUI_MDIO(XAUI_MDIO),       // PAD

//XAUI power supply pins
	   .VDDA_ESR(VDD),
	   .VDDD_ESR(VDD),
	   .VDDR_ESR(VDD),
	   .VDDT_ESR(VDD),
	   .VSSA_ESR(VSS),

`endif


	    .BUTTON_XIR_L              ( BUTTON_XIR_L ),
	    .PB_RST_L                  ( PB_RST_L ),
	    .PWRON_RST_L               ( PWRON_RST_L ),

	    .BURNIN                    ( BURNIN ),
`ifndef  TO_1_0_VECTORS
            .L2T_VNW                   (L2T_VNW[7:0]),
            .SPC_VNW		       (SPC_VNW[7:0]),
            .L2D_VNW0		       (L2D_VNW0[7:0]),
	    .L2D_VNW1		       (L2D_VNW1[7:0]),
`endif
	    .PGRM_EN                   ( PGRM_EN ),
	    .PMI                       ( PMI ),

	    .DIVIDER_BYPASS            ( DIVIDER_BYPASS ),
	    .PLL_CMP_BYPASS            ( PLL_CMP_BYPASS ),
//----------------------------
// SSI Interface
//----------------------------
	    .SSI_EXT_INT_L             ( SSI_EXT_INT_L ),
	    .SSI_SYNC_L                ( SSI_SYNC_L ),
`ifdef AXIS_SSI_BRIDGE
	    .SSI_SCK                   ( SSI_SCK_N2),
	    .SSI_MOSI                  ( SSI_MOSI_N2),
	    .SSI_MISO                  ( SSI_MISO_N2),
`else
	    .SSI_SCK                   ( SSI_SCK),
	    .SSI_MOSI                  ( SSI_MOSI),
	    .SSI_MISO                  ( SSI_MISO),
`endif
//--------------------------------
//STCI interface for serdes scan
//--------------------------------
	    .STCICFG                   ( STCICFG ),
	    .STCICLK                   ( STCICLK ),
	    .STCID                     ( STCID ),
	    .STCIQ                     ( STCIQ ),

	    //-----------------
	    // TCU IO driven by System TAP interface
	    //-----------------
	    .TCK                       ( TCK ),  // Needs to connect to tck
	    .TMS                       (TMS),
	    .TDI                       (TDI),
	    .TDO                       (TDO),
	    .TRST_L                    ( TRST_L),
	    .TESTCLKR                  ( TESTCLKR ),
	    .TESTCLKT                  ( TESTCLKT ),
	    .TESTMODE                  ( TESTMODE ),
	    .PLL_TESTMODE              ( PLL_TESTMODE ),

//-------------------------------------
//Misc pins
//-------------------------------------
	   .VDD_PLL_CMP_REG (VDD_PLL_CMP_REG),
	   .VDD_RNG_HV      (VDD_RNG_HV),
	   .VREG_SELBG_L (VREG_SELBG_L),
	   .DIODE_TOP  (DIODE_TOP),//[2:0]
	   .DIODE_BOT  (DIODE_BOT),//[2:0]
	   .VDD_SENSE  (VDD_SENSE),  //===>
	   .VSS_SENSE  (VSS_SENSE),  //===>

	   .PWR_THRTTL_0 (PWR_THRTTL_0), //<== [2:0]
	   .PWR_THRTTL_1 (PWR_THRTTL_1), //<== [2:0]

	   .PLL_CMP_CLK_P (PLL_CMP_CLK_P),
	   .PLL_CMP_CLK_N (PLL_CMP_CLK_N),
`ifndef  TO_1_0_VECTORS
`ifndef FC_NO_NIU_T2
           .XAUI_MDINT1_L (XAUI_MDINT1_L),
           .XAUI_MDINT0_L (XAUI_MDINT0_L),
`endif
`endif
//	   .SPARE (SPARE),
//---------------------------------------
//High voltage pin for efuse programming
//---------------------------------------
.VPP (VDD),

//-------------------------------------
//Debug interface signals
//-------------------------------------
	    .TRIGIN                    ( TRIGIN ),  // <==
	    .TRIGOUT                   ( TRIGOUT ), // ===>
	    .DBG_DQ                    ( DBG_DQ ),  // ===>
	    .DBG_CK0                   ( DBG_CK0)   // ===>
	    );

`ifndef AXIS
`ifndef GATESIM
   fast_bisi fast_bisi();
`endif // GATESIM
`endif // AXIS

`ifdef AXIS_SSI_BRIDGE
 assign SSI_SCK=core_clk;
 wire null_1, got_rx_packet, PWRON_RST_L_ssi, SSI_MISO_N2_dbg, got_tx_packet;
ssi_bridge ssi_bridge (.TCLKXN (1'b0),
	      .GSCANEN (1'b0),
	      . LSCANEN (1'b0),
     .js1_88_o (SSI_MOSI),
     .js1_89_o (null_1),
     .js1_138_i (~PWRON_RST_L),
     .js1_96_i (SSI_MISO),
     .js1_92_i (SSI_SCK),
     .js1_93_o (got_rx_packet),
     .js1_97_o (SSI_MISO_N2_dbg),
     .js1_88_i (SSI_SCK_N2),
     .js1_89_i (SSI_MOSI_N2),
     .js1_138_o (PWRON_RST_L_ssi),
     .js1_96_o (SSI_MISO_N2),
     .js1_92_o (got_tx_packet),
     .js1_93_i (1'b0),
     .js1_97_i (SSI_SYNC_L)
     );
`endif //  `ifdef AXIS_SSI_BRIDGE

   system_reset system_reset (
		.Sysclk                 (SYSCLK),
		.Core_clk               (core_clk),
		.Ssi_sync_l             (SSI_SYNC_L),
		.Tck                    (tck_clkgen_per_PRM),
		.Button_xir_l           (BUTTON_XIR_L),
`ifndef RESET_AXIS_ONLY
		.Pb_rst_l               (PB_RST_L),
		.Trst_l                 (tb_top_TRST_L),
`endif
		.Pwr_on_rst_l           (PWRON_RST_L),
		.Tb_reset               (reset),
		.Fbdimm_rst             (FBDIMM_RST),
		.niu_reset              (niu_reset),
		.flush_reset_complete   (flush_reset_complete)


		);


   cmp_mem mcusat_mem ();

   mcusat_fbdimm mcusat_fbdimm(
   `ifdef FC_CRC_INJECT
			       .fbdimm0_ps             (fbd0a_tx_p_top[9:0]),
			       .fbdimm0_ps_bar         (fbd0a_tx_n_top[9:0]),
			       .fbdimm1_ps             (fbd0b_tx_p_top[9:0]),
			       .fbdimm1_ps_bar         (fbd0b_tx_n_top[9:0]),
			       .fbdimm2_ps             (fbd1a_tx_p_top[9:0]),
			       .fbdimm2_ps_bar         (fbd1a_tx_n_top[9:0]),
			       .fbdimm3_ps             (fbd1b_tx_p_top[9:0]),
			       .fbdimm3_ps_bar         (fbd1b_tx_n_top[9:0]),
			       .fbdimm4_ps             (fbd2a_tx_p_top[9:0]),
			       .fbdimm4_ps_bar         (fbd2a_tx_n_top[9:0]),
			       .fbdimm5_ps             (fbd2b_tx_p_top[9:0]),
			       .fbdimm5_ps_bar         (fbd2b_tx_n_top[9:0]),
			       .fbdimm6_ps             (fbd3a_tx_p_top[9:0]),
			       .fbdimm6_ps_bar         (fbd3a_tx_n_top[9:0]),
			       .fbdimm7_ps             (fbd3b_tx_p_top[9:0]),
			       .fbdimm7_ps_bar         (fbd3b_tx_n_top[9:0]),
			       .fbdimm0_pn             (fbd0a_rx_p_top[13:0]),
			       .fbdimm0_pn_bar         (fbd0a_rx_n_top[13:0]),
			       .fbdimm1_pn             (fbd0b_rx_p_top[13:0]),
			       .fbdimm1_pn_bar         (fbd0b_rx_n_top[13:0]),
			       .fbdimm2_pn             (fbd1a_rx_p_top[13:0]),
			       .fbdimm2_pn_bar         (fbd1a_rx_n_top[13:0]),
			       .fbdimm3_pn             (fbd1b_rx_p_top[13:0]),
			       .fbdimm3_pn_bar         (fbd1b_rx_n_top[13:0]),
			       .fbdimm4_pn             (fbd2a_rx_p_top[13:0]),
			       .fbdimm4_pn_bar         (fbd2a_rx_n_top[13:0]),
			       .fbdimm5_pn             (fbd2b_rx_p_top[13:0]),
			       .fbdimm5_pn_bar         (fbd2b_rx_n_top[13:0]),
			       .fbdimm6_pn             (fbd3a_rx_p_top[13:0]),
			       .fbdimm6_pn_bar         (fbd3a_rx_n_top[13:0]),
			       .fbdimm7_pn             (fbd3b_rx_p_top[13:0]),
			       .fbdimm7_pn_bar         (fbd3b_rx_n_top[13:0]),
   `else
   `ifdef NB_BITLANE_DESKEW
			       .fbdimm0_ps             (fbdimm0a_tx_p_top[9:0]),
			       .fbdimm0_ps_bar         (fbdimm0a_tx_n_top[9:0]),
			       .fbdimm1_ps             (fbdimm0b_tx_p_top[9:0]),
			       .fbdimm1_ps_bar         (fbdimm0b_tx_n_top[9:0]),
			       .fbdimm2_ps             (fbdimm1a_tx_p_top[9:0]),
			       .fbdimm2_ps_bar         (fbdimm1a_tx_n_top[9:0]),
			       .fbdimm3_ps             (fbdimm1b_tx_p_top[9:0]),
			       .fbdimm3_ps_bar         (fbdimm1b_tx_n_top[9:0]),
			       .fbdimm4_ps             (fbdimm2a_tx_p_top[9:0]),
			       .fbdimm4_ps_bar         (fbdimm2a_tx_n_top[9:0]),
			       .fbdimm5_ps             (fbdimm2b_tx_p_top[9:0]),
			       .fbdimm5_ps_bar         (fbdimm2b_tx_n_top[9:0]),
			       .fbdimm6_ps             (fbdimm3a_tx_p_top[9:0]),
			       .fbdimm6_ps_bar         (fbdimm3a_tx_n_top[9:0]),
			       .fbdimm7_ps             (fbdimm3b_tx_p_top[9:0]),
			       .fbdimm7_ps_bar         (fbdimm3b_tx_n_top[9:0]),
			       .fbdimm0_pn             (fbd0a_rx_p_top[13:0]),
			       .fbdimm0_pn_bar         (fbd0a_rx_n_top[13:0]),
			       .fbdimm1_pn             (fbd0b_rx_p_top[13:0]),
			       .fbdimm1_pn_bar         (fbd0b_rx_n_top[13:0]),
			       .fbdimm2_pn             (fbd1a_rx_p_top[13:0]),
			       .fbdimm2_pn_bar         (fbd1a_rx_n_top[13:0]),
			       .fbdimm3_pn             (fbd1b_rx_p_top[13:0]),
			       .fbdimm3_pn_bar         (fbd1b_rx_n_top[13:0]),
			       .fbdimm4_pn             (fbd2a_rx_p_top[13:0]),
			       .fbdimm4_pn_bar         (fbd2a_rx_n_top[13:0]),
			       .fbdimm5_pn             (fbd2b_rx_p_top[13:0]),
			       .fbdimm5_pn_bar         (fbd2b_rx_n_top[13:0]),
			       .fbdimm6_pn             (fbd3a_rx_p_top[13:0]),
			       .fbdimm6_pn_bar         (fbd3a_rx_n_top[13:0]),
			       .fbdimm7_pn             (fbd3b_rx_p_top[13:0]),
			       .fbdimm7_pn_bar         (fbd3b_rx_n_top[13:0]),
   `else
			       .fbdimm0_ps             (fbdimm0a_tx_p_top[9:0]),
			       .fbdimm0_ps_bar         (fbdimm0a_tx_n_top[9:0]),
			       .fbdimm1_ps             (fbdimm0b_tx_p_top[9:0]),
			       .fbdimm1_ps_bar         (fbdimm0b_tx_n_top[9:0]),
			       .fbdimm2_ps             (fbdimm1a_tx_p_top[9:0]),
			       .fbdimm2_ps_bar         (fbdimm1a_tx_n_top[9:0]),
			       .fbdimm3_ps             (fbdimm1b_tx_p_top[9:0]),
			       .fbdimm3_ps_bar         (fbdimm1b_tx_n_top[9:0]),
			       .fbdimm4_ps             (fbdimm2a_tx_p_top[9:0]),
			       .fbdimm4_ps_bar         (fbdimm2a_tx_n_top[9:0]),
			       .fbdimm5_ps             (fbdimm2b_tx_p_top[9:0]),
			       .fbdimm5_ps_bar         (fbdimm2b_tx_n_top[9:0]),
			       .fbdimm6_ps             (fbdimm3a_tx_p_top[9:0]),
			       .fbdimm6_ps_bar         (fbdimm3a_tx_n_top[9:0]),
			       .fbdimm7_ps             (fbdimm3b_tx_p_top[9:0]),
			       .fbdimm7_ps_bar         (fbdimm3b_tx_n_top[9:0]),
			       .fbdimm0_pn             (fbdimm0a_rx_p_top[13:0]),
			       .fbdimm0_pn_bar         (fbdimm0a_rx_n_top[13:0]),
			       .fbdimm1_pn             (fbdimm0b_rx_p_top[13:0]),
			       .fbdimm1_pn_bar         (fbdimm0b_rx_n_top[13:0]),
			       .fbdimm2_pn             (fbdimm1a_rx_p_top[13:0]),
			       .fbdimm2_pn_bar         (fbdimm1a_rx_n_top[13:0]),
			       .fbdimm3_pn             (fbdimm1b_rx_p_top[13:0]),
			       .fbdimm3_pn_bar         (fbdimm1b_rx_n_top[13:0]),
			       .fbdimm4_pn             (fbdimm2a_rx_p_top[13:0]),
			       .fbdimm4_pn_bar         (fbdimm2a_rx_n_top[13:0]),
			       .fbdimm5_pn             (fbdimm2b_rx_p_top[13:0]),
			       .fbdimm5_pn_bar         (fbdimm2b_rx_n_top[13:0]),
			       .fbdimm6_pn             (fbdimm3a_rx_p_top[13:0]),
			       .fbdimm6_pn_bar         (fbdimm3a_rx_n_top[13:0]),
			       .fbdimm7_pn             (fbdimm3b_rx_p_top[13:0]),
			       .fbdimm7_pn_bar         (fbdimm3b_rx_n_top[13:0]),
    `endif // !`ifdef NB_BITLANE_DESKEW
    `endif // !`ifdef FC_CRC_INJECT
      `ifdef INPHI_FBDIMM
	 .fbdimm_sclk          (dram_12x_clk),
       `else
	  `ifdef AXIS
	    `ifdef AXIS_FBDIMM_NO_FSR
	     .fbdimm_sclk          (~dram_3x_clk),
	    `else
	     .fbdimm_sclk          (~dram_12x_clk),
	    `endif
	   `else
        `ifdef AXIS_FBDIMM_NO_FSR //this allows no serdes to be run on vcs
              .fbdimm_sclk          (~dram_3x_clk),
	    `else
	      .fbdimm_sclk          (SYSCLK),        // 2 div dram_clock
	    `endif
	    `endif
      `endif // !`ifdef INPHI_FBDIMM
  .chmon_rst            (FBDIMM_RST)
);

`ifdef FC_CRC_INJECT
	crc_errinject_top crc_errinject_top (
		      .fbd0a_rx_p_top   (fbd0a_rx_p_top[13:0]),
		      .fbdimm0a_rx_p_top        (fbdimm0a_rx_p_top[13:0]),
		      .fbd0a_rx_n_top   (fbd0a_rx_n_top[13:0]),
		      .fbdimm0a_rx_n_top        (fbdimm0a_rx_n_top[13:0]),
		      .fbd0b_rx_p_top   (fbd0b_rx_p_top[13:0]),
		      .fbdimm0b_rx_p_top        (fbdimm0b_rx_p_top[13:0]),
		      .fbd0b_rx_n_top   (fbd0b_rx_n_top[13:0]),
		      .fbdimm0b_rx_n_top        (fbdimm0b_rx_n_top[13:0]),
		      .fbd1a_rx_p_top   (fbd1a_rx_p_top[13:0]),
		      .fbdimm1a_rx_p_top        (fbdimm1a_rx_p_top[13:0]),
		      .fbd1a_rx_n_top   (fbd1a_rx_n_top[13:0]),
		      .fbdimm1a_rx_n_top        (fbdimm1a_rx_n_top[13:0]),
		      .fbd1b_rx_p_top   (fbd1b_rx_p_top[13:0]),
		      .fbdimm1b_rx_p_top        (fbdimm1b_rx_p_top[13:0]),
		      .fbd1b_rx_n_top   (fbd1b_rx_n_top[13:0]),
		      .fbdimm1b_rx_n_top        (fbdimm1b_rx_n_top[13:0]),
		      .fbd2a_rx_p_top   (fbd2a_rx_p_top[13:0]),
		      .fbdimm2a_rx_p_top        (fbdimm2a_rx_p_top[13:0]),
		      .fbd2a_rx_n_top   (fbd2a_rx_n_top[13:0]),
		      .fbdimm2a_rx_n_top        (fbdimm2a_rx_n_top[13:0]),
		      .fbd2b_rx_p_top   (fbd2b_rx_p_top[13:0]),
		      .fbdimm2b_rx_p_top        (fbdimm2b_rx_p_top[13:0]),
		      .fbd2b_rx_n_top   (fbd2b_rx_n_top[13:0]),
		      .fbdimm2b_rx_n_top        (fbdimm2b_rx_n_top[13:0]),
		      .fbd3a_rx_p_top   (fbd3a_rx_p_top[13:0]),
		      .fbdimm3a_rx_p_top        (fbdimm3a_rx_p_top[13:0]),
		      .fbd3a_rx_n_top   (fbd3a_rx_n_top[13:0]),
		      .fbdimm3a_rx_n_top        (fbdimm3a_rx_n_top[13:0]),
		      .fbd3b_rx_p_top   (fbd3b_rx_p_top[13:0]),
		      .fbdimm3b_rx_p_top        (fbdimm3b_rx_p_top[13:0]),
		      .fbd3b_rx_n_top   (fbd3b_rx_n_top[13:0]),
		      .fbdimm3b_rx_n_top        (fbdimm3b_rx_n_top[13:0]),
		      .fbdimm0a_tx_p_top        (fbdimm0a_tx_p_top[9:0]),
		      .fbd0a_tx_p_top   (fbd0a_tx_p_top[9:0]),
		      .fbdimm0b_tx_p_top        (fbdimm0b_tx_p_top[9:0]),
		      .fbd0b_tx_p_top   (fbd0b_tx_p_top[9:0]),
		      .fbdimm0a_tx_n_top        (fbdimm0a_tx_n_top[9:0]),
		      .fbd0a_tx_n_top   (fbd0a_tx_n_top[9:0]),
		      .fbdimm0b_tx_n_top        (fbdimm0b_tx_n_top[9:0]),
		      .fbd0b_tx_n_top   (fbd0b_tx_n_top[9:0]),
		      .fbdimm1a_tx_p_top        (fbdimm1a_tx_p_top[9:0]),
		      .fbd1a_tx_p_top   (fbd1a_tx_p_top[9:0]),
		      .fbdimm1b_tx_p_top        (fbdimm1b_tx_p_top[9:0]),
		      .fbd1b_tx_p_top   (fbd1b_tx_p_top[9:0]),
		      .fbdimm1a_tx_n_top        (fbdimm1a_tx_n_top[9:0]),
		      .fbd1a_tx_n_top   (fbd1a_tx_n_top[9:0]),
		      .fbdimm1b_tx_n_top        (fbdimm1b_tx_n_top[9:0]),
		      .fbd1b_tx_n_top   (fbd1b_tx_n_top[9:0]),
		      .fbdimm2a_tx_p_top        (fbdimm2a_tx_p_top[9:0]),
		      .fbd2a_tx_p_top   (fbd2a_tx_p_top[9:0]),
		      .fbdimm2b_tx_p_top        (fbdimm2b_tx_p_top[9:0]),
		      .fbd2b_tx_p_top   (fbd2b_tx_p_top[9:0]),
		      .fbdimm2a_tx_n_top        (fbdimm2a_tx_n_top[9:0]),
		      .fbd2a_tx_n_top   (fbd2a_tx_n_top[9:0]),
		      .fbdimm2b_tx_n_top        (fbdimm2b_tx_n_top[9:0]),
		      .fbd2b_tx_n_top   (fbd2b_tx_n_top[9:0]),
		      .fbdimm3a_tx_p_top        (fbdimm3a_tx_p_top[9:0]),
		      .fbd3a_tx_p_top   (fbd3a_tx_p_top[9:0]),
		      .fbdimm3b_tx_p_top        (fbdimm3b_tx_p_top[9:0]),
		      .fbd3b_tx_p_top   (fbd3b_tx_p_top[9:0]),
		      .fbdimm3a_tx_n_top        (fbdimm3a_tx_n_top[9:0]),
		      .fbd3a_tx_n_top   (fbd3a_tx_n_top[9:0]),
		      .fbdimm3b_tx_n_top        (fbdimm3b_tx_n_top[9:0]),
		      .fbd3b_tx_n_top   (fbd3b_tx_n_top[9:0]),
		      .sclk                     (dram_12x_clk)
		    );
`endif //  `ifdef FC_CRC_INJECT

`ifdef NB_BITLANE_DESKEW
nb_bitlane_deskew nb_bitlane_deskew ( 
  .fbdimm0a_rx_p_top    (fbd0a_rx_p_top[13:0]),
  .FBDIMM0A_RX_P_TOP    (fbdimm0a_rx_p_top[13:0]),
  .fbdimm0a_rx_n_top    (fbd0a_rx_n_top[13:0]),
  .FBDIMM0A_RX_N_TOP    (fbdimm0a_rx_n_top[13:0]),
  .fbdimm0b_rx_p_top    (fbd0b_rx_p_top[13:0]),
  .FBDIMM0B_RX_P_TOP    (fbdimm0b_rx_p_top[13:0]),
  .fbdimm0b_rx_n_top    (fbd0b_rx_n_top[13:0]),
  .FBDIMM0B_RX_N_TOP    (fbdimm0b_rx_n_top[13:0]),
  .fbdimm1a_rx_p_top    (fbd1a_rx_p_top[13:0]),
  .FBDIMM1A_RX_P_TOP    (fbdimm1a_rx_p_top[13:0]),
  .fbdimm1a_rx_n_top    (fbd1a_rx_n_top[13:0]),
  .FBDIMM1A_RX_N_TOP    (fbdimm1a_rx_n_top[13:0]),
  .fbdimm1b_rx_p_top    (fbd1b_rx_p_top[13:0]),
  .FBDIMM1B_RX_P_TOP    (fbdimm1b_rx_p_top[13:0]),
  .fbdimm1b_rx_n_top    (fbd1b_rx_n_top[13:0]),
  .FBDIMM1B_RX_N_TOP    (fbdimm1b_rx_n_top[13:0]),
  .fbdimm2a_rx_p_top    (fbd2a_rx_p_top[13:0]),
  .FBDIMM2A_RX_P_TOP    (fbdimm2a_rx_p_top[13:0]),
  .fbdimm2a_rx_n_top    (fbd2a_rx_n_top[13:0]),
  .FBDIMM2A_RX_N_TOP    (fbdimm2a_rx_n_top[13:0]),
  .fbdimm2b_rx_p_top    (fbd2b_rx_p_top[13:0]),
  .FBDIMM2B_RX_P_TOP    (fbdimm2b_rx_p_top[13:0]),
  .fbdimm2b_rx_n_top    (fbd2b_rx_n_top[13:0]),
  .FBDIMM2B_RX_N_TOP    (fbdimm2b_rx_n_top[13:0]),
  .fbdimm3a_rx_p_top    (fbd3a_rx_p_top[13:0]),
  .FBDIMM3A_RX_P_TOP    (fbdimm3a_rx_p_top[13:0]),
  .fbdimm3a_rx_n_top    (fbd3a_rx_n_top[13:0]),
  .FBDIMM3A_RX_N_TOP    (fbdimm3a_rx_n_top[13:0]),
  .fbdimm3b_rx_p_top    (fbd3b_rx_p_top[13:0]),
  .FBDIMM3B_RX_P_TOP    (fbdimm3b_rx_p_top[13:0]),
  .fbdimm3b_rx_n_top    (fbd3b_rx_n_top[13:0]),
  .FBDIMM3B_RX_N_TOP    (fbdimm3b_rx_n_top[13:0]),
  .sysclk           (SYSCLK)
);
`endif //  `ifdef NB_BITLANE_DESKEW


`ifdef DTM_ENABLED

//SV 11/15/06  monitor to kill NIU diags in DTM mode
always @(posedge (iol2clk))  begin
	if (`NCU.niu_ncu_vld | `NCU.ncu_niu_vld | `SII.niu_sii_hdr_vld) begin
	   `PR_ERROR("DTM_kill_niu" , `ERROR, "In DTM mode Niu transaction has occurred!");
	end
end

`endif


//SV 04/26/06   DTM changes

   reg		start_mcu_dtm_training, start_peu_dtm_training;
   reg          splice_point, start_dtm_at_ccu_serdes_dtm;

`ifdef DTM_ENABLED  // Used by both Slam and Non-slam DTM modes
                    // to achieve bit lock at chip pins .
   reg	[1:0]	fbdimm_link_state;

   initial begin
       splice_point           = 1'b0;
       #5;
       @(negedge tb_top.cpu.SSI_SYNC_L);
       @(negedge tb_top.cpu.SSI_SYNC_L);
       @(posedge tb_top.cpu.SSI_SCK);
       @(posedge tb_top.cpu.PLL_CMP_CLK_P);
       @(posedge tb_top.cpu.PLL_CMP_CLK_P);
       @(posedge tb_top.cpu.PLL_CMP_CLK_P);
       @(posedge tb_top.cpu.PLL_CMP_CLK_P);
       splice_point           = 1'b1;
   end

   initial begin
	fbdimm_link_state = 2'h0;
	start_mcu_dtm_training = 1'b0;
        start_peu_dtm_training = 1'b0;
        start_dtm_at_ccu_serdes_dtm = 1'b0;

        if($test$plusargs("START_DTM_AT_CCU_SERDES_DTM")) begin
           start_dtm_at_ccu_serdes_dtm = 1'b1; 
           wait (`CPU.ccu_serdes_dtm);
	   wait (~`CPU.tcu_scan_en);
	   wait (`CPU.tcu_scan_en);
	   wait (~`CPU.tcu_scan_en);
	   wait (~`CPU.rst_wmr_protect);
           @(posedge SYSCLK);
	   start_mcu_dtm_training = 1'b1;
        end
        else begin 
           @(negedge tb_top.cpu.SSI_SYNC_L);
           @(negedge tb_top.cpu.SSI_SYNC_L);
           @(posedge tb_top.cpu.SSI_SCK);
           @(posedge tb_top.cpu.SSI_SCK);
	   start_mcu_dtm_training = 1'b1;
           start_peu_dtm_training = 1'b1;
        end

	release fbdimm0a_rx_p_top[13:0];
	release fbdimm0a_rx_n_top[13:0];
	release fbdimm0b_rx_p_top[13:0];
	release fbdimm0b_rx_n_top[13:0];
	release fbdimm1a_rx_p_top[13:0];
	release fbdimm1a_rx_n_top[13:0];
	release fbdimm1b_rx_p_top[13:0];
	release fbdimm1b_rx_n_top[13:0];
	release fbdimm2a_rx_p_top[13:0];
	release fbdimm2a_rx_n_top[13:0];
	release fbdimm2b_rx_p_top[13:0];
	release fbdimm2b_rx_n_top[13:0];
	release fbdimm3a_rx_p_top[13:0];
	release fbdimm3a_rx_n_top[13:0];
	release fbdimm3b_rx_p_top[13:0];
	release fbdimm3b_rx_n_top[13:0];
   end

   always @(posedge `FBD_CH_PATH0.fbdimm0.link_clk) begin
	if (start_mcu_dtm_training == 1'b0) begin
	    fbdimm_link_state[1:0] = fbdimm_link_state[1:0] + 2'h1;
	    if (fbdimm_link_state[0]) begin
		force fbdimm0a_rx_p_top[13:0] = 14'h3fff;
		force fbdimm0a_rx_n_top[13:0] = 14'h0000;
		force fbdimm0b_rx_p_top[13:0] = 14'h3fff;
		force fbdimm0b_rx_n_top[13:0] = 14'h0000;
		force fbdimm1a_rx_p_top[13:0] = 14'h3fff;
		force fbdimm1a_rx_n_top[13:0] = 14'h0000;
		force fbdimm1b_rx_p_top[13:0] = 14'h3fff;
		force fbdimm1b_rx_n_top[13:0] = 14'h0000;
		force fbdimm2a_rx_p_top[13:0] = 14'h3fff;
		force fbdimm2a_rx_n_top[13:0] = 14'h0000;
		force fbdimm2b_rx_p_top[13:0] = 14'h3fff;
		force fbdimm2b_rx_n_top[13:0] = 14'h0000;
		force fbdimm3a_rx_p_top[13:0] = 14'h3fff;
		force fbdimm3a_rx_n_top[13:0] = 14'h0000;
		force fbdimm3b_rx_p_top[13:0] = 14'h3fff;
		force fbdimm3b_rx_n_top[13:0] = 14'h0000;
     	end
     	else begin
		force fbdimm0a_rx_p_top[13:0] = 14'h0000;
		force fbdimm0a_rx_n_top[13:0] = 14'h3fff;
		force fbdimm0b_rx_p_top[13:0] = 14'h0000;
		force fbdimm0b_rx_n_top[13:0] = 14'h3fff;
		force fbdimm1a_rx_p_top[13:0] = 14'h0000;
		force fbdimm1a_rx_n_top[13:0] = 14'h3fff;
		force fbdimm1b_rx_p_top[13:0] = 14'h0000;
		force fbdimm1b_rx_n_top[13:0] = 14'h3fff;
		force fbdimm2a_rx_p_top[13:0] = 14'h0000;
		force fbdimm2a_rx_n_top[13:0] = 14'h3fff;
		force fbdimm2b_rx_p_top[13:0] = 14'h0000;
		force fbdimm2b_rx_n_top[13:0] = 14'h3fff;
		force fbdimm3a_rx_p_top[13:0] = 14'h0000;
		force fbdimm3a_rx_n_top[13:0] = 14'h3fff;
		force fbdimm3b_rx_p_top[13:0] = 14'h0000;
		force fbdimm3b_rx_n_top[13:0] = 14'h3fff;
       	 end
      end
   end
`endif  // DTM_ENABLED


//END SV changes

`ifdef FLUSH_RESET

`ifdef PALLADIUM
initial begin
  if ($test$plusargs("NO_MCU_CSR_SLAM")) begin
     `PR_INFO ("mcu_mem_config", `INFO, "MCU CSRs not slammed");
  end
  else begin
     while (flush_reset_complete != 1'b1)
       @(posedge dram_clk);
`else

`ifdef AXIS_TL  
initial begin
  if ($test$plusargs("NO_MCU_CSR_SLAM")) begin
     `PR_INFO ("mcu_mem_config", `INFO, "MCU CSRs not slammed");
  end
  else begin
     @(posedge flush_reset_complete);
`else
    always @(posedge flush_reset_complete) begin
`endif //AXIS_TL

`endif //  `ifdef PALLADIUM

`else  // FLUSH_RESET
   initial
     begin
	repeat (100) @(posedge iol2clk);
`endif  // FLUSH_RESET


`ifdef MCU_GATE
`ifdef SLAM_VECTORS

  //  force `MCU1.drif__N2397 = 1'b1;
  //  force `MCU2.drif__N2397 = 1'b1;
  //  force `MCU3.drif__N2397 = 1'b1;
  //  force `MCU0.drif__N2397 = 1'b1;

`elsif  NON_SLAM_VECTORS // SLAM_VECTORS
`else
  if ($test$plusargs("NO_MCU_CSR_SLAM")) begin
     `PR_INFO ("mcu_mem_config", `INFO, "MCU CSRs not slammed");
  end
  else begin
	force `MCU0.drif__N2397 = 1'b1;
	force `MCU1.drif__N2397 = 1'b1;
	force `MCU2.drif__N2397 = 1'b1;
	force `MCU3.drif__N2397 = 1'b1;

	force `MCU0.fbdic__pff_chnl_reset0_fdin = 1'b1;
	force `MCU1.fbdic__pff_chnl_reset0_fdin = 1'b1;
	force `MCU2.fbdic__pff_chnl_reset0_fdin = 1'b1;
	force `MCU3.fbdic__pff_chnl_reset0_fdin = 1'b1;

	wait (`MCU0.fbdic__fbdic_chnl_reset_0_ == 1'b1);
	wait (`MCU1.fbdic__fbdic_chnl_reset_0_ == 1'b1);
	wait (`MCU2.fbdic__fbdic_chnl_reset_0_ == 1'b1);
	wait (`MCU3.fbdic__fbdic_chnl_reset_0_ == 1'b1);

	release `MCU0.fbdic__pff_chnl_reset0_fdin;
	release `MCU1.fbdic__pff_chnl_reset0_fdin;
	release `MCU2.fbdic__pff_chnl_reset0_fdin;
	release `MCU3.fbdic__pff_chnl_reset0_fdin;

  end  // else NO_MCU_CSR_SLAM
`endif // SLAM_VECTORS

`else  // MCU_GATE
`ifdef SLAM_VECTORS

      //  force `MCU0.drif.drif_init = 1'b0;
      //  force `MCU1.drif.drif_init = 1'b0;
      //  force `MCU2.drif.drif_init = 1'b0;
      //  force `MCU3.drif.drif_init = 1'b0;

`elsif  NON_SLAM_VECTORS // SLAM_VECTORS
`else
  if ($test$plusargs("NO_MCU_CSR_SLAM")) begin
     `PR_INFO ("mcu_mem_config", `INFO, "MCU CSRs not slammed");
  end
  else  begin
        force `MCU0.drif.drif_init = 1'b0;
        force `MCU1.drif.drif_init = 1'b0;
        force `MCU2.drif.drif_init = 1'b0;
        force `MCU3.drif.drif_init = 1'b0;
        force `MCU0.fbdic.fbdic_chnl_reset_en = 1'b1;
        force `MCU1.fbdic.fbdic_chnl_reset_en = 1'b1;
        force `MCU2.fbdic.fbdic_chnl_reset_en = 1'b1;
        force `MCU3.fbdic.fbdic_chnl_reset_en = 1'b1;
        force `MCU0.fbdic.fbdic_chnl_reset_in[0] = 1'b1;
        force `MCU1.fbdic.fbdic_chnl_reset_in[0] = 1'b1;
        force `MCU2.fbdic.fbdic_chnl_reset_in[0] = 1'b1;
        force `MCU3.fbdic.fbdic_chnl_reset_in[0] = 1'b1;

`ifdef PALLADIUM
  while ((`MCU0.fbdic.fbdic_chnl_reset[0] != 1'b1))
    @(posedge dram_clk);

  while ((`MCU1.fbdic.fbdic_chnl_reset[0] != 1'b1))
    @(posedge dram_clk);

  while ((`MCU2.fbdic.fbdic_chnl_reset[0] != 1'b1))
    @(posedge dram_clk);

  while ((`MCU3.fbdic.fbdic_chnl_reset[0] != 1'b1))
    @(posedge dram_clk);

`else
        wait (`MCU0.fbdic.fbdic_chnl_reset[0] == 1'b1);
        wait (`MCU1.fbdic.fbdic_chnl_reset[0] == 1'b1);
        wait (`MCU2.fbdic.fbdic_chnl_reset[0] == 1'b1);
        wait (`MCU3.fbdic.fbdic_chnl_reset[0] == 1'b1);
`endif //PALLADIUM

        release `MCU0.fbdic.fbdic_chnl_reset_en;
        release `MCU1.fbdic.fbdic_chnl_reset_en;
        release `MCU2.fbdic.fbdic_chnl_reset_en;
        release `MCU3.fbdic.fbdic_chnl_reset_en;
        release `MCU0.fbdic.fbdic_chnl_reset_in[0];
        release `MCU1.fbdic.fbdic_chnl_reset_in[0];
        release `MCU2.fbdic.fbdic_chnl_reset_in[0];
        release `MCU3.fbdic.fbdic_chnl_reset_in[0];

  end  // else NO_MCU_CSR_SLAM
`endif  // SLAM_VECTORS

`ifdef AXIS_TL
end
`endif
`endif  // MCU_GATE

     end

`ifndef AXIS_TL
   initial
     begin
	$monInit();
     end
`endif

   ////////////////////////////////////////////////////////
     // clocks
   ////////////////////////////////////////////////////////

// The vera shell. Give it the fastest bench clock, always.
// You could pass in all the DUTs top wires, but it is not required.
// Vera can still get to any hdl node through interface.if.vrh files.
// NTB on the otherhand...

`ifdef NTB
// nothing
`else
`ifndef AXIS_TL
`ifdef FC8_BENCH
fc8_top_shell vera_shell(
`else
fc1_top_shell vera_shell(
`endif
`ifndef FC_NO_NIU_T2
    .m0_rx_data   (m0_rx_data[7:0]),   // output (vera_shell) => (enet_model)
    .m0_rx_crs    (m0_rx_crs),         // output (enet_model,vera_shell) => ()
    .m0_rx_col    (m0_rx_col),         // output (enet_model,vera_shell) => ()
    .m0_rx_dv     (m0_rx_dv),          // output (vera_shell) => (enet_model)
    .m0_rx_config (m0_rx_config[3:0]), // output (vera_shell) => (enet_model)
    .m0_rx_err    (m0_rx_err),         // output (vera_shell) => (enet_model)
    .m0_rx_clk    (m0_rx_clk),         // input  (vera_shell) <= (enet_model)
    .m0_tx_data   (m0_tx_data[7:0]),   // input  (vera_shell) <= (enet_model)
    .m0_tx_en     (m0_tx_en),          // input  (vera_shell) <= (enet_model)
    .m0_tx_config (m0_tx_config[3:0]), // output (vera_shell) => (enet_model)
    .m0_tx_err    (m0_tx_err),         // input  (vera_shell) <= (enet_model)
    .m0_tx_clk    (m0_tx_clk),         // input  (vera_shell) <= (enet_model)
    .m1_rx_data   (m1_rx_data[7:0]),   // output (vera_shell) => (enet_model)
    .m1_rx_crs    (m1_rx_crs),         // output (enet_model,vera_shell) => ()
    .m1_rx_col    (m1_rx_col),         // output (enet_model,vera_shell) => ()
    .m1_rx_dv     (m1_rx_dv),          // output (vera_shell) => (enet_model)
    .m1_rx_config (m1_rx_config[3:0]), // output (vera_shell) => (enet_model)
    .m1_rx_err    (m1_rx_err),         // output (vera_shell) => (enet_model)
    .m1_rx_clk    (m1_rx_clk),         // input  (vera_shell) <= (enet_model)
    .m1_tx_data   (m1_tx_data[7:0]),   // input  (vera_shell) <= (enet_model)
    .m1_tx_en     (m1_tx_en),          // input  (vera_shell) <= (enet_model)
    .m1_tx_config (m1_tx_config[3:0]), // output (vera_shell) => (enet_model)
    .m1_tx_err    (m1_tx_err),         // input  (vera_shell) <= (enet_model)
    .m1_tx_clk    (m1_tx_clk),         // input  (vera_shell) <= (enet_model)
    .m2_rx_data   (m2_rx_data[7:0]),   // output (vera_shell) => ()
    .m2_rx_crs    (m2_rx_crs),         // output (vera_shell) => ()
    .m2_rx_col    (m2_rx_col),         // output (vera_shell) => ()
    .m2_rx_dv     (m2_rx_dv),          // output (vera_shell) => ()
    .m2_rx_config (m2_rx_config[3:0]), // output (vera_shell) => (enet_model)
    .m2_rx_err    (m2_rx_err),         // output (vera_shell) => ()
    .m2_rx_clk    (m2_rx_clk),         // input  (vera_shell) <= (enet_model)
    .m2_tx_data   (m2_tx_data[7:0]),   // input  (vera_shell) <= (enet_model)
    .m2_tx_en     (m2_tx_en),          // input  (vera_shell) <= (enet_model)
    .m2_tx_config (m2_tx_config[3:0]), // output (vera_shell) => (enet_model)
    .m2_tx_err    (m2_tx_err),         // input  (vera_shell) <= (enet_model)
    .m2_tx_clk    (m2_tx_clk),         // input  (vera_shell) <= (enet_model)
    .m3_rx_data   (m3_rx_data[7:0]),   // output (vera_shell) => ()
    .m3_rx_crs    (m3_rx_crs),         // output (vera_shell) => ()
    .m3_rx_col    (m3_rx_col),         // output (vera_shell) => ()
    .m3_rx_dv     (m3_rx_dv),          // output (vera_shell) => ()
    .m3_rx_config (m3_rx_config[3:0]), // output (vera_shell) => (enet_model)
    .m3_rx_err    (m3_rx_err),         // output (vera_shell) => ()
    .m3_rx_clk    (m3_rx_clk),         // input  (vera_shell) <= (enet_model)
    .m3_tx_data   (m3_tx_data[7:0]),   // input  (vera_shell) <= (enet_model)
    .m3_tx_en     (m3_tx_en),          // input  (vera_shell) <= (enet_model)
    .m3_tx_config (m3_tx_config[3:0]), // output (vera_shell) => (enet_model)
    .m3_tx_err    (m3_tx_err),         // input  (vera_shell) <= (enet_model)
    .m3_tx_clk    (m3_tx_clk)          // input  (vera_shell) <= (enet_model)
`endif
`ifndef FC_NO_PEUSAT_CODE
`ifndef FC_NO_PEU_T2
   ,.if_ILU_PEU_PCIE_ELEC_IDLE_LANES(ELEC_IDLE_LANES) // output (vera_shell) => (pcie serdes/denali)
`endif
`endif
);
`endif //AXIS_TL
`endif // !`ifdef NTB

   reg [7:0] efuse_core_avail;
   reg [16*8:0] tempstr;
   reg [63:0]   cmp_core_avail;
   reg [63:0]   cmp_core_enable;
   reg [63:0]   threads, threadsf;
   reg clock;

reg[7:0] spc7_pcx_req;
reg[7:0] spc7_pcx_req_d1;
reg[7:0] spc7_pcx_req_d2;
reg[7:0] spc7_pcx_req_d3;
reg[7:0] spc7_pcx_req_d4;
reg[7:0] spc7_pcx_req_d5;
reg[7:0] spc7_pcx_req_d6;
reg[7:0] spc7_pcx_req_d7;
reg[7:0] spc7_pcx_req_d8;
reg[7:0] spc7_pcx_req_d9;
reg[7:0] spc7_pcx_req_d10;
reg[7:0] spc6_pcx_req;
reg[7:0] spc6_pcx_req_d1;
reg[7:0] spc6_pcx_req_d2;
reg[7:0] spc6_pcx_req_d3;
reg[7:0] spc6_pcx_req_d4;
reg[7:0] spc6_pcx_req_d5;
reg[7:0] spc6_pcx_req_d6;
reg[7:0] spc6_pcx_req_d7;
reg[7:0] spc6_pcx_req_d8;
reg[7:0] spc6_pcx_req_d9;
reg[7:0] spc6_pcx_req_d10;
reg[7:0] spc5_pcx_req;
reg[7:0] spc5_pcx_req_d1;
reg[7:0] spc5_pcx_req_d2;
reg[7:0] spc5_pcx_req_d3;
reg[7:0] spc5_pcx_req_d4;
reg[7:0] spc5_pcx_req_d5;
reg[7:0] spc5_pcx_req_d6;
reg[7:0] spc5_pcx_req_d7;
reg[7:0] spc5_pcx_req_d8;
reg[7:0] spc5_pcx_req_d9;
reg[7:0] spc5_pcx_req_d10;
reg[7:0] spc4_pcx_req;
reg[7:0] spc4_pcx_req_d1;
reg[7:0] spc4_pcx_req_d2;
reg[7:0] spc4_pcx_req_d3;
reg[7:0] spc4_pcx_req_d4;
reg[7:0] spc4_pcx_req_d5;
reg[7:0] spc4_pcx_req_d6;
reg[7:0] spc4_pcx_req_d7;
reg[7:0] spc4_pcx_req_d8;
reg[7:0] spc4_pcx_req_d9;
reg[7:0] spc4_pcx_req_d10;
reg[7:0] spc3_pcx_req;
reg[7:0] spc3_pcx_req_d1;
reg[7:0] spc3_pcx_req_d2;
reg[7:0] spc3_pcx_req_d3;
reg[7:0] spc3_pcx_req_d4;
reg[7:0] spc3_pcx_req_d5;
reg[7:0] spc3_pcx_req_d6;
reg[7:0] spc3_pcx_req_d7;
reg[7:0] spc3_pcx_req_d8;
reg[7:0] spc3_pcx_req_d9;
reg[7:0] spc3_pcx_req_d10;
reg[7:0] spc2_pcx_req;
reg[7:0] spc2_pcx_req_d1;
reg[7:0] spc2_pcx_req_d2;
reg[7:0] spc2_pcx_req_d3;
reg[7:0] spc2_pcx_req_d4;
reg[7:0] spc2_pcx_req_d5;
reg[7:0] spc2_pcx_req_d6;
reg[7:0] spc2_pcx_req_d7;
reg[7:0] spc2_pcx_req_d8;
reg[7:0] spc2_pcx_req_d9;
reg[7:0] spc2_pcx_req_d10;
reg[7:0] spc1_pcx_req;
reg[7:0] spc1_pcx_req_d1;
reg[7:0] spc1_pcx_req_d2;
reg[7:0] spc1_pcx_req_d3;
reg[7:0] spc1_pcx_req_d4;
reg[7:0] spc1_pcx_req_d5;
reg[7:0] spc1_pcx_req_d6;
reg[7:0] spc1_pcx_req_d7;
reg[7:0] spc1_pcx_req_d8;
reg[7:0] spc1_pcx_req_d9;
reg[7:0] spc1_pcx_req_d10;
reg[7:0] spc0_pcx_req;
reg[7:0] spc0_pcx_req_d1;
reg[7:0] spc0_pcx_req_d2;
reg[7:0] spc0_pcx_req_d3;
reg[7:0] spc0_pcx_req_d4;
reg[7:0] spc0_pcx_req_d5;
reg[7:0] spc0_pcx_req_d6;
reg[7:0] spc0_pcx_req_d7;
reg[7:0] spc0_pcx_req_d8;
reg[7:0] spc0_pcx_req_d9;
reg[7:0] spc0_pcx_req_d10;

reg[7:0] spc7_pcx_atm;
reg[7:0] spc7_pcx_atm_d1;
reg[7:0] spc7_pcx_atm_d2;
reg[7:0] spc7_pcx_atm_d3;
reg[7:0] spc7_pcx_atm_d4;
reg[7:0] spc7_pcx_atm_d5;
reg[7:0] spc7_pcx_atm_d6;
reg[7:0] spc7_pcx_atm_d7;
reg[7:0] spc7_pcx_atm_d8;
reg[7:0] spc7_pcx_atm_d9;
reg[7:0] spc7_pcx_atm_d10;
reg[7:0] spc6_pcx_atm;
reg[7:0] spc6_pcx_atm_d1;
reg[7:0] spc6_pcx_atm_d2;
reg[7:0] spc6_pcx_atm_d3;
reg[7:0] spc6_pcx_atm_d4;
reg[7:0] spc6_pcx_atm_d5;
reg[7:0] spc6_pcx_atm_d6;
reg[7:0] spc6_pcx_atm_d7;
reg[7:0] spc6_pcx_atm_d8;
reg[7:0] spc6_pcx_atm_d9;
reg[7:0] spc6_pcx_atm_d10;
reg[7:0] spc5_pcx_atm;
reg[7:0] spc5_pcx_atm_d1;
reg[7:0] spc5_pcx_atm_d2;
reg[7:0] spc5_pcx_atm_d3;
reg[7:0] spc5_pcx_atm_d4;
reg[7:0] spc5_pcx_atm_d5;
reg[7:0] spc5_pcx_atm_d6;
reg[7:0] spc5_pcx_atm_d7;
reg[7:0] spc5_pcx_atm_d8;
reg[7:0] spc5_pcx_atm_d9;
reg[7:0] spc5_pcx_atm_d10;
reg[7:0] spc4_pcx_atm;
reg[7:0] spc4_pcx_atm_d1;
reg[7:0] spc4_pcx_atm_d2;
reg[7:0] spc4_pcx_atm_d3;
reg[7:0] spc4_pcx_atm_d4;
reg[7:0] spc4_pcx_atm_d5;
reg[7:0] spc4_pcx_atm_d6;
reg[7:0] spc4_pcx_atm_d7;
reg[7:0] spc4_pcx_atm_d8;
reg[7:0] spc4_pcx_atm_d9;
reg[7:0] spc4_pcx_atm_d10;
reg[7:0] spc3_pcx_atm;
reg[7:0] spc3_pcx_atm_d1;
reg[7:0] spc3_pcx_atm_d2;
reg[7:0] spc3_pcx_atm_d3;
reg[7:0] spc3_pcx_atm_d4;
reg[7:0] spc3_pcx_atm_d5;
reg[7:0] spc3_pcx_atm_d6;
reg[7:0] spc3_pcx_atm_d7;
reg[7:0] spc3_pcx_atm_d8;
reg[7:0] spc3_pcx_atm_d9;
reg[7:0] spc3_pcx_atm_d10;
reg[7:0] spc2_pcx_atm;
reg[7:0] spc2_pcx_atm_d1;
reg[7:0] spc2_pcx_atm_d2;
reg[7:0] spc2_pcx_atm_d3;
reg[7:0] spc2_pcx_atm_d4;
reg[7:0] spc2_pcx_atm_d5;
reg[7:0] spc2_pcx_atm_d6;
reg[7:0] spc2_pcx_atm_d7;
reg[7:0] spc2_pcx_atm_d8;
reg[7:0] spc2_pcx_atm_d9;
reg[7:0] spc2_pcx_atm_d10;
reg[7:0] spc1_pcx_atm;
reg[7:0] spc1_pcx_atm_d1;
reg[7:0] spc1_pcx_atm_d2;
reg[7:0] spc1_pcx_atm_d3;
reg[7:0] spc1_pcx_atm_d4;
reg[7:0] spc1_pcx_atm_d5;
reg[7:0] spc1_pcx_atm_d6;
reg[7:0] spc1_pcx_atm_d7;
reg[7:0] spc1_pcx_atm_d8;
reg[7:0] spc1_pcx_atm_d9;
reg[7:0] spc1_pcx_atm_d10;
reg[7:0] spc0_pcx_atm;
reg[7:0] spc0_pcx_atm_d1;
reg[7:0] spc0_pcx_atm_d2;
reg[7:0] spc0_pcx_atm_d3;
reg[7:0] spc0_pcx_atm_d4;
reg[7:0] spc0_pcx_atm_d5;
reg[7:0] spc0_pcx_atm_d6;
reg[7:0] spc0_pcx_atm_d7;
reg[7:0] spc0_pcx_atm_d8;
reg[7:0] spc0_pcx_atm_d9;
reg[7:0] spc0_pcx_atm_d10;

reg[7:0] l2t7_cpx_req_d1;
reg[7:0] l2t7_cpx_req_d2;
reg[7:0] l2t7_cpx_req_d3;
reg[7:0] l2t7_cpx_req_d4;
reg[7:0] l2t6_cpx_req_d1;
reg[7:0] l2t6_cpx_req_d2;
reg[7:0] l2t6_cpx_req_d3;
reg[7:0] l2t6_cpx_req_d4;
reg[7:0] l2t5_cpx_req_d1;
reg[7:0] l2t5_cpx_req_d2;
reg[7:0] l2t5_cpx_req_d3;
reg[7:0] l2t5_cpx_req_d4;
reg[7:0] l2t4_cpx_req_d1;
reg[7:0] l2t4_cpx_req_d2;
reg[7:0] l2t4_cpx_req_d3;
reg[7:0] l2t4_cpx_req_d4;
reg[7:0] l2t3_cpx_req_d1;
reg[7:0] l2t3_cpx_req_d2;
reg[7:0] l2t3_cpx_req_d3;
reg[7:0] l2t3_cpx_req_d4;
reg[7:0] l2t2_cpx_req_d1;
reg[7:0] l2t2_cpx_req_d2;
reg[7:0] l2t2_cpx_req_d3;
reg[7:0] l2t2_cpx_req_d4;
reg[7:0] l2t1_cpx_req_d1;
reg[7:0] l2t1_cpx_req_d2;
reg[7:0] l2t1_cpx_req_d3;
reg[7:0] l2t1_cpx_req_d4;
reg[7:0] l2t0_cpx_req_d1;
reg[7:0] l2t0_cpx_req_d2;
reg[7:0] l2t0_cpx_req_d3;
reg[7:0] l2t0_cpx_req_d4;

reg[7:0] l2t7_cpx_atom_d1;
reg[7:0] l2t7_cpx_atom_d2;
reg[7:0] l2t7_cpx_atom_d3;
reg[7:0] l2t7_cpx_atom_d4;
reg[7:0] l2t6_cpx_atom_d1;
reg[7:0] l2t6_cpx_atom_d2;
reg[7:0] l2t6_cpx_atom_d3;
reg[7:0] l2t6_cpx_atom_d4;
reg[7:0] l2t5_cpx_atom_d1;
reg[7:0] l2t5_cpx_atom_d2;
reg[7:0] l2t5_cpx_atom_d3;
reg[7:0] l2t5_cpx_atom_d4;
reg[7:0] l2t4_cpx_atom_d1;
reg[7:0] l2t4_cpx_atom_d2;
reg[7:0] l2t4_cpx_atom_d3;
reg[7:0] l2t4_cpx_atom_d4;
reg[7:0] l2t3_cpx_atom_d1;
reg[7:0] l2t3_cpx_atom_d2;
reg[7:0] l2t3_cpx_atom_d3;
reg[7:0] l2t3_cpx_atom_d4;
reg[7:0] l2t2_cpx_atom_d1;
reg[7:0] l2t2_cpx_atom_d2;
reg[7:0] l2t2_cpx_atom_d3;
reg[7:0] l2t2_cpx_atom_d4;
reg[7:0] l2t1_cpx_atom_d1;
reg[7:0] l2t1_cpx_atom_d2;
reg[7:0] l2t1_cpx_atom_d3;
reg[7:0] l2t1_cpx_atom_d4;
reg[7:0] l2t0_cpx_atom_d1;
reg[7:0] l2t0_cpx_atom_d2;
reg[7:0] l2t0_cpx_atom_d3;
reg[7:0] l2t0_cpx_atom_d4;

   reg   mcu0_l2t0_data_vld_r0;
   reg   mcu0_l2t0_data_vld_d1;
   reg   mcu0_l2t0_data_vld_d2;
   reg   mcu0_l2t0_data_vld_d3;
   reg   mcu1_l2t0_data_vld_r0;
   reg   mcu1_l2t0_data_vld_d1;
   reg   mcu1_l2t0_data_vld_d2;
   reg   mcu1_l2t0_data_vld_d3;
   reg   mcu2_l2t0_data_vld_r0;
   reg   mcu2_l2t0_data_vld_d1;
   reg   mcu2_l2t0_data_vld_d2;
   reg   mcu2_l2t0_data_vld_d3;
   reg   mcu3_l2t0_data_vld_r0;
   reg   mcu3_l2t0_data_vld_d1;
   reg   mcu3_l2t0_data_vld_d2;
   reg   mcu3_l2t0_data_vld_d3;
   reg   mcu0_l2t1_data_vld_r0;
   reg   mcu0_l2t1_data_vld_d1;
   reg   mcu0_l2t1_data_vld_d2;
   reg   mcu0_l2t1_data_vld_d3;
   reg   mcu1_l2t1_data_vld_r0;
   reg   mcu1_l2t1_data_vld_d1;
   reg   mcu1_l2t1_data_vld_d2;
   reg   mcu1_l2t1_data_vld_d3;
   reg   mcu2_l2t1_data_vld_r0;
   reg   mcu2_l2t1_data_vld_d1;
   reg   mcu2_l2t1_data_vld_d2;
   reg   mcu2_l2t1_data_vld_d3;
   reg   mcu3_l2t1_data_vld_r0;
   reg   mcu3_l2t1_data_vld_d1;
   reg   mcu3_l2t1_data_vld_d2;
   reg   mcu3_l2t1_data_vld_d3;

initial begin
assign spc7_pcx_req = `CCX.spc7_pcx_req_pq;
assign spc6_pcx_req = `CCX.spc6_pcx_req_pq;
assign spc5_pcx_req = `CCX.spc5_pcx_req_pq;
assign spc4_pcx_req = `CCX.spc4_pcx_req_pq;
assign spc3_pcx_req = `CCX.spc3_pcx_req_pq;
assign spc2_pcx_req = `CCX.spc2_pcx_req_pq;
assign spc1_pcx_req = `CCX.spc1_pcx_req_pq;
assign spc0_pcx_req = `CCX.spc0_pcx_req_pq;


assign spc0_pcx_atm = `CCX.spc0_pcx_atm_pq;
assign spc1_pcx_atm = `CCX.spc1_pcx_atm_pq;
assign spc2_pcx_atm = `CCX.spc2_pcx_atm_pq;
assign spc3_pcx_atm = `CCX.spc3_pcx_atm_pq;
assign spc4_pcx_atm = `CCX.spc4_pcx_atm_pq;
assign spc5_pcx_atm = `CCX.spc5_pcx_atm_pq;
assign spc6_pcx_atm = `CCX.spc6_pcx_atm_pq;
assign spc7_pcx_atm = `CCX.spc7_pcx_atm_pq;
end

always @(posedge clock)
begin
spc0_pcx_req_d1[7:0]  <= spc0_pcx_req[7:0] ;
spc0_pcx_req_d2[7:0]  <= spc0_pcx_req_d1[7:0] ;
spc0_pcx_req_d3[7:0]  <= spc0_pcx_req_d2[7:0] ;
spc0_pcx_req_d4[7:0]  <= spc0_pcx_req_d3[7:0] ;
spc0_pcx_req_d5[7:0]  <= spc0_pcx_req_d4[7:0] ;
spc0_pcx_req_d6[7:0]  <= spc0_pcx_req_d5[7:0] ;
spc0_pcx_req_d7[7:0]  <= spc0_pcx_req_d6[7:0] ;
spc0_pcx_req_d8[7:0]  <= spc0_pcx_req_d7[7:0] ;
spc0_pcx_req_d9[7:0]  <= spc0_pcx_req_d8[7:0] ;
spc0_pcx_req_d10[7:0] <= spc0_pcx_req_d9[7:0] ;
spc1_pcx_req_d1[7:0]  <= spc1_pcx_req[7:0] ;
spc1_pcx_req_d2[7:0]  <= spc1_pcx_req_d1[7:0] ;
spc1_pcx_req_d3[7:0]  <= spc1_pcx_req_d2[7:0] ;
spc1_pcx_req_d4[7:0]  <= spc1_pcx_req_d3[7:0] ;
spc1_pcx_req_d5[7:0]  <= spc1_pcx_req_d4[7:0] ;
spc1_pcx_req_d6[7:0]  <= spc1_pcx_req_d5[7:0] ;
spc1_pcx_req_d7[7:0]  <= spc1_pcx_req_d6[7:0] ;
spc1_pcx_req_d8[7:0]  <= spc1_pcx_req_d7[7:0] ;
spc1_pcx_req_d9[7:0]  <= spc1_pcx_req_d8[7:0] ;
spc1_pcx_req_d10[7:0] <= spc1_pcx_req_d9[7:0] ;
spc2_pcx_req_d1[7:0]  <= spc2_pcx_req[7:0] ;
spc2_pcx_req_d2[7:0]  <= spc2_pcx_req_d1[7:0] ;
spc2_pcx_req_d3[7:0]  <= spc2_pcx_req_d2[7:0] ;
spc2_pcx_req_d4[7:0]  <= spc2_pcx_req_d3[7:0] ;
spc2_pcx_req_d5[7:0]  <= spc2_pcx_req_d4[7:0] ;
spc2_pcx_req_d6[7:0]  <= spc2_pcx_req_d5[7:0] ;
spc2_pcx_req_d7[7:0]  <= spc2_pcx_req_d6[7:0] ;
spc2_pcx_req_d8[7:0]  <= spc2_pcx_req_d7[7:0] ;
spc2_pcx_req_d9[7:0]  <= spc2_pcx_req_d8[7:0] ;
spc2_pcx_req_d10[7:0] <= spc2_pcx_req_d9[7:0] ;
spc3_pcx_req_d1[7:0]  <= spc3_pcx_req[7:0] ;
spc3_pcx_req_d2[7:0]  <= spc3_pcx_req_d1[7:0] ;
spc3_pcx_req_d3[7:0]  <= spc3_pcx_req_d2[7:0] ;
spc3_pcx_req_d4[7:0]  <= spc3_pcx_req_d3[7:0] ;
spc3_pcx_req_d5[7:0]  <= spc3_pcx_req_d4[7:0] ;
spc3_pcx_req_d6[7:0]  <= spc3_pcx_req_d5[7:0] ;
spc3_pcx_req_d7[7:0]  <= spc3_pcx_req_d6[7:0] ;
spc3_pcx_req_d8[7:0]  <= spc3_pcx_req_d7[7:0] ;
spc3_pcx_req_d9[7:0]  <= spc3_pcx_req_d8[7:0] ;
spc3_pcx_req_d10[7:0] <= spc3_pcx_req_d9[7:0] ;
spc4_pcx_req_d1[7:0]  <= spc4_pcx_req[7:0] ;
spc4_pcx_req_d2[7:0]  <= spc4_pcx_req_d1[7:0] ;
spc4_pcx_req_d3[7:0]  <= spc4_pcx_req_d2[7:0] ;
spc4_pcx_req_d4[7:0]  <= spc4_pcx_req_d3[7:0] ;
spc4_pcx_req_d5[7:0]  <= spc4_pcx_req_d4[7:0] ;
spc4_pcx_req_d6[7:0]  <= spc4_pcx_req_d5[7:0] ;
spc4_pcx_req_d7[7:0]  <= spc4_pcx_req_d6[7:0] ;
spc4_pcx_req_d8[7:0]  <= spc4_pcx_req_d7[7:0] ;
spc4_pcx_req_d9[7:0]  <= spc4_pcx_req_d8[7:0] ;
spc4_pcx_req_d10[7:0] <= spc4_pcx_req_d9[7:0] ;
spc5_pcx_req_d1[7:0]  <= spc5_pcx_req[7:0] ;
spc5_pcx_req_d2[7:0]  <= spc5_pcx_req_d1[7:0] ;
spc5_pcx_req_d3[7:0]  <= spc5_pcx_req_d2[7:0] ;
spc5_pcx_req_d4[7:0]  <= spc5_pcx_req_d3[7:0] ;
spc5_pcx_req_d5[7:0]  <= spc5_pcx_req_d4[7:0] ;
spc5_pcx_req_d6[7:0]  <= spc5_pcx_req_d5[7:0] ;
spc5_pcx_req_d7[7:0]  <= spc5_pcx_req_d6[7:0] ;
spc5_pcx_req_d8[7:0]  <= spc5_pcx_req_d7[7:0] ;
spc5_pcx_req_d9[7:0]  <= spc5_pcx_req_d8[7:0] ;
spc5_pcx_req_d10[7:0] <= spc5_pcx_req_d9[7:0] ;
spc6_pcx_req_d1[7:0]  <= spc6_pcx_req[7:0] ;
spc6_pcx_req_d2[7:0]  <= spc6_pcx_req_d1[7:0] ;
spc6_pcx_req_d3[7:0]  <= spc6_pcx_req_d2[7:0] ;
spc6_pcx_req_d4[7:0]  <= spc6_pcx_req_d3[7:0] ;
spc6_pcx_req_d5[7:0]  <= spc6_pcx_req_d4[7:0] ;
spc6_pcx_req_d6[7:0]  <= spc6_pcx_req_d5[7:0] ;
spc6_pcx_req_d7[7:0]  <= spc6_pcx_req_d6[7:0] ;
spc6_pcx_req_d8[7:0]  <= spc6_pcx_req_d7[7:0] ;
spc6_pcx_req_d9[7:0]  <= spc6_pcx_req_d8[7:0] ;
spc6_pcx_req_d10[7:0] <= spc6_pcx_req_d9[7:0] ;
spc7_pcx_req_d1[7:0]  <= spc7_pcx_req[7:0] ;
spc7_pcx_req_d2[7:0]  <= spc7_pcx_req_d1[7:0] ;
spc7_pcx_req_d3[7:0]  <= spc7_pcx_req_d2[7:0] ;
spc7_pcx_req_d4[7:0]  <= spc7_pcx_req_d3[7:0] ;
spc7_pcx_req_d5[7:0]  <= spc7_pcx_req_d4[7:0] ;
spc7_pcx_req_d6[7:0]  <= spc7_pcx_req_d5[7:0] ;
spc7_pcx_req_d7[7:0]  <= spc7_pcx_req_d6[7:0] ;
spc7_pcx_req_d8[7:0]  <= spc7_pcx_req_d7[7:0] ;
spc7_pcx_req_d9[7:0]  <= spc7_pcx_req_d8[7:0] ;
spc7_pcx_req_d10[7:0] <= spc7_pcx_req_d9[7:0] ;
spc0_pcx_atm_d1[7:0]  <= spc0_pcx_atm[7:0] ;
spc0_pcx_atm_d2[7:0]  <= spc0_pcx_atm_d1[7:0] ;
spc0_pcx_atm_d3[7:0]  <= spc0_pcx_atm_d2[7:0] ;
spc0_pcx_atm_d4[7:0]  <= spc0_pcx_atm_d3[7:0] ;
spc0_pcx_atm_d5[7:0]  <= spc0_pcx_atm_d4[7:0] ;
spc0_pcx_atm_d6[7:0]  <= spc0_pcx_atm_d5[7:0] ;
spc0_pcx_atm_d7[7:0]  <= spc0_pcx_atm_d6[7:0] ;
spc0_pcx_atm_d8[7:0]  <= spc0_pcx_atm_d7[7:0] ;
spc0_pcx_atm_d9[7:0]  <= spc0_pcx_atm_d8[7:0] ;
spc0_pcx_atm_d10[7:0] <= spc0_pcx_atm_d9[7:0] ;
spc1_pcx_atm_d1[7:0]  <= spc1_pcx_atm[7:0] ;
spc1_pcx_atm_d2[7:0]  <= spc1_pcx_atm_d1[7:0] ;
spc1_pcx_atm_d3[7:0]  <= spc1_pcx_atm_d2[7:0] ;
spc1_pcx_atm_d4[7:0]  <= spc1_pcx_atm_d3[7:0] ;
spc1_pcx_atm_d5[7:0]  <= spc1_pcx_atm_d4[7:0] ;
spc1_pcx_atm_d6[7:0]  <= spc1_pcx_atm_d5[7:0] ;
spc1_pcx_atm_d7[7:0]  <= spc1_pcx_atm_d6[7:0] ;
spc1_pcx_atm_d8[7:0]  <= spc1_pcx_atm_d7[7:0] ;
spc1_pcx_atm_d9[7:0]  <= spc1_pcx_atm_d8[7:0] ;
spc1_pcx_atm_d10[7:0] <= spc1_pcx_atm_d9[7:0] ;
spc2_pcx_atm_d1[7:0]  <= spc2_pcx_atm[7:0] ;
spc2_pcx_atm_d2[7:0]  <= spc2_pcx_atm_d1[7:0] ;
spc2_pcx_atm_d3[7:0]  <= spc2_pcx_atm_d2[7:0] ;
spc2_pcx_atm_d4[7:0]  <= spc2_pcx_atm_d3[7:0] ;
spc2_pcx_atm_d5[7:0]  <= spc2_pcx_atm_d4[7:0] ;
spc2_pcx_atm_d6[7:0]  <= spc2_pcx_atm_d5[7:0] ;
spc2_pcx_atm_d7[7:0]  <= spc2_pcx_atm_d6[7:0] ;
spc2_pcx_atm_d8[7:0]  <= spc2_pcx_atm_d7[7:0] ;
spc2_pcx_atm_d9[7:0]  <= spc2_pcx_atm_d8[7:0] ;
spc2_pcx_atm_d10[7:0] <= spc2_pcx_atm_d9[7:0] ;
spc3_pcx_atm_d1[7:0]  <= spc3_pcx_atm[7:0] ;
spc3_pcx_atm_d2[7:0]  <= spc3_pcx_atm_d1[7:0] ;
spc3_pcx_atm_d3[7:0]  <= spc3_pcx_atm_d2[7:0] ;
spc3_pcx_atm_d4[7:0]  <= spc3_pcx_atm_d3[7:0] ;
spc3_pcx_atm_d5[7:0]  <= spc3_pcx_atm_d4[7:0] ;
spc3_pcx_atm_d6[7:0]  <= spc3_pcx_atm_d5[7:0] ;
spc3_pcx_atm_d7[7:0]  <= spc3_pcx_atm_d6[7:0] ;
spc3_pcx_atm_d8[7:0]  <= spc3_pcx_atm_d7[7:0] ;
spc3_pcx_atm_d9[7:0]  <= spc3_pcx_atm_d8[7:0] ;
spc3_pcx_atm_d10[7:0] <= spc3_pcx_atm_d9[7:0] ;
spc4_pcx_atm_d1[7:0]  <= spc4_pcx_atm[7:0] ;
spc4_pcx_atm_d2[7:0]  <= spc4_pcx_atm_d1[7:0] ;
spc4_pcx_atm_d3[7:0]  <= spc4_pcx_atm_d2[7:0] ;
spc4_pcx_atm_d4[7:0]  <= spc4_pcx_atm_d3[7:0] ;
spc4_pcx_atm_d5[7:0]  <= spc4_pcx_atm_d4[7:0] ;
spc4_pcx_atm_d6[7:0]  <= spc4_pcx_atm_d5[7:0] ;
spc4_pcx_atm_d7[7:0]  <= spc4_pcx_atm_d6[7:0] ;
spc4_pcx_atm_d8[7:0]  <= spc4_pcx_atm_d7[7:0] ;
spc4_pcx_atm_d9[7:0]  <= spc4_pcx_atm_d8[7:0] ;
spc4_pcx_atm_d10[7:0] <= spc4_pcx_atm_d9[7:0] ;
spc5_pcx_atm_d1[7:0]  <= spc5_pcx_atm[7:0] ;
spc5_pcx_atm_d2[7:0]  <= spc5_pcx_atm_d1[7:0] ;
spc5_pcx_atm_d3[7:0]  <= spc5_pcx_atm_d2[7:0] ;
spc5_pcx_atm_d4[7:0]  <= spc5_pcx_atm_d3[7:0] ;
spc5_pcx_atm_d5[7:0]  <= spc5_pcx_atm_d4[7:0] ;
spc5_pcx_atm_d6[7:0]  <= spc5_pcx_atm_d5[7:0] ;
spc5_pcx_atm_d7[7:0]  <= spc5_pcx_atm_d6[7:0] ;
spc5_pcx_atm_d8[7:0]  <= spc5_pcx_atm_d7[7:0] ;
spc5_pcx_atm_d9[7:0]  <= spc5_pcx_atm_d8[7:0] ;
spc5_pcx_atm_d10[7:0] <= spc5_pcx_atm_d9[7:0] ;
spc6_pcx_atm_d1[7:0]  <= spc6_pcx_atm[7:0] ;
spc6_pcx_atm_d2[7:0]  <= spc6_pcx_atm_d1[7:0] ;
spc6_pcx_atm_d3[7:0]  <= spc6_pcx_atm_d2[7:0] ;
spc6_pcx_atm_d4[7:0]  <= spc6_pcx_atm_d3[7:0] ;
spc6_pcx_atm_d5[7:0]  <= spc6_pcx_atm_d4[7:0] ;
spc6_pcx_atm_d6[7:0]  <= spc6_pcx_atm_d5[7:0] ;
spc6_pcx_atm_d7[7:0]  <= spc6_pcx_atm_d6[7:0] ;
spc6_pcx_atm_d8[7:0]  <= spc6_pcx_atm_d7[7:0] ;
spc6_pcx_atm_d9[7:0]  <= spc6_pcx_atm_d8[7:0] ;
spc6_pcx_atm_d10[7:0] <= spc6_pcx_atm_d9[7:0] ;
spc7_pcx_atm_d1[7:0]  <= spc7_pcx_atm[7:0] ;
spc7_pcx_atm_d2[7:0]  <= spc7_pcx_atm_d1[7:0] ;
spc7_pcx_atm_d3[7:0]  <= spc7_pcx_atm_d2[7:0] ;
spc7_pcx_atm_d4[7:0]  <= spc7_pcx_atm_d3[7:0] ;
spc7_pcx_atm_d5[7:0]  <= spc7_pcx_atm_d4[7:0] ;
spc7_pcx_atm_d6[7:0]  <= spc7_pcx_atm_d5[7:0] ;
spc7_pcx_atm_d7[7:0]  <= spc7_pcx_atm_d6[7:0] ;
spc7_pcx_atm_d8[7:0]  <= spc7_pcx_atm_d7[7:0] ;
spc7_pcx_atm_d9[7:0]  <= spc7_pcx_atm_d8[7:0] ;
spc7_pcx_atm_d10[7:0] <= spc7_pcx_atm_d9[7:0] ;

l2t0_cpx_req_d2[7:0] <= l2t0_cpx_req_d1[7:0] ;
l2t0_cpx_req_d3[7:0] <= l2t0_cpx_req_d2[7:0] ;
l2t0_cpx_req_d4[7:0] <= l2t0_cpx_req_d3[7:0] ;
l2t1_cpx_req_d2[7:0] <= l2t1_cpx_req_d1[7:0] ;
l2t1_cpx_req_d3[7:0] <= l2t1_cpx_req_d2[7:0] ;
l2t1_cpx_req_d4[7:0] <= l2t1_cpx_req_d3[7:0] ;
l2t2_cpx_req_d2[7:0] <= l2t2_cpx_req_d1[7:0] ;
l2t2_cpx_req_d3[7:0] <= l2t2_cpx_req_d2[7:0] ;
l2t2_cpx_req_d4[7:0] <= l2t2_cpx_req_d3[7:0] ;
l2t3_cpx_req_d2[7:0] <= l2t3_cpx_req_d1[7:0] ;
l2t3_cpx_req_d3[7:0] <= l2t3_cpx_req_d2[7:0] ;
l2t3_cpx_req_d4[7:0] <= l2t3_cpx_req_d3[7:0] ;
l2t4_cpx_req_d2[7:0] <= l2t4_cpx_req_d1[7:0] ;
l2t4_cpx_req_d3[7:0] <= l2t4_cpx_req_d2[7:0] ;
l2t4_cpx_req_d4[7:0] <= l2t4_cpx_req_d3[7:0] ;
l2t5_cpx_req_d2[7:0] <= l2t5_cpx_req_d1[7:0] ;
l2t5_cpx_req_d3[7:0] <= l2t5_cpx_req_d2[7:0] ;
l2t5_cpx_req_d4[7:0] <= l2t5_cpx_req_d3[7:0] ;
l2t6_cpx_req_d2[7:0] <= l2t6_cpx_req_d1[7:0] ;
l2t6_cpx_req_d3[7:0] <= l2t6_cpx_req_d2[7:0] ;
l2t6_cpx_req_d4[7:0] <= l2t6_cpx_req_d3[7:0] ;
l2t7_cpx_req_d2[7:0] <= l2t7_cpx_req_d1[7:0] ;
l2t7_cpx_req_d3[7:0] <= l2t7_cpx_req_d2[7:0] ;
l2t7_cpx_req_d4[7:0] <= l2t7_cpx_req_d3[7:0] ;
l2t0_cpx_atom_d2[7:0] <= l2t0_cpx_atom_d1[7:0] ;
l2t0_cpx_atom_d3[7:0] <= l2t0_cpx_atom_d2[7:0] ;
l2t0_cpx_atom_d4[7:0] <= l2t0_cpx_atom_d3[7:0] ;
l2t1_cpx_atom_d2[7:0] <= l2t1_cpx_atom_d1[7:0] ;
l2t1_cpx_atom_d3[7:0] <= l2t1_cpx_atom_d2[7:0] ;
l2t1_cpx_atom_d4[7:0] <= l2t1_cpx_atom_d3[7:0] ;
l2t2_cpx_atom_d2[7:0] <= l2t2_cpx_atom_d1[7:0] ;
l2t2_cpx_atom_d3[7:0] <= l2t2_cpx_atom_d2[7:0] ;
l2t2_cpx_atom_d4[7:0] <= l2t2_cpx_atom_d3[7:0] ;
l2t3_cpx_atom_d2[7:0] <= l2t3_cpx_atom_d1[7:0] ;
l2t3_cpx_atom_d3[7:0] <= l2t3_cpx_atom_d2[7:0] ;
l2t3_cpx_atom_d4[7:0] <= l2t3_cpx_atom_d3[7:0] ;
l2t4_cpx_atom_d2[7:0] <= l2t4_cpx_atom_d1[7:0] ;
l2t4_cpx_atom_d3[7:0] <= l2t4_cpx_atom_d2[7:0] ;
l2t4_cpx_atom_d4[7:0] <= l2t4_cpx_atom_d3[7:0] ;
l2t5_cpx_atom_d2[7:0] <= l2t5_cpx_atom_d1[7:0] ;
l2t5_cpx_atom_d3[7:0] <= l2t5_cpx_atom_d2[7:0] ;
l2t5_cpx_atom_d4[7:0] <= l2t5_cpx_atom_d3[7:0] ;
l2t6_cpx_atom_d2[7:0] <= l2t6_cpx_atom_d1[7:0] ;
l2t6_cpx_atom_d3[7:0] <= l2t6_cpx_atom_d2[7:0] ;
l2t6_cpx_atom_d4[7:0] <= l2t6_cpx_atom_d3[7:0] ;
l2t7_cpx_atom_d2[7:0] <= l2t7_cpx_atom_d1[7:0] ;
l2t7_cpx_atom_d3[7:0] <= l2t7_cpx_atom_d2[7:0] ;
l2t7_cpx_atom_d4[7:0] <= l2t7_cpx_atom_d3[7:0] ;
mcu0_l2t0_data_vld_d1  <= mcu0_l2t0_data_vld_r0 ;
mcu0_l2t0_data_vld_d2  <= mcu0_l2t0_data_vld_d1 ;
mcu0_l2t0_data_vld_d3  <= mcu0_l2t0_data_vld_d2 ;
mcu1_l2t0_data_vld_d1  <= mcu1_l2t0_data_vld_r0 ;
mcu1_l2t0_data_vld_d2  <= mcu1_l2t0_data_vld_d1 ;
mcu1_l2t0_data_vld_d3  <= mcu1_l2t0_data_vld_d2 ;
mcu2_l2t0_data_vld_d1  <= mcu2_l2t0_data_vld_r0 ;
mcu2_l2t0_data_vld_d2  <= mcu2_l2t0_data_vld_d1 ;
mcu2_l2t0_data_vld_d3  <= mcu2_l2t0_data_vld_d2 ;
mcu3_l2t0_data_vld_d1  <= mcu3_l2t0_data_vld_r0 ;
mcu3_l2t0_data_vld_d2  <= mcu3_l2t0_data_vld_d1 ;
mcu3_l2t0_data_vld_d3  <= mcu3_l2t0_data_vld_d2 ;
mcu0_l2t1_data_vld_d1  <= mcu0_l2t1_data_vld_r0 ;
mcu0_l2t1_data_vld_d2  <= mcu0_l2t1_data_vld_d1 ;
mcu0_l2t1_data_vld_d3  <= mcu0_l2t1_data_vld_d2 ;
mcu1_l2t1_data_vld_d1  <= mcu1_l2t1_data_vld_r0 ;
mcu1_l2t1_data_vld_d2  <= mcu1_l2t1_data_vld_d1 ;
mcu1_l2t1_data_vld_d3  <= mcu1_l2t1_data_vld_d2 ;
mcu2_l2t1_data_vld_d1  <= mcu2_l2t1_data_vld_r0 ;
mcu2_l2t1_data_vld_d2  <= mcu2_l2t1_data_vld_d1 ;
mcu2_l2t1_data_vld_d3  <= mcu2_l2t1_data_vld_d2 ;
mcu3_l2t1_data_vld_d1  <= mcu3_l2t1_data_vld_r0 ;
mcu3_l2t1_data_vld_d2  <= mcu3_l2t1_data_vld_d1 ;
mcu3_l2t1_data_vld_d3  <= mcu3_l2t1_data_vld_d2 ;
end






   integer      i;

`ifndef FLUSH_RESET
`include "fc_noreset_force.v"
`endif


//----------------------------------------------------------
`include "misc_tasks.v"
`include "fc_dft_tasks.v"
initial begin
  if ($test$plusargs("testing_pll_char_out"))
    dft_testing_pll_char_out();
end

`ifndef AXIS_TL
// done elsewhere
// always @(sim_status) 
//     `PR_ALWAYS ("top", `ALWAYS, "regreport clock period: 750000 fs\n");


task read_cmp_reg;
  input  [31:0] addr;
  output [63:0] rd_data;
  input  [5:0] tid;

begin
end
endtask

task write_cmp_reg;
  input [31:0] addr;
  input [63:0] wr_data;
  input [5:0] tid;

begin
end
endtask

task write_sys_mem;
       input [63:0] addr;
       input [63:0] data;
       input [8:0] be;
	reg [63:0] addr_l;
	reg [63:0] data_l;
	reg [63:0] rd_data;
	reg [63:0] rd_data_tmp;
	reg [63:0] wr_data;
	reg [31:0] data_high;
	reg [31:0] data_low;
	integer mem_sync;

       begin

		rd_data_tmp = $read_dram({addr[63:3], 3'b000}, data_low, data_high, pm_shift);
		rd_data_tmp = {data_high, data_low};

		rd_data[7:0]   = rd_data_tmp[63:56];
		rd_data[15:8]  = rd_data_tmp[55:48];
		rd_data[23:16] = rd_data_tmp[47:40];
		rd_data[31:24] = rd_data_tmp[39:32];
		rd_data[39:32] = rd_data_tmp[31:24];
		rd_data[47:40] = rd_data_tmp[23:16];
		rd_data[55:48] = rd_data_tmp[15:8];
		rd_data[63:56] = rd_data_tmp[7:0];


		case(addr[2:0])
		  3'b001 : wr_data[63:0] = {rd_data[63:16], data[7:0],  rd_data[7:0] };
		  3'b011 : wr_data[63:0] = {rd_data[63:32], data[7:0], rd_data[23:0]};
		  3'b101 : wr_data[63:0] = {rd_data[63:48], data[7:0], rd_data[39:0]};
		  3'b111 : wr_data[63:0] = {   data[7:0], rd_data[55:0]};

		  3'b010 : wr_data[63:0] = {rd_data[63:32], data[15:0], rd_data[15:0]};
		  3'b110 : wr_data[63:0] = {                data[15:0], rd_data[47:0]};

		  3'b100 : wr_data[63:0] = {data[31:0], rd_data[31:0]};

		  3'b000 : wr_data[63:0] = data[63:0];
		endcase

		`PR_DEBUG ("top", `DEBUG, "write_sys_mem Raw_data = %h, rd_data = %h, wr_data = %h\n", data, rd_data,wr_data);

// NIU endianess problem!  Make sure this is taken out later!

		data_l[7:0]   = wr_data[63:56];
		data_l[15:8]  = wr_data[55:48];
		data_l[23:16] = wr_data[47:40];
		data_l[31:24] = wr_data[39:32];
		data_l[39:32] = wr_data[31:24];
		data_l[47:40] = wr_data[23:16];
		data_l[55:48] = wr_data[15:8];
		data_l[63:56] = wr_data[7:0];

		if (!addr[39]) begin
		     $write_dram({addr[63:3], 3'b000}, data_l, pm_shift);
		     `PR_DEBUG ("top", `DEBUG, "write_sys_mem @ %0h = %0h\n", addr,data_l);
		end

		// Send socket message to Riesling
`ifndef GATESIM
		`TOP.ldst_sync.ldst_l2.mem_slam ({addr[39:3], 3'b000}, data_l,8'hff, "ENET WR");
`endif

     end
endtask

    // 64 bits data, 64 bits address
task read_sys_mem;
       input [63:0] addr;
       output [63:0] rd_data;

       reg [63:0] rdata64;
       reg [31:0] data_h;
       reg [31:0] data_l;
       reg [63:0] rd_data_tmp;

       begin
	  rd_data_tmp = $read_dram(addr, data_l, data_h, pm_shift);
	  rd_data_tmp = {data_h, data_l};

	  rd_data[7:0]   = rd_data_tmp[63:56];
	  rd_data[15:8]  = rd_data_tmp[55:48];
	  rd_data[23:16] = rd_data_tmp[47:40];
	  rd_data[31:24] = rd_data_tmp[39:32];
	  rd_data[39:32] = rd_data_tmp[31:24];
	  rd_data[47:40] = rd_data_tmp[23:16];
	  rd_data[55:48] = rd_data_tmp[15:8];
	  rd_data[63:56] = rd_data_tmp[7:0];

   `PR_DEBUG ("top", `DEBUG, "read_sys_mem Raw-Data @ %0h = %0h\n", addr,rd_data);
   `PR_DEBUG ("top", `DEBUG, "read_sys_mem @ %0h = %0h\n", addr,rd_data);

       end
 endtask


wire [63:0] cmp_core_running_status;
`ifdef CORE_0
  assign cmp_core_running_status[7:0] = `SPC0.spc_core_running_status[7:0];
`else
  assign cmp_core_running_status[7:0] = 8'h0;
`endif

`ifdef CORE_1
  assign cmp_core_running_status[15:8] = `SPC1.spc_core_running_status[7:0];
`else
  assign cmp_core_running_status[15:8] = 8'h0;
`endif

`ifdef CORE_2
  assign cmp_core_running_status[23:16] = `SPC2.spc_core_running_status[7:0];
`else
  assign cmp_core_running_status[23:16] = 8'h0;
`endif
`ifdef CORE_3
    assign cmp_core_running_status[31:24] = `SPC3.spc_core_running_status[7:0];
`else
  assign cmp_core_running_status[31:24] = 8'h0;
`endif

`ifdef CORE_4
    assign cmp_core_running_status[39:32] = `SPC4.spc_core_running_status[7:0];
`else
  assign cmp_core_running_status[39:32] = 8'h0;
`endif

`ifdef CORE_5
  assign cmp_core_running_status[47:40] = `SPC5.spc_core_running_status[7:0];
`else
  assign cmp_core_running_status[47:40] = 8'h0;
`endif

`ifdef CORE_6
  assign cmp_core_running_status[55:48] = `SPC6.spc_core_running_status[7:0];
`else
  assign cmp_core_running_status[55:48] = 8'h0;
`endif

`ifdef CORE_7
  assign cmp_core_running_status[63:56] = `SPC7.spc_core_running_status[7:0];
`else
  assign cmp_core_running_status[63:56] = 8'h0;
`endif

initial begin

   if ($test$plusargs("ASI_CORE_AVILABLE")) begin
      if ($value$plusargs("ASI_CORE_AVILABLE=%s", tempstr)) 
	cmp_core_avail = {get_thread_enables(tempstr)};
   end
   else
	cmp_core_avail = 64'hff;

   if ($test$plusargs("ASI_CORE_ENABLE")) begin
      if ($value$plusargs("ASI_CORE_ENABLE=%s", tempstr)) 
	cmp_core_enable = {get_thread_enables(tempstr)};
   end
   else
	cmp_core_enable = 64'hff;

   for (i=7; i>= 0; i=i-1) begin
      efuse_core_avail[i] = &{cmp_core_enable[(i+1)*8-1], cmp_core_enable[(i+1)*8-2],cmp_core_enable[(i+1)*8-3],
		cmp_core_enable[(i+1)*8-4],cmp_core_enable[(i+1)*8-5],cmp_core_enable[(i+1)*8-6],
		cmp_core_enable[(i+1)*8-7],cmp_core_enable[(i+1)*8-8]};
   end

end

initial begin
  if(!$test$plusargs("FULL_EFU")) begin
    full_efu = 1'b1;
  end
end

`ifdef FLUSH_RESET
`ifndef FULL_RESET
`ifdef TCU_GATE
   always @(posedge `EFU.u_efa_stdc__read_start_sync2) begin
    if (full_efu) begin
      #1 force {`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_14_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_13_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_12_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_11_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_10_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_9_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_8_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_7_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_6_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_5_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_4_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_3_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_2_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_1_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_0_} = 15'h4500;
      repeat (250) @(posedge iol2clk);

      release {`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_14_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_13_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_12_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_11_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_10_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_9_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_8_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_7_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_6_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_5_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_4_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_3_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_2_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_1_,`TCU.sigmux_ctl__tcusig_efcnt_reg_fdin_0_};
     end
   end

`else  // TCU_GATE
   always @(posedge `EFU.u_efa_stdc.read_start_sync2) begin
    if (full_efu) begin
      #1 force `TCU.sigmux_ctl.efcnt_din = 15'h4500;
      repeat (250) @(posedge iol2clk);
      release `TCU.sigmux_ctl.efcnt_din;
    end
   end
`endif // TCU_GATE
`endif // FULL_RESET
`else  // FLUSH_RESET
initial begin
   repeat (100) @(posedge iol2clk);
   force `CPU.efu_ncu_coreavl_xfer_en = 1'b1;
   force `CPU.efu_ncu_fuse_data = 1'b0;
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = 1'b0; 
   @(posedge iol2clk); 
   force `CPU.efu_ncu_fuse_data = 1'b0; 
   @(posedge iol2clk); 
   force `CPU.efu_ncu_fuse_data = 1'b0; 
   @(posedge iol2clk); 
   force `CPU.efu_ncu_fuse_data = 1'b0; 
   @(posedge iol2clk); 
   force `CPU.efu_ncu_fuse_data = 1'b0; 
   @(posedge iol2clk); 
   force `CPU.efu_ncu_fuse_data = 1'b0; 
   @(posedge iol2clk); 
   force `CPU.efu_ncu_fuse_data = 1'b0; 
   @(posedge iol2clk); 
   force `CPU.efu_ncu_fuse_data = 1'b0; 
   @(posedge iol2clk); 
   force `CPU.efu_ncu_fuse_data = 1'b0; 
   @(posedge iol2clk); 
   force `CPU.efu_ncu_fuse_data = 1'b0; 
   @(posedge iol2clk); 
   force `CPU.efu_ncu_fuse_data = 1'b0; 
   @(posedge iol2clk); 
   force `CPU.efu_ncu_fuse_data = 1'b0; 
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = 1'b0;
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = efuse_core_avail[7];
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = efuse_core_avail[6];
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = efuse_core_avail[5];
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = efuse_core_avail[4];
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = efuse_core_avail[3];
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = efuse_core_avail[2];
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = efuse_core_avail[1];
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = efuse_core_avail[0];
   @(posedge iol2clk);
   force `CPU.efu_ncu_coreavl_xfer_en = 1'b0;
   force `CPU.efu_ncu_fuse_data = 1'b0;

   @(posedge iol2clk);
   force `CPU.efu_ncu_bankavl_xfer_en = 1'b1;
   force `CPU.efu_ncu_fuse_data = 1'b0;
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = 1'b0;
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = 1'b0;
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = 1'b0;
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = 1'b0;
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = 1'b0;
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = 1'b0;
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = 1'b0;
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = 1'b0;
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = 1'b0;
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = 1'b0;
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = 1'b0;
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = 1'b0;
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = 1'b0;
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = 1'b1;
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = 1'b1;
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = 1'b1;
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = 1'b1;
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = 1'b1;
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = 1'b1;
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = 1'b1;
   @(posedge iol2clk);
   force `CPU.efu_ncu_fuse_data = 1'b1;
   @(posedge iol2clk);
   force `CPU.efu_ncu_bankavl_xfer_en = 1'b0;
   force `CPU.efu_ncu_fuse_data = 1'b0;
   @(posedge iol2clk);

   threads = `TOP.verif_args.th_check_enable & cmp_core_enable;
   threadsf = 64'h0;

`ifdef NCU_GATE
   for (i=0; i<64; i=i+1) begin
	threadsf[i] = threads[i];
	force `NCU.ncu_spc0_core_running[7:0] = threadsf[7:0] ;
	force `NCU.ncu_spc1_core_running[7:0] = threadsf[15:8] ;
	force `NCU.ncu_spc2_core_running[7:0] = threadsf[23:16] ;
	force `NCU.ncu_spc3_core_running[7:0] = threadsf[31:24] ;
	force `NCU.ncu_spc4_core_running[7:0] = threadsf[39:32] ;
	force `NCU.ncu_spc5_core_running[7:0] = threadsf[47:40] ;
	force `NCU.ncu_spc6_core_running[7:0] = threadsf[55:48] ;
	force `NCU.ncu_spc7_core_running[7:0] = threadsf[63:56] ;
	repeat (50) @(posedge core_clk);
   end
`else

   for (i=0; i<64; i=i+1) begin
	threadsf[i] = threads[i];
	force `NCU.core_running = threadsf ;
	repeat (50) @(posedge core_clk);
   end
`endif  // NCU_GATE

    force `CPU.rst_ncu_unpark_thread = 1'b1;
   @(posedge iol2clk);
    force `CPU.rst_ncu_unpark_thread = 1'b0;
    repeat (10) @(posedge iol2clk);

`ifdef MCU_GATE
	release `NCU.ncu_spc0_core_running[7:0] ;
	release `NCU.ncu_spc1_core_running[7:0] ;
	release `NCU.ncu_spc2_core_running[7:0] ;
	release `NCU.ncu_spc3_core_running[7:0] ;
	release `NCU.ncu_spc4_core_running[7:0] ;
	release `NCU.ncu_spc5_core_running[7:0] ;
	release `NCU.ncu_spc6_core_running[7:0] ;
	release `NCU.ncu_spc7_core_running[7:0] ;
`else
   release `NCU.core_running ;
`endif  // MCU_GATE

   release `CPU.rst_ncu_unpark_thread;
end

`endif  // FLUSH_RESET

`endif  // AXIS_TL

function [63:0] get_thread_enables ;
    input [8*16:0] instring;
    reg [7:0] char;
    integer i, j;
    reg [3:0] nibble;

    begin
	get_thread_enables = 64'h0;
	// if argument is thread=all
	if (instring == "all") begin
	    get_thread_enables = 64'hffffffff_ffffffff;
	end
	// if argument is thread=none
	else if (instring == "none") begin
	    get_thread_enables = 64'h0;
	end
	// rest should just be the actual value
	else begin
	   for (i=0; i<16; i=i+1) begin
	      for (j=0; j<=7; j=j+1) begin
		char[j] = instring[8*i+j];
	      end

	      case (char)
	      "0" : nibble = 4'b0000;
	      "1" : nibble = 4'b0001;
	      "2" : nibble = 4'b0010;
	      "3" : nibble = 4'b0011;
	      "4" : nibble = 4'b0100;
	      "5" : nibble = 4'b0101;
	      "6" : nibble = 4'b0110;
	      "7" : nibble = 4'b0111;
	      "8" : nibble = 4'b1000;
	      "9" : nibble = 4'b1001;
	      "a","A" : nibble = 4'b1010;
	      "b","B" : nibble = 4'b1011;
	      "c","C" : nibble = 4'b1100;
	      "d","D" : nibble = 4'b1101;
	      "e","E" : nibble = 4'b1110;
	      "f","F" : nibble = 4'b1111;
	      default : nibble = 4'b0000;
	      endcase

	      get_thread_enables = get_thread_enables | (nibble << (i*4));
	   end
	end
    end

endfunction

`ifndef AXIS_TL
`include "../ios/verilog/ios_ras_inj.v"

`ifndef FC_NO_NIU_T2
`include "niu_tasks.v"
`ifndef DTM_ENABLED
`include "fc_niu_slam.v"
`endif // DTM_ENABLED
`endif // FC_NO_NIU_T2
`endif // AXIS_TL

//---------------Changes for CCU integration---------------
//-------- Generate clock and connect to CCU PLL Ref Inputs ------

reg sysCLK;
wire sysclk; // who uses this? axis_*.v
// wire l2clk_veratb;
// wire drl2clk_veratb;
// wire ccu_io_out_veratb;

`ifndef AXIS_TL
initial
begin
`ifdef  DTM_ENABLED
  sys_half_period = 4800; //9600
`else
  sys_half_period = 3000; // 166MHz
  if( $test$plusargs("SYSCLK_166")) begin
     sys_half_period = 3000;//6000
  end

  if( $test$plusargs("SYSCLK_133")) begin
     sys_half_period = 3750;//7500
  end

  if( $test$plusargs("SYSCLK_200")) begin
     sys_half_period = 2500;//5000
  end

`endif  // DTM_ENABLED

  `PR_NORMAL("fc_top", `NORMAL, "SYSCLK period set to %d ps", 2*sys_half_period);
  #1
  sysCLK = 1'b0;
  forever #(sys_half_period)  sysCLK = ~sysCLK;

end

// ALWAYS RUNNING CLOCK. THIS GOES TO VERA.
// VERA NEEDS A CONTINUOUS CLOCK FROM TIME ZERO.
initial begin
   #1
   SystemClock = 0;
   // continue until cmp_pll_clk starts, then follow that clock
   while (`CCU.cmp_pll_clk !== 1'b0) begin
     @sysCLK SystemClock = ~SystemClock ;
   end
   SystemClock = 0;
   forever begin
     @`CCU.cmp_pll_clk SystemClock = ~SystemClock;
   end
end

assign sysclk = sysCLK; // who uses this? axis_*.v
assign SYSCLK  = sysCLK;
assign SYSCLKN = ~sysCLK;

// from MCU sat, don't seem to be used
// assign l2clk_veratb = `CCU.cmp_pll_clk;
// assign drl2clk_veratb = `CCU.dr_pll_clk;
// assign ccu_io_out_veratb = `CCU.ccu_io_out ;

assign core_clk = `CCU.cmp_pll_clk; //BS
assign iol2clk  = `CCU.ccu_io_out;
assign iol2clk_2x = `CCU.ccu_io2x_out;

// gclk used by l2 coverage
// assign gclk = `CCU.cmp_pll_clk;

//--- CCU PLL programming done in MCU
ccu_pll_config ccu_pll_config ();

reg ref_dram_6x_clk_reg;
integer ref_dram_6x_clk_period;
integer time1_r, time2_r;

initial
begin
  ref_dram_6x_clk_reg=0;
  @ (posedge `CCU.ccu_rst_sync_stable);
  @ (posedge SYSCLK);
   time1_r=$realtime;
  @ (posedge SYSCLK);
   time2_r=$realtime;
`ifdef  DTM_ENABLED
    ref_dram_6x_clk_period=(time2_r-time1_r)/(6);
`else 
    ref_dram_6x_clk_period=(time2_r-time1_r)/(6*2);
`endif
  forever begin #(ref_dram_6x_clk_period/2) ref_dram_6x_clk_reg = ~ref_dram_6x_clk_reg; end
end

  assign dram_6x_clk = ref_dram_6x_clk_reg ;

reg ref_dram_12x_clk_reg;
integer ref_dram_12x_clk_period;
integer time1_r1, time2_r1;

// ---- Clock Generator for FBD Channel clock ; dr_clk X 12 (linkclk) -----

initial
begin
  ref_dram_12x_clk_reg=0;
  @ (posedge `CCU.ccu_rst_sync_stable);
  @ (posedge SYSCLK);
   time1_r1=$realtime;
  @ (posedge SYSCLK);
   time2_r1=$realtime;
`ifdef  DTM_ENABLED
    ref_dram_12x_clk_period=(time2_r-time1_r)/(12);
`else
    ref_dram_12x_clk_period=(time2_r1-time1_r1)/(12*2);
`endif
  forever begin #(ref_dram_12x_clk_period/2) ref_dram_12x_clk_reg = ~ref_dram_12x_clk_reg; end
end

  assign dram_12x_clk = ref_dram_12x_clk_reg ;


// --- DTM CCU Slam ---
reg serdes_dtm1, serdes_dtm2;
reg [2:0] dbg_port_config;

initial
begin
  #1;
			 
`ifdef GATESIM
`ifdef CCU_GATE
  
  force `CCU.ccu_pll.x6.x1.x0.net61 = `CCU.ccu_pll.x6.x1.x0.in8_clk_l;
`endif
`endif
			 
`ifdef  SLAM_VECTORS
   if ($value$plusargs("serdes_dtm1=%h", serdes_dtm1)) begin
   end
   else begin
      serdes_dtm1 = 0;
   end

   if ($value$plusargs("serdes_dtm2=%h", serdes_dtm2)) begin
   end
   else begin
      serdes_dtm2 = 1;
   end

     wait (`CCU.cluster_arst_l == 1'b1);
`ifdef CCU_GATE
     force `CCU.serdes_dtm1 = serdes_dtm1;
     force `CCU.serdes_dtm2 = serdes_dtm2;   //SV 04/26/06
`else
     force `CCU.csr_blk.serdes_dtm1 = serdes_dtm1;
     force `CCU.csr_blk.serdes_dtm2 = serdes_dtm2;   //SV 04/26/06
`endif // CCU_GATE
 
   if ($value$plusargs("dbg_port_config=%b", dbg_port_config)) begin
     `ifdef GATESIM
       force `DBG1.dbg1_csr__dbg_config_reg_3_ = dbg_port_config[2];
       force `DBG1.dbg1_csr__dbg_config_reg_2_ = dbg_port_config[1];
       force `DBG1.dbg1_csr__dbg_config_reg_1_ = dbg_port_config[0];
       force `DBG1.dbg1_csr__n1031 = 1'b1;
     `else
       force `DBG1.dbg1_csr.dbg_config_reg[3] = dbg_port_config[2];
       force `DBG1.dbg1_csr.dbg_config_reg[2] = dbg_port_config[1];
       force `DBG1.dbg1_csr.dbg_config_reg[1] = dbg_port_config[0];
       force `DBG1.dbg1_csr.dbg_config_reg[0] = 1'b1;
     `endif // GATESIM
   end
   else begin
     `ifdef GATESIM
       force `DBG1.dbg1_csr__dbg_config_reg_3_ = 1'b0;
       force `DBG1.dbg1_csr__dbg_config_reg_2_ = 1'b0;
       force `DBG1.dbg1_csr__dbg_config_reg_1_ = 1'b1;
       force `DBG1.dbg1_csr__n1031 = 1'b1;
     `else
     // Debug port configuration to Tester Characterization
       force `DBG1.dbg1_csr.dbg_config_reg[3] = 1'b0;
       force `DBG1.dbg1_csr.dbg_config_reg[2] = 1'b0;
       force `DBG1.dbg1_csr.dbg_config_reg[1] = 1'b1;
       force `DBG1.dbg1_csr.dbg_config_reg[0] = 1'b1;
     `endif // GATESIM
   end

`endif  // SLAM_VECTORS
end  // initial


/*
 * All vcs tasks related to modes need to be put in this file
 * please add comments as u put new vcs_run_args
 */

`include "fc_modes_tasks.v"

`ifndef FC_NO_NIU_T2
/*
 * MDIO model
 */
//module mdio_mmd_model (reset, mdc, mdio_in, mdio_out, mdio_en);
//            .XAUI_MDC(XAUI_MDC),        // PAD
//            .XAUI_MDIO(XAUI_MDIO),       // PAD
//for some reason the model does not have a build in bidi
wire   fc_mdio_in, fc_mdio_out, fc_mdio_en;

assign fc_mdio_in = XAUI_MDIO;
assign XAUI_MDIO  = fc_mdio_en ? 1'bz : fc_mdio_out;

mdio_mmd_model mdio_device(.reset(PEX_RESET_L), 
			   .mdc  (XAUII_MDC),
			   .mdio_in(fc_mdio_in),
			   .mdio_en(fc_mdio_en),
			   .mdio_out(fc_mdio_out)
			  );
`endif

 wire           signal_to_disable_checker;
//-----------------------
//Wiring cabinet 
`ifndef GATESIM
fc_csr_cabinet  csr_cabinet();
`endif // GATESIM

`ifdef  SLAM_VECTORS
//////////////////////////////////////////////
//Code for PEU SLAM for DTM
//////////////////////////////////////////////
initial begin
    #1;
    //after POR b4 wrm
    @(posedge flush_reset_complete);

`ifndef GATESIM
    `PR_NORMAL("fc_top", `NORMAL, "Forcing  program MPY field of PEU Serdes PLL Ctrl Reg to x10 after FIRST FLUSH RESET");
    `PR_NORMAL("fc_top", `NORMAL, "Forcing  Now switch the PEU rate scale from full to half rate FIRST FLUSH RESET");
    force `PEU.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.serdes_pll.serdes_pll_csrbus_read_data[63:0] = 64'h0000000000000005;
    force `DMU.ilu.cib.csr.dmu_ilu_cib_default_grp.ilu_diagnos.ilu_diagnos_csrbus_read_data[63:0]		= 64'h00000003ffff0004;
    //after WRM reset
    @(posedge flush_reset_complete);
    `PR_NORMAL("fc_top", `NORMAL, "Forcing second set of registers after SECOND FLUSH RESET");
    //BP 10-23-06 Mike S changed denali, so now for dtm we can leave symbol timer at the default
    //force `PEU.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.symbol_timer.symbol_timer_csrbus_read_data[63:0] = 64'h020;
    force `PEU.peu_ptl.ctb.tlr.csr.ptl_ctb_tlr_default_grp.link_ctl.link_ctl_csrbus_read_data[1] = 1'b1;
`endif // GATESIM

`ifdef PEU_GATE
    `PR_NORMAL("fc_top", `NORMAL, "Forcing  program MPY field of PEU Serdes PLL Ctrl Reg to x10 after FIRST FLUSH RESET");
    `PR_NORMAL("fc_top", `NORMAL, "Forcing  Now switch the PEU rate scale from full to half rate FIRST FLUSH RESET");

    force {`PEU.peu_ptl_ctb_tlr_csr_ptl_ctb_tlr_default_grp_serdes_pll_csrbus_read_data_7_,`PEU.peu_ptl_ctb_tlr_csr_ptl_ctb_tlr_default_grp_serdes_pll_csrbus_read_data_6_,`PEU.peu_ptl_ctb_tlr_csr_ptl_ctb_tlr_default_grp_serdes_pll_csrbus_read_data_5_,`PEU.peu_ptl_ctb_tlr_csr_ptl_ctb_tlr_default_grp_serdes_pll_csrbus_read_data_4_,`PEU.peu_ptl_ctb_tlr_csr_ptl_ctb_tlr_default_grp_serdes_pll_csrbus_read_data_3_,`PEU.peu_ptl_ctb_tlr_csr_ptl_ctb_tlr_default_grp_serdes_pll_csrbus_read_data_2_,`PEU.peu_ptl_ctb_tlr_csr_ptl_ctb_tlr_default_grp_serdes_pll_csrbus_read_data_1_,`PEU.peu_ptl_ctb_tlr_csr_ptl_ctb_tlr_default_grp_serdes_pll_csrbus_read_data_0_} = 64'h0000000000000005;
    force {`DMU.ilu_cib_csr_dmu_ilu_cib_default_grp_ilu_diagnos_csrbus_read_data_33_,`DMU.ilu_cib_csr_dmu_ilu_cib_default_grp_ilu_diagnos_csrbus_read_data_32_,`DMU.ilu_cib_csr_dmu_ilu_cib_default_grp_ilu_diagnos_csrbus_read_data_31_,`DMU.ilu_cib_csr_dmu_ilu_cib_default_grp_ilu_diagnos_csrbus_read_data_30_,`DMU.ilu_cib_csr_dmu_ilu_cib_default_grp_ilu_diagnos_csrbus_read_data_29_,`DMU.ilu_cib_csr_dmu_ilu_cib_default_grp_ilu_diagnos_csrbus_read_data_28_,`DMU.ilu_cib_csr_dmu_ilu_cib_default_grp_ilu_diagnos_csrbus_read_data_27_,`DMU.ilu_cib_csr_dmu_ilu_cib_default_grp_ilu_diagnos_csrbus_read_data_26_,`DMU.ilu_cib_csr_dmu_ilu_cib_default_grp_ilu_diagnos_csrbus_read_data_25_,`DMU.ilu_cib_csr_dmu_ilu_cib_default_grp_ilu_diagnos_csrbus_read_data_24_,`DMU.ilu_cib_csr_dmu_ilu_cib_default_grp_ilu_diagnos_csrbus_read_data_23_,`DMU.ilu_cib_csr_dmu_ilu_cib_default_grp_ilu_diagnos_csrbus_read_data_22_,`DMU.ilu_cib_csr_dmu_ilu_cib_default_grp_ilu_diagnos_csrbus_read_data_21_,`DMU.ilu_cib_csr_dmu_ilu_cib_default_grp_ilu_diagnos_csrbus_read_data_20_,`DMU.ilu_cib_csr_dmu_ilu_cib_default_grp_ilu_diagnos_csrbus_read_data_19_,`DMU.ilu_cib_csr_dmu_ilu_cib_default_grp_ilu_diagnos_csrbus_read_data_18_,`DMU.ilu_cib_csr_dmu_ilu_cib_default_grp_ilu_diagnos_csrbus_read_data_17_,`DMU.ilu_cib_csr_dmu_ilu_cib_default_grp_ilu_diagnos_csrbus_read_data_16_,`DMU.ilu_cib_csr_dmu_ilu_cib_default_grp_ilu_diagnos_csrbus_read_data_3_,`DMU.ilu_cib_csr_dmu_ilu_cib_default_grp_ilu_diagnos_csrbus_read_data_2_} = 64'h0000000ffffd;

    //after WRM reset
    @(posedge flush_reset_complete);
    `PR_NORMAL("fc_top", `NORMAL, "Forcing second set of registers after SECOND FLUSH RESET");
    force {`PEU.peu_ptl_ctb_tlr_csr_ptl_ctb_tlr_default_grp_symbol_timer_symbol_timer_0_csr_sw_10_n25,`PEU.peu_ptl_ctb_tlr_csr_ptl_ctb_tlr_default_grp_symbol_timer_symbol_timer_0_csr_sw_9_n25,`PEU.peu_ptl_ctb_tlr_csr_ptl_ctb_tlr_default_grp_symbol_timer_symbol_timer_0_csr_sw_8_n25,`PEU.peu_ptl_ctb_tlr_csr_ptl_ctb_tlr_default_grp_symbol_timer_symbol_timer_0_csr_sw_7_n25,`PEU.peu_ptl_ctb_tlr_csr_ptl_ctb_tlr_default_grp_symbol_timer_symbol_timer_0_csr_sw_6_n25,`PEU.peu_ptl_ctb_tlr_csr_ptl_ctb_tlr_default_grp_symbol_timer_symbol_timer_0_csr_sw_5_n25,`PEU.peu_ptl_ctb_tlr_csr_ptl_ctb_tlr_default_grp_symbol_timer_symbol_timer_0_csr_sw_4_n25,`PEU.peu_ptl_ctb_tlr_csr_ptl_ctb_tlr_default_grp_symbol_timer_symbol_timer_0_csr_sw_3_n25,`PEU.peu_ptl_ctb_tlr_csr_ptl_ctb_tlr_default_grp_symbol_timer_symbol_timer_0_csr_sw_2_n25,`PEU.peu_ptl_ctb_tlr_csr_ptl_ctb_tlr_default_grp_symbol_timer_symbol_timer_0_csr_sw_1_n25,`PEU.peu_ptl_ctb_tlr_csr_ptl_ctb_tlr_default_grp_symbol_timer_symbol_timer_0_csr_sw_0_n25,`PEU.peu_ptl_ctb_tlr_csr_ptl_ctb_tlr_default_grp_symbol_timer_symbol_timer_0_csr_sw_0_n38} = 64'h020;

    // think this is already set to 1 in dtm mode
    //force {`PEU.peu_ptl_ctb_tlr_csr_ptl_ctb_tlr_default_grp_link_ctl_csrbus_read_data_13_,`PEU.peu_ptl_ctb_tlr_csr_ptl_ctb_tlr_default_grp_link_ctl_csrbus_read_data_12_,`PEU.peu_ptl_ctb_tlr_csr_ptl_ctb_tlr_default_grp_link_ctl_csrbus_read_data_3_} = 1'b1;

`endif // PEU_GATE

end  // initial
`endif  // SLAM_VECTORS

`endif //ndef AXIS_TL - make sure all non synthesizeable code goes above this line

endmodule  
//----------------------------------------------------------
`ifdef AXIS_TL
module axis_top;
reg rcc_off;
reg start_dumps;
reg freq_change;
reg in_hw;
initial start_dumps <= 0;
initial rcc_off <= 0;
initial freq_change <= 0;
initial in_hw <= 0;
task task_dump_mem;
begin // axis tbcall_region
`ifdef AXIS_TL
   if (~($axis_rccoff))
     begin
       $axis_exec("$rcc(off);");
     end
   start_dumps <= #1 1;
`endif // AXIS_TL
end
endtask


task task_rcc_off;
begin // axis tbcall_region
`ifdef PALLADIUM
`else
`ifdef AXIS_TL
   if (~($axis_rccoff))
     begin
       $axis_exec("$rcc(off);");
     end
   rcc_off <= #2 1;
`endif // AXIS_TL
`endif // PALLADIUM
end
endtask

task task_change_clk;
begin
   if (~($axis_rccoff))
     begin
       $axis_exec("$rcc(off);");
	in_hw <= 1;
     end
     else in_hw <= 0;
   freq_change<= #1 1;
end
endtask

always @(posedge rcc_off) begin
begin  // axis tbcall_region
`ifdef AXIS_TL
  $axis_exec("$rcc(free);");
  $display("AXIS: $stop at simulation time %0d, returning to cli\n",$time);
  // #2 $finish();
  //rcc_off <= 0;
  $stop;
`endif // AXIS_TL
end
end
`ifndef FAST_AXIS
always @(posedge freq_change) begin // axis tbcall_region
  if ($test$plusargs("SYSCLK_166")) begin
    $display("Setting pll div 2 = %h, sysclock = 166MHz",`CCU.ccu_pll.x1.imaginary_vco_gen
.pll_core.div);
    case(`CCU.ccu_pll.x1.imaginary_vco_gen.pll_core.div)
      6'hf: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,375, 750, 750); // div2 = 8
      //6'h11: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,333, 666 , 666); // div2 = 9
      6'h13: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,300, 600 , 600); // div2 = a
      //6'h15: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,272, 545 , 545); // div2 = b
      6'h17: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,250, 500 , 500); // div2 = c
      //6'h19: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,230, 461 , 461); // div2 = d
      //6'h1b: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,214, 428 , 428); // div2 = e
      6'h1d: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,200, 400 , 400); // div2 = f
      6'h1f: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,187, 375 , 375); // div2 = 10
      //6'h21: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,176, 352 , 352); // div2 = 11
      //6'h23: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,166, 333 , 333); // div2 = 12
      6'h27: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,150, 300 , 300); // div2 = 14
      default: begin // axis tbcall_region
	 $display("Unrecognized/Unsupported pll div 2 setting = %h",`CCU.ccu_pll.x1.imaginary_vco_gen.pll_core.div);
      end
    endcase
  end
  else
  if ($test$plusargs("SYSCLK_133")) begin
    $display("Setting pll div 2 = %h, sysclock = 133MHz",`CCU.ccu_pll.x1.imaginary_vco_gen.pll_core.div);
    case(`CCU.ccu_pll.x1.imaginary_vco_gen.pll_core.div)
      6'hf: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,468, 937, 937); // div2 = 8
      6'h11: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,416, 833 , 833); // div2 = 9
      6'h13: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,375, 750 , 750); // div2 = a
      6'h15: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,340, 681 , 681); // div2 = b
      6'h17: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,312, 625 , 625); // div2 = c
      6'h19: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,288, 577 , 577); // div2 = d
      6'h1b: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,267, 536 , 536); // div2 = e
      6'h1d: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,250, 500 , 500); // div2 = f
      6'h1f: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,231, 461 , 461); // div2 = 10
      6'h21: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,220, 441 , 441); // div2 = 11
      6'h23: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,214, 428 , 428); // div2 = 12
      6'h25: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,197, 394 , 394); // div2 = 12
      6'h27: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,187, 375 , 375); // div2 = 12
      6'h29: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,178, 357 , 357); // div2 = 12
      default: begin // axis tbcall_region
	 $display("Unrecognized pll div 2 setting = %h",`CCU.ccu_pll.x1.imaginary_vco_gen.pll_core.div);
      end
    endcase
  end
  if ($test$plusargs("SYSCLK_DTM_94")) begin
     $display("Setting pll div 2 = %h, sysclock = 94MHz DTM ",`CCU.ccu_pll.x1.imaginary_vco_gen.pll_core.div);
     case(`CCU.ccu_pll.x1.imaginary_vco_gen.pll_core.div)
      6'hf: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,330, 660, 660); // div2 = 7
      6'h15: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,240, 480, 480); // div2 = 10
      6'h1d: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,176, 352, 352); // div2 = 14 
      default: begin // axis tbcall_region
         $display("Unrecognized pll div 2 setting = %h",`CCU.ccu_pll.x1.imaginary_vco_gen.pll_core.div);
      end
    endcase
  end
  else
  begin
    $display("Setting pll div 2 = %h, Default sysclock = 166MHz",`CCU.ccu_pll.x1.imaginary_vco_gen.pll_core.div);
    case(`CCU.ccu_pll.x1.imaginary_vco_gen.pll_core.div)
      6'hf: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,375, 750, 750); // div2 = 8
      6'h13: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,300, 600 , 600); // div2 = a
      6'h17: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,250, 500 , 500); // div2 = c
      6'h1d: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,200, 400 , 400); // div2 = f
      6'h1f: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,187, 375 , 375); // div2 = 10
      6'h27: $axis_set_clkgen("tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2",0,150, 300 , 300); // div2 = 14
      default: begin // axis tbcall_region 
	$display("Unrecognized pll div 2 setting = %h",`CCU.ccu_pll.x1.imaginary_vco_gen.pll_core.div);
      end
    endcase
  end
  if (in_hw) $axis_exec("$rcc(autorun);.;");
  else $axis_exec(".;");
end


always @(posedge freq_change) begin
  freq_change <= #1 0;
end

always @(posedge rcc_off) begin
   rcc_off <= #1 0;
end
always @(posedge start_dumps) begin
  start_dumps <= #1 0;
end
`endif //  `ifndef FAST_AXIS

endmodule // axis_top
`endif //  `ifdef AXIS_TL
