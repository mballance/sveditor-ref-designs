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
RXC_SAT		?= RXC_MOD
MAKE_STRING	?= "-D${NEPTUNE_MODE} -D${HT_MODE} -D${RXC_SAT}"


VERA_LIBDIR    ?= ./lib

VERA_VRH       ?= vera -cmp -I . -max_error 5 -q -H
VERA_VRO       ?= vera -cmp -I . -max_error 5 -q

COMMON_DIR     := ${DV_ROOT}/verif/env/common/vera/niu_ippktgen

VERA_INCLUDE   := $(wildcard include/*port*) $(wildcard include/*vcon*)
VERA_INCLUDE   += $(wildcard include/*if.vrh*) $(wildcard include/*.vrh*)
VERA_INCLUDE   += $(wildcard include/*.vri)
VERA_INCLUDE   += $(wildcard include/*bind*)
VERA_INCLUDE   := $(subst include,$(VERA_LIBDIR),$(VERA_INCLUDE))

MISC           := 

TMP_MODE	= $(findstring MAC_SAT, ${NEPTUNE_MODE})
ifeq (${TMP_MODE},MAC_SAT)
COMMON         := mac_db.vr \
                  ipp_db.vr \
                  fflp_db.vr \
                  flow_db.vr \
                  flow_db_tasks.vr \
                  pack_db.vr \
                  pcg_token.vr \
		  cPgIf.vr  \
                  pg_top_pp.vr \
                  pc_top_pp.vr \
                  mac_node_db.vr 
else
COMMON	       := mac_db.vr \
		  ipp_db.vr \
		  fflp_db.vr \
		  flow_db.vr \
		  flow_db_tasks.vr \
		  pgIdgen.vr \
		  pack_db.vr \
		  pcg_token.vr \
		  cPgIf.vr  \
		  pg_top_pp.vr \
		  pc_top_pp.vr 
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
	$(COMMON_VH) \
	C_PKTGEN \
	$(MISC_VRH) $(MISC_VRO) 
C_PKTGEN:
	cd ${DV_ROOT}/verif/env/common/vera/niu_ippktgen/C/libnet/src; gmake VERA_LIBDIR=$(VERA_LIBDIR) 
	cd ${DV_ROOT}/verif/env/common/vera/niu_ippktgen/C/wrapper; gmake VERA_LIBDIR=$(VERA_LIBDIR) 
dir:
	if (test ! -d  $(VERA_LIBDIR)) then mkdir  $(VERA_LIBDIR) ; fi


################################################################################
# clean
################################################################################

clean:
	rm -rf $(VERA_LIBDIR)/*
