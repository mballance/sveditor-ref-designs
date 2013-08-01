// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: nb_crc_error_injector.v
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
module nb_crc_error_injector(pn_in,pn_out,init,sclk);
parameter DS=0;

// interface signals
input  [13:0] pn_in;
output [13:0] pn_out;
input         init;
input         sclk;

reg [13:0] pn0_crc_mask;
reg [13:0] pn1_crc_mask;
reg [13:0] pn2_crc_mask;
reg [13:0] pn3_crc_mask;
reg [13:0] pn4_crc_mask;
reg [13:0] pn5_crc_mask;
reg [13:0] pn6_crc_mask;
reg [13:0] pn7_crc_mask;
reg [13:0] pn8_crc_mask;
reg [13:0] pn9_crc_mask;
reg [13:0] pn10_crc_mask;
reg [13:0] pn11_crc_mask;
reg [11:0] pn_frame_num;
reg [3:0]  tr_counter;
reg [11:0] pn_crc_freq;
reg [11:0] pn_crc_period;
reg        crc_en;
reg [15:0] frame_counter;
wire       module_en = (DS == 0 );
wire [15:0] crc_clock_period = (pn_crc_freq+pn_crc_period)*16'h6;

always@(posedge sclk) if ( ~init && ( pn_frame_num !==0 ) )
begin


 if ( frame_counter !== crc_clock_period )
 begin

  if ( frame_counter < (pn_crc_freq*12) )
    crc_en = 1;
  else
    crc_en =0;

  frame_counter=frame_counter+1;

 end if ( frame_counter == crc_clock_period )
   frame_counter = 0;

 

  if ( tr_counter == 4'hb ) begin
    tr_counter=0;

    // If pn_frame_num is FFF, then all frames will have the same crc
    if ( pn_frame_num == 12'hfff ) begin
      crc_en = 1;
    end
    // If pn_frame_num is non-zero, N number of frames will have crc errors
    // then crc will be turned off
    else if ( pn_frame_num !== 0 ) begin
     crc_en = 1;
     pn_frame_num = pn_frame_num - 1;
    end
    else
      crc_en = 0;

  end
   else
    tr_counter=tr_counter+1;

end
else
  crc_en = 0;


assign pn_out = ( ~module_en || init || ~crc_en) ? pn_in:
                ((tr_counter == 4'h0 ) && crc_en) ? pn_in ^ pn0_crc_mask :
                ((tr_counter == 4'h1 ) && crc_en) ? pn_in ^ pn1_crc_mask :
                ((tr_counter == 4'h2 ) && crc_en) ? pn_in ^ pn2_crc_mask :
                ((tr_counter == 4'h3 ) && crc_en) ? pn_in ^ pn3_crc_mask :
                ((tr_counter == 4'h4 ) && crc_en) ? pn_in ^ pn4_crc_mask :
                ((tr_counter == 4'h5 ) && crc_en) ? pn_in ^ pn5_crc_mask :
                ((tr_counter == 4'h6 ) && crc_en) ? pn_in ^ pn6_crc_mask :
                ((tr_counter == 4'h7 ) && crc_en) ? pn_in ^ pn7_crc_mask :
                ((tr_counter == 4'h8 ) && crc_en) ? pn_in ^ pn8_crc_mask :
                ((tr_counter == 4'h9 ) && crc_en) ? pn_in ^ pn9_crc_mask :
                ((tr_counter == 4'ha ) && crc_en) ? pn_in ^ pn10_crc_mask :
                ((tr_counter == 4'hb ) && crc_en) ? pn_in ^ pn11_crc_mask :
                 pn_in ;


reg dummy;
initial
begin

tr_counter=0;
pn0_crc_mask=14'h0;
pn1_crc_mask=14'h0;
pn2_crc_mask=14'h0;
pn3_crc_mask=14'h0;
pn4_crc_mask=14'h0;
pn5_crc_mask=14'h0;
pn6_crc_mask=14'h0;
pn7_crc_mask=14'h0;
pn8_crc_mask=14'h0;
pn9_crc_mask=14'h0;
pn10_crc_mask=14'h0;
pn11_crc_mask=14'h0;
pn_frame_num=0;
frame_counter=0;
pn_crc_freq=0;
pn_crc_period=0;
crc_en=0;

`ifdef AXIS_FBDIMM_HW
`else
dummy=$value$plusargs("pn0_crc_mask=%h",pn0_crc_mask);
dummy=$value$plusargs("pn1_crc_mask=%h",pn1_crc_mask);
dummy=$value$plusargs("pn2_crc_mask=%h",pn2_crc_mask);
dummy=$value$plusargs("pn3_crc_mask=%h",pn3_crc_mask);
dummy=$value$plusargs("pn4_crc_mask=%h",pn4_crc_mask);
dummy=$value$plusargs("pn5_crc_mask=%h",pn5_crc_mask);
dummy=$value$plusargs("pn6_crc_mask=%h",pn6_crc_mask);
dummy=$value$plusargs("pn7_crc_mask=%h",pn7_crc_mask);
dummy=$value$plusargs("pn8_crc_mask=%h",pn8_crc_mask);
dummy=$value$plusargs("pn9_crc_mask=%h",pn9_crc_mask);
dummy=$value$plusargs("pn10_crc_mask=%h",pn10_crc_mask);
dummy=$value$plusargs("pn11_crc_mask=%h",pn11_crc_mask);
dummy=$value$plusargs("pn_frame_num=%h",pn_frame_num);
dummy=$value$plusargs("pn_crc_freq=%h",pn_crc_freq);
dummy=$value$plusargs("pn_crc_period=%h",pn_crc_period);
`endif

/*
$display("CRC: pn0_crc_mask = %h\n",pn0_crc_mask);
$display("CRC: pn1_crc_mask = %h\n",pn1_crc_mask);
$display("CRC: pn2_crc_mask = %h\n",pn2_crc_mask);
$display("CRC: pn3_crc_mask = %h\n",pn3_crc_mask);
$display("CRC: pn4_crc_mask = %h\n",pn4_crc_mask);
$display("CRC: pn5_crc_mask = %h\n",pn5_crc_mask);
$display("CRC: pn6_crc_mask = %h\n",pn6_crc_mask);
$display("CRC: pn7_crc_mask = %h\n",pn7_crc_mask);
$display("CRC: pn8_crc_mask = %h\n",pn8_crc_mask);
$display("CRC: pn9_crc_mask = %h\n",pn9_crc_mask);
$display("CRC: pn10_crc_mask = %h\n",pn10_crc_mask);
$display("CRC: pn11_crc_mask = %h\n",pn11_crc_mask);
*/

end


endmodule

