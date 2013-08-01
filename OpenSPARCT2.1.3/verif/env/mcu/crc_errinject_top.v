// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: crc_errinject_top.v
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
module  crc_errinject_top(
  fbdimm0a_tx_p_top, fbdimm0a_tx_n_top, fbdimm0a_rx_p_top, fbdimm0a_rx_n_top,
  fbdimm0b_tx_p_top, fbdimm0b_tx_n_top, fbdimm0b_rx_p_top, fbdimm0b_rx_n_top,
  fbdimm1a_tx_p_top, fbdimm1a_tx_n_top, fbdimm1a_rx_p_top, fbdimm1a_rx_n_top,
  fbdimm1b_tx_p_top, fbdimm1b_tx_n_top, fbdimm1b_rx_p_top, fbdimm1b_rx_n_top,
  fbdimm2a_tx_p_top, fbdimm2a_tx_n_top, fbdimm2a_rx_p_top, fbdimm2a_rx_n_top,
  fbdimm2b_tx_p_top, fbdimm2b_tx_n_top, fbdimm2b_rx_p_top, fbdimm2b_rx_n_top,
  fbdimm3a_tx_p_top, fbdimm3a_tx_n_top, fbdimm3a_rx_p_top, fbdimm3a_rx_n_top,
  fbdimm3b_tx_p_top, fbdimm3b_tx_n_top, fbdimm3b_rx_p_top, fbdimm3b_rx_n_top,
  fbd0a_tx_p_top, fbd0a_tx_n_top, fbd0a_rx_p_top, fbd0a_rx_n_top,
  fbd0b_tx_p_top, fbd0b_tx_n_top, fbd0b_rx_p_top, fbd0b_rx_n_top,
  fbd1a_tx_p_top, fbd1a_tx_n_top, fbd1a_rx_p_top, fbd1a_rx_n_top,
  fbd1b_tx_p_top, fbd1b_tx_n_top, fbd1b_rx_p_top, fbd1b_rx_n_top,
  fbd2a_tx_p_top, fbd2a_tx_n_top, fbd2a_rx_p_top, fbd2a_rx_n_top,
  fbd2b_tx_p_top, fbd2b_tx_n_top, fbd2b_rx_p_top, fbd2b_rx_n_top,
  fbd3a_tx_p_top, fbd3a_tx_n_top, fbd3a_rx_p_top, fbd3a_rx_n_top,
  fbd3b_tx_p_top, fbd3b_tx_n_top, fbd3b_rx_p_top, fbd3b_rx_n_top,
  sclk
);

input [9:0]		fbdimm0a_tx_p_top;
input [9:0]		fbdimm0a_tx_n_top;
output [13:0]		fbdimm0a_rx_p_top;
output [13:0]		fbdimm0a_rx_n_top;

input [9:0]		fbdimm0b_tx_p_top;
input [9:0]		fbdimm0b_tx_n_top;
output [13:0]		fbdimm0b_rx_p_top;
output [13:0]		fbdimm0b_rx_n_top;

input [9:0]		fbdimm1a_tx_p_top;
input [9:0]		fbdimm1a_tx_n_top;
output [13:0]		fbdimm1a_rx_p_top;
output [13:0]		fbdimm1a_rx_n_top;

input [9:0]		fbdimm1b_tx_p_top;
input [9:0]		fbdimm1b_tx_n_top;
output [13:0]		fbdimm1b_rx_p_top;
output [13:0]		fbdimm1b_rx_n_top;

input [9:0]		fbdimm2a_tx_p_top;
input [9:0]		fbdimm2a_tx_n_top;
output [13:0]		fbdimm2a_rx_p_top;
output [13:0]		fbdimm2a_rx_n_top;

input [9:0]		fbdimm2b_tx_p_top;
input [9:0]		fbdimm2b_tx_n_top;
output [13:0]		fbdimm2b_rx_p_top;
output [13:0]		fbdimm2b_rx_n_top;

input [9:0]		fbdimm3a_tx_p_top;
input [9:0]		fbdimm3a_tx_n_top;
output [13:0]		fbdimm3a_rx_p_top;
output [13:0]		fbdimm3a_rx_n_top;

input [9:0]		fbdimm3b_tx_p_top;
input [9:0]		fbdimm3b_tx_n_top;
output [13:0]		fbdimm3b_rx_p_top;
output [13:0]		fbdimm3b_rx_n_top;

output [9:0]		fbd0a_tx_p_top;
output [9:0]		fbd0a_tx_n_top;
input [13:0]		fbd0a_rx_p_top;
input [13:0]		fbd0a_rx_n_top;

output [9:0]		fbd0b_tx_p_top;
output [9:0]		fbd0b_tx_n_top;
input [13:0]		fbd0b_rx_p_top;
input [13:0]		fbd0b_rx_n_top;

output [9:0]		fbd1a_tx_p_top;
output [9:0]		fbd1a_tx_n_top;
input [13:0]		fbd1a_rx_p_top;
input [13:0]		fbd1a_rx_n_top;

output [9:0]		fbd1b_tx_p_top;
output [9:0]		fbd1b_tx_n_top;
input [13:0]		fbd1b_rx_p_top;
input [13:0]		fbd1b_rx_n_top;

output [9:0]		fbd2a_tx_p_top;
output [9:0]		fbd2a_tx_n_top;
input [13:0]		fbd2a_rx_p_top;
input [13:0]		fbd2a_rx_n_top;

output [9:0]		fbd2b_tx_p_top;
output [9:0]		fbd2b_tx_n_top;
input [13:0]		fbd2b_rx_p_top;
input [13:0]		fbd2b_rx_n_top;

output [9:0]		fbd3a_tx_p_top;
output [9:0]		fbd3a_tx_n_top;
input [13:0]		fbd3a_rx_p_top;
input [13:0]		fbd3a_rx_n_top;

output [9:0]		fbd3b_tx_p_top;
output [9:0]		fbd3b_tx_n_top;
input [13:0]		fbd3b_rx_p_top;
input [13:0]		fbd3b_rx_n_top;

input			sclk;
reg                     train_seq_err_inj0,train_seq_err_inj1,train_seq_err_inj2,train_seq_err_inj3;

/*
wire			init_done_0 = ~(`MCU0.fbdic.fbdic_l0_state) ;
wire			init_done_1 = ~(`MCU1.fbdic.fbdic_l0_state) ;
wire			init_done_2 = ~(`MCU2.fbdic.fbdic_l0_state) ;
wire			init_done_3 = ~(`MCU3.fbdic.fbdic_l0_state) ;
*/


initial
begin

train_seq_err_inj0 = 0;
train_seq_err_inj1 = 0;
train_seq_err_inj2 = 0;
train_seq_err_inj3 = 0;

    if ($test$plusargs("MCU0_TRAINING_SEQ_ERR"))
	begin
	`PR_ALWAYS("crc_err", `ALWAYS, "MCU0:  ENTERED INJECTION FOR TRAINING SEQUENCE");
	train_seq_err_inj0 = 1;
	end
     else     if ($test$plusargs("MCU1_TRAINING_SEQ_ERR"))
	begin
	`PR_ALWAYS("crc_err", `ALWAYS, " MCU1: ENTERED INJECTION FOR TRAINING SEQUENCE");
	train_seq_err_inj1 = 1;
	end
     else     if ($test$plusargs("MCU2_TRAINING_SEQ_ERR"))
	begin
	`PR_ALWAYS("crc_err", `ALWAYS, "MCU2:  ENTERED INJECTION FOR TRAINING SEQUENCE");
	train_seq_err_inj2 = 1;
	end
    else     if ($test$plusargs("MCU3_TRAINING_SEQ_ERR"))
	begin
	`PR_ALWAYS("crc_err", `ALWAYS, " MCU3: ENTERED INJECTION FOR TRAINING SEQUENCE");
	train_seq_err_inj3 = 1;
	end

end // end of initial block

`ifdef MCU_GATE
wire   init_done_0 = ~(train_seq_err_inj0 ? (1) : (`MCU0.fbdic__n15588)) ;
wire   init_done_1 = ~(train_seq_err_inj1 ? (1) : (`MCU1.fbdic__n15588)) ;
wire   init_done_2 = ~(train_seq_err_inj2 ? (1) : (`MCU2.fbdic__n15588)) ;
wire   init_done_3 = ~(train_seq_err_inj3 ? (1) : (`MCU3.fbdic__n15588)) ;
`else
wire   init_done_0 = ~(train_seq_err_inj0 ? (1) : (`MCU0.fbdic.fbdic_l0_state)) ;
wire   init_done_1 = ~(train_seq_err_inj1 ? (1) : (`MCU1.fbdic.fbdic_l0_state)) ;
wire   init_done_2 = ~(train_seq_err_inj2 ? (1) : (`MCU2.fbdic.fbdic_l0_state)) ;
wire   init_done_3 = ~(train_seq_err_inj3 ? (1) : (`MCU3.fbdic.fbdic_l0_state)) ;
`endif // mcu_gate




//-----------------------------------
// NB CRC Error Injectors
//-----------------------------------

nb_crc_error_injector nb_crc_errinj0a_p (
  .pn_in		(fbd0a_rx_p_top[13:0]),
  .pn_out		(fbdimm0a_rx_p_top[13:0]),
  .init			(init_done_0),
  .sclk			(sclk)
);

nb_crc_error_injector nb_crc_errinj0a_n (
  .pn_in		(fbd0a_rx_n_top[13:0]),
  .pn_out		(fbdimm0a_rx_n_top[13:0]),
  .init			(init_done_0),
  .sclk			(sclk)
);

nb_crc_error_injector nb_crc_errinj0b_p (
  .pn_in		(fbd0b_rx_p_top[13:0]),
  .pn_out		(fbdimm0b_rx_p_top[13:0]),
  .init			(init_done_0),
  .sclk			(sclk)
);

nb_crc_error_injector nb_crc_errinj0b_n (
  .pn_in		(fbd0b_rx_n_top[13:0]),
  .pn_out		(fbdimm0b_rx_n_top[13:0]),
  .init			(init_done_0),
  .sclk			(sclk)
);

nb_crc_error_injector nb_crc_errinj1a_p (
  .pn_in		(fbd1a_rx_p_top[13:0]),
  .pn_out		(fbdimm1a_rx_p_top[13:0]),
  .init			(init_done_1),
  .sclk			(sclk)
);

nb_crc_error_injector nb_crc_errinj1a_n (
  .pn_in		(fbd1a_rx_n_top[13:0]),
  .pn_out		(fbdimm1a_rx_n_top[13:0]),
  .init			(init_done_1),
  .sclk			(sclk)
);

nb_crc_error_injector nb_crc_errinj1b_p (
  .pn_in		(fbd1b_rx_p_top[13:0]),
  .pn_out		(fbdimm1b_rx_p_top[13:0]),
  .init			(init_done_1),
  .sclk			(sclk)
);

nb_crc_error_injector nb_crc_errinj1b_n (
  .pn_in		(fbd1b_rx_n_top[13:0]),
  .pn_out		(fbdimm1b_rx_n_top[13:0]),
  .init			(init_done_1),
  .sclk			(sclk)
);

nb_crc_error_injector nb_crc_errinj2a_p (
  .pn_in		(fbd2a_rx_p_top[13:0]),
  .pn_out		(fbdimm2a_rx_p_top[13:0]),
  .init			(init_done_2),
  .sclk			(sclk)
);

nb_crc_error_injector nb_crc_errinj2a_n (
  .pn_in		(fbd2a_rx_n_top[13:0]),
  .pn_out		(fbdimm2a_rx_n_top[13:0]),
  .init			(init_done_2),
  .sclk			(sclk)
);

nb_crc_error_injector nb_crc_errinj2b_p (
  .pn_in		(fbd2b_rx_p_top[13:0]),
  .pn_out		(fbdimm2b_rx_p_top[13:0]),
  .init			(init_done_2),
  .sclk			(sclk)
);

nb_crc_error_injector nb_crc_errinj2b_n (
  .pn_in		(fbd2b_rx_n_top[13:0]),
  .pn_out		(fbdimm2b_rx_n_top[13:0]),
  .init			(init_done_2),
  .sclk			(sclk)
);

nb_crc_error_injector nb_crc_errinj3a_p (
  .pn_in		(fbd3a_rx_p_top[13:0]),
  .pn_out		(fbdimm3a_rx_p_top[13:0]),
  .init			(init_done_3),
  .sclk			(sclk)
);

nb_crc_error_injector nb_crc_errinj3a_n (
  .pn_in		(fbd3a_rx_n_top[13:0]),
  .pn_out		(fbdimm3a_rx_n_top[13:0]),
  .init			(init_done_3),
  .sclk			(sclk)
);

nb_crc_error_injector nb_crc_errinj3b_p (
  .pn_in		(fbd3b_rx_p_top[13:0]),
  .pn_out		(fbdimm3b_rx_p_top[13:0]),
  .init			(init_done_3),
  .sclk			(sclk)
);

nb_crc_error_injector nb_crc_errinj3b_n (
  .pn_in		(fbd3b_rx_n_top[13:0]),
  .pn_out		(fbdimm3b_rx_n_top[13:0]),
  .init			(init_done_3),
  .sclk			(sclk)
);

//------------------------
// SB CRC Error Injectors
//------------------------

sb_crc_error_injector sb_crc_errinj0a_p (
  .ps_in		(fbdimm0a_tx_p_top[9:0]),
  .ps_out		(fbd0a_tx_p_top[9:0]),
  .init			(init_done_0),
  .is_bar		(1'b0),
  .link_clk		(sclk)
);

sb_crc_error_injector sb_crc_errinj0a_n (
  .ps_in		(fbdimm0a_tx_n_top[9:0]),
  .ps_out		(fbd0a_tx_n_top[9:0]),
  .init			(init_done_0),
  .is_bar		(1'b1),
  .link_clk		(sclk)
);

sb_crc_error_injector sb_crc_errinj0b_p (
  .ps_in		(fbdimm0b_tx_p_top[9:0]),
  .ps_out		(fbd0b_tx_p_top[9:0]),
  .init			(init_done_0),
  .is_bar		(1'b0),
  .link_clk		(sclk)
);

sb_crc_error_injector sb_crc_errinj0b_n (
  .ps_in		(fbdimm0b_tx_n_top[9:0]),
  .ps_out		(fbd0b_tx_n_top[9:0]),
  .init			(init_done_0),
  .is_bar		(1'b1),
  .link_clk		(sclk)
);

sb_crc_error_injector sb_crc_errinj1a_p (
  .ps_in		(fbdimm1a_tx_p_top[9:0]),
  .ps_out		(fbd1a_tx_p_top[9:0]),
  .init			(init_done_1),
  .is_bar		(1'b0),
  .link_clk		(sclk)
);

sb_crc_error_injector sb_crc_errinj1a_n (
  .ps_in		(fbdimm1a_tx_n_top[9:0]),
  .ps_out		(fbd1a_tx_n_top[9:0]),
  .init			(init_done_1),
  .is_bar		(1'b1),
  .link_clk		(sclk)
);

sb_crc_error_injector sb_crc_errinj1b_p (
  .ps_in		(fbdimm1b_tx_p_top[9:0]),
  .ps_out		(fbd1b_tx_p_top[9:0]),
  .init			(init_done_1),
  .is_bar		(1'b0),
  .link_clk		(sclk)
);

sb_crc_error_injector sb_crc_errinj1b_n (
  .ps_in		(fbdimm1b_tx_n_top[9:0]),
  .ps_out		(fbd1b_tx_n_top[9:0]),
  .init			(init_done_1),
  .is_bar		(1'b1),
  .link_clk		(sclk)
);

sb_crc_error_injector sb_crc_errinj2a_p (
  .ps_in		(fbdimm2a_tx_p_top[9:0]),
  .ps_out		(fbd2a_tx_p_top[9:0]),
  .init			(init_done_2),
  .is_bar		(1'b0),
  .link_clk		(sclk)
);

sb_crc_error_injector sb_crc_errinj2a_n (
  .ps_in		(fbdimm2a_tx_n_top[9:0]),
  .ps_out		(fbd2a_tx_n_top[9:0]),
  .init			(init_done_2),
  .is_bar		(1'b1),
  .link_clk		(sclk)
);

sb_crc_error_injector sb_crc_errinj2b_p (
  .ps_in		(fbdimm2b_tx_p_top[9:0]),
  .ps_out		(fbd2b_tx_p_top[9:0]),
  .init			(init_done_2),
  .is_bar		(1'b0),
  .link_clk		(sclk)
);

sb_crc_error_injector sb_crc_errinj2b_n (
  .ps_in		(fbdimm2b_tx_n_top[9:0]),
  .ps_out		(fbd2b_tx_n_top[9:0]),
  .init			(init_done_2),
  .is_bar		(1'b1),
  .link_clk		(sclk)
);

sb_crc_error_injector sb_crc_errinj3a_p (
  .ps_in		(fbdimm3a_tx_p_top[9:0]),
  .ps_out		(fbd3a_tx_p_top[9:0]),
  .init			(init_done_3),
  .is_bar		(1'b0),
  .link_clk		(sclk)
);

sb_crc_error_injector sb_crc_errinj3a_n (
  .ps_in		(fbdimm3a_tx_n_top[9:0]),
  .ps_out		(fbd3a_tx_n_top[9:0]),
  .init			(init_done_3),
  .is_bar		(1'b1),
  .link_clk		(sclk)
);

sb_crc_error_injector sb_crc_errinj3b_p (
  .ps_in		(fbdimm3b_tx_p_top[9:0]),
  .ps_out		(fbd3b_tx_p_top[9:0]),
  .init			(init_done_3),
  .is_bar		(1'b0),
  .link_clk		(sclk)
);

sb_crc_error_injector sb_crc_errinj3b_n (
  .ps_in		(fbdimm3b_tx_n_top[9:0]),
  .ps_out		(fbd3b_tx_n_top[9:0]),
  .init			(init_done_3),
  .is_bar		(1'b1),
  .link_clk		(sclk)
);

endmodule
