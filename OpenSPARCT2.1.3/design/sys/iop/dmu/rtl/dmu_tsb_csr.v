// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_tsb_csr.v
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
module dmu_tsb_csr
	(
	clk,
	csrbus_addr,
	csrbus_wr_data,
	csrbus_wr,
	csrbus_valid,
	csrbus_mapped,
	csrbus_done,
	csrbus_read_data,
	rst_l,
	csrbus_src_bus,
	csrbus_acc_vio,
	instance_id,
	ext_addr,
	tsb_dma_ext_select,
	tsb_dma_entry_ext_read_data,
	tsb_dma_ext_done,
	tsb_sts_ext_select,
	tsb_sts_full_ext_read_data,
	tsb_sts_num_pnd_dma_ext_read_data,
	tsb_sts_empty_ext_read_data,
	tsb_sts_ext_done
	);

//====================================================
//     Polarity declarations
//====================================================
input  clk;  // Clock signal
input  [`FIRE_CSRBUS_ADDR_WIDTH-1:0] csrbus_addr;  // Address bus
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
input  csrbus_wr;  // Read/Write signal
input  csrbus_valid;  // Valid address
output csrbus_mapped;  // Address is mapped
output csrbus_done;  // Operation is done
output [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_read_data;  // SW read data bus
input  rst_l;  // Reset signal
input  [1:0] csrbus_src_bus;  // Source bus
output csrbus_acc_vio;  // Violation signal
input  instance_id;  // Instance ID
output [4:0] ext_addr;  // External address bus for dcm tsb
output tsb_dma_ext_select;  // When set, register tsb_dma is selected. This
                            // signal is a level.
input  [47:0] tsb_dma_entry_ext_read_data;  // Read data from the external
                                            // bypass register
input  tsb_dma_ext_done;  // This signal acknowledges read and write operations
                          // for register tsb_dma. For read operations, it
                          // indicates that the tsb_dma_ext_read_data signals
                          // are valid. For write operations, it indicates that
                          // the write operation is complete, and that
                          // <dcm>_ext_wr_data may be removed on the next cycle.
output tsb_sts_ext_select;  // When set, register tsb_sts is selected. This
                            // signal is a level.
input  [0:0] tsb_sts_full_ext_read_data;  // Ext read data (decode)
input  [5:0] tsb_sts_num_pnd_dma_ext_read_data;  // Ext read data (decode)
input  [0:0] tsb_sts_empty_ext_read_data;  // Ext read data (decode)
input  tsb_sts_ext_done;  // This signal acknowledges read and write operations
                          // for register tsb_sts. For read operations, it
                          // indicates that the tsb_sts_ext_read_data signals
                          // are valid. For write operations, it indicates that
                          // the write operation is complete, and that
                          // <dcm>_ext_wr_data may be removed on the next cycle.

//====================================================
//     Type declarations
//====================================================
wire clk;  // Clock signal
wire [`FIRE_CSRBUS_ADDR_WIDTH-1:0] csrbus_addr;  // Address bus
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
wire csrbus_wr;  // Read/Write signal
wire csrbus_valid;  // Valid address
wire csrbus_mapped;  // Address is mapped
wire csrbus_done;  // Operation is done
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_read_data;  // SW read data bus
wire rst_l;  // Reset signal
wire [1:0] csrbus_src_bus;  // Source bus
wire csrbus_acc_vio;  // Violation signal
wire instance_id;  // Instance ID
wire [4:0] ext_addr;  // External address bus for dcm tsb
wire tsb_dma_ext_select;  // When set, register tsb_dma is selected. This signal
                          // is a level.
wire [47:0] tsb_dma_entry_ext_read_data;  // Read data from the external bypass
                                          // register
wire tsb_dma_ext_done;  // This signal acknowledges read and write operations
                        // for register tsb_dma. For read operations, it
                        // indicates that the tsb_dma_ext_read_data signals are
                        // valid. For write operations, it indicates that the
                        // write operation is complete, and that
                        // <dcm>_ext_wr_data may be removed on the next cycle.
wire tsb_sts_ext_select;  // When set, register tsb_sts is selected. This signal
                          // is a level.
wire [0:0] tsb_sts_full_ext_read_data;  // Ext read data (decode)
wire [5:0] tsb_sts_num_pnd_dma_ext_read_data;  // Ext read data (decode)
wire [0:0] tsb_sts_empty_ext_read_data;  // Ext read data (decode)
wire tsb_sts_ext_done;  // This signal acknowledges read and write operations
                        // for register tsb_sts. For read operations, it
                        // indicates that the tsb_sts_ext_read_data signals are
                        // valid. For write operations, it indicates that the
                        // write operation is complete, and that
                        // <dcm>_ext_wr_data may be removed on the next cycle.

//====================================================
//    Local signals
//====================================================
//====================================================
//     Logic
//====================================================
wire daemon_transaction_in_progress;
wire daemon_csrbus_mapped;
wire daemon_csrbus_valid;
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data;
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on
wire daemon_csrbus_done;
wire [`FIRE_CSRBUS_ADDR_WIDTH-1:0] daemon_csrbus_addr;
wire daemon_csrbus_wr;

//summit modcovoff -bepgnv
pcie_dcm_daemon #(`FIRE_CSRBUS_ADDR_WIDTH,`FIRE_CSRBUS_DATA_WIDTH) pcie_dcm_daemon (
    .daemon_csrbus_valid (daemon_csrbus_valid),
    .daemon_csrbus_mapped (daemon_csrbus_mapped),
    .daemon_csrbus_wr_data (daemon_csrbus_wr_data),
    .daemon_csrbus_done (daemon_csrbus_done),
    .daemon_csrbus_addr (daemon_csrbus_addr),
    .daemon_csrbus_wr (daemon_csrbus_wr),
    .daemon_transaction_in_progress (daemon_transaction_in_progress),
// synopsys translate_off
      .clk(clk),
      .rst_l (rst_l),
      .csrbus_read_data (csrbus_read_data),
// synopsys translate_on
    .csrbus_valid (csrbus_valid),
    .csrbus_mapped (csrbus_mapped),
    .csrbus_wr_data (csrbus_wr_data),
    .csrbus_done (csrbus_done),
    .csrbus_addr (csrbus_addr),
    .csrbus_wr (csrbus_wr)
  );
//summit modcovon -bepgnv

//----- ext_reset

//----- Common ext_addr
assign ext_addr[4:0] = daemon_csrbus_addr[4:0];



//====================================================================
//    Address Decode
//====================================================================
reg tsb_dma_addr_decoded;
reg tsb_sts_addr_decoded;

always @(daemon_csrbus_addr or daemon_csrbus_valid or instance_id)
  begin
    if (~daemon_csrbus_valid)
      begin
        tsb_dma_addr_decoded = 1'b0;
        tsb_sts_addr_decoded = 1'b0;
      end
    else
      case (instance_id)

        `FIRE_DLC_TSB_INSTANCE_ID_VALUE_A:
          begin
        tsb_dma_addr_decoded =
                {5'b0,daemon_csrbus_addr[26:5]} ==
                    `FIRE_DLC_TSB_CSR_A_TSB_DMA_HW_ADDR >>
                        `FIRE_DLC_TSB_CSR_TSB_DMA_LOW_ADDR_WIDTH;
        tsb_sts_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_TSB_CSR_A_TSB_STS_HW_ADDR;
          end

        `FIRE_DLC_TSB_INSTANCE_ID_VALUE_B:
          begin
        tsb_dma_addr_decoded =
                {5'b0,daemon_csrbus_addr[26:5]} ==
                    `FIRE_DLC_TSB_CSR_B_TSB_DMA_HW_ADDR >>
                        `FIRE_DLC_TSB_CSR_TSB_DMA_LOW_ADDR_WIDTH;
        tsb_sts_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_TSB_CSR_B_TSB_STS_HW_ADDR;
          end

        default:
          begin
            tsb_dma_addr_decoded = 1'b0;
            tsb_sts_addr_decoded = 1'b0;
// vlint flag_system_call off
            // synopsys translate_off
            if(daemon_csrbus_valid)
               begin // axis tbcall_region
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_tsb_csr",`MON_ERROR,"ERROR: Instance ID for module dmu_tsb_csr is bad"); `endif
               end // end of tbcall_region
            // synopsys translate_on
// vlint flag_system_call on
          end
      endcase
  end

//====================================================================
//      Register violations
//====================================================================
//----- reg_acc_vio: tsb_dma
reg tsb_dma_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         tsb_dma_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~tsb_dma_addr_decoded)
      tsb_dma_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              tsb_dma_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              tsb_dma_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              tsb_dma_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              tsb_dma_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              tsb_dma_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              tsb_dma_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              tsb_dma_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              tsb_dma_acc_vio = 1'b0;

          default: 
             begin
                tsb_dma_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_tsb_csr",`MON_ERROR,"acc_vio: default case of dmu_tsb_csr_a_tsb_dma"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: tsb_sts
reg tsb_sts_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         tsb_sts_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~tsb_sts_addr_decoded)
      tsb_sts_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              tsb_sts_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              tsb_sts_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              tsb_sts_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              tsb_sts_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              tsb_sts_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              tsb_sts_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              tsb_sts_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              tsb_sts_acc_vio = 1'b0;

          default: 
             begin
                tsb_sts_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_tsb_csr",`MON_ERROR,"acc_vio: default case of dmu_tsb_csr_a_tsb_sts"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end

//====================================================================
//     clocked_mapped
//====================================================================
//----- clocked_mapped is to assure that
//----- csrbus_mapped is asserted for one cycle
reg clocked_mapped;
always @(posedge clk)
  begin
     if(~rst_l)
       begin
          clocked_mapped <= 1'b0;

       end
     else
       begin
          clocked_mapped <= daemon_csrbus_mapped |
                           clocked_mapped & daemon_csrbus_valid;
        end
  end

//====================================================================
//    Status: daemon_csrbus_mapped / csrbus_acc_vio
//====================================================================
//----- OUTPUT: daemon_csrbus_mapped
assign daemon_csrbus_mapped = ~clocked_mapped &
                                (
                                  tsb_dma_addr_decoded |
                                  tsb_sts_addr_decoded
                                );


//----- OUTPUT: csrbus_acc_vio
assign csrbus_acc_vio = ~clocked_mapped &
                        tsb_dma_acc_vio |
                        tsb_sts_acc_vio;

//====================================================================
//    Select
//====================================================================
wire tsb_dma_select =
         ~ tsb_dma_acc_vio &
         tsb_dma_addr_decoded;

wire tsb_sts_select =
         ~tsb_sts_acc_vio &
         tsb_sts_addr_decoded;


//====================================================================
//    Cycle Counter: Used for ExtReadTiming / ExtWriteTiming
//====================================================================

//====================================================
//      Automatic hw_ld / hw_write
//====================================================

//====================================================
//      Extern select
//====================================================
assign tsb_dma_ext_select =
           tsb_dma_select;
assign tsb_sts_ext_select =
           tsb_sts_select;



//====================================================
//      ext_read_data: field-based to register-based
//====================================================
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] tsb_dma_ext_read_data =
              {
                16'b0,
                tsb_dma_entry_ext_read_data
              };

//=====================================================
//      OUTPUT: csrbus_read_data
//=====================================================
assign csrbus_read_data =
          {`FIRE_CSRBUS_DATA_WIDTH { tsb_dma_select } } &
              tsb_dma_ext_read_data |
          {`FIRE_CSRBUS_DATA_WIDTH { tsb_sts_select } } &

              {
                56'b0,
                tsb_sts_full_ext_read_data,
                tsb_sts_num_pnd_dma_ext_read_data,
                tsb_sts_empty_ext_read_data
              };

//=====================================================
//      OUTPUT: daemon_csrbus_done
//=====================================================
assign daemon_csrbus_done = daemon_csrbus_valid &
          (
            tsb_dma_select & ~clocked_mapped & daemon_csrbus_wr |
            tsb_sts_select & ~clocked_mapped & daemon_csrbus_wr |
            tsb_dma_ext_done |
            tsb_sts_ext_done
          );

//====================================================
//     Instantiation of registers
//====================================================


endmodule // dmu_tsb_csr
