#!/usr/bin/env perl
#--[Modules.]-------------------------------------------------------------------
# Core.
use strict;
use warnings;
use Test::More;

# CPAN.
use IO::Async::Loop;
use IO::Async::Test;
use IO::Socket::INET;
use Net::Async::WebSocket::Client;
use Net::Async::WebSocket::Server;

# Distribution.
use Net::Async::WAMP; # TODO: Create a ::Client class.

#--[Test execution.]------------------------------------------------------------
my $loop = IO::Async::Loop->new();
testing_loop($loop);

my $serversock = IO::Socket::INET->new(
    LocalHost => '127.0.0.1',
    Listen    => 1,
) or die "Cannot allocate listening socket - $@";

my @serverframes;
my $acceptedclient;
my $server = Net::Async::WebSocket::Server->new(
    handle    => $serversock,
    on_client => sub {
        my ( undef, $thisclient ) = @_;
        $acceptedclient = $thisclient;
        $thisclient->configure(
            # TODO: Replace the server's on_frame with a WAMP WELCOME message.
            # http://wamp.ws/spec#welcome_message
            on_frame => sub {
                my ( $self, $frame ) = @_;
                push @serverframes, $frame;
            },
        );
    },
);
$loop->add($server);

# TODO: Have two sets of client connection tests: one with WAMP PREFIX messages
# and one without. http://wamp.ws/spec#prefix_message
my @clientframes;
my $client = Net::Async::WebSocket::Client->new(
    on_frame => sub {
        my ( $self, $frame ) = @_;
        push @clientframes, $frame;
    },
);
$loop->add($client);

my $connected;
$client->connect(
    host             => $serversock->sockhost,
    service          => $serversock->sockport,
    url              => 'ws://localhost/test',
    on_connected     => sub { $connected++ },
    on_resolve_error => sub { die "Test failed early - $_[-1]" },
    on_connect_error => sub { die "Test failed early - $_[-1]" },
);

wait_for { $connected };

$client->send_frame('Here is my message');
wait_for { @serverframes };
is_deeply( \@serverframes, ['Here is my message'], 'received @serverframes' );

$acceptedclient->send_frame('Here is my response');
wait_for { @clientframes };
is_deeply( \@clientframes, ['Here is my response'], 'received @clientframes' );

done_testing();
