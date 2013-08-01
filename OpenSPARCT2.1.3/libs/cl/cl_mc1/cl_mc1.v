// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: cl_mc1.v
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
module cl_mc1_adrff2b_8x ( latout, latout_l, q, q_l, so, d, l1clk, si, siclk, soclk );

   output       latout;
   output       latout_l;
   output       so;
   output       q;
   output       q_l;
   input         d;
   input         l1clk;
   input         si;
   input         siclk;
   input         soclk;

   wire latout, latout_l, so;
   reg m, s;

   `ifdef SCAN_MODE
    `ifdef FAST_FLUSH
        always @(l1clk or siclk or d) begin //vcs optimized code

          if (!l1clk && !siclk)       m <= d;    // Load master with data
          else if ( l1clk && !siclk)  s <=  m;   // Load slave with master data
          else if ( l1clk &&  siclk) begin
               m <=  1'b0;    //  flush reset
               s <=  1'b0;
          end
        end
     `else

      always @(l1clk or siclk or soclk or d or si) begin

        if (!l1clk && !siclk)        m <=  d;    // Load master with data
        else if ( l1clk &&  siclk)   m <=  si;    // Load master with scan or flush
        else if (!l1clk &&  siclk)   m <=  1'bx;    // Conflict between data and scan

        if ( l1clk && !soclk && !siclk)  s <=  m;   // Load slave with master data
        else if (l1clk && siclk && !soclk)  s <= si;    // Flush
      end
     `endif

   `else
      wire  si_unused = si;
 `ifdef INITLATZERO
      initial m = 1'b0;
      initial s = 1'b0;
      `endif

      always @(l1clk or d or si or siclk) begin
        if(siclk==0 && l1clk==0) m <=  d;
        else if(siclk && !l1clk)                m <= 1'bx;
        else if(siclk && l1clk) m <= si;
        if(l1clk && !soclk) s<= m;
      end

    `endif
      assign latout = m & l1clk;
      assign latout_l = ~m & l1clk;
      assign so  =  s;
      assign q   =  s;
      assign q_l = ~s;


endmodule

module cl_mc1_bistl1hdr_12x (
                 l2clk,
                 se,
                 clksel,
                 bistclk,
                 lce,
                 l1clk
                 );
                
                
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        clksel;
   input        bistclk;
   input        lce;
   output       l1clk;

  assign l1clk = ((((l2clk & ~clksel)|(bistclk & clksel)) & ~lce) | se) ;
 
endmodule


module cl_mc1_bistl1hdr_16x (
                 l2clk,
                 se,
                 clksel,
                 bistclk,
                 lce,
                 l1clk
                 );
                
                
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        clksel;
   input        bistclk;
   input        lce;
   output       l1clk;

  assign l1clk = ((((l2clk & ~clksel)|(bistclk & clksel)) & ~lce) | se) ;
 
endmodule


module cl_mc1_bistl1hdr_8x (
                 l2clk,
                 se,
                 clksel,
                 bistclk,
                 lce,
                 l1clk
                 );
                
                
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        clksel;
   input        bistclk;
   input        lce;
   output       l1clk;

  assign l1clk = ((((l2clk & ~clksel)|(bistclk & clksel)) & ~lce) | se) ;
 
endmodule


module cl_mc1_bistlatch_10x (
                l2clk,
                pce,
                pce_ov,
                lce);
 input  l2clk;
 input  pce;
 input  pce_ov;
 output lce;
 
 `ifdef FORMAL_TOOL
 assign lce = ~(pce | pce_ov);
 `else
 
 `ifdef LIB
 reg lce;
 
 always @ (negedge l2clk)
        begin
        lce <=  ~(pce | pce_ov);
        end
 `endif
 `endif
 endmodule

module cl_mc1_bistlatch_20x (
                l2clk,
                pce,
                pce_ov,
                lce);
 input  l2clk;
 input  pce;
 input  pce_ov;
 output lce;

 `ifdef FORMAL_TOOL
 assign lce = ~(pce | pce_ov);
 `else
 
 `ifdef LIB
 reg lce;
 
 always @ (negedge l2clk)
        begin
        lce <=  ~(pce | pce_ov);
        end
 `endif
 `endif
 endmodule

module cl_mc1_bistlatch_4x (
                l2clk,
                pce,
                pce_ov,
                lce);
 input  l2clk;
 input  pce;
 input  pce_ov;
 output lce;

 `ifdef FORMAL_TOOL
 assign lce = ~(pce | pce_ov);
 `else

 `ifdef LIB
 reg lce;

 always @ (negedge l2clk)
        begin
        lce <=  ~(pce | pce_ov);
        end
 `endif
 `endif
 endmodule
module cl_mc1_cm_com_adff_l ( master, so, d, l1clk, si, siclk, soclk );

   output master;
   output so;

   input  d;
   input  l1clk;
   input  si;
   input  siclk;
   input  soclk;

    wire  master;
    wire   so;

     reg m, s;

    `ifdef SCAN_MODE

             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           m <= d;    // Load master with data
               else if ( l1clk &&  siclk)           m <= si;   // Load master with scan or flush
               else if (!l1clk &&  siclk)           m <= 1'bx; // Conflict between data and scan

                    if ( l1clk && !siclk && !soclk)  s <= m;  // Load slave with master data
               else if ( l1clk &&  siclk && !soclk)  s <= si; // Flush
              end
    `else
       wire  si_unused = si;
          `ifdef INITLATZERO
                initial m = 1'b0;
                initial s = 1'b0;
          `endif

       always @(l1clk or d or si or siclk) begin
         if(siclk==0 && l1clk==0) m <=  d;
         if(siclk && !l1clk)      m <= 1'bx;
         else if(siclk && l1clk)  m <= si;
       end

     `endif

         assign master   =   m;
         assign so  =  s;

endmodule

module cl_mc1_cm_com_adff_r ( master, so, d, l1clk, si, siclk, soclk );

   output master;
   output so;

   input  d;
   input  l1clk;
   input  si;
   input  siclk;
   input  soclk;

    wire  master;
    wire   so;

     reg m, s;

    `ifdef SCAN_MODE

             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           m <= d;    // Load master with data
               else if ( l1clk &&  siclk)           m <= si;   // Load master with scan or flush
               else if (!l1clk &&  siclk)           m <= 1'bx; // Conflict between data and scan

                    if ( l1clk && !siclk && !soclk)  s <= m;  // Load slave with master data
               else if ( l1clk &&  siclk && !soclk)  s <= si; // Flush
              end
    `else
       wire  si_unused = si;
          `ifdef INITLATZERO
                initial m = 1'b0;
                initial s = 1'b0;
          `endif

       always @(l1clk or d or si or siclk) begin
         if(siclk==0 && l1clk==0) m <=  d;
         if(siclk && !l1clk)      m <= 1'bx;
         else if(siclk && l1clk)  m <= si;
       end

     `endif

         assign master   =   m;
         assign so  =  s;

endmodule

module cl_mc1_cm_com_dff ( master, master_l, so, d, l1clk, si, siclk, soclk );

   output master;
   output master_l;
   output so;

   input  d;
   input  l1clk;
   input  si;
   input  siclk;
   input  soclk;

    wire  master;
    wire  master_l;
    wire   so;

     reg m, s;

    `ifdef SCAN_MODE

             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           m <= d;    // Load master with data
               else if ( l1clk &&  siclk)           m <= si;   // Load master with scan or flush
               else if (!l1clk &&  siclk)           m <= 1'bx; // Conflict between data and scan

                    if ( l1clk && !siclk && !soclk)  s <= m;  // Load slave with master data
               else if ( l1clk &&  siclk && !soclk)  s <= si; // Flush
              end
    `else
       wire  si_unused = si;
          `ifdef INITLATZERO
                initial m = 1'b0;
                initial s = 1'b0;
          `endif

       always @(l1clk or d or si or siclk) begin
         if(siclk==0 && l1clk==0) m <=  d;
         if(siclk && !l1clk)      m <= 1'bx;
         else if(siclk && l1clk)  m <= si;
       end

     `endif

         assign master   =   m;
         assign master_l =  ~m;
         assign so  =  s;

endmodule

 module cl_mc1_cm_nor_msff ( q, so, din, clear, l1clk, si, siclk, soclk );
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE

   output  q;
   output  so;

   input   din, clear;
   input   l1clk;
   input   si;
   input   siclk;
   input   soclk;

   reg     q;
   wire    so;
   wire    l1clk, siclk, soclk;
                
  `ifdef SCAN_MODE

    reg    m;

             always @(l1clk or siclk or soclk or din or clear or si)
              begin
                    if (!l1clk && !siclk)           m <= ~(din | clear);  // Load master with data
               else if ( l1clk &&  siclk)           m <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           m <= 1'bx;    // Conflict between data and scan
 
               else if ( l1clk && !siclk && !soclk)  q <= m;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
 
        `else
              wire  si_unused = si;
 
          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif
 
              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  ~(din | clear);
                else                  q <= 1'bx;
               end
        `endif
 
         assign so = q;
 
endmodule
// created June 6, 2005, ln

module cl_mc1_gate_antenna_50k ( in );

input in;

endmodule
// created June 6, 2005, ln

module cl_mc1_gate_antenna_5k ( in );

input in;

endmodule

module cl_mc1_irf_lat_rsto (
		l1clk,
		d,
		mq);
input	l1clk;		
input	d;
output	mq;

reg m;
wire mq;

always @ (l1clk or d)
        if (l1clk == 1'b0) m <=  d;

 `ifdef INITLATZERO
    initial m = 1'b0;
  `endif

assign mq = m && l1clk;

endmodule


module cl_mc1_irf_lat_swl (
		l1clk,
		d,
		mq);
input	l1clk;		
input	d;
output	mq;

reg m;
wire mq;

always @ (l1clk or d)
        if (l1clk == 1'b0) m <=  d;

 `ifdef INITLATZERO
    initial m = 1'b0;
  `endif

assign mq = m && l1clk;

endmodule


module cl_mc1_irf_msff_4x ( q, so, d, l1clk, si, siclk, soclk );
 
    output       q;
    output       so;
 
    input         d;
    input         l1clk;
    input         si;
    input         siclk;
    input         soclk;
 
    wire q, so;
    reg m, s;
 
    `ifdef SCAN_MODE
 
       always @(l1clk or siclk or soclk or d or si) begin
 
         if (!l1clk && !siclk)        m <=  d;    // Load master with data
         else if ( l1clk &&  siclk)   m <=  si;    // Load master with scan or flush
         else if (!l1clk &&  siclk)   m <=  1'bx;    // Conflict between data and scan
 
         if ( l1clk && !soclk && !siclk)  s <=  m;   // Load slave with master data
         else if (l1clk && siclk && !soclk)  s <= si;    // Flush
       end
 
    `else
       wire  si_unused = si;
       `ifdef INITLATZERO
       initial m = 1'b0;
       initial s = 1'b0;
       `endif
 
       always @(l1clk or d or si or siclk) begin
         if(siclk==0 && l1clk==0) m <=  d;
         if(siclk && !l1clk)                m <= 1'bx;
         else if(siclk && l1clk) m <= si;
       end
 
     `endif
 
       assign q = s;
       assign so  =  s;
 
endmodule

// Driver
module  cl_mc1_l1driver_12x (
                 l2clk,
                 se,
                 l1en,
                 l1clk
                );
 
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        l1en;           // Clock enable for local power savings
   output       l1clk;
 
   wire       l1clk;
 
   assign       l1clk = (l2clk & l1en) | se;  // se is async and highest priority
endmodule

// Driver
module  cl_mc1_l1driver_16x (
                 l2clk,
                 se,
                 l1en,
                 l1clk
                );
 
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        l1en;           // Clock enable for local power savings
   output       l1clk;
 
   wire       l1clk;
 
   assign       l1clk = (l2clk & l1en) | se;  // se is async and highest priority
endmodule

// Driver
module  cl_mc1_l1driver_24x (
                 l2clk,
                 se,
                 l1en,
                 l1clk
                );
 
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        l1en;           // Clock enable for local power savings
   output       l1clk;
 
   wire       l1clk;
 
   assign       l1clk = (l2clk & l1en) | se;  // se is async and highest priority
endmodule

// Driver
module  cl_mc1_l1driver_32x (
                 l2clk,
                 se,
                 l1en,
                 l1clk
                );
 
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        l1en;           // Clock enable for local power savings
   output       l1clk;
 
   wire       l1clk;
 
   assign       l1clk = (l2clk & l1en) | se;  // se is async and highest priority
endmodule

module  cl_mc1_l1driver_48x (
                 l2clk,
                 se,
                 l1en,
                 l1clk
                );
 
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        l1en;           // Clock enable for local power savings
   output       l1clk;
 
   wire       l1clk;
 
   assign       l1clk = (l2clk & l1en) | se;  // se is async and highest priority
endmodule

// Driver
module  cl_mc1_l1driver_4x (
                 l2clk,
                 se,
                 l1en,
                 l1clk
                );
 
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        l1en;           // Clock enable for local power savings
   output       l1clk;

   wire        l1clk;

   assign       l1clk = (l2clk & l1en) | se;  // se is async and highest priority

endmodule


// Driver
module  cl_mc1_l1driver_64x (
                 l2clk,
                 se,
                 l1en,
                 l1clk
                );
 
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        l1en;           // Clock enable for local power savings
   output       l1clk;
 
   wire       l1clk;
 
   assign       l1clk = (l2clk & l1en) | se;  // se is async and highest priority
endmodule

// Driver
module  cl_mc1_l1driver_8x (
                 l2clk,
                 se,
                 l1en,
                 l1clk
                );
 
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        l1en;           // Clock enable for local power savings
   output       l1clk;

   wire       l1clk;

   assign       l1clk = (l2clk & l1en) | se;  // se is async and highest priority

endmodule


// Driver double wide
module  cl_mc1_l1driver_by2_24x (
                 l2clk,
                 se,
                 l1en,
                 l1clk
                );
 
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        l1en;           // Clock enable for local power savings
   output       l1clk;
 
   wire       l1clk;
 
   assign       l1clk = (l2clk & l1en) | se;  // se is async and highest priority
endmodule

// Driver double wide
module  cl_mc1_l1driver_by2_32x (
                 l2clk,
                 se,
                 l1en,
                 l1clk
                );
 
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        l1en;           // Clock enable for local power savings
   output       l1clk;
 
   wire        l1clk;
 
   assign       l1clk = (l2clk & l1en) | se;  // se is async and highest priority
endmodule

module  cl_mc1_l1driver_by2_48x (
                 l2clk,
                 se,
                 l1en,
                 l1clk
                );
 
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        l1en;           // Clock enable for local power savings
   output       l1clk;
 
   wire       l1clk;
 
   assign       l1clk = (l2clk & l1en) | se;  // se is async and highest priority
endmodule

module  cl_mc1_l1driver_by2_64x (
                 l2clk,
                 se,
                 l1en,
                 l1clk
                );
 
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        l1en;           // Clock enable for local power savings
   output       l1clk;
 
   wire       l1clk;
 
   assign       l1clk = (l2clk & l1en) | se;  // se is async and highest priority
endmodule

// Edge modeled Enable latch
module cl_mc1_l1enable_12x (
                l2clk,
                pce,
                pce_ov,
                l1en);
input   l2clk;
input   pce;
input   pce_ov;
output  l1en;
 
reg l1en;
 
always @ (negedge l2clk )
        begin
           l1en <=  (pce | pce_ov);
        end

// logically correct model
// always @ (l2clk or pce or pce_ov)
//         if (l2clk == 1'b0) l1en <=  (pce | pce_ov);
endmodule

// Edge modeled Enable latch
module cl_mc1_l1enable_16x (
                l2clk,
                pce,
                pce_ov,
                l1en);
input   l2clk;
input   pce;
input   pce_ov;
output  l1en;
 
reg l1en;
 
always @ (negedge l2clk )
        begin
           l1en <=  (pce | pce_ov);
        end

// logically correct model
// always @ (l2clk or pce or pce_ov)
//         if (l2clk == 1'b0) l1en <=  (pce | pce_ov);
endmodule

// Edge modeled Enable latch
module cl_mc1_l1enable_24x (
                l2clk,
                pce,
                pce_ov,
                l1en);
input   l2clk;
input   pce;
input   pce_ov;
output  l1en;
 
reg l1en;
 
always @ (negedge l2clk )
        begin
           l1en <=  (pce | pce_ov);
        end

// logically correct model
// always @ (l2clk or pce or pce_ov)
//         if (l2clk == 1'b0) l1en <=  (pce | pce_ov);
endmodule

// Edge modeled Enable latch
module cl_mc1_l1enable_32x (
                l2clk,
                pce,
                pce_ov,
                l1en);
input   l2clk;
input   pce;
input   pce_ov;
output  l1en;
 
reg l1en;
 
always @ (negedge l2clk )
        begin
           l1en <=  (pce | pce_ov);
        end

// logically correct model
// always @ (l2clk or pce or pce_ov)
//         if (l2clk == 1'b0) l1en <=  (pce | pce_ov);
endmodule

// Edge modeled Enable latch
module cl_mc1_l1enable_48x (
                l2clk,
                pce,
                pce_ov,
                l1en);
input   l2clk;
input   pce;
input   pce_ov;
output  l1en;
 
reg l1en;
 
always @ (negedge l2clk )
        begin
           l1en <=  (pce | pce_ov);
        end

// logically correct model
// always @ (l2clk or pce or pce_ov)
//         if (l2clk == 1'b0) l1en <=  (pce | pce_ov);
endmodule

// Edge modeled Enable latch
module cl_mc1_l1enable_4x (
                l2clk,
                pce,
                pce_ov,
                l1en);
input   l2clk;
input   pce;
input   pce_ov;
output  l1en;
 
reg l1en;
 
always @ (negedge l2clk )
        begin
           l1en <=  (pce | pce_ov);
        end

// logically correct model
// always @ (l2clk or pce or pce_ov)
//         if (l2clk == 1'b0) l1en <=  (pce | pce_ov);
endmodule

// Edge modeled Enable latch
module cl_mc1_l1enable_64x (
                l2clk,
                pce,
                pce_ov,
                l1en);
input   l2clk;
input   pce;
input   pce_ov;
output  l1en;
 
reg l1en;
 
always @ (negedge l2clk )
        begin
           l1en <=  (pce | pce_ov);
        end

// logically correct model
// always @ (l2clk or pce or pce_ov)
//         if (l2clk == 1'b0) l1en <=  (pce | pce_ov);
endmodule

// Edge modeled Enable latch
module cl_mc1_l1enable_8x (
                l2clk,
                pce,
                pce_ov,
                l1en);
input   l2clk;
input   pce;
input   pce_ov;
output  l1en;
 
reg l1en;
 
always @ (negedge l2clk )
        begin
           l1en <=  (pce | pce_ov);
        end

// logically correct model
// always @ (l2clk or pce or pce_ov)
//         if (l2clk == 1'b0) l1en <=  (pce | pce_ov);
endmodule
module  cl_mc1_l1hdr_16x (
                 l2clk,
                 se,
                 pce,
                 pce_ov,
                 stop,
                 l1clk
                );
 
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        pce;             // Clock enable for local power savings
   input        pce_ov;        // TCU sourced clock enable override for testing
   input        stop;           // TCU/CCU sourced clock stop for debug
   output       l1clk;

   reg  l1en;
  `ifdef INITLATZERO
  initial begin
        l1en = 1'b0;
     end
  `endif
`ifdef SCAN_MODE
   always @ (l2clk or stop or pce or pce_ov)
       begin
         if (~l2clk) l1en <= (~stop & (pce | pce_ov));
       end
`else
   always @ (negedge l2clk )
        begin
           l1en <= (~stop & ( pce | pce_ov ));
        end
`endif

   assign       l1clk = (l2clk & l1en) | se;  // se is async and highest priority

endmodule

module  cl_mc1_l1hdr_24x (
                 l2clk,
                 se,
                 pce,
                 pce_ov,
                 stop,
                 l1clk
                );
 
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        pce;             // Clock enable for local power savings
   input        pce_ov;        // TCU sourced clock enable override for testing
   input        stop;           // TCU/CCU sourced clock stop for debug
   output       l1clk;

   reg  l1en;
  `ifdef INITLATZERO
  initial begin
        l1en = 1'b0;
     end
  `endif
`ifdef SCAN_MODE
   always @ (l2clk or stop or pce or pce_ov)
       begin
         if (~l2clk) l1en <= (~stop & (pce | pce_ov));
       end
`else
   always @ (negedge l2clk )
        begin
           l1en <= (~stop & ( pce | pce_ov ));
        end
`endif

   assign       l1clk = (l2clk & l1en) | se;  // se is async and highest priority

endmodule

module  cl_mc1_l1hdr_32x (
                 l2clk,
                 se,
                 pce,
                 pce_ov,
                 stop,
                 l1clk
                );
 
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        pce;             // Clock enable for local power savings
   input        pce_ov;        // TCU sourced clock enable override for testing
   input        stop;           // TCU/CCU sourced clock stop for debug
   output       l1clk;

   reg  l1en;
  `ifdef INITLATZERO
  initial begin
        l1en = 1'b0;
     end
  `endif
`ifdef SCAN_MODE
   always @ (l2clk or stop or pce or pce_ov)
       begin
         if (~l2clk) l1en <= (~stop & (pce | pce_ov));
       end
`else
   always @ (negedge l2clk )
        begin
           l1en <= (~stop & ( pce | pce_ov ));
        end
`endif

   assign       l1clk = (l2clk & l1en) | se;  // se is async and highest priority

endmodule

module  cl_mc1_l1hdr_48x (
                 l2clk,
                 se,
                 pce,
                 pce_ov,
                 stop,
                 l1clk
                );
 
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        pce;             // Clock enable for local power savings
   input        pce_ov;        // TCU sourced clock enable override for testing
   input        stop;           // TCU/CCU sourced clock stop for debug
   output       l1clk;

   reg  l1en;
  `ifdef INITLATZERO
  initial begin
        l1en = 1'b0;
     end
  `endif
`ifdef SCAN_MODE
   always @ (l2clk or stop or pce or pce_ov)
       begin
         if (~l2clk) l1en <= (~stop & (pce | pce_ov));
       end
`else
   always @ (negedge l2clk )
        begin
           l1en <= (~stop & ( pce | pce_ov ));
        end
`endif
   assign       l1clk = (l2clk & l1en) | se;  // se is async and highest priority

endmodule

module  cl_mc1_l1hdr_64x (
                 l2clk,
                 se,
                 pce,
                 pce_ov,
                 stop,
                 l1clk
                );
 
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        pce;             // Clock enable for local power savings
   input        pce_ov;        // TCU sourced clock enable override for testing
   input        stop;           // TCU/CCU sourced clock stop for debug
   output       l1clk;

   reg  l1en;
`ifdef INITLATZERO
  initial begin
        l1en = 1'b0;
     end
`endif
`ifdef SCAN_MODE
   always @ (l2clk or stop or pce or pce_ov)
       begin
         if (~l2clk) l1en <= (~stop & (pce | pce_ov));
       end
`else
   always @ (negedge l2clk )
        begin
           l1en <= (~stop & ( pce | pce_ov ));
        end
`endif

   assign       l1clk = (l2clk & l1en) | se;  // se is async and highest priority

endmodule

module  cl_mc1_l1hdr_by4_64x (
                 l2clk,
                 se,
                 pce,
                 pce_ov,
                 stop,
                 l1clk
                );
  
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        pce;             // Clock enable for local power savings
   input        pce_ov;        // TCU sourced clock enable override for testing
   input        stop;           // TCU/CCU sourced clock stop for debug
   output       l1clk;
   reg  l1en;
`ifdef INITLATZERO
  initial begin
        l1en = 1'b0;
  end
`endif
`ifdef SCAN_MODE
   always @ (l2clk or stop or pce or pce_ov)
       begin
         if (~l2clk) l1en <= (~stop & (pce | pce_ov));
       end
`else
   always @ (negedge l2clk )
        begin
           l1en <= (~stop & ( pce | pce_ov ));
        end
`endif

   assign       l1clk = (l2clk & l1en) | se;  // se is async and highest priority

endmodule


module cl_mc1_rep_m6_32x (
in,
out
);
input	in;
output	out;

assign out = in;

endmodule

module cl_mc1_rrf_msff_8x ( q, so, d, l1clk, si, siclk, soclk );
 
    output       q;
    output       so;
 
    input         d;
    input         l1clk;
    input         si;
    input         siclk;
    input         soclk;
 
    wire q, so;
    reg m, s;
 
    `ifdef SCAN_MODE
 
       always @(l1clk or siclk or soclk or d or si) begin
 
         if (!l1clk && !siclk)        m <=  d;    // Load master with data
         else if ( l1clk &&  siclk)   m <=  si;    // Load master with scan or flush
         else if (!l1clk &&  siclk)   m <=  1'bx;    // Conflict between data and scan
 
         if ( l1clk && !soclk && !siclk)  s <=  m;   // Load slave with master data
         else if (l1clk && siclk && !soclk)  s <= si;    // Flush
       end
 
    `else
       wire  si_unused = si;
       `ifdef INITLATZERO
       initial m = 1'b0;
       initial s = 1'b0;
       `endif
 
       always @(l1clk or d or si or siclk) begin
         if(siclk==0 && l1clk==0) m <=  d;
         if(siclk && !l1clk)                m <= 1'bx;
         else if(siclk && l1clk) m <= si;
       end
 
     `endif
 
       assign q = s;
       assign so  =  s;
 
endmodule

module cl_mc1_rrf_msff_mo_8x ( mq, mq_l, q, q_l, so, d, l1clk, si, siclk, soclk, and_clk );
 
   output     mq;
   output     mq_l;
   output     so;
   output     q;
   output     q_l;
   input      d;
   input      l1clk;
   input      and_clk;
   input      si;
   input      siclk;
   input      soclk;
 
   wire  mq, mq_l, q, q_l, so;
   reg   m, s;
 
   `ifdef SCAN_MODE
      always @(l1clk or siclk or soclk or d or si) begin
 
        if      (!l1clk && !siclk) m <=  d;   //Load master with data
        else if ( l1clk &&  siclk) m <=  si;  //Load master with scan or flush
        else if (!l1clk &&  siclk) m <=  1'bx;   //Conflict between data and scan
 
        if      (l1clk && !soclk && !siclk)  s <= m;  // Load slave with master data
        else if (l1clk && !soclk &&  siclk)  s <= si; // Flush
      end
 
   `else
//      wire   si_unused = si;
 
      `ifdef INITLATZERO
        initial m = 1'b0;
        initial s = 1'b0;
      `endif
 
      always @(l1clk or d or si or siclk) begin
        if      (!siclk && !l1clk) m <= d;
        else if ( siclk && !l1clk) m <= 1'bx;
        else if ( siclk &&  l1clk) m <= si;
        if      ( l1clk && !soclk) s <= m;
      end
 
    `endif
 
    `ifdef MODEL_AND
      assign mq = m & (and_clk & l1clk);
      assign mq_l = ~m & (and_clk & l1clk);
    `else
      wire      and_clk_unused = and_clk;
      assign mq = m;
      assign mq_l = ~m;
    `endif
      assign so  =  s;
      assign q   =  s;
      assign q_l = ~s;
 
endmodule

module cl_mc1_scm_msff_flop_4x (  q, q_l, so, d, l1clk, si, siclk, soclk);
 
          
   output       so;
   output       q;
   output       q_l;
   input         d;
   input         l1clk;
   input         si;
   input         siclk;
   input         soclk;
 
 
   wire  so;
   reg m, s;
 
   `ifdef SCAN_MODE
 
      always @(l1clk or siclk or soclk or d or si) begin
 
        if (!l1clk && !siclk)        m <=  d;    // Load master with data
        else if ( l1clk &&  siclk)   m <=  si;    // Load master with scan or flush
        else if (!l1clk &&  siclk)   m <=  1'bx;    // Conflict between data and scan
 
        if ( l1clk && !soclk && !siclk)  s <=  m;   // Load slave with master data
        else if (l1clk && siclk && !soclk)  s <= si;    // Flush
      end
 
   `else
      wire  si_unused = si;
 `ifdef INITLATZERO
      initial m = 1'b0;
      initial s = 1'b0;
      `endif
 
      always @(l1clk or d or si or siclk) begin
        if(siclk==0 && l1clk==0) m =  d;
        else if(siclk && !l1clk)                m = 1'bx;
         if(siclk && l1clk) m = si;
        if(l1clk && !soclk) s = m;
      end
 
    `endif
 
      assign so  =  s;
      assign q   =  s;
      assign q_l = ~s;
               
 
endmodule

module cl_mc1_scm_msff_lat_4x ( latout, q, q_l, so, d, l1clk, si, siclk, soclk);
 
   output       latout;
   output       so;
   output       q;
   output       q_l;
   input         d;
   input         l1clk;
   input         si;
   input         siclk;
   input         soclk;
 
   wire  so;
   reg m, s;
 
   `ifdef SCAN_MODE
    `ifdef FAST_FLUSH
        always @(l1clk or siclk or d) begin //vcs optimized code
 
          if (!l1clk && !siclk)       m <=  d;    // Load master with data
          else if ( l1clk && !siclk)  s <=  m;   // Load slave with master data
          else if ( l1clk &&  siclk) begin
               m <=  1'b0;    //  flush reset
               s <=  1'b0;
          end
        end
     `else
 
      always @(l1clk or siclk or soclk or d or si) begin
 
        if (!l1clk && !siclk)        m <=  d;    // Load master with data
        else if ( l1clk &&  siclk)   m <=  si;    // Load master with scan or flush
        else if (!l1clk &&  siclk)   m <=  1'bx;    // Conflict between data and scan
 
        if ( l1clk && !soclk && !siclk)  s <=  m;   // Load slave with master data
        else if (l1clk && siclk && !soclk)  s <= si;    // Flush
      end
     `endif
 
   `else
      wire  si_unused = si;
 `ifdef INITLATZERO
      initial m = 1'b0;
      initial s = 1'b0;
      `endif
 
      always @(l1clk or d or si or siclk) begin
        if(siclk==0 && l1clk==0) m =  d;
        else if(siclk && !l1clk)                m = 1'bx;
         if(siclk && l1clk) m = si;
        if(l1clk && !soclk) s = m;
      end
 
    `endif
      assign latout = m;
      assign so  =  s;
      assign q   =  s;
      assign q_l = ~s;
 
endmodule

module cl_mc1_sram_msff_mo_16x ( mq, mq_l, q, q_l, so, d, l1clk, si, siclk, soclk, and_clk );
 
   output     mq;
   output     mq_l;
   output     so;
   output     q;
   output     q_l;
   input      d;
   input      l1clk;
   input      and_clk;
   input      si;
   input      siclk;
   input      soclk;
 
   wire  mq, mq_l, q, q_l, so;
   reg   m, s;
 
   `ifdef SCAN_MODE
   `ifdef FAST_FLUSH
        always @(l1clk or siclk or d) begin //vcs optimized code

          if (!l1clk && !siclk)       m <=  d;    // Load master with data
          else if ( l1clk && !siclk)  s <=  m;   // Load slave with master data
          else if ( l1clk &&  siclk) begin
               m <=  1'b0;    //  flush reset
               s <=  1'b0;
          end
        end
     `else

      always @(l1clk or siclk or soclk or d or si) begin
 
        if      (!l1clk && !siclk) m <=  d;   //Load master with data
        else if ( l1clk &&  siclk) m <=  si;  //Load master with scan or flush
        else if (!l1clk &&  siclk) m <=  1'bx;   //Conflict between data and scan
 
        if      (l1clk && !soclk && !siclk)  s <= m;  // Load slave with master data
        else if (l1clk && !soclk &&  siclk)  s <= si; // Flush
      end
    `endif
 
   `else
//      wire   si_unused = si;
 
      `ifdef INITLATZERO
        initial m = 1'b0;
        initial s = 1'b0;
      `endif
 
      always @(l1clk or d or si or siclk) begin
        if      (!siclk && !l1clk) m <= d;
        else if ( siclk && !l1clk) m <= 1'bx;
        else if ( siclk &&  l1clk) m <= si;
        if      ( l1clk && !soclk) s <= m;
      end
 
    `endif
 
    `ifdef MODEL_AND
      assign mq = m & (and_clk & l1clk);
      assign mq_l = ~m & (and_clk & l1clk);
    `else
      wire      and_clk_unused = and_clk;
      assign mq = m;
      assign mq_l = ~m;
    `endif
      assign so  =  s;
      assign q   =  s;
      assign q_l = ~s;
 
endmodule

module cl_mc1_sram_msff_mo_32x ( mq, mq_l, q, so, d, l1clk, si, siclk, soclk, and_clk );
 
   output     mq;
   output     mq_l;
   output     so;
   output     q;
   input      d;
   input      l1clk;
   input      and_clk;
   input      si;
   input      siclk;
   input      soclk;
 
   wire  mq, mq_l, q, so;
   reg   m, s;
 
   `ifdef SCAN_MODE
    `ifdef FAST_FLUSH
        always @(l1clk or siclk or d) begin //vcs optimized code

          if (!l1clk && !siclk)       m <=  d;    // Load master with data
          else if ( l1clk && !siclk)  s <=  m;   // Load slave with master data
          else if ( l1clk &&  siclk) begin
               m <=  1'b0;    //  flush reset
               s <=  1'b0;
          end
        end
     `else

      always @(l1clk or siclk or soclk or d or si) begin
 
        if      (!l1clk && !siclk) m <=  d;   //Load master with data
        else if ( l1clk &&  siclk) m <=  si;  //Load master with scan or flush
        else if (!l1clk &&  siclk) m <=  1'bx;   //Conflict between data and scan
 
        if      (l1clk && !soclk && !siclk)  s <= m;  // Load slave with master data
        else if (l1clk && !soclk &&  siclk)  s <= si; // Flush
      end
     `endif
 
   `else
//      wire   si_unused = si;
 
      `ifdef INITLATZERO
        initial m = 1'b0;
        initial s = 1'b0;
      `endif
 
      always @(l1clk or d or si or siclk) begin
        if      (!siclk && !l1clk) m <= d;
        else if ( siclk && !l1clk) m <= 1'bx;
        else if ( siclk &&  l1clk) m <= si;
        if      ( l1clk && !soclk) s <= m;
      end
 
    `endif
 
    `ifdef MODEL_AND
      assign mq = m & (and_clk & l1clk);
      assign mq_l = ~m & (and_clk & l1clk);
    `else
      wire      and_clk_unused = and_clk;
      assign mq = m;
      assign mq_l = ~m;
    `endif
      assign so  =  s;
      assign q   =  s;
 
endmodule

module cl_mc1_sram_msff_mo_4x ( mq, mq_l, q, q_l, so, d, l1clk, si, siclk, soclk, and_clk );
 
   output     mq;
   output     mq_l;
   output     so;
   output     q;
   output     q_l;
   input      d;
   input      l1clk;
   input      and_clk;
   input      si;
   input      siclk;
   input      soclk;
 
   wire  mq, mq_l, q, q_l, so;
   reg   m, s;
 
   `ifdef SCAN_MODE
   `ifdef FAST_FLUSH
        always @(l1clk or siclk or d) begin //vcs optimized code

          if (!l1clk && !siclk)       m <=  d;    // Load master with data
          else if ( l1clk && !siclk)  s <=  m;   // Load slave with master data
          else if ( l1clk &&  siclk) begin
               m <=  1'b0;    //  flush reset
               s <=  1'b0;
          end
        end
     `else

      always @(l1clk or siclk or soclk or d or si) begin
 
        if      (!l1clk && !siclk) m <=  d;   //Load master with data
        else if ( l1clk &&  siclk) m <=  si;  //Load master with scan or flush
        else if (!l1clk &&  siclk) m <=  1'bx;   //Conflict between data and scan
 
        if      (l1clk && !soclk && !siclk)  s <= m;  // Load slave with master data
        else if (l1clk && !soclk &&  siclk)  s <= si; // Flush
      end
    `endif
 
   `else
//      wire   si_unused = si;
 
      `ifdef INITLATZERO
        initial m = 1'b0;
        initial s = 1'b0;
      `endif
 
      always @(l1clk or d or si or siclk) begin
        if      (!siclk && !l1clk) m <= d;
        else if ( siclk && !l1clk) m <= 1'bx;
        else if ( siclk &&  l1clk) m <= si;
        if      ( l1clk && !soclk) s <= m;
      end
 
    `endif
 
    `ifdef MODEL_AND
      assign mq = m & (and_clk & l1clk);
      assign mq_l = ~m & (and_clk & l1clk);
    `else
      wire      and_clk_unused = and_clk;
      assign mq = m;
      assign mq_l = ~m;
    `endif
      assign so  =  s;
      assign q   =  s;
      assign q_l = ~s;
 
endmodule

module cl_mc1_sram_msff_mo_8x ( mq, mq_l, q, q_l, so, d, l1clk, si, siclk, soclk, and_clk );
 
   output     mq;
   output     mq_l;
   output     so;
   output     q;
   output     q_l;
   input      d;
   input      l1clk;
   input      and_clk;
   input      si;
   input      siclk;
   input      soclk;
 
   wire  mq, mq_l, q, q_l, so;
   reg   m, s;
 
   `ifdef SCAN_MODE
   `ifdef FAST_FLUSH
        always @(l1clk or siclk or d) begin //vcs optimized code

          if (!l1clk && !siclk)       m <=  d;    // Load master with data
          else if ( l1clk && !siclk)  s <=  m;   // Load slave with master data
          else if ( l1clk &&  siclk) begin
               m <=  1'b0;    //  flush reset
               s <=  1'b0;
          end
        end
     `else

      always @(l1clk or siclk or soclk or d or si) begin
 
        if      (!l1clk && !siclk) m <=  d;   //Load master with data
        else if ( l1clk &&  siclk) m <=  si;  //Load master with scan or flush
        else if (!l1clk &&  siclk) m <=  1'bx;   //Conflict between data and scan
 
        if      (l1clk && !soclk && !siclk)  s <= m;  // Load slave with master data
        else if (l1clk && !soclk &&  siclk)  s <= si; // Flush
      end
    `endif
 
   `else
//      wire   si_unused = si;
 
      `ifdef INITLATZERO
        initial m = 1'b0;
        initial s = 1'b0;
      `endif
 
      always @(l1clk or d or si or siclk) begin
        if      (!siclk && !l1clk) m <= d;
        else if ( siclk && !l1clk) m <= 1'bx;
        else if ( siclk &&  l1clk) m <= si;
        if      ( l1clk && !soclk) s <= m;
      end
 
    `endif
 
    `ifdef MODEL_AND
      assign mq = m & (and_clk & l1clk);
      assign mq_l = ~m & (and_clk & l1clk);
    `else
      wire      and_clk_unused = and_clk;
      assign mq = m;
      assign mq_l = ~m;
    `endif
      assign so  =  s;
      assign q   =  s;
      assign q_l = ~s;
 
endmodule
module cl_mc1_sram_msff_mo_nand2_16x ( mq, mq_l, q, q_l, so, d, l1clk, si, siclk, soclk );

   output mq;
   output mq_l;
   output q;
   output q_l;
   output so;

   input  d;
   input  l1clk;
   input  si;
   input  siclk;
   input  soclk;

    wire  mq;
    wire  mq_l;
    wire   q;
    wire  q_l;
    wire  so;

    reg m, s;

    `ifdef SCAN_MODE
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           m <= d;    // Load master with data
               else if ( l1clk &&  siclk)           m <= si;   // Load master with scan or flush
               else if (!l1clk &&  siclk)           m <= 1'bx; // Conflict between data and scan

                    if ( l1clk && !siclk && !soclk)  s <= m;   // Load slave with master data
               else if ( l1clk &&  siclk && !soclk)  s <= si;  // Flush
              end
   `else
//      wire   si_unused = si;

          `ifdef INITLATZERO
                initial m = 1'b0;
                initial s = 1'b0;
          `endif

      always @(l1clk or d or si or siclk) begin
        if      (!siclk && !l1clk) m <= d;
        else if ( siclk && !l1clk) m <= 1'bx;
        else if ( siclk &&  l1clk) m <= si;
        if      ( l1clk && !soclk) s <= m;
      end
 
    `endif

    `ifdef MODEL_AND
      assign mq = m & l1clk;
      assign mq_l = ~m & l1clk;
    `else
      wire      si_unused = siclk;
      assign mq = m;
      assign mq_l = ~m;
    `endif

         assign so = s;
         assign q   =  s;
         assign q_l = ~s;

endmodule

module cl_mc1_sram_msff_mo_nand2_8x ( mq, mq_l, q, q_l, so, d, l1clk, si, siclk, soclk );

   output mq;
   output mq_l;
   output q;
   output q_l;
   output so;

   input  d;
   input  l1clk;
   input  si;
   input  siclk;
   input  soclk;

    wire  mq;
    wire  mq_l;
    wire   q;
    wire  q_l;
    wire  so;

    reg m, s;

    `ifdef SCAN_MODE
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           m <= d;    // Load master with data
               else if ( l1clk &&  siclk)           m <= si;   // Load master with scan or flush
               else if (!l1clk &&  siclk)           m <= 1'bx; // Conflict between data and scan

                    if ( l1clk && !siclk && !soclk)  s <= m;   // Load slave with master data
               else if ( l1clk &&  siclk && !soclk)  s <= si;  // Flush
              end
   `else
//      wire   si_unused = si;

          `ifdef INITLATZERO
                initial m = 1'b0;
                initial s = 1'b0;
          `endif

      always @(l1clk or d or si or siclk) begin
        if      (!siclk && !l1clk) m <= d;
        else if ( siclk && !l1clk) m <= 1'bx;
        else if ( siclk &&  l1clk) m <= si;
        if      ( l1clk && !soclk) s <= m;
      end
 
    `endif

    `ifdef MODEL_AND
      assign mq = m & l1clk;
      assign mq_l = ~m & l1clk;
    `else
      wire      si_unused = siclk;
      assign mq = m;
      assign mq_l = ~m;
    `endif

         assign so = s;
         assign q   =  s;
         assign q_l = ~s;

endmodule


module cl_mc1_sram_msff_mo_nand3_16x ( mq, mq_l, q, q_l, so, d, l1clk, si, siclk, soclk, and_clk );
 
   output     mq;
   output     mq_l;
   output     so;
   output     q;
   output     q_l;
   input      d;
   input      l1clk;
   input      and_clk;
   input      si;
   input      siclk;
   input      soclk;
 
   wire  mq, mq_l, q, q_l, so;
   reg   m, s;
 
   `ifdef SCAN_MODE
      always @(l1clk or siclk or soclk or d or si) begin
 
        if      (!l1clk && !siclk) m <=  d;   //Load master with data
        else if ( l1clk &&  siclk) m <=  si;  //Load master with scan or flush
        else if (!l1clk &&  siclk) m <=  1'bx;   //Conflict between data and scan
 
        if      (l1clk && !soclk && !siclk)  s <= m;  // Load slave with master data
        else if (l1clk && !soclk &&  siclk)  s <= si; // Flush
      end
 
   `else
//      wire   si_unused = si;
 
      `ifdef INITLATZERO
        initial m = 1'b0;
        initial s = 1'b0;
      `endif
 
      always @(l1clk or d or si or siclk) begin
        if      (!siclk && !l1clk) m <= d;
        else if ( siclk && !l1clk) m <= 1'bx;
        else if ( siclk &&  l1clk) m <= si;
        if      ( l1clk && !soclk) s <= m;
      end
 
    `endif
 
    `ifdef MODEL_AND
      assign mq = m & (and_clk & l1clk);
      assign mq_l = ~m & (and_clk & l1clk);
    `else
      wire      and_clk_unused = and_clk;
      assign mq = m;
      assign mq_l = ~m;
    `endif
      assign so  =  s;
      assign q   =  s;
      assign q_l = ~s;
 
endmodule

module cl_mc1_sram_msff_mo_nand3_8x ( mq, mq_l, q, q_l, so, d, l1clk, si, siclk, soclk, and_clk );
 
   output     mq;
   output     mq_l;
   output     so;
   output     q;
   output     q_l;
   input      d;
   input      l1clk;
   input      and_clk;
   input      si;
   input      siclk;
   input      soclk;
 
   wire  mq, mq_l, q, q_l, so;
   reg   m, s;
 
   `ifdef SCAN_MODE
      always @(l1clk or siclk or soclk or d or si) begin
 
        if      (!l1clk && !siclk) m <=  d;   //Load master with data
        else if ( l1clk &&  siclk) m <=  si;  //Load master with scan or flush
        else if (!l1clk &&  siclk) m <=  1'bx;   //Conflict between data and scan
 
        if      (l1clk && !soclk && !siclk)  s <= m;  // Load slave with master data
        else if (l1clk && !soclk &&  siclk)  s <= si; // Flush
      end
 
   `else
//      wire   si_unused = si;
 
      `ifdef INITLATZERO
        initial m = 1'b0;
        initial s = 1'b0;
      `endif
 
      always @(l1clk or d or si or siclk) begin
        if      (!siclk && !l1clk) m <= d;
        else if ( siclk && !l1clk) m <= 1'bx;
        else if ( siclk &&  l1clk) m <= si;
        if      ( l1clk && !soclk) s <= m;
      end
 
    `endif
 
    `ifdef MODEL_AND
      assign mq = m & (and_clk & l1clk);
      assign mq_l = ~m & (and_clk & l1clk);
    `else
      wire      and_clk_unused = and_clk;
      assign mq = m;
      assign mq_l = ~m;
    `endif
      assign so  =  s;
      assign q   =  s;
      assign q_l = ~s;
 
endmodule

module cl_mc1_sram_msff_mo_opt_16x ( mq, mq_l, q, q_l, so, d, l1clk, si, siclk, soclk, and_clk );
 
   output     mq;
   output     mq_l;
   output     so;
   output     q;
   output     q_l;
   input      d;
   input      l1clk;
   input      and_clk;
   input      si;
   input      siclk;
   input      soclk;
 
   wire  mq, mq_l, q, q_l, so;
   reg   m, s;
 
   `ifdef SCAN_MODE
      always @(l1clk or siclk or soclk or d or si) begin
 
        if      (!l1clk && !siclk) m <=  d;   //Load master with data
        else if ( l1clk &&  siclk) m <=  si;  //Load master with scan or flush
        else if (!l1clk &&  siclk) m <=  1'bx;   //Conflict between data and scan
 
        if      (l1clk && !soclk && !siclk)  s <= m;  // Load slave with master data
        else if (l1clk && !soclk &&  siclk)  s <= si; // Flush
      end
 
   `else
//      wire   si_unused = si;
 
      `ifdef INITLATZERO
        initial m = 1'b0;
        initial s = 1'b0;
      `endif
 
      always @(l1clk or d or si or siclk) begin
        if      (!siclk && !l1clk) m <= d;
        else if ( siclk && !l1clk) m <= 1'bx;
        else if ( siclk &&  l1clk) m <= si;
        if      ( l1clk && !soclk) s <= m;
      end
 
    `endif
 
    `ifdef MODEL_AND
      assign mq = m & (and_clk & l1clk);
      assign mq_l = ~m & (and_clk & l1clk);
    `else
      wire      and_clk_unused = and_clk;
      assign mq = m;
      assign mq_l = ~m;
    `endif
      assign so  =  s;
      assign q   =  s;
      assign q_l = ~s;
 
endmodule

module cl_mc1_sram_msff_mo_opt_8x ( mq, mq_l, q, q_l, so, d, l1clk, si, siclk, soclk, and_clk );
 
   output     mq;
   output     mq_l;
   output     so;
   output     q;
   output     q_l;
   input      d;
   input      l1clk;
   input      and_clk;
   input      si;
   input      siclk;
   input      soclk;
 
   wire  mq, mq_l, q, q_l, so;
   reg   m, s;
 
   `ifdef SCAN_MODE
      always @(l1clk or siclk or soclk or d or si) begin
 
        if      (!l1clk && !siclk) m <=  d;   //Load master with data
        else if ( l1clk &&  siclk) m <=  si;  //Load master with scan or flush
        else if (!l1clk &&  siclk) m <=  1'bx;   //Conflict between data and scan
 
        if      (l1clk && !soclk && !siclk)  s <= m;  // Load slave with master data
        else if (l1clk && !soclk &&  siclk)  s <= si; // Flush
      end
 
   `else
//      wire   si_unused = si;
 
      `ifdef INITLATZERO
        initial m = 1'b0;
        initial s = 1'b0;
      `endif
 
      always @(l1clk or d or si or siclk) begin
        if      (!siclk && !l1clk) m <= d;
        else if ( siclk && !l1clk) m <= 1'bx;
        else if ( siclk &&  l1clk) m <= si;
        if      ( l1clk && !soclk) s <= m;
      end
 
    `endif
 
    `ifdef MODEL_AND
      assign mq = m & (and_clk & l1clk);
      assign mq_l = ~m & (and_clk & l1clk);
    `else
      wire      and_clk_unused = and_clk;
      assign mq = m;
      assign mq_l = ~m;
    `endif
      assign so  =  s;
      assign q   =  s;
      assign q_l = ~s;
 
endmodule
module cl_mc1_sram_msff_mo_phaseb_8x ( phaseb_mq, phaseb_mq_l, q, q_l, so, d, l1clk, si, siclk, soclk, and_clk );

   output phaseb_mq;
   output phaseb_mq_l;
   output q;
   output q_l;
   output so;

   input  d;
   input  l1clk;
   input  si;
   input  siclk;
   input  soclk;
   input  and_clk;

    wire  phaseb_mq;
    wire  phaseb_mq_l;
    reg   q;
    wire  q_l;
    wire  so;

    reg m;
    
   `ifdef SCAN_MODE
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           m <= d;    // Load master with data
               else if ( l1clk &&  siclk)           m <= si;   // Load master with scan or flush
               else if (!l1clk &&  siclk)           m <= 1'bx; // Conflict between data and scan

                    if ( l1clk && !siclk && !soclk)  q <= m;   // Load slave with master data
               else if ( l1clk &&  siclk && !soclk)  q <= si;   // Flush
              end
   `else
//      wire   si_unused = si;

          `ifdef INITLATZERO
                initial q = 1'b0;
                initial m = 1'b0;
          `endif

      always @(l1clk or d or si or siclk) begin
        if      (!siclk && !l1clk) m <= d;
        else if ( siclk && !l1clk) m <= 1'bx;
        else if ( siclk &&  l1clk) m <= si;
        if      ( l1clk && !soclk) q <= m;
      end

    `endif

    `ifdef MODEL_AND
      assign phaseb_mq   = ~and_clk  && q;
      assign phaseb_mq_l = ~and_clk  && q_l;
    `else
      wire      and_clk_unused = and_clk;
      assign phaseb_mq   = q;
      assign phaseb_mq_l = ~q;
    `endif
         assign so = q;
         assign q_l = ~q;

endmodule


module cl_mc1_tcam_msff_4x ( q, so, d, l1clk, si, siclk, soclk );
 
    output       q;
    output       so;
 
    input         d;
    input         l1clk;
    input         si;
    input         siclk;
    input         soclk;
 
    wire q, so;
    reg m, s;
 
    `ifdef SCAN_MODE
 
       always @(l1clk or siclk or soclk or d or si) begin
 
         if (!l1clk && !siclk)        m <=  d;    // Load master with data
         else if ( l1clk &&  siclk)   m <=  si;    // Load master with scan or flush
         else if (!l1clk &&  siclk)   m <=  1'bx;    // Conflict between data and scan
 
         if ( l1clk && !soclk && !siclk)  s <=  m;   // Load slave with master data
         else if (l1clk && siclk && !soclk)  s <= si;    // Flush
       end
 
    `else
       wire  si_unused = si;
       `ifdef INITLATZERO
       initial m = 1'b0;
       initial s = 1'b0;
       `endif
 
       always @(l1clk or d or si or siclk) begin
         if(siclk==0 && l1clk==0) m <=  d;
         if(siclk && !l1clk)                m <= 1'bx;
         else if(siclk && l1clk) m <= si;
       end
 
     `endif
 
       assign q = s;
       assign so  =  s;
 
endmodule

module cl_mc1_tisram_bla_4x (q_a, d_b, l1clk);
     output       q_a;
     input         d_b;
     input         l1clk;
  reg q_a;

 `ifdef INITLATZERO
                  initial q_a = 1'b0;
 `endif
 
        always @(l1clk or d_b) begin
          if(l1clk==1)    q_a <=  d_b;
        end
 
endmodule


module cl_mc1_tisram_blb_4x (q_b, d_a, l1clk);
     output       q_b;
     input         d_a;
     input         l1clk;
  reg q_b;

 `ifdef INITLATZERO
                  initial q_b = 1'b0;
 `endif
 
        always @(l1clk or d_a) begin
          if(l1clk==0)    q_b <=  d_a;
        end
 
endmodule


module cl_mc1_tisram_blbi_8x (q_b_l, d_a, l1clk);
     output       q_b_l;
     input         d_a;
     input         l1clk;
  reg q_b_l;

 `ifdef INITLATZERO
                  initial q_b_l = 1'b0;
 `endif

        always @(l1clk or d_a) begin
          if(l1clk==0)    q_b_l <=  ~d_a;
        end

endmodule

module cl_mc1_tisram_msff_16x ( latout, latout_l, so, d, l1clk, si,
siclk, soclk );
 
    output       latout;
    output       latout_l;
    output       so;
 
    input         d;
    input         l1clk;
    input         si;
    input         siclk;
    input         soclk;
 
    wire latout, latout_l, so;
    reg m, s;
 
    `ifdef SCAN_MODE
 
       always @(l1clk or siclk or soclk or d or si) begin
 
         if (!l1clk && !siclk)        m <=  d;    // Load master with data
         else if ( l1clk &&  siclk)   m <=  si;    // Load master with scan or flush
         else if (!l1clk &&  siclk)   m <=  1'bx;    // Conflict between data and scan
 
         if ( l1clk && !soclk && !siclk)  s <=  m;   // Load slave with master data
         else if (l1clk && siclk && !soclk)  s <= si;    // Flush
       end
 
    `else
       wire  si_unused = si;
       `ifdef INITLATZERO
       initial m = 1'b0;
       initial s = 1'b0;
       `endif
 
       always @(l1clk or d or si or siclk) begin
         if(siclk==0 && l1clk==0) m <=  d;
         if(siclk && !l1clk)                m <= 1'bx;
         else if(siclk && l1clk) m <= si;
       end
 
     `endif
 
       assign latout = m;
       assign latout_l = ~m;
       assign so  =  s;
 
endmodule

module cl_mc1_tisram_msff_8x ( latout, latout_l, so, d, l1clk, si,
siclk, soclk );
 
    output       latout;
    output       latout_l;
    output       so;
 
    input         d;
    input         l1clk;
    input         si;
    input         siclk;
    input         soclk;
 
    wire latout, latout_l, so;
    reg m, s;
 
    `ifdef SCAN_MODE
 
       always @(l1clk or siclk or soclk or d or si) begin
 
         if (!l1clk && !siclk)        m <=  d;    // Load master with data
         else if ( l1clk &&  siclk)   m <=  si;    // Load master with scan or flush
         else if (!l1clk &&  siclk)   m <=  1'bx;    // Conflict between data and scan
 
         if ( l1clk && !soclk && !siclk)  s <=  m;   // Load slave with master data
         else if (l1clk && siclk && !soclk)  s <= si;    // Flush
       end
 
    `else
       wire  si_unused = si;
       `ifdef INITLATZERO
       initial m = 1'b0;
       initial s = 1'b0;
       `endif
 
       always @(l1clk or d or si or siclk) begin
         if(siclk==0 && l1clk==0) m <=  d;
         if(siclk && !l1clk)                m <= 1'bx;
         else if(siclk && l1clk) m <= si;
       end
 
     `endif
 
       assign latout = m;
       assign latout_l = ~m;
       assign so  =  s;
 
endmodule
