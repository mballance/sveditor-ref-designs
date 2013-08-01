################################################################################
## $Id: Makefile,v 1.1.1.1 2007/02/13 22:21:36 drp Exp $
##
## File:	Makefile
## Notes:	runs with "gmake" only, not with "make"
##
## Description: Makefile for l2_stub for IOS envirnoment
##
################################################################################

################################################################################
# variable declarations
################################################################################

.SUFFIXES:

VERA_LIBDIR    ?= ./lib

VERA_VRH       ?= vera -cmp -I . -max_error 5 -q -H
VERA_VRO       ?= vera -cmp -I . -max_error 5 -q

COMMON_DIR     := ${DV_ROOT}/verif/env/common/vera/

#PORT_SRC       := include/ios_l2_stub_ports_binds.vrhpal
#IF_SRC         := include/niu_sig.if.vrhpal
#PORT_DEST      := $(VERA_LIBDIR)/ios_l2_stub_ports_binds.vrh
#IF_DEST        := $(VERA_LIBDIR)/niu_sig.if.vrh

VERA_INCLUDE   := include/niu_sig.if.vrh
VERA_INCLUDE   := $(subst include,$(VERA_LIBDIR),$(VERA_INCLUDE))

STUBS        :=	 stubs/niu_checker.vr
STUBS        :=  $(subst stubs,$(VERA_LIBDIR),$(STUBS))
STUBS_VRH    :=  $(patsubst %.vr,%.vrh,$(STUBS))
STUBS_VRO    :=  $(patsubst %.vr,%.vro,$(STUBS))

COMMON         := std_display_class.vr

COMMON_INCLUDE := $(wildcard $(COMMON_DIR)include/std_display_defines.vri)
COMMON_INCLUDE += $(wildcard $(COMMON_DIR)include/plusArgMacros.vri)
COMMON_INCLUDE += $(wildcard $(COMMON_DIR)classes/*.vrh)
COMMON_INCLUDE += $(wildcard $(COMMON_DIR)classes/*.vr)
COMMON_INCLUDE += $(wildcard $(COMMON_DIR)*.vr*)
COMMON_INCLUDE := $(subst $(COMMON_DIR)include,$(VERA_LIBDIR),$(COMMON_INCLUDE))
COMMON_VRH     := $(patsubst %.vr,$(VERA_LIBDIR)/%.vrh,$(COMMON))
COMMON_VRO     := $(patsubst %.vr,$(VERA_LIBDIR)/%.vro,$(COMMON))


################################################################################
# generic rule to make a .vro file
################################################################################

$(VERA_LIBDIR)/%.vrh:  $(VERA_LIBDIR)/%.vr
	cd $(VERA_LIBDIR); $(VERA_VRH) $(notdir $<) $(notdir $(@:%.vrh=%))

$(VERA_LIBDIR)/%.vro:  $(VERA_LIBDIR)/%.vr
	cd $(VERA_LIBDIR); $(VERA_VRO) $(notdir $<) $(notdir $@)

$(VERA_LIBDIR)/%: $(COMMON_DIR)/%
	cp -f $< $@

$(VERA_LIBDIR)/%: $(COMMON_DIR)classes/%
	cp -f $< $@


$(VERA_LIBDIR)/%: $(COMMON_DIR)/include/%
	cp -f $< $@

$(VERA_LIBDIR)/%: stubs/%
	cp -f $< $@

$(VERA_LIBDIR)/%: include/% 
	cp -f $< $@

$(VERA_LIBDIR)/%: %
	cp -f $< $@


################################################################################
# all
################################################################################

all: dir  $(VERA_INCLUDE) \
     $(VERA_LIBDIR)/diag.vri \
     $(COMMON_INCLUDE) $(COMMON_VRH) $(COMMON_VRO) \
     $(STUBS_VRH) $(STUBS_VRO)

dir:
	if (test ! -d  $(VERA_LIBDIR)) then mkdir  $(VERA_LIBDIR) ; fi

$(PORT_DEST): $(PORT_SRC)
	pal -r $<   > $@

$(IF_DEST): $(IF_SRC)
	pal -r $<   > $@


################################################################################
# clean
################################################################################

clean:
	rm -rf $(VERA_LIBDIR)/*
