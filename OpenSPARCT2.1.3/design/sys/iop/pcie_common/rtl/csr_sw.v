// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: csr_sw.v
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
module csr_sw (

// synopsys translate_off
    omni_ld,
    omni_data,
    omni_rw_alias,
    omni_rw1c_alias,
    omni_rw1s_alias,
// synopsys translate_on

    rst,
    rst_val,

    csr_ld,
    csr_data,
    rw_alias,
    rw1c_alias,
    rw1s_alias,

    hw_ld,
    hw_data,

    cp,
    q
);

//====================================================
//     Port declarations
//====================================================
// synopsys translate_off
input omni_ld;        // Omni write
input omni_data;      // Omni write data
input omni_rw_alias;  // Omni rw operation
input omni_rw1c_alias; // Omni rw1c operation
input omni_rw1s_alias; // Omni rw1s operation
// synopsys translate_on
input rst;       // Synch reset
input rst_val;   // Synch reset value
input csr_ld;    // CSR load
input csr_data;  // CSR data
input rw_alias;  // rw operation
input rw1c_alias; // rw1c operation
input rw1s_alias; // rw1s operation
input hw_ld;     // Internal logic load
input hw_data;   // Internal logic data
input cp;        // Clock
output q;        // Register out

//====================================================
//     Type declarations
//====================================================
// synopsys translate_off
wire omni_data;      // Omni write data
wire omni_ld;        // Omni write
wire omni_rw_alias;  // Omni rw operation
wire omni_rw1c_alias; // Omni rw1c operation
wire omni_rw1s_alias; // Omni rw1s operation
// synopsys translate_on
wire rst;       // Synch reset
wire rst_val;   // Synch reset value
wire csr_ld;    // CSR load
wire csr_data;  // CSR data
wire rw_alias;  // rw operation
wire rw1c_alias; // rw1c operation
wire rw1s_alias; // rw1s operation
wire hw_ld;     // Internal logic load
wire hw_data;   // Internal logic data
wire cp;        // Clock
reg  q;        // Register out

//====================================================
// Internal logic
//====================================================
always @(posedge cp 
// synopsys translate_off
         or posedge omni_ld 
// synopsys translate_on
         ) 
begin
// synopsys translate_off
// verilint 549 off
// simtech modcovoff -be
// async load ok - not synthesized
   if (omni_ld)
      begin
         case({omni_rw_alias,omni_rw1c_alias,omni_rw1s_alias})
`ifdef VCS
            3'b100:
               if(omni_data==1'b1)
                  q=1'b1;  
               else
                  q=1'b0;

            3'b010:
               if(omni_data==1'b1)
                  q=1'b0;  

            3'b001:
               if(omni_data==1'b1)
                  q=1'b1;  

            default:
               q=1'bx;
`else
            3'b100:
               if(omni_data==1'b1)
                  q<=1'b1;  
               else
                  q<=1'b0;

            3'b010:
               if(omni_data==1'b1)
                  q<=1'b0;  

            3'b001:
               if(omni_data==1'b1)
                  q<=1'b1;  

            default:
//BP N2 1-18-05               q<=1'bx;
                begin // axis tbcall_region
                      // vlint flag_system_call off
 `ifdef PR_ERROR if ($time > 1) `PR_ERROR("csr_sw",`MON_ERROR,"acc_vio: default case of csr_sw"); `endif
                    // vlint flag_system_call on
                end // end of tbcall_region
`endif
         endcase
      end

   else 
      begin
// synopsys translate_on
// simtech modcovon -be

         if (rst)
            q <= rst_val;

         else if (csr_ld)
            begin

               case({rw_alias,rw1c_alias,rw1s_alias})
                 3'b100: if (csr_data == 1'b1)
                            q <= 1'b1;      
                         else
                            q <= 1'b0;

                 3'b010: if (csr_data == 1'b1)
                            q <= 1'b0;      
                         else if (hw_ld)
                            q <= hw_data;

                 3'b001: if (csr_data == 1'b1)
                            q <= 1'b1;
                         else if (hw_ld)
                            q <= hw_data;
                 default:
//BP N2 1-18-05                         q <= 1'bx;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1) `PR_ERROR("csr_sw",`MON_ERROR,"acc_vio: default case of csr_sw"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region


               endcase
            end

         else if (hw_ld)
            q <=  hw_data;

// verilint 549 on
// synopsys translate_off
      end
// synopsys translate_on
end
   
endmodule // csr_sw
