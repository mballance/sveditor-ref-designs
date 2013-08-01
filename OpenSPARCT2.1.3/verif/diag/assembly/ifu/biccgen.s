/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: biccgen.s
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

    setx 0xfffffffffffffffa, %g1, %g2
    setx 0x8000000080000001, %g1, %g3
    setx 0x8000000080000001, %g1, %g4
    setx 0x0000000000000008, %g1, %g5
	
    setx 0x0000000000000000, %g1, %g6
    setx 0x0000000000000000, %g1, %g7

    ! Now do some useful stuff ..
	nop
	nop


	
T0:
	ba T1
	inc %g6
	inc %g7
T1:
	bn T2
	inc %g6
	inc %g7
T2:
	bne T3
	inc %g6
	inc %g7
T3:
	be T4
	inc %g6
	inc %g7
T4:
	bg T5
	inc %g6
	inc %g7
T5:
	ble T6
	inc %g6
	inc %g7
T6:
	bge T7
	inc %g6
	inc %g7
T7:
	bl T8
	inc %g6
	inc %g7
T8:
	bgu T9
	inc %g6
	inc %g7
T9:
	bleu T10
	inc %g6
	inc %g7
T10:
	bcc T11
	inc %g6
	inc %g7
T11:
	bcs T12
	inc %g6
	inc %g7
T12:
	bpos T13
	inc %g6
	inc %g7
T13:
	bneg T14
	inc %g6
	inc %g7
T14:
	bvc T15
	inc %g6
	inc %g7
T15:
	bvs T16
	inc %g6
	inc %g7
T16:
	ba,a T17
	inc %g6
	inc %g7
T17:
	bn,a T18
	inc %g6
	inc %g7
T18:
	bne,a T19
	inc %g6
	inc %g7
T19:
	be,a T20
	inc %g6
	inc %g7
T20:
	bg,a T21
	inc %g6
	inc %g7
T21:
	ble,a T22
	inc %g6
	inc %g7
T22:
	bge,a T23
	inc %g6
	inc %g7
T23:
	bl,a T24
	inc %g6
	inc %g7
T24:
	bgu,a T25
	inc %g6
	inc %g7
T25:
	bleu,a T26
	inc %g6
	inc %g7
T26:
	bcc,a T27
	inc %g6
	inc %g7
T27:
	bcs,a T28
	inc %g6
	inc %g7
T28:
	bpos,a T29
	inc %g6
	inc %g7
T29:
	bneg,a T30
	inc %g6
	inc %g7
T30:
	bvc,a T31
	inc %g6
	inc %g7
T31:
	bvs,a T32
	inc %g6
	inc %g7

	addcc %g0, 0x1fff, %g1
T32:
	ba T33
	inc %g6
	inc %g7
T33:
	bn T34
	inc %g6
	inc %g7
T34:
	bne T35
	inc %g6
	inc %g7
T35:
	be T36
	inc %g6
	inc %g7
T36:
	bg T37
	inc %g6
	inc %g7
T37:
	ble T38
	inc %g6
	inc %g7
T38:
	bge T39
	inc %g6
	inc %g7
T39:
	bl T40
	inc %g6
	inc %g7
T40:
	bgu T41
	inc %g6
	inc %g7
T41:
	bleu T42
	inc %g6
	inc %g7
T42:
	bcc T43
	inc %g6
	inc %g7
T43:
	bcs T44
	inc %g6
	inc %g7
T44:
	bpos T45
	inc %g6
	inc %g7
T45:
	bneg T46
	inc %g6
	inc %g7
T46:
	bvc T47
	inc %g6
	inc %g7
T47:
	bvs T48
	inc %g6
	inc %g7
T48:
	ba,a T49
	inc %g6
	inc %g7
T49:
	bn,a T50
	inc %g6
	inc %g7
T50:
	bne,a T51
	inc %g6
	inc %g7
T51:
	be,a T52
	inc %g6
	inc %g7
T52:
	bg,a T53
	inc %g6
	inc %g7
T53:
	ble,a T54
	inc %g6
	inc %g7
T54:
	bge,a T55
	inc %g6
	inc %g7
T55:
	bl,a T56
	inc %g6
	inc %g7
T56:
	bgu,a T57
	inc %g6
	inc %g7
T57:
	bleu,a T58
	inc %g6
	inc %g7
T58:
	bcc,a T59
	inc %g6
	inc %g7
T59:
	bcs,a T60
	inc %g6
	inc %g7
T60:
	bpos,a T61
	inc %g6
	inc %g7
T61:
	bneg,a T62
	inc %g6
	inc %g7
T62:
	bvc,a T63
	inc %g6
	inc %g7
T63:
	bvs,a T64
	inc %g6
	inc %g7

	addcc %g0, 0x0, %g1
T64:
	ba T65
	inc %g6
	inc %g7
T65:
	bn T66
	inc %g6
	inc %g7
T66:
	bne T67
	inc %g6
	inc %g7
T67:
	be T68
	inc %g6
	inc %g7
T68:
	bg T69
	inc %g6
	inc %g7
T69:
	ble T70
	inc %g6
	inc %g7
T70:
	bge T71
	inc %g6
	inc %g7
T71:
	bl T72
	inc %g6
	inc %g7
T72:
	bgu T73
	inc %g6
	inc %g7
T73:
	bleu T74
	inc %g6
	inc %g7
T74:
	bcc T75
	inc %g6
	inc %g7
T75:
	bcs T76
	inc %g6
	inc %g7
T76:
	bpos T77
	inc %g6
	inc %g7
T77:
	bneg T78
	inc %g6
	inc %g7
T78:
	bvc T79
	inc %g6
	inc %g7
T79:
	bvs T80
	inc %g6
	inc %g7
T80:
	ba,a T81
	inc %g6
	inc %g7
T81:
	bn,a T82
	inc %g6
	inc %g7
T82:
	bne,a T83
	inc %g6
	inc %g7
T83:
	be,a T84
	inc %g6
	inc %g7
T84:
	bg,a T85
	inc %g6
	inc %g7
T85:
	ble,a T86
	inc %g6
	inc %g7
T86:
	bge,a T87
	inc %g6
	inc %g7
T87:
	bl,a T88
	inc %g6
	inc %g7
T88:
	bgu,a T89
	inc %g6
	inc %g7
T89:
	bleu,a T90
	inc %g6
	inc %g7
T90:
	bcc,a T91
	inc %g6
	inc %g7
T91:
	bcs,a T92
	inc %g6
	inc %g7
T92:
	bpos,a T93
	inc %g6
	inc %g7
T93:
	bneg,a T94
	inc %g6
	inc %g7
T94:
	bvc,a T95
	inc %g6
	inc %g7
T95:
	bvs,a T96
	inc %g6
	inc %g7

	addcc %g2, %g5, %g1
T96:
	ba T97
	inc %g6
	inc %g7
T97:
	bn T98
	inc %g6
	inc %g7
T98:
	bne T99
	inc %g6
	inc %g7
T99:
	be T100
	inc %g6
	inc %g7
T100:
	bg T101
	inc %g6
	inc %g7
T101:
	ble T102
	inc %g6
	inc %g7
T102:
	bge T103
	inc %g6
	inc %g7
T103:
	bl T104
	inc %g6
	inc %g7
T104:
	bgu T105
	inc %g6
	inc %g7
T105:
	bleu T106
	inc %g6
	inc %g7
T106:
	bcc T107
	inc %g6
	inc %g7
T107:
	bcs T108
	inc %g6
	inc %g7
T108:
	bpos T109
	inc %g6
	inc %g7
T109:
	bneg T110
	inc %g6
	inc %g7
T110:
	bvc T111
	inc %g6
	inc %g7
T111:
	bvs T112
	inc %g6
	inc %g7
T112:
	ba,a T113
	inc %g6
	inc %g7
T113:
	bn,a T114
	inc %g6
	inc %g7
T114:
	bne,a T115
	inc %g6
	inc %g7
T115:
	be,a T116
	inc %g6
	inc %g7
T116:
	bg,a T117
	inc %g6
	inc %g7
T117:
	ble,a T118
	inc %g6
	inc %g7
T118:
	bge,a T119
	inc %g6
	inc %g7
T119:
	bl,a T120
	inc %g6
	inc %g7
T120:
	bgu,a T121
	inc %g6
	inc %g7
T121:
	bleu,a T122
	inc %g6
	inc %g7
T122:
	bcc,a T123
	inc %g6
	inc %g7
T123:
	bcs,a T124
	inc %g6
	inc %g7
T124:
	bpos,a T125
	inc %g6
	inc %g7
T125:
	bneg,a T126
	inc %g6
	inc %g7
T126:
	bvc,a T127
	inc %g6
	inc %g7
T127:
	bvs,a T128
	inc %g6
	inc %g7

	addcc %g3, %g4, %g1
T128:
	ba T129
	inc %g6
	inc %g7
T129:
	bn T130
	inc %g6
	inc %g7
T130:
	bne T131
	inc %g6
	inc %g7
T131:
	be T132
	inc %g6
	inc %g7
T132:
	bg T133
	inc %g6
	inc %g7
T133:
	ble T134
	inc %g6
	inc %g7
T134:
	bge T135
	inc %g6
	inc %g7
T135:
	bl T136
	inc %g6
	inc %g7
T136:
	bgu T137
	inc %g6
	inc %g7
T137:
	bleu T138
	inc %g6
	inc %g7
T138:
	bcc T139
	inc %g6
	inc %g7
T139:
	bcs T140
	inc %g6
	inc %g7
T140:
	bpos T141
	inc %g6
	inc %g7
T141:
	bneg T142
	inc %g6
	inc %g7
T142:
	bvc T143
	inc %g6
	inc %g7
T143:
	bvs T144
	inc %g6
	inc %g7
T144:
	ba,a T145
	inc %g6
	inc %g7
T145:
	bn,a T146
	inc %g6
	inc %g7
T146:
	bne,a T147
	inc %g6
	inc %g7
T147:
	be,a T148
	inc %g6
	inc %g7
T148:
	bg,a T149
	inc %g6
	inc %g7
T149:
	ble,a T150
	inc %g6
	inc %g7
T150:
	bge,a T151
	inc %g6
	inc %g7
T151:
	bl,a T152
	inc %g6
	inc %g7
T152:
	bgu,a T153
	inc %g6
	inc %g7
T153:
	bleu,a T154
	inc %g6
	inc %g7
T154:
	bcc,a T155
	inc %g6
	inc %g7
T155:
	bcs,a T156
	inc %g6
	inc %g7
T156:
	bpos,a T157
	inc %g6
	inc %g7
T157:
	bneg,a T158
	inc %g6
	inc %g7
T158:
	bvc,a T159
	inc %g6
	inc %g7
T159:
	bvs,a T160
	inc %g6
	inc %g7
T160:

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


