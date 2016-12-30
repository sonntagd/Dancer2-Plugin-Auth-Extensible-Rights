package t::lib::TestApp;

no warnings 'uninitialized';

use Dancer2;
use Dancer2::Plugin::Auth::Extensible::Rights;

set plugins => {
    'Auth::Extensible' => {
        realms => {
            config1 => {
                provider => 'Config',
                users    => [
                    {
                        user  => 'dave',
                        pass  => 'ss',
                        roles => [ 'Developer', 'Manager', 'BeerDrinker' ]
                    },
                    {
                        user  => 'bob',
                        pass  => 'ass',
                        roles => ['Tester']
                    }
                ],
            },
        },
    },
    'Auth::Extensible::Rights' => {
        rights => {
            createitem => [ 'BeerDrinker', 'Tester', 'Manager' ],
            deleteitem => [ 'BeerDrinker', [ 'Manager', 'Tester' ] ],
            deleteall  => 'Manager',
            ctest      => {
                all => 1
            },
        },
    },
};

set logger => 'capture';
set log    => 'debug';

set show_errors => 1;

get '/createitem' => require_right createitem => sub { return 1 };
get '/deleteitem' => require_right deleteitem => sub { return 1 };

1;
