Apple Befunge
=============

_Version 1.1, February 2012, Chris Pressey, Cat's Eye Technologies_

Apple Befunge is a "retrolanguage" for the Apple ][+.  Being written
in Applesoft BASIC, it should also work on an Apple //e or similar
model of 8-bit Apple computer (or, of course, an emulator thereof.)
It is based largely on [Befunge-93](https://catseye.tc/node/Befunge-93.html),
with some Befunge-98-isms, and some instructions and behaviour peculiar to
the Apple 8-bit architecture.

Differences from Befunge-93
---------------------------

The Apple ][+ has no lowercase characters.  In Apple Befunge, `G`, `P`
and `V` do what `g`, `p`, and `v` do in Befunge-93.

The Apple ][+ has no `` ` `` (backtick) symbol.  Instead, the `'`
(apostrophe) symbol is used (it's undefined in Befunge-93.)

The Apple ][+ has no `~` (tilde) symbol.  Instead, the `=` (equals sign)
symbol is used (it's undefined in Befunge-93.)

The Apple ][+ has no `|` (vertical bar) symbol.  Instead, the letter `I`
is used (it's undefined in Befunge-93.)

The Apple ][+'s screen is only 40x24, not 80x25, and until a scrolling
version of the Apple Befunge debugger is made, program size is limited to
the screen size.

Enhancements
------------

Letters `A` through `F` represent values 10 through 15, respectively.

The `;` (semicolon) symbol begins and ends "ignoremode".

If the _x_ argument to `G` is negative, the result is `PEEK(`_y_`)`.

If the _x_ argument to `P` is negative, the result is `POKE `_y_`, `_d_.

The `]` instruction pops an argument _a_ off the stack; the result is
`CALL `_a_.

These three instructions allow a direct interface to the architecture of the
8-bit Apple system on which Apple Befunge is running.

Implementations
---------------

The distribution contains an Apple disk image, formatted with _ESDOS ][_,
in the `disk` subdirectory.  It contains:

* a full visual debugger/editor for Apple Befunge called
  `APPLE BEFUNGE EDITOR`; and
* a handful of Befunge programs which have been converted to Apple Befunge
  format.

The distribution also contains the source code, in ASCII text, for
`APPLE BEFUNGE EDITOR`, in the `src` subdirectory.  It is intended to be
copied-and-pasted into an Apple ][+ emulator.  This process, and the
program itself, have been tested on a recent version of
[AppleWin](http://applewin.berlios.de/).  (And for this reason, and because
I have not yet found a decent Apple ][+ emulator for non-Windows systems,
the source code file has CRLF line terminators.  This is intentional.)

In version 1.0 of the distribution there was also a program called
`APPLE BEFUNGE RUNNER`; its source code was intended to be pasted into
the emulator after that of `APPLE BEFUNGE EDITOR`, acting as a sort of
"diff", adding and deleting lines.  This proved to be a nuisance for
maintaining `APPLE BEFUNGE EDITOR`.  And I think `APPLE BEFUNGE EDITOR`
alone sort of gets the point across.  So in version 1.1, `APPLE BEFUNGE
RUNNER` was abandoned.

License
-------

The source code for `APPLE BEFUNGE EDITOR` is hereby placed, by me, the
author, in the public domain.

Known Bugs and Shortcomings
---------------------------

The coordinate (39,23) can only contain blank space; I have not yet put
in code to draw instructions in that part of the screen, without scrolling
it.  Apparently, I once knew how to do this, but I never bothered; I no
longer know how, but I could probably look it up.

Subtle bug in either `%` (modulo) or `'` (greater than) or `hex.bf` --
not entirely sure which.

A good reorganization of `APPLE BEFUNGE EDITOR`'s source is in order.  The
push and pop subroutines should probably be as near the beginning of the
program as possible.  More constant values should be held in variables, as
well.
