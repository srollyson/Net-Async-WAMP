#!/usr/bin/env perl
#--[Modules.]-------------------------------------------------------------------
# Core.
use strict;
use warnings;
use Test::More;

# CPAN.
use IO::Async::Loop;
use IO::Async::OS;
use IO::Async::Stream;
use IO::Async::Test;
use Net::Async::WebSocket::Client;
use Protocol::WebSocket::Handshake::Server;

# Distribution.
use Net::Async::WAMP;

#--[Test execution.]------------------------------------------------------------
# TODO: This test is a copy of Net::Async::WebSocket's t/01client.t. Rework it
# to be a test of Net::Async::WAMP.
my $loop = IO::Async::Loop->new();
testing_loop($loop);

my ( $serversock, $clientsock ) = IO::Async::OS->socketpair
  or die "Cannot socketpair - $!";

my @frames;

my $client = Net::Async::WebSocket::Client->new(
    on_frame => sub {
        my ( $self, $frame ) = @_;
        push @frames, $frame;
    },
);

ok( defined $client, '$client defined' );
isa_ok( $client, "Net::Async::WebSocket::Client", '$client' );

$loop->add($client);

my $connected;
$client->connect(
    transport    => IO::Async::Stream->new( handle => $clientsock ),
    url          => "ws://localhost/test",
    on_connected => sub                            { $connected++ },
);

my $h = Protocol::WebSocket::Handshake::Server->new;

my $stream = "";
wait_for_stream { $h->parse($stream); $stream = ""; $h->is_done }
$serversock => $stream;

$serversock->write( $h->to_string );

wait_for { $connected };

$serversock->write(
    Protocol::WebSocket::Frame->new("Here is my message")->to_bytes );

wait_for { @frames };

is_deeply( \@frames, ["Here is my message"], 'received @frames' );

undef @frames;

$client->send_frame("Here is my response");

my $fb = Protocol::WebSocket::Frame->new;
$stream = "";
my $frame;
wait_for_stream { $fb->append($stream); $stream = ""; $frame = $fb->next }
$serversock => $stream;

is( $frame, "Here is my response", 'responded $frame' );

done_testing();
