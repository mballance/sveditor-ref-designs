// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_efa_sp_256b_cust.v
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
module n2_efa_sp_256b_cust (
  vpp, 
  efa_sbc_data, 
  pi_efa_prog_en, 
  sbc_efa_read_en, 
  sbc_efa_word_addr, 
  sbc_efa_bit_addr, 
  sbc_efa_margin0_rd, 
  sbc_efa_margin1_rd, 
  pwr_ok, 
  por_n, 
  sbc_efa_sup_det_rd, 
  sbc_efa_power_down, 
  clk) ;
wire [31:0] efa_read_data;

`define MAXFILENAME_1 200
//`define EFA_READ_LAT__2 45000
`define EFA_READ_LAT_2 6



input            vpp;                   // VPP input from I/O

output  [31:0]   efa_sbc_data;          // Data from e-fuse array to SBC
input            pi_efa_prog_en;        // e-fuse array program enable
input            sbc_efa_read_en;       // e-fuse array read enable
input   [5:0]    sbc_efa_word_addr;     // e-fuse array word addr
input   [4:0]    sbc_efa_bit_addr;      // e-fuse array bit addr
input            sbc_efa_margin0_rd;    // e-fuse array margin0 read
input            sbc_efa_margin1_rd;    // e-fuse array margin1 read
input            pwr_ok;                // power_ok reset
input            por_n;                 // por_n reset
input            sbc_efa_sup_det_rd;    // e-fuse array supply detect read
input            sbc_efa_power_down;    // e-fuse power down signal from SBC

//input            vddo;
input            clk;                   // cpu clk


/*--------------------------------------------------------------------------*/

//** Parameters and define **//

//parameter 	EFA_READ_LAT = 5670 ; // 7 system cycles (150Mhz) - 1/4(sys clk); about 45ns
				     // 840 ticks = 1 system cycle
 //  about 45ns (timescale is 1 ps)
/* The access time has been specified to be 45ns for a worst case read */

//** Wire and Reg declarations **//

reg [`MAXFILENAME_1*8-1:0]  efuse_data_filename;
reg [31:0] efuse_array[0:63],efuse_row,efa_read_data1,efa_read_data2,efa_read_data3,efa_read_data4;	//EFUSE ARRAY
integer file_get_status,i;
reg [31:0] fpInVec;
reg [31:0] efa_sbc_data;
wire	l1clk;		
wire   	lvl_det_l;           // level detect ok
wire    vddc_ok_l;           // vddc ok
wire    vddo_ok_l;           // vddo ok
wire    vpp_ok_l;            // vpp ok
reg	efuse_enable_write_check;

// JDL - outside translate_off
reg [5:0] sbc_efa_word_addr_1;
reg [4:0] sbc_efa_bit_addr_1;
reg       sbc_efa_read_en_1;
reg       sbc_efa_read_en_2;
reg       sbc_efa_read_en_3;
reg 	  sbc_efa_sup_det_rd_1;

/*--------------------------------------------------------------------------*/

// Process data file

// synopsys translate_off

initial 
begin
  efuse_enable_write_check = 1'b1;
  // Get Efuse data file from plusarg.
  if ($value$plusargs("efuse_data_file=%s", efuse_data_filename))
    begin
      // Read Efuse data file if present 
      $display("INFO: efuse data file is being read--filename=%0s", 
      			efuse_data_filename);
      $readmemh(efuse_data_filename, efuse_array);
      $display("INFO: completed reading efuse data file");
    end
  else 
    begin 
      //if file not present, initialize efuse_array with default value
      $display("INFO: Using default efuse data for the efuse array");
      for (i=0;i<=63;i=i+1) begin
	efuse_array[i] = 32'b0;
     end
    end
end   

// Process power down signal
assign l1clk   = clk & ~sbc_efa_power_down;

// Scan logic not in RTL 
//  this is not necessary
//assign so = se ? si : 1'bx;

//assign supply detect signals to valid values (circuit cannot be impl in model)
assign lvl_det_l = 1'b0;
assign vddc_ok_l = 1'b0;
assign vddo_ok_l = 1'b0;
assign vpp_ok_l  = ~vpp;

always @(posedge l1clk) begin
   sbc_efa_word_addr_1[5:0] <= sbc_efa_word_addr;
   sbc_efa_bit_addr_1[4:0]  <= sbc_efa_bit_addr;
end
   


always @(posedge pi_efa_prog_en) begin
// Write operation , one bit at a time
//  if ((pi_efa_prog_en === 1'b1) && (pwr_ok === 1'b1) && (por_n === 1'b1))  begin
  if (pi_efa_prog_en & pwr_ok & por_n)  
	begin
           efuse_row = efuse_array[sbc_efa_word_addr_1];
           efuse_row[sbc_efa_bit_addr_1] = 1'b1;
           efuse_array[sbc_efa_word_addr_1] <= efuse_row;
        end
end


// efa_read_data is from the VPP_CORE which is reset to 0 in ckt when read is de-asserted
// However in RTL it is reset to X because I want to simulate the wait time where
// efa_read_data is indeed X till the latency period
// margin reads are not modelled in the RTL
always @(posedge l1clk) begin
   sbc_efa_read_en_1 <= sbc_efa_read_en;
   sbc_efa_read_en_2 <= sbc_efa_read_en_1;
   sbc_efa_read_en_3 <= sbc_efa_read_en_2;
end

wire [31:0] sbc_efa_read_en_3_bus;

assign sbc_efa_read_en_3_bus[31:0] = {sbc_efa_read_en_3, sbc_efa_read_en_3, sbc_efa_read_en_3,
                                           sbc_efa_read_en_3, sbc_efa_read_en_3, sbc_efa_read_en_3,
                                           sbc_efa_read_en_3, sbc_efa_read_en_3, sbc_efa_read_en_3,
                                           sbc_efa_read_en_3, sbc_efa_read_en_3, sbc_efa_read_en_3,
                                           sbc_efa_read_en_3, sbc_efa_read_en_3, sbc_efa_read_en_3,
                                           sbc_efa_read_en_3, sbc_efa_read_en_3, sbc_efa_read_en_3,
                                           sbc_efa_read_en_3, sbc_efa_read_en_3, sbc_efa_read_en_3,
                                           sbc_efa_read_en_3, sbc_efa_read_en_3, sbc_efa_read_en_3,
                                           sbc_efa_read_en_3, sbc_efa_read_en_3,
                                           sbc_efa_read_en_3, sbc_efa_read_en_3, sbc_efa_read_en_3,
                                           sbc_efa_read_en_3, sbc_efa_read_en_3, sbc_efa_read_en_3};

assign efa_read_data[31:0] =  sbc_efa_read_en_3_bus[31:0] & efuse_array[sbc_efa_word_addr_1];
always @(posedge l1clk)
   sbc_efa_sup_det_rd_1 <= sbc_efa_sup_det_rd;

// synopsys translate_on

// In ckt, when sbc_efa_read_en is low, output remains the same.

wire [31:0] efa_data;
//                           ? {28'b0,~lvl_det_l,~vddc_ok_l,1'b0,~vpp_ok_l}
assign efa_data[31:0] = (sbc_efa_read_en & sbc_efa_read_en_3) 
                         ? ((sbc_efa_read_en_3 & sbc_efa_sup_det_rd_1)
                           ? {29'b0,~vddc_ok_l,~vddo_ok_l,~vpp_ok_l}
                           : efa_read_data[31:0]) 
                         : efa_sbc_data[31:0];

always @(posedge l1clk)
    efa_sbc_data[31:0]   <= por_n ? efa_data[31:0] : 32'b0;
 
endmodule


