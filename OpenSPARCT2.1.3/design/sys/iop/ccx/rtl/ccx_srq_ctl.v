// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ccx_srq_ctl.v
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
`ifndef FPGA
module ccx_srq_ctl (
  qfull_a, 
  qfullbar_a, 
  qsel0_a, 
  qsel1_a, 
  shift_a, 
  q0_holdbar_a, 
  atom_x, 
  req_a, 
  atom_a, 
  grant_a, 
  l1clk, 
  scan_in, 
  ccx_aclk, 
  ccx_bclk, 
  scan_out);
wire siclk;
wire soclk;
wire dff_grant_x_scanin;
wire dff_grant_x_scanout;
wire grant_x;
wire atom_rq_a;
wire atom_rq_x;
wire dff_atom_rq_x_scanin;
wire dff_atom_rq_x_scanout;
wire dff_qfull_a_scanin;
wire dff_qfull_a_scanout;
wire qfull;
wire req_new;
wire v0_in;
wire v0;
wire v1;
wire v1_in;
wire qfullbar;
wire dff_v0_scanin;
wire dff_v0_scanout;
wire dff_v1_scanin;
wire dff_v1_scanout;
wire dff_qfullbar_a_scanin;
wire dff_qfullbar_a_scanout;
wire av0_in;
wire av0;
wire av1;
wire av1_in;
wire aqsel0_a;
wire aqsel1_a;
wire ashift_a;
wire dff_av0_scanin;
wire dff_av0_scanout;
wire dff_av1_scanin;
wire dff_av1_scanout;
wire atom1_in;
wire atom1;
wire dff_atom1_scanin;
wire dff_atom1_scanout;
wire atom0_in;
wire atom0;
wire dff_atom0_scanin;
wire dff_atom0_scanout;

 
output	qfull_a;
output	qfullbar_a;
output	qsel0_a;
output	qsel1_a;
output	shift_a;
output	q0_holdbar_a;
output	atom_x;
   
input	req_a;
input	atom_a;
input	grant_a;
 
//Globals
input           l1clk;
input           scan_in;
input           ccx_aclk;
input           ccx_bclk;
output          scan_out;

// scan renames
assign siclk = ccx_aclk;
assign soclk = ccx_bclk;
// end scan


// latch the grant
// grant is generated in the same cycle as req_a.
// The data corresponding to the grant is consumed from the queues
// in next cycle. grant_x is used to update the FIFO.
ccx_srq_ctl_msff_ctl_macro dff_grant_x  
  (
   .scan_in(dff_grant_x_scanin),
   .scan_out(dff_grant_x_scanout),
   .din           (grant_a),
   .dout          (grant_x),
   .l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
   );


// set up state to detect an atomic request and hold it until queue stays
// full. The atomic requests are guaranteed to be back-to-back.
// On PCX, an atomic req will not be made unless queue  is empty.
// On CPX, L2 can make the req when queue is not full (it need not be empty). 
// In this case atom_rq_a will get set after the first packet is accepted. It will
// stay set until the queue remains full. When the queue goes not full, the
// next packet (second part of the atomic req) will  get accepted and a req
// will be generated for it. At the same time atom_rq_a will be cleared.
// 
// ideally the setting should be qualified with !qfull, but it is not needed
// since design guarantees that LSU and L2 will not make an atomic request
// unless the queue is not full.

//assign atom_rq_a = atom_a & req_a | atom_rq_x & qfull_a;
assign atom_rq_a = atom_a & req_a & ~qfull_a | atom_rq_x & qfull_a;

ccx_srq_ctl_msff_ctl_macro dff_atom_rq_x  
  (
   .scan_in(dff_atom_rq_x_scanin),
   .scan_out(dff_atom_rq_x_scanout),
   .din           (atom_rq_a),
   .dout          (atom_rq_x),
   .l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

ccx_srq_ctl_msff_ctl_macro dff_qfull_a
  (
   .scan_in(dff_qfull_a_scanin),
   .scan_out(dff_qfull_a_scanout),
   .din           (qfull),
   .dout          (qfull_a),
   .l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// req_new indicates that a valid request is presented with FIFO not full.
assign req_new = (atom_rq_x | req_a) & ~qfull_a;

// v0 and v1 are the valids for queue entries q0 and q1
//
// v1_in does not include the term (v1 & v0 & req_new & grant_x) 
// because with v1 set, the queue would be full.
// No new requests can be accepted if v1 is set. This is because the source
// continues to drive the request until the cycle after grant_x. Accepting
// a request in the cycle of grant_x will result in same request being
// latched twice in the FIFO.

assign v0_in = ((~v0 & req_new) | (v0 & req_new & grant_x) | (v1 & grant_x) | (v0 & ~grant_x));
assign v1_in = ((v0 & req_new & ~grant_x) | (v1 & ~grant_x));



// qsel0 is the mux select which loads incoming new data into q0
// shift_a is the mux select whicl loads q1 data into q0
// qsel1 is the enable for q1
// speed these up by using earlier versions of the signals
//assign qsel0 = (~v0 & req_new) | (v0 & req_new & grant_x) 
//             = req_new & (~v0 | v0 & grant_x) 
//             = req_new & (~v0 | grant_x);
assign qsel0_a = req_new & (~v0 | grant_x);
assign shift_a = v1 & grant_x;
assign q0_holdbar_a = ~(~qsel0_a & ~shift_a);

assign qsel1_a = v0 & req_new & ~grant_x;
assign qfull = v1_in;
assign qfullbar = ~v1_in;

ccx_srq_ctl_msff_ctl_macro dff_v0
  (
   .scan_in(dff_v0_scanin),
   .scan_out(dff_v0_scanout),
   .din           (v0_in),
   .dout             (v0),
   .l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
ccx_srq_ctl_msff_ctl_macro dff_v1
  (
   .scan_in(dff_v1_scanin),
   .scan_out(dff_v1_scanout),
   .din           (v1_in),
   .dout             (v1),
   .l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

ccx_srq_ctl_msff_ctl_macro dff_qfullbar_a
  (
   .scan_in(dff_qfullbar_a_scanin),
   .scan_out(dff_qfullbar_a_scanout),
   .din           (qfullbar),
   .dout          (qfullbar_a),
   .l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// Atomic flag tracking
// Should place this in the dp FIFO.

// This queue has different timing then the data queue
// The atomic request indicator comes one cycle earlier than data, along with the request.
// Also, on a "grant", the queue shifts very next cycle.

// ideally this should be:
// the term (~av0 & req_new & ~grant_a) allows for the fact that if a grant_a comes with ~av0 & req_new, then the
// request does not get latched in the FIFO. Basically in this case, the arbiter processes the request directly out
// of the input register.
assign av0_in = ((~av0 & req_new & ~grant_a) | (av0 & ~av1 & req_new & grant_a) | (av1 & grant_a) | (av0 & ~grant_a));
assign av1_in = ((av0 & req_new & ~grant_a) | (av1 & ~grant_a));

assign aqsel0_a = (req_new &  ~av0 ) | (req_new & av0 &  ~av1 & grant_a);	
assign aqsel1_a = (req_new & av0  &  ~grant_a);

assign ashift_a = av1 & grant_a;

ccx_srq_ctl_msff_ctl_macro dff_av0
  (
   .scan_in(dff_av0_scanin),
   .scan_out(dff_av0_scanout),
   .din           (av0_in),
   .dout             (av0),
   .l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
ccx_srq_ctl_msff_ctl_macro dff_av1
  (
   .scan_in(dff_av1_scanin),
   .scan_out(dff_av1_scanout),
   .din           (av1_in),
   .dout             (av1),
   .l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign atom1_in = (aqsel1_a  & atom_a) | (~aqsel1_a & atom1);	

ccx_srq_ctl_msff_ctl_macro dff_atom1   (
	.scan_in(dff_atom1_scanin),
	.scan_out(dff_atom1_scanout),
	.din           (atom1_in),
	.dout          (atom1),
	.l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


assign atom0_in = (aqsel0_a  & atom_a) | (ashift_a & atom1) | (~aqsel0_a &  ~ ashift_a & atom0);	

ccx_srq_ctl_msff_ctl_macro dff_atom0   (
	.scan_in(dff_atom0_scanin),
	.scan_out(dff_atom0_scanout),
	.din           (atom0_in),
	.dout          (atom0),
	.l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


assign atom_x = atom0;

// fixscan start:
assign dff_grant_x_scanin        = scan_in                  ;
assign dff_atom_rq_x_scanin      = dff_grant_x_scanout      ;
assign dff_qfull_a_scanin        = dff_atom_rq_x_scanout    ;
assign dff_v0_scanin             = dff_qfull_a_scanout      ;
assign dff_v1_scanin             = dff_v0_scanout           ;
assign dff_qfullbar_a_scanin     = dff_v1_scanout           ;
assign dff_av0_scanin            = dff_qfullbar_a_scanout   ;
assign dff_av1_scanin            = dff_av0_scanout          ;
assign dff_atom1_scanin          = dff_av1_scanout          ;
assign dff_atom0_scanin          = dff_atom1_scanout        ;
assign scan_out                  = dff_atom0_scanout        ;
// fixscan end:
endmodule 







// any PARAMS parms go into naming of macro

module ccx_srq_ctl_msff_ctl_macro (
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







`endif // `ifndef FPGA

`ifdef FPGA
// No timescale specified
module ccx_srq_ctl(qfull_a, qfullbar_a, qsel0_a, qsel1_a, shift_a, q0_holdbar_a,
	atom_x, req_a, atom_a, grant_a, l1clk, scan_in, ccx_aclk, ccx_bclk, 
	scan_out);

	output			qfull_a;
	output			qfullbar_a;
	output			qsel0_a;
	output			qsel1_a;
	output			shift_a;
	output			q0_holdbar_a;
	output			atom_x;
	input			req_a;
	input			atom_a;
	input			grant_a;
	input			l1clk;
	input			scan_in;
	input			ccx_aclk;
	input			ccx_bclk;
	output			scan_out;

	wire			siclk;
	wire			soclk;
	wire			dff_grant_x_scanin;
	wire			dff_grant_x_scanout;
	wire			grant_x;
	wire			atom_rq_a;
	wire			atom_rq_x;
	wire			dff_atom_rq_x_scanin;
	wire			dff_atom_rq_x_scanout;
	wire			dff_qfull_a_scanin;
	wire			dff_qfull_a_scanout;
	wire			qfull;
	wire			req_new;
	wire			v0_in;
	wire			v0;
	wire			v1;
	wire			v1_in;
	wire			qfullbar;
	wire			dff_v0_scanin;
	wire			dff_v0_scanout;
	wire			dff_v1_scanin;
	wire			dff_v1_scanout;
	wire			dff_qfullbar_a_scanin;
	wire			dff_qfullbar_a_scanout;
	wire			av0_in;
	wire			av0;
	wire			av1;
	wire			av1_in;
	wire			aqsel0_a;
	wire			aqsel1_a;
	wire			ashift_a;
	wire			dff_av0_scanin;
	wire			dff_av0_scanout;
	wire			dff_av1_scanin;
	wire			dff_av1_scanout;
	wire			atom1_in;
	wire			atom1;
	wire			dff_atom1_scanin;
	wire			dff_atom1_scanout;
	wire			atom0_in;
	wire			atom0;
	wire			dff_atom0_scanin;
	wire			dff_atom0_scanout;

	assign siclk = ccx_aclk;
	assign soclk = ccx_bclk;
	assign atom_rq_a = (((atom_a & req_a) & (~qfull_a)) | (atom_rq_x & 
		qfull_a));
	assign req_new = ((atom_rq_x | req_a) & (~qfull_a));
	assign v0_in = (((((~v0) & req_new) | ((v0 & req_new) & grant_x)) | (v1 
		& grant_x)) | (v0 & (~grant_x)));
	assign v1_in = (((v0 & req_new) & (~grant_x)) | (v1 & (~grant_x)));
	assign qsel0_a = (req_new & ((~v0) | grant_x));
	assign shift_a = (v1 & grant_x);
	assign q0_holdbar_a = (~((~qsel0_a) & (~shift_a)));
	assign qsel1_a = ((v0 & req_new) & (~grant_x));
	assign qfull = v1_in;
	assign qfullbar = (~v1_in);
	assign av0_in = ((((((~av0) & req_new) & (~grant_a)) | (((av0 & (~av1)) 
		& req_new) & grant_a)) | (av1 & grant_a)) | (av0 & (~grant_a)));
	assign av1_in = (((av0 & req_new) & (~grant_a)) | (av1 & (~grant_a)));
	assign aqsel0_a = ((req_new & (~av0)) | (((req_new & av0) & (~av1)) & 
		grant_a));
	assign aqsel1_a = ((req_new & av0) & (~grant_a));
	assign ashift_a = (av1 & grant_a);
	assign atom1_in = ((aqsel1_a & atom_a) | ((~aqsel1_a) & atom1));
	assign atom0_in = (((aqsel0_a & atom_a) | (ashift_a & atom1)) | (((~
		aqsel0_a) & (~ashift_a)) & atom0));
	assign atom_x = atom0;
	assign dff_grant_x_scanin = scan_in;
	assign dff_atom_rq_x_scanin = dff_grant_x_scanout;
	assign dff_qfull_a_scanin = dff_atom_rq_x_scanout;
	assign dff_v0_scanin = dff_qfull_a_scanout;
	assign dff_v1_scanin = dff_v0_scanout;
	assign dff_qfullbar_a_scanin = dff_v1_scanout;
	assign dff_av0_scanin = dff_qfullbar_a_scanout;
	assign dff_av1_scanin = dff_av0_scanout;
	assign dff_atom1_scanin = dff_av1_scanout;
	assign dff_atom0_scanin = dff_atom1_scanout;
	assign scan_out = dff_atom0_scanout;

	msff_ctl_macro dff_grant_x(
		.scan_in			(dff_grant_x_scanin), 
		.scan_out			(dff_grant_x_scanout), 
		.din				(grant_a), 
		.dout				(grant_x), 
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk));
	msff_ctl_macro dff_atom_rq_x(
		.scan_in			(dff_atom_rq_x_scanin), 
		.scan_out			(dff_atom_rq_x_scanout), 
		.din				(atom_rq_a), 
		.dout				(atom_rq_x), 
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk));
	msff_ctl_macro dff_qfull_a(
		.scan_in			(dff_qfull_a_scanin), 
		.scan_out			(dff_qfull_a_scanout), 
		.din				(qfull), 
		.dout				(qfull_a), 
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk));
	msff_ctl_macro dff_v0(
		.scan_in			(dff_v0_scanin), 
		.scan_out			(dff_v0_scanout), 
		.din				(v0_in), 
		.dout				(v0), 
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk));
	msff_ctl_macro dff_v1(
		.scan_in			(dff_v1_scanin), 
		.scan_out			(dff_v1_scanout), 
		.din				(v1_in), 
		.dout				(v1), 
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk));
	msff_ctl_macro dff_qfullbar_a(
		.scan_in			(dff_qfullbar_a_scanin), 
		.scan_out			(dff_qfullbar_a_scanout), 
		.din				(qfullbar), 
		.dout				(qfullbar_a), 
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk));
	msff_ctl_macro dff_av0(
		.scan_in			(dff_av0_scanin), 
		.scan_out			(dff_av0_scanout), 
		.din				(av0_in), 
		.dout				(av0), 
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk));
	msff_ctl_macro dff_av1(
		.scan_in			(dff_av1_scanin), 
		.scan_out			(dff_av1_scanout), 
		.din				(av1_in), 
		.dout				(av1), 
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk));
	msff_ctl_macro dff_atom1(
		.scan_in			(dff_atom1_scanin), 
		.scan_out			(dff_atom1_scanout), 
		.din				(atom1_in), 
		.dout				(atom1), 
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk));
	msff_ctl_macro dff_atom0(
		.scan_in			(dff_atom0_scanin), 
		.scan_out			(dff_atom0_scanout), 
		.din				(atom0_in), 
		.dout				(atom0), 
		.l1clk				(l1clk), 
		.siclk				(siclk), 
		.soclk				(soclk));
endmodule

`endif // `ifdef FPGA

