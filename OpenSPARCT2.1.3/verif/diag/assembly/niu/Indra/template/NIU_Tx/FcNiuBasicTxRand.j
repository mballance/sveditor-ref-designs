template main ();

%%section c_declarations
	int myrand ;
%%section init

	myrand = random()&0xff;

#ij ifdef MT
	IJ_bind_thread_group(th_rand,myrand);

	IJ_bind_thread_group(th_all, 0xff);

	IJ_bind_thread_group(th_0, 0x01);
	IJ_bind_thread_group(th_1, 0x02);
	IJ_bind_thread_group(th_2, 0x04);
	IJ_bind_thread_group(th_3, 0x08);
	IJ_bind_thread_group(th_4, 0x10);
	IJ_bind_thread_group(th_5, 0x20);
	IJ_bind_thread_group(th_6, 0x40);
	IJ_bind_thread_group(th_7, 0x80);
#ij else
	IJ_bind_thread_group(th_all, 0x01);
	IJ_bind_thread_group(th_A, 0x01);
	IJ_bind_thread_group(th_B,0x01);
#ij endif
	
#ij ifdef TX_DMA_CH_NO
	IJ_set_rvar(NIU_TX_DMA_CH_NO, "{0,15}");
#ij else
	IJ_set_rvar(NIU_TX_DMA_CH_NO, "4'h0");		/* IJ_set_rvar(NIU_TX_DMA_CH_NO, "{0..23}"); */
#ij endif

#ij ifdef TX_PKT_CNT
	IJ_set_rvar(NIU_TX_PKT_CNT, "16'h00rr");
#ij else
	IJ_set_rvar(NIU_TX_PKT_CNT, "16'h0010");	/* IJ_set_rvar(NIU_TX_PKT_CNT, "16'hrrrr"); */
#ij endif

#ij ifdef TX_PKT_LEN
	IJ_set_rvar(NIU_TX_PKT_LEN, "{64,100,1500}");
#ij else
	IJ_set_rvar(NIU_TX_PKT_LEN, "16'h0040");
#ij endif

#ij ifdef TX_DESC_START_ADDR
	IJ_set_rvar(NIU_TX_DESC_START_ADDR, "64'h0000_0001_rrrr_0000");
#ij else
	IJ_set_rvar(NIU_TX_DESC_START_ADDR, "64'h0000_0001_0000_0000");
#ij endif

%asm{
#define MAIN_PAGE_HV_ALSO

#include "hboot.s"
#include "niu_defines.h"

.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop


%}

	IJ_printf (th_A, "!\n");
	IJ_printf (th_A, "! Thread 0 Start\n");
	IJ_printf (th_A, "!\n");
	IJ_printf (th_A, "!\n");
	IJ_printf (th_A, "!thread_0:\n");

	IJ_printf (th_A, "\nInit_flow:");
	IJ_printf (th_A, "\n\tnop");
	IJ_printf (th_A, "\t ! $EV trig_pc_d(1, @VA(.MAIN.Init_flow)) -> pktGenConfig(MAC_ID, FRAME_TYPE, FRAME_CLASS, %0ll16x)\n",(IJ_get_rvar_val32(NIU_TX_PKT_LEN)));

        IJ_printf (th_A, "\nP_TxDMAActivate:");
	IJ_printf (th_A, "\n\tsetx    MAC_ID, %%g1, %%o0");
	IJ_printf (th_A, "\n\tsetx    0x%0ll16x, %%g1, %%o1", (1<<(IJ_get_rvar_val32(NIU_TX_DMA_CH_NO))));
	IJ_printf (th_A, "\n\tcall    SetTxDMAActive");
        IJ_printf (th_A, "\n\tnop");
        IJ_printf (th_A, "\t ! $EV trig_pc_d(1, @VA(.MAIN.P_TxDMAActivate)) -> NIU_TxDMAActivate (MAC_ID, %0ll16x)\n \n",(1<<(IJ_get_rvar_val32(NIU_TX_DMA_CH_NO))));
	IJ_printf (th_A, "\n\tsetx    XMAC0_MAX_addr, %%g7, %%g2");

        IJ_printf (th_A, "\nP_AddTxChannels:");
	IJ_printf (th_A, "\n\tnop");
	IJ_printf (th_A, "\t ! $EV trig_pc_d(1, @VA(.MAIN.P_AddTxChannels)) -> NIU_AddTxChannels(MAC_ID, %0ll4x)\n", (IJ_get_rvar_val32(NIU_TX_DMA_CH_NO)));
	IJ_printf (th_A, "\tldxa    [%%g2]ASI_PRIMARY_LITTLE, %%g5");
	IJ_printf (th_A, "\n\tnop\n");

        IJ_printf (th_A, "\nP_SetTxMaxBurst:");
	IJ_printf (th_A, "\n\tsetx    0x%0ll16x, %%g1, %%o0", (IJ_get_rvar_val32(NIU_TX_DMA_CH_NO)));
	IJ_printf (th_A, "\n\tsetx    SetTxMaxBurst_Data, %%g1, %%o1");
	IJ_printf (th_A, "\n\tcall    SetTxMaxBurst");
        IJ_printf (th_A, "\n\tnop");
        IJ_printf (th_A, "\t ! $EV trig_pc_d(1, @VA(.MAIN.P_SetTxMaxBurst)) -> NIU_SetTxMaxBurst (MAC_ID, %0ll4x, TxMaxBurst_Data)\n", (IJ_get_rvar_val32(NIU_TX_DMA_CH_NO)));
	IJ_printf (th_A, "\tldxa    [%%g2]ASI_PRIMARY_LITTLE, %%g5");
	IJ_printf (th_A, "\n\tnop\n");

        IJ_printf (th_A, "\nP_InitTxDma:");
	IJ_printf (th_A, "\n\tsetx    0x%0ll4x, %%g1, %%o0", (IJ_get_rvar_val32(NIU_TX_DMA_CH_NO)));
        IJ_printf (th_A, "\n\tnop");
        IJ_printf (th_A, "\t ! $EV trig_pc_d(1, @VA(.MAIN.P_InitTxDma)) -> NIU_InitTxDma (MAC_ID, %0ll4x, NIU_Xlate_On)\n", (IJ_get_rvar_val32(NIU_TX_DMA_CH_NO)));
	IJ_printf (th_A, "\tcall    InitTxDma");
	IJ_printf (th_A, "\n\tnop");
	IJ_printf (th_A, "\n\tldxa    [%%g2]ASI_PRIMARY_LITTLE, %%g5");
	IJ_printf (th_A, "\n\tnop\n");

	IJ_printf (th_A, "\nGen_Packet:\n");
	IJ_printf (th_A, "\tnop");
	IJ_printf (th_A, "\t ! $EV trig_pc_d(1, @VA(.MAIN.Gen_Packet)) -> TxPktGen(MAC_ID, %0ll4x, 0x%0ll8x,0,0)\n", (IJ_get_rvar_val32(NIU_TX_DMA_CH_NO)), (IJ_get_rvar_val32(NIU_TX_PKT_CNT)));
	IJ_printf (th_A, "\tnop\n\n");
	
%asm{
        setx    0x5, %g1, %g4
delay_loop_tmp:
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop_tmp
        nop
%}

	IJ_printf (th_A, "\nSetTxRingKick:");
	IJ_printf (th_A, "\n\tsetx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %%g1, %%g2");
        IJ_printf (th_A, "\t ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick)) -> NIU_SetTxRingKick(MAC_ID, %0ll4x)\n", (IJ_get_rvar_val32(NIU_TX_DMA_CH_NO)));
	IJ_printf (th_A, "\tsetx    0x%0ll4x,    %%g1, %%o0", (IJ_get_rvar_val32(NIU_TX_DMA_CH_NO)));
	IJ_printf (th_A, "\n\tldx     [%%g2]                  , %%g3");
	IJ_printf (th_A, "\n\tnop");
	IJ_printf (th_A, "\n\tmulx     %%o0, 0x200, %%g5");
	IJ_printf (th_A, "\n\tsetx    TX_RING_KICK_Addr, %%g1, %%g2");
	IJ_printf (th_A, "\n\tadd     %%g2, %%g5, %%g2");
	IJ_printf (th_A, "\n\tstxa    %%g3, [%%g2]ASI_PRIMARY_LITTLE");
	IJ_printf (th_A, "\n\tnop\n");

	IJ_printf (th_A, "\nSetTxCs:");
	IJ_printf (th_A, "\n\tsetx    0x%0ll4x, %%g1, %%o0", (IJ_get_rvar_val32(NIU_TX_DMA_CH_NO)));
        IJ_printf (th_A, "\n\tsetx    TX_CS_Data, %%g1, %%g3");
        IJ_printf (th_A, "\n\tmulx     %%o0, 0x200, %%g5");
        IJ_printf (th_A, "\n\tsetx    TX_CS_Addr, %%g1, %%g2");
        IJ_printf (th_A, "\n\tadd     %%g2, %%g5, %%g2");
        IJ_printf (th_A, "\n\tstxa     %%g3, [%%g2]ASI_PRIMARY_LITTLE");
        IJ_printf (th_A, "\n\tnop\n\n");


%asm{
#ifdef JUMBO_FRAME_EN
        setx    loop_count, %g1, %g4
delay_loop:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop
        nop
#endif

%}
	IJ_printf (th_A, "\nNIUTx_Pkt_Cnt_Chk:");
	IJ_printf (th_A, "\n\tsetx    MAC_ID, %%g1, %%o0");
	IJ_printf (th_A, "\n\tsetx    0x%0ll4x, %%g1, %%o1", (IJ_get_rvar_val32(NIU_TX_PKT_CNT)));
	IJ_printf (th_A, "\n\tcall    NiuTx_check_pkt_cnt");
        IJ_printf (th_A, "\n\tnop\n\n");

%asm{
        setx    loop_count, %g1, %g4
delay_loop_end:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop_end
        nop
%}
%% !section init

%%section finish

	IJ_printf (th_A, "\ntest_passed:");
	IJ_printf (th_A, "\n\tnop");
        IJ_printf (th_A, "\t ! $EV trig_pc_d(1, @VA(.MAIN.test_passed)) -> NIU_EXIT_chk(MAC_ID)\n");
	
%asm{
        EXIT_GOOD

%}

	IJ_printf (th_A, "\n/************************************************************************");
	IJ_printf (th_A, "\n   Test case data start");
	IJ_printf (th_A, "\n************************************************************************/\n");


%asm{
SECTION       SetRngConfig_init data_va=0x100000000
attr_data {
	Name = SetRngConfig_init,
	hypervisor,
	compressimage
	}
.data
SetRngConfig_init:
        .xword 0x0060452301000484

SECTION       SetTxRingKick_init data_va=0x100000100
attr_data {
	Name = SetTxRingKick_init,
	hypervisor,
	compressimage
	}
.data
SetTxRingKick_init:
        .xword 0x0060452301000484

SECTION       SetTxLPMask1_init data_va=0x100000200
attr_data {
        Name = SetTxLPMask1_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPMask1_init:
        .xword 0x0060452301000484

SECTION       SetTxLPValue1_init data_va=0x100000300
attr_data {
        Name = SetTxLPValue1_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPValue1_init:
        .xword 0x0060452301000484

SECTION       SetTxLPRELOC1_init data_va=0x100000400
attr_data {
        Name = SetTxLPRELOC1_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPRELOC1_init:
        .xword 0x0060452301000484
SECTION       SetTxLPMask2_init data_va=0x100000500
attr_data {
        Name = SetTxLPMask2_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPMask2_init:
        .xword 0x0060452301000484
SECTION       SetTxLPValue2_init data_va=0x100000600
attr_data {
        Name = SetTxLPValue2_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPValue2_init:
        .xword 0x0060452301000484

SECTION       SetTxLPRELOC2_init data_va=0x100000700
attr_data {
        Name = SetTxLPRELOC2_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPRELOC2_init:
        .xword 0x0060452301000484

SECTION       SetTxLPValid_init data_va=0x100000800
attr_data {
        Name = SetTxLPValid_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPValid_init:
        .xword 0x0060452301000484


%}
%% !section finish

%%section null_grammar

endtemplate
