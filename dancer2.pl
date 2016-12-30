
use strict;
use warnings;

use lib 'lib';

use Dancer2;
use Dancer2::Plugin::Auth::Extensible;
use Dancer2::Plugin::Auth::Extensible::Rights;


get '/' => sub {
    require Data::Dumper;
    return "Hello World!<br /><a href='/login'>Login</a><br /><br /><pre>".Data::Dumper::Dumper(logged_in_user);
};

get '/a' => require_role BeerDrinker => sub {
    return 'the a page';
};

get '/c' => require_right ctest => sub {
    return 'the c page';
};

get '/d' => require_right deleteitem => sub {
    return 'the d page';
};

get '/da' => require_right deleteall => sub {
    return 'the da page';
};


dance;