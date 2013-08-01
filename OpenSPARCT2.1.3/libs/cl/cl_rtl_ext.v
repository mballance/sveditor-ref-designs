// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: cl_rtl_ext.v
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
module  mux2e ( dout, in0, in1, sel );

   parameter                    SIZE = 1;

   output       [SIZE-1:0]      dout;
   input        [SIZE-1:0]      in0;
   input        [SIZE-1:0]      in1;
   input                        sel;

   reg          [SIZE-1:0]      dout;

   always @ ( sel or in0 or in1 )
	 begin
	    case ( sel )    
	      1'b0: dout = in0;
	      1'b1: dout = in1;
			    
	      default:
		  dout = { SIZE { 1'bx } }; 
	    endcase // case( sel )
	 end // always @ ( sel or in0 or in1 )

endmodule // mux2e


module	mux3 ( dout, in0,  in1,  in2,
		     sel0, sel1, sel2, muxtst );

   parameter			SIZE = 1;

   output	[SIZE-1:0]	dout;
   input	[SIZE-1:0]	in0;
   input	[SIZE-1:0]	in1;
   input	[SIZE-1:0]	in2;
   input			sel0;
   input			sel1;
   input			sel2;
   input			muxtst;
 
   wire		     [3:0]	sel = { muxtst, sel2, sel1, sel0 };

  reg		[SIZE-1:0] 	dout;

`ifdef MUXOHTEST
//0in one_hot -var sel[2:0] -message "mux3 selects not one-hot!"
`endif

  always @ ( sel or in0 or in1 or in2 )
     casex ( sel )	
       4'bx001:			dout = in0;
       4'bx010:			dout = in1;
       4'bx100:			dout = in2;
       4'b0000:			dout = { SIZE {1'b1 }};
			
       default:
	      dout = { SIZE { 1'bx } }; 
     endcase // case( sel )

endmodule // mux3


module	mux4 ( dout, in0,  in1,  in2,  in3,
		     sel0, sel1, sel2, sel3, muxtst );

   parameter			SIZE = 1;

   output	[SIZE-1:0]	dout;
   input	[SIZE-1:0]	in0;
   input	[SIZE-1:0]	in1;
   input	[SIZE-1:0]	in2;
   input	[SIZE-1:0]	in3;
   input			sel0;
   input			sel1;
   input			sel2;
   input			sel3;
   input			muxtst;

   wire		     [4:0]	sel = { muxtst, sel3, sel2, sel1, sel0 };

   reg		[SIZE-1:0] 	dout;

`ifdef MUXOHTEST
//0in one_hot -var sel[3:0] -message "mux4 selects not one-hot!"
`endif

   always @ ( sel or in0 or in1 or in2 or in3 )
     casex ( sel )	
       5'bx0001:			dout = in0;
       5'bx0010:			dout = in1;
       5'bx0100:			dout = in2;
       5'bx1000:			dout = in3;
       5'b00000:			dout = { SIZE { 1'b1 } };
			
       default:
	      dout = { SIZE { 1'bx } }; 
     endcase // case( sel )


endmodule // mux4


module	mux5 ( dout, in0,  in1,  in2,  in3,  in4,
		     sel0, sel1, sel2, sel3, sel4, muxtst );

   parameter			SIZE = 1;

   output	[SIZE-1:0]	dout;
   input	[SIZE-1:0]	in0;
   input	[SIZE-1:0]	in1;
   input	[SIZE-1:0]	in2;
   input	[SIZE-1:0]	in3;
   input	[SIZE-1:0]	in4;
   input			sel0;
   input			sel1;
   input			sel2;
   input			sel3;
   input			sel4;
   input			muxtst;

   wire		     [5:0]	sel = { muxtst, sel4, sel3, sel2, sel1, sel0 };

   reg		[SIZE-1:0] 	dout;

`ifdef MUXOHTEST
//0in one_hot -var sel[4:0] -message "mux5 selects not one-hot!"
`endif

   always @ ( sel or in0 or in1 or in2 or in3 or in4 )
     casex ( sel )	
       6'bx00001:		dout = in0;
       6'bx00010:		dout = in1;
       6'bx00100:		dout = in2;
       6'bx01000:		dout = in3;
       6'bx10000:		dout = in4;
       6'b000000:		dout = { SIZE { 1'b1 }};
			
       default:
	      dout = { SIZE { 1'bx } }; 
     endcase // case( sel )

endmodule // mux5


module	mux6 ( dout, in0,  in1,  in2,  in3,  in4,  in5,
		     sel0, sel1, sel2, sel3, sel4, sel5, muxtst );

   parameter			SIZE = 1;

   output	[SIZE-1:0]	dout;
   input	[SIZE-1:0]	in0;
   input	[SIZE-1:0]	in1;
   input	[SIZE-1:0]	in2;
   input	[SIZE-1:0]	in3;
   input	[SIZE-1:0]	in4;
   input	[SIZE-1:0]	in5;
   input			sel0;
   input			sel1;
   input			sel2;
   input			sel3;
   input			sel4;
   input			sel5;
   input			muxtst;

   wire		     [6:0]	sel = { muxtst, sel5,
					sel4, sel3, sel2, sel1, sel0 };

   reg		[SIZE-1:0] 	dout;

`ifdef MUXOHTEST
//0in one_hot -var sel[5:0] -message "mux6 selects not one-hot!"
`endif

   always @ ( sel or in0 or in1 or in2 or in3 or in4 or
		     in5 )
     casex ( sel )	
       7'bx000001:		dout = in0;
       7'bx000010:		dout = in1;
       7'bx000100:		dout = in2;
       7'bx001000:		dout = in3;
       7'bx010000:		dout = in4;
       7'bx100000:		dout = in5;
       7'b0000000:		dout = { SIZE { 1'b1 } };
			
       default:
	      dout = { SIZE { 1'bx } }; 
     endcase // case( sel )

endmodule // mux6


module	mux7 ( dout, in0,  in1,  in2,  in3,  in4,  in5,  in6,
		     sel0, sel1, sel2, sel3, sel4, sel5, sel6, muxtst );

   parameter			SIZE = 1;

   output	[SIZE-1:0]	dout;
   input	[SIZE-1:0]	in0;
   input	[SIZE-1:0]	in1;
   input	[SIZE-1:0]	in2;
   input	[SIZE-1:0]	in3;
   input	[SIZE-1:0]	in4;
   input	[SIZE-1:0]	in5;
   input	[SIZE-1:0]	in6;
   input			sel0;
   input			sel1;
   input			sel2;
   input			sel3;
   input			sel4;
   input			sel5;
   input			sel6;
   input 			muxtst;

   wire		     [7:0]	sel = { muxtst, sel6, sel5,
					sel4, sel3, sel2, sel1, sel0 };
   reg		[SIZE-1:0] 	dout;

`ifdef MUXOHTEST
//0in one_hot -var sel[6:0] -message "mux7 selects not one-hot!"
`endif

   always @ ( sel or in0 or in1 or in2 or in3 or in4 or
		     in5 or in6 )
     casex ( sel )	
       8'bx0000001:		dout = in0;
       8'bx0000010:		dout = in1;
       8'bx0000100:		dout = in2;
       8'bx0001000:		dout = in3;
       8'bx0010000:		dout = in4;
       8'bx0100000:		dout = in5;
       8'bx1000000:		dout = in6;
       8'b00000000:		dout = { SIZE { 1'b1 } };
			
       default:
	      dout = { SIZE { 1'bx } }; 
     endcase // case( sel )

endmodule // mux7


module	mux8 ( dout, in0,  in1,  in2,  in3,  in4,  in5,  in6,  in7,
		     sel0, sel1, sel2, sel3, sel4, sel5, sel6, sel7, muxtst );

   parameter			SIZE = 1;

   output	[SIZE-1:0]	dout;
   input	[SIZE-1:0]	in0;
   input	[SIZE-1:0]	in1;
   input	[SIZE-1:0]	in2;
   input	[SIZE-1:0]	in3;
   input	[SIZE-1:0]	in4;
   input	[SIZE-1:0]	in5;
   input	[SIZE-1:0]	in6;
   input	[SIZE-1:0]	in7;
   input			sel0;
   input			sel1;
   input			sel2;
   input			sel3;
   input			sel4;
   input			sel5;
   input			sel6;
   input			sel7;
   input			muxtst;

   wire		     [8:0]	sel = { muxtst, sel7, sel6, sel5,
					sel4, sel3, sel2, sel1, sel0 };
   reg		[SIZE-1:0] 	dout;

`ifdef MUXOHTEST
//0in one_hot -var sel[7:0] -message "mux8 selects not one-hot!"
`endif

   always @ ( sel or in0 or in1 or in2 or in3 or in4 or
		     in5 or in6 or in7 )
     casex ( sel )	
       9'bx00000001:		dout = in0;
       9'bx00000010:		dout = in1;
       9'bx00000100:		dout = in2;
       9'bx00001000:		dout = in3;
       9'bx00010000:		dout = in4;
       9'bx00100000:		dout = in5;
       9'bx01000000:		dout = in6;
       9'bx10000000:		dout = in7;
       9'b000000000:		dout = { SIZE { 1'b1 } };
			
       default:
	      dout = { SIZE { 1'bx } }; 
     endcase // case( sel )

endmodule // mux8


`ifdef FPGA
`else
module	mux2s ( dout, in0,  in1,
		      sel0, sel1 );

   parameter			SIZE = 1;

   output	[SIZE-1:0]	dout;
   input	[SIZE-1:0]	in0;
   input	[SIZE-1:0]	in1;
   input			sel0;
   input			sel1;

   assign			dout = ( ( in0 & { SIZE { sel0 } } ) |
					 ( in1 & { SIZE { sel1 } } ) );

endmodule // mux2s
`endif // `ifdef FPGA


module	mux3s ( dout, in0,  in1,  in2,
		      sel0, sel1, sel2 );

   parameter			SIZE = 1;

   output	[SIZE-1:0]	dout;
   input	[SIZE-1:0]	in0;
   input	[SIZE-1:0]	in1;
   input	[SIZE-1:0]	in2;
   input			sel0;
   input			sel1;
   input			sel2;

   assign			dout = ( ( in0 & { SIZE { sel0 } } ) |
					 ( in1 & { SIZE { sel1 } } ) |
					 ( in2 & { SIZE { sel2 } } ) );

endmodule // mux3s


`ifdef FPGA
`else
module	mux4s ( dout, in0,  in1,  in2,  in3,
		      sel0, sel1, sel2, sel3 );

   parameter			SIZE = 1;

   output	[SIZE-1:0]	dout;
   input	[SIZE-1:0]	in0;
   input	[SIZE-1:0]	in1;
   input	[SIZE-1:0]	in2;
   input	[SIZE-1:0]	in3;
   input			sel0;
   input			sel1;
   input			sel2;
   input			sel3;

   assign			dout = ( ( in0 & { SIZE { sel0 } } ) |
					 ( in1 & { SIZE { sel1 } } ) |
					 ( in2 & { SIZE { sel2 } } ) |
					 ( in3 & { SIZE { sel3 } } ) );

endmodule // mux4s
`endif // `ifdef FPGA


module	mux5s ( dout, in0,  in1,  in2,  in3,  in4,
		      sel0, sel1, sel2, sel3, sel4 );

   parameter			SIZE = 1;

   output	[SIZE-1:0]	dout;
   input	[SIZE-1:0]	in0;
   input	[SIZE-1:0]	in1;
   input	[SIZE-1:0]	in2;
   input	[SIZE-1:0]	in3;
   input	[SIZE-1:0]	in4;
   input			sel0;
   input			sel1;
   input			sel2;
   input			sel3;
   input			sel4;

   assign			dout = ( ( in0 & { SIZE { sel0 } } ) |
					 ( in1 & { SIZE { sel1 } } ) |
					 ( in2 & { SIZE { sel2 } } ) |
					 ( in3 & { SIZE { sel3 } } ) |
					 ( in4 & { SIZE { sel4 } } ) );

endmodule // mux5s


module	mux6s ( dout, in0,  in1,  in2,  in3,  in4,  in5,
		      sel0, sel1, sel2, sel3, sel4, sel5 );

   parameter			SIZE = 1;

   output	[SIZE-1:0]	dout;
   input	[SIZE-1:0]	in0;
   input	[SIZE-1:0]	in1;
   input	[SIZE-1:0]	in2;
   input	[SIZE-1:0]	in3;
   input	[SIZE-1:0]	in4;
   input	[SIZE-1:0]	in5;
   input			sel0;
   input			sel1;
   input			sel2;
   input			sel3;
   input			sel4;
   input			sel5;

   assign			dout = ( ( in0 & { SIZE { sel0 } } ) |
					 ( in1 & { SIZE { sel1 } } ) |
					 ( in2 & { SIZE { sel2 } } ) |
					 ( in3 & { SIZE { sel3 } } ) |
					 ( in4 & { SIZE { sel4 } } ) |
					 ( in5 & { SIZE { sel5 } } ) );

endmodule // mux6s


module	mux7s ( dout, in0,  in1,  in2,  in3,  in4,  in5,  in6,
		      sel0, sel1, sel2, sel3, sel4, sel5, sel6 );

   parameter			SIZE = 1;

   output	[SIZE-1:0]	dout;
   input	[SIZE-1:0]	in0;
   input	[SIZE-1:0]	in1;
   input	[SIZE-1:0]	in2;
   input	[SIZE-1:0]	in3;
   input	[SIZE-1:0]	in4;
   input	[SIZE-1:0]	in5;
   input	[SIZE-1:0]	in6;
   input			sel0;
   input			sel1;
   input			sel2;
   input			sel3;
   input			sel4;
   input			sel5;
   input			sel6;

   assign			dout = ( ( in0 & { SIZE { sel0 } } ) |
					 ( in1 & { SIZE { sel1 } } ) |
					 ( in2 & { SIZE { sel2 } } ) |
					 ( in3 & { SIZE { sel3 } } ) |
					 ( in4 & { SIZE { sel4 } } ) |
					 ( in5 & { SIZE { sel5 } } ) |
					 ( in6 & { SIZE { sel6 } } ) );

endmodule // mux7s


`ifdef FPGA
`else
module	mux8s ( dout, in0,  in1,  in2,  in3,  in4,  in5,  in6,  in7,
		      sel0, sel1, sel2, sel3, sel4, sel5, sel6, sel7 );

   parameter			SIZE = 1;

   output	[SIZE-1:0]	dout;
   input	[SIZE-1:0]	in0;
   input	[SIZE-1:0]	in1;
   input	[SIZE-1:0]	in2;
   input	[SIZE-1:0]	in3;
   input	[SIZE-1:0]	in4;
   input	[SIZE-1:0]	in5;
   input	[SIZE-1:0]	in6;
   input	[SIZE-1:0]	in7;
   input			sel0;
   input			sel1;
   input			sel2;
   input			sel3;
   input			sel4;
   input			sel5;
   input			sel6;
   input			sel7;

   assign			dout = ( ( in0 & { SIZE { sel0 } } ) |
					 ( in1 & { SIZE { sel1 } } ) |
					 ( in2 & { SIZE { sel2 } } ) |
					 ( in3 & { SIZE { sel3 } } ) |
					 ( in4 & { SIZE { sel4 } } ) |
					 ( in5 & { SIZE { sel5 } } ) |
					 ( in6 & { SIZE { sel6 } } ) |
					 ( in7 & { SIZE { sel7 } } ) );

endmodule // mux8s
`endif  // `ifdef FPGA

// There are inverted and non-inverted versions of this...different between power levels!
// First the non-inverting
module tisram_blb ( latout_l, d, l1clk);

   parameter SIZE = 1;


   output	[SIZE-1:0] 	latout_l;

   input        [SIZE-1:0] 	d;
   input         		l1clk;

   reg [SIZE-1:0] latout_l;

   `ifdef SCAN_MODE
   `else
      `ifdef INITLATZERO
        initial latout_l[SIZE-1:0] = {SIZE{1'b0}};
      `endif
   `endif

    always @(l1clk or d) begin
      if (!l1clk) latout_l[SIZE-1:0] <= d[SIZE-1:0];
    end

endmodule 

// Now the inverting
module tisram_blb_inv ( latout_l, d, l1clk);

   parameter SIZE = 1;
 

   output	[SIZE-1:0] 	latout_l;

   input        [SIZE-1:0] 	d;
   input         		l1clk;

   reg [SIZE-1:0] latout_l;

   `ifdef SCAN_MODE
   `else
      `ifdef INITLATZERO
        initial latout_l[SIZE-1:0] = {SIZE{1'b0}};
      `endif
   `endif

    always @(l1clk or d) begin
      if (!l1clk) latout_l[SIZE-1:0] <= ~d[SIZE-1:0];
    end

endmodule 

module tisram_bla (q_a, d_b, l1clk);

    parameter SIZE = 1;

    output   [SIZE-1:0] q_a;
    input    [SIZE-1:0] d_b;
    input         	l1clk;

    reg  [SIZE-1:0] q_a;

   `ifdef SCAN_MODE
   `else
      `ifdef INITLATZERO
        initial q_a[SIZE-1:0] = {SIZE{1'b0}};
      `endif
   `endif

    always @(l1clk or d_b) begin
      if (l1clk==1'b1)    
        q_a[SIZE-1:0] <= d_b[SIZE-1:0];
    end

endmodule 

module msffi ( q_l, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output  	[SIZE-1:0]   	q_l;
   output       [SIZE-1:0]	so;

   input   	[SIZE-1:0]      d;
   input     			l1clk;
   input      	[SIZE-1:0]	si;
   input   			siclk;
   input   			soclk;

   reg		[SIZE-1:0]      q;
   reg		[SIZE-1:0]      q_l;

   wire     	[SIZE-1:0]	so;
   wire      			l1clk, siclk, soclk;
        `ifdef SCAN_MODE

          `ifdef FAST_FLUSH
             always @(posedge l1clk or posedge siclk ) begin
               if (siclk) begin
                 q[SIZE-1:0] <=  {SIZE{1'b0}};  //pseudo flush reset
               end else begin
                 q[SIZE-1:0] <=  d[SIZE-1:0];
               end
             end

          `else

             reg [SIZE-1:0] l1;

             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1[SIZE-1:0] <= d[SIZE-1:0];    // Load master with data
               else if ( l1clk &&  siclk)           l1[SIZE-1:0] <= si[SIZE-1:0];    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1[SIZE-1:0] <= {SIZE{1'bx}};    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q[SIZE-1:0] <= l1[SIZE-1:0];    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q[SIZE-1:0] <= si[SIZE-1:0];    // Flush
              end

	  `endif // FAST_FLUSH

        `else
              wire  [SIZE-1:0] si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused[SIZE-1:0] = si[SIZE-1:0];
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q[SIZE-1:0] = {SIZE{1'b0}};
                initial q_l[SIZE-1:0] = {SIZE{1'b1}};
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q[SIZE-1:0] <=  d[SIZE-1:0];
                else                  q[SIZE-1:0] <= {SIZE{1'bx}};
               end
        `endif

	always @ (q)  q_l=~q;

         assign so[SIZE-1:0] = q[SIZE-1:0];

endmodule // dff

module msffi_dp ( q_l, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output  	[SIZE-1:0]   	q_l;
   output       [SIZE-1:0]	so;

   input   	[SIZE-1:0]      d;
   input     			l1clk;
   input      	[SIZE-1:0]	si;
   input   			siclk;
   input   			soclk;

   reg		[SIZE-1:0]      q;
   reg		[SIZE-1:0]      q_l;

   wire     	[SIZE-1:0]	so;
   wire      			l1clk, siclk, soclk;
        `ifdef SCAN_MODE

          `ifdef FAST_FLUSH
             always @(posedge l1clk or posedge siclk ) begin
               if (siclk) begin
                 q[SIZE-1:0] <=  {SIZE{1'b0}};  //pseudo flush reset
               end else begin
                q[SIZE-1:0] <=  d[SIZE-1:0];
               end
             end

          `else

             reg [SIZE-1:0] l1;

             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1[SIZE-1:0] <= d[SIZE-1:0];    // Load master with data
               else if ( l1clk &&  siclk)           l1[SIZE-1:0] <= si[SIZE-1:0];    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1[SIZE-1:0] <= {SIZE{1'bx}};    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q[SIZE-1:0] <= l1[SIZE-1:0];    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q[SIZE-1:0] <= si[SIZE-1:0];    // Flush
              end

           `endif // FAST_FLUSH

        `else
              wire  [SIZE-1:0] si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused[SIZE-1:0] = si[SIZE-1:0];
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                // dp macro inits to 0!
                initial q[SIZE-1:0] = {SIZE{1'b0}};
                initial q_l[SIZE-1:0] = {SIZE{1'b1}};
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q[SIZE-1:0] <=  d[SIZE-1:0];
                else                  q[SIZE-1:0] <= {SIZE{1'bx}};
               end
        `endif

	always @ (q)  q_l=~q;

         // Fake inversion
         assign so[SIZE-1:0] = q[SIZE-1:0];

endmodule // msffi_dp

module msffiz_dp ( q_l, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output [SIZE-1:0]    q_l;
   output [SIZE-1:0]    so;

   input  [SIZE-1:0]    d;
   input  [SIZE-1:0]    si;
   input   		l1clk;
   input   		siclk;
   input   		soclk;

   reg    [SIZE-1:0]   q_l;

   wire    [SIZE-1:0] so;
   wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

          `ifdef FAST_FLUSH
             always @(posedge l1clk or posedge siclk ) begin
               if (siclk) begin
                 q_l[SIZE-1:0] <=  {SIZE{1'b0}};  //pseudo flush reset
               end else begin
                 q_l[SIZE-1:0] <=  ~d[SIZE-1:0];
               end
             end

          `else

             reg [SIZE-1:0] l1;

             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1[SIZE-1:0] <= ~d[SIZE-1:0];    // Load master with data
               else if ( l1clk &&  siclk)           l1[SIZE-1:0] <= si[SIZE-1:0];    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1[SIZE-1:0] <= {SIZE {1'bx}};   // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q_l[SIZE-1:0] <= l1[SIZE-1:0];  // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q_l[SIZE-1:0] <= si[SIZE-1:0];  // Flush
              end

           `endif // FAST_FLUSH

        `else
              wire  [SIZE-1:0] si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused[SIZE-1:0] = si[SIZE-1:0];
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q_l[SIZE-1:0] = {SIZE {1'b0}};
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q_l[SIZE-1:0] <=  ~d[SIZE-1:0];
                else                  q_l[SIZE-1:0] <= {SIZE {1'bx}};
               end
        `endif

         assign so[SIZE-1:0] = q_l[SIZE-1:0];


endmodule // msffiz_dp

module bs_cell2 (q, so, d, l1clk, si, siclk, soclk, updateclk, mode, muxd, highZ_N);

   parameter SIZE=1;

   output	[SIZE-1:0]	q;
   output       [SIZE-1:0]	so;

   input        [SIZE-1:0]	d, muxd;
   input     			l1clk;
   input      	[SIZE-1:0]	si;
   input   			siclk;
   input   			soclk;

   input   			updateclk, mode, highZ_N;

   reg       	[SIZE-1:0]	q;
   reg       	[SIZE-1:0]	so;

   wire      			l1clk, siclk, soclk, updateclk;


   reg 		[SIZE-1:0]	l1, qm;

   always @(l1clk or siclk or soclk or d or si) begin
     if (!l1clk && !siclk)           l1[SIZE-1:0] <= d[SIZE-1:0];
     if ( l1clk &&  siclk)           l1[SIZE-1:0] <= si[SIZE-1:0];
     if (!l1clk &&  siclk)           l1[SIZE-1:0] <= {SIZE {1'bx}};
     if ( l1clk &&  !soclk)          so[SIZE-1:0] <= l1[SIZE-1:0];
     if ( l1clk &&  siclk && !soclk) so[SIZE-1:0] <= si[SIZE-1:0];    // Flush
   end

   `ifdef INITLATZERO
      initial qm[SIZE-1:0] = {SIZE {1'b0}};
   `endif

   always @(updateclk or l1) begin
     if (updateclk)  qm[SIZE-1:0] <=l1[SIZE-1:0];
   end

   always@(mode or muxd or qm or highZ_N) begin
     if (mode==0)  q[SIZE-1:0] = (qm[SIZE-1:0] && {SIZE {highZ_N}});
     else          q[SIZE-1:0] = muxd[SIZE-1:0];
   end

endmodule

module scm_msff_lat ( latout, q, q_l, so, d, l1clk, si, siclk, soclk);

   parameter SIZE = 1;

   output  [SIZE-1:0]   latout;       
   output  [SIZE-1:0]   so;
   output  [SIZE-1:0]   q;
   output  [SIZE-1:0]   q_l;
   input   [SIZE-1:0]   d;
   input         	l1clk;
   input   [SIZE-1:0]   si;
   input         	siclk;
   input         	soclk;
  

   wire  [SIZE-1:0] so;
   reg [SIZE-1:0] m, s;

   `ifdef SCAN_MODE
     `ifdef FAST_FLUSH
        always @(l1clk or siclk or d ) begin // vcs optimized code

          if (!l1clk && !siclk)        m[SIZE-1:0] <=  d[SIZE-1:0];    // Load master with data
          else if ( l1clk &&  !siclk)  s[SIZE-1:0] <=  m[SIZE-1:0];   // Load slave with master data
          else if (l1clk &&  siclk)   begin   // flush reset
            m[SIZE-1:0] <= {SIZE {1'b0}};
            s[SIZE-1:0] <= {SIZE {1'b0}};
          end
        end
//     `ifdef FAST_FLUSH
//       always @(posedge l1clk or posedge siclk ) begin
//         if (siclk) begin
//           m[SIZE-1:0] <=  {SIZE{1'b0}};  //pseudo flush reset
//           s[SIZE-1:0] <=  {SIZE{1'b0}};  //pseudo flush reset
//         end else begin
//           m[SIZE-1:0] <=  d[SIZE-1:0];
//           s[SIZE-1:0] <=  d[SIZE-1:0];
//         end
//       end

     `else

       always @(l1clk or siclk or soclk or d or si) begin
         if (!l1clk && !siclk)        m[SIZE-1:0] <=  d[SIZE-1:0];    // Load master with data
         else if ( l1clk &&  siclk)   m[SIZE-1:0] <=  si[SIZE-1:0];   // Load master with scan or flush
         else if (!l1clk &&  siclk)   m[SIZE-1:0] <=  {SIZE {1'bx}};   // Conflict between data and scan

         if ( l1clk && !soclk && !siclk)     s[SIZE-1:0] <=  m[SIZE-1:0];   // Load slave with master data
         else if (l1clk && siclk && !soclk)  s[SIZE-1:0] <= si[SIZE-1:0];    // Flush
       end

     `endif // FAST_FLUSH

   `else
      wire [SIZE-1:0] si_unused = si;
      `ifdef INITLATZERO
        initial m[SIZE-1:0] = {SIZE {1'b0}};
        initial s[SIZE-1:0] = {SIZE {1'b0}};
     `endif

      always @(l1clk or d or si or siclk) begin
        if(siclk==0 && l1clk==0) m[SIZE-1:0] =  d[SIZE-1:0];
        else if(siclk && !l1clk) m[SIZE-1:0] = {SIZE {1'bx}};
         if(siclk && l1clk) m[SIZE-1:0] = si[SIZE-1:0];
        if(l1clk && !soclk) s[SIZE-1:0] = m[SIZE-1:0];
      end

    `endif

      assign latout[SIZE-1:0] = m[SIZE-1:0];
      assign so[SIZE-1:0]  =  s[SIZE-1:0];
      assign q[SIZE-1:0]   =  s[SIZE-1:0];
      assign q_l[SIZE-1:0] = ~s[SIZE-1:0];

endmodule // scm_msff_lat

module tisram_msff ( latout, latout_l, so, d, l1clk, si, siclk, soclk );

   parameter SIZE = 1;

   output  [SIZE-1:0]     latout;
   output  [SIZE-1:0]     latout_l;
   output  [SIZE-1:0]     so;

   input   [SIZE-1:0]     d;
   input         	  l1clk;
   input   [SIZE-1:0]     si;
   input       		  siclk;
   input         	  soclk;

   wire [SIZE-1:0] latout, latout_l, so;
   reg [SIZE-1:0] m, s;

   `ifdef SCAN_MODE

      always @(l1clk or siclk or soclk or d or si) begin

        if (!l1clk && !siclk)        m[SIZE-1:0] <=  d[SIZE-1:0];    // Load master with data
        else if ( l1clk &&  siclk)   m[SIZE-1:0] <=  si[SIZE-1:0];    // Load master with scan or flush
        else if (!l1clk &&  siclk)   m[SIZE-1:0] <=  {SIZE {1'bx}};    // Conflict between data and scan

        if ( l1clk && !soclk && !siclk)  s[SIZE-1:0] <=  m[SIZE-1:0];        // Load slave with master data
        else if (l1clk && siclk && !soclk)  s[SIZE-1:0] <= si[SIZE-1:0];    // Flush
      end

   `else
      wire  [SIZE-1:0] si_unused = si;
      wire  soclk_unused = soclk;
	
      `ifdef INITLATZERO
        initial m[SIZE-1:0] = {SIZE {1'b0}};
        initial s[SIZE-1:0] = {SIZE {1'b0}};
      `endif

      always @(l1clk or d or si or siclk) begin
        if(siclk==0 && l1clk==0) m[SIZE-1:0] <=  d[SIZE-1:0];
        if(siclk && !l1clk)      m[SIZE-1:0] <= {SIZE {1'bx}};
        else if(siclk && l1clk)  m[SIZE-1:0] <= si[SIZE-1:0];
      end
    `endif

      assign latout[SIZE-1:0]   =  m[SIZE-1:0];
      assign latout_l[SIZE-1:0] = ~m[SIZE-1:0];
      assign so[SIZE-1:0]       =  s[SIZE-1:0];

endmodule //

module blat ( latout, so, d, l1clk, si, siclk, soclk );

   parameter SIZE = 1;

   output  [SIZE-1:0]     latout;
   output  [SIZE-1:0]     so;

   input   [SIZE-1:0]     d;
   input         	  l1clk;
   input   [SIZE-1:0]     si;
   input       		  siclk;
   input         	  soclk;

   wire [SIZE-1:0] latout, so;
   reg [SIZE-1:0] m, s;

   `ifdef SCAN_MODE
     `ifdef FAST_FLUSH
       always @(posedge l1clk or posedge siclk ) begin
         if (siclk) begin
           m[SIZE-1:0] <=  {SIZE{1'b0}};  //pseudo flush reset
           s[SIZE-1:0] <=  {SIZE{1'b0}};  //pseudo flush reset
         end else begin
           m[SIZE-1:0] <=  d[SIZE-1:0];
           s[SIZE-1:0] <=  d[SIZE-1:0];
         end
       end

     `else

       always @(l1clk or siclk or soclk or d or si) begin

         if (!l1clk && !siclk)        m[SIZE-1:0] <=  d[SIZE-1:0];    // Load master with data
         else if ( l1clk &&  siclk)   m[SIZE-1:0] <=  si[SIZE-1:0];    // Load master with scan or flush
         else if (!l1clk &&  siclk)   m[SIZE-1:0] <=  {SIZE {1'bx}};    // Conflict between data and scan

         if ( l1clk && !soclk && !siclk)  s[SIZE-1:0] <=  m[SIZE-1:0];        // Load slave with master data
         else if (l1clk && siclk && !soclk)  s[SIZE-1:0] <= si[SIZE-1:0];    // Flush
       end

     `endif // FAST_FLUSH

   `else
      wire  [SIZE-1:0] si_unused = si;
      wire  soclk_unused = soclk;
	
      `ifdef INITLATZERO
        initial m[SIZE-1:0] = {SIZE {1'b0}};
        initial s[SIZE-1:0] = {SIZE {1'b0}};
      `endif

      always @(l1clk or d or si or siclk) begin
        if(siclk==0 && l1clk==0) m[SIZE-1:0] <=  d[SIZE-1:0];
        if(siclk && !l1clk)      m[SIZE-1:0] <= {SIZE {1'bx}};
        else if(siclk && l1clk)  m[SIZE-1:0] <= si[SIZE-1:0];
      end
    `endif

      assign latout[SIZE-1:0]   =  m[SIZE-1:0];
      assign so[SIZE-1:0]       =  s[SIZE-1:0];

endmodule //


module dlat ( latout, latout_l, so, d, l1clk, si, siclk, soclk );

   parameter SIZE = 1;


   output       [SIZE-1:0] latout;
   output       [SIZE-1:0] latout_l;
   output       [SIZE-1:0] so;

   input         [SIZE-1:0] d;
   input         l1clk;
   input         [SIZE-1:0] si;
   input         siclk;
   input         soclk;

   wire [SIZE-1:0] latout, latout_l, so;
   reg [SIZE-1:0] m, s;

   `ifdef SCAN_MODE
     `ifdef FAST_FLUSH
       always @(posedge l1clk or posedge siclk ) begin
         if (siclk) begin
           m[SIZE-1:0] <=  {SIZE{1'b1}};  //pseudo flush reset
           s[SIZE-1:0] <=  {SIZE{1'b1}};  //pseudo flush reset
         end else begin
           m[SIZE-1:0] <=  ~d[SIZE-1:0];
           s[SIZE-1:0] <=  ~d[SIZE-1:0];
         end
       end

     `else

       always @(l1clk or siclk or soclk or d or si) begin

         if (!l1clk && !siclk)        m[SIZE-1:0] <=  ~d[SIZE-1:0];    // Load master with data
         else if ( l1clk &&  siclk)   m[SIZE-1:0] <=  ~si[SIZE-1:0];    // Load master with scan or flush
         else if (!l1clk &&  siclk)   m[SIZE-1:0] <=  {SIZE {1'bx}};    // Conflict between data and scan

         if ( l1clk && !soclk && !siclk)     s[SIZE-1:0] <=  m[SIZE-1:0];   // Load slave with master data
         else if (l1clk && !soclk && siclk)  s[SIZE-1:0] <= ~si[SIZE-1:0];  // Flush
       end

     `endif // FAST_FLUSH

      assign so[SIZE-1:0]  =  ~s[SIZE-1:0];

   `else
      wire  [SIZE-1:0] si_unused = si[SIZE-1:0];
      wire soclk_unused = soclk;

      `ifdef INITLATZERO
        initial m[SIZE-1:0] = {SIZE{1'b1}};
        initial s[SIZE-1:0] = {SIZE{1'b1}};
      `endif

      always @(l1clk or d or si or siclk) begin
        if      (!l1clk && !siclk) m[SIZE-1:0] <= ~d[SIZE-1:0];
        else if ( l1clk &&  siclk) m[SIZE-1:0] <= ~si[SIZE-1:0];
        else if (!l1clk &&  siclk) m[SIZE-1:0] <= {SIZE {1'bx}};
      end

      // Don't model slave...since is a don't care for normal sim	
      // below is a hack since we don't really care about s, so use m
      assign so[SIZE-1:0]  =  ~m[SIZE-1:0];
    `endif

      assign latout[SIZE-1:0] = ~m[SIZE-1:0];
      assign latout_l[SIZE-1:0] = m[SIZE-1:0];
               
endmodule 



module dlata ( latout, latout_l, q, q_l, so, d, l1clk, si, siclk, soclk );

   parameter SIZE = 1;

   output      [SIZE-1:0] latout;
   output      [SIZE-1:0] latout_l;
   output      [SIZE-1:0] so;
   output      [SIZE-1:0] q;
   output      [SIZE-1:0] q_l;
   input       [SIZE-1:0]  d;
   input         l1clk;
   input       [SIZE-1:0]  si;
   input         siclk;
   input         soclk;

   wire [SIZE-1:0] so, latout, latout_l;
   reg [SIZE-1:0] m, s;

   `ifdef SCAN_MODE
     `ifdef FAST_FLUSH
       always @(posedge l1clk or posedge siclk ) begin
         if (siclk) begin
           m[SIZE-1:0] <=  {SIZE{1'b1}};  //pseudo flush reset
           s[SIZE-1:0] <=  {SIZE{1'b1}};  //pseudo flush reset
         end else begin
           m[SIZE-1:0] <=  ~d[SIZE-1:0];
           s[SIZE-1:0] <=  ~d[SIZE-1:0];
         end
       end

     `else

       always @(l1clk or siclk or soclk or d or si) begin

         if      (!l1clk && !siclk) m[SIZE-1:0] <=  ~d[SIZE-1:0];   // Load master with data
         else if ( l1clk &&  siclk) m[SIZE-1:0] <=  ~si[SIZE-1:0];  // Load master with scan or flush
         else if (!l1clk &&  siclk) m[SIZE-1:0] <=  {SIZE{1'bx}};   // Conflict between data and scan

         if      (l1clk && !soclk && !siclk)  s[SIZE-1:0] <=  m[SIZE-1:0];  // Load slave with master data
         else if (l1clk && !soclk &&  siclk)  s[SIZE-1:0] <= ~si[SIZE-1:0]; // Flush
       end

     `endif // FAST_FLUSH

   `else
//      wire  [SIZE-1:0] si_unused = si[SIZE-1:0];

      `ifdef INITLATZERO
        initial m[SIZE-1:0] = {SIZE{1'b1}};
        initial s[SIZE-1:0] = {SIZE{1'b1}};
      `endif

      always @(l1clk or d or si or siclk) begin
        if      (!siclk && !l1clk) m[SIZE-1:0] <=  ~d[SIZE-1:0];
        else if ( siclk && !l1clk) m[SIZE-1:0] <= {SIZE {1'bx}};
        else if ( siclk &&  l1clk) m[SIZE-1:0] <= ~si[SIZE-1:0];
        if      ( l1clk && !soclk) s[SIZE-1:0] <= m[SIZE-1:0];
      end

//      always @(l1clk or d or siclk or si) begin
//        if (l1clk == 0) begin
//          if (siclk == 0) begin
//            m[SIZE-1:0] <=  ~d[SIZE-1:0];
//          end
//          else begin
//            m[SIZE-1:0] <= {SIZE{1'bx}};
//          end
//        end
//        else begin // l1clk == 1
//          if (!soclk) s[SIZE-1:0] <= m[SIZE-1:0];
//        end      
//      end

    `endif

      assign latout[SIZE-1:0] = ~m[SIZE-1:0] & {SIZE {l1clk}};
      assign latout_l[SIZE-1:0] = m[SIZE-1:0] & {SIZE {l1clk}};
      assign so[SIZE-1:0]  =  ~s[SIZE-1:0];
      assign q[SIZE-1:0]   =  ~s[SIZE-1:0];
      assign q_l[SIZE-1:0] = s[SIZE-1:0];
               

endmodule 

module new_dlata ( and_clk, mq, mq_l, q, q_l, so, d, l1clk, si, siclk, soclk );

   parameter SIZE = 1;

   output      [SIZE-1:0] mq;
   output      [SIZE-1:0] mq_l;
   output      [SIZE-1:0] so;
   output      [SIZE-1:0] q;
   output      [SIZE-1:0] q_l;
   input       [SIZE-1:0]  d;
   input         l1clk;
   input	and_clk;
   input       [SIZE-1:0]  si;
   input         siclk;
   input         soclk;

   wire [SIZE-1:0] mq, mq_l, q, q_l, so;
   reg [SIZE-1:0] m, s;

   `ifdef SCAN_MODE
     `ifdef FAST_FLUSH
        always @(l1clk or siclk or d ) begin // vcs optimized code

          if      (!l1clk && !siclk) m[SIZE-1:0] <=  d[SIZE-1:0]; // Load master with data
          else if ( l1clk && !siclk) s[SIZE-1:0] <=  m[SIZE-1:0]; // Load slave with master data
          else if ( l1clk &&  siclk) begin                        // flush reset
            m[SIZE-1:0] <= {SIZE{1'b0}};
            s[SIZE-1:0] <= {SIZE{1'b0}};
            end
        end
//     `ifdef FAST_FLUSH
//       always @(posedge l1clk or posedge siclk ) begin
//         if (siclk) begin
//           m[SIZE-1:0] <=  {SIZE{1'b0}};  //pseudo flush reset
//           s[SIZE-1:0] <=  {SIZE{1'b0}};  //pseudo flush reset
//         end else begin
//           m[SIZE-1:0] <=  d[SIZE-1:0];
//           s[SIZE-1:0] <=  d[SIZE-1:0];
//         end
//       end

     `else

        always @(l1clk or siclk or soclk or d or si) begin

          if      (!l1clk && !siclk) m[SIZE-1:0] <=  d[SIZE-1:0];   // Load master with data
          else if ( l1clk &&  siclk) m[SIZE-1:0] <=  si[SIZE-1:0];  // Load master with scan or flush
          else if (!l1clk &&  siclk) m[SIZE-1:0] <=  {SIZE{1'bx}};  // Conflict between data and scan

          if      (l1clk && !soclk && !siclk)  s[SIZE-1:0] <=  m[SIZE-1:0];  // Load slave with master data
          else if (l1clk && !soclk &&  siclk)  s[SIZE-1:0] <=  si[SIZE-1:0]; // Flush
        end

     `endif // FAST_FLUSH

   `else
//      wire  [SIZE-1:0] si_unused = si[SIZE-1:0];

      `ifdef INITLATZERO
        initial m[SIZE-1:0] = {SIZE{1'b0}};
        initial s[SIZE-1:0] = {SIZE{1'b0}};
      `endif

      always @(l1clk or d or si or siclk) begin
        if      (!siclk && !l1clk) m[SIZE-1:0] <= d[SIZE-1:0];
        else if ( siclk && !l1clk) m[SIZE-1:0] <= {SIZE {1'bx}};
        else if ( siclk &&  l1clk) m[SIZE-1:0] <= si[SIZE-1:0];
        if      ( l1clk && !soclk) s[SIZE-1:0] <= m[SIZE-1:0];
      end

    `endif

    `ifdef MODEL_AND
      assign mq[SIZE-1:0] = m[SIZE-1:0] & {SIZE {(and_clk & l1clk)}};
      assign mq_l[SIZE-1:0] = ~m[SIZE-1:0] & {SIZE {(and_clk & l1clk)}};
    `else
      wire	and_clk_unused = and_clk;
      assign mq[SIZE-1:0] = m[SIZE-1:0];
      assign mq_l[SIZE-1:0] = ~m[SIZE-1:0];
    `endif

      assign so[SIZE-1:0]  =  s[SIZE-1:0];
      assign q[SIZE-1:0]   =  s[SIZE-1:0];
      assign q_l[SIZE-1:0] = ~s[SIZE-1:0];
               
endmodule 

module new_dlat ( latout, latout_l, q, q_l, so, d, l1clk, si, siclk, soclk );

   parameter SIZE = 1;

   output      [SIZE-1:0] latout;
   output      [SIZE-1:0] latout_l;
   output      [SIZE-1:0] so;
   output      [SIZE-1:0] q;
   output      [SIZE-1:0] q_l;
   input       [SIZE-1:0]  d;
   input         l1clk;
   input       [SIZE-1:0]  si;
   input         siclk;
   input         soclk;

   wire [SIZE-1:0] mq, mq_l, q, q_l, so;
   reg [SIZE-1:0] m, s;

   `ifdef SCAN_MODE
     `ifdef FAST_FLUSH
       always @(posedge l1clk or posedge siclk ) begin
         if (siclk) begin
           m[SIZE-1:0] <=  {SIZE{1'b0}};  //pseudo flush reset
           s[SIZE-1:0] <=  {SIZE{1'b0}};  //pseudo flush reset
         end else begin
           m[SIZE-1:0] <=  d[SIZE-1:0];
           s[SIZE-1:0] <=  d[SIZE-1:0];
         end
       end

     `else

       always @(l1clk or siclk or soclk or d or si) begin

         if      (!l1clk && !siclk) m[SIZE-1:0] <=  d[SIZE-1:0];   // Load master with data
         else if ( l1clk &&  siclk) m[SIZE-1:0] <=  si[SIZE-1:0];  // Load master with scan or flush
         else if (!l1clk &&  siclk) m[SIZE-1:0] <=  {SIZE{1'bx}};   // Conflict between data and scan

         if      (l1clk && !soclk && !siclk)  s[SIZE-1:0] <=  m[SIZE-1:0];  // Load slave with master data
         else if (l1clk && !soclk &&  siclk)  s[SIZE-1:0] <=  si[SIZE-1:0]; // Flush
       end

     `endif // FAST_FLUSH

   `else
//      wire  [SIZE-1:0] si_unused = si[SIZE-1:0];

      `ifdef INITLATZERO
        initial m[SIZE-1:0] = {SIZE{1'b0}};
        initial s[SIZE-1:0] = {SIZE{1'b0}};
      `endif

      always @(l1clk or d or si or siclk) begin
        if      (!siclk && !l1clk) m[SIZE-1:0] <= d[SIZE-1:0];
        else if ( siclk && !l1clk) m[SIZE-1:0] <= {SIZE {1'bx}};
        else if ( siclk &&  l1clk) m[SIZE-1:0] <= si[SIZE-1:0];
        if      ( l1clk && !soclk) s[SIZE-1:0] <= m[SIZE-1:0];
      end

    `endif

    `ifdef MODEL_AND
      assign latout[SIZE-1:0] = m[SIZE-1:0] & {SIZE {l1clk}};
      assign latout_l[SIZE-1:0] = ~m[SIZE-1:0] & {SIZE {l1clk}};
    `else
      assign latout[SIZE-1:0] = m[SIZE-1:0];
      assign latout_l[SIZE-1:0] = ~m[SIZE-1:0];
    `endif

      assign so[SIZE-1:0]  =  s[SIZE-1:0];
      assign q[SIZE-1:0]   =  s[SIZE-1:0];
      assign q_l[SIZE-1:0] = ~s[SIZE-1:0];
               
endmodule 

module ccx_mac_a (l1clk0,l1clk1,siclk,soclk,grant_x,data_a,data_x_l,qsel0_buf,shift_buf,si,so);

parameter SIZE = 10;

input     l1clk0;
input     l1clk1;
input     siclk;
input     soclk;
input     grant_x;
input [SIZE-1:0] data_a;

input            qsel0_buf;
input            shift_buf;

output [SIZE-1:0] data_x_l;

input             si;
output            so;

wire [SIZE-1:0]   msff1_so,msff1_si,msff0_so,msff0_si;
wire [SIZE-1:0]   q1;
wire [SIZE-1:0]   q0;
wire [SIZE-1:0]   q0_in;


dff #(SIZE) msff1 
  (
   .l1clk(l1clk1),
   .siclk(siclk),
   .soclk(soclk),
   .d(data_a[SIZE-1:0]),
   .si(msff1_si[SIZE-1:0]),
   .so(msff1_so[SIZE-1:0]),
   .q(q1[SIZE-1:0])
   );

assign q0_in[SIZE-1:0] = ({SIZE{qsel0_buf}} & data_a[SIZE-1:0]) |
			             ({SIZE{shift_buf}} & q1[SIZE-1:0]);


dff #(SIZE) msff0 
  (
   .l1clk(l1clk0),
   .siclk(siclk),
   .soclk(soclk),
   .d(q0_in[SIZE-1:0]),
   .si(msff0_si[SIZE-1:0]),
   .so(msff0_so[SIZE-1:0]),
   .q(q0[SIZE-1:0])
   );

assign data_x_l[SIZE-1:0] = ~(q0[SIZE-1:0] & {SIZE{grant_x}});

//assign msff1_si[SIZE-1:0] = {msff0_so[SIZE-2:0],si};
//assign msff0_si[SIZE-1:0] = {msff1_so[SIZE-1:0]};
//assign so = msff0_so[SIZE-1];

//assign msff1_si[SIZE-1:0] = {msff0_so[SIZE-2:0],si};
//assign msff1_si[9:5] = {msff0_so[SIZE-2:5],si};
//assign msff1_si[0] = msff0_so[SIZE-1];
//assign msff1_si[4:1] = msff0_so[3:0];
//assign so = msff0_so[4];

assign msff1_si[SIZE-1:0] = {msff0_so[SIZE-2:5],si,msff0_so[3:0],msff0_so[SIZE-1]};
assign msff0_si[SIZE-1:0] = {msff1_so[SIZE-1:0]};
assign so = msff0_so[4];

endmodule

module ccx_mac_b (l1clk0,l1clk1,siclk,soclk,grant_x,data_a,data_prev_x_l,data_x_l,qsel0_buf,shift_buf,si,so);

parameter SIZE = 10;

input     l1clk0;
input     l1clk1;
input     siclk;
input     soclk;
input     grant_x;
input [SIZE-1:0] data_a;
input [SIZE-1:0] data_prev_x_l;

input            qsel0_buf;
input            shift_buf;

output [SIZE-1:0] data_x_l;

input             si;
output            so;

wire [SIZE-1:0]   msff1_so,msff1_si,msff0_so,msff0_si;
wire [SIZE-1:0]   q1;
wire [SIZE-1:0]   q0;
wire [SIZE-1:0]   q0_in,x4,x5;


dff #(SIZE) msff1 
  (
   .l1clk(l1clk1),
   .siclk(siclk),
   .soclk(soclk),
   .d(data_a[SIZE-1:0]),
   .si(msff1_si[SIZE-1:0]),
   .so(msff1_so[SIZE-1:0]),
   .q(q1[SIZE-1:0])
   );

assign q0_in[SIZE-1:0] = ({SIZE{qsel0_buf}} & data_a[SIZE-1:0]) |
			             ({SIZE{shift_buf}} & q1[SIZE-1:0]);


dff #(SIZE) msff0 
  (
   .l1clk(l1clk0),
   .siclk(siclk),
   .soclk(soclk),
   .d(q0_in[SIZE-1:0]),
   .si(msff0_si[SIZE-1:0]),
   .so(msff0_so[SIZE-1:0]),
   .q(q0[SIZE-1:0])
   );

assign x4[SIZE-1:0] = ~(q0[SIZE-1:0] & {SIZE{grant_x}});
assign x5[SIZE-1:0] = ~(x4[SIZE-1:0] & data_prev_x_l[SIZE-1:0]);
assign data_x_l[SIZE-1:0] = ~x5[SIZE-1:0];

//assign msff1_si[SIZE-1:0] = {msff0_so[SIZE-2:0],si};
//assign msff0_si[SIZE-1:0] = {msff1_so[SIZE-1:0]};
//assign so = msff0_so[SIZE-1];

assign msff1_si[SIZE-1:0] = {msff0_so[SIZE-2:5],si,msff0_so[3:0],msff0_so[SIZE-1]};
assign msff0_si[SIZE-1:0] = {msff1_so[SIZE-1:0]};
assign so = msff0_so[4];

endmodule

module ccx_mac_c (l1clk0,l1clk1,siclk,soclk,grant_x,data_a,data_crit_x_l,data_ncrit_x_l,data_x_l,qsel0_buf,shift_buf,si,so);

parameter SIZE = 10;

input     l1clk0;
input     l1clk1;
input     siclk;
input     soclk;
input     grant_x;
input [SIZE-1:0] data_a;
input [SIZE-1:0] data_crit_x_l;
input [SIZE-1:0] data_ncrit_x_l;

input            qsel0_buf;
input            shift_buf;

output [SIZE-1:0] data_x_l;

input             si;
output            so;

wire [SIZE-1:0]   msff1_so,msff1_si,msff0_so,msff0_si;
wire [SIZE-1:0]   q1;
wire [SIZE-1:0]   q0;
wire [SIZE-1:0]   q0_in,x4,x5;


dff #(SIZE) msff1 
  (
   .l1clk(l1clk1),
   .siclk(siclk),
   .soclk(soclk),
   .d(data_a[SIZE-1:0]),
   .si(msff1_si[SIZE-1:0]),
   .so(msff1_so[SIZE-1:0]),
   .q(q1[SIZE-1:0])
   );

assign q0_in[SIZE-1:0] = ({SIZE{qsel0_buf}} & data_a[SIZE-1:0]) |
			             ({SIZE{shift_buf}} & q1[SIZE-1:0]);


dff #(SIZE) msff0 
  (
   .l1clk(l1clk0),
   .siclk(siclk),
   .soclk(soclk),
   .d(q0_in[SIZE-1:0]),
   .si(msff0_si[SIZE-1:0]),
   .so(msff0_so[SIZE-1:0]),
   .q(q0[SIZE-1:0])
   );

assign x4[SIZE-1:0] = ~(q0[SIZE-1:0] & {SIZE{grant_x}});
assign x5[SIZE-1:0] = ~(x4[SIZE-1:0] & data_crit_x_l[SIZE-1:0] & data_ncrit_x_l[SIZE-1:0]);
assign data_x_l[SIZE-1:0] = ~x5[SIZE-1:0];

//assign msff1_si[SIZE-1:0] = {msff0_so[SIZE-2:0],si};
//assign msff0_si[SIZE-1:0] = {msff1_so[SIZE-1:0]};
//assign so = msff0_so[SIZE-1];

assign msff1_si[SIZE-1:0] = {msff0_so[SIZE-2:5],si,msff0_so[3:0],msff0_so[SIZE-1]};
assign msff0_si[SIZE-1:0] = {msff1_so[SIZE-1:0]};
assign so = msff0_so[4];

endmodule

// new FAST_FLUSH
// new dff from RM with init to zero in scan section

`ifdef FPGA
`else
module dff ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE
// 4-25-2005 added initlatzero to scan_mode


   parameter SIZE = 1;

   output    [SIZE-1:0]    q;
   output    [SIZE-1:0]    so;

   input     [SIZE-1:0]    d;
   input                   l1clk;
   input     [SIZE-1:0]    si;
   input                   siclk;
   input                   soclk;

             reg       [SIZE-1:0] q;
             wire      [SIZE-1:0] so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg       [SIZE-1:0] l1;

            `ifdef INITLATZERO
              initial l1[SIZE-1:0] = {SIZE{1'b0}};
              initial  q[SIZE-1:0] = {SIZE{1'b0}};
            `endif

             `ifdef FAST_FLUSH
                always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q[SIZE-1:0] <=  {SIZE{1'b0}};  //pseudo flush reset
                  end else begin
                    q[SIZE-1:0] <=  d[SIZE-1:0];
                  end
                end
             `else
              always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1[SIZE-1:0] <=   d[SIZE-1:0];    // Load master with data
               else if ( l1clk &&  siclk)           l1[SIZE-1:0] <=  si[SIZE-1:0];    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1[SIZE-1:0] <=  {SIZE{1'bx}};    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q[SIZE-1:0] <=  l1[SIZE-1:0];    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q[SIZE-1:0] <=  si[SIZE-1:0];    // Flush
              end
              `endif

        `else
              wire [SIZE-1:0] si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused[SIZE-1:0] = si[SIZE-1:0];
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


              `ifdef INITLATZERO
                initial q[SIZE-1:0] = {SIZE{1'b0}};
              `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q[SIZE-1:0] <=  d[SIZE-1:0];
                else                  q[SIZE-1:0] <= {SIZE{1'bx}};
               end
        `endif
              
         assign so[SIZE-1:0] = q[SIZE-1:0];

endmodule // dff
`endif // `ifdef FPGA



module dff_jtag ( q, so, d, l1clk, si, siclk, soclk, reset, updateclk );

   // modified 2/15/05 gfg as per Shawn

   parameter SIZE = 1;
 
   output [SIZE-1:0]    q;
   output  [SIZE-1:0]      so;

   input  [SIZE-1:0]       d;
   input     l1clk;
   input [SIZE-1:0]     si;
   input   siclk;
   input   soclk;
   input   reset;
   input   updateclk;

   reg  [SIZE-1:0]     q;
   reg  [SIZE-1:0]     so;
   reg  [SIZE-1:0]   l1;
   wire      l1clk, siclk, soclk, updateclk;

   always @(l1clk or siclk or soclk or d or si or reset)
     begin
       if (!l1clk && !siclk)                     l1[SIZE-1:0] <= d[SIZE-1:0];
       else if ( l1clk &&  siclk)                l1[SIZE-1:0] <= si[SIZE-1:0];
       else if (!l1clk &&  siclk)                l1[SIZE-1:0] <= {SIZE{1'bx}};
       if ( reset )                              so[SIZE-1:0] <= {SIZE{1'b0}};
       if ( l1clk && !siclk && !soclk && !reset) so[SIZE-1:0] <= l1[SIZE-1:0];
       if ( l1clk &&  siclk && !soclk && !reset) so[SIZE-1:0] <= si[SIZE-1:0];
     end

   `ifdef INITLATZERO
      initial q[SIZE-1:0]  = {SIZE{1'b0}};
   `endif

   always@(updateclk or reset or l1)
     begin
       if(reset) q[SIZE-1:0]  <= {SIZE{1'b0}};
       else if(updateclk)  q[SIZE-1:0] <= l1[SIZE-1:0];
     end

endmodule // dff_jtag


// parameterized sim sections for the common sunv macros besides muxes and flops

module and2 (out, in0, in1);
   parameter	     SIZE=1;


   output [SIZE-1:0] out;
   input [SIZE-1:0]  in0;
   input [SIZE-1:0]  in1;


   assign out[SIZE-1:0] = in0[SIZE-1:0] & in1[SIZE-1:0];

endmodule

`ifdef FPGA
`else
module and3 (out, in0, in1, in2);
   parameter	     SIZE=1;


   output [SIZE-1:0] out;
   input [SIZE-1:0]  in0;
   input [SIZE-1:0]  in1;
   input [SIZE-1:0]  in2;


   assign out[SIZE-1:0] = in0[SIZE-1:0] & in1[SIZE-1:0] & in2[SIZE-1:0];

endmodule

module and4 (out, in0, in1, in2, in3);
   parameter	     SIZE=1;


   output [SIZE-1:0] out;
   input [SIZE-1:0]  in0;
   input [SIZE-1:0]  in1;
   input [SIZE-1:0]  in2;
   input [SIZE-1:0]  in3;


   assign out[SIZE-1:0] = in0[SIZE-1:0] & in1[SIZE-1:0] & in2[SIZE-1:0] & in3[SIZE-1:0];

endmodule

module nand2 (out, in0, in1);
   parameter	     SIZE=1;


   output [SIZE-1:0] out;
   input [SIZE-1:0]  in0;
   input [SIZE-1:0]  in1;


   assign out[SIZE-1:0] = ~(in0[SIZE-1:0] & in1[SIZE-1:0]);

endmodule

module nand3 (out, in0, in1, in2);
   parameter	     SIZE=1;


   output [SIZE-1:0] out;
   input [SIZE-1:0]  in0;
   input [SIZE-1:0]  in1;
   input [SIZE-1:0]  in2;


   assign out[SIZE-1:0] = ~(in0[SIZE-1:0] & in1[SIZE-1:0] & in2[SIZE-1:0]);

endmodule

`endif // `ifdef FPGA

module nand4 (out, in0, in1, in2, in3);
   parameter	     SIZE=1;


   output [SIZE-1:0] out;
   input [SIZE-1:0]  in0;
   input [SIZE-1:0]  in1;
   input [SIZE-1:0]  in2;
   input [SIZE-1:0]  in3;


   assign out[SIZE-1:0] = ~(in0[SIZE-1:0] & in1[SIZE-1:0] & in2[SIZE-1:0] & in3[SIZE-1:0]);

endmodule

module or2 (out, in0, in1);
   parameter	     SIZE=1;


   output [SIZE-1:0] out;
   input [SIZE-1:0]  in0;
   input [SIZE-1:0]  in1;


   assign out[SIZE-1:0] = in0[SIZE-1:0] | in1[SIZE-1:0];

endmodule

module or3 (out, in0, in1, in2);
   parameter	     SIZE=1;


   output [SIZE-1:0] out;
   input [SIZE-1:0]  in0;
   input [SIZE-1:0]  in1;
   input [SIZE-1:0]  in2;


   assign out[SIZE-1:0] = in0[SIZE-1:0] | in1[SIZE-1:0] | in2[SIZE-1:0];

endmodule

`ifdef FPGA
`else
module nor2 (out, in0, in1);
   parameter	     SIZE=1;


   output [SIZE-1:0] out;
   input [SIZE-1:0]  in0;
   input [SIZE-1:0]  in1;


   assign out[SIZE-1:0] = ~(in0[SIZE-1:0] | in1[SIZE-1:0]);

endmodule

module nor3 (out, in0, in1, in2);
   parameter	     SIZE=1;


   output [SIZE-1:0] out;
   input [SIZE-1:0]  in0;
   input [SIZE-1:0]  in1;
   input [SIZE-1:0]  in2;


   assign out[SIZE-1:0] = ~(in0[SIZE-1:0] | in1[SIZE-1:0] | in2[SIZE-1:0]);

endmodule

`endif // `ifdef FPGA

module xor2 ( out, in0, in1 );

   parameter SIZE = 1;

   input     [SIZE-1:0] in0, in1;
   output    [SIZE-1:0] out;

   assign out = in0 ^ in1 ;

endmodule // xor2
				

module xor3 (out, in0, in1, in2);
   parameter	     SIZE=1;


   output [SIZE-1:0] out;
   input [SIZE-1:0]  in0;
   input [SIZE-1:0]  in1;
   input [SIZE-1:0]  in2;


   assign out[SIZE-1:0] = in0[SIZE-1:0] ^ in1[SIZE-1:0] ^ in2[SIZE-1:0];

endmodule

module xnor2 ( out, in0, in1 );

   parameter SIZE = 1;

   input     [SIZE-1:0] in0, in1;
   output    [SIZE-1:0] out;

   assign out = ~(in0 ^ in1) ;

endmodule // xnor2

module xnor3 (out, in0, in1, in2);
   parameter	     SIZE=1;


   output [SIZE-1:0] out;
   input [SIZE-1:0]  in0;
   input [SIZE-1:0]  in1;
   input [SIZE-1:0]  in2;


   assign out[SIZE-1:0] = ~(in0[SIZE-1:0] ^ in1[SIZE-1:0] ^ in2[SIZE-1:0]);

endmodule

`ifdef FPGA
`else

module buff (out, in);
   parameter	     SIZE=1;


   output [SIZE-1:0] out;
   input [SIZE-1:0]  in;

   assign out[SIZE-1:0] = in[SIZE-1:0];
   

endmodule

module inv (out, in);
   parameter	     SIZE=1;


   output [SIZE-1:0] out;
   input [SIZE-1:0]  in;

   assign out[SIZE-1:0] = ~in[SIZE-1:0];
endmodule

`endif // `ifdef FPGA




module cla(out, cout, in0, in1, cin);
   parameter	     SIZE=1;

   output [SIZE-1:0] out;
   output	     cout;
   input [SIZE-1:0]  in0;
   input [SIZE-1:0]  in1;
   input	     cin;
   

   assign {cout,out[SIZE-1:0]} = ({1'b0,in0[SIZE-1:0]} + {1'b0,in1[SIZE-1:0]} + {{SIZE{1'b0}},cin});
   
endmodule

module incr(out, cout, in, cin);
   parameter	     SIZE=1;

   output [SIZE-1:0] out;
   output	     cout;
   input [SIZE-1:0]  in;
   input	     cin;

   assign {cout,out[SIZE-1:0]} = ({1'b0,in[SIZE-1:0]} + {{SIZE{1'b0}},cin});
   
endmodule

module cmp(out, in0, in1);
   parameter	    SIZE=1;
   
   output	    out;
   input [SIZE-1:0] in0;
   input [SIZE-1:0] in1;
   
   assign out = (in0[SIZE-1:0] == in1[SIZE-1:0]);

endmodule

module zero(out, in);
   parameter	    SIZE=1;
   
   output	    out;
   input [SIZE-1:0] in;
   
   assign out = (in[SIZE-1:0] == {SIZE{1'b0}});

endmodule


module prty(out, in);
   parameter	    SIZE=1;
   
   output	    out;
   input [SIZE-1:0] in;
   
   assign out = ^in[SIZE-1:0];

endmodule 


module csa32(sum, carry, in0, in1, in2);
   parameter		   SIZE=1;
   
   input [SIZE-1:0]	   in0;
   input [SIZE-1:0]	   in1;
   input [SIZE-1:0]	   in2;
   output [SIZE-1:0]	   carry;
   output [SIZE-1:0]	   sum;
   
   assign carry[SIZE-1:0]  = ((in0[SIZE-1:0]  & in1[SIZE-1:0] ) | 
			      (in0[SIZE-1:0]  & in2[SIZE-1:0] ) | 
			      (in1[SIZE-1:0] & in2[SIZE-1:0]));
   
   assign sum[SIZE-1:0]  = (in0[SIZE-1:0] ^ in1[SIZE-1:0] ^ in2[SIZE-1:0]);
   
   
endmodule


module csa42(sum, carry, cout, cin, in0, in1, in2, in3);
   parameter	     SIZE=1;
   
   input [SIZE-1:0]  in0; 
   input [SIZE-1:0]  in1; 
   input [SIZE-1:0]  in2; 
   input [SIZE-1:0]  in3;
   input	     cin;
   output	     cout; 
   output [SIZE-1:0] carry; 
   output [SIZE-1:0] sum; 
   
   
   wire [SIZE-1:0]   i0_xor_i1 = (in0[SIZE-1:0] ^ in1[SIZE-1:0]);
   
   wire [SIZE-1:0]   co        = ((in0[SIZE-1:0] & in1[SIZE-1:0]) |
				  (in0[SIZE-1:0] & in2[SIZE-1:0]) |
				  (in1[SIZE-1:0] & in2[SIZE-1:0]));
   
   assign cout              = co[SIZE-1];

   wire [SIZE:0] cint      = { co[SIZE-1:0], cin };

   wire cint_unused;

   assign cint_unused = cint[SIZE];


   assign carry[SIZE-1:0]     = ((~i0_xor_i1[SIZE-1:0] & ~in2[SIZE-1:0] &  in3[SIZE-1:0] &  cint[SIZE-1:0]) |
				 (~i0_xor_i1[SIZE-1:0] &  in2[SIZE-1:0] & ~in3[SIZE-1:0] &  cint[SIZE-1:0]) |
				 (~i0_xor_i1[SIZE-1:0] &  in2[SIZE-1:0] &  in3[SIZE-1:0]                ) |
				 ( i0_xor_i1[SIZE-1:0] & ~in2[SIZE-1:0] & ~in3[SIZE-1:0] &  cint[SIZE-1:0]) |
				 ( i0_xor_i1[SIZE-1:0] & ~in2[SIZE-1:0] &  in3[SIZE-1:0]                ) |
				 ( i0_xor_i1[SIZE-1:0] &  in2[SIZE-1:0] &  in3[SIZE-1:0] &  cint[SIZE-1:0]));
   
   
   assign sum[SIZE-1:0]       = ((~i0_xor_i1[SIZE-1:0] & ~in2[SIZE-1:0] & ~in3[SIZE-1:0] &  cint[SIZE-1:0]) |
				 (~i0_xor_i1[SIZE-1:0] & ~in2[SIZE-1:0] &  in3[SIZE-1:0] & ~cint[SIZE-1:0]) |
				 (~i0_xor_i1[SIZE-1:0] &  in2[SIZE-1:0] & ~in3[SIZE-1:0] & ~cint[SIZE-1:0]) |
				 (~i0_xor_i1[SIZE-1:0] &  in2[SIZE-1:0] &  in3[SIZE-1:0] &  cint[SIZE-1:0]) |
				 ( i0_xor_i1[SIZE-1:0] & ~in2[SIZE-1:0] & ~in3[SIZE-1:0] & ~cint[SIZE-1:0]) |
				 ( i0_xor_i1[SIZE-1:0] & ~in2[SIZE-1:0] &  in3[SIZE-1:0] &  cint[SIZE-1:0]) |
				 ( i0_xor_i1[SIZE-1:0] &  in2[SIZE-1:0] & ~in3[SIZE-1:0] &  cint[SIZE-1:0]) |
				 ( i0_xor_i1[SIZE-1:0] &  in2[SIZE-1:0] &  in3[SIZE-1:0] & ~cint[SIZE-1:0]));

endmodule // csa42

module andmux8(out, in7,in6,in5,in4,in3,in2,in1,in0,
	            en7,en6,en5,en4,en3,en2,en1,en0,
	            sel7,sel6,sel5,sel4,sel3,sel2,sel1,sel0);

   parameter	    SIZE=1;
   
   output [SIZE-1:0] out;
   input [SIZE-1:0] in7;
   input [SIZE-1:0] in6;
   input [SIZE-1:0] in5;
   input [SIZE-1:0] in4;
   input [SIZE-1:0] in3;
   input [SIZE-1:0] in2;
   input [SIZE-1:0] in1;
   input [SIZE-1:0] in0;
   input [SIZE-1:0] en7;
   input [SIZE-1:0] en6;
   input [SIZE-1:0] en5;
   input [SIZE-1:0] en4;
   input [SIZE-1:0] en3;
   input [SIZE-1:0] en2;
   input [SIZE-1:0] en1;
   input [SIZE-1:0] en0;
   input sel7;
   input sel6;
   input sel5;
   input sel4;
   input sel3;
   input sel2;
   input sel1;
   input sel0;

assign out =        ({SIZE{sel0}} & in0 & en0) |
                    ({SIZE{sel1}} & in1 & en1) |
                    ({SIZE{sel2}} & in2 & en2) |
                    ({SIZE{sel3}} & in3 & en3) |
                    ({SIZE{sel4}} & in4 & en4) |
                    ({SIZE{sel5}} & in5 & en5) |
                    ({SIZE{sel6}} & in6 & en6) |
                    ({SIZE{sel7}} & in7 & en7);

endmodule 

