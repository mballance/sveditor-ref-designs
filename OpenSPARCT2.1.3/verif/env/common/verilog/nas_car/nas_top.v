// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: nas_top.v
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
`timescale 1 ps/ 1 ps

module nas_top;

`include "defines.vh"
`include "nas.vh"

integer     act_queue;   // Actual (DUT) queue handle
integer     exp_queue;   // Expected (Ref Model) queue handle
reg  [63:0] act_status;  // if 0, empty.  if 1, not empty.
reg  [63:0] exp_status;
reg   [2:0] th_cwp  [0:63];  // copy of CWP updated by nas_pipe.v
reg   [2:0] th_currcwp  [0:63];  // copy of CWP currently checked
integer     tindex;
integer     delta_cnt;
integer     oldest_actid;   // Oldest TID in exp_actual Queue
integer    err_cnt [63:0];
reg  [63:0] sstep_sent;  // Asserted if SSTEP was already sent
                         // by another module (i.e. tlb_sync,ldst_sync,int_sync)
reg  [63:0] sstep_early;  // Asserted if SSTEP was sent before
                          // nas_pipe captured state changes
integer    last_skt_cycle;// Timer used for socket timeout

// wires for asm user events
`include "asmEventsProbes.vh"

reg [63:0] good_trap_detected;  // Good_trap, but wait for stb empty

// wires for lsu_stb_empty, ireq_pending
`include "nas_top_inc.vh"

//----------------------------------------------------------
// Instantiate 1-8 cores
`ifdef CORE_0
  nas_core0 c0 (3'h0);
`endif
`ifdef CORE_1
  nas_core1 c1 (3'h1);
`endif
`ifdef CORE_2
  nas_core2 c2 (3'h2);
`endif
`ifdef CORE_3
  nas_core3 c3 (3'h3);
`endif
`ifdef CORE_4
  nas_core4 c4 (3'h4);
`endif
`ifdef CORE_5
  nas_core5 c5 (3'h5);
`endif
`ifdef CORE_6
  nas_core6 c6 (3'h6);
`endif
`ifdef CORE_7
  nas_core7 c7 (3'h7);
`endif

//----------------------------------------------------------
// Queue and Socket Initialization

initial begin: INIT_BLOCK // {
  integer i;


  @ (negedge `SYSTEMCLOCK);
  if (`PARGS.nas_check_on) begin // {
      `PR_INFO("nas", `INFO, "Init actual_queue, expect_queue");
      act_status = 64'h0;
      exp_status = 64'h0;
      sstep_sent = 64'h0;
      sstep_early = 64'h0;
      exp_queue = $queue(`EXP_QUEUE, `INIT_Q);
      act_queue = $queue(`ACT_QUEUE, `INIT_Q);
      $socket_init();
      for (i=0;i<=63;i=i+1) begin
         err_cnt[i] = 0;
      end
  end //}
  good_trap_detected = 64'h0;
  last_skt_cycle = 0;
  // Initialize shadow copy of CWP for each thread   
  for (i=0;i<=63; i=i+1) begin
    th_cwp[i] = 3'b0;
    th_currcwp[i] = 3'b0;
  end

end // }


//----------------------------------------------------------
// Read & parse socket if ready

always begin : NAS_CHECK // {
  integer i;
  repeat (`PARGS.nas_q_rate/2) @ (negedge `SYSTEMCLOCK);

  if (`PARGS.nas_check_on && (`ACT_STATUS & `PARGS.th_check_enable)) begin  // {  BITWISE & !
    if (`PARGS.socket_use_flush) $sim_flush();
    repeat (`PARGS.nas_q_rate/2) @ (negedge `SYSTEMCLOCK);
    `EXP_STATUS = $sim_recv(`EXP_QUEUE, `ACT_QUEUE, oldest_actid);
    while (`EXP_STATUS[oldest_actid]&&
           `ACT_STATUS[oldest_actid]&&
           `PARGS.th_check_enable[oldest_actid]) begin // {
      cmp_queue (oldest_actid);
      last_skt_cycle = `TOP.core_cycle_cnt;
    end // }
    if (`PARGS.socket_use_flush) $sim_flush();
  end // }

  // Check for socket timeout (i.e. no socket msgs coming from NAS)
  if (`PARGS.nas_check_on && (`TOP.core_cycle_cnt - last_skt_cycle) > `PARGS.skt_timeout)
  begin // {

    // Note:  Do not change this message because regreport parses it for certain words.
    `PR_ALWAYS ("top", `ALWAYS, "ERROR: No Socket msgs received from NAS for %0d Cycles - Socket TIMEOUT!",
       `PARGS.skt_timeout);
     bad_end;
  end //}

  // Wait for special conditions before stopping all messages for a thread to be sent.
  if (|good_trap_detected) begin // {
      for (i=0;i<=63;i=i+1) begin // {
        if (good_trap_detected[i] & lsu_stb_empty[i] & ireq_pending[i]) begin // {
          `PR_NORMAL("nas", `NORMAL, "T%0d reached Good Trap.  Disabling checking for thread %0d",
                    i, i);
          `PARGS.th_check_enable[i] = 1'b0;
          `TOP.finished_tids[i] = 1'b1;
          `EXP_STATUS = $queue(`EXP_QUEUE, `FLUSH_TH_Q, i);
          `ACT_STATUS = $queue(`ACT_QUEUE, `FLUSH_TH_Q, i);
          good_trap_detected[i] = 1'b0;
        end //}
      end // }
  end //}

end // }

//----------------------------------------------------------
// Compare actual_queue, expect_queue

task cmp_queue;

  input [5:0] tnum;

  reg [63:0] exp_tstamp;
  reg [63:0] act_tstamp;
  integer    exp_regnum;
  integer    act_regnum;
  integer    exp_level;
  integer    act_level;
  integer    exp_win;
  integer    act_win;
  reg [63:0] exp_value;
  reg [63:0] act_value;
  reg [7:0]  exp_type;
  reg [7:0]  act_type;
  reg [63:0] value_mask;
  reg  [(20*8)-1:0] exp_regname;
  reg  [(20*8)-1:0] act_regname;

  integer i;

  begin : CMP_BLOCK // {

    delta_cnt = 0;

    //----------
    // Pop while exp_queue is oldest and not empty
    // Or has an error pending and needs to drain act_queue to get timestamps
    while (err_cnt[tnum] || (`EXP_STATUS[tnum] && `ACT_STATUS[tnum] &&
          (oldest_actid == tnum))) begin : STATUS_BLOCK // {
      // If error has occurred, find instruction boundary, 
      //   print instruction, then kill simulation
      if (err_cnt[tnum] != 0)  begin // {
        `NASTOP.delta_cnt = 0;
        $display ("\nDumping remaining ACTUAL deltas ..");
        print_delta (tnum,act_type,act_win,act_regnum,act_value);
        act_regnum = 0;
        while (act_regnum != `END_INSTR) begin // {
           `ACT_STATUS = $queue(`ACT_QUEUE, `POP_Q, tnum, act_tstamp, act_type,
                            act_level, act_win, act_regnum, act_value,
                            oldest_actid);
           `PR_DEBUG("nas", `DEBUG, "Act Queue: T%0d, \"%s\", GL=%0d, CWP=%0d, Reg=%0d, %h",
                    tnum, act_type, act_level, act_win, act_regnum, act_value);

           print_delta (tnum,act_type,act_win,act_regnum,act_value);
        end // }
        `EXP_STATUS = $queue(`EXP_QUEUE, `PR_INSTR_Q, tnum, act_value, 
                             act_tstamp, "", "FAILED!");
        disable NAS_CHECK;
      end // }


      `EXP_STATUS = $queue(`EXP_QUEUE, `POP_Q, tnum, exp_tstamp, exp_type,
                            exp_level, exp_win, exp_regnum, exp_value);

       `PR_DEBUG("nas", `DEBUG, "Exp Queue: T%0d, \"%s\", GL=%0d, CWP=%0d, reg=%0d, %h",
                tnum, exp_type, exp_level, exp_win, exp_regnum, exp_value);
      //----------
      // Only proceed if thread checking still enabled ..
      if (`PARGS.th_check_enable[tnum]) begin // {
          if (`PARGS.show_delta_on) begin // {
            print_delta (tnum,exp_type,exp_win,exp_regnum,exp_value);
          end // }

          //----------
          if (check_this_one(exp_type,exp_regnum)) begin:CHECK_THIS // {

           `ACT_STATUS = $queue(`ACT_QUEUE, `POP_Q, tnum, act_tstamp, act_type,
                                act_level, act_win, act_regnum, act_value,
                                oldest_actid);

           `PR_DEBUG("nas", `DEBUG, "Act Queue: T%0d, \"%s\", GL=%0d, CWP=%0d, reg=%0d, %h",
                    tnum, act_type, act_level, act_win, act_regnum, act_value);

           if (!check_this_one(act_type,act_regnum)) begin // {
               if (exp_regnum ==`END_INSTR) begin // {
                    `EXP_STATUS = $queue(`EXP_QUEUE, `PR_INSTR_Q, tnum, act_value, 
                                          act_tstamp, "", "OK");
                    if (`PARGS.show_delta_on) 
                        get_regname(tnum,act_type,act_win,act_regnum,act_regname);
                    while (act_regnum != `END_INSTR) begin // {
                       `ACT_STATUS = $queue(`ACT_QUEUE, `POP_Q, tnum, act_tstamp, act_type,
                                        act_level, act_win, act_regnum, act_value,
                                        oldest_actid);
                       `PR_DEBUG("nas", `DEBUG, "Act Queue: T%0d, \"%s\", GL=%0d, CWP=%0d, reg=%0d, %h",
                                tnum, act_type, act_level, act_win, act_regnum, act_value);
                    delta_cnt = 0;
                    end // }
                disable STATUS_BLOCK;
               end //}
               disable CHECK_THIS;
           end // }

            //----------
            if ((act_regnum ==`END_INSTR)&&(exp_regnum ==`END_INSTR)) begin // {
              // End of Instr - w/o errors
              // Print Instruction & Pop next Instruction
              if (err_cnt[tnum] == 0) begin // {
                `EXP_STATUS = $queue(`EXP_QUEUE, `PR_INSTR_Q, tnum, act_value, 
                                      act_tstamp, "", "OK");
                delta_cnt = 0;
                if (`PARGS.show_delta_on) 
                    get_regname(tnum,act_type,act_win,act_regnum,act_regname);
                disable STATUS_BLOCK;
              end // }
              // End of Instr - w/ errors
              else begin // {
               `EXP_STATUS = $queue(`EXP_QUEUE, `PR_INSTR_Q, tnum, act_value, 
                                     act_tstamp, "", "FAILED!");
                disable NAS_CHECK;
              end // }
            end // }
            // End of Instr - w/ errors  (Act finished unexpectedly)
            else if ((act_regnum ==`END_INSTR)&&(exp_regnum !=`END_INSTR)) 
            begin // {
              if (`PARGS.show_delta_on) begin $display(); end
              get_regname(tnum,exp_type,exp_win,exp_regnum,exp_regname);
              // Print failing expect register if show_delta OFF
              if (!`PARGS.show_delta_on) begin // {
                print_delta (tnum,exp_type,exp_win,exp_regnum,exp_value);
                $display();
              end // }
              `PR_ERROR("nas", `ERROR, "@%0d  T%0d - DUT Reg did not change: Exp %0s = %h. \n",
                        act_tstamp, tnum,exp_regname,exp_value);
              `EXP_STATUS = $queue(`EXP_QUEUE, `PR_INSTR_Q, tnum, act_value,
                                   act_tstamp, "", "FAILED!");
              show_unchecked_delta(tnum);
              disable NAS_CHECK;
            end // } 
            // End of Instr - w/ errors (Act not finished)
            else if ((act_regnum !=`END_INSTR)&&(exp_regnum ==`END_INSTR)) 
            begin // {
              if (`PARGS.show_delta_on) begin $display(); end
              get_regname(tnum,act_type,act_win,act_regnum,act_regname);
              `PR_ERROR ("nas", `ERROR, "@%0d  T%0d - Unexpected Reg change in DUT.  %0s = %h.\n",
                         act_tstamp, tnum,act_regname,act_value);
              // Don't know address until DUT reaches END_INSTR ..
              err_cnt[tnum] = err_cnt[tnum] + 1;
              disable CHECK_THIS;
            end // } 

            //----------
            // Not End of Instr
            // So, continue checking this instruction

            // Exclude %g0 from this check since %g0 is used for ldst_sync/tlb_sync error indication
            // and global level may not be correct.
            if ((exp_type=="G")&&(act_type=="G") && (exp_level != act_level) && (exp_regnum != 0)) begin // {
               err_cnt[tnum] = err_cnt[tnum] + 1;
                if (`PARGS.show_delta_on) begin $display(); end
               `PR_ERROR ("nas", `ERROR, "@%0d  T%0d - Wrong Global Level. Act = %0h. Exp = %0h.\n",
                        act_tstamp, tnum, act_level,exp_level);
            end // }

            if (exp_regnum ==`PC     || exp_regnum ==   `NPC) begin // {
              value_mask = `PC_MASK;
            end // }
            else if (exp_regnum == `TBA ||exp_regnum == `HTBA ||
                     exp_regnum ==`TPC1   || exp_regnum ==   `TNPC1  || 
                     exp_regnum ==`TPC2   || exp_regnum ==   `TNPC2  || 
                     exp_regnum ==`TPC3   || exp_regnum ==   `TNPC3  || 
                     exp_regnum ==`TPC4   || exp_regnum ==   `TNPC4  || 
                     exp_regnum ==`TPC5   || exp_regnum ==   `TNPC5  || 
                     exp_regnum ==`TPC6   || exp_regnum ==   `TNPC6  ||
                     exp_regnum ==`I_TAG_ACC || exp_regnum ==`D_TAG_ACC ||
                     exp_regnum ==`WATCHPOINT_ADDR
                    )
            begin // {
              value_mask = `MASK_48 ;
            end //}
            else begin  // {
              value_mask = 64'hffff_ffff_ffff_ffff;
            end // }

            if ((exp_type != act_type) ||
                (exp_regnum != act_regnum) ||
                ((exp_type =="W") && (exp_win != act_win)))begin // {
              err_cnt[tnum] = err_cnt[tnum] + 1;
              // Print failing expect register if show_delta OFF
              if (!`PARGS.show_delta_on) begin // {
                print_delta (tnum,exp_type,exp_win,exp_regnum,exp_value);
                $display();
              end // }
              if (exp_regnum > act_regnum) begin // {
                if (`PARGS.show_delta_on) begin $display(); end
                 get_regname(tnum,act_type,act_win,act_regnum,act_regname);
                `PR_ERROR ("nas", `ERROR, "@%0d  T%0d - Unexpected Reg Change: DUT %0s = %h.\n",
                       act_tstamp, tnum,act_regname,act_value);
              end // }
              else if (exp_regnum < act_regnum) begin // {
                if (`PARGS.show_delta_on) begin $display(); end
                 get_regname(tnum,exp_type,exp_win,exp_regnum,exp_regname);
                `PR_ERROR ("nas", `ERROR, "@%0d  T%0d - DUT Reg did not change: Exp %0s = %h.\n",
                       act_tstamp, tnum,exp_regname, exp_value);
              end // }
              else begin // {
                if (`PARGS.show_delta_on) begin $display(); end
                 get_regname(tnum,exp_type,exp_win,exp_regnum,exp_regname);
                 get_regname(tnum,act_type,act_win,act_regnum,act_regname);
                `PR_ERROR ("nas", `ERROR, "@%0d  T%0d - Reg Name Mismatch: DUT = %s, Expect=%0s.\n",
                       act_tstamp, tnum,act_regname,exp_regname);
              end // }
              show_unchecked_delta(tnum);
              disable CHECK_THIS;
            end // }

            else if ((exp_value & value_mask) != (act_value & value_mask))begin // {
              // Suppress error if `OPCODE & value==0 (special case of illtrap where miscmp will happen)
              // Suppress error if pc[0] is 1 (WMR case, we force pc[0]=1)
              if ((((exp_regnum==`OPCODE)&&(exp_value!=0)) ||
                   (exp_regnum!=`OPCODE)) &&
                  (!((act_regnum==`PC)&&(act_value[0]==1))))begin // {
                err_cnt[tnum] = err_cnt[tnum] + 1;
                if (`PARGS.show_delta_on) begin $display(); end
                get_regname(tnum,exp_type,exp_win,exp_regnum,exp_regname);
                get_regname(tnum,act_type,act_win,act_regnum,act_regname);
                // Print failing expect register if show_delta OFF
                if (!`PARGS.show_delta_on) begin // {
                  print_delta (tnum,exp_type,exp_win,exp_regnum,exp_value);
                  $display();
                end // }
                // Special msg for OPCODE miscompare.
                if (exp_regnum==`OPCODE)  begin // {
                  `PR_ERROR ("nas", `ERROR, "@%0d  T%0d - Instruction Miscompare: DUT %0s = %h, Exp %0s = %h, Mask = %h.\n",
                         act_tstamp, tnum,act_regname,act_value,exp_regname,exp_value,value_mask);
                end // }
                // Generic msg for register miscompare
                else begin // {
                  `PR_ERROR ("nas", `ERROR, "@%0d  T%0d - Reg Value Miscompare: DUT %0s = %h, Exp %0s = %h, Mask = %h.\n",
                         act_tstamp, tnum,act_regname,act_value,exp_regname,exp_value,value_mask);

                end // }
                // Special msg for PC/NPC miscompare
                if ((exp_regnum==`PC)|(exp_regnum==`NPC)) begin // {
                  `PR_NORMAL("nas", `NORMAL, "T%0d       PC/NPC are architected state AFTER instruction completes",tnum);
                  `PR_NORMAL("nas", `NORMAL, "T%0d       NEXT instruction will be wrong because branch/exception not/incorrectly taken",tnum);
  
                end // }
                show_unchecked_delta(tnum);
                disable CHECK_THIS;
              end // }
            end // }
            

            // When th_check_enable is OFF, ldst_sync msgs are disabled.
            // A Store will retire in the pipeline before the Store is acked in the LSU.
            // th_check_enable cannot be turned off until all the ldst_sync msgs for the Store are done.
            // Need to make sure Store Buffer is empty before turning off th_check_enable.
            // Set good_trap_detected, which will wait for stb_empty to turn of th_check_enable ..
            for (i=0;i<`PARGS.good_trap_count;i=i+1)
            if ((exp_regnum==`PC) &&
                (`PC_MASK&exp_value)==(`PC_MASK&`PARGS.good_trap_addr[i])) begin // {
              if (`PARGS.show_delta_on) $write("\n");
              good_trap_detected[tnum] = 1'b1;
              disable CMP_BLOCK;
            end // }
            for (i=0;i<`PARGS.bad_trap_count;i=i+1)
            if ((exp_regnum==`PC) &&
                (`PC_MASK&exp_value)==(`PC_MASK&`PARGS.bad_trap_addr[i])) begin // {
              if (`PARGS.show_delta_on) $write("\n");
              `PR_ERROR("nas", `ERROR, "T%0d reached Bad Trap.\n",tnum);
            end // }
        end // }
        `ACT_STATUS = $queue(`ACT_QUEUE, `STATUS_Q, `ACT_QUEUE, oldest_actid);
      end // }

    end // }

  end // }
endtask


//----------------------------------------------------------
// Print exp deltas after a fail is detected ..
task show_unchecked_delta;
  input  [5:0] tnum;

  integer oldest_expid;
  reg  [7:0] exp_type;
  reg  [3:0] exp_level;
  reg [31:0] exp_win;
  reg [31:0] exp_regnum;
  reg [63:0] exp_value, exp_tstamp;
    begin // {
      exp_regnum = 0;
      `NASTOP.delta_cnt = 0;
      $display ("\nDumping remaining EXPECTED deltas ..");
      while (exp_regnum != `END_INSTR) begin // {
        `ACT_STATUS = $queue(`EXP_QUEUE, `POP_Q, tnum, exp_tstamp, 
                              exp_type, exp_level, exp_win, 
                              exp_regnum, exp_value, oldest_expid);
        print_delta (tnum,exp_type,exp_win, exp_regnum,exp_value);

      end // }
    end //}
endtask

//----------------------------------------------------------
// Print a register's name and value
task print_delta;
  input  [5:0] tnum;
  input  [7:0] type;
  input [31:0] win;
  input [31:0] regnum;
  input [63:0] value;

  reg    [2:0] cid;
  reg    [2:0] tid;
  reg  [(20*8)-1:0] tmp_regname;

  integer      cnt_per_line;

  begin // {

    delta_cnt = delta_cnt + 1;
    if (`TOP.debug) 
        cnt_per_line =1;
    else 
        cnt_per_line = 3;

    cid = tnum / 8;
    tid = tnum % 8;
    // Print TID at beginning of each line
    if ((cnt_per_line ==1 || (delta_cnt % cnt_per_line) == 1) && 
        (regnum!=`END_INSTR)) begin  // {
      $write("<T%0d>\t",tnum);
    end // }

    `NASTOP.get_regname(tnum,type,win,regnum,tmp_regname);
    if (regnum!=`END_INSTR) begin // {
      $write ("%0s = %h",tmp_regname,value);
    end // }

    // Print N registers per line

    // If no more deltas, Add <CR> to finish off previous line
    if ((regnum==`END_INSTR)&&((delta_cnt % cnt_per_line)!=1 ||
        cnt_per_line ==1)) begin // {
      $write ("\n");
    end // }
    else if (regnum==`END_INSTR) begin // {
      // no <cr> or <tab>
    end // }
    // Add <CR> to finish off previous line and continue with next delta
    else if ((delta_cnt % cnt_per_line)==0 || cnt_per_line ==1 ) begin // {
      $write ("\n");
    end // }
    // Add <tab> before next delta
    else begin // {
      $write ("\t");
    end // }

  end // }
endtask
  
//----------------------------------------------------------
// Convert to registers names (i.e. %o1, %g2, %i3, %l4, PC)
task get_regname;

  input    [5:0] tnum;
  input    [7:0] type;
  input   [31:0] win;
  input   [31:0] regnum;
  output [(20*8)-1:0] tmp_regname;
  reg     [(2*8)-1:0] tmp_regnum;
  integer        tmp1,tmp2;

  begin // {
    case (type)
      "W": begin // {
             case (regnum) // {
               8,9,10,11,12,13,14,15: begin // {
                    if ( win == th_currcwp[tnum] ) begin // {
                      tmp_regname = "%o";
                      tmp_regnum = regnum - 8;
                     end // }
                     else begin // {
                       tmp_regname = "%i";
                       tmp_regnum = regnum - 8;
                     end // }
                    end // }
               16,17,18,19,20,21,22,23: begin // {
                      tmp_regname = "%l";
                      tmp_regnum = regnum - 16;
                    end // }
             endcase // }
             tmp_regnum = tmp_regnum+'h30; // convert to ascii value for num
             tmp_regname = {tmp_regname,tmp_regnum};
           end // }
      "G": begin // {
             tmp_regnum = regnum;
             tmp_regname = "%g";
             tmp_regnum = tmp_regnum+'h30; // convert to ascii value for num
             tmp_regname = {tmp_regname,tmp_regnum};
           end // }
      "F": begin // {
             tmp_regnum = regnum;
             tmp_regname = "%f";
             if (tmp_regnum<=9) begin
               tmp_regnum = tmp_regnum+'h30; // convert to ascii value for num
             end
             else begin
               tmp1 = tmp_regnum%10;
               tmp2 = tmp_regnum/10;
               tmp_regnum = ((tmp2+'h30)<<8) + (tmp1+'h30); // convert to ascii value for num
             end
             tmp_regname = {tmp_regname,tmp_regnum};
           end // }
      "C": begin :CONTROL_REG// {
             case(regnum)
                `PC: tmp_regname = "PC";
                `NPC: tmp_regname = "NPC";
                `Y: tmp_regname = "Y";
                `CCR: tmp_regname = "CCR";
                `FPRS: tmp_regname = "FPRS";
                `FSR: tmp_regname = "FSR";
                `ASI: tmp_regname = "ASI";
                `TICK: tmp_regname = "TICK";
                `GSR: tmp_regname = "GSR";
                `TICK_CMPR: tmp_regname = "TICK_CMPR";
                `STICK: tmp_regname = "STICK";
                `STICK_CMPR: tmp_regname = "STICK_CMPR";
                `PSTATE: tmp_regname = "PSTATE";
                `TL: tmp_regname = "TL";
                `PIL: tmp_regname = "PIL";
                `TPC1: tmp_regname = "TPC1";
                `TPC2: tmp_regname = "TPC2";
                `TPC3: tmp_regname = "TPC3";
                `TPC4: tmp_regname = "TPC4";
                `TPC5: tmp_regname = "TPC5";
                `TPC6: tmp_regname = "TPC6";
                `TNPC1: tmp_regname = "TNPC1";
                `TNPC2: tmp_regname = "TNPC2";
                `TNPC3: tmp_regname = "TNPC3";
                `TNPC4: tmp_regname = "TNPC4";
                `TNPC5: tmp_regname = "TNPC5";
                `TNPC6: tmp_regname = "TNPC6";
                `TSTATE1: tmp_regname = "TSTATE1";
                `TSTATE2: tmp_regname = "TSTATE2";
                `TSTATE3: tmp_regname = "TSTATE3";
                `TSTATE4: tmp_regname = "TSTATE4";
                `TSTATE5: tmp_regname = "TSTATE5";
                `TSTATE6: tmp_regname = "TSTATE6";
                `TT1: tmp_regname = "TT1";
                `TT2: tmp_regname = "TT2";
                `TT3: tmp_regname = "TT3";
                `TT4: tmp_regname = "TT4";
                `TT5: tmp_regname = "TT5";
                `TT6: tmp_regname = "TT6";
                `TBA: tmp_regname = "TBA";
                `VER: tmp_regname = "VER";
                `CWP: tmp_regname = "CWP";
                `CANSAVE: tmp_regname = "CANSAVE";
                `CANRESTORE: tmp_regname = "CANRESTORE";
                `OTHERWIN: tmp_regname = "OTHERWIN";
                `WSTATE: tmp_regname = "WSTATE";
                `CLEANWIN: tmp_regname = "CLEANWIN";
                `SOFTINT: tmp_regname = "SOFTINT";
                `INTR_RECEIVE: tmp_regname = "INTR_RECEIVE";
                `GL: tmp_regname = "GL";
                `HPSTATE: tmp_regname = "HPSTATE";
                `HTSTATE1: tmp_regname = "HTSTATE1";
                `HTSTATE2: tmp_regname = "HTSTATE2";
                `HTSTATE3: tmp_regname = "HTSTATE3";
                `HTSTATE4: tmp_regname = "HTSTATE4";
                `HTSTATE5: tmp_regname = "HTSTATE5";
                `HTSTATE6: tmp_regname = "HTSTATE6";
                `HTBA: tmp_regname = "HTBA";
                `HINTP: tmp_regname = "HINTP";
                `HSTICK_CMPR: tmp_regname = "HSTICK_CMPR";
                `MID: tmp_regname = "MID";
                `ISFSR: tmp_regname = "ISFSR";
                `DSFSR: tmp_regname = "DSFSR";
                `DSFAR: tmp_regname = "DSFAR";

                `CTXT_PRIM_0: tmp_regname = "CTXT_PRIM_0";
                `CTXT_SEC_0: tmp_regname = "CTXT_SEC_0";
                `CTXT_PRIM_1: tmp_regname = "CTXT_PRIM_1";
                `CTXT_SEC_1: tmp_regname = "CTXT_SEC_1";
                `LSU_CONTROL: tmp_regname = "LSU_CONTROL";
                `I_TAG_ACC: tmp_regname = "I_TAG_ACC";
                `CTXT_Z_TSB_CFG0: tmp_regname  = "CTXT_Z_TSB_CFG0";
                `CTXT_Z_TSB_CFG1: tmp_regname  = "CTXT_Z_TSB_CFG1";
                `CTXT_Z_TSB_CFG2: tmp_regname  = "CTXT_Z_TSB_CFG2";
                `CTXT_Z_TSB_CFG3: tmp_regname  = "CTXT_Z_TSB_CFG3";
                `CTXT_NZ_TSB_CFG0: tmp_regname = "CTXT_NZ_TSB_CFG0";
                `CTXT_NZ_TSB_CFG1: tmp_regname = "CTXT_NZ_TSB_CFG1";
                `CTXT_NZ_TSB_CFG2: tmp_regname = "CTXT_NZ_TSB_CFG2";
                `CTXT_NZ_TSB_CFG3: tmp_regname = "CTXT_NZ_TSB_CFG3";
                `I_DATA_IN: tmp_regname = "I_DATA_IN";
                `D_TAG_ACC: tmp_regname = "D_TAG_ACC";
                `WATCHPOINT_ADDR: tmp_regname = "WATCHPOINT_ADDR";
                `D_DATA_IN: tmp_regname = "D_DATA_IN";

                `OPCODE: tmp_regname = "OPCODE";
                default: tmp_regname = "UNKNOWN";
             endcase
           end // }
      "X": begin :EOF// {
             tmp_regname = "END_INSTR";
             th_currcwp[tnum] = win ; // END_INSTR has win# of next instr
           end // }
       default: begin : DEFAULT  // {
              tmp_regname= "UNKN";
              `PR_ERROR("nas", `ERROR, "T%0d Illegal/Unexpected register type \"%s\" (%d)",
                                 tnum, type, type);
            end // }
  
    endcase  

  end // }
endtask

//----------------------------------------------------------
// This function checks to see if the register is on the list
// of registers currently supported by the bench.

function check_this_one;
  input [7:0]  exp_type;
  input [31:0] exp_regnum;

  begin // {
    check_this_one = 1'b0;  // default value

    case (exp_type)
      "W",
      "F",
      "G": begin // {
             // Conditionally, remove IRF,FRF register compares
             `ifdef NAS_NO_IRFFRF
               check_this_one = 1'b0;
             `else
               check_this_one = 1'b1;
             `endif
           end // }
      "C": begin // {
             case (exp_regnum)

               // DON'T check these control registers
              `ifndef OPCODE_COMPARE
               `OPCODE,
              `endif

// ADD_TSB_CFG
// NOTE - ADD_TSB_CFG will never be used for Axis or Tharas (ifdef EMUL) or
//        if MMU reg slam is enabled
`ifdef ADD_TSB_CFG
// CHECK THESE = YES
               // `CTXT_Z_TSB_CFG0,
               // `CTXT_Z_TSB_CFG1,
               // `CTXT_Z_TSB_CFG2,
               // `CTXT_Z_TSB_CFG3,
               // `CTXT_NZ_TSB_CFG0,
               // `CTXT_NZ_TSB_CFG1,
               // `CTXT_NZ_TSB_CFG2,
               // `CTXT_NZ_TSB_CFG3,
`else
// CHECK THESE = NO
               `CTXT_Z_TSB_CFG0,
               `CTXT_Z_TSB_CFG1,
               `CTXT_Z_TSB_CFG2,
               `CTXT_Z_TSB_CFG3,
               `CTXT_NZ_TSB_CFG0,
               `CTXT_NZ_TSB_CFG1,
               `CTXT_NZ_TSB_CFG2,
               `CTXT_NZ_TSB_CFG3,
`endif

               // CHECK THESE = YES
               //`D_TAG_ACC,

               `I_DATA_IN,
               `D_DATA_IN,

               `NPC,
               `STICK,
               `TICK,
               `ECACHE_ERROR_ENABLE,
               `ASYNCHRONOUS_FAULT_STATUS,
               `ASYNCHRONOUS_FAULT_ADDRESS,
               `OUT_INTR_DATA0,
               `OUT_INTR_DATA1,
               `OUT_INTR_DATA2,
               `INTR_DISPATCH_STATUS,
               `INTR_RECEIVE,
               `IN_INTR_DATA0,
               `IN_INTR_DATA1,
               `IN_INTR_DATA2,
               `MID,
               `ISFSR,
               `DSFSR:
                        begin // {
                          check_this_one = 1'b0;
                        end // }

               // DO check all the rest of the control registers
               default: begin // {
                          check_this_one = 1'b1;
                        end // }
             endcase
           end // }
    endcase
    if (exp_regnum == `END_INSTR) check_this_one = 1'b1;
  end // }
endfunction

//----------------------------------------------------------
endmodule
//----------------------------------------------------------
//----------------------------------------------------------
