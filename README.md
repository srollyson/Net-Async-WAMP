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
need to grab the author dependencies (assuming you've got [**dzil**][3] and
[**cpanm**][4] installed):

    $ dzil authordeps | cpanm

After that, you can build **Net::Async::WAMP** via:

    $ dzil build

You can then test the distribution via:

    $ dzil test

### License

**Net::Async::WAMP** is Copyright © 2013 by Stephen Rollyson.

**Net::Async::WAMP** is free software, licensed under the [MIT license][5]:

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

[1]: http://wamp.ws/spec
[2]: http://dzil.org/
[3]: https://metacpan.org/module/dzil
[4]: https://metacpan.org/module/cpanm
[5]: http://opensource.org/licenses/MIT
