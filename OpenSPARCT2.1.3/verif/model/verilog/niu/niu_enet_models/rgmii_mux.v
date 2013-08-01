// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: rgmii_mux.v
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
module rgmii_mux(txclk, 
                tx_config, 
                txd0_d4, 
                txd1_d5, 
                txd2_d6, 
                txd3_d7, 
                txen_er,
		rxclk, 
                rx_config, 
                rxd0_d4, 
                rxd1_d5, 
                rxd2_d6, 
                rxd3_d7, 
                rxer_dv,
		txd, 
                txen, 
                txer, 
                rxd, 
                rxdv, 
                rxer);

input		txclk;
input [3:0]	tx_config;
input   	txd0_d4, txd1_d5, txd2_d6, txd3_d7;
input   	txen_er;
output	[7:0]	txd;
output		txen, txer;

input		rxclk;
input [3:0]	rx_config;
output          rxd0_d4, rxd1_d5, rxd2_d6,rxd3_d7;
output          rxer_dv;
input	[7:0]	rxd;
input		rxdv, rxer;


reg	[3:0]	txd_r;
reg	[3:0]	txd_f;
reg		txen_r;
reg		txen, txer;


reg  	        rxd0_d4, rxd1_d5, rxd2_d6,rxd3_d7;
reg    	        rxer_dv;

//wire		rxer_dv;


// ----- TX negedge register -----


   always @(negedge txclk)
     begin
      //if (tx_config[3:0] == 4'b0011) 
       // begin
	txd_f[3] <= #0.5 txd3_d7;
	txd_f[2] <= #0.5 txd2_d6;
	txd_f[1] <= #0.5 txd1_d5;
	txd_f[0] <= #0.5 txd0_d4;
	txen_r   <= #0.5 txen_er;
        //end
     end

always @(posedge txclk)
   begin
	txd_r[3:0]   <= #0.5 {txd3_d7, txd2_d6, txd1_d5,txd0_d4};
	txen  <= #0.5 txen_er;
	txer  <= #0.5 txen_r;
   end

  assign txd[7:0] = {txd_f[3:0],txd_r[3:0]};


always @(negedge rxclk)
//always @(posedge rxclk)
  begin
       rxd0_d4 <= #0.5 rxd[0];
       rxd1_d5 <= #0.5 rxd[1];
       rxd2_d6 <= #0.5 rxd[2];
       rxd3_d7 <= #0.5 rxd[3];
       rxer_dv <= #0.5 rxdv;

  end

//always @(negedge rxclk)
always @(posedge rxclk)
  begin
       rxd0_d4 <= #0.5 rxd[4];
       rxd1_d5 <= #0.5 rxd[5];
       rxd2_d6 <= #0.5 rxd[6];
       rxd3_d7 <= #0.5 rxd[7];
       rxer_dv <= #0.5 rxer;

  end

// ----- RX Mux ----- 
/**
assign #0.5 {rxd0_d4, rxd1_d5, rxd2_d6, rxd3_d7, rxer_dv} = (rxclk==1)		?
					{rxd[4],rxd[5], rxd[6],rxd[7], rxer}  :
					{rxd[0], rxd[1],rxd[2],rxd[3], rxdv};  	

assign #0.0 {rxd0_d4, rxd1_d5, rxd2_d6, rxd3_d7, rxer_dv} = (rxclk==1)		?
					{rxd[4],rxd[5], rxd[6],rxd[7], rxer}  :
					{rxd[0], rxd[1],rxd[2],rxd[3], rxdv};  	

***************************/
endmodule

