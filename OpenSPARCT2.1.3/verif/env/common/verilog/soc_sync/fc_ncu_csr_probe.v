// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fc_ncu_csr_probe.v
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
`include "fc.vh"
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"



`define NIU_UCB `CPU.rdp.niu_pio_ucb
`define NIU_PIO `CPU.rdp.niu_pio

`timescale 1 ps/ 1 ps

module fc_ncu_csr_probe;
 //array to store snooped address
 reg [48:0] snoop_address [0:63];

 //------------------------------
 // PCX packet

  wire                     ncu_pcx_valid;
  wire              [39:0] ncu_pcx_pa;
  wire               [2:0] ncu_pcx_cid;
  wire               [2:0] ncu_pcx_tid;
  wire               [5:0] ncu_pcx_tnum;
  wire               [4:0] ncu_pcx_typ;
  wire               [7:0] ncu_pcx_size;
  wire                     ncu_clk;

  integer             ncu_csr;

  assign  ncu_pcx_typ   = `CPU.ncu.ncu_fcd_ctl.ncu_c2ifcd_ctl.ncu_c2ifd_ctl.pcx_ncu_data[`PCX_RQTYP];
  assign  ncu_pcx_pa    = `CPU.ncu.ncu_fcd_ctl.ncu_c2ifcd_ctl.ncu_c2ifd_ctl.pcx_ncu_data[`PCX_ADDR];
  assign  ncu_pcx_size  = `CPU.ncu.ncu_fcd_ctl.ncu_c2ifcd_ctl.ncu_c2ifd_ctl.pcx_ncu_data[`PCX_SIZE];
  assign  ncu_pcx_cid   = `CPU.ncu.ncu_fcd_ctl.ncu_c2ifcd_ctl.ncu_c2ifd_ctl.pcx_ncu_data[`PCX_CID];
  assign  ncu_pcx_tid   = `CPU.ncu.ncu_fcd_ctl.ncu_c2ifcd_ctl.ncu_c2ifd_ctl.pcx_ncu_data[`PCX_TID];
  assign  ncu_pcx_tnum  = {ncu_pcx_cid,ncu_pcx_tid};
  assign  ncu_pcx_valid = `CPU.ncu.ncu_fcd_ctl.ncu_c2ifcd_ctl.ncu_c2ifd_ctl.pcx_ncu_vld &&
                          `CPU.ncu.ncu_fcd_ctl.ncu_c2ifcd_ctl.ncu_c2ifc_ctl.pcx_ncu_data_rdy;
  assign  #1 ncu_clk       = `CPU.ncu.gclk;

//When a valid packet to NCU space is snooped it gets recorded into the array

  always @(negedge ncu_clk) begin // {
    if( ncu_pcx_valid && (ncu_pcx_typ == 5'b00000)) begin // {
       // a PIO read to NCU status registers gets recorded in the array
       if ((ncu_pcx_pa[39:32] == 8'h80) || (ncu_pcx_pa[39:32] == 8'h90)) begin // {
          snoop_address[ncu_pcx_tnum[5:0]] <= {1'b1,ncu_pcx_pa[39:0]};
       end // }
       // a PIO read to RST status registers gets recorded in the array
       else if ((ncu_pcx_pa[39:0] == 40'h89_00000808)||(ncu_pcx_pa[39:0] == 40'h89_00000810)||
		(ncu_pcx_pa[39:0] == 40'h89_00000818)||(ncu_pcx_pa[39:0] == 40'h89_00000838))
       begin // {
          snoop_address[ncu_pcx_tnum[5:0]] <= {1'b1,ncu_pcx_pa[39:0]};
       end // }
`ifdef FC_NO_PEUSAT_CODE
       // a PIO read to PEP registers gets recorded in the array
       else if (ncu_pcx_pa[39:36] == 4'hC) begin // { <= checks for PCIE PIO address
	  snoop_address[ncu_pcx_tnum[5:0]] <= {ncu_pcx_size,1'b1,ncu_pcx_pa[39:0]};
       end // }
`endif
    end // }
  end // }

//When their is a read from the iobuf then read the contents of snooped address and 
//print it out
  wire                     iobuf_cpx_valid;
  wire              [40:0] iobuf_cpx_pa;
  wire               [2:0] iobuf_cpx_cid;
  wire               [2:0] iobuf_cpx_tid;
  wire               [5:0] iobuf_cpx_tnum;
  wire              [63:0] iobuf_cpx_data;
  wire              [63:0] iobuf_cpx_data_le;
  wire               [3:0] iobuf_cpx_typ;
  wire               [7:0] iobuf_cpx_size;
  wire                     iobuf_rd_en;
  wire               [7:0] iobuf_asi;
  reg                [7:0] iobuf_pio_size;

  assign  iobuf_asi_rd        = (iobuf_cpx_pa[39:32] == 8'h90); // JTAG block

  assign  iobuf_asi_41        = (iobuf_cpx_pa[25:18] == 8'h41); 
  assign  iobuf_asi_45        = (iobuf_cpx_pa[25:18] == 8'h45);
  //assign  iobuf_asi_73        = (iobuf_cpx_pa[25:18] == 8'h73);
 
  assign  iobuf_core_available     = (iobuf_asi_rd & iobuf_asi_41 & (iobuf_cpx_pa[17:0] == 18'h0000));
  assign  iobuf_core_enable_status = (iobuf_asi_rd & iobuf_asi_41 & (iobuf_cpx_pa[17:0] == 18'h0010));
  assign  iobuf_core_enable        = (iobuf_asi_rd & iobuf_asi_41 & (iobuf_cpx_pa[17:0] == 18'h0020));
  assign  iobuf_core_xir_steering  = (iobuf_asi_rd & iobuf_asi_41 & (iobuf_cpx_pa[17:0] == 18'h0030));
  assign  iobuf_core_tick_enable   = (iobuf_asi_rd & iobuf_asi_41 & (iobuf_cpx_pa[17:0] == 18'h0038));
  assign  iobuf_core_run_rw        = (iobuf_asi_rd & iobuf_asi_41 & (iobuf_cpx_pa[17:0] == 18'h0050));
  assign  iobuf_core_run_status    = (iobuf_asi_rd & iobuf_asi_41 & (iobuf_cpx_pa[17:0] == 18'h0058));

  assign  iobuf_rst_vec_mask       = (iobuf_asi_rd & iobuf_asi_45 & (iobuf_cpx_pa[17:0] == 18'h0018));

  assign  iobuf_do_asi_read        = iobuf_core_run_status    | 
                                     iobuf_core_run_rw        |
                                     iobuf_rst_vec_mask       ;                          

  assign  iobuf_do_not_follow      = iobuf_core_available     | // rw registers riesling can handle
                        	     iobuf_core_enable_status |
                                     iobuf_core_enable        |
                                     iobuf_core_xir_steering  |
                        	     iobuf_core_tick_enable   ;                          

  assign  iobuf_asi       = iobuf_cpx_pa[25:18];

  assign  iobuf_cpx_cid   = convert_onehot(`CPU.ncu.ncu_fcd_ctl.ncu_i2cfcd_ctl.ncu_i2cfd_ctl.iobuf_dout_muxed[153:146]); 
  assign  iobuf_cpx_tid   = `CPU.ncu.ncu_fcd_ctl.ncu_i2cfcd_ctl.ncu_i2cfd_ctl.iobuf_dout_muxed[`CPX_TID]; 
  assign  iobuf_cpx_valid = `CPU.ncu.ncu_fcd_ctl.ncu_i2cfcd_ctl.ncu_i2cfd_ctl.iobuf_dout_muxed[`CPX_VALID]; 
  assign  iobuf_cpx_tnum  = {iobuf_cpx_cid, iobuf_cpx_tid};
  assign  iobuf_cpx_typ   = `CPU.ncu.ncu_fcd_ctl.ncu_i2cfcd_ctl.ncu_i2cfd_ctl.iobuf_dout_muxed[`CPX_RTNTYP];
  assign  iobuf_cpx_data  = `CPU.ncu.ncu_fcd_ctl.ncu_i2cfcd_ctl.ncu_i2cfd_ctl.iobuf_dout_muxed[63:0];
  assign  iobuf_cpx_pa    = snoop_address[iobuf_cpx_tnum];
  assign  iobuf_cpx_size  = snoop_address[iobuf_cpx_tnum] >> 41;
  assign  iobuf_rd_en     = `CPU.ncu.ncu_fcd_ctl.ncu_i2cfcd_ctl.ncu_i2cfd_ctl.iobuf_rd;
   
  // accesses to PEP PIO regs are little endian, and 4 byte len, so reverse the data
  assign  iobuf_cpx_data_le = {iobuf_cpx_data[7:0],iobuf_cpx_data[15:8],iobuf_cpx_data[23:16],iobuf_cpx_data[31:24],
			       iobuf_cpx_data[39:32],iobuf_cpx_data[47:40],iobuf_cpx_data[55:48],iobuf_cpx_data[63:56]
 		              };

  always @(negedge ncu_clk) begin // {
     if( iobuf_rd_en && iobuf_cpx_valid && (iobuf_cpx_typ == 4'b1000) && (iobuf_cpx_pa[40] == 1'b1)) begin // {
`ifdef FC_NO_PEUSAT_CODE
        if (iobuf_cpx_pa[39:36] == 4'hC) begin // { <= check for PCIE PIO address
	   if (`PARGS.nas_check_on ) begin // {
	      iobuf_pio_size = (iobuf_cpx_size == 8'h00) ? 8'h01 :
			       (iobuf_cpx_size == 8'h01) ? 8'h02 :
			       (iobuf_cpx_size == 8'h02) ? 8'h04 :
			       (iobuf_cpx_size == 8'h03) ? 8'h08 : 8'h10;
	      
	      // send big endian data to Riesling, but account for some little
	      // endian ordering in the data coming back.
	      // review: this currently only handles 4 byte loads, so you need to
	      //        add handling of 1 and 2 byte loads. 
	      if ((iobuf_pio_size==4) && (iobuf_cpx_pa[2])) begin // {
		 `PR_NORMAL ("ncu_csr_probe", `NORMAL, 
			     "   PLI_PIO_READ       pa=%h data=%0h sz=%0h     ts=%0d (PEP PIO RD RTN)",
			     iobuf_cpx_pa[39:0], iobuf_cpx_data, iobuf_pio_size, `TOP.core_cycle_cnt-1);
      		 ncu_csr = $sim_send(`PLI_PIO_READ, {24'b0,iobuf_cpx_pa[39:0]}, iobuf_cpx_data, 8'h0, iobuf_pio_size);
	      end  // }
	      else begin // {
		 `PR_NORMAL ("ncu_csr_probe", `NORMAL, 
			     "   PLI_PIO_READ       pa=%h data=%0h sz=%0h     ts=%0d (PEP PIO RD RTN)",
			     iobuf_cpx_pa[39:0], iobuf_cpx_data, iobuf_pio_size, `TOP.core_cycle_cnt-1);
      		 ncu_csr = $sim_send(`PLI_PIO_READ, {24'b0,iobuf_cpx_pa[39:0]}, {32'b0,iobuf_cpx_data[63:32]}, 8'h0, iobuf_pio_size);
	      end  // }

           end // }
	end  // }
	else
`endif
	  begin // {
	   if (`PARGS.nas_check_on ) begin // {
	      if(iobuf_do_not_follow) begin // {
	      end  // }
	      else if(iobuf_do_asi_read) begin // {
		 `PR_NORMAL ("ncu_csr_probe", `NORMAL, 
			     "   PLI_ASI_READ       asi=%h va=%h tid=%02h data=%0h",
			     iobuf_asi, iobuf_cpx_pa[17:0], iobuf_cpx_data, iobuf_cpx_tnum);
                 ncu_csr = $sim_send(`PLI_ASI_READ, iobuf_cpx_tnum, iobuf_asi, {46'b0,iobuf_cpx_pa[17:0]}, iobuf_cpx_data);
	      end  // }
	      else begin // {
		 `PR_NORMAL ("ncu_csr_probe", `NORMAL, 
			     "   PLI_CSR_READ       pa=%h data=%0h tid=%02h ts=%0d",
			     iobuf_cpx_pa[39:0], iobuf_cpx_data, iobuf_cpx_tnum, `TOP.core_cycle_cnt-1);
      		 ncu_csr = $sim_send(`PLI_CSR_READ, {24'b0,iobuf_cpx_pa[39:0]}, iobuf_cpx_data, 8'h0);
	      end // }
           end // }
	end // }
        @(posedge ncu_clk)
        snoop_address[iobuf_cpx_tnum[5:0]] <= 64'b0;
     end // }
  end // }

//When their is a read from the iobuf then read the contents of snooped address and 
//print it out
  wire                     intbuf_cpx_valid;
  wire              [40:0] intbuf_cpx_pa;
  wire               [2:0] intbuf_cpx_cid;
  wire               [2:0] intbuf_cpx_tid;
  wire               [5:0] intbuf_cpx_tnum;
  wire              [63:0] intbuf_cpx_data;
  wire               [3:0] intbuf_cpx_typ;
  wire                     intbuf_rd_en;

  assign  intbuf_cpx_cid   = convert_onehot(`CPU.ncu.ncu_fcd_ctl.ncu_i2cfcd_ctl.ncu_i2cfd_ctl.intbuf_dout_muxed[153:146]); 
  assign  intbuf_cpx_tid   = `CPU.ncu.ncu_fcd_ctl.ncu_i2cfcd_ctl.ncu_i2cfd_ctl.intbuf_dout_muxed[`CPX_TID]; 
  assign  intbuf_cpx_valid = `CPU.ncu.ncu_fcd_ctl.ncu_i2cfcd_ctl.ncu_i2cfd_ctl.intbuf_dout_muxed[`CPX_VALID]; 
  assign  intbuf_cpx_tnum  = {intbuf_cpx_cid, intbuf_cpx_tid};
  assign  intbuf_cpx_typ   = `CPU.ncu.ncu_fcd_ctl.ncu_i2cfcd_ctl.ncu_i2cfd_ctl.intbuf_dout_muxed[`CPX_RTNTYP];
  assign  intbuf_cpx_data  = `CPU.ncu.ncu_fcd_ctl.ncu_i2cfcd_ctl.ncu_i2cfd_ctl.intbuf_dout_muxed[63:0];
  assign  intbuf_cpx_pa    = snoop_address[intbuf_cpx_tnum];
  assign  intbuf_rd_en     = `CPU.ncu.ncu_fcd_ctl.ncu_i2cfcd_ctl.ncu_i2cfd_ctl.intbuf_rd;

  always @(negedge ncu_clk) begin
     if( intbuf_rd_en && intbuf_cpx_valid && (intbuf_cpx_typ == 4'b1000) && (intbuf_cpx_pa[40] == 1'b1)) begin
        `PR_INFO ("ncu_csr_probe", `INFO, "ts=%0d NIU CSR READ RETURN:  address %x  data %x ",
        `TOP.core_cycle_cnt-1, intbuf_cpx_pa, intbuf_cpx_data[63:0]  );
	if (`PARGS.nas_check_on )  begin
      	   ncu_csr = $sim_send(`PLI_CSR_READ, {24'b0,intbuf_cpx_pa[39:0]}, intbuf_cpx_data, 8'h0);
        end
        @(posedge ncu_clk)
        snoop_address[intbuf_cpx_tnum[5:0]] <= 64'b0;
     end
  end

//----------------------------------------------------------
function [2:0] convert_onehot;
  input [7:0] one_hot;

  begin
    case (one_hot)
      8'h1:  convert_onehot = 3'b000;
      8'h2:  convert_onehot = 3'b001;
      8'h4:  convert_onehot = 3'b010;
      8'h8:  convert_onehot = 3'b011;
      8'h10: convert_onehot = 3'b100;
      8'h20: convert_onehot = 3'b101;
      8'h40: convert_onehot = 3'b110;
      8'h80: convert_onehot = 3'b111;
    endcase
  end
endfunction
//----------------------------------------------------------

endmodule // fc_niu_csr_probe
