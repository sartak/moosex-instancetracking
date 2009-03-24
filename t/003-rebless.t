#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 2;

do {
    package Tracked;
    use Moose -traits => 'MooseX::InstanceTracking';

    package MoreTracked;
    use Moose;
    extends 'Tracked';
};

my $foo = Tracked->new;
MoreTracked->meta->rebless_instance($foo);

is_deeply([Tracked->meta->instances], []);
is_deeply([MoreTracked->meta->instances], [$foo]);

