package URI::Builder;
use 5.008005;
use strict;
use warnings;

our $VERSION = "0.01";

use parent qw(Exporter);

use URL::Encode qw(url_encode);

our @EXPORT = qw(build_uri);

sub build_uri {
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
            $uri .= $k . '=' . url_encode($v);
            $uri .= '&';
        }
        $uri =~ s!&\z!!;
    } elsif (ref $query eq 'ARRAY') {
        $uri .= '?';
        my @query = @$query;
        while (@query) {
            $uri .= shift(@query) . '=' . url_encode(shift(@query));
            $uri .= '&' if @query;
        }
    }
    return $uri;
}

1;
__END__

=encoding utf-8

=head1 NAME

URI::Builder - It's new $module

=head1 SYNOPSIS

    use URI::Builder;

=head1 DESCRIPTION

URI::Builder is ...

=head1 LICENSE

Copyright (C) Tokuhiro Matsuno.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Tokuhiro Matsuno E<lt>tokuhirom@gmail.comE<gt>

=cut

