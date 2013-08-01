################################################################################
## File:	Makefile
## Notes:	runs with "gmake" only, not with "make"
## Description:
## -----------
##	Top level Makefile for compiling Vera DES environment.
##
################################################################################

################################################################################
# variable declarations
################################################################################

.SUFFIXES:
NEPTUNE_MODE    ?= NEPTUNE
MAKE_STRING     ?= "${NEPTUNE_MODE}"

VERA_LIBDIR    ?= ./lib

VERA_VRH       ?= vera -cmp ${NEPTUNE_MODE} -I . -max_error 5 -q -H
VERA_VRO       ?= vera -cmp ${NEPTUNE_MODE} -I . -max_error 5 -q

COMMON_DIR     := ${DV_ROOT}/verif/env/niu/vera/

PORT_SRC       := 
IF_SRC	       := 
PORT_DEST      := 
IF_DEST        := 

VERA_INCLUDE   := $(wildcard include/*vcon*)
VERA_INCLUDE   += $(wildcard include/*.vrh)
VERA_INCLUDE   += $(wildcard include/*.vri)
VERA_INCLUDE   += $(wildcard include/*.vrhpal)
VERA_INCLUDE   += $(wildcard include/*.vripal)
VERA_INCLUDE   := $(subst include,$(VERA_LIBDIR),$(VERA_INCLUDE))

NEP_SAT_MODE    = $(findstring NEP_SAT, ${NEPTUNE_MODE})

ifeq ($(NEP_SAT_MODE), NEP_SAT)
TMP_MODE	= $(findstring NEP_SAT, ${NEPTUNE_MODE})
else
TMP_MODE	= $(findstring SAT, ${NEPTUNE_MODE})
endif

DMC_STUB        += 

DMC_STUB_VRH    :=  $(patsubst %.vr,%.vrh,$(DMC_STUB))
DMC_STUB_VRO    :=  $(patsubst %.vr,%.vro,$(DMC_STUB))

MISC           := 

COMMON         := niu_dma_bind.vr niu_dmc_descr.vr niu_dmc_descr_ring.vr niu_dma.vr 

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
	$(COMMON_VH) \
	$(MISC_VRH) $(MISC_VRO) 



dir:
	if (test ! -d  $(VERA_LIBDIR)) then mkdir  $(VERA_LIBDIR) ; fi

SMX_DRV:
	        cd ${DV_ROOT}/verif/env/niu/vera/smx_drv/;  gmake VERA_LIBDIR=$(VERA_LIBDIR) NEPTUNE_MODE=$(MAKE_STRING)



################################################################################
# clean
################################################################################

clean:
	rm -rf $(VERA_LIBDIR)/*
