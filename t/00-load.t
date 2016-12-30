#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Dancer2::Plugin::Auth::Extensible::Rights' ) || print "Bail out!\n";
}

diag( "Testing Dancer2::Plugin::Auth::Extensible::Rights $Dancer2::Plugin::Auth::Extensible::Rights::VERSION, Perl $], $^X" );
