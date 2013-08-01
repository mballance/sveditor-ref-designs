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
lib			= XactorFmwork

#--------------------------------------------------------------------
# Use `lib_list' to specify the names of libraries on which this library
# depends.  Be careful that these other libraries don't in turn depend on
# this one.
#--------------------------------------------------------------------
lib_list		= report CTSupportClasses

#--------------------------------------------------------------------
# Use `lib_XactorFmwork_vera_src' to define the list of vera source files
# which compose this library.
#--------------------------------------------------------------------
lib_XactorFmwork_vera_src		= XactorBasePacket.vr \
					  XactorBaseExpectDataStruct.vr \
					  XactorBaseSignalInterface.vr \
					  XactorBaseManager.vr \
					  XactorBaseBuilder.vr \
					  XactorBaseTransaction.vr

#--------------------------------------------------------------------
# Use `lib_additional_vera_cmp_args' to define additional vera compilation
# arguments.
#--------------------------------------------------------------------
lib_additional_vera_cmp_args = 


#====================================================================
#======= you probably don't have to change anything below ===========
#====================================================================
# Get all the usual targets and dependencies.
#--------------------------------------------------------------------
include $(DV_ROOT)/verif/env/fnx/runsim/makefiles/Makefile.libtop
#====================================================================

#--------------------------- The End --------------------------------
