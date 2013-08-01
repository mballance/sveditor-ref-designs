// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2err_checker.v
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
module l2err_checker(L2_INT_RST,cpx_pkt_cnt,desr_log_cnt);

input L2_INT_RST;
output [23:0] cpx_pkt_cnt,desr_log_cnt;


parameter S0=0,S1=1,S2=2,S3=3,SAMPLE=3;

wire [63:0] err_detected;
wire cpx_packet_valid,cpx_packet_l2miss;
wire [3:0] cpx_packet_rtntyp;
wire [1:0] cpx_packet_err;
wire [7:0] cpx_grnt;
wire [4:0] ras_desr_errtyp;
wire ras_desr_S,desr_F,desr_S,desr_ME;

reg [1:0] currentstate,currentstate1,currentstate2;
reg [1:0] nextstate,nextstate1,nextstate2;
reg st_inst,L2_err_flag,ld_pkt,err_pkt,pck_grnt_flag_ld,stmc_busy,pck_grnt_flag_err,desr_correct,errInj_enabled;
reg [23:0] cpx_pkt_cnt,desr_log_cnt;


assign err_detected = tb_top.cpu.l2t0.csreg.err_state_new_c8;

assign cpx_packet_valid = tb_top.cpu.l2t0.l2t_cpx_data_ca[145];
assign cpx_packet_l2miss = tb_top.cpu.l2t0.l2t_cpx_data_ca[140];
assign cpx_packet_rtntyp= tb_top.cpu.l2t0.l2t_cpx_data_ca[144:141];
assign cpx_packet_err= tb_top.cpu.l2t0.l2t_cpx_data_ca[139:138];
assign cpx_grnt = tb_top.cpu.l2t0.cpx_l2t_grant_cx;
assign desr_F = tb_top.cpu.spc0.tlu.dfd.desr_0[63];
assign desr_S = tb_top.cpu.spc0.tlu.dfd.desr_0[61];
assign desr_ME = tb_top.cpu.spc0.tlu.dfd.desr_0[62];
assign ras_desr_S = tb_top.cpu.spc0.tlu.dfd.ras_desr_et_0[61];
assign ras_desr_errtyp = tb_top.cpu.spc0.tlu.dfd.ras_desr_et_0[60:56];


//--------------------------------------------------------------------------------------
// Enable/Disable support : MAQ
//--------------------------------------------------------------------------------------

wire flush_reset_complete = `TOP.flush_reset_complete;

reg enabled;
initial
begin
        cpx_pkt_cnt    = 0;
        desr_log_cnt   = 0;
/**
  if (!($test$plusargs("l2err_checker_disable")) && (($test$plusargs("L2DA_ERR_ENABLE")) || ($test$plusargs("L2VD_CE_ERR_INJECT")) || ($test$plusargs("L2TA_RAND_ERR_ENABLE"))))
  enabled = 1'b1;
  else
**/
  enabled = 1'b0;
end

always @ (flush_reset_complete)
begin
  if (flush_reset_complete == 1'b0)
    enabled = 1'b0;

  if ((flush_reset_complete == 1'b1) && !($test$plusargs("l2err_checker_disable")) && (($test$plusargs("L2DA_ERR_ENABLE")) || ($test$plusargs("L2VD_CE_ERR_INJECT")) || ($test$plusargs("L2TA_RAND_ERR_ENABLE"))  )  )
    enabled = 1'b1;
end
//--------------------------------------------------------------------------------------


//L2_err_flag signal for SCOREBOARD
always @(posedge tb_top.cpu.l2clk)
begin
        if(!L2_INT_RST)
        begin
                L2_err_flag <= 0;
        end
        else
        begin
	if(enabled && cpx_packet_valid && cpx_packet_err == 2'b01 && (cpx_packet_rtntyp == 4'b1100 || cpx_packet_rtntyp == 4'b0000))
              L2_err_flag <= 1;
	else  L2_err_flag <= 0;
	
	end// else of if(RST)
end


//To detect if the packet was with a load or an error indication packet
always @(posedge tb_top.cpu.l2clk)
begin
        if(!L2_INT_RST)
        begin
                   ld_pkt <= 0;                        
                   err_pkt <= 0;            
        end
        else
        begin

              if(cpx_packet_l2miss == 1 && cpx_packet_valid == 1 && cpx_packet_err == 2'b01 && cpx_packet_rtntyp == 4'b0000)
	          begin
                      ld_pkt <= 0;
                      err_pkt <= 1;
                  end

              else if(cpx_packet_l2miss != 1 && cpx_packet_valid == 1 && cpx_packet_err == 2'b01 && cpx_packet_rtntyp == 4'b0000)
	 	  begin
                      ld_pkt <= 1;
	              err_pkt <= 0;	
		  end
              else if(cpx_packet_l2miss != 1 && cpx_packet_valid == 1 && cpx_packet_err == 2'b01 && cpx_packet_rtntyp == 4'b1100)
		  begin
                      ld_pkt <= 0;
                      err_pkt <= 1;              
		  end
 else if(cpx_packet_valid == 1 && cpx_packet_err == 2'b01 && (cpx_packet_rtntyp == 4'b1100 || cpx_packet_rtntyp == 4'b0001 || cpx_packet_rtntyp == 4'b0010 || cpx_packet_rtntyp == 4'b0100 || cpx_packet_rtntyp == 4'b1101))
                  begin
                      ld_pkt <= 0;
                      err_pkt <= 1;
                  end
              else  
		  begin
                   ld_pkt <= 0;                        
                   err_pkt <= 0;            
		  end

        end// else of if(RST)
end



//StateMachine for detecting the PCX Ack For ld_pkt - Sequential Logic 
always @(posedge tb_top.cpu.l2clk)
begin
        if(!L2_INT_RST)
                currentstate <= S0;
        else
                currentstate <= nextstate;

end



//StateMachine for detecting the PCX Ack For ld_pkt - Combo Logic 
always @(currentstate or nextstate or L2_INT_RST or ld_pkt) 
begin
	if(!L2_INT_RST)
	begin
		nextstate <= S0;
		pck_grnt_flag_ld <= 0;
	end
	else
	begin
		case(currentstate)
		S0: begin
		    if(ld_pkt == 1 && err_pkt == 0)
	            begin
			if (cpx_grnt != 0)
			begin
				nextstate <= S0;
                       		pck_grnt_flag_ld <= 1;
				stmc_busy <= 0;
			end 	//if != 0)
			else
			begin
				 nextstate <= S1;
                       		 pck_grnt_flag_ld <= 0;
                       		 stmc_busy <= 1;
			end 	//else of if != 0)
		    end 	// if(ld_pkt == 1)
		    else
 	            begin
			        nextstate <= S0;
                                pck_grnt_flag_ld <= 0;
                                stmc_busy <= 0;
		    end		//else of if(L2_err_flag == 1)
		  end		//for case begin
		S1: begin
		    if(cpx_grnt != 0)  
	 	    begin		
			pck_grnt_flag_ld <= 1;
			nextstate <= S0;

		    end
	            else
		    begin
			pck_grnt_flag_ld <= 0;
                        nextstate <= S2;
		    end		
		    end
		S2:  begin
                    if(cpx_grnt != 0) 
                    begin               
                        pck_grnt_flag_ld <= 1;
                        nextstate <= S0;
                    end
                    else                
                    begin      
                        pck_grnt_flag_ld <= 0;
                        nextstate <= S3;
                    end
                    end
		S3:  begin
                    if(cpx_grnt != 0) 
                    begin               
                        pck_grnt_flag_ld <= 1;
                        nextstate <= S0;
                    end
                    else                
                    begin      
                        pck_grnt_flag_ld <= 0;
                        nextstate <= S0;
                    //   `PR_ERROR("l2errChecker", `ERROR, "cpx_l2t_grant packet not generated by the CCX");
                       `PR_ALWAYS("l2errChecker", `ALWAYS, "cpx_l2t_grant packet not generated by the CCX");


                    end
                    end
		endcase

	end //else of if(!ClrN)
end//always block

//StateMachine for detecting the PCX Ack For err_pkt - Sequential Logic 
always @(posedge tb_top.cpu.l2clk)
begin
        if(!L2_INT_RST)
                currentstate1 <= S0;
        else
                currentstate1 <= nextstate1;

end




//StateMachine for detecting the PCX Ack For err_pkt - Combo Logic 
always @(currentstate1 or nextstate1 or L2_INT_RST or err_pkt)
begin
        if(!L2_INT_RST)
        begin
                nextstate1 <= S0;
                pck_grnt_flag_err <= 0;
        end
        else
        begin
                case(currentstate1)
                S0: begin
                    if(err_pkt == 1 && ld_pkt == 0)
                    begin
                        if (cpx_grnt != 0)
                        begin
                                nextstate1 <= S0;
                                pck_grnt_flag_err <= 1;

                                stmc_busy <= 0;
                        end     //if != 0)
                        else
                        begin
                                 nextstate1 <= S1;
                                 pck_grnt_flag_err <= 0;
                                 stmc_busy <= 1;
                        end     //else of if != 0)
                    end         // if(ld_pkt == 1)
		    else
                    begin
                                nextstate1 <= S0;
                                pck_grnt_flag_err <= 0;
                                stmc_busy <= 0;
                    end         //else of if(L2_err_flag == 1)
                  end           //for case begin
                S1: begin
                    if(cpx_grnt != 0)
                    begin              
                        pck_grnt_flag_err <= 1;
                        nextstate1 <= S0;

                    end
                    else
                    begin
                        pck_grnt_flag_err <= 0;
                        nextstate1 <= S2;


                    end
                    end
                S2:  begin
                    if(cpx_grnt != 0)
                    begin     
		        pck_grnt_flag_err <= 1;
                        nextstate1 <= S0;

                    end
                    else
                    begin      
                        pck_grnt_flag_err <= 0;
                        nextstate1 <= S3;

                    end
                    end
                S3:  begin
                    if(cpx_grnt != 0)
                    begin
                        pck_grnt_flag_err <= 1;
                        nextstate1 <= S0;
                    end
                    else
                    begin
                        pck_grnt_flag_err <= 0;
                        nextstate1 <= S0;
                       `PR_ALWAYS("l2errChecker", `ALWAYS, "cpx_l2t_grant packet not generated by the CCX");
                       //`PR_ERROR("l2errChecker", `ERROR, "cpx_l2t_grant packet not generated by the CCX");

                    end
                    end
                endcase

        end //else of if(!ClrN)
end//always block



//For Checking DESR for error packet
always @(pck_grnt_flag_err or desr_F or ras_desr_S or ras_desr_errtyp or enabled)	// MAQ : Added Enabled
begin
	if((pck_grnt_flag_err == 1) && (enabled == 1))	// MAQ : Added Enabled
	begin

		@(posedge tb_top.cpu.l2clk)	
		@(posedge tb_top.cpu.l2clk)	
		@(posedge tb_top.cpu.l2clk)	
		@(posedge tb_top.cpu.l2clk)	
		#(SAMPLE) 
		if(desr_F == 0 && ras_desr_S ==0  && (ras_desr_errtyp ==1 || ras_desr_errtyp ==2 || ras_desr_errtyp ==3 || ras_desr_errtyp ==8 || ras_desr_errtyp == 9 || ras_desr_errtyp ==11 ))
		begin
			desr_correct <= 1;
			@(posedge tb_top.cpu.l2clk)
			if(desr_S == 0 && desr_F == 1 )  begin end
			else 
			   begin
				desr_correct <= 0;
				`PR_ALWAYS("l2errChecker", `ALWAYS,"DESR is incorrectly Logged With Error Pcket");
			   end
		end
		else if(desr_F == 0 && ras_desr_S ==1  && ras_desr_errtyp == 20)
		begin
                        desr_correct <= 1;
			@(posedge tb_top.cpu.l2clk)
			if(desr_S == 1 && desr_F == 1 ) begin end
                        else
                           begin
                                desr_correct <= 0;
                                `PR_ALWAYS("l2errChecker", `ALWAYS,"DESR is incorrectly Logged With Error Pcket");
                           end
		end
                else if(desr_F == 1 && ras_desr_S ==1)
                begin
                        desr_correct <= 1;
                        @(posedge tb_top.cpu.l2clk)
                        if(desr_S == 1 && desr_ME == 1 ) begin end
                        else
                           begin
                                desr_correct <= 0;
                                `PR_ALWAYS("l2errChecker", `ALWAYS,"DESR is incorrectly Logged With Error Pcket");
                           end
                end
                else if(desr_F == 1 && ras_desr_S ==0)
                begin
                        desr_correct <= 1;
                        @(posedge tb_top.cpu.l2clk)
                        if(desr_ME == 1 ) begin end
                        else
                           begin
                                desr_correct <= 0;
                                `PR_ALWAYS("l2errChecker", `ALWAYS,"DESR is incorrectly Logged With Error Pcket");
                           end
                end

		else
		begin
			desr_correct <= 0;
		       `PR_ALWAYS("l2errChecker", `ALWAYS,"DESR is incorrectly Logged With Error Pcket");
		       //`PR_ERROR("l2errChecker", `ERROR,"DESR is incorrectly Logged With Error Pcket");
		end
	end
	else    desr_correct <= 0;
end


//For Checking DESR for load instruction
always @(pck_grnt_flag_ld or desr_F or ras_desr_S or ras_desr_errtyp or enabled)	// MAQ : Added Enabled
begin
        if((pck_grnt_flag_ld == 1) && (enabled == 1))	// MAQ : Added Enabled
        begin
                @(posedge tb_top.cpu.l2clk)
                @(posedge tb_top.cpu.l2clk)
                @(posedge tb_top.cpu.l2clk)
                @(posedge tb_top.cpu.l2clk)
                #(SAMPLE)
                if(desr_F == 0 && (ras_desr_S == 1)  && (ras_desr_errtyp == 4))
		begin
                        desr_correct <= 1;
			@(posedge tb_top.cpu.l2clk)
                        if(desr_S == 1 && desr_F == 1 ) begin end
                        else
                           begin
                                desr_correct <= 0;
                                `PR_ALWAYS("l2errChecker", `ALWAYS,"DESR is incorrectly Logged With Error Pcket");
                           end
		end
		else if(desr_F == 0 && (ras_desr_S == 0)  && (ras_desr_errtyp == 9))	
		begin
                        desr_correct <= 1;
			@(posedge tb_top.cpu.l2clk)
                        if(desr_S == 0 && desr_F == 1 ) begin end
                        else
                           begin
                                desr_correct <= 0;
                                `PR_ALWAYS("l2errChecker", `ALWAYS,"DESR is incorrectly Logged With Error Pcket");
                           end
		end
                else if(desr_F == 1 && ras_desr_S ==1)
                begin
                        desr_correct <= 1;
                        @(posedge tb_top.cpu.l2clk)
                        if(desr_S == 1 && desr_ME == 1 ) begin end
                        else
                           begin
                                desr_correct <= 0;
                                `PR_ALWAYS("l2errChecker", `ALWAYS,"DESR is incorrectly Logged With Error Pcket");
                           end
                end
		 else if(desr_F == 1 && ras_desr_S ==0)
                begin
                        desr_correct <= 1;
                        @(posedge tb_top.cpu.l2clk)
                        if(desr_ME == 1 ) begin end
                        else
                           begin
                                desr_correct <= 0;
                                `PR_ALWAYS("l2errChecker", `ALWAYS,"DESR is incorrectly Logged With Error Pcket");
                           end
                end

                else
                begin
                        desr_correct <= 0;
                      `PR_ALWAYS("l2errChecker", `ALWAYS,"DESR is incorrectly Logged, Load Return Packet With Error");
                      //`PR_ERROR("l2errChecker", `ERROR,"DESR is incorrectly Logged, Load Return Packet With Error");

                end
        end
        else    desr_correct <= 0;
end


//To count the number of cpx packets sent
always @(L2_err_flag)
begin
        if(L2_err_flag == 1)
                cpx_pkt_cnt <= cpx_pkt_cnt + 1;
        else cpx_pkt_cnt <= cpx_pkt_cnt;
end

//To count the number of time DESR was logged
always @(desr_correct)
begin
        if(desr_correct == 1)
                desr_log_cnt <= desr_log_cnt + 1;
        else    desr_log_cnt <= desr_log_cnt;

end





endmodule
