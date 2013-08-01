// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcs_slave.v
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
// @(#)pcs_slave.v	1.10G
/**********************************************************************/
/* Project Name  :  CASSINI                                           */
/* Module Name   :  PCS Slave Interface                               */
/* Description   :  This module contains the decoder for the registers*/
/*		    programmable through the PCI slave interface.     */
/*		    The configuration register, the state machine     */
/*		    register, the PCS MII Configuration register,     */
/*		    the PCS MII Status register, the PCS MII 	      */
/*		    Advertisement register, the PCS MII Link Partner  */
/*		    Ability register, the PHY Datapath Mode register  */
/*		    the Serialink Control register, and the Shared    */
/*		    Output Select register are stored in this module. */
/*    								      */
/*    		    The PHY Datapath Mode, Serialink Control, and     */
/*		    Shared Output Select registers are not used by    */
/*		    the PCS, but pass on to the PHY Datapath block    */
/*		    Serialink Control blocks.  They are not affected  */
/*		    by PCS SW reset.	 			      */
/*    								      */
/*		    The Advertisement registers should not be written */
/*		    unless PCS is disabled. 			      */
/*    								      */
/*		    Read/Write Registers available through PIO are:   */
/*			o PCS Configuration Register		      */
/*			o PCS MII Configuration Register	      */
/*			o PCS MII Advertisement Register	      */
/*			o PHY Datapath Mode Register		      */
/*			o Serialink Control Register		      */
/*			o Shared Output Select Register		      */
/*		    Read Only Registers available through PIO are:    */
/*			o PCS State Machine Register		      */
/*			o PCS MII Status Register		      */
/*			o PCS MII Link Partner Ability Register	      */
/*			o SERDES control state Register		      */
/*			o Packet Counter			      */
/*    								      */
/* Assumptions   :  A PCS PIO select is going to come from the SEB    */
/*		    block.  This does the initial decode to determine */
/*		    that the PIO access falls into the Rx register    */
/*		    space.					      */
/*    								      */
/* Parent module :  pcs.v	                                      */
/* Child modules :  none                                              */
/* Author Name   : Linda Chen                                         */
/* Date Created  : 10/25/96                                           */
/*                                                                    */
/*              Copyright (c) 1994, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */ 
/* Modifications : 4/21/98 - added link_not_up_diag_tx bits, added    */
/*		rx and tx packet counters.			      */
/*		8/6/98 						      */
/*		- addition of 5 link diagnostic bits for 	      */
/*		  why link is not coming up.			      */
/*		- addition of packets transmitted and received 	      */
/*		  counters, available to read through PIO	      */
/*		- make the ack bit readable from the Advertisement    */
/*		  register					      */
/*		- remove the Serialink specific control bits	      */
/*		- make the loopback bit to external serdes active high*/
/*		- remove the wrapback bit from MII Config	      */
/*		- make the signal_detect override bit non-resettable  */
/*		- remove the tx output enable bit and serialink       */
/*		  enable bit from the phy_dpath register	      */
/*								      */
/* Synthesis Notes : none yet                                         */
/**********************************************************************/

`include  "pcs_define.h"

module pcs_slave (
                  clk,pio_core_reset,pio_core_sel,pio_rd_wr, // inputs
		  pio_addr,pio_wr_data,link_up_tx,link_partner_rx,
		  rx_state_rx,tx_state_tx,word_state_rx,seq_state_rx,
		  link_state_tx,reset_tx,reset_rx,
		  res_auto_tx,slink_state,
		  signal_detect_optic,lost_link_tx,
		  set_lol_from_los_tx,set_lol_from_c_tx,
		  rx_pkt_cnt_rx,tx_pkt_cnt_tx,link_not_up_diag_tx,
		  ack,

		  link_up_filter_en,pio_err,pio_core_ack,pio_rd_data,// outputs
		  res_auto_pci,col_test_pci,
		  adver_reg,reset_pci,enable_pci,
		  autoneg_ena_pci,sw_ensyncdet,sw_lockref,
		  phy_mode,shared_sel,
		  pcs_int,ewrap,signal_detect_pci,jitter_study_pci,
		  timer_override_pci,lost_link_pci,
		  set_lol_from_los_pci,set_lol_from_c_pci);
	

input 		clk;		// PCI clock 33 or 66 MHz
input 		pio_core_reset;	// global hw reset, synchronous to pci clock
input 		pio_core_sel;	// pio select for pcs
input 		pio_rd_wr;		// pio read signal
input [6:0] 	pio_addr;	// pio address - register memory map	
input [17:0] 	pio_wr_data;	// pio data in

input		link_up_tx;	// link status from tx clock domain
input [15:0]	link_partner_rx;// link partner ability from rx clock 
input [2:0]	rx_state_rx;	// rx control state in rx clock domain
input [3:0]	tx_state_tx;	// tx control state in tx clock domain
input [2:0]	word_state_rx;	// word synchronizatoin state, rx clock domain
input [1:0]	seq_state_rx;	// sequencer state , rx clock domain
input [3:0]	link_state_tx;	// Link Configuration state, tx clock domain
input		reset_tx;	// used to clear reset bit
input		reset_rx;	// used to clear reset bit		
input		res_auto_tx;	// used to clear restart autonegotiation bit
input [1:0]	slink_state;	// serdes control block state bits
input		signal_detect_optic; // signal detect raw from the optic
input		lost_link_tx;	// used to set link_status
input  		set_lol_from_los_tx;    // sets diag bit for why link was lost
input  		set_lol_from_c_tx;      // sets diag bit for why link was lost
input [10:0]	rx_pkt_cnt_rx;	// receive packet count
input [10:0]	tx_pkt_cnt_tx;	// transmit packet count
input [5:0]	link_not_up_diag_tx; // diagnostic bits		
input		ack;		// ack bit for adver reg

output          link_up_filter_en;
output          pio_err;
output 		pio_core_ack;	// pio acknowledge
output [31:0] 	pio_rd_data;	// pio read data out

output		res_auto_pci; 	// restart link configuration
output		col_test_pci;	// collision test, pci clock domain 
output [12:0]	adver_reg;	// advertisement of capabilities
output		reset_pci;	// hw and sw reset	
output		enable_pci;	// PCS enable, otherwise looks like link down
output		autoneg_ena_pci;// autonegotiation enable 	
output 		sw_lockref;	// sw override for lockref
output 		sw_ensyncdet;	// sw override for ensyncdet
output		ewrap;		// loopback enable for external serdes
output 		phy_mode;	// selects network i/f, to phy dpath block
output [2:0]	shared_sel;	// used as a select for shared output pins
output		pcs_int;	// pcs link up interrupt
output		signal_detect_pci; // active high post processed version of 
				// signal_detect_optic
output [1:0]	jitter_study_pci;// select for tx datapath output mux
output		timer_override_pci;// to autoneg to shorten length of bringup	
output		lost_link_pci;	// used to clear lost_link_tx flag
output		set_lol_from_los_pci;  // used to clear set in link config
output		set_lol_from_c_pci;    // used to clear set in link config

wire            hw_reset   ;    // register version of pio_core_reset. -loj 4/4/02
wire		write_pulse;	// decoded the event of pio write,no err
wire		read_pulse;	// decoded the event of pio read
wire 		link_up_pci;	// synchronized version of link_up_tx
wire 		link_up_pci_d;	// synchronized version of link_up_tx, delayed
wire		sw_reset;	// software reset from MII config register
wire		nxt_sw_reset;	// stays high until reset comes back from tx/rx
wire		set_reset;	// set software reset
wire		our_fault;  	// remote fault (partner sees no light)
wire		set_our_fault;	// set our remote fault bit for MII status
wire		nxt_our_fault;  // remote fault (partner sees no light)
wire [1:0]	link_partner_bit1312; // our rem fault bit, partner sees no lt.
wire		clr_status;	// read of status by pio
wire		set_link_status;// detect condition of link down
wire		link_status;	// part of MII status register (link is down)
wire		nxt_link_status;// part of MII status register (link is down)
wire		set_res_auto;	// pulse for restart autonegotiation
wire		clr_res_auto;	// clr upon read for autonegotiation restart
wire		res_auto_pci;	// restart autoneg signal, to link config
wire		nxt_res_auto_pci;// restart autoneg signal, to link config
wire [16:0]	state_bits_pci;	// state bits synchronized	
wire		auto_complete;	// autonegotiation complete
reg		reset_pci;	// hw and sw reset for PCS
wire		core_sel_d;	// delayed version of core sel, wait for 
wire		core_sel_dd;	// arrival of perr_slv to generate write pulse
wire		clr_reset_t;	// synchronized from tx to pci time domain
wire		clr_reset_r;	// synchronized from rx to pci time domain
wire		set_pcs_int;	// pcs set upon link change
wire		clr_pcs_int;	// pcs clear upon read of register
wire		nxt_pcs_int;	// pcs link change interrupt
wire            pcs_mask;       // pcs global interrupt mask bit.
wire		pio_core_sel_d; // delayed one cycle for timing
wire [1:0]	slink_state_pci;// synchronized version of serdes control state
wire [15:0] 	link_partner_pci;// synchronized version of link_partner_rx
wire		sig_det_polarity_change; // if high indicates signal_detect_optic 
				// should be interpreted as active low
wire		sig_det_override;// indicates that signal_detect should not affect
				// the link
wire		signal_detect_optic_pci; // signal_detect raw from optic 
				// synchronized to pci clock domain
wire		autoneg_ena_pci_d; // to detect change 
wire		an_ena_change;	// to detect changein autonegotiation enable 
wire		read_state;	// read pulse for state machine register,
				// clears 3 diag bits
wire		nxt_lost_sig_det;   // used for loss of link diag
wire	 	nxt_lol_from_los;   // used for loss of link diag
wire		nxt_lol_from_c;	    // used for loss of link diag
wire		lost_sig_det;       // used for loss of link diag
wire	 	lol_from_los;       // used for loss of link diag
wire		lol_from_c;	    // used for loss of link diag
wire		set_lost_sig_det;   // used for loss of link diag
wire		signal_detect_pci_d;// used for loss of link diag
wire [21:0]	pkt_cnt;	    // used for link not up diag
wire [5:0]	link_not_up_diag_pci;// synchronized to pci clock domain
wire [6:0]	pio_addr_d;	    // for timing 
wire 		pio_rd_wr_d;	    // for timing
wire [31:0]	pio_rd_data;	// to SEB
wire [17:0] 	pio_wr_data;
// vlint flag_net_has_no_load            off
// vlint flag_dangling_net_within_module off
wire [17:0] 	slv_write_data;
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load            on
reg [31:0] 	rd_data;
reg [12:0]	adver_reg;	// advertisement config reg	
reg		autoneg_ena_pci;// autnegotation enable bit in MII config
reg		ewrap;		// ser_ctrl to serdes directly for loopback
reg		sw_lockref;	// ser_ctrl to slink_ctrl
reg		sw_ensyncdet;	// ser_ctrl to slink_ctrl
reg 		pio_err;
wire 	        pio_core_ack;
wire    	pio_core_ack_p1;
   
   
/*
** PIO generic decode
** The decode is same for read and write
** These signals are used to control the output mux for pio_rd_data
*/
wire gen_sel_MII_conf = pio_core_sel_d & (pio_addr_d == `PHY_PIO_MII_CONF);
wire gen_sel_MII_status = pio_core_sel_d & (pio_addr_d == `PHY_PIO_MII_STAT);
wire gen_sel_MII_adver = pio_core_sel_d & (pio_addr_d == `PHY_PIO_MII_ADVER);
wire gen_sel_MII_partn = pio_core_sel_d & (pio_addr_d == `PHY_PIO_MII_PARTNER);
wire gen_sel_conf = pio_core_sel_d & (pio_addr_d == `PHY_PIO_CONF_REG);
wire gen_sel_state = pio_core_sel_d & (pio_addr_d == `PHY_PIO_STATE);
wire gen_sel_dpath = pio_core_sel_d & (pio_addr_d == `PHY_PIO_DPATH_MODE);
wire gen_sel_serctrl = pio_core_sel_d & (pio_addr_d == `PHY_PIO_SER_CTRL);
wire gen_sel_shared = pio_core_sel_d & (pio_addr_d == `PHY_PIO_SHARED);
wire gen_sel_pcs_int = pio_core_sel_d & (pio_addr_d == `PHY_PIO_INTERRUPT);
wire gen_sel_ser_state = pio_core_sel_d & (pio_addr_d == `PHY_PIO_SER_STATE);
wire gen_sel_pkt_cnt = pio_core_sel_d & (pio_addr_d == `PHY_PIO_PKT_CNT);

// register pio_err   
always @ (posedge clk)
  begin
   pio_err <= pio_core_ack_p1 &  // equivalent of addr_err = non_qualified_addr_err & pio_core_sel_d
  ~(gen_sel_MII_conf |
    gen_sel_MII_status |
    gen_sel_MII_adver |
    gen_sel_MII_partn |
    gen_sel_conf |
    gen_sel_state |
    gen_sel_dpath |
    gen_sel_serctrl |
    gen_sel_shared |
    gen_sel_pcs_int |
    gen_sel_ser_state |
    gen_sel_pkt_cnt);
  end
   
   
/*
** PIO write selects
*/
wire pio_sel_MII_conf = gen_sel_MII_conf & write_pulse;
wire pio_sel_MII_adver = gen_sel_MII_adver & write_pulse;
wire pio_sel_conf = gen_sel_conf & write_pulse;
wire pio_sel_dpath = gen_sel_dpath & write_pulse;
wire pio_sel_serctrl = gen_sel_serctrl & write_pulse;
wire pio_sel_shared = gen_sel_shared & write_pulse;
wire [1:0] phy_mode_ext; // all bits of the phy mode so sw can read it back

RegDff #(1) hpio_core_ack_RegDff  (.din(pio_core_ack_p1),.clk(clk),
                                  .qout(pio_core_ack));

assign	pio_core_ack_p1 = core_sel_d  & ~core_sel_dd,       
       	write_pulse = pio_core_ack_p1 & ~pio_rd_wr_d,
       	read_pulse =  pio_core_ack_p1 & pio_rd_wr_d,

	set_reset = pio_sel_MII_conf & slv_write_data[15],
	nxt_sw_reset = (hw_reset|set_reset) ? 1'h1 : 
	(clr_reset_t & clr_reset_r) ?  1'h0 : sw_reset,
       	set_res_auto = pio_sel_MII_conf & slv_write_data[9],
	/*
	** Standard specifies that restart an should occur
	** upon change of autoneg enable, or when restart 
	** autoneg is set along with autoneg enable.
	*/
	nxt_res_auto_pci = (reset_pci) ? 1'b0 : 
		((set_res_auto & autoneg_ena_pci)|(an_ena_change)) ? 1'b1 : 
		(clr_res_auto) ? 1'b0 : res_auto_pci,
	an_ena_change = (autoneg_ena_pci & ~autoneg_ena_pci_d) |
		 (~autoneg_ena_pci & autoneg_ena_pci_d ),
	set_link_status = (lost_link_pci | res_auto_pci), // detect link down
       	clr_status = read_pulse & gen_sel_MII_status,
	set_pcs_int = (~link_up_pci & link_up_pci_d) | 	// link going down
			(link_up_pci & ~link_up_pci_d), // link going up
        clr_pcs_int = read_pulse & gen_sel_pcs_int,
	nxt_pcs_int = (set_pcs_int) ? 1'h1 : 
		(clr_pcs_int) ? 1'h0 : pcs_int,
	nxt_link_status = (set_link_status)? 1'h0 : 
		(reset_pci | clr_status) ? link_up_pci : link_status,	
	auto_complete = link_up_pci & autoneg_ena_pci,
	set_our_fault = (|link_partner_bit1312) & link_up_pci,
	nxt_our_fault = (reset_pci)? 1'h0 : (set_our_fault)? 1'h1 : 
		(clr_status)? 1'h0 : our_fault,
	phy_mode          = phy_mode_ext[1], // don't need to pass lsb
	link_up_filter_en = phy_mode_ext[0],
/*
** Signal_detect needs to be held at 1 during loopback since 
** the optic is not operational during those modes.
** In external serdes mode, the sig_det_override should be programmed 
** to "1".  For slink mode loopbacks automatically override sig_det.
*/
	signal_detect_pci = (sig_det_override|ewrap)? 1'h1 : 
		(sig_det_polarity_change) ? ~signal_detect_optic_pci : 
		signal_detect_optic_pci,
	set_lost_sig_det = ~signal_detect_pci & signal_detect_pci_d,
        read_state = read_pulse & gen_sel_state,
	nxt_lost_sig_det = (reset_pci) ? 1'h0 : (set_lost_sig_det)? 1'h1:
		(read_state)? 1'h0 : lost_sig_det,
	nxt_lol_from_los = (reset_pci) ? 1'h0 : (set_lol_from_los_pci)? 1'h1:
		(read_state)? 1'h0 : lol_from_los,
	nxt_lol_from_c = (reset_pci) ? 1'h0 : (set_lol_from_c_pci)? 1'h1:
		(read_state)? 1'h0 : lol_from_c;

always @ (posedge clk)
  reset_pci <= hw_reset | sw_reset;
   

always@(posedge clk)
  begin
     if (reset_pci)
	autoneg_ena_pci <= 1'h1;	// default is one
     else if (pio_sel_MII_conf)
	autoneg_ena_pci <= slv_write_data[12];
     else
	autoneg_ena_pci <= autoneg_ena_pci;
  end

/*
** Advertisement Register (what we advertise)
*/
always @(posedge clk)
  begin
    if (reset_pci)
	adver_reg <= 13'he0;	// pause bits, duplex bits on
    else if (pio_sel_MII_adver)
	adver_reg <= {slv_write_data[13],slv_write_data[11:0]};
    else
	adver_reg <= adver_reg;
  end

/*
** Serdes Control Register 
*/

//summit modcovoff -bpe
always @(posedge clk)
  begin
    if (hw_reset)
	begin
	  ewrap <= 1'h0;	
	  sw_lockref <= 1'h0;
	  sw_ensyncdet <= 1'h0;
        end
    else if (pio_sel_serctrl)
	begin
	  ewrap <= slv_write_data[0];	
	  sw_ensyncdet <= slv_write_data[1];
	  sw_lockref <= slv_write_data[2];
        end
    else 
	begin
          ewrap <= ewrap;
          sw_ensyncdet <= sw_ensyncdet;
          sw_lockref <= sw_lockref;
	end
  end
//summit modcovon -bpe 

/*
** PIO Data out Muxd register
*/
always @(ack or adver_reg or auto_complete
	 or autoneg_ena_pci or col_test_pci or enable_pci or ewrap
	 or gen_sel_MII_adver or gen_sel_MII_conf or gen_sel_MII_partn
	 or gen_sel_MII_status or gen_sel_conf or gen_sel_dpath
	 or gen_sel_pcs_int or gen_sel_pkt_cnt or gen_sel_ser_state
	 or gen_sel_serctrl or gen_sel_shared or gen_sel_state
	 or jitter_study_pci or link_not_up_diag_pci
	 or link_partner_pci or link_status or lol_from_c
	 or lol_from_los or lost_sig_det or our_fault or pcs_int
	 or pcs_mask or phy_mode_ext or pkt_cnt or res_auto_pci
	 or shared_sel or sig_det_override or sig_det_polarity_change
	 or slink_state_pci or state_bits_pci or sw_ensyncdet
	 or sw_lockref or sw_reset or timer_override_pci)
  begin
     	casez({gen_sel_pkt_cnt,gen_sel_ser_state,gen_sel_pcs_int,
	gen_sel_MII_conf,gen_sel_MII_status,gen_sel_MII_adver,
	gen_sel_MII_partn,gen_sel_conf,gen_sel_state,
	gen_sel_dpath,gen_sel_serctrl,gen_sel_shared}) 
        12'b1???_????_????:  // Packet counter
	        rd_data = {5'b0,pkt_cnt[21:11],5'b0,pkt_cnt[10:0]};
        12'b01??_????_????:  // Serdes Control State/home/ Register
	        rd_data = {30'b0,slink_state_pci};
        12'b001?_????_????:  // Interrupt Register
	        rd_data = {29'b0,pcs_int,2'b0};
        12'b0001_????_????:  // MII configuration 
	        rd_data = {16'b0,sw_reset,2'b0,autoneg_ena_pci,
			2'h0,res_auto_pci,1'b0,col_test_pci,1'h1,6'h0};
        12'b0000_1???_????:  // MII status 
	        rd_data = {23'h0,1'h1,2'h0,auto_complete,our_fault,1'b1,
			link_status,2'b0};
        12'b0000_01??_????:  // MII advertisement 
	        rd_data = {17'h0,ack,adver_reg[12],1'b0,
				adver_reg[11:0]};
        12'b0000_001?_????:  // MII link partner ability
	        rd_data = {16'h0,link_partner_pci};
        12'b0000_0001_????:  // Configuration 
	        rd_data = {25'h0,pcs_mask,timer_override_pci,jitter_study_pci,
		sig_det_polarity_change,sig_det_override,enable_pci};
        12'b0000_0000_1???:  // State & Diag
	        rd_data = {2'b0,link_not_up_diag_pci,1'h0,lost_sig_det,
		  	  lol_from_los,lol_from_c,3'h0,state_bits_pci};
        12'b0000_0000_01??:  // Datapath mode 
	        rd_data = {30'h0,phy_mode_ext};
        12'b0000_0000_001?:  // Serialink Control
	        rd_data = {29'h0,sw_lockref,sw_ensyncdet,ewrap};
        12'b0000_0000_0001:  // Shared output
	        rd_data = {29'h0,shared_sel};
        12'b0000_0000_0000:  // default
	        rd_data = {32'hdead_beef};
        default:rd_data = {32'hdead_beef};
      endcase
  end // always @ (...
   

  // register pio outputs
RegDff #(32) pio_rd_data_RegDff  (.din(rd_data[31:0]),.clk(clk),.qout(pio_rd_data[31:0]));
/*
** Registers
*/
  // register pio inputs
RegDff #(18) slv_write_data_RegDff  (.din(pio_wr_data[17:0]),.clk(clk),.qout(slv_write_data[17:0]));
RegDff #(1) hw_reset_RegDff  (.din(pio_core_reset),.clk(clk),.qout(hw_reset));
REG #(1) r_core_sel_d  (core_sel_d, clk,pio_core_sel);// wait a cycle for wrst 
REG #(1) r_core_sel_dd (core_sel_dd,clk,core_sel_d );  // case perror arrival
REG #(1) r_pio_core_sel_d (pio_core_sel_d,clk,pio_core_sel); // for timing
REG #(1) r_lost_sig_det (lost_sig_det,clk,nxt_lost_sig_det);
REG #(1) r_lol_from_los (lol_from_los,clk,nxt_lol_from_los);
REG #(1) r_lol_from_c (lol_from_c,clk,nxt_lol_from_c);
REG #(1) r_sd_d (signal_detect_pci_d,clk,signal_detect_pci);
REG #(1) r_pio_rd_wr_d (pio_rd_wr_d,clk,pio_rd_wr);
REG #(7) r_pio_addr_d (pio_addr_d,clk,pio_addr);

// SYNCREG (qout, clk, din);
SYNCREG r_link_up_pci(link_up_pci,clk,link_up_tx);
SYNCREG17 r_state_bits (state_bits_pci,clk,	{link_state_tx,
		seq_state_rx,word_state_rx,1'b0,rx_state_rx,tx_state_tx});
SYNCREG r_rem_fault13(link_partner_bit1312[1],clk,link_partner_rx[13]);
SYNCREG r_rem_fault12(link_partner_bit1312[0],clk,link_partner_rx[12]);
SYNCREG r_clr_reset_t(clr_reset_t,clk,reset_tx);
SYNCREG r_clr_reset_r(clr_reset_r,clk,reset_rx);
SYNCREG16  r_link_part_pci(link_partner_pci,clk,link_partner_rx);
SYNCREG r_ser_state1(slink_state_pci[1],clk,slink_state[1]);
SYNCREG r_ser_state0(slink_state_pci[0],clk,slink_state[0]);
SYNCREG r_lost_link(lost_link_pci,clk,lost_link_tx);
SYNCREG22 r_pkt_cnt(pkt_cnt,clk,{rx_pkt_cnt_rx,tx_pkt_cnt_tx});

SRREG #(1) r_col_test (col_test_pci,clk,pio_sel_MII_conf,reset_pci,
		slv_write_data[7]);

//SRREG #(6) r_pcs_config ({pcs_mask,timer_override_pci,jitter_study_pci,
//		sig_det_polarity_change,enable_pci},
//		clk,pio_sel_conf,reset_pci,{slv_write_data[6:2],slv_write_data[0]});
// vlint flag_net_has_no_load            off
// vlint flag_dangling_net_within_module off
   wire reserve1;
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load            on
   
xREG2 #(7) pcs_config_xREG2 (.clk(clk), 
                      .reset(reset_pci),
                      .reset_value(7'b100_0000),
                      .load(pio_sel_conf), 
                      .din(slv_write_data[6:0]), 
                      .qout({pcs_mask,timer_override_pci,jitter_study_pci[1:0],
    		sig_det_polarity_change,reserve1,enable_pci}));
   
EREG #(1) r_sig_det_override (sig_det_override,clk,pio_sel_conf,
		slv_write_data[1]); // non-resetable

//EREG (qout, clk, en, din);
//EREG #(2) r_phymode (phy_mode_ext,clk,pio_sel_dpath,
//		slv_write_data[1:0]);
   
xREG2  #(2) phy_mode_ext_xREG2(.clk(clk),
                        .reset(hw_reset),
                        .reset_value(2'b10),
                        .load(pio_sel_dpath),
                        .din(slv_write_data[1:0]),
                        .qout(phy_mode_ext));
   
SRREG #(3) r_shared (shared_sel,clk,pio_sel_shared,hw_reset,
		slv_write_data[2:0]);

SYNCREG r_clr_res_auto(clr_res_auto,clk,res_auto_tx);
SYNCREG r_sigdet_optic_pci(signal_detect_optic_pci,clk,signal_detect_optic);

SYNCREG r_set_lol_from_los(set_lol_from_los_pci,clk,set_lol_from_los_tx);
SYNCREG r_set_lol_from_c(set_lol_from_c_pci,clk,set_lol_from_c_tx);
SYNCREG6 r_link_not_up(link_not_up_diag_pci,clk,link_not_up_diag_tx);

// REG (qout, clk, din);
REG #(1) r_sw_reset(sw_reset,clk,nxt_sw_reset);
REG #(1) r_our_fault(our_fault,clk,nxt_our_fault);
REG #(1) r_link_status(link_status,clk,nxt_link_status);
REG #(1) r_res_auto(res_auto_pci,clk,nxt_res_auto_pci);
REG #(1) r_link_up_pci_d(link_up_pci_d,clk,link_up_pci);
REG #(1) r_an_ena_d(autoneg_ena_pci_d,clk,autoneg_ena_pci);
RREG #(1) r_pcs_int (pcs_int,clk,reset_pci | pcs_mask,nxt_pcs_int);

endmodule

