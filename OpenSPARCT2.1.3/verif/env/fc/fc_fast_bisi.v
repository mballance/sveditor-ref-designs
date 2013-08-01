// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fc_fast_bisi.v
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
`ifndef AXIS
module fast_bisi;
integer i;
wire flush_reset_complete = tb_top.system_reset.flush_reset_complete;

	reg	fast_bisi_en;
initial
begin
        if( $test$plusargs("FAST_BISI"))
	begin
                fast_bisi_en   = 1;
		$display("%t,   FAST BISI Enabled\n",$time);
	end
        else
	begin
                fast_bisi_en   = 0;
		$display("%t,   FAST BISI Disabled\n",$time);
	end

end
always @(posedge flush_reset_complete) begin
if(fast_bisi_en) begin
$display("%t,   Start FAST BISI\n",$time);
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t0.tag.quad0.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t0.tag.quad0.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t0.tag.quad0.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t0.tag.quad0.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t0.tag.quad1.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t0.tag.quad1.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t0.tag.quad1.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t0.tag.quad1.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t0.tag.quad2.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t0.tag.quad2.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t0.tag.quad2.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t0.tag.quad2.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t0.tag.quad3.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t0.tag.quad3.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t0.tag.quad3.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t0.tag.quad3.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t0.mbdata.array.inq_ary[i] = {128{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t0.mbtag.array.mb_cam_data[i] = {42{1'b0}};
end
for(i=0; i<=       8 ; i=i+1) begin
tb_top.cpu.l2t0.fbtag.array.mb_cam_data[i] = {40{1'b0}};
end
for(i=0; i<=       8 ; i=i+1) begin
tb_top.cpu.l2t0.wbtag.array.mb_cam_data[i] = {40{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2t0.iqarray.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2t0.oqarray.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=       8 ; i=i+1) begin
tb_top.cpu.l2t0.rdmatag.array.mb_cam_data[i] = {40{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t0.subarray_0.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t0.subarray_1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t0.subarray_2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t0.subarray_3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t0.subarray_8.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t0.subarray_9.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t0.subarray_10.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t0.subarray_11.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t0.ic_row0.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t0.ic_row0.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t0.ic_row0.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t0.ic_row0.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t0.ic_row0.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t0.ic_row0.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t0.ic_row0.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t0.ic_row0.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t0.ic_row0.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t0.ic_row0.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t0.ic_row0.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t0.ic_row0.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t0.ic_row0.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t0.ic_row0.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t0.ic_row0.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t0.ic_row0.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t0.ic_row2.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t0.ic_row2.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t0.ic_row2.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t0.ic_row2.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t0.ic_row2.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t0.ic_row2.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t0.ic_row2.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t0.ic_row2.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t0.ic_row2.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t0.ic_row2.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t0.ic_row2.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t0.ic_row2.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t0.ic_row2.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t0.ic_row2.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t0.ic_row2.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t0.ic_row2.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t0.dc_row0.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t0.dc_row0.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t0.dc_row0.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t0.dc_row0.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t0.dc_row0.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t0.dc_row0.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t0.dc_row0.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t0.dc_row0.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t0.dc_row0.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t0.dc_row0.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t0.dc_row0.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t0.dc_row0.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t0.dc_row0.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t0.dc_row0.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t0.dc_row0.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t0.dc_row0.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t0.dc_row2.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t0.dc_row2.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t0.dc_row2.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t0.dc_row2.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t0.dc_row2.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t0.dc_row2.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t0.dc_row2.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t0.dc_row2.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t0.dc_row2.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t0.dc_row2.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t0.dc_row2.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t0.dc_row2.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t0.dc_row2.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t0.dc_row2.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t0.dc_row2.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t0.dc_row2.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t1.tag.quad0.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t1.tag.quad0.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t1.tag.quad0.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t1.tag.quad0.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t1.tag.quad1.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t1.tag.quad1.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t1.tag.quad1.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t1.tag.quad1.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t1.tag.quad2.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t1.tag.quad2.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t1.tag.quad2.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t1.tag.quad2.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t1.tag.quad3.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t1.tag.quad3.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t1.tag.quad3.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t1.tag.quad3.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t1.mbdata.array.inq_ary[i] = {128{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t1.mbtag.array.mb_cam_data[i] = {42{1'b0}};
end
for(i=0; i<=       8 ; i=i+1) begin
tb_top.cpu.l2t1.fbtag.array.mb_cam_data[i] = {40{1'b0}};
end
for(i=0; i<=       8 ; i=i+1) begin
tb_top.cpu.l2t1.wbtag.array.mb_cam_data[i] = {40{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2t1.iqarray.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2t1.oqarray.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=       8 ; i=i+1) begin
tb_top.cpu.l2t1.rdmatag.array.mb_cam_data[i] = {40{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t1.subarray_0.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t1.subarray_1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t1.subarray_2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t1.subarray_3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t1.subarray_8.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t1.subarray_9.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t1.subarray_10.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t1.subarray_11.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t1.ic_row0.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t1.ic_row0.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t1.ic_row0.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t1.ic_row0.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t1.ic_row0.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t1.ic_row0.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t1.ic_row0.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t1.ic_row0.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t1.ic_row0.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t1.ic_row0.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t1.ic_row0.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t1.ic_row0.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t1.ic_row0.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t1.ic_row0.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t1.ic_row0.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t1.ic_row0.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t1.ic_row2.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t1.ic_row2.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t1.ic_row2.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t1.ic_row2.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t1.ic_row2.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t1.ic_row2.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t1.ic_row2.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t1.ic_row2.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t1.ic_row2.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t1.ic_row2.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t1.ic_row2.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t1.ic_row2.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t1.ic_row2.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t1.ic_row2.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t1.ic_row2.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t1.ic_row2.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t1.dc_row0.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t1.dc_row0.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t1.dc_row0.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t1.dc_row0.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t1.dc_row0.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t1.dc_row0.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t1.dc_row0.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t1.dc_row0.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t1.dc_row0.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t1.dc_row0.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t1.dc_row0.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t1.dc_row0.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t1.dc_row0.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t1.dc_row0.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t1.dc_row0.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t1.dc_row0.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t1.dc_row2.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t1.dc_row2.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t1.dc_row2.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t1.dc_row2.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t1.dc_row2.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t1.dc_row2.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t1.dc_row2.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t1.dc_row2.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t1.dc_row2.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t1.dc_row2.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t1.dc_row2.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t1.dc_row2.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t1.dc_row2.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t1.dc_row2.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t1.dc_row2.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t1.dc_row2.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t2.tag.quad0.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t2.tag.quad0.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t2.tag.quad0.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t2.tag.quad0.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t2.tag.quad1.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t2.tag.quad1.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t2.tag.quad1.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t2.tag.quad1.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t2.tag.quad2.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t2.tag.quad2.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t2.tag.quad2.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t2.tag.quad2.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t2.tag.quad3.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t2.tag.quad3.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t2.tag.quad3.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t2.tag.quad3.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t2.mbdata.array.inq_ary[i] = {128{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t2.mbtag.array.mb_cam_data[i] = {42{1'b0}};
end
for(i=0; i<=       8 ; i=i+1) begin
tb_top.cpu.l2t2.fbtag.array.mb_cam_data[i] = {40{1'b0}};
end
for(i=0; i<=       8 ; i=i+1) begin
tb_top.cpu.l2t2.wbtag.array.mb_cam_data[i] = {40{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2t2.iqarray.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2t2.oqarray.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=       8 ; i=i+1) begin
tb_top.cpu.l2t2.rdmatag.array.mb_cam_data[i] = {40{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t2.subarray_0.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t2.subarray_1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t2.subarray_2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t2.subarray_3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t2.subarray_8.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t2.subarray_9.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t2.subarray_10.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t2.subarray_11.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t2.ic_row0.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t2.ic_row0.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t2.ic_row0.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t2.ic_row0.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t2.ic_row0.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t2.ic_row0.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t2.ic_row0.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t2.ic_row0.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t2.ic_row0.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t2.ic_row0.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t2.ic_row0.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t2.ic_row0.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t2.ic_row0.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t2.ic_row0.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t2.ic_row0.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t2.ic_row0.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t2.ic_row2.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t2.ic_row2.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t2.ic_row2.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t2.ic_row2.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t2.ic_row2.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t2.ic_row2.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t2.ic_row2.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t2.ic_row2.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t2.ic_row2.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t2.ic_row2.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t2.ic_row2.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t2.ic_row2.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t2.ic_row2.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t2.ic_row2.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t2.ic_row2.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t2.ic_row2.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t2.dc_row0.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t2.dc_row0.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t2.dc_row0.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t2.dc_row0.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t2.dc_row0.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t2.dc_row0.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t2.dc_row0.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t2.dc_row0.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t2.dc_row0.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t2.dc_row0.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t2.dc_row0.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t2.dc_row0.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t2.dc_row0.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t2.dc_row0.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t2.dc_row0.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t2.dc_row0.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t2.dc_row2.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t2.dc_row2.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t2.dc_row2.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t2.dc_row2.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t2.dc_row2.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t2.dc_row2.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t2.dc_row2.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t2.dc_row2.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t2.dc_row2.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t2.dc_row2.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t2.dc_row2.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t2.dc_row2.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t2.dc_row2.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t2.dc_row2.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t2.dc_row2.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t2.dc_row2.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t3.tag.quad0.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t3.tag.quad0.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t3.tag.quad0.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t3.tag.quad0.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t3.tag.quad1.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t3.tag.quad1.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t3.tag.quad1.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t3.tag.quad1.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t3.tag.quad2.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t3.tag.quad2.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t3.tag.quad2.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t3.tag.quad2.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t3.tag.quad3.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t3.tag.quad3.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t3.tag.quad3.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t3.tag.quad3.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t3.mbdata.array.inq_ary[i] = {128{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t3.mbtag.array.mb_cam_data[i] = {42{1'b0}};
end
for(i=0; i<=       8 ; i=i+1) begin
tb_top.cpu.l2t3.fbtag.array.mb_cam_data[i] = {40{1'b0}};
end
for(i=0; i<=       8 ; i=i+1) begin
tb_top.cpu.l2t3.wbtag.array.mb_cam_data[i] = {40{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2t3.iqarray.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2t3.oqarray.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=       8 ; i=i+1) begin
tb_top.cpu.l2t3.rdmatag.array.mb_cam_data[i] = {40{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t3.subarray_0.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t3.subarray_1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t3.subarray_2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t3.subarray_3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t3.subarray_8.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t3.subarray_9.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t3.subarray_10.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t3.subarray_11.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t3.ic_row0.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t3.ic_row0.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t3.ic_row0.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t3.ic_row0.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t3.ic_row0.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t3.ic_row0.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t3.ic_row0.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t3.ic_row0.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t3.ic_row0.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t3.ic_row0.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t3.ic_row0.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t3.ic_row0.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t3.ic_row0.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t3.ic_row0.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t3.ic_row0.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t3.ic_row0.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t3.ic_row2.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t3.ic_row2.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t3.ic_row2.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t3.ic_row2.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t3.ic_row2.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t3.ic_row2.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t3.ic_row2.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t3.ic_row2.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t3.ic_row2.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t3.ic_row2.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t3.ic_row2.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t3.ic_row2.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t3.ic_row2.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t3.ic_row2.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t3.ic_row2.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t3.ic_row2.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t3.dc_row0.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t3.dc_row0.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t3.dc_row0.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t3.dc_row0.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t3.dc_row0.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t3.dc_row0.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t3.dc_row0.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t3.dc_row0.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t3.dc_row0.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t3.dc_row0.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t3.dc_row0.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t3.dc_row0.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t3.dc_row0.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t3.dc_row0.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t3.dc_row0.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t3.dc_row0.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t3.dc_row2.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t3.dc_row2.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t3.dc_row2.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t3.dc_row2.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t3.dc_row2.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t3.dc_row2.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t3.dc_row2.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t3.dc_row2.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t3.dc_row2.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t3.dc_row2.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t3.dc_row2.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t3.dc_row2.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t3.dc_row2.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t3.dc_row2.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t3.dc_row2.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t3.dc_row2.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t4.tag.quad0.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t4.tag.quad0.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t4.tag.quad0.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t4.tag.quad0.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t4.tag.quad1.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t4.tag.quad1.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t4.tag.quad1.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t4.tag.quad1.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t4.tag.quad2.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t4.tag.quad2.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t4.tag.quad2.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t4.tag.quad2.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t4.tag.quad3.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t4.tag.quad3.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t4.tag.quad3.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t4.tag.quad3.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t4.mbdata.array.inq_ary[i] = {128{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t4.mbtag.array.mb_cam_data[i] = {42{1'b0}};
end
for(i=0; i<=       8 ; i=i+1) begin
tb_top.cpu.l2t4.fbtag.array.mb_cam_data[i] = {40{1'b0}};
end
for(i=0; i<=       8 ; i=i+1) begin
tb_top.cpu.l2t4.wbtag.array.mb_cam_data[i] = {40{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2t4.iqarray.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2t4.oqarray.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=       8 ; i=i+1) begin
tb_top.cpu.l2t4.rdmatag.array.mb_cam_data[i] = {40{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t4.subarray_0.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t4.subarray_1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t4.subarray_2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t4.subarray_3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t4.subarray_8.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t4.subarray_9.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t4.subarray_10.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t4.subarray_11.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t4.ic_row0.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t4.ic_row0.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t4.ic_row0.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t4.ic_row0.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t4.ic_row0.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t4.ic_row0.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t4.ic_row0.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t4.ic_row0.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t4.ic_row0.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t4.ic_row0.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t4.ic_row0.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t4.ic_row0.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t4.ic_row0.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t4.ic_row0.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t4.ic_row0.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t4.ic_row0.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t4.ic_row2.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t4.ic_row2.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t4.ic_row2.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t4.ic_row2.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t4.ic_row2.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t4.ic_row2.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t4.ic_row2.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t4.ic_row2.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t4.ic_row2.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t4.ic_row2.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t4.ic_row2.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t4.ic_row2.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t4.ic_row2.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t4.ic_row2.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t4.ic_row2.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t4.ic_row2.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t4.dc_row0.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t4.dc_row0.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t4.dc_row0.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t4.dc_row0.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t4.dc_row0.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t4.dc_row0.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t4.dc_row0.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t4.dc_row0.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t4.dc_row0.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t4.dc_row0.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t4.dc_row0.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t4.dc_row0.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t4.dc_row0.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t4.dc_row0.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t4.dc_row0.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t4.dc_row0.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t4.dc_row2.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t4.dc_row2.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t4.dc_row2.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t4.dc_row2.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t4.dc_row2.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t4.dc_row2.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t4.dc_row2.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t4.dc_row2.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t4.dc_row2.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t4.dc_row2.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t4.dc_row2.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t4.dc_row2.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t4.dc_row2.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t4.dc_row2.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t4.dc_row2.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t4.dc_row2.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t5.tag.quad0.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t5.tag.quad0.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t5.tag.quad0.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t5.tag.quad0.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t5.tag.quad1.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t5.tag.quad1.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t5.tag.quad1.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t5.tag.quad1.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t5.tag.quad2.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t5.tag.quad2.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t5.tag.quad2.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t5.tag.quad2.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t5.tag.quad3.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t5.tag.quad3.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t5.tag.quad3.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t5.tag.quad3.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t5.mbdata.array.inq_ary[i] = {128{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t5.mbtag.array.mb_cam_data[i] = {42{1'b0}};
end
for(i=0; i<=       8 ; i=i+1) begin
tb_top.cpu.l2t5.fbtag.array.mb_cam_data[i] = {40{1'b0}};
end
for(i=0; i<=       8 ; i=i+1) begin
tb_top.cpu.l2t5.wbtag.array.mb_cam_data[i] = {40{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2t5.iqarray.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2t5.oqarray.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=       8 ; i=i+1) begin
tb_top.cpu.l2t5.rdmatag.array.mb_cam_data[i] = {40{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t5.subarray_0.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t5.subarray_1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t5.subarray_2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t5.subarray_3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t5.subarray_8.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t5.subarray_9.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t5.subarray_10.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t5.subarray_11.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t5.ic_row0.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t5.ic_row0.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t5.ic_row0.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t5.ic_row0.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t5.ic_row0.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t5.ic_row0.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t5.ic_row0.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t5.ic_row0.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t5.ic_row0.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t5.ic_row0.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t5.ic_row0.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t5.ic_row0.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t5.ic_row0.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t5.ic_row0.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t5.ic_row0.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t5.ic_row0.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t5.ic_row2.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t5.ic_row2.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t5.ic_row2.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t5.ic_row2.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t5.ic_row2.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t5.ic_row2.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t5.ic_row2.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t5.ic_row2.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t5.ic_row2.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t5.ic_row2.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t5.ic_row2.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t5.ic_row2.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t5.ic_row2.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t5.ic_row2.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t5.ic_row2.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t5.ic_row2.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t5.dc_row0.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t5.dc_row0.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t5.dc_row0.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t5.dc_row0.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t5.dc_row0.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t5.dc_row0.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t5.dc_row0.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t5.dc_row0.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t5.dc_row0.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t5.dc_row0.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t5.dc_row0.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t5.dc_row0.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t5.dc_row0.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t5.dc_row0.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t5.dc_row0.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t5.dc_row0.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t5.dc_row2.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t5.dc_row2.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t5.dc_row2.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t5.dc_row2.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t5.dc_row2.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t5.dc_row2.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t5.dc_row2.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t5.dc_row2.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t5.dc_row2.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t5.dc_row2.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t5.dc_row2.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t5.dc_row2.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t5.dc_row2.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t5.dc_row2.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t5.dc_row2.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t5.dc_row2.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t6.tag.quad0.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t6.tag.quad0.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t6.tag.quad0.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t6.tag.quad0.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t6.tag.quad1.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t6.tag.quad1.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t6.tag.quad1.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t6.tag.quad1.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t6.tag.quad2.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t6.tag.quad2.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t6.tag.quad2.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t6.tag.quad2.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t6.tag.quad3.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t6.tag.quad3.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t6.tag.quad3.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t6.tag.quad3.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t6.mbdata.array.inq_ary[i] = {128{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t6.mbtag.array.mb_cam_data[i] = {42{1'b0}};
end
for(i=0; i<=       8 ; i=i+1) begin
tb_top.cpu.l2t6.fbtag.array.mb_cam_data[i] = {40{1'b0}};
end
for(i=0; i<=       8 ; i=i+1) begin
tb_top.cpu.l2t6.wbtag.array.mb_cam_data[i] = {40{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2t6.iqarray.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2t6.oqarray.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=       8 ; i=i+1) begin
tb_top.cpu.l2t6.rdmatag.array.mb_cam_data[i] = {40{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t6.subarray_0.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t6.subarray_1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t6.subarray_2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t6.subarray_3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t6.subarray_8.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t6.subarray_9.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t6.subarray_10.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t6.subarray_11.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t6.ic_row0.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t6.ic_row0.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t6.ic_row0.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t6.ic_row0.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t6.ic_row0.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t6.ic_row0.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t6.ic_row0.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t6.ic_row0.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t6.ic_row0.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t6.ic_row0.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t6.ic_row0.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t6.ic_row0.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t6.ic_row0.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t6.ic_row0.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t6.ic_row0.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t6.ic_row0.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t6.ic_row2.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t6.ic_row2.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t6.ic_row2.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t6.ic_row2.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t6.ic_row2.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t6.ic_row2.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t6.ic_row2.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t6.ic_row2.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t6.ic_row2.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t6.ic_row2.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t6.ic_row2.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t6.ic_row2.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t6.ic_row2.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t6.ic_row2.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t6.ic_row2.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t6.ic_row2.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t6.dc_row0.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t6.dc_row0.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t6.dc_row0.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t6.dc_row0.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t6.dc_row0.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t6.dc_row0.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t6.dc_row0.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t6.dc_row0.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t6.dc_row0.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t6.dc_row0.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t6.dc_row0.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t6.dc_row0.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t6.dc_row0.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t6.dc_row0.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t6.dc_row0.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t6.dc_row0.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t6.dc_row2.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t6.dc_row2.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t6.dc_row2.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t6.dc_row2.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t6.dc_row2.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t6.dc_row2.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t6.dc_row2.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t6.dc_row2.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t6.dc_row2.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t6.dc_row2.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t6.dc_row2.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t6.dc_row2.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t6.dc_row2.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t6.dc_row2.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t6.dc_row2.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t6.dc_row2.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t7.tag.quad0.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t7.tag.quad0.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t7.tag.quad0.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t7.tag.quad0.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t7.tag.quad1.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t7.tag.quad1.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t7.tag.quad1.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t7.tag.quad1.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t7.tag.quad2.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t7.tag.quad2.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t7.tag.quad2.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t7.tag.quad2.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t7.tag.quad3.bank0.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t7.tag.quad3.bank0.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t7.tag.quad3.bank1.l2t_array.mem_lft[i] = {31{1'b0}};
end
for(i=0; i<=     512 ; i=i+1) begin
tb_top.cpu.l2t7.tag.quad3.bank1.l2t_array.mem_rgt[i] = {27{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t7.mbdata.array.inq_ary[i] = {128{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t7.mbtag.array.mb_cam_data[i] = {42{1'b0}};
end
for(i=0; i<=       8 ; i=i+1) begin
tb_top.cpu.l2t7.fbtag.array.mb_cam_data[i] = {40{1'b0}};
end
for(i=0; i<=       8 ; i=i+1) begin
tb_top.cpu.l2t7.wbtag.array.mb_cam_data[i] = {40{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2t7.iqarray.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2t7.oqarray.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=       8 ; i=i+1) begin
tb_top.cpu.l2t7.rdmatag.array.mb_cam_data[i] = {40{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t7.subarray_0.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t7.subarray_1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t7.subarray_2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t7.subarray_3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t7.subarray_8.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t7.subarray_9.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t7.subarray_10.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      32 ; i=i+1) begin
tb_top.cpu.l2t7.subarray_11.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t7.ic_row0.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t7.ic_row0.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t7.ic_row0.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t7.ic_row0.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t7.ic_row0.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t7.ic_row0.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t7.ic_row0.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t7.ic_row0.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t7.ic_row0.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t7.ic_row0.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t7.ic_row0.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t7.ic_row0.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t7.ic_row0.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t7.ic_row0.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t7.ic_row0.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t7.ic_row0.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t7.ic_row2.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t7.ic_row2.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t7.ic_row2.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t7.ic_row2.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t7.ic_row2.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t7.ic_row2.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t7.ic_row2.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t7.ic_row2.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t7.ic_row2.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t7.ic_row2.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t7.ic_row2.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t7.ic_row2.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t7.ic_row2.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t7.ic_row2.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t7.ic_row2.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t7.ic_row2.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t7.dc_row0.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t7.dc_row0.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t7.dc_row0.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t7.dc_row0.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t7.dc_row0.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t7.dc_row0.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t7.dc_row0.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t7.dc_row0.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t7.dc_row0.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t7.dc_row0.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t7.dc_row0.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t7.dc_row0.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t7.dc_row0.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t7.dc_row0.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t7.dc_row0.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t7.dc_row0.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t7.dc_row2.panel0.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t7.dc_row2.panel0.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t7.dc_row2.panel0.array.valid[i] = 1'b0;
tb_top.cpu.l2t7.dc_row2.panel0.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t7.dc_row2.panel1.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t7.dc_row2.panel1.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t7.dc_row2.panel1.array.valid[i] = 1'b0;
tb_top.cpu.l2t7.dc_row2.panel1.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t7.dc_row2.panel2.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t7.dc_row2.panel2.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t7.dc_row2.panel2.array.valid[i] = 1'b0;
tb_top.cpu.l2t7.dc_row2.panel2.array.parity[i] = 1'b0;
end
for(i=0; i<=      64 ; i=i+1) begin
tb_top.cpu.l2t7.dc_row2.panel3.array.addr_array[i] = {13{1'b0}};
tb_top.cpu.l2t7.dc_row2.panel3.array.addr_bit4[i] = 1'b0;
tb_top.cpu.l2t7.dc_row2.panel3.array.valid[i] = 1'b0;
tb_top.cpu.l2t7.dc_row2.panel3.array.parity[i] = 1'b0;
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b0.fb_array4.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b0.fb_array3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b0.fb_array2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b0.fb_array1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b0.wb_array4.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b0.wb_array3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b0.wb_array2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b0.wb_array1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b0.rdma_array4.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b0.rdma_array3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b0.rdma_array2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b0.rdma_array1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b1.fb_array4.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b1.fb_array3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b1.fb_array2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b1.fb_array1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b1.wb_array4.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b1.wb_array3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b1.wb_array2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b1.wb_array1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b1.rdma_array4.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b1.rdma_array3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b1.rdma_array2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b1.rdma_array1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b2.fb_array4.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b2.fb_array3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b2.fb_array2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b2.fb_array1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b2.wb_array4.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b2.wb_array3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b2.wb_array2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b2.wb_array1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b2.rdma_array4.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b2.rdma_array3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b2.rdma_array2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b2.rdma_array1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b3.fb_array4.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b3.fb_array3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b3.fb_array2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b3.fb_array1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b3.wb_array4.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b3.wb_array3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b3.wb_array2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b3.wb_array1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b3.rdma_array4.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b3.rdma_array3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b3.rdma_array2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b3.rdma_array1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b4.fb_array4.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b4.fb_array3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b4.fb_array2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b4.fb_array1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b4.wb_array4.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b4.wb_array3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b4.wb_array2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b4.wb_array1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b4.rdma_array4.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b4.rdma_array3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b4.rdma_array2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b4.rdma_array1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b5.fb_array4.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b5.fb_array3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b5.fb_array2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b5.fb_array1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b5.wb_array4.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b5.wb_array3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b5.wb_array2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b5.wb_array1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b5.rdma_array4.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b5.rdma_array3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b5.rdma_array2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b5.rdma_array1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b6.fb_array4.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b6.fb_array3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b6.fb_array2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b6.fb_array1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b6.wb_array4.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b6.wb_array3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b6.wb_array2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b6.wb_array1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b6.rdma_array4.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b6.rdma_array3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b6.rdma_array2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b6.rdma_array1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b7.fb_array4.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b7.fb_array3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b7.fb_array2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b7.fb_array1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b7.wb_array4.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b7.wb_array3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b7.wb_array2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b7.wb_array1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b7.rdma_array4.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b7.rdma_array3.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b7.rdma_array2.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=      16 ; i=i+1) begin
tb_top.cpu.l2b7.rdma_array1.array.inq_ary[i] = {160{1'b0}};
end
for(i=0; i<=     128 ; i=i+1) begin
tb_top.cpu.spc0.lsu.tlb.array.cam.context_a[i] = {13{1'b0}};
end
for(i=0; i<=     128 ; i=i+1) begin
tb_top.cpu.spc0.lsu.tlb.array.cam.context_a_[i] = {13{1'b1}};
end
for(i=0; i<=     128 ; i=i+1) begin
tb_top.cpu.spc0.lsu.tlb.array.cam.context_b[i] = {13{1'b0}};
end
for(i=0; i<=     128 ; i=i+1) begin
tb_top.cpu.spc0.lsu.tlb.array.cam.context_b_[i] = {13{1'b1}};
end
for(i=0; i<=     128 ; i=i+1) begin
tb_top.cpu.spc0.lsu.tlb.array.cam.r_bit[i] = {1{1'b0}};
end
for(i=0; i<=     128 ; i=i+1) begin
tb_top.cpu.spc0.lsu.tlb.array.cam.r_bit_[i] = {1{1'b1}};
end
for(i=0; i<=     128 ; i=i+1) begin
tb_top.cpu.spc0.lsu.tlb.array.cam.va_47_28[i] = {20{1'b0}};
end
for(i=0; i<=     128 ; i=i+1) begin
tb_top.cpu.spc0.lsu.tlb.array.cam.va_47_28_[i] = {20{1'b1}};
end
for(i=0; i<=     128 ; i=i+1) begin
tb_top.cpu.spc0.lsu.tlb.array.cam.va_27_22[i] = {6{1'b0}};
end
for(i=0; i<=     128 ; i=i+1) begin
tb_top.cpu.spc0.lsu.tlb.array.cam.va_27_22_[i] = {6{1'b1}};
end
for(i=0; i<=     128 ; i=i+1) begin
tb_top.cpu.spc0.lsu.tlb.array.cam.va_21_16[i] = {6{1'b0}};
end
for(i=0; i<=     128 ; i=i+1) begin
tb_top.cpu.spc0.lsu.tlb.array.cam.va_21_16_[i] = {6{1'b1}};
end
for(i=0; i<=     128 ; i=i+1) begin
tb_top.cpu.spc0.lsu.tlb.array.cam.va_15_13[i] = {3{1'b0}};
end
for(i=0; i<=     128 ; i=i+1) begin
tb_top.cpu.spc0.lsu.tlb.array.cam.va_15_13_[i] = {3{1'b1}};
end
for(i=0; i<=     128 ; i=i+1) begin
tb_top.cpu.spc0.lsu.tlb.array.cam.pid[i] = {3{1'b0}};
end
for(i=0; i<=     128 ; i=i+1) begin
tb_top.cpu.spc0.lsu.tlb.array.cam.pid_[i] = {3{1'b1}};
end
for(i=0; i<=     128 ; i=i+1) begin
tb_top.cpu.spc0.lsu.tlb.array.ram.tlb_data[i] = {38{1'b0}};
end
//IRF needs to be cleaned up      
for (i=0; i<128; i=i+1) begin
tb_top.cpu.spc0.exu0.irf.irf_array.active_window[i] = {72{1'b0}};
tb_top.cpu.spc0.exu0.irf.irf_array.evens[i]         = {72{1'b0}};
tb_top.cpu.spc0.exu0.irf.irf_array.odds[i]          = {72{1'b0}};
tb_top.cpu.spc0.exu0.irf.irf_array.globals[i]       = {72{1'b0}};
tb_top.cpu.spc0.exu0.irf.irf_array.locals[i]        = {72{1'b0}};
tb_top.cpu.spc0.exu0.irf.irf_array.locals[i+128]    = {72{1'b0}};
end
for (i=0; i<128; i=i+1) begin
tb_top.cpu.spc0.exu1.irf.irf_array.active_window[i] = {72{1'b0}};
tb_top.cpu.spc0.exu1.irf.irf_array.evens[i]         = {72{1'b0}};
tb_top.cpu.spc0.exu1.irf.irf_array.odds[i]          = {72{1'b0}};
tb_top.cpu.spc0.exu1.irf.irf_array.globals[i]       = {72{1'b0}};
tb_top.cpu.spc0.exu1.irf.irf_array.locals[i]        = {72{1'b0}};
tb_top.cpu.spc0.exu1.irf.irf_array.locals[i+128]    = {72{1'b0}};
end
///////////////////////////////////////////////////
//Cleaning up L1
///////////////////////////////////////////////////
for (i=0; i<128; i=i+1) begin
tb_top.cpu.spc0.lsu.dca.array.way01.left.mem[i]    = {128{1'b0}};
tb_top.cpu.spc0.lsu.dca.array.way01.right.mem[i]   = {128{1'b0}};
tb_top.cpu.spc0.lsu.dca.array.way23.left.mem[i]    = {128{1'b0}};
tb_top.cpu.spc0.lsu.dca.array.way23.right.mem[i]   = {128{1'b0}};
end

for (i=0; i<32; i=i+1) begin
tb_top.cpu.spc0.lsu.lru.array.mem[i]                  = {32{1'b0}};
end

for (i=0; i<32; i=i+1) begin
tb_top.cpu.spc0.lsu.cpq.array.mem[i]                  = {152{1'b0}};
end

for (i=0; i<64; i=i+1) begin
tb_top.cpu.spc0.lsu.stb_cam.cam_array.stb_ramc[i]     = {45{1'b0}};
end

for (i=0; i<64; i=i+1) begin
tb_top.cpu.spc0.lsu.stb_ram.array.mem[i]              = {84{1'b0}};
end


for (i=0; i<128; i=i+1) begin
tb_top.cpu.spc0.lsu.dta.way0.mem[i]                = {30{1'b0}};
tb_top.cpu.spc0.lsu.dta.way1.mem[i]                = {30{1'b0}};
tb_top.cpu.spc0.lsu.dta.way2.mem[i]                = {30{1'b0}};
tb_top.cpu.spc0.lsu.dta.way3.mem[i]                = {30{1'b0}};
end


for (i=0; i<32; i=i+1) begin
tb_top.cpu.spc0.lsu.dva.array.mem[i]                  = {32{1'b0}};
end

for (i=0; i<64; i=i+1) begin
tb_top.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_3.w7_to_w4_bank.left_sb_array.mem[i]  = {144{1'b0}};//[ 143:0] size=    64 
tb_top.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_3.w3_to_w0_bank.left_sb_array.mem[i]  = {144{1'b0}};//[ 143:0] size=    64 
tb_top.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_2.w7_to_w4_bank.left_sb_array.mem[i]  = {144{1'b0}};//[ 143:0] size=    64 
tb_top.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_2.w3_to_w0_bank.left_sb_array.mem[i]  = {144{1'b0}};//[ 143:0] size=    64 
tb_top.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_1.w7_to_w4_bank.left_sb_array.mem[i]  = {144{1'b0}};//[ 143:0] size=    64 
tb_top.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_0.w3_to_w0_bank.left_sb_array.mem[i]  = {144{1'b0}};//[ 143:0] size=    64 
tb_top.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_0.w7_to_w4_bank.left_sb_array.mem[i]  = {144{1'b0}};//[ 143:0] size=    64 
tb_top.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_1.w3_to_w0_bank.left_sb_array.mem[i]  = {144{1'b0}};//[ 143:0] size=    64 
end

for (i=0; i<64; i=i+1) begin
tb_top.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_0.w3_to_w0_bank.right_sb_array.mem[i]  = {136{1'b0}};//[ 135:0] size=    64 
tb_top.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_0.w7_to_w4_bank.right_sb_array.mem[i]  = {136{1'b0}};//[ 135:0] size=    64 
tb_top.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_1.w3_to_w0_bank.right_sb_array.mem[i]  = {136{1'b0}};//[ 135:0] size=    64 
tb_top.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_1.w7_to_w4_bank.right_sb_array.mem[i]  = {136{1'b0}};//[ 135:0] size=    64 
tb_top.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_2.w3_to_w0_bank.right_sb_array.mem[i]  = {136{1'b0}};//[ 135:0] size=    64 
tb_top.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_2.w7_to_w4_bank.right_sb_array.mem[i]  = {136{1'b0}};//[ 135:0] size=    64 
tb_top.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_3.w3_to_w0_bank.right_sb_array.mem[i]  = {136{1'b0}};//[ 135:0] size=    64 
tb_top.cpu.spc0.ifu_ftu.ftu_icd_cust.quad_3.w7_to_w4_bank.right_sb_array.mem[i]  = {136{1'b0}};//[ 135:0] size=    64 
end

for (i=0; i<64; i=i+1) begin 
tb_top.cpu.spc0.ifu_ftu.ftu_ict_cust.tag_way_0.mem[i]  = {64{1'b0}};//[  29:0] size=    64 
tb_top.cpu.spc0.ifu_ftu.ftu_ict_cust.tag_way_1.mem[i]  = {64{1'b0}};//[  29:0] size=    64 
tb_top.cpu.spc0.ifu_ftu.ftu_ict_cust.tag_way_2.mem[i]  = {64{1'b0}};//[  29:0] size=    64 
tb_top.cpu.spc0.ifu_ftu.ftu_ict_cust.tag_way_3.mem[i]  = {64{1'b0}};//[  29:0] size=    64 
tb_top.cpu.spc0.ifu_ftu.ftu_ict_cust.tag_way_4.mem[i]  = {64{1'b0}};//[  29:0] size=    64 
tb_top.cpu.spc0.ifu_ftu.ftu_ict_cust.tag_way_5.mem[i]  = {64{1'b0}};//[  29:0] size=    64 
tb_top.cpu.spc0.ifu_ftu.ftu_ict_cust.tag_way_6.mem[i]  = {64{1'b0}};//[  29:0] size=    64 
tb_top.cpu.spc0.ifu_ftu.ftu_ict_cust.tag_way_7.mem[i]  = {64{1'b0}};//[  29:0] size=    64 
end 

for (i=0; i<32; i=i+1) begin
tb_top.cpu.spc0.ifu_ftu.ftu_icv_cust.array.mem[i] = {32{1'b0}};  //[  31:0] size=    32 
end

$display("%t,   End  FAST BISI\n",$time);
end		// if(fast_bisi_en)
end
endmodule
`endif
