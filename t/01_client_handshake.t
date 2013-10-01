#!/usr/bin/env perl
#--[Modules.]-------------------------------------------------------------------
# Core.
use strict;
use warnings;
use Test::More;

# CPAN.
use Data::UUID;
use IO::Async::Loop;
use IO::Async::Test;
use IO::Socket::INET;
use JSON;
use Net::Async::WebSocket::Client;
use Net::Async::WebSocket::Server;

# Distribution.
use Net::Async::WAMP::Client;

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
            on_frame => sub {
                my ( $self, $frame ) = @_;
                push @serverframes, $frame;
            },
        );
    },
);
$loop->add($server);

# TODO: Replace Net::Async::WebSocket::Client with Net::Async::WAMP::Client.
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

# Send WAMP WELCOME message from server to Net::Async::WAMP::Client.
# TODO: Have Net::Async::WAMP::Server or some protocol module create the
# welcome message for us.
my $welcome_msg_uuid = Data::UUID->new()->create_str();
my $welcome_msg_data = [ 0, $welcome_msg_uuid, 1, '01_client_handshake' ];
my $welcome_msg_json = encode_json($welcome_msg_data);
$acceptedclient->send_frame($welcome_msg_json);
wait_for { @clientframes };
is_deeply( \@clientframes, [$welcome_msg_json],
    'received WAMP WELCOME message' );

TODO: {
    local $TODO = 'Need to implement client handshake.';
}

# $client->send_frame('Here is my message');
# wait_for { @serverframes };
# is_deeply( \@serverframes, ['Here is my message'], 'received @serverframes' );

done_testing();
