################################### -*- Makefile -*- ###########################
##
## File:	CovMakefile.inc
## Description:
## -----------
##	Common part of Makefile for coverage directories.
##	This is included in <unit>/Makefile
## Caution:
## -------
##	Only works with "gmake".
##
## $Id: CovMakefile.inc,v 1.12 2005/11/17 20:40:35 cb150247 Exp $
##
################################################################################

################################################################################
# variable declarations
################################################################################

ECHO	:= echo
INDENT	:= "  "

.SUFFIXES:

ifndef UNIT
    UNIT         := $(CURDIR)
    UNIT         := $(notdir $(UNIT))
    UNIT         := $(UNIT:%_coverage=%)
endif

VERA_LIBDIR  ?= ../lib
MAKEFILES    := Makefile ../CovMakefile.inc

ifdef FC_COVERAGE
FC_VERA_DEFS 	:= -DL2_INTF_COV -DMCU_INTF_COV -DSIU_INTF_COV -DDMU_INTF_COV -DNCU_INTF_COV -DSIU_WB_COV -DFC_COVERAGE
endif
ifdef IOS_COVERAGE
FC_VERA_DEFS 	:= -DSIU_INTF_COV -DIOS_COVERAGE -DNCU_INTF_COV -DDMU_INTF_COV -DSIU_WB_COV
endif

## RTL header files could be checked in or be generated
RTL_VRH      := $(wildcard $(UNIT)_rtl.vrh*)
VERA_DEFINES := $(wildcard *defines.vrh*)
HEADERS      := $(RTL_VRH) $(VERA_DEFINES)

## Top level src object
TOP_PAL      := $(UNIT)_coverage.vrpal
DEST_TOP_VR  := $(TOP_PAL:%vrpal=$(VERA_LIBDIR)/%vr)
DEST_TOP_VRO := $(DEST_TOP_VR:%vr=%vro)

## Dummy file that is updated if top level object is rebuilt
DEST_TOP_BLT := $(VERA_LIBDIR)/$(UNIT)_built

SRC_FILES    := $(UNIT)_coverage.vri
SRC_FILES    += $(RTL_VRH)
SRC_FILES    += $(wildcard *_cov.vr)
SRC_FILES    += $(wildcard *_group.vr)
SRC_FILES    += $(wildcard *_monitors.vr)

## put PAL files in order they need to be built
SRC_PAL_FIRST := $(wildcard *ports_binds*) $(wildcard *vcon*)
SRC_PAL_FIRST += $(wildcard *if.vrh*) $(VERA_DEFINES)
SAMPLE_PAL    := $(wildcard *_sample.vrhpal)
SRC_PAL_SEC   := $(wildcard *pal)
SRC_PAL_SEC   := $(filter-out $(SRC_PAL_FIRST) %.pal,$(SRC_PAL_SEC))
SRC_PAL_FILES := $(SRC_PAL_FIRST) $(SRC_PAL_SEC)

SAMPLE_FILES  := $(wildcard *_sample.vrh)

## now go through gyrations to get build order right
DEST_FILES    := $(SRC_PAL_FILES:%pal=$(VERA_LIBDIR)/%)
DEST_FILES    += $(SRC_FILES:%=$(VERA_LIBDIR)/%)
DEST_FILES    += $(SAMPLE_FILES:%=$(VERA_LIBDIR)/%)
DEST_STAGE1   := $(DEST_FILES)
DEST_VR       := $(filter %.vr,$(DEST_FILES))
DEST_FILES    := $(filter-out $(DEST_VR),$(DEST_FILES))
DEST_VRO      := $(DEST_VR:.vr=.vro)
DEST_VRO_LAST := $(filter %_coverage.vro,$(DEST_VRO))
DEST_VRO      := $(filter-out $(DEST_VRO_LAST),$(DEST_VRO))
DEST_STAGE2   := $(DEST_VRO)
DEST_VRO      += $(DEST_VRO_LAST)
DEST_STAGE3   := $(DEST_VRO_LAST) $(DEST_VRO_LAST:.vro=.vrh)
DEST_VRH      := $(DEST_VRO:.vro=.vrh)
DEST_FILES    += $(DEST_VRH) $(DEST_VRO) $(DEST_VR)
DEST_FILES    += $(DEST_TOP_BLT)

VERA_VRH   ?= vera -cmp $(FC_VERA_DEFS) -I . -max_error 5 -q -H $(VFLAGS)
VERA_VRO   ?= vera -cmp $(FC_VERA_DEFS) -I . -max_error 5 -q $(VFLAGS) 

## PAL_OPTS gets overridden by command line argument for multi-core sims.
## For example, for sys=cmp1, cmd line is:
##	gmake PAL_OPTS="sys=CMP1"
## or
##	gmake PAL_OPTS="cores=2"
##
PAL_OPTS=
PAL_INCLUDES := $(UNIT)_cov_inc.pal

################################################################################
# rules
################################################################################

###################
# preprocessing
###################

$(VERA_LIBDIR)/%.vcon: %.vconpal $(PAL_INCLUDES)
	@$(ECHO) $(INDENT) "Expanding $<"
	pal -r $(PAL_OPTS) -o $@ $<

$(VERA_LIBDIR)/%.vrh: %.vrhpal $(PAL_INCLUDES)
	@$(ECHO) $(INDENT) "Expanding $<"
	pal -r $(PAL_OPTS) -o $@ $<

$(VERA_LIBDIR)/%.vr: %.vrpal $(PAL_INCLUDES)
	@$(ECHO) $(INDENT) "Expanding $<"
	pal -r $(PAL_OPTS) -o $@ $<

$(VERA_LIBDIR)/%.vrh: $(VERA_LIBDIR)/%.vr $(HEADERS)
	@$(ECHO) $(INDENT) "Vera: generating headers for $(notdir $<)"
	cd $(VERA_LIBDIR); $(VERA_VRH) $(notdir $<) $(notdir $(@:%.vrh=%))

$(VERA_LIBDIR)/%.vro: $(VERA_LIBDIR)/%.vr $(VERA_LIBDIR)/%.vrh $(HEADERS)
	@$(ECHO) $(INDENT) "Vera: compiling $(notdir $<)"
	cd $(VERA_LIBDIR); $(VERA_VRO) $(notdir $<) $(notdir $@)

$(VERA_LIBDIR)/%: %
	@$(ECHO) $(INDENT) "Copying $<"
	cp -f $< $@

################################################################################
# all
################################################################################
.PHONY: all clean srcs dests unit
ifndef DEBUG
.SILENT:
endif

all: $(DEST_FILES)

################################################################################
# additional dependences and flag target
################################################################################
$(DEST_TOP_VR): $(SAMPLE_PAL)

$(DEST_TOP_BLT): $(DEST_TOP_VRO)
	echo $(PAL_OPTS) > $@

$(DEST_STAGE2): $(DEST_STAGE1)

$(DEST_STAGE3): $(DEST_STAGE2)

$(DEST_STAGE1): $(MAKEFILES)

################################################################################
# clean
################################################################################

clean:
	rm -f $(DEST_FILES)

srcs:
	@ echo $(SRC_FILES)
dests:
	@ echo $(DEST_FILES)

unit:
	@ echo $(UNIT)

