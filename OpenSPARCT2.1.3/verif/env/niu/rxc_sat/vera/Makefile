################################################################################
## File:	Makefile
## Notes:	runs with "gmake" only, not with "make"
##
## Description:
## -----------
##	Top level Makefile for compiling Vera environment.
##
################################################################################

################################################################################
# variable declarations
################################################################################

.SUFFIXES:

NEPTUNE_MODE	?= NEPTUNE
HT_MODE		?= NO_HT
RXC_SAT		?= NO_RXC_SAT
MAKE_STRING	?= "${NEPTUNE_MODE} -D${HT_MODE} -D${RXC_SAT}"
VERA_LIBDIR    ?= ./lib
MAC_LIBDIR     ?= ${DV_ROOT}/verif/env/niu_mac_sat/vera/lib

VERA_VRH       ?= vera -cmp ${NEPTUNE_MODE} -I . -max_error 5 -q -H
VERA_VRO       ?= vera -cmp ${NEPTUNE_MODE} -I . -max_error 5 -q

COMMON_DIR     := ${DV_ROOT}/verif/env/common/vera/
MAC_DIR        := ${DV_ROOT}/verif/env/niu/mac_sat/vera/

VERA_INCLUDE   := $(wildcard include/*port*) 
VERA_INCLUDE   += $(wildcard include/*if.vrh*) $(wildcard include/*.vrh*)
VERA_INCLUDE   += $(wildcard include/*.vri)
VERA_INCLUDE   += $(wildcard include/*bind*)
VERA_INCLUDE   := $(subst include,$(VERA_LIBDIR),$(VERA_INCLUDE))

MISC           := 

TMP_MODE	= $(findstring RXC_SAT, ${NEPTUNE_MODE})
ifeq ($(TMP_MODE),RXC_SAT)
COMMON		:=  
else
COMMON         :=  
endif

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
# all
################################################################################
ifdef NIU_SYSTEMC_T2
all: dir $(VERA_INCLUDE) \
	$(COMMON_INCLUDE) \
	$(COMMON_VRH) $(COMMON_VRO) \
	RXDMA \
	RXC_SAT_DRIVERS \
	FFLP \
	PKTCONFIG
else
all: dir $(VERA_INCLUDE) \
	$(COMMON_INCLUDE) \
	$(COMMON_VRH) $(COMMON_VRO) \
	RXDMA \
	RXC_SAT_DRIVERS \
	FFLP \
	MONITOR \
	PKTCONFIG
endif

PKTCONFIG:
	cd ${DV_ROOT}/verif/env/niu/rxc_sat/vera/pktconfig; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
MONITOR:
	cd ${DV_ROOT}/verif/env/niu/rxc_sat/vera/monitor; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
RXDMA:
	cd ${DV_ROOT}/verif/env/niu/rxc_sat/vera/rxdma; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)

TMP_MODE	= $(findstring RXC_SAT, ${NEPTUNE_MODE})
ifeq ($(TMP_MODE),RXC_SAT)
RXC_SAT_DRIVERS:
	cd ${DV_ROOT}/verif/env/niu/rxc_sat/vera/drivers; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
else
RXC_SAT_DRIVERS:
endif

ifeq ($(TMP_MODE),RXC_SAT)
FFLP:
else
FFLP:
	cd ${DV_ROOT}/verif/env/niu/rxc_sat/vera/fflp; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
endif

dir:
	if (test ! -d  $(VERA_LIBDIR)) then mkdir  $(VERA_LIBDIR) ; fi

################################################################################
# clean
################################################################################

clean:
	rm -rf $(VERA_LIBDIR)/*
