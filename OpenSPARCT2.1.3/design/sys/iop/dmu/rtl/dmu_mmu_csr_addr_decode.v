// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_csr_addr_decode.v
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
module dmu_mmu_csr_addr_decode 
	(
	clk,
	rst_l,
	daemon_csrbus_valid,
	daemon_csrbus_addr,
	csrbus_src_bus,
	daemon_csrbus_wr,
	daemon_csrbus_wr_out,
	daemon_csrbus_wr_data,
	daemon_csrbus_wr_data_out,
	daemon_csrbus_mapped,
	csrbus_acc_vio,
	daemon_transaction_in_progress,
	instance_id,
	daemon_csrbus_done,
	stage_mux_only_ext_done_0_out,
	ctl_select_pulse,
	tsb_select_pulse,
	fsh_select_pulse,
	inv_select,
	log_select_pulse,
	int_en_select_pulse,
	en_err_select,
	err_select_pulse,
	err_rw1c_alias,
	err_rw1s_alias,
	flta_select_pulse,
	flts_select_pulse,
	prfc_select_pulse,
	prf0_select_pulse,
	prf1_select_pulse,
	vtb_select,
	vtb_hw_acc_jtag_rd,
	vtb_hw_acc_jtag_wr,
	vtb_hw_acc_pio_slow_rd,
	vtb_hw_acc_pio_slow_wr,
	vtb_hw_acc_pio_med_rd,
	vtb_hw_acc_pio_med_wr,
	vtb_hw_acc_pio_fast_rd,
	vtb_hw_acc_pio_fast_wr,
	ptb_select,
	ptb_hw_acc_jtag_rd,
	ptb_hw_acc_jtag_wr,
	ptb_hw_acc_pio_slow_rd,
	ptb_hw_acc_pio_slow_wr,
	ptb_hw_acc_pio_med_rd,
	ptb_hw_acc_pio_med_wr,
	ptb_hw_acc_pio_fast_rd,
	ptb_hw_acc_pio_fast_wr,
	tdb_select,
	tdb_hw_acc_jtag_rd,
	tdb_hw_acc_jtag_wr,
	tdb_hw_acc_pio_slow_rd,
	tdb_hw_acc_pio_slow_wr,
	tdb_hw_acc_pio_med_rd,
	tdb_hw_acc_pio_med_wr,
	tdb_hw_acc_pio_fast_rd,
	tdb_hw_acc_pio_fast_wr,
	dev2iotsb_select,
	dev2iotsb_hw_acc_jtag_rd,
	dev2iotsb_hw_acc_jtag_wr,
	dev2iotsb_hw_acc_pio_slow_rd,
	dev2iotsb_hw_acc_pio_slow_wr,
	dev2iotsb_hw_acc_pio_med_rd,
	dev2iotsb_hw_acc_pio_med_wr,
	dev2iotsb_hw_acc_pio_fast_rd,
	dev2iotsb_hw_acc_pio_fast_wr,
	IotsbDesc_select,
	IotsbDesc_hw_acc_jtag_rd,
	IotsbDesc_hw_acc_jtag_wr,
	IotsbDesc_hw_acc_pio_slow_rd,
	IotsbDesc_hw_acc_pio_slow_wr,
	IotsbDesc_hw_acc_pio_med_rd,
	IotsbDesc_hw_acc_pio_med_wr,
	IotsbDesc_hw_acc_pio_fast_rd,
	IotsbDesc_hw_acc_pio_fast_wr
	);

//====================================================================
//     Polarity declarations
//====================================================================
input  clk;  // Clock signal
input  rst_l;  // Reset
input  daemon_csrbus_valid;  // Daemon_Valid
input  [`FIRE_CSRBUS_ADDR_WIDTH - 1:0] daemon_csrbus_addr;  // Daemon_Addr
input  [1:0] csrbus_src_bus;  // Source bus
input  daemon_csrbus_wr;  // Read/Write signal
output daemon_csrbus_wr_out;  // Read/Write signal
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data;  // Write data
output [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_out;  // Write data
output daemon_csrbus_mapped;  // mapped
output csrbus_acc_vio;  // acc_vio
input  daemon_transaction_in_progress;  // daemon_transaction_in_progress
input  instance_id;  // Instance ID
output daemon_csrbus_done;  // Operation is done
input  stage_mux_only_ext_done_0_out;  // Operation is done
output ctl_select_pulse;  // select signal
output tsb_select_pulse;  // select signal
output fsh_select_pulse;  // select signal
output inv_select;  // select signal
output log_select_pulse;  // select signal
output int_en_select_pulse;  // select signal
output en_err_select;  // select signal
output err_select_pulse;  // select signal
output err_rw1c_alias;  // alias signal
output err_rw1s_alias;  // alias signal
output flta_select_pulse;  // select signal
output flts_select_pulse;  // select signal
output prfc_select_pulse;  // select signal
output prf0_select_pulse;  // select signal
output prf1_select_pulse;  // select signal
output vtb_select;  // select signal
input  vtb_hw_acc_jtag_rd;  // This signal enables reading of register vtb by
                            // jtag.
input  vtb_hw_acc_jtag_wr;  // This signal enables writing of register vtb by
                            // jtag.
input  vtb_hw_acc_pio_slow_rd;  // This signal enables reading of register vtb
                                // by pio_slow.
input  vtb_hw_acc_pio_slow_wr;  // This signal enables writing of register vtb
                                // by pio_slow.
input  vtb_hw_acc_pio_med_rd;  // This signal enables reading of register vtb by
                               // pio_med.
input  vtb_hw_acc_pio_med_wr;  // This signal enables writing of register vtb by
                               // pio_med.
input  vtb_hw_acc_pio_fast_rd;  // This signal enables reading of register vtb
                                // by pio_fast.
input  vtb_hw_acc_pio_fast_wr;  // This signal enables writing of register vtb
                                // by pio_fast.
output ptb_select;  // select signal
input  ptb_hw_acc_jtag_rd;  // This signal enables reading of register ptb by
                            // jtag.
input  ptb_hw_acc_jtag_wr;  // This signal enables writing of register ptb by
                            // jtag.
input  ptb_hw_acc_pio_slow_rd;  // This signal enables reading of register ptb
                                // by pio_slow.
input  ptb_hw_acc_pio_slow_wr;  // This signal enables writing of register ptb
                                // by pio_slow.
input  ptb_hw_acc_pio_med_rd;  // This signal enables reading of register ptb by
                               // pio_med.
input  ptb_hw_acc_pio_med_wr;  // This signal enables writing of register ptb by
                               // pio_med.
input  ptb_hw_acc_pio_fast_rd;  // This signal enables reading of register ptb
                                // by pio_fast.
input  ptb_hw_acc_pio_fast_wr;  // This signal enables writing of register ptb
                                // by pio_fast.
output tdb_select;  // select signal
input  tdb_hw_acc_jtag_rd;  // This signal enables reading of register tdb by
                            // jtag.
input  tdb_hw_acc_jtag_wr;  // This signal enables writing of register tdb by
                            // jtag.
input  tdb_hw_acc_pio_slow_rd;  // This signal enables reading of register tdb
                                // by pio_slow.
input  tdb_hw_acc_pio_slow_wr;  // This signal enables writing of register tdb
                                // by pio_slow.
input  tdb_hw_acc_pio_med_rd;  // This signal enables reading of register tdb by
                               // pio_med.
input  tdb_hw_acc_pio_med_wr;  // This signal enables writing of register tdb by
                               // pio_med.
input  tdb_hw_acc_pio_fast_rd;  // This signal enables reading of register tdb
                                // by pio_fast.
input  tdb_hw_acc_pio_fast_wr;  // This signal enables writing of register tdb
                                // by pio_fast.
output dev2iotsb_select;  // select signal
input  dev2iotsb_hw_acc_jtag_rd;  // This signal enables reading of register
                                  // dev2iotsb by jtag.
input  dev2iotsb_hw_acc_jtag_wr;  // This signal enables writing of register
                                  // dev2iotsb by jtag.
input  dev2iotsb_hw_acc_pio_slow_rd;  // This signal enables reading of register
                                      // dev2iotsb by pio_slow.
input  dev2iotsb_hw_acc_pio_slow_wr;  // This signal enables writing of register
                                      // dev2iotsb by pio_slow.
input  dev2iotsb_hw_acc_pio_med_rd;  // This signal enables reading of register
                                     // dev2iotsb by pio_med.
input  dev2iotsb_hw_acc_pio_med_wr;  // This signal enables writing of register
                                     // dev2iotsb by pio_med.
input  dev2iotsb_hw_acc_pio_fast_rd;  // This signal enables reading of register
                                      // dev2iotsb by pio_fast.
input  dev2iotsb_hw_acc_pio_fast_wr;  // This signal enables writing of register
                                      // dev2iotsb by pio_fast.
output IotsbDesc_select;  // select signal
input  IotsbDesc_hw_acc_jtag_rd;  // This signal enables reading of register
                                  // IotsbDesc by jtag.
input  IotsbDesc_hw_acc_jtag_wr;  // This signal enables writing of register
                                  // IotsbDesc by jtag.
input  IotsbDesc_hw_acc_pio_slow_rd;  // This signal enables reading of register
                                      // IotsbDesc by pio_slow.
input  IotsbDesc_hw_acc_pio_slow_wr;  // This signal enables writing of register
                                      // IotsbDesc by pio_slow.
input  IotsbDesc_hw_acc_pio_med_rd;  // This signal enables reading of register
                                     // IotsbDesc by pio_med.
input  IotsbDesc_hw_acc_pio_med_wr;  // This signal enables writing of register
                                     // IotsbDesc by pio_med.
input  IotsbDesc_hw_acc_pio_fast_rd;  // This signal enables reading of register
                                      // IotsbDesc by pio_fast.
input  IotsbDesc_hw_acc_pio_fast_wr;  // This signal enables writing of register
                                      // IotsbDesc by pio_fast.

//====================================================================
//     Type declarations
//====================================================================
wire clk;  // Clock signal
wire rst_l;  // Reset
wire daemon_csrbus_valid;  // Daemon_Valid
wire [`FIRE_CSRBUS_ADDR_WIDTH - 1:0] daemon_csrbus_addr;  // Daemon_Addr
wire [1:0] csrbus_src_bus;  // Source bus
wire daemon_csrbus_wr;  // Read/Write signal
reg daemon_csrbus_wr_out;  // Read/Write signal
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data;  // Write data
reg [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_out;  // Write data
wire daemon_csrbus_mapped;  // mapped
wire csrbus_acc_vio;  // acc_vio
wire daemon_transaction_in_progress;  // daemon_transaction_in_progress
wire instance_id;  // Instance ID
wire daemon_csrbus_done;  // Operation is done
wire stage_mux_only_ext_done_0_out;  // Operation is done
reg ctl_select_pulse;  // select signal
reg tsb_select_pulse;  // select signal
reg fsh_select_pulse;  // select signal
reg inv_select;  // select signal
reg log_select_pulse;  // select signal
reg int_en_select_pulse;  // select signal
reg en_err_select;  // select signal
reg err_select_pulse;  // select signal
wire err_rw1c_alias;  // alias signal
wire err_rw1s_alias;  // alias signal
reg flta_select_pulse;  // select signal
reg flts_select_pulse;  // select signal
reg prfc_select_pulse;  // select signal
reg prf0_select_pulse;  // select signal
reg prf1_select_pulse;  // select signal
reg vtb_select;  // select signal
wire vtb_hw_acc_jtag_rd;  // This signal enables reading of register vtb by
                          // jtag.
wire vtb_hw_acc_jtag_wr;  // This signal enables writing of register vtb by
                          // jtag.
wire vtb_hw_acc_pio_slow_rd;  // This signal enables reading of register vtb by
                              // pio_slow.
wire vtb_hw_acc_pio_slow_wr;  // This signal enables writing of register vtb by
                              // pio_slow.
wire vtb_hw_acc_pio_med_rd;  // This signal enables reading of register vtb by
                             // pio_med.
wire vtb_hw_acc_pio_med_wr;  // This signal enables writing of register vtb by
                             // pio_med.
wire vtb_hw_acc_pio_fast_rd;  // This signal enables reading of register vtb by
                              // pio_fast.
wire vtb_hw_acc_pio_fast_wr;  // This signal enables writing of register vtb by
                              // pio_fast.
reg ptb_select;  // select signal
wire ptb_hw_acc_jtag_rd;  // This signal enables reading of register ptb by
                          // jtag.
wire ptb_hw_acc_jtag_wr;  // This signal enables writing of register ptb by
                          // jtag.
wire ptb_hw_acc_pio_slow_rd;  // This signal enables reading of register ptb by
                              // pio_slow.
wire ptb_hw_acc_pio_slow_wr;  // This signal enables writing of register ptb by
                              // pio_slow.
wire ptb_hw_acc_pio_med_rd;  // This signal enables reading of register ptb by
                             // pio_med.
wire ptb_hw_acc_pio_med_wr;  // This signal enables writing of register ptb by
                             // pio_med.
wire ptb_hw_acc_pio_fast_rd;  // This signal enables reading of register ptb by
                              // pio_fast.
wire ptb_hw_acc_pio_fast_wr;  // This signal enables writing of register ptb by
                              // pio_fast.
reg tdb_select;  // select signal
wire tdb_hw_acc_jtag_rd;  // This signal enables reading of register tdb by
                          // jtag.
wire tdb_hw_acc_jtag_wr;  // This signal enables writing of register tdb by
                          // jtag.
wire tdb_hw_acc_pio_slow_rd;  // This signal enables reading of register tdb by
                              // pio_slow.
wire tdb_hw_acc_pio_slow_wr;  // This signal enables writing of register tdb by
                              // pio_slow.
wire tdb_hw_acc_pio_med_rd;  // This signal enables reading of register tdb by
                             // pio_med.
wire tdb_hw_acc_pio_med_wr;  // This signal enables writing of register tdb by
                             // pio_med.
wire tdb_hw_acc_pio_fast_rd;  // This signal enables reading of register tdb by
                              // pio_fast.
wire tdb_hw_acc_pio_fast_wr;  // This signal enables writing of register tdb by
                              // pio_fast.
reg dev2iotsb_select;  // select signal
wire dev2iotsb_hw_acc_jtag_rd;  // This signal enables reading of register
                                // dev2iotsb by jtag.
wire dev2iotsb_hw_acc_jtag_wr;  // This signal enables writing of register
                                // dev2iotsb by jtag.
wire dev2iotsb_hw_acc_pio_slow_rd;  // This signal enables reading of register
                                    // dev2iotsb by pio_slow.
wire dev2iotsb_hw_acc_pio_slow_wr;  // This signal enables writing of register
                                    // dev2iotsb by pio_slow.
wire dev2iotsb_hw_acc_pio_med_rd;  // This signal enables reading of register
                                   // dev2iotsb by pio_med.
wire dev2iotsb_hw_acc_pio_med_wr;  // This signal enables writing of register
                                   // dev2iotsb by pio_med.
wire dev2iotsb_hw_acc_pio_fast_rd;  // This signal enables reading of register
                                    // dev2iotsb by pio_fast.
wire dev2iotsb_hw_acc_pio_fast_wr;  // This signal enables writing of register
                                    // dev2iotsb by pio_fast.
reg IotsbDesc_select;  // select signal
wire IotsbDesc_hw_acc_jtag_rd;  // This signal enables reading of register
                                // IotsbDesc by jtag.
wire IotsbDesc_hw_acc_jtag_wr;  // This signal enables writing of register
                                // IotsbDesc by jtag.
wire IotsbDesc_hw_acc_pio_slow_rd;  // This signal enables reading of register
                                    // IotsbDesc by pio_slow.
wire IotsbDesc_hw_acc_pio_slow_wr;  // This signal enables writing of register
                                    // IotsbDesc by pio_slow.
wire IotsbDesc_hw_acc_pio_med_rd;  // This signal enables reading of register
                                   // IotsbDesc by pio_med.
wire IotsbDesc_hw_acc_pio_med_wr;  // This signal enables writing of register
                                   // IotsbDesc by pio_med.
wire IotsbDesc_hw_acc_pio_fast_rd;  // This signal enables reading of register
                                    // IotsbDesc by pio_fast.
wire IotsbDesc_hw_acc_pio_fast_wr;  // This signal enables writing of register
                                    // IotsbDesc by pio_fast.


//====================================================================
//     Clocked valid
//====================================================================
reg clocked_valid;
reg clocked_valid_pulse;
always @(posedge clk)
  begin
     if(~rst_l)
       begin
          clocked_valid <= 1'b0;
          clocked_valid_pulse <= 1'b0;
       end
     else
       begin
          clocked_valid <= daemon_csrbus_valid;
          clocked_valid_pulse <= daemon_csrbus_valid & ~clocked_valid;
       end
  end

//====================================================================
//    Address Decode
//====================================================================
reg ctl_addr_decoded;
reg tsb_addr_decoded;
reg fsh_addr_decoded;
reg inv_addr_decoded;
reg log_addr_decoded;
reg int_en_addr_decoded;
reg en_err_addr_decoded;
reg err_rw1c_alias_addr_decoded;
reg err_rw1s_alias_addr_decoded;
reg flta_addr_decoded;
reg flts_addr_decoded;
reg prfc_addr_decoded;
reg prf0_addr_decoded;
reg prf1_addr_decoded;
reg vtb_addr_decoded;
reg ptb_addr_decoded;
reg tdb_addr_decoded;
reg dev2iotsb_addr_decoded;
reg IotsbDesc_addr_decoded;

always @(daemon_csrbus_addr or daemon_csrbus_valid or instance_id)
  begin
    if (~daemon_csrbus_valid)
      begin
        ctl_addr_decoded = 1'b0;
        tsb_addr_decoded = 1'b0;
        fsh_addr_decoded = 1'b0;
        inv_addr_decoded = 1'b0;
        log_addr_decoded = 1'b0;
        int_en_addr_decoded = 1'b0;
        en_err_addr_decoded = 1'b0;
        err_rw1c_alias_addr_decoded = 1'b0;
        err_rw1s_alias_addr_decoded = 1'b0;
        flta_addr_decoded = 1'b0;
        flts_addr_decoded = 1'b0;
        prfc_addr_decoded = 1'b0;
        prf0_addr_decoded = 1'b0;
        prf1_addr_decoded = 1'b0;
        vtb_addr_decoded = 1'b0;
        ptb_addr_decoded = 1'b0;
        tdb_addr_decoded = 1'b0;
        dev2iotsb_addr_decoded = 1'b0;
        IotsbDesc_addr_decoded = 1'b0;
      end
    else
      case (instance_id)

        `FIRE_DLC_MMU_CSR_INSTANCE_ID_VALUE_A:
          begin
        ctl_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_A_CTL_HW_ADDR;
        tsb_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_A_TSB_HW_ADDR;
        fsh_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_A_FSH_HW_ADDR;
        inv_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_A_INV_HW_ADDR;
        log_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_A_LOG_HW_ADDR;
        int_en_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_A_INT_EN_HW_ADDR;
        en_err_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_A_EN_ERR_HW_ADDR;
        err_rw1c_alias_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_A_ERR_RW1C_ALIAS_HW_ADDR;
        err_rw1s_alias_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_A_ERR_RW1S_ALIAS_HW_ADDR;
        flta_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_A_FLTA_HW_ADDR;
        flts_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_A_FLTS_HW_ADDR;
        prfc_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_A_PRFC_HW_ADDR;
        prf0_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_A_PRF0_HW_ADDR;
        prf1_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_A_PRF1_HW_ADDR;
        vtb_addr_decoded =
                {6'b0,daemon_csrbus_addr[26:6]} ==
                    `FIRE_DLC_MMU_CSR_A_VTB_HW_ADDR >>
                        `FIRE_DLC_MMU_CSR_VTB_LOW_ADDR_WIDTH;
        ptb_addr_decoded =
                {6'b0,daemon_csrbus_addr[26:6]} ==
                    `FIRE_DLC_MMU_CSR_A_PTB_HW_ADDR >>
                        `FIRE_DLC_MMU_CSR_PTB_LOW_ADDR_WIDTH;
        tdb_addr_decoded =
                {9'b0,daemon_csrbus_addr[26:9]} ==
                    `FIRE_DLC_MMU_CSR_A_TDB_HW_ADDR >>
                        `FIRE_DLC_MMU_CSR_TDB_LOW_ADDR_WIDTH;
        dev2iotsb_addr_decoded =
                {4'b0,daemon_csrbus_addr[26:4]} ==
                    `FIRE_DLC_MMU_CSR_A_DEV2IOTSB_HW_ADDR >>
                        `FIRE_DLC_MMU_CSR_DEV2IOTSB_LOW_ADDR_WIDTH;
        IotsbDesc_addr_decoded =
                {5'b0,daemon_csrbus_addr[26:5]} ==
                    `FIRE_DLC_MMU_CSR_A_IOTSBDESC_HW_ADDR >>
                        `FIRE_DLC_MMU_CSR_IOTSBDESC_LOW_ADDR_WIDTH;
          end

        `FIRE_DLC_MMU_CSR_INSTANCE_ID_VALUE_B:
          begin
        ctl_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_B_CTL_HW_ADDR;
        tsb_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_B_TSB_HW_ADDR;
        fsh_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_B_FSH_HW_ADDR;
        inv_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_B_INV_HW_ADDR;
        log_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_B_LOG_HW_ADDR;
        int_en_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_B_INT_EN_HW_ADDR;
        en_err_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_B_EN_ERR_HW_ADDR;
        err_rw1c_alias_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_B_ERR_RW1C_ALIAS_HW_ADDR;
        err_rw1s_alias_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_B_ERR_RW1S_ALIAS_HW_ADDR;
        flta_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_B_FLTA_HW_ADDR;
        flts_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_B_FLTS_HW_ADDR;
        prfc_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_B_PRFC_HW_ADDR;
        prf0_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_B_PRF0_HW_ADDR;
        prf1_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_MMU_CSR_B_PRF1_HW_ADDR;
        vtb_addr_decoded =
                {6'b0,daemon_csrbus_addr[26:6]} ==
                    `FIRE_DLC_MMU_CSR_B_VTB_HW_ADDR >>
                        `FIRE_DLC_MMU_CSR_VTB_LOW_ADDR_WIDTH;
        ptb_addr_decoded =
                {6'b0,daemon_csrbus_addr[26:6]} ==
                    `FIRE_DLC_MMU_CSR_B_PTB_HW_ADDR >>
                        `FIRE_DLC_MMU_CSR_PTB_LOW_ADDR_WIDTH;
        tdb_addr_decoded =
                {9'b0,daemon_csrbus_addr[26:9]} ==
                    `FIRE_DLC_MMU_CSR_B_TDB_HW_ADDR >>
                        `FIRE_DLC_MMU_CSR_TDB_LOW_ADDR_WIDTH;
        dev2iotsb_addr_decoded =
                {4'b0,daemon_csrbus_addr[26:4]} ==
                    `FIRE_DLC_MMU_CSR_B_DEV2IOTSB_HW_ADDR >>
                        `FIRE_DLC_MMU_CSR_DEV2IOTSB_LOW_ADDR_WIDTH;
        IotsbDesc_addr_decoded =
                {5'b0,daemon_csrbus_addr[26:5]} ==
                    `FIRE_DLC_MMU_CSR_B_IOTSBDESC_HW_ADDR >>
                        `FIRE_DLC_MMU_CSR_IOTSBDESC_LOW_ADDR_WIDTH;
          end

        default:
          begin
            ctl_addr_decoded = 1'b0;
            tsb_addr_decoded = 1'b0;
            fsh_addr_decoded = 1'b0;
            inv_addr_decoded = 1'b0;
            log_addr_decoded = 1'b0;
            int_en_addr_decoded = 1'b0;
            en_err_addr_decoded = 1'b0;
            err_rw1s_alias_addr_decoded = 1'b0;
            err_rw1c_alias_addr_decoded = 1'b0;
            flta_addr_decoded = 1'b0;
            flts_addr_decoded = 1'b0;
            prfc_addr_decoded = 1'b0;
            prf0_addr_decoded = 1'b0;
            prf1_addr_decoded = 1'b0;
            vtb_addr_decoded = 1'b0;
            ptb_addr_decoded = 1'b0;
            tdb_addr_decoded = 1'b0;
            dev2iotsb_addr_decoded = 1'b0;
            IotsbDesc_addr_decoded = 1'b0;
// vlint flag_system_call off
            // synopsys translate_off
            if(daemon_csrbus_valid)
               begin // axis tbcall_region
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_mmu_csr_addr_decode",`MON_ERROR,"ERROR: Instance ID for module dmu_mmu_csr_csr is bad"); `endif
               end // end of tbcall_region
            // synopsys translate_on
// vlint flag_system_call on
          end
      endcase
  end

//====================================================================
//      Register violations
//====================================================================
//----- reg_acc_vio: ctl
reg ctl_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         ctl_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~ctl_addr_decoded)
      ctl_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              ctl_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              ctl_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              ctl_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              ctl_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              ctl_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              ctl_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              ctl_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              ctl_acc_vio = 1'b0;

          default: 
             begin
                ctl_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_mmu_csr_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_mmu_csr_a_ctl"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: tsb
reg tsb_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         tsb_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~tsb_addr_decoded)
      tsb_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              tsb_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              tsb_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              tsb_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              tsb_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              tsb_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              tsb_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              tsb_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              tsb_acc_vio = 1'b0;

          default: 
             begin
                tsb_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_mmu_csr_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_mmu_csr_a_tsb"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: fsh
reg fsh_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         fsh_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~fsh_addr_decoded)
      fsh_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              fsh_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              fsh_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              fsh_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              fsh_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              fsh_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              fsh_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              fsh_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              fsh_acc_vio = 1'b0;

          default: 
             begin
                fsh_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_mmu_csr_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_mmu_csr_a_fsh"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: inv
reg inv_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         inv_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~inv_addr_decoded)
      inv_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              inv_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              inv_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              inv_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              inv_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              inv_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              inv_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              inv_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              inv_acc_vio = 1'b0;

          default: 
             begin
                inv_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_mmu_csr_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_mmu_csr_a_inv"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: log
reg log_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         log_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~log_addr_decoded)
      log_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              log_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              log_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              log_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              log_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              log_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              log_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              log_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              log_acc_vio = 1'b0;

          default: 
             begin
                log_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_mmu_csr_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_mmu_csr_a_log"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: int_en
reg int_en_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         int_en_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~int_en_addr_decoded)
      int_en_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              int_en_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              int_en_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              int_en_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              int_en_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              int_en_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              int_en_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              int_en_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              int_en_acc_vio = 1'b0;

          default: 
             begin
                int_en_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_mmu_csr_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_mmu_csr_a_int_en"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: en_err
reg en_err_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         en_err_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~en_err_addr_decoded)
      en_err_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              en_err_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              en_err_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              en_err_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              en_err_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              en_err_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              en_err_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              en_err_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              en_err_acc_vio = 1'b0;

          default: 
             begin
                en_err_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_mmu_csr_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_mmu_csr_a_en_err"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: err
reg err_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         err_rw1c_alias_addr_decoded or
         err_rw1s_alias_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress |
        ~ (err_rw1c_alias_addr_decoded | err_rw1s_alias_addr_decoded))
      err_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              err_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              err_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              err_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              err_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              err_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              err_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              err_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              err_acc_vio = 1'b0;

          default: 
             begin
                err_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_mmu_csr_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_mmu_csr_a_err_rw1c_alias"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: flta
reg flta_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         flta_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~flta_addr_decoded)
      flta_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              flta_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              flta_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              flta_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              flta_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              flta_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              flta_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              flta_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              flta_acc_vio = 1'b0;

          default: 
             begin
                flta_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_mmu_csr_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_mmu_csr_a_flta"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: flts
reg flts_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         flts_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~flts_addr_decoded)
      flts_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              flts_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              flts_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              flts_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              flts_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              flts_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              flts_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              flts_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              flts_acc_vio = 1'b0;

          default: 
             begin
                flts_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_mmu_csr_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_mmu_csr_a_flts"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: prfc
reg prfc_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         prfc_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~prfc_addr_decoded)
      prfc_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              prfc_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              prfc_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              prfc_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              prfc_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              prfc_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              prfc_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              prfc_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              prfc_acc_vio = 1'b0;

          default: 
             begin
                prfc_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_mmu_csr_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_mmu_csr_a_prfc"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: prf0
reg prf0_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         prf0_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~prf0_addr_decoded)
      prf0_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              prf0_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              prf0_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              prf0_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              prf0_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              prf0_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              prf0_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              prf0_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              prf0_acc_vio = 1'b0;

          default: 
             begin
                prf0_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_mmu_csr_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_mmu_csr_a_prf0"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: prf1
reg prf1_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         prf1_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~prf1_addr_decoded)
      prf1_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              prf1_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              prf1_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              prf1_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              prf1_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              prf1_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              prf1_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              prf1_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              prf1_acc_vio = 1'b0;

          default: 
             begin
                prf1_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_mmu_csr_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_mmu_csr_a_prf1"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: vtb
reg vtb_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         vtb_addr_decoded or
         daemon_transaction_in_progress or vtb_hw_acc_jtag_rd or
         vtb_hw_acc_jtag_wr or vtb_hw_acc_pio_slow_rd or
         vtb_hw_acc_pio_slow_wr or vtb_hw_acc_pio_med_rd or
         vtb_hw_acc_pio_med_wr or vtb_hw_acc_pio_fast_rd or
         vtb_hw_acc_pio_fast_wr)
  begin
    if (daemon_transaction_in_progress | ~vtb_addr_decoded)
      vtb_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              vtb_acc_vio = ~vtb_hw_acc_jtag_rd;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              vtb_acc_vio = ~vtb_hw_acc_pio_slow_rd;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              vtb_acc_vio = ~vtb_hw_acc_pio_med_rd;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              vtb_acc_vio = ~vtb_hw_acc_pio_fast_rd;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              vtb_acc_vio = ~vtb_hw_acc_jtag_wr;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              vtb_acc_vio = ~vtb_hw_acc_pio_slow_wr;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              vtb_acc_vio = ~vtb_hw_acc_pio_med_wr;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              vtb_acc_vio = ~vtb_hw_acc_pio_fast_wr;

          default: 
             begin
                vtb_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_mmu_csr_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_mmu_csr_a_vtb"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: ptb
reg ptb_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         ptb_addr_decoded or
         daemon_transaction_in_progress or ptb_hw_acc_jtag_rd or
         ptb_hw_acc_jtag_wr or ptb_hw_acc_pio_slow_rd or
         ptb_hw_acc_pio_slow_wr or ptb_hw_acc_pio_med_rd or
         ptb_hw_acc_pio_med_wr or ptb_hw_acc_pio_fast_rd or
         ptb_hw_acc_pio_fast_wr)
  begin
    if (daemon_transaction_in_progress | ~ptb_addr_decoded)
      ptb_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              ptb_acc_vio = ~ptb_hw_acc_jtag_rd;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              ptb_acc_vio = ~ptb_hw_acc_pio_slow_rd;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              ptb_acc_vio = ~ptb_hw_acc_pio_med_rd;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              ptb_acc_vio = ~ptb_hw_acc_pio_fast_rd;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              ptb_acc_vio = ~ptb_hw_acc_jtag_wr;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              ptb_acc_vio = ~ptb_hw_acc_pio_slow_wr;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              ptb_acc_vio = ~ptb_hw_acc_pio_med_wr;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              ptb_acc_vio = ~ptb_hw_acc_pio_fast_wr;

          default: 
             begin
                ptb_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_mmu_csr_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_mmu_csr_a_ptb"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: tdb
reg tdb_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         tdb_addr_decoded or
         daemon_transaction_in_progress or tdb_hw_acc_jtag_rd or
         tdb_hw_acc_jtag_wr or tdb_hw_acc_pio_slow_rd or
         tdb_hw_acc_pio_slow_wr or tdb_hw_acc_pio_med_rd or
         tdb_hw_acc_pio_med_wr or tdb_hw_acc_pio_fast_rd or
         tdb_hw_acc_pio_fast_wr)
  begin
    if (daemon_transaction_in_progress | ~tdb_addr_decoded)
      tdb_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              tdb_acc_vio = ~tdb_hw_acc_jtag_rd;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              tdb_acc_vio = ~tdb_hw_acc_pio_slow_rd;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              tdb_acc_vio = ~tdb_hw_acc_pio_med_rd;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              tdb_acc_vio = ~tdb_hw_acc_pio_fast_rd;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              tdb_acc_vio = ~tdb_hw_acc_jtag_wr;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              tdb_acc_vio = ~tdb_hw_acc_pio_slow_wr;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              tdb_acc_vio = ~tdb_hw_acc_pio_med_wr;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              tdb_acc_vio = ~tdb_hw_acc_pio_fast_wr;

          default: 
             begin
                tdb_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_mmu_csr_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_mmu_csr_a_tdb"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: dev2iotsb
reg dev2iotsb_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         dev2iotsb_addr_decoded or
         daemon_transaction_in_progress or dev2iotsb_hw_acc_jtag_rd or
         dev2iotsb_hw_acc_jtag_wr or dev2iotsb_hw_acc_pio_slow_rd or
         dev2iotsb_hw_acc_pio_slow_wr or dev2iotsb_hw_acc_pio_med_rd or
         dev2iotsb_hw_acc_pio_med_wr or dev2iotsb_hw_acc_pio_fast_rd or
         dev2iotsb_hw_acc_pio_fast_wr)
  begin
    if (daemon_transaction_in_progress | ~dev2iotsb_addr_decoded)
      dev2iotsb_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              dev2iotsb_acc_vio = ~dev2iotsb_hw_acc_jtag_rd;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              dev2iotsb_acc_vio = ~dev2iotsb_hw_acc_pio_slow_rd;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              dev2iotsb_acc_vio = ~dev2iotsb_hw_acc_pio_med_rd;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              dev2iotsb_acc_vio = ~dev2iotsb_hw_acc_pio_fast_rd;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              dev2iotsb_acc_vio = ~dev2iotsb_hw_acc_jtag_wr;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              dev2iotsb_acc_vio = ~dev2iotsb_hw_acc_pio_slow_wr;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              dev2iotsb_acc_vio = ~dev2iotsb_hw_acc_pio_med_wr;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              dev2iotsb_acc_vio = ~dev2iotsb_hw_acc_pio_fast_wr;

          default: 
             begin
                dev2iotsb_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_mmu_csr_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_mmu_csr_a_dev2iotsb"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: IotsbDesc
reg IotsbDesc_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         IotsbDesc_addr_decoded or
         daemon_transaction_in_progress or IotsbDesc_hw_acc_jtag_rd or
         IotsbDesc_hw_acc_jtag_wr or IotsbDesc_hw_acc_pio_slow_rd or
         IotsbDesc_hw_acc_pio_slow_wr or IotsbDesc_hw_acc_pio_med_rd or
         IotsbDesc_hw_acc_pio_med_wr or IotsbDesc_hw_acc_pio_fast_rd or
         IotsbDesc_hw_acc_pio_fast_wr)
  begin
    if (daemon_transaction_in_progress | ~IotsbDesc_addr_decoded)
      IotsbDesc_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              IotsbDesc_acc_vio = ~IotsbDesc_hw_acc_jtag_rd;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              IotsbDesc_acc_vio = ~IotsbDesc_hw_acc_pio_slow_rd;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              IotsbDesc_acc_vio = ~IotsbDesc_hw_acc_pio_med_rd;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              IotsbDesc_acc_vio = ~IotsbDesc_hw_acc_pio_fast_rd;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              IotsbDesc_acc_vio = ~IotsbDesc_hw_acc_jtag_wr;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              IotsbDesc_acc_vio = ~IotsbDesc_hw_acc_pio_slow_wr;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              IotsbDesc_acc_vio = ~IotsbDesc_hw_acc_pio_med_wr;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              IotsbDesc_acc_vio = ~IotsbDesc_hw_acc_pio_fast_wr;

          default: 
             begin
                IotsbDesc_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_mmu_csr_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_mmu_csr_a_IotsbDesc"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end

//====================================================================
//    Status: daemon_csrbus_mapped / csrbus_acc_vio
//====================================================================
//----- OUTPUT: daemon_csrbus_mapped
assign daemon_csrbus_mapped = clocked_valid_pulse &
                                (
                                  ctl_addr_decoded |
                                  tsb_addr_decoded |
                                  fsh_addr_decoded |
                                  inv_addr_decoded |
                                  log_addr_decoded |
                                  int_en_addr_decoded |
                                  en_err_addr_decoded |
                                  err_rw1s_alias_addr_decoded |
                                  err_rw1c_alias_addr_decoded |
                                  flta_addr_decoded |
                                  flts_addr_decoded |
                                  prfc_addr_decoded |
                                  prf0_addr_decoded |
                                  prf1_addr_decoded |
                                  vtb_addr_decoded |
                                  ptb_addr_decoded |
                                  tdb_addr_decoded |
                                  dev2iotsb_addr_decoded |
                                  IotsbDesc_addr_decoded
                                );


// daemon_csrbus_mapped gets asserted after fixed number of cycles
// after daemon_csrbus_valid become high
/* 0in assert_together -name mapped_after_valid
       -leader $0in_rising_edge($0in_delay(daemon_csrbus_valid, 1))
       -follower $0in_rising_edge(daemon_csrbus_mapped)
       -message ("daemon_csrbus_mapped was not asserted 1 clock cycles from csrbus_valid")
       -module dmu_mmu_csr_addr_decode
       -clock clk
       -active $0in_rising_edge(daemon_csrbus_mapped)
*/

// daemon_csrbus_mapped is a pulse
/* 0in assert_timer -name daemon_csrbus_mapped_pulse
       -var daemon_csrbus_mapped -max 1
       -message "daemon_csrbus_mapped pulse length is not 1"
       -module dmu_mmu_csr_addr_decode
       -clock clk
*/
//----- OUTPUT: csrbus_acc_vio
assign csrbus_acc_vio = clocked_valid_pulse &
                        ctl_acc_vio |
                        tsb_acc_vio |
                        fsh_acc_vio |
                        inv_acc_vio |
                        log_acc_vio |
                        int_en_acc_vio |
                        en_err_acc_vio |
                        err_acc_vio |
                        flta_acc_vio |
                        flts_acc_vio |
                        prfc_acc_vio |
                        prf0_acc_vio |
                        prf1_acc_vio |
                        vtb_acc_vio |
                        ptb_acc_vio |
                        tdb_acc_vio |
                        dev2iotsb_acc_vio |
                        IotsbDesc_acc_vio;

//====================================================================
//    Select
//====================================================================
always @(posedge clk)
  begin
     if(~rst_l)
       begin
          ctl_select_pulse <= 1'b0;
          tsb_select_pulse <= 1'b0;
          fsh_select_pulse <= 1'b0;
          inv_select <= 1'b0;
          log_select_pulse <= 1'b0;
          int_en_select_pulse <= 1'b0;
          en_err_select <= 1'b0;
          err_select_pulse <= 1'b0;
          flta_select_pulse <= 1'b0;
          flts_select_pulse <= 1'b0;
          prfc_select_pulse <= 1'b0;
          prf0_select_pulse <= 1'b0;
          prf1_select_pulse <= 1'b0;
          vtb_select <= 1'b0;
          ptb_select <= 1'b0;
          tdb_select <= 1'b0;
          dev2iotsb_select <= 1'b0;
          IotsbDesc_select <= 1'b0;
       end
     else
       begin
          ctl_select_pulse <=
         ~ctl_acc_vio &
         clocked_valid_pulse &
         ctl_addr_decoded;

          tsb_select_pulse <=
         ~tsb_acc_vio &
         clocked_valid_pulse &
         tsb_addr_decoded;

          fsh_select_pulse <=
         ~fsh_acc_vio &
         clocked_valid_pulse &
         fsh_addr_decoded;

          inv_select <=
         ~inv_acc_vio &
         inv_addr_decoded;

          log_select_pulse <=
         ~log_acc_vio &
         clocked_valid_pulse &
         log_addr_decoded;

          int_en_select_pulse <=
         ~int_en_acc_vio &
         clocked_valid_pulse &
         int_en_addr_decoded;

          en_err_select <=
         ~en_err_acc_vio &
         en_err_addr_decoded;

          err_select_pulse <=
         ~err_acc_vio &
         clocked_valid_pulse &
         (
           err_rw1c_alias_addr_decoded |
           err_rw1s_alias_addr_decoded
         );

          flta_select_pulse <=
         ~flta_acc_vio &
         clocked_valid_pulse &
         flta_addr_decoded;

          flts_select_pulse <=
         ~flts_acc_vio &
         clocked_valid_pulse &
         flts_addr_decoded;

          prfc_select_pulse <=
         ~prfc_acc_vio &
         clocked_valid_pulse &
         prfc_addr_decoded;

          prf0_select_pulse <=
         ~prf0_acc_vio &
         clocked_valid_pulse &
         prf0_addr_decoded;

          prf1_select_pulse <=
         ~prf1_acc_vio &
         clocked_valid_pulse &
         prf1_addr_decoded;

          vtb_select <=
         ~ vtb_acc_vio &
         vtb_addr_decoded;

          ptb_select <=
         ~ ptb_acc_vio &
         ptb_addr_decoded;

          tdb_select <=
         ~ tdb_acc_vio &
         tdb_addr_decoded;

          dev2iotsb_select <=
         ~ dev2iotsb_acc_vio &
         dev2iotsb_addr_decoded;

          IotsbDesc_select <=
         ~ IotsbDesc_acc_vio &
         IotsbDesc_addr_decoded;

        end
  end

//====================================================================
//    daemon_csrbus_wr / daemon_csrbus_wr_data
//====================================================================
always @(posedge clk)
  begin
     if(~rst_l)
       begin
          daemon_csrbus_wr_out      <= 1'b0;
          daemon_csrbus_wr_data_out <= `FIRE_CSRBUS_DATA_WIDTH'b0;
       end
     else
       begin
          daemon_csrbus_wr_out      <= daemon_csrbus_wr;
          daemon_csrbus_wr_data_out <= daemon_csrbus_wr_data;
        end
  end

//====================================================================
//    Cycle Counter: Used for ExtReadTiming / ExtWriteTiming
//====================================================================
reg [1:0] dcm_cycle_counter;

reg daemon_csrbus_valid_p1; //Delaying
reg daemon_csrbus_valid_p2; //Delaying
reg daemon_csrbus_valid_p3; //Delaying

always @(posedge clk)
  begin
     if(~rst_l)
       begin
          daemon_csrbus_valid_p1 <= 1'b0;
          daemon_csrbus_valid_p2 <= 1'b0;
          daemon_csrbus_valid_p3 <= 1'b0;

          dcm_cycle_counter <= 2'b0;
       end
     else
       begin
          daemon_csrbus_valid_p1 <= daemon_csrbus_valid;
          daemon_csrbus_valid_p2 <= daemon_csrbus_valid & daemon_csrbus_valid_p1;
          daemon_csrbus_valid_p3 <= daemon_csrbus_valid & daemon_csrbus_valid_p2;

          if(~daemon_csrbus_valid)
            dcm_cycle_counter <= 2'b0;
           else if(daemon_csrbus_valid_p3 & dcm_cycle_counter != 2'd3)
            dcm_cycle_counter <= dcm_cycle_counter + 2'b1;
          else
            dcm_cycle_counter <= dcm_cycle_counter;
        end
   end

wire vtb_read_ext_done =
       dcm_cycle_counter == 2'd1 &
       ~ daemon_csrbus_wr &
       vtb_select;

// vtb_read_ext_done gets asserted after a given # of
// cycles after daemon_csrbus_valid
/* 0in assert_together -name vtb_read_ext_done_after_daemon_csrbus_valid
       -leader $0in_rising_edge($0in_delay(daemon_csrbus_valid, 4))
       -follower $0in_rising_edge(vtb_read_ext_done)
       -message ("vtb_read_ext_done was not asserted 4 clock cycles from daemon_csrbus_valid")
       -module dmu_mmu_csr_addr_decode
       -clock clk
       -active (vtb_select & !daemon_csrbus_wr)
*/

wire ptb_read_ext_done =
       dcm_cycle_counter == 2'd1 &
       ~ daemon_csrbus_wr &
       ptb_select;

// ptb_read_ext_done gets asserted after a given # of
// cycles after daemon_csrbus_valid
/* 0in assert_together -name ptb_read_ext_done_after_daemon_csrbus_valid
       -leader $0in_rising_edge($0in_delay(daemon_csrbus_valid, 4))
       -follower $0in_rising_edge(ptb_read_ext_done)
       -message ("ptb_read_ext_done was not asserted 4 clock cycles from daemon_csrbus_valid")
       -module dmu_mmu_csr_addr_decode
       -clock clk
       -active (ptb_select & !daemon_csrbus_wr)
*/

wire tdb_read_ext_done =
       dcm_cycle_counter == 2'd2 &
       ~ daemon_csrbus_wr &
       tdb_select;

// tdb_read_ext_done gets asserted after a given # of
// cycles after daemon_csrbus_valid
/* 0in assert_together -name tdb_read_ext_done_after_daemon_csrbus_valid
       -leader $0in_rising_edge($0in_delay(daemon_csrbus_valid, 5))
       -follower $0in_rising_edge(tdb_read_ext_done)
       -message ("tdb_read_ext_done was not asserted 5 clock cycles from daemon_csrbus_valid")
       -module dmu_mmu_csr_addr_decode
       -clock clk
       -active (tdb_select & !daemon_csrbus_wr)
*/


//====================================================================
//    Alias
//====================================================================
assign err_rw1c_alias=
          err_rw1c_alias_addr_decoded;

assign err_rw1s_alias=
          err_rw1s_alias_addr_decoded;


//====================================================================
//   OUTPUT: daemon_csrbus_done (pipelining)
//====================================================================
//----- DONE for internal/extern registers
reg stage_1_daemon_csrbus_done_internal_0;
reg stage_1_daemon_csrbus_done_internal_1;
reg stage_2_daemon_csrbus_done_internal_0;
reg stage_3_daemon_csrbus_done_internal_0;
reg stage_4_daemon_csrbus_done_internal_0;

always @(posedge clk)
  begin
     if(~rst_l)
       begin
         stage_1_daemon_csrbus_done_internal_0 <= 1'b0;
         stage_1_daemon_csrbus_done_internal_1 <= 1'b0;
       end
     else
       begin
         stage_1_daemon_csrbus_done_internal_0 <=
                 ctl_select_pulse |
                 tsb_select_pulse |
                 fsh_select_pulse |
                 log_select_pulse |
                 int_en_select_pulse |
                 err_select_pulse |
                 flta_select_pulse |
                 flts_select_pulse |
                 prfc_select_pulse |
                 prf0_select_pulse |
                 prf1_select_pulse |
                 inv_select & clocked_valid_pulse |
                 en_err_select & clocked_valid_pulse |
                 vtb_select & clocked_valid_pulse & daemon_csrbus_wr |
                 ptb_select & clocked_valid_pulse & daemon_csrbus_wr;
         stage_1_daemon_csrbus_done_internal_1 <=
                 tdb_select & clocked_valid_pulse & daemon_csrbus_wr;
       end
     if(~rst_l)
       begin
         stage_2_daemon_csrbus_done_internal_0 <= 1'b0;
       end
     else
       begin
         stage_2_daemon_csrbus_done_internal_0 <=
                 stage_1_daemon_csrbus_done_internal_0 |
                 stage_1_daemon_csrbus_done_internal_1;
       end
     if(~rst_l)
       begin
         stage_3_daemon_csrbus_done_internal_0 <= 1'b0;
       end
     else
       begin
         stage_3_daemon_csrbus_done_internal_0 <=
                 stage_2_daemon_csrbus_done_internal_0;
       end
     if(~rst_l)
       begin
         stage_4_daemon_csrbus_done_internal_0 <= 1'b0;
       end
     else
       begin
         stage_4_daemon_csrbus_done_internal_0 <=
                 stage_3_daemon_csrbus_done_internal_0;
       end
  end

//----- DONE for extern registers from cycle_counter
reg stage_1_daemon_csrbus_done_cycle_counter_0;
reg stage_2_daemon_csrbus_done_cycle_counter_0;

always @(posedge clk)
  begin
     if(~rst_l)
       begin
         stage_1_daemon_csrbus_done_cycle_counter_0 <= 1'b0;
       end
     else
       begin
         stage_1_daemon_csrbus_done_cycle_counter_0 <=
                 vtb_read_ext_done |
                 ptb_read_ext_done |
                 tdb_read_ext_done;
        end
     if(~rst_l)
       begin
         stage_2_daemon_csrbus_done_cycle_counter_0 <= 1'b0;
       end
     else
       begin
         stage_2_daemon_csrbus_done_cycle_counter_0 <=
                 stage_1_daemon_csrbus_done_cycle_counter_0;
        end
  end

//----- OUTPUT: daemon_csrbus_done
assign daemon_csrbus_done = daemon_csrbus_valid &
          (
            stage_4_daemon_csrbus_done_internal_0 |
            stage_2_daemon_csrbus_done_cycle_counter_0 |
            stage_mux_only_ext_done_0_out
          );

// daemon_csrbus_done gets asserted only when csrbus_valid is high
/* 0in assert -name daemon_csrbus_done_high
       -var daemon_csrbus_valid -active daemon_csrbus_done
       -message "csrbus_done got asserted while csrbus_valid is low"
       -module dmu_mmu_csr_addr_decode
       -clock clk
*/

// daemon_csrbus_done is a pulse
/* 0in assert_timer -name daemon_csrbus_done_pulse
       -var daemon_csrbus_done -max 1
       -message "csrbus_done pulse length is not 1"
       -module dmu_mmu_csr_addr_decode
       -clock clk
*/

endmodule // dmu_mmu_csr_addr_decode
