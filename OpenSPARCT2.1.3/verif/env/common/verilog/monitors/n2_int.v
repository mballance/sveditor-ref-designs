// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_int.v
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
module n2_int();

wire	[145:0]	 cpx_spc0_data_cx2 = `CPU.cpx_spc0_data_cx2;
wire	[145:0]	 cpx_spc1_data_cx2 = `CPU.cpx_spc1_data_cx2;
wire	[145:0]	 cpx_spc2_data_cx2 = `CPU.cpx_spc2_data_cx2;
wire	[145:0]	 cpx_spc3_data_cx2 = `CPU.cpx_spc3_data_cx2;
wire	[145:0]	 cpx_spc4_data_cx2 = `CPU.cpx_spc4_data_cx2;
wire	[145:0]	 cpx_spc5_data_cx2 = `CPU.cpx_spc5_data_cx2;
wire	[145:0]	 cpx_spc6_data_cx2 = `CPU.cpx_spc6_data_cx2;
wire	[145:0]	 cpx_spc7_data_cx2 = `CPU.cpx_spc7_data_cx2;
wire 		 clk = `CPU.l2clk ;
wire		 rst_l = `CPU.PWRON_RST_L;


integer count_int_spc0t0;
integer count_int_spc0t1;
integer count_int_spc0t2;
integer count_int_spc0t3;
integer count_int_spc0t4;
integer count_int_spc0t5;
integer count_int_spc0t6;
integer count_int_spc0t7;
integer count_int_spc1t0;
integer count_int_spc1t1;
integer count_int_spc1t2;
integer count_int_spc1t3;
integer count_int_spc1t4;
integer count_int_spc1t5;
integer count_int_spc1t6;
integer count_int_spc1t7;
integer count_int_spc2t0;
integer count_int_spc2t1;
integer count_int_spc2t2;
integer count_int_spc2t3;
integer count_int_spc2t4;
integer count_int_spc2t5;
integer count_int_spc2t6;
integer count_int_spc2t7;
integer count_int_spc3t0;
integer count_int_spc3t1;
integer count_int_spc3t2;
integer count_int_spc3t3;
integer count_int_spc3t4;
integer count_int_spc3t5;
integer count_int_spc3t6;
integer count_int_spc3t7;
integer count_int_spc4t0;
integer count_int_spc4t1;
integer count_int_spc4t2;
integer count_int_spc4t3;
integer count_int_spc4t4;
integer count_int_spc4t5;
integer count_int_spc4t6;
integer count_int_spc4t7;
integer count_int_spc5t0;
integer count_int_spc5t1;
integer count_int_spc5t2;
integer count_int_spc5t3;
integer count_int_spc5t4;
integer count_int_spc5t5;
integer count_int_spc5t6;
integer count_int_spc5t7;
integer count_int_spc6t0;
integer count_int_spc6t1;
integer count_int_spc6t2;
integer count_int_spc6t3;
integer count_int_spc6t4;
integer count_int_spc6t5;
integer count_int_spc6t6;
integer count_int_spc6t7;
integer count_int_spc7t0;
integer count_int_spc7t1;
integer count_int_spc7t2;
integer count_int_spc7t3;
integer count_int_spc7t4;
integer count_int_spc7t5;
integer count_int_spc7t6;
integer count_int_spc7t7;


initial
  begin
      count_int_spc0t0 = 0;
      count_int_spc0t1 = 0;
      count_int_spc0t2 = 0;
      count_int_spc0t3 = 0;
      count_int_spc0t4 = 0;
      count_int_spc0t5 = 0;
      count_int_spc0t6 = 0;
      count_int_spc0t7 = 0;
      count_int_spc1t0 = 0;
      count_int_spc1t1 = 0;
      count_int_spc1t2 = 0;
      count_int_spc1t3 = 0;
      count_int_spc1t4 = 0;
      count_int_spc1t5 = 0;
      count_int_spc1t6 = 0;
      count_int_spc1t7 = 0;
      count_int_spc2t0 = 0;
      count_int_spc2t1 = 0;
      count_int_spc2t2 = 0;
      count_int_spc2t3 = 0;
      count_int_spc2t4 = 0;
      count_int_spc2t5 = 0;
      count_int_spc2t6 = 0;
      count_int_spc2t7 = 0;
      count_int_spc3t0 = 0;
      count_int_spc3t1 = 0;
      count_int_spc3t2 = 0;
      count_int_spc3t3 = 0;
      count_int_spc3t4 = 0;
      count_int_spc3t5 = 0;
      count_int_spc3t6 = 0;
      count_int_spc3t7 = 0;
      count_int_spc4t0 = 0;
      count_int_spc4t1 = 0;
      count_int_spc4t2 = 0;
      count_int_spc4t3 = 0;
      count_int_spc4t4 = 0;
      count_int_spc4t5 = 0;
      count_int_spc4t6 = 0;
      count_int_spc4t7 = 0;
      count_int_spc5t0 = 0;
      count_int_spc5t1 = 0;
      count_int_spc5t2 = 0;
      count_int_spc5t3 = 0;
      count_int_spc5t4 = 0;
      count_int_spc5t5 = 0;
      count_int_spc5t6 = 0;
      count_int_spc5t7 = 0;
      count_int_spc6t0 = 0;
      count_int_spc6t1 = 0;
      count_int_spc6t2 = 0;
      count_int_spc6t3 = 0;
      count_int_spc6t4 = 0;
      count_int_spc6t5 = 0;
      count_int_spc6t6 = 0;
      count_int_spc6t7 = 0;
      count_int_spc7t0 = 0;
      count_int_spc7t1 = 0;
      count_int_spc7t2 = 0;
      count_int_spc7t3 = 0;
      count_int_spc7t4 = 0;
      count_int_spc7t5 = 0;
      count_int_spc7t6 = 0;
      count_int_spc7t7 = 0;

  end

always @(posedge clk) begin
    if((cpx_spc0_data_cx2[145] == 1'b1) && (cpx_spc0_data_cx2[144:141] == 4'b0111))
      begin
	  if (cpx_spc0_data_cx2[10:8] == 3'b000)
	    begin
	        count_int_spc0t0 = count_int_spc0t0 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc0t0 = %d",
                         count_int_spc0t0);
	    end
	  else if (cpx_spc0_data_cx2[10:8] == 3'b001)
	    begin
	        count_int_spc0t1 = count_int_spc0t1 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc0t1 = %d",
                         count_int_spc0t1);
	    end
	  else if (cpx_spc0_data_cx2[10:8] == 3'b010)
	    begin
	        count_int_spc0t2 = count_int_spc0t2 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc0t2 = %d",
                         count_int_spc0t2);
	    end
	  else if (cpx_spc0_data_cx2[10:8] == 3'b011)
	    begin
	        count_int_spc0t3 = count_int_spc0t3 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc0t3 = %d",
                         count_int_spc0t3);
	    end
	  else if (cpx_spc0_data_cx2[10:8] == 3'b100)
	    begin
	        count_int_spc0t4 = count_int_spc0t4 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc0t4 = %d",
                         count_int_spc0t4);
	    end
	  else if (cpx_spc0_data_cx2[10:8] == 3'b101)
	    begin
	        count_int_spc0t5 = count_int_spc0t5 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc0t5 = %d",
                         count_int_spc0t5);
	    end
	  else if (cpx_spc0_data_cx2[10:8] == 3'b110)
	    begin
	        count_int_spc0t6 = count_int_spc0t6 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc0t6 = %d",
                         count_int_spc0t6);
	    end
	  else if (cpx_spc0_data_cx2[10:8] == 3'b111)
	    begin
	        count_int_spc0t7 = count_int_spc0t7 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc0t7 = %d",
                         count_int_spc0t7);
	    end
      end


//--------------------------------------
    if((cpx_spc1_data_cx2[145] == 1'b1) && (cpx_spc1_data_cx2[144:141] == 4'b0111))
      begin
	  if (cpx_spc1_data_cx2[10:8] == 3'b000)
	    begin
	        count_int_spc1t0 = count_int_spc1t0 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc1t0 = %d",
                         count_int_spc1t0);
	    end
	  else if (cpx_spc1_data_cx2[10:8] == 3'b001)
	    begin
	        count_int_spc1t1 = count_int_spc1t1 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc1t1 = %d",
                         count_int_spc1t1);
	    end
	  else if (cpx_spc1_data_cx2[10:8] == 3'b010)
	    begin
	        count_int_spc1t2 = count_int_spc1t2 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc1t2 = %d",
                         count_int_spc1t2);
	    end
	  else if (cpx_spc1_data_cx2[10:8] == 3'b011)
	    begin
	        count_int_spc1t3 = count_int_spc1t3 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc1t3 = %d",
                         count_int_spc1t3);
	    end
	  else if (cpx_spc1_data_cx2[10:8] == 3'b100)
	    begin
	        count_int_spc1t4 = count_int_spc1t4 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc1t4 = %d",
                         count_int_spc1t4);
	    end
	  else if (cpx_spc1_data_cx2[10:8] == 3'b101)
	    begin
	        count_int_spc1t5 = count_int_spc1t5 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc1t5 = %d",
                         count_int_spc1t5);
	    end
	  else if (cpx_spc1_data_cx2[10:8] == 3'b110)
	    begin
	        count_int_spc1t6 = count_int_spc1t6 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc1t6 = %d",
                         count_int_spc1t6);
	    end
	  else if (cpx_spc1_data_cx2[10:8] == 3'b111)
	    begin
	        count_int_spc1t7 = count_int_spc1t7 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc1t7 = %d",
                         count_int_spc1t7);
	    end
      end


//--------------------------------------
    if((cpx_spc2_data_cx2[145] == 1'b1) && (cpx_spc2_data_cx2[144:141] == 4'b0111))
      begin
	  if (cpx_spc2_data_cx2[10:8] == 3'b000)
	    begin
	        count_int_spc2t0 = count_int_spc2t0 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc2t0 = %d",
                         count_int_spc2t0);
	    end
	  else if (cpx_spc2_data_cx2[10:8] == 3'b001)
	    begin
	        count_int_spc2t1 = count_int_spc2t1 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc2t1 = %d",
                         count_int_spc2t1);
	    end
	  else if (cpx_spc2_data_cx2[10:8] == 3'b010)
	    begin
	        count_int_spc2t2 = count_int_spc2t2 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc2t2 = %d",
                         count_int_spc2t2);
	    end
	  else if (cpx_spc2_data_cx2[10:8] == 3'b011)
	    begin
	        count_int_spc2t3 = count_int_spc2t3 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc2t3 = %d",
                         count_int_spc2t3);
	    end
	  else if (cpx_spc2_data_cx2[10:8] == 3'b100)
	    begin
	        count_int_spc2t4 = count_int_spc2t4 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc2t4 = %d",
                         count_int_spc2t4);
	    end
	  else if (cpx_spc2_data_cx2[10:8] == 3'b101)
	    begin
	        count_int_spc2t5 = count_int_spc2t5 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc2t5 = %d",
                         count_int_spc2t5);
	    end
	  else if (cpx_spc2_data_cx2[10:8] == 3'b110)
	    begin
	        count_int_spc2t6 = count_int_spc2t6 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc2t6 = %d",
                         count_int_spc2t6);
	    end
	  else if (cpx_spc2_data_cx2[10:8] == 3'b111)
	    begin
	        count_int_spc2t7 = count_int_spc2t7 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc2t7 = %d",
                         count_int_spc2t7);
	    end
    end


//--------------------------------------
    if((cpx_spc3_data_cx2[145] == 1'b1) && (cpx_spc3_data_cx2[144:141] == 4'b0111))
      begin
	  if (cpx_spc3_data_cx2[10:8] == 3'b000)
	    begin
	        count_int_spc3t0 = count_int_spc3t0 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc3t0 = %d",
                         count_int_spc3t0);
	    end
	  else if (cpx_spc3_data_cx2[10:8] == 3'b001)
	    begin
	        count_int_spc3t1 = count_int_spc3t1 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc3t1 = %d",
                         count_int_spc3t1);
	    end
	  else if (cpx_spc3_data_cx2[10:8] == 3'b010)
	    begin
	        count_int_spc3t2 = count_int_spc3t2 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc3t2 = %d",
                         count_int_spc3t2);
	    end
	  else if (cpx_spc3_data_cx2[10:8] == 3'b011)
	    begin
	        count_int_spc3t3 = count_int_spc3t3 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc3t3 = %d",
                         count_int_spc3t3);
	    end
	  else if (cpx_spc3_data_cx2[10:8] == 3'b100)
	    begin
	        count_int_spc3t4 = count_int_spc3t4 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc3t4 = %d",
                         count_int_spc3t4);
	    end
	  else if (cpx_spc3_data_cx2[10:8] == 3'b101)
	    begin
	        count_int_spc3t5 = count_int_spc3t5 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc3t5 = %d",
                         count_int_spc3t5);
	    end
	  else if (cpx_spc3_data_cx2[10:8] == 3'b110)
	    begin
	        count_int_spc3t6 = count_int_spc3t6 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc3t6 = %d",
                         count_int_spc3t6);
	    end
	  else if (cpx_spc3_data_cx2[10:8] == 3'b111)
	    begin
	        count_int_spc3t7 = count_int_spc3t7 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc3t7 = %d",
                         count_int_spc3t7);
	    end
    end


//--------------------------------------
    if((cpx_spc4_data_cx2[145] == 1'b1) && (cpx_spc4_data_cx2[144:141] == 4'b0111))
      begin
	  if (cpx_spc4_data_cx2[10:8] == 3'b000)
	    begin
	        count_int_spc4t0 = count_int_spc4t0 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc4t0 = %d",
                         count_int_spc4t0);
	    end
	  else if (cpx_spc4_data_cx2[10:8] == 3'b001)
	    begin
	        count_int_spc4t1 = count_int_spc4t1 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc4t1 = %d",
                         count_int_spc4t1);
	    end
	  else if (cpx_spc4_data_cx2[10:8] == 3'b010)
	    begin
	        count_int_spc4t2 = count_int_spc4t2 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc4t2 = %d",
                         count_int_spc4t2);
	    end
	  else if (cpx_spc4_data_cx2[10:8] == 3'b011)
	    begin
	        count_int_spc4t3 = count_int_spc4t3 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc4t3 = %d",
                         count_int_spc4t3);
	    end
	  else if (cpx_spc4_data_cx2[10:8] == 3'b100)
	    begin
	        count_int_spc4t4 = count_int_spc4t4 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc4t4 = %d",
                         count_int_spc4t4);
	    end
	  else if (cpx_spc4_data_cx2[10:8] == 3'b101)
	    begin
	        count_int_spc4t5 = count_int_spc4t5 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc4t5 = %d",
                         count_int_spc4t5);
	    end
	  else if (cpx_spc4_data_cx2[10:8] == 3'b110)
	    begin
	        count_int_spc4t6 = count_int_spc4t6 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc4t6 = %d",
                         count_int_spc4t6);
	    end
	  else if (cpx_spc4_data_cx2[10:8] == 3'b111)
	    begin
	        count_int_spc4t7 = count_int_spc4t7 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc4t7 = %d",
                         count_int_spc4t7);
	    end
      end


//--------------------------------------
    if((cpx_spc5_data_cx2[145] == 1'b1) && (cpx_spc5_data_cx2[144:141] == 4'b0111))
      begin
	  if (cpx_spc5_data_cx2[10:8] == 3'b000)
	    begin
	        count_int_spc5t0 = count_int_spc5t0 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc5t0 = %d",
                         count_int_spc5t0);
	    end
	  else if (cpx_spc5_data_cx2[10:8] == 3'b001)
	    begin
	        count_int_spc5t1 = count_int_spc5t1 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc5t1 = %d",
                         count_int_spc5t1);
	    end
	  else if (cpx_spc5_data_cx2[10:8] == 3'b010)
	    begin
	        count_int_spc5t2 = count_int_spc5t2 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc5t2 = %d",
                         count_int_spc5t2);
	    end
	  else if (cpx_spc5_data_cx2[10:8] == 3'b011)
	    begin
	        count_int_spc5t3 = count_int_spc5t3 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc5t3 = %d",
                         count_int_spc5t3);
	    end
	  else if (cpx_spc5_data_cx2[10:8] == 3'b100)
	    begin
	        count_int_spc5t4 = count_int_spc5t4 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc5t4 = %d",
                         count_int_spc5t4);
	    end
	  else if (cpx_spc5_data_cx2[10:8] == 3'b101)
	    begin
	        count_int_spc5t5 = count_int_spc5t5 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc5t5 = %d",
                         count_int_spc5t5);
	    end
	  else if (cpx_spc5_data_cx2[10:8] == 3'b110)
	    begin
	        count_int_spc5t6 = count_int_spc5t6 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc5t6 = %d",
                         count_int_spc5t6);
	    end
	  else if (cpx_spc5_data_cx2[10:8] == 3'b111)
	    begin
	        count_int_spc5t7 = count_int_spc5t7 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc5t7 = %d",
                         count_int_spc5t7);
	    end
    end


//--------------------------------------
    if((cpx_spc6_data_cx2[145] == 1'b1) && (cpx_spc6_data_cx2[144:141] == 4'b0111))
      begin
	  if (cpx_spc6_data_cx2[10:8] == 3'b000)
	    begin
	        count_int_spc6t0 = count_int_spc6t0 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc6t0 = %d",
                         count_int_spc6t0);
	    end
	  else if (cpx_spc6_data_cx2[10:8] == 3'b001)
	    begin
	        count_int_spc6t1 = count_int_spc6t1 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc6t1 = %d",
                         count_int_spc6t1);
	    end
	  else if (cpx_spc6_data_cx2[10:8] == 3'b010)
	    begin
	        count_int_spc6t2 = count_int_spc6t2 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc6t2 = %d",
                         count_int_spc6t2);
	    end
	  else if (cpx_spc6_data_cx2[10:8] == 3'b011)
	    begin
	        count_int_spc6t3 = count_int_spc6t3 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc6t3 = %d",
                         count_int_spc6t3);
	    end
	  else if (cpx_spc6_data_cx2[10:8] == 3'b100)
	    begin
	        count_int_spc6t4 = count_int_spc6t4 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc6t4 = %d",
                         count_int_spc6t4);
	    end
	  else if (cpx_spc6_data_cx2[10:8] == 3'b101)
	    begin
	        count_int_spc6t5 = count_int_spc6t5 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc6t5 = %d",
                         count_int_spc6t5);
	    end
	  else if (cpx_spc6_data_cx2[10:8] == 3'b110)
	    begin
	        count_int_spc6t6 = count_int_spc6t6 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc6t6 = %d",
                         count_int_spc6t6);
	    end
	  else if (cpx_spc6_data_cx2[10:8] == 3'b111)
	    begin
	        count_int_spc6t7 = count_int_spc6t7 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc6t7 = %d",
                         count_int_spc6t7);
	    end
    end


//--------------------------------------
    if((cpx_spc7_data_cx2[145] == 1'b1) && (cpx_spc7_data_cx2[144:141] == 4'b0111))
      begin
	  if (cpx_spc7_data_cx2[10:8] == 3'b000)
	    begin
	        count_int_spc7t0 = count_int_spc7t0 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc7t0 = %d",
                         count_int_spc7t0);
	    end
	  else if (cpx_spc7_data_cx2[10:8] == 3'b001)
	    begin
	        count_int_spc7t1 = count_int_spc7t1 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc7t1 = %d",
                         count_int_spc7t1);
	    end
	  else if (cpx_spc7_data_cx2[10:8] == 3'b010)
	    begin
	        count_int_spc7t2 = count_int_spc7t2 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc7t2 = %d",
                         count_int_spc7t2);
	    end
	  else if (cpx_spc7_data_cx2[10:8] == 3'b011)
	    begin
	        count_int_spc7t3 = count_int_spc7t3 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc7t3 = %d",
                         count_int_spc7t3);
	    end
	  else if (cpx_spc7_data_cx2[10:8] == 3'b100)
	    begin
	        count_int_spc7t4 = count_int_spc7t4 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc7t4 = %d",
                         count_int_spc7t4);
	    end
	  else if (cpx_spc7_data_cx2[10:8] == 3'b101)
	    begin
	        count_int_spc7t5 = count_int_spc7t5 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc7t5 = %d",
                         count_int_spc7t5);
	    end
	  else if (cpx_spc7_data_cx2[10:8] == 3'b110)
	    begin
	        count_int_spc7t6 = count_int_spc7t6 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc7t6 = %d",
                         count_int_spc7t6);
	    end
	  else if (cpx_spc7_data_cx2[10:8] == 3'b111)
	    begin
	        count_int_spc7t7 = count_int_spc7t7 +1;
	        `PR_INFO("n2_int", `INFO, "count_int_spc7t7 = %d",
                         count_int_spc7t7);
	    end
    end
end // always @ (posedge clk)

always @ (posedge tb_top.sim_status[0]) begin
`ifndef RTL_NO_SPC0
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc0t0 = %d",
             count_int_spc0t0);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc0t1 = %d",
             count_int_spc0t1);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc0t2 = %d",
             count_int_spc0t2);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc0t3 = %d",
             count_int_spc0t3);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc0t4 = %d",
             count_int_spc0t4);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc0t5 = %d",
             count_int_spc0t5);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc0t6 = %d",
             count_int_spc0t6);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc0t7 = %d",
             count_int_spc0t7);
`endif //  `ifndef RTL_NO_SPC0
`ifndef RTL_NO_SPC1
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc1t0 = %d",
             count_int_spc1t0);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc1t1 = %d",
             count_int_spc1t1);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc1t2 = %d",
             count_int_spc1t2);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc1t3 = %d",
             count_int_spc1t3);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc1t4 = %d",
             count_int_spc1t4);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc1t5 = %d",
             count_int_spc1t5);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc1t6 = %d",
             count_int_spc1t6);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc1t7 = %d",
             count_int_spc1t7);
`endif //  `ifndef RTL_NO_SPC1
`ifndef RTL_NO_SPC2
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc2t0 = %d",
             count_int_spc2t0);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc2t1 = %d",
             count_int_spc2t1);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc2t2 = %d",
             count_int_spc2t2);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc2t3 = %d",
             count_int_spc2t3);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc2t4 = %d",
             count_int_spc2t4);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc2t5 = %d",
             count_int_spc2t5);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc2t6 = %d",
             count_int_spc2t6);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc2t7 = %d",
             count_int_spc2t7);
`endif //  `ifndef RTL_NO_SPC2
`ifndef RTL_NO_SPC3
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc3t0 = %d",
             count_int_spc3t0);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc3t1 = %d",
             count_int_spc3t1);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc3t2 = %d",
             count_int_spc3t2);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc3t3 = %d",
             count_int_spc3t3);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc3t4 = %d",
             count_int_spc3t4);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc3t5 = %d",
             count_int_spc3t5);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc3t6 = %d",
             count_int_spc3t6);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc3t7 = %d",
             count_int_spc3t7);
`endif //  `ifndef RTL_NO_SPC3
`ifndef RTL_NO_SPC4
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc4t0 = %d",
             count_int_spc4t0);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc4t1 = %d",
             count_int_spc4t1);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc4t2 = %d",
             count_int_spc4t2);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc4t3 = %d",
             count_int_spc4t3);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc4t4 = %d",
             count_int_spc4t4);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc4t5 = %d",
             count_int_spc4t5);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc4t6 = %d",
             count_int_spc4t6);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc4t7 = %d",
             count_int_spc4t7);
`endif //  `ifndef RTL_NO_SPC4
`ifndef RTL_NO_SPC5
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc5t0 = %d",
             count_int_spc5t0);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc5t1 = %d",
             count_int_spc5t1);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc5t2 = %d",
             count_int_spc5t2);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc5t3 = %d",
             count_int_spc5t3);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc5t4 = %d",
             count_int_spc5t4);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc5t5 = %d",
             count_int_spc5t5);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc5t6 = %d",
             count_int_spc5t6);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc5t7 = %d",
             count_int_spc5t7);
`endif //  `ifndef RTL_NO_SPC5
`ifndef RTL_NO_SPC6
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc6t0 = %d",
             count_int_spc6t0);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc6t1 = %d",
             count_int_spc6t1);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc6t2 = %d",
             count_int_spc6t2);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc6t3 = %d",
             count_int_spc6t3);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc6t4 = %d",
             count_int_spc6t4);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc6t5 = %d",
             count_int_spc6t5);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc6t6 = %d",
             count_int_spc6t6);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc6t7 = %d",
             count_int_spc6t7);
`endif //  `ifndef RTL_NO_SPC7
`ifndef RTL_NO_SPC7
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc7t0 = %d",
             count_int_spc7t0);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc7t1 = %d",
             count_int_spc7t1);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc7t2 = %d",
             count_int_spc7t2);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc7t3 = %d",
             count_int_spc7t3);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc7t4 = %d",
             count_int_spc7t4);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc7t5 = %d",
             count_int_spc7t5);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc7t6 = %d",
             count_int_spc7t6);
    `PR_INFO("n2_int", `INFO, "Number of interrupts sent to spc7t7 = %d",
             count_int_spc7t7);
`endif //  `ifndef RTL_NO_SPC7
end // always @ (posedge (tb_top.sim_status[0]))


endmodule // n2_int
