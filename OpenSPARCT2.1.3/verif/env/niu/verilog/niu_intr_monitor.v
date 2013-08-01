// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_intr_monitor.v
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
`ifdef NIU_GATE
  //   Do nothing
`else

 `include "neptune_defines.h"

module niu_intr_monitor;
`ifdef NIU_SYSTEMC_T2
`else

   wire clk                   = `RDP.niu_pio.niu_clk;
   wire activate_ig_sm        = `RDP.niu_pio.niu_pio_ic.niu_pio_ig_sm.activate_ig_sm;
   wire activate_ig_sm_rel    = `RDP.niu_pio.niu_pio_ic.niu_pio_ig_sm.activate_ig_sm_rel;
   wire ibusy                 = `RDP.niu_pio.ibusy;
   wire [63:0] intr_req_group = `RDP.niu_pio.niu_pio_ic.intr_req_group;
   wire [63:0] intr_rel_group = `RDP.niu_pio.niu_pio_ic.intr_rel_group;

   reg         activate_ig_sm_2a;
   reg         activate_ig_sm_3a;
   reg         activate_ig_sm_4a;
   reg         activate_ig_sm_5a;
   reg         activate_ig_sm_6a;
   reg         activate_ig_sm_7a;
   reg         activate_ig_sm_8a;
   reg         activate_ig_sm_9a;
   reg         activate_ig_sm_10a;


   reg 	       count_req_clk_en_2a;
   reg 	       count_req_clk_en_3a;
   reg 	       count_req_clk_en_4a;
   reg 	       count_req_clk_en_5a;
   reg 	       count_req_clk_en_6a;
   
   
   reg 	       case_detected = 0;
   reg 	       req_rel_hit_skew0 = 0;
   reg 	       req_rel_hit_skew1 = 0;
   reg 	       req_rel_hit_skew2 = 0;
   reg 	       req_rel_hit_skew3 = 0;
   reg 	       req_rel_hit_skew4 = 0;
   reg 	       req_rel_hit_skew5 = 0;

   integer     count_req_clk = 0;
   reg 	       count_req_clk_en = 0;
   reg 	       end_of_req_signal = 0;
 	       
   integer     count_rel_clk = 0;
   reg 	       count_rel_clk_en = 0;
   reg 	       end_of_rel_signal = 0;
   



   reg 	       reverse_case_detected = 0;
   
   reg 	       count_rel_clk_en_2a;
   reg 	       count_rel_clk_en_3a;
   reg 	       count_rel_clk_en_4a;
   reg 	       count_rel_clk_en_5a;
   reg 	       count_rel_clk_en_6a;
   
   reg 	       activate_ig_sm_rel_2a;
   reg 	       activate_ig_sm_rel_3a;
   reg 	       activate_ig_sm_rel_4a;
   reg 	       activate_ig_sm_rel_5a;
   reg 	       activate_ig_sm_rel_6a;
   
   reg 	       rel_req_hit_skew1 = 0;
   reg 	       rel_req_hit_skew2 = 0;	 
   reg 	       rel_req_hit_skew3 = 0;
   reg 	       rel_req_hit_skew4 = 0;
   reg 	       rel_req_hit_skew5 = 0;


   reg [63:0]  intr_req_group_2a;
   reg [63:0]  intr_req_group_3a;
   reg [63:0]  intr_req_group_4a;
   reg [63:0]  intr_req_group_5a;
   reg [63:0]  intr_req_group_6a;   
   
   reg [63:0]  intr_rel_group_2a;
   reg [63:0]  intr_rel_group_3a;
   reg [63:0]  intr_rel_group_4a;
   reg [63:0]  intr_rel_group_5a;
   reg [63:0]  intr_rel_group_6a;   
   
   
   reg 	       req_rel_cov_en;  
   reg 	       rel_req_cov_en;

   
   wire req_rel_hit_skew0_noibusy;
   wire req_rel_hit_skew1_noibusy;
   wire req_rel_hit_skew2_noibusy;
   wire req_rel_hit_skew3_noibusy;
   wire req_rel_hit_skew4_noibusy;
   wire req_rel_hit_skew5_noibusy;

   wire req_rel_hit_skew0_ibusy;
   wire req_rel_hit_skew1_ibusy;
   wire req_rel_hit_skew2_ibusy;
   wire req_rel_hit_skew3_ibusy;
   wire req_rel_hit_skew4_ibusy;
   wire req_rel_hit_skew5_ibusy;
   
   wire rel_req_hit_skew1_noibusy;
   wire rel_req_hit_skew2_noibusy;
   wire rel_req_hit_skew3_noibusy;
   wire rel_req_hit_skew4_noibusy;
   wire rel_req_hit_skew5_noibusy;
   
   wire rel_req_hit_skew1_ibusy;
   wire rel_req_hit_skew2_ibusy;
   wire rel_req_hit_skew3_ibusy;
   wire rel_req_hit_skew4_ibusy;
   wire rel_req_hit_skew5_ibusy;

   
   
   //Create enable signal for coverage: req followed by release...
   always @(posedge activate_ig_sm)
     req_rel_cov_en <= 1;

   always @(posedge clk)
     if(end_of_req_signal && end_of_rel_signal && case_detected)
       req_rel_cov_en <= 0;
   
   
   
   
   //Create enable signal for coverage  release followed by req (reverse_case)...
   always @(posedge  activate_ig_sm_rel)   
     rel_req_cov_en <=1;
   
   always @(posedge clk)
     if(end_of_req_signal && end_of_rel_signal && reverse_case_detected)
       rel_req_cov_en <=0;
   
 

   //Stage group ID signals
   always @(posedge clk)
     begin
   	intr_req_group_2a <= intr_req_group;
  	intr_req_group_3a <= intr_req_group_2a;
   	intr_req_group_4a <= intr_req_group_3a;
   	intr_req_group_5a <= intr_req_group_4a;
   	intr_req_group_6a <= intr_req_group_5a;	
   	
   	intr_rel_group_2a <= intr_rel_group;
   	intr_rel_group_3a <= intr_rel_group_2a;
   	intr_rel_group_4a <= intr_rel_group_3a;
   	intr_rel_group_5a <= intr_rel_group_4a;
 	intr_rel_group_6a <= intr_rel_group_5a;	
     end // always @ (posedge clk)
   
   
   
   //Stage request signal (activate_ig_sm)
   always @(posedge clk)
     begin
	activate_ig_sm_2a <= activate_ig_sm;
	activate_ig_sm_3a  <= activate_ig_sm_2a;
	activate_ig_sm_4a  <= activate_ig_sm_3a;
	activate_ig_sm_5a  <= activate_ig_sm_4a;
	activate_ig_sm_6a  <= activate_ig_sm_5a;
	activate_ig_sm_7a  <= activate_ig_sm_6a;
	activate_ig_sm_8a  <= activate_ig_sm_7a;
	activate_ig_sm_9a  <= activate_ig_sm_8a;
	activate_ig_sm_10a <= activate_ig_sm_9a;

     end // always @ (posedge clk)

  
  //Stage count_req_clk_en signal...
   always @(posedge clk)
     begin
	count_req_clk_en_2a <= count_req_clk_en;
	count_req_clk_en_3a <= count_req_clk_en_2a;
	count_req_clk_en_4a <= count_req_clk_en_3a;
	count_req_clk_en_5a <= count_req_clk_en_4a;
	count_req_clk_en_6a <= count_req_clk_en_5a;
     end // always @ (posedge clk)
   
 



   // detect overlap of req followed by rel and sweep with in 6 cycles...

   always @(posedge clk)
     if (activate_ig_sm && !count_req_clk_en && activate_ig_sm_rel && !count_rel_clk_en && (intr_req_group !== intr_rel_group) )
       begin
	  req_rel_hit_skew0 <= 1;
	  case_detected <= 1;
	  
       end
     else if (activate_ig_sm_2a && !count_req_clk_en_2a  &&  activate_ig_sm_rel && !count_rel_clk_en && (intr_req_group_2a !== intr_rel_group) )
       begin
	  req_rel_hit_skew1 <= 1;
	  case_detected <= 1;
       end
     else if (activate_ig_sm_3a && !count_req_clk_en_3a &&  activate_ig_sm_rel && !count_rel_clk_en && (intr_req_group_3a !== intr_rel_group) )
       begin
	  req_rel_hit_skew2 = 1;
	  case_detected <= 1;
       end
     else if (activate_ig_sm_4a && !count_req_clk_en_4a &&  activate_ig_sm_rel && !count_rel_clk_en && (intr_req_group_4a !== intr_rel_group) )
       begin
	  req_rel_hit_skew3 = 1;
	  case_detected = 1;
       end
     else if (activate_ig_sm_5a && !count_req_clk_en_5a &&  activate_ig_sm_rel && !count_rel_clk_en && (intr_req_group_5a !== intr_rel_group) )
       begin
	  req_rel_hit_skew4 = 1;
	  case_detected = 1;
       end
     else if (activate_ig_sm_6a && !count_req_clk_en_6a &&  activate_ig_sm_rel && !count_rel_clk_en && (intr_req_group_6a !== intr_rel_group) )
       begin
	  req_rel_hit_skew5 = 1;
	  case_detected = 1;
       end
   
   // Now detect our cases!!! 
   // qualify our hits with ibusy...
   assign req_rel_hit_skew0_noibusy =  req_rel_hit_skew0 && !ibusy;
   assign req_rel_hit_skew1_noibusy =  req_rel_hit_skew1 && !ibusy;
   assign req_rel_hit_skew2_noibusy =  req_rel_hit_skew2 && !ibusy;
   assign req_rel_hit_skew3_noibusy =  req_rel_hit_skew3 && !ibusy;
   assign req_rel_hit_skew4_noibusy =  req_rel_hit_skew4 && !ibusy;
   assign req_rel_hit_skew5_noibusy =  req_rel_hit_skew5 && !ibusy;
   
   assign req_rel_hit_skew0_ibusy =  req_rel_hit_skew0 && ibusy;
   assign req_rel_hit_skew1_ibusy =  req_rel_hit_skew1 && ibusy;
   assign req_rel_hit_skew2_ibusy =  req_rel_hit_skew2 && ibusy;
   assign req_rel_hit_skew3_ibusy =  req_rel_hit_skew3 && ibusy;
   assign req_rel_hit_skew4_ibusy =  req_rel_hit_skew4 && ibusy;
   assign req_rel_hit_skew5_ibusy =  req_rel_hit_skew5 && ibusy;

   

  
   
   // Calculate length in clocks for the request signal
   always @(posedge clk)
     if (activate_ig_sm && !count_req_clk_en )
       begin
	  count_req_clk <= 1;
	  count_req_clk_en <= 1;
       end

   // clear signal denoting end_of_req
   always @(posedge activate_ig_sm)
	  end_of_req_signal <= 0;	    
   
   always @(posedge clk)
     begin
	if (count_req_clk_en) 
	  begin
	     if (activate_ig_sm) 
	       begin
	     	  count_req_clk = count_req_clk + 1;
	       end
	  end
     end
   
   always @(negedge clk)
     if (count_req_clk_en)
       begin
	  if (!activate_ig_sm)
	    begin
	       count_req_clk_en <= 0;
	       end_of_req_signal <= 1;
	    end
       end
   
   

   

   // Calculate length in clocks for the rel signal
   always @(posedge clk)
     if (activate_ig_sm_rel && !count_rel_clk_en )
       begin
	  count_rel_clk <= 1;
	  count_rel_clk_en <= 1;
       end
 
   // clear signal denoting end_of_rel
   always @(posedge activate_ig_sm_rel)
	  end_of_rel_signal <= 0;

   always @(posedge clk)
     begin
	if (count_rel_clk_en) 
	  begin
	     if (activate_ig_sm_rel) 
	       begin
	     	  count_rel_clk = count_rel_clk + 1;
	       end
	  end
     end
   

   always @(negedge clk)
     if (count_rel_clk_en)
       begin
	  if (!activate_ig_sm_rel)
	    begin
	       count_rel_clk_en <= 0;
	       end_of_rel_signal <= 1;
	    end
       end


   always @(posedge clk)
     if(end_of_req_signal && end_of_rel_signal && case_detected)
       begin

	  // reset signals...	  
	  case_detected <= 0;
	  
	  req_rel_hit_skew0 <= 0;
	  req_rel_hit_skew1 <= 0;
	  req_rel_hit_skew2 <= 0;
	  req_rel_hit_skew3 <= 0;
	  req_rel_hit_skew4 <= 0;
	  req_rel_hit_skew5 <= 0;

	  

	    
       end // if (end_of_req_signal && end_of_rel_signal && case_detected)

   
   
///   Now detect overlap of  release followed by req and sweep with in 6 cycles...


  // Stage count_rel_clk_en signal...
   always @(posedge clk)
     begin
	count_rel_clk_en_2a <= count_rel_clk_en;
	count_rel_clk_en_3a <= count_rel_clk_en_2a;
	count_rel_clk_en_4a <= count_rel_clk_en_3a;
	count_rel_clk_en_5a <= count_rel_clk_en_4a;
	count_rel_clk_en_6a <= count_rel_clk_en_5a;
     end // always @ (posedge clk)


   // Stage release signal (activate_ig_sm_rel)
   always @(posedge clk)
     begin
	activate_ig_sm_rel_2a <= activate_ig_sm_rel;
	activate_ig_sm_rel_3a <= activate_ig_sm_rel_2a;
	activate_ig_sm_rel_4a <= activate_ig_sm_rel_3a;
	activate_ig_sm_rel_5a <= activate_ig_sm_rel_4a;
	activate_ig_sm_rel_6a <= activate_ig_sm_rel_5a;

     end // always @ (posedge clk)
   

   // Now detect overlap...
   always @(posedge clk)
     if (activate_ig_sm && !count_req_clk_en  &&  activate_ig_sm_rel_2a && !count_rel_clk_en_2a && (intr_req_group !== intr_rel_group_2a) )
       begin
	  rel_req_hit_skew1 <= 1;
	  reverse_case_detected <= 1;
       end
     else if (activate_ig_sm && !count_req_clk_en  &&  activate_ig_sm_rel_3a && !count_rel_clk_en_3a && (intr_req_group !== intr_rel_group_3a) )
       begin
	  rel_req_hit_skew2 <= 1;
	  reverse_case_detected <= 1;
       end
        else if (activate_ig_sm && !count_req_clk_en  &&  activate_ig_sm_rel_4a && !count_rel_clk_en_4a && (intr_req_group !== intr_rel_group_4a) )
       begin
	  rel_req_hit_skew3 <= 1;
	  reverse_case_detected <= 1;
       end
        else if (activate_ig_sm && !count_req_clk_en  &&  activate_ig_sm_rel_5a && !count_rel_clk_en_5a && (intr_req_group !== intr_rel_group_5a) )
       begin
	  rel_req_hit_skew4 <= 1;
	  reverse_case_detected <= 1;
       end
        else if (activate_ig_sm && !count_req_clk_en  &&  activate_ig_sm_rel_6a && !count_rel_clk_en_6a && (intr_req_group !== intr_rel_group_6a) )
       begin
	  rel_req_hit_skew5 <= 1;
	  reverse_case_detected <= 1;
       end

   // Now detect our reverse cases!!!
   // qualify our hits with ibusy...
   assign rel_req_hit_skew1_noibusy =  rel_req_hit_skew1 && !ibusy;
   assign rel_req_hit_skew2_noibusy =  rel_req_hit_skew2 && !ibusy;
   assign rel_req_hit_skew3_noibusy =  rel_req_hit_skew3 && !ibusy;
   assign rel_req_hit_skew4_noibusy =  rel_req_hit_skew4 && !ibusy;
   assign rel_req_hit_skew5_noibusy =  rel_req_hit_skew5 && !ibusy;
   
   
   assign rel_req_hit_skew1_ibusy =  rel_req_hit_skew1 && ibusy;
   assign rel_req_hit_skew2_ibusy =  rel_req_hit_skew2 && ibusy;
   assign rel_req_hit_skew3_ibusy =  rel_req_hit_skew3 && ibusy;
   assign rel_req_hit_skew4_ibusy =  rel_req_hit_skew4 && ibusy;
   assign rel_req_hit_skew5_ibusy =  rel_req_hit_skew5 && ibusy;



   always @(posedge clk)
     if(end_of_req_signal && end_of_rel_signal && reverse_case_detected)
       begin
	  // reset signals...
	  reverse_case_detected <= 0;
	  
	  rel_req_hit_skew1 = 0;
	  rel_req_hit_skew2 = 0;	 
	  rel_req_hit_skew3 = 0;
	  rel_req_hit_skew4 = 0;
	  rel_req_hit_skew5 = 0;
   


    end // if (end_of_req_signal && end_of_rel_signal && reverse_case_detected)

   
   always @(posedge clk)
     if(!reverse_case_detected)
       begin
	  //  reset detect signals here...
	  //  rel_len1_ovrlp_req_len1_skew0 <= 0;
	  //  rel_len1_ovrlp_req_len1_skew1 <= 0;
	  //  rel_len1_ovrlp_req_len1_skew2 <= 0;
       end
   
   



   


				      

	


`endif // NIU_SYSTEMC_MODEL
endmodule // niu_intr_monitor

`endif  // if NIU_GATE... else...endif


