// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: bw_calc.v
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
module bw_calc (/*AUTOARG*/
		// Inputs
		clk, data, enb, port_num, no_of_pkts, pkt_len, cal_enb,
		speed_10G);

   input clk;
   input [7:0] data;
   input       enb;
   input       cal_enb;
   input       speed_10G;
   input [1:0] port_num;
   input [15:0] no_of_pkts;
   input [15:0] pkt_len;


   reg [1:0] 	bw_state;
   reg [1:0] 	nxt_state;
   integer 	data_byte_cnt;
   integer 	ipg_byte_cnt;
   real 	BW;
   real         BW_d;
   real 	BW_in_pkts;
   real 	avg_ipg_byte_cnt;
   real 	bw_start_time;
   real 	bw_end_time;
   integer 	pkt_cnt;
   integer      no_of_txpkts;
   integer      packet_len;
   real         delta_time;
   real         delta_time1;
   integer      count;
   reg [8*60:1] arg;
   integer  host_dly;

   // initial for defaulting the values
   initial
     begin
	bw_state = 2'b00;
     end

   // initial block for getting the latency number

   initial 
     begin
        arg = "SIU_REQ_DLY=";
        if($test$plusargs("SIU_REQ_DLY=")) begin
	`ifdef AXIS
	`else
          host_dly = $util_get_plus_args_num(arg);
   	`endif
          $display("BW_CALC:  Host_dly %0d\n",host_dly);
        end
     end
   
   

   always @(nxt_state)
      bw_state = nxt_state;

   always @(posedge clk)
     begin
        if(cal_enb && speed_10G) 
	  calc_BW(bw_state,data,enb,port_num,no_of_pkts,pkt_len,nxt_state);
        else  if(cal_enb && ~speed_10G)
	  calc_BW_1G(bw_state,data,enb,port_num,no_of_pkts,pkt_len,nxt_state);
     end



   task calc_BW;

      input [1:0] bw_state;
      input [7:0] data;
      input enb;
      input [1:0] port_num;
      input [15:0] no_of_pkts;
      input [15:0] pkt_len;

      output [1:0] nxt_state;

      case(bw_state)
	2'b00 :  begin
	   if((data == 8'hfb) && (enb == 1))  begin
	      nxt_state = 2'b01;
	      bw_start_time = $time;
	      $display("BW_CALC : START_TIME in BW %t for PORT %0d",bw_start_time,port_num);
	   end // if ((data == 8'hfb) && (enb == 1))
	   else begin
	      nxt_state = 2'b00;
	      pkt_cnt = 0;
	      data_byte_cnt = 0;
	      ipg_byte_cnt = 0;
	      avg_ipg_byte_cnt = 0;
	      bw_start_time = 0;
	      bw_end_time = 0;
              no_of_txpkts = no_of_pkts;
              packet_len = pkt_len;
              delta_time = 0;
	   end // else: !if((data == 8'hfb) && (enb == 1))
	end // case: 2'b00
	2'b01 : begin
	   if((data == 8'hfd) && (enb == 1)) begin
	      pkt_cnt = pkt_cnt + 1;
	      if(pkt_cnt == no_of_txpkts) begin
		 nxt_state = 2'b00;
		 bw_end_time = $time;

                 delta_time = (bw_end_time - bw_start_time)/1000000; 
                 delta_time1 = (bw_end_time - bw_start_time); 
		 $display("BW_CALC : DELTA_TIME in BW %t for PORT %0d",delta_time1,port_num);
		 $display("BW_CALC : END_TIME in BW %t for PORT %0d",bw_end_time,port_num);

	         avg_ipg_byte_cnt = ipg_byte_cnt/no_of_pkts;
		 $display("BW_CALC : Avg_ipg_byte_cnt is %0f for PORT %0d",avg_ipg_byte_cnt,port_num);

		 // print the BW calculated
		 BW = 8*no_of_pkts*1000*(packet_len + 8 + avg_ipg_byte_cnt)/delta_time1;
		 $display("BW_CALC: BW_ON_WIRE is %0f Gigabits/sec for Port %0d",BW,port_num);

		 BW_d = 8*no_of_pkts*1000*packet_len/delta_time1;
		 $display("BW_CALC: BW_DATA is %0f Gigabits/sec for Port %0d",BW_d,port_num);

                 BW_in_pkts = no_of_pkts/delta_time;
		 $display("BW_CALC : BW_IN_PKTS for port %0d is %f Million_pkts/sec",port_num,BW_in_pkts);
                
                   if(packet_len == 64) begin
                       if(BW_in_pkts < 14.88) begin
                         if(host_dly < 140)
                            $display("BW_CALC : ERROR BW less than expected for port %0d",port_num);
                         else 
                            $display("BW_CALC : Warning BW less than expected for port %0d",port_num);
                       end
                     end
                     else if(packet_len == 1518) begin
                         if(BW_in_pkts < 0.8)
                           $display("BW_CALC : ERROR BW less than expected for port %0d",port_num);
                     end
                     else if(packet_len == 9588) begin
                          if(BW_in_pkts < 0.1301)
                          $display("BW_CALC : ERROR BW less than expected for port %0d",port_num);
                     end
	      end
	      else
		nxt_state = 2'b10;
	   end
	   else begin
	      data_byte_cnt = data_byte_cnt + 1;
	      nxt_state = 2'b01;
	   end
	end
	2'b10 : begin
	   if((data == 8'hfb) && (enb == 1))
	     nxt_state = 2'b01;
	   else begin
	      ipg_byte_cnt = ipg_byte_cnt + 1;
	      avg_ipg_byte_cnt = ipg_byte_cnt/no_of_pkts;
	      nxt_state = 2'b10;
	   end
	end
      endcase
   endtask

   task calc_BW_1G;

	input [1:0] bw_state;
	input [7:0] data;
	input enb;
	input [1:0] port_num;
	input [15:0] no_of_pkts;
	input [15:0] pkt_len;

	output [1:0] nxt_state;

	case(bw_state)
	2'b00 :	 begin
	   if(enb == 1'b1)  begin
		nxt_state = 2'b01;
		bw_start_time = $time;
		$display("BW_CALC_1G : START_TIME in BW %t for PORT %0d",bw_start_time,port_num);
	   end
           else begin
              nxt_state = 2'b00;
		pkt_cnt = 0;
		data_byte_cnt = 0;
		ipg_byte_cnt = 0;
                avg_ipg_byte_cnt = 0;
		bw_start_time = 0;
		bw_end_time = 0;
		no_of_txpkts = no_of_pkts;
		packet_len = pkt_len;
		delta_time = 0;
                count = 0;
           end
	end
        2'b01 : begin   // check for frame delimiter in this state
                if(enb) begin
		// $display("BW_CALC_1G : COUNT in BW %0d for PORT %0d",count,port_num);
		// $display("BW_CALC_1G : data in BW %0h for PORT %0d",data,port_num);
                if(count < 6) begin
                   nxt_state = 2'b01;
                   count = count + 1;
                  end
                else if((data == 8'hd5) && (count == 6)) begin
                   nxt_state = 2'b10;
                   count = 0;
                end 
                else begin
                   nxt_state = 2'b00;
                   bw_start_time = 0;
                end
                end
                else nxt_state = 2'b00; 
                end 
	2'b10 : begin
		if(enb == 1'b0) begin
		pkt_cnt = pkt_cnt + 1;
		if(pkt_cnt == no_of_txpkts) begin
			 nxt_state = 2'b00;
			 bw_end_time = $time;

		 delta_time = (bw_end_time - bw_start_time)/1000000;
		 delta_time1 = (bw_end_time - bw_start_time);
		 $display("BW_CALC_1G : END_TIME in BW %t for PORT %0d",bw_end_time,port_num);

		 avg_ipg_byte_cnt = ipg_byte_cnt/no_of_pkts;
		 $display("BW_CALC_1G :  Avg_ipg_per_pkt is %0f for PORT %0d",avg_ipg_byte_cnt,port_num);

		 // print the BW calculated
		 BW = (8*no_of_pkts*1000)*(packet_len + 8 + avg_ipg_byte_cnt)/delta_time1;
		 $display("BW_CALC_1G : BW_ON_WIRE is %0f Gigabits/sec for Port %0d",BW,port_num);

		 BW_d = (8*no_of_pkts*1000*packet_len)/delta_time1;
		 $display("BW_CALC_1G : BW_DATA is %0f Gigabits/sec for Port %0d",BW_d,port_num);

		 BW_in_pkts = no_of_pkts/delta_time;
		 $display("BW_CALC_1G : BW_IN_PKTS for port %0d is %f Million_pkts/sec",port_num,BW_in_pkts);

		 if(packet_len == 64) begin
		if(BW_in_pkts < 15)
		$display("BW_CALC_1G : ERROR BW less than expected for port %0d",port_num);
                   end
			 else if(packet_len == 1518) begin
		if(BW_in_pkts < 0.8)
		$display("BW_CALC_1G : ERROR BW less than expected for port %0d",port_num);
                   end
              end
		else begin
	        	nxt_state = 2'b11;
	       	        ipg_byte_cnt = ipg_byte_cnt + 1;
                end
           end
           else begin
		data_byte_cnt = data_byte_cnt + 1;
		nxt_state = 2'b10;
           end
	end
        2'b11 : begin
			if(~enb) begin
			  nxt_state = 2'b11;
			  ipg_byte_cnt = ipg_byte_cnt + 1;
              	end
              	else
			  nxt_state = 2'b01;
               end
      endcase
   endtask


endmodule // bw_calc



