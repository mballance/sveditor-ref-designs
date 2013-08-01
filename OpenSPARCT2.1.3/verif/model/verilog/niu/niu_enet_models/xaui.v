
module clock_multiplier_10x(refclk, clk);
input refclk;
output clk;
reg clk;

reg clk_;

integer old_time;
integer count;

always @(clk_) 
  clk = #1 clk_;

integer period, first_half, second_half;
initial begin
  period = 10000;
  first_half = 5000;
  second_half = 5000;
end

initial clk_ = 0;
initial count = 0;

always @(posedge clk_) begin
  clk_ = #first_half ~clk_;
end

always @(negedge clk_) begin
  if(count == 2)
    clk_ = #second_half ~clk_;
end

always @(period) begin
  first_half = period / 2;
  second_half = period - first_half;
end

always @(posedge refclk) begin
  if(count < 2) count = count + 1;
  if(count == 2) begin
     period = ($time - old_time) / 10;
     clk_ = 1;
  end
  old_time = $time;
end

endmodule


module xaui_port (
  XAUI_RX_N,
  XAUI_RX_P,
  xaui_clk,
  mac_clk,
  reset,
  XAUI_AMUX,
  XAUI_TX_N,
  XAUI_TX_P,
  esr_mac_rxd0,
  esr_mac_rxd1,
  esr_mac_rxd2,
  esr_mac_rxd3,
  mac_esr_txd0,
  mac_esr_txd1,
  mac_esr_txd2,
  mac_esr_txd3);

input	[3:0]	XAUI_RX_N;
input	[3:0]	XAUI_RX_P;

input		xaui_clk;
input		mac_clk;
input		reset;

output		XAUI_AMUX;
output	[3:0]	XAUI_TX_N;
output	[3:0]	XAUI_TX_P;

output	[9:0]	esr_mac_rxd0;
output	[9:0]	esr_mac_rxd1;
output	[9:0]	esr_mac_rxd2;
output	[9:0]	esr_mac_rxd3;

input	[9:0]	mac_esr_txd0;
input	[9:0]	mac_esr_txd1;
input	[9:0]	mac_esr_txd2;
input	[9:0]	mac_esr_txd3;


reg		XAUI_AMUX;
reg	[3:0]	XAUI_TX_N;
reg	[3:0]	XAUI_TX_P;

reg	[9:0]	esr_mac_rxd0;
reg	[9:0]	esr_mac_rxd1;
reg	[9:0]	esr_mac_rxd2;
reg	[9:0]	esr_mac_rxd3;

reg	[6:0]	xaui_comma0;
reg	[6:0]	xaui_comma1;
reg	[6:0]	xaui_comma2;
reg	[6:0]	xaui_comma3;

reg	[3:0]	xaui_count0, xaui_count1, xaui_count2, xaui_count3;
reg	[3:0]	xaui_serdes_count;

reg	[9:0]	mac_esr_tx0, mac_esr_tx1, mac_esr_tx2, mac_esr_tx3;
reg	[9:0]	esr_mac_rx_l0, esr_mac_rx_l1, esr_mac_rx_l2, esr_mac_rx_l3;
reg	[9:0]	esr_mac_rx0, esr_mac_rx1, esr_mac_rx2, esr_mac_rx3;
reg		reset_sync;

wire	[3:0]	tx;

initial begin
  xaui_count0 = 0;
  xaui_count1 = 0;
  xaui_count2 = 0;
  xaui_count3 = 0;
end

always @(posedge mac_clk) begin
  mac_esr_tx0 <= mac_esr_txd0;
  mac_esr_tx1 <= mac_esr_txd1;
  mac_esr_tx2 <= mac_esr_txd2;
  mac_esr_tx3 <= mac_esr_txd3;
  reset_sync <= reset;
end

always @(posedge mac_clk) begin
  esr_mac_rxd0 <= esr_mac_rx_l0;
  esr_mac_rxd1 <= esr_mac_rx_l1;
  esr_mac_rxd2 <= esr_mac_rx_l2;
  esr_mac_rxd3 <= esr_mac_rx_l3;
end

assign tx[0] = mac_esr_tx0[9 - xaui_serdes_count];
assign tx[1] = mac_esr_tx1[9 - xaui_serdes_count];
assign tx[2] = mac_esr_tx2[9 - xaui_serdes_count];
assign tx[3] = mac_esr_tx3[9 - xaui_serdes_count];

always @(posedge xaui_clk) begin
  XAUI_AMUX <= 1'b0;
  if(reset_sync) begin
    XAUI_TX_P <= 4'b0000;
    XAUI_TX_N <= 4'b1111;
    xaui_serdes_count = 0;
  end else begin
    XAUI_TX_P <= tx;
    XAUI_TX_N <= ~tx;
    xaui_serdes_count <= (xaui_serdes_count + 1) % 10;
  end
end


always @(negedge xaui_clk) begin
  if(reset_sync) begin
    xaui_comma0 <= 7'b0;
    xaui_comma1 <= 7'b0;
    xaui_comma2 <= 7'b0;
    xaui_comma3 <= 7'b0;
    xaui_count0 <= 0; 
    xaui_count1 <= 0;
    xaui_count2 <= 0;
    xaui_count3 <= 0;
  end else begin
  
    xaui_comma0[6:0] <= {xaui_comma0[5:0], XAUI_RX_P[0]};
    xaui_comma1[6:0] <= {xaui_comma1[5:0], XAUI_RX_P[1]};
    xaui_comma2[6:0] <= {xaui_comma2[5:0], XAUI_RX_P[2]};
    xaui_comma3[6:0] <= {xaui_comma3[5:0], XAUI_RX_P[3]};
  
    esr_mac_rx0[9 - xaui_count0] <= XAUI_RX_P[0];
    esr_mac_rx1[9 - xaui_count1] <= XAUI_RX_P[1];
    esr_mac_rx2[9 - xaui_count2] <= XAUI_RX_P[2];
    esr_mac_rx3[9 - xaui_count3] <= XAUI_RX_P[3];

    if(xaui_count0 == 9) esr_mac_rx_l0 <= {esr_mac_rx0[9:1],XAUI_RX_P[0]};
    if(xaui_count1 == 9) esr_mac_rx_l1 <= {esr_mac_rx1[9:1],XAUI_RX_P[1]};
    if(xaui_count2 == 9) esr_mac_rx_l2 <= {esr_mac_rx2[9:1],XAUI_RX_P[2]};
    if(xaui_count3 == 9) esr_mac_rx_l3 <= {esr_mac_rx3[9:1],XAUI_RX_P[3]};
  
    if(xaui_comma0 == 7'b0011111) begin
      xaui_count0 <= 8;
    end else begin
      xaui_count0 <= (xaui_count0 + 1) % 10;
    end
    if(xaui_comma1 == 7'b0011111) begin
      xaui_count1 <= 8;
    end else begin
      xaui_count1 <= (xaui_count1 + 1) % 10;
    end
    if(xaui_comma2 == 7'b0011111) begin
      xaui_count2 <= 8;
    end else begin
      xaui_count2 <= (xaui_count2 + 1) % 10;
    end
    if(xaui_comma3 == 7'b0011111) begin
      xaui_count3 <= 8;
    end else begin
      xaui_count3 <= (xaui_count3 + 1) % 10;
    end
  end
end
  
endmodule

