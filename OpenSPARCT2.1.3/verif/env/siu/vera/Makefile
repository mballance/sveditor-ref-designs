################################################################################
## File:	Makefile
## Notes:	runs with "gmake" only, not with "make"
## Description:
## -----------
##	Top level Makefile for compiling Vera DES environment.
##
## $Id: Makefile,v 1.3 2007/07/25 19:40:55 drp Exp $
################################################################################

################################################################################
# variable declarations
################################################################################

SYS := siu
## Coverage top level directory
CTOP := ${DV_ROOT}/verif/env/common/coverage

ECHO := echo
PID  := $(shell echo $$$$)	## :-). Just get a random number

## parallel make at sub-dir level
ifndef p
p := 1
endif

.SUFFIXES:

VERA_LIBDIR    ?= ./lib

## Coverage users
## -------- ----- 
##	1. add <unit> to EXCLUDED_UNITS and COV_UNITS
##      2. Add entry for <unit> below "all"
##
## Look for "Coverage edit", below.
## Remember to use "gmake" instead of "make" when testing.

## Selectively turn on coverage units needed
## Coverage edit (1)
EXCLUDED_UNITS := siu
EXCLUDED_UNITS += 

COV_UNITS      :=
VERA_DEFS      ?=

# added this macro to exclude stuff for NIU
ifdef FC_NO_NIU_T2
VERA_DEFS   += -DFC_NO_NIU_T2
endif

## When top level coverage objects are built, they update <unit>_built
## target file.
## These are used to decide if $(SYS)_top.vro needs to be recompiled
COV_BUILT      := $(COV_UNITS:%=$(VERA_LIBDIR)/%_built)

ifdef SIU_COVERAGE
COV_UNITS      += siu
VERA_DEFS      += -DSIU_COVERAGE
endif

ifdef NO_0INMGR
VERA_DEFS      += -DNO_0INMGR
endif

VERA_VRH       ?= vera -cmp -I . -max_error 5 -q $(VERA_DEFS) -H
VERA_VRO       ?= vera -cmp -I . -max_error 5 -q $(VERA_DEFS)

COMMON_DIR     := ${DV_ROOT}/verif/env/common/vera/

# siu stub ports 
PORT_SRC       := include/siu_ports_binds.vrhpal
IF_SRC	       := include/siu.if.vrhpal
PORT_DEST      := $(VERA_LIBDIR)/siu_ports_binds.vrh
IF_DEST        := $(VERA_LIBDIR)/siu.if.vrh

# share between siu sat, stubs and monitors
VERA_INCLUDE   := include/siu_delay.vrh
VERA_INCLUDE   += include/siu_monitor.vrh
VERA_INCLUDE   += include/top_defines.vrh
VERA_INCLUDE   := $(subst include,$(VERA_LIBDIR),$(VERA_INCLUDE))

# siu sat and stub use only
SIU_INCLUDE   := include/siu_top.vcon
SIU_INCLUDE   += include/siu_l2_defines.vrh
SIU_INCLUDE   += include/diag.vri
SIU_INCLUDE   := $(subst include,$(VERA_LIBDIR),$(SIU_INCLUDE))

MONPORT_SRC    := include/siumon_ports_binds.vrhpal
MONIF_SRC      := include/siumon.if.vrhpal
MONPORT_DEST   := $(VERA_LIBDIR)/siumon_ports_binds.vrh
MONIF_DEST     := $(VERA_LIBDIR)/siumon.if.vrh

PACKETS        :=  packets/siu_err_mask.vr
PACKETS        +=  packets/siu_basic_packet.vr
PACKETS        +=  packets/siu_common.vr
PACKETS        +=  packets/siu_dmu_packet.vr
PACKETS        +=  packets/siu_jtag_packet.vr
PACKETS        +=  packets/siu_l2_packet.vr
PACKETS        +=  packets/siu_ncu_packet.vr
# added this
ifndef FC_NO_NIU_T2
PACKETS        +=  packets/siu_niu_packet.vr
endif
PACKETS        :=  $(subst packets,$(VERA_LIBDIR),$(PACKETS))
PACKETS_VRH    :=  $(patsubst %.vr,%.vrh,$(PACKETS))
PACKETS_VRO    :=  $(patsubst %.vr,%.vro,$(PACKETS))

STUBS          :=  stubs/dmu_phy.vr
STUBS          +=  stubs/l2_stub.vr
STUBS          +=  stubs/ncu_stub.vr
STUBS          +=  stubs/niu_phy.vr
STUBS          +=  stubs/tcu_phy.vr
STUBS          :=  $(subst stubs,$(VERA_LIBDIR),$(STUBS))
STUBS_VRH      :=  $(patsubst %.vr,%.vrh,$(STUBS))
STUBS_VRO      :=  $(patsubst %.vr,%.vro,$(STUBS))

MONITORS       :=  monitors/siu_dmu_mon.vr
MONITORS       +=  monitors/siu_l2_mon.vr
# added this
ifndef FC_NO_NIU_T2
MONITORS       +=  monitors/siu_niu_mon.vr
endif
MONITORS       +=  monitors/siu_order_checker.vr
MONITORS       :=  $(subst monitors,$(VERA_LIBDIR),$(MONITORS))
MONITORS_VRH   :=  $(patsubst %.vr,%.vrh,$(MONITORS))
MONITORS_VRO   :=  $(patsubst %.vr,%.vro,$(MONITORS))

MISC           :=  monitors/siu_ncu_err_mon.vr
MISC           +=  monitors/siu_ncu_synd_mon.vr
MISC           :=  $(subst monitors,$(VERA_LIBDIR),$(MISC))
MISC_VRH       :=  $(patsubst %.vr,%.vrh,$(MISC))
MISC_VRO       :=  $(patsubst %.vr,%.vro,$(MISC))

COMMON         := std_display_class.vr

ifndef NO_0INMGR
ZERO_MGR        := ZeroInManager.vr
ZERO_INCLUDE	:= $(COMMON_DIR)include/ZeroInDefines.vri
ZERO_INCLUDE	+= $(COMMON_DIR)classes/ZeroInManager.vrh
ZERO_INCLUDE	+= $(COMMON_DIR)classes/ZeroInManager.vr
ZERO_INCLUDE	:= $(subst $(COMMON_DIR)include,$(VERA_LIBDIR),$(ZERO_INCLUDE))
ZERO_INCLUDE	:= $(subst $(COMMON_DIR)classes,$(VERA_LIBDIR),$(ZERO_INCLUDE))
ZERO_MGR_VRH	:= $(patsubst %.vr,$(VERA_LIBDIR)/%.vrh,$(ZERO_MGR))
ZERO_MGR_VRO	:= $(patsubst %.vr,$(VERA_LIBDIR)/%.vro,$(ZERO_MGR))
endif

COMMON_INCLUDE :=  $(COMMON_DIR)include/seeding.vri
COMMON_INCLUDE +=  $(COMMON_DIR)include/std_display_defines.vri
COMMON_INCLUDE +=  $(COMMON_DIR)include/plusArgMacros.vri
COMMON_INCLUDE +=  $(COMMON_DIR)classes/std_display_class.vrh
COMMON_INCLUDE +=  $(COMMON_DIR)classes/std_display_class.vr
COMMON_INCLUDE := $(subst $(COMMON_DIR)include,$(VERA_LIBDIR),$(COMMON_INCLUDE))
COMMON_INCLUDE := $(subst $(COMMON_DIR)classes,$(VERA_LIBDIR),$(COMMON_INCLUDE))
COMMON_VRH     := $(patsubst %.vr,$(VERA_LIBDIR)/%.vrh,$(COMMON))
COMMON_VRO     := $(patsubst %.vr,$(VERA_LIBDIR)/%.vro,$(COMMON))


################################################################################
# generic rule to make a .vro file
################################################################################

$(VERA_LIBDIR)/%.vrh:  $(VERA_LIBDIR)/%.vr
	@$(ECHO) $(INDENT) "Vera: generating headers for $(notdir $<)"
	cd $(VERA_LIBDIR); $(VERA_VRH) $(notdir $<) $(notdir $(@:%.vrh=%))

$(VERA_LIBDIR)/%.vro:  $(VERA_LIBDIR)/%.vr
	@$(ECHO) $(INDENT) "Vera: compiling $(notdir $<)"
	cd $(VERA_LIBDIR); $(VERA_VRO) $(notdir $<) $(notdir $@)

$(VERA_LIBDIR)/%: $(COMMON_DIR)/%
	@$(ECHO) $(INDENT) "Copying $<"
	cp -f $< $@

$(VERA_LIBDIR)/%: $(COMMON_DIR)classes/%
	@$(ECHO) $(INDENT) "Copying $<"
	cp -f $< $@

$(VERA_LIBDIR)/%: $(COMMON_DIR)include/%
	@$(ECHO) $(INDENT) "Copying $<"
	cp -f $< $@

$(VERA_LIBDIR)/%: packets/%
	@$(ECHO) $(INDENT) "Copying $<"
	cp -f $< $@

$(VERA_LIBDIR)/%: stubs/%
	@$(ECHO) $(INDENT) "Copying $<"
	cp -f $< $@

$(VERA_LIBDIR)/%: monitors/%
	@$(ECHO) $(INDENT) "Copying $<"
	cp -f $< $@

$(VERA_LIBDIR)/%: include/% 
	@$(ECHO) $(INDENT) "Copying $<"
	cp -f $< $@

$(VERA_LIBDIR)/%: %
	@$(ECHO) $(INDENT) "Copying $<"
	cp -f $< $@


################################################################################
# all
################################################################################

ifdef NO_0INMGR
all: siu_mon $(SIU_INCLUDE) \
     $(PORT_DEST) $(IF_DEST) $(COV_UNITS) \
     $(STUBS_VRH) $(STUBS_VRO)\
     $(VERA_LIBDIR)/diag.vri \
     $(MISC_VRH) $(MISC_VRO) \
     $(VERA_LIBDIR)/siu_top.vro
else
all: siu_mon $(SIU_INCLUDE) \
     $(ZERO_INCLUDE) $(ZERO_MGR_VRH) $(ZERO_MGR_VRO) \
     $(PORT_DEST) $(IF_DEST) $(COV_UNITS) \
     $(STUBS_VRH) $(STUBS_VRO)\
     $(VERA_LIBDIR)/diag.vri \
     $(MISC_VRH) $(MISC_VRO) \
     $(VERA_LIBDIR)/siu_top.vro
endif

dir:
	if (test ! -d  $(VERA_LIBDIR)) then mkdir  $(VERA_LIBDIR) ; fi

$(PORT_DEST): $(PORT_SRC)
	pal -r $<   > $@

$(IF_DEST): $(IF_SRC)
	pal -r $<   > $@

$(MONPORT_DEST): $(MONPORT_SRC)
	pal -r $<   > $@

$(MONIF_DEST): $(MONIF_SRC)
	pal -r $<   > $@

siu_mon: dir $(COMMON_INCLUDE) $(COMMON_VRH) $(COMMON_VRO) \
	$(MONPORT_DEST) $(MONIF_DEST) $(VERA_INCLUDE)\
	$(PACKETS_VRH) $(PACKETS_VRO) \
	$(MONITORS_VRH) $(MONITORS_VRO)
	
################################################################################
### Begin checker and stub targets
################################################################################
MAKE_CMD := $(MAKE) --no-print-directory -j $(p)

siu:
	@$(ECHO) ""
	@$(ECHO) "[Building siu coverage"
	if (test -d $(CTOP)/siu) then \
	( cd $(CTOP)/siu; \
		if (test -f Makefile) then $(MAKE_CMD) ; fi ) \
	fi
	@$(ECHO) "Done with siu coverage]"
	@$(ECHO) ""


## Coverage edit (2)
## Copy next three lines, paste above, edit <unit> and uncomment
#<unit>: $(HDL_INCLUDE)
#	@$(ECHO) ""
#	@$(ECHO) "[Building <unit> coverage"
#	if (test -d $(CTOP)/<unit>) then \
#	( cd $(CTOP)/<unit>; \
#		if (test -f Makefile) then $(COV_MAKE_CMD) ; fi ) \
#	fi
#	@$(ECHO) "Done with <unit> coverage]"
#	@$(ECHO) ""

### End coverage related targets

################################################################################
# Extra dependences for special rebuilds
################################################################################
$(VERA_LIBDIR)/$(SYS)_top.vro: $(COV_BUILT) $(VERA_LIBDIR)/units_used
$(VERA_LIBDIR)/$(SYS)_top.vrh: $(VERA_LIBDIR)/units_used
$(VERA_LIBDIR)/units_used: FORCE
	test -f $@ || touch $@
	$(ECHO) $(COV_UNITS) > /tmp/units_used.$(PID)
	diff /tmp/units_used.$(PID) $@ > /dev/null || \
		mv /tmp/units_used.$(PID) $@
	rm -f /tmp/units_used.$(PID)
	$(ECHO) $(EXCLUDED_UNITS) > $(VERA_LIBDIR)/excluded_cov_units

## Dummy target to get above to always fire
FORCE:

.PHONY: FORCE

ifndef DEBUG
.SILENT:
endif

################################################################################
# clean
################################################################################

clean:
	rm -rf $(VERA_LIBDIR)/*
