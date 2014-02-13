# NAME

URI::Builder - Tiny URL builder

# SYNOPSIS

    use URI::Builder;

    say build_uri(
        base_uri => 'http://api.example.com/',
        path => '/v1/entries',
        query => [
            id => 3
        ]
    );
    # http://api.example.com/v1/entries?id=3

# DESCRIPTION

URI::Builder is really simple URI string building library.

# FUNCTIONS

- build\_uri(%args)

    Build URI from the hash.

    Arguments:

    - base\_uri: Str
    - path: Str
    - query: ArrayRef\[Str\]|HashRef\[Str\]

# LICENSE

Copyright (C) Tokuhiro Matsuno.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Tokuhiro Matsuno <tokuhirom@gmail.com>
