#!/usr/bin/perl

use strict;
use warnings;

use IPC::Run qw( start pump finish timeout );

my $in = '';
my $out = '';
my $err = '';

my $h = start [$^X, './prompt-program.pl'], \$in, \$out, \$err, timeout( 10 );

while (not $out =~ /\n/g)
{
    pump($h);
}

$in .= "ZadYree\n";

my ($capture);
while (not (($capture) = $out =~ /\G(\w+) ZadYree!/cg))
{
    pump($h);
}

# print "Out=<<$out>>\n";
print "Got a <<$capture>> Greeting\n";
