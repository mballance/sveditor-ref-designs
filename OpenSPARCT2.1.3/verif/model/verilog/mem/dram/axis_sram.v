// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: axis_sram.v
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
`ifndef BLK_1GIG
`ifndef BLK_2GIG
`ifndef BLK_4GIG
`ifndef BLK_8GIG
`define BLK_1GIG
`endif
`endif
`endif
`endif

module dram_data (
                      clk,
                      rd_adr0,
                      rd_adr1,
                      dout0,
                      dout1,
                      eout1,
                      wr_adr0,
                      we_0,
                      din_0, 
                      dram_dump
                 );

   input              clk;
   input  [24:0]      rd_adr0;
   input  [25:0]      rd_adr1; // Bit 25 is address parity
   output [127:0]     dout0;
   output [127:0]     dout1;
   output [ 15:0]     eout1;
   input  [25:0]      wr_adr0;
   input              we_0;
   input  [143:0]     din_0;
   input              dram_dump;

wire              a_clk = clk;
wire  [21:0]      a_rd_adr0 = {rd_adr0[24:19],rd_adr0[15:0]};
wire  [22:0]      b_rd_adr0 = {rd_adr0[24:19],rd_adr0[16:0]};
wire  [23:0]      c_rd_adr0 = {rd_adr0[24:19],rd_adr0[17:0]};
wire  [24:0]      d_rd_adr0 = {rd_adr0[24:19],rd_adr0[18:0]};
wire  [21:0]      a_rd_adr1 = {rd_adr1[24:19],rd_adr1[15:0]};
wire  [22:0]      b_rd_adr1 = {rd_adr1[24:19],rd_adr1[16:0]};
wire  [23:0]      c_rd_adr1 = {rd_adr1[24:19],rd_adr1[17:0]};
wire  [24:0]      d_rd_adr1 = {rd_adr1[24:19],rd_adr1[18:0]};
wire [127:0]     a_dout0;
wire [127:0]     a_dout1;
wire [ 16:0]     a_eout1;
wire  [21:0]      a_wr_adr0 = {wr_adr0[24:19],wr_adr0[15:0]};
wire  [22:0]      b_wr_adr0 = {wr_adr0[24:19],wr_adr0[16:0]};
wire  [23:0]      c_wr_adr0 = {wr_adr0[24:19],wr_adr0[17:0]};
wire  [24:0]      d_wr_adr0 = {wr_adr0[24:19],wr_adr0[18:0]};
wire  [127:0]     a_din_0  = din_0; 
wire              a_we_0   = we_0;
wire  [ 16:0]     a_ein_0  = {1'b1,din_0[143:128]}; 

`ifdef PALLADIUM

`ifdef BLK_1GIG
reg  /*sparse */       [127:0]   DRAM             [22'h3FFFFF:0];
assign dout0[127:0] = DRAM[(a_rd_adr0 & 22'h3FFFFF)];
assign dout1[127:0] = DRAM[(a_rd_adr1 & 22'h3FFFFF)];
 `endif
`ifdef BLK_2GIG
reg  /*sparse */        [127:0]   DRAM             [23'h7FFFFF:0];
assign dout0[127:0] = DRAM[(b_rd_adr0 & 23'h7FFFFF)];
assign dout1[127:0] = DRAM[(b_rd_adr1 & 23'h7FFFFF)];
 `endif
`ifdef BLK_4GIG
reg  /*sparse */        [127:0]   DRAM             [24'hFFFFFF:0];
assign dout0[127:0] = DRAM[(d_rd_adr0 & 24'hFFFFFF)];
assign dout1[127:0] = DRAM[(d_rd_adr1 & 24'hFFFFFF)];
 `endif
`ifdef BLK_8GIG
reg /*sparse */         [127:0]   DRAM             [25'h1FFFFFF:0];
assign dout0[127:0] = DRAM[(d_rd_adr0 & 25'h1FFFFFF)];
assign dout1[127:0] = DRAM[(d_rd_adr1 & 25'h1FFFFFF)];
 `endif

wire a0_we_0 = a_we_0 & ~c_wr_adr0[23];
wire a1_we_0 = a_we_0 &  c_wr_adr0[23];
wire  [127:0]     a_din_0  = din_0[127:0]; 

always @(posedge clk) begin
`ifdef BLK_1GIG if (a_we_0) DRAM[(a_wr_adr0 & 22'h3FFFFF)] <= din_0; `endif
`ifdef BLK_2GIG if (a_we_0) DRAM[(b_wr_adr0 & 23'h7FFFFF)] <= din_0; `endif
`ifdef BLK_4GIG if (a0_we_0) DRAM  [(c_wr_adr0 & 24'hFFFFFF)] <= din_0; `endif
`ifdef BLK_8GIG if (a_we_0) DRAM[(d_wr_adr0 & 25'h1FFFFFF)] <= din_0; `endif

 if (we_0 & dram_dump) $display("WD=%h", din_0);
end

`else // !`ifdef PALLADIUM

wire [15:0] ecc_out;
dram_ecc_gen   ecc_gen ( .data(dout1[127:0]), .ecc(ecc_out[15:0]) );

`ifdef AXIS

assign eout1[ 15:0] = a_eout1[16] ? a_eout1[15:0] : (ecc_out[15:0] ^ {16{rd_adr1[25]}});
assign dout0[127:0] = a_dout0;
assign dout1[127:0] = a_dout1;



`ifdef BLK_1GIG
axis_smem #(22, 128, 3, 0) DRAM 
(
    {128'bz,         a_dout0,         a_dout1  }, // Data Out
    {a_din_0,        128'bz,          128'bz   }, // Data In
    {a_wr_adr0,      a_rd_adr0,       a_rd_adr1}, // Address
    {a_we_0,         1'b0,            1'b0     }, // Write Enable : Active High , 1'b0 means always read
    {1'b1,           1'b1,            1'b1     }, // Chip Enable
    {a_clk,          1'bz,            1'bz     }, // Clocks : 1'bz means asynchronous
    {128'bz,         128'bz,          128'bz   }  // Mask
);
axis_smem #(22, 17 , 2, 0) DRAM_ECC 
(
    { 17'bz,                          a_eout1  }, // Data Out
    {a_ein_0,                          17'bz   }, // Data In
    {a_wr_adr0,                       a_rd_adr1}, // Address
    {a_we_0,                          1'b0     }, // Write Enable : Active High , 1'b0 means always read
    {1'b1,                            1'b1     }, // Chip Enable
    {a_clk,                           1'bz     }, // Clocks : 1'bz means asynchronous
    { 17'bz,                           17'bz   }  // Mask
);
`endif
`ifdef BLK_2GIG
axis_smem #(23, 128, 3, 0) DRAM 
(
    {128'bz,         a_dout0,         a_dout1  }, // Data Out
    {a_din_0,        128'bz,          128'bz   }, // Data In
    {b_wr_adr0,      b_rd_adr0,       b_rd_adr1}, // Address
    {a_we_0,         1'b0,            1'b0     }, // Write Enable : Active High , 1'b0 means always read
    {1'b1,           1'b1,            1'b1     }, // Chip Enable
    {a_clk,          1'bz,            1'bz     }, // Clocks : 1'bz means asynchronous
    {128'bz,         128'bz,          128'bz   }  // Mask
);
axis_smem #(23, 17 , 2, 0) DRAM_ECC
(
    { 17'bz,                          a_eout1  }, // Data Out
    {a_ein_0,                          17'bz   }, // Data In
    {b_wr_adr0,                       b_rd_adr1}, // Address
    {a_we_0,                          1'b0     }, // Write Enable : Active High , 1'b0 means always read
    {1'b1,                            1'b1     }, // Chip Enable
    {a_clk,                           1'bz     }, // Clocks : 1'bz means asynchronous
    { 17'bz,                           17'bz   }  // Mask
);
`endif
`ifdef BLK_4GIG
//{{{  
`ifdef TAGGED_DRAM
wire [23:13] tag_addr_a = c_wr_adr0[23:13];
wire tag_din_a=1'b1;
axis_smem #(24-13, 1, 1, 0, 1'b0) tag_a (
{1'bz},
{tag_din_a},
{tag_addr_a},
{a_we_0},
{1'b1},
{a_clk},
{1'bz});

wire [23:13] tag_addr_b = c_wr_adr0[23:13];
wire tag_din_b=1'b1;
axis_smem #(24-13, 1, 1, 0, 1'b0) tag_b (
{1'bz},
{tag_din_b},
{tag_addr_b},
{a_we_0},
{1'b1},
{a_clk},
{1'bz});
`endif
//}}}  
wire [63:0] a_dout0a;
wire [63:0] a_dout1a;
wire [63:0] a_din0a=a_din_0[63:0];
wire [63:0] a_dout0b;
wire [63:0] a_dout1b;
wire [63:0] a_din0b=a_din_0[127:64];
assign a_dout0={a_dout0b,a_dout0a};
assign a_dout1={a_dout1b,a_dout1a};
initial $axis_initmem(0, DRAM);
initial $axis_initmem(0, DRAM1);
`ifdef TAGGED_DRAM
axis_smem #(24, 64, 3, 0, 1'b0, "D", "tag_a") DRAM
`else
axis_smem #(24, 64, 3, 0) DRAM
`endif
(
    {64'bz,         a_dout0a,         a_dout1a  }, // Data Out
    {a_din0a,        64'bz,          64'bz    }, // Data In
    {c_wr_adr0,      c_rd_adr0,       c_rd_adr1}, // Address
    {a_we_0,         1'b0,            1'b0      }, // Write Enable : Active High , 1'b0 means always read
    {1'b1,           1'b1,            1'b1      }, // Chip Enable
    {a_clk,          1'bz,            1'bz      }, // Clocks : 1'bz means asynchronous
    {64'bz,         64'bz,          64'bz    }  // Mask
);

`ifdef TAGGED_DRAM
axis_smem #(24, 64, 3, 0, 1'b0, "D", "tag_b") DRAM1
`else
axis_smem #(24, 64, 3, 0) DRAM1
`endif
(
    {64'bz,         a_dout0b,         a_dout1b  }, // Data Out
    {a_din0b,        64'bz,          64'bz    }, // Data In
    {c_wr_adr0,      c_rd_adr0,       c_rd_adr1}, // Address
    {a_we_0,         1'b0,            1'b0      }, // Write Enable : Active High , 1'b0 means always read
    {1'b1,           1'b1,            1'b1      }, // Chip Enable
    {a_clk,          1'bz,            1'bz      }, // Clocks : 1'bz means asynchronous
    {64'bz,          64'bz,           64'bz    }  // Mask
);
axis_smem #(24, 17 , 2, 0) DRAM_ECC
(
    { 17'bz,                          a_eout1  }, // Data Out
    {a_ein_0,                          17'bz   }, // Data In
    {c_wr_adr0,                       c_rd_adr1}, // Address
    {a_we_0,                          1'b0     }, // Write Enable : Active High , 1'b0 means always read
    {1'b1,                            1'b1     }, // Chip Enable
    {a_clk,                           1'bz     }, // Clocks : 1'bz means asynchronous
    { 17'bz,                           17'bz   }  // Mask
);

`endif
`ifdef BLK_8GIG
axis_smem #(25, 128, 3, 0) DRAM 
(
    {128'bz,         a_dout0,         a_dout1  }, // Data Out
    {a_din_0,        128'bz,          128'bz   }, // Data In
    {d_wr_adr0,      d_rd_adr0,       d_rd_adr1}, // Address
    {a_we_0,         1'b0,            1'b0     }, // Write Enable : Active High , 1'b0 means always read
    {1'b1,           1'b1,            1'b1     }, // Chip Enable
    {a_clk,          1'bz,            1'bz     }, // Clocks : 1'bz means asynchronous
    {128'bz,         128'bz,          128'bz   }  // Mask
);
`endif

reg [127:0] din_0_r;

always @(posedge clk) begin
 din_0_r <= din_0;
 if (we_0 & dram_dump)
   begin // axis tbcall_region
    $display("WD=%h", din_0_r);
   end
end 

`else
assign eout1[ 15:0] = (ecc_out[15:0] ^ {16{rd_adr1[25]}});
initial $display("WARNING: storage of ECC codes not supported in this dram model on non-axis platforms");

`ifdef BLK_1GIG
reg  /*sparse */       [127:0]   DRAM             [22'h3FFFFF:0];
assign dout0[127:0] = DRAM[(a_rd_adr0 & 22'h3FFFFF)];
assign dout1[127:0] = DRAM[(a_rd_adr1 & 22'h3FFFFF)];
`endif
`ifdef BLK_2GIG
reg  /*sparse */        [127:0]   DRAM             [23'h7FFFFF:0];
assign dout0[127:0] = DRAM[(b_rd_adr0 & 23'h7FFFFF)];
assign dout1[127:0] = DRAM[(b_rd_adr1 & 23'h7FFFFF)];
`endif
`ifdef BLK_4GIG
reg  /*sparse */        [127:0]   DRAM             [24'hFFFFFF:0];
assign dout0[127:0] = DRAM[(d_rd_adr0 & 24'hFFFFFF)];
assign dout1[127:0] = DRAM[(d_rd_adr1 & 24'hFFFFFF)];
`endif
`ifdef BLK_8GIG
reg /*sparse */         [127:0]   DRAM             [25'h1FFFFFF:0];
assign dout0[127:0] = DRAM[(d_rd_adr0 & 25'h1FFFFFF)];
assign dout1[127:0] = DRAM[(d_rd_adr1 & 25'h1FFFFFF)];
 `endif

integer j;
initial
begin
`ifdef BLK_1GIG for (j=22'h3F0000 ; j<=22'h3FFFFF ; j=j+1) DRAM [j] = 128'h0; `endif
`ifdef BLK_2GIG for (j=23'h7E0000 ; j<=23'h7FFFFF ; j=j+1) DRAM [j] = 128'h0; `endif
`ifdef BLK_4GIG for (j=23'h7C0000 ; j<=24'h7FFFFF ; j=j+1) DRAM [j] = 128'h0; `endif
`ifdef BLK_4GIG for (j=20'h00000  ; j<=24'hFFFFF  ; j=j+1) DRAM [j] = 128'h0; `endif
`ifdef BLK_8GIG for (j=25'h1F80000; j<=25'h1FFFFFF; j=j+1) DRAM [j] = 128'h0; `endif
end // of initial

wire a0_we_0 = a_we_0 & ~c_wr_adr0[23];
wire a1_we_0 = a_we_0 &  c_wr_adr0[23];

always @(posedge clk) begin
`ifdef BLK_1GIG if (a_we_0) DRAM[(a_wr_adr0 & 22'h3FFFFF)] <= din_0; `endif 
`ifdef BLK_2GIG if (a_we_0) DRAM[(b_wr_adr0 & 23'h7FFFFF)] <= din_0; `endif 
`ifdef BLK_4GIG if (a0_we_0) DRAM  [(c_wr_adr0 & 24'hFFFFFF)] <= din_0; `endif
`ifdef BLK_8GIG if (a_we_0) DRAM[(d_wr_adr0 & 25'h1FFFFFF)] <= din_0; `endif 

 if (we_0 & dram_dump) $display("WD=%h", din_0);
end 

`endif //AXIS
`endif // !`ifdef PALLADIUM

endmodule



module dram_dir (
                      adr0,
                      adr1,
                      adr2,
                      adr3,
                      adr4,
                      data0,
                      data1,
                      data2,
                      data3,
                      data4 
                 );


   input  [18:0]       adr0;
   input  [18:0]       adr1;
   input  [18:0]       adr2;
   input  [18:0]       adr3;
   input  [18:0]       adr4;
   output [31:0]      data0;
   output [31:0]      data1;
   output [31:0]      data2;
   output [31:0]      data3;
   output [31:0]      data4;

   wire   [15:0]       a_adr0 = adr0[15:0];
   wire   [15:0]       a_adr1 = adr1[15:0];
   wire   [15:0]       a_adr2 = adr2[15:0];
   wire   [15:0]       a_adr3 = adr3[15:0];
   wire   [15:0]       a_adr4 = adr4[15:0];
   wire   [16:0]       b_adr0 = adr0[16:0];
   wire   [16:0]       b_adr1 = adr1[16:0];
   wire   [16:0]       b_adr2 = adr2[16:0];
   wire   [16:0]       b_adr3 = adr3[16:0];
   wire   [16:0]       b_adr4 = adr4[16:0];
   wire   [17:0]       c_adr0 = adr0[17:0];
   wire   [17:0]       c_adr1 = adr1[17:0];
   wire   [17:0]       c_adr2 = adr2[17:0];
   wire   [17:0]       c_adr3 = adr3[17:0];
   wire   [17:0]       c_adr4 = adr4[17:0];
   wire   [18:0]       d_adr0 = adr0[18:0];
   wire   [18:0]       d_adr1 = adr1[18:0];
   wire   [18:0]       d_adr2 = adr2[18:0];
   wire   [18:0]       d_adr3 = adr3[18:0];
   wire   [18:0]       d_adr4 = adr4[18:0];
   wire   [31:0]      a_data0;
   wire   [31:0]      a_data1;
   wire   [31:0]      a_data2;
   wire   [31:0]      a_data3;
   wire   [31:0]      a_data4;

`ifdef PALLADIUM

`ifdef BLK_1GIG
reg /*sparse */ [31:0] DRAM_DIR [16'hFFFF:0];
assign data0[31:0] = DRAM_DIR[a_adr0];
assign data1[31:0] = DRAM_DIR[a_adr1];
assign data2[31:0] = DRAM_DIR[a_adr2];
assign data3[31:0] = DRAM_DIR[a_adr3];
assign data4[31:0] = DRAM_DIR[a_adr4];
 `endif
`ifdef BLK_2GIG
reg  [31:0] DRAM_DIR [17'h1FFFF:0];
assign data0[31:0] = DRAM_DIR[b_adr0];
assign data1[31:0] = DRAM_DIR[b_adr1];
assign data2[31:0] = DRAM_DIR[b_adr2];
assign data3[31:0] = DRAM_DIR[b_adr3];
assign data4[31:0] = DRAM_DIR[b_adr4];
 `endif
`ifdef BLK_4GIG
reg  [31:0] DRAM_DIR [18'h3FFFF:0];
assign data0[31:0] = DRAM_DIR[c_adr0];
assign data1[31:0] = DRAM_DIR[c_adr1];
assign data2[31:0] = DRAM_DIR[c_adr2];
assign data3[31:0] = DRAM_DIR[c_adr3];
assign data4[31:0] = DRAM_DIR[c_adr4];
 `endif
`ifdef BLK_8GIG
reg   [31:0] DRAM_DIR [19'h7FFFF:0];
assign data0[31:0] = DRAM_DIR[d_adr0];
assign data1[31:0] = DRAM_DIR[d_adr1];
assign data2[31:0] = DRAM_DIR[d_adr2];
assign data3[31:0] = DRAM_DIR[d_adr3];
assign data4[31:0] = DRAM_DIR[d_adr4];
 `endif

`else // !`ifdef PALLADIUM

`ifdef AXIS
assign data0[31:0] = a_data0;
assign data1[31:0] = a_data1;
assign data2[31:0] = a_data2;
assign data3[31:0] = a_data3;
assign data4[31:0] = a_data4;

`ifdef BLK_1GIG
axis_smem #(16,  32, 5, 0) DRAM_DIR 
(
    {a_data0,    a_data1,     a_data2,    a_data3,    a_data4}, // Data Out
    {32'bz  ,    32'bz,       32'bz,       32'bz,       32'bz}, // Data In
    {a_adr0 ,    a_adr1,      a_adr2,     a_adr3,     a_adr4 }, // Address
    {1'b0   ,     1'b0 ,       1'b0,       1'b0,       1'b0  }, // Write Enable : 1'b0 means always read
    {1'b1   ,     1'b1 ,       1'b1,       1'b1,       1'b1  }, // Chip Enable
    {1'bz   ,     1'bz ,       1'bz,       1'bz,       1'bz  }, // Clocks : 1'bz means asynchronous
    {32'bz  ,    32'bz ,      32'bz,      32'bz,      32'bz  }  // Mask
);
`endif
`ifdef BLK_2GIG
axis_smem #(17,  32, 5, 0) DRAM_DIR 
(
    {a_data0,    a_data1,     a_data2,    a_data3,    a_data4}, // Data Out
    {32'bz  ,    32'bz,       32'bz,       32'bz,       32'bz}, // Data In
    {b_adr0 ,    b_adr1,      b_adr2,     b_adr3,     b_adr4 }, // Address
    {1'b0   ,     1'b0 ,       1'b0,       1'b0,       1'b0  }, // Write Enable : 1'b0 means always read
    {1'b1   ,     1'b1 ,       1'b1,       1'b1,       1'b1  }, // Chip Enable
    {1'bz   ,     1'bz ,       1'bz,       1'bz,       1'bz  }, // Clocks : 1'bz means asynchronous
    {32'bz  ,    32'bz ,      32'bz,      32'bz,      32'bz  }  // Mask
);
`endif
`ifdef BLK_4GIG
axis_smem #(18,  32, 5, 0) DRAM_DIR 
(
    {a_data0,    a_data1,     a_data2,    a_data3,    a_data4}, // Data Out
    {32'bz  ,    32'bz,       32'bz,       32'bz,       32'bz}, // Data In
    {c_adr0 ,    c_adr1,      c_adr2,     c_adr3,     c_adr4 }, // Address
    {1'b0   ,     1'b0 ,       1'b0,       1'b0,       1'b0  }, // Write Enable : 1'b0 means always read
    {1'b1   ,     1'b1 ,       1'b1,       1'b1,       1'b1  }, // Chip Enable
    {1'bz   ,     1'bz ,       1'bz,       1'bz,       1'bz  }, // Clocks : 1'bz means asynchronous
    {32'bz  ,    32'bz ,      32'bz,      32'bz,      32'bz  }  // Mask
);
`endif
`ifdef BLK_8GIG
axis_smem #(19,  32, 5, 0) DRAM_DIR 
(
    {a_data0,    a_data1,     a_data2,    a_data3,    a_data4}, // Data Out
    {32'bz  ,    32'bz,       32'bz,       32'bz,       32'bz}, // Data In
    {d_adr0 ,    d_adr1,      d_adr2,     d_adr3,     d_adr4 }, // Address
    {1'b0   ,     1'b0 ,       1'b0,       1'b0,       1'b0  }, // Write Enable : 1'b0 means always read
    {1'b1   ,     1'b1 ,       1'b1,       1'b1,       1'b1  }, // Chip Enable
    {1'bz   ,     1'bz ,       1'bz,       1'bz,       1'bz  }, // Clocks : 1'bz means asynchronous
    {32'bz  ,    32'bz ,      32'bz,      32'bz,      32'bz  }  // Mask
);
`endif

`else

`ifdef BLK_1GIG
reg /*sparse */ [31:0] DRAM_DIR [16'hFFFF:0];
assign data0[31:0] = DRAM_DIR[a_adr0];
assign data1[31:0] = DRAM_DIR[a_adr1];
assign data2[31:0] = DRAM_DIR[a_adr2];
assign data3[31:0] = DRAM_DIR[a_adr3];
assign data4[31:0] = DRAM_DIR[a_adr4];
 `endif
`ifdef BLK_2GIG
reg  [31:0] DRAM_DIR [17'h1FFFF:0];
assign data0[31:0] = DRAM_DIR[b_adr0];
assign data1[31:0] = DRAM_DIR[b_adr1];
assign data2[31:0] = DRAM_DIR[b_adr2];
assign data3[31:0] = DRAM_DIR[b_adr3];
assign data4[31:0] = DRAM_DIR[b_adr4];
 `endif
`ifdef BLK_4GIG
reg  [31:0] DRAM_DIR [18'h3FFFF:0];
assign data0[31:0] = DRAM_DIR[c_adr0];
assign data1[31:0] = DRAM_DIR[c_adr1];
assign data2[31:0] = DRAM_DIR[c_adr2];
assign data3[31:0] = DRAM_DIR[c_adr3];
assign data4[31:0] = DRAM_DIR[c_adr4];
 `endif
`ifdef BLK_8GIG 
reg   [31:0] DRAM_DIR [19'h7FFFF:0];
assign data0[31:0] = DRAM_DIR[d_adr0];
assign data1[31:0] = DRAM_DIR[d_adr1];
assign data2[31:0] = DRAM_DIR[d_adr2];
assign data3[31:0] = DRAM_DIR[d_adr3];
assign data4[31:0] = DRAM_DIR[d_adr4];
 `endif

integer j;
initial
begin
        for(j=0 ; j<=65535; j=j+1) begin
                DRAM_DIR [j] = 32'hDEADBEEF;
        end
end // of initial


`endif //AXIS
`endif // !`ifdef PALLADIUM

endmodule


module l2data_axis  (data_out, rclk, adr, data_in, we, wm);

output [155:0]   data_out;
input           rclk;
input [9:0]     adr;
input [155:0]   data_in;
input           we;
input [155:0]   wm;

wire            a_rclk = rclk;
wire  [ 9:0]    a_adr = adr;
wire  [127:0]   a_data_in = {data_in[155:124],data_in[116:85],data_in[77:46],data_in[38:7]};           
wire            a_we = we;
wire  [127:0]   a_wm = {wm[155:124],wm[116:85],wm[77:46],wm[38:7]};
wire  [155:0]   a_data_out;
wire  [127:0]   b_data_out;
wire  [127:0]   c_data_out;


`ifdef AXIS
axis_smem #(10, 128, 2, 0) L2      
(
    {128'bz,         c_data_out  }, // Data Out
    {a_data_in,      128'bz      }, // Data In
    {a_adr,          a_adr       }, // Address
    {a_we,           1'b0        }, // Write Enable : Active High , 1'b0 means always read
    {1'b1,           1'b1        }, // Chip Enable
    {a_rclk,         1'bz        }, // Clocks : 1'bz means asynchronous
    {a_wm,           128'bz      }  // Mask
);

assign          b_data_out = c_data_out;

/*****************************
reg [127:0] din_0_r;
reg [  9:0] a_adr_r;
reg [127:0] a_wm_r;

always @(posedge a_rclk) begin
 din_0_r <= a_data_in;
 a_adr_r <= a_adr;
 a_wm_r  <= a_wm;
 if (a_we & l2_dump)
   begin // axis tbcall_region
    $display("L2 ADR=%h WM=%h WD=%h",  a_adr_r, a_wm_r, din_0_r);
   end
end
*****************************/

`else

reg [127:0] L2 [1023:0];
reg [255:0] ERR_BIT;

initial ERR_BIT = 256'h1;

assign b_data_out[127:0] = L2[adr];

wire [128:0] l2_in = (~a_wm[127:0] & b_data_out) | (a_wm[127:0] & a_data_in); 

always @(posedge rclk) begin
  if (we) L2[adr] <= l2_in;
  ERR_BIT <= {ERR_BIT[254:0], ERR_BIT[255]};
end 

`endif

zzecc_sctag_pgen_32b ecc3 ( .dout(a_data_out[155:124]), .parity(a_data_out[123:117]), .din(b_data_out[127:96]) );
zzecc_sctag_pgen_32b ecc2 ( .dout(a_data_out[116: 85]), .parity(a_data_out[ 84: 78]), .din(b_data_out[ 95:64]) );
zzecc_sctag_pgen_32b ecc1 ( .dout(a_data_out[ 77: 46]), .parity(a_data_out[ 45: 39]), .din(b_data_out[ 63:32]) );
zzecc_sctag_pgen_32b ecc0 ( .dout(a_data_out[ 38:  7]), .parity(a_data_out[  6:  0]), .din(b_data_out[ 31: 0]) );

assign data_out[155:0] = a_data_out[155:0]; // ^ ERR_BIT[155:0];  

/*******************
module zzecc_sctag_pgen_32b ( dout, parity, din);

   //Output: 32bit dout and 7bit parity bit
   output[31:0] dout;
   output [6:0] parity;

   //Input: 32bit data din
   input [31:0] din;
*******************/

endmodule



module l2tag_axis (rclk, adr, we, tag_in, tag_out);

input           rclk;
input   [  9:0] adr;
input   [ 27:0] we;
input   [ 27:0] tag_in;
output  [ 27:0] tag_out;

`ifdef AXIS
wire            a_rclk = rclk;
wire    [  9:0] a_adr = adr;
wire    [ 27:0] a_we = we;
wire    [ 27:0] a_tag_in = tag_in;
wire    [ 27:0] a_tag_out;

assign tag_out[27:0] = a_tag_out;

axis_smem #(10, 28, 2, 0) L2_TAG    
(
    { 28'bz,         a_tag_out   }, // Data Out
    {a_tag_in,        28'bz      }, // Data In
    {a_adr,          a_adr       }, // Address
    {1'b1,           1'b0        }, // Write Enable : Active High , 1'b0 means always read
    {1'b1,           1'b1        }, // Chip Enable
    {a_rclk,         1'bz        }, // Clocks : 1'bz means asynchronous
    {a_we,            28'bz      }  // Mask
);

`else

reg [ 27:0] L2_TAG [1023:0];

assign tag_out[ 27:0] = L2_TAG[adr];

wire [ 27:0] l2_in = (~we[ 27:0] & tag_out) | (we[ 27:0] & tag_in); 

always @(posedge rclk) begin
  L2_TAG[adr] <= l2_in;
end 

`endif

endmodule


module ic_data ( nclk, adr, we, din, dout );

input             nclk;
input    [7:0]    adr;
input  [543:0]    we;
input  [543:0]    din; 
output [543:0]    dout;

`ifdef AXIS
wire            a_nclk = nclk;
wire    [  7:0] a_adr = adr;
wire    [543:0] a_we = we;
wire    [543:0] a_din = din;
wire    [543:0] a_dout;

assign dout[543:0] = a_dout;

axis_smem #(8, 544, 2, 0) IC 
(
    {544'bz,         a_dout      }, // Data Out
    {a_din,          544'bz      }, // Data In
    {a_adr,          a_adr       }, // Address
    {1'b1,           1'b0        }, // Write Enable : Active High , 1'b0 means always read
    {1'b1,           1'b1        }, // Chip Enable
    {a_nclk,         1'bz        }, // Clocks : 1'bz means asynchronous
    {a_we,           544'bz      }  // Mask
);

`else

reg [543:0] IC [255:0];

assign dout[543:0] = IC[adr];

wire [543:0] ic_in = (~we[543:0] & dout) | (we[543:0] & din);

always @(posedge nclk) begin // Clock was inverted
  IC[adr] <= ic_in;
end 

`endif

endmodule



module dc_data (nclk, adr, we, wm, din, dout );

input           nclk;
input [6:0]     adr;
input           we;
input [143:0]   wm;
input [143:0]   din;
output [143:0]  dout;

`ifdef AXIS
wire            a_nclk = nclk;
wire    [  6:0] a_adr = adr;
wire            a_we = we;
wire    [143:0] a_wm = wm;
wire    [143:0] a_din = din;
wire    [143:0] a_dout;

assign dout[143:0] = a_dout;

axis_smem #(7, 144, 2, 0) DC 
(
    {144'bz,         a_dout      }, // Data Out
    {a_din,          144'bz      }, // Data In
    {a_adr,          a_adr       }, // Address
    {a_we,           1'b0        }, // Write Enable : Active High , 1'b0 means always read
    {1'b1,           1'b1        }, // Chip Enable
    {a_nclk,         1'bz        }, // Clocks : 1'bz means asynchronous
    {a_wm,           144'bz      }  // Mask
);

`else

reg [143:0] DC [127:0];

assign dout[143:0] = DC[adr];

wire [143:0] dc_in = (~wm[143:0] & dout) | (wm[143:0] & din);

always @(posedge nclk) begin // Clock was inverted
  if (we) DC[adr] <= dc_in;
//if (we) $display(" DC write ADR=%h, DATA=%h", adr, dc_in);
end 

`endif

endmodule


module l1_tag  (nclk, adr, we, wm, din, dout );

input           nclk;
input [6:0]     adr;
input           we;
input [131:0]   wm;
input [131:0]   din;
output [131:0]  dout;

wire [6:0] snoop_adr = (test_cmp.cmp_sat.SNOOP_CNT == 4) ? {test_cmp.cmp_sat.dram_adr_inclusive[11:6], 1'b0} :
                       (test_cmp.cmp_sat.SNOOP_CNT == 5) ? {test_cmp.cmp_sat.dram_adr_inclusive[11:6], 1'b1} :
                       {test_cmp.cmp_sat.dram_adr_inclusive[10:6], test_cmp.cmp_sat.SNOOP_CNT[1:0]};

`ifdef AXIS
wire            a_nclk = nclk;
wire    [  6:0] a_adr = adr;
wire            a_we = we;
wire    [131:0] a_wm = wm;
wire    [131:0] a_din = din;
wire    [131:0] a_dout;
wire    [131:0] b_dout;

assign dout[131:0] = a_dout;

axis_smem #(7, 132, 3, 0) TG
(
    {132'bz,         a_dout,     b_dout    }, // Data Out
    {a_din,          132'bz,     132'bz    }, // Data In
    {a_adr,          a_adr,      snoop_adr }, // Address
    {a_we,           1'b0,       1'b0      }, // Write Enable : Active High , 1'b0 means always read
    {1'b1,           1'b1,       1'b1      }, // Chip Enable
    {a_nclk,         1'bz,       1'bz      }, // Clocks : 1'bz means asynchronous
    {a_wm,           132'bz,     132'bz    }  // Mask
);

wire [131:0] snoop_out = b_dout;

`else

reg [131:0] TG [127:0];

assign dout[131:0] = TG[adr];

wire [131:0] tg_in = (~wm[131:0] & dout) | (wm[131:0] & din);

always @(posedge nclk) begin // Clock was inverted
  if (we) TG[adr] <= tg_in;
end

wire [131:0] snoop_out = TG[snoop_adr];

`endif

wire [3:0] snoop_err_dc;

assign snoop_err_dc[0] = (test_cmp.cmp_sat.dram_adr_inclusive != 0) &  
                         (test_cmp.cmp_sat.dram_adr_inclusive[36:11] == snoop_out[ 25: 0]); 
assign snoop_err_dc[1] = (test_cmp.cmp_sat.dram_adr_inclusive != 0) & 
                         (test_cmp.cmp_sat.dram_adr_inclusive[36:11] == snoop_out[ 58:33]); 
assign snoop_err_dc[2] = (test_cmp.cmp_sat.dram_adr_inclusive != 0) & 
                         (test_cmp.cmp_sat.dram_adr_inclusive[36:11] == snoop_out[ 91:66]); 
assign snoop_err_dc[3] = (test_cmp.cmp_sat.dram_adr_inclusive != 0) & 
                         (test_cmp.cmp_sat.dram_adr_inclusive[36:11] == snoop_out[124:99]); 

wire [3:0] snoop_err_ic;

assign snoop_err_ic[0] = (test_cmp.cmp_sat.dram_adr_inclusive != 0) & 
                         (test_cmp.cmp_sat.dram_adr_inclusive[36:12] == snoop_out[ 24: 0]); 
assign snoop_err_ic[1] = (test_cmp.cmp_sat.dram_adr_inclusive != 0) & 
                         (test_cmp.cmp_sat.dram_adr_inclusive[36:12] == snoop_out[ 57:33]); 
assign snoop_err_ic[2] = (test_cmp.cmp_sat.dram_adr_inclusive != 0) & 
                         (test_cmp.cmp_sat.dram_adr_inclusive[36:12] == snoop_out[ 90:66]); 
assign snoop_err_ic[3] = (test_cmp.cmp_sat.dram_adr_inclusive != 0) & 
                         (test_cmp.cmp_sat.dram_adr_inclusive[36:12] == snoop_out[123:99]); 

endmodule


module   rf32x108 ( rclk, radr, wadr, ren, we, wm, din, dout );

input           rclk;
input [4:0]     radr;
input [4:0]     wadr;
input           ren;
input           we;
input [107:0]   wm;
input [107:0]   din;
output [107:0]  dout;

`ifdef AXIS
wire            a_rclk = rclk;
wire    [  4:0] a_radr = radr;
wire    [  4:0] a_wadr = wadr;
wire            a_ren = ren;
wire            a_we = we;
wire    [107:0] a_wm = wm;
wire    [107:0] a_din = din;
wire    [107:0] a_dout;

assign dout[107:0] = a_dout;

axis_smem #(5, 108, 2, 0) REGF32X108
(
    {108'bz,         a_dout      }, // Data Out
    {a_din,          108'bz      }, // Data In
    {a_wadr,         a_radr      }, // Address
    {a_we,           1'b0        }, // Write Enable : Active High , 1'b0 means always read
    {1'b1,           a_ren       }, // Chip Enable
    {a_rclk,         1'bz        }, // Clocks : 1'bz means asynchronous
    {a_wm,           108'bz      }  // Mask
);

`else

reg [107:0] REGF32X108 [31:0];
reg [107:0] LAST;

integer j;
initial
begin
        for(j=0 ; j<=31; j=j+1) begin
                REGF32X108 [j] = 108'b0;
        end
        LAST = 0;
end // of initial


assign dout[107:0] = ren ? REGF32X108[radr] : LAST;

wire [107:0] rf_in = (~wm[107:0] & REGF32X108[wadr]) | (wm[107:0] & din);

always @(posedge rclk) begin
  if (we) REGF32X108[wadr] <= rf_in;
  LAST <= dout;
end

`endif

endmodule

module   rf128x78 ( rclk, radr, wadr, ren, we, wm, din, dout );

input           rclk;
input [6:0]     radr;
input [6:0]     wadr;
input           ren;
input           we;
input [77:0]   wm;
input [77:0]   din;
output [77:0]  dout;

`ifdef AXIS
wire            a_rclk = rclk;
wire    [  6:0] a_radr = radr;
wire    [  6:0] a_wadr = wadr;
wire            a_ren = ren;
wire            a_we = we;
wire    [ 77:0] a_wm = wm;
wire    [ 77:0] a_din = din;
wire    [ 77:0] a_dout;

assign dout[ 77:0] = a_dout;

axis_smem #(7, 78, 2, 0) REGF128X78
(
    { 78'bz,         a_dout      }, // Data Out
    {a_din,           78'bz      }, // Data In
    {a_wadr,         a_radr      }, // Address
    {a_we,           1'b0        }, // Write Enable : Active High , 1'b0 means always read
    {1'b1,           a_ren       }, // Chip Enable
    {a_rclk,         1'bz        }, // Clocks : 1'bz means asynchronous
    {a_wm,            78'bz      }  // Mask
);

`else

reg [ 77:0] REGF128X78 [127:0];
reg [ 77:0] LAST;

integer j;
initial
begin
        for(j=0 ; j<=127; j=j+1) begin
                REGF128X78 [j] =  78'b0;
        end
        LAST = 0;
end // of initial


assign dout[ 77:0] = ren ? REGF128X78[radr] : LAST;

wire [ 77:0] rf_in = (~wm[ 77:0] & REGF128X78[wadr]) | (wm[ 77:0] & din);

always @(posedge rclk) begin
  if (we) REGF128X78[wadr] <= rf_in;
  LAST <= dout;
end

`endif

endmodule


module rf16x128 ( rclk, radr, wadr, ren, we, wm, din, dout );

input           rclk;
input [3:0]     radr;
input [3:0]     wadr;
input           ren;
input           we;
input [127:0]   wm;
input [127:0]   din;
output [127:0]  dout;

`ifdef AXIS
wire            a_rclk = rclk;
wire    [  3:0] a_radr = radr;
wire    [  3:0] a_wadr = wadr;
wire            a_ren = ren;
wire            a_we = we;
wire    [127:0] a_wm = wm;
wire    [127:0] a_din = din;
wire    [127:0] a_dout;

/*************
reg [127:0] LAST;

always @(posedge rclk) begin
  LAST <= a_ren ? a_dout : LAST;
end

assign dout[127:0] = LAST;
**************/
assign dout[127:0] = a_dout;

axis_smem #(4,128, 2, 0) REGF32X80
(
    {128'bz,         a_dout      }, // Data Out
    {a_din,          128'bz      }, // Data In
    {a_wadr,         a_radr      }, // Address
    {a_we,           1'b0        }, // Write Enable : Active High , 1'b0 means always read
    {1'b1,           a_ren       }, // Chip Enable
    {a_rclk,         1'bz        }, // Clocks : 1'bz means asynchronous
    {a_wm,           128'bz      }  // Mask
);

`else

reg [127:0] REGF16X128 [15:0];
//reg [127:0] LAST;

integer j;
initial
begin
        for(j=0 ; j<=15; j=j+1) begin
                REGF16X128[j] = 128'b0;
        end
end // of initial


//assign dout[127:0] = LAST;
  assign dout[127:0] = REGF16X128[radr];

wire [127:0] rf_in = (~wm[127:0] & REGF16X128[wadr]) | (wm[127:0] & din);

always @(posedge rclk) begin
  if       (we) REGF16X128[wadr] <= rf_in;
//LAST <= ren ? REGF16X128[radr] : LAST;
end

`endif

endmodule




module   rf32x80 ( rclk, radr, wadr, ren, we, wm, din, dout );

input           rclk;
input [4:0]     radr;
input [4:0]     wadr;
input           ren;
input           we;
input [ 79:0]   wm;
input [ 79:0]   din;
output [ 79:0]  dout;

`ifdef AXIS
wire            a_rclk = rclk;
wire    [  4:0] a_radr = radr;
wire    [  4:0] a_wadr = wadr;
wire            a_ren = ren;
wire            a_we = we;
wire    [ 79:0] a_wm = wm;
wire    [ 79:0] a_din = din;
wire    [ 79:0] a_dout;

reg [ 79:0] LAST;

always @(posedge rclk) begin
  LAST <= a_ren ? a_dout : LAST;
end

assign dout[ 79:0] = LAST;

axis_smem #(5, 80, 2, 0) REGF32X80
(
    { 80'bz,         a_dout      }, // Data Out
    {a_din,           80'bz      }, // Data In
    {a_wadr,         a_radr      }, // Address
    {a_we,           1'b0        }, // Write Enable : Active High , 1'b0 means always read
    {1'b1,           a_ren       }, // Chip Enable
    {a_rclk,         1'bz        }, // Clocks : 1'bz means asynchronous
    {a_wm,            80'bz      }  // Mask
);

`else

reg [ 79:0] REGF32X80 [31:0];
reg [ 79:0] LAST;

integer j;
initial
begin
        for(j=0 ; j<=31; j=j+1) begin
                REGF32X80 [j] = 80'b0;
        end
        LAST = 0;
end // of initial


assign dout[ 79:0] = LAST;

wire [ 79:0] rf_in = (~wm[ 79:0] & REGF32X80[wadr]) | (wm[ 79:0] & din);

always @(posedge rclk) begin
  if (we) REGF32X80[wadr] <= rf_in;
  LAST <= ren ? REGF32X80[radr] : LAST;
end

`endif

endmodule

module   rf32x152 ( rclk, radr, wadr, ren, we, wm, din, dout );

input           rclk;
input [4:0]     radr;
input [4:0]     wadr;
input           ren;
input           we;
input [151:0]   wm;
input [151:0]   din;
output [151:0]  dout;

`ifdef AXIS
wire            a_rclk = rclk;
wire    [  4:0] a_radr = radr;
wire    [  4:0] a_wadr = wadr;
wire            a_ren = ren;
wire            a_we = we;
wire    [151:0] a_wm = wm;
wire    [151:0] a_din = din;
wire    [151:0] a_dout;

reg [151:0] LAST;

always @(posedge rclk) begin
  LAST <= a_ren ? a_dout : LAST;
end

assign dout[151:0] = LAST;

axis_smem #(5, 152, 2, 0) REGF32X152
(
    {152'bz,         a_dout      }, // Data Out
    {a_din,          152'bz      }, // Data In
    {a_wadr,         a_radr      }, // Address
    {a_we,           1'b0        }, // Write Enable : Active High , 1'b0 means always read
    {1'b1,           a_ren       }, // Chip Enable
    {a_rclk,         1'bz        }, // Clocks : 1'bz means asynchronous
    {a_wm,           152'bz      }  // Mask
);

`else

reg [151:0] REGF32X152 [31:0];
reg [151:0] LAST;

integer j;
initial
begin
        for(j=0 ; j<=31; j=j+1) begin
                REGF32X152 [j] = 152'b0;
        end
        LAST = 0;
end // of initial


assign dout[151:0] = LAST;

wire [151:0] rf_in = (~wm[151:0] & REGF32X152[wadr]) | (wm[151:0] & din);

always @(posedge rclk) begin
  if (we) REGF32X152[wadr] <= rf_in;
  LAST <= ren ? REGF32X152[radr] : LAST;
end

`endif

endmodule




module   rf16x160 ( rdclk, wrclk, radr, wadr, ren, we, wm, din, dout );

input           rdclk;
input           wrclk;
input [3:0]     radr;
input [3:0]     wadr;
input           ren;
input           we;
input [159:0]   wm;
input [159:0]   din;
output [159:0]  dout;

`ifdef AXIS
wire            a_rdclk = rdclk;
wire            a_wrclk = wrclk;
wire    [  3:0] a_radr = radr;
wire    [  3:0] a_wadr = wadr;
wire            a_ren = ren;
wire            a_we = we;
wire    [159:0] a_wm = wm;
wire    [159:0] a_din = din;
wire    [159:0] a_dout;

assign dout[159:0] = a_dout;

axis_smem #(4, 160, 2, 0) REGF16X160
(
    {160'bz,         a_dout      }, // Data Out
    {a_din,          160'bz      }, // Data In
    {a_wadr,         a_radr      }, // Address
    {a_we,           1'b0        }, // Write Enable : Active High , 1'b0 means always read
    {1'b1,           a_ren       }, // Chip Enable
    {a_wrclk,        1'bz        }, // Clocks : 1'bz means asynchronous
    {a_wm,           160'bz      }  // Mask
);

`else

reg [159:0] REGF16X160 [15:0];
reg [159:0] LAST;

integer j;
initial
begin
        for(j=0 ; j<=15; j=j+1) begin
                REGF16X160 [j] = 160'b0;
        end
        LAST = 0;
end // of initial


assign dout[159:0] = ren ? REGF16X160[radr] : LAST;

wire [159:0] rf_in = (~wm[159:0] & REGF16X160[wadr]) | (wm[159:0] & din);

always @(posedge wrclk) begin
  if (we) REGF16X160[wadr] <= rf_in;
end

always @(posedge rdclk) begin
  LAST <= dout;
end

`endif

endmodule



module   rf16x65 ( rdclk, wrclk, radr, wadr, ren, we, wm, din, dout );

input           rdclk;
input           wrclk;
input [3:0]     radr;
input [3:0]     wadr;
input           ren;
input           we;
input [64:0]   wm;
input [64:0]   din;
output [64:0]  dout;

`ifdef AXIS
wire            a_rdclk = rdclk;
wire            a_wrclk = wrclk;
wire    [  3:0] a_radr = radr;
wire    [  3:0] a_wadr = wadr;
wire            a_ren = ren;
wire            a_we = we;
wire    [ 64:0] a_wm = wm;
wire    [ 64:0] a_din = din;
wire    [ 64:0] a_dout;

//assign dout[ 64:0] = a_dout;
assign dout[ 64:0] = ren ? a_dout : 65'h1FFFFFFFFFFFFFFFF;

axis_smem #(4,  65, 2, 0) REGF16X65
(
    { 65'bz,         a_dout      }, // Data Out
    {a_din,           65'bz      }, // Data In
    {a_wadr,         a_radr      }, // Address
    {a_we,           1'b0        }, // Write Enable : Active High , 1'b0 means always read
    {1'b1,           a_ren       }, // Chip Enable
    {a_wrclk,        1'bz        }, // Clocks : 1'bz means asynchronous
    {a_wm,            65'bz      }  // Mask
);

`else

reg [ 64:0] REGF16X65  [15:0];
reg [ 64:0] LAST;

integer j;
initial
begin
        for(j=0 ; j<=15; j=j+1) begin
                REGF16X65  [j] =  64'b0;
        end
        LAST = 0;
end // of initial


assign dout[ 64:0] = ren ? REGF16X65 [radr] : LAST;

wire [ 64:0] rf_in = (~wm[ 64:0] & REGF16X65 [wadr]) | (wm[ 64:0] & din);

always @(posedge wrclk) begin
  if (we) REGF16X65 [wadr] <= rf_in;
end

always @(posedge rdclk) begin
  //LAST <= dout;
  LAST <= 65'h1FFFFFFFFFFFFFFFF;
end

`endif

endmodule

module dbuff_mem (
                      adr0,
                      adr1,
                      data0,
                      data1
                 );


   input  [19:0]       adr0;
   input  [19:0]       adr1;
   output [208:0]      data0;
   output [208:0]      data1;

`ifdef AXIS
   wire   [19:0]      a_adr0 = adr0;
   wire   [19:0]      a_adr1 = adr1;
   wire   [208:0]      a_data0;
   wire   [208:0]      a_data1;

assign data0[208:0] = a_data0;
assign data1[208:0] = a_data1;

axis_smem #(20,  209, 2, 0) DBUFF
(
    {a_data0, a_data1}, // Data Out
    {209'bz,  209'bz }, // Data In
    {a_adr0,  a_adr1 }, // Address
    {1'b0,    1'b0   }, // Write Enable : 1'b0 means always read
    {1'b1,    1'b1   }, // Chip Enable
    {1'bz,    1'bz   }, // Clocks : 1'bz means asynchronous
    {209'bz,  209'bz }  // Mask
);

`else

reg /*sparse */ [208:0] DBUFF [20'hFFFFF:0];

integer j;
initial
begin
        for(j=0 ; j<=1048575; j=j+1) begin
                DBUFF [j] = ~(209'h0);
        end
end // of initial
assign data0[208:0] = DBUFF[adr0];
assign data1[208:0] = DBUFF[adr1];

`endif

endmodule


module   rf2x32 ( rclk, radr, wadr, ren, we, wm, din, dout );

input           rclk;
input           radr;
input           wadr;
input           ren;
input           we;
input [ 31:0]   wm;
input [ 31:0]   din;
output [ 31:0]  dout;

`ifdef PALLADIUM

reg [ 31:0] REGF2X32 [ 1:0];
reg [ 31:0] LAST;

integer j;
initial
begin
        for(j=0 ; j<=1 ; j=j+1) begin
                REGF2X32 [j] = 32'b0;
        end
        LAST = 0;
end // of initial


assign dout[ 31:0] = LAST;

wire [ 31:0] rf_in = (~wm[ 31:0] & REGF2X32[wadr]) | (wm[ 31:0] & din);

always @(posedge rclk) begin
  if (we) REGF2X32[wadr] <= rf_in;
  LAST <= ren ? REGF2X32[radr] : LAST;
end

`else

`ifdef AXIS
wire            a_rclk = rclk;
wire    [2:0]   a_radr = {2'b0, radr}; // AXIS memory must have more than 4 entries
wire    [2:0]   a_wadr = {2'b0, wadr};
wire            a_ren = ren;
wire            a_we = we;
wire    [ 31:0] a_wm = wm;
wire    [ 31:0] a_din = din;
wire    [ 31:0] a_dout;

reg [ 31:0] LAST;

always @(posedge rclk) begin
  LAST <= a_ren ? a_dout : LAST;
end

assign dout[ 31:0] = LAST;

axis_smem #(3,  32, 2, 0) REGF2X32
(
    { 32'bz,         a_dout      }, // Data Out
    {a_din,           32'bz      }, // Data In
    {a_wadr,         a_radr      }, // Address
    {a_we,           1'b0        }, // Write Enable : Active High , 1'b0 means always read
    {1'b1,           a_ren       }, // Chip Enable
    {a_rclk,         1'bz        }, // Clocks : 1'bz means asynchronous
    {a_wm,            32'bz      }  // Mask
);

`else

reg [ 31:0] REGF2X32 [ 1:0];
reg [ 31:0] LAST;

integer j;
initial
begin
        for(j=0 ; j<=1 ; j=j+1) begin
                REGF2X32 [j] = 32'b0;
        end
        LAST = 0;
end // of initial


assign dout[ 31:0] = LAST;

wire [ 31:0] rf_in = (~wm[ 31:0] & REGF2X32[wadr]) | (wm[ 31:0] & din);

always @(posedge rclk) begin
  if (we) REGF2X32[wadr] <= rf_in;
  LAST <= ren ? REGF2X32[radr] : LAST;
end

`endif //AXIS
`endif // !`ifdef PALLADIUM

endmodule


