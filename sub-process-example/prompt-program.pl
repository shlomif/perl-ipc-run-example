#!/usr/bin/perl

use strict;
use warnings;

use IO::Handle;

print "Please enter your name:\n";
STDOUT->flush();

my $name = <>;
chomp($name);
print "Hello $name!\n";

