// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sb_crc_error_injector.v
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
module sb_crc_error_injector( ps_in, ps_out, init, is_bar, link_clk);
   parameter	     SB_LINK=10;
   parameter	     DS=0;

   input [SB_LINK-1:0]  ps_in;
   output [SB_LINK-1:0] ps_out;
   input		     init;
   input		     link_clk;
   input 	             is_bar;

   reg [9:0]	     ps0_crc_mask;
   reg [9:0]	     ps1_crc_mask;
   reg [9:0]	     ps2_crc_mask;
   reg [9:0]	     ps3_crc_mask;
   reg [9:0]	     ps4_crc_mask;
   reg [9:0]	     ps5_crc_mask;
   reg [9:0]	     ps6_crc_mask;
   reg [9:0]	     ps7_crc_mask;
   reg [9:0]	     ps8_crc_mask;
   reg [9:0]	     ps9_crc_mask;
   reg [9:0]	     ps10_crc_mask;
   reg [9:0]	     ps11_crc_mask;
   reg [11:0]	     ps_frame_num;
   reg [3:0]	     tr_counter;
   reg [11:0]	     ps_crc_freq;
   reg [11:0]	     ps_crc_period;
   reg		     crc_en;
   reg [15:0]	     frame_counter;
   wire [15:0]	     crc_clock_period = (ps_crc_freq+ps_crc_period)*6;
   reg		     header_detected,enable_fsm;
   reg [3:0]	     fsr_counter,lock_counter,prev_counter;
   reg [3:0]	     fsr_counter2,lock_counter2;
   
reg [6:0] nop_cnt;
reg dummy;
wire frm_begin,frm_boundary;
wire tr_complete;
reg bypass_init;

reg [3:0] UI_counter;
reg start_UI_counter;

assign ps_out =  ( UI_counter  == 4'h1 ) & crc_en ? ( ps_in ^ ps0_crc_mask ) :
                 ( UI_counter  == 4'h2 ) & crc_en ? ( ps_in ^ ps1_crc_mask ) :
                 ( UI_counter  == 4'h3 ) & crc_en ? ( ps_in ^ ps2_crc_mask ) :
                 ( UI_counter  == 4'h4 ) & crc_en ? ( ps_in ^ ps3_crc_mask ) :
                 ( UI_counter  == 4'h5 ) & crc_en ? ( ps_in ^ ps4_crc_mask ) :
                 ( UI_counter  == 4'h6 ) & crc_en ? ( ps_in ^ ps5_crc_mask ) :
                 ( UI_counter  == 4'h7 ) & crc_en ? ( ps_in ^ ps6_crc_mask ) :
                 ( UI_counter  == 4'h8 ) & crc_en ? ( ps_in ^ ps7_crc_mask ) :
                 ( UI_counter  == 4'h9 ) & crc_en ? ( ps_in ^ ps8_crc_mask ) :
                 ( UI_counter  == 4'ha ) & crc_en ? ( ps_in ^ ps9_crc_mask ) :
                 ( UI_counter  == 4'hb ) & crc_en ? ( ps_in ^ ps10_crc_mask ) :
                 ( UI_counter  == 4'hc ) & crc_en ? ( ps_in ^ ps11_crc_mask ) : ps_in;


always@(negedge link_clk)
 if ( header_detected )
   start_UI_counter <= 1;

always@(posedge link_clk) if ( start_UI_counter )
begin
  if ( UI_counter == 4'hc )
    UI_counter <= 4'h1;
  else
   UI_counter <= UI_counter + 4'h1;

end

initial begin
tr_counter = 1;
start_UI_counter=0;
UI_counter=4'h1;
ps0_crc_mask=0;
ps1_crc_mask=0;
ps2_crc_mask=0;
ps3_crc_mask=0;
ps4_crc_mask=0;
ps5_crc_mask=0;
ps6_crc_mask=0;
ps7_crc_mask=0;
ps8_crc_mask=0;
ps9_crc_mask=0;
ps10_crc_mask=0;
ps11_crc_mask=0;
crc_en= 0;
ps_crc_freq=0;
ps_frame_num=0;
ps_crc_period=0;
frame_counter=0;
 if ( $test$plusargs("bypass_init") ) begin
  lock_counter = 4'hc;
  bypass_init = 1;
 end
 else 
  bypass_init = 0;

lock_counter2=4'h1;

`ifdef AXIS_FBDIMM_HW
`else
dummy=$value$plusargs("ps0_crc_mask=%h",ps0_crc_mask);
dummy=$value$plusargs("ps1_crc_mask=%h",ps1_crc_mask);
dummy=$value$plusargs("ps2_crc_mask=%h",ps2_crc_mask);
dummy=$value$plusargs("ps3_crc_mask=%h",ps3_crc_mask);
dummy=$value$plusargs("ps4_crc_mask=%h",ps4_crc_mask);
dummy=$value$plusargs("ps5_crc_mask=%h",ps5_crc_mask);
dummy=$value$plusargs("ps6_crc_mask=%h",ps6_crc_mask);
dummy=$value$plusargs("ps7_crc_mask=%h",ps7_crc_mask);
dummy=$value$plusargs("ps8_crc_mask=%h",ps8_crc_mask);
dummy=$value$plusargs("ps9_crc_mask=%h",ps9_crc_mask);
dummy=$value$plusargs("ps10_crc_mask=%h",ps10_crc_mask);
dummy=$value$plusargs("ps11_crc_mask=%h",ps11_crc_mask);
dummy=$value$plusargs("ps_frame_num=%h",ps_frame_num);
dummy=$value$plusargs("ps_crc_freq=%h",ps_crc_freq);
dummy=$value$plusargs("ps_crc_period=%h",ps_crc_period);
`endif

end

reg [47:0] initialization_register_link0;

initial fsr_counter=4'h7;
initial fsr_counter2=4'hd;

always@(posedge link_clk)
begin
  if ( fsr_counter == 4'h1 )
   fsr_counter = 4'h6;
  else
   fsr_counter = fsr_counter - 1;

  if ( fsr_counter2 == 4'h1 )
   fsr_counter2 = 4'hc;
  else
   fsr_counter2 = fsr_counter2 - 1;

end

assign frm_begin = ( fsr_counter2 == lock_counter2 );
assign frm_boundary = (fsr_counter2 == lock_counter);
   
always@(negedge link_clk) if ( ~bypass_init )
begin

  if (header_detected )
     lock_counter <= prev_counter;
  else
   prev_counter <= fsr_counter2;

end  


   
reg [9:0] ps0_reg,ps1_reg,ps2_reg,ps3_reg,ps4_reg,ps5_reg,ps6_reg,ps7_reg,ps8_reg,ps9_reg,ps10_reg,ps11_reg;

always@(negedge link_clk)
begin
 ps0_reg <= ps1_reg;
 ps1_reg <= ps2_reg;
 ps2_reg <= ps3_reg;
 ps3_reg <= ps4_reg;
 ps4_reg <= ps5_reg;
 ps5_reg <= ps6_reg;
 ps6_reg <= ps7_reg;
 ps7_reg <= ps8_reg;
 ps8_reg <= ps9_reg;
 ps9_reg <= ps10_reg;
 ps10_reg <= ps11_reg;
 ps11_reg <= ps_in  ;

end


always@(posedge link_clk) if ( ~bypass_init )
begin
  if( is_bar == 1'b0)
  begin
  if ( (ps0_reg == 10'h3ff ) &&
       (ps1_reg == 10'h0 ) &&
       (ps2_reg == 10'h3ff ) &&
       (ps3_reg == 10'h3ff ) &&
       (ps4_reg == 10'h3ff ) &&
       (ps5_reg == 10'h3ff ) &&
       (ps6_reg == 10'h3ff ) &&
       (ps7_reg == 10'h3ff ) &&
       (ps8_reg == 10'h3ff ) &&
       (ps9_reg == 10'h3ff ) &&
       (ps10_reg == 10'h3ff ) &&
       (ps11_reg == 10'h0 ) )
   begin
     lock_counter2 <= fsr_counter2;
   end
   end
   else if(is_bar == 1'b1)
   begin
   if( (ps0_reg == 10'h0 ) &&
	(ps1_reg == 10'h3ff) &&
       ( ps2_reg == 10'h0) &&
       ( ps3_reg == 10'h0) &&
       ( ps4_reg == 10'h0) &&
       ( ps5_reg == 10'h0) &&
       ( ps6_reg == 10'h0) &&
       ( ps7_reg == 10'h0) &&
       ( ps8_reg == 10'h0) &&
       ( ps9_reg == 10'h0) &&
       ( ps10_reg == 10'h0) &&
       ( ps11_reg == 10'h3ff) )
    begin
      lock_counter2 <= fsr_counter2;
    end
    end

end  
   
always@(posedge link_clk) if ( ~bypass_init )
begin
 if(is_bar == 1'b0) // Not the sb_bar_crc_error_injector
  begin
   if ( initialization_register_link0[47:36] == 12'hbfe )
     header_detected<=1;
   else
     header_detected<=0;
  end
 else if(is_bar == 1'b1)
  begin
   if( initialization_register_link0[47:36] == 12'h401 )
     header_detected <= 1;
   else
     header_detected <= 0;
  end
end

always@(negedge link_clk)
begin
   initialization_register_link0[47:0] <= { ps_in[0],  initialization_register_link0[47:1]};  
end


always@(posedge link_clk) if ( ~init && (( ps_frame_num !== 0 ) && (crc_clock_period !== 0 )) )
begin


 if ( frame_counter !== crc_clock_period )
 begin

  if ( frame_counter < (ps_crc_freq*12) )
    crc_en <= 1;
  else
    crc_en <= 0;     

  frame_counter=frame_counter+1;

 end if ( frame_counter == crc_clock_period )
   frame_counter = 0;

 

  if ( tr_counter == 4'hc ) begin
    tr_counter=1;

    // If ps_frame_num is FFF, then all frames will have the same crc
    if ( ps_frame_num == 12'hfff ) begin
      crc_en <= 1;
    end
    // If ps_frame_num is non-zero, N number of frames will have crc errors
    // then crc will be turned off
    else if ( ps_frame_num !== 0 ) begin
     crc_en <= 1;
     ps_frame_num = ps_frame_num - 1;
    end
    else
      crc_en <= 0;

  end
   else
    tr_counter=tr_counter+1;

end
else
    crc_en <= 0;

endmodule
