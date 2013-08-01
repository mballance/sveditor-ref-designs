// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: clkgen_rst_io2x.v
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
module clkgen_rst_io2x ( 
	array_wr_inhibit,
	tcu_atpg_mode,
	tcu_wr_inhibit,
	l2clk,
	aclk,
	bclk,
	so,
	clk_stop,
	pce_ov,
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
	clk_ext,
	tcu_aclk,
	tcu_bclk,
	se,
	si
);

 
// ************************** 
// port declaration 
// ************************** 

// clock & test out
output	l2clk;	// assume we do not need aclk, bclk outputs
output	aclk;	// buffered version of aclk
output	bclk;	// buffered version of bclk
output	so;		// unused as of today - feb 10, 05

// pipelined out
output	clk_stop;			// allows clk stop in flop-header
output	pce_ov;				// pce override to l1 header
output	wmr_protect;		// warm reset protect
output	wmr_;				// warm reset (active low) 
output	por_;				// power-on-reset 
output	cmp_slow_sync_en;	// cmp->slow clk sync pulse
output	slow_cmp_sync_en;	// slow->cmp clk sync pulse

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

// ctrl in (for clock gen) 
input	tcu_div_bypass;		// bypasses clk divider to mux in ext clk
input	ccu_div_ph;			// phase signal from ccu (div/4 or div/2)
input   cluster_div_en;		// if enabled, l2clk is divided down 

// clock & test in
input	gclk;			// global clk - this is either cmp or dr
input	clk_ext;		// external clk muxed in for ioclk bypass 
input	se;				// unused as of today - feb 10, 05
input	si;				// unused as of today - feb 10, 05
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
wire	so;
wire	clk_stop;
wire	pce_ov;
wire	wmr_protect;
wire	wmr_;
wire	por_;
wire	cmp_slow_sync_en;
wire	slow_cmp_sync_en;
wire	tcu_clk_stop;
wire	tcu_pce_ov;
wire	rst_wmr_protect;
wire	rst_wmr_;
wire	rst_por_;
wire	ccu_cmp_slow_sync_en;
wire	ccu_slow_cmp_sync_en;
wire	tcu_div_bypass;
wire	ccu_div_ph;
wire	cluster_div_en;
wire	gclk;
wire	clk_ext;
wire	se;				// tie-low, unused as of today - feb 10, 05
wire	si;				// tie-low, unused as of today - feb 10, 05
wire	tcu_aclk;				
wire	tcu_bclk;

	

// ************************** 
// instantiations
// ************************** 

// needs a few edits to cluster header def - mahmud.hassan 
// modified custom cell name for avoiding 
// collision with sparc core and other clusters - mhassan
n2_clk_clstr_hdr_cust xcluster_header (
     .cpu_divider_bypass (tcu_div_bypass ),
     .tcu_pce_ov      (tcu_pce_ov ),
     .tcu_clk_stop    (tcu_clk_stop ),
     // .clk_ext         (clk_ext ),
     .div_r           (ccu_div_ph ),
     .div_f           (cluster_div_en ),
     .se              (se ),
     .so              (so ),
     .clk_stop        (clk_stop ),
     .pce_ov          (pce_ov ),
     .wmr_			  (wmr_ ),
     .cclk            (cclk ),
     .tcu_bclk		  (tcu_bclk ),
     .tcu_aclk        (tcu_aclk ),
     .si              (si ),
     .gclk            (gclk ),
     .rst_wmr_		  (rst_wmr_ ),
     .l2clk           (l2clk ),
  	 .rst_wmr_protect (rst_wmr_protect  ),	
  	 .rst_por_ 	      ( rst_por_ 	      ),	
  	 .wmr_protect     (wmr_protect      ),	
  	 .por_ 			  (por_ 			   ),
  	 .ccu_cmp_slow_sync_en (ccu_cmp_slow_sync_en  ),
  	 .ccu_slow_cmp_sync_en (ccu_slow_cmp_sync_en  ),
  	 .cmp_slow_sync_en (cmp_slow_sync_en  ),
  	 .slow_cmp_sync_en (slow_cmp_sync_en  ),
	 .aclk			  (aclk),
	 .bclk			  (bclk)
);


// cclk -> l2clk from right 
n2_clk_rst_io2x_cust xright (
     .l2clk         (l2clk),
     .cclk          (cclk) 
);



// cclk -> l2clk from left 
n2_clk_rst_io2x_cust xleft (
     .l2clk         (l2clk),
     .cclk          (cclk) 
);

endmodule

