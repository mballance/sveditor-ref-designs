// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_mem_config.v
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

module mcu_mem_config ();

reg		chnl_type;		// Dual Channel or Single Channel
reg		rank_addr;		// RANK HI addr = 1, RANK LOW addr = 0
reg  [2:0]	num_dimms;		// DIMM NUMBERS: 1, 2, 4, 6, 8
reg		rank;			// 1 RANK or 2 RANKS
reg  [1:0]      dimm_size ;
reg             mcu_reg_slam_en;  
reg		dram_part;

reg [7:0] chnl_read_latency;
reg [7:0] chnl_read_latency_gate;
reg dtm_enabled,sys_enabled;

initial
begin
`ifdef PALLADIUM
`else
  #1;
`endif
  if ($test$plusargs("SYS_SETTINGS"))
begin
     `PR_ALWAYS ("mcu_mem_config", `ALWAYS, "SIMULATION HAS SYSTEM SETTINGS ENABLED");

    sys_enabled = 1'b1;
end
  else
    sys_enabled = 1'b0;

  if ($test$plusargs("DTM_ENABLED"))
    dtm_enabled = 1'b1;
  else
    dtm_enabled = 1'b0;
end

initial 
begin // {

`ifdef PALLADIUM
`else
   #1;
`endif

  if ($test$plusargs("NO_MCU_CSR_SLAM")) begin
     `PR_INFO ("mcu_mem_config", `INFO, "MCU CSRs not slammed");
  end
  else begin

   //----------------------------------------
   // Disable MCU Timing Registers Slamming
   //----------------------------------------
   
    if ($test$plusargs("MCU_REG_DEFAULT_VAL"))
      mcu_reg_slam_en = 1'b0;
    else
     mcu_reg_slam_en = 1'b1;

   //----------------------------------------------------------
   // DRAMs X8 PART
   //----------------------------------------------------------

`ifdef X8
    if (mcu_reg_slam_en) begin
      force `DRIF_PATH0.drif_cas_addr_bits[3:0] =4'ha;
      force `DRIF_PATH1.drif_cas_addr_bits[3:0] =4'ha;
      force `DRIF_PATH2.drif_cas_addr_bits[3:0] =4'ha;
      force `DRIF_PATH3.drif_cas_addr_bits[3:0] =4'ha;
    end
`endif

   //----------------------------------------------------------
   // Memory Density Type : 256 Mb, 512 Mb, 1 Gb, 2 Gb
   //----------------------------------------------------------

    if ($test$plusargs("DIMM_SIZE_1G"))
    begin // { 
`ifdef MCU_GATE
      force `DRIF_PATH0.drif__inv_drif_ras_addr_bits_3_ =1'b0;
      force `DRIF_PATH0.drif__inv_drif_ras_addr_bits_2_ =1'b0;
      force `DRIF_PATH0.drif__inv_drif_ras_addr_bits_1_ =1'b0;
      force `DRIF_PATH0.drif__inv_drif_ras_addr_bits_0_ =1'b1;

      force `DRIF_PATH1.drif__inv_drif_ras_addr_bits_3_ =1'b0;
      force `DRIF_PATH1.drif__inv_drif_ras_addr_bits_2_ =1'b0;
      force `DRIF_PATH1.drif__inv_drif_ras_addr_bits_1_ =1'b0;
      force `DRIF_PATH1.drif__inv_drif_ras_addr_bits_0_ =1'b1;

      force `DRIF_PATH2.drif__inv_drif_ras_addr_bits_3_ =1'b0;
      force `DRIF_PATH2.drif__inv_drif_ras_addr_bits_2_ =1'b0;
      force `DRIF_PATH2.drif__inv_drif_ras_addr_bits_1_ =1'b0;
      force `DRIF_PATH2.drif__inv_drif_ras_addr_bits_0_ =1'b1;

      force `DRIF_PATH3.drif__inv_drif_ras_addr_bits_3_ =1'b0;
      force `DRIF_PATH3.drif__inv_drif_ras_addr_bits_2_ =1'b0;
      force `DRIF_PATH3.drif__inv_drif_ras_addr_bits_1_ =1'b0;
      force `DRIF_PATH3.drif__inv_drif_ras_addr_bits_0_ =1'b1;
`else
    if (mcu_reg_slam_en) begin
      force `DRIF_PATH0.drif_ras_addr_bits[3:0] =4'he;
      force `DRIF_PATH1.drif_ras_addr_bits[3:0] =4'he;
      force `DRIF_PATH2.drif_ras_addr_bits[3:0] =4'he;
      force `DRIF_PATH3.drif_ras_addr_bits[3:0] =4'he;
    end
`endif // mcu_gate

      dimm_size = 2'b10;
    end // }
    else if ($test$plusargs("DIMM_SIZE_512"))
    begin // { 
`ifdef MCU_GATE
      force `DRIF_PATH0.drif__inv_drif_ras_addr_bits_3_ =1'b0;
      force `DRIF_PATH0.drif__inv_drif_ras_addr_bits_2_ =1'b0;
      force `DRIF_PATH0.drif__inv_drif_ras_addr_bits_1_ =1'b0;
      force `DRIF_PATH0.drif__inv_drif_ras_addr_bits_0_ =1'b1;

      force `DRIF_PATH1.drif__inv_drif_ras_addr_bits_3_ =1'b0;
      force `DRIF_PATH1.drif__inv_drif_ras_addr_bits_2_ =1'b0;
      force `DRIF_PATH1.drif__inv_drif_ras_addr_bits_1_ =1'b0;
      force `DRIF_PATH1.drif__inv_drif_ras_addr_bits_0_ =1'b1;

      force `DRIF_PATH2.drif__inv_drif_ras_addr_bits_3_ =1'b0;
      force `DRIF_PATH2.drif__inv_drif_ras_addr_bits_2_ =1'b0;
      force `DRIF_PATH2.drif__inv_drif_ras_addr_bits_1_ =1'b0;
      force `DRIF_PATH2.drif__inv_drif_ras_addr_bits_0_ =1'b1;

      force `DRIF_PATH3.drif__inv_drif_ras_addr_bits_3_ =1'b0;
      force `DRIF_PATH3.drif__inv_drif_ras_addr_bits_2_ =1'b0;
      force `DRIF_PATH3.drif__inv_drif_ras_addr_bits_1_ =1'b0;
      force `DRIF_PATH3.drif__inv_drif_ras_addr_bits_0_ =1'b1;

      force `DRIF_PATH0.drif__inv_drif_eight_bank_mode  = 1'b1;
      force `DRIF_PATH1.drif__inv_drif_eight_bank_mode  = 1'b1;
      force `DRIF_PATH2.drif__inv_drif_eight_bank_mode  = 1'b1;
      force `DRIF_PATH3.drif__inv_drif_eight_bank_mode  = 1'b1;
`else
      force `DRIF_PATH0.drif_ras_addr_bits[3:0] =4'he;
      force `DRIF_PATH1.drif_ras_addr_bits[3:0] =4'he;
      force `DRIF_PATH2.drif_ras_addr_bits[3:0] =4'he;
      force `DRIF_PATH3.drif_ras_addr_bits[3:0] =4'he;

      force `DRIF_PATH0.drif_eight_bank_mode  = 1'b0;
      force `DRIF_PATH1.drif_eight_bank_mode  = 1'b0;
      force `DRIF_PATH2.drif_eight_bank_mode  = 1'b0;
      force `DRIF_PATH3.drif_eight_bank_mode  = 1'b0;
`endif // mcu_gate

      dimm_size = 2'b01;
    end // }
    else if ($test$plusargs("DIMM_SIZE_256"))
    begin // { 
`ifdef MCU_GATE
      force `DRIF_PATH0.drif__inv_drif_ras_addr_bits_3_ =1'b0;
      force `DRIF_PATH0.drif__inv_drif_ras_addr_bits_2_ =1'b0;
      force `DRIF_PATH0.drif__inv_drif_ras_addr_bits_1_ =1'b1;
      force `DRIF_PATH0.drif__inv_drif_ras_addr_bits_0_ =1'b0;

      force `DRIF_PATH1.drif__inv_drif_ras_addr_bits_3_ =1'b0;
      force `DRIF_PATH1.drif__inv_drif_ras_addr_bits_2_ =1'b0;
      force `DRIF_PATH1.drif__inv_drif_ras_addr_bits_1_ =1'b1;
      force `DRIF_PATH1.drif__inv_drif_ras_addr_bits_0_ =1'b0;

      force `DRIF_PATH2.drif__inv_drif_ras_addr_bits_3_ =1'b0;
      force `DRIF_PATH2.drif__inv_drif_ras_addr_bits_2_ =1'b0;
      force `DRIF_PATH2.drif__inv_drif_ras_addr_bits_1_ =1'b1;
      force `DRIF_PATH2.drif__inv_drif_ras_addr_bits_0_ =1'b0;

      force `DRIF_PATH3.drif__inv_drif_ras_addr_bits_3_ =1'b0;
      force `DRIF_PATH3.drif__inv_drif_ras_addr_bits_2_ =1'b0;
      force `DRIF_PATH3.drif__inv_drif_ras_addr_bits_1_ =1'b1;
      force `DRIF_PATH3.drif__inv_drif_ras_addr_bits_0_ =1'b0;

      force `DRIF_PATH0.drif__inv_drif_eight_bank_mode  = 1'b1;
      force `DRIF_PATH1.drif__inv_drif_eight_bank_mode  = 1'b1;
      force `DRIF_PATH2.drif__inv_drif_eight_bank_mode  = 1'b1;
      force `DRIF_PATH3.drif__inv_drif_eight_bank_mode  = 1'b1;
`else
      force `DRIF_PATH0.drif_ras_addr_bits[3:0] =4'hd;
      force `DRIF_PATH1.drif_ras_addr_bits[3:0] =4'hd;
      force `DRIF_PATH2.drif_ras_addr_bits[3:0] =4'hd;
      force `DRIF_PATH3.drif_ras_addr_bits[3:0] =4'hd;

      force `DRIF_PATH0.drif_eight_bank_mode  = 1'b0;
      force `DRIF_PATH1.drif_eight_bank_mode  = 1'b0;
      force `DRIF_PATH2.drif_eight_bank_mode  = 1'b0;
      force `DRIF_PATH3.drif_eight_bank_mode  = 1'b0;
`endif // mcu_gate

      dimm_size = 2'b00;
    end // } 
    else        
    begin // { 
`ifdef X8
                                // use 1 GB for X8 if DIMM_SIZE_2G specified in diaglists
`ifdef MCU_GATE
      force `DRIF_PATH0.drif__inv_drif_ras_addr_bits_3_ =1'b0;
      force `DRIF_PATH0.drif__inv_drif_ras_addr_bits_2_ =1'b0;
      force `DRIF_PATH0.drif__inv_drif_ras_addr_bits_1_ =1'b0;
      force `DRIF_PATH0.drif__inv_drif_ras_addr_bits_0_ =1'b1;

      force `DRIF_PATH1.drif__inv_drif_ras_addr_bits_3_ =1'b0;
      force `DRIF_PATH1.drif__inv_drif_ras_addr_bits_2_ =1'b0;
      force `DRIF_PATH1.drif__inv_drif_ras_addr_bits_1_ =1'b0;
      force `DRIF_PATH1.drif__inv_drif_ras_addr_bits_0_ =1'b1;

      force `DRIF_PATH2.drif__inv_drif_ras_addr_bits_3_ =1'b0;
      force `DRIF_PATH2.drif__inv_drif_ras_addr_bits_2_ =1'b0;
      force `DRIF_PATH2.drif__inv_drif_ras_addr_bits_1_ =1'b0;
      force `DRIF_PATH2.drif__inv_drif_ras_addr_bits_0_ =1'b1;

      force `DRIF_PATH3.drif__inv_drif_ras_addr_bits_3_ =1'b0;
      force `DRIF_PATH3.drif__inv_drif_ras_addr_bits_2_ =1'b0;
      force `DRIF_PATH3.drif__inv_drif_ras_addr_bits_1_ =1'b0;
      force `DRIF_PATH3.drif__inv_drif_ras_addr_bits_0_ =1'b1;
`else
      force `DRIF_PATH0.drif_ras_addr_bits[3:0] =4'he;
      force `DRIF_PATH1.drif_ras_addr_bits[3:0] =4'he;
      force `DRIF_PATH2.drif_ras_addr_bits[3:0] =4'he;
      force `DRIF_PATH3.drif_ras_addr_bits[3:0] =4'he;
`endif // mcu_gate
`else
      dimm_size = 2'b11;        // use default  = 2G b
`endif
    end // }                              

    //------------------------------------
    // MEMORY CONFIGURATION SETUP
    //------------------------------------

    if ($test$plusargs("DUAL_CHANNEL"))
      chnl_type = 1'b1;				// DUAL CHANNELS PER BRANCH
    else if ($test$plusargs("SNG_CHANNEL"))     
      chnl_type = 1'b0;				// SINGLE CHANNEL PER BRANCH
    else
      chnl_type = 1'b1;                         // DUAL CHANNELS PER BRANCH (Default)

    if ($test$plusargs("RANK_LOW"))
      rank_addr = 1'b0;				// RANK LOW Address Select	
    else if ($test$plusargs("RANK_HIGH")) 
      rank_addr = 1'b1;				// RANK HIGH Address Select
    else
      rank_addr = 1'b1;				// RANK HIGH Address Select (Default)

    if ($test$plusargs("1_FBDIMM"))		// Number of DIMMS
      num_dimms = 3'h1;
    else if ($test$plusargs("2_FBDIMMS"))
      num_dimms = 3'h2;
    else if ($test$plusargs("3_FBDIMMS"))
      num_dimms = 3'h3;
    else if ($test$plusargs("4_FBDIMMS"))
      num_dimms = 3'h4;
    else if ($test$plusargs("5_FBDIMMS"))
      num_dimms = 3'h5;
    else if ($test$plusargs("6_FBDIMMS"))
      num_dimms = 3'h6;
    else if ($test$plusargs("7_FBDIMMS"))
      num_dimms = 3'h7;
    else if ($test$plusargs("8_FBDIMMS"))
      num_dimms = 3'h0;
    else
      num_dimms = 3'h1;				// Default 1 FBDIMM

    if ($test$plusargs("STACK_DIMM"))
      rank = 1'b1;				// 2 RANKS
    else
      rank = 1'b0;				// 1 RANK (Default)

    if ($test$plusargs("X8"))
      dram_part = 1;
    else
      dram_part = 0;


   `PR_ALWAYS("mcu_mem_config", `ALWAYS, "----- FBDIMM MEMORY CONFIGURATION -----  ");
   `PR_ALWAYS("mcu_mem_config", `ALWAYS, "CHANNEL TYPE [ Dual\(1\) / Single\(0\) ] =  %b", chnl_type);
   `PR_ALWAYS("mcu_mem_config", `ALWAYS, "RANK ADDR SELECT TYPE [ High\(1\) / Low\(0\) ] = %b", rank_addr);
   `PR_ALWAYS("mcu_mem_config", `ALWAYS, "NUMBER OF FB-DIMMS/CHANNEL [ 001->1 010->2 100->4 000->8 ] = %b", num_dimms);
   `PR_ALWAYS("mcu_mem_config", `ALWAYS, "RANK SIDES [ Single Sided\(0\) / Double Sided\(1\) ] = %b", rank);
   `PR_ALWAYS("mcu_mem_config", `ALWAYS, "DIMM Size [ 00->256Mb 01->512Mb 10->1Gb 11->2Gb ] = %b",dimm_size);
   `PR_ALWAYS("mcu_mem_config", `ALWAYS, "DRAM PART [ X4\(0\) / X8\(1\) ] =  %b", dram_part);
   `PR_ALWAYS("mcu_mem_config", `ALWAYS, "----------------------------------------  ");

    //---------------------------------------------------------------
    // 			CHANNEL TYPE	
    //---------------------------------------------------------------

    if (chnl_type == 1'b0)
    begin // {
`ifdef MCU_GATE
      force `DRIF_PATH0.drif__n32447  = 1'b1;
      force `DRIF_PATH1.drif__n32447  = 1'b1;
      force `DRIF_PATH2.drif__n32447  = 1'b1;
      force `DRIF_PATH3.drif__n32447  = 1'b1;
`else
      force `DRIF_PATH0.drif_single_channel_mode  = 1'b1;
      force `DRIF_PATH1.drif_single_channel_mode  = 1'b1;
      force `DRIF_PATH2.drif_single_channel_mode  = 1'b1;
      force `DRIF_PATH3.drif_single_channel_mode  = 1'b1;
`endif // mcu_gate

    end // }

    //------------------------------------------------------------
    //			RANK HIGH / LOW 
    //			NO. OF DIMMS
    //			SINGLE / DUAL RANK
    //------------------------------------------------------------

    if (mcu_reg_slam_en) 
    case ({rank_addr, num_dimms, rank}) 

    //-----------------------------------------------
    // 			RANK HIGH
    //-----------------------------------------------

    //-------------
    // SINGLE RANK 
    //-------------

    5'b1_001_0: 
               begin // {
`ifdef MCU_GATE
                 force `DRIF_PATH0.drif__n32443  = 1'b0;
                 force `DRIF_PATH1.drif__n32443  = 1'b0;
                 force `DRIF_PATH2.drif__n32443  = 1'b0;
                 force `DRIF_PATH3.drif__n32443  = 1'b0;

                 force `DRIF_PATH0.drif__n32446  = 1'b0;
                 force `DRIF_PATH1.drif__n32446  = 1'b0;
                 force `DRIF_PATH2.drif__n32446  = 1'b0;
                 force `DRIF_PATH3.drif__n32446  = 1'b0;

                 force `DRIF_PATH0.drif__n32440 = 1'b0;
                 force `DRIF_PATH0.drif__n32441 = 1'b0;
                 force `DRIF_PATH0.drif__inv_drif_dimms_present = 1'b0;

                 force `DRIF_PATH1.drif__n32440 = 1'b0;
                 force `DRIF_PATH1.drif__n32441 = 1'b0;
                 force `DRIF_PATH1.drif__inv_drif_dimms_present = 1'b0;

                 force `DRIF_PATH2.drif__n32440 = 1'b0;
                 force `DRIF_PATH2.drif__n32441 = 1'b0;
                 force `DRIF_PATH2.drif__inv_drif_dimms_present = 1'b0;

                 force `DRIF_PATH3.drif__n32440 = 1'b0;
                 force `DRIF_PATH3.drif__n32441 = 1'b0;
                 force `DRIF_PATH3.drif__inv_drif_dimms_present = 1'b0;

                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_3_ = 1'b0;

                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_3_ = 1'b0;

                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_3_ = 1'b0;

                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_3_ = 1'b0;
`else
                 force `DRIF_PATH0.drif_addr_bank_low_sel  = 1'b0;
                 force `DRIF_PATH1.drif_addr_bank_low_sel  = 1'b0;
                 force `DRIF_PATH2.drif_addr_bank_low_sel  = 1'b0;
                 force `DRIF_PATH3.drif_addr_bank_low_sel  = 1'b0;

                 force `DRIF_PATH0.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH1.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH2.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH3.drif_stacked_dimm       = 1'b0;

                 force `DRIF_PATH0.drif_dimms_present[2:0] = 3'h1;
                 force `DRIF_PATH1.drif_dimms_present[2:0] = 3'h1;
                 force `DRIF_PATH2.drif_dimms_present[2:0] = 3'h1;
                 force `DRIF_PATH3.drif_dimms_present[2:0] = 3'h1;

                 force `FBDIC_PATH0.amb_id		   = 4'h0;
                 force `FBDIC_PATH1.amb_id		   = 4'h0;
                 force `FBDIC_PATH2.amb_id		   = 4'h0;
                 force `FBDIC_PATH3.amb_id		   = 4'h0;
`endif // mcu_gate

               end // }

    5'b1_010_0: 
               begin // {
`ifdef MCU_GATE
                 force `DRIF_PATH0.drif__n32443  = 1'b0;
                 force `DRIF_PATH1.drif__n32443  = 1'b0;
                 force `DRIF_PATH2.drif__n32443  = 1'b0;
                 force `DRIF_PATH3.drif__n32443  = 1'b0;

                 force `DRIF_PATH0.drif__n32446  = 1'b0;
                 force `DRIF_PATH1.drif__n32446  = 1'b0;
                 force `DRIF_PATH2.drif__n32446  = 1'b0;
                 force `DRIF_PATH3.drif__n32446  = 1'b0;

                 force `DRIF_PATH0.drif__n32440 = 1'b0;
                 force `DRIF_PATH0.drif__n32441 = 1'b1;
                 force `DRIF_PATH0.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH1.drif__n32440 = 1'b0;
                 force `DRIF_PATH1.drif__n32441 = 1'b1;
                 force `DRIF_PATH1.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH2.drif__n32440 = 1'b0;
                 force `DRIF_PATH2.drif__n32441 = 1'b1;
                 force `DRIF_PATH2.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH3.drif__n32440 = 1'b0;
                 force `DRIF_PATH3.drif__n32441 = 1'b1;
                 force `DRIF_PATH3.drif__inv_drif_dimms_present = 1'b1;

                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_3_ = 1'b1;
`else
                 force `DRIF_PATH0.drif_addr_bank_low_sel  = 1'b0;
                 force `DRIF_PATH1.drif_addr_bank_low_sel  = 1'b0;
                 force `DRIF_PATH2.drif_addr_bank_low_sel  = 1'b0;
                 force `DRIF_PATH3.drif_addr_bank_low_sel  = 1'b0;

                 force `DRIF_PATH0.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH1.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH2.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH3.drif_stacked_dimm       = 1'b0;

                 force `DRIF_PATH0.drif_dimms_present[2:0] = 3'h2;
                 force `DRIF_PATH1.drif_dimms_present[2:0] = 3'h2;
                 force `DRIF_PATH2.drif_dimms_present[2:0] = 3'h2;
                 force `DRIF_PATH3.drif_dimms_present[2:0] = 3'h2;

                 force `FBDIC_PATH0.amb_id		   = 4'h1;
                 force `FBDIC_PATH1.amb_id		   = 4'h1;
                 force `FBDIC_PATH2.amb_id		   = 4'h1;
                 force `FBDIC_PATH3.amb_id		   = 4'h1;
`endif // mcu_gate

               end // }

    5'b1_100_0: 
               begin // {
`ifdef MCU_GATE
                 force `DRIF_PATH0.drif__n32443  = 1'b0;
                 force `DRIF_PATH1.drif__n32443  = 1'b0;
                 force `DRIF_PATH2.drif__n32443  = 1'b0;
                 force `DRIF_PATH3.drif__n32443  = 1'b0;

                 force `DRIF_PATH0.drif__n32446  = 1'b0;
                 force `DRIF_PATH1.drif__n32446  = 1'b0;
                 force `DRIF_PATH2.drif__n32446  = 1'b0;
                 force `DRIF_PATH3.drif__n32446  = 1'b0;

                 force `DRIF_PATH0.drif__n32440 = 1'b1;
                 force `DRIF_PATH0.drif__n32441 = 1'b0;
                 force `DRIF_PATH0.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH1.drif__n32440 = 1'b1;
                 force `DRIF_PATH1.drif__n32441 = 1'b0;
                 force `DRIF_PATH1.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH2.drif__n32440 = 1'b1;
                 force `DRIF_PATH2.drif__n32441 = 1'b0;
                 force `DRIF_PATH2.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH3.drif__n32440 = 1'b1;
                 force `DRIF_PATH3.drif__n32441 = 1'b0;
                 force `DRIF_PATH3.drif__inv_drif_dimms_present = 1'b1;

                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_3_ = 1'b1;
`else
                 force `DRIF_PATH0.drif_addr_bank_low_sel  = 1'b0;
                 force `DRIF_PATH1.drif_addr_bank_low_sel  = 1'b0;
                 force `DRIF_PATH2.drif_addr_bank_low_sel  = 1'b0;
                 force `DRIF_PATH3.drif_addr_bank_low_sel  = 1'b0;

                 force `DRIF_PATH0.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH1.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH2.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH3.drif_stacked_dimm       = 1'b0;

                 force `DRIF_PATH0.drif_dimms_present[2:0] = 3'h4;
                 force `DRIF_PATH1.drif_dimms_present[2:0] = 3'h4;
                 force `DRIF_PATH2.drif_dimms_present[2:0] = 3'h4;
                 force `DRIF_PATH3.drif_dimms_present[2:0] = 3'h4;

                 force `FBDIC_PATH0.amb_id		   = 4'h3;
                 force `FBDIC_PATH1.amb_id		   = 4'h3;
                 force `FBDIC_PATH2.amb_id		   = 4'h3;
                 force `FBDIC_PATH3.amb_id		   = 4'h3;
`endif // mcu_gate

               end // }

    5'b1_000_0: 
               begin // {
`ifdef MCU_GATE
                 force `DRIF_PATH0.drif__n32443  = 1'b0;
                 force `DRIF_PATH1.drif__n32443  = 1'b0;
                 force `DRIF_PATH2.drif__n32443  = 1'b0;
                 force `DRIF_PATH3.drif__n32443  = 1'b0;

                 force `DRIF_PATH0.drif__n32446  = 1'b0;
                 force `DRIF_PATH1.drif__n32446  = 1'b0;
                 force `DRIF_PATH2.drif__n32446  = 1'b0;
                 force `DRIF_PATH3.drif__n32446  = 1'b0;

                 force `DRIF_PATH0.drif__n32440 = 1'b0;			// 8 dimms
                 force `DRIF_PATH0.drif__n32441 = 1'b0;
                 force `DRIF_PATH0.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH1.drif__n32440 = 1'b0;
                 force `DRIF_PATH1.drif__n32441 = 1'b0;
                 force `DRIF_PATH1.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH2.drif__n32440 = 1'b0;
                 force `DRIF_PATH2.drif__n32441 = 1'b0;
                 force `DRIF_PATH2.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH3.drif__n32440 = 1'b0;
                 force `DRIF_PATH3.drif__n32441 = 1'b0;
                 force `DRIF_PATH3.drif__inv_drif_dimms_present = 1'b1;

                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_5_ = 1'b1;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_5_ = 1'b1;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_5_ = 1'b1;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_5_ = 1'b1;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_3_ = 1'b1;
`else
                 force `DRIF_PATH0.drif_addr_bank_low_sel  = 1'b0;
                 force `DRIF_PATH1.drif_addr_bank_low_sel  = 1'b0;
                 force `DRIF_PATH2.drif_addr_bank_low_sel  = 1'b0;
                 force `DRIF_PATH3.drif_addr_bank_low_sel  = 1'b0;

                 force `DRIF_PATH0.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH1.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH2.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH3.drif_stacked_dimm       = 1'b0;

                 force `DRIF_PATH0.drif_dimms_present[2:0] = 3'h0;	// 8 dimms
                 force `DRIF_PATH1.drif_dimms_present[2:0] = 3'h0;
                 force `DRIF_PATH2.drif_dimms_present[2:0] = 3'h0;
                 force `DRIF_PATH3.drif_dimms_present[2:0] = 3'h0;

                 force `FBDIC_PATH0.amb_id		   = 4'h7;
                 force `FBDIC_PATH1.amb_id		   = 4'h7;
                 force `FBDIC_PATH2.amb_id		   = 4'h7;
                 force `FBDIC_PATH3.amb_id		   = 4'h7;
`endif // mcu_gate

               end // }


    //------------
    // DUAL RANKS
    //------------

    5'b1_001_1: 
               begin // {
`ifdef MCU_GATE
                 force `DRIF_PATH0.drif__n32443  = 1'b0;
                 force `DRIF_PATH1.drif__n32443  = 1'b0;
                 force `DRIF_PATH2.drif__n32443  = 1'b0;
                 force `DRIF_PATH3.drif__n32443  = 1'b0;

                 force `DRIF_PATH0.drif__n32446  = 1'b1;
                 force `DRIF_PATH1.drif__n32446  = 1'b1;
                 force `DRIF_PATH2.drif__n32446  = 1'b1;
                 force `DRIF_PATH3.drif__n32446  = 1'b1;

                 force `DRIF_PATH0.drif__n32440 = 1'b0;
                 force `DRIF_PATH0.drif__n32441 = 1'b0;
                 force `DRIF_PATH0.drif__inv_drif_dimms_present = 1'b0;

                 force `DRIF_PATH1.drif__n32440 = 1'b0;
                 force `DRIF_PATH1.drif__n32441 = 1'b0;
                 force `DRIF_PATH1.drif__inv_drif_dimms_present = 1'b0;

                 force `DRIF_PATH2.drif__n32440 = 1'b0;
                 force `DRIF_PATH2.drif__n32441 = 1'b0;
                 force `DRIF_PATH2.drif__inv_drif_dimms_present = 1'b0;

                 force `DRIF_PATH3.drif__n32440 = 1'b0;
                 force `DRIF_PATH3.drif__n32441 = 1'b0;
                 force `DRIF_PATH3.drif__inv_drif_dimms_present = 1'b0;

                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_3_ = 1'b0;

                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_3_ = 1'b0;

                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_3_ = 1'b0;

                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_3_ = 1'b0;
`else
                 force `DRIF_PATH0.drif_addr_bank_low_sel  = 1'b0;
                 force `DRIF_PATH1.drif_addr_bank_low_sel  = 1'b0;
                 force `DRIF_PATH2.drif_addr_bank_low_sel  = 1'b0;
                 force `DRIF_PATH3.drif_addr_bank_low_sel  = 1'b0;

                 force `DRIF_PATH0.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH1.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH2.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH3.drif_stacked_dimm       = 1'b1;

                 force `DRIF_PATH0.drif_dimms_present[2:0] = 3'h1;
                 force `DRIF_PATH1.drif_dimms_present[2:0] = 3'h1;
                 force `DRIF_PATH2.drif_dimms_present[2:0] = 3'h1;
                 force `DRIF_PATH3.drif_dimms_present[2:0] = 3'h1;

                 force `FBDIC_PATH0.amb_id		   = 4'h0;
                 force `FBDIC_PATH1.amb_id		   = 4'h0;
                 force `FBDIC_PATH2.amb_id		   = 4'h0;
                 force `FBDIC_PATH3.amb_id		   = 4'h0;
`endif // mcu_gate

               end // }

    5'b1_010_1: 
               begin // {
`ifdef MCU_GATE
                 force `DRIF_PATH0.drif__n32443  = 1'b0;
                 force `DRIF_PATH1.drif__n32443  = 1'b0;
                 force `DRIF_PATH2.drif__n32443  = 1'b0;
                 force `DRIF_PATH3.drif__n32443  = 1'b0;

                 force `DRIF_PATH0.drif__n32446  = 1'b1;
                 force `DRIF_PATH1.drif__n32446  = 1'b1;
                 force `DRIF_PATH2.drif__n32446  = 1'b1;
                 force `DRIF_PATH3.drif__n32446  = 1'b1;

                 force `DRIF_PATH0.drif__n32440 = 1'b0;
                 force `DRIF_PATH0.drif__n32441 = 1'b1;
                 force `DRIF_PATH0.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH1.drif__n32440 = 1'b0;
                 force `DRIF_PATH1.drif__n32441 = 1'b1;
                 force `DRIF_PATH1.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH2.drif__n32440 = 1'b0;
                 force `DRIF_PATH2.drif__n32441 = 1'b1;
                 force `DRIF_PATH2.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH3.drif__n32440 = 1'b0;
                 force `DRIF_PATH3.drif__n32441 = 1'b1;
                 force `DRIF_PATH3.drif__inv_drif_dimms_present = 1'b1;

                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_3_ = 1'b1;
`else
                 force `DRIF_PATH0.drif_addr_bank_low_sel  = 1'b0;
                 force `DRIF_PATH1.drif_addr_bank_low_sel  = 1'b0;
                 force `DRIF_PATH2.drif_addr_bank_low_sel  = 1'b0;
                 force `DRIF_PATH3.drif_addr_bank_low_sel  = 1'b0;

                 force `DRIF_PATH0.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH1.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH2.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH3.drif_stacked_dimm       = 1'b1;

                 force `DRIF_PATH0.drif_dimms_present[2:0] = 3'h2;
                 force `DRIF_PATH1.drif_dimms_present[2:0] = 3'h2;
                 force `DRIF_PATH2.drif_dimms_present[2:0] = 3'h2;
                 force `DRIF_PATH3.drif_dimms_present[2:0] = 3'h2;

                 force `FBDIC_PATH0.amb_id		   = 4'h1;
                 force `FBDIC_PATH1.amb_id		   = 4'h1;
                 force `FBDIC_PATH2.amb_id		   = 4'h1;
                 force `FBDIC_PATH3.amb_id		   = 4'h1;
`endif // mcu_gate

               end // }

    5'b1_100_1: 
               begin // {
`ifdef MCU_GATE
                 force `DRIF_PATH0.drif__n32443  = 1'b0;
                 force `DRIF_PATH1.drif__n32443  = 1'b0;
                 force `DRIF_PATH2.drif__n32443  = 1'b0;
                 force `DRIF_PATH3.drif__n32443  = 1'b0;

                 force `DRIF_PATH0.drif__n32446  = 1'b1;
                 force `DRIF_PATH1.drif__n32446  = 1'b1;
                 force `DRIF_PATH2.drif__n32446  = 1'b1;
                 force `DRIF_PATH3.drif__n32446  = 1'b1;

                 force `DRIF_PATH0.drif__n32440 = 1'b1;
                 force `DRIF_PATH0.drif__n32441 = 1'b0;
                 force `DRIF_PATH0.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH1.drif__n32440 = 1'b1;
                 force `DRIF_PATH1.drif__n32441 = 1'b0;
                 force `DRIF_PATH1.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH2.drif__n32440 = 1'b1;
                 force `DRIF_PATH2.drif__n32441 = 1'b0;
                 force `DRIF_PATH2.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH3.drif__n32440 = 1'b1;
                 force `DRIF_PATH3.drif__n32441 = 1'b0;
                 force `DRIF_PATH3.drif__inv_drif_dimms_present = 1'b1;

                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_3_ = 1'b1;
`else
                 force `DRIF_PATH0.drif_addr_bank_low_sel  = 1'b0;
                 force `DRIF_PATH1.drif_addr_bank_low_sel  = 1'b0;
                 force `DRIF_PATH2.drif_addr_bank_low_sel  = 1'b0;
                 force `DRIF_PATH3.drif_addr_bank_low_sel  = 1'b0;

                 force `DRIF_PATH0.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH1.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH2.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH3.drif_stacked_dimm       = 1'b1;

                 force `DRIF_PATH0.drif_dimms_present[2:0] = 3'h4;
                 force `DRIF_PATH1.drif_dimms_present[2:0] = 3'h4;
                 force `DRIF_PATH2.drif_dimms_present[2:0] = 3'h4;
                 force `DRIF_PATH3.drif_dimms_present[2:0] = 3'h4;

                 force `FBDIC_PATH0.amb_id		   = 4'h3;
                 force `FBDIC_PATH1.amb_id		   = 4'h3;
                 force `FBDIC_PATH2.amb_id		   = 4'h3;
                 force `FBDIC_PATH3.amb_id		   = 4'h3;
`endif // mcu_gate

               end // }

    5'b1_000_1: 
               begin // {
`ifdef MCU_GATE
                 force `DRIF_PATH0.drif__n32443  = 1'b0;
                 force `DRIF_PATH1.drif__n32443  = 1'b0;
                 force `DRIF_PATH2.drif__n32443  = 1'b0;
                 force `DRIF_PATH3.drif__n32443  = 1'b0;

                 force `DRIF_PATH0.drif__n32446  = 1'b1;
                 force `DRIF_PATH1.drif__n32446  = 1'b1;
                 force `DRIF_PATH2.drif__n32446  = 1'b1;
                 force `DRIF_PATH3.drif__n32446  = 1'b1;

                 force `DRIF_PATH0.drif__n32440 = 1'b0;			// 8 dimms
                 force `DRIF_PATH0.drif__n32441 = 1'b0;
                 force `DRIF_PATH0.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH1.drif__n32440 = 1'b0;
                 force `DRIF_PATH1.drif__n32441 = 1'b0;
                 force `DRIF_PATH1.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH2.drif__n32440 = 1'b0;
                 force `DRIF_PATH2.drif__n32441 = 1'b0;
                 force `DRIF_PATH2.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH3.drif__n32440 = 1'b0;
                 force `DRIF_PATH3.drif__n32441 = 1'b0;
                 force `DRIF_PATH3.drif__inv_drif_dimms_present = 1'b1;

                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_5_ = 1'b1;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_5_ = 1'b1;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_5_ = 1'b1;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_5_ = 1'b1;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_3_ = 1'b1;
`else
                 force `DRIF_PATH0.drif_addr_bank_low_sel  = 1'b0;
                 force `DRIF_PATH1.drif_addr_bank_low_sel  = 1'b0;
                 force `DRIF_PATH2.drif_addr_bank_low_sel  = 1'b0;
                 force `DRIF_PATH3.drif_addr_bank_low_sel  = 1'b0;

                 force `DRIF_PATH0.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH1.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH2.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH3.drif_stacked_dimm       = 1'b1;

                 force `DRIF_PATH0.drif_dimms_present[2:0] = 3'h0;    // 8 dimms
                 force `DRIF_PATH1.drif_dimms_present[2:0] = 3'h0;
                 force `DRIF_PATH2.drif_dimms_present[2:0] = 3'h0;
                 force `DRIF_PATH3.drif_dimms_present[2:0] = 3'h0;

                 force `FBDIC_PATH0.amb_id		   = 4'h7;
                 force `FBDIC_PATH1.amb_id		   = 4'h7;
                 force `FBDIC_PATH2.amb_id		   = 4'h7;
                 force `FBDIC_PATH3.amb_id		   = 4'h7;
`endif // mcu_gate

               end // }

    //---------------------------------------------------------------
    // 				RANK LOW
    //---------------------------------------------------------------

    //--------------
    // SINGLE RANK 
    //--------------

    5'b0_001_0: 
               begin // {
`ifdef MCU_GATE
                 force `DRIF_PATH0.drif__n32443  = 1'b1;
                 force `DRIF_PATH1.drif__n32443  = 1'b1;
                 force `DRIF_PATH2.drif__n32443  = 1'b1;
                 force `DRIF_PATH3.drif__n32443  = 1'b1;

                 force `DRIF_PATH0.drif__n32446  = 1'b0;
                 force `DRIF_PATH1.drif__n32446  = 1'b0;
                 force `DRIF_PATH2.drif__n32446  = 1'b0;
                 force `DRIF_PATH3.drif__n32446  = 1'b0;

                 force `DRIF_PATH0.drif__n32440 = 1'b0;
                 force `DRIF_PATH0.drif__n32441 = 1'b0;
                 force `DRIF_PATH0.drif__inv_drif_dimms_present = 1'b0;

                 force `DRIF_PATH1.drif__n32440 = 1'b0;
                 force `DRIF_PATH1.drif__n32441 = 1'b0;
                 force `DRIF_PATH1.drif__inv_drif_dimms_present = 1'b0;

                 force `DRIF_PATH2.drif__n32440 = 1'b0;
                 force `DRIF_PATH2.drif__n32441 = 1'b0;
                 force `DRIF_PATH2.drif__inv_drif_dimms_present = 1'b0;

                 force `DRIF_PATH3.drif__n32440 = 1'b0;
                 force `DRIF_PATH3.drif__n32441 = 1'b0;
                 force `DRIF_PATH3.drif__inv_drif_dimms_present = 1'b0;

                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_3_ = 1'b0;

                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_3_ = 1'b0;

                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_3_ = 1'b0;

                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_3_ = 1'b0;
`else
                 force `DRIF_PATH0.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH1.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH2.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH3.drif_addr_bank_low_sel  = 1'b1;

                 force `DRIF_PATH0.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH1.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH2.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH3.drif_stacked_dimm       = 1'b0;

                 force `DRIF_PATH0.drif_dimms_present[2:0] = 3'h1;
                 force `DRIF_PATH1.drif_dimms_present[2:0] = 3'h1;
                 force `DRIF_PATH2.drif_dimms_present[2:0] = 3'h1;
                 force `DRIF_PATH3.drif_dimms_present[2:0] = 3'h1;

                 force `FBDIC_PATH0.amb_id		   = 4'h0;
                 force `FBDIC_PATH1.amb_id		   = 4'h0;
                 force `FBDIC_PATH2.amb_id		   = 4'h0;
                 force `FBDIC_PATH3.amb_id		   = 4'h0;
`endif // mcu_gate

               end // }

    5'b0_010_0: 
               begin // {
`ifdef MCU_GATE
                 force `DRIF_PATH0.drif__n32443  = 1'b1;
                 force `DRIF_PATH1.drif__n32443  = 1'b1;
                 force `DRIF_PATH2.drif__n32443  = 1'b1;
                 force `DRIF_PATH3.drif__n32443  = 1'b1;

                 force `DRIF_PATH0.drif__n32446  = 1'b0;
                 force `DRIF_PATH1.drif__n32446  = 1'b0;
                 force `DRIF_PATH2.drif__n32446  = 1'b0;
                 force `DRIF_PATH3.drif__n32446  = 1'b0;

                 force `DRIF_PATH0.drif__n32440 = 1'b0;
                 force `DRIF_PATH0.drif__n32441 = 1'b1;
                 force `DRIF_PATH0.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH1.drif__n32440 = 1'b0;
                 force `DRIF_PATH1.drif__n32441 = 1'b1;
                 force `DRIF_PATH1.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH2.drif__n32440 = 1'b0;
                 force `DRIF_PATH2.drif__n32441 = 1'b1;
                 force `DRIF_PATH2.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH3.drif__n32440 = 1'b0;
                 force `DRIF_PATH3.drif__n32441 = 1'b1;
                 force `DRIF_PATH3.drif__inv_drif_dimms_present = 1'b1;

                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_3_ = 1'b1;
`else
                 force `DRIF_PATH0.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH1.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH2.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH3.drif_addr_bank_low_sel  = 1'b1;

                 force `DRIF_PATH0.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH1.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH2.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH3.drif_stacked_dimm       = 1'b0;

                 force `DRIF_PATH0.drif_dimms_present[2:0] = 3'h2;
                 force `DRIF_PATH1.drif_dimms_present[2:0] = 3'h2;
                 force `DRIF_PATH2.drif_dimms_present[2:0] = 3'h2;
                 force `DRIF_PATH3.drif_dimms_present[2:0] = 3'h2;

                 force `FBDIC_PATH0.amb_id		   = 4'h1;
                 force `FBDIC_PATH1.amb_id		   = 4'h1;
                 force `FBDIC_PATH2.amb_id		   = 4'h1;
                 force `FBDIC_PATH3.amb_id		   = 4'h1;
`endif // mcu_gate

               end // }

    5'b0_100_0: 
               begin // {
`ifdef MCU_GATE
                 force `DRIF_PATH0.drif__n32443  = 1'b1;
                 force `DRIF_PATH1.drif__n32443  = 1'b1;
                 force `DRIF_PATH2.drif__n32443  = 1'b1;
                 force `DRIF_PATH3.drif__n32443  = 1'b1;

                 force `DRIF_PATH0.drif__n32446  = 1'b0;
                 force `DRIF_PATH1.drif__n32446  = 1'b0;
                 force `DRIF_PATH2.drif__n32446  = 1'b0;
                 force `DRIF_PATH3.drif__n32446  = 1'b0;

                 force `DRIF_PATH0.drif__n32440 = 1'b1;
                 force `DRIF_PATH0.drif__n32441 = 1'b0;
                 force `DRIF_PATH0.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH1.drif__n32440 = 1'b1;
                 force `DRIF_PATH1.drif__n32441 = 1'b0;
                 force `DRIF_PATH1.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH2.drif__n32440 = 1'b1;
                 force `DRIF_PATH2.drif__n32441 = 1'b0;
                 force `DRIF_PATH2.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH3.drif__n32440 = 1'b1;
                 force `DRIF_PATH3.drif__n32441 = 1'b0;
                 force `DRIF_PATH3.drif__inv_drif_dimms_present = 1'b1;

                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_3_ = 1'b1;
`else
                 force `DRIF_PATH0.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH1.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH2.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH3.drif_addr_bank_low_sel  = 1'b1;

                 force `DRIF_PATH0.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH1.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH2.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH3.drif_stacked_dimm       = 1'b0;

                 force `DRIF_PATH0.drif_dimms_present[2:0] = 3'h4;
                 force `DRIF_PATH1.drif_dimms_present[2:0] = 3'h4;
                 force `DRIF_PATH2.drif_dimms_present[2:0] = 3'h4;
                 force `DRIF_PATH3.drif_dimms_present[2:0] = 3'h4;

                 force `FBDIC_PATH0.amb_id		   = 4'h3;
                 force `FBDIC_PATH1.amb_id		   = 4'h3;
                 force `FBDIC_PATH2.amb_id		   = 4'h3;
                 force `FBDIC_PATH3.amb_id		   = 4'h3;
`endif // mcu_gate

               end // }

    5'b0_110_0: 
               begin // {
`ifdef MCU_GATE
                 force `DRIF_PATH0.drif__n32443  = 1'b1;
                 force `DRIF_PATH1.drif__n32443  = 1'b1;
                 force `DRIF_PATH2.drif__n32443  = 1'b1;
                 force `DRIF_PATH3.drif__n32443  = 1'b1;

                 force `DRIF_PATH0.drif__n32446  = 1'b0;
                 force `DRIF_PATH1.drif__n32446  = 1'b0;
                 force `DRIF_PATH2.drif__n32446  = 1'b0;
                 force `DRIF_PATH3.drif__n32446  = 1'b0;

                 force `DRIF_PATH0.drif__n32440 = 1'b1;
                 force `DRIF_PATH0.drif__n32441 = 1'b1;
                 force `DRIF_PATH0.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH1.drif__n32440 = 1'b1;
                 force `DRIF_PATH1.drif__n32441 = 1'b1;
                 force `DRIF_PATH1.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH2.drif__n32440 = 1'b1;
                 force `DRIF_PATH2.drif__n32441 = 1'b1;
                 force `DRIF_PATH2.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH3.drif__n32440 = 1'b1;
                 force `DRIF_PATH3.drif__n32441 = 1'b1;
                 force `DRIF_PATH3.drif__inv_drif_dimms_present = 1'b1;

                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_5_ = 1'b1;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_5_ = 1'b1;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_5_ = 1'b1;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_5_ = 1'b1;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_3_ = 1'b1;
`else
                 force `DRIF_PATH0.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH1.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH2.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH3.drif_addr_bank_low_sel  = 1'b1;

                 force `DRIF_PATH0.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH1.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH2.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH3.drif_stacked_dimm       = 1'b0;

                 force `DRIF_PATH0.drif_dimms_present[2:0] = 3'h6;
                 force `DRIF_PATH1.drif_dimms_present[2:0] = 3'h6;
                 force `DRIF_PATH2.drif_dimms_present[2:0] = 3'h6;
                 force `DRIF_PATH3.drif_dimms_present[2:0] = 3'h6;

                 force `FBDIC_PATH0.amb_id		   = 4'h5;
                 force `FBDIC_PATH1.amb_id		   = 4'h5;
                 force `FBDIC_PATH2.amb_id		   = 4'h5;
                 force `FBDIC_PATH3.amb_id		   = 4'h5;
`endif // mcu_gate

               end // }

    5'b0_000_0: 
               begin // {
`ifdef MCU_GATE
                 force `DRIF_PATH0.drif__n32443  = 1'b1;
                 force `DRIF_PATH1.drif__n32443  = 1'b1;
                 force `DRIF_PATH2.drif__n32443  = 1'b1;
                 force `DRIF_PATH3.drif__n32443  = 1'b1;

                 force `DRIF_PATH0.drif__n32446  = 1'b0;
                 force `DRIF_PATH1.drif__n32446  = 1'b0;
                 force `DRIF_PATH2.drif__n32446  = 1'b0;
                 force `DRIF_PATH3.drif__n32446  = 1'b0;

                 force `DRIF_PATH0.drif__n32440 = 1'b0;			// 8 dimms
                 force `DRIF_PATH0.drif__n32441 = 1'b0;
                 force `DRIF_PATH0.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH1.drif__n32440 = 1'b0;
                 force `DRIF_PATH1.drif__n32441 = 1'b0;
                 force `DRIF_PATH1.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH2.drif__n32440 = 1'b0;
                 force `DRIF_PATH2.drif__n32441 = 1'b0;
                 force `DRIF_PATH2.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH3.drif__n32440 = 1'b0;
                 force `DRIF_PATH3.drif__n32441 = 1'b0;
                 force `DRIF_PATH3.drif__inv_drif_dimms_present = 1'b1;

                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_5_ = 1'b1;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_5_ = 1'b1;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_5_ = 1'b1;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_5_ = 1'b1;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_3_ = 1'b1;
`else
                 force `DRIF_PATH0.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH1.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH2.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH3.drif_addr_bank_low_sel  = 1'b1;

                 force `DRIF_PATH0.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH1.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH2.drif_stacked_dimm       = 1'b0;
                 force `DRIF_PATH3.drif_stacked_dimm       = 1'b0;

                 force `DRIF_PATH0.drif_dimms_present[2:0] = 3'h0;	// 8 dimms
                 force `DRIF_PATH1.drif_dimms_present[2:0] = 3'h0;
                 force `DRIF_PATH2.drif_dimms_present[2:0] = 3'h0;
                 force `DRIF_PATH3.drif_dimms_present[2:0] = 3'h0;

                 force `FBDIC_PATH0.amb_id		   = 4'h7;
                 force `FBDIC_PATH1.amb_id		   = 4'h7;
                 force `FBDIC_PATH2.amb_id		   = 4'h7;
                 force `FBDIC_PATH3.amb_id		   = 4'h7;
`endif // mcu_gate

               end // }


    //------------
    // DUAL RANKS
    //------------

    5'b0_001_1: 
               begin // {
`ifdef MCU_GATE
                 force `DRIF_PATH0.drif__n32443  = 1'b1;
                 force `DRIF_PATH1.drif__n32443  = 1'b1;
                 force `DRIF_PATH2.drif__n32443  = 1'b1;
                 force `DRIF_PATH3.drif__n32443  = 1'b1;

                 force `DRIF_PATH0.drif__n32446  = 1'b1;
                 force `DRIF_PATH1.drif__n32446  = 1'b1;
                 force `DRIF_PATH2.drif__n32446  = 1'b1;
                 force `DRIF_PATH3.drif__n32446  = 1'b1;

                 force `DRIF_PATH0.drif__n32440 = 1'b0;
                 force `DRIF_PATH0.drif__n32441 = 1'b0;
                 force `DRIF_PATH0.drif__inv_drif_dimms_present = 1'b0;

                 force `DRIF_PATH1.drif__n32440 = 1'b0;
                 force `DRIF_PATH1.drif__n32441 = 1'b0;
                 force `DRIF_PATH1.drif__inv_drif_dimms_present = 1'b0;

                 force `DRIF_PATH2.drif__n32440 = 1'b0;
                 force `DRIF_PATH2.drif__n32441 = 1'b0;
                 force `DRIF_PATH2.drif__inv_drif_dimms_present = 1'b0;

                 force `DRIF_PATH3.drif__n32440 = 1'b0;
                 force `DRIF_PATH3.drif__n32441 = 1'b0;
                 force `DRIF_PATH3.drif__inv_drif_dimms_present = 1'b0;

                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_3_ = 1'b0;

                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_3_ = 1'b0;

                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_3_ = 1'b0;

                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_3_ = 1'b0;
`else
                 force `DRIF_PATH0.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH1.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH2.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH3.drif_addr_bank_low_sel  = 1'b1;

                 force `DRIF_PATH0.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH1.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH2.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH3.drif_stacked_dimm       = 1'b1;

                 force `DRIF_PATH0.drif_dimms_present[2:0] = 3'h1;
                 force `DRIF_PATH1.drif_dimms_present[2:0] = 3'h1;
                 force `DRIF_PATH2.drif_dimms_present[2:0] = 3'h1;
                 force `DRIF_PATH3.drif_dimms_present[2:0] = 3'h1;

                 force `FBDIC_PATH0.amb_id		   = 4'h0;
                 force `FBDIC_PATH1.amb_id		   = 4'h0;
                 force `FBDIC_PATH2.amb_id		   = 4'h0;
                 force `FBDIC_PATH3.amb_id		   = 4'h0;
`endif // mcu_gate

               end // }

    5'b0_010_1: 
               begin // {
`ifdef MCU_GATE
                 force `DRIF_PATH0.drif__n32443  = 1'b1;
                 force `DRIF_PATH1.drif__n32443  = 1'b1;
                 force `DRIF_PATH2.drif__n32443  = 1'b1;
                 force `DRIF_PATH3.drif__n32443  = 1'b1;

                 force `DRIF_PATH0.drif__n32446  = 1'b1;
                 force `DRIF_PATH1.drif__n32446  = 1'b1;
                 force `DRIF_PATH2.drif__n32446  = 1'b1;
                 force `DRIF_PATH3.drif__n32446  = 1'b1;

                 force `DRIF_PATH0.drif__n32440 = 1'b0;
                 force `DRIF_PATH0.drif__n32441 = 1'b1;
                 force `DRIF_PATH0.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH1.drif__n32440 = 1'b0;
                 force `DRIF_PATH1.drif__n32441 = 1'b1;
                 force `DRIF_PATH1.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH2.drif__n32440 = 1'b0;
                 force `DRIF_PATH2.drif__n32441 = 1'b1;
                 force `DRIF_PATH2.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH3.drif__n32440 = 1'b0;
                 force `DRIF_PATH3.drif__n32441 = 1'b1;
                 force `DRIF_PATH3.drif__inv_drif_dimms_present = 1'b1;

                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_3_ = 1'b1;
`else
                 force `DRIF_PATH0.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH1.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH2.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH3.drif_addr_bank_low_sel  = 1'b1;

                 force `DRIF_PATH0.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH1.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH2.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH3.drif_stacked_dimm       = 1'b1;

                 force `DRIF_PATH0.drif_dimms_present[2:0] = 3'h2;
                 force `DRIF_PATH1.drif_dimms_present[2:0] = 3'h2;
                 force `DRIF_PATH2.drif_dimms_present[2:0] = 3'h2;
                 force `DRIF_PATH3.drif_dimms_present[2:0] = 3'h2;

                 force `FBDIC_PATH0.amb_id		   = 4'h1;
                 force `FBDIC_PATH1.amb_id		   = 4'h1;
                 force `FBDIC_PATH2.amb_id		   = 4'h1;
                 force `FBDIC_PATH3.amb_id		   = 4'h1;
`endif // mcu_gate

               end // }

    5'b0_100_1: 
               begin // {
`ifdef MCU_GATE
                 force `DRIF_PATH0.drif__n32443  = 1'b1;
                 force `DRIF_PATH1.drif__n32443  = 1'b1;
                 force `DRIF_PATH2.drif__n32443  = 1'b1;
                 force `DRIF_PATH3.drif__n32443  = 1'b1;

                 force `DRIF_PATH0.drif__n32446  = 1'b1;
                 force `DRIF_PATH1.drif__n32446  = 1'b1;
                 force `DRIF_PATH2.drif__n32446  = 1'b1;
                 force `DRIF_PATH3.drif__n32446  = 1'b1;

                 force `DRIF_PATH0.drif__n32440 = 1'b1;
                 force `DRIF_PATH0.drif__n32441 = 1'b0;
                 force `DRIF_PATH0.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH1.drif__n32440 = 1'b1;
                 force `DRIF_PATH1.drif__n32441 = 1'b0;
                 force `DRIF_PATH1.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH2.drif__n32440 = 1'b1;
                 force `DRIF_PATH2.drif__n32441 = 1'b0;
                 force `DRIF_PATH2.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH3.drif__n32440 = 1'b1;
                 force `DRIF_PATH3.drif__n32441 = 1'b0;
                 force `DRIF_PATH3.drif__inv_drif_dimms_present = 1'b1;

                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_5_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_3_ = 1'b1;
`else
                 force `DRIF_PATH0.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH1.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH2.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH3.drif_addr_bank_low_sel  = 1'b1;

                 force `DRIF_PATH0.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH1.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH2.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH3.drif_stacked_dimm       = 1'b1;

                 force `DRIF_PATH0.drif_dimms_present[2:0] = 3'h4;
                 force `DRIF_PATH1.drif_dimms_present[2:0] = 3'h4;
                 force `DRIF_PATH2.drif_dimms_present[2:0] = 3'h4;
                 force `DRIF_PATH3.drif_dimms_present[2:0] = 3'h4;

                 force `FBDIC_PATH0.amb_id		   = 4'h3;
                 force `FBDIC_PATH1.amb_id		   = 4'h3;
                 force `FBDIC_PATH2.amb_id		   = 4'h3;
                 force `FBDIC_PATH3.amb_id		   = 4'h3;
`endif // mcu_gate

               end // }

    5'b0_110_0: 
               begin // {
`ifdef MCU_GATE
                 force `DRIF_PATH0.drif__n32443  = 1'b1;
                 force `DRIF_PATH1.drif__n32443  = 1'b1;
                 force `DRIF_PATH2.drif__n32443  = 1'b1;
                 force `DRIF_PATH3.drif__n32443  = 1'b1;

                 force `DRIF_PATH0.drif__n32446  = 1'b1;
                 force `DRIF_PATH1.drif__n32446  = 1'b1;
                 force `DRIF_PATH2.drif__n32446  = 1'b1;
                 force `DRIF_PATH3.drif__n32446  = 1'b1;

                 force `DRIF_PATH0.drif__n32440 = 1'b1;
                 force `DRIF_PATH0.drif__n32441 = 1'b1;
                 force `DRIF_PATH0.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH1.drif__n32440 = 1'b1;
                 force `DRIF_PATH1.drif__n32441 = 1'b1;
                 force `DRIF_PATH1.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH2.drif__n32440 = 1'b1;
                 force `DRIF_PATH2.drif__n32441 = 1'b1;
                 force `DRIF_PATH2.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH3.drif__n32440 = 1'b1;
                 force `DRIF_PATH3.drif__n32441 = 1'b1;
                 force `DRIF_PATH3.drif__inv_drif_dimms_present = 1'b1;

                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_5_ = 1'b1;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_5_ = 1'b1;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_5_ = 1'b1;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_5_ = 1'b1;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_4_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_3_ = 1'b1;
`else
                 force `DRIF_PATH0.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH1.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH2.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH3.drif_addr_bank_low_sel  = 1'b1;

                 force `DRIF_PATH0.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH1.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH2.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH3.drif_stacked_dimm       = 1'b1;

                 force `DRIF_PATH0.drif_dimms_present[2:0] = 3'h6;
                 force `DRIF_PATH1.drif_dimms_present[2:0] = 3'h6;
                 force `DRIF_PATH2.drif_dimms_present[2:0] = 3'h6;
                 force `DRIF_PATH3.drif_dimms_present[2:0] = 3'h6;

                 force `FBDIC_PATH0.amb_id		   = 4'h5;
                 force `FBDIC_PATH1.amb_id		   = 4'h5;
                 force `FBDIC_PATH2.amb_id		   = 4'h5;
                 force `FBDIC_PATH3.amb_id		   = 4'h5;
`endif // mcu_gate

               end // }

    5'b0_000_1: 
               begin // {
`ifdef MCU_GATE
                 force `DRIF_PATH0.drif__n32443  = 1'b1;
                 force `DRIF_PATH1.drif__n32443  = 1'b1;
                 force `DRIF_PATH2.drif__n32443  = 1'b1;
                 force `DRIF_PATH3.drif__n32443  = 1'b1;

                 force `DRIF_PATH0.drif__n32446  = 1'b1;
                 force `DRIF_PATH1.drif__n32446  = 1'b1;
                 force `DRIF_PATH2.drif__n32446  = 1'b1;
                 force `DRIF_PATH3.drif__n32446  = 1'b1;

                 force `DRIF_PATH0.drif__n32440 = 1'b0;			// 8 dimms
                 force `DRIF_PATH0.drif__n32441 = 1'b0;
                 force `DRIF_PATH0.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH1.drif__n32440 = 1'b0;
                 force `DRIF_PATH1.drif__n32441 = 1'b0;
                 force `DRIF_PATH1.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH2.drif__n32440 = 1'b0;
                 force `DRIF_PATH2.drif__n32441 = 1'b0;
                 force `DRIF_PATH2.drif__inv_drif_dimms_present = 1'b1;

                 force `DRIF_PATH3.drif__n32440 = 1'b0;
                 force `DRIF_PATH3.drif__n32441 = 1'b0;
                 force `DRIF_PATH3.drif__inv_drif_dimms_present = 1'b1;

                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_5_ = 1'b1;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH0.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_5_ = 1'b1;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH1.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_5_ = 1'b1;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH2.fbdic__fbdic_fbd_state_3_ = 1'b1;

                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_6_ = 1'b0;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_5_ = 1'b1;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_4_ = 1'b1;
                 force `FBDIC_PATH3.fbdic__fbdic_fbd_state_3_ = 1'b1;
`else
                 force `DRIF_PATH0.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH1.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH2.drif_addr_bank_low_sel  = 1'b1;
                 force `DRIF_PATH3.drif_addr_bank_low_sel  = 1'b1;

                 force `DRIF_PATH0.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH1.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH2.drif_stacked_dimm       = 1'b1;
                 force `DRIF_PATH3.drif_stacked_dimm       = 1'b1;

                 force `DRIF_PATH0.drif_dimms_present[2:0] = 3'h0;    // 8 dimms
                 force `DRIF_PATH1.drif_dimms_present[2:0] = 3'h0;
                 force `DRIF_PATH2.drif_dimms_present[2:0] = 3'h0;
                 force `DRIF_PATH3.drif_dimms_present[2:0] = 3'h0;

                 force `FBDIC_PATH0.amb_id		   = 4'h7;
                 force `FBDIC_PATH1.amb_id		   = 4'h7;
                 force `FBDIC_PATH2.amb_id		   = 4'h7;
                 force `FBDIC_PATH3.amb_id		   = 4'h7;
`endif // mcu_gate

               end // }

     default:
	       begin // {
	       end // }

     endcase

end

end // }

initial
begin // { 

`ifdef PALLADIUM
`else
 #1;
`endif

  if ($test$plusargs("NO_MCU_CSR_SLAM")) begin
     `PR_INFO ("mcu_mem_config", `INFO, "MCU CSRs not slammed");
  end
  else begin


`ifdef FLUSH_RESET
     @(posedge `TOP.flush_reset_complete);
     $display("FIRST flush reset done\n");
     if (dtm_enabled) begin 
       @(posedge `TOP.flush_reset_complete);
       $display("SECOND flush reset done\n");
     end
`endif

  //force `DRIF_PATH0.mcu_ddp_clk_enable = 1'b1;
  //force `DRIF_PATH1.mcu_ddp_clk_enable = 1'b1;
  //force `DRIF_PATH2.mcu_ddp_clk_enable = 1'b1;
  //force `DRIF_PATH3.mcu_ddp_clk_enable = 1'b1;

  if (mcu_reg_slam_en && ~dtm_enabled) begin
    force `DRIF_PATH0.drif_cke_reg = 1'b1;
    force `DRIF_PATH1.drif_cke_reg = 1'b1;
    force `DRIF_PATH2.drif_cke_reg = 1'b1;
    force `DRIF_PATH3.drif_cke_reg = 1'b1;
  end

  if ($test$plusargs("DRAM_SCRUB")) 
  begin // {
`ifdef MCU_GATE
    force `DRIF_PATH0.drif__drif_data_scrub_enabled = 1'b1;
    force `DRIF_PATH1.drif__drif_data_scrub_enabled = 1'b1;
    force `DRIF_PATH2.drif__drif_data_scrub_enabled = 1'b1;
    force `DRIF_PATH3.drif__drif_data_scrub_enabled = 1'b1;

    force {`DRIF_PATH0.drif__inv_drif_freq_scrub_11_,`DRIF_PATH0.drif__inv_drif_freq_scrub_10_,`DRIF_PATH0.drif__inv_drif_freq_scrub_9_,`DRIF_PATH0.drif__inv_drif_freq_scrub_8_,`DRIF_PATH0.drif__inv_drif_freq_scrub_7_,`DRIF_PATH0.drif__inv_drif_freq_scrub_6_,`DRIF_PATH0.drif__inv_drif_freq_scrub_5_,`DRIF_PATH0.drif__inv_drif_freq_scrub_4_,`DRIF_PATH0.drif__inv_drif_freq_scrub_3_,`DRIF_PATH0.drif__inv_drif_freq_scrub_2_,`DRIF_PATH0.drif__inv_drif_freq_scrub_1_,`DRIF_PATH0.drif__inv_drif_freq_scrub_0_} = 1'hfef;

    force {`DRIF_PATH1.drif__inv_drif_freq_scrub_11_,`DRIF_PATH1.drif__inv_drif_freq_scrub_10_,`DRIF_PATH1.drif__inv_drif_freq_scrub_9_,`DRIF_PATH1.drif__inv_drif_freq_scrub_8_,`DRIF_PATH1.drif__inv_drif_freq_scrub_7_,`DRIF_PATH1.drif__inv_drif_freq_scrub_6_,`DRIF_PATH1.drif__inv_drif_freq_scrub_5_,`DRIF_PATH1.drif__inv_drif_freq_scrub_4_,`DRIF_PATH1.drif__inv_drif_freq_scrub_3_,`DRIF_PATH1.drif__inv_drif_freq_scrub_2_,`DRIF_PATH1.drif__inv_drif_freq_scrub_1_,`DRIF_PATH1.drif__inv_drif_freq_scrub_0_} = 1'hfef;

    force {`DRIF_PATH2.drif__inv_drif_freq_scrub_11_,`DRIF_PATH2.drif__inv_drif_freq_scrub_10_,`DRIF_PATH2.drif__inv_drif_freq_scrub_9_,`DRIF_PATH2.drif__inv_drif_freq_scrub_8_,`DRIF_PATH2.drif__inv_drif_freq_scrub_7_,`DRIF_PATH2.drif__inv_drif_freq_scrub_6_,`DRIF_PATH2.drif__inv_drif_freq_scrub_5_,`DRIF_PATH2.drif__inv_drif_freq_scrub_4_,`DRIF_PATH2.drif__inv_drif_freq_scrub_3_,`DRIF_PATH2.drif__inv_drif_freq_scrub_2_,`DRIF_PATH2.drif__inv_drif_freq_scrub_1_,`DRIF_PATH2.drif__inv_drif_freq_scrub_0_} = 1'hfef;

    force {`DRIF_PATH3.drif__inv_drif_freq_scrub_11_,`DRIF_PATH3.drif__inv_drif_freq_scrub_10_,`DRIF_PATH3.drif__inv_drif_freq_scrub_9_,`DRIF_PATH3.drif__inv_drif_freq_scrub_8_,`DRIF_PATH3.drif__inv_drif_freq_scrub_7_,`DRIF_PATH3.drif__inv_drif_freq_scrub_6_,`DRIF_PATH3.drif__inv_drif_freq_scrub_5_,`DRIF_PATH3.drif__inv_drif_freq_scrub_4_,`DRIF_PATH3.drif__inv_drif_freq_scrub_3_,`DRIF_PATH3.drif__inv_drif_freq_scrub_2_,`DRIF_PATH3.drif__inv_drif_freq_scrub_1_,`DRIF_PATH3.drif__inv_drif_freq_scrub_0_} = 1'hfef;
`else
    force `DRIF_PATH0.drif_data_scrub_enabled = 1'b1;
    force `DRIF_PATH1.drif_data_scrub_enabled = 1'b1;
    force `DRIF_PATH2.drif_data_scrub_enabled = 1'b1;
    force `DRIF_PATH3.drif_data_scrub_enabled = 1'b1;

    force `DRIF_PATH0.drif_freq_scrub[11:0] =12'h10;
    force `DRIF_PATH1.drif_freq_scrub[11:0] =12'h10;
    force `DRIF_PATH2.drif_freq_scrub[11:0] =12'h10;
    force `DRIF_PATH3.drif_freq_scrub[11:0] =12'h10;
`endif // mcu_gate
  end // }

  if ($test$plusargs("WARM_RESET"))
  begin // {
`ifdef MCU_GATE
    force `MCU0.fbdic__n15703 = 1'b1;
    force `MCU1.fbdic__n15703 = 1'b1;
    force `MCU2.fbdic__n15703 = 1'b1;
    force `MCU3.fbdic__n15703 = 1'b1;
`else
    force `MCU0.fbdic.fbdtm.rdpctl_kp_lnk_up = 1'b1;
    force `MCU1.fbdic.fbdtm.rdpctl_kp_lnk_up = 1'b1;
    force `MCU2.fbdic.fbdtm.rdpctl_kp_lnk_up = 1'b1;
    force `MCU3.fbdic.fbdtm.rdpctl_kp_lnk_up = 1'b1;
`endif // mcu_gate
  end // }

`ifdef NEC_FBDIMM
 if (mcu_reg_slam_en) begin
  fork
 	begin
`ifdef MCU_GATE
  		force `DRIF_PATH0.drif__N2397      = 1'b0;
  		wait  (`FBDIC_PATH0.fbdic__n15588 == 1);
  		wait  (`FBDIC_PATH0.fbdic__n15588 == 0);
  		wait  (`FBDIC_PATH0.fbdic__n15588 == 1);
  		wait  (tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.fbdimm_DIMMx4.U00.dram_init_done==1);
  		force `DRIF_PATH0.drif__N2397      = 1'b1;
`else
  		force `DRIF_PATH0.drif_init       = 1'b1;
  		wait  (`FBDIC_PATH0.fbdic_l0_state == 1);
  		wait  (`FBDIC_PATH0.fbdic_l0_state == 0);
  		wait  (`FBDIC_PATH0.fbdic_l0_state == 1);
`ifdef X8
  		wait  (tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.fbdimm_DIMMx8.U00.dram_init_done==1);
`else
  		wait  (tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.fbdimm_DIMMx4.U00.dram_init_done==1);
`endif
	        repeat (500) @ (posedge `DRIF_PATH0.drl2clk);
  		force `DRIF_PATH0.drif_init       = 1'b0;
`endif // mcu_gate

	end 

 	begin
`ifdef MCU_GATE
                force `DRIF_PATH1.drif__N2397      = 1'b0;
                wait  (`FBDIC_PATH1.fbdic__n15588 == 1);
                wait  (`FBDIC_PATH1.fbdic__n15588 == 0);
                wait  (`FBDIC_PATH1.fbdic__n15588 == 1);
                wait  (tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.fbdimm_DIMMx4.U00.dram_init_done==1);
                force `DRIF_PATH1.drif__N23973     = 1'b1;
`else
  		force `DRIF_PATH1.drif_init       = 1'b1;
  		wait  (`FBDIC_PATH1.fbdic_l0_state == 1);
  		wait  (`FBDIC_PATH1.fbdic_l0_state == 0);
  		wait  (`FBDIC_PATH1.fbdic_l0_state == 1);
`ifdef X8
  		wait  (tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.fbdimm_DIMMx8.U00.dram_init_done==1);
`else
  		wait  (tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.fbdimm_DIMMx4.U00.dram_init_done==1);
`endif
	        repeat (500) @ (posedge `DRIF_PATH1.drl2clk);
  		force `DRIF_PATH1.drif_init       = 1'b0;
`endif // mcu_gate

	end

	begin
`ifdef MCU_GATE
                force `DRIF_PATH2.drif__N2397      = 1'b0;
                wait  (`FBDIC_PATH2.fbdic__n15588 == 1);
                wait  (`FBDIC_PATH2.fbdic__n15588 == 0);
                wait  (`FBDIC_PATH2.fbdic__n15588 == 1);
                wait  (tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.fbdimm_DIMMx4.U00.dram_init_done==1);
                force `DRIF_PATH2.drif__N2397     = 1'b1;
`else
  		force `DRIF_PATH2.drif_init       = 1'b1;
  		wait  (`FBDIC_PATH2.fbdic_l0_state == 1);
  		wait  (`FBDIC_PATH2.fbdic_l0_state == 0);
  		wait  (`FBDIC_PATH2.fbdic_l0_state == 1);
`ifdef X8
  		wait  (tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.fbdimm_DIMMx8.U00.dram_init_done==1);
`else
  		wait  (tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.fbdimm_DIMMx4.U00.dram_init_done==1);
`endif
	        repeat (500) @ (posedge `DRIF_PATH2.drl2clk);
  		force `DRIF_PATH2.drif_init       = 1'b0;
`endif // mcu_gate

	end 

	begin
`ifdef MCU_GATE
                force `DRIF_PATH3.drif__N2397      = 1'b0;
                wait  (`FBDIC_PATH3.fbdic__n15588 == 1);
                wait  (`FBDIC_PATH3.fbdic__n15588 == 0);
                wait  (`FBDIC_PATH3.fbdic__n15588 == 1);
                wait  (tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.fbdimm_DIMMx4.U00.dram_init_done==1);
                force `DRIF_PATH3.drif__N2397      = 1'b1;
`else
  		force `DRIF_PATH3.drif_init       = 1'b1;
  		wait  (`FBDIC_PATH3.fbdic_l0_state == 1);
  		wait  (`FBDIC_PATH3.fbdic_l0_state == 0);
  		wait  (`FBDIC_PATH3.fbdic_l0_state == 1);
`ifdef X8
  		wait  (tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.fbdimm_DIMMx8.U00.dram_init_done==1);
`else
  		wait  (tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.fbdimm_DIMMx4.U00.dram_init_done==1);
`endif
	        repeat (500) @ (posedge `DRIF_PATH3.drl2clk);
  		force `DRIF_PATH3.drif_init       = 1'b0;
`endif // mcu_gate

	end 
join 
end
`else
`ifdef INPHI_FBDIMM
 if (mcu_reg_slam_en) begin
  fork
	begin
`ifdef MCU_GATE
                force `DRIF_PATH0.drif__N2397      = 1'b0;
                wait  (`FBDIC_PATH0.fbdic__n15588 == 1);
                wait  (`FBDIC_PATH0.fbdic__n15588 == 0);
                wait  (`FBDIC_PATH0.fbdic__n15588 == 1);
                wait  (tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.fbdimm_DIMMx4.U00.dram_init_done==1);
                force `DRIF_PATH0.drif__N2397     = 1'b1;
`else
  		force `DRIF_PATH0.drif_init       = 1'b1;
  		wait  (`FBDIC_PATH0.fbdic_l0_state == 1);
  		wait  (`FBDIC_PATH0.fbdic_l0_state == 0);
  		wait  (`FBDIC_PATH0.fbdic_l0_state == 1);
  		wait  (tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.fbdimm_DIMMx4.U00.dram_init_done==1);
  		force `DRIF_PATH0.drif_init       = 1'b0;
`endif // mcu_gate

	end
 
	begin
`ifdef MCU_GATE
                force `DRIF_PATH1.drif__N2397      = 1'b0;
                wait  (`FBDIC_PATH1.fbdic__n15588 == 1);
                wait  (`FBDIC_PATH1.fbdic__n15588 == 0);
                wait  (`FBDIC_PATH1.fbdic__n15588 == 1);
                wait  (tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.fbdimm_DIMMx4.U00.dram_init_done==1);
                force `DRIF_PATH1.drif__N2397      = 1'b1;
`else
  	force `DRIF_PATH1.drif_init       = 1'b1;
 	 	wait  (`FBDIC_PATH1.fbdic_l0_state == 1);
  		wait  (`FBDIC_PATH1.fbdic_l0_state == 0);
  		wait  (`FBDIC_PATH1.fbdic_l0_state == 1);
  		wait  (tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.fbdimm_DIMMx4.U00.dram_init_done==1);
  		force `DRIF_PATH1.drif_init       = 1'b0;
`endif // mcu_gate

	end
	begin
`ifdef MCU_GATE
                force `DRIF_PATH2.drif__N2397      = 1'b0;
                wait  (`FBDIC_PATH2.fbdic__n15588 == 1);
                wait  (`FBDIC_PATH2.fbdic__n15588 == 0);
                wait  (`FBDIC_PATH2.fbdic__n15588 == 1);
                wait  (tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.fbdimm_DIMMx4.U00.dram_init_done==1);
                force `DRIF_PATH2.drif__N2397      = 1'b1;
`else
  		force `DRIF_PATH2.drif_init       = 1'b1;
  		wait  (`FBDIC_PATH2.fbdic_l0_state == 1);
  		wait  (`FBDIC_PATH2.fbdic_l0_state == 0);
  		wait  (`FBDIC_PATH2.fbdic_l0_state == 1);
  		wait  (tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.fbdimm_DIMMx4.U00.dram_init_done==1);
  		force `DRIF_PATH2.drif_init       = 1'b0;
`endif // mcu_gate

 	end
	begin
`ifdef MCU_GATE
                force `DRIF_PATH3.drif__N2397      = 1'b0;
                wait  (`FBDIC_PATH3.fbdic__n15588 == 1);
                wait  (`FBDIC_PATH3.fbdic__n15588 == 0);
                wait  (`FBDIC_PATH3.fbdic__n15588 == 1);
                wait  (tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.fbdimm_DIMMx4.U00.dram_init_done==1);
                force `DRIF_PATH3.drif__N2397      = 1'b1;
`else
  		force `DRIF_PATH3.drif_init       = 1'b1;
  		wait  (`FBDIC_PATH3.fbdic_l0_state == 1);
  		wait  (`FBDIC_PATH3.fbdic_l0_state == 0);
  		wait  (`FBDIC_PATH3.fbdic_l0_state == 1);
  		wait  (tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.fbdimm_DIMMx4.U00.dram_init_done==1);
  		force `DRIF_PATH3.drif_init       = 1'b0;  
`endif // mcu_gate

 	end
join
 end
`else
`ifdef PALLADIUM
// NO_MCU_CSR_SLAM is set for FC1
`else
 if (mcu_reg_slam_en) begin
 fork 
	begin
`ifdef MCU_GATE
          if (dtm_enabled)
           begin
           // do nothing  5/12/06*
           end
           else
           begin
  		force `DRIF_PATH0.drif__N2397      = 1'b0;
  		wait  (`FBDIC_PATH0.fbdic__n15588 == 1);
  		force `DRIF_PATH0.drif__N2397      = 1'b1;
	   end
`else
           if (dtm_enabled)
           begin
           /* SV DTM Changes 04/25/06
  		force `DRIF_PATH0.drif_init       = 1'b1;
             `ifndef AXIS
  		wait  (tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.fbdimm_DIMMx4.U00.dram_init_done==1);
             `endif
  		force `DRIF_PATH0.drif_init       = 1'b0;
              END SV Changes */
           end
           else
           begin
  		force `DRIF_PATH0.drif_init       = 1'b1;
  		wait  (`FBDIC_PATH0.fbdic_l0_state == 1);
  		force `DRIF_PATH0.drif_init       = 1'b0;
           end
`endif // mcu_gate

	end

	begin
`ifdef MCU_GATE
           if (dtm_enabled)
           begin
           // do nothing 5/12/06*
           end
           else
           begin
                force `DRIF_PATH1.drif__N2397      = 1'b0;
                wait  (`FBDIC_PATH1.fbdic__n15588 == 1);
                force `DRIF_PATH1.drif__N2397      = 1'b1;
	   end
`else
           if (dtm_enabled)
           begin
           /* SV DTM Changes 04/25/06
  		force `DRIF_PATH1.drif_init       = 1'b1;
             `ifndef AXIS
  		wait  (tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.fbdimm_DIMMx4.U00.dram_init_done==1);
             `endif
  		force `DRIF_PATH1.drif_init       = 1'b0;
              END SV changes */

           end
           else
           begin
  		force `DRIF_PATH1.drif_init       = 1'b1;
  		wait  (`FBDIC_PATH1.fbdic_l0_state == 1);
  		force `DRIF_PATH1.drif_init       = 1'b0;
           end
`endif // mcu_gate

	end
	begin
`ifdef MCU_GATE
           if (dtm_enabled)
           begin
           // do nothing 5/12/06*
           end
           else
           begin
                force `DRIF_PATH2.drif__N2397      = 1'b0;
                wait  (`FBDIC_PATH2.fbdic__n15588 == 1);
                force `DRIF_PATH2.drif__N2397      = 1'b1;
	   end
`else
           if (dtm_enabled)
           begin
           /* SV DTM Changes 04/25/06
  		force `DRIF_PATH2.drif_init       = 1'b1;
             `ifndef AXIS
  		wait  (tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.fbdimm_DIMMx4.U00.dram_init_done==1);
             `endif
  		force `DRIF_PATH2.drif_init       = 1'b0;
              END SV Changes */
           end
           else
           begin
  		force `DRIF_PATH2.drif_init       = 1'b1;
  		wait  (`FBDIC_PATH2.fbdic_l0_state == 1);
  		force `DRIF_PATH2.drif_init       = 1'b0;
           end
`endif // mcu_gate

	end
	begin
`ifdef MCU_GATE
           if (dtm_enabled)
           begin
           // do nothing  5/12/06*
           end
           else
           begin
                force `DRIF_PATH3.drif__N2397      = 1'b0;
                wait  (`FBDIC_PATH3.fbdic__n15588 == 1);
                force `DRIF_PATH3.drif__N2397      = 1'b1;
 	   end
`else
           if (dtm_enabled)
           begin
           /* SV DTM Changes 04/25/06
  		force `DRIF_PATH3.drif_init       = 1'b1;
             `ifndef AXIS
  		wait  (tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.fbdimm_DIMMx4.U00.dram_init_done==1);
             `endif
  		force `DRIF_PATH3.drif_init       = 1'b0;
              END SV Changes */
           end
           else
           begin
  		force `DRIF_PATH3.drif_init       = 1'b1;
  		wait  (`FBDIC_PATH3.fbdic_l0_state == 1);
  		force `DRIF_PATH3.drif_init       = 1'b0;
           end
`endif // mcu_gate

 	end
 
 join
 end // if (mcu_reg_slam_en)

`endif // !`ifdef PALLADIUM
`endif // !`ifdef INPHI_FBDIMM
`endif // !`ifdef NEC_FBDIMM

end
end // }

//---- Program MCU DDR2 Timing Regs ------

reg       sng_channel;
reg [3:0] cas_latency;
reg [3:0] cas_latency_gate;
reg [3:0] additive_latency;
reg [3:0] additive_latency_gate;
reg [4:0] msb_drc;
reg [7:0] sync_train_interval;
reg [7:0] sync_train_interval_gate;
reg [7:0] cmd2datanxt;
reg [7:0] cmd2datacur;

initial
begin

`ifdef PALLADIUM
`else
  #1;
`endif

  if ($test$plusargs("SNG_CHANNEL")) 
    sng_channel = 1'b1;
  else
    sng_channel = 1'b0;

   // default values
   cas_latency = 4'h3;
   additive_latency = 4'h3;
   sync_train_interval = 8'h2A; // default = 42;

   if($value$plusargs("SET_CMD2DATA=%h",cmd2datanxt))
      cmd2datacur = cmd2datanxt;
   else begin
      cmd2datanxt = 8'h28;         // default DLYFRMS [7:4] = 2 frames, DLYFRAC [3:0] = 8 UI
      cmd2datacur = 8'h28;         // default DLYFRMS [7:4] = 2 frames, DLYFRAC [3:0] = 8 UI
   end

   if(sng_channel)
     msb_drc = 5'h7;
   else
     msb_drc = 5'h6;

  if ($test$plusargs("NO_MCU_CSR_SLAM")) begin
     `PR_INFO ("mcu_mem_config", `INFO, "MCU CSRs not slammed");
  end
  else begin

  if (sng_channel) begin
`ifdef MCU_GATE
    force `MCU0.drif__n32447 = 1'b1;
    force `MCU1.drif__n32447 = 1'b1;
    force `MCU2.drif__n32447 = 1'b1;
    force `MCU3.drif__n32447 = 1'b1;
`else
    force `MCU0.drif.drif_single_channel_mode = 1'b1;
    force `MCU1.drif.drif_single_channel_mode = 1'b1;
    force `MCU2.drif.drif_single_channel_mode = 1'b1;
    force `MCU3.drif.drif_single_channel_mode = 1'b1;
`endif // mcu_gate

  end

  // Force cas_latency and additive latency; works only with idt amb
  `ifdef IDT_FBDIMM

      if($value$plusargs("SET_CL=%d",cas_latency))
      begin
`ifdef MCU_GATE
        cas_latency_gate = cas_latency ^ 2'b11;
        force {`MCU0.drif__mode_reg_6_,`MCU0.drif__inv_mode_reg_5_,`MCU0.drif__inv_mode_reg_4_} = cas_latency_gate;
        force {`MCU1.drif__mode_reg_6_,`MCU1.drif__inv_mode_reg_5_,`MCU1.drif__inv_mode_reg_4_} = cas_latency_gate;
        force {`MCU2.drif__mode_reg_6_,`MCU2.drif__inv_mode_reg_5_,`MCU2.drif__inv_mode_reg_4_} = cas_latency_gate;
        force {`MCU3.drif__mode_reg_6_,`MCU3.drif__inv_mode_reg_5_,`MCU3.drif__inv_mode_reg_4_} = cas_latency_gate;
`else
        force `MCU0.drif.mode_reg[6:4] = cas_latency;
        force `MCU1.drif.mode_reg[6:4] = cas_latency;
        force `MCU2.drif.mode_reg[6:4] = cas_latency;
        force `MCU3.drif.mode_reg[6:4] = cas_latency;
`endif // mcu_gate

        `PR_ALWAYS("mcu_mem_config", `ALWAYS, "*** SET_CL *** : CL = %d", cas_latency);
      end // SET_CL

      if($value$plusargs("SET_AL=%d",additive_latency))
      begin
`ifdef MCU_GATE
        additive_latency_gate = additive_latency ^ 2'b11;
	force {`MCU0.drif__ext_mode_reg1_5_,`MCU0.drif__inv_ext_mode_reg1_4_,`MCU0.drif__inv_ext_mode_reg1_3_} = additive_latency_gate; 
	force {`MCU1.drif__ext_mode_reg1_5_,`MCU1.drif__inv_ext_mode_reg1_4_,`MCU1.drif__inv_ext_mode_reg1_3_} = additive_latency_gate; 
	force {`MCU2.drif__ext_mode_reg1_5_,`MCU2.drif__inv_ext_mode_reg1_4_,`MCU2.drif__inv_ext_mode_reg1_3_} = additive_latency_gate; 
	force {`MCU3.drif__ext_mode_reg1_5_,`MCU3.drif__inv_ext_mode_reg1_4_,`MCU3.drif__inv_ext_mode_reg1_3_} = additive_latency_gate; 
`else
        force `MCU0.drif.ext_mode_reg1[5:3] = additive_latency;
        force `MCU1.drif.ext_mode_reg1[5:3] = additive_latency;
        force `MCU2.drif.ext_mode_reg1[5:3] = additive_latency;
        force `MCU3.drif.ext_mode_reg1[5:3] = additive_latency;
`endif // mcu_gate

        `PR_ALWAYS("mcu_mem_config", `ALWAYS, "*** SET_AL *** : AL = %d", additive_latency);
      end


      if($test$plusargs("RANDOM_PARAM"))
      begin

        cmd2datanxt[7:4] = ({$random(`PARGS.seed)} % 9) + 1;
        if (cmd2datanxt[7:4] == 4'h1) cmd2datanxt[7:4] = 4'h2;
        if (cmd2datanxt[7:4] == 4'h8) cmd2datanxt[7:4] = 4'h9;
        cmd2datanxt[3:0] = 4'h0;          // Do not randomize the UI delay
        cmd2datacur = cmd2datanxt;

        cas_latency = ({$random(`PARGS.seed)} % 3) + 3;
        if(cas_latency == 4'h5)
            additive_latency = 4'h4;
        else
            additive_latency = ({$random(`PARGS.seed)} % 2) + 3;

`ifdef MCU_GATE
	cas_latency_gate = cas_latency ^ 2'b11;
        additive_latency_gate = additive_latency ^ 2'b11;
        force {`MCU0.drif__mode_reg_6_,`MCU0.drif__inv_mode_reg_5_,`MCU0.drif__inv_mode_reg_4_} = cas_latenc_gatey;
        force {`MCU1.drif__mode_reg_6_,`MCU1.drif__inv_mode_reg_5_,`MCU1.drif__inv_mode_reg_4_} = cas_latency_gate;
        force {`MCU2.drif__mode_reg_6_,`MCU2.drif__inv_mode_reg_5_,`MCU2.drif__inv_mode_reg_4_} = cas_latency_gate;
        force {`MCU3.drif__mode_reg_6_,`MCU3.drif__inv_mode_reg_5_,`MCU3.drif__inv_mode_reg_4_} = cas_latency_gate;

	force {`MCU0.drif__ext_mode_reg1_5_,`MCU0.drif__inv_ext_mode_reg1_4_,`MCU0.drif__inv_ext_mode_reg1_3_} = additive_latency_gate;
	force {`MCU1.drif__ext_mode_reg1_5_,`MCU1.drif__inv_ext_mode_reg1_4_,`MCU1.drif__inv_ext_mode_reg1_3_} = additive_latency_gate;
	force {`MCU2.drif__ext_mode_reg1_5_,`MCU2.drif__inv_ext_mode_reg1_4_,`MCU2.drif__inv_ext_mode_reg1_3_} = additive_latency_gate;
	force {`MCU3.drif__ext_mode_reg1_5_,`MCU3.drif__inv_ext_mode_reg1_4_,`MCU3.drif__inv_ext_mode_reg1_3_} = additive_latency_gate;

        sync_train_interval = ({$random(`PARGS.seed)} % 11) + 32;
        sync_train_interval_gate = sync_train_interval ^ 6'b101010;
        force {`MCU0.fbdic__fbdtm_fbdic_sync_frm_period_out_5_,`MCU0.fbdic__fbdic_sync_frm_period_4_,`MCU0.fbdic__fbdtm_fbdic_sync_frm_period_out_3_,`MCU0.fbdic__fbdic_sync_frm_period_2_,`MCU0.fbdic__fbdtm_fbdic_sync_frm_period_out_1_,`MCU0.fbdic__fbdic_sync_frm_period_0_} = sync_train_interval_gate[5:0];
        force {`MCU1.fbdic__fbdtm_fbdic_sync_frm_period_out_5_,`MCU1.fbdic__fbdic_sync_frm_period_4_,`MCU1.fbdic__fbdtm_fbdic_sync_frm_period_out_3_,`MCU1.fbdic__fbdic_sync_frm_period_2_,`MCU1.fbdic__fbdtm_fbdic_sync_frm_period_out_1_,`MCU1.fbdic__fbdic_sync_frm_period_0_} = sync_train_interval_gate[5:0];
        force {`MCU2.fbdic__fbdtm_fbdic_sync_frm_period_out_5_,`MCU2.fbdic__fbdic_sync_frm_period_4_,`MCU2.fbdic__fbdtm_fbdic_sync_frm_period_out_3_,`MCU2.fbdic__fbdic_sync_frm_period_2_,`MCU2.fbdic__fbdtm_fbdic_sync_frm_period_out_1_,`MCU2.fbdic__fbdic_sync_frm_period_0_} = sync_train_interval_gate[5:0];
        force {`MCU3.fbdic__fbdtm_fbdic_sync_frm_period_out_5_,`MCU3.fbdic__fbdic_sync_frm_period_4_,`MCU3.fbdic__fbdtm_fbdic_sync_frm_period_out_3_,`MCU3.fbdic__fbdic_sync_frm_period_2_,`MCU3.fbdic__fbdtm_fbdic_sync_frm_period_out_1_,`MCU3.fbdic__fbdic_sync_frm_period_0_} = sync_train_interval_gate[5:0];

`else
        force `MCU0.drif.mode_reg[6:4] = cas_latency;
        force `MCU1.drif.mode_reg[6:4] = cas_latency;
        force `MCU2.drif.mode_reg[6:4] = cas_latency;
        force `MCU3.drif.mode_reg[6:4] = cas_latency;

        force `MCU0.drif.ext_mode_reg1[5:3] = additive_latency;
        force `MCU1.drif.ext_mode_reg1[5:3] = additive_latency;
        force `MCU2.drif.ext_mode_reg1[5:3] = additive_latency;
        force `MCU3.drif.ext_mode_reg1[5:3] = additive_latency;

        sync_train_interval = ({$random(`PARGS.seed)} % 11) + 32;
        force `MCU0.fbdic.fbdic_sync_frm_period[5:0] = sync_train_interval[5:0];
        force `MCU1.fbdic.fbdic_sync_frm_period[5:0] = sync_train_interval[5:0];
        force `MCU2.fbdic.fbdic_sync_frm_period[5:0] = sync_train_interval[5:0];
        force `MCU3.fbdic.fbdic_sync_frm_period[5:0] = sync_train_interval[5:0];
`endif // mcu_gate

        `PR_ALWAYS("mcu_mem_config", `ALWAYS, "*** RANDOM_PARAM *** : SYNC_TRAIN_INTERVAL = %d, AL = %d, CL = %d, CMD2DATANXT = %h", sync_train_interval, additive_latency, cas_latency, cmd2datanxt);
      end
    `endif // IDT_FBDIMM



`ifdef DDR2_533  // Values computed based on dram_clk_period = 3.75ns (266 MHz)
 if (mcu_reg_slam_en) begin
`ifdef MCU_GATE
  force {`MCU0.drif__inv_ras_reg_1_,`MCU0.drif__ras_reg_2_,`MCU0.drif__ras_reg_1_,`MCU0.drif__inv_ras_reg_0_} = 4'h5;
  force {`MCU1.drif__inv_ras_reg_1_,`MCU1.drif__ras_reg_2_,`MCU1.drif__ras_reg_1_,`MCU1.drif__inv_ras_reg_0_} = 4'h5;
  force {`MCU2.drif__inv_ras_reg_1_,`MCU2.drif__ras_reg_2_,`MCU2.drif__ras_reg_1_,`MCU2.drif__inv_ras_reg_0_} = 4'h5;
  force {`MCU3.drif__inv_ras_reg_1_,`MCU3.drif__ras_reg_2_,`MCU3.drif__ras_reg_1_,`MCU3.drif__inv_ras_reg_0_} = 4'h5;

  force {`MCU0.drif__rp_reg_3_,`MCU0.drif__rp_reg_2_,`MCU0.drif__inv_rp_reg_1_,`MCU0.drif__inv_rp_reg_0_} = 4'h0;
  force {`MCU1.drif__rp_reg_3_,`MCU1.drif__rp_reg_2_,`MCU1.drif__inv_rp_reg_1_,`MCU1.drif__inv_rp_reg_0_} = 4'h0;
  force {`MCU2.drif__rp_reg_3_,`MCU2.drif__rp_reg_2_,`MCU2.drif__inv_rp_reg_1_,`MCU2.drif__inv_rp_reg_0_} = 4'h0;
  force {`MCU3.drif__rp_reg_3_,`MCU3.drif__rp_reg_2_,`MCU3.drif__inv_rp_reg_1_,`MCU3.drif__inv_rp_reg_0_} = 4'h0;

  force {`MCU0.drif__rtp_reg_2_,`MCU0.drif__inv_rtp_reg,`MCU0.drif__rtp_reg_0_} = 3'h0;
  force {`MCU1.drif__rtp_reg_2_,`MCU1.drif__inv_rtp_reg,`MCU1.drif__rtp_reg_0_} = 3'h0;
  force {`MCU2.drif__rtp_reg_2_,`MCU2.drif__inv_rtp_reg,`MCU2.drif__rtp_reg_0_} = 3'h0;
  force {`MCU3.drif__rtp_reg_2_,`MCU3.drif__inv_rtp_reg,`MCU3.drif__rtp_reg_0_} = 3'h0;
`else
if(sys_enabled) // For Settings same as the System
begin
  force `MCU0.drif.ras_reg = 4'hc;
  force `MCU1.drif.ras_reg = 4'hc;
  force `MCU2.drif.ras_reg = 4'hc;
  force `MCU3.drif.ras_reg = 4'hc;

  force `MCU0.drif.rp_reg = 4'h5;
  force `MCU1.drif.rp_reg = 4'h5;
  force `MCU2.drif.rp_reg = 4'h5;
  force `MCU3.drif.rp_reg = 4'h5;

  force `MCU0.drif.rtp_reg = 3'h2;
  force `MCU1.drif.rtp_reg = 3'h2;
  force `MCU2.drif.rtp_reg = 3'h2;
  force `MCU3.drif.rtp_reg = 3'h2;

end
else
begin
  force `MCU0.drif.ras_reg = 4'hc;
  force `MCU1.drif.ras_reg = 4'hc;
  force `MCU2.drif.ras_reg = 4'hc;
  force `MCU3.drif.ras_reg = 4'hc;

  force `MCU0.drif.rp_reg = 4'h3;
  force `MCU1.drif.rp_reg = 4'h3;
  force `MCU2.drif.rp_reg = 4'h3;
  force `MCU3.drif.rp_reg = 4'h3;

  force `MCU0.drif.rtp_reg = 3'h2;
  force `MCU1.drif.rtp_reg = 3'h2;
  force `MCU2.drif.rtp_reg = 3'h2;
  force `MCU3.drif.rtp_reg = 3'h2;
end
`endif // mcu_gate

  if (sng_channel) begin
`ifdef MCU_GATE
    force {`MCU0.drif__rc_reg_4_,`MCU0.drif__inv_rc_reg_3_,`MCU0.drif__inv_rc_reg_2_,`MCU0.drif__rc_reg_1_,`MCU0.drif__N3659 } = 5'h1d;
    force {`MCU1.drif__rc_reg_4_,`MCU1.drif__inv_rc_reg_3_,`MCU1.drif__inv_rc_reg_2_,`MCU1.drif__rc_reg_1_,`MCU1.drif__N3659 } = 5'h1d;
    force {`MCU2.drif__rc_reg_4_,`MCU2.drif__inv_rc_reg_3_,`MCU2.drif__inv_rc_reg_2_,`MCU2.drif__rc_reg_1_,`MCU2.drif__N3659 } = 5'h1d;
    force {`MCU3.drif__rc_reg_4_,`MCU3.drif__inv_rc_reg_3_,`MCU3.drif__inv_rc_reg_2_,`MCU3.drif__rc_reg_1_,`MCU3.drif__N3659 } = 5'h1d;
`else
    force `MCU0.drif.rc_reg = 5'h11; // System and TO 1.0/2.0 settings are same
    force `MCU1.drif.rc_reg = 5'h11;
    force `MCU2.drif.rc_reg = 5'h11;
    force `MCU3.drif.rc_reg = 5'h11;
`endif // mcu_gate
  end
  else begin // (DUAL_CHANNEL)
`ifdef MCU_GATE
    force {`MCU0.drif__rc_reg_4_,`MCU0.drif__inv_rc_reg_3_,`MCU0.drif__inv_rc_reg_2_,`MCU0.drif__rc_reg_1_,`MCU0.drif__N3659 } = 5'h3;
    force {`MCU1.drif__rc_reg_4_,`MCU1.drif__inv_rc_reg_3_,`MCU1.drif__inv_rc_reg_2_,`MCU1.drif__rc_reg_1_,`MCU1.drif__N3659 } = 5'h3;
    force {`MCU2.drif__rc_reg_4_,`MCU2.drif__inv_rc_reg_3_,`MCU2.drif__inv_rc_reg_2_,`MCU2.drif__rc_reg_1_,`MCU2.drif__N3659 } = 5'h3;
    force {`MCU3.drif__rc_reg_4_,`MCU3.drif__inv_rc_reg_3_,`MCU3.drif__inv_rc_reg_2_,`MCU3.drif__rc_reg_1_,`MCU3.drif__N3659 } = 5'h3;
`else
if(sys_enabled) // For Settings same as the System
begin
    force `MCU0.drif.rc_reg = 5'h11;
    force `MCU1.drif.rc_reg = 5'h11;
    force `MCU2.drif.rc_reg = 5'h11;
    force `MCU3.drif.rc_reg = 5'h11;
end
else
begin
    force `MCU0.drif.rc_reg = 5'hf;
    force `MCU1.drif.rc_reg = 5'hf;
    force `MCU2.drif.rc_reg = 5'hf;
    force `MCU3.drif.rc_reg = 5'hf;
end
`endif // mcu_gate
  end

`ifdef MCU_GATE
  force {`MCU0.drif__rcd_reg_3_,`MCU0.drif__rcd_reg_2_,`MCU0.drif__inv_rcd_reg_1_,`MCU0.drif__inv_rcd_reg_0_} = 4'h0;
  force {`MCU1.drif__rcd_reg_3_,`MCU1.drif__rcd_reg_2_,`MCU1.drif__inv_rcd_reg_1_,`MCU1.drif__inv_rcd_reg_0_} = 4'h0;
  force {`MCU2.drif__rcd_reg_3_,`MCU2.drif__rcd_reg_2_,`MCU2.drif__inv_rcd_reg_1_,`MCU2.drif__inv_rcd_reg_0_} = 4'h0;
  force {`MCU3.drif__rcd_reg_3_,`MCU3.drif__rcd_reg_2_,`MCU3.drif__inv_rcd_reg_1_,`MCU3.drif__inv_rcd_reg_0_} = 4'h0;

  force {`MCU0.drif__rfc_reg_reset_val_6_,`MCU0.drif__rfc_reg_reset_val_5_,`MCU0.drif__rfc_reg_reset_val_4_,`MCU0.drif__rfc_reg_reset_val_3_,`MCU0.drif__rfc_reg_reset_val_2_,`MCU0.drif__rfc_reg_reset_val_1_,`MCU0.drif__rfc_reg_reset_val_0_} = 7'h33;
  force {`MCU1.drif__rfc_reg_reset_val_6_,`MCU1.drif__rfc_reg_reset_val_5_,`MCU1.drif__rfc_reg_reset_val_4_,`MCU1.drif__rfc_reg_reset_val_3_,`MCU1.drif__rfc_reg_reset_val_2_,`MCU1.drif__rfc_reg_reset_val_1_,`MCU1.drif__rfc_reg_reset_val_0_} = 7'h33;
  force {`MCU2.drif__rfc_reg_reset_val_6_,`MCU2.drif__rfc_reg_reset_val_5_,`MCU2.drif__rfc_reg_reset_val_4_,`MCU2.drif__rfc_reg_reset_val_3_,`MCU2.drif__rfc_reg_reset_val_2_,`MCU2.drif__rfc_reg_reset_val_1_,`MCU2.drif__rfc_reg_reset_val_0_} = 7'h33;
  force {`MCU3.drif__rfc_reg_reset_val_6_,`MCU3.drif__rfc_reg_reset_val_5_,`MCU3.drif__rfc_reg_reset_val_4_,`MCU3.drif__rfc_reg_reset_val_3_,`MCU3.drif__rfc_reg_reset_val_2_,`MCU3.drif__rfc_reg_reset_val_1_,`MCU3.drif__rfc_reg_reset_val_0_} = 7'h33;

  force {`MCU0.drif__wr_reg_3_,`MCU0.drif__wr_reg_2_,`MCU0.drif__inv_wr_reg_1_,`MCU0.drif__inv_wr_reg_0_} = 4'h7;
  force {`MCU1.drif__wr_reg_3_,`MCU1.drif__wr_reg_2_,`MCU1.drif__inv_wr_reg_1_,`MCU1.drif__inv_wr_reg_0_} = 4'h7;
  force {`MCU2.drif__wr_reg_3_,`MCU2.drif__wr_reg_2_,`MCU2.drif__inv_wr_reg_1_,`MCU2.drif__inv_wr_reg_0_} = 4'h7;
  force {`MCU3.drif__wr_reg_3_,`MCU3.drif__wr_reg_2_,`MCU3.drif__inv_wr_reg_1_,`MCU3.drif__inv_wr_reg_0_} = 4'h7;

  force {`MCU0.drif__inv_iwtr_reg,`MCU0.drif__iwtr_reg_0_} = 2'h1;
  force {`MCU1.drif__inv_iwtr_reg,`MCU1.drif__iwtr_reg_0_} = 2'h1;
  force {`MCU2.drif__inv_iwtr_reg,`MCU2.drif__iwtr_reg_0_} = 2'h1;
  force {`MCU3.drif__inv_iwtr_reg,`MCU3.drif__iwtr_reg_0_} = 2'h1;
`else
if(sys_enabled) // For Settings same as the System
begin
  force `MCU0.drif.rcd_reg = 4'h4;
  force `MCU1.drif.rcd_reg = 4'h4;
  force `MCU2.drif.rcd_reg = 4'h4;
  force `MCU3.drif.rcd_reg = 4'h4;

  force `MCU0.drif.rfc_reg = 7'h1c;
  force `MCU1.drif.rfc_reg = 7'h1c;
  force `MCU2.drif.rfc_reg = 7'h1c;
  force `MCU3.drif.rfc_reg = 7'h1c;

  force `MCU0.drif.wr_reg = 4'h4;
  force `MCU1.drif.wr_reg = 4'h4;
  force `MCU2.drif.wr_reg = 4'h4;
  force `MCU3.drif.wr_reg = 4'h4;

  force `MCU0.drif.iwtr_reg = 2'h2; 
  force `MCU1.drif.iwtr_reg = 2'h2;
  force `MCU2.drif.iwtr_reg = 2'h2;
  force `MCU3.drif.iwtr_reg = 2'h2;
end
else
begin
  force `MCU0.drif.rcd_reg = 4'h3;
  force `MCU1.drif.rcd_reg = 4'h3;
  force `MCU2.drif.rcd_reg = 4'h3;
  force `MCU3.drif.rcd_reg = 4'h3;

  force `MCU0.drif.rfc_reg = 7'h14;
  force `MCU1.drif.rfc_reg = 7'h14;
  force `MCU2.drif.rfc_reg = 7'h14;
  force `MCU3.drif.rfc_reg = 7'h14;

  force `MCU0.drif.wr_reg = 4'h4;
  force `MCU1.drif.wr_reg = 4'h4;
  force `MCU2.drif.wr_reg = 4'h4;
  force `MCU3.drif.wr_reg = 4'h4;

  force `MCU0.drif.iwtr_reg = 2'h3;
  force `MCU1.drif.iwtr_reg = 2'h3;
  force `MCU2.drif.iwtr_reg = 2'h3;
  force `MCU3.drif.iwtr_reg = 2'h3;
end
`endif // mcu_gate

  if (sng_channel) begin
`ifdef MCU_GATE
    force {`MCU0.drif__rtw_dly_reg_3_,`MCU0.drif__rtw_dly_reg_2_,`MCU0.drif__rtw_dly_reg_1_,`MCU0.drif__rtw_reg_0_} = 4'h0;
    force {`MCU1.drif__rtw_dly_reg_3_,`MCU1.drif__rtw_dly_reg_2_,`MCU1.drif__rtw_dly_reg_1_,`MCU1.drif__rtw_reg_0_} = 4'h0;
    force {`MCU2.drif__rtw_dly_reg_3_,`MCU2.drif__rtw_dly_reg_2_,`MCU2.drif__rtw_dly_reg_1_,`MCU2.drif__rtw_reg_0_} = 4'h0;
    force {`MCU3.drif__rtw_dly_reg_3_,`MCU3.drif__rtw_dly_reg_2_,`MCU3.drif__rtw_dly_reg_1_,`MCU3.drif__rtw_reg_0_} = 4'h0;
`else
if(sys_enabled) // For Settings same as the System
begin
    force `MCU0.drif.rtw_dly_reg = 4'h1;
    force `MCU1.drif.rtw_dly_reg = 4'h1;
    force `MCU2.drif.rtw_dly_reg = 4'h1;
    force `MCU3.drif.rtw_dly_reg = 4'h1;
end
else
begin

    force `MCU0.drif.rtw_reg = 4'h6;
    force `MCU1.drif.rtw_reg = 4'h6;
    force `MCU2.drif.rtw_reg = 4'h6;
    force `MCU3.drif.rtw_reg = 4'h6;
end
`endif // mcu_gate
  end
  else begin // (DUAL_CHANNEL)
`ifdef MCU_GATE
    force {`MCU0.drif__rtw_dly_reg_3_,`MCU0.drif__rtw_dly_reg_2_,`MCU0.drif__rtw_dly_reg_1_,`MCU0.drif__rtw_reg_0_} = 4'h0;
    force {`MCU1.drif__rtw_dly_reg_3_,`MCU1.drif__rtw_dly_reg_2_,`MCU1.drif__rtw_dly_reg_1_,`MCU1.drif__rtw_reg_0_} = 4'h0;
    force {`MCU2.drif__rtw_dly_reg_3_,`MCU2.drif__rtw_dly_reg_2_,`MCU2.drif__rtw_dly_reg_1_,`MCU2.drif__rtw_reg_0_} = 4'h0;
    force {`MCU3.drif__rtw_dly_reg_3_,`MCU3.drif__rtw_dly_reg_2_,`MCU3.drif__rtw_dly_reg_1_,`MCU3.drif__rtw_reg_0_} = 4'h0;
`else
if(sys_enabled) // For Settings same as the System
begin
    force `MCU0.drif.rtw_dly_reg = 4'h1;
    force `MCU1.drif.rtw_dly_reg = 4'h1;
    force `MCU2.drif.rtw_dly_reg = 4'h1;
    force `MCU3.drif.rtw_dly_reg = 4'h1;
end
else
begin

    force `MCU0.drif.rtw_reg = 4'h4;
    force `MCU1.drif.rtw_reg = 4'h4;
    force `MCU2.drif.rtw_reg = 4'h4;
    force `MCU3.drif.rtw_reg = 4'h4;
end
`endif // mcu_gate
  end

  if (sng_channel) begin
`ifdef MCU_GATE
    force {`MCU0.drif__rrd_reg_3_,`MCU0.drif__rrd_reg_2_,`MCU0.drif__inv_rrd_reg,`MCU0.drif__rrd_reg_0_} = 4'h7;
    force {`MCU1.drif__rrd_reg_3_,`MCU1.drif__rrd_reg_2_,`MCU1.drif__inv_rrd_reg,`MCU1.drif__rrd_reg_0_} = 4'h7;
    force {`MCU2.drif__rrd_reg_3_,`MCU2.drif__rrd_reg_2_,`MCU2.drif__inv_rrd_reg,`MCU2.drif__rrd_reg_0_} = 4'h7;
    force {`MCU3.drif__rrd_reg_3_,`MCU3.drif__rrd_reg_2_,`MCU3.drif__inv_rrd_reg,`MCU3.drif__rrd_reg_0_} = 4'h7;
`else
if(sys_enabled) // For Settings same as the System
begin
    force `MCU0.drif.rrd_reg = 4'h4;
    force `MCU1.drif.rrd_reg = 4'h4;
    force `MCU2.drif.rrd_reg = 4'h4;
    force `MCU3.drif.rrd_reg = 4'h4;

end
else
begin
    force `MCU0.drif.rrd_reg = 4'h5;
    force `MCU1.drif.rrd_reg = 4'h5;
    force `MCU2.drif.rrd_reg = 4'h5;
    force `MCU3.drif.rrd_reg = 4'h5;
end
`endif // mcu_gate
  end
  else begin // (DUAL_CHANNEL)
`ifdef MCU_GATE
    force {`MCU0.drif__rrd_reg_3_,`MCU0.drif__rrd_reg_2_,`MCU0.drif__inv_rrd_reg,`MCU0.drif__rrd_reg_0_} = 4'h1;
    force {`MCU1.drif__rrd_reg_3_,`MCU1.drif__rrd_reg_2_,`MCU1.drif__inv_rrd_reg,`MCU1.drif__rrd_reg_0_} = 4'h1;
    force {`MCU2.drif__rrd_reg_3_,`MCU2.drif__rrd_reg_2_,`MCU2.drif__inv_rrd_reg,`MCU2.drif__rrd_reg_0_} = 4'h1;
    force {`MCU3.drif__rrd_reg_3_,`MCU3.drif__rrd_reg_2_,`MCU3.drif__inv_rrd_reg,`MCU3.drif__rrd_reg_0_} = 4'h1;
`else
if(sys_enabled) // For Settings same as the System
begin
    force `MCU0.drif.rrd_reg = 4'h2;
    force `MCU1.drif.rrd_reg = 4'h2;
    force `MCU2.drif.rrd_reg = 4'h2;
    force `MCU3.drif.rrd_reg = 4'h2;

end
else
begin

    force `MCU0.drif.rrd_reg = 4'h3;
    force `MCU1.drif.rrd_reg = 4'h3;
    force `MCU2.drif.rrd_reg = 4'h3;
    force `MCU3.drif.rrd_reg = 4'h3;
end
`endif // mcu_gate
  end

`ifdef MCU_GATE
  force {`MCU0.drif__faw_reg_4_,`MCU0.drif__inv_faw_reg_1_,`MCU0.drif__faw_reg_2_,`MCU0.drif__inv_faw_reg_0_,`MCU0.drif__faw_reg_0_} = 5'h0;
  force {`MCU1.drif__faw_reg_4_,`MCU1.drif__inv_faw_reg_1_,`MCU1.drif__faw_reg_2_,`MCU1.drif__inv_faw_reg_0_,`MCU1.drif__faw_reg_0_} = 5'h0;
  force {`MCU2.drif__faw_reg_4_,`MCU2.drif__inv_faw_reg_1_,`MCU2.drif__faw_reg_2_,`MCU2.drif__inv_faw_reg_0_,`MCU2.drif__faw_reg_0_} = 5'h0;
  force {`MCU3.drif__faw_reg_4_,`MCU3.drif__inv_faw_reg_1_,`MCU3.drif__faw_reg_2_,`MCU3.drif__inv_faw_reg_0_,`MCU3.drif__faw_reg_0_} = 5'h0;
`else
  force `MCU0.drif.faw_reg = 5'ha;
  force `MCU1.drif.faw_reg = 5'ha;
  force `MCU2.drif.faw_reg = 5'ha;
  force `MCU3.drif.faw_reg = 5'ha;
`endif // mcu_gate
 end

`else   // DDR2_667 (Values computed based on dram_clk_period = 3ns (333.333 MHz))
 if (mcu_reg_slam_en) begin

`ifdef NEC_FBDIMM  
`ifdef MCU_GATE
  force {`MCU0.drif__drif_ref_freq_12_,`MCU0.drif__drif_ref_freq_out_11_,`MCU0.drif__drif_ref_freq_10_,`MCU0.drif__drif_ref_freq_9_,`MCU0.drif__drif_ref_freq_8_,`MCU0.drif__drif_ref_freq_7_,`MCU0.drif__drif_ref_freq_6_,`MCU0.drif__drif_ref_freq_out_5_,`MCU0.drif__drif_ref_freq_4_,`MCU0.drif__drif_ref_freq_3_,`MCU0.drif__drif_ref_freq_2_,`MCU0.drif__drif_ref_freq_1_,`MCU0.drif__drif_ref_freq_0_} = 13'h208;
  force {`MCU1.drif__drif_ref_freq_12_,`MCU1.drif__drif_ref_freq_out_11_,`MCU1.drif__drif_ref_freq_10_,`MCU1.drif__drif_ref_freq_9_,`MCU1.drif__drif_ref_freq_8_,`MCU1.drif__drif_ref_freq_7_,`MCU1.drif__drif_ref_freq_6_,`MCU1.drif__drif_ref_freq_out_5_,`MCU1.drif__drif_ref_freq_4_,`MCU1.drif__drif_ref_freq_3_,`MCU1.drif__drif_ref_freq_2_,`MCU1.drif__drif_ref_freq_1_,`MCU1.drif__drif_ref_freq_0_} = 13'h208;
  force {`MCU2.drif__drif_ref_freq_12_,`MCU2.drif__drif_ref_freq_out_11_,`MCU2.drif__drif_ref_freq_10_,`MCU2.drif__drif_ref_freq_9_,`MCU2.drif__drif_ref_freq_8_,`MCU2.drif__drif_ref_freq_7_,`MCU2.drif__drif_ref_freq_6_,`MCU2.drif__drif_ref_freq_out_5_,`MCU2.drif__drif_ref_freq_4_,`MCU2.drif__drif_ref_freq_3_,`MCU2.drif__drif_ref_freq_2_,`MCU2.drif__drif_ref_freq_1_,`MCU2.drif__drif_ref_freq_0_} = 13'h208;
  force {`MCU3.drif__drif_ref_freq_12_,`MCU3.drif__drif_ref_freq_out_11_,`MCU3.drif__drif_ref_freq_10_,`MCU3.drif__drif_ref_freq_9_,`MCU3.drif__drif_ref_freq_8_,`MCU3.drif__drif_ref_freq_7_,`MCU3.drif__drif_ref_freq_6_,`MCU3.drif__drif_ref_freq_out_5_,`MCU3.drif__drif_ref_freq_4_,`MCU3.drif__drif_ref_freq_3_,`MCU3.drif__drif_ref_freq_2_,`MCU3.drif__drif_ref_freq_1_,`MCU3.drif__drif_ref_freq_0_} = 13'h208;
`else
  force `MCU0.drif.drif_ref_freq = 13'ha28;
  force `MCU1.drif.drif_ref_freq = 13'ha28;
  force `MCU2.drif.drif_ref_freq = 13'ha28;
  force `MCU3.drif.drif_ref_freq = 13'ha28;
`endif // mcu_gate
`endif 

`ifdef MCU_GATE
  force {`MCU0.drif__inv_ras_reg_1_,`MCU0.drif__ras_reg_2_,`MCU0.drif__ras_reg_1_,`MCU0.drif__inv_ras_reg_0_} = 4'h6;
  force {`MCU1.drif__inv_ras_reg_1_,`MCU1.drif__ras_reg_2_,`MCU1.drif__ras_reg_1_,`MCU1.drif__inv_ras_reg_0_} = 4'h6;
  force {`MCU2.drif__inv_ras_reg_1_,`MCU2.drif__ras_reg_2_,`MCU2.drif__ras_reg_1_,`MCU2.drif__inv_ras_reg_0_} = 4'h6;
  force {`MCU3.drif__inv_ras_reg_1_,`MCU3.drif__ras_reg_2_,`MCU3.drif__ras_reg_1_,`MCU3.drif__inv_ras_reg_0_} = 4'h6;

  force {`MCU0.drif__rp_reg_3_,`MCU0.drif__rp_reg_2_,`MCU0.drif__inv_rp_reg_1_,`MCU0.drif__inv_rp_reg_0_} = 4'h7;
  force {`MCU1.drif__rp_reg_3_,`MCU1.drif__rp_reg_2_,`MCU1.drif__inv_rp_reg_1_,`MCU1.drif__inv_rp_reg_0_} = 4'h7;
  force {`MCU2.drif__rp_reg_3_,`MCU2.drif__rp_reg_2_,`MCU2.drif__inv_rp_reg_1_,`MCU2.drif__inv_rp_reg_0_} = 4'h7;
  force {`MCU3.drif__rp_reg_3_,`MCU3.drif__rp_reg_2_,`MCU3.drif__inv_rp_reg_1_,`MCU3.drif__inv_rp_reg_0_} = 4'h7;

  force {`MCU0.drif__rtp_reg_2_,`MCU0.drif__inv_rtp_reg,`MCU0.drif__rtp_reg_0_} = 3'h1;
  force {`MCU1.drif__rtp_reg_2_,`MCU1.drif__inv_rtp_reg,`MCU1.drif__rtp_reg_0_} = 3'h1;
  force {`MCU2.drif__rtp_reg_2_,`MCU2.drif__inv_rtp_reg,`MCU2.drif__rtp_reg_0_} = 3'h1;
  force {`MCU3.drif__rtp_reg_2_,`MCU3.drif__inv_rtp_reg,`MCU3.drif__rtp_reg_0_} = 3'h1;
`else 
if(sys_enabled) // For Settings same as the System
begin
  force `MCU0.drif.ras_reg = 4'hf; // Same as sim before TO 2.0
  force `MCU1.drif.ras_reg = 4'hf;
  force `MCU2.drif.ras_reg = 4'hf;
  force `MCU3.drif.ras_reg = 4'hf;

  force `MCU0.drif.rp_reg = 4'h5;
  force `MCU1.drif.rp_reg = 4'h5;
  force `MCU2.drif.rp_reg = 4'h5;
  force `MCU3.drif.rp_reg = 4'h5;

  force `MCU0.drif.rtp_reg = 3'h3;// Same as sim before TO 2.0
  force `MCU1.drif.rtp_reg = 3'h3;
  force `MCU2.drif.rtp_reg = 3'h3;
  force `MCU3.drif.rtp_reg = 3'h3;

end
else
begin

  force `MCU0.drif.ras_reg = 4'hf;
  force `MCU1.drif.ras_reg = 4'hf;
  force `MCU2.drif.ras_reg = 4'hf;
  force `MCU3.drif.ras_reg = 4'hf;

  force `MCU0.drif.rp_reg = 4'h4;
  force `MCU1.drif.rp_reg = 4'h4;
  force `MCU2.drif.rp_reg = 4'h4;
  force `MCU3.drif.rp_reg = 4'h4;

  force `MCU0.drif.rtp_reg = 3'h3;
  force `MCU1.drif.rtp_reg = 3'h3;
  force `MCU2.drif.rtp_reg = 3'h3;
  force `MCU3.drif.rtp_reg = 3'h3;
end
`endif // mcu_gate

  if (sng_channel) begin
`ifdef MCU_GATE
    force {`MCU0.drif__rc_reg_4_,`MCU0.drif__inv_rc_reg_3_,`MCU0.drif__inv_rc_reg_2_,`MCU0.drif__rc_reg_1_,`MCU0.drif__N3659 } = 5'h19;
    force {`MCU1.drif__rc_reg_4_,`MCU1.drif__inv_rc_reg_3_,`MCU1.drif__inv_rc_reg_2_,`MCU1.drif__rc_reg_1_,`MCU1.drif__N3659 } = 5'h19;
    force {`MCU2.drif__rc_reg_4_,`MCU2.drif__inv_rc_reg_3_,`MCU2.drif__inv_rc_reg_2_,`MCU2.drif__rc_reg_1_,`MCU2.drif__N3659 } = 5'h19;
    force {`MCU3.drif__rc_reg_4_,`MCU3.drif__inv_rc_reg_3_,`MCU3.drif__inv_rc_reg_2_,`MCU3.drif__rc_reg_1_,`MCU3.drif__N3659 } = 5'h19;
`else
if(sys_enabled)
begin
    force `MCU0.drif.rc_reg = 5'h14;
    force `MCU1.drif.rc_reg = 5'h14;
    force `MCU2.drif.rc_reg = 5'h14;
    force `MCU3.drif.rc_reg = 5'h14;
end
else
begin
    force `MCU0.drif.rc_reg = 5'h15;
    force `MCU1.drif.rc_reg = 5'h15;
    force `MCU2.drif.rc_reg = 5'h15;
    force `MCU3.drif.rc_reg = 5'h15;
end
`endif // mcu_gate
  end
  else begin // (DUAL_CHANNEL)
`ifdef MCU_GATE
    force {`MCU0.drif__rc_reg_4_,`MCU0.drif__inv_rc_reg_3_,`MCU0.drif__inv_rc_reg_2_,`MCU0.drif__rc_reg_1_,`MCU0.drif__N3659 } = 5'h1f;
    force {`MCU1.drif__rc_reg_4_,`MCU1.drif__inv_rc_reg_3_,`MCU1.drif__inv_rc_reg_2_,`MCU1.drif__rc_reg_1_,`MCU1.drif__N3659 } = 5'h1f;
    force {`MCU2.drif__rc_reg_4_,`MCU2.drif__inv_rc_reg_3_,`MCU2.drif__inv_rc_reg_2_,`MCU2.drif__rc_reg_1_,`MCU2.drif__N3659 } = 5'h1f;
    force {`MCU3.drif__rc_reg_4_,`MCU3.drif__inv_rc_reg_3_,`MCU3.drif__inv_rc_reg_2_,`MCU3.drif__rc_reg_1_,`MCU3.drif__N3659 } = 5'h1f;
`else
if(sys_enabled)
begin
    force `MCU0.drif.rc_reg = 5'h14;
    force `MCU1.drif.rc_reg = 5'h14;
    force `MCU2.drif.rc_reg = 5'h14;
    force `MCU3.drif.rc_reg = 5'h14;
end
else
begin

    force `MCU0.drif.rc_reg = 5'h13;
    force `MCU1.drif.rc_reg = 5'h13;
    force `MCU2.drif.rc_reg = 5'h13;
    force `MCU3.drif.rc_reg = 5'h13;
end
`endif // mcu_gate
  end

`ifdef MCU_GATE
  force {`MCU0.drif__rcd_reg_3_,`MCU0.drif__rcd_reg_2_,`MCU0.drif__inv_rcd_reg_1_,`MCU0.drif__inv_rcd_reg_0_} = 4'h7;
  force {`MCU1.drif__rcd_reg_3_,`MCU1.drif__rcd_reg_2_,`MCU1.drif__inv_rcd_reg_1_,`MCU1.drif__inv_rcd_reg_0_} = 4'h7;
  force {`MCU2.drif__rcd_reg_3_,`MCU2.drif__rcd_reg_2_,`MCU2.drif__inv_rcd_reg_1_,`MCU2.drif__inv_rcd_reg_0_} = 4'h7;
  force {`MCU3.drif__rcd_reg_3_,`MCU3.drif__rcd_reg_2_,`MCU3.drif__inv_rcd_reg_1_,`MCU3.drif__inv_rcd_reg_0_} = 4'h7;

  force {`MCU0.drif__rfc_reg_reset_val_6_,`MCU0.drif__rfc_reg_reset_val_5_,`MCU0.drif__rfc_reg_reset_val_4_,`MCU0.drif__rfc_reg_reset_val_3_,`MCU0.drif__rfc_reg_reset_val_2_,`MCU0.drif__rfc_reg_reset_val_1_,`MCU0.drif__rfc_reg_reset_val_0_} = 7'h3e;
  force {`MCU1.drif__rfc_reg_reset_val_6_,`MCU1.drif__rfc_reg_reset_val_5_,`MCU1.drif__rfc_reg_reset_val_4_,`MCU1.drif__rfc_reg_reset_val_3_,`MCU1.drif__rfc_reg_reset_val_2_,`MCU1.drif__rfc_reg_reset_val_1_,`MCU1.drif__rfc_reg_reset_val_0_} = 7'h3e;
  force {`MCU2.drif__rfc_reg_reset_val_6_,`MCU2.drif__rfc_reg_reset_val_5_,`MCU2.drif__rfc_reg_reset_val_4_,`MCU2.drif__rfc_reg_reset_val_3_,`MCU2.drif__rfc_reg_reset_val_2_,`MCU2.drif__rfc_reg_reset_val_1_,`MCU2.drif__rfc_reg_reset_val_0_} = 7'h3e;
  force {`MCU3.drif__rfc_reg_reset_val_6_,`MCU3.drif__rfc_reg_reset_val_5_,`MCU3.drif__rfc_reg_reset_val_4_,`MCU3.drif__rfc_reg_reset_val_3_,`MCU3.drif__rfc_reg_reset_val_2_,`MCU3.drif__rfc_reg_reset_val_1_,`MCU3.drif__rfc_reg_reset_val_0_} = 7'h3e;

  force {`MCU0.drif__wr_reg_3_,`MCU0.drif__wr_reg_2_,`MCU0.drif__inv_wr_reg_1_,`MCU0.drif__inv_wr_reg_0_} = 4'h6;
  force {`MCU1.drif__wr_reg_3_,`MCU1.drif__wr_reg_2_,`MCU1.drif__inv_wr_reg_1_,`MCU1.drif__inv_wr_reg_0_} = 4'h6;
  force {`MCU2.drif__wr_reg_3_,`MCU2.drif__wr_reg_2_,`MCU2.drif__inv_wr_reg_1_,`MCU2.drif__inv_wr_reg_0_} = 4'h6;
  force {`MCU3.drif__wr_reg_3_,`MCU3.drif__wr_reg_2_,`MCU3.drif__inv_wr_reg_1_,`MCU3.drif__inv_wr_reg_0_} = 4'h6;

  force {`MCU0.drif__inv_iwtr_reg,`MCU0.drif__iwtr_reg_0_} = 2'h1;
  force {`MCU1.drif__inv_iwtr_reg,`MCU1.drif__iwtr_reg_0_} = 2'h1;
  force {`MCU2.drif__inv_iwtr_reg,`MCU2.drif__iwtr_reg_0_} = 2'h1;
  force {`MCU3.drif__inv_iwtr_reg,`MCU3.drif__iwtr_reg_0_} = 2'h1;
`else
if(sys_enabled) // For Settings same as the System
begin
  force `MCU0.drif.rcd_reg = 4'h5;
  force `MCU1.drif.rcd_reg = 4'h5;
  force `MCU2.drif.rcd_reg = 4'h5;
  force `MCU3.drif.rcd_reg = 4'h5;

  force `MCU0.drif.rfc_reg = 7'h23;
  force `MCU1.drif.rfc_reg = 7'h23;
  force `MCU2.drif.rfc_reg = 7'h23;
  force `MCU3.drif.rfc_reg = 7'h23;

  force `MCU0.drif.wr_reg = 4'h5;
  force `MCU1.drif.wr_reg = 4'h5;
  force `MCU2.drif.wr_reg = 4'h5;
  force `MCU3.drif.wr_reg = 4'h5;

  force `MCU0.drif.iwtr_reg = 2'h3; // Same as simulation before TO 2.0
  force `MCU1.drif.iwtr_reg = 2'h3;
  force `MCU2.drif.iwtr_reg = 2'h3;
  force `MCU3.drif.iwtr_reg = 2'h3;
end
else
begin

  force `MCU0.drif.rcd_reg = 4'h4;
  force `MCU1.drif.rcd_reg = 4'h4;
  force `MCU2.drif.rcd_reg = 4'h4;
  force `MCU3.drif.rcd_reg = 4'h4;

  force `MCU0.drif.rfc_reg = 7'h19;
  force `MCU1.drif.rfc_reg = 7'h19;
  force `MCU2.drif.rfc_reg = 7'h19;
  force `MCU3.drif.rfc_reg = 7'h19;

  force `MCU0.drif.wr_reg = 4'h5;
  force `MCU1.drif.wr_reg = 4'h5;
  force `MCU2.drif.wr_reg = 4'h5;
  force `MCU3.drif.wr_reg = 4'h5;

  force `MCU0.drif.iwtr_reg = 2'h3;
  force `MCU1.drif.iwtr_reg = 2'h3;
  force `MCU2.drif.iwtr_reg = 2'h3;
  force `MCU3.drif.iwtr_reg = 2'h3;
end
`endif // mcu_gate

  if (sng_channel) begin
`ifdef MCU_GATE
    force {`MCU0.drif__rtw_dly_reg_3_,`MCU0.drif__rtw_dly_reg_2_,`MCU0.drif__rtw_dly_reg_1_,`MCU0.drif__rtw_reg_0_} = 4'h0;
    force {`MCU1.drif__rtw_dly_reg_3_,`MCU1.drif__rtw_dly_reg_2_,`MCU1.drif__rtw_dly_reg_1_,`MCU1.drif__rtw_reg_0_} = 4'h0;
    force {`MCU2.drif__rtw_dly_reg_3_,`MCU2.drif__rtw_dly_reg_2_,`MCU2.drif__rtw_dly_reg_1_,`MCU2.drif__rtw_reg_0_} = 4'h0;
    force {`MCU3.drif__rtw_dly_reg_3_,`MCU3.drif__rtw_dly_reg_2_,`MCU3.drif__rtw_dly_reg_1_,`MCU3.drif__rtw_reg_0_} = 4'h0;
`else
if(sys_enabled) // For Settings same as the System
begin
    force `MCU0.drif.rtw_dly_reg = 4'h1;
    force `MCU1.drif.rtw_dly_reg = 4'h1;
    force `MCU2.drif.rtw_dly_reg = 4'h1;
    force `MCU3.drif.rtw_dly_reg = 4'h1;
end
else
begin

    force `MCU0.drif.rtw_reg = 4'h6;
    force `MCU1.drif.rtw_reg = 4'h6;
    force `MCU2.drif.rtw_reg = 4'h6;
    force `MCU3.drif.rtw_reg = 4'h6;
end
`endif // mcu_gate
  end
  else begin // (DUAL_CHANNEL)
`ifdef MCU_GATE
    force {`MCU0.drif__rtw_dly_reg_3_,`MCU0.drif__rtw_dly_reg_2_,`MCU0.drif__rtw_dly_reg_1_,`MCU0.drif__rtw_reg_0_} = 4'h0;
    force {`MCU1.drif__rtw_dly_reg_3_,`MCU1.drif__rtw_dly_reg_2_,`MCU1.drif__rtw_dly_reg_1_,`MCU1.drif__rtw_reg_0_} = 4'h0;
    force {`MCU2.drif__rtw_dly_reg_3_,`MCU2.drif__rtw_dly_reg_2_,`MCU2.drif__rtw_dly_reg_1_,`MCU2.drif__rtw_reg_0_} = 4'h0;
    force {`MCU3.drif__rtw_dly_reg_3_,`MCU3.drif__rtw_dly_reg_2_,`MCU3.drif__rtw_dly_reg_1_,`MCU3.drif__rtw_reg_0_} = 4'h0;
`else
if(sys_enabled) // For Settings same as the System
begin
    force `MCU0.drif.rtw_dly_reg = 4'h1;
    force `MCU1.drif.rtw_dly_reg = 4'h1;
    force `MCU2.drif.rtw_dly_reg = 4'h1;
    force `MCU3.drif.rtw_dly_reg = 4'h1;
end
else
begin
    force `MCU0.drif.rtw_reg = 4'h4;
    force `MCU1.drif.rtw_reg = 4'h4;
    force `MCU2.drif.rtw_reg = 4'h4;
    force `MCU3.drif.rtw_reg = 4'h4;
end

`endif // mcu_gate
/** This forces the output of the rtw reg equation, so removing it
`else
if(sys_enabled) // For Settings same as the System
begin
    force `MCU0.drif.rtw_reg = 4'h1;
    force `MCU1.drif.rtw_reg = 4'h1;
    force `MCU2.drif.rtw_reg = 4'h1;
    force `MCU3.drif.rtw_reg = 4'h1;
end
else
begin
    force `MCU0.drif.rtw_reg = 4'h4;
    force `MCU1.drif.rtw_reg = 4'h4;
    force `MCU2.drif.rtw_reg = 4'h4;
    force `MCU3.drif.rtw_reg = 4'h4;
end
`endif // mcu_gate
***/
  end

  if (sng_channel) begin
`ifdef MCU_GATE
    force {`MCU0.drif__rrd_reg_3_,`MCU0.drif__rrd_reg_2_,`MCU0.drif__inv_rrd_reg,`MCU0.drif__rrd_reg_0_} = 4'h7;
    force {`MCU1.drif__rrd_reg_3_,`MCU1.drif__rrd_reg_2_,`MCU1.drif__inv_rrd_reg,`MCU1.drif__rrd_reg_0_} = 4'h7;
    force {`MCU2.drif__rrd_reg_3_,`MCU2.drif__rrd_reg_2_,`MCU2.drif__inv_rrd_reg,`MCU2.drif__rrd_reg_0_} = 4'h7;
    force {`MCU3.drif__rrd_reg_3_,`MCU3.drif__rrd_reg_2_,`MCU3.drif__inv_rrd_reg,`MCU3.drif__rrd_reg_0_} = 4'h7;
`else
if(sys_enabled) // For Settings same as the System
begin
    force `MCU0.drif.rrd_reg = 4'h5; // Same as sim pre TO 2.0
    force `MCU1.drif.rrd_reg = 4'h5;
    force `MCU2.drif.rrd_reg = 4'h5;
    force `MCU3.drif.rrd_reg = 4'h5;

end
else
begin

    force `MCU0.drif.rrd_reg = 4'h5;
    force `MCU1.drif.rrd_reg = 4'h5;
    force `MCU2.drif.rrd_reg = 4'h5;
    force `MCU3.drif.rrd_reg = 4'h5;
end
`endif // mcu_gate
  end
  else begin // (DUAL_CHANNEL)
`ifdef MCU_GATE
    force {`MCU0.drif__rrd_reg_3_,`MCU0.drif__rrd_reg_2_,`MCU0.drif__inv_rrd_reg,`MCU0.drif__rrd_reg_0_} = 4'h1;
    force {`MCU1.drif__rrd_reg_3_,`MCU1.drif__rrd_reg_2_,`MCU1.drif__inv_rrd_reg,`MCU1.drif__rrd_reg_0_} = 4'h1;
    force {`MCU2.drif__rrd_reg_3_,`MCU2.drif__rrd_reg_2_,`MCU2.drif__inv_rrd_reg,`MCU2.drif__rrd_reg_0_} = 4'h1;
    force {`MCU3.drif__rrd_reg_3_,`MCU3.drif__rrd_reg_2_,`MCU3.drif__inv_rrd_reg,`MCU3.drif__rrd_reg_0_} = 4'h1;
`else
if(sys_enabled) // For Settings same as the System
begin
    force `MCU0.drif.rrd_reg = 4'h3; // Same as sim pre TO 2.0
    force `MCU1.drif.rrd_reg = 4'h3;
    force `MCU2.drif.rrd_reg = 4'h3;
    force `MCU3.drif.rrd_reg = 4'h3;

end
else
begin
    force `MCU0.drif.rrd_reg = 4'h3;
    force `MCU1.drif.rrd_reg = 4'h3;
    force `MCU2.drif.rrd_reg = 4'h3;
    force `MCU3.drif.rrd_reg = 4'h3;
end
`endif // mcu_gate
  end

`ifdef MCU_GATE
  force {`MCU0.drif__faw_reg_4_,`MCU0.drif__inv_faw_reg_1_,`MCU0.drif__faw_reg_2_,`MCU0.drif__inv_faw_reg_0_,`MCU0.drif__faw_reg_0_} = 5'h7;
  force {`MCU1.drif__faw_reg_4_,`MCU1.drif__inv_faw_reg_1_,`MCU1.drif__faw_reg_2_,`MCU1.drif__inv_faw_reg_0_,`MCU1.drif__faw_reg_0_} = 5'h7;
  force {`MCU2.drif__faw_reg_4_,`MCU2.drif__inv_faw_reg_1_,`MCU2.drif__faw_reg_2_,`MCU2.drif__inv_faw_reg_0_,`MCU2.drif__faw_reg_0_} = 5'h7;
  force {`MCU3.drif__faw_reg_4_,`MCU3.drif__inv_faw_reg_1_,`MCU3.drif__faw_reg_2_,`MCU3.drif__inv_faw_reg_0_,`MCU3.drif__faw_reg_0_} = 5'h7;
`else
  force `MCU0.drif.faw_reg = 5'hd;
  force `MCU1.drif.faw_reg = 5'hd;
  force `MCU2.drif.faw_reg = 5'hd;
  force `MCU3.drif.faw_reg = 5'hd;
`endif // mcu_gate
 end
`endif
end // else: !if($test$plusargs("NO_MCU_CSR_SLAM"))   


`ifdef IDT_FBDIMM
   if ($test$plusargs("NO_IDT_CSR_SLAM")) begin
     `PR_INFO ("mcu_mem_config", `INFO, "IDT CSRs not slammed");
   end
   else begin

      // Set CL in idt_fbdimm
      `ifndef AXIS
        force `FBD_CH_PATH0.fbdimm0.CL = cas_latency[2:0];
        force `FBD_CH_PATH2.fbdimm0.CL = cas_latency[2:0];
        force `FBD_CH_PATH4.fbdimm0.CL = cas_latency[2:0];
        force `FBD_CH_PATH6.fbdimm0.CL = cas_latency[2:0];

        `ifndef SNG_CHANNEL
        force `FBD_CH_PATH1.fbdimm0.CL = cas_latency[2:0];
        force `FBD_CH_PATH3.fbdimm0.CL = cas_latency[2:0];
        force `FBD_CH_PATH5.fbdimm0.CL = cas_latency[2:0];
        force `FBD_CH_PATH7.fbdimm0.CL = cas_latency[2:0];
        `endif
        `ifndef FBDIMM_NUM_1
            force `FBD_CH_PATH0.fbdimm1.CL = cas_latency[2:0];
            force `FBD_CH_PATH2.fbdimm1.CL = cas_latency[2:0];
            force `FBD_CH_PATH4.fbdimm1.CL = cas_latency[2:0];
            force `FBD_CH_PATH6.fbdimm1.CL = cas_latency[2:0];

            `ifndef SNG_CHANNEL
            force `FBD_CH_PATH1.fbdimm1.CL = cas_latency[2:0];
            force `FBD_CH_PATH3.fbdimm1.CL = cas_latency[2:0];
            force `FBD_CH_PATH5.fbdimm1.CL = cas_latency[2:0];
            force `FBD_CH_PATH7.fbdimm1.CL = cas_latency[2:0];
            `endif

            `ifndef FBDIMM_NUM_2
                force `FBD_CH_PATH0.fbdimm2.CL = cas_latency[2:0];
                force `FBD_CH_PATH2.fbdimm2.CL = cas_latency[2:0];
                force `FBD_CH_PATH4.fbdimm2.CL = cas_latency[2:0];
                force `FBD_CH_PATH6.fbdimm2.CL = cas_latency[2:0];
                force `FBD_CH_PATH0.fbdimm3.CL = cas_latency[2:0];
                force `FBD_CH_PATH2.fbdimm3.CL = cas_latency[2:0];
                force `FBD_CH_PATH4.fbdimm3.CL = cas_latency[2:0];
                force `FBD_CH_PATH6.fbdimm3.CL = cas_latency[2:0];

                `ifndef SNG_CHANNEL
                force `FBD_CH_PATH1.fbdimm2.CL = cas_latency[2:0];
                force `FBD_CH_PATH3.fbdimm2.CL = cas_latency[2:0];
                force `FBD_CH_PATH5.fbdimm2.CL = cas_latency[2:0];
                force `FBD_CH_PATH7.fbdimm2.CL = cas_latency[2:0];
                force `FBD_CH_PATH1.fbdimm3.CL = cas_latency[2:0];
                force `FBD_CH_PATH3.fbdimm3.CL = cas_latency[2:0];
                force `FBD_CH_PATH5.fbdimm3.CL = cas_latency[2:0];
                force `FBD_CH_PATH7.fbdimm3.CL = cas_latency[2:0];
                `endif

                `ifndef FBDIMM_NUM_4
                    force `FBD_CH_PATH0.fbdimm4.CL = cas_latency[2:0];
                    force `FBD_CH_PATH2.fbdimm4.CL = cas_latency[2:0];
                    force `FBD_CH_PATH4.fbdimm4.CL = cas_latency[2:0];
                    force `FBD_CH_PATH6.fbdimm4.CL = cas_latency[2:0];
                    force `FBD_CH_PATH0.fbdimm5.CL = cas_latency[2:0];
                    force `FBD_CH_PATH2.fbdimm5.CL = cas_latency[2:0];
                    force `FBD_CH_PATH4.fbdimm5.CL = cas_latency[2:0];
                    force `FBD_CH_PATH6.fbdimm5.CL = cas_latency[2:0];
                    force `FBD_CH_PATH0.fbdimm6.CL = cas_latency[2:0];
                    force `FBD_CH_PATH2.fbdimm6.CL = cas_latency[2:0];
                    force `FBD_CH_PATH4.fbdimm6.CL = cas_latency[2:0];
                    force `FBD_CH_PATH6.fbdimm6.CL = cas_latency[2:0];
                    force `FBD_CH_PATH0.fbdimm7.CL = cas_latency[2:0];
                    force `FBD_CH_PATH2.fbdimm7.CL = cas_latency[2:0];
                    force `FBD_CH_PATH4.fbdimm7.CL = cas_latency[2:0];
                    force `FBD_CH_PATH6.fbdimm7.CL = cas_latency[2:0];

                    `ifndef SNG_CHANNEL
                    force `FBD_CH_PATH1.fbdimm4.CL = cas_latency[2:0];
                    force `FBD_CH_PATH3.fbdimm4.CL = cas_latency[2:0];
                    force `FBD_CH_PATH5.fbdimm4.CL = cas_latency[2:0];
                    force `FBD_CH_PATH7.fbdimm4.CL = cas_latency[2:0];
                    force `FBD_CH_PATH1.fbdimm5.CL = cas_latency[2:0];
                    force `FBD_CH_PATH3.fbdimm5.CL = cas_latency[2:0];
                    force `FBD_CH_PATH5.fbdimm5.CL = cas_latency[2:0];
                    force `FBD_CH_PATH7.fbdimm5.CL = cas_latency[2:0];
                    force `FBD_CH_PATH1.fbdimm6.CL = cas_latency[2:0];
                    force `FBD_CH_PATH3.fbdimm6.CL = cas_latency[2:0];
                    force `FBD_CH_PATH5.fbdimm6.CL = cas_latency[2:0];
                    force `FBD_CH_PATH7.fbdimm6.CL = cas_latency[2:0];
                    force `FBD_CH_PATH1.fbdimm7.CL = cas_latency[2:0];
                    force `FBD_CH_PATH3.fbdimm7.CL = cas_latency[2:0];
                    force `FBD_CH_PATH5.fbdimm7.CL = cas_latency[2:0];
                    force `FBD_CH_PATH7.fbdimm7.CL = cas_latency[2:0];
                    `endif
                `endif // num_4
            `endif // num_2
        `endif // num_1
        `endif // axis

      // Set AL in idt_fbdimm
      `ifndef AXIS
        force `FBD_CH_PATH0.fbdimm0.AL = additive_latency[2:0];
        force `FBD_CH_PATH2.fbdimm0.AL = additive_latency[2:0];
        force `FBD_CH_PATH4.fbdimm0.AL = additive_latency[2:0];
        force `FBD_CH_PATH6.fbdimm0.AL = additive_latency[2:0];

        `ifndef SNG_CHANNEL
        force `FBD_CH_PATH1.fbdimm0.AL = additive_latency[2:0];
        force `FBD_CH_PATH3.fbdimm0.AL = additive_latency[2:0];
        force `FBD_CH_PATH5.fbdimm0.AL = additive_latency[2:0];
        force `FBD_CH_PATH7.fbdimm0.AL = additive_latency[2:0];
        `endif
        `ifndef FBDIMM_NUM_1
            force `FBD_CH_PATH0.fbdimm1.AL = additive_latency[2:0];
            force `FBD_CH_PATH2.fbdimm1.AL = additive_latency[2:0];
            force `FBD_CH_PATH4.fbdimm1.AL = additive_latency[2:0];
            force `FBD_CH_PATH6.fbdimm1.AL = additive_latency[2:0];

            `ifndef SNG_CHANNEL
            force `FBD_CH_PATH1.fbdimm1.AL = additive_latency[2:0];
            force `FBD_CH_PATH3.fbdimm1.AL = additive_latency[2:0];
            force `FBD_CH_PATH5.fbdimm1.AL = additive_latency[2:0];
            force `FBD_CH_PATH7.fbdimm1.AL = additive_latency[2:0];
            `endif

            `ifndef FBDIMM_NUM_2
                force `FBD_CH_PATH0.fbdimm2.AL = additive_latency[2:0];
                force `FBD_CH_PATH2.fbdimm2.AL = additive_latency[2:0];
                force `FBD_CH_PATH4.fbdimm2.AL = additive_latency[2:0];
                force `FBD_CH_PATH6.fbdimm2.AL = additive_latency[2:0];
                force `FBD_CH_PATH0.fbdimm3.AL = additive_latency[2:0];
                force `FBD_CH_PATH2.fbdimm3.AL = additive_latency[2:0];
                force `FBD_CH_PATH4.fbdimm3.AL = additive_latency[2:0];
                force `FBD_CH_PATH6.fbdimm3.AL = additive_latency[2:0];

                `ifndef SNG_CHANNEL
                force `FBD_CH_PATH1.fbdimm2.AL = additive_latency[2:0];
                force `FBD_CH_PATH3.fbdimm2.AL = additive_latency[2:0];
                force `FBD_CH_PATH5.fbdimm2.AL = additive_latency[2:0];
                force `FBD_CH_PATH7.fbdimm2.AL = additive_latency[2:0];
                force `FBD_CH_PATH1.fbdimm3.AL = additive_latency[2:0];
                force `FBD_CH_PATH3.fbdimm3.AL = additive_latency[2:0];
                force `FBD_CH_PATH5.fbdimm3.AL = additive_latency[2:0];
                force `FBD_CH_PATH7.fbdimm3.AL = additive_latency[2:0];
                `endif

                `ifndef FBDIMM_NUM_4
                    force `FBD_CH_PATH0.fbdimm4.AL = additive_latency[2:0];
                    force `FBD_CH_PATH2.fbdimm4.AL = additive_latency[2:0];
                    force `FBD_CH_PATH4.fbdimm4.AL = additive_latency[2:0];
                    force `FBD_CH_PATH6.fbdimm4.AL = additive_latency[2:0];
                    force `FBD_CH_PATH0.fbdimm5.AL = additive_latency[2:0];
                    force `FBD_CH_PATH2.fbdimm5.AL = additive_latency[2:0];
                    force `FBD_CH_PATH4.fbdimm5.AL = additive_latency[2:0];
                    force `FBD_CH_PATH6.fbdimm5.AL = additive_latency[2:0];
                    force `FBD_CH_PATH0.fbdimm6.AL = additive_latency[2:0];
                    force `FBD_CH_PATH2.fbdimm6.AL = additive_latency[2:0];
                    force `FBD_CH_PATH4.fbdimm6.AL = additive_latency[2:0];
                    force `FBD_CH_PATH6.fbdimm6.AL = additive_latency[2:0];
                    force `FBD_CH_PATH0.fbdimm7.AL = additive_latency[2:0];
                    force `FBD_CH_PATH2.fbdimm7.AL = additive_latency[2:0];
                    force `FBD_CH_PATH4.fbdimm7.AL = additive_latency[2:0];
                    force `FBD_CH_PATH6.fbdimm7.AL = additive_latency[2:0];

                    `ifndef SNG_CHANNEL
                    force `FBD_CH_PATH1.fbdimm4.AL = additive_latency[2:0];
                    force `FBD_CH_PATH3.fbdimm4.AL = additive_latency[2:0];
                    force `FBD_CH_PATH5.fbdimm4.AL = additive_latency[2:0];
                    force `FBD_CH_PATH7.fbdimm4.AL = additive_latency[2:0];
                    force `FBD_CH_PATH1.fbdimm5.AL = additive_latency[2:0];
                    force `FBD_CH_PATH3.fbdimm5.AL = additive_latency[2:0];
                    force `FBD_CH_PATH5.fbdimm5.AL = additive_latency[2:0];
                    force `FBD_CH_PATH7.fbdimm5.AL = additive_latency[2:0];
                    force `FBD_CH_PATH1.fbdimm6.AL = additive_latency[2:0];
                    force `FBD_CH_PATH3.fbdimm6.AL = additive_latency[2:0];
                    force `FBD_CH_PATH5.fbdimm6.AL = additive_latency[2:0];
                    force `FBD_CH_PATH7.fbdimm6.AL = additive_latency[2:0];
                    force `FBD_CH_PATH1.fbdimm7.AL = additive_latency[2:0];
                    force `FBD_CH_PATH3.fbdimm7.AL = additive_latency[2:0];
                    force `FBD_CH_PATH5.fbdimm7.AL = additive_latency[2:0];
                    force `FBD_CH_PATH7.fbdimm7.AL = additive_latency[2:0];
                    `endif
                `endif // num_4
            `endif // num_2
        `endif // num_1
        `endif // axis


        // Set AL and CL in DRC reg inside idt_fbidmm
      `ifndef AXIS
        force `FBD_CH_PATH0.fbdimm0.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
        force `FBD_CH_PATH2.fbdimm0.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
        force `FBD_CH_PATH4.fbdimm0.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
        force `FBD_CH_PATH6.fbdimm0.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};

        `ifndef SNG_CHANNEL
        force `FBD_CH_PATH1.fbdimm0.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
        force `FBD_CH_PATH3.fbdimm0.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
        force `FBD_CH_PATH5.fbdimm0.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
        force `FBD_CH_PATH7.fbdimm0.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
        `endif
        `ifndef FBDIMM_NUM_1
            force `FBD_CH_PATH0.fbdimm1.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
            force `FBD_CH_PATH2.fbdimm1.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
            force `FBD_CH_PATH4.fbdimm1.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
            force `FBD_CH_PATH6.fbdimm1.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};

            `ifndef SNG_CHANNEL
            force `FBD_CH_PATH1.fbdimm1.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
            force `FBD_CH_PATH3.fbdimm1.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
            force `FBD_CH_PATH5.fbdimm1.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
            force `FBD_CH_PATH7.fbdimm1.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
            `endif

            `ifndef FBDIMM_NUM_2
                force `FBD_CH_PATH0.fbdimm2.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                force `FBD_CH_PATH2.fbdimm2.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                force `FBD_CH_PATH4.fbdimm2.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                force `FBD_CH_PATH6.fbdimm2.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                force `FBD_CH_PATH0.fbdimm3.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                force `FBD_CH_PATH2.fbdimm3.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                force `FBD_CH_PATH4.fbdimm3.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                force `FBD_CH_PATH6.fbdimm3.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};

                `ifndef SNG_CHANNEL
                force `FBD_CH_PATH1.fbdimm2.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                force `FBD_CH_PATH3.fbdimm2.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                force `FBD_CH_PATH5.fbdimm2.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                force `FBD_CH_PATH7.fbdimm2.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                force `FBD_CH_PATH1.fbdimm3.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                force `FBD_CH_PATH3.fbdimm3.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                force `FBD_CH_PATH5.fbdimm3.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                force `FBD_CH_PATH7.fbdimm3.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                `endif

                `ifndef FBDIMM_NUM_4
                    force `FBD_CH_PATH0.fbdimm4.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH2.fbdimm4.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH4.fbdimm4.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH6.fbdimm4.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH0.fbdimm5.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH2.fbdimm5.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH4.fbdimm5.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH6.fbdimm5.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH0.fbdimm6.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH2.fbdimm6.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH4.fbdimm6.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH6.fbdimm6.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH0.fbdimm7.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH2.fbdimm7.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH4.fbdimm7.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH6.fbdimm7.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};

                    `ifndef SNG_CHANNEL
                    force `FBD_CH_PATH1.fbdimm4.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH3.fbdimm4.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH5.fbdimm4.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH7.fbdimm4.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH1.fbdimm5.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH3.fbdimm5.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH5.fbdimm5.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH7.fbdimm5.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH1.fbdimm6.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH3.fbdimm6.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH5.fbdimm6.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH7.fbdimm6.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH1.fbdimm7.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH3.fbdimm7.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH5.fbdimm7.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    force `FBD_CH_PATH7.fbdimm7.idt_amb0.registers.reg37C = {msb_drc,additive_latency,cas_latency};
                    `endif
                `endif // num_4
            `endif // num_2
        `endif // num_1
        `endif // axis

        // Set sync_train_interval in DRC reg inside idt_fbidmm
      `ifndef AXIS
        force `FBD_CH_PATH0.fbdimm0.idt_amb0.registers.reg178 = sync_train_interval;
        force `FBD_CH_PATH2.fbdimm0.idt_amb0.registers.reg178 = sync_train_interval;
        force `FBD_CH_PATH4.fbdimm0.idt_amb0.registers.reg178 = sync_train_interval;
        force `FBD_CH_PATH6.fbdimm0.idt_amb0.registers.reg178 = sync_train_interval;

        `ifndef SNG_CHANNEL
        force `FBD_CH_PATH1.fbdimm0.idt_amb0.registers.reg178 = sync_train_interval;
        force `FBD_CH_PATH3.fbdimm0.idt_amb0.registers.reg178 = sync_train_interval;
        force `FBD_CH_PATH5.fbdimm0.idt_amb0.registers.reg178 = sync_train_interval;
        force `FBD_CH_PATH7.fbdimm0.idt_amb0.registers.reg178 = sync_train_interval;
        `endif
        `ifndef FBDIMM_NUM_1
            force `FBD_CH_PATH0.fbdimm1.idt_amb0.registers.reg178 = sync_train_interval;
            force `FBD_CH_PATH2.fbdimm1.idt_amb0.registers.reg178 = sync_train_interval;
            force `FBD_CH_PATH4.fbdimm1.idt_amb0.registers.reg178 = sync_train_interval;
            force `FBD_CH_PATH6.fbdimm1.idt_amb0.registers.reg178 = sync_train_interval;

            `ifndef SNG_CHANNEL
            force `FBD_CH_PATH1.fbdimm1.idt_amb0.registers.reg178 = sync_train_interval;
            force `FBD_CH_PATH3.fbdimm1.idt_amb0.registers.reg178 = sync_train_interval;
            force `FBD_CH_PATH5.fbdimm1.idt_amb0.registers.reg178 = sync_train_interval;
            force `FBD_CH_PATH7.fbdimm1.idt_amb0.registers.reg178 = sync_train_interval;
            `endif

            `ifndef FBDIMM_NUM_2
                force `FBD_CH_PATH0.fbdimm2.idt_amb0.registers.reg178 = sync_train_interval;
                force `FBD_CH_PATH2.fbdimm2.idt_amb0.registers.reg178 = sync_train_interval;
                force `FBD_CH_PATH4.fbdimm2.idt_amb0.registers.reg178 = sync_train_interval;
                force `FBD_CH_PATH6.fbdimm2.idt_amb0.registers.reg178 = sync_train_interval;
                force `FBD_CH_PATH0.fbdimm3.idt_amb0.registers.reg178 = sync_train_interval;
                force `FBD_CH_PATH2.fbdimm3.idt_amb0.registers.reg178 = sync_train_interval;
                force `FBD_CH_PATH4.fbdimm3.idt_amb0.registers.reg178 = sync_train_interval;
                force `FBD_CH_PATH6.fbdimm3.idt_amb0.registers.reg178 = sync_train_interval;

                `ifndef SNG_CHANNEL
                force `FBD_CH_PATH1.fbdimm2.idt_amb0.registers.reg178 = sync_train_interval;
                force `FBD_CH_PATH3.fbdimm2.idt_amb0.registers.reg178 = sync_train_interval;
                force `FBD_CH_PATH5.fbdimm2.idt_amb0.registers.reg178 = sync_train_interval;
                force `FBD_CH_PATH7.fbdimm2.idt_amb0.registers.reg178 = sync_train_interval;
                force `FBD_CH_PATH1.fbdimm3.idt_amb0.registers.reg178 = sync_train_interval;
                force `FBD_CH_PATH3.fbdimm3.idt_amb0.registers.reg178 = sync_train_interval;
                force `FBD_CH_PATH5.fbdimm3.idt_amb0.registers.reg178 = sync_train_interval;
                force `FBD_CH_PATH7.fbdimm3.idt_amb0.registers.reg178 = sync_train_interval;
                `endif

                `ifndef FBDIMM_NUM_4
                    force `FBD_CH_PATH0.fbdimm4.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH2.fbdimm4.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH4.fbdimm4.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH6.fbdimm4.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH0.fbdimm5.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH2.fbdimm5.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH4.fbdimm5.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH6.fbdimm5.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH0.fbdimm6.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH2.fbdimm6.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH4.fbdimm6.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH6.fbdimm6.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH0.fbdimm7.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH2.fbdimm7.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH4.fbdimm7.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH6.fbdimm7.idt_amb0.registers.reg178 = sync_train_interval;

                    `ifndef SNG_CHANNEL
                    force `FBD_CH_PATH1.fbdimm4.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH3.fbdimm4.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH5.fbdimm4.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH7.fbdimm4.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH1.fbdimm5.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH3.fbdimm5.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH5.fbdimm5.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH7.fbdimm5.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH1.fbdimm6.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH3.fbdimm6.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH5.fbdimm6.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH7.fbdimm6.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH1.fbdimm7.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH3.fbdimm7.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH5.fbdimm7.idt_amb0.registers.reg178 = sync_train_interval;
                    force `FBD_CH_PATH7.fbdimm7.idt_amb0.registers.reg178 = sync_train_interval;
                    `endif
                `endif // num_4
            `endif // num_2
        `endif // num_1
        `endif // axis

        // Set cmd2datanxt in CMD2DATANXT reg (1E8) inside idt_fbidmm
        // Set cmd2datacur in CMD2DATACUR reg (1E9) inside idt_fbidmm
      `ifndef AXIS
        force `FBD_CH_PATH0.fbdimm0.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
        force `FBD_CH_PATH2.fbdimm0.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
        force `FBD_CH_PATH4.fbdimm0.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
        force `FBD_CH_PATH6.fbdimm0.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};

        `ifndef SNG_CHANNEL
        force `FBD_CH_PATH1.fbdimm0.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
        force `FBD_CH_PATH3.fbdimm0.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
        force `FBD_CH_PATH5.fbdimm0.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
        force `FBD_CH_PATH7.fbdimm0.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
        `endif
        `ifndef FBDIMM_NUM_1
            force `FBD_CH_PATH0.fbdimm1.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
            force `FBD_CH_PATH2.fbdimm1.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
            force `FBD_CH_PATH4.fbdimm1.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
            force `FBD_CH_PATH6.fbdimm1.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};

            `ifndef SNG_CHANNEL
            force `FBD_CH_PATH1.fbdimm1.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
            force `FBD_CH_PATH3.fbdimm1.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
            force `FBD_CH_PATH5.fbdimm1.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
            force `FBD_CH_PATH7.fbdimm1.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
            `endif

            `ifndef FBDIMM_NUM_2
                force `FBD_CH_PATH0.fbdimm2.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                force `FBD_CH_PATH2.fbdimm2.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                force `FBD_CH_PATH4.fbdimm2.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                force `FBD_CH_PATH6.fbdimm2.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                force `FBD_CH_PATH0.fbdimm3.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                force `FBD_CH_PATH2.fbdimm3.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                force `FBD_CH_PATH4.fbdimm3.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                force `FBD_CH_PATH6.fbdimm3.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};

                `ifndef SNG_CHANNEL
                force `FBD_CH_PATH1.fbdimm2.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                force `FBD_CH_PATH3.fbdimm2.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                force `FBD_CH_PATH5.fbdimm2.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                force `FBD_CH_PATH7.fbdimm2.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                force `FBD_CH_PATH1.fbdimm3.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                force `FBD_CH_PATH3.fbdimm3.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                force `FBD_CH_PATH5.fbdimm3.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                force `FBD_CH_PATH7.fbdimm3.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                `endif

                `ifndef FBDIMM_NUM_4
                    force `FBD_CH_PATH0.fbdimm4.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH2.fbdimm4.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH4.fbdimm4.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH6.fbdimm4.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH0.fbdimm5.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH2.fbdimm5.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH4.fbdimm5.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH6.fbdimm5.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH0.fbdimm6.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH2.fbdimm6.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH4.fbdimm6.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH6.fbdimm6.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH0.fbdimm7.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH2.fbdimm7.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH4.fbdimm7.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH6.fbdimm7.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};

                    `ifndef SNG_CHANNEL
                    force `FBD_CH_PATH1.fbdimm4.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH3.fbdimm4.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH5.fbdimm4.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH7.fbdimm4.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH1.fbdimm5.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH3.fbdimm5.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH5.fbdimm5.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH7.fbdimm5.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH1.fbdimm6.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH3.fbdimm6.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH5.fbdimm6.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH7.fbdimm6.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH1.fbdimm7.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH3.fbdimm7.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH5.fbdimm7.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    force `FBD_CH_PATH7.fbdimm7.idt_amb0.registers.reg1E8 = {cmd2datacur,cmd2datanxt};
                    `endif
                `endif // num_4
            `endif // num_2
        `endif // num_1
        `endif // axis

   end // else: !if($test$plusargs("NO_IDT_CSR_SLAM"))
`endif // IDT_FBDIMM

end // initial

// ----- DTM Mode (Programming Channel Read Latency as no Polling State in DTM) ---
//The forces are applied after the first SSI sync has happened to model the behaviour
//during real world programming
always @ (negedge `CPU.SSI_SYNC_L)
if (dtm_enabled)
begin
repeat (200)  @ (negedge `CPU.SSI_SCK);
`ifndef AXIS
    if (! $value$plusargs("set_channel_read_latency=%h", chnl_read_latency))
      chnl_read_latency = 8'h14 ;
   
  if ($test$plusargs("NO_MCU_CSR_SLAM")) begin
     `PR_INFO ("mcu_mem_config", `INFO, "MCU CSRs not slammed");
  end
  else begin
`ifdef MCU_GATE
    chnl_read_latency_gate = chnl_read_latency ^ 8'hff;

    // --- Set Channel Read latency in DTM mode  ---

    force {`MCU0.fbdic__inv_fbdic_rt_lat0_7_,`MCU0.fbdic__inv_fbdic_rt_lat0_6_,`MCU0.fbdic__inv_fbdic_rt_lat0_5_,`MCU0.fbdic__inv_fbdic_rt_lat0_4_,`MCU0.fbdic__inv_fbdic_rt_lat0_3_,`MCU0.fbdic__inv_fbdic_rt_lat0_2_,`MCU0.fbdic__inv_fbdic_rt_lat0_1_,`MCU0.fbdic__inv_fbdic_rt_lat0_0_} = chnl_read_latency_gate;
    force {`MCU1.fbdic__inv_fbdic_rt_lat0_7_,`MCU1.fbdic__inv_fbdic_rt_lat0_6_,`MCU1.fbdic__inv_fbdic_rt_lat0_5_,`MCU1.fbdic__inv_fbdic_rt_lat0_4_,`MCU1.fbdic__inv_fbdic_rt_lat0_3_,`MCU1.fbdic__inv_fbdic_rt_lat0_2_,`MCU1.fbdic__inv_fbdic_rt_lat0_1_,`MCU1.fbdic__inv_fbdic_rt_lat0_0_} = chnl_read_latency_gate;
    force {`MCU2.fbdic__inv_fbdic_rt_lat0_7_,`MCU2.fbdic__inv_fbdic_rt_lat0_6_,`MCU2.fbdic__inv_fbdic_rt_lat0_5_,`MCU2.fbdic__inv_fbdic_rt_lat0_4_,`MCU2.fbdic__inv_fbdic_rt_lat0_3_,`MCU2.fbdic__inv_fbdic_rt_lat0_2_,`MCU2.fbdic__inv_fbdic_rt_lat0_1_,`MCU2.fbdic__inv_fbdic_rt_lat0_0_} = chnl_read_latency_gate;
    force {`MCU3.fbdic__inv_fbdic_rt_lat0_7_,`MCU3.fbdic__inv_fbdic_rt_lat0_6_,`MCU3.fbdic__inv_fbdic_rt_lat0_5_,`MCU3.fbdic__inv_fbdic_rt_lat0_4_,`MCU3.fbdic__inv_fbdic_rt_lat0_3_,`MCU3.fbdic__inv_fbdic_rt_lat0_2_,`MCU3.fbdic__inv_fbdic_rt_lat0_1_,`MCU3.fbdic__inv_fbdic_rt_lat0_0_} = chnl_read_latency_gate;

    force {`MCU0.fbdic__inv_fbdic_rt_lat1_7_,`MCU0.fbdic__inv_fbdic_rt_lat1_6_,`MCU0.fbdic__inv_fbdic_rt_lat1_5_,`MCU0.fbdic__inv_fbdic_rt_lat1_4_,`MCU0.fbdic__inv_fbdic_rt_lat1_3_,`MCU0.fbdic__inv_fbdic_rt_lat1_2_,`MCU0.fbdic__inv_fbdic_rt_lat1_1_,`MCU0.fbdic__inv_fbdic_rt_lat1_0_} = chnl_read_latency_gate;
    force {`MCU1.fbdic__inv_fbdic_rt_lat1_7_,`MCU1.fbdic__inv_fbdic_rt_lat1_6_,`MCU1.fbdic__inv_fbdic_rt_lat1_5_,`MCU1.fbdic__inv_fbdic_rt_lat1_4_,`MCU1.fbdic__inv_fbdic_rt_lat1_3_,`MCU1.fbdic__inv_fbdic_rt_lat1_2_,`MCU1.fbdic__inv_fbdic_rt_lat1_1_,`MCU1.fbdic__inv_fbdic_rt_lat1_0_} = chnl_read_latency_gate;
    force {`MCU2.fbdic__inv_fbdic_rt_lat1_7_,`MCU2.fbdic__inv_fbdic_rt_lat1_6_,`MCU2.fbdic__inv_fbdic_rt_lat1_5_,`MCU2.fbdic__inv_fbdic_rt_lat1_4_,`MCU2.fbdic__inv_fbdic_rt_lat1_3_,`MCU2.fbdic__inv_fbdic_rt_lat1_2_,`MCU2.fbdic__inv_fbdic_rt_lat1_1_,`MCU2.fbdic__inv_fbdic_rt_lat1_0_} = chnl_read_latency_gate;
    force {`MCU3.fbdic__inv_fbdic_rt_lat1_7_,`MCU3.fbdic__inv_fbdic_rt_lat1_6_,`MCU3.fbdic__inv_fbdic_rt_lat1_5_,`MCU3.fbdic__inv_fbdic_rt_lat1_4_,`MCU3.fbdic__inv_fbdic_rt_lat1_3_,`MCU3.fbdic__inv_fbdic_rt_lat1_2_,`MCU3.fbdic__inv_fbdic_rt_lat1_1_,`MCU3.fbdic__inv_fbdic_rt_lat1_0_} = chnl_read_latency_gate;

    // --- Set Half Baud Rate in TI FSR ---

    force {`MCU0.fbdic__n15679,`MCU0.fbdic__n15680} = 2'b1;
    force {`MCU1.fbdic__n15679,`MCU1.fbdic__n15680} = 2'b1;
    force {`MCU2.fbdic__n15679,`MCU2.fbdic__n15680} = 2'b1;
    force {`MCU3.fbdic__n15679,`MCU3.fbdic__n15680} = 2'b1;
`else
    // --- Set Channel Read latency in DTM mode  ---

    force `MCU0.fbdic.fbdic_rt_lat0 = chnl_read_latency;
    force `MCU1.fbdic.fbdic_rt_lat0 = chnl_read_latency;
    force `MCU2.fbdic.fbdic_rt_lat0 = chnl_read_latency;
    force `MCU3.fbdic.fbdic_rt_lat0 = chnl_read_latency;
     
    force `MCU0.fbdic.fbdic_rt_lat1 = chnl_read_latency;
    force `MCU1.fbdic.fbdic_rt_lat1 = chnl_read_latency;
    force `MCU2.fbdic.fbdic_rt_lat1 = chnl_read_latency;
    force `MCU3.fbdic.fbdic_rt_lat1 = chnl_read_latency;
    
    // --- Set Half Baud Rate in TI FSR ---

    force `MCU0.fbdic.fbdic_sds_config[29:28] = 2'b1;
    force `MCU1.fbdic.fbdic_sds_config[29:28] = 2'b1;
    force `MCU2.fbdic.fbdic_sds_config[29:28] = 2'b1;
    force `MCU3.fbdic.fbdic_sds_config[29:28] = 2'b1;
`endif // mcu_gate
  end
`endif // ifndef AXIS
end


// ----- RANDOM_PARAM: Randomizing skew -----

reg [9:0] random_deskew;
reg [1:0] random_deskew_ch;  // randomize the skew on channels

initial
begin
`ifdef PALLADIUM
`else
#1;
`endif

    `ifndef NB_BITLANE_DESKEW
        if($test$plusargs("RANDOM_PARAM"))
            `PR_ALWAYS("mcu_mem_config", `ALWAYS, "WARNING: Using RANDOM_PARAM +arg without building the model for NB_BITLANE_DESKEW ");
    `endif

    `ifdef NB_BITLANE_DESKEW

        if($test$plusargs("RANDOM_PARAM"))
        begin

            // --- Added code for randomizing one of the channels for the skew
            random_deskew_ch = ({$random(`PARGS.seed)} % 4);
            if (random_deskew_ch==0)
              random_deskew_ch = 1;
            `PR_ALWAYS("mcu_mem_config", `ALWAYS, "*** RANDOM_DESKEW_CH ***: random_deskew_ch = 0x%x", random_deskew_ch);

            random_deskew = ({$random(`PARGS.seed)} % 60);
            `PR_ALWAYS("mcu_mem_config", `ALWAYS, "*** RANDOM_PARAM ***: pn0_deskew = 0x%x", random_deskew);

            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_n.pn0_deskew = random_deskew; 
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_p.pn0_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_n.pn0_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_p.pn0_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_n.pn0_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_p.pn0_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_n.pn0_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_p.pn0_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_n.pn0_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_p.pn0_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_n.pn0_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_p.pn0_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_n.pn0_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_p.pn0_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_n.pn0_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_p.pn0_deskew = random_deskew;
            end

            random_deskew = ({$random(`PARGS.seed)} % 60);
            `PR_ALWAYS("mcu_mem_config", `ALWAYS, "*** RANDOM_PARAM ***: pn1_deskew = 0x%x", random_deskew);

            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_n.pn1_deskew = random_deskew; 
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_p.pn1_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_n.pn1_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_p.pn1_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_n.pn1_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_p.pn1_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_n.pn1_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_p.pn1_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_n.pn1_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_p.pn1_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_n.pn1_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_p.pn1_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_n.pn1_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_p.pn1_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_n.pn1_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_p.pn1_deskew = random_deskew;
            end

            random_deskew = ({$random(`PARGS.seed)} % 60);
            `PR_ALWAYS("mcu_mem_config", `ALWAYS, "*** RANDOM_PARAM ***: pn2_deskew = 0x%x", random_deskew);

            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_n.pn2_deskew = random_deskew; 
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_p.pn2_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_n.pn2_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_p.pn2_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_n.pn2_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_p.pn2_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_n.pn2_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_p.pn2_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_n.pn2_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_p.pn2_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_n.pn2_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_p.pn2_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_n.pn2_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_p.pn2_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_n.pn2_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_p.pn2_deskew = random_deskew;
            end

            random_deskew = ({$random(`PARGS.seed)} % 60);
            `PR_ALWAYS("mcu_mem_config", `ALWAYS, "*** RANDOM_PARAM ***: pn3_deskew = 0x%x", random_deskew);

            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_n.pn3_deskew = random_deskew; 
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_p.pn3_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_n.pn3_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_p.pn3_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_n.pn3_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_p.pn3_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_n.pn3_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_p.pn3_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_n.pn3_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_p.pn3_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_n.pn3_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_p.pn3_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_n.pn3_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_p.pn3_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_n.pn3_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_p.pn3_deskew = random_deskew;
            end

            random_deskew = ({$random(`PARGS.seed)} % 60);
            `PR_ALWAYS("mcu_mem_config", `ALWAYS, "*** RANDOM_PARAM ***: pn4_deskew = 0x%x", random_deskew);

            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_n.pn4_deskew = random_deskew; 
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_p.pn4_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_n.pn4_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_p.pn4_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_n.pn4_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_p.pn4_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_n.pn4_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_p.pn4_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_n.pn4_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_p.pn4_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_n.pn4_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_p.pn4_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_n.pn4_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_p.pn4_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_n.pn4_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_p.pn4_deskew = random_deskew;
            end

            random_deskew = ({$random(`PARGS.seed)} % 60);
            `PR_ALWAYS("mcu_mem_config", `ALWAYS, "*** RANDOM_PARAM ***: pn5_deskew = 0x%x", random_deskew);

            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_n.pn5_deskew = random_deskew; 
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_p.pn5_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_n.pn5_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_p.pn5_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_n.pn5_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_p.pn5_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_n.pn5_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_p.pn5_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_n.pn5_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_p.pn5_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_n.pn5_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_p.pn5_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_n.pn5_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_p.pn5_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_n.pn5_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_p.pn5_deskew = random_deskew;
            end

            random_deskew = ({$random(`PARGS.seed)} % 60);
            `PR_ALWAYS("mcu_mem_config", `ALWAYS, "*** RANDOM_PARAM ***: pn6_deskew = 0x%x", random_deskew);

            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_n.pn6_deskew = random_deskew; 
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_p.pn6_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_n.pn6_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_p.pn6_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_n.pn6_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_p.pn6_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_n.pn6_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_p.pn6_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_n.pn6_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_p.pn6_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_n.pn6_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_p.pn6_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_n.pn6_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_p.pn6_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_n.pn6_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_p.pn6_deskew = random_deskew;
            end

            random_deskew = ({$random(`PARGS.seed)} % 60);
            `PR_ALWAYS("mcu_mem_config", `ALWAYS, "*** RANDOM_PARAM ***: pn7_deskew = 0x%x", random_deskew);

            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_n.pn7_deskew = random_deskew; 
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_p.pn7_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_n.pn7_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_p.pn7_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_n.pn7_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_p.pn7_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_n.pn7_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_p.pn7_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_n.pn7_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_p.pn7_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_n.pn7_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_p.pn7_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_n.pn7_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_p.pn7_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_n.pn7_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_p.pn7_deskew = random_deskew;
            end

            random_deskew = ({$random(`PARGS.seed)} % 60);
            `PR_ALWAYS("mcu_mem_config", `ALWAYS, "*** RANDOM_PARAM ***: pn8_deskew = 0x%x", random_deskew);

            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_n.pn8_deskew = random_deskew; 
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_p.pn8_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_n.pn8_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_p.pn8_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_n.pn8_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_p.pn8_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_n.pn8_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_p.pn8_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_n.pn8_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_p.pn8_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_n.pn8_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_p.pn8_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_n.pn8_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_p.pn8_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_n.pn8_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_p.pn8_deskew = random_deskew;
            end

            random_deskew = ({$random(`PARGS.seed)} % 60);
            `PR_ALWAYS("mcu_mem_config", `ALWAYS, "*** RANDOM_PARAM ***: pn9_deskew = 0x%x", random_deskew);

            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_n.pn9_deskew = random_deskew; 
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_p.pn9_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_n.pn9_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_p.pn9_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_n.pn9_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_p.pn9_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_n.pn9_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_p.pn9_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_n.pn9_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_p.pn9_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_n.pn9_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_p.pn9_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_n.pn9_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_p.pn9_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_n.pn9_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_p.pn9_deskew = random_deskew;
            end

            random_deskew = ({$random(`PARGS.seed)} % 60);
            `PR_ALWAYS("mcu_mem_config", `ALWAYS, "*** RANDOM_PARAM ***: pn10_deskew = 0x%x", random_deskew);

            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_n.pn10_deskew = random_deskew; 
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_p.pn10_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_n.pn10_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_p.pn10_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_n.pn10_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_p.pn10_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_n.pn10_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_p.pn10_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_n.pn10_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_p.pn10_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_n.pn10_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_p.pn10_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_n.pn10_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_p.pn10_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_n.pn10_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_p.pn10_deskew = random_deskew;
            end

            random_deskew = ({$random(`PARGS.seed)} % 60);
            `PR_ALWAYS("mcu_mem_config", `ALWAYS, "*** RANDOM_PARAM ***: pn11_deskew = 0x%x", random_deskew);

            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_n.pn11_deskew = random_deskew; 
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_p.pn11_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_n.pn11_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_p.pn11_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_n.pn11_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_p.pn11_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_n.pn11_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_p.pn11_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_n.pn11_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_p.pn11_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_n.pn11_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_p.pn11_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_n.pn11_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_p.pn11_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_n.pn11_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_p.pn11_deskew = random_deskew;
            end

            random_deskew = ({$random(`PARGS.seed)} % 60);
            `PR_ALWAYS("mcu_mem_config", `ALWAYS, "*** RANDOM_PARAM ***: pn12_deskew = 0x%x", random_deskew);

            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_n.pn12_deskew = random_deskew; 
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_p.pn12_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_n.pn12_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_p.pn12_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_n.pn12_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_p.pn12_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_n.pn12_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_p.pn12_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_n.pn12_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_p.pn12_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_n.pn12_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_p.pn12_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_n.pn12_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_p.pn12_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_n.pn12_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_p.pn12_deskew = random_deskew;
            end

            random_deskew = ({$random(`PARGS.seed)} % 60);
            `PR_ALWAYS("mcu_mem_config", `ALWAYS, "*** RANDOM_PARAM ***: pn13_deskew = 0x%x", random_deskew);

            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_n.pn13_deskew = random_deskew; 
              tb_top.nb_bitlane_deskew.nb_bitdskw0a_p.pn13_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_n.pn13_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw0b_p.pn13_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_n.pn13_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1a_p.pn13_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_n.pn13_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw1b_p.pn13_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_n.pn13_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2a_p.pn13_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_n.pn13_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw2b_p.pn13_deskew = random_deskew;
            end
            if (random_deskew_ch[0]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_n.pn13_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3a_p.pn13_deskew = random_deskew;
            end
            if (random_deskew_ch[1]) begin
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_n.pn13_deskew = random_deskew;
              tb_top.nb_bitlane_deskew.nb_bitdskw3b_p.pn13_deskew = random_deskew;
            end

        end
    `endif
end

`ifndef AXIS
// ----- Random scrub start addr -----
reg [39:0] scrub_addr;
reg [1:0]  dimm_adjust;
reg [4:0]  rank_adjust;
reg        channel_adjust;
reg        side_adjust;
reg [1:0]  size_adjust;

reg [2:0] dimm_num;


initial
begin

    if     ($test$plusargs("2_FBDIMMS")) begin 
        dimm_adjust = 2'h2;
        dimm_num = $random(`PARGS.seed) & 1;
    end
    else if($test$plusargs("4_FBDIMMS")) begin
        dimm_adjust = 2'h1;
        dimm_num = $random(`PARGS.seed) % 4;
    end
    else if($test$plusargs("8_FBDIMMS")) begin
        dimm_adjust = 2'h0;
        dimm_num = $random(`PARGS.seed) % 8;
    end
    else begin
        dimm_adjust = 2'h3; // default 1_FBDIMM
        dimm_num = 0;
    end

    if($test$plusargs("SNG_CHANNEL")) channel_adjust = 1'h1;
    else                              channel_adjust = 1'h0; // default DUAL_CHANNEL

    if($test$plusargs("STACK_DIMM")) side_adjust = 1'h0;
    else                             side_adjust = 1'h1; // default RANK_DIMM

    if     ($test$plusargs("DIMM_SIZE_256")) size_adjust = 2'h3;
    else if($test$plusargs("DIMM_SIZE_512")) size_adjust = 2'h2;
    else if($test$plusargs("DIMM_SIZE_1G"))  size_adjust = 2'h1;
    else                                     size_adjust = 2'h0; // default DIMM_SIZE_2G


    if($test$plusargs("RANK_LOW")) rank_adjust = 5'h18 - size_adjust - channel_adjust;
    else                           rank_adjust = 0;

    scrub_addr = (40'hffffffffff >> (1 + dimm_adjust + channel_adjust + side_adjust + size_adjust + rank_adjust));
   `PR_ALWAYS("mcu_mem_config", `ALWAYS, "***** SCRUB INITIAL ADDR ***** : %0x", scrub_addr);
    scrub_addr = scrub_addr >> dimm_num;
   `PR_ALWAYS("mcu_mem_config", `ALWAYS, "***** SCRUB INITIAL ADDR ***** : %0x, %0x", scrub_addr, dimm_num);
end

`ifdef MCU_GATE
always @(posedge `MCU0.drif__drif_data_scrub_enabled)
`else
always @(posedge `MCU0.drif.drif_data_scrub_enabled)
`endif // mcu_gate
begin

    if($test$plusargs("RANDOM_ENV")) begin
`ifdef MCU_GATE
        force `MCU0.drif_scrub_addr[31:0] = scrub_addr[39:9];
        force `MCU1.drif_scrub_addr[31:0] = scrub_addr[39:9];
        force `MCU2.drif_scrub_addr[31:0] = scrub_addr[39:9];
        force `MCU3.drif_scrub_addr[31:0] = scrub_addr[39:9];
        @(posedge `MCU0.drl2clk);
        release `MCU0.drif_scrub_addr[31:0];
        release `MCU1.drif_scrub_addr[31:0];
        release `MCU2.drif_scrub_addr[31:0];
        release `MCU3.drif_scrub_addr[31:0];
`else
        force `MCU0.drif.drif_scrub_addr[31:0] = scrub_addr[39:9];
        force `MCU1.drif.drif_scrub_addr[31:0] = scrub_addr[39:9];
        force `MCU2.drif.drif_scrub_addr[31:0] = scrub_addr[39:9];
        force `MCU3.drif.drif_scrub_addr[31:0] = scrub_addr[39:9];
        @(posedge `MCU0.drl2clk);
        release `MCU0.drif.drif_scrub_addr[31:0];
        release `MCU1.drif.drif_scrub_addr[31:0];
        release `MCU2.drif.drif_scrub_addr[31:0];
        release `MCU3.drif.drif_scrub_addr[31:0];
`endif // mcu_gate
    end
end
`endif //  `ifndef AXIS

//---------------------------------------------
// Added random NB stuck at faults
//---------------------------------------------

integer auto_fail_stuck_delay_rand;
integer auto_fail_stuck_delay;
integer local_tg_seed;

`ifdef IDT_FBDIMM
initial
begin // {
    if ($test$plusargs("NB_LANE_FAILOVER_0"))
    begin // {
	if($value$plusargs("tg_seed=%d",local_tg_seed))
	begin
	    $display("tg_seed value is=%d\n",local_tg_seed);
	    auto_fail_stuck_delay_rand = $random(local_tg_seed);
	    auto_fail_stuck_delay = (auto_fail_stuck_delay_rand % 500 + auto_fail_stuck_delay_rand % 1800 ) ;
	    while(~((auto_fail_stuck_delay<2400) && (auto_fail_stuck_delay>999)) )
	    begin
		auto_fail_stuck_delay_rand = $random(local_tg_seed);
		auto_fail_stuck_delay = (auto_fail_stuck_delay_rand % 500 + auto_fail_stuck_delay_rand % 1800 ) ;
	    end
	end
	$display("NB lane 0 failover after delaytime=%d\n",auto_fail_stuck_delay);
	repeat (auto_fail_stuck_delay) @ (posedge `DRIF_PATH0.drl2clk);

	if ($test$plusargs("NB_LANE_CH0_0")) begin // {
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXP[0] = 1'b1;
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXN[0] = 1'b1;
	    $display("NB auto lane failover in channel 0, lane 0\n"); end // }
	if ($test$plusargs("NB_LANE_CH0_1")) begin // {
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXP[1] = 1'b1;
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXN[1] = 1'b1;
	    $display("NB auto lane failover in channel 0, lane 1\n"); end // }
	if ($test$plusargs("NB_LANE_CH0_2")) begin // {
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXP[2] = 1'b1;
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXN[2] = 1'b1;
	    $display("NB auto lane failover in channel 0, lane 2\n"); end // }
	if ($test$plusargs("NB_LANE_CH0_3")) begin // {
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXP[3] = 1'b1;
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXN[3] = 1'b1;
	    $display("NB auto lane failover in channel 0, lane 3\n"); end // }
	if ($test$plusargs("NB_LANE_CH0_4")) begin // {
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXP[4] = 1'b1;
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXN[4] = 1'b1;
	    $display("NB auto lane failover in channel 0, lane 4\n"); end // }
	if ($test$plusargs("NB_LANE_CH0_5")) begin // {
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXP[5] = 1'b1;
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXN[5] = 1'b1;
	    $display("NB auto lane failover in channel 0, lane 5\n"); end // }
	if ($test$plusargs("NB_LANE_CH0_6")) begin // {
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXP[6] = 1'b1;
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXN[6] = 1'b1;
	    $display("NB auto lane failover in channel 0, lane 6\n"); end // }
	if ($test$plusargs("NB_LANE_CH0_7")) begin // {
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXP[7] = 1'b1;
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXN[7] = 1'b1;
	    $display("NB auto lane failover in channel 0, lane 7\n"); end // }
	if ($test$plusargs("NB_LANE_CH0_8")) begin // {
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXP[8] = 1'b1;
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXN[8] = 1'b1;
	    $display("NB auto lane failover in channel 0, lane 8\n"); end // }
	if ($test$plusargs("NB_LANE_CH0_9")) begin // {
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXP[9] = 1'b1;
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXN[9] = 1'b1;
	    $display("NB auto lane failover in channel 0, lane 9\n"); end // }
	if ($test$plusargs("NB_LANE_CH0_a")) begin // {
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXP[10] = 1'b1;
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXN[10] = 1'b1;
	    $display("NB auto lane failover in channel 0, lane 10\n"); end // }
	if ($test$plusargs("NB_LANE_CH0_b")) begin // {
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXP[11] = 1'b1;
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXN[11] = 1'b1;
	    $display("NB auto lane failover in channel 0, lane 11\n"); end // }
	if ($test$plusargs("NB_LANE_CH0_c")) begin // {
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXP[12] = 1'b1;
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXN[12] = 1'b1;
	    $display("NB auto lane failover in channel 0, lane 12\n"); end // }
	if ($test$plusargs("NB_LANE_CH0_d")) begin // {
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXP[13] = 1'b1;
	    force `TOP_MOD.mcusat_fbdimm.fbdimm_mem0.fbdimm0.NBTXN[13] = 1'b1;
	    $display("NB auto lane failover in channel 0, lane 13\n"); end // }
	end // }
end // }

`ifndef SNG_CHANNEL
initial
begin // {
 
	if ($test$plusargs("NB_LANE_FAILOVER_1"))
	begin // {
	if($value$plusargs("tg_seed=%d",local_tg_seed))
	begin
	$display("tg_seed value is=%d\n",local_tg_seed);
	auto_fail_stuck_delay_rand = $random(local_tg_seed);
	auto_fail_stuck_delay = (auto_fail_stuck_delay_rand % 500 + auto_fail_stuck_delay_rand % 1800 ) ;
	while(~((auto_fail_stuck_delay<2400) && (auto_fail_stuck_delay>999)) )
	begin
		auto_fail_stuck_delay_rand = $random(local_tg_seed);
		auto_fail_stuck_delay = (auto_fail_stuck_delay_rand % 500 + auto_fail_stuck_delay_rand % 1800 ) ;
	end
	end
	$display("NB lane 1 failover after delaytime=%d\n",auto_fail_stuck_delay);
	repeat (auto_fail_stuck_delay) @ (posedge `DRIF_PATH0.drl2clk);

	if ($test$plusargs("NB_LANE_CH1_0")) begin // {
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXP[0] = 1'b1;
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXN[0] = 1'b1;
	  $display("NB auto lane failover in channel 1, lane 0\n");  end // }
	if ($test$plusargs("NB_LANE_CH1_1")) begin // {
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXP[1] = 1'b1;
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXN[1] = 1'b1;
	  $display("NB auto lane failover in channel 1, lane 1\n");  end // }
	if ($test$plusargs("NB_LANE_CH1_2")) begin // {
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXP[2] = 1'b1;
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXN[2] = 1'b1;
	  $display("NB auto lane failover in channel 1, lane 2\n");  end // }
	if ($test$plusargs("NB_LANE_CH1_3")) begin // {
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXP[3] = 1'b1;
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXN[3] = 1'b1;
	  $display("NB auto lane failover in channel 1, lane 3\n");  end // }
	if ($test$plusargs("NB_LANE_CH1_4")) begin // {
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXP[4] = 1'b1;
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXN[4] = 1'b1;
	  $display("NB auto lane failover in channel 1, lane 4\n");  end // }
	if ($test$plusargs("NB_LANE_CH1_5")) begin // {
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXP[5] = 1'b1;
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXN[5] = 1'b1;
	  $display("NB auto lane failover in channel 1, lane 5\n");  end // }
	if ($test$plusargs("NB_LANE_CH1_6")) begin // {
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXP[6] = 1'b1;
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXN[6] = 1'b1;
	  $display("NB auto lane failover in channel 1, lane 6\n");  end // }
	if ($test$plusargs("NB_LANE_CH1_7")) begin // {
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXP[7] = 1'b1;
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXN[7] = 1'b1;
	  $display("NB auto lane failover in channel 1, lane 7\n");  end // }
	if ($test$plusargs("NB_LANE_CH1_8")) begin // {
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXP[8] = 1'b1;
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXN[8] = 1'b1;
	  $display("NB auto lane failover in channel 1, lane 8\n");  end // }
	if ($test$plusargs("NB_LANE_CH1_9")) begin // {
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXP[9] = 1'b1;
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXN[9] = 1'b1;
	  $display("NB auto lane failover in channel 1, lane 9\n");  end // }
	if ($test$plusargs("NB_LANE_CH1_a")) begin // {
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXP[10] = 1'b1;
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXN[10] = 1'b1;
	  $display("NB auto lane failover in channel 1, lane 10\n");	end // }
	if ($test$plusargs("NB_LANE_CH1_b")) begin // {
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXP[11] = 1'b1;
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXN[11] = 1'b1;
	  $display("NB auto lane failover in channel 1, lane 11\n");	end // }
	if ($test$plusargs("NB_LANE_CH1_c")) begin // {
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXP[12] = 1'b1;
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXN[12] = 1'b1;
	  $display("NB auto lane failover in channel 1, lane 12\n");	end // }
	if ($test$plusargs("NB_LANE_CH1_d")) begin // {
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXP[13] = 1'b1;
	  force `TOP_MOD.mcusat_fbdimm.fbdimm_mem1.fbdimm0.NBTXN[13] = 1'b1;
	  $display("NB auto lane failover in channel 1, lane 13\n");	end // }
	end // }
end // }
`endif // SNG_CHANNEL
`endif // IDT_FBDIMM


///////////////////////////////////////////////////////////////////////////////
//
//  Detect stupid build arg vs run-arg errors, and fail with a meaningful msg.
//
///////////////////////////////////////////////////////////////////////////////
initial
begin // {

`ifdef FBDIMM_NUM_1
    if ($test$plusargs("2_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 1 FBDIMM, but the 2_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("3_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 1 FBDIMM, but the 3_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("4_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 1 FBDIMM, but the 4_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("5_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 1 FBDIMM, but the 5_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("6_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 1 FBDIMM, but the 6_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("7_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 1 FBDIMM, but the 7_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("8_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 1 FBDIMM, but the 8_FBDIMMS plusarg was specified.");
`else
 `ifdef FBDIMM_NUM_2
    if ($test$plusargs("3_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 2 FBDIMM, but the 3_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("4_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 2 FBDIMM, but the 4_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("5_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 2 FBDIMM, but the 5_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("6_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 2 FBDIMM, but the 6_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("7_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 2 FBDIMM, but the 7_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("8_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 2 FBDIMM, but the 8_FBDIMMS plusarg was specified.");
 `else
 `ifdef FBDIMM_NUM_3
    if ($test$plusargs("4_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 3 FBDIMM, but the 4_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("5_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 3 FBDIMM, but the 5_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("6_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 3 FBDIMM, but the 6_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("7_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 3 FBDIMM, but the 7_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("8_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 3 FBDIMM, but the 8_FBDIMMS plusarg was specified.");
 `else
  `ifdef FBDIMM_NUM_4
    if ($test$plusargs("5_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 4 FBDIMM, but the 5_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("6_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 4 FBDIMM, but the 6_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("7_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 4 FBDIMM, but the 7_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("8_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 4 FBDIMM, but the 8_FBDIMMS plusarg was specified.");
  `else
   `ifdef FBDIMM_NUM_5
    if ($test$plusargs("6_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 5 FBDIMM, but the 6_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("7_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 5 FBDIMM, but the 7_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("8_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 5 FBDIMM, but the 8_FBDIMMS plusarg was specified.");
   `else
    `ifdef FBDIMM_NUM_6
    if ($test$plusargs("7_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 6 FBDIMM, but the 7_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("8_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 6 FBDIMM, but the 8_FBDIMMS plusarg was specified.");
    `else
     `ifdef FBDIMM_NUM_7
    if ($test$plusargs("8_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 7 FBDIMM, but the 8_FBDIMMS plusarg was specified.");
     `else
      `ifdef FBDIMM_NUM_8
      // there are no build vs run-arg problems with FBDIMM_NUM_8
      `else
      // if a specific # of fbdimms is not specified, it defaults to 1
    if ($test$plusargs("2_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 1 FBDIMM, but the 2_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("3_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 1 FBDIMM, but the 3_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("4_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 1 FBDIMM, but the 4_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("5_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 1 FBDIMM, but the 5_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("6_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 1 FBDIMM, but the 6_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("7_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 1 FBDIMM, but the 7_FBDIMMS plusarg was specified.");
    else if ($test$plusargs("8_FBDIMMS"))
      `PR_ERROR("mcu_mem_config", `ERROR, "The model was only built with 1 FBDIMM, but the 8_FBDIMMS plusarg was specified.");
      `endif
     `endif
    `endif
   `endif
  `endif
 `endif
 `endif
`endif
   
end // }

endmodule
