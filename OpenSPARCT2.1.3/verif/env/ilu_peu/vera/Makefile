################################################################################
## File:	Makefile
## Notes:	runs with "gmake" only, not with "make"
##              to get the PEU SAT(FNX lpusd) to run in our sims environment.
## Description:
## -----------
##	Top level Makefile for compiling Vera ILU_PEU environment.
##
## release note:
## -------------
## 01/18/2005	ac	on archie flow, reference new remove_access_methods.pl
## 04/05/2005   ac      add zeroinmgr for disable check function 
################################################################################

################################################################################
# variable declarations
################################################################################
common_dir_classes	= $(DV_ROOT)/verif/env/common/vera/classes
common_dir		= $(DV_ROOT)/verif/env/common/vera

#----------------------------------------------------------------------------
# UD : To make ilu_peu and FC SAT use the same Makefile.
#----------------------------------------------------------------------------
ifdef N2_FC
SYS := fc
else
SYS := ilu_peu
endif

ECHO := echo
PID  := $(shell echo $$$$)	## :-). Just get a random number

.SUFFIXES:

VERA_LIBDIR    ?= vera/lib

ifdef N2_IOS
testbench_vshell = tb_top.vshell
else
testbench_vshell = $(SYS)_top.vshell
endif
testbench_vcon   = $(SYS)_top.vcon


#----------------------------------------------------------------------------
# Coverage related setup
#----------------------------------------------------------------------------


## Coverage top level directory
CTOP := ${DV_ROOT}/verif/env/common/coverage


## Coverage users
## -------- ----- 
##	1. add <unit> to EXCLUDED_UNITS and COV_UNITS
##      2. Add entry for <unit> below "all"
##
## Look for "Coverage edit", below.
## Remember to use "gmake" instead of "make" when testing.

## Selectively turn on coverage units needed
## Coverage edit (1)
EXCLUDED_UNITS := ilu_peu
EXCLUDED_UNITS += 

COV_UNITS      :=
VERA_DEFS      ?=

## When top level coverage objects are built, they update <unit>_built
## target file.
## These are used to decide if $(SYS)_top.vro needs to be recompiled
COV_BUILT      := $(COV_UNITS:%=$(VERA_LIBDIR)/%_built)

ifdef ILU_PEU_COVERAGE
COV_UNITS      += ilu_peu
VERA_DEFS      += -DILU_PEU_COVERAGE
endif

##### zeroin manager 
ifdef NO_0INMGR
VERA_DEFS      += -DNO_0INMGR
endif

#### only compile these files if NO_0INMGR switch is not present
zeroin_src        :=
zeroin_define_src        :=
ifndef NO_0INMGR
zeroin_define_src        := $(VERA_LIBDIR)/ZeroInDefines.vri 
zeroin_src        := $(common_dir)/classes/ZeroInManager.vr
endif 
#AC: 
#AC: VERA_VRH       ?= vera -cmp -I . -max_error 5 -q $(VERA_DEFS) -H
#AC: VERA_VRO       ?= vera -cmp -I . -max_error 5 -q $(VERA_DEFS)
#AC: 
#AC: COMMON_DIR     := ${DV_ROOT}/verif/env/common/vera/
#AC: 
#AC:  PORT_SRC       := include/ilu_peu_ports_binds.vrhpal
#AC:  MONPORT_SRC    := include/ilu_peumon_ports_binds.vrhpal
#AC:  IF_SRC	       := include/ilu_peu.if.vrhpal
#AC:  MONIF_SRC      := include/ilu_peumon.if.vrhpal
#AC:  PORT_DEST      := $(VERA_LIBDIR)/ilu_peu_ports_binds.vrh
#AC:  IF_DEST        := $(VERA_LIBDIR)/ilu_peu.if.vrh
#AC:  MONPORT_DEST   := $(VERA_LIBDIR)/ilu_peumon_ports_binds.vrh
#AC:  MONIF_DEST     := $(VERA_LIBDIR)/ilu_peumon.if.vrh

# ???VERA_INCLUDE   := $(wildcard include/*vcon*)
# ???VERA_INCLUDE   += $(wildcard include/*.vrh)
# ???VERA_INCLUDE   += $(wildcard include/*.vri)
# ???VERA_INCLUDE   := $(subst include,$(VERA_LIBDIR),$(VERA_INCLUDE))

# ??? PACKETS        :=  packets/ilu_peu_err_mask.vr
# ??? PACKETS        +=  packets/ilu_peu_basic_packet.vr
# ??? PACKETS        +=  $(wildcard packets/*.vr)
# ??? PACKETS        :=  $(subst packets,$(VERA_LIBDIR),$(PACKETS))
# ??? PACKETS_VRH    :=  $(patsubst %.vr,%.vrh,$(PACKETS))
# ??? PACKETS_VRO    :=  $(patsubst %.vr,%.vro,$(PACKETS))
# ??? xxx 
# ??? STUBS          :=  $(wildcard stubs/*.vr)
# ??? STUBS          :=  $(subst stubs,$(VERA_LIBDIR),$(STUBS))
# ??? STUBS_VRH      :=  $(patsubst %.vr,%.vrh,$(STUBS))
# ??? STUBS_VRO      :=  $(patsubst %.vr,%.vro,$(STUBS))
# ??? 
# ??? MONITORS       :=  $(wildcard monitors/*.vr)
# ??? MONITORS       :=  $(subst monitors,$(VERA_LIBDIR),$(MONITORS))
# ??? MONITORS_VRH   :=  $(patsubst %.vr,%.vrh,$(MONITORS))
# ??? MONITORS_VRO   :=  $(patsubst %.vr,%.vro,$(MONITORS))
# ??? 
# ??? MISC           := 
# ??? 
# ??? COMMON         := std_display_class.vr
# ??? COMMON2        := ZeroInManager.vr
# ??? 
# ??? COMMON_INCLUDE := $(wildcard $(COMMON_DIR)include/seeding.vri)
# ??? COMMON_INCLUDE += $(wildcard $(COMMON_DIR)include/std_display_defines.vri)
# ??? COMMON_INCLUDE += $(wildcard $(COMMON_DIR)include/plusArgMacros.vri)
# ??? COMMON_INCLUDE += $(wildcard $(COMMON_DIR)include/ZeroInDefines.vri)
# ??? COMMON_INCLUDE += $(wildcard $(COMMON_DIR)classes/*.vrh)
# ??? COMMON_INCLUDE += $(wildcard $(COMMON_DIR)classes/*.vr)
# ??? COMMON_INCLUDE += $(wildcard $(COMMON_DIR)*.vr*)
# ??? COMMON_INCLUDE := $(subst $(COMMON_DIR)include,$(VERA_LIBDIR),$(COMMON_INCLUDE))
# ??? COMMON_VRH     := $(patsubst %.vr,$(VERA_LIBDIR)/%.vrh,$(COMMON))
# ??? ifndef NO_0INMGR
# ??? COMMON_VRH     += $(patsubst %.vr,$(VERA_LIBDIR)/%.vrh,$(COMMON2))
# ??? endif
# ??? COMMON_VRO     := $(patsubst %.vr,$(VERA_LIBDIR)/%.vro,$(COMMON))
# ??? ifndef NO_0INMGR
# ??? COMMON_VRO     += $(patsubst %.vr,$(VERA_LIBDIR)/%.vro,$(COMMON2))
# ??? endif
# ??? 
# ??? MISC_VRH       := $(patsubst %.vr,$(VERA_LIBDIR)/%.vrh,$(MISC))
# ??? MISC_VRO       := $(patsubst %.vr,$(VERA_LIBDIR)/%.vro,$(MISC))


################################################################################
# all
################################################################################

# ??? all: dir $(COMMON_INCLUDE) $(COMMON_VRH) $(COMMON_VRO) \
# ???      $(PORT_DEST) $(IF_DEST) $(MONPORT_DEST) $(MONIF_DEST) $(COV_UNITS) $(VERA_INCLUDE) \
# ???      $(PACKETS_VRH) $(PACKETS_VRO) \
# ???      $(STUBS_VRH) $(STUBS_VRO)\
# ???      $(MONITORS_VRH) $(MONITORS_VRO)\
# ???      $(VERA_LIBDIR)/diag.vri \
# ???      $(MISC_VRH) $(MISC_VRO) \
# ???      $(VERA_LIBDIR)/ilu_peu_top.vro
# ??? 
# ??? dir:
# ??? 	if (test ! -d  $(VERA_LIBDIR)) then mkdir  $(VERA_LIBDIR) ; fi

#AC: $(PORT_DEST): $(PORT_SRC)
#AC: 	pal -r $<   > $@
#AC: 
#AC: $(IF_DEST): $(IF_SRC)
#AC: 	pal -r $<   > $@
#AC: 
#AC: $(MONPORT_DEST): $(MONPORT_SRC)
#AC: 	pal -r $<   > $@
#AC: 
#AC: $(MONIF_DEST): $(MONIF_SRC)
#AC: 	pal -r $<   > $@


################################################################################
# Extra dependences for special rebuilds
################################################################################
# ??? $(VERA_LIBDIR)/$(SYS)_top.vro: $(COV_BUILT) $(VERA_LIBDIR)/units_used
# ??? $(VERA_LIBDIR)/$(SYS)_top.vrh: $(VERA_LIBDIR)/units_used
# ??? $(VERA_LIBDIR)/units_used: FORCE
# ??? 	test -f $@ || touch $@
# ??? 	$(ECHO) $(COV_UNITS) > /tmp/units_used.$(PID)
# ??? 	diff /tmp/units_used.$(PID) $@ > /dev/null || \
# ??? 		mv /tmp/units_used.$(PID) $@
# ??? 	rm -f /tmp/units_used.$(PID)
# ??? 	$(ECHO) $(EXCLUDED_UNITS) > $(VERA_LIBDIR)/excluded_cov_units
# ??? 



#----------------------------------------------------------------------------
# The following variables list the xtr's and Vera libraries required for
# this test environment.
# The libs will come from the Fire environment so that IOS and fullchip can 
# use the same libs. The xtr's are from the fnx environment
#----------------------------------------------------------------------------
lib_list                = report CTSupportClasses CTVerifFmwork \
                          CSRFmwork XactorComponents 
#lib_list                = report CTSupportClasses CTVerifFmwork \
#                          CSRFmwork XactorComponents FNXPCIEXactor 

ifndef FC_NO_PEU_T2
xtr_list                = FNXPCIEXactor DMUXtr CCCXactor denali_root_monitor 
else
xtr_list                = FNXPCIEXactor DMUXtr CCCXactor
endif

# switch to concatenate testbench vera
testbench_combine_vera = 1

#----------------------------------------------------------------------------
# Use `testbench_vera_interface_deps' to define the dependencies for the
# be re-built.
#----------------------------------------------------------------------------
# UD : To make ilu_peu and FC SAT use the same Makefile.
#----------------------------------------------------------------------------
ifdef N2_FC
testbench_vera_interface_deps = FIRE_local_access_define.vri \
				top_defines.vri \
				ilupeu_defines.vri \
				ilupeu_report_macros.vri \
				dmu.vri 
else
testbench_vera_interface_deps = FIRE_local_access_define.vri \
				ilu_peu.bind.vri\
				ilu_peu.if.vri \
				top_defines.vri \
                                verilog_tasks.vri \
				ilupeu_defines.vri \
				ilupeu_report_macros.vri \
				dmu.vri 
endif

#----------------------------------------------------------------------------
# Variables for Setting Print Level -- runsim tests/directed/foo printlevel=DEBUG_3
#----------------------------------------------------------------------------
printlevel                      = DEBUG_3
print_control                   = +report_global_print_threshold=RPRT_$(printlevel)

#----------------------------------------------------------------------------
# Use `testbench_vera_src' to define the Vera source files used
# to build your environment.  This is intended to list locally created
# sources (in this directory and its sub-directories) only
#----------------------------------------------------------------------------
reggie_collection               = csr/CSRCollection.vr
reggie_conf                     = csr/ilupeu_reggie_control.pl
#reggie_input_dir                = $(asic_design_csrtool_dir)/output/vera

#----------------------------------------------------------------------------
# UD : To make ilu_peu and FC SAT use the same Makefile.
# Make a list of files used only by FC. conditionally include in testbench_vera_src
#----------------------------------------------------------------------------
ilu_peu_only_src        :=

ifdef N2_FC
N2fc_files              = N2fc/N2fcPEUparams.vr \
                          N2fc/N2fcXactionProbe.vr \
                          N2fc/N2fcPioCfgIORdStr.vr \
                          N2fc/N2fcPioCfgIOWrStr.vr \
                          N2fc/N2fcPioMRdStr.vr \
                          N2fc/N2fcPioMWrStr.vr \
                          N2fc/N2fcIntxStr.vr \
                          N2fc/N2fcilupeuIngressDmaWrStr.vr \
                          N2fc/N2fcilupeuIngressDmaRdStr.vr \
                          N2fc/N2fcDmaCfgIORwStr.vr \
                          N2fc/N2fcDMAPEUCtx.vr \
                          N2fc/N2fcCtx.vr

strategy_files         =  N2fc/N2fcIommuMgr.vr \
                          strategy/ilupeuScenario.vr \
                          strategy/ilupeuStrategyBase.vr \
                          N2fc/N2fcInitStrategy.vr \
                          strategy/ilupeuLinkTrainingStrategy.vr \
                          strategy/ilupeuTlpStrategyBase.vr \
                          strategy/ilupeuIngressTlpStrategy.vr \
                          strategy/ilupeuEgressTlpStrategy.vr

else

strategy_files         =  strategy/ilupeuScenario.vr \
                          strategy/ilupeuStrategyBase.vr \
                          strategy/ilupeuInitStrategy.vr \
                          strategy/ilupeuLinkTrainingStrategy.vr \
                          strategy/ilupeuTlpStrategyBase.vr \
                          strategy/ilupeuIngressTlpStrategy.vr \
                          strategy/ilupeuEgressTlpStrategy.vr
endif

context_files          =  context/ilupeuContextBase.vr \
                          context/ilupeuIngressContext.vr \
                          context/ilupeuEgressContext.vr

N2ctx_files            =  N2ctx/N2PEUCtxBase.vr \
                          N2ctx/N2DMAPEUCtx.vr \
                          N2ctx/N2PIOPEUCtx.vr \
                          N2ctx/N2ErrTlpPEUCtx.vr \
                          N2ctx/N2ExceptionPEUCtx.vr

N2str_files            =  N2str/ilupeuStrBase.vr \
                          N2str/ilupeuBootPEUStr.vr \
                          N2str/ilupeuIngressDmaWrStr.vr \
                          N2str/ilupeuIngressDmaRdStr.vr \
                          N2str/ilupeuIngressMsgStr.vr \
                          N2str/ilupeuPioBaseStr.vr \
                          N2str/ilupeuPioCfgIORdStr.vr \
                          N2str/ilupeuPioCfgIOWrStr.vr \
                          N2str/ilupeuPioMRdStr.vr \
                          N2str/ilupeuPioMWrStr.vr \
                          N2str/ilupeuErrChkPEUStr.vr \
                          N2str/ilupeuMalReqPEUStr.vr \
                          N2str/ilupeuMalCplPEUStr.vr \
                          N2str/ilupeuErrCplPEUStr.vr \
                          N2str/ilupeuDmaURBasePEUStr.vr \
                          N2str/ilupeuDmaURCfgIORdWrPEUStr.vr \
                          N2str/ilupeuDmaURMsgDPEUStr.vr \
                          N2str/ilupeuDmaURMsgPEUStr.vr \
                          N2str/ilupeuDmaURRdLkPEUStr.vr \
                          N2str/ilupeuDmaPoisonPEUStr.vr \
                          N2str/ilupeuEdbErrPEUStr.vr \
                          N2str/ilupeuEhbErrPEUStr.vr \
                          N2str/ilupeuIhbErrPEUStr.vr \
                          N2str/ilupeuLinkErrPEUStr.vr \
                          N2str/ilupeuPEUErrPEUStr.vr \
                          N2str/ilupeuTimeOutPEUStr.vr \
                          N2str/ilupeuInErrPEUStr.vr \
                          N2str/ilupeuReplayPEUStr.vr \
                          N2str/ilupeuIngressRcvrErr.vr \
                          N2str/ilupeuIngressDLLPErr.vr \
                          N2str/ilupeuIngressAckNakErr.vr \
                          N2str/ilupeuIngressduplicateSeqNmbrReq.vr \
                          N2str/ilupeuIngressFCPErr.vr \
                          N2str/ilupeuIngressnullTlpErr.vr \
			  N2str/ilupeuEgrParErr.vr \
			  N2str/ilupeuIngParErr.vr

testbench_vera_src      = ilupeuGlobals.vr \
                          $(reggie_collection) \
                          csr/ilupeuCSR.vr \
                          ilupeuPodClass.vr \
                          N2fc/N2fcPiuShadowRegs.vr \
                          $(strategy_files) \
                          $(context_files) \
                          N2env/PEUTestEnv.vr \
                          $(N2str_files) \
                          $(N2ctx_files) \
                          $(N2fc_files) \
                          N2Test/N2PEUTestBase.vr

ifndef FC_NO_PEU_T2
denali_vera_dir = $(denali_dir)/ddvapi/vera
endif

#----------------------------------------------------------------------------
# Use `testbench_vera_cmp_switches' to pass arguments to the the Vera source file
# compilation command line.
#----------------------------------------------------------------------------
# UD : To make ilu_peu and FC SAT use the same Makefile.
#----------------------------------------------------------------------------
ifdef N2_FC
ifdef GATESIM
testbench_vera_cmp_switches     = -g -max_error 5 -DN2_FC -DGATESIM
else
testbench_vera_cmp_switches	= -g -max_error 5 -DN2_FC
endif
else
ifdef N2_IOS
testbench_vera_cmp_switches	= -g -max_error 5 -DN2_IOS
else
testbench_vera_cmp_switches	= -g -max_error 5
endif
endif
#testbench_vera_cmp_switches	= -q -g -max_error 5
#testbench_vera_cmp_switches	= -g
testbench_vera_incl_dir		= csrtool 

fnx_lib_dir       	= $(DV_ROOT)/verif/env/fnx/vlib
perl_path = $(DV_ROOT)/tools/perl-5.8.0/bin/perl

grp_tools_bin_dir       = $(DV_ROOT)/verif/env/fnx/runsim/bin
export make_lib_depends = $(perl_path) $(grp_tools_bin_dir)/make_lib_depends3.pl

testbench_home_dir	= $(shell pwd)

depends                 = $(VERA_LIBDIR)/depends


ifndef FC_NO_PEU_T2
#----------------------------------------------------------------------------
# Denali Environment Variables
#----------------------------------------------------------------------------

# Use the .denalirc located in PEU TB home directory
export DENALIRC         = $(DV_ROOT)/verif/env/ilu_peu/.denalirc
endif

################################################################################
# all
################################################################################

all: $(depends)
	$(MAKE) DEPEND=1 $(COV_UNITS) testbench
#all: $(depends)
#	$(MAKE) DEPEND=1 testbench $(COV_UNITS)


$(VERA_LIBDIR) :
	mkdir $(VERA_LIBDIR)

ifneq ($(DEPEND),1)
vlib_dirs_lib               = $(addprefix $(fnx_lib_dir)/, $(lib_list))
vlib_dirs_xtr               = $(addprefix $(fnx_lib_dir)/,  $(xtr_list))
vlib_makefiles		= $(addsuffix /GNUmakefile, $(vlib_dirs_lib) $(vlib_dirs_xtr))
ifndef FC_NO_PEU_T2
$(depends) : $(VERA_LIBDIR) $(vlib_makefiles) $(testbench_home_dir)/Makefile
	$(SPEW_START)
	$(make_lib_depends) \
		$(addprefix -libn=, $(lib_list) $(xtr_list)) \
		-current_dir=$(testbench_home_dir) \
		-o $(depends) \
		-VERA_LIBDIR=$(VERA_LIBDIR)
	$(SPEW_END)
else
$(depends) : $(VERA_LIBDIR) $(vlib_makefiles) $(testbench_home_dir)/Makefile
	$(SPEW_START)
	$(make_lib_depends) \
		$(addprefix -libn=, $(lib_list) $(xtr_list)) \
		-current_dir=$(testbench_home_dir) \
		-o $(depends) \
		-VERA_LIBDIR=$(VERA_LIBDIR) \
		-no_peu
	$(SPEW_END)
endif
else
include $(depends)
endif

################################################################################
### Coverage objects 
################################################################################
COV_MAKE_CMD := $(MAKE) --no-print-directory -j $(p)

ilu_peu: $(VERA_LIBDIR)/plusArgMacros.vri 
	@$(ECHO) ""
	@$(ECHO) "[Building ilu_peu coverage"
	if (test -d $(CTOP)/ilu_peu) then \
	( cd $(CTOP)/ilu_peu; \
		if (test -f Makefile) then $(COV_MAKE_CMD) ; fi ) \
	fi
	@$(ECHO) "Done with ilu_peu coverage]"
	@$(ECHO) ""



## Coverage edit (2)
## Copy next three lines, paste above, edit <unit> and uncomment
#<unit>: $(HDL_INCLUDE)
#       @$(ECHO) ""
#       @$(ECHO) "[Building <unit> coverage"
#       if (test -d $(CTOP)/<unit>) then \
#       ( cd $(CTOP)/<unit>; \
#               if (test -f Makefile) then $(COV_MAKE_CMD) ; fi ) \
#       fi
#       @$(ECHO) "Done with <unit> coverage]"
#       @$(ECHO) ""

### End coverage related targets

###############################################################################
# clean up everything, since all created files go into $(VERA_LIBDIR)
###############################################################################

clean::
	rm -f $(VERA_LIBDIR)/*
	rm -rf $(VERA_LIBDIR)/.*


SPEW_START	= @$(ECHO) "----------------- Building $(@F) -----------------"
SPEW_END	= @$(ECHO) "----------------- Done $(@F) ------------------\n"

link		= ln -sf
#----------------------------------------------------------------
# VERA compile commands
#----------------------------------------------------------------
common_vera_inc 	= $(DV_ROOT)/verif/env/common/vera/include

vera                    = vera
VERA_CMP		= $(vera) -cmp -HCnu 
_inc_dirs		= $(VERA_LIBDIR) 

_vera_cmp	        = $(VERA_CMP) $(testbench_vera_cmp_switches) $(VERA_DEFS) \
			  $(addprefix -I, $(_inc_dirs))

_vera_cmp_all	        = 

_vera_vri_deps	        = $(addprefix $(VERA_LIBDIR)/, $(testbench_vera_interface_deps))


#----------------------------------------------------------------------------
# Vera object modules specific to this module test environment.
#----------------------------------------------------------------------------
testbench_separate_obj	= $(addprefix $(VERA_LIBDIR), $(testbench_vera_src:.vr=.vro))

ifndef FC_NO_PEU_T2
testbench_combined_obj	= $(VERA_LIBDIR)/Testbench.vro
testbench_all_obj	= $(if $(testbench_combine_vera),$(testbench_combined_obj),$(testbench_separate_obj))
else
testbench_all_obj	= $(if $(testbench_combine_vera),$(testbench_separate_obj))
endif

testbench_file_list     = $(VERA_LIBDIR)/$(SYS)_file.list

.PHONY : testbench includes
#----------------------------------------------------------------------------
# UD : To make ilu_peu and FC SAT use the same Makefile.
#----------------------------------------------------------------------------
ifndef FC_NO_PEU_T2

ifdef N2_FC
testbench : $(testbench_file_list) $(testbench_all_obj) \
	$(VERA_LIBDIR)/report.a			\
        $(VERA_LIBDIR)/denali_pcie.so
else
ifdef N2_IOS
testbench : $(testbench_file_list) $(testbench_all_obj) \
	$(VERA_LIBDIR)/report.a			\
        $(VERA_LIBDIR)/denali_pcie.so
else 
testbench : $(testbench_file_list) $(testbench_all_obj)		\
	$(VERA_LIBDIR)/$(SYS)_top.vro		\
	$(VERA_LIBDIR)/$(SYS)_top.vcon		\
	$(VERA_LIBDIR)/report.a			\
        $(VERA_LIBDIR)/denali_pcie.so
endif
endif

else

ifdef N2_FC
testbench : $(testbench_file_list) $(testbench_all_obj) \
	$(VERA_LIBDIR)/report.a
else
ifdef N2_IOS
testbench : $(testbench_file_list) $(testbench_all_obj) \
	$(VERA_LIBDIR)/report.a
else 
testbench : $(testbench_file_list) $(testbench_all_obj)		\
	$(VERA_LIBDIR)/$(SYS)_top.vro		\
	$(VERA_LIBDIR)/$(SYS)_top.vcon		\
	$(VERA_LIBDIR)/report.a
endif
endif

endif

ifndef FC_NO_PEU_T2
$(testbench_all_obj) :	$(VERA_LIBDIR)/Testbench.vr \
                        includes \
			$(_vera_vri_deps) \
			$(VERA_LIBDIR)/seeding.vri \
			$(VERA_LIBDIR)/std_display_defines.vri \
			$(zeroin_define_src) \
			$(VERA_LIBDIR)/plusArgMacros.vri
else
$(testbench_all_obj) :	includes \
			$(_vera_vri_deps) \
			$(VERA_LIBDIR)/seeding.vri \
			$(VERA_LIBDIR)/std_display_defines.vri \
			$(zeroin_define_src) \
			$(VERA_LIBDIR)/plusArgMacros.vri
endif
	$(SPEW_START)
	cd $(VERA_LIBDIR) ;\
	$(VERA_CMP) $(testbench_vera_cmp_switches) $(VERA_DEFS) -I. -f $(testbench_file_list) -dep_check .
	$(SPEW_END)

$(testbench_file_list) : $(depends) Makefile
	$(SPEW_START)
	$(RM) $@ ; \
        echo "$(zeroin_src)" >> $@; \
	echo "$(common_dir)/classes/std_display_class.vr" >> $@; \
	for i in $(actual_libdir_list); do\
	    $(MAKE) -C $$i ; \
	done;
	for i in $(actual_lib_list); do\
	    echo "-f $(VERA_LIBDIR)/$$i.list" >> $@; \
	done;
ifndef FC_NO_PEU_T2
ifeq ($(testbench_combine_vera),1)
	echo "$(VERA_LIBDIR)/Testbench.vr" >> $@
endif
ifndef N2_FC
ifndef N2_IOS
	echo "$(testbench_home_dir)/$(SYS)_top.vr"  >> $@
endif
endif
else
	for i in $(testbench_vera_src); do \
		echo "$(testbench_home_dir)/$$i" >> $@; \
	done
endif
	$(SPEW_END)

$(VERA_LIBDIR)/Testbench.vr: $(filter-out $(SYS)_top.vr, $(testbench_vera_src))
	$(RM) $@
	for i in $^; do \
		echo "#1 \"$(testbench_home_dir)/$$i\"" >> $@; \
		cat $$i >> $@; \
	done
includes: $(testbench_vera_incl_dir)
	-for i in $^; do \
		$(link) $(testbench_home_dir)/$$i/*.vri $(VERA_LIBDIR)/ ; \
	done
	-$(link) $(testbench_home_dir)/include/FIRE_local_access_define.vri $(VERA_LIBDIR)/
	-$(link) $(testbench_home_dir)/include/dmu.vri                   $(VERA_LIBDIR)/
	-$(link) $(testbench_home_dir)/include/ilupeuScenarioDefines.vri $(VERA_LIBDIR)/
	-$(link) $(testbench_home_dir)/include/ilupeu_defines.vri        $(VERA_LIBDIR)/
	-$(link) $(testbench_home_dir)/include/ilupeu_report_macros.vri  $(VERA_LIBDIR)/
	-$(link) $(testbench_home_dir)/include/top_defines.vri           $(VERA_LIBDIR)/
	-$(link) $(testbench_home_dir)/include/ilu_peu.bind.vri          $(VERA_LIBDIR)/
	-$(link) $(testbench_home_dir)/include/ilu_peu.if.vri            $(VERA_LIBDIR)/
ifdef N2_FC
ifndef FC_NO_PEU_T2
	-$(link) $(testbench_home_dir)/../../fc/vera/include/peu_verilog_tasks.vri $(VERA_LIBDIR)/
endif
else
	-$(link) $(testbench_home_dir)/include/peu_verilog_tasks.vri     $(VERA_LIBDIR)/
	-$(link) $(testbench_home_dir)/include/verilog_tasks.vri         $(VERA_LIBDIR)/
endif


# create .vcon file that sims needs to create the .proj file

.PRECIOUS : $(testbench_vcon)
$(testbench_vcon) : $(_vera_vri_deps) $(testbench_vcon:.vcon=.vr)
	$(SPEW_START)
	@$(ECHO) " --> Not rebuilding .vcon file since it requires hand edits. <--"
	#$(RM) $@
	#$(vera) -cmp -verilog -vcon $(testbench_vera_cmp_switches) $(addprefix -I, $(_inc_dirs)) $(@:.vcon=.vr) $(@D)
	$(SPEW_END)

$(VERA_LIBDIR)/$(testbench_vcon) : $(testbench_vcon)
	cp $< $@

common_vera_inc = $(DV_ROOT)/verif/env/common/vera/include

$(VERA_LIBDIR)/%.vri : $(common_vera_inc)/%.vri
	$(link) $<  $(@D)/

$(VERA_LIBDIR)/%.vri : include/%.vri
	$(link) $(testbench_home_dir)/$<  $(@D)/

$(VERA_LIBDIR)/%.vri : csr/%.vri
	$(link) $(testbench_home_dir)/$<  $(@D)/

# Add extra dependency for testbench.vro to make sure it's done
# after the vshell generation.  No rule here - that's still picked up
# from the generic %.vro rule.
$(testbench_vshell:.vshell=.vro) : $(testbench_vshell)

$(VERA_LIBDIR)/%.vro : %.vr  
	$(SPEW_START)
	$(RM) $@
	$(_vera_cmp) $< $(VERA_LIBDIR)
	$(SPEW_END)


#----------------------------------------------------------------
# Run archie and reggie
#----------------------------------------------------------------
# - Can't find fnx reggie directory
reggie_dir        = $(DV_ROOT)/verif/env/fire/runsim/reggie
archie_dir        = $(DV_ROOT)/verif/env/fire/runsim/bin
generated_csr_test_dir = $(DV_ROOT)/verif/diag/vera/ilu_peu/src/generated_csr

archie : csr/ilupeu_archie_conf.pl $(generated_csr_test_dir)/timestamp

$(generated_csr_test_dir)/timestamp:
	$(SPEW_START)
	$(reggie_dir)/archie.pl \
		-v csrtool \
		-c csr/ilupeu_archie_conf.pl \
		-r csr/ilupeu_reggie_conf.pl \
		-b csr/ilupeu_archie_boilerplate.vr \
		-t $(generated_csr_test_dir) \
		-d $(generated_csr_test_dir)
	cd $(generated_csr_test_dir) ; \
	$(archie_dir)/remove_access_methods.pl
	touch $(generated_csr_test_dir)/timestamp
	$(SPEW_END)

csr/CSRCollection.vr :
	$(SPEW_START)
	$(reggie_dir)/reggie.pl \
		-d csrtool \
		-c csr/ilupeu_reggie_conf.pl \
		-i ./include \
		-o csr/CSRCollection.vr
	$(SPEW_END)

#----------------------------------------------------------------
# make report.a
#----------------------------------------------------------------
$(VERA_LIBDIR)/report.a: 
	$(SPEW_START)
	$(MAKE) -C $(DV_ROOT)/verif/env/fnx/clib/report \
                VERA_LIBDIR=$(VERA_LIBDIR)
	$(SPEW_END)

ifndef FC_NO_PEU_T2
#----------------------------------------------------------------
# make denali_pcie.o
#----------------------------------------------------------------
$(VERA_LIBDIR)/denali_pcie.so:
	$(SPEW_START)
	$(MAKE) -C $(DV_ROOT)/verif/env/fnx/clib/DenaliPCIE \
                VERA_LIBDIR=$(VERA_LIBDIR)
	$(SPEW_END)
endif
#----------------------------------------------------------------
# --- the end ---
#----------------------------------------------------------------
