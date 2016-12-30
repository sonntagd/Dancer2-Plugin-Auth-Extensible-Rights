#!perl -T
use strict;
use warnings;
use Plack::Test;
use Test::More import => ['!pass'];
use HTTP::Request::Common qw(GET POST);
use lib '.';

#eval { require Auth::Extensible };
#if ($@) {
#    plan skip_all => 'Auth::Extensible required to run these tests';
#}
#
#eval { require Auth::Extensible::Rights };
#if ($@) {
#    plan skip_all => 'Auth::Extensible::Rights required to run these tests';
#}

use t::lib::TestApp;
my $app = t::lib::TestApp->to_app;
use DDP;
p $app;
is( ref $app, "CODE", "Got a code ref" );
test_psgi $app, sub {
    my $cb = shift;

    {
        my $res = $cb->( POST '/login', {} );
        is $res->content, 1, 'login fires';
    }
    {
        my $res = $cb->( GET '/createitem' );
        is $res->content, 1, 'login fires';
    }
    {
        my $res = $cb->( GET '/deleteitem' );
        is $res->content, 1, 'login fires';
    }
};

done_testing();

__END__
