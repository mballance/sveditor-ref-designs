// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_l2t_array.v
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
`define L2T_ARR_D_WIDTH            28
`define L2T_ARR_DEPTH              512
`define WAY_HIT_WIDTH              16
`define BADREAD                	   BADBADD 


`define  sh_index_lft		  5'b00000
`define  sh_index_rgt		  5'b00000

module n2_l2t_array (
  din, 
  addr_b, 
  l1clk_internal_v1, 
  l1clk_internal_v2, 
  ln1clk, 
  ln2clk, 
  rd_en_b, 
  rd_en_d1_a, 
  rpda_lft, 
  rpda_rgt, 
  rpdb_lft, 
  rpdb_rgt, 
  rpdc_lft, 
  rpdc_rgt, 
  w_inhibit_l, 
  wr_en_b, 
  wr_en_d1_a, 
  wr_way_b, 
  wr_way_b_l, 
  vnw_ary, 
  sao_mx0_h, 
  sao_mx0_l, 
  sao_mx1_h, 
  sao_mx1_l);
wire ln1clk_unused;
wire ln2clk_unused;
wire l1clk_int_v2_unused;
wire rd_en_b_unused;
wire wr_en_b_unused;
wire [1:0] wr_way_b_unused;
wire l1clk_int;
wire rd_en;
wire [4:0] sf_l;
wire [4:0] sf_r;
wire shift_en_lft;
wire shift_en_rgt;
wire redundancy_en;
wire [4:0] sh_index_lft;
wire [4:0] sh_index_rgt;
wire mem_wr_en0;
wire mem_wr_en1;


//   input         l2clk;                  // cmp clock
//   input         iol2clk;                  // io clock
//   input         scan_in;
//   input         tcu_pce_ov;            // scan signals
//   input         tcu_clk_stop;
//   input         tcu_aclk;
//   input         tcu_bclk;
//   input         tcu_scan_en;
//   input         tcu_muxtest;
//   input         tcu_dectest;
//   output        scan_out;


input	[`L2T_ARR_D_WIDTH - 1:0]	din;
input	[8:0]	 			addr_b;
input		 			l1clk_internal_v1;
input		 			l1clk_internal_v2;
input		 			ln1clk;
input		 			ln2clk;
input		 			rd_en_b;
input		 			rd_en_d1_a;
input	[1:0]	 			rpda_lft;
input	[1:0]	 			rpda_rgt;
input	[3:0]	 			rpdb_lft;
input	[3:0]	 			rpdb_rgt;
input	[3:0]	 			rpdc_lft;
input	[3:0]	 			rpdc_rgt;
input		 			w_inhibit_l;
input		 			wr_en_b;
input		 			wr_en_d1_a;
input   [1:0]	 			wr_way_b;
input   [1:0]	 			wr_way_b_l;

// Added vnw_ary pin for n2 for 2.0

input                                   vnw_ary;

output  [`L2T_ARR_D_WIDTH - 1:0]	sao_mx0_h;
output  [`L2T_ARR_D_WIDTH - 1:0]	sao_mx0_l;
output  [`L2T_ARR_D_WIDTH - 1:0]	sao_mx1_h;
output  [`L2T_ARR_D_WIDTH - 1:0]	sao_mx1_l;


reg 	[`L2T_ARR_D_WIDTH + 2:0]    	mem_lft[`L2T_ARR_DEPTH - 1 :0];	//one extra bit for redundancy
reg 	[0:`L2T_ARR_D_WIDTH - 2]    	mem_rgt[`L2T_ARR_DEPTH - 1 :0];
reg 	[`L2T_ARR_D_WIDTH + 2:0]    	mem_lft_reg ;
reg 	[0:`L2T_ARR_D_WIDTH - 2]    	mem_rgt_reg ; 			// one entry of the memonry


reg  	[`L2T_ARR_D_WIDTH + 2:0]	mem_data_lft;
reg  	[0:`L2T_ARR_D_WIDTH - 2]	mem_data_rgt;

reg  	[14:0]				rdata0_lft;
reg  	[14:0]				rdata1_lft;
reg  	[0:12]				rdata0_rgt;
reg  	[0:12]				rdata1_rgt;
reg  	[30:0]				wdata_lft;
reg  	[30:0]				wdata_rgt;
reg  	[29:0]				tmp_lft;
reg  	[25:0]				tmp_rgt;

wire  	[14:0]				mem0_lft;
wire  	[14:0]				mem1_lft;
wire  	[12:0]				mem0_rgt;
wire  	[12:0]				mem1_rgt;
wire  	[30:0]				mem_all_lft;
wire  	[26:0]				mem_all_rgt;
wire  	[30:0]				rdata_out_lft;
wire  	[26:0]				rdata_out_rgt;
integer				 	i;
integer				 	j;
integer				 	l;
integer				 	k;

reg  	[`L2T_ARR_D_WIDTH - 1:0] sao_mx0_h ;	
reg  	[`L2T_ARR_D_WIDTH - 1:0] sao_mx0_l ;	
reg  	[`L2T_ARR_D_WIDTH - 1:0] sao_mx1_h ;	
reg  	[`L2T_ARR_D_WIDTH - 1:0] sao_mx1_l ;	

wire  	[`L2T_ARR_D_WIDTH - 1:0] rdata0_out ;	
wire  	[`L2T_ARR_D_WIDTH - 1:0] rdata1_out ;	
//-----------------------------------------------------------------
//	  	INITIALIZE MEMORY	
//-----------------------------------------------------------------
`ifndef NOINITMEM
initial begin
	for (i = 0; i < `L2T_ARR_DEPTH - 1; i = i + 1)
          begin
             mem_rgt[i]=27'h0;
             mem_lft[i]=31'h0;
          end
	end
`endif


//-----------------------------------------------------------------
//	  	UNUSED SIGNALS	
//-----------------------------------------------------------------
assign	ln1clk_unused		= ln1clk;
assign	ln2clk_unused		= ln2clk;
assign	l1clk_int_v2_unused	= l1clk_internal_v2;
assign	rd_en_b_unused		= rd_en_b;
assign	wr_en_b_unused		= wr_en_b;
assign	wr_way_b_unused[1:0]	= wr_way_b_l[1:0];


assign	l1clk_int		= l1clk_internal_v1;

//-----------------------------------------------------------------
//	 	OUTPUTS	
//-----------------------------------------------------------------
//
//always @ (l1clk_int or rd_en)
//  if (l1clk_int || ~rd_en)	
//    begin
//	sao_mx0_h [`L2T_ARR_D_WIDTH - 1:0] <=   28'h0;
//	sao_mx0_l [`L2T_ARR_D_WIDTH - 1:0] <=   28'h0;
//	sao_mx1_h [`L2T_ARR_D_WIDTH - 1:0] <=   28'h0;
//	sao_mx1_l [`L2T_ARR_D_WIDTH - 1:0] <=   28'h0;
//    end
//
//-----------------------------------------------------------------
//	  	INTERNAL LOGIC	
//-----------------------------------------------------------------
// Add vnw_ary high check for read operation for n2_to_2.0
// assign rd_en =  rd_en_d1_a && ~wr_en_d1_a && w_inhibit_l;
  assign rd_en =  rd_en_d1_a && ~wr_en_d1_a && w_inhibit_l && vnw_ary;

//-----------------------------------------------------------------
//			REDUNDANCY
//-----------------------------------------------------------------
// Use [511:0] way0[29] as the redundancy bit, there are total 512 redundancy
// bits. 
// Left side  :	way0_tmp[29:15] = mem0_lft[14:0]
//	       	way1_tmp[27:13] = mem1_lft[14:0]
//	       	way0_tmp[14]    = red_bit_lft     (redundancy bit)	
//	Shift mem1_lft[n] -> mem0_lft[n] , shift mem0_lft[n]->men1_rgt[n-1]
// 			 mem0_lft[0]->redundancy bit = red_bit_lft.
//
// Right side : way0_tmp[12:0] = mem0_rgt[12:0]
//	       	way1_tmp[12:0] = mem1_rgt[12:0]
//	       	way0_tmp[13]    = red_bit_rgt     (redundancy bit)	
//	Shift mem1_rgt[n] -> mem0_rgt[n] , shift mem0_rgt[n]->men1_rgt[n+1]
// 			 mem0_rgt[0]->redundancy bit = red_bit_rgt.
//
//-----------------------------------------------------------------

//-----------------------------------------------------------------
// recover the shift index from rpda, rpdb, rpdc
//-----------------------------------------------------------------
assign  sf_l[4]				= rpda_lft[1] ;
assign  sf_l[3:2]			= rpdb_lft[3] ? 2'b11 :
					  rpdb_lft[2] ? 2'b10 :
					  rpdb_lft[1] ? 2'b01 : 
					  2'b00;
assign  sf_l[1:0]			= rpdc_lft[3] ? 2'b11 :
					  rpdc_lft[2] ? 2'b10 :
					  rpdc_lft[1] ? 2'b01 : 
					  2'b00;

assign  sf_r[4]				= rpda_rgt[1] ;
assign  sf_r[3:2]			= rpdb_rgt[3] ? 2'b11 :
					  rpdb_rgt[2] ? 2'b10 :
					  rpdb_rgt[1] ? 2'b01 : 
					  2'b00;
assign  sf_r[1:0]			= rpdc_rgt[3] ? 2'b11 :
					  rpdc_rgt[2] ? 2'b10 :
					  rpdc_rgt[1] ? 2'b01 : 
					  2'b00;

assign  shift_en_lft			= (sf_l[4:0] < 5'd30) ? (|rpda_lft[1:0]) && (|rpdb_lft[3:0]) && (|rpdc_lft[3:0]) : 1'b0;
assign  shift_en_rgt			= (sf_r[4:0] < 5'd26) ? (|rpda_rgt[1:0]) && (|rpdb_rgt[3:0]) && (|rpdc_rgt[3:0]) : 1'b0;

assign  redundancy_en			= shift_en_lft || shift_en_rgt;

assign  sh_index_lft[4:0]		= shift_en_lft && (sf_l[4:0] < 5'd30) ? sf_l[4:0] : 5'b00000;
assign  sh_index_rgt[4:0]		= shift_en_rgt && (sf_r[4:0] < 5'd26) ? sf_r[4:0] : 5'b00000;



//-----------------------------------------------------------------
//		Write Arrays 
//-----------------------------------------------------------------


//--------------------------------------
//  Write Redundancy Mapping
//--------------------------------------
// Shifting of redundancy base on the sh_index_lft and sh_index_rgt

wire [14:0]	din_lft 	;
wire [0:12]	din_rgt 	;
assign din_lft[14:0]	= din[27:13];
assign din_rgt[0:12]	= din[12:0];

// Add vnw_high check for write operation (implemented for n2_to_2.0)

assign mem_wr_en0	= wr_way_b[0] &&   wr_en_b && ~rd_en_b && w_inhibit_l && wr_en_d1_a && vnw_ary;
assign mem_wr_en1	= wr_way_b[1] &&   wr_en_b && ~rd_en_b && w_inhibit_l && wr_en_d1_a && vnw_ary;




//-------left-------
always @ (sh_index_lft or  din_lft[14:0] or shift_en_lft or mem_wr_en0 or mem_wr_en1 
	  or l1clk_int or  addr_b[8:0] )


    #0

begin 


  mem_lft_reg[`L2T_ARR_D_WIDTH + 2:0] = mem_lft[addr_b] ;



// Write to redundant bit in write cycle for way0 with no redundancy
   if (l1clk_int && (~shift_en_lft) && mem_wr_en0) 
      begin	
          mem_lft_reg[0]      = din_lft[0];	
      end	  

  for (i=14; i >= 0; i=i-1)
  begin
    if (mem_wr_en0 && l1clk_int)		//way0
      begin
        if (( sh_index_lft < (2*i)) || ~shift_en_lft)
          mem_lft_reg[2*i+1]  = din_lft[i];	//no shift
	else
	 begin
          mem_lft_reg[2*i]  = din_lft[i];	// shift
	 end
      end
	  if(shift_en_lft)        
          mem_lft_reg[sh_index_lft+1]  = 1'bx;	// write "x" to bad bit
   end	//for   
	   
  for (i=14; i >= 0; i=i-1)
  begin
    if (mem_wr_en1 && l1clk_int )		//way1
      begin
        if (( sh_index_lft < (2*i + 1)) || ~shift_en_lft)
          mem_lft_reg[2*i+2]  = din_lft[i];	//no shift
	else
	begin
          mem_lft_reg[2*i+1]  = din_lft[i];	//shift
	end
      end
	  if(shift_en_lft)        
          mem_lft_reg[sh_index_lft+1]  = 1'bx;  //write "x" to bad bit 
  end	   

  if (l1clk_int)  mem_lft[addr_b] =  mem_lft_reg[`L2T_ARR_D_WIDTH + 2:0] ;


end

//-------right-------

always @ (sh_index_rgt or  din_rgt[0:12] or shift_en_rgt or mem_wr_en0 or mem_wr_en1 
	  or l1clk_int or  addr_b[8:0] )


    #0

begin 

  mem_rgt_reg[0 : `L2T_ARR_D_WIDTH - 2]  = mem_rgt[addr_b];



// Write to redundant bit in write cycle for way0 with no redundancy
   if (l1clk_int && (~shift_en_rgt) && mem_wr_en0) 
      begin	
          mem_rgt_reg[0]      = din_rgt[0];	
      end	  

  for (k=12; k >= 0; k=k-1)
  begin
    if (mem_wr_en0 && l1clk_int)		//WAY0
      begin
        if (( sh_index_rgt < (2*k )) || ~shift_en_rgt)
          mem_rgt_reg[2*k+1]  = din_rgt[k];	//no shift
	else
	 begin
          mem_rgt_reg[2*k]  = din_rgt[k];	// shift
	 end
      end
	  if(shift_en_rgt)        
          mem_rgt_reg[sh_index_rgt+1]   = 1'bx; // Write "X" to the bad bit
   end	//for   
	   
  for (k=12; k >= 0; k=k-1)
  begin
    if (mem_wr_en1 && l1clk_int )		//WAY1
      begin
        if (( sh_index_rgt < (2*k + 1)) || ~shift_en_rgt)
          mem_rgt_reg[2*k+2]  = din_rgt[k];	//no shift
	else
	 begin
          mem_rgt_reg[2*k+1]  = din_rgt[k];	// shift
	  end
      end
	  if(shift_en_rgt)        
          mem_rgt_reg[sh_index_rgt+1]   = 1'bx; // Write "X" to the bad bit
  end  //for	   

  if (l1clk_int) mem_rgt[addr_b] =  mem_rgt_reg[0 : `L2T_ARR_D_WIDTH - 2] ;



end

//-----------------------------------------------------------------
//		Read Arrays 
//-----------------------------------------------------------------

//--------------------------------------
//  Read Redundancy Mapping
//--------------------------------------


//---------Left--------------
always @ (sh_index_lft or  shift_en_lft or rd_en or l1clk_int or  addr_b[8:0] )
begin 	
  if (l1clk_int)		
  begin
  
    mem_data_lft[`L2T_ARR_D_WIDTH + 2:0] = ~rd_en ? 31'hx : mem_lft[addr_b] ;
  
  end


  if (rd_en && ~l1clk_int)


  begin	  

    for (j=14; j >= 0; j=j-1)	//WAY0	
    begin
        if (( sh_index_lft < (2*j )) || ~shift_en_lft)
	  rdata0_lft[j]	      	= mem_data_lft[2*j+1];  // no shift
	else
          rdata0_lft[j]  	= mem_data_lft[2*j];	// shift
     end	//for   
	   
    for (j=14; j >= 0; j=j-1)	//WAY1
      begin
        if (( sh_index_lft < (2*j + 1)) || ~shift_en_lft)
          rdata1_lft[j]  = mem_data_lft[2*j+2];	//no shift
	else
          rdata1_lft[j]  = mem_data_lft[2*j+1];	// shift
      end
      sao_mx0_h[27:13] =  rdata0_lft[14:0]  & {15{rd_en}};
      sao_mx0_l[27:13] = ~rdata0_lft[14:0]  & {15{rd_en}};
      sao_mx1_h[27:13] =  rdata1_lft[14:0]  & {15{rd_en}};
      sao_mx1_l[27:13] = ~rdata1_lft[14:0]  & {15{rd_en}};
  end	   
 else if(l1clk_int || ~rd_en)
	begin
	sao_mx0_h[27:13] = 15'h0;
      	sao_mx0_l[27:13] = 15'h0;
      	sao_mx1_h[27:13] = 15'h0;
      	sao_mx1_l[27:13] = 15'h0;
	end
end

//---------Right--------------

always @ (sh_index_rgt or  shift_en_rgt or rd_en or l1clk_int or  addr_b[8:0] )
	  
begin 	
  if (l1clk_int)		
  begin

    mem_data_rgt[0: `L2T_ARR_D_WIDTH - 2] = ~rd_en ? 27'hx : mem_rgt[addr_b] ;

  end 


  if (rd_en && ~l1clk_int)


    begin

    for (l=12; l >= 0; l=l-1)	//WAY0	
    begin
        if (( sh_index_rgt < (2*l)) || ~shift_en_rgt)
	  rdata0_rgt[l]	      	= mem_data_rgt[2*l+1];  // no shift
	else
          rdata0_rgt[l]  	= mem_data_rgt[2*l];	// shift
     end	//for   
	   
    for (l=12; l >= 0; l=l-1)	//WAY1
      begin
        if (( sh_index_rgt < (2*l + 1)) || ~shift_en_rgt)
          rdata1_rgt[l]  = mem_data_rgt[2*l+2];	//no shift
	else
          rdata1_rgt[l]  = mem_data_rgt[2*l+1];	// shift
      end
         sao_mx0_h[12:0] =  rdata0_rgt[0:12]  & {13{rd_en}};
         sao_mx0_l[12:0] = ~rdata0_rgt[0:12]  & {13{rd_en}};
         sao_mx1_h[12:0] =  rdata1_rgt[0:12]  & {13{rd_en}};
         sao_mx1_l[12:0] = ~rdata1_rgt[0:12]  & {13{rd_en}};
  end	   
  else if (l1clk_int || ~rd_en)
        begin
        sao_mx0_h[12:0] = 13'h0;
        sao_mx0_l[12:0] = 13'h0;
        sao_mx1_h[12:0] = 13'h0;
        sao_mx1_l[12:0] = 13'h0;
        end
end


endmodule

