// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_rds_msi_csrpipe_1.v
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
module dmu_imu_rds_msi_csrpipe_1 
	(
	clk,
	rst_l,
	reg_in,
	reg_out,
	data0,
	sel0,
	out
	);

//====================================================================
//     Polarity declarations
//====================================================================
input  clk;  // Clock signal
input  rst_l;  // Reset signal
input  reg_in;  // Set to constant. 0: sel* non-reg  1: sel* reg
input  reg_out;  // Set to constant. 0: out non-reg   1: out registered
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data0;  // Read data
input  sel0;  // Set to 1 if reg_in==0
output [`FIRE_CSRBUS_DATA_WIDTH-1:0] out;  // Read data out

//====================================================================
//     Type declarations
//====================================================================
wire clk;  // Clock signal
wire rst_l;  // Reset signal
wire reg_in;  // Set to constant. 0: sel* non-reg  1: sel* reg
wire reg_out;  // Set to constant. 0: out non-reg   1: out registered
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data0;  // Read data
wire sel0;  // Set to 1 if reg_in==0
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] out;  // Read data out

//====================================================================
//     Local variables
//====================================================================
reg [`FIRE_CSRBUS_DATA_WIDTH-1:0] out_p1;
reg sel0_p1;

//====================================================================
//     Logic
//====================================================================
//select required ?
wire sel0_int=reg_in?sel0_p1:sel0;

//generate AND/OR
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] out_d = 
      {`FIRE_CSRBUS_DATA_WIDTH { sel0_int } } & data0;

//reg out or combo
assign out=reg_out?out_p1:out_d;

//pipe control/data
always @(posedge clk)
  begin
     if(~rst_l)
       begin
          sel0_p1<=1'b0;
          out_p1<=`FIRE_CSRBUS_DATA_WIDTH'b0;
        end
      else
        begin
          sel0_p1<=sel0;
          out_p1<=out_d;
        end
  end

endmodule // dmu_imu_rds_msi_csrpipe_1
