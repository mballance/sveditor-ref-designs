// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2_dir.v
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
`timescale 1 ns / 10 ps
module l2_dir(clk, reset, pa_in, index, pa_wr, val, way_hit, dir_hit_way_enc, 
	rd_en);

	input			clk;
	input			reset;
	input			rd_en;
	input			val;
	input	[27:0]		pa_in;
	input	[3:0]		pa_wr;
	input	[6:0]		index;
	output	[3:0]		way_hit;
	output	[1:0]		dir_hit_way_enc;

	reg	[27:0]		dta_way0[127:0];
	reg	[27:0]		dta_way1[127:0];
	reg	[27:0]		dta_way2[127:0];
	reg	[27:0]		dta_way3[127:0];

	reg	[127:0]		valid_w0;
	reg	[127:0]		valid_w1;
	reg	[127:0]		valid_w2;
	reg	[127:0]		valid_w3;
	wire	[3:0]		wr_way_d = pa_wr;
	reg	[3:0]		way_hit_r;
	wire	[6:0]		index_y_d = index;
	wire	[27:0]		wrtag_y = pa_in;
	reg	[3:0]		squash;
	reg			mult;
	reg			dbg_en;
	reg			dbg_en2;
	reg	[3:0]		wr_way_d_d;
	reg	[3:0]		wr_way_d_d_d;

	assign dir_hit_way_enc = (way_hit[0] ? 0 : (way_hit[1] ? 1 : (way_hit[2]
		? 2 : 3)));
	assign way_hit = way_hit_r;

	always @(posedge clk) begin
	  if (reset) begin
	    valid_w0 <= 0;
	    valid_w1 <= 0;
	    valid_w2 <= 0;
	    valid_w3 <= 0;
	  end
	  else
	    begin
	      if (wr_way_d[0] | squash[0]) begin
		valid_w0[index_y_d] <= (val & (~squash[0]));
	      end
	      if (wr_way_d[1] | squash[1]) begin
		valid_w1[index_y_d] <= (val & (~squash[1]));
	      end
	      if (wr_way_d[2] | squash[2]) begin
		valid_w2[index_y_d] <= (val & (~squash[2]));
	      end
	      if (wr_way_d[3] | squash[3]) begin
		valid_w3[index_y_d] <= (val & (~squash[3]));
	      end
	    end
	end
	always @(posedge clk) begin
	  wr_way_d_d <= wr_way_d;
	  wr_way_d_d_d <= wr_way_d_d;
	  if ((((way_hit_r[0] + way_hit_r[1]) + way_hit_r[2]) + way_hit_r[3]) > 
		  1) begin
	    mult <= 1;
	  end
	  else
	    begin
	      mult <= 0;
	    end
	  if (((((way_hit_r[0] + way_hit_r[1]) + way_hit_r[2]) + way_hit_r[3]) >
		  1) & (|wr_way_d_d_d)) begin
	    squash <= (way_hit_r & (~wr_way_d_d_d));
	  end
	  else
	    begin
	      squash <= 4'b0;
	    end
	  way_hit_r <= {((dta_way3[index_y_d[6:0]] == pa_in) &
		  valid_w3[index_y_d]), ((dta_way2[index_y_d[6:0]] == pa_in) &
		  valid_w2[index_y_d]), ((dta_way1[index_y_d[6:0]] == pa_in) &
		  valid_w1[index_y_d]), ((dta_way0[index_y_d[6:0]] == pa_in) &
		  valid_w0[index_y_d])};
	  if (wr_way_d[0]) begin
	    dta_way0[index_y_d[6:0]] <= wrtag_y;
	  end
	  if (wr_way_d[1]) begin
	    dta_way1[index_y_d[6:0]] <= wrtag_y;
	  end
	  if (wr_way_d[2]) begin
	    dta_way2[index_y_d[6:0]] <= wrtag_y;
	  end
	  if (wr_way_d[3]) begin
	    dta_way3[index_y_d[6:0]] <= wrtag_y;
	  end
	end
endmodule
