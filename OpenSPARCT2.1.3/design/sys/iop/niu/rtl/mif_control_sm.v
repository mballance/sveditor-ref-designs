// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mif_control_sm.v
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
module mif_control_sm
  (/*AUTOARG*/
   // Outputs
   fetch_instr, poll_instr, ld_output_reg, ld_poll_status, 
   ctl_state, 
   // Inputs
   clk, reset, instr_pnd, poll_en, mif_pio_intr, wr_done, rd_done, 
   illegal_instr
   );
   

 input        clk;
 input        reset;
 input        instr_pnd;
 input        poll_en;
 input        mif_pio_intr;
 input        wr_done;
 input        rd_done;
 input        illegal_instr;
 output       fetch_instr;
 output       poll_instr;
 output       ld_output_reg;
 output       ld_poll_status;
 output [2:0] ctl_state;

 wire [2:0] new_ctl_state;
 wire d_ld_poll_status;

 parameter IDLE  = 3'h0,
           FETCH = 3'h1,
           EX1   = 3'h2,
           RD1   = 3'h3,
           POLL  = 3'h4,
           EX2   = 3'h5,
           RD2   = 3'h6;

 function [6:0] control_state_transitions;
  input       reset;
  input       d_ld_poll_status;
  input       instr_pnd;
  input       poll_en;
  input       mif_pio_intr;
  input       wr_done;
  input       rd_done;
  input       illegal_instr;
  input [2:0] ctl_state;
  reg         fetch_instr;
  reg         poll_instr;
  reg         ld_output_reg;
  reg         ld_poll_status;
  reg   [2:0] new_ctl_state;

  begin
   if (reset)
    begin
     fetch_instr   = 0;
     poll_instr    = 0;
     ld_output_reg = 0;
     ld_poll_status= 0;
     new_ctl_state = IDLE;
    end
   else
    begin
     fetch_instr   = 0;
     poll_instr    = 0;
     ld_output_reg = 0;
     ld_poll_status= 0;
     new_ctl_state = IDLE;

     case (ctl_state)              //synopsys parallel_case

      IDLE:
       begin
        if (instr_pnd)                              new_ctl_state = FETCH;
        else if (!d_ld_poll_status & poll_en & !mif_pio_intr) 
                                                    new_ctl_state = POLL;
        else                                        new_ctl_state = IDLE;
       end

      FETCH:
       begin
        fetch_instr = 1;
                                                     new_ctl_state = EX1;
       end

      EX1:
       begin
        if (illegal_instr | wr_done)
         begin
          ld_output_reg = 1;
                                                     new_ctl_state = IDLE;
         end
        else if (rd_done)                            new_ctl_state = RD1;
        else                                         new_ctl_state = EX1;
       end

      RD1:
       begin
        ld_output_reg = 1;
                                                     new_ctl_state = IDLE;
       end

      POLL:
       begin
        poll_instr = 1;
                                                     new_ctl_state = EX2;
       end

      EX2:
       begin
        if (rd_done)                                 new_ctl_state = RD2;
        else                                         new_ctl_state = EX2;
       end

      RD2:
       begin
        ld_poll_status = 1;
                                                     new_ctl_state = IDLE;
       end
     endcase
    end
   control_state_transitions = {fetch_instr,poll_instr,ld_output_reg,
                                ld_poll_status,new_ctl_state};
  end
 endfunction

 assign {fetch_instr,poll_instr,ld_output_reg,ld_poll_status,new_ctl_state} =
        control_state_transitions(reset,d_ld_poll_status,instr_pnd,poll_en,
                                  mif_pio_intr,wr_done,rd_done,
                                  illegal_instr,ctl_state);

 RegDff #(3) _RegDff (.din(new_ctl_state[2:0]),.clk(clk),
                      .qout(ctl_state[2:0]));

 FD1 LD_STATUS(.D(ld_poll_status),.CP(clk),.Q(d_ld_poll_status));

endmodule
