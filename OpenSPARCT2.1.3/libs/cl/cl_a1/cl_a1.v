// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: cl_a1.v
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
module cl_a1_msffmin_fp_16x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
 `ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff




module cl_a1_msffmin_fp_8x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE
 `ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             reg 	l1;

             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msffmin_fp_4x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
 `ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msffmin_fp_32x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
 `ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msffmin_fp_1x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
 `ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msffmin_fp_30ps_16x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
        `ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else

             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff




module cl_a1_msffmin_fp_30ps_8x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
 	`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msffmin_fp_30ps_4x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
 	`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msffmin_fp_30ps_32x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
 	`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msffmin_fp_30ps_1x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
 `ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff

module cl_a1_msffmin_fp_syrst_1x ( q, so, d, l1clk, si, siclk, soclk,reset );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;
   input   reset;
             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
`ifdef FAST_FLUSH
              always @(l1clk or siclk or  d )    // vcs optimized code 
               begin
                     if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
                else if ( l1clk && !siclk)           q  <= l1;    // Load slave with master data
                else if ( l1clk &&  siclk)           begin       // Conflict between data and scan
                  l1 <= 1'b0;
                  q <=  1'b0;
                end
               end
          `else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  (d&reset);
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msffmin_fp_syrst_4x ( q, so, d, l1clk, si, siclk, soclk,reset );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;
   input   reset;
             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
`ifdef FAST_FLUSH
              always @(l1clk or siclk or  d )    // vcs optimized code 
               begin
                     if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
                else if ( l1clk && !siclk)           q  <= l1;    // Load slave with master data
                else if ( l1clk &&  siclk)           begin       // Conflict between data and scan
                  l1 <= 1'b0;
                  q <=  1'b0;
                end
               end
          `else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  (d&reset);
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msffmin_fp_syrst_8x ( q, so, d, l1clk, si, siclk, soclk,reset );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;
   input   reset;
             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
`ifdef FAST_FLUSH
              always @(l1clk or siclk or  d )    // vcs optimized code 
               begin
                     if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
                else if ( l1clk && !siclk)           q  <= l1;    // Load slave with master data
                else if ( l1clk &&  siclk)           begin       // Conflict between data and scan
                  l1 <= 1'b0;
                  q <=  1'b0;
                end
               end
          `else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  (d&reset);
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msffmin_fp_syrst_16x ( q, so, d, l1clk, si, siclk, soclk,reset );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;
   input   reset;
             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
`ifdef FAST_FLUSH
              always @(l1clk or siclk or  d )    // vcs optimized code 
               begin
                     if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
                else if ( l1clk && !siclk)           q  <= l1;    // Load slave with master data
                else if ( l1clk &&  siclk)           begin       // Conflict between data and scan
                  l1 <= 1'b0;
                  q <=  1'b0;
                end
               end
          `else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  (d&reset);
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msffmin_fp_syrst_32x ( q, so, d, l1clk, si, siclk, soclk,reset );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;
   input   reset;
             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
`ifdef FAST_FLUSH
              always @(l1clk or siclk or  d )    // vcs optimized code 
               begin
                     if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
                else if ( l1clk && !siclk)           q  <= l1;    // Load slave with master data
                else if ( l1clk &&  siclk)           begin       // Conflict between data and scan
                  l1 <= 1'b0;
                  q <=  1'b0;
                end
               end
          `else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  (d&reset);
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msffmin_30ps_16x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
        `ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else

             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff




module cl_a1_msffmin_30ps_8x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
 	`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msffmin_30ps_4x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
 	`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msffmin_30ps_32x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
 	`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msffmin_30ps_1x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
 `ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
 module cl_a1_clken_msffmin_4x ( q, so, d, l1clk, si, siclk, soclk, clken);
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE
// created by xl on 3/18



    output     q;
    output       so;

    input         d;
    input     l1clk;
    input      si;
    input   siclk;
    input   soclk;
    input   clken;
              reg       q;
              wire     so;
              wire      l1clk, siclk, soclk;

         `ifdef SCAN_MODE

              reg l1;

              always @(l1clk or siclk or soclk or d or si)
               begin
                     if (!l1clk && !siclk)           l1 <= (d & clken ) | (q & !clken);    // Load master with data
                else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
                else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

                else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                     if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
               end


         `else
               wire  si_unused;
               wire siclk_unused;
               wire soclk_unused;
               assign si_unused = si;
               assign siclk_unused        = siclk;
               assign soclk_unused        = soclk;


           `ifdef INITLATZERO

                 initial q = 1'b0;
           `endif

               always @(posedge l1clk)
                begin
                 if (!siclk && !soclk) q <=  (d & clken ) | (q & !clken);
                 else                  q <= 1'bx;
                end
         `endif

          assign so = q;

endmodule
module cl_a1_msffmin_syrst_1x ( q, so, d, l1clk, si, siclk, soclk,reset );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;
   input   reset;
             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
`ifdef FAST_FLUSH
              always @(l1clk or siclk or  d )    // vcs optimized code 
               begin
                     if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
                else if ( l1clk && !siclk)           q  <= l1;    // Load slave with master data
                else if ( l1clk &&  siclk)           begin       // Conflict between data and scan
                  l1 <= 1'b0;
                  q <=  1'b0;
                end
               end
          `else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  (d&reset);
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msffmin_syrst_4x ( q, so, d, l1clk, si, siclk, soclk,reset );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;
   input   reset;
             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
`ifdef FAST_FLUSH
              always @(l1clk or siclk or  d )    // vcs optimized code 
               begin
                     if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
                else if ( l1clk && !siclk)           q  <= l1;    // Load slave with master data
                else if ( l1clk &&  siclk)           begin       // Conflict between data and scan
                  l1 <= 1'b0;
                  q <=  1'b0;
                end
               end
          `else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  (d&reset);
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msffmin_syrst_8x ( q, so, d, l1clk, si, siclk, soclk,reset );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;
   input   reset;
             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
`ifdef FAST_FLUSH
              always @(l1clk or siclk or  d )    // vcs optimized code 
               begin
                     if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
                else if ( l1clk && !siclk)           q  <= l1;    // Load slave with master data
                else if ( l1clk &&  siclk)           begin       // Conflict between data and scan
                  l1 <= 1'b0;
                  q <=  1'b0;
                end
               end
          `else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  (d&reset);
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msffmin_syrst_16x ( q, so, d, l1clk, si, siclk, soclk,reset );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;
   input   reset;
             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
`ifdef FAST_FLUSH
              always @(l1clk or siclk or  d )    // vcs optimized code 
               begin
                     if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
                else if ( l1clk && !siclk)           q  <= l1;    // Load slave with master data
                else if ( l1clk &&  siclk)           begin       // Conflict between data and scan
                  l1 <= 1'b0;
                  q <=  1'b0;
                end
               end
          `else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  (d&reset);
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msffmin_syrst_32x ( q, so, d, l1clk, si, siclk, soclk,reset );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;
   input   reset;
             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
`ifdef FAST_FLUSH
              always @(l1clk or siclk or  d )    // vcs optimized code 
               begin
                     if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
                else if ( l1clk && !siclk)           q  <= l1;    // Load slave with master data
                else if ( l1clk &&  siclk)           begin       // Conflict between data and scan
                  l1 <= 1'b0;
                  q <=  1'b0;
                end
               end
          `else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  (d&reset);
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_bsac_cell_4x(q, so, d, l1clk, si, siclk, soclk, updateclk,
                           ac_mode, ac_test_signal);
   output     q;
   output       so;

   input         d, ac_test_signal;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;
   input   updateclk, ac_mode;

             reg       q;
             reg       so;
             wire      l1clk, siclk, soclk, updateclk;


             reg l1, qm;

             always @(l1clk or siclk or soclk or d or si)
              begin
    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
    if ( l1clk &&  siclk)           l1 <= si;    // Load master with
                                                 // scan or flush
    if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between
                                                   // data and scan
    if ( l1clk &&  !soclk)          so <= l1;     // Load slave with
                                                  // master data
    if ( l1clk &&  siclk && !soclk) so <= si;    // Flush
              end

                initial qm = 1'b0;

           always@(updateclk or l1)
                begin
                if(updateclk)  qm <=l1;
                end
always@(ac_mode or qm or ac_test_signal)
        begin
        if(ac_mode==0)  q=qm;
        else         q=qm ^ ac_test_signal;
        end
endmodule
module cl_a1_blatch_4x ( latout, so, d, l1clk, si, siclk, soclk);

   output       latout;
   output       so;
   input         d;
   input         l1clk;
   input         si;
   input         siclk;
   input         soclk;
 

   wire  so;
   reg s, m;

   `ifdef SCAN_MODE
 `ifdef FAST_FLUSH
       always @(posedge l1clk or posedge siclk ) begin
         if (siclk) begin
           m <=  1'b0;  //pseudo flush reset
           s <=  1'b0;  //pseudo flush reset
         end else begin
           m <=  d;
           s <=  d;
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
  `endif // FAST_FLUSH
   `else
      wire  si_unused = si;
`ifdef INITLATZERO


      initial m = 1'b0;
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


endmodule 





 module cl_a1_alatch_4x ( q, so, d, l1clk, si, siclk, soclk, se );





   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;
   input   se;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	


             reg l1;

             always @(l1clk or siclk or soclk or d or si or se)
              begin

                    if (siclk)           l1 <= si;    // Load master with scan or flush

		if(se && !soclk && l1clk && siclk) q <= si;
                else    if ( se && !soclk && l1clk)  q <= l1;    
                    else if ( !soclk && l1clk)  q <= d;
              end




          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif



         assign so = q;

endmodule // dff
 module cl_a1_clken_msff_4x ( q, so, d, l1clk, si, siclk, soclk, clken);
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE
// created by xl on 3/18



    output     q;
    output       so;

    input         d;
    input     l1clk;
    input      si;
    input   siclk;
    input   soclk;
    input   clken;
              reg       q;
              wire     so;
              wire      l1clk, siclk, soclk;

         `ifdef SCAN_MODE

              reg l1;
`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <= (d & clken ) | (q & !clken);
                  end
                end     
	`else
              always @(l1clk or siclk or soclk or d or si)
               begin
                     if (!l1clk && !siclk)           l1 <= (d & clken ) | (q & !clken);    // Load master with data
                else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
                else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

                else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                     if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
               end

	 `endif
         `else
               wire  si_unused;
               wire siclk_unused;
               wire soclk_unused;
               assign si_unused = si;
               assign siclk_unused        = siclk;
               assign soclk_unused        = soclk;


           `ifdef INITLATZERO

                 initial q = 1'b0;
           `endif

               always @(posedge l1clk)
                begin
                 if (!siclk && !soclk) q <=  (d & clken ) | (q & !clken);
                 else                  q <= 1'bx;
                end
         `endif

          assign so = q;

endmodule

 module cl_a1_msff_arst_4x ( q, so, d, l1clk, si, siclk, soclk, reset );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;
   input   reset;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;

             always @(l1clk or siclk or soclk or d or si or reset)
               begin
                if (reset ) 			l1 <= 1'b0;
                else if (!l1clk && !siclk)      l1 <= d;
                else if ( l1clk &&  siclk)      l1 <= si;
                else if (!l1clk &&  siclk)      l1 <= 1'bx;

                if  (reset)                           q <= 1'b0;
                else if ( l1clk && !siclk && !soclk)  q <= l1;
                else if ( l1clk &&  siclk && !soclk)  q <= si;

               end

   
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk or posedge reset)
               begin
                
                if ( reset) q <= 1'b0;
                else if (!siclk && !soclk ) q <=  d;
                else             q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff



module cl_a1_aomux2_12x (
in0,
in1,
sel0,
sel1,
out
);
input 	in0;
input 	in1;
input 	sel0;
input 	sel1;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1));
`endif


endmodule
module cl_a1_aomux2_16x (
in0,
in1,
sel0,
sel1,
out
);
input 	in0;
input 	in1;
input 	sel0;
input 	sel1;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1));
`endif


endmodule
module cl_a1_aomux2_1x (
in0,
in1,
sel0,
sel1,
out
);
input 	in0;
input 	in1;
input 	sel0;
input 	sel1;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1));
`endif


endmodule
module cl_a1_aomux2_2x (
in0,
in1,
sel0,
sel1,
out
);
input 	in0;
input 	in1;
input 	sel0;
input 	sel1;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1));
`endif


endmodule
module cl_a1_aomux2_4x (
in0,
in1,
sel0,
sel1,
out
);
input 	in0;
input 	in1;
input 	sel0;
input 	sel1;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1));
`endif


endmodule
module cl_a1_aomux2_6x (
in0,
in1,
sel0,
sel1,
out
);
input 	in0;
input 	in1;
input 	sel0;
input 	sel1;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1));
`endif


endmodule
module cl_a1_aomux2_8x (
in0,
in1,
sel0,
sel1,
out
);
input 	in0;
input 	in1;
input 	sel0;
input 	sel1;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1));
`endif


endmodule
module cl_a1_aomux3_12x (
in0,
in1,
in2,
sel0,
sel1,
sel2,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	sel0;
input 	sel1;
input 	sel2;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2));
`endif

endmodule
module cl_a1_aomux3_16x (
in0,
in1,
in2,
sel0,
sel1,
sel2,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	sel0;
input 	sel1;
input 	sel2;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2));
`endif

endmodule
module cl_a1_aomux3_1x (
in0,
in1,
in2,
sel0,
sel1,
sel2,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	sel0;
input 	sel1;
input 	sel2;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2));
`endif

endmodule
module cl_a1_aomux3_2x (
in0,
in1,
in2,
sel0,
sel1,
sel2,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	sel0;
input 	sel1;
input 	sel2;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2));
`endif

endmodule
module cl_a1_aomux3_4x (
in0,
in1,
in2,
sel0,
sel1,
sel2,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	sel0;
input 	sel1;
input 	sel2;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2));
`endif

endmodule
module cl_a1_aomux3_6x (
in0,
in1,
in2,
sel0,
sel1,
sel2,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	sel0;
input 	sel1;
input 	sel2;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2));
`endif

endmodule
module cl_a1_aomux3_8x (
in0,
in1,
in2,
sel0,
sel1,
sel2,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	sel0;
input 	sel1;
input 	sel2;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2));
`endif

endmodule
module cl_a1_aomux4_12x (
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3));
`endif

endmodule
module cl_a1_aomux4_16x (
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3));
`endif

endmodule
module cl_a1_aomux4_1x (
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3));
`endif

endmodule
module cl_a1_aomux4_2x (
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3));
`endif

endmodule
module cl_a1_aomux4_4x (
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3));
`endif

endmodule
module cl_a1_aomux4_6x (
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3));
`endif

endmodule
module cl_a1_aomux4_8x (
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3));
`endif

endmodule
module cl_a1_aomux4_niu_8x (
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3));
`endif

endmodule
module cl_a1_aomux5_12x (
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4));
`endif

endmodule
module cl_a1_aomux5_16x (
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4));
`endif

endmodule
module cl_a1_aomux5_1x (
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4));
`endif

endmodule
module cl_a1_aomux5_2x (
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4));
`endif

endmodule
module cl_a1_aomux5_4x (
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4));
`endif

endmodule
module cl_a1_aomux5_6x (
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4));
`endif

endmodule
module cl_a1_aomux5_8x (
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4));
`endif

endmodule
module cl_a1_aomux6_12x (
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5));
`endif

endmodule
module cl_a1_aomux6_16x (
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5));
`endif

endmodule
module cl_a1_aomux6_1x (
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5));
`endif

endmodule
module cl_a1_aomux6_2x (
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5));
`endif

endmodule
module cl_a1_aomux6_4x (
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5));
`endif

endmodule
module cl_a1_aomux6_6x (
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5));
`endif

endmodule
module cl_a1_aomux6_8x (
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5));
`endif

endmodule
module cl_a1_aomux6_by2_1x (
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5));
`endif

endmodule
module cl_a1_aomux6_by2_2x (
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5));
`endif

endmodule
module cl_a1_aomux7_12x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6));
`endif

endmodule
module cl_a1_aomux7_16x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6));
`endif

endmodule
module cl_a1_aomux7_1x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6));
`endif

endmodule
module cl_a1_aomux7_2x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6));
`endif

endmodule
module cl_a1_aomux7_4x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6));
`endif

endmodule
module cl_a1_aomux7_6x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6));
`endif

endmodule
module cl_a1_aomux7_8x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6));
`endif

endmodule
module cl_a1_aomux7_by2_1x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6));
`endif

endmodule
module cl_a1_aomux7_by2_2x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6));
`endif

endmodule
module cl_a1_aomux8_12x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	in7;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
input 	sel7;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6) |
	      (sel7 & in7));
`endif
		

endmodule
module cl_a1_aomux8_16x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	in7;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
input 	sel7;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6) |
	      (sel7 & in7));
`endif
		

endmodule
module cl_a1_aomux8_1x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	in7;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
input 	sel7;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6) |
	      (sel7 & in7));
`endif
		

endmodule
module cl_a1_aomux8_2x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	in7;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
input 	sel7;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6) |
	      (sel7 & in7));
`endif
		

endmodule
module cl_a1_aomux8_4x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	in7;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
input 	sel7;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6) |
	      (sel7 & in7));
`endif
		

endmodule
module cl_a1_aomux8_6x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	in7;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
input 	sel7;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6) |
	      (sel7 & in7));
`endif
		

endmodule
module cl_a1_aomux8_8x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	in7;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
input 	sel7;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6) |
	      (sel7 & in7));
`endif
		

endmodule
module cl_a1_aomux8_by2_1x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	in7;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
input 	sel7;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6) |
	      (sel7 & in7));
`endif
		

endmodule
module cl_a1_aomux8_by2_2x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	in7;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
input 	sel7;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6) |
	      (sel7 & in7));
`endif
		

endmodule
module	cl_a1_l1hdr_12x (
		 l2clk,
		 se,
		 pce,
		 pce_ov,
		 stop,	
		 l1clk
	
		);



  
   input	l2clk;		// level 2 clock, from clock grid
   input	se;		// Scan Enable
   input	pce;             // Clock enable for local power savings
   input	pce_ov;        // TCU sourced clock enable override for testing
   input	stop;           // TCU/CCU sourced clock stop for debug 
    output	l1clk;
`ifdef FORMAL_TOOL
    wire l1en = (~stop & ( pce | pce_ov ));
    assign       l1clk = (l2clk & l1en) | se;
   `else
`ifdef LIB
   reg	l1en;
 

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



`endif
`endif

endmodule

module	cl_a1_l1hdr_16x (
		 l2clk,
		 se,
		 pce,
		 pce_ov,
		 stop,
		 l1clk
		);
// RFM  05/21/2004


  
   input	l2clk;		// level 2 clock, from clock grid
   input	se;		// Scan Enable
   input	pce;             // Clock enable for local power savings
   input	pce_ov;        // TCU sourced clock enable override for testing
   input	stop;           // TCU/CCU sourced clock stop for debug 
   output	l1clk;
`ifdef FORMAL_TOOL
    wire l1en = (~stop & ( pce | pce_ov ));
    assign       l1clk = (l2clk & l1en) | se;
   `else
`ifdef LIB
   reg	l1en;
  


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



`endif
`endif

endmodule
module	cl_a1_l1hdr_24x (
		 l2clk,
		 se,
		 pce,
		 pce_ov,
		 stop,
		 l1clk
		);
// RFM  05/21/2004


   
   input	l2clk;		// level 2 clock, from clock grid
   input	se;		// Scan Enable
   input	pce;             // Clock enable for local power savings
   input	pce_ov;        // TCU sourced clock enable override for testing
   input	stop;           // TCU/CCU sourced clock stop for debug 
   output	l1clk;
`ifdef FORMAL_TOOL
    wire l1en = (~stop & ( pce | pce_ov ));
    assign       l1clk = (l2clk & l1en) | se;
   `else
`ifdef LIB
   reg	l1en;
 


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


`endif
`endif

endmodule
module	cl_a1_l1hdr_32x (
		 l2clk,
		 se,
		 pce,
		 pce_ov,
		 stop,
		 l1clk
		);
// RFM  05/21/2004


   
   input	l2clk;		// level 2 clock, from clock grid
   input	se;		// Scan Enable
   input	pce;             // Clock enable for local power savings
   input	pce_ov;        // TCU sourced clock enable override for testing
   input	stop;           // TCU/CCU sourced clock stop for debug 
   output	l1clk;
`ifdef FORMAL_TOOL
    wire l1en = (~stop & ( pce | pce_ov ));
    assign       l1clk = (l2clk & l1en) | se;
   `else
`ifdef LIB
   reg	l1en;
 


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



`endif
`endif

endmodule

module	cl_a1_l1hdr_4x (
		 l2clk,
		 se,
		 pce,
		 pce_ov,
		 stop,
		 l1clk
		);
// RFM  05/21/2004


   
   input	l2clk;		// level 2 clock, from clock grid
   input	se;		// Scan Enable
   input	pce;             // Clock enable for local power savings
   input	pce_ov;        // TCU sourced clock enable override for testing
   input	stop;           // TCU/CCU sourced clock stop for debug 
   output	l1clk;
`ifdef FORMAL_TOOL
    wire l1en = (~stop & ( pce | pce_ov ));
    assign       l1clk = (l2clk & l1en) | se;
   `else
`ifdef LIB
   reg	l1en;
  


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



`endif
`endif

endmodule
module	cl_a1_l1hdr_48x (
		 l2clk,
		 se,
		 pce,
		 pce_ov,
		 stop,	
		 l1clk
	
		);



  
   input	l2clk;		// level 2 clock, from clock grid
   input	se;		// Scan Enable
   input	pce;             // Clock enable for local power savings
   input	pce_ov;        // TCU sourced clock enable override for testing
   input	stop;           // TCU/CCU sourced clock stop for debug 
    output	l1clk;
`ifdef FORMAL_TOOL
    wire l1en = (~stop & ( pce | pce_ov ));
    assign       l1clk = (l2clk & l1en) | se;
   `else
`ifdef LIB
   reg	l1en;
 


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



`endif
`endif

endmodule
module	cl_a1_l1hdr_64x (
		 l2clk,
		 se,
		 pce,
		 pce_ov,
		 stop,	
		 l1clk
	
		);



  
   input	l2clk;		// level 2 clock, from clock grid
   input	se;		// Scan Enable
   input	pce;             // Clock enable for local power savings
   input	pce_ov;        // TCU sourced clock enable override for testing
   input	stop;           // TCU/CCU sourced clock stop for debug 
    output	l1clk;
`ifdef FORMAL_TOOL
    wire l1en = (~stop & ( pce | pce_ov ));
    assign       l1clk = (l2clk & l1en) | se;
   `else
`ifdef LIB
   reg	l1en;
 


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



`endif
`endif

endmodule
module	cl_a1_l1hdr_8x (
		 l2clk,
		 se,
		 pce,
		 pce_ov,
		 stop,
		 l1clk
		);
// RFM  05/21/2004


   
   input	l2clk;		// level 2 clock, from clock grid
   input	se;		// Scan Enable
   input	pce;             // Clock enable for local power savings
   input	pce_ov;        // TCU sourced clock enable override for testing
   input	stop;           // TCU/CCU sourced clock stop for debug 
   output	l1clk;
`ifdef FORMAL_TOOL
    wire l1en = (~stop & ( pce | pce_ov ));
    assign       l1clk = (l2clk & l1en) | se;
   `else
`ifdef LIB
   reg	l1en;
 

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



`endif
`endif

endmodule

module cl_a1_msffmin_16x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
 `ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff




module cl_a1_msffmin_8x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE
 `ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             reg 	l1;

             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msffmin_4x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
 `ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msffmin_32x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
 `ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msffmin_1x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
 `ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msff_lp_4x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
 `ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff


 module cl_a1_msff_16x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
	 `ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msff_1x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	    	
        `ifdef SCAN_MODE
		 reg l1;
   	`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff


 module cl_a1_msff_32x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     
        `ifdef SCAN_MODE
		reg l1;
 	`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else             

             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msff_4x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     
        `ifdef SCAN_MODE

             reg l1;
 	`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
 module cl_a1_msff_8x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     
        `ifdef SCAN_MODE
		reg l1;
 	`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else            

             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff

module cl_a1_msff_syrst_1x ( q, so, d, l1clk, si, siclk, soclk,reset );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;
   input   reset;
             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE
		reg l1;
`ifdef FAST_FLUSH
              always @(l1clk or siclk or  d )    // vcs optimized code 
               begin
                     if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
                else if ( l1clk && !siclk)           q  <= l1;    // Load slave with master data
                else if ( l1clk &&  siclk)           begin       // Conflict between data and scan
                  l1 <= 1'b0;
                  q <=  1'b0;
                end
               end
          `else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  (d&reset);
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msff_syrst_4x ( q, so, d, l1clk, si, siclk, soclk,reset );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;
   input   reset;
             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
`ifdef FAST_FLUSH
              always @(l1clk or siclk or  d )    // vcs optimized code 
               begin
                     if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
                else if ( l1clk && !siclk)           q  <= l1;    // Load slave with master data
                else if ( l1clk &&  siclk)           begin       // Conflict between data and scan
                  l1 <= 1'b0;
                  q <=  1'b0;
                end
               end
          `else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  (d&reset);
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msff_syrst_8x ( q, so, d, l1clk, si, siclk, soclk,reset );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;
   input   reset;
             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
`ifdef FAST_FLUSH
              always @(l1clk or siclk or  d )    // vcs optimized code 
               begin
                     if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
                else if ( l1clk && !siclk)           q  <= l1;    // Load slave with master data
                else if ( l1clk &&  siclk)           begin       // Conflict between data and scan
                  l1 <= 1'b0;
                  q <=  1'b0;
                end
               end
          `else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  (d&reset);
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msff_syrst_16x ( q, so, d, l1clk, si, siclk, soclk,reset );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;
   input   reset;
             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
`ifdef FAST_FLUSH
              always @(l1clk or siclk or  d )    // vcs optimized code 
               begin
                     if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
                else if ( l1clk && !siclk)           q  <= l1;    // Load slave with master data
                else if ( l1clk &&  siclk)           begin       // Conflict between data and scan
                  l1 <= 1'b0;
                  q <=  1'b0;
                end
               end
          `else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  (d&reset);
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_a1_msff_syrst_32x ( q, so, d, l1clk, si, siclk, soclk,reset );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;
   input   reset;
             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
`ifdef FAST_FLUSH
              always @(l1clk or siclk or  d )    // vcs optimized code 
               begin
                     if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
                else if ( l1clk && !siclk)           q  <= l1;    // Load slave with master data
                else if ( l1clk &&  siclk)           begin       // Conflict between data and scan
                  l1 <= 1'b0;
                  q <=  1'b0;
                end
               end
          `else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= (d&reset);    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  (d&reset);
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
 

module cl_a1_msffi_16x ( q_l, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q_l;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q_l;
             reg 	q;
             wire     so;
             wire      l1clk, siclk, soclk;
	      
        `ifdef SCAN_MODE
		reg l1;
 `ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else            

             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q_l = 1'b1;
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif
	 
	 
	always @ (q)
begin
  q_l=~q;
end



         assign so = q;

endmodule // dff

module cl_a1_msffi_1x ( q_l, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q_l;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q_l;
             reg 	q;
             wire     so;
             wire      l1clk, siclk, soclk;
		
        `ifdef SCAN_MODE

             reg l1;
 `ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q_l = 1'b1;
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif
	 
	 
	always @ (q)
begin
  q_l=~q;
end



         assign so = q;

endmodule // dff


module cl_a1_msffi_32x ( q_l, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q_l;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q_l;
             reg 	q;
             wire     so;
             wire      l1clk, siclk, soclk;
		
        `ifdef SCAN_MODE
		reg l1;
 `ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else             

             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q_l = 1'b1;
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif
	 
	 
	always @ (q)
begin
  q_l=~q;
end



         assign so = q;

endmodule // dff


module cl_a1_msffi_4x ( q_l, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q_l;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q_l;
             reg 	q;
             wire     so;
             wire      l1clk, siclk, soclk;
		
        `ifdef SCAN_MODE
		reg l1;
 `ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else             

             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q_l = 1'b1;
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif
	 
	 
	always @ (q)
begin
  q_l=~q;
end



         assign so = q;

endmodule // dff

module cl_a1_msffi_8x ( q_l, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q_l;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q_l;
             reg 	q;
             wire     so;
             wire      l1clk, siclk, soclk;
		
        `ifdef SCAN_MODE
		reg l1;
	 `ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else             

             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q_l = 1'b1;
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif
	 
	 
	always @ (q)
begin
  q_l=~q;
end



         assign so = q;

endmodule // dff






module cl_a1_msffjtag_4x ( q, so, d, l1clk, si, siclk, soclk, reset, updateclk );

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;
   input   reset;
   input   updateclk;
`ifdef LIB
             reg       q;
             reg       so;
             wire      l1clk, siclk, soclk, updateclk;

             reg l1;

             always @(l1clk or siclk or soclk or d or si or reset)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan
                    if (reset)			    so <=1'b0;
                    if ( l1clk && !siclk && !soclk && !reset)  so <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk && !reset)  so <= si;    // Flush
              end

         `ifdef INITLATZERO
                initial q = 1'b0;
          `endif



           always@(updateclk or reset or l1)
                begin
                if(reset)  q <=1'b0;
           else if(updateclk)  q <=l1;
               
			
                       
                end
             `endif
endmodule




module cl_a1_clksyncff_4x(l1clk, d, si, siclk, soclk, q, so);
input l1clk, d, si, siclk, soclk;
output q, so;
wire q1o, slo;

cl_a1_msff_4x  xx0 ( .l1clk(l1clk), .d(d), .si(si), .siclk(siclk), .soclk(soclk), .q(q1o), .so(slo));
cl_a1_msff_4x  xx1 ( .l1clk(l1clk), .d(q1o), .si(slo), .siclk(siclk), .soclk(soclk), .q(q), .so(so));
endmodule
module cl_a1_bs_cell2_4x(q, so, d, l1clk, si, siclk, soclk, updateclk, mode,
muxd, highz_n);

   output     q;
   output       so;

   input         d, highz_n;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

   input   updateclk, mode, muxd;

             reg       q;
             reg       so;
             wire      l1clk, siclk, soclk, updateclk;


             reg l1, qm;

             always @(l1clk or siclk or soclk or d or si)
              begin
   if (!l1clk && !siclk)           l1 <= d;
   if ( l1clk &&  siclk)           l1 <= si;
   if (!l1clk &&  siclk)           l1 <= 1'bx;
   if ( l1clk &&  !soclk)          so <= l1;
   if ( l1clk &&  siclk && !soclk) so <= si;    // Flush
              end
             `ifdef INITLATZERO
                initial qm = 1'b0;
	     `endif
           always@(updateclk or l1)
                begin
                if(updateclk)  qm <=l1;
                end
always@(mode or muxd or qm or highz_n)
        begin
        if(mode==0)  q=(qm && highz_n);
        else         q=muxd;
        end
endmodule

module cl_a1_clk_buf_16x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_clk_buf_20x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_clk_buf_24x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_clk_buf_32x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_clk_buf_48x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_clk_buf_64x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_clk_buf_8x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_clk_inv_16x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_a1_clk_inv_20x (
clkin,
clkout
);
input	clkin;
output	clkout;

`ifdef LIB
//assign clkout = ~clkin;
not (clkout, clkin);
`endif

endmodule
module cl_a1_clk_inv_24x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_a1_clk_inv_32x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_a1_clk_inv_48x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_a1_clk_inv_64x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_a1_clk_inv_8x (
clkin,
clkout
);
input	clkin;
output	clkout;

`ifdef LIB
//assign clkout = ~clkin;
not (clkout, clkin);
`endif

endmodule
module cl_a1_clk_mux2_16x (
in0,
in1,
sel0,
out
);
input   in0;
input   in1;
input   sel0;
output  out;

`ifdef LIB
reg out;
   always @ ( sel0 or in0 or in1)
     case ( sel0 )
       1'b1:            out = in0;
       1'b0:            out = in1;

       default:                 out = 1'bx;

       endcase
`endif

endmodule

module cl_a1_clk_mux2_24x (
in0,
in1,
sel0,
out
);
input   in0;
input   in1;
input   sel0;
output  out;

`ifdef LIB
reg out;
   always @ ( sel0 or in0 or in1)
     case ( sel0 )
       1'b1:            out = in0;
       1'b0:            out = in1;

       default:                 out = 1'bx;

       endcase
`endif

endmodule

module cl_a1_clk_mux2_32x (
in0,
in1,
sel0,
out
);
input   in0;
input   in1;
input   sel0;
output  out;

`ifdef LIB
reg out;
   always @ ( sel0 or in0 or in1)
     case ( sel0 )
       1'b1:            out = in0;
       1'b0:            out = in1;

       default:                 out = 1'bx;

       endcase
`endif

endmodule

module cl_a1_clk_mux2_8x (
in0,
in1,
sel0,
out
);
input   in0;
input   in1;
input   sel0;
output  out;

`ifdef LIB
reg out;
   always @ ( sel0 or in0 or in1)
     case ( sel0 )
       1'b1:            out = in0;
       1'b0:            out = in1;

       default:                 out = 1'bx;

       endcase
`endif

endmodule 

// --------------------------------------------------
// File: cl_a1_aoi12_12x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Thursday Nov 29,2001 at 11:51:25 AM PST
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_aoi12_12x (
    out,
    in10,
    in00,
    in01 );

    output out;
    input  in10;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 ) | ( in00 & in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_aoi12_16x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Thursday Nov 29,2001 at 11:51:25 AM PST
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_aoi12_16x (
    out,
    in10,
    in00,
    in01 );

    output out;
    input  in10;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 ) | ( in00 & in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_aoi12_1x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Thursday Dec  6,2001 at 02:09:00 PM PST
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_aoi12_1x (
    out,
    in10,
    in00,
    in01 );

    output out;
    input  in10;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 ) | ( in00 & in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_aoi12_2x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Thursday Nov 29,2001 at 11:51:25 AM PST
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_aoi12_2x (
    out,
    in10,
    in00,
    in01 );

    output out;
    input  in10;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 ) | ( in00 & in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_aoi12_4x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Thursday Nov 29,2001 at 11:51:25 AM PST
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_aoi12_4x (
    out,
    in10,
    in00,
    in01 );

    output out;
    input  in10;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 ) | ( in00 & in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_aoi12_8x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Thursday Nov 29,2001 at 11:51:25 AM PST
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_aoi12_8x (
    out,
    in10,
    in00,
    in01 );

    output out;
    input  in10;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 ) | ( in00 & in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_aoi21_12x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:15 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_aoi21_12x (
    out,
    in10,
    in11,
    in00 );

    output out;
    input  in10;
    input  in11;
    input  in00;

`ifdef LIB
    assign out = ~(( in10 & in11 ) | ( in00 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_aoi21_16x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:15 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_aoi21_16x (
    out,
    in10,
    in11,
    in00 );

    output out;
    input  in10;
    input  in11;
    input  in00;

`ifdef LIB
    assign out = ~(( in10 & in11 ) | ( in00 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_aoi21_1x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:15 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_aoi21_1x (
    out,
    in10,
    in11,
    in00 );

    output out;
    input  in10;
    input  in11;
    input  in00;

`ifdef LIB
    assign out = ~(( in10 & in11 ) | ( in00 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_aoi21_2x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:15 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_aoi21_2x (
    out,
    in10,
    in11,
    in00 );

    output out;
    input  in10;
    input  in11;
    input  in00;

`ifdef LIB
    assign out = ~(( in10 & in11 ) | ( in00 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_aoi21_4x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:15 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_aoi21_4x (
    out,
    in10,
    in11,
    in00 );

    output out;
    input  in10;
    input  in11;
    input  in00;

`ifdef LIB
    assign out = ~(( in10 & in11 ) | ( in00 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_aoi21_8x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:15 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_aoi21_8x (
    out,
    in10,
    in11,
    in00 );

    output out;
    input  in10;
    input  in11;
    input  in00;

`ifdef LIB
    assign out = ~(( in10 & in11 ) | ( in00 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_aoi22_12x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:16 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_aoi22_12x (
    out,
    in10,
    in11,
    in00,
    in01 );

    output out;
    input  in10;
    input  in11;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 & in11 ) | ( in00 & in01 ));
`endif

endmodule

// --------------------------------------------------
// File: cl_a1_aoi22_1x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Wednesday May 29,2002 at 04:04:32 PM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_aoi22_1x (
    out,
    in10,
    in11,
    in00,
    in01 );

    output out;
    input  in10;
    input  in11;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 & in11 ) | ( in00 & in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_aoi22_2x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:16 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_aoi22_2x (
    out,
    in10,
    in11,
    in00,
    in01 );

    output out;
    input  in10;
    input  in11;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 & in11 ) | ( in00 & in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_aoi22_4x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:16 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_aoi22_4x (
    out,
    in10,
    in11,
    in00,
    in01 );

    output out;
    input  in10;
    input  in11;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 & in11 ) | ( in00 & in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_aoi22_8x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:16 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_aoi22_8x (
    out,
    in10,
    in11,
    in00,
    in01 );

    output out;
    input  in10;
    input  in11;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 & in11 ) | ( in00 & in01 ));
`endif

endmodule


// --------------------------------------------------
// File: cl_a1_aoi33_1x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Thursday Dec  6,2001 at 02:09:02 PM PST
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_aoi33_1x (
    out,
    in10,
    in11,
    in12,
    in00,
    in01,
    in02 );

    output out;
    input  in10;
    input  in11;
    input  in12;
    input  in00;
    input  in01;
    input  in02;

`ifdef LIB
    assign out = ~(( in10 & in11 & in12 ) | ( in00 & in01 & in02 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_aoi33_2x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:18 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_aoi33_2x (
    out,
    in10,
    in11,
    in12,
    in00,
    in01,
    in02 );

    output out;
    input  in10;
    input  in11;
    input  in12;
    input  in00;
    input  in01;
    input  in02;

`ifdef LIB
    assign out = ~(( in10 & in11 & in12 ) | ( in00 & in01 & in02 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_aoi33_4x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:18 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_aoi33_4x (
    out,
    in10,
    in11,
    in12,
    in00,
    in01,
    in02 );

    output out;
    input  in10;
    input  in11;
    input  in12;
    input  in00;
    input  in01;
    input  in02;

`ifdef LIB
    assign out = ~(( in10 & in11 & in12 ) | ( in00 & in01 & in02 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_aoi33_8x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:18 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_aoi33_8x (
    out,
    in10,
    in11,
    in12,
    in00,
    in01,
    in02 );

    output out;
    input  in10;
    input  in11;
    input  in12;
    input  in00;
    input  in01;
    input  in02;

`ifdef LIB
    assign out = ~(( in10 & in11 & in12 ) | ( in00 & in01 & in02 ));
`endif

endmodule
module cl_a1_rep_32x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_rep_40x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_rep_24x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_rep_16x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_rep_8x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_rep_48x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_rep_dcp2x_32x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule

module cl_a1_rep_dcp2x_16x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_rep_dcp2x_24x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_rep_dcp2x_40x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_rep_dcp2x_48x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_rep_dcp_32x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule

module cl_a1_rep_dcp_16x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_rep_dcp_24x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_rep_dcp_40x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_rep_dcp_48x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_rep_dcp50k_48x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_rep_dcp50k_32x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_rep_dcp50k_40x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule

module cl_a1_buf_12x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_buf_16x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_buf_1x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_buf_20x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_buf_24x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_buf_28x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_buf_2x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_buf_32x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_buf_36x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_buf_40x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_buf_44x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_buf_48x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_buf_4x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_buf_56x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_buf_64x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_buf_6x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_buf_8x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_bufmin_1x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_bufmin_4x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_bufmin_8x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_bufmin_16x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_bufmin_32x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_a1_csa32_16x (
in0,
in1,
in2,
carry,
sum
);
input 	in0;
input 	in1;
input 	in2;
output 	carry;
output 	sum;

`ifdef LIB
  assign carry = (in0 & in1) | (in0 & in2) | (in1 & in2);
  assign sum = (in0 ^ in1 ^ in2);
`endif

endmodule
module cl_a1_csa32_4x (
in0,
in1,
in2,
carry,
sum
);
input 	in0;
input 	in1;
input 	in2;
output 	carry;
output 	sum;

`ifdef LIB
  assign carry = (in0 & in1) | (in0 & in2) | (in1 & in2);
  assign sum = (in0 ^ in1 ^ in2);
`endif

endmodule

module cl_a1_inv_12x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_a1_inv_16x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_a1_inv_1x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_a1_inv_20x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_a1_inv_24x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_a1_inv_28x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_a1_inv_2x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_a1_inv_32x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_a1_inv_36x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_a1_inv_40x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_a1_inv_44x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_a1_inv_48x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_a1_inv_4x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_a1_inv_56x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_a1_inv_64x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_a1_inv_6x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_a1_inv_8x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_a1_nand2_12x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_a1_nand2_16x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_a1_nand2_1x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_a1_nand2_20x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_a1_nand2_24x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_a1_nand2_28x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_a1_nand2_2x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_a1_nand2_32x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_a1_nand2_4x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_a1_nand2_6x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_a1_nand2_8x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_a1_nand3_12x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2);
`endif

endmodule
module cl_a1_nand3_16x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2);
`endif

endmodule
module cl_a1_nand3_1x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2);
`endif

endmodule
module cl_a1_nand3_20x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2);
`endif

endmodule
module cl_a1_nand3_24x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2);
`endif

endmodule

module cl_a1_nand3_2x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2);
`endif

endmodule

module cl_a1_nand3_4x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2);
`endif

endmodule
module cl_a1_nand3_6x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2);
`endif

endmodule
module cl_a1_nand3_8x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2);
`endif

endmodule
module cl_a1_nand4_12x (
in0,
in1,
in2,
in3,
out
);
input	in0;
input	in1;
input	in2;
input	in3;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2 & in3);
`endif

endmodule
module cl_a1_nand4_16x (
in0,
in1,
in2,
in3,
out
);
input	in0;
input	in1;
input	in2;
input	in3;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2 & in3);
`endif

endmodule
module cl_a1_nand4_1x (
in0,
in1,
in2,
in3,
out
);
input	in0;
input	in1;
input	in2;
input	in3;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2 & in3);
`endif

endmodule


module cl_a1_nand4_2x (
in0,
in1,
in2,
in3,
out
);
input	in0;
input	in1;
input	in2;
input	in3;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2 & in3);
`endif

endmodule

module cl_a1_nand4_4x (
in0,
in1,
in2,
in3,
out
);
input	in0;
input	in1;
input	in2;
input	in3;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2 & in3);
`endif

endmodule
module cl_a1_nand4_6x (
in0,
in1,
in2,
in3,
out
);
input	in0;
input	in1;
input	in2;
input	in3;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2 & in3);
`endif

endmodule
module cl_a1_nand4_8x (
in0,
in1,
in2,
in3,
out
);
input	in0;
input	in1;
input	in2;
input	in3;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2 & in3);
`endif

endmodule
module cl_a1_nor2_12x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 | in1);
`endif

endmodule
module cl_a1_nor2_16x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 | in1);
`endif

endmodule
module cl_a1_nor2_1x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 | in1);
`endif

endmodule
module cl_a1_nor2_2x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 | in1);
`endif

endmodule
module cl_a1_nor2_4x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 | in1);
`endif

endmodule
module cl_a1_nor2_6x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 | in1);
`endif

endmodule
module cl_a1_nor2_8x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 | in1);
`endif

endmodule
module cl_a1_nor3_1x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 | in1 | in2);
`endif

endmodule
module cl_a1_nor3_2x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 | in1 | in2);
`endif

endmodule
module cl_a1_nor3_4x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 | in1 | in2);
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_oai12_12x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Wednesday May 29,2002 at 04:04:34 PM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_oai12_12x (
    out,
    in10,
    in00,
    in01 );

    output out;
    input  in10;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 ) & ( in00 | in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_oai12_16x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Wednesday May 29,2002 at 04:04:34 PM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_oai12_16x (
    out,
    in10,
    in00,
    in01 );

    output out;
    input  in10;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 ) & ( in00 | in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_oai12_1x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Wednesday May 29,2002 at 04:04:34 PM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_oai12_1x (
    out,
    in10,
    in00,
    in01 );

    output out;
    input  in10;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 ) & ( in00 | in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_oai12_2x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Wednesday May 29,2002 at 04:04:34 PM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_oai12_2x (
    out,
    in10,
    in00,
    in01 );

    output out;
    input  in10;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 ) & ( in00 | in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_oai12_4x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Wednesday May 29,2002 at 04:04:34 PM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_oai12_4x (
    out,
    in10,
    in00,
    in01 );

    output out;
    input  in10;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 ) & ( in00 | in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_oai12_8x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Wednesday May 29,2002 at 04:04:34 PM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_oai12_8x (
    out,
    in10,
    in00,
    in01 );

    output out;
    input  in10;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 ) & ( in00 | in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_oai21_12x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Wednesday May 29,2002 at 04:04:35 PM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_oai21_12x (
    out,
    in10,
    in11,
    in00 );

    output out;
    input  in10;
    input  in11;
    input  in00;

`ifdef LIB
    assign out = ~(( in10 | in11 ) & ( in00 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_oai21_16x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Wednesday May 29,2002 at 04:04:35 PM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_oai21_16x (
    out,
    in10,
    in11,
    in00 );

    output out;
    input  in10;
    input  in11;
    input  in00;

`ifdef LIB
    assign out = ~(( in10 | in11 ) & ( in00 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_oai21_1x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Friday Mar 15,2002 at 02:53:58 PM PST
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_oai21_1x (
    out,
    in10,
    in11,
    in00 );

    output out;
    input  in10;
    input  in11;
    input  in00;

`ifdef LIB
    assign out = ~(( in10 | in11 ) & ( in00 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_oai21_2x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:23 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_oai21_2x (
    out,
    in10,
    in11,
    in00 );

    output out;
    input  in10;
    input  in11;
    input  in00;

`ifdef LIB
    assign out = ~(( in10 | in11 ) & ( in00 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_oai21_4x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:23 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_oai21_4x (
    out,
    in10,
    in11,
    in00 );

    output out;
    input  in10;
    input  in11;
    input  in00;

`ifdef LIB
    assign out = ~(( in10 | in11 ) & ( in00 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_oai21_8x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:23 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_oai21_8x (
    out,
    in10,
    in11,
    in00 );

    output out;
    input  in10;
    input  in11;
    input  in00;

`ifdef LIB
    assign out = ~(( in10 | in11 ) & ( in00 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_oai22_12x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Wednesday May 29,2002 at 04:04:35 PM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_oai22_12x (
    out,
    in10,
    in11,
    in00,
    in01 );

    output out;
    input  in10;
    input  in11;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 | in11 ) & ( in00 | in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_oai22_16x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Wednesday May 29,2002 at 04:04:35 PM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_oai22_16x (
    out,
    in10,
    in11,
    in00,
    in01 );

    output out;
    input  in10;
    input  in11;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 | in11 ) & ( in00 | in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_oai22_1x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Wednesday May 29,2002 at 04:04:35 PM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_oai22_1x (
    out,
    in10,
    in11,
    in00,
    in01 );

    output out;
    input  in10;
    input  in11;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 | in11 ) & ( in00 | in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_oai22_2x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:24 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_oai22_2x (
    out,
    in10,
    in11,
    in00,
    in01 );

    output out;
    input  in10;
    input  in11;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 | in11 ) & ( in00 | in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_oai22_4x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:24 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_oai22_4x (
    out,
    in10,
    in11,
    in00,
    in01 );

    output out;
    input  in10;
    input  in11;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 | in11 ) & ( in00 | in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_a1_oai22_8x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:24 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_a1_oai22_8x (
    out,
    in10,
    in11,
    in00,
    in01 );

    output out;
    input  in10;
    input  in11;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 | in11 ) & ( in00 | in01 ));
`endif

endmodule
module cl_a1_xnor2_16x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 ^ in1);
`endif

endmodule

module cl_a1_xnor2_1x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 ^ in1);
`endif

endmodule
module cl_a1_xnor2_2x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 ^ in1);
`endif

endmodule
module cl_a1_xnor2_4x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 ^ in1);
`endif

endmodule
module cl_a1_xnor2_6x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 ^ in1);
`endif

endmodule
module cl_a1_xnor2_8x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 ^ in1);
`endif

endmodule

module cl_a1_xnor3_16x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 ^ in1 ^ in2);
`endif



endmodule
module cl_a1_xnor3_1x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 ^ in1 ^ in2);
`endif



endmodule
module cl_a1_xnor3_2x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 ^ in1 ^ in2);
`endif



endmodule
module cl_a1_xnor3_4x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 ^ in1 ^ in2);
`endif



endmodule
module cl_a1_xnor3_6x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 ^ in1 ^ in2);
`endif



endmodule
module cl_a1_xnor3_8x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 ^ in1 ^ in2);
`endif



endmodule
module cl_a1_xor2_16x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = in0 ^ in1;
`endif

endmodule

module cl_a1_xor2_1x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = in0 ^ in1;
`endif

endmodule
module cl_a1_xor2_2x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = in0 ^ in1;
`endif

endmodule
module cl_a1_xor2_4x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = in0 ^ in1;
`endif

endmodule
module cl_a1_xor2_6x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = in0 ^ in1;
`endif

endmodule
module cl_a1_xor2_8x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = in0 ^ in1;
`endif

endmodule
module cl_a1_xor3_16x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = in0 ^ in1 ^ in2;
`endif


endmodule

module cl_a1_xor3_1x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = in0 ^ in1 ^ in2;
`endif


endmodule
module cl_a1_xor3_2x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = in0 ^ in1 ^ in2;
`endif


endmodule
module cl_a1_xor3_4x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = in0 ^ in1 ^ in2;
`endif


endmodule
module cl_a1_xor3_6x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = in0 ^ in1 ^ in2;
`endif


endmodule
module cl_a1_xor3_8x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = in0 ^ in1 ^ in2;
`endif


endmodule



module cl_a1_muxprotect_2x (
d0,
d1,
d2,
d3,
scan_en,
e0,
e1,
e2,
e3
);
input d0;
input d1;
input d2;
input d3;
input scan_en;
output e0;
output e1;
output e2;
output e3;

`ifdef LIB
assign e0 = scan_en | d0;
assign e1= ~scan_en & d1;
assign e2= ~scan_en & d2;
assign e3= ~scan_en & d3;
`endif

endmodule

module cl_a1_add64_8x (
cin,
in0,
in1,
out,
cout
);
input 	       cin;
input 	[63:0] in0;
input 	[63:0] in1;
output 	[63:0] out;
output 	       cout;

`ifdef LIB
  assign {cout, out[63:0]} = ({1'b0, in0[63:0]} + {1'b0, in1[63:0]} + {{64{1'b0}}, cin});
`endif

endmodule







