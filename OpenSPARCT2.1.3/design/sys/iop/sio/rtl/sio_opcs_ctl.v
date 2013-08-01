// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sio_opcs_ctl.v
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
module sio_opcs_ctl (
  iol2clk, 
  ncu_sio_ctag_cei, 
  ncu_sio_ctag_uei, 
  sibling_is_elder_flag, 
  sibling_ncu_ctag_ue, 
  sibling_ncu_ctag_ce, 
  sibling_ncu_d_pe, 
  opcs_ncu_ctag_ue, 
  opcs_ncu_ctag_ce, 
  opcs_ncu_d_pe, 
  opcs_new_opdhqx1, 
  opcs_new_opdhqx0, 
  opcc_opcs_opddqx0_wr_addr, 
  opcc_opcs_opddqx1_wr_addr, 
  opcc_opcs_opdhqx_wr_addr, 
  opdhqx_dout, 
  parity_result, 
  opcs_packet_flowmode_vld, 
  opcs_packet_ack_in, 
  tcu_scan_en, 
  scan_in, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_dbr_gateoff, 
  opcs_opcc_opdhqx_rd_addr, 
  opcs_packet_req, 
  opcs_packet_datareq, 
  opcs_opddqx0_rd_addr, 
  opcs_opddqx1_rd_addr, 
  opcs_opdhqx_rd_addr, 
  opcs_opddqx0_rd_en, 
  opcs_opddqx1_rd_en, 
  opcs_opdhqx_rd_en, 
  opcs_opds_reloadhdr, 
  opcs_opds_selhdr, 
  scan_out);
wire se;
wire siclk;
wire soclk;
wire pce_ov;
wire stop;
wire l1clk;
wire spares_scanin;
wire spares_scanout;
wire sio_ext_hdr_vld_l;
wire arc_start_hdr;
wire arc_start_hdrpayld;
wire arc_data4_hdr;
wire arc_data4_hdrpayld;
wire arc_hdr_hdr;
wire arc_hdr_hdrpayld;
wire sio_ext_hdr_vld_r;
wire sio_ext_datareq_l;
wire [4:0] opcs_opdhqx_rd_addr_l;
wire [4:0] opcs_opdhqx_rd_addr_r;
wire [6:0] opcs_opddqx0_rd_addr_l;
wire [6:0] opcs_opddqx1_rd_addr_l;
wire data_inc;
wire [6:0] opcs_opddqx0_rd_addr_r;
wire hqempty;
wire data_phase_en;
wire [5:0] cmd;
wire opdhq_e_bit;
wire opcs_opds_ue;
wire [5:0] hqctageccout;
wire [15:0] hqtagout;
wire myctag_ue;
wire hdr_cycle;
wire data_cycle;
wire [7:0] cstate;
wire myctag_ce;
wire myd_pe;
wire ncu_ctag_ue_l;
wire ncu_ctag_ce_l;
wire ncu_d_pe_l;
wire [5:0] c;
wire [15:0] id;
wire opdhqx_ue_bit;
wire [4:0] opcs_opcc_opdhqx_rd_addr_l;
wire opdhqx_r_bit;
wire valid;
wire hq_almost_empty;
wire del_hq_almost;
wire pqempty;
wire [6:0] opddqx0_wr_addr;
wire [6:0] opddqx1_wr_addr;
wire [6:0] opcs_opddqx1_rd_addr_r;
wire [4:0] opdhqx_wr_addr;
wire hq_almost_empty_r;
wire arc_data3_data4;
wire go;
wire dq;
wire [2:0] crd_cnt_r;
wire [2:0] crd_cnt_l;
wire [1:0] op;
wire inc;
wire [7:0] nstate;
wire [7:0] cstate_r;
wire valid_r;
wire arc_hdr_no_c;
wire reg_cstate_scanin;
wire reg_cstate_scanout;
wire reg_packet_req_scanin;
wire reg_packet_req_scanout;
wire reg_packet_datareq_scanin;
wire reg_packet_datareq_scanout;
wire reg_opddqx0_rd_addr_scanin;
wire reg_opddqx0_rd_addr_scanout;
wire reg_opddqx1_rd_addr_scanin;
wire reg_opddqx1_rd_addr_scanout;
wire reg_opdhqx_rd_addr_scanin;
wire reg_opdhqx_rd_addr_scanout;
wire reg_opcs_opcc_opdhqx_rd_addr_scanin;
wire reg_opcs_opcc_opdhqx_rd_addr_scanout;
wire reg_crd_cnt_scanin;
wire reg_crd_cnt_scanout;
wire reg_opdhqx_wr_addr_scanin;
wire reg_opdhqx_wr_addr_scanout;
wire reg_opddqx0_wr_addr_scanin;
wire reg_opddqx0_wr_addr_scanout;
wire reg_opddqx1_wr_addr_scanin;
wire reg_opddqx1_wr_addr_scanout;
wire reg_valid_scanin;
wire reg_valid_scanout;
wire reg_opdhqx_ue_bit_scanin;
wire reg_opdhqx_ue_bit_scanout;
wire opdhqx_ue_bit_r;
wire reg_hq_almost_r_scanin;
wire reg_hq_almost_r_scanout;
wire reg_ncu_ctag_ue_scanin;
wire reg_ncu_ctag_ue_scanout;
wire reg_ncu_ctag_ce_scanin;
wire reg_ncu_ctag_ce_scanout;
wire reg_ncu_d_pe_scanin;
wire reg_ncu_d_pe_scanout;


   input          iol2clk; // IO level 2 clock

   // THESE SETS OF SIGNALS ARE FOR RAS -- TO NCU
   input 	  ncu_sio_ctag_cei;
   input 	  ncu_sio_ctag_uei;
   
   // sibling opcs signals used only if sibling_is_elder_flag is FALSE for dmu=0, niu=1
   input 	  sibling_is_elder_flag;
   input 	  sibling_ncu_ctag_ue;     // input from sibling opcs
   input 	  sibling_ncu_ctag_ce;     // input from sibling opcs
   input 	  sibling_ncu_d_pe;        // input from sibling opcs

   output 	  opcs_ncu_ctag_ue;
   output 	  opcs_ncu_ctag_ce;
   output 	  opcs_ncu_d_pe;

   output [63:0]   opcs_new_opdhqx1; // dataq -- valid on 
   output [63:0]   opcs_new_opdhqx0; // dataq -- valid on 

   // THE ABOVE SETS OF SIGNALS ARE FOR RAS -- TO NCU
   input [6:0] 	  opcc_opcs_opddqx0_wr_addr; // dataq -- cmp domain synced, gray-coded + 1 bit
   input [6:0] 	  opcc_opcs_opddqx1_wr_addr; // dataq -- cmp domain synced, gray-coded + 1 bit 
   input [4:0] 	  opcc_opcs_opdhqx_wr_addr; // hdrq -- cmp domain synced, gray-coded + 1 bit 
   input [31:0]	  opdhqx_dout;
   input [7:0]    parity_result;
   input 	  opcs_packet_flowmode_vld; // 1 = flow control mode is active - should be a static signal
   input          opcs_packet_ack_in; // if flowmode_vld=1, if count_vld, this is a release of a credit, otherwise, this means stop

   //TCU related signals
   input 	  tcu_scan_en;
   input 	  scan_in;
   input 	  tcu_aclk;
   input 	  tcu_bclk; 
   input 	  tcu_pce_ov;
   input 	  tcu_clk_stop;
   input 	  tcu_dbr_gateoff;

   output [4:0]   opcs_opcc_opdhqx_rd_addr; 	// hdrq -- io domain, gray-coded + 1 bit, valid on 
   output 	  opcs_packet_req;		// SIO requesting to send packet to IO
   output 	  opcs_packet_datareq;		// SIO requesting to send packet w/data to IO
   output [5:0]   opcs_opddqx0_rd_addr; // dataq -- valid on 
   output [5:0]   opcs_opddqx1_rd_addr; // dataq -- valid on 
   output [3:0]   opcs_opdhqx_rd_addr; // hdrq -- valid on 
   output 	  opcs_opddqx0_rd_en; // dataq -- valid on 
   output 	  opcs_opddqx1_rd_en; // dataq -- valid on 
   output 	  opcs_opdhqx_rd_en; // hdrq -- valid on 
   output 	  opcs_opds_reloadhdr;		// recircular the header
   output 	  opcs_opds_selhdr;		// select header and data
   output 	  scan_out;

   reg [7:0]      nstate_r;
   reg [5:0]	  e;
   reg [5:0]	  p;
   reg [15:0]	  newid;
   reg [5:0]	  new_c;

   ///////////////////////////////////////
   // Scan chain connections            
   ///////////////////////////////////////
   // scan renames
   assign 	  se = tcu_scan_en;
   assign 	  siclk = tcu_aclk;
   assign 	  soclk = tcu_bclk;
   assign 	  pce_ov = tcu_pce_ov;
   assign 	  stop = tcu_clk_stop;
   // end scan

   sio_opcs_ctl_l1clkhdr_ctl_macro clkgen (
			      .l2clk  (iol2clk                  ),
			      .l1en   (1'b1                 ),
			      .l1clk  (l1clk                ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
			      );
   // Spare gate
   sio_opcs_ctl_spare_ctl_macro__num_2 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
   );

//************************************************************************
// STATE DEFINITION
//************************************************************************

`define         START_ST                8'b00000001
`define         HDR_ST                  8'b00000010
`define         HDR_PAYLD_ST            8'b00000100
`define         DATA1_ST                8'b00001000
`define         DATA2_ST                8'b00010000
`define         DATA3_ST                8'b00100000
`define         DATA4_ST                8'b01000000
`define         NO_C_ST                 8'b10000000

`define         START                   0
`define         HDR                     1
`define         HDR_PAYLD               2
`define         DATA1                   3
`define         DATA2                   4
`define         DATA3                   5
`define         DATA4                   6
`define         NO_C                    7

//************************************************************************
//                              OUTPUT LOGICS
//************************************************************************
assign  sio_ext_hdr_vld_l = arc_start_hdr || arc_start_hdrpayld || arc_data4_hdr ||
			  arc_data4_hdrpayld || arc_hdr_hdr || arc_hdr_hdrpayld  ;	 

assign	opcs_packet_req =  sio_ext_hdr_vld_r & ~tcu_dbr_gateoff;

assign  sio_ext_datareq_l = arc_start_hdrpayld || arc_hdr_hdrpayld || 
                            arc_data4_hdrpayld;

assign  opcs_opdhqx_rd_addr[3:0] = opcs_opdhqx_rd_addr_l[3:0];
assign  opcs_opdhqx_rd_addr_l[4:0] = sio_ext_hdr_vld_l ?

				     (opcs_opdhqx_rd_addr_r[4:0] + 5'h1) :
				      opcs_opdhqx_rd_addr_r[4:0];
				     
assign opcs_opddqx0_rd_addr[5:0] =  opcs_opddqx0_rd_addr_l[5:0];
assign opcs_opddqx1_rd_addr[5:0] =  opcs_opddqx1_rd_addr_l[5:0];

assign  opcs_opddqx0_rd_addr_l[6:0] = data_inc ?
				(opcs_opddqx0_rd_addr_r[6:0] + 7'h01 ) :
				opcs_opddqx0_rd_addr_r[6:0]; 
assign  opcs_opddqx1_rd_addr_l[6:0] = opcs_opddqx0_rd_addr_l[6:0]; 

assign opcs_opdhqx_rd_en  = ~(hqempty);
//assign  opcs_opdhqx_rd_en  = 1'b1; 
//assign  opcs_opdhqx_rd_en  = valid ; 
assign  opcs_opddqx0_rd_en = data_phase_en; 
assign  opcs_opddqx1_rd_en = data_phase_en; 

//assign opcs_new_opdhqx1[63:0] = {2'b00, hqctageccout[5:0], {56{1'b0}}};
//assign opcs_new_opdhqx0[63:0] = {cmd[5:0], {39{1'b0}}, 1'b0, opdhq_e_bit, opcs_opds_ue, hqtagout[15:0]};

assign opcs_new_opdhqx1[63:0] = {2'b00, new_c[5:0], {56{1'b0}}};
assign opcs_new_opdhqx0[63:0] = {cmd[5:0], {39{1'b0}}, 1'b0, opdhq_e_bit, opcs_opds_ue, newid[15:0]};

//assign out_ctag_ue 	= opcs_ncu_ctag_ue; 
//assign out_ctag_ce 	= opcs_ncu_ctag_ce; 
//assign out_d_pe 	= opcs_ncu_d_pe; 

//--------------------------------------------------------
//  New Header generation
//--------------------------------------------------------

assign hqctageccout[5:0] 	= opdhqx_dout[25:20];
assign cmd[5:0] 		= {2'b10, opdhqx_dout[17], 3'b010};
assign hqtagout[15:0] 		= ncu_sio_ctag_cei ? {opdhqx_dout[15:1], ~opdhqx_dout[0]} : 
				  ncu_sio_ctag_uei ? {opdhqx_dout[15:2], ~opdhqx_dout[1], ~opdhqx_dout[0]} :
					opdhqx_dout[15:0];
assign opdhq_e_bit 		= opdhqx_dout[19] || myctag_ue ;

//--------------------------------------------------------
//  			RAS 
//--------------------------------------------------------

assign  hdr_cycle = arc_hdr_hdr ||  arc_start_hdr || arc_start_hdrpayld ||
		    arc_hdr_hdrpayld || arc_data4_hdr || arc_data4_hdrpayld;

assign  data_cycle = cstate[`HDR_PAYLD] || cstate[`DATA1] || cstate[`DATA2] || cstate[`DATA3] ;
		    
assign  myctag_ue = |e[4:0] && (~e[5] || (e[4:0] > 5'd21)) && hdr_cycle && ~opdhqx_dout[19];
assign  myctag_ce = (e[4:0] <= 5'd21) && e[5] && hdr_cycle && ~opdhqx_dout[19] ;
assign  myd_pe = (|parity_result[7:0]) && data_cycle; 

assign  ncu_ctag_ue_l = myctag_ue ||  (sibling_ncu_ctag_ue && ~sibling_is_elder_flag );
assign  ncu_ctag_ce_l = myctag_ce || (sibling_ncu_ctag_ce && ~sibling_is_elder_flag );
assign  ncu_d_pe_l    = myd_pe    || (sibling_ncu_d_pe && ~sibling_is_elder_flag );



//----------------------------------------
// CTAG ERROR CORRECTION AND CHECKING
//----------------------------------------
assign  c[5:0]  = hqctageccout[5:0];
assign id[15:0]	= hqtagout[15:0];

always @ ( id[15:0] or c[5:0] )
  begin

        p[0]    = id[0] ^ id[1] ^ id[3] ^ id[4] ^ id[6] ^ id[8] ^ id[10] ^ id[11] ^id[13] ^ id[15];
        p[1]    = id[0] ^ id[2] ^ id[3] ^ id[5] ^ id[6] ^ id[9] ^ id[10] ^ id[12] ^id[13] ;
        p[2]    = id[1] ^ id[2] ^ id[3] ^ id[7] ^ id[8] ^ id[9] ^ id[10] ^ id[14] ^id[15] ;
        p[3]    = id[4] ^ id[5] ^ id[6] ^ id[7] ^ id[8] ^ id[9] ^ id[10] ;
        p[4]    = id[11] ^ id[12] ^ id[13] ^ id[14] ^ id[15] ;
        p[5]    = id[0] ^ id[1] ^ id[2] ^ id[3] ^ id[4] ^ id[5] ^ id[6] ^ id[7] ^ id[8] ^ id[9] ^
                  id[10] ^ id[11] ^ id[12] ^ id[13] ^ id[14] ^id[15] ^ c[0] ^ c[1] ^ c[2] ^ c[3] ^ c[4];

        e[0]    = p[0] ^ c[0];
        e[1]    = p[1] ^ c[1];
        e[2]    = p[2] ^ c[2];
        e[3]    = p[3] ^ c[3];
        e[4]    = p[4] ^ c[4];
        e[5]    = p[5] ^ c[5];

        new_c[5:0]  = c[5:0];
        newid[15:0] = id[15:0];

     if (e[5])
     begin
     case (e[4:0])              //synopsys parallel_case
        5'b00000        : new_c[5] = ~c[5];
        5'b00001        : new_c[0] = ~c[0];
        5'b00010        : new_c[1] = ~c[1];
        5'b00011        : newid[0] = ~id[0];
        5'b00100        : new_c[2] = ~c[2];
        5'b00101        : newid[1] = ~id[1];
        5'b00110        : newid[2] = ~id[2];
        5'b00111        : newid[3] = ~id[3];
        5'b01000        : new_c[3] = ~c[3];
        5'b01001        : newid[4] = ~id[4];
        5'b01010        : newid[5] = ~id[5];
        5'b01011        : newid[6] = ~id[6];
        5'b01100        : newid[7] = ~id[7];
        5'b01101        : newid[8] = ~id[8];
        5'b01110        : newid[9] = ~id[9];
        5'b01111        : newid[10] = ~id[10];
        5'b10000        : new_c[4] = ~c[4];
        5'b10001        : newid[11] = ~id[11];
        5'b10010        : newid[12] = ~id[12];
        5'b10011        : newid[13] = ~id[13];
        5'b10100        : newid[14] = ~id[14];
        5'b10101        : newid[15] = ~id[15];
        default         : ;
     endcase
     end

  end


assign	opcs_opds_ue 	=  opdhqx_ue_bit;
assign  opcs_opcc_opdhqx_rd_addr_l[4:0] =  opcs_packet_req ? opcs_opdhqx_rd_addr_r[4:0] - 5'h01 
						: opcs_opcc_opdhqx_rd_addr[4:0];
assign  opcs_opds_reloadhdr = 1'b0 ;          		// recircular the header ???
assign  opcs_opds_selhdr= sio_ext_hdr_vld_l;

//************************************************************************
//                      INTERNAL LOCIGS 
//************************************************************************
assign	opdhqx_r_bit		= opdhqx_dout[17];
assign	opdhqx_ue_bit		= opdhqx_dout[16];
assign	valid		   	= ~((hq_almost_empty && del_hq_almost) || hqempty)  &&  ~(opdhqx_r_bit && pqempty );
assign  pqempty 		= (opddqx0_wr_addr[6:2] == opcs_opddqx0_rd_addr_r[6:2]) ||
                           	  (opddqx1_wr_addr[6:2] == opcs_opddqx1_rd_addr_r[6:2]);
assign  hqempty                 = (opdhqx_wr_addr[4:0] == opcs_opdhqx_rd_addr_r[4:0]);
assign  hq_almost_empty		= ((opdhqx_wr_addr[4:0] - opcs_opdhqx_rd_addr_r[4:0]) == 5'b01) ||
				  ((opcs_opdhqx_rd_addr_r[4:0] - opdhqx_wr_addr[4:0]) == 5'b01);
assign  del_hq_almost		= hq_almost_empty_r && ~hqempty && ~hq_almost_empty;

// same cycle as header, since the data memory come out 1 cycle late
assign  data_inc		=  arc_start_hdrpayld || arc_hdr_hdrpayld || 
				  arc_data4_hdrpayld ||			   
//				  (cstate[`NO_C] && go &&  opdhqx_r_bit) ||
				  cstate[`HDR_PAYLD] || cstate[`DATA1] || cstate[`DATA2]; 

assign  data_phase_en		= (cstate[`START] && valid )  ||
				   arc_start_hdrpayld || 
				  (arc_data3_data4 && opdhqx_r_bit)  ||    //rd-rd 
				   cstate[`DATA4] || cstate[`HDR]     ||   //rd-rd, rd_wr_rd, rd_i_rd
				   arc_hdr_hdrpayld ||    		  //rd-wr-rd, rd at previous 1s rd d4
				  (cstate[`NO_C]  &&  opdhqx_r_bit) ||
				  cstate[`HDR_PAYLD] || cstate[`DATA1] ; 

assign  go 		   	= dq || ~crd_cnt_r[2] || ~opcs_packet_flowmode_vld ; 
//assign  almost_not_go 		=  crd_cnt_l[2] && ~dq; 
assign  crd_cnt_l[2:0]	   	= (op[1:0] == 2'b10) ? crd_cnt_r[2:0] + 3'b001 :
			     	  (op[1:0] == 2'b01) && (| crd_cnt_r[2:0])? 
				  (crd_cnt_r[2:0] - 3'b001) :
			     	  crd_cnt_r[2:0];
assign  op[1:0]		   	= {inc,dq};
assign  inc		   	= sio_ext_hdr_vld_l;
assign  dq		   	= opcs_packet_ack_in;


//************************************************************************
//                      STATE TRANSITION SECTION
//************************************************************************
//0in one_hot -var cstate[7:0]
//0in one_hot -var nstate_r[7:0]

assign  nstate[7:0] 		= {nstate_r[7:1], ~nstate_r[0]};
assign  cstate[7:0] 		= {cstate_r[7:1], ~cstate_r[0]};

//valid_r is the slower version of valid, so that is enough time to read data fr.
//memory before transition to various header state
assign  arc_start_hdr           = cstate[`START] && ~opdhqx_r_bit && go && 
				   ~((hq_almost_empty && del_hq_almost)|| hqempty) ; 
assign  arc_start_hdrpayld      = cstate[`START] && opdhqx_r_bit && valid_r && go  ; 
assign  arc_hdr_hdrpayld        = cstate[`HDR]   && opdhqx_r_bit && valid_r && ~pqempty && go ; 
assign  arc_hdr_hdr             = cstate[`HDR]   && ~opdhqx_r_bit && 
				  ~((hq_almost_empty && del_hq_almost) || hqempty)  && go ;
assign  arc_data3_data4         = cstate[`DATA3] ;
assign  arc_data4_hdr           = cstate[`DATA4] && ~opdhqx_r_bit && 
				  ~((hq_almost_empty && del_hq_almost) || hqempty)  && go ; 
assign  arc_data4_hdrpayld      = cstate[`DATA4] && opdhqx_r_bit && valid_r && go;
assign  arc_hdr_no_c		= cstate[`HDR]   && ~go && opdhqx_r_bit && ~hqempty ;

always @ (arc_start_hdr   or    arc_start_hdrpayld      or arc_hdr_hdrpayld     or
          arc_hdr_hdr     or    arc_data4_hdr           or arc_data4_hdrpayld   or 
	  arc_hdr_no_c	  or    cstate)

        begin
        case (1'b1)                     //synopsys parallel_case full_case
                cstate[`START]  : if (arc_start_hdr)
                                        nstate_r = `HDR_ST;
                                  else if (arc_start_hdrpayld)
                                        nstate_r = `HDR_PAYLD_ST;
                                  else
                                        nstate_r = `START_ST;
                cstate[`HDR]    : if (arc_hdr_hdrpayld)
                                        nstate_r = `HDR_PAYLD_ST;
                                  else if (arc_hdr_hdr)
                                        nstate_r = `HDR_ST;
                                  else if (arc_hdr_no_c)
                                        nstate_r = `NO_C_ST;
				  else
                                        nstate_r = `START_ST;
		cstate[`NO_C]   :    	nstate_r = `START_ST;

                cstate[`HDR_PAYLD] : 
                                        nstate_r = `DATA1_ST;
                cstate[`DATA1]  : 
                                        nstate_r = `DATA2_ST;
                                 
                cstate[`DATA2]  : 
                                        nstate_r = `DATA3_ST;
                cstate[`DATA3]  : 
                                        nstate_r = `DATA4_ST;
                cstate[`DATA4]  : if (arc_data4_hdr)
                                        nstate_r = `HDR_ST;
                                  else if (arc_data4_hdrpayld)
                                        nstate_r = `HDR_PAYLD_ST;
                                  else
                                        nstate_r = `START_ST;
                default         : begin
                                  // 0in < fire -message "ERROR : sio_opcs state machine default case"
                                        nstate_r = `START_ST;
                                  end
        endcase
        end

//--------------------------------------------------------------------------------------
//************************************************************************
//                              REGISTERS section
//************************************************************************

sio_opcs_ctl_msff_ctl_macro__width_8 reg_cstate  // ASYNC reset active low
                                (
                                        .scan_in(reg_cstate_scanin),
                                        .scan_out(reg_cstate_scanout),
                                        .dout(cstate_r[7:0]),
                                        .l1clk(l1clk),
                                        .din(nstate[7:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sio_opcs_ctl_msff_ctl_macro__width_1 reg_packet_req  // ASYNC reset active low
                                (
                                        .scan_in(reg_packet_req_scanin),
                                        .scan_out(reg_packet_req_scanout),
                                        .dout(sio_ext_hdr_vld_r),
                                        .l1clk(l1clk),
                                        .din(sio_ext_hdr_vld_l),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sio_opcs_ctl_msff_ctl_macro__width_1 reg_packet_datareq  // ASYNC reset active low
                                (
                                        .scan_in(reg_packet_datareq_scanin),
                                        .scan_out(reg_packet_datareq_scanout),
                                        .dout(opcs_packet_datareq),
                                        .l1clk(l1clk),
                                        .din(sio_ext_datareq_l),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sio_opcs_ctl_msff_ctl_macro__width_7 reg_opddqx0_rd_addr  // ASYNC reset active low
                                (
                                        .scan_in(reg_opddqx0_rd_addr_scanin),
                                        .scan_out(reg_opddqx0_rd_addr_scanout),
                                        .dout(opcs_opddqx0_rd_addr_r[6:0]),
                                        .l1clk(l1clk),
                                        .din(opcs_opddqx0_rd_addr_l[6:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sio_opcs_ctl_msff_ctl_macro__width_7 reg_opddqx1_rd_addr  // ASYNC reset active low
                                (
                                        .scan_in(reg_opddqx1_rd_addr_scanin),
                                        .scan_out(reg_opddqx1_rd_addr_scanout),
                                        .dout(opcs_opddqx1_rd_addr_r[6:0]),
                                        .l1clk(l1clk),
                                        .din(opcs_opddqx1_rd_addr_l[6:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sio_opcs_ctl_msff_ctl_macro__width_5 reg_opdhqx_rd_addr  // ASYNC reset active low
                                (
                                        .scan_in(reg_opdhqx_rd_addr_scanin),
                                        .scan_out(reg_opdhqx_rd_addr_scanout),
                                        .dout(opcs_opdhqx_rd_addr_r[4:0]),
                                        .l1clk(l1clk),
                                        .din(opcs_opdhqx_rd_addr_l[4:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sio_opcs_ctl_msff_ctl_macro__width_5 reg_opcs_opcc_opdhqx_rd_addr  // ASYNC reset active low
                                (
                                        .scan_in(reg_opcs_opcc_opdhqx_rd_addr_scanin),
                                        .scan_out(reg_opcs_opcc_opdhqx_rd_addr_scanout),
                                        .dout(opcs_opcc_opdhqx_rd_addr[4:0]),
                                        .l1clk(l1clk),
                                        .din(opcs_opcc_opdhqx_rd_addr_l[4:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

//msff_ctl_macro reg_opddqx0_rd_en (width=1) // ASYNC reset active low
//                                (
//                                        .scan_in(reg_opddqx0_rd_en_scanin),
//                                        .scan_out(reg_opddqx0_rd_en_scanout),
//                                        .dout(opcs_opddqx0_rd_en),
//                                        .l1clk(l1clk),
//                                        .din(opcs_opddqx0_rd_en_l),
//                                        );

//msff_ctl_macro reg_opddqx1_rd_en (width=1) // ASYNC reset active low
//                                (
//                                        .scan_in(reg_opddqx1_rd_en_scanin),
//                                        .scan_out(reg_opddqx1_rd_en_scanout),
//                                        .dout(opcs_opddqx1_rd_en),
//                                        .l1clk(l1clk),
//                                        .din(opcs_opddqx1_rd_en_l),
//                                        );

//msff_ctl_macro reg_opdhqx_rd_en (width=1) // ASYNC reset active low
//                                (
//                                        .scan_in(reg_opdhqx_rd_en_scanin),
//                                        .scan_out(reg_opdhqx_rd_en_scanout),
//                                        .dout(opcs_opdhqx_rd_en),
//                                        .l1clk(l1clk),
//                                        .din(opcs_opdhqx_rd_en_l),
//                                        );

sio_opcs_ctl_msff_ctl_macro__width_3 reg_crd_cnt  // ASYNC reset active low
                                (
                                        .scan_in(reg_crd_cnt_scanin),
                                        .scan_out(reg_crd_cnt_scanout),
                                        .dout(crd_cnt_r[2:0]),
                                        .l1clk(l1clk),
                                        .din(crd_cnt_l[2:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sio_opcs_ctl_msff_ctl_macro__width_5 reg_opdhqx_wr_addr  // ASYNC reset active low
                                (
                                        .scan_in(reg_opdhqx_wr_addr_scanin),
                                        .scan_out(reg_opdhqx_wr_addr_scanout),
                                        .dout(opdhqx_wr_addr[4:0]),
                                        .l1clk(l1clk),
                                        .din(opcc_opcs_opdhqx_wr_addr[4:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sio_opcs_ctl_msff_ctl_macro__width_7 reg_opddqx0_wr_addr  // ASYNC reset active low
                                (
                                        .scan_in(reg_opddqx0_wr_addr_scanin),
                                        .scan_out(reg_opddqx0_wr_addr_scanout),
                                        .dout(opddqx0_wr_addr[6:0]),
                                        .l1clk(l1clk),
                                        .din(opcc_opcs_opddqx0_wr_addr[6:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sio_opcs_ctl_msff_ctl_macro__width_7 reg_opddqx1_wr_addr  // ASYNC reset active low
                                (
                                        .scan_in(reg_opddqx1_wr_addr_scanin),
                                        .scan_out(reg_opddqx1_wr_addr_scanout),
                                        .dout(opddqx1_wr_addr[6:0]),
                                        .l1clk(l1clk),
                                        .din(opcc_opcs_opddqx1_wr_addr[6:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sio_opcs_ctl_msff_ctl_macro__width_1 reg_valid  // ASYNC reset active low
                                (
                                        .scan_in(reg_valid_scanin),
                                        .scan_out(reg_valid_scanout),
                                        .dout(valid_r),
                                        .l1clk(l1clk),
                                        .din(valid),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sio_opcs_ctl_msff_ctl_macro__width_1 reg_opdhqx_ue_bit  // ASYNC reset active low
                                (
                                        .scan_in(reg_opdhqx_ue_bit_scanin),
                                        .scan_out(reg_opdhqx_ue_bit_scanout),
                                        .dout(opdhqx_ue_bit_r),
                                        .l1clk(l1clk),
                                        .din(opdhqx_ue_bit),
  .siclk(siclk),
  .soclk(soclk)
                                        );


sio_opcs_ctl_msff_ctl_macro__width_1 reg_hq_almost_r  // ASYNC reset active low
                                (
                                        .scan_in(reg_hq_almost_r_scanin),
                                        .scan_out(reg_hq_almost_r_scanout),
                                        .dout(hq_almost_empty_r),
                                        .l1clk(l1clk),
                                        .din(hq_almost_empty),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sio_opcs_ctl_msff_ctl_macro__width_1 reg_ncu_ctag_ue  // ASYNC reset active low
                                (
                                        .scan_in(reg_ncu_ctag_ue_scanin),
                                        .scan_out(reg_ncu_ctag_ue_scanout),
                                        .dout(opcs_ncu_ctag_ue),
                                        .l1clk(l1clk),
                                        .din(ncu_ctag_ue_l),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sio_opcs_ctl_msff_ctl_macro__width_1 reg_ncu_ctag_ce  // ASYNC reset active low
                                (
                                        .scan_in(reg_ncu_ctag_ce_scanin),
                                        .scan_out(reg_ncu_ctag_ce_scanout),
                                        .dout(opcs_ncu_ctag_ce),
                                        .l1clk(l1clk),
                                        .din(ncu_ctag_ce_l),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sio_opcs_ctl_msff_ctl_macro__width_1 reg_ncu_d_pe  // ASYNC reset active low
                                (
                                        .scan_in(reg_ncu_d_pe_scanin),
                                        .scan_out(reg_ncu_d_pe_scanout),
                                        .dout(opcs_ncu_d_pe),
                                        .l1clk(l1clk),
                                        .din(ncu_d_pe_l),
  .siclk(siclk),
  .soclk(soclk)
                                        );



// fixscan start:
assign spares_scanin             = scan_in                  ;
assign reg_cstate_scanin         = spares_scanout           ;
assign reg_packet_req_scanin     = reg_cstate_scanout       ;
assign reg_packet_datareq_scanin = reg_packet_req_scanout   ;
assign reg_opddqx0_rd_addr_scanin = reg_packet_datareq_scanout;
assign reg_opddqx1_rd_addr_scanin = reg_opddqx0_rd_addr_scanout;
assign reg_opdhqx_rd_addr_scanin = reg_opddqx1_rd_addr_scanout;
assign reg_opcs_opcc_opdhqx_rd_addr_scanin = reg_opdhqx_rd_addr_scanout;
assign reg_crd_cnt_scanin        = reg_opcs_opcc_opdhqx_rd_addr_scanout;
assign reg_opdhqx_wr_addr_scanin = reg_crd_cnt_scanout      ;
assign reg_opddqx0_wr_addr_scanin = reg_opdhqx_wr_addr_scanout;
assign reg_opddqx1_wr_addr_scanin = reg_opddqx0_wr_addr_scanout;
assign reg_valid_scanin          = reg_opddqx1_wr_addr_scanout;
assign reg_opdhqx_ue_bit_scanin  = reg_valid_scanout        ;
assign reg_hq_almost_r_scanin    = reg_opdhqx_ue_bit_scanout;
assign reg_ncu_ctag_ue_scanin    = reg_hq_almost_r_scanout  ;
assign reg_ncu_ctag_ce_scanin    = reg_ncu_ctag_ue_scanout  ;
assign reg_ncu_d_pe_scanin       = reg_ncu_ctag_ce_scanout  ;
assign scan_out                  = reg_ncu_d_pe_scanout     ;
// fixscan end:
endmodule // sio_opcs_ctl







// any PARAMS parms go into naming of macro

module sio_opcs_ctl_l1clkhdr_ctl_macro (
  l2clk, 
  l1en, 
  pce_ov, 
  stop, 
  se, 
  l1clk);


  input l2clk;
  input l1en;
  input pce_ov;
  input stop;
  input se;
  output l1clk;



 

cl_sc1_l1hdr_8x c_0 (


   .l2clk(l2clk),
   .pce(l1en),
   .l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop)
);



endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module sio_opcs_ctl_spare_ctl_macro__num_2 (
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  scan_out);
wire si_0;
wire so_0;
wire spare0_flop_unused;
wire spare0_buf_32x_unused;
wire spare0_nand3_8x_unused;
wire spare0_inv_8x_unused;
wire spare0_aoi22_4x_unused;
wire spare0_buf_8x_unused;
wire spare0_oai22_4x_unused;
wire spare0_inv_16x_unused;
wire spare0_nand2_16x_unused;
wire spare0_nor3_4x_unused;
wire spare0_nand2_8x_unused;
wire spare0_buf_16x_unused;
wire spare0_nor2_16x_unused;
wire spare0_inv_32x_unused;
wire si_1;
wire so_1;
wire spare1_flop_unused;
wire spare1_buf_32x_unused;
wire spare1_nand3_8x_unused;
wire spare1_inv_8x_unused;
wire spare1_aoi22_4x_unused;
wire spare1_buf_8x_unused;
wire spare1_oai22_4x_unused;
wire spare1_inv_16x_unused;
wire spare1_nand2_16x_unused;
wire spare1_nor3_4x_unused;
wire spare1_nand2_8x_unused;
wire spare1_buf_16x_unused;
wire spare1_nor2_16x_unused;
wire spare1_inv_32x_unused;


input		l1clk;
input		scan_in;
input		siclk;
input		soclk;
output		scan_out;

cl_sc1_msff_8x spare0_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_0),
                               .so(so_0),
                               .d(1'b0),
                               .q(spare0_flop_unused));
assign si_0 = scan_in;

cl_u1_buf_32x   spare0_buf_32x (.in(1'b1),
                                   .out(spare0_buf_32x_unused));
cl_u1_nand3_8x spare0_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare0_nand3_8x_unused));
cl_u1_inv_8x    spare0_inv_8x (.in(1'b1),
                                  .out(spare0_inv_8x_unused));
cl_u1_aoi22_4x spare0_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_aoi22_4x_unused));
cl_u1_buf_8x    spare0_buf_8x (.in(1'b1),
                                  .out(spare0_buf_8x_unused));
cl_u1_oai22_4x spare0_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_oai22_4x_unused));
cl_u1_inv_16x   spare0_inv_16x (.in(1'b1),
                                   .out(spare0_inv_16x_unused));
cl_u1_nand2_16x spare0_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare0_nand2_16x_unused));
cl_u1_nor3_4x spare0_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare0_nor3_4x_unused));
cl_u1_nand2_8x spare0_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare0_nand2_8x_unused));
cl_u1_buf_16x   spare0_buf_16x (.in(1'b1),
                                   .out(spare0_buf_16x_unused));
cl_u1_nor2_16x spare0_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare0_nor2_16x_unused));
cl_u1_inv_32x   spare0_inv_32x (.in(1'b1),
                                   .out(spare0_inv_32x_unused));

cl_sc1_msff_8x spare1_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_1),
                               .so(so_1),
                               .d(1'b0),
                               .q(spare1_flop_unused));
assign si_1 = so_0;

cl_u1_buf_32x   spare1_buf_32x (.in(1'b1),
                                   .out(spare1_buf_32x_unused));
cl_u1_nand3_8x spare1_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare1_nand3_8x_unused));
cl_u1_inv_8x    spare1_inv_8x (.in(1'b1),
                                  .out(spare1_inv_8x_unused));
cl_u1_aoi22_4x spare1_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_aoi22_4x_unused));
cl_u1_buf_8x    spare1_buf_8x (.in(1'b1),
                                  .out(spare1_buf_8x_unused));
cl_u1_oai22_4x spare1_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_oai22_4x_unused));
cl_u1_inv_16x   spare1_inv_16x (.in(1'b1),
                                   .out(spare1_inv_16x_unused));
cl_u1_nand2_16x spare1_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare1_nand2_16x_unused));
cl_u1_nor3_4x spare1_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare1_nor3_4x_unused));
cl_u1_nand2_8x spare1_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare1_nand2_8x_unused));
cl_u1_buf_16x   spare1_buf_16x (.in(1'b1),
                                   .out(spare1_buf_16x_unused));
cl_u1_nor2_16x spare1_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare1_nor2_16x_unused));
cl_u1_inv_32x   spare1_inv_32x (.in(1'b1),
                                   .out(spare1_inv_32x_unused));
assign scan_out = so_1;



endmodule






// any PARAMS parms go into naming of macro

module sio_opcs_ctl_msff_ctl_macro__width_8 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = din[7:0];






dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sio_opcs_ctl_msff_ctl_macro__width_1 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0];






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sio_opcs_ctl_msff_ctl_macro__width_7 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [6:0] fdin;
wire [5:0] so;

  input [6:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [6:0] dout;
  output scan_out;
assign fdin[6:0] = din[6:0];






dff #(7)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6:0]),
.si({scan_in,so[5:0]}),
.so({so[5:0],scan_out}),
.q(dout[6:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sio_opcs_ctl_msff_ctl_macro__width_5 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = din[4:0];






dff #(5)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4:0]),
.si({scan_in,so[3:0]}),
.so({so[3:0],scan_out}),
.q(dout[4:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sio_opcs_ctl_msff_ctl_macro__width_3 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = din[2:0];






dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);












endmodule








