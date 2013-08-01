
////////////////////////////////////////////////////////////////////////////////
// $Id: n2_arf_dp_16x128_cust.v,v 1.1.1.1 2007/02/13 22:19:31 drp Exp $
//
//  Copyright (C) 2003 by Sun Microsystems, Inc.
//
//  All rights reserved. No part of this design may be reproduced,
//  stored in a retrieval system, or transmitted, in any form or by
//  any means, electronic, mechanical, photocopying, recording, or
//  otherwise, without prior written permission of Sun Microsystems,
//  Inc.
//
//  Sun Proprietary/Confidential
//
//  Description:        SPU AES Key Register File
//			    - 16 entry, 128-bit with a two bit interleave
//			    - 1 Read
//			    - 1 Write 
//			        + no write bypassing necessary (internal or external)
//			        + 64-bit writeable with 64-bit write data
//			    - Logically holds up to 60 32-bit keys
//
//
// 			The 128-bits are interleaved in such a way so the output
// 			will match the 64-bit datapath below.
//
// 			Datapath ->     63           62                 1          0
// 			Array    -> [127],[63]   [126],[62]   ...   [65],[1]   [64],[0]
//
//
//  Primary Contact:    christopher.olson@sun.com
////////////////////////////////////////////////////////////////////////////////


module n2_arf_dp_16x128_cust (
  l2clk, 
  scan_in, 
  pce, 
  tcu_pce_ov, 
  tcu_array_wr_inhibit, 
  tcu_se_scancollar_in, 
  tcu_scan_en, 
  tcu_aclk, 
  tcu_bclk, 
  clken, 
  rd_addr, 
  rd_enable, 
  wr_addr, 
  wr_data, 
  wr_enable, 
  arf_rd_data, 
  scan_out);
wire siclk;
wire soclk;
wire l1clk;
wire [31:0] i_wr_data_ff0_scanin;
wire [31:0] i_wr_data_ff0_scanout;
wire [63:0] wr_data_ff;
wire [3:0] i_wr_addr_ff_scanin;
wire [3:0] i_wr_addr_ff_scanout;
wire [3:0] wr_addr_ff;
wire [1:0] i_wr_en_ff_scanin;
wire [1:0] i_wr_en_ff_scanout;
wire [1:0] wr_enable_ff;
wire [4:0] i_rd_ff_scanin;
wire [4:0] i_rd_ff_scanout;
wire l1clk_free;
wire [3:0] rd_addr_ff;
wire rd_enable_ff;
wire [4:0] rd_lat_l_unused;
wire [4:0] rd_dout_l_unused;
wire [4:0] rd_dout_unused;
wire [31:0] i_wr_data_ff1_scanin;
wire [31:0] i_wr_data_ff1_scanout;


input		l2clk;
input		scan_in;
input		pce;
input		tcu_pce_ov;

input		tcu_array_wr_inhibit;
input		tcu_se_scancollar_in;
input		tcu_scan_en;
input		tcu_aclk;
input		tcu_bclk;
input		clken;
input   [3:0]	rd_addr;
input		rd_enable;
input   [3:0]	wr_addr;
input  [63:0]	wr_data;
input   [1:0]	wr_enable;

output [127:0]	arf_rd_data;

output          scan_out;



assign siclk	= tcu_aclk;
assign soclk	= tcu_bclk;


n2_arf_dp_16x128_cust_l1clkhdr_ctl_macro	clkgen (
  .l2clk  (l2clk          		),
  .l1en   (clken			),
  .pce_ov (tcu_pce_ov			),
  .stop   (1'b0				),
  .se	  (tcu_se_scancollar_in		),
  .l1clk  (l1clk			));



n2_arf_dp_16x128_cust_msff_ctl_macro__fs_1__scanreverse_1__width_32	i_wr_data_ff0		 (
     .scan_in(i_wr_data_ff0_scanin[31:0]),
     .scan_out(i_wr_data_ff0_scanout[31:0]),
  .l1clk( l1clk						),
  .din  ( wr_data[31:0]					),
  .dout ( wr_data_ff[31:0]				),
  .siclk(siclk),
  .soclk(soclk));


n2_arf_dp_16x128_cust_msff_ctl_macro__fs_1__scanreverse_1__width_4	i_wr_addr_ff		 (
     .scan_in(i_wr_addr_ff_scanin[3:0]),
     .scan_out(i_wr_addr_ff_scanout[3:0]),
  .l1clk( l1clk						),
  .din  ( wr_addr[3:0]					),
  .dout ( wr_addr_ff[3:0]				),
  .siclk(siclk),
  .soclk(soclk));


n2_arf_dp_16x128_cust_msff_ctl_macro__fs_1__scanreverse_1__width_2	i_wr_en_ff		 (
     .scan_in(i_wr_en_ff_scanin[1:0]),
     .scan_out(i_wr_en_ff_scanout[1:0]),
  .l1clk( l1clk						),
  .din  ( wr_enable[1:0]				),
  .dout ( wr_enable_ff[1:0]				),
  .siclk(siclk),
  .soclk(soclk));


n2_arf_dp_16x128_cust_sram_msff_mo_macro__fs_1__scanreverse_1__width_5	i_rd_ff		 (
     .scan_in(i_rd_ff_scanin[4:0]),
     .scan_out(i_rd_ff_scanout[4:0]),
  .l1clk   ( l1clk					),
  .and_clk ( l1clk_free					),
  .d       ({rd_addr[3:0]    , rd_enable}		),
  .mq      ({rd_addr_ff[3:0] , rd_enable_ff}		),
  .mq_l    ( rd_lat_l_unused[4:0]			),
  .q_l     ( rd_dout_l_unused[4:0]			),
  .q       ( rd_dout_unused[4:0]			),
  .siclk(siclk),
  .soclk(soclk));


n2_arf_dp_16x128_cust_msff_ctl_macro__fs_1__scanreverse_1__width_32	i_wr_data_ff1		 (
     .scan_in(i_wr_data_ff1_scanin[31:0]),
     .scan_out(i_wr_data_ff1_scanout[31:0]),
  .l1clk( l1clk						),
  .din  ( wr_data[63:32]				),
  .dout ( wr_data_ff[63:32]				),
  .siclk(siclk),
  .soclk(soclk));




// L2 clock "free-running" clock
n2_arf_dp_16x128_cust_l1clkhdr_ctl_macro	clkgen_free (
  .l2clk  (l2clk			),
  .l1en   (pce				),
  .pce_ov (tcu_pce_ov			),
  .stop	  (1'b0				),
  .se	  (tcu_scan_en			),
  .l1clk  (l1clk_free			));


lib_16x64b_1r1w_array	arf_array0			(
  .clk		( l1clk_free				),
  .rd_addr	( rd_addr_ff[3:0]			),
  .rd_en	( rd_enable_ff				),
  .wr_addr	( wr_addr_ff[3:0]			),
  .wr_en	( wr_enable_ff[0]			),
  .din		( wr_data_ff[63:0]			),
  .dout		( arf_rd_data[63:0]			),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit));



lib_16x64b_1r1w_array	arf_array1			(
  .clk		( l1clk_free				),
  .rd_addr	( rd_addr_ff[3:0]			),
  .rd_en	( rd_enable_ff				),
  .wr_addr	( wr_addr_ff[3:0]			),
  .wr_en	( wr_enable_ff[1]			),
  .din		( wr_data_ff[63:0]			),
  .dout		( arf_rd_data[127:64]			),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit));





supply0 vss;
supply1 vdd;





// scanorder start
//      i_wr_data_ff0_scanin[0:31]
//      i_wr_addr_ff_scanin[0:3]
//      i_wr_en_ff_scanin[0:1]
//      i_rd_ff_scanin[0:4]
//      i_wr_data_ff1_scanin[0:31]
// scanorder end
// fixscan start
assign i_wr_data_ff0_scanin[0]=scan_in;
assign i_wr_data_ff0_scanin[1]=i_wr_data_ff0_scanout[0];
assign i_wr_data_ff0_scanin[2]=i_wr_data_ff0_scanout[1];
assign i_wr_data_ff0_scanin[3]=i_wr_data_ff0_scanout[2];
assign i_wr_data_ff0_scanin[4]=i_wr_data_ff0_scanout[3];
assign i_wr_data_ff0_scanin[5]=i_wr_data_ff0_scanout[4];
assign i_wr_data_ff0_scanin[6]=i_wr_data_ff0_scanout[5];
assign i_wr_data_ff0_scanin[7]=i_wr_data_ff0_scanout[6];
assign i_wr_data_ff0_scanin[8]=i_wr_data_ff0_scanout[7];
assign i_wr_data_ff0_scanin[9]=i_wr_data_ff0_scanout[8];
assign i_wr_data_ff0_scanin[10]=i_wr_data_ff0_scanout[9];
assign i_wr_data_ff0_scanin[11]=i_wr_data_ff0_scanout[10];
assign i_wr_data_ff0_scanin[12]=i_wr_data_ff0_scanout[11];
assign i_wr_data_ff0_scanin[13]=i_wr_data_ff0_scanout[12];
assign i_wr_data_ff0_scanin[14]=i_wr_data_ff0_scanout[13];
assign i_wr_data_ff0_scanin[15]=i_wr_data_ff0_scanout[14];
assign i_wr_data_ff0_scanin[16]=i_wr_data_ff0_scanout[15];
assign i_wr_data_ff0_scanin[17]=i_wr_data_ff0_scanout[16];
assign i_wr_data_ff0_scanin[18]=i_wr_data_ff0_scanout[17];
assign i_wr_data_ff0_scanin[19]=i_wr_data_ff0_scanout[18];
assign i_wr_data_ff0_scanin[20]=i_wr_data_ff0_scanout[19];
assign i_wr_data_ff0_scanin[21]=i_wr_data_ff0_scanout[20];
assign i_wr_data_ff0_scanin[22]=i_wr_data_ff0_scanout[21];
assign i_wr_data_ff0_scanin[23]=i_wr_data_ff0_scanout[22];
assign i_wr_data_ff0_scanin[24]=i_wr_data_ff0_scanout[23];
assign i_wr_data_ff0_scanin[25]=i_wr_data_ff0_scanout[24];
assign i_wr_data_ff0_scanin[26]=i_wr_data_ff0_scanout[25];
assign i_wr_data_ff0_scanin[27]=i_wr_data_ff0_scanout[26];
assign i_wr_data_ff0_scanin[28]=i_wr_data_ff0_scanout[27];
assign i_wr_data_ff0_scanin[29]=i_wr_data_ff0_scanout[28];
assign i_wr_data_ff0_scanin[30]=i_wr_data_ff0_scanout[29];
assign i_wr_data_ff0_scanin[31]=i_wr_data_ff0_scanout[30];
assign i_wr_addr_ff_scanin[0]=i_wr_data_ff0_scanout[31];
assign i_wr_addr_ff_scanin[1]=i_wr_addr_ff_scanout[0];
assign i_wr_addr_ff_scanin[2]=i_wr_addr_ff_scanout[1];
assign i_wr_addr_ff_scanin[3]=i_wr_addr_ff_scanout[2];
assign i_wr_en_ff_scanin[0]=i_wr_addr_ff_scanout[3];
assign i_wr_en_ff_scanin[1]=i_wr_en_ff_scanout[0];
assign i_rd_ff_scanin[0]=i_wr_en_ff_scanout[1];
assign i_rd_ff_scanin[1]=i_rd_ff_scanout[0];
assign i_rd_ff_scanin[2]=i_rd_ff_scanout[1];
assign i_rd_ff_scanin[3]=i_rd_ff_scanout[2];
assign i_rd_ff_scanin[4]=i_rd_ff_scanout[3];
assign i_wr_data_ff1_scanin[0]=i_rd_ff_scanout[4];
assign i_wr_data_ff1_scanin[1]=i_wr_data_ff1_scanout[0];
assign i_wr_data_ff1_scanin[2]=i_wr_data_ff1_scanout[1];
assign i_wr_data_ff1_scanin[3]=i_wr_data_ff1_scanout[2];
assign i_wr_data_ff1_scanin[4]=i_wr_data_ff1_scanout[3];
assign i_wr_data_ff1_scanin[5]=i_wr_data_ff1_scanout[4];
assign i_wr_data_ff1_scanin[6]=i_wr_data_ff1_scanout[5];
assign i_wr_data_ff1_scanin[7]=i_wr_data_ff1_scanout[6];
assign i_wr_data_ff1_scanin[8]=i_wr_data_ff1_scanout[7];
assign i_wr_data_ff1_scanin[9]=i_wr_data_ff1_scanout[8];
assign i_wr_data_ff1_scanin[10]=i_wr_data_ff1_scanout[9];
assign i_wr_data_ff1_scanin[11]=i_wr_data_ff1_scanout[10];
assign i_wr_data_ff1_scanin[12]=i_wr_data_ff1_scanout[11];
assign i_wr_data_ff1_scanin[13]=i_wr_data_ff1_scanout[12];
assign i_wr_data_ff1_scanin[14]=i_wr_data_ff1_scanout[13];
assign i_wr_data_ff1_scanin[15]=i_wr_data_ff1_scanout[14];
assign i_wr_data_ff1_scanin[16]=i_wr_data_ff1_scanout[15];
assign i_wr_data_ff1_scanin[17]=i_wr_data_ff1_scanout[16];
assign i_wr_data_ff1_scanin[18]=i_wr_data_ff1_scanout[17];
assign i_wr_data_ff1_scanin[19]=i_wr_data_ff1_scanout[18];
assign i_wr_data_ff1_scanin[20]=i_wr_data_ff1_scanout[19];
assign i_wr_data_ff1_scanin[21]=i_wr_data_ff1_scanout[20];
assign i_wr_data_ff1_scanin[22]=i_wr_data_ff1_scanout[21];
assign i_wr_data_ff1_scanin[23]=i_wr_data_ff1_scanout[22];
assign i_wr_data_ff1_scanin[24]=i_wr_data_ff1_scanout[23];
assign i_wr_data_ff1_scanin[25]=i_wr_data_ff1_scanout[24];
assign i_wr_data_ff1_scanin[26]=i_wr_data_ff1_scanout[25];
assign i_wr_data_ff1_scanin[27]=i_wr_data_ff1_scanout[26];
assign i_wr_data_ff1_scanin[28]=i_wr_data_ff1_scanout[27];
assign i_wr_data_ff1_scanin[29]=i_wr_data_ff1_scanout[28];
assign i_wr_data_ff1_scanin[30]=i_wr_data_ff1_scanout[29];
assign i_wr_data_ff1_scanin[31]=i_wr_data_ff1_scanout[30];
assign scan_out=i_wr_data_ff1_scanout[31];
// fixscan end
endmodule






// any PARAMS parms go into naming of macro

module n2_arf_dp_16x128_cust_l1clkhdr_ctl_macro (
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

module n2_arf_dp_16x128_cust_msff_ctl_macro__fs_1__scanreverse_1__width_32 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;

  input [31:0] din;
  input l1clk;
  input [31:0] scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output [31:0] scan_out;
assign fdin[31:0] = din[31:0];






dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31:0]),
.si(scan_in[31:0]),
.so(scan_out[31:0]),
.q(dout[31:0])
);












endmodule













// any PARAMS parms go into naming of macro

module n2_arf_dp_16x128_cust_msff_ctl_macro__fs_1__scanreverse_1__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;

  input [3:0] din;
  input l1clk;
  input [3:0] scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output [3:0] scan_out;
assign fdin[3:0] = din[3:0];






dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si(scan_in[3:0]),
.so(scan_out[3:0]),
.q(dout[3:0])
);












endmodule













// any PARAMS parms go into naming of macro

module n2_arf_dp_16x128_cust_msff_ctl_macro__fs_1__scanreverse_1__width_2 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;

  input [1:0] din;
  input l1clk;
  input [1:0] scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output [1:0] scan_out;
assign fdin[1:0] = din[1:0];






dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1:0]),
.si(scan_in[1:0]),
.so(scan_out[1:0]),
.q(dout[1:0])
);












endmodule









//
//   macro for cl_mc1_sram_msff_mo_{16,8,4}x flops
//
//





module n2_arf_dp_16x128_cust_sram_msff_mo_macro__fs_1__scanreverse_1__width_5 (
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
input [4:0] d;
  input [4:0] scan_in;
input l1clk;
input and_clk;
input siclk;
input soclk;
output [4:0] mq;
output [4:0] mq_l;
  output [4:0] scan_out;
output [4:0] q;
output [4:0] q_l;






new_dlata #(5)  d0_0 (
.d(d[4:0]),
.si(scan_in[4:0]),
.so(scan_out[4:0]),
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





////////////////////////////////////////////////////////////////////////////////
// $Id: n2_arf_dp_16x128_cust.v,v 1.1.1.1 2007/02/13 22:19:31 drp Exp $
//
//  Copyright (C) 2003 by Sun Microsystems, Inc.
//
//  All rights reserved. No part of this design may be reproduced,
//  stored in a retrieval system, or transmitted, in any form or by
//  any means, electronic, mechanical, photocopying, recording, or
//  otherwise, without prior written permission of Sun Microsystems,
//  Inc.
//
//  Sun Proprietary/Confidential
//
//  Description:        16 x 64 dual port array
//			read produces X's on read/write collision
//		
//			To produce a debussy dump of memory contents, 
//			add -vcs_run_args=+DUMPMEM_16x64 to sims command line
//
//  Primary Contact:    Chris Olson
////////////////////////////////////////////////////////////////////////////////

module lib_16x64b_1r1w_array (
  clk, 
  tcu_array_wr_inhibit, 
  rd_addr, 
  rd_en, 
  wr_en, 
  wr_addr, 
  din, 
  dout);
wire rd_enable;
wire wr_enable;
wire rd_eq_wr;
	

input		clk;
input		tcu_array_wr_inhibit;
input	[3:0]	rd_addr;
input		rd_en;
input		wr_en;
input	[3:0]	wr_addr;

input	[63:0]	din;
output	[63:0]	dout;


reg	[63:0]	mem[15:0];
reg	[63:0]	local_dout;

`ifndef NOINITMEM
integer i;
initial begin
  for (i=0; i<16; i=i+1) begin
    mem[i]	= {64{1'b0}}; 
  end
  local_dout	= {64{1'b0}};
end
`endif


assign rd_enable	= rd_en & ~tcu_array_wr_inhibit;
assign wr_enable	= wr_en & ~tcu_array_wr_inhibit;
assign rd_eq_wr		= wr_en & (rd_addr[3:0] == wr_addr[3:0]);

//////////////////////
// Read/write array
//////////////////////

always @ (clk or rd_enable or rd_addr or rd_eq_wr) begin
  if (clk) begin

	if (rd_enable)
	  begin
	    if(rd_eq_wr)	local_dout[63:0] <= {64{1'bx}};		// Read = Write conflict
	    else		local_dout[63:0] <= mem[rd_addr];	// Normal Read
	  end
	else			local_dout[63:0] <= {64{1'b0}};		// Precharge

  end	// CLK
end	// ALWAYS



always @ (negedge clk) begin

	if (wr_enable) begin
		mem[wr_addr] <= din;

                
                
	end

end	// NEGEDGE ALWAYS


assign dout[63:0] = local_dout[63:0];

supply0 vss;
supply1 vdd;
endmodule

