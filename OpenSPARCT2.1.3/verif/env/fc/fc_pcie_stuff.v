// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fc_pcie_stuff.v
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
   wire [7:0] RX_N;
   wire [7:0] RX_P;
   wire [7:0] TX_N;
   wire [7:0] TX_P;
   wire       PEX_RESET_L;
   reg        PCIE_Clock_250;

`ifndef FC_NO_PEUSAT_CODE
   // ********************************************************************************
   // PEU and Denali logic.
   // ********************************************************************************
   wire   DEN_CLK_TX;
   wire   DEN_CLK_RX;
   wire   DEN_RESET;
   wire [7:0] RCV_DET_LANES;

   // denali root monitor Clocks and Reset
   wire       denali_root_monitor_CLK_TX;
   wire       denali_root_monitor_CLK_RX;
   wire       denali_root_monitor_RESET = PEX_RESET_L;

   denali_pcie_device #( 8 ) pcieA (
                                    .TX       ( RX_P ),
                                    .TX_      ( RX_N ),
                                    .RX       ( TX_P ),
                                    .RX_      ( TX_N ),
                                    .CLK_TX   ( DEN_CLK_TX ),
                                    .CLK_RX   ( DEN_CLK_RX ),
// AT, 1/26/06: In DTM mode, Denali reset need to be driven by TB, not N2.
// AT-                                    .PERST_   ( PEX_RESET_L )
`ifndef DTM_ENABLED
                                    .PERST_   ( PEX_RESET_L )
`else
                                    .PERST_   ( ~DEN_RESET)
`endif
                                    );
   defparam   pcieA.interface_soma = "$DV_ROOT/verif/env/ilu_peu/soma_fastlink.soma";


   // Denali Root Complex monitor: for compliance check purpose
   denali_pcie_root_complex_monitor #(8) pcie_root_monitor
     (
      .TX            (TX_P),
      .TX_           (TX_N),
      .RX            (RX_P),
      .RX_           (RX_N),
      .CLK_TX        (denali_root_monitor_CLK_TX),
      .CLK_RX        (denali_root_monitor_CLK_RX),
      .PERST_        (denali_root_monitor_RESET)
      );

   defparam   pcie_root_monitor.interface_soma = "$DV_ROOT/verif/env/ilu_peu/soma_fastlink_root_monitor.soma";

  //Use ELEC_IDLE_LANES to force the
  // RX lanes to simulate electrical idle condition
  // This is driven by the Vera task linkdown(), so is not needed in the endpoint model
  wire [7:0]  ELEC_IDLE_LANES;

  always @( ELEC_IDLE_LANES ) begin
    if( ELEC_IDLE_LANES[0] ) begin
       force RX_P[0] = 0;
       force RX_N[0] = 0; end
    else begin
       release RX_P[0];
       release RX_N[0]; end
    if( ELEC_IDLE_LANES[1] ) begin
       force RX_P[1] = 0;
       force RX_N[1] = 0; end
    else begin
       release RX_P[1];
       release RX_N[1]; end
    if( ELEC_IDLE_LANES[2] ) begin
       force RX_P[2] = 0;
       force RX_N[2] = 0; end
    else begin
       release RX_P[2];
       release RX_N[2]; end
    if( ELEC_IDLE_LANES[3] ) begin
       force RX_P[3] = 0;
       force RX_N[3] = 0; end
    else begin
       release RX_P[3];
       release RX_N[3]; end
    if( ELEC_IDLE_LANES[4] ) begin
       force RX_P[4] = 0;
       force RX_N[4] = 0; end
    else begin
       release RX_P[4];
       release RX_N[4]; end
    if( ELEC_IDLE_LANES[5] ) begin
       force RX_P[5] = 0;
       force RX_N[5] = 0; end
    else begin
       release RX_P[5];
       release RX_N[5]; end
    if( ELEC_IDLE_LANES[6] ) begin
       force RX_P[6] = 0;
       force RX_N[6] = 0; end
    else begin
       release RX_P[6];
       release RX_N[6]; end
    if( ELEC_IDLE_LANES[7] ) begin
       force RX_P[7] = 0;
       force RX_N[7] = 0; end
    else begin
       release RX_P[7];
       release RX_N[7]; end
  end

`else
   // PCI-E DMA endpoint

// added this ifndef
`ifndef FC_NO_PEU_T2
   ept ept ();
`endif

`ifdef BUILD_USE_BOBO
   // Task to be called from Vera for backdoor writes
   task bobo_write_64bit;
      input [39:0] pa;
      input [63:0] data64;

      begin
          ept.pci_dma.dma.e3.buffer.ram0.memory_array[pa[11:3]] = data64[7:0];
          ept.pci_dma.dma.e3.buffer.ram1.memory_array[pa[11:3]] = data64[15:8];
          ept.pci_dma.dma.e3.buffer.ram2.memory_array[pa[11:3]] = data64[23:16];
          ept.pci_dma.dma.e3.buffer.ram3.memory_array[pa[11:3]] = data64[31:24];
          ept.pci_dma.dma.e3.buffer.ram4.memory_array[pa[11:3]] = data64[39:32];
          ept.pci_dma.dma.e3.buffer.ram5.memory_array[pa[11:3]] = data64[47:40];
          ept.pci_dma.dma.e3.buffer.ram6.memory_array[pa[11:3]] = data64[55:48];
          ept.pci_dma.dma.e3.buffer.ram7.memory_array[pa[11:3]] = data64[63:56];
          `PR_INFO ("ept", `MON_INFO, "bobo_write_64bit {pa[11:3],3'b000} = %h, data64 = %h\n", {pa[11:3],3'b000}, data64);
      end
   endtask // bobo_write_64bit
`endif // BUILD_USE_BOBO

`endif // !`ifndef FC_NO_PEUSAT_CODE
   
`ifdef PALLADIUM
// The following code is not used in the FC design.
`elsif AXIS_TL
`else
   initial begin
      PCIE_Clock_250 = 0;

      forever begin
         # 2000
           PCIE_Clock_250 = 1;
         # 2000
           PCIE_Clock_250 = 0;
      end
   end
`endif //PALLADIUM

  integer   delay_ref = delay_250; // = 250MHz default reference clock
  reg       PCIE_Ref_Clock;        // Reference clock can be 100,125,250 MHz 

  //Choose a serdes reference clock 
`ifdef PALLADIUM
// The following block is not used in the FC design

`elsif AXIS_TL
`else
  initial begin
     PCIE_Ref_Clock = 0;
     if ($test$plusargs("PCIE_REF_CLK_100")) begin
        delay_ref = 100;
     end
     else if ($test$plusargs("PCIE_REF_CLK_104")) begin // DTM mode only
        delay_ref = 104;
     end
     else if ($test$plusargs("PCIE_REF_CLK_125")) begin
        delay_ref = 125;
     end
     else if ($test$plusargs("PCIE_REF_CLK_250")) begin
        delay_ref = 250;
     end
     else  begin
        delay_ref = 250;
     end

/* Changed for DTM 104 MHz fix 
     if ($test$plusargs("PCIE_REF_CLK_100")) begin
        delay_ref = delay_100;
     end
     else if ($test$plusargs("PCIE_REF_CLK_125")) begin
        delay_ref = delay_125;
     end
     else if ($test$plusargs("PCIE_REF_CLK_250")) begin
        delay_ref = delay_250;
     end
     else  begin
        delay_ref = delay_250;
     end
*/
     
     forever begin
/* AT-, DTM: Per  email on 4/4/06: 
        # delay_ref
          PCIE_Ref_Clock = 1;
        # delay_ref
          PCIE_Ref_Clock = 0;
*/

// AT+, DTM: Per MkS emial on 4/4/06
      if( delay_ref == 100 )begin
         # delay_100
         PCIE_Ref_Clock = 1;
         # delay_100
         PCIE_Ref_Clock = 0;
      end

      if( delay_ref == 104 )begin  // DTM mode only
         # delay_104
         PCIE_Ref_Clock = 1;
         # delay_104
         PCIE_Ref_Clock = 0;
      end

      if( delay_ref == 125 )begin
         # delay_125
         PCIE_Ref_Clock = 1;
         # delay_125
         PCIE_Ref_Clock = 0;
      end

      if( delay_ref == 250 )begin
         # delay_250
         PCIE_Ref_Clock = 1;
         # delay_250
         PCIE_Ref_Clock = 0;
      end
     end 

  end
`endif
