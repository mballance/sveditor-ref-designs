// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_tlb.v
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
module dmu_mmu_tlb 
  (
   clk,				// clock
   rst_l,			// synchronous reset
   csr2tlb_ps,			// csr page size
   csr2tlb_tb,			// csr table base address
   csr2tlb_ts,			// csr table size
   rcb2tlb_dhi,			// rcb data high
   rcb2tlb_dlo,			// rcb data low
   tcb2tlb_dld,			// tlb data load
   tcb2tlb_hld,			// tlb hold
   tcb2tlb_ra,			// tlb read address
   tcb2tlb_ras,			// tlb read address select
   tcb2tlb_sel,			// tlb select
   tcb2tlb_tld,			// tlb tag load
   vab2tlb_addr,		// vab address
   vab2tlb_rqid,		// vab requester ID
   vab2tlb_type,		// vab type
   vab2tlb_iotsbno,		// vab iotsb for sun4v mode
   vab2tlb_tsbbpa,		// tablewalk base pa for sun4v mode
   vab2tlb_sun4v_pgnmb,		// sun4v page number for tablewalks 
   vab2tlb_sun4v_pgsz,		// sun4v page size to adjust new tag write into vtb
   vtb2tlb_dbra,		// vtb data buffer read address
   tlb2csr_addr,		// csr address
   tlb2csr_dbra,		// csr data buffer read address
   tlb2csr_rqid,		// csr requester ID
   tlb2csr_type,		// csr type
   tlb2tdb_rqid,		// csr requester ID to tdb to compare against current entry
   tlb2pab_addr,		// pab address
   tlb2pab_sun4v_pgsz,		// sun4v page size for pa adr concat
   tlb2pab_type,		// pab type
   tlb2pab_vld,			// pab valid
   tlb2pab_wrt,			// pab write
   tlb2ptb_addr,		// ptb physical tag address
   tlb2rcb_addr,		// rcb address
   tlb2tcb_hit,			// tcb virtual tag hit
   tlb2tdb_data,		// tdb data
   tlb2vtb_addr,		// vtb virtual tag address
   tlb2vtb_iotsbno,		// vtb virtual iotsb for sun4v mode
   sun4v_mode,			// 1=sun4v mode
   tlb2tmc_kerr,		// key mismatch error from single entry tlb
   tlb2pab_byp_ps2,		// sun4v bypass for pab tdb parity check
   vab2tlb_sun4v_byp_ps1	// sun4v bypass for pab tdb parity check
   );
     
// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------
  parameter	PAM = `FIRE_PA_MSB,			// physical address MSB
		VTL = `FIRE_DLC_MMU_VTD_VPN_LSB,	// virtual tag LSB
		VTM = `FIRE_DLC_MMU_VTD_VPN_MSB;	// virtual tag MSB

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input					clk;
  input					rst_l;

  input 				csr2tlb_ps;
  input  [`FIRE_DLC_MMU_CSR_TB_BITS]	csr2tlb_tb;
  input  [`FIRE_DLC_MMU_CSR_TS_BITS]	csr2tlb_ts;
  input  [`FIRE_DLC_MMU_TDR_DATA_BITS]	rcb2tlb_dhi;
  input  [`FIRE_DLC_MMU_TDR_DATA_BITS]	rcb2tlb_dlo;
  input 				tcb2tlb_dld;
  input					tcb2tlb_hld;
  input  [`FILE_DLC_MMU_TTE_CNT_BITS]	tcb2tlb_ra;
  input 				tcb2tlb_ras;
  input 				tcb2tlb_sel;
  input 				tcb2tlb_tld;
  input  [`FIRE_DLC_MMU_VA_ADDR_BITS]	vab2tlb_addr;
  input  [`FIRE_DLC_MMU_VA_RQID_BITS]	vab2tlb_rqid;
  input  [`FIRE_DLC_MMU_VA_TYPE_BITS]	vab2tlb_type;
  input  [`FIRE_DLC_MMU_VAR_IOTSB_BITS]	vab2tlb_iotsbno;
  input  [`FIRE_DLC_MMU_IOTSB_BSPA_BITS] vab2tlb_tsbbpa;
  input  [27:0] 			vab2tlb_sun4v_pgnmb;
  input  [2:0] 				vab2tlb_sun4v_pgsz;
  input  [`FIRE_DLC_MMU_TDB_PTR_BITS]	vtb2tlb_dbra;
  input  				sun4v_mode;

  output [`FIRE_DLC_MMU_VA_ADDR_BITS]	tlb2csr_addr;
  output [`FIRE_DLC_MMU_TDB_PTR_BITS]	tlb2csr_dbra;
  output [`FIRE_DLC_MMU_VA_RQID_BITS]	tlb2csr_rqid;
  output [`FIRE_DLC_MMU_VA_TYPE_BITS]	tlb2csr_type;
  output [`FIRE_DLC_MMU_VA_RQID_BITS]	tlb2tdb_rqid;
  output [`FIRE_DLC_MMU_PA_ADDR_BITS]	tlb2pab_addr;
  output [2:0]				tlb2pab_sun4v_pgsz;
  output [`FIRE_DLC_MMU_PA_TYPE_BITS]	tlb2pab_type;
  output				tlb2pab_vld;
  output				tlb2pab_wrt;
  output [`FIRE_DLC_MMU_PTD_TAG_BITS]	tlb2ptb_addr;
  output [`FIRE_DLC_MMU_PTD_TAG_BITS]	tlb2rcb_addr;
  output				tlb2tcb_hit;
  output [`FIRE_DLC_MMU_TDR_MINUS_PAR_BITS]	tlb2tdb_data;
  output [`FIRE_DLC_MMU_VTD_VPN_BITS]   tlb2vtb_addr;
  output [`FIRE_DLC_MMU_VAR_IOTSB_BITS]	tlb2vtb_iotsbno;
  output 				tlb2tmc_kerr;
  input 				vab2tlb_sun4v_byp_ps1;
  output 				tlb2pab_byp_ps2;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire [`FIRE_DLC_MMU_VA_ADDR_BITS]	tlb2csr_addr, addr_ps1;
  wire [`FIRE_DLC_MMU_TDB_PTR_BITS]	tlb2csr_dbra, dbra_ps1;
  wire [`FIRE_DLC_MMU_VA_RQID_BITS]	tlb2csr_rqid, rqid_ps1;
  wire [`FIRE_DLC_MMU_VA_TYPE_BITS]	tlb2csr_type, type_ps1;
  reg [`FIRE_DLC_MMU_PA_ADDR_BITS]	tlb2pab_addr;
  reg [25:0]				sun4v_tlb_addr;
  wire [`FIRE_DLC_MMU_PA_TYPE_BITS]	tlb2pab_type;
  wire [`FIRE_DLC_MMU_PTD_TAG_BITS]	tlb2ptb_addr;
  wire [`FIRE_DLC_MMU_PTD_TAG_BITS]	tlb2rcb_addr;
  wire [`FIRE_DLC_MMU_TDR_MINUS_PAR_BITS]		tlb2tdb_data;
  wire [`FIRE_DLC_MMU_VTD_VPN_BITS]	tlb2vtb_addr;

  wire [`FIRE_DLC_MMU_VAR_IOTSB_BITS]	tlb2vtb_iotsbno;
  

  wire [`FIRE_DLC_MMU_PTD_TAG_BITS]	new_ptag;
  reg [`FIRE_DLC_MMU_VTD_VPN_BITS]	new_vtag, vtag_ps1;
  reg [`FIRE_DLC_MMU_VTD_VPN_BITS]	sun4v_new_vtag,sun4v_vtag_ps1;
  wire [`FIRE_DLC_MMU_VAR_IOTSB_BITS]	iotsbno_ps1;
  wire [`FIRE_DLC_MMU_IOTSB_BSPA_BITS]	tsbbpa_ps1;
  wire [`FIRE_DLC_MMU_TDR_DATA_BITS]	data;
  wire [`FIRE_DLC_MMU_TDD_PPN_BITS]	ppn;
  wire [`FILE_DLC_MMU_TTE_CNT_BITS]	ra;
  wire [1:0]				sel;

  reg  [`FIRE_DLC_MMU_VA_ADDR_BITS]	addr_ps2;
  reg  [`FIRE_DLC_MMU_TDB_PTR_BITS]	dbra_ps2;
  reg  [`FIRE_DLC_MMU_VA_RQID_BITS]	rqid_ps2;
  reg  [`FIRE_DLC_MMU_VA_TYPE_BITS]	type_ps2;
  reg  [`FIRE_DLC_MMU_VAR_IOTSB_BITS]	iotsbno_ps2,tlb_iotsbno;
  reg  [`FIRE_DLC_MMU_IOTSB_BSPA_BITS]	tsbbpa_ps2;

  reg  [`FIRE_DLC_MMU_PTD_TAG_BITS]	tlb_ptag;
  reg  [`FIRE_DLC_MMU_VTD_VPN_BITS]	tlb_vtag;
  reg  [`FIRE_DLC_MMU_TDR_DATA_BITS]	tlb_data [0:7];
  reg  [2:0]			        sun4v_pgsz_ps2;
  reg  [27:0]			        vab2tlb_sun4v_pgnmb_ps2;
  wire  [2:0]			        sun4v_pgsz_ps1;
  reg  			        	tlb2pab_byp_ps2;

// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------

//  // 0in odd_parity -var {data[31:24], dpar[3]}
//  // 0in odd_parity -var {data[23:16], dpar[2]}
//  // 0in odd_parity -var {data[15:8],  dpar[1]}
//  // 0in odd_parity -var {data[7:0],   dpar[0]}

// ----------------------------------------------------------------------------
// Functions
// ----------------------------------------------------------------------------
  function [`FIRE_DLC_MMU_PTD_TAG_BITS] 	tsb_addr;	// tsb_addr  [42:6] 
//    input [`FIRE_DLC_MMU_VTD_TAG_BITS]	va;		// va was 31:16
    input [`FIRE_DLC_MMU_VTD_VPN_BITS]		va;		// va is now 39:16
    input [27:0]				sun4v_pgnmb;		// va is now 39:16
    input [`FIRE_DLC_MMU_CSR_TB_BITS]		tb;
    input [`FIRE_DLC_MMU_CSR_TS_BITS]		ts;
    input					ps;
    input					mode;		// 1 = sun4v
    input [`FIRE_DLC_MMU_IOTSB_BSPA_BITS]	tsbbpa;		// value from iotsb ram, add 13 0's after for [38:0]

    reg [32:0]		a,b,c;				// new adder is 36 bits
    reg [21:6]		offset;
    reg [21:6]		index;
//    reg [`FIRE_DLC_MMU_PTD_TAG_BITS]	addr;

// tsb_addr generates the translation table address for tablewalks based upon
// the virtual address(va), tsb base address (tb), tsb table size (ts), and
// page size (ps)

    begin
      offset = ps ? {3'b000, va[31:19]} : va[31:16];
      case (ts)
	4'b0000 : index = {9'b000000000, offset[12:6]};
	4'b0001 : index = {8'b00000000, offset[13:6]};
	4'b0010 : index = {7'b0000000, offset[14:6]};
	4'b0011 : index = {6'b000000, offset[15:6]};
	4'b0100 : index = {5'b00000, offset[16:6]};
	4'b0101 : index = {4'b0000, offset[17:6]};
	4'b0110 : index = {3'b000, offset[18:6]};
	4'b0111 : index = {2'b00, offset[19:6]};
	4'b1000 : index = {1'b0, offset[20:6]};
	default : index = offset;
      endcase

// if sun4v mode, add the sun4v adjusted page shifted by 3 bits to the sun4v base number[38:0], so
//		the adjusted base page is added to 38:3 because each entry is 8 bytes(64 bits)
// if sun4u mode, use the FIRE values

	if (mode) begin
	a	=	{{8{1'b0}},sun4v_pgnmb[27:3]};// this is sun4v adjusted page number, ie shift by 3
	b	=	{tsbbpa,{7{1'b0}}};		// note [2:0] are always 0 for both a and b
	end
	else begin
	a	= 	{{7{1'b0}},tb[38:13]};		// sun4u, in this mode the adder starts at adr[13]
	b	=	{{24{1'b0}},index[21:13]};
	end
	c	=	a + b;				// 36 bit adder sun4u=0's,[42:13], sun4v=[38:3]

//      addr[PAM:13] = tb + { { PAM-21 { 1'b0 } }, index[21:13]};
//      addr[12:6]   = index[12:6];
	if (mode) begin
	tsb_addr	=	{c[32:0]};	// always output [38:6], sun4v[39] always 0
	end
	else begin
      	tsb_addr     = {c[25:0],index[12:6]};	// output [38:6]
	end
    end
  endfunction // tsb_addr

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------

// csr log data
  assign tlb2csr_addr = addr_ps2;
  assign tlb2csr_dbra = dbra_ps2;
  assign tlb2csr_rqid = rqid_ps2;
  assign tlb2tdb_rqid = rqid_ps2;
  assign tlb2csr_type = type_ps2;

// other outputs
  assign tlb2pab_type = type_ps2;
  assign tlb2ptb_addr = tlb_ptag;
  assign tlb2rcb_addr = tlb_ptag;
  assign tlb2vtb_addr = tlb_vtag;
  assign tlb2vtb_iotsbno = tlb_iotsbno;

// pipeline stage one
  assign addr_ps1 = vab2tlb_addr;
  assign dbra_ps1 = vtb2tlb_dbra;
  assign rqid_ps1 = vab2tlb_rqid;
  assign type_ps1 = vab2tlb_type;
  assign iotsbno_ps1 = vab2tlb_iotsbno;
  assign tsbbpa_ps1 = vab2tlb_tsbbpa;
  assign sun4v_pgsz_ps1 = vab2tlb_sun4v_pgsz;

// tlb data read address
  assign ra = tcb2tlb_ras ? tcb2tlb_ra : dbra_ps2[`FILE_DLC_MMU_TTE_CNT_BITS];

// tlb data and physical page number
  assign data = tlb_data[ra];
  assign ppn  = data[`FIRE_DLC_MMU_TDR_PPN_BITS];

//BP key error, similar to check in tdb
  assign tlb2tmc_kerr = data[`FIRE_DLC_MMU_TDR_KEYVLD_BITS] && 
		~((tlb2tdb_rqid & {{13{1'b1}},data[`FIRE_DLC_MMU_TDR_FNM_BITS]}) == 
			(data[`FIRE_DLC_MMU_TDR_KEY_BITS] & {{13{1'b1}},data[`FIRE_DLC_MMU_TDR_FNM_BITS]}));


// physical tag which is the address of the tsb entry
//  assign new_ptag = tsb_addr(addr_ps2[`FIRE_DLC_MMU_VTD_TAG_BITS],		// for FIRE it was [31:16]
//			     csr2tlb_tb,
//			     csr2tlb_ts,
//			     csr2tlb_ps );
//BP N2 tablewalk address calculated different for sun4u and sun4v, reuse sun4u adder here
// for sun4v add the iotsb base page and the mode bit
  assign new_ptag = tsb_addr(addr_ps2[`FIRE_DLC_MMU_VTD_VPN_BITS],	// for N2 still output [42:6]
			     vab2tlb_sun4v_pgnmb_ps2,			// only for sun4v mode
			     csr2tlb_tb,
			     csr2tlb_ts,
			     csr2tlb_ps,
			     sun4v_mode,
			     tsbbpa_ps2 );		// note sun4v base pa is [38:0] with 39 always 0


// virtual tag which is the virtual address with bits masked by page size
//BP 9-29-05  assign new_vtag[VTM:VTL+3] = addr_ps2[VTM:VTL+3];
//  assign new_vtag[VTL+2:VTL] = csr2tlb_ps ? 3'b000 : addr_ps2[VTL+2:VTL];
// BP n2 8-16-04if sun4v_mode then page size is already accounted for
//BP 9-29-05  assign new_vtag[VTL+2:VTL] = (csr2tlb_ps & !sun4v_mode) ? 3'b000 : addr_ps2[VTL+2:VTL];


//BP 9-29-05
always @(sun4v_mode or addr_ps2 or csr2tlb_ps or sun4v_new_vtag ) begin

        if (!sun4v_mode) begin
   new_vtag[VTM:VTL+3] = addr_ps2[VTM:VTL+3];
   new_vtag[VTL+2:VTL] = (csr2tlb_ps ) ? 3'b000 : addr_ps2[VTL+2:VTL];
        end
        else begin
   new_vtag[VTM:VTL] = sun4v_new_vtag[VTM:VTL];		//[VTM:VTL]=[39:16]
        end
end

//BP 9-29-05 this logic 0's out the lower bits going into the cam, thus as the
//      page size gets larger more bits are 0'ed
always @(sun4v_pgsz_ps2 or addr_ps2   ) begin

        sun4v_new_vtag[VTM:VTL] = {24{1'b0}};

        case(sun4v_pgsz_ps2) 
        3'b000: sun4v_new_vtag    =       addr_ps2[39:16];                // 8k pages
        3'b001: sun4v_new_vtag    =       {addr_ps2[39:19],{3{1'b0}}};     // 64k pages
        3'b010: sun4v_new_vtag    =       addr_ps2[39:16];                // invalid
        3'b011: sun4v_new_vtag    =       {addr_ps2[39:25],{9{1'b0}}};     // 4M pages
        3'b100: sun4v_new_vtag    =       addr_ps2[39:16];                // invalid
        3'b101: sun4v_new_vtag    =       {addr_ps2[39:31],{15{1'b0}}};    // 256M pages
        3'b110: sun4v_new_vtag    =       addr_ps2[39:16];                // invalid
        3'b111: sun4v_new_vtag    =       addr_ps2[39:16];                // invalid
        default:        sun4v_new_vtag = addr_ps2[39:16];
        endcase
end



// hit address which is the virtual address with bits masked by page size
//BP 9-29-05  assign vtag_ps1[VTM:VTL+3] = addr_ps1[VTM:VTL+3];
//  assign vtag_ps1[VTL+2:VTL] = csr2tlb_ps ? 3'b000 : addr_ps1[VTL+2:VTL];
//BP n2 8-16-04 if sun4v_mode then page size is already accounted for
//BP 9-29-05  assign vtag_ps1[VTL+2:VTL] = (csr2tlb_ps & !sun4v_mode) ? 3'b000 : addr_ps1[VTL+2:VTL];

//BP 9-29-05
always @(sun4v_mode or addr_ps1 or csr2tlb_ps or sun4v_vtag_ps1 ) begin

        if (!sun4v_mode) begin
   vtag_ps1[VTM:VTL+3] = addr_ps1[VTM:VTL+3];
   vtag_ps1[VTL+2:VTL] = (csr2tlb_ps ) ? 3'b000 : addr_ps1[VTL+2:VTL];
        end
        else begin
   vtag_ps1[VTM:VTL] = sun4v_vtag_ps1[VTM:VTL];		//[VTM:VTL]=[39:16]
        end
end

//BP 9-29-05 this logic 0's out the lower bits going into the cam, thus as the
//      page size gets larger more bits are 0'ed
always @(sun4v_pgsz_ps1 or addr_ps1   ) begin

        sun4v_vtag_ps1[VTM:VTL] = {24{1'b0}};

        case(sun4v_pgsz_ps1)
        3'b000: sun4v_vtag_ps1    =       addr_ps1[39:16];                // 8k pages
        3'b001: sun4v_vtag_ps1    =       {addr_ps1[39:19],{3{1'b0}}};     // 64k pages
        3'b010: sun4v_vtag_ps1    =       addr_ps1[39:16];                // invalid
        3'b011: sun4v_vtag_ps1    =       {addr_ps1[39:25],{9{1'b0}}};     // 4M pages
        3'b100: sun4v_vtag_ps1    =       addr_ps1[39:16];                // invalid
        3'b101: sun4v_vtag_ps1    =       {addr_ps1[39:31],{15{1'b0}}};    // 256M pages
        3'b110: sun4v_vtag_ps1    =       addr_ps1[39:16];                // invalid
        3'b111: sun4v_vtag_ps1    =       addr_ps1[39:16];                // invalid
        default:        sun4v_vtag_ps1 = addr_ps1[39:16];
        endcase
end





// vab address matches the tlb virtual tag
//  assign tlb2tcb_hit = (tlb_vtag == vtag_ps1);
//BP N2/sun4v requires iotsbno match also
    assign tlb2tcb_hit = sun4v_mode ? ((tlb_vtag == vtag_ps1) && (tlb_iotsbno == iotsbno_ps1 )) :
			(tlb_vtag == vtag_ps1);

// selects of the address based upon page size
  assign sel[1] = tcb2tlb_sel;
  assign sel[0] = tcb2tlb_sel | csr2tlb_ps;

// pab address is selected between the pipeline address and the tlb data
//BP 9-29-05  assign tlb2pab_addr[PAM:16] = sel[1] ? {{4{1'b0}},addr_ps2[`N2_PA_MSB:16]} : {{4{1'b0}},ppn[`N2_PA_MSB:16]};
//BP 9-29-05  assign tlb2pab_addr[15:13]  = sel[0] ? addr_ps2[15:13]  : ppn[15:13];
//BP 9-29-05  assign tlb2pab_addr[12:2]   = addr_ps2[12:2];

always @(sun4v_mode or addr_ps2 or sel or ppn or sun4v_tlb_addr ) begin

        if (!sun4v_mode) begin
   	tlb2pab_addr[PAM:16] = sel[1] ? {{4{1'b0}},addr_ps2[`N2_PA_MSB:16]} : 
						{{4{1'b0}},ppn[`N2_PA_MSB:16]};
   	tlb2pab_addr[15:13] = (sel[0] ) ? addr_ps2[15:13] : ppn[15:13];
   	tlb2pab_addr[12:2] = addr_ps2[12:2];
        end
        else begin
        tlb2pab_addr[PAM:2] = {{4{1'b0}},sun4v_tlb_addr[25:0],addr_ps2[12:2]};
        end
end

//BP 9-29-05 this logic switches between the tdb data and the returning tablewalk data
//	ie. the single entry tlb value
always @(sun4v_pgsz_ps2 or addr_ps2 or ppn or sel  ) begin

        sun4v_tlb_addr[25:0] = {26{1'b0}};		// PAM=42,`N2_PA_MSB=38

        case(sun4v_pgsz_ps2)
        3'b000: if (sel[1]) sun4v_tlb_addr   =  addr_ps2[`N2_PA_MSB:13];      // 8k pages
			else sun4v_tlb_addr  =  ppn[`N2_PA_MSB:13];
        3'b001: if (sel[1]) sun4v_tlb_addr   =  addr_ps2[`N2_PA_MSB:13];      // 64k pages
			else sun4v_tlb_addr  =  {ppn[`N2_PA_MSB:16],addr_ps2[15:13]};
        3'b010: sun4v_tlb_addr    =       {26{1'b0}};                	// invalid
        3'b011: if (sel[1]) sun4v_tlb_addr   =  addr_ps2[`N2_PA_MSB:13];      // 4M pages
			else sun4v_tlb_addr  =  {ppn[`N2_PA_MSB:22],addr_ps2[21:13]};
        3'b100: sun4v_tlb_addr    =       {26{1'b0}};                	// invalid
        3'b101: if (sel[1]) sun4v_tlb_addr   =  addr_ps2[`N2_PA_MSB:13];      // 256M pages
			else sun4v_tlb_addr  =  {ppn[`N2_PA_MSB:28],addr_ps2[27:13]};
        3'b110: sun4v_tlb_addr    =       {26{1'b0}};                	// invalid
        3'b111: sun4v_tlb_addr    =       {26{1'b0}};                	// invalid
        default:        sun4v_tlb_addr = {26{1'b0}};
        endcase
end



//BP 9-29-05
  assign tlb2pab_sun4v_pgsz	= sun4v_pgsz_ps2;

// wrt and vld are always set when selecting pipeline address above otherwise
// they come from the tlb data
  wire	 tlb2pab_wrt = data[`FIRE_DLC_MMU_TDR_WRT_BITS] | tcb2tlb_sel;
  wire	 tlb2pab_vld = data[`FIRE_DLC_MMU_TDR_VLD_BITS] | tcb2tlb_sel;

// tdb data parity
//  assign dpar[3] = ~^data[31:24];
//  assign dpar[2] = ~^data[23:16];
//  assign dpar[1] = ~^data[15:8];
//  assign dpar[0] = ~^data[7:0];

// tdb data includes parity bits
//  assign tlb2tdb_data[`FIRE_DLC_MMU_TDR_PAR_LSB+3] = dpar[3];
//  assign tlb2tdb_data[`FIRE_DLC_MMU_TDR_PAR_LSB+2] = dpar[2];
//  assign tlb2tdb_data[`FIRE_DLC_MMU_TDR_PAR_LSB+1] = dpar[1];
//  assign tlb2tdb_data[`FIRE_DLC_MMU_TDR_PAR_LSB]   = dpar[0];
  assign tlb2tdb_data[`FIRE_DLC_MMU_TDR_MINUS_PAR_BITS] = data;

// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
  always @ (posedge clk) 
	if(~rst_l) begin
      addr_ps2 <= {62{1'b0}};
      dbra_ps2 <= {`FIRE_DLC_MMU_TAG_PTR_SIZE + 3{1'b0}};
      rqid_ps2 <= {16{1'b0}};
      type_ps2 <= {7{1'b0}};
      iotsbno_ps2 <= {`FIRE_DLC_MMU_VTD_IOTSBNO_WDTH{1'b0}};
      tsbbpa_ps2 <= {26{1'b0}};
      sun4v_pgsz_ps2 <= {3{1'b0}};
      vab2tlb_sun4v_pgnmb_ps2 <= {28{1'b0}};
      tlb2pab_byp_ps2 <= {{1'b0}};
	end
	else begin
    if (!tcb2tlb_hld) begin
      addr_ps2 <= addr_ps1;
      dbra_ps2 <= dbra_ps1;
      rqid_ps2 <= rqid_ps1;
      type_ps2 <= type_ps1;
      iotsbno_ps2 <= iotsbno_ps1;
      tsbbpa_ps2 <= tsbbpa_ps1;
      sun4v_pgsz_ps2 <= sun4v_pgsz_ps1;
      vab2tlb_sun4v_pgnmb_ps2 <= vab2tlb_sun4v_pgnmb;
      tlb2pab_byp_ps2 <= vab2tlb_sun4v_byp_ps1;
    end
  end

  always @ (posedge clk) 
	if(~rst_l) begin
      tlb_ptag <= {33{1'b0}};
      tlb_vtag <= {`FIRE_DLC_MMU_VTD_VPN_WDTH{1'b0}};
      tlb_iotsbno <= {5{1'b0}};
	end
	else begin
    if (tcb2tlb_tld) begin
      tlb_ptag <= new_ptag;
      tlb_vtag <= new_vtag;
      tlb_iotsbno <= iotsbno_ps2;
    end
  end

  always @ (posedge clk) 
	if(~rst_l) begin
      tlb_data[0] <= {`FIRE_DLC_MMU_TDR_KEY_MSB+1{1'b0}};
      tlb_data[1] <= {`FIRE_DLC_MMU_TDR_KEY_MSB+1{1'b0}};
      tlb_data[2] <= {`FIRE_DLC_MMU_TDR_KEY_MSB+1{1'b0}};
      tlb_data[3] <= {`FIRE_DLC_MMU_TDR_KEY_MSB+1{1'b0}};
      tlb_data[4] <= {`FIRE_DLC_MMU_TDR_KEY_MSB+1{1'b0}};
      tlb_data[5] <= {`FIRE_DLC_MMU_TDR_KEY_MSB+1{1'b0}};
      tlb_data[6] <= {`FIRE_DLC_MMU_TDR_KEY_MSB+1{1'b0}};
      tlb_data[7] <= {`FIRE_DLC_MMU_TDR_KEY_MSB+1{1'b0}};
	end
	else begin
    if (tcb2tlb_dld) begin
      tlb_data[0] <= tlb_data[2];
      tlb_data[1] <= tlb_data[3];
      tlb_data[2] <= tlb_data[4];
      tlb_data[3] <= tlb_data[5];
      tlb_data[4] <= tlb_data[6];
      tlb_data[5] <= tlb_data[7];
      tlb_data[6] <= rcb2tlb_dlo;
      tlb_data[7] <= rcb2tlb_dhi;
    end
  end

endmodule // dmu_mmu_tlb
