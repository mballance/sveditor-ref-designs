// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dump_scope.vh
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
`ifdef FSDB_OFF
`else
//----------------------------------------------------------
// Conditionally dump modules in the Bench as defined by the User
if ($test$plusargs("DUMP_LIMIT")) begin // {

  //--------------------
  // Conditionally dump verif modules
  if ($test$plusargs("DUMP_ENV")) begin // {
    $fsdbDumpvars(1,tb_top);
    $fsdbDumpvars(0,tb_top.verif_args);
    $fsdbDumpvars(0,tb_top.nas_top);
    $fsdbDumpvars(0,tb_top.tlb_sync);
    $fsdbDumpvars(0,tb_top.ldst_sync);
    $fsdbDumpvars(0,tb_top.int_sync);
    //$fsdbDumpvars(0,tb_top.err_sync);
    //$fsdbDumpvars(0,tb_top.ras);
    //$fsdbDumpvars(0,tb_top.debug);
    //$fsdbDumpvars(0,tb_top.monitors);
  end // }

  //--------------------
  // Conditionally dump verif modules
  if ($test$plusargs("DUMP_CCX")) begin // {
    $fsdbDumpvars(1,tb_top.cpu);
    $fsdbDumpvars(0,tb_top.cpu.ccx);
  end // }


  //--------------------
  // Conditionally dump the cores
  `ifdef CORE_0
  if ($test$plusargs("DUMP_SPC0")) begin // {
    $fsdbDumpvars(0,tb_top.intf0);
    $fsdbDumpvars(0,tb_top.cpu.spc0);
    $fsdbDumpvars(1,tb_top.cpu);
  end // }
  `endif
  `ifdef CORE_1
  if ($test$plusargs("DUMP_SPC1")) begin // {
    $fsdbDumpvars(0,tb_top.intf1);
    $fsdbDumpvars(0,tb_top.cpu.spc1);
    $fsdbDumpvars(1,tb_top.cpu);
  end // }
  `endif
  `ifdef CORE_2
  if ($test$plusargs("DUMP_SPC2")) begin // {
    $fsdbDumpvars(0,tb_top.intf2);
    $fsdbDumpvars(0,tb_top.cpu.spc2);
    $fsdbDumpvars(1,tb_top.cpu);
  end // }
  `endif
  `ifdef CORE_3
  if ($test$plusargs("DUMP_SPC3")) begin // {
    $fsdbDumpvars(0,tb_top.intf3);
    $fsdbDumpvars(0,tb_top.cpu.spc3);
    $fsdbDumpvars(1,tb_top.cpu);
  end // }
  `endif
  `ifdef CORE_4
  if ($test$plusargs("DUMP_SPC4")) begin // {
    $fsdbDumpvars(0,tb_top.intf4);
    $fsdbDumpvars(0,tb_top.cpu.spc4);
    $fsdbDumpvars(1,tb_top.cpu);
  end // }
  `endif
  `ifdef CORE_5
  if ($test$plusargs("DUMP_SPC5")) begin // {
    $fsdbDumpvars(0,tb_top.intf5);
    $fsdbDumpvars(0,tb_top.cpu.spc5);
    $fsdbDumpvars(1,tb_top.cpu);
  end // }
  `endif
  `ifdef CORE_6
  if ($test$plusargs("DUMP_SPC6")) begin // {
    $fsdbDumpvars(0,tb_top.intf6);
    $fsdbDumpvars(0,tb_top.cpu.spc6);
    $fsdbDumpvars(1,tb_top.cpu);
  end // }
  `endif
  `ifdef CORE_7
  if ($test$plusargs("DUMP_SPC7")) begin // {
    $fsdbDumpvars(0,tb_top.intf7);
    $fsdbDumpvars(0,tb_top.cpu.spc7);
    $fsdbDumpvars(1,tb_top.cpu);
  end // }
  `endif

  if ($test$plusargs("DUMP_BNK01")) begin // {
    $fsdbDumpvars(1,tb_top.cpu);
    $fsdbDumpvars(0,tb_top.cpu.l2b0);
    $fsdbDumpvars(0,tb_top.cpu.l2t0);
    $fsdbDumpvars(0,tb_top.cpu.l2d0);
    $fsdbDumpvars(0,tb_top.cpu.l2b1);
    $fsdbDumpvars(0,tb_top.cpu.l2t1);
    $fsdbDumpvars(0,tb_top.cpu.l2d1);
  end // }
  if ($test$plusargs("DUMP_BNK23")) begin // {
    $fsdbDumpvars(1,tb_top.cpu);
    $fsdbDumpvars(0,tb_top.cpu.l2b2);
    $fsdbDumpvars(0,tb_top.cpu.l2t2);
    $fsdbDumpvars(0,tb_top.cpu.l2d2);
    $fsdbDumpvars(0,tb_top.cpu.l2b3);
    $fsdbDumpvars(0,tb_top.cpu.l2t3);
    $fsdbDumpvars(0,tb_top.cpu.l2d3);
  end // }
  if ($test$plusargs("DUMP_BNK45")) begin // {
    $fsdbDumpvars(1,tb_top.cpu);
    $fsdbDumpvars(0,tb_top.cpu.l2b4);
    $fsdbDumpvars(0,tb_top.cpu.l2t4);
    $fsdbDumpvars(0,tb_top.cpu.l2d4);
    $fsdbDumpvars(0,tb_top.cpu.l2b5);
    $fsdbDumpvars(0,tb_top.cpu.l2t5);
    $fsdbDumpvars(0,tb_top.cpu.l2d5);
  end // }
  if ($test$plusargs("DUMP_BNK67")) begin // {
    $fsdbDumpvars(1,tb_top.cpu);
    $fsdbDumpvars(0,tb_top.cpu.l2b6);
    $fsdbDumpvars(0,tb_top.cpu.l2t6);
    $fsdbDumpvars(0,tb_top.cpu.l2d6);
    $fsdbDumpvars(0,tb_top.cpu.l2b7);
    $fsdbDumpvars(0,tb_top.cpu.l2t7);
    $fsdbDumpvars(0,tb_top.cpu.l2d7);
  end // }

end // }

//----------------------------------------------------------
// Default dumpfile scope
else begin // {
  // Dump from TestBench tb_top
  $fsdbDumpvars(0,tb_top);
end // }

//----------------------------------------------------------
if ($test$plusargs("DUMP_ALL")) begin // {
  // Dump TestBench tb_top and items not instantiated in tb_top (i.e. 0in)
  $fsdbDumpvars(0);
end // }

`endif

//----------------------------------------------------------
//----------------------------------------------------------
