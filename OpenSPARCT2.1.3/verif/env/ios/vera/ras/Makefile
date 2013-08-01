################################################################################
## $Id: Makefile,v 1.2 2007/05/01 21:27:50 durgam Exp $
##
## File:	Makefile
## Notes:	runs with "gmake" only, not with "make"
##
## Description: Makefile for RAS utilitiese for IOS envirnoment
##
################################################################################

################################################################################
# variable declarations
################################################################################

ECHO := echo

.SUFFIXES:

ifdef N2_FC
ifdef GATESIM
testbench_vera_cmp_switches     = -g -max_error 5 -DN2_FC -DGATESIM
else
testbench_vera_cmp_switches     = -g -max_error 5 -DN2_FC 
endif
else
testbench_vera_cmp_switches	= -g -max_error 5 
endif

VERA_LIBDIR    ?= ./lib

# added this macro 
VERA_DEFS      ?=
ifdef FC_NO_NIU_T2
VERA_DEFS  += -DFC_NO_NIU_T2
endif
VERA_VRH       ?= vera -cmp ${VERA_DEFS} -I . $(testbench_vera_cmp_switches) -H
VERA_VRO       ?= vera -cmp ${VERA_DEFS} -I . $(testbench_vera_cmp_switches)

COMMON_DIR     := ${DV_ROOT}/verif/env/common/vera/
SIU_COMMON_DIR := ${DV_ROOT}/verif/env/siu/vera/packets/

PORT_SRC       := include/ios_ras_ports_binds.vrhpal
IF_SRC         := include/ios_ras.if.vrhpal
PORT_DEST      := $(VERA_LIBDIR)/ios_ras_ports_binds.vrh
IF_DEST        := $(VERA_LIBDIR)/ios_ras.if.vrh

ERRMON_PORT_SRC       := include/ios_rasmon_ports_binds.vrhpal
ERRMON_IF_SRC         := include/ios_rasmon.if.vrhpal
ERRMON_PORT_DEST      := $(VERA_LIBDIR)/ios_rasmon_ports_binds.vrh
ERRMON_IF_DEST        := $(VERA_LIBDIR)/ios_rasmon.if.vrh

VERA_INCLUDE    := include/verilog_tasks_InjErr.vri
VERA_INCLUDE	+= include/ios_ras_defines.vrh
VERA_INCLUDE   := $(subst include,$(VERA_LIBDIR),$(VERA_INCLUDE))

ifndef GATESIM
RAS_DIR        :=  ../ras
RAS_SRC        :=  $(RAS_DIR)/ios_err_packet.vr
RAS_SRC        +=  $(RAS_DIR)/ios_injerr.vr
RAS_SRC        +=  $(RAS_DIR)/ios_err_interrupt.vr
# added this macro 
ifndef FC_NO_NIU_T2
RAS_SRC        +=  $(RAS_DIR)/sioniu_err_mon.vr
endif
RAS_SRC        +=  $(RAS_DIR)/siodmu_err_mon.vr
RAS_SRC        :=  $(subst $(RAS_DIR),$(VERA_LIBDIR),$(RAS_SRC))
RAS_VRH        :=  $(patsubst %.vr,%.vrh,$(RAS_SRC))
RAS_VRO        :=  $(patsubst %.vr,%.vro,$(RAS_SRC))
else
RAS_DIR        :=  ../ras
RAS_SRC        :=  $(RAS_DIR)/ios_err_packet.vr
RAS_SRC        +=  $(RAS_DIR)/ios_injerr.vr
RAS_SRC        +=  $(RAS_DIR)/sioniu_err_mon.vr
RAS_SRC        +=  $(RAS_DIR)/siodmu_err_mon.vr
RAS_SRC        :=  $(subst $(RAS_DIR),$(VERA_LIBDIR),$(RAS_SRC))
RAS_VRH        :=  $(patsubst %.vr,%.vrh,$(RAS_SRC))
RAS_VRO        :=  $(patsubst %.vr,%.vro,$(RAS_SRC))
endif

COMMON         := std_display_class.vr

COMMON_INCLUDE := $(COMMON_DIR)include/std_display_defines.vri
COMMON_INCLUDE += $(COMMON_DIR)include/plusArgMacros.vri
COMMON_INCLUDE := $(subst $(COMMON_DIR)include,$(VERA_LIBDIR),$(COMMON_INCLUDE))
COMMON_VRH     := $(patsubst %.vr,$(VERA_LIBDIR)/%.vrh,$(COMMON))
COMMON_VRO     := $(patsubst %.vr,$(VERA_LIBDIR)/%.vro,$(COMMON))

SIU_COMMON     := siu_common.vr

SIU_INCLUDE    := $(SIU_COMMON_DIR)siu_common.vr
SIU_INCLUDE    := $(subst $(SIU_COMMON_DIR),$(VERA_LIBDIR),$(SIU_INCLUDE))
SIU_COMM_VRH   := $(patsubst %.vr,$(VERA_LIBDIR)/%.vrh,$(SIU_COMMON))
SIU_COMM_VRO   := $(patsubst %.vr,$(VERA_LIBDIR)/%.vro,$(SIU_COMMON))

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

$(VERA_LIBDIR)/%: $(SIU_COMMON_DIR)/%
	cp -f $< $@

$(VERA_LIBDIR)/%: include/% 
	cp -f $< $@

$(VERA_LIBDIR)/%: %
	cp -f $< $@


################################################################################
# all
################################################################################

all: dir $(PORT_DEST) $(IF_DEST) $(ERRMON_PORT_DEST) $(ERRMON_IF_DEST) $(VERA_INCLUDE)\
     $(COMMON_INCLUDE) $(COMMON_VRH) $(COMMON_VRO) \
     ios_inc $(SIU_COMM_VRH) $(SIU_COMM_VRO) $(RAS_VRH) $(RAS_VRO)
     
dir:
	if (test ! -d  $(VERA_LIBDIR)) then mkdir  $(VERA_LIBDIR) ; fi

$(PORT_DEST): $(PORT_SRC)
	pal -r $<   > $@

$(IF_DEST): $(IF_SRC)
	pal -r $<   > $@

$(ERRMON_PORT_DEST): $(ERRMON_PORT_SRC)
	pal -r $<   > $@

$(ERRMON_IF_DEST): $(ERRMON_IF_SRC)
	pal -r $<   > $@

ios_inc:
	if (test ! -f  $(VERA_LIBDIR)/top_defines.vrh) \
	then cp -f ../include/top_defines.vrh $(VERA_LIBDIR) ; \
	fi
################################################################################
# clean
################################################################################

clean:
	rm -rf $(VERA_LIBDIR)/*
