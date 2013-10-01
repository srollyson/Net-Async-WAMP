#!/usr/bin/env perl
#--[Modules.]-------------------------------------------------------------------
# Core.
use strict;
use warnings;
use Test::More;

#--[Test execution.]------------------------------------------------------------
use_ok('Net::Async::WAMP');
use_ok('Net::Async::WAMP::Client');
use_ok('Net::Async::WAMP::Server');

done_testing();
