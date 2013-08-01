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
RXC_SAT		?= RXC_MOD
MAKE_STRING	?= "-D${NEPTUNE_MODE} -D${HT_MODE} -D${RXC_SAT}"


VERA_LIBDIR    ?= ./lib

VERA_VRH       ?= vera -cmp ${NEPTUNE_MODE} -I . -max_error 5 -q -H
VERA_VRO       ?= vera -cmp ${NEPTUNE_MODE} -I . -max_error 5 -q

PORT_SRC       := 
IF_SRC         :=
PORT_DEST      :=
IF_DEST        :=

COMMON_DIR     := ${DV_ROOT}/verif/env/niu/vera/niu_utils

VERA_INCLUDE   := $(wildcard include/*port*) $(wildcard include/*vcon*)
VERA_INCLUDE   += $(wildcard include/*if.vrh*) $(wildcard include/*.vrh*)
VERA_INCLUDE   += $(wildcard include/*.vri)
VERA_INCLUDE   += $(wildcard include/*bind*)
VERA_INCLUDE   := $(subst include,$(VERA_LIBDIR),$(VERA_INCLUDE))

MISC           := 

TMP_MODE	= $(findstring MAC_SAT, ${NEPTUNE_MODE})

ifdef N2_FC
COMMON         := mbox_class.vr get_mbox_id.vr cMesg.vr niu_cntrl.vr niu_cbclass.vr niu_int_qmgr.vr niu_byte_array.vr  niu_str_utils.vr niu_memcbmgr.vr
else
ifdef N2_IOS
COMMON         := mbox_class.vr get_mbox_id.vr cMesg.vr niu_cntrl.vr niu_cbclass.vr niu_int_qmgr.vr niu_byte_array.vr  niu_str_utils.vr
else
ifeq (${TMP_MODE},MAC_SAT)
COMMON :=  niu_reset_util.vr mbox_class.vr get_mbox_id.vr cMesg.vr niu_cntrl.vr niu_cbclass.vr niu_int_qmgr.vr 
else
COMMON := niu_reset_util.vr mbox_class.vr get_mbox_id.vr cMesg.vr niu_cntrl.vr niu_cbclass.vr niu_int_qmgr.vr niu_byte_array.vr  niu_str_utils.vr niu_memcbmgr.vr
endif
endif
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

all: dir $(PORT_DEST) $(VERA_INCLUDE) \
	$(COMMON_INCLUDE) \
	$(COMMON_VRH) $(COMMON_VRO) \
	$(MISC_VRH) $(MISC_VRO) 

dir:
	if (test ! -d  $(VERA_LIBDIR)) then mkdir  $(VERA_LIBDIR) ; fi

$(PORT_DEST): $(PORT_SRC)
	pal -r $<   > $@


################################################################################
# clean
################################################################################

clean:
	rm -rf $(VERA_LIBDIR)/*
