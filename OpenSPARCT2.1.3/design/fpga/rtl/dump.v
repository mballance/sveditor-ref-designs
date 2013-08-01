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

`ifndef ALL_DUMP_OFF

`ifndef VCD_OFF
// VCD Dumpfile
// sims does file naming and start/stop for us.

  initial begin
    if ($test$plusargs("vcd")) begin
      $display("VCD dumping enabled");
      if ($test$plusargs("DUMP_ALL")) begin
      //    $dumpvars(1,t2_fpga);
           $dumpvars(5,t2_fpga.t2.ccx);
           $dumpvars(5,t2_fpga.t2.spc);
           $dumpvars(5,t2_fpga.t2.spc2wbm0);
           $dumpvars(5,t2_fpga.t2.spc2wbm1);
           $dumpvars(5,t2_fpga.t2.spc2wbm_ncu);

        $display("VCD dumping w/ DUMP_ALL");
      end
        else begin
   //     $dumpvars(4,t2_fpga);
           $dumpvars(4,t2_fpga.t2.ccx);
           $dumpvars(4,t2_fpga.t2.spc);
           $dumpvars(4,t2_fpga.t2.spc2wbm0);
           $dumpvars(4,t2_fpga.t2.spc2wbm1);
           $dumpvars(4,t2_fpga.t2.spc2wbm_ncu);
        $display("VCD dumping t2_fpga 4 level down");
      end


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
          $display ("debussy - filename=%s",dumpfilename);
        end
      end
      else begin
        dumpfilename = "t2_fpga.fsdb";
        $display("debussy - filename=t2_fpga.fsdb");
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
            $display ("debussy - dump size limited to %d",limit_dump);
          end
        end // if ($test$plusargs("fsdbDumplimit"))
        $fsdbDumpfile(dumpfilename);
      end
  
      if ($test$plusargs("fsdbAutoSwitchDumpfile")) begin
        if ($value$plusargs ("fsdbAutoSwitchDumpfile=%d", limit_dump))
        begin
          // Minimum limit size is 2 Mbytes (2).
          // Size is in Mbytes only.
          // Once the fsdb file fills up, it will be closed and a new one started.
          // file names will be dumpfilename_000.fsdb, dumpfilename_001.fsdb, ...
          // dumpfilename.log will have the time ranges for each file
          $fsdbAutoSwitchDumpfile(limit_dump, dumpfilename, 10); // only allow 10 fsdb files for now
          $display("Debussy - fsdbAutoSwitchDumpfile with dump size limited to %d",limit_dump);
        end
       end
      else begin  
      $fsdbAutoSwitchDumpfile(500, dumpfilename, 10);
      end
   
      if ($test$plusargs("DUMP_ALL")) begin // {
       // Dump TestBench t2_fpga and items not instantiated in t2_fpga (i.e. 0in)
            $fsdbDumpvars(0,t2_fpga); 
           
       end // }
     else begin // {
    // Dump 3 levels from TestBench t2_fpga
            $fsdbDumpvars(2,t2_fpga); 
            $fsdbDumpvars(3,t2_fpga.t2.ccx);
            $fsdbDumpvars(3,t2_fpga.t2.spc);
            $fsdbDumpvars(3,t2_fpga.t2.spc2wbm0);
            $fsdbDumpvars(3,t2_fpga.t2.spc2wbm1);
            $fsdbDumpvars(3,t2_fpga.t2.spc2wbm_ncu);
     end // }

      if ($test$plusargs("fsdb+dumpon")) $fsdbDumpoff;
      else $fsdbDumpon;

   end
  end //initial

`endif
`endif

