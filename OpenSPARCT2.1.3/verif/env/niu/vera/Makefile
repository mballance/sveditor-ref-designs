################################################################################
## File:	Makefile
## Notes:	runs with "gmake" only, not with "make"
##
## Description:
## -----------
##	Top level Makefile for compiling Vera environment.
##
## $Id: Makefile,v 1.2.4.1 2008/06/19 08:32:10 ib135226 Exp $
################################################################################

################################################################################
# variable declarations
################################################################################

.SUFFIXES:

NEPTUNE_MODE	?= NEPTUNE
HT_MODE	        ?= NO_HT
RXC_SAT		?= RXC_MOD
NEP_SAT         ?= NEP_NOT_SAT
NEP_PCIE        ?= NEP_NOT_PCIE
NEPTUNE_P2P     ?= NOT_NEPTUNE_P2P
N2_FC_NIU       ?= N2_FC
NEP_DEBUG       ?= NEP_NO_DEBUG
NEP_32_BIT      ?= NEP_64_BIT
NEP_DO_NOT_SUPPRESS_DENALI_ERRORS ?= SUPPRESS_DENALI_ERRORS
N2_IOS_NIU	?= N2_IOS
AXIS_VERA_ARG	?= AXIS
COSIM		?= 
N2_AXIS		?=
SIMS_64BIT	?=

VERA_LIBDIR    ?= ./lib
MAC_LIBDIR     ?= ${DV_ROOT}/verif/env/niu/mac_sat/vera/lib

VERA_VRH       ?= vera -cmp ${MAKE_STRING} -I . -max_error 5 -q -H
VERA_VRO       ?= vera -cmp ${MAKE_STRING} -I ${MODEL_DIR}/neptune_rxc/rel-0.1/vera -max_error 5 -q

COMMON_DIR     := ${DV_ROOT}/verif/env/common/vera/
MAC_DIR        := ${DV_ROOT}/verif/env/niu/mac_sat/vera/

VERA_INCLUDE   := $(wildcard include/*port*) 
VERA_INCLUDE   += $(wildcard include/*if.vrh*) $(wildcard include/*.vrh*)
VERA_INCLUDE   += $(wildcard include/*.vri)
VERA_INCLUDE   += $(wildcard include/*bind*)
VERA_INCLUDE   := $(subst include,$(VERA_LIBDIR),$(VERA_INCLUDE))

MISC           := 

COMMON         := 

MAC            := 

COMMON_INCLUDE := $(wildcard $(COMMON_DIR)include/*.vri)
COMMON_INCLUDE := $(subst $(COMMON_DIR)include,$(VERA_LIBDIR),$(COMMON_INCLUDE))

COMMON_VRH     := $(patsubst %.vr,$(VERA_LIBDIR)/%.vrh,$(COMMON))
COMMON_VRO     := $(patsubst %.vr,$(VERA_LIBDIR)/%.vro,$(COMMON))

MAC_INCLUDE    := $(wildcard $(MAC_DIR)include/*.vri) 
MAC_INCLUDE    := $(subst $(MAC_DIR)include,$(VERA_LIBDIR),$(MAC_INCLUDE))

MAC_VRH        := $(patsubst %.vr,$(MAC_DIR)/%.vrh,$(MAC))
MAC_VRO        := $(patsubst %.vr,$(MAC_DIR)/%.vro,$(MAC))

MISC_VRH       := $(patsubst %.vr,$(VERA_LIBDIR)/%.vrh,$(MISC))
MISC_VRO       := $(patsubst %.vr,$(VERA_LIBDIR)/%.vro,$(MISC))

################################################################################
# generic rule to make a .vro file
################################################################################

$(VERA_LIBDIR)/%.vrh:  $(VERA_LIBDIR)/%.vr
	cd $(VERA_LIBDIR); $(VERA_VRH) $(notdir $<) $(notdir $(@:%.vrh=%))

$(MAC_DIR)/%.vrh:  $(MAC_DIR)/%.vr
	cd $(MAC_DIR); $(VERA_VRH) $(notdir $<) $(notdir $(@:%.vrh=%))

$(VERA_LIBDIR)/%.vro:  $(VERA_LIBDIR)/%.vr
	cd $(VERA_LIBDIR); $(VERA_VRO) $(notdir $<) $(notdir $@)

$(MAC_DIR)/%.vro:  $(MAC_DIR)/%.vr
	cd $(MAC_DIR); $(VERA_VRO) $(notdir $<) $(notdir $@)

$(VERA_LIBDIR)/%: $(COMMON_DIR)/%
	cp -f $< $@

$(VERA_LIBDIR)/%:  $(MAC_DIR)/%
	cp -f $< $@

$(VERA_LIBDIR)/%.vri:  $(MAC_DIR)/lib/%.vri
	cp -f $< $@

$(VERA_LIBDIR)/%: $(COMMON_DIR)/include/%
	cp -f $< $@

$(VERA_LIBDIR)/%:  $(MAC_DIR)/include/%
	cp -f $< $@

$(VERA_LIBDIR)/%: include/% 
	cp -f $< $@

$(VERA_LIBDIR)/%: %
	cp -f $< $@


################################################################################
# Decide what to set to the variable MAKE_STRING
################################################################################


ifdef N2_AXIS
   MAKE_STRING	  := "-D${NEPTUNE_MODE} -D${HT_MODE} -D${RXC_SAT} -D${NEP_PCIE} -D${N2_AXIS}"
else

ifdef N2_FC
##### if NIU_GATE in Full Chip #######
ifdef NIU_GATE
  MAKE_STRING     := "-D${NEPTUNE_MODE} -D${N2_FC_NIU} -D${HT_MODE} -D${RXC_SAT} -D${NEP_PCIE} -DNIU_GATE -DPOST_LAYOUT"
else
  MAKE_STRING     := "-D${NEPTUNE_MODE} -D${N2_FC_NIU} -D${HT_MODE} -D${RXC_SAT} -D${NEP_PCIE}"
endif
else

#### if NIU_GATE in SAT #########
ifdef NIU_GATE
 ifdef POST_LAYOUT
  MAKE_STRING	  := "-D${NEPTUNE_MODE} -D${HT_MODE} -D${RXC_SAT} -D${NIU_GATE} -D${NEP_PCIE} -DPOST_LAYOUT"
  else
  MAKE_STRING	  := "-D${NEPTUNE_MODE} -D${HT_MODE} -D${RXC_SAT} -D${NIU_GATE} -D${NEP_PCIE}"
  endif
else

ifdef N2_IOS
  MAKE_STRING	  := "-D${NEPTUNE_MODE} -D${N2_IOS_NIU} -D${HT_MODE} -D${RXC_SAT} -D${NEP_PCIE}"
else
ifdef COSIM
  MAKE_STRING     := "-D${NEPTUNE_MODE} -D${HT_MODE} -D${RXC_SAT} -D${NEP_PCIE} -D${COSIM}"
else
ifdef AXIS
  MAKE_STRING     := "-D${NEPTUNE_MODE} -D${HT_MODE} -D${RXC_SAT} -D${NEP_PCIE} -D${AXIS_VERA_ARG}"
else
ifdef NEPTUNE_P2P
  ifdef SIMS_64BIT
   MAKE_STRING     := "-D${NEPTUNE_MODE} -D${HT_MODE} -D${RXC_SAT} -D${NEP_PCIE} -D${NEPTUNE_P2P} -D${SIMS_64BIT}"
  else
   MAKE_STRING     := "-D${NEPTUNE_MODE} -D${HT_MODE} -D${RXC_SAT} -D${NEP_PCIE} -D${NEPTUNE_P2P}" 
  endif
else
  ifdef SIMS_64BIT
   MAKE_STRING     := "-D${NEPTUNE_MODE} -D${HT_MODE} -D${RXC_SAT} -D${NEP_PCIE} -D${SIMS_64BIT}" 
  else
   MAKE_STRING     := "-D${NEPTUNE_MODE} -D${HT_MODE} -D${RXC_SAT} -D${NEP_PCIE} "
  endif
endif
endif
endif
endif
endif
endif
endif

ifeq ($(NEP_SAT),NEP_SAT)
  MAKE_STRING     := "-D${NEPTUNE_MODE} -D${HT_MODE} -D${RXC_SAT} -D${NEP_SAT}"
endif

ifeq ($(NEP_PCIE),NEP_PCIE)
ifdef COSIM

  ifdef NEPTUNE_P2P
    MAKE_STRING     := "-D${NEPTUNE_MODE} -D${HT_MODE} -D${NEP_PCIE}  -D${RXC_SAT} -D${NEP_DEBUG} -D${NEP_32_BIT} -D${NEPTUNE_P2P} -D${NEP_DO_NOT_SUPPRESS_DENALI_ERRORS} -D${COSIM}"
  else
    MAKE_STRING     := "-D${NEPTUNE_MODE} -D${HT_MODE} -D${NEP_PCIE}  -D${RXC_SAT} -D${NEP_DEBUG} -D${COSIM}"
  endif

else
ifdef AXIS
  MAKE_STRING     := "-D${NEPTUNE_MODE} -D${HT_MODE} -D${NEP_PCIE}  -D${RXC_SAT} -D${NEP_DEBUG}  -D${NEP_32_BIT} -D${NEP_DO_NOT_SUPPRESS_DENALI_ERRORS} -D${AXIS_VERA_ARG}"
else
ifdef NEPTUNE_P2P
  ifdef SIMS_64BIT
   MAKE_STRING     := "-D${NEPTUNE_MODE} -D${HT_MODE} -D${NEP_PCIE}  -D${RXC_SAT} -D${NEP_DEBUG}  -D${NEP_32_BIT} -D${NEPTUNE_P2P} -D${NEP_DO_NOT_SUPPRESS_DENALI_ERRORS} -D${SIMS_64BIT}"
  else
   MAKE_STRING     := "-D${NEPTUNE_MODE} -D${HT_MODE} -D${NEP_PCIE}  -D${RXC_SAT} -D${NEP_DEBUG}  -D${NEP_32_BIT} -D${NEPTUNE_P2P} -D${NEP_DO_NOT_SUPPRESS_DENALI_ERRORS} "
  endif
else
  ifdef SIMS_64BIT
   MAKE_STRING     := "-D${NEPTUNE_MODE} -D${HT_MODE} -D${NEP_PCIE}  -D${RXC_SAT} -D${NEP_DEBUG}  -D${NEP_32_BIT} -D${NEP_DO_NOT_SUPPRESS_DENALI_ERRORS} -D${SIMS_64BIT}"
  else
   MAKE_STRING     := "-D${NEPTUNE_MODE} -D${HT_MODE} -D${NEP_PCIE}  -D${RXC_SAT} -D${NEP_DEBUG}  -D${NEP_32_BIT} -D${NEP_DO_NOT_SUPPRESS_DENALI_ERRORS}"
  endif 
endif
endif
endif
endif

################################################################################
# all
################################################################################

ifdef NIU_SYSTEMC_T2

all: dir $(VERA_INCLUDE) \
	FILE_LIST	\
        MAC_MONITOR     \
        SPECWEB     \
	NIU_PLI \
	NIU_UTIL \
	NIU_ERRORS \
        NCU_STUB \
        GEN_PIO \
	NIU_PIO 	\
        NIU_INTR \
	NIU_IPPKTGEN \
        NIU_MAC_	\
	NIU_MAC_CHECKER \
	NIU_TOKENS \
	NIU_DMC_UTILS \
	NIU_TXC_	\
	NIU_RXC_	\
        NIU_RXC_CHECKER \
	NIU_RANDOMS \
	NIU_TEST_UTILS	\
	$(COMMON_INCLUDE) \
	$(MAC_INCLUDE) \
	$(COMMON_VRH) $(COMMON_VRO) \
	$(MISC_VRH) $(MISC_VRO) \
	$(MAC_VRO) \
	$(VERA_LIBDIR)/vera_top.vro 

else

all: dir $(VERA_INCLUDE) \
	FILE_LIST	\
        MAC_MONITOR     \
        SPECWEB     \
	NIU_PLI \
	NIU_UTIL \
	NIU_ERRORS \
        NCU_STUB \
        GEN_PIO \
	NIU_PIO 	\
        NIU_INTR \
	NIU_IPPKTGEN \
        NIU_MAC_	\
	NIU_MAC_CHECKER \
	NIU_TOKENS \
	NIU_DMC_UTILS \
	NIU_TXC_	\
	NIU_RXC_	\
        NIU_RXC_CHECKER \
        NIU_RXC_MONITOR \
	NIU_RANDOMS \
	NIU_TEST_UTILS	\
	NIU_COVERAGE \
	$(COMMON_INCLUDE) \
	$(MAC_INCLUDE) \
	$(COMMON_VRH) $(COMMON_VRO) \
	$(MISC_VRH) $(MISC_VRO) \
	$(MAC_VRO) \
	$(VERA_LIBDIR)/vera_top.vro 

endif

dir:
	if (test ! -d  $(VERA_LIBDIR)) then mkdir  $(VERA_LIBDIR) ; fi
ifeq ($(NEPTUNE_ENV),CDMSPP)
FILE_LIST:
else
FILE_LIST:
	cd ${DV_ROOT}/verif/env/niu; gmake clean; gmake
endif
## This will be replaced with a common utility 
NIU_DISPMON:
	cd ${DV_ROOT}/verif/env/common/vera/dispmon; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
MAC_MONITOR:
	cd ${DV_ROOT}/verif/env/common/vera/mac_monitor; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
SPECWEB:
	cd ${DV_ROOT}/verif/env/common/vera/specweb; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
ifdef SIMS_64BIT
NIU_PLI:	
	cd ${DV_ROOT}/verif/env/common/pli/niu_pli; gmake  CFLAGS=-m64
else
NIU_PLI:	
	cd ${DV_ROOT}/verif/env/common/pli/niu_pli; gmake  
endif
NIU_UTIL:	
	cd ${DV_ROOT}/verif/env/niu/vera/niu_utils; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
ifdef N2_IOS
NCU_STUB:
else
NCU_STUB:
	cd ${DV_ROOT}/verif/env/niu/vera/ncu_drv; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
endif
NIU_ERRORS:
	cd ${DV_ROOT}/verif/env/common/vera/niu_gen_error; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
NIU_INTR:
	cd ${DV_ROOT}/verif/env/common/vera/niu_intr; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
GEN_PIO:
	cd ${DV_ROOT}/verif/env/common/vera/niu_gen_pio; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
NIU_PIO:	
	cd ${DV_ROOT}/verif/env/niu/vera/niu_pio; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
ifdef SIMS_64BIT
NIU_IPPKTGEN:	
	cd ${DV_ROOT}/verif/env/common/vera/niu_ippktgen; gmake CFLAGS=-m64 VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
else
NIU_IPPKTGEN:	
	cd ${DV_ROOT}/verif/env/common/vera/niu_ippktgen; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
endif
NIU_TXC_:
	cd ${DV_ROOT}/verif/env/niu/txc_sat/vera; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
NIU_RANDOMS:
	cd ${DV_ROOT}/verif/env/common/vera/niu_randoms; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
NIU_COVERAGE:
	cd ${DV_ROOT}/verif/env/common/vera/niu_coverage; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
NIU_TOKENS:
	 cd ${DV_ROOT}/verif/env/niu/vera/niu_tokens; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
NIU_DMC_UTILS:
	 cd ${DV_ROOT}/verif/env/niu/vera/dmc_utils; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
NIU_RXC_:
	 cd ${DV_ROOT}/verif/env/niu/rxc_sat/vera; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
NIU_TEST_UTILS:
	 cd ${DV_ROOT}/verif/env/niu/test_utils/vera; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
ifeq ($(NEPTUNE_ENV),CDMSPP)
NIU_MAC_:
NIU_MAC_CHECKER:
else
NIU_MAC_:
	cd ${DV_ROOT}/verif/env/niu/mac_sat/vera; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
NIU_MAC_CHECKER:
	cd ${DV_ROOT}/verif/env/niu/mac_sat/vera/lib/niu_mac_checker;  gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
endif

NIU_RXC_CHECKER:
	cd ${DV_ROOT}/verif/env/niu/rxc_sat/vera/checkers;  gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)

NIU_RXC_MONITOR:
	cd ${DV_ROOT}/verif/env/niu/rxc_sat/vera/monitor;  gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)

ifeq ($(NEPTUNE_ENV),CDMSPP)
$(VERA_LIBDIR)/vera_top.vro: 
ifdef N2_FC
else
ifdef N2_IOS
else
	cd ${DV_ROOT}/verif/env/niu/vera/top;  gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
endif
endif
else
$(VERA_LIBDIR)/vera_top.vro:
	cd ${DV_ROOT}/verif/env/vera/top; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
endif


################################################################################
# clean
################################################################################
debug:
	echo "Vera top Makefile tmp_mode = $(TMP_MODE) tmp_mode1 = $(TMP_MODE1) make_string = $(MAKE_STRING) nep_pcie=$(NEP_PCIE) nep_sat = $(NEP_SAT) neptune_mode = $(NEPTUNE_MODE)"


clean:
	rm -rf $(VERA_LIBDIR)/*; cd  ${DV_ROOT}/verif/model/verilog/niu/sparse_mem_model/pli/src; gmake clean

