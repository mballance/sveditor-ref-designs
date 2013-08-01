// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: delay.v
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
module delay(signal_in,signal_out,delay_cycles,clk);

parameter SIZE=1;

input  [SIZE-1:0] signal_in;
output [SIZE-1:0] signal_out;
input  [5:0]      delay_cycles;
input  clk;

wire [15:0] shifted_signal;

assign            signal_out = ( delay_cycles == 6'h1 ) ? shifted_signal[1]:
                               ( delay_cycles == 6'h2 ) ? shifted_signal[2]:
                               ( delay_cycles == 6'h3 ) ? shifted_signal[3]:
                               ( delay_cycles == 6'h4 ) ? shifted_signal[4]:
                               ( delay_cycles == 6'h5 ) ? shifted_signal[5]:
                               ( delay_cycles == 6'h6 ) ? shifted_signal[6]:
                               ( delay_cycles == 6'h7 ) ? shifted_signal[7]:
                               ( delay_cycles == 6'h8 ) ? shifted_signal[8]:
                               ( delay_cycles == 6'h9 ) ? shifted_signal[9]:
                               ( delay_cycles == 6'ha ) ? shifted_signal[10]:
                               ( delay_cycles == 6'hb ) ? shifted_signal[11]:
                               ( delay_cycles == 6'hc ) ? shifted_signal[12]:
                               ( delay_cycles == 6'hd ) ? shifted_signal[13]: (signal_in);

dff_p #(SIZE) dff1( .signal_in   (signal_in),
                    .signal_out  (shifted_signal[1]),
                    .clk (clk));


dff_p #(SIZE) dff2( .signal_in   (shifted_signal[1]),
                    .signal_out  (shifted_signal[2]),
                    .clk (clk));

dff_p #(SIZE) dff3( .signal_in   (shifted_signal[2]),
                    .signal_out  (shifted_signal[3]),
                    .clk (clk));

dff_p #(SIZE) dff4( .signal_in   (shifted_signal[3]),
                    .signal_out  (shifted_signal[4]),
                    .clk (clk));

dff_p #(SIZE) dff5( .signal_in   (shifted_signal[4]),
                    .signal_out  (shifted_signal[5]),
                    .clk (clk));

dff_p #(SIZE) dff6( .signal_in   (shifted_signal[5]),
                    .signal_out  (shifted_signal[6]),
                    .clk (clk));

dff_p #(SIZE) dff7( .signal_in   (shifted_signal[6]),
                    .signal_out  (shifted_signal[7]),
                    .clk (clk));

dff_p #(SIZE) dff8( .signal_in   (shifted_signal[7]),
                    .signal_out  (shifted_signal[8]),
                    .clk (clk));

dff_p #(SIZE) dff9( .signal_in   (shifted_signal[8]),
                    .signal_out  (shifted_signal[9]),
                    .clk (clk));

dff_p #(SIZE) dff10( .signal_in   (shifted_signal[9]),
                    .signal_out  (shifted_signal[10]),
                    .clk (clk));

dff_p #(SIZE) dff11( .signal_in   (shifted_signal[10]),
                    .signal_out  (shifted_signal[11]),
                    .clk (clk));

dff_p #(SIZE) dff12( .signal_in   (shifted_signal[11]),
                    .signal_out  (shifted_signal[12]),
                    .clk (clk));

dff_p #(SIZE) dff13( .signal_in   (shifted_signal[12]),
                    .signal_out  (shifted_signal[13]),
                    .clk (clk));


endmodule


module shifter(signal_in,signal_out,delay_cycles,clk);

parameter SIZE=1;

input  [SIZE-1:0] signal_in;
output [SIZE-1:0] signal_out;
input  [9:0]      delay_cycles;
input  clk;

reg [9:0] counter;
reg [SIZE-1:0] signal_out_reg;


wire [SIZE-1:0] shifted_signal0,shifted_signal1,shifted_signal2,shifted_signal3,shifted_signal4;
wire [SIZE-1:0] shifted_signal5,shifted_signal6,shifted_signal7,shifted_signal8,shifted_signal9;
wire [SIZE-1:0] shifted_signal10,shifted_signal11,shifted_signal12,shifted_signal13,shifted_signal14;
wire [SIZE-1:0] shifted_signal15,shifted_signal16,shifted_signal17,shifted_signal18,shifted_signal19;
wire [SIZE-1:0] shifted_signal20,shifted_signal21,shifted_signal22,shifted_signal23,shifted_signal24;
wire [SIZE-1:0] shifted_signal25,shifted_signal26,shifted_signal27,shifted_signal28,shifted_signal29;
wire [SIZE-1:0] shifted_signal30,shifted_signal31,shifted_signal32,shifted_signal33,shifted_signal34;
wire [SIZE-1:0] shifted_signal35,shifted_signal36,shifted_signal37,shifted_signal38,shifted_signal39;
wire [SIZE-1:0] shifted_signal40,shifted_signal41,shifted_signal42,shifted_signal43,shifted_signal44;
wire [SIZE-1:0] shifted_signal45,shifted_signal46,shifted_signal47,shifted_signal48,shifted_signal49;
wire [SIZE-1:0] shifted_signal50,shifted_signal51,shifted_signal52,shifted_signal53,shifted_signal54;
wire [SIZE-1:0] shifted_signal55,shifted_signal56,shifted_signal57,shifted_signal58,shifted_signal59;
wire [SIZE-1:0] shifted_signal60,shifted_signal61,shifted_signal62,shifted_signal63,shifted_signal64;
wire [SIZE-1:0] shifted_signal65,shifted_signal66,shifted_signal67,shifted_signal68,shifted_signal69;
wire [SIZE-1:0] shifted_signal70,shifted_signal71,shifted_signal72,shifted_signal73,shifted_signal74;
wire [SIZE-1:0] shifted_signal75,shifted_signal76,shifted_signal77,shifted_signal78,shifted_signal79;
wire [SIZE-1:0] shifted_signal80,shifted_signal81,shifted_signal82,shifted_signal83,shifted_signal84;
wire [SIZE-1:0] shifted_signal85,shifted_signal86,shifted_signal87,shifted_signal88,shifted_signal89;
wire [SIZE-1:0] shifted_signal90,shifted_signal91,shifted_signal92,shifted_signal93,shifted_signal94;
wire [SIZE-1:0] shifted_signal95,shifted_signal96,shifted_signal97,shifted_signal98,shifted_signal99;
wire [SIZE-1:0] shifted_signal100,shifted_signal101,shifted_signal102,shifted_signal103,shifted_signal104;
wire [SIZE-1:0] shifted_signal105,shifted_signal106,shifted_signal107,shifted_signal108,shifted_signal109;
wire [SIZE-1:0] shifted_signal110,shifted_signal111,shifted_signal112,shifted_signal113,shifted_signal114;
wire [SIZE-1:0] shifted_signal115,shifted_signal116,shifted_signal117,shifted_signal118,shifted_signal119;
wire [SIZE-1:0] shifted_signal120,shifted_signal121,shifted_signal122,shifted_signal123,shifted_signal124;
wire [SIZE-1:0] shifted_signal125,shifted_signal126,shifted_signal127,shifted_signal128,shifted_signal129;
wire [SIZE-1:0] shifted_signal130,shifted_signal131,shifted_signal132,shifted_signal133,shifted_signal134;
wire [SIZE-1:0] shifted_signal135,shifted_signal136,shifted_signal137,shifted_signal138,shifted_signal139;
wire [SIZE-1:0] shifted_signal140,shifted_signal141,shifted_signal142,shifted_signal143,shifted_signal144;
wire [SIZE-1:0] shifted_signal145,shifted_signal146,shifted_signal147,shifted_signal148,shifted_signal149;
wire [SIZE-1:0] shifted_signal150,shifted_signal151,shifted_signal152,shifted_signal153,shifted_signal154;
wire [SIZE-1:0] shifted_signal155,shifted_signal156,shifted_signal157,shifted_signal158,shifted_signal159;
wire [SIZE-1:0] shifted_signal160,shifted_signal161,shifted_signal162,shifted_signal163,shifted_signal164;
wire [SIZE-1:0] shifted_signal165,shifted_signal166,shifted_signal167,shifted_signal168,shifted_signal169;
wire [SIZE-1:0] shifted_signal170;

initial counter=0;




assign            signal_out = ( delay_cycles == 9'h1 ) ? shifted_signal1:
                               ( delay_cycles == 9'h2 ) ? shifted_signal2:
                               ( delay_cycles == 9'h3 ) ? shifted_signal3:
                               ( delay_cycles == 9'h4 ) ? shifted_signal4:
                               ( delay_cycles == 9'h5 ) ? shifted_signal5:
                               ( delay_cycles == 9'h6 ) ? shifted_signal6:
                               ( delay_cycles == 9'h7 ) ? shifted_signal7:
                               ( delay_cycles == 9'h8 ) ? shifted_signal8:
                               ( delay_cycles == 9'h9 ) ? shifted_signal9:
                               ( delay_cycles == 9'ha ) ? shifted_signal10:
                               ( delay_cycles == 9'hb ) ? shifted_signal11:
                               ( delay_cycles == 9'hc ) ? shifted_signal12:
                               ( delay_cycles == 9'h18 ) ? shifted_signal24:
                               ( delay_cycles == 9'h19 ) ? shifted_signal25:
                               ( delay_cycles == 9'h1a ) ? shifted_signal26:
                               ( delay_cycles == 9'h1b ) ? shifted_signal27:
                               ( delay_cycles == 9'h1c ) ? shifted_signal28:
                               ( delay_cycles == 9'h1d ) ? shifted_signal29:
                               ( delay_cycles == 9'h1e ) ? shifted_signal30:
                               ( delay_cycles == 9'h1f ) ? shifted_signal31:
                               ( delay_cycles == 9'h20 ) ? shifted_signal32:
                               ( delay_cycles == 9'h21 ) ? shifted_signal33:
                               ( delay_cycles == 9'h22 ) ? shifted_signal34:
                               ( delay_cycles == 9'h23 ) ? shifted_signal35:
                               ( delay_cycles == 9'h24 ) ? shifted_signal36:
                               ( delay_cycles == 9'h25 ) ? shifted_signal37:
                               ( delay_cycles == 9'h26 ) ? shifted_signal38:
                               ( delay_cycles == 9'h27 ) ? shifted_signal39:
                               ( delay_cycles == 9'h28 ) ? shifted_signal40:
                               ( delay_cycles == 9'h29 ) ? shifted_signal41:
                               ( delay_cycles == 9'h2a ) ? shifted_signal42:
                               ( delay_cycles == 9'h2b ) ? shifted_signal43:
                               ( delay_cycles == 9'h2c ) ? shifted_signal44:
                               ( delay_cycles == 9'h2d ) ? shifted_signal45:
                               ( delay_cycles == 9'h2e ) ? shifted_signal46:
                               ( delay_cycles == 9'h2f ) ? shifted_signal47:
                               ( delay_cycles == 9'h30 ) ? shifted_signal48:
                               ( delay_cycles == 9'h31 ) ? shifted_signal49:
                               ( delay_cycles == 9'h36 ) ? shifted_signal54:
                               ( delay_cycles == 9'h37 ) ? shifted_signal55:
                               ( delay_cycles == 9'h38 ) ? shifted_signal56:
                               ( delay_cycles == 9'h39 ) ? shifted_signal57:
                               ( delay_cycles == 9'h3a ) ? shifted_signal58:
                               ( delay_cycles == 9'h3b ) ? shifted_signal59:
                               ( delay_cycles == 9'h3c ) ? shifted_signal60:
                               ( delay_cycles == 9'h3d ) ? shifted_signal61:
                               ( delay_cycles == 9'h3e ) ? shifted_signal62:
                               ( delay_cycles == 9'h3f ) ? shifted_signal63:
                               ( delay_cycles == 9'h44 ) ? shifted_signal68:
                               ( delay_cycles == 9'h45 ) ? shifted_signal69:
                               ( delay_cycles == 9'h48 ) ? shifted_signal72:
                               ( delay_cycles == 9'h49 ) ? shifted_signal73:
                               ( delay_cycles == 9'h4b ) ? shifted_signal75:
                               ( delay_cycles == 9'h4e ) ? shifted_signal78:
                               ( delay_cycles == 9'h4f ) ? shifted_signal79:
                               ( delay_cycles == 9'h60 ) ? shifted_signal96:
                               ( delay_cycles == 9'h61 ) ? shifted_signal97:
                               ( delay_cycles == 9'h62 ) ? shifted_signal98:
                               ( delay_cycles == 9'h63 ) ? shifted_signal99:
                               ( delay_cycles == 9'h64 ) ? shifted_signal100:
                               ( delay_cycles == 9'h65 ) ? shifted_signal101:
                               ( delay_cycles == 9'h66 ) ? shifted_signal102:
                               ( delay_cycles == 9'h67 ) ? shifted_signal103:
                               ( delay_cycles == 9'h68 ) ? shifted_signal104:
                               ( delay_cycles == 9'h69 ) ? shifted_signal105:
                               ( delay_cycles == 9'h6a ) ? shifted_signal106:
                               ( delay_cycles == 9'h6b ) ? shifted_signal107:
                               ( delay_cycles == 9'h6c ) ? shifted_signal108:
                               ( delay_cycles == 9'h6d ) ? shifted_signal109:
                               ( delay_cycles == 9'h6e ) ? shifted_signal110:
                               ( delay_cycles == 9'h78 ) ? shifted_signal120:
                               ( delay_cycles == 9'h7c ) ? shifted_signal124:
                               ( delay_cycles == 9'h7d ) ? shifted_signal125:
                               ( delay_cycles == 9'h7e ) ? shifted_signal126:
                               ( delay_cycles == 9'h7f ) ? shifted_signal127:
                               ( delay_cycles == 9'h80 ) ? shifted_signal128:
                               ( delay_cycles == 9'h81 ) ? shifted_signal129:
                               ( delay_cycles == 9'h82 ) ? shifted_signal130:
                               ( delay_cycles == 9'h83 ) ? shifted_signal131:
                               ( delay_cycles == 9'h84 ) ? shifted_signal132:
                               ( delay_cycles == 9'h85 ) ? shifted_signal133:
                               ( delay_cycles == 9'h86 ) ? shifted_signal134:
                               ( delay_cycles == 9'h87 ) ? shifted_signal135:
                               ( delay_cycles == 9'h88 ) ? shifted_signal136:
                               ( delay_cycles == 9'h89 ) ? shifted_signal137:
                               ( delay_cycles == 9'h8a ) ? shifted_signal138:
                               ( delay_cycles == 9'h8b ) ? shifted_signal139:
                               ( delay_cycles == 9'h90 ) ? shifted_signal144:
                               ( delay_cycles == 9'h91 ) ? shifted_signal145:
                               ( delay_cycles == 9'h92 ) ? shifted_signal146:
                               ( delay_cycles == 9'h93 ) ? shifted_signal147:
                               ( delay_cycles == 9'h94 ) ? shifted_signal148:
                               ( delay_cycles == 9'h95 ) ? shifted_signal149:
                               ( delay_cycles == 9'h96 ) ? shifted_signal150:
                               ( delay_cycles == 9'h97 ) ? shifted_signal151:
                               ( delay_cycles == 9'ha2 ) ? shifted_signal162:
                               ( delay_cycles == 9'ha3 ) ? shifted_signal163:
                               ( delay_cycles == 9'ha8 ) ? shifted_signal168:
                               ( delay_cycles == 9'hd ) ? shifted_signal13: (signal_in);


dff_n #(SIZE,0) dff0( .signal_in   (signal_in),
                    .signal_out  (shifted_signal1),
                    .clk (clk));
dff_n #(SIZE) dff1( .signal_in   (shifted_signal1),
                    .signal_out  (shifted_signal2),
                    .clk (clk));
dff_n #(SIZE) dff2( .signal_in   (shifted_signal2),
                    .signal_out  (shifted_signal3),
                    .clk (clk));
dff_n #(SIZE) dff3( .signal_in   (shifted_signal3),
                    .signal_out  (shifted_signal4),
                    .clk (clk));
dff_n #(SIZE) dff4( .signal_in   (shifted_signal4),
                    .signal_out  (shifted_signal5),
                    .clk (clk));
dff_n #(SIZE) dff5( .signal_in   (shifted_signal5),
                    .signal_out  (shifted_signal6),
                    .clk (clk));
dff_n #(SIZE) dff6( .signal_in   (shifted_signal6),
                    .signal_out  (shifted_signal7),
                    .clk (clk));
dff_n #(SIZE) dff7( .signal_in   (shifted_signal7),
                    .signal_out  (shifted_signal8),
                    .clk (clk));
dff_n #(SIZE) dff8( .signal_in   (shifted_signal8),
                    .signal_out  (shifted_signal9),
                    .clk (clk));
dff_n #(SIZE) dff9( .signal_in   (shifted_signal9),
                    .signal_out  (shifted_signal10),
                    .clk (clk));
dff_n #(SIZE) dff10( .signal_in   (shifted_signal10),
                    .signal_out  (shifted_signal11),
                    .clk (clk));
dff_n #(SIZE) dff11( .signal_in   (shifted_signal11),
                    .signal_out  (shifted_signal12),
                    .clk (clk));
dff_n #(SIZE) dff12( .signal_in   (shifted_signal12),
                    .signal_out  (shifted_signal13),
                    .clk (clk));
dff_n #(SIZE) dff13( .signal_in   (shifted_signal13),
                    .signal_out  (shifted_signal14),
                    .clk (clk));
dff_n #(SIZE) dff14( .signal_in   (shifted_signal14),
                    .signal_out  (shifted_signal15),
                    .clk (clk));
dff_n #(SIZE) dff15( .signal_in   (shifted_signal15),
                    .signal_out  (shifted_signal16),
                    .clk (clk));
dff_n #(SIZE) dff16( .signal_in   (shifted_signal16),
                    .signal_out  (shifted_signal17),
                    .clk (clk));
dff_n #(SIZE) dff17( .signal_in   (shifted_signal17),
                    .signal_out  (shifted_signal18),
                    .clk (clk));
dff_n #(SIZE) dff18( .signal_in   (shifted_signal18),
                    .signal_out  (shifted_signal19),
                    .clk (clk));
dff_n #(SIZE) dff19( .signal_in   (shifted_signal19),
                    .signal_out  (shifted_signal20),
                    .clk (clk));
dff_n #(SIZE) dff20( .signal_in   (shifted_signal20),
                    .signal_out  (shifted_signal21),
                    .clk (clk));
dff_n #(SIZE) dff21( .signal_in   (shifted_signal21),
                    .signal_out  (shifted_signal22),
                    .clk (clk));
dff_n #(SIZE) dff22( .signal_in   (shifted_signal22),
                    .signal_out  (shifted_signal23),
                    .clk (clk));
dff_n #(SIZE) dff23( .signal_in   (shifted_signal23),
                    .signal_out  (shifted_signal24),
                    .clk (clk));
dff_n #(SIZE) dff24( .signal_in   (shifted_signal24),
                    .signal_out  (shifted_signal25),
                    .clk (clk));
dff_n #(SIZE) dff25( .signal_in   (shifted_signal25),
                    .signal_out  (shifted_signal26),
                    .clk (clk));
dff_n #(SIZE) dff26( .signal_in   (shifted_signal26),
                    .signal_out  (shifted_signal27),
                    .clk (clk));
dff_n #(SIZE) dff27( .signal_in   (shifted_signal27),
                    .signal_out  (shifted_signal28),
                    .clk (clk));
dff_n #(SIZE) dff28( .signal_in   (shifted_signal28),
                    .signal_out  (shifted_signal29),
                    .clk (clk));
dff_n #(SIZE) dff29( .signal_in   (shifted_signal29),
                    .signal_out  (shifted_signal30),
                    .clk (clk));
dff_n #(SIZE) dff30( .signal_in   (shifted_signal30),
                    .signal_out  (shifted_signal31),
                    .clk (clk));
dff_n #(SIZE) dff31( .signal_in   (shifted_signal31),
                    .signal_out  (shifted_signal32),
                    .clk (clk));
dff_n #(SIZE) dff32( .signal_in   (shifted_signal32),
                    .signal_out  (shifted_signal33),
                    .clk (clk));
dff_n #(SIZE) dff33( .signal_in   (shifted_signal33),
                    .signal_out  (shifted_signal34),
                    .clk (clk));
dff_n #(SIZE) dff34( .signal_in   (shifted_signal34),
                    .signal_out  (shifted_signal35),
                    .clk (clk));
dff_n #(SIZE) dff35( .signal_in   (shifted_signal35),
                    .signal_out  (shifted_signal36),
                    .clk (clk));
dff_n #(SIZE) dff36( .signal_in   (shifted_signal36),
                    .signal_out  (shifted_signal37),
                    .clk (clk));
dff_n #(SIZE) dff37( .signal_in   (shifted_signal37),
                    .signal_out  (shifted_signal38),
                    .clk (clk));
dff_n #(SIZE) dff38( .signal_in   (shifted_signal38),
                    .signal_out  (shifted_signal39),
                    .clk (clk));
dff_n #(SIZE) dff39( .signal_in   (shifted_signal39),
                    .signal_out  (shifted_signal40),
                    .clk (clk));
dff_n #(SIZE) dff40( .signal_in   (shifted_signal40),
                    .signal_out  (shifted_signal41),
                    .clk (clk));
dff_n #(SIZE) dff41( .signal_in   (shifted_signal41),
                    .signal_out  (shifted_signal42),
                    .clk (clk));
dff_n #(SIZE) dff42( .signal_in   (shifted_signal42),
                    .signal_out  (shifted_signal43),
                    .clk (clk));
dff_n #(SIZE) dff43( .signal_in   (shifted_signal43),
                    .signal_out  (shifted_signal44),
                    .clk (clk));
dff_n #(SIZE) dff44( .signal_in   (shifted_signal44),
                    .signal_out  (shifted_signal45),
                    .clk (clk));
dff_n #(SIZE) dff45( .signal_in   (shifted_signal45),
                    .signal_out  (shifted_signal46),
                    .clk (clk));
dff_n #(SIZE) dff46( .signal_in   (shifted_signal46),
                    .signal_out  (shifted_signal47),
                    .clk (clk));
dff_n #(SIZE) dff47( .signal_in   (shifted_signal47),
                    .signal_out  (shifted_signal48),
                    .clk (clk));
dff_n #(SIZE) dff48( .signal_in   (shifted_signal48),
                    .signal_out  (shifted_signal49),
                    .clk (clk));
dff_n #(SIZE) dff49( .signal_in   (shifted_signal49),
                    .signal_out  (shifted_signal50),
                    .clk (clk));
dff_n #(SIZE) dff50( .signal_in   (shifted_signal50),
                    .signal_out  (shifted_signal51),
                    .clk (clk));
dff_n #(SIZE) dff51( .signal_in   (shifted_signal51),
                    .signal_out  (shifted_signal52),
                    .clk (clk));
dff_n #(SIZE) dff52( .signal_in   (shifted_signal52),
                    .signal_out  (shifted_signal53),
                    .clk (clk));
dff_n #(SIZE) dff53( .signal_in   (shifted_signal53),
                    .signal_out  (shifted_signal54),
                    .clk (clk));
dff_n #(SIZE) dff54( .signal_in   (shifted_signal54),
                    .signal_out  (shifted_signal55),
                    .clk (clk));
dff_n #(SIZE) dff55( .signal_in   (shifted_signal55),
                    .signal_out  (shifted_signal56),
                    .clk (clk));
dff_n #(SIZE) dff56( .signal_in   (shifted_signal56),
                    .signal_out  (shifted_signal57),
                    .clk (clk));
dff_n #(SIZE) dff57( .signal_in   (shifted_signal57),
                    .signal_out  (shifted_signal58),
                    .clk (clk));
dff_n #(SIZE) dff58( .signal_in   (shifted_signal58),
                    .signal_out  (shifted_signal59),
                    .clk (clk));

dff_n #(SIZE) dff59( .signal_in   (shifted_signal59),
                    .signal_out  (shifted_signal60),
                    .clk (clk));

dff_n #(SIZE) dff60( .signal_in   (shifted_signal60),
                    .signal_out  (shifted_signal61),
                    .clk (clk));
dff_n #(SIZE) dff61( .signal_in   (shifted_signal61),
                    .signal_out  (shifted_signal62),
                    .clk (clk));
dff_n #(SIZE) dff62( .signal_in   (shifted_signal62),
                    .signal_out  (shifted_signal63),
                    .clk (clk));
dff_n #(SIZE) dff63( .signal_in   (shifted_signal63),
                    .signal_out  (shifted_signal64),
                    .clk (clk));
dff_n #(SIZE) dff64( .signal_in   (shifted_signal64),
                    .signal_out  (shifted_signal65),
                    .clk (clk));
dff_n #(SIZE) dff65( .signal_in   (shifted_signal65),
                    .signal_out  (shifted_signal66),
                    .clk (clk));
dff_n #(SIZE) dff66( .signal_in   (shifted_signal66),
                    .signal_out  (shifted_signal67),
                    .clk (clk));
dff_n #(SIZE) dff67( .signal_in   (shifted_signal67),
                    .signal_out  (shifted_signal68),
                    .clk (clk));
dff_n #(SIZE) dff68( .signal_in   (shifted_signal68),
                    .signal_out  (shifted_signal69),
                    .clk (clk));
dff_n #(SIZE) dff69( .signal_in   (shifted_signal69),
                    .signal_out  (shifted_signal70),
                    .clk (clk));
dff_n #(SIZE) dff70( .signal_in   (shifted_signal70),
                    .signal_out  (shifted_signal71),
                    .clk (clk));
dff_n #(SIZE) dff71( .signal_in   (shifted_signal71),
                    .signal_out  (shifted_signal72),
                    .clk (clk));
dff_n #(SIZE) dff72( .signal_in   (shifted_signal72),
                    .signal_out  (shifted_signal73),
                    .clk (clk));
dff_n #(SIZE) dff73( .signal_in   (shifted_signal73),
                    .signal_out  (shifted_signal74),
                    .clk (clk));
dff_n #(SIZE) dff74( .signal_in   (shifted_signal74),
                    .signal_out  (shifted_signal75),
                    .clk (clk));
dff_n #(SIZE) dff75( .signal_in   (shifted_signal75),
                    .signal_out  (shifted_signal76),
                    .clk (clk));
dff_n #(SIZE) dff76( .signal_in   (shifted_signal76),
                    .signal_out  (shifted_signal77),
                    .clk (clk));
dff_n #(SIZE) dff77( .signal_in   (shifted_signal77),
                    .signal_out  (shifted_signal78),
                    .clk (clk));
dff_n #(SIZE) dff78( .signal_in   (shifted_signal78),
                    .signal_out  (shifted_signal79),
                    .clk (clk));
dff_n #(SIZE) dff79( .signal_in   (shifted_signal79),
                    .signal_out  (shifted_signal80),
                    .clk (clk));

dff_n #(SIZE) dff80( .signal_in   (shifted_signal80),
                    .signal_out  (shifted_signal81),
                    .clk (clk));
dff_n #(SIZE) dff81( .signal_in   (shifted_signal81),
                    .signal_out  (shifted_signal82),
                    .clk (clk));
dff_n #(SIZE) dff82( .signal_in   (shifted_signal82),
                    .signal_out  (shifted_signal83),
                    .clk (clk));
dff_n #(SIZE) dff83( .signal_in   (shifted_signal83),
                    .signal_out  (shifted_signal84),
                    .clk (clk));
dff_n #(SIZE) dff84( .signal_in   (shifted_signal84),
                    .signal_out  (shifted_signal85),
                    .clk (clk));
dff_n #(SIZE) dff85( .signal_in   (shifted_signal85),
                    .signal_out  (shifted_signal86),
                    .clk (clk));
dff_n #(SIZE) dff86( .signal_in   (shifted_signal86),
                    .signal_out  (shifted_signal87),
                    .clk (clk));
dff_n #(SIZE) dff87( .signal_in   (shifted_signal87),
                    .signal_out  (shifted_signal88),
                    .clk (clk));
dff_n #(SIZE) dff88( .signal_in   (shifted_signal88),
                    .signal_out  (shifted_signal89),
                    .clk (clk));
dff_n #(SIZE) dff89( .signal_in   (shifted_signal89),
                    .signal_out  (shifted_signal90),
                    .clk (clk));
dff_n #(SIZE) dff90( .signal_in   (shifted_signal90),
                    .signal_out  (shifted_signal91),
                    .clk (clk));
dff_n #(SIZE) dff91( .signal_in   (shifted_signal91),
                    .signal_out  (shifted_signal92),
                    .clk (clk));
dff_n #(SIZE) dff92( .signal_in   (shifted_signal92),
                    .signal_out  (shifted_signal93),
                    .clk (clk));
dff_n #(SIZE) dff93( .signal_in   (shifted_signal93),
                    .signal_out  (shifted_signal94),
                    .clk (clk));
dff_n #(SIZE) dff94( .signal_in   (shifted_signal94),
                    .signal_out  (shifted_signal95),
                    .clk (clk));
dff_n #(SIZE) dff95( .signal_in   (shifted_signal95),
                    .signal_out  (shifted_signal96),
                    .clk (clk));
dff_n #(SIZE) dff96( .signal_in   (shifted_signal96),
                    .signal_out  (shifted_signal97),
                    .clk (clk));
dff_n #(SIZE) dff97( .signal_in   (shifted_signal97),
                    .signal_out  (shifted_signal98),
                    .clk (clk));
dff_n #(SIZE) dff98( .signal_in   (shifted_signal98),
                    .signal_out  (shifted_signal99),
                    .clk (clk));
dff_n #(SIZE) dff99( .signal_in   (shifted_signal99),
                    .signal_out  (shifted_signal100),
                    .clk (clk));
dff_n #(SIZE) dff100( .signal_in   (shifted_signal100),
                    .signal_out  (shifted_signal101),
                    .clk (clk));
dff_n #(SIZE) dff101( .signal_in   (shifted_signal101),
                    .signal_out  (shifted_signal102),
                    .clk (clk));
dff_n #(SIZE) dff102( .signal_in   (shifted_signal102),
                    .signal_out  (shifted_signal103),
                    .clk (clk));
dff_n #(SIZE) dff103( .signal_in   (shifted_signal103),
                    .signal_out  (shifted_signal104),
                    .clk (clk));
dff_n #(SIZE) dff104( .signal_in   (shifted_signal104),
                    .signal_out  (shifted_signal105),
                    .clk (clk));
dff_n #(SIZE) dff105( .signal_in   (shifted_signal105),
                    .signal_out  (shifted_signal106),
                    .clk (clk));
dff_n #(SIZE) dff106( .signal_in   (shifted_signal106),
                    .signal_out  (shifted_signal107),
                    .clk (clk));
dff_n #(SIZE) dff107( .signal_in   (shifted_signal107),
                    .signal_out  (shifted_signal108),
                    .clk (clk));
dff_n #(SIZE) dff108( .signal_in   (shifted_signal108),
                    .signal_out  (shifted_signal109),
                    .clk (clk));
dff_n #(SIZE) dff109( .signal_in   (shifted_signal109),
                    .signal_out  (shifted_signal110),
                    .clk (clk));
dff_n #(SIZE) dff110( .signal_in   (shifted_signal110),
                    .signal_out  (shifted_signal111),
                    .clk (clk));
dff_n #(SIZE) dff111( .signal_in   (shifted_signal111),
                    .signal_out  (shifted_signal112),
                    .clk (clk));
dff_n #(SIZE) dff112( .signal_in   (shifted_signal112),
                    .signal_out  (shifted_signal113),
                    .clk (clk));
dff_n #(SIZE) dff113( .signal_in   (shifted_signal113),
                    .signal_out  (shifted_signal114),
                    .clk (clk));
dff_n #(SIZE) dff114( .signal_in   (shifted_signal114),
                    .signal_out  (shifted_signal115),
                    .clk (clk));
dff_n #(SIZE) dff115( .signal_in   (shifted_signal115),
                    .signal_out  (shifted_signal116),
                    .clk (clk));
dff_n #(SIZE) dff116( .signal_in   (shifted_signal116),
                    .signal_out  (shifted_signal117),
                    .clk (clk));
dff_n #(SIZE) dff117( .signal_in   (shifted_signal117),
                    .signal_out  (shifted_signal118),
                    .clk (clk));
dff_n #(SIZE) dff118( .signal_in   (shifted_signal118),
                    .signal_out  (shifted_signal119),
                    .clk (clk));
dff_n #(SIZE) dff119( .signal_in   (shifted_signal119),
                    .signal_out  (shifted_signal120),
                    .clk (clk));
dff_n #(SIZE) dff120( .signal_in   (shifted_signal120),
                    .signal_out  (shifted_signal121),
                    .clk (clk));
dff_n #(SIZE) dff121( .signal_in   (shifted_signal121),
                    .signal_out  (shifted_signal122),
                    .clk (clk));
dff_n #(SIZE) dff122( .signal_in   (shifted_signal122),
                    .signal_out  (shifted_signal123),
                    .clk (clk));
dff_n #(SIZE) dff123( .signal_in   (shifted_signal123),
                    .signal_out  (shifted_signal124),
                    .clk (clk));
dff_n #(SIZE) dff124( .signal_in   (shifted_signal124),
                    .signal_out  (shifted_signal125),
                    .clk (clk));
dff_n #(SIZE) dff125( .signal_in   (shifted_signal125),
                    .signal_out  (shifted_signal126),
                    .clk (clk));
dff_n #(SIZE) dff126( .signal_in   (shifted_signal126),
                    .signal_out  (shifted_signal127),
                    .clk (clk));
dff_n #(SIZE) dff127( .signal_in   (shifted_signal127),
                    .signal_out  (shifted_signal128),
                    .clk (clk));
dff_n #(SIZE) dff128( .signal_in   (shifted_signal128),
                    .signal_out  (shifted_signal129),
                    .clk (clk));
dff_n #(SIZE) dff129( .signal_in   (shifted_signal129),
                    .signal_out  (shifted_signal130),
                    .clk (clk));
dff_n #(SIZE) dff130( .signal_in   (shifted_signal130),
                    .signal_out  (shifted_signal131),
                    .clk (clk));
dff_n #(SIZE) dff131( .signal_in   (shifted_signal131),
                    .signal_out  (shifted_signal132),
                    .clk (clk));
dff_n #(SIZE) dff132( .signal_in   (shifted_signal132),
                    .signal_out  (shifted_signal133),
                    .clk (clk));
dff_n #(SIZE) dff133( .signal_in   (shifted_signal133),
                    .signal_out  (shifted_signal134),
                    .clk (clk));
dff_n #(SIZE) dff134( .signal_in   (shifted_signal134),
                    .signal_out  (shifted_signal135),
                    .clk (clk));
dff_n #(SIZE) dff135( .signal_in   (shifted_signal135),
                    .signal_out  (shifted_signal136),
                    .clk (clk));
dff_n #(SIZE) dff136( .signal_in   (shifted_signal136),
                    .signal_out  (shifted_signal137),
                    .clk (clk));
dff_n #(SIZE) dff137( .signal_in   (shifted_signal137),
                    .signal_out  (shifted_signal138),
                    .clk (clk));
dff_n #(SIZE) dff138( .signal_in   (shifted_signal138),
                    .signal_out  (shifted_signal139),
                    .clk (clk));
dff_n #(SIZE) dff139( .signal_in   (shifted_signal139),
                    .signal_out  (shifted_signal140),
                    .clk (clk));
dff_n #(SIZE) dff140( .signal_in   (shifted_signal140),
                    .signal_out  (shifted_signal141),
                    .clk (clk));
dff_n #(SIZE) dff141( .signal_in   (shifted_signal141),
                    .signal_out  (shifted_signal142),
                    .clk (clk));
dff_n #(SIZE) dff142( .signal_in   (shifted_signal142),
                    .signal_out  (shifted_signal143),
                    .clk (clk));
dff_n #(SIZE) dff143( .signal_in   (shifted_signal143),
                    .signal_out  (shifted_signal144),
                    .clk (clk));
dff_n #(SIZE) dff144( .signal_in   (shifted_signal144),
                    .signal_out  (shifted_signal145),
                    .clk (clk));
dff_n #(SIZE) dff145( .signal_in   (shifted_signal145),
                    .signal_out  (shifted_signal146),
                    .clk (clk));
dff_n #(SIZE) dff146( .signal_in   (shifted_signal146),
                    .signal_out  (shifted_signal147),
                    .clk (clk));
dff_n #(SIZE) dff147( .signal_in   (shifted_signal147),
                    .signal_out  (shifted_signal148),
                    .clk (clk));
dff_n #(SIZE) dff148( .signal_in   (shifted_signal148),
                    .signal_out  (shifted_signal149),
                    .clk (clk));
dff_n #(SIZE) dff149( .signal_in   (shifted_signal149),
                    .signal_out  (shifted_signal150),
                    .clk (clk));
dff_n #(SIZE) dff150( .signal_in   (shifted_signal150),
                    .signal_out  (shifted_signal151),
                    .clk (clk));
dff_n #(SIZE) dff151( .signal_in   (shifted_signal151),
                    .signal_out  (shifted_signal152),
                    .clk (clk));
dff_n #(SIZE) dff152( .signal_in   (shifted_signal152),
                    .signal_out  (shifted_signal153),
                    .clk (clk));
dff_n #(SIZE) dff153( .signal_in   (shifted_signal153),
                    .signal_out  (shifted_signal154),
                    .clk (clk));
dff_n #(SIZE) dff154( .signal_in   (shifted_signal154),
                    .signal_out  (shifted_signal155),
                    .clk (clk));
dff_n #(SIZE) dff155( .signal_in   (shifted_signal155),
                    .signal_out  (shifted_signal156),
                    .clk (clk));
dff_n #(SIZE) dff156( .signal_in   (shifted_signal156),
                    .signal_out  (shifted_signal157),
                    .clk (clk));
dff_n #(SIZE) dff157( .signal_in   (shifted_signal157),
                    .signal_out  (shifted_signal158),
                    .clk (clk));
dff_n #(SIZE) dff158( .signal_in   (shifted_signal158),
                    .signal_out  (shifted_signal159),
                    .clk (clk));
dff_n #(SIZE) dff159( .signal_in   (shifted_signal159),
                    .signal_out  (shifted_signal160),
                    .clk (clk));
dff_n #(SIZE) dff160( .signal_in   (shifted_signal160),
                    .signal_out  (shifted_signal161),
                    .clk (clk));
dff_n #(SIZE) dff161( .signal_in   (shifted_signal161),
                    .signal_out  (shifted_signal162),
                    .clk (clk));
dff_n #(SIZE) dff162( .signal_in   (shifted_signal162),
                    .signal_out  (shifted_signal163),
                    .clk (clk));
dff_n #(SIZE) dff163( .signal_in   (shifted_signal163),
                    .signal_out  (shifted_signal164),
                    .clk (clk));
dff_n #(SIZE) dff164( .signal_in   (shifted_signal164),
                    .signal_out  (shifted_signal165),
                    .clk (clk));
dff_n #(SIZE) dff165( .signal_in   (shifted_signal165),
                    .signal_out  (shifted_signal166),
                    .clk (clk));
dff_n #(SIZE) dff166( .signal_in   (shifted_signal166),
                    .signal_out  (shifted_signal167),
                    .clk (clk));
dff_n #(SIZE) dff167( .signal_in   (shifted_signal167),
                    .signal_out  (shifted_signal168),
                    .clk (clk));



endmodule

module shifter_p(signal_in,signal_out,delay_cycles,clk);

parameter SIZE=1;

input  [SIZE-1:0] signal_in;
output [SIZE-1:0] signal_out;
input  [9:0]      delay_cycles;
input  clk;

reg [9:0] counter;
reg [SIZE-1:0] signal_out_reg;


wire [SIZE-1:0] shifted_signal0,shifted_signal1,shifted_signal2,shifted_signal3,shifted_signal4;
wire [SIZE-1:0] shifted_signal5,shifted_signal6,shifted_signal7,shifted_signal8,shifted_signal9;
wire [SIZE-1:0] shifted_signal10,shifted_signal11,shifted_signal12,shifted_signal13,shifted_signal14;
wire [SIZE-1:0] shifted_signal15,shifted_signal16,shifted_signal17,shifted_signal18,shifted_signal19;
wire [SIZE-1:0] shifted_signal20,shifted_signal21,shifted_signal22,shifted_signal23,shifted_signal24;
wire [SIZE-1:0] shifted_signal25,shifted_signal26,shifted_signal27,shifted_signal28,shifted_signal29;
wire [SIZE-1:0] shifted_signal30,shifted_signal31,shifted_signal32,shifted_signal33,shifted_signal34;
wire [SIZE-1:0] shifted_signal35,shifted_signal36,shifted_signal37,shifted_signal38,shifted_signal39;
wire [SIZE-1:0] shifted_signal40,shifted_signal41,shifted_signal42,shifted_signal43,shifted_signal44;
wire [SIZE-1:0] shifted_signal45,shifted_signal46,shifted_signal47,shifted_signal48,shifted_signal49;
wire [SIZE-1:0] shifted_signal50,shifted_signal51,shifted_signal52,shifted_signal53,shifted_signal54;
wire [SIZE-1:0] shifted_signal55,shifted_signal56,shifted_signal57,shifted_signal58,shifted_signal59;
wire [SIZE-1:0] shifted_signal60,shifted_signal61,shifted_signal62,shifted_signal63,shifted_signal64;
wire [SIZE-1:0] shifted_signal65,shifted_signal66,shifted_signal67,shifted_signal68,shifted_signal69;
wire [SIZE-1:0] shifted_signal70,shifted_signal71,shifted_signal72,shifted_signal73,shifted_signal74;
wire [SIZE-1:0] shifted_signal75,shifted_signal76,shifted_signal77,shifted_signal78,shifted_signal79;
wire [SIZE-1:0] shifted_signal80,shifted_signal81,shifted_signal82,shifted_signal83,shifted_signal84;
wire [SIZE-1:0] shifted_signal85,shifted_signal86,shifted_signal87,shifted_signal88,shifted_signal89;
wire [SIZE-1:0] shifted_signal90,shifted_signal91,shifted_signal92,shifted_signal93,shifted_signal94;
wire [SIZE-1:0] shifted_signal95,shifted_signal96,shifted_signal97,shifted_signal98,shifted_signal99;
wire [SIZE-1:0] shifted_signal100,shifted_signal101,shifted_signal102,shifted_signal103,shifted_signal104;
wire [SIZE-1:0] shifted_signal105,shifted_signal106,shifted_signal107,shifted_signal108,shifted_signal109;
wire [SIZE-1:0] shifted_signal110,shifted_signal111,shifted_signal112,shifted_signal113,shifted_signal114;
wire [SIZE-1:0] shifted_signal115,shifted_signal116,shifted_signal117,shifted_signal118,shifted_signal119;
wire [SIZE-1:0] shifted_signal120,shifted_signal121,shifted_signal122,shifted_signal123,shifted_signal124;
wire [SIZE-1:0] shifted_signal125,shifted_signal126,shifted_signal127,shifted_signal128,shifted_signal129;
wire [SIZE-1:0] shifted_signal130,shifted_signal131,shifted_signal132,shifted_signal133,shifted_signal134;
wire [SIZE-1:0] shifted_signal135,shifted_signal136,shifted_signal137,shifted_signal138,shifted_signal139;
wire [SIZE-1:0] shifted_signal140,shifted_signal141,shifted_signal142,shifted_signal143,shifted_signal144;
wire [SIZE-1:0] shifted_signal145,shifted_signal146,shifted_signal147,shifted_signal148,shifted_signal149;
wire [SIZE-1:0] shifted_signal150,shifted_signal151,shifted_signal152,shifted_signal153,shifted_signal154;
wire [SIZE-1:0] shifted_signal155,shifted_signal156,shifted_signal157,shifted_signal158,shifted_signal159;
wire [SIZE-1:0] shifted_signal160,shifted_signal161,shifted_signal162,shifted_signal163,shifted_signal164;
wire [SIZE-1:0] shifted_signal165,shifted_signal166,shifted_signal167,shifted_signal168,shifted_signal169;
wire [SIZE-1:0] shifted_signal170,shifted_signal171,shifted_signal172,shifted_signal173,shifted_signal174;
wire [SIZE-1:0] shifted_signal175,shifted_signal176,shifted_signal177,shifted_signal178,shifted_signal179;

wire [SIZE-1:0] shifted_signal180,shifted_signal181,shifted_signal182,shifted_signal183,shifted_signal184;
wire [SIZE-1:0] shifted_signal185,shifted_signal186,shifted_signal187,shifted_signal188,shifted_signal189;

wire [SIZE-1:0] shifted_signal190,shifted_signal191,shifted_signal192,shifted_signal193,shifted_signal194;
wire [SIZE-1:0] shifted_signal195,shifted_signal196,shifted_signal197,shifted_signal198,shifted_signal199;
wire [SIZE-1:0] shifted_signal200;


initial counter=0;




assign            signal_out = //( delay_cycles == 9'h0 ) ? shifted_signal1:
                               ( delay_cycles == 9'h1 ) ? shifted_signal1:
                               ( delay_cycles == 9'h2 ) ? shifted_signal2:
                               ( delay_cycles == 9'h3 ) ? shifted_signal3:
                               ( delay_cycles == 9'h4 ) ? shifted_signal4:
                               ( delay_cycles == 9'h5 ) ? shifted_signal5:
                               ( delay_cycles == 9'h6 ) ? shifted_signal6:
                               ( delay_cycles == 9'h7 ) ? shifted_signal7:
                               ( delay_cycles == 9'h8 ) ? shifted_signal8:
                               ( delay_cycles == 9'h9 ) ? shifted_signal9:
                               ( delay_cycles == 9'ha ) ? shifted_signal10:
                               ( delay_cycles == 9'hb ) ? shifted_signal11:
                               ( delay_cycles == 9'hc ) ? shifted_signal12:
                               ( delay_cycles == 9'hd ) ? shifted_signal13:
                               ( delay_cycles == 9'he ) ? shifted_signal14:
                               ( delay_cycles == 9'hf ) ? shifted_signal15:
                               ( delay_cycles == 9'h10 ) ? shifted_signal16:
                               ( delay_cycles == 9'h11 ) ? shifted_signal17:
                               ( delay_cycles == 9'h12 ) ? shifted_signal18:
                               ( delay_cycles == 9'h13 ) ? shifted_signal19:
                               ( delay_cycles == 9'h14 ) ? shifted_signal20:
                               ( delay_cycles == 9'h15 ) ? shifted_signal21:
                               ( delay_cycles == 9'h16 ) ? shifted_signal22:
                               ( delay_cycles == 9'h17 ) ? shifted_signal23:
                               ( delay_cycles == 9'h18 ) ? shifted_signal24:
                               ( delay_cycles == 9'h19 ) ? shifted_signal25:
                               ( delay_cycles == 9'h1a ) ? shifted_signal26:
                               ( delay_cycles == 9'h1b ) ? shifted_signal27:
                               ( delay_cycles == 9'h1c ) ? shifted_signal28:
                               ( delay_cycles == 9'h1d ) ? shifted_signal29:
                               ( delay_cycles == 9'h1e ) ? shifted_signal30:
                               ( delay_cycles == 9'h1f ) ? shifted_signal31:
                               ( delay_cycles == 9'h20 ) ? shifted_signal32:
                               ( delay_cycles == 9'h21 ) ? shifted_signal33:
                               ( delay_cycles == 9'h22 ) ? shifted_signal34:
                               ( delay_cycles == 9'h23 ) ? shifted_signal35:
                               ( delay_cycles == 9'h24 ) ? shifted_signal36:
                               ( delay_cycles == 9'h25 ) ? shifted_signal37:
                               ( delay_cycles == 9'h26 ) ? shifted_signal38:
                               ( delay_cycles == 9'h27 ) ? shifted_signal39:
                               ( delay_cycles == 9'h28 ) ? shifted_signal40:
                               ( delay_cycles == 9'h29 ) ? shifted_signal41:
                               ( delay_cycles == 9'h2a ) ? shifted_signal42:
                               ( delay_cycles == 9'h2b ) ? shifted_signal43:
                               ( delay_cycles == 9'h2c ) ? shifted_signal44:
                               ( delay_cycles == 9'h30 ) ? shifted_signal48:
                               ( delay_cycles == 9'h36 ) ? shifted_signal54:
                               ( delay_cycles == 9'h37 ) ? shifted_signal55:
                               ( delay_cycles == 9'h44 ) ? shifted_signal68:
                               ( delay_cycles == 9'h45 ) ? shifted_signal69:
                               ( delay_cycles == 9'h48 ) ? shifted_signal72:
                               ( delay_cycles == 9'h49 ) ? shifted_signal73:
                               ( delay_cycles == 9'h4e ) ? shifted_signal78:
                               ( delay_cycles == 9'h4f ) ? shifted_signal79:
                               ( delay_cycles == 9'h50 ) ? shifted_signal80:
                               ( delay_cycles == 9'h51 ) ? shifted_signal81:
                               ( delay_cycles == 9'h52 ) ? shifted_signal82:
                               ( delay_cycles == 9'h53 ) ? shifted_signal83:
                               ( delay_cycles == 9'h54 ) ? shifted_signal84:
                               ( delay_cycles == 9'h55 ) ? shifted_signal85:
                               ( delay_cycles == 9'h56 ) ? shifted_signal86:
                               ( delay_cycles == 9'h57 ) ? shifted_signal87:
                               ( delay_cycles == 9'h58 ) ? shifted_signal88:
                               ( delay_cycles == 9'h59 ) ? shifted_signal89:
                               ( delay_cycles == 9'h5a ) ? shifted_signal90:
                               ( delay_cycles == 9'h5b ) ? shifted_signal91:  //  AL+CL=3 latency for nb_encode block
                               ( delay_cycles == 9'h5c ) ? shifted_signal92:
                               ( delay_cycles == 9'h5d ) ? shifted_signal93:
                               ( delay_cycles == 9'h5e ) ? shifted_signal94:
                               ( delay_cycles == 9'h5f ) ? shifted_signal95:
                               ( delay_cycles == 9'h60 ) ? shifted_signal96:
                               ( delay_cycles == 9'h61 ) ? shifted_signal97:
                               ( delay_cycles == 9'h62 ) ? shifted_signal98:
                               ( delay_cycles == 9'h63 ) ? shifted_signal99:
                               ( delay_cycles == 9'h64 ) ? shifted_signal100:
                               ( delay_cycles == 9'h65 ) ? shifted_signal101:
                               ( delay_cycles == 9'h66 ) ? shifted_signal102:
                               ( delay_cycles == 9'h67 ) ? shifted_signal103:  // AL+CL=4 latency for nb_encode block
                               ( delay_cycles == 9'h68 ) ? shifted_signal104:
                               ( delay_cycles == 9'h69 ) ? shifted_signal105:
                               ( delay_cycles == 9'h6a ) ? shifted_signal106:
                               ( delay_cycles == 9'h6b ) ? shifted_signal107:
                               ( delay_cycles == 9'h6c ) ? shifted_signal108:
                               ( delay_cycles == 9'h6d ) ? shifted_signal109:
                               ( delay_cycles == 9'h6e ) ? shifted_signal110:
                               ( delay_cycles == 9'h6f ) ? shifted_signal111:
                               ( delay_cycles == 9'h70 ) ? shifted_signal112:
                               ( delay_cycles == 9'h71 ) ? shifted_signal113:
                               ( delay_cycles == 9'h72 ) ? shifted_signal114:
                               ( delay_cycles == 9'h73 ) ? shifted_signal115:  // AL+CL=5 latency for nb_encode block
                               ( delay_cycles == 9'h74 ) ? shifted_signal116:
                               ( delay_cycles == 9'h78 ) ? shifted_signal120:
                               ( delay_cycles == 9'h79 ) ? shifted_signal121:
                               ( delay_cycles == 9'h7a ) ? shifted_signal122:
                               ( delay_cycles == 9'h7b ) ? shifted_signal123:
                               ( delay_cycles == 9'h7c ) ? shifted_signal124:
                               ( delay_cycles == 9'h7d ) ? shifted_signal125:
                               ( delay_cycles == 9'h7e ) ? shifted_signal126:
                               ( delay_cycles == 9'h7f ) ? shifted_signal127:  // AL+CL=6 latency for nb_encode block
                               ( delay_cycles == 9'h80 ) ? shifted_signal128:
                               ( delay_cycles == 9'h81 ) ? shifted_signal129:
                               ( delay_cycles == 9'h82 ) ? shifted_signal130:
                               ( delay_cycles == 9'h83 ) ? shifted_signal131:
                               ( delay_cycles == 9'h84 ) ? shifted_signal132:
                               ( delay_cycles == 9'h85 ) ? shifted_signal133:
                               ( delay_cycles == 9'h86 ) ? shifted_signal134:
                               ( delay_cycles == 9'h87 ) ? shifted_signal135:
                               ( delay_cycles == 9'h88 ) ? shifted_signal136:
                               ( delay_cycles == 9'h89 ) ? shifted_signal137:
                               ( delay_cycles == 9'h8a ) ? shifted_signal138:
                               ( delay_cycles == 9'h8b ) ? shifted_signal139: // AL+CL=7 latency for nb_encode block
                               ( delay_cycles == 9'h8c ) ? shifted_signal140:
                               ( delay_cycles == 9'h8d ) ? shifted_signal141:
                               ( delay_cycles == 9'h8e ) ? shifted_signal142:
                               ( delay_cycles == 9'h8f ) ? shifted_signal143:
                               ( delay_cycles == 9'h90 ) ? shifted_signal144:
                               ( delay_cycles == 9'h91 ) ? shifted_signal145:
                               ( delay_cycles == 9'h92 ) ? shifted_signal146:
                               ( delay_cycles == 9'h93 ) ? shifted_signal147:
                               ( delay_cycles == 9'h94 ) ? shifted_signal148:
                               ( delay_cycles == 9'h95 ) ? shifted_signal149:
                               ( delay_cycles == 9'h96 ) ? shifted_signal150:
                               ( delay_cycles == 9'h97 ) ? shifted_signal151:  // AL+CL=8 latency for nb_encode block
                               ( delay_cycles == 9'h98 ) ? shifted_signal152:
                               ( delay_cycles == 9'h99 ) ? shifted_signal153:
                               ( delay_cycles == 9'h9a ) ? shifted_signal154:
                               ( delay_cycles == 9'h9b ) ? shifted_signal155:
                               ( delay_cycles == 9'h9c ) ? shifted_signal156:
                               ( delay_cycles == 9'h9d ) ? shifted_signal157:
                               ( delay_cycles == 9'h9e ) ? shifted_signal158:
                               ( delay_cycles == 9'ha3 ) ? shifted_signal163: // AL+CL=9 latency for nb_encode block
                               ( delay_cycles == 9'ha4 ) ? shifted_signal164:
                               ( delay_cycles == 9'ha5 ) ? shifted_signal165:
                               ( delay_cycles == 9'ha6 ) ? shifted_signal166:
                               ( delay_cycles == 9'ha7 ) ? shifted_signal167:
                               ( delay_cycles == 9'ha8 ) ? shifted_signal168:
                               ( delay_cycles == 9'ha9 ) ? shifted_signal169:
                               ( delay_cycles == 9'haa ) ? shifted_signal170:
                               ( delay_cycles == 9'hab ) ? shifted_signal171:
                               ( delay_cycles == 9'hac ) ? shifted_signal172:
                               ( delay_cycles == 9'had ) ? shifted_signal173:
                               ( delay_cycles == 9'hae ) ? shifted_signal174:
                               ( delay_cycles == 9'haf ) ? shifted_signal175: //  AL+CL=10 latency for nb_encode block
                               ( delay_cycles == 9'hb0 ) ? shifted_signal176:
                               ( delay_cycles == 9'hb1 ) ? shifted_signal177:
                               ( delay_cycles == 9'hb2 ) ? shifted_signal178:
                               ( delay_cycles == 9'hb3 ) ? shifted_signal179:
                               ( delay_cycles == 9'hbb ) ? shifted_signal187: //  AL+CL=11 latency for nb_encode block
                               ( delay_cycles == 9'hc7 ) ? shifted_signal199: //  AL+CL=12 latency for nb_encode block
                               ( delay_cycles == 9'hd ) ? shifted_signal13: (signal_in);


dff_p #(SIZE,0) dff0( .signal_in   (signal_in),
                    .signal_out  (shifted_signal1),
                    .clk (clk));
dff_p #(SIZE) dff1( .signal_in   (shifted_signal1),
                    .signal_out  (shifted_signal2),
                    .clk (clk));
dff_p #(SIZE) dff2( .signal_in   (shifted_signal2),
                    .signal_out  (shifted_signal3),
                    .clk (clk));
dff_p #(SIZE) dff3( .signal_in   (shifted_signal3),
                    .signal_out  (shifted_signal4),
                    .clk (clk));
dff_p #(SIZE) dff4( .signal_in   (shifted_signal4),
                    .signal_out  (shifted_signal5),
                    .clk (clk));
dff_p #(SIZE) dff5( .signal_in   (shifted_signal5),
                    .signal_out  (shifted_signal6),
                    .clk (clk));
dff_p #(SIZE) dff6( .signal_in   (shifted_signal6),
                    .signal_out  (shifted_signal7),
                    .clk (clk));

dff_p #(SIZE) dff7( .signal_in   (shifted_signal7),
                    .signal_out  (shifted_signal8),
                    .clk (clk));


dff_p #(SIZE) dff8( .signal_in   (shifted_signal8),
                    .signal_out  (shifted_signal9),
                    .clk (clk));
dff_p #(SIZE) dff9( .signal_in   (shifted_signal9),
                    .signal_out  (shifted_signal10),
                    .clk (clk));
dff_p #(SIZE) dff10( .signal_in   (shifted_signal10),
                    .signal_out  (shifted_signal11),
                    .clk (clk));
dff_p #(SIZE) dff11( .signal_in   (shifted_signal11),
                    .signal_out  (shifted_signal12),
                    .clk (clk));


dff_p #(SIZE) dff12( .signal_in   (shifted_signal12),
                    .signal_out  (shifted_signal13),
                    .clk (clk));
dff_p #(SIZE) dff13( .signal_in   (shifted_signal13),
                    .signal_out  (shifted_signal14),
                    .clk (clk));
dff_p #(SIZE) dff14( .signal_in   (shifted_signal14),
                    .signal_out  (shifted_signal15),
                    .clk (clk));

`ifdef AXIS_FBDIMM_HW
`else

dff_p #(SIZE) dff15( .signal_in   (shifted_signal15),
                    .signal_out  (shifted_signal16),
                    .clk (clk));
dff_p #(SIZE) dff16( .signal_in   (shifted_signal16),
                    .signal_out  (shifted_signal17),
                    .clk (clk));
dff_p #(SIZE) dff17( .signal_in   (shifted_signal17),
                    .signal_out  (shifted_signal18),
                    .clk (clk));
dff_p #(SIZE) dff18( .signal_in   (shifted_signal18),
                    .signal_out  (shifted_signal19),
                    .clk (clk));
dff_p #(SIZE) dff19( .signal_in   (shifted_signal19),
                    .signal_out  (shifted_signal20),
                    .clk (clk));
dff_p #(SIZE) dff20( .signal_in   (shifted_signal20),
                    .signal_out  (shifted_signal21),
                    .clk (clk));
dff_p #(SIZE) dff21( .signal_in   (shifted_signal21),
                    .signal_out  (shifted_signal22),
                    .clk (clk));
dff_p #(SIZE) dff22( .signal_in   (shifted_signal22),
                    .signal_out  (shifted_signal23),
                    .clk (clk));
dff_p #(SIZE) dff23( .signal_in   (shifted_signal23),
                    .signal_out  (shifted_signal24),
                    .clk (clk));
dff_p #(SIZE) dff24( .signal_in   (shifted_signal24),
                    .signal_out  (shifted_signal25),
                    .clk (clk));
dff_p #(SIZE) dff25( .signal_in   (shifted_signal25),
                    .signal_out  (shifted_signal26),
                    .clk (clk));
dff_p #(SIZE) dff26( .signal_in   (shifted_signal26),
                    .signal_out  (shifted_signal27),
                    .clk (clk));
dff_p #(SIZE) dff27( .signal_in   (shifted_signal27),
                    .signal_out  (shifted_signal28),
                    .clk (clk));
dff_p #(SIZE) dff28( .signal_in   (shifted_signal28),
                    .signal_out  (shifted_signal29),
                    .clk (clk));
dff_p #(SIZE) dff29( .signal_in   (shifted_signal29),
                    .signal_out  (shifted_signal30),
                    .clk (clk));
dff_p #(SIZE) dff30( .signal_in   (shifted_signal30),
                    .signal_out  (shifted_signal31),
                    .clk (clk));
dff_p #(SIZE) dff31( .signal_in   (shifted_signal31),
                    .signal_out  (shifted_signal32),
                    .clk (clk));
dff_p #(SIZE) dff32( .signal_in   (shifted_signal32),
                    .signal_out  (shifted_signal33),
                    .clk (clk));
dff_p #(SIZE) dff33( .signal_in   (shifted_signal33),
                    .signal_out  (shifted_signal34),
                    .clk (clk));
dff_p #(SIZE) dff34( .signal_in   (shifted_signal34),
                    .signal_out  (shifted_signal35),
                    .clk (clk));
dff_p #(SIZE) dff35( .signal_in   (shifted_signal35),
                    .signal_out  (shifted_signal36),
                    .clk (clk));
dff_p #(SIZE) dff36( .signal_in   (shifted_signal36),
                    .signal_out  (shifted_signal37),
                    .clk (clk));
dff_p #(SIZE) dff37( .signal_in   (shifted_signal37),
                    .signal_out  (shifted_signal38),
                    .clk (clk));
dff_p #(SIZE) dff38( .signal_in   (shifted_signal38),
                    .signal_out  (shifted_signal39),
                    .clk (clk));
dff_p #(SIZE) dff39( .signal_in   (shifted_signal39),
                    .signal_out  (shifted_signal40),
                    .clk (clk));
dff_p #(SIZE) dff40( .signal_in   (shifted_signal40),
                    .signal_out  (shifted_signal41),
                    .clk (clk));
dff_p #(SIZE) dff41( .signal_in   (shifted_signal41),
                    .signal_out  (shifted_signal42),
                    .clk (clk));
dff_p #(SIZE) dff42( .signal_in   (shifted_signal42),
                    .signal_out  (shifted_signal43),
                    .clk (clk));
dff_p #(SIZE) dff43( .signal_in   (shifted_signal43),
                    .signal_out  (shifted_signal44),
                    .clk (clk));
dff_p #(SIZE) dff44( .signal_in   (shifted_signal44),
                    .signal_out  (shifted_signal45),
                    .clk (clk));
dff_p #(SIZE) dff45( .signal_in   (shifted_signal45),
                    .signal_out  (shifted_signal46),
                    .clk (clk));
dff_p #(SIZE) dff46( .signal_in   (shifted_signal46),
                    .signal_out  (shifted_signal47),
                    .clk (clk));
dff_p #(SIZE) dff47( .signal_in   (shifted_signal47),
                    .signal_out  (shifted_signal48),
                    .clk (clk));
dff_p #(SIZE) dff48( .signal_in   (shifted_signal48),
                    .signal_out  (shifted_signal49),
                    .clk (clk));
dff_p #(SIZE) dff49( .signal_in   (shifted_signal49),
                    .signal_out  (shifted_signal50),
                    .clk (clk));
dff_p #(SIZE) dff50( .signal_in   (shifted_signal50),
                    .signal_out  (shifted_signal51),
                    .clk (clk));
dff_p #(SIZE) dff51( .signal_in   (shifted_signal51),
                    .signal_out  (shifted_signal52),
                    .clk (clk));
dff_p #(SIZE) dff52( .signal_in   (shifted_signal52),
                    .signal_out  (shifted_signal53),
                    .clk (clk));
dff_p #(SIZE) dff53( .signal_in   (shifted_signal53),
                    .signal_out  (shifted_signal54),
                    .clk (clk));
dff_p #(SIZE) dff54( .signal_in   (shifted_signal54),
                    .signal_out  (shifted_signal55),
                    .clk (clk));
dff_p #(SIZE) dff55( .signal_in   (shifted_signal55),
                    .signal_out  (shifted_signal56),
                    .clk (clk));
dff_p #(SIZE) dff56( .signal_in   (shifted_signal56),
                    .signal_out  (shifted_signal57),
                    .clk (clk));
dff_p #(SIZE) dff57( .signal_in   (shifted_signal57),
                    .signal_out  (shifted_signal58),
                    .clk (clk));
dff_p #(SIZE) dff58( .signal_in   (shifted_signal58),
                    .signal_out  (shifted_signal59),
                    .clk (clk));

dff_p #(SIZE) dff59( .signal_in   (shifted_signal59),
                    .signal_out  (shifted_signal60),
                    .clk (clk));

dff_p #(SIZE) dff60( .signal_in   (shifted_signal60),
                    .signal_out  (shifted_signal61),
                    .clk (clk));
dff_p #(SIZE) dff61( .signal_in   (shifted_signal61),
                    .signal_out  (shifted_signal62),
                    .clk (clk));
dff_p #(SIZE) dff62( .signal_in   (shifted_signal62),
                    .signal_out  (shifted_signal63),
                    .clk (clk));
dff_p #(SIZE) dff63( .signal_in   (shifted_signal63),
                    .signal_out  (shifted_signal64),
                    .clk (clk));
dff_p #(SIZE) dff64( .signal_in   (shifted_signal64),
                    .signal_out  (shifted_signal65),
                    .clk (clk));
dff_p #(SIZE) dff65( .signal_in   (shifted_signal65),
                    .signal_out  (shifted_signal66),
                    .clk (clk));
dff_p #(SIZE) dff66( .signal_in   (shifted_signal66),
                    .signal_out  (shifted_signal67),
                    .clk (clk));
dff_p #(SIZE) dff67( .signal_in   (shifted_signal67),
                    .signal_out  (shifted_signal68),
                    .clk (clk));
dff_p #(SIZE) dff68( .signal_in   (shifted_signal68),
                    .signal_out  (shifted_signal69),
                    .clk (clk));
dff_p #(SIZE) dff69( .signal_in   (shifted_signal69),
                    .signal_out  (shifted_signal70),
                    .clk (clk));
dff_p #(SIZE) dff70( .signal_in   (shifted_signal70),
                    .signal_out  (shifted_signal71),
                    .clk (clk));
dff_p #(SIZE) dff71( .signal_in   (shifted_signal71),
                    .signal_out  (shifted_signal72),
                    .clk (clk));
dff_p #(SIZE) dff72( .signal_in   (shifted_signal72),
                    .signal_out  (shifted_signal73),
                    .clk (clk));
dff_p #(SIZE) dff73( .signal_in   (shifted_signal73),
                    .signal_out  (shifted_signal74),
                    .clk (clk));
dff_p #(SIZE) dff74( .signal_in   (shifted_signal74),
                    .signal_out  (shifted_signal75),
                    .clk (clk));
dff_p #(SIZE) dff75( .signal_in   (shifted_signal75),
                    .signal_out  (shifted_signal76),
                    .clk (clk));
dff_p #(SIZE) dff76( .signal_in   (shifted_signal76),
                    .signal_out  (shifted_signal77),
                    .clk (clk));
dff_p #(SIZE) dff77( .signal_in   (shifted_signal77),
                    .signal_out  (shifted_signal78),
                    .clk (clk));
dff_p #(SIZE) dff78( .signal_in   (shifted_signal78),
                    .signal_out  (shifted_signal79),
                    .clk (clk));
dff_p #(SIZE) dff79( .signal_in   (shifted_signal79),
                    .signal_out  (shifted_signal80),
                    .clk (clk));

dff_p #(SIZE) dff80( .signal_in   (shifted_signal80),
                    .signal_out  (shifted_signal81),
                    .clk (clk));
dff_p #(SIZE) dff81( .signal_in   (shifted_signal81),
                    .signal_out  (shifted_signal82),
                    .clk (clk));
dff_p #(SIZE) dff82( .signal_in   (shifted_signal82),
                    .signal_out  (shifted_signal83),
                    .clk (clk));
dff_p #(SIZE) dff83( .signal_in   (shifted_signal83),
                    .signal_out  (shifted_signal84),
                    .clk (clk));
dff_p #(SIZE) dff84( .signal_in   (shifted_signal84),
                    .signal_out  (shifted_signal85),
                    .clk (clk));
dff_p #(SIZE) dff85( .signal_in   (shifted_signal85),
                    .signal_out  (shifted_signal86),
                    .clk (clk));
dff_p #(SIZE) dff86( .signal_in   (shifted_signal86),
                    .signal_out  (shifted_signal87),
                    .clk (clk));
dff_p #(SIZE) dff87( .signal_in   (shifted_signal87),
                    .signal_out  (shifted_signal88),
                    .clk (clk));
dff_p #(SIZE) dff88( .signal_in   (shifted_signal88),
                    .signal_out  (shifted_signal89),
                    .clk (clk));
dff_p #(SIZE) dff89( .signal_in   (shifted_signal89),
                    .signal_out  (shifted_signal90),
                    .clk (clk));
dff_p #(SIZE) dff90( .signal_in   (shifted_signal90),
                    .signal_out  (shifted_signal91),
                    .clk (clk));
dff_p #(SIZE) dff91( .signal_in   (shifted_signal91),
                    .signal_out  (shifted_signal92),
                    .clk (clk));
dff_p #(SIZE) dff92( .signal_in   (shifted_signal92),
                    .signal_out  (shifted_signal93),
                    .clk (clk));
dff_p #(SIZE) dff93( .signal_in   (shifted_signal93),
                    .signal_out  (shifted_signal94),
                    .clk (clk));
dff_p #(SIZE) dff94( .signal_in   (shifted_signal94),
                    .signal_out  (shifted_signal95),
                    .clk (clk));
dff_p #(SIZE) dff95( .signal_in   (shifted_signal95),
                    .signal_out  (shifted_signal96),
                    .clk (clk));
dff_p #(SIZE) dff96( .signal_in   (shifted_signal96),
                    .signal_out  (shifted_signal97),
                    .clk (clk));
dff_p #(SIZE) dff97( .signal_in   (shifted_signal97),
                    .signal_out  (shifted_signal98),
                    .clk (clk));
dff_p #(SIZE) dff98( .signal_in   (shifted_signal98),
                    .signal_out  (shifted_signal99),
                    .clk (clk));
dff_p #(SIZE) dff99( .signal_in   (shifted_signal99),
                    .signal_out  (shifted_signal100),
                    .clk (clk));
dff_p #(SIZE) dff100( .signal_in   (shifted_signal100),
                    .signal_out  (shifted_signal101),
                    .clk (clk));
dff_p #(SIZE) dff101( .signal_in   (shifted_signal101),
                    .signal_out  (shifted_signal102),
                    .clk (clk));
dff_p #(SIZE) dff102( .signal_in   (shifted_signal102),
                    .signal_out  (shifted_signal103),
                    .clk (clk));
dff_p #(SIZE) dff103( .signal_in   (shifted_signal103),
                    .signal_out  (shifted_signal104),
                    .clk (clk));
dff_p #(SIZE) dff104( .signal_in   (shifted_signal104),
                    .signal_out  (shifted_signal105),
                    .clk (clk));
dff_p #(SIZE) dff105( .signal_in   (shifted_signal105),
                    .signal_out  (shifted_signal106),
                    .clk (clk));
dff_p #(SIZE) dff106( .signal_in   (shifted_signal106),
                    .signal_out  (shifted_signal107),
                    .clk (clk));
dff_p #(SIZE) dff107( .signal_in   (shifted_signal107),
                    .signal_out  (shifted_signal108),
                    .clk (clk));
dff_p #(SIZE) dff108( .signal_in   (shifted_signal108),
                    .signal_out  (shifted_signal109),
                    .clk (clk));
dff_p #(SIZE) dff109( .signal_in   (shifted_signal109),
                    .signal_out  (shifted_signal110),
                    .clk (clk));
dff_p #(SIZE) dff110( .signal_in   (shifted_signal110),
                    .signal_out  (shifted_signal111),
                    .clk (clk));
dff_p #(SIZE) dff111( .signal_in   (shifted_signal111),
                    .signal_out  (shifted_signal112),
                    .clk (clk));
dff_p #(SIZE) dff112( .signal_in   (shifted_signal112),
                    .signal_out  (shifted_signal113),
                    .clk (clk));
dff_p #(SIZE) dff113( .signal_in   (shifted_signal113),
                    .signal_out  (shifted_signal114),
                    .clk (clk));
dff_p #(SIZE) dff114( .signal_in   (shifted_signal114),
                    .signal_out  (shifted_signal115),
                    .clk (clk));
dff_p #(SIZE) dff115( .signal_in   (shifted_signal115),
                    .signal_out  (shifted_signal116),
                    .clk (clk));
dff_p #(SIZE) dff116( .signal_in   (shifted_signal116),
                    .signal_out  (shifted_signal117),
                    .clk (clk));
dff_p #(SIZE) dff117( .signal_in   (shifted_signal117),
                    .signal_out  (shifted_signal118),
                    .clk (clk));
dff_p #(SIZE) dff118( .signal_in   (shifted_signal118),
                    .signal_out  (shifted_signal119),
                    .clk (clk));
dff_p #(SIZE) dff119( .signal_in   (shifted_signal119),
                    .signal_out  (shifted_signal120),
                    .clk (clk));
dff_p #(SIZE) dff120( .signal_in   (shifted_signal120),
                    .signal_out  (shifted_signal121),
                    .clk (clk));
dff_p #(SIZE) dff121( .signal_in   (shifted_signal121),
                    .signal_out  (shifted_signal122),
                    .clk (clk));
dff_p #(SIZE) dff122( .signal_in   (shifted_signal122),
                    .signal_out  (shifted_signal123),
                    .clk (clk));
dff_p #(SIZE) dff123( .signal_in   (shifted_signal123),
                    .signal_out  (shifted_signal124),
                    .clk (clk));
dff_p #(SIZE) dff124( .signal_in   (shifted_signal124),
                    .signal_out  (shifted_signal125),
                    .clk (clk));
dff_p #(SIZE) dff125( .signal_in   (shifted_signal125),
                    .signal_out  (shifted_signal126),
                    .clk (clk));
dff_p #(SIZE) dff126( .signal_in   (shifted_signal126),
                    .signal_out  (shifted_signal127),
                    .clk (clk));
dff_p #(SIZE) dff127( .signal_in   (shifted_signal127),
                    .signal_out  (shifted_signal128),
                    .clk (clk));
dff_p #(SIZE) dff128( .signal_in   (shifted_signal128),
                    .signal_out  (shifted_signal129),
                    .clk (clk));
dff_p #(SIZE) dff129( .signal_in   (shifted_signal129),
                    .signal_out  (shifted_signal130),
                    .clk (clk));
dff_p #(SIZE) dff130( .signal_in   (shifted_signal130),
                    .signal_out  (shifted_signal131),
                    .clk (clk));
dff_p #(SIZE) dff131( .signal_in   (shifted_signal131),
                    .signal_out  (shifted_signal132),
                    .clk (clk));
dff_p #(SIZE) dff132( .signal_in   (shifted_signal132),
                    .signal_out  (shifted_signal133),
                    .clk (clk));
dff_p #(SIZE) dff133( .signal_in   (shifted_signal133),
                    .signal_out  (shifted_signal134),
                    .clk (clk));
dff_p #(SIZE) dff134( .signal_in   (shifted_signal134),
                    .signal_out  (shifted_signal135),
                    .clk (clk));
dff_p #(SIZE) dff135( .signal_in   (shifted_signal135),
                    .signal_out  (shifted_signal136),
                    .clk (clk));
dff_p #(SIZE) dff136( .signal_in   (shifted_signal136),
                    .signal_out  (shifted_signal137),
                    .clk (clk));
dff_p #(SIZE) dff137( .signal_in   (shifted_signal137),
                    .signal_out  (shifted_signal138),
                    .clk (clk));
dff_p #(SIZE) dff138( .signal_in   (shifted_signal138),
                    .signal_out  (shifted_signal139),
                    .clk (clk));
dff_p #(SIZE) dff139( .signal_in   (shifted_signal139),
                    .signal_out  (shifted_signal140),
                    .clk (clk));
dff_p #(SIZE) dff140( .signal_in   (shifted_signal140),
                    .signal_out  (shifted_signal141),
                    .clk (clk));
dff_p #(SIZE) dff141( .signal_in   (shifted_signal141),
                    .signal_out  (shifted_signal142),
                    .clk (clk));
dff_p #(SIZE) dff142( .signal_in   (shifted_signal142),
                    .signal_out  (shifted_signal143),
                    .clk (clk));
dff_p #(SIZE) dff143( .signal_in   (shifted_signal143),
                    .signal_out  (shifted_signal144),
                    .clk (clk));
dff_p #(SIZE) dff144( .signal_in   (shifted_signal144),
                    .signal_out  (shifted_signal145),
                    .clk (clk));
dff_p #(SIZE) dff145( .signal_in   (shifted_signal145),
                    .signal_out  (shifted_signal146),
                    .clk (clk));
dff_p #(SIZE) dff146( .signal_in   (shifted_signal145),
                    .signal_out  (shifted_signal146),
                    .clk (clk));
dff_p #(SIZE) dff147( .signal_in   (shifted_signal146),
                    .signal_out  (shifted_signal147),
                    .clk (clk));
dff_p #(SIZE) dff148( .signal_in   (shifted_signal147),
                    .signal_out  (shifted_signal148),
                    .clk (clk));
dff_p #(SIZE) dff149( .signal_in   (shifted_signal148),
                    .signal_out  (shifted_signal149),
                    .clk (clk));
dff_p #(SIZE) dff150( .signal_in   (shifted_signal149),
                    .signal_out  (shifted_signal150),
                    .clk (clk));
dff_p #(SIZE) dff151( .signal_in   (shifted_signal150),
                    .signal_out  (shifted_signal151),
                    .clk (clk));
dff_p #(SIZE) dff152( .signal_in   (shifted_signal151),
                    .signal_out  (shifted_signal152),
                    .clk (clk));
dff_p #(SIZE) dff153( .signal_in   (shifted_signal152),
                    .signal_out  (shifted_signal153),
                    .clk (clk));
dff_p #(SIZE) dff154( .signal_in   (shifted_signal153),
                    .signal_out  (shifted_signal154),
                    .clk (clk));

dff_p #(SIZE) dff155( .signal_in   (shifted_signal154),
                    .signal_out  (shifted_signal155),
                    .clk (clk));

dff_p #(SIZE) dff156( .signal_in   (shifted_signal155),
                    .signal_out  (shifted_signal156),
                    .clk (clk));
dff_p #(SIZE) dff157( .signal_in   (shifted_signal156),
                    .signal_out  (shifted_signal157),
                    .clk (clk));
dff_p #(SIZE) dff158( .signal_in   (shifted_signal157),
                    .signal_out  (shifted_signal158),
                    .clk (clk));
dff_p #(SIZE) dff159( .signal_in   (shifted_signal158),
                    .signal_out  (shifted_signal159),
                    .clk (clk));
dff_p #(SIZE) dff160( .signal_in   (shifted_signal159),
                    .signal_out  (shifted_signal160),
                    .clk (clk));
dff_p #(SIZE) dff161( .signal_in   (shifted_signal160),
                    .signal_out  (shifted_signal161),
                    .clk (clk));
dff_p #(SIZE) dff162( .signal_in   (shifted_signal161),
                    .signal_out  (shifted_signal162),
                    .clk (clk));
dff_p #(SIZE) dff163( .signal_in   (shifted_signal162),
                    .signal_out  (shifted_signal163),
                    .clk (clk));
dff_p #(SIZE) dff164( .signal_in   (shifted_signal163),
                    .signal_out  (shifted_signal164),
                    .clk (clk));
dff_p #(SIZE) dff165( .signal_in   (shifted_signal164),
                    .signal_out  (shifted_signal165),
                    .clk (clk));
dff_p #(SIZE) dff166( .signal_in   (shifted_signal165),
                    .signal_out  (shifted_signal166),
                    .clk (clk));
dff_p #(SIZE) dff167( .signal_in   (shifted_signal166),
                    .signal_out  (shifted_signal167),
                    .clk (clk));
dff_p #(SIZE) dff168( .signal_in   (shifted_signal167),
                    .signal_out  (shifted_signal168),
                    .clk (clk));


dff_p #(SIZE) dff169( .signal_in   (shifted_signal168),
                    .signal_out  (shifted_signal169),
                    .clk (clk));

dff_p #(SIZE) dff170( .signal_in   (shifted_signal169),
                    .signal_out  (shifted_signal170),
                    .clk (clk));

dff_p #(SIZE) dff171( .signal_in   (shifted_signal170),
                    .signal_out  (shifted_signal171),
                    .clk (clk));

dff_p #(SIZE) dff172( .signal_in   (shifted_signal171),
                    .signal_out  (shifted_signal172),
                    .clk (clk));

dff_p #(SIZE) dff173( .signal_in   (shifted_signal172),
                    .signal_out  (shifted_signal173),
                    .clk (clk));

dff_p #(SIZE) dff174( .signal_in   (shifted_signal173),
                    .signal_out  (shifted_signal174),
                    .clk (clk));

dff_p #(SIZE) dff175( .signal_in   (shifted_signal174),
                    .signal_out  (shifted_signal175),
                    .clk (clk));

dff_p #(SIZE) dff176( .signal_in   (shifted_signal175),
                    .signal_out  (shifted_signal176),
                    .clk (clk));

dff_p #(SIZE) dff177( .signal_in   (shifted_signal176),
                    .signal_out  (shifted_signal177),
                    .clk (clk));

dff_p #(SIZE) dff178( .signal_in   (shifted_signal177),
                    .signal_out  (shifted_signal178),
                    .clk (clk));


dff_p #(SIZE) dff179 ( .signal_in   (shifted_signal178 ),
                    .signal_out  (shifted_signal179 ),
                    .clk (clk));
dff_p #(SIZE) dff180 ( .signal_in   (shifted_signal179 ),
                    .signal_out  (shifted_signal180 ),
                    .clk (clk));
dff_p #(SIZE) dff181 ( .signal_in   (shifted_signal180 ),
                    .signal_out  (shifted_signal181 ),
                    .clk (clk));
dff_p #(SIZE) dff182 ( .signal_in   (shifted_signal181 ),
                    .signal_out  (shifted_signal182 ),
                    .clk (clk));
dff_p #(SIZE) dff183 ( .signal_in   (shifted_signal182 ),
                    .signal_out  (shifted_signal183 ),
                    .clk (clk));
dff_p #(SIZE) dff184 ( .signal_in   (shifted_signal183 ),
                    .signal_out  (shifted_signal184 ),
                    .clk (clk));
dff_p #(SIZE) dff185 ( .signal_in   (shifted_signal184 ),
                    .signal_out  (shifted_signal185 ),
                    .clk (clk));
dff_p #(SIZE) dff186 ( .signal_in   (shifted_signal185 ),
                    .signal_out  (shifted_signal186 ),
                    .clk (clk));
dff_p #(SIZE) dff187 ( .signal_in   (shifted_signal186 ),
                    .signal_out  (shifted_signal187 ),
                    .clk (clk));
dff_p #(SIZE) dff188 ( .signal_in   (shifted_signal187 ),
                    .signal_out  (shifted_signal188 ),
                    .clk (clk));
dff_p #(SIZE) dff189 ( .signal_in   (shifted_signal188 ),
                    .signal_out  (shifted_signal189 ),
                    .clk (clk));
dff_p #(SIZE) dff190 ( .signal_in   (shifted_signal189 ),
                    .signal_out  (shifted_signal190 ),
                    .clk (clk));
dff_p #(SIZE) dff191 ( .signal_in   (shifted_signal190 ),
                    .signal_out  (shifted_signal191 ),
                    .clk (clk));
dff_p #(SIZE) dff192 ( .signal_in   (shifted_signal191 ),
                    .signal_out  (shifted_signal192 ),
                    .clk (clk));
dff_p #(SIZE) dff193 ( .signal_in   (shifted_signal192 ),
                    .signal_out  (shifted_signal193 ),
                    .clk (clk));
dff_p #(SIZE) dff194 ( .signal_in   (shifted_signal193 ),
                    .signal_out  (shifted_signal194 ),
                    .clk (clk));
dff_p #(SIZE) dff195 ( .signal_in   (shifted_signal194 ),
                    .signal_out  (shifted_signal195 ),
                    .clk (clk));
dff_p #(SIZE) dff196 ( .signal_in   (shifted_signal195 ),
                    .signal_out  (shifted_signal196 ),
                    .clk (clk));
dff_p #(SIZE) dff197 ( .signal_in   (shifted_signal196 ),
                    .signal_out  (shifted_signal197 ),
                    .clk (clk));
dff_p #(SIZE) dff198 ( .signal_in   (shifted_signal197 ),
                    .signal_out  (shifted_signal198 ),
                    .clk (clk));
dff_p #(SIZE) dff199 ( .signal_in   (shifted_signal198 ),
                    .signal_out  (shifted_signal199 ),
                    .clk (clk));
dff_p #(SIZE) dff200 ( .signal_in   (shifted_signal199 ),
                    .signal_out  (shifted_signal200 ),
                    .clk (clk));

`endif // AXIS_FBDIMM_HW

endmodule



module shifter_UI_p(signal_in,signal_out,delay_cycles,clk);

parameter SIZE=1;

input  [SIZE-1:0] signal_in;
output [SIZE-1:0] signal_out;
input  [9:0]      delay_cycles;
input  clk;

reg [9:0] counter;
reg [SIZE-1:0] signal_out_reg;


wire [SIZE-1:0] shifted_signal0,shifted_signal1,shifted_signal2,shifted_signal3,shifted_signal4;
wire [SIZE-1:0] shifted_signal5,shifted_signal6,shifted_signal7,shifted_signal8,shifted_signal9;
wire [SIZE-1:0] shifted_signal10,shifted_signal11,shifted_signal12,shifted_signal13,shifted_signal14;
wire [SIZE-1:0] shifted_signal15,shifted_signal16,shifted_signal17,shifted_signal18,shifted_signal19;
wire [SIZE-1:0] shifted_signal20,shifted_signal21,shifted_signal22,shifted_signal23,shifted_signal24;
wire [SIZE-1:0] shifted_signal25,shifted_signal26,shifted_signal27,shifted_signal28,shifted_signal29;
wire [SIZE-1:0] shifted_signal30,shifted_signal31,shifted_signal32,shifted_signal33,shifted_signal34;
wire [SIZE-1:0] shifted_signal35,shifted_signal36,shifted_signal37,shifted_signal38,shifted_signal39;
wire [SIZE-1:0] shifted_signal40,shifted_signal41,shifted_signal42,shifted_signal43,shifted_signal44;
wire [SIZE-1:0] shifted_signal45,shifted_signal46,shifted_signal47,shifted_signal48,shifted_signal49;
wire [SIZE-1:0] shifted_signal50,shifted_signal51,shifted_signal52,shifted_signal53,shifted_signal54;
wire [SIZE-1:0] shifted_signal55,shifted_signal56,shifted_signal57,shifted_signal58,shifted_signal59;
wire [SIZE-1:0] shifted_signal60,shifted_signal61,shifted_signal62,shifted_signal63,shifted_signal64;
wire [SIZE-1:0] shifted_signal65,shifted_signal66,shifted_signal67,shifted_signal68,shifted_signal69;
wire [SIZE-1:0] shifted_signal70,shifted_signal71,shifted_signal72,shifted_signal73,shifted_signal74;
wire [SIZE-1:0] shifted_signal75,shifted_signal76,shifted_signal77,shifted_signal78,shifted_signal79;
wire [SIZE-1:0] shifted_signal80,shifted_signal81,shifted_signal82,shifted_signal83,shifted_signal84;
wire [SIZE-1:0] shifted_signal85,shifted_signal86,shifted_signal87,shifted_signal88,shifted_signal89;
wire [SIZE-1:0] shifted_signal90,shifted_signal91,shifted_signal92,shifted_signal93,shifted_signal94;
wire [SIZE-1:0] shifted_signal95,shifted_signal96,shifted_signal97,shifted_signal98,shifted_signal99;
wire [SIZE-1:0] shifted_signal100,shifted_signal101,shifted_signal102,shifted_signal103,shifted_signal104;
wire [SIZE-1:0] shifted_signal105,shifted_signal106,shifted_signal107,shifted_signal108,shifted_signal109;
wire [SIZE-1:0] shifted_signal110,shifted_signal111,shifted_signal112,shifted_signal113,shifted_signal114;
wire [SIZE-1:0] shifted_signal115,shifted_signal116,shifted_signal117,shifted_signal118,shifted_signal119;
wire [SIZE-1:0] shifted_signal120,shifted_signal121,shifted_signal122,shifted_signal123,shifted_signal124;
wire [SIZE-1:0] shifted_signal125,shifted_signal126,shifted_signal127,shifted_signal128,shifted_signal129;
wire [SIZE-1:0] shifted_signal130,shifted_signal131,shifted_signal132,shifted_signal133,shifted_signal134;
wire [SIZE-1:0] shifted_signal135,shifted_signal136,shifted_signal137,shifted_signal138,shifted_signal139;
wire [SIZE-1:0] shifted_signal140,shifted_signal141,shifted_signal142,shifted_signal143,shifted_signal144;
wire [SIZE-1:0] shifted_signal145,shifted_signal146,shifted_signal147,shifted_signal148,shifted_signal149;
wire [SIZE-1:0] shifted_signal150,shifted_signal151,shifted_signal152,shifted_signal153,shifted_signal154;
wire [SIZE-1:0] shifted_signal155,shifted_signal156,shifted_signal157,shifted_signal158,shifted_signal159;
wire [SIZE-1:0] shifted_signal160,shifted_signal161,shifted_signal162,shifted_signal163,shifted_signal164;
wire [SIZE-1:0] shifted_signal165,shifted_signal166,shifted_signal167,shifted_signal168,shifted_signal169;
wire [SIZE-1:0] shifted_signal170,shifted_signal171,shifted_signal172,shifted_signal173,shifted_signal174;
wire [SIZE-1:0] shifted_signal175,shifted_signal176,shifted_signal177,shifted_signal178,shifted_signal179;

wire [SIZE-1:0] shifted_signal180,shifted_signal181,shifted_signal182,shifted_signal183,shifted_signal184;
wire [SIZE-1:0] shifted_signal185,shifted_signal186,shifted_signal187,shifted_signal188,shifted_signal189;

wire [SIZE-1:0] shifted_signal190,shifted_signal191,shifted_signal192,shifted_signal193,shifted_signal194;
wire [SIZE-1:0] shifted_signal195,shifted_signal196,shifted_signal197,shifted_signal198,shifted_signal199;
wire [SIZE-1:0] shifted_signal200;


initial counter=0;




assign            signal_out = //( delay_cycles == 9'h0 ) ? shifted_signal1:
                               ( delay_cycles == 9'h1 ) ? shifted_signal1:
                               ( delay_cycles == 9'h2 ) ? shifted_signal2:
                               ( delay_cycles == 9'h3 ) ? shifted_signal3:
                               ( delay_cycles == 9'h4 ) ? shifted_signal4:
                               ( delay_cycles == 9'h5 ) ? shifted_signal5:
                               ( delay_cycles == 9'h6 ) ? shifted_signal6:
                               ( delay_cycles == 9'h7 ) ? shifted_signal7:
                               ( delay_cycles == 9'h8 ) ? shifted_signal8:
                               ( delay_cycles == 9'h9 ) ? shifted_signal9:
                               ( delay_cycles == 9'ha ) ? shifted_signal10:
                               ( delay_cycles == 9'hb ) ? shifted_signal11:
                               ( delay_cycles == 9'hc ) ? shifted_signal12:
                               ( delay_cycles == 9'hd ) ? shifted_signal13:
                               ( delay_cycles == 9'he ) ? shifted_signal14:
                               ( delay_cycles == 9'hf ) ? shifted_signal15:
                               ( delay_cycles == 9'h10 ) ? shifted_signal16:
                               ( delay_cycles == 9'h11 ) ? shifted_signal17:
                               ( delay_cycles == 9'h12 ) ? shifted_signal18:
                               ( delay_cycles == 9'h13 ) ? shifted_signal19:
                               ( delay_cycles == 9'h14 ) ? shifted_signal20:
                               ( delay_cycles == 9'h15 ) ? shifted_signal21:
                               ( delay_cycles == 9'h16 ) ? shifted_signal22:
                               ( delay_cycles == 9'h17 ) ? shifted_signal23:
                               ( delay_cycles == 9'h18 ) ? shifted_signal24:
                               ( delay_cycles == 9'h19 ) ? shifted_signal25:
                               ( delay_cycles == 9'h1a ) ? shifted_signal26:
                               ( delay_cycles == 9'h1b ) ? shifted_signal27:
                               ( delay_cycles == 9'h1c ) ? shifted_signal28:
                               ( delay_cycles == 9'h1d ) ? shifted_signal29:
                               ( delay_cycles == 9'h1e ) ? shifted_signal30:
                               ( delay_cycles == 9'h1f ) ? shifted_signal31:
                               ( delay_cycles == 9'h20 ) ? shifted_signal32:
                               ( delay_cycles == 9'h21 ) ? shifted_signal33:
                               ( delay_cycles == 9'h22 ) ? shifted_signal34:
                               ( delay_cycles == 9'h23 ) ? shifted_signal35:
                               ( delay_cycles == 9'h24 ) ? shifted_signal36:
                               ( delay_cycles == 9'h25 ) ? shifted_signal37:
                               ( delay_cycles == 9'h26 ) ? shifted_signal38:
                               ( delay_cycles == 9'h27 ) ? shifted_signal39:
                               ( delay_cycles == 9'h28 ) ? shifted_signal40:
                               ( delay_cycles == 9'h29 ) ? shifted_signal41:
                               ( delay_cycles == 9'h2a ) ? shifted_signal42:
                               ( delay_cycles == 9'h2b ) ? shifted_signal43:
                               ( delay_cycles == 9'h2c ) ? shifted_signal44:
                               ( delay_cycles == 9'h30 ) ? shifted_signal48:
                               ( delay_cycles == 9'h36 ) ? shifted_signal54:
                               ( delay_cycles == 9'h37 ) ? shifted_signal55:
                               ( delay_cycles == 9'h44 ) ? shifted_signal68:
                               ( delay_cycles == 9'h45 ) ? shifted_signal69:
                               ( delay_cycles == 9'h48 ) ? shifted_signal72:
                               ( delay_cycles == 9'h49 ) ? shifted_signal73:
                               ( delay_cycles == 9'h4e ) ? shifted_signal78:
                               ( delay_cycles == 9'h4f ) ? shifted_signal79:
                               ( delay_cycles == 9'h50 ) ? shifted_signal80:
                               ( delay_cycles == 9'h51 ) ? shifted_signal81:
                               ( delay_cycles == 9'h52 ) ? shifted_signal82:
                               ( delay_cycles == 9'h53 ) ? shifted_signal83:
                               ( delay_cycles == 9'h54 ) ? shifted_signal84:
                               ( delay_cycles == 9'h55 ) ? shifted_signal85:
                               ( delay_cycles == 9'h56 ) ? shifted_signal86:
                               ( delay_cycles == 9'h57 ) ? shifted_signal87:
                               ( delay_cycles == 9'h58 ) ? shifted_signal88:
                               ( delay_cycles == 9'h59 ) ? shifted_signal89:
                               ( delay_cycles == 9'h5a ) ? shifted_signal90:
                               ( delay_cycles == 9'h5b ) ? shifted_signal91:  //  AL+CL=3 latency for nb_encode block
                               ( delay_cycles == 9'h5c ) ? shifted_signal92:
                               ( delay_cycles == 9'h5d ) ? shifted_signal93:
                               ( delay_cycles == 9'h5e ) ? shifted_signal94:
                               ( delay_cycles == 9'h5f ) ? shifted_signal95:
                               ( delay_cycles == 9'h60 ) ? shifted_signal96:
                               ( delay_cycles == 9'h61 ) ? shifted_signal97:
                               ( delay_cycles == 9'h62 ) ? shifted_signal98:
                               ( delay_cycles == 9'h63 ) ? shifted_signal99:
                               ( delay_cycles == 9'h64 ) ? shifted_signal100:
                               ( delay_cycles == 9'h65 ) ? shifted_signal101:
                               ( delay_cycles == 9'h66 ) ? shifted_signal102:
                               ( delay_cycles == 9'h67 ) ? shifted_signal103:  // AL+CL=4 latency for nb_encode block
                               ( delay_cycles == 9'h68 ) ? shifted_signal104:
                               ( delay_cycles == 9'h69 ) ? shifted_signal105:
                               ( delay_cycles == 9'h6a ) ? shifted_signal106:
                               ( delay_cycles == 9'h6b ) ? shifted_signal107:
                               ( delay_cycles == 9'h6c ) ? shifted_signal108:
                               ( delay_cycles == 9'h6d ) ? shifted_signal109:
                               ( delay_cycles == 9'h6e ) ? shifted_signal110:
                               ( delay_cycles == 9'h6f ) ? shifted_signal111:
                               ( delay_cycles == 9'h70 ) ? shifted_signal112:
                               ( delay_cycles == 9'h71 ) ? shifted_signal113:
                               ( delay_cycles == 9'h72 ) ? shifted_signal114:
                               ( delay_cycles == 9'h73 ) ? shifted_signal115:  // AL+CL=5 latency for nb_encode block
                               ( delay_cycles == 9'h74 ) ? shifted_signal116:
                               ( delay_cycles == 9'h78 ) ? shifted_signal120:
                               ( delay_cycles == 9'h79 ) ? shifted_signal121:
                               ( delay_cycles == 9'h7a ) ? shifted_signal122:
                               ( delay_cycles == 9'h7b ) ? shifted_signal123:
                               ( delay_cycles == 9'h7c ) ? shifted_signal124:
                               ( delay_cycles == 9'h7d ) ? shifted_signal125:
                               ( delay_cycles == 9'h7e ) ? shifted_signal126:
                               ( delay_cycles == 9'h7f ) ? shifted_signal127:  // AL+CL=6 latency for nb_encode block
                               ( delay_cycles == 9'h80 ) ? shifted_signal128:
                               ( delay_cycles == 9'h81 ) ? shifted_signal129:
                               ( delay_cycles == 9'h82 ) ? shifted_signal130:
                               ( delay_cycles == 9'h83 ) ? shifted_signal131:
                               ( delay_cycles == 9'h84 ) ? shifted_signal132:
                               ( delay_cycles == 9'h85 ) ? shifted_signal133:
                               ( delay_cycles == 9'h86 ) ? shifted_signal134:
                               ( delay_cycles == 9'h87 ) ? shifted_signal135:
                               ( delay_cycles == 9'h88 ) ? shifted_signal136:
                               ( delay_cycles == 9'h89 ) ? shifted_signal137:
                               ( delay_cycles == 9'h8a ) ? shifted_signal138:
                               ( delay_cycles == 9'h8b ) ? shifted_signal139: // AL+CL=7 latency for nb_encode block
                               ( delay_cycles == 9'h8c ) ? shifted_signal140:
                               ( delay_cycles == 9'h8d ) ? shifted_signal141:
                               ( delay_cycles == 9'h8e ) ? shifted_signal142:
                               ( delay_cycles == 9'h8f ) ? shifted_signal143:
                               ( delay_cycles == 9'h90 ) ? shifted_signal144:
                               ( delay_cycles == 9'h91 ) ? shifted_signal145:
                               ( delay_cycles == 9'h92 ) ? shifted_signal146:
                               ( delay_cycles == 9'h93 ) ? shifted_signal147:
                               ( delay_cycles == 9'h94 ) ? shifted_signal148:
                               ( delay_cycles == 9'h95 ) ? shifted_signal149:
                               ( delay_cycles == 9'h96 ) ? shifted_signal150:
                               ( delay_cycles == 9'h97 ) ? shifted_signal151:  // AL+CL=8 latency for nb_encode block
                               ( delay_cycles == 9'h98 ) ? shifted_signal152:
                               ( delay_cycles == 9'h99 ) ? shifted_signal153:
                               ( delay_cycles == 9'h9a ) ? shifted_signal154:
                               ( delay_cycles == 9'h9b ) ? shifted_signal155:
                               ( delay_cycles == 9'h9c ) ? shifted_signal156:
                               ( delay_cycles == 9'h9d ) ? shifted_signal157:
                               ( delay_cycles == 9'h9e ) ? shifted_signal158:
                               ( delay_cycles == 9'ha3 ) ? shifted_signal163: // AL+CL=9 latency for nb_encode block
                               ( delay_cycles == 9'ha4 ) ? shifted_signal164:
                               ( delay_cycles == 9'ha5 ) ? shifted_signal165:
                               ( delay_cycles == 9'ha6 ) ? shifted_signal166:
                               ( delay_cycles == 9'ha7 ) ? shifted_signal167:
                               ( delay_cycles == 9'ha8 ) ? shifted_signal168:
                               ( delay_cycles == 9'ha9 ) ? shifted_signal169:
                               ( delay_cycles == 9'haa ) ? shifted_signal170:
                               ( delay_cycles == 9'hab ) ? shifted_signal171:
                               ( delay_cycles == 9'hac ) ? shifted_signal172:
                               ( delay_cycles == 9'had ) ? shifted_signal173:
                               ( delay_cycles == 9'hae ) ? shifted_signal174:
                               ( delay_cycles == 9'haf ) ? shifted_signal175: //  AL+CL=10 latency for nb_encode block
                               ( delay_cycles == 9'hb0 ) ? shifted_signal176:
                               ( delay_cycles == 9'hb1 ) ? shifted_signal177:
                               ( delay_cycles == 9'hb2 ) ? shifted_signal178:
                               ( delay_cycles == 9'hb3 ) ? shifted_signal179:
                               ( delay_cycles == 9'hbb ) ? shifted_signal187: //  AL+CL=11 latency for nb_encode block
                               ( delay_cycles == 9'hc7 ) ? shifted_signal199: //  AL+CL=12 latency for nb_encode block
                               ( delay_cycles == 9'hd ) ? shifted_signal13: (signal_in);


dff_p #(SIZE,0) dff0( .signal_in   (signal_in),
                    .signal_out  (shifted_signal1),
                    .clk (clk));
dff_p #(SIZE) dff1( .signal_in   (shifted_signal1),
                    .signal_out  (shifted_signal2),
                    .clk (clk));
dff_p #(SIZE) dff2( .signal_in   (shifted_signal2),
                    .signal_out  (shifted_signal3),
                    .clk (clk));
dff_p #(SIZE) dff3( .signal_in   (shifted_signal3),
                    .signal_out  (shifted_signal4),
                    .clk (clk));
dff_p #(SIZE) dff4( .signal_in   (shifted_signal4),
                    .signal_out  (shifted_signal5),
                    .clk (clk));
dff_p #(SIZE) dff5( .signal_in   (shifted_signal5),
                    .signal_out  (shifted_signal6),
                    .clk (clk));
dff_p #(SIZE) dff6( .signal_in   (shifted_signal6),
                    .signal_out  (shifted_signal7),
                    .clk (clk));

dff_p #(SIZE) dff7( .signal_in   (shifted_signal7),
                    .signal_out  (shifted_signal8),
                    .clk (clk));

dff_p #(SIZE) dff8( .signal_in   (shifted_signal8),
                    .signal_out  (shifted_signal9),
                    .clk (clk));
dff_p #(SIZE) dff9( .signal_in   (shifted_signal9),
                    .signal_out  (shifted_signal10),
                    .clk (clk));
dff_p #(SIZE) dff10( .signal_in   (shifted_signal10),
                    .signal_out  (shifted_signal11),
                    .clk (clk));
dff_p #(SIZE) dff11( .signal_in   (shifted_signal11),
                    .signal_out  (shifted_signal12),
                    .clk (clk));
dff_p #(SIZE) dff12( .signal_in   (shifted_signal12),
                    .signal_out  (shifted_signal13),
                    .clk (clk));
dff_p #(SIZE) dff13( .signal_in   (shifted_signal13),
                    .signal_out  (shifted_signal14),
                    .clk (clk));
dff_p #(SIZE) dff14( .signal_in   (shifted_signal14),
                    .signal_out  (shifted_signal15),
                    .clk (clk));
dff_p #(SIZE) dff15( .signal_in   (shifted_signal15),
                    .signal_out  (shifted_signal16),
                    .clk (clk));
dff_p #(SIZE) dff16( .signal_in   (shifted_signal16),
                    .signal_out  (shifted_signal17),
                    .clk (clk));
dff_p #(SIZE) dff17( .signal_in   (shifted_signal17),
                    .signal_out  (shifted_signal18),
                    .clk (clk));
dff_p #(SIZE) dff18( .signal_in   (shifted_signal18),
                    .signal_out  (shifted_signal19),
                    .clk (clk));
dff_p #(SIZE) dff19( .signal_in   (shifted_signal19),
                    .signal_out  (shifted_signal20),
                    .clk (clk));
dff_p #(SIZE) dff20( .signal_in   (shifted_signal20),
                    .signal_out  (shifted_signal21),
                    .clk (clk));
dff_p #(SIZE) dff21( .signal_in   (shifted_signal21),
                    .signal_out  (shifted_signal22),
                    .clk (clk));
dff_p #(SIZE) dff22( .signal_in   (shifted_signal22),
                    .signal_out  (shifted_signal23),
                    .clk (clk));
dff_p #(SIZE) dff23( .signal_in   (shifted_signal23),
                    .signal_out  (shifted_signal24),
                    .clk (clk));
dff_p #(SIZE) dff24( .signal_in   (shifted_signal24),
                    .signal_out  (shifted_signal25),
                    .clk (clk));
dff_p #(SIZE) dff25( .signal_in   (shifted_signal25),
                    .signal_out  (shifted_signal26),
                    .clk (clk));
dff_p #(SIZE) dff26( .signal_in   (shifted_signal26),
                    .signal_out  (shifted_signal27),
                    .clk (clk));
dff_p #(SIZE) dff27( .signal_in   (shifted_signal27),
                    .signal_out  (shifted_signal28),
                    .clk (clk));
dff_p #(SIZE) dff28( .signal_in   (shifted_signal28),
                    .signal_out  (shifted_signal29),
                    .clk (clk));
dff_p #(SIZE) dff29( .signal_in   (shifted_signal29),
                    .signal_out  (shifted_signal30),
                    .clk (clk));
dff_p #(SIZE) dff30( .signal_in   (shifted_signal30),
                    .signal_out  (shifted_signal31),
                    .clk (clk));
dff_p #(SIZE) dff31( .signal_in   (shifted_signal31),
                    .signal_out  (shifted_signal32),
                    .clk (clk));
dff_p #(SIZE) dff32( .signal_in   (shifted_signal32),
                    .signal_out  (shifted_signal33),
                    .clk (clk));
dff_p #(SIZE) dff33( .signal_in   (shifted_signal33),
                    .signal_out  (shifted_signal34),
                    .clk (clk));
dff_p #(SIZE) dff34( .signal_in   (shifted_signal34),
                    .signal_out  (shifted_signal35),
                    .clk (clk));
dff_p #(SIZE) dff35( .signal_in   (shifted_signal35),
                    .signal_out  (shifted_signal36),
                    .clk (clk));
dff_p #(SIZE) dff36( .signal_in   (shifted_signal36),
                    .signal_out  (shifted_signal37),
                    .clk (clk));
dff_p #(SIZE) dff37( .signal_in   (shifted_signal37),
                    .signal_out  (shifted_signal38),
                    .clk (clk));
dff_p #(SIZE) dff38( .signal_in   (shifted_signal38),
                    .signal_out  (shifted_signal39),
                    .clk (clk));
dff_p #(SIZE) dff39( .signal_in   (shifted_signal39),
                    .signal_out  (shifted_signal40),
                    .clk (clk));
dff_p #(SIZE) dff40( .signal_in   (shifted_signal40),
                    .signal_out  (shifted_signal41),
                    .clk (clk));
dff_p #(SIZE) dff41( .signal_in   (shifted_signal41),
                    .signal_out  (shifted_signal42),
                    .clk (clk));
dff_p #(SIZE) dff42( .signal_in   (shifted_signal42),
                    .signal_out  (shifted_signal43),
                    .clk (clk));
dff_p #(SIZE) dff43( .signal_in   (shifted_signal43),
                    .signal_out  (shifted_signal44),
                    .clk (clk));
dff_p #(SIZE) dff44( .signal_in   (shifted_signal44),
                    .signal_out  (shifted_signal45),
                    .clk (clk));
dff_p #(SIZE) dff45( .signal_in   (shifted_signal45),
                    .signal_out  (shifted_signal46),
                    .clk (clk));
dff_p #(SIZE) dff46( .signal_in   (shifted_signal46),
                    .signal_out  (shifted_signal47),
                    .clk (clk));
dff_p #(SIZE) dff47( .signal_in   (shifted_signal47),
                    .signal_out  (shifted_signal48),
                    .clk (clk));
dff_p #(SIZE) dff48( .signal_in   (shifted_signal48),
                    .signal_out  (shifted_signal49),
                    .clk (clk));
dff_p #(SIZE) dff49( .signal_in   (shifted_signal49),
                    .signal_out  (shifted_signal50),
                    .clk (clk));
dff_p #(SIZE) dff50( .signal_in   (shifted_signal50),
                    .signal_out  (shifted_signal51),
                    .clk (clk));
dff_p #(SIZE) dff51( .signal_in   (shifted_signal51),
                    .signal_out  (shifted_signal52),
                    .clk (clk));
dff_p #(SIZE) dff52( .signal_in   (shifted_signal52),
                    .signal_out  (shifted_signal53),
                    .clk (clk));
dff_p #(SIZE) dff53( .signal_in   (shifted_signal53),
                    .signal_out  (shifted_signal54),
                    .clk (clk));
dff_p #(SIZE) dff54( .signal_in   (shifted_signal54),
                    .signal_out  (shifted_signal55),
                    .clk (clk));
dff_p #(SIZE) dff55( .signal_in   (shifted_signal55),
                    .signal_out  (shifted_signal56),
                    .clk (clk));
dff_p #(SIZE) dff56( .signal_in   (shifted_signal56),
                    .signal_out  (shifted_signal57),
                    .clk (clk));
dff_p #(SIZE) dff57( .signal_in   (shifted_signal57),
                    .signal_out  (shifted_signal58),
                    .clk (clk));
dff_p #(SIZE) dff58( .signal_in   (shifted_signal58),
                    .signal_out  (shifted_signal59),
                    .clk (clk));

dff_p #(SIZE) dff59( .signal_in   (shifted_signal59),
                    .signal_out  (shifted_signal60),
                    .clk (clk));

dff_p #(SIZE) dff60( .signal_in   (shifted_signal60),
                    .signal_out  (shifted_signal61),
                    .clk (clk));
dff_p #(SIZE) dff61( .signal_in   (shifted_signal61),
                    .signal_out  (shifted_signal62),
                    .clk (clk));
dff_p #(SIZE) dff62( .signal_in   (shifted_signal62),
                    .signal_out  (shifted_signal63),
                    .clk (clk));
dff_p #(SIZE) dff63( .signal_in   (shifted_signal63),
                    .signal_out  (shifted_signal64),
                    .clk (clk));
dff_p #(SIZE) dff64( .signal_in   (shifted_signal64),
                    .signal_out  (shifted_signal65),
                    .clk (clk));
dff_p #(SIZE) dff65( .signal_in   (shifted_signal65),
                    .signal_out  (shifted_signal66),
                    .clk (clk));
dff_p #(SIZE) dff66( .signal_in   (shifted_signal66),
                    .signal_out  (shifted_signal67),
                    .clk (clk));
dff_p #(SIZE) dff67( .signal_in   (shifted_signal67),
                    .signal_out  (shifted_signal68),
                    .clk (clk));
dff_p #(SIZE) dff68( .signal_in   (shifted_signal68),
                    .signal_out  (shifted_signal69),
                    .clk (clk));
dff_p #(SIZE) dff69( .signal_in   (shifted_signal69),
                    .signal_out  (shifted_signal70),
                    .clk (clk));
dff_p #(SIZE) dff70( .signal_in   (shifted_signal70),
                    .signal_out  (shifted_signal71),
                    .clk (clk));
dff_p #(SIZE) dff71( .signal_in   (shifted_signal71),
                    .signal_out  (shifted_signal72),
                    .clk (clk));
dff_p #(SIZE) dff72( .signal_in   (shifted_signal72),
                    .signal_out  (shifted_signal73),
                    .clk (clk));
dff_p #(SIZE) dff73( .signal_in   (shifted_signal73),
                    .signal_out  (shifted_signal74),
                    .clk (clk));
dff_p #(SIZE) dff74( .signal_in   (shifted_signal74),
                    .signal_out  (shifted_signal75),
                    .clk (clk));
dff_p #(SIZE) dff75( .signal_in   (shifted_signal75),
                    .signal_out  (shifted_signal76),
                    .clk (clk));
dff_p #(SIZE) dff76( .signal_in   (shifted_signal76),
                    .signal_out  (shifted_signal77),
                    .clk (clk));
dff_p #(SIZE) dff77( .signal_in   (shifted_signal77),
                    .signal_out  (shifted_signal78),
                    .clk (clk));
dff_p #(SIZE) dff78( .signal_in   (shifted_signal78),
                    .signal_out  (shifted_signal79),
                    .clk (clk));
dff_p #(SIZE) dff79( .signal_in   (shifted_signal79),
                    .signal_out  (shifted_signal80),
                    .clk (clk));

dff_p #(SIZE) dff80( .signal_in   (shifted_signal80),
                    .signal_out  (shifted_signal81),
                    .clk (clk));
dff_p #(SIZE) dff81( .signal_in   (shifted_signal81),
                    .signal_out  (shifted_signal82),
                    .clk (clk));
dff_p #(SIZE) dff82( .signal_in   (shifted_signal82),
                    .signal_out  (shifted_signal83),
                    .clk (clk));
dff_p #(SIZE) dff83( .signal_in   (shifted_signal83),
                    .signal_out  (shifted_signal84),
                    .clk (clk));
dff_p #(SIZE) dff84( .signal_in   (shifted_signal84),
                    .signal_out  (shifted_signal85),
                    .clk (clk));
dff_p #(SIZE) dff85( .signal_in   (shifted_signal85),
                    .signal_out  (shifted_signal86),
                    .clk (clk));
dff_p #(SIZE) dff86( .signal_in   (shifted_signal86),
                    .signal_out  (shifted_signal87),
                    .clk (clk));
dff_p #(SIZE) dff87( .signal_in   (shifted_signal87),
                    .signal_out  (shifted_signal88),
                    .clk (clk));
dff_p #(SIZE) dff88( .signal_in   (shifted_signal88),
                    .signal_out  (shifted_signal89),
                    .clk (clk));
dff_p #(SIZE) dff89( .signal_in   (shifted_signal89),
                    .signal_out  (shifted_signal90),
                    .clk (clk));
dff_p #(SIZE) dff90( .signal_in   (shifted_signal90),
                    .signal_out  (shifted_signal91),
                    .clk (clk));
dff_p #(SIZE) dff91( .signal_in   (shifted_signal91),
                    .signal_out  (shifted_signal92),
                    .clk (clk));
dff_p #(SIZE) dff92( .signal_in   (shifted_signal92),
                    .signal_out  (shifted_signal93),
                    .clk (clk));
dff_p #(SIZE) dff93( .signal_in   (shifted_signal93),
                    .signal_out  (shifted_signal94),
                    .clk (clk));
dff_p #(SIZE) dff94( .signal_in   (shifted_signal94),
                    .signal_out  (shifted_signal95),
                    .clk (clk));
dff_p #(SIZE) dff95( .signal_in   (shifted_signal95),
                    .signal_out  (shifted_signal96),
                    .clk (clk));
dff_p #(SIZE) dff96( .signal_in   (shifted_signal96),
                    .signal_out  (shifted_signal97),
                    .clk (clk));
dff_p #(SIZE) dff97( .signal_in   (shifted_signal97),
                    .signal_out  (shifted_signal98),
                    .clk (clk));
dff_p #(SIZE) dff98( .signal_in   (shifted_signal98),
                    .signal_out  (shifted_signal99),
                    .clk (clk));
dff_p #(SIZE) dff99( .signal_in   (shifted_signal99),
                    .signal_out  (shifted_signal100),
                    .clk (clk));
dff_p #(SIZE) dff100( .signal_in   (shifted_signal100),
                    .signal_out  (shifted_signal101),
                    .clk (clk));
dff_p #(SIZE) dff101( .signal_in   (shifted_signal101),
                    .signal_out  (shifted_signal102),
                    .clk (clk));
dff_p #(SIZE) dff102( .signal_in   (shifted_signal102),
                    .signal_out  (shifted_signal103),
                    .clk (clk));
dff_p #(SIZE) dff103( .signal_in   (shifted_signal103),
                    .signal_out  (shifted_signal104),
                    .clk (clk));
dff_p #(SIZE) dff104( .signal_in   (shifted_signal104),
                    .signal_out  (shifted_signal105),
                    .clk (clk));
dff_p #(SIZE) dff105( .signal_in   (shifted_signal105),
                    .signal_out  (shifted_signal106),
                    .clk (clk));
dff_p #(SIZE) dff106( .signal_in   (shifted_signal106),
                    .signal_out  (shifted_signal107),
                    .clk (clk));
dff_p #(SIZE) dff107( .signal_in   (shifted_signal107),
                    .signal_out  (shifted_signal108),
                    .clk (clk));
dff_p #(SIZE) dff108( .signal_in   (shifted_signal108),
                    .signal_out  (shifted_signal109),
                    .clk (clk));
dff_p #(SIZE) dff109( .signal_in   (shifted_signal109),
                    .signal_out  (shifted_signal110),
                    .clk (clk));
dff_p #(SIZE) dff110( .signal_in   (shifted_signal110),
                    .signal_out  (shifted_signal111),
                    .clk (clk));
dff_p #(SIZE) dff111( .signal_in   (shifted_signal111),
                    .signal_out  (shifted_signal112),
                    .clk (clk));
dff_p #(SIZE) dff112( .signal_in   (shifted_signal112),
                    .signal_out  (shifted_signal113),
                    .clk (clk));
dff_p #(SIZE) dff113( .signal_in   (shifted_signal113),
                    .signal_out  (shifted_signal114),
                    .clk (clk));
dff_p #(SIZE) dff114( .signal_in   (shifted_signal114),
                    .signal_out  (shifted_signal115),
                    .clk (clk));
dff_p #(SIZE) dff115( .signal_in   (shifted_signal115),
                    .signal_out  (shifted_signal116),
                    .clk (clk));
dff_p #(SIZE) dff116( .signal_in   (shifted_signal116),
                    .signal_out  (shifted_signal117),
                    .clk (clk));
dff_p #(SIZE) dff117( .signal_in   (shifted_signal117),
                    .signal_out  (shifted_signal118),
                    .clk (clk));
dff_p #(SIZE) dff118( .signal_in   (shifted_signal118),
                    .signal_out  (shifted_signal119),
                    .clk (clk));
dff_p #(SIZE) dff119( .signal_in   (shifted_signal119),
                    .signal_out  (shifted_signal120),
                    .clk (clk));
dff_p #(SIZE) dff120( .signal_in   (shifted_signal120),
                    .signal_out  (shifted_signal121),
                    .clk (clk));
dff_p #(SIZE) dff121( .signal_in   (shifted_signal121),
                    .signal_out  (shifted_signal122),
                    .clk (clk));
dff_p #(SIZE) dff122( .signal_in   (shifted_signal122),
                    .signal_out  (shifted_signal123),
                    .clk (clk));
dff_p #(SIZE) dff123( .signal_in   (shifted_signal123),
                    .signal_out  (shifted_signal124),
                    .clk (clk));
dff_p #(SIZE) dff124( .signal_in   (shifted_signal124),
                    .signal_out  (shifted_signal125),
                    .clk (clk));
dff_p #(SIZE) dff125( .signal_in   (shifted_signal125),
                    .signal_out  (shifted_signal126),
                    .clk (clk));
dff_p #(SIZE) dff126( .signal_in   (shifted_signal126),
                    .signal_out  (shifted_signal127),
                    .clk (clk));
dff_p #(SIZE) dff127( .signal_in   (shifted_signal127),
                    .signal_out  (shifted_signal128),
                    .clk (clk));
dff_p #(SIZE) dff128( .signal_in   (shifted_signal128),
                    .signal_out  (shifted_signal129),
                    .clk (clk));
dff_p #(SIZE) dff129( .signal_in   (shifted_signal129),
                    .signal_out  (shifted_signal130),
                    .clk (clk));
dff_p #(SIZE) dff130( .signal_in   (shifted_signal130),
                    .signal_out  (shifted_signal131),
                    .clk (clk));
dff_p #(SIZE) dff131( .signal_in   (shifted_signal131),
                    .signal_out  (shifted_signal132),
                    .clk (clk));
dff_p #(SIZE) dff132( .signal_in   (shifted_signal132),
                    .signal_out  (shifted_signal133),
                    .clk (clk));
dff_p #(SIZE) dff133( .signal_in   (shifted_signal133),
                    .signal_out  (shifted_signal134),
                    .clk (clk));
dff_p #(SIZE) dff134( .signal_in   (shifted_signal134),
                    .signal_out  (shifted_signal135),
                    .clk (clk));
dff_p #(SIZE) dff135( .signal_in   (shifted_signal135),
                    .signal_out  (shifted_signal136),
                    .clk (clk));
dff_p #(SIZE) dff136( .signal_in   (shifted_signal136),
                    .signal_out  (shifted_signal137),
                    .clk (clk));
dff_p #(SIZE) dff137( .signal_in   (shifted_signal137),
                    .signal_out  (shifted_signal138),
                    .clk (clk));
dff_p #(SIZE) dff138( .signal_in   (shifted_signal138),
                    .signal_out  (shifted_signal139),
                    .clk (clk));
dff_p #(SIZE) dff139( .signal_in   (shifted_signal139),
                    .signal_out  (shifted_signal140),
                    .clk (clk));
dff_p #(SIZE) dff140( .signal_in   (shifted_signal140),
                    .signal_out  (shifted_signal141),
                    .clk (clk));
dff_p #(SIZE) dff141( .signal_in   (shifted_signal141),
                    .signal_out  (shifted_signal142),
                    .clk (clk));
dff_p #(SIZE) dff142( .signal_in   (shifted_signal142),
                    .signal_out  (shifted_signal143),
                    .clk (clk));
dff_p #(SIZE) dff143( .signal_in   (shifted_signal143),
                    .signal_out  (shifted_signal144),
                    .clk (clk));
dff_p #(SIZE) dff144( .signal_in   (shifted_signal144),
                    .signal_out  (shifted_signal145),
                    .clk (clk));
dff_p #(SIZE) dff145( .signal_in   (shifted_signal145),
                    .signal_out  (shifted_signal146),
                    .clk (clk));
dff_p #(SIZE) dff146( .signal_in   (shifted_signal145),
                    .signal_out  (shifted_signal146),
                    .clk (clk));
dff_p #(SIZE) dff147( .signal_in   (shifted_signal146),
                    .signal_out  (shifted_signal147),
                    .clk (clk));
dff_p #(SIZE) dff148( .signal_in   (shifted_signal147),
                    .signal_out  (shifted_signal148),
                    .clk (clk));
dff_p #(SIZE) dff149( .signal_in   (shifted_signal148),
                    .signal_out  (shifted_signal149),
                    .clk (clk));
dff_p #(SIZE) dff150( .signal_in   (shifted_signal149),
                    .signal_out  (shifted_signal150),
                    .clk (clk));
dff_p #(SIZE) dff151( .signal_in   (shifted_signal150),
                    .signal_out  (shifted_signal151),
                    .clk (clk));
dff_p #(SIZE) dff152( .signal_in   (shifted_signal151),
                    .signal_out  (shifted_signal152),
                    .clk (clk));
dff_p #(SIZE) dff153( .signal_in   (shifted_signal152),
                    .signal_out  (shifted_signal153),
                    .clk (clk));
dff_p #(SIZE) dff154( .signal_in   (shifted_signal153),
                    .signal_out  (shifted_signal154),
                    .clk (clk));

dff_p #(SIZE) dff155( .signal_in   (shifted_signal154),
                    .signal_out  (shifted_signal155),
                    .clk (clk));

dff_p #(SIZE) dff156( .signal_in   (shifted_signal155),
                    .signal_out  (shifted_signal156),
                    .clk (clk));
dff_p #(SIZE) dff157( .signal_in   (shifted_signal156),
                    .signal_out  (shifted_signal157),
                    .clk (clk));
dff_p #(SIZE) dff158( .signal_in   (shifted_signal157),
                    .signal_out  (shifted_signal158),
                    .clk (clk));
dff_p #(SIZE) dff159( .signal_in   (shifted_signal158),
                    .signal_out  (shifted_signal159),
                    .clk (clk));
dff_p #(SIZE) dff160( .signal_in   (shifted_signal159),
                    .signal_out  (shifted_signal160),
                    .clk (clk));
dff_p #(SIZE) dff161( .signal_in   (shifted_signal160),
                    .signal_out  (shifted_signal161),
                    .clk (clk));
dff_p #(SIZE) dff162( .signal_in   (shifted_signal161),
                    .signal_out  (shifted_signal162),
                    .clk (clk));
dff_p #(SIZE) dff163( .signal_in   (shifted_signal162),
                    .signal_out  (shifted_signal163),
                    .clk (clk));
dff_p #(SIZE) dff164( .signal_in   (shifted_signal163),
                    .signal_out  (shifted_signal164),
                    .clk (clk));
dff_p #(SIZE) dff165( .signal_in   (shifted_signal164),
                    .signal_out  (shifted_signal165),
                    .clk (clk));
dff_p #(SIZE) dff166( .signal_in   (shifted_signal165),
                    .signal_out  (shifted_signal166),
                    .clk (clk));
dff_p #(SIZE) dff167( .signal_in   (shifted_signal166),
                    .signal_out  (shifted_signal167),
                    .clk (clk));
dff_p #(SIZE) dff168( .signal_in   (shifted_signal167),
                    .signal_out  (shifted_signal168),
                    .clk (clk));


dff_p #(SIZE) dff169( .signal_in   (shifted_signal168),
                    .signal_out  (shifted_signal169),
                    .clk (clk));

dff_p #(SIZE) dff170( .signal_in   (shifted_signal169),
                    .signal_out  (shifted_signal170),
                    .clk (clk));

dff_p #(SIZE) dff171( .signal_in   (shifted_signal170),
                    .signal_out  (shifted_signal171),
                    .clk (clk));

dff_p #(SIZE) dff172( .signal_in   (shifted_signal171),
                    .signal_out  (shifted_signal172),
                    .clk (clk));

dff_p #(SIZE) dff173( .signal_in   (shifted_signal172),
                    .signal_out  (shifted_signal173),
                    .clk (clk));

dff_p #(SIZE) dff174( .signal_in   (shifted_signal173),
                    .signal_out  (shifted_signal174),
                    .clk (clk));

dff_p #(SIZE) dff175( .signal_in   (shifted_signal174),
                    .signal_out  (shifted_signal175),
                    .clk (clk));

dff_p #(SIZE) dff176( .signal_in   (shifted_signal175),
                    .signal_out  (shifted_signal176),
                    .clk (clk));

dff_p #(SIZE) dff177( .signal_in   (shifted_signal176),
                    .signal_out  (shifted_signal177),
                    .clk (clk));

dff_p #(SIZE) dff178( .signal_in   (shifted_signal177),
                    .signal_out  (shifted_signal178),
                    .clk (clk));


dff_p #(SIZE) dff179 ( .signal_in   (shifted_signal178 ),
                    .signal_out  (shifted_signal179 ),
                    .clk (clk));
dff_p #(SIZE) dff180 ( .signal_in   (shifted_signal179 ),
                    .signal_out  (shifted_signal180 ),
                    .clk (clk));
dff_p #(SIZE) dff181 ( .signal_in   (shifted_signal180 ),
                    .signal_out  (shifted_signal181 ),
                    .clk (clk));
dff_p #(SIZE) dff182 ( .signal_in   (shifted_signal181 ),
                    .signal_out  (shifted_signal182 ),
                    .clk (clk));
dff_p #(SIZE) dff183 ( .signal_in   (shifted_signal182 ),
                    .signal_out  (shifted_signal183 ),
                    .clk (clk));
dff_p #(SIZE) dff184 ( .signal_in   (shifted_signal183 ),
                    .signal_out  (shifted_signal184 ),
                    .clk (clk));
dff_p #(SIZE) dff185 ( .signal_in   (shifted_signal184 ),
                    .signal_out  (shifted_signal185 ),
                    .clk (clk));
dff_p #(SIZE) dff186 ( .signal_in   (shifted_signal185 ),
                    .signal_out  (shifted_signal186 ),
                    .clk (clk));
dff_p #(SIZE) dff187 ( .signal_in   (shifted_signal186 ),
                    .signal_out  (shifted_signal187 ),
                    .clk (clk));
dff_p #(SIZE) dff188 ( .signal_in   (shifted_signal187 ),
                    .signal_out  (shifted_signal188 ),
                    .clk (clk));
dff_p #(SIZE) dff189 ( .signal_in   (shifted_signal188 ),
                    .signal_out  (shifted_signal189 ),
                    .clk (clk));
dff_p #(SIZE) dff190 ( .signal_in   (shifted_signal189 ),
                    .signal_out  (shifted_signal190 ),
                    .clk (clk));
dff_p #(SIZE) dff191 ( .signal_in   (shifted_signal190 ),
                    .signal_out  (shifted_signal191 ),
                    .clk (clk));
dff_p #(SIZE) dff192 ( .signal_in   (shifted_signal191 ),
                    .signal_out  (shifted_signal192 ),
                    .clk (clk));
dff_p #(SIZE) dff193 ( .signal_in   (shifted_signal192 ),
                    .signal_out  (shifted_signal193 ),
                    .clk (clk));
dff_p #(SIZE) dff194 ( .signal_in   (shifted_signal193 ),
                    .signal_out  (shifted_signal194 ),
                    .clk (clk));
dff_p #(SIZE) dff195 ( .signal_in   (shifted_signal194 ),
                    .signal_out  (shifted_signal195 ),
                    .clk (clk));
dff_p #(SIZE) dff196 ( .signal_in   (shifted_signal195 ),
                    .signal_out  (shifted_signal196 ),
                    .clk (clk));
dff_p #(SIZE) dff197 ( .signal_in   (shifted_signal196 ),
                    .signal_out  (shifted_signal197 ),
                    .clk (clk));
dff_p #(SIZE) dff198 ( .signal_in   (shifted_signal197 ),
                    .signal_out  (shifted_signal198 ),
                    .clk (clk));
dff_p #(SIZE) dff199 ( .signal_in   (shifted_signal198 ),
                    .signal_out  (shifted_signal199 ),
                    .clk (clk));
dff_p #(SIZE) dff200 ( .signal_in   (shifted_signal199 ),
                    .signal_out  (shifted_signal200 ),
                    .clk (clk));


endmodule


