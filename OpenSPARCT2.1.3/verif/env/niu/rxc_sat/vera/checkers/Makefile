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

NEPTUNE_MODE    ?= NEPTUNE
HT_MODE		?= NO_HT
RXC_SAT		?= NO_RXC_SAT
MAC_SAT		?= NO_MAC_SAT
MAKE_STRING	?= "${NEPTUNE_MODE} -D${HT_MODE} -D${RXC_SAT} -D${MAC_SAT}"

VERA_LIBDIR    ?= ./lib

VERA_VRH       ?= vera -cmp ${NEPTUNE_MODE} -I . -max_error 5 -q -H
VERA_VRO       ?= vera -cmp ${NEPTUNE_MODE} -I . -max_error 5 -q

COMMON_DIR     := ${DV_ROOT}/verif/niu/rxc_sat/vera/lib/niu_rxc_checker

VERA_INCLUDE   := $(wildcard include/*port*) $(wildcard include/*vcon*)
VERA_INCLUDE   += $(wildcard include/*if.vrh*) $(wildcard include/*.vrh*)
VERA_INCLUDE   += $(wildcard include/*.vri)
VERA_INCLUDE   += $(wildcard include/*bind*)
VERA_INCLUDE   := $(subst include,$(VERA_LIBDIR),$(VERA_INCLUDE))

MISC           := 

TMP_MODE	= $(findstring RXC_SAT, ${NEPTUNE_MODE})
ifeq ($(TMP_MODE),RXC_SAT)
COMMON         := 
else
COMMON         := 
endif

COMMON_INCLUDE := $(wildcard $(COMMON_DIR)include/*.vri)
COMMON_INCLUDE := $(subst $(COMMON_DIR)include,$(VERA_LIBDIR),$(COMMON_INCLUDE))

COMMON_VRH     := $(patsubst %.vr,$(VERA_LIBDIR)/%.vrh,$(COMMON))
COMMON_VRO     := $(patsubst %.vr,$(VERA_LIBDIR)/%.vro,$(COMMON))

MISC_VRH       := $(patsubst %.vr,$(VERA_LIBDIR)/%.vrh,$(MISC))
MISC_VRO       := $(patsubst %.vr,$(VERA_LIBDIR)/%.vro,$(MISC))

################################################################################
# generic rule to make a .vro file
################################################################################

$(VERA_LIBDIR)/%.vrh:  $(VERA_LIBDIR)/%.vr
	cd $(VERA_LIBDIR); $(VERA_VRH) $(notdir $<) $(notdir $(@:%.vrh=%))

$(VERA_LIBDIR)/%.vro:  $(VERA_LIBDIR)/%.vr
	cd $(VERA_LIBDIR); $(VERA_VRO) $(notdir $<) $(notdir $@)

$(VERA_LIBDIR)/%: $(COMMON_DIR)/%
	cp -f $< $@

$(VERA_LIBDIR)/%: $(COMMON_DIR)/include/%
	cp -f $< $@

$(VERA_LIBDIR)/%: include/% 
	cp -f $< $@

$(VERA_LIBDIR)/%: %
	cp -f $< $@


################################################################################
# all
################################################################################

all: dir $(VERA_INCLUDE) \
	$(COMMON_INCLUDE) \
	$(COMMON_VRH) $(COMMON_VRO) \
	$(MISC_VRH) $(MISC_VRO) \
	RXC_SAT_CHECKERS \
	MEM_CHECKERS

TMP_MODE	= $(findstring RXC_SAT, ${NEPTUNE_MODE})
ifeq ($(TMP_MODE),RXC_SAT)
RXC_SAT_CHECKERS:
	cd ${DV_ROOT}/verif/env/niu/rxc_sat/vera/checkers/dmc_rxc_checker; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
else
RXC_SAT_CHECKERS:
endif

TMP1_MODE	= $(findstring MAC_SAT, ${NEPTUNE_MODE})
ifeq ($(TMP1_MODE),MAC_SAT)
MEM_CHECKERS:
else
MEM_CHECKERS:
	cd ${DV_ROOT}/verif/env/niu/rxc_sat/vera/checkers/mem_checker; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
endif

dir:
	if (test ! -d  $(VERA_LIBDIR)) then mkdir  $(VERA_LIBDIR) ; fi

################################################################################
# clean
################################################################################

clean:
	rm -rf $(VERA_LIBDIR)/*
