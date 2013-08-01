// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dump.v
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
reg [2047:0] dumpfilename;
integer      limit_dump;
integer      start_dump;
integer      stop_dump;

initial
  begin
    limit_dump = 0;
  end

//----------------------------------------------------------
// Dumpfiles
//   User chooses Debussy or VCD on sims command line
//
`ifndef ALL_DUMP_OFF

`ifndef VCD_OFF
// VCD Dumpfile
// sims does file naming and start/stop for us.
  initial begin
    if ($test$plusargs("vcd")) begin
      `PR_NORMAL("arg", `NORMAL, "VCD dumping enabled");
      if ($test$plusargs("DUMP_ALL")) begin
        $dumpvars;
        `PR_NORMAL("arg", `NORMAL, "VCD dumping w/ DUMP_ALL");
      end
`ifdef FC_BENCH
      else if ($test$plusargs("DUMP_LIMIT")) begin
        `PR_NORMAL("arg", `NORMAL, "VCD dumping w/ DUMP_LIMIT");
        // Limit dumpfile scope (aka modules)
        // (see :/verif/env/<TB>/dump_scope.vh)
        `include "vcd_scope.vh"
      end  
`endif
      else begin
        $dumpvars(99,tb_top);
        `PR_NORMAL("arg", `NORMAL, "VCD dumping tb_top down");
      end

      // sims uses +vcs+dumpon+ / +vcs+dumpoff+ if
      // user uses sims -start_dump/stop_dump              
      if ($test$plusargs("vcs+dumpon")) $dumpoff;
      else $dumpon;
    end
  end
`endif

`ifndef FSDB_OFF
  // Debussy Dumpfile
  initial begin
    if ($test$plusargs("debussy")) begin
      if ($test$plusargs("fsdbfile")) begin
        if ($value$plusargs ("fsdbfile=%s", dumpfilename)) begin
          `PR_NORMAL("arg", `NORMAL, "debussy - filename=%s",dumpfilename);
        end
      end
      else begin
        dumpfilename = "tb_top.fsdb";
        `PR_NORMAL("arg", `NORMAL, "debussy - filename=tb_top.fsdb");
      end


      if (!$test$plusargs("fsdbAutoSwitchDumpfile")) begin
        if ($test$plusargs("fsdbDumplimit"))
        begin
          if ($value$plusargs ("fsdbDumplimit=%d", limit_dump)) 
          begin
            // Minimum limit size is 10 Mbytes (10).
            // Maximum size is 1800 Mbytes on a 32bit machine.
            // Size is in Mbytes only.
            // File will have latest data, *does not stop writing*.
            // Do NOT use this from time zero if the fail is very
            // late in time, use -dump_start=time
            $fsdbDumplimit(limit_dump);
            `PR_NORMAL("arg", `NORMAL, "debussy - dump size limited to %d",limit_dump);
          end
        end // if ($test$plusargs("fsdbDumplimit"))
        $fsdbDumpfile(dumpfilename);
      end

`ifndef AXIS_BUILD
      if ($test$plusargs("fsdbAutoSwitchDumpfile")) begin
        `PR_ERROR("arg", `ERROR, "debussy - fsdbAutoSwitchDumpfile will not work with AXIS");
      end
`endif
`ifndef AXIS_TL
      if ($test$plusargs("fsdbAutoSwitchDumpfile")) begin
        `PR_ERROR("arg", `ERROR, "debussy - fsdbAutoSwitchDumpfile will not work with AXIS");
      end
`endif

`ifndef AXIS_TL
`ifndef AXIS_BUILD
`ifndef AXIS
      // ---> see notes at end of this file... <---
      if ($test$plusargs("fsdbAutoSwitchDumpfile")) begin
        if ($value$plusargs ("fsdbAutoSwitchDumpfile=%d", limit_dump)) 
        begin
          // Minimum limit size is 2 Mbytes (2).
          // Size is in Mbytes only.
          // Once the fsdb file fills up, it will be closed and a new one started.
          // file names will be dumpfilename_000.fsdb, dumpfilename_001.fsdb, ...
          // dumpfilename.log will have the time ranges for each file
          $fsdbAutoSwitchDumpfile(limit_dump, dumpfilename, 10); // only allow 10 fsdb files for now
          `PR_NORMAL("arg", `NORMAL, "debussy - fsdbAutoSwitchDumpfile with dump size limited to %d",limit_dump);
          `PR_NORMAL("arg", `NORMAL, "debussy - Set env var NOVAS_FSDB_ENV_WRITER_MEM_LIMIT to 64 when using fsdbAutoSwitchDumpfile to get smaller files!!!");
        end
      end
`endif
`endif
`endif
      
      // Limit dumpfile scope (aka modules)
      // (see :/verif/env/<TB>/dump_scope.vh)
      `include "dump_scope.vh"

      // sims uses +fsdb+dumpon+ / +fsdb+dumpoff+ if
      // user uses sims -start_dump/stop_dump              
      if ($test$plusargs("fsdb+dumpon")) $fsdbDumpoff;
      else $fsdbDumpon;

`ifdef FC_BENCH
      if ($test$plusargs("fsdb+dumpon") || $test$plusargs("fsdb+dumpoff"))
        `PR_ALWAYS("arg", `ALWAYS, "debussy - sims start/stop_dump must be given in ps!!!\nYou may have to remove the two rightmost digits from the times you see in FC log files!!!");
`endif
    end
  end  // initial

`endif
`endif

/*
 Why is the total FSDB file size bigger when using $fsdbAutoSwitchDumpfile?

The FSDB file grows bigger using fsdbAutoSwitchDumpFile because

   1. The memory limit size is tuned down to 7M by the FSDB writer when
      the $fsdbAutoSwitchDumpfile task is called.
   2. The default memory limit is 64M with other FSDB dumping tasks.
   3. Generally speaking, the bigger memory limit leads to a better compression
      ratio; therefore, the smaller default limit with $fsdbAutoSwitchDumpfile
      causes the FSDB file size to increase.

Consider two different simulation runs where the only change is the
setup call to automatically switch FSDB files or not. For example:

Run 1 used:  $fsdbDumpfile( "myfull_dump.fsdb" );

Run 2 used:  $fsdbAutoSwitchDumpfile(1900, "my_dump.fsdb", 0, "debussyAutoSwitch.log" );

The simulation time was the same in the two runs but the FSDB file
size increased using the $fsdbAutoSwitchDumpfile task. The simulation
results follow:

Run 1:   fsdbDumpfile with default memory buffer of 64 MB

~401 MB (disk size of 401214254 bytes)

 
Run 2:   fsdbAutoSwitchDumpfile with default memory buffer of 7 MB

~637 MB (disk size of 637572720 bytes)


The reason fsdbAutoSwitchDumpfile has a default buffer size of 7 MB is
to have more accurate file sizes.  With the default buffer size the
file size will be +/- ~7 MB.  If the buffer was 64 MB, the file sizes
would be accurate to +/- ~64 MB.

To reduce the total FSDB file size using the system task
$fsdbAutoSwitchDumpfile, please do the following.

a.       Before running the simulation, setenv NOVAS_FSDB_ENV_WRITER_MEM_LIMIT 64
(or to a bigger value)

b.       Run the test case again. 

The simulation results after changing the buffer size follow:

Run 2:   fsdbAutoSwitchDumpfile with NOVAS_FSDB_ENV_WRITER_MEM_LIMIT = 2 MB
~759 MB (disk size of 759143293 bytes)


Run 2:   fsdbAutoSwitchDumpfile with NOVAS_FSDB_ENV_WRITER_MEM_LIMIT = 64 MB
~401 MB (disk size of 401214254 bytes)

From these results, fsdbAutoSwitchDumpfile = fsdbDumpfile if the
buffer is set to 64 MB (maximum compression).  As the buffer size is
decreased, the FSDB file size generated with fsdbAutoSwitchDumpfile
will increase (minimum compression).

*/
