use strict;
use warnings;
use utf8;
use Test::More;
use URL::Builder;
use Tie::IxHash;

my @CASES = (
    +{
        base_uri => 'http://example.com/',
        path => '/foo/bar',
    } => 'http://example.com/foo/bar',

    +{
        base_uri => 'http://example.com',
        path => '/foo/bar',
    } => 'http://example.com/foo/bar',

    +{
        base_uri => 'http://example.com',
        path => '/foo/bar',
        query => [a => 'b', a => 'c'],
    } => 'http://example.com/foo/bar?a=b&a=c',

    +{
        base_uri => 'http://example.com',
        path => '/foo/bar',
        query => +{a => 'b'},
    } => 'http://example.com/foo/bar?a=b',

    +{
        path => '/foo/bar',
        query => [a => 'b', c => 'd'],
    } => '/foo/bar?a=b&c=d',

    +{
        path => './foo/bar',
        query => [a => 'b', c => 'd'],
    } => './foo/bar?a=b&c=d',
);

while (my ($k, $v) = splice @CASES, 0, 2) {
    is build_url(%$k), $v;
}

done_testing;

