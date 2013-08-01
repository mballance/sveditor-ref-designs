/*
 * Memory Harness with Wishbone Slave interface
 *
 * (C) Copyleft 2007 Simply RISC LLP
 * AUTHOR: Fabrizio Fazzino <fabrizio.fazzino@srisc.com>
 *
 * LICENSE:
 * This is a Free Hardware Design; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * version 2 as published by the Free Software Foundation.
 * The above named program is distributed in the hope that it will
 * be useful, but WITHOUT ANY WARRANTY; without even the implied
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * DESCRIPTION:
 * Filename is a parameter, and the corresponding file content
 * must follow the rules stated in Verilog standard for the
 * $readmemh() system task.
 * For instance if you don't change the default name you just
 * have to put a text file named "memory.hex" in your simulation
 * directory with the following content inside:
 *
 *   // We start from address zero by default:
 *   1234567812345678
 *   FEDCBA9876543210
 *   // Now we jump to doubleword number 10 (i.e. address 80):
 *   @ 10
 *   02468ACE13579BDF
 *
 * This memory harness was originally based upon a Wishbone Slave
 * model written by Rudolf Usselmann <rudi@asics.ws> but now I've
 * written it again entirely from scratch.
 */


module mem_harness(sys_clock_i, sys_reset_i, wbs_addr_i, wbs_data_i, wbs_data_o,
	wbs_cycle_i, wbs_strobe_i, wbs_sel_i, wbs_we_i, wbs_ack_o);
	// syn black_box
	parameter		addr_bits	= 24;
	parameter		addr_max	= ((1 << addr_bits) - 1);
	parameter		memfilename	= "memory.hex";
	parameter		initmem		= 0;
	parameter		loadmem		= 1;
	parameter		memdefaultcontent					= 64'b0;
	input			sys_clock_i;
	input			sys_reset_i;
	input			wbs_cycle_i;
	input			wbs_strobe_i;
	input	[63:0]		wbs_addr_i;
	input	[63:0]		wbs_data_i;
	input			wbs_we_i;
	input	[7:0]		wbs_sel_i;
	output			wbs_ack_o;
	output	[63:0]		wbs_data_o;

	reg			wbs_ack_o;
	reg	[63:0]		wbs_data_o;
	reg /*sparse*/
		[63:0]		mem[addr_max:0];
	wire	[63:0]		tmp_rd;
	wire	[63:0]		tmp_wd;
	integer			i;


/* synthesis translate_off */
  initial begin
    $display("INFO: MEMH %m: Memory Harness with Wishbone Slave interface starting...");
    $display("INFO: MEMH %m: %0d Address Bits / %0d Doublewords / %0d Bytes Total Memory", addr_bits, addr_max+1, (addr_max+1)*8);
    $readmemh(memfilename, mem);
    $display("INFO: MEMH %m: Memory initialization completed");
  end

 /* synthesis translate_on */

	assign tmp_rd = mem[wbs_addr_i[(addr_bits + 2):3]];
	assign tmp_wd[63:56] = ((!wbs_sel_i[7]) ? tmp_rd[63:56] : 
		wbs_data_i[63:56]);
	assign tmp_wd[55:48] = ((!wbs_sel_i[6]) ? tmp_rd[55:48] : 
		wbs_data_i[55:48]);
	assign tmp_wd[47:40] = ((!wbs_sel_i[5]) ? tmp_rd[47:40] : 
		wbs_data_i[47:40]);
	assign tmp_wd[39:32] = ((!wbs_sel_i[4]) ? tmp_rd[39:32] : 
		wbs_data_i[39:32]);
	assign tmp_wd[31:24] = ((!wbs_sel_i[3]) ? tmp_rd[31:24] : 
		wbs_data_i[31:24]);
	assign tmp_wd[23:16] = ((!wbs_sel_i[2]) ? tmp_rd[23:16] : 
		wbs_data_i[23:16]);
	assign tmp_wd[15:8] = ((!wbs_sel_i[1]) ? tmp_rd[15:8] : wbs_data_i[15:8]
		);
	assign tmp_wd[7:0] = ((!wbs_sel_i[0]) ? tmp_rd[7:0] : wbs_data_i[7:0]);

	always @(posedge sys_clock_i) begin
	  if ((wbs_cycle_i & wbs_strobe_i) & (!wbs_we_i)) begin
	    wbs_ack_o = 1;
	    wbs_data_o = tmp_rd;
	  end
	  else if ((wbs_cycle_i & wbs_strobe_i) & wbs_we_i) begin
	    wbs_ack_o = 1;
	    wbs_data_o = 64'hzzzzzzzzzzzzzzzz;
	    mem[wbs_addr_i[(addr_bits + 2):3]] = tmp_wd;
	  end
	  else
	    begin
	      wbs_ack_o = 0;
	      wbs_data_o = 64'hzzzzzzzzzzzzzzzz;
	    end
	end
endmodule
