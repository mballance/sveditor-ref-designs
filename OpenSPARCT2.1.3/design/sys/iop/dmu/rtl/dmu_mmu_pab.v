// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_pab.v
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
module dmu_mmu_pab 
  (
   clk,				// clock
   rst_l,			// reset
   csr2pab_ps,			// csr page size
   tcb2pab_err,			// tcb error
   tcb2pab_sel,			// tcb select
   tdb2pab_par,			// tdb parity
   tdb2pab_ppn,			// tdb pyhsical page number
   tdb2pab_wrt,			// tdb write
   tdb2pab_vld,			// tdb valid
   tdb2pab_keyvld,              // pab key valid
   tdb2pab_fnm,                 // pab function number
   tdb2pab_key,                 // pab key
   tlb2pab_addr,		// tlb address
   tlb2pab_type,		// tlb type
   tlb2pab_vld,			// tlb valid
   tlb2pab_wrt,			// tlb write
   pab2paq_rcd,			// paq physical address record
   pab2tcb_err,			// tcb error
   tlb2pab_sun4v_pgsz,		// sun4v page size to concat pa offset
   sun4v_mode,			// sun4v mode
   tlb2pab_byp_ps2		// 1 if sun4v mode and bypass detected
   );

// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------
  parameter	PAM    = `FIRE_PA_MSB;	// physical address MSB = 42
  parameter	PAM_N2 = `N2_PA_MSB;	// physical address MSB = 38

  parameter	MEM_RDT = 7'b0000000,	// type encodings
		MEM_RDB = 7'b0100000,
		MEM_WRT = 7'b1000000,
		MEM_WRB = 7'b1100000,
		MSG_WRT = 7'b1010000,
		MSG_WRB = 7'b1110000,
		MSI_WRT = 7'b1011000,
		MSI_WRB = 7'b1111000;

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input					clk;
  input 				rst_l;

  input 				csr2pab_ps;
  input 				tcb2pab_err;
  input 				tcb2pab_sel;
  input  [`FIRE_DLC_MMU_TDD_PAR_BITS]	tdb2pab_par;
  input  [`FIRE_DLC_MMU_TDD_PPN_BITS]	tdb2pab_ppn;
  input 				tdb2pab_wrt;
  input 				tdb2pab_vld;
  input  [`FIRE_DLC_MMU_PA_ADDR_BITS]	tlb2pab_addr;
  input  [`FIRE_DLC_MMU_PA_TYPE_BITS]	tlb2pab_type;
  input 				tlb2pab_vld;
  input 				tlb2pab_wrt;
  input [`FIRE_DLC_MMU_TDD_KEY_BITS]   tdb2pab_key;
  input [`FIRE_DLC_MMU_TDD_FNM_BITS]   tdb2pab_fnm;
  input                                tdb2pab_keyvld;
  output [`FIRE_DLC_MMU_PAR_BITS]	pab2paq_rcd;
  output [`FIRE_DLC_MMU_PAB_ERR_BITS]	pab2tcb_err;
  input [2:0]				tlb2pab_sun4v_pgsz;
  input 				sun4v_mode;
  input 				tlb2pab_byp_ps2;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire [`FIRE_DLC_MMU_PAR_BITS]		pab2paq_rcd;
  reg [`FIRE_DLC_MMU_PA_ADDR_BITS]	addr_ps2;
  wire [3:0]				dpe, par;
  wire [1:0] 				sel;
  reg  [25:0]				sun4v_pab_addr;

  reg  [`FIRE_DLC_MMU_PAB_ERR_BITS]	pab2tcb_err;
  reg  [`FIRE_DLC_MMU_PA_ADDR_BITS]	addr_ps3;
  reg  [`FIRE_DLC_MMU_PA_TYPE_BITS]	type_ps3;
  reg					aerr_ps3;
  reg					dok, vok, wok;

// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------
//BP N2 comment out until new tdb ram parity is finalized
// // 0in odd_parity -var {tdb2pab_ppn[PAM:PAM-7], tdb2pab_par[`FIRE_DLC_MMU_TDD_PAR_LSB+3]} -active ~tcb2pab_sel
//  // 0in odd_parity -var {tdb2pab_ppn[PAM-8:PAM-15], tdb2pab_par[`FIRE_DLC_MMU_TDD_PAR_LSB+2]} -active ~tcb2pab_sel
//  // 0in odd_parity -var {tdb2pab_ppn[PAM-16:PAM-23], tdb2pab_par[`FIRE_DLC_MMU_TDD_PAR_LSB+1]} -active ~tcb2pab_sel
//  // 0in odd_parity -var {tdb2pab_ppn[PAM-24:13], tdb2pab_vld, tdb2pab_wrt, tdb2pab_par[`FIRE_DLC_MMU_TDD_PAR_LSB]} -active ~tcb2pab_sel

// 0in odd_parity -var {tdb2pab_key[`FIRE_DLC_MMU_TDD_KEY_MSB:`FIRE_DLC_MMU_TDD_KEY_LSB+4], tdb2pab_par[`FIRE_DLC_MMU_TDD_PAR_LSB+3]} -active ~tcb2pab_sel
// 0in odd_parity -var {tdb2pab_key[`FIRE_DLC_MMU_TDD_KEY_LSB+3:`FIRE_DLC_MMU_TDD_KEY_LSB],tdb2pab_ppn[`FIRE_DLC_MMU_TDD_PPN_MSB:`FIRE_DLC_MMU_TDD_PPN_MSB-7], tdb2pab_par[`FIRE_DLC_MMU_TDD_PAR_LSB+2]} -active ~tcb2pab_sel
// 0in odd_parity -var {tdb2pab_ppn[`FIRE_DLC_MMU_TDD_PPN_MSB-8:`FIRE_DLC_MMU_TDD_PPN_LSB+6], tdb2pab_par[`FIRE_DLC_MMU_TDD_PAR_LSB+1]} -active ~tcb2pab_sel
// 0in odd_parity -var {tdb2pab_ppn[`FIRE_DLC_MMU_TDD_PPN_LSB+5:`FIRE_DLC_MMU_TDD_PPN_LSB],tdb2pab_fnm,tdb2pab_keyvld,tdb2pab_wrt,tdb2pab_vld, tdb2pab_par[`FIRE_DLC_MMU_TDD_PAR_LSB] } -active ~tcb2pab_sel

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------

// physical address record creation
  assign pab2paq_rcd[`FIRE_DLC_MMU_PAR_ADDR_BITS] = addr_ps3;
  assign pab2paq_rcd[`FIRE_DLC_MMU_PAR_AERR_BITS] = aerr_ps3;
  assign pab2paq_rcd[`FIRE_DLC_MMU_PAR_TYPE_BITS] = type_ps3;

// errors
  always @ (dok or wok or vok) begin
    case ({dok, wok, vok})  // synopsys parallel_case
      3'b000 : pab2tcb_err = 3'b100;
      3'b001 : pab2tcb_err = 3'b100;
      3'b010 : pab2tcb_err = 3'b100;
      3'b011 : pab2tcb_err = 3'b100;
      3'b100 : pab2tcb_err = 3'b001;
      3'b101 : pab2tcb_err = 3'b010;
      3'b110 : pab2tcb_err = 3'b001;
      3'b111 : pab2tcb_err = 3'b000;
    endcase
  end

// parity
//  assign par[3] = ^tdb2pab_ppn[PAM:PAM-7];
//  assign par[2] = ^tdb2pab_ppn[PAM-8:PAM-15];
//  assign par[1] = ^tdb2pab_ppn[PAM-16:PAM-23];
//  assign par[0] = ^tdb2pab_ppn[PAM-24:13] ^ tdb2pab_vld ^ tdb2pab_wrt;

    assign par[3] = ^{tdb2pab_key[`FIRE_DLC_MMU_TDD_KEY_MSB:`FIRE_DLC_MMU_TDD_KEY_LSB+4]};
    assign par[2] = ^{tdb2pab_key[`FIRE_DLC_MMU_TDD_KEY_LSB+3:`FIRE_DLC_MMU_TDD_KEY_LSB],tdb2pab_ppn[`FIRE_DLC_MMU_TDD_PPN_MSB:`FIRE_DLC_MMU_TDD_PPN_MSB-7]};
    assign par[1] = ^tdb2pab_ppn[`FIRE_DLC_MMU_TDD_PPN_MSB-8:`FIRE_DLC_MMU_TDD_PPN_LSB+6];
    assign par[0] = ^{tdb2pab_ppn[`FIRE_DLC_MMU_TDD_PPN_LSB+5:`FIRE_DLC_MMU_TDD_PPN_LSB],tdb2pab_fnm,tdb2pab_keyvld,tdb2pab_wrt,tdb2pab_vld};

// data parity errors
  assign dpe[3] = ~par[3] ^ tdb2pab_par[`FIRE_DLC_MMU_TDD_PAR_LSB+3];
  assign dpe[2] = ~par[2] ^ tdb2pab_par[`FIRE_DLC_MMU_TDD_PAR_LSB+2];
  assign dpe[1] = ~par[1] ^ tdb2pab_par[`FIRE_DLC_MMU_TDD_PAR_LSB+1];
  assign dpe[0] = ~par[0] ^ tdb2pab_par[`FIRE_DLC_MMU_TDD_PAR_LSB];

// select data, write, and valid
//BP N2 fix after parity is done in tdb ram 8-26-04
  wire	 dat = tcb2pab_sel | ~(|dpe);
//  wire	 dat = tcb2pab_sel ;
  wire	 wrt = tcb2pab_sel ? tlb2pab_wrt : tdb2pab_wrt;
  wire	 vld = tcb2pab_sel ? tlb2pab_vld : tdb2pab_vld;

// select based upon page size
  assign sel[1] = tcb2pab_sel;
  assign sel[0] = tcb2pab_sel | csr2pab_ps;

// physical address
//BP 9-29-05   assign addr_ps2[PAM:16] = sel[1] ? tlb2pab_addr[PAM:16] : {{4{1'b0}},tdb2pab_ppn[PAM_N2:16]};
//BP 9-29-05   assign addr_ps2[15:13]  = sel[0] ? tlb2pab_addr[15:13]  : tdb2pab_ppn[15:13];
//BP 9-29-05   assign addr_ps2[12:2]   = tlb2pab_addr[12:2];
//BP 9-29-05 sun4v requires 4 page sizes
always @(sun4v_mode or tlb2pab_addr or sel or tdb2pab_ppn or sun4v_pab_addr  ) begin

        if (!sun4v_mode) begin
        addr_ps2[PAM:16] = sel[1] ? tlb2pab_addr[PAM:16] :
                                                {{4{1'b0}},tdb2pab_ppn[PAM_N2:16]};
        addr_ps2[15:13] = (sel[0] ) ? tlb2pab_addr[15:13] : tdb2pab_ppn[15:13];
        addr_ps2[12:2] = tlb2pab_addr[12:2];
        end
        else begin
        addr_ps2[PAM:2] = {{4{1'b0}},sun4v_pab_addr[25:0],tlb2pab_addr[12:2]};
        end
end
//BP 9-29-05 this logic switches between the tlb data(pipeline or tablewalk)
//	 and the tdb pa value
always @(tlb2pab_sun4v_pgsz or tlb2pab_addr or tdb2pab_ppn or sel  ) begin

        sun4v_pab_addr[25:0] = {26{1'b0}};              // PAM=42,`N2_PA_MSB=38

        case(tlb2pab_sun4v_pgsz)
        3'b000: if (sel[1]) sun4v_pab_addr   =  tlb2pab_addr[`N2_PA_MSB:13];      // 8k pages
                        else sun4v_pab_addr  =  tdb2pab_ppn[`N2_PA_MSB:13];
        3'b001: if (sel[1]) sun4v_pab_addr   =  tlb2pab_addr[`N2_PA_MSB:13];      // 64k pages
                        else sun4v_pab_addr  =  {tdb2pab_ppn[`N2_PA_MSB:16],tlb2pab_addr[15:13]};
        3'b010: sun4v_pab_addr    =       {26{1'b0}};                   // invalid
        3'b011: if (sel[1]) sun4v_pab_addr   =  tlb2pab_addr[`N2_PA_MSB:13];      // 4M pages
                        else sun4v_pab_addr  =  {tdb2pab_ppn[`N2_PA_MSB:22],tlb2pab_addr[21:13]};
        3'b100: sun4v_pab_addr    =       {26{1'b0}};                   // invalid
        3'b101: if (sel[1]) sun4v_pab_addr   =  tlb2pab_addr[`N2_PA_MSB:13];      // 256M pages
                        else sun4v_pab_addr  =  {tdb2pab_ppn[`N2_PA_MSB:28],tlb2pab_addr[27:13]};
        3'b110: sun4v_pab_addr    =       {26{1'b0}};                   // invalid
        3'b111: sun4v_pab_addr    =       {26{1'b0}};                   // invalid
        default:        sun4v_pab_addr = {26{1'b0}};
        endcase
end






// address error
  wire	 aerr_ps2 = tcb2pab_err;

//BP n2 12-14-05 fire assumed all 64 bit address were bypass , n2 needs
//	to add 64 bit translation also
// data ok
  always @ (tlb2pab_type or dat or sun4v_mode or tlb2pab_byp_ps2) begin
    case ({tlb2pab_byp_ps2,sun4v_mode,tlb2pab_type}) // synopsys parallel_case
      {1'b0,1'b0,MEM_RDT} : dok = dat;		// sun4u
      {1'b0,1'b0,MEM_WRT} : dok = dat;		// sun4u
      {1'b0,1'b0,MSG_WRT} : dok = dat;		// sun4u
      {1'b0,1'b0,MSI_WRT} : dok = dat;		// sun4u

      {1'b0,1'b1,MEM_RDT} : dok = dat;		// sun4v
      {1'b0,1'b1,MEM_WRT} : dok = dat;		// sun4v
      {1'b0,1'b1,MSG_WRT} : dok = dat;		// sun4v
      {1'b0,1'b1,MSI_WRT} : dok = dat;		// sun4v
      {1'b0,1'b1,MEM_RDB} : dok = dat;		// sun4v
      {1'b0,1'b1,MEM_WRB} : dok = dat;		// sun4v
      {1'b0,1'b1,MSG_WRB} : dok = dat;		// sun4v
      {1'b0,1'b1,MSI_WRB} : dok = dat;		// sun4v
      default : dok = 1'b1;
    endcase
  end

// write ok
  always @ (tlb2pab_type or wrt) begin
    case (tlb2pab_type) // synopsys parallel_case
      MEM_WRT : wok = wrt;
      MEM_WRB : wok = wrt;
      MSG_WRT : wok = wrt;
      MSG_WRB : wok = wrt;
      MSI_WRT : wok = wrt;
      MSI_WRB : wok = wrt;
      default : wok = 1'b1;
    endcase
  end

// valid ok
  always @ (tlb2pab_type or vld) begin
    case (tlb2pab_type) // synopsys parallel_case
      MEM_RDT : vok = vld;
      MEM_RDB : vok = vld;
      MEM_WRT : vok = vld;
      MEM_WRB : vok = vld;
      MSG_WRT : vok = vld;
      MSG_WRB : vok = vld;
      MSI_WRT : vok = vld;
      MSI_WRB : vok = vld;
      default : vok = 1'b1;
    endcase
  end

// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
  always @ (posedge clk) begin
    if (!rst_l) begin
      addr_ps3 <= 0;
      aerr_ps3 <= 0;
      type_ps3 <= 0;
    end
    else begin
      addr_ps3 <= addr_ps2;
      aerr_ps3 <= aerr_ps2;
      type_ps3 <= tlb2pab_type;
    end
  end

endmodule // dmu_mmu_pab
