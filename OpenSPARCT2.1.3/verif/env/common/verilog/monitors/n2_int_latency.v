// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_int_latency.v
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
`include "defines.vh"
`include "dispmonDefines.vh"

module n2_int_latency ( clk,rst_l);

input clk;
input rst_l;

wire	[145:0]	 cpx_spc0_data_cx2 = `CPU.cpx_spc0_data_cx2;
wire	[145:0]	 cpx_spc1_data_cx2 = `CPU.cpx_spc1_data_cx2;
wire	[145:0]	 cpx_spc2_data_cx2 = `CPU.cpx_spc2_data_cx2;
wire	[145:0]	 cpx_spc3_data_cx2 = `CPU.cpx_spc3_data_cx2;
wire	[145:0]	 cpx_spc4_data_cx2 = `CPU.cpx_spc4_data_cx2;
wire	[145:0]	 cpx_spc5_data_cx2 = `CPU.cpx_spc5_data_cx2;
wire	[145:0]	 cpx_spc6_data_cx2 = `CPU.cpx_spc6_data_cx2;
wire	[145:0]	 cpx_spc7_data_cx2 = `CPU.cpx_spc7_data_cx2;

wire 	[129:0]	 spc0_pcx_data_pa = `CPU.spc0_pcx_data_pa;
wire 	[129:0]	 spc1_pcx_data_pa = `CPU.spc1_pcx_data_pa;
wire 	[129:0]	 spc2_pcx_data_pa = `CPU.spc2_pcx_data_pa;
wire 	[129:0]	 spc3_pcx_data_pa = `CPU.spc3_pcx_data_pa;
wire 	[129:0]	 spc4_pcx_data_pa = `CPU.spc4_pcx_data_pa;
wire 	[129:0]	 spc5_pcx_data_pa = `CPU.spc5_pcx_data_pa;
wire 	[129:0]	 spc6_pcx_data_pa = `CPU.spc6_pcx_data_pa;
wire 	[129:0]	 spc7_pcx_data_pa = `CPU.spc7_pcx_data_pa;
wire 	[129:0]	 pcx_ncu_data_px2 = `CPU.pcx_ncu_data_px2;

wire 	[8:0]	 spc0_pcx_req_pq = `CPU.spc0_pcx_req_pq;
wire 	[8:0]	 spc1_pcx_req_pq = `CPU.spc1_pcx_req_pq;
wire 	[8:0]	 spc2_pcx_req_pq = `CPU.spc2_pcx_req_pq;
wire 	[8:0]	 spc3_pcx_req_pq = `CPU.spc3_pcx_req_pq;
wire 	[8:0]	 spc4_pcx_req_pq = `CPU.spc4_pcx_req_pq;
wire 	[8:0]	 spc5_pcx_req_pq = `CPU.spc5_pcx_req_pq;
wire 	[8:0]	 spc6_pcx_req_pq = `CPU.spc6_pcx_req_pq;
wire 	[8:0]	 spc7_pcx_req_pq = `CPU.spc7_pcx_req_pq;
wire		pcx_ncu_data_rdy_px1 = `CPU.pcx_ncu_data_rdy_px1;

reg 	[8:0]	 spc0_pcx_req_pq_local;
reg 	[8:0]	 spc1_pcx_req_pq_local;
reg 	[8:0]	 spc2_pcx_req_pq_local;
reg 	[8:0]	 spc3_pcx_req_pq_local;
reg 	[8:0]	 spc4_pcx_req_pq_local;
reg 	[8:0]	 spc5_pcx_req_pq_local;
reg 	[8:0]	 spc6_pcx_req_pq_local;
reg 	[8:0]	 spc7_pcx_req_pq_local;
reg		 pcx_ncu_data_rdy_px1_local;

reg [129:0]    data[0:256];
reg [129:0]    local;
integer        time0[0:256];
reg [129:0]    data1[0:256];
integer        time1[0:256];

integer i;
integer j;
integer k;
integer l;
integer m;
integer n;
integer count;
integer count1;
integer start_time;
integer stop_time;
integer latency;
integer temp;

initial
begin
	i = 0;
	j = 0;
	k = 0;
	l = 0;
	m = 0;
	n = 0;
	count = 0;
	count1 = 0;
	start_time = 0;
	stop_time = 0;
	latency = 0;
end
  

always @(posedge clk)
	begin
	if(rst_l)
		begin
		spc0_pcx_req_pq_local <= #1 spc0_pcx_req_pq;
		spc1_pcx_req_pq_local <= #1 spc0_pcx_req_pq;
		spc2_pcx_req_pq_local <= #1 spc0_pcx_req_pq;
		spc3_pcx_req_pq_local <= #1 spc0_pcx_req_pq;
		spc4_pcx_req_pq_local <= #1 spc0_pcx_req_pq;
		spc5_pcx_req_pq_local <= #1 spc0_pcx_req_pq;
		spc6_pcx_req_pq_local <= #1 spc0_pcx_req_pq;
		spc7_pcx_req_pq_local <= #1 spc0_pcx_req_pq;
		pcx_ncu_data_rdy_px1_local <= #1 pcx_ncu_data_rdy_px1;
		end
	else
		begin
		spc0_pcx_req_pq_local <= 0;
		spc1_pcx_req_pq_local <= 0;
		spc2_pcx_req_pq_local <= 0;
		spc3_pcx_req_pq_local <= 0;
		spc4_pcx_req_pq_local <= 0;
		spc5_pcx_req_pq_local <= 0;
		spc6_pcx_req_pq_local <= 0;
		spc7_pcx_req_pq_local <= 0;
		pcx_ncu_data_rdy_px1_local <=0;
		end
	end
//=============================================================



always @(posedge clk) begin
    if((spc0_pcx_req_pq_local != 9'h000)
       && (/*PA[39:32]*/spc0_pcx_data_pa[103:96] == 8'h90)
       && (/*PA[25: 0]*/spc0_pcx_data_pa[ 89:64] == 26'h1cc0000)
       && (spc0_pcx_data_pa[128:124] == 5'h01))
      begin
	  data[i] = spc0_pcx_data_pa;
	 time0[i] = $time;
	  i=i+1;
      end
    if((spc1_pcx_req_pq_local != 9'h000)
       && (/*PA[39:32]*/spc1_pcx_data_pa[103:96] == 8'h90)
       && (/*PA[25: 0]*/spc1_pcx_data_pa[ 89:64] == 26'h1cc0000)
       && (spc1_pcx_data_pa[128:124] == 5'h01))
      begin
	  data[i] = spc1_pcx_data_pa;
	 time0[i] = $time;
	  i=i+1;
      end
    if((spc2_pcx_req_pq_local != 9'h000)
       && (/*PA[39:32]*/spc2_pcx_data_pa[103:96] == 8'h90)
       && (/*PA[25: 0]*/spc2_pcx_data_pa[ 89:64] == 26'h1cc0000)
       && (spc2_pcx_data_pa[128:124] == 5'h01))
      begin
	  data[i] = spc2_pcx_data_pa;
	 time0[i] = $time;
	  i=i+1;
      end
    if((spc3_pcx_req_pq_local != 9'h000)
       && (/*PA[39:32]*/spc3_pcx_data_pa[103:96] == 8'h90)
       && (/*PA[25: 0]*/spc3_pcx_data_pa[ 89:64] == 26'h1cc0000)
       && (spc3_pcx_data_pa[128:124] == 5'h01))
      begin
	  data[i] = spc3_pcx_data_pa;
	 time0[i] = $time;
	  i=i+1;
      end
    if((spc4_pcx_req_pq_local != 9'h000)
       && (/*PA[39:32]*/spc4_pcx_data_pa[103:96] == 8'h90)
       && (/*PA[25: 0]*/spc4_pcx_data_pa[ 89:64] == 26'h1cc0000)
       && (spc4_pcx_data_pa[128:124] == 5'h01))
      begin
	  data[i] = spc4_pcx_data_pa;
	 time0[i] = $time;
	  i=i+1;
      end
    if((spc5_pcx_req_pq_local != 9'h000)
       && (/*PA[39:32]*/spc5_pcx_data_pa[103:96] == 8'h90)
       && (/*PA[25: 0]*/spc5_pcx_data_pa[ 89:64] == 26'h1cc0000)
       && (spc5_pcx_data_pa[128:124] == 5'h01))
      begin
	  data[i] = spc5_pcx_data_pa;
	 time0[i] = $time;
	  i=i+1;
      end
    if((spc6_pcx_req_pq_local != 9'h000)
       && (/*PA[39:32]*/spc6_pcx_data_pa[103:96] == 8'h90)
       && (/*PA[25: 0]*/spc6_pcx_data_pa[ 89:64] == 26'h1cc0000)
       && (spc6_pcx_data_pa[128:124] == 5'h01))
      begin
	  data[i] = spc6_pcx_data_pa;
	 time0[i] = $time;
	  i=i+1;
      end
    if((spc7_pcx_req_pq_local != 9'h000)
       && (/*PA[39:32]*/spc7_pcx_data_pa[103:96] == 8'h90)
       && (/*PA[25: 0]*/spc7_pcx_data_pa[ 89:64] == 26'h1cc0000)
       && (spc7_pcx_data_pa[128:124] == 5'h01))
      begin
	  data[i] = spc7_pcx_data_pa;
	 time0[i] = $time;
	  i=i+1;
      end

end

always @(posedge clk) begin
    if((pcx_ncu_data_rdy_px1_local ==1)
       && (pcx_ncu_data_px2[128:124] == 5'h01)
       && (/*PA[39:32]*/pcx_ncu_data_px2[103:96] ==  8'h90)
       && (/*PA[25: 0]*/pcx_ncu_data_px2[ 89:64] == 26'h1cc0000))
      begin
	  count = 0;
	  for(k=0; k<i; k=k+1) 
	    begin
		if ((pcx_ncu_data_px2 == data[k]) && (count == 0))
		  begin	
		      local = data[k];
		      data1[j] = local;
		     time1[j] = time0[k];
		      count = 1;
		      for(l=k;l<i;l=l+1) 
			begin
			    temp = l+1 ;
			    local = data[temp];
			    data[l] =local;
			   time0[l] = time0[temp];
			end
		      j = j+1;
		      i= i-1;
		  end
	    end
      end
end

always @(posedge clk) begin
    if((cpx_spc0_data_cx2[145] == 1'b1) && (cpx_spc0_data_cx2[144:141] == 4'b0111))
      begin
	  count1 = 0;
	  for(m=0;m<j;m=m+1)
	    begin
		local = data1[m];
		if((count1 == 0) && (local[10:8] == cpx_spc0_data_cx2[10:8]) && (local[13:11] == cpx_spc0_data_cx2[13:11]) && (local[5:0] == cpx_spc0_data_cx2[5:0])) 
		  begin
		      stop_time = $time;
		      start_time = time1[m];
		      latency = (stop_time - start_time);
		      `PR_INFO("n2_int_latency", `INFO, "latency for interrupt between <C%h> <T%h> and <C%h> <T%h> is = %d",local[122:120],local[119:117],local[13:11],local[10:8],latency);
		      // $display("latency = %d \n",latency);
		      count1 = 1;
		      for(n=m;n<j;n=n+1) 
			begin
			    temp = n+1;
			    local = data1[temp];
			    data1[n] = local;
			   time1[n] = time1[temp];
			end
		      j = j-1;
		  end
	    end	
      end

    if((cpx_spc1_data_cx2[145] == 1'b1) && (cpx_spc1_data_cx2[144:141] == 4'b0111))
      begin
	  count1 = 0;
	  for(m=0;m<j;m=m+1)
	    begin
		local = data1[m];
		if((count1 == 0) && (local[10:8] == cpx_spc1_data_cx2[10:8]) && (local[13:11] == cpx_spc1_data_cx2[13:11]) && (local[5:0] == cpx_spc1_data_cx2[5:0])) 
		  begin
		      stop_time = $time;
		      start_time = time1[m];
		      latency = (stop_time - start_time);
		      `PR_INFO("n2_int_latency", `INFO, "latency for interrupt between <C%h> <T%h> and <C%h> <T%h> is = %d",local[122:120],local[119:117],local[13:11],local[10:8],latency);
		      // $display("latency = %d \n",latency);
		      count1 = 1;
		      for(n=m;n<j;n=n+1) 
			begin
			    temp = n+1;
			    local = data1[temp];
			    data1[n] = local;
			   time1[n] = time1[temp];
			end
		      j = j-1;
		  end
	    end	
      end
    

    if((cpx_spc2_data_cx2[145] == 1'b1) && (cpx_spc2_data_cx2[144:141] == 4'b0111))
      begin
	  count1 = 0;
	  for(m=0;m<j;m=m+1)
	    begin
		local = data1[m];
		if((count1 == 0) && (local[10:8] == cpx_spc2_data_cx2[10:8]) && (local[13:11] == cpx_spc2_data_cx2[13:11]) && (local[5:0] == cpx_spc2_data_cx2[5:0])) 
		  begin
		      stop_time = $time;
		      start_time = time1[m];
		      latency = (stop_time - start_time);
		      `PR_INFO("n2_int_latency", `INFO, "latency for interrupt between <C%h> <T%h> and <C%h> <T%h> is = %d",local[122:120],local[119:117],local[13:11],local[10:8],latency);

		      // $display("latency = %d \n",latency);
		      count1 = 1;
		      for(n=m;n<j;n=n+1) 
			begin
			    temp = n+1;
			    local = data1[temp];
			    data1[n] = local;
			   time1[n] = time1[temp];
			end
		      j = j-1;
		  end
	    end	
      end

    if((cpx_spc3_data_cx2[145] == 1'b1) && (cpx_spc3_data_cx2[144:141] == 4'b0111))
      begin
	  count1 = 0;
	  for(m=0;m<j;m=m+1)
	    begin
		local = data1[m];
		if((count1 == 0) && (local[10:8] == cpx_spc3_data_cx2[10:8]) && (local[13:11] == cpx_spc3_data_cx2[13:11]) && (local[5:0] == cpx_spc3_data_cx2[5:0])) 
		  begin
		      stop_time = $time;
		      start_time = time1[m];
		      latency = (stop_time - start_time);
		      `PR_INFO("n2_int_latency", `INFO, "latency for interrupt between <C%h> <T%h> and <C%h> <T%h> is = %d",local[122:120],local[119:117],local[13:11],local[10:8],latency);
		      //$display("latency =%d \n",latency);
		      count1 = 1;
		      for(n=m;n<j;n=n+1) 
			begin
			    temp = n+1;
			    local = data1[temp];
			    data1[n] = local;
			   time1[n] = time1[temp];
			end
		      j = j-1;
		  end
	    end	
      end
    


    if((cpx_spc4_data_cx2[145] == 1'b1) && (cpx_spc4_data_cx2[144:141] == 4'b0111))
      begin
	  count1 = 0;
	  for(m=0;m<j;m=m+1)
	    begin
		local = data1[m];
		if((count1 == 0) && (local[10:8] == cpx_spc4_data_cx2[10:8]) && (local[13:11] == cpx_spc4_data_cx2[13:11]) && (local[5:0] == cpx_spc4_data_cx2[5:0])) 
		  begin
		      stop_time = $time;
		      start_time = time1[m];
		      latency = (stop_time - start_time);
		      `PR_INFO("n2_int_latency", `INFO, "latency for interrupt between <C%h> <T%h> and <C%h> <T%h> is = %d",local[122:120],local[119:117],local[13:11],local[10:8],latency);
		      // $display("latency = %d \n",latency);
		      count1 = 1;
		      for(n=m;n<j;n=n+1) 
			begin
			    temp = n+1;
			    local = data1[temp];
			    data1[n] = local;
			   time1[n] = time1[temp];
			end
		      j = j-1;
		  end
	    end	
      end

    if((cpx_spc5_data_cx2[145] == 1'b1) && (cpx_spc5_data_cx2[144:141] == 4'b0111))
      begin
	  count1 = 0;
	  for(m=0;m<j;m=m+1)
	    begin
		local = data1[m];
		if((count1 == 0) && (local[10:8] == cpx_spc5_data_cx2[10:8]) && (local[13:11] == cpx_spc5_data_cx2[13:11]) && (local[5:0] == cpx_spc5_data_cx2[5:0])) 
		  begin
		      stop_time = $time;
		      start_time = time1[m];
		      latency = (stop_time - start_time);
		      `PR_INFO("n2_int_latency", `INFO, "latency for interrupt between <C%h> <T%h> and <C%h> <T%h> is = %d",local[122:120],local[119:117],local[13:11],local[10:8],latency);
		      // $display("latency = %d \n",latency);
		      count1 = 1;
		      for(n=m;n<j;n=n+1) 
			begin
			    temp = n+1;
			    local = data1[temp];
			    data1[n] = local;
			   time1[n] = time1[temp];
			end
		      j = j-1;
		  end
	    end	
      end
    

    if((cpx_spc6_data_cx2[145] == 1'b1) && (cpx_spc6_data_cx2[144:141] == 4'b0111))
      begin
	  count1 = 0;
	  for(m=0;m<j;m=m+1)
	    begin
		local = data1[m];
		if((count1 == 0) && (local[10:8] == cpx_spc6_data_cx2[10:8]) && (local[13:11] == cpx_spc6_data_cx2[13:11]) && (local[5:0] == cpx_spc6_data_cx2[5:0])) 
		  begin
		      stop_time = $time;
		      start_time = time1[m];
		      latency = (stop_time - start_time);
		      `PR_INFO("n2_int_latency", `INFO, "latency for interrupt between <C%h> <T%h> and <C%h> <T%h> is = %d",local[122:120],local[119:117],local[13:11],local[10:8],latency);
		      // $display("latency = %d \n",latency);
		      count1 = 1;
		      for(n=m;n<j;n=n+1) 
			begin
			    temp = n+1;
			    local = data1[temp];
			    data1[n] = local;
			   time1[n] = time1[temp];
			end
		      j = j-1;
		  end
	    end	
      end

    if((cpx_spc7_data_cx2[145] == 1'b1) && (cpx_spc7_data_cx2[144:141] == 4'b0111))
      begin
	  count1 = 0;
	  for(m=0;m<j;m=m+1)
	    begin
		local = data1[m];
		if((count1 == 0) && (local[10:8] == cpx_spc7_data_cx2[10:8]) && (local[13:11] == cpx_spc7_data_cx2[13:11]) && (local[5:0] == cpx_spc7_data_cx2[5:0])) 
		  begin
		      stop_time = $time;
		      start_time = time1[m];
		      latency = (stop_time - start_time);
		      `PR_INFO("n2_int_latency", `INFO, "latency for interrupt between <C%h> <T%h> and <C%h> <T%h> is = %d",local[122:120],local[119:117],local[13:11],local[10:8],latency);
		      // $display("latency = %d \n",latency);
		      count1 = 1;
		      for(n=m;n<j;n=n+1) 
			begin
			    temp = n+1;
			    local = data1[temp];
			    data1[n] = local;
			   time1[n] = time1[temp];
			end
		      j = j-1;
		  end
	    end	
      end

end // always @ (posedge clk)

endmodule // n2_int_latency
