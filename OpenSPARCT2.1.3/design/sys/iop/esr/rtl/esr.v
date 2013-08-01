`timescale 1ns/10ps

module esr (
   // Outputs
   XAUI0_AMUX, XAUI0_TX_N, XAUI0_TX_P, esr_mac_tclk_0, 
   esr_mac_rclk_0, esr_mac_rxd0_0, esr_mac_rxd1_0, esr_mac_rxd2_0, 
   esr_mac_rxd3_0, stciq_0, ststx0_0, ststx1_0, ststx2_0, ststx3_0, 
   stsrx0_0, stsrx1_0, stsrx2_0, stsrx3_0, stspll_0, fdo_0, 
   XAUI1_AMUX, XAUI1_TX_N, XAUI1_TX_P, esr_mac_tclk_1, 
   esr_mac_rclk_1, esr_mac_rxd0_1, esr_mac_rxd1_1, esr_mac_rxd2_1, 
   esr_mac_rxd3_1, stciq_1, ststx0_1, ststx1_1, ststx2_1, ststx3_1, 
   stsrx0_1, stsrx1_1, stsrx2_1, stsrx3_1, stspll_1, fdo_1, 
   esr_atpgq, 
   // Inputs
   XAUI0_REFCLK_N, XAUI0_REFCLK_P, XAUI0_RX_N, XAUI0_RX_P, 
   mac_esr_tclk_0, mac_esr_txd0_0, mac_esr_txd1_0, mac_esr_txd2_0, 
   mac_esr_txd3_0, stcicfg_0, stciclk_0, stcid_0, rxbclkin_0, 
   testclkr_0, testclkt_0, cfgtx0_0, cfgtx1_0, cfgtx2_0, cfgtx3_0, 
   cfgrx0_0, cfgrx1_0, cfgrx2_0, cfgrx3_0, cfgpll_0, testcfg_0, 
   fclk_0, fclrz_0, fdi_0, XAUI1_RX_N, XAUI1_RX_P, mac_esr_tclk_1, 
   mac_esr_txd0_1, mac_esr_txd1_1, mac_esr_txd2_1, mac_esr_txd3_1, 
   stcicfg_1, stciclk_1, stcid_1, rxbclkin_1, testclkr_1, testclkt_1, 
   cfgtx0_1, cfgtx1_1, cfgtx2_1, cfgtx3_1, cfgrx0_1, cfgrx1_1, 
   cfgrx2_1, cfgrx3_1, cfgpll_1, testcfg_1, fclk_1, fclrz_1, fdi_1, 
   tcu_sbs_bsinitclk_0, tcu_sbs_bsinitclk_1, tcu_esr_atpgse_0, 
   tcu_esr_atpgse_1, tcu_esr_atpgmode_0, tcu_esr_atpgmode_1, 
   esr_atpgd, VDDT, VDDA, VDDD, VDDR, VSSA
   );


/* ---------------- serdes_0 ---------------------------------- */
   output                          XAUI0_AMUX;       // PAD
   output [3:0]                    XAUI0_TX_N;       // PAD
   output [3:0]                    XAUI0_TX_P;       // PAD
   input 			   XAUI0_REFCLK_N;   // PAD
   input 			   XAUI0_REFCLK_P;   // PAD
   input [3:0]                     XAUI0_RX_N;       // PAD
   input [3:0]                     XAUI0_RX_P;       // PAD
   output                    	   esr_mac_tclk_0;   // to phy_clock
   output [3:0] 		   esr_mac_rclk_0;   // to phy_clock
   output [9:0] 		   esr_mac_rxd0_0;   // to sphy_dpath
   output [9:0] 		   esr_mac_rxd1_0;   // to sphy_dpath
   output [9:0] 		   esr_mac_rxd2_0;   // to sphy_dpath
   output [9:0] 		   esr_mac_rxd3_0;   // to sphy_dpath
   input [3:0]       		   mac_esr_tclk_0;   // from esr_mac_tclk leaf
   input [9:0] 			   mac_esr_txd0_0;   // from sphy_dpath
   input [9:0] 			   mac_esr_txd1_0;   // from sphy_dpath
   input [9:0] 			   mac_esr_txd2_0;   // from sphy_dpath
   input [9:0] 			   mac_esr_txd3_0;   // from sphy_dpath
   input  [1:0]                    stcicfg_0;        // serial test
   input                           stciclk_0;        // serial test
   input                           stcid_0;          // serial test
   output                          stciq_0;          // serial test
   input [3:0]                     rxbclkin_0;       // rxbclkin_0[3:0] <- esr_mac_rclk_0[3:0] at cpu level
   input 			   testclkr_0;       // from test logic
   input 			   testclkt_0;       // from test logic
   input [19:0] 		   cfgtx0_0;         // from hedwig
   input [19:0] 		   cfgtx1_0;         // from hedwig
   input [19:0] 		   cfgtx2_0;         // from hedwig
   input [19:0] 		   cfgtx3_0;         // from hedwig
   input [27:0] 		   cfgrx0_0;         // from hedwig
   input [27:0] 		   cfgrx1_0;         // from hedwig
   input [27:0] 		   cfgrx2_0;         // from hedwig
   input [27:0] 		   cfgrx3_0;         // from hedwig
   input [11:0] 		   cfgpll_0;         // from hedwig
   input [15:0] 		   testcfg_0;        // from hedwig
   input 			   tcu_sbs_bsinitclk_0;
   input 			   tcu_esr_atpgse_0;     // TESTCFG[19]
   input [2:0] 			   tcu_esr_atpgmode_0;   // TESTCFG[18:16]
   output [3:0] 		   ststx0_0;         // to hedwig
   output [3:0] 		   ststx1_0;         // to hedwig
   output [3:0] 		   ststx2_0;         // to hedwig
   output [3:0] 		   ststx3_0;         // to hedwig
   output [7:0] 		   stsrx0_0;         // to hedwig
   output [7:0] 		   stsrx1_0;         // to hedwig
   output [7:0] 		   stsrx2_0;         // to hedwig
   output [7:0] 		   stsrx3_0;         // to hedwig
   output [3:0] 		   stspll_0;         // to hedwig
   output 			   fdo_0;            // efuse signal
   input 			   fclk_0;           // efuse signal
   input 			   fclrz_0;          // efuse signal
   input 			   fdi_0;            // efuse signal
/* ---------------- serdes_1 ---------------------------------- */
   output                          XAUI1_AMUX;       // PAD
   output [3:0]                    XAUI1_TX_N;       // PAD
   output [3:0]                    XAUI1_TX_P;       // PAD
   input [3:0]                     XAUI1_RX_N;       // PAD
   input [3:0]                     XAUI1_RX_P;       // PAD
   output               	   esr_mac_tclk_1;   // to phy_clock
   output [3:0] 		   esr_mac_rclk_1;   // to phy_clock
   output [9:0] 		   esr_mac_rxd0_1;   // to sphy_dpath
   output [9:0] 		   esr_mac_rxd1_1;   // to sphy_dpath
   output [9:0] 		   esr_mac_rxd2_1;   // to sphy_dpath
   output [9:0] 		   esr_mac_rxd3_1;   // to sphy_dpath
   input [3:0]       		   mac_esr_tclk_1;   // from esr_mac_tclk leaf
   input [9:0] 			   mac_esr_txd0_1;   // from sphy_dpath
   input [9:0] 			   mac_esr_txd1_1;   // from sphy_dpath
   input [9:0] 			   mac_esr_txd2_1;   // from sphy_dpath
   input [9:0] 			   mac_esr_txd3_1;   // from sphy_dpath
   input  [1:0]                    stcicfg_1;        // serial test
   input                           stciclk_1;        // serial test
   input                           stcid_1;          // serial test
   output                          stciq_1;          // serial test
   input [3:0]                     rxbclkin_1;       // rxbclkin_1[3:0] <- esr_mac_rclk_1[3:0] at cpu level
   input 			   testclkr_1;       // from test logic
   input 			   testclkt_1;       // from test logic
   input [19:0] 		   cfgtx0_1;         // from hedwig
   input [19:0] 		   cfgtx1_1;         // from hedwig
   input [19:0] 		   cfgtx2_1;         // from hedwig
   input [19:0] 		   cfgtx3_1;         // from hedwig
   input [27:0] 		   cfgrx0_1;         // from hedwig
   input [27:0] 		   cfgrx1_1;         // from hedwig
   input [27:0] 		   cfgrx2_1;         // from hedwig
   input [27:0] 		   cfgrx3_1;         // from hedwig
   input [11:0] 		   cfgpll_1;         // from hedwig
   input [15:0] 		   testcfg_1;        // from hedwig
   input 			   tcu_sbs_bsinitclk_1;
   input 			   tcu_esr_atpgse_1;     // TESTCFG[19]
   input [2:0] 			   tcu_esr_atpgmode_1;   // TESTCFG[18:16]
   output [3:0] 		   ststx0_1;         // to hedwig
   output [3:0] 		   ststx1_1;         // to hedwig
   output [3:0] 		   ststx2_1;         // to hedwig
   output [3:0] 		   ststx3_1;         // to hedwig
   output [7:0] 		   stsrx0_1;         // to hedwig
   output [7:0] 		   stsrx1_1;         // to hedwig
   output [7:0] 		   stsrx2_1;         // to hedwig
   output [7:0] 		   stsrx3_1;         // to hedwig
   output [3:0] 		   stspll_1;         // to hedwig
   output 			   fdo_1;            // efuse signal
   input 			   fclk_1;           // efuse signal
   input 			   fclrz_1;          // efuse signal
   input 			   fdi_1;            // efuse signal
/* ---------------- common signals ---------------------------- */   
   input 			   esr_atpgd;            // ATPG M  D_in
   output 			   esr_atpgq;            // ATPG TX Q_out
   // vlint flag_input_port_not_connected off
   input 			   VDDT;     // floating VDD. 
   input 			   VDDA;     // floating VDD. 
   input 			   VDDD;     // floating VDD.
   input 			   VDDR;     // floating VDD. 
   input 			   VSSA;     // floating VSS. 
   // vlint flag_input_port_not_connected on

   
   wire [3:0] 			   XAUI0_TX_N;
   wire [3:0] 			   XAUI0_TX_P;
   wire [3:0] 			   XAUI0_RX_N;
   wire [3:0] 			   XAUI0_RX_P;
   wire [3:0] 			   XAUI1_TX_N;
   wire [3:0] 			   XAUI1_TX_P;
   wire [3:0] 			   XAUI1_RX_N;
   wire [3:0] 			   XAUI1_RX_P;

                                   // ATPG signals
                                   // _s0 means serdes0, _s1 means serdes1
                                   // naming rule: source_destination_serdes#
                                   // example: rb3_rb2_s0 means rx bit 3 to rx bit2 in serdes 0
   wire 			   atpgm_tb2_s0;
   wire 			   rb3_rb0_s1,rb2_tb3_s0,rb1_tb1_s0,rb0_tb0_s0;
   wire 			   tb3_rb3_s0,tb2_rb2_s0,tb1_atpgm_s0,tb0_rb1_s0;
   wire 			   atpgm_tb2_s1;
   wire 			              rb2_tb3_s1,rb1_tb1_s1,rb0_tb0_s1;
   wire 			   tb3_rb3_s1,tb2_rb2_s1,tb1_atpgm_s1,tb0_rb1_s1;
   
   
   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   wire [1:0]                      rdll0_0;          // for ti only.
   wire [1:0]                      rdll1_0;          // for ti only.
   wire [1:0]                      rdll2_0;          // for ti only.
   wire [1:0]                      rdll3_0;          // for ti only.
   wire [3:0]                      rxbclklln_0;      // for ti only.
   wire [3:0]                      rxbclkllp_0;      // for ti only.
   wire [1:0]                      rdll0_1;          // for ti only.
   wire [1:0]                      rdll1_1;          // for ti only.
   wire [1:0]                      rdll2_1;          // for ti only.
   wire [1:0]                      rdll3_1;          // for ti only.
   wire [3:0]                      rxbclklln_1;      // for ti only.
   wire [3:0]                      rxbclkllp_1;      // for ti only.
   wire 			   y;                // single ended. let it float.
   wire 			   txbclk3_0,txbclk2_0,txbclk1_0;
   wire 			   txbclk3_1,txbclk2_1,txbclk1_1;
   // vlint flag_net_has_no_load on
   // vlint flag_dangling_net_within_module on

                                   // LJCB & RCD signals
   wire 			   clkxaui;
   wire 			   clkxauix;
   wire 			   clkxaui_b_31;
   wire 			   clkxaui_b_31x;
   wire 			   clkxaui_b_29;
   wire 			   clkxaui_b_29x;
   
   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   // vlint flag_input_port_not_connected off
   wire  			   VDDT;     // floating VDD. 
   wire  			   VDDA;     // floating VDD. 
   wire  			   VDDD;     // floating VDD. 
   wire  			   VDDR;     // floating VDD.
   wire  			   VSSA;     // floating VDD. 
   // vlint flag_input_port_not_connected on
   // vlint flag_net_has_no_load on
   // vlint flag_dangling_net_within_module on
   
wire       xaui_clk;
clock_multiplier_10x clock_multiplier_10x  (tb_top.cpu.XAUI0_REFCLK_P, xaui_clk);

reg	f_clk[3:0]; // fake clocks

always @(posedge xaui_clk) begin
  f_clk[0] <= tb_top.cpu.XAUI0_REFCLK_P;
  f_clk[1] <= f_clk[0];
  f_clk[2] <= f_clk[1];
  f_clk[3] <= f_clk[2];
end

assign esr_mac_tclk_0 = f_clk[3];
assign esr_mac_tclk_1 = f_clk[3];
assign esr_mac_rclk_0 = {4{f_clk[1]}}; 
assign esr_mac_rclk_1 = {4{f_clk[1]}}; 

assign stspll_0 = 4'b0001;
assign stspll_1 = 4'b0001;

assign ststx0_0 = 4'b0;
assign ststx1_0 = 4'b0;
assign ststx2_0 = 4'b0;
assign ststx3_0 = 4'b0;
assign stsrx0_0 = 8'b0;
assign stsrx1_0 = 8'b0;
assign stsrx2_0 = 8'b0;
assign stsrx3_0 = 8'b0;


assign ststx0_1 = 4'b0;
assign ststx1_1 = 4'b0;
assign ststx2_1 = 4'b0;
assign ststx3_1 = 4'b0;
assign stsrx0_1 = 8'b0;
assign stsrx1_1 = 8'b0;
assign stsrx2_1 = 8'b0;
assign stsrx3_1 = 8'b0;

xaui_port esr_0 (
.XAUI_AMUX      (XAUI0_AMUX),
.XAUI_RX_N      ({XAUI0_RX_N[3],XAUI0_RX_N[2],XAUI0_RX_N[1],XAUI0_RX_N[0]}),
.XAUI_RX_P      ({XAUI0_RX_P[3],XAUI0_RX_P[2],XAUI0_RX_P[1],XAUI0_RX_P[0]}),
.XAUI_TX_N      ({XAUI0_TX_N[3],XAUI0_TX_N[2],XAUI0_TX_N[1],XAUI0_TX_N[0]}),
.XAUI_TX_P      ({XAUI0_TX_P[3],XAUI0_TX_P[2],XAUI0_TX_P[1],XAUI0_TX_P[0]}),
        .esr_mac_rxd0   (esr_mac_rxd0_0[9:0]),
        .esr_mac_rxd1   (esr_mac_rxd1_0[9:0]),
        .esr_mac_rxd2   (esr_mac_rxd2_0[9:0]),
        .esr_mac_rxd3   (esr_mac_rxd3_0[9:0]),
        .mac_esr_txd0   (mac_esr_txd0_0[9:0]),
        .mac_esr_txd1   (mac_esr_txd1_0[9:0]),
        .mac_esr_txd2   (mac_esr_txd2_0[9:0]),
        .mac_esr_txd3   (mac_esr_txd3_0[9:0]),
        .xaui_clk       (xaui_clk),
        .mac_clk        (tb_top.cpu.XAUI0_REFCLK_P),
        .reset          (~tb_top.cpu.n2_clk_gl_cust.gl_rst_mac_c1b)    );


xaui_port esr_1 (
.XAUI_AMUX      (XAUI1_AMUX),
.XAUI_RX_N      ({XAUI1_RX_N[3],XAUI1_RX_N[2],XAUI1_RX_N[1],XAUI1_RX_N[0]}),
.XAUI_RX_P      ({XAUI1_RX_P[3],XAUI1_RX_P[2],XAUI1_RX_P[1],XAUI1_RX_P[0]}),
.XAUI_TX_N      ({XAUI1_TX_N[3],XAUI1_TX_N[2],XAUI1_TX_N[1],XAUI1_TX_N[0]}),
.XAUI_TX_P      ({XAUI1_TX_P[3],XAUI1_TX_P[2],XAUI1_TX_P[1],XAUI1_TX_P[0]}),
        .esr_mac_rxd0   (esr_mac_rxd0_1[9:0]),
        .esr_mac_rxd1   (esr_mac_rxd1_1[9:0]),
        .esr_mac_rxd2   (esr_mac_rxd2_1[9:0]),
        .esr_mac_rxd3   (esr_mac_rxd3_1[9:0]),
        .mac_esr_txd0   (mac_esr_txd0_1[9:0]),
        .mac_esr_txd1   (mac_esr_txd1_1[9:0]),
        .mac_esr_txd2   (mac_esr_txd2_1[9:0]),
        .mac_esr_txd3   (mac_esr_txd3_1[9:0]),
        .xaui_clk       (xaui_clk),
        .mac_clk        (tb_top.cpu.XAUI0_REFCLK_P),
        .reset          (~tb_top.cpu.n2_clk_gl_cust.gl_rst_mac_c1b)    );




// -------------- RCD instantiation --------------
// RCD Reference Clock Distribution 
U0 RCD_U0
  (
   // Outputs
   .clkxaui_b_31			(clkxaui_b_31),   // P. serdes0 left-hand side
   .clkxaui_b_31x			(clkxaui_b_31x),  // N. serdes0 left-hand side
   .clkxaui_b_29			(clkxaui_b_29),   // P. serdes1 right-hand side
   .clkxaui_b_29x			(clkxaui_b_29x),  // N. serdes1 right-hand side
   // Inputs
   .clkxaui				(clkxaui),
   .clkxauix				(clkxauix),
   .clkxaui_pwrdn			(1'b0));

// -------------- LJCB instantiation --------------
U1 LJCB_U1
  (
   // Outputs
   .y					(y),        // Single ended. let it float.
   .yn					(clkxauix),
   .yp					(clkxaui),
   // Inputs
   .padn				(XAUI0_REFCLK_N),
   .pad 				(XAUI0_REFCLK_P),
   .pwrdn				(1'b0),
   .pwrdnse                             (1'b1));

  
endmodule // esr

/*******************************************************************************************/

`timescale 1 ns / 1 ps
module U1(padn, pad, pwrdn, pwrdnse, y, yn, yp);

	input			padn;
	input			pad;
	input			pwrdn;
	input			pwrdnse;
	output			y;
	output			yn;
	output			yp;

	wire			pad_ne_padn;
	wire			pad_net;
	wire			padn_net;
	wire			yn_tmp;
	wire			ynn_tmp;

	specify
	endspecify

	xor ti_xor_pri0(pad_ne_padn, pad, padn);
	bufif1 ti_buf_pri1(pad_net, pad, pad_ne_padn);
	bufif1 ti_buf_pri2(padn_net, padn, pad_ne_padn);
	or #(0)  ti_or2_pri3(yp, pwrdn, pad_net);
	or ti_or2_pri4(yn_tmp, pwrdn, padn_net);
	buf #(0)  ti_buf_pri5(yn, yn_tmp);
	or ti_or2_pri7(ynn_tmp, pwrdnse, yn_tmp);
	not #(0)  ti_not_pri6(y, ynn_tmp);
endmodule


module U0 (clkxaui_b_31, clkxaui_b_31x, clkxaui_b_29, clkxaui_b_29x, clkxaui, clkxauix, clkxaui_pwrdn);

	output			clkxaui_b_31;
	output			clkxaui_b_31x;
	output			clkxaui_b_29;
	output			clkxaui_b_29x;
	input			clkxaui;
	input			clkxauix;
	input			clkxaui_pwrdn;

	wire			vdq_bottom2_1;
	wire			cmlbias1_34p0;
	wire			clkxaui_bb_3;
	wire			clkxaui_bb_3x;
	wire			pwrdnxaui_bb_3;
	wire			cmlbias1_38p5;
	wire			clkxaui_bb_4;
	wire			clkxaui_bb_4x;
	wire			pwrdnxaui_bb_4;
	wire			cmlbias1_42p0;
	wire			ninv_xaui_bb_3_pwrdnx;
	wire			ninv_xaui_bb_4_pwrdnx;

	not esr_out_ninv_xaui_b_31(clkxaui_b_31, clkxaui_bb_3x);
	not esr_clkxaui_b_31x(clkxaui_b_31x, clkxaui_bb_3);
	or esr_ninv_xaui_bb_3(clkxaui_bb_3, clkxaui_pwrdn, clkxaui);
	or esr_clkxaui_bb_3x(clkxaui_bb_3x, clkxaui_pwrdn, clkxauix);
	not esr_ninv_xaui_bb_3_pwrdnx(ninv_xaui_bb_3_pwrdnx, clkxaui_pwrdn);
	not esr_pwrdnxaui_bb_3(pwrdnxaui_bb_3, ninv_xaui_bb_3_pwrdnx);
	or esr_ninv_xaui_bb_4(clkxaui_bb_4, clkxaui_pwrdn, clkxaui);
	or esr_clkxaui_bb_4x(clkxaui_bb_4x, clkxaui_pwrdn, clkxauix);
	not esr_ninv_xaui_bb_4_pwrdnx(ninv_xaui_bb_4_pwrdnx, clkxaui_pwrdn);
	not esr_pwrdnxaui_bb_4(pwrdnxaui_bb_4, ninv_xaui_bb_4_pwrdnx);
	not esr_out_ninv_xaui_b_29(clkxaui_b_29, clkxaui_bb_4x);
	not esr_clkxaui_b_29x(clkxaui_b_29x, clkxaui_bb_4);
endmodule

