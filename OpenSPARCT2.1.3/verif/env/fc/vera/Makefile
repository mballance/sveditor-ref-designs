################################################################################
## File:	Makefile
## Notes:	runs with "gmake" only, not with "make"
##
## Description:
## -----------
##	Top level Makefile for compiling Vera/NTB environment.
##
## $Id: Makefile,v 1.6.4.2 2008/06/19 08:36:03 ib135226 Exp $
################################################################################

################################################################################
# variable declarations
################################################################################

#define	N2_FC

.SUFFIXES:

VERA_LIBDIR    ?= ./lib
THIS_DIR       := ${PWD}
ECHO           := echo
COPY_CMD       = cp -f $< $@ 

ILU_PEU_DIR := ${DV_ROOT}/verif/env/ilu_peu/vera
PKT_DIR := ${DV_ROOT}/verif/env/common/vera/niu_ippktgen
COMMON_DIR     := ${DV_ROOT}/verif/env/common/vera
TCU_DIR := ${DV_ROOT}/verif/env/tcu/vera
NIU_UTIL_DIR := ${DV_ROOT}/verif/env/niu/vera/niu_utils/include
NIU_PKT_DIR := ${DV_ROOT}/verif/env/common/vera/niu_ippktgen/include
NIU_DMC_UTIL_DIR := ${DV_ROOT}verif/env/niu/vera/dmc_utils
CTOP := ${DV_ROOT}/verif/env/common/coverage

# Add new generic defines to existing config file line -vera_build_args=VERA_SYS_DEFS="".
VERA_SYS_DEFS  ?=
# for any user to use and over-ride at will via command line. Leave alone in here.
VERA_DEFS      ?=

ALL_VERA_DEFS := $(VERA_SYS_DEFS) $(VERA_DEFS)

ifdef RTL_NO_SPC_LIST
ALL_VERA_DEFS      += $(RTL_NO_SPC_LIST)
endif

ifdef USE_JTAG_DRIVER
ifdef FC_JTAG_DEBUG_COVERAGE
COV_UNIT_NCU        += ncu
VERA_DEFS_COV       += -DFC_JTAG_DEBUG_COVERAGE
endif
ALL_VERA_DEFS  += -DUSE_JTAG_DRIVER
endif

#this macro was already there before OpenSparc T2
ifdef FC_NO_PEU_VERA
ALL_VERA_DEFS  += -DFC_NO_PEU_VERA
endif

# added these 3 macros for OpenSPARC
ifdef FC_NO_PEU_T2
ALL_VERA_DEFS  += -DFC_NO_PEU_T2
endif
ifdef FC_NO_NIU_T2
ALL_VERA_DEFS  += -DFC_NO_NIU_T2
endif

ifdef PEU_SYSTEMC_T2
ALL_VERA_DEFS  += -DPEU_SYSTEMC_T2
endif

ifdef NIU_SYSTEMC_T2
ALL_VERA_DEFS  += -DNIU_SYSTEMC_T2
endif


ifdef BUILD_USE_BOBO
ALL_VERA_DEFS  += -DBUILD_USE_BOBO -DUSE_BOBO
endif

ifndef FC_NO_NIU_T2
VPATH          :=  \
${PWD}/include ${PWD}/classes ${PWD}/interfaces ${PWD} \
$(COMMON_DIR)/ccxDevices \
$(COMMON_DIR)/include $(COMMON_DIR)/classes $(COMMON_DIR)/interfaces \
$(TCU_DIR)/include $(NIU_UTIL_DIR) $(NIU_PKT_DIR) $(PKT_DIR) $(PKT_DIR)/include \
${PWD}/../../../../design/sys/iop/cpu/rtl
else
VPATH          :=  \
${PWD}/include ${PWD}/classes ${PWD}/interfaces ${PWD} \
$(COMMON_DIR)/ccxDevices \
$(COMMON_DIR)/include $(COMMON_DIR)/classes $(COMMON_DIR)/interfaces \
$(TCU_DIR)/include \
${PWD}/../../../../design/sys/iop/cpu/rtl
endif

ifdef GATESIM
ORDERD_LIST   := \
std_display_class.vr \
baseUtilsClass.vr \
sparcBenchUtils.vr \
baseParamsClass.vr \
sparcParams.vr \
ssi.vr \
utilsClass.vr \
memArray.vr \
fc_niu_ev2a.vr \
basePktClass.vr \
cpxPktClass.vr \
pcxPktClass.vr \
ccxDevBaseBFM.vr \
ccxDevMemBFM.vr \
ccxDevSpcBFM.vr \
ccxPktMon.vr \
ccx_tag_class.vr \
asmEvent.vr \
asmEventsToVera.vr \
baseAsmToVeraIntf.vr \
asmToVeraIntf.vr \
generic_ev_packet.vr \
cpxorder.vr \
FcMcuMon.vr \
siu_ncu_mondo_checker.vr \
fc_top.vr
else
ifdef FC_NO_NIU_T2
ORDERD_LIST   := \
std_display_class.vr \
baseUtilsClass.vr \
sparcBenchUtils.vr \
baseParamsClass.vr \
sparcParams.vr \
ssi.vr \
utilsClass.vr \
memArray.vr \
basePktClass.vr \
cpxPktClass.vr \
pcxPktClass.vr \
ccxDevBaseBFM.vr \
ccxDevMemBFM.vr \
ccxDevSpcBFM.vr \
ccxPktMon.vr \
ccx_tag_class.vr \
asmEvent.vr \
asmEventsToVera.vr \
baseAsmToVeraIntf.vr \
asmToVeraIntf.vr \
generic_ev_packet.vr \
cpxorder.vr \
l2jbi.vr \
FcMcuMon.vr \
siu_ncu_mondo_checker.vr \
fc_top.vr
else
ORDERD_LIST   := \
std_display_class.vr \
baseUtilsClass.vr \
sparcBenchUtils.vr \
baseParamsClass.vr \
sparcParams.vr \
ssi.vr \
utilsClass.vr \
memArray.vr \
fc_niu_ev2a.vr \
basePktClass.vr \
cpxPktClass.vr \
pcxPktClass.vr \
ccxDevBaseBFM.vr \
ccxDevMemBFM.vr \
ccxDevSpcBFM.vr \
ccxPktMon.vr \
ccx_tag_class.vr \
asmEvent.vr \
asmEventsToVera.vr \
baseAsmToVeraIntf.vr \
asmToVeraIntf.vr \
generic_ev_packet.vr \
cpxorder.vr \
l2jbi.vr \
FcMcuMon.vr \
siu_ncu_mondo_checker.vr \
fc_top.vr
endif
endif

# these files also need headers made by vera
ifdef GATESIM
ORDERD_LIST_VRH   := \
FcMcuMon.vr \
siu_ncu_mondo_checker.vr
else
ORDERD_LIST_VRH   := \
FcMcuMon.vr \
fcShadowScanClass.vr \
siu_ncu_mondo_checker.vr
endif


ifdef FC_COVERAGE
COV_UNIT_NCU        += ncu
COV_UNIT_L2	    += l2
COV_UNIT_MCU	    += mcu
COV_UNIT_DMU        += dmu
COV_UNIT_SIU        += siu
COV_UNIT_FC         += fc
COV_UNITS_ILU_PEU   += ilu_peu
VERA_DEFS_COV       += -DFC_COVERAGE
endif

ifdef GATESIM
VERA_DEFS_GATE      += -DGATESIM
endif
ifdef DMU_GATE
VERA_DEFS_GATE      += -DDMU_GATE
endif
ifdef NIU_GATE
VERA_DEFS_GATE      += -DNIU_GATE
endif
ifdef NCU_GATE
VERA_DEFS_GATE      += -DNCU_GATE
endif
ifdef MCU_GATE
VERA_DEFS_GATE      += -DMCU_GATE
endif
ifdef CCX_GATE
VERA_DEFS_GATE      += -DCCX_GATE
endif
ifdef TCU_GATE
VERA_DEFS_GATE      += -DTCU_GATE
endif
ifdef EFU_GATE
VERA_DEFS_GATE      += -DEFU_GATE
endif

FC_COMMON_INCLUDE := $(wildcard $(COMMON_DIR)include/*.vri) 

FC_IOS_RAS := ${DV_ROOT}/verif/env/ios/vera/include/ios_verilog_tasks.vri

# targets list. .vro's we want to make.
# files in ORDERD_VRH will have headers made too
ORDERD_VRH     := $(patsubst %.vr,$(VERA_LIBDIR)/%.vrh,$(ORDERD_LIST_VRH))
ORDERD_VRO     := $(patsubst %.vr,$(VERA_LIBDIR)/%.vro,$(ORDERD_LIST))
VERA_DEP       := $(foreach dir,$(VPATH),$(wildcard $(dir)/*.vr*))

# vera command line defines
EMPTY          :=
SPACE          := $(EMPTY) $(EMPTY)
VERA_INCDIR    := $(subst $(SPACE),$(SPACE)-I,$(VPATH))
VERA_INCDIR    := -I$(VERA_INCDIR) -I.


# NTB  command line defines
NTB_INCDIR     := $(subst $(SPACE),+,$(VPATH))
NTB_INCDIR     := -ntb_incdir $(NTB_INCDIR)
NTB_OPTS       := -ntb_opts compat+verbose
# add for 7.1.1 +file_by_file

# commands
VERA_VRH       := vera -cmp -DFC_BENCH ${ALL_VERA_DEFS} ${VERA_DEFS_COV} ${VERA_DEFS_GATE} $(VERA_INCDIR) -max_error 5 -q -g  -H
VERA_VRO       := vera -cmp -DFC_BENCH ${ALL_VERA_DEFS} ${VERA_DEFS_COV} ${VERA_DEFS_GATE} $(VERA_INCDIR) -max_error 5 -q -g

VERA_NTB       := vcs -ntb -ntb_define NTB -ntb_define FC_BENCH -ntb_cmp -ntb_sname cmp_test -ntb_filext .vr+.vrh+.vri+.vrl $(NTB_OPTS) $(NTB_INCDIR) $(ORDERD_LIST) -Mupdate


################################################################################
# NIU_DMC_UTIL Stuff
################################################################################
NIU_DMC_UTIL_DIR := ${DV_ROOT}/verif/env/niu/vera/niu_utils/include

NIU_DMC_UTIL_COMMON_INCLUDE         := $(wildcard $(NIU_DMC_UTIL_DIR)/*.vri)
NIU_DMC_UTIL_COMMON_INCLUDE         := $(subst $(NIU_DMC_UTIL_DIR),$(VERA_LIBDIR),$(NIU_DMC_UTIL_COMMON_INCLUDE))

NIU_DMC_UTILS_DIR   := ${DV_ROOT}/verif/env/niu/vera/dmc_utils

NIU_DMC_UTILS       := $(NIU_DMC_UTILS_DIR)/niu_dmc_descr.vr
NIU_DMC_UTILS       += $(NIU_DMC_UTILS_DIR)/niu_dmc_descr_ring.vr
NIU_DMC_UTILS       += $(NIU_DMC_UTILS_DIR)/niu_dma.vr
NIU_DMC_UTILS       := $(subst $(NIU_DMC_UTILS_DIR),$(VERA_LIBDIR),$(NIU_DMC_UTILS))
NIU_DMC_UTILS_VRH   := $(patsubst %.vr,%.vrh,$(NIU_DMC_UTILS))
NIU_DMC_UTILS_VRO   := $(patsubst %.vr,%.vro,$(NIU_DMC_UTILS))

################################################################################
# NIU_UTIL Stuff
################################################################################
NIU_UTIL_DIR := ${DV_ROOT}/verif/env/niu/vera/niu_utils/include

NIU_UTIL_COMMON_INCLUDE         := $(wildcard $(NIU_UTIL_DIR)/*.vri)
NIU_UTIL_COMMON_INCLUDE         := $(subst $(NIU_UTIL_DIR),$(VERA_LIBDIR),$(NIU_UTIL_COMMON_INCLUDE))

NIU_UTILS_DIR   := ${DV_ROOT}/verif/env/niu/vera/niu_utils

NIU_UTILS       := $(NIU_UTILS_DIR)/mbox_class.vr
NIU_UTILS       += $(NIU_UTILS_DIR)/get_mbox_id.vr
NIU_UTILS       += $(NIU_UTILS_DIR)/cMesg.vr
NIU_UTILS       += $(NIU_UTILS_DIR)/niu_cntrl.vr
NIU_UTILS       := $(subst $(NIU_UTILS_DIR),$(VERA_LIBDIR),$(NIU_UTILS))
NIU_UTILS_VRH   := $(patsubst %.vr,%.vrh,$(NIU_UTILS))
NIU_UTILS_VRO   := $(patsubst %.vr,%.vro,$(NIU_UTILS))

################################################################################
# NIU PACKET stuff
################################################################################
NIU_PKT_DIR := ${DV_ROOT}/verif/env/common/vera/niu_ippktgen/include

NIU_PKT_COMMON_INCLUDE         := $(wildcard $(NIU_PKT_DIR)/*.vri)
NIU_PKT_COMMON_INCLUDE         := $(subst $(NIU_PKT_DIR),$(VERA_LIBDIR),$(NIU_PKT_COMMON_INCLUDE))

NIU_PKTS_DIR   := ${DV_ROOT}/verif/env/common/vera/niu_ippktgen

NIU_PKTS       := $(NIU_PKTS_DIR)/mac_db.vr 
NIU_PKTS       += $(NIU_PKTS_DIR)/ipp_db.vr 
NIU_PKTS       += $(NIU_PKTS_DIR)/fflp_db.vr 
NIU_PKTS       += $(NIU_PKTS_DIR)/flow_db.vr
NIU_PKTS       += $(NIU_PKTS_DIR)/flow_db_tasks.vr
NIU_PKTS       += $(NIU_PKTS_DIR)/pack_db.vr 
NIU_PKTS       += $(NIU_PKTS_DIR)/pcg_token.vr
NIU_PKTS       += $(NIU_PKTS_DIR)/pg_top_pp.vr 
NIU_PKTS       += $(NIU_PKTS_DIR)/pc_top_pp.vr
NIU_PKTS       := $(subst $(NIU_PKTS_DIR),$(VERA_LIBDIR),$(NIU_PKTS))
NIU_PKTS_VRH   := $(patsubst %.vr,%.vrh,$(NIU_PKTS))
NIU_PKTS_VRO   := $(patsubst %.vr,%.vro,$(NIU_PKTS))

################################################################################
# TCU stuff
################################################################################
TCU_ORDERD_LIST   := \
$(VERA_LIBDIR)/systemTapClass.vr \
$(VERA_LIBDIR)/tcu_siu_packet.vr \
$(VERA_LIBDIR)/tcu_tasks.vr      \
$(VERA_LIBDIR)/sys_registers.vr \
$(VERA_LIBDIR)/ucb_monitor.vr \
$(VERA_LIBDIR)/sys_reset.vr

TCU_VRH   := $(patsubst %.vr,%.vrh,$(TCU_ORDERD_LIST))
TCU_VRO   := $(patsubst %.vr,%.vro,$(TCU_ORDERD_LIST))

TCU_PACKETS        :=  $(TCU_DIR)/packets/tcu_siu_packet.vr
TCU_PACKETS        +=  $(wildcard $(TCU_DIR)/packets/*.vr)
TCU_PACKETS        :=  $(subst $(TCU_DIR)/packets,$(VERA_LIBDIR),$(TCU_PACKETS))

TCU_PACKETS_VRH    :=  $(patsubst %.vr,%.vrh,$(TCU_PACKETS))
TCU_PACKETS_VRO    :=  $(patsubst %.vr,%.vro,$(TCU_PACKETS))

BUILD_JTAG_DRIVER  := \
	$(TCU_PACKETS_VRH) $(TCU_PACKETS_VRO) \
	$(TCU_VRH) $(TCU_VRO)

################################################################################
# CCU and CLOCKS
################################################################################
ifdef GATESIM
CCU_ORDERD_LIST :=  \
  $(VERA_LIBDIR)/ucb_monitor.vr
else
CCU_ORDERD_LIST :=  \
  $(VERA_LIBDIR)/ucb_monitor.vr \
  $(VERA_LIBDIR)/ccu_clks_states.vr \
  $(VERA_LIBDIR)/ccu_checker.vr \
  $(VERA_LIBDIR)/cluster_hdr_chkr.vr \
  $(VERA_LIBDIR)/ccu_clk_chkr_4fc.vr \
  $(VERA_LIBDIR)/cluster_hdrs_mon.vr
endif
CCU_CLKS_VRH := $(patsubst %.vr,%.vrh,$(CCU_ORDERD_LIST))
CCU_CLKS_VRO := $(patsubst %.vr,%.vro,$(CCU_ORDERD_LIST))

################################################################################
$(VERA_LIBDIR)/%.vrh:  $(VERA_LIBDIR)/%.vr
	cd $(VERA_LIBDIR); $(VERA_VRH) $(notdir $<) $(notdir $(@:%.vrh=%))

$(VERA_LIBDIR)/%.vro:  $(VERA_LIBDIR)/%.vr
	cd $(VERA_LIBDIR); $(VERA_VRO) $(notdir $<) $(notdir $@)

ifndef FC_NO_NIU_T2
$(VERA_LIBDIR)/%: $(NIU_DMC_UTIL_DIR)/%
	cp -f $< $@

$(VERA_LIBDIR)/%: $(NIU_UTIL_DIR)/%
	cp -f $< $@

$(VERA_LIBDIR)/%: $(NIU_UTILS_DIR)/%
	cp -f $< $@

$(VERA_LIBDIR)/%: $(NIU_PIO_INCLUDE_DIR)/%
	cp -f $< $@

$(VERA_LIBDIR)/%: $(NIU_PIO_DIR)/%
	cp -f $< $@
endif

$(VERA_LIBDIR)/%.vr: $(TCU_DIR)/classes/%.vr
	cp -f $< $@

$(VERA_LIBDIR)/%.vr: $(TCU_DIR)/packets/%.vr
	cp -f $< $@

################################################################################
# all
################################################################################

all:	vera

# this ifdef includes neither PEU nor NIU
ifdef FC_NO_NIU_T2
vera: makedir copy_stuff \
	$(ORDERD_VRH) \
	$(COV_UNIT_FC) \
        LOADNGO \
        SIU_MON \
	$(BUILD_JTAG_DRIVER) \
        $(CCU_CLKS_VRH) $(CCU_CLKS_VRO) \
	RAS_INJ \
	$(FC_COMMON_INCLUDE) $(COV_UNIT_NCU) \
	$(COV_UNIT_L2) $(COV_UNIT_MCU) $(COV_UNIT_DMU) $(COV_UNIT_SIU) \
	$(ORDERD_VRO)
else
# does not include PEU, but includes NIU
ifdef FC_NO_PEU_VERA
vera: makedir copy_stuff \
	$(ORDERD_VRH) \
	$(COV_UNIT_FC) \
        LOADNGO \
        SIU_MON \
	$(BUILD_JTAG_DRIVER) \
        $(CCU_CLKS_VRH) $(CCU_CLKS_VRO) \
	NIU \
	RAS_INJ \
	$(FC_COMMON_INCLUDE) $(COV_UNIT_NCU) \
	$(COV_UNIT_L2) $(COV_UNIT_MCU) $(COV_UNIT_DMU) $(COV_UNIT_SIU) \
	$(ORDERD_VRO)
else
# includes both PEU and NIU
vera: makedir copy_stuff \
	$(ORDERD_VRH) \
	$(COV_UNIT_FC) \
        LOADNGO \
        SIU_MON \
	$(BUILD_JTAG_DRIVER) \
        $(CCU_CLKS_VRH) $(CCU_CLKS_VRO) \
	NIU_CHK \
	L2_STUBS \
	NIU \
	ILU_PEU \
	$(FC_IOS_RAS) \
	RAS_INJ \
	$(FC_COMMON_INCLUDE) $(COV_UNIT_NCU) \
	$(COV_UNIT_L2) $(COV_UNIT_MCU) $(COV_UNIT_DMU) $(COV_UNIT_SIU) \
	$(COV_UNITS_ILU_PEU) \
	$(ORDERD_VRO)
endif
endif

# target is libtb.so
ntb: makedir $(VERA_LIBDIR)/libtb.so

makedir:
	@if (test ! -d  $(VERA_LIBDIR)) then mkdir  $(VERA_LIBDIR) ; fi

copy_stuff:
	@$(ECHO) "copy_stuff: tgt"
	@cp -f $(THIS_DIR)/include/*vcon* $(VERA_LIBDIR)
	@cp -f $(VERA_DEP) $(VERA_LIBDIR)
	@cp -f ${PWD}/fc_top.vr $(VERA_LIBDIR)
# Changed  avoid copying CVS dirs
#	@cp -f ${PWD}/classes/* $(VERA_LIBDIR)
	@cp -f $(patsubst %CVS, , $(wildcard ${PWD}/classes/*)) $(VERA_LIBDIR)
	@cp -f $(PKT_DIR)/*vr $(VERA_LIBDIR)
# Changed avoid copying CVS dirs
#	@cp -f $(PKT_DIR)/include/* $(VERA_LIBDIR)
	@cp -f $(patsubst %CVS, , $(wildcard $(PKT_DIR)/include/*)) $(VERA_LIBDIR)
	@rm -f $(VERA_LIBDIR)/../fc_top_shell.v
	@vera -V

NIU_CHK:
	@$(ECHO) "NIU_CHK: tgt"
	cd ${DV_ROOT}/verif/env/fc/vera/niu_chk; gmake VERA_LIBDIR=$(VERA_LIBDIR)

ifdef GATESIM
L2_STUBS:
	@$(ECHO) "L2_STUBS: tgt" 
	cd ${DV_ROOT}/verif/env/fc/vera/stubs; gmake VERA_LIBDIR=$(VERA_LIBDIR) GATESIM=1
else
L2_STUBS:
	@$(ECHO) "L2_STUBS: tgt"
	cd ${DV_ROOT}/verif/env/fc/vera/stubs; gmake VERA_LIBDIR=$(VERA_LIBDIR)
endif

ifdef NIU_GATE
NIU:
	@$(ECHO) "NIU: tgt if GATE"
	cd ${DV_ROOT}/verif/env/niu/vera; gmake VERA_LIBDIR=$(VERA_LIBDIR) N2_FC=1 NIU_GATE=1
else
NIU:
	@$(ECHO) "NIU: tgt"
	cd ${DV_ROOT}/verif/env/niu/vera; gmake VERA_LIBDIR=$(VERA_LIBDIR) N2_FC=1
endif

NIU_UTILS:
	@$(ECHO) "NIU_UTILS: tgt"
	$(NIU_COMMON_INCLUDE) \
	$(NIU_UTIL_COMMON_INCLUDE) $(NIU_UTILS_VRH) $(NIU_UTILS_VRO)

NIU_IPPKTGEN:
	@$(ECHO) "NIU_IPPKTGEN: tgt "
	cd ${DV_ROOT}/verif/env/common/vera/niu_ippktgen; gmake VERA_LIBDIR=$(VERA_LIBDIR)

NIU_TOKEN:
	@$(ECHO) "NIU_TOKEN: tgt"
	cd ${DV_ROOT}/verif/env/niu/vera/niu_tokens; gmake VERA_LIBDIR=$(VERA_LIBDIR)

NIU_RX_CHK:
	@$(ECHO) "NIU_RX_CHK: tgt"
	cd ${DV_ROOT}/verif/env/niu/rxc_sat/vera; gmake VERA_LIBDIR=$(VERA_LIBDIR)

SIU_MON:
	@$(ECHO) "siu_mon: tgt"
	cd ${DV_ROOT}/verif/env/siu/vera; gmake siu_mon VERA_LIBDIR=$(VERA_LIBDIR)  NO_0INMGR=1

ILU_PEU:
	@$(ECHO) "ILU_PEU: tgt"
	cd ${DV_ROOT}/verif/env/ilu_peu/vera; gmake -f Makefile VERA_LIBDIR=$(VERA_LIBDIR) N2_FC=1 NO_0INMGR=1

ifdef CONFIG_LOADNGO
LOADNGO:
	cd ${DV_ROOT}/verif/env/fc/loadngo/c; gmake
else
LOADNGO:
	@$(ECHO) "No loadngo"
endif

ifdef GATESIM
RAS_INJ:
	@$(ECHO) "RAS_INJ: tgt"
	cd ${DV_ROOT}/verif/env/ios/vera/ras; gmake VERA_LIBDIR=$(VERA_LIBDIR)  N2_FC=1  GATESIM=1
else
RAS_INJ:
	@$(ECHO) "RAS_INJ: tgt"
	cd ${DV_ROOT}/verif/env/ios/vera/ras; gmake VERA_LIBDIR=$(VERA_LIBDIR)  N2_FC=1
endif

MAKE_CMD := $(MAKE) --no-print-directory -j $(p)

ncu:
	@$(ECHO) ""
	@$(ECHO) "[Building ncu Interface coverage"
	if (test -d $(CTOP)/ncu) then \
		( cd $(CTOP)/ncu; \
		if (test -f Makefile) then $(MAKE_CMD) ; fi ) \
	fi
	@$(ECHO) "Done with ncu Interface coverage]"
	@$(ECHO) ""

l2:
	@$(ECHO) ""
	@$(ECHO) "Building l2sat Interface coverage"
	if (test -d $(CTOP)/l2sat) then \
	( cd $(CTOP)/l2sat; \
		if (test -f Makefile) then $(MAKE_CMD) ; fi ) \
	fi
	@$(ECHO) "Done with l2 Interface coverage]"
	@$(ECHO) ""

mcu:
	@$(ECHO) ""
	@$(ECHO) "[Building mcu Interface coverage"
	if (test -d $(CTOP)/mcusat) then \
	( cd $(CTOP)/mcusat; \
		if (test -f Makefile) then $(MAKE_CMD) ; fi ) \
	fi
	@$(ECHO) "Done with mcu Interface coverage]"
	@$(ECHO) ""

dmu:
	@$(ECHO) ""
	@$(ECHO) "[Building dmu Interface coverage"
	if (test -d $(CTOP)/dmu) then \
	( cd $(CTOP)/dmu; \
	if (test -f Makefile) then $(MAKE_CMD) ; fi ) \
	fi
	@$(ECHO) "Done with dmu Interface coverage]"
	@$(ECHO) ""

siu:
	@$(ECHO) ""
	@$(ECHO) "[Building siu Interface coverage"
	if (test -d $(CTOP)/siu) then \
	( cd $(CTOP)/siu; \
	if (test -f Makefile) then $(MAKE_CMD) ; fi ) \
	fi
	@$(ECHO) "Done with siu Interface coverage]"
	@$(ECHO) ""

fc:
	@$(ECHO) ""
	@$(ECHO) "[Building fc Interface coverage"
	if (test -d $(CTOP)/fc) then \
	( cd $(CTOP)/fc; \
	if (test -f Makefile) then $(MAKE_CMD) ; fi ) \
	fi
	@$(ECHO) "Done with fc Interface coverage]"
	@$(ECHO) ""

ilu_peu: $(VERA_LIBDIR)/plusArgMacros.vri
	@$(ECHO) ""
	@$(ECHO) "[Building ilu_peu Interface coverage"
	if (test -d $(CTOP)/ilu_peu) then \
	( cd $(CTOP)/ilu_peu; \
	if (test -f Makefile) then $(MAKE_CMD) ; fi ) \
	fi
	@$(ECHO) "Done with ilu_peu Interface coverage]"
	@$(ECHO) ""

clean:
ifdef FC_NO_NIU_T2
	rm -rf $(VERA_LIBDIR)/* ; rm -rf $(VERA_LIBDIR)/../fc_top_shell.v
else
	cd  ${DV_ROOT}/verif/model/verilog/niu/sparse_mem_model/pli/src; gmake clean; \
	rm -rf $(VERA_LIBDIR)/* ; rm -rf $(VERA_LIBDIR)/../fc_top_shell.v
endif

# cleanNTB: 
# 	@rm -f $(VERA_LIBDIR)/libtb.so $(VERA_LIBDIR)/*.vcon
# 
# cleanVera: 
# 	@rm -f $(VERA_LIBDIR)/*.vro $(VERA_LIBDIR)/*.vcon $(VERA_LIBDIR)/*.vshell $(VERA_LIBDIR)/*.proj*

test: 
	@echo "<<PWD>>" ${PWD}
	@echo "<<VERA_LIBDIR>>" $(VERA_LIBDIR)
	@echo "<<VERA_INCDIR>>" $(VERA_INCDIR)
	@echo "<<VERA_DEP>>" $(VERA_DEP) 
	@echo "<<ORDERED_VRO>>" $(ORDERD_VRO)
	@echo "<<ORDERED_VRH>>" $(ORDERD_VRH)


# this is here ONLY so users can do "gmake vrh" to get help.
# do not add anything here! do not change this!
# See ORDERD_VRH for making vrh files.
vrh:
	@echo "To make a vrh for your class do --> " $(VERA_VRH) "path_to_class"



################################################################################
# generic rules
################################################################################

$(VERA_LIBDIR)/%.vro: %.vr $(VERA_DEP)
	@echo ">>>> Vera: compiling $(notdir $<)"
	@$(VERA_VRO) $< $@


$(VERA_LIBDIR)/libtb.so: $(VERA_DEP)
	@echo ">>>> Vera: compiling NTB testbench libtb.so"
	cd $(VERA_LIBDIR) ; $(VERA_NTB) ; cd $(THIS_DIR) ; mv -f *.vshell $(VERA_LIBDIR)/../fc_top_shell.v

ifndef FC_NO_PEU_T2
################################################################################
# Denali and Report stuff
################################################################################

denali_vera_dir = $(denali_dir)/ddvapi/vera

#----------------------------------------------------------------------------
# Denali Environment Variables
#----------------------------------------------------------------------------

# Use the .denalirc located in PEU TB home directory
export DENALIRC		= $(DV_ROOT)/verif/env/ilu_peu/.denalirc
endif

ifndef FC_NO_PEU_VERA
#----------------------------------------------------------------
# make report.a
#----------------------------------------------------------------
$(DV_ROOT)/verif/env/fnx/clib/report/report.a:
	$(SPEW_START)
	$(MAKE) -C $(@D) $(@F)
	$(SPEW_END)

ifndef FC_NO_PEU_T2
#----------------------------------------------------------------
# make denali_pcie.o
#----------------------------------------------------------------
$(DV_ROOT)/verif/env/fnx/clib/DenaliPCIE/denali_pcie.so:
	$(SPEW_START)
	$(MAKE) -C $(@D) all
	$(SPEW_END)
endif
endif

################################################################################

#----------------------------------------------------------------
# Get the common definitions if we haven't already
#----------------------------------------------------------------
#include $(DV_ROOT)/verif/env/fnx/runsim/makefiles/Makefile.defs

#----------------------------------------------------------------
# --- the end ---
#----------------------------------------------------------------

