// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mif_exec_sm.v
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
module mif_exec_sm(/*AUTOARG*/
   // Outputs
   illegal_instr, set_read_instr, clr_read_instr, set_mdo_en, 
   clr_mdo_en, ta_clr_mdo_en, mdi_en, shift_en, clr_idle_timer, 
   wr_done, rd_done, ex_state, 
   // Inputs
   clk, reset, ld_instr, rd_op_code, wr_op_code, read_instr, 
   idle_done, tx_bit_done, rx_bit_done
   );
 input        clk;
 input        reset;
 input        ld_instr; 
 input        rd_op_code; 
 input        wr_op_code;
 input        read_instr; 
 input        idle_done; 
 input        tx_bit_done; 
 input        rx_bit_done;
 output       illegal_instr;   
 output       set_read_instr; 
 output       clr_read_instr;
 output       set_mdo_en; 
 output       clr_mdo_en;
 output       ta_clr_mdo_en;
 output       mdi_en; 
 output       shift_en;
 output       clr_idle_timer; 
 output       wr_done;
 output       rd_done;
 output [5:0] ex_state;

 
 parameter IDLE = 6'h0, DECODE = 6'h1, WAIT = 6'h2,
           SEND_0 = 6'h3,   SEND_1 = 6'h4,   SEND_2 = 6'h5,    SEND_3 = 6'h6,
           SEND_4 = 6'h7,   SEND_5 = 6'h8,   SEND_6 = 6'h9,    SEND_7 = 6'hA,
           SEND_8 = 6'hB,   SEND_9 = 6'hC,   SEND_10 = 6'hD,   SEND_11 = 6'hE,
           SEND_12 = 6'hF,  SEND_13 = 6'h10, SEND_13_CHK = 6'h11, RD_TA_b14 = 6'h12,
           SEND_14 = 6'h13, SEND_15 = 6'h14, SEND_16 = 6'h15,  SEND_17 = 6'h16,
           SEND_18 = 6'h17, SEND_19 = 6'h18, SEND_20 = 6'h19,  SEND_21 = 6'h1A,
           SEND_22 = 6'h1B, SEND_23 = 6'h1C, SEND_24 = 6'h1D,  SEND_25 = 6'h1E,
           SEND_26 = 6'h1F, SEND_27 = 6'h20, SEND_28 = 6'h21,  SEND_29 = 6'h22,
           SEND_30 = 6'h23, SEND_31 = 6'h24, SEND_31A = 6'h25,
           RCV_14 = 6'h26, RCV_15 = 6'h27, RCV_16 = 6'h28, RCV_17 = 6'h29,
           RCV_18 = 6'h2A, RCV_19 = 6'h2B, RCV_20 = 6'h2C, RCV_21 = 6'h2D,
           RCV_22 = 6'h2E, RCV_23 = 6'h2F, RCV_24 = 6'h30, RCV_25 = 6'h31,
           RCV_26 = 6'h32, RCV_27 = 6'h33, RCV_28 = 6'h34, RCV_29 = 6'h35,
           RCV_30 = 6'h36, RCV_31 = 6'h37,
           WR_DONE = 6'h38, RD_DONE = 6'h39;

  wire [5:0]  ex_state;
  reg         illegal_instr;
  reg         set_read_instr;
  reg         clr_read_instr;
  reg         set_mdo_en;
  reg         clr_mdo_en;
  reg         ta_clr_mdo_en;
  reg         mdi_en;
  reg         shift_en;
  reg         clr_idle_timer;
  reg         wr_done;
  reg         rd_done;
  reg   [5:0] new_ex_state;

always @ (/*AUTOSENSE*/ex_state or idle_done or ld_instr or rd_op_code
	  or read_instr or rx_bit_done or tx_bit_done or wr_op_code)

  begin
     illegal_instr = 0;
     set_read_instr = 0;
     clr_read_instr = 0;
     set_mdo_en = 0;
     clr_mdo_en = 0;
     ta_clr_mdo_en = 0;
     mdi_en = 0;
     shift_en = 0;
     clr_idle_timer = 0;
     wr_done = 0;
     rd_done = 0;
     new_ex_state = IDLE;

     case (ex_state)  //synopsys parallel_case

      IDLE:
       begin
        if (ld_instr)
         begin
          set_mdo_en = 1;
          clr_idle_timer = 1;
                                                        new_ex_state = DECODE;
         end
        else                                            new_ex_state = IDLE;
       end

      DECODE:
       begin
        if (rd_op_code)
         begin
          set_read_instr = 1;
                                                        new_ex_state = WAIT;
         end
        else if (wr_op_code)
         begin
          clr_read_instr = 1;
                                                        new_ex_state = WAIT;
         end
        else
         begin
          illegal_instr = 1;
                                                        new_ex_state = IDLE;
         end
       end

      WAIT:// 2
       begin
        if (idle_done & tx_bit_done) // sync up idle_count and div_count
         begin
          shift_en = 1; // the first data will be latched by frame_clk at the same time. This is to shift out 2nd data.
                                                        new_ex_state = SEND_0;
         end
        else                                            new_ex_state = WAIT;
       end

      SEND_0:// 3 // 1st mdio data
       begin
        if (tx_bit_done)
         begin
          shift_en = 1; // This is to shift out 3rd data.
                                                        new_ex_state = SEND_1;
         end
        else                                            new_ex_state = SEND_0;
       end

      SEND_1:// 4 // 2nd mdio data
       begin
        if (tx_bit_done) 
         begin 
          shift_en = 1; 
                                                        new_ex_state = SEND_2;
         end 
        else                                            new_ex_state = SEND_1;
       end

      SEND_2:// 5 // 3rd mdio data
       begin
        if (tx_bit_done) 
         begin 
          shift_en = 1; 
                                                        new_ex_state = SEND_3;
         end 
        else                                            new_ex_state = SEND_2;
       end

      SEND_3:// 6 // 4th mdio data  
       begin
        if (tx_bit_done) 
         begin 
          shift_en = 1; 
                                                        new_ex_state = SEND_4;
         end 
        else                                            new_ex_state = SEND_3;
       end

      SEND_4:// 7 // 5th mdio data  
       begin
        if (tx_bit_done) 
         begin 
          shift_en = 1; 
                                                        new_ex_state = SEND_5;
         end 
        else                                            new_ex_state = SEND_4;
       end

      SEND_5:// 8 // 6th mdio data  
       begin
        if (tx_bit_done) 
         begin 
          shift_en = 1; 
                                                        new_ex_state = SEND_6;
         end 
        else                                            new_ex_state = SEND_5;
       end

      SEND_6:// 9 // 7th mdio data  
       begin
        if (tx_bit_done) 
         begin 
          shift_en = 1; 
                                                        new_ex_state = SEND_7;
         end 
        else                                            new_ex_state = SEND_6;
       end

      SEND_7:// A // 8th mdio data  
       begin
        if (tx_bit_done) 
         begin 
          shift_en = 1; 
                                                        new_ex_state = SEND_8;
         end 
        else                                            new_ex_state = SEND_7;
       end

      SEND_8:// B // 9th mdio data 
       begin
        if (tx_bit_done) 
         begin 
          shift_en = 1; 
                                                        new_ex_state = SEND_9;
         end 
        else                                            new_ex_state = SEND_8;
       end

      SEND_9:// C // 10th mdio data 
       begin
        if (tx_bit_done) 
         begin 
          shift_en = 1; 
                                                        new_ex_state = SEND_10;
         end 
        else                                            new_ex_state = SEND_9;
       end

      SEND_10:// D // 11th mdio data 
       begin
        if (tx_bit_done) 
         begin 
          shift_en = 1; 
                                                        new_ex_state = SEND_11;
         end 
        else                                            new_ex_state = SEND_10;
       end

      SEND_11:// E // 12th mdio data 
       begin
        if (tx_bit_done) 
         begin 
          shift_en = 1; 
                                                        new_ex_state = SEND_12;
         end 
        else                                            new_ex_state = SEND_11;
       end

      SEND_12:// F // 13th mdio data 
       begin
        if (tx_bit_done) 
         begin 
          shift_en = 1; 
                                                        new_ex_state = SEND_13;
         end 
        else                                            new_ex_state = SEND_12;
       end

      SEND_13:// 6'h10 //  14th mdio data 
       begin
        if (tx_bit_done) 
         begin 
          shift_en = 1; // This is to shift out 16th bit
                                                        new_ex_state = SEND_13_CHK;
         end 
        else                                            new_ex_state = SEND_13;
       end
//---------------------------------------------------------------------
      SEND_13_CHK:// 6'h11 (a pulse) // This ex_state check what to do next. Either do a write or read data.
       begin
        if (read_instr)
	  begin
          ta_clr_mdo_en = 1;
                                                        new_ex_state = RD_TA_b14; // read
         end
        else                                            new_ex_state = SEND_14;
       end

      RD_TA_b14:// 6'h12 // for read_op // 15th mdio data // 1st TA time = 1'bZ
       begin
        if (tx_bit_done)                                new_ex_state = RCV_14; // 26
        else                                            new_ex_state = RD_TA_b14; // stay&wait for tx_bit_done
       end
//---------------------------------------------------------------------

      SEND_14:// 6'h13 // for write_op // 15th mdio data // 1st TA time = 1'b1
       begin
        if (tx_bit_done)
         begin
          shift_en = 1; // This is to shift out 17th bit
                                                        new_ex_state = SEND_15;
         end
        else                                            new_ex_state = SEND_14;
       end

      SEND_15:// 6'h14 // 16th mdio data
       begin
        if (tx_bit_done)
         begin
          shift_en = 1;
                                                        new_ex_state = SEND_16;
         end
        else                                            new_ex_state = SEND_15;
       end

      SEND_16:// 6'h15 // 17th mdio data
       begin
        if (tx_bit_done)
         begin
          shift_en = 1;
                                                        new_ex_state = SEND_17;
         end
        else                                            new_ex_state = SEND_16;
       end

      SEND_17:// 6'h16 // 18th mdio data
       begin
        if (tx_bit_done)
         begin
          shift_en = 1;
                                                        new_ex_state = SEND_18;
         end
        else                                            new_ex_state = SEND_17;
       end

      SEND_18:// 6'h17 // 19th mdio data
       begin
        if (tx_bit_done)
         begin
          shift_en = 1;
                                                        new_ex_state = SEND_19;
         end
        else                                            new_ex_state = SEND_18;
       end

      SEND_19:// 6'h18 // 20th mdio data
       begin
        if (tx_bit_done)
         begin
          shift_en = 1;
                                                        new_ex_state = SEND_20;
         end
        else                                            new_ex_state = SEND_19;
       end

      SEND_20:// 6'h19 // 21st mdio data
       begin
        if (tx_bit_done)
         begin
          shift_en = 1;
                                                        new_ex_state = SEND_21;
         end
        else                                            new_ex_state = SEND_20;
       end

      SEND_21:// 6'h1A // 22nd mdio data
       begin
        if (tx_bit_done)
         begin
          shift_en = 1;
                                                        new_ex_state = SEND_22;
         end
        else                                            new_ex_state = SEND_21;
       end

      SEND_22:// 6'h1B // 23rd mdio data
       begin
        if (tx_bit_done)
         begin
          shift_en = 1;
                                                        new_ex_state = SEND_23;
         end
        else                                            new_ex_state = SEND_22;
       end

      SEND_23:// 6'h1C // 24th mdio data
       begin
        if (tx_bit_done)
         begin
          shift_en = 1;
                                                        new_ex_state = SEND_24;
         end
        else                                            new_ex_state = SEND_23;
       end

      SEND_24:// 6'h1D // 25th mdio data
       begin
        if (tx_bit_done)
         begin
          shift_en = 1;
                                                        new_ex_state = SEND_25;
         end
        else                                            new_ex_state = SEND_24;
       end

      SEND_25:// 6'h1E // 26th mdio data
       begin
        if (tx_bit_done)
         begin
          shift_en = 1;
                                                        new_ex_state = SEND_26;
         end
        else                                            new_ex_state = SEND_25;
       end

      SEND_26:// 6'h1F // 27th mdio data
       begin
        if (tx_bit_done)
         begin
          shift_en = 1;
                                                        new_ex_state = SEND_27;
         end
        else                                            new_ex_state = SEND_26;
       end

      SEND_27:// 6'h20 // 28th mdio data
       begin
        if (tx_bit_done)
         begin
          shift_en = 1;
                                                        new_ex_state = SEND_28;
         end
        else                                            new_ex_state = SEND_27;
       end

      SEND_28:// 6'h21 // 29th mdio data
       begin
        if (tx_bit_done)
         begin
          shift_en = 1;
                                                        new_ex_state = SEND_29;
         end
        else                                            new_ex_state = SEND_28;
       end

      SEND_29:// 6'h22 // 30th mdio data
       begin
        if (tx_bit_done)
         begin
          shift_en = 1;
                                                        new_ex_state = SEND_30;
         end
        else                                            new_ex_state = SEND_29;
       end

      SEND_30:// 6'h23 // 31st mdio data
       begin
        if (tx_bit_done)
         begin
          shift_en = 1;
                                                        new_ex_state = SEND_31;
         end
        else                                            new_ex_state = SEND_30;
       end

      SEND_31:// 6'h24 // 32nd mdio_data
       begin
        clr_mdo_en = 1;
        if (tx_bit_done)                                new_ex_state = SEND_31A;
        else                                            new_ex_state = SEND_31;
       end

      SEND_31A:// 6'h25
       begin
        if (tx_bit_done)                                new_ex_state = WR_DONE;
        else                                            new_ex_state = SEND_31A;
       end

      RCV_14:// 6'h26 // 16th 2nd TA = 1'bZ. MMD drive 1'b0;  -loj @1/27/05
       begin
        if (rx_bit_done)
         begin
          mdi_en = 1;
                                                        new_ex_state = RCV_15;
         end
        else                                            new_ex_state = RCV_14;
       end

      RCV_15:// 6'h27 // 1st rcv data
       begin
        if (rx_bit_done)
         begin
          mdi_en = 1;
          shift_en = 1;
                                                        new_ex_state = RCV_16;
         end
        else                                            new_ex_state = RCV_15;
       end

      RCV_16:// 6'h28 // 2nd rcv data
       begin
        if (rx_bit_done)
         begin
          mdi_en = 1;
          shift_en = 1;
                                                        new_ex_state = RCV_17;
         end
        else                                            new_ex_state = RCV_16;
       end

      RCV_17:// 6'h29 // 3rd rcv data
       begin
        if (rx_bit_done)
         begin
          mdi_en = 1;
          shift_en = 1;
                                                        new_ex_state = RCV_18;
         end
        else                                            new_ex_state = RCV_17;
       end

      RCV_18:// 6'h2A // 4th rcv data
       begin
        if (rx_bit_done)
         begin
          mdi_en = 1;
          shift_en = 1;
                                                        new_ex_state = RCV_19;
         end
        else                                            new_ex_state = RCV_18;
       end

      RCV_19:// 6'h2B // 5th rcv data
       begin
        if (rx_bit_done)
         begin
          mdi_en = 1;
          shift_en = 1;
                                                        new_ex_state = RCV_20;
         end
        else                                            new_ex_state = RCV_19;
       end

      RCV_20:// 6'h2C // 6th rcv data
       begin
        if (rx_bit_done)
         begin
          mdi_en = 1;
          shift_en = 1;
                                                        new_ex_state = RCV_21;
         end
        else                                            new_ex_state = RCV_20;
       end

      RCV_21:// 6'h2D // 7th rcv data
       begin
        if (rx_bit_done)
         begin
          mdi_en = 1;
          shift_en = 1;
                                                        new_ex_state = RCV_22;
         end
        else                                            new_ex_state = RCV_21;
       end

      RCV_22:// 6'h2E // 8th rcv data
       begin
        if (rx_bit_done)
         begin
          mdi_en = 1;
          shift_en = 1;
                                                        new_ex_state = RCV_23;
         end
        else                                            new_ex_state = RCV_22;
       end

      RCV_23:// 6'h2F // 9th rcv data
       begin
        if (rx_bit_done)
         begin
          mdi_en = 1;
          shift_en = 1;
                                                        new_ex_state = RCV_24;
         end
        else                                            new_ex_state = RCV_23;
       end

      RCV_24:// 6'h30 // 10th rcv data
       begin
        if (rx_bit_done)
         begin
          mdi_en = 1;
          shift_en = 1;
                                                        new_ex_state = RCV_25;
         end
        else                                            new_ex_state = RCV_24;
       end

      RCV_25:// 6'h31 // 11th rcv data
       begin
        if (rx_bit_done)
         begin
          mdi_en = 1;
          shift_en = 1;
                                                        new_ex_state = RCV_26;
         end
        else                                            new_ex_state = RCV_25;
       end

      RCV_26:// 6'h32 // 12th rcv data
       begin
        if (rx_bit_done)
         begin
          mdi_en = 1;
          shift_en = 1;
                                                        new_ex_state = RCV_27;
         end
        else                                            new_ex_state = RCV_26;
       end

      RCV_27:// 6'h33 // 13th rcv data
       begin
        if (rx_bit_done)
         begin
          mdi_en = 1;
          shift_en = 1;
                                                        new_ex_state = RCV_28;
         end
        else                                            new_ex_state = RCV_27;
       end

      RCV_28:// 6'h34 // 14th rcv data
       begin
        if (rx_bit_done)
         begin
          mdi_en = 1;
          shift_en = 1;
                                                        new_ex_state = RCV_29;
         end
        else                                            new_ex_state = RCV_28;
       end

      RCV_29:// 6'h35 // 15th rcv data
       begin
        if (rx_bit_done)
         begin
          mdi_en = 1;
          shift_en = 1;
                                                        new_ex_state = RCV_30;
         end
        else                                            new_ex_state = RCV_29;
       end

      RCV_30:// 6'h36 // 16th rcv data
       begin
        if (rx_bit_done)
         begin
          mdi_en = 1;
          shift_en = 1;
                                                        new_ex_state = RCV_31;
         end
        else                                            new_ex_state = RCV_30;
       end

      RCV_31:// 6'h37 // This state is not doing anything. -loj 1/28/05
       begin
        if (rx_bit_done)
         begin
          mdi_en = 1;  // useless mdi_en -loj 1/28/05
                                                        new_ex_state = RD_DONE;
         end
        else                                            new_ex_state = RCV_31;
       end

      WR_DONE:// 6'h38
       begin
        wr_done = 1;
                                                        new_ex_state = IDLE;
       end

      RD_DONE:// 6'h39
       begin
        rd_done = 1;
                                                        new_ex_state = IDLE;
       end
     endcase
  end // always @ (clk or...
   

RegRst #(6) ex_state_RegRst (.clk(clk),.reset(reset),.din(new_ex_state),.qout(ex_state));
   
endmodule
