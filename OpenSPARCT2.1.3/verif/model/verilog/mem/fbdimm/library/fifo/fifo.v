// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fifo.v
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
module fbd_fifo (rdata,wfull,rempty,wdata,winc,wclk,wrst_n,rinc,rclk,rrst_n,count);
parameter DSIZE = 72;
parameter ASIZE = 6;

output [DSIZE-1:0] rdata;
output             wfull;
output             rempty;
input  [DSIZE-1:0] wdata;
input              winc,wclk,wrst_n;
input              rinc,rclk,rrst_n;
output [ASIZE-1:0] count;
reg   [ASIZE-1:0]  count_reg;

wire [ASIZE-1:0]  waddr,raddr;
wire [ASIZE:0] wptr,rptr,wrptr2,rwptr2;

wire [ASIZE-1:0] count = count_reg;

 

sync_r2w #(ASIZE) sync_r2w ( .wrptr2(wrptr2),
                     .rptr(rptr),
                     .wclk(wclk),
                     .wrst_n(wrst_n));

sync_w2r  #(ASIZE) sync_w2r(  .rwptr2(rwptr2),
                     .wptr(wptr),
                     .rclk(rclk),
                     .rrst_n(rrst_n));

fifomem #(DSIZE,ASIZE) fifomem ( .rdata(rdata),
                                 .wdata(wdata),
                                 .waddr(waddr),
                                 .raddr(raddr),
                                 .wclken(winc),
                                 .wclk(wclk));

rptr_empty #(ASIZE) rptr_empty ( .rempty(rempty),
                                 .raddr(raddr),
                                 .rptr(rptr),
                                 .rwptr2(rwptr2),
                                 .rinc(rinc),
                                 .rclk(rclk),
                                 .rrst_n(rrst_n));

wptr_full #(ASIZE) wptr_full ( .wfull(wfull),
                               .waddr(waddr),
                               .wptr(wptr),
                               .wrptr2(wrptr2),
                               .winc(winc),    
                               .wclk(wclk),    
                               .wrst_n(wrst_n));


endmodule


module beh_fifo (rdata,wfull,rempty,wdata,winc,wclk,wrst_n,rinc,rclk,rrst_n,inv);
parameter DSIZE = 72;
parameter ASIZE = 6;

output [DSIZE-1:0] rdata;
output             wfull;
output             rempty;
input  [DSIZE-1:0] wdata;
input              winc,wclk,wrst_n;
input              rinc,rclk,rrst_n;
input              inv;
wire [ASIZE-1:0]  waddr,raddr;
reg [ASIZE:0] wptr,wrptr1,wrptr2,wrptr3;
reg [ASIZE:0] rptr,rwptr1,rwptr2,rwptr3;

parameter MEMDEPTH = 1<<ASIZE;

`ifdef AXIS
wire [DSIZE-1:0] axis_rdata ;
wire [DSIZE-1:0] axis_wdata = wdata;
wire axis_winc = winc;
wire axis_rinc = rinc;
wire axis_rclk = rclk;
wire axis_wclk = wclk;
wire [ASIZE-1:0] axis_rptr = (rinc && !rempty) ? rptr[ASIZE-1:0]+1 : rptr[ASIZE-1:0];
wire [ASIZE-1:0] axis_wptr = wptr[ASIZE-1:0];


`ifdef PALLADIUM

reg [(DSIZE - 1):0] ex_mem [0:MEMDEPTH-1];
reg [(DSIZE - 1):0] axis_rdata_reg;

assign axis_rdata=axis_rdata_reg;
always @ (posedge axis_rclk)
    axis_rdata_reg <= ex_mem[axis_rptr];

always @ (posedge axis_wclk)
begin
 if (axis_winc)
  ex_mem[axis_wptr] <= axis_wdata;

end

`else
axis_smem #(ASIZE,DSIZE,2,0) ex_mem ( {axis_rdata,{DSIZE{1'bz}}}, // output port
                                         {{DSIZE{1'bz}},axis_wdata},  // input port
                                         {axis_rptr,axis_wptr},  //address port
                                         {1'b0,axis_winc}, // write enable
                                         {1'b1,1'b1},  // chip enable
                                         {axis_rclk,axis_wclk},  // clock
                                         {{DSIZE{1'bz}},{DSIZE{1'bz}}} // write masks
                                        );

`endif // PALLADIUM

assign rdata = axis_rdata;
`else
  reg [DSIZE-1:0] ex_mem [0:MEMDEPTH-1];
`endif


`ifdef AXIS
initial begin
{rwptr3,rwptr2,rwptr1} = 0;
 rptr = 0;
 {wrptr3,wrptr2,wrptr1}  =0;
  wptr = 0; 
end

 always@(posedge wclk)
begin
 if ( !wrst_n || inv) wptr <= 0;
 else if (winc && ~wfull) begin
    wptr <= wptr+1;
 end
end

always@(posedge wclk) // or negedge wrst_n)
 if (!wrst_n  ) {wrptr3,wrptr2,wrptr1}  <=0;
 else if ( inv ) {wrptr3,wrptr2,wrptr1}  <=0;
 else          {wrptr3,wrptr2,wrptr1}  <= {wrptr2,wrptr1,rptr} ;

always@(posedge rclk ) //or negedge rrst_n)
 if (!rrst_n ) rptr <=0;
 else if ( inv) rptr <=0;
 else if ( rinc && !rempty ) rptr <= rptr+1;

always@(posedge rclk ) //or negedge rrst_n)
 if (!rrst_n  ) {rwptr3,rwptr2,rwptr1}  <=0;
 else if ( inv ) {rwptr3,rwptr2,rwptr1}  <=0;
 else          {rwptr3,rwptr2,rwptr1}  <= {rwptr2,rwptr1,wptr} ;

`else
// VCS control logic

initial begin
{rwptr3,rwptr2,rwptr1} = 0;
 rptr = 0;
 {wrptr3,wrptr2,wrptr1}  =0;
  wptr = 0; 
end


assign rdata=ex_mem[rptr[ASIZE-1:0]];

always@(posedge wclk) 
begin
 if ( !wrst_n || inv) wptr <= 0;
 else if (winc && ~wfull) begin
   ex_mem[wptr[ASIZE-1:0]] <= wdata;
   wptr <= wptr+1;
 end
end

always@(posedge wclk)
 if (!wrst_n || inv ) {wrptr3,wrptr2,wrptr1}  <=0;
 else          {wrptr3,wrptr2,wrptr1}  <= {wrptr2,wrptr1,rptr} ;

always@(posedge rclk)
 if (!rrst_n || inv) rptr <=0;
 else if ( rinc && !rempty ) rptr <= rptr+1;

always@(posedge rclk)
 if (!rrst_n || inv ) {rwptr3,rwptr2,rwptr1}  <=0;
 else          {rwptr3,rwptr2,rwptr1}  <= {rwptr2,rwptr1,wptr} ;

`endif

assign rempty = (rptr[ASIZE:0] == rwptr3[ASIZE:0]) ? 1'b1 : 1'b0;
assign wfull = (( wptr[ASIZE-1:0] == wrptr3[ASIZE-1:0]) & ( wptr[ASIZE] != wrptr3[ASIZE]));
endmodule

