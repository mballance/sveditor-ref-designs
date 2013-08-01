/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: bpccgen.s
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
	ba,pt %icc,T1
	inc %g6
	inc %g7
T1:
	bn,pt %icc,T2
	inc %g6
	inc %g7
T2:
	bne,pt %icc,T3
	inc %g6
	inc %g7
T3:
	be,pt %icc,T4
	inc %g6
	inc %g7
T4:
	bg,pt %icc,T5
	inc %g6
	inc %g7
T5:
	ble,pt %icc,T6
	inc %g6
	inc %g7
T6:
	bge,pt %icc,T7
	inc %g6
	inc %g7
T7:
	bl,pt %icc,T8
	inc %g6
	inc %g7
T8:
	bgu,pt %icc,T9
	inc %g6
	inc %g7
T9:
	bleu,pt %icc,T10
	inc %g6
	inc %g7
T10:
	bcc,pt %icc,T11
	inc %g6
	inc %g7
T11:
	bcs,pt %icc,T12
	inc %g6
	inc %g7
T12:
	bpos,pt %icc,T13
	inc %g6
	inc %g7
T13:
	bneg,pt %icc,T14
	inc %g6
	inc %g7
T14:
	bvc,pt %icc,T15
	inc %g6
	inc %g7
T15:
	bvs,pt %icc,T16
	inc %g6
	inc %g7
T16:
	ba,a,pt %icc,T17
	inc %g6
	inc %g7
T17:
	bn,a,pt %icc,T18
	inc %g6
	inc %g7
T18:
	bne,a,pt %icc,T19
	inc %g6
	inc %g7
T19:
	be,a,pt %icc,T20
	inc %g6
	inc %g7
T20:
	bg,a,pt %icc,T21
	inc %g6
	inc %g7
T21:
	ble,a,pt %icc,T22
	inc %g6
	inc %g7
T22:
	bge,a,pt %icc,T23
	inc %g6
	inc %g7
T23:
	bl,a,pt %icc,T24
	inc %g6
	inc %g7
T24:
	bgu,a,pt %icc,T25
	inc %g6
	inc %g7
T25:
	bleu,a,pt %icc,T26
	inc %g6
	inc %g7
T26:
	bcc,a,pt %icc,T27
	inc %g6
	inc %g7
T27:
	bcs,a,pt %icc,T28
	inc %g6
	inc %g7
T28:
	bpos,a,pt %icc,T29
	inc %g6
	inc %g7
T29:
	bneg,a,pt %icc,T30
	inc %g6
	inc %g7
T30:
	bvc,a,pt %icc,T31
	inc %g6
	inc %g7
T31:
	bvs,a,pt %icc,T32
	inc %g6
	inc %g7
T32:
	ba,pn %icc,T33
	inc %g6
	inc %g7
T33:
	bn,pn %icc,T34
	inc %g6
	inc %g7
T34:
	bne,pn %icc,T35
	inc %g6
	inc %g7
T35:
	be,pn %icc,T36
	inc %g6
	inc %g7
T36:
	bg,pn %icc,T37
	inc %g6
	inc %g7
T37:
	ble,pn %icc,T38
	inc %g6
	inc %g7
T38:
	bge,pn %icc,T39
	inc %g6
	inc %g7
T39:
	bl,pn %icc,T40
	inc %g6
	inc %g7
T40:
	bgu,pn %icc,T41
	inc %g6
	inc %g7
T41:
	bleu,pn %icc,T42
	inc %g6
	inc %g7
T42:
	bcc,pn %icc,T43
	inc %g6
	inc %g7
T43:
	bcs,pn %icc,T44
	inc %g6
	inc %g7
T44:
	bpos,pn %icc,T45
	inc %g6
	inc %g7
T45:
	bneg,pn %icc,T46
	inc %g6
	inc %g7
T46:
	bvc,pn %icc,T47
	inc %g6
	inc %g7
T47:
	bvs,pn %icc,T48
	inc %g6
	inc %g7
T48:
	ba,a,pn %icc,T49
	inc %g6
	inc %g7
T49:
	bn,a,pn %icc,T50
	inc %g6
	inc %g7
T50:
	bne,a,pn %icc,T51
	inc %g6
	inc %g7
T51:
	be,a,pn %icc,T52
	inc %g6
	inc %g7
T52:
	bg,a,pn %icc,T53
	inc %g6
	inc %g7
T53:
	ble,a,pn %icc,T54
	inc %g6
	inc %g7
T54:
	bge,a,pn %icc,T55
	inc %g6
	inc %g7
T55:
	bl,a,pn %icc,T56
	inc %g6
	inc %g7
T56:
	bgu,a,pn %icc,T57
	inc %g6
	inc %g7
T57:
	bleu,a,pn %icc,T58
	inc %g6
	inc %g7
T58:
	bcc,a,pn %icc,T59
	inc %g6
	inc %g7
T59:
	bcs,a,pn %icc,T60
	inc %g6
	inc %g7
T60:
	bpos,a,pn %icc,T61
	inc %g6
	inc %g7
T61:
	bneg,a,pn %icc,T62
	inc %g6
	inc %g7
T62:
	bvc,a,pn %icc,T63
	inc %g6
	inc %g7
T63:
	bvs,a,pn %icc,T64
	inc %g6
	inc %g7
T64:
	ba,pt %xcc,T65
	inc %g6
	inc %g7
T65:
	bn,pt %xcc,T66
	inc %g6
	inc %g7
T66:
	bne,pt %xcc,T67
	inc %g6
	inc %g7
T67:
	be,pt %xcc,T68
	inc %g6
	inc %g7
T68:
	bg,pt %xcc,T69
	inc %g6
	inc %g7
T69:
	ble,pt %xcc,T70
	inc %g6
	inc %g7
T70:
	bge,pt %xcc,T71
	inc %g6
	inc %g7
T71:
	bl,pt %xcc,T72
	inc %g6
	inc %g7
T72:
	bgu,pt %xcc,T73
	inc %g6
	inc %g7
T73:
	bleu,pt %xcc,T74
	inc %g6
	inc %g7
T74:
	bcc,pt %xcc,T75
	inc %g6
	inc %g7
T75:
	bcs,pt %xcc,T76
	inc %g6
	inc %g7
T76:
	bpos,pt %xcc,T77
	inc %g6
	inc %g7
T77:
	bneg,pt %xcc,T78
	inc %g6
	inc %g7
T78:
	bvc,pt %xcc,T79
	inc %g6
	inc %g7
T79:
	bvs,pt %xcc,T80
	inc %g6
	inc %g7
T80:
	ba,a,pt %xcc,T81
	inc %g6
	inc %g7
T81:
	bn,a,pt %xcc,T82
	inc %g6
	inc %g7
T82:
	bne,a,pt %xcc,T83
	inc %g6
	inc %g7
T83:
	be,a,pt %xcc,T84
	inc %g6
	inc %g7
T84:
	bg,a,pt %xcc,T85
	inc %g6
	inc %g7
T85:
	ble,a,pt %xcc,T86
	inc %g6
	inc %g7
T86:
	bge,a,pt %xcc,T87
	inc %g6
	inc %g7
T87:
	bl,a,pt %xcc,T88
	inc %g6
	inc %g7
T88:
	bgu,a,pt %xcc,T89
	inc %g6
	inc %g7
T89:
	bleu,a,pt %xcc,T90
	inc %g6
	inc %g7
T90:
	bcc,a,pt %xcc,T91
	inc %g6
	inc %g7
T91:
	bcs,a,pt %xcc,T92
	inc %g6
	inc %g7
T92:
	bpos,a,pt %xcc,T93
	inc %g6
	inc %g7
T93:
	bneg,a,pt %xcc,T94
	inc %g6
	inc %g7
T94:
	bvc,a,pt %xcc,T95
	inc %g6
	inc %g7
T95:
	bvs,a,pt %xcc,T96
	inc %g6
	inc %g7
T96:
	ba,pn %xcc,T97
	inc %g6
	inc %g7
T97:
	bn,pn %xcc,T98
	inc %g6
	inc %g7
T98:
	bne,pn %xcc,T99
	inc %g6
	inc %g7
T99:
	be,pn %xcc,T100
	inc %g6
	inc %g7
T100:
	bg,pn %xcc,T101
	inc %g6
	inc %g7
T101:
	ble,pn %xcc,T102
	inc %g6
	inc %g7
T102:
	bge,pn %xcc,T103
	inc %g6
	inc %g7
T103:
	bl,pn %xcc,T104
	inc %g6
	inc %g7
T104:
	bgu,pn %xcc,T105
	inc %g6
	inc %g7
T105:
	bleu,pn %xcc,T106
	inc %g6
	inc %g7
T106:
	bcc,pn %xcc,T107
	inc %g6
	inc %g7
T107:
	bcs,pn %xcc,T108
	inc %g6
	inc %g7
T108:
	bpos,pn %xcc,T109
	inc %g6
	inc %g7
T109:
	bneg,pn %xcc,T110
	inc %g6
	inc %g7
T110:
	bvc,pn %xcc,T111
	inc %g6
	inc %g7
T111:
	bvs,pn %xcc,T112
	inc %g6
	inc %g7
T112:
	ba,a,pn %xcc,T113
	inc %g6
	inc %g7
T113:
	bn,a,pn %xcc,T114
	inc %g6
	inc %g7
T114:
	bne,a,pn %xcc,T115
	inc %g6
	inc %g7
T115:
	be,a,pn %xcc,T116
	inc %g6
	inc %g7
T116:
	bg,a,pn %xcc,T117
	inc %g6
	inc %g7
T117:
	ble,a,pn %xcc,T118
	inc %g6
	inc %g7
T118:
	bge,a,pn %xcc,T119
	inc %g6
	inc %g7
T119:
	bl,a,pn %xcc,T120
	inc %g6
	inc %g7
T120:
	bgu,a,pn %xcc,T121
	inc %g6
	inc %g7
T121:
	bleu,a,pn %xcc,T122
	inc %g6
	inc %g7
T122:
	bcc,a,pn %xcc,T123
	inc %g6
	inc %g7
T123:
	bcs,a,pn %xcc,T124
	inc %g6
	inc %g7
T124:
	bpos,a,pn %xcc,T125
	inc %g6
	inc %g7
T125:
	bneg,a,pn %xcc,T126
	inc %g6
	inc %g7
T126:
	bvc,a,pn %xcc,T127
	inc %g6
	inc %g7
T127:
	bvs,a,pn %xcc,T128
	inc %g6
	inc %g7

	addcc %g0, 0x1fff, %g1
T128:
	ba,pt %icc,T129
	inc %g6
	inc %g7
T129:
	bn,pt %icc,T130
	inc %g6
	inc %g7
T130:
	bne,pt %icc,T131
	inc %g6
	inc %g7
T131:
	be,pt %icc,T132
	inc %g6
	inc %g7
T132:
	bg,pt %icc,T133
	inc %g6
	inc %g7
T133:
	ble,pt %icc,T134
	inc %g6
	inc %g7
T134:
	bge,pt %icc,T135
	inc %g6
	inc %g7
T135:
	bl,pt %icc,T136
	inc %g6
	inc %g7
T136:
	bgu,pt %icc,T137
	inc %g6
	inc %g7
T137:
	bleu,pt %icc,T138
	inc %g6
	inc %g7
T138:
	bcc,pt %icc,T139
	inc %g6
	inc %g7
T139:
	bcs,pt %icc,T140
	inc %g6
	inc %g7
T140:
	bpos,pt %icc,T141
	inc %g6
	inc %g7
T141:
	bneg,pt %icc,T142
	inc %g6
	inc %g7
T142:
	bvc,pt %icc,T143
	inc %g6
	inc %g7
T143:
	bvs,pt %icc,T144
	inc %g6
	inc %g7
T144:
	ba,a,pt %icc,T145
	inc %g6
	inc %g7
T145:
	bn,a,pt %icc,T146
	inc %g6
	inc %g7
T146:
	bne,a,pt %icc,T147
	inc %g6
	inc %g7
T147:
	be,a,pt %icc,T148
	inc %g6
	inc %g7
T148:
	bg,a,pt %icc,T149
	inc %g6
	inc %g7
T149:
	ble,a,pt %icc,T150
	inc %g6
	inc %g7
T150:
	bge,a,pt %icc,T151
	inc %g6
	inc %g7
T151:
	bl,a,pt %icc,T152
	inc %g6
	inc %g7
T152:
	bgu,a,pt %icc,T153
	inc %g6
	inc %g7
T153:
	bleu,a,pt %icc,T154
	inc %g6
	inc %g7
T154:
	bcc,a,pt %icc,T155
	inc %g6
	inc %g7
T155:
	bcs,a,pt %icc,T156
	inc %g6
	inc %g7
T156:
	bpos,a,pt %icc,T157
	inc %g6
	inc %g7
T157:
	bneg,a,pt %icc,T158
	inc %g6
	inc %g7
T158:
	bvc,a,pt %icc,T159
	inc %g6
	inc %g7
T159:
	bvs,a,pt %icc,T160
	inc %g6
	inc %g7
T160:
	ba,pn %icc,T161
	inc %g6
	inc %g7
T161:
	bn,pn %icc,T162
	inc %g6
	inc %g7
T162:
	bne,pn %icc,T163
	inc %g6
	inc %g7
T163:
	be,pn %icc,T164
	inc %g6
	inc %g7
T164:
	bg,pn %icc,T165
	inc %g6
	inc %g7
T165:
	ble,pn %icc,T166
	inc %g6
	inc %g7
T166:
	bge,pn %icc,T167
	inc %g6
	inc %g7
T167:
	bl,pn %icc,T168
	inc %g6
	inc %g7
T168:
	bgu,pn %icc,T169
	inc %g6
	inc %g7
T169:
	bleu,pn %icc,T170
	inc %g6
	inc %g7
T170:
	bcc,pn %icc,T171
	inc %g6
	inc %g7
T171:
	bcs,pn %icc,T172
	inc %g6
	inc %g7
T172:
	bpos,pn %icc,T173
	inc %g6
	inc %g7
T173:
	bneg,pn %icc,T174
	inc %g6
	inc %g7
T174:
	bvc,pn %icc,T175
	inc %g6
	inc %g7
T175:
	bvs,pn %icc,T176
	inc %g6
	inc %g7
T176:
	ba,a,pn %icc,T177
	inc %g6
	inc %g7
T177:
	bn,a,pn %icc,T178
	inc %g6
	inc %g7
T178:
	bne,a,pn %icc,T179
	inc %g6
	inc %g7
T179:
	be,a,pn %icc,T180
	inc %g6
	inc %g7
T180:
	bg,a,pn %icc,T181
	inc %g6
	inc %g7
T181:
	ble,a,pn %icc,T182
	inc %g6
	inc %g7
T182:
	bge,a,pn %icc,T183
	inc %g6
	inc %g7
T183:
	bl,a,pn %icc,T184
	inc %g6
	inc %g7
T184:
	bgu,a,pn %icc,T185
	inc %g6
	inc %g7
T185:
	bleu,a,pn %icc,T186
	inc %g6
	inc %g7
T186:
	bcc,a,pn %icc,T187
	inc %g6
	inc %g7
T187:
	bcs,a,pn %icc,T188
	inc %g6
	inc %g7
T188:
	bpos,a,pn %icc,T189
	inc %g6
	inc %g7
T189:
	bneg,a,pn %icc,T190
	inc %g6
	inc %g7
T190:
	bvc,a,pn %icc,T191
	inc %g6
	inc %g7
T191:
	bvs,a,pn %icc,T192
	inc %g6
	inc %g7
T192:
	ba,pt %xcc,T193
	inc %g6
	inc %g7
T193:
	bn,pt %xcc,T194
	inc %g6
	inc %g7
T194:
	bne,pt %xcc,T195
	inc %g6
	inc %g7
T195:
	be,pt %xcc,T196
	inc %g6
	inc %g7
T196:
	bg,pt %xcc,T197
	inc %g6
	inc %g7
T197:
	ble,pt %xcc,T198
	inc %g6
	inc %g7
T198:
	bge,pt %xcc,T199
	inc %g6
	inc %g7
T199:
	bl,pt %xcc,T200
	inc %g6
	inc %g7
T200:
	bgu,pt %xcc,T201
	inc %g6
	inc %g7
T201:
	bleu,pt %xcc,T202
	inc %g6
	inc %g7
T202:
	bcc,pt %xcc,T203
	inc %g6
	inc %g7
T203:
	bcs,pt %xcc,T204
	inc %g6
	inc %g7
T204:
	bpos,pt %xcc,T205
	inc %g6
	inc %g7
T205:
	bneg,pt %xcc,T206
	inc %g6
	inc %g7
T206:
	bvc,pt %xcc,T207
	inc %g6
	inc %g7
T207:
	bvs,pt %xcc,T208
	inc %g6
	inc %g7
T208:
	ba,a,pt %xcc,T209
	inc %g6
	inc %g7
T209:
	bn,a,pt %xcc,T210
	inc %g6
	inc %g7
T210:
	bne,a,pt %xcc,T211
	inc %g6
	inc %g7
T211:
	be,a,pt %xcc,T212
	inc %g6
	inc %g7
T212:
	bg,a,pt %xcc,T213
	inc %g6
	inc %g7
T213:
	ble,a,pt %xcc,T214
	inc %g6
	inc %g7
T214:
	bge,a,pt %xcc,T215
	inc %g6
	inc %g7
T215:
	bl,a,pt %xcc,T216
	inc %g6
	inc %g7
T216:
	bgu,a,pt %xcc,T217
	inc %g6
	inc %g7
T217:
	bleu,a,pt %xcc,T218
	inc %g6
	inc %g7
T218:
	bcc,a,pt %xcc,T219
	inc %g6
	inc %g7
T219:
	bcs,a,pt %xcc,T220
	inc %g6
	inc %g7
T220:
	bpos,a,pt %xcc,T221
	inc %g6
	inc %g7
T221:
	bneg,a,pt %xcc,T222
	inc %g6
	inc %g7
T222:
	bvc,a,pt %xcc,T223
	inc %g6
	inc %g7
T223:
	bvs,a,pt %xcc,T224
	inc %g6
	inc %g7
T224:
	ba,pn %xcc,T225
	inc %g6
	inc %g7
T225:
	bn,pn %xcc,T226
	inc %g6
	inc %g7
T226:
	bne,pn %xcc,T227
	inc %g6
	inc %g7
T227:
	be,pn %xcc,T228
	inc %g6
	inc %g7
T228:
	bg,pn %xcc,T229
	inc %g6
	inc %g7
T229:
	ble,pn %xcc,T230
	inc %g6
	inc %g7
T230:
	bge,pn %xcc,T231
	inc %g6
	inc %g7
T231:
	bl,pn %xcc,T232
	inc %g6
	inc %g7
T232:
	bgu,pn %xcc,T233
	inc %g6
	inc %g7
T233:
	bleu,pn %xcc,T234
	inc %g6
	inc %g7
T234:
	bcc,pn %xcc,T235
	inc %g6
	inc %g7
T235:
	bcs,pn %xcc,T236
	inc %g6
	inc %g7
T236:
	bpos,pn %xcc,T237
	inc %g6
	inc %g7
T237:
	bneg,pn %xcc,T238
	inc %g6
	inc %g7
T238:
	bvc,pn %xcc,T239
	inc %g6
	inc %g7
T239:
	bvs,pn %xcc,T240
	inc %g6
	inc %g7
T240:
	ba,a,pn %xcc,T241
	inc %g6
	inc %g7
T241:
	bn,a,pn %xcc,T242
	inc %g6
	inc %g7
T242:
	bne,a,pn %xcc,T243
	inc %g6
	inc %g7
T243:
	be,a,pn %xcc,T244
	inc %g6
	inc %g7
T244:
	bg,a,pn %xcc,T245
	inc %g6
	inc %g7
T245:
	ble,a,pn %xcc,T246
	inc %g6
	inc %g7
T246:
	bge,a,pn %xcc,T247
	inc %g6
	inc %g7
T247:
	bl,a,pn %xcc,T248
	inc %g6
	inc %g7
T248:
	bgu,a,pn %xcc,T249
	inc %g6
	inc %g7
T249:
	bleu,a,pn %xcc,T250
	inc %g6
	inc %g7
T250:
	bcc,a,pn %xcc,T251
	inc %g6
	inc %g7
T251:
	bcs,a,pn %xcc,T252
	inc %g6
	inc %g7
T252:
	bpos,a,pn %xcc,T253
	inc %g6
	inc %g7
T253:
	bneg,a,pn %xcc,T254
	inc %g6
	inc %g7
T254:
	bvc,a,pn %xcc,T255
	inc %g6
	inc %g7
T255:
	bvs,a,pn %xcc,T256
	inc %g6
	inc %g7

	addcc %g0, 0x0, %g1
T256:
	ba,pt %icc,T257
	inc %g6
	inc %g7
T257:
	bn,pt %icc,T258
	inc %g6
	inc %g7
T258:
	bne,pt %icc,T259
	inc %g6
	inc %g7
T259:
	be,pt %icc,T260
	inc %g6
	inc %g7
T260:
	bg,pt %icc,T261
	inc %g6
	inc %g7
T261:
	ble,pt %icc,T262
	inc %g6
	inc %g7
T262:
	bge,pt %icc,T263
	inc %g6
	inc %g7
T263:
	bl,pt %icc,T264
	inc %g6
	inc %g7
T264:
	bgu,pt %icc,T265
	inc %g6
	inc %g7
T265:
	bleu,pt %icc,T266
	inc %g6
	inc %g7
T266:
	bcc,pt %icc,T267
	inc %g6
	inc %g7
T267:
	bcs,pt %icc,T268
	inc %g6
	inc %g7
T268:
	bpos,pt %icc,T269
	inc %g6
	inc %g7
T269:
	bneg,pt %icc,T270
	inc %g6
	inc %g7
T270:
	bvc,pt %icc,T271
	inc %g6
	inc %g7
T271:
	bvs,pt %icc,T272
	inc %g6
	inc %g7
T272:
	ba,a,pt %icc,T273
	inc %g6
	inc %g7
T273:
	bn,a,pt %icc,T274
	inc %g6
	inc %g7
T274:
	bne,a,pt %icc,T275
	inc %g6
	inc %g7
T275:
	be,a,pt %icc,T276
	inc %g6
	inc %g7
T276:
	bg,a,pt %icc,T277
	inc %g6
	inc %g7
T277:
	ble,a,pt %icc,T278
	inc %g6
	inc %g7
T278:
	bge,a,pt %icc,T279
	inc %g6
	inc %g7
T279:
	bl,a,pt %icc,T280
	inc %g6
	inc %g7
T280:
	bgu,a,pt %icc,T281
	inc %g6
	inc %g7
T281:
	bleu,a,pt %icc,T282
	inc %g6
	inc %g7
T282:
	bcc,a,pt %icc,T283
	inc %g6
	inc %g7
T283:
	bcs,a,pt %icc,T284
	inc %g6
	inc %g7
T284:
	bpos,a,pt %icc,T285
	inc %g6
	inc %g7
T285:
	bneg,a,pt %icc,T286
	inc %g6
	inc %g7
T286:
	bvc,a,pt %icc,T287
	inc %g6
	inc %g7
T287:
	bvs,a,pt %icc,T288
	inc %g6
	inc %g7
T288:
	ba,pn %icc,T289
	inc %g6
	inc %g7
T289:
	bn,pn %icc,T290
	inc %g6
	inc %g7
T290:
	bne,pn %icc,T291
	inc %g6
	inc %g7
T291:
	be,pn %icc,T292
	inc %g6
	inc %g7
T292:
	bg,pn %icc,T293
	inc %g6
	inc %g7
T293:
	ble,pn %icc,T294
	inc %g6
	inc %g7
T294:
	bge,pn %icc,T295
	inc %g6
	inc %g7
T295:
	bl,pn %icc,T296
	inc %g6
	inc %g7
T296:
	bgu,pn %icc,T297
	inc %g6
	inc %g7
T297:
	bleu,pn %icc,T298
	inc %g6
	inc %g7
T298:
	bcc,pn %icc,T299
	inc %g6
	inc %g7
T299:
	bcs,pn %icc,T300
	inc %g6
	inc %g7
T300:
	bpos,pn %icc,T301
	inc %g6
	inc %g7
T301:
	bneg,pn %icc,T302
	inc %g6
	inc %g7
T302:
	bvc,pn %icc,T303
	inc %g6
	inc %g7
T303:
	bvs,pn %icc,T304
	inc %g6
	inc %g7
T304:
	ba,a,pn %icc,T305
	inc %g6
	inc %g7
T305:
	bn,a,pn %icc,T306
	inc %g6
	inc %g7
T306:
	bne,a,pn %icc,T307
	inc %g6
	inc %g7
T307:
	be,a,pn %icc,T308
	inc %g6
	inc %g7
T308:
	bg,a,pn %icc,T309
	inc %g6
	inc %g7
T309:
	ble,a,pn %icc,T310
	inc %g6
	inc %g7
T310:
	bge,a,pn %icc,T311
	inc %g6
	inc %g7
T311:
	bl,a,pn %icc,T312
	inc %g6
	inc %g7
T312:
	bgu,a,pn %icc,T313
	inc %g6
	inc %g7
T313:
	bleu,a,pn %icc,T314
	inc %g6
	inc %g7
T314:
	bcc,a,pn %icc,T315
	inc %g6
	inc %g7
T315:
	bcs,a,pn %icc,T316
	inc %g6
	inc %g7
T316:
	bpos,a,pn %icc,T317
	inc %g6
	inc %g7
T317:
	bneg,a,pn %icc,T318
	inc %g6
	inc %g7
T318:
	bvc,a,pn %icc,T319
	inc %g6
	inc %g7
T319:
	bvs,a,pn %icc,T320
	inc %g6
	inc %g7
T320:
	ba,pt %xcc,T321
	inc %g6
	inc %g7
T321:
	bn,pt %xcc,T322
	inc %g6
	inc %g7
T322:
	bne,pt %xcc,T323
	inc %g6
	inc %g7
T323:
	be,pt %xcc,T324
	inc %g6
	inc %g7
T324:
	bg,pt %xcc,T325
	inc %g6
	inc %g7
T325:
	ble,pt %xcc,T326
	inc %g6
	inc %g7
T326:
	bge,pt %xcc,T327
	inc %g6
	inc %g7
T327:
	bl,pt %xcc,T328
	inc %g6
	inc %g7
T328:
	bgu,pt %xcc,T329
	inc %g6
	inc %g7
T329:
	bleu,pt %xcc,T330
	inc %g6
	inc %g7
T330:
	bcc,pt %xcc,T331
	inc %g6
	inc %g7
T331:
	bcs,pt %xcc,T332
	inc %g6
	inc %g7
T332:
	bpos,pt %xcc,T333
	inc %g6
	inc %g7
T333:
	bneg,pt %xcc,T334
	inc %g6
	inc %g7
T334:
	bvc,pt %xcc,T335
	inc %g6
	inc %g7
T335:
	bvs,pt %xcc,T336
	inc %g6
	inc %g7
T336:
	ba,a,pt %xcc,T337
	inc %g6
	inc %g7
T337:
	bn,a,pt %xcc,T338
	inc %g6
	inc %g7
T338:
	bne,a,pt %xcc,T339
	inc %g6
	inc %g7
T339:
	be,a,pt %xcc,T340
	inc %g6
	inc %g7
T340:
	bg,a,pt %xcc,T341
	inc %g6
	inc %g7
T341:
	ble,a,pt %xcc,T342
	inc %g6
	inc %g7
T342:
	bge,a,pt %xcc,T343
	inc %g6
	inc %g7
T343:
	bl,a,pt %xcc,T344
	inc %g6
	inc %g7
T344:
	bgu,a,pt %xcc,T345
	inc %g6
	inc %g7
T345:
	bleu,a,pt %xcc,T346
	inc %g6
	inc %g7
T346:
	bcc,a,pt %xcc,T347
	inc %g6
	inc %g7
T347:
	bcs,a,pt %xcc,T348
	inc %g6
	inc %g7
T348:
	bpos,a,pt %xcc,T349
	inc %g6
	inc %g7
T349:
	bneg,a,pt %xcc,T350
	inc %g6
	inc %g7
T350:
	bvc,a,pt %xcc,T351
	inc %g6
	inc %g7
T351:
	bvs,a,pt %xcc,T352
	inc %g6
	inc %g7
T352:
	ba,pn %xcc,T353
	inc %g6
	inc %g7
T353:
	bn,pn %xcc,T354
	inc %g6
	inc %g7
T354:
	bne,pn %xcc,T355
	inc %g6
	inc %g7
T355:
	be,pn %xcc,T356
	inc %g6
	inc %g7
T356:
	bg,pn %xcc,T357
	inc %g6
	inc %g7
T357:
	ble,pn %xcc,T358
	inc %g6
	inc %g7
T358:
	bge,pn %xcc,T359
	inc %g6
	inc %g7
T359:
	bl,pn %xcc,T360
	inc %g6
	inc %g7
T360:
	bgu,pn %xcc,T361
	inc %g6
	inc %g7
T361:
	bleu,pn %xcc,T362
	inc %g6
	inc %g7
T362:
	bcc,pn %xcc,T363
	inc %g6
	inc %g7
T363:
	bcs,pn %xcc,T364
	inc %g6
	inc %g7
T364:
	bpos,pn %xcc,T365
	inc %g6
	inc %g7
T365:
	bneg,pn %xcc,T366
	inc %g6
	inc %g7
T366:
	bvc,pn %xcc,T367
	inc %g6
	inc %g7
T367:
	bvs,pn %xcc,T368
	inc %g6
	inc %g7
T368:
	ba,a,pn %xcc,T369
	inc %g6
	inc %g7
T369:
	bn,a,pn %xcc,T370
	inc %g6
	inc %g7
T370:
	bne,a,pn %xcc,T371
	inc %g6
	inc %g7
T371:
	be,a,pn %xcc,T372
	inc %g6
	inc %g7
T372:
	bg,a,pn %xcc,T373
	inc %g6
	inc %g7
T373:
	ble,a,pn %xcc,T374
	inc %g6
	inc %g7
T374:
	bge,a,pn %xcc,T375
	inc %g6
	inc %g7
T375:
	bl,a,pn %xcc,T376
	inc %g6
	inc %g7
T376:
	bgu,a,pn %xcc,T377
	inc %g6
	inc %g7
T377:
	bleu,a,pn %xcc,T378
	inc %g6
	inc %g7
T378:
	bcc,a,pn %xcc,T379
	inc %g6
	inc %g7
T379:
	bcs,a,pn %xcc,T380
	inc %g6
	inc %g7
T380:
	bpos,a,pn %xcc,T381
	inc %g6
	inc %g7
T381:
	bneg,a,pn %xcc,T382
	inc %g6
	inc %g7
T382:
	bvc,a,pn %xcc,T383
	inc %g6
	inc %g7
T383:
	bvs,a,pn %xcc,T384
	inc %g6
	inc %g7

	addcc %g2, %g5, %g1
T384:
	ba,pt %icc,T385
	inc %g6
	inc %g7
T385:
	bn,pt %icc,T386
	inc %g6
	inc %g7
T386:
	bne,pt %icc,T387
	inc %g6
	inc %g7
T387:
	be,pt %icc,T388
	inc %g6
	inc %g7
T388:
	bg,pt %icc,T389
	inc %g6
	inc %g7
T389:
	ble,pt %icc,T390
	inc %g6
	inc %g7
T390:
	bge,pt %icc,T391
	inc %g6
	inc %g7
T391:
	bl,pt %icc,T392
	inc %g6
	inc %g7
T392:
	bgu,pt %icc,T393
	inc %g6
	inc %g7
T393:
	bleu,pt %icc,T394
	inc %g6
	inc %g7
T394:
	bcc,pt %icc,T395
	inc %g6
	inc %g7
T395:
	bcs,pt %icc,T396
	inc %g6
	inc %g7
T396:
	bpos,pt %icc,T397
	inc %g6
	inc %g7
T397:
	bneg,pt %icc,T398
	inc %g6
	inc %g7
T398:
	bvc,pt %icc,T399
	inc %g6
	inc %g7
T399:
	bvs,pt %icc,T400
	inc %g6
	inc %g7
T400:
	ba,a,pt %icc,T401
	inc %g6
	inc %g7
T401:
	bn,a,pt %icc,T402
	inc %g6
	inc %g7
T402:
	bne,a,pt %icc,T403
	inc %g6
	inc %g7
T403:
	be,a,pt %icc,T404
	inc %g6
	inc %g7
T404:
	bg,a,pt %icc,T405
	inc %g6
	inc %g7
T405:
	ble,a,pt %icc,T406
	inc %g6
	inc %g7
T406:
	bge,a,pt %icc,T407
	inc %g6
	inc %g7
T407:
	bl,a,pt %icc,T408
	inc %g6
	inc %g7
T408:
	bgu,a,pt %icc,T409
	inc %g6
	inc %g7
T409:
	bleu,a,pt %icc,T410
	inc %g6
	inc %g7
T410:
	bcc,a,pt %icc,T411
	inc %g6
	inc %g7
T411:
	bcs,a,pt %icc,T412
	inc %g6
	inc %g7
T412:
	bpos,a,pt %icc,T413
	inc %g6
	inc %g7
T413:
	bneg,a,pt %icc,T414
	inc %g6
	inc %g7
T414:
	bvc,a,pt %icc,T415
	inc %g6
	inc %g7
T415:
	bvs,a,pt %icc,T416
	inc %g6
	inc %g7
T416:
	ba,pn %icc,T417
	inc %g6
	inc %g7
T417:
	bn,pn %icc,T418
	inc %g6
	inc %g7
T418:
	bne,pn %icc,T419
	inc %g6
	inc %g7
T419:
	be,pn %icc,T420
	inc %g6
	inc %g7
T420:
	bg,pn %icc,T421
	inc %g6
	inc %g7
T421:
	ble,pn %icc,T422
	inc %g6
	inc %g7
T422:
	bge,pn %icc,T423
	inc %g6
	inc %g7
T423:
	bl,pn %icc,T424
	inc %g6
	inc %g7
T424:
	bgu,pn %icc,T425
	inc %g6
	inc %g7
T425:
	bleu,pn %icc,T426
	inc %g6
	inc %g7
T426:
	bcc,pn %icc,T427
	inc %g6
	inc %g7
T427:
	bcs,pn %icc,T428
	inc %g6
	inc %g7
T428:
	bpos,pn %icc,T429
	inc %g6
	inc %g7
T429:
	bneg,pn %icc,T430
	inc %g6
	inc %g7
T430:
	bvc,pn %icc,T431
	inc %g6
	inc %g7
T431:
	bvs,pn %icc,T432
	inc %g6
	inc %g7
T432:
	ba,a,pn %icc,T433
	inc %g6
	inc %g7
T433:
	bn,a,pn %icc,T434
	inc %g6
	inc %g7
T434:
	bne,a,pn %icc,T435
	inc %g6
	inc %g7
T435:
	be,a,pn %icc,T436
	inc %g6
	inc %g7
T436:
	bg,a,pn %icc,T437
	inc %g6
	inc %g7
T437:
	ble,a,pn %icc,T438
	inc %g6
	inc %g7
T438:
	bge,a,pn %icc,T439
	inc %g6
	inc %g7
T439:
	bl,a,pn %icc,T440
	inc %g6
	inc %g7
T440:
	bgu,a,pn %icc,T441
	inc %g6
	inc %g7
T441:
	bleu,a,pn %icc,T442
	inc %g6
	inc %g7
T442:
	bcc,a,pn %icc,T443
	inc %g6
	inc %g7
T443:
	bcs,a,pn %icc,T444
	inc %g6
	inc %g7
T444:
	bpos,a,pn %icc,T445
	inc %g6
	inc %g7
T445:
	bneg,a,pn %icc,T446
	inc %g6
	inc %g7
T446:
	bvc,a,pn %icc,T447
	inc %g6
	inc %g7
T447:
	bvs,a,pn %icc,T448
	inc %g6
	inc %g7
T448:
	ba,pt %xcc,T449
	inc %g6
	inc %g7
T449:
	bn,pt %xcc,T450
	inc %g6
	inc %g7
T450:
	bne,pt %xcc,T451
	inc %g6
	inc %g7
T451:
	be,pt %xcc,T452
	inc %g6
	inc %g7
T452:
	bg,pt %xcc,T453
	inc %g6
	inc %g7
T453:
	ble,pt %xcc,T454
	inc %g6
	inc %g7
T454:
	bge,pt %xcc,T455
	inc %g6
	inc %g7
T455:
	bl,pt %xcc,T456
	inc %g6
	inc %g7
T456:
	bgu,pt %xcc,T457
	inc %g6
	inc %g7
T457:
	bleu,pt %xcc,T458
	inc %g6
	inc %g7
T458:
	bcc,pt %xcc,T459
	inc %g6
	inc %g7
T459:
	bcs,pt %xcc,T460
	inc %g6
	inc %g7
T460:
	bpos,pt %xcc,T461
	inc %g6
	inc %g7
T461:
	bneg,pt %xcc,T462
	inc %g6
	inc %g7
T462:
	bvc,pt %xcc,T463
	inc %g6
	inc %g7
T463:
	bvs,pt %xcc,T464
	inc %g6
	inc %g7
T464:
	ba,a,pt %xcc,T465
	inc %g6
	inc %g7
T465:
	bn,a,pt %xcc,T466
	inc %g6
	inc %g7
T466:
	bne,a,pt %xcc,T467
	inc %g6
	inc %g7
T467:
	be,a,pt %xcc,T468
	inc %g6
	inc %g7
T468:
	bg,a,pt %xcc,T469
	inc %g6
	inc %g7
T469:
	ble,a,pt %xcc,T470
	inc %g6
	inc %g7
T470:
	bge,a,pt %xcc,T471
	inc %g6
	inc %g7
T471:
	bl,a,pt %xcc,T472
	inc %g6
	inc %g7
T472:
	bgu,a,pt %xcc,T473
	inc %g6
	inc %g7
T473:
	bleu,a,pt %xcc,T474
	inc %g6
	inc %g7
T474:
	bcc,a,pt %xcc,T475
	inc %g6
	inc %g7
T475:
	bcs,a,pt %xcc,T476
	inc %g6
	inc %g7
T476:
	bpos,a,pt %xcc,T477
	inc %g6
	inc %g7
T477:
	bneg,a,pt %xcc,T478
	inc %g6
	inc %g7
T478:
	bvc,a,pt %xcc,T479
	inc %g6
	inc %g7
T479:
	bvs,a,pt %xcc,T480
	inc %g6
	inc %g7
T480:
	ba,pn %xcc,T481
	inc %g6
	inc %g7
T481:
	bn,pn %xcc,T482
	inc %g6
	inc %g7
T482:
	bne,pn %xcc,T483
	inc %g6
	inc %g7
T483:
	be,pn %xcc,T484
	inc %g6
	inc %g7
T484:
	bg,pn %xcc,T485
	inc %g6
	inc %g7
T485:
	ble,pn %xcc,T486
	inc %g6
	inc %g7
T486:
	bge,pn %xcc,T487
	inc %g6
	inc %g7
T487:
	bl,pn %xcc,T488
	inc %g6
	inc %g7
T488:
	bgu,pn %xcc,T489
	inc %g6
	inc %g7
T489:
	bleu,pn %xcc,T490
	inc %g6
	inc %g7
T490:
	bcc,pn %xcc,T491
	inc %g6
	inc %g7
T491:
	bcs,pn %xcc,T492
	inc %g6
	inc %g7
T492:
	bpos,pn %xcc,T493
	inc %g6
	inc %g7
T493:
	bneg,pn %xcc,T494
	inc %g6
	inc %g7
T494:
	bvc,pn %xcc,T495
	inc %g6
	inc %g7
T495:
	bvs,pn %xcc,T496
	inc %g6
	inc %g7
T496:
	ba,a,pn %xcc,T497
	inc %g6
	inc %g7
T497:
	bn,a,pn %xcc,T498
	inc %g6
	inc %g7
T498:
	bne,a,pn %xcc,T499
	inc %g6
	inc %g7
T499:
	be,a,pn %xcc,T500
	inc %g6
	inc %g7
T500:
	bg,a,pn %xcc,T501
	inc %g6
	inc %g7
T501:
	ble,a,pn %xcc,T502
	inc %g6
	inc %g7
T502:
	bge,a,pn %xcc,T503
	inc %g6
	inc %g7
T503:
	bl,a,pn %xcc,T504
	inc %g6
	inc %g7
T504:
	bgu,a,pn %xcc,T505
	inc %g6
	inc %g7
T505:
	bleu,a,pn %xcc,T506
	inc %g6
	inc %g7
T506:
	bcc,a,pn %xcc,T507
	inc %g6
	inc %g7
T507:
	bcs,a,pn %xcc,T508
	inc %g6
	inc %g7
T508:
	bpos,a,pn %xcc,T509
	inc %g6
	inc %g7
T509:
	bneg,a,pn %xcc,T510
	inc %g6
	inc %g7
T510:
	bvc,a,pn %xcc,T511
	inc %g6
	inc %g7
T511:
	bvs,a,pn %xcc,T512
	inc %g6
	inc %g7

	addcc %g3, %g4, %g1
T512:
	ba,pt %icc,T513
	inc %g6
	inc %g7
T513:
	bn,pt %icc,T514
	inc %g6
	inc %g7
T514:
	bne,pt %icc,T515
	inc %g6
	inc %g7
T515:
	be,pt %icc,T516
	inc %g6
	inc %g7
T516:
	bg,pt %icc,T517
	inc %g6
	inc %g7
T517:
	ble,pt %icc,T518
	inc %g6
	inc %g7
T518:
	bge,pt %icc,T519
	inc %g6
	inc %g7
T519:
	bl,pt %icc,T520
	inc %g6
	inc %g7
T520:
	bgu,pt %icc,T521
	inc %g6
	inc %g7
T521:
	bleu,pt %icc,T522
	inc %g6
	inc %g7
T522:
	bcc,pt %icc,T523
	inc %g6
	inc %g7
T523:
	bcs,pt %icc,T524
	inc %g6
	inc %g7
T524:
	bpos,pt %icc,T525
	inc %g6
	inc %g7
T525:
	bneg,pt %icc,T526
	inc %g6
	inc %g7
T526:
	bvc,pt %icc,T527
	inc %g6
	inc %g7
T527:
	bvs,pt %icc,T528
	inc %g6
	inc %g7
T528:
	ba,a,pt %icc,T529
	inc %g6
	inc %g7
T529:
	bn,a,pt %icc,T530
	inc %g6
	inc %g7
T530:
	bne,a,pt %icc,T531
	inc %g6
	inc %g7
T531:
	be,a,pt %icc,T532
	inc %g6
	inc %g7
T532:
	bg,a,pt %icc,T533
	inc %g6
	inc %g7
T533:
	ble,a,pt %icc,T534
	inc %g6
	inc %g7
T534:
	bge,a,pt %icc,T535
	inc %g6
	inc %g7
T535:
	bl,a,pt %icc,T536
	inc %g6
	inc %g7
T536:
	bgu,a,pt %icc,T537
	inc %g6
	inc %g7
T537:
	bleu,a,pt %icc,T538
	inc %g6
	inc %g7
T538:
	bcc,a,pt %icc,T539
	inc %g6
	inc %g7
T539:
	bcs,a,pt %icc,T540
	inc %g6
	inc %g7
T540:
	bpos,a,pt %icc,T541
	inc %g6
	inc %g7
T541:
	bneg,a,pt %icc,T542
	inc %g6
	inc %g7
T542:
	bvc,a,pt %icc,T543
	inc %g6
	inc %g7
T543:
	bvs,a,pt %icc,T544
	inc %g6
	inc %g7
T544:
	ba,pn %icc,T545
	inc %g6
	inc %g7
T545:
	bn,pn %icc,T546
	inc %g6
	inc %g7
T546:
	bne,pn %icc,T547
	inc %g6
	inc %g7
T547:
	be,pn %icc,T548
	inc %g6
	inc %g7
T548:
	bg,pn %icc,T549
	inc %g6
	inc %g7
T549:
	ble,pn %icc,T550
	inc %g6
	inc %g7
T550:
	bge,pn %icc,T551
	inc %g6
	inc %g7
T551:
	bl,pn %icc,T552
	inc %g6
	inc %g7
T552:
	bgu,pn %icc,T553
	inc %g6
	inc %g7
T553:
	bleu,pn %icc,T554
	inc %g6
	inc %g7
T554:
	bcc,pn %icc,T555
	inc %g6
	inc %g7
T555:
	bcs,pn %icc,T556
	inc %g6
	inc %g7
T556:
	bpos,pn %icc,T557
	inc %g6
	inc %g7
T557:
	bneg,pn %icc,T558
	inc %g6
	inc %g7
T558:
	bvc,pn %icc,T559
	inc %g6
	inc %g7
T559:
	bvs,pn %icc,T560
	inc %g6
	inc %g7
T560:
	ba,a,pn %icc,T561
	inc %g6
	inc %g7
T561:
	bn,a,pn %icc,T562
	inc %g6
	inc %g7
T562:
	bne,a,pn %icc,T563
	inc %g6
	inc %g7
T563:
	be,a,pn %icc,T564
	inc %g6
	inc %g7
T564:
	bg,a,pn %icc,T565
	inc %g6
	inc %g7
T565:
	ble,a,pn %icc,T566
	inc %g6
	inc %g7
T566:
	bge,a,pn %icc,T567
	inc %g6
	inc %g7
T567:
	bl,a,pn %icc,T568
	inc %g6
	inc %g7
T568:
	bgu,a,pn %icc,T569
	inc %g6
	inc %g7
T569:
	bleu,a,pn %icc,T570
	inc %g6
	inc %g7
T570:
	bcc,a,pn %icc,T571
	inc %g6
	inc %g7
T571:
	bcs,a,pn %icc,T572
	inc %g6
	inc %g7
T572:
	bpos,a,pn %icc,T573
	inc %g6
	inc %g7
T573:
	bneg,a,pn %icc,T574
	inc %g6
	inc %g7
T574:
	bvc,a,pn %icc,T575
	inc %g6
	inc %g7
T575:
	bvs,a,pn %icc,T576
	inc %g6
	inc %g7
T576:
	ba,pt %xcc,T577
	inc %g6
	inc %g7
T577:
	bn,pt %xcc,T578
	inc %g6
	inc %g7
T578:
	bne,pt %xcc,T579
	inc %g6
	inc %g7
T579:
	be,pt %xcc,T580
	inc %g6
	inc %g7
T580:
	bg,pt %xcc,T581
	inc %g6
	inc %g7
T581:
	ble,pt %xcc,T582
	inc %g6
	inc %g7
T582:
	bge,pt %xcc,T583
	inc %g6
	inc %g7
T583:
	bl,pt %xcc,T584
	inc %g6
	inc %g7
T584:
	bgu,pt %xcc,T585
	inc %g6
	inc %g7
T585:
	bleu,pt %xcc,T586
	inc %g6
	inc %g7
T586:
	bcc,pt %xcc,T587
	inc %g6
	inc %g7
T587:
	bcs,pt %xcc,T588
	inc %g6
	inc %g7
T588:
	bpos,pt %xcc,T589
	inc %g6
	inc %g7
T589:
	bneg,pt %xcc,T590
	inc %g6
	inc %g7
T590:
	bvc,pt %xcc,T591
	inc %g6
	inc %g7
T591:
	bvs,pt %xcc,T592
	inc %g6
	inc %g7
T592:
	ba,a,pt %xcc,T593
	inc %g6
	inc %g7
T593:
	bn,a,pt %xcc,T594
	inc %g6
	inc %g7
T594:
	bne,a,pt %xcc,T595
	inc %g6
	inc %g7
T595:
	be,a,pt %xcc,T596
	inc %g6
	inc %g7
T596:
	bg,a,pt %xcc,T597
	inc %g6
	inc %g7
T597:
	ble,a,pt %xcc,T598
	inc %g6
	inc %g7
T598:
	bge,a,pt %xcc,T599
	inc %g6
	inc %g7
T599:
	bl,a,pt %xcc,T600
	inc %g6
	inc %g7
T600:
	bgu,a,pt %xcc,T601
	inc %g6
	inc %g7
T601:
	bleu,a,pt %xcc,T602
	inc %g6
	inc %g7
T602:
	bcc,a,pt %xcc,T603
	inc %g6
	inc %g7
T603:
	bcs,a,pt %xcc,T604
	inc %g6
	inc %g7
T604:
	bpos,a,pt %xcc,T605
	inc %g6
	inc %g7
T605:
	bneg,a,pt %xcc,T606
	inc %g6
	inc %g7
T606:
	bvc,a,pt %xcc,T607
	inc %g6
	inc %g7
T607:
	bvs,a,pt %xcc,T608
	inc %g6
	inc %g7
T608:
	ba,pn %xcc,T609
	inc %g6
	inc %g7
T609:
	bn,pn %xcc,T610
	inc %g6
	inc %g7
T610:
	bne,pn %xcc,T611
	inc %g6
	inc %g7
T611:
	be,pn %xcc,T612
	inc %g6
	inc %g7
T612:
	bg,pn %xcc,T613
	inc %g6
	inc %g7
T613:
	ble,pn %xcc,T614
	inc %g6
	inc %g7
T614:
	bge,pn %xcc,T615
	inc %g6
	inc %g7
T615:
	bl,pn %xcc,T616
	inc %g6
	inc %g7
T616:
	bgu,pn %xcc,T617
	inc %g6
	inc %g7
T617:
	bleu,pn %xcc,T618
	inc %g6
	inc %g7
T618:
	bcc,pn %xcc,T619
	inc %g6
	inc %g7
T619:
	bcs,pn %xcc,T620
	inc %g6
	inc %g7
T620:
	bpos,pn %xcc,T621
	inc %g6
	inc %g7
T621:
	bneg,pn %xcc,T622
	inc %g6
	inc %g7
T622:
	bvc,pn %xcc,T623
	inc %g6
	inc %g7
T623:
	bvs,pn %xcc,T624
	inc %g6
	inc %g7
T624:
	ba,a,pn %xcc,T625
	inc %g6
	inc %g7
T625:
	bn,a,pn %xcc,T626
	inc %g6
	inc %g7
T626:
	bne,a,pn %xcc,T627
	inc %g6
	inc %g7
T627:
	be,a,pn %xcc,T628
	inc %g6
	inc %g7
T628:
	bg,a,pn %xcc,T629
	inc %g6
	inc %g7
T629:
	ble,a,pn %xcc,T630
	inc %g6
	inc %g7
T630:
	bge,a,pn %xcc,T631
	inc %g6
	inc %g7
T631:
	bl,a,pn %xcc,T632
	inc %g6
	inc %g7
T632:
	bgu,a,pn %xcc,T633
	inc %g6
	inc %g7
T633:
	bleu,a,pn %xcc,T634
	inc %g6
	inc %g7
T634:
	bcc,a,pn %xcc,T635
	inc %g6
	inc %g7
T635:
	bcs,a,pn %xcc,T636
	inc %g6
	inc %g7
T636:
	bpos,a,pn %xcc,T637
	inc %g6
	inc %g7
T637:
	bneg,a,pn %xcc,T638
	inc %g6
	inc %g7
T638:
	bvc,a,pn %xcc,T639
	inc %g6
	inc %g7
T639:
	bvs,a,pn %xcc,T640
	inc %g6
	inc %g7
T640:


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


