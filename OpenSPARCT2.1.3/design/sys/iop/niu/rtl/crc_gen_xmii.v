// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: crc_gen_xmii.v
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

/*************************************************************************
 *
 * File Name    : crc_gen_xmii.v
 * Author Name  : John Lo
 * Description  : crc generation logic
 * Parent Module: rx_fcs_xmii
 * Child  Module: 
 * Interface Mod: many.
 * Date Created : 5/9/00
 *
 * Copyright (c) 2002, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * This module is very timing critical.  It has
 * a long xor chain to calculate crc. Special care
 * must be taker to insure timing integrity.
 * It should be synthesized and layout independently
 * that the optimal timing goal can be achieved.
 * Written on Feb. 10th, 2000 - John Lo 
 * 
 *************************************************************************/

module crc_gen_xmii (clk,initialize_crc,compute_en,
		 data_valid,dv_8bit,
                 input_byte0,input_byte1,input_byte2,
                 input_byte3,input_byte4,input_byte5,
                 input_byte6,input_byte7,
		 new_crc5_result,
                 crc_result);
   input           clk,initialize_crc,compute_en;
   // vlint flag_input_port_not_connected off
   input 	   data_valid;
   // vlint flag_input_port_not_connected on
   input [7:0] 	   dv_8bit;
   input [7:0] 	   input_byte0;
   input [7:0] 	   input_byte1;
   input [7:0] 	   input_byte2;
   input [7:0] 	   input_byte3;
   input [7:0] 	   input_byte4;
   input [7:0] 	   input_byte5;
   input [7:0] 	   input_byte6;
   input [7:0] 	   input_byte7;
   output [31:0]   new_crc5_result;
   output [31:0]   crc_result;
   
   wire [31:0] 	   new_crc0;
   wire [31:0] 	   new_crc1;
   wire [31:0] 	   new_crc2;
   wire [31:0] 	   new_crc3;
   wire [31:0] 	   new_crc4;
   wire [31:0] 	   new_crc5;
   wire [31:0] 	   new_crc6;
   wire [31:0] 	   new_crc7;
   wire [31:0] 	   new_crc_final;
   wire [31:0] 	   current_crc_final;
   reg [31:0] 	   new_crc_result;
   wire [31:0] 	   new_crc5_result = ~new_crc5;
   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   // vlint flag_input_port_not_connected off
   wire 	   data_valid;
   // vlint flag_input_port_not_connected on
   // vlint flag_net_has_no_load on
   // vlint flag_dangling_net_within_module on
   
crc_com_part stage0(.input_byte(input_byte0),.current_crc(current_crc_final),.new_crc(new_crc0));
crc_com_part stage1(.input_byte(input_byte1),.current_crc(new_crc0),.new_crc(new_crc1));
crc_com_part stage2(.input_byte(input_byte2),.current_crc(new_crc1),.new_crc(new_crc2));
crc_com_part stage3(.input_byte(input_byte3),.current_crc(new_crc2),.new_crc(new_crc3));
crc_com_part stage4(.input_byte(input_byte4),.current_crc(new_crc3),.new_crc(new_crc4));
crc_com_part stage5(.input_byte(input_byte5),.current_crc(new_crc4),.new_crc(new_crc5));
crc_com_part stage6(.input_byte(input_byte6),.current_crc(new_crc5),.new_crc(new_crc6));
crc_com_part stage7(.input_byte(input_byte7),.current_crc(new_crc6),.new_crc(new_crc7));
 
assign new_crc_final =  initialize_crc ? 32'hff_ff_ff_ff : 
                        compute_en     ? new_crc_result  : current_crc_final;

// vlint flag_variable_in_sensitivity_list_not_used_in_block off
always @ (/*AUTOSENSE*/data_valid or dv_8bit or new_crc0 or new_crc1
	  or new_crc2 or new_crc3 or new_crc4 or new_crc5 or new_crc6
	  or new_crc7)
  begin
    casex (dv_8bit)  // synopsys parallel_case full_case
      8'b1xxxxxxx: new_crc_result = new_crc7;
      8'b01xxxxxx: new_crc_result = new_crc6;
      8'b001xxxxx: new_crc_result = new_crc5;
      8'b0001xxxx: new_crc_result = new_crc4;
      8'b00001xxx: new_crc_result = new_crc3;
      8'b000001xx: new_crc_result = new_crc2;
      8'b0000001x: new_crc_result = new_crc1;
      8'b00000001: new_crc_result = new_crc0;
      default: begin
                   new_crc_result = new_crc7;
                   // synopsys translate_off
	           if (data_valid)
	           $display("\n (* ERROR:  at sim time = %d, crc_gen contains invalid combination of dv_8bit = %b *) \n", $time, dv_8bit);
	           else ;
	           // synopsys translate_on
               end // case: default
    endcase // casex(dv_8bit)
  end // always @ (...
// vlint flag_variable_in_sensitivity_list_not_used_in_block on

register_X32 rx_crc_result_register_X32(.clk(clk),.din(new_crc_final),.dout(current_crc_final),.dout_n(crc_result));

endmodule // crc_gen_xmii



module crc_com_part (input_byte,current_crc,new_crc);
   input [7:0] 	 input_byte;
   input [31:0]  current_crc;
   output [31:0] new_crc;

 wire [7:0]    crc_in;
 wire [31:0]   current_crc,new_crc;
//
 assign crc_in[0] = current_crc[31] ^ input_byte[7];
 assign crc_in[1] = current_crc[30] ^ input_byte[6];
 assign crc_in[2] = current_crc[29] ^ input_byte[5];
 assign crc_in[3] = current_crc[28] ^ input_byte[4];
 assign crc_in[4] = current_crc[27] ^ input_byte[3];
 assign crc_in[5] = current_crc[26] ^ input_byte[2];
 assign crc_in[6] = current_crc[25] ^ input_byte[1] ^ crc_in[0];
 assign crc_in[7] = current_crc[24] ^ input_byte[0] ^ crc_in[1];

   assign new_crc[31] = (current_crc[23] ^ crc_in[2]) ;
   assign new_crc[30] = (current_crc[22] ^ crc_in[0] ^ crc_in[3]);
   assign new_crc[29] = (current_crc[21] ^ crc_in[0] ^ crc_in[1] ^ crc_in[4]);
   assign new_crc[28] = (current_crc[20] ^ crc_in[1] ^ crc_in[2] ^ crc_in[5]);
   assign new_crc[27] = (current_crc[19] ^ crc_in[2] ^ crc_in[3] ^ crc_in[6]);
   assign new_crc[26] = (current_crc[18] ^ crc_in[3] ^ crc_in[4] ^ crc_in[7]);
   assign new_crc[25] = (current_crc[17] ^ crc_in[4] ^ crc_in[5]);
   assign new_crc[24] = (current_crc[16] ^ crc_in[5] ^ crc_in[6]);
   assign new_crc[23] = (current_crc[15] ^ crc_in[0] ^ crc_in[6] ^ crc_in[7]);
   assign new_crc[22] = (current_crc[14] ^ crc_in[1] ^ crc_in[7]);
   assign new_crc[21] = (current_crc[13] ^ crc_in[2]);
   assign new_crc[20] = (current_crc[12] ^ crc_in[3]);
   assign new_crc[19] = (current_crc[11] ^ crc_in[0] ^ crc_in[4]);
   assign new_crc[18] = (current_crc[10] ^ crc_in[0] ^ crc_in[1] ^ crc_in[5]);
   assign new_crc[17] = (current_crc[9] ^ crc_in[0] ^ crc_in[1] ^ crc_in[2] ^ crc_in[6]);
   assign new_crc[16] = (current_crc[8] ^ crc_in[1] ^ crc_in[2] ^ crc_in[3] ^ crc_in[7]);
   assign new_crc[15] = (current_crc[7] ^ crc_in[0] ^ crc_in[2] ^ crc_in[3] ^ crc_in[4]);
   assign new_crc[14] = (current_crc[6] ^ crc_in[0] ^ crc_in[1] ^ crc_in[3] ^ crc_in[4] ^ crc_in[5]);
   assign new_crc[13] = (current_crc[5] ^ crc_in[1] ^ crc_in[2] ^ crc_in[4] ^ crc_in[5] ^ crc_in[6]);
   assign new_crc[12] = (current_crc[4] ^ crc_in[0] ^ crc_in[2] ^ crc_in[3] ^ crc_in[5] ^ crc_in[6] ^ crc_in[7]);
   assign new_crc[11] = (current_crc[3] ^ crc_in[0] ^ crc_in[1] ^ crc_in[3] ^ crc_in[4] ^ crc_in[6] ^ crc_in[7]);
   assign new_crc[10] = (current_crc[2] ^ crc_in[1] ^ crc_in[2] ^ crc_in[4] ^ crc_in[5] ^ crc_in[7]);
   assign new_crc[9]  = (current_crc[1] ^ crc_in[0] ^ crc_in[2] ^ crc_in[3] ^ crc_in[5] ^ crc_in[6]);
   assign new_crc[8]  = (current_crc[0] ^ crc_in[0] ^ crc_in[1] ^ crc_in[3] ^ crc_in[4] ^ crc_in[6] ^ crc_in[7]);
   assign new_crc[7]  = (crc_in[0] ^ crc_in[1] ^ crc_in[2] ^ crc_in[4] ^ crc_in[5] ^ crc_in[7]);
   assign new_crc[6]  = (crc_in[1] ^ crc_in[2] ^ crc_in[3] ^ crc_in[5] ^ crc_in[6]);
   assign new_crc[5]  = (crc_in[2] ^ crc_in[3] ^ crc_in[4] ^ crc_in[6] ^ crc_in[7]);
   assign new_crc[4]  = (crc_in[3] ^ crc_in[4] ^ crc_in[5] ^ crc_in[7]);
   assign new_crc[3]  = (crc_in[4] ^ crc_in[5] ^ crc_in[6]);
   assign new_crc[2]  = (crc_in[5] ^ crc_in[6] ^ crc_in[7]);
   assign new_crc[1]  = (crc_in[6] ^ crc_in[7]);
   assign new_crc[0]  = crc_in[7];

endmodule // crc_com_part


