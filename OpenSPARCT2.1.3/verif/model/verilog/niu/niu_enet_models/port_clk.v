// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: port_clk.v
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
`timescale 1ns/10ps

`define RX_CLK_SKEW 1
`define TX_CLK_SKEW 1

`include "neptune_defines.h"

module port_clk( tx_clkp, 
                 tx_clkn, 
                 rx_clkp, 
                 rx_clkn, 
                 tx_config, 
                 rx_config);

   output tx_clkp, tx_clkn;
   output rx_clkp, rx_clkn;

   input [3:0] tx_config, rx_config;

   
   reg [3:0]   old_tx_config, old_rx_config;
   reg 	       rx_clkp;
   reg 	       tx_clkp_int ;


   reg [2:0]   skew;
   reg [2:0]   org_skew;
   real        tx_cycle;
   real        rx_cycle;
   
   //assign #7 tx_clkp =  tx_clkp_int; 
   //assign #3 tx_clkp =  rx_clkp; 
   assign #3 tx_clkp =  rx_clkn; 
   initial 
     begin
        old_tx_config = 0;
     	#5 old_tx_config = tx_config;
     end
   initial 
     begin
        old_rx_config = 0;
     	#5 old_rx_config = rx_config;
     end
   initial	
     begin
	tx_clkp_int = 0;
	rx_clkp = 0;
 	skew = 1;
 	org_skew = skew;
     end
   
   parameter txdelay_0 = 400, // Clock period for 10MBS (2.5Mhz)
             txdelay_1 = 200, // Clock period for 10MBS (2.5Mhz)
             txdelay_2 = 20, // Clock period for 100MBS (25 Mhz)
             txdelay_3 = 4, // Clock period for 1000MBS (125 Mhz)
             txdelay_4 = 0.4; // Clock period for 10GBS (156.25 Mhz)
   
   parameter rxdelay_0 = 400, // Clock period for 10MBS (2.5 Mhz)
             rxdelay_1 = 200, // Clock period for 10MBS (2.5 Mhz)
	     rxdelay_2 = 20, // Clock period for 100MBS (25 Mhz)
	     rxdelay_3 = 4, // Clock period for 1000MBS (125 Mhz)
	     rxdelay_4 = 0.4; // Clock period for 10GBS (156.25 Mhz)
   
   assign    tx_clkn = ~tx_clkp_int;
   assign    rx_clkn = ~rx_clkp;
   
   always
     begin
	#0;
	case(tx_config)
	  0: tx_cycle = txdelay_0;
	  1: tx_cycle = txdelay_1;
	  2: tx_cycle = txdelay_2;
	  3: tx_cycle = txdelay_3;
	  4: tx_cycle = txdelay_4;	  
	  default:
	    begin
	       tx_cycle=txdelay_3; //  -- Added the default value as this causes simulation hang
	       if($time>2)
		 //$display("ERROR: %m Invalid tx_config %0d",tx_config);
	       tx_cycle=txdelay_3;
	    end
	endcase
	case(skew)
	  0:
	    begin
	       if(old_tx_config != tx_config)
		 begin
		    old_tx_config = tx_config;
		    repeat(2) @(posedge `TOP.core_clk);
		    tx_clkp_int=0;
		    repeat(2) @(posedge `TOP.core_clk);
                    skew = org_skew;
		 end
	       #tx_cycle		tx_clkp_int = ~tx_clkp_int;
	    end
          1:
            begin
               if(tx_clkp_int!=0)
                 begin
                    repeat(2) @(posedge `TOP.core_clk);
                    tx_clkp_int=0;
                 end
               repeat(2) @(posedge `TOP.core_clk);
               #`TX_CLK_SKEW    tx_clkp_int = ~tx_clkp_int;
               skew = 0;
            end

          2: begin
               if(tx_clkp_int!=0)
                  begin
                      repeat(4) @(posedge `TOP.core_clk);
                      tx_clkp_int=0;
                  end
                repeat(4) @(posedge `TOP.core_clk);
                #(7.5/2)        tx_clkp_int = ~tx_clkp_int;
                skew <= #1 0;
              end

          3: begin
               if(tx_clkp!=0)
                  begin
                      repeat(4) @(posedge `TOP.core_clk);
                      tx_clkp_int=0;
                  end
                repeat(4) @(posedge `TOP.core_clk);
                #(7.5/4*3)      tx_clkp_int = ~tx_clkp_int;
                skew <= #1 0;
              end

           4: begin
                if(tx_clkp!=0)
                    begin
                        repeat(4) @(posedge `TOP.core_clk);
                        tx_clkp_int=0;
                     end
                   repeat(4) @(posedge `TOP.core_clk);
                   #(7.5/4)        tx_clkp_int = ~tx_clkp_int;
                   skew <= #1 0;
                end

	  default: 
	    begin
	       skew =  0;
	    end		      	
	endcase
     end
   
   always
     begin
	case(rx_config)
	  0: rx_cycle = rxdelay_0;
	  1: rx_cycle = rxdelay_1;
	  2: rx_cycle = rxdelay_2;
	  3: rx_cycle = rxdelay_3;
	  4: rx_cycle = rxdelay_4;
	  default:
	    begin
	       rx_cycle=rxdelay_3; //  -- Added the default value as this causes simulation hang
	       if($time>2)
		 //$display("ERROR: %m Invalid rx_config %0d",rx_config);
	       rx_cycle=rxdelay_3;
	    end
	endcase
	case(skew)
	  0: 
	    begin
	       if(old_rx_config != rx_config)
		 begin
		    old_rx_config = rx_config;
		    repeat(2) @(posedge `TOP.core_clk);
		    rx_clkp=0;
		    repeat(2) @(posedge `TOP.core_clk);
                    skew = org_skew;
		 end
	       #rx_cycle		rx_clkp = ~rx_clkp;
	    end
	  1: 
	    begin
	       if(rx_clkp!=0)
		 begin
		    repeat(2) @(posedge `TOP.core_clk);
		    rx_clkp=0;
		 end
	       repeat(2) @(posedge `TOP.core_clk);
	       #`RX_CLK_SKEW	rx_clkp = ~rx_clkp;
	       skew = 0;
	    end
	  default: 
	    begin
	       skew =  0;
	    end	  
	endcase
     end
   


endmodule
