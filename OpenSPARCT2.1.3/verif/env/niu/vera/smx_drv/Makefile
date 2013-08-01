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
RXC_SAT		?= RXC_MOD

VERA_LIBDIR    ?= ./lib

VERA_VRH       ?= vera -cmp ${NEPTUNE_MODE} -I . -max_error 5 -q -H
VERA_VRO       ?= vera -cmp ${NEPTUNE_MODE} -I . -max_error 5 -q
MAKE_STRING    ?= "-D${NEPTUNE_MODE} -D${RXC_SAT}"


COMMON_DIR     := ${DV_ROOT}/verif/env/common/vera/

PORT_SRC       := include/siu_drv_ports.if.vrhpal 
IF_SRC	       := 
PORT_DEST      := $(VERA_LIBDIR)/siu_drv_ports.if.vrh 
IF_DEST        := 

VERA_INCLUDE   := $(wildcard include/*vcon*)
VERA_INCLUDE   += $(wildcard include/*.vrh)
VERA_INCLUDE   += $(wildcard include/*.vri)
VERA_INCLUDE   += $(wildcard include/*.vrhpal)
VERA_INCLUDE   += $(wildcard include/*.vripal)
VERA_INCLUDE   := $(subst include,$(VERA_LIBDIR),$(VERA_INCLUDE))

CFLAGS		?= NEPTUNE
TMP_MODE       = $(findstring -DN2, ${NEPTUNE_MODE})
ifeq ($(TMP_MODE),-DN2)
MODE = N2
CFLAGS	= N2
endif

TMP0_MODE	= $(findstring MAC_SAT, ${NEPTUNE_MODE})
ifeq (${TMP0_MODE},MAC_SAT)
MODE0 = MAC_SAT
endif

ifdef N2_FC
  ifdef NIU_GATE
   SIU_STUB        +=  niu_memcbmgr.vr niu_mem.vr niu_siu_packet.vr meta_monitor.vr hostRdCbMgr.vr
  else
   SIU_STUB        +=   niu_mem.vr niu_siu_packet.vr hostRdCbMgr.vr
  endif
else
  ifdef N2_IOS
     SIU_STUB	   +=  niu_memcbmgr.vr niu_mem.vr niu_siu_packet.vr hostRdCbMgr.vr
  else
   ifeq ($(MODE),N2)
    ifeq ($(MODE0),MAC_SAT)
     SIU_STUB        +=  niu_memcbmgr.vr niu_mem.vr niu_siu_packet.vr niu_siu_stub.vr meta_driver.vr  niu_rxc_mon.vr meta_monitor.vr niu_siu_chk.vr hostRdCbMgr.vr
    else
     SIU_STUB        +=  niu_memcbmgr.vr niu_mem.vr niu_siu_packet.vr niu_siu_stub.vr meta_driver.vr niu_rxc_mon.vr meta_monitor.vr niu_siu_chk.vr hostRdCbMgr.vr
    endif
   else
    ifeq ($(MODE0),MAC_SAT)
      SIU_STUB        +=  niu_memcbmgr.vr niu_mem.vr hostRdCbMgr.vr 
    else
       SIU_STUB        +=  niu_memcbmgr.vr niu_mem.vr niu_rxc_mon.vr meta_monitor.vr hostRdCbMgr.vr
    endif
  endif
  endif
endif

SIU_STUB_VRH    :=  $(patsubst %.vr,%.vrh,$(SIU_STUB))
SIU_STUB_VRO    :=  $(patsubst %.vr,%.vro,$(SIU_STUB))

MISC           := 

COMMON         := $(SIU_STUB)

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
	MEM_PLIS	\
	$(COMMON_INCLUDE) \
	$(COMMON_VRH) $(COMMON_VRO) \
	$(COMMON_VH) \
	$(MISC_VRH) $(MISC_VRO) 



dir:
	if (test ! -d  $(VERA_LIBDIR)) then mkdir  $(VERA_LIBDIR) ; fi


ifdef N2_FC
MEM_PLIS:
	cd ${DV_ROOT}/verif/model/verilog/niu/sparse_mem_model/pli/src; gmake DFLAGS=N2_FC 
$(PORT_DEST): $(PORT_SRC)
	pal -r $<   > $@
else
MEM_PLIS:
	cd ${DV_ROOT}/verif/model/verilog/niu/sparse_mem_model/pli/src; gmake DFLAGS=$(CFLAGS)
$(PORT_DEST): $(PORT_SRC)
	pal -r $<   > $@
endif

################################################################################
# clean
################################################################################

clean:
	rm -rf $(VERA_LIBDIR)/*
