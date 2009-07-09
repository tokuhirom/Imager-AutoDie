use inc::Module::Install;
name 'Imager-AutoDie';
all_from 'lib/Imager/AutoDie.pm';

requires 'Imager';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
build_requires 'Test::Exception';
use_test_base;
auto_include;
WriteAll;
