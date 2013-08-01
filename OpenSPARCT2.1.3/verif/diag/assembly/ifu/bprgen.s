/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: bprgen.s
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
#include "defines.h"
#include "old_boot.s"

!SECTION .MAIN TEXT_VA = 0xfffffffff0000000
!attr_text {
!    Name=.MAIN,
!    hypervisor
!}

.text
.global main
		
main:

    ! 1st fetch should be from RSTVaddr+0x20

    illtrap
    illtrap
    illtrap
    illtrap
    illtrap
    illtrap
    illtrap
    illtrap

    ! First intsruction fetched should be from here  RSTVaddr+0x20
     
    ! First set up some registers with values ..

    setx 0x0,  %g1, %g2
    setx -0x1, %g1, %g3
    setx 0x1,  %g1, %g4
	
    setx 0x0, %g1, %g6
    setx 0x0, %g1, %g7

    ! Now do some useful stuff ..
	nop
	nop
T0:
	brz %g2,T1
	inc %g6
	inc %g7
T1:
	brlez %g2,T2
	inc %g6
	inc %g7
T2:
	brlz %g2,T3
	inc %g6
	inc %g7
T3:
	brnz %g2,T4
	inc %g6
	inc %g7
T4:
	brgz %g2,T5
	inc %g6
	inc %g7
T5:
	brgez %g2,T6
	inc %g6
	inc %g7
T6:
	brz,pt %g2,T7
	inc %g6
	inc %g7
T7:
	brlez,pt %g2,T8
	inc %g6
	inc %g7
T8:
	brlz,pt %g2,T9
	inc %g6
	inc %g7
T9:
	brnz,pt %g2,T10
	inc %g6
	inc %g7
T10:
	brgz,pt %g2,T11
	inc %g6
	inc %g7
T11:
	brgez,pt %g2,T12
	inc %g6
	inc %g7
T12:
	brz,pn %g2,T13
	inc %g6
	inc %g7
T13:
	brlez,pn %g2,T14
	inc %g6
	inc %g7
T14:
	brlz,pn %g2,T15
	inc %g6
	inc %g7
T15:
	brnz,pn %g2,T16
	inc %g6
	inc %g7
T16:
	brgz,pn %g2,T17
	inc %g6
	inc %g7
T17:
	brgez,pn %g2,T18
	inc %g6
	inc %g7
T18:
	brz,a %g2,T19
	inc %g6
	inc %g7
T19:
	brlez,a %g2,T20
	inc %g6
	inc %g7
T20:
	brlz,a %g2,T21
	inc %g6
	inc %g7
T21:
	brnz,a %g2,T22
	inc %g6
	inc %g7
T22:
	brgz,a %g2,T23
	inc %g6
	inc %g7
T23:
	brgez,a %g2,T24
	inc %g6
	inc %g7
T24:
	brz,a,pt %g2,T25
	inc %g6
	inc %g7
T25:
	brlez,a,pt %g2,T26
	inc %g6
	inc %g7
T26:
	brlz,a,pt %g2,T27
	inc %g6
	inc %g7
T27:
	brnz,a,pt %g2,T28
	inc %g6
	inc %g7
T28:
	brgz,a,pt %g2,T29
	inc %g6
	inc %g7
T29:
	brgez,a,pt %g2,T30
	inc %g6
	inc %g7
T30:
	brz,a,pn %g2,T31
	inc %g6
	inc %g7
T31:
	brlez,a,pn %g2,T32
	inc %g6
	inc %g7
T32:
	brlz,a,pn %g2,T33
	inc %g6
	inc %g7
T33:
	brnz,a,pn %g2,T34
	inc %g6
	inc %g7
T34:
	brgz,a,pn %g2,T35
	inc %g6
	inc %g7
T35:
	brgez,a,pn %g2,T36
	inc %g6
	inc %g7
T36:
	brz %g3,T37
	inc %g6
	inc %g7
T37:
	brlez %g3,T38
	inc %g6
	inc %g7
T38:
	brlz %g3,T39
	inc %g6
	inc %g7
T39:
	brnz %g3,T40
	inc %g6
	inc %g7
T40:
	brgz %g3,T41
	inc %g6
	inc %g7
T41:
	brgez %g3,T42
	inc %g6
	inc %g7
T42:
	brz,pt %g3,T43
	inc %g6
	inc %g7
T43:
	brlez,pt %g3,T44
	inc %g6
	inc %g7
T44:
	brlz,pt %g3,T45
	inc %g6
	inc %g7
T45:
	brnz,pt %g3,T46
	inc %g6
	inc %g7
T46:
	brgz,pt %g3,T47
	inc %g6
	inc %g7
T47:
	brgez,pt %g3,T48
	inc %g6
	inc %g7
T48:
	brz,pn %g3,T49
	inc %g6
	inc %g7
T49:
	brlez,pn %g3,T50
	inc %g6
	inc %g7
T50:
	brlz,pn %g3,T51
	inc %g6
	inc %g7
T51:
	brnz,pn %g3,T52
	inc %g6
	inc %g7
T52:
	brgz,pn %g3,T53
	inc %g6
	inc %g7
T53:
	brgez,pn %g3,T54
	inc %g6
	inc %g7
T54:
	brz,a %g3,T55
	inc %g6
	inc %g7
T55:
	brlez,a %g3,T56
	inc %g6
	inc %g7
T56:
	brlz,a %g3,T57
	inc %g6
	inc %g7
T57:
	brnz,a %g3,T58
	inc %g6
	inc %g7
T58:
	brgz,a %g3,T59
	inc %g6
	inc %g7
T59:
	brgez,a %g3,T60
	inc %g6
	inc %g7
T60:
	brz,a,pt %g3,T61
	inc %g6
	inc %g7
T61:
	brlez,a,pt %g3,T62
	inc %g6
	inc %g7
T62:
	brlz,a,pt %g3,T63
	inc %g6
	inc %g7
T63:
	brnz,a,pt %g3,T64
	inc %g6
	inc %g7
T64:
	brgz,a,pt %g3,T65
	inc %g6
	inc %g7
T65:
	brgez,a,pt %g3,T66
	inc %g6
	inc %g7
T66:
	brz,a,pn %g3,T67
	inc %g6
	inc %g7
T67:
	brlez,a,pn %g3,T68
	inc %g6
	inc %g7
T68:
	brlz,a,pn %g3,T69
	inc %g6
	inc %g7
T69:
	brnz,a,pn %g3,T70
	inc %g6
	inc %g7
T70:
	brgz,a,pn %g3,T71
	inc %g6
	inc %g7
T71:
	brgez,a,pn %g3,T72
	inc %g6
	inc %g7
T72:
	brz %g4,T73
	inc %g6
	inc %g7
T73:
	brlez %g4,T74
	inc %g6
	inc %g7
T74:
	brlz %g4,T75
	inc %g6
	inc %g7
T75:
	brnz %g4,T76
	inc %g6
	inc %g7
T76:
	brgz %g4,T77
	inc %g6
	inc %g7
T77:
	brgez %g4,T78
	inc %g6
	inc %g7
T78:
	brz,pt %g4,T79
	inc %g6
	inc %g7
T79:
	brlez,pt %g4,T80
	inc %g6
	inc %g7
T80:
	brlz,pt %g4,T81
	inc %g6
	inc %g7
T81:
	brnz,pt %g4,T82
	inc %g6
	inc %g7
T82:
	brgz,pt %g4,T83
	inc %g6
	inc %g7
T83:
	brgez,pt %g4,T84
	inc %g6
	inc %g7
T84:
	brz,pn %g4,T85
	inc %g6
	inc %g7
T85:
	brlez,pn %g4,T86
	inc %g6
	inc %g7
T86:
	brlz,pn %g4,T87
	inc %g6
	inc %g7
T87:
	brnz,pn %g4,T88
	inc %g6
	inc %g7
T88:
	brgz,pn %g4,T89
	inc %g6
	inc %g7
T89:
	brgez,pn %g4,T90
	inc %g6
	inc %g7
T90:
	brz,a %g4,T91
	inc %g6
	inc %g7
T91:
	brlez,a %g4,T92
	inc %g6
	inc %g7
T92:
	brlz,a %g4,T93
	inc %g6
	inc %g7
T93:
	brnz,a %g4,T94
	inc %g6
	inc %g7
T94:
	brgz,a %g4,T95
	inc %g6
	inc %g7
T95:
	brgez,a %g4,T96
	inc %g6
	inc %g7
T96:
	brz,a,pt %g4,T97
	inc %g6
	inc %g7
T97:
	brlez,a,pt %g4,T98
	inc %g6
	inc %g7
T98:
	brlz,a,pt %g4,T99
	inc %g6
	inc %g7
T99:
	brnz,a,pt %g4,T100
	inc %g6
	inc %g7
T100:
	brgz,a,pt %g4,T101
	inc %g6
	inc %g7
T101:
	brgez,a,pt %g4,T102
	inc %g6
	inc %g7
T102:
	brz,a,pn %g4,T103
	inc %g6
	inc %g7
T103:
	brlez,a,pn %g4,T104
	inc %g6
	inc %g7
T104:
	brlz,a,pn %g4,T105
	inc %g6
	inc %g7
T105:
	brnz,a,pn %g4,T106
	inc %g6
	inc %g7
T106:
	brgz,a,pn %g4,T107
	inc %g6
	inc %g7
T107:
	brgez,a,pn %g4,T108
	inc %g6
	inc %g7
T108:

!good_trap:
!    b good_trap
EXIT_GOOD
    nop
    nop
	
	

!SECTION .DATA TEXT_VA = 0xffffff0000000000
!attr_text {
!    Name=.DATA,
!    hypervisor
!}

.data
.xword 0x0
.xword 0x1
.xword 0x2
.xword 0x3
.xword 0x4
.xword 0x5
.xword 0x6
.xword 0x7

.end


