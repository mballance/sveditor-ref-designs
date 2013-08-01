// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_sm_req_siiarb.v
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

module niu_smx_sm_req_siiarb(
/*AUTOARG*/
   // Outputs
   wreq_cmdff_rd, wreq_pcmd_ff_rd, rdreq_cmdff_rd, xmitflag, rwflag, 
   hdr_data, bypass, o_enq, b_enq, arb_cs, 
   // Inputs
   clk, reset_l, wreq_cmdff_rdata, wreq_cmdff_empty, 
   wreq_pcmd_ff_rdata, wreq_pcmd_ff_empty, rdreq_cmdff_rdata, 
   rdreq_cmdff_empty, nxt_xmit, ocr_avail, bcr_avail, 
   tid_valid_rdata_bus
   );
input		clk;
input		reset_l;

// wr cmdff if
output 		wreq_cmdff_rd;
input [65:0] 	wreq_cmdff_rdata;
input 		wreq_cmdff_empty;  // not use


// wr pcmd ff if
output 		wreq_pcmd_ff_rd;
input [3:0] 	wreq_pcmd_ff_rdata;
input 		wreq_pcmd_ff_empty;  // use this as wr req empty status

// rd cmdff if 
output 		rdreq_cmdff_rd;
input [65:0] 	rdreq_cmdff_rdata;
input 		rdreq_cmdff_empty;  


// siireq interface 
output 		xmitflag;
output 		rwflag;   // 0= rd, 1= wr
output [128:0] 	hdr_data; // added 121405 [128] to invalidate rdreq
output 		bypass;
input 		nxt_xmit;

// credit  if
input 		ocr_avail;
input 		bcr_avail;
output 		o_enq; 
output 		b_enq; 


output [1:0] arb_cs;

// added 121405
input [63:0] tid_valid_rdata_bus;


parameter arb_s0= 2'h0,
	  arb_s1= 2'h1,
	  arb_s2= 2'h2,
	  arb_s3= 2'h3;

// added 121405 - begin
// wire [15:0] hdr_tag= rdreq_cmdff_rdata[`SMX_CMDFF_POS_ID]; 
	// extract exact field to avoid vlint bus_notused warning
wire [5:0] hdr_tid= rdreq_cmdff_rdata[56:51];
wire tag_is_valid_n= tid_valid_rdata_bus[hdr_tid];
// added 121405 - end

wire rd_cmd_order= rdreq_cmdff_rdata[`SMX_CMDFF_POS_ORDER]; 
wire rcmd_is_order_n= (rd_cmd_order==`SMX_CMD_ORDER);
wire rcmd_is_bypass_n= (rd_cmd_order==`SMX_CMD_BYPASS);
wire rd_cr_avail_n= (rcmd_is_order_n & ocr_avail) |	  
	            (rcmd_is_bypass_n & bcr_avail);
wire rd_rdy_n= ~rdreq_cmdff_empty & rd_cr_avail_n;

wire wr_cmd_order= wreq_cmdff_rdata[`SMX_CMDFF_POS_ORDER]; 
wire wcmd_is_order_n= (wr_cmd_order==`SMX_CMD_ORDER);
wire wcmd_is_bypass_n= (wr_cmd_order==`SMX_CMD_BYPASS);
wire wr_cr_avail_n= (wcmd_is_order_n & ocr_avail) |
	            (wcmd_is_bypass_n & bcr_avail);
wire wr_rdy_n= ~wreq_pcmd_ff_empty & wr_cr_avail_n;

reg o_enq_n;
wire o_enq= o_enq_n;
reg b_enq_n;
wire b_enq= b_enq_n;



reg [1:0] arb_ns, arb_cs;
reg wreq_cmdff_rd_n;
reg wreq_pcmd_ff_rd_n;
reg rdreq_cmdff_rd_n;
reg set_xmitflag_n;
reg rst_xmitflag_n;
reg xmitflag;
reg rwflag_n, rwflag;

always @(/*AUTOSENSE*/`SMX_REQARB_RD or `SMX_REQARB_WR or arb_cs
	 or nxt_xmit or rcmd_is_bypass_n or rcmd_is_order_n
	 or rd_rdy_n or rwflag or tag_is_valid_n or wcmd_is_bypass_n
	 or wcmd_is_order_n or wr_rdy_n) begin
  wreq_cmdff_rd_n= 1'b0;
  wreq_pcmd_ff_rd_n= 1'b0;
  rdreq_cmdff_rd_n= 1'b0;
  set_xmitflag_n= 1'b0;
  rst_xmitflag_n= 1'b0;
  rwflag_n= rwflag; // 0= rd, 1= wr 
  o_enq_n= 1'b0;
  b_enq_n= 1'b0;
  arb_ns= arb_cs;
  case (arb_cs)
    arb_s0: begin // none chosen; rd first
	      if(rd_rdy_n) begin
	        arb_ns= arb_s1;
	        rdreq_cmdff_rd_n= 1'b1;
	        rwflag_n= `SMX_REQARB_RD;
		set_xmitflag_n= 1'b1; 
  	        o_enq_n= rcmd_is_order_n & tag_is_valid_n;  // q only if valid; (chg'd 121405) 
  		b_enq_n= rcmd_is_bypass_n & tag_is_valid_n; // this will be dropped in siireq interface
	      end
	      else begin
	        if(wr_rdy_n) begin
	          arb_ns= arb_s2;
	          wreq_cmdff_rd_n= 1'b1;
	          wreq_pcmd_ff_rd_n= 1'b1;
	          rwflag_n= `SMX_REQARB_WR;
		  set_xmitflag_n= 1'b1; 
  	          o_enq_n= wcmd_is_order_n;
  		  b_enq_n= wcmd_is_bypass_n;
  	        end
	        else arb_ns= arb_cs; // no req; do nothing
	      end   // !rd_rdy_n
	    end
    arb_s1: begin // chosen, wait nxt_xmit, wr first
	      if(nxt_xmit) begin
	        if(wr_rdy_n) begin
	          arb_ns= arb_s2;
	          wreq_cmdff_rd_n= 1'b1;
	          wreq_pcmd_ff_rd_n= 1'b1;
	          rwflag_n= `SMX_REQARB_WR;
		  set_xmitflag_n= 1'b1; 
  	          o_enq_n= wcmd_is_order_n;
  		  b_enq_n= wcmd_is_bypass_n;
  	        end
	        else begin
	          if(rd_rdy_n) begin
	            arb_ns= arb_s1;
	            rdreq_cmdff_rd_n= 1'b1;
	            rwflag_n= `SMX_REQARB_RD;
		    set_xmitflag_n= 1'b1; 
  	            o_enq_n= rcmd_is_order_n & tag_is_valid_n;
  		    b_enq_n= rcmd_is_bypass_n & tag_is_valid_n;
	          end
	          else begin // no req
	            arb_ns= arb_s3; // wr still  first 
		    rst_xmitflag_n= 1'b1; 
	          end  // !rd_rdy_n
	        end // !wr_rdy_n
	      end // nxt_xmit
	    end
    arb_s2: begin // chosen, wait nxt_xmit, rd first 
	      if(nxt_xmit) begin
	        if(rd_rdy_n) begin
	          arb_ns= arb_s1;
	          rdreq_cmdff_rd_n= 1'b1;
	          rwflag_n= `SMX_REQARB_RD;
		  set_xmitflag_n= 1'b1; 
  	          o_enq_n= rcmd_is_order_n & tag_is_valid_n;
  		  b_enq_n= rcmd_is_bypass_n & tag_is_valid_n;
	        end
	        else begin
	          if(wr_rdy_n) begin
	            arb_ns= arb_s2;
	            wreq_cmdff_rd_n= 1'b1;
	            wreq_pcmd_ff_rd_n= 1'b1;
	            rwflag_n= `SMX_REQARB_WR;
		    set_xmitflag_n= 1'b1; 
  	            o_enq_n= wcmd_is_order_n;
  		    b_enq_n= wcmd_is_bypass_n;
  	          end
		  else begin  // no req
	            arb_ns= arb_s0;  // rd still first
		    rst_xmitflag_n= 1'b1; 
		  end  // !wr_rdy_n
	        end // !rd_rdy_n
	      end // nxt_xmit
	    end
    arb_s3: begin // none chosen, wr first
	      if(wr_rdy_n) begin
	        arb_ns= arb_s2;
	        wreq_cmdff_rd_n= 1'b1;
	        wreq_pcmd_ff_rd_n= 1'b1;
	        rwflag_n= `SMX_REQARB_WR;
	        set_xmitflag_n= 1'b1; 
  	        o_enq_n= wcmd_is_order_n;
  		b_enq_n= wcmd_is_bypass_n;
  	      end
	      else begin
	        if(rd_rdy_n) begin
	          arb_ns= arb_s1;
	          rdreq_cmdff_rd_n= 1'b1;
	          rwflag_n= `SMX_REQARB_RD;
	          set_xmitflag_n= 1'b1; 
  	          o_enq_n= rcmd_is_order_n & tag_is_valid_n;
  		  b_enq_n= rcmd_is_bypass_n & tag_is_valid_n;
	        end
	        else arb_ns= arb_cs; // no req; do nothing
              end  // !wr_rdy_n
	    end
   endcase
end

always @(posedge clk) begin
  if(!reset_l) begin
    arb_cs<= `SMX_PD  arb_s0;
    xmitflag<= `SMX_PD  1'b0;
    rwflag<= `SMX_PD  1'b0;
  end 
  else begin
    arb_cs<= `SMX_PD  arb_ns;
    if(rst_xmitflag_n) xmitflag<= `SMX_PD  1'b0; 
    else if(set_xmitflag_n) xmitflag<= `SMX_PD  1'b1;
    rwflag<= `SMX_PD  rwflag_n;
  end 
end

wire [127:0] wr_hdr_data_n= {wreq_cmdff_rdata[`SMX_CMDFF_POS_CMD],
			     39'h0,
			     (wreq_cmdff_rdata[`SMX_CMDFF_POS_ERR] | 
				{2'h0, |wreq_pcmd_ff_rdata}), // propagate error
			     wreq_cmdff_rdata[`SMX_CMDFF_POS_ID],
			     24'h0,
			     wreq_cmdff_rdata[`SMX_CMDFF_POS_ADDR]};
			
wire [127:0] rd_hdr_data_n= {rdreq_cmdff_rdata[`SMX_CMDFF_POS_CMD],
			     39'h0,
			     rdreq_cmdff_rdata[`SMX_CMDFF_POS_ERR],
			     rdreq_cmdff_rdata[`SMX_CMDFF_POS_ID],
			     24'h0,
			     rdreq_cmdff_rdata[`SMX_CMDFF_POS_ADDR]};
reg [128:0] hdr_data;
reg bypass;

always @(posedge clk) begin
  if(set_xmitflag_n) begin 
    hdr_data<= `SMX_PD  (rwflag_n==`SMX_REQARB_WR)?  {1'b1, wr_hdr_data_n} : {tag_is_valid_n, rd_hdr_data_n};
    bypass<= `SMX_PD  (rwflag_n==`SMX_REQARB_WR)? wcmd_is_bypass_n : rcmd_is_bypass_n;
  end
end

wire 		wreq_cmdff_rd= wreq_cmdff_rd_n;
wire 		wreq_pcmd_ff_rd= wreq_pcmd_ff_rd_n;
wire 		rdreq_cmdff_rd= rdreq_cmdff_rd_n;

endmodule


