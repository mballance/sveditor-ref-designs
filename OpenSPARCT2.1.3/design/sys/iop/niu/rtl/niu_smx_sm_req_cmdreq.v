// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_sm_req_cmdreq.v
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
module niu_smx_sm_req_cmdreq(
/*AUTOARG*/
   // Outputs
   ack, cmdflag, cmdflag_data, early_cmdflag_n, early_cmdflag_data_n, 
   xtb_wr, xtb_waddr, xtb_wdata, ff_wr, ff_wdata, lnen_ff_wr, 
   lnen_ff_wdata, cmdreq_idle, cmd_cs, 
   // Inputs
   clk, reset_l, req, req_cmd, req_addr, req_len, req_xid, req_port, 
   req_dma, req_client, rst_cmdflag, cfg_no_cmdflag, 
   cfg_no_sameclientck, datareq_idle, xfer_done, rst_xtb_wr, ff_full, 
   lnen_ff_full, stall_enable, tid_valid_rdata_bus
   );

input		clk;
input		reset_l;
	// dmc cmd req if
input 		req;
input [7:0] 	req_cmd;
input [63:0] 	req_addr;
input [13:0] 	req_len;
input [5:0] 	req_xid;
input [1:0] 	req_port;
input [4:0] 	req_dma;
input [7:0] 	req_client;
output 		ack;

	// datareq if
output 		cmdflag;
output [4:0] 	cmdflag_data;
output 		early_cmdflag_n;
output [4:0] 	early_cmdflag_data_n;
input 		rst_cmdflag;
input 		cfg_no_cmdflag;
input 		cfg_no_sameclientck;
input 		datareq_idle;

	// datareq/dv if 
input 		xfer_done; // dmc_comp & nothing in datareq sm (ext logic)

	// xtb if
output 		xtb_wr;  // this one also reset curnof64B cnt to 0
output [5:0] 	xtb_waddr;
output [127:0] 	xtb_wdata;
input		rst_xtb_wr;

	// cmd ff if	
output 		ff_wr;
output [65:0] 	ff_wdata;
input 		ff_full;

	// lnen_ff if
output		lnen_ff_wr;
output [4:0]    lnen_ff_wdata;	
input		lnen_ff_full;

	// stall_hdlr if 
input	stall_enable;
output 	cmdreq_idle;

output [2:0] cmd_cs;

// status
// added 121405
input [63:0] tid_valid_rdata_bus;

/* generate line enable */

function [3:0] gen_eop_line_en;
  input[5:0] offset;

  // bit0 - line0 (16B), bit1 - line1 (32B)
  // bit2 - line2 (48B), bit3 - line3 (64B)
  // 0 - no write; 1- write 

  reg [3:0] line_en;
  reg anyone_16B;
  begin
    anyone_16B= |offset[3:0];
    case({offset[5:4]})
       2'b00: line_en= (anyone_16B)? 4'b0001 : 4'b1111;
       2'b01: line_en= (anyone_16B)? 4'b0011 : 4'b0001;
       2'b10: line_en= (anyone_16B)? 4'b0111 : 4'b0011;
       2'b11: line_en= (anyone_16B)? 4'b1111 : 4'b0111;
    endcase
    gen_eop_line_en= line_en;
  end
endfunction

function [3:0] gen_sop_line_en;
  input[5:0] offset;

  reg [3:0] line_en;
  begin
    case(offset[5:4]) 
      2'b00: line_en= 4'b1111;
      2'b01: line_en= 4'b1110;
      2'b10: line_en= 4'b1100;
      2'b11: line_en= 4'b1000;
    endcase
    gen_sop_line_en= line_en;
  end
endfunction

/*
function [15:0] decode_eop_16b_byte_en_little; // B15,B14..,B1,B0
  input [3:0] offset;

  reg [15:0] byte_en;
  begin
    case(offset)
      4'h0: byte_en= 16'hffff;
      4'h1: byte_en= 16'h1;
      4'h2: byte_en= 16'h3;
      4'h3: byte_en= 16'h7;
      4'h4: byte_en= 16'hf;
      4'h5: byte_en= 16'h1f;
      4'h6: byte_en= 16'h3f;
      4'h7: byte_en= 16'h7f;
      4'h8: byte_en= 16'hff;
      4'h9: byte_en= 16'h1ff;
      4'ha: byte_en= 16'h3ff;
      4'hb: byte_en= 16'h7ff;
      4'hc: byte_en= 16'hfff;
      4'hd: byte_en= 16'h1fff;
      4'he: byte_en= 16'h3fff;
      4'hf: byte_en= 16'h7fff;
    endcase
    decode_eop_16b_byte_en_little= byte_en;
  end
endfunction

function [15:0] decode_eop_16b_byte_en_big; // B0,B1...,B14,B15
  input [3:0] offset;

  reg [15:0] byte_en;

  begin
    case(offset)
      4'h0: byte_en= 16'hffff;
      4'h1: byte_en= 16'h8000;
      4'h2: byte_en= 16'hc000;
      4'h3: byte_en= 16'he000;
      4'h4: byte_en= 16'hf000;
      4'h5: byte_en= 16'hf800;
      4'h6: byte_en= 16'hfc00;
      4'h7: byte_en= 16'hfe00;
      4'h8: byte_en= 16'hff00;
      4'h9: byte_en= 16'hff80;
      4'ha: byte_en= 16'hffc0;
      4'hb: byte_en= 16'hffe0;
      4'hc: byte_en= 16'hfff0;
      4'hd: byte_en= 16'hfff8;
      4'he: byte_en= 16'hfffc;
      4'hf: byte_en= 16'hfffe;
    endcase
    decode_eop_16b_byte_en_big= byte_en;
  end
endfunction

function [15:0] decode_sop_16b_byte_en_big; // B0,B1...,B14,B15
  input [3:0] offset;

  reg [15:0] byte_en;

  begin
    case(offset)
      4'h0: byte_en= 16'hffff;
      4'h1: byte_en= 16'h7fff;
      4'h2: byte_en= 16'h3fff;
      4'h3: byte_en= 16'h1fff;
      4'h4: byte_en= 16'h0fff;
      4'h5: byte_en= 16'h07ff;
      4'h6: byte_en= 16'h03ff;
      4'h7: byte_en= 16'h01ff;
      4'h8: byte_en= 16'h00ff;
      4'h9: byte_en= 16'h007f;
      4'ha: byte_en= 16'h003f;
      4'hb: byte_en= 16'h001f;
      4'hc: byte_en= 16'h000f;
      4'hd: byte_en= 16'h0007;
      4'he: byte_en= 16'h0003;
      4'hf: byte_en= 16'h0001;
    endcase
    decode_sop_16b_byte_en_big= byte_en;
  end
endfunction
*/

function [6:0] xlate_cmd_meta_to_si;
  input[7:0] cmd;

  reg [6:0] new_cmd; // {err, si_cmd}

  begin
    case(cmd[`SMX_CMDPOS_CODE])
      `SMX_CMD_MEMRD: new_cmd= {1'b0, `SMX_SICMD_RD};
      `SMX_CMD_MEMWR: new_cmd= (cmd[`SMX_CMDPOS_POST]==`SMX_CMD_POST)? 
				{1'b0, `SMX_SICMD_WR_POST} : {1'b0, `SMX_SICMD_WR_NONPOST};
      default: new_cmd= {1'b1, 6'h0}; // unrecognized cmd ??  
    endcase
    xlate_cmd_meta_to_si= new_cmd;
  end
endfunction


parameter s0= 3'h0,
	  s1= 3'h1,
	  s1_1= 3'h4,
	  s2= 3'h2,
	  s3= 3'h3;

reg [63:0] req_addr_r;
reg [13:0] req_len_r;
reg [1:0] req_port_r;
reg [4:0] req_dma_r;
reg [7:0] req_cmd_r; 
reg [5:0] req_xid_r; 
reg [7:0] req_client_r;

/* adjust to 64B aligned */
// wire[14:0] adj_len_n= {9'h0, req_addr[5:0]} + {1'b0, req_len[13:0]}; // no reg in ??
wire[14:0] adj_len_n= {9'h0, req_addr_r[5:0]} + {1'b0, req_len_r[13:0]};

/*  generate nof64B for rd/wr resp (store) */
wire anyone_64B_adj_len_n= |adj_len_n[5:0];
wire [9:0] nof64B_n= (anyone_64B_adj_len_n)? 
		({1'b0, adj_len_n[14:6]} + 1'b1) : {1'b0, adj_len_n[14:6]};
// + ((anyone_64B_adj_len_n)? 1'b1 : 1'b0);

/*  generate sop_line_en, eop_line_en for rd resp (store) */
// wire [3:0] sop_line_en_n= gen_sop_line_en(req_addr[5:0]); // no reg in
wire [3:0] sop_line_en_n= gen_sop_line_en(req_addr_r[5:0]);
wire [3:0] eop_line_en_n= gen_eop_line_en(adj_len_n[5:0]);
		// also use for line_en in wr side of data req

/*  generate sop_byte_en, eop_byte_en for rd resp (store) */
// wire [3:0] ec_sop_byte_en_n= req_addr[3:0];  // encoded ; no reg in??
wire [3:0] ec_sop_byte_en_n= req_addr_r[3:0];  // encoded
wire [3:0] ec_eop_byte_en_n= adj_len_n[3:0]; 
// wire [15:0] sop_byte_en_n= decode_sop_16b_byte_en_big(ec_sop_byte_en_n);
// wire [15:0] eop_byte_en_n= decode_eop_16b_byte_en_big(ec_eop_byte_en_n);

/*
  no reg in ???
wire [127:0] xtb_wdata_n= {10'h0,
		   req_addr, req_len, req_port, req_dma, req_client,
		   nof64B_n, sop_line_en_n, eop_line_en_n, 
		   ec_sop_byte_en_n, ec_eop_byte_en_n};
*/
wire [127:0] xtb_wdata_n= {9'h0,
		   req_addr_r, req_len_r, req_port_r, req_dma_r, req_client_r,
		   nof64B_n, sop_line_en_n, eop_line_en_n, 
		   ec_sop_byte_en_n, ec_eop_byte_en_n};
			// 64, 14, 2, 5, 8,
			// 10, 4, 4, 4, 4 
reg [127:0] xtb_wdata;

// wire [5:0] xtb_waddr_n= req_xid; // no reg in ??
wire [5:0] xtb_waddr_n= req_xid_r;
reg [5:0] xtb_waddr;

// wire is_nonpost_n= (req_cmd[`SMX_CMDPOS_POST] == `SMX_CMD_NONPOST)? 1'b1 : 1'b0; // no reg in
wire is_nonpost_n= (req_cmd_r[`SMX_CMDPOS_POST] == `SMX_CMD_NONPOST)? 1'b1 : 1'b0; 

reg [63:0] curaddr;
reg [9:0] cntof64B;
reg [9:0] nof64B;

// cmd data use in s1; xx_r avail at s1 
wire [15:0] si_id= {req_xid_r[5:0], cntof64B[9:0]};
wire [39:0] si_addr= {curaddr[39:6], 6'h0};
wire [2:0] si_err= {3'h0}; // ??? 
wire si_order= req_cmd_r[`SMX_CMDPOS_ORDER]; 


// translate meta cmd to sii cmd
wire [6:0] xlate_cmd= xlate_cmd_meta_to_si(req_cmd_r);  // ??? handle of non-existence cmd
wire [5:0] si_cmd= xlate_cmd[5:0]; // bit6 is xlate error 

reg ff_wr_n;
wire ff_wr= ff_wr_n;
// ff cmd data
wire [65:0] ff_wdata_n= {si_cmd[5:0], si_err[2:0], si_id[15:0], si_addr[39:0], si_order};
	// 6, 3, 16, 40, 1
wire [65:0] ff_wdata= ff_wdata_n;

// inc sii start addr (by 64B) per send
wire [57:0] msb_curaddr= curaddr[63:6]; 
wire [57:0] new_msb_curaddr_n= msb_curaddr+1'b1; // use incrementor rather than add 64B

// inc token LSB (by 1) per send
wire [9:0] new_cntof64B_n= cntof64B + 1'b1;
wire eop_n= (new_cntof64B_n==nof64B)? 1'b1: 1'b0;
wire one64Blen= (nof64B==10'h1);

		// assume wr always start at 64B aligned;
		// at end of pkt, use eop_line_en, else read 4 lines
reg [3:0] eop_line_en;
wire [4:0] cmdflag_data_n= (eop_n)? {eop_n,eop_line_en} : {eop_n, 4'b1111};
reg [4:0] cmdflag_data;

wire same_client_n= (cfg_no_sameclientck)? 1'b1 : // always bogus same if disable 
		((req_client_r==req_client)? 1'b1 : 1'b0); 

		// early version of cmdflag to save 1 cycle at start
reg early_cmdflag_n;
wire [4:0] early_cmdflag_data_n= cmdflag_data_n;

reg ack_n, ack;
reg set_xtb_wr_n, xtb_wr;
reg ld_cdata_n;  // flop in meta cmd
reg ld_info_n; // flop in info for cmdflag proc use; 
		// ie eop_line_en, 64B cnt  
reg inc_cntof64B_n;
reg inc_curaddr_n;
reg set_cmdflag_n;
reg cmdflag;
reg [2:0] cmd_cs, cmd_ns;

wire cmdreq_idle= (cmd_cs==s0);

//
// ??? need registered in ? migh have timing problem on xtb_wdata_n gen  
// xtb_wr need flag ??? rdreq and wreq arb if use one ram 64 entries;
//
reg lnen_ff_wr_n;
wire lnen_ff_wr= lnen_ff_wr_n;
wire [4:0] lnen_ff_wdata= {eop_n, cmdflag_data_n[3:0]};


// added 121405 - begin
wire tag_is_valid_n= ((cntof64B>10'h4) && cfg_no_cmdflag)? 
				tid_valid_rdata_bus[req_xid_r] : 1'b1;
			// condition tag valid only if in rdreq case (cfg_no_cmdflag is 1) 
			// and at least 4 dispatched (this is to make time for xtb
			// write to go thru since xtb_wr signal arb with wrreq  

always @(/*AUTOSENSE*/cmd_cs or cmdflag or datareq_idle or eop_n
	 or ff_full or is_nonpost_n or lnen_ff_full or one64Blen
	 or req or same_client_n or stall_enable or tag_is_valid_n
	 or xfer_done or xtb_wr) begin
  ack_n= 1'b0;
  set_xtb_wr_n= 1'b0;
  ld_cdata_n= 1'b0;
  ld_info_n= 1'b0;
  inc_cntof64B_n= 1'b0;
  inc_curaddr_n= 1'b0;
  ff_wr_n= 1'b0;
  lnen_ff_wr_n= 1'b0; 
  set_cmdflag_n= 1'b0;
  early_cmdflag_n= 1'b0;
  cmd_ns= cmd_cs; 
  case(cmd_cs)
    s0: begin // idle; wait for dmc req
          if(req && !stall_enable) begin
  	    ack_n= 1'b1;
	    ld_cdata_n= 1'b1; // flop in meta cmd data; rst/init working copies 
				// curaddr init to startaddr, cntof64B rst to 0
				// generate xtb_wdata_n, to be written at s1;
				// gen nof64B_n, eop_line_en_n (to be used in s1)
	    // xtb_wr_n= is_nonpost_n; // no reg in ??
	    cmd_ns= s1;
	  end
	end
   s1: begin // cnt= 0; xtb wr;  meta_cmd_data_r available;
                // xx_r use in rest of state until ld_cdata_n= 1
                // generate xtb_wdata_n, to be written at next state;
                // gen nof64B_n, eop_line_en_n (to be used in next state)
	  ld_info_n= 1'b1; // always load info for proc/cmdflag use
          if(is_nonpost_n) begin // xtb write only with non-post cmd
	    if(!xtb_wr) begin // wait till previous write go thru 
              set_xtb_wr_n= 1'b1;
              cmd_ns= s1_1;
	    end
          end else cmd_ns= s1_1;
        end
    s1_1: begin // cnt= 0; xtb wr;  meta_cmd_data_r available;
		// xx_r use in rest of state until ld_cdata_n= 1
	        // check ff_full, flag; 
		// wrff, wr flag_data; set flag 
	  if(!ff_full && !cmdflag && !lnen_ff_full) begin
	   if(tag_is_valid_n) begin	// added 121405
  	    lnen_ff_wr_n= 1'b1; // line enable ff for dv sm
	    ff_wr_n= 1'b1; // cmdff
	    if(datareq_idle) begin // cmdflag
			// datareq machine idle; kick it to work; save 1 cycle;
	      early_cmdflag_n= 1'b1;
	    end
	    else begin
	      set_cmdflag_n= 1'b1;        
	    end
				// eop check; 
	    if(eop_n) begin
	      if(one64Blen) cmd_ns= s3;	// req not ready on dmc
					// wait one cycle
              else begin
	        if(req && same_client_n && !stall_enable) begin
			// cont' to next pkt; same client can burst in datareq
		  ack_n= 1'b1; 
		  ld_cdata_n= 1'b1;
	          // xtb_wr_n= is_nonpost_n; // no reg in ??
		  cmd_ns= s1;
	        end
	        else begin // wait data complete before switch to next client 
	          cmd_ns= s2; 
	        end
	      end 
   	    end // eop
            else begin
  	      inc_cntof64B_n= 1'b1;
  	      inc_curaddr_n= 1'b1;
	      cmd_ns= cmd_cs;  // continue this pkt	
            end 
  	   end		// added 121405
	   else begin // tag not valid (could be timeout in mid) 
	     cmd_ns= s3; // cont' to next pkt
	   end
          end
	end
    s2: begin // wait data complete
	    // xfer done is a pulse that align with dv of end of datareq; 
	    // in wr, since it always has 4 cycles for data, and it takes
	    // less than 4 cycles from s1 to s2, s2 should be able to
	    // catch this pulse;
	    // in rd, xfer_done is hard wired to 1

	     // check if req with same client
	     // req can happen while waiting for complete	
	     // try to burst out dv without waiting for 
	     // previous pkt comp of same client 
          if(req && same_client_n && !stall_enable) begin
                // new pkt; same client can burst in datareq
            ack_n= 1'b1;
            ld_cdata_n= 1'b1;
            // xtb_wr_n= is_nonpost_n; // no reg in ?/
            cmd_ns= s1;
          end
	  else begin
	    if(xfer_done) begin
	      if(req && !stall_enable)begin
	        ack_n= 1'b1;
	        ld_cdata_n= 1'b1;	
	        // xtb_wr_n= is_nonpost_n; // no reg in ?/
	        cmd_ns= s1;  // continue to process
	      end	
	      else 
	        cmd_ns= s0; // no more req; go back to idle
	    end
          end	// not same client at req
	end
    s3: begin // dummy cycle to sample correct dmc_req 
	  if(req && same_client_n && !stall_enable) begin
		// new pkt; same client can burst in datareq
	    ack_n= 1'b1; 
	    ld_cdata_n= 1'b1;
	    // xtb_wr_n= is_nonpost_n; // no reg in ?/
	    cmd_ns= s1;
	  end
	  else begin // wait data complete before switch to next client 
	    cmd_ns= s2; 
	  end
	end 
  endcase
end


always @ (posedge clk) begin
  if(ld_cdata_n) begin
    req_cmd_r<= `SMX_PD  req_cmd;
    req_addr_r<= `SMX_PD  req_addr;
    req_len_r<= `SMX_PD  req_len;
    req_xid_r<= `SMX_PD  req_xid;
    req_port_r<= `SMX_PD  req_port;
    req_dma_r<= `SMX_PD  req_dma;
    req_client_r<= `SMX_PD  req_client;
  end

  if(ld_cdata_n) 
    curaddr<= `SMX_PD  {req_addr[63:6], 6'h0}; // always start at 64B boundary
  else
    if(inc_curaddr_n) curaddr<= `SMX_PD  {new_msb_curaddr_n[57:0], 6'h0}; 

  if(ld_cdata_n) 
    cntof64B<= `SMX_PD  10'h0;
  else 
    if(inc_cntof64B_n) cntof64B<= `SMX_PD  new_cntof64B_n;

end

always @ (posedge clk) begin
  if(!reset_l)begin
    xtb_wr<= `SMX_PD  1'b0;
    ack<= `SMX_PD  1'b0;
    cmd_cs<= `SMX_PD  s0;
    cmdflag<= `SMX_PD  1'b0;
  end
  else begin
    if(set_xtb_wr_n)
      xtb_wr<= `SMX_PD  1'b1;
    else if(rst_xtb_wr)
      xtb_wr<= `SMX_PD  1'b0;
    ack<= `SMX_PD  ack_n;
    cmd_cs<= `SMX_PD  cmd_ns;
    if(cfg_no_cmdflag) begin
      cmdflag<= `SMX_PD  1'b0;
    end
    else begin
      if(set_cmdflag_n) 
        cmdflag<= `SMX_PD  1'b1;
      else  
        if(rst_cmdflag) cmdflag<= `SMX_PD  1'b0;
    end
  end
end

always @ (posedge clk) begin
    if(set_xtb_wr_n) begin 
      xtb_wdata<= `SMX_PD  xtb_wdata_n;
      xtb_waddr<= `SMX_PD  xtb_waddr_n;
    end 
    if(ld_info_n) begin
      nof64B<= `SMX_PD  nof64B_n; 
      eop_line_en<= `SMX_PD  eop_line_en_n;
    end
    if(set_cmdflag_n) cmdflag_data<= `SMX_PD  cmdflag_data_n;
end



endmodule
