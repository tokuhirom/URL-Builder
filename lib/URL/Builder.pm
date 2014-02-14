package URL::Builder;
use 5.008005;
use strict;
use warnings;

our $VERSION = "0.02";

use parent qw(Exporter);

use URL::Encode qw(url_encode_utf8);

our @EXPORT = qw(build_url);

sub build_url {
    my %args = @_;

    my $uri;
    if (exists $args{base_uri}) {
        $args{base_uri} =~ s!\/\z!!;
        $uri = $args{base_uri};
    }

    $uri .= $args{path};

    my $query = $args{query};
    if (ref $query eq 'HASH') {
        $uri .= '?';
        while (my ($k, $v) = each %$query) {
            $uri .= $k . '=' . url_encode_utf8($v);
            $uri .= '&';
        }
        $uri =~ s!&\z!!;
    } elsif (ref $query eq 'ARRAY') {
        $uri .= '?';
        my @query = @$query;
        while (@query) {
            $uri .= shift(@query) . '=' . url_encode_utf8(shift(@query));
            $uri .= '&' if @query;
        }
    }
    return $uri;
}

1;
__END__

=encoding utf-8

=head1 NAME

URL::Builder - Tiny URL builder

=head1 SYNOPSIS

    use URL::Builder;

    say build_url(
        base_uri => 'http://api.example.com/',
        path => '/v1/entries',
        query => [
            id => 3
        ]
    );
    # http://api.example.com/v1/entries?id=3

=head1 DESCRIPTION

URL::Builder is really simple URL string building library.

=head1 FUNCTIONS

=over 4

=item build_url(%args)

Build URL from the hash.

Arguments:

=over 4

=item base_uri: Str

=item path: Str

=item query: ArrayRef[Str]|HashRef[Str]

=back

=back

=head1 LICENSE

Copyright (C) Tokuhiro Matsuno.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Tokuhiro Matsuno E<lt>tokuhirom@gmail.comE<gt>

=cut

