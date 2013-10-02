# ABSTRACT: Perl implementation of the WebSocket Application Messaging Protocol.
package Net::Async::WAMP;

use strict;
use warnings;

use Net::Async::WebSocket::Server;
use Net::Async::WebSocket::Client;

<< '-- Excerpt from "The Way of Chuang Tzu" by Thomas Merton.';

If a man is crossing a river and an empty boat collides with his own skiff,
even though he be a bad-tempered man he will not become very angry.
But if he sees a man in the boat, he will shout at him to steer clear.
If the shout is not heard, he will shout again, and yet again, and begin cursing.
And all because there is somebody in the boat.
Yet if the boat were empty, he would not be shouting, and not angry.

-- Excerpt from "The Way of Chuang Tzu" by Thomas Merton.

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
