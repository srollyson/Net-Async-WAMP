Net::Async::WAMP
================

### About

**Net::Async::WAMP** is a Perl implementation of the [WebSocket Application
Messaging Protocol][1].

### Building from GitHub Source

The **Net::Async::WAMP** distribution is managed by [**Dist::Zilla**][2]. Many
of the files necessary to build this module are not included in the GitHub
repository since they are built by **Dist::Zilla**. If you'd like to build
**Net::Async::WAMP** from the source code available on GitHub, you'll first
need to grab the author dependencies (assuming you've got [dzil][3] and
[cpanm][4] installed):

    $ dzil authordeps | cpanm

After that, you can build **Net::Async::WAMP** via:

    $ dzil build

You can then test the distribution via:

    $ dzil test

[1]: http://wamp.ws/spec
[2]: http://dzil.org/
[3]: https://metacpan.org/module/dzil
[4]: https://metacpan.org/module/cpanm
