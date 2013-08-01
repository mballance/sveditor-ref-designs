# *************************************************************************
#
#
#  Creation Date  :  Mar 2000
#
#  File name      :  GNUmakefile                                         
#  Description    :  makefile for building bfm components
#
#                    Users of this bfm should call this call make using this
#                    makefile to build the exportable objects.  This makefile
#                    may use make variables exported from superior makes
#                    processes.
#
# *************************************************************************

#--------------------------------------------------------------------
# Use `lib' to define the name of the library are we building.
# the exported library will be called $(lib).libvrl
#--------------------------------------------------------------------
lib			= report

#--------------------------------------------------------------------
# Use `lib_list' to specify the names of libraries on which this library
# depends.  Be careful that these other libraries don't in turn depend on
# this one.
#--------------------------------------------------------------------
lib_list		= 

#--------------------------------------------------------------------
# Use `lib_report_vera_src' to define the list of vera source files
# which compose this library.
#--------------------------------------------------------------------
lib_report_vera_src		= report_info.vr cReport.vr

#--------------------------------------------------------------------
# Use `lib_additional_vera_cmp_args' to define additional vera compilation
# arguments.
#--------------------------------------------------------------------
lib_additional_vera_cmp_args = 

#====================================================================
#======= you probably don't have to change anything below ===========
#====================================================================
# Get all the usual targets and dependencies.
#====================================================================
include $(DV_ROOT)/verif/env/fnx/runsim/makefiles/Makefile.libtop
#====================================================================
