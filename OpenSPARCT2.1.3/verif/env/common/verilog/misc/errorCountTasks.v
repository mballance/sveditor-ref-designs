// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: errorCountTasks.v
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
`include "dispmonDefines.vh"
// Assumes `TOP is defined!!!

reg     quiet;
reg     debug;
reg     info;
reg [31:0] error_count;
reg [31:0] warning_count;
reg [31:0] maxerror;
reg [31:0] maxwarning;
reg [31:0] wait_cycle_to_kill;
reg     no_verilog_finish;
integer start_debug;
integer start_info;
reg [512*8:0] arg_str;
reg [31:0] bad_end_called;

// Needed for optional dissabling of dispmon at time zero.
// Needed by certain benches that have X's at time zero and time one.
// If you don't need, ignore it. It can be X by default.
// This has to go in the bench top.
reg dispmon_disable;


initial begin
  quiet = 0;
  debug = 0;
  info = 0;
  error_count = 0;
  warning_count = 0;
  maxerror = 1;
  maxwarning = 5;
  wait_cycle_to_kill = 5;
  no_verilog_finish = 0;
  start_debug = 0;
  start_info = 0;
  bad_end_called = 0;

//  #0;

  // Wait Cycles to End ..
  if ($value$plusargs("wait_cycle_to_kill=%d", wait_cycle_to_kill)) begin // {
     `PR_ALWAYS("arg", `ALWAYS, "Wait Cycles before End set to: %0d\n",
                  wait_cycle_to_kill);
  end // }

  // max errors and warns
  if ($value$plusargs("maxerror=%d", maxerror)) begin // {
     `PR_ALWAYS("arg", `ALWAYS, "maxerror set to: %0d\n",
                  maxerror);
  end // }

  if ($value$plusargs("maxwarning=%d", maxwarning)) begin // {
     `PR_ALWAYS("arg", `ALWAYS, "maxwarning set to: %0d\n",
                  maxwarning);
  end // }

  if ($test$plusargs("debug_all") || $test$plusargs("debug")) begin // {
      debug = 1;
      info = 1;
      quiet = 0;
  end // }

  if ($test$plusargs("info_all") || $test$plusargs("info")) begin //{
      info = 1;
      quiet = 0;
  end //}

  if ($test$plusargs("quiet") && !$test$plusargs("noquiet")) begin //{
      debug = 0;
      info = 0;
      quiet = 1;
  end //}

  // User sets this when Vera wants to do a delayed exit
  // after asm code has finished.
  if ($test$plusargs("no_verilog_finish") || $test$plusargs("noVerilogFinish")) begin // {
      no_verilog_finish = 1;
  end // }

end


initial begin// {
`ifdef PALLADIUM
`elsif AXIS_TL
`else
    #5
`endif
    if ($test$plusargs("show_delta")) begin // {
      if (quiet) `PR_ALWAYS ("arg", `ALWAYS, "Show Delta Enabled, turning off quiet.");
      quiet = 0;
    end // }
end

`ifdef PALLADIUM
`elsif AXIS_TL
`else
//----------------------------------------------------------
// Debug Start
initial begin// {
    if ($value$plusargs ("start_debug=%d", start_debug)) begin // {
        while (start_debug > $time) begin #100 ; end // Wait for start_debug
        `PR_NORMAL("arg", `NORMAL, "Start debug at %d time units", $time) ;
        debug = 1; info = 1; quiet = 0;
        if ($test$plusargs("debug_all")) begin // {
            $ch_dispmon("all", `DEBUG, 1);
        end //}
        // need this?
        if ($test$plusargs ("mon+")) begin // {
        if ($value$plusargs ("mon+%s", arg_str)) begin // {
            $parse_ch_dispmon(arg_str);
        end //}
        end //}
    end //}
end //}

// Info Start
initial begin// {
    if ($value$plusargs ("start_info=%d", start_info)) begin // {
        while (start_info > $time) begin #100 ; end // Wait for start_info
        `PR_NORMAL("arg", `NORMAL, "Start info at %d time units", $time) ;
        info = 1; quiet = 0;
        if ($test$plusargs("info_all")) begin // {
            $ch_dispmon("all", `INFO, 1);
        end //}
        // need this?
        if ($test$plusargs ("mon+")) begin // {
        if ($value$plusargs ("mon+%s", arg_str)) begin // {
            $parse_ch_dispmon(arg_str);
        end //}
        end //}
    end //}
end //}
`endif //PALLADIUM


// normal case is to define BAD_END as bad_end.
`ifdef BAD_END
always @(error_count) if (error_count >= maxerror && !bad_end_called) `BAD_END;
always @(warning_count) if (warning_count >= maxwarning && !bad_end_called) `BAD_END;
`endif

// see dispmonDefines.vh to see why we have these.
// they never return zero which is essential
function [31:0] incErr;
input [31:0] in;

begin
  if ((!(`TOP.dispmon_disable === 1'b1)) || in == 9999) begin
    error_count = error_count + in;
    incErr = error_count;
  end
 else begin
   incErr = 0;
`ifndef AXIS_TL
   `PR_ALWAYS ("top", `ALWAYS, "\n\nDispmon * ERRO R * message was just surpressed by dispmon_disable!!!\n");
   `PR_ALWAYS ("top", `ALWAYS, "dispmon_disable is going away! Must handle message suppression at the source!\n\n\n"); 
`endif
 end  
end
endfunction


function [31:0] incWarn;
input [31:0] in;
begin
  if ((!(`TOP.dispmon_disable === 1'b1)) || in == 9999) begin
    warning_count = warning_count + in;
    incWarn = warning_count;
  end
  else begin
    incWarn = 0;
    `PR_ALWAYS ("top", `ALWAYS, "\n\nDispmon * WARN I N G * message was just surpressed by dispmon_disable!!!\n"); 
    `PR_ALWAYS ("top", `ALWAYS, "dispmon_disable is going away! Must handle message suppression at the source!\n\n\n"); 
  end 
end
endfunction

task set_no_verilog_finish;
begin
  no_verilog_finish = 1; // used in misc_tasks.v
  `PR_ALWAYS ("top", `ALWAYS, "Setting no_verilog_finish, simulation will continue after asm completes!");
end
endtask

