// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_l2t_dp_32x160_cust.v
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
module n2_l2t_dp_32x160_cust (
  din, 
  rd_adr1, 
  rd_adr2, 
  sel_rdaddr1, 
  wr_adr, 
  read_en, 
  wr_en, 
  word_wen, 
  tcu_array_wr_inhibit, 
  l2clk, 
  scan_in, 
  tcu_se_scancollar_in, 
  tcu_pce_ov, 
  pce, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  dout, 
  scan_out);
wire siclk;
wire soclk;
wire stop;
wire pce_ov;
wire l1clk;
wire ff_wdata_0_scanin;
wire ff_wdata_0_scanout;
wire [159:0] wrdata_d1;
wire ff_wdata_1_scanin;
wire ff_wdata_1_scanout;
wire ff_wr_en_scanin;
wire ff_wr_en_scanout;
wire wr_en_d1;
wire ff_wr_adr_scanin;
wire ff_wr_adr_scanout;
wire [4:0] wrptr_d1;
wire ff_read_enable_scanin;
wire ff_read_enable_scanout;
wire ff_read_enable0_unused;
wire ff_read_enable1_unused;
wire ff_read_enable2_unused;
wire ren_d1;
wire ff_word_wen_scanin;
wire ff_word_wen_scanout;
wire [3:0] word_wen_d1;
wire sel_rdaddr1_n;
wire ff_read_addr_scanin;
wire ff_read_addr_scanout;
wire [4:0] rdptr_d1;
wire [4:0] ff_read_addr_mq_l_unused;
wire [4:0] ff_read_addr_q_unused;
wire [4:0] ff_read_addr_q_l_unused;
 

input [159:0]   din; // data input
input [4:0]     rd_adr1;   // read addr1 
input [4:0]     rd_adr2;   // read addr2 
input	  	sel_rdaddr1; // sel read addr1
input [4:0] 	wr_adr;  // write addr
input          	read_en;  
input	  	wr_en ;	//   used in conjunction with
     			//  word_wen and byte_wen 
input [3:0]     word_wen; // word enables ( if you don't use these
     			    // tie them to Vdd )
input	  	tcu_array_wr_inhibit; // used to gate off write during scan.
input          	l2clk;
input          	scan_in; 
input	  	tcu_se_scancollar_in; // hold scan in data.
input 	  	tcu_pce_ov;
input		pce;
input 		tcu_aclk;
input 		tcu_bclk;
input 		tcu_scan_en;

output [159:0] 	dout;
output         	scan_out;

// JDL 05/17/07
// synopsys translate_off

wire 	[4:0] 	rd_adr_mux_out;
wire		and_clk;


// scan chain connections ////
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign stop = 1'b0;
assign pce_ov = tcu_pce_ov;

//// Input Flops /////

n2_l2t_dp_32x160_cust_l1clkhdr_ctl_macro      clkgen_andclk
        (
        .l2clk  (l2clk  ),
        .l1en   (pce    ),
        .pce_ov (pce_ov ),
        .stop   (stop   ),
        .se     (tcu_scan_en),
        .l1clk  (and_clk  )
        );

n2_l2t_dp_32x160_cust_l1clkhdr_ctl_macro      clkgen_clk_en
        (
        .l2clk  (l2clk  ),
        .l1en   (pce    ),
        .pce_ov (pce_ov ),
        .stop   (stop   ),
        .se     (tcu_se_scancollar_in),
        .l1clk  (l1clk  )
        );

n2_l2t_dp_32x160_cust_msff_ctl_macro__scanreverse_1__width_80 ff_wdata_0     
	(
        .scan_in(ff_wdata_0_scanin),
        .scan_out(ff_wdata_0_scanout),
        .l1clk(l1clk),
        .din(din[79:0]),
        .dout(wrdata_d1[79:0]),
  .siclk(siclk),
  .soclk(soclk)
        );

n2_l2t_dp_32x160_cust_msff_ctl_macro__scanreverse_1__width_80 ff_wdata_1     
	(
        .scan_in(ff_wdata_1_scanin),
        .scan_out(ff_wdata_1_scanout),
        .l1clk(l1clk),
        .din(din[159:80]),
        .dout(wrdata_d1[159:80]),
  .siclk(siclk),
  .soclk(soclk)
        );

n2_l2t_dp_32x160_cust_msff_ctl_macro__width_1 ff_wr_en    (
        .scan_in(ff_wr_en_scanin),
        .scan_out(ff_wr_en_scanout),
        .l1clk(l1clk),
        .din(wr_en),
        .dout(wr_en_d1),
  .siclk(siclk),
  .soclk(soclk)
        );


n2_l2t_dp_32x160_cust_msff_ctl_macro__scanreverse_1__width_5 ff_wr_adr     (
        .scan_in(ff_wr_adr_scanin),
        .scan_out(ff_wr_adr_scanout),
        .l1clk(l1clk),
        .din(wr_adr[4:0]),
        .dout(wrptr_d1[4:0]),
  .siclk(siclk),
  .soclk(soclk)
        );

n2_l2t_dp_32x160_cust_sram_msff_mo_macro__width_1 ff_read_enable  
         (
         .scan_in(ff_read_enable_scanin),
         .scan_out(ff_read_enable_scanout),
         .l1clk(l1clk),
         .and_clk(and_clk),
         .d(read_en),
	 .q(ff_read_enable0_unused),
	 .q_l(ff_read_enable1_unused),
	 .mq_l(ff_read_enable2_unused),
         .mq(ren_d1),
  .siclk(siclk),
  .soclk(soclk)
         );

n2_l2t_dp_32x160_cust_msff_ctl_macro__scanreverse_1__width_4 ff_word_wen     
	(
         .scan_in(ff_word_wen_scanin),
         .scan_out(ff_word_wen_scanout),
         .l1clk(l1clk),
         .din(word_wen[3:0]),
         .dout(word_wen_d1[3:0]),
  .siclk(siclk),
  .soclk(soclk)
        );

n2_l2t_dp_32x160_cust_inv_macro__width_1 sel_rdaddr1_inv    
	(
        .din(sel_rdaddr1),
        .dout(sel_rdaddr1_n)
        );

n2_l2t_dp_32x160_cust_mux_macro__mux_aonpe__ports_2__width_5 mux_rd_addr 
        (
	.dout (rd_adr_mux_out[4:0]),
        .din0  (rd_adr1[4:0]),    
	.sel0 (sel_rdaddr1),
        .din1  (rd_adr2[4:0]),  
	.sel1 (sel_rdaddr1_n)
        ) ;

n2_l2t_dp_32x160_cust_sram_msff_mo_macro__scanreverse_1__width_5 ff_read_addr   
         (
         .scan_in(ff_read_addr_scanin),
         .scan_out(ff_read_addr_scanout),
         .l1clk(l1clk),
         .and_clk(and_clk),
         .d(rd_adr_mux_out[4:0]),
         .mq(rdptr_d1[4:0]),
	 .mq_l(ff_read_addr_mq_l_unused[4:0]),
	 .q(ff_read_addr_q_unused[4:0]),
	 .q_l(ff_read_addr_q_l_unused[4:0]),
  .siclk(siclk),
  .soclk(soclk)
         );


 /// Memory array ////

  
n2_l2t_dp_32x160_cust_array array (
                .l1clk (and_clk),
                .wr_en (wr_en_d1),
                .rd_en (ren_d1), 
                .wr_addr(wrptr_d1[4:0]),
                .rd_addr(rdptr_d1[4:0]),
                .din(wrdata_d1[159:0]),
                .dout(dout[159:0]),
                .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
                .word_wen(word_wen_d1[3:0])
                 );

// fixscan start:
assign ff_wdata_0_scanin         = scan_in                  ;
assign ff_word_wen_scanin        = ff_wdata_0_scanout       ;
assign ff_wr_en_scanin           = ff_word_wen_scanout      ;
assign ff_wr_adr_scanin          = ff_wr_en_scanout         ;
assign ff_read_addr_scanin       = ff_wr_adr_scanout        ;
assign ff_read_enable_scanin     = ff_read_addr_scanout     ;
assign ff_wdata_1_scanin         = ff_read_enable_scanout   ;
assign scan_out                  = ff_wdata_1_scanout       ;

// fixscan end:

// JDL 05/17/07
// synopsys translate_on

endmodule


module n2_l2t_dp_32x160_cust_array (
  l1clk, 
  wr_en, 
  rd_en, 
  tcu_array_wr_inhibit, 
  word_wen, 
  wr_addr, 
  rd_addr, 
  din, 
  dout);
wire write_disable;


input 		l1clk;
input 		wr_en;
input 		rd_en;
input 		tcu_array_wr_inhibit;
input [3:0] 	word_wen;
input [4:0] 	wr_addr;
input [4:0] 	rd_addr;
input [159:0] 	din;
output [159:0] 	dout;


assign write_disable = tcu_array_wr_inhibit;
//assign read_disable = tcu_array_wr_inhibit;












// local signals
reg [159:0] dout;
// memory array
reg [159:0]  inq_ary [31:0];

// internal variable

integer      rd_i;
integer      wr_i;

reg [159:0]  temp, tmp_dout;
reg [159:0]   data_in;



`ifndef NOINITMEM
// Emulate reset
integer j1;
initial begin
  for (j1=0; j1<32; j1=j1+1) begin
   inq_ary [j1] = {160{1'b0}};
  end
end
`endif


/////////////////////////////////////////////////////////////////////////////////
// Read Operation
/////////////////////////////////////////////////////////////////////////////////

always @(rd_addr or rd_en or tmp_dout or write_disable or word_wen or wr_en or wr_addr or l1clk)
begin
    if(l1clk) begin

     if (rd_en & ~write_disable)
        begin
	 for(rd_i=0; rd_i< 160; rd_i=rd_i+4) 
	
	 begin
		tmp_dout =  inq_ary[rd_addr] ;

		if((rd_addr == wr_addr)) begin
	 		dout[rd_i] =   ( word_wen[0] & wr_en & ~write_disable )? 
					1'bx : tmp_dout[rd_i] ;
	 		dout[rd_i+1] = ( word_wen[1] & wr_en & ~write_disable )? 
                                               1'bx : tmp_dout[rd_i+1] ;
	 		dout[rd_i+2] = ( word_wen[2] & wr_en & ~write_disable )? 
                                               1'bx : tmp_dout[rd_i+2] ;
	 		dout[rd_i+3] = ( word_wen[3] & wr_en & ~write_disable )? 
                                               1'bx : tmp_dout[rd_i+3] ;
		end

		else begin
			dout[rd_i]   = tmp_dout[rd_i] ;
			dout[rd_i+1] = tmp_dout[rd_i+1] ;
			dout[rd_i+2] = tmp_dout[rd_i+2] ;
			dout[rd_i+3] = tmp_dout[rd_i+3] ;
		end
	 end  // for
        end   // rd_en if
       else 
	 dout  = 160'h0;
    end // l1clk if
end  // always




/////////////////////////////////////////////////////////////////////////////////
// Write Operation
/////////////////////////////////////////////////////////////////////////////////

always @(write_disable or word_wen or wr_en or din or wr_addr or temp or l1clk)
begin
	if(wr_en & ~write_disable & ~l1clk)   
		begin
		temp 	   =  inq_ary[wr_addr];
		for (wr_i=0; wr_i<160; wr_i=wr_i+4) 
			begin
			data_in[wr_i] = ( word_wen[0] & wr_en & ~write_disable ) ? 
						din[wr_i] : temp[wr_i] ;
			data_in[wr_i+1] = ( word_wen[1] & wr_en & ~write_disable ) ? 
						din[wr_i+1] : temp[wr_i+1] ;
			data_in[wr_i+2] = ( word_wen[2] & wr_en & ~write_disable ) ? 
						din[wr_i+2] : temp[wr_i+2] ;
			data_in[wr_i+3] = ( word_wen[3] & wr_en & ~write_disable ) ? 
							din[wr_i+3] : temp[wr_i+3] ;
     			end
     			inq_ary[wr_addr] = data_in ;
		end
end // always @ (...



endmodule // rf_32x160









// any PARAMS parms go into naming of macro

module n2_l2t_dp_32x160_cust_l1clkhdr_ctl_macro (
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













// any PARAMS parms go into naming of macro

module n2_l2t_dp_32x160_cust_msff_ctl_macro__scanreverse_1__width_80 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [79:0] fdin;
wire [0:78] so;

  input [79:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [79:0] dout;
  output scan_out;
assign fdin[79:0] = din[79:0];






dff #(80)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[79:0]),
.si({so[0:78],scan_in}),
.so({scan_out,so[0:78]}),
.q(dout[79:0])
);












endmodule













// any PARAMS parms go into naming of macro

module n2_l2t_dp_32x160_cust_msff_ctl_macro__width_1 (
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

module n2_l2t_dp_32x160_cust_msff_ctl_macro__scanreverse_1__width_5 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [0:3] so;

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
.si({so[0:3],scan_in}),
.so({scan_out,so[0:3]}),
.q(dout[4:0])
);












endmodule









//
//   macro for cl_mc1_sram_msff_mo_{16,8,4}x flops
//
//





module n2_l2t_dp_32x160_cust_sram_msff_mo_macro__width_1 (
  d, 
  scan_in, 
  l1clk, 
  and_clk, 
  siclk, 
  soclk, 
  mq, 
  mq_l, 
  scan_out, 
  q, 
  q_l);
input [0:0] d;
  input scan_in;
input l1clk;
input and_clk;
input siclk;
input soclk;
output [0:0] mq;
output [0:0] mq_l;
  output scan_out;
output [0:0] q;
output [0:0] q_l;






new_dlata #(1)  d0_0 (
.d(d[0:0]),
.si(scan_in),
.so(scan_out),
.l1clk(l1clk),
.and_clk(and_clk),
.siclk(siclk),
.soclk(soclk),
.q(q[0:0]),
.q_l(q_l[0:0]),
.mq(mq[0:0]),
.mq_l(mq_l[0:0])
);










//place::generic_place($width,$stack,$left);

endmodule









// any PARAMS parms go into naming of macro

module n2_l2t_dp_32x160_cust_msff_ctl_macro__scanreverse_1__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [0:2] so;

  input [3:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0];






dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si({so[0:2],scan_in}),
.so({scan_out,so[0:2]}),
.q(dout[3:0])
);












endmodule









//
//   invert macro
//
//





module n2_l2t_dp_32x160_cust_inv_macro__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module n2_l2t_dp_32x160_cust_mux_macro__mux_aonpe__ports_2__width_5 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [4:0] din0;
  input sel0;
  input [4:0] din1;
  input sel1;
  output [4:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(5)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[4:0]),
  .in1(din1[4:0]),
.dout(dout[4:0])
);









  



endmodule


//
//   macro for cl_mc1_sram_msff_mo_{16,8,4}x flops
//
//





module n2_l2t_dp_32x160_cust_sram_msff_mo_macro__scanreverse_1__width_5 (
  d, 
  scan_in, 
  l1clk, 
  and_clk, 
  siclk, 
  soclk, 
  mq, 
  mq_l, 
  scan_out, 
  q, 
  q_l);
wire [0:3] so;

input [4:0] d;
  input scan_in;
input l1clk;
input and_clk;
input siclk;
input soclk;
output [4:0] mq;
output [4:0] mq_l;
  output scan_out;
output [4:0] q;
output [4:0] q_l;






new_dlata #(5)  d0_0 (
.d(d[4:0]),
.si({so[0:3],scan_in}),
.so({scan_out,so[0:3]}),
.l1clk(l1clk),
.and_clk(and_clk),
.siclk(siclk),
.soclk(soclk),
.q(q[4:0]),
.q_l(q_l[4:0]),
.mq(mq[4:0]),
.mq_l(mq_l[4:0])
);










//place::generic_place($width,$stack,$left);

endmodule




