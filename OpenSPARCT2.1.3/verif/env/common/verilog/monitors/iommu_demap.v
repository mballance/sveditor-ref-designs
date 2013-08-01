// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: iommu_demap.v
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
`include "defines.vh"
`include "dispmonDefines.vh"

module iommu_demap ();



	wire 		clk = `CPU.dmu.dmc.mmu.clk;
	wire [63:0]	nxt_vld;
	wire [63:0]	ptb2vtb_inv;
	wire		csr2ptb_inv;
	integer		i;

	reg		csr2ptb_inv_local;
	reg		enable;
	
	
	assign  	csr2ptb_inv = `CPU.dmu.dmc.mmu.csr.csr2ptb_inv ;
	assign		nxt_vld = `CPU.dmu.dmc.mmu.vtb.nxt_vld ;
	assign		ptb2vtb_inv = `CPU.dmu.dmc.mmu.vtb.ptb2vtb_inv ;

initial
begin
	enable = 0;
	i = 0;
	if ($test$plusargs("turn_on_iommu_demap")) enable = 1;
end



		
	always @ (posedge clk) 
		begin
			csr2ptb_inv_local <= #1 csr2ptb_inv;
			if(csr2ptb_inv_local == 1 )  
				begin 
				for(i=0;i<63;i=i+1)
					begin
					if(ptb2vtb_inv[i] == 1) begin
						 if ((nxt_vld[i] == 0) && (enable ==1))
						 begin
							$dispmon("IOMMU_DEMAP", `ALWAYS, "invalidating %d entry",i);
						 end
						 else if (nxt_vld[i] == 1) begin
						        $dispmon("IOMMU_DEMAP", `ERROR, "valid bit in not zero for %d entry",i);
						end
						end
					end	 
				end
			
		end
				
endmodule
