// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_sm_resp_dv.v
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

module niu_smx_sm_resp_dv(
/*AUTOARG*/
   // Outputs
   smx_dmc_dv, smx_dmc_data, smx_dmc_byte_en, smx_dmc_status, 
   smx_dmc_resp_comp, smx_dmc_xcomp, smx_dmc_ack_comp, 
   smx_dmc_ack_xcomp, rst_dvflag, dv_idle, resp_dataff_rd, dv_cs, 
   // Inputs
   clk, reset_l, dvflag, dvflag_with_data, dvflag_line_en, 
   dvflag_sop_pos, dvflag_eop_pos, dvflag_sop_byte_en, 
   dvflag_eop_byte_en, dvflag_client, dvflag_xcomp, dvflag_status, 
   early_dvflag, early_dvflag_with_data, early_dvflag_line_en, 
   early_dvflag_sop_pos, early_dvflag_eop_pos, 
   early_dvflag_sop_byte_en, early_dvflag_eop_byte_en, 
   early_dvflag_client, early_dvflag_xcomp, early_dvflag_status, 
   resp_dataff_empty, resp_dataff_rdata, pio_resp_err_inject_cfg
   );

input		clk;
input		reset_l;
	// dmc if
output [7:0] 	smx_dmc_dv;
output [127:0] 	smx_dmc_data;
output [15:0] 	smx_dmc_byte_en;
output [3:0] 	smx_dmc_status;
output [7:0] 	smx_dmc_resp_comp;
output [7:0] 	smx_dmc_xcomp;

	// ack if
output [7:0] 	smx_dmc_ack_comp;
output [7:0] 	smx_dmc_ack_xcomp;

	// cmdlaunch if
input 		dvflag;
input [1:0]	dvflag_with_data; // b1: 1= rd (data,dv also sio dq) , 
			          //     0= wr/rderr (sio dq only) 
				  // b0: 1= with data
				  //     0=  without data	
input [3:0] 	dvflag_line_en;
input [3:0] 	dvflag_sop_pos; // indicate first data line position
input [3:0] 	dvflag_eop_pos; // indicate last data line position
input [15:0] 	dvflag_sop_byte_en; // use this for 'first' data line
input [15:0] 	dvflag_eop_byte_en; // use this for 'last' data line 
input [7:0] 	dvflag_client;
input [3:0] 	dvflag_xcomp;
input [3:0] 	dvflag_status;
output 		rst_dvflag;

output 		dv_idle;  // dv in idle state
input 		early_dvflag; // dv needs to be in idle to catch this pulse
			// and dvflag not set 
input [1:0] 	early_dvflag_with_data;  
			// 1= rd (data,dv also sio dq)  
			// 0= wr/rderr (sio dq only) 
input [3:0] 	early_dvflag_line_en;
input [3:0] 	early_dvflag_sop_pos; // indicate first data line position
input [3:0] 	early_dvflag_eop_pos; // indicate last data line position
input [15:0] 	early_dvflag_sop_byte_en; // use this for 'first' data line
input [15:0] 	early_dvflag_eop_byte_en; // use this for 'last' data line 
input [7:0] 	early_dvflag_client;
input [3:0] 	early_dvflag_xcomp;
input [3:0] 	early_dvflag_status;

// sio if
// output 		niu_sio_dq;
// move to cmdff rd; dataff have extra entries to handle
// pending data from cmdff rd to dv's data read out 
// siu still handle 4 credits

// resp dataff if
input 		resp_dataff_empty;  // not use ??
input [143:0] 	resp_dataff_rdata;
output 		resp_dataff_rd;

// pio i/f
input [2:0]  pio_resp_err_inject_cfg; // [0] - one pkt
				     //	[1] - alt pkt
			  	     // [2] - all pkt
output [2:0] dv_cs;



parameter dv_s0= 3'h0,
	  dv_s1= 3'h1,
	  dv_s2= 3'h2,
	  dv_s3= 3'h3,
	  dv_s4= 3'h4,
	  dv_s5= 3'h5;


wire [1:0] with_data_n= (dvflag)? dvflag_with_data : early_dvflag_with_data;
wire [3:0] line_en_n= (dvflag)? dvflag_line_en : early_dvflag_line_en;
wire [3:0] sop_pos_n= (dvflag)? dvflag_sop_pos : early_dvflag_sop_pos;
wire [3:0] eop_pos_n= (dvflag)? dvflag_eop_pos : early_dvflag_eop_pos; 
wire [15:0] sop_byte_en_n= (dvflag)? dvflag_sop_byte_en : early_dvflag_sop_byte_en; 
wire [15:0] eop_byte_en_n= (dvflag)? dvflag_eop_byte_en : early_dvflag_eop_byte_en; 
wire [7:0] client_n= (dvflag)? dvflag_client : early_dvflag_client;
wire [3:0] xcomp_n= (dvflag)? dvflag_xcomp : early_dvflag_xcomp;
wire [3:0] status_n= (dvflag)? dvflag_status : early_dvflag_status;

wire [127:0] smx_dmc_data_n= resp_dataff_rdata [127:0];
wire [7:0] smx_dmc_data_parity_n= resp_dataff_rdata [135:128];
reg [127:0] smx_dmc_data;

reg resp_dataff_rd_n;
wire resp_dataff_rd= resp_dataff_rd_n;

reg [2:0] dv_ns, dv_cs;
wire dv_idle_n= (dv_cs==dv_s0);
wire dv_idle= dv_idle_n;

// parity support related
// added r1 stage to flop in ram data to do parity chk
reg [7:0] 	smx_dmc_dv_r1;
reg [127:0] 	smx_dmc_data_r1;
reg [7:0] 	smx_dmc_data_parity_r1;
reg [15:0] 	smx_dmc_byte_en_r1;
reg [3:0] 	smx_dmc_status_r1;
reg [7:0] 	smx_dmc_resp_comp_r1;
reg [7:0] 	smx_dmc_xcomp_r1;
wire [7:0] 	gen_data_parity_n;
wire  		data_parerr_n= 
		  |(gen_data_parity_n ^ smx_dmc_data_parity_r1);


reg smx_dmc_dv_n;
reg smx_dmc_resp_comp_n;
reg smx_dmc_xcomp_n;
reg [15:0] smx_dmc_byte_en_n, smx_dmc_byte_en ;
reg [3:0] smx_dmc_status_n, smx_dmc_status;
// reg niu_sio_dq_n, niu_sio_dq;
reg ld_dvflag_data_n;
reg rst_dvflag_n;
wire rst_dvflag= rst_dvflag_n;
reg  ld_dataff_rd_shift_n; // in err case, rd 4 lines;
reg [3:0] dataff_rd_shift;

	// ack if
reg smx_dmc_ack_comp_n;
reg smx_dmc_ack_xcomp_n;

// reg [1:0]  dvflag_with_data_r;
reg [3:0]  dvflag_line_en_r;
reg [3:0]  dvflag_sop_pos_r;
reg [3:0]  dvflag_eop_pos_r;
reg [15:0] dvflag_sop_byte_en_r;
reg [15:0] dvflag_eop_byte_en_r;
reg [7:0]  dvflag_client_r;
reg [3:0]  dvflag_xcomp_r;
reg [3:0]  dvflag_status_r;


always @(/*AUTOSENSE*/dataff_rd_shift or dv_cs or dvflag
	 or dvflag_eop_byte_en_r or dvflag_eop_pos_r
	 or dvflag_line_en_r or dvflag_sop_byte_en_r
	 or dvflag_sop_pos_r or dvflag_status_r or dvflag_xcomp_r
	 or early_dvflag or eop_byte_en_n or eop_pos_n or line_en_n
	 or smx_dmc_status_r1 or sop_byte_en_n or sop_pos_n
	 or status_n or with_data_n or xcomp_n) begin
    smx_dmc_dv_n= 1'b0;
    smx_dmc_resp_comp_n= 1'b0;
    smx_dmc_xcomp_n= 1'b0;
    smx_dmc_byte_en_n= 16'h0;
    smx_dmc_status_n=  smx_dmc_status_r1;
    smx_dmc_ack_comp_n= 1'b0;
    smx_dmc_ack_xcomp_n= 1'b0;
//    niu_sio_dq_n= 1'b0;
    resp_dataff_rd_n= 1'b0;
    ld_dvflag_data_n= 1'b0; 
    rst_dvflag_n= 1'b0;
    ld_dataff_rd_shift_n= 1'b0;
    dv_ns= dv_cs;
  case(dv_cs)
    dv_s0: begin  // wait dvflag or early dvflag
		  // check to see if with data
		  // deq if no data	
		  // flop in working copy
	     if(dvflag||early_dvflag) begin
	       if(status_n[0]) begin // pkterr drop;	
	         dv_ns= dv_s4;
	       end
	       else begin		
                 if(with_data_n[0]) begin
	           smx_dmc_dv_n= line_en_n[0]; 
		   smx_dmc_resp_comp_n= line_en_n[3:0]==4'b0001;
		   smx_dmc_xcomp_n= xcomp_n[0];
	           smx_dmc_byte_en_n= sel_byte_en(sop_pos_n[0], eop_pos_n[0], 
					sop_byte_en_n, eop_byte_en_n);
		   smx_dmc_status_n= status_n; // or it with parity err ????
	           resp_dataff_rd_n= 1'b1;
	           ld_dvflag_data_n= 1'b1; // make own copy for s1-s3
    		   rst_dvflag_n= dvflag; // make room for next
	           dv_ns= dv_s1;
//	           niu_sio_dq_n= 1'b1; // put here to save cycles
	         end	        	
	         else begin // no data; just deq
		   if(with_data_n[1]) begin  // rd
		     smx_dmc_resp_comp_n= 1'b1;
		     smx_dmc_xcomp_n= xcomp_n[0];
	  	   end
   		   else begin // wr
		     smx_dmc_ack_comp_n= 1'b1;
		     smx_dmc_ack_xcomp_n= xcomp_n[0];
		   end
//	           niu_sio_dq_n= 1'b1;
    		   rst_dvflag_n= dvflag;
	           dv_ns= dv_s0;
	         end	
	       end	// good pkt	
	     end
	   end 
    dv_s1: begin
	     smx_dmc_dv_n= dvflag_line_en_r[1]; 
	     smx_dmc_resp_comp_n= dvflag_line_en_r[3:1]==3'b001;
	     smx_dmc_xcomp_n= dvflag_xcomp_r[1];
	     smx_dmc_byte_en_n= sel_byte_en(dvflag_sop_pos_r[1], dvflag_eop_pos_r[1], 
				dvflag_sop_byte_en_r, dvflag_eop_byte_en_r);
	     smx_dmc_status_n= dvflag_status_r; // or it with parity err ????
	     resp_dataff_rd_n= 1'b1;
	     dv_ns= dv_s2;
	   end 
    dv_s2: begin
	     smx_dmc_dv_n= dvflag_line_en_r[2]; 
	     smx_dmc_resp_comp_n= dvflag_line_en_r[3:2]==2'b01;
	     smx_dmc_xcomp_n= dvflag_xcomp_r[2];
	     smx_dmc_byte_en_n= sel_byte_en(dvflag_sop_pos_r[2], dvflag_eop_pos_r[2], 
				dvflag_sop_byte_en_r, dvflag_eop_byte_en_r);
	     smx_dmc_status_n= dvflag_status_r; // or it with parity err ????
	     resp_dataff_rd_n= 1'b1;
	     dv_ns= dv_s3;
	   end 
    dv_s3: begin
	     smx_dmc_dv_n= dvflag_line_en_r[3]; 
	     smx_dmc_resp_comp_n= dvflag_line_en_r[3];
	     // smx_dmc_resp_comp_n= (|dvflag_xcomp_r)? dvflag_xcomp_r[3] : 1'b1;
			// if xcomp on any cycle, use xcomp; else force 1 (mid of pkt)
	     smx_dmc_xcomp_n= dvflag_xcomp_r[3];
	     smx_dmc_byte_en_n= sel_byte_en(dvflag_sop_pos_r[3], dvflag_eop_pos_r[3], 
				dvflag_sop_byte_en_r, dvflag_eop_byte_en_r);
	     smx_dmc_status_n= dvflag_status_r; // or it with parity err ????
	     resp_dataff_rd_n= 1'b1;
	     // niu_sio_dq_n= 1'b1; 
	     dv_ns= dv_s0;
	   end 
    dv_s4: begin // pkt err handle
             if(with_data_n[0]) begin
               ld_dataff_rd_shift_n= 1'b1;
	       dv_ns= dv_s5;
//	       niu_sio_dq_n= 1'b1; // save cycles
	     end	        	
	     else begin // no data; just deq
//	       niu_sio_dq_n= 1'b1;
    	       rst_dvflag_n= dvflag;
	       dv_ns= dv_s0;
	     end	
	   end 
    dv_s5: begin // pkterr read datafff
	     if(|dataff_rd_shift) resp_dataff_rd_n= 1'b1;
	     else begin // read dataff done; dq
	       // niu_sio_dq_n= 1'b1;
    	       rst_dvflag_n= dvflag;
	       dv_ns= dv_s0;
	     end	
	   end 
  endcase
end


always @(posedge clk) begin
  if(!reset_l) 
    dataff_rd_shift<= `SMX_PD  4'h0;
  else begin
    if(ld_dataff_rd_shift_n) 
      dataff_rd_shift<= `SMX_PD  4'hf; // ld 4cy write
    else
      dataff_rd_shift<= `SMX_PD  (dataff_rd_shift>>1);
  end
end



always @ (posedge clk) begin
  if(ld_dvflag_data_n) begin
//    dvflag_with_data_r<= `SMX_PD  with_data_n;
    dvflag_line_en_r<= `SMX_PD  line_en_n;
    dvflag_sop_pos_r<= `SMX_PD  sop_pos_n;
    dvflag_eop_pos_r<= `SMX_PD  eop_pos_n;
    dvflag_sop_byte_en_r<= `SMX_PD  sop_byte_en_n;
    dvflag_eop_byte_en_r<= `SMX_PD  eop_byte_en_n;
    dvflag_client_r<= `SMX_PD  client_n;
    dvflag_xcomp_r<= `SMX_PD  xcomp_n;
    dvflag_status_r<= `SMX_PD  status_n;
  end
end 

wire [7:0] sel_client_n= (dv_idle_n)? client_n : dvflag_client_r;

reg [7:0] 	smx_dmc_dv;
reg [7:0] 	smx_dmc_resp_comp;
reg [7:0] 	smx_dmc_xcomp;
reg [7:0] 	smx_dmc_ack_comp;
reg [7:0] 	smx_dmc_ack_xcomp;

always @ (posedge clk) begin
  if(!reset_l) begin
//    niu_sio_dq<= `SMX_PD  1'b0;
    smx_dmc_dv<= `SMX_PD  8'h0;
    smx_dmc_dv_r1<= `SMX_PD  8'h0;
    smx_dmc_xcomp<= `SMX_PD  8'h0;
    smx_dmc_xcomp_r1<= `SMX_PD  8'h0;
    smx_dmc_resp_comp<= `SMX_PD  8'h0;
    smx_dmc_resp_comp_r1<= `SMX_PD  8'h0;
    smx_dmc_ack_xcomp<= `SMX_PD  8'h0;
    smx_dmc_ack_comp<= `SMX_PD  8'h0;
    dv_cs<= `SMX_PD  dv_s0;
  end
  else begin
//    niu_sio_dq<= `SMX_PD  niu_sio_dq_n;
    smx_dmc_dv_r1<= `SMX_PD  {8{smx_dmc_dv_n}} & sel_client_n ;
    smx_dmc_xcomp_r1<= `SMX_PD  {8{smx_dmc_xcomp_n}} & sel_client_n ;
    smx_dmc_resp_comp_r1<= `SMX_PD  {8{smx_dmc_resp_comp_n}} & sel_client_n ;

	// one stage to allow ram data flop for parity check
    smx_dmc_dv<= `SMX_PD  smx_dmc_dv_r1;
    smx_dmc_xcomp<= `SMX_PD  smx_dmc_xcomp_r1;
    smx_dmc_resp_comp<= `SMX_PD  smx_dmc_resp_comp_r1;

    smx_dmc_ack_xcomp<= `SMX_PD  {8{smx_dmc_ack_xcomp_n}} & sel_client_n ;
    smx_dmc_ack_comp<= `SMX_PD  {8{smx_dmc_ack_comp_n}} & sel_client_n ;
    dv_cs<= `SMX_PD  dv_ns;
  end
end


always @ (posedge clk) begin
  smx_dmc_data_r1<= `SMX_PD  smx_dmc_data_n;
  smx_dmc_data_parity_r1<= `SMX_PD  smx_dmc_data_parity_n[7:0];
  smx_dmc_byte_en_r1<= `SMX_PD  smx_dmc_byte_en_n; 
  smx_dmc_status_r1<= `SMX_PD  smx_dmc_status_n; 

  smx_dmc_data<= `SMX_PD  smx_dmc_data_r1;
  smx_dmc_byte_en<= `SMX_PD  smx_dmc_byte_en_r1; 
  smx_dmc_status<= `SMX_PD  (smx_dmc_status_r1 | {3'h0, data_parerr_n}); 
end

wire err_inject_enable_n;
wire [127:0] smx_dmc_data_r1_n= (err_inject_enable_n)? 
				{smx_dmc_data_r1[127:1], ~smx_dmc_data_r1[0]} :
				smx_dmc_data_r1;

niu_smx_gen_siudp genpar(
	.data	(smx_dmc_data_r1_n [127:0]),
	.parity (gen_data_parity_n [7:0])
	);


// error injection
reg  one_pkt_flag;
reg  alt_pkt_flag;
reg  first_line_r1; // name _r1 to indicate align with data_r1

always @(posedge clk) begin
  if(!reset_l) begin
    one_pkt_flag <= `SMX_PD 1'b0;
    alt_pkt_flag <= `SMX_PD 1'b0;
    first_line_r1 <= `SMX_PD 1'b0;
  end
  else begin
    if(first_line_r1 & ~one_pkt_flag & pio_resp_err_inject_cfg[0])
      one_pkt_flag <= `SMX_PD 1'b1;  // set one_pkt flag 
    else if (~pio_resp_err_inject_cfg[0]) one_pkt_flag <=  `SMX_PD 1'b0;
				// reset when cfg one_pkt unset

    if(first_line_r1 & pio_resp_err_inject_cfg[1]) // alternate each rd
      alt_pkt_flag <= `SMX_PD ~alt_pkt_flag;
   
    if(ld_dvflag_data_n) first_line_r1 <= `SMX_PD 1'b1; // set at dv_s0
    else if(first_line_r1) first_line_r1 <= `SMX_PD 1'b0; // reset itself when set
  end
end


assign err_inject_enable_n= ((~one_pkt_flag &  pio_resp_err_inject_cfg[0]) |
			  (alt_pkt_flag & pio_resp_err_inject_cfg[1]) |
			  pio_resp_err_inject_cfg[2]) & first_line_r1;



function [15:0] sel_byte_en;
  input sop;
  input eop;
  input[15:0] sop_ben;
  input[15:0] eop_ben;
  begin
    case({sop,eop}) 
      2'b00: sel_byte_en= 16'hffff; 
      2'b01: sel_byte_en= eop_ben;
      2'b10: sel_byte_en= sop_ben;
      2'b11: sel_byte_en= (sop_ben & eop_ben); 
    endcase
  end
endfunction


endmodule

