// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2cpx_checker.v
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
module l2cpx_checker();
parameter SMPLE = 3;

wire cpx_valid,cpx_nc,cpx_atomic,cpx_pf;
wire [3:0] cpx_rtntyp;
wire [1:0] cpx_err;
reg l2cpx_mon,l2cpx_errmon;

initial
begin
l2cpx_mon = 1;
l2cpx_errmon = 1;
if($test$plusargs("l2cpx_mon_off"))
  begin
     if($test$plusargs("l2cpx_errmon_off"))
  	begin
     	l2cpx_errmon = 0;
        `PR_ALWAYS("L2-CPX Err Packet Checker", `ALWAYS, "L2-CPX Err PACKET CHKR Disabled");
  	end
     l2cpx_mon = 0;
    `PR_ALWAYS("L2 CPX Packet Checker", `ALWAYS, "L2 CPX PACKET CHKR Disabled");
  end
else if($test$plusargs("l2cpx_errmon_off"))
  begin
     l2cpx_errmon = 0;
        `PR_ALWAYS("L2-CPX Err Packet Checker", `ALWAYS, "L2-CPX Err PACKET CHKR Disabled");
  end
else
  begin
    `PR_ALWAYS("L2 CPX Packet Checker", `ALWAYS, "L2 CPX PACKET CHKR Enabled");
    `PR_ALWAYS("L2-CPX Err Packet Checker", `ALWAYS, "L2-CPX Err PACKET CHKR Enabled");
  end
end

assign cpx_valid    =  tb_top.cpu.l2t0.l2t_cpx_data_ca[145];
assign cpx_rtntyp   =  tb_top.cpu.l2t0.l2t_cpx_data_ca[144:141];
assign cpx_err      =  tb_top.cpu.l2t0.l2t_cpx_data_ca[139:138];
assign cpx_nc       =  tb_top.cpu.l2t0.l2t_cpx_data_ca[137];
assign cpx_atomic   =  tb_top.cpu.l2t0.l2t_cpx_data_ca[129];
assign cpx_pf       =  tb_top.cpu.l2t0.l2t_cpx_data_ca[128];

/*
********  Start of Illegal CPX Packet Checker ******
*/


always @(posedge tb_top.cpu.l2clk)
begin
if(l2cpx_mon == 1)
begin
#(SMPLE)
	case(cpx_rtntyp)
	4'b1000:
        begin
  	if(cpx_valid == 1)
		begin
			if(cpx_nc != 1 || cpx_atomic != 0 || cpx_pf != 0)
			begin
				`PR_ERROR("l2cpx_mon",`ERROR,"ILLEGAL L2 CPX PACKET: rtntyp[144:141] :%0h, err[139:138] :%h, nc[137] :%0h, atomic[129] :%0h, pf[128] :%0h",cpx_rtntyp,cpx_err,cpx_nc,cpx_atomic,cpx_pf);
			end
		end
        end
	4'b0100:
        begin
  	if(cpx_valid == 1)
		begin
			if(cpx_atomic == 0 && cpx_pf == 0 && cpx_err != 0)
			begin
				//`PR_ERROR("l2cpx_mon",`ERROR,"ILLEGAL L2 CPX PACKET: rtntyp[144:141] :%0h, err[139:138] :%h, nc[137] :%0h, atomic[129] :%0h, pf[128] :%0h",cpx_rtntyp,cpx_err,cpx_nc,cpx_atomic,cpx_pf);
				`PR_ALWAYS("l2cpx_mon",`ALWAYS,"ILLEGAL L2 CPX PACKET: rtntyp[144:141] :%0h, err[139:138] :%h, nc[137] :%0h, atomic[129] :%0h, pf[128] :%0h",cpx_rtntyp,cpx_err,cpx_nc,cpx_atomic,cpx_pf);
				`PR_ALWAYS("l2cpx_mon",`ALWAYS,"PACKET FOR DCACHE/ICACHE INV,STORE ACK");
			end
                        else if(cpx_atomic == 0 && cpx_pf == 1)
			begin
				`PR_ERROR("l2cpx_mon",`ERROR,"ILLEGAL L2 CPX PACKET: rtntyp[144:141] :%0h, err[139:138] :%h, nc[137] :%0h, atomic[129] :%0h, pf[128] :%0h",cpx_rtntyp,cpx_err,cpx_nc,cpx_atomic,cpx_pf);
			end
 			else if(cpx_atomic == 1 && cpx_pf == 1)
			begin
				`PR_ERROR("l2cpx_mon",`ERROR,"ILLEGAL L2 CPX PACKET: rtntyp[144:141] :%0h, err[139:138] :%h, nc[137] :%0h, atomic[129] :%0h, pf[128] :%0h",cpx_rtntyp,cpx_err,cpx_nc,cpx_atomic,cpx_pf);
			end
		end
        end
	4'b1001:
        begin
  	if(cpx_valid == 1)
		begin
			if(cpx_nc != 1 || cpx_atomic != 0 || cpx_pf != 0)
			begin
				`PR_ERROR("l2cpx_mon",`ERROR,"ILLEGAL L2 CPX PACKET: rtntyp[144:141] :%0h, err[139:138] :%h, nc[137] :%0h, atomic[129] :%0h, pf[128] :%0h",cpx_rtntyp,cpx_err,cpx_nc,cpx_atomic,cpx_pf);
			end
		end
        end
	4'b0010:
        begin
  	if(cpx_valid == 1)
		begin
			if(cpx_nc != 1 || cpx_atomic != 0 || cpx_pf != 0)
			begin
				`PR_ERROR("l2cpx_mon",`ERROR,"ILLEGAL L2 CPX PACKET: rtntyp[144:141] :%0h, err[139:138] :%h, nc[137] :%0h, atomic[129] :%0h, pf[128] :%0h",cpx_rtntyp,cpx_err,cpx_nc,cpx_atomic,cpx_pf);
			end
		end
        end
	4'b0110:
        begin
  	if(cpx_valid == 1)
                begin
                        if(cpx_pf != 0 || cpx_err != 0)
			begin
				`PR_ERROR("l2cpx_mon",`ERROR,"ILLEGAL L2 CPX PACKET: rtntyp[144:141] :%0h, err[139:138] :%h, nc[137] :%0h, atomic[129] :%0h, pf[128] :%0h",cpx_rtntyp,cpx_err,cpx_nc,cpx_atomic,cpx_pf);
			end
                end
        end
	4'b0101:
        begin
  	if(cpx_valid == 1)
                begin
                        if(cpx_nc != 1 || cpx_atomic != 0 || cpx_pf != 0)
			begin
				`PR_ERROR("l2cpx_mon",`ERROR,"ILLEGAL L2 CPX PACKET: rtntyp[144:141] :%0h, err[139:138] :%h, nc[137] :%0h, atomic[129] :%0h, pf[128] :%0h",cpx_rtntyp,cpx_err,cpx_nc,cpx_atomic,cpx_pf);
			end
                end
        end
	4'b0111:                
        begin
  	if(cpx_valid == 1)
		begin
                        if(cpx_nc != 1 || cpx_err != 0 || cpx_pf != 0)
			begin
				`PR_ERROR("l2cpx_mon",`ERROR,"ILLEGAL L2 CPX PACKET: rtntyp[144:141] :%0h, err[139:138] :%h, nc[137] :%0h, atomic[129] :%0h, pf[128] :%0h",cpx_rtntyp,cpx_err,cpx_nc,cpx_atomic,cpx_pf);
			end
                end
        end
	4'b0011:
        begin
  	if(cpx_valid == 1)
                begin
                        if(cpx_pf != 0 || cpx_err != 0)
			begin
				`PR_ERROR("l2cpx_mon",`ERROR,"ILLEGAL L2 CPX PACKET: rtntyp[144:141] :%0h, err[139:138] :%h, nc[137] :%0h, atomic[129] :%0h, pf[128] :%0h",cpx_rtntyp,cpx_err,cpx_nc,cpx_atomic,cpx_pf);
			end
                end
        end

	endcase
  end

end

/*
*******  End of Illegal CPX Packet Checker ******
*/


/*
*******  Start of Error CPX Packet Checker ******
*/


always @(posedge tb_top.cpu.l2clk)
begin
if(l2cpx_errmon == 1 && cpx_valid == 1 && cpx_err != 0)
begin
        case(cpx_rtntyp)
        4'b0000:
        begin
                        if(cpx_pf == 0)
                        begin
				if(cpx_err == 1)
				begin
                                	`PR_ERROR("l2cpx_errmon",`ERROR,"Correctable Error in L2 Load Return Packet");
				end
				else if(cpx_err == 2)
                                begin
                                	`PR_ERROR("l2cpx_errmon",`ERROR,"Un-Correctable Error in L2 Load Return Packet");
                                end
                                else
				begin
                                	`PR_ERROR("l2cpx_errmon",`ERROR,"NotData Error in L2 Load Return Packet");
				end
			end
			else	
                        begin
                                if(cpx_err == 1)
                                begin
                                        `PR_ERROR("l2cpx_errmon",`ERROR,"Correctable Error in L2 Prefetch Return Packet");
                                end
                                else if(cpx_err == 2)
                                begin
                                        `PR_ERROR("l2cpx_errmon",`ERROR,"Un-Correctable Error in L2 Prefetch Return Packet");
                                end
                                else 
                                begin
                                        `PR_ERROR("l2cpx_errmon",`ERROR,"NotData Error in L2 Prefetch Return Packet");
                                end

                        end
        end
        4'b1000:
	begin
            if(cpx_err == 1)
            begin
                   `PR_ERROR("l2cpx_errmon",`ERROR,"Correctable Error in NCU Load Return Packet From L2");
            end
            else if(cpx_err == 2)
            begin
                   `PR_ERROR("l2cpx_errmon",`ERROR,"Un-Correctable Error in NCU Load Return Packet From L2");
            end
            else
            begin
                   `PR_ERROR("l2cpx_errmon",`ERROR,"NotData Error in NCU Load Return Packet From L2");
            end
	end
 	4'b0001:
        begin
            if(cpx_err == 1)
            begin
                   `PR_ERROR("l2cpx_errmon",`ERROR,"Correctable Error in iFill Return Packet From L2");
            end
            else if(cpx_err == 2)
            begin
                   `PR_ERROR("l2cpx_errmon",`ERROR,"Un-Correctable Error in iFill Return Packet From L2");
            end
            else
            begin
                   `PR_ERROR("l2cpx_errmon",`ERROR,"NotData Error in iFill Return Packet From L2");
            end
        end
        4'b1001:
        begin
            if(cpx_err == 1)
            begin
                   `PR_ERROR("l2cpx_errmon",`ERROR,"Correctable Error in NCU iFill Return Packet From L2");
            end
            else if(cpx_err == 2)
            begin
                   `PR_ERROR("l2cpx_errmon",`ERROR,"Un-Correctable Error in NCU iFill Return Packet From L2");
            end
            else
            begin
                   `PR_ERROR("l2cpx_errmon",`ERROR,"NotData Error in NCU iFill Return Packet From L2");
            end
        end
        4'b0100:
        begin
            if(cpx_err == 1)
            begin
                   `PR_ERROR("l2cpx_errmon",`ERROR,"Correctable Error in CAS/Swap Ack Return Packet From L2");
            end
            else if(cpx_err == 2)
            begin
                   `PR_ERROR("l2cpx_errmon",`ERROR,"Un-Correctable Error in CAS/Swap Ack Return Packet From L2");
            end
            else
            begin
                   `PR_ERROR("l2cpx_errmon",`ERROR,"NotData Error in CAS/Swap Ack Return Packet From L2");
            end
        end
        4'b0010:
        begin
            if(cpx_err == 1)
            begin
                   `PR_ERROR("l2cpx_errmon",`ERROR,"Correctable Error in Stream Load Return Packet From L2");
            end
            else if(cpx_err == 2)
            begin
                   `PR_ERROR("l2cpx_errmon",`ERROR,"Un-Correctable Error in Stream Load Return Packet From L2");
            end
            else
            begin
                   `PR_ERROR("l2cpx_errmon",`ERROR,"NotData Error in Stream Load Return Packet From L2");
            end
        end
        4'b0101:
        begin
            if(cpx_err == 1)
            begin
                   `PR_ERROR("l2cpx_errmon",`ERROR,"Correctable Error in MMU Load Return Packet From L2");
            end
            else if(cpx_err == 2)
            begin
                   `PR_ERROR("l2cpx_errmon",`ERROR,"Un-Correctable Error in MMU Load Return Packet From L2");
            end
            else
            begin
                   `PR_ERROR("l2cpx_errmon",`ERROR,"NotData Error in MMU Load Return Packet From L2");
            end
        end
 	4'b1100:
        begin
            if(cpx_err == 1)
            begin
                   `PR_ERROR("l2cpx_errmon",`ERROR,"Correctable Error Indication Packet From L2");
            end
            else if(cpx_err == 2)
            begin
                   `PR_ERROR("l2cpx_errmon",`ERROR,"Un-Correctable Error Indication Packet From L2");
            end
            else
            begin
                   `PR_ERROR("l2cpx_errmon",`ERROR,"NotData Error Indication Packet From L2");
            end
        end
        4'b1100:
        begin
            if(cpx_err == 1)
            begin
                   `PR_ERROR("l2cpx_errmon",`ERROR,"Soc Correctable Error Indication Packet From L2");
            end
            else if(cpx_err == 2)
            begin
                   `PR_ERROR("l2cpx_errmon",`ERROR,"Soc Un-Correctable Error Indication Packet From L2");
            end
            else
            begin
                   `PR_ERROR("l2cpx_errmon",`ERROR,"Soc NotData Error Indication Packet From L2");
            end
        end
	endcase
   end // end if(l2cpx_errmon == 1 && cpx_valid == 1 && cpx_err != 0)
end // end always block

/*
*******  End of Error CPX Packet Checker ******
*/



endmodule
