// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_pio_virt_decode.v
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
/*%W%	%G%*/

/*****************************************************************
 *
 * File Name    : niu_pio_virt_decode.v
 * Author Name  : Maya Suresh
 * Description  : Virtualization Decoder 
 * 
 * Parent Module: niu_pio_regs.v
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 04/25/05
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 ****************************************************************/

module niu_pio_virt_decode (
   // Outputs
   virt_addr, pio_virt_sel_ok, fflp_virt_sel_ok,
   dma_virt_sel_ok, 
   // Inputs
   addr, fc0_v, fc1_v, fc2_v, fc3_v
   );

output [26:0] virt_addr ;
output        pio_virt_sel_ok ;
output        fflp_virt_sel_ok ;
output        dma_virt_sel_ok;

input  [26:0] addr ;
input         fc0_v ;
input         fc1_v ;
input         fc2_v ;
input         fc3_v ;
       
reg [26:0] virt_addr ;
reg        pio_virt_sel_ok ;
reg        fflp_virt_sel_ok ;
reg        dma_virt_sel_ok;

always @ (addr  or
          fc0_v or
          fc1_v or
          fc2_v or
          fc3_v ) 
 begin
         virt_addr[26:0] = 27'b0;
         pio_virt_sel_ok = 1'b0 ;
        fflp_virt_sel_ok = 1'b0 ;
         dma_virt_sel_ok = 1'b0 ; 

   // Function Zero Virtualization 
   if (fc0_v) // Function Zero Virtualization Decode
    begin

   // Code for DMA Virtualization 
     if (addr[23:13] == 11'b0000_0000_000)
       begin
         virt_addr[26:0] = addr[26:0]; 
         dma_virt_sel_ok = 1'b1 ; 
       end
     if (addr[23:13] == 11'b0000_0000_010)
       begin
         virt_addr[26:0] = addr[26:0]; 
         dma_virt_sel_ok = 1'b1 ; 
       end
   // END 

     if (addr[15:8]      == 8'b0010_0000)
       begin
         virt_addr[23:0] = {8'b1000_0000,addr[7:5],8'b0,addr[4:0]};
         virt_addr[26:24]= addr[26:24]; 
         pio_virt_sel_ok = 1'b1 ; 
       end

     if (addr[15:8]      == 8'b0110_0000)
       begin
         virt_addr[23:0] = {8'b1000_0001,addr[7:5],8'b0,addr[4:0]};
         virt_addr[26:24]= addr[26:24]; 
         pio_virt_sel_ok = 1'b1 ; 
       end
      
     if (addr[15:0]      == 16'b0010_0001_0000_0000)
       begin
         virt_addr[23:0] = {4'b0011,20'b0};
         virt_addr[26:24]= addr[26:24]; 
         fflp_virt_sel_ok = 1'b1 ; 
       end
     if (addr[15:0]      == 16'b0010_0001_0000_1000)
       begin
         virt_addr[23:0] = {4'b0011,16'b0,4'b1000};
         virt_addr[26:24]= addr[26:24]; 
         fflp_virt_sel_ok = 1'b1 ; 
       end
     if (addr[15:0]      == 16'b0010_0001_0001_0000)
       begin
         virt_addr[23:0] = {4'b0011,12'b0,4'b0001,4'b0000};
         virt_addr[26:24]= addr[26:24]; 
         fflp_virt_sel_ok = 1'b1 ; 
       end

     if (addr[15:0]      == 16'b0110_0001_0000_0000)
       begin
         virt_addr[23:0] = {4'b0011,4'b0000,4'b0010,12'b0};
         virt_addr[26:24]= addr[26:24]; 
         fflp_virt_sel_ok = 1'b1 ; 
       end
     if (addr[15:0]      == 16'b0110_0001_0000_1000)
       begin
         virt_addr[23:0] = {4'b0011,4'b0000,4'b0010,8'b0,4'b1000};
         virt_addr[26:24]= addr[26:24]; 
         fflp_virt_sel_ok = 1'b1 ; 
       end
     if (addr[15:0]      == 16'b0110_0001_0001_0000)
       begin
         fflp_virt_sel_ok = 1'b1 ; 
         virt_addr[23:0] = {4'b0011,4'b0000,4'b0010,4'b0000,4'b0001,4'b0000};
         virt_addr[26:24]= addr[26:24]; 
       end
    end

   // Function One Virtualization 
   if (fc1_v) // Function Zero Virtualization Decode
    begin

   // Code for DMA Virtualization 
     if (addr[23:13] == 11'b0000_0000_000)
       begin
         virt_addr[26:0] = addr[26:0]; 
         dma_virt_sel_ok = 1'b1 ; 
       end
     if (addr[23:13] == 11'b0000_0000_010)
       begin
         virt_addr[26:0] = addr[26:0]; 
         dma_virt_sel_ok = 1'b1 ; 
       end
   // END 

     if (addr[15:8]      == 8'b0010_0000)
       begin
         virt_addr[23:0] = {8'b1000_0010,addr[7:5],8'b0,addr[4:0]};
         virt_addr[26:24]= addr[26:24]; 
         pio_virt_sel_ok = 1'b1 ; 
       end
     if (addr[15:8]      == 8'b0110_0000)
       begin
         virt_addr[23:0] = {8'b1000_0011,addr[7:5],8'b0,addr[4:0]};
         virt_addr[26:24]= addr[26:24]; 
         pio_virt_sel_ok = 1'b1 ; 
       end
      
     if (addr[15:0]      == 16'b0010_0001_0000_0000)
       begin
         virt_addr[23:0] = {4'b0011,4'b0000,4'b0100,8'b0,4'b0000};
         virt_addr[26:24]= addr[26:24]; 
         fflp_virt_sel_ok = 1'b1 ; 
       end
     if (addr[15:0]      == 16'b0010_0001_0000_1000)
       begin
         virt_addr[23:0] = {4'b0011,4'b0000,4'b0100,8'b0,4'b1000};
         virt_addr[26:24]= addr[26:24]; 
         fflp_virt_sel_ok = 1'b1 ; 
       end
     if (addr[15:0]      == 16'b0010_0001_0001_0000)
       begin
         virt_addr[23:0] = {4'b0011,4'b0000,4'b0100,4'b0,4'b0001,4'b0000};
         virt_addr[26:24]= addr[26:24]; 
         fflp_virt_sel_ok = 1'b1 ; 
       end
      
     if (addr[15:0]      == 16'b0110_0001_0000_0000)
       begin
         virt_addr[23:0] = {4'b0011,4'b0000,4'b0110,8'b0,4'b0000};
         virt_addr[26:24]= addr[26:24]; 
         fflp_virt_sel_ok = 1'b1 ; 
       end
     if (addr[15:0]      == 16'b0110_0001_0000_1000)
       begin
         virt_addr[23:0] = {4'b0011,4'b0000,4'b0110,8'b0,4'b1000};
         virt_addr[26:24]= addr[26:24]; 
         fflp_virt_sel_ok = 1'b1 ; 
       end
     if (addr[15:0]      == 16'b0110_0001_0001_0000)
       begin
         virt_addr[23:0] = {4'b0011,4'b0000,4'b0110,4'b0,4'b0001,4'b0000};
         virt_addr[26:24]= addr[26:24]; 
         fflp_virt_sel_ok = 1'b1 ; 
       end
    end

   // Function Two Virtualization 
   if (fc2_v) // Function Zero Virtualization Decode
    begin

   // Code for DMA Virtualization 
     if (addr[23:13] == 11'b0000_0000_000)
       begin
         virt_addr[26:0] = addr[26:0]; 
         dma_virt_sel_ok = 1'b1 ; 
       end
     if (addr[23:13] == 11'b0000_0000_010)
       begin
         virt_addr[26:0] = addr[26:0]; 
         dma_virt_sel_ok = 1'b1 ; 
       end
   // END 

     if (addr[15:8]      == 8'b0010_0000)
       begin
         virt_addr[23:0] = {8'b1000_0100,addr[7:5],8'b0,addr[4:0]};
         virt_addr[26:24]= addr[26:24]; 
         pio_virt_sel_ok = 1'b1 ; 
       end
     if (addr[15:8]      == 8'b0110_0000)
       begin
         virt_addr[23:0] = {8'b1000_0101,addr[7:5],8'b0,addr[4:0]};
         virt_addr[26:24]= addr[26:24]; 
         pio_virt_sel_ok = 1'b1 ; 
       end
      
     if (addr[15:0]      == 16'b0010_0001_0000_0000)
       begin
         virt_addr[23:0] = {4'b0011,4'b0000,4'b1000,8'b0,4'b0000};
         virt_addr[26:24]= addr[26:24]; 
         fflp_virt_sel_ok = 1'b1 ; 
       end
     if (addr[15:0]      == 16'b0010_0001_0000_1000)
       begin
         virt_addr[23:0] = {4'b0011,4'b0000,4'b1000,8'b0,4'b1000};
         virt_addr[26:24]= addr[26:24]; 
         fflp_virt_sel_ok = 1'b1 ; 
       end
     if (addr[15:0]      == 16'b0010_0001_0001_0000)
       begin
         virt_addr[23:0] = {4'b0011,4'b0000,4'b1000,4'b0,4'b0001,4'b0000};
         virt_addr[26:24]= addr[26:24]; 
         fflp_virt_sel_ok = 1'b1 ; 
       end
      
     if (addr[15:0]      == 16'b0110_0001_0000_0000)
       begin
         virt_addr[23:0] = {4'b0011,4'b0000,4'b1010,8'b0,4'b0000};
         virt_addr[26:24]= addr[26:24]; 
         fflp_virt_sel_ok = 1'b1 ; 
       end
     if (addr[15:0]      == 16'b0110_0001_0000_1000)
       begin
         virt_addr[23:0] = {4'b0011,4'b0000,4'b1010,8'b0,4'b1000};
         virt_addr[26:24]= addr[26:24]; 
         fflp_virt_sel_ok = 1'b1 ; 
       end
     if (addr[15:0]      == 16'b0110_0001_0001_0000)
       begin
         fflp_virt_sel_ok = 1'b1 ; 
         virt_addr[26:24]= addr[26:24]; 
         virt_addr[23:0] = {4'b0011,4'b0000,4'b1010,4'b0,4'b0001,4'b0000};
       end
    end

   // Function Three Virtualization 
   if (fc3_v) // Function Zero Virtualization Decode
    begin

   // Code for DMA Virtualization 
     if (addr[23:13] == 11'b0000_0000_000)
       begin
         virt_addr[26:0] = addr[26:0]; 
         dma_virt_sel_ok = 1'b1 ; 
       end
     if (addr[23:13] == 11'b0000_0000_010)
       begin
         virt_addr[26:0] = addr[26:0]; 
         dma_virt_sel_ok = 1'b1 ; 
       end
   // END 

     if (addr[15:8]      == 8'b0010_0000)
       begin
         virt_addr[23:0] = {8'b1000_0110,addr[7:5],8'b0,addr[4:0]};
         virt_addr[26:24]= addr[26:24]; 
         pio_virt_sel_ok = 1'b1 ; 
       end
     if (addr[15:8]      == 8'b0110_0000)
       begin
         virt_addr[23:0] = {8'b1000_0111,addr[7:5],8'b0,addr[4:0]};
         virt_addr[26:24]= addr[26:24]; 
         pio_virt_sel_ok = 1'b1 ; 
       end
      
     if (addr[15:0]      == 16'b0010_0001_0000_0000)
       begin
         virt_addr[23:0] = {4'b0011,4'b0000,4'b1100,8'b0,4'b0000};
         virt_addr[26:24]= addr[26:24]; 
         fflp_virt_sel_ok = 1'b1 ; 
       end
     if (addr[15:0]      == 16'b0010_0001_0000_1000)
       begin
         virt_addr[23:0] = {4'b0011,4'b0000,4'b1100,8'b0,4'b1000};
         virt_addr[26:24]= addr[26:24]; 
         fflp_virt_sel_ok = 1'b1 ; 
       end
     if (addr[15:0]      == 16'b0010_0001_0001_0000)
       begin
         virt_addr[23:0] = {4'b0011,4'b0000,4'b1100,4'b0,4'b0001,4'b0000};
         virt_addr[26:24]= addr[26:24]; 
         fflp_virt_sel_ok = 1'b1 ; 
       end
      
     if (addr[15:0]      == 16'b0110_0001_0000_0000)
       begin
         virt_addr[23:0] = {4'b0011,4'b0000,4'b1110,8'b0,4'b0000};
         virt_addr[26:24]= addr[26:24]; 
         fflp_virt_sel_ok = 1'b1 ; 
       end
     if (addr[15:0]      == 16'b0110_0001_0000_1000)
       begin
         virt_addr[23:0] = {4'b0011,4'b0000,4'b1110,8'b0,4'b1000};
         virt_addr[26:24]= addr[26:24]; 
         fflp_virt_sel_ok = 1'b1 ; 
       end
     if (addr[15:0]      == 16'b0110_0001_0001_0000)
       begin
         fflp_virt_sel_ok = 1'b1 ; 
         virt_addr[26:24]= addr[26:24]; 
         virt_addr[23:0] = {4'b0011,4'b0000,4'b1110,4'b0,4'b0001,4'b0000};
       end
    end
 end

endmodule // niu_pio_virt_decode

