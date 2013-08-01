/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: niu_init.h
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
.global N2_NIU_INIT
N2_NIU_INIT:
NIU_INIT_START:
	save

	! IMPORTANT
	! ---------
	! Initialize the NIU Packet generator from Vera.
	! Some of the initialization routines are
	! packet_db_init();
	! flow_db_init();
	! node_db_init();

#ifdef MAC_REG_TEST
#else

	set      0x1, %o2
        set      0x3, %o3
        best_set_reg(0x6000, %l7, %o4)
        best_set_reg(0x1000901, %l7, %o5)
mac_util_xmii_init_tmp:
! $EV trig_pc_d(1, expr(@VA(.RED_EXT_SEC.mac_util_xmii_init_tmp) - 4, 16, 16)) -> printf("Initializing mac_util_xmii_init_tmp",*,1)
        setx    xtxmac_sw_rst0_addr, %l7, %l0
        brgz    %o2, mac_reset
        nop
        or      %l0, %o4, %l0
mac_reset:
        stxa    %o3, [%l0]ASI_PRIMARY_LITTLE
        add     %l0, 0x8, %l0
        stxa    %o3, [%l0]ASI_PRIMARY_LITTLE
        xor     %l0, 0x68, %l0
        stxa    %o5, [%l0]ASI_PRIMARY_LITTLE
        subcc   %o2, 1, %o2
        be      mac_util_xmii_init_tmp
        nop
#endif
#ifdef  JUMBO_FRAME_EN
        setx    XMAC0_MAX_addr, %l7, %l0
        setx    XMAC0_MAX_data, %l7, %l1
        stxa     %l1, [%l0]ASI_PRIMARY_LITTLE

        setx    XMAC1_MAX_addr, %l7, %l0
        setx    XMAC1_MAX_data, %l7, %l1
        stxa     %l1, [%l0]ASI_PRIMARY_LITTLE
#endif

xpcs_init:
#if (MAC_SPEED0==1000) && (MAC_SPEED1==1000)
        setx    xpcs0_config_vendor1, %l7, %l0
        stxa     %g0, [%l0]ASI_PRIMARY_LITTLE

        setx    xpcs1_config_vendor1, %l7, %l0
        stxa     %g0, [%l0]ASI_PRIMARY_LITTLE
#else /*Default to 10G */
! $EV trig_pc_d(1, expr(@VA(.RED_EXT_SEC.xpcs_init) + 8, 16, 16)) -> printf("Initializing xpcs_init for 10G Speed",*,1)
        setx    xpcs0_control1_addr, %l7, %l0
        setx    xpcs0_control1_data, %l7, %l1
        stxa     %l1, [%l0]ASI_PRIMARY_LITTLE
        add      %l0, %l2, %l0
        stxa     %l1, [%l0]ASI_PRIMARY_LITTLE
#endif  /* (MAC_SPEED0==1000) && (MAC_SPEED1==1000) */

/*  This section only applicable to 1G not 10
        mov     %g0, %o2
        call    pcs_util_pcs_init
        nop

        set     0x1, %o2
        call    pcs_util_pcs_init
        nop

*/


/* Program ipp config register and enable the ipp0 & ipp1 */
ipp_init:
! $EV trig_pc_d(1, expr(@VA(.RED_EXT_SEC.ipp_init) + 8, 16, 16)) -> printf("Initializing ipp_init",*,1)
        setx    ipp_config0_addr, %l7, %l0
        setx    ipp_config_data, %l7, %l3
        stxa    %l3, [%l0]ASI_PRIMARY_LITTLE
        best_set_reg(0x8000, %l1, %l2)
        or      %l0, %l2, %l0
        stxa    %l3, [%l0]ASI_PRIMARY_LITTLE

#ifdef FFLP_TEST
	call	fflp_util_fflp_init
	nop
#endif

txc_init:
! $EV trig_pc_d(1, expr(@VA(.RED_EXT_SEC.txc_init) + 8, 16, 16)) -> printf("Initializing txc_init",*,1)
        setx    txc_dma_maxburst_addr, %l7, %l0
        best_set_reg(txc_dma_maxburst_data, %l7, %l1)
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE

        setx    txc_port0_control_addr, %l7, %l0
        best_set_reg(txc_port0_control_data, %l7, %l1)
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE
        add     %l0, 0x100, %l0
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE

        setx    txc_control_addr, %l7, %l0
        best_set_reg(txc_control_data, %l7, %l1)
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE


#ifdef	RX_TEST
#ifdef  MULTI_TEST
! This portion programs MAC_DA addresses and MAC control words
! for supporting multi-port/multi-dma in the environment:
!      - 8 MAC_DA addresses and 8 MAC Control word info. relative
!        to each MAC_DA address for port 0. The MAC_DA addresses
!        and the mMAC control words are defined in niu_defines.h.
!      - 8 MAC_DA addresses and 8 MAC Control word info. relative
!        to each MAC_DA address for port 1. The MAC_DA addresses
!        and the mMAC control words are defined in niu_defines.h.
!      - If no MULTI_TEST, then the programming falls back to the
!        single port/single dma testing.

        mov     %g0, %o2
        call    xmac_host_config
        nop

        setx    XMAC0_ADDR3_data, %o1, %o3
        setx    XMAC0_ADDR4_data, %o1, %o4
        setx    XMAC0_ADDR5_data, %o1, %o5
        call    mac_base_wr3
        nop

        setx    XMAC0_ADDR6_data, %o1, %o3
        setx    XMAC0_ADDR7_data, %o1, %o4
        setx    XMAC0_ADDR8_data, %o1, %o5
        call    mac_base_wr6
        nop

        setx    XMAC0_ADDR9_data, %o1, %o3
        setx    XMAC0_ADDR10_data, %o1, %o4
        setx    XMAC0_ADDR11_data, %o1, %o5
        call    mac_base_wr9
        nop

        setx    XMAC0_ADDR12_data, %o1, %o3
        setx    XMAC0_ADDR13_data, %o1, %o4
        setx    XMAC0_ADDR14_data, %o1, %o5
        call    mac_base_wr12
        nop

        setx    XMAC0_ADDR15_data, %o1, %o3
        setx    XMAC0_ADDR16_data, %o1, %o4
        setx    XMAC0_ADDR17_data, %o1, %o5
        call    mac_base_wr15
        nop

        setx    XMAC0_ADDR18_data, %o1, %o3
        setx    XMAC0_ADDR19_data, %o1, %o4
        setx    XMAC0_ADDR20_data, %o1, %o5
        call    mac_base_wr18
        nop

        setx    XMAC0_ADDR21_data, %o1, %o3
        setx    XMAC0_ADDR22_data, %o1, %o4
        setx    XMAC0_ADDR23_data, %o1, %o5
        call    mac_base_wr21
        nop

        setx    XMAC0_ADDR24_data, %o1, %o3
        setx    XMAC0_ADDR25_data, %o1, %o4
        setx    XMAC0_ADDR26_data, %o1, %o5
        call    mac_base_wr24
        nop

        set     0x1, %o2
        call    xmac_host_config                     /* MAQ : Port-1 configured */
        nop

        setx    XMAC1_ADDR3_data, %o1, %o3
        setx    XMAC1_ADDR4_data, %o1, %o4
        setx    XMAC1_ADDR5_data, %o1, %o5
        call    mac_base_wr3
        nop

        setx    XMAC1_ADDR6_data, %o1, %o3
        setx    XMAC1_ADDR7_data, %o1, %o4
        setx    XMAC1_ADDR8_data, %o1, %o5
        call    mac_base_wr6
        nop

        setx    XMAC1_ADDR9_data, %o1, %o3
        setx    XMAC1_ADDR10_data, %o1, %o4
        setx    XMAC1_ADDR11_data, %o1, %o5
        call    mac_base_wr9
        nop

        setx    XMAC1_ADDR12_data, %o1, %o3
        setx    XMAC1_ADDR13_data, %o1, %o4
        setx    XMAC1_ADDR14_data, %o1, %o5
        call    mac_base_wr12
        nop

        setx    XMAC1_ADDR15_data, %o1, %o3
        setx    XMAC1_ADDR16_data, %o1, %o4
        setx    XMAC1_ADDR17_data, %o1, %o5
        call    mac_base_wr15
        nop

        setx    XMAC1_ADDR18_data, %o1, %o3
        setx    XMAC1_ADDR19_data, %o1, %o4
        setx    XMAC1_ADDR20_data, %o1, %o5
        call    mac_base_wr18
        nop

        setx    XMAC1_ADDR21_data, %o1, %o3
        setx    XMAC1_ADDR22_data, %o1, %o4
        setx    XMAC1_ADDR23_data, %o1, %o5
        call    mac_base_wr21
        nop

        setx    XMAC1_ADDR24_data, %o1, %o3
        setx    XMAC1_ADDR25_data, %o1, %o4
        setx    XMAC1_ADDR26_data, %o1, %o5
        call    mac_base_wr24
        nop
#else

        mov     %g0, %o2
        call    xmac_config
        nop

	best_set_reg(XMAC_ADDR3_data, %o1, %o3)
        best_set_reg(XMAC_ADDR4_data, %o1, %o4)
        best_set_reg(XMAC_ADDR5_data, %o1, %o5)
        call    mac_base_wr3
        nop

        best_set_reg(XMAC_ADDR6_data, %o1, %o3)
        best_set_reg(XMAC_ADDR7_data, %o1, %o4)
        best_set_reg(XMAC_ADDR8_data, %o1, %o5)
        call    mac_base_wr6
        nop

        best_set_reg(XMAC_ADDR9_data, %o1, %o3)
        best_set_reg(XMAC_ADDR10_data, %o1, %o4)
        best_set_reg(XMAC_ADDR11_data, %o1, %o5)
        call    mac_base_wr9
        nop

        best_set_reg(XMAC_ADDR12_data, %o1, %o3)
        best_set_reg(XMAC_ADDR13_data, %o1, %o4)
        best_set_reg(XMAC_ADDR14_data, %o1, %o5)
        call    mac_base_wr12
        nop

        set     0x1, %o2
        call    xmac_config                     /* MAQ : Port-1 configured */
        nop

        best_set_reg(XMAC_ADDR3_data, %o1, %o3)
        best_set_reg(XMAC_ADDR4_data, %o1, %o4)
        best_set_reg(XMAC_ADDR5_data, %o1, %o5)
        call    mac_base_wr3
        nop

        best_set_reg(XMAC_ADDR6_data, %o1, %o3)
        best_set_reg(XMAC_ADDR7_data, %o1, %o4)
        best_set_reg(XMAC_ADDR8_data, %o1, %o5)
        call    mac_base_wr6
        nop

        best_set_reg(XMAC_ADDR9_data, %o1, %o3)
        best_set_reg(XMAC_ADDR10_data, %o1, %o4)
        best_set_reg(XMAC_ADDR11_data, %o1, %o5)
        call    mac_base_wr9
        nop

        best_set_reg(XMAC_ADDR12_data, %o1, %o3)
        best_set_reg(XMAC_ADDR13_data, %o1, %o4)
        best_set_reg(XMAC_ADDR14_data, %o1, %o5)
        call    mac_base_wr12
        nop
#endif
#endif
	ret
	restore			! Return to Main program

NIU_INIT_END:

!/********************************************************************************
!* mac_util_xmii_init:
!*   Reset the MAC(s) and program all other MAC registers such as config. registers
!* Parameters in registers:
!*   %o2: <=0 for Port 0, >0 for Port 1
!********************************************************************************/
mac_util_xmii_init:
	save
! $EV trig_pc_d(1, expr(@VA(.RED_EXT_SEC.mac_util_xmii_init) + 8, 16, 16)) -> printf("Initializing mac_util_xmii_init",*,1)
        brgz    %i2, xtx_mac_reset1
        nop
        setx    xtxmac_sw_rst0_addr, %l7, %l0
	ba	xtx_mac_reset_d
	nop
xtx_mac_reset1:
        setx    xtxmac_sw_rst1_addr, %l7, %l0
xtx_mac_reset_d:
	setx	0x03, %l7, %l1
	stxa	%l1, [%l0]ASI_PRIMARY_LITTLE

	call	delay_1
	nop

        brgz    %i2, xrx_mac_reset1
        nop
        setx    xrxmac_sw_rst0_addr, %l7, %l0
	ba      xrx_mac_reset_d
	nop
xrx_mac_reset1:
        setx    xrxmac_sw_rst1_addr, %l7, %l0
xrx_mac_reset_d:
	setx	0x03, %l7, %l1
	stxa	%l1, [%l0]ASI_PRIMARY_LITTLE
	call	delay_1
	nop

	mov	%i2, %o2
	call	tx_mac_reset
	nop
	mov	%i2, %o2
	call	rx_mac_reset
	nop

	brgz	%i2, mac_port_1
	nop
mac_port_0:
	setx	mac0_config_data, %l7, %l0		
	setx	xmac_config0, %l7, %l1
	stxa	%l0, [%l1]ASI_PRIMARY_LITTLE
	ba	mac_port_config_done
	nop
mac_port_1:
        setx    mac1_config_data, %l7, %l0
        setx    xmac_config1, %l7, %l1
        stxa     %l0, [%l1]ASI_PRIMARY_LITTLE
mac_port_config_done:
	mov	%i2, %o2
        call    tx_mac_reset
        nop
	mov	%i2, %o2
        call    rx_mac_reset
        nop

        brgz    %i2, mac1_port
        nop
mac0_port:
	setx	xmac_config0, %l7, %l0
	ldxa	[%l0]ASI_PRIMARY_LITTLE, %l1
	or	0x00000101, %l1, %l1
	stxa	%l1, [%l0]ASI_PRIMARY_LITTLE
        ba      mac_port_done
        nop
mac1_port:
        setx    xmac_config1, %l7, %l0
        ldxa    [%l0]ASI_PRIMARY_LITTLE, %l1
        or      0x00000101, %l1, %l1
        stxa     %l1, [%l0]ASI_PRIMARY_LITTLE
mac_port_done:
	mov	%i2, %o2
        call    tx_mac_reset
        nop
	mov	%i2, %o2
        call    rx_mac_reset
        nop

#ifdef	JUMBO_FRAME_EN
	setx	XMAC0_MAX_addr, %l7, %l0
	setx	XMAC0_MAX_data, %l7, %l1
	stxa     %l1, [%l0]ASI_PRIMARY_LITTLE
	setx	XMAC1_MAX_addr, %l7, %l0
	setx	XMAC1_MAX_data, %l7, %l1
	stxa     %l1, [%l0]ASI_PRIMARY_LITTLE
#endif
	ret
	restore

!/********************************************************************************
!* xpcs_util_xpcs_init:
!*   Initialize both ports of XPCS to desired speed (usually 10G)
!* Parameters in registers:
!*   None
!********************************************************************************/
xpcs_util_xpcs_init:
	save
#if (MAC_SPEED0==1000) && (MAC_SPEED1==1000)
        setx    xpcs0_config_vendor1, %l7, %l0
        stxa     %g0, [%l0]ASI_PRIMARY_LITTLE

        setx    xpcs1_config_vendor1, %l7, %l0
        stxa     %g0, [%l0]ASI_PRIMARY_LITTLE
#else
! $EV trig_pc_d(1, expr(@VA(.RED_EXT_SEC.xpcs_util_xpcs_init) + 8, 16, 16)) -> printf("Initializing xpcs_util_xpcs_init for 10G Speed",*,1)
        setx    xpcs0_control1_addr, %l7, %l0
        setx    xpcs0_control1_data, %l7, %l1
        stxa     %l1, [%l0]ASI_PRIMARY_LITTLE
        setx    Time_out, %l7, %l6
xpcs0_loop:
        ldxa    [%l0]ASI_PRIMARY_LITTLE, %l4
        setx    0x8000, %l7, %l5
        and     %l5, %l4, %l4
        brz     %l4, xpcs0_done
        nop
        dec     %l6
        brnz    %l6, xpcs0_loop
        nop
        call    Timeout
        nop
xpcs0_done:
	setx	xpcs1_control1_addr, %l7, %l0
	setx	xpcs1_control1_data, %l7, %l1
	stxa	%l1, [%l0]ASI_PRIMARY_LITTLE
        setx    Time_out, %l7, %l6
xpcs1_loop:
        ldxa    [%l0]ASI_PRIMARY_LITTLE, %l4
        setx    0x8000, %l7, %l5
        and     %l5, %l4, %l4
        brz     %l4, xpcs1_done
        nop
        dec     %l6
        brnz    %l6, xpcs1_loop
        nop
	call	Timeout
	nop
xpcs1_done:
#endif	/* (MAC_SPEED0==1000) && (MAC_SPEED1==1000) */
	ret
	restore

!/********************************************************************************
!* pcs_util_pcs_init:
!*   Bringing up pcs0 and pcs1 with 1G speed
!* Parameters in registers:
!*   %o2: <=0 for Port 0, >0 for Port 1
!********************************************************************************/
pcs_util_pcs_init:
#if (MAC_SPEED0==1000) && (MAC_SPEED1==1000)

	save
	brgz	%i2, pcs_init_mac1
	nop
pcs_init_mac0:
	setx	PCS0_CONFIGURATION_Addr, %l7, %l0
	setx	PCS0_DATAPATH_MODE_Addr, %l7, %l2
	ba	pcs_init_mac
	nop
pcs_init_mac1:
	setx	PCS1_CONFIGURATION_Addr, %l7, %l0
	setx	PCS1_DATAPATH_MODE_Addr, %l7, %l2

pcs_init_mac:
#ifdef PCS_SERDES
	set	0x23, %l1
	stxa    %l1, [%l0]ASI_PRIMARY_LITTLE
	stxa	%g0, [%l2]ASI_PRIMARY_LITTLE
#else
	set	0x2, %l1
	stxa	%l1, [%l2]ASI_PRIMARY_LITTLE
#endif
	ret
	restore
#endif /* (MAC_SPEED0==1000) && (MAC_SPEED1==1000) */

!/********************************************************************************
!* ipp_util_ipp_init:
!*   Programming ipp config register and enabling the ipp0 & ipp1
!* Parameters in registers:
!*   %o2: <=0 for Port 0, >0 for Port 1
!********************************************************************************/
ipp_util_ipp_init:
	save
! $EV trig_pc_d(1, expr(@VA(.RED_EXT_SEC.ipp_util_ipp_init) + 8, 16, 16)) -> printf("Initializing ipp_util_ipp_init",*,1)
        brgz    %i2, ipp_config1
	nop
	setx	ipp_config0_addr, %l7, %l0
	ba      ipp_config_d
	nop
ipp_config1:
	setx	ipp_config1_addr, %l7, %l0
ipp_config_d:
	setx	ipp_config_data, %l7, %l1
	stxa	%l1, [%l0]ASI_PRIMARY_LITTLE
	ret
	restore

!/********************************************************************************
!* fflp_util_fflp_init:
!*   This is a mini version of programming FFLP block in NIU.
!*   Config register, couple of class and cam_key entries are programmed.
!* Parameters in registers:
!*   None
!********************************************************************************/
fflp_util_fflp_init:
	save
! $EV trig_pc_d(1, expr(@VA(.RED_EXT_SEC.fflp_util_fflp_init) + 8, 16, 16)) -> printf("Initializing fflp_util_fflp_init",*,1)
Lable_FFLP_CONFIG:
	setx	fflp_config_addr, %l7, %l0
	setx	fflp_config_data, %l7, %l1
	stxa	%l1, [%l0]ASI_PRIMARY_LITTLE
Lable_FFLP_L2_CLS_2:
	setx	fflp_l2_cls_2_addr, %l7, %l0
	stxa	%g0, [%l0]ASI_PRIMARY_LITTLE
Lable_FFLP_L2_CLS_3:
	setx	fflp_l2_cls_3_addr, %l7, %l0
	stxa	%g0, [%l0]ASI_PRIMARY_LITTLE
FFLP_L3_class4_7:
	setx	fflp_l3_cls_4_start, %l7, %l0
	setx	fflp_l3_cls_4_end, %l7, %l1
fflp_loop0:
	stxa	%g0, [%l0]ASI_PRIMARY_LITTLE
	add	%l0, 0x8, %l0
	cmp	%l0, %l1
	bne	fflp_loop0
	nop
FFLP_CAM_KEY_0_3:
	setx	fflp_cam_key_reg0_start, %l7, %l0
	setx	fflp_cam_key_reg0_end, %l7, %l1
fflp_loop1:
	stxa	%g0, [%l0]ASI_PRIMARY_LITTLE
	add     %l0, 0x8, %l0
        cmp     %l0, %l1
        bne     fflp_loop1
        nop
FFLP_CAM_KEY_MASK_0_3:
	setx	fflp_cam_key_mask_reg0_start, %l7, %l0
	setx	fflp_cam_key_mask_reg0_end, %l7, %l1
fflp_loop2:
        stxa     %g0, [%l0]ASI_PRIMARY_LITTLE
        add     %l0, 0x8, %l0
        cmp     %l0, %l1
        bne     fflp_loop2
        nop
FFLP_CAM_128_entry:
	setx	fflp_cam_control_addr, %l7, %l0
	mov	%g0, %l1
fflp_loop4:
	stxa	%l1, [%l0]ASI_PRIMARY_LITTLE
	inc	%l1
	cmp	%l1, 127
	bne	fflp_loop4
	nop
FFLP_CAM_RAM_128_entry:
	setx	fflp_cam_ram_data, %l7, %l1
	mov	%g0, %l2
fflp_loop5:
        stxa     %l1, [%l0]ASI_PRIMARY_LITTLE
        inc     %l2
        cmp     %l2, 127
        bne     fflp_loop5
        nop
	ret
	restore

!/********************************************************************************
!* txc_util_txc_init:
!*   Program txc max. burst per port registers.
!* Parameters in registers:
!*   None
!********************************************************************************/
txc_util_txc_init:
	save
! $EV trig_pc_d(1, expr(@VA(.RED_EXT_SEC.txc_util_txc_init) + 8, 16, 16)) -> printf("Initializing txc_util_txc_init",*,1)
	setx	txc_dma_maxburst_addr, %l7, %l0
	setx	txc_dma_maxburst_data, %l7, %l1
	stxa	%l1, [%l0]ASI_PRIMARY_LITTLE

	setx	txc_port0_control_addr, %l7, %l0
	setx	txc_port0_control_data, %l7, %l1
	stxa	%l1, [%l0]ASI_PRIMARY_LITTLE

	setx	txc_port1_control_addr, %l7, %l0
	setx	txc_port1_control_data, %l7, %l1
	stxa	%l1, [%l0]ASI_PRIMARY_LITTLE

	setx	txc_control_addr, %l7, %l0
	setx	txc_control_data, %l7, %l1
	stxa	%l1, [%l0]ASI_PRIMARY_LITTLE

	ret
	restore


!/********************************************************************************
!* dmc_util_dmc_init:
!*   Program RDMC config and Ring Buffer and kick registers.
!* Parameters in registers:
!*   None
!********************************************************************************/
dmc_util_dmc_init:
	save
! $EV trig_pc_d(1, expr(@VA(.RED_EXT_SEC.dmc_util_dmc_init) + 8, 16, 16)) -> printf("Initializing dmc_util_dmc_init",*,1)
        setx    RXDMA_CFIG1, %l7, %l0
        setx    RXDMA_CFIG1_data, %l7, %l1
        stxa     %l1, [%l0]ASI_PRIMARY_LITTLE

        setx    RBR_CFIG_A, %l7, %l0
        setx    RBR_CFIG_A_data, %l7, %l1
        stxa     %l1, [%l0]ASI_PRIMARY_LITTLE

        setx    RBR_CFIG_B, %l7, %l0
        setx    RBR_CFIG_B_data, %l7, %l1
        stxa     %l1, [%l0]ASI_PRIMARY_LITTLE

        setx    RX_LOG_PAGE_VLD, %l7, %l0
        setx    RX_LOG_PAGE_VLD_data, %l7, %l1
        stxa     %l1, [%l0]ASI_PRIMARY_LITTLE

        setx    RBR_KICK, %l7, %l0
        setx    RBR_KICK_data, %l7, %l1
        stxa     %l1, [%l0]ASI_PRIMARY_LITTLE

        setx    RBR_HDH, %l7, %l0
        setx    RBR_HDH_data, %l7, %l1
        stxa     %l1, [%l0]ASI_PRIMARY_LITTLE

        setx    RBR_HDL, %l7, %l0
        setx    RBR_HDL_data, %l7, %l1
        stxa     %l1, [%l0]ASI_PRIMARY_LITTLE

	ret
	restore


!/********************************************************************************
!* xmac_config:
!*   Program MAC host register for the existing tests (before
!*   multi port implementation).
!* Parameters in registers:
!*   %o2: <=0 for Port 0, >0 for Port 1
!********************************************************************************/
xmac_config:
        save
        brgz    %i2, xmac_config_1
        nop
        setx    MAC0_BASE, %l1, %l2
        ba      xmac_config_final
        nop
xmac_config_1:
        setx    MAC1_BASE, %l1, %l2
xmac_config_final:
        setx    XMAC_CONFIG, %l1, %l3
        add     %l2, %l3, %l3
        ldxa    [%l3]ASI_PRIMARY_LITTLE, %l4
        setx    XMAC_CONFIG_mask, %l1, %l5
        and     %l4, %l5, %l5
        stxa    %l5, [%l3]ASI_PRIMARY_LITTLE

        ldxa    [%l3]ASI_PRIMARY_LITTLE, %l4
        setx    XMAC_CONFIG_mask1, %l1, %l5
        or      %l4, %l5, %l5
        stxa    %l5, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR_CMPEN_LSB, %l1, %l3
        add     %l2, %l3, %l3
        setx    XMAC_ADDR_CMPEN_LSB_data, %l1, %l4
        stxa    %l4, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_HOST_INFO0, %l1, %l3
        add     %l2, %l3, %l3
        setx    ctrl_word0, %l1, %l4
        stxa    %l4, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_HOST_INFO1, %l1, %l3
        add     %l2, %l3, %l3
        setx    ctrl_word1, %l1, %l4
        stxa    %l4, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_HOST_INFO2, %l1, %l3
        add     %l2, %l3, %l3
        setx    ctrl_word2, %l1, %l4
        stxa    %l4, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_HOST_INFO3, %l1, %l3
        add     %l2, %l3, %l3
        setx    ctrl_word3, %l1, %l4
        stxa    %l4, [%l3]ASI_PRIMARY_LITTLE

        ret
        restore


!/********************************************************************************
!* xmac_host_config:
!*   Program MAC host (mac control word) registers for MAC0
!*   and MAC1 for single-port/multi-dma and multi-port/multi-dma.
!* Parameters in registers:
!*   %o2: <=0 for Port 0, >0 for Port 1
!********************************************************************************/
xmac_host_config:
	save
	brgz	%i2, xmac_host_config_1
	nop
	setx	MAC0_BASE, %l1, %l2
	ba	xmac0_host_config
	nop
xmac_host_config_1:
	setx	MAC1_BASE, %l1, %l2
xmac1_host_config:
	setx	XMAC_CONFIG, %l1, %l3
	add	%l2, %l3, %l3
	ldxa	[%l3]ASI_PRIMARY_LITTLE, %l4
	setx	XMAC_CONFIG_mask, %l1, %l5
	and	%l4, %l5, %l5
	stxa	%l5, [%l3]ASI_PRIMARY_LITTLE

	ldxa    [%l3]ASI_PRIMARY_LITTLE, %l4
        setx    XMAC_CONFIG_mask1, %l1, %l5
        or      %l4, %l5, %l5
        stxa    %l5, [%l3]ASI_PRIMARY_LITTLE

	setx	XMAC_ADDR_CMPEN_LSB, %l1, %l3
	add	%l2, %l3, %l3
	setx	XMAC_ADDR_CMPEN_LSB_data, %l1, %l4
	stxa	%l4, [%l3]ASI_PRIMARY_LITTLE

	setx	XMAC_HOST_INFO0, %l1, %l3
	add	%l2, %l3, %l3
	setx	mac1_ctrl_word0, %l1, %l4
	stxa	%l4, [%l3]ASI_PRIMARY_LITTLE

	setx	XMAC_HOST_INFO1, %l1, %l3
	add	%l2, %l3, %l3
	setx	mac1_ctrl_word1, %l1, %l4
	stxa	%l4, [%l3]ASI_PRIMARY_LITTLE

	setx	XMAC_HOST_INFO2, %l1, %l3
	add	%l2, %l3, %l3
	setx	mac1_ctrl_word2, %l1, %l4
	stxa	%l4, [%l3]ASI_PRIMARY_LITTLE

	setx	XMAC_HOST_INFO3, %l1, %l3
	add	%l2, %l3, %l3
	setx	mac1_ctrl_word3, %l1, %l4
	stxa	%l4, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_HOST_INFO4, %l1, %l3
        add     %l2, %l3, %l3
        setx    mac1_ctrl_word4, %l1, %l4
        stxa    %l4, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_HOST_INFO5, %l1, %l3
        add     %l2, %l3, %l3
        setx    mac1_ctrl_word5, %l1, %l4
        stxa    %l4, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_HOST_INFO6, %l1, %l3
        add     %l2, %l3, %l3
        setx    mac1_ctrl_word6, %l1, %l4
        stxa    %l4, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_HOST_INFO7, %l1, %l3
        add     %l2, %l3, %l3
        setx    mac1_ctrl_word7, %l1, %l4
        stxa    %l4, [%l3]ASI_PRIMARY_LITTLE

	ret
	restore
xmac0_host_config:
	setx	XMAC_CONFIG, %l1, %l3
	add	%l2, %l3, %l3
	ldxa	[%l3]ASI_PRIMARY_LITTLE, %l4
	setx	XMAC_CONFIG_mask, %l1, %l5
	and	%l4, %l5, %l5
	stxa	%l5, [%l3]ASI_PRIMARY_LITTLE

	ldxa    [%l3]ASI_PRIMARY_LITTLE, %l4
        setx    XMAC_CONFIG_mask1, %l1, %l5
        or      %l4, %l5, %l5
        stxa    %l5, [%l3]ASI_PRIMARY_LITTLE

	setx	XMAC_ADDR_CMPEN_LSB, %l1, %l3
	add	%l2, %l3, %l3
	setx	XMAC_ADDR_CMPEN_LSB_data, %l1, %l4
	stxa	%l4, [%l3]ASI_PRIMARY_LITTLE

	setx	XMAC_HOST_INFO0, %l1, %l3
	add	%l2, %l3, %l3
	setx	mac0_ctrl_word0, %l1, %l4
	stxa	%l4, [%l3]ASI_PRIMARY_LITTLE

	setx	XMAC_HOST_INFO1, %l1, %l3
	add	%l2, %l3, %l3
	setx	mac0_ctrl_word1, %l1, %l4
	stxa	%l4, [%l3]ASI_PRIMARY_LITTLE

	setx	XMAC_HOST_INFO2, %l1, %l3
	add	%l2, %l3, %l3
	setx	mac0_ctrl_word2, %l1, %l4
	stxa	%l4, [%l3]ASI_PRIMARY_LITTLE

	setx	XMAC_HOST_INFO3, %l1, %l3
	add	%l2, %l3, %l3
	setx	mac0_ctrl_word3, %l1, %l4
	stxa	%l4, [%l3]ASI_PRIMARY_LITTLE

	setx	XMAC_HOST_INFO4, %l1, %l3
	add	%l2, %l3, %l3
	setx	mac0_ctrl_word4, %l1, %l4
	stxa	%l4, [%l3]ASI_PRIMARY_LITTLE

	setx	XMAC_HOST_INFO5, %l1, %l3
	add	%l2, %l3, %l3
	setx	mac0_ctrl_word5, %l1, %l4
	stxa	%l4, [%l3]ASI_PRIMARY_LITTLE

	setx	XMAC_HOST_INFO6, %l1, %l3
	add	%l2, %l3, %l3
	setx	mac0_ctrl_word6, %l1, %l4
	stxa	%l4, [%l3]ASI_PRIMARY_LITTLE

	setx	XMAC_HOST_INFO7, %l1, %l3
	add	%l2, %l3, %l3
	setx	mac0_ctrl_word7, %l1, %l4
	stxa	%l4, [%l3]ASI_PRIMARY_LITTLE

	ret
	restore

!/********************************************************************************
!* mac_base_wr3:
!*   ???
!* Parameters in registers:
!*   %o2: <=0 for Port 0, >0 for Port 1
!*   %o3: Value to write to XMAC_ADDR3
!*   %o4: Value to write to XMAC_ADDR4
!*   %o5: Value to write to XMAC_ADDR3
!********************************************************************************/
mac_base_wr3:
        save
        brgz    %i2, mac1_base_wr3
        nop
        setx    MAC0_BASE, %l1, %l2
	setx	XMAC_ADDR3, %l1, %l3
	add	%l2, %l3, %l3
	stxa	%i3, [%l3]ASI_PRIMARY_LITTLE

	setx	XMAC_ADDR4, %l1, %l3
	add     %l2, %l3, %l3
        stxa    %i4, [%l3]ASI_PRIMARY_LITTLE

	setx	XMAC_ADDR5, %l1, %l3
	add     %l2, %l3, %l3
        stxa    %i5, [%l3]ASI_PRIMARY_LITTLE

        ba      mac_base_wr3_done
        nop
mac1_base_wr3:
        setx    MAC1_BASE, %l1, %l2
	setx	XMAC_ADDR3, %l1, %l3
	add     %l2, %l3, %l3
        stxa    %i3, [%l3]ASI_PRIMARY_LITTLE

	setx	XMAC_ADDR4, %l1, %l3
	add     %l2, %l3, %l3
        stxa    %i4, [%l3]ASI_PRIMARY_LITTLE

	setx	XMAC_ADDR5, %l1, %l3
	add     %l2, %l3, %l3
        stxa    %i5, [%l3]ASI_PRIMARY_LITTLE

mac_base_wr3_done:
	ret
	restore

!/********************************************************************************
!* mac_base_wr6:
!*   ???
!* Parameters in registers:
!*   %o2: <=0 for Port 0, >0 for Port 1
!*   %o3: Value to write to XMAC_ADDR6
!*   %o4: Value to write to XMAC_ADDR7
!*   %o5: Value to write to XMAC_ADDR8
!********************************************************************************/
mac_base_wr6:
        save
        brgz    %i2, mac1_base_wr6
        nop
        setx    MAC0_BASE, %l1, %l2
        setx    XMAC_ADDR6, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i3, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR7, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i4, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR8, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i5, [%l3]ASI_PRIMARY_LITTLE

        ba      mac_base_wr6_done
        nop
mac1_base_wr6:
        setx    MAC1_BASE, %l1, %l2
        setx    XMAC_ADDR6, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i3, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR7, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i4, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR8, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i5, [%l3]ASI_PRIMARY_LITTLE

mac_base_wr6_done:
        ret
        restore

!/********************************************************************************
!* mac_base_wr9:
!*   ???
!* Parameters in registers:
!*   %o2: <=0 for Port 0, >0 for Port 1
!*   %o3: Value to write to XMAC_ADDR9
!*   %o4: Value to write to XMAC_ADDR10
!*   %o5: Value to write to XMAC_ADDR11
!********************************************************************************/
mac_base_wr9:
        save
        brgz    %i2, mac1_base_wr9
        nop
        setx    MAC0_BASE, %l1, %l2
        setx    XMAC_ADDR9, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i3, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR10, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i4, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR11, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i5, [%l3]ASI_PRIMARY_LITTLE

        ba      mac_base_wr9_done
        nop
mac1_base_wr9:
        setx    MAC1_BASE, %l1, %l2
        setx    XMAC_ADDR9, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i3, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR10, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i4, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR11, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i5, [%l3]ASI_PRIMARY_LITTLE

mac_base_wr9_done:
        ret
        restore

!/********************************************************************************
!* mac_base_wr12:
!*   ???
!* Parameters in registers:
!*   %o2: <=0 for Port 0, >0 for Port 1
!*   %o3: Value to write to XMAC_ADDR12
!*   %o4: Value to write to XMAC_ADDR13
!*   %o5: Value to write to XMAC_ADDR14
!********************************************************************************/
mac_base_wr12:
        save
        brgz    %i2, mac1_base_wr12
        nop
        setx    MAC0_BASE, %l1, %l2
        setx    XMAC_ADDR12, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i3, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR13, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i4, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR14, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i5, [%l3]ASI_PRIMARY_LITTLE

        ba      mac_base_wr12_done
        nop
mac1_base_wr12:
        setx    MAC1_BASE, %l1, %l2
        setx    XMAC_ADDR12, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i3, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR13, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i4, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR14, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i5, [%l3]ASI_PRIMARY_LITTLE

mac_base_wr12_done:
        ret
        restore

!/********************************************************************************
!* mac_base_wr15:
!*   ???
!* Parameters in registers:
!*   %o2: <=0 for Port 0, >0 for Port 1
!*   %o3: Value to write to XMAC_ADDR15
!*   %o4: Value to write to XMAC_ADDR16
!*   %o5: Value to write to XMAC_ADDR17
!********************************************************************************/
mac_base_wr15:  
        save    
        brgz    %i2, mac1_base_wr15
        nop
        setx    MAC0_BASE, %l1, %l2
        setx    XMAC_ADDR15, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i3, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR16, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i4, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR17, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i5, [%l3]ASI_PRIMARY_LITTLE

        ba      mac_base_wr15_done
        nop
mac1_base_wr15: 
        setx    MAC1_BASE, %l1, %l2
        setx    XMAC_ADDR15, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i3, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR16, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i4, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR17, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i5, [%l3]ASI_PRIMARY_LITTLE

mac_base_wr15_done:
        ret     
        restore

!/********************************************************************************
!* mac_base_wr18:
!*   ???
!* Parameters in registers:
!*   %o2: <=0 for Port 0, >0 for Port 1
!*   %o3: Value to write to XMAC_ADDR18
!*   %o4: Value to write to XMAC_ADDR19
!*   %o5: Value to write to XMAC_ADDR20
!********************************************************************************/
mac_base_wr18:
        save
        brgz    %i2, mac1_base_wr18
        nop
        setx    MAC0_BASE, %l1, %l2
        setx    XMAC_ADDR18, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i3, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR19, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i4, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR20, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i5, [%l3]ASI_PRIMARY_LITTLE

        ba      mac_base_wr18_done
        nop
mac1_base_wr18:
        setx    MAC1_BASE, %l1, %l2
        setx    XMAC_ADDR18, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i3, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR19, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i4, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR20, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i5, [%l3]ASI_PRIMARY_LITTLE

mac_base_wr18_done:
        ret
        restore

!/********************************************************************************
!* mac_base_wr21:
!*   ???
!* Parameters in registers:
!*   %o2: <=0 for Port 0, >0 for Port 1
!*   %o3: Value to write to XMAC_ADDR21
!*   %o4: Value to write to XMAC_ADDR22
!*   %o5: Value to write to XMAC_ADDR23
!********************************************************************************/
mac_base_wr21:
        save
        brgz    %i2, mac1_base_wr21
        nop
        setx    MAC0_BASE, %l1, %l2
        setx    XMAC_ADDR21, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i3, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR22, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i4, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR23, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i5, [%l3]ASI_PRIMARY_LITTLE

        ba      mac_base_wr21_done
        nop
mac1_base_wr21:
        setx    MAC1_BASE, %l1, %l2
        setx    XMAC_ADDR21, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i3, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR22, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i4, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR23, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i5, [%l3]ASI_PRIMARY_LITTLE

mac_base_wr21_done:
        ret
        restore

!/********************************************************************************
!* mac_base_wr24:
!*   ???
!* Parameters in registers:
!*   %o2: <=0 for Port 0, >0 for Port 1
!*   %o3: Value to write to XMAC_ADDR24
!*   %o4: Value to write to XMAC_ADDR25
!*   %o5: Value to write to XMAC_ADDR26
!********************************************************************************/
mac_base_wr24:
        save
        brgz    %i2, mac1_base_wr24
        nop
        setx    MAC0_BASE, %l1, %l2
        setx    XMAC_ADDR24, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i3, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR25, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i4, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR26, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i5, [%l3]ASI_PRIMARY_LITTLE

        ba      mac_base_wr24_done
        nop
mac1_base_wr24:
        setx    MAC1_BASE, %l1, %l2
        setx    XMAC_ADDR24, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i3, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR25, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i4, [%l3]ASI_PRIMARY_LITTLE

        setx    XMAC_ADDR26, %l1, %l3
        add     %l2, %l3, %l3
        stxa    %i5, [%l3]ASI_PRIMARY_LITTLE

mac_base_wr24_done:
        ret
        restore

!/********************************************************************************
!* tx_mac_reset:
!*   Reset the TX MAC for one port
!* Parameters in registers:
!*   %o2: <=0 for Port 0, >0 for Port 1
!********************************************************************************/
tx_mac_reset:
	save
	brgz	%i2, tx_mac_reset1
	nop
	setx    xtxmac_sw_rst0_addr, %l1, %l2
	ba      tx_mac_reset_d
	nop
tx_mac_reset1:
	setx    xtxmac_sw_rst1_addr, %l1, %l2
tx_mac_reset_d:
	setx	0x01, %l1, %l3
        stxa    %l3, [%l2]ASI_PRIMARY_LITTLE

        call    delay_1
        nop
	setx	Time_out, %l1, %l3
loop_t0:
	ldxa	[%l2]ASI_PRIMARY_LITTLE, %l4

	brz	%l4, return_back
	nop
	dec	%l3
	brnz	%l3, loop_t0
	nop
	call	Timeout
	nop

!/********************************************************************************
!* rx_mac_reset:
!*   Reset the RX MAC for one port
!* Parameters in registers:
!*   %o2: <=0 for Port 0, >0 for Port 1
!********************************************************************************/
rx_mac_reset:
	save
	brgz	%i2, rx_mac_reset1
	nop
        setx    xrxmac_sw_rst0_addr, %l1, %l2
	ba      rx_mac_reset_d
	nop
rx_mac_reset1:
        setx    xrxmac_sw_rst1_addr, %l1, %l2
rx_mac_reset_d:
	setx	0x01, %l1, %l3
        stxa    %l3, [%l2]ASI_PRIMARY_LITTLE

        call    delay_1
        nop
        setx    Time_out, %l1, %l3
loop_r0:
        ldxa     [%l2]ASI_PRIMARY_LITTLE, %l4

	brz     %l4, return_back
        nop
        dec     %l3
        brnz    %l3, loop_r0
        nop
        call    Timeout
        nop

return_back:
	ret
	restore

!/********************************************************************************
!* delay_1:
!*   ???
!* Parameters in registers:
!*   None
!********************************************************************************/
delay_1:
	save
	setx    TX_CS, %l1, %l2
	ldxa	[%l2]ASI_PRIMARY_LITTLE, %l1
	nop
	nop	
	ret
	restore

!/********************************************************************************
!* delay_10:
!*   ???
!* Parameters in registers:
!*   None
!********************************************************************************/
delay_10:
	save
	setx	delay_10_count, %l1, %l5
	setx    TX_CS, %l1, %l2
loop_delay:
	ldxa	[%l2]ASI_PRIMARY_LITTLE, %l1
	nop
	dec	%l5
	brnz	%l5, loop_delay
	nop	
	ret
	restore

!/********************************************************************************
!* init_zcp_tbl_2dma:
!*   Program DMA Table in zcp block for 2 dma variation
!*   (It is also used for Multi-port)
!* Parameters in registers:
!*   None
!********************************************************************************/
init_zcp_tbl_2dma:
        save
        setx    ZCP_RDC_TBL_Addr, %l7, %l0
        mov     %g0, %l1
zcp_16_table:
        setx    zcp_16_count, %l1, %l5
zcp_16_count_0:
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE
        add     0x8, %l0, %l0
        dec     %l5
        brnz    %l5, zcp_16_count_0
        nop
        inc     %l1
	cmp     %l1, 0x8
	bne     zcp_16_table
        nop
        ret
        restore


!/********************************************************************************
!* init_zcp_tbl_1dma:
!*   Program DMA Table in zcp block for one dma variation.
!* Parameters in registers:
!*   None
!********************************************************************************/
init_zcp_tbl_1dma:
        save
        mov     %g0, %l1
        setx    ZCP_RDC_TBL_Addr, %l7, %l0
        setx    zcp_128_count, %l1, %l5
zcp_128_count0:
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE
        add     0x8, %l0, %l0
        dec     %l5
        brnz    %l5, zcp_128_count0
        nop
        ret
        restore

!/********************************************************************************
!* init_zcp_tbl_4dma:
!*   Program DMA Table in zcp block for 4 dma variation.
!* Parameters in registers:
!*   None
!********************************************************************************/
init_zcp_tbl_4dma:
        save
        mov     %g0, %l1
        setx    ZCP_RDC_TBL_Addr, %l7, %l0
        setx    zcp_32_count, %l7, %l5
zcp_32_count0:
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE
        add     0x8, %l0, %l0
        dec     %l5
        brnz    %l5, zcp_32_count0
        nop
        inc     %l1
        setx    zcp_32_count, %l7, %l5
zcp_32_count1:
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE
        add     0x8, %l0, %l0
        dec     %l5
        brnz    %l5, zcp_32_count1
        nop
        inc     %l1
        setx    zcp_32_count, %l7, %l5
zcp_32_count2:
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE
        add     0x8, %l0, %l0
        dec     %l5
        brnz    %l5, zcp_32_count2
        nop
        inc     %l1
        setx    zcp_32_count, %l7, %l5
zcp_32_count3:
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE
        add     0x8, %l0, %l0
        dec     %l5
        brnz    %l5, zcp_32_count3
        nop
        ret
        restore

!/********************************************************************************
!* init_zcp_tbl_8dma:
!*   Program DMA Table in zcp block for 8 dma variation.
!* Parameters in registers:
!*   None
!********************************************************************************/
init_zcp_tbl_8dma:
        save
        mov     %g0, %l1
        setx    ZCP_RDC_TBL_Addr, %l7, %l0
        setx    zcp_16_count, %l7, %l5
zcp_16_count0:
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE
        add     0x8, %l0, %l0
        dec     %l5
        brnz    %l5, zcp_16_count0
        nop
        inc     %l1
        setx    zcp_16_count, %l7, %l5
zcp_16_count1:
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE
        add     0x8, %l0, %l0
        dec     %l5
        brnz    %l5, zcp_16_count1
        nop
        inc     %l1
        setx    zcp_16_count, %l7, %l5
zcp_16_count2:
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE
        add     0x8, %l0, %l0
        dec     %l5
        brnz    %l5, zcp_16_count2
        nop
        inc     %l1
        setx    zcp_16_count, %l7, %l5
zcp_16_count3:
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE
        add     0x8, %l0, %l0
        dec     %l5
        brnz    %l5, zcp_16_count3
        nop
        inc     %l1
        setx    zcp_16_count, %l7, %l5
zcp_16_count4:
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE
        add     0x8, %l0, %l0
        dec     %l5
        brnz    %l5, zcp_16_count4
        nop
        inc     %l1
        setx    zcp_16_count, %l7, %l5
zcp_16_count5:
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE
        add     0x8, %l0, %l0
        dec     %l5
        brnz    %l5, zcp_16_count5
        nop
        inc     %l1
        setx    zcp_16_count, %l7, %l5
zcp_16_count6:
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE
        add     0x8, %l0, %l0
        dec     %l5
        brnz    %l5, zcp_16_count6
        nop
        inc     %l1
        setx    zcp_16_count, %l7, %l5
zcp_16_count7:
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE
        add     0x8, %l0, %l0
        dec     %l5
        brnz    %l5, zcp_16_count7
        nop
        ret
        restore


Timeout:
	call test_failed
	nop

/***************************************************************************
** Subroutines for TX
**
** cpp/m4 text macros:
**   NIU_TX_MULTI_TEST => if not defined, only support one DMA channel
**                        if defined, support multiple DMA channels:
**                             DMA 0-7 for port 0
**                             DMA 8-15 for port 1
***************************************************************************/
#ifdef NIU_TX_MULTI_TEST
!/********************************************************************************
!* AddTxChannels:
!*   Currently unused
!* Parameters in registers:
!*   None
!********************************************************************************/
AddTxChannels:
        save
	ret
	restore

!/********************************************************************************
!* SetTxMaxBurst:
!*   Set the maximum TX burst size for the DMA channel
!* Parameters in registers:
!*   %o1: Maximum TX burst size
!*   %o2: Is multi-port (not currently used)
!*   %o3: Bit-mask of Port 0 DMA channels to set; bit 0 == DMA channel 0, etc.
!*   %o4: Bit-mask of Port 1 DMA channels to set; bit 0 == DMA channel 0, etc.
!********************************************************************************/
.global SetTxMaxBurst
SetTxMaxBurst:
	save

	mov	%i1, %o1    ! MAX_BURST_DATA
!       mov     %i2, %o2    ! NIU_TX_MULTI_PORT
!       mov     %i3, %o3    ! NIU_TX_MULTI_DMA_P0
!       mov     %i4, %o4    ! NIU_TX_MULTI_DMA_P1

check_p0_SetMaxBurst:
        brgz    %i3, p0_SetMaxBurst_call
        nop
        brgz    %i4, p1_SetMaxBurst_call
	nop
        ret     
        restore

p0_SetMaxBurst_call:
        mov     %i3, %o0
	call    Start_Check_SetMaxBurst
	nop
	brgz    %i4, p1_SetMaxBurst_call
        nop
        ret     
        restore
p1_SetMaxBurst_call:
        mov     %i4, %o0
	call    Start_Check_SetMaxBurst
        nop
	ret
	restore

Start_Check_SetMaxBurst:
        save
        mov     0x1, %l0
        andcc   %i0, %l0, %g0
        bz      %xcc, Check_SetMaxBurst_Dma1
        nop
SetMaxBurstValue_DMA0:
	setx	SetTxMaxBurst_DMA0_Addr, %l7, %l2
	stxa	%i1, [%l2]ASI_PRIMARY_LITTLE	

Check_SetMaxBurst_Dma1:
        sllx    %l0, 1, %l0
        andcc   %i0, %l0, %g0
        bz      %xcc, Check_SetMaxBurst_Dma2
        nop
SetMaxBurstValue_DMA1:
	setx	SetTxMaxBurst_DMA1_Addr, %l7, %l2
	stxa	%i1, [%l2]ASI_PRIMARY_LITTLE	

Check_SetMaxBurst_Dma2:
        sllx    %l0, 1, %l0
        andcc   %i0, %l0, %g0
        bz      %xcc, Check_SetMaxBurst_Dma3
        nop
SetMaxBurstValue_DMA2:
	setx	SetTxMaxBurst_DMA2_Addr, %l7, %l2
	stxa	%i1, [%l2]ASI_PRIMARY_LITTLE	

Check_SetMaxBurst_Dma3:
        sllx    %l0, 1, %l0
        andcc   %i0, %l0, %g0
        bz      %xcc, Check_SetMaxBurst_Dma4
        nop
SetMaxBurstValue_DMA3:
	setx	SetTxMaxBurst_DMA3_Addr, %l7, %l2
	stxa	%i1, [%l2]ASI_PRIMARY_LITTLE	

Check_SetMaxBurst_Dma4:
        sllx    %l0, 1, %l0
        andcc   %i0, %l0, %g0
        bz      %xcc, Check_SetMaxBurst_Dma5
        nop
SetMaxBurstValue_DMA4:
	setx	SetTxMaxBurst_DMA4_Addr, %l7, %l2
	stxa	%i1, [%l2]ASI_PRIMARY_LITTLE	

Check_SetMaxBurst_Dma5:
        sllx    %l0, 1, %l0
        andcc   %i0, %l0, %g0
        bz      %xcc, Check_SetMaxBurst_Dma6
        nop
SetMaxBurstValue_DMA5:
	setx	SetTxMaxBurst_DMA5_Addr, %l7, %l2
	stxa	%i1, [%l2]ASI_PRIMARY_LITTLE	

Check_SetMaxBurst_Dma6:
        sllx    %l0, 1, %l0
        andcc   %i0, %l0, %g0
        bz      %xcc, Check_SetMaxBurst_Dma7
        nop
SetMaxBurstValue_DMA6:
	setx	SetTxMaxBurst_DMA6_Addr, %l7, %l2
	stxa	%i1, [%l2]ASI_PRIMARY_LITTLE	

Check_SetMaxBurst_Dma7:
        sllx    %l0, 1, %l0
        andcc   %i0, %l0, %g0
        bz      %xcc, Check_SetMaxBurst_Dma8
        nop
SetMaxBurstValue_DMA7:
	setx	SetTxMaxBurst_DMA7_Addr, %l7, %l2
	stxa	%i1, [%l2]ASI_PRIMARY_LITTLE	

Check_SetMaxBurst_Dma8:
        sllx    %l0, 1, %l0
        andcc   %i0, %l0, %g0
        bz      %xcc, Check_SetMaxBurst_Dma9
        nop
SetMaxBurstValue_DMA8:
	setx	SetTxMaxBurst_DMA8_Addr, %l7, %l2
	stxa	%i1, [%l2]ASI_PRIMARY_LITTLE	

Check_SetMaxBurst_Dma9:
        sllx    %l0, 1, %l0
	andcc   %i0, %l0, %g0
        bz      %xcc, Check_SetMaxBurst_Dma10
        nop
SetMaxBurstValue_DMA9:
	setx	SetTxMaxBurst_DMA9_Addr, %l7, %l2
	stxa	%i1, [%l2]ASI_PRIMARY_LITTLE	

Check_SetMaxBurst_Dma10:
        sllx    %l0, 1, %l0
        andcc   %i0, %l0, %g0
        bz      %xcc, Check_SetMaxBurst_Dma11
        nop
SetMaxBurstValue_DMA10:
	setx	SetTxMaxBurst_DMA10_Addr, %l7, %l2
	stxa	%i1, [%l2]ASI_PRIMARY_LITTLE	

Check_SetMaxBurst_Dma11:
        sllx    %l0, 1, %l0
        andcc   %i0, %l0, %g0
        bz      %xcc, Check_SetMaxBurst_Dma12
        nop
SetMaxBurstValue_DMA11:
	setx	SetTxMaxBurst_DMA11_Addr, %l7, %l2
	stxa	%i1, [%l2]ASI_PRIMARY_LITTLE	

Check_SetMaxBurst_Dma12:
        sllx    %l0, 1, %l0
        andcc   %i0, %l0, %g0
        bz      %xcc, Check_SetMaxBurst_Dma13
        nop
SetMaxBurstValue_DMA12:
	setx	SetTxMaxBurst_DMA12_Addr, %l7, %l2
	stxa	%i1, [%l2]ASI_PRIMARY_LITTLE	

Check_SetMaxBurst_Dma13:
        sllx    %l0, 1, %l0
        andcc   %i0, %l0, %g0
        bz      %xcc, Check_SetMaxBurst_Dma14
        nop
SetMaxBurstValue_DMA13:
	setx	SetTxMaxBurst_DMA13_Addr, %l7, %l2
	stxa	%i1, [%l2]ASI_PRIMARY_LITTLE	

Check_SetMaxBurst_Dma14:
        sllx    %l0, 1, %l0
        andcc   %i0, %l0, %g0
        bz      %xcc, Check_SetMaxBurst_Dma15
        nop
SetMaxBurstValue_DMA14:
	setx	SetTxMaxBurst_DMA14_Addr, %l7, %l2
	stxa	%i1, [%l2]ASI_PRIMARY_LITTLE	

Check_SetMaxBurst_Dma15:
        sllx    %l0, 1, %l0
        andcc   %i0, %l0, %g0
        bz      %xcc, SetMaxBurstValue_end
        nop
SetMaxBurstValue_DMA15:
	setx	SetTxMaxBurst_DMA15_Addr, %l7, %l2
	stxa	%i1, [%l2]ASI_PRIMARY_LITTLE	

SetMaxBurstValue_end:
	ret
	restore


!/********************************************************************************
!* SetTxDMAActive:
!*   Activate specified TX DMA channels
!* Parameters in registers:
!*   %o0: Unused
!*   %o1: Unused
!*   %o2: >0 means both ports
!*   %o3: Bit-mask of Port 0 DMA channels to set; bit 0 == DMA channel 0, etc.
!*   %o4: Bit-mask of Port 1 DMA channels to set; bit 0 == DMA channel 0, etc.
!********************************************************************************/
.global SetTxDMAActive
SetTxDMAActive:
	save
!	mov	%i1, %g3
!	mov     %i2, %g4    ! NIU_TX_MULTI_PORT
!	mov     %i3, %g5    ! NIU_TX_MULTI_DMA_P0
!       mov     %i4, %l5    ! NIU_TX_MULTI_DMA_P1

check_Port0DMAActive:
        brgz    %i3, SetPort0DMAActive
        nop
        brgz    %i4, SetPort1DMAActive
	nop

        ret
	restore


SetPort0DMAActive :
	setx    0xffff, %l7, %l0
        and     %i3,  %l0, %l0
        brnz    %l0, SetPort0Active_DMA
        nop

        brz     %i2, SetTxDMAActive_End       
	nop

SetPort1DMAActive :
	setx    0xffff, %l7, %l0
        and     %i4, %l0, %l0
        brnz    %l0, SetPort1Active_DMA
        nop

SetTxDMAActive_End :
	ret
	restore
	
SetPort0Active_DMA:
	setx	SetPort0TxDMAActive_Addr, %l7, %l1
        stxa    %l0, [%l1]ASI_PRIMARY_LITTLE

        brgz    %i2, 1f
        nop
	ret
	restore
1:
SetPort1Active_DMA:
	setx    0xffff, %l7, %l0
        and     %i4,    %l0, %l0
	setx	SetPort1TxDMAActive_Addr, %l7, %l1
        stxa    %l0, [%l1]ASI_PRIMARY_LITTLE

	ret
	restore

!/********************************************************************************
!* InitTxDma:
!*   This routine programs the transmit path registers for one DMA channel.
!*   The caller must use the NIU_InitTxDma user event to write the registers's
!*   data to PEU_SRAM.
!*   This subroutine retrieves the data from the PEU_SRAM and write the data
!*   to each TX register mentioned below in assembly.
!*     TX_MASK1
!*     TX_VALUE1
!*     TX_RELOC1
!*     TX_MASK2
!*     TX_VALUE2
!*     TX_RELOC2
!*     TX_PAGE_VALID
!*     TX_RING_CONFIG
!*   This routine must be called for each enabled DMA channel.
!* Parameters in registers:
!*   %o0: DMA NUMBER
!*   %o1: Unused
!*   %o2: NIU_TX_MULTI_PORT
!*   %o3: NIU_TX_MULTI_DMA_P0
!*   %o4: NIU_TX_MULTI_DMA_P1
!********************************************************************************/
.global InitTxDma
InitTxDma:
	save

	mov	%i0, %o0    ! DMA NUMBER
	mov     %i2, %o2    ! NIU_TX_MULTI_PORT
	mov     %i3, %o3    ! NIU_TX_MULTI_DMA_P0
	mov     %i4, %o4    ! NIU_TX_MULTI_DMA_P1

	or      %i3, %i4, %l0
	brgz    %l0, check_p0_dmas
	nop
	call    SetPage0Registers
        nop
        ret
        restore

check_p0_dmas:
        brgz    %o3, Set_Tx_Reg_Multi_Dma
        nop
	brgz    %o4, P1_Tx_Dma0
        nop
	ret
	restore				! Return InitTxDMA

Set_Tx_Reg_Multi_Dma:
	mov     0x1, %l0
        andcc   %o3, %l0, %g0
        bz      %xcc, P0_Tx_Dma1
        nop
        set     0, %o0
Do_P0_Tx_Dma0:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_P0_Tx_Dma0)) -> NIU_InitTxDma (0, 0, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
P0_Tx_Dma1:
	sllx    %l0, 1, %l0
        andcc   %o3, %l0, %g0
        bz      %xcc, P0_Tx_Dma2
        nop
	set     1, %o0
Do_P0_Tx_Dma1:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_P0_Tx_Dma1)) -> NIU_InitTxDma (0, 1, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
P0_Tx_Dma2:
	sllx    %l0, 1, %l0
        andcc   %o3, %l0, %g0
        bz      %xcc, P0_Tx_Dma3
        nop
	set     2, %o0
Do_P0_Tx_Dma2:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_P0_Tx_Dma2)) -> NIU_InitTxDma (0, 2, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
P0_Tx_Dma3:
	sllx    %l0, 1, %l0
        andcc   %o3, %l0, %g0
        bz      %xcc, P0_Tx_Dma4
        nop
	set     3, %o0
Do_P0_Tx_Dma3:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_P0_Tx_Dma3)) -> NIU_InitTxDma (0, 3, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
P0_Tx_Dma4:
	sllx    %l0, 1, %l0
        andcc   %o3, %l0, %g0
        bz      %xcc, P0_Tx_Dma5
        nop
	set     4, %o0
Do_P0_Tx_Dma4:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_P0_Tx_Dma4)) -> NIU_InitTxDma (0, 4, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
P0_Tx_Dma5:
	sllx    %l0, 1, %l0
        andcc   %o3, %l0, %g0
        bz      %xcc, P0_Tx_Dma6
        nop
	set     5, %o0
Do_P0_Tx_Dma5:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_P0_Tx_Dma5)) -> NIU_InitTxDma (0, 5, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
P0_Tx_Dma6:
	sllx    %l0, 1, %l0
        andcc   %o3, %l0, %g0
        bz      %xcc, P0_Tx_Dma7
        nop
	set     6, %o0
Do_P0_Tx_Dma6:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_P0_Tx_Dma6)) -> NIU_InitTxDma (0, 6, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
P0_Tx_Dma7:
	sllx    %l0, 1, %l0
        andcc   %o3, %l0, %g0
        bz      %xcc, P0_Tx_Dma8
	nop
	set     7, %o0
Do_P0_Tx_Dma7:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_P0_Tx_Dma7)) -> NIU_InitTxDma (0, 7, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
P0_Tx_Dma8:
	sllx    %l0, 1, %l0
        andcc   %o3, %l0, %g0
        bz      %xcc, P0_Tx_Dma9
	nop
	set     8, %o0
Do_P0_Tx_Dma8:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_P0_Tx_Dma8)) -> NIU_InitTxDma (0, 8, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
P0_Tx_Dma9:
	sllx    %l0, 1, %l0
        andcc   %o3, %l0, %g0
        bz      %xcc, P0_Tx_Dma10
	nop
	set     9, %o0
Do_P0_Tx_Dma9:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_P0_Tx_Dma9)) -> NIU_InitTxDma (0, 9, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
P0_Tx_Dma10:
	sllx    %l0, 1, %l0
        andcc   %o3, %l0, %g0
        bz      %xcc, P0_Tx_Dma11
	nop
	set     10, %o0
Do_P0_Tx_Dma10:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_P0_Tx_Dma10)) -> NIU_InitTxDma (0, a, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
P0_Tx_Dma11:
	sllx    %l0, 1, %l0
        andcc   %o3, %l0, %g0
        bz      %xcc, P0_Tx_Dma12
	nop
	set     11, %o0
Do_P0_Tx_Dma11:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_P0_Tx_Dma11)) -> NIU_InitTxDma (0, b, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
P0_Tx_Dma12:
	sllx    %l0, 1, %l0
        andcc   %o3, %l0, %g0
        bz      %xcc, P0_Tx_Dma13
	nop
	set     12, %o0
Do_P0_Tx_Dma12:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_P0_Tx_Dma12)) -> NIU_InitTxDma (0, c, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
P0_Tx_Dma13:
	sllx    %l0, 1, %l0
        andcc   %o3, %l0, %g0
        bz      %xcc, P0_Tx_Dma14
	nop
	set     13, %o0
Do_P0_Tx_Dma13:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_P0_Tx_Dma13)) -> NIU_InitTxDma (0, d, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
P0_Tx_Dma14:
	sllx    %l0, 1, %l0
        andcc   %o3, %l0, %g0
        bz      %xcc, P0_Tx_Dma15
	nop
	set     14, %o0
Do_P0_Tx_Dma14:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_P0_Tx_Dma14)) -> NIU_InitTxDma (0, e, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
P0_Tx_Dma15:
	sllx    %l0, 1, %l0
        andcc   %o3, %l0, %g0
        bz      %xcc, P1_Tx_Dma0
	nop
	set     15, %o0
Do_P0_Tx_Dma15:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_P0_Tx_Dma15)) -> NIU_InitTxDma (0, f, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
P1_Tx_Dma0:
	mov     0x1, %l0
        andcc   %o4, %l0, %g0
        bz      %xcc, p1_Tx_Dma1
        nop
        set     0, %o0
Do_p1_Tx_Dma0:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_p1_Tx_Dma0)) -> NIU_InitTxDma (1, 0, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
p1_Tx_Dma1:
	sllx    %l0, 1, %l0
        andcc   %o4, %l0, %g0
        bz      %xcc, p1_Tx_Dma2
        nop
	set     1, %o0
Do_p1_Tx_Dma1:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_p1_Tx_Dma1)) -> NIU_InitTxDma (1, 1, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
p1_Tx_Dma2:
	sllx    %l0, 1, %l0
        andcc   %o4, %l0, %g0
        bz      %xcc, p1_Tx_Dma3
        nop
	set     2, %o0
Do_p1_Tx_Dma2:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_p1_Tx_Dma2)) -> NIU_InitTxDma (1, 2, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
p1_Tx_Dma3:
	sllx    %l0, 1, %l0
        andcc   %o4, %l0, %g0
        bz      %xcc, p1_Tx_Dma4
        nop
	set     3, %o0
Do_p1_Tx_Dma3:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_p1_Tx_Dma3)) -> NIU_InitTxDma (1, 3, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
p1_Tx_Dma4:
	sllx    %l0, 1, %l0
        andcc   %o4, %l0, %g0
        bz      %xcc, p1_Tx_Dma5
        nop
	set     4, %o0
Do_p1_Tx_Dma4:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_p1_Tx_Dma4)) -> NIU_InitTxDma (1, 4, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
p1_Tx_Dma5:
	sllx    %l0, 1, %l0
        andcc   %o4, %l0, %g0
        bz      %xcc, p1_Tx_Dma6
        nop
	set     5, %o0
Do_p1_Tx_Dma5:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_p1_Tx_Dma5)) -> NIU_InitTxDma (1, 5, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
p1_Tx_Dma6:
	sllx    %l0, 1, %l0
        andcc   %o4, %l0, %g0
        bz      %xcc, p1_Tx_Dma7
        nop
	set     6, %o0
Do_p1_Tx_Dma6:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_p1_Tx_Dma6)) -> NIU_InitTxDma (1, 6, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
p1_Tx_Dma7:
	sllx    %l0, 1, %l0
        andcc   %o4, %l0, %g0
        bz      %xcc, p1_Tx_Dma8
	nop
	set     7, %o0
Do_p1_Tx_Dma7:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_p1_Tx_Dma7)) -> NIU_InitTxDma (1, 7, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
p1_Tx_Dma8:
	sllx    %l0, 1, %l0
        andcc   %o4, %l0, %g0
        bz      %xcc, p1_Tx_Dma9
	nop
	set     8, %o0
Do_p1_Tx_Dma8:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_p1_Tx_Dma8)) -> NIU_InitTxDma (1, 8, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
p1_Tx_Dma9:
	sllx    %l0, 1, %l0
        andcc   %o4, %l0, %g0
        bz      %xcc, p1_Tx_Dma10
	nop
	set     9, %o0
Do_p1_Tx_Dma9:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_p1_Tx_Dma9)) -> NIU_InitTxDma (1, 9, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
p1_Tx_Dma10:
	sllx    %l0, 1, %l0
        andcc   %o4, %l0, %g0
        bz      %xcc, p1_Tx_Dma11
	nop
	set     10, %o0
Do_p1_Tx_Dma10:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_p1_Tx_Dma10)) -> NIU_InitTxDma (1, a, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
p1_Tx_Dma11:
	sllx    %l0, 1, %l0
        andcc   %o4, %l0, %g0
        bz      %xcc, p1_Tx_Dma12
	nop
	set     11, %o0
Do_p1_Tx_Dma11:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_p1_Tx_Dma11)) -> NIU_InitTxDma (1, b, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
p1_Tx_Dma12:
	sllx    %l0, 1, %l0
        andcc   %o4, %l0, %g0
        bz      %xcc, p1_Tx_Dma13
	nop
	set     12, %o0
Do_p1_Tx_Dma12:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_p1_Tx_Dma12)) -> NIU_InitTxDma (1, c, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
p1_Tx_Dma13:
	sllx    %l0, 1, %l0
        andcc   %o4, %l0, %g0
        bz      %xcc, p1_Tx_Dma14
	nop
	set     13, %o0
Do_p1_Tx_Dma13:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_p1_Tx_Dma13)) -> NIU_InitTxDma (1, d, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
p1_Tx_Dma14:
	sllx    %l0, 1, %l0
        andcc   %o4, %l0, %g0
        bz      %xcc, p1_Tx_Dma15
	nop
	set     14, %o0
Do_p1_Tx_Dma14:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_p1_Tx_Dma14)) -> NIU_InitTxDma (1, e, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop
p1_Tx_Dma15:
	sllx    %l0, 1, %l0
        andcc   %o4, %l0, %g0
        bz      %xcc, done_InitTxDma
	nop
	set     15, %o0
Do_p1_Tx_Dma15:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.Do_p1_Tx_Dma15)) -> NIU_InitTxDma (1, f, NIU_Xlate_On, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
        call    SetPage0Registers
        nop

done_InitTxDma:
	ret
	restore				! Return InitTxDMA

SetPage0Registers:
	save

P_SetTxLPMask1:
	mov	%i0, %o0
        mulx    %o0, 0x200, %l2
        setx    TX_LOG_MASK1_Addr, %l7, %l3
        add     %l3, %l2, %l3
#ifdef	XLATE_ON
        setx	NIU_PKTGEN_CSR_EV2A_TX_LOG_MASK1, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        stxa    %l1, [%l3]ASI_PRIMARY_LITTLE    
#else
        stxa    %g0, [%l3]ASI_PRIMARY_LITTLE    
#endif // XLATE_ON

P_SetTxLPValue1:
        mulx    %o0, 0x200, %l2
        setx    TX_LOG_VALUE1_Addr, %l7, %l3
        add     %l3, %l2, %l3
#ifdef	XLATE_ON
	setx    NIU_PKTGEN_CSR_EV2A_TX_LOG_VALUE1, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        stxa    %l1, [%l3]ASI_PRIMARY_LITTLE    
#else
        stxa    %g0, [%l3]ASI_PRIMARY_LITTLE    
#endif // XLATE_ON

P_SetTxLPRELOC1:
        mulx    %o0, 0x200, %l2
        setx    TX_LOG_PAGE_RELO1_Addr, %l7, %l3
        add     %l3, %l2, %l3
#ifdef	XLATE_ON
	setx    NIU_PKTGEN_CSR_EV2A_TX_LOG_PAGE_RELO1, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        stxa    %l1, [%l3]ASI_PRIMARY_LITTLE    
#else
        stxa    %g0, [%l3]ASI_PRIMARY_LITTLE    
#endif // XLATE_ON


SetPage1Registers:

P_SetTxLPMask2:
        mulx    %o0, 0x200, %l2
        setx    TX_LOG_MASK2_Addr, %l7, %l3
        add     %l3, %l2, %l3
#ifdef	XLATE_ON
        setx    NIU_PKTGEN_CSR_EV2A_TX_LOG_MASK2, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        stxa    %l1, [%l3]ASI_PRIMARY_LITTLE    
#else
        stxa    %g0, [%l3]ASI_PRIMARY_LITTLE    
#endif // XLATE_ON

P_SetTxLPValue2:
        mulx    %o0, 0x200, %l2
        setx    TX_LOG_VALUE2_Addr, %l7, %l3
        add     %l3, %l2, %l3
#ifdef	XLATE_ON
        setx    NIU_PKTGEN_CSR_EV2A_TX_LOG_VALUE2, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        stxa    %l1, [%l3]ASI_PRIMARY_LITTLE    
#else
        stxa    %g0, [%l3]ASI_PRIMARY_LITTLE    
#endif // XLATE_ON

P_SetTxLPRELOC2:
        mulx     %o0, 0x200, %l2
        setx    TX_LOG_PAGE_RELO2_Addr, %l7, %l3
        add     %l3, %l2, %l3
#ifdef	XLATE_ON
        setx    NIU_PKTGEN_CSR_EV2A_TX_LOG_PAGE_RELO2, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        stxa    %l1, [%l3]ASI_PRIMARY_LITTLE    
#else
        stxa    %g0, [%l3]ASI_PRIMARY_LITTLE    
#endif // XLATE_ON

SetPageEnables:

P_SetTxLPValid:
	setx    NIU_PKTGEN_CSR_EV2A_TX_LOG_PAGE_VLD, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        mulx     %o0, 0x200, %l2
        setx    TX_LOG_PAGE_VLD_Addr, %l7, %l0
        add     %l0, %l2, %l0
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE    


SetRngConfig:
        setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_CFIG, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        mulx     %o0, 0x200, %l2
        setx    TX_RNG_CFIG_Addr, %l7, %l0
        add     %l0, %l2, %l0
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE

	ret
	restore				! Return InitTxDMA
#else
!/********************************************************************************
!* AddTxChannels:
!*   Currently unused
!* Parameters in registers:
!*   None
!********************************************************************************/
AddTxChannels:
        save
	ret
	restore

.global SetTxMaxBurst
SetTxMaxBurst:
        save
!	mov	%i0, %g7
!	mov	%i1, %g3
	mov	%g0, %l6			! For 16 Tx channel
	cmp	%i0, %l6
	be	SetTxMaxBurst_DMA0
	nop
	inc	%l6
	cmp	%i0, %l6
	be	SetTxMaxBurst_DMA1
	nop
	inc	%l6
	cmp	%i0, %l6
	be	SetTxMaxBurst_DMA2
	nop
	inc	%l6
	cmp	%i0, %l6
	be	SetTxMaxBurst_DMA3
	nop
	inc	%l6
	cmp	%i0, %l6
	be	SetTxMaxBurst_DMA4
	nop
	inc	%l6
	cmp	%i0, %l6
	be	SetTxMaxBurst_DMA5
	nop
	inc	%l6
	cmp	%i0, %l6
	be	SetTxMaxBurst_DMA6
	nop
	inc	%l6
	cmp	%i0, %l6
	be	SetTxMaxBurst_DMA7
	nop
	inc	%l6
	cmp	%i0, %l6
	be	SetTxMaxBurst_DMA8
	nop
	inc	%l6
	cmp	%i0, %l6
	be	SetTxMaxBurst_DMA9
	nop
	inc	%l6
	cmp	%i0, %l6
	be	SetTxMaxBurst_DMA10
	nop
	inc	%l6
	cmp	%i0, %l6
	be	SetTxMaxBurst_DMA11
	nop
	inc	%l6
	cmp	%i0, %l6
	be	SetTxMaxBurst_DMA12
	nop
	inc	%l6
	cmp	%i0, %l6
	be	SetTxMaxBurst_DMA13
	nop
	inc	%l6
	cmp	%i0, %l6
	be	SetTxMaxBurst_DMA14
	nop
	inc	%l6
	cmp	%i0, %l6
	be	SetTxMaxBurst_DMA15
	nop
	inc	%l6
	cmp	%i0, %l6
	be	SetTxMaxBurst_DMA16
	nop
	inc	%l6
	cmp	%i0, %l6
	be	SetTxMaxBurst_DMA17
	nop
	inc	%l6
	cmp	%i0, %l6
	be	SetTxMaxBurst_DMA18
	nop
	inc	%l6
	cmp	%i0, %l6
	be	SetTxMaxBurst_DMA19
	nop
	inc	%l6
	cmp	%i0, %l6
	be	SetTxMaxBurst_DMA20
	nop
	inc	%l6
	cmp	%i0, %l6
	be	SetTxMaxBurst_DMA21
	nop
	inc	%l6
	cmp	%i0, %l6
	be	SetTxMaxBurst_DMA22
	nop
	inc	%l6
	cmp	%i0, %l6
	be	SetTxMaxBurst_DMA23
	nop
TxDMAGreater:
        call test_failed	
        nop     

SetTxMaxBurst_DMA0:
	setx	SetTxMaxBurst_DMA0_Addr, %l7, %l0
	ba	SetTxMaxBurst_End	
	nop
SetTxMaxBurst_DMA1:
	setx	SetTxMaxBurst_DMA1_Addr, %l7, %l0
	ba	SetTxMaxBurst_End	
	nop
SetTxMaxBurst_DMA2:
	setx	SetTxMaxBurst_DMA2_Addr, %l7, %l0
	ba	SetTxMaxBurst_End	
	nop
SetTxMaxBurst_DMA3:
	setx	SetTxMaxBurst_DMA3_Addr, %l7, %l0
	ba	SetTxMaxBurst_End	
	nop
SetTxMaxBurst_DMA4:
	setx	SetTxMaxBurst_DMA4_Addr, %l7, %l0
	ba	SetTxMaxBurst_End	
	nop
SetTxMaxBurst_DMA5:
	setx	SetTxMaxBurst_DMA5_Addr, %l7, %l0
	ba	SetTxMaxBurst_End	
	nop
SetTxMaxBurst_DMA6:
	setx	SetTxMaxBurst_DMA6_Addr, %l7, %l0
	ba	SetTxMaxBurst_End	
	nop
SetTxMaxBurst_DMA7:
	setx	SetTxMaxBurst_DMA7_Addr, %l7, %l0
	ba	SetTxMaxBurst_End	
	nop
SetTxMaxBurst_DMA8:
	setx	SetTxMaxBurst_DMA8_Addr, %l7, %l0
	ba	SetTxMaxBurst_End	
	nop
SetTxMaxBurst_DMA9:
	setx	SetTxMaxBurst_DMA9_Addr, %l7, %l0
	ba	SetTxMaxBurst_End	
	nop
SetTxMaxBurst_DMA10:
	setx	SetTxMaxBurst_DMA10_Addr, %l7, %l0
	ba	SetTxMaxBurst_End	
	nop
SetTxMaxBurst_DMA11:
	setx	SetTxMaxBurst_DMA11_Addr, %l7, %l0
	ba	SetTxMaxBurst_End	
	nop
SetTxMaxBurst_DMA12:
	setx	SetTxMaxBurst_DMA12_Addr, %l7, %l0
	ba	SetTxMaxBurst_End	
	nop
SetTxMaxBurst_DMA13:
	setx	SetTxMaxBurst_DMA13_Addr, %l7, %l0
	ba	SetTxMaxBurst_End	
	nop
SetTxMaxBurst_DMA14:
	setx	SetTxMaxBurst_DMA14_Addr, %l7, %l0
	ba	SetTxMaxBurst_End	
	nop
SetTxMaxBurst_DMA15:
	setx	SetTxMaxBurst_DMA15_Addr, %l7, %l0
	ba	SetTxMaxBurst_End	
	nop
SetTxMaxBurst_DMA16:
	setx	SetTxMaxBurst_DMA16_Addr, %l7, %l0
	ba	SetTxMaxBurst_End	
	nop
SetTxMaxBurst_DMA17:
	setx	SetTxMaxBurst_DMA17_Addr, %l7, %l0
	ba	SetTxMaxBurst_End	
	nop
SetTxMaxBurst_DMA18:
	setx	SetTxMaxBurst_DMA18_Addr, %l7, %l0
	ba	SetTxMaxBurst_End	
	nop
SetTxMaxBurst_DMA19:
	setx	SetTxMaxBurst_DMA19_Addr, %l7, %l0
	ba	SetTxMaxBurst_End	
	nop
SetTxMaxBurst_DMA20:
	setx	SetTxMaxBurst_DMA20_Addr, %l7, %l0
	ba	SetTxMaxBurst_End	
	nop
SetTxMaxBurst_DMA21:
	setx	SetTxMaxBurst_DMA21_Addr, %l7, %l0
	ba	SetTxMaxBurst_End	
	nop
SetTxMaxBurst_DMA22:
	setx	SetTxMaxBurst_DMA22_Addr, %l7, %l0
	ba	SetTxMaxBurst_End	
	nop
SetTxMaxBurst_DMA23:
	setx	SetTxMaxBurst_DMA23_Addr, %l7, %l0
	ba	SetTxMaxBurst_End	
	nop

SetTxMaxBurst_End:
	stxa	%i1, [%l0]ASI_PRIMARY_LITTLE	

	ret
	restore

.global SetTxDMAActive
SetTxDMAActive:
	save
	brgz    %i0, SetPort1DMAActive
	nop
	setx	SetPort0TxDMAActive_Addr, %l7, %l0
	ba	SetTxDMAActive_End
	nop
SetPort1DMAActive :
	setx    SetPort1TxDMAActive_Addr, %l7, %l0
SetTxDMAActive_End :
        stxa    %i1, [%l0]ASI_PRIMARY_LITTLE

	ret
	restore

.global InitTxDma
InitTxDma:
	save
SetPage0Registers:

P_SetTxLPMask1:
	mov	%i0, %o0	
        mulx    %o0, 0x200, %l2
        setx    TX_LOG_MASK1_Addr, %l7, %l3
        add     %l3, %l2, %l3
#ifdef	XLATE_ON
	setx	NIU_PKTGEN_CSR_EV2A_TX_LOG_MASK1, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        stxa    %l1, [%l3]ASI_PRIMARY_LITTLE    
#else
        stxa    %g0, [%l3]ASI_PRIMARY_LITTLE    
#endif // XLATE_ON

P_SetTxLPValue1:
        mulx    %o0, 0x200, %l2
        setx    TX_LOG_VALUE1_Addr, %l7, %l3
        add     %l3, %l2, %l3
#ifdef	XLATE_ON
	setx    NIU_PKTGEN_CSR_EV2A_TX_LOG_VALUE1, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        stxa    %l1, [%l3]ASI_PRIMARY_LITTLE    
#else
        stxa    %g0, [%l3]ASI_PRIMARY_LITTLE    
#endif // XLATE_ON

P_SetTxLPRELOC1:
        mulx    %o0, 0x200, %l2
        setx    TX_LOG_PAGE_RELO1_Addr, %l7, %l3
        add     %l3, %l2, %l3
#ifdef	XLATE_ON
	setx    NIU_PKTGEN_CSR_EV2A_TX_LOG_PAGE_RELO1, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        stxa    %l1, [%l3]ASI_PRIMARY_LITTLE    
#else
        stxa    %g0, [%l3]ASI_PRIMARY_LITTLE    
#endif // XLATE_ON


SetPage1Registers:

P_SetTxLPMask2:
        mulx    %o0, 0x200, %l2
        setx    TX_LOG_MASK2_Addr, %l7, %l3
        add     %l3, %l2, %l3
#ifdef	XLATE_ON
        setx    NIU_PKTGEN_CSR_EV2A_TX_LOG_MASK2, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        stxa    %l1, [%l3]ASI_PRIMARY_LITTLE    
#else
        stxa    %g0, [%l3]ASI_PRIMARY_LITTLE    
#endif // XLATE_ON

P_SetTxLPValue2:
        mulx    %o0, 0x200, %l2
        setx    TX_LOG_VALUE2_Addr, %l7, %l3
        add     %l3, %l2, %l3
#ifdef	XLATE_ON
        setx    NIU_PKTGEN_CSR_EV2A_TX_LOG_VALUE2, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        stxa    %l1, [%l3]ASI_PRIMARY_LITTLE    
#else
        stxa    %g0, [%l3]ASI_PRIMARY_LITTLE    
#endif // XLATE_ON

P_SetTxLPRELOC2:
        mulx    %o0, 0x200, %l2
        setx    TX_LOG_PAGE_RELO2_Addr, %l7, %l3
        add     %l3, %l2, %l3
#ifdef	XLATE_ON
        setx    NIU_PKTGEN_CSR_EV2A_TX_LOG_PAGE_RELO2, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        stxa    %l1, [%l3]ASI_PRIMARY_LITTLE    
#else
        stxa    %g0, [%l3]ASI_PRIMARY_LITTLE    
#endif // XLATE_ON

SetPageEnables:

P_SetTxLPValid:
	setx    NIU_PKTGEN_CSR_EV2A_TX_LOG_PAGE_VLD, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        mulx     %o0, 0x200, %l2
        setx    TX_LOG_PAGE_VLD_Addr, %l7, %l0
        add     %l0, %l2, %l0
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE    


SetRngConfig:
        setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_CFIG, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        mulx     %o0, 0x200, %l2
        setx    TX_RNG_CFIG_Addr, %l7, %l0
        add     %l0, %l2, %l0
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE

	ret
	restore				! Return InitTxDMA
#endif

!/********************************************************************************
!* NiuInitRxDma:
!*   This routine programs the receive DMA channel.
!*   setup_zcp_tbl programs the DMA channel in ZCP block per enabled dma
!*   parameters. If "MULTI_TEST" is not present, then it program the dma channel
!*   for single dma for the existing tests (single-port/single-dma).
!*   NIURX_SetPage0Registers programs the following registers in RDMC block.
!*   The user event first writes the value of these registers in PEU_SRAM via back
!*   door. Then the assembly retrieves the data from the PEU_SRAM
!*   and programs the registers.
!*      RX_MASK1_START
!*      RX_VALID1_START
!*      RX_RELOC1_START
!*      RX_MASK2_START
!*      RX_VALID2_START
!*      RX_RELOC2_START
!*      RX_PAGE_VALID
!*      RBR_CFIG_A
!*      RBR_CFIG_B
!*      RCR_CFIG_A
!*      RXDMA_CFIG1
!*      RXDMA_CFIG2_START
!*      RXDMA_CFIG1
!*      RBR_KICK
!*
!* Parameters in registers:
!*   %o0: ???
!*   %o6: ???
!********************************************************************************/
.global NiuInitRxDma
NiuInitRxDma:
	save
	mov	%i0, %o0	
        mov     %i6, %o6
!       call    setup_zcp_tbl
!       nop



#ifdef MULTI_TEST
setup_zcp_tbl:  
!       mov     %i0, %o0
!       mov     %i6, %o6

        brz     %i6, 2f
        nop
prog_zcp_tbl:
        call    init_zcp_tbl_8dma
        nop
2:
#else
NIURx_SetZcpRdc:
!       setx   RXDMA_CHNL, %l7, %g3
!       save    
        setx    ZCP_RDC_TBL_Addr, %l7, %l0
        stxa    %i0, [%l0]ASI_PRIMARY_LITTLE

        add     0x100, %l0, %l0
        stxa    %i0, [%l0]ASI_PRIMARY_LITTLE

        add     0x200, %l0, %l0
        stxa    %i0, [%l0]ASI_PRIMARY_LITTLE

        add     0x200, %l0, %l0
        stxa    %i0, [%l0]ASI_PRIMARY_LITTLE

        add     0x200, %l0, %l0
        stxa    %i0, [%l0]ASI_PRIMARY_LITTLE

!       ret
!       restore
#endif
NIURX_SetPage0Registers:
P_SetRxLogMask1:
        mulx    %o0, 0x40, %l2
        setx    RX_LOG_MASK1_START_Addr, %l7, %l3
        add     %l3, %l2, %l3
#ifdef  XLATE_ON
        setx    NIU_PKTGEN_CSR_EV2A_RX_LOG_MASK1, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        stxa    %l1, [%l3]ASI_PRIMARY_LITTLE
#else
        stxa    %g0, [%l3]ASI_PRIMARY_LITTLE
#endif // XLATE_ON

P_SetRxLogVal1:
        mulx    %o0, 0x40, %l2
        setx    RX_LOG_VAL1_START_Addr, %l7, %l3
        add     %l3, %l2, %l3
#ifdef  XLATE_ON
        setx    NIU_PKTGEN_CSR_EV2A_RX_LOG_VAL1, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        stxa    %l1, [%l3]ASI_PRIMARY_LITTLE
#else
        stxa    %g0, [%l3]ASI_PRIMARY_LITTLE
#endif // XLATE_ON

P_SetRxLogRelo1:
        mulx    %o0, 0x40, %l2
        setx    RX_LOG_RELO1_START_Addr, %l7, %l3
        add     %l3, %l2, %l3
#ifdef  XLATE_ON
        setx    NIU_PKTGEN_CSR_EV2A_RX_LOG_RELO1, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        stxa    %l1, [%l3]ASI_PRIMARY_LITTLE
#else
        stxa    %g0, [%l3]ASI_PRIMARY_LITTLE
#endif // XLATE_ON

NIURX_SetPage1Registers:
P_SetRxLogMask2:
        mulx    %o0, 0x40, %l2
        setx    RX_LOG_MASK2_START_Addr, %l7, %l3
        add     %l3, %l2, %l3
#ifdef  XLATE_ON
        setx    NIU_PKTGEN_CSR_EV2A_RX_LOG_MASK2, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        stxa    %l1, [%l3]ASI_PRIMARY_LITTLE
#else
        stxa    %g0, [%l3]ASI_PRIMARY_LITTLE
#endif // XLATE_ON

P_SetRxLogVal2:
        mulx    %o0, 0x40, %l2
        setx    RX_LOG_VAL2_START_Addr, %l7, %l3
        add     %l3, %l2, %l3
#ifdef  XLATE_ON
        setx    NIU_PKTGEN_CSR_EV2A_RX_LOG_VAL2, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        stxa    %l1, [%l3]ASI_PRIMARY_LITTLE
#else
        stxa    %g0, [%l3]ASI_PRIMARY_LITTLE
#endif // XLATE_ON

P_SetRxLogRelo2:
        mulx    %o0, 0x40, %l2
        setx    RX_LOG_RELO2_START_Addr, %l7, %l3
        add     %l3, %l2, %l3
#ifdef  XLATE_ON
        setx    NIU_PKTGEN_CSR_EV2A_RX_LOG_RELO2, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        stxa    %l1, [%l3]ASI_PRIMARY_LITTLE
#else
        stxa    %g0, [%l3]ASI_PRIMARY_LITTLE
#endif // XLATE_ON

P_SetRxLogPgVld:
        setx    NIU_PKTGEN_CSR_EV2A_RX_LOG_PAGE_VLD, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        mulx    %o0, 0x40, %l2
        setx    RX_LOG_PAGE_VLD_Addr, %l7, %l0
        add     %l0, %l2, %l0
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE

P_SetRbrConfig_A:
        setx    NIU_PKTGEN_CSR_EV2A_RBR_CFIG_A, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        mulx    %o0, 0x200, %l2
        setx    RBR_CFIG_A_Addr, %l7, %l0
        add     %l0, %l2, %l0
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE

P_SetRbrConfig_B:
        setx    NIU_PKTGEN_CSR_EV2A_RBR_CFIG_B, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        mulx    %o0, 0x200, %l2
        setx    RBR_CFIG_B_Addr, %l7, %l0
        add     %l0, %l2, %l0
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE

P_SetRcrConfig_A:
        setx    NIU_PKTGEN_CSR_EV2A_RCR_CFIG_A, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        mulx    %o0, 0x200, %l2
        setx    RCR_CFIG_A_Addr, %l7, %l0
        add     %l0, %l2, %l0
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE

P_SetRxDmaCfig_1_0:
        setx    NIU_PKTGEN_CSR_EV2A_RXDMA_CFIG1_0, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        mulx    %o0, 0x200, %l2
        setx    RXDMA_CFIG1_Addr, %l7, %l0
        add     %l0, %l2, %l0
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE

P_SetRxdmaCfig2Start:
        setx    NIU_PKTGEN_CSR_EV2A_RXDMA_CFIG2, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        mulx    %o0, 0x200, %l2
        setx    RXDMA_CFIG2_START_Addr, %l7, %l0
        add     %l0, %l2, %l0
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE

P_SetRxDmaCfig_1_1:
        setx    NIU_PKTGEN_CSR_EV2A_RXDMA_CFIG1_1, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        mulx    %o0, 0x200, %l2
        setx    RXDMA_CFIG1_Addr, %l7, %l0
        add     %l0, %l2, %l0
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE

P_SetRxRingKick:
        setx    NIU_PKTGEN_CSR_EV2A_RBR_KICK, %l7, %l0
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l0], %l1
        lduw    [%l0+4], %l2
        sllx    %l1, 32, %l1
        add     %l2, %l1, %l1
#else // FC_NO_PEU_VERA
        ldx     [%l0], %l1
#endif // FC_NO_PEU_VERA
        mulx    %o0, 0x200, %l2
        setx    RBR_KICK_Addr, %l7, %l0
        add     %l0, %l2, %l0
        stxa    %l1, [%l0]ASI_PRIMARY_LITTLE

        ret
        restore                 ! Return NiuInitRxDma

!/********************************************************************************
!* NiuTx_check_pkt_cnt:
!*   ???
!* Parameters in registers:
!*   %o0: MAC id
!*   %o1: Expected number of TX packets
!********************************************************************************/
.global NiuTx_check_pkt_cnt
NiuTx_check_pkt_cnt:
	save
	mov	%i0, %o0	! %i0 = Mac_id
	clr	%l6
	clr	%i3
	mov	Time_out, %i2

	setx	TXC_PKT_XMIT_Addr, %l7, %l0
        mulx    %o0, 0x100, %l2
        add     %l0, %l2, %l0
	setx	TXC_PKT_XMIT_Mask, %l7, %l4

loop_XMIT_Rd:
	clr	%i3
loop_timeout_XMIT_Rd:
	ldxa    [%l0]ASI_PRIMARY_LITTLE, %l1

	and	%l1, %l4, %l1
	cmp	%i1, %l1	! %i1 2nd parameter no. of Tx pkts
	be	Count_match
	nop
	cmp	%l1, %l6
	bne	loop_XMIT_Rd
	mov	%l1, %l6	! save a copy

	inc	%i3

	call	delay_1
	nop

	cmp	%i2, %i3	! %i2 = Timeout value; %i3 = Timeout counter
	bne	loop_timeout_XMIT_Rd
	nop
NIUTxcPktXmitTimeout:
! $EV trig_pc_d(1, expr(@VA(.RED_EXT_SEC.NIUTxcPktXmitTimeout) + 4, 16, 16)) -> printf("ERROR : NIUTxcPktXmitTimeout",*,1)
	call	Timeout
	nop

Count_match:
! $EV trig_pc_d(1, expr(@VA(.RED_EXT_SEC.Count_match) + 8, 16, 16)) -> printf("Tx Count Match",*,1)

#if (MAC_SPEED0==1000) && (MAC_SPEED1==1000)	/* Extra delay for 1G after the last packet is DMA-ed */
	call	delay_10
	nop

	call	delay_10
	nop
#endif /* (MAC_SPEED0==1000) && (MAC_SPEED1==1000) */
	ret
	restore				! Return NiuTx_check_pkt_cnt:


/* ************************************************************************ 
 .global Check_NIU_Int
Check_NIU_Int:
        save
        mov     %i0, %o0        ! %i0 = Mac_id
        clr     %l6
        clr     %i3
        mov     NIU_Trap_TimeOut, %i2

        setx    0x300000000, %l7, %l0

loop_NIU_Trap_Rd:
        clr     %i3
loop_timeout_NIU_Trap_Rd:
        ldxa    [%l0]ASI_PRIMARY_LITTLE, %l1

        cmp     %i1, %l1        ! %i1 2nd parameter no. of Tx pkts
        be      NIU_Trap_Count_match
        nop
        cmp     %l1, %l6
        bne     loop_NIU_Trap_Rd
        mov     %l1, %l6        ! save a copy

        inc     %i3

        call    delay_1
        nop

        cmp     %i2, %i3        ! %i2 = Timeout value; %i3 = Timeout counter
        bne     loop_timeout_NIU_Trap_Rd
        nop
NIU_Trap_TimeOut:
! $EV trig_pc_d(1, expr(@VA(.RED_EXT_SEC.NIU_Trap_TimeOut) + 4, 16, 16)) -> printf("ERROR : NIU_Trap_TimeOut",*,1)
        call    Timeout
        nop

NIU_Trap_Count_match:
! $EV trig_pc_d(1, expr(@VA(.RED_EXT_SEC.Count_match) + 8, 16, 16)) -> printf("NIU Trap Count Match",*,1)

        ret
        restore                         ! Return Check_NIU_Int

 ************************************************************************ */
.global test_failed
test_failed:
        EXIT_BAD
