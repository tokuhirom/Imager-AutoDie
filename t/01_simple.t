use strict;
use warnings;
use Test::More tests => 1;
use Test::Exception;
use Imager;
use Imager::AutoDie;

my $img = Imager->new();
dies_ok { $img->read() }, qr/Imager error/;

