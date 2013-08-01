// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ltssm.cpp
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
#include "systemc.h"
#include "pl/ltssm.h"
using namespace Logger;

/********** Commenting Starts **********
  Samples the input bus signals
 ********** Commenting Ends **********/

void ltssm::in_block()
{
    int i;
    // Initialize ts1_set_const for first time use
    while(true)
    {
        if(reset_por_l.read())
        {
            in_val = lane_in.read();
            in_val_bar = lane_in_bar.read();

            for(i=0;i<LINK_WIDTH;i++)
            {
                ireg_in_p_p[i] = (in_val.range(i,i),ireg_in_p_p[i].range(9,1)); // After 10 clock cycles all having the COM symbol
                ireg_in_p_p_bar[i] = (in_val_bar.range(i,i),ireg_in_p_p_bar[i].range(9,1));
            }
            ireg = in_val;
            ireg_bar = in_val_bar; // Read in the in_val
        }
        else
        {
            generated_pattern = 0; 
        }
        wait(link_clk.posedge_event());
    }
}

/// CSR event block 1
void ltssm::read_csr_block() // Read LNK_CTL_HW CSR to look at disable link/scrambling etc
{
    csr_port.set_notify_event(PEU_CSR_A_LNK_CTL_HW_ADDR,&link_sts_csr_ev);
    while(true)
    {
        wait(link_sts_csr_ev);
        link_ctl_csr = csr_port.read_csr(PEU_CSR_A_LNK_CTL_HW_ADDR);
    }
}

/// CSR event block 2
void ltssm::read_csr1_block() // This CSR read is for HOT-RESET control
{
    csr_port.set_notify_event(PEU_CSR_A_LINK_CTL_HW_ADDR,&macl_pcs_ctl_ev);
    while(true)
    {
        wait(macl_pcs_ctl_ev);
        macl_pcs_ctl_csr = csr_port.read_csr(PEU_CSR_A_LINK_CTL_HW_ADDR);
    }
}

/// Output assignment
void ltssm::assign_block2()
{
    while(true)
    {
        if(reset_por_l.read())
        {
            lane_out.write(out_reg);
            lane_out_bar.write(out_reg_bar); // Write out the value from the transmitter
        }
        if((((init_state == L0) && q_not_empty.read() && (idle_pattern_bit == 0)) || (init_state == L0 && !q_not_empty.read() && idle_pattern_bit == 0 && transmitted_idl_pattern >= 18)) && reset_l.read() && reset_por_l.read())
            write_init_done = true;

        wait(link_clk.posedge_event());
    }
}

/// Receiver port frame boundary
void ltssm::frame_boundary_assign_rx()
{
    while(true)
    {
        frame_boundary_reg = frame_boundary_detected ? (lock_counter == sym_counter) : 0; // Receive frame boundary calculation
        frame_boundary_rx.write(frame_boundary_reg);
        if((((init_state_rx == L0) && q_not_empty.read() && (idle_pattern_bit == 0)) || 
             (init_state_rx == L0 && !q_not_empty.read() && (idle_pattern_bit == 0) && transmitted_idl_pattern >= 18)) && 
             reset_l.read() && reset_por_l.read()) // Move to pl_top if more than 18 idle patterns have been sent and still nothing in the DLL/TL Q
          write_init_done_rx = true;
        wait(link_clk.posedge_event());
    }
}

/// Transmitter port frame boundary
void ltssm::frame_boundary_assign()
{
    while(true)
    {
        if(out_reg_ser.range(9,0) == 0x305 || out_reg_ser.range(9,0) == 0xfa) // Transmit frame boundary calculation
        {
            com_detected_tx = true;
        }
        if(com_detected_tx)
            start_frame_boundary_tx = true;
        if(start_frame_boundary_tx)
        {
            frame_boundary_tx_counter++;
            frame_boundary_tx_counter %= 10;
            frame_boundary_reg_tx = (frame_boundary_tx_counter == 0) ? 1 : 0;
        }
        else
        {
            frame_boundary_reg_tx = !(frame_boundary_reg_tx);
        }
        frame_boundary_tx.write(frame_boundary_reg_tx);
        wait(link_clk.posedge_event());
    }
}

/// Receiver port frame boundary counter
void ltssm::counter_block0() // Counter block for receive side
{
    int prev_lock_counter;
    while(true)
    {
        if(sym_counter == 10)
            sym_counter = 1;
        else
            sym_counter = sym_counter + 1;

        prev_lock_counter = lock_counter;
        if(com_detected) // This is calculated in the posedge block so should not be a race
            lock_counter = (sym_counter < 4) ? (sym_counter == 1) ? 8 : (sym_counter == 2)? 9 : 10 : sym_counter - 3;
        
        wait(link_clk.negedge_event());
    }
}

/// Receiver side frame boundary counter block
void ltssm::counter_block2() // Counter block for receive side to check for COM_DETECTED
{
    int i,com_counter;
    while(true)
    {
        com_counter = 0;
        for(i=0;i<LINK_WIDTH;i++)
        {
            if(((ireg_in[i].range(9,0) == COM_10b) || (ireg_in_bar[i].range(9,0) == COM_10b)))
            {
                com_counter++;
            }
        }
        if(com_counter == LINK_WIDTH)
        {
            com_detected = 1;
            frame_boundary_detected = 1;
        }
        else
            com_detected = 0;

        for(i=0;i<LINK_WIDTH;i++)
        {
            ireg_in_p[i] = ireg_in[i];
            ireg_in_p_bar[i] = ireg_in_bar[i];
        }
        wait(link_clk.posedge_event());
    }
}

/// One more read block
void ltssm::counter_block4() // Staged negedge_clk in data read
{
    int i;
    while(true)
    {
        if(reset_por_l.read())
        {
            for(i=0; i< LINK_WIDTH; i++)
            {
                ireg_in[i] = (in_val.range(i,i),ireg_in[i].range(9,1)); // After 10 clock cycles all having the COM symbol
                ireg_in_bar[i] = (in_val_bar.range(i,i),ireg_in_bar[i].range(9,1));
            }
        }
        else
        {
            for(i=0;i< LINK_WIDTH; i++)
            {
                ireg_in[i] = 0;
                ireg_in_bar[i] = 1;
            }
        }
        wait(link_clk.negedge_event());
    }
}

/// Block to check and process received/sampled data
void ltssm::rx_block() // Main block to receive data based on current LTSSM state
{
    int i,diff_lane_num_ok = 0,lane_num_ok=0,j,k;
    map<int,int>::iterator iter,iter1,iter2,iter3;
    map<int,int>::iterator iter_n,iter1_n,iter2_n,iter3_n;
    map<int,int>::iterator iter_0,iter_1,iter_2,iter_3,iter_4,iter_5,iter_6,iter_7,iter_8,iter_9;
    map<int,int>::iterator iter_0_n,iter_1_n,iter_2_n,iter_3_n,iter_4_n,iter_5_n,iter_6_n,iter_7_n,iter_8_n,iter_9_n;
    unsigned short tmp_lfsr;
    sc_lv<10> scramble_pattern = 0x000;
    for(i=0;i<256;i++)
    {
        map_iter = map_table->data_encode_map.find(i);
        encoded_value[i] = map_iter->second;
        map_iter = map_table->neg_data_encode_map.find(i);
        neg_encoded_value[i] = map_iter->second;
    }

    while(true)
    {
        if(reset_por_l.read()) // System has come out of reset
        {
            // Check for the symbol and store it as is
            // Check to see if ireg_in_p[0] -> decoder -> descrambler = 0x00 once LTSSM reaches CFG_IDLE
            // If no, reset back the descrambler lfsr to 0xffff
            // If yes, start the descrambler and the scrambler after receiving 1 Logical Idle frame

            if(com_detected)
            {
                ts1_2 = 0x0000000000000000000000000000000000000000; // Wipe out the ts1_2 set and start a new pattern
                ts1_2 = (ireg_in_p_p[0],ts1_2.range(159,10)); // We can safely assume that TS1/TS2/IDLE/FTS/SKIP ordered set has started
                ts1_2_negedge = (ireg_in_p[0],ts1_2_negedge.range(159,10)); // We can safely assume that TS1/TS2/IDLE/FTS/SKIP ordered set has started
                fts_set = (ireg_in_p_p[0],fts_set.range(39,10));
                fts_set_negedge = (ireg_in_p[0],fts_set_negedge.range(39,10));
                skip_set = (ireg_in_p_p[0],skip_set.range(39,10));
                skip_set_negedge = (ireg_in_p[0],skip_set_negedge.range(39,10));
                electrical_idle_set = (ireg_in_p_p[0],electrical_idle_set.range(39,10));
                electrical_idle_set_negedge = (ireg_in_p[0],electrical_idle_set_negedge.range(39,10));
                for(i=0;i<LINK_WIDTH;i++)
                {
                    ts1_2_serial[i] = (ireg_in_p_p[i],ts1_2_serial[i].range(159,10));
                    ts1_2_serial_negedge[i] = (ireg_in_p[i],ts1_2_serial_negedge[i].range(159,10));
                }
                start_ordered_set = 1;
                negedge_skip_this = true;
                if(!init_done_rx.read()) 
                {
                    descrambler_i->scramble_descramble_all(K28_5,0,1); // This should reset the LFSR
                }
            }
            electrical_idle_constant_voltage_set = (ireg_in_p_p[0],electrical_idle_constant_voltage_set.range(9,1));
            if(frame_boundary_reg.read() || come_next_time)
            {
                if(frame_boundary_reg.read())
                    come_next_time = 1;
                else
                    come_next_time = 0;
                if(!come_next_time && ((init_state == CFG_IDLE) || (init_state == Recovery_Idle)) && !init_done_rx.read()) // The data I have right now will use the previous LFSR
                {
                    iter = map_table->data_decode_map.find(ireg_in_p_p[0].range(0,9).to_uint());
                    iter1 = map_table->neg_data_decode_map.find(ireg_in_p_p[0].range(0,9).to_uint()); // Say we get 0x8d (just for example)
                    iter2 = map_table->spec_symbol_decode_map.find(ireg_in_p_p[0].range(0,9).to_uint());
                    iter3 = map_table->neg_spec_symbol_decode_map.find(ireg_in_p_p[0].range(0,9).to_uint());
                    iter_n = map_table->data_decode_map.find(ireg_in_p[0].range(0,9).to_uint()); // For Data changing at negedge clock
                    iter1_n = map_table->neg_data_decode_map.find(ireg_in_p[0].range(0,9).to_uint()); // For data changing at negedge clock
                    iter2_n = map_table->spec_symbol_decode_map.find(ireg_in_p[0].range(0,9).to_uint());
                    iter3_n = map_table->neg_spec_symbol_decode_map.find(ireg_in_p[0].range(0,9).to_uint());
                    // Get the lfsr in sync with the EP lfsr

                    /// Section when data changes at the posedge of clock. Check for DISPARITY error checks
                    if(!lock_negedge_clock)
                    {
                        for(i=0;i<LINK_WIDTH;i++)
                        {
                            iter_0 = map_table->spec_symbol_decode_map.find(ireg_in_p_p[i].range(0,9).to_uint()); // Iterator for (+) spec symbol map table
                            iter_1 = map_table->neg_spec_symbol_decode_map.find(ireg_in_p_p[i].range(0,9).to_uint()); // Iterator for (-) spec symbol map table
                            iter_2 = map_table->data_decode_map.find(ireg_in_p_p[i].range(0,9).to_uint()); // Iterator for (+) data symbol map table
                            iter_3 = map_table->neg_data_decode_map.find(ireg_in_p_p[i].range(0,9).to_uint()); // Iterator for (-) data symbol map table
                            if(iter_0 != map_table->spec_symbol_decode_map.end())
                            {
                                if(!curr_running_disp->get_rx_CRD(i).to_bool())
                                    LOG_WARNING << "WARNING : _LTSSM_ : Positive Running Disparity Error in lane " << i;
                                else // Set the disparity according to the symbol received
                                {
                                    if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 1)
                                        curr_running_disp->set_rx_CRD(i,sc_logic(1));
                                    else if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 0)
                                        curr_running_disp->set_rx_CRD(i,sc_logic(0));
                                }
                            }
                            else if(iter_1 != map_table->neg_spec_symbol_decode_map.end())
                            {
                                if(curr_running_disp->get_rx_CRD(i).to_bool())
                                    LOG_WARNING << "WARNING : _LTSSM_ : Negative Running Disparity Error in lane " << i;
                                else // Set the disparity according to the symbol received
                                {
                                    if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 1)
                                        curr_running_disp->set_rx_CRD(i,sc_logic(1));
                                    else if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 0)
                                        curr_running_disp->set_rx_CRD(i,sc_logic(0));
                                }
                            }
                            else if(iter_2 != map_table->data_decode_map.end())
                            {
                                if(!curr_running_disp->get_rx_CRD(i).to_bool() && curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) != 2)
                                    LOG_WARNING << "WARNING : _LTSSM_ : Positive Running Disparity Error in lane " << i;
                                else // Set the disparity according to the symbol received
                                {
                                    if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 1)
                                        curr_running_disp->set_rx_CRD(i,sc_logic(1));
                                    else if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 0)
                                        curr_running_disp->set_rx_CRD(i,sc_logic(0));
                                }
                            }
                            else if(iter_3 != map_table->neg_data_decode_map.end() && curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) != 2)
                            {
                                if(curr_running_disp->get_rx_CRD(i).to_bool())
                                    LOG_WARNING << "WARNING : _LTSSM_ : Negative Running Disparity Error in lane " << i;
                                else // Set the disparity according to the symbol received
                                {
                                    if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 1)
                                        curr_running_disp->set_rx_CRD(i,sc_logic(1));
                                    else if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 0)
                                        curr_running_disp->set_rx_CRD(i,sc_logic(0));
                                }
                            }
                        }
                        if(iter2 != map_table->spec_symbol_decode_map.end()) // All lanes should have the IDLE packet
                            idle_set[0] = iter2->second;
                        else if(iter3 != map_table->neg_spec_symbol_decode_map.end())
                            idle_set[0] = iter3->second;
                        else if(iter != map_table->data_decode_map.end())
                            idle_set[0] = iter->second;
                        else if(iter1 != map_table->neg_data_decode_map.end())
                            idle_set[0] = iter1->second;
                    }
                    /// Disparity checks for data changing at the negedge clock
                    else
                    {
                        for(i=0;i<10;i++)
                        {
                            iter_0 = map_table->spec_symbol_decode_map.find(ireg_in_p[i].range(0,9).to_uint());
                            iter_1 = map_table->neg_spec_symbol_decode_map.find(ireg_in_p[i].range(0,9).to_uint());
                            iter_2 = map_table->data_decode_map.find(ireg_in_p[i].range(0,9).to_uint());
                            iter_3 = map_table->neg_data_decode_map.find(ireg_in_p[i].range(0,9).to_uint());
                            if(iter_0 != map_table->spec_symbol_decode_map.end())
                            {
                                if(!curr_running_disp->get_rx_CRD(i).to_bool())
                                    LOG_WARNING << "WARNING : _LTSSM_ : Positive Running Disparity Error in lane " << i;
                                else // Set the disparity according to the symbol received
                                {
                                    if(curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) == 1)
                                        curr_running_disp->set_rx_CRD(i,sc_logic(1));
                                    else if(curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) == 0)
                                        curr_running_disp->set_rx_CRD(i,sc_logic(0));
                                }
                            }
                            else if(iter_1 != map_table->neg_spec_symbol_decode_map.end())
                            {
                                if(curr_running_disp->get_rx_CRD(i).to_bool())
                                    LOG_WARNING << "WARNING : _LTSSM_ : Negative Running Disparity Error in lane " << i;
                                else // Set the disparity according to the symbol received
                                {
                                    if(curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) == 1)
                                        curr_running_disp->set_rx_CRD(i,sc_logic(1));
                                    else if(curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) == 0)
                                        curr_running_disp->set_rx_CRD(i,sc_logic(0));
                                }
                            }
                            else if(iter_2 != map_table->data_decode_map.end())
                            {
                                if(!curr_running_disp->get_rx_CRD(i).to_bool() && curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) != 2)
                                    LOG_WARNING << "WARNING : _LTSSM_ : Positive Running Disparity Error in lane " << i;
                                else // Set the disparity according to the symbol received
                                {
                                    if(curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) == 1)
                                        curr_running_disp->set_rx_CRD(i,sc_logic(1));
                                    else if(curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) == 0)
                                        curr_running_disp->set_rx_CRD(i,sc_logic(0));
                                }
                            }
                            else if(iter_3 != map_table->neg_data_decode_map.end())
                            {
                                if(curr_running_disp->get_rx_CRD(i).to_bool() && curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) != 2)
                                    LOG_WARNING << "WARNING : _LTSSM_ : Negative Running Disparity Error in lane " << i;
                                else // Set the disparity according to the symbol received
                                {
                                    if(curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) == 1)
                                        curr_running_disp->set_rx_CRD(i,sc_logic(1));
                                    else if(curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) == 0)
                                        curr_running_disp->set_rx_CRD(i,sc_logic(0));
                                }
                            }
                        }
                        if(iter2_n != map_table->spec_symbol_decode_map.end())
                            idle_set_negedge[0] = iter2_n->second;
                        else if(iter3_n != map_table->neg_spec_symbol_decode_map.end())
                            idle_set_negedge[0] = iter3_n->second;
                        else if(iter_n !=  map_table->data_decode_map.end())
                            idle_set_negedge[0] = iter_n->second;
                        else if(iter1_n != map_table->neg_data_decode_map.end())
                            idle_set_negedge[0] = iter1_n->second;
                    }
                    tmp_lfsr = descrambler_i->get_lfsr(0); 
                    for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                    {
                        descrambler_i->start_scramble_reg[lane_scram] = true;
                    }
                    idle_set[0] = descrambler_i->scramble_descramble_all(idle_set[0].to_uint(),0,1);// LFSR moves forward

                    /// Check for Logical Idle Patterns
                    if((idle_set[0] == 0x00) && ((init_state == CFG_IDLE) || (init_state == Recovery_Idle))) // Check for Logical Idle Pattern
                    {
                        // IDLE patterns started by the EP
                        idl_count++;

                        if(idl_count == 1 && init_state == CFG_IDLE)
                        {
                            received_1xidl_sets = 1;
                            transmit_idl_count = 16;
                        }
                        if(init_state == Recovery_Idle && first_retrain_idle_detection)
                        {
                            transmit_idl_count = 16;
                            first_retrain_idle_detection = false;
                        }
                        if(idl_count == 8)
                            received_8xidl_sets = 1;
                    }
                }

                /// Check for Disparity when init_state = L0, but pl_top has not yet taken over total control
                if(!come_next_time && !init_done_rx.read() && (init_state == L0))
                {
                    iter = map_table->data_decode_map.find(ireg_in_p_p[0].range(0,9).to_uint());
                    iter1 = map_table->neg_data_decode_map.find(ireg_in_p_p[0].range(0,9).to_uint());
                    iter2 = map_table->spec_symbol_decode_map.find(ireg_in_p_p[0].range(0,9).to_uint());
                    iter3 = map_table->neg_spec_symbol_decode_map.find(ireg_in_p_p[0].range(0,9).to_uint());
                    iter_n = map_table->data_decode_map.find(ireg_in_p[0].range(0,9).to_uint());
                    iter1_n = map_table->neg_data_decode_map.find(ireg_in_p[0].range(0,9).to_uint());
                    iter2_n = map_table->spec_symbol_decode_map.find(ireg_in_p[0].range(0,9).to_uint());
                    iter3_n = map_table->neg_spec_symbol_decode_map.find(ireg_in_p[0].range(0,9).to_uint());

                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        iter_0 = map_table->spec_symbol_decode_map.find(ireg_in_p_p[i].range(0,9).to_uint());
                        iter_1 = map_table->neg_spec_symbol_decode_map.find(ireg_in_p_p[i].range(0,9).to_uint());
                        iter_2 = map_table->data_decode_map.find(ireg_in_p_p[i].range(0,9).to_uint());
                        iter_3 = map_table->neg_data_decode_map.find(ireg_in_p_p[i].range(0,9).to_uint());
                        if(iter_0 != map_table->spec_symbol_decode_map.end())
                        {
                            if(!curr_running_disp->get_rx_CRD(i).to_bool())
                                LOG_WARNING << "WARNING : _LTSSM_ : Positive Running Disparity Error in lane " << i;
                            else // Set the disparity according to the symbol received
                            {
                                if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 1)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(1));
                                else if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 0)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(0));
                            }
                        }
                        else if(iter_1 != map_table->neg_spec_symbol_decode_map.end())
                        {
                            if(curr_running_disp->get_rx_CRD(i).to_bool())
                                LOG_WARNING << "WARNING : _LTSSM_ : Negative Running Disparity Error in lane " << i;
                            else // Set the disparity according to the symbol received
                            {
                                if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 1)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(1));
                                else if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 0)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(0));
                            }
                        }
                        else if(iter_2 != map_table->data_decode_map.end())
                        {
                            if(!curr_running_disp->get_rx_CRD(i).to_bool() && curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) != 2)
                                LOG_WARNING << "WARNING : _LTSSM_ : Positive Running Disparity Error in lane " << i;
                            else // Set the disparity according to the symbol received
                            {
                                if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 1)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(1));
                                else if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 0)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(0));
                            }
                        }
                        else if(iter_3 !=  map_table->neg_data_decode_map.end())
                        {
                            if(curr_running_disp->get_rx_CRD(i).to_bool() && curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) != 2)
                                LOG_WARNING << "WARNING : _LTSSM_ : Negative Running Disparity Error in lane " << i;
                            else // Set the disparity according to the symbol received
                            {
                                if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 1)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(1));
                                else if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 0)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(0));
                            }
                        }
                        else if(!first_packet[i])
                            LOG_WARNING << "WARNING : LTSSM : 8b/10b Decode Error";
                    }

                    if(iter2 != map_table->spec_symbol_decode_map.end())
                        idle_set[0] = iter2->second;
                    else if(iter3 != map_table->neg_spec_symbol_decode_map.end())
                        idle_set[0] = iter3->second;
                    else if(iter != map_table->data_decode_map.end())
                        idle_set[0] = iter->second;
                    else if(iter1 != map_table->neg_data_decode_map.end())
                        idle_set[0] = iter1->second;
                    tmp_lfsr = descrambler_i->get_lfsr(0); 
                    idle_set[0] = descrambler_i->scramble_descramble_all(idle_set[0].to_uint(),0,1);// LFSR moves forward
                    if((idle_set[0] == 0x00)) // Check for Logical Idle Pattern
                    {
                        // IDLE patterns started by the EP
                        idl_count++;

                        if(idl_count == 1 && init_state == CFG_IDLE)
                        {
                            received_1xidl_sets = 1;
                            transmit_idl_count = 16;
                        }
                        if(idl_count == 8)
                            received_8xidl_sets = 1;
                        if(init_state == Recovery_Idle && first_retrain_idle_detection)
                        {
                            transmit_idl_count = 16;
                            first_retrain_idle_detection = false;
                        }
                    }
                }

                /// Shift in values from the bus, for all states other than CFG_IDLE, Recovery_Idle and L0
                if(start_ordered_set && !come_next_time && (init_state != CFG_IDLE) && (init_state != Recovery_Idle) && (init_state != L0) && !init_done_rx.read()) // Ordered set starts after detecting COM
                {
                    ts1_2 = (ireg_in_p_p[0],ts1_2.range(159,10)); // Currently only shift in the 0th Lane
                    ts1_2_negedge = (ireg_in_p[0],ts1_2_negedge.range(159,10));
                    fts_set = (ireg_in_p_p[0],fts_set.range(39,10));
                    fts_set_negedge = (ireg_in_p[0],fts_set_negedge.range(39,10));
                    skip_set = (ireg_in_p_p[0],skip_set.range(39,10));
                    skip_set_negedge = (ireg_in_p[0],skip_set.range(39,10));
                    electrical_idle_set = (ireg_in_p_p[0],electrical_idle_set.range(39,10));
                    electrical_idle_set_negedge = (ireg_in_p[0],electrical_idle_set_negedge.range(39,10));
                    symbol_count = symbol_count + 1;
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        ts1_2_serial[i] = (ireg_in_p_p[i],ts1_2_serial[i].range(159,10));
                        ts1_2_serial_negedge[i] = (ireg_in_p[i],ts1_2_serial_negedge[i].range(159,10));
                    }
                    negedge_skip_this = false;
                }

                /// Shift in values from the bus for init_state = L0
                if(start_ordered_set && !come_next_time && init_state == L0 && init_done_rx.read()) // Going into the Recovery state form L0
                {
                    ts1_2 = (ireg_in_p_p[0],ts1_2.range(159,10)); // Currently only shift in the 0th Lane
                    ts1_2_negedge = (ireg_in_p[0],ts1_2_negedge.range(159,10));
                    fts_set = (ireg_in_p_p[0],fts_set.range(39,10));
                    fts_set_negedge = (ireg_in_p[0],fts_set_negedge.range(39,10));
                    skip_set = (ireg_in_p_p[0],skip_set.range(39,10));
                    skip_set_negedge = (ireg_in_p[0],skip_set.range(39,10));
                    electrical_idle_set = (ireg_in_p_p[0],electrical_idle_set.range(39,10));
                    electrical_idle_set_negedge = (ireg_in_p[0],electrical_idle_set_negedge.range(39,10));
                    symbol_count = symbol_count + 1;
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        ts1_2_serial[i] = (ireg_in_p_p[i],ts1_2_serial[i].range(159,10));
                        ts1_2_serial_negedge[i] = (ireg_in_p[i],ts1_2_serial_negedge[i].range(159,10));
                    }
                    negedge_skip_this = false;
                }

                /// Shift in all values for all states other than CFG_IDLE, Recovery_Idle and L0
                if(!come_next_time && (init_state != CFG_IDLE) && (init_state != Recovery_Idle) && (init_state != L0) && !init_done_rx.read()) // Ordered set starts after detecting COM
                {
                    iter = map_table->data_decode_map.find(ireg_in_p_p[0].range(0,9).to_uint());
                    iter1 = map_table->neg_data_decode_map.find(ireg_in_p_p[0].range(0,9).to_uint());
                    iter2 = map_table->spec_symbol_decode_map.find(ireg_in_p_p[0].range(0,9).to_uint());
                    iter3 = map_table->neg_spec_symbol_decode_map.find(ireg_in_p_p[0].range(0,9).to_uint());
                    iter_n = map_table->data_decode_map.find(ireg_in_p[0].range(0,9).to_uint());
                    iter1_n = map_table->neg_data_decode_map.find(ireg_in_p[0].range(0,9).to_uint());
                    iter2_n = map_table->spec_symbol_decode_map.find(ireg_in_p[0].range(0,9).to_uint());
                    iter3_n = map_table->neg_spec_symbol_decode_map.find(ireg_in_p[0].range(0,9).to_uint());

                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        iter_0 = map_table->spec_symbol_decode_map.find(ireg_in_p_p[i].range(0,9).to_uint());
                        iter_1 = map_table->neg_spec_symbol_decode_map.find(ireg_in_p_p[i].range(0,9).to_uint());
                        iter_2 = map_table->data_decode_map.find(ireg_in_p_p[i].range(0,9).to_uint());
                        iter_3 = map_table->neg_data_decode_map.find(ireg_in_p_p[i].range(0,9).to_uint());
                        iter_4 = map_table->spec_symbol_decode_map.find(ireg_in_p[i].range(0,9).to_uint());
                        iter_5 = map_table->neg_spec_symbol_decode_map.find(ireg_in_p[i].range(0,9).to_uint());
                        iter_6 = map_table->data_decode_map.find(ireg_in_p[i].range(0,9).to_uint());
                        iter_7 = map_table->neg_data_decode_map.find(ireg_in_p[i].range(0,9).to_uint());

                        /// For each lane from 0-LINK_WIDTH, set and check for Disparity
                        if(iter_0 != map_table->spec_symbol_decode_map.end())
                        {
                            if(first_packet[i] && frame_boundary_detected) // Set the value. This is the first packet
                            {
                                if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 1)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(1));
                                else if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 0)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(0));
                                else
                                    curr_running_disp->set_rx_CRD(i,sc_logic(1));
                            }

                            if(!curr_running_disp->get_rx_CRD(i).to_bool() && !first_packet[i] && curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) != 2 && init_state != DETECT_QUIET && init_state != DETECT_ACTIVE){}
                            else if(!first_packet[i])// Set the disparity according to the symbol received
                            {
                                if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 1)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(1));
                                else if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 0)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(0));
                            }
                            if(frame_boundary_detected)
                                first_packet[i] = false;
                        }
                        else if(iter_1 != map_table->neg_spec_symbol_decode_map.end())
                        {
                            if(first_packet[i] && frame_boundary_detected) // Set the value. This is the first packet
                            {
                                if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 1)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(1));
                                else if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 0)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(0));
                                else
                                    curr_running_disp->set_rx_CRD(i,sc_logic(0));
                            }

                            if(curr_running_disp->get_rx_CRD(i).to_bool() && !first_packet[i] && curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) != 2 && init_state != DETECT_QUIET && init_state != DETECT_ACTIVE){}
                            else if(!first_packet[i])// Set the disparity according to the symbol received
                            {
                                if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 1)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(1));
                                else if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 0)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(0));
                            }
                            if(frame_boundary_detected)
                                first_packet[i] = false;
                        }
                        else if(iter_2 != map_table->data_decode_map.end())
                        {

                            if(!curr_running_disp->get_rx_CRD(i).to_bool() && !first_packet[i])
                            {
                                // Also make sure this is not a neutral symbol. Then it it present both in pos
                                // and neg symbol map
                                if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) != 2)
                                    LOG_WARNING << "WARNING : _LTSSM_ : Positive Running Disparity Error in lane " << i;
                            }
                            else if(!first_packet[i])// Set the disparity according to the symbol received
                            {
                                if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 1)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(1));
                                else if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 0)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(0));
                            }
                        }
                        else if(iter_3 != map_table->neg_data_decode_map.end())
                        {

                            if(curr_running_disp->get_rx_CRD(i).to_bool() && !first_packet[i])
                            {
                                if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) != 2)
                                    LOG_WARNING << "WARNING : _LTSSM_ : Negative Running Disparity Error in lane " << i;
                            }
                            else if(!first_packet[i])// Set the disparity according to the symbol received
                            {
                                if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 1)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(1));
                                else if(curr_running_disp->calculate_disparity(ireg_in_p_p[i].range(0,9),0) == 0)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(0));
                            }
                        }
                        else if(iter_4 != map_table->spec_symbol_decode_map.end())
                        {
                            if(first_packet[i] && frame_boundary_detected) // Set the value. This is the first packet
                            {
                                if(curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) == 1)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(1));
                                else if(curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) == 0)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(0));
                                else
                                    curr_running_disp->set_rx_CRD(i,sc_logic(1));
                            }
                            if(!curr_running_disp->get_rx_CRD(i).to_bool() && !first_packet[i] && curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) != 2 && init_state != DETECT_QUIET && init_state != DETECT_ACTIVE)
                                LOG_WARNING << "WARNING : _LTSSM_ : Positive Running Disparity Error in lane " << i;
                            else if(!first_packet[i])
                            {
                                if(curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) == 1)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(1));
                                else if(curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) == 0)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(0));
                            }
                            if(frame_boundary_detected)
                                first_packet[i] = false;
                        }
                        else if(iter_5 != map_table->neg_spec_symbol_decode_map.end())
                        {
                            if(first_packet[i] && frame_boundary_detected) // Set the value. This is the first packet
                            {
                                if(curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) == 1)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(1));
                                else if(curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) == 0)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(0));
                                else
                                    curr_running_disp->set_rx_CRD(i,sc_logic(0));
                            }

                            if(curr_running_disp->get_rx_CRD(i).to_bool() && !first_packet[i] && curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) != 2 && init_state != DETECT_QUIET && init_state != DETECT_ACTIVE)
                                LOG_WARNING << "WARNING : _LTSSM_ : Negative Running Disparity Error in lane " << i;
                            else if(!first_packet[i])
                            {
                                if(curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) == 1)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(1));
                                else if(curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) == 0)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(0));
                            }
                            if(frame_boundary_detected)
                                first_packet[i] = false;
                        }
                        else if(iter_6 != map_table->data_decode_map.end())
                        {

                            if(!curr_running_disp->get_rx_CRD(i).to_bool() && !first_packet[i])
                            {
                                if(curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) != 2)
                                    LOG_WARNING << "WARNING : _LTSSM_ : Positive Running Disparity Error in lane " << i;
                            }
                            else if(!first_packet[i])
                            {
                                if(curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) == 1)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(1));
                                else if(curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) == 0)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(0));
                            }
                        }
                        else if(iter_7 != map_table->neg_data_decode_map.end())
                        {

                            if(curr_running_disp->get_rx_CRD(i).to_bool() && !first_packet[i])
                            {
                                if(curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) != 2)
                                    LOG_WARNING << "WARNING : _LTSSM_ : Negative Running Disparity Error in lane "<< i;
                            }
                            else if(!first_packet[i])
                            {
                                if(curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) == 1)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(1));
                                else if(curr_running_disp->calculate_disparity(ireg_in_p[i].range(0,9),0) == 0)
                                    curr_running_disp->set_rx_CRD(i,sc_logic(0));
                            }
                        }
                        else if(!first_packet[i] && frame_boundary_detected && init_state != DETECT_QUIET && init_state != DETECT_ACTIVE && init_state != POLLING_ACTIVE && init_state != POLLING_CONFIG && init_state != CFG_LINKWIDTH_START && init_state != CFG_LINKWIDTH_ACCEPT && !retraining)
                        {
                            LOG_WARNING << "WARNING : LTSSM : 8b/10b Decode Error";
                        }
                    }

                    /// Forward the LFSR for the particular rx symbol. But do not descramble the data

                    if(iter2 != map_table->spec_symbol_decode_map.end())// && ts1_pattern_received)
                        descrambler_i->scramble_descramble_all(iter2->second,0,1);
                    else if(iter3 != map_table->neg_spec_symbol_decode_map.end())// && ts1_pattern_received)
                        descrambler_i->scramble_descramble_all(iter3->second,0,1);
                    else if(iter != map_table->data_decode_map.end())// && ts1_pattern_received)
                        descrambler_i->scramble_descramble_all(iter->second,0,1);
                    else if(iter1 != map_table->neg_data_decode_map.end())// && ts1_pattern_received)
                        descrambler_i->scramble_descramble_all(iter1->second,0,1);

                    else if(iter2_n != map_table->spec_symbol_decode_map.end())// && ts1_pattern_received)
                        descrambler_i->scramble_descramble_all(iter2_n->second,0,1);
                    else if(iter3_n != map_table->neg_spec_symbol_decode_map.end())// && ts1_pattern_received)
                        descrambler_i->scramble_descramble_all(iter3_n->second,0,1);
                    else if(iter_n != map_table->data_decode_map.end())// && ts1_pattern_received)
                        descrambler_i->scramble_descramble_all(iter_n->second,0,1);
                    else if(iter1_n != map_table->neg_data_decode_map.end())// && ts1_pattern_received)
                        descrambler_i->scramble_descramble_all(iter1_n->second,0,1);
                }

                // TS1/TS2 ordered set occurs only when symbols 6-15 have TS ID
                // Second symbol after IDLE will show us
                if(((electrical_idle_set.range(39,30) == IDL_10b || electrical_idle_set_negedge.range(39,30) == IDL_10b) || (electrical_idle_set.range(39,30) == 0x33c) ||electrical_idle_set_negedge.range(39,30) == 0x33c ) && ((electrical_idle_set.range(9,0) == COM_10b) || (electrical_idle_set.range(9,0) == 0x17c) || electrical_idle_set_negedge.range(9,0) == COM_10b || electrical_idle_set_negedge.range(9,0) == 0x17c)) // Received Electrical Idle
                {
                    if(init_state == L0 || init_state == DISABLED_IDLE)
                        received_electrical_idle = 1;
                }

                /// SKP Ordered set
                if(((skip_set.range(39,30) == SKP_10b) || skip_set_negedge.range(39,30) == SKP_10b || (skip_set.range(39,30) == 0x0bc) || skip_set_negedge.range(39,30) == 0xbc) && ((skip_set.range(9,0) == COM_10b) || skip_set_negedge.range(9,0) == COM_10b || (skip_set.range(9,0) == 0x17c) || skip_set_negedge.range(9,0) == 0x17c)) // Received SKP OS
                {
                    if(init_state == L0)
                        received_skp_ordered_set = 1;
                }

                if(electrical_idle_constant_voltage_set.range(9,0) == 0x000 && !received_electrical_idle)
                {
                    constant_voltage_count++;
                    if(init_state == L0 || init_state == Recovery_RcvrLock || init_state == Recovery_RcvrCfg)
                    {
                        received_electrical_idle_constant_voltage = true;
                        constant_voltage_count = 0;
                    }
                    else
                        received_electrical_idle_constant_voltage = false;
                }

                /// Received TS1/TS2 Ordered Set.
                if(((ts1_2.range(159,150) == TS1_DELIM || ts1_2_negedge.range(159,150) == TS1_DELIM) || (ts1_2.range(159,150) == TS2_DELIM) || ts1_2_negedge.range(159,150) == TS2_DELIM) && ((ts1_2.range(149,140) == TS1_DELIM || ts1_2_negedge.range(149,140) == TS1_DELIM) || (ts1_2.range(149,140) == TS2_DELIM) || ts1_2_negedge.range(159,150) == TS2_DELIM) && ((ts1_2.range(9,0) == COM_10b || ts1_2_negedge.range(9,0) == COM_10b) || (ts1_2.range(9,0) == 0x17c || ts1_2_negedge.range(9,0) == 0x17c)) || link_ctl_csr.range(5,5) == 0x1) // TS1/TS2 patterns
                {
                    // TS1/TS2 ordered set detected
                    this_ts1_2 = 1;
                    start_ordered_set = 0;
                    symbol_count = 0;
                    if(init_state == L0) // Stop Transmitting DLLP/TLP and move to Recovery
                    {
                        toRecovery = true;
                    }
                    else
                        toRecovery = false;
                }
                else if((fts_set.range(39,30) == FTS_10b) || (skip_set.range(39,30) == SKP_10b) )
                    this_ts1_2 = 0;

                else
                    this_ts1_2 = 0;

                /// Received TS1 Ordered Set
                if((ts1_2.range(159,150) == TS1_DELIM || ts1_2_negedge.range(159,150) == TS1_DELIM)  && (ts1_2.range(149,140) == TS1_DELIM || ts1_2_negedge.range(159,150) == TS1_DELIM) && ((ts1_2.range(9,0) == COM_10b) || ts1_2_negedge.range(9,0) == COM_10b || (ts1_2.range(9,0) == 0x17c) || ts1_2_negedge.range(9,0) == 0x17c) || link_ctl_csr.range(5,5) == 0x1) // TS1 patterns
                {
                    ts1_count = ts1_count + 1;
                    ts1_set   = ts1_2;
                    if(link_ctl_csr.range(5,5) == 0x1)
                        csr_port.write_csr_mask(PEU_CSR_A_LNK_CTL_HW_ADDR,(0x0 << 5),PEU_CSR_LNK_CTL_RETRAIN_MASK);
                    if(init_state == L0) // Stop Transmitting DLLP/TLP and move to Revovery
                        toRecovery = true;
                    else
                        toRecovery = false;


                    training_ctl = ts1_2.range(50,59); // Get the training control bit to test for Hot Reset
                    if(training_ctl.range(9,0) == 0x1d4 || training_ctl.range(9,0) == 0x22b && init_state == HOT_RESET0)
                        ts1_hot_reset_count++;

                    if(ts1_hot_reset_count >= 2)
                        received_2xts1_hot_reset = true;
                    else
                        received_2xts1_hot_reset = false;


                    for(i=0; i<LINK_WIDTH;i++)
                    {
                        if ( (ts1_2_serial[i].range(19,10) == PAD_10b || ts1_2_serial_negedge[i].range(29,20) == PAD_10b) || (ts1_2_serial[i].range(19,10) == 0x057) || ts1_2_serial_negedge[i].range(29,20) == 0x057) // PAD link
                        {
                            link_field_PAD_ts1_ok++;
                        }
                    }
                    if(link_field_PAD_ts1_ok == LINK_WIDTH)
                    {
                        link_field_is_PAD_ts1++;
                        link_field_PAD_ts1_ok = 0;
                    }
                    else
                    {
                        link_field_PAD_ts1_ok = 0;
                    }

                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if ( (ts1_2_serial[i].range(29,20) == PAD_10b || ts1_2_serial_negedge[i].range(39,30) == PAD_10b) || (ts1_2_serial[i].range(29,20) == 0x057) || ts1_2_serial_negedge[i].range(39,30) == 0x057) // PAD lane
                        {
                            lane_field_PAD_ts1_ok++;
                            if(ts1_2_serial_negedge[i].range(39,30) == PAD_10b || ts1_2_serial_negedge[i].range(39,30) == 0x057)
                            {
                            }
                        }
                    }
                    if(lane_field_PAD_ts1_ok == LINK_WIDTH)
                    {
                        lane_field_is_PAD_ts1++;
                        lane_field_PAD_ts1_ok = 0;
                    }
                    else
                    {
                        lane_field_PAD_ts1_ok = 0;
                    }

                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if((ts1_2_serial[i].range(10,19) == encoded_value[0] || ts1_2_serial_negedge[i].range(20,29) == encoded_value[0]) || (ts1_2_serial[i].range(10,19) == neg_encoded_value[0]) || ts1_2_serial_negedge[i].range(20,29) == neg_encoded_value[0]) // non PAD link #   
                        {
                            link_field_non_PAD_ts1_ok++;
                        }
                        if(ts1_2_serial_negedge[i].range(20,29) == encoded_value[0] || ts1_2_serial_negedge[i].range(20,29) == neg_encoded_value[0])
                        {
                        }
                    }
                    if(link_field_non_PAD_ts1_ok == LINK_WIDTH || link_field_non_PAD_ts1_ok > 0)
                    {
                        link_field_is_non_PAD_ts1++;
                        link_field_non_PAD_ts1_ok = 0;
                    }
                    else
                        link_field_non_PAD_ts1_ok = 0;

                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if((ts1_2_serial[i].range(20,29) == encoded_value[i] || ts1_2_serial_negedge[i].range(30,39) == encoded_value[i] || ts1_2_serial_negedge[i].range(30,39) == neg_encoded_value[i]) || (ts1_2_serial[i].range(20,29) == neg_encoded_value[i])) // Each lane will have an unique lane # which is non PAD
                        {
                            if(ts1_2_serial_negedge[i].range(30,39) == encoded_value[i] || ts1_2_serial_negedge[i].range(30,39) == neg_encoded_value[i])
                            {
                            }
                            lane_num_ok++;
                        }
                        else if(((ts1_2_serial[i].range(29,20) != PAD_10b) && (ts1_2_serial[i].range(29,20) != 0x057)) && (ts1_2_serial_negedge[i].range(29,20) != PAD_10b && ts1_2_serial_negedge[i].range(29,20) != 0x057)) // Non pAD, but different Lane Num // PAD lane. Chance to move to CFG_LANENUM_WAIT
                        {
                            if((ts1_2_serial[i].range(29,20) != PAD_10b) && (ts1_2_serial[i].range(29,20) != 0x057))
                                ts1_lane_diff_non_PAD_tmp[i] = ts1_2_serial[i].range(20,29);
                            else
                                ts1_lane_diff_non_PAD_tmp[i] = ts1_2_serial_negedge[i].range(30,39);
                            diff_lane_num_ok++;
                        }
                        else if(((ts1_2_serial[i].range(20,29) != encoded_value[i]) || (ts1_2_serial[i].range(20,29) != neg_encoded_value[i])) && ((ts1_2_serial[i].range(29,20) != PAD_10b) && (ts1_2_serial[i].range(29,20) != 0x057)))
                        {
                            diff_lane_num_ok++;
                        }
                    }

                    if(lane_num_ok == LINK_WIDTH || lane_num_ok > 0) // All lanes match the lane number
                    {
                        lane_field_is_non_PAD_ts1++;
                        lane_num_ok = 0;
                        if(link_field_is_non_PAD_ts1 > 0 && init_state == CFG_LANENUM_WAIT)
                        {
                            from_cfg_lanenum_wait = false;
                            move_to_cfg_lanenum_accept = true;
                        }
                    }
                    else if(diff_lane_num_ok == 2 && link_field_is_non_PAD_ts1 == 2 && (init_state == CFG_LANENUM_ACCEPT) || (init_state == CFG_LINKWIDTH_ACCEPT))
                    {
                        move_to_cfg_lanenum_wait = 1;  // Move to CFG_LANENUM_WAIT
                        diff_lane_num_ok = 0;
                        lane_num_ok = 0;
                        for(i=0;i<LINK_WIDTH;i++)
                        {
                            ts2_lane_diff_non_PAD[i] = ts1_lane_diff_non_PAD_tmp[i];
                            ts1_lane_diff_non_PAD[i] = ts1_lane_diff_non_PAD_tmp[i];
                        }
                    }
                    else if((diff_lane_num_ok > 0  || lane_field_is_non_PAD_ts1 > 0) && link_field_is_non_PAD_ts1 > 0 && init_state == CFG_LANENUM_WAIT)
                    {
                        if(lane_field_is_non_PAD_ts1 > 0)
                            from_cfg_lanenum_wait = false;
                        move_to_cfg_lanenum_accept = 1;
                        move_to_cfg_lanenum_wait = false;
                        lane_field_is_non_PAD_ts1 = 0;
                        lane_num_ok = 0;
                        diff_lane_num_ok = 0;
                    }
                    else if(lane_num_ok == 0 && diff_lane_num_ok == 0)
                    {
                        lane_field_is_non_PAD_ts1 = 0;
                        lane_num_ok = 0;
                        diff_lane_num_ok = 0;
                    }

                    // Check for disable bit/scrambling bit/loopback bit etc in the link_ctl symbol
                    if(ts1_2.range(159,150) == TS1_DELIM && ts1_2.range(149,140) == TS1_DELIM)
                    {
                        iter = map_table->data_decode_map.find(ts1_2.range(50,59).to_uint());
                        iter1 = map_table->neg_data_decode_map.find(ts1_2.range(50,59).to_uint());
                        if(iter != map_table->data_decode_map.end())
                        {
                            ts1_trn_ctrl = iter->second;
                        }
                        else ts1_trn_ctrl = iter1->second;
                    }
                    else
                    {
                        iter = map_table->data_decode_map.find(ts1_2_negedge.range(60,69).to_uint());
                        iter1 = map_table->neg_data_decode_map.find(ts1_2_negedge.range(60,69).to_uint());
                        if(iter != map_table->data_decode_map.end())
                        {
                            ts1_trn_ctrl = iter->second;
                        }
                        else ts1_trn_ctrl = iter1->second;
                    }

                    if(ts1_trn_ctrl.range(1,1) == 0x1)
                        disable_link_reg = true;
                    else disable_link_reg = false;

                    if(ts1_trn_ctrl.range(3,3) == 0x1)
                        disable_scrambling_reg = true;
                    else disable_scrambling_reg = false;

                    if(disable_link_reg)
                        ts1_disable_link_count++;
                    else
                        ts1_disable_link_count = 0;

                    if(disable_scrambling_reg)
                        ts1_disable_scrambling_count++;
                    else
                        ts1_disable_scrambling_count = 0;

                    if(ts1_count == 1)
                    {
                        transmit_ts1_count = 17; //Workaround for Fast training.
                        received_1xts1_sets = 1;
                        enter_drain_state = false;
                    }

                    if(ts1_count == 8)
                    {
                        received_8xts1_sets = 1;
                    }
                    else
                        received_8xts1_sets = 0;
                }

                /// TS2 Ordered Set Received
                if((ts1_2.range(159,150) == TS2_DELIM || ts1_2_negedge.range(159,150) == TS2_DELIM)  && (ts1_2.range(149,140) == TS2_DELIM || ts1_2_negedge.range(149,140) == TS2_DELIM) && ((ts1_2.range(9,0) == COM_10b || ts1_2_negedge.range(9,0) == COM_10b) || (ts1_2.range(9,0) == 0x17c) || ts1_2_negedge.range(9,0) == 0x17c)) // TS2 patterns
                {
                    ts2_set = ts1_2;
                    ts2_count = ts2_count + 1;

                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if ( (ts1_2_serial[i].range(19,10) == PAD_10b || ts1_2_serial_negedge[i].range(29,20) == PAD_10b) || (ts1_2_serial[i].range(19,10) == 0x057) || ts1_2_serial_negedge[i].range(29,20) == 0x057) // Link PAD
                        {
                            link_field_PAD_ts2_ok++;
                        }
                    }
                    if(link_field_PAD_ts2_ok == LINK_WIDTH)
                    {
                        link_field_is_PAD_ts2++;
                        link_field_PAD_ts2_ok = 0;
                    }
                    else
                    {
                        link_field_PAD_ts2_ok = 0;
                    }

                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if ( (ts1_2_serial[i].range(29,20) == PAD_10b || ts1_2_serial_negedge[i].range(39,30) == PAD_10b) || (ts1_2_serial[i].range(29,20) == 0x057) || ts1_2_serial_negedge[i].range(39,30) == 0x057) // Lane PAD
                        {
                            lane_field_PAD_ts2_ok++;
                        }
                    }
                    if(lane_field_PAD_ts2_ok == LINK_WIDTH)
                    {
                        lane_field_is_PAD_ts2++;
                        lane_field_PAD_ts2_ok = 0;
                    }
                    else
                    {
                        lane_field_PAD_ts2_ok = 0;
                    } 

                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if((ts1_2_serial[i].range(19,10) != PAD_10b && ts1_2_serial_negedge[i].range(29,20) != PAD_10b) && (ts1_2_serial[i].range(19,10) != PAD_10b) || ts1_2_serial_negedge[i].range(29,20) != PAD_10b) // non PAD link # received 
                        {
                            link_field_non_PAD_ts2_ok++;
                        }
                    }

                    if(link_field_non_PAD_ts2_ok == LINK_WIDTH)
                    {
                        link_field_is_non_PAD_ts2++;
                        link_field_non_PAD_ts2_ok = 0;
                    }
                    else
                    {
                        link_field_non_PAD_ts2_ok = 0;
                    }

                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if((ts1_2_serial[i].range(20,29) == encoded_value[i] || ts1_2_serial_negedge[i].range(30,39) == encoded_value[i]) || (ts1_2_serial[i].range(20,29) == neg_encoded_value[i]) || ts1_2_serial_negedge[i].range(30,39) == neg_encoded_value[i]) // Each lane will have an unique lane # which is non PAD
                        {
                            lane_num_ok++;
                        }
                        else if(((ts1_2_serial[i].range(29,20) != PAD_10b) && (ts1_2_serial[i].range(29,20) != 0x057)) || (ts1_2_serial_negedge[i].range(39,30) != PAD_10b) && (ts1_2_serial_negedge[i].range(39,30) != 0x057)) // Non pAD, but different Lane Num
                        {
                            lane_num_ok++;
                        }
                    }

                    if(lane_num_ok == LINK_WIDTH) // All lanes match the lane number
                    {
                        lane_field_is_non_PAD_ts2++;
                        lane_num_ok = 0;
                    }
                    else if(lane_num_ok == 0)
                    {
                        lane_num_ok = 0;
                    }

                    if(ts2_count == 1)
                    {
                        transmit_ts2_count = 17;
                        received_1xts2_sets = 1;
                    }

                    if ( ts2_count == 9 )
                    {
                        received_8xts2_sets=1;
                    }
                    else
                        received_8xts2_sets=0;

                    if(ts2_count >= 2  && init_state == CFG_LANENUM_WAIT)
                    {
                        move_to_cfg_lanenum_accept = 1;
                        if(lane_field_is_non_PAD_ts2 > 0)
                            from_cfg_lanenum_wait = false;
                    }
                }

                if(this_ts1_2) // One TS1/TS2 pattern received.. Reset this vector and receive the next TS1/TS2 pattern
                {
                    ts1_2.range(159,0) = 0x0000000000000000000000000000000000000000;
                }
            }

            if(stage_init_state_rx)
            {
                init_done_rx.write(true);
            }

            if(write_init_done_rx && frame_boundary_reg.read())
            {
                stage_init_state_rx = true;
            }
            wait(SC_ZERO_TIME); // Transmit 2 last frame to take care of race condition in the pl_top
        }
        else
        {
            ts1_2 = 0x0000000000000000000000000000000000000000;
            ts1_2_negedge = 0x0000000000000000000000000000000000000000;
            transmitted_1024xts1_2sets = 0;
            transmitted_16xts2_sets = 0;
            transmitted_16xidl_sets = 0;
            transmitted_ts1_pattern = 0;
            ts1_pattern_bit = 0;
            ts2_pattern_bit = 0;
            idle_pattern_bit = 0;
            received_8xts2_sets = 0;
            received_8xts1_sets = 0;
            received_1xts1_sets = 0;
            received_1xts2_sets = 0;
            ts1_non_pad_link_bit = 0;
            symbol_num = 0;
            link_field_is_PAD_ts1 = 0;
            lane_field_is_PAD_ts1 = 0;
            link_field_is_PAD_ts2 = 0;
            lane_field_is_PAD_ts2 = 0;
            link_field_is_non_PAD_ts1 = 0;
            lane_field_is_non_PAD_ts1 = 0;
            link_field_is_non_PAD_ts2 = 0;
            lane_field_is_non_PAD_ts2 = 0;
            link_field_PAD_ts1_ok = 0;
            link_field_PAD_ts2_ok = 0;
            lane_field_PAD_ts1_ok = 0;
            lane_field_PAD_ts2_ok = 0;
            elec_idle_pattern_bit = 0;
            com_detected_tx = false;
            start_frame_boundary_tx = false;
            frame_boundary_tx_counter = 0;
            frame_boundary_detected = 0;
            sym_counter = 0;
            lock_counter = 0;
            lock_negedge_clock = false;
            com_detected = false;
            for(i=0;i<LINK_WIDTH;i++)
            {
                first_packet[i] = true;
            }
        }
        wait(link_clk.negedge_event());
    }
}

/// Set the Delimiters for TS1/TS2 patterns for different state registers
/// Useful for reusability
void ltssm::set_delim_value(int set,int i)
{
    switch(set)
    {
        case DISABLED_SET : 
            {
                disabled_set[i].range(159,150) = TS1_DELIM;
                disabled_set[i].range(149,140) = TS1_DELIM;
                disabled_set[i].range(139,130) = TS1_DELIM;
                disabled_set[i].range(129,120) = TS1_DELIM;
                disabled_set[i].range(119,110) = TS1_DELIM;
                disabled_set[i].range(109,100) = TS1_DELIM;
                disabled_set[i].range(99,90) = TS1_DELIM;
                disabled_set[i].range(89,80) = TS1_DELIM;
                disabled_set[i].range(79,70) = TS1_DELIM;
                disabled_set[i].range(69,60) = TS1_DELIM;
            }
        case TS1_SET_CONST :
            {
                ts1_set_const[i].range(159,150) = TS1_DELIM;
                ts1_set_const[i].range(149,140) = TS1_DELIM;
                ts1_set_const[i].range(139,130) = TS1_DELIM;
                ts1_set_const[i].range(129,120) = TS1_DELIM;
                ts1_set_const[i].range(119,110) = TS1_DELIM;
                ts1_set_const[i].range(109,100) = TS1_DELIM;
                ts1_set_const[i].range(99,90) = TS1_DELIM;
                ts1_set_const[i].range(89,80) = TS1_DELIM;
                ts1_set_const[i].range(79,70) = TS1_DELIM;
                ts1_set_const[i].range(69,60) = TS1_DELIM;
            }
        case TS2_SET_CONST :
            {
                ts2_set_const[i].range(159,150) = TS2_DELIM;
                ts2_set_const[i].range(149,140) = TS2_DELIM;
                ts2_set_const[i].range(139,130) = TS2_DELIM;
                ts2_set_const[i].range(129,120) = TS2_DELIM;
                ts2_set_const[i].range(119,110) = TS2_DELIM;
                ts2_set_const[i].range(109,100) = TS2_DELIM;
                ts2_set_const[i].range(99,90) = TS2_DELIM;
                ts2_set_const[i].range(89,80) = TS2_DELIM;
                ts2_set_const[i].range(79,70) = TS2_DELIM;
                ts2_set_const[i].range(69,60) = TS2_DELIM;
            }
        case TS1_LINK_NUM_NON_PAD :
            {
                ts1_link_num_non_PAD[i].range(159,150) = TS1_DELIM;
                ts1_link_num_non_PAD[i].range(149,140) = TS1_DELIM;
                ts1_link_num_non_PAD[i].range(139,130) = TS1_DELIM;
                ts1_link_num_non_PAD[i].range(129,120) = TS1_DELIM;
                ts1_link_num_non_PAD[i].range(119,110) = TS1_DELIM;
                ts1_link_num_non_PAD[i].range(109,100) = TS1_DELIM;
                ts1_link_num_non_PAD[i].range(99,90) = TS1_DELIM;
                ts1_link_num_non_PAD[i].range(89,80) = TS1_DELIM;
                ts1_link_num_non_PAD[i].range(79,70) = TS1_DELIM;
                ts1_link_num_non_PAD[i].range(69,60) = TS1_DELIM;
            }
        case TS1_LINK_LANE_NON_PAD :
            {
                ts1_link_lane_non_PAD[i].range(159,150) = TS1_DELIM;
                ts1_link_lane_non_PAD[i].range(149,140) = TS1_DELIM;
                ts1_link_lane_non_PAD[i].range(139,130) = TS1_DELIM;
                ts1_link_lane_non_PAD[i].range(129,120) = TS1_DELIM;
                ts1_link_lane_non_PAD[i].range(119,110) = TS1_DELIM;
                ts1_link_lane_non_PAD[i].range(109,100) = TS1_DELIM;
                ts1_link_lane_non_PAD[i].range(99,90) = TS1_DELIM;
                ts1_link_lane_non_PAD[i].range(89,80) = TS1_DELIM;
                ts1_link_lane_non_PAD[i].range(79,70) = TS1_DELIM;
                ts1_link_lane_non_PAD[i].range(69,60) = TS1_DELIM;
            }
        case TS2_LINK_LANE_NON_PAD :
            {
                ts2_link_lane_non_PAD[i].range(159,150) = TS2_DELIM;
                ts2_link_lane_non_PAD[i].range(149,140) = TS2_DELIM;
                ts2_link_lane_non_PAD[i].range(139,130) = TS2_DELIM;
                ts2_link_lane_non_PAD[i].range(129,120) = TS2_DELIM;
                ts2_link_lane_non_PAD[i].range(119,110) = TS2_DELIM;
                ts2_link_lane_non_PAD[i].range(109,100) = TS2_DELIM;
                ts2_link_lane_non_PAD[i].range(99,90) = TS2_DELIM;
                ts2_link_lane_non_PAD[i].range(89,80) = TS2_DELIM;
                ts2_link_lane_non_PAD[i].range(79,70) = TS2_DELIM;
                ts2_link_lane_non_PAD[i].range(69,60) = TS2_DELIM;
            }
    }
}

/// This function can be useful if you want to reset all variables at the same time. Use with CAUTION
void ltssm::reset_var_detect_quiet()
{
    link_field_is_PAD_ts1 = 0;
    link_field_is_PAD_ts2 = 0;
    lane_field_is_PAD_ts1 = 0;
    lane_field_is_PAD_ts2 = 0;
    link_field_is_non_PAD_ts1 = 0;
    lane_field_is_non_PAD_ts1 = 0;
    link_field_is_non_PAD_ts2 = 0;
    lane_field_is_non_PAD_ts2 = 0;
    transmitted_16xts2_sets = 0;
    transmitted_1024xts1_2sets = 0;
    ts1_count = 0;
    ts2_count = 0;
    received_1xts2_sets = 0;
    received_8xts2_sets = 0;
    received_1xts1_sets = 0;
    received_8xts1_sets = 0;
    received_1xidl_sets = 0;
    received_8xidl_sets = 0;
    received_electrical_idle = 0;
    received_electrical_idle_constant_voltage = 0;
    received_2xts1_hot_reset = 0;
    received_skp_ordered_set = 0;
    transmitted_1024xts1_2sets = 0;

}
/// Main block to take care of transmission
void ltssm::tx_block()
{
    int i,k;
    map<int,int>::iterator iter,iter1,iter2;
    unsigned short tmp_lfsr; 
    sc_lv<10> scramble_pattern = 0x000;

    while(true)
    {
        if(reset_por_l.read()) // System has come out of reset
        {
            if(init_state == DISABLED_ENTRY) // Transmitter for DISABLED_ENTRY state
            {
                if(ts1_non_pad_link_bit == 0 && ts1_disabled_bit == 0 && ts2_pattern_bit == 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K28_5);
                            disabled_set[i].range(0,9) = iter->second;
                            set_delim_value(DISABLED_SET,i);
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K28_5);
                            disabled_set[i].range(0,9) = ~(iter->second);
                            set_delim_value(DISABLED_SET,i);
                        }
                        if(curr_running_disp->calculate_disparity(disabled_set[i].range(0,9),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(disabled_set[i].range(0,9),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }
                    }
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K23_7);
                            ts1_set_const[i].range(10,19) = iter->second; // Neutral disparity
                            iter = map_table->spec_symbol_map.find(K23_7);
                            ts1_set_const[i].range(20,29) = iter->second; // Neutral
                            ts1_set_const[i].range(30,39) = 0x15a; // Neutral
                            iter = map_table->data_encode_map.find(D2_0);
                            ts1_set_const[i].range(40,49) = iter->second; // Neutral
                            iter = map_table->data_encode_map.find(D2_0);
                            ts1_set_const[i].range(50,59) = iter->second; // Neutral
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K23_7);
                            ts1_set_const[i].range(10,19) = ~(iter->second); // Neutral disparity
                            iter = map_table->spec_symbol_map.find(K23_7);
                            ts1_set_const[i].range(20,29) = ~(iter->second); // Neutral
                            ts1_set_const[i].range(30,39) = TS2_DELIM; // Neutral
                            iter = map_table->neg_data_encode_map.find(D2_0);
                            ts1_set_const[i].range(40,49) = (iter->second); // Neutral
                            iter = map_table->neg_data_encode_map.find(D2_0);
                            ts1_set_const[i].range(50,59) = (iter->second); // Neutral
                        }
                    }
                }
                /// Go ahead with the disabled state transmission
                if(ts1_non_pad_link_bit == 0 && ts2_pattern_bit == 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (disabled_set[i].range(ts1_disabled_bit,ts1_disabled_bit));
                        else
                            out_reg = (disabled_set[i].range(ts1_disabled_bit,ts1_disabled_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_disabled_bit == 0) // COM
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_disabled_bit % 10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }
                    ts1_disabled_bit += 1;
                    ts1_disabled_bit %= 160;
                    if(ts1_disabled_bit == 0) // Transmitted a TS1 pattern with disable bit asserted
                    {
                        ts1_disabled_pattern_count++;
                        if(ts1_disabled_pattern_count == 16)
                            transmitted_16xts1_disabled = true;
                    }
                }
                /// Complete the previous transmission
                else if(ts1_non_pad_link_bit != 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_link_num_non_PAD[i].range(ts1_non_pad_link_bit,ts1_non_pad_link_bit));
                        else
                            out_reg = (ts1_link_num_non_PAD[i].range(ts1_non_pad_link_bit,ts1_non_pad_link_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_non_pad_link_bit == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_non_pad_link_bit % 10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }

                    ts1_non_pad_link_bit += 1;
                    ts1_non_pad_link_bit %= 160;
                }
                /// Complete the previous transmission
                else if(ts2_pattern_bit != 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts2_set_const[i].range(ts2_pattern_bit,ts2_pattern_bit));
                        else
                            out_reg = (ts2_set_const[i].range(ts2_pattern_bit,ts2_pattern_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts2_pattern_bit == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts2_pattern_bit % 10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }

                    ts2_pattern_bit += 1;
                    ts2_pattern_bit %= 160;
                }
            }

            /// If the init_state is DETECT_QUIET/DETECT_ACTIVE/DISABLED, finish off the remaining transfers from the previous state
            /// and then start sending DISABLE patterns
            if(init_state == DETECT_QUIET || init_state == DETECT_ACTIVE || init_state == DISABLED_IDLE || init_state == DISABLED) // Start this, aligned with the Rx frame_boundary
            {
                /// Send Electrical idle patterns
                if(elec_idle_pattern_bit == 0 && ts1_pattern_bit == 0 && ts2_pattern_bit == 0 && ts2_failover_pattern_bit == 0 && ts1_non_pad_link_bit == 0 && ts1_non_pad_link_lane == 0 && symbol_num == 0 && idle_pattern_bit == 0 && ts1_disabled_bit == 0 && ts1_non_pad_lane_bit == 0 && ts1_non_pad_diff_lane_bit == 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K28_5);
                            elec_idle_set[i].range(0,9) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K28_5);
                            elec_idle_set[i].range(0,9) = ~(iter->second);
                        }
                        if(curr_running_disp->calculate_disparity(elec_idle_set[i].range(0,9),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(elec_idle_set[i].range(0,9),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }

                    }
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K28_3);
                            elec_idle_set[i].range(10,19) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K28_3);
                            elec_idle_set[i].range(10,19) = ~(iter->second);
                        }
                        if(curr_running_disp->calculate_disparity(elec_idle_set[i].range(10,19),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(elec_idle_set[i].range(10,19),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }

                    }
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K28_3);
                            elec_idle_set[i].range(20,29) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K28_3);
                            elec_idle_set[i].range(20,29) = ~(iter->second);
                        }
                        if(curr_running_disp->calculate_disparity(elec_idle_set[i].range(20,29),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(elec_idle_set[i].range(20,29),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }

                    }
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K28_3);
                            elec_idle_set[i].range(30,39) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K28_3);
                            elec_idle_set[i].range(30,39) = ~(iter->second);
                        }
                        if(curr_running_disp->calculate_disparity(elec_idle_set[i].range(30,39),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(elec_idle_set[i].range(30,39),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }

                    }
                }
                /// Send Electrical IDLE ordered set
                if(ts1_pattern_bit == 0 && ts2_pattern_bit == 0 && ts2_failover_pattern_bit == 0 && ts1_non_pad_link_bit == 0 && ts1_non_pad_link_lane == 0 && symbol_num == 0 && idle_pattern_bit == 0 && ts1_non_pad_lane_bit == 0 && ts1_non_pad_diff_lane_bit == 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (elec_idle_set[i].range(elec_idle_pattern_bit,elec_idle_pattern_bit));
                        else
                            out_reg = (elec_idle_set[i].range(elec_idle_pattern_bit,elec_idle_pattern_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(elec_idle_pattern_bit == 0) // COM
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((elec_idle_pattern_bit % 10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }
                    elec_idle_pattern_bit += 1;
                    elec_idle_pattern_bit %= 40;
                    if(elec_idle_pattern_bit == 0)
                    {
                        transmitted_1xelec_idle = true;
                    }
                }
                /// Send previous patterns (if any) with link and lane #s non pad
                else if(ts1_non_pad_lane_bit != 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_lane_bit,ts1_non_pad_lane_bit));
                        else
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_lane_bit,ts1_non_pad_lane_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_non_pad_lane_bit == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_non_pad_lane_bit %10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }

                    ts1_non_pad_lane_bit += 1;
                    ts1_non_pad_lane_bit %= 160;
                }
                else if(ts1_non_pad_diff_lane_bit != 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_diff_lane_bit,ts1_non_pad_diff_lane_bit));
                        else
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_diff_lane_bit,ts1_non_pad_diff_lane_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_non_pad_diff_lane_bit == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_non_pad_diff_lane_bit %10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }

                    ts1_non_pad_diff_lane_bit += 1;
                    ts1_non_pad_diff_lane_bit %= 160;
                }
                /// Send off remaining disabled patterns
                else if(ts1_disabled_bit != 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (disabled_set[i].range(ts1_disabled_bit,ts1_disabled_bit));
                        else
                            out_reg = (disabled_set[i].range(ts1_disabled_bit,ts1_disabled_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_disabled_bit == 0) // COM
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_disabled_bit % 10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }
                    ts1_disabled_bit += 1;
                    ts1_disabled_bit %= 160;
                }
                /// Send the remaining TS1 patterns with link and lane # set to PAD
                else if(ts1_pattern_bit != 0)
                {
                    for(i=0;i<LINK_WIDTH;i++) // First Pattern will yield positive disparity. Resync the frame boundary here
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_set_const[i].range(ts1_pattern_bit,ts1_pattern_bit));
                        else
                            out_reg = (ts1_set_const[i].range(ts1_pattern_bit,ts1_pattern_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_pattern_bit == 0) // COM
                    {
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    }
                    else if((ts1_pattern_bit % 10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }

                    }
                    ts1_pattern_bit += 1;
                    ts1_pattern_bit %= 160;
                    if(ts1_pattern_bit == 0) // TS1 pattern transmitted
                    {
                        transmit_ts1_count--;
                        transmitted_ts1_pattern += 1;
                        if(transmit_ts1_count == 0)
                        {
                            transmitted_1024xts1_2sets = 1;
                            transmit_ts1_count+= 17;
                        }
                    }
                }
                /// Send the remaining TS2 patterns with link and lane # set to PAD
                else if(ts2_pattern_bit != 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts2_set_const[i].range(ts2_pattern_bit,ts2_pattern_bit));
                        else
                            out_reg = (ts2_set_const[i].range(ts2_pattern_bit,ts2_pattern_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts2_pattern_bit == 0) // COM
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts2_pattern_bit % 10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }

                    }
                    ts2_pattern_bit += 1;
                    ts2_pattern_bit %= 160;
                    if(ts2_pattern_bit == 0)
                    {
                        transmit_ts2_count--;
                        transmitted_ts2_pattern += 1;
                        if(transmit_ts2_count == 0)
                            transmitted_16xts2_sets = 1;
                    }
                }
                else if(ts2_failover_pattern_bit != 0)
                {
                    for(i=0;i<LINK_WIDTH;i++) // First Pattern will yield positive disparity
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts2_set_const[i].range(ts2_failover_pattern_bit,ts2_failover_pattern_bit));
                        else
                            out_reg = (ts2_set_const[i].range(ts2_failover_pattern_bit,ts2_failover_pattern_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts2_failover_pattern_bit == 0) // COM
                    {
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    }
                    else if((ts2_failover_pattern_bit % 10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }
                    ts2_failover_pattern_bit += 1;
                    ts2_failover_pattern_bit %= 160;
                    if(ts2_failover_pattern_bit == 0) // TS1 pattern transmitted
                    {
                        transmit_failover_ts2_count--;
                        transmitted_ts2_pattern += 1;
                    }
                }
                /// Send the remaining TS1 patterns with link # set to non PAD
                else if(ts1_non_pad_link_bit != 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_link_num_non_PAD[i].range(ts1_non_pad_link_bit,ts1_non_pad_link_bit));
                        else
                            out_reg = (ts1_link_num_non_PAD[i].range(ts1_non_pad_link_bit,ts1_non_pad_link_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_non_pad_link_bit == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_non_pad_link_bit % 10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }

                    ts1_non_pad_link_bit += 1;
                    ts1_non_pad_link_bit %= 160;
                }
                /// Send the remaining TS1 patterns with both link and lane # set to non PAD
                else if(ts1_non_pad_link_lane != 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_link_lane,ts1_non_pad_link_lane));
                        else
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_link_lane,ts1_non_pad_link_lane),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_non_pad_link_lane == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_non_pad_link_lane % 10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }

                    ts1_non_pad_link_lane += 1;
                    ts1_non_pad_link_lane %= 160;
                }
                else if(symbol_num != 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts2_link_lane_non_PAD[i].range(symbol_num,symbol_num));
                        else
                            out_reg = (ts2_link_lane_non_PAD[i].range(symbol_num,symbol_num),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(symbol_num == 0)
                    {
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    }
                    else if((symbol_num % 10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }

                    symbol_num++;
                    symbol_num %= 160;
                    if(symbol_num == 0)
                    {
                        transmit_ts2_count--;
                        transmitted_ts2_pattern += 1;

                        if(transmit_ts2_count == 0)
                            transmitted_16xts2_sets = 1;
                    }
                }
                /// Send the remaining Logical Idle patterns
                else if(idle_pattern_bit != 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (idle_set_const[i].range(idle_pattern_bit,idle_pattern_bit));
                        else
                            out_reg = (idle_set_const[i].range(idle_pattern_bit,idle_pattern_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    idle_pattern_bit += 1;
                    idle_pattern_bit %= 10;
                    if(idle_pattern_bit == 0)
                    {
                        transmit_idl_count--;
                        transmitted_idl_pattern += 1;

                        if(transmit_idl_count == 0)
                            transmitted_16xidl_sets = 1;
                        if(init_done.read()) done_last_idle++;
                    }
                }
                prev_init_state = DETECT_QUIET;
            }

            if(received_1xts2_sets && init_state == POLLING_CONFIG) // Transmit buffers for POLLING_CONFIG
            {
                // What if the state has not yet changed. but transmit_ts2_count is 0
                // Transmit one more 
                if(transmitted_16xts2_sets)
                    transmit_ts2_count = 1; // Transmit the last one
                if ( transmit_ts2_count != 0 ) 
                {
                    // Transmission based on calculation of CRD
                    if(ts2_pattern_bit == 0 && ts1_pattern_bit == 0 && ts2_failover_pattern_bit == 0)
                    {
                        for(i=0;i<LINK_WIDTH;i++)
                        {
                            if(curr_running_disp->get_CRD(i).to_bool())
                            {
                                iter = map_table->spec_symbol_map.find(K28_5);
                                ts2_set_const[i].range(0,9) = iter->second;
                                set_delim_value(TS2_SET_CONST,i);
                            }
                            else if(!curr_running_disp->get_CRD(i).to_bool())
                            {
                                iter = map_table->spec_symbol_map.find(K28_5);
                                ts2_set_const[i].range(0,9) = ~(iter->second);
                                set_delim_value(TS2_SET_CONST,i);
                            }
                            if(curr_running_disp->calculate_disparity(ts2_set_const[i].range(0,9),0) == 1)
                            {
                                curr_running_disp->set_CRD(i,sc_logic(1));
                            }
                            else if(curr_running_disp->calculate_disparity(ts2_set_const[i].range(0,9),0) == 0)
                            {
                                curr_running_disp->set_CRD(i,sc_logic(0));
                            }
                        }

                        for(i=0;i<LINK_WIDTH;i++)
                        {
                            if(curr_running_disp->get_CRD(i).to_bool())
                            {
                                iter = map_table->spec_symbol_map.find(K23_7); 
                                ts2_set_const[i].range(10,19) = iter->second; // Neutral disparity
                                iter = map_table->spec_symbol_map.find(K23_7); 
                                ts2_set_const[i].range(20,29) = iter->second; // Neutral
                                ts2_set_const[i].range(30,39) = 0x15a; // Neutral
                                iter = map_table->data_encode_map.find(D2_0);
                                ts2_set_const[i].range(40,49) = iter->second; // Neutral
                                iter = map_table->data_encode_map.find(D0_0);
                                ts2_set_const[i].range(50,59) = iter->second; // Neutral
                            }
                            else if(!curr_running_disp->get_CRD(i).to_bool())
                            {
                                iter = map_table->spec_symbol_map.find(K23_7); 
                                ts2_set_const[i].range(10,19) = ~(iter->second); // Neutral disparity
                                iter = map_table->spec_symbol_map.find(K23_7); 
                                ts2_set_const[i].range(20,29) = ~(iter->second); // Neutral
                                ts2_set_const[i].range(30,39) = TS2_DELIM; // Neutral
                                iter = map_table->neg_data_encode_map.find(D2_0);
                                ts2_set_const[i].range(40,49) = (iter->second); // Neutral
                                iter = map_table->neg_data_encode_map.find(D0_0);
                                ts2_set_const[i].range(50,59) = (iter->second); // Neutral
                            }
                        }
                    }

                    /// Go ahead with the transmission of POLLING_CONFIG ordered set
                    if(ts1_pattern_bit == 0 && ts2_failover_pattern_bit == 0)
                    {
                        for(i=0;i<LINK_WIDTH;i++)
                        {
                            if(LINK_WIDTH == 1)
                                out_reg = (ts2_set_const[i].range(ts2_pattern_bit,ts2_pattern_bit));
                            else
                                out_reg = (ts2_set_const[i].range(ts2_pattern_bit,ts2_pattern_bit),out_reg.range(LINK_WIDTH-1,1));
                            out_reg_bar = ~out_reg;
                        }
                        if(ts2_pattern_bit == 0) // COM
                            scrambler_i->scramble_descramble_all(K28_5,1,1);
                        else if((ts2_pattern_bit % 10) == 0)
                        {
                            for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                            {
                                scrambler_i->start_scramble_reg[lane_scram] = true;
                                scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                            }
                        }
                        ts2_pattern_bit += 1;
                        ts2_pattern_bit %= 160;
                        if(ts2_pattern_bit == 0)
                        {
                            transmit_ts2_count--;
                            transmitted_ts2_pattern += 1;
                            if(transmit_ts2_count == 0)
                                transmitted_16xts2_sets = 1;
                        }
                    }
                    else if(ts1_pattern_bit != 0)// Complete the previous transaction of TS1 OS
                    {
                        for(i=0;i<LINK_WIDTH;i++)
                        {
                            if(LINK_WIDTH == 1)
                                out_reg = (ts1_set_const[i].range(ts1_pattern_bit,ts1_pattern_bit));
                            else
                                out_reg = (ts1_set_const[i].range(ts1_pattern_bit,ts1_pattern_bit),out_reg.range(LINK_WIDTH-1,1));
                            out_reg_bar = ~out_reg;
                        }
                        if(ts1_pattern_bit == 0)
                            scrambler_i->scramble_descramble_all(K28_5,1,1);
                        else if((ts1_pattern_bit % 10) == 0)
                        {
                            for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                            {
                                scrambler_i->start_scramble_reg[lane_scram] = true;
                                scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                            }
                        }
                        ts1_pattern_bit++;
                        ts1_pattern_bit %= 160;
                    }
                    else if(ts2_failover_pattern_bit != 0)
                    {
                        for(i=0;i<LINK_WIDTH;i++) // First Pattern will yield positive disparity
                        {
                            if(LINK_WIDTH == 1)
                                out_reg = (ts2_set_const[i].range(ts2_failover_pattern_bit,ts2_failover_pattern_bit));
                            else
                                out_reg = (ts2_set_const[i].range(ts2_failover_pattern_bit,ts2_failover_pattern_bit),out_reg.range(LINK_WIDTH-1,1));
                            out_reg_bar = ~out_reg;
                        }
                        if(ts2_failover_pattern_bit == 0) // COM
                        {
                            scrambler_i->scramble_descramble_all(K28_5,1,1);
                        }
                        else if((ts2_failover_pattern_bit % 10) == 0)
                        {
                            for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                            {
                                scrambler_i->start_scramble_reg[lane_scram] = true;
                                scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                            }
                        }
                        ts2_failover_pattern_bit += 1;
                        ts2_failover_pattern_bit %= 160;
                        if(ts2_failover_pattern_bit == 0) // TS1 pattern transmitted
                        {
                            transmit_failover_ts2_count--;
                            transmitted_ts2_pattern += 1;
                        }
                    }
                }
                else // stop transmit
                {
                    transmitted_16xts2_sets = 1;
                    received_8xts2_sets =0;
                }
                prev_init_state = POLLING_CONFIG;
            }
            if(!received_1xts2_sets && init_state == POLLING_CONFIG) // POLLING_CONFIG reached but still not received any TS2. Start transmitting TS2
            {
                if(transmit_failover_ts2_count != 0)
                {
                    if(ts2_failover_pattern_bit == 0 && ts2_pattern_bit == 0 && ts1_pattern_bit == 0)
                    {
                        for(i=0;i<LINK_WIDTH;i++)
                        {
                            if(curr_running_disp->get_CRD(i).to_bool())
                            {
                                iter = map_table->spec_symbol_map.find(K28_5);
                                ts2_set_const[i].range(0,9) = iter->second;
                                set_delim_value(TS2_SET_CONST,i);
                            }
                            else if(!curr_running_disp->get_CRD(i).to_bool())
                            {
                                iter = map_table->spec_symbol_map.find(K28_5);
                                ts2_set_const[i].range(0,9) = ~(iter->second);
                                set_delim_value(TS2_SET_CONST,i);
                            }
                            if(curr_running_disp->calculate_disparity(ts2_set_const[i].range(0,9),0) == 1)
                            {
                                curr_running_disp->set_CRD(i,sc_logic(1));
                            }
                            else if(curr_running_disp->calculate_disparity(ts2_set_const[i].range(0,9),0) == 0)
                            {
                                curr_running_disp->set_CRD(i,sc_logic(0));
                            }
                        }
                        for(i=0;i<LINK_WIDTH;i++)
                        {
                            if(curr_running_disp->get_CRD(i).to_bool())
                            {
                                iter = map_table->spec_symbol_map.find(K23_7);
                                ts2_set_const[i].range(10,19) = iter->second; // Neutral disparity
                                iter = map_table->spec_symbol_map.find(K23_7);
                                ts2_set_const[i].range(20,29) = iter->second; // Neutral
                                ts2_set_const[i].range(30,39) = 0x15a; // Neutral
                                iter = map_table->data_encode_map.find(D2_0);
                                ts2_set_const[i].range(40,49) = iter->second; // Neutral
                                iter = map_table->data_encode_map.find(D0_0);
                                ts2_set_const[i].range(50,59) = iter->second; // Neutral
                            }
                            else if(!curr_running_disp->get_CRD(i).to_bool())
                            {
                                iter = map_table->spec_symbol_map.find(K23_7);
                                ts2_set_const[i].range(10,19) = ~(iter->second); // Neutral disparity
                                iter = map_table->spec_symbol_map.find(K23_7);
                                ts2_set_const[i].range(20,29) = ~(iter->second); // Neutral
                                ts2_set_const[i].range(30,39) = TS2_DELIM; // Neutral
                                iter = map_table->neg_data_encode_map.find(D2_0);
                                ts2_set_const[i].range(40,49) = (iter->second); // Neutral
                                iter = map_table->neg_data_encode_map.find(D0_0);
                                ts2_set_const[i].range(50,59) = (iter->second); // Neutral
                            }
                        }
                    }

                    /// Go ahead with the transmission of POLLING_CONFIG patterns
                    if(ts1_pattern_bit == 0 && ts2_pattern_bit == 0)
                    {
                        for(i=0;i<LINK_WIDTH;i++) // First Pattern will yield positive disparity
                        {
                            if(LINK_WIDTH == 1)
                                out_reg = (ts2_set_const[i].range(ts2_failover_pattern_bit,ts2_failover_pattern_bit));
                            else
                                out_reg = (ts2_set_const[i].range(ts2_failover_pattern_bit,ts2_failover_pattern_bit),out_reg.range(LINK_WIDTH-1,1));
                            out_reg_bar = ~out_reg;
                        }
                        if(ts2_failover_pattern_bit == 0) // COM
                        {
                            scrambler_i->scramble_descramble_all(K28_5,1,1);
                        }
                        else if((ts2_failover_pattern_bit % 10) == 0)
                        {
                            for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                            {
                                scrambler_i->start_scramble_reg[lane_scram] = true;
                                scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                            }
                        }
                        ts2_failover_pattern_bit += 1;
                        ts2_failover_pattern_bit %= 160;
                        if(ts2_failover_pattern_bit == 0) // TS1 pattern transmitted
                        {
                            transmit_failover_ts2_count--;
                            transmitted_ts2_pattern += 1;
                        }
                    }
                    else // Complete the previous transaction of TS1 OS
                    {
                        for(i=0;i<LINK_WIDTH;i++)
                        {
                            if(LINK_WIDTH == 1)
                                out_reg = (ts1_set_const[i].range(ts1_pattern_bit,ts1_pattern_bit));
                            else
                                out_reg = (ts1_set_const[i].range(ts1_pattern_bit,ts1_pattern_bit),out_reg.range(LINK_WIDTH-1,1));
                            out_reg_bar = ~out_reg;
                        }
                        if(ts1_pattern_bit == 0)
                            scrambler_i->scramble_descramble_all(K28_5,1,1);
                        else if((ts1_pattern_bit % 10) == 0)
                        {
                            for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                            {
                                scrambler_i->start_scramble_reg[lane_scram] = true;
                                scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                            }
                        }
                        ts1_pattern_bit++;
                        ts1_pattern_bit %= 160;
                    }

                }
                prev_init_state = POLLING_CONFIG;
            }
            if (((received_1xts1_sets || received_1xts2_sets || enter_drain_state)  && init_state == POLLING_ACTIVE)) { // Transmit buffers for POLLING_ACTIVE
                transmit_failover_ts2_count = 300;
                if(enter_drain_state)
                {
                    out_reg = 0x00;
                    out_reg_bar = ~out_reg;
                }
                if(transmit_ts1_count != 0)
                {
                    if(ts1_pattern_bit == 0 && elec_idle_pattern_bit == 0 && ts1_non_pad_lane_bit == 0 && symbol_num == 0) // Additional checks for Recovery_RcvrLock
                    {
                        for(i=0;i<LINK_WIDTH;i++)
                        {
                            if(curr_running_disp->get_CRD(i).to_bool())
                            {
                                iter = map_table->spec_symbol_map.find(K28_5);
                                ts1_set_const[i].range(0,9) = iter->second;
                                set_delim_value(TS1_SET_CONST,i);
                            }
                            else if(!curr_running_disp->get_CRD(i).to_bool())
                            {
                                iter = map_table->spec_symbol_map.find(K28_5);
                                ts1_set_const[i].range(0,9) = ~(iter->second);
                                set_delim_value(TS1_SET_CONST,i);
                            }
                            if(curr_running_disp->calculate_disparity(ts1_set_const[i].range(0,9),0) == 1)
                            {
                                curr_running_disp->set_CRD(i,sc_logic(1));
                            }
                            else if(curr_running_disp->calculate_disparity(ts1_set_const[i].range(0,9),0) == 0)
                            {
                                curr_running_disp->set_CRD(i,sc_logic(0));
                            }
                        }
                        for(i=0;i<LINK_WIDTH;i++)
                        {
                            if(curr_running_disp->get_CRD(i).to_bool())
                            {
                                iter = map_table->spec_symbol_map.find(K23_7);
                                ts1_set_const[i].range(10,19) = iter->second; // Neutral disparity
                                iter = map_table->spec_symbol_map.find(K23_7);
                                ts1_set_const[i].range(20,29) = iter->second; // Neutral
                                ts1_set_const[i].range(30,39) = 0x15a; // Neutral
                                iter = map_table->data_encode_map.find(D2_0);
                                ts1_set_const[i].range(40,49) = iter->second; // Neutral
                                iter = map_table->data_encode_map.find(D0_0);
                                ts1_set_const[i].range(50,59) = iter->second; // Neutral
                            }
                            else if(!curr_running_disp->get_CRD(i).to_bool())
                            {
                                iter = map_table->spec_symbol_map.find(K23_7);
                                ts1_set_const[i].range(10,19) = ~(iter->second); // Neutral disparity
                                iter = map_table->spec_symbol_map.find(K23_7);
                                ts1_set_const[i].range(20,29) = ~(iter->second); // Neutral
                                ts1_set_const[i].range(30,39) = TS2_DELIM; // Neutral
                                iter = map_table->neg_data_encode_map.find(D2_0);
                                ts1_set_const[i].range(40,49) = (iter->second); // Neutral
                                iter = map_table->neg_data_encode_map.find(D0_0);
                                ts1_set_const[i].range(50,59) = (iter->second); // Neutral
                            }
                        }
                    }

                    /// Go ahead with the transmission of the POLLING_ACTIVE patterns
                    if(elec_idle_pattern_bit == 0 && ts1_non_pad_lane_bit == 0 && symbol_num == 0)
                    {

                        for(i=0;i<LINK_WIDTH;i++) // First Pattern will yield positive disparity. Resync the frame boundary here
                        {
                            if(LINK_WIDTH == 1)
                                out_reg = (ts1_set_const[i].range(ts1_pattern_bit,ts1_pattern_bit));
                            else
                                out_reg = (ts1_set_const[i].range(ts1_pattern_bit,ts1_pattern_bit),out_reg.range(LINK_WIDTH-1,1));
                            out_reg_bar = ~out_reg;
                        }
                        if(ts1_pattern_bit == 0) // COM
                        {
                            scrambler_i->scramble_descramble_all(K28_5,1,1);
                        }
                        else if((ts1_pattern_bit % 10) == 0)
                        {
                            for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                            {
                                scrambler_i->start_scramble_reg[lane_scram] = true;
                                scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                            }
                        }
                        ts1_pattern_bit += 1;
                        ts1_pattern_bit %= 160;
                        if(ts1_pattern_bit == 0) // TS1 pattern transmitted
                        {
                            transmit_ts1_count--;
                            transmitted_ts1_pattern += 1;
                            if(transmit_ts1_count == 0)
                            {
                                transmitted_1024xts1_2sets = 1;
                                transmit_ts1_count+= 17;
                            }
                        }
                    }

                    /// Complete previous patterns if any
                    else if(ts1_non_pad_lane_bit == 0 && elec_idle_pattern_bit != 0)
                    {
                        for(i=0;i<LINK_WIDTH;i++)
                        {
                            if(LINK_WIDTH == 1)
                                out_reg = (elec_idle_set[i].range(elec_idle_pattern_bit,elec_idle_pattern_bit));
                            else
                                out_reg = (elec_idle_set[i].range(elec_idle_pattern_bit,elec_idle_pattern_bit),out_reg.range(LINK_WIDTH-1,1));
                            out_reg_bar = ~out_reg;
                        }
                        if(elec_idle_pattern_bit == 0)
                            scrambler_i->scramble_descramble_all(K28_5,1,1);
                        else if((elec_idle_pattern_bit % 10) == 0)
                        {
                            for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                            {
                                scrambler_i->start_scramble_reg[lane_scram] = true;
                                scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                            }
                        }
                        elec_idle_pattern_bit++;
                        elec_idle_pattern_bit %= 40;
                    }

                    /// Complete previous patterns (if any) for TS2 OS with non PAD link and lane #
                    else if(symbol_num != 0)
                    {
                        for(i=0;i<LINK_WIDTH;i++)
                        {
                            if(LINK_WIDTH == 1)
                                out_reg = (ts2_link_lane_non_PAD[i].range(symbol_num,symbol_num));
                            else
                                out_reg = (ts2_link_lane_non_PAD[i].range(symbol_num,symbol_num),out_reg.range(LINK_WIDTH-1,1));
                            out_reg_bar = ~out_reg;
                        }
                        if(symbol_num == 0)
                        {
                            scrambler_i->scramble_descramble_all(K28_5,1,1);
                        }
                        else if((symbol_num % 10) == 0)
                        {
                            for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                            {
                                scrambler_i->start_scramble_reg[lane_scram] = true;
                                scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                            }
                        }

                        symbol_num++;
                        symbol_num %= 160;
                        if(symbol_num == 0)
                        {
                            if(transmit_ts2_count > 0) transmit_ts2_count--;
                            transmitted_ts2_pattern += 1;

                            if(transmit_ts2_count == 0)
                                transmitted_16xts2_sets = 1;
                        }
                    }
                    else
                    {
                        for(i=0;i<LINK_WIDTH;i++)
                        {
                            if(LINK_WIDTH == 1)
                                out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_lane_bit,ts1_non_pad_lane_bit));
                            else
                                out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_lane_bit,ts1_non_pad_lane_bit),out_reg.range(LINK_WIDTH-1,1));
                            out_reg_bar = ~out_reg;
                        }
                        if(ts1_non_pad_lane_bit == 0)
                            scrambler_i->scramble_descramble_all(K28_5,1,1);
                        else if((ts1_non_pad_lane_bit %10) == 0)
                        {
                            for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                            {
                                scrambler_i->start_scramble_reg[lane_scram] = true;
                                scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                            }
                        }

                        ts1_non_pad_lane_bit += 1;
                        ts1_non_pad_lane_bit %= 160;
                    }
                }
                else
                {
                    transmitted_1024xts1_2sets = 1;
                    received_8xts1_sets = 0;
                }
                prev_init_state = POLLING_ACTIVE;
            }

            /// POLLING_ACTIVE, but not yet received any ts2 OS
            else if(!received_1xts2_sets && !received_1xts1_sets && init_state == POLLING_ACTIVE) // Complete the transaction from Recovery?
            {
                if(ts1_non_pad_lane_bit != 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_lane_bit,ts1_non_pad_lane_bit));
                        else
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_lane_bit,ts1_non_pad_lane_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_non_pad_lane_bit == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_non_pad_lane_bit %10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }

                    ts1_non_pad_lane_bit += 1;
                    ts1_non_pad_lane_bit %= 160;
                }
                else if(symbol_num != 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts2_link_lane_non_PAD[i].range(symbol_num,symbol_num));
                        else
                            out_reg = (ts2_link_lane_non_PAD[i].range(symbol_num,symbol_num),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(symbol_num == 0)
                    {

                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    }
                    else if((symbol_num % 10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }

                    symbol_num++;
                    symbol_num %= 160;
                    if(symbol_num == 0)
                    {
                        if(transmit_ts2_count > 0) transmit_ts2_count--;
                        transmitted_ts2_pattern += 1;

                        if(transmit_ts2_count == 0)
                            transmitted_16xts2_sets = 1;
                    }
                }
            }

            /// init_state = CFG_LINKWIDTH_START
            if(init_state == CFG_LINKWIDTH_START) // Just keep sending TS1 patterns with link_num ~= PAD. Disparity is forced to be positive. name is enough
            {
                // Calculate CRD for link_num_non_PAD
                if(ts1_non_pad_link_bit == 0 && ts2_pattern_bit == 0 && ts1_non_pad_lane_bit == 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K28_5);
                            ts1_link_num_non_PAD[i].range(0,9) = iter->second;
                            set_delim_value(TS1_LINK_NUM_NON_PAD,i);

                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K28_5);
                            ts1_link_num_non_PAD[i].range(0,9) = ~(iter->second);
                            set_delim_value(TS1_LINK_NUM_NON_PAD,i);
                        }
                        // Does the entire frame of COM symbols have a single disparity value?
                        if(curr_running_disp->calculate_disparity(ts1_link_num_non_PAD[i].range(0,9),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(ts1_link_num_non_PAD[i].range(0,9),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }
                    }

                    // Calculate disparity for link #
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->data_encode_map.find(D0_0);
                            ts1_link_num_non_PAD[i].range(10,19) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->neg_data_encode_map.find(D0_0);
                            ts1_link_num_non_PAD[i].range(10,19) = (iter->second); // Neutral disparity
                        }
                        if(curr_running_disp->calculate_disparity(ts1_link_num_non_PAD[i].range(10,19),0) == 0)
                        {
                            // Could be equal number of 1s and 0s
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }
                        else if(curr_running_disp->calculate_disparity(ts1_link_num_non_PAD[i].range(10,19),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                    }

                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K23_7);
                            ts1_link_num_non_PAD[i].range(20,29) = iter->second;
                            ts1_link_num_non_PAD[i].range(30,39) = 0x15a;
                            iter = map_table->data_encode_map.find(D2_0);
                            ts1_link_num_non_PAD[i].range(40,49) = iter->second;
                            if(link_ctl_csr.range(4,4) == 0x0)
                                iter = map_table->data_encode_map.find(D0_0);
                            else
                                iter = map_table->data_encode_map.find(D2_0);
                            ts1_link_num_non_PAD[i].range(50,59) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K23_7);
                            ts1_link_num_non_PAD[i].range(20,29) = ~(iter->second); // Neutral
                            ts1_link_num_non_PAD[i].range(30,39) = TS2_DELIM; // Neutral
                            iter = map_table->neg_data_encode_map.find(D2_0);
                            ts1_link_num_non_PAD[i].range(40,49) = (iter->second); // Neutral
                            if(link_ctl_csr.range(4,4) == 0x0)
                                iter = map_table->neg_data_encode_map.find(D0_0);
                            else
                                iter = map_table->neg_data_encode_map.find(D2_0);
                            ts1_link_num_non_PAD[i].range(50,59) = (iter->second); // Neutral
                        }
                    }
                }

                /// Go ahead with the transmission of current state patterns
                if(ts2_pattern_bit == 0 && ts1_non_pad_lane_bit == 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_link_num_non_PAD[i].range(ts1_non_pad_link_bit,ts1_non_pad_link_bit));
                        else
                            out_reg = (ts1_link_num_non_PAD[i].range(ts1_non_pad_link_bit,ts1_non_pad_link_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_non_pad_link_bit == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_non_pad_link_bit % 10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }

                    ts1_non_pad_link_bit += 1;
                    ts1_non_pad_link_bit %= 160;
                }

                /// Complete previous patterns if any
                else if(ts2_pattern_bit == 0 && ts1_non_pad_lane_bit != 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_lane_bit,ts1_non_pad_lane_bit));
                        else
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_lane_bit,ts1_non_pad_lane_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_non_pad_lane_bit == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_non_pad_lane_bit %10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }
                    ts1_non_pad_lane_bit += 1;
                    ts1_non_pad_lane_bit %= 160;
                }
                else
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts2_set_const[i].range(ts2_pattern_bit,ts2_pattern_bit));
                        else
                            out_reg = (ts2_set_const[i].range(ts2_pattern_bit,ts2_pattern_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts2_pattern_bit == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts2_pattern_bit % 10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }
                    ts2_pattern_bit += 1;
                    ts2_pattern_bit %= 160;
                }
            }

            /// init_state = CFG_LINKWIDTH_ACCEPT
            if(init_state == CFG_LINKWIDTH_ACCEPT) // Transmit buffer for CFG_LINKWIDTH_ACCEPT
            {
                // Calculate CRD for link_num_non_PAD
                if(ts1_non_pad_link_lane == 0 && ts1_non_pad_link_bit == 0 && ts1_non_pad_lane_bit == 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K28_5);
                            ts1_link_lane_non_PAD[i].range(0,9) = iter->second;
                            set_delim_value(TS1_LINK_LANE_NON_PAD,i);
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K28_5);
                            ts1_link_lane_non_PAD[i].range(0,9) = ~(iter->second);
                            set_delim_value(TS1_LINK_LANE_NON_PAD,i);
                        }
                        if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(0,9),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(0,9),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }
                    }

                    // Calculate disparity for link #
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->data_encode_map.find(D0_0);
                            ts1_link_lane_non_PAD[i].range(10,19) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->neg_data_encode_map.find(D0_0);
                            ts1_link_lane_non_PAD[i].range(10,19) = (iter->second); // Neutral disparity
                        }
                        if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(10,19),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(10,19),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }
                    }

                    // Calculate Disparity for lane #
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->data_encode_map.find(i);
                            ts1_link_lane_non_PAD[i].range(20,29) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->neg_data_encode_map.find(i);
                            ts1_link_lane_non_PAD[i].range(20,29) = (iter->second);
                        }
                        if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(20,29),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(20,29),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }
                    }

                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            ts1_link_lane_non_PAD[i].range(30,39) = 0x15a;
                            iter = map_table->data_encode_map.find(D2_0);
                            ts1_link_lane_non_PAD[i].range(40,49) = iter->second;
                            iter = map_table->data_encode_map.find(D0_0);
                            ts1_link_lane_non_PAD[i].range(50,59) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            ts1_link_lane_non_PAD[i].range(30,39) = 0x15a; // Neutral
                            iter = map_table->neg_data_encode_map.find(D2_0);
                            ts1_link_lane_non_PAD[i].range(40,49) = (iter->second); // Neutral
                            iter = map_table->neg_data_encode_map.find(D0_0);
                            ts1_link_lane_non_PAD[i].range(50,59) = (iter->second); // Neutral
                        }
                    }
                }

                /// Go ahead with the transmission of the current state patterns
                if(ts1_non_pad_link_bit == 0 && ts1_non_pad_lane_bit == 0) // Previous transmission must have completed
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_link_lane,ts1_non_pad_link_lane));
                        else
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_link_lane,ts1_non_pad_link_lane),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_non_pad_link_lane == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_non_pad_link_lane % 10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }

                    ts1_non_pad_link_lane += 1;
                    ts1_non_pad_link_lane %= 160;
                }
                else if(ts1_non_pad_lane_bit != 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_lane_bit,ts1_non_pad_lane_bit));
                        else
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_lane_bit,ts1_non_pad_lane_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_non_pad_lane_bit == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_non_pad_lane_bit %10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }

                    ts1_non_pad_lane_bit += 1;
                    ts1_non_pad_lane_bit %= 160;
                }
                else// Finish off the previous transmission
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_link_num_non_PAD[i].range(ts1_non_pad_link_bit,ts1_non_pad_link_bit));
                        else
                            out_reg = (ts1_link_num_non_PAD[i].range(ts1_non_pad_link_bit,ts1_non_pad_link_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_non_pad_link_bit == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_non_pad_link_bit % 10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }
                    ts1_non_pad_link_bit++;
                    ts1_non_pad_link_bit %= 160;
                }
            }

            if(init_state == Recovery_RcvrLock) // Recovery RcvrLock
            {
                if(ts1_non_pad_lane_bit == 0 && start_reinit.read())
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K28_5);
                            ts1_link_lane_non_PAD[i].range(0,9) = iter->second;
                            set_delim_value(TS1_LINK_LANE_NON_PAD,i);
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->neg_spec_symbol_map.find(K28_5);
                            ts1_link_lane_non_PAD[i].range(0,9) = (iter->second);
                            set_delim_value(TS1_LINK_LANE_NON_PAD,i);
                        }
                        if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(0,9),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(0,9),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }
                    }

                    // Calculate disparity for link #
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->data_encode_map.find(D0_0);
                            ts1_link_lane_non_PAD[i].range(10,19) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->neg_data_encode_map.find(D0_0);
                            ts1_link_lane_non_PAD[i].range(10,19) = (iter->second); // Neutral disparity
                        }
                        if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(10,19),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(10,19),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }
                    }

                    // Calculate Disparity for lane #
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->data_encode_map.find(i);
                            ts1_link_lane_non_PAD[i].range(20,29) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->neg_data_encode_map.find(i);
                            ts1_link_lane_non_PAD[i].range(20,29) = (iter->second);
                        }
                        if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(20,29),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(20,29),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }
                    }

                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            ts1_link_lane_non_PAD[i].range(30,39) = 0x15a;
                            iter = map_table->data_encode_map.find(D2_0);
                            ts1_link_lane_non_PAD[i].range(40,49) = iter->second;
                            iter = map_table->data_encode_map.find(D0_0);
                            ts1_link_lane_non_PAD[i].range(50,59) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            ts1_link_lane_non_PAD[i].range(30,39) = TS2_DELIM; // Neutral
                            iter = map_table->neg_data_encode_map.find(D2_0);
                            ts1_link_lane_non_PAD[i].range(40,49) = (iter->second); // Neutral
                            iter = map_table->neg_data_encode_map.find(D0_0);
                            ts1_link_lane_non_PAD[i].range(50,59) = (iter->second); // Neutral
                        }
                    }
                }

                /// pl_top instructing LTSSM that it is ready to transfer control to it. Thus, start transmitting recovery training patterns
                if(start_reinit.read())
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_lane_bit,ts1_non_pad_lane_bit));
                        else
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_lane_bit,ts1_non_pad_lane_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_non_pad_lane_bit == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_non_pad_lane_bit %10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }

                    ts1_non_pad_lane_bit += 1;
                    ts1_non_pad_lane_bit %= 160;
                }
            }

            if(init_state == CFG_LANENUM_WAIT) //Send the different Lane numbers received
            {
                if(ts1_non_pad_diff_lane_bit == 0 && ts1_non_pad_lane_bit == 0 && ts1_non_pad_link_lane == 0 && ts1_non_pad_link_bit == 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K28_5);
                            ts1_link_lane_non_PAD[i].range(0,9) = iter->second;
                            set_delim_value(TS1_LINK_LANE_NON_PAD,i);
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K28_5);
                            ts1_link_lane_non_PAD[i].range(0,9) = ~(iter->second);
                            set_delim_value(TS1_LINK_LANE_NON_PAD,i);
                        }
                        if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(0,9),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(0,9),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }
                    }
                    // Calculate disparity for link #
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->data_encode_map.find(D0_0);
                            ts1_link_lane_non_PAD[i].range(10,19) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->neg_data_encode_map.find(D0_0);
                            ts1_link_lane_non_PAD[i].range(10,19) = (iter->second); // Neutral disparity
                        }
                        if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(10,19),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(10,19),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }
                    }
                    // Calculate Disparity for lane #
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        iter1 = map_table->data_decode_map.find(ts1_lane_diff_non_PAD[i].to_uint());
                        iter2 = map_table->neg_data_decode_map.find(ts1_lane_diff_non_PAD[i].to_uint());
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->data_encode_map.find(i);

                            ts1_link_lane_non_PAD[i].range(20,29) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->neg_data_encode_map.find(i);

                            ts1_link_lane_non_PAD[i].range(20,29) = (iter->second);
                        }
                        if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(20,29),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(20,29),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }
                    }

                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            ts1_link_lane_non_PAD[i].range(30,39) = 0x15a;
                            iter = map_table->data_encode_map.find(D2_0);
                            ts1_link_lane_non_PAD[i].range(40,49) = iter->second;
                            iter = map_table->data_encode_map.find(D0_0);
                            ts1_link_lane_non_PAD[i].range(50,59) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            ts1_link_lane_non_PAD[i].range(30,39) = TS2_DELIM; // Neutral
                            iter = map_table->neg_data_encode_map.find(D2_0);
                            ts1_link_lane_non_PAD[i].range(40,49) = (iter->second); // Neutral
                            iter = map_table->neg_data_encode_map.find(D0_0);
                            ts1_link_lane_non_PAD[i].range(50,59) = (iter->second); // Neutral
                        }
                    }
                }

                /// Go ahead with the transmission of current state patterns
                if(ts1_non_pad_lane_bit == 0 && ts1_non_pad_link_lane == 0 && ts1_non_pad_link_bit == 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_diff_lane_bit,ts1_non_pad_diff_lane_bit));
                        else
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_diff_lane_bit,ts1_non_pad_diff_lane_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_non_pad_diff_lane_bit == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_non_pad_diff_lane_bit %10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }

                    ts1_non_pad_diff_lane_bit += 1;
                    ts1_non_pad_diff_lane_bit %= 160;
                }

                /// Complete previous transmissions
                else if(ts1_non_pad_lane_bit == 0 && ts1_non_pad_link_bit == 0 && ts1_non_pad_link_lane != 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_link_lane,ts1_non_pad_link_lane));
                        else
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_link_lane,ts1_non_pad_link_lane),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_non_pad_link_lane == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_non_pad_link_lane %10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }

                    ts1_non_pad_link_lane += 1;
                    ts1_non_pad_link_lane %= 160;
                }

                /// Complete previous transmissions
                else if(ts1_non_pad_lane_bit != 0 && ts1_non_pad_link_lane == 0 && ts1_non_pad_link_bit == 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_lane_bit,ts1_non_pad_lane_bit));
                        else
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_lane_bit,ts1_non_pad_lane_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_non_pad_lane_bit == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_non_pad_lane_bit %10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }

                    ts1_non_pad_lane_bit += 1;
                    ts1_non_pad_lane_bit %= 160;
                }
                else if(ts1_non_pad_lane_bit == 0 && ts1_non_pad_link_lane == 0 && ts1_non_pad_link_bit != 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_link_num_non_PAD[i].range(ts1_non_pad_link_bit,ts1_non_pad_link_bit));
                        else
                            out_reg = (ts1_link_num_non_PAD[i].range(ts1_non_pad_link_bit,ts1_non_pad_link_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;

                    }
                    if(ts1_non_pad_link_bit == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_non_pad_link_bit % 10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }

                    ts1_non_pad_link_bit++;
                    ts1_non_pad_link_bit %= 160;
                }
            }

            /// init_state = HOT_RESET. HOT_RESET0 is the transient state when the state machine has not yet transferred form
            /// Recovery_Idle to HOT_RESET
            if(init_state == HOT_RESET0 || init_state == HOT_RESET)
            {
                if(symbol_num == 0 && idle_pattern_bit == 0 && ts1_non_pad_lane_bit == 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K28_5);
                            ts1_link_lane_non_PAD[i].range(0,9) = iter->second;
                            set_delim_value(TS1_LINK_LANE_NON_PAD,i);
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K28_5);
                            ts1_link_lane_non_PAD[i].range(0,9) = ~(iter->second);
                            set_delim_value(TS1_LINK_LANE_NON_PAD,i);
                        }
                        if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(0,9),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(0,9),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }
                    }

                    // Calculate disparity for link #
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->data_encode_map.find(D0_0);
                            ts1_link_lane_non_PAD[i].range(10,19) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->neg_data_encode_map.find(D0_0);
                            ts1_link_lane_non_PAD[i].range(10,19) = (iter->second); // Neutral disparity
                        }
                        if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(10,19),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(10,19),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }
                    }

                    // Calculate Disparity for lane #
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->data_encode_map.find(i);
                            ts1_link_lane_non_PAD[i].range(20,29) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->neg_data_encode_map.find(i);
                            ts1_link_lane_non_PAD[i].range(20,29) = (iter->second);
                        }
                        if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(20,29),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(20,29),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }
                    }

                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            ts1_link_lane_non_PAD[i].range(30,39) = 0x15a;
                            iter = map_table->data_encode_map.find(D2_0);
                            ts1_link_lane_non_PAD[i].range(40,49) = iter->second;
                            iter = map_table->data_encode_map.find(D1_0); // Set the hot reset bit. Neutral
                            ts1_link_lane_non_PAD[i].range(50,59) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            ts1_link_lane_non_PAD[i].range(30,39) = TS2_DELIM; // Neutral
                            iter = map_table->neg_data_encode_map.find(D2_0);
                            ts1_link_lane_non_PAD[i].range(40,49) = (iter->second); // Neutral
                            iter = map_table->neg_data_encode_map.find(D1_0); // Set the hot reset bit. Neutral
                            ts1_link_lane_non_PAD[i].range(50,59) = (iter->second); // Neutral
                        }
                    }
                }

                /// Go ahead with the current state pattern transmission
                if(symbol_num == 0 && idle_pattern_bit == 0) // Send TS1 with hot reset
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_lane_bit,ts1_non_pad_lane_bit));
                        else
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_lane_bit,ts1_non_pad_lane_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_non_pad_lane_bit == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_non_pad_lane_bit %10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }

                    ts1_non_pad_lane_bit += 1;
                    ts1_non_pad_lane_bit %= 160;
                }

                /// Complete the previous transmissions if any
                else if(idle_pattern_bit != 0) // Finish the remaining Recovery_Idle patterns
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (idle_set_const[i].range(idle_pattern_bit,idle_pattern_bit));
                        else
                            out_reg = (idle_set_const[i].range(idle_pattern_bit,idle_pattern_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    idle_pattern_bit += 1;
                    idle_pattern_bit %= 10;
                }


                /// Complete the previous transmissions if any
                else if(symbol_num != 0) // Finish the remaining Recovery_RcvrCfg
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts2_link_lane_non_PAD[i].range(symbol_num,symbol_num));
                        else
                            out_reg = (ts2_link_lane_non_PAD[i].range(symbol_num,symbol_num),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(symbol_num == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((symbol_num % 10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }

                    symbol_num++;
                    symbol_num %= 160;
                }
            }

            /// init_state = CFG_LANENUM_ACCEPT
            if(init_state == CFG_LANENUM_ACCEPT) 
            {
                // Calculate CRD for link_num_non_PAD
                if(ts1_non_pad_lane_bit == 0 && ts1_non_pad_link_lane == 0 && ts1_non_pad_diff_lane_bit == 0 && ts1_non_pad_link_bit == 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K28_5);
                            ts1_link_lane_non_PAD[i].range(0,9) = iter->second;
                            set_delim_value(TS1_LINK_LANE_NON_PAD,i);
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K28_5);
                            ts1_link_lane_non_PAD[i].range(0,9) = ~(iter->second);
                            set_delim_value(TS1_LINK_LANE_NON_PAD,i);
                        }
                        if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(0,9),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(0,9),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }
                    }

                    // Calculate disparity for link #
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->data_encode_map.find(D0_0);
                            ts1_link_lane_non_PAD[i].range(10,19) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->neg_data_encode_map.find(D0_0);
                            ts1_link_lane_non_PAD[i].range(10,19) = (iter->second); // Neutral disparity
                        }
                        if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(10,19),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(10,19),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }
                    }

                    // Calculate Disparity for lane #
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        iter1 = map_table->data_decode_map.find(ts1_lane_diff_non_PAD[i].to_uint());
                        iter2 = map_table->neg_data_decode_map.find(ts1_lane_diff_non_PAD[i].to_uint());
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            if(iter1 != map_table->data_decode_map.end())
                                ts1_lane_diff_non_PAD[i].range(7,0) = iter1->second;
                            else
                                ts1_lane_diff_non_PAD[i].range(7,0) = iter2->second;

                            if(from_cfg_lanenum_wait)
                            {
                                iter = map_table->data_encode_map.find(i);
                            }
                            else
                                iter = map_table->data_encode_map.find(i);
                            ts1_link_lane_non_PAD[i].range(20,29) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            if(from_cfg_lanenum_wait)
                            {
                                iter = map_table->neg_data_encode_map.find(i);
                            }
                            else
                                iter = map_table->neg_data_encode_map.find(i);
                            ts1_link_lane_non_PAD[i].range(20,29) = (iter->second);
                        }
                        if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(20,29),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(ts1_link_lane_non_PAD[i].range(20,29),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }
                    }

                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            ts1_link_lane_non_PAD[i].range(30,39) = 0x15a;
                            iter = map_table->data_encode_map.find(D2_0);
                            ts1_link_lane_non_PAD[i].range(40,49) = iter->second;
                            iter = map_table->data_encode_map.find(D0_0);
                            ts1_link_lane_non_PAD[i].range(50,59) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            ts1_link_lane_non_PAD[i].range(30,39) = TS2_DELIM; // Neutral
                            iter = map_table->neg_data_encode_map.find(D2_0);
                            ts1_link_lane_non_PAD[i].range(40,49) = (iter->second); // Neutral
                            iter = map_table->neg_data_encode_map.find(D0_0);
                            ts1_link_lane_non_PAD[i].range(50,59) = (iter->second); // Neutral
                        }
                    }
                }

                /// Go ahead with the current state transmissions
                if(ts1_non_pad_link_lane == 0 && ts1_non_pad_diff_lane_bit == 0 && ts1_non_pad_link_bit == 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_lane_bit,ts1_non_pad_lane_bit));
                        else
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_lane_bit,ts1_non_pad_lane_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_non_pad_lane_bit == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_non_pad_lane_bit %10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }

                    ts1_non_pad_lane_bit += 1;
                    ts1_non_pad_lane_bit %= 160;
                }

                /// Complete previous transmissions
                else if(ts1_non_pad_link_lane != 0)
                {
                    // Complete the previous patterns
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_link_lane,ts1_non_pad_link_lane));
                        else
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_link_lane,ts1_non_pad_link_lane),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_non_pad_link_lane == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_non_pad_link_lane %10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }
                    ts1_non_pad_link_lane++;
                    ts1_non_pad_link_lane %= 160;
                }

                /// Complete previous transmissions
                else if(ts1_non_pad_diff_lane_bit != 0)
                {
                    // Complete the previous patterns
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_diff_lane_bit,ts1_non_pad_diff_lane_bit));
                        else
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_diff_lane_bit,ts1_non_pad_diff_lane_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_non_pad_diff_lane_bit == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_non_pad_diff_lane_bit %10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }
                    ts1_non_pad_diff_lane_bit++;
                    ts1_non_pad_diff_lane_bit %= 160;
                }
                else if(ts1_non_pad_link_bit != 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_link_num_non_PAD[i].range(ts1_non_pad_link_bit,ts1_non_pad_link_bit));
                        else
                            out_reg = (ts1_link_num_non_PAD[i].range(ts1_non_pad_link_bit,ts1_non_pad_link_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_non_pad_link_bit == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_non_pad_link_bit % 10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }

                    ts1_non_pad_link_bit++;
                    ts1_non_pad_link_bit %= 160;
                }
            }

            /// init_state = Recovery Receiver Config
            if((received_1xts2_sets || received_1xts1_sets) && init_state == Recovery_RcvrCfg)
            {
                if(symbol_num == 0 && ts1_non_pad_lane_bit == 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K28_5);
                            ts2_link_lane_non_PAD[i].range(0,9) = iter->second;
                            set_delim_value(TS2_LINK_LANE_NON_PAD,i);
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->neg_spec_symbol_map.find(K28_5);
                            ts2_link_lane_non_PAD[i].range(0,9) = (iter->second);
                            set_delim_value(TS2_LINK_LANE_NON_PAD,i);
                        }
                        if(curr_running_disp->calculate_disparity(ts2_link_lane_non_PAD[i].range(0,9),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(ts2_link_lane_non_PAD[i].range(0,9),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }
                    }

                    // Calculate disparity for link #
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->data_encode_map.find(D0_0);
                            ts2_link_lane_non_PAD[i].range(10,19) = iter->second; 
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->neg_data_encode_map.find(D0_0);
                            ts2_link_lane_non_PAD[i].range(10,19) = (iter->second); // Neutral disparity
                        }
                        if(curr_running_disp->calculate_disparity(ts2_link_lane_non_PAD[i].range(10,19),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(ts2_link_lane_non_PAD[i].range(10,19),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }
                    }

                    // Calculate Disparity for lane #
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->data_encode_map.find(i);
                            ts2_link_lane_non_PAD[i].range(20,29) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->neg_data_encode_map.find(i);
                            ts2_link_lane_non_PAD[i].range(20,29) = (iter->second);
                        }
                        if(curr_running_disp->calculate_disparity(ts2_link_lane_non_PAD[i].range(20,29),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(ts2_link_lane_non_PAD[i].range(20,29),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }
                    }

                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            ts2_link_lane_non_PAD[i].range(30,39) = 0x15a;
                            iter = map_table->data_encode_map.find(D2_0);
                            ts2_link_lane_non_PAD[i].range(40,49) = iter->second;
                            iter = map_table->data_encode_map.find(D0_0);
                            ts2_link_lane_non_PAD[i].range(50,59) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            ts2_link_lane_non_PAD[i].range(30,39) = 0x15a; // Neutral
                            iter = map_table->neg_data_encode_map.find(D2_0);
                            ts2_link_lane_non_PAD[i].range(40,49) = (iter->second); // Neutral
                            iter = map_table->neg_data_encode_map.find(D0_0);
                            ts2_link_lane_non_PAD[i].range(50,59) = (iter->second); // Neutral
                        }
                    }
                }
                if(ts1_non_pad_lane_bit == 0) // Previous patterns completed
                {
                    if(transmit_ts2_count == 0)
                        transmit_ts2_count = 17;
                    if(transmit_ts2_count != 0)
                    {
                        for(i=0;i<LINK_WIDTH;i++)
                        {
                            if(LINK_WIDTH == 1)
                                out_reg = (ts2_link_lane_non_PAD[i].range(symbol_num,symbol_num));
                            else
                                out_reg = (ts2_link_lane_non_PAD[i].range(symbol_num,symbol_num),out_reg.range(LINK_WIDTH-1,1));
                            out_reg_bar = ~out_reg;
                        }
                        if(symbol_num == 0)
                        {
                            scrambler_i->scramble_descramble_all(K28_5,1,1);
                        }
                        else if((symbol_num % 10) == 0)
                        {
                            for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                            {
                                scrambler_i->start_scramble_reg[lane_scram] = true;
                                scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                            }
                        }

                        symbol_num++;
                        symbol_num %= 160;
                        if(symbol_num == 0)
                        {
                            transmit_ts2_count--;
                            transmitted_ts2_pattern += 1;

                            if(transmit_ts2_count == 0)
                                transmitted_16xts2_sets = 1;
                        }
                    }
                    else
                    {
                        transmitted_16xts2_sets = 1;
                        received_8xts2_sets = 0;
                    }
                }
                else // Complete the previous sequence
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_lane_bit,ts1_non_pad_lane_bit));
                        else
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_lane_bit,ts1_non_pad_lane_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_non_pad_lane_bit == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_non_pad_lane_bit % 10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }
                    ts1_non_pad_lane_bit++;
                    ts1_non_pad_lane_bit %= 160;
                }
            }

            /// CFG_COMPLETE
            if((init_state == CFG_COMPLETE) || (!received_1xidl_sets && init_state == CFG_IDLE))
            {
                // Calculate CRD for link_num_non_PAD
                if(symbol_num == 0 && ts1_non_pad_lane_bit == 0 && ts1_non_pad_link_lane == 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K28_5);
                            ts2_link_lane_non_PAD[i].range(0,9) = iter->second;
                            set_delim_value(TS2_LINK_LANE_NON_PAD,i);
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->spec_symbol_map.find(K28_5);
                            ts2_link_lane_non_PAD[i].range(0,9) = ~(iter->second);
                            set_delim_value(TS2_LINK_LANE_NON_PAD,i);
                        }
                        if(curr_running_disp->calculate_disparity(ts2_link_lane_non_PAD[i].range(0,9),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(ts2_link_lane_non_PAD[i].range(0,9),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }
                    }

                    // Calculate disparity for link #
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->data_encode_map.find(D0_0);
                            ts2_link_lane_non_PAD[i].range(10,19) = iter->second; 
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->neg_data_encode_map.find(D0_0);
                            ts2_link_lane_non_PAD[i].range(10,19) = (iter->second); // Neutral disparity
                        }
                        if(curr_running_disp->calculate_disparity(ts2_link_lane_non_PAD[i].range(10,19),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(ts2_link_lane_non_PAD[i].range(10,19),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }
                    }

                    // Calculate Disparity for lane #
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->data_encode_map.find(i);
                            ts2_link_lane_non_PAD[i].range(20,29) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            iter = map_table->neg_data_encode_map.find(i);
                            ts2_link_lane_non_PAD[i].range(20,29) = (iter->second);
                        }
                        if(curr_running_disp->calculate_disparity(ts2_link_lane_non_PAD[i].range(20,29),0) == 1)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(1));
                        }
                        else if(curr_running_disp->calculate_disparity(ts2_link_lane_non_PAD[i].range(20,29),0) == 0)
                        {
                            curr_running_disp->set_CRD(i,sc_logic(0));
                        }
                    }

                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(curr_running_disp->get_CRD(i).to_bool())
                        {
                            ts2_link_lane_non_PAD[i].range(30,39) = 0x9b;
                            iter = map_table->data_encode_map.find(D2_0);
                            ts2_link_lane_non_PAD[i].range(40,49) = iter->second;
                            iter = map_table->data_encode_map.find(D0_0);
                            ts2_link_lane_non_PAD[i].range(50,59) = iter->second;
                        }
                        else if(!curr_running_disp->get_CRD(i).to_bool())
                        {
                            ts2_link_lane_non_PAD[i].range(30,39) = 0x364; // Neutral
                            iter = map_table->neg_data_encode_map.find(D2_0);
                            ts2_link_lane_non_PAD[i].range(40,49) = (iter->second); // Neutral
                            iter = map_table->neg_data_encode_map.find(D0_0);
                            ts2_link_lane_non_PAD[i].range(50,59) = (iter->second); // Neutral
                        }
                    }
                }
                if(ts1_non_pad_lane_bit == 0 && ts1_non_pad_link_lane == 0) // Previous patterns completed
                {

                    if(transmit_ts2_count == 0 && !received_1xts2_sets)
                        transmit_ts2_count = 17;

                    if(transmit_ts2_count != 0 || (!received_1xidl_sets && init_state == CFG_IDLE))
                    {
                        for(i=0;i<LINK_WIDTH;i++)
                        {
                            if(LINK_WIDTH == 1)
                                out_reg = (ts2_link_lane_non_PAD[i].range(symbol_num,symbol_num));
                            else
                                out_reg = (ts2_link_lane_non_PAD[i].range(symbol_num,symbol_num),out_reg.range(LINK_WIDTH-1,1));
                            out_reg_bar = ~out_reg;
                        }
                        if(symbol_num == 0)
                        {
                            scrambler_i->scramble_descramble_all(K28_5,1,1);
                        }
                        else if((symbol_num % 10) == 0)
                        {
                            for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                            {
                                scrambler_i->start_scramble_reg[lane_scram] = true;
                                scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                            }
                        }

                        symbol_num++;
                        symbol_num %= 160;
                        if(symbol_num == 0)
                        {
                            transmit_ts2_count--;
                            transmitted_ts2_pattern += 1;

                            if(transmit_ts2_count == 0)
                            {
                                transmit_ts2_count += 17;
                                transmitted_16xts2_sets = 1;
                            }
                        }
                    }
                    else
                    {
                        transmitted_16xts2_sets = 1;
                        received_8xts2_sets = 0;
                    }
                }
                else if(ts1_non_pad_lane_bit != 0)// Complete the previous sequence
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_lane_bit,ts1_non_pad_lane_bit));
                        else
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_lane_bit,ts1_non_pad_lane_bit),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_non_pad_lane_bit == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_non_pad_lane_bit % 10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }
                    ts1_non_pad_lane_bit++;
                    ts1_non_pad_lane_bit %= 160;
                }
                else if(ts1_non_pad_link_lane != 0)
                {
                    for(i=0;i<LINK_WIDTH;i++)
                    {
                        if(LINK_WIDTH == 1)
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_link_lane,ts1_non_pad_link_lane));
                        else
                            out_reg = (ts1_link_lane_non_PAD[i].range(ts1_non_pad_link_lane,ts1_non_pad_link_lane),out_reg.range(LINK_WIDTH-1,1));
                        out_reg_bar = ~out_reg;
                    }
                    if(ts1_non_pad_link_lane == 0)
                        scrambler_i->scramble_descramble_all(K28_5,1,1);
                    else if((ts1_non_pad_link_lane % 10) == 0)
                    {
                        for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                        {
                            scrambler_i->start_scramble_reg[lane_scram] = true;
                            scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                        }
                    }
                    ts1_non_pad_link_lane++;
                    ts1_non_pad_link_lane %= 160;
                }
            }

            /// Initialization is complete. Assert the init_done signal
            if(write_init_done)
            {
                init_done.write(true);

                if(done_last_idle < 1 && !this_is_retraining) last_idle_frame = true;
                else last_idle_frame = false;

                if(done_last_idle_retrain < 1 && retraining)
                    last_idle_frame_retraining = true;
                else
                    last_idle_frame_retraining = false;
                wait(SC_ZERO_TIME); // This wait is very important to make sure both PL and LTSSM do not modify the disparity engine
                if(done_last_idle_retrain >= 1) retraining = false;
            }
            else
                init_done.write(false);

            if(stage_init_state && !write_init_done)
            {
                init_done.write(false);
            }

            /// For Recovery_Idle or L0 state when control is not yet fully with pl_top. This is for Retraining sequence
            if(init_state == Recovery_Idle || (init_state == L0 && !init_done.read() && retraining) || (last_idle_frame_retraining)  || (init_state == L0s && !init_done.read() && retraining))
            { // Start transmitting IDL if received IDL else normally transmit IDL patterns
                for(int lane_scram; lane_scram<LINK_WIDTH; lane_scram++)
                    scrambler_i->start_scramble_reg[lane_scram] = true;
                if(init_state == L0)
                    transmit_idl_count = 1;
                if ( transmit_idl_count != 0 || (init_state == Recovery_Idle))
                {
                    // CRD calculation
                    if(idle_pattern_bit == 0 && symbol_num == 0) // Start the scrambler only when finished transmitting previous patterns
                    {
                        scramble_pattern = scrambler_i->scramble_descramble_all(0x00,1,0); // LFSR moves forward...but scramble the rest with this same LFSR
                        for(i=0;i<LINK_WIDTH;i++)
                        {
                            if(curr_running_disp->get_CRD(i).to_bool())
                            {
                                idle_set_const[i] = scramble_pattern;
                                iter = map_table->data_encode_map.find(idle_set_const[i].to_uint());
                                idle_set_const[i].range(0,9) = iter->second;
                            }
                            else if(!curr_running_disp->get_CRD(i).to_bool())
                            {
                                idle_set_const[i] = scramble_pattern;
                                iter = map_table->neg_data_encode_map.find(idle_set_const[i].to_uint());
                                idle_set_const[i].range(0,9) = iter->second;
                            }
                            if(curr_running_disp->calculate_disparity(idle_set_const[i].range(0,9),0) == 1)
                            {
                                curr_running_disp->set_CRD(i,sc_logic(1));
                            }
                            else if(curr_running_disp->calculate_disparity(idle_set_const[i].range(0,9),0) == 0)
                            {
                                curr_running_disp->set_CRD(i,sc_logic(0));
                            }
                        }
                    }

                    if(symbol_num == 0)
                    {
                        for(i=0;i<LINK_WIDTH;i++)
                        {
                            if(LINK_WIDTH == 1)
                                out_reg = (idle_set_const[i].range(idle_pattern_bit,idle_pattern_bit));
                            else
                                out_reg = (idle_set_const[i].range(idle_pattern_bit,idle_pattern_bit),out_reg.range(LINK_WIDTH-1,1));
                            out_reg_bar = ~out_reg;
                        }
                        idle_pattern_bit += 1;
                        idle_pattern_bit %= 10;
                        if(idle_pattern_bit == 0)
                        {
                            if(transmit_idl_count > 0)
                                transmit_idl_count--;
                            transmitted_idl_pattern += 1;



                            if(transmitted_idl_pattern >= 16 && (init_state == Recovery_Idle))
                            {
                                transmitted_16xidl_sets = 1;
                                transmit_idl_count+= 16;
                            }
                            if(init_done.read()) done_last_idle_retrain++;
                        }
                    }
                    else if(symbol_num != 0)
                    {
                        for(i=0;i<LINK_WIDTH;i++)
                        {
                            if(LINK_WIDTH == 1)
                                out_reg = (ts2_link_lane_non_PAD[i].range(symbol_num,symbol_num));
                            else
                                out_reg = (ts2_link_lane_non_PAD[i].range(symbol_num,symbol_num),out_reg.range(LINK_WIDTH-1,1));
                            out_reg_bar = ~out_reg;
                        }
                        if(symbol_num == 0)
                            scrambler_i->scramble_descramble_all(K28_5,1,1);
                        else if((symbol_num % 10) == 0)
                        {
                            for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                            {
                                scrambler_i->start_scramble_reg[lane_scram] = true;
                                scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                            }
                        }

                        symbol_num++;
                        symbol_num %= 160;
                    }
                }
            }

            /// For CFG_IDLE and L0 when control is still not yet with pl_top. This is not a retraining sequence
            if ((received_1xidl_sets && init_state == CFG_IDLE) || (init_state == L0 && !init_done.read() && !retraining) || (last_idle_frame && !retraining)  || (init_state == L0s && !init_done.read() && !retraining)){ // Start transmitting IDL if received IDL else normally transmit IDL patterns
                for(int lane_scram=0; lane_scram<LINK_WIDTH; lane_scram++)
                    scrambler_i->start_scramble_reg[lane_scram] = true;

                if(init_state == L0)
                    transmit_idl_count = 1;
                if ( transmit_idl_count != 0 || (init_state == CFG_IDLE && !received_8xidl_sets) )
                {
                    // CRD calculation
                    if(idle_pattern_bit == 0 && symbol_num == 0) // Start the scrambler only when finished transmitting previous patterns
                    {
                        scramble_pattern = scrambler_i->scramble_descramble_all(0x00,1,0); // LFSR moves forward...but scramble the rest with this same LFSR
                        for(i=0;i<LINK_WIDTH;i++)
                        {
                            if(curr_running_disp->get_CRD(i).to_bool())
                            {
                                idle_set_const[i] = scramble_pattern;
                                iter = map_table->data_encode_map.find(idle_set_const[i].to_uint());
                                idle_set_const[i].range(0,9) = iter->second;
                            }
                            else if(!curr_running_disp->get_CRD(i).to_bool())
                            {
                                idle_set_const[i] = scramble_pattern;
                                iter = map_table->neg_data_encode_map.find(idle_set_const[i].to_uint());
                                idle_set_const[i].range(0,9) = iter->second;
                            }
                            if(curr_running_disp->calculate_disparity(idle_set_const[i].range(0,9),0) == 1)
                            {
                                curr_running_disp->set_CRD(i,sc_logic(1));
                            }
                            else if(curr_running_disp->calculate_disparity(idle_set_const[i].range(0,9),0) == 0)
                            {
                                curr_running_disp->set_CRD(i,sc_logic(0));
                            }
                        }
                    }

                    if(symbol_num == 0)
                    {
                        for(i=0;i<LINK_WIDTH;i++)
                        {
                            if(LINK_WIDTH == 1)
                                out_reg = (idle_set_const[i].range(idle_pattern_bit,idle_pattern_bit));
                            else
                                out_reg = (idle_set_const[i].range(idle_pattern_bit,idle_pattern_bit),out_reg.range(LINK_WIDTH-1,1));
                            out_reg_bar = ~out_reg;
                        }
                        idle_pattern_bit += 1;
                        idle_pattern_bit %= 10;
                        if(idle_pattern_bit == 0)
                        {
                            if(transmit_idl_count > 0)
                                transmit_idl_count--;
                            transmitted_idl_pattern += 1;

                            if(transmitted_idl_pattern >= 16 && (init_state == CFG_IDLE))
                            {
                                transmitted_16xidl_sets = 1;
                                transmit_idl_count+= 16;
                            }
                            if(init_done.read()) done_last_idle++;
                        }
                    }
                    else if(symbol_num != 0)
                    {
                        for(i=0;i<LINK_WIDTH;i++)
                        {
                            if(LINK_WIDTH == 1)
                                out_reg = (ts2_link_lane_non_PAD[i].range(symbol_num,symbol_num));
                            else
                                out_reg = (ts2_link_lane_non_PAD[i].range(symbol_num,symbol_num),out_reg.range(LINK_WIDTH-1,1));
                            out_reg_bar = ~out_reg;
                        }
                        if(symbol_num == 0)
                            scrambler_i->scramble_descramble_all(K28_5,1,1);
                        else if((symbol_num % 10) == 0)
                        {
                            for(int lane_scram = 0;lane_scram < LINK_WIDTH; lane_scram++)
                            {
                                scrambler_i->start_scramble_reg[lane_scram] = true;
                                scrambler_i->scramble_descramble(0x00,1,0,lane_scram); // Move forward the LFSR
                            }
                        }

                        symbol_num++;
                        symbol_num %= 160;
                    }
                }
            }
        }
        else
        {
            ts1_2 = 0x0000000000000000000000000000000000000000;
            transmitted_1024xts1_2sets = 0;
            transmitted_16xts2_sets = 0;
            transmitted_16xidl_sets = 0;
            transmitted_ts1_pattern = 0;
            ts1_pattern_bit = 0;
            ts2_pattern_bit = 0;
            idle_pattern_bit = 0;
            received_8xts2_sets = 0;
            received_8xts1_sets = 0;
            received_1xts1_sets = 0;
            received_1xts2_sets = 0;
            ts1_non_pad_link_bit = 0;
            symbol_num = 0;
            link_field_is_PAD_ts1 = 0; 
            lane_field_is_PAD_ts1 = 0;
            link_field_is_PAD_ts2 = 0;
            lane_field_is_PAD_ts2 = 0;
            link_field_is_non_PAD_ts1 = 0;
            lane_field_is_non_PAD_ts1 = 0;
            link_field_is_non_PAD_ts2 = 0;
            lane_field_is_non_PAD_ts2 = 0;
            link_field_PAD_ts1_ok = 0;
            link_field_PAD_ts2_ok = 0;
            lane_field_PAD_ts1_ok = 0;
            lane_field_PAD_ts2_ok = 0;
            elec_idle_pattern_bit = 0;
            com_detected_tx = false;
            start_frame_boundary_tx = false;
            frame_boundary_tx_counter = 0;
        }
        out_reg_ser = (out_reg_ser.range(8,0),out_reg.range(0,0));
        out_reg_ser_bar = ~out_reg_ser;
        wait(link_clk.negedge_event());
    }
}



/// LTSSM state machine engine
/// always @(negedge frame_boundary)
void ltssm::init_state_machine() 
{
    int i;
    csr_port.set_notify_event(PEU_CSR_A_CORE_STATUS_HW_ADDR,&csr_core_status_ev);

    int polling_active_counter = 0;
    int polling_config_counter = 0;
    int disabled_state_counter = 0;
    int cfg_complete_counter   = 0;
    int cfg_idle_counter       = 0;
    int cfg_linkwidth_accept_counter = 0;
    int cfg_linkwidth_start_counter  = 0;
    int cfg_lanenum_wait_counter     = 0;
    int RcvrLock_counter  = 0;
    int RcvrCfg_counter   = 0;
    int RcvrIdle_counter  = 0;
    int hot_reset_counter = 0;

    while(true)
    {
        switch(init_state)
        {
            if((reset_por_l.read()))
            {
                case DETECT_QUIET :
                    {
                        csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_DETECT_QUIET << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                        for(i=0;i<(200 * DetectQuietDelay) ;i++)
                            wait(link_clk.posedge_event());
                        this_is_retraining = false;
                        retraining = false;
                        electrical_idle_constant_voltage_set = 0x3ff;
                        LOG_INFO << "_LTSSM_ : DETECT_QUIET => DETECT_ACTIVE";
                        csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,((ILUPEU_LTSSM_DETECT_ACT) << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                        done_last_idle = 0;
                        done_last_idle_retrain = 0;
                        transmitted_idl_pattern = 0;
                        init_state = DETECT_ACTIVE;

                        break;
                    }
                case DETECT_ACTIVE:
                    {
                        for(i=0;i< (20 * DetectQuietDelay); i++)
                            wait(link_clk.posedge_event());
                        init_state = POLLING_ACTIVE;
                        csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR, ((ILUPEU_LTSSM_POLL_ACTIVE) << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                        csr_port.write_csr_mask(PEU_CSR_A_LNK_STS_HW_ADDR,(0x1 << 11),PEU_CSR_LNK_STS_TRAIN_MASK);                                
                        LOG_INFO << "_LTSSM_ : DETECT_ACTIVE => POLLING_ACTIVE";
                        link_field_is_PAD_ts1 = 0;
                        link_field_is_PAD_ts2 = 0;
                        lane_field_is_PAD_ts1 = 0;
                        lane_field_is_PAD_ts2 = 0;
                        link_field_is_non_PAD_ts1 = 0;
                        lane_field_is_non_PAD_ts1 = 0;
                        link_field_is_non_PAD_ts2 = 0;
                        lane_field_is_non_PAD_ts2 = 0;
                        transmitted_16xts2_sets = 0;
                        ts1_non_pad_link_bit = 0;
                        ts1_count = 0;
                        ts2_count = 0;
                        symbol_num = 0;
                        electrical_idle_constant_voltage_set = 0x3ff;
                        break;
                    }
                case POLLING_COMPLIANCE :
                    {
                    }
                case POLLING_ACTIVE :
                    {
                        int i;
                        polling_active_counter++;
                        csr_port.write_csr_mask(PEU_CSR_A_LNK_CAP_HW_ADDR,(LINK_WIDTH << 4),PEU_CSR_LNK_STS_WIDTH_MASK);
                        csr_port.write_csr_mask(PEU_CSR_A_LNK_STS_HW_ADDR,(0x01 << 0),PEU_CSR_LNK_STS_SPEED_MASK);
                        if(((link_field_is_PAD_ts1 >= 8) || (link_field_is_PAD_ts2 >= 8)) && ((lane_field_is_PAD_ts1 >= 8) || (lane_field_is_PAD_ts2 >= 8)) && transmitted_1024xts1_2sets) // 8 consecutive TS1/2 patterns received and 1024 transmitted
                        {
                            init_state = POLLING_CONFIG;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_POLL_CONFIG << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            //                            csr_port.write_csr_mask(PEU_CSR_A_TLU_STS_HW_ADDR,(0x1 << 2),0x4);
                            LOG_INFO << "_LTSSM_ : POLLING_ACTIVE => POLLING_CONFIG";
                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            transmitted_16xts2_sets = 0;
                            transmitted_1024xts1_2sets = 0;
                            link_field_is_non_PAD_ts2 = 0;
                            lane_field_is_non_PAD_ts2 = 0;
                            ts1_non_pad_link_bit = 0;
                            ts1_count = 0;
                            ts2_count = 0;
                            symbol_num = 0;
                            polling_active_counter = 0;
                            received_1xts2_sets = 0;
                            received_1xts1_sets = 0;
                        }
                        else if(polling_active_counter >= POLLING_ACTIVE_TIMEOUT || !reset_l.read() || !reset_por_l.read())
                        {
                            if(((link_field_is_PAD_ts1 >= 1) || (link_field_is_PAD_ts2 >= 1)) && ((lane_field_is_PAD_ts1 >= 1) || (lane_field_is_PAD_ts2 >= 1)) && transmitted_1024xts1_2sets) // 8 consecutive TS1/2 patterns received and 1024 transmitted
                            {
                                init_state = POLLING_CONFIG;
                                csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_POLL_CONFIG << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                                LOG_INFO << "_LTSSM_ : POLLING_ACTIVE => POLLING_CONFIG";
                                link_field_is_PAD_ts1 = 0;
                                link_field_is_PAD_ts2 = 0;
                                lane_field_is_PAD_ts1 = 0;
                                lane_field_is_PAD_ts2 = 0;
                                transmitted_16xts2_sets = 0;
                                link_field_is_non_PAD_ts2 = 0;
                                lane_field_is_non_PAD_ts2 = 0;
                                ts1_non_pad_link_bit = 0;
                                ts1_count = 0;
                                ts2_count = 0;
                                symbol_num = 0;
                                polling_active_counter = 0;
                            }
                            else
                            {
                                init_state = DETECT_QUIET;
                                csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_DETECT_QUIET << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                                if(!reset_l.read() || !reset_por_l.read()) LOG_INFO << "_LTSSM_ : POLLING_ACTIVE => DETECT_QUIET due to reset_l/reset_por_l";

                                link_field_is_PAD_ts1 = 0;
                                link_field_is_PAD_ts2 = 0;
                                lane_field_is_PAD_ts1 = 0;
                                lane_field_is_PAD_ts2 = 0;
                                link_field_is_non_PAD_ts2 = 0;
                                lane_field_is_non_PAD_ts2 = 0;
                                transmitted_16xts2_sets = 0;
                                ts1_non_pad_link_bit = 0;
                                ts1_count = 0;
                                ts2_count = 0;
                                symbol_num = 0;
                                polling_active_counter = 0;
                                transmitted_1024xts1_2sets = 0;
                                LOG_INFO << " : _LTSSM_ : POLLING_ACTIVE => DETECT_QUIET";
                                //reset_var_detect_quiet();
                                //LOG_INFO << " : _LTSSM_ : POLLING_ACTIVE => DETECT_QUIET";
                            }
                        }
                        break;
                    }
                case POLLING_SPEED :
                    {  
                        break;
                    }
                case POLLING_CONFIG :
                    {
                        polling_config_counter++;
                        if ( (link_field_is_PAD_ts2 >= 8) && (lane_field_is_PAD_ts2 >= 8) && (transmitted_16xts2_sets))
                        {
                            init_state = CFG_LINKWIDTH_START;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_CFG_LINKWD_START << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            link_field_is_non_PAD_ts2 = 0;
                            lane_field_is_non_PAD_ts2 = 0;
                            ts1_count = 0;
                            ts2_count = 0;
                            transmitted_16xts2_sets = 0;
                            symbol_num = 0;
                            ts1_non_pad_link_bit = 0;
                            LOG_INFO << "_LTSSM_ : POLLING_CONFIG => CFG_LINKWIDTH_START";
                            polling_config_counter = 0;
                            disable_link_reg = false;
                        }
                        else if(polling_config_counter == POLLING_CONFIG_TIMEOUT) // Go to detect after 300 TS1 pattern timeout
                        {
                            init_state = DETECT_QUIET;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_DETECT_ACT << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            link_field_is_non_PAD_ts1 = 0;
                            lane_field_is_non_PAD_ts1 = 0;
                            link_field_is_non_PAD_ts2 = 0;
                            lane_field_is_non_PAD_ts2 = 0;
                            transmitted_16xts2_sets = 0;
                            ts1_count = 0;
                            ts2_count = 0;
                            symbol_num = 0;
                            polling_config_counter = 0;
                            transmitted_1024xts1_2sets = 0;
                            ts1_non_pad_link_bit = 0;
                            elec_idle_pattern_bit = 0;

                            //reset_var_detect_quiet();
                            //polling_config_counter = 0;
                            LOG_INFO << "_LTSSM_ : POLLING_CONFIG => DETECT_QUIET";
                        }
                        break;
                    }
                case CFG_LINKWIDTH_START :
                    {
                        cfg_linkwidth_start_counter++;
                        // Exit to detect state conditions
                        if(cfg_linkwidth_start_counter >= CFG_LINKWIDTH_START_TIMEOUT || ts1_disable_link_count >= 2)
                        {
                            if(cfg_linkwidth_start_counter >= CFG_LINKWIDTH_START_TIMEOUT)
                            {
                                init_state = DETECT_QUIET;
                                csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_DETECT_QUIET << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                                LOG_INFO << " : _LTSSM_ : CFG_LINKWIDTH_START => DETECT_QUIET";
                            }
                            else
                            {
                                init_state = DISABLED_ENTRY;
                                csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_DISABLED_ENTRY << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                                LOG_INFO << " : _LTSSM_ : CFG_LINKWIDTH_START => DISABLED_ENTRY";
                            }
                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            link_field_is_non_PAD_ts1 = 0;
                            lane_field_is_non_PAD_ts1 = 0;
                            link_field_is_non_PAD_ts2 = 0;
                            lane_field_is_non_PAD_ts2 = 0;
                            transmitted_16xts2_sets = 0;
                            ts1_count = 0;
                            ts2_count = 0;
                            symbol_num = 0;
                            cfg_linkwidth_start_counter = 0;
                            transmitted_1024xts1_2sets = 0;
                            elec_idle_pattern_bit = 0;
                            ts1_disable_link_count = 0;

                            //                            cfg_linkwidth_start_counter = 0;
                            //                            reset_var_detect_quiet();
                        }
                        else if ( (link_field_is_non_PAD_ts1 >= 2)) // received 2 consecutive ts1 sets with pad link bits
                        {
                            init_state = CFG_LINKWIDTH_ACCEPT;
                            csr_port.write_csr_mask(PEU_CSR_A_LNK_STS_HW_ADDR,(ILUPEU_LTSSM_CFG_LINKWD_ACEPT << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            link_field_is_non_PAD_ts1 = 0;
                            lane_field_is_non_PAD_ts1 = 0;
                            link_field_is_non_PAD_ts2 = 0;
                            lane_field_is_non_PAD_ts2 = 0;
                            transmitted_16xts2_sets = 0;
                            ts1_count = 0;
                            ts2_count = 0;
                            symbol_num = 0;

                            LOG_INFO << "  : _LTSSM_ : CFG_LINKWIDTH_START => CFG_LINKWIDTH_ACCEPT";
                            cfg_linkwidth_start_counter = 0;
                        }
                        break;
                    }
                case DISABLED_ENTRY :
                    {
                        if(transmitted_16xts1_disabled)
                        {
                            init_state = DISABLED_IDLE;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_DISABLED_IDLE << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            link_field_is_non_PAD_ts1 = 0;
                            lane_field_is_non_PAD_ts1 = 0;
                            link_field_is_non_PAD_ts2 = 0;
                            lane_field_is_non_PAD_ts2 = 0;
                            transmitted_16xts2_sets = 0;
                            ts1_count = 0;
                            ts2_count = 0;
                            symbol_num = 0;
                            ts1_non_pad_link_bit = 0;
                            cfg_linkwidth_start_counter = 0;
                            transmitted_1024xts1_2sets = 0;
                            elec_idle_pattern_bit = 0;
                            ts1_disable_link_count = 0;
                            received_electrical_idle = false;
                            LOG_INFO << "_LTSSM_ : DISABLED_ENTRY => DISABLED_IDLE";
                        }
                        break;
                    }
                case DISABLED_IDLE :
                    {
                        if(transmitted_1xelec_idle && received_electrical_idle)
                        {
                            init_state = DISABLED;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_DISABLED << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            link_field_is_non_PAD_ts1 = 0;
                            lane_field_is_non_PAD_ts1 = 0;
                            link_field_is_non_PAD_ts2 = 0;
                            lane_field_is_non_PAD_ts2 = 0;
                            transmitted_16xts2_sets = 0;
                            ts1_count = 0;
                            ts2_count = 0;
                            symbol_num = 0;
                            ts1_non_pad_link_bit = 0;
                            cfg_linkwidth_start_counter = 0;
                            transmitted_1024xts1_2sets = 0;
                            elec_idle_pattern_bit = 0;
                            ts1_disable_link_count = 0;
                            LOG_INFO << "_LTSSM_ : DISABLED_IDLE => DISABLED";
                        }
                        break;
                    }
                case DISABLED :
                    {
                        disabled_state_counter++;
                        if(disabled_state_counter >= DISABLED_TIMEOUT)
                        {
                            init_state = DETECT_QUIET;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_DETECT_ACT << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            link_field_is_non_PAD_ts1 = 0;
                            lane_field_is_non_PAD_ts1 = 0;
                            link_field_is_non_PAD_ts2 = 0;
                            lane_field_is_non_PAD_ts2 = 0;
                            transmitted_16xts2_sets = 0;
                            ts1_count = 0;
                            ts2_count = 0;
                            disabled_state_counter = 0;
                            transmitted_1024xts1_2sets = 0;
                            LOG_INFO << "_LTSSM_ : DISABLED => DETECT_QUIET";
                        }
                        break;
                    }
                case CFG_LINKWIDTH_ACCEPT :
                    {
                        cfg_linkwidth_accept_counter++;
                        // Directly go to CFG_LANENUM_ACCEPT
                        if(link_field_is_non_PAD_ts1 >= 2 && lane_field_is_non_PAD_ts1 >= 2)
                        {
                            init_state = CFG_LANENUM_ACCEPT;
                            csr_port.write_csr_mask(PEU_CSR_A_LNK_STS_HW_ADDR,(ILUPEU_LTSSM_CFG_LANENUM_ACEPT << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            link_field_is_non_PAD_ts1 = 0;
                            lane_field_is_non_PAD_ts1 = 0;
                            link_field_is_non_PAD_ts2 = 0;
                            lane_field_is_non_PAD_ts2 = 0;
                            transmitted_16xts2_sets = 0;
                            ts1_count = 0;
                            ts2_count = 0;
                            cfg_linkwidth_accept_counter = 0;

                            LOG_INFO << "_LTSSM_ : CFG_LINKWIDTH_ACCEPT => CFG_LANENUM_ACCEPT";
                        }
                        else if(move_to_cfg_lanenum_wait)
                        {
                            init_state = CFG_LANENUM_WAIT;
                            csr_port.write_csr_mask(PEU_CSR_A_LNK_STS_HW_ADDR,(ILUPEU_LTSSM_CFG_LANENUM_WAIT << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            link_field_is_non_PAD_ts1 = 0;
                            lane_field_is_non_PAD_ts1 = 0;
                            link_field_is_non_PAD_ts2 = 0;
                            lane_field_is_non_PAD_ts2 = 0;
                            transmitted_16xts2_sets = 0;
                            ts1_count = 0;
                            ts2_count = 0;
                            LOG_INFO << "_LTSSM_ : CFG_LINKWIDTH_ACCEPT => CFG_LANENUM_WAIT";
                            move_to_cfg_lanenum_wait = 0;
                            cfg_linkwidth_accept_counter = 0;
                        }
                        else if(cfg_linkwidth_accept_counter >= CFG_LINKWIDTH_ACCEPT_TIMEOUT || (link_field_is_PAD_ts1 >= 2))
                        {
                            init_state = DETECT_QUIET;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_DETECT_QUIET << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            link_field_is_non_PAD_ts1 = 0;
                            lane_field_is_non_PAD_ts1 = 0;
                            link_field_is_non_PAD_ts2 = 0;
                            lane_field_is_non_PAD_ts2 = 0;
                            transmitted_16xts2_sets = 0;
                            ts1_count = 0;
                            ts2_count = 0;
                            symbol_num = 0;
                            cfg_linkwidth_accept_counter = 0;
                            elec_idle_pattern_bit = 0;

                            //                            reset_var_detect_quiet();
                            //                            cfg_linkwidth_accept_counter = 0;
                            LOG_INFO << " : _LTSSM : CFG_LINKWIDTH_ACCEPT => DETECT_QUIET";
                        }
                        break;
                    }
                case CFG_LANENUM_ACCEPT :
                    {
                        if((link_field_is_non_PAD_ts1 >= 2) && (lane_field_is_non_PAD_ts1 >= 2))
                        {
                            init_state = CFG_COMPLETE;
                            csr_port.write_csr_mask(PEU_CSR_A_LNK_STS_HW_ADDR,(ILUPEU_LTSSM_CFG_COMPLETE << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            link_field_is_non_PAD_ts1 = 0;
                            lane_field_is_non_PAD_ts1 = 0;
                            link_field_is_non_PAD_ts2 = 0;
                            lane_field_is_non_PAD_ts2 = 0;
                            transmitted_16xts2_sets = 0;
                            ts1_count = 0;
                            ts2_count = 0;
                            received_1xts2_sets = 0;

                            LOG_INFO << "_LTSSM_ : CFG_LANENUM_ACCEPT => CFG_COMPLETE";
                        }
                        else if((link_field_is_PAD_ts1 >= 2) && (lane_field_is_PAD_ts1 >= 2))
                        {
                            init_state = DETECT_QUIET;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_DETECT_QUIET << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            link_field_is_non_PAD_ts1 = 0;
                            lane_field_is_non_PAD_ts1 = 0;
                            link_field_is_non_PAD_ts2 = 0;
                            lane_field_is_non_PAD_ts2 = 0;
                            transmitted_16xts2_sets = 0;
                            ts1_count = 0;
                            ts2_count = 0;
                            //                            reset_var_detect_quiet();
                            LOG_INFO << "_LTSSM_ : CFG_LANENUM_ACCEPT => DETECT_QUIET";
                        }
                        else if(move_to_cfg_lanenum_wait)
                        {
                            init_state = CFG_LANENUM_WAIT;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_CFG_LANENUM_WAIT << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            link_field_is_non_PAD_ts1 = 0;
                            lane_field_is_non_PAD_ts1 = 0;
                            link_field_is_non_PAD_ts2 = 0;
                            lane_field_is_non_PAD_ts2 = 0;
                            transmitted_16xts2_sets = 0;
                            ts1_count = 0;
                            ts2_count = 0;
                            LOG_INFO << "_LTSSM_ : CFG_LANENUM_ACCEPT => CFG_LANENUM_WAIT";
                            move_to_cfg_lanenum_wait = 0;
                        }
                        break;
                    }
                case CFG_LANENUM_WAIT :
                    {
                        cfg_lanenum_wait_counter++;
                        if(move_to_cfg_lanenum_accept)
                        {
                            init_state = CFG_LANENUM_ACCEPT;
                            csr_port.write_csr_mask(PEU_CSR_A_LNK_STS_HW_ADDR,(ILUPEU_LTSSM_CFG_LANENUM_ACEPT << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            link_field_is_non_PAD_ts1 = 0;
                            lane_field_is_non_PAD_ts1 = 0;
                            link_field_is_non_PAD_ts2 = 0;
                            lane_field_is_non_PAD_ts2 = 0;
                            transmitted_16xts2_sets = 0;
                            ts1_count = 0;
                            ts2_count = 0;
                            LOG_INFO << "_LTSSM_ : CFG_LANENUM_WAIT => CFG_LANENUM_ACCEPT";
                            from_cfg_lanenum_wait = true;
                            cfg_lanenum_wait_counter = 0;
                        }
                        else if((link_field_is_PAD_ts1 >= 2 && lane_field_is_PAD_ts1 >= 2) || cfg_lanenum_wait_counter >= 100)
                        {
                            init_state = DETECT_QUIET;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_DETECT_QUIET << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            link_field_is_non_PAD_ts1 = 0;
                            lane_field_is_non_PAD_ts1 = 0;
                            link_field_is_non_PAD_ts2 = 0;
                            lane_field_is_non_PAD_ts2 = 0;
                            transmitted_16xts2_sets = 0;
                            ts1_count = 0;
                            ts2_count = 0;
                            cfg_lanenum_wait_counter = 0;

                            //                            reset_var_detect_quiet();
                            //                            cfg_lanenum_wait_counter = 0;
                            LOG_INFO << "_LTSSM_ : CFG_LANENUM_WAIT => DETECT_QUIET";
                        }
                        break;
                    }
                case CFG_COMPLETE :
                    {
                        cfg_complete_counter++;
                        if((link_field_is_non_PAD_ts2 >= 8) && (lane_field_is_non_PAD_ts2 >= 8) && (transmitted_16xts2_sets))
                        {
                            init_state = CFG_IDLE;
                            csr_port.write_csr_mask(PEU_CSR_A_LNK_STS_HW_ADDR,(ILUPEU_LTSSM_CFG_IDLE << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            link_field_is_non_PAD_ts1 = 0;
                            lane_field_is_non_PAD_ts1 = 0;
                            link_field_is_non_PAD_ts2 = 0;
                            lane_field_is_non_PAD_ts2 = 0;
                            transmitted_16xts2_sets = 0;
                            ts1_count = 0;
                            ts2_count = 0;
                            received_1xts2_sets = 0;
                            cfg_complete_counter = 0;
                            LOG_INFO << "  : _LTSSM_ : CFG_COMPLETE => CFG_IDLE";

                        }
                        else if(cfg_complete_counter == CFG_COMPLETE_TIMEOUT)
                        {
                            init_state = DETECT_QUIET;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_DETECT_QUIET << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            transmitted_16xts2_sets = 0;
                            ts1_count = 0;
                            ts1_non_pad_link_bit = 0;
                            ts2_count = 0;
                            cfg_complete_counter = 0;
                            elec_idle_pattern_bit = 0;

                            //                            reset_var_detect_quiet();
                            //                            cfg_complete_counter = 0;
                            LOG_INFO << " : _LTSSM_ : CFG_COMPLETE => DETECT_QUIET";
                        }
                        break;
                    }
                case CFG_IDLE :
                    {
                        cfg_idle_counter++;
                        if ( (received_8xidl_sets == 1) && transmitted_16xidl_sets)
                        {
                            init_state = L0;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_L0 << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            csr_port.write_csr_mask(PEU_CSR_A_LNK_STS_HW_ADDR,(PEU_CSR_LNK_STS_POR_VALUE << 11),PEU_CSR_LNK_STS_TRAIN_MASK);
                            csr_port.write_csr_mask(PEU_CSR_A_LNK_STS_HW_ADDR,(LINK_WIDTH << 4),PEU_CSR_LNK_STS_WIDTH_MASK);
                            csr_port.write_csr_mask(PEU_CSR_A_LNK_STS_HW_ADDR,(0x01 << 0),PEU_CSR_LNK_STS_SPEED_MASK);

                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            transmitted_16xts2_sets = 0;
                            ts1_count = 0;
                            ts2_count = 0;
                            received_8xts2_sets = 0;
                            received_8xts1_sets = 0;
                            received_8xidl_sets = 0;
                            received_1xts2_sets = 0;
                            received_1xts1_sets = 0;
                            received_1xidl_sets = 0;
                            ts1_2.range(159,0) = 0x0000000000000000000000000000000000000000;
                            ts1_2_negedge.range(159,0) = 0x0000000000000000000000000000000000000000;
                            electrical_idle_set.range(39,0) = 0x0000000000;
                            electrical_idle_set_negedge.range(39,0) = 0x0000000000;
                            skip_set.range(39,0) = 0x0000000000;
                            skip_set_negedge.range(39,0) = 0x0000000000;
                            cfg_idle_counter = 0;
                            idl_count = 0;
                            LOG_INFO << "  : _LTSSM_ : CFG_IDLE => L0";
                        }
                        else if(cfg_idle_counter == CFG_IDLE_TIMEOUT)
                        {
                            init_state = DETECT_QUIET;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_DETECT_QUIET << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            link_field_is_non_PAD_ts1 = 0;
                            lane_field_is_non_PAD_ts1 = 0;
                            link_field_is_non_PAD_ts2 = 0;
                            lane_field_is_non_PAD_ts2 = 0;
                            transmitted_16xts2_sets = 0;
                            ts1_count = 0;
                            ts2_count = 0;
                            cfg_idle_counter = 0;
                            elec_idle_pattern_bit = 0;
                            this_is_retraining = false;
                            LOG_INFO << "_LTSSM_ : CFG_IDLE => DETECT_QUIET";
                            //                            reset_var_detect_quiet();
                            //                            cfg_idle_counter = 0;
                            //                            this_is_retraining = false;
                        }
                        break;
                    }
                case L0 :
                    {
                        if(!reset_l.read() || !reset_por_l.read())
                        {
                            init_state = DETECT_QUIET;
                            init_state_rx = DETECT_QUIET;
                            LOG_INFO << "_LTSSM_ : Going from L0 => DETECT_QUIET for reset_l or reset_por_l. However, last of the PL packets will still be processed";
                            write_init_done = false;
                            write_init_done_rx = false;
                            init_done.write(false);
                            init_done_rx.write(false);
                            stage_init_state_rx = false;
                            stage_init_state = true;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_DETECT_QUIET << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            ts1_count = 0;
                            ts2_count = 0;

                            //                            reset_var_detect_quiet();
                            ts1_2.range(159,0) = 0x0000000000000000000000000000000000000000;
                            for(i=0;i<LINK_WIDTH;i++)
                                ts1_2_serial[i].range(159,0) = 0x0000000000000000000000000000000000000000;
                            last_idle_frame = false;
                            done_last_idle = 0;
                        }
                        if(received_electrical_idle)
                        {
                            init_state = L0s;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_L0S << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            received_electrical_idle = 0;
                            write_init_done = false;
                            init_done.write(false);
                            write_init_done_rx = false;
                            init_done_rx.write(false);
                            stage_init_state_rx = false;
                            LOG_INFO << " _LTSSM_ : L0 => L0s";
                            wait(SC_ZERO_TIME);
                        }
                        if(toRecovery   || received_electrical_idle_constant_voltage)
                        {
                            init_state = Recovery_RcvrLock;
                            init_state_rx = Recovery_RcvrLock;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_RCVRY_RCVRLOCK << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            LOG_INFO << " : _LTSSM_ : L0 => Recovery_RcvrLock. However, last of the PL packets will still be processed.";


                            write_init_done = false;
                            init_done.write(false);
                            write_init_done_rx = false;
                            stage_init_state = true;
                            init_done_rx.write(false);
                            stage_init_state_rx = false;
                            toRecovery = false;
                            received_electrical_idle = false;
                            ts1_non_pad_lane_bit = 0;
                            electrical_idle_constant_voltage_set = 0x3ff;
                            ts1_non_pad_link_bit = 0;
                            ts1_non_pad_link_lane = 0;
                            ts2_pattern_bit = 0;
                            ts2_failover_pattern_bit = 0;
                            idle_pattern_bit = 0;
                            idl_count = 0;
                            transmitted_idl_pattern = 0;
                            transmitted_16xidl_sets = 0;
                            retraining = true;
                            this_is_retraining = true;
                            done_last_idle_retrain = 0;
                            link_field_is_non_PAD_ts1 = 0;
                            lane_field_is_non_PAD_ts1 = 0;
                            link_field_is_non_PAD_ts2 = 0;
                            lane_field_is_non_PAD_ts2 = 0;
                            first_retrain_idle_detection = true;
                            ts1_2.range(159,0) = 0x0000000000000000000000000000000000000000;
                            for(i=0;i<LINK_WIDTH;i++)
                                ts1_2_serial[i].range(159,0) = 0x0000000000000000000000000000000000000000;
                        }
                        break;
                    }
                case Recovery_RcvrLock :
                    {
                        RcvrLock_counter++;
                        if((link_field_is_non_PAD_ts1 >= 8 || link_field_is_non_PAD_ts2 >= 8) && (lane_field_is_non_PAD_ts1 >= 8 || lane_field_is_non_PAD_ts2 >= 8))
                        {
                            init_state = Recovery_RcvrCfg;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_RCVRY_RCVRCFG << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            RcvrLock_counter = 0;
                            LOG_INFO << "_LTSSM_ : Recovery_RcvrLock => Recovery_RcvrCfg";
                            constant_voltage_count = 0;
                        }
                        if(RcvrLock_counter == Recovery_RcvrLock_TIMEOUT) // Timeout
                        {
                            if((link_field_is_non_PAD_ts1 > 0 || link_field_is_non_PAD_ts2 > 0) && (lane_field_is_non_PAD_ts1 > 0 || lane_field_is_non_PAD_ts2 > 0))
                            {
                                init_state = CFG_LINKWIDTH_START;
                                csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_CFG_LINKWD_START << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                                RcvrLock_counter = 0;
                                LOG_INFO << "_LTSSM_ : Recovery_RcvrLock => CFG_LINKWIDTH_START";
                            }
                            else
                            {
                                init_state = DETECT_QUIET;
                                link_field_is_PAD_ts1 = 0;
                                link_field_is_PAD_ts2 = 0;
                                lane_field_is_PAD_ts1 = 0;
                                lane_field_is_PAD_ts2 = 0;
                                link_field_is_non_PAD_ts1 = 0;
                                lane_field_is_non_PAD_ts1 = 0;
                                link_field_is_non_PAD_ts2 = 0;
                                lane_field_is_non_PAD_ts2 = 0;
                                transmitted_16xts2_sets = 0;
                                ts1_count = 0;
                                constant_voltage_count = 0;
                                ts2_count = 0;
                                symbol_num = 0;
                                ts1_non_pad_link_bit = 0;
                                elec_idle_pattern_bit = 0;
                                //                                reset_var_detect_quiet();
                                csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_DETECT_QUIET <<  PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                                if(received_electrical_idle_constant_voltage)
                                {
                                    LOG_INFO << "LTSSM: Detected electrical idle constant voltage, entering drain state..." ;
                                    //csr_port.write_csr_mask(PEU_CSR_A_TLU_STS_HW_ADDR,(0x1 << 8),PEU_CSR_TLU_STS_SET_MASK);
                                    enter_drain_state = true;
                                    csr_port.write_csr_mask(PEU_CSR_A_OE_ERR_RW1S_ALIAS_HW_ADDR,(0x1 << 9),PEU_CSR_OE_ERR_RW1S_ALIAS_SET_MASK);
                                    csr_port.write_csr_mask(PEU_CSR_A_LNK_STS_HW_ADDR,(0x0 << 4),PEU_CSR_LNK_STS_WIDTH_MASK);
                                    csr_port.write_csr_mask(PEU_CSR_A_LNK_STS_HW_ADDR,(0x00 << 0),PEU_CSR_LNK_STS_SPEED_MASK);
                                } 
                                csr_port.write_csr_mask(PEU_CSR_A_LNK_STS_HW_ADDR,(0x0 << 4),PEU_CSR_LNK_STS_WIDTH_MASK);
                                csr_port.write_csr_mask(PEU_CSR_A_LNK_STS_HW_ADDR,(0x00 << 0),PEU_CSR_LNK_STS_SPEED_MASK);
                                RcvrLock_counter = 0;
                                LOG_INFO << "_LTSSM_ : Timeout : Recovery_RcvrLock => DETECT_QUIET";
                            }
                        }
                        break;
                    }
                case Recovery_RcvrCfg :
                    {
                        RcvrCfg_counter++;

                        if((link_field_is_non_PAD_ts2 >= 8) && (lane_field_is_non_PAD_ts2 >= 8) && (transmitted_16xts2_sets))
                        {
                            init_state = Recovery_Idle;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_RCVRY_IDLE <<  PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            RcvrCfg_counter = 0;
                            LOG_INFO << "_LTSSM_ : Recovery_RcvrCfg => Recovery_Idle";
                            constant_voltage_count = 0;
                            transmitted_16xts2_sets = 0;
                        }
                        if(RcvrCfg_counter == Recovery_RcvrCfg_TIMEOUT)
                        {
                            init_state = DETECT_QUIET;
                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            link_field_is_non_PAD_ts1 = 0;
                            lane_field_is_non_PAD_ts1 = 0;
                            link_field_is_non_PAD_ts2 = 0;
                            lane_field_is_non_PAD_ts2 = 0;
                            transmitted_16xts2_sets = 0;
                            ts1_count = 0;
                            ts2_count = 0;
                            symbol_num = 0;
                            ts1_non_pad_link_bit = 0;

                            //                            reset_var_detect_quiet();
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_DETECT_QUIET <<  PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);

                            RcvrCfg_counter = 0;
                            elec_idle_pattern_bit = 0;
                            LOG_INFO << "_LTSSM_ : Timeout : Recovery_RcvrCfg => DETECT_QUIET";
                        }
                        break;
                    }
                case Recovery_Idle :
                    {
                        RcvrIdle_counter++;
                        if(macl_pcs_ctl_csr.range(0,0) == 0x1) // Enter HOT_RESET0
                        {
                            init_state = HOT_RESET0;
                            LOG_INFO << "_LTSSM_ : Preparing to Enter Hot Reset";
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_HOT_RESET_ENTRY << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            link_field_is_non_PAD_ts1 = 0;
                            lane_field_is_non_PAD_ts1 = 0;
                            link_field_is_non_PAD_ts2 = 0;
                            lane_field_is_non_PAD_ts2 = 0;
                            transmitted_16xidl_sets = 0;
                            // No CSR write yet
                        }
                        if ( (received_8xidl_sets == 1) && transmitted_16xidl_sets)
                        {
                            init_state = L0;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_L0 << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            cout << "Bringing up the link..." << endl;
                            csr_port.write_csr_mask(PEU_CSR_A_OE_ERR_RW1S_ALIAS_HW_ADDR,(0x0 << 9),PEU_CSR_OE_ERR_RW1S_ALIAS_SET_MASK);
                            csr_port.write_csr_mask(PEU_CSR_A_LNK_STS_HW_ADDR,(PEU_CSR_LNK_STS_POR_VALUE << 11),PEU_CSR_LNK_STS_TRAIN_MASK);
                            csr_port.write_csr_mask(PEU_CSR_A_LNK_STS_HW_ADDR,(LINK_WIDTH << 4),PEU_CSR_LNK_STS_WIDTH_MASK);
                            csr_port.write_csr_mask(PEU_CSR_A_LNK_STS_HW_ADDR,(0x01 << 0),PEU_CSR_LNK_STS_SPEED_MASK);
                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            transmitted_16xts2_sets = 0;
                            ts1_count = 0;
                            ts2_count = 0;
                            received_8xts2_sets = 0;
                            received_8xts1_sets = 0;
                            received_8xidl_sets = 0;
                            received_1xts2_sets = 0;
                            received_1xts1_sets = 0;
                            electrical_idle_constant_voltage_set = 0x3ff;
                            received_electrical_idle_constant_voltage = false;
                            RcvrIdle_counter = 0;
                            LOG_INFO << "_LTSSM_ : Recovery_Idle => L0";
                        }
                        if(RcvrIdle_counter == Recovery_Idle_TIMEOUT)
                        {
                            init_state = DETECT_QUIET;
                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            link_field_is_non_PAD_ts1 = 0;
                            lane_field_is_non_PAD_ts1 = 0;
                            link_field_is_non_PAD_ts2 = 0;
                            lane_field_is_non_PAD_ts2 = 0;
                            transmitted_16xts2_sets = 0;
                            ts1_count = 0;
                            ts2_count = 0;
                            symbol_num = 0;
                            ts1_non_pad_link_bit = 0;
                            elec_idle_pattern_bit = 0;

                            //                            reset_var_detect_quiet();
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_DETECT_QUIET <<  PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            RcvrIdle_counter = 0;
                            LOG_INFO << "_LTSSM_ : Recovery_Idle => DETECT_QUIET";
                        }
                        break;
                    }
                case HOT_RESET0 :
                    {
                        if(received_2xts1_hot_reset)
                        {
                            init_state = HOT_RESET;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_HOT_RESET << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            LOG_INFO << "_LTSSM_ : Recovery_Idle => HOT_RESET";
                        }
                        break;
                    }
                case HOT_RESET :
                    {
                        hot_reset_counter++;
                        if(hot_reset_counter == HOT_RESET_TIMEOUT)
                        {
                            hot_reset_counter = 0;
                            init_state = DETECT_QUIET;
                            LOG_INFO << "_LTSSM_ : Auto Timing Out from HOT_RESET => DETECT_QUIET";
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_DETECT_QUIET <<  PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            csr_port.write_csr_mask(PEU_CSR_A_LINK_CTL_HW_ADDR,(0x0 << 0),PEU_CSR_MACL_PCS_RESET_FMASK); // Bring down this csr
                            //Bringing down the link, setting link reset and resetting the link speed and width
                            csr_port.write_csr_mask(PEU_CSR_A_OE_ERR_RW1S_ALIAS_HW_ADDR,(0x1 << 9),PEU_CSR_OE_ERR_RW1C_ALIAS_SET_MASK);
                            sc_uint<64> temp=0; temp.range(42,42)=1;
                            csr_port.write_csr_mask(PEU_CSR_A_OE_ERR_RW1S_ALIAS_HW_ADDR,temp,PEU_CSR_OE_ERR_RW1C_ALIAS_SET_MASK);
                            csr_port.write_csr_mask(PEU_CSR_A_LNK_STS_HW_ADDR,(0x0 << 4),PEU_CSR_LNK_STS_WIDTH_MASK);
                            csr_port.write_csr_mask(PEU_CSR_A_LNK_STS_HW_ADDR,(0x00 << 0),PEU_CSR_LNK_STS_SPEED_MASK);

                            link_field_is_PAD_ts1 = 0;
                            link_field_is_PAD_ts2 = 0;
                            lane_field_is_PAD_ts1 = 0;
                            lane_field_is_PAD_ts2 = 0;
                            link_field_is_non_PAD_ts1 = 0;
                            lane_field_is_non_PAD_ts1 = 0;
                            link_field_is_non_PAD_ts2 = 0;
                            lane_field_is_non_PAD_ts2 = 0;
                            transmitted_16xts2_sets = 0;
                            received_8xts2_sets = 0;
                            received_8xts1_sets = 0;
                            received_8xidl_sets = 0;
                            received_1xts2_sets = 0;
                            received_1xts1_sets = 0;
                            received_1xidl_sets = 0;
                            ts1_count = 0;
                            ts2_count = 0;
                            symbol_num = 0;
                            ts1_non_pad_link_bit = 0;
                            elec_idle_pattern_bit = 0;
                            received_2xts1_hot_reset = false;

                            //                            reset_var_detect_quiet();
                            ts1_hot_reset_count = 0;
                        }
                        break;
                    }
                case L0s :
                    {
                        if(received_skp_ordered_set)
                        {
                            init_state = L0;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,(ILUPEU_LTSSM_L0 << PEU_CSR_CORE_STATUS_LTSSM_STATE_POSITION),PEU_CSR_CORE_STATUS_LTSSM_STATE_FMASK);
                            csr_port.write_csr_mask(PEU_CSR_A_LNK_STS_HW_ADDR,(PEU_CSR_LNK_STS_POR_VALUE << 11),PEU_CSR_LNK_STS_TRAIN_MASK);
                            received_skp_ordered_set = 0;
                            LOG_INFO << "_LTSSM_ : L0s => L0";
                        }
                        break;
                    }
                    /// For future implementation
                case L1 :
                    {
                        break;
                    }
                    /// For future implementation
                case L2 :
                    {
                        break;
                    }
                    /// For future implementation
                case DISABLE :
                    {
                        break;
                    }
                    /// For future implementation
                case LOOPBACK :
                    {
                        break;
                    }
            }
        }
        if(!(reset_l.read()) || !(reset_por_l.read()))
        {
            init_state = DETECT_QUIET;
            LOG_INFO << "_LTSSM_ : Going to DETECT_QUIET due to reset";
        }

        if((init_state == DETECT_QUIET) || (init_state == DETECT_ACTIVE))
        {
            for(i=0;i<20;i++)
                wait(frame_boundary_reg_tx.negedge_event());
        }
        else
        {
            wait(frame_boundary_reg_tx.negedge_event());
        }
    }
}

/// Sets the init_state_rx variable
void ltssm::init_state_machine_rx()
{
    while(true)
    {
        init_state_rx = init_state;
        wait(frame_boundary_reg.negedge_event());
    }
}
