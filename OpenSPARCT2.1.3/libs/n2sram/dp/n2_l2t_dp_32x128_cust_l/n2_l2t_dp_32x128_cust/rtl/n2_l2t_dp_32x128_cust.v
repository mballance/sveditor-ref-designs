// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_l2t_dp_32x128_cust.v
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
module n2_l2t_dp_32x128_cust (
  din, 
  rd_wl, 
  wr_wl, 
  read_en, 
  wr_en, 
  tcu_array_wr_inhibit, 
  l2clk, 
  scan_in, 
  tcu_se_scancollar_in, 
  tcu_scan_en, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_pce_ov, 
  pce, 
  dout, 
  scan_out) ;
wire siclk;
wire soclk;
wire stop;
wire pce_ov;
wire l1clk;
wire l1clk_mem;
wire ff_wdata_0_scanin;
wire ff_wdata_0_scanout;
wire [127:0] wrdata_d1;
wire ff_wdata_1_scanin;
wire ff_wdata_1_scanout;
wire ff_wr_en_scanin;
wire ff_wr_en_scanout;
wire wr_en_d1;
wire ff_wr_wl_scanin;
wire ff_wr_wl_scanout;
wire [31:0] wr_wl_d1;
wire ff_ren_scanin;
wire ff_ren_scanout;
wire ff_ren0_unused;
wire ff_ren1_unused;
wire ff_ren2_unused;
wire ren_d1;
wire ff_rd_wl_scanin;
wire ff_rd_wl_scanout;
wire [31:0] rd_wl_d1;


input [127:0]  	din; 		// data input
input [31:0]    rd_wl;   	// read addr 
input [31:0]	wr_wl;  	// write addr
input          	read_en;  
input	  	wr_en;		//   used in conjunction with
     				//  word_wen and byte_wen 
input	  	tcu_array_wr_inhibit ; 	// gates off writes during SCAN.
input          	l2clk;
input          	scan_in; 

input	  	tcu_se_scancollar_in; // hold scan in data.
input	  	tcu_scan_en; // hold scan in data.
input          	tcu_aclk;
input          	tcu_bclk;

input          	tcu_pce_ov;
input          	pce;



output [127:0] 	dout;
output         	scan_out;

// JDL 05/17/07
// synopsys translate_off

wire   [127:0] dout_array;

assign dout[127:0] = dout_array[127:0];

// scan chain connections ////
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign stop  = 1'b0;
assign pce_ov = tcu_pce_ov;

//// Input Flops /////
n2_l2t_dp_32x128_cust_l1clkhdr_ctl_macro	clkgen_clk_en
	(
	.l2clk	(l2clk	),
	.l1en	(pce	),
	.pce_ov (pce_ov	),
	.stop	(stop	),
	.se	(tcu_se_scancollar_in),
	.l1clk	(l1clk	)
	);

n2_l2t_dp_32x128_cust_l1clkhdr_ctl_macro      clkgen_clk_en0
        (
        .l2clk  (l2clk  ),
        .l1en   (pce    ),
        .pce_ov (pce_ov ),
        .stop   (stop   ),
        .se     (tcu_scan_en),
        .l1clk  (l1clk_mem  )
        );




n2_l2t_dp_32x128_cust_msff_ctl_macro__scanreverse_1__width_64 ff_wdata_0     
	(
	.scan_in(ff_wdata_0_scanin),
	.scan_out(ff_wdata_0_scanout),
	.l1clk(l1clk),
	.din(din[63:0]),
	.dout(wrdata_d1[63:0]),
  .siclk(siclk),
  .soclk(soclk)
	);

n2_l2t_dp_32x128_cust_msff_ctl_macro__scanreverse_1__width_64 ff_wdata_1  
	(
        .scan_in(ff_wdata_1_scanin),
        .scan_out(ff_wdata_1_scanout),
        .l1clk(l1clk),
        .din(din[127:64]),
        .dout(wrdata_d1[127:64]),
  .siclk(siclk),
  .soclk(soclk)
        );


n2_l2t_dp_32x128_cust_msff_ctl_macro__width_1 ff_wr_en  
	 (
         .scan_in(ff_wr_en_scanin),
         .scan_out(ff_wr_en_scanout),
         .l1clk(l1clk),
         .din(wr_en),
         .dout(wr_en_d1),
  .siclk(siclk),
  .soclk(soclk)
         );


n2_l2t_dp_32x128_cust_msff_ctl_macro__width_32 ff_wr_wl  
	 (
          .scan_in(ff_wr_wl_scanin),
          .scan_out(ff_wr_wl_scanout),
          .l1clk(l1clk),
          .din(wr_wl[31:0]),
	  .dout(wr_wl_d1[31:0]),
  .siclk(siclk),
  .soclk(soclk)
         );


n2_l2t_dp_32x128_cust_sram_msff_mo_macro__width_1 ff_ren  
	 (
         .scan_in(ff_ren_scanin),
         .scan_out(ff_ren_scanout),
         .l1clk(l1clk),
	 .and_clk(l1clk_mem),
	 .q(ff_ren0_unused),
	 .q_l(ff_ren1_unused),
	 .mq_l(ff_ren2_unused),
         .d(read_en),
         .mq(ren_d1),
  .siclk(siclk),
  .soclk(soclk)
         );


n2_l2t_dp_32x128_cust_msff_ctl_macro__width_32 ff_rd_wl  
	 (
         .scan_in(ff_rd_wl_scanin),
         .scan_out(ff_rd_wl_scanout),
         .l1clk(l1clk),
         .din(rd_wl[31:0]),
         .dout(rd_wl_d1[31:0]),
  .siclk(siclk),
  .soclk(soclk)
         );


//msff_ctl_macro ff_tcu_array_wr_inhibit (width=1)
//	(  // not a real flop ( only used as a trigger ). Works only for accesses made in PH1
//        .scan_in(ff_tcu_se_scanin),
//        .scan_out(ff_tcu_se_scanout),
//        .l1clk(l1clk),
//        .din(tcu_array_wr_inhibit),
//        .dout(tcu_se_d1)
//        );
//

/// Memory array ////

n2_l2t_dp_32x128_cust_array array (
                .wr_en (wr_en_d1),
		.rd_en (ren_d1),
		.l1clk (l1clk_mem),
                .wr_addr(wr_wl_d1[31:0]),
                .rd_addr(rd_wl_d1[31:0]),
                .din(wrdata_d1[127:0]),
                .dout(dout_array[127:0]),
                .write_disable(tcu_array_wr_inhibit)
                 );

// fixscan start:
assign ff_wr_en_scanin           = scan_in       	;
assign ff_ren_scanin             = ff_wr_en_scanout	;
assign ff_rd_wl_scanin           = ff_ren_scanout	;
assign ff_wr_wl_scanin           = ff_rd_wl_scanout	;
assign ff_wdata_0_scanin         = ff_wr_wl_scanout	;
assign ff_wdata_1_scanin         = ff_wdata_0_scanout	;
assign scan_out          	 = ff_wdata_1_scanout	;
//assign scan_out			 = ff_tcu_se_scanout	;
// fixscan end:

// synopsys translate_on

endmodule
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//		ARRAY MODELLING					    //
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////


module n2_l2t_dp_32x128_cust_array (
  wr_en, 
  rd_en, 
  l1clk, 
  wr_addr, 
  rd_addr, 
  write_disable, 
  din, 
  dout) ;

input 		wr_en;
input 		rd_en;
input 		l1clk;
input 	[31:0] 	wr_addr;
input 	[31:0] 	rd_addr;
input 		write_disable;
input 	[127:0] din;

output 	[127:0] dout;

// memory array
reg [127:0]  	inq_ary [31:0];
// internal variable
reg 	[127:0] temp; 
reg	[127:0]	data_in;
reg 	[4:0]   rdptr_d1; 
reg	[4:0]	wrptr_d1;
reg 	[127:0] dout;

reg 	[127:0] rd_data;

`ifndef NOINITMEM
// Emulate reset
integer i;
initial begin
  for (i=0; i<32; i=i+1) begin
   inq_ary[i] = {128{1'b0}};
  end
end
`endif

 















//////////////////////////////////////////////////////////////////////
// Read Operation
//////////////////////////////////////////////////////////////////////


always @(rd_addr or rd_en or write_disable or wr_en or wr_addr or l1clk)
begin


	// ---- \/ added the write_disable qual on 11/11 \/------
           if (l1clk )  begin

             if (rd_en & ~write_disable) begin  

		case(rd_addr & {32{~write_disable}})
          		32'b0000_0000_0000_0000_0000_0000_0000_0000: ;  // do nothing
          		32'b0000_0000_0000_0000_0000_0000_0000_0001: rdptr_d1     = 5'b00000;
          		32'b0000_0000_0000_0000_0000_0000_0000_0010: rdptr_d1     = 5'b00001;
          		32'b0000_0000_0000_0000_0000_0000_0000_0100: rdptr_d1     = 5'b00010;
          		32'b0000_0000_0000_0000_0000_0000_0000_1000: rdptr_d1     = 5'b00011;
          		32'b0000_0000_0000_0000_0000_0000_0001_0000: rdptr_d1     = 5'b00100;
          		32'b0000_0000_0000_0000_0000_0000_0010_0000: rdptr_d1     = 5'b00101;
          		32'b0000_0000_0000_0000_0000_0000_0100_0000: rdptr_d1     = 5'b00110;
          		32'b0000_0000_0000_0000_0000_0000_1000_0000: rdptr_d1     = 5'b00111;
          		32'b0000_0000_0000_0000_0000_0001_0000_0000: rdptr_d1     = 5'b01000;
          		32'b0000_0000_0000_0000_0000_0010_0000_0000: rdptr_d1     = 5'b01001;
          		32'b0000_0000_0000_0000_0000_0100_0000_0000: rdptr_d1     = 5'b01010;
          		32'b0000_0000_0000_0000_0000_1000_0000_0000: rdptr_d1     = 5'b01011;
          		32'b0000_0000_0000_0000_0001_0000_0000_0000: rdptr_d1     = 5'b01100;
          		32'b0000_0000_0000_0000_0010_0000_0000_0000: rdptr_d1     = 5'b01101;
          		32'b0000_0000_0000_0000_0100_0000_0000_0000: rdptr_d1     = 5'b01110;
          		32'b0000_0000_0000_0000_1000_0000_0000_0000: rdptr_d1     = 5'b01111;
          		32'b0000_0000_0000_0001_0000_0000_0000_0000: rdptr_d1     = 5'b10000;
          		32'b0000_0000_0000_0010_0000_0000_0000_0000: rdptr_d1     = 5'b10001;
          		32'b0000_0000_0000_0100_0000_0000_0000_0000: rdptr_d1     = 5'b10010;
          		32'b0000_0000_0000_1000_0000_0000_0000_0000: rdptr_d1     = 5'b10011;
          		32'b0000_0000_0001_0000_0000_0000_0000_0000: rdptr_d1     = 5'b10100;
          		32'b0000_0000_0010_0000_0000_0000_0000_0000: rdptr_d1     = 5'b10101;
          		32'b0000_0000_0100_0000_0000_0000_0000_0000: rdptr_d1     = 5'b10110;
          		32'b0000_0000_1000_0000_0000_0000_0000_0000: rdptr_d1     = 5'b10111;
          		32'b0000_0001_0000_0000_0000_0000_0000_0000: rdptr_d1     = 5'b11000;
          		32'b0000_0010_0000_0000_0000_0000_0000_0000: rdptr_d1     = 5'b11001;
          		32'b0000_0100_0000_0000_0000_0000_0000_0000: rdptr_d1     = 5'b11010;
          		32'b0000_1000_0000_0000_0000_0000_0000_0000: rdptr_d1     = 5'b11011;
          		32'b0001_0000_0000_0000_0000_0000_0000_0000: rdptr_d1     = 5'b11100;
          		32'b0010_0000_0000_0000_0000_0000_0000_0000: rdptr_d1     = 5'b11101;
          		32'b0100_0000_0000_0000_0000_0000_0000_0000: rdptr_d1     = 5'b11110;
          		32'b1000_0000_0000_0000_0000_0000_0000_0000: rdptr_d1     = 5'b11111;
         		default: rdptr_d1 = 5'bx ; 
       		endcase
                      rd_data = inq_ary[rdptr_d1];
                      dout = rd_data;

                end 
                //else      
                      //dout[127:0] = 128'h0 ;
            end  //l1clk
end // always @ (...


//////////////////////////////////////////////////////////////////////
// Write Operation
//////////////////////////////////////////////////////////////////////
always @ (write_disable or wr_en or wr_addr or din or l1clk)
begin


	//`ifdef  INNO_MUXEX
		if((wr_en==1'bx) & ~l1clk) 
		begin
			// do nothing
		end
	//`endif
	 	else if(wr_en & ~write_disable & ~l1clk)  
		begin
			case(wr_addr)
		          32'b0000_0000_0000_0000_0000_0000_0000_0000: ;  // do nothing
		          32'b0000_0000_0000_0000_0000_0000_0000_0001: wrptr_d1     = 5'b00000;
		          32'b0000_0000_0000_0000_0000_0000_0000_0010: wrptr_d1     = 5'b00001;
		          32'b0000_0000_0000_0000_0000_0000_0000_0100: wrptr_d1     = 5'b00010;
		          32'b0000_0000_0000_0000_0000_0000_0000_1000: wrptr_d1     = 5'b00011;
		          32'b0000_0000_0000_0000_0000_0000_0001_0000: wrptr_d1     = 5'b00100;
		          32'b0000_0000_0000_0000_0000_0000_0010_0000: wrptr_d1     = 5'b00101;
		          32'b0000_0000_0000_0000_0000_0000_0100_0000: wrptr_d1     = 5'b00110;
		          32'b0000_0000_0000_0000_0000_0000_1000_0000: wrptr_d1     = 5'b00111;
		          32'b0000_0000_0000_0000_0000_0001_0000_0000: wrptr_d1     = 5'b01000;
		          32'b0000_0000_0000_0000_0000_0010_0000_0000: wrptr_d1     = 5'b01001;
		          32'b0000_0000_0000_0000_0000_0100_0000_0000: wrptr_d1     = 5'b01010;
		          32'b0000_0000_0000_0000_0000_1000_0000_0000: wrptr_d1     = 5'b01011;
		          32'b0000_0000_0000_0000_0001_0000_0000_0000: wrptr_d1     = 5'b01100;
		          32'b0000_0000_0000_0000_0010_0000_0000_0000: wrptr_d1     = 5'b01101;
		          32'b0000_0000_0000_0000_0100_0000_0000_0000: wrptr_d1     = 5'b01110;
		          32'b0000_0000_0000_0000_1000_0000_0000_0000: wrptr_d1     = 5'b01111;
		          32'b0000_0000_0000_0001_0000_0000_0000_0000: wrptr_d1     = 5'b10000;
		          32'b0000_0000_0000_0010_0000_0000_0000_0000: wrptr_d1     = 5'b10001;
		          32'b0000_0000_0000_0100_0000_0000_0000_0000: wrptr_d1     = 5'b10010;
		          32'b0000_0000_0000_1000_0000_0000_0000_0000: wrptr_d1     = 5'b10011;
		          32'b0000_0000_0001_0000_0000_0000_0000_0000: wrptr_d1     = 5'b10100;
		          32'b0000_0000_0010_0000_0000_0000_0000_0000: wrptr_d1     = 5'b10101;
		          32'b0000_0000_0100_0000_0000_0000_0000_0000: wrptr_d1     = 5'b10110;
		          32'b0000_0000_1000_0000_0000_0000_0000_0000: wrptr_d1     = 5'b10111;
		          32'b0000_0001_0000_0000_0000_0000_0000_0000: wrptr_d1     = 5'b11000;
		          32'b0000_0010_0000_0000_0000_0000_0000_0000: wrptr_d1     = 5'b11001;
		          32'b0000_0100_0000_0000_0000_0000_0000_0000: wrptr_d1     = 5'b11010;
		          32'b0000_1000_0000_0000_0000_0000_0000_0000: wrptr_d1     = 5'b11011;
		          32'b0001_0000_0000_0000_0000_0000_0000_0000: wrptr_d1     = 5'b11100;
		          32'b0010_0000_0000_0000_0000_0000_0000_0000: wrptr_d1     = 5'b11101;
		          32'b0100_0000_0000_0000_0000_0000_0000_0000: wrptr_d1     = 5'b11110;
		          32'b1000_0000_0000_0000_0000_0000_0000_0000: wrptr_d1     = 5'b11111;
          		  default:  wrptr_d1= 5'bx ; 
			endcase
			//`ifdef  INNO_MUXEX
			      if(wr_addr!=32'b0)
             			inq_ary[wrptr_d1] = din ;
			//`else
	 		else   
			begin
		       if(wr_addr!=32'b0)
             			inq_ary[wrptr_d1] = din ;
         		end
			//`endif
	 	end	
	 	else  
		begin
			// do nothing
	 	end	

end // always @ (...

endmodule // rf_32x128d






// any PARAMS parms go into naming of macro

module n2_l2t_dp_32x128_cust_l1clkhdr_ctl_macro (
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

module n2_l2t_dp_32x128_cust_msff_ctl_macro__scanreverse_1__width_64 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [63:0] fdin;
wire [0:62] so;

  input [63:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [63:0] dout;
  output scan_out;
assign fdin[63:0] = din[63:0];






dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[63:0]),
.si({so[0:62],scan_in}),
.so({scan_out,so[0:62]}),
.q(dout[63:0])
);












endmodule













// any PARAMS parms go into naming of macro

module n2_l2t_dp_32x128_cust_msff_ctl_macro__width_1 (
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

module n2_l2t_dp_32x128_cust_msff_ctl_macro__width_32 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = din[31:0];






dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);












endmodule









//
//   macro for cl_mc1_sram_msff_mo_{16,8,4}x flops
//
//





module n2_l2t_dp_32x128_cust_sram_msff_mo_macro__width_1 (
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




