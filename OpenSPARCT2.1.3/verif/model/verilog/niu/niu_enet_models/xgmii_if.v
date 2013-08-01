// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xgmii_if.v
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
module xgmii_if    ( rxd,
                     rxdv,
                     rx_clk,
                     rx_clk_xgmii,
                     rxd_xgmii,
                     rxctrl_xgmii,
                     txd_xgmii,
                     txctrl_xgmii, 
                     tx_clk,
                     tx_clk_xgmii,
                     txd,
                     txen
                   );
   
input [7:0]  rxd; 
input        rxdv;

input        rx_clk;

input [31:0]  txd_xgmii; 
input [3:0]   txctrl_xgmii;

input        tx_clk;

output        rx_clk_xgmii;
output [31:0] rxd_xgmii;
output [3:0]  rxctrl_xgmii;

output         tx_clk_xgmii;
output [7:0] txd;
output       txen;

reg [31:0] rxd_int;
reg [31:0] rxd_xgmii_reg;
reg [31:0] rxd_xgmii_int;


reg[3:0]   rx_ctrl_int;
reg[3:0]   rx_ctrl_xgmii_reg;
reg[3:0]   rx_ctrl_xgmii_int;

reg rx_clk_xgmii_int;
reg tx_clk_xgmii_int;

wire rx_clk_int;
wire rx_clk_xgmii_reg;

wire FB_DETECT;


reg tx_clk_int;

reg [31:0]  txd_xgmii_d; 
reg [3:0]   txctrl_xgmii_d;
reg [31:0]  txd_xgmii_d1; 
reg [3:0]   txctrl_xgmii_d1;

parameter term_cnttx =3; 
parameter term_cntrx =3; 

reg [3:0] cntrx;

reg [3:0] cnttx;

reg [7:0] txd;
reg       txen;
reg       trig;
reg       trig1;

reg [7:0]  rxd_d; 
reg        rxdv_d;
reg [7:0]  rxd_d1; 
reg        rxdv_d1;

reg reset_cnttx;
reg reset_cnttx_d;
reg reset_cntrx;
reg reset_cntrx_d;
reg start_cnt;
   
initial
  begin
    rx_clk_xgmii_int = 1'b1;
    tx_clk_xgmii_int = 1'b0;
    cntrx = 4'b0001;
    cnttx = 4'b0001;
    rxd_int = 32'h0000_0000;
    rxd_xgmii_int = 32'h0000_0000;
    rx_ctrl_xgmii_int = 4'hF;
    rx_ctrl_int = 4'hF;
    reset_cntrx = 0;
    reset_cntrx_d = 0;
    start_cnt=0;
  end

assign tx_clk_xgmii = tx_clk_int;
assign #300 rx_clk_int   = rx_clk;
assign #150 rx_clk_xgmii = rx_clk_xgmii_int;
assign #170 rx_clk_xgmii_reg = rx_clk_xgmii_int;

assign #0.0 rxd_xgmii    = rxd_xgmii_reg;
assign #0.0 rxctrl_xgmii = rx_ctrl_xgmii_reg;

always #400 rx_clk_xgmii_int = ~rx_clk_xgmii_int;
always #400 tx_clk_xgmii_int = ~tx_clk_xgmii_int;

   always @(posedge rx_clk)
     begin
	if (FB_DETECT)
	  start_cnt <= 1'b1;
	else
	  start_cnt <= start_cnt;
     end
	
   always @(posedge rx_clk ) 
     begin
     	if((FB_DETECT) && (start_cnt==0))
	  cnttx[3:0] <= 4'b1000;
      	else 
	  cnttx[3:0] <= {cnttx[2:0],cnttx[3]};
	//else
	//  cnttx[3:0] <= cnttx[3:0];
     end

   always @(posedge rx_clk_xgmii_reg)
     begin   
  	rxd_xgmii_reg  <= rxd_xgmii_int;
  	rx_ctrl_xgmii_reg  <= rx_ctrl_xgmii_int;
     end

always @ (posedge rx_clk )
  begin
	  rxd_d <= rxd;
	  rxdv_d <= rxdv;
	  rxd_d1 <= rxd_d;
	  rxdv_d1 <= rxdv_d;
  end

assign FB_DETECT = (rxd == 8'hFB)? 1'b1:1'b0;

always @ (posedge rx_clk )
  begin
   case (cnttx)
        4'b0001 :  
          begin
                 rxd_int[7:0]  <= rxd_d1;
		 rx_ctrl_int[0] <= rxdv_d1;
	  end	
        4'b0010 :  
                 begin
                 rxd_int[15:8]  <= rxd_d1;
		 rx_ctrl_int[1] <= rxdv_d1;
                 end
        4'b0100 :  
                 begin
                 rxd_int[23:16]  <= rxd_d1;
		 rx_ctrl_int[2] <= rxdv_d1;
                 end
        4'b1000 :  
                 begin
                 rxd_int[31:24]  <= rxd_d1;
		 rx_ctrl_int[3] <= rxdv_d1;
                 end
    endcase

    if(cnttx== 4'b0001) begin
      rxd_xgmii_int <= rxd_int;
      rx_ctrl_xgmii_int <= rx_ctrl_int; 
     	
    end

  end

/*----------------------------------------------------------------------- */

always@(tx_clk)
	#1 tx_clk_int = tx_clk;

reg [1:0] cur_state;
reg [1:0] nxt_state;
reg  trig2;

parameter 
    SFD = 2'b00,
    CNT1 = 2'b01,
    CNT2 = 2'b10,
    CNT3 = 2'b11;


always @(cur_state or trig1)
  begin
              trig2 =1'b0;
    case(cur_state)
      SFD:
          if (trig1 ==1'b1)
              begin
              trig2 =1'b1;
              nxt_state = CNT1;
              end
      CNT1: 
              begin
              trig2 =1'b0;
              nxt_state = CNT2;
              end
      CNT2: 
              begin
              trig2 =1'b0;
              nxt_state = CNT3;
              end
      CNT3: 
              begin
              trig2 =1'b0;
              nxt_state = SFD;
              end
      default: nxt_state = SFD;

    endcase
  end

always @(posedge tx_clk)
 cur_state <= nxt_state;

always @(posedge tx_clk)
  begin
    if ( (txd_xgmii == 32'h5555_55FB) && (txctrl_xgmii == 1'h1) )
       begin
         trig1 = 1;
         #700 trig1 = 0;
       end
    else
        trig1 = 0;
  end

always @(posedge tx_clk )
  begin
	  txctrl_xgmii_d <= txctrl_xgmii;
	  txctrl_xgmii_d1 <= txctrl_xgmii_d;
	  txd_xgmii_d <= txd_xgmii;
	  txd_xgmii_d1 <= txd_xgmii_d;

  end
always @(posedge tx_clk )
  begin
  reset_cntrx <= (txd_xgmii == 32'h5555_55FB) && (txctrl_xgmii == 1'h1);
  reset_cntrx_d <= reset_cntrx;
  if(reset_cntrx &~ reset_cntrx_d)
    cntrx[3:0] <= 4'h1;
  else   
    cntrx[3:0] <= {cntrx[2:0],cntrx[3]};
  end
always @(posedge tx_clk )
  begin
	case(cntrx) 
		4'b0001: begin txd <= txd_xgmii_d1[7:0]; txen <= txctrl_xgmii_d1[0]; end
		4'b0010: begin txd <= txd_xgmii_d1[15:8]; txen <= txctrl_xgmii_d1[1]; end
		4'b0100: begin txd <= txd_xgmii_d1[23:16]; txen <= txctrl_xgmii_d1[2]; end
		4'b1000: begin txd <= txd_xgmii_d1[31:24]; txen <= txctrl_xgmii_d1[3]; end
	
	endcase
  end

endmodule

