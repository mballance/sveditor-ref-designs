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

VERA_LIBDIR    ?= ./lib
NEPTUNE_MODE    ?= NEPTUNE
MAKE_STRING     ?= "${NEPTUNE_MODE}"


VERA_VRH       ?= vera -cmp ${NEPTUNE_MODE} -I . -max_error 5 -q -H
VERA_VRO       ?= vera -cmp ${NEPTUNE_MODE} -I . -max_error 5 -q

COMMON_DIR     := ${DV_ROOT}/verif/env/niu/vera/niu_pio

VERA_INCLUDE   := $(wildcard include/*port*) $(wildcard include/*vcon*)
VERA_INCLUDE   += $(wildcard include/*if.vrh*) $(wildcard include/*.vrh*)
VERA_INCLUDE   += $(wildcard include/*.vri)
VERA_INCLUDE   += $(wildcard include/*bind*)
VERA_INCLUDE   := $(subst include,$(VERA_LIBDIR),$(VERA_INCLUDE))

MISC           := 

COMMON         := pio_driver.vr mac_shadow_class.vr xmac_shadow_class.vr \
		  mac_pio_class.vr bmac_util.vr vega_shadow_class.vr pcs_util.vr \
		  xmac_util.vr  xpcs_util.vr ipp_util.vr fflp_util.vr  dmc_util.vr \
		  txc_util.vr esr_ti_init.vr get_macport_class.vr mac_init_class.vr  


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
	SMX_STUB 	\
	$(COMMON_INCLUDE) \
	$(COMMON_VRH) $(COMMON_VRO) \
	$(MISC_VRH) $(MISC_VRO) 

dir:
	if (test ! -d  $(VERA_LIBDIR)) then mkdir  $(VERA_LIBDIR) ; fi
NCU_STUB:
	cd ${DV_ROOT}/verif/env/niu/vera/ncu_drv; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)
SMX_STUB:
	cd ${DV_ROOT}/verif/env/niu/vera/smx_drv; gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)

################################################################################
# clean
################################################################################

clean:
	rm -rf $(VERA_LIBDIR)/*
