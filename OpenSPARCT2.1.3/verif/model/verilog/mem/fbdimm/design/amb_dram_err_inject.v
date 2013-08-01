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
  // DRAM_FAIL_OVER,
  //DRAM_FAIL_PART
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
  //input         	DRAM_FAIL_OVER;
  //input  [5:0]  	DRAM_FAIL_PART;
  input                 CHNL_ERR_ENABLE;
 
  parameter AUTOREF_PERIOD = 1500;
  parameter ST_RAS  	   = 2'b00;
  parameter ST_CAS  	   = 2'b01;
  parameter ST_DATA        = 2'b10;
  parameter ST_REL  	   = 2'b11;

  integer      		ref_timer;
  integer      		dq_dly;
  integer      		flip_for_mecc;
  integer      		stop_dq_dly;
  reg  [1:0]   		error_st;
  reg          		inject_err_s1;
  reg          		inject_err_s1_1;
  reg          		inject_err_s1_2;
  reg          		inject_err_s1_3;
  reg          		inject_err_s1_4;
  reg          		inject_err_s1_5;
  reg          		inject_err_s2;
  reg          		inject_err_s2_d1;
  reg          		inject_err_s2_d2;
  reg          		inject_err_s2_d3;
  reg          		inject_err_s3;
  reg          		inject_err_s3_d1;
  reg          		inject_err_s3_d2;
  reg          		inject_err_s3_d3;
  reg  [63:0] 		data;
  reg  [7:0]  		ecc;
  reg  [3:0] 		err_bits,err_bits1;
  reg  [3:0] 		inject_enable;
  reg          		ecc_err_inject;
  reg  [31:0] 		err_pos; 
  reg  [31:0] 		err_pos1; 
  reg  [31:0] 		synd_err_pos; 
  reg          		addr_parity_err;
  reg          		enb_mecc_error;
  reg               inject_err_once;
  reg          		disable_mecc, disable_secc;
  reg  [2:0]   		cas_latency;
  reg 			dram_enb_error;
  wire          	synd_ecc_err_inject;
  wire [3:0] 		synd_err_bits;
  wire [31:0] 		synd_err_pos1; 
  reg  [63:0]       tmp;
  reg               one_bit_data_err;
  reg               multi_bit_data_err;
  reg               random_error;
  reg               scrub_mecc_secc_err;
  reg               mecc_secc_err;
  reg               secc_mecc_err;

  time              bcode_finish;

  wire              dqs;

// dbg signals for error_mon
  reg               dbg_mecc_err_injected;
  reg               dbg_secc_err_injected;

initial 
begin

   @(posedge DRAM_RST_L) 

   ref_timer = 0;
   flip_for_mecc = 1;
   err_pos = 0;
   err_pos1 = 0;
   ecc_err_inject = 1;
   error_st = ST_RAS;
   dq_dly = 0;
   inject_err_s1 = 1'b0;
   inject_err_s3 = 1'b0;
   inject_err_s3_d1 = 1'b0;
   inject_err_s3_d2 = 1'b0;
   inject_err_s3_d3 = 1'b0;
   data = 64'h0;
   ecc  = 8'h0;
   disable_mecc = 1'b0;
   disable_secc = 1'b0;

    if ($test$plusargs("INJECT_ERR_ONCE"))
        inject_err_once = 1;
    else
        inject_err_once = 0;
  
  if ($test$plusargs("ADDR_PARITY_ERR"))
    addr_parity_err = 1;
  else  
    addr_parity_err = 0;

  if ($test$plusargs("ENB_MECC_ERROR"))
    enb_mecc_error = 1;
  else 
    enb_mecc_error = 0;

  if (! $value$plusargs("force_cas_latency=%d", cas_latency))
      cas_latency = 3 ;

  if (CHNL_ERR_ENABLE)
    dram_enb_error = 1;
  else
    dram_enb_error = 0;

  if ($test$plusargs("1BIT_DATA_ERROR")) 
    one_bit_data_err = 1'b1;

  if ($test$plusargs("MULTI_BIT_DATA_ERROR")) 
    multi_bit_data_err = 1'b1;

  if ($test$plusargs("SCRUB_MECC_SECC_ERROR")) begin
    scrub_mecc_secc_err = 1'b1;
    one_bit_data_err = 1'b0;
    multi_bit_data_err = 1'b1;
  end

  if ($test$plusargs("ONLY_ONE_MECC_SECC")) begin
    mecc_secc_err = 1'b1;
    one_bit_data_err = 1'b0;
    multi_bit_data_err = 1'b1;
  end

  if ($test$plusargs("ONLY_ONE_SECC_MECC")) begin
    secc_mecc_err = 1'b1;
    one_bit_data_err = 1'b1;
    multi_bit_data_err = 1'b0;
  end

  if ($test$plusargs("RANDOM_ERROR")) begin
    one_bit_data_err = 1'b0;
    multi_bit_data_err = 1'b0;
    random_error = 1'b1;
  end
  else 
    random_error = 1'b0;

  if(!$value$plusargs("BOOT_CODE_FINISH=%d",bcode_finish))
    bcode_finish = 0;

  dbg_mecc_err_injected <= 1'b0;
  dbg_secc_err_injected <= 1'b0;
end

always @(clk) 
begin
    if (!DRAM_RST_L && dram_enb_error && AMB_L0_STATE) 
    begin 
      case (error_st)
        ST_RAS: begin
          //$display ("%0d %m: Err injector state ST_RAS\n", $time);
          dbg_secc_err_injected <= 1'b0;
          dbg_mecc_err_injected <= 1'b0;
          if ( !DRAM_RAS_L && DRAM_CAS_L && DRAM_WE_L && !DRAM_CS_L[0]  ) 
            error_st <= ST_CAS;
        end
        ST_CAS: begin
          //$display ("%0d %m: Err injector state ST_CAS\n", $time);
          if ( DRAM_RAS_L && !DRAM_CAS_L && DRAM_WE_L && !DRAM_CS_L[0] ) 
            error_st <= ST_DATA;
        end
        ST_DATA: begin
          //$display ("%0d %m: Err injector state ST_DATA\n", $time);

          case(cas_latency) 
           3:  stop_dq_dly = 3;
           4:  stop_dq_dly = 4; 
           5:  stop_dq_dly = 6;
           6:  stop_dq_dly = 8;
           7:  stop_dq_dly = 10;
           default: stop_dq_dly = cas_latency-1;
          endcase

          `ifdef IDT_FBDIMM
          if (dq_dly == ((stop_dq_dly+3)*2) - 2) begin
          `else
          if (dq_dly == ((stop_dq_dly+3)*2) - 1) begin
          `endif
            inject_err_s1 <= 1'b1;
            dq_dly <= 0;
            error_st <= ST_REL;
          end
          else dq_dly <= dq_dly + 1;
        end
        ST_REL: begin
          //$display ("%0d %m: Err injector state ST_REL\n", $time);
          inject_err_s1 <= 1'b0;
          error_st <= ST_RAS;
        end
        default: begin
          $display ("%0d %m: Err injector entered unknown state\n", $time);
          error_st <= ST_RAS;
        end
      endcase
    end
end

assign dqs = |DRAM_DQS;
reg [1:0] err_burst1;
reg [1:0] err_burst2;

always @(clk) 
begin 
    inject_err_s1_1 <= inject_err_s1;
    inject_err_s1_2 <= inject_err_s1_1;
    inject_err_s1_3 <= inject_err_s1_2;
    inject_err_s1_4 <= inject_err_s1_3;
    inject_err_s1_5 <= inject_err_s1_4;
end
	
always @ (posedge inject_err_s1)
begin
    err_burst1 = ($random() % 4);
    inject_enable = 1'b1 << err_burst1;

    if ($test$plusargs("TWO_ERROR_PER_BURST")) begin
        err_burst2 = ($random() % 4);
        if(err_burst2 != err_burst1)
            inject_enable = inject_enable | (1'b1 << err_burst2);
        else
            inject_enable = inject_enable | (1'b1 << (err_burst2 + 1));
    end
    else if($test$plusargs("RANDOM_ERROR_PER_BURST"))
        inject_enable = ($random() & 4'hf);

    if(($test$plusargs("INJECT_ERR_ONCE")) && !inject_err_once)
        inject_enable = 4'h0;

    if($time < bcode_finish)
        inject_enable = 4'b0;

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

    @(posedge dqs);
    inject_err_s3_d3 = 1'b0;

end

/*
always @ (posedge dqs)
begin
    inject_err_s3 = inject_enable[0];
    inject_err_s3_d1 = 1'b0;
    inject_err_s3_d2 = inject_enable[2];
    inject_err_s3_d3 = 1'b0;
end

always @ (negedge dqs)
begin
    inject_err_s3 = 1'b0;
    inject_err_s3_d1 = inject_enable[1];
    inject_err_s3_d2 = 1'b0;
    inject_err_s3_d3 = inject_enable[3];
end
*/

/*	
always @(int_clk) 
begin
 inject_err_s2 <=  inject_err_s1;
 inject_err_s2_d1 <=  inject_err_s1_1;
 inject_err_s2_d2 <=  inject_err_s1_2;
 inject_err_s2_d3 <=  inject_err_s1_3;
end

always @ (posedge inject_err_s2 or 
          posedge inject_err_s2_d1 or 
          posedge inject_err_s2_d2 or 
          posedge inject_err_s2_d3  ) 
begin
    data =  DRAM_DQ;
    ecc  =  DRAM_CB;
    inject_enable = #10 $random() & 4'hf;

    if ($test$plusargs("ONE_ERROR_PER_BURST")) 
        inject_enable = 4'h1;
    else if ($test$plusargs("TWO_ERROR_PER_BURST")) 
        inject_enable = 4'h5;

    if(($test$plusargs("INJECT_ERR_ONCE")) && !inject_err_once)
        inject_enable = 4'h0;

    if($time < bcode_finish)
        inject_enable = 4'b0;

      inject_err_s3 <= (inject_enable[0] && inject_err_s2);
      inject_err_s3_d1 <=  (inject_enable[1] && inject_err_s2_d1);
      inject_err_s3_d2 <= (inject_enable[2] && inject_err_s2_d2);
      inject_err_s3_d3 <= (inject_enable[3] && inject_err_s2_d3);
end

always @ (negedge inject_err_s2)
    inject_err_s3 = 1'b0;

always @ (negedge inject_err_s2_d1)
    inject_err_s3_d1 = 1'b0;

always @ (negedge inject_err_s2_d2)
    inject_err_s3_d2 = 1'b0;

always @ (negedge inject_err_s2_d3)
    inject_err_s3_d3 = 1'b0;


always @ (posedge inject_err_s3_d3)
    flip_for_mecc = !flip_for_mecc;
*/


reg [63:0] err_position;
reg [63:0] err_position1;
reg [1:0]  err_type;
  
always @ (posedge inject_err_s3 or 
          posedge inject_err_s3_d1 or
          posedge inject_err_s3_d2 or
          posedge inject_err_s3_d3)
begin
`ifdef IDT_FBDIMM
data =  DRAM_DQ;
`else
#310 data =  DRAM_DQ;
`endif
     ecc  =  DRAM_CB;
    inject_err_once <= 1'b0;

    err_position = ($random % 63);
    err_position1 = ($random % 63);


    if(random_error == 1'b1) begin
        err_type = ($random % 3);
        if(err_type == 2'b0) begin
            one_bit_data_err = 1'b0;
            multi_bit_data_err = 1'b0;
        end
        else if(err_type == 2'b01) begin
            one_bit_data_err = 1'b1;
            multi_bit_data_err = 1'b0;
        end
        else if(err_type == 2'b10) begin
            one_bit_data_err = 1'b0;
            multi_bit_data_err = 1'b1;
        end
    end

    if (one_bit_data_err) begin
        $display ("%0d: Injecting 1 Bit error on data %x at bit %d\n", $time, data, err_position);
        tmp = 64'b1 << err_position;
        force DRAM_DQ = data ^ tmp;
        dbg_secc_err_injected <= 1'b1;
        $display ("%0d: Erred data is %x at bit %d\n", $time, (data ^ tmp), err_position);
    end else if(multi_bit_data_err) begin
        if((err_position / 4) == (err_position1 / 4))  begin
            err_position1 = err_position1 + 4;
            err_position1 = (err_position1 % 64);
        end
        $display ("%0d: Injecting Multi-bit error on data %x at bits %d and %d\n", $time, data, err_position, err_position1);
        tmp = 64'b1 << err_position;
        tmp = (tmp | (64'b1 << err_position1));
        force DRAM_DQ = data ^ tmp;
        dbg_mecc_err_injected <= 1'b1;
        $display ("%0d: Erred data is %x, tmp = %x\n", $time, (data ^ tmp), tmp);
    end

    if (addr_parity_err) begin 
        $display ("%0d: Address parity inversion : Injecting error by inverting ecc %x \n", $time, ecc);
        force DRAM_CB = ~ecc; 
        $display ("%0d: Erred ecc is %x\n", $time, ~ecc);
    end

    if(scrub_mecc_secc_err && multi_bit_data_err) begin
        multi_bit_data_err = 1'b0;
        one_bit_data_err = 1'b1;
    end
    else if(scrub_mecc_secc_err && one_bit_data_err) begin
        multi_bit_data_err = 1'b0;
        one_bit_data_err = 1'b0;
    end
    else if(scrub_mecc_secc_err)
        multi_bit_data_err = 1'b1;

    if(mecc_secc_err && multi_bit_data_err) begin
        multi_bit_data_err = 1'b0;
        one_bit_data_err = 1'b1;
    end
    else if(mecc_secc_err && one_bit_data_err) begin
        multi_bit_data_err = 1'b0;
        one_bit_data_err = 1'b0;
        mecc_secc_err = 1'b0;
    end

    if(secc_mecc_err && one_bit_data_err) begin
        multi_bit_data_err = 1'b1;
        one_bit_data_err = 1'b0;
    end
    else if(secc_mecc_err && multi_bit_data_err) begin
        multi_bit_data_err = 1'b0;
        one_bit_data_err = 1'b0;
        secc_mecc_err = 1'b0;
    end






    /* OLD N1 CODE; COMMENTED OUT BECAUSE IT DOESN'T WORK WELL WITH N2 -ncr
    err_bits = $random() & 4'hf;
    err_bits1 = $random() & 4'hf;
    // If injecting error in each nibble
    if ($test$plusargs("EACH_NIBBLE_ERROR")) begin
        ecc_err_inject = (err_pos == 0) ? !ecc_err_inject : ecc_err_inject;
        err_pos = (err_pos == 60) ? 0 : (((err_pos >> 2) + 1)*4);
        err_pos1 = (err_pos1 == 60) ? 0 : (err_pos == 60) ? (((err_pos1 >> 2) + 1)*4) : err_pos1;
    end else begin 
        ecc_err_inject = $random() & 1'b1;
        err_pos = ($random() & 5'h1f) * 4;
        err_pos1 = ($random() & 5'h1f) * 4;
    end 

    // ***   Commented out for now   ********
//    if (dram_enb_error && DRAM_FAIL_OVER) begin 
//      force DRAM_DQ = data ^ ((err_bits << err_pos) | (4'hf << (DRAM_FAIL_PART * 4)));
//      $display ("%0d: Injecting Err on data %x at bit %d\n", $time, data, err_pos);
//    end 
//    *****************************************

    if (dram_enb_error) begin 
        if ($test$plusargs("ONLY_ONE_MECC_SECC")) begin
            if (addr_parity_err && !disable_mecc) begin 
                force DRAM_CB = ~ecc; 
                $display ("%0d: Address parity inversion : Injecting Err by inverting ecc %x \n", $time, ecc);
                disable_mecc = 1;
            end else begin 
                if(!disable_secc) begin 
                    disable_secc = 1;
                    force DRAM_DQ = data ^ (err_bits << err_pos);
                    $display ("%0d: Injecting Err on data %x at bit %d\n", $time, data, err_pos);
                end
            end
        end else 
            if ($test$plusargs("ONLY_ONE_SECC_MECC")) begin
                if(!disable_secc) begin 
                    disable_secc = 1;
                    force DRAM_DQ = data ^ (err_bits << err_pos);
                    $display ("%0d: Injecting Err on data %x at bit %d\n", $time, data, err_pos);
                end else begin 
                    if (addr_parity_err && !disable_mecc) begin 
                        force DRAM_CB = ~ecc; 
                        $display ("%0d: Address parity inversion : Injecting Err by inverting ecc %x \n", $time, ecc);
                        disable_mecc = 1;
                    end
                end
            end else 
                if ($test$plusargs("SYNDROME_TEST")) begin
                    synd_err_pos = (synd_err_pos1 & 5'h1f) * 4;
                    if(!synd_ecc_err_inject) begin   // this is a random number so inject data or ecc errors randomly
                        force DRAM_DQ = data ^ (synd_err_bits << synd_err_pos);
                        $display ("%0d: Injecting Err on data %x at bit %d\n", $time, data, synd_err_pos);
                        $display ("%0d: Erred data %x at synd_err_pos %x with synd_err_bits %x\n", $time, DRAM_DQ, synd_err_pos,synd_err_bits);
                    end else begin 
                        force DRAM_CB = ecc  ^ (synd_err_bits << synd_err_pos[3:0]);
                        $display ("%0d: Injecting Err on ecc %x at bit %d\n", $time, ecc, synd_err_pos[3:0]);
                        $display ("%0d: Erred ecc %x at synd_err_pos %x with synd_err_bits %x\n", $time, DRAM_CB, synd_err_pos[3:0],synd_err_bits);
                    end
                end else begin 
                    // This is normal error injection
                    if (addr_parity_err) begin 
                        force DRAM_CB = ~ecc; 
                        $display ("%0d: Address parity inversion : Injecting Err by inverting ecc %x \n", $time, ecc);
                    end else begin 
                        if (enb_mecc_error )  begin 
                            // MECC is multiple errors in different chunks for data
                            force DRAM_DQ = (data ^ (err_bits << err_pos) ^ (err_bits1 << err_pos1) );
                            $display ("%0d: Injecting Err on data %x at bit %d %d\n", $time, data, err_pos,err_pos1);
                        end else
                            if(!ecc_err_inject) begin   // this is a random number so inject data or ecc errors randomly
                                force DRAM_DQ = data ^ (err_bits << err_pos);
                                $display ("%0d: Injecting Err on data %x at bit %d\n", $time, data, err_pos);
                                $display ("%0d: Erred data %x at err_pos %x with err_bits %x\n", $time, DRAM_DQ, err_pos,err_bits);
                            end else begin 
                                force DRAM_CB = ecc  ^ (err_bits << err_pos[3:0]);
                                $display ("%0d: Injecting Err on ecc %x at bit %d\n", $time, ecc, err_pos[3:0]);
                                $display ("%0d: Erred ecc %x at err_pos %x with err_bits %x\n", $time, DRAM_CB, err_pos[3:0],err_bits);
                            end
                    end
                end
    end
    // *********** Comment out for now *****************
//    else if (DRAM_FAIL_OVER)
//      force tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.fbdimm_DIMMx4.dq[63:0] = data ^ (4'hf << (DRAM_FAIL_PART * 4));
//    **************************************************
    else
      force DRAM_DQ = data;
      */
end //always


  //always @ (negedge inject_err_s3 or negedge inject_err_s3_d1 or negedge inject_err_s3_d2 or negedge inject_err_s3_d3) begin
    always @ ( DRAM_CB ) begin
    release DRAM_DQ;
    release DRAM_CB;
  end

endmodule
