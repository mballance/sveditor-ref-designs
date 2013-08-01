// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_eqs_csrpipe_109.v
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
module dmu_imu_eqs_csrpipe_109 
	(
	clk,
	rst_l,
	reg_in,
	reg_out,
	data0,
	data1,
	data2,
	data3,
	data4,
	data5,
	data6,
	data7,
	data8,
	data9,
	data10,
	data11,
	data12,
	data13,
	data14,
	data15,
	data16,
	data17,
	data18,
	data19,
	data20,
	data21,
	data22,
	data23,
	data24,
	data25,
	data26,
	data27,
	data28,
	data29,
	data30,
	data31,
	data32,
	data33,
	data34,
	data35,
	data36,
	data37,
	data38,
	data39,
	data40,
	data41,
	data42,
	data43,
	data44,
	data45,
	data46,
	data47,
	data48,
	data49,
	data50,
	data51,
	data52,
	data53,
	data54,
	data55,
	data56,
	data57,
	data58,
	data59,
	data60,
	data61,
	data62,
	data63,
	data64,
	data65,
	data66,
	data67,
	data68,
	data69,
	data70,
	data71,
	data72,
	data73,
	data74,
	data75,
	data76,
	data77,
	data78,
	data79,
	data80,
	data81,
	data82,
	data83,
	data84,
	data85,
	data86,
	data87,
	data88,
	data89,
	data90,
	data91,
	data92,
	data93,
	data94,
	data95,
	data96,
	data97,
	data98,
	data99,
	data100,
	data101,
	data102,
	data103,
	data104,
	data105,
	data106,
	data107,
	data108,
	sel0,
	sel1,
	sel2,
	sel3,
	sel4,
	sel5,
	sel6,
	sel7,
	sel8,
	sel9,
	sel10,
	sel11,
	sel12,
	sel13,
	sel14,
	sel15,
	sel16,
	sel17,
	sel18,
	sel19,
	sel20,
	sel21,
	sel22,
	sel23,
	sel24,
	sel25,
	sel26,
	sel27,
	sel28,
	sel29,
	sel30,
	sel31,
	sel32,
	sel33,
	sel34,
	sel35,
	sel36,
	sel37,
	sel38,
	sel39,
	sel40,
	sel41,
	sel42,
	sel43,
	sel44,
	sel45,
	sel46,
	sel47,
	sel48,
	sel49,
	sel50,
	sel51,
	sel52,
	sel53,
	sel54,
	sel55,
	sel56,
	sel57,
	sel58,
	sel59,
	sel60,
	sel61,
	sel62,
	sel63,
	sel64,
	sel65,
	sel66,
	sel67,
	sel68,
	sel69,
	sel70,
	sel71,
	sel72,
	sel73,
	sel74,
	sel75,
	sel76,
	sel77,
	sel78,
	sel79,
	sel80,
	sel81,
	sel82,
	sel83,
	sel84,
	sel85,
	sel86,
	sel87,
	sel88,
	sel89,
	sel90,
	sel91,
	sel92,
	sel93,
	sel94,
	sel95,
	sel96,
	sel97,
	sel98,
	sel99,
	sel100,
	sel101,
	sel102,
	sel103,
	sel104,
	sel105,
	sel106,
	sel107,
	sel108,
	out
	);

//====================================================================
//     Polarity declarations
//====================================================================
input  clk;  // Clock signal
input  rst_l;  // Reset signal
input  reg_in;  // Set to constant. 0: sel* non-reg  1: sel* reg
input  reg_out;  // Set to constant. 0: out non-reg   1: out registered
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data0;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data1;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data2;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data3;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data4;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data5;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data6;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data7;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data8;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data9;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data10;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data11;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data12;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data13;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data14;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data15;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data16;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data17;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data18;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data19;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data20;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data21;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data22;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data23;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data24;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data25;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data26;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data27;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data28;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data29;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data30;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data31;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data32;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data33;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data34;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data35;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data36;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data37;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data38;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data39;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data40;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data41;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data42;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data43;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data44;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data45;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data46;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data47;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data48;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data49;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data50;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data51;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data52;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data53;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data54;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data55;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data56;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data57;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data58;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data59;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data60;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data61;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data62;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data63;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data64;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data65;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data66;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data67;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data68;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data69;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data70;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data71;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data72;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data73;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data74;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data75;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data76;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data77;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data78;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data79;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data80;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data81;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data82;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data83;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data84;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data85;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data86;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data87;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data88;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data89;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data90;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data91;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data92;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data93;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data94;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data95;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data96;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data97;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data98;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data99;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data100;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data101;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data102;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data103;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data104;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data105;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data106;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data107;  // Read data
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] data108;  // Read data
input  sel0;  // Set to 1 if reg_in==0
input  sel1;  // Set to 1 if reg_in==0
input  sel2;  // Set to 1 if reg_in==0
input  sel3;  // Set to 1 if reg_in==0
input  sel4;  // Set to 1 if reg_in==0
input  sel5;  // Set to 1 if reg_in==0
input  sel6;  // Set to 1 if reg_in==0
input  sel7;  // Set to 1 if reg_in==0
input  sel8;  // Set to 1 if reg_in==0
input  sel9;  // Set to 1 if reg_in==0
input  sel10;  // Set to 1 if reg_in==0
input  sel11;  // Set to 1 if reg_in==0
input  sel12;  // Set to 1 if reg_in==0
input  sel13;  // Set to 1 if reg_in==0
input  sel14;  // Set to 1 if reg_in==0
input  sel15;  // Set to 1 if reg_in==0
input  sel16;  // Set to 1 if reg_in==0
input  sel17;  // Set to 1 if reg_in==0
input  sel18;  // Set to 1 if reg_in==0
input  sel19;  // Set to 1 if reg_in==0
input  sel20;  // Set to 1 if reg_in==0
input  sel21;  // Set to 1 if reg_in==0
input  sel22;  // Set to 1 if reg_in==0
input  sel23;  // Set to 1 if reg_in==0
input  sel24;  // Set to 1 if reg_in==0
input  sel25;  // Set to 1 if reg_in==0
input  sel26;  // Set to 1 if reg_in==0
input  sel27;  // Set to 1 if reg_in==0
input  sel28;  // Set to 1 if reg_in==0
input  sel29;  // Set to 1 if reg_in==0
input  sel30;  // Set to 1 if reg_in==0
input  sel31;  // Set to 1 if reg_in==0
input  sel32;  // Set to 1 if reg_in==0
input  sel33;  // Set to 1 if reg_in==0
input  sel34;  // Set to 1 if reg_in==0
input  sel35;  // Set to 1 if reg_in==0
input  sel36;  // Set to 1 if reg_in==0
input  sel37;  // Set to 1 if reg_in==0
input  sel38;  // Set to 1 if reg_in==0
input  sel39;  // Set to 1 if reg_in==0
input  sel40;  // Set to 1 if reg_in==0
input  sel41;  // Set to 1 if reg_in==0
input  sel42;  // Set to 1 if reg_in==0
input  sel43;  // Set to 1 if reg_in==0
input  sel44;  // Set to 1 if reg_in==0
input  sel45;  // Set to 1 if reg_in==0
input  sel46;  // Set to 1 if reg_in==0
input  sel47;  // Set to 1 if reg_in==0
input  sel48;  // Set to 1 if reg_in==0
input  sel49;  // Set to 1 if reg_in==0
input  sel50;  // Set to 1 if reg_in==0
input  sel51;  // Set to 1 if reg_in==0
input  sel52;  // Set to 1 if reg_in==0
input  sel53;  // Set to 1 if reg_in==0
input  sel54;  // Set to 1 if reg_in==0
input  sel55;  // Set to 1 if reg_in==0
input  sel56;  // Set to 1 if reg_in==0
input  sel57;  // Set to 1 if reg_in==0
input  sel58;  // Set to 1 if reg_in==0
input  sel59;  // Set to 1 if reg_in==0
input  sel60;  // Set to 1 if reg_in==0
input  sel61;  // Set to 1 if reg_in==0
input  sel62;  // Set to 1 if reg_in==0
input  sel63;  // Set to 1 if reg_in==0
input  sel64;  // Set to 1 if reg_in==0
input  sel65;  // Set to 1 if reg_in==0
input  sel66;  // Set to 1 if reg_in==0
input  sel67;  // Set to 1 if reg_in==0
input  sel68;  // Set to 1 if reg_in==0
input  sel69;  // Set to 1 if reg_in==0
input  sel70;  // Set to 1 if reg_in==0
input  sel71;  // Set to 1 if reg_in==0
input  sel72;  // Set to 1 if reg_in==0
input  sel73;  // Set to 1 if reg_in==0
input  sel74;  // Set to 1 if reg_in==0
input  sel75;  // Set to 1 if reg_in==0
input  sel76;  // Set to 1 if reg_in==0
input  sel77;  // Set to 1 if reg_in==0
input  sel78;  // Set to 1 if reg_in==0
input  sel79;  // Set to 1 if reg_in==0
input  sel80;  // Set to 1 if reg_in==0
input  sel81;  // Set to 1 if reg_in==0
input  sel82;  // Set to 1 if reg_in==0
input  sel83;  // Set to 1 if reg_in==0
input  sel84;  // Set to 1 if reg_in==0
input  sel85;  // Set to 1 if reg_in==0
input  sel86;  // Set to 1 if reg_in==0
input  sel87;  // Set to 1 if reg_in==0
input  sel88;  // Set to 1 if reg_in==0
input  sel89;  // Set to 1 if reg_in==0
input  sel90;  // Set to 1 if reg_in==0
input  sel91;  // Set to 1 if reg_in==0
input  sel92;  // Set to 1 if reg_in==0
input  sel93;  // Set to 1 if reg_in==0
input  sel94;  // Set to 1 if reg_in==0
input  sel95;  // Set to 1 if reg_in==0
input  sel96;  // Set to 1 if reg_in==0
input  sel97;  // Set to 1 if reg_in==0
input  sel98;  // Set to 1 if reg_in==0
input  sel99;  // Set to 1 if reg_in==0
input  sel100;  // Set to 1 if reg_in==0
input  sel101;  // Set to 1 if reg_in==0
input  sel102;  // Set to 1 if reg_in==0
input  sel103;  // Set to 1 if reg_in==0
input  sel104;  // Set to 1 if reg_in==0
input  sel105;  // Set to 1 if reg_in==0
input  sel106;  // Set to 1 if reg_in==0
input  sel107;  // Set to 1 if reg_in==0
input  sel108;  // Set to 1 if reg_in==0
output [`FIRE_CSRBUS_DATA_WIDTH-1:0] out;  // Read data out

//====================================================================
//     Type declarations
//====================================================================
wire clk;  // Clock signal
wire rst_l;  // Reset signal
wire reg_in;  // Set to constant. 0: sel* non-reg  1: sel* reg
wire reg_out;  // Set to constant. 0: out non-reg   1: out registered
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data0;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data1;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data2;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data3;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data4;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data5;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data6;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data7;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data8;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data9;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data10;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data11;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data12;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data13;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data14;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data15;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data16;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data17;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data18;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data19;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data20;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data21;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data22;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data23;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data24;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data25;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data26;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data27;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data28;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data29;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data30;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data31;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data32;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data33;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data34;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data35;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data36;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data37;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data38;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data39;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data40;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data41;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data42;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data43;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data44;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data45;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data46;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data47;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data48;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data49;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data50;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data51;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data52;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data53;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data54;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data55;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data56;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data57;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data58;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data59;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data60;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data61;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data62;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data63;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data64;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data65;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data66;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data67;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data68;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data69;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data70;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data71;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data72;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data73;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data74;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data75;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data76;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data77;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data78;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data79;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data80;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data81;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data82;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data83;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data84;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data85;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data86;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data87;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data88;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data89;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data90;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data91;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data92;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data93;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data94;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data95;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data96;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data97;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data98;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data99;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data100;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data101;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data102;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data103;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data104;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data105;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data106;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data107;  // Read data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] data108;  // Read data
wire sel0;  // Set to 1 if reg_in==0
wire sel1;  // Set to 1 if reg_in==0
wire sel2;  // Set to 1 if reg_in==0
wire sel3;  // Set to 1 if reg_in==0
wire sel4;  // Set to 1 if reg_in==0
wire sel5;  // Set to 1 if reg_in==0
wire sel6;  // Set to 1 if reg_in==0
wire sel7;  // Set to 1 if reg_in==0
wire sel8;  // Set to 1 if reg_in==0
wire sel9;  // Set to 1 if reg_in==0
wire sel10;  // Set to 1 if reg_in==0
wire sel11;  // Set to 1 if reg_in==0
wire sel12;  // Set to 1 if reg_in==0
wire sel13;  // Set to 1 if reg_in==0
wire sel14;  // Set to 1 if reg_in==0
wire sel15;  // Set to 1 if reg_in==0
wire sel16;  // Set to 1 if reg_in==0
wire sel17;  // Set to 1 if reg_in==0
wire sel18;  // Set to 1 if reg_in==0
wire sel19;  // Set to 1 if reg_in==0
wire sel20;  // Set to 1 if reg_in==0
wire sel21;  // Set to 1 if reg_in==0
wire sel22;  // Set to 1 if reg_in==0
wire sel23;  // Set to 1 if reg_in==0
wire sel24;  // Set to 1 if reg_in==0
wire sel25;  // Set to 1 if reg_in==0
wire sel26;  // Set to 1 if reg_in==0
wire sel27;  // Set to 1 if reg_in==0
wire sel28;  // Set to 1 if reg_in==0
wire sel29;  // Set to 1 if reg_in==0
wire sel30;  // Set to 1 if reg_in==0
wire sel31;  // Set to 1 if reg_in==0
wire sel32;  // Set to 1 if reg_in==0
wire sel33;  // Set to 1 if reg_in==0
wire sel34;  // Set to 1 if reg_in==0
wire sel35;  // Set to 1 if reg_in==0
wire sel36;  // Set to 1 if reg_in==0
wire sel37;  // Set to 1 if reg_in==0
wire sel38;  // Set to 1 if reg_in==0
wire sel39;  // Set to 1 if reg_in==0
wire sel40;  // Set to 1 if reg_in==0
wire sel41;  // Set to 1 if reg_in==0
wire sel42;  // Set to 1 if reg_in==0
wire sel43;  // Set to 1 if reg_in==0
wire sel44;  // Set to 1 if reg_in==0
wire sel45;  // Set to 1 if reg_in==0
wire sel46;  // Set to 1 if reg_in==0
wire sel47;  // Set to 1 if reg_in==0
wire sel48;  // Set to 1 if reg_in==0
wire sel49;  // Set to 1 if reg_in==0
wire sel50;  // Set to 1 if reg_in==0
wire sel51;  // Set to 1 if reg_in==0
wire sel52;  // Set to 1 if reg_in==0
wire sel53;  // Set to 1 if reg_in==0
wire sel54;  // Set to 1 if reg_in==0
wire sel55;  // Set to 1 if reg_in==0
wire sel56;  // Set to 1 if reg_in==0
wire sel57;  // Set to 1 if reg_in==0
wire sel58;  // Set to 1 if reg_in==0
wire sel59;  // Set to 1 if reg_in==0
wire sel60;  // Set to 1 if reg_in==0
wire sel61;  // Set to 1 if reg_in==0
wire sel62;  // Set to 1 if reg_in==0
wire sel63;  // Set to 1 if reg_in==0
wire sel64;  // Set to 1 if reg_in==0
wire sel65;  // Set to 1 if reg_in==0
wire sel66;  // Set to 1 if reg_in==0
wire sel67;  // Set to 1 if reg_in==0
wire sel68;  // Set to 1 if reg_in==0
wire sel69;  // Set to 1 if reg_in==0
wire sel70;  // Set to 1 if reg_in==0
wire sel71;  // Set to 1 if reg_in==0
wire sel72;  // Set to 1 if reg_in==0
wire sel73;  // Set to 1 if reg_in==0
wire sel74;  // Set to 1 if reg_in==0
wire sel75;  // Set to 1 if reg_in==0
wire sel76;  // Set to 1 if reg_in==0
wire sel77;  // Set to 1 if reg_in==0
wire sel78;  // Set to 1 if reg_in==0
wire sel79;  // Set to 1 if reg_in==0
wire sel80;  // Set to 1 if reg_in==0
wire sel81;  // Set to 1 if reg_in==0
wire sel82;  // Set to 1 if reg_in==0
wire sel83;  // Set to 1 if reg_in==0
wire sel84;  // Set to 1 if reg_in==0
wire sel85;  // Set to 1 if reg_in==0
wire sel86;  // Set to 1 if reg_in==0
wire sel87;  // Set to 1 if reg_in==0
wire sel88;  // Set to 1 if reg_in==0
wire sel89;  // Set to 1 if reg_in==0
wire sel90;  // Set to 1 if reg_in==0
wire sel91;  // Set to 1 if reg_in==0
wire sel92;  // Set to 1 if reg_in==0
wire sel93;  // Set to 1 if reg_in==0
wire sel94;  // Set to 1 if reg_in==0
wire sel95;  // Set to 1 if reg_in==0
wire sel96;  // Set to 1 if reg_in==0
wire sel97;  // Set to 1 if reg_in==0
wire sel98;  // Set to 1 if reg_in==0
wire sel99;  // Set to 1 if reg_in==0
wire sel100;  // Set to 1 if reg_in==0
wire sel101;  // Set to 1 if reg_in==0
wire sel102;  // Set to 1 if reg_in==0
wire sel103;  // Set to 1 if reg_in==0
wire sel104;  // Set to 1 if reg_in==0
wire sel105;  // Set to 1 if reg_in==0
wire sel106;  // Set to 1 if reg_in==0
wire sel107;  // Set to 1 if reg_in==0
wire sel108;  // Set to 1 if reg_in==0
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] out;  // Read data out

//====================================================================
//     Local variables
//====================================================================
reg [`FIRE_CSRBUS_DATA_WIDTH-1:0] out_p1;
reg sel0_p1;
reg sel1_p1;
reg sel2_p1;
reg sel3_p1;
reg sel4_p1;
reg sel5_p1;
reg sel6_p1;
reg sel7_p1;
reg sel8_p1;
reg sel9_p1;
reg sel10_p1;
reg sel11_p1;
reg sel12_p1;
reg sel13_p1;
reg sel14_p1;
reg sel15_p1;
reg sel16_p1;
reg sel17_p1;
reg sel18_p1;
reg sel19_p1;
reg sel20_p1;
reg sel21_p1;
reg sel22_p1;
reg sel23_p1;
reg sel24_p1;
reg sel25_p1;
reg sel26_p1;
reg sel27_p1;
reg sel28_p1;
reg sel29_p1;
reg sel30_p1;
reg sel31_p1;
reg sel32_p1;
reg sel33_p1;
reg sel34_p1;
reg sel35_p1;
reg sel36_p1;
reg sel37_p1;
reg sel38_p1;
reg sel39_p1;
reg sel40_p1;
reg sel41_p1;
reg sel42_p1;
reg sel43_p1;
reg sel44_p1;
reg sel45_p1;
reg sel46_p1;
reg sel47_p1;
reg sel48_p1;
reg sel49_p1;
reg sel50_p1;
reg sel51_p1;
reg sel52_p1;
reg sel53_p1;
reg sel54_p1;
reg sel55_p1;
reg sel56_p1;
reg sel57_p1;
reg sel58_p1;
reg sel59_p1;
reg sel60_p1;
reg sel61_p1;
reg sel62_p1;
reg sel63_p1;
reg sel64_p1;
reg sel65_p1;
reg sel66_p1;
reg sel67_p1;
reg sel68_p1;
reg sel69_p1;
reg sel70_p1;
reg sel71_p1;
reg sel72_p1;
reg sel73_p1;
reg sel74_p1;
reg sel75_p1;
reg sel76_p1;
reg sel77_p1;
reg sel78_p1;
reg sel79_p1;
reg sel80_p1;
reg sel81_p1;
reg sel82_p1;
reg sel83_p1;
reg sel84_p1;
reg sel85_p1;
reg sel86_p1;
reg sel87_p1;
reg sel88_p1;
reg sel89_p1;
reg sel90_p1;
reg sel91_p1;
reg sel92_p1;
reg sel93_p1;
reg sel94_p1;
reg sel95_p1;
reg sel96_p1;
reg sel97_p1;
reg sel98_p1;
reg sel99_p1;
reg sel100_p1;
reg sel101_p1;
reg sel102_p1;
reg sel103_p1;
reg sel104_p1;
reg sel105_p1;
reg sel106_p1;
reg sel107_p1;
reg sel108_p1;

//====================================================================
//     Logic
//====================================================================
//select required ?
wire sel0_int=reg_in?sel0_p1:sel0;
wire sel1_int=reg_in?sel1_p1:sel1;
wire sel2_int=reg_in?sel2_p1:sel2;
wire sel3_int=reg_in?sel3_p1:sel3;
wire sel4_int=reg_in?sel4_p1:sel4;
wire sel5_int=reg_in?sel5_p1:sel5;
wire sel6_int=reg_in?sel6_p1:sel6;
wire sel7_int=reg_in?sel7_p1:sel7;
wire sel8_int=reg_in?sel8_p1:sel8;
wire sel9_int=reg_in?sel9_p1:sel9;
wire sel10_int=reg_in?sel10_p1:sel10;
wire sel11_int=reg_in?sel11_p1:sel11;
wire sel12_int=reg_in?sel12_p1:sel12;
wire sel13_int=reg_in?sel13_p1:sel13;
wire sel14_int=reg_in?sel14_p1:sel14;
wire sel15_int=reg_in?sel15_p1:sel15;
wire sel16_int=reg_in?sel16_p1:sel16;
wire sel17_int=reg_in?sel17_p1:sel17;
wire sel18_int=reg_in?sel18_p1:sel18;
wire sel19_int=reg_in?sel19_p1:sel19;
wire sel20_int=reg_in?sel20_p1:sel20;
wire sel21_int=reg_in?sel21_p1:sel21;
wire sel22_int=reg_in?sel22_p1:sel22;
wire sel23_int=reg_in?sel23_p1:sel23;
wire sel24_int=reg_in?sel24_p1:sel24;
wire sel25_int=reg_in?sel25_p1:sel25;
wire sel26_int=reg_in?sel26_p1:sel26;
wire sel27_int=reg_in?sel27_p1:sel27;
wire sel28_int=reg_in?sel28_p1:sel28;
wire sel29_int=reg_in?sel29_p1:sel29;
wire sel30_int=reg_in?sel30_p1:sel30;
wire sel31_int=reg_in?sel31_p1:sel31;
wire sel32_int=reg_in?sel32_p1:sel32;
wire sel33_int=reg_in?sel33_p1:sel33;
wire sel34_int=reg_in?sel34_p1:sel34;
wire sel35_int=reg_in?sel35_p1:sel35;
wire sel36_int=reg_in?sel36_p1:sel36;
wire sel37_int=reg_in?sel37_p1:sel37;
wire sel38_int=reg_in?sel38_p1:sel38;
wire sel39_int=reg_in?sel39_p1:sel39;
wire sel40_int=reg_in?sel40_p1:sel40;
wire sel41_int=reg_in?sel41_p1:sel41;
wire sel42_int=reg_in?sel42_p1:sel42;
wire sel43_int=reg_in?sel43_p1:sel43;
wire sel44_int=reg_in?sel44_p1:sel44;
wire sel45_int=reg_in?sel45_p1:sel45;
wire sel46_int=reg_in?sel46_p1:sel46;
wire sel47_int=reg_in?sel47_p1:sel47;
wire sel48_int=reg_in?sel48_p1:sel48;
wire sel49_int=reg_in?sel49_p1:sel49;
wire sel50_int=reg_in?sel50_p1:sel50;
wire sel51_int=reg_in?sel51_p1:sel51;
wire sel52_int=reg_in?sel52_p1:sel52;
wire sel53_int=reg_in?sel53_p1:sel53;
wire sel54_int=reg_in?sel54_p1:sel54;
wire sel55_int=reg_in?sel55_p1:sel55;
wire sel56_int=reg_in?sel56_p1:sel56;
wire sel57_int=reg_in?sel57_p1:sel57;
wire sel58_int=reg_in?sel58_p1:sel58;
wire sel59_int=reg_in?sel59_p1:sel59;
wire sel60_int=reg_in?sel60_p1:sel60;
wire sel61_int=reg_in?sel61_p1:sel61;
wire sel62_int=reg_in?sel62_p1:sel62;
wire sel63_int=reg_in?sel63_p1:sel63;
wire sel64_int=reg_in?sel64_p1:sel64;
wire sel65_int=reg_in?sel65_p1:sel65;
wire sel66_int=reg_in?sel66_p1:sel66;
wire sel67_int=reg_in?sel67_p1:sel67;
wire sel68_int=reg_in?sel68_p1:sel68;
wire sel69_int=reg_in?sel69_p1:sel69;
wire sel70_int=reg_in?sel70_p1:sel70;
wire sel71_int=reg_in?sel71_p1:sel71;
wire sel72_int=reg_in?sel72_p1:sel72;
wire sel73_int=reg_in?sel73_p1:sel73;
wire sel74_int=reg_in?sel74_p1:sel74;
wire sel75_int=reg_in?sel75_p1:sel75;
wire sel76_int=reg_in?sel76_p1:sel76;
wire sel77_int=reg_in?sel77_p1:sel77;
wire sel78_int=reg_in?sel78_p1:sel78;
wire sel79_int=reg_in?sel79_p1:sel79;
wire sel80_int=reg_in?sel80_p1:sel80;
wire sel81_int=reg_in?sel81_p1:sel81;
wire sel82_int=reg_in?sel82_p1:sel82;
wire sel83_int=reg_in?sel83_p1:sel83;
wire sel84_int=reg_in?sel84_p1:sel84;
wire sel85_int=reg_in?sel85_p1:sel85;
wire sel86_int=reg_in?sel86_p1:sel86;
wire sel87_int=reg_in?sel87_p1:sel87;
wire sel88_int=reg_in?sel88_p1:sel88;
wire sel89_int=reg_in?sel89_p1:sel89;
wire sel90_int=reg_in?sel90_p1:sel90;
wire sel91_int=reg_in?sel91_p1:sel91;
wire sel92_int=reg_in?sel92_p1:sel92;
wire sel93_int=reg_in?sel93_p1:sel93;
wire sel94_int=reg_in?sel94_p1:sel94;
wire sel95_int=reg_in?sel95_p1:sel95;
wire sel96_int=reg_in?sel96_p1:sel96;
wire sel97_int=reg_in?sel97_p1:sel97;
wire sel98_int=reg_in?sel98_p1:sel98;
wire sel99_int=reg_in?sel99_p1:sel99;
wire sel100_int=reg_in?sel100_p1:sel100;
wire sel101_int=reg_in?sel101_p1:sel101;
wire sel102_int=reg_in?sel102_p1:sel102;
wire sel103_int=reg_in?sel103_p1:sel103;
wire sel104_int=reg_in?sel104_p1:sel104;
wire sel105_int=reg_in?sel105_p1:sel105;
wire sel106_int=reg_in?sel106_p1:sel106;
wire sel107_int=reg_in?sel107_p1:sel107;
wire sel108_int=reg_in?sel108_p1:sel108;

//generate AND/OR
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] out_d = 
      {`FIRE_CSRBUS_DATA_WIDTH { sel0_int } } & data0 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel1_int } } & data1 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel2_int } } & data2 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel3_int } } & data3 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel4_int } } & data4 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel5_int } } & data5 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel6_int } } & data6 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel7_int } } & data7 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel8_int } } & data8 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel9_int } } & data9 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel10_int } } & data10 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel11_int } } & data11 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel12_int } } & data12 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel13_int } } & data13 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel14_int } } & data14 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel15_int } } & data15 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel16_int } } & data16 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel17_int } } & data17 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel18_int } } & data18 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel19_int } } & data19 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel20_int } } & data20 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel21_int } } & data21 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel22_int } } & data22 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel23_int } } & data23 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel24_int } } & data24 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel25_int } } & data25 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel26_int } } & data26 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel27_int } } & data27 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel28_int } } & data28 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel29_int } } & data29 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel30_int } } & data30 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel31_int } } & data31 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel32_int } } & data32 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel33_int } } & data33 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel34_int } } & data34 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel35_int } } & data35 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel36_int } } & data36 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel37_int } } & data37 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel38_int } } & data38 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel39_int } } & data39 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel40_int } } & data40 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel41_int } } & data41 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel42_int } } & data42 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel43_int } } & data43 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel44_int } } & data44 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel45_int } } & data45 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel46_int } } & data46 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel47_int } } & data47 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel48_int } } & data48 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel49_int } } & data49 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel50_int } } & data50 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel51_int } } & data51 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel52_int } } & data52 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel53_int } } & data53 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel54_int } } & data54 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel55_int } } & data55 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel56_int } } & data56 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel57_int } } & data57 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel58_int } } & data58 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel59_int } } & data59 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel60_int } } & data60 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel61_int } } & data61 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel62_int } } & data62 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel63_int } } & data63 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel64_int } } & data64 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel65_int } } & data65 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel66_int } } & data66 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel67_int } } & data67 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel68_int } } & data68 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel69_int } } & data69 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel70_int } } & data70 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel71_int } } & data71 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel72_int } } & data72 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel73_int } } & data73 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel74_int } } & data74 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel75_int } } & data75 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel76_int } } & data76 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel77_int } } & data77 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel78_int } } & data78 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel79_int } } & data79 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel80_int } } & data80 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel81_int } } & data81 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel82_int } } & data82 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel83_int } } & data83 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel84_int } } & data84 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel85_int } } & data85 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel86_int } } & data86 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel87_int } } & data87 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel88_int } } & data88 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel89_int } } & data89 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel90_int } } & data90 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel91_int } } & data91 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel92_int } } & data92 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel93_int } } & data93 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel94_int } } & data94 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel95_int } } & data95 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel96_int } } & data96 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel97_int } } & data97 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel98_int } } & data98 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel99_int } } & data99 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel100_int } } & data100 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel101_int } } & data101 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel102_int } } & data102 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel103_int } } & data103 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel104_int } } & data104 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel105_int } } & data105 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel106_int } } & data106 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel107_int } } & data107 |
      {`FIRE_CSRBUS_DATA_WIDTH { sel108_int } } & data108;

//reg out or combo
assign out=reg_out?out_p1:out_d;

//pipe control/data
always @(posedge clk)
  begin
     if(~rst_l)
       begin
          sel0_p1<=1'b0;
          sel1_p1<=1'b0;
          sel2_p1<=1'b0;
          sel3_p1<=1'b0;
          sel4_p1<=1'b0;
          sel5_p1<=1'b0;
          sel6_p1<=1'b0;
          sel7_p1<=1'b0;
          sel8_p1<=1'b0;
          sel9_p1<=1'b0;
          sel10_p1<=1'b0;
          sel11_p1<=1'b0;
          sel12_p1<=1'b0;
          sel13_p1<=1'b0;
          sel14_p1<=1'b0;
          sel15_p1<=1'b0;
          sel16_p1<=1'b0;
          sel17_p1<=1'b0;
          sel18_p1<=1'b0;
          sel19_p1<=1'b0;
          sel20_p1<=1'b0;
          sel21_p1<=1'b0;
          sel22_p1<=1'b0;
          sel23_p1<=1'b0;
          sel24_p1<=1'b0;
          sel25_p1<=1'b0;
          sel26_p1<=1'b0;
          sel27_p1<=1'b0;
          sel28_p1<=1'b0;
          sel29_p1<=1'b0;
          sel30_p1<=1'b0;
          sel31_p1<=1'b0;
          sel32_p1<=1'b0;
          sel33_p1<=1'b0;
          sel34_p1<=1'b0;
          sel35_p1<=1'b0;
          sel36_p1<=1'b0;
          sel37_p1<=1'b0;
          sel38_p1<=1'b0;
          sel39_p1<=1'b0;
          sel40_p1<=1'b0;
          sel41_p1<=1'b0;
          sel42_p1<=1'b0;
          sel43_p1<=1'b0;
          sel44_p1<=1'b0;
          sel45_p1<=1'b0;
          sel46_p1<=1'b0;
          sel47_p1<=1'b0;
          sel48_p1<=1'b0;
          sel49_p1<=1'b0;
          sel50_p1<=1'b0;
          sel51_p1<=1'b0;
          sel52_p1<=1'b0;
          sel53_p1<=1'b0;
          sel54_p1<=1'b0;
          sel55_p1<=1'b0;
          sel56_p1<=1'b0;
          sel57_p1<=1'b0;
          sel58_p1<=1'b0;
          sel59_p1<=1'b0;
          sel60_p1<=1'b0;
          sel61_p1<=1'b0;
          sel62_p1<=1'b0;
          sel63_p1<=1'b0;
          sel64_p1<=1'b0;
          sel65_p1<=1'b0;
          sel66_p1<=1'b0;
          sel67_p1<=1'b0;
          sel68_p1<=1'b0;
          sel69_p1<=1'b0;
          sel70_p1<=1'b0;
          sel71_p1<=1'b0;
          sel72_p1<=1'b0;
          sel73_p1<=1'b0;
          sel74_p1<=1'b0;
          sel75_p1<=1'b0;
          sel76_p1<=1'b0;
          sel77_p1<=1'b0;
          sel78_p1<=1'b0;
          sel79_p1<=1'b0;
          sel80_p1<=1'b0;
          sel81_p1<=1'b0;
          sel82_p1<=1'b0;
          sel83_p1<=1'b0;
          sel84_p1<=1'b0;
          sel85_p1<=1'b0;
          sel86_p1<=1'b0;
          sel87_p1<=1'b0;
          sel88_p1<=1'b0;
          sel89_p1<=1'b0;
          sel90_p1<=1'b0;
          sel91_p1<=1'b0;
          sel92_p1<=1'b0;
          sel93_p1<=1'b0;
          sel94_p1<=1'b0;
          sel95_p1<=1'b0;
          sel96_p1<=1'b0;
          sel97_p1<=1'b0;
          sel98_p1<=1'b0;
          sel99_p1<=1'b0;
          sel100_p1<=1'b0;
          sel101_p1<=1'b0;
          sel102_p1<=1'b0;
          sel103_p1<=1'b0;
          sel104_p1<=1'b0;
          sel105_p1<=1'b0;
          sel106_p1<=1'b0;
          sel107_p1<=1'b0;
          sel108_p1<=1'b0;
          out_p1<=`FIRE_CSRBUS_DATA_WIDTH'b0;
        end
      else
        begin
          sel0_p1<=sel0;
          sel1_p1<=sel1;
          sel2_p1<=sel2;
          sel3_p1<=sel3;
          sel4_p1<=sel4;
          sel5_p1<=sel5;
          sel6_p1<=sel6;
          sel7_p1<=sel7;
          sel8_p1<=sel8;
          sel9_p1<=sel9;
          sel10_p1<=sel10;
          sel11_p1<=sel11;
          sel12_p1<=sel12;
          sel13_p1<=sel13;
          sel14_p1<=sel14;
          sel15_p1<=sel15;
          sel16_p1<=sel16;
          sel17_p1<=sel17;
          sel18_p1<=sel18;
          sel19_p1<=sel19;
          sel20_p1<=sel20;
          sel21_p1<=sel21;
          sel22_p1<=sel22;
          sel23_p1<=sel23;
          sel24_p1<=sel24;
          sel25_p1<=sel25;
          sel26_p1<=sel26;
          sel27_p1<=sel27;
          sel28_p1<=sel28;
          sel29_p1<=sel29;
          sel30_p1<=sel30;
          sel31_p1<=sel31;
          sel32_p1<=sel32;
          sel33_p1<=sel33;
          sel34_p1<=sel34;
          sel35_p1<=sel35;
          sel36_p1<=sel36;
          sel37_p1<=sel37;
          sel38_p1<=sel38;
          sel39_p1<=sel39;
          sel40_p1<=sel40;
          sel41_p1<=sel41;
          sel42_p1<=sel42;
          sel43_p1<=sel43;
          sel44_p1<=sel44;
          sel45_p1<=sel45;
          sel46_p1<=sel46;
          sel47_p1<=sel47;
          sel48_p1<=sel48;
          sel49_p1<=sel49;
          sel50_p1<=sel50;
          sel51_p1<=sel51;
          sel52_p1<=sel52;
          sel53_p1<=sel53;
          sel54_p1<=sel54;
          sel55_p1<=sel55;
          sel56_p1<=sel56;
          sel57_p1<=sel57;
          sel58_p1<=sel58;
          sel59_p1<=sel59;
          sel60_p1<=sel60;
          sel61_p1<=sel61;
          sel62_p1<=sel62;
          sel63_p1<=sel63;
          sel64_p1<=sel64;
          sel65_p1<=sel65;
          sel66_p1<=sel66;
          sel67_p1<=sel67;
          sel68_p1<=sel68;
          sel69_p1<=sel69;
          sel70_p1<=sel70;
          sel71_p1<=sel71;
          sel72_p1<=sel72;
          sel73_p1<=sel73;
          sel74_p1<=sel74;
          sel75_p1<=sel75;
          sel76_p1<=sel76;
          sel77_p1<=sel77;
          sel78_p1<=sel78;
          sel79_p1<=sel79;
          sel80_p1<=sel80;
          sel81_p1<=sel81;
          sel82_p1<=sel82;
          sel83_p1<=sel83;
          sel84_p1<=sel84;
          sel85_p1<=sel85;
          sel86_p1<=sel86;
          sel87_p1<=sel87;
          sel88_p1<=sel88;
          sel89_p1<=sel89;
          sel90_p1<=sel90;
          sel91_p1<=sel91;
          sel92_p1<=sel92;
          sel93_p1<=sel93;
          sel94_p1<=sel94;
          sel95_p1<=sel95;
          sel96_p1<=sel96;
          sel97_p1<=sel97;
          sel98_p1<=sel98;
          sel99_p1<=sel99;
          sel100_p1<=sel100;
          sel101_p1<=sel101;
          sel102_p1<=sel102;
          sel103_p1<=sel103;
          sel104_p1<=sel104;
          sel105_p1<=sel105;
          sel106_p1<=sel106;
          sel107_p1<=sel107;
          sel108_p1<=sel108;
          out_p1<=out_d;
        end
  end

endmodule // dmu_imu_eqs_csrpipe_109
