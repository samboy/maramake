# About this fork

This is a fork of https://github.com/rmyorston/pdpmake 

`maramake` has support for `maramake --version` (or `make --version` 
if renamed `make`); this allows one to know which version of maramake 
one is using.

`ENABLE_FEATURE_MAKE_EXTENSIONS` has been set to 0 in `make.h` so
that this is a mostly POSIX implementation of make.

`ENABLE_FEATURE_MAKE_POSIX_202X` has been set to 1 in `make.h` so
that maramake can have the characters `/` and `-` in makefile
targets.  See https://github.com/rmyorston/pdpmake/issues/17 for
discussion.

If one does not have make, it is possible to compile this with 
the included `compile.sh` script.

`maramake` uses `cc` as the default value of `CC` instead of the
POSIX-specified `c99` value; as it turns out MaraDNS won’t compile with
`c99` because POSIX and socket system calls which MaraDNS needs are not
present in the ISO C standard.

This is the official implementation of `make` to use to compile
MaraDNS; note that GNU make works perfectly fine too.

The repo is available at 
[GitHub](https://github.com/samboy/maramake) and
[Codeberg](https://codeberg.org/samboy/maramake), and has a 
[web page](https://maradns.samiam.org/maramake).

The original README (adapted for maramake) follows:

### Public domain POSIX make

This is an implementation of [POSIX make](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/make.html).

It comes with its own makefile, naturally, and should build on most
modernish Unix-style systems.  (Command line options may not work
properly due to differences in how `getopt(3)` is reset.  Adjust
`GETOPT_RESET()` in make.h for your platform, if necessary.)

Should one not have make, the script `compile.sh` will compile the 
program with the name `maramake`.  

It is possible to enable extensions (they are disabled by default):  some
from a future POSIX standard and some that are non-POSIX.  Generally these
extensions are compatible with GNU make:

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

If extensions are enabled adding the `.POSIX` target to your makefile
will disable them.  Other versions of make tend to allow extensions even
in POSIX mode.

Setting the environment variable `PDPMAKE_POSIXLY_CORRECT` (its value
doesn't matter) or giving the `--posix` option as the first on the
command line also turn off extensions.
