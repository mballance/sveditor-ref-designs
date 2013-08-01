# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T2 Processor File: make_lib_depends3.pl
# Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
# 4150 Network Circle, Santa Clara, California 95054, U.S.A.
#
# * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
# For the avoidance of doubt, and except that if any non-GPL license 
# choice is available it will apply instead, Sun elects to use only 
# the General Public License version 2 (GPLv2) at this time for any 
# software where a choice of GPL license versions is made 
# available with the language indicating that GPLv2 or any later version 
# may be used, or where a choice of which version of the GPL is applied is 
# otherwise unspecified. 
#
# Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
# CA 95054 USA or visit www.sun.com if you need additional information or 
# have any questions. 
# 
# ========== Copyright Header End ============================================


use File::Basename;
use FileHandle;
use Getopt::Long;

sub usage () {
     print STDERR <<USAGE;

Usage: $0 -libn libname -current_dir cwd -o output_file -VERA_LIBDIR object_dir

USAGE
    exit(1);
}

#----------------------------------------------------------------
# Protos, globals
@libnames = (); # list of seed libraries.  find all the libs these depend on.
@libpaths = (); # Array returned from GetVlibs script setting  list of paths to search for the libraries (in order)
%paths = (); # directory part of actual path to library, per library, hashed by libname
%deps = ();  # libvrl dependencies per library hashed by libname
%srcs = ();  # source and obj dependencies per library, hashed by libname
%cvera = (); # combine_vera flag per library, hashed by libname
$depth = 0;  # for debug of traverse code

#----------------------------------------------------------------
usage if (! GetOptions("help",
					   "o=s",
					   "libn=s@",       \@libnames,
					   "current_dir=s", \$current_directory,
					   "VERA_LIBDIR=s", \$VERA_LIBDIR,
					   "debug",         \$debug,
					   "no_peu",        \$NO_PEU,
		      )
	 );
usage if (defined $opt_help);
usage if (not defined $opt_o);
usage if (not defined $current_directory);
usage if (not defined $VERA_LIBDIR);

#----------------------------------------------------------------

if (defined $debug) {
    print "libnames is: @libnames\n" ;
    print "remainder is: @ARGV\n" ;
}

#----------------------------------------------------------------

# added this...

main();


sub get_vlib_paths {
  my($cwd) = @_;
  my(@result);
  my $dv_root = $ENV{DV_ROOT};

  # Our search path is currently two locations:
  # The testbench directory itself, and
  # "$DV_ROOT/verif/env/fnx/vlib", in that order.
  push(@result, $cwd);
  push(@result, "$dv_root/verif/env/fnx/vlib");

  return @result;
}


# Start here
sub main {
    my %seen = ();
    my %udeps = (); # unique dependency list
    my $out_fh = new FileHandle;

    # If there are no libnames provided, we are likely in a non-vlib,
    # non-testbench place.  Don't bother to check.  Make an output file
    # though since gmake will try to include it.
    if (scalar(@libnames) != 0) {
	# Call subroutine to get list of vlib paths to
	# search for library includes.
	@libpaths = get_vlib_paths($current_directory);
	print "libpaths are: @libpaths\n" if (defined $debug);
    }

    # Open the output file only if everything is cool so far.
    $out_fh->open("> $opt_o") or die basename($0), ": Cannot open $opt_o: $!\n";

    # Parse all the lib config files
    foreach $libname (@libnames) {
	traverse($libname);
    }

    # Uniquify the libvrl dependency list
    foreach $libname (keys %paths) {
	%seen = ();
	@{$udeps{$libname}} = grep { ! $seen{$_} ++ } @{$deps{$libname}}
    }

    # tell xemacs to colorize
    print $out_fh "# -*-Makefile-*-\n";

    # Make a macro to define the actual complete list of .libvrls
    print $out_fh "actual_lib_list = \\\n";
    foreach $libname (keys %paths) {
	print $out_fh "\t$libname \\\n";
    }
    print $out_fh "\n#" . "-"x40 . "\n";     # print a separator


    # Make a macro to define the actual complete list of lib dirs
    print $out_fh "actual_libdir_list = \\\n";
    foreach $libname (keys %paths) {
	print $out_fh "\t$paths{$libname} \\\n";
    }
    print $out_fh "\n#" . "-"x40 . "\n";     # print a separator

    $out_fh->close();
    # Done.
}

# Walk the dependency tree for the libs on the command line.  Gather
# dependencies for all the dependent libs on the way.  Return a list of
# library names on which $libname depends.
sub traverse {
    my $libname = shift;
# commenting these out because they are PEU dependent
	  next if ($libname eq "DenaliPCIE") && (defined $NO_PEU);
	  next if ($libname eq "FNXPCIEXactor") && (defined $NO_PEU);
#if FC_NO_PEU_T2 == 1
#	next if $libname eq "DenaliPCIE";
#	next if $libname eq "FNXPCIEXactor";
#endif
    my @tdeps = ();
    $depth++;
    #print "traverse($depth): " . "  "x$depth . "traversing $libname\n";

    # Find the path to the lib
    foreach $libpath (@libpaths) {
	last if ($paths{$libname}); # skip if we've been here already
	$configpath = "$libpath/$libname/GNUmakefile" ;
	next unless ( -e $configpath);
	# get the seed dependencies
	open(LIB_FILE, "$configpath") or die "Can't open lib config file $configpath : $!\n";
	@{$deps{$libname}} = get_libvrl_deps(\*LIB_FILE, $libname, "lib_list");
	@{$srcs{$libname}} = get_libsrc_deps(\*LIB_FILE, $libname, "lib_" . $libname . "_vera_src");
	get_combine_vera( \*LIB_FILE, $libname );
	#print "traverse($depth): " . "  "x$depth . "$libname seed: @{$deps{$libname}}\n" ;
	close(LIB_FILE);
	# get the dependencies for the dependencies ...
	foreach $rlibname (@{$deps{$libname}}) {
	    push @tdeps, traverse($rlibname);
	}
	push @{$deps{$libname}}, @tdeps;

	#print "traverse($depth): " . "  "x$depth . "$libname depends on: @{$deps{$libname}}\n";

	# remember the path to the lib.  this also serves as a flag to
	# indicate the lib has been traversed already.
	$paths{$libname} = "$libpath/$libname" ;

	# stop looking after first lib with the right name
	last ;
    }
    $depth--;
    @{$deps{$libname}} ;
}


sub get_libvrl_deps {
    my $lib_file = shift;
    my $libname = shift;
    my $matcher = shift;
    get_lib_list($lib_file, $libname, $matcher);
}

sub get_libsrc_deps {
    my $lib_file = shift;
    my $libname = shift;
    my $matcher = shift;
    get_lib_list($lib_file, $libname, $matcher, fix_addprefix);

}


# Fixup $(addprefix foo, bar) in makefile.  This does *not* support use of
# make macros in the arguments to addprefix.
sub fix_addprefix {
    my $line = shift;
    my $prefix = "";

    # If the line is written with addprefix, do the addprefix.
    if ($$line =~  /\$\(\s*addprefix/) {

	# Delete the addprefix function name, retrieve the prefix string
	# this does *not* support variable names for the prefix.
	$$line =~ s!\$\(\s*addprefix\s+(\w+/?)\s*,\s*!! ;
	$prefix = $1;

	# Delete the trailing close paren
	$$line =~ s/\)// ;

#	print "Line is: \`$$line\`\n";

	# Do the addprefix using map and make it back into a single string
	$$line = join (" ", map "$prefix$_", split (/\s+/, $$line));
    }
}


# Look for the string in $matcher.  Return the list of things the matched
# pattern was set equal to.  Call $fixer with the RHS string if $fixer is
# defined.
sub get_lib_list {
    my $lib_file = shift;
    my $libname = shift;
    my $matcher = shift;
    my $fixer = shift;
    my @list = ();

    seek $lib_file, 0, 0;
    while ($line=<$lib_file>) {
	chomp($line);
	if ($line =~ s/\\$//) {
	    $line .= <$lib_file>;
	    redo;
	}
	next if $line =~ /^\s*$/ ;
	next if $line =~ /^\s*#/ ;

	# find the lib list
	if ($line =~ /^\s*$matcher\s*=\s*(.*$)/ ) {
	    $foo = $1;
	    if (defined $fixer) {
		&$fixer(\$foo);
	    }
	    @list = split (/\s+/, $foo) ;
	    last;
	}
    }
	#print "get_lib_list: liblist is: @list\n" ;

	@list ;
}

sub get_combine_vera {
    my $lib_file = shift;
    my $libname = shift;
    my $matcher;

    $matcher = "lib_" . "$libname" . "_combine_vera";
    $cvera{$libname} = 0;

    seek $lib_file, 0, 0;
    while ($line=<$lib_file>) {
	chomp($line);
	if ($line =~ s/\\$//) {
	    $line .= <$lib_file>;
	    redo;
	}
	next if $line =~ /^\s*$/ ;
	next if $line =~ /^\s*#/ ;
	
	# find the lib_$(lib_name)_combine_vera
	if ($line =~ /^\s*$matcher\s*=\s*1.*$/ ) {
	    $cvera{$libname} = 1;
	}
    }
}
