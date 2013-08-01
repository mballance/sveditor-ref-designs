/*
 * Bridge from SPARC Core to Wishbone Master
 *
 * (C) 2007 Simply RISC LLP
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
 * This block implements a bridge from one SPARC Core of the
 * OpenSPARC T1 to a master interface that makes use of the
 * Wishbone interconnect protocol.
 * For informations about Sun Microsystems' OpenSPARC T1
 * refer to the web site http://www.opensparc.net
 * For informations about OpenCores' Wishbone interconnect
 * please refer to the web site http://www.opencores.org
 */



module spc2wbm(sys_clock_i, sys_reset_i, sys_interrupt_source_i, spc_req_i, 
	spc_atom_i, spc_packetout_i, spc_grant_o, spc_ready_o, spc_packetin_o, 
	spc_stallreq_o, wbm_ack_i, wbm_data_i, wbm_cycle_o, wbm_strobe_o, 
	wbm_we_o, wbm_addr_o, wbm_data_o, wbm_sel_o);

	input			sys_clock_i;
	input			sys_reset_i;
	input	[5:0]		sys_interrupt_source_i;
	input	[4:0]		spc_req_i;
	input			spc_atom_i;
	input	[(130 - 1):0]	spc_packetout_i;
	input			wbm_ack_i;
	input	[(64 - 1):0]	wbm_data_i;
	output	[4:0]		spc_grant_o;
	output			spc_ready_o;
	output	[(146 - 1):0]	spc_packetin_o;
	output			spc_stallreq_o;
	output			wbm_cycle_o;
	output			wbm_strobe_o;
	output			wbm_we_o;
	output	[(64 - 1):0]	wbm_addr_o;
	output	[(64 - 1):0]	wbm_data_o;
	output	[((64 / 8) - 1):0]
				wbm_sel_o;

	wire	[4:0]		spc_req_w;
	wire			spc_atom_w;
	reg			spc_atom_r;
	wire	[(130 - 1):0]	spc_packetout_w;
	reg	[(130 - 1):0]	spc_packetout_i_save;
	reg	[(130 - 1):0]	spc_packetout_i_save2;
	reg	[4:0]		spc_grant_w;
	reg			spc_ready_o;
	reg	[(146 - 1):0]	spc_packetin_o;
	reg	[(146 - 1):0]	spc_packetin_w;
	reg			spc_stallreq_w;
	reg			wbm_cycle_o;
	reg			wbm_strobe_o;
	reg			wbm_we_o;
	reg	[(64 - 1):0]	wbm_addr_o;
	reg	[(64 - 1):0]	wbm_data_o;
	reg	[((64 / 8) - 1):0]
				wbm_sel_o;
	reg	[3:0]		state;
	reg	[4:0]		spc2wbm_region;
	reg			spc2wbm_atomic;
	reg			fifo_vld;
	reg			fifo_vld2;
	reg	[(130 - 1):0]	spc2wbm_packet;
	reg			wbm2spc_valid;
	reg	[(144 - 141):0]	wbm2spc_type;
	reg			wbm2spc_miss;
	reg	[(139 - 138):0]	wbm2spc_error;
	reg			wbm2spc_nc;
	reg	[(136 - 134):0]	wbm2spc_thread;
	reg			wbm2spc_way_valid;
	reg	[(132 - 131):0]	wbm2spc_way;
	reg			wbm2spc_boot_fetch;
	reg			wbm2spc_atomic;
	reg			wbm2spc_pfl;
	reg	[(127 - 0):0]	wbm2spc_data;
	reg	[6:0]		wbm2spc_interrupt_source;
	reg			wbm2spc_interrupt_new;
	wire			spc2wbm_req;
	wire			spc2wbm_valid;
	wire	[(128 - 124):0]	spc2wbm_type;
	wire			spc2wbm_nc;
	wire	[(122 - 120):0]	spc2wbm_cpu_id;
	wire	[(119 - 117):0]	spc2wbm_thread;
	wire			spc2wbm_invalidate;
	wire	[(113 - 112):0]	spc2wbm_way;
	wire	[(111 - 104):0]	spc2wbm_size;
	wire	[(103 - 64):0]	spc2wbm_addr;
	wire	[(63 - 0):0]	spc2wbm_data;
	wire	[(146 - 1):0]	wbm2spc_packet;
	reg			dir_rd_en;
	reg			val_ic;
	reg			val_dc;
	reg	[3:0]		dc_dir_wen;
	wire	[3:0]		dc_dir_hit;
	reg	[3:0]		old_dc_hit;
	reg	[4:0]		ic_dir_wen;
	wire	[7:0]		ic_dir_hit;
	reg	[7:0]		old_ic_hit;
	wire	[2:0]		ic_dir_hit_way_enc;
	wire	[1:0]		dc_dir_hit_way_enc;
	reg			spc2wbm_addr_subword;
	reg			spc_stallreq_d;
	reg			fifo_vld_d;
	reg			cas1_matched;
	wire	[63:0]		wbm_sel_o_bytemask = {{8 {spc2wbm_size[7]}}, {8
		{spc2wbm_size[6]}}, {8 {spc2wbm_size[5]}}, {8
		{spc2wbm_size[4]}}, {8 {spc2wbm_size[3]}}, {8
		{spc2wbm_size[2]}}, {8 {spc2wbm_size[1]}}, {8 {spc2wbm_size[0]}}
		};
	wire	[1:0]		ic_dir_hit_way_enc0;
	wire	[1:0]		ic_dir_hit_way_enc1;

	assign spc2wbm_req = ((((spc_req_w[4] | spc_req_w[3]) | spc_req_w[2]) | 
		spc_req_w[1]) | spc_req_w[0]);
	assign spc2wbm_valid = spc2wbm_packet[129];
	assign spc2wbm_type = spc2wbm_packet[128:124];
	assign spc2wbm_nc = spc2wbm_packet[123];
	assign spc2wbm_cpu_id = spc2wbm_packet[122:120];
	assign spc2wbm_thread = spc2wbm_packet[119:117];
	assign spc2wbm_invalidate = spc2wbm_packet[116];
	assign spc2wbm_way = spc2wbm_packet[113:112];
	assign spc2wbm_size = spc2wbm_packet[111:104];
	assign spc2wbm_addr = spc2wbm_packet[103:64];
	assign spc2wbm_data = spc2wbm_packet[63:0];
	assign wbm2spc_packet = {wbm2spc_valid, wbm2spc_type, wbm2spc_miss, 
		wbm2spc_error, wbm2spc_nc, wbm2spc_thread, wbm2spc_way_valid, 
		wbm2spc_way, wbm2spc_boot_fetch, wbm2spc_atomic, wbm2spc_pfl, 
		wbm2spc_data};
	assign spc_grant_o = (spc_grant_w & (!spc_stallreq_o));
	assign spc_atom_w = spc_atom_r;
	assign spc_req_w = (spc_req_i | {4'b0, (fifo_vld & (~spc_stallreq_w))});
	assign spc_stallreq_o = ((spc_stallreq_w | fifo_vld) | {(|spc_req_i)});
	assign spc_packetout_w = ((fifo_vld | fifo_vld_d) ? spc_packetout_i_save
		: spc_packetout_i);
	assign ic_dir_hit_way_enc = ((|ic_dir_hit[3:0]) ? {1'b0, 
		ic_dir_hit_way_enc0} : {1'b1, ic_dir_hit_way_enc1});

	l2_dir l2_dird(sys_clock_i, sys_reset_i, spc2wbm_addr[38:11], 
		{spc2wbm_addr[10:5], spc2wbm_addr_subword}, dc_dir_wen, val_dc, 
		dc_dir_hit, dc_dir_hit_way_enc, dir_rd_en);
	l2_dir l2_diri0(sys_clock_i, sys_reset_i, spc2wbm_addr[38:11], 
		{spc2wbm_addr[10:5], 1'b0}, ({4 {(~ic_dir_wen[4])}} &
		ic_dir_wen[3:0]), val_ic, ic_dir_hit[3:0], ic_dir_hit_way_enc0, 
		dir_rd_en);
	l2_dir l2_diri1(sys_clock_i, sys_reset_i, spc2wbm_addr[38:11], 
		{spc2wbm_addr[10:5], 1'b0}, ({4 {ic_dir_wen[4]}} &
		ic_dir_wen[3:0]), val_ic, ic_dir_hit[7:4], ic_dir_hit_way_enc1, 
		dir_rd_en);

	always @(posedge sys_clock_i) begin
	  spc_packetout_i_save <= (((spc_packetout_i[(130 - 1)] & spc_stallreq_d
		  ) & (~fifo_vld)) ? spc_packetout_i : ((fifo_vld & 
		  spc_stallreq_d) ? spc_packetout_i_save : spc_packetout_i_save2
		  ));
	  spc_packetout_i_save2 <= ((spc_packetout_i[(130 - 1)] & fifo_vld) ? 
		  spc_packetout_i : (fifo_vld2 ? spc_packetout_i_save2 : 0));
	  fifo_vld <= ((spc_packetout_i[(130 - 1)] & spc_stallreq_d) ? 1 : (
		  spc_stallreq_w ? fifo_vld : fifo_vld2));
	  fifo_vld2 <= ((spc_packetout_i[(130 - 1)] & fifo_vld) ? 1 : (
		  spc_stallreq_w ? fifo_vld2 : 0));
	  spc_stallreq_d <= spc_stallreq_w;
	  spc_atom_r <= (fifo_vld ? spc_atom_r : spc_atom_i);
	  fifo_vld_d <= fifo_vld;
	end
	always @(posedge sys_clock_i) begin
	  spc_packetin_o <= spc_packetin_w;
	  if (sys_reset_i == 1) begin
	    dir_rd_en <= 0;
	    spc_grant_w <= 5'b0;
	    spc_ready_o <= 0;
	    spc_packetin_w <= 0;
	    spc_stallreq_w <= 0;
	    wbm_cycle_o <= 0;
	    wbm_strobe_o <= 0;
	    wbm_we_o <= 0;
	    wbm_addr_o <= 64'b0;
	    wbm_data_o <= 64'b0;
	    wbm_sel_o <= 8'b0;
	    spc2wbm_addr_subword <= 0;
	    wbm2spc_valid <= 1;
	    wbm2spc_type <= 4'd7;
	    wbm2spc_miss <= 0;
	    wbm2spc_error <= 0;
	    wbm2spc_nc <= 0;
	    wbm2spc_thread <= 0;
	    wbm2spc_way_valid <= 0;
	    wbm2spc_way <= 0;
	    wbm2spc_boot_fetch <= 0;
	    wbm2spc_atomic <= 0;
	    wbm2spc_pfl <= 0;
	    wbm2spc_data <= 64'h0000000000010001;
	    wbm2spc_interrupt_source <= 7'b0;
	    wbm2spc_interrupt_new <= 1'b0;
	    val_ic <= 0;
	    val_dc <= 0;
	    state <= 4'b0;
	  end
	  else
	    begin
	      if (state == 4'b0) begin
		spc_packetin_w <= wbm2spc_packet;
		state <= 4'b1;
	      end
	      else if (state == 4'b1) begin
		if (spc2wbm_req == 1) begin
		  spc_ready_o <= 0;
		  spc_packetin_w <= 0;
		  dc_dir_wen <= 0;
		  ic_dir_wen <= 0;
		  wbm2spc_way_valid <= 0;
		  wbm2spc_way <= 0;
		  wbm2spc_pfl <= 0;
		  wbm2spc_data <= 0;
		  spc_stallreq_w <= 1;
		  spc2wbm_region <= spc_req_w;
		  spc2wbm_atomic <= spc_atom_w;
		  state <= 4'd2;
		end
		else if (sys_interrupt_source_i != wbm2spc_interrupt_source) 
			begin
		  wbm2spc_interrupt_new <= 1;
		  wbm2spc_valid <= 1;
		  wbm2spc_type <= 4'd7;
		  wbm2spc_miss <= 0;
		  wbm2spc_error <= 0;
		  wbm2spc_nc <= 0;
		  wbm2spc_thread <= 0;
		  wbm2spc_boot_fetch <= 0;
		  wbm2spc_atomic <= 0;
		  wbm2spc_pfl <= 0;
		  spc_stallreq_w <= 1;
		end
		else if ((wbm2spc_interrupt_source != 6'b0) && 
			wbm2spc_interrupt_new) begin
		  wbm2spc_interrupt_new <= 0;
		  spc_ready_o <= 1;
		  spc_packetin_w <= wbm2spc_packet;
		  spc_stallreq_w <= 1;
		  state <= 4'b1;
		end
		else
		  begin
		    spc_ready_o <= 0;
		    spc_packetin_w <= 0;
		    spc_stallreq_w <= 0;
		    state <= 4'b1;
		  end
	      end
	      else if (state == 4'd2) begin
		spc2wbm_addr_subword <= spc_packetout_w[4+64];
		spc2wbm_packet <= spc_packetout_w;
		spc_grant_w <= spc2wbm_region;
		state <= 4'd3;
	      end
	      else if (state == 4'd3) begin
		spc2wbm_addr_subword <= spc2wbm_addr[4];
		spc_grant_w <= 5'b0;
		wbm_cycle_o <= 1;
		wbm_strobe_o <= 1;
		if ((~spc2wbm_addr[39]) && ((spc2wbm_type == 5'b0) || (
			spc2wbm_type == 5'b00010))) begin
		  wbm_addr_o <= {spc2wbm_region, 19'b0, spc2wbm_addr[(103 -
			  64):4], 4'b0};
		  dc_dir_wen <= ({4 {(~spc2wbm_nc)}} & ((spc2wbm_way == 0) ? 
			  4'b1 : ((spc2wbm_way == 1) ? 4'd2 : ((spc2wbm_way == 2
			  ) ? 4'd4 : 4'd8))));
		  val_dc <= 1;
		end
		else begin
		  wbm_addr_o <= {spc2wbm_region, 19'b0, spc2wbm_addr[(103 -
			  64):3], 3'b0};
		end
		wbm_data_o <= spc2wbm_data;
		if (spc2wbm_type == 5'b10000) begin
		  ic_dir_wen <= ({5 {(~spc2wbm_nc)}} & {spc2wbm_packet[114], 
			  ((spc2wbm_way == 0) ? 4'b1 : ((spc2wbm_way == 1) ?
			  4'd2 : ((spc2wbm_way == 2) ? 4'd4 : 4'd8)))});
		  val_ic <= 1;
		  wbm_we_o <= 0;
		  if (spc2wbm_region == 5'b10000) begin
		    wbm_sel_o <= (4'b1111 << (spc2wbm_addr[2] << 2));
		  end
		  else begin
		    wbm_sel_o <= 8'b11111111;
		  end
		end
		else if (spc2wbm_type == 5'b01000) begin
		  wbm_sel_o <= 8'b11111111;
		  wbm_we_o <= 0;
		end
		else if (((spc2wbm_type == 5'b0) || (spc2wbm_type == 5'b00010)) 
			|| (spc2wbm_type == 5'b00111)) begin
		  if (spc2wbm_addr[39]) begin
		    wbm_we_o <= 0;
		    if (spc2wbm_type == 5'b0) begin
		      case (spc2wbm_size)
			3'b0:
			  wbm_sel_o <= (1'b1 << spc2wbm_addr[2:0]);
			3'b1:
			  wbm_sel_o <= (2'b11 << (spc2wbm_addr[2:1] << 1));
			3'd2:
			  wbm_sel_o <= (4'b1111 << (spc2wbm_addr[2] << 2));
			3'd3:
			  wbm_sel_o <= 8'b11111111;
			3'd7:
			  wbm_sel_o <= 8'b11111111;
			default:
			  wbm_sel_o <= 8'b0;
		      endcase
		    end
		    else begin
		      wbm_sel_o <= spc2wbm_size;
		    end
		  end
		  else
		    begin
		      wbm_sel_o <= 8'b11111111;
		    end
		end
		else if ((spc2wbm_type == 5'b1) || ((spc2wbm_type == 5'b00011) 
			&& cas1_matched)) begin
		  wbm_we_o <= 1;
		  wbm_sel_o <= spc2wbm_size;
		end
		else
		  begin
		    wbm_we_o <= 1;
		    wbm_sel_o <= 8'b0;
		  end
                 
		begin
                   // synopsys translate_off
		  case (spc2wbm_type)
		    5'b0:
		      $display("INFO: SPC2WBM: Request of Type LOAD_RQ");
		    5'b10000:
		      $display("INFO: SPC2WBM: Request of Type IMISS_RQ");
		    5'b1:
		      $display("INFO: SPC2WBM: Request of Type STORE_RQ");
		    5'b01000:
		      $display("INFO: SPC2WBM: Request of Type MMU_RQ");
		    5'b00010:
		      $display("INFO: SPC2WBM: Request of Type CAS1_RQ");
		    5'b00011:
		      $display("INFO: SPC2WBM: Request of Type CAS2_RQ");
		    5'b00111:
		      $display("INFO: SPC2WBM: Request of Type SWAP_RQ");
		    5'b00100:
		      $display("INFO: SPC2WBM: Request of Type STRLOAD_RQ");
		    5'b01001:
		      $display("INFO: SPC2WBM: Request of Type INT_RQ");
		    5'b11111:
		      $display("INFO: SPC2WBM: Request of Type RSVD_RQ");
		    default:
		      $display("INFO: SPC2WBM: ERROR!!! Request of Type Unknown"
			      );
		  endcase
		  $display("INFO: SPC2WBM: Address is %X", spc2wbm_addr);
		  $display("INFO: SPC2WBM: Data is %X", spc2wbm_data);
                   // synopsys translate_on
		end
		state <= 4'd4;
	      end
	      else if (state == 4'd4) begin
		dc_dir_wen <= 0;
		ic_dir_wen <= 0;
		if (wbm_ack_i == 1) begin
		  dir_rd_en <= 1;
		  if (spc2wbm_atomic == 0) begin
		    wbm_cycle_o <= 0;
		  end
		  wbm_strobe_o <= 0;
		  wbm_we_o <= 0;
		  wbm_addr_o <= 64'b0;
		  wbm_data_o <= 64'b0;
		  wbm_sel_o <= 8'b0;
		  wbm2spc_valid <= 1;
		  case (spc2wbm_type)
		    5'b10000: begin
		      wbm2spc_type <= 4'b1;
		      wbm2spc_way_valid <= (|dc_dir_hit);
		      wbm2spc_way <= dc_dir_hit_way_enc;
		      wbm2spc_atomic <= 0;
		      val_dc <= 0;
		      if (|dc_dir_hit) begin
			dc_dir_wen <= dc_dir_hit;
			val_dc <= 0;
		      end
		    end
		    5'b00111: begin
		      $display("%t, SWAP %x", $time, spc_packetin_w);
		      wbm2spc_type <= 4'b0;
		      wbm2spc_atomic <= 1;
		    end
		    5'b0: begin
		      wbm2spc_atomic <= 0;
		      if (spc2wbm_addr[39]) begin
			wbm2spc_type <= 4'd8;
		      end
		      else
			begin
			  wbm2spc_pfl <= spc2wbm_packet[115];
			  wbm2spc_type <= 4'b0;
			  wbm2spc_way_valid <= (|ic_dir_hit);
			  wbm2spc_way <= ic_dir_hit_way_enc[2:1];
			  wbm2spc_boot_fetch <= ic_dir_hit_way_enc[0];
			  if (|ic_dir_hit) begin
			    ic_dir_wen <= ((|ic_dir_hit[3:0]) ? {1'b0, 
				    ic_dir_hit[3:0]} : {1'b1, ic_dir_hit[7:4]});
			    val_ic <= 0;
			  end
			end
		    end
		    5'b01000: begin
		      wbm2spc_type <= 4'd5;
		      wbm2spc_atomic <= spc2wbm_atomic;
		    end
		    5'b1: begin
		      wbm2spc_type <= 4'd4;
		      wbm2spc_atomic <= spc2wbm_atomic;
		    end
		    5'b00010: begin
		      wbm2spc_type <= 4'b0;
		      wbm2spc_atomic <= 1'b1;
		    end
		    5'b00011: begin
		      wbm2spc_type <= 4'd4;
		      wbm2spc_atomic <= 1'b1;
		    end
		  endcase
		  wbm2spc_miss <= 0;
		  wbm2spc_error <= 0;
		  wbm2spc_nc <= spc2wbm_nc;
		  wbm2spc_thread <= spc2wbm_thread;
		  if (spc2wbm_addr[39]) begin
		    if (spc2wbm_region == 5'b10000) begin
		      wbm2spc_boot_fetch <= 1;
		    end
		    else begin
		      wbm2spc_boot_fetch <= 0;
		    end
		  end
		  if ((spc2wbm_type == 5'b1) || (spc2wbm_type == 5'b00011)) 
			  begin
		    wbm2spc_data[125] <= spc2wbm_packet[114];
		    wbm2spc_data[63:0] <= spc2wbm_data[63:0];
		    if (|ic_dir_hit) begin
		      wbm2spc_data[67:64] <= {ic_dir_hit_way_enc, 1'b1};
		      ic_dir_wen <= ((|ic_dir_hit[3:0]) ? {1'b0, ic_dir_hit[3:0]
			      } : {1'b1, ic_dir_hit[7:4]});
		      val_ic <= 0;
                      wbm2spc_data[116:112] <= spc2wbm_addr[10:6];
                      wbm2spc_data[122:121] <= spc2wbm_addr[5:4];
                      wbm2spc_data[104] <= spc2wbm_addr[3];
                      wbm2spc_data[103:96] <= spc2wbm_size[7:0];
		    end
		    if (|dc_dir_hit) begin
		      wbm2spc_data[116:112] <= spc2wbm_addr[10:6];
		      wbm2spc_data[122:121] <= spc2wbm_addr[5:4];
		      wbm2spc_data[104] <= spc2wbm_addr[3];
		      wbm2spc_data[103:96] <= spc2wbm_size[7:0];
		      wbm2spc_data[67:64] <= {dc_dir_hit_way_enc, 2'b10};
		      if (spc2wbm_type == 5'b00011) begin
			dc_dir_wen <= dc_dir_hit;
			val_dc <= 0;
		      end
		    end
		  end
		  else
		    begin //DW FIX FIX for mpgen problem
		      if ((spc2wbm_addr[3] == 0) || (spc2wbm_addr[39] == 0 && spc2wbm_type != 5'b00111))
			      begin
			 wbm2spc_data <= {wbm_data_i, 64'b0};
		      end
		      else begin
			wbm2spc_data <= {64'b0, wbm_data_i};
		      end
		    end
		  if (((((spc2wbm_type == 5'b10000) && (spc2wbm_region != 
			  5'b10000)) || (spc2wbm_type == 5'b01000)) || (
			  spc2wbm_type == 5'b00010)) || ((spc2wbm_type == 5'b0) 
			  && ((spc2wbm_size == 3'd7) || (spc2wbm_addr[39] == 0))
			  )) begin
		    state <= 4'd5;
		  end
		  else if (spc2wbm_type == 5'b00111) begin
		    state <= 4'd9;
		    $display("%t, SWAP 2  %x", $time, spc_packetin_w);
		  end
		  else begin
		    state <= 4'b1011;
		  end
		end
		else begin
		  state <= 4'd4;
		end
	      end
	      else if (state == 4'd5) begin
		dir_rd_en <= 0;
		dc_dir_wen <= 0;
		ic_dir_wen <= 0;
		wbm_cycle_o <= 1;
		wbm_strobe_o <= 1;
		wbm_we_o <= 0;
		wbm_addr_o <= {spc2wbm_region, 19'b0, spc2wbm_addr[(103 -
			64):4], 4'd8};
		wbm_data_o <= 64'b0;
		wbm_sel_o <= 8'b11111111;
		state <= 4'd6;
	      end
	      else if (state == 4'd6) begin
		if (wbm_ack_i == 1) begin
		  if (spc2wbm_atomic == 0) begin
		    wbm_cycle_o <= 0;
		  end
		  wbm_strobe_o <= 0;
		  wbm_we_o <= 0;
		  wbm_addr_o <= 64'b0;
		  wbm_data_o <= 64'b0;
		  wbm_sel_o <= 8'b0;
		  wbm2spc_data[63:0] <= wbm_data_i;
		  if ((spc2wbm_type == 5'b10000) && (spc2wbm_region != 5'b10000)
			  ) begin
		    state <= 4'd7;
		  end
		  else begin
		    state <= 4'b1011;
		  end
		end
		else begin
		  state <= 4'd6;
		end
	      end
	      else if (state == 4'd7) begin
		spc2wbm_addr_subword <= 2'b1;
		spc_packetin_w <= wbm2spc_packet;
		wbm_cycle_o <= 1;
		wbm_strobe_o <= 1;
		wbm_we_o <= 0;
		dir_rd_en <= 1;
		wbm_addr_o <= {spc2wbm_region, 19'b0, spc2wbm_addr[(103 -
			64):5], 5'b10000};
		wbm_data_o <= 64'b0;
		wbm_sel_o <= 8'b11111111;
		// synopsys translate_off
		case (wbm2spc_type)
		  4'b1:
		    $display("INFO: WBM2SPC: Return Packet of Type IFILL_RET");
		  4'b0:
		    $display("INFO: WBM2SPC: Return Packet of Type LOAD_RET");
		  4'd5:
		    $display("INFO: WBM2SPC: Return Packet of Type MMU_RET");
		  4'd4:
		    $display("INFO: WBM2SPC: Return Packet of Type ST_ACK");
		  default:
		    $display("INFO: WBM2SPC: Return Packet of Type Unknown");
		endcase
		$display("INFO: WBM2SPC: Data is %X", wbm2spc_data);
		// synopsys translate_on
		state <= 4'd8;
	      end
	      else if (state == 4'd8) begin
		if (|dc_dir_hit) begin
		  dc_dir_wen <= dc_dir_hit;
		  val_dc <= 0;
		end
		wbm2spc_way_valid <= (|dc_dir_hit);
		wbm2spc_way <= dc_dir_hit_way_enc;
		spc_ready_o <= 0;
		if (wbm_ack_i == 1) begin
		  if (spc2wbm_atomic == 0) begin
		    wbm_cycle_o <= 0;
		  end
		  wbm_strobe_o <= 0;
		  wbm_we_o <= 0;
		  wbm_addr_o <= 64'b0;
		  wbm_data_o <= 64'b0;
		  wbm_sel_o <= 8'b0;
		  wbm2spc_data <= {wbm_data_i, 64'b0};
		  wbm2spc_way_valid <= (|dc_dir_hit);
		  wbm2spc_way <= dc_dir_hit_way_enc;
		  dir_rd_en <= 1;
		  state <= 4'd9;
		end
		else begin
		  state <= 4'd8;
		end
	      end
	      else if (state == 4'd9) begin
		wbm_cycle_o <= 1;
		wbm_strobe_o <= 1;
		if (spc2wbm_type == 5'b00111) begin
		  $display("%t, SWAP 3  %x", $time, spc_packetin_w);
		  spc_ready_o <= 1;
		  spc_packetin_w <= wbm2spc_packet;
		  wbm_we_o <= 1;
		  wbm_data_o <= spc2wbm_data;
		  wbm_sel_o <= spc2wbm_size;
		  wbm_addr_o <= {spc2wbm_region, 19'b0, spc2wbm_addr[(103 -
			  64):0]};
		  dir_rd_en <= 1;
		end
		else
		  begin
		    wbm_we_o <= 0;
		    wbm_sel_o <= 8'b11111111;
		    wbm_addr_o <= {spc2wbm_region, 19'b0, spc2wbm_addr[(103 -
			    64):5], 5'b11000};
		    wbm_data_o <= 64'b0;
		  end
		state <= 4'd10;
	      end
	      else if (state == 4'd10) begin
		spc_ready_o <= 0;
		if (wbm_ack_i == 1) begin
		  if (spc2wbm_atomic == 0) begin
		    wbm_cycle_o <= 0;
		  end
		  wbm_strobe_o <= 0;
		  wbm_we_o <= 0;
		  wbm_addr_o <= 64'b0;
		  wbm_data_o <= 64'b0;
		  wbm_sel_o <= 8'b0;
		  if (spc2wbm_type == 5'b00111) begin
		    wbm2spc_data[127:64] <= 64'b0;
		    wbm2spc_atomic <= 1;
		    wbm2spc_type <= 4'd4;
		    wbm2spc_data[63:0] <= spc2wbm_data[63:0];
		    if (|ic_dir_hit) begin
		      wbm2spc_data[67:64] <= {ic_dir_hit_way_enc, 1'b1};
		      ic_dir_wen <= ((|ic_dir_hit[3:0]) ? {1'b0, ic_dir_hit[3:0]
			      } : {1'b1, ic_dir_hit[7:4]});
		      val_ic <= 0;
		    end
		    if (|dc_dir_hit) begin
		      wbm2spc_data[116:112] <= spc2wbm_addr[10:6];
		      wbm2spc_data[122:121] <= spc2wbm_addr[5:4];
		      wbm2spc_data[104] <= spc2wbm_addr[3];
		      wbm2spc_data[103:96] <= spc2wbm_size[7:0];
		      wbm2spc_data[67:64] <= {dc_dir_hit_way_enc, 2'b10};
		    end
		  end
		  else
		    begin
		      spc_ready_o <= 1;
		      wbm2spc_atomic <= 1;
		      wbm2spc_data[63:0] <= wbm_data_i;
		    end
		  state <= 4'b1011;
		end
		else begin
		  state <= 4'd10;
		end
	      end
	      else if (state == 4'b1011) begin
		if (spc2wbm_type == 5'b00010) begin
		  if (((wbm2spc_data[63:0] & wbm_sel_o_bytemask) == (
			  spc2wbm_data[63:0] & wbm_sel_o_bytemask)) & 
			  spc2wbm_addr[3]) begin
		    cas1_matched <= 1'b1;
		  end
		  else if (((wbm2spc_data[127:64] & wbm_sel_o_bytemask) == (
			  spc2wbm_data[63:0] & wbm_sel_o_bytemask)) & (~
			  spc2wbm_addr[3])) begin
		    cas1_matched <= 1'b1;
		  end
		  else
		    begin
		      $display("%t, CAS failed pa:%x Act:%x Exp:%x Mask:%x", 
			      $time, spc2wbm_addr, wbm_data_i, spc2wbm_data, 
			      wbm_sel_o_bytemask);
		      cas1_matched <= 1'b0;
		    end
		end
		dir_rd_en <= 0;
		dc_dir_wen <= 0;
		ic_dir_wen <= 0;
		spc_ready_o <= 1;
		spc_packetin_w <= wbm2spc_packet;
		state <= 4'b1;
	      end
	    end
	end
endmodule
