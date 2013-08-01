// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: amb_dram_err_inject.v
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
module amb_dram_err_inject(
  clk,
  int_clk,
  DRAM_RST_L,
  DRAM_CS_L, 
  DRAM_BA,
  DRAM_RAS_L, 
  DRAM_CAS_L, 
  DRAM_WE_L,
  DRAM_DQ, 
  DRAM_DQS,
  DRAM_CB,
  AMB_L0_STATE,
  CHNL_ERR_ENABLE
  );

  input      		clk;
  input         	int_clk;
  input         	DRAM_RST_L;
  input [7:0]   	DRAM_CS_L;
  input [2:0]   	DRAM_BA;
  input         	DRAM_RAS_L;
  input         	DRAM_CAS_L;
  input         	DRAM_WE_L;
  inout [63:0]  	DRAM_DQ;
  inout [8:0]       DRAM_DQS;
  input [7:0]   	DRAM_CB;
  input         	AMB_L0_STATE;
  input                 CHNL_ERR_ENABLE;
 
  parameter AUTOREF_PERIOD = 1500;
  parameter ST_RAS  	   = 2'b00;
  parameter ST_CAS  	   = 2'b01;
  parameter ST_DATA        = 2'b10;
  parameter ST_REL  	   = 2'b11;

  integer      		ref_timer;
  integer      		dq_dly;
  integer      		stop_dq_dly;
  reg  [1:0]   		error_st;
  reg          		inject_err_s1=0;
  reg          		inject_err_s3=0;
  reg          		inject_err_s3_d1;
  reg          		inject_err_s3_d2;
  reg          		inject_err_s3_d3;
  reg          		inject_err_s3_d4;
  reg          		inject_err_s3_d5;
  reg          		inject_err_s3_d6;
  reg          		inject_err_s3_d7;
  reg  [63:0] 		data;
  reg  [7:0]  		ecc;
  reg  [7:0] 		inject_enable;
  reg          		addr_parity_err=0;
  reg  [2:0]   		cas_latency;
  reg 			    dram_enb_error=0;
  reg               one_bit_data_err=0;
  reg               multi_bit_data_err=0;
  reg               random_error=0;
  reg               scrub_mecc_secc_err;
  reg               scrub_secc_mecc_err;
  reg               only_one_mecc_secc_err;
  reg               only_one_secc_mecc_err;
  reg               inject_err_once=0;
  reg               multiple_err_per_burst=0;
  reg               inc_burst=0;
  reg [7:0]         burst_val;
  wire              dqs;

 integer flip;

`ifndef AXIS

`ifdef MCUSAT
  `include "mcu_dispmonDefines.vh"
`else
  `include "defines.vh"
  `include "dispmonDefines.vh"
`endif

initial 
begin


@(posedge DRAM_RST_L); 

   ref_timer = 0;
   error_st = ST_RAS;
   dq_dly = 0;
   inject_err_s3_d1 = 1'b0;
   inject_err_s3_d2 = 1'b0;
   inject_err_s3_d3 = 1'b0;
   inject_err_s3_d4 = 1'b0;
   inject_err_s3_d5 = 1'b0;
   inject_err_s3_d6 = 1'b0;
   inject_err_s3_d7 = 1'b0;
   data = 64'h0;
   ecc  = 8'h0;
   flip=0;
   burst_val = 8'h0;

    if ($test$plusargs("INJECT_ERR_ONCE"))
        inject_err_once = 1;

    if ($test$plusargs("MULTIPLE_ERROR_PER_BURST")) 
    begin
        multiple_err_per_burst = 1;
        if ($test$plusargs("INC_BURST")) //increment the subsequent burst 
            inc_burst = 1;

        if ($value$plusargs("BURST_VAL=%d",burst_val))
            `PR_ALWAYS ("amb_dram_err_injector", `ALWAYS, "INFO: BURST_VAL can be anything between 0 and 255 for SNG channel, or between 0 and 15 for dual channel - currently, user has specified %d",burst_val);
    end
  
  inject_enable = burst_val;

  if ($test$plusargs("ADDR_PARITY_ERR"))
    addr_parity_err = 1;

  if (! $value$plusargs("force_cas_latency=%d", cas_latency))
      cas_latency = 3 ;

  if (CHNL_ERR_ENABLE)
    dram_enb_error = 1;
  else
    dram_enb_error = 0;

  if ($test$plusargs("1BIT_DATA_ERROR"))  begin
    one_bit_data_err = 1'b1;
    flip=1;
  end
  else if ($test$plusargs("MULTI_BIT_DATA_ERROR")) begin
    multi_bit_data_err = 1'b1;
    flip=1;
  end
  else if ($test$plusargs("RANDOM_ERROR")) begin
    random_error = 1;
    flip=1;
  end


  if ($test$plusargs("ONLY_ONE_MECC_SECC")) begin
    only_one_mecc_secc_err = 1'b1;
    one_bit_data_err = 1'b0;
    multi_bit_data_err = 1'b1;
  end
  else if ($test$plusargs("ONLY_ONE_SECC_MECC")) begin
    only_one_secc_mecc_err = 1'b1;
    one_bit_data_err = 1'b1;
    multi_bit_data_err = 1'b0;
  end
  else if ($test$plusargs("SCRUB_MECC_SECC_ERROR")) begin
    scrub_mecc_secc_err = 1'b1;
    one_bit_data_err = 1'b0;
    multi_bit_data_err = 1'b1;
  end
  else if ($test$plusargs("SCRUB_SECC_MECC_ERROR")) begin
    scrub_secc_mecc_err = 1'b1;
    one_bit_data_err = 1'b1;
    multi_bit_data_err = 1'b0;
  end

if ( $test$plusargs("FLIP1") && (one_bit_data_err || multi_bit_data_err ) )
    begin
    flip=1; 
    `PR_ALWAYS ("amb_dram_err_injector", `ALWAYS, "INFO: will FLIP 1 bit in nibble!");
    end
else if ( $test$plusargs("FLIP2") && (one_bit_data_err || multi_bit_data_err ) )
    begin
    flip=2; 
    `PR_ALWAYS ("amb_dram_err_injector", `ALWAYS, "INFO: will FLIP 2 bits in nibble!");
    end
else if ( $test$plusargs("FLIP3") && (one_bit_data_err || multi_bit_data_err ) )
    begin
    flip=3; 
    `PR_ALWAYS ("amb_dram_err_injector", `ALWAYS, "INFO: will FLIP 3 bits in nibble!");
    end
else if ( $test$plusargs("FLIP4") && (one_bit_data_err || multi_bit_data_err ) )
    begin
    flip=4; 
    `PR_ALWAYS ("amb_dram_err_injector", `ALWAYS, "INFO: will FLIP 4 bits in nibble!");
    end
else if ( $test$plusargs("RANDOM_FLIP") && (one_bit_data_err || multi_bit_data_err ) ) 
    begin
    flip=({$random}%4)+1;
    `PR_ALWAYS ("amb_dram_err_injector", `ALWAYS, "INFO: will randomly FLIP 1/2/3/4 bits in nibble!");
    end

end

always @(clk) 
begin
    if (!DRAM_RST_L && dram_enb_error && AMB_L0_STATE) 
    begin 
      case (error_st)
        ST_RAS: begin
          if ( !DRAM_RAS_L && DRAM_CAS_L && DRAM_WE_L && !DRAM_CS_L[0]  )  begin
            error_st <= ST_CAS;
            end
        end
        ST_CAS: begin
          if ( DRAM_RAS_L && !DRAM_CAS_L && DRAM_WE_L && !DRAM_CS_L[0] )  begin
            error_st <= ST_DATA;
            end
        end
        ST_DATA: begin

          case(cas_latency) 
           3:  stop_dq_dly = 3;
           4:  stop_dq_dly = 4; 
           5:  stop_dq_dly = 6;
           6:  stop_dq_dly = 8;
           7:  stop_dq_dly = 10;
           default: stop_dq_dly = cas_latency-1;
          endcase

          `ifndef SUN_AMB
          if (dq_dly == ((stop_dq_dly+3)*2) - 2) begin
          `else
          if (dq_dly == ((stop_dq_dly+3)*2) - 1) begin
          `endif
            inject_err_s1 <= 1;
            dq_dly <= 0;
            error_st <= ST_REL;
          end
          else dq_dly <= dq_dly + 1;
        end
        ST_REL: begin
          inject_err_s1 <= 0;
          error_st <= ST_RAS;
        end
        default: begin
         `PR_ERROR ("amb_dram_err_injector", `ERROR, "Err injector entered unknown state\n");
          error_st <= ST_RAS;
        end
      endcase
    end
end

assign dqs = |DRAM_DQS;
reg [7:0] burst_cntr;
	
initial burst_cntr = 1;
integer i;
reg passed_bootEnd_mask=0;

always @ (posedge inject_err_s1) 
begin

    if(multiple_err_per_burst)
        // means inject on multiple quad words ; select from 8 in single channel, or 4 in dual channel 
    begin
        if (!$test$plusargs("SNG_CHANNEL"))  // i.e. which means dual channel, burst length is 4
        begin
            if(inc_burst) begin
                inject_enable = (burst_val + burst_cntr) % 16;
                burst_cntr = burst_cntr + 1;
            end
            else if(!(burst_val == 8'h0)) begin
                inject_enable = burst_val;
            end
            else begin
                inject_enable[2:0] = ({$random(`PARGS.seed)} % 8);
                inject_enable[3] = 1'b1;
                inject_enable[7:4] = 4'b0;
            end
        end
        else // single channel i.e. burst length is 8
        begin
            if(inc_burst) begin
                inject_enable = (burst_val + burst_cntr) % 256;
                burst_cntr = burst_cntr + 1;
            end
            else if(!(burst_val == 8'h0)) begin
                inject_enable = burst_val;
            end
            else begin
                inject_enable[1:0] = ({$random(`PARGS.seed)} % 3);
                inject_enable[3:2] = ({$random(`PARGS.seed)} % 3);
                inject_enable[5:4] = ({$random(`PARGS.seed)} % 3);
                inject_enable[7:6] = ({$random(`PARGS.seed)} % 3);
            end
        end
    end
    else // if(!multiple_err_per_burst)
    begin
        if (!$test$plusargs("SNG_CHANNEL"))  // i.e. which means dual channel
        begin
            inject_enable = 1 << ({$random(`PARGS.seed)} % 4); //pick any 1 of 4
        end
        else  // single channel
        begin
            inject_enable = 1 << ({$random(`PARGS.seed)} % 8); //pick any 1 of 8
        end
    end


    if(($test$plusargs("INJECT_ERR_ONCE")) && !inject_err_once)
        inject_enable = 8'b0;

`ifndef MCUSAT // only for fullchip	
`ifndef PLAYBACK
    if ( !(`TOP.gOutOfBoot[63:0] === `TOP.verif_args.finish_mask[63:0]) )  
            inject_enable = 8'b0; // set it to 0 if you are still inside bootcode
    else if (!passed_bootEnd_mask && (`TOP.gOutOfBoot[63:0] === `TOP.verif_args.finish_mask[63:0]) ) begin
        repeat (1000) @ (posedge clk); // wait until 1000 cycles after bootcode ends, then start injecting...
        passed_bootEnd_mask=1;
    end
`endif // PLAYBACK
`endif


    @(posedge dqs);
    inject_err_s3 = inject_enable[0];
    inject_enable[0] = 1'b0;

    @(negedge dqs);
    inject_err_s3_d1 = inject_enable[1];
    inject_enable[1] = 1'b0;
    inject_err_s3 = 1'b0;

    @(posedge dqs);
    inject_err_s3_d2 = inject_enable[2];
    inject_enable[2] = 1'b0;
    inject_err_s3_d1 = 1'b0;

    @(negedge dqs);
    inject_err_s3_d3 = inject_enable[3];
    inject_enable[3] = 1'b0;
    inject_err_s3_d2 = 1'b0;

    `ifdef SNG_CHANNEL
    @(posedge dqs);
    inject_err_s3_d4 = inject_enable[4];
    inject_enable[4] = 1'b0;
    inject_err_s3_d3 = 1'b0;

    @(negedge dqs);
    inject_err_s3_d5 = inject_enable[5];
    inject_enable[5] = 1'b0;
    inject_err_s3_d4 = 1'b0;

    @(posedge dqs);
    inject_err_s3_d6 = inject_enable[6];
    inject_enable[6] = 1'b0;
    inject_err_s3_d5 = 1'b0;

    @(negedge dqs);
    inject_err_s3_d7 = inject_enable[7];
    inject_enable[7] = 1'b0;
    inject_err_s3_d6 = 1'b0;

    @(posedge clk);
    @(posedge clk);
    inject_err_s3_d7 = 1'b0;

    `else
    @(posedge clk);
    @(posedge clk);
    inject_err_s3_d3 = 1'b0;
    `endif

end

`ifdef MCU_GATE
wire mcu0_esr_dac = `MCU0.rdpctl_err_sts_reg[23];
wire mcu1_esr_dac = `MCU1.rdpctl_err_sts_reg[23];
wire mcu2_esr_dac = `MCU2.rdpctl_err_sts_reg[23];
wire mcu3_esr_dac = `MCU3.rdpctl_err_sts_reg[23];

wire mcu0_esr_dau = `MCU0.rdpctl_err_sts_reg[22];
wire mcu1_esr_dau = `MCU1.rdpctl_err_sts_reg[22];
wire mcu2_esr_dau = `MCU2.rdpctl_err_sts_reg[22];
wire mcu3_esr_dau = `MCU3.rdpctl_err_sts_reg[22];
`else  
wire mcu0_esr_dac = `MCU0.drif.rdpctl_err_sts_reg[23];
wire mcu1_esr_dac = `MCU1.drif.rdpctl_err_sts_reg[23];
wire mcu2_esr_dac = `MCU2.drif.rdpctl_err_sts_reg[23];
wire mcu3_esr_dac = `MCU3.drif.rdpctl_err_sts_reg[23];

wire mcu0_esr_dau = `MCU0.drif.rdpctl_err_sts_reg[22];
wire mcu1_esr_dau = `MCU1.drif.rdpctl_err_sts_reg[22];
wire mcu2_esr_dau = `MCU2.drif.rdpctl_err_sts_reg[22];
wire mcu3_esr_dau = `MCU3.drif.rdpctl_err_sts_reg[22];
`endif




reg [63:0] nibble_err_position1;
reg [63:0] nibble_err_position2;
reg [31:0] random;
reg[63:0]tmp;


time stop_ecc_inj_time=0; time restart_ecc_inj_time=0; time restart_stop_ecc_inj_time=0;
reg stop_mask=0; reg restart_mask=0; reg restart_stop_mask=0;

initial 
begin
if($value$plusargs("STOP_ECC_INJ_TIME=%d",stop_ecc_inj_time))
    `PR_ALWAYS("amb_dram_err_injector", `ALWAYS, "*** Parameter \"STOP_ECC_INJ_TIME\" has been set to %d",stop_ecc_inj_time);
end
initial 
begin
if($value$plusargs("RESTART_ECC_INJ_TIME=%d",restart_ecc_inj_time))
    `PR_ALWAYS("amb_dram_err_injector", `ALWAYS, "*** Parameter \"RESTART_ECC_INJ_TIME\" has been set to %d",restart_ecc_inj_time);
end
initial 
begin
if($value$plusargs("RESTART_STOP_ECC_INJ_TIME=%d",restart_stop_ecc_inj_time))
    `PR_ALWAYS("amb_dram_err_injector", `ALWAYS, "*** Parameter \"RESTART_STOP_ECC_INJ_TIME\" has been set to %d",restart_stop_ecc_inj_time);
end


`ifndef MCUSAT // only for fullchip	
integer delay_ecc;
initial begin
    if (!$value$plusargs("DELAY_ECC=%d",delay_ecc)) delay_ecc=10;
end
integer counter_delay_ecc; initial counter_delay_ecc=0;
`endif


reg [63:0] corrupted_data;
integer ce_count; initial ce_count=0;
integer ue_count; initial ue_count=0;


always @ (               posedge inject_err_s3 or
	                     posedge inject_err_s3_d1 or
	                     posedge inject_err_s3_d2 or
	                     posedge inject_err_s3_d3 or
	                     posedge inject_err_s3_d4 or
	                     posedge inject_err_s3_d5 or
	                     posedge inject_err_s3_d6 or
	                     posedge inject_err_s3_d7
    ) begin

     data =  DRAM_DQ;
     ecc  =  DRAM_CB;
     inject_err_once=0;

//random 1-bit or multi-bit
    if(random_error) begin
        random={$random}%2;
        if(random[0]) begin
            one_bit_data_err = 1'b1;
            multi_bit_data_err = 1'b0;
        end
        else if(!random[0]) begin
            one_bit_data_err = 1'b0;
            multi_bit_data_err = 1'b1;
        end
    end


  if ( !stop_mask && !($time < stop_ecc_inj_time) && !(stop_ecc_inj_time == 0) )
    begin
     `PR_ALWAYS("amb_dram_err_injector", `ALWAYS, "INFO: *** Stopping ecc err injection, time now is %d",$time);
    	force one_bit_data_err = 0; force multi_bit_data_err = 0;
	    stop_mask = 1;
    end
  else if ( !restart_mask && !($time < restart_ecc_inj_time) && !(restart_ecc_inj_time == 0) && (restart_ecc_inj_time > stop_ecc_inj_time) )
    begin
     `PR_ALWAYS("amb_dram_err_injector", `ALWAYS, "INFO: *** Restarting ecc err injection, time now is %d",$time);
	    release one_bit_data_err; release multi_bit_data_err;
	    restart_mask=1;
     end
  else if ( !restart_stop_mask && !($time < restart_stop_ecc_inj_time) && !(restart_stop_ecc_inj_time == 0) && (restart_stop_ecc_inj_time > restart_ecc_inj_time) )
    begin
     `PR_ALWAYS("amb_dram_err_injector", `ALWAYS, "INFO: *** Stopping the restarted ecc err injection, time now is %d",$time);
    	force one_bit_data_err = 0; force multi_bit_data_err = 0;
	    restart_stop_mask=1;
     end


`ifndef MCUSAT
     counter_delay_ecc = counter_delay_ecc+1;
    if ( (!mcu0_esr_dau && !mcu1_esr_dau && !mcu2_esr_dau && !mcu3_esr_dau) &&
         (!mcu0_esr_dac && !mcu1_esr_dac && !mcu2_esr_dac && !mcu3_esr_dac) &&
         (counter_delay_ecc % delay_ecc == 0) ) begin
`endif
        if (one_bit_data_err) ce_count=ce_count+1;
        else if (multi_bit_data_err) ue_count=ue_count+1;
        corrupted_data = error_inject(data, one_bit_data_err, multi_bit_data_err,flip,ce_count,ue_count);
        #1 force DRAM_DQ = corrupted_data;
`ifndef MCUSAT
    end
`endif

    if (addr_parity_err) begin 
          `PR_ALWAYS ("amb_dram_err_injector", `ALWAYS, "INFO: Address parity inversion : Injecting err by inverting ecc %x,%x\n", ecc,data[63:56]);
        force DRAM_CB = ~ecc; 
        force DRAM_DQ[63:56] = ~data[63:56];
          `PR_ALWAYS ("amb_dram_err_injector", `ALWAYS, "INFO: Erred ecc is %x,%x", ~ecc, ~data[63:56]);
    end

    if(scrub_secc_mecc_err && one_bit_data_err) begin
        multi_bit_data_err = 1'b1;
        one_bit_data_err = 1'b0;
    end
    else if(scrub_secc_mecc_err && multi_bit_data_err) begin
        multi_bit_data_err = 1'b0;
        one_bit_data_err = 1'b0;
    end
    else if(scrub_secc_mecc_err && !one_bit_data_err && !multi_bit_data_err)
        one_bit_data_err = 1'b1;

    if(scrub_mecc_secc_err && multi_bit_data_err) begin
        multi_bit_data_err = 1'b0;
        one_bit_data_err = 1'b1;
    end
    else if(scrub_mecc_secc_err && one_bit_data_err) begin
        multi_bit_data_err = 1'b0;
        one_bit_data_err = 1'b0;
    end
    else if(scrub_mecc_secc_err && !multi_bit_data_err && !one_bit_data_err)
        multi_bit_data_err = 1'b1;

    if(only_one_mecc_secc_err && multi_bit_data_err) begin
        multi_bit_data_err = 1'b0;
        one_bit_data_err = 1'b1;
    end
    else if(only_one_mecc_secc_err && one_bit_data_err) begin
        multi_bit_data_err = 1'b0;
        one_bit_data_err = 1'b0;
        only_one_mecc_secc_err = 1'b0;
    end

    if(only_one_secc_mecc_err && one_bit_data_err) begin
        multi_bit_data_err = 1'b1;
        one_bit_data_err = 1'b0;
    end
    else if(only_one_secc_mecc_err && multi_bit_data_err) begin
        multi_bit_data_err = 1'b0;
        one_bit_data_err = 1'b0;
        only_one_secc_mecc_err = 1'b0;
    end

end 


always @ ( clk ) begin
    #1000 release DRAM_DQ;
    release DRAM_CB;
end


function [63:0] error_inject;
input [63:0] data;
input one_bit_data_err;
input multi_bit_data_err;
input [31:0] flip;
input [31:0] ce_count;
input [31:0] ue_count;
reg [3:0] nibble_err_position1;
reg [3:0] nibble_err_position2;
reg [63:0]tmp_data;
reg [3:0] cf_out;

begin

    if (one_bit_data_err) 
    begin
    nibble_err_position1 = {$random}%16;
    
    cf_out=calc_flipbits(flip);
    tmp_data=(cf_out << (4*nibble_err_position1));
    error_inject = data ^ tmp_data;
    `PR_ALWAYS ("amb_dram_err_injector", `ALWAYS, "INFO: Injected CE error no. %d (nibble # is %d, %d bits/nibble flipped, nibble config is %4b) --> orig. data was %x, modif. data is %x",ce_count, nibble_err_position1,flip,cf_out,data,error_inject);
    end 
    
    else if(multi_bit_data_err) begin
    nibble_err_position1 = {$random}%16;
    nibble_err_position2 = {$random}%16;
    while (nibble_err_position2 == nibble_err_position1)
        nibble_err_position2 = {$random}%16;

    cf_out = calc_flipbits(flip);
    tmp_data=(cf_out << (4*nibble_err_position1));
    tmp_data=tmp_data | (cf_out << (4*nibble_err_position2));
    error_inject = data ^ tmp_data;
    `PR_ALWAYS ("amb_dram_err_injector", `ALWAYS, "INFO: Injected UE error no. %d (nibble #s are %d and %d, %d bits/nibble flipped, nibble config is %4b) --> orig. data was %x, modif. data is %x",ue_count, nibble_err_position1,nibble_err_position2,flip,cf_out,data,error_inject);
    end
    
end
endfunction


function [3:0] calc_flipbits;
input [31:0] flip;
begin
        case (flip)
            1: begin
                i=({$random}%4)+1;
                case (i)
                    1: calc_flipbits=4'b0001;
                    2: calc_flipbits=4'b0010;
                    3: calc_flipbits=4'b0100;
                    4: calc_flipbits=4'b1000;
                    default: calc_flipbits=4'b0001;
                endcase
                end
            2: begin
                i=({$random}%6)+1;
                case (i)
                    1: calc_flipbits=4'b0011;
                    2: calc_flipbits=4'b0101;
                    3: calc_flipbits=4'b1001;
                    4: calc_flipbits=4'b0110;
                    5: calc_flipbits=4'b1010;
                    6: calc_flipbits=4'b1100;
                    default: calc_flipbits=4'b0011;
                endcase
                end
            3: begin
                i=({$random}%4)+1;
                case (i)
                    1: calc_flipbits=4'b0111;
                    2: calc_flipbits=4'b1011;
                    3: calc_flipbits=4'b1101;
                    4: calc_flipbits=4'b1110;
                    default: calc_flipbits=4'b0111;
                endcase
                end
            4: calc_flipbits=4'b1111;
        endcase
end
endfunction

`endif
endmodule
