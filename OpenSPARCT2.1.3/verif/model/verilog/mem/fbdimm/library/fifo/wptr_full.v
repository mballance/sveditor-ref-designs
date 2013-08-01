// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: wptr_full.v
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
module wptr_full ( wfull,waddr,wptr,wrptr2,winc,wclk,wrst_n);
parameter ADDRSIZE = 6;
output                wfull;
output [ADDRSIZE-1:0] waddr;
output [ADDRSIZE:0]   wptr;
input  [ADDRSIZE:0]   wrptr2;
input                 winc,wclk,wrst_n;
reg    [ADDRSIZE:0]   wptr,wbin,wgnext,wbnext;
reg                   wfull,waddrmsb;

// graystyle pointer

always @(posedge wclk or negedge wrst_n)
  if ( !wrst_n ) begin
    wptr <= 0;
    waddrmsb <= 0;
    wgnext <= 0;
    wbnext <= 0;
    wbin <=0;
  end
  else begin
    wptr <= wgnext;
    waddrmsb <= wgnext[ADDRSIZE]^wgnext[ADDRSIZE-1];
  end

always @(wptr or winc) begin : Gray_inc
  integer i;
  for ( i=0; i<ADDRSIZE; i=i+1)
     wbin[i] <= ^(wptr>>i);
  if ( !wfull ) wbnext <= wbin + winc;
  else          wbnext <= wbin;
  wgnext <= ( wbnext >> 1 ) ^ wbnext;
end


// memory wirte address pointer

assign waddr = {waddrmsb,wptr[ADDRSIZE-2:0]};

wire w_2ndmsb = wgnext[ADDRSIZE] ^ wgnext[ADDRSIZE-1];
wire wr_2ndmsb = wrptr2[ADDRSIZE] ^ wrptr2[ADDRSIZE-1];

always @(posedge wclk or negedge wrst_n)
  if ( !wrst_n ) wfull <=0;
  else           wfull <=((wgnext[ADDRSIZE] != wrptr2[ADDRSIZE]) &&
                           (w_2ndmsb         == wr_2ndmsb      ) &&
                           (wgnext[ADDRSIZE-2:0] ==  wrptr2[ADDRSIZE-2:0]));

endmodule
