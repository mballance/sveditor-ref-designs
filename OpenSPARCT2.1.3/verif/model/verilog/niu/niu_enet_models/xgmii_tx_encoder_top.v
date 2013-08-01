// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xgmii_tx_encoder_top.v
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
module xgmii_tx_encoder_top (
                tx_clk,
                tx_rst,
                tx_enc_in,
                tx_ctrl_in,
                RDreg,
                tx_10b_enc_out_a,
                tx_10b_enc_out_b,
                tx_10b_enc_out_c,
                tx_10b_enc_out_d
               );

input        tx_clk; 
input        tx_rst; 
input[31:0]  tx_enc_in; 
input[3:0]   tx_ctrl_in; 

output        RDreg;

output [9:0] tx_10b_enc_out_a;
output [9:0] tx_10b_enc_out_b;
output [9:0] tx_10b_enc_out_c;
output [9:0] tx_10b_enc_out_d;



wire             even;
wire             is16;
wire             sp_tmp;
wire             send0_A;
wire             send1_A;
wire             send2_A;
wire             send3_A;

reg             r_send0_A;
reg             r_send1_A;
reg             r_send2_A;
reg             r_send3_A;

reg[7:0] idle_count;
reg [3:0]idle_cycle;

reg lane0,lane1,lane2,lane3;

reg trig;
reg trig_1;



wire [9:0] tx_10b_enc_out_a_enc;
wire [9:0] tx_10b_enc_out_b_enc;
wire [9:0] tx_10b_enc_out_c_enc;
wire [9:0] tx_10b_enc_out_d_enc;
   
reg [9:0] tx_10b_enc_out_a;
reg [9:0] tx_10b_enc_out_b;
reg [9:0] tx_10b_enc_out_c;
reg [9:0] tx_10b_enc_out_d;



integer remote_fault_start_time, remote_fault_stop_time;
reg fault_sel;
wire[31:0] tx_8bit_to_enc;
wire[3:0]  tx_ctrl_to_enc; 

initial begin
  if($test$plusargs("remote_fault_start_time="))
    remote_fault_start_time = $util_get_plus_args_num("remote_fault_start_time=");
  else remote_fault_start_time = 0;
  if($test$plusargs("remote_fault_stop_time="))
    remote_fault_stop_time = $util_get_plus_args_num("remote_fault_stop_time=");
  else remote_fault_stop_time = 0;
end

//-vcs_run_args=+remote_fault_start_time=42940000 \
//-vcs_run_args=+remote_fault_stop_time=42944000 \

always @(posedge tx_clk)
  if(remote_fault_start_time>0 & 
     $stime > remote_fault_start_time &
     $stime < remote_fault_stop_time) begin
    fault_sel=1;
    $display("Set fault_sel %m\n");
  end
  else fault_sel=0;

assign tx_8bit_to_enc = (fault_sel) ? {8'h2, 8'h0, 8'h0, 8'h9c} : tx_enc_in;
assign tx_ctrl_to_enc = tx_ctrl_in | {3'b0, fault_sel};  //only 9c is 'special' character



`ifdef TEST_XAUI_DESKEW

   // 0 Delay
   wire [9:0] tx_10b_enc_out_a_d0;
   wire [9:0] tx_10b_enc_out_b_d0;
   wire [9:0] tx_10b_enc_out_c_d0;
   wire [9:0] tx_10b_enc_out_d_d0;
   // 1 Delay
   reg [9:0]   tx_10b_enc_out_a_d1;
   reg [9:0]   tx_10b_enc_out_b_d1;
   reg [9:0]   tx_10b_enc_out_c_d1;
   reg [9:0]   tx_10b_enc_out_d_d1;
   // 2 Delay
   reg [9:0]   tx_10b_enc_out_a_d2;
   reg [9:0]   tx_10b_enc_out_b_d2;
   reg [9:0]   tx_10b_enc_out_c_d2;
   reg [9:0]   tx_10b_enc_out_d_d2;
   // 3 Delay 
   reg [9:0]   tx_10b_enc_out_a_d3;
   reg [9:0]   tx_10b_enc_out_b_d3;
   reg [9:0]   tx_10b_enc_out_c_d3;
   reg [9:0]   tx_10b_enc_out_d_d3;
   // 4 Delay 
   reg [9:0]   tx_10b_enc_out_a_d4;
   reg [9:0]   tx_10b_enc_out_b_d4;
   reg [9:0]   tx_10b_enc_out_c_d4;
   reg [9:0]   tx_10b_enc_out_d_d4;
   // 5 Delay
   reg [9:0]  tx_10b_enc_out_a_d5;
   reg [9:0]  tx_10b_enc_out_b_d5;
   reg [9:0]  tx_10b_enc_out_c_d5;
   reg [9:0]  tx_10b_enc_out_d_d5;
   
   reg [3:0] LANE0_CONFIG,LANE1_CONFIG,LANE2_CONFIG, LANE3_CONFIG;

   reg [8*60:1] lane0_arg,lane1_arg,lane2_arg,lane3_arg;
   reg enable_skew; // Can be use when dynamically the configuration needs to be changed
   
   
   initial begin
      LANE0_CONFIG = 4'h0;
      LANE1_CONFIG = 4'h0;
      LANE2_CONFIG = 4'h0;
      LANE3_CONFIG = 4'h0;
      enable_skew =1;

      lane0_arg = "LANE0_CONFIG=";
      if ($test$plusargs("LANE0_CONFIG="))
	LANE0_CONFIG = $util_get_plus_args_num(lane0_arg);
      else LANE0_CONFIG = 4'h0;

      lane1_arg = "LANE1_CONFIG=";
      if ($test$plusargs("LANE1_CONFIG="))
	LANE1_CONFIG = $util_get_plus_args_num(lane1_arg);
      else LANE1_CONFIG = 4'h0;

      lane2_arg = "LANE2_CONFIG=";
      if ($test$plusargs("LANE2_CONFIG="))
	LANE2_CONFIG = $util_get_plus_args_num(lane2_arg);
      else LANE2_CONFIG = 4'h0;

      lane3_arg = "LANE3_CONFIG=";
      if ($test$plusargs("LANE3_CONFIG="))
	LANE3_CONFIG = $util_get_plus_args_num(lane3_arg);
      else LANE3_CONFIG = 4'h0;

      $display(" XAUI Skew Test Config: Lane0 = %d, Lane1 = %d, Lane2 = %d, Lane3 = %d",LANE0_CONFIG,LANE1_CONFIG,LANE2_CONFIG,LANE3_CONFIG);
      
   end
   
   assign tx_10b_enc_out_a_d0  = tx_10b_enc_out_a_enc;
   assign tx_10b_enc_out_b_d0  = tx_10b_enc_out_b_enc;
   assign tx_10b_enc_out_c_d0  = tx_10b_enc_out_c_enc;
   assign tx_10b_enc_out_d_d0  = tx_10b_enc_out_d_enc;
   
   always@(posedge tx_clk) begin
      if(tx_rst) begin
	 tx_10b_enc_out_a_d1  <= 10'h4ff;
	 tx_10b_enc_out_a_d2  <= 10'h4ff;
	 tx_10b_enc_out_a_d3  <= 10'h4ff;
	 tx_10b_enc_out_a_d4  <= 10'h4ff;
	 tx_10b_enc_out_a_d5  <= 10'h4ff;


	 tx_10b_enc_out_b_d1  <= 10'h4ff;
	 tx_10b_enc_out_b_d2  <= 10'h4ff;
	 tx_10b_enc_out_b_d3  <= 10'h4ff;
	 tx_10b_enc_out_b_d4  <= 10'h4ff;
	 tx_10b_enc_out_b_d5  <= 10'h4ff;

	 tx_10b_enc_out_c_d1  <= 10'h4ff;
	 tx_10b_enc_out_c_d2  <= 10'h4ff;
	 tx_10b_enc_out_c_d3  <= 10'h4ff;
	 tx_10b_enc_out_c_d4  <= 10'h4ff;
	 tx_10b_enc_out_c_d5  <= 10'h4ff;

	 tx_10b_enc_out_d_d1  <= 10'h4ff;
	 tx_10b_enc_out_d_d2  <= 10'h4ff;
	 tx_10b_enc_out_d_d3  <= 10'h4ff;
	 tx_10b_enc_out_d_d4  <= 10'h4ff;
	 tx_10b_enc_out_d_d5  <= 10'h4ff;

 
      end else begin
	 tx_10b_enc_out_a_d1  <= tx_10b_enc_out_a_d0;
	 tx_10b_enc_out_a_d2  <= tx_10b_enc_out_a_d1;
	 tx_10b_enc_out_a_d3  <= tx_10b_enc_out_a_d2;
	 tx_10b_enc_out_a_d4  <= tx_10b_enc_out_a_d3;
	 tx_10b_enc_out_a_d5  <= tx_10b_enc_out_a_d4;

	 tx_10b_enc_out_b_d1  <= tx_10b_enc_out_b_d0;
	 tx_10b_enc_out_b_d2  <= tx_10b_enc_out_b_d1;
	 tx_10b_enc_out_b_d3  <= tx_10b_enc_out_b_d2;
	 tx_10b_enc_out_b_d4  <= tx_10b_enc_out_b_d3;
	 tx_10b_enc_out_b_d5  <= tx_10b_enc_out_b_d4;

	 tx_10b_enc_out_c_d1  <= tx_10b_enc_out_c_d0;
	 tx_10b_enc_out_c_d2  <= tx_10b_enc_out_c_d1;
	 tx_10b_enc_out_c_d3  <= tx_10b_enc_out_c_d2;
	 tx_10b_enc_out_c_d4  <= tx_10b_enc_out_c_d3;
	 tx_10b_enc_out_c_d5  <= tx_10b_enc_out_c_d4;

	 tx_10b_enc_out_d_d1  <= tx_10b_enc_out_d_d0;
	 tx_10b_enc_out_d_d2  <= tx_10b_enc_out_d_d1;
	 tx_10b_enc_out_d_d3  <= tx_10b_enc_out_d_d2;
	 tx_10b_enc_out_d_d4  <= tx_10b_enc_out_d_d3;
	 tx_10b_enc_out_d_d5  <= tx_10b_enc_out_d_d4;
	 
      end // else: !if(tx_rst)
   end // always@ (posedge tx_clk)
   
   always@(  tx_10b_enc_out_a_enc   or tx_10b_enc_out_a_d0  or tx_10b_enc_out_a_d1 or tx_10b_enc_out_a_d2 or tx_10b_enc_out_a_d3 or tx_10b_enc_out_a_d4  or
	     tx_10b_enc_out_a_d5  or

	     tx_10b_enc_out_b_enc   or tx_10b_enc_out_b_d0  or tx_10b_enc_out_b_d1 or tx_10b_enc_out_b_d2 or tx_10b_enc_out_b_d3 or tx_10b_enc_out_b_d4  or
	     tx_10b_enc_out_b_d5  or

	     tx_10b_enc_out_c_enc   or tx_10b_enc_out_c_d0  or tx_10b_enc_out_c_d1 or tx_10b_enc_out_c_d2 or tx_10b_enc_out_c_d3 or tx_10b_enc_out_c_d4  or
	     tx_10b_enc_out_c_d5   or

	     tx_10b_enc_out_d_enc   or tx_10b_enc_out_d_d0  or tx_10b_enc_out_d_d1 or tx_10b_enc_out_d_d2 or tx_10b_enc_out_d_d3 or tx_10b_enc_out_d_d4  or
	     tx_10b_enc_out_d_d5   or
	     
             LANE0_CONFIG or LANE1_CONFIG or LANE2_CONFIG or LANE3_CONFIG or enable_skew )
     
     begin
	
	if(!enable_skew) begin
	    tx_10b_enc_out_a = tx_10b_enc_out_a_enc;
	    tx_10b_enc_out_b = tx_10b_enc_out_b_enc;
	    tx_10b_enc_out_c = tx_10b_enc_out_c_enc;
	    tx_10b_enc_out_d = tx_10b_enc_out_d_enc;
	end
	else begin
	   case(LANE0_CONFIG)
	     4'b0000: begin
		tx_10b_enc_out_a = tx_10b_enc_out_a_d0;
	     end
	     4'b0001: begin
		tx_10b_enc_out_a = tx_10b_enc_out_a_d1;
	     end
	     4'b0010: begin
		tx_10b_enc_out_a = tx_10b_enc_out_a_d2;
	     end
	     4'b0011: begin
		tx_10b_enc_out_a = tx_10b_enc_out_a_d3;
	     end
	     4'b0100: begin
		tx_10b_enc_out_a = tx_10b_enc_out_a_d4;
	     end
	     4'b0101: begin
		tx_10b_enc_out_a = tx_10b_enc_out_a_d5;
	     end
	     default: begin
		$display(" ERROR Do You know What you are doing!! ");
	     end
	   endcase // case(LANE0_CONFIG)
	   
	   case(LANE1_CONFIG)
	     4'b0000: begin
		tx_10b_enc_out_b = tx_10b_enc_out_b_d0;
	     end
	     4'b0001: begin
		tx_10b_enc_out_b = tx_10b_enc_out_b_d1;
	     end
	     4'b0010: begin
		tx_10b_enc_out_b = tx_10b_enc_out_b_d2;
	     end
	     4'b0011: begin
		tx_10b_enc_out_b = tx_10b_enc_out_b_d3;
	     end
	     4'b0100: begin
		tx_10b_enc_out_b = tx_10b_enc_out_b_d4;
	     end
	     4'b0101: begin
		tx_10b_enc_out_b = tx_10b_enc_out_b_d5;
	     end
	     default: begin
		$display(" ERROR Do You know What you are doing!! ");
	     end
	   endcase // case(LANE1_CONFIG)

	   case(LANE2_CONFIG)
	     4'b0000: begin
		tx_10b_enc_out_c = tx_10b_enc_out_c_d0;
	     end
	     4'b0001: begin
		tx_10b_enc_out_c = tx_10b_enc_out_c_d1;
	     end
	     4'b0010: begin
		tx_10b_enc_out_c = tx_10b_enc_out_c_d2;
	     end
	     4'b0011: begin
		tx_10b_enc_out_c = tx_10b_enc_out_c_d3;
	     end
	     4'b0100: begin
		tx_10b_enc_out_c = tx_10b_enc_out_c_d4;
	     end
	     4'b0101: begin
		tx_10b_enc_out_c = tx_10b_enc_out_c_d5;
	     end
	     default: begin
		$display(" ERROR Do You know What you are doing!! ");
	     end
	   endcase // case(LANE2_CONFIG)

	   case(LANE3_CONFIG)
	     4'b0000: begin
		tx_10b_enc_out_d = tx_10b_enc_out_d_d0;
	     end
	     4'b0001: begin
		tx_10b_enc_out_d = tx_10b_enc_out_d_d1;
	     end
	     4'b0010: begin
		tx_10b_enc_out_d = tx_10b_enc_out_d_d2;
	     end
	     4'b0011: begin
		tx_10b_enc_out_d = tx_10b_enc_out_d_d3;
	     end
	     4'b0100: begin
		tx_10b_enc_out_d = tx_10b_enc_out_d_d4;
	     end
	     4'b0101: begin
		tx_10b_enc_out_d = tx_10b_enc_out_d_d5;
	     end
	     default: begin
		$display(" ERROR Do You know What you are doing!! ");
	     end
	   endcase // case(LANE3_CONFIG)


	end // else: !if(!enable_skew)
	
     end // always@ (  tx_10b_enc_out_a_enc   or tx_10b_enc_out_a_d0  or tx_10b_enc_out_a_d1 or tx_10b_enc_out_a_d2 or tx_10b_enc_out_a_d3 or tx_10b_enc_out_a_d4  or...
   
   
`else

   always@(tx_10b_enc_out_a_enc)
     tx_10b_enc_out_a = tx_10b_enc_out_a_enc;
   always@(tx_10b_enc_out_b_enc)
     tx_10b_enc_out_b = tx_10b_enc_out_b_enc;
   always@(tx_10b_enc_out_c_enc)
     tx_10b_enc_out_c = tx_10b_enc_out_c_enc;
   always@(tx_10b_enc_out_d_enc)
     tx_10b_enc_out_d = tx_10b_enc_out_d_enc;

`endif
   
   


   

always @ (tx_ctrl_in or tx_enc_in )
 begin
   if ((tx_ctrl_in[0] == 1) & (tx_enc_in[7:0] == 8'hfd))
     begin
       lane0 =1;
       lane1 =0;
       lane2 =0;
       lane3 =0;
     end
   else if ((tx_ctrl_in[1] == 1) & (tx_enc_in[15:8] == 8'hfd))
     begin
       lane0 =0;
       lane1 =1;
       lane2 =0;
       lane3 =0;
     end
   else if ((tx_ctrl_in[2] == 1) & (tx_enc_in[23:16] == 8'hfd))
     begin
       lane0 =0;
       lane1 =0;
       lane2 =1;
       lane3 =0;
     end
   else if ((tx_ctrl_in[3] == 1) & (tx_enc_in[31:24] == 8'hfd))
     begin
       lane0 =0;
       lane1 =0;
       lane2 =0;
       lane3 =1;
     end
   else 
     begin
       lane0 =0;
       lane1 =0;
       lane2 =0;
       lane3 =0;
     end
  end

 always @ (posedge tx_clk)
   begin
      if (lane0 == 1)  
        begin
          repeat(1) @(posedge tx_clk)
          trig = 1;
        end
      else if (lane1 == 1)  
        begin
          repeat(1) @(posedge tx_clk)
          trig = 1;
        end
      else if (lane2 == 1)  
        begin
          repeat(1) @(posedge tx_clk)
          trig = 1;
        end
      else if (lane3 == 1)  
        begin
          trig = 1;
        end
      else
        begin
          trig = 0;
        end
   end

  


always @ (posedge tx_clk)
  begin
  if( tx_rst|(idle_count == 8'b1111_1111) | 
  ((tx_ctrl_in[0] == 1) & (tx_enc_in[7:0] == 8'hfb)) | 
  (lane0 == 1) | (lane1 == 1) | (lane2 == 1) | (lane3 ==1) )
    begin
     idle_count = 0;
    end

   else if( ((tx_ctrl_in[0] == 1) & (tx_enc_in[7:0] == 8'h07)) | 
            ((tx_ctrl_in[1] == 1) & (tx_enc_in[15:8] == 8'h07)) | 
            ((tx_ctrl_in[2] == 1) & (tx_enc_in[23:16] == 8'h07))| 
            ((tx_ctrl_in[3] == 1) & (tx_enc_in[31:24] == 8'h07))  ) 
            //((tx_ctrl_in[3] == 1) & (tx_enc_in[31:24] == 8'h07)) && (trig | trig1 ) ) 
    begin
      idle_count = idle_count + 1;
    end
   else
    begin
      idle_count = idle_count ;
     
    end
  end

always @(tx_ctrl_in or tx_enc_in)
  begin
   if  ((tx_ctrl_in[0] == 1) & (tx_enc_in[7:0] == 8'h07))   
     begin
      idle_cycle[0] = 1'b1;
      //idle_cycle[3:1] = 3'b000;
     end
   else
      idle_cycle[0] = 1'b0;
 end

always @(tx_ctrl_in or tx_enc_in)
  begin
    if ((tx_ctrl_in[1] == 1) & (tx_enc_in[15:8] == 8'h07))     
     begin
      //idle_cycle[0] = 1'b0;
      idle_cycle[1] = 1'b1;
      //idle_cycle[3:2] = 2'b00;
     end
   else
      idle_cycle[1] = 1'b0;
 end

always @(tx_ctrl_in or tx_enc_in)
  begin
   if ((tx_ctrl_in[2] == 1) & (tx_enc_in[23:16] == 8'h07))     
     begin
      //idle_cycle[1:0] = 2'b00;
      idle_cycle[2] = 1'b1;
      //idle_cycle[3] = 1'b0;
     end
   else
      idle_cycle[2] = 1'b0;
 end

always @(tx_ctrl_in or tx_enc_in)
  begin
  if ((tx_ctrl_in[3] == 1) & (tx_enc_in[31:24] == 8'h07)) 
     begin
      //idle_cycle[2:0] = 3'b000;
      idle_cycle[3] = 1'b1;
     end
   else
      idle_cycle[3] = 1'b0;
  end

always @(lane0 or tx_ctrl_in or tx_enc_in  )
  begin
    if ( (lane0 == 1) & ( ((tx_ctrl_in[1] == 1) & (tx_enc_in[15:8])) |  ((tx_ctrl_in[2] == 1) & (tx_enc_in[23:16] == 8'h07)) || ((tx_ctrl_in[3] == 1) & (tx_enc_in[31:24] == 8'h07)) ) )
     begin
       r_send1_A = 1'b1;
       r_send2_A = 1'b1;
       r_send3_A = 1'b1;
     end
    else
      begin
       r_send1_A = 1'b0;
       r_send2_A = 1'b0;
       r_send3_A = 1'b0;
      end
  end


always @(lane1 or tx_ctrl_in or tx_enc_in  )
  begin
    if ( (lane1 == 1) & ( ((tx_ctrl_in[2] == 1) & (tx_enc_in[23:16] == 8'h07)) || ((tx_ctrl_in[3] == 1) & (tx_enc_in[31:24] == 8'h07)) ) )
     begin
       r_send2_A = 1'b1;
       r_send3_A = 1'b1;
     end
    else
     begin
       r_send2_A = 1'b0;
       r_send3_A = 1'b0;
     end

  end

always @(lane2 or tx_ctrl_in or tx_enc_in  )
  begin
    if ( (lane2 == 1) & ((tx_ctrl_in[3] == 1) & (tx_enc_in[31:24] == 8'h07)) )
       r_send3_A = 1'b1;
    else
       r_send3_A = 1'b0;
  end


  // -- Adding these for creating random spacing between |A|
  // characters

reg [7:0] random_spacing_count;
reg [31:0] spacing;
reg [31:0] seed;


initial random_spacing_count =0;
initial seed =0;

always@(posedge tx_clk) begin
	spacing = $random(seed);
	spacing = spacing %16;
	random_spacing_count = spacing + 16;
end

assign sp_tmp = tx_ctrl_in[3] | tx_ctrl_in[2] | tx_ctrl_in[1] | tx_ctrl_in[0];

assign even = ((idle_count %4 ==0 ) & (sp_tmp) )? 1:0;
// assign is16 = ((idle_count %16 ==0 ) & (sp_tmp))? 1:0;
assign is16 = ((idle_count %random_spacing_count ==0 ) & (sp_tmp))? 1:0;

assign send0_A = 0;
assign send1_A = r_send1_A;
assign send2_A = r_send2_A;
assign send3_A = r_send3_A;


xgmii_tx_encoder #0 xgmii_A_enc (
    .tx_clk         (tx_clk),  
    .tx_rst         (tx_rst), 
    .idle_cycle     (idle_cycle[0]),
    .even           (even),
    .is16           (is16),
    .eop            (send0_A),
    .tx_8b_enc_in   (tx_8bit_to_enc[7:0]), 
    .special        (tx_ctrl_to_enc[0]), 
    //.special        (tx_ctrl_in[0]), 
    .RDreg          (RDreg), 
    .tx_10b_enc_out (tx_10b_enc_out_a_enc[9:0])  
    );

xgmii_tx_encoder #1 xgmii_B_enc (
    .tx_clk         (tx_clk),  
    .tx_rst         (tx_rst), 
    .idle_cycle     (idle_cycle[1]),
    .even           (even),
    .is16           (is16),
    .eop            (send1_A),
    .tx_8b_enc_in   (tx_8bit_to_enc[15:8]), 
    .special        (tx_ctrl_to_enc[1]), 
    //.special        (tx_ctrl_in[1]), 
    .RDreg          (RDreg), 
    .tx_10b_enc_out (tx_10b_enc_out_b_enc[9:0])  
    );

xgmii_tx_encoder #2 xgmii_C_enc (
    .tx_clk         (tx_clk),  
    .tx_rst         (tx_rst), 
    .idle_cycle     (idle_cycle[2]),
    .even           (even),
    .is16           (is16),
    .eop            (send2_A),
    .tx_8b_enc_in   (tx_8bit_to_enc[23:16]), 
    .special        (tx_ctrl_to_enc[2]), 
    //.special        (tx_ctrl_in[2]), 
    .RDreg          (RDreg), 
    .tx_10b_enc_out (tx_10b_enc_out_c_enc[9:0])  
    );

xgmii_tx_encoder #3 xgmii_D_enc (
    .tx_clk         (tx_clk),  
    .tx_rst         (tx_rst), 
    .idle_cycle     (idle_cycle[3]),
    .even           (even),
    .is16           (is16),
    .eop            (send3_A),
    .tx_8b_enc_in   (tx_8bit_to_enc[31:24]), 
    .special        (tx_ctrl_to_enc[3]), 
    //.special        (tx_ctrl_in[3]), 
    .RDreg          (RDreg), 
    .tx_10b_enc_out (tx_10b_enc_out_d_enc[9:0])  
    );



endmodule

