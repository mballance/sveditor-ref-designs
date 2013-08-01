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

#--------------------------------------------------------------------
# Use `lib' to define the name of the library we are building.
# the exported library will be called $(lib).libvrl
#--------------------------------------------------------------------
lib			= FNXPCIEXactor

#--------------------------------------------------------------------
# Compile this library as a concatenated Vera file.
#--------------------------------------------------------------------
lib_FNXPCIEXactor_combine_vera = 1

#--------------------------------------------------------------------
# Use `lib_list' to specify the names of libraries on which this library
# depends.  Be careful that these other libraries don't in turn depend on
# this one.
#--------------------------------------------------------------------
lib_list	= CTSupportClasses XactorFmwork XactorComponents \
		  DenaliPCIE FNXBasicUtilities
#--------------------------------------------------------------------
# Use `lib_FNXPCIEXactor_vera_src' to define the list of vera source files
# which compose this library.
#--------------------------------------------------------------------
lib_FNXPCIEXactor_vera_src	=  FNXPCIEXactorPktCbRecord.vr \
				   FNXPCIEXactorRegCbRecord.vr \
				   FNXPCIEXactorDenaliDevice.vr \
				   FNXPCIEXactorBasePacket.vr \
				   FNXPCIEXactorBaseUserData.vr \
				   FNXPCIEXactorUtilities.vr \
				   FNXPCIEXactorPacket.vr \
				   FNXPCIEXactorUserData.vr \
				   FNXPCIEXactorAssertCovDatabase.vr \
				   FNXPCIEXactorStatsDatabase.vr \
				   FNXPCIEXactorReplayMonitor.vr \
				   FNXPCIEXactorSignalInterface.vr \
				   FNXPCIEXactorManager.vr \
				   FNXPCIEXactorFCEngine.vr \
				   FNXPCIEXactorBuilder.vr \
				   FNXPCIEXactorTransaction.vr

#--------------------------------------------------------------------
# Use `lib_additional_vera_cmp_args' to define additional vera compilation
# arguments.
#--------------------------------------------------------------------
lib_additional_vera_cmp_args =

#--------------------------------------------------------------------
# Use `lib_additional_deps' to define additional libvrl dependencies
#--------------------------------------------------------------------
denali_rev = $(proj_dir)/.master_wrapper/denali.rev
lib_additional_deps = $(denali_rev)

#--------------------------------------------------------------------
# 
#--------------------------------------------------------------------
doit : $(VERA_LIBDIR)/$(lib).list \
       $(VERA_LIBDIR)/denali_pcie_device.v

$(VERA_LIBDIR)/denali_pcie_device.v : sim/denali_pcie_device.v
	rm -f $@
	sed -e "s|DV_ROOT/|$(DV_ROOT)/|" sim/denali_pcie_device.v > $@

#====================================================================
#======= you probably don't have to change anything below ===========
#====================================================================
# Get all the usual targets and dependencies.
#--------------------------------------------------------------------
include $(DV_ROOT)/verif/env/fnx/runsim/makefiles/Makefile.libtop
#====================================================================


#--------------------------- The End --------------------------------
