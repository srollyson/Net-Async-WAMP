Net::Async::WAMP
================

### About

**Net::Async::WAMP** is a Perl implementation of the [WebSocket Application
Messaging Protocol][1]. It's currently in pre-alpha development and as such is
only available from GitHub. Once there's a somewhat usable implementation I
plan on publishing an alpha release on [CPAN][2].

The implementation of **Net::Async::WAMP** will likely rely on [Paul Evan][3]'s
[**Net::Async::WebSocket**][4] module to provide the WebSockets transport layer
and [**Future**][5] module to provide a RPC function calling mechanism.

### Building from GitHub Source

The **Net::Async::WAMP** distribution is managed by [**Dist::Zilla**][6]. Many
of the files necessary to build this module are not included in the GitHub
repository since they are built by **Dist::Zilla**. If you'd like to build
**Net::Async::WAMP** from the source code available on GitHub, you'll first
need to grab the author dependencies (assuming you've got [**dzil**][7] and
[**cpanm**][8] installed):

    $ dzil authordeps | cpanm

After that, you can build **Net::Async::WAMP** via:

    $ dzil build

You can also test the distribution via:

    $ dzil test

### Additional Tests

Code coverage metrics are available using
[**Dist::Zilla::App::Command::cover**][9]. Just run:

    $ dzil cover

Once `dzil cover` has been run, you will find a **cover_db** folder containing
the code coverage metrics in the temporary module build directory (e.g.
**.build/2OXAYzqh1_/cover_db**).

### License

**Net::Async::WAMP** is Copyright © 2013 by Stephen Rollyson.

**Net::Async::WAMP** is free software, licensed under the [MIT license][10]:

> Permission is hereby granted, free of charge, to any person obtaining a copy
> of this software and associated documentation files (the "Software"), to deal
> in the Software without restriction, including without limitation the rights
> to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> copies of the Software, and to permit persons to whom the Software is
> furnished to do so, subject to the following conditions:
> 
> The above copyright notice and this permission notice shall be included in
> all copies or substantial portions of the Software.
> 
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> SOFTWARE.

[1]:  http://wamp.ws/spec
[2]:  https://metacpan.org/module/Net::Async::WAMP
[3]:  http://www.leonerd.org.uk/
[4]:  https://metacpan.org/module/Net::Async::WebSocket
[5]:  https://metacpan.org/module/Future
[6]:  http://dzil.org/
[7]:  https://metacpan.org/module/dzil
[8]:  https://metacpan.org/module/cpanm
[9]:  https://metacpan.org/module/Dist::Zilla::App::Command::cover
[10]: http://opensource.org/licenses/MIT
