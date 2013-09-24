# ABSTRACT: Perl implementation of the WebSocket Application Messaging Protocol.
use strict;
use warnings;

package Net::Async::WAMP;
use Object::Tiny qw{};
use Net::Async::WebSocket::Server;
use Net::Async::WebSocket::Client;

1;

=head1 SYNOPSIS

  my $response = do_a_thing($request)->get();
  my ($resp1, $resp2) = Future->wait_all(
                            do_a_thing($request1),
                            do_a_thing($request2) )->get();

=method example_method

TODO: Fill this out.

=method another_example_method

TODO: Fill this out.

=head1 SEE ALSO

=cut
