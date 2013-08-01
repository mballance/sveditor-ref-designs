// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: unh_checker.v
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
`define SYNC_RULES 2
`define ALIGN_RULES 1
`define DATA_RULES 3
`define RECEIVE_GOOD_DATA 1
`define DONOT_RECEIVE_DATA 2
`define RECEIVE_ERROR_DATA 3
`define RECEIVE_GOOD_DATA_RND_LENGTH 4

module unh_checks( ref_clk) ;
   input ref_clk;

   wire  unh_vectors_valid;   
   wire [15:0] vector_index;
 
   reg 	       align_status;  
   reg [3:0]  sync_status;
   reg [22:0] rxc_stat0;
   reg        rxc_ctrl0;
   reg [63:0] rxc_data0;
   reg        rxc_tag0;
   
   // Encoding for these memory locations: [0] == valid?
   //                                      [4:1] == Value to check for
   //                                      [20:5] == min value of the vector index
   //                                      [36:21] == max value of the vector index
   // 

   reg [36:0] AlignCheck [10:0];
   reg [36:0] SyncCheck [10:0];
   reg [36:0] DataCheck [10:0];

   reg [3:0] AlignCheckIndex,SyncCheckIndex,DataCheckIndex;
   reg [31:0] A_MatchCount,S_MatchCount,D_MatchCount;
   wire [36:0] CurrentACheck,CurrentSCheck,CurrentDCheck;
   wire [15:0] A_VectorMin,A_VectorMax,S_VectorMin,S_VectorMax,D_VectorMin,D_VectorMax;
   wire A_Valid,A_RangeMatch,S_Valid,S_RangeMatch,D_Valid,D_RangeMatch;
   wire [3:0] S_Value,D_Value;

   reg A_CheckFreeze;
   
   integer mac_port;
   reg [8*60:1] arg;

initial
  begin
   
  arg = "GET_MAC_PORTS=";
   if ($test$plusargs("GET_MAC_PORTS="))
	mac_port =  $util_get_plus_args_num(arg);

  end

`ifdef TEST_UNH_VECTORS

 `ifdef NEPTUNE
   assign unh_vectors_valid = neptune_tb_top.enet_model.USE_UNH_VECTOR;
   assign vector_index = neptune_tb_top.enet_model.vector_loc;
 `else
   assign unh_vectors_valid = tb_top.enet_model.USE_UNH_VECTOR;
   assign vector_index = tb_top.enet_model.vector_loc;
 `endif

 `ifdef NEPTUNE
   always @(posedge ref_clk)
     begin    
     	if(mac_port == 0)
	  begin
	     
	     align_status <= neptune_tb_top.neptune_htm.u_neptune_hcm.neptune_core.niu.mac4.mac_4ports.xmac_2pcs_core_port0.xpcs.xpcs_pio.csr_link_status;
	     sync_status  <= neptune_tb_top.neptune_htm.u_neptune_hcm.neptune_core.niu.mac4.mac_4ports.xmac_2pcs_core_port0.xpcs.xpcs_pio.csr_lane_sync_status[3:0];
	     rxc_stat0    <= neptune_tb_top.neptune_htm.u_neptune_hcm.neptune_core.niu.mac4.mac_4ports.mac_rxc_stat0[22:0];
	     rxc_ctrl0    <= neptune_tb_top.neptune_htm.u_neptune_hcm.neptune_core.niu.mac4.mac_4ports.mac_rxc_ctrl0;
	     rxc_data0    <= neptune_tb_top.neptune_htm.u_neptune_hcm.neptune_core.niu.mac4.mac_4ports.mac_rxc_data0;
	     rxc_tag0     <= neptune_tb_top.neptune_htm.u_neptune_hcm.neptune_core.niu.mac4.mac_4ports.mac_rxc_tag0;
	  end
     	else if(mac_port == 1)
	  begin
	     align_status <= neptune_tb_top.neptune_htm.u_neptune_hcm.neptune_core.niu.mac4.mac_4ports.xmac_2pcs_core_port1.xpcs.xpcs_pio.csr_link_status;
	     sync_status  <= neptune_tb_top.neptune_htm.u_neptune_hcm.neptune_core.niu.mac4.mac_4ports.xmac_2pcs_core_port1.xpcs.xpcs_pio.csr_lane_sync_status[3:0] ;
	     rxc_stat0    <= neptune_tb_top.neptune_htm.u_neptune_hcm.neptune_core.niu.mac4.mac_4ports.mac_rxc_stat1[22:0];
	     rxc_ctrl0    <= neptune_tb_top.neptune_htm.u_neptune_hcm.neptune_core.niu.mac4.mac_4ports.mac_rxc_ctrl1;
	     rxc_data0    <= neptune_tb_top.neptune_htm.u_neptune_hcm.neptune_core.niu.mac4.mac_4ports.mac_rxc_data1;
	     rxc_tag0     <= neptune_tb_top.neptune_htm.u_neptune_hcm.neptune_core.niu.mac4.mac_4ports.mac_rxc_tag1;
	  end
     end // always @ (posedge ref_clk)
   
 `else
   always @(posedge ref_clk)
     begin    
     	if(mac_port == 0)
	  begin
	     align_status <= tb_top.cpu.mac.mac_core.mac_2ports.xmac_2pcs_core_port0.xpcs.xpcs_pio.csr_link_status;
	     sync_status <= tb_top.cpu.mac.mac_core.mac_2ports.xmac_2pcs_core_port0.xpcs.xpcs_pio.csr_lane_sync_status[3:0] ;
	     rxc_stat0 <= tb_top.cpu.mac.mac_core.mac_2ports.mac_rxc_stat0[22:0];
	     rxc_ctrl0 <= tb_top.cpu.mac.mac_core.mac_2ports.mac_rxc_ctrl0;
	     rxc_data0 <= tb_top.cpu.mac.mac_core.mac_2ports.mac_rxc_data0;
	     rxc_tag0 <=  tb_top.cpu.mac.mac_core.mac_2ports.mac_rxc_tag0;
	  end
	else if(mac_port == 1)
	  begin
	     align_status <= tb_top.cpu.mac.mac_core.mac_2ports.xmac_2pcs_core_port1.xpcs.xpcs_pio.csr_link_status;
	     sync_status <= tb_top.cpu.mac.mac_core.mac_2ports.xmac_2pcs_core_port1.xpcs.xpcs_pio.csr_lane_sync_status[3:0] ;
	     rxc_stat0 <= tb_top.cpu.mac.mac_core.mac_2ports.mac_rxc_stat1[22:0];
	     rxc_ctrl0 <= tb_top.cpu.mac.mac_core.mac_2ports.mac_rxc_ctrl1;
	     rxc_data0 <= tb_top.cpu.mac.mac_core.mac_2ports.mac_rxc_data1;
	     rxc_tag0 <=  tb_top.cpu.mac.mac_core.mac_2ports.mac_rxc_tag1;
	  end
     end // always @ (posedge ref_clk)

 `endif // !`ifdef NEPTUNE

     

   integer    fd0,nfd,i;
   reg [15:0] max,min;
   reg [3:0]  value;
   reg [1:0]  type; // 4 types are defined. 1 -- Align Rules
                    //                      2 -- Sync Rules
                    //                      3 -- Data Rules
                    //                      0 -- End of File indicator

   reg done;
   
   reg [180*8:0] unh_rules_filename;
   
   integer plus_args_ok;

   initial begin


      // Add code to initialize all the CheckRAMS

      for(i =0;i<=10;i=i+1) begin
	 AlignCheck[i] =0;
	 SyncCheck[i] = 0;
	 DataCheck[i] = 0;
      end
      SyncCheckIndex =0;
      AlignCheckIndex =0;
      DataCheckIndex =0;
      
      $display("################################################");
      $display("################################################");
      unh_rules_filename = "UNH_Rules";
      // plus_args_ok = $util_get_plus_args_str("UNH_RULE_FILE_",unh_rules_filename);
      plus_args_ok = $value$plusargs("UNH_RULE_FILE=%s", unh_rules_filename);
      
      if(plus_args_ok)
	$display("UNH_DEBUG: UNH Rules Files -- %s",unh_rules_filename);
      else begin
	 unh_rules_filename = "UNH_Rules";
	$display("UNH_DEBUG: No Rules File Specified Using Default FileName-- %s",unh_rules_filename);
	$display("UNH_DEBUG: UNH Rules Files -- %s",unh_rules_filename);
      end
	  
      // Read the Rules file here and set up the CheckRAMs
      $display("UNH_DEBUG: Reading UNH Rules File ");
      fd0=$fopen(unh_rules_filename,"r");
      done =0;
      if(!fd0) begin
	      $display("WARNING: File %s Doesnt Exist Skipping Rule Checking",unh_rules_filename);
	      done =1;
      end
      while(!done) begin
	 nfd=$fscanf(fd0,"%d %d %d %h",type,max,min,value);
	 // $display("UNH_DEBUG: Rules Read -- %d %d %d %h",type,max,min,value);
	 display_rules( type,max,min,value );
	 if(max < min) begin
	    $display("UNH_DEBUG: ERROR in the Rules File!! -- FIX IT :--%d %d %d %h",type,max,min,value);
	 end
	 
	 // $display("%d %d %d %h",type,max,min,value);
	 if(type ==0) done =1;
	 else begin
	    case(type)
	      `SYNC_RULES: begin
		 SyncCheck[ SyncCheckIndex] = { max,min,value,1'b1};
		 SyncCheckIndex = SyncCheckIndex + 1;
	      end
	      `ALIGN_RULES: begin
		 AlignCheck[ AlignCheckIndex] = { max,min,value,1'b1};
		 AlignCheckIndex = AlignCheckIndex + 1;
	      end
	      `DATA_RULES: begin
		 DataCheck[ DataCheckIndex] = { max,min,value,1'b1};
		 DataCheckIndex = DataCheckIndex + 1;
	      end
	      
	      default: begin
		 $display("UNH_DEBUG: Data Rules Not yet Supported ");
	      end
	    endcase // case(type)
	 end // else: !if(type ==0)
      end // while (!done)
      SyncCheck[ SyncCheckIndex] = { max,min,value,1'b0};
      AlignCheck[ AlignCheckIndex] = { max,min,value,1'b0};
      DataCheck[ DataCheckIndex] = { max,min,value,1'b0};
      
      
      $display("################################################");
      $display("################################################");
      
      AlignCheckIndex =0;
      SyncCheckIndex =0;
      DataCheckIndex =0;

   end // initial begin
   
   task display_rules;// ( type,max,min,value);
      input [1:0] type;
      input [15:0] max;
      input [15:0] min;
      input [3:0] value;
      begin
	 case(type)
	   2'b0: begin
	      $display("UNH_DEBUG: End of Rule File");
	   end
	   `SYNC_RULES: begin
	      $display("UNH_DEBUG: Expected Value for SyncStatus = %h: Between Vector Range- Max = %d Min = %d",value,max,min);
	   end
	   `ALIGN_RULES: begin
	      $display("UNH_DEBUG: Expected Value for AlignStatus = %h: Between Vector Range- Max = %d Min = %d",value,max,min);
	   end
	   `DATA_RULES: begin

	      case(value)
		`RECEIVE_GOOD_DATA: begin
		   //$display("UNH_DEBUG: MAC Expected to receive 'good_data' of length 0x230: Between Vector Range- Max = %d Min = %d",max,min);
		   $display("UNH_DEBUG: MAC Expected to receive 'good_data' (no abort bit and no crc bit set): Between Vector Range- Max = %d Min = %d",max,min);
		end
		`DONOT_RECEIVE_DATA: begin
		   $display("UNH_DEBUG: MAC Not Expected to any data: Between Vector Range- Max = %d Min = %d",max,min);
		end
		`RECEIVE_ERROR_DATA: begin
		   $display("UNH_DEBUG: MAC Expected to receive data with ErrorBit Set: Between Vector Range- Max = %d Min = %d",max,min);
		end
		`RECEIVE_GOOD_DATA_RND_LENGTH: begin
		   $display("UNH_DEBUG: MAC Expected to receive 'good_data' of any length : Between Vector Range- Max = %d Min = %d",max,min);
		end
		
		default: begin
		   $display("UNH_DEBUG:ERROR Data Rule not defined!! Fix It-");
		end
	      endcase // case(value)
	   end // case: `DATA_RULES
	   default: begin
	      $display("UNH_DEBUG: ERROR Illegal Type Specified in RuleFile - FIX IT--");
	   end
	 endcase // case(type)
      end
   endtask // display_rules
   
      

// Check Align Rules
   
   assign CurrentACheck = AlignCheck[AlignCheckIndex];
   assign A_VectorMin = CurrentACheck[20:5];
   assign A_VectorMax = CurrentACheck[36:21];
   assign A_Value = CurrentACheck[4:1];
   assign A_Valid = CurrentACheck[0];
   assign A_RangeMatch = A_Valid & unh_vectors_valid & ( vector_index >= A_VectorMin) & ( vector_index < A_VectorMax);


   
     always@(posedge ref_clk) begin
	if(A_Valid & unh_vectors_valid & ( vector_index >= A_VectorMax)) begin
	  AlignCheckIndex <= AlignCheckIndex +1;
	   if(A_MatchCount==0) begin
	      $display("UNH_DEBUG:  ERROR align_status Did Not Match as expected!! AlignCheckIndex = %d Time = %t",AlignCheckIndex,$time);
	   end else begin
	      $display("UNH_DEBUG:  align_status Matched as expected!! AlignCheckIndex = %d Time = %t",AlignCheckIndex,$time);
	   end
	end // if (A_Valid & unh_vectors_valid & ( vector_index == A_VectorMax))
	
     end

   always@(posedge ref_clk) begin
      if(A_RangeMatch) begin
	 if(!A_CheckFreeze & (A_Value == align_status)) begin
	    A_MatchCount <= A_MatchCount + 1;
	 end else if(A_Value != align_status) begin // if (!A_CheckFreeze & (A_Value == align_status))
	    A_MatchCount <=0;
	    A_CheckFreeze <=1;
	 end

      end else begin
	 A_MatchCount <=0;
	 A_CheckFreeze <=0;
      end // else: !if(A_RangeMatch)
   end
   

   
// Check Sync Rules
   assign CurrentSCheck = SyncCheck[SyncCheckIndex];
   assign S_VectorMin = CurrentSCheck[20:5];
   assign S_VectorMax = CurrentSCheck[36:21];
   assign S_Value = CurrentSCheck[4:1];
   assign S_Valid = CurrentSCheck[0];
   assign S_RangeMatch = S_Valid & unh_vectors_valid & ( vector_index >= S_VectorMin) & ( vector_index < S_VectorMax);

   
     always@(posedge ref_clk) begin
	if(S_Valid & unh_vectors_valid & ( vector_index >= S_VectorMax)) begin
	  SyncCheckIndex <= SyncCheckIndex +1;
	   if(S_MatchCount==0) begin
	      $display("UNH_DEBUG:  ERROR sync_status Did Not Match as expected!! SyncCheckIndex = %d Time = %t",SyncCheckIndex,$time);
	   end else begin
	      $display("UNH_DEBUG:  sync_status Matched as expected!! SyncCheckIndex = %d Time = %t",SyncCheckIndex,$time);
	   end
	end // if (A_Valid & unh_vectors_valid & ( vector_index == A_VectorMax))
	
     end

   always@(posedge ref_clk) begin
      if(S_RangeMatch) begin
	 if(S_Value == sync_status) begin
	    S_MatchCount <= S_MatchCount + 1;
	 end
      end else begin
	 S_MatchCount <=0;
      end // else: !if(S_RangeMatch)
   end 

// Check Data Rules
   
   assign CurrentDCheck = DataCheck[DataCheckIndex];
   assign D_VectorMin = CurrentDCheck[20:5];
   assign D_VectorMax = CurrentDCheck[36:21];
   assign D_Value = CurrentDCheck[4:1];
   assign D_Valid = CurrentDCheck[0];
   assign D_RangeMatch = D_Valid & unh_vectors_valid & ( vector_index >= D_VectorMin) & ( vector_index < D_VectorMax);

   
     always@(posedge ref_clk) begin
	if(D_Valid & unh_vectors_valid & ( vector_index >= D_VectorMax)) begin
	  DataCheckIndex <= DataCheckIndex +1;
	   if(D_MatchCount==0) begin
	      $display("UNH_DEBUG:  ERROR data_status Did Not Match as expected!! DataCheckIndex = %d Time = %t",DataCheckIndex,$time);
	   end else begin
	      $display("UNH_DEBUG:  data_status Matched as expected!! DataCheckIndex = %d Time = %t",DataCheckIndex,$time);
	   end
	end // if (A_Valid & unh_vectors_valid & ( vector_index == A_VectorMax))
	
     end

   always@(posedge ref_clk) begin
      if(D_RangeMatch) begin
	 if(D_Value == `RECEIVE_GOOD_DATA) begin
           //if(rxc_tag0 & (rxc_stat0 == 23'hc0230)) begin
	   if(rxc_tag0 & (rxc_stat0[15:14] == 2'b0)) begin  // bit 15: abort bit; bit 14: bad crc 
	      D_MatchCount <=1;
         $display("RAK_DEBUG rxc_tag0 is %d rxc_stat0 is %h at time %t", rxc_tag0, rxc_stat0, $time);
	       
	    end // if (rxc_tag0 & (rxc_stat0 == 23'hc0230) begin...
	 end // if (D_Value == `RECEICE_GOOD_DATA)

	 if(D_Value == `DONOT_RECEIVE_DATA) begin
	    // This needs to be recoded
	    if(!(rxc_tag0 & (rxc_stat0 == 23'hc0230))) begin
	       D_MatchCount <= 1 ;
	    end // if (!(rxc_tag0 & (rxc_stat0 == 23'hc0230)))
	    else D_MatchCount <=0;
	 end // if (D_Value == `DONOT_RECEIVE_DATA)
	 
	  if(D_Value == `RECEIVE_ERROR_DATA) begin
	     if(rxc_tag0 &(rxc_stat0[14]==1))
	       D_MatchCount <=1; 
	  end // if (D_VALUE == `RECEIVE_ERROR_DATA)
	 
	  if(D_Value == `RECEIVE_GOOD_DATA_RND_LENGTH) begin
	     if(rxc_tag0 &(rxc_stat0[14]!=1))
	       D_MatchCount <=1; 
	  end // if (D_VALUE == `RECEIVE_GOOD_DATA_RND_LENGTH)
	 
      end else begin
	 D_MatchCount <=0;
      end // else: !if(D_RangeMatch)
   end 
   
`endif //  `ifdef TEST_UNH_VECTORS
   
   
endmodule // unh_checks

   
