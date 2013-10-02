# ABSTRACT: Protocol helper module for Net::Async::WAMP.
package Net::Async::WAMP::Protocol;

use strict;
use warnings;

# TODO: Create message objects for each of the types.
use constant {
    TYPE_ID_WELCOME     => 0,
    TYPE_ID_PREFIX      => 1,
    TYPE_ID_CALL        => 2,
    TYPE_ID_CALLRESULT  => 3,
    TYPE_ID_CALLERROR   => 4,
    TYPE_ID_SUBSCRIBE   => 5,
    TYPE_ID_UNSUBSCRIBE => 6,
    TYPE_ID_PUBLISH     => 7,
    TYPE_ID_EVENT       => 8,
};

1;
