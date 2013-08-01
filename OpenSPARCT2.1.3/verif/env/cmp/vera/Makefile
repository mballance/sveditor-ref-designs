################################################################################
## File:	Makefile
## Notes:	runs with "gmake" only, not with "make"
##
## Description:
## -----------
##	Top level Makefile for compiling Vera/NTB environment.
##
## $Id: Makefile,v 1.2 2007/05/03 18:12:41 drp Exp $
################################################################################

################################################################################
# variable declarations
################################################################################

.SUFFIXES:

THIS_DIR       := ${PWD}

# do not over-ride!
SYS_NAME       ?= cmp1
VERA_LIBDIR    ?= $(THIS_DIR)/lib
# VERA_LIBDIR    ?= ${MODEL_DIR}/${SYS_NAME}/rel-0.1/vera

ECHO           := echo
COPY_CMD       = cp -fp $< $@ 
COMMON_DIR     := ${DV_ROOT}/verif/env/common/vera

# NOT for users to use, ONLY CONFIG FILE
VERA_SYS_DEFS  ?=

# compile options that users can over-ride at will 
# VERA_OPTS
# NTB_OPTS

# for any user use and over-ride at will 
VERA_DEFS      ?=


# All paths to all vera files (include files and .vr files)
# Do not change VPATH name or delete it!!!
# 
# KEEP UP TO DATE!!!
VPATH          :=  \
${PWD}/classes ${PWD}/include ${PWD}/interfaces ${PWD} \
$(COMMON_DIR)/classes $(COMMON_DIR)/ccxDevices \
$(COMMON_DIR)/include $(COMMON_DIR)/interfaces \
${PWD}/../../../../design/sys/iop/cpu/rtl


# All files that we want to *compile*.
# Will be processed IN THIS ORDER. Base classes before the extended versions, etc.
# (dependencies matter if letting vera make vrh files, but were not). 
# Will get fresh .vro files made from these files if the .vr, or any .vr[hi] has changed.
# 
# KEEP UP TO DATE!!!
#
ORDERD_LIST   := \
std_display_class.vr \
baseUtilsClass.vr \
sparcBenchUtils.vr \
baseParamsClass.vr \
sparcParams.vr \
utilsClass.vr \
memArray.vr \
basePktClass.vr \
cpxPktClass.vr \
pcxPktClass.vr \
ccxDevBaseBFM.vr \
ccxDevMemBFM.vr \
ccxDevSpcBFM.vr \
MCUStub_class.vr \
ccx_tag_class.vr \
asmEvent.vr \
asmEventsToVera.vr \
baseAsmToVeraIntf.vr \
asmToVeraIntf.vr \
ccxPktMon.vr \
baseCCXtrans.vr \
irritator.vr \
cmp_top.vr



# ORDERD_VRH     := $(patsubst %.vr,$(VERA_LIBDIR)/%.vrh,$(ORDERD_LIST))
# targets list. .vro's we want to make.
ORDERD_VRO     := $(patsubst %.vr,$(VERA_LIBDIR)/%.vro,$(ORDERD_LIST))
VERA_DEP       := $(foreach dir,$(VPATH),$(wildcard $(dir)/*.vr?))

# vera command line defines
EMPTY          :=
SPACE          := $(EMPTY) $(EMPTY)
VERA_INCDIR    := $(subst $(SPACE),$(SPACE)-I,$(VPATH))
VERA_INCDIR    := -I$(VERA_INCDIR)
VERA_OPTS      := -max_error 5 -q -g

# NTB  command line defines
NTB_INCDIR     := $(subst $(SPACE),+,$(VPATH))
NTB_INCDIR     := -ntb_incdir $(NTB_INCDIR)
NTB_OPTS       ?= -ntb_opts compat+verbose+file_by_file
NTB_DEFS       := $(subst "-D","-ntb_define ",$(VERA_DEFS))
NTB_DEFS       += $(subst "-D","-ntb_define ",$(VERA_SYS_DEFS))
NTB_DEFS       += -ntb_define CMP_BENCH

# commands
VERA_VRH       := vera -cmp $(VERA_INCDIR) -DCMP_BENCH $(VERA_DEFS) $(VERA_SYS_DEFS) $(VERA_OPTS) -h
VERA_VRO       := vera -cmp $(VERA_INCDIR) -DCMP_BENCH $(VERA_DEFS) $(VERA_SYS_DEFS) $(VERA_OPTS)
VERA_NTB       := vcs -ntb -ntb_define NTB -ntb_define CMP_BENCH -ntb_cmp -ntb_sname ${SYS_NAME}_test -ntb_filext .vr+.vrh+.vri+.vrl $(NTB_OPTS) $(NTB_INCDIR) $(ORDERD_LIST) -Mupdate


################################################################################
# all
################################################################################

all: vera

vera: makedir copy_stuff copy_vera_stuff $(ORDERD_VRO)

# target is libtb.so
ntb_lib: makedir $(VERA_LIBDIR)/libtb.so

makedir:
	@if (test ! -d  $(VERA_LIBDIR)) then mkdir  $(VERA_LIBDIR) ; fi


# Dependancy files are copied to $(VERA_LIBDIR) ONLY so that the need for an
# incremental compile can be detected.
# 
# For the actual Vera compile, this makefile knows how find dependency
# files where they live and tells vera. Vera compiles with the
# ORIGINAL vrh/vri file, not a copy if you use #include <file> syntax,
# not #include "file", which is a good idea if you want Vera's -I to
# find the right include file every time.  See VPATH
# 
# Be aware, you can get name collisions in $(VERA_LIBDIR) which could cause
# problems. When using vera diags, you must copy any include files that the
# diag needs into VERA_LIBDIR.
copy_stuff:
	@vera -V
	@cp -fp include/*vcon* $(VERA_LIBDIR)
	@rm -f $(VERA_LIBDIR)/../$(SYS_NAME)_top_shell.v

copy_vera_stuff:
	@cp -fp $(VERA_DEP) $(VERA_LIBDIR)

clean:
	rm -rf $(VERA_LIBDIR)/* ; rm -rf $(VERA_LIBDIR)/../$(SYS_NAME)_top_shell.v

# cleanNTB: 
# 	@rm -f $(VERA_LIBDIR)/libtb.so $(VERA_LIBDIR)/*.vcon
# 
# cleanVera: 
# 	@rm -f $(VERA_LIBDIR)/*.vro $(VERA_LIBDIR)/*.vcon $(VERA_LIBDIR)/*.vshell $(VERA_LIBDIR)/*.proj*

test: 
	@echo "<<VERA_DEP>>" $(VERA_DEP) 
	@echo "<<PWD>>" ${PWD}
	@echo "<<VERA_NTB>>" $(VERA_NTB)
	@echo "<<VERA_INCDIR>>" $(VERA_INCDIR)
	@echo "<<VERA_LIBDIR>>" $(VERA_LIBDIR)

vrh:
	@echo "To make a vrh for your class do --> " $(VERA_VRH) "path_to_class"


################################################################################
# generic rules
################################################################################

$(VERA_LIBDIR)/%.vro: %.vr $(VERA_DEP)
	@echo ">>>> Vera: compiling $(notdir $<)"
	@cd $(dir $<) ; $(VERA_VRO) $(notdir $<) $@

$(VERA_LIBDIR)/libtb.so: $(VERA_DEP)
	@echo ">>>> Vera: compiling NTB testbench libtb.so"
	cd $(VERA_LIBDIR) ; $(VERA_NTB) ; cd $(THIS_DIR) ; mv -f *.vshell $(VERA_LIBDIR)/../$(SYS_NAME)_top_shell.v
# DO NOT DELETE
