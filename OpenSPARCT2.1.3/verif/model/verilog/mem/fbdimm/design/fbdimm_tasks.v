// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fbdimm_tasks.v
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
`ifdef STINGRAY

module fbdimm_tasks();

// This task writes the data into the register memory

task write_fbdimm_reg(input reg [2:0] function_code,input  reg [7:0] offset, input reg [31:0] data);

  amb.sb_decoder.register_memory[{function_code,offset}] = data;

endtask

// This function returns the data from the register memory

function [31:0] read_fbdimm_reg(input reg [2:0] function_code, input reg [7:0] offset);

   read_fbdimm_reg =  amb.sb_decoder.register_memory[{function_code,offset}];

endfunction


// This task programs the registers related to NB crc error injection

task corrupt_nb_crc(input reg [13:0] pn0_crc_mask, 
                    input reg [13:0] pn1_crc_mask,
                    input reg [13:0] pn2_crc_mask,
                    input reg [13:0] pn3_crc_mask,
                    input reg [13:0] pn4_crc_mask,
                    input reg [13:0] pn5_crc_mask,
                    input reg [13:0] pn6_crc_mask,
                    input reg [13:0] pn7_crc_mask,
                    input reg [13:0] pn8_crc_mask,
                    input reg [13:0] pn9_crc_mask,
                    input reg [13:0] pn10_crc_mask,
                    input reg [13:0] pn11_crc_mask,
                    input reg [11:0] pn_frame_num,
                    input reg [11:0] pn_crc_freq,
                    input reg [11:0] pn_crc_period);
/*
  amb.nb_crc_error_injector.pn0_crc_mask = pn0_crc_mask;
  amb.nb_crc_error_injector.pn1_crc_mask = pn1_crc_mask;
  amb.nb_crc_error_injector.pn2_crc_mask = pn2_crc_mask;
  amb.nb_crc_error_injector.pn3_crc_mask = pn3_crc_mask;
  amb.nb_crc_error_injector.pn4_crc_mask = pn4_crc_mask;
  amb.nb_crc_error_injector.pn5_crc_mask = pn5_crc_mask;
  amb.nb_crc_error_injector.pn6_crc_mask = pn6_crc_mask;
  amb.nb_crc_error_injector.pn7_crc_mask = pn7_crc_mask;
  amb.nb_crc_error_injector.pn8_crc_mask = pn8_crc_mask;
  amb.nb_crc_error_injector.pn9_crc_mask = pn9_crc_mask;
  amb.nb_crc_error_injector.pn10_crc_mask = pn10_crc_mask;
  amb.nb_crc_error_injector.pn11_crc_mask = pn11_crc_mask;

  amb.nb_crc_error_injector.pn_frame_num  = pn_frame_num;
  amb.nb_crc_error_injector.pn_crc_freq   = pn_crc_freq;
  amb.nb_crc_error_injector.pn_crc_period = pn_crc_period;
*/

endtask


endmodule 

`endif

