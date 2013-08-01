// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ccu_mon.v
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
`include "tcu_top.h"

module ccu_mon();

  //#############################################################
  //### WHAT: monitor ccu and print out clock info
  //#############################################################

`ifndef GATESIM
`ifndef ASIC_GATES

  integer sys_clk_per_int, dtm_mode;
  reg [5:0] div1, div2, div3;
  reg [6:0] div4;
  real div1_eff, div2_eff, div3_eff, div4_eff; // effective values (warning: in real number)
  real sys_clk_per, cmp_clk_per, dr_clk_per, io_clk_per, io2x_clk_per;  // expected values
  real cmp2sys_ratio, dr2sys_ratio, cmp2dr_ratio, cmp2io_ratio, cmp2io2x_ratio; // clk ratio
  
  always @(negedge `CCU.rst_ccu_pll_)
    $display("%t: ccu_mon[ccu_mon]: clk info: rst asserts rst_ccu_pll_ to reset/relock PLL", $time);

  always @(posedge `CCU.rst_ccu_pll_) begin  // at CCU input: get sys clk period
    @(posedge `CCU.pll_sys_clk_p);
    sys_clk_per_int = $time;
    @(posedge `CCU.pll_sys_clk_p);
    sys_clk_per_int = $time - sys_clk_per_int;
    sys_clk_per = sys_clk_per_int; // warning: convert to real number
  end
  
  always @(posedge `CCU.rst_ccu_pll_) begin  // at CCU's csr_blk: record div values when CCU should latch them in
    $display("%t: ccu_mon[ccu_mon]: clk info: rst deasserts rst_ccu_pll_", $time);
    div1  = `CCU.csr_blk.pll_div1;
    div2  = `CCU.csr_blk.pll_div2;
    div3  = `CCU.csr_blk.pll_div3;
    div4  = `CCU.csr_blk.pll_div4;
    div1_eff = div1 + 1.0;   // effective value. Warning: convert to real number
    div2_eff = div2 + 1.0;   // effective value. Warning: convert to real number
    div3_eff = div3 + 1.0;   // effective value. Warning: convert to real number
    div4_eff = div4[6:1];    // integral/whole part. Warning: convert to real number
    if (div4[0] == 1'b1)
      div4_eff = div4_eff + 0.5; // fractional part. Warning: convert to real number
  end

  always @(posedge `CCU.ccu_rst_sync_stable) begin // clock info: compute and print out expected values when clocks and sync are stable
    $display("%t: ccu_mon[ccu_mon]: clk info: ccu asserts ccu_rst_sync_stable", $time);
    dtm_mode = ((`CCU.csr_blk.serdes_dtm1 === 1'b1)
             || (`CCU.csr_blk.serdes_dtm2 === 1'b1))? 1 : 0;  // serdes dtm signals should be stable here
    cmp_clk_per  = (sys_clk_per * div1_eff) / div2_eff;
    if (dtm_mode) begin  // DTM mode
      dr_clk_per   = sys_clk_per * div1_eff;
      io_clk_per   = sys_clk_per * div1_eff;
      io2x_clk_per = sys_clk_per * div1_eff;
      cmp2sys_ratio  = div2_eff / div1_eff;
      dr2sys_ratio   = div1_eff;
      cmp2dr_ratio   = div2_eff;
      cmp2io_ratio   = div2_eff;
      cmp2io2x_ratio = div2_eff;
    end
    else begin // functional mode
      io_clk_per   = cmp_clk_per * 4.0;
      io2x_clk_per = cmp_clk_per * 2.0;
      dr_clk_per   = (sys_clk_per * div1_eff * div4_eff) / (div2_eff * div3_eff);
      cmp2sys_ratio  = div2_eff / div1_eff;
      dr2sys_ratio   = (div2_eff * div3_eff) / (div1_eff * div4_eff);
      cmp2dr_ratio   = div4_eff / div3_eff;
      cmp2io_ratio   = 4.0;
      cmp2io2x_ratio = 2.0;
    end
    $display("%t: ccu_mon[ccu_mon]: clk info: div1_eff=%.0f, div2_eff=%.0f, div3_eff=%.0f, div4_eff=%.1f, serdes_dtm=%0d", $time, div1_eff, div2_eff, div3_eff, div4_eff, dtm_mode);
    $display("%t: ccu_mon[ccu_mon]: clk info: sys_clk_per=%.2f", $time, sys_clk_per);
    $display("%t: ccu_mon[ccu_mon]: clk info: expected: cmp_clk_per=%.2f, dr_clk_per=%.2f, io_clk_per=%.2f, io2x_clk_per=%.2f", $time, cmp_clk_per, dr_clk_per, io_clk_per, io2x_clk_per);

    $display("%t: ccu_mon[ccu_mon]: clk info: expected: cmp2sys_ratio=%.2f, dr2sys_ratio=%.2f, cmp2dr_ratio=%.2f, cmp2io_ratio=%.2f, cmp2io2x_ratio=%.2f", $time, cmp2sys_ratio, dr2sys_ratio, cmp2dr_ratio, cmp2io_ratio, cmp2io2x_ratio);
  end

`endif  // end of `ifndef ASIC_GATES
`endif  // end of `ifndef GATESIM

  //#############################################################
  //### WHAT: monitor JTAG tck clock (this is legacy code)
  //#############################################################

`ifdef TCU_SAT

   reg [63:0] period;
   reg [63:0] posTime;
   reg [63:0] negTime;   
   reg [63:0] posCycle;
   reg [63:0] negCycle;
   wire tckCLK;
   
   assign tckCLK = `TOP.tck;   

   always @(posCycle or negCycle)
      period=posCycle+negCycle;
 
   always @(tckCLK) begin
      if (tckCLK) begin
	 posTime  = $time;
	 posCycle = posTime - negTime;
	 if (negCycle != posCycle) 
	   $dispmon("tb_top", `DEBUG, "Period change for tck: %0dps (neg:%0dps -> pos:%0dps)", posCycle*2, negCycle, posCycle);
      end else begin
	 negTime  = $time;
	 negCycle = negTime - posTime;	 
	 if (negCycle != posCycle) 
	   $dispmon("tb_top", `DEBUG, "Period change for tck: %0dps (pos:%0dps -> neg:%0dps)", negCycle*2, posCycle, negCycle);
      end
   end

   //// This Verilog task is called from the Vera testbench side at end of simulation
   task showClocks;
      begin
	 $dispmon("tb_top", `INFO,   "TCK     : %0d ps (%0d MHz)", period,     1.0E6/period);
      end
   endtask

`endif //  `ifdef TCU_SAT

  //###################################################
  //### WHAT: instantiate MCU's DR clkgen module for TCU SAT
  //###       to produce an ALWAYS running DR clock
  //###################################################

`ifndef GATESIM
`ifndef ASIC_GATES
  
  clkgen_mcu_dr clkgen_dr(
    //-----inputs-----
    .gclk(`CPU.mcu0.dr_gclk),     // connect to MCU's DR gclk
    .cluster_div_en(1'b0),        // must tie low
    .cluster_arst_l(1'b1),        // tie high
  
    //---the rest of the inputs: tie low/high---
    .ccu_cmp_slow_sync_en(1'b0),
    .ccu_slow_cmp_sync_en(1'b0),
    .ccu_div_ph(1'b0),            // not matter if cluster_div_en is 0
    .ccu_serdes_dtm(1'b0),        // not used inside clkgen module
    .clk_ext(1'b0),               // not used inside clkgen module
    .rst_por_(1'b0),
    .rst_wmr_(1'b0),
    .rst_wmr_protect(1'b0),
    .scan_en(1'b0),
    .scan_in(1'b0),
    .tcu_aclk(1'b0),
    .tcu_bclk(1'b0),
    .tcu_atpg_mode(1'b0),
    .tcu_clk_stop(1'b0),
    .tcu_div_bypass(1'b0),
    .tcu_pce_ov(1'b0),
    .tcu_wr_inhibit(1'b0),
  
    //---outputs: not connect---
    .aclk(),
    .aclk_wmr(),
    .array_wr_inhibit(),
    .bclk(),
    .cmp_slow_sync_en(),
    .l2clk(),
    .pce_ov(),
    .por_(),
    .scan_out(),
    .slow_cmp_sync_en(),
    .wmr_(),
    .wmr_protect()
  );
 
  //###################################################
  //### WHAT: instantiate RDP's IO2X clkgen module for TCU SAT
  //###       to produce ALWAYS running IO2X clock
  //###################################################
  

`ifdef FC_NO_NIU_T2

// added this for removing NIU in T2
// 2 signals were getting called from rdp (which is in NIU).
// so, i replaced them with their equivalent behavior (since i removed rdp when i removed NIU)
// list of signals that are stubbed for NIU

  integer status; time niu_stub_time;
  initial begin
   status = $value$plusargs("NIU_STUB_TIME=%d", niu_stub_time);
  end
  initial begin
	#niu_stub_time
	$display("At time %0t, stubbing initiated for NCU/SIU - NIU signals from %m (OpenSparc T2)\n",$time);
	//
  	//#687002
  	//$dispmon("ccu_mon",1,"At time %0d, stubbing initiated for NCU/SIU - NIU signals (OpenSparc T2)\n",$time);
	//
	force `CPU.ncu_niu_ctag_cei =0;
	force `CPU.ncu_niu_ctag_uei  =0;
	force `CPU.ncu_niu_d_pei =0;
	force `CPU.ncu_niu_data[31:0]  =32'b0;
	force `CPU.ncu_niu_stall  =0;
	force `CPU.ncu_niu_vld =0;
	force `CPU.ncu_sii_niua_pei  =0;
	force `CPU.ncu_sii_niuctag_cei =0;
	force `CPU.ncu_sii_niuctag_uei  =0;
	force `CPU.ncu_sii_niud_pei =0;
	force `CPU.niu_dbg1_stall_ack  =0;
	force `CPU.niu_efu_4k_data =0;
	force `CPU.niu_efu_4k_xfer_en  =0;
	force `CPU.niu_efu_cfifo0_data =0;
	force `CPU.niu_efu_cfifo0_xfer_en  =0;
	force `CPU.niu_efu_cfifo1_data =0;
	force `CPU.niu_efu_cfifo1_xfer_en  =0;
	force `CPU.niu_efu_fdo =0;
	force `CPU.niu_efu_ipp0_data  =0;
	force `CPU.niu_efu_ipp0_xfer_en =0;
	force `CPU.niu_efu_ipp1_data  =0;
	force `CPU.niu_efu_ipp1_xfer_en =0;
	force `CPU.niu_efu_mac0_ro_data  =0;
	force `CPU.niu_efu_mac0_ro_xfer_en =0;
	force `CPU.niu_efu_mac0_sf_data  =0;
	force `CPU.niu_efu_mac0_sf_xfer_en =0;
	force `CPU.niu_efu_mac1_ro_data  =0;
	force `CPU.niu_efu_mac1_ro_xfer_en =0;
	force `CPU.niu_efu_mac1_sf_data  =0;
	force `CPU.niu_efu_mac1_sf_xfer_en =0;
	force `CPU.niu_efu_ram0_data  =0;
	force `CPU.niu_efu_ram0_xfer_en =0;
	force `CPU.niu_efu_ram1_data  =0;
	force `CPU.niu_efu_ram1_xfer_en =0;
	force `CPU.niu_efu_ram_data  =0;
	force `CPU.niu_efu_ram_xfer_en =0;
	force `CPU.niu_mio_debug_clock[1:0]  =2'b0;
	force `CPU.niu_mio_debug_data[31:0] =32'b0;
	force `CPU.niu_ncu_ctag_ce  =0;
	force `CPU.niu_ncu_ctag_ue  =0;
	force `CPU.niu_ncu_d_pe =0;
	force `CPU.niu_ncu_data[31:0]  =32'b0;
	force `CPU.niu_ncu_stall  =0;
	force `CPU.niu_ncu_vld =0;
	force `CPU.niu_sii_data[127:0]  =128'b0;
	force `CPU.niu_sii_datareq =0;
	force `CPU.niu_sii_hdr_vld  =0;
	force `CPU.niu_sii_parity[7:0] =8'b0;
	force `CPU.niu_sii_reqbypass  =0;
	force `CPU.niu_sio_dq  =0;
	force `CPU.niu_txc_interrupts =0;
  end 

// very important to have the following free running clock with the associated delays
// exactly as is used below......... also, note we are in ps now instead of fs

  reg x;
  initial begin
  	#194251 x=1'b1;
  	#107250 forever #750 x=~x; // clock half-period is 750 ps, not 750 fs
  end

// added this module and the 2 associated 'rdp' derivative signals
   clkgen_rdp_io2x clkgen_io2x(
    //---inputs---
    .gclk(`CPU.cmp_gclk_c0_rdp),
    .ccu_div_ph(x),

`else
  clkgen_rdp_io2x clkgen_io2x(
   //---inputs---
`ifdef NIU_SYSTEMC_T2
    .gclk(`CPU.niu.cmp_gclk_c0_rdp),        // connect to RDP's gclk
    .ccu_div_ph(`CPU.niu.gl_io2x_out_c1b),  // connect to RDP's io2x_out
`else
    .gclk(`CPU.rdp.cmp_gclk_c0_rdp),        // connect to RDP's gclk
    .ccu_div_ph(`CPU.rdp.gl_rdp_io2x_out),  // connect to RDP's io2x_out
`endif
`endif

    .cluster_div_en(1'b1),                  // must tie high
    .cluster_arst_l(1'b1),                  // tie high       
  
    //---the rest of the inputs: tie low/high---
    .ccu_cmp_slow_sync_en(1'b0),
    .ccu_slow_cmp_sync_en(1'b0),
    .ccu_serdes_dtm(1'b0),        // not used inside clkgen module
    .clk_ext(1'b0),               // not used inside clkgen module
    .rst_por_(1'b0),
    .rst_wmr_(1'b0),
    .rst_wmr_protect(1'b0),
    .scan_en(1'b0),
    .scan_in(1'b0),
    .tcu_aclk(1'b0),
    .tcu_bclk(1'b0),
    .tcu_atpg_mode(1'b0),
    .tcu_clk_stop(1'b0),
    .tcu_div_bypass(1'b0),
    .tcu_pce_ov(1'b0),
    .tcu_wr_inhibit(1'b0),
  
    //-----outputs-----
    .aclk(),
    .aclk_wmr(),
    .array_wr_inhibit(),
    .bclk(),
    .cmp_slow_sync_en(),
    .l2clk(),
    .pce_ov(),
    .por_(),
    .scan_out(),
    .slow_cmp_sync_en(),
    .wmr_(),
    .wmr_protect()
  );

`endif  // end of `ifndef ASIC_GATES
`endif  // end of `ifndef GATESIM

endmodule // ccu_mon

//  added these modules, they are necessary for compilation

`ifdef FC_NO_NIU_T2
module  clkgen_rdp_io2x ( 
	array_wr_inhibit,
	tcu_atpg_mode,
	tcu_wr_inhibit,
	l2clk,
	aclk,
	bclk,
	scan_out,
	pce_ov,
	aclk_wmr,
	wmr_protect,
	wmr_,
	por_,
	cmp_slow_sync_en,
	slow_cmp_sync_en,
	tcu_clk_stop,
	tcu_pce_ov,
	rst_wmr_protect,
	rst_wmr_,
	rst_por_,
	ccu_cmp_slow_sync_en,
	ccu_slow_cmp_sync_en,
	tcu_div_bypass,
	ccu_div_ph,
	cluster_div_en,
	gclk,
	cluster_arst_l,
	clk_ext,
	ccu_serdes_dtm,
	tcu_aclk,
	tcu_bclk,
	scan_en,
	scan_in
);

 
// ************************** 
// port declaration 
// ************************** 

// clock & test out
output	l2clk;	// assume we do not need aclk, bclk outputs
output	aclk;	// buffered version of aclk
output	bclk;	// buffered version of bclk
output	scan_out;		// unused as of today - feb 10, 05
output  aclk_wmr;

// pipelined out
output	pce_ov;				// pce override to l1 header
output	wmr_protect;		// warm reset protect
output	wmr_;				// warm reset (active low) 
output	por_;				// power-on-reset 
output	cmp_slow_sync_en;	// cmp->slow clk sync pulse
output	slow_cmp_sync_en;	// slow->cmp clk sync pulse
// output	io2x_sync_en;		// cmp<->io2x clk sync pulse
// output	dr_sync_en;			// cmp<->dr clk sync pulse

// ctrl in (for pipelining)
output	array_wr_inhibit;
input	tcu_atpg_mode;
input	tcu_wr_inhibit;
input	tcu_clk_stop;
input	tcu_pce_ov;
input	rst_wmr_protect;		
input	rst_wmr_;		
input	rst_por_;
input	ccu_cmp_slow_sync_en;
input	ccu_slow_cmp_sync_en;
// input 	ccu_io2x_sync_en;		
// input 	ccu_dr_sync_en;			

// ctrl in (for clock gen) 
input	tcu_div_bypass;		// bypasses clk divider to mux in ext clk
input	ccu_div_ph;			// phase signal from ccu (div/4 or div/2)
input   cluster_div_en;		// if enabled, l2clk is divided down 

// clock & test in
input	gclk;			// global clk - this is either cmp or dr
input	cluster_arst_l;
input 	ccu_serdes_dtm;
input	clk_ext;		// external clk muxed in for ioclk bypass 
input	scan_en;		// unused as of today - feb 10, 05
input	scan_in;		// unused as of today - feb 10, 05
input	tcu_aclk;				
input	tcu_bclk;



// ************************** 
// wire declaration 
// ************************** 
wire	array_wr_inhibit;
wire	tcu_atpg_mode;
wire	tcu_wr_inhibit;
wire	l2clk;	
wire	aclk;
wire	bclk;
wire	scan_out;
wire	aclk_wmr;	
wire	pce_ov;
wire	wmr_protect;
wire	wmr_;
wire	por_;
wire	cmp_slow_sync_en;
wire	slow_cmp_sync_en;
// wire	io2x_sync_en;		
// wire	dr_sync_en;			
wire	tcu_clk_stop;
wire	tcu_pce_ov;
wire	rst_wmr_protect;
wire	rst_wmr_;
wire	rst_por_;
wire	ccu_cmp_slow_sync_en;
wire	ccu_slow_cmp_sync_en;
// wire	ccu_io2x_sync_en;		
// wire	ccu_dr_sync_en;			
wire	tcu_div_bypass;
wire	ccu_div_ph;
wire	cluster_div_en;
wire	gclk;
wire	cluster_arst_l;
wire	clk_ext;
wire	ccu_serdes_dtm;
wire	scan_en;				
wire	scan_in;				
wire	tcu_aclk;				
wire	tcu_bclk;

wire	cclk;
	

// ************************** 
// instantiations
// ************************** 

// needs a few edits to cluster header def - mahmud.hassan 
// modified custom cell name for avoiding 
// collision with sparc core and other clusters - mhassan
n2_clk_clstr_hdr_cust xcluster_header (
	.gclk (gclk),
	.l2clk (l2clk),
	.cluster_arst_l (cluster_arst_l),
	.ccu_div_ph (ccu_div_ph),
	.cluster_div_en (cluster_div_en),	
	.tcu_div_bypass (tcu_div_bypass),
	// .clk_ext (clk_ext),
	// .ccu_serdes_dtm (ccu_serdes_dtm),
	.scan_in (scan_in),
	.scan_en (scan_en),
	.tcu_aclk (tcu_aclk),
	.tcu_bclk (tcu_bclk),
	.ccu_cmp_slow_sync_en (ccu_cmp_slow_sync_en),
	.ccu_slow_cmp_sync_en (ccu_slow_cmp_sync_en),
	// .ccu_io2x_sync_en 		(ccu_io2x_sync_en ),		
	// .ccu_dr_sync_en 		(ccu_dr_sync_en ),		
	.tcu_pce_ov (tcu_pce_ov),
	.tcu_clk_stop (tcu_clk_stop),
	.rst_por_ (rst_por_),
	.rst_wmr_ (rst_wmr_),
	.rst_wmr_protect (rst_wmr_protect),
	.aclk_wmr (aclk_wmr),
	.aclk (aclk),
	.bclk (bclk),
	.cmp_slow_sync_en (cmp_slow_sync_en),
	.slow_cmp_sync_en (slow_cmp_sync_en),
	// .io2x_sync_en 			(io2x_sync_en ),			
	// .dr_sync_en 			(dr_sync_en ),			
	.pce_ov (pce_ov),
	.por_ (por_),
	.wmr_ (wmr_),
	.wmr_protect (wmr_protect),
	.scan_out (scan_out),
	.array_wr_inhibit (array_wr_inhibit),
	.tcu_atpg_mode (tcu_atpg_mode),
	.tcu_wr_inhibit (tcu_wr_inhibit),
	.cclk (cclk)
);



// cclk -> l2clk from right 
FC_NO_NIU_T2_n2_clk_rdp_io2x_cust xright (
     .l2clk         (l2clk),
     .cclk          (cclk) 
);



// cclk -> l2clk from left 
FC_NO_NIU_T2_n2_clk_rdp_io2x_cust xleft (
     .l2clk         (l2clk),
     .cclk          (cclk) 
);

endmodule

module FC_NO_NIU_T2_n2_clk_rdp_io2x_cust(cclk, l2clk);

	input			cclk;
	output			l2clk;

	assign #(1) l2clk = cclk;
endmodule
`endif
