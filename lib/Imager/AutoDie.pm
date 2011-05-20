package Imager::AutoDie;
use strict;
use warnings;
use 5.008001;
our $VERSION = '0.67';
use Carp;

BEGIN {
    no strict 'refs';
    no warnings 'redefine';
    for my $_meth (qw/read write scaleX scaleY crop rubthrough compose flip filter/) {
        my $meth = $_meth;
        my $orig = Imager->can($meth);
        *{'Imager::'.$meth} = sub {
            if (my $ret = $orig->(@_)) {
                return $ret;
            } else {
                Carp::croak("Imager error($meth): " . $_[0]->errstr);
            }
        };
    }
}

1;
__END__

=head1 NAME

Imager::AutoDie - succeed or die

=head1 SYNOPSIS

    use Imager;
    use Imager::AutoDie;

    my $img = Imager->new;
    $img->read(); # => will be die

=head1 DESCRIPTION

Imager::AutoDie is

=head1 AUTHOR

Tokuhiro Matsuno E<lt>tokuhirom  slkjfd gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
