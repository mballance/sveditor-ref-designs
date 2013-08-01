// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_dmc_txcif.v
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

/*********************************************************************
 *
 * 
 *  Orignal Author(s):   Arvind Srinivasan
 *  Modifier(s):
 *  Project(s):          Neptune
 *
 *  Copyright (c) 2004   Sun Microsystems, Inc.
 *
 *  All Rights Reserved.
 *
 *  This verilog model is the confidential and proprietary property of
 *  Sun Microsystems, Inc., and the possession or use of this model
 *  requires a written license from Sun Microsystems, Inc.
 *
 **********************************************************************/



module niu_dmc_txcif ( /*AUTOARG*/
   // Outputs
   inc_head_shadow, incr_read_ptr, gotnxtdesc, read_req, 
   dmc_txc_dma_descriptor, dmc_txc_dma_partial, cache_ready, 
   reset_cache_pointers, dma_reset_done_hold, 
   dmc_txc_dma_reset_scheduled,  
   set_pref_buf_par_err_dma, set_pkt_part_err_dma, 
   pkt_part_error_address_dma, 
   // Inputs
   SysClk, Reset_L, read_gnt, getnxtdesc, empty, dma_cache_readdata, 
   dma_cache_tags, cache_filled_size, cache_entry_valid, 
   page0_mask_dma, page0_value_dma, page0_reloc_dma, page0_valid_dma, 
   page1_mask_dma, page1_value_dma, page1_reloc_dma, page1_valid_dma, 
   dma_reset_scheduled, txc_dmc_dma_reset_done, cache_parity_status,tx_dma_cfg_dma_stop
   );  
   input SysClk;
   input Reset_L;
   input read_gnt;
   input getnxtdesc;
   input empty;
   input [127:0] dma_cache_readdata;

   input [3:0] 	 dma_cache_tags;
   input [4:0] 	 cache_filled_size;

   output 	 inc_head_shadow;
   input 	 cache_entry_valid;      
   input         tx_dma_cfg_dma_stop;

   output 	 incr_read_ptr;
   output 	 gotnxtdesc;
   output 	 read_req;
   output [63:0] dmc_txc_dma_descriptor;
   output 	 dmc_txc_dma_partial;
   output 	 cache_ready;
   output 	 reset_cache_pointers;

   input [31:0]  page0_mask_dma;
   input [31:0]  page0_value_dma;
   input [31:0]  page0_reloc_dma;
   input 	 page0_valid_dma;
   input [31:0]  page1_mask_dma;
   input [31:0]  page1_value_dma;
   input [31:0]  page1_reloc_dma;
   input 	 page1_valid_dma;

   input 	 dma_reset_scheduled;
   output 	 dma_reset_done_hold;
   input 	 txc_dmc_dma_reset_done;
   output 	 dmc_txc_dma_reset_scheduled;
   input 	 cache_parity_status;


   output 	 set_pref_buf_par_err_dma;
   output 	 set_pkt_part_err_dma;
   output [43:0] pkt_part_error_address_dma;


   reg 		 latch_descriptor;
   reg [63:0] 	 dmc_txc_dma_descriptor_e;
   reg [63:0] 	 dmc_txc_dma_descriptor_o;
   reg 		 incr_read_ptr;
   reg 		 gotnxtdesc;
   reg 		 read_req;
   reg [63:0] 	 dmc_txc_dma_descriptor;
   reg 		 cache_ready;
   reg 		 inc_head_shadow;
   // reg 		 dmc_txc_dma_error;

   reg [3:0] 	 TxIfState;
   reg 		 reset_cache_pointers;
   reg [3:0] 	 dma_cache_tags_d;
   reg 		 cache_read_status;
   reg [4:0] 	 odd_num_ptr;
   reg 		 odd_sop_set;
   reg [4:0] 	 even_num_ptr;
   reg 		 even_sop_set;
   reg 		 partial_descriptor;

   reg [63:0] 	 dma_descriptor_toxlate;
   reg 		 xlate_addr;
   reg 		 even_valid;
   reg 		 odd_valid;
   reg [63:0] 	 dma_descriptor_xlate;
   reg 		 xlate_done;
   reg [3:0] 	 page_xlate_state;
   reg 		 page0_match;
   reg 		 page1_match;
   reg 		 page_xlate_error_dma;
   reg [31:0] 	 page0_reloc_addr;
   reg [31:0] 	 page1_reloc_addr;
   reg [43:0] 	 pkt_part_error_address_dma;
   reg 	         txc_dmc_dma_reset_done_d;

   reg 		 set_pref_buf_par_err_dma;
   reg 		 set_pkt_part_err_dma;
   reg go_back_to_even;
   reg go_back_to_odd;
   reg read_done;
   parameter 	 IDLE = 4'h0,
		 REQ_FOR_CACHE_READ = 4'h1,
		 WAIT_FOR_DATA      = 4'h2,
		 PARSE_DESCRIPTOR = 4'h3,
		 XLATE_ADDR       = 4'h4,
		 SEND_EVEN_DESC = 4'h5,
		 CHECK_ODD_VALID = 4'h6,
		 SEND_ODD_DESC = 4'h7,
		 CHECK_NEXT_ENTRY = 4'h8,
		 RESET_CACHE_POINTERS = 4'h9,
		 CHECK_ODD_VALID_INC = 4'hA,
		 CHECK_NEXT_ENTRY_INC = 4'hB ,
		 STOP_STATE = 4'hC ,
		 ERROR = 4'hD ;	     

   //VCS coverage off
   // synopsys translate_off
   reg [192:1] 	 TX_IFSTATE;
   always@(TxIfState) begin
      case(TxIfState)
	IDLE:TX_IFSTATE = "IDLE" ;
	REQ_FOR_CACHE_READ: TX_IFSTATE = "REQ_FOR_CACHE_READ";
	WAIT_FOR_DATA: TX_IFSTATE = "WAIT_FOR_DATA";
	PARSE_DESCRIPTOR: TX_IFSTATE = "PARSE_DESCRIPTOR";
	XLATE_ADDR: TX_IFSTATE = "XLATE_ADDR";
	SEND_EVEN_DESC:  TX_IFSTATE = "SEND_EVEN_DESC";
	CHECK_ODD_VALID: TX_IFSTATE = "CHECK_ODD_VALID";
	SEND_ODD_DESC: TX_IFSTATE = "SEND_ODD_DESC";
	CHECK_NEXT_ENTRY:  TX_IFSTATE = "CHECK_NEXT_ENTRY";
	RESET_CACHE_POINTERS:  TX_IFSTATE = "RESET_CACHE_POINTERS";
	CHECK_ODD_VALID_INC: TX_IFSTATE = "CHECK_ODD_VALID_INC";
	CHECK_NEXT_ENTRY_INC: TX_IFSTATE = "CHECK_NEXT_ENTRY_INC";
	STOP_STATE: TX_IFSTATE = "STOP_STATE";
	ERROR: TX_IFSTATE = "ERROR";
	
	default: TX_IFSTATE = "UNKNOWN";
      endcase // case(TxIfState)
   end // always@ (TxIfState)
   
   always@(posedge gotnxtdesc ) begin
      $display(" DEBUG- %m Sending Descriptor - %x Time - %t ",dmc_txc_dma_descriptor,$time);
   end
   // synopsys translate_on
   // VCS coverage on


   // Interface signals/logic  related to reset - scheduling and done 

   reg dmc_txc_dma_reset_scheduled;
   reg dma_reset_done_hold;
   reg dma_reset_scheduled_d;
   reg reset_sm;
   reg sm_reset_done;
   reg stop_txif_sm;
   reg tx_dma_cfg_dma_stop_d ;
   
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 dmc_txc_dma_reset_scheduled <= 1'b0;
	 dma_reset_done_hold <= 1'b0;
	 dma_reset_scheduled_d <= 1'b0;
	 txc_dmc_dma_reset_done_d <= 1'b0;
	 reset_sm  <= 1'b0;
	 stop_txif_sm <= 1'b0;
	 tx_dma_cfg_dma_stop_d <= 1'b0;
      end else begin // if (!Reset_L)
	 dma_reset_scheduled_d <= dma_reset_scheduled  ;
	 tx_dma_cfg_dma_stop_d <= tx_dma_cfg_dma_stop;
	 txc_dmc_dma_reset_done_d <= txc_dmc_dma_reset_done;
	 dmc_txc_dma_reset_scheduled <=  (dma_reset_scheduled & !dma_reset_scheduled_d) 
	   |( dmc_txc_dma_reset_scheduled & ~txc_dmc_dma_reset_done_d);
	 // hold signal for the reset state machine
	 dma_reset_done_hold <= (sm_reset_done ) | ( dma_reset_done_hold & dma_reset_scheduled);
	 reset_sm  <= (txc_dmc_dma_reset_done & ~txc_dmc_dma_reset_done_d) | (reset_sm &  dma_reset_scheduled) ;
	 stop_txif_sm <= ( !dma_reset_scheduled & dma_reset_scheduled_d & tx_dma_cfg_dma_stop) |
		 	 ( stop_txif_sm & ~( ~tx_dma_cfg_dma_stop & tx_dma_cfg_dma_stop_d ) );
      end // else: !if(!Reset_L)
   end // always@ (posedge SysClk)

   // TOADS -- until dma_reset_done_hold is true there should not be more gots/gets
   

   always@(posedge SysClk )
     begin
	if(!Reset_L) begin
	   dmc_txc_dma_descriptor_o <= 64'h0;
	   dmc_txc_dma_descriptor_e <= 64'h0;
	   dma_cache_tags_d         <= 4'h0;
	   odd_sop_set              <= 1'b0;
	   even_sop_set             <= 1'b0;
	   odd_num_ptr              <= 5'h0;
	   even_num_ptr             <= 5'h0;
	   cache_read_status        <= 1'b0;
        end else if(latch_descriptor) begin
	   dmc_txc_dma_descriptor_o <= dma_cache_readdata[127:64];
	   dmc_txc_dma_descriptor_e <= dma_cache_readdata[63:0];
	   dma_cache_tags_d         <= dma_cache_tags;
	   odd_sop_set              <= dma_cache_readdata[127];
	   even_sop_set             <= dma_cache_readdata[63];
	   odd_num_ptr              <=  {1'b0,dma_cache_readdata[125:122] } ;
	   even_num_ptr             <=  {1'b0,dma_cache_readdata[61:58] } ;
	   cache_read_status        <= cache_parity_status;
	end
     end // always@ (posedge SysClk )

   // To Add as part of error --
   // if(cache_read_status) -- > Parity Error detected in reads
   // drive dma_error signals appropriately


   // Main State Machine for interfacing with TXC

   always@(posedge  SysClk )
     if (!Reset_L) begin
	TxIfState <= IDLE;
	read_done <= 1'b0;
	latch_descriptor <= 1'b0;
	cache_ready <= 1'b0;
	read_req <= 1'b0;
	gotnxtdesc <= 1'b0;
	xlate_addr <= 1'b0;
	even_valid <= 1'b0;
	odd_valid <= 1'b0;
	// dmc_txc_dma_error <= 1'b0;
	reset_cache_pointers <= 1'b0;
	incr_read_ptr <= 1'b0;
	partial_descriptor <= 1'b0;
	set_pref_buf_par_err_dma <= 1'b0;
	set_pkt_part_err_dma <= 1'b0;
	sm_reset_done <= 1'b0;
	go_back_to_even <= 1'b0;
	go_back_to_odd <= 1'b0;
     end else begin
	case(TxIfState)  // synopsys full_case parallel_case
	  IDLE: begin
	     set_pref_buf_par_err_dma <= 1'b0;
	     // dmc_txc_dma_error <= 1'b0;
	     sm_reset_done <= 1'b0;
	     go_back_to_even <= 1'b0;
	     go_back_to_odd <= 1'b0;

	     // TOADD-
	     // Take this DMA off line whenever an error occurs and keep it offline untill a reset is
	     // done
	     if(reset_sm) begin 
		TxIfState <= IDLE;	
	        sm_reset_done <= 1'b1;
		cache_ready <= 1'b0;
		gotnxtdesc <= 1'b0;
	     end else if(!empty & cache_entry_valid & ~stop_txif_sm) begin
		TxIfState <= REQ_FOR_CACHE_READ;
		read_req <= 1'b1;
		partial_descriptor <= 1'b0;
	     end else begin
		TxIfState <= IDLE;	
		cache_ready <= 1'b0;
		partial_descriptor <= 1'b0;
	     end // else: !if(!empty)
	  end // case: IDLE
	  REQ_FOR_CACHE_READ: begin
	     if(read_gnt) begin
		incr_read_ptr <= 1'b1;
		latch_descriptor <= 1'b0;
		read_done <= 1'b0;
		read_req <= 1'b0;
		TxIfState <= WAIT_FOR_DATA;
	     end else begin // if (read_gnt)
		TxIfState <= REQ_FOR_CACHE_READ;
	     end // else: !if(read_gnt)
	  end // case: REQ_FOR_CACHE_READ
	  WAIT_FOR_DATA: begin
	    if(read_done) begin 	
	     incr_read_ptr <= 1'b0;
	     latch_descriptor <= 1'b0;
	     TxIfState <= PARSE_DESCRIPTOR;
            end else begin
	        incr_read_ptr <= 1'b0;
		TxIfState <= WAIT_FOR_DATA;
		latch_descriptor <= 1'b1;
		read_done <= 1'b1;
            end
	  end
	  PARSE_DESCRIPTOR: begin
	     latch_descriptor <= 1'b0;
	     read_done <= 1'b0;
	     // dmc_txc_dma_error <= cache_read_status;
	     // Need to go to an error state here---
	     if(cache_read_status) begin
		set_pref_buf_par_err_dma <= 1'b1;
		TxIfState <= ERROR;
	     end else begin
		if(dma_cache_tags_d[0]) begin
		   // Drive signals like partials etc
		   // Check num_ptr against no of entries valid
		   // based upon that just wait here until enough entries are available

		   if(even_sop_set & ( cache_filled_size  < even_num_ptr)) begin
		      TxIfState <=PARSE_DESCRIPTOR;
		      partial_descriptor <= 1'b1;
		      // Just wait here
		   end else begin
		      TxIfState <= XLATE_ADDR;
		      partial_descriptor <= 1'b0;
		      dma_descriptor_toxlate <=dmc_txc_dma_descriptor_e;
		      xlate_addr <= 1'b1;
		      even_valid <= 1'b1;
		      odd_valid <= 1'b0;
		   end // else: !if(even_sop_set & (cache_filled_size < even_num_ptr))
		   
		end else if(dma_cache_tags_d[1]) begin
		   if(odd_sop_set & ( cache_filled_size < odd_num_ptr)) begin
		      TxIfState <=PARSE_DESCRIPTOR;
		      partial_descriptor <= 1'b1;
		      // Just wait here
		   end else begin
		      TxIfState <= XLATE_ADDR;
		      partial_descriptor <= 1'b0;
		      dma_descriptor_toxlate <=dmc_txc_dma_descriptor_o;
		      xlate_addr <= 1'b1;
		      even_valid <= 1'b0;
		      odd_valid <= 1'b1;
		   end // else: !if(odd_sop_set & (cache_filled_size < odd_num_ptr))
		   
		end else begin
		   TxIfState <= IDLE;
		   // synopsys translate_off
		   $display("%m CacheTags Invalid -- ERROR Time=%t",$time);	
		   // synopsys translate_on 
		end
	     end // else: !if(cache_read_status)
	     
	  end // case: PARSE_DESCRIPTOR
	  XLATE_ADDR: begin
	     xlate_addr <= 1'b0;
	     if(page_xlate_error_dma ) begin
		set_pkt_part_err_dma <= 1'b1;
		// dmc_txc_dma_error <= 1'b1;
		TxIfState <= ERROR;	
	     end else if(!xlate_done) begin
		TxIfState <= XLATE_ADDR;	
	     end else begin // if (!xlate_done)
		if(reset_sm) begin
		  gotnxtdesc <= 1'b0;
		  cache_ready <= 1'b0;
		end else begin
		  gotnxtdesc <= 1'b1;
		  cache_ready <= 1'b1;
		end
		dmc_txc_dma_descriptor <= dma_descriptor_xlate;
		if(even_valid & ~odd_valid) begin
		   TxIfState <= SEND_EVEN_DESC; 
		end else if( odd_valid & ~even_valid) begin
		   TxIfState <= SEND_ODD_DESC;
		end
	     end // else: !if(!xlate_done)
	  end
	  SEND_EVEN_DESC: begin
	       go_back_to_even <= 1'b0;
	       go_back_to_odd <= 1'b0;
	     if(reset_sm & tx_dma_cfg_dma_stop) begin
		go_back_to_even <= 1'b1;
		go_back_to_odd <= 1'b0;
		cache_ready <= 1'b0;
	        sm_reset_done <= 1'b1;
		gotnxtdesc <= 1'b0;
		TxIfState <= STOP_STATE;
	      end else if(reset_sm) begin 
	        sm_reset_done <= 1'b1;
		TxIfState <= IDLE;	
		cache_ready <= 1'b0;
		gotnxtdesc <= 1'b0;
	     end else if(getnxtdesc) begin
		gotnxtdesc <= 1'b0;
		//inc_head_shadow <= 1'b1;	
		TxIfState <= CHECK_ODD_VALID_INC;
	     end else begin
		TxIfState <= SEND_EVEN_DESC;	
	     end // else: !if(getnxtdesc)
	  end // case: SEND_EVEN_DESC
	  CHECK_ODD_VALID_INC: begin
	     //inc_head_shadow <= 1'b0;
	     gotnxtdesc <= 1'b0;
	     TxIfState <= CHECK_ODD_VALID;
	  end // case: CHECK_ODD_VALID_INC
	  CHECK_ODD_VALID: begin
	     //inc_head_shadow <= 1'b0;
	     // Check for partials also
	     if(!dma_cache_tags_d[1]) begin
		TxIfState <= IDLE;	
	     end else begin
		if(cache_entry_valid) begin
		   if(odd_sop_set & (cache_filled_size < odd_num_ptr)) begin
		      TxIfState <=CHECK_ODD_VALID;
		      partial_descriptor <= 1'b1;
		      // Just wait here
		   end else begin // if (odd_sop_set & (cache_filled_size < odd_num_ptr))
		      TxIfState <= XLATE_ADDR;
		      partial_descriptor <= 1'b0;
		      dma_descriptor_toxlate <= dmc_txc_dma_descriptor_o;
		      xlate_addr <= 1'b1;
		      even_valid <= 1'b0;
		      odd_valid <= 1'b1;
		   end // else: !if(odd_sop_set & (cache_filled_size < odd_num_ptr))
		end else begin // if (cache_entry_valid)
		   TxIfState <= RESET_CACHE_POINTERS;
		   reset_cache_pointers <= 1'b1;
		end // else: !if(cache_entry_valid)
	     end // else: !if(!dma_cache_tags_d[1])
	  end // case: CHECK_ODD_VALID
	  SEND_ODD_DESC: begin
	       go_back_to_even <= 1'b0;
	       go_back_to_odd <= 1'b0;
	     if(reset_sm & tx_dma_cfg_dma_stop) begin
		go_back_to_even <= 1'b0;
		go_back_to_odd <= 1'b1;
	        sm_reset_done <= 1'b1;
		cache_ready <= 1'b0;
		gotnxtdesc <= 1'b0;
		TxIfState <= STOP_STATE;
	      end else if(reset_sm) begin 
	        sm_reset_done <= 1'b1;
		TxIfState <= IDLE;	
		cache_ready <= 1'b0;
		gotnxtdesc <= 1'b0;
	     end else if(getnxtdesc) begin
		gotnxtdesc <= 1'b0;
		//inc_head_shadow <= 1'b1;
		TxIfState <= CHECK_NEXT_ENTRY_INC;
	     end else begin // if (getnxtdesc)
		TxIfState <= SEND_ODD_DESC;
	     end // else: !if(getnxtdesc)
	  end // case: SEND_ODD_DESC
	  CHECK_NEXT_ENTRY_INC: begin
	     //inc_head_shadow <= 1'b0;
	     gotnxtdesc <= 1'b0;
	     TxIfState <= CHECK_NEXT_ENTRY;
	  end // case: CHECK_NEXT_ENTRY_INC
	  CHECK_NEXT_ENTRY: begin
	     //inc_head_shadow <= 1'b0;
	     gotnxtdesc <= 1'b0;
	     if(cache_entry_valid) begin
		TxIfState <= IDLE;	
	     end else begin // if (cache_entry_valid)
		TxIfState <= RESET_CACHE_POINTERS;
		reset_cache_pointers <= 1'b1;
	     end // else: !if(cache_entry_valid)
	  end // case: CHECK_NEXT_ENTRY
	  RESET_CACHE_POINTERS: begin
	     cache_ready <= 1'b0;
	     reset_cache_pointers <= 1'b0;
	     TxIfState <= IDLE;
	  end // case: RESET_CACHE_POINTERS

	  STOP_STATE: begin
	     sm_reset_done <= 1'b0;
	     if(tx_dma_cfg_dma_stop) begin
	       cache_ready <= 1'b0;
	       gotnxtdesc <= 1'b0;
	       TxIfState <= STOP_STATE;
             end else begin
	       cache_ready <= 1'b1;
	       gotnxtdesc <= 1'b1;
	       if(go_back_to_even)
	         TxIfState <= SEND_EVEN_DESC; 
	       else if(go_back_to_odd) 
		 TxIfState <= SEND_ODD_DESC;
             end
	  end
	  ERROR: begin
	     set_pkt_part_err_dma <= 1'b0;
	     cache_ready <= 1'b0;
	     set_pref_buf_par_err_dma <= 1'b0;
	     if(reset_sm) begin // stay here untill reset is asserted from s/w
	       TxIfState <= IDLE; // go back to idle for now!!
               sm_reset_done <= 1'b1;
              end
	  end // case: ERROR
	  default: TxIfState <= IDLE;
	endcase // case(TxIfState)
     end // else: !if(!Reset_L)
   
   

   always@(/*AUTOSENSE*/TxIfState or getnxtdesc) begin
      inc_head_shadow = ((TxIfState==SEND_ODD_DESC) | (TxIfState==SEND_EVEN_DESC )) & getnxtdesc;
   end


   
   parameter PAGE_XLATE_IDLE          = 4'h0,
	     CHECK_PAGE_STATUS    = 4'h1,
	     PAGE_XLATE_ERROR = 4'h2;
   
   //VCS coverage off
   // synopsys translate_off
   reg [192:1] PAGE_XLATE_STATE;
   
   always @(page_xlate_state)
     begin
        case(page_xlate_state)
          PAGE_XLATE_IDLE :  PAGE_XLATE_STATE  = "PAGE_XLATE_IDLE";
          CHECK_PAGE_STATUS:      PAGE_XLATE_STATE = "CHECK_PAGE_STATUS";
	  PAGE_XLATE_ERROR : PAGE_XLATE_STATE = "PAGE_XLATE_ERROR";
          default :          PAGE_XLATE_STATE = "UNKNOWN";
        endcase
     end 
   // synopsys translate_on
   //VCS coverage on
   


   always@(posedge SysClk) begin
      if (!Reset_L) begin
	 page_xlate_state <= PAGE_XLATE_IDLE;
	 xlate_done <= 1'b0;
	 page0_match <= 1'b0;
	 page1_match <= 1'b0;
	 dma_descriptor_xlate <= 64'h0;
	 page_xlate_error_dma <= 1'b0;
	 pkt_part_error_address_dma <= 44'h0;
      end else begin
	 case(page_xlate_state) // synopsys parallel_case

	   PAGE_XLATE_IDLE: begin
	      xlate_done <= 1'b0;
	      page_xlate_error_dma <= 1'b0;
	      page0_match <= 1'b0;
	      page1_match <= 1'b0;

	      if(xlate_addr ) begin
		 dma_descriptor_xlate <= dma_descriptor_toxlate;
		 if( ~page0_valid_dma & ~page1_valid_dma ) begin
		    // Set ERROR Flags?
		    pkt_part_error_address_dma <= dma_descriptor_toxlate[43:0];
		    page_xlate_state <= PAGE_XLATE_ERROR;  
		    page_xlate_error_dma <= 1'b1;
		 end else  begin
		    page_xlate_state <= CHECK_PAGE_STATUS;
		    page0_reloc_addr <=  ((dma_descriptor_toxlate[43:12] & ~page0_mask_dma) | 
					  ( page0_reloc_dma & page0_mask_dma)) ;
		    page0_match <= page0_valid_dma & 
				   ((page0_mask_dma & dma_descriptor_toxlate [43:12] ) ==  page0_value_dma );

		    page1_reloc_addr <=  ((dma_descriptor_toxlate[43:12] & ~page1_mask_dma) | 
					  ( page1_reloc_dma & page1_mask_dma)) ;

		    page1_match <= page1_valid_dma & 
				   ((page1_mask_dma & dma_descriptor_toxlate [43:12] ) ==  page1_value_dma ); 
		 end // else: !if( ~page0_valid_dma & ~page1_valid_dma )
	      end
	   end // case: PAGE_XLATE_IDLE
	   
	   CHECK_PAGE_STATUS: begin
	      if(page0_match) begin
		 xlate_done <= 1'b1;
		 dma_descriptor_xlate <= {dma_descriptor_toxlate[63:44],page0_reloc_addr,dma_descriptor_toxlate[11:0]};
		 page_xlate_state <= PAGE_XLATE_IDLE;  
	      end else if(page1_match) begin
		 xlate_done <= 1'b1;
		 dma_descriptor_xlate <= {dma_descriptor_toxlate[63:44],page1_reloc_addr,dma_descriptor_toxlate[11:0]};
		 page_xlate_state <= PAGE_XLATE_IDLE;  
	      end else begin
		 page_xlate_error_dma <= 1'b1;
		 pkt_part_error_address_dma <= dma_descriptor_toxlate[43:0];
		 page_xlate_state <= PAGE_XLATE_ERROR;   
	      end
	   end // case: CHECK_PAGE_STATUS
	   
	   PAGE_XLATE_ERROR: begin
	      // Go back to IDLE -- for now
	      // xlate_done <= 1'b1;
	      page_xlate_error_dma <= 1'b0;
	      dma_descriptor_xlate <= dma_descriptor_toxlate;
	      page_xlate_state <= PAGE_XLATE_IDLE;
	      // synopsys translate_off
	      $display(" %m: Warning-- Page translation failure Time - %t",$time);
	      // synopsys translate_on
	   end
	   // default: begin
	      // page_xlate_state <= 4'hx;
	      // dma_descriptor_xlate <= 64'hx;
	   // end
	 endcase // case(page_xlate_state)
      end // else: !if(!Reset_L)
   end // always@ (posedge SysClk)  

   assign dmc_txc_dma_partial = partial_descriptor;

endmodule // niu_dmc_txcif

   

