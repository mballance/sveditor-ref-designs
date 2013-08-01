// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: cmp_mem.v
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
`ifdef MCUSAT
  `include "mcu_dispmonDefines.vh"
`else
  `include "defines.vh"
  `include "dispmonDefines.vh"
`endif

module cmp_mem ();
  integer handle;
  reg [29:0] data;
  reg [1023:0] file;
  integer 	suc;
  integer	shift;   

`ifdef MCUSAT
`ifdef AXIS_DDR2_MODEL
  task read_dram;
  input reg [63:0] addr;
  output reg [63:0] data;
  input reg [31:0] shift;
  begin
    data = 0;
  end
endtask
`else
  // for vera to call
  task read_dram;
    input reg [63:0] addr;
    output reg [63:0] data;
    input reg [31:0] shift;
    reg [63:0] rd_data_tmp;
    reg [31:0] data_high;
    reg [31:0] data_low;
    begin
      rd_data_tmp = $read_dram(addr, data_low, data_high, shift);
      data = {data_high, data_low};
      //$display("addr=%h, data_high=%h, data_low=%h, data=%h, shift=%d",addr,data_high,data_low, data, shift);
    end
  endtask
`endif
`endif


  task fail;
    input [1023:0] comment;
    begin
      `PR_DEBUG("cmp_mem", `DEBUG, "Simulation -> FAIL(%0s)", comment);
      `TOP_MOD.fail_flag = 1'b1;
      $finish;
    end 
  endtask // fail

  task  check_counter;
    begin
`ifdef RTL_SCTAG
      if(`SCPATH0.mbctl.mb_count_c4 != 0)begin
        `PR_ERROR("cmp_mem", `ERROR, "BANK(0) mb_count_c4 = %d", `SCPATH0.mbctl.mb_count_c4);
        fail("MB counter Not zero");
      end 
      if(`SCPATH1.mbctl.mb_count_c4 != 0)begin
        `PR_ERROR("cmp_mem", `ERROR, "BANK(1) mb_count_c4 = %d", `SCPATH1.mbctl.mb_count_c4);
        fail("MB counter Not zero");
      end 
      if(`SCPATH2.mbctl.mb_count_c4 != 0)begin
        `PR_ERROR("cmp_mem", `ERROR, "BANK(2) mb_count_c4 = %d", `SCPATH2.mbctl.mb_count_c4);
        fail("MB counter Not zero");
      end // if (`SCPATH2.mbctl.mb_count_c4 != 0)
      if(`SCPATH3.mbctl.mb_count_c4 != 0)begin
        `PR_ERROR("cmp_mem", `ERROR, "BANK(3) mb_count_c4 = %d", `SCPATH3.mbctl.mb_count_c4);
        fail("MB counter Not zero");
      end 
      if(`SCPATH0.wbctl.wb_count != 0)begin
        `PR_ERROR("cmp_mem", `ERROR, "BANK(0) wb_count = %d", `SCPATH0.wbctl.wb_count);
        fail("WB counter Not zero");
      end 
      if(`SCPATH1.wbctl.wb_count != 0)begin
        `PR_ERROR("cmp_mem", `ERROR, "BANK(1) wb_count = %d", `SCPATH1.wbctl.wb_count);
        fail("WB counter Not zero");
      end 
      if(`SCPATH2.wbctl.wb_count != 0)begin
        `PR_ERROR("cmp_mem", `ERROR, "BANK(2) wb_count = %d", `SCPATH2.wbctl.wb_count);
        fail("WB counter Not zero");
      end // if (`SCPATH2.mbctl.mb_count_c4 != 0)
      if(`SCPATH3.wbctl.wb_count != 0)begin
        `PR_ERROR("cmp_mem", `ERROR, "BANK(3) wb_count = %d", `SCPATH3.wbctl.wb_count);
        fail("WB counter Not zero");
      end 
      if(`SCPATH0.fbctl.fb_count != 0)begin
        `PR_ERROR("cmp_mem", `ERROR, "BANK(0) fb_count = %d", `SCPATH0.fbctl.fb_count);
        fail("FB counter Not zero");
      end 
      if(`SCPATH1.fbctl.fb_count != 0)begin
        `PR_ERROR("cmp_mem", `ERROR, "BANK(1) fb_count = %d", `SCPATH1.fbctl.fb_count);
        fail("FB counter Not zero");
      end 
      if(`SCPATH2.fbctl.fb_count != 0)begin
        `PR_ERROR("cmp_mem", `ERROR, "BANK(2) fb_count = %d", `SCPATH2.fbctl.fb_count);
        fail("FB counter Not zero");
      end // if (`SCPATH2.mbctl.mb_count_c4 != 0)
      if(`SCPATH3.fbctl.fb_count != 0)begin
        `PR_ERROR("cmp_mem", `ERROR, "BANK(3) fb_count = %d", `SCPATH3.fbctl.fb_count);
        fail("FB counter Not zero");
      end 
`endif // ifdef SCTAG
    end
  endtask // check_counter

  ////////////////////////////////////////
  // Create & Initialize the DIMM Modules
  reg [31:0] dimm_config;
  reg [31:0] ck_mcu0;
  reg [31:0] ck_mcu1;
  reg [31:0] ck_mcu2;
  reg [31:0] ck_mcu3;
  reg [9:0]  mem_dat_load_config;
  reg [31:0] pbank;
  integer i;

reg x8;
initial begin
`ifdef X8
    x8=1'b1;
`else
    x8=1'b0;
`endif
end
   
  initial begin
   dimm_config = 32'h0;

`ifdef RTL_SPARC0
    file  = "mem.image";
`else

    if ($test$plusargs("1_FBDIMM"))		mem_dat_load_config[3:0] = 4'b0001;
    else if ($test$plusargs("2_FBDIMMS"))       mem_dat_load_config[3:0] = 4'b0010;
    else if ($test$plusargs("4_FBDIMMS"))       mem_dat_load_config[3:0] = 4'b0100;
    else if ($test$plusargs("8_FBDIMMS"))       mem_dat_load_config[3:0] = 4'b1000;
    else 					mem_dat_load_config[3:0] = 4'b0001;

    if ($test$plusargs("DIMM_SIZE_256")) 	mem_dat_load_config[7:4] = 4'b0001;
    else if ($test$plusargs("DIMM_SIZE_512"))   mem_dat_load_config[7:4] = 4'b0010;
    else if ($test$plusargs("DIMM_SIZE_1G"))    mem_dat_load_config[7:4] = 4'b0100;
    else if ($test$plusargs("DIMM_SIZE_2G"))    mem_dat_load_config[7:4] = x8 ? 4'b0100 : 4'b1000;
    else					mem_dat_load_config[7:4] = x8 ? 4'b0100 : 4'b1000;    // Default

    if ($test$plusargs("STACK_DIMM"))           mem_dat_load_config[8] = 1;
    else                                        mem_dat_load_config[8] = 0;

    if ($test$plusargs("DUAL_CHANNEL"))         mem_dat_load_config[9] = 4'b1;
    else if ($test$plusargs("SNG_CHANNEL"))     mem_dat_load_config[9] = 4'b0;
    else				   	mem_dat_load_config[9] = 4'b1;         // Default 

    `PR_ALWAYS("cmp_mem", `ALWAYS, "Mem_dat_load_config = %0x", mem_dat_load_config);

 case(mem_dat_load_config) 
   10'b0_0_0001_0001 : file = "sch_1dm_rk1_256Mb_mem.data";
   10'b0_0_0001_0010 : file = "sch_2dm_rk1_256Mb_mem.data";
   10'b0_0_0001_0100 : file = "sch_4dm_rk1_256Mb_mem.data";
   10'b0_0_0001_1000 : file = "sch_8dm_rk1_256Mb_mem.data";
   10'b0_0_0010_0001 : file = "sch_1dm_rk1_512Mb_mem.data";
   10'b0_0_0010_0010 : file = "sch_2dm_rk1_512Mb_mem.data";
   10'b0_0_0010_0100 : file = "sch_4dm_rk1_512Mb_mem.data";
   10'b0_0_0010_1000 : file = "sch_8dm_rk1_512Mb_mem.data";
   10'b0_0_0100_0001 : file = "sch_1dm_rk1_1Gb_mem.data";
   10'b0_0_0100_0010 : file = "sch_2dm_rk1_1Gb_mem.data";
   10'b0_0_0100_0100 : file = "sch_4dm_rk1_1Gb_mem.data";
   10'b0_0_0100_1000 : file = "sch_8dm_rk1_1Gb_mem.data";
   10'b0_0_1000_0001 : file = "sch_1dm_rk1_2Gb_mem.data";
   10'b0_0_1000_0010 : file = "sch_2dm_rk1_2Gb_mem.data";
   10'b0_0_1000_0100 : file = "sch_4dm_rk1_2Gb_mem.data";
   10'b0_0_1000_1000 : file = "sch_8dm_rk1_2Gb_mem.data";
   10'b0_1_0001_0001 : file = "sch_1dm_rk2_256Mb_mem.data";
   10'b0_1_0001_0010 : file = "sch_2dm_rk2_256Mb_mem.data";
   10'b0_1_0001_0100 : file = "sch_4dm_rk2_256Mb_mem.data";
   10'b0_1_0001_1000 : file = "sch_8dm_rk2_256Mb_mem.data";
   10'b0_1_0010_0001 : file = "sch_1dm_rk2_512Mb_mem.data";
   10'b0_1_0010_0010 : file = "sch_2dm_rk2_512Mb_mem.data";
   10'b0_1_0010_0100 : file = "sch_4dm_rk2_512Mb_mem.data";
   10'b0_1_0010_1000 : file = "sch_8dm_rk2_512Mb_mem.data";
   10'b0_1_0100_0001 : file = "sch_1dm_rk2_1Gb_mem.data";
   10'b0_1_0100_0010 : file = "sch_2dm_rk2_1Gb_mem.data";
   10'b0_1_0100_0100 : file = "sch_4dm_rk2_1Gb_mem.data";
   10'b0_1_0100_1000 : file = "sch_8dm_rk2_1Gb_mem.data";
   10'b0_1_1000_0001 : file = "sch_1dm_rk2_2Gb_mem.data";
   10'b0_1_1000_0010 : file = "sch_2dm_rk2_2Gb_mem.data";
   10'b0_1_1000_0100 : file = "sch_4dm_rk2_2Gb_mem.data";
   10'b0_1_1000_1000 : file = "sch_8dm_rk2_2Gb_mem.data";
   10'b1_0_0001_0001 : file = "dch_1dm_rk1_256Mb_mem.data";
   10'b1_0_0001_0010 : file = "dch_2dm_rk1_256Mb_mem.data";
   10'b1_0_0001_0100 : file = "dch_4dm_rk1_256Mb_mem.data";
   10'b1_0_0001_1000 : file = "dch_8dm_rk1_256Mb_mem.data";
   10'b1_0_0010_0001 : file = "dch_1dm_rk1_512Mb_mem.data";
   10'b1_0_0010_0010 : file = "dch_2dm_rk1_512Mb_mem.data";
   10'b1_0_0010_0100 : file = "dch_4dm_rk1_512Mb_mem.data";
   10'b1_0_0010_1000 : file = "dch_8dm_rk1_512Mb_mem.data";
   10'b1_0_0100_0001 : file = "dch_1dm_rk1_1Gb_mem.data";
   10'b1_0_0100_0010 : file = "dch_2dm_rk1_1Gb_mem.data";
   10'b1_0_0100_0100 : file = "dch_4dm_rk1_1Gb_mem.data";
   10'b1_0_0100_1000 : file = "dch_8dm_rk1_1Gb_mem.data";
   10'b1_0_1000_0001 : file = "dch_1dm_rk1_2Gb_mem.data";
   10'b1_0_1000_0010 : file = "dch_2dm_rk1_2Gb_mem.data";
   10'b1_0_1000_0100 : file = "dch_4dm_rk1_2Gb_mem.data";
   10'b1_0_1000_1000 : file = "dch_8dm_rk1_2Gb_mem.data";
   10'b1_1_0001_0001 : file = "dch_1dm_rk2_256Mb_mem.data";
   10'b1_1_0001_0010 : file = "dch_2dm_rk2_256Mb_mem.data";
   10'b1_1_0001_0100 : file = "dch_4dm_rk2_256Mb_mem.data";
   10'b1_1_0001_1000 : file = "dch_8dm_rk2_256Mb_mem.data";
   10'b1_1_0010_0001 : file = "dch_1dm_rk2_512Mb_mem.data";
   10'b1_1_0010_0010 : file = "dch_2dm_rk2_512Mb_mem.data";
   10'b1_1_0010_0100 : file = "dch_4dm_rk2_512Mb_mem.data";
   10'b1_1_0010_1000 : file = "dch_8dm_rk2_512Mb_mem.data";
   10'b1_1_0100_0001 : file = "dch_1dm_rk2_1Gb_mem.data";
   10'b1_1_0100_0010 : file = "dch_2dm_rk2_1Gb_mem.data";
   10'b1_1_0100_0100 : file = "dch_4dm_rk2_1Gb_mem.data";
   10'b1_1_0100_1000 : file = "dch_8dm_rk2_1Gb_mem.data";
   10'b1_1_1000_0001 : file = "dch_1dm_rk2_2Gb_mem.data";
   10'b1_1_1000_0010 : file = "dch_2dm_rk2_2Gb_mem.data";
   10'b1_1_1000_0100 : file = "dch_4dm_rk2_2Gb_mem.data";
   10'b1_1_1000_1000 : file = "dch_8dm_rk2_2Gb_mem.data";
 endcase

 `endif //RTL_SPARC0
 
//`ifdef DRAM_SAT

    if      ($test$plusargs("DIMM_SIZE_2G"))  dimm_config = x8 ? dimm_config | 32'h02 : dimm_config | 32'h03;
    else if ($test$plusargs("DIMM_SIZE_1G"))  dimm_config = dimm_config | 32'h02;
    else if ($test$plusargs("DIMM_SIZE_512")) dimm_config = dimm_config | 32'h01;
    else if ($test$plusargs("DIMM_SIZE_256")) dimm_config = dimm_config | 32'h00;
    else                                      dimm_config = dimm_config | 32'h03; // default 2G


    if      ($test$plusargs("STACK_DIMM")) dimm_config = dimm_config | 32'h1000;
    else if ($test$plusargs("RANK_DIMM"))  dimm_config = dimm_config | 32'h2000;
    else                                   dimm_config = dimm_config | 32'h2000; // default RANK_DIMM

    if      ($test$plusargs("2_FBDIMMS")) dimm_config = dimm_config | 32'h10;
    else if ($test$plusargs("4_FBDIMMS")) dimm_config = dimm_config | 32'h20;
    else if ($test$plusargs("6_FBDIMMS")) dimm_config = dimm_config | 32'h40;
    else if ($test$plusargs("8_FBDIMMS")) dimm_config = dimm_config | 32'h80;
    else                                  dimm_config = dimm_config | 32'h00; // default 1_FBDIMM
	
    if      ($test$plusargs("DUAL_CHANNEL")) dimm_config = dimm_config | 32'h100;
    else if ($test$plusargs("SNG_CHANNEL"))  dimm_config = dimm_config | 32'h200;
    else                                     dimm_config = dimm_config | 32'h100; // default DUAL_CHANNEL

    if      ($test$plusargs("RANK_HIGH")) dimm_config = dimm_config | 32'h400;
    else if ($test$plusargs("RANK_LOW"))  dimm_config = dimm_config | 32'h800;
    else                                  dimm_config = dimm_config | 32'h400; // defualt RANK_HIGH
                                                                   
    if ($value$plusargs("CHIPKILL_MCU0=%d",ck_mcu0)) dimm_config = dimm_config | 32'h10000;
    if ($value$plusargs("CHIPKILL_MCU1=%d",ck_mcu1)) dimm_config = dimm_config | 32'h10000;
    if ($value$plusargs("CHIPKILL_MCU2=%d",ck_mcu2)) dimm_config = dimm_config | 32'h10000;
    if ($value$plusargs("CHIPKILL_MCU3=%d",ck_mcu3)) dimm_config = dimm_config | 32'h10000;


    if      ($test$plusargs("PARTIAL_BANK_4BK")) dimm_config = dimm_config | 32'h40000;
    else if ($test$plusargs("PARTIAL_BANK_2BK")) dimm_config = dimm_config | 32'h20000;
    else                                         dimm_config = dimm_config | 32'h00000;

    if ($value$plusargs("bank_set_mask=%d",pbank))
    begin
        case(pbank)
            4'b0001, 4'b0010, 4'b0100, 4'b1000:  shift = 2;
            4'b0011, 4'b0101, 4'b0110, 4'b1001, 4'b1010, 4'b1100: shift = 1;
        endcase
    end
    else if($test$plusargs("RANDOM_4BANK"))
        shift = 1;
    else if($test$plusargs("RANDOM_2BANK"))
        shift = 2;
    else
        shift = 0;

    // hash PA support for FC only.
    if ($test$plusargs("hash_on")) dimm_config = dimm_config | 32'h100000;

    // X8 support for MCUSAT & FC
    if ($test$plusargs("X8")) dimm_config = dimm_config | 32'h200000;

`ifdef AXIS_DDR2_MODEL
`else
    `define FBD_1
    `ifdef FBDIMM_NUM_2
        `define FBD_2
    `endif
    `ifdef FBDIMM_NUM_4
        `define FBD_2
        `define FBD_4
    `endif
    `ifdef FBDIMM_NUM_6
        `define FBD_2
        `define FBD_4
        `define FBD_6
    `endif
    `ifdef FBDIMM_NUM_8
        `define FBD_2
        `define FBD_4
        `define FBD_6
        `define FBD_8
    `endif

    // FOR STACK_DIMM
    `ifdef STACK_DIMM
        `define DBL_SIDE
    `endif
`endif

    `ifdef FBD_1
     // fbdimm0 OR 1_FBDIMMS

//start1
     `FBD_CH_PATH0.`DIMMPATH0.U00.handle = x8 ? 2*0 : 0;
     `FBD_CH_PATH0.`DIMMPATH0.U01.handle = x8 ? 2*1 : 1;
     `FBD_CH_PATH0.`DIMMPATH0.U02.handle = x8 ? 2*2 : 2;
     `FBD_CH_PATH0.`DIMMPATH0.U03.handle = x8 ? 2*3 : 3;
     `FBD_CH_PATH0.`DIMMPATH0.U05.handle = x8 ? 2*4 : 4;
     `FBD_CH_PATH0.`DIMMPATH0.U06.handle = x8 ? 2*5 : 5;
     `FBD_CH_PATH0.`DIMMPATH0.U07.handle = x8 ? 2*6 : 6;
     `FBD_CH_PATH0.`DIMMPATH0.U08.handle = x8 ? 2*7 : 7;
	
     `ifndef X8	     
     `FBD_CH_PATH0.`DIMMPATH0.U09.handle = 8;
     `FBD_CH_PATH0.`DIMMPATH0.U10.handle = 9;
     `FBD_CH_PATH0.`DIMMPATH0.U11.handle = 10;
     `FBD_CH_PATH0.`DIMMPATH0.U12.handle = 11;
     `FBD_CH_PATH0.`DIMMPATH0.U14.handle = 12;
     `FBD_CH_PATH0.`DIMMPATH0.U15.handle = 13;
     `FBD_CH_PATH0.`DIMMPATH0.U16.handle = 14;
     `FBD_CH_PATH0.`DIMMPATH0.U17.handle = 15;
     `endif
		     
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH1.`DIMMPATH0.U00.handle = x8 ? 2*8 : 16;
     `FBD_CH_PATH1.`DIMMPATH0.U01.handle = x8 ? 2*9 : 17;
     `FBD_CH_PATH1.`DIMMPATH0.U02.handle = x8 ? 2*10 : 18;
     `FBD_CH_PATH1.`DIMMPATH0.U03.handle = x8 ? 2*11 : 19;
     `FBD_CH_PATH1.`DIMMPATH0.U05.handle = x8 ? 2*12 : 20;
     `FBD_CH_PATH1.`DIMMPATH0.U06.handle = x8 ? 2*13 : 21;
     `FBD_CH_PATH1.`DIMMPATH0.U07.handle = x8 ? 2*14 : 22;
     `FBD_CH_PATH1.`DIMMPATH0.U08.handle = x8 ? 2*15 : 23;
		  
     `ifndef X8	     
     `FBD_CH_PATH1.`DIMMPATH0.U09.handle = 24;
     `FBD_CH_PATH1.`DIMMPATH0.U10.handle = 25;
     `FBD_CH_PATH1.`DIMMPATH0.U11.handle = 26;
     `FBD_CH_PATH1.`DIMMPATH0.U12.handle = 27;
     `FBD_CH_PATH1.`DIMMPATH0.U14.handle = 28;
     `FBD_CH_PATH1.`DIMMPATH0.U15.handle = 29;
     `FBD_CH_PATH1.`DIMMPATH0.U16.handle = 30;
     `FBD_CH_PATH1.`DIMMPATH0.U17.handle = 31;
     `endif
     `endif

	
     `FBD_CH_PATH2.`DIMMPATH0.U00.handle = x8 ? 2*16 : 32;
     `FBD_CH_PATH2.`DIMMPATH0.U01.handle = x8 ? 2*17 : 33;
     `FBD_CH_PATH2.`DIMMPATH0.U02.handle = x8 ? 2*18 : 34;
     `FBD_CH_PATH2.`DIMMPATH0.U03.handle = x8 ? 2*19 : 35;
     `FBD_CH_PATH2.`DIMMPATH0.U05.handle = x8 ? 2*20 : 36;
     `FBD_CH_PATH2.`DIMMPATH0.U06.handle = x8 ? 2*21 : 37;
     `FBD_CH_PATH2.`DIMMPATH0.U07.handle = x8 ? 2*22 : 38;
     `FBD_CH_PATH2.`DIMMPATH0.U08.handle = x8 ? 2*23 : 39;
		     
     `ifndef X8	     
     `FBD_CH_PATH2.`DIMMPATH0.U09.handle = 40;
     `FBD_CH_PATH2.`DIMMPATH0.U10.handle = 41;
     `FBD_CH_PATH2.`DIMMPATH0.U11.handle = 42;
     `FBD_CH_PATH2.`DIMMPATH0.U12.handle = 43;
     `FBD_CH_PATH2.`DIMMPATH0.U14.handle = 44;
     `FBD_CH_PATH2.`DIMMPATH0.U15.handle = 45;
     `FBD_CH_PATH2.`DIMMPATH0.U16.handle = 46;
     `FBD_CH_PATH2.`DIMMPATH0.U17.handle = 47;
     `endif
		     
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH3.`DIMMPATH0.U00.handle = x8 ? 2*24 : 48;
     `FBD_CH_PATH3.`DIMMPATH0.U01.handle = x8 ? 2*25 : 49;
     `FBD_CH_PATH3.`DIMMPATH0.U02.handle = x8 ? 2*26 : 50;
     `FBD_CH_PATH3.`DIMMPATH0.U03.handle = x8 ? 2*27 : 51;
     `FBD_CH_PATH3.`DIMMPATH0.U05.handle = x8 ? 2*28 : 52;
     `FBD_CH_PATH3.`DIMMPATH0.U06.handle = x8 ? 2*29 : 53;
     `FBD_CH_PATH3.`DIMMPATH0.U07.handle = x8 ? 2*30 : 54;
     `FBD_CH_PATH3.`DIMMPATH0.U08.handle = x8 ? 2*31 : 55;
		  
     `ifndef X8	     
     `FBD_CH_PATH3.`DIMMPATH0.U09.handle = 56;
     `FBD_CH_PATH3.`DIMMPATH0.U10.handle = 57;
     `FBD_CH_PATH3.`DIMMPATH0.U11.handle = 58;
     `FBD_CH_PATH3.`DIMMPATH0.U12.handle = 59;
     `FBD_CH_PATH3.`DIMMPATH0.U14.handle = 60;
     `FBD_CH_PATH3.`DIMMPATH0.U15.handle = 61;
     `FBD_CH_PATH3.`DIMMPATH0.U16.handle = 62;
     `FBD_CH_PATH3.`DIMMPATH0.U17.handle = 63;
     `endif
     `endif

	
     `FBD_CH_PATH4.`DIMMPATH0.U00.handle = x8 ? 2*32 : 64;
     `FBD_CH_PATH4.`DIMMPATH0.U01.handle = x8 ? 2*33 : 65;
     `FBD_CH_PATH4.`DIMMPATH0.U02.handle = x8 ? 2*34 : 66;
     `FBD_CH_PATH4.`DIMMPATH0.U03.handle = x8 ? 2*35 : 67;
     `FBD_CH_PATH4.`DIMMPATH0.U05.handle = x8 ? 2*36 : 68;
     `FBD_CH_PATH4.`DIMMPATH0.U06.handle = x8 ? 2*37 : 69;
     `FBD_CH_PATH4.`DIMMPATH0.U07.handle = x8 ? 2*38 : 70;
     `FBD_CH_PATH4.`DIMMPATH0.U08.handle = x8 ? 2*39 : 71;
		     
     `ifndef X8	     
     `FBD_CH_PATH4.`DIMMPATH0.U09.handle = 72;
     `FBD_CH_PATH4.`DIMMPATH0.U10.handle = 73;
     `FBD_CH_PATH4.`DIMMPATH0.U11.handle = 74;
     `FBD_CH_PATH4.`DIMMPATH0.U12.handle = 75;
     `FBD_CH_PATH4.`DIMMPATH0.U14.handle = 76;
     `FBD_CH_PATH4.`DIMMPATH0.U15.handle = 77;
     `FBD_CH_PATH4.`DIMMPATH0.U16.handle = 78;
     `FBD_CH_PATH4.`DIMMPATH0.U17.handle = 79;
     `endif
		     
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH5.`DIMMPATH0.U00.handle = x8 ? 2*40 : 80;
     `FBD_CH_PATH5.`DIMMPATH0.U01.handle = x8 ? 2*41 : 81;
     `FBD_CH_PATH5.`DIMMPATH0.U02.handle = x8 ? 2*42 : 82;
     `FBD_CH_PATH5.`DIMMPATH0.U03.handle = x8 ? 2*43 : 83;
     `FBD_CH_PATH5.`DIMMPATH0.U05.handle = x8 ? 2*44 : 84;
     `FBD_CH_PATH5.`DIMMPATH0.U06.handle = x8 ? 2*45 : 85;
     `FBD_CH_PATH5.`DIMMPATH0.U07.handle = x8 ? 2*46 : 86;
     `FBD_CH_PATH5.`DIMMPATH0.U08.handle = x8 ? 2*47 : 87;
		  
     `ifndef X8	     
     `FBD_CH_PATH5.`DIMMPATH0.U09.handle = 88;
     `FBD_CH_PATH5.`DIMMPATH0.U10.handle = 89;
     `FBD_CH_PATH5.`DIMMPATH0.U11.handle = 90;
     `FBD_CH_PATH5.`DIMMPATH0.U12.handle = 91;
     `FBD_CH_PATH5.`DIMMPATH0.U14.handle = 92;
     `FBD_CH_PATH5.`DIMMPATH0.U15.handle = 93;
     `FBD_CH_PATH5.`DIMMPATH0.U16.handle = 94;
     `FBD_CH_PATH5.`DIMMPATH0.U17.handle = 95;
     `endif
     `endif

	
     `FBD_CH_PATH6.`DIMMPATH0.U00.handle = x8 ? 2*48 : 96;
     `FBD_CH_PATH6.`DIMMPATH0.U01.handle = x8 ? 2*49 : 97;
     `FBD_CH_PATH6.`DIMMPATH0.U02.handle = x8 ? 2*50 : 98;
     `FBD_CH_PATH6.`DIMMPATH0.U03.handle = x8 ? 2*51 : 99;
     `FBD_CH_PATH6.`DIMMPATH0.U05.handle = x8 ? 2*52 : 100;
     `FBD_CH_PATH6.`DIMMPATH0.U06.handle = x8 ? 2*53 : 101;
     `FBD_CH_PATH6.`DIMMPATH0.U07.handle = x8 ? 2*54 : 102;
     `FBD_CH_PATH6.`DIMMPATH0.U08.handle = x8 ? 2*55 : 103;
		     
     `ifndef X8	     
     `FBD_CH_PATH6.`DIMMPATH0.U09.handle = 104;
     `FBD_CH_PATH6.`DIMMPATH0.U10.handle = 105;
     `FBD_CH_PATH6.`DIMMPATH0.U11.handle = 106;
     `FBD_CH_PATH6.`DIMMPATH0.U12.handle = 107;
     `FBD_CH_PATH6.`DIMMPATH0.U14.handle = 108;
     `FBD_CH_PATH6.`DIMMPATH0.U15.handle = 109;
     `FBD_CH_PATH6.`DIMMPATH0.U16.handle = 110;
     `FBD_CH_PATH6.`DIMMPATH0.U17.handle = 111;
     `endif
		     
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH7.`DIMMPATH0.U00.handle = x8 ? 2*56 : 112;
     `FBD_CH_PATH7.`DIMMPATH0.U01.handle = x8 ? 2*57 : 113;
     `FBD_CH_PATH7.`DIMMPATH0.U02.handle = x8 ? 2*58 : 114;
     `FBD_CH_PATH7.`DIMMPATH0.U03.handle = x8 ? 2*59 : 115;
     `FBD_CH_PATH7.`DIMMPATH0.U05.handle = x8 ? 2*60 : 116;
     `FBD_CH_PATH7.`DIMMPATH0.U06.handle = x8 ? 2*61 : 117;
     `FBD_CH_PATH7.`DIMMPATH0.U07.handle = x8 ? 2*62 : 118;
     `FBD_CH_PATH7.`DIMMPATH0.U08.handle = x8 ? 2*63 : 119;
     
     `ifndef X8	     
     `FBD_CH_PATH7.`DIMMPATH0.U09.handle = 120;
     `FBD_CH_PATH7.`DIMMPATH0.U10.handle = 121;
     `FBD_CH_PATH7.`DIMMPATH0.U11.handle = 122;
     `FBD_CH_PATH7.`DIMMPATH0.U12.handle = 123;
     `FBD_CH_PATH7.`DIMMPATH0.U14.handle = 124;
     `FBD_CH_PATH7.`DIMMPATH0.U15.handle = 125;
     `FBD_CH_PATH7.`DIMMPATH0.U16.handle = 126;
     `FBD_CH_PATH7.`DIMMPATH0.U17.handle = 127;
     `endif
     `endif

     
     `FBD_CH_PATH0.`DIMMPATH0.U04.handle = x8 ? 2*64 : 128;
     `ifndef X8	     
     `FBD_CH_PATH0.`DIMMPATH0.U13.handle = 129;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH1.`DIMMPATH0.U04.handle = x8 ? 2*65 : 130;
     `ifndef X8	     
     `FBD_CH_PATH1.`DIMMPATH0.U13.handle = 131;
     `endif
     `endif

     `FBD_CH_PATH2.`DIMMPATH0.U04.handle = x8 ? 2*66 : 132;
     `ifndef X8	     
     `FBD_CH_PATH2.`DIMMPATH0.U13.handle = 133;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH3.`DIMMPATH0.U04.handle = x8 ? 2*67 : 134;
     `ifndef X8	     
     `FBD_CH_PATH3.`DIMMPATH0.U13.handle = 135;
     `endif
     `endif

     `FBD_CH_PATH4.`DIMMPATH0.U04.handle = x8 ? 2*68 : 136;
     `ifndef X8	     
     `FBD_CH_PATH4.`DIMMPATH0.U13.handle = 137;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH5.`DIMMPATH0.U04.handle = x8 ? 2*69 : 138;
     `ifndef X8	     
     `FBD_CH_PATH5.`DIMMPATH0.U13.handle = 139;
     `endif
     `endif

     `FBD_CH_PATH6.`DIMMPATH0.U04.handle = x8 ? 2*70 : 140;
     `ifndef X8	     
     `FBD_CH_PATH6.`DIMMPATH0.U13.handle = 141;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH7.`DIMMPATH0.U04.handle = x8 ? 2*71 : 142;
     `ifndef X8	     
     `FBD_CH_PATH7.`DIMMPATH0.U13.handle = 143;
     `endif
     `endif

        `ifdef DBL_SIDE

//start9
             `FBD_CH_PATH0.`RANK_DIMMPATH0.U00.handle = x8 ? 2*576 : 0+1152; 
             `FBD_CH_PATH0.`RANK_DIMMPATH0.U01.handle = x8 ? 2*577 : 1+1152; 
             `FBD_CH_PATH0.`RANK_DIMMPATH0.U02.handle = x8 ? 2*578 : 2+1152; 
             `FBD_CH_PATH0.`RANK_DIMMPATH0.U03.handle = x8 ? 2*579 : 3+1152; 
             `FBD_CH_PATH0.`RANK_DIMMPATH0.U05.handle = x8 ? 2*580 : 4+1152; 
             `FBD_CH_PATH0.`RANK_DIMMPATH0.U06.handle = x8 ? 2*581 : 5+1152; 
             `FBD_CH_PATH0.`RANK_DIMMPATH0.U07.handle = x8 ? 2*582 : 6+1152; 
             `FBD_CH_PATH0.`RANK_DIMMPATH0.U08.handle = x8 ? 2*583 : 7+1152; 
                     
             `ifndef X8	     
             `FBD_CH_PATH0.`RANK_DIMMPATH0.U09.handle = 8+1152; 
             `FBD_CH_PATH0.`RANK_DIMMPATH0.U10.handle = 9+1152; 
             `FBD_CH_PATH0.`RANK_DIMMPATH0.U11.handle = 10+1152; 
             `FBD_CH_PATH0.`RANK_DIMMPATH0.U12.handle = 11+1152; 
             `FBD_CH_PATH0.`RANK_DIMMPATH0.U14.handle = 12+1152; 
             `FBD_CH_PATH0.`RANK_DIMMPATH0.U15.handle = 13+1152; 
             `FBD_CH_PATH0.`RANK_DIMMPATH0.U16.handle = 14+1152; 
             `FBD_CH_PATH0.`RANK_DIMMPATH0.U17.handle = 15+1152; 
             `endif
                     
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH1.`RANK_DIMMPATH0.U00.handle = x8 ? 2*584 : 16+1152; 
             `FBD_CH_PATH1.`RANK_DIMMPATH0.U01.handle = x8 ? 2*585 : 17+1152; 
             `FBD_CH_PATH1.`RANK_DIMMPATH0.U02.handle = x8 ? 2*586 : 18+1152; 
             `FBD_CH_PATH1.`RANK_DIMMPATH0.U03.handle = x8 ? 2*587 : 19+1152; 
             `FBD_CH_PATH1.`RANK_DIMMPATH0.U05.handle = x8 ? 2*588 : 20+1152; 
             `FBD_CH_PATH1.`RANK_DIMMPATH0.U06.handle = x8 ? 2*589 : 21+1152; 
             `FBD_CH_PATH1.`RANK_DIMMPATH0.U07.handle = x8 ? 2*590 : 22+1152; 
             `FBD_CH_PATH1.`RANK_DIMMPATH0.U08.handle = x8 ? 2*591 : 23+1152; 
                  
             `ifndef X8	     
             `FBD_CH_PATH1.`RANK_DIMMPATH0.U09.handle = 24+1152; 
             `FBD_CH_PATH1.`RANK_DIMMPATH0.U10.handle = 25+1152; 
             `FBD_CH_PATH1.`RANK_DIMMPATH0.U11.handle = 26+1152; 
             `FBD_CH_PATH1.`RANK_DIMMPATH0.U12.handle = 27+1152; 
             `FBD_CH_PATH1.`RANK_DIMMPATH0.U14.handle = 28+1152; 
             `FBD_CH_PATH1.`RANK_DIMMPATH0.U15.handle = 29+1152; 
             `FBD_CH_PATH1.`RANK_DIMMPATH0.U16.handle = 30+1152; 
             `FBD_CH_PATH1.`RANK_DIMMPATH0.U17.handle = 31+1152; 
             `endif
             `endif

            
             `FBD_CH_PATH2.`RANK_DIMMPATH0.U00.handle = x8 ? 2*592 : 32+1152; 
             `FBD_CH_PATH2.`RANK_DIMMPATH0.U01.handle = x8 ? 2*593 : 33+1152; 
             `FBD_CH_PATH2.`RANK_DIMMPATH0.U02.handle = x8 ? 2*594 : 34+1152; 
             `FBD_CH_PATH2.`RANK_DIMMPATH0.U03.handle = x8 ? 2*595 : 35+1152; 
             `FBD_CH_PATH2.`RANK_DIMMPATH0.U05.handle = x8 ? 2*596 : 36+1152; 
             `FBD_CH_PATH2.`RANK_DIMMPATH0.U06.handle = x8 ? 2*597 : 37+1152; 
             `FBD_CH_PATH2.`RANK_DIMMPATH0.U07.handle = x8 ? 2*598 : 38+1152; 
             `FBD_CH_PATH2.`RANK_DIMMPATH0.U08.handle = x8 ? 2*599 : 39+1152; 
                     
             `ifndef X8	     
             `FBD_CH_PATH2.`RANK_DIMMPATH0.U09.handle = 40+1152; 
             `FBD_CH_PATH2.`RANK_DIMMPATH0.U10.handle = 41+1152; 
             `FBD_CH_PATH2.`RANK_DIMMPATH0.U11.handle = 42+1152; 
             `FBD_CH_PATH2.`RANK_DIMMPATH0.U12.handle = 43+1152; 
             `FBD_CH_PATH2.`RANK_DIMMPATH0.U14.handle = 44+1152; 
             `FBD_CH_PATH2.`RANK_DIMMPATH0.U15.handle = 45+1152; 
             `FBD_CH_PATH2.`RANK_DIMMPATH0.U16.handle = 46+1152; 
             `FBD_CH_PATH2.`RANK_DIMMPATH0.U17.handle = 47+1152; 
             `endif
                     
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH3.`RANK_DIMMPATH0.U00.handle = x8 ? 2*600 : 48+1152; 
             `FBD_CH_PATH3.`RANK_DIMMPATH0.U01.handle = x8 ? 2*601 : 49+1152; 
             `FBD_CH_PATH3.`RANK_DIMMPATH0.U02.handle = x8 ? 2*602 : 50+1152; 
             `FBD_CH_PATH3.`RANK_DIMMPATH0.U03.handle = x8 ? 2*603 : 51+1152; 
             `FBD_CH_PATH3.`RANK_DIMMPATH0.U05.handle = x8 ? 2*604 : 52+1152; 
             `FBD_CH_PATH3.`RANK_DIMMPATH0.U06.handle = x8 ? 2*605 : 53+1152; 
             `FBD_CH_PATH3.`RANK_DIMMPATH0.U07.handle = x8 ? 2*606 : 54+1152; 
             `FBD_CH_PATH3.`RANK_DIMMPATH0.U08.handle = x8 ? 2*607 : 55+1152; 
                  
             `ifndef X8	     
             `FBD_CH_PATH3.`RANK_DIMMPATH0.U09.handle = 56+1152; 
             `FBD_CH_PATH3.`RANK_DIMMPATH0.U10.handle = 57+1152; 
             `FBD_CH_PATH3.`RANK_DIMMPATH0.U11.handle = 58+1152; 
             `FBD_CH_PATH3.`RANK_DIMMPATH0.U12.handle = 59+1152; 
             `FBD_CH_PATH3.`RANK_DIMMPATH0.U14.handle = 60+1152; 
             `FBD_CH_PATH3.`RANK_DIMMPATH0.U15.handle = 61+1152; 
             `FBD_CH_PATH3.`RANK_DIMMPATH0.U16.handle = 62+1152; 
             `FBD_CH_PATH3.`RANK_DIMMPATH0.U17.handle = 63+1152; 
             `endif
             `endif

            
             `FBD_CH_PATH4.`RANK_DIMMPATH0.U00.handle = x8 ? 2*608 : 64+1152; 
             `FBD_CH_PATH4.`RANK_DIMMPATH0.U01.handle = x8 ? 2*609 : 65+1152; 
             `FBD_CH_PATH4.`RANK_DIMMPATH0.U02.handle = x8 ? 2*610 : 66+1152; 
             `FBD_CH_PATH4.`RANK_DIMMPATH0.U03.handle = x8 ? 2*611 : 67+1152; 
             `FBD_CH_PATH4.`RANK_DIMMPATH0.U05.handle = x8 ? 2*612 : 68+1152; 
             `FBD_CH_PATH4.`RANK_DIMMPATH0.U06.handle = x8 ? 2*613 : 69+1152; 
             `FBD_CH_PATH4.`RANK_DIMMPATH0.U07.handle = x8 ? 2*614 : 70+1152; 
             `FBD_CH_PATH4.`RANK_DIMMPATH0.U08.handle = x8 ? 2*615 : 71+1152; 
                     
             `ifndef X8	     
             `FBD_CH_PATH4.`RANK_DIMMPATH0.U09.handle = 72+1152; 
             `FBD_CH_PATH4.`RANK_DIMMPATH0.U10.handle = 73+1152; 
             `FBD_CH_PATH4.`RANK_DIMMPATH0.U11.handle = 74+1152; 
             `FBD_CH_PATH4.`RANK_DIMMPATH0.U12.handle = 75+1152; 
             `FBD_CH_PATH4.`RANK_DIMMPATH0.U14.handle = 76+1152; 
             `FBD_CH_PATH4.`RANK_DIMMPATH0.U15.handle = 77+1152; 
             `FBD_CH_PATH4.`RANK_DIMMPATH0.U16.handle = 78+1152; 
             `FBD_CH_PATH4.`RANK_DIMMPATH0.U17.handle = 79+1152; 
             `endif
                     
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH5.`RANK_DIMMPATH0.U00.handle = x8 ? 2*616 : 80+1152; 
             `FBD_CH_PATH5.`RANK_DIMMPATH0.U01.handle = x8 ? 2*617 : 81+1152; 
             `FBD_CH_PATH5.`RANK_DIMMPATH0.U02.handle = x8 ? 2*618 : 82+1152; 
             `FBD_CH_PATH5.`RANK_DIMMPATH0.U03.handle = x8 ? 2*619 : 83+1152; 
             `FBD_CH_PATH5.`RANK_DIMMPATH0.U05.handle = x8 ? 2*620 : 84+1152; 
             `FBD_CH_PATH5.`RANK_DIMMPATH0.U06.handle = x8 ? 2*621 : 85+1152; 
             `FBD_CH_PATH5.`RANK_DIMMPATH0.U07.handle = x8 ? 2*622 : 86+1152; 
             `FBD_CH_PATH5.`RANK_DIMMPATH0.U08.handle = x8 ? 2*623 : 87+1152; 
                  
             `ifndef X8	     
             `FBD_CH_PATH5.`RANK_DIMMPATH0.U09.handle = 88+1152; 
             `FBD_CH_PATH5.`RANK_DIMMPATH0.U10.handle = 89+1152; 
             `FBD_CH_PATH5.`RANK_DIMMPATH0.U11.handle = 90+1152; 
             `FBD_CH_PATH5.`RANK_DIMMPATH0.U12.handle = 91+1152; 
             `FBD_CH_PATH5.`RANK_DIMMPATH0.U14.handle = 92+1152; 
             `FBD_CH_PATH5.`RANK_DIMMPATH0.U15.handle = 93+1152; 
             `FBD_CH_PATH5.`RANK_DIMMPATH0.U16.handle = 94+1152; 
             `FBD_CH_PATH5.`RANK_DIMMPATH0.U17.handle = 95+1152; 
             `endif
             `endif

            
             `FBD_CH_PATH6.`RANK_DIMMPATH0.U00.handle = x8 ? 2*624 : 96+1152; 
             `FBD_CH_PATH6.`RANK_DIMMPATH0.U01.handle = x8 ? 2*625 : 97+1152; 
             `FBD_CH_PATH6.`RANK_DIMMPATH0.U02.handle = x8 ? 2*626 : 98+1152; 
             `FBD_CH_PATH6.`RANK_DIMMPATH0.U03.handle = x8 ? 2*627 : 99+1152; 
             `FBD_CH_PATH6.`RANK_DIMMPATH0.U05.handle = x8 ? 2*628 : 100+1152; 
             `FBD_CH_PATH6.`RANK_DIMMPATH0.U06.handle = x8 ? 2*629 : 101+1152; 
             `FBD_CH_PATH6.`RANK_DIMMPATH0.U07.handle = x8 ? 2*630 : 102+1152; 
             `FBD_CH_PATH6.`RANK_DIMMPATH0.U08.handle = x8 ? 2*631 : 103+1152; 
                     
             `ifndef X8	     
             `FBD_CH_PATH6.`RANK_DIMMPATH0.U09.handle = 104+1152; 
             `FBD_CH_PATH6.`RANK_DIMMPATH0.U10.handle = 105+1152; 
             `FBD_CH_PATH6.`RANK_DIMMPATH0.U11.handle = 106+1152; 
             `FBD_CH_PATH6.`RANK_DIMMPATH0.U12.handle = 107+1152; 
             `FBD_CH_PATH6.`RANK_DIMMPATH0.U14.handle = 108+1152; 
             `FBD_CH_PATH6.`RANK_DIMMPATH0.U15.handle = 109+1152; 
             `FBD_CH_PATH6.`RANK_DIMMPATH0.U16.handle = 110+1152; 
             `FBD_CH_PATH6.`RANK_DIMMPATH0.U17.handle = 111+1152; 
             `endif
                     
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH7.`RANK_DIMMPATH0.U00.handle = x8 ? 2*632 : 112+1152; 
             `FBD_CH_PATH7.`RANK_DIMMPATH0.U01.handle = x8 ? 2*633 : 113+1152; 
             `FBD_CH_PATH7.`RANK_DIMMPATH0.U02.handle = x8 ? 2*634 : 114+1152; 
             `FBD_CH_PATH7.`RANK_DIMMPATH0.U03.handle = x8 ? 2*635 : 115+1152; 
             `FBD_CH_PATH7.`RANK_DIMMPATH0.U05.handle = x8 ? 2*636 : 116+1152; 
             `FBD_CH_PATH7.`RANK_DIMMPATH0.U06.handle = x8 ? 2*637 : 117+1152; 
             `FBD_CH_PATH7.`RANK_DIMMPATH0.U07.handle = x8 ? 2*638 : 118+1152; 
             `FBD_CH_PATH7.`RANK_DIMMPATH0.U08.handle = x8 ? 2*639 : 119+1152; 
             
             `ifndef X8	     
             `FBD_CH_PATH7.`RANK_DIMMPATH0.U09.handle = 120+1152; 
             `FBD_CH_PATH7.`RANK_DIMMPATH0.U10.handle = 121+1152; 
             `FBD_CH_PATH7.`RANK_DIMMPATH0.U11.handle = 122+1152; 
             `FBD_CH_PATH7.`RANK_DIMMPATH0.U12.handle = 123+1152; 
             `FBD_CH_PATH7.`RANK_DIMMPATH0.U14.handle = 124+1152; 
             `FBD_CH_PATH7.`RANK_DIMMPATH0.U15.handle = 125+1152; 
             `FBD_CH_PATH7.`RANK_DIMMPATH0.U16.handle = 126+1152; 
             `FBD_CH_PATH7.`RANK_DIMMPATH0.U17.handle = 127+1152; 
             `endif
             `endif

             
             `FBD_CH_PATH0.`RANK_DIMMPATH0.U04.handle = x8 ? 2*640 : 128+1152; 
             `ifndef X8	     
             `FBD_CH_PATH0.`RANK_DIMMPATH0.U13.handle = 129+1152; 
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH1.`RANK_DIMMPATH0.U04.handle = x8 ? 2*641 : 130+1152; 
             `ifndef X8	     
             `FBD_CH_PATH1.`RANK_DIMMPATH0.U13.handle = 131+1152; 
             `endif
             `endif

             `FBD_CH_PATH2.`RANK_DIMMPATH0.U04.handle = x8 ? 2*642 : 132+1152; 
             `ifndef X8	     
             `FBD_CH_PATH2.`RANK_DIMMPATH0.U13.handle = 133+1152; 
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH3.`RANK_DIMMPATH0.U04.handle = x8 ? 2*643 : 134+1152; 
             `ifndef X8	     
             `FBD_CH_PATH3.`RANK_DIMMPATH0.U13.handle = 135+1152; 
             `endif
             `endif
             
             `FBD_CH_PATH4.`RANK_DIMMPATH0.U04.handle = x8 ? 2*644 : 136+1152; 
             `ifndef X8	     
             `FBD_CH_PATH4.`RANK_DIMMPATH0.U13.handle = 137+1152; 
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH5.`RANK_DIMMPATH0.U04.handle = x8 ? 2*645 : 138+1152; 
             `ifndef X8	     
             `FBD_CH_PATH5.`RANK_DIMMPATH0.U13.handle = 139+1152; 
             `endif
             `endif

             `FBD_CH_PATH6.`RANK_DIMMPATH0.U04.handle = x8 ? 2*646 : 140+1152; 
             `ifndef X8	     
             `FBD_CH_PATH6.`RANK_DIMMPATH0.U13.handle = 141+1152; 
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH7.`RANK_DIMMPATH0.U04.handle = x8 ? 2*647 : 142+1152; 
             `ifndef X8	     
             `FBD_CH_PATH7.`RANK_DIMMPATH0.U13.handle = 143+1152; 
             `endif
             `endif

        `endif 

     `endif 

     `ifdef FBD_2
     
//start2
     `FBD_CH_PATH0.`DIMMPATH1.U00.handle = x8 ? 2*72 : 0+144;
     `FBD_CH_PATH0.`DIMMPATH1.U01.handle = x8 ? 2*73 : 1+144;
     `FBD_CH_PATH0.`DIMMPATH1.U02.handle = x8 ? 2*74 : 2+144;
     `FBD_CH_PATH0.`DIMMPATH1.U03.handle = x8 ? 2*75 : 3+144;
     `FBD_CH_PATH0.`DIMMPATH1.U05.handle = x8 ? 2*76 : 4+144;
     `FBD_CH_PATH0.`DIMMPATH1.U06.handle = x8 ? 2*77 : 5+144;
     `FBD_CH_PATH0.`DIMMPATH1.U07.handle = x8 ? 2*78 : 6+144;
     `FBD_CH_PATH0.`DIMMPATH1.U08.handle = x8 ? 2*79 : 7+144;
     `ifndef X8	     
     `FBD_CH_PATH0.`DIMMPATH1.U09.handle = 8+144;
     `FBD_CH_PATH0.`DIMMPATH1.U10.handle = 9+144;
     `FBD_CH_PATH0.`DIMMPATH1.U11.handle = 10+144;
     `FBD_CH_PATH0.`DIMMPATH1.U12.handle = 11+144;
     `FBD_CH_PATH0.`DIMMPATH1.U14.handle = 12+144;
     `FBD_CH_PATH0.`DIMMPATH1.U15.handle = 13+144;
     `FBD_CH_PATH0.`DIMMPATH1.U16.handle = 14+144;
     `FBD_CH_PATH0.`DIMMPATH1.U17.handle = 15+144;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH1.`DIMMPATH1.U00.handle = x8 ? 2*80 : 16+144;
     `FBD_CH_PATH1.`DIMMPATH1.U01.handle = x8 ? 2*81 : 17+144;
     `FBD_CH_PATH1.`DIMMPATH1.U02.handle = x8 ? 2*82 : 18+144;
     `FBD_CH_PATH1.`DIMMPATH1.U03.handle = x8 ? 2*83 : 19+144;
     `FBD_CH_PATH1.`DIMMPATH1.U05.handle = x8 ? 2*84 : 20+144;
     `FBD_CH_PATH1.`DIMMPATH1.U06.handle = x8 ? 2*85 : 21+144;
     `FBD_CH_PATH1.`DIMMPATH1.U07.handle = x8 ? 2*86 : 22+144;
     `FBD_CH_PATH1.`DIMMPATH1.U08.handle = x8 ? 2*87 : 23+144;
     `ifndef X8	     
     `FBD_CH_PATH1.`DIMMPATH1.U09.handle = 24+144;
     `FBD_CH_PATH1.`DIMMPATH1.U10.handle = 25+144;
     `FBD_CH_PATH1.`DIMMPATH1.U11.handle = 26+144;
     `FBD_CH_PATH1.`DIMMPATH1.U12.handle = 27+144;
     `FBD_CH_PATH1.`DIMMPATH1.U14.handle = 28+144;
     `FBD_CH_PATH1.`DIMMPATH1.U15.handle = 29+144;
     `FBD_CH_PATH1.`DIMMPATH1.U16.handle = 30+144;
     `FBD_CH_PATH1.`DIMMPATH1.U17.handle = 31+144;
     `endif
     `endif

     
     `FBD_CH_PATH2.`DIMMPATH1.U00.handle = x8 ? 2*88 : 32+144;
     `FBD_CH_PATH2.`DIMMPATH1.U01.handle = x8 ? 2*89 : 33+144;
     `FBD_CH_PATH2.`DIMMPATH1.U02.handle = x8 ? 2*90 : 34+144;
     `FBD_CH_PATH2.`DIMMPATH1.U03.handle = x8 ? 2*91 : 35+144;
     `FBD_CH_PATH2.`DIMMPATH1.U05.handle = x8 ? 2*92 : 36+144;
     `FBD_CH_PATH2.`DIMMPATH1.U06.handle = x8 ? 2*93 : 37+144;
     `FBD_CH_PATH2.`DIMMPATH1.U07.handle = x8 ? 2*94 : 38+144;
     `FBD_CH_PATH2.`DIMMPATH1.U08.handle = x8 ? 2*95 : 39+144;
     `ifndef X8	     
     `FBD_CH_PATH2.`DIMMPATH1.U09.handle = 40+144;
     `FBD_CH_PATH2.`DIMMPATH1.U10.handle = 41+144;
     `FBD_CH_PATH2.`DIMMPATH1.U11.handle = 42+144;
     `FBD_CH_PATH2.`DIMMPATH1.U12.handle = 43+144;
     `FBD_CH_PATH2.`DIMMPATH1.U14.handle = 44+144;
     `FBD_CH_PATH2.`DIMMPATH1.U15.handle = 45+144;
     `FBD_CH_PATH2.`DIMMPATH1.U16.handle = 46+144;
     `FBD_CH_PATH2.`DIMMPATH1.U17.handle = 47+144;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH3.`DIMMPATH1.U00.handle = x8 ? 2*96 : 48+144;
     `FBD_CH_PATH3.`DIMMPATH1.U01.handle = x8 ? 2*97 : 49+144;
     `FBD_CH_PATH3.`DIMMPATH1.U02.handle = x8 ? 2*98 : 50+144;
     `FBD_CH_PATH3.`DIMMPATH1.U03.handle = x8 ? 2*99 : 51+144;
     `FBD_CH_PATH3.`DIMMPATH1.U05.handle = x8 ? 2*100 : 52+144;
     `FBD_CH_PATH3.`DIMMPATH1.U06.handle = x8 ? 2*101 : 53+144;
     `FBD_CH_PATH3.`DIMMPATH1.U07.handle = x8 ? 2*102 : 54+144;
     `FBD_CH_PATH3.`DIMMPATH1.U08.handle = x8 ? 2*103 : 55+144;
     `ifndef X8	     
     `FBD_CH_PATH3.`DIMMPATH1.U09.handle = 56+144;
     `FBD_CH_PATH3.`DIMMPATH1.U10.handle = 57+144;
     `FBD_CH_PATH3.`DIMMPATH1.U11.handle = 58+144;
     `FBD_CH_PATH3.`DIMMPATH1.U12.handle = 59+144;
     `FBD_CH_PATH3.`DIMMPATH1.U14.handle = 60+144;
     `FBD_CH_PATH3.`DIMMPATH1.U15.handle = 61+144;
     `FBD_CH_PATH3.`DIMMPATH1.U16.handle = 62+144;
     `FBD_CH_PATH3.`DIMMPATH1.U17.handle = 63+144;
     `endif
     `endif


     
     `FBD_CH_PATH4.`DIMMPATH1.U00.handle = x8 ? 2*104 : 64+144;
     `FBD_CH_PATH4.`DIMMPATH1.U01.handle = x8 ? 2*105 : 65+144;
     `FBD_CH_PATH4.`DIMMPATH1.U02.handle = x8 ? 2*106 : 66+144;
     `FBD_CH_PATH4.`DIMMPATH1.U03.handle = x8 ? 2*107 : 67+144;
     `FBD_CH_PATH4.`DIMMPATH1.U05.handle = x8 ? 2*108 : 68+144;
     `FBD_CH_PATH4.`DIMMPATH1.U06.handle = x8 ? 2*109 : 69+144;
     `FBD_CH_PATH4.`DIMMPATH1.U07.handle = x8 ? 2*110 : 70+144;
     `FBD_CH_PATH4.`DIMMPATH1.U08.handle = x8 ? 2*111 : 71+144;
     `ifndef X8	     
     `FBD_CH_PATH4.`DIMMPATH1.U09.handle = 72+144;
     `FBD_CH_PATH4.`DIMMPATH1.U10.handle = 73+144;
     `FBD_CH_PATH4.`DIMMPATH1.U11.handle = 74+144;
     `FBD_CH_PATH4.`DIMMPATH1.U12.handle = 75+144;
     `FBD_CH_PATH4.`DIMMPATH1.U14.handle = 76+144;
     `FBD_CH_PATH4.`DIMMPATH1.U15.handle = 77+144;
     `FBD_CH_PATH4.`DIMMPATH1.U16.handle = 78+144;
     `FBD_CH_PATH4.`DIMMPATH1.U17.handle = 79+144;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH5.`DIMMPATH1.U00.handle = x8 ? 2*112 : 80+144;
     `FBD_CH_PATH5.`DIMMPATH1.U01.handle = x8 ? 2*113 : 81+144;
     `FBD_CH_PATH5.`DIMMPATH1.U02.handle = x8 ? 2*114 : 82+144;
     `FBD_CH_PATH5.`DIMMPATH1.U03.handle = x8 ? 2*115 : 83+144;
     `FBD_CH_PATH5.`DIMMPATH1.U05.handle = x8 ? 2*116 : 84+144;
     `FBD_CH_PATH5.`DIMMPATH1.U06.handle = x8 ? 2*117 : 85+144;
     `FBD_CH_PATH5.`DIMMPATH1.U07.handle = x8 ? 2*118 : 86+144;
     `FBD_CH_PATH5.`DIMMPATH1.U08.handle = x8 ? 2*119 : 87+144;
     `ifndef X8	     
     `FBD_CH_PATH5.`DIMMPATH1.U09.handle = 88+144;
     `FBD_CH_PATH5.`DIMMPATH1.U10.handle = 89+144;
     `FBD_CH_PATH5.`DIMMPATH1.U11.handle = 90+144;
     `FBD_CH_PATH5.`DIMMPATH1.U12.handle = 91+144;
     `FBD_CH_PATH5.`DIMMPATH1.U14.handle = 92+144;
     `FBD_CH_PATH5.`DIMMPATH1.U15.handle = 93+144;
     `FBD_CH_PATH5.`DIMMPATH1.U16.handle = 94+144;
     `FBD_CH_PATH5.`DIMMPATH1.U17.handle = 95+144;
     `endif
     `endif


     
     `FBD_CH_PATH6.`DIMMPATH1.U00.handle = x8 ? 2*120 : 96+144;
     `FBD_CH_PATH6.`DIMMPATH1.U01.handle = x8 ? 2*121 : 97+144;
     `FBD_CH_PATH6.`DIMMPATH1.U02.handle = x8 ? 2*122 : 98+144;
     `FBD_CH_PATH6.`DIMMPATH1.U03.handle = x8 ? 2*123 : 99+144;
     `FBD_CH_PATH6.`DIMMPATH1.U05.handle = x8 ? 2*124 : 100+144;
     `FBD_CH_PATH6.`DIMMPATH1.U06.handle = x8 ? 2*125 : 101+144;
     `FBD_CH_PATH6.`DIMMPATH1.U07.handle = x8 ? 2*126 : 102+144;
     `FBD_CH_PATH6.`DIMMPATH1.U08.handle = x8 ? 2*127 : 103+144;
     `ifndef X8	     
     `FBD_CH_PATH6.`DIMMPATH1.U09.handle = 104+144;
     `FBD_CH_PATH6.`DIMMPATH1.U10.handle = 105+144;
     `FBD_CH_PATH6.`DIMMPATH1.U11.handle = 106+144;
     `FBD_CH_PATH6.`DIMMPATH1.U12.handle = 107+144;
     `FBD_CH_PATH6.`DIMMPATH1.U14.handle = 108+144;
     `FBD_CH_PATH6.`DIMMPATH1.U15.handle = 109+144;
     `FBD_CH_PATH6.`DIMMPATH1.U16.handle = 110+144;
     `FBD_CH_PATH6.`DIMMPATH1.U17.handle = 111+144;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH7.`DIMMPATH1.U00.handle = x8 ? 2*128 : 112+144;
     `FBD_CH_PATH7.`DIMMPATH1.U01.handle = x8 ? 2*129 : 113+144;
     `FBD_CH_PATH7.`DIMMPATH1.U02.handle = x8 ? 2*130 : 114+144;
     `FBD_CH_PATH7.`DIMMPATH1.U03.handle = x8 ? 2*131 : 115+144;
     `FBD_CH_PATH7.`DIMMPATH1.U05.handle = x8 ? 2*132 : 116+144;
     `FBD_CH_PATH7.`DIMMPATH1.U06.handle = x8 ? 2*133 : 117+144;
     `FBD_CH_PATH7.`DIMMPATH1.U07.handle = x8 ? 2*134 : 118+144;
     `FBD_CH_PATH7.`DIMMPATH1.U08.handle = x8 ? 2*135 : 119+144;
     `ifndef X8	     
     `FBD_CH_PATH7.`DIMMPATH1.U09.handle = 120+144;
     `FBD_CH_PATH7.`DIMMPATH1.U10.handle = 121+144;
     `FBD_CH_PATH7.`DIMMPATH1.U11.handle = 122+144;
     `FBD_CH_PATH7.`DIMMPATH1.U12.handle = 123+144;
     `FBD_CH_PATH7.`DIMMPATH1.U14.handle = 124+144;
     `FBD_CH_PATH7.`DIMMPATH1.U15.handle = 125+144;
     `FBD_CH_PATH7.`DIMMPATH1.U16.handle = 126+144;
     `FBD_CH_PATH7.`DIMMPATH1.U17.handle = 127+144;
     `endif
     `endif


     
     `FBD_CH_PATH0.`DIMMPATH1.U04.handle = x8 ? 2*136 : 128+144;
     `ifndef X8	     
     `FBD_CH_PATH0.`DIMMPATH1.U13.handle = 129+144;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH1.`DIMMPATH1.U04.handle = x8 ? 2*137 : 130+144;
     `ifndef X8	     
     `FBD_CH_PATH1.`DIMMPATH1.U13.handle = 131+144;
     `endif
     `endif


     `FBD_CH_PATH2.`DIMMPATH1.U04.handle = x8 ? 2*138 : 132+144;
     `ifndef X8	     
     `FBD_CH_PATH2.`DIMMPATH1.U13.handle = 133+144;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH3.`DIMMPATH1.U04.handle = x8 ? 2*139 : 134+144;
     `ifndef X8	     
     `FBD_CH_PATH3.`DIMMPATH1.U13.handle = 135+144;
     `endif
     `endif


     `FBD_CH_PATH4.`DIMMPATH1.U04.handle = x8 ? 2*140 : 136+144;
     `ifndef X8	     
     `FBD_CH_PATH4.`DIMMPATH1.U13.handle = 137+144;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH5.`DIMMPATH1.U04.handle = x8 ? 2*141 : 138+144;
     `ifndef X8	     
     `FBD_CH_PATH5.`DIMMPATH1.U13.handle = 139+144;
     `endif
     `endif


     `FBD_CH_PATH6.`DIMMPATH1.U04.handle = x8 ? 2*142 : 140+144;
     `ifndef X8	     
     `FBD_CH_PATH6.`DIMMPATH1.U13.handle = 141+144;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH7.`DIMMPATH1.U04.handle = x8 ? 2*143 : 142+144;
     `ifndef X8	     
     `FBD_CH_PATH7.`DIMMPATH1.U13.handle = 143+144;
     `endif
     `endif


        `ifdef DBL_SIDE

//start10
             `FBD_CH_PATH0.`RANK_DIMMPATH1.U00.handle = x8 ? 2*648 : 0+1296;
             `FBD_CH_PATH0.`RANK_DIMMPATH1.U01.handle = x8 ? 2*649 : 1+1296;
             `FBD_CH_PATH0.`RANK_DIMMPATH1.U02.handle = x8 ? 2*650 : 2+1296;
             `FBD_CH_PATH0.`RANK_DIMMPATH1.U03.handle = x8 ? 2*651 : 3+1296;
             `FBD_CH_PATH0.`RANK_DIMMPATH1.U05.handle = x8 ? 2*652 : 4+1296;
             `FBD_CH_PATH0.`RANK_DIMMPATH1.U06.handle = x8 ? 2*653 : 5+1296;
             `FBD_CH_PATH0.`RANK_DIMMPATH1.U07.handle = x8 ? 2*654 : 6+1296;
             `FBD_CH_PATH0.`RANK_DIMMPATH1.U08.handle = x8 ? 2*655 : 7+1296;
             `ifndef X8	     
             `FBD_CH_PATH0.`RANK_DIMMPATH1.U09.handle = 8+1296;
             `FBD_CH_PATH0.`RANK_DIMMPATH1.U10.handle = 9+1296;
             `FBD_CH_PATH0.`RANK_DIMMPATH1.U11.handle = 10+1296;
             `FBD_CH_PATH0.`RANK_DIMMPATH1.U12.handle = 11+1296;
             `FBD_CH_PATH0.`RANK_DIMMPATH1.U14.handle = 12+1296;
             `FBD_CH_PATH0.`RANK_DIMMPATH1.U15.handle = 13+1296;
             `FBD_CH_PATH0.`RANK_DIMMPATH1.U16.handle = 14+1296;
             `FBD_CH_PATH0.`RANK_DIMMPATH1.U17.handle = 15+1296;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH1.`RANK_DIMMPATH1.U00.handle = x8 ? 2*656 : 16+1296;
             `FBD_CH_PATH1.`RANK_DIMMPATH1.U01.handle = x8 ? 2*657 : 17+1296;
             `FBD_CH_PATH1.`RANK_DIMMPATH1.U02.handle = x8 ? 2*658 : 18+1296;
             `FBD_CH_PATH1.`RANK_DIMMPATH1.U03.handle = x8 ? 2*659 : 19+1296;
             `FBD_CH_PATH1.`RANK_DIMMPATH1.U05.handle = x8 ? 2*660 : 20+1296;
             `FBD_CH_PATH1.`RANK_DIMMPATH1.U06.handle = x8 ? 2*661 : 21+1296;
             `FBD_CH_PATH1.`RANK_DIMMPATH1.U07.handle = x8 ? 2*662 : 22+1296;
             `FBD_CH_PATH1.`RANK_DIMMPATH1.U08.handle = x8 ? 2*663 : 23+1296;
             `ifndef X8	     
             `FBD_CH_PATH1.`RANK_DIMMPATH1.U09.handle = 24+1296;
             `FBD_CH_PATH1.`RANK_DIMMPATH1.U10.handle = 25+1296;
             `FBD_CH_PATH1.`RANK_DIMMPATH1.U11.handle = 26+1296;
             `FBD_CH_PATH1.`RANK_DIMMPATH1.U12.handle = 27+1296;
             `FBD_CH_PATH1.`RANK_DIMMPATH1.U14.handle = 28+1296;
             `FBD_CH_PATH1.`RANK_DIMMPATH1.U15.handle = 29+1296;
             `FBD_CH_PATH1.`RANK_DIMMPATH1.U16.handle = 30+1296;
             `FBD_CH_PATH1.`RANK_DIMMPATH1.U17.handle = 31+1296;
             `endif
             `endif


             
             `FBD_CH_PATH2.`RANK_DIMMPATH1.U00.handle = x8 ? 2*664 : 32+1296;
             `FBD_CH_PATH2.`RANK_DIMMPATH1.U01.handle = x8 ? 2*665 : 33+1296;
             `FBD_CH_PATH2.`RANK_DIMMPATH1.U02.handle = x8 ? 2*666 : 34+1296;
             `FBD_CH_PATH2.`RANK_DIMMPATH1.U03.handle = x8 ? 2*667 : 35+1296;
             `FBD_CH_PATH2.`RANK_DIMMPATH1.U05.handle = x8 ? 2*668 : 36+1296;
             `FBD_CH_PATH2.`RANK_DIMMPATH1.U06.handle = x8 ? 2*669 : 37+1296;
             `FBD_CH_PATH2.`RANK_DIMMPATH1.U07.handle = x8 ? 2*670 : 38+1296;
             `FBD_CH_PATH2.`RANK_DIMMPATH1.U08.handle = x8 ? 2*671 : 39+1296;
             `ifndef X8	     
             `FBD_CH_PATH2.`RANK_DIMMPATH1.U09.handle = 40+1296;
             `FBD_CH_PATH2.`RANK_DIMMPATH1.U10.handle = 41+1296;
             `FBD_CH_PATH2.`RANK_DIMMPATH1.U11.handle = 42+1296;
             `FBD_CH_PATH2.`RANK_DIMMPATH1.U12.handle = 43+1296;
             `FBD_CH_PATH2.`RANK_DIMMPATH1.U14.handle = 44+1296;
             `FBD_CH_PATH2.`RANK_DIMMPATH1.U15.handle = 45+1296;
             `FBD_CH_PATH2.`RANK_DIMMPATH1.U16.handle = 46+1296;
             `FBD_CH_PATH2.`RANK_DIMMPATH1.U17.handle = 47+1296;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH3.`RANK_DIMMPATH1.U00.handle = x8 ? 2*672 : 48+1296;
             `FBD_CH_PATH3.`RANK_DIMMPATH1.U01.handle = x8 ? 2*673 : 49+1296;
             `FBD_CH_PATH3.`RANK_DIMMPATH1.U02.handle = x8 ? 2*674 : 50+1296;
             `FBD_CH_PATH3.`RANK_DIMMPATH1.U03.handle = x8 ? 2*675 : 51+1296;
             `FBD_CH_PATH3.`RANK_DIMMPATH1.U05.handle = x8 ? 2*676 : 52+1296;
             `FBD_CH_PATH3.`RANK_DIMMPATH1.U06.handle = x8 ? 2*677 : 53+1296;
             `FBD_CH_PATH3.`RANK_DIMMPATH1.U07.handle = x8 ? 2*678 : 54+1296;
             `FBD_CH_PATH3.`RANK_DIMMPATH1.U08.handle = x8 ? 2*679 : 55+1296;
             `ifndef X8	     
             `FBD_CH_PATH3.`RANK_DIMMPATH1.U09.handle = 56+1296;
             `FBD_CH_PATH3.`RANK_DIMMPATH1.U10.handle = 57+1296;
             `FBD_CH_PATH3.`RANK_DIMMPATH1.U11.handle = 58+1296;
             `FBD_CH_PATH3.`RANK_DIMMPATH1.U12.handle = 59+1296;
             `FBD_CH_PATH3.`RANK_DIMMPATH1.U14.handle = 60+1296;
             `FBD_CH_PATH3.`RANK_DIMMPATH1.U15.handle = 61+1296;
             `FBD_CH_PATH3.`RANK_DIMMPATH1.U16.handle = 62+1296;
             `FBD_CH_PATH3.`RANK_DIMMPATH1.U17.handle = 63+1296;
             `endif
             `endif


             
             `FBD_CH_PATH4.`RANK_DIMMPATH1.U00.handle = x8 ? 2*680 : 64+1296;
             `FBD_CH_PATH4.`RANK_DIMMPATH1.U01.handle = x8 ? 2*681 : 65+1296;
             `FBD_CH_PATH4.`RANK_DIMMPATH1.U02.handle = x8 ? 2*682 : 66+1296;
             `FBD_CH_PATH4.`RANK_DIMMPATH1.U03.handle = x8 ? 2*683 : 67+1296;
             `FBD_CH_PATH4.`RANK_DIMMPATH1.U05.handle = x8 ? 2*684 : 68+1296;
             `FBD_CH_PATH4.`RANK_DIMMPATH1.U06.handle = x8 ? 2*685 : 69+1296;
             `FBD_CH_PATH4.`RANK_DIMMPATH1.U07.handle = x8 ? 2*686 : 70+1296;
             `FBD_CH_PATH4.`RANK_DIMMPATH1.U08.handle = x8 ? 2*687 : 71+1296;
             `ifndef X8	     
             `FBD_CH_PATH4.`RANK_DIMMPATH1.U09.handle = 72+1296;
             `FBD_CH_PATH4.`RANK_DIMMPATH1.U10.handle = 73+1296;
             `FBD_CH_PATH4.`RANK_DIMMPATH1.U11.handle = 74+1296;
             `FBD_CH_PATH4.`RANK_DIMMPATH1.U12.handle = 75+1296;
             `FBD_CH_PATH4.`RANK_DIMMPATH1.U14.handle = 76+1296;
             `FBD_CH_PATH4.`RANK_DIMMPATH1.U15.handle = 77+1296;
             `FBD_CH_PATH4.`RANK_DIMMPATH1.U16.handle = 78+1296;
             `FBD_CH_PATH4.`RANK_DIMMPATH1.U17.handle = 79+1296;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH5.`RANK_DIMMPATH1.U00.handle = x8 ? 2*688 : 80+1296;
             `FBD_CH_PATH5.`RANK_DIMMPATH1.U01.handle = x8 ? 2*689 : 81+1296;
             `FBD_CH_PATH5.`RANK_DIMMPATH1.U02.handle = x8 ? 2*690 : 82+1296;
             `FBD_CH_PATH5.`RANK_DIMMPATH1.U03.handle = x8 ? 2*691 : 83+1296;
             `FBD_CH_PATH5.`RANK_DIMMPATH1.U05.handle = x8 ? 2*692 : 84+1296;
             `FBD_CH_PATH5.`RANK_DIMMPATH1.U06.handle = x8 ? 2*693 : 85+1296;
             `FBD_CH_PATH5.`RANK_DIMMPATH1.U07.handle = x8 ? 2*694 : 86+1296;
             `FBD_CH_PATH5.`RANK_DIMMPATH1.U08.handle = x8 ? 2*695 : 87+1296;
             `ifndef X8	     
             `FBD_CH_PATH5.`RANK_DIMMPATH1.U09.handle = 88+1296;
             `FBD_CH_PATH5.`RANK_DIMMPATH1.U10.handle = 89+1296;
             `FBD_CH_PATH5.`RANK_DIMMPATH1.U11.handle = 90+1296;
             `FBD_CH_PATH5.`RANK_DIMMPATH1.U12.handle = 91+1296;
             `FBD_CH_PATH5.`RANK_DIMMPATH1.U14.handle = 92+1296;
             `FBD_CH_PATH5.`RANK_DIMMPATH1.U15.handle = 93+1296;
             `FBD_CH_PATH5.`RANK_DIMMPATH1.U16.handle = 94+1296;
             `FBD_CH_PATH5.`RANK_DIMMPATH1.U17.handle = 95+1296;
             `endif
             `endif


             
             `FBD_CH_PATH6.`RANK_DIMMPATH1.U00.handle = x8 ? 2*696 : 96+1296;
             `FBD_CH_PATH6.`RANK_DIMMPATH1.U01.handle = x8 ? 2*697 : 97+1296;
             `FBD_CH_PATH6.`RANK_DIMMPATH1.U02.handle = x8 ? 2*698 : 98+1296;
             `FBD_CH_PATH6.`RANK_DIMMPATH1.U03.handle = x8 ? 2*699 : 99+1296;
             `FBD_CH_PATH6.`RANK_DIMMPATH1.U05.handle = x8 ? 2*700 : 100+1296;
             `FBD_CH_PATH6.`RANK_DIMMPATH1.U06.handle = x8 ? 2*701 : 101+1296;
             `FBD_CH_PATH6.`RANK_DIMMPATH1.U07.handle = x8 ? 2*702 : 102+1296;
             `FBD_CH_PATH6.`RANK_DIMMPATH1.U08.handle = x8 ? 2*703 : 103+1296;
             `ifndef X8	     
             `FBD_CH_PATH6.`RANK_DIMMPATH1.U09.handle = 104+1296;
             `FBD_CH_PATH6.`RANK_DIMMPATH1.U10.handle = 105+1296;
             `FBD_CH_PATH6.`RANK_DIMMPATH1.U11.handle = 106+1296;
             `FBD_CH_PATH6.`RANK_DIMMPATH1.U12.handle = 107+1296;
             `FBD_CH_PATH6.`RANK_DIMMPATH1.U14.handle = 108+1296;
             `FBD_CH_PATH6.`RANK_DIMMPATH1.U15.handle = 109+1296;
             `FBD_CH_PATH6.`RANK_DIMMPATH1.U16.handle = 110+1296;
             `FBD_CH_PATH6.`RANK_DIMMPATH1.U17.handle = 111+1296;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH7.`RANK_DIMMPATH1.U00.handle = x8 ? 2*704 : 112+1296;
             `FBD_CH_PATH7.`RANK_DIMMPATH1.U01.handle = x8 ? 2*705 : 113+1296;
             `FBD_CH_PATH7.`RANK_DIMMPATH1.U02.handle = x8 ? 2*706 : 114+1296;
             `FBD_CH_PATH7.`RANK_DIMMPATH1.U03.handle = x8 ? 2*707 : 115+1296;
             `FBD_CH_PATH7.`RANK_DIMMPATH1.U05.handle = x8 ? 2*708 : 116+1296;
             `FBD_CH_PATH7.`RANK_DIMMPATH1.U06.handle = x8 ? 2*709 : 117+1296;
             `FBD_CH_PATH7.`RANK_DIMMPATH1.U07.handle = x8 ? 2*710 : 118+1296;
             `FBD_CH_PATH7.`RANK_DIMMPATH1.U08.handle = x8 ? 2*711 : 119+1296;
             `ifndef X8	     
             `FBD_CH_PATH7.`RANK_DIMMPATH1.U09.handle = 120+1296;
             `FBD_CH_PATH7.`RANK_DIMMPATH1.U10.handle = 121+1296;
             `FBD_CH_PATH7.`RANK_DIMMPATH1.U11.handle = 122+1296;
             `FBD_CH_PATH7.`RANK_DIMMPATH1.U12.handle = 123+1296;
             `FBD_CH_PATH7.`RANK_DIMMPATH1.U14.handle = 124+1296;
             `FBD_CH_PATH7.`RANK_DIMMPATH1.U15.handle = 125+1296;
             `FBD_CH_PATH7.`RANK_DIMMPATH1.U16.handle = 126+1296;
             `FBD_CH_PATH7.`RANK_DIMMPATH1.U17.handle = 127+1296;
             `endif
             `endif


             
             `FBD_CH_PATH0.`RANK_DIMMPATH1.U04.handle = x8 ? 2*712 : 128+1296;
             `ifndef X8	     
             `FBD_CH_PATH0.`RANK_DIMMPATH1.U13.handle = 129+1296;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH1.`RANK_DIMMPATH1.U04.handle = x8 ? 2*713 : 130+1296;
             `ifndef X8	     
             `FBD_CH_PATH1.`RANK_DIMMPATH1.U13.handle = 131+1296;
             `endif
             `endif


             `FBD_CH_PATH2.`RANK_DIMMPATH1.U04.handle = x8 ? 2*714 : 132+1296;
             `ifndef X8	     
             `FBD_CH_PATH2.`RANK_DIMMPATH1.U13.handle = 133+1296;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH3.`RANK_DIMMPATH1.U04.handle = x8 ? 2*715 : 134+1296;
             `ifndef X8	     
             `FBD_CH_PATH3.`RANK_DIMMPATH1.U13.handle = 135+1296;
             `endif
             `endif


             `FBD_CH_PATH4.`RANK_DIMMPATH1.U04.handle = x8 ? 2*716 : 136+1296;
             `ifndef X8	     
             `FBD_CH_PATH4.`RANK_DIMMPATH1.U13.handle = 137+1296;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH5.`RANK_DIMMPATH1.U04.handle = x8 ? 2*717 : 138+1296;
             `ifndef X8	     
             `FBD_CH_PATH5.`RANK_DIMMPATH1.U13.handle = 139+1296;
             `endif
             `endif


             `FBD_CH_PATH6.`RANK_DIMMPATH1.U04.handle = x8 ? 2*718 : 140+1296;
             `ifndef X8	     
             `FBD_CH_PATH6.`RANK_DIMMPATH1.U13.handle = 141+1296;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH7.`RANK_DIMMPATH1.U04.handle = x8 ? 2*719 : 142+1296;
             `ifndef X8	     
             `FBD_CH_PATH7.`RANK_DIMMPATH1.U13.handle = 143+1296;
             `endif
             `endif


        `endif 

     `endif 

     `ifdef FBD_4
     
//start3
     `FBD_CH_PATH0.`DIMMPATH2.U00.handle = x8 ? 2*144 : 0+288;
     `FBD_CH_PATH0.`DIMMPATH2.U01.handle = x8 ? 2*145 : 1+288;
     `FBD_CH_PATH0.`DIMMPATH2.U02.handle = x8 ? 2*146 : 2+288;
     `FBD_CH_PATH0.`DIMMPATH2.U03.handle = x8 ? 2*147 : 3+288;
     `FBD_CH_PATH0.`DIMMPATH2.U05.handle = x8 ? 2*148 : 4+288;
     `FBD_CH_PATH0.`DIMMPATH2.U06.handle = x8 ? 2*149 : 5+288;
     `FBD_CH_PATH0.`DIMMPATH2.U07.handle = x8 ? 2*150 : 6+288;
     `FBD_CH_PATH0.`DIMMPATH2.U08.handle = x8 ? 2*151 : 7+288;
     `ifndef X8	     
     `FBD_CH_PATH0.`DIMMPATH2.U09.handle = 8+288;
     `FBD_CH_PATH0.`DIMMPATH2.U10.handle = 9+288;
     `FBD_CH_PATH0.`DIMMPATH2.U11.handle = 10+288;
     `FBD_CH_PATH0.`DIMMPATH2.U12.handle = 11+288;
     `FBD_CH_PATH0.`DIMMPATH2.U14.handle = 12+288;
     `FBD_CH_PATH0.`DIMMPATH2.U15.handle = 13+288;
     `FBD_CH_PATH0.`DIMMPATH2.U16.handle = 14+288;
     `FBD_CH_PATH0.`DIMMPATH2.U17.handle = 15+288;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH1.`DIMMPATH2.U00.handle = x8 ? 2*152 : 16+288;
     `FBD_CH_PATH1.`DIMMPATH2.U01.handle = x8 ? 2*153 : 17+288;
     `FBD_CH_PATH1.`DIMMPATH2.U02.handle = x8 ? 2*154 : 18+288;
     `FBD_CH_PATH1.`DIMMPATH2.U03.handle = x8 ? 2*155 : 19+288;
     `FBD_CH_PATH1.`DIMMPATH2.U05.handle = x8 ? 2*156 : 20+288;
     `FBD_CH_PATH1.`DIMMPATH2.U06.handle = x8 ? 2*157 : 21+288;
     `FBD_CH_PATH1.`DIMMPATH2.U07.handle = x8 ? 2*158 : 22+288;
     `FBD_CH_PATH1.`DIMMPATH2.U08.handle = x8 ? 2*159 : 23+288;
     `ifndef X8	     
     `FBD_CH_PATH1.`DIMMPATH2.U09.handle = 24+288;
     `FBD_CH_PATH1.`DIMMPATH2.U10.handle = 25+288;
     `FBD_CH_PATH1.`DIMMPATH2.U11.handle = 26+288;
     `FBD_CH_PATH1.`DIMMPATH2.U12.handle = 27+288;
     `FBD_CH_PATH1.`DIMMPATH2.U14.handle = 28+288;
     `FBD_CH_PATH1.`DIMMPATH2.U15.handle = 29+288;
     `FBD_CH_PATH1.`DIMMPATH2.U16.handle = 30+288;
     `FBD_CH_PATH1.`DIMMPATH2.U17.handle = 31+288;
     `endif
     `endif


     
     `FBD_CH_PATH2.`DIMMPATH2.U00.handle = x8 ? 2*160 : 32+288;
     `FBD_CH_PATH2.`DIMMPATH2.U01.handle = x8 ? 2*161 : 33+288;
     `FBD_CH_PATH2.`DIMMPATH2.U02.handle = x8 ? 2*162 : 34+288;
     `FBD_CH_PATH2.`DIMMPATH2.U03.handle = x8 ? 2*163 : 35+288;
     `FBD_CH_PATH2.`DIMMPATH2.U05.handle = x8 ? 2*164 : 36+288;
     `FBD_CH_PATH2.`DIMMPATH2.U06.handle = x8 ? 2*165 : 37+288;
     `FBD_CH_PATH2.`DIMMPATH2.U07.handle = x8 ? 2*166 : 38+288;
     `FBD_CH_PATH2.`DIMMPATH2.U08.handle = x8 ? 2*167 : 39+288;
     `ifndef X8	     
     `FBD_CH_PATH2.`DIMMPATH2.U09.handle = 40+288;
     `FBD_CH_PATH2.`DIMMPATH2.U10.handle = 41+288;
     `FBD_CH_PATH2.`DIMMPATH2.U11.handle = 42+288;
     `FBD_CH_PATH2.`DIMMPATH2.U12.handle = 43+288;
     `FBD_CH_PATH2.`DIMMPATH2.U14.handle = 44+288;
     `FBD_CH_PATH2.`DIMMPATH2.U15.handle = 45+288;
     `FBD_CH_PATH2.`DIMMPATH2.U16.handle = 46+288;
     `FBD_CH_PATH2.`DIMMPATH2.U17.handle = 47+288;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH3.`DIMMPATH2.U00.handle = x8 ? 2*168 : 48+288;
     `FBD_CH_PATH3.`DIMMPATH2.U01.handle = x8 ? 2*169 : 49+288;
     `FBD_CH_PATH3.`DIMMPATH2.U02.handle = x8 ? 2*170 : 50+288;
     `FBD_CH_PATH3.`DIMMPATH2.U03.handle = x8 ? 2*171 : 51+288;
     `FBD_CH_PATH3.`DIMMPATH2.U05.handle = x8 ? 2*172 : 52+288;
     `FBD_CH_PATH3.`DIMMPATH2.U06.handle = x8 ? 2*173 : 53+288;
     `FBD_CH_PATH3.`DIMMPATH2.U07.handle = x8 ? 2*174 : 54+288;
     `FBD_CH_PATH3.`DIMMPATH2.U08.handle = x8 ? 2*175 : 55+288;
     `ifndef X8	     
     `FBD_CH_PATH3.`DIMMPATH2.U09.handle = 56+288;
     `FBD_CH_PATH3.`DIMMPATH2.U10.handle = 57+288;
     `FBD_CH_PATH3.`DIMMPATH2.U11.handle = 58+288;
     `FBD_CH_PATH3.`DIMMPATH2.U12.handle = 59+288;
     `FBD_CH_PATH3.`DIMMPATH2.U14.handle = 60+288;
     `FBD_CH_PATH3.`DIMMPATH2.U15.handle = 61+288;
     `FBD_CH_PATH3.`DIMMPATH2.U16.handle = 62+288;
     `FBD_CH_PATH3.`DIMMPATH2.U17.handle = 63+288;
     `endif
     `endif


     
     `FBD_CH_PATH4.`DIMMPATH2.U00.handle = x8 ? 2*176 : 64+288;
     `FBD_CH_PATH4.`DIMMPATH2.U01.handle = x8 ? 2*177 : 65+288;
     `FBD_CH_PATH4.`DIMMPATH2.U02.handle = x8 ? 2*178 : 66+288;
     `FBD_CH_PATH4.`DIMMPATH2.U03.handle = x8 ? 2*179 : 67+288;
     `FBD_CH_PATH4.`DIMMPATH2.U05.handle = x8 ? 2*180 : 68+288;
     `FBD_CH_PATH4.`DIMMPATH2.U06.handle = x8 ? 2*181 : 69+288;
     `FBD_CH_PATH4.`DIMMPATH2.U07.handle = x8 ? 2*182 : 70+288;
     `FBD_CH_PATH4.`DIMMPATH2.U08.handle = x8 ? 2*183 : 71+288;
     `ifndef X8	     
     `FBD_CH_PATH4.`DIMMPATH2.U09.handle = 72+288;
     `FBD_CH_PATH4.`DIMMPATH2.U10.handle = 73+288;
     `FBD_CH_PATH4.`DIMMPATH2.U11.handle = 74+288;
     `FBD_CH_PATH4.`DIMMPATH2.U12.handle = 75+288;
     `FBD_CH_PATH4.`DIMMPATH2.U14.handle = 76+288;
     `FBD_CH_PATH4.`DIMMPATH2.U15.handle = 77+288;
     `FBD_CH_PATH4.`DIMMPATH2.U16.handle = 78+288;
     `FBD_CH_PATH4.`DIMMPATH2.U17.handle = 79+288;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH5.`DIMMPATH2.U00.handle = x8 ? 2*184 : 80+288;
     `FBD_CH_PATH5.`DIMMPATH2.U01.handle = x8 ? 2*185 : 81+288;
     `FBD_CH_PATH5.`DIMMPATH2.U02.handle = x8 ? 2*186 : 82+288;
     `FBD_CH_PATH5.`DIMMPATH2.U03.handle = x8 ? 2*187 : 83+288;
     `FBD_CH_PATH5.`DIMMPATH2.U05.handle = x8 ? 2*188 : 84+288;
     `FBD_CH_PATH5.`DIMMPATH2.U06.handle = x8 ? 2*189 : 85+288;
     `FBD_CH_PATH5.`DIMMPATH2.U07.handle = x8 ? 2*190 : 86+288;
     `FBD_CH_PATH5.`DIMMPATH2.U08.handle = x8 ? 2*191 : 87+288;
     `ifndef X8	     
     `FBD_CH_PATH5.`DIMMPATH2.U09.handle = 88+288;
     `FBD_CH_PATH5.`DIMMPATH2.U10.handle = 89+288;
     `FBD_CH_PATH5.`DIMMPATH2.U11.handle = 90+288;
     `FBD_CH_PATH5.`DIMMPATH2.U12.handle = 91+288;
     `FBD_CH_PATH5.`DIMMPATH2.U14.handle = 92+288;
     `FBD_CH_PATH5.`DIMMPATH2.U15.handle = 93+288;
     `FBD_CH_PATH5.`DIMMPATH2.U16.handle = 94+288;
     `FBD_CH_PATH5.`DIMMPATH2.U17.handle = 95+288;
     `endif
     `endif


     
     `FBD_CH_PATH6.`DIMMPATH2.U00.handle = x8 ? 2*192 : 96+288;
     `FBD_CH_PATH6.`DIMMPATH2.U01.handle = x8 ? 2*193 : 97+288;
     `FBD_CH_PATH6.`DIMMPATH2.U02.handle = x8 ? 2*194 : 98+288;
     `FBD_CH_PATH6.`DIMMPATH2.U03.handle = x8 ? 2*195 : 99+288;
     `FBD_CH_PATH6.`DIMMPATH2.U05.handle = x8 ? 2*196 : 100+288;
     `FBD_CH_PATH6.`DIMMPATH2.U06.handle = x8 ? 2*197 : 101+288;
     `FBD_CH_PATH6.`DIMMPATH2.U07.handle = x8 ? 2*198 : 102+288;
     `FBD_CH_PATH6.`DIMMPATH2.U08.handle = x8 ? 2*199 : 103+288;
     `ifndef X8	     
     `FBD_CH_PATH6.`DIMMPATH2.U09.handle = 104+288;
     `FBD_CH_PATH6.`DIMMPATH2.U10.handle = 105+288;
     `FBD_CH_PATH6.`DIMMPATH2.U11.handle = 106+288;
     `FBD_CH_PATH6.`DIMMPATH2.U12.handle = 107+288;
     `FBD_CH_PATH6.`DIMMPATH2.U14.handle = 108+288;
     `FBD_CH_PATH6.`DIMMPATH2.U15.handle = 109+288;
     `FBD_CH_PATH6.`DIMMPATH2.U16.handle = 110+288;
     `FBD_CH_PATH6.`DIMMPATH2.U17.handle = 111+288;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH7.`DIMMPATH2.U00.handle = x8 ? 2*200 : 112+288;
     `FBD_CH_PATH7.`DIMMPATH2.U01.handle = x8 ? 2*201 : 113+288;
     `FBD_CH_PATH7.`DIMMPATH2.U02.handle = x8 ? 2*202 : 114+288;
     `FBD_CH_PATH7.`DIMMPATH2.U03.handle = x8 ? 2*203 : 115+288;
     `FBD_CH_PATH7.`DIMMPATH2.U05.handle = x8 ? 2*204 : 116+288;
     `FBD_CH_PATH7.`DIMMPATH2.U06.handle = x8 ? 2*205 : 117+288;
     `FBD_CH_PATH7.`DIMMPATH2.U07.handle = x8 ? 2*206 : 118+288;
     `FBD_CH_PATH7.`DIMMPATH2.U08.handle = x8 ? 2*207 : 119+288;
     `ifndef X8	     
     `FBD_CH_PATH7.`DIMMPATH2.U09.handle = 120+288;
     `FBD_CH_PATH7.`DIMMPATH2.U10.handle = 121+288;
     `FBD_CH_PATH7.`DIMMPATH2.U11.handle = 122+288;
     `FBD_CH_PATH7.`DIMMPATH2.U12.handle = 123+288;
     `FBD_CH_PATH7.`DIMMPATH2.U14.handle = 124+288;
     `FBD_CH_PATH7.`DIMMPATH2.U15.handle = 125+288;
     `FBD_CH_PATH7.`DIMMPATH2.U16.handle = 126+288;
     `FBD_CH_PATH7.`DIMMPATH2.U17.handle = 127+288;
     `endif
     `endif


     
     `FBD_CH_PATH0.`DIMMPATH2.U04.handle = x8 ? 2*208 : 128+288;
     `ifndef X8	     
     `FBD_CH_PATH0.`DIMMPATH2.U13.handle = 129+288;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH1.`DIMMPATH2.U04.handle = x8 ? 2*209 : 130+288;
     `ifndef X8	     
     `FBD_CH_PATH1.`DIMMPATH2.U13.handle = 131+288;
     `endif
     `endif


     `FBD_CH_PATH2.`DIMMPATH2.U04.handle = x8 ? 2*210 : 132+288;
     `ifndef X8	     
     `FBD_CH_PATH2.`DIMMPATH2.U13.handle = 133+288;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH3.`DIMMPATH2.U04.handle = x8 ? 2*211 : 134+288;
     `ifndef X8	     
     `FBD_CH_PATH3.`DIMMPATH2.U13.handle = 135+288;
     `endif
     `endif


     `FBD_CH_PATH4.`DIMMPATH2.U04.handle = x8 ? 2*212 : 136+288;
     `ifndef X8	     
     `FBD_CH_PATH4.`DIMMPATH2.U13.handle = 137+288;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH5.`DIMMPATH2.U04.handle = x8 ? 2*213 : 138+288;
     `ifndef X8	     
     `FBD_CH_PATH5.`DIMMPATH2.U13.handle = 139+288;
     `endif
     `endif


     `FBD_CH_PATH6.`DIMMPATH2.U04.handle = x8 ? 2*214 : 140+288;
     `ifndef X8	     
     `FBD_CH_PATH6.`DIMMPATH2.U13.handle = 141+288;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH7.`DIMMPATH2.U04.handle = x8 ? 2*215 : 142+288;
     `ifndef X8	     
     `FBD_CH_PATH7.`DIMMPATH2.U13.handle = 143+288;
     `endif
     `endif



//start4     
     `FBD_CH_PATH0.`DIMMPATH3.U00.handle = x8 ? 2*216 : 0+432;
     `FBD_CH_PATH0.`DIMMPATH3.U01.handle = x8 ? 2*217 : 1+432;
     `FBD_CH_PATH0.`DIMMPATH3.U02.handle = x8 ? 2*218 : 2+432;
     `FBD_CH_PATH0.`DIMMPATH3.U03.handle = x8 ? 2*219 : 3+432;
     `FBD_CH_PATH0.`DIMMPATH3.U05.handle = x8 ? 2*220 : 4+432;
     `FBD_CH_PATH0.`DIMMPATH3.U06.handle = x8 ? 2*221 : 5+432;
     `FBD_CH_PATH0.`DIMMPATH3.U07.handle = x8 ? 2*222 : 6+432;
     `FBD_CH_PATH0.`DIMMPATH3.U08.handle = x8 ? 2*223 : 7+432;
     `ifndef X8	     
     `FBD_CH_PATH0.`DIMMPATH3.U09.handle = 8+432;
     `FBD_CH_PATH0.`DIMMPATH3.U10.handle = 9+432;
     `FBD_CH_PATH0.`DIMMPATH3.U11.handle = 10+432;
     `FBD_CH_PATH0.`DIMMPATH3.U12.handle = 11+432;
     `FBD_CH_PATH0.`DIMMPATH3.U14.handle = 12+432;
     `FBD_CH_PATH0.`DIMMPATH3.U15.handle = 13+432;
     `FBD_CH_PATH0.`DIMMPATH3.U16.handle = 14+432;
     `FBD_CH_PATH0.`DIMMPATH3.U17.handle = 15+432;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH1.`DIMMPATH3.U00.handle = x8 ? 2*224 : 16+432;
     `FBD_CH_PATH1.`DIMMPATH3.U01.handle = x8 ? 2*225 : 17+432;
     `FBD_CH_PATH1.`DIMMPATH3.U02.handle = x8 ? 2*226 : 18+432;
     `FBD_CH_PATH1.`DIMMPATH3.U03.handle = x8 ? 2*227 : 19+432;
     `FBD_CH_PATH1.`DIMMPATH3.U05.handle = x8 ? 2*228 : 20+432;
     `FBD_CH_PATH1.`DIMMPATH3.U06.handle = x8 ? 2*229 : 21+432;
     `FBD_CH_PATH1.`DIMMPATH3.U07.handle = x8 ? 2*230 : 22+432;
     `FBD_CH_PATH1.`DIMMPATH3.U08.handle = x8 ? 2*231 : 23+432;
     `ifndef X8	     
     `FBD_CH_PATH1.`DIMMPATH3.U09.handle = 24+432;
     `FBD_CH_PATH1.`DIMMPATH3.U10.handle = 25+432;
     `FBD_CH_PATH1.`DIMMPATH3.U11.handle = 26+432;
     `FBD_CH_PATH1.`DIMMPATH3.U12.handle = 27+432;
     `FBD_CH_PATH1.`DIMMPATH3.U14.handle = 28+432;
     `FBD_CH_PATH1.`DIMMPATH3.U15.handle = 29+432;
     `FBD_CH_PATH1.`DIMMPATH3.U16.handle = 30+432;
     `FBD_CH_PATH1.`DIMMPATH3.U17.handle = 31+432;
     `endif
     `endif


     
     `FBD_CH_PATH2.`DIMMPATH3.U00.handle = x8 ? 2*232 : 32+432;
     `FBD_CH_PATH2.`DIMMPATH3.U01.handle = x8 ? 2*233 : 33+432;
     `FBD_CH_PATH2.`DIMMPATH3.U02.handle = x8 ? 2*234 : 34+432;
     `FBD_CH_PATH2.`DIMMPATH3.U03.handle = x8 ? 2*235 : 35+432;
     `FBD_CH_PATH2.`DIMMPATH3.U05.handle = x8 ? 2*236 : 36+432;
     `FBD_CH_PATH2.`DIMMPATH3.U06.handle = x8 ? 2*237 : 37+432;
     `FBD_CH_PATH2.`DIMMPATH3.U07.handle = x8 ? 2*238 : 38+432;
     `FBD_CH_PATH2.`DIMMPATH3.U08.handle = x8 ? 2*239 : 39+432;
     `ifndef X8	     
     `FBD_CH_PATH2.`DIMMPATH3.U09.handle = 40+432;
     `FBD_CH_PATH2.`DIMMPATH3.U10.handle = 41+432;
     `FBD_CH_PATH2.`DIMMPATH3.U11.handle = 42+432;
     `FBD_CH_PATH2.`DIMMPATH3.U12.handle = 43+432;
     `FBD_CH_PATH2.`DIMMPATH3.U14.handle = 44+432;
     `FBD_CH_PATH2.`DIMMPATH3.U15.handle = 45+432;
     `FBD_CH_PATH2.`DIMMPATH3.U16.handle = 46+432;
     `FBD_CH_PATH2.`DIMMPATH3.U17.handle = 47+432;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH3.`DIMMPATH3.U00.handle = x8 ? 2*240 : 48+432;
     `FBD_CH_PATH3.`DIMMPATH3.U01.handle = x8 ? 2*241 : 49+432;
     `FBD_CH_PATH3.`DIMMPATH3.U02.handle = x8 ? 2*242 : 50+432;
     `FBD_CH_PATH3.`DIMMPATH3.U03.handle = x8 ? 2*243 : 51+432;
     `FBD_CH_PATH3.`DIMMPATH3.U05.handle = x8 ? 2*244 : 52+432;
     `FBD_CH_PATH3.`DIMMPATH3.U06.handle = x8 ? 2*245 : 53+432;
     `FBD_CH_PATH3.`DIMMPATH3.U07.handle = x8 ? 2*246 : 54+432;
     `FBD_CH_PATH3.`DIMMPATH3.U08.handle = x8 ? 2*247 : 55+432;
     `ifndef X8	     
     `FBD_CH_PATH3.`DIMMPATH3.U09.handle = 56+432;
     `FBD_CH_PATH3.`DIMMPATH3.U10.handle = 57+432;
     `FBD_CH_PATH3.`DIMMPATH3.U11.handle = 58+432;
     `FBD_CH_PATH3.`DIMMPATH3.U12.handle = 59+432;
     `FBD_CH_PATH3.`DIMMPATH3.U14.handle = 60+432;
     `FBD_CH_PATH3.`DIMMPATH3.U15.handle = 61+432;
     `FBD_CH_PATH3.`DIMMPATH3.U16.handle = 62+432;
     `FBD_CH_PATH3.`DIMMPATH3.U17.handle = 63+432;
     `endif
     `endif


     
     `FBD_CH_PATH4.`DIMMPATH3.U00.handle = x8 ? 2*248 : 64+432;
     `FBD_CH_PATH4.`DIMMPATH3.U01.handle = x8 ? 2*249 : 65+432;
     `FBD_CH_PATH4.`DIMMPATH3.U02.handle = x8 ? 2*250 : 66+432;
     `FBD_CH_PATH4.`DIMMPATH3.U03.handle = x8 ? 2*251 : 67+432;
     `FBD_CH_PATH4.`DIMMPATH3.U05.handle = x8 ? 2*252 : 68+432;
     `FBD_CH_PATH4.`DIMMPATH3.U06.handle = x8 ? 2*253 : 69+432;
     `FBD_CH_PATH4.`DIMMPATH3.U07.handle = x8 ? 2*254 : 70+432;
     `FBD_CH_PATH4.`DIMMPATH3.U08.handle = x8 ? 2*255 : 71+432;
     `ifndef X8	     
     `FBD_CH_PATH4.`DIMMPATH3.U09.handle = 72+432;
     `FBD_CH_PATH4.`DIMMPATH3.U10.handle = 73+432;
     `FBD_CH_PATH4.`DIMMPATH3.U11.handle = 74+432;
     `FBD_CH_PATH4.`DIMMPATH3.U12.handle = 75+432;
     `FBD_CH_PATH4.`DIMMPATH3.U14.handle = 76+432;
     `FBD_CH_PATH4.`DIMMPATH3.U15.handle = 77+432;
     `FBD_CH_PATH4.`DIMMPATH3.U16.handle = 78+432;
     `FBD_CH_PATH4.`DIMMPATH3.U17.handle = 79+432;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH5.`DIMMPATH3.U00.handle = x8 ? 2*256 : 80+432;
     `FBD_CH_PATH5.`DIMMPATH3.U01.handle = x8 ? 2*257 : 81+432;
     `FBD_CH_PATH5.`DIMMPATH3.U02.handle = x8 ? 2*258 : 82+432;
     `FBD_CH_PATH5.`DIMMPATH3.U03.handle = x8 ? 2*259 : 83+432;
     `FBD_CH_PATH5.`DIMMPATH3.U05.handle = x8 ? 2*260 : 84+432;
     `FBD_CH_PATH5.`DIMMPATH3.U06.handle = x8 ? 2*261 : 85+432;
     `FBD_CH_PATH5.`DIMMPATH3.U07.handle = x8 ? 2*262 : 86+432;
     `FBD_CH_PATH5.`DIMMPATH3.U08.handle = x8 ? 2*263 : 87+432;
     `ifndef X8	     
     `FBD_CH_PATH5.`DIMMPATH3.U09.handle = 88+432;
     `FBD_CH_PATH5.`DIMMPATH3.U10.handle = 89+432;
     `FBD_CH_PATH5.`DIMMPATH3.U11.handle = 90+432;
     `FBD_CH_PATH5.`DIMMPATH3.U12.handle = 91+432;
     `FBD_CH_PATH5.`DIMMPATH3.U14.handle = 92+432;
     `FBD_CH_PATH5.`DIMMPATH3.U15.handle = 93+432;
     `FBD_CH_PATH5.`DIMMPATH3.U16.handle = 94+432;
     `FBD_CH_PATH5.`DIMMPATH3.U17.handle = 95+432;
     `endif
     `endif


     
     `FBD_CH_PATH6.`DIMMPATH3.U00.handle = x8 ? 2*264 : 96+432;
     `FBD_CH_PATH6.`DIMMPATH3.U01.handle = x8 ? 2*265 : 97+432;
     `FBD_CH_PATH6.`DIMMPATH3.U02.handle = x8 ? 2*266 : 98+432;
     `FBD_CH_PATH6.`DIMMPATH3.U03.handle = x8 ? 2*267 : 99+432;
     `FBD_CH_PATH6.`DIMMPATH3.U05.handle = x8 ? 2*268 : 100+432;
     `FBD_CH_PATH6.`DIMMPATH3.U06.handle = x8 ? 2*269 : 101+432;
     `FBD_CH_PATH6.`DIMMPATH3.U07.handle = x8 ? 2*270 : 102+432;
     `FBD_CH_PATH6.`DIMMPATH3.U08.handle = x8 ? 2*271 : 103+432;
     `ifndef X8	     
     `FBD_CH_PATH6.`DIMMPATH3.U09.handle = 104+432;
     `FBD_CH_PATH6.`DIMMPATH3.U10.handle = 105+432;
     `FBD_CH_PATH6.`DIMMPATH3.U11.handle = 106+432;
     `FBD_CH_PATH6.`DIMMPATH3.U12.handle = 107+432;
     `FBD_CH_PATH6.`DIMMPATH3.U14.handle = 108+432;
     `FBD_CH_PATH6.`DIMMPATH3.U15.handle = 109+432;
     `FBD_CH_PATH6.`DIMMPATH3.U16.handle = 110+432;
     `FBD_CH_PATH6.`DIMMPATH3.U17.handle = 111+432;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH7.`DIMMPATH3.U00.handle = x8 ? 2*272 : 112+432;
     `FBD_CH_PATH7.`DIMMPATH3.U01.handle = x8 ? 2*273 : 113+432;
     `FBD_CH_PATH7.`DIMMPATH3.U02.handle = x8 ? 2*274 : 114+432;
     `FBD_CH_PATH7.`DIMMPATH3.U03.handle = x8 ? 2*275 : 115+432;
     `FBD_CH_PATH7.`DIMMPATH3.U05.handle = x8 ? 2*276 : 116+432;
     `FBD_CH_PATH7.`DIMMPATH3.U06.handle = x8 ? 2*277 : 117+432;
     `FBD_CH_PATH7.`DIMMPATH3.U07.handle = x8 ? 2*278 : 118+432;
     `FBD_CH_PATH7.`DIMMPATH3.U08.handle = x8 ? 2*279 : 119+432;
     `ifndef X8	     
     `FBD_CH_PATH7.`DIMMPATH3.U09.handle = 120+432;
     `FBD_CH_PATH7.`DIMMPATH3.U10.handle = 121+432;
     `FBD_CH_PATH7.`DIMMPATH3.U11.handle = 122+432;
     `FBD_CH_PATH7.`DIMMPATH3.U12.handle = 123+432;
     `FBD_CH_PATH7.`DIMMPATH3.U14.handle = 124+432;
     `FBD_CH_PATH7.`DIMMPATH3.U15.handle = 125+432;
     `FBD_CH_PATH7.`DIMMPATH3.U16.handle = 126+432;
     `FBD_CH_PATH7.`DIMMPATH3.U17.handle = 127+432;
     `endif
     `endif


     
     `FBD_CH_PATH0.`DIMMPATH3.U04.handle = x8 ? 2*280 : 128+432;
     `ifndef X8	     
     `FBD_CH_PATH0.`DIMMPATH3.U13.handle = 129+432;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH1.`DIMMPATH3.U04.handle = x8 ? 2*281 : 130+432;
     `ifndef X8	     
     `FBD_CH_PATH1.`DIMMPATH3.U13.handle = 131+432;
     `endif
     `endif


     `FBD_CH_PATH2.`DIMMPATH3.U04.handle = x8 ? 2*282 : 132+432;
     `ifndef X8	     
     `FBD_CH_PATH2.`DIMMPATH3.U13.handle = 133+432;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH3.`DIMMPATH3.U04.handle = x8 ? 2*283 : 134+432;
     `ifndef X8	     
     `FBD_CH_PATH3.`DIMMPATH3.U13.handle = 135+432;
     `endif
     `endif


     `FBD_CH_PATH4.`DIMMPATH3.U04.handle = x8 ? 2*284 : 136+432;
     `ifndef X8	     
     `FBD_CH_PATH4.`DIMMPATH3.U13.handle = 137+432;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH5.`DIMMPATH3.U04.handle = x8 ? 2*285 : 138+432;
     `ifndef X8	     
     `FBD_CH_PATH5.`DIMMPATH3.U13.handle = 139+432;
     `endif
     `endif


     `FBD_CH_PATH6.`DIMMPATH3.U04.handle = x8 ? 2*286 : 140+432;
     `ifndef X8	     
     `FBD_CH_PATH6.`DIMMPATH3.U13.handle = 141+432;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH7.`DIMMPATH3.U04.handle = x8 ? 2*287 : 142+432;
     `ifndef X8	     
     `FBD_CH_PATH7.`DIMMPATH3.U13.handle = 143+432;
     `endif
     `endif


        `ifdef DBL_SIDE

//start11
             `FBD_CH_PATH0.`RANK_DIMMPATH2.U00.handle = x8 ? 2*720 : 0+1440;
             `FBD_CH_PATH0.`RANK_DIMMPATH2.U01.handle = x8 ? 2*721 : 1+1440;
             `FBD_CH_PATH0.`RANK_DIMMPATH2.U02.handle = x8 ? 2*722 : 2+1440;
             `FBD_CH_PATH0.`RANK_DIMMPATH2.U03.handle = x8 ? 2*723 : 3+1440;
             `FBD_CH_PATH0.`RANK_DIMMPATH2.U05.handle = x8 ? 2*724 : 4+1440;
             `FBD_CH_PATH0.`RANK_DIMMPATH2.U06.handle = x8 ? 2*725 : 5+1440;
             `FBD_CH_PATH0.`RANK_DIMMPATH2.U07.handle = x8 ? 2*726 : 6+1440;
             `FBD_CH_PATH0.`RANK_DIMMPATH2.U08.handle = x8 ? 2*727 : 7+1440;
             `ifndef X8	     
             `FBD_CH_PATH0.`RANK_DIMMPATH2.U09.handle = 8+1440;
             `FBD_CH_PATH0.`RANK_DIMMPATH2.U10.handle = 9+1440;
             `FBD_CH_PATH0.`RANK_DIMMPATH2.U11.handle = 10+1440;
             `FBD_CH_PATH0.`RANK_DIMMPATH2.U12.handle = 11+1440;
             `FBD_CH_PATH0.`RANK_DIMMPATH2.U14.handle = 12+1440;
             `FBD_CH_PATH0.`RANK_DIMMPATH2.U15.handle = 13+1440;
             `FBD_CH_PATH0.`RANK_DIMMPATH2.U16.handle = 14+1440;
             `FBD_CH_PATH0.`RANK_DIMMPATH2.U17.handle = 15+1440;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH1.`RANK_DIMMPATH2.U00.handle = x8 ? 2*728 : 16+1440;
             `FBD_CH_PATH1.`RANK_DIMMPATH2.U01.handle = x8 ? 2*729 : 17+1440;
             `FBD_CH_PATH1.`RANK_DIMMPATH2.U02.handle = x8 ? 2*730 : 18+1440;
             `FBD_CH_PATH1.`RANK_DIMMPATH2.U03.handle = x8 ? 2*731 : 19+1440;
             `FBD_CH_PATH1.`RANK_DIMMPATH2.U05.handle = x8 ? 2*732 : 20+1440;
             `FBD_CH_PATH1.`RANK_DIMMPATH2.U06.handle = x8 ? 2*733 : 21+1440;
             `FBD_CH_PATH1.`RANK_DIMMPATH2.U07.handle = x8 ? 2*734 : 22+1440;
             `FBD_CH_PATH1.`RANK_DIMMPATH2.U08.handle = x8 ? 2*735 : 23+1440;
             `ifndef X8	     
             `FBD_CH_PATH1.`RANK_DIMMPATH2.U09.handle = 24+1440;
             `FBD_CH_PATH1.`RANK_DIMMPATH2.U10.handle = 25+1440;
             `FBD_CH_PATH1.`RANK_DIMMPATH2.U11.handle = 26+1440;
             `FBD_CH_PATH1.`RANK_DIMMPATH2.U12.handle = 27+1440;
             `FBD_CH_PATH1.`RANK_DIMMPATH2.U14.handle = 28+1440;
             `FBD_CH_PATH1.`RANK_DIMMPATH2.U15.handle = 29+1440;
             `FBD_CH_PATH1.`RANK_DIMMPATH2.U16.handle = 30+1440;
             `FBD_CH_PATH1.`RANK_DIMMPATH2.U17.handle = 31+1440;
             `endif
             `endif


             
             `FBD_CH_PATH2.`RANK_DIMMPATH2.U00.handle = x8 ? 2*736 : 32+1440;
             `FBD_CH_PATH2.`RANK_DIMMPATH2.U01.handle = x8 ? 2*737 : 33+1440;
             `FBD_CH_PATH2.`RANK_DIMMPATH2.U02.handle = x8 ? 2*738 : 34+1440;
             `FBD_CH_PATH2.`RANK_DIMMPATH2.U03.handle = x8 ? 2*739 : 35+1440;
             `FBD_CH_PATH2.`RANK_DIMMPATH2.U05.handle = x8 ? 2*740 : 36+1440;
             `FBD_CH_PATH2.`RANK_DIMMPATH2.U06.handle = x8 ? 2*741 : 37+1440;
             `FBD_CH_PATH2.`RANK_DIMMPATH2.U07.handle = x8 ? 2*742 : 38+1440;
             `FBD_CH_PATH2.`RANK_DIMMPATH2.U08.handle = x8 ? 2*743 : 39+1440;
             `ifndef X8	     
             `FBD_CH_PATH2.`RANK_DIMMPATH2.U09.handle = 40+1440;
             `FBD_CH_PATH2.`RANK_DIMMPATH2.U10.handle = 41+1440;
             `FBD_CH_PATH2.`RANK_DIMMPATH2.U11.handle = 42+1440;
             `FBD_CH_PATH2.`RANK_DIMMPATH2.U12.handle = 43+1440;
             `FBD_CH_PATH2.`RANK_DIMMPATH2.U14.handle = 44+1440;
             `FBD_CH_PATH2.`RANK_DIMMPATH2.U15.handle = 45+1440;
             `FBD_CH_PATH2.`RANK_DIMMPATH2.U16.handle = 46+1440;
             `FBD_CH_PATH2.`RANK_DIMMPATH2.U17.handle = 47+1440;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH3.`RANK_DIMMPATH2.U00.handle = x8 ? 2*744 : 48+1440;
             `FBD_CH_PATH3.`RANK_DIMMPATH2.U01.handle = x8 ? 2*745 : 49+1440;
             `FBD_CH_PATH3.`RANK_DIMMPATH2.U02.handle = x8 ? 2*746 : 50+1440;
             `FBD_CH_PATH3.`RANK_DIMMPATH2.U03.handle = x8 ? 2*747 : 51+1440;
             `FBD_CH_PATH3.`RANK_DIMMPATH2.U05.handle = x8 ? 2*748 : 52+1440;
             `FBD_CH_PATH3.`RANK_DIMMPATH2.U06.handle = x8 ? 2*749 : 53+1440;
             `FBD_CH_PATH3.`RANK_DIMMPATH2.U07.handle = x8 ? 2*750 : 54+1440;
             `FBD_CH_PATH3.`RANK_DIMMPATH2.U08.handle = x8 ? 2*751 : 55+1440;
             `ifndef X8	     
             `FBD_CH_PATH3.`RANK_DIMMPATH2.U09.handle = 56+1440;
             `FBD_CH_PATH3.`RANK_DIMMPATH2.U10.handle = 57+1440;
             `FBD_CH_PATH3.`RANK_DIMMPATH2.U11.handle = 58+1440;
             `FBD_CH_PATH3.`RANK_DIMMPATH2.U12.handle = 59+1440;
             `FBD_CH_PATH3.`RANK_DIMMPATH2.U14.handle = 60+1440;
             `FBD_CH_PATH3.`RANK_DIMMPATH2.U15.handle = 61+1440;
             `FBD_CH_PATH3.`RANK_DIMMPATH2.U16.handle = 62+1440;
             `FBD_CH_PATH3.`RANK_DIMMPATH2.U17.handle = 63+1440;
             `endif
             `endif


             
             `FBD_CH_PATH4.`RANK_DIMMPATH2.U00.handle = x8 ? 2*752 : 64+1440;
             `FBD_CH_PATH4.`RANK_DIMMPATH2.U01.handle = x8 ? 2*753 : 65+1440;
             `FBD_CH_PATH4.`RANK_DIMMPATH2.U02.handle = x8 ? 2*754 : 66+1440;
             `FBD_CH_PATH4.`RANK_DIMMPATH2.U03.handle = x8 ? 2*755 : 67+1440;
             `FBD_CH_PATH4.`RANK_DIMMPATH2.U05.handle = x8 ? 2*756 : 68+1440;
             `FBD_CH_PATH4.`RANK_DIMMPATH2.U06.handle = x8 ? 2*757 : 69+1440;
             `FBD_CH_PATH4.`RANK_DIMMPATH2.U07.handle = x8 ? 2*758 : 70+1440;
             `FBD_CH_PATH4.`RANK_DIMMPATH2.U08.handle = x8 ? 2*759 : 71+1440;
             `ifndef X8	     
             `FBD_CH_PATH4.`RANK_DIMMPATH2.U09.handle = 72+1440;
             `FBD_CH_PATH4.`RANK_DIMMPATH2.U10.handle = 73+1440;
             `FBD_CH_PATH4.`RANK_DIMMPATH2.U11.handle = 74+1440;
             `FBD_CH_PATH4.`RANK_DIMMPATH2.U12.handle = 75+1440;
             `FBD_CH_PATH4.`RANK_DIMMPATH2.U14.handle = 76+1440;
             `FBD_CH_PATH4.`RANK_DIMMPATH2.U15.handle = 77+1440;
             `FBD_CH_PATH4.`RANK_DIMMPATH2.U16.handle = 78+1440;
             `FBD_CH_PATH4.`RANK_DIMMPATH2.U17.handle = 79+1440;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH5.`RANK_DIMMPATH2.U00.handle = x8 ? 2*760 : 80+1440;
             `FBD_CH_PATH5.`RANK_DIMMPATH2.U01.handle = x8 ? 2*761 : 81+1440;
             `FBD_CH_PATH5.`RANK_DIMMPATH2.U02.handle = x8 ? 2*762 : 82+1440;
             `FBD_CH_PATH5.`RANK_DIMMPATH2.U03.handle = x8 ? 2*763 : 83+1440;
             `FBD_CH_PATH5.`RANK_DIMMPATH2.U05.handle = x8 ? 2*764 : 84+1440;
             `FBD_CH_PATH5.`RANK_DIMMPATH2.U06.handle = x8 ? 2*765 : 85+1440;
             `FBD_CH_PATH5.`RANK_DIMMPATH2.U07.handle = x8 ? 2*766 : 86+1440;
             `FBD_CH_PATH5.`RANK_DIMMPATH2.U08.handle = x8 ? 2*767 : 87+1440;
             `ifndef X8	     
             `FBD_CH_PATH5.`RANK_DIMMPATH2.U09.handle = 88+1440;
             `FBD_CH_PATH5.`RANK_DIMMPATH2.U10.handle = 89+1440;
             `FBD_CH_PATH5.`RANK_DIMMPATH2.U11.handle = 90+1440;
             `FBD_CH_PATH5.`RANK_DIMMPATH2.U12.handle = 91+1440;
             `FBD_CH_PATH5.`RANK_DIMMPATH2.U14.handle = 92+1440;
             `FBD_CH_PATH5.`RANK_DIMMPATH2.U15.handle = 93+1440;
             `FBD_CH_PATH5.`RANK_DIMMPATH2.U16.handle = 94+1440;
             `FBD_CH_PATH5.`RANK_DIMMPATH2.U17.handle = 95+1440;
             `endif
             `endif


             `FBD_CH_PATH6.`RANK_DIMMPATH2.U00.handle = x8 ? 2*768 : 96+1440;
             `FBD_CH_PATH6.`RANK_DIMMPATH2.U01.handle = x8 ? 2*769 : 97+1440;
             `FBD_CH_PATH6.`RANK_DIMMPATH2.U02.handle = x8 ? 2*770 : 98+1440;
             `FBD_CH_PATH6.`RANK_DIMMPATH2.U03.handle = x8 ? 2*771 : 99+1440;
             `FBD_CH_PATH6.`RANK_DIMMPATH2.U05.handle = x8 ? 2*772 : 100+1440;
             `FBD_CH_PATH6.`RANK_DIMMPATH2.U06.handle = x8 ? 2*773 : 101+1440;
             `FBD_CH_PATH6.`RANK_DIMMPATH2.U07.handle = x8 ? 2*774 : 102+1440;
             `FBD_CH_PATH6.`RANK_DIMMPATH2.U08.handle = x8 ? 2*775 : 103+1440;
             `ifndef X8	     
             `FBD_CH_PATH6.`RANK_DIMMPATH2.U09.handle = 104+1440;
             `FBD_CH_PATH6.`RANK_DIMMPATH2.U10.handle = 105+1440;
             `FBD_CH_PATH6.`RANK_DIMMPATH2.U11.handle = 106+1440;
             `FBD_CH_PATH6.`RANK_DIMMPATH2.U12.handle = 107+1440;
             `FBD_CH_PATH6.`RANK_DIMMPATH2.U14.handle = 108+1440;
             `FBD_CH_PATH6.`RANK_DIMMPATH2.U15.handle = 109+1440;
             `FBD_CH_PATH6.`RANK_DIMMPATH2.U16.handle = 110+1440;
             `FBD_CH_PATH6.`RANK_DIMMPATH2.U17.handle = 111+1440;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH7.`RANK_DIMMPATH2.U00.handle = x8 ? 2*776 : 112+1440;
             `FBD_CH_PATH7.`RANK_DIMMPATH2.U01.handle = x8 ? 2*777 : 113+1440;
             `FBD_CH_PATH7.`RANK_DIMMPATH2.U02.handle = x8 ? 2*778 : 114+1440;
             `FBD_CH_PATH7.`RANK_DIMMPATH2.U03.handle = x8 ? 2*779 : 115+1440;
             `FBD_CH_PATH7.`RANK_DIMMPATH2.U05.handle = x8 ? 2*780 : 116+1440;
             `FBD_CH_PATH7.`RANK_DIMMPATH2.U06.handle = x8 ? 2*781 : 117+1440;
             `FBD_CH_PATH7.`RANK_DIMMPATH2.U07.handle = x8 ? 2*782 : 118+1440;
             `FBD_CH_PATH7.`RANK_DIMMPATH2.U08.handle = x8 ? 2*783 : 119+1440;
             `ifndef X8	     
             `FBD_CH_PATH7.`RANK_DIMMPATH2.U09.handle = 120+1440;
             `FBD_CH_PATH7.`RANK_DIMMPATH2.U10.handle = 121+1440;
             `FBD_CH_PATH7.`RANK_DIMMPATH2.U11.handle = 122+1440;
             `FBD_CH_PATH7.`RANK_DIMMPATH2.U12.handle = 123+1440;
             `FBD_CH_PATH7.`RANK_DIMMPATH2.U14.handle = 124+1440;
             `FBD_CH_PATH7.`RANK_DIMMPATH2.U15.handle = 125+1440;
             `FBD_CH_PATH7.`RANK_DIMMPATH2.U16.handle = 126+1440;
             `FBD_CH_PATH7.`RANK_DIMMPATH2.U17.handle = 127+1440;
             `endif
             `endif


             
             `FBD_CH_PATH0.`RANK_DIMMPATH2.U04.handle = x8 ? 2*784 : 128+1440;
             `ifndef X8	     
             `FBD_CH_PATH0.`RANK_DIMMPATH2.U13.handle = 129+1440;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH1.`RANK_DIMMPATH2.U04.handle = x8 ? 2*785 : 130+1440;
             `ifndef X8	     
             `FBD_CH_PATH1.`RANK_DIMMPATH2.U13.handle = 131+1440;
             `endif
             `endif


             `FBD_CH_PATH2.`RANK_DIMMPATH2.U04.handle = x8 ? 2*786 : 132+1440;
             `ifndef X8	     
             `FBD_CH_PATH2.`RANK_DIMMPATH2.U13.handle = 133+1440;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH3.`RANK_DIMMPATH2.U04.handle = x8 ? 2*787 : 134+1440;
             `ifndef X8	     
             `FBD_CH_PATH3.`RANK_DIMMPATH2.U13.handle = 135+1440;
             `endif
             `endif


             `FBD_CH_PATH4.`RANK_DIMMPATH2.U04.handle = x8 ? 2*788 : 136+1440;
             `ifndef X8	     
             `FBD_CH_PATH4.`RANK_DIMMPATH2.U13.handle = 137+1440;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH5.`RANK_DIMMPATH2.U04.handle = x8 ? 2*789 : 138+1440;
             `ifndef X8	     
             `FBD_CH_PATH5.`RANK_DIMMPATH2.U13.handle = 139+1440;
             `endif
             `endif


             `FBD_CH_PATH6.`RANK_DIMMPATH2.U04.handle = x8 ? 2*790 : 140+1440;
             `ifndef X8	     
             `FBD_CH_PATH6.`RANK_DIMMPATH2.U13.handle = 141+1440;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH7.`RANK_DIMMPATH2.U04.handle = x8 ? 2*791 : 142+1440;
             `ifndef X8	     
             `FBD_CH_PATH7.`RANK_DIMMPATH2.U13.handle = 143+1440;
             `endif
             `endif


//start12
             `FBD_CH_PATH0.`RANK_DIMMPATH3.U00.handle = x8 ? 2*792 : 0+1584;
             `FBD_CH_PATH0.`RANK_DIMMPATH3.U01.handle = x8 ? 2*793 : 1+1584;
             `FBD_CH_PATH0.`RANK_DIMMPATH3.U02.handle = x8 ? 2*794 : 2+1584;
             `FBD_CH_PATH0.`RANK_DIMMPATH3.U03.handle = x8 ? 2*795 : 3+1584;
             `FBD_CH_PATH0.`RANK_DIMMPATH3.U05.handle = x8 ? 2*796 : 4+1584;
             `FBD_CH_PATH0.`RANK_DIMMPATH3.U06.handle = x8 ? 2*797 : 5+1584;
             `FBD_CH_PATH0.`RANK_DIMMPATH3.U07.handle = x8 ? 2*798 : 6+1584;
             `FBD_CH_PATH0.`RANK_DIMMPATH3.U08.handle = x8 ? 2*799 : 7+1584;
             `ifndef X8	     
             `FBD_CH_PATH0.`RANK_DIMMPATH3.U09.handle = 8+1584;
             `FBD_CH_PATH0.`RANK_DIMMPATH3.U10.handle = 9+1584;
             `FBD_CH_PATH0.`RANK_DIMMPATH3.U11.handle = 10+1584;
             `FBD_CH_PATH0.`RANK_DIMMPATH3.U12.handle = 11+1584;
             `FBD_CH_PATH0.`RANK_DIMMPATH3.U14.handle = 12+1584;
             `FBD_CH_PATH0.`RANK_DIMMPATH3.U15.handle = 13+1584;
             `FBD_CH_PATH0.`RANK_DIMMPATH3.U16.handle = 14+1584;
             `FBD_CH_PATH0.`RANK_DIMMPATH3.U17.handle = 15+1584;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH1.`RANK_DIMMPATH3.U00.handle = x8 ? 2*800 : 16+1584;
             `FBD_CH_PATH1.`RANK_DIMMPATH3.U01.handle = x8 ? 2*801 : 17+1584;
             `FBD_CH_PATH1.`RANK_DIMMPATH3.U02.handle = x8 ? 2*802 : 18+1584;
             `FBD_CH_PATH1.`RANK_DIMMPATH3.U03.handle = x8 ? 2*803 : 19+1584;
             `FBD_CH_PATH1.`RANK_DIMMPATH3.U05.handle = x8 ? 2*804 : 20+1584;
             `FBD_CH_PATH1.`RANK_DIMMPATH3.U06.handle = x8 ? 2*805 : 21+1584;
             `FBD_CH_PATH1.`RANK_DIMMPATH3.U07.handle = x8 ? 2*806 : 22+1584;
             `FBD_CH_PATH1.`RANK_DIMMPATH3.U08.handle = x8 ? 2*807 : 23+1584;
             `ifndef X8	     
             `FBD_CH_PATH1.`RANK_DIMMPATH3.U09.handle = 24+1584;
             `FBD_CH_PATH1.`RANK_DIMMPATH3.U10.handle = 25+1584;
             `FBD_CH_PATH1.`RANK_DIMMPATH3.U11.handle = 26+1584;
             `FBD_CH_PATH1.`RANK_DIMMPATH3.U12.handle = 27+1584;
             `FBD_CH_PATH1.`RANK_DIMMPATH3.U14.handle = 28+1584;
             `FBD_CH_PATH1.`RANK_DIMMPATH3.U15.handle = 29+1584;
             `FBD_CH_PATH1.`RANK_DIMMPATH3.U16.handle = 30+1584;
             `FBD_CH_PATH1.`RANK_DIMMPATH3.U17.handle = 31+1584;
             `endif
             `endif


             
             `FBD_CH_PATH2.`RANK_DIMMPATH3.U00.handle = x8 ? 2*808 : 32+1584;
             `FBD_CH_PATH2.`RANK_DIMMPATH3.U01.handle = x8 ? 2*809 : 33+1584;
             `FBD_CH_PATH2.`RANK_DIMMPATH3.U02.handle = x8 ? 2*810 : 34+1584;
             `FBD_CH_PATH2.`RANK_DIMMPATH3.U03.handle = x8 ? 2*811 : 35+1584;
             `FBD_CH_PATH2.`RANK_DIMMPATH3.U05.handle = x8 ? 2*812 : 36+1584;
             `FBD_CH_PATH2.`RANK_DIMMPATH3.U06.handle = x8 ? 2*813 : 37+1584;
             `FBD_CH_PATH2.`RANK_DIMMPATH3.U07.handle = x8 ? 2*814 : 38+1584;
             `FBD_CH_PATH2.`RANK_DIMMPATH3.U08.handle = x8 ? 2*815 : 39+1584;
             `ifndef X8	     
             `FBD_CH_PATH2.`RANK_DIMMPATH3.U09.handle = 40+1584;
             `FBD_CH_PATH2.`RANK_DIMMPATH3.U10.handle = 41+1584;
             `FBD_CH_PATH2.`RANK_DIMMPATH3.U11.handle = 42+1584;
             `FBD_CH_PATH2.`RANK_DIMMPATH3.U12.handle = 43+1584;
             `FBD_CH_PATH2.`RANK_DIMMPATH3.U14.handle = 44+1584;
             `FBD_CH_PATH2.`RANK_DIMMPATH3.U15.handle = 45+1584;
             `FBD_CH_PATH2.`RANK_DIMMPATH3.U16.handle = 46+1584;
             `FBD_CH_PATH2.`RANK_DIMMPATH3.U17.handle = 47+1584;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH3.`RANK_DIMMPATH3.U00.handle = x8 ? 2*816 : 48+1584;
             `FBD_CH_PATH3.`RANK_DIMMPATH3.U01.handle = x8 ? 2*817 : 49+1584;
             `FBD_CH_PATH3.`RANK_DIMMPATH3.U02.handle = x8 ? 2*818 : 50+1584;
             `FBD_CH_PATH3.`RANK_DIMMPATH3.U03.handle = x8 ? 2*819 : 51+1584;
             `FBD_CH_PATH3.`RANK_DIMMPATH3.U05.handle = x8 ? 2*820 : 52+1584;
             `FBD_CH_PATH3.`RANK_DIMMPATH3.U06.handle = x8 ? 2*821 : 53+1584;
             `FBD_CH_PATH3.`RANK_DIMMPATH3.U07.handle = x8 ? 2*822 : 54+1584;
             `FBD_CH_PATH3.`RANK_DIMMPATH3.U08.handle = x8 ? 2*823 : 55+1584;
             `ifndef X8	     
             `FBD_CH_PATH3.`RANK_DIMMPATH3.U09.handle = 56+1584;
             `FBD_CH_PATH3.`RANK_DIMMPATH3.U10.handle = 57+1584;
             `FBD_CH_PATH3.`RANK_DIMMPATH3.U11.handle = 58+1584;
             `FBD_CH_PATH3.`RANK_DIMMPATH3.U12.handle = 59+1584;
             `FBD_CH_PATH3.`RANK_DIMMPATH3.U14.handle = 60+1584;
             `FBD_CH_PATH3.`RANK_DIMMPATH3.U15.handle = 61+1584;
             `FBD_CH_PATH3.`RANK_DIMMPATH3.U16.handle = 62+1584;
             `FBD_CH_PATH3.`RANK_DIMMPATH3.U17.handle = 63+1584;
             `endif
             `endif


             
             `FBD_CH_PATH4.`RANK_DIMMPATH3.U00.handle = x8 ? 2*824 : 64+1584;
             `FBD_CH_PATH4.`RANK_DIMMPATH3.U01.handle = x8 ? 2*825 : 65+1584;
             `FBD_CH_PATH4.`RANK_DIMMPATH3.U02.handle = x8 ? 2*826 : 66+1584;
             `FBD_CH_PATH4.`RANK_DIMMPATH3.U03.handle = x8 ? 2*827 : 67+1584;
             `FBD_CH_PATH4.`RANK_DIMMPATH3.U05.handle = x8 ? 2*828 : 68+1584;
             `FBD_CH_PATH4.`RANK_DIMMPATH3.U06.handle = x8 ? 2*829 : 69+1584;
             `FBD_CH_PATH4.`RANK_DIMMPATH3.U07.handle = x8 ? 2*830 : 70+1584;
             `FBD_CH_PATH4.`RANK_DIMMPATH3.U08.handle = x8 ? 2*831 : 71+1584;
             `ifndef X8	     
             `FBD_CH_PATH4.`RANK_DIMMPATH3.U09.handle = 72+1584;
             `FBD_CH_PATH4.`RANK_DIMMPATH3.U10.handle = 73+1584;
             `FBD_CH_PATH4.`RANK_DIMMPATH3.U11.handle = 74+1584;
             `FBD_CH_PATH4.`RANK_DIMMPATH3.U12.handle = 75+1584;
             `FBD_CH_PATH4.`RANK_DIMMPATH3.U14.handle = 76+1584;
             `FBD_CH_PATH4.`RANK_DIMMPATH3.U15.handle = 77+1584;
             `FBD_CH_PATH4.`RANK_DIMMPATH3.U16.handle = 78+1584;
             `FBD_CH_PATH4.`RANK_DIMMPATH3.U17.handle = 79+1584;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH5.`RANK_DIMMPATH3.U00.handle = x8 ? 2*832 : 80+1584;
             `FBD_CH_PATH5.`RANK_DIMMPATH3.U01.handle = x8 ? 2*833 : 81+1584;
             `FBD_CH_PATH5.`RANK_DIMMPATH3.U02.handle = x8 ? 2*834 : 82+1584;
             `FBD_CH_PATH5.`RANK_DIMMPATH3.U03.handle = x8 ? 2*835 : 83+1584;
             `FBD_CH_PATH5.`RANK_DIMMPATH3.U05.handle = x8 ? 2*836 : 84+1584;
             `FBD_CH_PATH5.`RANK_DIMMPATH3.U06.handle = x8 ? 2*837 : 85+1584;
             `FBD_CH_PATH5.`RANK_DIMMPATH3.U07.handle = x8 ? 2*838 : 86+1584;
             `FBD_CH_PATH5.`RANK_DIMMPATH3.U08.handle = x8 ? 2*839 : 87+1584;
             `ifndef X8	     
             `FBD_CH_PATH5.`RANK_DIMMPATH3.U09.handle = 88+1584;
             `FBD_CH_PATH5.`RANK_DIMMPATH3.U10.handle = 89+1584;
             `FBD_CH_PATH5.`RANK_DIMMPATH3.U11.handle = 90+1584;
             `FBD_CH_PATH5.`RANK_DIMMPATH3.U12.handle = 91+1584;
             `FBD_CH_PATH5.`RANK_DIMMPATH3.U14.handle = 92+1584;
             `FBD_CH_PATH5.`RANK_DIMMPATH3.U15.handle = 93+1584;
             `FBD_CH_PATH5.`RANK_DIMMPATH3.U16.handle = 94+1584;
             `FBD_CH_PATH5.`RANK_DIMMPATH3.U17.handle = 95+1584;
             `endif
             `endif


             
             `FBD_CH_PATH6.`RANK_DIMMPATH3.U00.handle = x8 ? 2*840 : 96+1584;
             `FBD_CH_PATH6.`RANK_DIMMPATH3.U01.handle = x8 ? 2*841 : 97+1584;
             `FBD_CH_PATH6.`RANK_DIMMPATH3.U02.handle = x8 ? 2*842 : 98+1584;
             `FBD_CH_PATH6.`RANK_DIMMPATH3.U03.handle = x8 ? 2*843 : 99+1584;
             `FBD_CH_PATH6.`RANK_DIMMPATH3.U05.handle = x8 ? 2*844 : 100+1584;
             `FBD_CH_PATH6.`RANK_DIMMPATH3.U06.handle = x8 ? 2*845 : 101+1584;
             `FBD_CH_PATH6.`RANK_DIMMPATH3.U07.handle = x8 ? 2*846 : 102+1584;
             `FBD_CH_PATH6.`RANK_DIMMPATH3.U08.handle = x8 ? 2*847 : 103+1584;
             `ifndef X8	     
             `FBD_CH_PATH6.`RANK_DIMMPATH3.U09.handle = 104+1584;
             `FBD_CH_PATH6.`RANK_DIMMPATH3.U10.handle = 105+1584;
             `FBD_CH_PATH6.`RANK_DIMMPATH3.U11.handle = 106+1584;
             `FBD_CH_PATH6.`RANK_DIMMPATH3.U12.handle = 107+1584;
             `FBD_CH_PATH6.`RANK_DIMMPATH3.U14.handle = 108+1584;
             `FBD_CH_PATH6.`RANK_DIMMPATH3.U15.handle = 109+1584;
             `FBD_CH_PATH6.`RANK_DIMMPATH3.U16.handle = 110+1584;
             `FBD_CH_PATH6.`RANK_DIMMPATH3.U17.handle = 111+1584;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH7.`RANK_DIMMPATH3.U00.handle = x8 ? 2*848 : 112+1584;
             `FBD_CH_PATH7.`RANK_DIMMPATH3.U01.handle = x8 ? 2*849 : 113+1584;
             `FBD_CH_PATH7.`RANK_DIMMPATH3.U02.handle = x8 ? 2*850 : 114+1584;
             `FBD_CH_PATH7.`RANK_DIMMPATH3.U03.handle = x8 ? 2*851 : 115+1584;
             `FBD_CH_PATH7.`RANK_DIMMPATH3.U05.handle = x8 ? 2*852 : 116+1584;
             `FBD_CH_PATH7.`RANK_DIMMPATH3.U06.handle = x8 ? 2*853 : 117+1584;
             `FBD_CH_PATH7.`RANK_DIMMPATH3.U07.handle = x8 ? 2*854 : 118+1584;
             `FBD_CH_PATH7.`RANK_DIMMPATH3.U08.handle = x8 ? 2*855 : 119+1584;
             `ifndef X8	     
             `FBD_CH_PATH7.`RANK_DIMMPATH3.U09.handle = 120+1584;
             `FBD_CH_PATH7.`RANK_DIMMPATH3.U10.handle = 121+1584;
             `FBD_CH_PATH7.`RANK_DIMMPATH3.U11.handle = 122+1584;
             `FBD_CH_PATH7.`RANK_DIMMPATH3.U12.handle = 123+1584;
             `FBD_CH_PATH7.`RANK_DIMMPATH3.U14.handle = 124+1584;
             `FBD_CH_PATH7.`RANK_DIMMPATH3.U15.handle = 125+1584;
             `FBD_CH_PATH7.`RANK_DIMMPATH3.U16.handle = 126+1584;
             `FBD_CH_PATH7.`RANK_DIMMPATH3.U17.handle = 127+1584;
             `endif
             `endif


             
             `FBD_CH_PATH0.`RANK_DIMMPATH3.U04.handle = x8 ? 2*856 : 128+1584;
             `ifndef X8	     
             `FBD_CH_PATH0.`RANK_DIMMPATH3.U13.handle = 129+1584;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH1.`RANK_DIMMPATH3.U04.handle = x8 ? 2*857 : 130+1584;
             `ifndef X8	     
             `FBD_CH_PATH1.`RANK_DIMMPATH3.U13.handle = 131+1584;
             `endif
             `endif


             `FBD_CH_PATH2.`RANK_DIMMPATH3.U04.handle = x8 ? 2*858 : 132+1584;
             `ifndef X8	     
             `FBD_CH_PATH2.`RANK_DIMMPATH3.U13.handle = 133+1584;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH3.`RANK_DIMMPATH3.U04.handle = x8 ? 2*859 : 134+1584;
             `ifndef X8	     
             `FBD_CH_PATH3.`RANK_DIMMPATH3.U13.handle = 135+1584;
             `endif
             `endif


             `FBD_CH_PATH4.`RANK_DIMMPATH3.U04.handle = x8 ? 2*860 : 136+1584;
             `ifndef X8	     
             `FBD_CH_PATH4.`RANK_DIMMPATH3.U13.handle = 137+1584;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH5.`RANK_DIMMPATH3.U04.handle = x8 ? 2*861 : 138+1584;
             `ifndef X8	     
             `FBD_CH_PATH5.`RANK_DIMMPATH3.U13.handle = 139+1584;
             `endif
             `endif


             `FBD_CH_PATH6.`RANK_DIMMPATH3.U04.handle = x8 ? 2*862 : 140+1584;
             `ifndef X8	     
             `FBD_CH_PATH6.`RANK_DIMMPATH3.U13.handle = 141+1584;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH7.`RANK_DIMMPATH3.U04.handle = x8 ? 2*863 : 142+1584;
             `ifndef X8	     
             `FBD_CH_PATH7.`RANK_DIMMPATH3.U13.handle = 143+1584;
             `endif
             `endif


        `endif 

     `endif 

     `ifdef FBD_6
     
//start5
     `FBD_CH_PATH0.`DIMMPATH4.U00.handle = x8 ? 2*288 : 0+576;
     `FBD_CH_PATH0.`DIMMPATH4.U01.handle = x8 ? 2*289 : 1+576;
     `FBD_CH_PATH0.`DIMMPATH4.U02.handle = x8 ? 2*290 : 2+576;
     `FBD_CH_PATH0.`DIMMPATH4.U03.handle = x8 ? 2*291 : 3+576;
     `FBD_CH_PATH0.`DIMMPATH4.U05.handle = x8 ? 2*292 : 4+576;
     `FBD_CH_PATH0.`DIMMPATH4.U06.handle = x8 ? 2*293 : 5+576;
     `FBD_CH_PATH0.`DIMMPATH4.U07.handle = x8 ? 2*294 : 6+576;
     `FBD_CH_PATH0.`DIMMPATH4.U08.handle = x8 ? 2*295 : 7+576;
     `ifndef X8	     
     `FBD_CH_PATH0.`DIMMPATH4.U09.handle = 8+576;
     `FBD_CH_PATH0.`DIMMPATH4.U10.handle = 9+576;
     `FBD_CH_PATH0.`DIMMPATH4.U11.handle = 10+576;
     `FBD_CH_PATH0.`DIMMPATH4.U12.handle = 11+576;
     `FBD_CH_PATH0.`DIMMPATH4.U14.handle = 12+576;
     `FBD_CH_PATH0.`DIMMPATH4.U15.handle = 13+576;
     `FBD_CH_PATH0.`DIMMPATH4.U16.handle = 14+576;
     `FBD_CH_PATH0.`DIMMPATH4.U17.handle = 15+576;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH1.`DIMMPATH4.U00.handle = x8 ? 2*296 : 16+576;
     `FBD_CH_PATH1.`DIMMPATH4.U01.handle = x8 ? 2*297 : 17+576;
     `FBD_CH_PATH1.`DIMMPATH4.U02.handle = x8 ? 2*298 : 18+576;
     `FBD_CH_PATH1.`DIMMPATH4.U03.handle = x8 ? 2*299 : 19+576;
     `FBD_CH_PATH1.`DIMMPATH4.U05.handle = x8 ? 2*300 : 20+576;
     `FBD_CH_PATH1.`DIMMPATH4.U06.handle = x8 ? 2*301 : 21+576;
     `FBD_CH_PATH1.`DIMMPATH4.U07.handle = x8 ? 2*302 : 22+576;
     `FBD_CH_PATH1.`DIMMPATH4.U08.handle = x8 ? 2*303 : 23+576;
     `ifndef X8	     
     `FBD_CH_PATH1.`DIMMPATH4.U09.handle = 24+576;
     `FBD_CH_PATH1.`DIMMPATH4.U10.handle = 25+576;
     `FBD_CH_PATH1.`DIMMPATH4.U11.handle = 26+576;
     `FBD_CH_PATH1.`DIMMPATH4.U12.handle = 27+576;
     `FBD_CH_PATH1.`DIMMPATH4.U14.handle = 28+576;
     `FBD_CH_PATH1.`DIMMPATH4.U15.handle = 29+576;
     `FBD_CH_PATH1.`DIMMPATH4.U16.handle = 30+576;
     `FBD_CH_PATH1.`DIMMPATH4.U17.handle = 31+576;
     `endif
     `endif


     
     `FBD_CH_PATH2.`DIMMPATH4.U00.handle = x8 ? 2*304 : 32+576;
     `FBD_CH_PATH2.`DIMMPATH4.U01.handle = x8 ? 2*305 : 33+576;
     `FBD_CH_PATH2.`DIMMPATH4.U02.handle = x8 ? 2*306 : 34+576;
     `FBD_CH_PATH2.`DIMMPATH4.U03.handle = x8 ? 2*307 : 35+576;
     `FBD_CH_PATH2.`DIMMPATH4.U05.handle = x8 ? 2*308 : 36+576;
     `FBD_CH_PATH2.`DIMMPATH4.U06.handle = x8 ? 2*309 : 37+576;
     `FBD_CH_PATH2.`DIMMPATH4.U07.handle = x8 ? 2*310 : 38+576;
     `FBD_CH_PATH2.`DIMMPATH4.U08.handle = x8 ? 2*311 : 39+576;
     `ifndef X8	     
     `FBD_CH_PATH2.`DIMMPATH4.U09.handle = 40+576;
     `FBD_CH_PATH2.`DIMMPATH4.U10.handle = 41+576;
     `FBD_CH_PATH2.`DIMMPATH4.U11.handle = 42+576;
     `FBD_CH_PATH2.`DIMMPATH4.U12.handle = 43+576;
     `FBD_CH_PATH2.`DIMMPATH4.U14.handle = 44+576;
     `FBD_CH_PATH2.`DIMMPATH4.U15.handle = 45+576;
     `FBD_CH_PATH2.`DIMMPATH4.U16.handle = 46+576;
     `FBD_CH_PATH2.`DIMMPATH4.U17.handle = 47+576;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH3.`DIMMPATH4.U00.handle = x8 ? 2*312 : 48+576;
     `FBD_CH_PATH3.`DIMMPATH4.U01.handle = x8 ? 2*313 : 49+576;
     `FBD_CH_PATH3.`DIMMPATH4.U02.handle = x8 ? 2*314 : 50+576;
     `FBD_CH_PATH3.`DIMMPATH4.U03.handle = x8 ? 2*315 : 51+576;
     `FBD_CH_PATH3.`DIMMPATH4.U05.handle = x8 ? 2*316 : 52+576;
     `FBD_CH_PATH3.`DIMMPATH4.U06.handle = x8 ? 2*317 : 53+576;
     `FBD_CH_PATH3.`DIMMPATH4.U07.handle = x8 ? 2*318 : 54+576;
     `FBD_CH_PATH3.`DIMMPATH4.U08.handle = x8 ? 2*319 : 55+576;
     `ifndef X8	     
     `FBD_CH_PATH3.`DIMMPATH4.U09.handle = 56+576;
     `FBD_CH_PATH3.`DIMMPATH4.U10.handle = 57+576;
     `FBD_CH_PATH3.`DIMMPATH4.U11.handle = 58+576;
     `FBD_CH_PATH3.`DIMMPATH4.U12.handle = 59+576;
     `FBD_CH_PATH3.`DIMMPATH4.U14.handle = 60+576;
     `FBD_CH_PATH3.`DIMMPATH4.U15.handle = 61+576;
     `FBD_CH_PATH3.`DIMMPATH4.U16.handle = 62+576;
     `FBD_CH_PATH3.`DIMMPATH4.U17.handle = 63+576;
     `endif
     `endif


     
     `FBD_CH_PATH4.`DIMMPATH4.U00.handle = x8 ? 2*320 : 64+576;
     `FBD_CH_PATH4.`DIMMPATH4.U01.handle = x8 ? 2*321 : 65+576;
     `FBD_CH_PATH4.`DIMMPATH4.U02.handle = x8 ? 2*322 : 66+576;
     `FBD_CH_PATH4.`DIMMPATH4.U03.handle = x8 ? 2*323 : 67+576;
     `FBD_CH_PATH4.`DIMMPATH4.U05.handle = x8 ? 2*324 : 68+576;
     `FBD_CH_PATH4.`DIMMPATH4.U06.handle = x8 ? 2*325 : 69+576;
     `FBD_CH_PATH4.`DIMMPATH4.U07.handle = x8 ? 2*326 : 70+576;
     `FBD_CH_PATH4.`DIMMPATH4.U08.handle = x8 ? 2*327 : 71+576;
     `ifndef X8	     
     `FBD_CH_PATH4.`DIMMPATH4.U09.handle = 72+576;
     `FBD_CH_PATH4.`DIMMPATH4.U10.handle = 73+576;
     `FBD_CH_PATH4.`DIMMPATH4.U11.handle = 74+576;
     `FBD_CH_PATH4.`DIMMPATH4.U12.handle = 75+576;
     `FBD_CH_PATH4.`DIMMPATH4.U14.handle = 76+576;
     `FBD_CH_PATH4.`DIMMPATH4.U15.handle = 77+576;
     `FBD_CH_PATH4.`DIMMPATH4.U16.handle = 78+576;
     `FBD_CH_PATH4.`DIMMPATH4.U17.handle = 79+576;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH5.`DIMMPATH4.U00.handle = x8 ? 2*328 : 80+576;
     `FBD_CH_PATH5.`DIMMPATH4.U01.handle = x8 ? 2*329 : 81+576;
     `FBD_CH_PATH5.`DIMMPATH4.U02.handle = x8 ? 2*330 : 82+576;
     `FBD_CH_PATH5.`DIMMPATH4.U03.handle = x8 ? 2*331 : 83+576;
     `FBD_CH_PATH5.`DIMMPATH4.U05.handle = x8 ? 2*332 : 84+576;
     `FBD_CH_PATH5.`DIMMPATH4.U06.handle = x8 ? 2*333 : 85+576;
     `FBD_CH_PATH5.`DIMMPATH4.U07.handle = x8 ? 2*334 : 86+576;
     `FBD_CH_PATH5.`DIMMPATH4.U08.handle = x8 ? 2*335 : 87+576;
     `ifndef X8	     
     `FBD_CH_PATH5.`DIMMPATH4.U09.handle = 88+576;
     `FBD_CH_PATH5.`DIMMPATH4.U10.handle = 89+576;
     `FBD_CH_PATH5.`DIMMPATH4.U11.handle = 90+576;
     `FBD_CH_PATH5.`DIMMPATH4.U12.handle = 91+576;
     `FBD_CH_PATH5.`DIMMPATH4.U14.handle = 92+576;
     `FBD_CH_PATH5.`DIMMPATH4.U15.handle = 93+576;
     `FBD_CH_PATH5.`DIMMPATH4.U16.handle = 94+576;
     `FBD_CH_PATH5.`DIMMPATH4.U17.handle = 95+576;
     `endif
     `endif


     
     `FBD_CH_PATH6.`DIMMPATH4.U00.handle = x8 ? 2*336 : 96+576;
     `FBD_CH_PATH6.`DIMMPATH4.U01.handle = x8 ? 2*337 : 97+576;
     `FBD_CH_PATH6.`DIMMPATH4.U02.handle = x8 ? 2*338 : 98+576;
     `FBD_CH_PATH6.`DIMMPATH4.U03.handle = x8 ? 2*339 : 99+576;
     `FBD_CH_PATH6.`DIMMPATH4.U05.handle = x8 ? 2*340 : 100+576;
     `FBD_CH_PATH6.`DIMMPATH4.U06.handle = x8 ? 2*341 : 101+576;
     `FBD_CH_PATH6.`DIMMPATH4.U07.handle = x8 ? 2*342 : 102+576;
     `FBD_CH_PATH6.`DIMMPATH4.U08.handle = x8 ? 2*343 : 103+576;
     `ifndef X8	     
     `FBD_CH_PATH6.`DIMMPATH4.U09.handle = 104+576;
     `FBD_CH_PATH6.`DIMMPATH4.U10.handle = 105+576;
     `FBD_CH_PATH6.`DIMMPATH4.U11.handle = 106+576;
     `FBD_CH_PATH6.`DIMMPATH4.U12.handle = 107+576;
     `FBD_CH_PATH6.`DIMMPATH4.U14.handle = 108+576;
     `FBD_CH_PATH6.`DIMMPATH4.U15.handle = 109+576;
     `FBD_CH_PATH6.`DIMMPATH4.U16.handle = 110+576;
     `FBD_CH_PATH6.`DIMMPATH4.U17.handle = 111+576;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH7.`DIMMPATH4.U00.handle = x8 ? 2*344 : 112+576;
     `FBD_CH_PATH7.`DIMMPATH4.U01.handle = x8 ? 2*345 : 113+576;
     `FBD_CH_PATH7.`DIMMPATH4.U02.handle = x8 ? 2*346 : 114+576;
     `FBD_CH_PATH7.`DIMMPATH4.U03.handle = x8 ? 2*347 : 115+576;
     `FBD_CH_PATH7.`DIMMPATH4.U05.handle = x8 ? 2*348 : 116+576;
     `FBD_CH_PATH7.`DIMMPATH4.U06.handle = x8 ? 2*349 : 117+576;
     `FBD_CH_PATH7.`DIMMPATH4.U07.handle = x8 ? 2*350 : 118+576;
     `FBD_CH_PATH7.`DIMMPATH4.U08.handle = x8 ? 2*351 : 119+576;
     `ifndef X8	     
     `FBD_CH_PATH7.`DIMMPATH4.U09.handle = 120+576;
     `FBD_CH_PATH7.`DIMMPATH4.U10.handle = 121+576;
     `FBD_CH_PATH7.`DIMMPATH4.U11.handle = 122+576;
     `FBD_CH_PATH7.`DIMMPATH4.U12.handle = 123+576;
     `FBD_CH_PATH7.`DIMMPATH4.U14.handle = 124+576;
     `FBD_CH_PATH7.`DIMMPATH4.U15.handle = 125+576;
     `FBD_CH_PATH7.`DIMMPATH4.U16.handle = 126+576;
     `FBD_CH_PATH7.`DIMMPATH4.U17.handle = 127+576;
     `endif
     `endif


     
     `FBD_CH_PATH0.`DIMMPATH4.U04.handle = x8 ? 2*352 : 128+576;
     `ifndef X8	     
     `FBD_CH_PATH0.`DIMMPATH4.U13.handle = 129+576;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH1.`DIMMPATH4.U04.handle = x8 ? 2*353 : 130+576;
     `ifndef X8	     
     `FBD_CH_PATH1.`DIMMPATH4.U13.handle = 131+576;
     `endif
     `endif


     `FBD_CH_PATH2.`DIMMPATH4.U04.handle = x8 ? 2*354 : 132+576;
     `ifndef X8	     
     `FBD_CH_PATH2.`DIMMPATH4.U13.handle = 133+576;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH3.`DIMMPATH4.U04.handle = x8 ? 2*355 : 134+576;
     `ifndef X8	     
     `FBD_CH_PATH3.`DIMMPATH4.U13.handle = 135+576;
     `endif
     `endif


     `FBD_CH_PATH4.`DIMMPATH4.U04.handle = x8 ? 2*356 : 136+576;
     `ifndef X8	     
     `FBD_CH_PATH4.`DIMMPATH4.U13.handle = 137+576;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH5.`DIMMPATH4.U04.handle = x8 ? 2*357 : 138+576;
     `ifndef X8	     
     `FBD_CH_PATH5.`DIMMPATH4.U13.handle = 139+576;
     `endif
     `endif


     `FBD_CH_PATH6.`DIMMPATH4.U04.handle = x8 ? 2*358 : 140+576;
     `ifndef X8	     
     `FBD_CH_PATH6.`DIMMPATH4.U13.handle = 141+576;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH7.`DIMMPATH4.U04.handle = x8 ? 2*359 : 142+576;
     `ifndef X8	     
     `FBD_CH_PATH7.`DIMMPATH4.U13.handle = 143+576;
     `endif
     `endif


//start6     
     `FBD_CH_PATH0.`DIMMPATH5.U00.handle = x8 ? 2*360 : 0+720;
     `FBD_CH_PATH0.`DIMMPATH5.U01.handle = x8 ? 2*361 : 1+720;
     `FBD_CH_PATH0.`DIMMPATH5.U02.handle = x8 ? 2*362 : 2+720;
     `FBD_CH_PATH0.`DIMMPATH5.U03.handle = x8 ? 2*363 : 3+720;
     `FBD_CH_PATH0.`DIMMPATH5.U05.handle = x8 ? 2*364 : 4+720;
     `FBD_CH_PATH0.`DIMMPATH5.U06.handle = x8 ? 2*365 : 5+720;
     `FBD_CH_PATH0.`DIMMPATH5.U07.handle = x8 ? 2*366 : 6+720;
     `FBD_CH_PATH0.`DIMMPATH5.U08.handle = x8 ? 2*367 : 7+720;
     `ifndef X8	     
     `FBD_CH_PATH0.`DIMMPATH5.U09.handle = 8+720;
     `FBD_CH_PATH0.`DIMMPATH5.U10.handle = 9+720;
     `FBD_CH_PATH0.`DIMMPATH5.U11.handle = 10+720;
     `FBD_CH_PATH0.`DIMMPATH5.U12.handle = 11+720;
     `FBD_CH_PATH0.`DIMMPATH5.U14.handle = 12+720;
     `FBD_CH_PATH0.`DIMMPATH5.U15.handle = 13+720;
     `FBD_CH_PATH0.`DIMMPATH5.U16.handle = 14+720;
     `FBD_CH_PATH0.`DIMMPATH5.U17.handle = 15+720;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH1.`DIMMPATH5.U00.handle = x8 ? 2*368 : 16+720;
     `FBD_CH_PATH1.`DIMMPATH5.U01.handle = x8 ? 2*369 : 17+720;
     `FBD_CH_PATH1.`DIMMPATH5.U02.handle = x8 ? 2*370 : 18+720;
     `FBD_CH_PATH1.`DIMMPATH5.U03.handle = x8 ? 2*371 : 19+720;
     `FBD_CH_PATH1.`DIMMPATH5.U05.handle = x8 ? 2*372 : 20+720;
     `FBD_CH_PATH1.`DIMMPATH5.U06.handle = x8 ? 2*373 : 21+720;
     `FBD_CH_PATH1.`DIMMPATH5.U07.handle = x8 ? 2*374 : 22+720;
     `FBD_CH_PATH1.`DIMMPATH5.U08.handle = x8 ? 2*375 : 23+720;
     `ifndef X8	     
     `FBD_CH_PATH1.`DIMMPATH5.U09.handle = 24+720;
     `FBD_CH_PATH1.`DIMMPATH5.U10.handle = 25+720;
     `FBD_CH_PATH1.`DIMMPATH5.U11.handle = 26+720;
     `FBD_CH_PATH1.`DIMMPATH5.U12.handle = 27+720;
     `FBD_CH_PATH1.`DIMMPATH5.U14.handle = 28+720;
     `FBD_CH_PATH1.`DIMMPATH5.U15.handle = 29+720;
     `FBD_CH_PATH1.`DIMMPATH5.U16.handle = 30+720;
     `FBD_CH_PATH1.`DIMMPATH5.U17.handle = 31+720;
     `endif
     `endif


     
     `FBD_CH_PATH2.`DIMMPATH5.U00.handle = x8 ? 2*376 : 32+720;
     `FBD_CH_PATH2.`DIMMPATH5.U01.handle = x8 ? 2*377 : 33+720;
     `FBD_CH_PATH2.`DIMMPATH5.U02.handle = x8 ? 2*378 : 34+720;
     `FBD_CH_PATH2.`DIMMPATH5.U03.handle = x8 ? 2*379 : 35+720;
     `FBD_CH_PATH2.`DIMMPATH5.U05.handle = x8 ? 2*380 : 36+720;
     `FBD_CH_PATH2.`DIMMPATH5.U06.handle = x8 ? 2*381 : 37+720;
     `FBD_CH_PATH2.`DIMMPATH5.U07.handle = x8 ? 2*382 : 38+720;
     `FBD_CH_PATH2.`DIMMPATH5.U08.handle = x8 ? 2*383 : 39+720;
     `ifndef X8	     
     `FBD_CH_PATH2.`DIMMPATH5.U09.handle = 40+720;
     `FBD_CH_PATH2.`DIMMPATH5.U10.handle = 41+720;
     `FBD_CH_PATH2.`DIMMPATH5.U11.handle = 42+720;
     `FBD_CH_PATH2.`DIMMPATH5.U12.handle = 43+720;
     `FBD_CH_PATH2.`DIMMPATH5.U14.handle = 44+720;
     `FBD_CH_PATH2.`DIMMPATH5.U15.handle = 45+720;
     `FBD_CH_PATH2.`DIMMPATH5.U16.handle = 46+720;
     `FBD_CH_PATH2.`DIMMPATH5.U17.handle = 47+720;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH3.`DIMMPATH5.U00.handle = x8 ? 2*384 : 48+720;
     `FBD_CH_PATH3.`DIMMPATH5.U01.handle = x8 ? 2*385 : 49+720;
     `FBD_CH_PATH3.`DIMMPATH5.U02.handle = x8 ? 2*386 : 50+720;
     `FBD_CH_PATH3.`DIMMPATH5.U03.handle = x8 ? 2*387 : 51+720;
     `FBD_CH_PATH3.`DIMMPATH5.U05.handle = x8 ? 2*388 : 52+720;
     `FBD_CH_PATH3.`DIMMPATH5.U06.handle = x8 ? 2*389 : 53+720;
     `FBD_CH_PATH3.`DIMMPATH5.U07.handle = x8 ? 2*390 : 54+720;
     `FBD_CH_PATH3.`DIMMPATH5.U08.handle = x8 ? 2*391 : 55+720;
     `ifndef X8	     
     `FBD_CH_PATH3.`DIMMPATH5.U09.handle = 56+720;
     `FBD_CH_PATH3.`DIMMPATH5.U10.handle = 57+720;
     `FBD_CH_PATH3.`DIMMPATH5.U11.handle = 58+720;
     `FBD_CH_PATH3.`DIMMPATH5.U12.handle = 59+720;
     `FBD_CH_PATH3.`DIMMPATH5.U14.handle = 60+720;
     `FBD_CH_PATH3.`DIMMPATH5.U15.handle = 61+720;
     `FBD_CH_PATH3.`DIMMPATH5.U16.handle = 62+720;
     `FBD_CH_PATH3.`DIMMPATH5.U17.handle = 63+720;
     `endif
     `endif


     
     `FBD_CH_PATH4.`DIMMPATH5.U00.handle = x8 ? 2*392 : 64+720;
     `FBD_CH_PATH4.`DIMMPATH5.U01.handle = x8 ? 2*393 : 65+720;
     `FBD_CH_PATH4.`DIMMPATH5.U02.handle = x8 ? 2*394 : 66+720;
     `FBD_CH_PATH4.`DIMMPATH5.U03.handle = x8 ? 2*395 : 67+720;
     `FBD_CH_PATH4.`DIMMPATH5.U05.handle = x8 ? 2*396 : 68+720;
     `FBD_CH_PATH4.`DIMMPATH5.U06.handle = x8 ? 2*397 : 69+720;
     `FBD_CH_PATH4.`DIMMPATH5.U07.handle = x8 ? 2*398 : 70+720;
     `FBD_CH_PATH4.`DIMMPATH5.U08.handle = x8 ? 2*399 : 71+720;
     `ifndef X8	     
     `FBD_CH_PATH4.`DIMMPATH5.U09.handle = 72+720;
     `FBD_CH_PATH4.`DIMMPATH5.U10.handle = 73+720;
     `FBD_CH_PATH4.`DIMMPATH5.U11.handle = 74+720;
     `FBD_CH_PATH4.`DIMMPATH5.U12.handle = 75+720;
     `FBD_CH_PATH4.`DIMMPATH5.U14.handle = 76+720;
     `FBD_CH_PATH4.`DIMMPATH5.U15.handle = 77+720;
     `FBD_CH_PATH4.`DIMMPATH5.U16.handle = 78+720;
     `FBD_CH_PATH4.`DIMMPATH5.U17.handle = 79+720;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH5.`DIMMPATH5.U00.handle = x8 ? 2*400 : 80+720;
     `FBD_CH_PATH5.`DIMMPATH5.U01.handle = x8 ? 2*401 : 81+720;
     `FBD_CH_PATH5.`DIMMPATH5.U02.handle = x8 ? 2*402 : 82+720;
     `FBD_CH_PATH5.`DIMMPATH5.U03.handle = x8 ? 2*403 : 83+720;
     `FBD_CH_PATH5.`DIMMPATH5.U05.handle = x8 ? 2*404 : 84+720;
     `FBD_CH_PATH5.`DIMMPATH5.U06.handle = x8 ? 2*405 : 85+720;
     `FBD_CH_PATH5.`DIMMPATH5.U07.handle = x8 ? 2*406 : 86+720;
     `FBD_CH_PATH5.`DIMMPATH5.U08.handle = x8 ? 2*407 : 87+720;
     `ifndef X8	     
     `FBD_CH_PATH5.`DIMMPATH5.U09.handle = 88+720;
     `FBD_CH_PATH5.`DIMMPATH5.U10.handle = 89+720;
     `FBD_CH_PATH5.`DIMMPATH5.U11.handle = 90+720;
     `FBD_CH_PATH5.`DIMMPATH5.U12.handle = 91+720;
     `FBD_CH_PATH5.`DIMMPATH5.U14.handle = 92+720;
     `FBD_CH_PATH5.`DIMMPATH5.U15.handle = 93+720;
     `FBD_CH_PATH5.`DIMMPATH5.U16.handle = 94+720;
     `FBD_CH_PATH5.`DIMMPATH5.U17.handle = 95+720;
     `endif
     `endif


     
     `FBD_CH_PATH6.`DIMMPATH5.U00.handle = x8 ? 2*408 : 96+720;
     `FBD_CH_PATH6.`DIMMPATH5.U01.handle = x8 ? 2*409 : 97+720;
     `FBD_CH_PATH6.`DIMMPATH5.U02.handle = x8 ? 2*410 : 98+720;
     `FBD_CH_PATH6.`DIMMPATH5.U03.handle = x8 ? 2*411 : 99+720;
     `FBD_CH_PATH6.`DIMMPATH5.U05.handle = x8 ? 2*412 : 100+720;
     `FBD_CH_PATH6.`DIMMPATH5.U06.handle = x8 ? 2*413 : 101+720;
     `FBD_CH_PATH6.`DIMMPATH5.U07.handle = x8 ? 2*414 : 102+720;
     `FBD_CH_PATH6.`DIMMPATH5.U08.handle = x8 ? 2*415 : 103+720;
     `ifndef X8	     
     `FBD_CH_PATH6.`DIMMPATH5.U09.handle = 104+720;
     `FBD_CH_PATH6.`DIMMPATH5.U10.handle = 105+720;
     `FBD_CH_PATH6.`DIMMPATH5.U11.handle = 106+720;
     `FBD_CH_PATH6.`DIMMPATH5.U12.handle = 107+720;
     `FBD_CH_PATH6.`DIMMPATH5.U14.handle = 108+720;
     `FBD_CH_PATH6.`DIMMPATH5.U15.handle = 109+720;
     `FBD_CH_PATH6.`DIMMPATH5.U16.handle = 110+720;
     `FBD_CH_PATH6.`DIMMPATH5.U17.handle = 111+720;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH7.`DIMMPATH5.U00.handle = x8 ? 2*416 : 112+720;
     `FBD_CH_PATH7.`DIMMPATH5.U01.handle = x8 ? 2*417 : 113+720;
     `FBD_CH_PATH7.`DIMMPATH5.U02.handle = x8 ? 2*418 : 114+720;
     `FBD_CH_PATH7.`DIMMPATH5.U03.handle = x8 ? 2*419 : 115+720;
     `FBD_CH_PATH7.`DIMMPATH5.U05.handle = x8 ? 2*420 : 116+720;
     `FBD_CH_PATH7.`DIMMPATH5.U06.handle = x8 ? 2*421 : 117+720;
     `FBD_CH_PATH7.`DIMMPATH5.U07.handle = x8 ? 2*422 : 118+720;
     `FBD_CH_PATH7.`DIMMPATH5.U08.handle = x8 ? 2*423 : 119+720;
     `ifndef X8	     
     `FBD_CH_PATH7.`DIMMPATH5.U09.handle = 120+720;
     `FBD_CH_PATH7.`DIMMPATH5.U10.handle = 121+720;
     `FBD_CH_PATH7.`DIMMPATH5.U11.handle = 122+720;
     `FBD_CH_PATH7.`DIMMPATH5.U12.handle = 123+720;
     `FBD_CH_PATH7.`DIMMPATH5.U14.handle = 124+720;
     `FBD_CH_PATH7.`DIMMPATH5.U15.handle = 125+720;
     `FBD_CH_PATH7.`DIMMPATH5.U16.handle = 126+720;
     `FBD_CH_PATH7.`DIMMPATH5.U17.handle = 127+720;
     `endif
     `endif


     
     `FBD_CH_PATH0.`DIMMPATH5.U04.handle = x8 ? 2*424 : 128+720;
     `ifndef X8	     
     `FBD_CH_PATH0.`DIMMPATH5.U13.handle = 129+720;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH1.`DIMMPATH5.U04.handle = x8 ? 2*425 : 130+720;
     `ifndef X8	     
     `FBD_CH_PATH1.`DIMMPATH5.U13.handle = 131+720;
     `endif
     `endif


     `FBD_CH_PATH2.`DIMMPATH5.U04.handle = x8 ? 2*426 : 132+720;
     `ifndef X8	     
     `FBD_CH_PATH2.`DIMMPATH5.U13.handle = 133+720;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH3.`DIMMPATH5.U04.handle = x8 ? 2*427 : 134+720;
     `ifndef X8	     
     `FBD_CH_PATH3.`DIMMPATH5.U13.handle = 135+720;
     `endif
     `endif


     `FBD_CH_PATH4.`DIMMPATH5.U04.handle = x8 ? 2*428 : 136+720;
     `ifndef X8	     
     `FBD_CH_PATH4.`DIMMPATH5.U13.handle = 137+720;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH5.`DIMMPATH5.U04.handle = x8 ? 2*429 : 138+720;
     `ifndef X8	     
     `FBD_CH_PATH5.`DIMMPATH5.U13.handle = 139+720;
     `endif
     `endif


     `FBD_CH_PATH6.`DIMMPATH5.U04.handle = x8 ? 2*430 : 140+720;
     `ifndef X8	     
     `FBD_CH_PATH6.`DIMMPATH5.U13.handle = 141+720;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH7.`DIMMPATH5.U04.handle = x8 ? 2*431 : 142+720;
     `ifndef X8	     
     `FBD_CH_PATH7.`DIMMPATH5.U13.handle = 143+720;
     `endif
     `endif


        `ifdef DBL_SIDE

//start13
             `FBD_CH_PATH0.`RANK_DIMMPATH4.U00.handle = x8 ? 2*864 : 0+1728;
             `FBD_CH_PATH0.`RANK_DIMMPATH4.U01.handle = x8 ? 2*865 : 1+1728;
             `FBD_CH_PATH0.`RANK_DIMMPATH4.U02.handle = x8 ? 2*866 : 2+1728;
             `FBD_CH_PATH0.`RANK_DIMMPATH4.U03.handle = x8 ? 2*867 : 3+1728;
             `FBD_CH_PATH0.`RANK_DIMMPATH4.U05.handle = x8 ? 2*868 : 4+1728;
             `FBD_CH_PATH0.`RANK_DIMMPATH4.U06.handle = x8 ? 2*869 : 5+1728;
             `FBD_CH_PATH0.`RANK_DIMMPATH4.U07.handle = x8 ? 2*870 : 6+1728;
             `FBD_CH_PATH0.`RANK_DIMMPATH4.U08.handle = x8 ? 2*871 : 7+1728;
             `ifndef X8	     
             `FBD_CH_PATH0.`RANK_DIMMPATH4.U09.handle = 8+1728;
             `FBD_CH_PATH0.`RANK_DIMMPATH4.U10.handle = 9+1728;
             `FBD_CH_PATH0.`RANK_DIMMPATH4.U11.handle = 10+1728;
             `FBD_CH_PATH0.`RANK_DIMMPATH4.U12.handle = 11+1728;
             `FBD_CH_PATH0.`RANK_DIMMPATH4.U14.handle = 12+1728;
             `FBD_CH_PATH0.`RANK_DIMMPATH4.U15.handle = 13+1728;
             `FBD_CH_PATH0.`RANK_DIMMPATH4.U16.handle = 14+1728;
             `FBD_CH_PATH0.`RANK_DIMMPATH4.U17.handle = 15+1728;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH1.`RANK_DIMMPATH4.U00.handle = x8 ? 2*872 : 16+1728;
             `FBD_CH_PATH1.`RANK_DIMMPATH4.U01.handle = x8 ? 2*873 : 17+1728;
             `FBD_CH_PATH1.`RANK_DIMMPATH4.U02.handle = x8 ? 2*874 : 18+1728;
             `FBD_CH_PATH1.`RANK_DIMMPATH4.U03.handle = x8 ? 2*875 : 19+1728;
             `FBD_CH_PATH1.`RANK_DIMMPATH4.U05.handle = x8 ? 2*876 : 20+1728;
             `FBD_CH_PATH1.`RANK_DIMMPATH4.U06.handle = x8 ? 2*877 : 21+1728;
             `FBD_CH_PATH1.`RANK_DIMMPATH4.U07.handle = x8 ? 2*878 : 22+1728;
             `FBD_CH_PATH1.`RANK_DIMMPATH4.U08.handle = x8 ? 2*879 : 23+1728;
             `ifndef X8	     
             `FBD_CH_PATH1.`RANK_DIMMPATH4.U09.handle = 24+1728;
             `FBD_CH_PATH1.`RANK_DIMMPATH4.U10.handle = 25+1728;
             `FBD_CH_PATH1.`RANK_DIMMPATH4.U11.handle = 26+1728;
             `FBD_CH_PATH1.`RANK_DIMMPATH4.U12.handle = 27+1728;
             `FBD_CH_PATH1.`RANK_DIMMPATH4.U14.handle = 28+1728;
             `FBD_CH_PATH1.`RANK_DIMMPATH4.U15.handle = 29+1728;
             `FBD_CH_PATH1.`RANK_DIMMPATH4.U16.handle = 30+1728;
             `FBD_CH_PATH1.`RANK_DIMMPATH4.U17.handle = 31+1728;
             `endif
             `endif


             
             `FBD_CH_PATH2.`RANK_DIMMPATH4.U00.handle = x8 ? 2*880 : 32+1728;
             `FBD_CH_PATH2.`RANK_DIMMPATH4.U01.handle = x8 ? 2*881 : 33+1728;
             `FBD_CH_PATH2.`RANK_DIMMPATH4.U02.handle = x8 ? 2*882 : 34+1728;
             `FBD_CH_PATH2.`RANK_DIMMPATH4.U03.handle = x8 ? 2*883 : 35+1728;
             `FBD_CH_PATH2.`RANK_DIMMPATH4.U05.handle = x8 ? 2*884 : 36+1728;
             `FBD_CH_PATH2.`RANK_DIMMPATH4.U06.handle = x8 ? 2*885 : 37+1728;
             `FBD_CH_PATH2.`RANK_DIMMPATH4.U07.handle = x8 ? 2*886 : 38+1728;
             `FBD_CH_PATH2.`RANK_DIMMPATH4.U08.handle = x8 ? 2*887 :  39+1728;
             `ifndef X8	     
             `FBD_CH_PATH2.`RANK_DIMMPATH4.U09.handle = 40+1728;
             `FBD_CH_PATH2.`RANK_DIMMPATH4.U10.handle = 41+1728;
             `FBD_CH_PATH2.`RANK_DIMMPATH4.U11.handle = 42+1728;
             `FBD_CH_PATH2.`RANK_DIMMPATH4.U12.handle = 43+1728;
             `FBD_CH_PATH2.`RANK_DIMMPATH4.U14.handle = 44+1728;
             `FBD_CH_PATH2.`RANK_DIMMPATH4.U15.handle = 45+1728;
             `FBD_CH_PATH2.`RANK_DIMMPATH4.U16.handle = 46+1728;
             `FBD_CH_PATH2.`RANK_DIMMPATH4.U17.handle = 47+1728;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH3.`RANK_DIMMPATH4.U00.handle = x8 ? 2*888 : 48+1728;
             `FBD_CH_PATH3.`RANK_DIMMPATH4.U01.handle = x8 ? 2*889 : 49+1728;
             `FBD_CH_PATH3.`RANK_DIMMPATH4.U02.handle = x8 ? 2*890 : 50+1728;
             `FBD_CH_PATH3.`RANK_DIMMPATH4.U03.handle = x8 ? 2*891 : 51+1728;
             `FBD_CH_PATH3.`RANK_DIMMPATH4.U05.handle = x8 ? 2*892 : 52+1728;
             `FBD_CH_PATH3.`RANK_DIMMPATH4.U06.handle = x8 ? 2*893 : 53+1728;
             `FBD_CH_PATH3.`RANK_DIMMPATH4.U07.handle = x8 ? 2*894 : 54+1728;
             `FBD_CH_PATH3.`RANK_DIMMPATH4.U08.handle = x8 ? 2*895 : 55+1728;
             `ifndef X8	     
             `FBD_CH_PATH3.`RANK_DIMMPATH4.U09.handle = 56+1728;
             `FBD_CH_PATH3.`RANK_DIMMPATH4.U10.handle = 57+1728;
             `FBD_CH_PATH3.`RANK_DIMMPATH4.U11.handle = 58+1728;
             `FBD_CH_PATH3.`RANK_DIMMPATH4.U12.handle = 59+1728;
             `FBD_CH_PATH3.`RANK_DIMMPATH4.U14.handle = 60+1728;
             `FBD_CH_PATH3.`RANK_DIMMPATH4.U15.handle = 61+1728;
             `FBD_CH_PATH3.`RANK_DIMMPATH4.U16.handle = 62+1728;
             `FBD_CH_PATH3.`RANK_DIMMPATH4.U17.handle = 63+1728;
             `endif
             `endif


             
             `FBD_CH_PATH4.`RANK_DIMMPATH4.U00.handle = x8 ? 2*896 : 64+1728;
             `FBD_CH_PATH4.`RANK_DIMMPATH4.U01.handle = x8 ? 2*897 : 65+1728;
             `FBD_CH_PATH4.`RANK_DIMMPATH4.U02.handle = x8 ? 2*898 : 66+1728;
             `FBD_CH_PATH4.`RANK_DIMMPATH4.U03.handle = x8 ? 2*899 : 67+1728;
             `FBD_CH_PATH4.`RANK_DIMMPATH4.U05.handle = x8 ? 2*900 : 68+1728;
             `FBD_CH_PATH4.`RANK_DIMMPATH4.U06.handle = x8 ? 2*901 : 69+1728;
             `FBD_CH_PATH4.`RANK_DIMMPATH4.U07.handle = x8 ? 2*902 : 70+1728;
             `FBD_CH_PATH4.`RANK_DIMMPATH4.U08.handle = x8 ? 2*903 : 71+1728;
             `ifndef X8	     
             `FBD_CH_PATH4.`RANK_DIMMPATH4.U09.handle = 72+1728;
             `FBD_CH_PATH4.`RANK_DIMMPATH4.U10.handle = 73+1728;
             `FBD_CH_PATH4.`RANK_DIMMPATH4.U11.handle = 74+1728;
             `FBD_CH_PATH4.`RANK_DIMMPATH4.U12.handle = 75+1728;
             `FBD_CH_PATH4.`RANK_DIMMPATH4.U14.handle = 76+1728;
             `FBD_CH_PATH4.`RANK_DIMMPATH4.U15.handle = 77+1728;
             `FBD_CH_PATH4.`RANK_DIMMPATH4.U16.handle = 78+1728;
             `FBD_CH_PATH4.`RANK_DIMMPATH4.U17.handle = 79+1728;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH5.`RANK_DIMMPATH4.U00.handle = x8 ? 2*904 : 80+1728;
             `FBD_CH_PATH5.`RANK_DIMMPATH4.U01.handle = x8 ? 2*905 : 81+1728;
             `FBD_CH_PATH5.`RANK_DIMMPATH4.U02.handle = x8 ? 2*906 : 82+1728;
             `FBD_CH_PATH5.`RANK_DIMMPATH4.U03.handle = x8 ? 2*907 : 83+1728;
             `FBD_CH_PATH5.`RANK_DIMMPATH4.U05.handle = x8 ? 2*908 : 84+1728;
             `FBD_CH_PATH5.`RANK_DIMMPATH4.U06.handle = x8 ? 2*909 : 85+1728;
             `FBD_CH_PATH5.`RANK_DIMMPATH4.U07.handle = x8 ? 2*910 : 86+1728;
             `FBD_CH_PATH5.`RANK_DIMMPATH4.U08.handle = x8 ? 2*911 : 87+1728;
             `ifndef X8	     
             `FBD_CH_PATH5.`RANK_DIMMPATH4.U09.handle = 88+1728;
             `FBD_CH_PATH5.`RANK_DIMMPATH4.U10.handle = 89+1728;
             `FBD_CH_PATH5.`RANK_DIMMPATH4.U11.handle = 90+1728;
             `FBD_CH_PATH5.`RANK_DIMMPATH4.U12.handle = 91+1728;
             `FBD_CH_PATH5.`RANK_DIMMPATH4.U14.handle = 92+1728;
             `FBD_CH_PATH5.`RANK_DIMMPATH4.U15.handle = 93+1728;
             `FBD_CH_PATH5.`RANK_DIMMPATH4.U16.handle = 94+1728;
             `FBD_CH_PATH5.`RANK_DIMMPATH4.U17.handle = 95+1728;
             `endif
             `endif


             
             `FBD_CH_PATH6.`RANK_DIMMPATH4.U00.handle = x8 ? 2*912 : 96+1728;
             `FBD_CH_PATH6.`RANK_DIMMPATH4.U01.handle = x8 ? 2*913 : 97+1728;
             `FBD_CH_PATH6.`RANK_DIMMPATH4.U02.handle = x8 ? 2*914 : 98+1728;
             `FBD_CH_PATH6.`RANK_DIMMPATH4.U03.handle = x8 ? 2*915 : 99+1728;
             `FBD_CH_PATH6.`RANK_DIMMPATH4.U05.handle = x8 ? 2*916 : 100+1728;
             `FBD_CH_PATH6.`RANK_DIMMPATH4.U06.handle = x8 ? 2*917 : 101+1728;
             `FBD_CH_PATH6.`RANK_DIMMPATH4.U07.handle = x8 ? 2*918 : 102+1728;
             `FBD_CH_PATH6.`RANK_DIMMPATH4.U08.handle = x8 ? 2*919 : 103+1728;
             `ifndef X8	     
             `FBD_CH_PATH6.`RANK_DIMMPATH4.U09.handle = 104+1728;
             `FBD_CH_PATH6.`RANK_DIMMPATH4.U10.handle = 105+1728;
             `FBD_CH_PATH6.`RANK_DIMMPATH4.U11.handle = 106+1728;
             `FBD_CH_PATH6.`RANK_DIMMPATH4.U12.handle = 107+1728;
             `FBD_CH_PATH6.`RANK_DIMMPATH4.U14.handle = 108+1728;
             `FBD_CH_PATH6.`RANK_DIMMPATH4.U15.handle = 109+1728;
             `FBD_CH_PATH6.`RANK_DIMMPATH4.U16.handle = 110+1728;
             `FBD_CH_PATH6.`RANK_DIMMPATH4.U17.handle = 111+1728;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH7.`RANK_DIMMPATH4.U00.handle = x8 ? 2*920 : 112+1728;
             `FBD_CH_PATH7.`RANK_DIMMPATH4.U01.handle = x8 ? 2*921 : 113+1728;
             `FBD_CH_PATH7.`RANK_DIMMPATH4.U02.handle = x8 ? 2*922 : 114+1728;
             `FBD_CH_PATH7.`RANK_DIMMPATH4.U03.handle = x8 ? 2*923 : 115+1728;
             `FBD_CH_PATH7.`RANK_DIMMPATH4.U05.handle = x8 ? 2*924 : 116+1728;
             `FBD_CH_PATH7.`RANK_DIMMPATH4.U06.handle = x8 ? 2*925 : 117+1728;
             `FBD_CH_PATH7.`RANK_DIMMPATH4.U07.handle = x8 ? 2*926 : 118+1728;
             `FBD_CH_PATH7.`RANK_DIMMPATH4.U08.handle = x8 ? 2*927 : 119+1728;
             `ifndef X8	     
             `FBD_CH_PATH7.`RANK_DIMMPATH4.U09.handle = 120+1728;
             `FBD_CH_PATH7.`RANK_DIMMPATH4.U10.handle = 121+1728;
             `FBD_CH_PATH7.`RANK_DIMMPATH4.U11.handle = 122+1728;
             `FBD_CH_PATH7.`RANK_DIMMPATH4.U12.handle = 123+1728;
             `FBD_CH_PATH7.`RANK_DIMMPATH4.U14.handle = 124+1728;
             `FBD_CH_PATH7.`RANK_DIMMPATH4.U15.handle = 125+1728;
             `FBD_CH_PATH7.`RANK_DIMMPATH4.U16.handle = 126+1728;
             `FBD_CH_PATH7.`RANK_DIMMPATH4.U17.handle = 127+1728;
             `endif
             `endif


             
             `FBD_CH_PATH0.`RANK_DIMMPATH4.U04.handle = x8 ? 2*928 : 128+1728;
             `ifndef X8	     
             `FBD_CH_PATH0.`RANK_DIMMPATH4.U13.handle = 129+1728;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH1.`RANK_DIMMPATH4.U04.handle = x8 ? 2*929 : 130+1728;
             `ifndef X8	     
             `FBD_CH_PATH1.`RANK_DIMMPATH4.U13.handle = 131+1728;
             `endif
             `endif


             `FBD_CH_PATH2.`RANK_DIMMPATH4.U04.handle = x8 ? 2*930 : 132+1728;
             `ifndef X8	     
             `FBD_CH_PATH2.`RANK_DIMMPATH4.U13.handle = 133+1728;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH3.`RANK_DIMMPATH4.U04.handle = x8 ? 2*931 : 134+1728;
             `ifndef X8	     
             `FBD_CH_PATH3.`RANK_DIMMPATH4.U13.handle = 135+1728;
             `endif
             `endif


             `FBD_CH_PATH4.`RANK_DIMMPATH4.U04.handle = x8 ? 2*932 : 136+1728;
             `ifndef X8	     
             `FBD_CH_PATH4.`RANK_DIMMPATH4.U13.handle = 137+1728;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH5.`RANK_DIMMPATH4.U04.handle = x8 ? 2*933 : 138+1728;
             `ifndef X8	     
             `FBD_CH_PATH5.`RANK_DIMMPATH4.U13.handle = 139+1728;
             `endif
             `endif


             `FBD_CH_PATH6.`RANK_DIMMPATH4.U04.handle = x8 ? 2*934 : 140+1728;
             `ifndef X8	     
             `FBD_CH_PATH6.`RANK_DIMMPATH4.U13.handle = 141+1728;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH7.`RANK_DIMMPATH4.U04.handle = x8 ? 2*935 : 142+1728;
             `ifndef X8	     
             `FBD_CH_PATH7.`RANK_DIMMPATH4.U13.handle = 143+1728;
             `endif
             `endif


             
//start14
             `FBD_CH_PATH0.`RANK_DIMMPATH5.U00.handle = x8 ? 2*936 : 0+1872;
             `FBD_CH_PATH0.`RANK_DIMMPATH5.U01.handle = x8 ? 2*937 : 1+1872;
             `FBD_CH_PATH0.`RANK_DIMMPATH5.U02.handle = x8 ? 2*938 : 2+1872;
             `FBD_CH_PATH0.`RANK_DIMMPATH5.U03.handle = x8 ? 2*939 : 3+1872;
             `FBD_CH_PATH0.`RANK_DIMMPATH5.U05.handle = x8 ? 2*940 : 4+1872;
             `FBD_CH_PATH0.`RANK_DIMMPATH5.U06.handle = x8 ? 2*941 : 5+1872;
             `FBD_CH_PATH0.`RANK_DIMMPATH5.U07.handle = x8 ? 2*942 : 6+1872;
             `FBD_CH_PATH0.`RANK_DIMMPATH5.U08.handle = x8 ? 2*943 : 7+1872;
             `ifndef X8	     
             `FBD_CH_PATH0.`RANK_DIMMPATH5.U09.handle = 8+1872;
             `FBD_CH_PATH0.`RANK_DIMMPATH5.U10.handle = 9+1872;
             `FBD_CH_PATH0.`RANK_DIMMPATH5.U11.handle = 10+1872;
             `FBD_CH_PATH0.`RANK_DIMMPATH5.U12.handle = 11+1872;
             `FBD_CH_PATH0.`RANK_DIMMPATH5.U14.handle = 12+1872;
             `FBD_CH_PATH0.`RANK_DIMMPATH5.U15.handle = 13+1872;
             `FBD_CH_PATH0.`RANK_DIMMPATH5.U16.handle = 14+1872;
             `FBD_CH_PATH0.`RANK_DIMMPATH5.U17.handle = 15+1872;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH1.`RANK_DIMMPATH5.U00.handle = x8 ? 2*944 : 16+1872;
             `FBD_CH_PATH1.`RANK_DIMMPATH5.U01.handle = x8 ? 2*945 : 17+1872;
             `FBD_CH_PATH1.`RANK_DIMMPATH5.U02.handle = x8 ? 2*946 : 18+1872;
             `FBD_CH_PATH1.`RANK_DIMMPATH5.U03.handle = x8 ? 2*947 : 19+1872;
             `FBD_CH_PATH1.`RANK_DIMMPATH5.U05.handle = x8 ? 2*948 : 20+1872;
             `FBD_CH_PATH1.`RANK_DIMMPATH5.U06.handle = x8 ? 2*949 : 21+1872;
             `FBD_CH_PATH1.`RANK_DIMMPATH5.U07.handle = x8 ? 2*950 : 22+1872;
             `FBD_CH_PATH1.`RANK_DIMMPATH5.U08.handle = x8 ? 2*951 : 23+1872;
             `ifndef X8	     
             `FBD_CH_PATH1.`RANK_DIMMPATH5.U09.handle = 24+1872;
             `FBD_CH_PATH1.`RANK_DIMMPATH5.U10.handle = 25+1872;
             `FBD_CH_PATH1.`RANK_DIMMPATH5.U11.handle = 26+1872;
             `FBD_CH_PATH1.`RANK_DIMMPATH5.U12.handle = 27+1872;
             `FBD_CH_PATH1.`RANK_DIMMPATH5.U14.handle = 28+1872;
             `FBD_CH_PATH1.`RANK_DIMMPATH5.U15.handle = 29+1872;
             `FBD_CH_PATH1.`RANK_DIMMPATH5.U16.handle = 30+1872;
             `FBD_CH_PATH1.`RANK_DIMMPATH5.U17.handle = 31+1872;
             `endif
             `endif


             
             `FBD_CH_PATH2.`RANK_DIMMPATH5.U00.handle = x8 ? 2*952 : 32+1872;
             `FBD_CH_PATH2.`RANK_DIMMPATH5.U01.handle = x8 ? 2*953 : 33+1872;
             `FBD_CH_PATH2.`RANK_DIMMPATH5.U02.handle = x8 ? 2*954 : 34+1872;
             `FBD_CH_PATH2.`RANK_DIMMPATH5.U03.handle = x8 ? 2*955 : 35+1872;
             `FBD_CH_PATH2.`RANK_DIMMPATH5.U05.handle = x8 ? 2*956 : 36+1872;
             `FBD_CH_PATH2.`RANK_DIMMPATH5.U06.handle = x8 ? 2*957 : 37+1872;
             `FBD_CH_PATH2.`RANK_DIMMPATH5.U07.handle = x8 ? 2*958 : 38+1872;
             `FBD_CH_PATH2.`RANK_DIMMPATH5.U08.handle = x8 ? 2*959 : 39+1872;
             `ifndef X8	     
             `FBD_CH_PATH2.`RANK_DIMMPATH5.U09.handle = 40+1872;
             `FBD_CH_PATH2.`RANK_DIMMPATH5.U10.handle = 41+1872;
             `FBD_CH_PATH2.`RANK_DIMMPATH5.U11.handle = 42+1872;
             `FBD_CH_PATH2.`RANK_DIMMPATH5.U12.handle = 43+1872;
             `FBD_CH_PATH2.`RANK_DIMMPATH5.U14.handle = 44+1872;
             `FBD_CH_PATH2.`RANK_DIMMPATH5.U15.handle = 45+1872;
             `FBD_CH_PATH2.`RANK_DIMMPATH5.U16.handle = 46+1872;
             `FBD_CH_PATH2.`RANK_DIMMPATH5.U17.handle = 47+1872;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH3.`RANK_DIMMPATH5.U00.handle = x8 ? 2*960 : 48+1872;
             `FBD_CH_PATH3.`RANK_DIMMPATH5.U01.handle = x8 ? 2*961 : 49+1872;
             `FBD_CH_PATH3.`RANK_DIMMPATH5.U02.handle = x8 ? 2*962 : 50+1872;
             `FBD_CH_PATH3.`RANK_DIMMPATH5.U03.handle = x8 ? 2*963 : 51+1872;
             `FBD_CH_PATH3.`RANK_DIMMPATH5.U05.handle = x8 ? 2*964 : 52+1872;
             `FBD_CH_PATH3.`RANK_DIMMPATH5.U06.handle = x8 ? 2*965 : 53+1872;
             `FBD_CH_PATH3.`RANK_DIMMPATH5.U07.handle = x8 ? 2*966 : 54+1872;
             `FBD_CH_PATH3.`RANK_DIMMPATH5.U08.handle = x8 ? 2*967 : 55+1872;
             `ifndef X8	     
             `FBD_CH_PATH3.`RANK_DIMMPATH5.U09.handle = 56+1872;
             `FBD_CH_PATH3.`RANK_DIMMPATH5.U10.handle = 57+1872;
             `FBD_CH_PATH3.`RANK_DIMMPATH5.U11.handle = 58+1872;
             `FBD_CH_PATH3.`RANK_DIMMPATH5.U12.handle = 59+1872;
             `FBD_CH_PATH3.`RANK_DIMMPATH5.U14.handle = 60+1872;
             `FBD_CH_PATH3.`RANK_DIMMPATH5.U15.handle = 61+1872;
             `FBD_CH_PATH3.`RANK_DIMMPATH5.U16.handle = 62+1872;
             `FBD_CH_PATH3.`RANK_DIMMPATH5.U17.handle = 63+1872;
             `endif
             `endif


             
             `FBD_CH_PATH4.`RANK_DIMMPATH5.U00.handle = x8 ? 2*968 : 64+1872;
             `FBD_CH_PATH4.`RANK_DIMMPATH5.U01.handle = x8 ? 2*969 : 65+1872;
             `FBD_CH_PATH4.`RANK_DIMMPATH5.U02.handle = x8 ? 2*970 : 66+1872;
             `FBD_CH_PATH4.`RANK_DIMMPATH5.U03.handle = x8 ? 2*971 : 67+1872;
             `FBD_CH_PATH4.`RANK_DIMMPATH5.U05.handle = x8 ? 2*972 : 68+1872;
             `FBD_CH_PATH4.`RANK_DIMMPATH5.U06.handle = x8 ? 2*973 : 69+1872;
             `FBD_CH_PATH4.`RANK_DIMMPATH5.U07.handle = x8 ? 2*974 : 70+1872;
             `FBD_CH_PATH4.`RANK_DIMMPATH5.U08.handle = x8 ? 2*975 : 71+1872;
             `ifndef X8	     
             `FBD_CH_PATH4.`RANK_DIMMPATH5.U09.handle = 72+1872;
             `FBD_CH_PATH4.`RANK_DIMMPATH5.U10.handle = 73+1872;
             `FBD_CH_PATH4.`RANK_DIMMPATH5.U11.handle = 74+1872;
             `FBD_CH_PATH4.`RANK_DIMMPATH5.U12.handle = 75+1872;
             `FBD_CH_PATH4.`RANK_DIMMPATH5.U14.handle = 76+1872;
             `FBD_CH_PATH4.`RANK_DIMMPATH5.U15.handle = 77+1872;
             `FBD_CH_PATH4.`RANK_DIMMPATH5.U16.handle = 78+1872;
             `FBD_CH_PATH4.`RANK_DIMMPATH5.U17.handle = 79+1872;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH5.`RANK_DIMMPATH5.U00.handle = x8 ? 2*976 : 80+1872;
             `FBD_CH_PATH5.`RANK_DIMMPATH5.U01.handle = x8 ? 2*977 : 81+1872;
             `FBD_CH_PATH5.`RANK_DIMMPATH5.U02.handle = x8 ? 2*978 : 82+1872;
             `FBD_CH_PATH5.`RANK_DIMMPATH5.U03.handle = x8 ? 2*979 : 83+1872;
             `FBD_CH_PATH5.`RANK_DIMMPATH5.U05.handle = x8 ? 2*980 : 84+1872;
             `FBD_CH_PATH5.`RANK_DIMMPATH5.U06.handle = x8 ? 2*981 : 85+1872;
             `FBD_CH_PATH5.`RANK_DIMMPATH5.U07.handle = x8 ? 2*982 : 86+1872;
             `FBD_CH_PATH5.`RANK_DIMMPATH5.U08.handle = x8 ? 2*983 : 87+1872;
             `ifndef X8	     
             `FBD_CH_PATH5.`RANK_DIMMPATH5.U09.handle = 88+1872;
             `FBD_CH_PATH5.`RANK_DIMMPATH5.U10.handle = 89+1872;
             `FBD_CH_PATH5.`RANK_DIMMPATH5.U11.handle = 90+1872;
             `FBD_CH_PATH5.`RANK_DIMMPATH5.U12.handle = 91+1872;
             `FBD_CH_PATH5.`RANK_DIMMPATH5.U14.handle = 92+1872;
             `FBD_CH_PATH5.`RANK_DIMMPATH5.U15.handle = 93+1872;
             `FBD_CH_PATH5.`RANK_DIMMPATH5.U16.handle = 94+1872;
             `FBD_CH_PATH5.`RANK_DIMMPATH5.U17.handle = 95+1872;
             `endif
             `endif


             
             `FBD_CH_PATH6.`RANK_DIMMPATH5.U00.handle = x8 ? 2*984 : 96+1872;
             `FBD_CH_PATH6.`RANK_DIMMPATH5.U01.handle = x8 ? 2*985 : 97+1872;
             `FBD_CH_PATH6.`RANK_DIMMPATH5.U02.handle = x8 ? 2*986 : 98+1872;
             `FBD_CH_PATH6.`RANK_DIMMPATH5.U03.handle = x8 ? 2*987 : 99+1872;
             `FBD_CH_PATH6.`RANK_DIMMPATH5.U05.handle = x8 ? 2*988 : 100+1872;
             `FBD_CH_PATH6.`RANK_DIMMPATH5.U06.handle = x8 ? 2*989 : 101+1872;
             `FBD_CH_PATH6.`RANK_DIMMPATH5.U07.handle = x8 ? 2*990 : 102+1872;
             `FBD_CH_PATH6.`RANK_DIMMPATH5.U08.handle = x8 ? 2*991 : 103+1872;
             `ifndef X8	     
             `FBD_CH_PATH6.`RANK_DIMMPATH5.U09.handle = 104+1872;
             `FBD_CH_PATH6.`RANK_DIMMPATH5.U10.handle = 105+1872;
             `FBD_CH_PATH6.`RANK_DIMMPATH5.U11.handle = 106+1872;
             `FBD_CH_PATH6.`RANK_DIMMPATH5.U12.handle = 107+1872;
             `FBD_CH_PATH6.`RANK_DIMMPATH5.U14.handle = 108+1872;
             `FBD_CH_PATH6.`RANK_DIMMPATH5.U15.handle = 109+1872;
             `FBD_CH_PATH6.`RANK_DIMMPATH5.U16.handle = 110+1872;
             `FBD_CH_PATH6.`RANK_DIMMPATH5.U17.handle = 111+1872;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH7.`RANK_DIMMPATH5.U00.handle = x8 ? 2*992 : 112+1872;
             `FBD_CH_PATH7.`RANK_DIMMPATH5.U01.handle = x8 ? 2*993 : 113+1872;
             `FBD_CH_PATH7.`RANK_DIMMPATH5.U02.handle = x8 ? 2*994 : 114+1872;
             `FBD_CH_PATH7.`RANK_DIMMPATH5.U03.handle = x8 ? 2*995 : 115+1872;
             `FBD_CH_PATH7.`RANK_DIMMPATH5.U05.handle = x8 ? 2*996 : 116+1872;
             `FBD_CH_PATH7.`RANK_DIMMPATH5.U06.handle = x8 ? 2*997 : 117+1872;
             `FBD_CH_PATH7.`RANK_DIMMPATH5.U07.handle = x8 ? 2*998 : 118+1872;
             `FBD_CH_PATH7.`RANK_DIMMPATH5.U08.handle = x8 ? 2*999 : 119+1872;
             `ifndef X8	     
             `FBD_CH_PATH7.`RANK_DIMMPATH5.U09.handle = 120+1872;
             `FBD_CH_PATH7.`RANK_DIMMPATH5.U10.handle = 121+1872;
             `FBD_CH_PATH7.`RANK_DIMMPATH5.U11.handle = 122+1872;
             `FBD_CH_PATH7.`RANK_DIMMPATH5.U12.handle = 123+1872;
             `FBD_CH_PATH7.`RANK_DIMMPATH5.U14.handle = 124+1872;
             `FBD_CH_PATH7.`RANK_DIMMPATH5.U15.handle = 125+1872;
             `FBD_CH_PATH7.`RANK_DIMMPATH5.U16.handle = 126+1872;
             `FBD_CH_PATH7.`RANK_DIMMPATH5.U17.handle = 127+1872;
             `endif
             `endif


             
             `FBD_CH_PATH0.`RANK_DIMMPATH5.U04.handle = x8 ? 2*1000 : 128+1872;
             `ifndef X8	     
             `FBD_CH_PATH0.`RANK_DIMMPATH5.U13.handle = 129+1872;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH1.`RANK_DIMMPATH5.U04.handle = x8 ? 2*1001 : 130+1872;
             `ifndef X8	     
             `FBD_CH_PATH1.`RANK_DIMMPATH5.U13.handle = 131+1872;
             `endif
             `endif


             `FBD_CH_PATH2.`RANK_DIMMPATH5.U04.handle = x8 ? 2*1002 : 132+1872;
             `ifndef X8	     
             `FBD_CH_PATH2.`RANK_DIMMPATH5.U13.handle = 133+1872;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH3.`RANK_DIMMPATH5.U04.handle = x8 ? 2*1003 : 134+1872;
             `ifndef X8	     
             `FBD_CH_PATH3.`RANK_DIMMPATH5.U13.handle = 135+1872;
             `endif
             `endif


             `FBD_CH_PATH4.`RANK_DIMMPATH5.U04.handle = x8 ? 2*1004 : 136+1872;
             `ifndef X8	     
             `FBD_CH_PATH4.`RANK_DIMMPATH5.U13.handle = 137+1872;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH5.`RANK_DIMMPATH5.U04.handle = x8 ? 2*1005 : 138+1872;
             `ifndef X8	     
             `FBD_CH_PATH5.`RANK_DIMMPATH5.U13.handle = 139+1872;
             `endif
             `endif


             `FBD_CH_PATH6.`RANK_DIMMPATH5.U04.handle = x8 ? 2*1006 : 140+1872;
             `ifndef X8	     
             `FBD_CH_PATH6.`RANK_DIMMPATH5.U13.handle = 141+1872;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH7.`RANK_DIMMPATH5.U04.handle = x8 ? 2*1007 : 142+1872;
             `ifndef X8	     
             `FBD_CH_PATH7.`RANK_DIMMPATH5.U13.handle = 143+1872;
             `endif
             `endif


        `endif 

     `endif 

     `ifdef FBD_8
     
//start7
     `FBD_CH_PATH0.`DIMMPATH6.U00.handle = x8 ? 2*432 : 0+864;
     `FBD_CH_PATH0.`DIMMPATH6.U01.handle = x8 ? 2*433 : 1+864;
     `FBD_CH_PATH0.`DIMMPATH6.U02.handle = x8 ? 2*434 : 2+864;
     `FBD_CH_PATH0.`DIMMPATH6.U03.handle = x8 ? 2*435 : 3+864;
     `FBD_CH_PATH0.`DIMMPATH6.U05.handle = x8 ? 2*436 : 4+864;
     `FBD_CH_PATH0.`DIMMPATH6.U06.handle = x8 ? 2*437 : 5+864;
     `FBD_CH_PATH0.`DIMMPATH6.U07.handle = x8 ? 2*438 : 6+864;
     `FBD_CH_PATH0.`DIMMPATH6.U08.handle = x8 ? 2*439 : 7+864;
     `ifndef X8	     
     `FBD_CH_PATH0.`DIMMPATH6.U09.handle = 8+864;
     `FBD_CH_PATH0.`DIMMPATH6.U10.handle = 9+864;
     `FBD_CH_PATH0.`DIMMPATH6.U11.handle = 10+864;
     `FBD_CH_PATH0.`DIMMPATH6.U12.handle = 11+864;
     `FBD_CH_PATH0.`DIMMPATH6.U14.handle = 12+864;
     `FBD_CH_PATH0.`DIMMPATH6.U15.handle = 13+864;
     `FBD_CH_PATH0.`DIMMPATH6.U16.handle = 14+864;
     `FBD_CH_PATH0.`DIMMPATH6.U17.handle = 15+864;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH1.`DIMMPATH6.U00.handle = x8 ? 2*440 : 16+864;
     `FBD_CH_PATH1.`DIMMPATH6.U01.handle = x8 ? 2*441 : 17+864;
     `FBD_CH_PATH1.`DIMMPATH6.U02.handle = x8 ? 2*442 : 18+864;
     `FBD_CH_PATH1.`DIMMPATH6.U03.handle = x8 ? 2*443 : 19+864;
     `FBD_CH_PATH1.`DIMMPATH6.U05.handle = x8 ? 2*444 : 20+864;
     `FBD_CH_PATH1.`DIMMPATH6.U06.handle = x8 ? 2*445 : 21+864;
     `FBD_CH_PATH1.`DIMMPATH6.U07.handle = x8 ? 2*446 : 22+864;
     `FBD_CH_PATH1.`DIMMPATH6.U08.handle = x8 ? 2*447 : 23+864;
     `ifndef X8	     
     `FBD_CH_PATH1.`DIMMPATH6.U09.handle = 24+864;
     `FBD_CH_PATH1.`DIMMPATH6.U10.handle = 25+864;
     `FBD_CH_PATH1.`DIMMPATH6.U11.handle = 26+864;
     `FBD_CH_PATH1.`DIMMPATH6.U12.handle = 27+864;
     `FBD_CH_PATH1.`DIMMPATH6.U14.handle = 28+864;
     `FBD_CH_PATH1.`DIMMPATH6.U15.handle = 29+864;
     `FBD_CH_PATH1.`DIMMPATH6.U16.handle = 30+864;
     `FBD_CH_PATH1.`DIMMPATH6.U17.handle = 31+864;
     `endif
     `endif


     
     `FBD_CH_PATH2.`DIMMPATH6.U00.handle = x8 ? 2*448 : 32+864;
     `FBD_CH_PATH2.`DIMMPATH6.U01.handle = x8 ? 2*449 : 33+864;
     `FBD_CH_PATH2.`DIMMPATH6.U02.handle = x8 ? 2*450 : 34+864;
     `FBD_CH_PATH2.`DIMMPATH6.U03.handle = x8 ? 2*451 : 35+864;
     `FBD_CH_PATH2.`DIMMPATH6.U05.handle = x8 ? 2*452 : 36+864;
     `FBD_CH_PATH2.`DIMMPATH6.U06.handle = x8 ? 2*453 : 37+864;
     `FBD_CH_PATH2.`DIMMPATH6.U07.handle = x8 ? 2*454 : 38+864;
     `FBD_CH_PATH2.`DIMMPATH6.U08.handle = x8 ? 2*455 : 39+864;
     `ifndef X8	     
     `FBD_CH_PATH2.`DIMMPATH6.U09.handle = 40+864;
     `FBD_CH_PATH2.`DIMMPATH6.U10.handle = 41+864;
     `FBD_CH_PATH2.`DIMMPATH6.U11.handle = 42+864;
     `FBD_CH_PATH2.`DIMMPATH6.U12.handle = 43+864;
     `FBD_CH_PATH2.`DIMMPATH6.U14.handle = 44+864;
     `FBD_CH_PATH2.`DIMMPATH6.U15.handle = 45+864;
     `FBD_CH_PATH2.`DIMMPATH6.U16.handle = 46+864;
     `FBD_CH_PATH2.`DIMMPATH6.U17.handle = 47+864;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH3.`DIMMPATH6.U00.handle = x8 ? 2*456 : 48+864;
     `FBD_CH_PATH3.`DIMMPATH6.U01.handle = x8 ? 2*457 : 49+864;
     `FBD_CH_PATH3.`DIMMPATH6.U02.handle = x8 ? 2*458 : 50+864;
     `FBD_CH_PATH3.`DIMMPATH6.U03.handle = x8 ? 2*459 : 51+864;
     `FBD_CH_PATH3.`DIMMPATH6.U05.handle = x8 ? 2*460 : 52+864;
     `FBD_CH_PATH3.`DIMMPATH6.U06.handle = x8 ? 2*461 : 53+864;
     `FBD_CH_PATH3.`DIMMPATH6.U07.handle = x8 ? 2*462 : 54+864;
     `FBD_CH_PATH3.`DIMMPATH6.U08.handle = x8 ? 2*463 : 55+864;
     `ifndef X8	     
     `FBD_CH_PATH3.`DIMMPATH6.U09.handle = 56+864;
     `FBD_CH_PATH3.`DIMMPATH6.U10.handle = 57+864;
     `FBD_CH_PATH3.`DIMMPATH6.U11.handle = 58+864;
     `FBD_CH_PATH3.`DIMMPATH6.U12.handle = 59+864;
     `FBD_CH_PATH3.`DIMMPATH6.U14.handle = 60+864;
     `FBD_CH_PATH3.`DIMMPATH6.U15.handle = 61+864;
     `FBD_CH_PATH3.`DIMMPATH6.U16.handle = 62+864;
     `FBD_CH_PATH3.`DIMMPATH6.U17.handle = 63+864;
     `endif
     `endif


     
     `FBD_CH_PATH4.`DIMMPATH6.U00.handle = x8 ? 2*464 : 64+864;
     `FBD_CH_PATH4.`DIMMPATH6.U01.handle = x8 ? 2*465 : 65+864;
     `FBD_CH_PATH4.`DIMMPATH6.U02.handle = x8 ? 2*466 : 66+864;
     `FBD_CH_PATH4.`DIMMPATH6.U03.handle = x8 ? 2*467 : 67+864;
     `FBD_CH_PATH4.`DIMMPATH6.U05.handle = x8 ? 2*468 : 68+864;
     `FBD_CH_PATH4.`DIMMPATH6.U06.handle = x8 ? 2*469 : 69+864;
     `FBD_CH_PATH4.`DIMMPATH6.U07.handle = x8 ? 2*470 : 70+864;
     `FBD_CH_PATH4.`DIMMPATH6.U08.handle = x8 ? 2*471 : 71+864;
     `ifndef X8	     
     `FBD_CH_PATH4.`DIMMPATH6.U09.handle = 72+864;
     `FBD_CH_PATH4.`DIMMPATH6.U10.handle = 73+864;
     `FBD_CH_PATH4.`DIMMPATH6.U11.handle = 74+864;
     `FBD_CH_PATH4.`DIMMPATH6.U12.handle = 75+864;
     `FBD_CH_PATH4.`DIMMPATH6.U14.handle = 76+864;
     `FBD_CH_PATH4.`DIMMPATH6.U15.handle = 77+864;
     `FBD_CH_PATH4.`DIMMPATH6.U16.handle = 78+864;
     `FBD_CH_PATH4.`DIMMPATH6.U17.handle = 79+864;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH5.`DIMMPATH6.U00.handle = x8 ? 2*472 : 80+864;
     `FBD_CH_PATH5.`DIMMPATH6.U01.handle = x8 ? 2*473 : 81+864;
     `FBD_CH_PATH5.`DIMMPATH6.U02.handle = x8 ? 2*474 : 82+864;
     `FBD_CH_PATH5.`DIMMPATH6.U03.handle = x8 ? 2*475 : 83+864;
     `FBD_CH_PATH5.`DIMMPATH6.U05.handle = x8 ? 2*476 : 84+864;
     `FBD_CH_PATH5.`DIMMPATH6.U06.handle = x8 ? 2*477 : 85+864;
     `FBD_CH_PATH5.`DIMMPATH6.U07.handle = x8 ? 2*478 : 86+864;
     `FBD_CH_PATH5.`DIMMPATH6.U08.handle = x8 ? 2*479 : 87+864;
     `ifndef X8	     
     `FBD_CH_PATH5.`DIMMPATH6.U09.handle = 88+864;
     `FBD_CH_PATH5.`DIMMPATH6.U10.handle = 89+864;
     `FBD_CH_PATH5.`DIMMPATH6.U11.handle = 90+864;
     `FBD_CH_PATH5.`DIMMPATH6.U12.handle = 91+864;
     `FBD_CH_PATH5.`DIMMPATH6.U14.handle = 92+864;
     `FBD_CH_PATH5.`DIMMPATH6.U15.handle = 93+864;
     `FBD_CH_PATH5.`DIMMPATH6.U16.handle = 94+864;
     `FBD_CH_PATH5.`DIMMPATH6.U17.handle = 95+864;
     `endif
     `endif


     
     `FBD_CH_PATH6.`DIMMPATH6.U00.handle = x8 ? 2*480 : 96+864;
     `FBD_CH_PATH6.`DIMMPATH6.U01.handle = x8 ? 2*481 : 97+864;
     `FBD_CH_PATH6.`DIMMPATH6.U02.handle = x8 ? 2*482 : 98+864;
     `FBD_CH_PATH6.`DIMMPATH6.U03.handle = x8 ? 2*483 : 99+864;
     `FBD_CH_PATH6.`DIMMPATH6.U05.handle = x8 ? 2*484 : 100+864;
     `FBD_CH_PATH6.`DIMMPATH6.U06.handle = x8 ? 2*485 : 101+864;
     `FBD_CH_PATH6.`DIMMPATH6.U07.handle = x8 ? 2*486 : 102+864;
     `FBD_CH_PATH6.`DIMMPATH6.U08.handle = x8 ? 2*487 : 103+864;
     `ifndef X8	     
     `FBD_CH_PATH6.`DIMMPATH6.U09.handle = 104+864;
     `FBD_CH_PATH6.`DIMMPATH6.U10.handle = 105+864;
     `FBD_CH_PATH6.`DIMMPATH6.U11.handle = 106+864;
     `FBD_CH_PATH6.`DIMMPATH6.U12.handle = 107+864;
     `FBD_CH_PATH6.`DIMMPATH6.U14.handle = 108+864;
     `FBD_CH_PATH6.`DIMMPATH6.U15.handle = 109+864;
     `FBD_CH_PATH6.`DIMMPATH6.U16.handle = 110+864;
     `FBD_CH_PATH6.`DIMMPATH6.U17.handle = 111+864;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH7.`DIMMPATH6.U00.handle = x8 ? 2*488 : 112+864;
     `FBD_CH_PATH7.`DIMMPATH6.U01.handle = x8 ? 2*489 : 113+864;
     `FBD_CH_PATH7.`DIMMPATH6.U02.handle = x8 ? 2*490 : 114+864;
     `FBD_CH_PATH7.`DIMMPATH6.U03.handle = x8 ? 2*491 : 115+864;
     `FBD_CH_PATH7.`DIMMPATH6.U05.handle = x8 ? 2*492 : 116+864;
     `FBD_CH_PATH7.`DIMMPATH6.U06.handle = x8 ? 2*493 : 117+864;
     `FBD_CH_PATH7.`DIMMPATH6.U07.handle = x8 ? 2*494 : 118+864;
     `FBD_CH_PATH7.`DIMMPATH6.U08.handle = x8 ? 2*495 : 119+864;
     `ifndef X8	     
     `FBD_CH_PATH7.`DIMMPATH6.U09.handle = 120+864;
     `FBD_CH_PATH7.`DIMMPATH6.U10.handle = 121+864;
     `FBD_CH_PATH7.`DIMMPATH6.U11.handle = 122+864;
     `FBD_CH_PATH7.`DIMMPATH6.U12.handle = 123+864;
     `FBD_CH_PATH7.`DIMMPATH6.U14.handle = 124+864;
     `FBD_CH_PATH7.`DIMMPATH6.U15.handle = 125+864;
     `FBD_CH_PATH7.`DIMMPATH6.U16.handle = 126+864;
     `FBD_CH_PATH7.`DIMMPATH6.U17.handle = 127+864;
     `endif
     `endif


     
     `FBD_CH_PATH0.`DIMMPATH6.U04.handle = x8 ? 2*496 : 128+864;
     `ifndef X8	     
     `FBD_CH_PATH0.`DIMMPATH6.U13.handle = 129+864;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH1.`DIMMPATH6.U04.handle = x8 ? 2*497 : 130+864;
     `ifndef X8	     
     `FBD_CH_PATH1.`DIMMPATH6.U13.handle = 131+864;
     `endif
     `endif


     `FBD_CH_PATH2.`DIMMPATH6.U04.handle = x8 ? 2*498 : 132+864;
     `ifndef X8	     
     `FBD_CH_PATH2.`DIMMPATH6.U13.handle = 133+864;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH3.`DIMMPATH6.U04.handle = x8 ? 2*499 : 134+864;
     `ifndef X8	     
     `FBD_CH_PATH3.`DIMMPATH6.U13.handle = 135+864;
     `endif
     `endif


     `FBD_CH_PATH4.`DIMMPATH6.U04.handle = x8 ? 2*500 : 136+864;
     `ifndef X8	     
     `FBD_CH_PATH4.`DIMMPATH6.U13.handle = 137+864;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH5.`DIMMPATH6.U04.handle = x8 ? 2*501 : 138+864;
     `ifndef X8	     
     `FBD_CH_PATH5.`DIMMPATH6.U13.handle = 139+864;
     `endif
     `endif


     `FBD_CH_PATH6.`DIMMPATH6.U04.handle = x8 ? 2*502 : 140+864;
     `ifndef X8	     
     `FBD_CH_PATH6.`DIMMPATH6.U13.handle = 141+864;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH7.`DIMMPATH6.U04.handle = x8 ? 2*503 : 142+864;
     `ifndef X8	     
     `FBD_CH_PATH7.`DIMMPATH6.U13.handle = 143+864;
     `endif
     `endif


//start8     
     `FBD_CH_PATH0.`DIMMPATH7.U00.handle = x8 ? 2*504 : 0+1008;
     `FBD_CH_PATH0.`DIMMPATH7.U01.handle = x8 ? 2*505 : 1+1008;
     `FBD_CH_PATH0.`DIMMPATH7.U02.handle = x8 ? 2*506 : 2+1008;
     `FBD_CH_PATH0.`DIMMPATH7.U03.handle = x8 ? 2*507 : 3+1008;
     `FBD_CH_PATH0.`DIMMPATH7.U05.handle = x8 ? 2*508 : 4+1008;
     `FBD_CH_PATH0.`DIMMPATH7.U06.handle = x8 ? 2*509 : 5+1008;
     `FBD_CH_PATH0.`DIMMPATH7.U07.handle = x8 ? 2*510 : 6+1008;
     `FBD_CH_PATH0.`DIMMPATH7.U08.handle = x8 ? 2*511 : 7+1008;
     `ifndef X8	     
     `FBD_CH_PATH0.`DIMMPATH7.U09.handle = 8+1008;
     `FBD_CH_PATH0.`DIMMPATH7.U10.handle = 9+1008;
     `FBD_CH_PATH0.`DIMMPATH7.U11.handle = 10+1008;
     `FBD_CH_PATH0.`DIMMPATH7.U12.handle = 11+1008;
     `FBD_CH_PATH0.`DIMMPATH7.U14.handle = 12+1008;
     `FBD_CH_PATH0.`DIMMPATH7.U15.handle = 13+1008;
     `FBD_CH_PATH0.`DIMMPATH7.U16.handle = 14+1008;
     `FBD_CH_PATH0.`DIMMPATH7.U17.handle = 15+1008;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH1.`DIMMPATH7.U00.handle = x8 ? 2*512 : 16+1008;
     `FBD_CH_PATH1.`DIMMPATH7.U01.handle = x8 ? 2*513 : 17+1008;
     `FBD_CH_PATH1.`DIMMPATH7.U02.handle = x8 ? 2*514 : 18+1008;
     `FBD_CH_PATH1.`DIMMPATH7.U03.handle = x8 ? 2*515 : 19+1008;
     `FBD_CH_PATH1.`DIMMPATH7.U05.handle = x8 ? 2*516 : 20+1008;
     `FBD_CH_PATH1.`DIMMPATH7.U06.handle = x8 ? 2*517 : 21+1008;
     `FBD_CH_PATH1.`DIMMPATH7.U07.handle = x8 ? 2*518 : 22+1008;
     `FBD_CH_PATH1.`DIMMPATH7.U08.handle = x8 ? 2*519 : 23+1008;
     `ifndef X8	     
     `FBD_CH_PATH1.`DIMMPATH7.U09.handle = 24+1008;
     `FBD_CH_PATH1.`DIMMPATH7.U10.handle = 25+1008;
     `FBD_CH_PATH1.`DIMMPATH7.U11.handle = 26+1008;
     `FBD_CH_PATH1.`DIMMPATH7.U12.handle = 27+1008;
     `FBD_CH_PATH1.`DIMMPATH7.U14.handle = 28+1008;
     `FBD_CH_PATH1.`DIMMPATH7.U15.handle = 29+1008;
     `FBD_CH_PATH1.`DIMMPATH7.U16.handle = 30+1008;
     `FBD_CH_PATH1.`DIMMPATH7.U17.handle = 31+1008;
     `endif
     `endif


     
     `FBD_CH_PATH2.`DIMMPATH7.U00.handle = x8 ? 2*520 : 32+1008;
     `FBD_CH_PATH2.`DIMMPATH7.U01.handle = x8 ? 2*521 : 33+1008;
     `FBD_CH_PATH2.`DIMMPATH7.U02.handle = x8 ? 2*522 : 34+1008;
     `FBD_CH_PATH2.`DIMMPATH7.U03.handle = x8 ? 2*523 : 35+1008;
     `FBD_CH_PATH2.`DIMMPATH7.U05.handle = x8 ? 2*524 : 36+1008;
     `FBD_CH_PATH2.`DIMMPATH7.U06.handle = x8 ? 2*525 : 37+1008;
     `FBD_CH_PATH2.`DIMMPATH7.U07.handle = x8 ? 2*526 : 38+1008;
     `FBD_CH_PATH2.`DIMMPATH7.U08.handle = x8 ? 2*527 : 39+1008;
     `ifndef X8	     
     `FBD_CH_PATH2.`DIMMPATH7.U09.handle = 40+1008;
     `FBD_CH_PATH2.`DIMMPATH7.U10.handle = 41+1008;
     `FBD_CH_PATH2.`DIMMPATH7.U11.handle = 42+1008;
     `FBD_CH_PATH2.`DIMMPATH7.U12.handle = 43+1008;
     `FBD_CH_PATH2.`DIMMPATH7.U14.handle = 44+1008;
     `FBD_CH_PATH2.`DIMMPATH7.U15.handle = 45+1008;
     `FBD_CH_PATH2.`DIMMPATH7.U16.handle = 46+1008;
     `FBD_CH_PATH2.`DIMMPATH7.U17.handle = 47+1008;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH3.`DIMMPATH7.U00.handle = x8 ? 2*528 : 48+1008;
     `FBD_CH_PATH3.`DIMMPATH7.U01.handle = x8 ? 2*529 : 49+1008;
     `FBD_CH_PATH3.`DIMMPATH7.U02.handle = x8 ? 2*530 : 50+1008;
     `FBD_CH_PATH3.`DIMMPATH7.U03.handle = x8 ? 2*531 : 51+1008;
     `FBD_CH_PATH3.`DIMMPATH7.U05.handle = x8 ? 2*532 : 52+1008;
     `FBD_CH_PATH3.`DIMMPATH7.U06.handle = x8 ? 2*533 : 53+1008;
     `FBD_CH_PATH3.`DIMMPATH7.U07.handle = x8 ? 2*534 : 54+1008;
     `FBD_CH_PATH3.`DIMMPATH7.U08.handle = x8 ? 2*535 : 55+1008;
     `ifndef X8	     
     `FBD_CH_PATH3.`DIMMPATH7.U09.handle = 56+1008;
     `FBD_CH_PATH3.`DIMMPATH7.U10.handle = 57+1008;
     `FBD_CH_PATH3.`DIMMPATH7.U11.handle = 58+1008;
     `FBD_CH_PATH3.`DIMMPATH7.U12.handle = 59+1008;
     `FBD_CH_PATH3.`DIMMPATH7.U14.handle = 60+1008;
     `FBD_CH_PATH3.`DIMMPATH7.U15.handle = 61+1008;
     `FBD_CH_PATH3.`DIMMPATH7.U16.handle = 62+1008;
     `FBD_CH_PATH3.`DIMMPATH7.U17.handle = 63+1008;
     `endif
     `endif


     
     `FBD_CH_PATH4.`DIMMPATH7.U00.handle = x8 ? 2*536 : 64+1008;
     `FBD_CH_PATH4.`DIMMPATH7.U01.handle = x8 ? 2*537 : 65+1008;
     `FBD_CH_PATH4.`DIMMPATH7.U02.handle = x8 ? 2*538 : 66+1008;
     `FBD_CH_PATH4.`DIMMPATH7.U03.handle = x8 ? 2*539 : 67+1008;
     `FBD_CH_PATH4.`DIMMPATH7.U05.handle = x8 ? 2*540 : 68+1008;
     `FBD_CH_PATH4.`DIMMPATH7.U06.handle = x8 ? 2*541 : 69+1008;
     `FBD_CH_PATH4.`DIMMPATH7.U07.handle = x8 ? 2*542 : 70+1008;
     `FBD_CH_PATH4.`DIMMPATH7.U08.handle = x8 ? 2*543 : 71+1008;
     `ifndef X8	     
     `FBD_CH_PATH4.`DIMMPATH7.U09.handle = 72+1008;
     `FBD_CH_PATH4.`DIMMPATH7.U10.handle = 73+1008;
     `FBD_CH_PATH4.`DIMMPATH7.U11.handle = 74+1008;
     `FBD_CH_PATH4.`DIMMPATH7.U12.handle = 75+1008;
     `FBD_CH_PATH4.`DIMMPATH7.U14.handle = 76+1008;
     `FBD_CH_PATH4.`DIMMPATH7.U15.handle = 77+1008;
     `FBD_CH_PATH4.`DIMMPATH7.U16.handle = 78+1008;
     `FBD_CH_PATH4.`DIMMPATH7.U17.handle = 79+1008;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH5.`DIMMPATH7.U00.handle = x8 ? 2*544 : 80+1008;
     `FBD_CH_PATH5.`DIMMPATH7.U01.handle = x8 ? 2*545 : 81+1008;
     `FBD_CH_PATH5.`DIMMPATH7.U02.handle = x8 ? 2*546 : 82+1008;
     `FBD_CH_PATH5.`DIMMPATH7.U03.handle = x8 ? 2*547 : 83+1008;
     `FBD_CH_PATH5.`DIMMPATH7.U05.handle = x8 ? 2*548 : 84+1008;
     `FBD_CH_PATH5.`DIMMPATH7.U06.handle = x8 ? 2*549 : 85+1008;
     `FBD_CH_PATH5.`DIMMPATH7.U07.handle = x8 ? 2*550 : 86+1008;
     `FBD_CH_PATH5.`DIMMPATH7.U08.handle = x8 ? 2*551 : 87+1008;
     `ifndef X8	     
     `FBD_CH_PATH5.`DIMMPATH7.U09.handle = 88+1008;
     `FBD_CH_PATH5.`DIMMPATH7.U10.handle = 89+1008;
     `FBD_CH_PATH5.`DIMMPATH7.U11.handle = 90+1008;
     `FBD_CH_PATH5.`DIMMPATH7.U12.handle = 91+1008;
     `FBD_CH_PATH5.`DIMMPATH7.U14.handle = 92+1008;
     `FBD_CH_PATH5.`DIMMPATH7.U15.handle = 93+1008;
     `FBD_CH_PATH5.`DIMMPATH7.U16.handle = 94+1008;
     `FBD_CH_PATH5.`DIMMPATH7.U17.handle = 95+1008;
     `endif
     `endif


     
     `FBD_CH_PATH6.`DIMMPATH7.U00.handle = x8 ? 2*552 : 96+1008;
     `FBD_CH_PATH6.`DIMMPATH7.U01.handle = x8 ? 2*553 : 97+1008;
     `FBD_CH_PATH6.`DIMMPATH7.U02.handle = x8 ? 2*554 : 98+1008;
     `FBD_CH_PATH6.`DIMMPATH7.U03.handle = x8 ? 2*555 : 99+1008;
     `FBD_CH_PATH6.`DIMMPATH7.U05.handle = x8 ? 2*556 : 100+1008;
     `FBD_CH_PATH6.`DIMMPATH7.U06.handle = x8 ? 2*557 : 101+1008;
     `FBD_CH_PATH6.`DIMMPATH7.U07.handle = x8 ? 2*558 : 102+1008;
     `FBD_CH_PATH6.`DIMMPATH7.U08.handle = x8 ? 2*559 : 103+1008;
     `ifndef X8	     
     `FBD_CH_PATH6.`DIMMPATH7.U09.handle = 104+1008;
     `FBD_CH_PATH6.`DIMMPATH7.U10.handle = 105+1008;
     `FBD_CH_PATH6.`DIMMPATH7.U11.handle = 106+1008;
     `FBD_CH_PATH6.`DIMMPATH7.U12.handle = 107+1008;
     `FBD_CH_PATH6.`DIMMPATH7.U14.handle = 108+1008;
     `FBD_CH_PATH6.`DIMMPATH7.U15.handle = 109+1008;
     `FBD_CH_PATH6.`DIMMPATH7.U16.handle = 110+1008;
     `FBD_CH_PATH6.`DIMMPATH7.U17.handle = 111+1008;
     `endif

     `ifndef SNG_CHANNEL
     `FBD_CH_PATH7.`DIMMPATH7.U00.handle = x8 ? 2*560 : 112+1008;
     `FBD_CH_PATH7.`DIMMPATH7.U01.handle = x8 ? 2*561 : 113+1008;
     `FBD_CH_PATH7.`DIMMPATH7.U02.handle = x8 ? 2*562 : 114+1008;
     `FBD_CH_PATH7.`DIMMPATH7.U03.handle = x8 ? 2*563 : 115+1008;
     `FBD_CH_PATH7.`DIMMPATH7.U05.handle = x8 ? 2*564 : 116+1008;
     `FBD_CH_PATH7.`DIMMPATH7.U06.handle = x8 ? 2*565 : 117+1008;
     `FBD_CH_PATH7.`DIMMPATH7.U07.handle = x8 ? 2*566 : 118+1008;
     `FBD_CH_PATH7.`DIMMPATH7.U08.handle = x8 ? 2*567 : 119+1008;
     `ifndef X8	     
     `FBD_CH_PATH7.`DIMMPATH7.U09.handle = 120+1008;
     `FBD_CH_PATH7.`DIMMPATH7.U10.handle = 121+1008;
     `FBD_CH_PATH7.`DIMMPATH7.U11.handle = 122+1008;
     `FBD_CH_PATH7.`DIMMPATH7.U12.handle = 123+1008;
     `FBD_CH_PATH7.`DIMMPATH7.U14.handle = 124+1008;
     `FBD_CH_PATH7.`DIMMPATH7.U15.handle = 125+1008;
     `FBD_CH_PATH7.`DIMMPATH7.U16.handle = 126+1008;
     `FBD_CH_PATH7.`DIMMPATH7.U17.handle = 127+1008;
     `endif
     `endif


     
     `FBD_CH_PATH0.`DIMMPATH7.U04.handle = x8 ? 2*568 : 128+1008;
     `ifndef X8	     
     `FBD_CH_PATH0.`DIMMPATH7.U13.handle = 129+1008;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH1.`DIMMPATH7.U04.handle = x8 ? 2*569 : 130+1008;
     `ifndef X8	     
     `FBD_CH_PATH1.`DIMMPATH7.U13.handle = 131+1008;
     `endif
     `endif


     `FBD_CH_PATH2.`DIMMPATH7.U04.handle = x8 ? 2*570 : 132+1008;
     `ifndef X8	     
     `FBD_CH_PATH2.`DIMMPATH7.U13.handle = 133+1008;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH3.`DIMMPATH7.U04.handle = x8 ? 2*571 : 134+1008;
     `ifndef X8	     
     `FBD_CH_PATH3.`DIMMPATH7.U13.handle = 135+1008;
     `endif
     `endif


     `FBD_CH_PATH4.`DIMMPATH7.U04.handle = x8 ? 2*572 : 136+1008;
     `ifndef X8	     
     `FBD_CH_PATH4.`DIMMPATH7.U13.handle = 137+1008;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH5.`DIMMPATH7.U04.handle = x8 ? 2*573 : 138+1008;
     `ifndef X8	     
     `FBD_CH_PATH5.`DIMMPATH7.U13.handle = 139+1008;
     `endif
     `endif


     `FBD_CH_PATH6.`DIMMPATH7.U04.handle = x8 ? 2*574 : 140+1008;
     `ifndef X8	     
     `FBD_CH_PATH6.`DIMMPATH7.U13.handle = 141+1008;
     `endif
     `ifndef SNG_CHANNEL
     `FBD_CH_PATH7.`DIMMPATH7.U04.handle = x8 ? 2*575 : 142+1008;
     `ifndef X8	     
     `FBD_CH_PATH7.`DIMMPATH7.U13.handle = 143+1008;
     `endif
     `endif


        `ifdef DBL_SIDE

//start15
             `FBD_CH_PATH0.`RANK_DIMMPATH6.U00.handle = x8 ? 2*1008 : 0+2016;
             `FBD_CH_PATH0.`RANK_DIMMPATH6.U01.handle = x8 ? 2*1009 : 1+2016;
             `FBD_CH_PATH0.`RANK_DIMMPATH6.U02.handle = x8 ? 2*1010 : 2+2016;
             `FBD_CH_PATH0.`RANK_DIMMPATH6.U03.handle = x8 ? 2*1011 : 3+2016;
             `FBD_CH_PATH0.`RANK_DIMMPATH6.U05.handle = x8 ? 2*1012 : 4+2016;
             `FBD_CH_PATH0.`RANK_DIMMPATH6.U06.handle = x8 ? 2*1013 : 5+2016;
             `FBD_CH_PATH0.`RANK_DIMMPATH6.U07.handle = x8 ? 2*1014 : 6+2016;
             `FBD_CH_PATH0.`RANK_DIMMPATH6.U08.handle = x8 ? 2*1015 : 7+2016;
             `ifndef X8	     
             `FBD_CH_PATH0.`RANK_DIMMPATH6.U09.handle = 8+2016;
             `FBD_CH_PATH0.`RANK_DIMMPATH6.U10.handle = 9+2016;
             `FBD_CH_PATH0.`RANK_DIMMPATH6.U11.handle = 10+2016;
             `FBD_CH_PATH0.`RANK_DIMMPATH6.U12.handle = 11+2016;
             `FBD_CH_PATH0.`RANK_DIMMPATH6.U14.handle = 12+2016;
             `FBD_CH_PATH0.`RANK_DIMMPATH6.U15.handle = 13+2016;
             `FBD_CH_PATH0.`RANK_DIMMPATH6.U16.handle = 14+2016;
             `FBD_CH_PATH0.`RANK_DIMMPATH6.U17.handle = 15+2016;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH1.`RANK_DIMMPATH6.U00.handle = x8 ? 2*1016 : 16+2016;
             `FBD_CH_PATH1.`RANK_DIMMPATH6.U01.handle = x8 ? 2*1017 : 17+2016;
             `FBD_CH_PATH1.`RANK_DIMMPATH6.U02.handle = x8 ? 2*1018 : 18+2016;
             `FBD_CH_PATH1.`RANK_DIMMPATH6.U03.handle = x8 ? 2*1019 : 19+2016;
             `FBD_CH_PATH1.`RANK_DIMMPATH6.U05.handle = x8 ? 2*1020 : 20+2016;
             `FBD_CH_PATH1.`RANK_DIMMPATH6.U06.handle = x8 ? 2*1021 : 21+2016;
             `FBD_CH_PATH1.`RANK_DIMMPATH6.U07.handle = x8 ? 2*1022 : 22+2016;
             `FBD_CH_PATH1.`RANK_DIMMPATH6.U08.handle = x8 ? 2*1023 : 23+2016;
             `ifndef X8	     
             `FBD_CH_PATH1.`RANK_DIMMPATH6.U09.handle = 24+2016;
             `FBD_CH_PATH1.`RANK_DIMMPATH6.U10.handle = 25+2016;
             `FBD_CH_PATH1.`RANK_DIMMPATH6.U11.handle = 26+2016;
             `FBD_CH_PATH1.`RANK_DIMMPATH6.U12.handle = 27+2016;
             `FBD_CH_PATH1.`RANK_DIMMPATH6.U14.handle = 28+2016;
             `FBD_CH_PATH1.`RANK_DIMMPATH6.U15.handle = 29+2016;
             `FBD_CH_PATH1.`RANK_DIMMPATH6.U16.handle = 30+2016;
             `FBD_CH_PATH1.`RANK_DIMMPATH6.U17.handle = 31+2016;
             `endif
             `endif


             
             `FBD_CH_PATH2.`RANK_DIMMPATH6.U00.handle = x8 ? 2*1024 : 32+2016;
             `FBD_CH_PATH2.`RANK_DIMMPATH6.U01.handle = x8 ? 2*1025 : 33+2016;
             `FBD_CH_PATH2.`RANK_DIMMPATH6.U02.handle = x8 ? 2*1026 : 34+2016;
             `FBD_CH_PATH2.`RANK_DIMMPATH6.U03.handle = x8 ? 2*1027 : 35+2016;
             `FBD_CH_PATH2.`RANK_DIMMPATH6.U05.handle = x8 ? 2*1028 : 36+2016;
             `FBD_CH_PATH2.`RANK_DIMMPATH6.U06.handle = x8 ? 2*1029 : 37+2016;
             `FBD_CH_PATH2.`RANK_DIMMPATH6.U07.handle = x8 ? 2*1030 : 38+2016;
             `FBD_CH_PATH2.`RANK_DIMMPATH6.U08.handle = x8 ? 2*1031 : 39+2016;
             `ifndef X8	     
             `FBD_CH_PATH2.`RANK_DIMMPATH6.U09.handle = 40+2016;
             `FBD_CH_PATH2.`RANK_DIMMPATH6.U10.handle = 41+2016;
             `FBD_CH_PATH2.`RANK_DIMMPATH6.U11.handle = 42+2016;
             `FBD_CH_PATH2.`RANK_DIMMPATH6.U12.handle = 43+2016;
             `FBD_CH_PATH2.`RANK_DIMMPATH6.U14.handle = 44+2016;
             `FBD_CH_PATH2.`RANK_DIMMPATH6.U15.handle = 45+2016;
             `FBD_CH_PATH2.`RANK_DIMMPATH6.U16.handle = 46+2016;
             `FBD_CH_PATH2.`RANK_DIMMPATH6.U17.handle = 47+2016;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH3.`RANK_DIMMPATH6.U00.handle = x8 ? 2*1032 : 48+2016;
             `FBD_CH_PATH3.`RANK_DIMMPATH6.U01.handle = x8 ? 2*1033 : 49+2016;
             `FBD_CH_PATH3.`RANK_DIMMPATH6.U02.handle = x8 ? 2*1034 : 50+2016;
             `FBD_CH_PATH3.`RANK_DIMMPATH6.U03.handle = x8 ? 2*1035 : 51+2016;
             `FBD_CH_PATH3.`RANK_DIMMPATH6.U05.handle = x8 ? 2*1036 : 52+2016;
             `FBD_CH_PATH3.`RANK_DIMMPATH6.U06.handle = x8 ? 2*1037 : 53+2016;
             `FBD_CH_PATH3.`RANK_DIMMPATH6.U07.handle = x8 ? 2*1038 : 54+2016;
             `FBD_CH_PATH3.`RANK_DIMMPATH6.U08.handle = x8 ? 2*1039 : 55+2016;
             `ifndef X8	     
             `FBD_CH_PATH3.`RANK_DIMMPATH6.U09.handle = 56+2016;
             `FBD_CH_PATH3.`RANK_DIMMPATH6.U10.handle = 57+2016;
             `FBD_CH_PATH3.`RANK_DIMMPATH6.U11.handle = 58+2016;
             `FBD_CH_PATH3.`RANK_DIMMPATH6.U12.handle = 59+2016;
             `FBD_CH_PATH3.`RANK_DIMMPATH6.U14.handle = 60+2016;
             `FBD_CH_PATH3.`RANK_DIMMPATH6.U15.handle = 61+2016;
             `FBD_CH_PATH3.`RANK_DIMMPATH6.U16.handle = 62+2016;
             `FBD_CH_PATH3.`RANK_DIMMPATH6.U17.handle = 63+2016;
             `endif
             `endif


             
             `FBD_CH_PATH4.`RANK_DIMMPATH6.U00.handle = x8 ? 2*1040 : 64+2016;
             `FBD_CH_PATH4.`RANK_DIMMPATH6.U01.handle = x8 ? 2*1041 : 65+2016;
             `FBD_CH_PATH4.`RANK_DIMMPATH6.U02.handle = x8 ? 2*1042 : 66+2016;
             `FBD_CH_PATH4.`RANK_DIMMPATH6.U03.handle = x8 ? 2*1043 : 67+2016;
             `FBD_CH_PATH4.`RANK_DIMMPATH6.U05.handle = x8 ? 2*1044 : 68+2016;
             `FBD_CH_PATH4.`RANK_DIMMPATH6.U06.handle = x8 ? 2*1045 : 69+2016;
             `FBD_CH_PATH4.`RANK_DIMMPATH6.U07.handle = x8 ? 2*1046 : 70+2016;
             `FBD_CH_PATH4.`RANK_DIMMPATH6.U08.handle = x8 ? 2*1047 : 71+2016;
             `ifndef X8	     
             `FBD_CH_PATH4.`RANK_DIMMPATH6.U09.handle = 72+2016;
             `FBD_CH_PATH4.`RANK_DIMMPATH6.U10.handle = 73+2016;
             `FBD_CH_PATH4.`RANK_DIMMPATH6.U11.handle = 74+2016;
             `FBD_CH_PATH4.`RANK_DIMMPATH6.U12.handle = 75+2016;
             `FBD_CH_PATH4.`RANK_DIMMPATH6.U14.handle = 76+2016;
             `FBD_CH_PATH4.`RANK_DIMMPATH6.U15.handle = 77+2016;
             `FBD_CH_PATH4.`RANK_DIMMPATH6.U16.handle = 78+2016;
             `FBD_CH_PATH4.`RANK_DIMMPATH6.U17.handle = 79+2016;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH5.`RANK_DIMMPATH6.U00.handle = x8 ? 2*1048 : 80+2016;
             `FBD_CH_PATH5.`RANK_DIMMPATH6.U01.handle = x8 ? 2*1049 : 81+2016;
             `FBD_CH_PATH5.`RANK_DIMMPATH6.U02.handle = x8 ? 2*1050 : 82+2016;
             `FBD_CH_PATH5.`RANK_DIMMPATH6.U03.handle = x8 ? 2*1051 : 83+2016;
             `FBD_CH_PATH5.`RANK_DIMMPATH6.U05.handle = x8 ? 2*1052 : 84+2016;
             `FBD_CH_PATH5.`RANK_DIMMPATH6.U06.handle = x8 ? 2*1053 : 85+2016;
             `FBD_CH_PATH5.`RANK_DIMMPATH6.U07.handle = x8 ? 2*1054 : 86+2016;
             `FBD_CH_PATH5.`RANK_DIMMPATH6.U08.handle = x8 ? 2*1055 : 87+2016;
             `ifndef X8	     
             `FBD_CH_PATH5.`RANK_DIMMPATH6.U09.handle = 88+2016;
             `FBD_CH_PATH5.`RANK_DIMMPATH6.U10.handle = 89+2016;
             `FBD_CH_PATH5.`RANK_DIMMPATH6.U11.handle = 90+2016;
             `FBD_CH_PATH5.`RANK_DIMMPATH6.U12.handle = 91+2016;
             `FBD_CH_PATH5.`RANK_DIMMPATH6.U14.handle = 92+2016;
             `FBD_CH_PATH5.`RANK_DIMMPATH6.U15.handle = 93+2016;
             `FBD_CH_PATH5.`RANK_DIMMPATH6.U16.handle = 94+2016;
             `FBD_CH_PATH5.`RANK_DIMMPATH6.U17.handle = 95+2016;
             `endif
             `endif


             
             `FBD_CH_PATH6.`RANK_DIMMPATH6.U00.handle = x8 ? 2*1056 : 96+2016;
             `FBD_CH_PATH6.`RANK_DIMMPATH6.U01.handle = x8 ? 2*1057 : 97+2016;
             `FBD_CH_PATH6.`RANK_DIMMPATH6.U02.handle = x8 ? 2*1058 : 98+2016;
             `FBD_CH_PATH6.`RANK_DIMMPATH6.U03.handle = x8 ? 2*1059 : 99+2016;
             `FBD_CH_PATH6.`RANK_DIMMPATH6.U05.handle = x8 ? 2*1060 : 100+2016;
             `FBD_CH_PATH6.`RANK_DIMMPATH6.U06.handle = x8 ? 2*1061 : 101+2016;
             `FBD_CH_PATH6.`RANK_DIMMPATH6.U07.handle = x8 ? 2*1062 : 102+2016;
             `FBD_CH_PATH6.`RANK_DIMMPATH6.U08.handle = x8 ? 2*1063 : 103+2016;
             `ifndef X8	     
             `FBD_CH_PATH6.`RANK_DIMMPATH6.U09.handle = 104+2016;
             `FBD_CH_PATH6.`RANK_DIMMPATH6.U10.handle = 105+2016;
             `FBD_CH_PATH6.`RANK_DIMMPATH6.U11.handle = 106+2016;
             `FBD_CH_PATH6.`RANK_DIMMPATH6.U12.handle = 107+2016;
             `FBD_CH_PATH6.`RANK_DIMMPATH6.U14.handle = 108+2016;
             `FBD_CH_PATH6.`RANK_DIMMPATH6.U15.handle = 109+2016;
             `FBD_CH_PATH6.`RANK_DIMMPATH6.U16.handle = 110+2016;
             `FBD_CH_PATH6.`RANK_DIMMPATH6.U17.handle = 111+2016;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH7.`RANK_DIMMPATH6.U00.handle = x8 ? 2*1064 : 112+2016;
             `FBD_CH_PATH7.`RANK_DIMMPATH6.U01.handle = x8 ? 2*1065 : 113+2016;
             `FBD_CH_PATH7.`RANK_DIMMPATH6.U02.handle = x8 ? 2*1066 : 114+2016;
             `FBD_CH_PATH7.`RANK_DIMMPATH6.U03.handle = x8 ? 2*1067 : 115+2016;
             `FBD_CH_PATH7.`RANK_DIMMPATH6.U05.handle = x8 ? 2*1068 : 116+2016;
             `FBD_CH_PATH7.`RANK_DIMMPATH6.U06.handle = x8 ? 2*1069 : 117+2016;
             `FBD_CH_PATH7.`RANK_DIMMPATH6.U07.handle = x8 ? 2*1070 : 118+2016;
             `FBD_CH_PATH7.`RANK_DIMMPATH6.U08.handle = x8 ? 2*1071 : 119+2016;
             `ifndef X8	     
             `FBD_CH_PATH7.`RANK_DIMMPATH6.U09.handle = 120+2016;
             `FBD_CH_PATH7.`RANK_DIMMPATH6.U10.handle = 121+2016;
             `FBD_CH_PATH7.`RANK_DIMMPATH6.U11.handle = 122+2016;
             `FBD_CH_PATH7.`RANK_DIMMPATH6.U12.handle = 123+2016;
             `FBD_CH_PATH7.`RANK_DIMMPATH6.U14.handle = 124+2016;
             `FBD_CH_PATH7.`RANK_DIMMPATH6.U15.handle = 125+2016;
             `FBD_CH_PATH7.`RANK_DIMMPATH6.U16.handle = 126+2016;
             `FBD_CH_PATH7.`RANK_DIMMPATH6.U17.handle = 127+2016;
             `endif
             `endif


             
             `FBD_CH_PATH0.`RANK_DIMMPATH6.U04.handle = x8 ? 2*1072 : 128+2016;
             `ifndef X8	     
             `FBD_CH_PATH0.`RANK_DIMMPATH6.U13.handle = 129+2016;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH1.`RANK_DIMMPATH6.U04.handle = x8 ? 2*1073 : 130+2016;
             `ifndef X8	     
             `FBD_CH_PATH1.`RANK_DIMMPATH6.U13.handle = 131+2016;
             `endif
             `endif


             `FBD_CH_PATH2.`RANK_DIMMPATH6.U04.handle = x8 ? 2*1074 : 132+2016;
             `ifndef X8	     
             `FBD_CH_PATH2.`RANK_DIMMPATH6.U13.handle = 133+2016;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH3.`RANK_DIMMPATH6.U04.handle = x8 ? 2*1075 : 134+2016;
             `ifndef X8	     
             `FBD_CH_PATH3.`RANK_DIMMPATH6.U13.handle = 135+2016;
             `endif
             `endif


             `FBD_CH_PATH4.`RANK_DIMMPATH6.U04.handle = x8 ? 2*1076 : 136+2016;
             `ifndef X8	     
             `FBD_CH_PATH4.`RANK_DIMMPATH6.U13.handle = 137+2016;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH5.`RANK_DIMMPATH6.U04.handle = x8 ? 2*1077 : 138+2016;
             `ifndef X8	     
             `FBD_CH_PATH5.`RANK_DIMMPATH6.U13.handle = 139+2016;
             `endif
             `endif


             `FBD_CH_PATH6.`RANK_DIMMPATH6.U04.handle = x8 ? 2*1078 : 140+2016;
             `ifndef X8	     
             `FBD_CH_PATH6.`RANK_DIMMPATH6.U13.handle = 141+2016;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH7.`RANK_DIMMPATH6.U04.handle = x8 ? 2*1079 : 142+2016;
             `ifndef X8	     
             `FBD_CH_PATH7.`RANK_DIMMPATH6.U13.handle = 143+2016;
             `endif
             `endif


             
//start16
             `FBD_CH_PATH0.`RANK_DIMMPATH7.U00.handle = x8 ? 2*1080 : 0+2160;
             `FBD_CH_PATH0.`RANK_DIMMPATH7.U01.handle = x8 ? 2*1081 : 1+2160;
             `FBD_CH_PATH0.`RANK_DIMMPATH7.U02.handle = x8 ? 2*1082 : 2+2160;
             `FBD_CH_PATH0.`RANK_DIMMPATH7.U03.handle = x8 ? 2*1083 : 3+2160;
             `FBD_CH_PATH0.`RANK_DIMMPATH7.U05.handle = x8 ? 2*1084 : 4+2160;
             `FBD_CH_PATH0.`RANK_DIMMPATH7.U06.handle = x8 ? 2*1085 : 5+2160;
             `FBD_CH_PATH0.`RANK_DIMMPATH7.U07.handle = x8 ? 2*1086 : 6+2160;
             `FBD_CH_PATH0.`RANK_DIMMPATH7.U08.handle = x8 ? 2*1087 : 7+2160;
             `ifndef X8	     
             `FBD_CH_PATH0.`RANK_DIMMPATH7.U09.handle = 8+2160;
             `FBD_CH_PATH0.`RANK_DIMMPATH7.U10.handle = 9+2160;
             `FBD_CH_PATH0.`RANK_DIMMPATH7.U11.handle = 10+2160;
             `FBD_CH_PATH0.`RANK_DIMMPATH7.U12.handle = 11+2160;
             `FBD_CH_PATH0.`RANK_DIMMPATH7.U14.handle = 12+2160;
             `FBD_CH_PATH0.`RANK_DIMMPATH7.U15.handle = 13+2160;
             `FBD_CH_PATH0.`RANK_DIMMPATH7.U16.handle = 14+2160;
             `FBD_CH_PATH0.`RANK_DIMMPATH7.U17.handle = 15+2160;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH1.`RANK_DIMMPATH7.U00.handle = x8 ? 2*1088 : 16+2160;
             `FBD_CH_PATH1.`RANK_DIMMPATH7.U01.handle = x8 ? 2*1089 : 17+2160;
             `FBD_CH_PATH1.`RANK_DIMMPATH7.U02.handle = x8 ? 2*1090 : 18+2160;
             `FBD_CH_PATH1.`RANK_DIMMPATH7.U03.handle = x8 ? 2*1091 : 19+2160;
             `FBD_CH_PATH1.`RANK_DIMMPATH7.U05.handle = x8 ? 2*1092 : 20+2160;
             `FBD_CH_PATH1.`RANK_DIMMPATH7.U06.handle = x8 ? 2*1093 : 21+2160;
             `FBD_CH_PATH1.`RANK_DIMMPATH7.U07.handle = x8 ? 2*1094 : 22+2160;
             `FBD_CH_PATH1.`RANK_DIMMPATH7.U08.handle = x8 ? 2*1095 : 23+2160;
             `ifndef X8	     
             `FBD_CH_PATH1.`RANK_DIMMPATH7.U09.handle = 24+2160;
             `FBD_CH_PATH1.`RANK_DIMMPATH7.U10.handle = 25+2160;
             `FBD_CH_PATH1.`RANK_DIMMPATH7.U11.handle = 26+2160;
             `FBD_CH_PATH1.`RANK_DIMMPATH7.U12.handle = 27+2160;
             `FBD_CH_PATH1.`RANK_DIMMPATH7.U14.handle = 28+2160;
             `FBD_CH_PATH1.`RANK_DIMMPATH7.U15.handle = 29+2160;
             `FBD_CH_PATH1.`RANK_DIMMPATH7.U16.handle = 30+2160;
             `FBD_CH_PATH1.`RANK_DIMMPATH7.U17.handle = 31+2160;
             `endif
             `endif


             
             `FBD_CH_PATH2.`RANK_DIMMPATH7.U00.handle = x8 ? 2*1096 : 32+2160;
             `FBD_CH_PATH2.`RANK_DIMMPATH7.U01.handle = x8 ? 2*1097 : 33+2160;
             `FBD_CH_PATH2.`RANK_DIMMPATH7.U02.handle = x8 ? 2*1098 : 34+2160;
             `FBD_CH_PATH2.`RANK_DIMMPATH7.U03.handle = x8 ? 2*1099 : 35+2160;
             `FBD_CH_PATH2.`RANK_DIMMPATH7.U05.handle = x8 ? 2*1100 : 36+2160;
             `FBD_CH_PATH2.`RANK_DIMMPATH7.U06.handle = x8 ? 2*1101 : 37+2160;
             `FBD_CH_PATH2.`RANK_DIMMPATH7.U07.handle = x8 ? 2*1102 : 38+2160;
             `FBD_CH_PATH2.`RANK_DIMMPATH7.U08.handle = x8 ? 2*1103 : 39+2160;
             `ifndef X8	     
             `FBD_CH_PATH2.`RANK_DIMMPATH7.U09.handle = 40+2160;
             `FBD_CH_PATH2.`RANK_DIMMPATH7.U10.handle = 41+2160;
             `FBD_CH_PATH2.`RANK_DIMMPATH7.U11.handle = 42+2160;
             `FBD_CH_PATH2.`RANK_DIMMPATH7.U12.handle = 43+2160;
             `FBD_CH_PATH2.`RANK_DIMMPATH7.U14.handle = 44+2160;
             `FBD_CH_PATH2.`RANK_DIMMPATH7.U15.handle = 45+2160;
             `FBD_CH_PATH2.`RANK_DIMMPATH7.U16.handle = 46+2160;
             `FBD_CH_PATH2.`RANK_DIMMPATH7.U17.handle = 47+2160;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH3.`RANK_DIMMPATH7.U00.handle = x8 ? 2*1104 : 48+2160;
             `FBD_CH_PATH3.`RANK_DIMMPATH7.U01.handle = x8 ? 2*1105 : 49+2160;
             `FBD_CH_PATH3.`RANK_DIMMPATH7.U02.handle = x8 ? 2*1106 : 50+2160;
             `FBD_CH_PATH3.`RANK_DIMMPATH7.U03.handle = x8 ? 2*1107 : 51+2160;
             `FBD_CH_PATH3.`RANK_DIMMPATH7.U05.handle = x8 ? 2*1108 : 52+2160;
             `FBD_CH_PATH3.`RANK_DIMMPATH7.U06.handle = x8 ? 2*1109 : 53+2160;
             `FBD_CH_PATH3.`RANK_DIMMPATH7.U07.handle = x8 ? 2*1110 : 54+2160;
             `FBD_CH_PATH3.`RANK_DIMMPATH7.U08.handle = x8 ? 2*1111 : 55+2160;
             `ifndef X8	     
             `FBD_CH_PATH3.`RANK_DIMMPATH7.U09.handle = 56+2160;
             `FBD_CH_PATH3.`RANK_DIMMPATH7.U10.handle = 57+2160;
             `FBD_CH_PATH3.`RANK_DIMMPATH7.U11.handle = 58+2160;
             `FBD_CH_PATH3.`RANK_DIMMPATH7.U12.handle = 59+2160;
             `FBD_CH_PATH3.`RANK_DIMMPATH7.U14.handle = 60+2160;
             `FBD_CH_PATH3.`RANK_DIMMPATH7.U15.handle = 61+2160;
             `FBD_CH_PATH3.`RANK_DIMMPATH7.U16.handle = 62+2160;
             `FBD_CH_PATH3.`RANK_DIMMPATH7.U17.handle = 63+2160;
             `endif
             `endif


             
             `FBD_CH_PATH4.`RANK_DIMMPATH7.U00.handle = x8 ? 2*1112 : 64+2160;
             `FBD_CH_PATH4.`RANK_DIMMPATH7.U01.handle = x8 ? 2*1113 : 65+2160;
             `FBD_CH_PATH4.`RANK_DIMMPATH7.U02.handle = x8 ? 2*1114 : 66+2160;
             `FBD_CH_PATH4.`RANK_DIMMPATH7.U03.handle = x8 ? 2*1115 : 67+2160;
             `FBD_CH_PATH4.`RANK_DIMMPATH7.U05.handle = x8 ? 2*1116 : 68+2160;
             `FBD_CH_PATH4.`RANK_DIMMPATH7.U06.handle = x8 ? 2*1117 : 69+2160;
             `FBD_CH_PATH4.`RANK_DIMMPATH7.U07.handle = x8 ? 2*1118 : 70+2160;
             `FBD_CH_PATH4.`RANK_DIMMPATH7.U08.handle = x8 ? 2*1119 : 71+2160;
             `ifndef X8	     
             `FBD_CH_PATH4.`RANK_DIMMPATH7.U09.handle = 72+2160;
             `FBD_CH_PATH4.`RANK_DIMMPATH7.U10.handle = 73+2160;
             `FBD_CH_PATH4.`RANK_DIMMPATH7.U11.handle = 74+2160;
             `FBD_CH_PATH4.`RANK_DIMMPATH7.U12.handle = 75+2160;
             `FBD_CH_PATH4.`RANK_DIMMPATH7.U14.handle = 76+2160;
             `FBD_CH_PATH4.`RANK_DIMMPATH7.U15.handle = 77+2160;
             `FBD_CH_PATH4.`RANK_DIMMPATH7.U16.handle = 78+2160;
             `FBD_CH_PATH4.`RANK_DIMMPATH7.U17.handle = 79+2160;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH5.`RANK_DIMMPATH7.U00.handle = x8 ? 2*1120 : 80+2160;
             `FBD_CH_PATH5.`RANK_DIMMPATH7.U01.handle = x8 ? 2*1121 : 81+2160;
             `FBD_CH_PATH5.`RANK_DIMMPATH7.U02.handle = x8 ? 2*1122 : 82+2160;
             `FBD_CH_PATH5.`RANK_DIMMPATH7.U03.handle = x8 ? 2*1123 : 83+2160;
             `FBD_CH_PATH5.`RANK_DIMMPATH7.U05.handle = x8 ? 2*1124 : 84+2160;
             `FBD_CH_PATH5.`RANK_DIMMPATH7.U06.handle = x8 ? 2*1125 : 85+2160;
             `FBD_CH_PATH5.`RANK_DIMMPATH7.U07.handle = x8 ? 2*1126 : 86+2160;
             `FBD_CH_PATH5.`RANK_DIMMPATH7.U08.handle = x8 ? 2*1127 : 87+2160;
             `ifndef X8	     
             `FBD_CH_PATH5.`RANK_DIMMPATH7.U09.handle = 88+2160;
             `FBD_CH_PATH5.`RANK_DIMMPATH7.U10.handle = 89+2160;
             `FBD_CH_PATH5.`RANK_DIMMPATH7.U11.handle = 90+2160;
             `FBD_CH_PATH5.`RANK_DIMMPATH7.U12.handle = 91+2160;
             `FBD_CH_PATH5.`RANK_DIMMPATH7.U14.handle = 92+2160;
             `FBD_CH_PATH5.`RANK_DIMMPATH7.U15.handle = 93+2160;
             `FBD_CH_PATH5.`RANK_DIMMPATH7.U16.handle = 94+2160;
             `FBD_CH_PATH5.`RANK_DIMMPATH7.U17.handle = 95+2160;
             `endif
             `endif


             
             `FBD_CH_PATH6.`RANK_DIMMPATH7.U00.handle = x8 ? 2*1128 : 96+2160;
             `FBD_CH_PATH6.`RANK_DIMMPATH7.U01.handle = x8 ? 2*1129 : 97+2160;
             `FBD_CH_PATH6.`RANK_DIMMPATH7.U02.handle = x8 ? 2*1130 : 98+2160;
             `FBD_CH_PATH6.`RANK_DIMMPATH7.U03.handle = x8 ? 2*1131 : 99+2160;
             `FBD_CH_PATH6.`RANK_DIMMPATH7.U05.handle = x8 ? 2*1132 : 100+2160;
             `FBD_CH_PATH6.`RANK_DIMMPATH7.U06.handle = x8 ? 2*1133 : 101+2160;
             `FBD_CH_PATH6.`RANK_DIMMPATH7.U07.handle = x8 ? 2*1134 : 102+2160;
             `FBD_CH_PATH6.`RANK_DIMMPATH7.U08.handle = x8 ? 2*1135 : 103+2160;
             `ifndef X8	     
             `FBD_CH_PATH6.`RANK_DIMMPATH7.U09.handle = 104+2160;
             `FBD_CH_PATH6.`RANK_DIMMPATH7.U10.handle = 105+2160;
             `FBD_CH_PATH6.`RANK_DIMMPATH7.U11.handle = 106+2160;
             `FBD_CH_PATH6.`RANK_DIMMPATH7.U12.handle = 107+2160;
             `FBD_CH_PATH6.`RANK_DIMMPATH7.U14.handle = 108+2160;
             `FBD_CH_PATH6.`RANK_DIMMPATH7.U15.handle = 109+2160;
             `FBD_CH_PATH6.`RANK_DIMMPATH7.U16.handle = 110+2160;
             `FBD_CH_PATH6.`RANK_DIMMPATH7.U17.handle = 111+2160;
             `endif

             `ifndef SNG_CHANNEL
             `FBD_CH_PATH7.`RANK_DIMMPATH7.U00.handle = x8 ? 2*1136 : 112+2160;
             `FBD_CH_PATH7.`RANK_DIMMPATH7.U01.handle = x8 ? 2*1137 : 113+2160;
             `FBD_CH_PATH7.`RANK_DIMMPATH7.U02.handle = x8 ? 2*1138 : 114+2160;
             `FBD_CH_PATH7.`RANK_DIMMPATH7.U03.handle = x8 ? 2*1139 : 115+2160;
             `FBD_CH_PATH7.`RANK_DIMMPATH7.U05.handle = x8 ? 2*1140 : 116+2160;
             `FBD_CH_PATH7.`RANK_DIMMPATH7.U06.handle = x8 ? 2*1141 : 117+2160;
             `FBD_CH_PATH7.`RANK_DIMMPATH7.U07.handle = x8 ? 2*1142 : 118+2160;
             `FBD_CH_PATH7.`RANK_DIMMPATH7.U08.handle = x8 ? 2*1143 : 119+2160;
             `ifndef X8	     
             `FBD_CH_PATH7.`RANK_DIMMPATH7.U09.handle = 120+2160;
             `FBD_CH_PATH7.`RANK_DIMMPATH7.U10.handle = 121+2160;
             `FBD_CH_PATH7.`RANK_DIMMPATH7.U11.handle = 122+2160;
             `FBD_CH_PATH7.`RANK_DIMMPATH7.U12.handle = 123+2160;
             `FBD_CH_PATH7.`RANK_DIMMPATH7.U14.handle = 124+2160;
             `FBD_CH_PATH7.`RANK_DIMMPATH7.U15.handle = 125+2160;
             `FBD_CH_PATH7.`RANK_DIMMPATH7.U16.handle = 126+2160;
             `FBD_CH_PATH7.`RANK_DIMMPATH7.U17.handle = 127+2160;
             `endif
             `endif


             
             `FBD_CH_PATH0.`RANK_DIMMPATH7.U04.handle = x8 ? 2*1144 : 128+2160;
             `ifndef X8	     
             `FBD_CH_PATH0.`RANK_DIMMPATH7.U13.handle = 129+2160;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH1.`RANK_DIMMPATH7.U04.handle = x8 ? 2*1145 : 130+2160;
             `ifndef X8	     
             `FBD_CH_PATH1.`RANK_DIMMPATH7.U13.handle = 131+2160;
             `endif
             `endif


             `FBD_CH_PATH2.`RANK_DIMMPATH7.U04.handle = x8 ? 2*1146 : 132+2160;
             `ifndef X8	     
             `FBD_CH_PATH2.`RANK_DIMMPATH7.U13.handle = 133+2160;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH3.`RANK_DIMMPATH7.U04.handle = x8 ? 2*1147 : 134+2160;
             `ifndef X8	     
             `FBD_CH_PATH3.`RANK_DIMMPATH7.U13.handle = 135+2160;
             `endif
             `endif


             `FBD_CH_PATH4.`RANK_DIMMPATH7.U04.handle = x8 ? 2*1148 : 136+2160;
             `ifndef X8	     
             `FBD_CH_PATH4.`RANK_DIMMPATH7.U13.handle = 137+2160;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH5.`RANK_DIMMPATH7.U04.handle = x8 ? 2*1149 : 138+2160;
             `ifndef X8	     
             `FBD_CH_PATH5.`RANK_DIMMPATH7.U13.handle = 139+2160;
             `endif
             `endif


             `FBD_CH_PATH6.`RANK_DIMMPATH7.U04.handle = x8 ? 2*1150 : 140+2160;
             `ifndef X8	     
             `FBD_CH_PATH6.`RANK_DIMMPATH7.U13.handle = 141+2160;
             `endif
             `ifndef SNG_CHANNEL
             `FBD_CH_PATH7.`RANK_DIMMPATH7.U04.handle = x8 ? 2*1151 : 142+2160;
             `ifndef X8	     
             `FBD_CH_PATH7.`RANK_DIMMPATH7.U13.handle = 143+2160;
             `endif
             `endif


        `endif // DBL_SIDE

     `endif // FBD_8

// `endif	// DRAM_SAT

`ifndef AXIS_DDR2_MODEL
     #1
`ifndef MCUSAT
     if(`PARGS.bank_set_mask == 4'h3 || `PARGS.bank_set_mask == 4'h5 || `PARGS.bank_set_mask == 4'h6 || `PARGS.bank_set_mask == 4'h9 || `PARGS.bank_set_mask == 4'ha || `PARGS.bank_set_mask == 4'hc)
         shift = 1;
     else if(`PARGS.bank_set_mask_csr == 4'h3 || `PARGS.bank_set_mask_csr == 4'h5 || `PARGS.bank_set_mask_csr == 4'h6 || `PARGS.bank_set_mask_csr == 4'h9 || `PARGS.bank_set_mask_csr == 4'ha || `PARGS.bank_set_mask_csr == 4'hc)
         shift = 1;
     else if(`PARGS.bank_set_mask == 4'h1 || `PARGS.bank_set_mask == 4'h2 || `PARGS.bank_set_mask == 4'h4 || `PARGS.bank_set_mask == 4'h8)
         shift = 2;
     else if(`PARGS.bank_set_mask_csr == 4'h1 || `PARGS.bank_set_mask_csr == 4'h2 || `PARGS.bank_set_mask_csr == 4'h4 || `PARGS.bank_set_mask_csr == 4'h8)
         shift = 2;
`endif
     `PR_ALWAYS("cmp_mem", `ALWAYS, "Initializing Sparse Memory from %0s, shift = %0d, ck_mcu0 = %0d, ck_mcu1 = %0d, ck_mcu2 = %0d, ck_mcu3 = %0d", file, shift, ck_mcu0, ck_mcu1, ck_mcu2, ck_mcu3);
     $init_dram(file, dimm_config, ck_mcu0, ck_mcu1, ck_mcu2, ck_mcu3, shift);
`endif
//`endif // RTL_SPARC0
end // initial begin
   
endmodule // cmp_mem
