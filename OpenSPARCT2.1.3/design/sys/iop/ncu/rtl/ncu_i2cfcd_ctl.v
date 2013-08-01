// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_i2cfcd_ctl.v
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
module ncu_i2cfcd_ctl (
  cmp_io_sync_en, 
  cpx_ncu_grant_cx, 
  intbuf_dout, 
  iobuf_dout, 
  iobuf_tail_s, 
  io_cmp_sync_en, 
  l2clk, 
  scan_in, 
  tcu_clk_stop, 
  tcu_pce_ov, 
  tcu_scan_en, 
  tcu_aclk, 
  tcu_bclk, 
  mb0_raddr, 
  mb0_waddr, 
  mb0_intbuf_wr_en, 
  mb0_intbuf_rd_en, 
  mb0_iobuf_rd_en, 
  mb0_run, 
  intbuf_head_ptr, 
  intbuf_hit_hwm, 
  intbuf_tail_ptr, 
  intbuf_wr2i2c, 
  intbuf_rden, 
  iobuf_head_f, 
  iobuf_head_ptr, 
  iobuf_rden, 
  ncu_cpx_data_ca, 
  ncu_cpx_req_cq, 
  scan_out, 
  iobuf_ue_f, 
  iobuf_uei, 
  intbuf_ue_f, 
  intbuf_uei) ;
wire intbuf_sel_next;
wire iobuf_sel_next;
wire intbuf_rd;
wire iobuf_rd;
wire iobuf_vld;
wire io_pa_ld;
wire io_pas;
wire intbuf_vld;
wire int_pa_ld;
wire int_pas;
wire ncu_i2cfc_ctl_scanin;
wire ncu_i2cfc_ctl_scanout;
wire [7:0] intbuf_cpx_req;
wire [7:0] iobuf_cpx_req;
wire [7:0] ncu_cpx_req_next;
wire intbuf_dout_d1_ue;
wire iobuf_dout_d1_ue;
wire ncu_i2cfd_ctl_scanin;
wire ncu_i2cfd_ctl_scanout;


input			cmp_io_sync_en;		// To ncu_i2cfc_ctl of ncu_i2cfc_ctl.v
input [7:0]		cpx_ncu_grant_cx;	// To ncu_i2cfc_ctl of ncu_i2cfc_ctl.v
input [143:0]		intbuf_dout;		// To ncu_i2cfd_ctl of ncu_i2cfd_ctl.v
input [175:0]		iobuf_dout;		// To ncu_i2cfd_ctl of ncu_i2cfd_ctl.v
input [5:0]		iobuf_tail_s;		// To ncu_i2cfc_ctl of ncu_i2cfc_ctl.v
input			io_cmp_sync_en;		// To ncu_i2cfc_ctl of ncu_i2cfc_ctl.v
input			l2clk;			// To ncu_i2cfc_ctl of ncu_i2cfc_ctl.v, ...
input			scan_in;		// To ncu_i2cfc_ctl of ncu_i2cfc_ctl.v
input			tcu_clk_stop;		// To ncu_i2cfc_ctl of ncu_i2cfc_ctl.v, ...
input			tcu_pce_ov;		// To ncu_i2cfc_ctl of ncu_i2cfc_ctl.v, ...
input			tcu_scan_en;		// To ncu_i2cfc_ctl of ncu_i2cfc_ctl.v, ...
input			tcu_aclk;		// To ncu_i2cfc_ctl of ncu_i2cfc_ctl.v, ...
input			tcu_bclk;		// To ncu_i2cfc_ctl of ncu_i2cfc_ctl.v, ...
input [4:0]		mb0_raddr;
input [4:0]		mb0_waddr;
input			mb0_intbuf_wr_en;
input			mb0_intbuf_rd_en;
input			mb0_iobuf_rd_en;
input			mb0_run;


output [4:0]		intbuf_head_ptr;	// From ncu_i2cfc_ctl of ncu_i2cfc_ctl.v
output			intbuf_hit_hwm;	// From ncu_i2cfc_ctl of ncu_i2cfc_ctl.v
output [4:0]		intbuf_tail_ptr;	// From ncu_i2cfc_ctl of ncu_i2cfc_ctl.v
input			intbuf_wr2i2c;		// From ncu_i2cfc_ctl of ncu_i2cfc_ctl.v
output			intbuf_rden;
output [5:0]		iobuf_head_f;		// From ncu_i2cfc_ctl of ncu_i2cfc_ctl.v
output [4:0]		iobuf_head_ptr;	// From ncu_i2cfc_ctl of ncu_i2cfc_ctl.v
output			iobuf_rden;		// From ncu_i2cfc_ctl of ncu_i2cfc_ctl.v
output [145:0]		ncu_cpx_data_ca;	// From ncu_i2cfd_ctl of ncu_i2cfd_ctl.v
output [7:0]		ncu_cpx_req_cq;		// From ncu_i2cfd_ctl of ncu_i2cfd_ctl.v
output			scan_out;		// From ncu_i2cfd_ctl of ncu_i2cfd_ctl.v

output			iobuf_ue_f;
input			iobuf_uei;
output			intbuf_ue_f;
input			intbuf_uei;

/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
// End of automatics


///* ncu_i2cfc_ctl auto_template ( 
//  			    .scan_out() ); */
ncu_i2cfc_ctl ncu_i2cfc_ctl ( /*AUTOINST*/
			     // Outputs
			     .intbuf_sel_next(intbuf_sel_next),
			     .iobuf_sel_next(iobuf_sel_next),
			     .intbuf_rd	(intbuf_rd),
			     .iobuf_rd	(iobuf_rd),
			     .iobuf_vld	(iobuf_vld),
			     .io_pa_ld	(io_pa_ld),
			     .io_pas	(io_pas),
			     .intbuf_vld(intbuf_vld),
			     .int_pa_ld	(int_pa_ld),
			     .int_pas	(int_pas),
			     .intbuf_hit_hwm(intbuf_hit_hwm),
			     .iobuf_head_f(iobuf_head_f[5:0]),
			     .intbuf_tail_ptr(intbuf_tail_ptr[4:0]),
			     .intbuf_head_ptr(intbuf_head_ptr[4:0]),
			     .iobuf_head_ptr(iobuf_head_ptr[4:0]),
			     .iobuf_rden(iobuf_rden),
			     .intbuf_rden(intbuf_rden),
			     // Inputs
			     .scan_in(ncu_i2cfc_ctl_scanin),
			     .scan_out(ncu_i2cfc_ctl_scanout),
			     .l2clk	(l2clk),
			     .cmp_io_sync_en(cmp_io_sync_en),
			     .io_cmp_sync_en(io_cmp_sync_en),
			     .tcu_pce_ov(tcu_pce_ov),
			     .tcu_clk_stop(tcu_clk_stop),
			     .tcu_scan_en(tcu_scan_en),
			     .tcu_aclk	(tcu_aclk),
			     .tcu_bclk	(tcu_bclk),
			     .cpx_ncu_grant_cx(cpx_ncu_grant_cx[7:0]),
			     .intbuf_cpx_req(intbuf_cpx_req[7:0]),
			     .iobuf_cpx_req(iobuf_cpx_req[7:0]),
			     .ncu_cpx_req_next(ncu_cpx_req_next[7:0]),
			     .iobuf_tail_s(iobuf_tail_s[5:0]),
			     .intbuf_wr2i2c(intbuf_wr2i2c),
			     .mb0_raddr	(mb0_raddr[4:0]),
			     .mb0_waddr	(mb0_waddr[4:0]),
			     .mb0_run(mb0_run),
			     .mb0_intbuf_rd_en(mb0_intbuf_rd_en),
			     .mb0_iobuf_rd_en(mb0_iobuf_rd_en),
			     .intbuf_dout_d1_ue(intbuf_dout_d1_ue),
			     .iobuf_dout_d1_ue(iobuf_dout_d1_ue) );



///* ncu_i2cfd_ctl auto_template ( 
//  			    .scan_out() ); */
ncu_i2cfd_ctl ncu_i2cfd_ctl ( /*AUTOINST*/
			     // Outputs
			     .ncu_cpx_req_cq(ncu_cpx_req_cq[7:0]),
			     .ncu_cpx_data_ca(ncu_cpx_data_ca[145:0]),
			     .intbuf_cpx_req(intbuf_cpx_req[7:0]),
			     .iobuf_cpx_req(iobuf_cpx_req[7:0]),
			     .ncu_cpx_req_next(ncu_cpx_req_next[7:0]),
			     .iobuf_ue_f(iobuf_ue_f),
			     .intbuf_ue_f(intbuf_ue_f),
			     .intbuf_dout_d1_ue(intbuf_dout_d1_ue),
			     .iobuf_dout_d1_ue(iobuf_dout_d1_ue),
			     // Inputs
			     .scan_in(ncu_i2cfd_ctl_scanin),
			     .scan_out(ncu_i2cfd_ctl_scanout),
			     .l2clk	(l2clk),
			     .cmp_io_sync_en(cmp_io_sync_en),
			     .io_cmp_sync_en(io_cmp_sync_en),
			     .tcu_pce_ov(tcu_pce_ov),
			     .tcu_clk_stop(tcu_clk_stop),
			     .tcu_scan_en(tcu_scan_en),
			     .tcu_aclk	(tcu_aclk),
			     .tcu_bclk	(tcu_bclk),
			     .intbuf_sel_next(intbuf_sel_next),
			     .iobuf_sel_next(iobuf_sel_next),
			     .intbuf_rd	(intbuf_rd),
			     .iobuf_rd	(iobuf_rd),
			     .iobuf_vld	(iobuf_vld),
			     .io_pa_ld	(io_pa_ld),
			     .io_pas	(io_pas),
			     .intbuf_vld(intbuf_vld),
			     .int_pa_ld	(int_pa_ld),
			     .int_pas	(int_pas),
			     .intbuf_dout(intbuf_dout[143:0]),
			     .iobuf_dout(iobuf_dout[175:0]),
			     .iobuf_uei	(iobuf_uei),
			     .intbuf_uei(intbuf_uei)
			     );




// fixscan start:
assign ncu_i2cfc_ctl_scanin      = scan_in                  ;
assign ncu_i2cfd_ctl_scanin      = ncu_i2cfc_ctl_scanout    ;
assign scan_out                  = ncu_i2cfd_ctl_scanout    ;
// fixscan end:
endmodule



// any PARAMS parms go into naming of macro

module ncu_i2cfcd_ctl_msff_ctl_macro__width_8 (
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

module ncu_i2cfcd_ctl_msff_ctl_macro__width_2 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0];






dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_i2cfcd_ctl_msff_ctl_macro__en_1__width_6 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = (din[5:0] & {6{en}}) | (dout[5:0] & ~{6{en}});






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_i2cfcd_ctl_msff_ctl_macro__width_6 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = din[5:0];






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_i2cfcd_ctl_msff_ctl_macro__width_1 (
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

module ncu_i2cfcd_ctl_msff_ctl_macro__en_1__width_1 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}}) | (dout[0:0] & ~{1{en}});






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

module ncu_i2cfcd_ctl_l1clkhdr_ctl_macro (
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












`define RF_RDEN_OFFSTATE            1'b1

//====================================
`define NCU_INTMANRF_DEPTH         128
`define NCU_INTMANRF_DATAWIDTH      16
`define NCU_INTMANRF_ADDRWIDTH       7
//====================================

//====================================
`define NCU_MONDORF_DEPTH           64
`define NCU_MONDORF_DATAWIDTH       72
`define NCU_MONDORF_ADDRWIDTH        6
//====================================

//====================================
`define NCU_CPUBUFRF_DEPTH          32
`define NCU_CPUBUFRF_DATAWIDTH     144
`define NCU_CPUBUFRF_ADDRWIDTH       5
//====================================

//====================================
`define NCU_IOBUFRF_DEPTH          32
`define NCU_IOBUFRF_DATAWIDTH     144
`define NCU_IOBUFRF_ADDRWIDTH       5
//====================================

//====================================
`define NCU_IOBUF1RF_DEPTH          32
`define NCU_IOBUF1RF_DATAWIDTH      32
`define NCU_IOBUF1RF_ADDRWIDTH       5
//====================================

//====================================
`define NCU_INTBUFRF_DEPTH          32
`define NCU_INTBUFRF_DATAWIDTH     144
`define NCU_INTBUFRF_ADDRWIDTH       5
//====================================

//== fix me : need to remove when warm //
//== becomes available //
`define WMR_LENGTH		10'd999
`define WMR_LENGTH_P1		10'd1000

//// NCU CSR_MAN address   80_0000_xxxx ////
`define NCU_CSR_MAN			16'h0000
`define NCU_CREG_INTMAN			16'h0000
//`define NCU_CREG_INTVECDISP		16'h0800
`define NCU_CREG_MONDOINVEC		16'h0a00
`define NCU_CREG_SERNUM			16'h1000
`define NCU_CREG_FUSESTAT		16'h1008
`define NCU_CREG_COREAVAIL		16'h1010
`define NCU_CREG_BANKAVAIL		16'h1018
`define NCU_CREG_BANK_ENABLE		16'h1020
`define NCU_CREG_BANK_ENABLE_STATUS 	16'h1028
`define NCU_CREG_L2_HASH_ENABLE		16'h1030
`define NCU_CREG_L2_HASH_ENABLE_STATUS	16'h1038


`define NCU_CREG_MEM32_BASE	16'h2000
`define NCU_CREG_MEM32_MASK	16'h2008
`define NCU_CREG_MEM64_BASE	16'h2010
`define NCU_CREG_MEM64_MASK	16'h2018
`define NCU_CREG_IOCON_BASE	16'h2020
`define NCU_CREG_IOCON_MASK	16'h2028
`define NCU_CREG_MMUFSH		16'h2030

`define NCU_CREG_ESR		16'h3000
`define NCU_CREG_ELE		16'h3008
`define NCU_CREG_EIE		16'h3010
`define NCU_CREG_EJR		16'h3018
`define NCU_CREG_FEE		16'h3020
`define NCU_CREG_PER		16'h3028
`define NCU_CREG_SIISYN		16'h3030
`define NCU_CREG_NCUSYN		16'h3038
`define NCU_CREG_SCKSEL         16'h3040
`define NCU_CREG_DBGTRIG_EN     16'h4000

//// NUC CSR_MONDO address 80_0004_xxxx ////
`define NCU_CSR_MONDO		16'h0004
`define NCU_CREG_MDATA0  	16'h0000 
`define NCU_CREG_MDATA1  	16'h0200 
`define NCU_CREG_MDATA0_ALIAS	16'h0400 
`define NCU_CREG_MDATA1_ALIAS	16'h0600 
`define NCU_CREG_MBUSY		16'h0800 
`define NCU_CREG_MBUSY_ALIAS	16'h0a00 



// ASI shared reg 90_xxxx_xxxx//
`define NCU_ASI_A_HIT			10'h104 // 6-bits cpuid and thread id are "x"
`define NCU_ASI_B_HIT			10'h1CC // 6-bits cpuid and thread id are "x"
`define NCU_ASI_C_HIT			10'h114	// 6-bits cpuid and thread id are "x"
`define NCU_ASI_COREAVAIL		16'h0000
`define NCU_ASI_CORE_ENABLE_STATUS	16'h0010
`define NCU_ASI_CORE_ENABLE		16'h0020
`define NCU_ASI_XIR_STEERING		16'h0030
`define NCU_ASI_CORE_RUNNINGRW		16'h0050
`define NCU_ASI_CORE_RUNNING_STATUS	16'h0058
`define NCU_ASI_CORE_RUNNING_W1S	16'h0060
`define NCU_ASI_CORE_RUNNING_W1C	16'h0068
`define NCU_ASI_INTVECDISP		16'h0000
`define NCU_ASI_ERR_STR                 16'h1000
`define NCU_ASI_WMR_VEC_MASK            16'h0018
`define NCU_ASI_CMP_TICK_ENABLE		16'h0038


//// UCB packet type ////
`define UCB_READ_NACK	4'b0000    // ack/nack types
`define UCB_READ_ACK	4'b0001
`define UCB_WRITE_ACK	4'b0010
`define UCB_IFILL_ACK	4'b0011
`define UCB_IFILL_NACK	4'b0111

`define UCB_READ_REQ	4'b0100    // req types
`define UCB_WRITE_REQ	4'b0101
`define UCB_IFILL_REQ	4'b0110

`define UCB_INT		4'b1000    // plain interrupt
`define UCB_INT_VEC	4'b1100    // interrupt with vector
`define UCB_INT_SOC_UE	4'b1001    // soc interrup ue
`define UCB_INT_SOC_CE  4'b1010    // soc interrup ce
`define UCB_RESET_VEC	4'b0101    // reset with vector
`define UCB_IDLE_VEC	4'b1110    // idle with vector
`define UCB_RESUME_VEC	4'b1111    // resume with vector

`define UCB_INT_SOC 	4'b1101    // soc interrup ce


//// PCX packet type ////
`define	PCX_LOAD_RQ	5'b00000
`define	PCX_IMISS_RQ	5'b10000
`define	PCX_STORE_RQ	5'b00001
`define PCX_FWD_RQs	5'b01101
`define PCX_FWD_RPYs	5'b01110

//// CPX packet type ////
//`define CPX_LOAD_RET	4'b0000
`define CPX_LOAD_RET	4'b1000
`define CPX_ST_ACK	4'b0100
//`define CPX_IFILL_RET	4'b0001
`define CPX_IFILL_RET	4'b1001
`define CPX_INT_RET	4'b0111
`define CPX_INT_SOC	4'b1101
//`define CPX_FWD_RQ_RET	4'b1010
//`define CPX_FWD_RPY_RET	4'b1011




//// Global CSR decode ////
`define NCU_CSR		8'h80
`define NIU_CSR		8'h81
//`define RNG_CSR		8'h82
`define DBG1_CSR               8'h86
`define CCU_CSR		8'h83
`define MCU_CSR		8'h84
`define TCU_CSR		8'h85
`define DMU_CSR		8'h88
`define RCU_CSR		8'h89
`define NCU_ASI		8'h90
			/////8'h91 ~ 9F reserved
			/////8'hA0 ~ BF L2 CSR////
`define DMU_PIO		4'hC   // C0 ~ CF
			/////8'hB0 ~ FE reserved
`define SSI_CSR		8'hFF


//// NCU_SSI ////
`define SSI_ADDR 	 	12'hFF_F
`define SSI_ADDR_TIMEOUT_REG	40'hFF_0001_0088
`define SSI_ADDR_LOG_REG	40'hFF_0000_0018

`define IF_IDLE 2'b00
`define IF_ACPT 2'b01
`define IF_DROP 2'b10

`define SSI_IDLE     3'b000
`define	SSI_REQ      3'b001
`define	SSI_WDATA    3'b011
`define	SSI_REQ_PAR  3'b101
`define	SSI_ACK      3'b111
`define	SSI_RDATA    3'b110
`define	SSI_ACK_PAR  3'b010










module ncu_i2cfd_ctl (
  l2clk, 
  cmp_io_sync_en, 
  io_cmp_sync_en, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_scan_en, 
  tcu_aclk, 
  tcu_bclk, 
  ncu_cpx_req_cq, 
  ncu_cpx_data_ca, 
  intbuf_cpx_req, 
  intbuf_sel_next, 
  iobuf_cpx_req, 
  iobuf_sel_next, 
  intbuf_rd, 
  iobuf_rd, 
  iobuf_vld, 
  io_pa_ld, 
  io_pas, 
  intbuf_vld, 
  int_pa_ld, 
  int_pas, 
  iobuf_dout_d1_ue, 
  intbuf_dout_d1_ue, 
  ncu_cpx_req_next, 
  intbuf_dout, 
  iobuf_dout, 
  iobuf_ue_f, 
  iobuf_uei, 
  intbuf_ue_f, 
  intbuf_uei) ;
wire [145:0] ncu_cpx_data_next;
wire [145:0] intbuf_cpx_data;
wire [145:0] iobuf_cpx_data;
wire ncu_cpx_data_ca_ff_scanin;
wire ncu_cpx_data_ca_ff_scanout;
wire l1clk;
wire intbuf_pa_ff_scanin;
wire intbuf_pa_ff_scanout;
wire [143:0] intbuf_pa;
wire [143:0] intbuf_dout_muxed_0;
wire [153:0] intbuf_dout_muxed_a;
wire intbuf_uei_d1_ff_scanin;
wire intbuf_uei_d1_ff_scanout;
wire intbuf_uei_d1;
wire [4:0] inteccchk_ci;
wire intbuf_dout_d1_ue_n;
wire unused_intbufce;
wire [10:0] intbuf_dout_muxed_b;
wire [4:0] unused_intbufco;
wire [16:0] intpfail_n;
wire [153:0] intbuf_dout_muxed;
wire intbuf_dout_d1_ff_scanin;
wire intbuf_dout_d1_ff_scanout;
wire [153:0] intbuf_dout_d1;
wire intbuf_dout_d1_ue_ff_scanin;
wire intbuf_dout_d1_ue_ff_scanout;
wire intbuf_dout_d1_pe_ff_scanin;
wire intbuf_dout_d1_pe_ff_scanout;
wire intbuf_dout_d1_pe;
wire intbuf_ue_vld_n;
wire intbuf_ue_vld;
wire intbuf_ue_vld_ff_scanin;
wire intbuf_ue_vld_ff_scanout;
wire intbuf_ue_f_ff_scanin;
wire intbuf_ue_f_ff_scanout;
wire iobuf_pa_ff_scanin;
wire iobuf_pa_ff_scanout;
wire [175:0] iobuf_pa;
wire [175:0] iobuf_dout_muxed_a;
wire iobuf_uei_d1_ff_scanin;
wire iobuf_uei_d1_ff_scanout;
wire iobuf_uei_d1;
wire [4:0] ioeccchk_ci;
wire iobuf_dout_d1_ue_n;
wire unused_iobufce;
wire [10:0] iobuf_dout_muxed_b;
wire [4:0] unused_iobufco;
wire [17:0] iopfail_n;
wire [153:0] iobuf_dout_muxed;
wire iobuf_dout_d1_ff_scanin;
wire iobuf_dout_d1_ff_scanout;
wire [153:0] iobuf_dout_d1;
wire iobuf_dout_d1_ue_ff_scanin;
wire iobuf_dout_d1_ue_ff_scanout;
wire iobuf_dout_d1_pe_ff_scanin;
wire iobuf_dout_d1_pe_ff_scanout;
wire iobuf_dout_d1_pe;
wire iobuf_ue_vld_n;
wire iobuf_ue_vld;
wire iobuf_ue_vld_ff_scanin;
wire iobuf_ue_vld_ff_scanout;
wire iobuf_ue_f_ff_scanin;
wire iobuf_ue_f_ff_scanout;
wire spares_scanin;
wire spares_scanout;
wire siclk;
wire soclk;
wire se;
wire pce_ov;
wire stop;


////////////////////////////////////////////////////////////////////////
// Signal declarations
////////////////////////////////////////////////////////////////////////
   // Global interface
input		l2clk;
input		cmp_io_sync_en;
input		io_cmp_sync_en;
input		scan_in;
output		scan_out;
input		tcu_pce_ov;
input		tcu_clk_stop;
input		tcu_scan_en;
input		tcu_aclk;
input		tcu_bclk;

   // Crossbar interface
output [7:0]	ncu_cpx_req_cq;
output [145:0]	ncu_cpx_data_ca;
 
   // i2c fast control interface
output [7:0]	intbuf_cpx_req;
input		intbuf_sel_next;

output [7:0]	iobuf_cpx_req;
input		iobuf_sel_next;

input		intbuf_rd;
input		iobuf_rd;
input		iobuf_vld;
input		io_pa_ld;
input		io_pas;
input		intbuf_vld;
input		int_pa_ld;
input		int_pas;

output		iobuf_dout_d1_ue;
output		intbuf_dout_d1_ue;

output [7:0]	ncu_cpx_req_next;

// Interrupt status table read result buffer interface
input [143:0]	intbuf_dout;

// IO buffer interface
input [175:0]	iobuf_dout;

// err par //
output		iobuf_ue_f;
input		iobuf_uei;
output		intbuf_ue_f;
input		intbuf_uei;

// Internal signals




//**************************************
// IO-to-CPX Mux
//**************************************
//// intbuf_sel_next and iobuf_sel_next is m.e. ////
assign 	 ncu_cpx_req_next[7:0] = ({8{intbuf_sel_next}} & intbuf_cpx_req) |
			    	 ({8{iobuf_sel_next}}  & iobuf_cpx_req );
assign ncu_cpx_req_cq[7:0] = ncu_cpx_req_next[7:0];
			 /*
msff_ctl_macro ncu_cpx_req_cq_ff (width=8)
				(
				.scan_in(ncu_cpx_req_cq_ff_scanin),
				.scan_out(ncu_cpx_req_cq_ff_scanout),
				.dout		(ncu_cpx_req_cq[7:0]),
				.l1clk		(l1clk),
				.din		(ncu_cpx_req_next[7:0])
				);
				*/

assign 	 ncu_cpx_data_next[145:0] = ({146{intbuf_sel_next}} & intbuf_cpx_data[145:0]) |
				    ({146{iobuf_sel_next}}  & iobuf_cpx_data[145:0]) ;

			    /*
msff_ctl_macro ncu_cpx_data_cq_ff (width=146)
				(
				.scan_in(ncu_cpx_data_cq_ff_scanin),
				.scan_out(ncu_cpx_data_cq_ff_scanout),
				.dout		(ncu_cpx_data_cq[145:0]),
				.l1clk		(l1clk),
				.din		(ncu_cpx_data_next[145:0])
				);
				*/

// Flop data bus one cycle to match CPX pipeline
ncu_i2cfcd_ctl_msff_ctl_macro__width_146 ncu_cpx_data_ca_ff 
				(
				.scan_in(ncu_cpx_data_ca_ff_scanin),
				.scan_out(ncu_cpx_data_ca_ff_scanout),
				.dout		(ncu_cpx_data_ca[145:0]),
				.l1clk		(l1clk),
				//.din		(ncu_cpx_data_cq[145:0])
				.din		(ncu_cpx_data_next[145:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

//***************************************
// Interrupt Table Read Result Buffer
//***************************************
// Assemble CPX req/data
ncu_i2cfcd_ctl_msff_ctl_macro__en_1__width_144 intbuf_pa_ff  
				(
				.scan_in(intbuf_pa_ff_scanin),
				.scan_out(intbuf_pa_ff_scanout),
				.dout		(intbuf_pa[143:0]),
				.l1clk		(l1clk),
				.en		(int_pa_ld),
				.din		(intbuf_dout[143:0]),
  .siclk(siclk),
  .soclk(soclk)
				);
assign	intbuf_dout_muxed_0[143:0] = int_pas ? intbuf_pa[143:0] : intbuf_dout[143:0] ;

assign	intbuf_dout_muxed_a[153:96] =  intbuf_dout_muxed_0[121:64] ;
assign	intbuf_dout_muxed_a[63:0] = intbuf_dout_muxed_0[63:0] ;
//// uncompress data to reconstruct pcx packet ////
assign	intbuf_dout_muxed_a[95:64] = intbuf_dout_muxed_0[112] ? intbuf_dout_muxed_0[31:0] : 32'b0 ;
							

ncu_i2cfcd_ctl_msff_ctl_macro__en_1__width_1 intbuf_uei_d1_ff  
				(
				.scan_in(intbuf_uei_d1_ff_scanin),
				.scan_out(intbuf_uei_d1_ff_scanout),
				.dout		(intbuf_uei_d1),
				.l1clk		(l1clk),
				.en		(io_cmp_sync_en),
				.din		(intbuf_uei),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	inteccchk_ci[4:0] = {intbuf_dout_muxed_0[126:124],
			     intbuf_dout_muxed_0[123]^intbuf_uei_d1,
			     intbuf_dout_muxed_0[122]^intbuf_uei_d1};

ncu_eccchk11_ctl i2cfdinteccchk11 ( .din({intbuf_dout_muxed_a[153:146],intbuf_dout_muxed_a[136:134]}),
					.ci(inteccchk_ci[4:0]),
					.ue(intbuf_dout_d1_ue_n),
					.ce(unused_intbufce),
					.dout(intbuf_dout_muxed_b[10:0]),
					.co(unused_intbufco[4:0]) );
assign	intpfail_n[0]  = ~^{intbuf_dout_muxed_0[0],  intbuf_dout_muxed_0[17], intbuf_dout_muxed_0[34], 
			    intbuf_dout_muxed_0[51], intbuf_dout_muxed_0[68], intbuf_dout_muxed_0[86], 
			    intbuf_dout_muxed_0[106],intbuf_dout_muxed_0[127]};
assign	intpfail_n[1]  = ~^{intbuf_dout_muxed_0[1],  intbuf_dout_muxed_0[18], intbuf_dout_muxed_0[35], 
			    intbuf_dout_muxed_0[52], intbuf_dout_muxed_0[69], intbuf_dout_muxed_0[87], 
			    intbuf_dout_muxed_0[107],intbuf_dout_muxed_0[128]};
assign	intpfail_n[2]  = ~^{intbuf_dout_muxed_0[2],  intbuf_dout_muxed_0[19], intbuf_dout_muxed_0[36], 
			    intbuf_dout_muxed_0[53], intbuf_dout_muxed_0[70], intbuf_dout_muxed_0[88], 
			    intbuf_dout_muxed_0[108],intbuf_dout_muxed_0[129]};
assign	intpfail_n[3]  = ~^{intbuf_dout_muxed_0[3],  intbuf_dout_muxed_0[20], intbuf_dout_muxed_0[37], 
			    intbuf_dout_muxed_0[54], intbuf_dout_muxed_0[71], intbuf_dout_muxed_0[89], 
			    intbuf_dout_muxed_0[109],intbuf_dout_muxed_0[130]};
assign	intpfail_n[4]  = ~^{intbuf_dout_muxed_0[4],  intbuf_dout_muxed_0[21], intbuf_dout_muxed_0[38], 
			    intbuf_dout_muxed_0[55], intbuf_dout_muxed_0[72], intbuf_dout_muxed_0[90], 
			    intbuf_dout_muxed_0[110],intbuf_dout_muxed_0[131]};
assign	intpfail_n[5]  = ~^{intbuf_dout_muxed_0[5],  intbuf_dout_muxed_0[22], intbuf_dout_muxed_0[39], 
			    intbuf_dout_muxed_0[56], intbuf_dout_muxed_0[73], intbuf_dout_muxed_0[91], 
			    intbuf_dout_muxed_0[111],intbuf_dout_muxed_0[132]};
assign	intpfail_n[6]  = ~^{intbuf_dout_muxed_0[6],  intbuf_dout_muxed_0[23], intbuf_dout_muxed_0[40], 
			    intbuf_dout_muxed_0[57], intbuf_dout_muxed_0[74], intbuf_dout_muxed_0[92], 
			    intbuf_dout_muxed_0[112],intbuf_dout_muxed_0[133]};
assign	intpfail_n[7]  = ~^{intbuf_dout_muxed_0[7],  intbuf_dout_muxed_0[24], intbuf_dout_muxed_0[41], 
			    intbuf_dout_muxed_0[58], intbuf_dout_muxed_0[75], intbuf_dout_muxed_0[93], 
			    intbuf_dout_muxed_0[113],intbuf_dout_muxed_0[134]};
assign	intpfail_n[8]  = ~^{intbuf_dout_muxed_0[8],  intbuf_dout_muxed_0[25], intbuf_dout_muxed_0[42], 
			    intbuf_dout_muxed_0[59], intbuf_dout_muxed_0[76], intbuf_dout_muxed_0[94], 
			    intbuf_dout_muxed_0[135]};
assign	intpfail_n[9]  = ~^{intbuf_dout_muxed_0[9],  intbuf_dout_muxed_0[26], intbuf_dout_muxed_0[43], 
			    intbuf_dout_muxed_0[60], intbuf_dout_muxed_0[78], intbuf_dout_muxed_0[95], 
			    intbuf_dout_muxed_0[136]};
assign	intpfail_n[10] = ~^{intbuf_dout_muxed_0[10], intbuf_dout_muxed_0[27], intbuf_dout_muxed_0[44], 
			    intbuf_dout_muxed_0[61], intbuf_dout_muxed_0[79], intbuf_dout_muxed_0[96], 
			    intbuf_dout_muxed_0[137]};
assign	intpfail_n[11] = ~^{intbuf_dout_muxed_0[11], intbuf_dout_muxed_0[28], intbuf_dout_muxed_0[45], 
			    intbuf_dout_muxed_0[62], intbuf_dout_muxed_0[80], intbuf_dout_muxed_0[97], 
			    intbuf_dout_muxed_0[138]};
assign	intpfail_n[12] = ~^{intbuf_dout_muxed_0[12], intbuf_dout_muxed_0[29], intbuf_dout_muxed_0[46], 
			    intbuf_dout_muxed_0[63], intbuf_dout_muxed_0[81], intbuf_dout_muxed_0[98], 
			    intbuf_dout_muxed_0[139]};
assign	intpfail_n[13] = ~^{intbuf_dout_muxed_0[13], intbuf_dout_muxed_0[30], intbuf_dout_muxed_0[47], 
			    intbuf_dout_muxed_0[64], intbuf_dout_muxed_0[82], intbuf_dout_muxed_0[79], 
			    intbuf_dout_muxed_0[140]};
assign	intpfail_n[14] = ~^{intbuf_dout_muxed_0[14], intbuf_dout_muxed_0[31], intbuf_dout_muxed_0[48], 
			    intbuf_dout_muxed_0[65], intbuf_dout_muxed_0[83], intbuf_dout_muxed_0[100], 
			    intbuf_dout_muxed_0[141]};
assign	intpfail_n[15] = ~^{intbuf_dout_muxed_0[15], intbuf_dout_muxed_0[32], intbuf_dout_muxed_0[49], 
			    intbuf_dout_muxed_0[66], intbuf_dout_muxed_0[84], intbuf_dout_muxed_0[101], 
			    intbuf_dout_muxed_0[142]};
assign	intpfail_n[16] = ~^{intbuf_dout_muxed_0[16], intbuf_dout_muxed_0[33], intbuf_dout_muxed_0[50], 
			    intbuf_dout_muxed_0[67], intbuf_dout_muxed_0[85], intbuf_dout_muxed_0[105], 
			    intbuf_dout_muxed_0[143]};

assign	intbuf_dout_muxed[153:0] = { intbuf_dout_muxed_b[10:3], //1hot ecc cpuid
				    ~intbuf_dout_d1_ue_n,      //valid
				     intbuf_dout_muxed_a[144:137],
				     intbuf_dout_muxed_b[2:0],  //ecc thr
				     intbuf_dout_muxed_a[133:0] };

ncu_i2cfcd_ctl_msff_ctl_macro__en_1__width_154 intbuf_dout_d1_ff  
				(
				.scan_in(intbuf_dout_d1_ff_scanin),
				.scan_out(intbuf_dout_d1_ff_scanout),
				.dout		(intbuf_dout_d1[153:0]),
				.l1clk		(l1clk),
				.en		(intbuf_rd),
				.din		(intbuf_dout_muxed[153:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cfcd_ctl_msff_ctl_macro__en_1__width_1 intbuf_dout_d1_ue_ff  
				(
				.scan_in(intbuf_dout_d1_ue_ff_scanin),
				.scan_out(intbuf_dout_d1_ue_ff_scanout),
				.dout		(intbuf_dout_d1_ue),
				.l1clk		(l1clk),
				.en		(intbuf_rd),
				.din		(intbuf_dout_d1_ue_n),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cfcd_ctl_msff_ctl_macro__en_1__width_1 intbuf_dout_d1_pe_ff  
				(
				.scan_in(intbuf_dout_d1_pe_ff_scanin),
				.scan_out(intbuf_dout_d1_pe_ff_scanout),
				.dout		(intbuf_dout_d1_pe),
				.l1clk		(l1clk),
				.en		(intbuf_rd),
				.din		(|intpfail_n[16:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	intbuf_ue_vld_n = cmp_io_sync_en ? (intbuf_vld&(intbuf_dout_d1_ue|intbuf_dout_d1_pe) ) :
					   (intbuf_vld&(intbuf_dout_d1_ue|intbuf_dout_d1_pe) )|intbuf_ue_vld;
ncu_i2cfcd_ctl_msff_ctl_macro__width_1 intbuf_ue_vld_ff 
				(
				.scan_in(intbuf_ue_vld_ff_scanin),
				.scan_out(intbuf_ue_vld_ff_scanout),
				.dout		(intbuf_ue_vld),
				.l1clk		(l1clk),
				.din		(intbuf_ue_vld_n),
  .siclk(siclk),
  .soclk(soclk)
				);

//// signal for domain crossing ////
ncu_i2cfcd_ctl_msff_ctl_macro__en_1__width_1 intbuf_ue_f_ff  
				(
				.scan_in(intbuf_ue_f_ff_scanin),
				.scan_out(intbuf_ue_f_ff_scanout),
				.dout		(intbuf_ue_f),
				.l1clk		(l1clk),
				.en		(cmp_io_sync_en),
				.din		(intbuf_ue_vld),
  .siclk(siclk),
  .soclk(soclk)
				);

assign 	 {intbuf_cpx_req[7:0],
	  intbuf_cpx_data[145:0]} = intbuf_dout_d1[153:0];




//*******************************
// IO Buffer
//*******************************
// Assemble CPX req/data
// iobuf_dout[145:0]   return data
// iobuf_dout[153:146] cpu ID

ncu_i2cfcd_ctl_msff_ctl_macro__en_1__width_176 iobuf_pa_ff  
				(
				.scan_in(iobuf_pa_ff_scanin),
				.scan_out(iobuf_pa_ff_scanout),
				.dout		(iobuf_pa[175:0]),
				.l1clk		(l1clk),
				.en		(io_pa_ld),
				.din		(iobuf_dout[175:0]),
  .siclk(siclk),
  .soclk(soclk)
				);
assign	iobuf_dout_muxed_a[175:0] = io_pas ? iobuf_pa[175:0] : iobuf_dout[175:0] ;

ncu_i2cfcd_ctl_msff_ctl_macro__en_1__width_1 iobuf_uei_d1_ff 
				(
				.scan_in(iobuf_uei_d1_ff_scanin),
				.scan_out(iobuf_uei_d1_ff_scanout),
				.dout		(iobuf_uei_d1),
				.l1clk		(l1clk),
				.en		(io_cmp_sync_en),
				.din		(iobuf_uei),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	ioeccchk_ci[4:0] = {iobuf_dout_muxed_a[157:155],
			     iobuf_dout_muxed_a[154]^iobuf_uei_d1,
			     iobuf_dout_muxed_a[153]^iobuf_uei_d1};

ncu_eccchk11_ctl i2cfdioeccchk11 ( .din({iobuf_dout_muxed_a[152:145],iobuf_dout_muxed_a[136:134]}),
					.ci(ioeccchk_ci[4:0]),
					.ue(iobuf_dout_d1_ue_n),
					.ce(unused_iobufce),
					.dout(iobuf_dout_muxed_b[10:0]),
					.co(unused_iobufco[4:0]) );

assign	iopfail_n[0] = ~^{iobuf_dout_muxed_a[0],  iobuf_dout_muxed_a[18], iobuf_dout_muxed_a[36],
			  iobuf_dout_muxed_a[54], iobuf_dout_muxed_a[72], iobuf_dout_muxed_a[90], 
			  iobuf_dout_muxed_a[108],iobuf_dout_muxed_a[126],iobuf_dout_muxed_a[158]};
assign	iopfail_n[1] = ~^{iobuf_dout_muxed_a[1],  iobuf_dout_muxed_a[19], iobuf_dout_muxed_a[37],
			  iobuf_dout_muxed_a[53], iobuf_dout_muxed_a[73], iobuf_dout_muxed_a[91], 
			  iobuf_dout_muxed_a[109],iobuf_dout_muxed_a[127],iobuf_dout_muxed_a[159]};
assign	iopfail_n[2] = ~^{iobuf_dout_muxed_a[2],  iobuf_dout_muxed_a[20], iobuf_dout_muxed_a[38],
  			  iobuf_dout_muxed_a[56], iobuf_dout_muxed_a[14], iobuf_dout_muxed_a[92], 
			  iobuf_dout_muxed_a[110],iobuf_dout_muxed_a[128],iobuf_dout_muxed_a[160]};
assign	iopfail_n[3] = ~^{iobuf_dout_muxed_a[3],  iobuf_dout_muxed_a[21], iobuf_dout_muxed_a[39],
			  iobuf_dout_muxed_a[57], iobuf_dout_muxed_a[75], iobuf_dout_muxed_a[93], 
			  iobuf_dout_muxed_a[111],iobuf_dout_muxed_a[129],iobuf_dout_muxed_a[161]};
assign	iopfail_n[4] = ~^{iobuf_dout_muxed_a[4],  iobuf_dout_muxed_a[22], iobuf_dout_muxed_a[40],
			  iobuf_dout_muxed_a[58], iobuf_dout_muxed_a[76], iobuf_dout_muxed_a[94], 
			  iobuf_dout_muxed_a[112],iobuf_dout_muxed_a[130],iobuf_dout_muxed_a[162]};
assign	iopfail_n[5] = ~^{iobuf_dout_muxed_a[5],  iobuf_dout_muxed_a[23], iobuf_dout_muxed_a[41],
			  iobuf_dout_muxed_a[59], iobuf_dout_muxed_a[77], iobuf_dout_muxed_a[95], 
			  iobuf_dout_muxed_a[113],iobuf_dout_muxed_a[131],iobuf_dout_muxed_a[163]};
assign	iopfail_n[6] = ~^{iobuf_dout_muxed_a[6],  iobuf_dout_muxed_a[24], iobuf_dout_muxed_a[42],
			  iobuf_dout_muxed_a[60], iobuf_dout_muxed_a[78], iobuf_dout_muxed_a[96], 
			  iobuf_dout_muxed_a[114],iobuf_dout_muxed_a[132],iobuf_dout_muxed_a[164]};
assign	iopfail_n[7] = ~^{iobuf_dout_muxed_a[7],  iobuf_dout_muxed_a[25], iobuf_dout_muxed_a[43],
			  iobuf_dout_muxed_a[61], iobuf_dout_muxed_a[79], iobuf_dout_muxed_a[97], 
			  iobuf_dout_muxed_a[115],iobuf_dout_muxed_a[133],iobuf_dout_muxed_a[165]};
assign	iopfail_n[8] = ~^{iobuf_dout_muxed_a[8],  iobuf_dout_muxed_a[26], iobuf_dout_muxed_a[44],
			  iobuf_dout_muxed_a[61], iobuf_dout_muxed_a[82], iobuf_dout_muxed_a[98] ,
			  iobuf_dout_muxed_a[116],iobuf_dout_muxed_a[137],iobuf_dout_muxed_a[166]};
assign	iopfail_n[9] = ~^{iobuf_dout_muxed_a[9],  iobuf_dout_muxed_a[27], iobuf_dout_muxed_a[45],
			  iobuf_dout_muxed_a[63], iobuf_dout_muxed_a[81], iobuf_dout_muxed_a[99], 
			  iobuf_dout_muxed_a[117],iobuf_dout_muxed_a[138],iobuf_dout_muxed_a[167]};
assign	iopfail_n[10]= ~^{iobuf_dout_muxed_a[10], iobuf_dout_muxed_a[28], iobuf_dout_muxed_a[46],
			  iobuf_dout_muxed_a[64], iobuf_dout_muxed_a[82], iobuf_dout_muxed_a[100],
			  iobuf_dout_muxed_a[118],iobuf_dout_muxed_a[139],iobuf_dout_muxed_a[168]};
assign	iopfail_n[11]= ~^{iobuf_dout_muxed_a[11], iobuf_dout_muxed_a[29], iobuf_dout_muxed_a[47],
			  iobuf_dout_muxed_a[65], iobuf_dout_muxed_a[83], iobuf_dout_muxed_a[101],
			  iobuf_dout_muxed_a[119],iobuf_dout_muxed_a[140],iobuf_dout_muxed_a[169]};
assign	iopfail_n[12]= ~^{iobuf_dout_muxed_a[12], iobuf_dout_muxed_a[30], iobuf_dout_muxed_a[48],
			  iobuf_dout_muxed_a[66], iobuf_dout_muxed_a[84], iobuf_dout_muxed_a[102],
			  iobuf_dout_muxed_a[120],iobuf_dout_muxed_a[141],iobuf_dout_muxed_a[170]};
assign	iopfail_n[13]= ~^{iobuf_dout_muxed_a[13], iobuf_dout_muxed_a[31], iobuf_dout_muxed_a[49],
			  iobuf_dout_muxed_a[67], iobuf_dout_muxed_a[85], iobuf_dout_muxed_a[143],
			  iobuf_dout_muxed_a[131],iobuf_dout_muxed_a[142],iobuf_dout_muxed_a[171]};
assign	iopfail_n[14]= ~^{iobuf_dout_muxed_a[14], iobuf_dout_muxed_a[32], iobuf_dout_muxed_a[50],
			  iobuf_dout_muxed_a[68], iobuf_dout_muxed_a[86], iobuf_dout_muxed_a[104],
			  iobuf_dout_muxed_a[122],iobuf_dout_muxed_a[143],iobuf_dout_muxed_a[172]};
assign	iopfail_n[15]= ~^{iobuf_dout_muxed_a[15], iobuf_dout_muxed_a[23], iobuf_dout_muxed_a[51],
			  iobuf_dout_muxed_a[69], iobuf_dout_muxed_a[87], iobuf_dout_muxed_a[105],
			  iobuf_dout_muxed_a[123],iobuf_dout_muxed_a[144],iobuf_dout_muxed_a[173]};
assign	iopfail_n[16]= ~^{iobuf_dout_muxed_a[16], iobuf_dout_muxed_a[34], iobuf_dout_muxed_a[52],
			  iobuf_dout_muxed_a[70], iobuf_dout_muxed_a[88], iobuf_dout_muxed_a[106],
			  iobuf_dout_muxed_a[124],iobuf_dout_muxed_a[145],iobuf_dout_muxed_a[174]};
assign	iopfail_n[17]= ~^{iobuf_dout_muxed_a[17], iobuf_dout_muxed_a[35], iobuf_dout_muxed_a[53],
			  iobuf_dout_muxed_a[71], iobuf_dout_muxed_a[89], iobuf_dout_muxed_a[107],
			  iobuf_dout_muxed_a[125],iobuf_dout_muxed_a[175]}; 

assign	iobuf_dout_muxed[153:0] = { iobuf_dout_muxed_b[10:3], //1hot ecc cpuid
				    ~iobuf_dout_d1_ue_n,      //valid
				    iobuf_dout_muxed_a[144:137],
				    iobuf_dout_muxed_b[2:0],  //ecc thr
				    iobuf_dout_muxed_a[133:0] };

ncu_i2cfcd_ctl_msff_ctl_macro__en_1__width_154 iobuf_dout_d1_ff  
				(
				.scan_in(iobuf_dout_d1_ff_scanin),
				.scan_out(iobuf_dout_d1_ff_scanout),
				.dout		(iobuf_dout_d1[153:0]),
				.l1clk		(l1clk),
				.en		(iobuf_rd),
				.din		(iobuf_dout_muxed[153:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cfcd_ctl_msff_ctl_macro__en_1__width_1 iobuf_dout_d1_ue_ff  
				(
				.scan_in(iobuf_dout_d1_ue_ff_scanin),
				.scan_out(iobuf_dout_d1_ue_ff_scanout),
				.dout		(iobuf_dout_d1_ue),
				.l1clk		(l1clk),
				.en		(iobuf_rd),
				.din		(iobuf_dout_d1_ue_n),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cfcd_ctl_msff_ctl_macro__en_1__width_1 iobuf_dout_d1_pe_ff  
				(
				.scan_in(iobuf_dout_d1_pe_ff_scanin),
				.scan_out(iobuf_dout_d1_pe_ff_scanout),
				.dout		(iobuf_dout_d1_pe),
				.l1clk		(l1clk),
				.en		(iobuf_rd),
				.din		(|iopfail_n[17:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

//// hold for capturing new synd and ue ////
assign	iobuf_ue_vld_n = cmp_io_sync_en ? (iobuf_vld&(iobuf_dout_d1_ue|iobuf_dout_d1_pe) ) : 
					  (iobuf_vld&(iobuf_dout_d1_ue|iobuf_dout_d1_pe) )|iobuf_ue_vld;
ncu_i2cfcd_ctl_msff_ctl_macro__width_1 iobuf_ue_vld_ff 
				(
				.scan_in(iobuf_ue_vld_ff_scanin),
				.scan_out(iobuf_ue_vld_ff_scanout),
				.dout		(iobuf_ue_vld),
				.l1clk		(l1clk),
				.din		(iobuf_ue_vld_n),
  .siclk(siclk),
  .soclk(soclk)
				);

//// signal for domain crossing ////
ncu_i2cfcd_ctl_msff_ctl_macro__en_1__width_1 iobuf_ue_f_ff  
				(
				.scan_in(iobuf_ue_f_ff_scanin),
				.scan_out(iobuf_ue_f_ff_scanout),
				.dout		(iobuf_ue_f),
				.l1clk		(l1clk),
				.en		(cmp_io_sync_en),
				.din		(iobuf_ue_vld),
  .siclk(siclk),
  .soclk(soclk)
				);

assign 	 {iobuf_cpx_req[7:0],
	  iobuf_cpx_data[145:0]} = iobuf_dout_d1[153:0];
	  

/* spare gates, 12398 cells / 450 = 28 */
ncu_i2cfcd_ctl_spare_ctl_macro__num_11 spares  (
                .scan_in(spares_scanin),
                .scan_out(spares_scanout),
                .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );


/**** adding clock header ****/
ncu_i2cfcd_ctl_l1clkhdr_ctl_macro clkgen (
				.l2clk	(l2clk),
				.l1en	(1'b1),
				.l1clk	(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
				);

/*** building tcu port ***/
assign	siclk = tcu_aclk;
assign	soclk = tcu_bclk;
assign	   se = tcu_scan_en;
assign	pce_ov = tcu_pce_ov;
assign	stop = tcu_clk_stop;

// fixscan start:
//assign ncu_cpx_req_cq_ff_scanin  = scan_in                  ;
//assign ncu_cpx_data_cq_ff_scanin = ncu_cpx_req_cq_ff_scanout;
assign ncu_cpx_data_ca_ff_scanin = scan_in;
assign intbuf_pa_ff_scanin       = ncu_cpx_data_ca_ff_scanout;
assign intbuf_uei_d1_ff_scanin   = intbuf_pa_ff_scanout     ;
assign intbuf_dout_d1_ff_scanin  = intbuf_uei_d1_ff_scanout ;
assign intbuf_dout_d1_ue_ff_scanin = intbuf_dout_d1_ff_scanout;
assign intbuf_dout_d1_pe_ff_scanin = intbuf_dout_d1_ue_ff_scanout;
assign intbuf_ue_vld_ff_scanin   = intbuf_dout_d1_pe_ff_scanout;
assign intbuf_ue_f_ff_scanin     = intbuf_ue_vld_ff_scanout ;
assign iobuf_pa_ff_scanin        = intbuf_ue_f_ff_scanout   ;
assign iobuf_uei_d1_ff_scanin    = iobuf_pa_ff_scanout      ;
assign iobuf_dout_d1_ff_scanin   = iobuf_uei_d1_ff_scanout  ;
assign iobuf_dout_d1_ue_ff_scanin = iobuf_dout_d1_ff_scanout ;
assign iobuf_dout_d1_pe_ff_scanin = iobuf_dout_d1_ue_ff_scanout;
assign iobuf_ue_vld_ff_scanin    = iobuf_dout_d1_pe_ff_scanout;
assign iobuf_ue_f_ff_scanin      = iobuf_ue_vld_ff_scanout  ;
assign spares_scanin             = iobuf_ue_f_ff_scanout    ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule // i2c_fdp



// Local Variables:
// verilog-auto-sense-defines-constant:t
// End:







// any PARAMS parms go into naming of macro

module ncu_i2cfcd_ctl_msff_ctl_macro__width_146 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [145:0] fdin;
wire [144:0] so;

  input [145:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [145:0] dout;
  output scan_out;
assign fdin[145:0] = din[145:0];






dff #(146)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[145:0]),
.si({scan_in,so[144:0]}),
.so({so[144:0],scan_out}),
.q(dout[145:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_i2cfcd_ctl_msff_ctl_macro__en_1__width_144 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [143:0] fdin;
wire [142:0] so;

  input [143:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [143:0] dout;
  output scan_out;
assign fdin[143:0] = (din[143:0] & {144{en}}) | (dout[143:0] & ~{144{en}});






dff #(144)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[143:0]),
.si({scan_in,so[142:0]}),
.so({so[142:0],scan_out}),
.q(dout[143:0])
);












endmodule






// any PARAMS parms go into naming of macro

module ncu_i2cfcd_ctl_msff_ctl_macro__en_1__width_154 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [153:0] fdin;
wire [152:0] so;

  input [153:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [153:0] dout;
  output scan_out;
assign fdin[153:0] = (din[153:0] & {154{en}}) | (dout[153:0] & ~{154{en}});






dff #(154)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[153:0]),
.si({scan_in,so[152:0]}),
.so({so[152:0],scan_out}),
.q(dout[153:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_i2cfcd_ctl_msff_ctl_macro__en_1__width_176 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [175:0] fdin;
wire [174:0] so;

  input [175:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [175:0] dout;
  output scan_out;
assign fdin[175:0] = (din[175:0] & {176{en}}) | (dout[175:0] & ~{176{en}});






dff #(176)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[175:0]),
.si({scan_in,so[174:0]}),
.so({so[174:0],scan_out}),
.q(dout[175:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module ncu_i2cfcd_ctl_spare_ctl_macro__num_11 (
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
wire si_2;
wire so_2;
wire spare2_flop_unused;
wire spare2_buf_32x_unused;
wire spare2_nand3_8x_unused;
wire spare2_inv_8x_unused;
wire spare2_aoi22_4x_unused;
wire spare2_buf_8x_unused;
wire spare2_oai22_4x_unused;
wire spare2_inv_16x_unused;
wire spare2_nand2_16x_unused;
wire spare2_nor3_4x_unused;
wire spare2_nand2_8x_unused;
wire spare2_buf_16x_unused;
wire spare2_nor2_16x_unused;
wire spare2_inv_32x_unused;
wire si_3;
wire so_3;
wire spare3_flop_unused;
wire spare3_buf_32x_unused;
wire spare3_nand3_8x_unused;
wire spare3_inv_8x_unused;
wire spare3_aoi22_4x_unused;
wire spare3_buf_8x_unused;
wire spare3_oai22_4x_unused;
wire spare3_inv_16x_unused;
wire spare3_nand2_16x_unused;
wire spare3_nor3_4x_unused;
wire spare3_nand2_8x_unused;
wire spare3_buf_16x_unused;
wire spare3_nor2_16x_unused;
wire spare3_inv_32x_unused;
wire si_4;
wire so_4;
wire spare4_flop_unused;
wire spare4_buf_32x_unused;
wire spare4_nand3_8x_unused;
wire spare4_inv_8x_unused;
wire spare4_aoi22_4x_unused;
wire spare4_buf_8x_unused;
wire spare4_oai22_4x_unused;
wire spare4_inv_16x_unused;
wire spare4_nand2_16x_unused;
wire spare4_nor3_4x_unused;
wire spare4_nand2_8x_unused;
wire spare4_buf_16x_unused;
wire spare4_nor2_16x_unused;
wire spare4_inv_32x_unused;
wire si_5;
wire so_5;
wire spare5_flop_unused;
wire spare5_buf_32x_unused;
wire spare5_nand3_8x_unused;
wire spare5_inv_8x_unused;
wire spare5_aoi22_4x_unused;
wire spare5_buf_8x_unused;
wire spare5_oai22_4x_unused;
wire spare5_inv_16x_unused;
wire spare5_nand2_16x_unused;
wire spare5_nor3_4x_unused;
wire spare5_nand2_8x_unused;
wire spare5_buf_16x_unused;
wire spare5_nor2_16x_unused;
wire spare5_inv_32x_unused;
wire si_6;
wire so_6;
wire spare6_flop_unused;
wire spare6_buf_32x_unused;
wire spare6_nand3_8x_unused;
wire spare6_inv_8x_unused;
wire spare6_aoi22_4x_unused;
wire spare6_buf_8x_unused;
wire spare6_oai22_4x_unused;
wire spare6_inv_16x_unused;
wire spare6_nand2_16x_unused;
wire spare6_nor3_4x_unused;
wire spare6_nand2_8x_unused;
wire spare6_buf_16x_unused;
wire spare6_nor2_16x_unused;
wire spare6_inv_32x_unused;
wire si_7;
wire so_7;
wire spare7_flop_unused;
wire spare7_buf_32x_unused;
wire spare7_nand3_8x_unused;
wire spare7_inv_8x_unused;
wire spare7_aoi22_4x_unused;
wire spare7_buf_8x_unused;
wire spare7_oai22_4x_unused;
wire spare7_inv_16x_unused;
wire spare7_nand2_16x_unused;
wire spare7_nor3_4x_unused;
wire spare7_nand2_8x_unused;
wire spare7_buf_16x_unused;
wire spare7_nor2_16x_unused;
wire spare7_inv_32x_unused;
wire si_8;
wire so_8;
wire spare8_flop_unused;
wire spare8_buf_32x_unused;
wire spare8_nand3_8x_unused;
wire spare8_inv_8x_unused;
wire spare8_aoi22_4x_unused;
wire spare8_buf_8x_unused;
wire spare8_oai22_4x_unused;
wire spare8_inv_16x_unused;
wire spare8_nand2_16x_unused;
wire spare8_nor3_4x_unused;
wire spare8_nand2_8x_unused;
wire spare8_buf_16x_unused;
wire spare8_nor2_16x_unused;
wire spare8_inv_32x_unused;
wire si_9;
wire so_9;
wire spare9_flop_unused;
wire spare9_buf_32x_unused;
wire spare9_nand3_8x_unused;
wire spare9_inv_8x_unused;
wire spare9_aoi22_4x_unused;
wire spare9_buf_8x_unused;
wire spare9_oai22_4x_unused;
wire spare9_inv_16x_unused;
wire spare9_nand2_16x_unused;
wire spare9_nor3_4x_unused;
wire spare9_nand2_8x_unused;
wire spare9_buf_16x_unused;
wire spare9_nor2_16x_unused;
wire spare9_inv_32x_unused;
wire si_10;
wire so_10;
wire spare10_flop_unused;
wire spare10_buf_32x_unused;
wire spare10_nand3_8x_unused;
wire spare10_inv_8x_unused;
wire spare10_aoi22_4x_unused;
wire spare10_buf_8x_unused;
wire spare10_oai22_4x_unused;
wire spare10_inv_16x_unused;
wire spare10_nand2_16x_unused;
wire spare10_nor3_4x_unused;
wire spare10_nand2_8x_unused;
wire spare10_buf_16x_unused;
wire spare10_nor2_16x_unused;
wire spare10_inv_32x_unused;


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

cl_sc1_msff_8x spare2_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_2),
                               .so(so_2),
                               .d(1'b0),
                               .q(spare2_flop_unused));
assign si_2 = so_1;

cl_u1_buf_32x   spare2_buf_32x (.in(1'b1),
                                   .out(spare2_buf_32x_unused));
cl_u1_nand3_8x spare2_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare2_nand3_8x_unused));
cl_u1_inv_8x    spare2_inv_8x (.in(1'b1),
                                  .out(spare2_inv_8x_unused));
cl_u1_aoi22_4x spare2_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_aoi22_4x_unused));
cl_u1_buf_8x    spare2_buf_8x (.in(1'b1),
                                  .out(spare2_buf_8x_unused));
cl_u1_oai22_4x spare2_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_oai22_4x_unused));
cl_u1_inv_16x   spare2_inv_16x (.in(1'b1),
                                   .out(spare2_inv_16x_unused));
cl_u1_nand2_16x spare2_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare2_nand2_16x_unused));
cl_u1_nor3_4x spare2_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare2_nor3_4x_unused));
cl_u1_nand2_8x spare2_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare2_nand2_8x_unused));
cl_u1_buf_16x   spare2_buf_16x (.in(1'b1),
                                   .out(spare2_buf_16x_unused));
cl_u1_nor2_16x spare2_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare2_nor2_16x_unused));
cl_u1_inv_32x   spare2_inv_32x (.in(1'b1),
                                   .out(spare2_inv_32x_unused));

cl_sc1_msff_8x spare3_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_3),
                               .so(so_3),
                               .d(1'b0),
                               .q(spare3_flop_unused));
assign si_3 = so_2;

cl_u1_buf_32x   spare3_buf_32x (.in(1'b1),
                                   .out(spare3_buf_32x_unused));
cl_u1_nand3_8x spare3_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare3_nand3_8x_unused));
cl_u1_inv_8x    spare3_inv_8x (.in(1'b1),
                                  .out(spare3_inv_8x_unused));
cl_u1_aoi22_4x spare3_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_aoi22_4x_unused));
cl_u1_buf_8x    spare3_buf_8x (.in(1'b1),
                                  .out(spare3_buf_8x_unused));
cl_u1_oai22_4x spare3_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_oai22_4x_unused));
cl_u1_inv_16x   spare3_inv_16x (.in(1'b1),
                                   .out(spare3_inv_16x_unused));
cl_u1_nand2_16x spare3_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare3_nand2_16x_unused));
cl_u1_nor3_4x spare3_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare3_nor3_4x_unused));
cl_u1_nand2_8x spare3_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare3_nand2_8x_unused));
cl_u1_buf_16x   spare3_buf_16x (.in(1'b1),
                                   .out(spare3_buf_16x_unused));
cl_u1_nor2_16x spare3_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare3_nor2_16x_unused));
cl_u1_inv_32x   spare3_inv_32x (.in(1'b1),
                                   .out(spare3_inv_32x_unused));

cl_sc1_msff_8x spare4_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_4),
                               .so(so_4),
                               .d(1'b0),
                               .q(spare4_flop_unused));
assign si_4 = so_3;

cl_u1_buf_32x   spare4_buf_32x (.in(1'b1),
                                   .out(spare4_buf_32x_unused));
cl_u1_nand3_8x spare4_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare4_nand3_8x_unused));
cl_u1_inv_8x    spare4_inv_8x (.in(1'b1),
                                  .out(spare4_inv_8x_unused));
cl_u1_aoi22_4x spare4_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_aoi22_4x_unused));
cl_u1_buf_8x    spare4_buf_8x (.in(1'b1),
                                  .out(spare4_buf_8x_unused));
cl_u1_oai22_4x spare4_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_oai22_4x_unused));
cl_u1_inv_16x   spare4_inv_16x (.in(1'b1),
                                   .out(spare4_inv_16x_unused));
cl_u1_nand2_16x spare4_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare4_nand2_16x_unused));
cl_u1_nor3_4x spare4_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare4_nor3_4x_unused));
cl_u1_nand2_8x spare4_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare4_nand2_8x_unused));
cl_u1_buf_16x   spare4_buf_16x (.in(1'b1),
                                   .out(spare4_buf_16x_unused));
cl_u1_nor2_16x spare4_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare4_nor2_16x_unused));
cl_u1_inv_32x   spare4_inv_32x (.in(1'b1),
                                   .out(spare4_inv_32x_unused));

cl_sc1_msff_8x spare5_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_5),
                               .so(so_5),
                               .d(1'b0),
                               .q(spare5_flop_unused));
assign si_5 = so_4;

cl_u1_buf_32x   spare5_buf_32x (.in(1'b1),
                                   .out(spare5_buf_32x_unused));
cl_u1_nand3_8x spare5_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare5_nand3_8x_unused));
cl_u1_inv_8x    spare5_inv_8x (.in(1'b1),
                                  .out(spare5_inv_8x_unused));
cl_u1_aoi22_4x spare5_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_aoi22_4x_unused));
cl_u1_buf_8x    spare5_buf_8x (.in(1'b1),
                                  .out(spare5_buf_8x_unused));
cl_u1_oai22_4x spare5_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_oai22_4x_unused));
cl_u1_inv_16x   spare5_inv_16x (.in(1'b1),
                                   .out(spare5_inv_16x_unused));
cl_u1_nand2_16x spare5_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare5_nand2_16x_unused));
cl_u1_nor3_4x spare5_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare5_nor3_4x_unused));
cl_u1_nand2_8x spare5_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare5_nand2_8x_unused));
cl_u1_buf_16x   spare5_buf_16x (.in(1'b1),
                                   .out(spare5_buf_16x_unused));
cl_u1_nor2_16x spare5_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare5_nor2_16x_unused));
cl_u1_inv_32x   spare5_inv_32x (.in(1'b1),
                                   .out(spare5_inv_32x_unused));

cl_sc1_msff_8x spare6_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_6),
                               .so(so_6),
                               .d(1'b0),
                               .q(spare6_flop_unused));
assign si_6 = so_5;

cl_u1_buf_32x   spare6_buf_32x (.in(1'b1),
                                   .out(spare6_buf_32x_unused));
cl_u1_nand3_8x spare6_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare6_nand3_8x_unused));
cl_u1_inv_8x    spare6_inv_8x (.in(1'b1),
                                  .out(spare6_inv_8x_unused));
cl_u1_aoi22_4x spare6_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare6_aoi22_4x_unused));
cl_u1_buf_8x    spare6_buf_8x (.in(1'b1),
                                  .out(spare6_buf_8x_unused));
cl_u1_oai22_4x spare6_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare6_oai22_4x_unused));
cl_u1_inv_16x   spare6_inv_16x (.in(1'b1),
                                   .out(spare6_inv_16x_unused));
cl_u1_nand2_16x spare6_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare6_nand2_16x_unused));
cl_u1_nor3_4x spare6_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare6_nor3_4x_unused));
cl_u1_nand2_8x spare6_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare6_nand2_8x_unused));
cl_u1_buf_16x   spare6_buf_16x (.in(1'b1),
                                   .out(spare6_buf_16x_unused));
cl_u1_nor2_16x spare6_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare6_nor2_16x_unused));
cl_u1_inv_32x   spare6_inv_32x (.in(1'b1),
                                   .out(spare6_inv_32x_unused));

cl_sc1_msff_8x spare7_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_7),
                               .so(so_7),
                               .d(1'b0),
                               .q(spare7_flop_unused));
assign si_7 = so_6;

cl_u1_buf_32x   spare7_buf_32x (.in(1'b1),
                                   .out(spare7_buf_32x_unused));
cl_u1_nand3_8x spare7_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare7_nand3_8x_unused));
cl_u1_inv_8x    spare7_inv_8x (.in(1'b1),
                                  .out(spare7_inv_8x_unused));
cl_u1_aoi22_4x spare7_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_aoi22_4x_unused));
cl_u1_buf_8x    spare7_buf_8x (.in(1'b1),
                                  .out(spare7_buf_8x_unused));
cl_u1_oai22_4x spare7_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_oai22_4x_unused));
cl_u1_inv_16x   spare7_inv_16x (.in(1'b1),
                                   .out(spare7_inv_16x_unused));
cl_u1_nand2_16x spare7_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare7_nand2_16x_unused));
cl_u1_nor3_4x spare7_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare7_nor3_4x_unused));
cl_u1_nand2_8x spare7_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare7_nand2_8x_unused));
cl_u1_buf_16x   spare7_buf_16x (.in(1'b1),
                                   .out(spare7_buf_16x_unused));
cl_u1_nor2_16x spare7_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare7_nor2_16x_unused));
cl_u1_inv_32x   spare7_inv_32x (.in(1'b1),
                                   .out(spare7_inv_32x_unused));

cl_sc1_msff_8x spare8_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_8),
                               .so(so_8),
                               .d(1'b0),
                               .q(spare8_flop_unused));
assign si_8 = so_7;

cl_u1_buf_32x   spare8_buf_32x (.in(1'b1),
                                   .out(spare8_buf_32x_unused));
cl_u1_nand3_8x spare8_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare8_nand3_8x_unused));
cl_u1_inv_8x    spare8_inv_8x (.in(1'b1),
                                  .out(spare8_inv_8x_unused));
cl_u1_aoi22_4x spare8_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_aoi22_4x_unused));
cl_u1_buf_8x    spare8_buf_8x (.in(1'b1),
                                  .out(spare8_buf_8x_unused));
cl_u1_oai22_4x spare8_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_oai22_4x_unused));
cl_u1_inv_16x   spare8_inv_16x (.in(1'b1),
                                   .out(spare8_inv_16x_unused));
cl_u1_nand2_16x spare8_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare8_nand2_16x_unused));
cl_u1_nor3_4x spare8_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare8_nor3_4x_unused));
cl_u1_nand2_8x spare8_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare8_nand2_8x_unused));
cl_u1_buf_16x   spare8_buf_16x (.in(1'b1),
                                   .out(spare8_buf_16x_unused));
cl_u1_nor2_16x spare8_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare8_nor2_16x_unused));
cl_u1_inv_32x   spare8_inv_32x (.in(1'b1),
                                   .out(spare8_inv_32x_unused));

cl_sc1_msff_8x spare9_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_9),
                               .so(so_9),
                               .d(1'b0),
                               .q(spare9_flop_unused));
assign si_9 = so_8;

cl_u1_buf_32x   spare9_buf_32x (.in(1'b1),
                                   .out(spare9_buf_32x_unused));
cl_u1_nand3_8x spare9_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare9_nand3_8x_unused));
cl_u1_inv_8x    spare9_inv_8x (.in(1'b1),
                                  .out(spare9_inv_8x_unused));
cl_u1_aoi22_4x spare9_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_aoi22_4x_unused));
cl_u1_buf_8x    spare9_buf_8x (.in(1'b1),
                                  .out(spare9_buf_8x_unused));
cl_u1_oai22_4x spare9_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_oai22_4x_unused));
cl_u1_inv_16x   spare9_inv_16x (.in(1'b1),
                                   .out(spare9_inv_16x_unused));
cl_u1_nand2_16x spare9_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare9_nand2_16x_unused));
cl_u1_nor3_4x spare9_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare9_nor3_4x_unused));
cl_u1_nand2_8x spare9_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare9_nand2_8x_unused));
cl_u1_buf_16x   spare9_buf_16x (.in(1'b1),
                                   .out(spare9_buf_16x_unused));
cl_u1_nor2_16x spare9_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare9_nor2_16x_unused));
cl_u1_inv_32x   spare9_inv_32x (.in(1'b1),
                                   .out(spare9_inv_32x_unused));

cl_sc1_msff_8x spare10_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_10),
                               .so(so_10),
                               .d(1'b0),
                               .q(spare10_flop_unused));
assign si_10 = so_9;

cl_u1_buf_32x   spare10_buf_32x (.in(1'b1),
                                   .out(spare10_buf_32x_unused));
cl_u1_nand3_8x spare10_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare10_nand3_8x_unused));
cl_u1_inv_8x    spare10_inv_8x (.in(1'b1),
                                  .out(spare10_inv_8x_unused));
cl_u1_aoi22_4x spare10_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare10_aoi22_4x_unused));
cl_u1_buf_8x    spare10_buf_8x (.in(1'b1),
                                  .out(spare10_buf_8x_unused));
cl_u1_oai22_4x spare10_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare10_oai22_4x_unused));
cl_u1_inv_16x   spare10_inv_16x (.in(1'b1),
                                   .out(spare10_inv_16x_unused));
cl_u1_nand2_16x spare10_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare10_nand2_16x_unused));
cl_u1_nor3_4x spare10_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare10_nor3_4x_unused));
cl_u1_nand2_8x spare10_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare10_nand2_8x_unused));
cl_u1_buf_16x   spare10_buf_16x (.in(1'b1),
                                   .out(spare10_buf_16x_unused));
cl_u1_nor2_16x spare10_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare10_nor2_16x_unused));
cl_u1_inv_32x   spare10_inv_32x (.in(1'b1),
                                   .out(spare10_inv_32x_unused));
assign scan_out = so_10;



endmodule

