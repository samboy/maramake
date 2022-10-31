# About this fork

This is a fork of https://github.com/rmyorston/pdpmake with
a one line change where, even in strict POSIX mode, we allow
targets to have the `/` character.  This is a non-POSIX extension
that the POSIX make spec allows.  In addition, [the GPL testsuite
had been removed](https://github.com/rmyorston/pdpmake/issues/20); this
code is 100% public domain.

In addition, `maramake` has support for `maramake --version` (or
`make --version` if renamed `make`); this allows one to know which
version of maramake one is using.

This is the official implementation of `make` to use to compile
MaraDNS; note that GNU make works perfectly fine too.

### Public domain POSIX make

This is an implementation of [POSIX make](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/make.html).

It comes with its own makefile, naturally, and should build on most
modernish Unix-style systems.  (Command line options may not work
properly due to differences in how `getopt(3)` is reset.  Adjust
`GETOPT_RESET()` in make.h for your platform, if necessary.)

Should one not have make, the script `compile.sh` will compile the 
program with the name `maramake`.  

The default configuration enables extensions:  some from a future POSIX
standard and some that are non-POSIX.  Generally these extensions are
compatible with GNU make:

 - double-colon rules
 - `-include` to ignore missing include files
 - include files can be created if required
 - `ifdef`/`ifndef`/`else`/`endif` conditionals
 - `lib.a(mem1.o mem2.o...)` syntax for archive members
 - `:=`/`::=`/`:::=`/`+=`/`?=`/`!=` macro assignments
 - macro expansions can be nested
 - chained inference rules
 - `*`/`?`/`[]` wildcards for filenames in target rules
 - `$(SRC:%.c=%.o)` pattern macro expansions
 - special handling of `MAKE` macro
 - `$^` and `$+` internal macros
 - skip duplicate entries in `$^` and `$?`
 - `.PHONY` special target
 - `-C directory` and `-j maxjobs` command line options

When extensions are enabled adding the `.POSIX` target to your makefile
will disable them.  Other versions of make tend to allow extensions even
in POSIX mode.

Setting the environment variable `PDPMAKE_POSIXLY_CORRECT` (its value
doesn't matter) or giving the `--posix` option as the first on the
command line also turn off extensions.
