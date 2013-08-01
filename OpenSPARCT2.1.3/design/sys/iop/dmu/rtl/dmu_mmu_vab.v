// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_vab.v
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
module dmu_mmu_vab 
  (
   clk,				// clock
   rst_l,			// synchronous reset
   csr2vab_ps,			// csr page size
   csr2vab_ts,			// csr table size
   tcb2vab_hld,			// tcb hold
   vaq2vab_rcd,			// vaq virtual address record
   vaq2vab_iotsbno,		// vaq iotsb number for sun4v
   vaq2vab_tsbbpa,		// vaq iotsb base pa for sun4v table walks
   srq2vab_np,			// iotsb number of pages from srq
   srq2vab_adva,		// adjusted va for sun4v mode
   srq2vab_sun4v_pgsz,		// page size for sun4v mode
   srq2vab_sun4v_byp_ps0,	// true if sun4v mode and bypass
   vab2tcb_4vor,		// sun4v out of range error
   vab2tcb_s4uf,		// sun4v underflow
   vab2tcb_err,			// tcb error
   vab2tcb_vld,			// tcb valid
   vab2tcb_sun4v_va_oor,	// sun4v va oor
   vab2tlb_addr,		// tlb address
   vab2tlb_rqid,		// tlb requester id
   vab2tlb_type,		// tlb type
   vab2tlb_iotsbno,		// tlb iotsb for sun4v mode
   vab2tlb_tsbbpa,		// tlb iotsb base pa for sun4v mode tablewalk
   vab2tlb_sun4v_pgnmb,		// sun4v page number for tablewalks
   vab2tlb_sun4v_pgsz,		// sun4v page size to adjust new tag write into vtb
   vab2vtb_addr,		// vtb address
   vab2vtb_dbra,		// vtb data buffer read address
   vab2vtb_iotsbno,		// vtb iotsb number for sun4v
   sun4v_mode,			// 1 if in sun4v mode for io address translations
   vab2tlb_sun4v_byp_ps1	// use in pab to check tdb parity errors
   );
     
// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------
  parameter	VTL = `FIRE_DLC_MMU_VTD_VPN_LSB,	// virtual tag LSB
		VTM = `FIRE_DLC_MMU_VTD_VPN_MSB;	// virtual tag MSB

  parameter	MEM_RDT = 7'b0000000,
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
  input					rst_l;

  input 				csr2vab_ps;
  input  [`FIRE_DLC_MMU_CSR_TS_BITS]	csr2vab_ts;
  input 				tcb2vab_hld;
  input  [`FIRE_DLC_MMU_VAR_BITS]	vaq2vab_rcd;
  input  [`FIRE_DLC_MMU_VAR_IOTSB_BITS]	vaq2vab_iotsbno;
  input  [`FIRE_DLC_MMU_IOTSB_BSPA_BITS] vaq2vab_tsbbpa;
  input  [3:0]          		srq2vab_np;
  input  [27:0]          		srq2vab_adva;
  input  [2:0]          		srq2vab_sun4v_pgsz;
  input            			srq2vab_sun4v_byp_ps0;
  input 				sun4v_mode;

  output [`FIRE_DLC_MMU_VAB_ERR_BITS]	vab2tcb_err;
  output [`FIRE_DLC_MMU_VAB_VLD_BITS]	vab2tcb_vld;
  output 				vab2tcb_sun4v_va_oor;
  output 				vab2tcb_4vor;
  output 				vab2tcb_s4uf;
  output [`FIRE_DLC_MMU_VA_ADDR_BITS]	vab2tlb_addr;
  output [`FIRE_DLC_MMU_VA_RQID_BITS]	vab2tlb_rqid;
  output [`FIRE_DLC_MMU_VA_TYPE_BITS]	vab2tlb_type;
  output [`FIRE_DLC_MMU_VAR_IOTSB_BITS]	vab2tlb_iotsbno;
  output [`FIRE_DLC_MMU_IOTSB_BSPA_BITS] vab2tlb_tsbbpa;
  output [27:0] 			vab2tlb_sun4v_pgnmb;
  output [2:0] 				vab2tlb_sun4v_pgsz;
  output [`FIRE_DLC_MMU_VTD_VPN_BITS]	vab2vtb_addr;
  output [`FILE_DLC_MMU_TTE_CNT_BITS]	vab2vtb_dbra;
  output [`FIRE_DLC_MMU_VAR_IOTSB_BITS]	vab2vtb_iotsbno;
  output 				vab2tlb_sun4v_byp_ps1;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire [`FIRE_DLC_MMU_VA_ADDR_BITS]	vab2tlb_addr, addr_ps0;
  wire [`FIRE_DLC_MMU_VA_RQID_BITS]	vab2tlb_rqid, rqid_ps0;
  wire [`FIRE_DLC_MMU_VA_TYPE_BITS]	vab2tlb_type, type_ps0;
  wire [`FIRE_DLC_MMU_VAR_IOTSB_BITS]	vab2tlb_iotsbno, iotsbno_ps0;
  wire [`FIRE_DLC_MMU_IOTSB_BSPA_BITS]	tsbbpa_ps0;
  reg [`FIRE_DLC_MMU_VTD_VPN_BITS]	vab2vtb_addr;
  reg [`FIRE_DLC_MMU_VTD_VPN_BITS]	sun4v_adj_va;
  reg [`FILE_DLC_MMU_TTE_CNT_BITS]	vab2vtb_dbra,sun4v_adj_dbra;
  wire [`FIRE_DLC_MMU_CSR_TS_BITS]	size;
  wire [`FIRE_DLC_MMU_VAB_ERR_BITS]	vab2tcb_err;
  wire [`FIRE_DLC_MMU_VAB_VLD_BITS]	vab2tcb_vld;
  wire 					sun4v_mode;
  reg [`FIRE_DLC_MMU_VAR_IOTSB_BITS]	iotsbno_ps1;
  reg [`FIRE_DLC_MMU_IOTSB_BSPA_BITS]	tsbbpa_ps1;
  reg  [`FIRE_DLC_MMU_VA_ADDR_BITS]	addr_ps1;
  reg  [`FIRE_DLC_MMU_VA_RQID_BITS]	rqid_ps1;
  reg  [`FIRE_DLC_MMU_VA_TYPE_BITS]	type_ps1;
  reg  [`FIRE_DLC_MMU_VAB_ERR_BITS]	aok;
  reg  [`FIRE_DLC_MMU_VAB_VLD_BITS]	vld;
  reg  [3:0]				np_ps1;
  reg  [27:0]				adva_ps1;
  reg  [2:0]				sun4v_pgsz_ps1;
  reg  					sun4v_byp_ps1;

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------

// tlb address, requester id, and type
  assign vab2tlb_addr = addr_ps1;
  assign vab2tlb_rqid = rqid_ps1;
  assign vab2tlb_type = type_ps1;
  assign vab2tlb_iotsbno = iotsbno_ps1;
  assign vab2tlb_tsbbpa = tsbbpa_ps1;
  assign vab2tlb_sun4v_pgnmb = adva_ps1;		// this is adjusted sun4v page number
  assign vab2tlb_sun4v_pgsz = sun4v_pgsz_ps1;
  assign vab2tlb_sun4v_byp_ps1 = sun4v_byp_ps1;

// virtual address record parsing
  assign addr_ps0 	= vaq2vab_rcd[`FIRE_DLC_MMU_VAR_ADDR_BITS];
  assign rqid_ps0 	= vaq2vab_rcd[`FIRE_DLC_MMU_VAR_RQID_BITS];
  assign type_ps0 	= vaq2vab_rcd[`FIRE_DLC_MMU_VAR_TYPE_BITS];
  assign iotsbno_ps0 	= vaq2vab_iotsbno[`FIRE_DLC_MMU_VAR_IOTSB_BITS];
  assign tsbbpa_ps0 = vaq2vab_tsbbpa[`FIRE_DLC_MMU_IOTSB_BSPA_BITS];

// vtb address is the virtual address with bits masked by the page size
//  assign vab2vtb_addr[VTM:VTL+3] = addr_ps0[VTM:VTL+3];
//  assign vab2vtb_addr[VTL+2:VTL] = (csr2vab_ps & !sun4v_mode) ? 3'b000 : addr_ps0[VTL+2:VTL];

always @(sun4v_mode or addr_ps0 or csr2vab_ps or sun4v_adj_va ) begin
	
	if (!sun4v_mode) begin
   vab2vtb_addr[VTM:VTL+3] = addr_ps0[VTM:VTL+3];
   vab2vtb_addr[VTL+2:VTL] = (csr2vab_ps ) ? 3'b000 : addr_ps0[VTL+2:VTL];
	end
	else begin
	vab2vtb_addr[VTM:VTL] = sun4v_adj_va[VTM:VTL];
	end
end

//BP 9-29-05 this logic 0's out the lower bits going into the cam, thus as the
//	page size gets larger more bits are 0'ed, also need to modify tlb tag writes
always @(srq2vab_sun4v_pgsz or addr_ps0  ) begin

	sun4v_adj_va[VTM:VTL] = {24{1'b0}};

	case(srq2vab_sun4v_pgsz) 
	3'b000:	sun4v_adj_va	=	addr_ps0[39:16];		// 8k pages
	3'b001:	sun4v_adj_va	=	{addr_ps0[39:19],{3{1'b0}}};	// 64k pages
	3'b010:	sun4v_adj_va	=	addr_ps0[39:16];		// invalid
	3'b011:	sun4v_adj_va	=	{addr_ps0[39:25],{9{1'b0}}};	// 4M pages
	3'b100:	sun4v_adj_va	=	addr_ps0[39:16];		// invalid 
	3'b101:	sun4v_adj_va	=	{addr_ps0[39:31],{15{1'b0}}};	// 256M pages
	3'b110:	sun4v_adj_va	=	addr_ps0[39:16];		// invalid 
	3'b111:	sun4v_adj_va	=	addr_ps0[39:16];		// invalid 
	default:	sun4v_adj_va = addr_ps0[39:16];
	endcase
end


  assign vab2vtb_iotsbno		= iotsbno_ps0;

// vtb data buffer read address of the entry within a cacheline
//  assign vab2vtb_dbra = csr2vab_ps ? addr_ps1[VTL+2:VTL] : addr_ps1[VTL-1:VTL-3];
//BP N2 if snu4v mode always use adr[15:13] since the page size is taken into 
// account by the iotsb ram lookups.
//  assign vab2vtb_dbra = (csr2vab_ps & !sun4v_mode) ? addr_ps1[VTL+2:VTL] : addr_ps1[VTL-1:VTL-3];

always @(sun4v_mode or addr_ps1 or csr2vab_ps or sun4v_adj_dbra) begin
	
	if (!sun4v_mode) begin
	vab2vtb_dbra[2:0] = (csr2vab_ps ) ? addr_ps1[VTL+2:VTL] : addr_ps1[VTL-1:VTL-3];
	end
	else begin
	vab2vtb_dbra[2:0] = sun4v_adj_dbra[2:0];
	end
end

always @(sun4v_pgsz_ps1 or addr_ps1  ) begin

	sun4v_adj_dbra[2:0] = {3{1'b0}};

	case(sun4v_pgsz_ps1) 
	3'b000:	sun4v_adj_dbra	=	addr_ps1[15:13];		// 8k pages
	3'b001:	sun4v_adj_dbra	=	addr_ps1[18:16];		// 64k pages
	3'b010:	sun4v_adj_dbra	=	{3{1'b0}};			// invalid
	3'b011:	sun4v_adj_dbra	=	addr_ps1[24:22];		// 4M pages
	3'b100:	sun4v_adj_dbra	=	{3{1'b0}};			// invalid
	3'b101:	sun4v_adj_dbra	=	addr_ps1[30:28];		// 256M pages
	3'b110:	sun4v_adj_dbra	=	{3{1'b0}};			// invalid
	3'b111:	sun4v_adj_dbra	=	{3{1'b0}};			// invalid
	default:	sun4v_adj_dbra = {3{1'b0}};
	endcase
end






// size is the tsb size adjusted by the page size
  assign size = csr2vab_ps ? csr2vab_ts + 4'h3 : csr2vab_ts;

// aok[1] is address ok for translation mode, aok[0] is for bypass mode
  always @ (addr_ps1 or size) begin
    case (size)
      4'h0 : aok[1] = &(addr_ps1[31:23]);
      4'h1 : aok[1] = &(addr_ps1[31:24]);
      4'h2 : aok[1] = &(addr_ps1[31:25]);
      4'h3 : aok[1] = &(addr_ps1[31:26]);
      4'h4 : aok[1] = &(addr_ps1[31:27]);
      4'h5 : aok[1] = &(addr_ps1[31:28]);
      4'h6 : aok[1] = &(addr_ps1[31:29]);
      4'h7 : aok[1] = &(addr_ps1[31:30]);
      4'h8 : aok[1] =   addr_ps1[31];
      4'h9 : aok[1] = 1'b1;
      default : aok[1] = 1'b0;
    endcase
//    aok[0] = (addr_ps1[63:42] == 22'h3fff00);		//BP old value for fire
    aok[0] = (addr_ps1[63:39] == 25'h1fff800);
  end

// iotsb/sun4v out of range calculation
// now check for overflow, 
reg     [26:0]  number_of_pages;
reg     	sun4v_or;			// sun4v our of range
always @( np_ps1 )begin

        number_of_pages = 27'b0;

        case (np_ps1)
        4'b0000:  number_of_pages = 27'b000_0000_0000_0000_0100_0000_0000 ;   // 1k    pages
        4'b0001:  number_of_pages = 27'b000_0000_0000_0000_1000_0000_0000 ;   // 2k    pages
        4'b0010:  number_of_pages = 27'b000_0000_0000_0001_0000_0000_0000 ;   // 4k    pages
        4'b0011:  number_of_pages = 27'b000_0000_0000_0010_0000_0000_0000 ;   // 8k    pages
        4'b0100:  number_of_pages = 27'b000_0000_0000_0100_0000_0000_0000 ;   // 16k   pages
        4'b0101:  number_of_pages = 27'b000_0000_0000_1000_0000_0000_0000 ;   // 32k   pages
        4'b0110:  number_of_pages = 27'b000_0000_0001_0000_0000_0000_0000 ;   // 64k   pages
        4'b0111:  number_of_pages = 27'b000_0000_0010_0000_0000_0000_0000 ;   // 128k  pages
        4'b1000:  number_of_pages = 27'b000_0000_0100_0000_0000_0000_0000 ;   //256k   pages
        4'b1001:  number_of_pages = 27'b000_0000_1000_0000_0000_0000_0000 ;   //512k   pages
        4'b1010:  number_of_pages = 27'b000_0001_0000_0000_0000_0000_0000 ;   //1024k  pages
        4'b1011:  number_of_pages = 27'b000_0010_0000_0000_0000_0000_0000 ;   //2048k  pages
        4'b1100:  number_of_pages = 27'b000_0100_0000_0000_0000_0000_0000 ;   //4096k  pages
        4'b1101:  number_of_pages = 27'b000_1000_0000_0000_0000_0000_0000 ;   //8192k  pages
        4'b1110:  number_of_pages = 27'b001_0000_0000_0000_0000_0000_0000 ;   //16384k pages
        4'b1111:  number_of_pages = 27'b010_0000_0000_0000_0000_0000_0000 ;   //32768k pages
//        default:        number_of_pages = 27'bx;
        endcase
end

always @(number_of_pages or adva_ps1  )begin
        if  ((adva_ps1[26:0] < number_of_pages[26:0])  )begin
                sun4v_or = 1'b0;
        end
        else sun4v_or = 1'b1;
        end
//BP 9-05-05 these are gated with translate mode in dmu_mmu_tcb_tmc.v ie. tmv
// the translate mode is decoded below and sent to dmu_mmu_tcb_tmc.v
assign	vab2tcb_4vor		= sun4v_or & sun4v_mode;		// 1 if sun4v out of range
assign  vab2tcb_s4uf        	= adva_ps1[27] & sun4v_mode;            // if 1 there was an underflow


// vld[1] is a valid translation mode type, vld[0] is for bypass mode
  always @ (type_ps0 or sun4v_mode or srq2vab_sun4v_byp_ps0) begin
    case ({srq2vab_sun4v_byp_ps0,sun4v_mode,type_ps0})
      {1'b0,1'b0,MEM_RDT} : vld = 3'b010;	// Memory read  (translation)
      {1'b0,1'b0,MEM_RDB} : vld = 3'b001;	// Memory read  (bypass)
      {1'b0,1'b0,MEM_WRT} : vld = 3'b010;	// Memory write (translation)
      {1'b0,1'b0,MEM_WRB} : vld = 3'b001;	// Memory write (bypass)
      {1'b0,1'b0,MSG_WRT} : vld = 3'b010;	// Msg EQ write (translation)
      {1'b0,1'b0,MSG_WRB} : vld = 3'b001;	// Msg EQ write (bypass)
      {1'b0,1'b0,MSI_WRT} : vld = 3'b010;	// MSI EQ write (translation)
      {1'b0,1'b0,MSI_WRB} : vld = 3'b001;	// MSI EQ write (bypass)

      {1'b0,1'b1,MEM_RDT} : vld = 3'b010;	// Memory read  (translation)	// 32 bit adr
      {1'b0,1'b1,MEM_RDB} : vld = 3'b010;	// Memory read  (translation)	// 64 bit adr
      {1'b0,1'b1,MEM_WRT} : vld = 3'b010;	// Memory write (translation)	// 32 bit adr
      {1'b0,1'b1,MEM_WRB} : vld = 3'b010;	// Memory write (translation)	// 64 bit adr

      {1'b1,1'b1,MEM_RDB} : vld = 3'b001;	// Memory read  (bypass)	// 64 bit adr
      {1'b1,1'b1,MEM_WRB} : vld = 3'b001;	// Memory write (bypass)	// 64 bit adr

      {1'b0,1'b1,MSG_WRT} : vld = 3'b010;	// Msg EQ write (translation)
      {1'b0,1'b1,MSG_WRB} : vld = 3'b010;	// Msg EQ write (translation)	// 64 bit adr
      {1'b0,1'b1,MSI_WRT} : vld = 3'b010;	// MSI EQ write (translation)
      {1'b0,1'b1,MSI_WRB} : vld = 3'b010;	// MSI EQ write (translation)	// 64 bit adr

      {1'b1,1'b1,MSG_WRT} : vld = 3'b101;	// Msg EQ write (bypass)
      {1'b1,1'b1,MSI_WRT} : vld = 3'b101;	// MSI EQ write (bypass)
      {1'b1,1'b1,MSG_WRB} : vld = 3'b101;	// Msg EQ write (bypass)
      {1'b1,1'b1,MSI_WRB} : vld = 3'b101;	// MSI EQ write (bypass)
      default : vld = 3'b000;
    endcase
  end

// tcb error and valid
//  assign vab2tcb_err = ~aok;
  assign vab2tcb_err = {(~(aok[1] & ~sun4v_mode)), ~aok[0]};
  assign vab2tcb_vld =  vld;
// BP 11-30-05 note this is a ps0 stage
assign  vab2tcb_sun4v_va_oor   	= sun4v_mode & ~(addr_ps0[62:40] == 23'h000000) &
				~srq2vab_sun4v_byp_ps0      ;   // if 1 adr 62:40 not eq 0 for translating
									// transactions

// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
  always @ (posedge clk) 
	if(~rst_l) begin
      addr_ps1  <= {62{1'b0}};
      rqid_ps1  <= {16{1'b0}};
      type_ps1  <= {7{1'b0}};
      iotsbno_ps1 <= {`FIRE_DLC_MMU_VTD_IOTSBNO_WDTH{1'b0}};
      tsbbpa_ps1 <= {26{1'b0}};
      np_ps1    <= {4{1'b0}};
      adva_ps1  <= {28{1'b0}};
      sun4v_pgsz_ps1  <= {3{1'b0}};
      sun4v_byp_ps1  <= {1'b0};
	end
	else begin
    if (!tcb2vab_hld) begin
      addr_ps1  <= addr_ps0;
      rqid_ps1  <= rqid_ps0;
      type_ps1  <= type_ps0;
      iotsbno_ps1 <= iotsbno_ps0;
      tsbbpa_ps1 <= tsbbpa_ps0;
      np_ps1    <= srq2vab_np;
      adva_ps1  <= srq2vab_adva;
      sun4v_pgsz_ps1  <= srq2vab_sun4v_pgsz;
      sun4v_byp_ps1  <= srq2vab_sun4v_byp_ps0;
    end
  end

endmodule
