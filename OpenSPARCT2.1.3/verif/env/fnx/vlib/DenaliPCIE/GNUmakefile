# *************************************************************************
#
#
#  Original Author:  
#  Creation Date  :  
#
#  File name      :  GNUmakefile                                         
#  Description    :  makefile for building Vera lib components
#
#                    Users of this lib should call make using this
#                    makefile to build the exportable objects.  This makefile
#                    may use make variables exported from superior makes
#                    processes.
#
# *************************************************************************

lib			= DenaliPCIE

# Root Denali Vera Directory
#denali_dir   := $(shell denali_root)
#denali_dir = /net/cadcombo1/export/home3/corpcad/tools/commercial/denali/pcie,v1.0_23
denali_dir = $(DENALI)
denali_vera_dir = $(denali_dir)/ddvapi/vera

include_denaliPcieIncludes_vrh	= $(VERA_LIBDIR)/denaliPcieIncludes.vrh
include_denaliPcieTypes_vrh     = $(VERA_LIBDIR)/denaliPcieTypes.vrh
include_denaliPcieImports_vrh   = $(VERA_LIBDIR)/denaliPcieImports.vrh
include_denaliPcieErrTable_vrh  = $(VERA_LIBDIR)/denaliPcieErrTable.vrh

denali_includes = $(include_denaliPcieIncludes_vrh) $(include_denaliPcieTypes_vrh)  \
		  $(include_denaliPcieImports_vrh) $(include_denaliPcieErrTable_vrh)

denaliPcie_vr   = $(denali_vera_dir)/denaliPcie.vr

$(VERA_LIBDIR)/$(lib).list : $(denali_includes)
	$(SPEW_START)
	$(RM) $@
	echo "$(denaliPcie_vr)" > $@
	$(link) $(shell pwd)/include/* $(VERA_LIBDIR)/
	$(SPEW_END)

$(VERA_LIBDIR)/%.vrh : $(denali_vera_dir)/%.vrh
	$(link) $< $@

include $(DV_ROOT)/verif/env/fnx/runsim/makefiles/Makefile.defs

