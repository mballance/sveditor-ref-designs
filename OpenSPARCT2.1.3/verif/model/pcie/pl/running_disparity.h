/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: running_disparity.h
* Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
* 4150 Network Circle, Santa Clara, California 95054, U.S.A.
*
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; version 2 of the License.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*
* For the avoidance of doubt, and except that if any non-GPL license 
* choice is available it will apply instead, Sun elects to use only 
* the General Public License version 2 (GPLv2) at this time for any 
* software where a choice of GPL license versions is made 
* available with the language indicating that GPLv2 or any later version 
* may be used, or where a choice of which version of the GPL is applied is 
* otherwise unspecified. 
*
* Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
* CA 95054 USA or visit www.sun.com if you need additional information or 
* have any questions. 
*
* 
* ========== Copyright Header End ============================================
*/
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: running_disparity.h
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
#ifndef INC_running_disparity_h__
#define INC_running_disparity_h__

#ifndef __EDG__

#include "systemc.h"
#define LOG_SERVICE

#ifdef LINK_1
#define LINK_WIDTH 1
#else
#ifdef LINK_2
#define LINK_WIDTH 2
#else
#ifdef LINK_4
#define LINK_WIDTH 4
#else
#define LINK_WIDTH 8
#endif
#endif
#endif
    

#include "pcie_common/logger.hpp"

using namespace Logger;

/// Static class for calculating the CRD of each lane
class running_disparity
{
    public :

    static running_disparity *current_disparity()
    {
        if(disparity == NULL)
            disparity = new running_disparity();
        return disparity;
    }

    static running_disparity *current_rx_disparity()
    {
        if(rx_disparity == NULL)
            rx_disparity = new running_disparity();
        return rx_disparity;
    }

    protected :
    running_disparity()
    {
        for(int i=0;i<LINK_WIDTH;i++)
        {
            CRD[i] = 1;
            RX_CRD[i] = 1;
        }
    }

    public :
    int calculate_disparity(sc_lv<10> vect,int start_point)
    {
        int i;
        int sum = 0;
        for(i=start_point;i<start_point+10;i++)
        {
            if(vect[i] == 0x1)
                sum++;
        }
        if(sum > 5)
        {
            return 1;
        }
        if(sum < 5)
        {
            return 0;
        }
        if(sum == 5)
        {
            return 2;
        }
    }

    sc_logic get_CRD(int i)
    {
        return CRD[i];
    }

    void set_CRD(int i, sc_logic val)
    {
        CRD[i] = val;
    }

    sc_logic get_rx_CRD(int i)
    {
        return RX_CRD[i];
    }

    void set_rx_CRD(int i, sc_logic val)
    {
        RX_CRD[i] = val;
    }

    private :
    static running_disparity *disparity;
    static running_disparity *rx_disparity;
    sc_logic CRD[LINK_WIDTH];
    sc_logic RX_CRD[LINK_WIDTH];
};
#endif // EDG

#endif // INC_running_disparity_h__

